; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 12m 49s; total estimated time: 18m 38s
; total layer number: 63
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
M73 P0 R18
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
M73 P23 R14
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

M73 P24 R14
G1 X70 F9000
M73 P25 R13
G1 X76 F15000
M73 P26 R13
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
M73 P27 R13
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
    G29 A X113.289 Y100.511 I52.9229 J53.5859
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
M73 P28 R13
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
; layer num/total_layer_count: 1/63
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
G1 X127.303 Y133.316 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
G1 X126.548 Y133.509 E.02901
G3 X124.6 Y129.975 I15.808 J-11.021 E.15056
G1 X124.6 Y101.466 E1.06186
G1 X124.395 Y101.261 E.0108
G1 X118.105 Y101.261 E.23428
G1 X117.9 Y101.466 E.0108
G1 X117.9 Y129.697 E1.05148
G2 X114.796 Y130.048 I-.808 J6.75 E.11739
M73 P29 R13
G1 X114.795 Y98.74 E1.1661
G1 X127.303 Y98.74 E.46588
G1 X127.303 Y133.247 E1.28527
G1 X126.892 Y132.996 F30000
G1 F3000
G1 X126.723 Y133.04 E.00649
G3 X125.011 Y129.892 I13.226 J-9.23 E.13373
G1 X125.011 Y101.296 E1.0651
G1 X124.565 Y100.85 E.02349
G1 X117.935 Y100.85 E.24697
G1 X117.489 Y101.296 E.02349
G1 X117.489 Y129.285 E1.0425
M73 P30 R13
G2 X115.208 Y129.444 I-.726 J6.036 E.08568
G1 X115.206 Y99.151 E1.12829
G1 X126.892 Y99.151 E.43524
G1 X126.892 Y132.996 E1.26061
G1 X126.384 Y130.821 F30000
G1 F3000
G1 X126.029 Y130.903 E.01356
G3 X125.519 Y129.789 I10.841 J-5.635 E.04565
G1 X125.519 Y101.085 E1.06909
G1 X124.776 Y100.342 E.03916
G1 X117.724 Y100.342 E.26264
M73 P30 R12
G1 X116.981 Y101.085 E.03916
G1 X116.981 Y128.777 E1.03142
G2 X115.715 Y128.809 I-.368 J10.475 E.04718
G1 X115.714 Y99.659 E1.08574
G1 X126.384 Y99.659 E.3974
G1 X126.384 Y130.821 E1.16067
; WIPE_START
G1 F24000
G1 X126.384 Y128.821 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.142 J-.419 P1  F30000
G1 X116.222 Y101.126 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X116.222 Y100.167 E.03571
M73 P31 R12
G1 X117.181 Y100.167 E.03572
G1 X116.222 Y101.126 E.05051
; WIPE_START
G1 F24000
G1 X117.181 Y100.167 E-.51531
G1 X116.537 Y100.167 E-.24469
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.642 J1.034 P1  F30000
G1 X164.705 Y130.048 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X164.042 Y129.801 E.02637
G1 X163.375 Y129.701 E.02513
G2 X161.6 Y129.697 I-.966 J35.64 E.0661
G1 X161.6 Y101.466 E1.05148
G1 X161.395 Y101.261 E.0108
G1 X155.105 Y101.261 E.23428
G1 X154.9 Y101.466 E.0108
G1 X154.9 Y129.975 E1.06186
G3 X152.952 Y133.509 I-17.791 J-7.506 E.15056
G1 X152.197 Y133.316 E.02902
G1 X152.197 Y98.74 E1.28783
G1 X164.705 Y98.74 E.46588
G1 X164.705 Y129.98 E1.16357
; WIPE_START
G1 F24000
G1 X164.705 Y127.98 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.466 J-1.124 P1  F30000
G1 X152.608 Y132.996 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X152.608 Y99.151 E1.26061
G1 X164.294 Y99.151 E.43524
G1 X164.294 Y129.444 E1.12831
G1 X163.39 Y129.289 E.03415
G2 X162.011 Y129.285 I-.773 J27.685 E.05135
G1 X162.011 Y101.296 E1.0425
G1 X161.565 Y100.85 E.02349
G1 X154.935 Y100.85 E.24697
G1 X154.489 Y101.296 E.02349
M73 P32 R12
G1 X154.489 Y129.892 E1.06509
G3 X152.777 Y133.04 I-14.926 J-6.076 E.13373
G1 X152.608 Y132.996 E.00649
G1 X153.116 Y130.822 F30000
G1 F3000
G1 X153.116 Y99.659 E1.16069
G1 X163.786 Y99.659 E.3974
G1 X163.786 Y128.809 E1.08574
G2 X162.519 Y128.777 I-.898 J10.498 E.04722
G1 X162.519 Y101.085 E1.03142
G1 X161.776 Y100.342 E.03916
G1 X154.724 Y100.342 E.26264
G1 X153.981 Y101.085 E.03916
G1 X153.981 Y129.788 E1.06908
G3 X153.471 Y130.903 I-11.54 J-4.602 E.04567
G1 X153.116 Y130.822 E.01356
; WIPE_START
G1 F24000
G1 X153.471 Y130.903 E-.13837
G1 X153.981 Y129.788 E-.46578
G1 X153.981 Y129.378 E-.15585
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.156 J.38 P1  F30000
G1 X163.278 Y101.126 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X162.319 Y100.167 E.05051
G1 X163.278 Y100.167 E.03572
G1 X163.278 Y101.126 E.03572
; WIPE_START
G1 F24000
G1 X163.278 Y100.167 E-.36441
G1 X162.319 Y100.167 E-.36441
G1 X162.377 Y100.225 E-.03117
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.214 J-.079 P1  F30000
G1 X160.393 Y130.904 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X163.202 Y130.904 E.10461
G3 X165.209 Y133.823 I.009 J2.144 E.15532
G3 X114.224 Y133.621 I-25.454 J-9.898 E2.44924
G3 X116.299 Y130.904 I2.066 J-.574 E.1474
G1 X119.107 Y130.904 E.10461
G1 X119.107 Y102.468 E1.05911
G1 X123.393 Y102.468 E.15963
G1 X123.393 Y130.221 E1.03368
G2 X156.107 Y130.221 I16.357 J-6.312 E1.57056
G1 X156.107 Y102.468 E1.03369
G1 X160.393 Y102.468 E.15963
G1 X160.393 Y130.844 E1.05688
G1 X160.85 Y130.447 F30000
; FEATURE: Outer wall
G1 F3000
G1 X163.207 Y130.447 E.0878
G3 X165.635 Y133.989 I.003 J2.601 E.18817
G3 X113.783 Y133.744 I-25.879 J-10.062 E2.49178
M73 P33 R12
G3 X116.293 Y130.447 I2.506 J-.696 E.17855
G1 X118.65 Y130.447 E.0878
G1 X118.65 Y102.011 E1.05911
G1 X123.85 Y102.011 E.19368
G1 X123.85 Y130.128 E1.04724
G2 X155.65 Y130.128 I15.9 J-6.213 E1.52379
G1 X155.65 Y102.011 E1.04725
G1 X160.85 Y102.011 E.19368
G1 X160.85 Y130.387 E1.05688
; WIPE_START
G1 F24000
G1 X162.849 Y130.437 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.207 J-.155 P1  F30000
G1 X159.286 Y102.651 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500136
G1 F6300
G1 X160.004 Y103.37 E.03786
G1 X160.004 Y104.016 E.02409
G1 X158.845 Y102.857 E.06109
G1 X158.198 Y102.857 E.02409
G1 X160.004 Y104.663 E.09516
G1 X160.004 Y105.309 E.02409
G1 X157.552 Y102.857 E.12923
G1 X156.905 Y102.857 E.02409
G1 X160.004 Y105.956 E.1633
G1 X160.004 Y106.603 E.02409
G1 X156.496 Y103.094 E.18488
G1 X156.496 Y103.74 E.02409
G1 X160.004 Y107.249 E.18488
G1 X160.004 Y107.896 E.02409
G1 X156.496 Y104.387 E.18488
G1 X156.496 Y105.034 E.02409
G1 X160.004 Y108.542 E.18488
G1 X160.004 Y109.189 E.02409
G1 X156.496 Y105.68 E.18488
G1 X156.496 Y106.327 E.02409
G1 X160.004 Y109.836 E.18488
G1 X160.004 Y110.482 E.02409
G1 X156.496 Y106.973 E.18488
G1 X156.496 Y107.62 E.02409
G1 X160.004 Y111.129 E.18488
G1 X160.004 Y111.775 E.02409
G1 X156.496 Y108.267 E.18488
G1 X156.496 Y108.913 E.02409
G1 X160.004 Y112.422 E.18488
G1 X160.004 Y113.069 E.02409
G1 X156.496 Y109.56 E.18488
G1 X156.496 Y110.206 E.02409
G1 X160.004 Y113.715 E.18488
G1 X160.004 Y114.362 E.02409
M73 P34 R12
G1 X156.496 Y110.853 E.18488
G1 X156.496 Y111.5 E.02409
G1 X160.004 Y115.008 E.18488
G1 X160.004 Y115.655 E.02409
G1 X156.496 Y112.146 E.18488
G1 X156.496 Y112.793 E.02409
G1 X160.004 Y116.302 E.18488
G1 X160.004 Y116.948 E.02409
G1 X156.496 Y113.439 E.18488
G1 X156.496 Y114.086 E.02409
G1 X160.004 Y117.595 E.18488
G1 X160.004 Y118.241 E.02409
G1 X156.496 Y114.733 E.18488
G1 X156.496 Y115.379 E.02409
G1 X160.004 Y118.888 E.18488
G1 X160.004 Y119.535 E.02409
G1 X156.496 Y116.026 E.18488
G1 X156.496 Y116.672 E.02409
G1 X160.004 Y120.181 E.18488
G1 X160.004 Y120.828 E.02409
G1 X156.496 Y117.319 E.18488
G1 X156.496 Y117.966 E.02409
G1 X160.004 Y121.474 E.18488
G1 X160.004 Y122.121 E.02409
G1 X156.496 Y118.612 E.18488
G1 X156.496 Y119.259 E.02409
G1 X160.004 Y122.768 E.18488
G1 X160.004 Y123.414 E.02409
G1 X156.496 Y119.905 E.18488
G1 X156.496 Y120.552 E.02409
G1 X160.004 Y124.061 E.18488
G1 X160.004 Y124.707 E.02409
G1 X156.496 Y121.199 E.18488
G1 X156.496 Y121.845 E.02409
G1 X160.004 Y125.354 E.18488
G1 X160.004 Y126.001 E.02409
G1 X156.496 Y122.492 E.18488
G1 X156.496 Y123.138 E.02409
G1 X160.004 Y126.647 E.18488
G1 X160.004 Y127.294 E.02409
G1 X156.496 Y123.785 E.18488
G1 X156.496 Y124.432 E.02409
G1 X160.004 Y127.94 E.18488
G1 X160.004 Y128.587 E.02409
G1 X156.496 Y125.078 E.18488
G1 X156.496 Y125.725 E.02409
G1 X160.004 Y129.234 E.18488
G1 X160.004 Y129.88 E.02409
G1 X156.496 Y126.371 E.18488
G1 X156.496 Y127.018 E.02409
G1 X160.21 Y130.733 E.19572
; WIPE_START
G1 F24000
G1 X158.796 Y129.318 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.458 J1.127 P1  F30000
G1 X163.153 Y131.089 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X164.957 Y132.893 E.09505
G3 X164.905 Y133.488 I-1.286 J.188 E.02244
G1 X162.712 Y131.294 E.11557
G1 X162.065 Y131.294 E.02411
G1 X164.731 Y133.96 E.14048
G1 X164.54 Y134.416 E.01841
G1 X161.417 Y131.293 E.16454
G1 X160.77 Y131.293 E.02411
G1 X164.35 Y134.872 E.1886
G3 X164.143 Y135.312 I-4.478 J-1.839 E.01811
G1 X156.496 Y127.665 E.40293
G1 X156.496 Y128.311 E.02409
M73 P35 R12
G1 X163.934 Y135.749 E.3919
G3 X163.723 Y136.185 I-4.434 J-1.876 E.01804
G1 X156.496 Y128.958 E.38079
G1 X156.496 Y129.604 E.02409
G1 X163.496 Y136.604 E.36882
G1 X163.268 Y137.024 E.01777
G1 X156.496 Y130.251 E.35685
G1 X156.496 Y130.3 E.00183
G1 X156.318 Y130.72 E.01698
G1 X163.037 Y137.439 E.35404
G1 X162.793 Y137.841 E.01754
G1 X156.125 Y131.173 E.35132
G3 X155.92 Y131.615 I-4.578 J-1.85 E.01815
G1 X162.548 Y138.243 E.34922
G3 X162.296 Y138.638 I-4.106 J-2.343 E.01745
G1 X155.709 Y132.051 E.34706
G3 X155.484 Y132.472 I-4.348 J-2.059 E.0178
G1 X162.035 Y139.024 E.34519
G1 X161.774 Y139.409 E.01735
G1 X155.255 Y132.89 E.34348
G3 X155.01 Y133.292 I-4.152 J-2.259 E.01753
G1 X161.503 Y139.785 E.34214
G1 X161.225 Y140.153 E.0172
G1 X154.763 Y133.691 E.34049
G1 X154.5 Y134.075 E.01733
G1 X160.947 Y140.522 E.33968
G3 X160.66 Y140.882 I-3.797 J-2.735 E.01715
G1 X154.235 Y134.457 E.33852
G1 X153.956 Y134.824 E.01719
G1 X160.366 Y141.234 E.33773
G1 X160.072 Y141.586 E.0171
G1 X153.673 Y135.188 E.33712
G1 X153.378 Y135.539 E.0171
G1 X159.766 Y141.927 E.33658
G1 X159.456 Y142.263 E.01705
G1 X153.078 Y135.886 E.33603
G1 X152.766 Y136.221 E.01705
G1 X159.145 Y142.6 E.3361
G3 X158.822 Y142.923 I-3.323 J-2.997 E.01704
G1 X152.45 Y136.551 E.33576
G1 X152.122 Y136.869 E.01704
G1 X158.495 Y143.243 E.33581
G1 X158.168 Y143.562 E.01704
G1 X151.788 Y137.182 E.33617
G1 X151.444 Y137.485 E.01707
G1 X157.83 Y143.87 E.33645
G1 X157.487 Y144.174 E.01707
G1 X151.093 Y137.781 E.33687
G1 X150.733 Y138.067 E.01714
G1 X157.144 Y144.478 E.33778
G3 X156.787 Y144.767 I-3.099 J-3.461 E.01714
G1 X150.365 Y138.346 E.33835
G1 X149.989 Y138.616 E.01726
G1 X156.428 Y145.055 E.33928
G1 X156.069 Y145.343 E.01714
G1 X149.603 Y138.877 E.34069
G1 X149.21 Y139.13 E.01743
G1 X155.694 Y145.614 E.34166
G1 X155.318 Y145.885 E.01725
G1 X148.805 Y139.372 E.34319
G1 X148.395 Y139.608 E.01764
G1 X154.942 Y146.156 E.34497
G1 X154.55 Y146.41 E.01742
G1 X147.971 Y139.831 E.34664
G1 X147.543 Y140.05 E.01791
G1 X154.158 Y146.664 E.34853
G3 X153.762 Y146.916 I-2.71 J-3.826 E.01746
G1 X147.099 Y140.252 E.3511
M73 P35 R11
G3 X146.651 Y140.451 I-2.234 J-4.421 E.01826
G1 X153.353 Y147.153 E.35311
G1 X152.944 Y147.39 E.01763
G1 X146.187 Y140.633 E.35603
G3 X145.716 Y140.809 I-2.012 J-4.668 E.01873
G1 X152.529 Y147.622 E.35896
G1 X152.102 Y147.842 E.01789
G1 X145.232 Y140.972 E.36198
G3 X144.736 Y141.122 I-1.768 J-4.936 E.01932
G1 X151.675 Y148.061 E.36563
G3 X151.239 Y148.272 I-2.318 J-4.258 E.01806
G1 X144.231 Y141.264 E.36922
G3 X143.707 Y141.387 I-1.487 J-5.16 E.02005
G1 X150.794 Y148.473 E.37337
G1 X150.349 Y148.675 E.0182
G1 X143.176 Y141.502 E.37794
G1 X142.626 Y141.599 E.02079
G1 X149.889 Y148.862 E.38269
G1 X149.425 Y149.045 E.01857
G1 X142.061 Y141.68 E.38805
G3 X141.484 Y141.75 I-1.001 J-5.807 E.02164
G1 X148.96 Y149.226 E.3939
G1 X148.477 Y149.389 E.01901
G1 X140.883 Y141.795 E.40012
G3 X140.263 Y141.822 I-.586 J-6.29 E.02311
G1 X147.993 Y149.553 E.40729
G3 X147.501 Y149.707 I-1.786 J-4.847 E.01924
G1 X139.626 Y141.832 E.41491
M73 P36 R11
G1 X138.964 Y141.816 E.02469
G1 X146.997 Y149.849 E.42327
G1 X146.493 Y149.992 E.01952
G1 X138.27 Y141.769 E.43327
G3 X137.548 Y141.694 I.379 J-7.168 E.02703
G1 X145.97 Y150.115 E.44371
G1 X145.444 Y150.236 E.0201
G1 X136.792 Y141.585 E.45584
G3 X135.994 Y141.433 I1.097 J-7.947 E.03029
G1 X144.909 Y150.348 E.46973
G1 X144.36 Y150.445 E.02078
G1 X135.144 Y141.229 E.4856
G3 X134.225 Y140.957 I2.292 J-9.428 E.03571
G1 X143.811 Y150.543 E.50507
G3 X143.237 Y150.616 I-1.02 J-5.7 E.02154
G1 X133.216 Y140.595 E.52801
G3 X132.084 Y140.109 I4.321 J-11.634 E.04593
G1 X142.663 Y150.689 E.55743
G3 X142.072 Y150.744 I-.848 J-5.884 E.02214
G1 X130.073 Y138.744 E.63225
; WIPE_START
G1 F24000
G1 X131.487 Y140.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.187 J-.268 P1  F30000
G1 X123.21 Y103.432 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X122.635 Y102.857 E.03029
G1 X121.989 Y102.857 E.02409
G1 X123.004 Y103.872 E.05352
G1 X123.004 Y104.519 E.02409
G1 X121.342 Y102.857 E.08759
G1 X120.696 Y102.857 E.02409
G1 X123.004 Y105.166 E.12166
G1 X123.004 Y105.812 E.02409
G1 X120.049 Y102.857 E.15573
G1 X119.496 Y102.857 E.02061
G1 X119.496 Y102.95 E.00348
G1 X123.004 Y106.459 E.18488
G1 X123.004 Y107.105 E.02409
G1 X119.496 Y103.597 E.18488
G1 X119.496 Y104.243 E.02409
G1 X123.004 Y107.752 E.18488
G1 X123.004 Y108.399 E.02409
G1 X119.496 Y104.89 E.18488
G1 X119.496 Y105.536 E.02409
G1 X123.004 Y109.045 E.18488
G1 X123.004 Y109.692 E.02409
G1 X119.496 Y106.183 E.18488
G1 X119.496 Y106.83 E.02409
G1 X123.004 Y110.338 E.18488
G1 X123.004 Y110.985 E.02409
G1 X119.496 Y107.476 E.18488
G1 X119.496 Y108.123 E.02409
G1 X123.004 Y111.632 E.18488
G1 X123.004 Y112.278 E.02409
G1 X119.496 Y108.769 E.18488
G1 X119.496 Y109.416 E.02409
G1 X123.004 Y112.925 E.18488
G1 X123.004 Y113.571 E.02409
G1 X119.496 Y110.063 E.18488
G1 X119.496 Y110.709 E.02409
G1 X123.004 Y114.218 E.18488
G1 X123.004 Y114.865 E.02409
G1 X119.496 Y111.356 E.18488
G1 X119.496 Y112.002 E.02409
G1 X123.004 Y115.511 E.18488
G1 X123.004 Y116.158 E.02409
G1 X119.496 Y112.649 E.18488
G1 X119.496 Y113.296 E.02409
G1 X123.004 Y116.804 E.18488
G1 X123.004 Y117.451 E.02409
G1 X119.496 Y113.942 E.18488
G1 X119.496 Y114.589 E.02409
G1 X123.004 Y118.098 E.18488
G1 X123.004 Y118.744 E.02409
M73 P37 R11
G1 X119.496 Y115.235 E.18488
G1 X119.496 Y115.882 E.02409
G1 X123.004 Y119.391 E.18488
G1 X123.004 Y120.037 E.02409
G1 X119.496 Y116.529 E.18488
G1 X119.496 Y117.175 E.02409
G1 X123.004 Y120.684 E.18488
G1 X123.004 Y121.331 E.02409
G1 X119.496 Y117.822 E.18488
G1 X119.496 Y118.468 E.02409
G1 X123.004 Y121.977 E.18488
G1 X123.004 Y122.624 E.02409
G1 X119.496 Y119.115 E.18488
G1 X119.496 Y119.762 E.02409
G1 X123.004 Y123.27 E.18488
G1 X123.004 Y123.917 E.02409
G1 X119.496 Y120.408 E.18488
G1 X119.496 Y121.055 E.02409
G1 X123.004 Y124.564 E.18488
G1 X123.004 Y125.21 E.02409
G1 X119.496 Y121.701 E.18488
G1 X119.496 Y122.348 E.02409
G1 X123.004 Y125.857 E.18488
G1 X123.004 Y126.503 E.02409
G1 X119.496 Y122.995 E.18488
G1 X119.496 Y123.641 E.02409
G1 X123.004 Y127.15 E.18488
G1 X123.004 Y127.797 E.02409
G1 X119.496 Y124.288 E.18488
G1 X119.496 Y124.934 E.02409
G1 X123.004 Y128.443 E.18488
G1 X123.004 Y129.09 E.02409
G1 X119.496 Y125.581 E.18488
G1 X119.496 Y126.228 E.02409
G1 X123.004 Y129.736 E.18488
G1 X123.004 Y130.3 E.02099
G1 X123.066 Y130.444 E.00585
G1 X119.496 Y126.874 E.18811
G1 X119.496 Y127.521 E.02409
G1 X123.57 Y131.596 E.2147
G2 X124.284 Y132.956 I20.295 J-9.782 E.05725
G1 X119.496 Y128.167 E.25231
G1 X119.496 Y128.814 E.02409
G1 X141.471 Y150.79 E1.15788
G3 X140.858 Y150.823 I-.634 J-6.015 E.02289
G1 X119.496 Y129.461 E1.12557
G1 X119.496 Y130.107 E.02409
G1 X140.227 Y150.839 E1.09233
G3 X139.589 Y150.847 I-.407 J-6.269 E.02377
G1 X119.496 Y130.754 E1.05873
G1 X119.496 Y131.292 E.02004
G1 X119.387 Y131.292 E.00405
G1 X138.926 Y150.83 E1.02948
G3 X138.255 Y150.807 I-.098 J-6.712 E.025
G1 X118.741 Y131.293 E1.0282
G1 X118.095 Y131.293 E.02407
G1 X137.556 Y150.754 E1.02536
G3 X136.845 Y150.69 I.283 J-7.134 E.02659
G1 X117.449 Y131.294 E1.02197
G1 X116.803 Y131.294 E.02407
G1 X136.105 Y150.596 E1.017
G3 X135.344 Y150.481 I.767 J-7.668 E.0287
G1 X116.163 Y131.3 E1.01064
G2 X115.638 Y131.422 I.084 J1.551 E.02017
G1 X134.557 Y150.342 E.99686
G3 X133.73 Y150.161 I1.394 J-8.362 E.03157
G1 X115.226 Y131.657 E.97497
G2 X114.903 Y131.98 I1.11 J1.434 E.01708
G1 X132.877 Y149.955 E.94708
G1 X131.976 Y149.7 E.03491
G1 X114.666 Y132.391 E.91202
G2 X114.544 Y132.915 I1.688 J.67 E.02013
G1 X131.016 Y149.387 E.86789
G3 X129.997 Y149.014 I3.217 J-10.376 E.04046
G1 X114.654 Y133.671 E.8084
G1 X115.11 Y134.774 E.04447
G1 X128.894 Y148.558 E.72628
G3 X127.673 Y147.983 I5.208 J-12.649 E.05033
G1 X115.684 Y135.995 E.63168
G1 X116.437 Y137.394 E.0592
G1 X126.261 Y147.219 E.51765
G3 X124.54 Y146.144 I9.665 J-17.396 E.07564
G1 X117.559 Y139.163 E.36782
G1 X117.841 Y139.579 E.01873
G2 X120.424 Y142.675 I24.488 J-17.808 E.15032
G1 X123.051 Y145.301 E.13839
M106 S247.35
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.637 Y143.887 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/63
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
G3 Z.6 I.391 J1.152 P1  F30000
G1 X160.648 Y130.649 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X163.205 Y130.649 E.08481
G3 X165.447 Y133.915 I.006 J2.399 E.15464
G3 X113.978 Y133.691 I-25.691 J-9.984 E2.20261
G3 X116.295 Y130.649 I2.311 J-.643 E.14678
G1 X118.852 Y130.649 E.08481
G1 X118.852 Y101.935 E.95249
G1 X123.648 Y101.935 E.15909
G1 X123.648 Y130.169 E.93658
G2 X155.852 Y130.169 I16.102 J-6.259 E1.37544
M73 P38 R11
G1 X155.852 Y101.935 E.93659
G1 X160.648 Y101.935 E.15909
G1 X160.648 Y130.589 E.9505
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.21 Y130.257 E.06667
G3 X165.813 Y134.058 I.001 J2.791 E.16649
G3 X113.641 Y133.929 I-26.061 J-10.146 E2.06582
G3 X116.29 Y130.257 I2.654 J-.877 E.16219
G1 X118.46 Y130.257 E.06667
G1 X118.46 Y101.78 E.875
G1 X118.46 Y101.616 E.00504
M106 S255
G1 F1800
G1 X118.46 Y101.543 E.00226
G1 X124.04 Y101.543 E.17146
G1 X124.04 Y101.616 E.00226
M106 S247.35
G1 F12000
G1 X124.04 Y101.78 E.00504
G1 X124.04 Y130.089 E.86986
G2 X155.46 Y130.089 I15.71 J-6.176 E1.24094
G1 X155.46 Y101.78 E.86987
G1 X155.46 Y101.616 E.00504
M106 S255
G1 F1800
G1 X155.46 Y101.543 E.00226
G1 X161.04 Y101.543 E.17146
G1 X161.04 Y101.616 E.00226
M106 S247.35
G1 F12000
G1 X161.04 Y101.78 E.00504
G1 X161.04 Y130.197 E.87316
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.549 J-1.086 P1  F30000
G1 X152.869 Y135.398 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421496
G1 F15000
G1 X160.315 Y127.953 E.32483
G1 X160.315 Y127.417 E.01652
G1 X154.972 Y132.76 E.2331
G2 X155.57 Y131.626 I-22.328 J-12.511 E.03956
G1 X160.315 Y126.882 E.20698
G1 X160.315 Y126.347 E.01652
G1 X156.009 Y130.653 E.18786
G1 X156.185 Y130.237 E.01393
G1 X156.185 Y129.941 E.00915
G1 X160.315 Y125.811 E.18015
G1 X160.315 Y125.276 E.01652
G1 X156.185 Y129.405 E.18015
G1 X156.185 Y128.87 E.01652
G1 X160.315 Y124.741 E.18015
G1 X160.315 Y124.205 E.01652
G1 X156.185 Y128.334 E.18015
G1 X156.185 Y127.799 E.01652
G1 X160.315 Y123.67 E.18015
G1 X160.315 Y123.134 E.01652
G1 X156.185 Y127.264 E.18015
G1 X156.185 Y126.728 E.01652
G1 X160.315 Y122.599 E.18015
G1 X160.315 Y122.064 E.01652
G1 X156.185 Y126.193 E.18015
G1 X156.185 Y125.658 E.01652
G1 X160.315 Y121.528 E.18015
G1 X160.315 Y120.993 E.01652
G1 X156.185 Y125.122 E.18015
G1 X156.185 Y124.587 E.01652
G1 X160.315 Y120.457 E.18015
G1 X160.315 Y119.922 E.01652
G1 X156.185 Y124.051 E.18015
G1 X156.185 Y123.516 E.01652
G1 X160.315 Y119.387 E.18015
G1 X160.315 Y118.851 E.01652
G1 X156.185 Y122.981 E.18015
G1 X156.185 Y122.445 E.01652
G1 X160.315 Y118.316 E.18015
G1 X160.315 Y117.781 E.01652
G1 X156.185 Y121.91 E.18015
G1 X156.185 Y121.374 E.01652
G1 X160.315 Y117.245 E.18015
G1 X160.315 Y116.71 E.01652
G1 X156.185 Y120.839 E.18015
G1 X156.185 Y120.304 E.01652
G1 X160.315 Y116.174 E.18015
G1 X160.315 Y115.639 E.01652
G1 X156.185 Y119.768 E.18015
G1 X156.185 Y119.233 E.01652
G1 X160.315 Y115.104 E.18015
G1 X160.315 Y114.568 E.01652
G1 X156.185 Y118.697 E.18015
G1 X156.185 Y118.162 E.01652
G1 X160.315 Y114.033 E.18015
G1 X160.315 Y113.497 E.01652
G1 X156.185 Y117.627 E.18015
G1 X156.185 Y117.091 E.01652
G1 X160.315 Y112.962 E.18015
G1 X160.315 Y112.427 E.01652
G1 X156.185 Y116.556 E.18015
G1 X156.185 Y116.021 E.01652
G1 X160.315 Y111.891 E.18015
G1 X160.315 Y111.356 E.01652
G1 X156.185 Y115.485 E.18015
G1 X156.185 Y114.95 E.01652
G1 X160.315 Y110.82 E.18015
M73 P39 R11
G1 X160.315 Y110.285 E.01652
G1 X156.185 Y114.414 E.18015
G1 X156.185 Y113.879 E.01652
G1 X160.315 Y109.75 E.18015
G1 X160.315 Y109.214 E.01652
G1 X156.185 Y113.344 E.18015
G1 X156.185 Y112.808 E.01652
G1 X160.315 Y108.679 E.18015
G1 X160.315 Y108.144 E.01652
G1 X156.185 Y112.273 E.18015
G1 X156.185 Y111.737 E.01652
G1 X160.315 Y107.608 E.18015
G1 X160.315 Y107.073 E.01652
G1 X156.185 Y111.202 E.18015
G1 X156.185 Y110.667 E.01652
G1 X160.315 Y106.537 E.18015
G1 X160.315 Y106.002 E.01652
G1 X156.185 Y110.131 E.18015
G1 X156.185 Y109.596 E.01652
G1 X160.315 Y105.467 E.18015
G1 X160.315 Y104.931 E.01652
G1 X156.185 Y109.061 E.18015
G1 X156.185 Y108.525 E.01652
G1 X160.315 Y104.396 E.18015
G1 X160.315 Y103.86 E.01652
G1 X156.185 Y107.99 E.18015
G1 X156.185 Y107.454 E.01652
G1 X160.315 Y103.325 E.18015
G1 X160.315 Y102.79 E.01652
G1 X156.185 Y106.919 E.18015
G1 X156.185 Y106.384 E.01652
G1 X160.301 Y102.268 E.17955
G1 X159.766 Y102.268 E.01652
G1 X156.185 Y105.848 E.15619
G1 X156.185 Y105.313 E.01652
G1 X159.23 Y102.268 E.13283
G1 X158.695 Y102.268 E.01652
G1 X156.185 Y104.777 E.10948
G1 X156.185 Y104.242 E.01652
G1 X158.159 Y102.268 E.08612
G1 X157.624 Y102.268 E.01652
G1 X156.185 Y103.707 E.06276
G1 X156.185 Y103.171 E.01652
G1 X157.089 Y102.268 E.0394
G1 X156.553 Y102.268 E.01652
G1 X156.016 Y102.806 E.02345
; WIPE_START
G1 F24000
G1 X156.553 Y102.268 E-.28886
G1 X157.089 Y102.268 E-.20345
G1 X156.59 Y102.766 E-.2677
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.022 J-1.217 P1  F30000
G1 X119.781 Y102.098 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X119.185 Y102.694 E.02599
G1 X119.185 Y103.23 E.01652
G1 X120.147 Y102.268 E.04195
G1 X120.682 Y102.268 E.01652
G1 X119.185 Y103.765 E.0653
G1 X119.185 Y104.3 E.01652
G1 X121.218 Y102.268 E.08866
G1 X121.753 Y102.268 E.01652
G1 X119.185 Y104.836 E.11202
G1 X119.185 Y105.371 E.01652
G1 X122.288 Y102.268 E.13538
G1 X122.824 Y102.268 E.01652
G1 X119.185 Y105.906 E.15873
G1 X119.185 Y106.442 E.01652
G1 X123.315 Y102.313 E.18015
G1 X123.315 Y102.848 E.01652
G1 X119.185 Y106.977 E.18015
G1 X119.185 Y107.513 E.01652
G1 X123.315 Y103.383 E.18015
G1 X123.315 Y103.919 E.01652
G1 X119.185 Y108.048 E.18015
G1 X119.185 Y108.583 E.01652
G1 X123.315 Y104.454 E.18015
G1 X123.315 Y104.989 E.01652
G1 X119.185 Y109.119 E.18015
G1 X119.185 Y109.654 E.01652
G1 X123.315 Y105.525 E.18015
G1 X123.315 Y106.06 E.01652
G1 X119.185 Y110.19 E.18015
G1 X119.185 Y110.725 E.01652
G1 X123.315 Y106.596 E.18015
G1 X123.315 Y107.131 E.01652
G1 X119.185 Y111.26 E.18015
G1 X119.185 Y111.796 E.01652
G1 X123.315 Y107.666 E.18015
G1 X123.315 Y108.202 E.01652
G1 X119.185 Y112.331 E.18015
G1 X119.185 Y112.867 E.01652
G1 X123.315 Y108.737 E.18015
G1 X123.315 Y109.273 E.01652
G1 X119.185 Y113.402 E.18015
G1 X119.185 Y113.937 E.01652
G1 X123.315 Y109.808 E.18015
G1 X123.315 Y110.343 E.01652
G1 X119.185 Y114.473 E.18015
G1 X119.185 Y115.008 E.01652
G1 X123.315 Y110.879 E.18015
G1 X123.315 Y111.414 E.01652
G1 X119.185 Y115.543 E.18015
G1 X119.185 Y116.079 E.01652
G1 X123.315 Y111.95 E.18015
G1 X123.315 Y112.485 E.01652
G1 X119.185 Y116.614 E.18015
G1 X119.185 Y117.15 E.01652
G1 X123.315 Y113.02 E.18015
G1 X123.315 Y113.556 E.01652
G1 X119.185 Y117.685 E.18015
G1 X119.185 Y118.22 E.01652
G1 X123.315 Y114.091 E.18015
G1 X123.315 Y114.626 E.01652
G1 X119.185 Y118.756 E.18015
G1 X119.185 Y119.291 E.01652
G1 X123.315 Y115.162 E.18015
G1 X123.315 Y115.697 E.01652
G1 X119.185 Y119.827 E.18015
G1 X119.185 Y120.362 E.01652
G1 X123.315 Y116.233 E.18015
G1 X123.315 Y116.768 E.01652
G1 X119.185 Y120.897 E.18015
G1 X119.185 Y121.433 E.01652
G1 X123.315 Y117.303 E.18015
G1 X123.315 Y117.839 E.01652
G1 X119.185 Y121.968 E.18015
G1 X119.185 Y122.503 E.01652
G1 X123.315 Y118.374 E.18015
G1 X123.315 Y118.91 E.01652
G1 X119.185 Y123.039 E.18015
G1 X119.185 Y123.574 E.01652
G1 X123.315 Y119.445 E.18015
G1 X123.315 Y119.98 E.01652
G1 X119.185 Y124.11 E.18015
G1 X119.185 Y124.645 E.01652
G1 X123.315 Y120.516 E.18015
G1 X123.315 Y121.051 E.01652
G1 X119.185 Y125.18 E.18015
G1 X119.185 Y125.716 E.01652
G1 X123.315 Y121.586 E.18015
G1 X123.315 Y122.122 E.01652
G1 X119.185 Y126.251 E.18015
G1 X119.185 Y126.787 E.01652
G1 X123.315 Y122.657 E.18015
G1 X123.315 Y123.193 E.01652
G1 X119.185 Y127.322 E.18015
G1 X119.185 Y127.857 E.01652
G1 X123.315 Y123.728 E.18015
G1 X123.315 Y124.263 E.01652
G1 X119.185 Y128.393 E.18015
G1 X119.185 Y128.928 E.01652
G1 X123.315 Y124.799 E.18015
G1 X123.315 Y125.334 E.01652
G1 X119.185 Y129.464 E.18015
G1 X119.185 Y129.999 E.01652
G1 X123.315 Y125.87 E.18015
G1 X123.315 Y126.405 E.01652
G1 X119.016 Y130.704 E.18755
G1 X115.561 Y130.946 F30000
G1 F15000
G1 X114.524 Y131.983 E.04525
G2 X114.24 Y132.803 I1.605 J1.016 E.027
G1 X116.034 Y131.009 E.07825
G3 X116.594 Y130.985 I.362 J1.866 E.01736
G1 X114.248 Y133.33 E.10233
G2 X114.355 Y133.759 I2.434 J-.378 E.01365
G1 X117.13 Y130.984 E.12106
G1 X117.666 Y130.983 E.01654
G1 X114.511 Y134.137 E.1376
G1 X114.668 Y134.516 E.01264
G1 X118.202 Y130.983 E.15415
G1 X118.738 Y130.982 E.01654
G1 X114.825 Y134.895 E.1707
G2 X114.991 Y135.264 I3.467 J-1.334 E.0125
G1 X123.315 Y126.94 E.36315
G1 X123.315 Y127.476 E.01652
G1 X115.164 Y135.626 E.35559
G1 X115.338 Y135.988 E.01238
G1 X123.315 Y128.011 E.34802
G1 X123.315 Y128.547 E.01652
G1 X115.513 Y136.349 E.34038
G1 X115.701 Y136.696 E.01219
G1 X123.315 Y129.082 E.33218
G1 X123.315 Y129.617 E.01652
G1 X115.889 Y137.043 E.32398
G1 X116.077 Y137.391 E.01219
G1 X123.315 Y130.153 E.31578
G1 X123.315 Y130.237 E.00259
G1 X123.449 Y130.554 E.01062
G1 X116.277 Y137.726 E.31292
G1 X116.479 Y138.06 E.01202
G1 X123.609 Y130.93 E.31106
G2 X123.773 Y131.301 I3.729 J-1.424 E.01253
G1 X116.681 Y138.393 E.3094
G2 X116.886 Y138.723 I3.365 J-1.862 E.012
G1 X123.947 Y131.661 E.30808
G2 X124.123 Y132.021 I3.777 J-1.621 E.01235
G1 X117.102 Y139.042 E.30631
G1 X117.318 Y139.361 E.01189
G1 X124.312 Y132.367 E.30513
G1 X124.502 Y132.713 E.01217
G1 X117.535 Y139.68 E.30396
G2 X117.762 Y139.989 I3.254 J-2.16 E.01182
G1 X124.704 Y133.047 E.30286
G1 X124.907 Y133.379 E.01201
G1 X117.992 Y140.294 E.30172
G1 X118.221 Y140.6 E.0118
G1 X125.12 Y133.701 E.30097
G1 X125.337 Y134.019 E.01188
G1 X118.454 Y140.902 E.30028
G1 X118.698 Y141.194 E.01173
G1 X125.56 Y134.332 E.29938
G1 X125.791 Y134.636 E.01179
G1 X118.941 Y141.486 E.29884
G1 X119.184 Y141.778 E.01173
G1 X126.023 Y134.939 E.29837
G1 X126.268 Y135.23 E.01172
G1 X119.437 Y142.061 E.29803
G1 X119.693 Y142.34 E.01169
G1 X126.512 Y135.521 E.29749
G2 X126.768 Y135.801 I2.936 J-2.416 E.0117
G1 X119.95 Y142.619 E.29742
G2 X120.208 Y142.896 I2.906 J-2.441 E.01169
G1 X127.025 Y136.079 E.29742
G2 X127.29 Y136.35 I2.785 J-2.453 E.01168
G1 X120.478 Y143.162 E.29717
G1 X120.748 Y143.427 E.01168
G1 X127.561 Y136.614 E.29723
G2 X127.834 Y136.877 I2.752 J-2.582 E.01169
G1 X121.018 Y143.692 E.29734
G2 X121.295 Y143.951 I2.727 J-2.639 E.01169
G1 X128.119 Y137.127 E.29771
G1 X128.404 Y137.377 E.0117
G1 X121.579 Y144.203 E.29777
G1 X121.862 Y144.455 E.0117
G1 X128.699 Y137.617 E.29829
G1 X128.998 Y137.854 E.01176
G1 X122.146 Y144.706 E.29895
G2 X122.441 Y144.946 I2.547 J-2.839 E.01175
G1 X129.303 Y138.085 E.29935
G1 X129.615 Y138.308 E.01184
G1 X122.738 Y145.185 E.3
G1 X123.035 Y145.423 E.01175
G1 X129.931 Y138.528 E.30083
G1 X130.256 Y138.738 E.01195
G1 X123.337 Y145.657 E.30186
G1 X123.647 Y145.882 E.01183
G1 X130.581 Y138.948 E.3025
G2 X130.92 Y139.144 I2.084 J-3.215 E.01209
G1 X123.958 Y146.107 E.30376
G1 X124.268 Y146.331 E.01183
G1 X131.26 Y139.34 E.30503
G2 X131.611 Y139.525 I2.048 J-3.459 E.01223
G1 X124.59 Y146.545 E.3063
G1 X124.914 Y146.756 E.01194
G1 X131.965 Y139.706 E.30759
G2 X132.328 Y139.878 I1.908 J-3.546 E.0124
G1 X125.239 Y146.967 E.30927
G2 X125.567 Y147.174 I2.126 J-3.011 E.01198
G1 X132.697 Y140.045 E.31104
G2 X133.072 Y140.205 I1.725 J-3.51 E.01259
G1 X125.907 Y147.37 E.31259
G1 X126.246 Y147.566 E.01209
G1 X133.457 Y140.355 E.31459
G2 X133.845 Y140.503 I1.7 J-3.888 E.01281
G1 X126.585 Y147.762 E.31671
G2 X126.931 Y147.952 I2.104 J-3.437 E.01217
G1 X134.246 Y140.637 E.31912
G2 X134.65 Y140.768 I1.45 J-3.773 E.01311
G1 X127.285 Y148.133 E.32132
G1 X127.638 Y148.315 E.01226
G1 X135.07 Y140.884 E.3242
G1 X135.489 Y141 E.01343
G1 X127.998 Y148.491 E.32683
G1 X128.366 Y148.659 E.01247
G1 X135.925 Y141.099 E.3298
G2 X136.366 Y141.194 I1.192 J-4.479 E.01391
G1 X128.734 Y148.826 E.33297
G2 X129.102 Y148.993 I1.853 J-3.594 E.01248
G1 X136.821 Y141.275 E.33675
G2 X137.283 Y141.348 I.969 J-4.632 E.01445
G1 X129.485 Y149.145 E.34019
G1 X129.869 Y149.297 E.01273
G1 X137.758 Y141.408 E.34419
G2 X138.246 Y141.455 I.699 J-4.661 E.01513
G1 X130.253 Y149.449 E.34874
G2 X130.648 Y149.589 I1.596 J-3.868 E.01294
G1 X138.745 Y141.492 E.35326
G2 X139.26 Y141.513 I.458 J-5.004 E.0159
G1 X131.047 Y149.725 E.35827
G1 X131.447 Y149.86 E.01302
G1 X139.783 Y141.524 E.36367
G2 X140.333 Y141.51 I.129 J-5.562 E.01697
G1 X131.855 Y149.987 E.36985
G1 X132.272 Y150.106 E.01337
G1 X140.895 Y141.484 E.37617
G2 X141.475 Y141.439 I-.171 J-6.009 E.01795
G1 X132.689 Y150.224 E.38328
G2 X133.113 Y150.337 I1.334 J-4.177 E.01351
G1 X142.086 Y141.363 E.39147
G2 X142.716 Y141.268 I-.596 J-6.074 E.01969
G1 X133.547 Y150.437 E.40002
G1 X133.982 Y150.537 E.01377
G1 X143.375 Y141.145 E.40977
G1 X144.069 Y140.986 E.02197
G1 X134.423 Y150.632 E.42083
G1 X134.877 Y150.713 E.01423
G1 X144.813 Y140.777 E.43348
G2 X145.608 Y140.518 I-2.252 J-8.25 E.02579
G1 X135.331 Y150.795 E.44833
G2 X135.793 Y150.868 I.97 J-4.579 E.01442
G1 X146.473 Y140.188 E.46596
G2 X147.447 Y139.749 I-10.733 J-25.132 E.03296
G1 X136.268 Y150.929 E.48774
G1 X136.742 Y150.99 E.01476
G1 X148.601 Y139.132 E.51734
G2 X150.148 Y138.119 I-8.883 J-15.27 E.05707
G1 X137.229 Y151.039 E.56365
G1 X137.726 Y151.077 E.01538
G1 X160.315 Y128.488 E.9855
G1 X160.315 Y129.024 E.01652
G1 X138.223 Y151.116 E.96382
G2 X138.739 Y151.135 I.452 J-5.153 E.01594
G1 X160.315 Y129.559 E.94131
G1 X160.315 Y130.094 E.01652
G1 X139.26 Y151.149 E.91857
G2 X139.786 Y151.159 I.352 J-5.038 E.01624
G1 X160.315 Y130.63 E.89562
G1 X160.315 Y130.981 E.01083
G1 X160.499 Y130.981 E.00567
G1 X140.335 Y151.145 E.87968
G1 X140.884 Y151.131 E.01694
G1 X161.032 Y130.983 E.879
G1 X161.565 Y130.985 E.01646
G1 X141.448 Y151.103 E.87767
G1 X142.028 Y151.058 E.01795
G1 X162.099 Y130.987 E.87563
G1 X162.632 Y130.989 E.01646
G1 X142.613 Y151.008 E.87338
G1 X143.227 Y150.93 E.01909
G1 X163.166 Y130.991 E.86987
G3 X163.659 Y131.033 I.073 J2.058 E.01531
G1 X143.841 Y150.851 E.86462
G2 X144.491 Y150.737 I-.82 J-6.555 E.02036
G1 X164.054 Y131.174 E.85349
G3 X164.399 Y131.364 I-.366 J1.077 E.01223
G1 X145.143 Y150.62 E.84012
G2 X145.834 Y150.464 I-1.214 J-6.994 E.02187
G1 X164.691 Y131.608 E.82267
G3 X164.927 Y131.906 I-.905 J.961 E.0118
G1 X146.53 Y150.304 E.80263
G2 X147.277 Y150.092 I-1.746 J-7.582 E.02397
M73 P40 R11
G1 X165.116 Y132.253 E.77824
G3 X165.236 Y132.669 I-2.578 J.973 E.01334
G1 X148.04 Y149.865 E.75022
G1 X148.85 Y149.59 E.02638
G1 X165.27 Y133.17 E.71638
G3 X165.104 Y133.871 I-1.982 J-.099 E.02236
G1 X149.709 Y149.266 E.67165
G2 X150.616 Y148.895 I-3.263 J-9.259 E.03024
G1 X164.719 Y134.791 E.61529
G3 X164.259 Y135.787 I-10.051 J-4.043 E.03386
G1 X151.598 Y148.448 E.55235
G1 X152.7 Y147.882 E.03821
G1 X163.695 Y136.886 E.4797
G3 X162.971 Y138.146 I-13.399 J-6.867 E.04485
G1 X153.956 Y147.161 E.39331
G1 X155.166 Y146.379 E.04445
G1 X155.555 Y146.097 E.01482
G1 X161.952 Y139.7 E.27908
G3 X159.327 Y142.86 I-21.981 J-15.587 E.12685
G1 X156.881 Y145.306 E.10671
M106 S244.8
; CHANGE_LAYER
; Z_HEIGHT: 0.457143
; LAYER_HEIGHT: 0.0571429
; WIPE_START
G1 F24000
G1 X158.296 Y143.892 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/63
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
G3 Z.8 I1.168 J-.341 P1  F30000
G1 X154.135 Y129.638 Z.8
G1 Z.457
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X154.135 Y131.208 E.06002
G2 X154.712 Y129.937 I-13.029 J-6.67 E.05337
G1 X154.712 Y129.449 E.01863
G1 X154.135 Y129.449 E.02202
G1 X154.135 Y126.572 E.10997
G1 X154.712 Y126.572 E.02202
G1 X154.712 Y123.695 E.10997
G1 X154.135 Y123.695 E.02202
G1 X154.135 Y120.818 E.10997
G1 X154.712 Y120.818 E.02202
G1 X154.712 Y117.941 E.10997
G1 X154.135 Y117.941 E.02202
G1 X154.135 Y115.064 E.10997
G1 X154.712 Y115.064 E.02202
G1 X154.712 Y112.187 E.10997
G1 X154.135 Y112.187 E.02202
G1 X154.135 Y109.309 E.10997
G1 X154.712 Y109.309 E.02202
G1 X154.712 Y106.432 E.10997
G1 X154.135 Y106.432 E.02202
G1 X154.135 Y103.555 E.10997
G1 X154.712 Y103.555 E.02202
G1 X154.712 Y100.958 E.09928
G1 X154.991 Y100.678 E.01511
G1 X154.135 Y100.678 E.0327
; WIPE_START
G1 F24000
G1 X154.991 Y100.678 E-.32513
G1 X154.712 Y100.958 E-.15023
G1 X154.712 Y101.707 E-.28463
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.857 I.182 J1.203 P1  F30000
G1 X161.509 Y100.678 Z.857
G1 Z.457
G1 E.8 F1800
G1 F9000
G1 X162.767 Y100.678 E.04807
G1 X162.767 Y103.555 E.10997
G1 X161.789 Y103.555 E.03738
G1 X161.789 Y106.432 E.10997
G1 X162.767 Y106.432 E.03738
G1 X162.767 Y109.309 E.10997
G1 X161.789 Y109.309 E.03738
G1 X161.789 Y112.187 E.10997
G1 X162.767 Y112.187 E.03738
G1 X162.767 Y115.064 E.10997
G1 X161.789 Y115.064 E.03738
G1 X161.789 Y117.941 E.10997
G1 X162.767 Y117.941 E.03738
G1 X162.767 Y120.818 E.10997
G1 X161.789 Y120.818 E.03738
G1 X161.789 Y123.695 E.10997
G1 X162.767 Y123.695 E.03738
G1 X162.767 Y126.572 E.10997
G1 X161.789 Y126.572 E.03738
G1 X161.789 Y129.449 E.10997
G1 X162.767 Y129.449 E.03738
; WIPE_START
G1 F24000
G1 X161.789 Y129.449 E-.37168
G1 X161.789 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.857 I.727 J-.976 P1  F30000
G1 X124.509 Y100.678 Z.857
G1 Z.457
G1 E.8 F1800
G1 F9000
G1 X125.365 Y100.678 E.0327
G1 X125.365 Y103.555 E.10997
G1 X124.789 Y103.555 E.02202
G1 X124.789 Y106.432 E.10997
G1 X125.365 Y106.432 E.02202
G1 X125.365 Y109.309 E.10997
G1 X124.789 Y109.309 E.02202
G1 X124.789 Y112.187 E.10997
G1 X125.365 Y112.187 E.02202
G1 X125.365 Y115.064 E.10997
G1 X124.789 Y115.064 E.02202
G1 X124.789 Y117.941 E.10997
G1 X125.365 Y117.941 E.02202
G1 X125.365 Y120.818 E.10997
G1 X124.789 Y120.818 E.02202
G1 X124.789 Y123.695 E.10997
G1 X125.365 Y123.695 E.02202
G1 X125.365 Y126.572 E.10997
G1 X124.789 Y126.572 E.02202
G1 X124.789 Y129.449 E.10997
G1 X125.365 Y129.449 E.02202
G1 X125.365 Y131.205 E.06711
G1 X125.063 Y130.585 E.02635
G3 X124.789 Y129.638 I.98 J-.797 E.03872
; WIPE_START
G1 F24000
G1 X124.789 Y129.937 E-.11383
G1 X125.063 Y130.585 E-.26727
G1 X125.365 Y131.205 E-.26202
G1 X125.365 Y130.897 E-.11689
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.857 I.226 J-1.196 P1  F30000
G1 X117.712 Y129.449 Z.857
G1 Z.457
G1 E.8 F1800
G1 F9000
G1 X116.733 Y129.449 E.03738
G1 X116.733 Y126.572 E.10997
G1 X117.712 Y126.572 E.03738
G1 X117.712 Y123.695 E.10997
G1 X116.733 Y123.695 E.03738
G1 X116.733 Y120.818 E.10997
G1 X117.712 Y120.818 E.03738
G1 X117.712 Y117.941 E.10997
G1 X116.733 Y117.941 E.03738
G1 X116.733 Y115.064 E.10997
G1 X117.712 Y115.064 E.03738
G1 X117.712 Y112.187 E.10997
G1 X116.733 Y112.187 E.03738
G1 X116.733 Y109.309 E.10997
G1 X117.712 Y109.309 E.03738
G1 X117.712 Y106.432 E.10997
G1 X116.733 Y106.432 E.03738
G1 X116.733 Y103.555 E.10997
G1 X117.712 Y103.555 E.03738
G1 X117.712 Y100.958 E.09928
G1 X117.991 Y100.678 E.01511
G1 X116.733 Y100.678 E.04807
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.142857
; WIPE_START
G1 F24000
G1 X117.991 Y100.678 E-.47791
G1 X117.712 Y100.958 E-.15023
G1 X117.712 Y101.305 E-.13186
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/63
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
G3 Z.857 I-.687 J1.005 P1  F30000
G1 X160.648 Y130.649 Z.857
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X163.205 Y130.649 E.08481
G3 X165.447 Y133.915 I.006 J2.399 E.15464
G3 X113.979 Y133.692 I-25.691 J-9.985 E2.20255
G3 X116.295 Y130.649 I2.311 J-.644 E.14682
G1 X118.852 Y130.649 E.08482
G1 X118.852 Y101.783 E.95753
G1 X123.648 Y101.783 E.15909
G1 X123.648 Y130.169 E.94162
G2 X155.852 Y130.17 I16.102 J-6.257 E1.3755
G1 X155.852 Y101.783 E.94164
G1 X160.648 Y101.783 E.15909
G1 X160.648 Y130.589 E.95554
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.21 Y130.257 E.06667
G3 X165.813 Y134.058 I.001 J2.791 E.16649
G3 X113.641 Y133.93 I-26.061 J-10.147 E2.06576
G3 X116.29 Y130.257 I2.653 J-.878 E.16222
G1 X118.46 Y130.257 E.06667
G1 X118.46 Y101.502 E.88356
G1 X118.46 Y101.42 E.00252
G1 F3000
G1 X118.46 Y101.391 E.00089
G1 X124.04 Y101.391 E.17146
G1 X124.04 Y101.42 E.00089
G1 F12000
G1 X124.04 Y101.502 E.00252
G1 X124.04 Y130.089 E.87842
G2 X155.46 Y130.09 I15.71 J-6.174 E1.241
G1 X155.46 Y101.502 E.87842
G1 X155.46 Y101.42 E.00252
G1 F3000
G1 X155.46 Y101.391 E.00089
G1 X161.04 Y101.391 E.17146
G1 X161.04 Y101.42 E.00089
G1 F12000
G1 X161.04 Y101.502 E.00252
G1 X161.04 Y130.197 E.88171
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.898 J.821 P1  F30000
G1 X165.439 Y132.878 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4222
G1 F15000
G1 X163.588 Y131.027 E.08093
G1 X163.418 Y130.994 E.00534
G1 X163.017 Y130.992 E.0124
G1 X165.264 Y133.239 E.09822
G3 X165.17 Y133.682 I-1.517 J-.091 E.01403
G1 X162.478 Y130.99 E.11766
G1 X161.939 Y130.988 E.01665
G1 X165.021 Y134.069 E.13471
G1 X164.863 Y134.448 E.01267
G1 X161.401 Y130.985 E.15134
G1 X160.862 Y130.983 E.01665
G1 X164.834 Y134.955 E.17363
G1 X141.956 Y151.233 F30000
G1 F15000
G1 X119.185 Y128.462 E.99527
G1 X119.185 Y128.999 E.01658
G1 X141.301 Y151.115 E.96665
G3 X140.782 Y151.132 I-.422 J-4.808 E.01605
G1 X119.185 Y129.535 E.94397
G1 X119.185 Y130.071 E.01658
G1 X140.259 Y151.145 E.92109
G1 X139.736 Y151.158 E.01618
G1 X119.185 Y130.608 E.89822
G1 X119.185 Y130.982 E.01155
G1 X119.023 Y130.982 E.00502
G1 X139.189 Y151.147 E.88141
G1 X138.636 Y151.131 E.01708
G1 X118.487 Y130.982 E.88068
G1 X117.951 Y130.983 E.01656
G1 X138.073 Y151.105 E.87948
G1 X137.491 Y151.059 E.01805
G1 X117.416 Y130.984 E.87745
G1 X116.88 Y130.984 E.01656
G1 X136.907 Y151.011 E.87536
G1 X136.291 Y150.932 E.0192
G1 X116.344 Y130.985 E.87185
G2 X115.858 Y131.036 I-.073 J1.656 E.01515
G1 X135.675 Y150.852 E.86615
G3 X135.026 Y150.74 I.801 J-6.554 E.02036
G1 X115.453 Y131.166 E.85553
G2 X115.11 Y131.359 I.542 J1.363 E.01221
G1 X134.372 Y150.622 E.84192
G3 X133.681 Y150.468 I1.196 J-6.99 E.02187
G1 X114.819 Y131.605 E.82445
G2 X114.576 Y131.898 I.856 J.958 E.01182
G1 X132.983 Y150.305 E.80454
G3 X132.236 Y150.095 I1.73 J-7.58 E.02398
G1 X114.389 Y132.248 E.78007
G2 X114.267 Y132.662 I1.3 J.61 E.01339
G1 X131.474 Y149.87 E.75213
G1 X130.661 Y149.593 E.02655
G1 X114.232 Y133.164 E.71809
G2 X114.4 Y133.868 I2.134 J-.137 E.02249
G1 X129.803 Y149.271 E.67321
G3 X128.896 Y148.901 I3.254 J-9.264 E.03028
G1 X114.779 Y134.784 E.61702
G2 X115.237 Y135.778 I9.274 J-3.669 E.03386
G1 X127.91 Y148.451 E.55389
G1 X126.815 Y147.892 E.03798
G1 X115.797 Y136.874 E.48159
G2 X116.53 Y138.144 I13.337 J-6.858 E.04535
G1 X125.548 Y147.162 E.39416
M73 P41 R11
G1 X124.313 Y146.364 E.04546
G1 X123.953 Y146.103 E.01372
G1 X117.542 Y139.692 E.28022
G1 X117.564 Y139.725 E.00122
G2 X120.152 Y142.839 I24.74 J-17.93 E.12524
M73 P41 R10
G1 X122.624 Y145.31 E.10803
G1 X123.484 Y102.724 F30000
G1 F15000
G1 X122.877 Y102.116 E.02656
G1 X122.34 Y102.116 E.01658
G1 X123.315 Y103.091 E.04259
G1 X123.315 Y103.627 E.01658
G1 X121.804 Y102.116 E.06603
G1 X121.268 Y102.116 E.01658
G1 X123.315 Y104.163 E.08948
G1 X123.315 Y104.7 E.01658
G1 X120.731 Y102.116 E.11292
G1 X120.195 Y102.116 E.01658
G1 X123.315 Y105.236 E.13637
G1 X123.315 Y105.773 E.01658
G1 X119.658 Y102.116 E.15981
G1 X119.185 Y102.116 E.01462
G1 X119.185 Y102.18 E.00196
G1 X123.315 Y106.309 E.18049
G1 X123.315 Y106.845 E.01658
G1 X119.185 Y102.716 E.18049
G1 X119.185 Y103.252 E.01658
G1 X123.315 Y107.382 E.18049
G1 X123.315 Y107.918 E.01658
G1 X119.185 Y103.789 E.18049
G1 X119.185 Y104.325 E.01658
G1 X123.315 Y108.454 E.18049
G1 X123.315 Y108.991 E.01658
G1 X119.185 Y104.861 E.18049
G1 X119.185 Y105.398 E.01658
G1 X123.315 Y109.527 E.18049
G1 X123.315 Y110.064 E.01658
G1 X119.185 Y105.934 E.18049
G1 X119.185 Y106.471 E.01658
G1 X123.315 Y110.6 E.18049
G1 X123.315 Y111.136 E.01658
G1 X119.185 Y107.007 E.18049
G1 X119.185 Y107.543 E.01658
G1 X123.315 Y111.673 E.18049
G1 X123.315 Y112.209 E.01658
G1 X119.185 Y108.08 E.18049
G1 X119.185 Y108.616 E.01658
G1 X123.315 Y112.745 E.18049
G1 X123.315 Y113.282 E.01658
G1 X119.185 Y109.153 E.18049
G1 X119.185 Y109.689 E.01658
G1 X123.315 Y113.818 E.18049
G1 X123.315 Y114.355 E.01658
G1 X119.185 Y110.225 E.18049
G1 X119.185 Y110.762 E.01658
G1 X123.315 Y114.891 E.18049
G1 X123.315 Y115.427 E.01658
G1 X119.185 Y111.298 E.18049
G1 X119.185 Y111.834 E.01658
G1 X123.315 Y115.964 E.18049
G1 X123.315 Y116.5 E.01658
G1 X119.185 Y112.371 E.18049
G1 X119.185 Y112.907 E.01658
G1 X123.315 Y117.037 E.18049
G1 X123.315 Y117.573 E.01658
G1 X119.185 Y113.444 E.18049
G1 X119.185 Y113.98 E.01658
G1 X123.315 Y118.109 E.18049
G1 X123.315 Y118.646 E.01658
G1 X119.185 Y114.516 E.18049
G1 X119.185 Y115.053 E.01658
G1 X123.315 Y119.182 E.18049
G1 X123.315 Y119.718 E.01658
G1 X119.185 Y115.589 E.18049
G1 X119.185 Y116.126 E.01658
G1 X123.315 Y120.255 E.18049
G1 X123.315 Y120.791 E.01658
G1 X119.185 Y116.662 E.18049
G1 X119.185 Y117.198 E.01658
G1 X123.315 Y121.328 E.18049
G1 X123.315 Y121.864 E.01658
G1 X119.185 Y117.735 E.18049
G1 X119.185 Y118.271 E.01658
G1 X123.315 Y122.4 E.18049
G1 X123.315 Y122.937 E.01658
G1 X119.185 Y118.807 E.18049
G1 X119.185 Y119.344 E.01658
G1 X123.315 Y123.473 E.18049
G1 X123.315 Y124.01 E.01658
G1 X119.185 Y119.88 E.18049
G1 X119.185 Y120.417 E.01658
G1 X123.315 Y124.546 E.18049
G1 X123.315 Y125.082 E.01658
G1 X119.185 Y120.953 E.18049
G1 X119.185 Y121.489 E.01658
G1 X123.315 Y125.619 E.18049
G1 X123.315 Y126.155 E.01658
G1 X119.185 Y122.026 E.18049
G1 X119.185 Y122.562 E.01658
G1 X123.315 Y126.691 E.18049
G1 X123.315 Y127.228 E.01658
G1 X119.185 Y123.099 E.18049
G1 X119.185 Y123.635 E.01658
G1 X123.315 Y127.764 E.18049
G1 X123.315 Y128.301 E.01658
G1 X119.185 Y124.171 E.18049
G1 X119.185 Y124.708 E.01658
G1 X123.315 Y128.837 E.18049
G1 X123.315 Y129.373 E.01658
G1 X119.185 Y125.244 E.18049
G1 X119.185 Y125.78 E.01658
G1 X123.315 Y129.91 E.18049
G1 X123.315 Y130.237 E.0101
G1 X123.469 Y130.6 E.01221
G1 X119.185 Y126.317 E.18722
G1 X119.185 Y126.853 E.01658
G1 X123.904 Y131.572 E.20626
G2 X124.493 Y132.697 I11.988 J-5.554 E.03924
G1 X119.185 Y127.39 E.23197
G1 X119.185 Y127.926 E.01658
G1 X125.463 Y134.204 E.2744
G2 X129.45 Y138.19 I14.193 J-10.207 E.175
G1 X142.296 Y151.036 E.56148
G2 X142.783 Y150.987 I-.249 J-4.903 E.01514
G1 X130.966 Y139.171 E.51647
G2 X132.114 Y139.782 I12.178 J-21.483 E.04019
G1 X143.258 Y150.925 E.48708
G1 X143.733 Y150.864 E.0148
G1 X133.076 Y140.207 E.46578
G2 X133.938 Y140.533 I3.685 J-8.461 E.02847
G1 X144.195 Y150.79 E.44834
G1 X144.649 Y150.708 E.01427
G1 X134.732 Y140.791 E.43347
G1 X135.471 Y140.994 E.02369
G1 X145.104 Y150.626 E.42102
G2 X145.545 Y150.531 I-.729 J-4.469 E.01396
G1 X136.169 Y141.155 E.40981
G2 X136.826 Y141.276 I1.584 J-6.789 E.02064
G1 X145.981 Y150.43 E.40013
G1 X146.416 Y150.329 E.01381
G1 X137.456 Y141.369 E.39161
G2 X138.065 Y141.441 I1.034 J-6.133 E.01894
G1 X146.84 Y150.216 E.38354
G1 X147.257 Y150.097 E.01341
G1 X138.646 Y141.487 E.37636
G2 X139.207 Y141.511 I.526 J-5.704 E.01734
G1 X147.674 Y149.978 E.3701
G2 X148.083 Y149.85 I-1.074 J-4.157 E.01324
G1 X139.755 Y141.522 E.36401
G1 X140.278 Y141.51 E.01619
G1 X148.483 Y149.714 E.35861
G1 X148.883 Y149.578 E.01306
G1 X140.796 Y141.491 E.35347
G1 X141.294 Y141.452 E.01543
G1 X149.279 Y149.437 E.34901
G1 X149.663 Y149.285 E.01277
G1 X141.781 Y141.403 E.3445
G1 X142.257 Y141.342 E.01482
G1 X150.047 Y149.132 E.34048
G1 X150.43 Y148.98 E.01277
G1 X142.718 Y141.268 E.33708
G1 X143.174 Y141.187 E.01429
G1 X150.799 Y148.812 E.33328
G1 X151.167 Y148.644 E.01251
G1 X143.614 Y141.09 E.33015
G1 X144.05 Y140.99 E.01384
G1 X151.536 Y148.476 E.32718
G2 X151.894 Y148.298 I-1.599 J-3.682 E.01238
G1 X144.47 Y140.874 E.3245
G1 X144.888 Y140.755 E.01342
G1 X152.248 Y148.115 E.32168
G1 X152.601 Y147.932 E.0123
G1 X145.293 Y140.624 E.31942
G1 X145.694 Y140.489 E.01308
G1 X152.951 Y147.746 E.31719
G1 X153.29 Y147.548 E.01212
G1 X146.083 Y140.341 E.31502
G1 X146.468 Y140.19 E.01279
G1 X153.629 Y147.351 E.31298
G1 X153.968 Y147.153 E.01212
G1 X146.842 Y140.028 E.31146
G1 X147.212 Y139.862 E.01254
G1 X154.296 Y146.945 E.30961
G1 X154.621 Y146.733 E.01198
G1 X147.572 Y139.685 E.30807
G1 X147.928 Y139.504 E.01233
G1 X154.945 Y146.522 E.30672
G2 X155.267 Y146.307 I-1.994 J-3.324 E.01195
G1 X148.277 Y139.317 E.30549
G1 X148.618 Y139.121 E.01214
G1 X155.578 Y146.081 E.3042
G1 X155.888 Y145.856 E.01187
G1 X148.957 Y138.924 E.30297
G1 X149.283 Y138.714 E.01199
G1 X156.199 Y145.63 E.3023
G2 X156.501 Y145.395 I-2.205 J-3.133 E.01182
G1 X149.609 Y138.504 E.30121
G2 X149.923 Y138.281 I-2.09 J-3.272 E.01189
G1 X156.798 Y145.156 E.30049
G1 X157.095 Y144.917 E.01179
G1 X150.235 Y138.057 E.29983
G2 X150.54 Y137.825 I-2.098 J-3.068 E.01183
G1 X157.39 Y144.676 E.29944
G1 X157.675 Y144.424 E.01174
G1 X150.838 Y137.587 E.29883
G2 X151.133 Y137.346 I-2.306 J-3.127 E.01179
G1 X157.959 Y144.172 E.29835
G2 X158.242 Y143.918 I-2.552 J-3.125 E.01174
G1 X151.418 Y137.094 E.29824
G1 X151.704 Y136.843 E.01175
G1 X158.513 Y143.653 E.29765
G1 X158.785 Y143.389 E.01172
G1 X151.976 Y136.579 E.29763
G1 X152.248 Y136.315 E.01172
G1 X159.057 Y143.124 E.29763
G1 X159.329 Y142.859 E.01172
G1 X152.51 Y136.041 E.29804
G1 X152.769 Y135.763 E.01173
G1 X159.586 Y142.58 E.29797
G1 X159.843 Y142.301 E.01173
G1 X153.022 Y135.48 E.29812
G1 X153.267 Y135.189 E.01177
G1 X160.1 Y142.021 E.29864
G2 X160.352 Y141.737 I-2.844 J-2.766 E.01175
G1 X153.512 Y134.897 E.29896
G1 X153.743 Y134.592 E.01183
G1 X160.596 Y141.444 E.29951
G1 X160.84 Y141.152 E.01177
G1 X153.975 Y134.287 E.30005
G2 X154.195 Y133.971 I-3.093 J-2.386 E.01191
G1 X161.079 Y140.854 E.30087
G1 X161.31 Y140.549 E.01183
G1 X154.413 Y133.653 E.30145
G2 X154.624 Y133.327 I-3.075 J-2.228 E.01199
G1 X161.541 Y140.245 E.30234
G1 X161.773 Y139.94 E.01183
G1 X154.828 Y132.995 E.30355
G2 X155.028 Y132.659 I-3.285 J-2.185 E.0121
G1 X162 Y139.63 E.30471
G1 X162.216 Y139.31 E.01194
G1 X155.218 Y132.312 E.30587
G2 X155.407 Y131.964 I-3.422 J-2.086 E.01223
G1 X162.432 Y138.99 E.30706
G1 X162.648 Y138.669 E.01194
G1 X155.582 Y131.603 E.30886
G1 X155.757 Y131.242 E.01241
G1 X162.854 Y138.339 E.31021
G1 X163.057 Y138.005 E.01207
G1 X155.917 Y130.866 E.31205
G1 X156.078 Y130.49 E.01263
G1 X163.259 Y137.672 E.3139
G2 X163.453 Y137.329 I-3.547 J-2.234 E.01217
G1 X156.185 Y130.061 E.31767
G1 X156.185 Y129.525 E.01658
G1 X163.643 Y136.982 E.32594
G1 X163.832 Y136.635 E.01222
G1 X156.185 Y128.988 E.33421
G1 X156.185 Y128.452 E.01658
G1 X164.019 Y136.286 E.3424
G1 X164.193 Y135.923 E.01242
G1 X156.185 Y127.916 E.35
G1 X156.185 Y127.379 E.01658
G1 X164.367 Y135.561 E.35761
G1 X164.541 Y135.198 E.01242
G1 X156.185 Y126.843 E.36521
G1 X156.185 Y126.306 E.01658
G1 X160.315 Y130.436 E.18049
G1 X160.315 Y129.899 E.01658
G1 X156.185 Y125.77 E.18049
G1 X156.185 Y125.234 E.01658
G1 X160.315 Y129.363 E.18049
G1 X160.315 Y128.827 E.01658
G1 X156.185 Y124.697 E.18049
G1 X156.185 Y124.161 E.01658
G1 X160.315 Y128.29 E.18049
G1 X160.315 Y127.754 E.01658
G1 X156.185 Y123.624 E.18049
G1 X156.185 Y123.088 E.01658
G1 X160.315 Y127.217 E.18049
M73 P42 R10
G1 X160.315 Y126.681 E.01658
G1 X156.185 Y122.552 E.18049
G1 X156.185 Y122.015 E.01658
G1 X160.315 Y126.145 E.18049
G1 X160.315 Y125.608 E.01658
G1 X156.185 Y121.479 E.18049
G1 X156.185 Y120.943 E.01658
G1 X160.315 Y125.072 E.18049
G1 X160.315 Y124.535 E.01658
G1 X156.185 Y120.406 E.18049
G1 X156.185 Y119.87 E.01658
G1 X160.315 Y123.999 E.18049
G1 X160.315 Y123.463 E.01658
G1 X156.185 Y119.333 E.18049
G1 X156.185 Y118.797 E.01658
G1 X160.315 Y122.926 E.18049
G1 X160.315 Y122.39 E.01658
G1 X156.185 Y118.261 E.18049
G1 X156.185 Y117.724 E.01658
G1 X160.315 Y121.854 E.18049
G1 X160.315 Y121.317 E.01658
G1 X156.185 Y117.188 E.18049
G1 X156.185 Y116.651 E.01658
G1 X160.315 Y120.781 E.18049
G1 X160.315 Y120.244 E.01658
G1 X156.185 Y116.115 E.18049
G1 X156.185 Y115.579 E.01658
G1 X160.315 Y119.708 E.18049
G1 X160.315 Y119.172 E.01658
G1 X156.185 Y115.042 E.18049
G1 X156.185 Y114.506 E.01658
G1 X160.315 Y118.635 E.18049
G1 X160.315 Y118.099 E.01658
G1 X156.185 Y113.97 E.18049
G1 X156.185 Y113.433 E.01658
G1 X160.315 Y117.563 E.18049
G1 X160.315 Y117.026 E.01658
G1 X156.185 Y112.897 E.18049
G1 X156.185 Y112.36 E.01658
G1 X160.315 Y116.49 E.18049
G1 X160.315 Y115.953 E.01658
G1 X156.185 Y111.824 E.18049
G1 X156.185 Y111.288 E.01658
G1 X160.315 Y115.417 E.18049
G1 X160.315 Y114.881 E.01658
G1 X156.185 Y110.751 E.18049
G1 X156.185 Y110.215 E.01658
G1 X160.315 Y114.344 E.18049
G1 X160.315 Y113.808 E.01658
G1 X156.185 Y109.679 E.18049
G1 X156.185 Y109.142 E.01658
G1 X160.315 Y113.271 E.18049
G1 X160.315 Y112.735 E.01658
G1 X156.185 Y108.606 E.18049
G1 X156.185 Y108.069 E.01658
G1 X160.315 Y112.199 E.18049
G1 X160.315 Y111.662 E.01658
G1 X156.185 Y107.533 E.18049
G1 X156.185 Y106.997 E.01658
G1 X160.315 Y111.126 E.18049
G1 X160.315 Y110.59 E.01658
G1 X156.185 Y106.46 E.18049
G1 X156.185 Y105.924 E.01658
G1 X160.315 Y110.053 E.18049
G1 X160.315 Y109.517 E.01658
G1 X156.185 Y105.387 E.18049
G1 X156.185 Y104.851 E.01658
G1 X160.315 Y108.98 E.18049
G1 X160.315 Y108.444 E.01658
G1 X156.185 Y104.315 E.18049
G1 X156.185 Y103.778 E.01658
G1 X160.315 Y107.908 E.18049
G1 X160.315 Y107.371 E.01658
G1 X156.185 Y103.242 E.18049
G1 X156.185 Y102.706 E.01658
G1 X160.315 Y106.835 E.18049
G1 X160.315 Y106.298 E.01658
G1 X156.185 Y102.169 E.18049
G1 X156.185 Y102.116 E.00164
G1 X156.669 Y102.116 E.01494
G1 X160.315 Y105.762 E.15935
G1 X160.315 Y105.226 E.01658
G1 X157.205 Y102.116 E.13591
G1 X157.742 Y102.116 E.01658
G1 X160.315 Y104.689 E.11247
G1 X160.315 Y104.153 E.01658
G1 X158.278 Y102.116 E.08902
G1 X158.814 Y102.116 E.01658
G1 X160.315 Y103.617 E.06558
G1 X160.315 Y103.08 E.01658
G1 X159.351 Y102.116 E.04213
G1 X159.887 Y102.116 E.01658
G1 X160.484 Y102.713 E.0261
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 0.714286
; LAYER_HEIGHT: 0.114286
; WIPE_START
G1 F24000
G1 X159.887 Y102.116 E-.32096
G1 X159.351 Y102.116 E-.20383
G1 X159.788 Y102.554 E-.23521
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/63
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
G3 Z1 I.876 J.845 P1  F30000
G1 X161.597 Y100.678 Z1
G1 Z.714
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X162.767 Y100.678 E.04471
G1 X162.767 Y103.555 E.10997
G1 X161.789 Y103.555 E.03738
G1 X161.789 Y106.432 E.10997
G1 X162.767 Y106.432 E.03738
G1 X162.767 Y109.309 E.10997
G1 X161.789 Y109.309 E.03738
G1 X161.789 Y112.187 E.10997
G1 X162.767 Y112.187 E.03738
G1 X162.767 Y115.064 E.10997
G1 X161.789 Y115.064 E.03738
G1 X161.789 Y117.941 E.10997
G1 X162.767 Y117.941 E.03738
G1 X162.767 Y120.818 E.10997
G1 X161.789 Y120.818 E.03738
G1 X161.789 Y123.695 E.10997
G1 X162.767 Y123.695 E.03738
G1 X162.767 Y126.572 E.10997
G1 X161.789 Y126.572 E.03738
G1 X161.789 Y129.449 E.10997
G1 X162.767 Y129.449 E.03738
; WIPE_START
G1 F24000
G1 X161.789 Y129.449 E-.37168
G1 X161.789 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.114 I-.19 J-1.202 P1  F30000
G1 X154.135 Y129.638 Z1.114
G1 Z.714
G1 E.8 F1800
G1 F9000
G1 X154.135 Y131.208 E.06003
G2 X154.712 Y129.936 I-13.257 J-6.771 E.05338
G1 X154.712 Y129.449 E.01862
G1 X154.135 Y129.449 E.02202
G1 X154.135 Y126.572 E.10997
G1 X154.712 Y126.572 E.02202
G1 X154.712 Y123.695 E.10997
G1 X154.135 Y123.695 E.02202
G1 X154.135 Y120.818 E.10997
G1 X154.712 Y120.818 E.02202
G1 X154.712 Y117.941 E.10997
G1 X154.135 Y117.941 E.02202
G1 X154.135 Y115.064 E.10997
G1 X154.712 Y115.064 E.02202
G1 X154.712 Y112.187 E.10997
G1 X154.135 Y112.187 E.02202
G1 X154.135 Y109.309 E.10997
G1 X154.712 Y109.309 E.02202
G1 X154.712 Y106.432 E.10997
G1 X154.135 Y106.432 E.02202
G1 X154.135 Y103.555 E.10997
G1 X154.712 Y103.555 E.02202
G1 X154.712 Y100.87 E.10265
G1 X154.903 Y100.678 E.01035
G1 X154.135 Y100.678 E.02934
; WIPE_START
G1 F24000
G1 X154.903 Y100.678 E-.29169
G1 X154.712 Y100.87 E-.10293
G1 X154.712 Y101.831 E-.36538
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.114 I.047 J-1.216 P1  F30000
G1 X124.597 Y100.678 Z1.114
G1 Z.714
G1 E.8 F1800
G1 F9000
G1 X125.365 Y100.678 E.02934
G1 X125.365 Y103.555 E.10997
G1 X124.789 Y103.555 E.02202
G1 X124.789 Y106.432 E.10997
G1 X125.365 Y106.432 E.02202
G1 X125.365 Y109.309 E.10997
G1 X124.789 Y109.309 E.02202
G1 X124.789 Y112.187 E.10997
G1 X125.365 Y112.187 E.02202
G1 X125.365 Y115.064 E.10997
G1 X124.789 Y115.064 E.02202
G1 X124.789 Y117.941 E.10997
G1 X125.365 Y117.941 E.02202
G1 X125.365 Y120.818 E.10997
G1 X124.789 Y120.818 E.02202
G1 X124.789 Y123.695 E.10997
G1 X125.365 Y123.695 E.02202
G1 X125.365 Y126.572 E.10997
G1 X124.789 Y126.572 E.02202
G1 X124.789 Y129.449 E.10997
G1 X125.365 Y129.449 E.02202
G1 X125.365 Y131.204 E.06706
G1 X125.063 Y130.583 E.02638
G3 X124.789 Y129.638 I.978 J-.796 E.03866
; WIPE_START
G1 F24000
G1 X124.789 Y129.937 E-.11384
G1 X125.063 Y130.583 E-.26667
G1 X125.365 Y131.204 E-.26223
G1 X125.365 Y130.895 E-.11727
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.114 I.226 J-1.196 P1  F30000
G1 X117.712 Y129.449 Z1.114
G1 Z.714
G1 E.8 F1800
G1 F9000
G1 X116.733 Y129.449 E.03738
G1 X116.733 Y126.572 E.10997
G1 X117.712 Y126.572 E.03738
G1 X117.712 Y123.695 E.10997
G1 X116.733 Y123.695 E.03738
G1 X116.733 Y120.818 E.10997
G1 X117.712 Y120.818 E.03738
G1 X117.712 Y117.941 E.10997
G1 X116.733 Y117.941 E.03738
G1 X116.733 Y115.064 E.10997
G1 X117.712 Y115.064 E.03738
G1 X117.712 Y112.187 E.10997
G1 X116.733 Y112.187 E.03738
G1 X116.733 Y109.309 E.10997
G1 X117.712 Y109.309 E.03738
G1 X117.712 Y106.432 E.10997
G1 X116.733 Y106.432 E.03738
G1 X116.733 Y103.555 E.10997
G1 X117.712 Y103.555 E.03738
G1 X117.712 Y100.87 E.10265
G1 X117.903 Y100.678 E.01035
G1 X116.733 Y100.678 E.04471
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.0857143
; WIPE_START
G1 F24000
G1 X117.903 Y100.678 E-.44446
G1 X117.712 Y100.87 E-.10293
G1 X117.712 Y101.429 E-.2126
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/63
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
G3 Z1.114 I-.685 J1.006 P1  F30000
G1 X160.648 Y130.649 Z1.114
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9422
G1 X163.205 Y130.649 E.08481
G3 X165.447 Y133.915 I.003 J2.401 E.15457
G3 X113.979 Y133.693 I-25.691 J-9.998 E2.20207
G3 X116.295 Y130.649 I2.311 J-.645 E.14685
G1 X118.852 Y130.649 E.08481
G1 X118.852 Y101.695 E.96045
G1 X123.648 Y101.695 E.15909
G1 X123.648 Y130.169 E.94453
G2 X155.852 Y130.17 I16.102 J-6.256 E1.37551
G1 X155.852 Y101.695 E.94457
G1 X160.648 Y101.695 E.15909
G1 X160.648 Y130.589 E.95846
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9422
G1 X163.21 Y130.257 E.06667
G3 X165.813 Y134.058 I-.002 J2.793 E.16643
G3 X113.601 Y133.798 I-26.056 J-10.125 E2.07032
G3 X116.29 Y130.257 I2.689 J-.75 E.15809
G1 X118.46 Y130.257 E.06667
G1 X118.46 Y101.35 E.88822
G1 X118.46 Y101.303 E.00144
G1 X124.04 Y101.303 E.17146
G1 X124.04 Y101.35 E.00144
G1 X124.04 Y130.089 E.88308
G2 X155.46 Y130.09 I15.71 J-6.173 E1.24102
G1 X155.46 Y101.35 E.88309
G1 X155.46 Y101.303 E.00144
G1 X161.04 Y101.303 E.17146
G1 X161.04 Y101.35 E.00144
G1 X161.04 Y130.197 E.88638
M204 S10000
G1 X160.3 Y130.733 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9422
G1 X160.3 Y102.043 E.95169
G1 X156.2 Y102.043 E.13598
G1 X156.2 Y131.291 E.9702
G1 X160.3 Y131.291 E.13598
G1 X160.3 Y130.793 E.01651
G1 X159.893 Y127.829 F30000
G1 F9422
G1 X159.893 Y129.457 E.05401
G1 X158.466 Y130.884 E.06692
G1 X159.414 Y130.884 E.03143
G1 X156.608 Y128.077 E.13165
G1 X156.608 Y125.066 E.09988
G1 X159.893 Y121.781 E.15411
G1 X159.893 Y123.687 E.0632
G1 X156.608 Y120.401 E.15411
G1 X156.608 Y117.391 E.09988
G1 X159.893 Y114.105 E.15411
G1 X159.893 Y116.011 E.0632
G1 X156.608 Y112.726 E.15411
G1 X156.608 Y109.715 E.09988
G1 X159.893 Y106.429 E.15411
G1 X159.893 Y108.335 E.0632
G1 X156.608 Y105.05 E.15411
G1 X156.608 Y103.421 E.05401
; WIPE_START
G1 F24000
G1 X156.608 Y105.05 E-.61876
G1 X156.87 Y105.312 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.176 J.313 P1  F30000
G1 X163.734 Y131.07 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F9422
G3 X164.992 Y132.034 I-.7 J2.215 E.05364
G1 X146.819 Y150.207 E.85254
G1 X147.762 Y149.936 E.03257
G1 X139.356 Y141.53 E.39435
G2 X140.147 Y141.527 I.366 J-7.294 E.02625
G1 X131.738 Y149.936 E.3945
G1 X132.682 Y150.207 E.03257
G1 X114.512 Y132.037 E.85239
G2 X114.27 Y133.4 I1.828 J1.027 E.04679
G2 X115.234 Y135.736 I17.34 J-5.788 E.08389
G1 X119.272 Y131.698 E.18944
G1 X121.848 Y131.698 E.08545
G1 X141.254 Y151.104 E.91036
G3 X138.246 Y151.104 I-1.504 J-27.142 E.09982
G1 X157.652 Y131.698 E.91037
M73 P43 R10
G1 X160.228 Y131.698 E.08545
G1 X164.266 Y135.736 E.18944
G3 X163.516 Y137.181 I-14.246 J-6.48 E.05402
G1 X153.508 Y134.926 F30000
G1 F9422
G2 X154.462 Y133.608 I-19.781 J-15.318 E.05401
G1 X161.338 Y140.484 E.32259
G3 X157.626 Y144.448 I-21.36 J-16.288 E.18045
G1 X150.808 Y137.63 E.31984
G3 X145.922 Y140.42 I-11.131 J-13.816 E.18742
G1 X153.128 Y147.626 E.33803
G3 X151.689 Y148.388 I-27.18 J-49.573 E.05401
G1 X127.813 Y148.389 F30000
G1 F9422
G3 X126.377 Y147.621 I14.459 J-28.739 E.05401
G1 X133.578 Y140.42 E.33778
G3 X128.692 Y137.63 I6.23 J-16.585 E.18743
G1 X121.875 Y144.447 E.31977
G3 X118.157 Y140.489 I18.144 J-20.776 E.18043
G1 X125.038 Y133.608 E.32283
G2 X125.993 Y134.926 I19.994 J-13.483 E.05401
G1 X123.3 Y130.198 F30000
G1 F9422
G1 X123.3 Y131.291 E.03624
G1 X119.2 Y131.291 E.13598
G1 X119.2 Y102.043 E.9702
G1 X123.3 Y102.043 E.13598
G1 X123.3 Y130.138 E.93197
G1 X119.608 Y127.829 F30000
G1 F9422
G1 X119.608 Y129.457 E.05401
G1 X121.034 Y130.884 E.06692
G1 X120.086 Y130.884 E.03143
G1 X122.893 Y128.077 E.13165
G1 X122.893 Y125.066 E.09988
G1 X119.608 Y121.781 E.15411
G1 X119.608 Y123.687 E.0632
G1 X122.893 Y120.401 E.15411
G1 X122.893 Y117.391 E.09988
G1 X119.608 Y114.105 E.15411
G1 X119.608 Y116.011 E.0632
G1 X122.893 Y112.726 E.15411
G1 X122.893 Y109.715 E.09988
G1 X119.607 Y106.429 E.15411
G1 X119.607 Y108.335 E.0632
G1 X122.893 Y105.05 E.15411
G1 X122.893 Y103.421 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 0.971429
; LAYER_HEIGHT: 0.171429
; WIPE_START
G1 F24000
G1 X122.893 Y105.05 E-.61876
G1 X122.63 Y105.312 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/63
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
G3 Z1.2 I1.117 J.484 P1  F30000
G1 X124.638 Y100.678 Z1.2
G1 Z.971
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X125.365 Y100.678 E.02776
G1 X125.365 Y103.555 E.10997
G1 X124.789 Y103.555 E.02202
G1 X124.789 Y106.432 E.10997
G1 X125.365 Y106.432 E.02202
G1 X125.365 Y109.309 E.10997
G1 X124.789 Y109.309 E.02202
G1 X124.789 Y112.187 E.10997
G1 X125.365 Y112.187 E.02202
G1 X125.365 Y115.064 E.10997
G1 X124.789 Y115.064 E.02202
G1 X124.789 Y117.941 E.10997
G1 X125.365 Y117.941 E.02202
G1 X125.365 Y120.818 E.10997
G1 X124.789 Y120.818 E.02202
G1 X124.789 Y123.695 E.10997
G1 X125.365 Y123.695 E.02202
G1 X125.365 Y126.572 E.10997
G1 X124.789 Y126.572 E.02202
G1 X124.789 Y129.449 E.10997
G1 X125.365 Y129.449 E.02202
G1 X125.365 Y131.204 E.06706
G1 X125.062 Y130.583 E.0264
G3 X124.789 Y129.638 I.978 J-.795 E.03864
; WIPE_START
G1 F24000
G1 X124.789 Y129.937 E-.11384
G1 X125.062 Y130.583 E-.26645
G1 X125.365 Y131.204 E-.26244
G1 X125.365 Y130.895 E-.11727
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.371 I.226 J-1.196 P1  F30000
G1 X117.712 Y129.449 Z1.371
G1 Z.971
G1 E.8 F1800
G1 F9000
G1 X116.733 Y129.449 E.03738
G1 X116.733 Y126.572 E.10997
G1 X117.712 Y126.572 E.03738
G1 X117.712 Y123.695 E.10997
G1 X116.733 Y123.695 E.03738
G1 X116.733 Y120.818 E.10997
G1 X117.712 Y120.818 E.03738
G1 X117.712 Y117.941 E.10997
G1 X116.733 Y117.941 E.03738
G1 X116.733 Y115.064 E.10997
G1 X117.712 Y115.064 E.03738
G1 X117.712 Y112.187 E.10997
G1 X116.733 Y112.187 E.03738
G1 X116.733 Y109.309 E.10997
G1 X117.712 Y109.309 E.03738
G1 X117.712 Y106.432 E.10997
G1 X116.733 Y106.432 E.03738
G1 X116.733 Y103.555 E.10997
G1 X117.712 Y103.555 E.03738
G1 X117.712 Y100.829 E.10422
G1 X117.862 Y100.678 E.00813
G1 X116.733 Y100.678 E.04313
; WIPE_START
G1 F24000
G1 X117.862 Y100.678 E-.4288
G1 X117.712 Y100.829 E-.08079
G1 X117.712 Y101.488 E-.25041
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.371 I-.744 J.963 P1  F30000
G1 X154.135 Y129.638 Z1.371
G1 Z.971
G1 E.8 F1800
G1 F9000
G1 X154.135 Y131.208 E.06003
G2 X154.712 Y129.936 I-13.258 J-6.771 E.05339
G1 X154.712 Y129.449 E.01862
G1 X154.135 Y129.449 E.02202
G1 X154.135 Y126.572 E.10997
G1 X154.712 Y126.572 E.02202
G1 X154.712 Y123.695 E.10997
G1 X154.135 Y123.695 E.02202
G1 X154.135 Y120.818 E.10997
G1 X154.712 Y120.818 E.02202
G1 X154.712 Y117.941 E.10997
G1 X154.135 Y117.941 E.02202
G1 X154.135 Y115.064 E.10997
G1 X154.712 Y115.064 E.02202
G1 X154.712 Y112.187 E.10997
G1 X154.135 Y112.187 E.02202
G1 X154.135 Y109.309 E.10997
G1 X154.712 Y109.309 E.02202
G1 X154.712 Y106.432 E.10997
G1 X154.135 Y106.432 E.02202
G1 X154.135 Y103.555 E.10997
G1 X154.712 Y103.555 E.02202
G1 X154.712 Y100.829 E.10422
G1 X154.862 Y100.678 E.00813
G1 X154.135 Y100.678 E.02776
; WIPE_START
G1 F24000
G1 X154.862 Y100.678 E-.27603
G1 X154.712 Y100.829 E-.08079
G1 X154.712 Y101.89 E-.40318
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.371 I.21 J1.199 P1  F30000
G1 X161.638 Y100.678 Z1.371
G1 Z.971
G1 E.8 F1800
G1 F9000
G1 X162.767 Y100.678 E.04313
G1 X162.767 Y103.555 E.10997
G1 X161.789 Y103.555 E.03738
G1 X161.789 Y106.432 E.10997
G1 X162.767 Y106.432 E.03738
G1 X162.767 Y109.309 E.10997
G1 X161.789 Y109.309 E.03738
G1 X161.789 Y112.187 E.10997
G1 X162.767 Y112.187 E.03738
G1 X162.767 Y115.064 E.10997
G1 X161.789 Y115.064 E.03738
G1 X161.789 Y117.941 E.10997
G1 X162.767 Y117.941 E.03738
G1 X162.767 Y120.818 E.10997
G1 X161.789 Y120.818 E.03738
G1 X161.789 Y123.695 E.10997
G1 X162.767 Y123.695 E.03738
G1 X162.767 Y126.572 E.10997
G1 X161.789 Y126.572 E.03738
G1 X161.789 Y129.449 E.10997
G1 X162.767 Y129.449 E.03738
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.0285714
; WIPE_START
G1 F24000
G1 X161.789 Y129.449 E-.37168
G1 X161.789 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/63
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
G3 Z1.371 I-1.083 J-.556 P1  F30000
G1 X160.648 Y130.649 Z1.371
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9334
G1 X163.201 Y130.649 E.08467
G3 X165.447 Y133.915 I.01 J2.399 E.15479
G3 X113.979 Y133.694 I-25.691 J-9.992 E2.20225
G3 X116.295 Y130.649 I2.311 J-.646 E.14689
G1 X118.852 Y130.649 E.08481
G1 X118.852 Y101.654 E.96182
G1 X123.648 Y101.654 E.15909
G1 X123.648 Y130.169 E.9459
G2 X155.852 Y130.169 I16.102 J-6.259 E1.37543
G1 X155.852 Y101.654 E.9459
G1 X160.648 Y101.654 E.15909
G1 X160.648 Y130.589 E.95983
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9334
G1 X163.208 Y130.257 E.06662
G3 X165.813 Y134.058 I.003 J2.791 E.16654
G3 X113.602 Y133.799 I-26.056 J-10.133 E2.07001
G3 X116.29 Y130.257 I2.688 J-.752 E.15813
G1 X118.46 Y130.257 E.06667
G1 X118.46 Y101.262 E.89093
G1 X124.04 Y101.262 E.17146
G1 X124.04 Y130.089 E.88579
G2 X155.46 Y130.089 I15.71 J-6.176 E1.24094
G1 X155.46 Y101.262 E.88579
G1 X161.04 Y101.262 E.17146
G1 X161.04 Y130.197 E.88908
M204 S10000
G1 X160.3 Y130.733 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9334
G1 X160.3 Y102.002 E.95305
G1 X156.2 Y102.002 E.13598
G1 X156.2 Y131.291 E.97156
G1 X160.3 Y131.291 E.13598
G1 X160.3 Y130.793 E.01652
G1 X159.893 Y127.829 F30000
G1 F9334
G1 X159.893 Y129.457 E.05401
G1 X158.466 Y130.884 E.06692
G1 X159.414 Y130.884 E.03143
G1 X156.608 Y128.077 E.13165
G1 X156.608 Y125.066 E.09988
G1 X159.893 Y121.781 E.15411
G1 X159.893 Y123.687 E.0632
G1 X156.608 Y120.401 E.15411
G1 X156.608 Y117.391 E.09988
G1 X159.893 Y114.105 E.15411
G1 X159.893 Y116.011 E.0632
G1 X156.608 Y112.726 E.15411
G1 X156.608 Y109.715 E.09988
G1 X159.893 Y106.429 E.15411
G1 X159.893 Y108.335 E.0632
G1 X156.608 Y105.05 E.15411
G1 X156.608 Y103.421 E.05401
; WIPE_START
G1 F24000
G1 X156.608 Y105.05 E-.61876
G1 X156.87 Y105.312 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.176 J.313 P1  F30000
G1 X163.733 Y131.073 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9334
G3 X164.992 Y132.034 I-.526 J1.995 E.05393
G1 X146.818 Y150.208 E.85257
G1 X147.762 Y149.936 E.03259
G1 X139.356 Y141.53 E.39431
G2 X140.148 Y141.526 I.358 J-7.139 E.02628
G1 X131.738 Y149.936 E.39451
G1 X132.682 Y150.208 E.03259
G1 X114.512 Y132.037 E.85242
G2 X114.27 Y133.401 I1.83 J1.027 E.04683
G2 X115.234 Y135.736 I17.422 J-5.826 E.08385
G1 X119.272 Y131.698 E.18943
G1 X121.848 Y131.698 E.08545
G1 X141.252 Y151.102 E.91029
G3 X138.248 Y151.102 I-1.506 J-26.348 E.09973
M73 P44 R10
G1 X157.652 Y131.698 E.91031
G1 X160.228 Y131.698 E.08545
G1 X164.266 Y135.736 E.18943
G3 X163.515 Y137.18 I-14.096 J-6.407 E.05402
G1 X153.508 Y134.926 F30000
G1 F9334
G2 X154.462 Y133.608 I-19.504 J-15.115 E.05401
G1 X161.344 Y140.49 E.32285
G3 X157.626 Y144.448 I-22.01 J-16.947 E.18042
G1 X150.808 Y137.63 E.31986
G3 X145.923 Y140.42 I-11.138 J-13.825 E.18742
G1 X153.128 Y147.626 E.33804
G3 X151.689 Y148.387 I-25.309 J-46.135 E.05401
G1 X127.814 Y148.388 F30000
G1 F9334
G3 X126.379 Y147.619 I12.014 J-24.141 E.05401
G1 X133.578 Y140.42 E.33771
G3 X128.692 Y137.63 I6.233 J-16.588 E.18743
G1 X121.875 Y144.447 E.31978
G3 X118.156 Y140.49 I18.189 J-20.818 E.18043
G1 X125.038 Y133.608 E.32284
G2 X125.993 Y134.926 I19.59 J-13.193 E.05401
G1 X123.3 Y130.198 F30000
G1 F9334
G1 X123.3 Y131.291 E.03624
G1 X119.2 Y131.291 E.13598
G1 X119.2 Y102.002 E.97156
G1 X123.3 Y102.002 E.13598
G1 X123.3 Y130.138 E.93333
G1 X119.608 Y127.829 F30000
G1 F9334
G1 X119.608 Y129.457 E.05401
G1 X121.034 Y130.884 E.06692
G1 X120.086 Y130.884 E.03143
G1 X122.893 Y128.077 E.13165
G1 X122.893 Y125.066 E.09988
G1 X119.608 Y121.781 E.15411
G1 X119.608 Y123.687 E.0632
G1 X122.893 Y120.401 E.15411
G1 X122.893 Y117.391 E.09988
G1 X119.608 Y114.105 E.15411
G1 X119.608 Y116.011 E.0632
G1 X122.893 Y112.726 E.15411
G1 X122.893 Y109.715 E.09988
G1 X119.607 Y106.429 E.15411
G1 X119.607 Y108.335 E.0632
G1 X122.893 Y105.05 E.15411
G1 X122.893 Y103.421 E.05401
M106 S239.7
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.893 Y105.05 E-.61876
G1 X122.63 Y105.312 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/63
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
G3 Z1.4 I-.675 J1.013 P1  F30000
G1 X160.648 Y130.649 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X163.202 Y130.649 E.08471
G3 X165.447 Y133.915 I.009 J2.399 E.15474
G3 X113.979 Y133.695 I-25.692 J-9.991 E2.20225
G3 X116.295 Y130.649 I2.31 J-.647 E.14692
G1 X118.852 Y130.649 E.08481
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.169 E.94607
G2 X155.852 Y130.169 I16.102 J-6.259 E1.37543
G1 X155.852 Y101.649 E.94607
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.589 E.95999
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.209 Y130.257 E.06663
G3 X165.813 Y134.057 I.002 J2.791 E.16653
G3 X113.602 Y133.801 I-26.056 J-10.133 E2.07001
G3 X116.29 Y130.257 I2.688 J-.753 E.15817
G1 X118.46 Y130.257 E.06667
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88595
G2 X155.46 Y130.089 I15.71 J-6.176 E1.24093
G1 X155.46 Y101.257 E.88595
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.648 J-1.03 P1  F30000
G1 X161.645 Y131.128 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.579324
G1 F11744.879
G1 X161.743 Y131.125 E.00426
G1 X160.664 Y131.013 F30000
; LINE_WIDTH: 0.363619
G1 F15000
G1 X160.664 Y131.334 E.0084
G1 X161.251 Y131.334 E.01535
; LINE_WIDTH: 0.3627
G1 X161.311 Y131.312 E.00166
; LINE_WIDTH: 0.401683
G1 X161.37 Y131.29 E.00186
; LINE_WIDTH: 0.440666
G1 X161.43 Y131.267 E.00206
; LINE_WIDTH: 0.479649
G1 F14425.422
G1 X161.489 Y131.245 E.00227
; LINE_WIDTH: 0.518632
G1 F13243.307
G1 X161.567 Y131.186 E.00378
; LINE_WIDTH: 0.548978
G1 F12449.167
G1 X161.645 Y131.128 E.00402
; LINE_WIDTH: 0.579324
G1 F11744.879
G1 X161.567 Y131.105 E.00358
; LINE_WIDTH: 0.536
G1 F12776.853
G1 X161.488 Y131.083 E.00329
; LINE_WIDTH: 0.492675
G1 F14007.645
G1 X161.409 Y131.06 E.003
; LINE_WIDTH: 0.44935
G1 F15000
G1 X161.33 Y131.037 E.00271
; LINE_WIDTH: 0.368518
G1 X161.252 Y131.015 E.00217
G1 X160.724 Y131.013 E.01401
G1 X160.481 Y131.269 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400014
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X156.222 Y131.269 E.21807
G1 X156.222 Y130.819 E.02304
G1 X160.278 Y130.819 E.2077
G1 X160.278 Y130.369 E.02304
G1 X156.222 Y130.369 E.2077
G1 X156.222 Y129.919 E.02304
G1 X160.278 Y129.919 E.2077
G1 X160.278 Y129.469 E.02304
G1 X156.222 Y129.469 E.2077
G1 X156.222 Y129.019 E.02304
G1 X160.278 Y129.019 E.2077
G1 X160.278 Y128.569 E.02304
G1 X156.222 Y128.569 E.2077
G1 X156.222 Y128.119 E.02304
G1 X160.278 Y128.119 E.2077
G1 X160.278 Y127.669 E.02304
G1 X156.222 Y127.669 E.2077
G1 X156.222 Y127.219 E.02304
G1 X160.278 Y127.219 E.2077
G1 X160.278 Y126.769 E.02304
G1 X156.222 Y126.769 E.2077
G1 X156.222 Y126.319 E.02304
G1 X160.278 Y126.319 E.2077
G1 X160.278 Y125.869 E.02304
G1 X156.222 Y125.869 E.2077
G1 X156.222 Y125.419 E.02304
G1 X160.278 Y125.419 E.2077
G1 X160.278 Y124.969 E.02304
G1 X156.222 Y124.969 E.2077
G1 X156.222 Y124.519 E.02304
G1 X160.278 Y124.519 E.2077
G1 X160.278 Y124.069 E.02304
G1 X156.222 Y124.069 E.2077
G1 X156.222 Y123.619 E.02304
G1 X160.278 Y123.619 E.2077
G1 X160.278 Y123.169 E.02304
G1 X156.222 Y123.169 E.2077
G1 X156.222 Y122.719 E.02304
G1 X160.278 Y122.719 E.2077
G1 X160.278 Y122.269 E.02304
G1 X156.222 Y122.269 E.2077
G1 X156.222 Y121.819 E.02304
G1 X160.278 Y121.819 E.2077
G1 X160.278 Y121.369 E.02304
G1 X156.222 Y121.369 E.2077
G1 X156.222 Y120.919 E.02304
G1 X160.278 Y120.919 E.2077
G1 X160.278 Y120.469 E.02304
G1 X156.222 Y120.469 E.2077
G1 X156.222 Y120.019 E.02304
G1 X160.278 Y120.019 E.2077
G1 X160.278 Y119.569 E.02304
G1 X156.222 Y119.569 E.2077
G1 X156.222 Y119.119 E.02304
G1 X160.278 Y119.119 E.2077
G1 X160.278 Y118.669 E.02304
G1 X156.222 Y118.669 E.2077
G1 X156.222 Y118.219 E.02304
G1 X160.278 Y118.219 E.2077
G1 X160.278 Y117.769 E.02304
G1 X156.222 Y117.769 E.2077
G1 X156.222 Y117.319 E.02304
G1 X160.278 Y117.319 E.2077
G1 X160.278 Y116.869 E.02304
G1 X156.222 Y116.869 E.2077
G1 X156.222 Y116.419 E.02304
G1 X160.278 Y116.419 E.2077
G1 X160.278 Y115.969 E.02304
G1 X156.222 Y115.969 E.2077
G1 X156.222 Y115.519 E.02304
G1 X160.278 Y115.519 E.2077
G1 X160.278 Y115.069 E.02304
G1 X156.222 Y115.069 E.2077
G1 X156.222 Y114.619 E.02304
G1 X160.278 Y114.619 E.2077
G1 X160.278 Y114.169 E.02304
G1 X156.222 Y114.169 E.2077
G1 X156.222 Y113.719 E.02304
G1 X160.278 Y113.719 E.2077
G1 X160.278 Y113.269 E.02304
G1 X156.222 Y113.269 E.2077
G1 X156.222 Y112.819 E.02304
G1 X160.278 Y112.819 E.2077
G1 X160.278 Y112.369 E.02304
G1 X156.222 Y112.369 E.2077
G1 X156.222 Y111.919 E.02304
G1 X160.278 Y111.919 E.2077
G1 X160.278 Y111.469 E.02304
G1 X156.222 Y111.469 E.2077
G1 X156.222 Y111.019 E.02304
G1 X160.278 Y111.019 E.2077
G1 X160.278 Y110.569 E.02304
G1 X156.222 Y110.569 E.2077
G1 X156.222 Y110.119 E.02304
G1 X160.278 Y110.119 E.2077
G1 X160.278 Y109.669 E.02304
G1 X156.222 Y109.669 E.2077
G1 X156.222 Y109.219 E.02304
G1 X160.278 Y109.219 E.2077
G1 X160.278 Y108.769 E.02304
G1 X156.222 Y108.769 E.2077
M73 P45 R10
G1 X156.222 Y108.319 E.02304
G1 X160.278 Y108.319 E.2077
G1 X160.278 Y107.869 E.02304
G1 X156.222 Y107.869 E.2077
G1 X156.222 Y107.419 E.02304
G1 X160.278 Y107.419 E.2077
G1 X160.278 Y106.969 E.02304
G1 X156.222 Y106.969 E.2077
G1 X156.222 Y106.519 E.02304
G1 X160.278 Y106.519 E.2077
G1 X160.278 Y106.069 E.02304
G1 X156.222 Y106.069 E.2077
G1 X156.222 Y105.619 E.02304
G1 X160.278 Y105.619 E.2077
G1 X160.278 Y105.169 E.02304
G1 X156.222 Y105.169 E.2077
G1 X156.222 Y104.719 E.02304
G1 X160.278 Y104.719 E.2077
G1 X160.278 Y104.269 E.02304
G1 X156.222 Y104.269 E.2077
G1 X156.222 Y103.818 E.02304
G1 X160.278 Y103.818 E.2077
G1 X160.278 Y103.368 E.02304
G1 X156.222 Y103.368 E.2077
G1 X156.222 Y102.918 E.02304
G1 X160.278 Y102.918 E.2077
G1 X160.278 Y102.468 E.02304
G1 X156.222 Y102.468 E.2077
G1 X156.222 Y102.018 E.02304
G1 X160.481 Y102.018 E.21807
M106 S239.7
; WIPE_START
G1 F24000
G1 X158.481 Y102.018 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.205 J.172 P1  F30000
G1 X163.515 Y137.18 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G2 X164.266 Y135.736 I-13.202 J-7.782 E.05402
G1 X160.228 Y131.698 E.18942
G1 X157.652 Y131.698 E.08545
G1 X138.249 Y151.101 E.91025
G2 X141.251 Y151.101 I1.501 J-26.459 E.09966
G1 X121.848 Y131.698 E.91025
G1 X119.272 Y131.698 E.08545
G1 X115.234 Y135.736 E.18942
G3 X114.271 Y133.402 I16.544 J-8.198 E.08381
G3 X114.512 Y132.037 I2.073 J-.338 E.04686
G1 X132.683 Y150.209 E.85246
G1 X131.739 Y149.935 E.03261
G1 X140.149 Y141.525 E.39452
G3 X139.357 Y141.53 I-.443 J-6.984 E.0263
G1 X147.761 Y149.935 E.39427
G1 X146.817 Y150.209 E.03261
G1 X164.992 Y132.034 E.85261
G2 X163.733 Y131.073 I-1.784 J1.031 E.05392
G1 X155.824 Y131.253 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.439214
G1 F15000
G1 X155.749 Y131.296 E.00277
G1 X155.814 Y131.334 E.00243
G1 X153.507 Y134.926 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X154.461 Y133.607 I-19.244 J-14.922 E.05401
G1 X161.344 Y140.49 E.32287
G3 X157.626 Y144.448 I-22.072 J-17.003 E.18042
G1 X150.807 Y137.629 E.3199
G3 X145.923 Y140.42 I-11.14 J-13.825 E.18741
G1 X153.129 Y147.626 E.33805
G3 X151.689 Y148.386 I-24.13 J-43.992 E.05401
; WIPE_START
G1 F24000
G1 X153.129 Y147.626 E-.61864
G1 X152.866 Y147.363 E-.14136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.51 J-1.105 P1  F30000
G1 X117.699 Y131.121 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.577272
G1 F11789.981
G1 X117.79 Y131.126 E.00398
G1 X118.836 Y131.013 F30000
; LINE_WIDTH: 0.363899
G1 F15000
G1 X118.244 Y131.013 E.01548
; LINE_WIDTH: 0.363649
G1 X118.165 Y131.036 E.00215
; LINE_WIDTH: 0.405816
G1 X118.087 Y131.06 E.00243
; LINE_WIDTH: 0.447982
G1 X118.008 Y131.083 E.00271
; LINE_WIDTH: 0.490148
G1 F14086.788
G1 X117.929 Y131.106 E.003
; LINE_WIDTH: 0.532314
G1 F12873.068
G1 X117.85 Y131.129 E.00328
; LINE_WIDTH: 0.57448
G1 F11851.908
G1 X117.929 Y131.17 E.00385
; LINE_WIDTH: 0.532314
G1 F12873.068
G1 X118.008 Y131.211 E.00355
; LINE_WIDTH: 0.490148
G1 F14086.788
G1 X118.087 Y131.252 E.00324
; LINE_WIDTH: 0.447982
G1 F15000
G1 X118.166 Y131.293 E.00294
; LINE_WIDTH: 0.3677
G1 X118.245 Y131.334 E.00235
G1 X118.836 Y131.334 E.01566
G1 X118.836 Y131.073 E.00691
G1 X127.811 Y148.386 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X126.372 Y147.626 I22.419 J-44.237 E.054
G1 X133.577 Y140.421 E.33805
G3 X128.693 Y137.629 I6.194 J-16.504 E.18742
G1 X121.875 Y144.447 E.31987
G3 X118.156 Y140.49 I18.238 J-20.863 E.18042
G1 X125.038 Y133.608 E.32285
G2 X125.994 Y134.926 I19.219 J-12.926 E.05401
G1 X123.723 Y131.257 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.433624
G1 F15000
G1 X123.65 Y131.299 E.00269
G1 X123.713 Y131.336 E.00234
G1 X123.481 Y131.269 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400014
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X119.222 Y131.269 E.21807
G1 X119.222 Y130.819 E.02304
G1 X123.278 Y130.819 E.2077
G1 X123.278 Y130.369 E.02304
G1 X119.222 Y130.369 E.2077
G1 X119.222 Y129.919 E.02304
G1 X123.278 Y129.919 E.2077
G1 X123.278 Y129.469 E.02304
G1 X119.222 Y129.469 E.2077
G1 X119.222 Y129.019 E.02304
G1 X123.278 Y129.019 E.2077
G1 X123.278 Y128.569 E.02304
G1 X119.222 Y128.569 E.2077
G1 X119.222 Y128.119 E.02304
G1 X123.278 Y128.119 E.2077
G1 X123.278 Y127.669 E.02304
G1 X119.222 Y127.669 E.2077
G1 X119.222 Y127.219 E.02304
G1 X123.278 Y127.219 E.2077
G1 X123.278 Y126.769 E.02304
G1 X119.222 Y126.769 E.2077
G1 X119.222 Y126.319 E.02304
G1 X123.278 Y126.319 E.2077
G1 X123.278 Y125.869 E.02304
G1 X119.222 Y125.869 E.2077
G1 X119.222 Y125.419 E.02304
G1 X123.278 Y125.419 E.2077
G1 X123.278 Y124.969 E.02304
G1 X119.222 Y124.969 E.2077
G1 X119.222 Y124.519 E.02304
G1 X123.278 Y124.519 E.2077
G1 X123.278 Y124.069 E.02304
G1 X119.222 Y124.069 E.2077
G1 X119.222 Y123.619 E.02304
G1 X123.278 Y123.619 E.2077
G1 X123.278 Y123.169 E.02304
G1 X119.222 Y123.169 E.2077
G1 X119.222 Y122.719 E.02304
G1 X123.278 Y122.719 E.2077
G1 X123.278 Y122.269 E.02304
G1 X119.222 Y122.269 E.2077
G1 X119.222 Y121.819 E.02304
G1 X123.278 Y121.819 E.2077
G1 X123.278 Y121.369 E.02304
G1 X119.222 Y121.369 E.2077
G1 X119.222 Y120.919 E.02304
G1 X123.278 Y120.919 E.2077
G1 X123.278 Y120.469 E.02304
G1 X119.222 Y120.469 E.2077
G1 X119.222 Y120.019 E.02304
G1 X123.278 Y120.019 E.2077
G1 X123.278 Y119.569 E.02304
G1 X119.222 Y119.569 E.2077
G1 X119.222 Y119.119 E.02304
G1 X123.278 Y119.119 E.2077
G1 X123.278 Y118.669 E.02304
G1 X119.222 Y118.669 E.2077
G1 X119.222 Y118.219 E.02304
G1 X123.278 Y118.219 E.2077
G1 X123.278 Y117.769 E.02304
G1 X119.222 Y117.769 E.2077
G1 X119.222 Y117.319 E.02304
G1 X123.278 Y117.319 E.2077
G1 X123.278 Y116.869 E.02304
G1 X119.222 Y116.869 E.2077
G1 X119.222 Y116.419 E.02304
G1 X123.278 Y116.419 E.2077
G1 X123.278 Y115.969 E.02304
G1 X119.222 Y115.969 E.2077
G1 X119.222 Y115.519 E.02304
G1 X123.278 Y115.519 E.2077
G1 X123.278 Y115.069 E.02304
G1 X119.222 Y115.069 E.2077
G1 X119.222 Y114.619 E.02304
G1 X123.278 Y114.619 E.2077
G1 X123.278 Y114.169 E.02304
G1 X119.222 Y114.169 E.2077
G1 X119.222 Y113.719 E.02304
G1 X123.278 Y113.719 E.2077
G1 X123.278 Y113.269 E.02304
G1 X119.222 Y113.269 E.2077
G1 X119.222 Y112.819 E.02304
G1 X123.278 Y112.819 E.2077
G1 X123.278 Y112.369 E.02304
G1 X119.222 Y112.369 E.2077
G1 X119.222 Y111.919 E.02304
G1 X123.278 Y111.919 E.2077
G1 X123.278 Y111.469 E.02304
G1 X119.222 Y111.469 E.2077
G1 X119.222 Y111.019 E.02304
G1 X123.278 Y111.019 E.2077
G1 X123.278 Y110.569 E.02304
G1 X119.222 Y110.569 E.2077
G1 X119.222 Y110.119 E.02304
G1 X123.278 Y110.119 E.2077
G1 X123.278 Y109.669 E.02304
G1 X119.222 Y109.669 E.2077
G1 X119.222 Y109.219 E.02304
G1 X123.278 Y109.219 E.2077
G1 X123.278 Y108.769 E.02304
G1 X119.222 Y108.769 E.2077
G1 X119.222 Y108.319 E.02304
G1 X123.278 Y108.319 E.2077
G1 X123.278 Y107.869 E.02304
G1 X119.222 Y107.869 E.2077
G1 X119.222 Y107.419 E.02304
G1 X123.278 Y107.419 E.2077
G1 X123.278 Y106.969 E.02304
G1 X119.222 Y106.969 E.2077
G1 X119.222 Y106.519 E.02304
G1 X123.278 Y106.519 E.2077
G1 X123.278 Y106.069 E.02304
G1 X119.222 Y106.069 E.2077
G1 X119.222 Y105.619 E.02304
G1 X123.278 Y105.619 E.2077
G1 X123.278 Y105.169 E.02304
G1 X119.222 Y105.169 E.2077
G1 X119.222 Y104.719 E.02304
G1 X123.278 Y104.719 E.2077
G1 X123.278 Y104.269 E.02304
G1 X119.222 Y104.269 E.2077
G1 X119.222 Y103.818 E.02304
G1 X123.278 Y103.818 E.2077
G1 X123.278 Y103.368 E.02304
G1 X119.222 Y103.368 E.2077
G1 X119.222 Y102.918 E.02304
G1 X123.278 Y102.918 E.2077
G1 X123.278 Y102.468 E.02304
G1 X119.222 Y102.468 E.2077
G1 X119.222 Y102.018 E.02304
G1 X123.481 Y102.018 E.21807
M106 S239.7
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 1.22857
; LAYER_HEIGHT: 0.0285714
; WIPE_START
G1 F24000
G1 X121.481 Y102.018 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/63
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
G3 Z1.6 I.475 J1.121 P1  F30000
G1 X124.643 Y100.678 Z1.6
G1 Z1.229
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X125.365 Y100.678 E.02757
G1 X125.365 Y103.555 E.10997
G1 X124.789 Y103.555 E.02202
G1 X124.789 Y106.432 E.10997
G1 X125.365 Y106.432 E.02202
G1 X125.365 Y109.309 E.10997
G1 X124.789 Y109.309 E.02202
G1 X124.789 Y112.187 E.10997
G1 X125.365 Y112.187 E.02202
M73 P46 R10
G1 X125.365 Y115.064 E.10997
G1 X124.789 Y115.064 E.02202
G1 X124.789 Y117.941 E.10997
G1 X125.365 Y117.941 E.02202
G1 X125.365 Y120.818 E.10997
G1 X124.789 Y120.818 E.02202
G1 X124.789 Y123.695 E.10997
G1 X125.365 Y123.695 E.02202
G1 X125.365 Y126.572 E.10997
G1 X124.789 Y126.572 E.02202
G1 X124.789 Y129.449 E.10997
G1 X125.365 Y129.449 E.02202
G1 X125.365 Y131.208 E.06724
G1 X125.188 Y130.842 E.01555
G3 X124.789 Y129.638 I2.667 J-1.552 E.04884
; WIPE_START
G1 F24000
G1 X124.789 Y129.937 E-.11384
G1 X125.188 Y130.842 E-.37578
G1 X125.365 Y131.208 E-.15458
G1 X125.365 Y130.903 E-.1158
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.629 I.227 J-1.196 P1  F30000
G1 X117.712 Y129.449 Z1.629
G1 Z1.229
G1 E.8 F1800
G1 F9000
G1 X116.733 Y129.449 E.03738
G1 X116.733 Y126.572 E.10997
G1 X117.712 Y126.572 E.03738
G1 X117.712 Y123.695 E.10997
G1 X116.733 Y123.695 E.03738
G1 X116.733 Y120.818 E.10997
G1 X117.712 Y120.818 E.03738
G1 X117.712 Y117.941 E.10997
G1 X116.733 Y117.941 E.03738
G1 X116.733 Y115.064 E.10997
G1 X117.712 Y115.064 E.03738
G1 X117.712 Y112.187 E.10997
G1 X116.733 Y112.187 E.03738
G1 X116.733 Y109.309 E.10997
G1 X117.712 Y109.309 E.03738
G1 X117.712 Y106.432 E.10997
G1 X116.733 Y106.432 E.03738
G1 X116.733 Y103.555 E.10997
G1 X117.712 Y103.555 E.03738
G1 X117.712 Y100.824 E.10441
G1 X117.857 Y100.678 E.00785
G1 X116.733 Y100.678 E.04294
; WIPE_START
G1 F24000
G1 X117.857 Y100.678 E-.42688
G1 X117.712 Y100.824 E-.07807
G1 X117.712 Y101.495 E-.25505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.629 I-.744 J.963 P1  F30000
G1 X154.135 Y129.638 Z1.629
G1 Z1.229
G1 E.8 F1800
G1 F9000
G1 X154.135 Y131.208 E.06004
G2 X154.712 Y129.937 I-13.119 J-6.712 E.05336
G1 X154.712 Y129.449 E.01866
G1 X154.135 Y129.449 E.02202
G1 X154.135 Y126.572 E.10997
G1 X154.712 Y126.572 E.02202
G1 X154.712 Y123.695 E.10997
G1 X154.135 Y123.695 E.02202
G1 X154.135 Y120.818 E.10997
G1 X154.712 Y120.818 E.02202
G1 X154.712 Y117.941 E.10997
G1 X154.135 Y117.941 E.02202
G1 X154.135 Y115.064 E.10997
G1 X154.712 Y115.064 E.02202
G1 X154.712 Y112.187 E.10997
G1 X154.135 Y112.187 E.02202
G1 X154.135 Y109.309 E.10997
G1 X154.712 Y109.309 E.02202
G1 X154.712 Y106.432 E.10997
G1 X154.135 Y106.432 E.02202
G1 X154.135 Y103.555 E.10997
G1 X154.712 Y103.555 E.02202
G1 X154.712 Y100.824 E.10441
G1 X154.857 Y100.678 E.00785
G1 X154.135 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X154.857 Y100.678 E-.27411
G1 X154.712 Y100.824 E-.07807
G1 X154.712 Y101.897 E-.40783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.629 I.211 J1.199 P1  F30000
G1 X161.643 Y100.678 Z1.629
G1 Z1.229
G1 E.8 F1800
G1 F9000
G1 X162.767 Y100.678 E.04294
G1 X162.767 Y103.555 E.10997
G1 X161.789 Y103.555 E.03738
G1 X161.789 Y106.432 E.10997
G1 X162.767 Y106.432 E.03738
G1 X162.767 Y109.309 E.10997
G1 X161.789 Y109.309 E.03738
G1 X161.789 Y112.187 E.10997
G1 X162.767 Y112.187 E.03738
G1 X162.767 Y115.064 E.10997
G1 X161.789 Y115.064 E.03738
G1 X161.789 Y117.941 E.10997
G1 X162.767 Y117.941 E.03738
G1 X162.767 Y120.818 E.10997
G1 X161.789 Y120.818 E.03738
G1 X161.789 Y123.695 E.10997
G1 X162.767 Y123.695 E.03738
G1 X162.767 Y126.572 E.10997
G1 X161.789 Y126.572 E.03738
G1 X161.789 Y129.449 E.10997
G1 X162.767 Y129.449 E.03738
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.171429
; WIPE_START
G1 F24000
G1 X161.789 Y129.449 E-.37168
G1 X161.789 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/63
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
G3 Z1.629 I-1.083 J-.556 P1  F30000
G1 X160.648 Y130.649 Z1.629
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F14557
G1 X163.203 Y130.649 E.08476
G3 X165.447 Y133.915 I.008 J2.399 E.15469
G3 X113.98 Y133.696 I-25.692 J-9.99 E2.20224
G3 X116.295 Y130.649 I2.31 J-.648 E.14696
G1 X118.852 Y130.649 E.08481
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.169 E.94607
G2 X155.852 Y130.169 I16.102 J-6.26 E1.37541
G1 X155.852 Y101.649 E.94607
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.589 E.95999
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.209 Y130.257 E.06665
G3 X165.813 Y134.057 I.002 J2.791 E.16651
G3 X113.602 Y133.802 I-26.056 J-10.132 E2.07
G3 X116.29 Y130.257 I2.688 J-.754 E.15821
G1 X118.46 Y130.257 E.06667
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88595
G2 X155.46 Y130.089 I15.71 J-6.177 E1.24092
G1 X155.46 Y101.257 E.88595
M73 P46 R9
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.648 J-1.03 P1  F30000
G1 X161.645 Y131.128 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57933
G1 F11744.749
G1 X161.743 Y131.125 E.00425
G1 X158.096 Y129.454 F30000
; LINE_WIDTH: 0.351907
G1 F14557
G1 X158.405 Y129.454 E.00778
G1 X158.405 Y103.892 E.64362
G1 X158.096 Y103.892 E.00778
G1 X158.096 Y129.394 E.64211
G1 X157.753 Y129.798 F30000
; LINE_WIDTH: 0.419999
G1 F14557
G1 X158.748 Y129.798 E.03058
G1 X158.748 Y103.549 E.80654
G1 X157.753 Y103.549 E.03058
G1 X157.753 Y129.738 E.8047
G1 X157.375 Y130.175 F30000
G1 F14557
G1 X159.125 Y130.175 E.05375
G1 X159.125 Y103.172 E.82971
G1 X157.375 Y103.172 E.05375
G1 X157.375 Y130.115 E.82787
G1 X156.998 Y130.211 F30000
G1 F14557
G1 X156.928 Y130.552 E.01069
G1 X159.502 Y130.552 E.07908
G1 X159.502 Y102.795 E.85289
G1 X156.998 Y102.795 E.07692
G1 X156.998 Y130.151 E.84057
G1 X156.363 Y130.929 F30000
G1 F14557
G1 X159.956 Y130.929 E.11041
G1 X159.879 Y130.851 E.00336
G1 X159.879 Y102.418 E.87368
G1 X156.621 Y102.418 E.10009
G1 X156.621 Y130.211 E.854
G1 X156.575 Y130.434 E.00701
G1 X156.386 Y130.874 E.0147
G1 X155.79 Y131.306 F30000
G1 F14557
G1 X159.801 Y131.306 E.12325
G1 X160.122 Y131.32 E.00987
; LINE_WIDTH: 0.372345
G2 X161.251 Y131.334 I.739 J-13.363 E.03031
; LINE_WIDTH: 0.362705
G1 X161.311 Y131.312 E.00166
; LINE_WIDTH: 0.401685
G1 X161.37 Y131.29 E.00186
; LINE_WIDTH: 0.440665
G1 X161.43 Y131.267 E.00206
; LINE_WIDTH: 0.479645
G1 F14425.579
G1 X161.489 Y131.245 E.00227
; LINE_WIDTH: 0.518624
G1 F13243.53
G1 X161.567 Y131.186 E.00378
; LINE_WIDTH: 0.548977
G1 F12449.19
G1 X161.645 Y131.128 E.00402
; LINE_WIDTH: 0.57933
G1 F11744.749
G1 X161.567 Y131.105 E.00358
; LINE_WIDTH: 0.536005
G1 F12776.701
G1 X161.488 Y131.083 E.00329
; LINE_WIDTH: 0.49268
G1 F14007.471
G1 X161.409 Y131.06 E.003
; LINE_WIDTH: 0.449355
G1 F14557
G1 X161.33 Y131.037 E.00271
; LINE_WIDTH: 0.366693
G1 X161.252 Y131.015 E.00216
G1 X160.444 Y131.012 E.02132
; LINE_WIDTH: 0.364444
G1 X160.35 Y130.932 E.00324
; LINE_WIDTH: 0.419944
G1 X160.256 Y130.851 E.0038
G1 X160.256 Y102.041 E.88514
G1 X156.244 Y102.041 E.12325
G1 X156.244 Y130.211 E.86546
G1 X156.229 Y130.285 E.00234
G1 X155.814 Y131.251 E.03229
G1 X153.507 Y134.926 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14557
G2 X154.461 Y133.607 I-18.97 J-14.721 E.05401
G1 X161.344 Y140.49 E.32289
G3 X157.627 Y144.449 I-22.134 J-17.06 E.18042
G1 X150.807 Y137.629 E.31992
G3 X145.923 Y140.421 I-11.081 J-13.721 E.18742
G1 X153.129 Y147.627 E.33806
G3 X151.689 Y148.385 I-23.434 J-42.757 E.05401
G1 X163.514 Y137.18 F30000
G1 F14557
G2 X164.266 Y135.736 I-13.068 J-7.717 E.05402
G1 X160.228 Y131.698 E.18942
G1 X157.652 Y131.698 E.08545
G1 X138.25 Y151.1 E.91021
G2 X141.251 Y151.1 I1.5 J-26.168 E.0996
G1 X121.848 Y131.698 E.91021
G1 X119.272 Y131.698 E.08545
G1 X115.235 Y135.736 E.18942
G3 X114.271 Y133.404 I16.632 J-8.238 E.08377
G3 X114.512 Y132.037 I2.075 J-.339 E.04689
G1 X132.684 Y150.21 E.85251
G1 X131.74 Y149.934 E.03264
G1 X140.15 Y141.524 E.39454
G3 X139.357 Y141.531 I-.452 J-6.835 E.02632
G1 X147.761 Y149.934 E.39424
G1 X146.816 Y150.21 E.03264
G1 X164.992 Y132.034 E.85267
G2 X163.734 Y131.068 I-1.779 J1.015 E.05401
; WIPE_START
G1 F24000
G1 X164.451 Y131.415 E-.30262
G1 X164.811 Y131.766 E-.19103
G1 X164.992 Y132.034 E-.12298
G1 X164.725 Y132.301 E-.14338
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.082 J-1.214 P1  F30000
G1 X125.994 Y134.925 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F14557
G3 X125.038 Y133.608 I17.924 J-14 E.05401
G1 X118.156 Y140.49 E.32287
G2 X121.875 Y144.447 I22.009 J-16.955 E.18042
G1 X128.694 Y137.628 E.31989
G2 X133.577 Y140.421 I11.073 J-13.7 E.18741
G1 X126.371 Y147.627 E.33806
G2 X127.812 Y148.385 I23.178 J-42.273 E.054
G1 X117.699 Y131.121 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.577284
G1 F11789.717
G1 X117.79 Y131.126 E.00398
G1 X121.405 Y129.454 F30000
; LINE_WIDTH: 0.351907
G1 F14557
G1 X121.405 Y103.892 E.64362
G1 X121.096 Y103.892 E.00778
G1 X121.096 Y129.454 E.64362
G1 X121.345 Y129.454 E.00627
G1 X121.748 Y129.798 F30000
; LINE_WIDTH: 0.419999
G1 F14557
G1 X121.748 Y103.549 E.80654
G1 X120.753 Y103.549 E.03058
G1 X120.753 Y129.798 E.80654
G1 X121.688 Y129.798 E.02873
G1 X122.125 Y130.175 F30000
G1 F14557
G1 X122.125 Y103.172 E.82971
G1 X120.375 Y103.172 E.05375
G1 X120.375 Y130.175 E.82971
G1 X122.065 Y130.175 E.0519
G1 X122.502 Y130.21 F30000
G1 F14557
G1 X122.502 Y102.795 E.8424
G1 X119.998 Y102.795 E.07692
M73 P47 R9
G1 X119.998 Y130.552 E.85289
G1 X122.571 Y130.552 E.07905
G1 X122.514 Y130.269 E.00886
G1 X123.135 Y130.929 F30000
G1 F14557
G1 X122.924 Y130.431 E.01661
G1 X122.879 Y130.21 E.00692
G1 X122.879 Y102.418 E.85398
G1 X119.621 Y102.418 E.10009
G1 X119.621 Y130.852 E.8737
G1 X119.557 Y130.929 E.00308
G1 X123.075 Y130.929 E.10809
G1 X123.256 Y129.3 F30000
G1 F14557
G1 X123.256 Y102.041 E.8376
G1 X119.244 Y102.041 E.12327
G1 X119.244 Y130.852 E.88529
G1 X119.15 Y130.932 E.0038
; LINE_WIDTH: 0.367819
G1 X119.056 Y131.013 E.00328
G1 X118.244 Y131.013 E.02149
; LINE_WIDTH: 0.363655
G1 X118.165 Y131.036 E.00215
; LINE_WIDTH: 0.405822
G1 X118.087 Y131.06 E.00243
; LINE_WIDTH: 0.447989
G1 X118.008 Y131.083 E.00271
; LINE_WIDTH: 0.490155
G1 F14086.56
G1 X117.929 Y131.106 E.003
; LINE_WIDTH: 0.532322
G1 F12872.869
G1 X117.85 Y131.129 E.00328
; LINE_WIDTH: 0.574488
G1 F11851.73
G1 X117.929 Y131.17 E.00385
; LINE_WIDTH: 0.532322
G1 F12872.869
G1 X118.008 Y131.211 E.00355
; LINE_WIDTH: 0.490155
G1 F14086.56
G1 X118.087 Y131.252 E.00324
; LINE_WIDTH: 0.447989
G1 F14557
G1 X118.166 Y131.293 E.00294
; LINE_WIDTH: 0.36782
G1 X118.245 Y131.334 E.00235
G1 X119.056 Y131.334 E.02149
; LINE_WIDTH: 0.364122
G1 X119.377 Y131.32 E.00841
; LINE_WIDTH: 0.41859
G1 X119.698 Y131.306 E.00984
G1 X123.71 Y131.306 E.1228
G3 X123.271 Y130.284 I10.608 J-5.158 E.03406
G1 X123.257 Y129.36 E.02828
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 1.48571
; LAYER_HEIGHT: 0.0857143
; WIPE_START
G1 F24000
G1 X123.271 Y130.284 E-.35109
G1 X123.695 Y131.273 E-.40891
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/63
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
G3 Z1.8 I1.012 J.676 P1  F30000
G1 X124.789 Y129.638 Z1.8
G1 Z1.486
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G2 X125.187 Y130.84 I3.057 J-.345 E.04878
G1 X125.365 Y131.208 E.01562
G1 X125.365 Y129.449 E.06725
G1 X124.789 Y129.449 E.02202
G1 X124.789 Y126.572 E.10997
G1 X125.365 Y126.572 E.02202
G1 X125.365 Y123.695 E.10997
G1 X124.789 Y123.695 E.02202
G1 X124.789 Y120.818 E.10997
G1 X125.365 Y120.818 E.02202
G1 X125.365 Y117.941 E.10997
G1 X124.789 Y117.941 E.02202
G1 X124.789 Y115.064 E.10997
G1 X125.365 Y115.064 E.02202
G1 X125.365 Y112.187 E.10997
G1 X124.789 Y112.187 E.02202
G1 X124.789 Y109.309 E.10997
G1 X125.365 Y109.309 E.02202
G1 X125.365 Y106.432 E.10997
G1 X124.789 Y106.432 E.02202
G1 X124.789 Y103.555 E.10997
G1 X125.365 Y103.555 E.02202
G1 X125.365 Y100.678 E.10997
G1 X124.643 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X125.365 Y100.678 E-.27411
G1 X125.365 Y101.957 E-.48589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.886 I.178 J-1.204 P1  F30000
G1 X116.733 Y100.678 Z1.886
G1 Z1.486
G1 E.8 F1800
G1 F9000
G1 X117.857 Y100.678 E.04294
G1 X117.712 Y100.824 E.00785
G1 X117.712 Y103.555 E.10441
G1 X116.733 Y103.555 E.03738
G1 X116.733 Y106.432 E.10997
G1 X117.712 Y106.432 E.03738
G1 X117.712 Y109.309 E.10997
G1 X116.733 Y109.309 E.03738
G1 X116.733 Y112.187 E.10997
G1 X117.712 Y112.187 E.03738
G1 X117.712 Y115.064 E.10997
G1 X116.733 Y115.064 E.03738
G1 X116.733 Y117.941 E.10997
G1 X117.712 Y117.941 E.03738
G1 X117.712 Y120.818 E.10997
G1 X116.733 Y120.818 E.03738
G1 X116.733 Y123.695 E.10997
G1 X117.712 Y123.695 E.03738
G1 X117.712 Y126.572 E.10997
G1 X116.733 Y126.572 E.03738
G1 X116.733 Y129.449 E.10997
G1 X117.712 Y129.449 E.03738
; WIPE_START
G1 F24000
G1 X116.733 Y129.449 E-.37168
G1 X116.733 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.886 I-.039 J1.216 P1  F30000
G1 X154.135 Y129.638 Z1.886
G1 Z1.486
G1 E.8 F1800
G1 F9000
G1 X154.135 Y131.209 E.06005
G2 X154.712 Y129.937 I-13.367 J-6.823 E.05337
G1 X154.712 Y129.449 E.01866
G1 X154.135 Y129.449 E.02202
G1 X154.135 Y126.572 E.10997
G1 X154.712 Y126.572 E.02202
G1 X154.712 Y123.695 E.10997
G1 X154.135 Y123.695 E.02202
G1 X154.135 Y120.818 E.10997
G1 X154.712 Y120.818 E.02202
G1 X154.712 Y117.941 E.10997
G1 X154.135 Y117.941 E.02202
G1 X154.135 Y115.064 E.10997
G1 X154.712 Y115.064 E.02202
G1 X154.712 Y112.187 E.10997
G1 X154.135 Y112.187 E.02202
G1 X154.135 Y109.309 E.10997
G1 X154.712 Y109.309 E.02202
G1 X154.712 Y106.432 E.10997
G1 X154.135 Y106.432 E.02202
G1 X154.135 Y103.555 E.10997
G1 X154.712 Y103.555 E.02202
G1 X154.712 Y100.824 E.10441
G1 X154.857 Y100.678 E.00785
G1 X154.135 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X154.857 Y100.678 E-.27411
G1 X154.712 Y100.824 E-.07807
G1 X154.712 Y101.897 E-.40783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.886 I.211 J1.199 P1  F30000
G1 X161.643 Y100.678 Z1.886
G1 Z1.486
G1 E.8 F1800
G1 F9000
G1 X162.767 Y100.678 E.04294
G1 X162.767 Y103.555 E.10997
G1 X161.789 Y103.555 E.03738
G1 X161.789 Y106.432 E.10997
G1 X162.767 Y106.432 E.03738
G1 X162.767 Y109.309 E.10997
G1 X161.789 Y109.309 E.03738
G1 X161.789 Y112.187 E.10997
G1 X162.767 Y112.187 E.03738
G1 X162.767 Y115.064 E.10997
G1 X161.789 Y115.064 E.03738
G1 X161.789 Y117.941 E.10997
G1 X162.767 Y117.941 E.03738
G1 X162.767 Y120.818 E.10997
G1 X161.789 Y120.818 E.03738
G1 X161.789 Y123.695 E.10997
G1 X162.767 Y123.695 E.03738
G1 X162.767 Y126.572 E.10997
G1 X161.789 Y126.572 E.03738
G1 X161.789 Y129.449 E.10997
G1 X162.767 Y129.449 E.03738
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.114286
; WIPE_START
G1 F24000
G1 X161.789 Y129.449 E-.37168
G1 X161.789 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/63
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
G3 Z1.886 I-1.044 J-.626 P1  F30000
G1 X160.172 Y131.124 Z1.886
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X162.568 Y131.124 E.07947
G1 X162.568 Y130.649 E.01578
G3 X163.803 Y130.723 I.318 J5.023 E.04115
G3 X165.447 Y133.915 I-.599 J2.328 E.1345
G3 X113.98 Y133.697 I-25.692 J-9.989 E2.20224
G3 X116.295 Y130.649 I2.31 J-.649 E.14699
G1 X116.932 Y130.649 E.02113
G1 X116.932 Y131.124 E.01578
G1 X124.057 Y131.124 E.23635
G2 X155.444 Y131.124 I15.693 J-7.202 E1.30653
G1 X160.112 Y131.124 E.15487
; WIPE_START
G1 F24000
G1 X162.112 Y131.124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.766 J-.946 P1  F30000
G1 X161.04 Y130.257 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.21 Y130.257 E.06667
G3 X165.813 Y134.057 I.001 J2.791 E.16649
G3 X113.603 Y133.803 I-26.056 J-10.131 E2.06999
G3 X116.291 Y130.257 I2.687 J-.755 E.15825
G1 X118.46 Y130.257 E.06666
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88595
G2 X155.46 Y130.089 I15.71 J-6.177 E1.24092
G1 X155.46 Y101.257 E.88595
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
G1 X160.75 Y130.902 F30000
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X161.188 Y130.464 E.01903
G1 X160.833 Y130.286
G1 X160.217 Y130.902 E.02675
G1 X159.684 Y130.902
G1 X160.833 Y129.753 E.04992
G1 X160.833 Y129.22
G1 X159.151 Y130.902 E.0731
G1 X158.617 Y130.902
G1 X160.833 Y128.687 E.09627
G1 X160.833 Y128.153
G1 X158.084 Y130.902 E.11944
G1 X157.551 Y130.902
G1 X160.833 Y127.62 E.14262
G1 X160.833 Y127.087
G1 X157.017 Y130.902 E.16579
G1 X156.484 Y130.902
G1 X160.833 Y126.553 E.18896
G1 X160.833 Y126.02
G1 X155.951 Y130.902 E.21214
G1 X155.418 Y130.902
G1 X160.833 Y125.487 E.23531
G1 X160.833 Y124.954
G1 X155.667 Y130.119 E.22445
G1 X155.667 Y129.586
G1 X160.833 Y124.42 E.22445
G1 X160.833 Y123.887
G1 X155.667 Y129.052 E.22445
G1 X155.667 Y128.519
G1 X160.833 Y123.354 E.22445
G1 X160.833 Y122.821
G1 X155.667 Y127.986 E.22445
G1 X155.667 Y127.453
G1 X160.833 Y122.287 E.22445
G1 X160.833 Y121.754
G1 X155.667 Y126.919 E.22445
G1 X155.667 Y126.386
G1 X160.833 Y121.221 E.22445
G1 X160.833 Y120.687
G1 X155.667 Y125.853 E.22445
G1 X155.667 Y125.319
G1 X160.833 Y120.154 E.22445
G1 X160.833 Y119.621
G1 X155.667 Y124.786 E.22445
G1 X155.667 Y124.253
G1 X160.833 Y119.088 E.22445
G1 X160.833 Y118.554
G1 X155.667 Y123.72 E.22445
G1 X155.667 Y123.186
G1 X160.833 Y118.021 E.22445
G1 X160.833 Y117.488
G1 X155.667 Y122.653 E.22445
G1 X155.667 Y122.12
G1 X160.833 Y116.955 E.22445
G1 X160.833 Y116.421
G1 X155.667 Y121.587 E.22445
G1 X155.667 Y121.053
G1 X160.833 Y115.888 E.22445
G1 X160.833 Y115.355
G1 X155.667 Y120.52 E.22445
G1 X155.667 Y119.987
G1 X160.833 Y114.822 E.22445
G1 X160.833 Y114.288
G1 X155.667 Y119.453 E.22445
G1 X155.667 Y118.92
G1 X160.833 Y113.755 E.22445
G1 X160.833 Y113.222
G1 X155.667 Y118.387 E.22445
G1 X155.667 Y117.854
G1 X160.833 Y112.688 E.22445
G1 X160.833 Y112.155
G1 X155.667 Y117.32 E.22445
G1 X155.667 Y116.787
G1 X160.833 Y111.622 E.22445
G1 X160.833 Y111.089
G1 X155.667 Y116.254 E.22445
G1 X155.667 Y115.721
G1 X160.833 Y110.555 E.22445
G1 X160.833 Y110.022
G1 X155.667 Y115.187 E.22445
G1 X155.667 Y114.654
G1 X160.833 Y109.489 E.22445
G1 X160.833 Y108.956
G1 X155.667 Y114.121 E.22445
G1 X155.667 Y113.587
G1 X160.833 Y108.422 E.22445
G1 X160.833 Y107.889
G1 X155.667 Y113.054 E.22445
G1 X155.667 Y112.521
M73 P48 R9
G1 X160.833 Y107.356 E.22445
G1 X160.833 Y106.822
G1 X155.667 Y111.988 E.22445
G1 X155.667 Y111.454
G1 X160.833 Y106.289 E.22445
G1 X160.833 Y105.756
G1 X155.667 Y110.921 E.22445
G1 X155.667 Y110.388
G1 X160.833 Y105.223 E.22445
G1 X160.833 Y104.689
G1 X155.667 Y109.855 E.22445
G1 X155.667 Y109.321
G1 X160.833 Y104.156 E.22445
G1 X160.833 Y103.623
G1 X155.667 Y108.788 E.22445
G1 X155.667 Y108.255
G1 X160.833 Y103.09 E.22445
G1 X160.833 Y102.556
G1 X155.667 Y107.722 E.22445
G1 X155.667 Y107.188
G1 X160.833 Y102.023 E.22445
G1 X160.631 Y101.691
G1 X155.667 Y106.655 E.2157
G1 X155.667 Y106.122
G1 X160.098 Y101.691 E.19253
G1 X159.565 Y101.691
G1 X155.667 Y105.588 E.16935
G1 X155.667 Y105.055
G1 X159.031 Y101.691 E.14618
G1 X158.498 Y101.691
G1 X155.667 Y104.522 E.12301
G1 X155.667 Y103.989
G1 X157.965 Y101.691 E.09983
G1 X157.432 Y101.691
G1 X155.667 Y103.455 E.07666
G1 X155.667 Y102.922
G1 X156.898 Y101.691 E.05349
G1 X156.365 Y101.691
G1 X155.667 Y102.389 E.03031
M204 S10000
; WIPE_START
G1 F24000
G1 X156.365 Y101.691 E-.3749
G1 X156.898 Y101.691 E-.20264
G1 X156.559 Y102.031 E-.18246
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.216 J-.036 P1  F30000
G1 X155.732 Y130.183 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.20688
G1 F15000
G1 X155.654 Y130.298 E.00186
; LINE_WIDTH: 0.16731
G1 X155.576 Y130.413 E.00141
; LINE_WIDTH: 0.12774
G1 X155.499 Y130.528 E.00096
G1 X153.507 Y134.926 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X154.461 Y133.607 I-18.699 J-14.522 E.05401
G1 X161.346 Y140.491 E.32296
G3 X157.626 Y144.448 I-22.217 J-17.162 E.18042
G1 X150.809 Y137.631 E.31979
G3 X145.923 Y140.421 I-11.205 J-13.951 E.18742
G1 X153.13 Y147.628 E.33812
G3 X151.689 Y148.384 I-25.358 J-46.59 E.05401
G1 X162.01 Y130.689 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.506246
G1 F13597.337
G1 X162.071 Y130.688 E.0023
; WIPE_START
G1 F24000
G1 X162.01 Y130.689 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.216 J-.049 P1  F30000
G1 X160.844 Y101.559 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255134
G1 F15000
G1 X155.656 Y101.559 E.08971
; WIPE_START
G1 F24000
G1 X157.656 Y101.559 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I0 J-1.217 P1  F30000
G1 X123.844 Y101.559 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15000
G1 X118.656 Y101.559 E.08971
; WIPE_START
G1 F24000
G1 X120.656 Y101.559 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.201 J-.199 P1  F30000
G1 X115.766 Y131.071 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X114.512 Y132.037 I.783 J2.314 E.05349
G1 X132.685 Y150.211 E.85257
G1 X131.74 Y149.934 E.03268
G1 X140.147 Y141.527 E.39439
G1 X139.353 Y141.527 E.02634
G1 X147.763 Y149.937 E.39452
G3 X146.814 Y150.212 I-7.078 J-22.606 E.03278
G1 X164.991 Y132.035 E.85272
G3 X165.118 Y133.8 I-1.829 J1.019 E.06062
G3 X164.265 Y135.735 I-18.628 J-7.048 E.07017
G1 X160.003 Y131.473 E.19998
G1 X157.877 Y131.473 E.0705
G1 X138.248 Y151.102 E.92084
G2 X141.252 Y151.102 I1.502 J-47.133 E.09966
G1 X121.623 Y131.473 E.92084
G1 X119.497 Y131.473 E.0705
G1 X115.235 Y135.735 E.19998
G2 X115.985 Y137.18 I14.165 J-6.438 E.05402
G1 X123.421 Y130.902 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X123.94 Y130.384 E.02252
G1 X123.833 Y129.957
G1 X122.888 Y130.902 E.04105
G1 X122.355 Y130.902
G1 X123.833 Y129.424 E.06422
G1 X123.833 Y128.891
G1 X121.822 Y130.902 E.08739
G1 X121.288 Y130.902
G1 X123.833 Y128.358 E.11056
G1 X123.833 Y127.824
G1 X120.755 Y130.902 E.13374
G1 X120.222 Y130.902
G1 X123.833 Y127.291 E.15691
G1 X123.833 Y126.758
G1 X119.689 Y130.902 E.18008
G1 X119.155 Y130.902
G1 X123.833 Y126.225 E.20326
G1 X123.833 Y125.691
G1 X118.622 Y130.902 E.22643
G1 X118.089 Y130.902
G1 X118.527 Y130.464 E.01903
G1 X118.667 Y130.323
G1 X123.833 Y125.158 E.22445
G1 X123.833 Y124.625
G1 X118.667 Y129.79 E.22445
G1 X118.667 Y129.257
G1 X123.833 Y124.091 E.22445
G1 X123.833 Y123.558
G1 X118.667 Y128.723 E.22445
G1 X118.667 Y128.19
G1 X123.833 Y123.025 E.22445
G1 X123.833 Y122.492
G1 X118.667 Y127.657 E.22445
G1 X118.667 Y127.124
G1 X123.833 Y121.958 E.22445
G1 X123.833 Y121.425
G1 X118.667 Y126.59 E.22445
G1 X118.667 Y126.057
G1 X123.833 Y120.892 E.22445
G1 X123.833 Y120.359
G1 X118.667 Y125.524 E.22445
G1 X118.667 Y124.991
G1 X123.833 Y119.825 E.22445
G1 X123.833 Y119.292
G1 X118.667 Y124.457 E.22445
G1 X118.667 Y123.924
G1 X123.833 Y118.759 E.22445
G1 X123.833 Y118.225
G1 X118.667 Y123.391 E.22445
G1 X118.667 Y122.857
G1 X123.833 Y117.692 E.22445
G1 X123.833 Y117.159
G1 X118.667 Y122.324 E.22445
G1 X118.667 Y121.791
G1 X123.833 Y116.626 E.22445
G1 X123.833 Y116.092
G1 X118.667 Y121.258 E.22445
G1 X118.667 Y120.724
G1 X123.833 Y115.559 E.22445
G1 X123.833 Y115.026
G1 X118.667 Y120.191 E.22445
G1 X118.667 Y119.658
G1 X123.833 Y114.493 E.22445
G1 X123.833 Y113.959
G1 X118.667 Y119.125 E.22445
G1 X118.667 Y118.591
G1 X123.833 Y113.426 E.22445
G1 X123.833 Y112.893
G1 X118.667 Y118.058 E.22445
G1 X118.667 Y117.525
G1 X123.833 Y112.36 E.22445
G1 X123.833 Y111.826
G1 X118.667 Y116.991 E.22445
G1 X118.667 Y116.458
G1 X123.833 Y111.293 E.22445
G1 X123.833 Y110.76
G1 X118.667 Y115.925 E.22445
G1 X118.667 Y115.392
G1 X123.833 Y110.226 E.22445
G1 X123.833 Y109.693
G1 X118.667 Y114.858 E.22445
G1 X118.667 Y114.325
G1 X123.833 Y109.16 E.22445
G1 X123.833 Y108.627
G1 X118.667 Y113.792 E.22445
G1 X118.667 Y113.259
G1 X123.833 Y108.093 E.22445
G1 X123.833 Y107.56
G1 X118.667 Y112.725 E.22445
G1 X118.667 Y112.192
G1 X123.833 Y107.027 E.22445
G1 X123.833 Y106.494
G1 X118.667 Y111.659 E.22445
G1 X118.667 Y111.125
G1 X123.833 Y105.96 E.22445
G1 X123.833 Y105.427
G1 X118.667 Y110.592 E.22445
G1 X118.667 Y110.059
G1 X123.833 Y104.894 E.22445
M73 P49 R9
G1 X123.833 Y104.36
G1 X118.667 Y109.526 E.22445
G1 X118.667 Y108.992
G1 X123.833 Y103.827 E.22445
G1 X123.833 Y103.294
G1 X118.667 Y108.459 E.22445
G1 X118.667 Y107.926
G1 X123.833 Y102.761 E.22445
G1 X123.833 Y102.227
G1 X118.667 Y107.393 E.22445
G1 X118.667 Y106.859
G1 X123.833 Y101.694 E.22445
G1 X123.302 Y101.691
G1 X118.667 Y106.326 E.20141
G1 X118.667 Y105.793
G1 X122.769 Y101.691 E.17823
G1 X122.236 Y101.691
G1 X118.667 Y105.26 E.15506
G1 X118.667 Y104.726
G1 X121.703 Y101.691 E.13189
G1 X121.169 Y101.691
G1 X118.667 Y104.193 E.10871
G1 X118.667 Y103.66
G1 X120.636 Y101.691 E.08554
G1 X120.103 Y101.691
G1 X118.667 Y103.126 E.06237
G1 X118.667 Y102.593
G1 X119.569 Y101.691 E.03919
G1 X119.036 Y101.691
G1 X118.667 Y102.06 E.01602
M204 S10000
; WIPE_START
G1 F24000
G1 X119.036 Y101.691 E-.19813
G1 X119.569 Y101.691 E-.20264
G1 X118.901 Y102.36 E-.35922
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.189 J.259 P1  F30000
G1 X125.994 Y134.925 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X125.039 Y133.608 I17.607 J-13.772 E.05401
G1 X118.156 Y140.49 E.32288
G2 X121.874 Y144.448 I24.427 J-19.226 E.18036
G1 X128.693 Y137.629 E.31986
G2 X133.577 Y140.421 I11.1 J-13.755 E.18742
G1 X126.371 Y147.627 E.33807
G2 X127.812 Y148.385 I23.153 J-42.308 E.05401
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 1.74286
; LAYER_HEIGHT: 0.142857
; WIPE_START
G1 F24000
G1 X126.371 Y147.627 E-.61863
G1 X126.634 Y147.364 E-.14137
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/63
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
G3 Z2 I1.21 J-.126 P1  F30000
G1 X124.789 Y129.638 Z2
G1 Z1.743
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F6906
G2 X125.365 Y131.209 I3.384 J-.35 E.06462
G1 X125.365 Y129.449 E.06725
G1 X124.789 Y129.449 E.02202
G1 X124.789 Y126.572 E.10997
G1 X125.365 Y126.572 E.02202
G1 X125.365 Y123.695 E.10997
G1 X124.789 Y123.695 E.02202
G1 X124.789 Y120.818 E.10997
G1 X125.365 Y120.818 E.02202
G1 X125.365 Y117.941 E.10997
G1 X124.789 Y117.941 E.02202
G1 X124.789 Y115.064 E.10997
G1 X125.365 Y115.064 E.02202
G1 X125.365 Y112.187 E.10997
G1 X124.789 Y112.187 E.02202
G1 X124.789 Y109.309 E.10997
G1 X125.365 Y109.309 E.02202
G1 X125.365 Y106.432 E.10997
G1 X124.789 Y106.432 E.02202
G1 X124.789 Y103.555 E.10997
G1 X125.365 Y103.555 E.02202
G1 X125.365 Y100.678 E.10997
G1 X124.643 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X125.365 Y100.678 E-.27411
G1 X125.365 Y101.957 E-.48589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.143 I.178 J-1.204 P1  F30000
G1 X116.733 Y100.678 Z2.143
G1 Z1.743
G1 E.8 F1800
G1 F6906
G1 X117.857 Y100.678 E.04294
G1 X117.712 Y100.824 E.00785
G1 X117.712 Y103.555 E.10441
G1 X116.733 Y103.555 E.03738
G1 X116.733 Y106.432 E.10997
G1 X117.712 Y106.432 E.03738
G1 X117.712 Y109.309 E.10997
G1 X116.733 Y109.309 E.03738
G1 X116.733 Y112.187 E.10997
G1 X117.712 Y112.187 E.03738
G1 X117.712 Y115.064 E.10997
G1 X116.733 Y115.064 E.03738
G1 X116.733 Y117.941 E.10997
G1 X117.712 Y117.941 E.03738
G1 X117.712 Y120.818 E.10997
G1 X116.733 Y120.818 E.03738
G1 X116.733 Y123.695 E.10997
G1 X117.712 Y123.695 E.03738
G1 X117.712 Y126.572 E.10997
G1 X116.733 Y126.572 E.03738
G1 X116.733 Y129.449 E.10997
G1 X117.712 Y129.449 E.03738
; WIPE_START
G1 F24000
G1 X116.733 Y129.449 E-.37168
G1 X116.733 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.143 I-.039 J1.216 P1  F30000
G1 X154.135 Y129.638 Z2.143
G1 Z1.743
G1 E.8 F1800
G1 F6906
G1 X154.135 Y131.209 E.06005
G2 X154.712 Y129.937 I-13.523 J-6.893 E.05337
G1 X154.712 Y129.449 E.01866
G1 X154.135 Y129.449 E.02202
G1 X154.135 Y126.572 E.10997
G1 X154.712 Y126.572 E.02202
G1 X154.712 Y123.695 E.10997
G1 X154.135 Y123.695 E.02202
G1 X154.135 Y120.818 E.10997
G1 X154.712 Y120.818 E.02202
G1 X154.712 Y117.941 E.10997
G1 X154.135 Y117.941 E.02202
G1 X154.135 Y115.064 E.10997
G1 X154.712 Y115.064 E.02202
G1 X154.712 Y112.187 E.10997
G1 X154.135 Y112.187 E.02202
G1 X154.135 Y109.309 E.10997
G1 X154.712 Y109.309 E.02202
G1 X154.712 Y106.432 E.10997
G1 X154.135 Y106.432 E.02202
G1 X154.135 Y103.555 E.10997
G1 X154.712 Y103.555 E.02202
G1 X154.712 Y100.824 E.10441
G1 X154.857 Y100.678 E.00785
G1 X154.135 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X154.857 Y100.678 E-.27411
G1 X154.712 Y100.824 E-.07807
G1 X154.712 Y101.897 E-.40783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.143 I.211 J1.199 P1  F30000
G1 X161.643 Y100.678 Z2.143
G1 Z1.743
G1 E.8 F1800
G1 F6906
G1 X162.767 Y100.678 E.04294
G1 X162.767 Y103.555 E.10997
G1 X161.789 Y103.555 E.03738
G1 X161.789 Y106.432 E.10997
G1 X162.767 Y106.432 E.03738
G1 X162.767 Y109.309 E.10997
G1 X161.789 Y109.309 E.03738
G1 X161.789 Y112.187 E.10997
G1 X162.767 Y112.187 E.03738
G1 X162.767 Y115.064 E.10997
G1 X161.789 Y115.064 E.03738
G1 X161.789 Y117.941 E.10997
G1 X162.767 Y117.941 E.03738
G1 X162.767 Y120.818 E.10997
G1 X161.789 Y120.818 E.03738
G1 X161.789 Y123.695 E.10997
G1 X162.767 Y123.695 E.03738
G1 X162.767 Y126.572 E.10997
G1 X161.789 Y126.572 E.03738
G1 X161.789 Y129.449 E.10997
G1 X162.767 Y129.449 E.03738
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0571429
; WIPE_START
G1 F24000
G1 X161.789 Y129.449 E-.37168
G1 X161.789 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/63
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
G3 Z2.143 I1.206 J-.161 P1  F30000
G1 X158.25 Y101.945 Z2.143
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6906
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6906
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.014 J-1.217 P1  F30000
G1 X121.25 Y101.945 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6906
G1 X118.852 Y101.945 E.07954
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X121.31 Y101.945 E.07755
G1 X121.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6906
G1 X118.46 Y102.337 E.08573
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X121.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X119.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.686 J1.005 P1  F30000
G1 X160.771 Y130.649 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6906
G1 X163.205 Y130.649 E.08073
G3 X165.447 Y133.915 I.006 J2.399 E.15463
G3 X113.981 Y133.699 I-25.692 J-9.989 E2.20219
G3 X116.295 Y130.649 I2.308 J-.652 E.14709
G1 X123.851 Y130.649 E.25065
G1 X124.021 Y131.048 E.01439
G2 X155.649 Y130.649 I15.727 J-7.124 E1.3265
G1 X160.711 Y130.649 E.16792
G1 X160.771 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6906
G1 X163.21 Y130.257 E.07493
G3 X165.813 Y134.057 I.001 J2.791 E.16649
G3 X113.603 Y133.805 I-26.056 J-10.13 E2.06997
G3 X116.29 Y130.257 I2.686 J-.757 E.15831
G1 X124.111 Y130.257 E.2403
G1 X124.197 Y130.459 E.00677
G1 X124.197 Y130.459 E0
G2 X155.389 Y130.257 I15.554 J-6.539 E1.22286
G1 X160.711 Y130.257 E.16353
M204 S10000
; WIPE_START
G1 F24000
G1 X162.711 Y130.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.551 J-1.085 P1  F30000
G1 X153.507 Y134.926 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6906
G2 X154.461 Y133.607 I-12.65 J-10.157 E.05402
G1 X159.15 Y138.296 E.21999
G1 X158.73 Y138.296 E.01396
G1 X164.985 Y132.041 E.29346
G3 X165.119 Y133.796 I-2.083 J1.042 E.0599
G3 X164.265 Y135.735 I-18.525 J-7.001 E.07031
G1 X159.527 Y130.997 E.22229
G1 X158.353 Y130.997 E.03894
G1 X151.054 Y138.296 E.34243
G1 X151.474 Y138.296 E.01396
G1 X150.809 Y137.631 E.03122
G2 X152.027 Y136.551 I-12.64 J-15.48 E.054
G1 X144.693 Y141.248 F30000
G1 F6906
G2 X146.238 Y140.735 I-4.382 J-15.794 E.05401
G1 X152.831 Y147.329 E.30929
G2 X154.227 Y146.491 I-95.165 J-160.338 E.05401
G1 X162.542 Y138.703 F30000
G1 F6906
G1 X149.323 Y138.703 E.43848
G3 X130.597 Y138.975 I-9.579 J-14.762 E.65509
G1 X130.173 Y138.703 E.01671
G1 X116.889 Y138.703 E.44063
G2 X140.384 Y151.132 I22.867 J-14.804 E.92106
G1 X140.38 Y151.014 E.00391
G3 X141.606 Y150.967 I7.919 J188.433 E.04072
G1 X141.61 Y151.078 E.0037
G2 X162.601 Y138.704 I-1.901 J-27.216 E.8379
; WIPE_START
M73 P50 R9
G1 F24000
G1 X161.447 Y140.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.26 J-1.189 P1  F30000
G1 X124.208 Y132.208 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F6906
G2 X125.039 Y133.607 I16.854 J-9.052 E.054
G1 X120.35 Y138.296 E.21997
G1 X120.771 Y138.296 E.01396
G1 X114.508 Y132.034 E.29378
G2 X114.287 Y133.486 I2.033 J1.053 E.04961
G2 X115.235 Y135.735 I21.268 J-7.638 E.08101
G1 X119.972 Y130.999 E.22221
G1 X121.148 Y130.998 E.03903
G1 X128.446 Y138.296 E.34238
G1 X128.026 Y138.296 E.01396
G1 X128.693 Y137.629 E.03128
G3 X127.476 Y136.548 I9.348 J-11.74 E.05401
G1 X134.806 Y141.252 F30000
G1 F6906
G3 X133.263 Y140.735 I4.513 J-16.051 E.05401
G1 X126.669 Y147.329 E.3093
G3 X122.163 Y144.159 I13.334 J-23.747 E.18307
G1 X127.212 Y139.11 E.23684
G1 X129.261 Y139.11 E.06797
G1 X140.743 Y150.592 E.53864
G1 X139.957 Y150.624 E.02608
G1 X139.961 Y150.733 E.00361
G3 X138.643 Y150.707 I-.32 J-17.031 E.04373
G1 X150.239 Y139.11 E.544
G1 X152.289 Y139.111 E.06798
G1 X157.338 Y144.16 E.23687
G2 X161.054 Y140.2 I-17.41 J-20.058 E.18045
G1 X159.965 Y139.111 E.05107
G1 X157.915 Y139.111 E.06799
G1 X147.418 Y149.608 E.49243
G1 X139.731 Y141.943 E.3601
G1 X132.09 Y149.616 E.35919
G1 X121.585 Y139.11 E.49281
G1 X119.536 Y139.11 E.06797
G1 X118.447 Y140.2 E.05109
G2 X119.471 Y141.465 I40.114 J-31.407 E.05401
M106 S247.35
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.447 Y140.2 E-.61864
G1 X118.71 Y139.936 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/63
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
G3 Z2.2 I1.213 J-.098 P1  F30000
G1 X117.862 Y129.449 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X116.733 Y129.449 E.04312
G1 X116.733 Y126.572 E.10997
G1 X117.862 Y126.572 E.04312
G1 X117.862 Y123.695 E.10997
G1 X116.733 Y123.695 E.04312
G1 X116.733 Y120.818 E.10997
G1 X117.862 Y120.818 E.04312
G1 X117.862 Y117.941 E.10997
G1 X116.733 Y117.941 E.04312
G1 X116.733 Y115.064 E.10997
G1 X117.862 Y115.064 E.04312
G1 X117.862 Y112.187 E.10997
G1 X116.733 Y112.187 E.04312
G1 X116.733 Y109.309 E.10997
G1 X117.862 Y109.309 E.04312
G1 X117.862 Y106.432 E.10997
G1 X116.733 Y106.432 E.04312
G1 X116.733 Y103.555 E.10997
G1 X117.862 Y103.555 E.04312
G1 X117.862 Y102.92 E.0243
G1 X117.712 Y102.77 E.00811
G1 X117.712 Y100.824 E.07438
G1 X117.857 Y100.678 E.00785
G1 X116.733 Y100.678 E.04294
; WIPE_START
G1 F24000
G1 X117.857 Y100.678 E-.42688
G1 X117.712 Y100.824 E-.07807
G1 X117.712 Y101.495 E-.25505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.087 J.547 P1  F30000
G1 X118.512 Y103.085 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X118.019 Y103.077 E.01515
G1 X118.019 Y129.508 E.81216
G1 X118.7 Y129.508 E.02094
G1 X118.7 Y103.085 E.8119
G1 X119.577 Y103.085 E.02695
G1 X119.577 Y129.508 E.8119
G1 X120.454 Y129.508 E.02695
G1 X120.454 Y103.085 E.8119
G1 X121.331 Y103.085 E.02695
G1 X121.331 Y129.508 E.8119
G1 X122.208 Y129.508 E.02695
G1 X122.208 Y103.085 E.8119
G1 X123.086 Y103.085 E.02695
G1 X123.086 Y129.508 E.8119
G1 X123.963 Y129.508 E.02695
G1 X123.963 Y103.085 E.8119
G1 X124.482 Y103.077 E.01595
G1 X124.482 Y129.554 E.81357
G2 X124.151 Y129.508 I-.2 J.227 E.01086
G1 X124.639 Y129.638 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X124.639 Y129.658 E.00078
G3 X125.365 Y131.209 I-120.42 J57.329 E.06545
G1 X125.365 Y129.449 E.06726
G1 X124.639 Y129.449 E.02775
G1 X124.639 Y126.572 E.10997
G1 X125.365 Y126.572 E.02775
G1 X125.365 Y123.695 E.10997
G1 X124.639 Y123.695 E.02775
G1 X124.639 Y120.818 E.10997
G1 X125.365 Y120.818 E.02775
G1 X125.365 Y117.941 E.10997
G1 X124.639 Y117.941 E.02775
G1 X124.639 Y115.064 E.10997
G1 X125.365 Y115.064 E.02775
G1 X125.365 Y112.187 E.10997
G1 X124.639 Y112.187 E.02775
G1 X124.639 Y109.309 E.10997
G1 X125.365 Y109.309 E.02775
G1 X125.365 Y106.432 E.10997
G1 X124.639 Y106.432 E.02775
G1 X124.639 Y103.555 E.10997
G1 X125.365 Y103.555 E.02775
G1 X125.365 Y100.678 E.10997
G1 X124.643 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X125.365 Y100.678 E-.27411
G1 X125.365 Y101.957 E-.48589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.043 J1.216 P1  F30000
G1 X161.643 Y100.678 Z2.4
G1 Z2
G1 E.8 F1800
G1 F9000
G1 X162.767 Y100.678 E.04294
G1 X162.767 Y103.555 E.10997
G1 X161.639 Y103.555 E.04312
G1 X161.639 Y106.432 E.10997
G1 X162.767 Y106.432 E.04312
G1 X162.767 Y109.309 E.10997
G1 X161.639 Y109.309 E.04312
G1 X161.639 Y112.187 E.10997
G1 X162.767 Y112.187 E.04312
G1 X162.767 Y115.064 E.10997
G1 X161.639 Y115.064 E.04312
G1 X161.639 Y117.941 E.10997
G1 X162.767 Y117.941 E.04312
G1 X162.767 Y120.818 E.10997
G1 X161.639 Y120.818 E.04312
G1 X161.639 Y123.695 E.10997
G1 X162.767 Y123.695 E.04312
G1 X162.767 Y126.572 E.10997
G1 X161.639 Y126.572 E.04312
G1 X161.639 Y129.449 E.10997
G1 X162.767 Y129.449 E.04312
; WIPE_START
G1 F24000
G1 X161.639 Y129.449 E-.42868
G1 X161.639 Y128.577 E-.33132
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.998 J-.697 P1  F30000
G1 X160.989 Y129.508 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X161.482 Y129.508 E.01515
G1 X161.482 Y103.077 E.81216
G1 X160.8 Y103.085 E.02094
G1 X160.8 Y129.508 E.8119
G1 X159.923 Y129.508 E.02695
G1 X159.923 Y103.085 E.8119
G1 X159.046 Y103.085 E.02695
G1 X159.046 Y129.508 E.8119
G1 X158.169 Y129.508 E.02695
G1 X158.169 Y103.085 E.8119
G1 X157.292 Y103.085 E.02695
G1 X157.292 Y129.508 E.8119
G1 X156.415 Y129.508 E.02695
G1 X156.415 Y103.085 E.8119
G1 X155.537 Y103.085 E.02695
G1 X155.537 Y129.508 E.8119
G1 X155.019 Y129.554 E.01601
G1 X155.019 Y103.077 E.81357
G1 X155.349 Y103.085 E.01015
; WIPE_START
G1 F24000
G1 X155.019 Y103.077 E-.12558
G1 X155.019 Y104.746 E-.63443
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.189 J-.258 P1  F30000
G1 X154.135 Y100.678 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X154.857 Y100.678 E.02757
M73 P51 R9
G1 X154.712 Y100.824 E.00785
G1 X154.712 Y102.77 E.07438
G1 X154.862 Y102.92 E.00811
G1 X154.862 Y103.555 E.0243
G1 X154.135 Y103.555 E.02775
G1 X154.135 Y106.432 E.10997
G1 X154.862 Y106.432 E.02775
G1 X154.862 Y109.309 E.10997
G1 X154.135 Y109.309 E.02775
G1 X154.135 Y112.187 E.10997
G1 X154.862 Y112.187 E.02775
G1 X154.862 Y115.064 E.10997
G1 X154.135 Y115.064 E.02775
G1 X154.135 Y117.941 E.10997
G1 X154.862 Y117.941 E.02775
G1 X154.862 Y120.818 E.10997
G1 X154.135 Y120.818 E.02775
G1 X154.135 Y123.695 E.10997
G1 X154.862 Y123.695 E.02775
G1 X154.862 Y126.572 E.10997
G1 X154.135 Y126.572 E.02775
G1 X154.135 Y129.449 E.10997
G1 X154.862 Y129.449 E.02775
G1 X154.862 Y129.658 E.00799
G2 X154.135 Y131.209 I46.36 J22.649 E.06545
G1 X154.135 Y129.638 E.06006
; WIPE_START
G1 F24000
G1 X154.135 Y131.209 E-.59709
G1 X154.317 Y130.821 E-.16291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.206 J.164 P1  F30000
G1 X158.25 Y101.945 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.014 J-1.217 P1  F30000
G1 X121.25 Y101.945 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.852 Y101.945 E.07954
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X121.31 Y101.945 E.07755
G1 X121.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y102.337 E.08573
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X121.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X119.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.686 J1.005 P1  F30000
G1 X160.776 Y130.649 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X163.205 Y130.649 E.08058
G3 X165.447 Y133.915 I.006 J2.399 E.15463
G3 X113.981 Y133.7 I-25.692 J-9.988 E2.20218
G3 X116.295 Y130.649 I2.308 J-.653 E.14713
G1 X123.851 Y130.649 E.25065
G1 X124.02 Y131.047 E.01434
G2 X155.649 Y130.649 I15.727 J-7.124 E1.32653
G1 X160.716 Y130.649 E.16807
G1 X160.776 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.21 Y130.257 E.07479
G3 X165.813 Y134.057 I.001 J2.791 E.16649
G3 X113.603 Y133.806 I-26.056 J-10.129 E2.06996
G3 X116.29 Y130.257 I2.686 J-.758 E.15835
G1 X124.111 Y130.257 E.2403
G1 X124.175 Y130.408 E.00507
G2 X155.389 Y130.257 I15.576 J-6.488 E1.22457
G1 X160.716 Y130.257 E.16367
M204 S10000
; WIPE_START
G1 F24000
G1 X162.716 Y130.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.55 J-1.085 P1  F30000
G1 X153.507 Y134.926 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X154.461 Y133.607 I-12.608 J-10.126 E.05402
G1 X159.15 Y138.296 E.22
G1 X158.73 Y138.296 E.01396
G1 X164.989 Y132.037 E.29365
G3 X165.119 Y133.796 I-2.125 J1.042 E.05998
G3 X164.265 Y135.735 I-18.387 J-6.942 E.07032
G1 X159.527 Y130.997 E.22228
G1 X158.353 Y130.997 E.03894
G1 X151.054 Y138.296 E.34243
G1 X151.474 Y138.296 E.01396
G1 X150.809 Y137.631 E.03121
G2 X152.027 Y136.551 I-12.819 J-15.681 E.054
G1 X144.693 Y141.248 F30000
G1 F15476.087
G2 X146.238 Y140.735 I-4.388 J-15.816 E.05401
G1 X152.831 Y147.329 E.30929
G2 X154.227 Y146.492 I-18.377 J-32.251 E.05401
G1 X162.542 Y138.703 F30000
G1 F15476.087
G1 X149.323 Y138.703 E.43849
G3 X130.597 Y138.976 I-9.579 J-14.765 E.65505
G1 X130.173 Y138.703 E.01674
G1 X116.889 Y138.703 E.44063
G2 X162.601 Y138.704 I22.856 J-14.816 E1.79924
; WIPE_START
G1 F24000
G1 X161.447 Y140.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.26 J-1.189 P1  F30000
G1 X124.208 Y132.207 Z2.4
G1 Z2
G1 E.8 F1800
G1 F15476.087
G2 X125.039 Y133.607 I16.188 J-8.67 E.054
G1 X120.35 Y138.296 E.22
G1 X120.771 Y138.296 E.01396
G1 X114.508 Y132.034 E.29378
G2 X114.287 Y133.484 I2.033 J1.053 E.04954
G2 X115.235 Y135.735 I21.251 J-7.628 E.08106
G1 X119.972 Y130.999 E.22221
G1 X121.148 Y130.998 E.03903
G1 X128.447 Y138.296 E.34238
G1 X128.026 Y138.296 E.01396
G1 X128.693 Y137.629 E.03128
G3 X127.477 Y136.548 I9.204 J-11.574 E.05401
G1 X134.806 Y141.252 F30000
G1 F15476.087
G3 X133.263 Y140.735 I4.502 J-16.011 E.05401
G1 X126.669 Y147.329 E.3093
G3 X122.163 Y144.159 I13.299 J-23.698 E.18307
G1 X127.212 Y139.11 E.23684
G1 X129.261 Y139.11 E.06797
G1 X140.857 Y150.707 E.544
G3 X138.643 Y150.707 I-1.107 J-23.402 E.07345
G1 X150.239 Y139.11 E.544
G1 X152.289 Y139.111 E.06798
G1 X157.338 Y144.16 E.23689
G2 X161.054 Y140.2 I-17.402 J-20.049 E.18045
G1 X159.965 Y139.111 E.05108
G1 X157.915 Y139.111 E.06799
G1 X147.418 Y149.608 E.49243
G1 X139.731 Y141.943 E.3601
G1 X132.09 Y149.616 E.35919
G1 X121.585 Y139.11 E.49281
G1 X119.536 Y139.11 E.06797
G1 X118.446 Y140.2 E.0511
G2 X119.471 Y141.465 I38.92 J-30.455 E.05401
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.446 Y140.2 E-.61864
G1 X118.709 Y139.937 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/63
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
G3 Z2.4 I.843 J.878 P1  F30000
G1 X158.25 Y101.945 Z2.4
M73 P51 R8
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5329
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5329
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.014 J-1.217 P1  F30000
G1 X121.25 Y101.945 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5329
G1 X118.852 Y101.945 E.07954
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X121.31 Y101.945 E.07755
G1 X121.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5329
G1 X118.46 Y102.337 E.08573
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X121.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X119.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.686 J1.005 P1  F30000
G1 X160.78 Y130.649 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5329
G1 X163.205 Y130.649 E.08043
G3 X165.447 Y133.915 I.006 J2.399 E.15463
G3 X113.981 Y133.702 I-25.692 J-9.987 E2.20218
G3 X116.295 Y130.649 I2.308 J-.654 E.14717
G1 X123.851 Y130.649 E.25065
G1 X124.019 Y131.046 E.0143
G2 X155.649 Y130.649 I15.728 J-7.123 E1.32656
G1 X160.72 Y130.649 E.16822
G1 X160.78 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5329
G1 X163.21 Y130.257 E.07465
G3 X165.813 Y134.057 I.001 J2.791 E.16649
G3 X113.604 Y133.807 I-26.057 J-10.128 E2.06995
G3 X116.29 Y130.257 I2.685 J-.76 E.15839
G1 X124.111 Y130.257 E.2403
G1 X124.154 Y130.358 E.00337
G2 X155.389 Y130.257 I15.597 J-6.437 E1.22628
G1 X160.72 Y130.257 E.16381
M204 S10000
; WIPE_START
G1 F24000
G1 X162.72 Y130.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.55 J-1.086 P1  F30000
M73 P52 R8
G1 X153.507 Y134.925 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5329
G2 X154.461 Y133.607 I-12.565 J-10.093 E.05402
G1 X159.15 Y138.296 E.22001
G1 X158.73 Y138.296 E.01396
G1 X164.985 Y132.041 E.29344
G3 X165.119 Y133.796 I-2.078 J1.042 E.05987
G3 X164.265 Y135.735 I-18.254 J-6.884 E.07032
G1 X159.527 Y130.997 E.22228
G1 X158.353 Y130.997 E.03894
G1 X151.054 Y138.296 E.34243
G1 X151.474 Y138.296 E.01396
G1 X150.809 Y137.631 E.03121
G2 X152.027 Y136.551 I-13.005 J-15.891 E.054
G1 X144.693 Y141.248 F30000
G1 F5329
G2 X145.331 Y141.06 I-1.692 J-6.918 E.02208
G2 X145.972 Y140.839 I-33.593 J-98.641 E.02246
G1 X146.238 Y140.735 E.00947
G1 X152.831 Y147.329 E.30929
G2 X154.225 Y146.488 I-6.836 J-12.912 E.05404
G1 X162.542 Y138.703 F30000
G1 F5329
G1 X149.323 Y138.703 E.43849
G3 X130.599 Y138.977 I-9.579 J-14.761 E.65498
G1 X130.173 Y138.703 E.01682
G1 X116.889 Y138.703 E.44063
G2 X162.601 Y138.704 I22.856 J-14.785 E1.79985
; WIPE_START
G1 F24000
G1 X161.448 Y140.338 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.26 J-1.189 P1  F30000
G1 X124.208 Y132.207 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F5329
G2 X125.04 Y133.606 I16.05 J-8.59 E.054
G1 X120.35 Y138.296 E.22001
G1 X120.771 Y138.296 E.01396
G1 X114.508 Y132.034 E.29378
G2 X114.286 Y133.483 I2.032 J1.053 E.04948
G2 X115.235 Y135.735 I21.239 J-7.62 E.08112
G1 X119.972 Y130.999 E.2222
G1 X121.148 Y130.998 E.03903
G1 X128.447 Y138.296 E.34238
G1 X128.026 Y138.296 E.01396
G1 X128.693 Y137.629 E.03128
G3 X127.477 Y136.548 I9.068 J-11.417 E.05401
G1 X134.806 Y141.252 F30000
G1 F5329
G3 X133.263 Y140.735 I4.49 J-15.968 E.05401
G1 X126.669 Y147.329 E.3093
G3 X122.163 Y144.159 I13.263 J-23.647 E.18307
G1 X127.212 Y139.11 E.23684
G1 X129.261 Y139.11 E.06797
G1 X140.857 Y150.707 E.54401
G3 X138.643 Y150.707 I-1.107 J-23.583 E.07347
G1 X150.239 Y139.11 E.54401
G1 X152.289 Y139.111 E.06798
G1 X157.339 Y144.161 E.23691
G2 X161.054 Y140.2 I-17.4 J-20.045 E.18046
G1 X159.965 Y139.111 E.0511
G1 X157.915 Y139.111 E.06799
G1 X147.424 Y149.602 E.49218
G1 X139.73 Y141.944 E.3601
G1 X132.09 Y149.616 E.35917
G1 X121.585 Y139.11 E.49281
G1 X119.536 Y139.11 E.06797
G1 X118.446 Y140.2 E.05111
G2 X119.471 Y141.465 I37.844 J-29.599 E.05401
M106 S247.35
; CHANGE_LAYER
; Z_HEIGHT: 2.26667
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F24000
G1 X118.446 Y140.2 E-.61863
G1 X118.709 Y139.937 E-.14137
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/63
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
G3 Z2.6 I1.211 J-.123 P1  F30000
G1 X117.642 Y129.449 Z2.6
G1 Z2.267
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F9000
G1 X116.733 Y129.449 E.03579
G1 X116.733 Y126.572 E.1134
G1 X117.642 Y126.572 E.03579
G1 X117.642 Y123.695 E.1134
G1 X116.733 Y123.695 E.03579
G1 X116.733 Y120.818 E.1134
G1 X117.642 Y120.818 E.03579
G1 X117.642 Y117.941 E.1134
G1 X116.733 Y117.941 E.03579
G1 X116.733 Y115.064 E.1134
G1 X117.642 Y115.064 E.03579
G1 X117.642 Y112.187 E.1134
G1 X116.733 Y112.187 E.03579
G1 X116.733 Y109.309 E.1134
G1 X117.642 Y109.309 E.03579
G1 X117.642 Y106.432 E.1134
G1 X116.733 Y106.432 E.03579
G1 X116.733 Y103.555 E.1134
G1 X117.642 Y103.555 E.03579
G1 X117.712 Y100.824 E.10771
G1 X117.857 Y100.678 E.0081
G1 X116.733 Y100.678 E.04428
; WIPE_START
G1 F24000
G1 X117.857 Y100.678 E-.42688
G1 X117.712 Y100.824 E-.07807
G1 X117.694 Y101.494 E-.25505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.667 I-1.082 J.556 P1  F30000
G1 X118.512 Y103.085 Z2.667
G1 Z2.267
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X118.019 Y103.077 E.01944
G1 X118.019 Y129.508 E1.0418
G1 X118.7 Y129.508 E.02686
G1 X118.7 Y103.085 E1.04147
G1 X119.577 Y103.085 E.03457
G1 X119.577 Y129.508 E1.04147
G1 X120.454 Y129.508 E.03457
G1 X120.454 Y103.085 E1.04147
G1 X121.331 Y103.085 E.03457
G1 X121.331 Y129.508 E1.04147
G1 X122.208 Y129.508 E.03457
G1 X122.208 Y103.085 E1.04147
G1 X123.086 Y103.085 E.03457
G1 X123.086 Y129.508 E1.04147
G1 X123.963 Y129.508 E.03457
G1 X123.963 Y103.085 E1.04147
G1 X124.482 Y103.077 E.02046
G1 X124.482 Y129.554 E1.04361
G2 X124.151 Y129.508 I-.2 J.227 E.01393
G1 X124.858 Y129.638 F30000
; FEATURE: Support
G1 F9000
G2 X125.18 Y130.825 I2.194 J.044 E.04916
G1 X125.365 Y131.209 E.01678
G1 X125.365 Y129.449 E.06936
G1 X124.858 Y129.449 E.01995
G1 X124.858 Y126.572 E.1134
G1 X125.365 Y126.572 E.01995
G1 X125.365 Y123.695 E.1134
G1 X124.858 Y123.695 E.01995
G1 X124.859 Y120.818 E.1134
G1 X125.365 Y120.818 E.01995
G1 X125.365 Y117.941 E.1134
G1 X124.859 Y117.941 E.01995
G1 X124.859 Y115.064 E.1134
G1 X125.365 Y115.064 E.01995
G1 X125.365 Y112.187 E.1134
G1 X124.859 Y112.187 E.01995
G1 X124.859 Y109.309 E.1134
G1 X125.365 Y109.309 E.01995
G1 X125.365 Y106.432 E.1134
G1 X124.859 Y106.432 E.01995
G1 X124.859 Y103.555 E.1134
G1 X125.365 Y103.555 E.01995
G1 X125.365 Y100.678 E.1134
G1 X124.643 Y100.678 E.02843
; WIPE_START
G1 F24000
G1 X125.365 Y100.678 E-.27411
G1 X125.365 Y101.957 E-.48589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.667 I.043 J1.216 P1  F30000
G1 X161.643 Y100.678 Z2.667
G1 Z2.267
G1 E.8 F1800
G1 F9000
G1 X162.767 Y100.678 E.04428
G1 X162.767 Y103.555 E.1134
G1 X161.859 Y103.555 E.03579
G1 X161.859 Y106.432 E.1134
G1 X162.767 Y106.432 E.03579
G1 X162.767 Y109.309 E.1134
M73 P53 R8
G1 X161.859 Y109.309 E.03579
G1 X161.859 Y112.187 E.1134
G1 X162.767 Y112.187 E.03579
G1 X162.767 Y115.064 E.1134
G1 X161.859 Y115.064 E.03579
G1 X161.859 Y117.941 E.1134
G1 X162.767 Y117.941 E.03579
G1 X162.767 Y120.818 E.1134
G1 X161.859 Y120.818 E.03579
G1 X161.859 Y123.695 E.1134
G1 X162.767 Y123.695 E.03579
G1 X162.767 Y126.572 E.1134
G1 X161.859 Y126.572 E.03579
G1 X161.859 Y129.449 E.1134
G1 X162.767 Y129.449 E.03579
; WIPE_START
G1 F24000
G1 X161.859 Y129.449 E-.34508
G1 X161.859 Y128.357 E-.41492
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.667 I-.971 J-.734 P1  F30000
G1 X160.989 Y129.508 Z2.667
G1 Z2.267
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X161.482 Y129.508 E.01943
G1 X161.482 Y103.077 E1.0418
G1 X160.8 Y103.085 E.02687
G1 X160.8 Y129.508 E1.04147
G1 X159.923 Y129.508 E.03457
G1 X159.923 Y103.085 E1.04147
G1 X159.046 Y103.085 E.03457
G1 X159.046 Y129.508 E1.04147
G1 X158.169 Y129.508 E.03457
G1 X158.169 Y103.085 E1.04147
G1 X157.292 Y103.085 E.03457
G1 X157.292 Y129.508 E1.04147
G1 X156.415 Y129.508 E.03457
G1 X156.415 Y103.085 E1.04147
G1 X155.537 Y103.085 E.03457
G1 X155.537 Y129.508 E1.04147
G1 X155.019 Y129.554 E.02053
G1 X155.019 Y103.077 E1.04361
G1 X155.349 Y103.085 E.01303
; WIPE_START
G1 F24000
G1 X155.019 Y103.077 E-.12558
G1 X155.019 Y104.746 E-.63442
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.667 I1.189 J-.258 P1  F30000
G1 X154.135 Y100.678 Z2.667
G1 Z2.267
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X154.857 Y100.678 E.02843
G1 X154.712 Y100.824 E.0081
G1 X154.642 Y103.555 E.10771
G1 X154.135 Y103.555 E.01995
G1 X154.135 Y106.432 E.1134
G1 X154.642 Y106.432 E.01995
G1 X154.642 Y109.309 E.1134
G1 X154.135 Y109.309 E.01995
G1 X154.135 Y112.187 E.1134
G1 X154.642 Y112.187 E.01995
G1 X154.642 Y115.064 E.1134
G1 X154.135 Y115.064 E.01995
G1 X154.135 Y117.941 E.1134
G1 X154.642 Y117.941 E.01995
G1 X154.642 Y120.818 E.1134
G1 X154.135 Y120.818 E.01995
G1 X154.135 Y123.695 E.1134
G1 X154.642 Y123.695 E.01995
G1 X154.642 Y126.572 E.1134
G1 X154.135 Y126.572 E.01995
G1 X154.135 Y129.449 E.1134
G1 X154.642 Y129.449 E.01995
G1 X154.642 Y130.103 E.02576
G3 X154.135 Y131.209 I-13.105 J-5.324 E.04798
G1 X154.135 Y129.638 E.06194
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X154.135 Y131.209 E-.59719
G1 X154.314 Y130.819 E-.16281
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/63
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
G3 Z2.667 I1.206 J.164 P1  F30000
G1 X158.25 Y101.945 Z2.667
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.014 J-1.217 P1  F30000
G1 X121.25 Y101.945 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.852 Y101.945 E.07954
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X121.31 Y101.945 E.07755
G1 X121.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y102.337 E.08573
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X121.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X119.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.686 J1.005 P1  F30000
G1 X160.785 Y130.649 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X163.2 Y130.649 E.08011
G3 X165.447 Y133.915 I.011 J2.399 E.15478
G3 X114.272 Y134.429 I-25.691 J-9.991 E2.17594
G3 X113.891 Y133.117 I2.985 J-1.578 E.04565
G3 X116.295 Y130.649 I2.404 J-.064 E.1274
G1 X123.851 Y130.649 E.25065
G1 X124.019 Y131.044 E.01425
G2 X155.649 Y130.649 I15.728 J-7.126 E1.32648
G1 X160.725 Y130.649 E.16838
G1 X160.785 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.208 Y130.257 E.07446
G3 X165.813 Y134.057 I.003 J2.791 E.16654
G3 X113.911 Y134.582 I-26.056 J-10.134 E2.04414
G3 X113.499 Y133.127 I3.318 J-1.725 E.04679
G3 X116.29 Y130.257 I2.797 J-.072 E.13708
G1 X124.111 Y130.257 E.2403
G1 X124.132 Y130.307 E.00167
G2 X155.389 Y130.257 I15.618 J-6.379 E1.22821
G1 X160.725 Y130.257 E.16395
M204 S10000
; WIPE_START
G1 F24000
G1 X162.725 Y130.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.55 J-1.086 P1  F30000
G1 X153.507 Y134.925 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X154.46 Y133.606 I-12.518 J-10.057 E.05402
G1 X159.15 Y138.296 E.22001
G1 X158.73 Y138.296 E.01396
G1 X164.986 Y132.039 E.29352
G3 X165.119 Y133.796 I-2.092 J1.042 E.05992
G3 X164.265 Y135.735 I-18.123 J-6.828 E.07032
G1 X159.527 Y130.997 E.22227
G1 X158.353 Y130.997 E.03894
G1 X151.054 Y138.296 E.34243
G1 X151.474 Y138.296 E.01396
G1 X150.809 Y137.631 E.03121
G2 X152.027 Y136.551 I-13.195 J-16.104 E.054
G1 X144.693 Y141.248 F30000
G1 F15476.087
G2 X145.845 Y140.883 I-3.306 J-12.44 E.04012
G1 X146.238 Y140.735 E.0139
G1 X152.831 Y147.329 E.30929
G2 X154.226 Y146.49 I-6.908 J-13.071 E.05404
G1 X162.542 Y138.703 F30000
G1 F15476.087
G1 X149.323 Y138.703 E.4385
G3 X130.596 Y138.975 I-9.579 J-14.761 E.6551
G1 X130.173 Y138.703 E.01668
G1 X116.889 Y138.703 E.44063
G2 X152.692 Y147.864 I22.872 J-14.847 E1.34694
G1 X152.692 Y147.864 E0
G2 X162.601 Y138.704 I-12.888 J-23.882 E.45238
; WIPE_START
G1 F24000
G1 X161.449 Y140.338 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.26 J-1.189 P1  F30000
G1 X124.208 Y132.207 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G2 X125.04 Y133.606 I15.917 J-8.514 E.054
G1 X120.35 Y138.296 E.22002
G1 X120.771 Y138.296 E.01396
G1 X114.508 Y132.034 E.29378
G2 X114.286 Y133.481 I2.032 J1.053 E.04942
G2 X115.235 Y135.735 I21.249 J-7.621 E.08118
G1 X119.972 Y130.999 E.2222
G1 X121.148 Y130.998 E.03903
G1 X128.447 Y138.296 E.34238
G1 X128.026 Y138.296 E.01396
G1 X128.693 Y137.629 E.03128
G3 X127.477 Y136.547 I8.927 J-11.252 E.05401
G1 X134.807 Y141.248 F30000
G1 F15476.087
G3 X133.263 Y140.735 I4.474 J-16.079 E.05401
G1 X126.669 Y147.329 E.3093
G3 X122.165 Y144.157 I13.547 J-24.03 E.18305
G1 X127.212 Y139.11 E.23676
G1 X129.261 Y139.11 E.06797
G1 X140.857 Y150.707 E.54402
G3 X138.643 Y150.707 I-1.107 J-23.909 E.07349
G1 X150.239 Y139.11 E.54402
G1 X152.289 Y139.111 E.06798
G1 X157.339 Y144.161 E.23693
G2 X161.054 Y140.2 I-18.005 J-20.612 E.18044
G1 X159.965 Y139.111 E.05111
G1 X157.915 Y139.111 E.06799
G1 X147.421 Y149.605 E.49231
G1 X139.731 Y141.943 E.3601
G1 X132.09 Y149.616 E.35918
G1 X121.585 Y139.11 E.49281
G1 X119.536 Y139.11 E.06797
G1 X118.446 Y140.2 E.05113
G2 X119.471 Y141.465 I36.861 J-28.818 E.05401
M106 S219.3
; CHANGE_LAYER
; Z_HEIGHT: 2.53333
; LAYER_HEIGHT: 0.133333
; WIPE_START
M73 P54 R8
G1 F24000
G1 X118.446 Y140.2 E-.61863
G1 X118.709 Y139.937 E-.14137
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/63
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
G3 Z2.8 I1.197 J-.218 P1  F30000
G1 X116.733 Y129.081 Z2.8
G1 Z2.533
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F4800
G1 X116.733 Y129.508 E.01683
G1 X116.946 Y129.508 E.00838
G1 X116.946 Y100.678 E1.13633
G1 X117.823 Y100.678 E.03457
G1 X117.712 Y100.824 E.00722
G1 X117.712 Y102.77 E.07671
G1 X117.823 Y102.881 E.00622
G1 X117.823 Y129.508 E1.0495
G1 X118.7 Y129.508 E.03457
G1 X118.7 Y103.085 E1.04147
G1 X119.577 Y103.085 E.03457
G1 X119.577 Y129.508 E1.04147
G1 X120.454 Y129.508 E.03457
G1 X120.454 Y103.085 E1.04147
G1 X121.331 Y103.085 E.03457
G1 X121.331 Y129.508 E1.04147
G1 X122.208 Y129.508 E.03457
G1 X122.208 Y103.085 E1.04147
G1 X123.086 Y103.085 E.03457
G1 X123.086 Y129.508 E1.04147
G1 X123.963 Y129.508 E.03457
G1 X123.963 Y103.085 E1.04147
G1 X124.473 Y103.085 E.02012
G1 X124.538 Y103.02 E.00362
; WIPE_START
G1 F24000
G1 X124.473 Y103.085 E-.03489
G1 X123.963 Y103.085 E-.19398
G1 X123.963 Y104.483 E-.53112
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.933 I1.184 J.283 P1  F30000
G1 X124.789 Y101.022 Z2.933
G1 Z2.533
G1 E.8 F1800
G1 F4800
G2 X124.643 Y100.678 I-.245 J-.099 E.01634
G1 X124.84 Y100.678 E.00774
G1 X124.84 Y130.058 E1.158
G2 X125.139 Y130.74 I7.137 J-2.718 E.02937
G1 X125.365 Y131.209 E.02052
G1 X125.365 Y100.678 E1.20338
G1 X125.028 Y100.678 E.01326
; WIPE_START
G1 F24000
G1 X125.365 Y100.678 E-.12784
G1 X125.365 Y102.342 E-.63216
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.933 I.069 J1.215 P1  F30000
G1 X154.472 Y100.678 Z2.933
G1 Z2.533
G1 E.8 F1800
G1 F4800
G1 X154.135 Y100.678 E.01326
G1 X154.135 Y131.209 E1.20339
G2 X154.66 Y130.058 I-13.179 J-6.704 E.04989
G1 X154.66 Y100.678 E1.15801
G1 X154.857 Y100.678 E.00774
G2 X154.712 Y101.022 I.099 J.245 E.01634
; WIPE_START
G1 F24000
G1 X154.712 Y100.824 E-.07541
G1 X154.857 Y100.678 E-.07808
G1 X154.66 Y100.678 E-.07464
G1 X154.66 Y102.078 E-.53187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.933 I.238 J1.193 P1  F30000
G1 X161.677 Y100.678 Z2.933
G1 Z2.533
G1 E.8 F1800
G1 F4800
G1 X161.789 Y100.824 E.00722
G1 X161.789 Y102.77 E.07671
G1 X161.677 Y102.881 E.00622
G1 X161.677 Y129.508 E1.0495
G1 X162.554 Y129.508 E.03457
G1 X162.554 Y100.678 E1.13633
G1 X162.767 Y100.678 E.00838
G1 X162.767 Y101.105 E.01683
; WIPE_START
G1 F24000
G1 X162.767 Y100.678 E-.16227
G1 X162.554 Y100.678 E-.08079
G1 X162.554 Y102.039 E-.51694
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.933 I-.845 J-.875 P1  F30000
G1 X161.544 Y103.015 Z2.933
G1 Z2.533
G1 E.8 F1800
G1 F4800
G1 X161.473 Y103.085 E.00393
G1 X160.8 Y103.085 E.02653
G1 X160.8 Y129.508 E1.04147
G1 X159.923 Y129.508 E.03457
G1 X159.923 Y103.085 E1.04147
G1 X159.046 Y103.085 E.03457
G1 X159.046 Y129.508 E1.04147
G1 X158.169 Y129.508 E.03457
G1 X158.169 Y103.085 E1.04147
G1 X157.292 Y103.085 E.03457
G1 X157.292 Y129.508 E1.04147
G1 X156.415 Y129.508 E.03457
G1 X156.415 Y103.085 E1.04147
G1 X155.537 Y103.085 E.03457
G1 X155.537 Y129.508 E1.04147
G2 X154.745 Y129.858 I-.207 J.604 E.03753
G1 X154.734 Y129.884 E.00112
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F24000
G1 X154.745 Y129.858 E-.01083
G1 X154.817 Y129.687 E-.07053
G1 X155.088 Y129.508 E-.12327
G1 X155.537 Y129.508 E-.17086
G1 X155.537 Y128.496 E-.38452
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/63
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
G3 Z2.933 I1.211 J.124 P1  F30000
G1 X158.25 Y101.945 Z2.933
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.014 J-1.217 P1  F30000
G1 X121.25 Y101.945 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.852 Y101.945 E.07954
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X121.31 Y101.945 E.07755
G1 X121.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y102.337 E.08573
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X121.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X119.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.686 J1.005 P1  F30000
M73 P55 R8
G1 X160.79 Y130.649 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X163.201 Y130.649 E.07999
G3 X165.447 Y133.915 I.01 J2.399 E.15474
G3 X114.292 Y134.475 I-25.69 J-9.982 E2.17454
G3 X113.928 Y133.472 I3.681 J-1.902 E.03549
G3 X116.295 Y130.649 I2.363 J-.423 E.13932
G1 X123.851 Y130.649 E.25064
G1 X124.018 Y131.043 E.01421
G2 X155.649 Y130.649 I15.729 J-7.121 E1.32662
G1 X160.73 Y130.649 E.16854
G1 X160.79 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.208 Y130.257 E.07432
G3 X165.813 Y134.057 I.002 J2.791 E.16653
G3 X113.931 Y134.628 I-26.055 J-10.121 E2.04297
G3 X113.521 Y133.403 I3.742 J-1.933 E.03984
G3 X116.29 Y130.257 I2.777 J-.347 E.14556
G1 X124.111 Y130.257 E.2403
G1 X124.376 Y130.881 E.02085
G2 X155.389 Y130.257 I15.373 J-6.961 E1.20896
G1 X160.73 Y130.257 E.1641
M204 S10000
; WIPE_START
G1 F24000
G1 X162.73 Y130.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.55 J-1.086 P1  F30000
G1 X153.506 Y134.925 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X154.46 Y133.606 I-12.419 J-9.983 E.05402
G1 X159.15 Y138.296 E.22003
G1 X158.73 Y138.296 E.01396
G1 X164.985 Y132.041 E.29344
G3 X165.119 Y133.796 I-2.08 J1.042 E.05987
G3 X164.265 Y135.735 I-17.996 J-6.773 E.07032
G1 X159.527 Y130.997 E.22227
G1 X158.353 Y130.997 E.03894
G1 X151.054 Y138.296 E.34243
G1 X151.474 Y138.296 E.01396
G1 X150.809 Y137.631 E.0312
G2 X152.027 Y136.551 I-13.39 J-16.324 E.054
G1 X149.954 Y138.291 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38664
G1 F15000
G1 X149.89 Y138.328 E.00208
G1 X149.939 Y138.357 E.00161
G1 X136.363 Y151.114 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.408699
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X140.408 Y151.114 E.21617
G2 X144.54 Y150.699 I-.907 J-29.797 E.22216
G1 X144.757 Y150.655 E.01187
G1 X134.76 Y150.655 E.53439
G3 X132.742 Y150.197 I3.245 J-18.939 E.11063
G1 X146.779 Y150.197 E.75028
G1 X148.31 Y149.738 E.08541
G1 X131.183 Y149.738 E.91545
G1 X129.908 Y149.279 E.0724
G1 X149.592 Y149.279 E1.0521
G1 X150.703 Y148.821 E.06428
G1 X128.797 Y148.821 E1.17094
G1 X127.819 Y148.362 E.05772
G1 X151.681 Y148.362 E1.27544
G2 X152.573 Y147.903 I-4.191 J-9.246 E.05363
G1 X126.927 Y147.903 E1.37079
G3 X126.099 Y147.445 I4.223 J-8.603 E.05063
G1 X153.398 Y147.445 E1.45918
G1 X154.156 Y146.986 E.04733
G1 X125.333 Y146.986 E1.54061
G3 X124.633 Y146.527 I4.287 J-7.307 E.04476
G1 X154.871 Y146.527 E1.61624
G2 X155.54 Y146.068 I-4.571 J-7.39 E.0434
G1 X123.96 Y146.068 E1.68799
G1 X123.342 Y145.61 E.04114
G1 X156.158 Y145.61 E1.75407
G2 X156.749 Y145.151 I-4.341 J-6.202 E.04
G1 X122.754 Y145.151 E1.81709
G1 X122.201 Y144.692 E.03838
G1 X157.307 Y144.692 E1.87645
G2 X157.834 Y144.234 I-4.374 J-5.553 E.03735
G1 X121.663 Y144.234 E1.93339
G1 X121.16 Y143.775 E.03638
G1 X158.339 Y143.775 E1.98726
G2 X158.811 Y143.316 I-3.95 J-4.539 E.03521
G1 X120.686 Y143.316 E2.03787
G1 X120.228 Y142.858 E.03463
G1 X159.264 Y142.858 E2.08652
G2 X159.709 Y142.399 I-4.733 J-5.034 E.03416
G1 X119.794 Y142.399 E2.13347
G1 X119.38 Y141.94 E.03304
G1 X160.394 Y141.94 E2.19224
M106 S219.3
G1 X162.802 Y138.729 F30000
M106 S255
G1 F3000
G1 X149.322 Y138.729 E.7205
G3 X148.572 Y139.188 I-4.244 J-6.099 E.04704
G1 X162.255 Y139.188 E.7314
G3 X161.943 Y139.647 I-4.621 J-2.811 E.02968
G1 X147.734 Y139.647 E.75946
G3 X146.751 Y140.105 I-5.019 J-9.477 E.05803
G1 X161.604 Y140.105 E.79393
G1 X161.266 Y140.564 E.03048
G1 X145.587 Y140.564 E.83804
G3 X144.065 Y141.023 I-8.393 J-25.09 E.08497
G1 X160.895 Y141.023 E.89955
G1 X160.52 Y141.481 E.03167
G1 X118.981 Y141.481 E2.22031
G1 X118.605 Y141.023 E.03167
G1 X135.435 Y141.023 E.89956
G1 X135.305 Y140.992 E.00711
G3 X133.914 Y140.564 I3.768 J-14.717 E.07785
G1 X118.234 Y140.564 E.83809
G1 X117.896 Y140.105 E.03048
G1 X132.748 Y140.105 E.79387
G3 X131.766 Y139.647 I3.923 J-9.68 E.05796
G1 X117.557 Y139.647 E.75948
G3 X117.24 Y139.188 I5.218 J-3.942 E.0298
G1 X130.922 Y139.188 E.73132
G3 X130.173 Y138.729 I4.519 J-8.224 E.04698
G1 X116.693 Y138.729 E.72055
M106 S219.3
G1 X124.208 Y132.207 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G2 X125.04 Y133.606 I15.785 J-8.438 E.054
G1 X120.35 Y138.296 E.22003
G1 X120.771 Y138.296 E.01396
G1 X114.508 Y132.034 E.29377
G2 X114.285 Y133.479 I2.032 J1.053 E.04936
G2 X115.235 Y135.735 I21.246 J-7.617 E.08124
G1 X119.972 Y130.999 E.22219
G1 X121.148 Y130.998 E.03903
G1 X128.446 Y138.296 E.34238
G1 X128.026 Y138.296 E.01396
M73 P56 R8
G1 X128.693 Y137.629 E.03128
G3 X127.477 Y136.547 I8.809 J-11.114 E.05401
G1 X129.594 Y138.289 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.389508
G1 F15000
G1 X129.529 Y138.327 E.00212
G1 X129.58 Y138.356 E.00165
M106 S242.25
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.529 Y138.327 E-.33249
G1 X129.594 Y138.289 E-.42751
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/63
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
G3 Z3 I.708 J-.989 P1  F30000
G1 X116.733 Y129.081 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F4800
G1 X116.733 Y129.508 E.01683
G1 X116.946 Y129.508 E.00838
G1 X116.946 Y100.678 E1.13633
G1 X117.823 Y100.678 E.03457
G1 X117.712 Y100.824 E.00722
G1 X117.712 Y102.77 E.07671
G1 X117.823 Y102.881 E.00622
G1 X117.823 Y129.508 E1.0495
G1 X118.7 Y129.508 E.03457
G1 X118.7 Y103.085 E1.04147
G1 X119.577 Y103.085 E.03457
G1 X119.577 Y129.508 E1.04147
G1 X120.454 Y129.508 E.03457
G1 X120.454 Y103.085 E1.04147
G1 X121.331 Y103.085 E.03457
G1 X121.331 Y129.508 E1.04147
G1 X122.208 Y129.508 E.03457
G1 X122.208 Y103.085 E1.04147
G1 X123.086 Y103.085 E.03457
G1 X123.086 Y129.508 E1.04147
G1 X123.963 Y129.508 E.03457
G1 X123.963 Y103.085 E1.04147
G1 X124.473 Y103.085 E.02012
G1 X124.538 Y103.02 E.00362
; WIPE_START
G1 F24000
G1 X124.473 Y103.085 E-.03489
G1 X123.963 Y103.085 E-.19398
G1 X123.963 Y104.483 E-.53112
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.184 J.283 P1  F30000
G1 X124.789 Y101.022 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4800
G2 X124.643 Y100.678 I-.245 J-.099 E.01634
G1 X124.84 Y100.678 E.00774
G1 X124.84 Y130.058 E1.158
G2 X125.176 Y130.818 I7.956 J-3.065 E.03279
G1 X125.365 Y131.209 E.0171
G1 X125.365 Y100.678 E1.20338
G1 X125.028 Y100.678 E.01326
; WIPE_START
G1 F24000
G1 X125.365 Y100.678 E-.12784
G1 X125.365 Y102.342 E-.63216
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.069 J1.215 P1  F30000
G1 X154.472 Y100.678 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4800
G1 X154.135 Y100.678 E.01326
G1 X154.135 Y131.209 E1.20339
G2 X154.66 Y130.058 I-13.317 J-6.767 E.04989
G1 X154.66 Y100.678 E1.15801
G1 X154.857 Y100.678 E.00774
M73 P57 R8
G2 X154.712 Y101.022 I.099 J.245 E.01634
; WIPE_START
G1 F24000
G1 X154.712 Y100.824 E-.07541
G1 X154.857 Y100.678 E-.07808
G1 X154.66 Y100.678 E-.07464
G1 X154.66 Y102.078 E-.53187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.238 J1.193 P1  F30000
G1 X161.677 Y100.678 Z3.2
G1 Z2.8
G1 E.8 F1800
M73 P57 R7
G1 F4800
G1 X161.789 Y100.824 E.00722
G1 X161.789 Y102.77 E.07671
G1 X161.677 Y102.881 E.00622
G1 X161.677 Y129.508 E1.0495
G1 X162.554 Y129.508 E.03457
G1 X162.554 Y100.678 E1.13633
G1 X162.767 Y100.678 E.00838
G1 X162.767 Y101.105 E.01683
; WIPE_START
G1 F24000
G1 X162.767 Y100.678 E-.16227
G1 X162.554 Y100.678 E-.08079
G1 X162.554 Y102.039 E-.51694
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.845 J-.875 P1  F30000
G1 X161.544 Y103.015 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4800
G1 X161.473 Y103.085 E.00393
G1 X160.8 Y103.085 E.02653
G1 X160.8 Y129.508 E1.04147
G1 X159.923 Y129.508 E.03457
G1 X159.923 Y103.085 E1.04147
G1 X159.046 Y103.085 E.03457
G1 X159.046 Y129.508 E1.04147
G1 X158.169 Y129.508 E.03457
G1 X158.169 Y103.085 E1.04147
G1 X157.292 Y103.085 E.03457
G1 X157.292 Y129.508 E1.04147
G1 X156.415 Y129.508 E.03457
G1 X156.415 Y103.085 E1.04147
G1 X155.537 Y103.085 E.03457
G1 X155.537 Y129.508 E1.04147
G2 X154.759 Y129.826 I-.206 J.608 E.03615
G1 X154.734 Y129.884 E.0025
; WIPE_START
G1 F24000
G1 X154.759 Y129.826 E-.02411
G1 X154.817 Y129.687 E-.05724
G1 X155.088 Y129.508 E-.12327
G1 X155.537 Y129.508 E-.17086
G1 X155.537 Y128.496 E-.38451
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.211 J.124 P1  F30000
G1 X158.25 Y101.945 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.014 J-1.217 P1  F30000
G1 X121.25 Y101.945 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.852 Y101.945 E.07954
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X121.31 Y101.945 E.07755
G1 X121.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y102.337 E.08573
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X121.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X119.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.686 J1.005 P1  F30000
G1 X160.794 Y130.649 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X163.205 Y130.649 E.07996
G3 X165.447 Y133.915 I.006 J2.399 E.15462
G3 X114.647 Y135.325 I-25.697 J-10.002 E2.14384
G3 X113.983 Y133.705 I36.215 J-15.81 E.05807
G3 X116.295 Y130.649 I2.306 J-.658 E.1473
G1 X123.851 Y130.649 E.25064
G1 X124.018 Y131.042 E.01416
G2 X155.649 Y130.649 I15.73 J-7.117 E1.32677
G1 X160.734 Y130.649 E.1687
G1 X160.794 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.21 Y130.257 E.07421
G3 X165.813 Y134.057 I.001 J2.791 E.16649
G3 X114.289 Y135.485 I-26.063 J-10.145 E2.01414
G3 X113.605 Y133.811 I33.467 J-14.661 E.05557
G3 X116.29 Y130.257 I2.684 J-.764 E.15851
G1 X124.111 Y130.257 E.2403
G1 X124.375 Y130.88 E.02081
G2 X155.389 Y130.257 I15.374 J-6.957 E1.20907
G1 X160.734 Y130.257 E.16424
M204 S10000
; WIPE_START
G1 F24000
G1 X162.734 Y130.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.549 J-1.086 P1  F30000
G1 X153.506 Y134.925 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X154.46 Y133.606 I-12.303 J-9.9 E.05402
G1 X159.15 Y138.296 E.22003
G1 X158.73 Y138.296 E.01396
G1 X164.985 Y132.041 E.29347
G3 X165.119 Y133.796 I-2.084 J1.042 E.05989
G3 X164.265 Y135.735 I-17.873 J-6.719 E.07032
G1 X159.527 Y130.997 E.22226
G1 X158.353 Y130.997 E.03894
G1 X151.054 Y138.296 E.34243
G1 X151.474 Y138.296 E.01396
G1 X150.809 Y137.631 E.0312
G2 X152.027 Y136.551 I-13.593 J-16.552 E.054
G1 X156.832 Y145.35 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422055
G1 F15000
G2 X159.607 Y142.566 I-261.873 J-263.752 E.12145
G2 X161.955 Y139.691 I-21.936 J-20.313 E.11474
G1 X155.458 Y146.176 E.28359
G3 X153.962 Y147.148 I-10.831 J-15.027 E.05515
G1 X162.422 Y138.688 E.36961
G1 X161.885 Y138.688 E.01657
G1 X152.694 Y147.88 E.4016
G3 X151.595 Y148.443 I-6.242 J-10.836 E.03815
G1 X161.349 Y138.688 E.42618
G1 X160.813 Y138.688 E.01657
G1 X150.599 Y148.903 E.44629
G1 X149.684 Y149.282 E.03059
G1 X160.277 Y138.688 E.46284
G1 X159.741 Y138.688 E.01657
G1 X148.835 Y149.595 E.47651
G3 X148.029 Y149.864 I-3.174 J-8.147 E.02626
G1 X159.205 Y138.688 E.48829
G1 X158.668 Y138.688 E.01657
G1 X147.257 Y150.1 E.4986
G3 X146.523 Y150.298 I-2.267 J-6.953 E.0235
G1 X158.132 Y138.688 E.50724
G1 X157.596 Y138.688 E.01657
G1 X145.808 Y150.476 E.51503
G3 X145.131 Y150.617 I-1.83 J-7.083 E.02139
M73 P58 R7
G1 X157.06 Y138.688 E.5212
G1 X156.524 Y138.688 E.01657
G1 X144.463 Y150.749 E.52696
G1 X143.832 Y150.843 E.01969
G1 X155.987 Y138.688 E.53107
G1 X155.451 Y138.688 E.01657
G1 X143.202 Y150.938 E.53519
G3 X142.599 Y151.004 I-.945 J-5.775 E.01875
G1 X154.915 Y138.688 E.53811
G1 X154.379 Y138.688 E.01657
G1 X142.006 Y151.062 E.54062
G3 X141.427 Y151.104 I-.717 J-5.831 E.01792
G1 X153.843 Y138.688 E.54246
G1 X153.307 Y138.688 E.01657
G1 X140.864 Y151.131 E.54362
G3 X140.304 Y151.154 I-.532 J-5.933 E.01732
G1 X152.77 Y138.688 E.54466
G1 X152.234 Y138.688 E.01657
G1 X139.768 Y151.154 E.54466
G1 X139.232 Y151.154 E.01657
G1 X151.698 Y138.688 E.54466
G1 X151.162 Y138.688 E.01657
G1 X138.716 Y151.134 E.54378
G1 X138.204 Y151.11 E.01584
G1 X150.626 Y138.688 E.54273
G1 X150.09 Y138.688 E.01657
G1 X137.697 Y151.081 E.54147
G1 X137.208 Y151.034 E.01517
G1 X149.915 Y138.327 E.55519
G1 X149.905 Y138.296 E.001
G3 X148.544 Y139.162 I-11.993 J-17.359 E.04986
G1 X136.719 Y150.987 E.51665
G3 X136.24 Y150.929 I.34 J-4.874 E.01491
G1 X147.391 Y139.778 E.48722
G1 X146.424 Y140.209 E.03272
G1 X135.772 Y150.861 E.46538
G1 X135.305 Y150.792 E.0146
G1 X145.574 Y140.523 E.44866
G3 X144.779 Y140.782 I-2.331 J-5.814 E.02584
G1 X134.85 Y150.711 E.43382
G1 X134.402 Y150.623 E.0141
G1 X144.032 Y140.993 E.42073
G3 X143.333 Y141.155 I-2.075 J-7.359 E.02215
G1 X133.954 Y150.534 E.40979
G3 X133.52 Y150.432 I.761 J-4.229 E.01379
G1 X142.674 Y141.278 E.39996
G3 X142.046 Y141.37 I-1.291 J-6.646 E.01961
G1 X133.092 Y150.324 E.39123
G1 X132.664 Y150.216 E.01364
G1 X141.441 Y141.439 E.38348
G3 X140.857 Y141.486 I-.83 J-6.667 E.01808
G1 X132.241 Y150.102 E.37645
G1 X131.83 Y149.977 E.01327
G1 X140.293 Y141.514 E.36976
G3 X139.752 Y141.52 I-.33 J-5.771 E.01674
G1 X131.419 Y149.852 E.36404
G3 X131.017 Y149.719 I1.203 J-4.31 E.01311
G1 X139.222 Y141.513 E.3585
G1 X138.71 Y141.489 E.01584
G1 X130.622 Y149.577 E.35339
G1 X130.227 Y149.436 E.01296
G1 X138.209 Y141.453 E.34878
G3 X137.72 Y141.407 I.272 J-5.471 E.0152
G1 X129.837 Y149.29 E.34442
G1 X129.457 Y149.133 E.01268
G1 X137.249 Y141.342 E.34042
G3 X136.784 Y141.27 I.525 J-4.991 E.01454
G1 X129.078 Y148.976 E.33667
G3 X128.699 Y148.819 I1.399 J-3.902 E.01268
G1 X136.332 Y141.186 E.33349
G3 X135.89 Y141.092 I.776 J-4.765 E.01398
G1 X128.336 Y148.646 E.33005
G1 X127.972 Y148.474 E.01244
G1 X135.456 Y140.99 E.32699
G3 X135.035 Y140.875 I.834 J-3.869 E.01349
G1 X127.608 Y148.302 E.32451
G3 X127.254 Y148.119 I1.675 J-3.682 E.0123
G1 X134.621 Y140.753 E.32187
G3 X134.209 Y140.628 I1.079 J-4.325 E.0133
G1 X126.905 Y147.933 E.31914
G1 X126.555 Y147.746 E.01224
G1 X133.811 Y140.49 E.31702
G3 X133.421 Y140.344 I1.669 J-5.076 E.01288
G1 X126.21 Y147.555 E.31503
G1 X125.875 Y147.353 E.01207
G1 X133.036 Y140.193 E.31285
G3 X132.665 Y140.027 I1.416 J-3.663 E.01254
G1 X125.54 Y147.152 E.3113
G1 X125.205 Y146.951 E.01207
G1 X132.296 Y139.86 E.30982
G3 X131.93 Y139.691 I1.439 J-3.593 E.01249
G1 X124.882 Y146.738 E.30792
G1 X124.561 Y146.523 E.01194
G1 X131.576 Y139.508 E.30652
G3 X131.227 Y139.321 I1.896 J-3.983 E.01225
G1 X124.24 Y146.308 E.30526
G3 X123.924 Y146.088 I2.071 J-3.307 E.0119
G1 X130.887 Y139.125 E.30421
G3 X130.549 Y138.927 I1.96 J-3.719 E.01211
G1 X123.616 Y145.859 E.30289
G1 X123.309 Y145.63 E.01184
G1 X130.222 Y138.717 E.30205
G3 X129.896 Y138.507 I1.647 J-2.91 E.01199
G1 X123.001 Y145.402 E.30124
G3 X122.705 Y145.161 I2.276 J-3.105 E.01178
G1 X129.179 Y138.688 E.28282
G1 X128.642 Y138.688 E.01657
G1 X122.411 Y144.919 E.27224
G1 X122.117 Y144.677 E.01177
G1 X128.106 Y138.688 E.26166
G1 X127.57 Y138.688 E.01657
G1 X121.828 Y144.43 E.25088
G1 X121.547 Y144.175 E.01173
G1 X127.034 Y138.688 E.23972
G1 X126.498 Y138.688 E.01657
G1 X121.266 Y143.92 E.22856
G1 X120.986 Y143.664 E.01173
G1 X125.962 Y138.688 E.2174
G1 X125.425 Y138.688 E.01657
G1 X120.715 Y143.398 E.20578
G1 X120.448 Y143.13 E.01171
G1 X124.889 Y138.688 E.19404
G1 X124.353 Y138.688 E.01657
G1 X120.18 Y142.861 E.18231
G3 X119.916 Y142.589 I2.619 J-2.808 E.01172
G1 X123.817 Y138.688 E.17042
G1 X123.281 Y138.688 E.01657
G1 X119.662 Y142.307 E.1581
G1 X119.408 Y142.025 E.01173
G1 X122.744 Y138.688 E.14579
G1 X122.208 Y138.688 E.01657
G1 X119.153 Y141.743 E.13347
G3 X118.909 Y141.452 I2.826 J-2.623 E.01176
G1 X121.672 Y138.688 E.12074
G1 X121.136 Y138.688 E.01657
G1 X118.668 Y141.157 E.10784
G1 X118.427 Y140.861 E.01177
G1 X120.6 Y138.688 E.09494
G1 X120.064 Y138.688 E.01657
G1 X118.188 Y140.564 E.08194
G1 X117.961 Y140.255 E.01185
G1 X119.527 Y138.688 E.06845
G1 X118.991 Y138.688 E.01657
G1 X117.733 Y139.946 E.05496
G1 X117.506 Y139.638 E.01185
G1 X118.455 Y138.688 E.04148
G1 X117.919 Y138.688 E.01657
G1 X117.286 Y139.321 E.02765
G1 X117.07 Y139.001 E.01193
G1 X117.552 Y138.519 E.02107
G1 X124.208 Y132.207 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X125.04 Y133.606 I15.658 J-8.365 E.054
G1 X120.35 Y138.296 E.22003
G1 X120.771 Y138.296 E.01396
G1 X114.508 Y132.034 E.29377
G2 X114.285 Y133.477 I2.031 J1.053 E.0493
G2 X115.235 Y135.735 I21.251 J-7.615 E.08129
G1 X119.972 Y130.999 E.22219
G1 X121.148 Y130.998 E.03903
G1 X128.446 Y138.296 E.34238
G1 X128.026 Y138.296 E.01396
G1 X128.693 Y137.63 E.03128
G3 X127.478 Y136.547 I8.701 J-10.988 E.05401
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.693 Y137.63 E-.61838
G1 X128.429 Y137.893 E-.14162
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/63
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
G3 Z3.2 I.937 J.777 P1  F30000
G1 X158.25 Y101.945 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.014 J-1.217 P1  F30000
G1 X121.25 Y101.945 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.852 Y101.945 E.07954
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X121.31 Y101.945 E.07755
G1 X121.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y102.337 E.08573
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X121.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X119.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.16 J.367 P1  F30000
G1 X130.804 Y138.694 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X130.752 Y138.87 E.00608
G1 X116.583 Y138.87 E.47004
G3 X113.983 Y133.706 I24.206 J-15.423 E.19209
G3 X116.295 Y130.649 I2.306 J-.659 E.14734
G1 X123.851 Y130.649 E.25064
G1 X124.017 Y131.039 E.01408
G2 X130.752 Y138.663 I15.841 J-7.21 E.34244
; WIPE_START
G1 F24000
G1 X130.752 Y138.87 E-.07876
G1 X128.96 Y138.87 E-.68124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.304 J1.178 P1  F30000
G1 X160.799 Y130.651 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X163.341 Y130.653 E.0843
G3 X165.447 Y133.915 I-.134 J2.398 E.15001
G3 X162.909 Y138.87 I-25.492 J-9.933 E.18501
G1 X148.748 Y138.87 E.46974
G1 X148.699 Y138.69 E.0062
G2 X155.649 Y130.649 I-8.918 J-14.732 E.35841
G1 X160.739 Y130.651 E.16885
G1 X160.799 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.209 Y130.257 E.07405
G3 X165.813 Y134.057 I.001 J2.791 E.1665
G3 X114.294 Y135.495 I-26.063 J-10.147 E2.01375
G3 X113.605 Y133.812 I35.738 J-15.608 E.05588
G3 X116.29 Y130.257 I2.684 J-.765 E.15855
G1 X124.111 Y130.257 E.2403
G1 X124.374 Y130.878 E.02075
G2 X155.389 Y130.257 I15.374 J-6.959 E1.20903
G1 X160.739 Y130.257 E.16439
M204 S10000
; WIPE_START
G1 F24000
G1 X162.739 Y130.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.549 J-1.086 P1  F30000
G1 X153.506 Y134.925 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X154.461 Y133.607 I-11.794 J-9.554 E.05402
G1 X159.376 Y138.522 E.23055
G1 X158.504 Y138.522 E.0289
G1 X164.991 Y132.035 E.30429
G3 X165.156 Y133.693 I-2.065 J1.043 E.05654
G3 X164.265 Y135.735 I-17.528 J-6.436 E.07394
G1 X159.529 Y130.999 E.22217
G1 X158.352 Y130.998 E.03905
G1 X150.828 Y138.522 E.35293
G1 X151.7 Y138.522 E.0289
G1 X150.809 Y137.631 E.04176
G2 X152.025 Y136.549 I-12.72 J-15.516 E.054
G1 X149.871 Y138.442 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.303334
G1 F15000
G1 X149.187 Y138.65 E.01519
G1 X148.535 Y138.833 F30000
; LINE_WIDTH: 0.322932
G1 F15000
G1 X147.716 Y139.05 E.01933
G1 X147.715 Y139.046 F30000
; LINE_WIDTH: 0.135226
G1 F15000
G1 X148.537 Y138.841 E.00637
G1 X162.136 Y139.092 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X162.646 Y139.603 E.02219
G1 X162.43 Y139.919
G1 X161.602 Y139.092 E.03595
G1 X161.069 Y139.092
G1 X162.204 Y140.227 E.0493
G1 X161.978 Y140.534
G1 X160.536 Y139.092 E.06265
G1 X160.003 Y139.092
G1 X161.752 Y140.841 E.076
G1 X161.516 Y141.138
G1 X159.469 Y139.092 E.08892
G1 X158.936 Y139.092
G1 X161.276 Y141.432 E.10169
G1 X161.037 Y141.726
G1 X158.403 Y139.092 E.11446
M73 P59 R7
G1 X157.87 Y139.092
G1 X160.796 Y142.018 E.12715
G1 X160.543 Y142.299
G1 X157.336 Y139.092 E.13935
G1 X156.803 Y139.092
G1 X160.291 Y142.58 E.15155
G1 X160.038 Y142.86
G1 X156.27 Y139.092 E.16375
G1 X155.737 Y139.092
G1 X159.777 Y143.133 E.17559
G1 X159.512 Y143.401
G1 X155.203 Y139.092 E.18723
G1 X154.67 Y139.092
G1 X159.246 Y143.669 E.19886
G1 X158.981 Y143.936
G1 X154.137 Y139.092 E.2105
G1 X153.603 Y139.092
G1 X158.704 Y144.192 E.22162
G1 X158.425 Y144.447
G1 X153.07 Y139.092 E.23267
G1 X152.537 Y139.092
G1 X158.146 Y144.701 E.24372
G1 X157.863 Y144.952
G1 X152.004 Y139.092 E.25463
G1 X151.47 Y139.092
G1 X157.571 Y145.193 E.26511
G1 X157.279 Y145.434
G1 X150.937 Y139.092 E.27558
G1 X150.404 Y139.092
G1 X156.987 Y145.675 E.28606
G1 X156.686 Y145.908
G1 X149.871 Y139.092 E.29616
G1 X149.337 Y139.092
G1 X156.38 Y146.135 E.30606
G1 X156.075 Y146.363
G1 X148.804 Y139.092 E.31596
G1 X148.271 Y139.092
G1 X155.769 Y146.59 E.32583
G1 X155.45 Y146.805
G1 X147.737 Y139.092 E.33514
G1 X147.338 Y139.227
G1 X155.131 Y147.019 E.33862
G1 X154.812 Y147.233
G1 X146.978 Y139.399 E.34044
G1 X146.612 Y139.567
G1 X154.485 Y147.439 E.3421
G1 X154.152 Y147.64
G1 X146.238 Y139.726 E.34389
G1 X145.855 Y139.876
G1 X153.82 Y147.841 E.3461
G1 X153.487 Y148.041
G1 X145.465 Y140.02 E.34858
G1 X145.069 Y140.157
G1 X153.141 Y148.228 E.35075
G1 X152.794 Y148.414
G1 X144.664 Y140.284 E.35329
G1 X144.248 Y140.402
G1 X152.447 Y148.601 E.35628
G1 X152.092 Y148.78
G1 X143.823 Y140.51 E.35936
G1 X143.391 Y140.612
G1 X151.731 Y148.952 E.36238
G1 X151.369 Y149.123
G1 X142.947 Y140.701 E.36601
G1 X142.497 Y140.784
G1 X151.007 Y149.294 E.36979
G1 X150.63 Y149.45
G1 X142.029 Y140.85 E.37374
G1 X141.554 Y140.908
G1 X150.253 Y149.607 E.378
G1 X149.876 Y149.764
G1 X141.067 Y140.954 E.38283
G1 X140.562 Y140.982
G1 X149.489 Y149.909 E.38791
G1 X149.097 Y150.05
G1 X140.049 Y141.002 E.39317
G1 X139.516 Y141.002
G1 X148.704 Y150.191 E.3993
G1 X148.303 Y150.324
G1 X138.963 Y140.984 E.40586
G1 X138.397 Y140.95
G1 X147.895 Y150.448 E.41273
G1 X147.486 Y150.573
G1 X137.809 Y140.895 E.42053
G1 X137.19 Y140.81
G1 X147.074 Y150.694 E.42947
G1 X146.647 Y150.801
G1 X136.546 Y140.699 E.43896
G1 X135.869 Y140.556
G1 X146.221 Y150.908 E.44985
G1 X145.793 Y151.013
G1 X135.155 Y140.375 E.46227
G1 X134.391 Y140.144
G1 X145.348 Y151.101 E.47615
G1 X144.903 Y151.19
G1 X133.554 Y139.84 E.49319
G1 X132.632 Y139.452
G1 X144.457 Y151.277 E.51386
G1 X143.993 Y151.345
G1 X131.739 Y139.092 E.53246
G1 X131.206 Y139.092
G1 X143.528 Y151.414 E.53545
G1 X143.06 Y151.48
G1 X130.673 Y139.092 E.53829
G1 X130.14 Y139.092
G1 X142.575 Y151.528 E.54038
G1 X142.09 Y151.576
G1 X129.606 Y139.092 E.54247
G1 X129.073 Y139.092
G1 X141.594 Y151.613 E.5441
G1 X141.086 Y151.638
G1 X128.54 Y139.092 E.54519
G1 X128.006 Y139.092
G1 X140.578 Y151.663 E.54628
G1 X140.052 Y151.671
G1 X127.473 Y139.092 E.54662
G1 X126.94 Y139.092
G1 X139.519 Y151.671 E.54661
G1 X138.982 Y151.667
G1 X126.407 Y139.092 E.54646
G1 X125.873 Y139.092
G1 X138.42 Y151.639 E.54523
G1 X137.859 Y151.611
G1 X125.34 Y139.092 E.54401
G1 X124.807 Y139.092
G1 X137.277 Y151.562 E.54189
G1 X136.685 Y151.504
G1 X124.274 Y139.092 E.53935
G1 X123.74 Y139.092
G1 X136.078 Y151.43 E.53614
G1 X135.452 Y151.337
G1 X123.207 Y139.092 E.5321
G1 X122.674 Y139.092
G1 X134.815 Y151.233 E.52758
G1 X134.149 Y151.101
G1 X122.14 Y139.092 E.52182
G1 X121.607 Y139.092
G1 X133.471 Y150.956 E.51553
G1 X132.759 Y150.777
G1 X121.074 Y139.092 E.50776
G1 X120.541 Y139.092
G1 X132.025 Y150.577 E.49905
G1 X131.259 Y150.344
G1 X120.007 Y139.092 E.48893
G1 X119.474 Y139.092
G1 X130.447 Y150.065 E.47683
G1 X129.604 Y149.755
G1 X118.941 Y139.092 E.46335
G1 X118.408 Y139.092
G1 X128.689 Y149.374 E.4468
G1 X127.702 Y148.92
G1 X117.874 Y139.092 E.42707
G1 X117.341 Y139.092
G1 X126.613 Y148.364 E.40292
M204 S10000
; WIPE_START
G1 F24000
G1 X125.199 Y146.95 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.183 J.287 P1  F30000
G1 X125.37 Y147.654 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X116.808 Y139.092 E.37206
G1 X116.986 Y139.803
M73 P60 R7
G1 X123.856 Y146.674 E.29857
M204 S10000
; WIPE_START
G1 F24000
G1 X122.442 Y145.26 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.583 J1.068 P1  F30000
G1 X132.375 Y150.683 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881702
G1 F15000
G1 X132.084 Y150.518 E.00123
; WIPE_START
G1 F24000
G1 X132.375 Y150.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.399 J-1.15 P1  F30000
G1 X129.103 Y149.547 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881699
G1 F15000
G1 X128.986 Y149.469 E.00052
; LINE_WIDTH: 0.128951
G1 X128.869 Y149.39 E.00099
; LINE_WIDTH: 0.169732
G1 X128.752 Y149.312 E.00146
; WIPE_START
G1 F24000
G1 X128.869 Y149.39 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.482 J-1.118 P1  F30000
G1 X127.128 Y148.64 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881693
G1 F15000
G1 X126.977 Y148.528 E.00069
; LINE_WIDTH: 0.132255
G1 X126.826 Y148.415 E.00137
; LINE_WIDTH: 0.17634
G1 X126.674 Y148.303 E.00205
G1 X125.966 Y148.012 F30000
; LINE_WIDTH: 0.0881704
G1 F15000
G1 X125.788 Y147.872 E.00084
; LINE_WIDTH: 0.133921
G1 X125.609 Y147.733 E.00168
; LINE_WIDTH: 0.179671
G1 X125.431 Y147.593 E.00252
G1 X124.574 Y147.154 F30000
; LINE_WIDTH: 0.0881703
G1 F15000
G1 X124.355 Y146.974 E.00105
; LINE_WIDTH: 0.135588
G1 X124.136 Y146.794 E.00214
; LINE_WIDTH: 0.183005
G1 X123.917 Y146.614 E.00324
; WIPE_START
G1 F24000
G1 X124.136 Y146.794 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.683 J-1.007 P1  F30000
G1 X122.716 Y145.83 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881694
G1 F15000
G1 X122.592 Y145.723 E.0006
; LINE_WIDTH: 0.108464
G1 X122.266 Y145.426 E.00235
; LINE_WIDTH: 0.15033
G1 X121.94 Y145.13 E.00386
; LINE_WIDTH: 0.192197
G1 X121.614 Y144.834 E.00536
; LINE_WIDTH: 0.234063
G1 X121.12 Y144.362 E.01063
; LINE_WIDTH: 0.286666
G3 X119.664 Y142.925 I28.401 J-30.24 E.04065
; LINE_WIDTH: 0.292998
G1 X119.194 Y142.43 E.01391
; LINE_WIDTH: 0.257223
G1 X118.724 Y141.935 E.01192
; LINE_WIDTH: 0.22145
G1 X118.426 Y141.605 E.00646
; LINE_WIDTH: 0.177024
G1 X118.129 Y141.275 E.00486
; LINE_WIDTH: 0.132597
G1 X117.831 Y140.945 E.00325
; WIPE_START
G1 F24000
G1 X118.129 Y141.275 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.023 J-.659 P1  F30000
G1 X116.722 Y139.093 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881696
G1 F15000
G1 X116.617 Y139.106 E.00039
; LINE_WIDTH: 0.121993
G1 X116.572 Y139.127 E.00032
G1 X116.579 Y139.149 E.00015
; LINE_WIDTH: 0.136968
G1 X116.646 Y139.299 E.00126
G1 X132.57 Y139.514 F30000
; LINE_WIDTH: 0.214277
G1 F15000
G1 X132.445 Y139.426 E.00213
; LINE_WIDTH: 0.172324
G1 X132.32 Y139.338 E.00161
; LINE_WIDTH: 0.124796
G1 X132.177 Y139.236 E.00117
; WIPE_START
G1 F24000
G1 X132.32 Y139.338 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.372 J1.159 P1  F30000
G1 X137.121 Y140.88 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0947739
G1 F15000
G1 X136.898 Y140.762 E.00106
G1 X137.122 Y140.878 F30000
; LINE_WIDTH: 0.132529
G1 F15000
G1 X136.898 Y140.763 E.00184
; WIPE_START
G1 F24000
G1 X137.122 Y140.878 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.051 J1.216 P1  F30000
G1 X143.365 Y140.617 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.116049
G1 F15000
G1 X143.212 Y140.7 E.00103
; WIPE_START
G1 F24000
G1 X143.365 Y140.617 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.163 J-1.206 P1  F30000
G1 X131.789 Y139.048 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.214206
G1 F15000
G1 X130.966 Y138.838 E.01186
G1 X130.313 Y138.651 F30000
; LINE_WIDTH: 0.313784
G1 F15000
G1 X129.632 Y138.442 E.01574
G1 X127.473 Y136.552 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X128.696 Y137.626 I11.59 J-11.96 E.054
G1 X127.8 Y138.522 E.042
G1 X128.672 Y138.522 E.0289
G1 X121.148 Y130.998 E.35294
G1 X119.972 Y130.999 E.03903
G1 X115.235 Y135.735 E.22219
G3 X114.273 Y133.417 I19.776 J-9.569 E.08331
G3 X114.509 Y132.035 I2.101 J-.352 E.04738
G1 X120.996 Y138.522 E.30431
G1 X120.125 Y138.522 E.0289
G1 X125.04 Y133.606 E.23061
G3 X124.208 Y132.207 I14.701 J-9.692 E.054
M106 S232.05
; CHANGE_LAYER
; Z_HEIGHT: 3.05714
; LAYER_HEIGHT: 0.057143
; WIPE_START
G1 F24000
G1 X125.04 Y133.606 E-.61841
G1 X124.777 Y133.869 E-.14159
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/63
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
G3 Z3.4 I1.217 J.003 P1  F30000
G1 X124.789 Y129.638 Z3.4
G1 Z3.057
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G2 X125.056 Y130.57 I1.235 J.15 E.03808
G1 X125.365 Y131.209 E.02715
G1 X125.365 Y129.449 E.06729
G1 X124.789 Y129.449 E.02202
G1 X124.789 Y126.572 E.10997
G1 X125.365 Y126.572 E.02202
G1 X125.365 Y123.695 E.10997
G1 X124.789 Y123.695 E.02202
G1 X124.789 Y120.818 E.10997
G1 X125.365 Y120.818 E.02202
G1 X125.365 Y117.941 E.10997
G1 X124.789 Y117.941 E.02202
G1 X124.789 Y115.064 E.10997
G1 X125.365 Y115.064 E.02202
G1 X125.365 Y112.187 E.10997
G1 X124.789 Y112.187 E.02202
G1 X124.789 Y109.309 E.10997
G1 X125.365 Y109.309 E.02202
G1 X125.365 Y106.432 E.10997
G1 X124.789 Y106.432 E.02202
G1 X124.789 Y103.555 E.10997
G1 X125.365 Y103.555 E.02202
G1 X125.365 Y100.678 E.10997
G1 X124.643 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X125.365 Y100.678 E-.27411
G1 X125.365 Y101.957 E-.48589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.457 I.178 J-1.204 P1  F30000
G1 X116.733 Y100.678 Z3.457
G1 Z3.057
G1 E.8 F1800
G1 F9000
G1 X117.857 Y100.678 E.04294
G1 X117.712 Y100.824 E.00785
G1 X117.712 Y103.555 E.10441
G1 X116.733 Y103.555 E.03738
G1 X116.733 Y106.432 E.10997
G1 X117.712 Y106.432 E.03738
G1 X117.712 Y109.309 E.10997
G1 X116.733 Y109.309 E.03738
G1 X116.733 Y112.187 E.10997
G1 X117.712 Y112.187 E.03738
G1 X117.712 Y115.064 E.10997
G1 X116.733 Y115.064 E.03738
G1 X116.733 Y117.941 E.10997
G1 X117.712 Y117.941 E.03738
G1 X117.712 Y120.818 E.10997
G1 X116.733 Y120.818 E.03738
G1 X116.733 Y123.695 E.10997
G1 X117.712 Y123.695 E.03738
G1 X117.712 Y126.572 E.10997
G1 X116.733 Y126.572 E.03738
G1 X116.733 Y129.449 E.10997
G1 X117.712 Y129.449 E.03738
; WIPE_START
G1 F24000
G1 X116.733 Y129.449 E-.37168
G1 X116.733 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.457 I-.039 J1.216 P1  F30000
G1 X154.135 Y129.638 Z3.457
G1 Z3.057
G1 E.8 F1800
G1 F9000
G1 X154.135 Y131.209 E.06008
G2 X154.712 Y129.937 I-12.806 J-6.565 E.0534
G1 X154.712 Y129.449 E.01866
G1 X154.135 Y129.449 E.02202
G1 X154.135 Y126.572 E.10997
G1 X154.712 Y126.572 E.02202
G1 X154.712 Y123.695 E.10997
G1 X154.135 Y123.695 E.02202
G1 X154.135 Y120.818 E.10997
G1 X154.712 Y120.818 E.02202
G1 X154.712 Y117.941 E.10997
G1 X154.135 Y117.941 E.02202
G1 X154.135 Y115.064 E.10997
G1 X154.712 Y115.064 E.02202
G1 X154.712 Y112.187 E.10997
G1 X154.135 Y112.187 E.02202
G1 X154.135 Y109.309 E.10997
G1 X154.712 Y109.309 E.02202
G1 X154.712 Y106.432 E.10997
G1 X154.135 Y106.432 E.02202
G1 X154.135 Y103.555 E.10997
G1 X154.712 Y103.555 E.02202
G1 X154.712 Y100.824 E.10441
G1 X154.857 Y100.678 E.00785
G1 X154.135 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X154.857 Y100.678 E-.27411
G1 X154.712 Y100.824 E-.07807
G1 X154.712 Y101.897 E-.40783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.457 I.211 J1.199 P1  F30000
G1 X161.643 Y100.678 Z3.457
G1 Z3.057
G1 E.8 F1800
G1 F9000
G1 X162.767 Y100.678 E.04294
G1 X162.767 Y103.555 E.10997
G1 X161.789 Y103.555 E.03738
G1 X161.789 Y106.432 E.10997
G1 X162.767 Y106.432 E.03738
G1 X162.767 Y109.309 E.10997
G1 X161.789 Y109.309 E.03738
G1 X161.789 Y112.187 E.10997
G1 X162.767 Y112.187 E.03738
G1 X162.767 Y115.064 E.10997
G1 X161.789 Y115.064 E.03738
G1 X161.789 Y117.941 E.10997
G1 X162.767 Y117.941 E.03738
G1 X162.767 Y120.818 E.10997
G1 X161.789 Y120.818 E.03738
G1 X161.789 Y123.695 E.10997
G1 X162.767 Y123.695 E.03738
G1 X162.767 Y126.572 E.10997
G1 X161.789 Y126.572 E.03738
G1 X161.789 Y129.449 E.10997
G1 X162.767 Y129.449 E.03738
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.142857
; WIPE_START
G1 F24000
G1 X161.789 Y129.449 E-.37168
G1 X161.789 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/63
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
G3 Z3.457 I-1.083 J-.556 P1  F30000
G1 X160.648 Y130.649 Z3.457
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X163.205 Y130.649 E.08481
G3 X165.447 Y133.914 I.005 J2.399 E.1546
G3 X162.595 Y139.346 I-25.572 J-9.967 E.20392
G1 X147.919 Y139.346 E.48681
G1 X147.872 Y139.162 E.00628
G2 X155.852 Y130.144 I-8.113 J-15.219 E.40804
G1 X155.852 Y129.847 E.00987
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X155.852 Y102.747 E.89896
M106 S232.05
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X155.852 Y101.649 E.03642
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y102.747 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X160.648 Y129.847 E.89896
M106 S232.05
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X160.648 Y130.229 E.01269
G1 X160.648 Y130.589 E.01193
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.21 Y130.257 E.06667
G3 X165.813 Y134.057 I0 J2.792 E.16647
G1 X165.2 Y135.508 E.04837
G3 X162.806 Y139.738 I-28.427 J-13.299 E.14951
G1 X145.64 Y139.738 E.52747
G2 X155.46 Y130.089 I-5.948 J-15.876 E.4356
G1 X155.46 Y129.847 E.00746
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X155.46 Y102.747 E.89896
M106 S232.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.46 Y101.257 E.04578
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.747 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X161.04 Y129.847 E.89896
M106 S232.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X161.04 Y130.197 E.01075
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.297 J-1.18 P1  F30000
G1 X160.12 Y130.988 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.431176
M106 S255
G1 F3000
G1 X160.12 Y101.982 E.91769
G1 X159.731 Y101.982 E.01228
G1 X159.731 Y130.818 E.91232
G1 X159.343 Y130.818 E.01228
G1 X159.343 Y101.982 E.91232
G1 X158.955 Y101.982 E.01228
G1 X158.955 Y130.818 E.91232
G1 X158.567 Y130.818 E.01228
G1 X158.567 Y101.982 E.91232
G1 X158.178 Y101.982 E.01228
G1 X158.178 Y130.818 E.91232
G1 X157.79 Y130.818 E.01228
G1 X157.79 Y101.982 E.91232
G1 X157.402 Y101.982 E.01228
G1 X157.402 Y130.818 E.91232
G1 X157.014 Y130.818 E.01228
G1 X157.014 Y101.982 E.91232
G1 X156.625 Y101.982 E.01228
G1 X156.625 Y130.818 E.91232
G1 X156.237 Y130.818 E.01228
M73 P61 R7
G1 X156.237 Y101.812 E.91769
M106 S232.05
; WIPE_START
G1 F24000
G1 X156.237 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.212 J-.106 P1  F30000
G1 X153.506 Y134.925 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X154.46 Y133.606 I-12.203 J-9.824 E.05402
G1 X159.257 Y138.403 E.22504
G1 X158.623 Y138.403 E.02102
G1 X164.989 Y132.037 E.29865
G3 X165.12 Y133.796 I-1.859 J1.022 E.06034
G3 X164.265 Y135.735 I-17.639 J-6.617 E.07033
G1 X159.74 Y131.21 E.21226
G1 X158.14 Y131.21 E.05309
G1 X150.947 Y138.403 E.33742
G1 X151.581 Y138.403 E.02102
G1 X150.81 Y137.631 E.03619
G2 X152.027 Y136.551 I-14.016 J-17.029 E.054
G1 X150.197 Y138.874 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.578606
G1 F11760.621
G1 X162.281 Y138.874 E.52749
G1 X149.531 Y138.646 F30000
; LINE_WIDTH: 0.463828
G1 F14967.64
G1 X149.615 Y138.932 E.01021
G1 X149.809 Y138.912 E.00669
; LINE_WIDTH: 0.502088
G1 F13720.487
G1 X150.003 Y138.893 E.00729
; LINE_WIDTH: 0.540347
G1 F12665.183
G1 X150.197 Y138.874 E.0079
; LINE_WIDTH: 0.578606
G1 F11760.621
G1 X150.129 Y138.803 E.0043
; LINE_WIDTH: 0.540347
G1 F12665.183
G1 X150.061 Y138.731 E.00399
; LINE_WIDTH: 0.468612
G1 F14799.457
G1 X149.993 Y138.66 E.00342
G1 X149.909 Y138.384 E.01002
G1 X149.58 Y138.612 E.0139
G1 X149.176 Y138.908 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407651
G1 F15000
G3 X148.405 Y139.128 I-10.882 J-36.673 E.02383
G1 X147.706 Y139.303 F30000
; LINE_WIDTH: 0.32458
G1 F15000
G1 X146.74 Y139.525 E.02274
; WIPE_START
G1 F24000
G1 X147.706 Y139.303 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.35 J-1.166 P1  F30000
G1 X118.852 Y130.649 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.852 Y129.847 E.02661
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X118.852 Y102.747 E.89896
M106 S232.05
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X118.852 Y101.649 E.03642
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y102.747 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X123.648 Y129.847 E.89896
M106 S232.05
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X123.648 Y130.144 E.00987
G2 X123.674 Y130.229 I.113 J.012 E.00302
G2 X131.629 Y139.159 I16.101 J-6.335 E.40507
G1 X131.583 Y139.346 E.00636
G1 X116.9 Y139.346 E.48708
G3 X114.351 Y134.613 I21.798 J-14.794 E.17861
G3 X114.019 Y133.822 I7.054 J-3.421 E.02848
G3 X116.295 Y130.649 I2.27 J-.774 E.15134
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y129.847 E.0126
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X118.46 Y102.747 E.89896
M106 S232.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y101.257 E.04578
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.747 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X124.04 Y129.847 E.89896
M106 S232.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X124.04 Y130.052 E.0063
G2 X124.094 Y130.216 I.355 J-.025 E.00535
G2 X133.859 Y139.738 I15.693 J-6.326 E.43137
G1 X116.691 Y139.738 E.52753
G3 X113.99 Y134.766 I22.207 J-15.286 E.17419
G3 X113.647 Y133.946 I7.311 J-3.536 E.02732
G3 X116.29 Y130.257 I2.643 J-.898 E.16283
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.46 Y129.847 E-.15746
G1 X118.46 Y128.261 E-.60254
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.601 J1.058 P1  F30000
G1 X123.263 Y130.988 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.431082
M106 S255
G1 F3000
G1 X123.263 Y101.982 E.91746
G1 X122.875 Y101.982 E.01228
G1 X122.875 Y130.818 E.9121
G1 X122.487 Y130.818 E.01228
G1 X122.487 Y101.982 E.9121
G1 X122.099 Y101.982 E.01228
G1 X122.099 Y130.818 E.9121
G1 X121.711 Y130.818 E.01228
G1 X121.711 Y101.982 E.9121
G1 X121.323 Y101.982 E.01228
G1 X121.323 Y130.818 E.9121
G1 X120.934 Y130.818 E.01228
G1 X120.934 Y101.982 E.9121
M73 P62 R7
G1 X120.546 Y101.982 E.01228
G1 X120.546 Y130.818 E.9121
G1 X120.158 Y130.818 E.01228
G1 X120.158 Y101.982 E.9121
G1 X119.77 Y101.982 E.01228
G1 X119.77 Y130.818 E.9121
G1 X119.382 Y130.818 E.01228
G1 X119.382 Y101.812 E.91746
M106 S232.05
; WIPE_START
G1 F24000
G1 X119.382 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.2 J.204 P1  F30000
G1 X124.209 Y132.207 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X125.039 Y133.607 I16.345 J-8.755 E.054
G1 X120.243 Y138.403 E.22498
G1 X120.877 Y138.403 E.02102
G1 X114.513 Y132.038 E.29857
G2 X114.273 Y133.413 I1.797 J1.022 E.04721
G2 X115.235 Y135.735 I18.529 J-6.322 E.08344
G1 X119.76 Y131.21 E.21226
G1 X121.36 Y131.21 E.05309
G1 X128.553 Y138.403 E.33742
G1 X127.919 Y138.403 E.02102
G1 X128.696 Y137.626 E.03643
G3 X127.473 Y136.552 I10.322 J-12.989 E.054
G1 X130.325 Y138.911 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.34956
G1 F15000
G1 X131.099 Y139.128 E.02009
G1 X131.796 Y139.302 F30000
; LINE_WIDTH: 0.36961
G1 F15000
G1 X132.76 Y139.528 E.02638
G1 X132.762 Y139.521 F30000
; LINE_WIDTH: 0.16003
G1 F15000
G1 X131.793 Y139.311 E.00946
G1 X117.152 Y138.874 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.578606
G1 F11760.621
G1 X129.246 Y138.874 E.52792
G1 X129.97 Y138.65 F30000
; LINE_WIDTH: 0.460283
G1 F15000
G1 X129.591 Y138.388 E.01566
G1 X129.486 Y138.674 E.01038
; LINE_WIDTH: 0.428711
G1 X129.426 Y138.741 E.00282
; LINE_WIDTH: 0.478676
G1 F14457.631
G1 X129.366 Y138.807 E.00319
; LINE_WIDTH: 0.528641
G1 F12970.41
G1 X129.306 Y138.874 E.00355
; LINE_WIDTH: 0.578606
G1 F11760.621
M73 P62 R6
G1 X129.439 Y138.894 E.00589
; LINE_WIDTH: 0.539165
G1 F12695.341
G1 X129.573 Y138.914 E.00545
; LINE_WIDTH: 0.469893
G1 F14755.048
G2 X129.89 Y138.933 I.226 J-1.065 E.01111
G1 X129.953 Y138.708 E.00816
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3.31429
; LAYER_HEIGHT: 0.114286
; WIPE_START
G1 F24000
G1 X129.89 Y138.933 E-.32239
G1 X129.573 Y138.914 E-.43761
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/63
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
G3 Z3.6 I1.082 J-.558 P1  F30000
G1 X124.789 Y129.638 Z3.6
G1 Z3.314
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G2 X125.172 Y130.809 I2.968 J-.322 E.04743
G1 X125.365 Y131.209 E.01701
G1 X125.365 Y129.449 E.06729
G1 X124.789 Y129.449 E.02202
G1 X124.789 Y126.572 E.10997
G1 X125.365 Y126.572 E.02202
G1 X125.365 Y123.695 E.10997
G1 X124.789 Y123.695 E.02202
G1 X124.789 Y120.818 E.10997
G1 X125.365 Y120.818 E.02202
G1 X125.365 Y117.941 E.10997
G1 X124.789 Y117.941 E.02202
G1 X124.789 Y115.064 E.10997
G1 X125.365 Y115.064 E.02202
G1 X125.365 Y112.187 E.10997
G1 X124.789 Y112.187 E.02202
G1 X124.789 Y109.309 E.10997
G1 X125.365 Y109.309 E.02202
G1 X125.365 Y106.432 E.10997
G1 X124.789 Y106.432 E.02202
G1 X124.789 Y103.555 E.10997
G1 X125.365 Y103.555 E.02202
G1 X125.365 Y100.678 E.10997
G1 X124.643 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X125.365 Y100.678 E-.27411
G1 X125.365 Y101.957 E-.48589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.714 I.178 J-1.204 P1  F30000
G1 X116.733 Y100.678 Z3.714
G1 Z3.314
G1 E.8 F1800
G1 F9000
G1 X117.857 Y100.678 E.04294
G1 X117.712 Y100.824 E.00785
G1 X117.712 Y103.555 E.10441
G1 X116.733 Y103.555 E.03738
G1 X116.733 Y106.432 E.10997
G1 X117.712 Y106.432 E.03738
G1 X117.712 Y109.309 E.10997
G1 X116.733 Y109.309 E.03738
G1 X116.733 Y112.187 E.10997
G1 X117.712 Y112.187 E.03738
G1 X117.712 Y115.064 E.10997
G1 X116.733 Y115.064 E.03738
G1 X116.733 Y117.941 E.10997
G1 X117.712 Y117.941 E.03738
G1 X117.712 Y120.818 E.10997
G1 X116.733 Y120.818 E.03738
G1 X116.733 Y123.695 E.10997
G1 X117.712 Y123.695 E.03738
G1 X117.712 Y126.572 E.10997
G1 X116.733 Y126.572 E.03738
G1 X116.733 Y129.449 E.10997
G1 X117.712 Y129.449 E.03738
; WIPE_START
G1 F24000
G1 X116.733 Y129.449 E-.37168
G1 X116.733 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.714 I-.039 J1.216 P1  F30000
G1 X154.135 Y129.638 Z3.714
G1 Z3.314
G1 E.8 F1800
G1 F9000
G1 X154.135 Y131.209 E.06008
G1 X154.329 Y130.807 E.01706
G2 X154.712 Y129.937 I-8.78 J-4.377 E.03634
G1 X154.712 Y129.449 E.01866
G1 X154.135 Y129.449 E.02202
G1 X154.135 Y126.572 E.10997
G1 X154.712 Y126.572 E.02202
G1 X154.712 Y123.695 E.10997
G1 X154.135 Y123.695 E.02202
G1 X154.135 Y120.818 E.10997
G1 X154.712 Y120.818 E.02202
G1 X154.712 Y117.941 E.10997
G1 X154.135 Y117.941 E.02202
G1 X154.135 Y115.064 E.10997
G1 X154.712 Y115.064 E.02202
G1 X154.712 Y112.187 E.10997
G1 X154.135 Y112.187 E.02202
G1 X154.135 Y109.309 E.10997
G1 X154.712 Y109.309 E.02202
G1 X154.712 Y106.432 E.10997
G1 X154.135 Y106.432 E.02202
G1 X154.135 Y103.555 E.10997
G1 X154.712 Y103.555 E.02202
G1 X154.712 Y100.824 E.10441
G1 X154.857 Y100.678 E.00785
G1 X154.135 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X154.857 Y100.678 E-.27411
G1 X154.712 Y100.824 E-.07807
G1 X154.712 Y101.897 E-.40783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.714 I.211 J1.199 P1  F30000
G1 X161.643 Y100.678 Z3.714
G1 Z3.314
G1 E.8 F1800
G1 F9000
G1 X162.767 Y100.678 E.04294
G1 X162.767 Y103.555 E.10997
G1 X161.789 Y103.555 E.03738
G1 X161.789 Y106.432 E.10997
G1 X162.767 Y106.432 E.03738
G1 X162.767 Y109.309 E.10997
M73 P63 R6
G1 X161.789 Y109.309 E.03738
G1 X161.789 Y112.187 E.10997
G1 X162.767 Y112.187 E.03738
G1 X162.767 Y115.064 E.10997
G1 X161.789 Y115.064 E.03738
G1 X161.789 Y117.941 E.10997
G1 X162.767 Y117.941 E.03738
G1 X162.767 Y120.818 E.10997
G1 X161.789 Y120.818 E.03738
G1 X161.789 Y123.695 E.10997
G1 X162.767 Y123.695 E.03738
G1 X162.767 Y126.572 E.10997
G1 X161.789 Y126.572 E.03738
G1 X161.789 Y129.449 E.10997
G1 X162.767 Y129.449 E.03738
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.0857143
; WIPE_START
G1 F24000
G1 X161.789 Y129.449 E-.37168
G1 X161.789 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/63
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
G3 Z3.714 I-1.033 J-.644 P1  F30000
G1 X160.648 Y130.257 Z3.714
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F12084
G1 X160.648 Y130.649 E.01301
G1 X163.205 Y130.649 E.08481
G3 X165.447 Y133.914 I.006 J2.399 E.15461
G1 X164.838 Y135.357 E.05195
G3 X162.726 Y139.146 I-24.286 J-11.057 E.14404
G1 X148.279 Y139.146 E.47921
G1 X148.231 Y138.964 E.00622
G2 X155.852 Y130.169 I-8.546 J-15.104 E.39368
G1 X155.852 Y101.649 E.94606
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.197 E.94699
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.21 Y130.257 E.06667
G3 X165.813 Y134.057 I.001 J2.791 E.16648
G1 X165.196 Y135.518 E.04872
G3 X162.937 Y139.538 I-24.874 J-11.333 E.14185
G1 X146.156 Y139.536 E.51565
G2 X155.46 Y130.089 I-6.443 J-15.651 E.41865
G1 X155.46 Y101.257 E.88595
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.187 J-1.202 P1  F30000
G1 X158.096 Y129.481 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F12084
G1 X158.405 Y129.481 E.00778
G1 X158.405 Y103.892 E.6443
G1 X158.096 Y103.892 E.00778
G1 X158.096 Y129.421 E.64279
G1 X157.753 Y129.824 F30000
; LINE_WIDTH: 0.419999
G1 F12084
G1 X158.748 Y129.824 E.03058
G1 X158.748 Y103.549 E.80737
G1 X157.753 Y103.549 E.03058
G1 X157.753 Y129.764 E.80553
G1 X157.375 Y130.202 F30000
G1 F12084
G1 X159.125 Y130.202 E.05375
G1 X159.125 Y103.172 E.83054
G1 X157.375 Y103.172 E.05375
G1 X157.375 Y130.142 E.8287
G1 X156.998 Y130.21 F30000
G1 F12084
G1 X156.921 Y130.579 E.01157
G1 X159.502 Y130.579 E.07929
G1 X159.502 Y102.795 E.85371
G1 X156.998 Y102.795 E.07692
G1 X156.998 Y130.15 E.84055
G1 X156.347 Y130.956 F30000
G1 F12084
G1 X159.982 Y130.956 E.1117
G1 X159.879 Y130.852 E.00451
G1 X159.879 Y102.418 E.8737
G1 X156.621 Y102.418 E.10009
G1 X156.621 Y130.21 E.85398
G1 X156.574 Y130.437 E.00711
G1 X156.371 Y130.901 E.01556
G1 X155.771 Y131.333 F30000
; LINE_WIDTH: 0.41865
G1 F12084
G1 X159.775 Y131.333 E.1226
G2 X160.952 Y131.354 I.929 J-18.735 E.03605
G1 X161.07 Y131.305 E.00392
G1 X161.347 Y131.024 E.01208
G1 X160.444 Y131.019 E.02764
G1 X160.256 Y130.852 E.00771
G1 X160.256 Y102.041 E.88212
G1 X156.244 Y102.041 E.12283
G1 X156.244 Y130.21 E.86247
G1 X156.228 Y130.286 E.00236
G1 X155.795 Y131.278 E.03315
G1 X153.506 Y134.925 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12084
G2 X154.46 Y133.605 I-12.151 J-9.785 E.05402
G1 X159.133 Y138.278 E.21922
G1 X158.747 Y138.278 E.01277
G1 X164.989 Y132.037 E.29282
G3 X165.12 Y133.796 I-1.869 J1.023 E.06032
G3 X164.265 Y135.735 I-17.526 J-6.568 E.07034
G1 X160.255 Y131.725 E.18811
G1 X157.625 Y131.725 E.08724
G1 X151.071 Y138.278 E.30744
G1 X151.457 Y138.278 E.01277
G1 X150.81 Y137.631 E.03035
G2 X152.027 Y136.551 I-14.238 J-17.278 E.054
G1 X147.173 Y139.327 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.42189
G1 F12084
G2 X148.065 Y139.104 I-12.468 J-51.763 E.02841
G1 X148.746 Y138.924 F30000
; LINE_WIDTH: 0.194116
G1 F12084
G1 X149.48 Y138.715 E.0094
G1 X150 Y138.5 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.752794
G1 F8874.815
G1 X150.025 Y138.586 E.00521
; LINE_WIDTH: 0.754252
G1 F8856.623
G1 X150.082 Y138.607 E.0035
; LINE_WIDTH: 0.712361
G1 F9410.837
G1 X150.138 Y138.628 E.0033
; LINE_WIDTH: 0.67047
G1 F10039.041
G1 X150.195 Y138.649 E.00309
; LINE_WIDTH: 0.628579
G1 F10757.112
G1 X150.252 Y138.67 E.00288
; LINE_WIDTH: 0.586688
G1 F11585.823
G1 X150.308 Y138.691 E.00268
; LINE_WIDTH: 0.503115
G1 F12084
G1 X150.365 Y138.712 E.00227
G1 X162.432 Y138.712 E.45253
; WIPE_START
G1 F24000
G1 X160.432 Y138.712 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.232 J-1.195 P1  F30000
G1 X118.852 Y130.649 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12084
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.169 E.94606
G2 X131.275 Y138.964 I16.169 J-6.315 E.39381
G1 X131.226 Y139.146 E.00622
G1 X116.765 Y139.146 E.47971
G3 X114.37 Y134.659 I21.938 J-14.591 E.16895
G3 X114.019 Y133.82 I7.503 J-3.64 E.03019
G3 X116.295 Y130.649 I2.273 J-.771 E.15125
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88595
G2 X133.35 Y139.538 I15.756 J-6.214 E.41879
G1 X116.556 Y139.538 E.51603
G3 X114.009 Y134.812 I22.087 J-14.953 E.16524
G3 X113.647 Y133.946 I7.744 J-3.748 E.02885
G3 X116.29 Y130.257 I2.645 J-.897 E.1628
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.46 J1.127 P1  F30000
G1 X121.405 Y129.481 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F12084
G1 X121.405 Y103.892 E.6443
G1 X121.096 Y103.892 E.00778
G1 X121.096 Y129.481 E.6443
G1 X121.345 Y129.481 E.00627
G1 X121.748 Y129.824 F30000
; LINE_WIDTH: 0.419999
G1 F12084
G1 X121.748 Y103.549 E.80737
G1 X120.753 Y103.549 E.03058
G1 X120.753 Y129.824 E.80737
G1 X121.688 Y129.824 E.02873
G1 X122.125 Y130.202 F30000
G1 F12084
G1 X122.125 Y103.172 E.83054
G1 X120.375 Y103.172 E.05375
G1 X120.375 Y130.202 E.83054
G1 X122.065 Y130.202 E.0519
G1 X122.502 Y130.21 F30000
G1 F12084
G1 X122.502 Y102.795 E.84239
G1 X119.998 Y102.795 E.07692
G1 X119.998 Y130.579 E.85371
G2 X122.576 Y130.578 I1.067 J-753.126 E.07919
G1 X122.514 Y130.269 E.00968
G1 X123.146 Y130.956 F30000
G1 F12084
G1 X122.924 Y130.431 E.01752
G1 X122.879 Y130.21 E.00691
G1 X122.879 Y102.418 E.85398
G1 X119.621 Y102.418 E.10009
G1 X119.621 Y130.851 E.87368
G1 X119.534 Y130.956 E.00419
G1 X123.086 Y130.956 E.10915
G1 X123.723 Y131.333 F30000
; LINE_WIDTH: 0.418393
G1 F12084
G1 X123.271 Y130.284 E.03495
G1 X123.256 Y129.327 E.02927
G1 X123.256 Y102.041 E.83486
G1 X119.244 Y102.041 E.12274
G1 X119.244 Y130.851 E.8815
G1 X119.056 Y131.019 E.0077
G2 X118.156 Y131.031 I-.197 J18.052 E.02756
G1 X118.511 Y131.354 E.01469
G3 X123.663 Y131.333 I3.644 J254.968 E.15763
G1 X124.208 Y132.207 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12084
G2 X125.039 Y133.607 I16.313 J-8.737 E.054
G1 X120.368 Y138.278 E.21916
G1 X120.753 Y138.278 E.01277
G1 X114.512 Y132.037 E.29278
G2 X114.257 Y133.306 I1.827 J1.027 E.04364
G2 X115.235 Y135.735 I15.262 J-4.739 E.08695
G1 X119.245 Y131.725 E.18811
G1 X121.875 Y131.725 E.08724
G1 X128.429 Y138.278 E.30744
G1 X128.044 Y138.278 E.01277
G1 X128.696 Y137.626 E.03061
G3 X127.476 Y136.549 I6.873 J-9.023 E.05403
G1 X130.021 Y138.718 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13422
G1 F12084
G1 X130.753 Y138.923 E.00566
G1 X131.438 Y139.112 F30000
; LINE_WIDTH: 0.16471
G1 F12084
G1 X132.331 Y139.322 E.00911
G1 X131.704 Y139.342 F30000
; LINE_WIDTH: 0.143485
G1 F12084
G1 X131.503 Y138.871 E.00419
G1 X117.004 Y138.712 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F12084
G1 X129.131 Y138.712 E.45454
G1 X129.188 Y138.691 E.0023
; LINE_WIDTH: 0.545863
G1 X129.245 Y138.669 E.00251
; LINE_WIDTH: 0.588817
G1 F11540.645
G1 X129.303 Y138.648 E.00273
; LINE_WIDTH: 0.631771
G1 F10698.802
G1 X129.36 Y138.626 E.00294
; LINE_WIDTH: 0.674726
G1 F9971.427
G1 X129.417 Y138.605 E.00315
; LINE_WIDTH: 0.728948
G1 F9183.303
G1 X129.475 Y138.583 E.00343
G1 X129.481 Y138.562 E.00122
; CHANGE_LAYER
; Z_HEIGHT: 3.57143
; LAYER_HEIGHT: 0.171428
; WIPE_START
G1 F24000
G1 X129.475 Y138.583 E-.19937
G1 X129.417 Y138.605 E-.56063
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/63
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
G3 Z3.8 I1.081 J-.558 P1  F30000
G1 X124.789 Y129.638 Z3.8
G1 Z3.571
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G2 X125.172 Y130.809 I2.966 J-.321 E.04746
G1 X125.365 Y131.21 E.01698
G1 X125.365 Y129.449 E.06729
G1 X124.789 Y129.449 E.02202
G1 X124.789 Y126.572 E.10997
G1 X125.365 Y126.572 E.02202
G1 X125.365 Y123.695 E.10997
G1 X124.789 Y123.695 E.02202
G1 X124.789 Y120.818 E.10997
G1 X125.365 Y120.818 E.02202
G1 X125.365 Y117.941 E.10997
G1 X124.789 Y117.941 E.02202
G1 X124.789 Y115.064 E.10997
G1 X125.365 Y115.064 E.02202
G1 X125.365 Y112.187 E.10997
G1 X124.789 Y112.187 E.02202
G1 X124.789 Y109.309 E.10997
G1 X125.365 Y109.309 E.02202
G1 X125.365 Y106.432 E.10997
G1 X124.789 Y106.432 E.02202
G1 X124.789 Y103.555 E.10997
G1 X125.365 Y103.555 E.02202
G1 X125.365 Y100.678 E.10997
G1 X124.643 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X125.365 Y100.678 E-.27411
G1 X125.365 Y101.957 E-.48589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.971 I.178 J-1.204 P1  F30000
G1 X116.733 Y100.678 Z3.971
M73 P64 R6
G1 Z3.571
G1 E.8 F1800
G1 F9000
G1 X117.857 Y100.678 E.04294
G1 X117.712 Y100.824 E.00785
G1 X117.712 Y103.555 E.10441
G1 X116.733 Y103.555 E.03738
G1 X116.733 Y106.432 E.10997
G1 X117.712 Y106.432 E.03738
G1 X117.712 Y109.309 E.10997
G1 X116.733 Y109.309 E.03738
G1 X116.733 Y112.187 E.10997
G1 X117.712 Y112.187 E.03738
G1 X117.712 Y115.064 E.10997
G1 X116.733 Y115.064 E.03738
G1 X116.733 Y117.941 E.10997
G1 X117.712 Y117.941 E.03738
G1 X117.712 Y120.818 E.10997
G1 X116.733 Y120.818 E.03738
G1 X116.733 Y123.695 E.10997
G1 X117.712 Y123.695 E.03738
G1 X117.712 Y126.572 E.10997
G1 X116.733 Y126.572 E.03738
G1 X116.733 Y129.449 E.10997
G1 X117.712 Y129.449 E.03738
; WIPE_START
G1 F24000
G1 X116.733 Y129.449 E-.37168
G1 X116.733 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.971 I-.039 J1.216 P1  F30000
G1 X154.135 Y129.638 Z3.971
G1 Z3.571
G1 E.8 F1800
G1 F9000
G1 X154.135 Y131.21 E.06008
G1 X154.328 Y130.809 E.01698
G2 X154.712 Y129.937 I-8.814 J-4.394 E.03642
G1 X154.712 Y129.449 E.01866
G1 X154.135 Y129.449 E.02202
G1 X154.135 Y126.572 E.10997
G1 X154.712 Y126.572 E.02202
G1 X154.712 Y123.695 E.10997
G1 X154.135 Y123.695 E.02202
G1 X154.135 Y120.818 E.10997
G1 X154.712 Y120.818 E.02202
G1 X154.712 Y117.941 E.10997
G1 X154.135 Y117.941 E.02202
G1 X154.135 Y115.064 E.10997
G1 X154.712 Y115.064 E.02202
G1 X154.712 Y112.187 E.10997
G1 X154.135 Y112.187 E.02202
G1 X154.135 Y109.309 E.10997
G1 X154.712 Y109.309 E.02202
G1 X154.712 Y106.432 E.10997
G1 X154.135 Y106.432 E.02202
G1 X154.135 Y103.555 E.10997
G1 X154.712 Y103.555 E.02202
G1 X154.712 Y100.824 E.10441
G1 X154.857 Y100.678 E.00785
G1 X154.135 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X154.857 Y100.678 E-.27411
G1 X154.712 Y100.824 E-.07807
G1 X154.712 Y101.897 E-.40783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.971 I.211 J1.199 P1  F30000
G1 X161.643 Y100.678 Z3.971
G1 Z3.571
G1 E.8 F1800
G1 F9000
G1 X162.767 Y100.678 E.04294
G1 X162.767 Y103.555 E.10997
G1 X161.789 Y103.555 E.03738
G1 X161.789 Y106.432 E.10997
G1 X162.767 Y106.432 E.03738
G1 X162.767 Y109.309 E.10997
G1 X161.789 Y109.309 E.03738
G1 X161.789 Y112.187 E.10997
G1 X162.767 Y112.187 E.03738
G1 X162.767 Y115.064 E.10997
G1 X161.789 Y115.064 E.03738
G1 X161.789 Y117.941 E.10997
G1 X162.767 Y117.941 E.03738
G1 X162.767 Y120.818 E.10997
G1 X161.789 Y120.818 E.03738
G1 X161.789 Y123.695 E.10997
G1 X162.767 Y123.695 E.03738
G1 X162.767 Y126.572 E.10997
G1 X161.789 Y126.572 E.03738
G1 X161.789 Y129.449 E.10997
G1 X162.767 Y129.449 E.03738
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0285714
; WIPE_START
G1 F24000
G1 X161.789 Y129.449 E-.37168
G1 X161.789 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/63
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
G3 Z3.971 I-1.033 J-.644 P1  F30000
G1 X160.648 Y130.257 Z3.971
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F11981
G1 X160.648 Y130.649 E.01301
G1 X163.205 Y130.649 E.08481
G3 X165.447 Y133.914 I.006 J2.399 E.15461
G1 X164.833 Y135.367 E.05233
G3 X162.857 Y138.946 I-24.102 J-10.978 E.13573
G1 X148.619 Y138.946 E.4723
G1 X148.57 Y138.765 E.00619
G2 X155.852 Y130.169 I-8.867 J-14.895 E.38065
G1 X155.852 Y101.649 E.94606
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.197 E.94699
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11981
G1 X163.21 Y130.257 E.06667
G3 X165.813 Y134.057 I.001 J2.791 E.16648
G1 X165.191 Y135.528 E.04907
G3 X163.068 Y139.338 I-24.542 J-11.181 E.13415
G1 X146.619 Y139.338 E.50543
G2 X155.46 Y130.089 I-6.942 J-15.486 E.4031
G1 X155.46 Y101.257 E.88595
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.187 J-1.202 P1  F30000
G1 X158.096 Y129.481 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F11981
G1 X158.405 Y129.481 E.00778
G1 X158.405 Y103.892 E.6443
G1 X158.096 Y103.892 E.00778
G1 X158.096 Y129.421 E.64279
G1 X157.753 Y129.824 F30000
; LINE_WIDTH: 0.419999
G1 F11981
G1 X158.748 Y129.824 E.03058
G1 X158.748 Y103.549 E.80737
G1 X157.753 Y103.549 E.03058
G1 X157.753 Y129.764 E.80553
G1 X157.375 Y130.202 F30000
G1 F11981
G1 X159.125 Y130.202 E.05375
G1 X159.125 Y103.172 E.83054
G1 X157.375 Y103.172 E.05375
G1 X157.375 Y130.142 E.8287
G1 X156.998 Y130.21 F30000
G1 F11981
G1 X156.921 Y130.579 E.01157
G1 X159.502 Y130.579 E.07929
G1 X159.502 Y102.795 E.85371
G1 X156.998 Y102.795 E.07692
G1 X156.998 Y130.15 E.84055
G1 X156.347 Y130.956 F30000
G1 F11981
G1 X159.982 Y130.956 E.1117
G1 X159.879 Y130.852 E.00451
G1 X159.879 Y102.418 E.8737
G1 X156.621 Y102.418 E.10009
G1 X156.621 Y130.21 E.85398
G1 X156.574 Y130.437 E.00711
G1 X156.371 Y130.901 E.01556
G1 X155.771 Y131.333 F30000
; LINE_WIDTH: 0.41865
G1 F11981
G1 X159.775 Y131.333 E.1226
G2 X160.952 Y131.354 I.929 J-18.735 E.03605
G1 X161.07 Y131.305 E.00392
G1 X161.347 Y131.024 E.01208
G1 X160.444 Y131.019 E.02764
G1 X160.256 Y130.852 E.00771
G1 X160.256 Y102.041 E.88212
G1 X156.244 Y102.041 E.12283
G1 X156.244 Y130.21 E.86247
G1 X156.228 Y130.286 E.00236
G1 X155.795 Y131.278 E.03315
G1 X153.507 Y134.926 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11981
G2 X154.461 Y133.607 I-60.23 J-44.537 E.05399
G1 X158.947 Y138.078 E.21014
G1 X164.992 Y132.033 E.28358
G3 X165.118 Y133.799 I-2.046 J1.033 E.0603
G3 X164.265 Y135.735 I-17.38 J-6.506 E.0702
G1 X160.255 Y131.725 E.18811
G1 X157.625 Y131.725 E.08724
G1 X151.271 Y138.078 E.29806
G1 X150.81 Y137.632 E.02132
G2 X152.025 Y136.549 I-13.132 J-15.969 E.054
G1 X147.567 Y139.123 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.204154
G1 F11981
G1 X148.407 Y138.914 E.01137
G1 X149.07 Y138.727 F30000
; LINE_WIDTH: 0.379333
G1 F11981
G2 X149.764 Y138.515 I-13.186 J-44.497 E.01991
G1 X150.274 Y138.294 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.739988
G1 F9037.856
G1 X150.305 Y138.393 E.00589
; LINE_WIDTH: 0.7408
G1 F9027.341
G1 X150.371 Y138.417 E.004
; LINE_WIDTH: 0.693222
G1 F9687.812
G1 X150.437 Y138.441 E.00373
; LINE_WIDTH: 0.645644
G1 F10452.56
G1 X150.503 Y138.464 E.00345
; LINE_WIDTH: 0.598065
G1 F11348.391
G1 X150.57 Y138.488 E.00318
; LINE_WIDTH: 0.503187
G1 F11981
G1 X150.636 Y138.512 E.00264
G1 X162.56 Y138.512 E.44724
; WIPE_START
G1 F24000
G1 X160.56 Y138.512 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.225 J-1.196 P1  F30000
G1 X118.852 Y130.649 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11981
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.169 E.94606
G2 X130.928 Y138.764 I16.136 J-6.285 E.38057
G1 X130.879 Y138.946 E.00622
G1 X116.631 Y138.946 E.47265
G3 X113.984 Y133.71 I24.288 J-15.565 E.19494
G3 X116.295 Y130.649 I2.308 J-.66 E.14739
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11981
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88595
G2 X132.886 Y139.338 I15.75 J-6.21 E.40327
G1 X116.421 Y139.338 E.50592
G3 X114.029 Y134.858 I22.275 J-14.775 E.15629
G3 X113.647 Y133.947 I8.173 J-3.958 E.03036
G3 X116.29 Y130.257 I2.642 J-.899 E.16288
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.46 J1.127 P1  F30000
G1 X121.405 Y129.481 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F11981
G1 X121.405 Y103.892 E.6443
G1 X121.096 Y103.892 E.00778
G1 X121.096 Y129.481 E.6443
G1 X121.345 Y129.481 E.00627
G1 X121.748 Y129.824 F30000
; LINE_WIDTH: 0.419999
G1 F11981
G1 X121.748 Y103.549 E.80737
G1 X120.753 Y103.549 E.03058
G1 X120.753 Y129.824 E.80737
G1 X121.688 Y129.824 E.02873
G1 X122.125 Y130.202 F30000
G1 F11981
G1 X122.125 Y103.172 E.83054
G1 X120.375 Y103.172 E.05375
G1 X120.375 Y130.202 E.83054
G1 X122.065 Y130.202 E.0519
G1 X122.502 Y130.21 F30000
G1 F11981
G1 X122.502 Y102.795 E.84239
G1 X119.998 Y102.795 E.07692
G1 X119.998 Y130.579 E.85371
G2 X122.576 Y130.578 I1.067 J-718.876 E.07919
G1 X122.514 Y130.269 E.00968
G1 X123.146 Y130.956 F30000
G1 F11981
G1 X122.924 Y130.431 E.01752
G1 X122.879 Y130.21 E.00691
G1 X122.879 Y102.418 E.85398
G1 X119.621 Y102.418 E.10009
G1 X119.621 Y130.851 E.87368
G1 X119.534 Y130.956 E.00419
G1 X123.086 Y130.956 E.10915
G1 X123.723 Y131.333 F30000
; LINE_WIDTH: 0.418393
G1 F11981
G1 X123.271 Y130.284 E.03495
G1 X123.256 Y129.327 E.02927
G1 X123.256 Y102.041 E.83486
G1 X119.244 Y102.041 E.12274
G1 X119.244 Y130.851 E.8815
G1 X119.056 Y131.019 E.0077
G2 X118.156 Y131.031 I-.197 J18.036 E.02756
G1 X118.511 Y131.354 E.01469
G3 X123.663 Y131.333 I3.644 J254.969 E.15763
G1 X124.208 Y132.207 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11981
G2 X125.039 Y133.607 I16.258 J-8.705 E.054
G1 X120.553 Y138.078 E.21012
G1 X114.508 Y132.034 E.28355
G2 X114.257 Y133.307 I1.888 J1.035 E.04373
G2 X115.235 Y135.735 I15.363 J-4.783 E.08691
G1 X119.245 Y131.725 E.18811
G1 X121.875 Y131.725 E.08724
G1 X128.229 Y138.078 E.29806
G1 X128.69 Y137.632 E.02131
G3 X127.478 Y136.546 I11.463 J-14.014 E.054
G1 X129.739 Y138.515 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.386434
G1 F11981
G2 X130.432 Y138.728 I9.995 J-31.194 E.02029
G1 X131.092 Y138.91 F30000
; LINE_WIDTH: 0.298914
G1 F11981
G1 X131.934 Y139.126 E.01813
G1 X116.871 Y138.512 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F11981
G1 X128.998 Y138.512 E.45453
; LINE_WIDTH: 0.502908
G1 X129.078 Y138.491 E.00312
; LINE_WIDTH: 0.545056
G1 X129.159 Y138.47 E.0034
; LINE_WIDTH: 0.61215
G1 F11067.589
G1 X129.239 Y138.449 E.00385
G1 X129.275 Y138.334 E.00559
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.239 Y138.449 E-.44981
G1 X129.159 Y138.47 E-.31019
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/63
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
M73 P65 R6
G3 Z4 I.736 J-.969 P1  F30000
G1 X118.852 Y130.649 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9813
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.169 E.94606
G2 X130.61 Y138.57 I16.133 J-6.284 E.3682
G1 X130.558 Y138.746 E.00607
G1 X116.506 Y138.746 E.46613
G3 X113.984 Y133.711 I24.255 J-15.299 E.18709
G3 X116.295 Y130.649 I2.309 J-.661 E.14742
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9813
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88595
G2 X132.453 Y139.138 I15.783 J-6.239 E.38856
G1 X116.29 Y139.138 E.49663
G3 X113.607 Y133.817 I23.018 J-14.948 E.18346
G3 X116.29 Y130.257 I2.686 J-.767 E.15863
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.182 J-.291 P1  F30000
G1 X117.699 Y131.121 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.577278
G1 F9813
G1 X117.79 Y131.126 E.00398
G1 X121.405 Y129.454 F30000
; LINE_WIDTH: 0.351907
G1 F9813
G1 X121.405 Y103.892 E.64362
G1 X121.096 Y103.892 E.00778
G1 X121.096 Y129.454 E.64362
G1 X121.345 Y129.454 E.00627
G1 X121.748 Y129.798 F30000
; LINE_WIDTH: 0.419999
G1 F9813
G1 X121.748 Y103.549 E.80654
G1 X120.753 Y103.549 E.03058
G1 X120.753 Y129.798 E.80654
G1 X121.688 Y129.798 E.02873
G1 X122.125 Y130.175 F30000
G1 F9813
G1 X122.125 Y103.172 E.82971
G1 X120.375 Y103.172 E.05375
G1 X120.375 Y130.175 E.82971
G1 X122.065 Y130.175 E.0519
G1 X122.502 Y130.21 F30000
G1 F9813
G1 X122.502 Y102.795 E.84239
G1 X119.998 Y102.795 E.07692
G1 X119.998 Y130.552 E.85289
G1 X122.571 Y130.552 E.07905
G1 X122.514 Y130.269 E.00887
G1 X123.134 Y130.929 F30000
G1 F9813
G1 X122.924 Y130.431 E.01662
G1 X122.879 Y130.21 E.00691
G1 X122.879 Y102.418 E.85398
G1 X119.621 Y102.418 E.10009
G1 X119.621 Y130.852 E.8737
G1 X119.557 Y130.929 E.00308
G1 X123.074 Y130.929 E.10809
G1 X123.256 Y129.3 F30000
G1 F9813
G1 X123.256 Y102.041 E.8376
G1 X119.244 Y102.041 E.12327
G1 X119.244 Y130.852 E.88529
G1 X119.15 Y130.932 E.0038
; LINE_WIDTH: 0.36782
G1 X119.056 Y131.013 E.00328
G1 X118.244 Y131.013 E.02149
; LINE_WIDTH: 0.363653
G1 X118.165 Y131.036 E.00215
; LINE_WIDTH: 0.40582
G1 X118.087 Y131.06 E.00243
; LINE_WIDTH: 0.447987
G1 X118.008 Y131.083 E.00271
; LINE_WIDTH: 0.490154
G1 X117.929 Y131.106 E.003
; LINE_WIDTH: 0.532321
G1 X117.85 Y131.129 E.00328
; LINE_WIDTH: 0.574488
G1 X117.929 Y131.17 E.00385
; LINE_WIDTH: 0.532321
G1 X118.008 Y131.211 E.00355
; LINE_WIDTH: 0.490154
G1 X118.087 Y131.252 E.00324
; LINE_WIDTH: 0.447987
G1 X118.166 Y131.293 E.00294
; LINE_WIDTH: 0.367818
G1 X118.245 Y131.334 E.00235
G1 X119.056 Y131.334 E.02148
; LINE_WIDTH: 0.364123
G1 X119.377 Y131.32 E.00841
; LINE_WIDTH: 0.41859
G1 X119.698 Y131.306 E.00984
G1 X123.71 Y131.306 E.12281
G1 X123.271 Y130.284 E.03406
G1 X123.257 Y129.36 E.02828
G1 X125.996 Y134.923 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9813
G3 X125.04 Y133.606 I30.426 J-23.084 E.05399
G1 X120.768 Y137.878 E.20042
G1 X120.353 Y137.878 E.01376
G1 X114.508 Y132.034 E.27416
G2 X114.257 Y133.313 I2.307 J1.117 E.04371
G2 X115.235 Y135.735 I16.632 J-5.309 E.08672
G1 X119.272 Y131.698 E.18938
G1 X121.848 Y131.698 E.08545
G1 X128.029 Y137.878 E.28994
G1 X126.4 Y137.878 E.05401
G1 X129.455 Y138.321 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.16357
G1 F9813
G1 X130.121 Y138.524 E.00684
G1 X130.839 Y138.485 F30000
; LINE_WIDTH: 0.139161
G1 F9813
G1 X131.016 Y138.942 E.00384
G1 X116.747 Y138.312 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F9813
G1 X128.608 Y138.312 E.44459
; LINE_WIDTH: 0.502908
G1 X128.672 Y138.287 E.00259
; LINE_WIDTH: 0.546266
G1 X128.736 Y138.262 E.00283
; LINE_WIDTH: 0.589624
G1 X128.801 Y138.237 E.00307
; LINE_WIDTH: 0.632981
G1 X128.865 Y138.212 E.00332
; LINE_WIDTH: 0.695202
G1 F9658.41
G2 X128.945 Y138.137 I.01 J-.07 E.00672
; WIPE_START
G1 F24000
G1 X128.929 Y138.187 E-.33064
G1 X128.865 Y138.212 E-.42936
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.296 J1.181 P1  F30000
G1 X160.648 Y130.257 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9813
G1 X160.648 Y130.649 E.01301
G1 X163.205 Y130.649 E.08481
G3 X165.447 Y133.914 I.006 J2.399 E.15461
G1 X164.829 Y135.378 E.0527
G3 X162.988 Y138.746 I-24.162 J-11.018 E.12743
G1 X148.945 Y138.746 E.46583
G1 X148.894 Y138.57 E.00607
G2 X155.852 Y130.169 I-9.183 J-14.688 E.36813
G1 X155.852 Y101.649 E.94606
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.197 E.94699
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9813
G1 X163.21 Y130.257 E.06667
G3 X165.813 Y134.057 I.001 J2.791 E.16648
G1 X165.186 Y135.539 E.04942
G3 X163.199 Y139.138 I-24.367 J-11.105 E.12645
G1 X147.049 Y139.138 E.49625
G2 X155.46 Y130.089 I-7.373 J-15.287 E.38852
G1 X155.46 Y101.257 E.88595
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.651 J-1.028 P1  F30000
G1 X161.665 Y131.123 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.581416
G1 F9813
G1 X161.742 Y131.122 E.00336
G1 X158.096 Y129.454 F30000
; LINE_WIDTH: 0.351907
G1 F9813
G1 X158.405 Y129.454 E.00778
G1 X158.405 Y103.892 E.64362
G1 X158.096 Y103.892 E.00778
G1 X158.096 Y129.394 E.64211
G1 X157.753 Y129.798 F30000
; LINE_WIDTH: 0.419999
G1 F9813
G1 X158.748 Y129.798 E.03058
G1 X158.748 Y103.549 E.80654
G1 X157.753 Y103.549 E.03058
G1 X157.753 Y129.738 E.8047
G1 X157.375 Y130.175 F30000
G1 F9813
G1 X159.125 Y130.175 E.05375
G1 X159.125 Y103.172 E.82971
G1 X157.375 Y103.172 E.05375
G1 X157.375 Y130.115 E.82787
G1 X156.998 Y130.21 F30000
G1 F9813
G1 X156.927 Y130.552 E.01072
G1 X159.502 Y130.552 E.07911
G1 X159.502 Y102.795 E.85289
G1 X156.998 Y102.795 E.07692
G1 X156.998 Y130.15 E.84055
G1 X156.359 Y130.929 F30000
G1 F9813
G1 X159.956 Y130.929 E.1105
G1 X159.879 Y130.852 E.00334
G1 X159.879 Y102.418 E.8737
G1 X156.621 Y102.418 E.10009
G1 X156.621 Y130.21 E.85398
G1 X156.574 Y130.436 E.0071
G1 X156.383 Y130.874 E.01467
G1 X155.784 Y131.306 F30000
G1 F9813
G1 X159.802 Y131.306 E.12348
G1 X160.123 Y131.32 E.00987
; LINE_WIDTH: 0.37205
G2 X161.256 Y131.334 I.731 J-13.095 E.03039
; LINE_WIDTH: 0.363648
G1 X161.314 Y131.312 E.00164
; LINE_WIDTH: 0.401875
G1 X161.373 Y131.29 E.00183
; LINE_WIDTH: 0.440102
G1 X161.431 Y131.267 E.00203
; LINE_WIDTH: 0.478329
G1 X161.49 Y131.245 E.00222
; LINE_WIDTH: 0.516555
G1 X161.578 Y131.184 E.00412
; LINE_WIDTH: 0.570844
G1 X161.665 Y131.123 E.00459
G1 X161.447 Y131.09 E.0095
; LINE_WIDTH: 0.516555
G1 X161.399 Y131.071 E.00198
; LINE_WIDTH: 0.478329
G1 X161.351 Y131.052 E.00182
; LINE_WIDTH: 0.440102
G1 X161.303 Y131.032 E.00166
; LINE_WIDTH: 0.365926
G1 X161.256 Y131.013 E.00135
G1 X160.444 Y131.013 E.02136
; LINE_WIDTH: 0.364126
G1 X160.35 Y130.932 E.00324
; LINE_WIDTH: 0.419944
G1 X160.256 Y130.852 E.0038
G1 X160.256 Y102.041 E.88516
G1 X156.244 Y102.041 E.12325
G1 X156.244 Y130.21 E.86544
G1 X156.229 Y130.285 E.00236
G1 X155.808 Y131.251 E.03236
G1 X153.507 Y134.926 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9813
G2 X154.46 Y133.606 I-54.502 J-40.379 E.05399
G1 X158.732 Y137.878 E.20041
G1 X159.148 Y137.878 E.01377
G1 X164.992 Y132.034 E.27418
G3 X165.118 Y133.799 I-2.044 J1.033 E.06029
G3 X164.265 Y135.735 I-17.274 J-6.459 E.0702
G1 X160.228 Y131.698 E.18938
G1 X157.652 Y131.698 E.08545
G1 X151.472 Y137.878 E.28994
G1 X151.057 Y137.878 E.01377
G1 X150.81 Y137.632 E.01158
G2 X152.025 Y136.549 I-13.279 J-16.131 E.054
G1 X150.042 Y138.324 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.150236
G1 F9813
G1 X149.38 Y138.523 E.00604
G1 X148.732 Y138.715 F30000
; LINE_WIDTH: 0.224034
G1 F9813
G1 X147.945 Y138.923 E.01201
G1 X162.751 Y138.312 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.503092
G1 F9813
G1 X150.551 Y138.312 E.45747
; CHANGE_LAYER
; Z_HEIGHT: 3.82857
; LAYER_HEIGHT: 0.0285714
; WIPE_START
G1 F24000
G1 X152.551 Y138.312 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/63
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
M73 P66 R6
G3 Z4.2 I1.197 J.219 P1  F30000
G1 X154.135 Y129.638 Z4.2
G1 Z3.829
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X154.135 Y131.21 E.06009
G1 X154.33 Y130.805 E.01717
G2 X154.712 Y129.937 I-8.808 J-4.387 E.03624
G1 X154.712 Y129.449 E.01866
G1 X154.135 Y129.449 E.02202
G1 X154.135 Y126.572 E.10997
G1 X154.712 Y126.572 E.02202
G1 X154.712 Y123.695 E.10997
G1 X154.135 Y123.695 E.02202
G1 X154.135 Y120.818 E.10997
G1 X154.712 Y120.818 E.02202
G1 X154.712 Y117.941 E.10997
G1 X154.135 Y117.941 E.02202
G1 X154.135 Y115.064 E.10997
G1 X154.712 Y115.064 E.02202
G1 X154.712 Y112.187 E.10997
G1 X154.135 Y112.187 E.02202
G1 X154.135 Y109.309 E.10997
G1 X154.712 Y109.309 E.02202
G1 X154.712 Y106.432 E.10997
G1 X154.135 Y106.432 E.02202
G1 X154.135 Y103.555 E.10997
G1 X154.712 Y103.555 E.02202
G1 X154.712 Y100.824 E.10441
G1 X154.857 Y100.678 E.00785
G1 X154.135 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X154.857 Y100.678 E-.27411
G1 X154.712 Y100.824 E-.07807
G1 X154.712 Y101.897 E-.40783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.229 I.211 J1.199 P1  F30000
G1 X161.643 Y100.678 Z4.229
G1 Z3.829
G1 E.8 F1800
G1 F9000
G1 X162.767 Y100.678 E.04294
G1 X162.767 Y103.555 E.10997
G1 X161.789 Y103.555 E.03738
G1 X161.789 Y106.432 E.10997
G1 X162.767 Y106.432 E.03738
G1 X162.767 Y109.309 E.10997
G1 X161.789 Y109.309 E.03738
G1 X161.789 Y112.187 E.10997
G1 X162.767 Y112.187 E.03738
G1 X162.767 Y115.064 E.10997
G1 X161.789 Y115.064 E.03738
G1 X161.789 Y117.941 E.10997
G1 X162.767 Y117.941 E.03738
G1 X162.767 Y120.818 E.10997
G1 X161.789 Y120.818 E.03738
G1 X161.789 Y123.695 E.10997
G1 X162.767 Y123.695 E.03738
G1 X162.767 Y126.572 E.10997
G1 X161.789 Y126.572 E.03738
G1 X161.789 Y129.449 E.10997
G1 X162.767 Y129.449 E.03738
; WIPE_START
G1 F24000
G1 X161.789 Y129.449 E-.37168
G1 X161.789 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.229 I.728 J-.975 P1  F30000
G1 X124.643 Y100.678 Z4.229
G1 Z3.829
G1 E.8 F1800
G1 F9000
G1 X125.365 Y100.678 E.02757
G1 X125.365 Y103.555 E.10997
G1 X124.789 Y103.555 E.02202
G1 X124.789 Y106.432 E.10997
G1 X125.365 Y106.432 E.02202
G1 X125.365 Y109.309 E.10997
G1 X124.789 Y109.309 E.02202
G1 X124.789 Y112.187 E.10997
G1 X125.365 Y112.187 E.02202
G1 X125.365 Y115.064 E.10997
G1 X124.789 Y115.064 E.02202
G1 X124.789 Y117.941 E.10997
G1 X125.365 Y117.941 E.02202
G1 X125.365 Y120.818 E.10997
G1 X124.789 Y120.818 E.02202
G1 X124.789 Y123.695 E.10997
G1 X125.365 Y123.695 E.02202
G1 X125.365 Y126.572 E.10997
G1 X124.789 Y126.572 E.02202
G1 X124.789 Y129.449 E.10997
G1 X125.365 Y129.449 E.02202
G1 X125.365 Y131.21 E.0673
G1 X125.17 Y130.805 E.01717
G3 X124.789 Y129.638 I2.572 J-1.486 E.04728
; WIPE_START
G1 F24000
G1 X124.789 Y129.937 E-.1139
G1 X125.17 Y130.805 E-.36014
G1 X125.365 Y131.21 E-.17069
G1 X125.365 Y130.906 E-.11527
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.229 I.228 J-1.195 P1  F30000
G1 X117.712 Y129.449 Z4.229
G1 Z3.829
G1 E.8 F1800
G1 F9000
G1 X116.733 Y129.449 E.03738
G1 X116.733 Y126.572 E.10997
G1 X117.712 Y126.572 E.03738
G1 X117.712 Y123.695 E.10997
G1 X116.733 Y123.695 E.03738
G1 X116.733 Y120.818 E.10997
G1 X117.712 Y120.818 E.03738
G1 X117.712 Y117.941 E.10997
G1 X116.733 Y117.941 E.03738
G1 X116.733 Y115.064 E.10997
G1 X117.712 Y115.064 E.03738
G1 X117.712 Y112.187 E.10997
G1 X116.733 Y112.187 E.03738
G1 X116.733 Y109.309 E.10997
G1 X117.712 Y109.309 E.03738
G1 X117.712 Y106.432 E.10997
G1 X116.733 Y106.432 E.03738
G1 X116.733 Y103.555 E.10997
G1 X117.712 Y103.555 E.03738
G1 X117.712 Y100.824 E.10441
G1 X117.857 Y100.678 E.00785
G1 X116.733 Y100.678 E.04294
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.171429
; WIPE_START
G1 F24000
G1 X117.857 Y100.678 E-.42688
G1 X117.712 Y100.824 E-.07807
G1 X117.712 Y101.495 E-.25505
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/63
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
G3 Z4.229 I-1.216 J.048 P1  F30000
G1 X118.852 Y130.649 Z4.229
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F12028
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.169 E.94606
G2 X130.296 Y138.37 I16.138 J-6.287 E.35586
G1 X130.245 Y138.546 E.00607
G1 X116.381 Y138.546 E.4599
G3 X113.985 Y133.712 I22.825 J-14.325 E.17925
G3 X116.295 Y130.649 I2.318 J-.655 E.14726
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88595
G2 X132.051 Y138.938 I15.726 J-6.187 E.37485
G1 X116.163 Y138.938 E.48819
G3 X113.607 Y133.818 I23.005 J-14.685 E.17614
G3 X116.29 Y130.257 I2.698 J-.759 E.15846
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.182 J-.291 P1  F30000
G1 X117.699 Y131.121 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.577278
G1 F11789.848
G1 X117.79 Y131.126 E.00398
G1 X121.405 Y129.454 F30000
; LINE_WIDTH: 0.351907
G1 F12028
G1 X121.405 Y103.892 E.64362
G1 X121.096 Y103.892 E.00778
G1 X121.096 Y129.454 E.64362
G1 X121.345 Y129.454 E.00627
G1 X121.748 Y129.797 F30000
; LINE_WIDTH: 0.419999
G1 F12028
G1 X121.748 Y103.549 E.80654
G1 X120.753 Y103.549 E.03058
G1 X120.753 Y129.797 E.80654
G1 X121.688 Y129.797 E.02873
G1 X122.125 Y130.174 F30000
G1 F12028
G1 X122.125 Y103.172 E.82971
G1 X120.375 Y103.172 E.05375
G1 X120.375 Y130.175 E.82971
G1 X122.065 Y130.174 E.0519
G1 X122.502 Y130.21 F30000
G1 F12028
G1 X122.502 Y102.795 E.84239
G1 X119.998 Y102.795 E.07692
G1 X119.998 Y130.552 E.85288
G1 X122.571 Y130.552 E.07905
G1 X122.514 Y130.269 E.00886
G1 X123.134 Y130.929 F30000
G1 F12028
G1 X122.924 Y130.43 E.01662
G1 X122.879 Y130.21 E.00691
G1 X122.879 Y102.418 E.85398
G1 X119.621 Y102.418 E.10009
G1 X119.621 Y130.852 E.8737
G1 X119.557 Y130.929 E.00308
G1 X123.074 Y130.929 E.10808
G1 X123.256 Y129.3 F30000
G1 F12028
G1 X123.256 Y102.041 E.8376
G1 X119.244 Y102.041 E.12327
G1 X119.244 Y130.852 E.88529
G1 X119.15 Y130.932 E.0038
; LINE_WIDTH: 0.367803
G1 X119.056 Y131.013 E.00328
G1 X118.244 Y131.013 E.02148
; LINE_WIDTH: 0.363648
G1 X118.165 Y131.036 E.00215
; LINE_WIDTH: 0.405816
G1 X118.087 Y131.06 E.00243
; LINE_WIDTH: 0.447984
G1 X118.008 Y131.083 E.00271
; LINE_WIDTH: 0.490151
G1 X117.929 Y131.106 E.003
; LINE_WIDTH: 0.532319
G1 X117.85 Y131.129 E.00328
; LINE_WIDTH: 0.574486
G1 F11851.773
G1 X117.929 Y131.17 E.00385
; LINE_WIDTH: 0.532319
G1 F12028
G1 X118.008 Y131.211 E.00355
; LINE_WIDTH: 0.490151
G1 X118.087 Y131.252 E.00324
; LINE_WIDTH: 0.447984
G1 X118.166 Y131.293 E.00294
; LINE_WIDTH: 0.367813
G1 X118.245 Y131.334 E.00235
G1 X119.056 Y131.334 E.02148
; LINE_WIDTH: 0.364105
G1 X119.377 Y131.32 E.00841
; LINE_WIDTH: 0.41859
G1 X119.698 Y131.306 E.00984
G1 X123.71 Y131.306 E.12281
G1 X123.271 Y130.284 E.03405
G1 X123.257 Y129.36 E.02828
G1 X124.208 Y132.207 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12028
G2 X125.04 Y133.606 I12.142 J-6.272 E.05402
G1 X120.968 Y137.678 E.19105
G1 X120.153 Y137.678 E.02703
G1 X114.509 Y132.034 E.26478
G2 X114.257 Y133.314 I2.303 J1.117 E.04375
G2 X115.235 Y135.735 I16.754 J-5.362 E.08668
G1 X119.272 Y131.698 E.18938
G1 X121.848 Y131.698 E.08544
G1 X127.829 Y137.678 E.28057
G1 X128.644 Y137.678 E.02703
G1 X128.692 Y137.63 E.00227
G3 X127.476 Y136.548 I9.926 J-12.375 E.054
G1 X129.268 Y137.902 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.217129
G1 F12028
G1 X129.407 Y138.342 E.00655
G1 X130.458 Y138.517 F30000
; LINE_WIDTH: 0.282524
G1 F12028
G1 X131.204 Y138.726 E.01514
G1 X116.621 Y138.112 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F12028
G1 X128.703 Y138.112 E.45288
; WIPE_START
G1 F24000
G1 X126.703 Y138.112 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.258 J1.189 P1  F30000
G1 X161.04 Y130.649 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12028
G1 X163.205 Y130.649 E.07181
G3 X165.447 Y133.914 I.006 J2.399 E.1546
G1 X164.824 Y135.388 E.05308
G3 X163.119 Y138.546 I-24.637 J-11.263 E.11912
G1 X149.257 Y138.546 E.45985
G1 X149.205 Y138.37 E.00607
G2 X155.852 Y130.169 I-9.538 J-14.525 E.35581
G1 X155.852 Y101.649 E.94606
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.649 E.96198
G1 X160.98 Y130.649 E.01102
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.21 Y130.257 E.06667
G3 X165.813 Y134.057 I.001 J2.791 E.16648
G1 X165.182 Y135.549 E.04977
G3 X163.33 Y138.938 I-24.442 J-11.153 E.11875
G1 X147.45 Y138.938 E.48796
G2 X155.46 Y130.089 I-7.771 J-15.085 E.37476
G1 X155.46 Y101.257 E.88595
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.651 J-1.028 P1  F30000
G1 X161.665 Y131.123 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.581416
G1 F11699.251
G1 X161.742 Y131.122 E.00336
G1 X158.096 Y129.454 F30000
; LINE_WIDTH: 0.351907
G1 F12028
G1 X158.405 Y129.454 E.00778
G1 X158.405 Y103.892 E.64362
G1 X158.096 Y103.892 E.00778
G1 X158.096 Y129.394 E.64211
G1 X157.753 Y129.798 F30000
; LINE_WIDTH: 0.419999
G1 F12028
G1 X158.748 Y129.798 E.03058
G1 X158.748 Y103.549 E.80654
G1 X157.753 Y103.549 E.03058
G1 X157.753 Y129.738 E.8047
G1 X157.375 Y130.175 F30000
G1 F12028
G1 X159.125 Y130.175 E.05375
G1 X159.125 Y103.172 E.82971
G1 X157.375 Y103.172 E.05375
G1 X157.375 Y130.115 E.82787
G1 X156.998 Y130.21 F30000
G1 F12028
G1 X156.927 Y130.552 E.01072
G1 X159.502 Y130.552 E.07911
G1 X159.502 Y102.795 E.85289
G1 X156.998 Y102.795 E.07692
G1 X156.998 Y130.15 E.84055
G1 X156.359 Y130.929 F30000
G1 F12028
G1 X159.956 Y130.929 E.1105
G1 X159.879 Y130.852 E.00334
G1 X159.879 Y102.418 E.8737
G1 X156.621 Y102.418 E.10009
G1 X156.621 Y130.21 E.85398
G1 X156.574 Y130.436 E.0071
G1 X156.383 Y130.874 E.01467
G1 X155.784 Y131.306 F30000
G1 F12028
G1 X159.802 Y131.306 E.12348
G1 X160.123 Y131.32 E.00987
; LINE_WIDTH: 0.37205
G2 X161.256 Y131.334 I.731 J-13.095 E.03039
; LINE_WIDTH: 0.363648
G1 X161.314 Y131.312 E.00164
; LINE_WIDTH: 0.401875
G1 X161.373 Y131.29 E.00183
; LINE_WIDTH: 0.440102
G1 X161.431 Y131.267 E.00203
; LINE_WIDTH: 0.478329
G1 X161.49 Y131.245 E.00222
; LINE_WIDTH: 0.516555
G1 X161.578 Y131.184 E.00412
; LINE_WIDTH: 0.570844
G1 F11933.538
G1 X161.665 Y131.123 E.00459
G1 X161.447 Y131.09 E.0095
; LINE_WIDTH: 0.516555
G1 F12028
G1 X161.399 Y131.071 E.00198
; LINE_WIDTH: 0.478329
G1 X161.351 Y131.052 E.00182
; LINE_WIDTH: 0.440102
G1 X161.303 Y131.032 E.00166
; LINE_WIDTH: 0.365926
G1 X161.256 Y131.013 E.00135
G1 X160.444 Y131.013 E.02136
; LINE_WIDTH: 0.364126
M73 P67 R6
G1 X160.35 Y130.932 E.00324
; LINE_WIDTH: 0.419944
G1 X160.256 Y130.852 E.0038
G1 X160.256 Y102.041 E.88516
G1 X156.244 Y102.041 E.12325
G1 X156.244 Y130.21 E.86543
G1 X156.229 Y130.285 E.00236
G1 X155.808 Y131.251 E.03236
G1 X153.507 Y134.926 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12028
G2 X154.46 Y133.606 I-49.714 J-36.903 E.05399
G1 X158.533 Y137.678 E.19105
G1 X159.347 Y137.678 E.02703
G1 X164.991 Y132.035 E.26475
G3 X165.118 Y133.799 I-2.157 J1.042 E.0601
G3 X164.27 Y135.74 I-21.686 J-8.322 E.07027
G1 X160.228 Y131.698 E.18961
G1 X157.652 Y131.698 E.08545
G1 X151.671 Y137.678 E.28056
G1 X150.857 Y137.678 E.02703
G1 X150.81 Y137.632 E.00219
G2 X152.025 Y136.549 I-13.43 J-16.298 E.054
G1 X148.299 Y138.726 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.352142
G1 F12028
G1 X149.043 Y138.515 E.01948
G1 X149.676 Y138.324 F30000
; LINE_WIDTH: 0.188148
G1 F12028
G1 X150.308 Y138.122 E.00786
G1 X150.76 Y138.112 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502918
G1 F12028
G1 X162.811 Y138.112 E.45173
; CHANGE_LAYER
; Z_HEIGHT: 4.08571
; LAYER_HEIGHT: 0.0857143
; WIPE_START
G1 F24000
G1 X160.811 Y138.112 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/63
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
G3 Z4.4 I1.187 J.268 P1  F30000
G1 X162.767 Y129.449 Z4.4
G1 Z4.086
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X161.789 Y129.449 E.03738
G1 X161.789 Y126.572 E.10997
G1 X162.767 Y126.572 E.03738
G1 X162.767 Y123.695 E.10997
G1 X161.789 Y123.695 E.03738
G1 X161.789 Y120.818 E.10997
G1 X162.767 Y120.818 E.03738
G1 X162.767 Y117.941 E.10997
G1 X161.789 Y117.941 E.03738
G1 X161.789 Y115.064 E.10997
G1 X162.767 Y115.064 E.03738
G1 X162.767 Y112.187 E.10997
G1 X161.789 Y112.187 E.03738
G1 X161.789 Y109.309 E.10997
G1 X162.767 Y109.309 E.03738
G1 X162.767 Y106.432 E.10997
G1 X161.789 Y106.432 E.03738
G1 X161.789 Y103.555 E.10997
G1 X162.767 Y103.555 E.03738
G1 X162.767 Y100.678 E.10997
G1 X161.643 Y100.678 E.04294
; WIPE_START
G1 F24000
G1 X162.767 Y100.678 E-.42688
G1 X162.767 Y101.555 E-.33312
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.486 I.123 J-1.211 P1  F30000
G1 X154.135 Y100.678 Z4.486
G1 Z4.086
G1 E.8 F1800
G1 F9000
G1 X154.857 Y100.678 E.02757
G1 X154.712 Y100.824 E.00785
G1 X154.712 Y103.555 E.10441
G1 X154.135 Y103.555 E.02202
G1 X154.135 Y106.432 E.10997
G1 X154.712 Y106.432 E.02202
G1 X154.712 Y109.309 E.10997
G1 X154.135 Y109.309 E.02202
G1 X154.135 Y112.187 E.10997
G1 X154.712 Y112.187 E.02202
G1 X154.712 Y115.064 E.10997
G1 X154.135 Y115.064 E.02202
G1 X154.135 Y117.941 E.10997
G1 X154.712 Y117.941 E.02202
G1 X154.712 Y120.818 E.10997
G1 X154.135 Y120.818 E.02202
G1 X154.135 Y123.695 E.10997
G1 X154.712 Y123.695 E.02202
G1 X154.712 Y126.572 E.10997
G1 X154.135 Y126.572 E.02202
G1 X154.135 Y129.449 E.10997
G1 X154.712 Y129.449 E.02202
G1 X154.712 Y129.937 E.01866
G3 X154.336 Y130.793 I-9.07 J-3.469 E.03573
G1 X154.135 Y131.21 E.01768
G1 X154.135 Y129.638 E.0601
; WIPE_START
G1 F24000
G1 X154.135 Y131.21 E-.5975
G1 X154.321 Y130.825 E-.1625
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.486 I.867 J-.854 P1  F30000
G1 X124.643 Y100.678 Z4.486
G1 Z4.086
G1 E.8 F1800
G1 F9000
G1 X125.365 Y100.678 E.02757
G1 X125.365 Y103.555 E.10997
G1 X124.789 Y103.555 E.02202
G1 X124.789 Y106.432 E.10997
G1 X125.365 Y106.432 E.02202
G1 X125.365 Y109.309 E.10997
G1 X124.789 Y109.309 E.02202
G1 X124.789 Y112.187 E.10997
G1 X125.365 Y112.187 E.02202
G1 X125.365 Y115.064 E.10997
G1 X124.789 Y115.064 E.02202
G1 X124.789 Y117.941 E.10997
G1 X125.365 Y117.941 E.02202
G1 X125.365 Y120.818 E.10997
G1 X124.789 Y120.818 E.02202
G1 X124.789 Y123.695 E.10997
G1 X125.365 Y123.695 E.02202
G1 X125.365 Y126.572 E.10997
G1 X124.789 Y126.572 E.02202
G1 X124.789 Y129.449 E.10997
G1 X125.365 Y129.449 E.02202
G1 X125.365 Y131.21 E.06731
G1 X125.164 Y130.793 E.01768
G3 X124.789 Y129.638 I2.55 J-1.467 E.04677
; WIPE_START
G1 F24000
G1 X124.789 Y129.937 E-.11391
G1 X125.164 Y130.793 E-.35511
G1 X125.365 Y131.21 E-.1758
G1 X125.365 Y130.907 E-.11518
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.486 I.228 J-1.195 P1  F30000
G1 X117.712 Y129.449 Z4.486
G1 Z4.086
G1 E.8 F1800
G1 F9000
G1 X116.733 Y129.449 E.03738
G1 X116.733 Y126.572 E.10997
G1 X117.712 Y126.572 E.03738
G1 X117.712 Y123.695 E.10997
G1 X116.733 Y123.695 E.03738
G1 X116.733 Y120.818 E.10997
G1 X117.712 Y120.818 E.03738
G1 X117.712 Y117.941 E.10997
G1 X116.733 Y117.941 E.03738
G1 X116.733 Y115.064 E.10997
G1 X117.712 Y115.064 E.03738
G1 X117.712 Y112.187 E.10997
G1 X116.733 Y112.187 E.03738
G1 X116.733 Y109.309 E.10997
G1 X117.712 Y109.309 E.03738
G1 X117.712 Y106.432 E.10997
G1 X116.733 Y106.432 E.03738
G1 X116.733 Y103.555 E.10997
G1 X117.712 Y103.555 E.03738
G1 X117.712 Y100.824 E.10441
G1 X117.857 Y100.678 E.00785
G1 X116.733 Y100.678 E.04294
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.114285
; WIPE_START
G1 F24000
G1 X117.857 Y100.678 E-.42688
G1 X117.712 Y100.824 E-.07807
G1 X117.712 Y101.495 E-.25505
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/63
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
G3 Z4.486 I-1.215 J.066 P1  F30000
G1 X119.328 Y131.124 Z4.486
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X124.058 Y131.124 E.1569
G2 X130.005 Y138.175 I15.817 J-7.308 E.30966
G1 X129.951 Y138.346 E.00593
G1 X116.255 Y138.346 E.45431
G3 X113.984 Y133.71 I22.99 J-14.137 E.17149
G3 X116.295 Y130.649 I2.31 J-.659 E.14736
G1 X116.932 Y130.649 E.02113
G1 X116.932 Y131.124 E.01578
G1 X119.268 Y131.124 E.07748
; WIPE_START
G1 F24000
G1 X121.268 Y131.124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.359 J-1.163 P1  F30000
G1 X118.46 Y130.257 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88595
G2 X131.668 Y138.738 I15.787 J-6.236 E.36153
G1 X116.037 Y138.738 E.48028
G3 X113.607 Y133.818 I23.041 J-14.444 E.16888
G3 X116.29 Y130.257 I2.688 J-.767 E.15864
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.194 J-.235 P1  F30000
G1 X116.506 Y137.912 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F13696.009
G1 X128.425 Y137.912 E.44673
G1 X128.936 Y137.926 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.222378
G1 F15000
G1 X129.544 Y138.125 E.00936
G1 X126 Y137.478 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X127.629 Y137.478 E.05401
G1 X121.623 Y131.473 E.28174
G1 X119.497 Y131.473 E.0705
G1 X115.235 Y135.735 E.19995
G3 X114.253 Y133.272 I11.937 J-6.191 E.0881
G3 X114.51 Y132.036 I2.068 J-.214 E.04255
G1 X119.953 Y137.478 E.25531
G1 X121.168 Y137.478 E.0403
G1 X125.041 Y133.605 E.18172
G2 X125.998 Y134.922 I11.35 J-7.24 E.05402
; WIPE_START
G1 F24000
G1 X125.041 Y133.605 E-.61849
G1 X124.778 Y133.868 E-.14151
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.216 J-.037 P1  F30000
G1 X123.833 Y102.389 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X123.135 Y101.691 E.03032
G1 X122.602 Y101.691
G1 X123.833 Y102.922 E.05349
G1 X123.833 Y103.455
G1 X122.068 Y101.691 E.07667
G1 X121.535 Y101.691
G1 X123.833 Y103.989 E.09984
G1 X123.833 Y104.522
G1 X121.002 Y101.691 E.12301
G1 X120.469 Y101.691
G1 X123.833 Y105.055 E.14619
G1 X123.833 Y105.589
G1 X119.935 Y101.691 E.16936
G1 X119.402 Y101.691
G1 X123.833 Y106.122 E.19253
G1 X123.833 Y106.655
G1 X118.869 Y101.691 E.21571
G1 X118.667 Y102.023
G1 X123.833 Y107.188 E.22445
G1 X123.833 Y107.722
G1 X118.667 Y102.556 E.22445
G1 X118.667 Y103.09
G1 X123.833 Y108.255 E.22445
G1 X123.833 Y108.788
G1 X118.667 Y103.623 E.22445
G1 X118.667 Y104.156
G1 X123.833 Y109.321 E.22445
G1 X123.833 Y109.855
G1 X118.667 Y104.69 E.22445
G1 X118.667 Y105.223
G1 X123.833 Y110.388 E.22445
G1 X123.833 Y110.921
G1 X118.667 Y105.756 E.22445
G1 X118.667 Y106.289
G1 X123.833 Y111.455 E.22445
G1 X123.833 Y111.988
G1 X118.667 Y106.823 E.22445
G1 X118.667 Y107.356
G1 X123.833 Y112.521 E.22445
G1 X123.833 Y113.054
G1 X118.667 Y107.889 E.22445
G1 X118.667 Y108.422
G1 X123.833 Y113.588 E.22445
G1 X123.833 Y114.121
G1 X118.667 Y108.956 E.22445
G1 X118.667 Y109.489
G1 X123.833 Y114.654 E.22445
G1 X123.833 Y115.187
G1 X118.667 Y110.022 E.22445
G1 X118.667 Y110.555
G1 X123.833 Y115.721 E.22445
G1 X123.833 Y116.254
G1 X118.667 Y111.089 E.22445
G1 X118.667 Y111.622
G1 X123.833 Y116.787 E.22445
G1 X123.833 Y117.321
G1 X118.667 Y112.155 E.22445
G1 X118.667 Y112.689
G1 X123.833 Y117.854 E.22445
G1 X123.833 Y118.387
G1 X118.667 Y113.222 E.22445
G1 X118.667 Y113.755
G1 X123.833 Y118.92 E.22445
G1 X123.833 Y119.454
G1 X118.667 Y114.288 E.22445
G1 X118.667 Y114.822
G1 X123.833 Y119.987 E.22445
G1 X123.833 Y120.52
G1 X118.667 Y115.355 E.22445
G1 X118.667 Y115.888
G1 X123.833 Y121.053 E.22445
M73 P67 R5
G1 X123.833 Y121.587
G1 X118.667 Y116.421 E.22445
G1 X118.667 Y116.955
G1 X123.833 Y122.12 E.22445
G1 X123.833 Y122.653
G1 X118.667 Y117.488 E.22445
G1 X118.667 Y118.021
G1 X123.833 Y123.186 E.22445
G1 X123.833 Y123.72
G1 X118.667 Y118.555 E.22445
G1 X118.667 Y119.088
G1 X123.833 Y124.253 E.22445
G1 X123.833 Y124.786
G1 X118.667 Y119.621 E.22445
G1 X118.667 Y120.154
G1 X123.833 Y125.32 E.22445
G1 X123.833 Y125.853
G1 X118.667 Y120.688 E.22445
G1 X118.667 Y121.221
G1 X123.833 Y126.386 E.22445
G1 X123.833 Y126.919
G1 X118.667 Y121.754 E.22445
G1 X118.667 Y122.287
G1 X123.833 Y127.453 E.22445
M73 P68 R5
G1 X123.833 Y127.986
G1 X118.667 Y122.821 E.22445
G1 X118.667 Y123.354
G1 X123.833 Y128.519 E.22445
G1 X123.833 Y129.052
G1 X118.667 Y123.887 E.22445
G1 X118.667 Y124.421
G1 X123.833 Y129.586 E.22445
G1 X123.833 Y130.119
G1 X118.667 Y124.954 E.22445
G1 X118.667 Y125.487
G1 X124.082 Y130.902 E.2353
G1 X123.549 Y130.902
G1 X118.667 Y126.02 E.21213
G1 X118.667 Y126.554
G1 X123.016 Y130.902 E.18896
G1 X122.483 Y130.902
G1 X118.667 Y127.087 E.16578
G1 X118.667 Y127.62
G1 X121.949 Y130.902 E.14261
G1 X121.416 Y130.902
G1 X118.667 Y128.153 E.11944
G1 X118.667 Y128.687
G1 X120.883 Y130.902 E.09627
G1 X120.349 Y130.902
G1 X118.667 Y129.22 E.07309
G1 X118.667 Y129.753
G1 X119.816 Y130.902 E.04992
G1 X119.283 Y130.902
G1 X118.667 Y130.286 E.02675
G1 X118.312 Y130.464
G1 X118.75 Y130.902 E.01903
M204 S10000
G1 X124.001 Y130.528 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881696
G1 F15000
G1 X123.924 Y130.413 E.00051
; LINE_WIDTH: 0.127752
G1 X123.846 Y130.298 E.00096
; LINE_WIDTH: 0.167334
G1 X123.769 Y130.183 E.00141
; WIPE_START
G1 F24000
G1 X123.846 Y130.298 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.217 J0 P1  F30000
G1 X123.844 Y101.559 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.255134
G1 F15000
G1 X118.656 Y101.559 E.08971
; WIPE_START
G1 F24000
G1 X120.656 Y101.559 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.719 J.982 P1  F30000
G1 X161.04 Y131.124 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X162.568 Y131.124 E.05068
G1 X162.568 Y130.649 E.01578
G3 X163.332 Y130.652 I.318 J15.339 E.02534
G3 X165.448 Y133.914 I-.125 J2.399 E.1503
G1 X164.819 Y135.398 E.05346
G3 X163.249 Y138.345 I-32.69 J-15.53 E.11082
G1 X149.553 Y138.345 E.45431
G1 X149.499 Y138.174 E.00597
G2 X155.442 Y131.124 I-9.79 J-14.283 E.30959
G1 X160.98 Y131.124 E.18369
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.21 Y130.257 E.06667
G3 X165.813 Y134.057 I.001 J2.791 E.16648
G1 X165.177 Y135.559 E.05012
G3 X163.46 Y138.737 I-25.094 J-11.5 E.11107
G1 X147.829 Y138.738 E.4803
G2 X155.46 Y130.089 I-8.12 J-14.855 E.36163
G1 X155.46 Y101.257 E.88595
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.476 J-1.12 P1  F30000
G1 X162.01 Y130.689 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.506246
G1 F13597.337
G1 X162.071 Y130.688 E.0023
G1 X153.505 Y134.924 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X154.461 Y133.607 I-11.4 J-9.275 E.05402
G1 X158.333 Y137.478 E.18163
G1 X159.547 Y137.478 E.0403
G1 X164.991 Y132.035 E.25536
G3 X165.156 Y133.693 I-1.898 J1.026 E.05674
G3 X164.265 Y135.735 I-16.945 J-6.181 E.07395
G1 X160.003 Y131.473 E.19995
G1 X157.877 Y131.473 E.0705
G1 X151.871 Y137.478 E.28174
G1 X153.5 Y137.478 E.05401
G1 X150.589 Y137.912 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502866
G1 F13697.259
G1 X162.937 Y137.912 E.46278
G1 X149.341 Y138.323 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137338
G1 F15000
G1 X148.637 Y138.523 E.00563
; WIPE_START
G1 F24000
G1 X149.341 Y138.323 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.199 J.206 P1  F30000
G1 X155.656 Y101.559 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.255134
G1 F15000
G1 X160.844 Y101.559 E.08971
G1 X160.833 Y102.06 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X160.464 Y101.691 E.01603
G1 X159.931 Y101.691
G1 X160.833 Y102.593 E.0392
G1 X160.833 Y103.127
G1 X159.397 Y101.691 E.06237
G1 X158.864 Y101.691
G1 X160.833 Y103.66 E.08555
G1 X160.833 Y104.193
G1 X158.331 Y101.691 E.10872
G1 X157.798 Y101.691
G1 X160.833 Y104.726 E.13189
G1 X160.833 Y105.26
G1 X157.264 Y101.691 E.15507
G1 X156.731 Y101.691
G1 X160.833 Y105.793 E.17824
G1 X160.833 Y106.326
G1 X156.198 Y101.691 E.20141
G1 X155.667 Y101.694
G1 X160.833 Y106.859 E.22445
G1 X160.833 Y107.393
G1 X155.667 Y102.228 E.22445
G1 X155.667 Y102.761
G1 X160.833 Y107.926 E.22445
G1 X160.833 Y108.459
G1 X155.667 Y103.294 E.22445
G1 X155.667 Y103.827
G1 X160.833 Y108.993 E.22445
G1 X160.833 Y109.526
G1 X155.667 Y104.361 E.22445
G1 X155.667 Y104.894
G1 X160.833 Y110.059 E.22445
G1 X160.833 Y110.592
G1 X155.667 Y105.427 E.22445
G1 X155.667 Y105.96
G1 X160.833 Y111.126 E.22445
G1 X160.833 Y111.659
G1 X155.667 Y106.494 E.22445
G1 X155.667 Y107.027
G1 X160.833 Y112.192 E.22445
G1 X160.833 Y112.725
G1 X155.667 Y107.56 E.22445
G1 X155.667 Y108.093
G1 X160.833 Y113.259 E.22445
G1 X160.833 Y113.792
G1 X155.667 Y108.627 E.22445
G1 X155.667 Y109.16
G1 X160.833 Y114.325 E.22445
G1 X160.833 Y114.859
G1 X155.667 Y109.693 E.22445
G1 X155.667 Y110.227
G1 X160.833 Y115.392 E.22445
G1 X160.833 Y115.925
G1 X155.667 Y110.76 E.22445
G1 X155.667 Y111.293
G1 X160.833 Y116.458 E.22445
G1 X160.833 Y116.992
G1 X155.667 Y111.826 E.22445
G1 X155.667 Y112.36
G1 X160.833 Y117.525 E.22445
G1 X160.833 Y118.058
G1 X155.667 Y112.893 E.22445
G1 X155.667 Y113.426
G1 X160.833 Y118.591 E.22445
G1 X160.833 Y119.125
G1 X155.667 Y113.959 E.22445
G1 X155.667 Y114.493
G1 X160.833 Y119.658 E.22445
G1 X160.833 Y120.191
G1 X155.667 Y115.026 E.22445
G1 X155.667 Y115.559
G1 X160.833 Y120.724 E.22445
G1 X160.833 Y121.258
G1 X155.667 Y116.093 E.22445
G1 X155.667 Y116.626
G1 X160.833 Y121.791 E.22445
G1 X160.833 Y122.324
G1 X155.667 Y117.159 E.22445
G1 X155.667 Y117.692
G1 X160.833 Y122.858 E.22445
G1 X160.833 Y123.391
G1 X155.667 Y118.226 E.22445
G1 X155.667 Y118.759
G1 X160.833 Y123.924 E.22445
G1 X160.833 Y124.457
G1 X155.667 Y119.292 E.22445
G1 X155.667 Y119.825
G1 X160.833 Y124.991 E.22445
G1 X160.833 Y125.524
G1 X155.667 Y120.359 E.22445
G1 X155.667 Y120.892
G1 X160.833 Y126.057 E.22445
G1 X160.833 Y126.59
G1 X155.667 Y121.425 E.22445
G1 X155.667 Y121.959
G1 X160.833 Y127.124 E.22445
G1 X160.833 Y127.657
G1 X155.667 Y122.492 E.22445
G1 X155.667 Y123.025
G1 X160.833 Y128.19 E.22445
G1 X160.833 Y128.724
G1 X155.667 Y123.558 E.22445
G1 X155.667 Y124.092
G1 X160.833 Y129.257 E.22445
M73 P69 R5
G1 X160.833 Y129.79
G1 X155.667 Y124.625 E.22445
G1 X155.667 Y125.158
G1 X160.833 Y130.323 E.22445
G1 X160.973 Y130.464
G1 X161.411 Y130.902 E.01903
G1 X160.878 Y130.902
G1 X155.667 Y125.691 E.22642
G1 X155.667 Y126.225
G1 X160.345 Y130.902 E.20325
G1 X159.811 Y130.902
G1 X155.667 Y126.758 E.18008
G1 X155.667 Y127.291
G1 X159.278 Y130.902 E.1569
G1 X158.745 Y130.902
G1 X155.667 Y127.824 E.13373
G1 X155.667 Y128.358
G1 X158.212 Y130.902 E.11056
G1 X157.678 Y130.902
G1 X155.667 Y128.891 E.08739
G1 X155.667 Y129.424
G1 X157.145 Y130.902 E.06421
G1 X156.612 Y130.902
G1 X155.667 Y129.958 E.04104
G1 X155.561 Y130.384
G1 X156.079 Y130.902 E.02251
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.34286
; LAYER_HEIGHT: 0.142858
; WIPE_START
G1 F24000
G1 X155.561 Y130.384 E-.2784
G1 X155.667 Y129.958 E-.16703
G1 X156.253 Y130.543 E-.31457
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/63
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
G3 Z4.6 I.478 J-1.119 P1  F30000
G1 X154.135 Y129.638 Z4.6
G1 Z4.343
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.257143
G1 F4153
G1 X154.135 Y131.21 E.0601
G1 X154.331 Y130.804 E.01724
G2 X154.712 Y129.937 I-8.815 J-4.389 E.03618
G1 X154.712 Y129.449 E.01866
G1 X154.135 Y129.449 E.02202
G1 X154.135 Y126.572 E.10997
G1 X154.712 Y126.572 E.02202
G1 X154.712 Y123.695 E.10997
G1 X154.135 Y123.695 E.02202
G1 X154.135 Y120.818 E.10997
G1 X154.712 Y120.818 E.02202
G1 X154.712 Y117.941 E.10997
G1 X154.135 Y117.941 E.02202
G1 X154.135 Y115.064 E.10997
G1 X154.712 Y115.064 E.02202
G1 X154.712 Y112.187 E.10997
G1 X154.135 Y112.187 E.02202
G1 X154.135 Y109.309 E.10997
G1 X154.712 Y109.309 E.02202
G1 X154.712 Y106.432 E.10997
G1 X154.135 Y106.432 E.02202
G1 X154.135 Y103.555 E.10997
G1 X154.712 Y103.555 E.02202
G1 X154.712 Y100.824 E.10441
G1 X154.857 Y100.678 E.00785
G1 X154.135 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X154.857 Y100.678 E-.27411
G1 X154.712 Y100.824 E-.07807
G1 X154.712 Y101.897 E-.40783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.743 I.211 J1.199 P1  F30000
G1 X161.643 Y100.678 Z4.743
G1 Z4.343
G1 E.8 F1800
G1 F4153
G1 X162.767 Y100.678 E.04294
G1 X162.767 Y103.555 E.10997
G1 X161.789 Y103.555 E.03738
G1 X161.789 Y106.432 E.10997
G1 X162.767 Y106.432 E.03738
G1 X162.767 Y109.309 E.10997
G1 X161.789 Y109.309 E.03738
G1 X161.789 Y112.187 E.10997
G1 X162.767 Y112.187 E.03738
G1 X162.767 Y115.064 E.10997
G1 X161.789 Y115.064 E.03738
G1 X161.789 Y117.941 E.10997
G1 X162.767 Y117.941 E.03738
G1 X162.767 Y120.818 E.10997
G1 X161.789 Y120.818 E.03738
G1 X161.789 Y123.695 E.10997
G1 X162.767 Y123.695 E.03738
G1 X162.767 Y126.572 E.10997
G1 X161.789 Y126.572 E.03738
G1 X161.789 Y129.449 E.10997
G1 X162.767 Y129.449 E.03738
; WIPE_START
G1 F24000
G1 X161.789 Y129.449 E-.37168
G1 X161.789 Y128.427 E-.38832
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.743 I.728 J-.975 P1  F30000
G1 X124.643 Y100.678 Z4.743
G1 Z4.343
G1 E.8 F1800
G1 F4153
G1 X125.365 Y100.678 E.02757
G1 X125.365 Y103.555 E.10997
G1 X124.789 Y103.555 E.02202
G1 X124.789 Y106.432 E.10997
G1 X125.365 Y106.432 E.02202
G1 X125.365 Y109.309 E.10997
G1 X124.789 Y109.309 E.02202
G1 X124.789 Y112.187 E.10997
G1 X125.365 Y112.187 E.02202
G1 X125.365 Y115.064 E.10997
G1 X124.789 Y115.064 E.02202
G1 X124.789 Y117.941 E.10997
G1 X125.365 Y117.941 E.02202
G1 X125.365 Y120.818 E.10997
G1 X124.789 Y120.818 E.02202
G1 X124.789 Y123.695 E.10997
G1 X125.365 Y123.695 E.02202
G1 X125.365 Y126.572 E.10997
G1 X124.789 Y126.572 E.02202
G1 X124.789 Y129.449 E.10997
G1 X125.365 Y129.449 E.02202
G1 X125.365 Y131.21 E.06731
G1 X125.169 Y130.802 E.01729
G3 X124.789 Y129.638 I2.56 J-1.479 E.04717
; WIPE_START
G1 F24000
G1 X124.789 Y129.937 E-.11391
G1 X125.169 Y130.802 E-.35906
G1 X125.365 Y131.21 E-.17189
G1 X125.365 Y130.907 E-.11514
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.743 I.228 J-1.195 P1  F30000
G1 X117.712 Y129.449 Z4.743
G1 Z4.343
G1 E.8 F1800
G1 F4153
G1 X116.733 Y129.449 E.03738
G1 X116.733 Y126.572 E.10997
G1 X117.712 Y126.572 E.03738
G1 X117.712 Y123.695 E.10997
G1 X116.733 Y123.695 E.03738
G1 X116.733 Y120.818 E.10997
G1 X117.712 Y120.818 E.03738
G1 X117.712 Y117.941 E.10997
G1 X116.733 Y117.941 E.03738
G1 X116.733 Y115.064 E.10997
G1 X117.712 Y115.064 E.03738
G1 X117.712 Y112.187 E.10997
G1 X116.733 Y112.187 E.03738
G1 X116.733 Y109.309 E.10997
G1 X117.712 Y109.309 E.03738
G1 X117.712 Y106.432 E.10997
G1 X116.733 Y106.432 E.03738
G1 X116.733 Y103.555 E.10997
G1 X117.712 Y103.555 E.03738
G1 X117.712 Y100.824 E.10441
G1 X117.857 Y100.678 E.00785
G1 X116.733 Y100.678 E.04294
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.0571427
; WIPE_START
G1 F24000
G1 X117.857 Y100.678 E-.42688
G1 X117.712 Y100.824 E-.07807
G1 X117.712 Y101.495 E-.25505
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/63
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
G3 Z4.743 I-.682 J1.008 P1  F30000
G1 X160.835 Y130.651 Z4.743
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4153
G1 X163.324 Y130.652 E.08257
G3 X165.439 Y133.934 I-.117 J2.398 E.15128
G1 X164.815 Y135.408 E.05311
G3 X163.364 Y138.145 I-31.816 J-15.113 E.10279
G1 X149.835 Y138.146 E.44876
G1 X149.78 Y137.977 E.00588
G2 X155.649 Y130.649 I-9.988 J-14.012 E.31544
G1 X160.775 Y130.651 E.17002
G1 X160.835 Y130.259 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4153
G1 X163.343 Y130.26 E.07706
G3 X165.804 Y134.078 I-.137 J2.791 E.16299
G1 X165.172 Y135.57 E.04976
G3 X163.59 Y138.538 I-33.046 J-15.712 E.10339
G1 X148.187 Y138.538 E.4733
G2 X155.389 Y130.257 I-8.525 J-14.688 E.3434
G1 X160.775 Y130.259 E.16548
M204 S10000
; WIPE_START
G1 F24000
G1 X162.775 Y130.26 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.547 J-1.087 P1  F30000
G1 X153.502 Y134.922 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4153
G2 X154.46 Y133.605 I-21.825 J-16.877 E.05399
G1 X158.133 Y137.278 E.17231
G1 X159.747 Y137.278 E.05357
G1 X164.986 Y132.04 E.24574
G3 X165.155 Y133.696 I-1.782 J1.018 E.05685
G3 X164.265 Y135.735 I-16.809 J-6.123 E.07384
G1 X159.528 Y130.998 E.22219
G1 X158.352 Y130.998 E.03903
G1 X152.071 Y137.278 E.29463
G1 X153.7 Y137.278 E.05401
G1 X148.954 Y138.325 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.282931
G1 F4153
G1 X149.622 Y138.123 E.01364
G1 X150.841 Y137.712 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F4153
G1 X163.052 Y137.712 E.45771
; WIPE_START
G1 F24000
G1 X161.052 Y137.712 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.213 J-.095 P1  F30000
G1 X158.25 Y101.945 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4153
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4153
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.013 J-1.217 P1  F30000
G1 X118.852 Y101.945 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4153
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X118.912 Y101.945 E.1571
G1 X118.46 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4153
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X118.52 Y102.337 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X118.46 Y101.257 E-.41103
G1 X119.378 Y101.257 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.203 J.183 P1  F30000
G1 X123.851 Y130.649 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4153
G1 X124.013 Y131.032 E.01379
G2 X129.72 Y137.975 I15.874 J-7.231 E.30155
G1 X129.666 Y138.146 E.00593
G1 X116.132 Y138.146 E.44897
G3 X113.985 Y133.715 I23.365 J-14.055 E.16355
M73 P70 R5
G3 X116.295 Y130.649 I2.307 J-.665 E.14755
G1 X123.791 Y130.649 E.24865
G1 X124.111 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4153
G1 X124.37 Y130.87 E.02047
G2 X131.319 Y138.538 I15.437 J-7.007 E.3231
G1 X115.912 Y138.538 E.47342
G3 X113.608 Y133.821 I23.245 J-14.276 E.16155
G3 X116.29 Y130.257 I2.685 J-.771 E.15876
G1 X124.051 Y130.257 E.23846
M204 S10000
; WIPE_START
G1 F24000
G1 X124.37 Y130.87 E-.26287
G1 X124.722 Y131.6 E-.30794
G1 X124.959 Y132.038 E-.18919
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.145 J.412 P1  F30000
G1 X125.996 Y134.923 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4153
G3 X125.039 Y133.607 I14.916 J-11.843 E.054
G1 X121.368 Y137.278 E.17225
G1 X119.753 Y137.278 E.05357
G1 X114.513 Y132.039 E.2458
G2 X114.246 Y133.217 I1.771 J1.02 E.04066
G2 X115.235 Y135.735 I12.418 J-3.423 E.08991
G1 X119.972 Y130.999 E.22219
G1 X121.148 Y130.998 E.03903
G1 X127.429 Y137.278 E.29463
G1 X125.8 Y137.278 E.05401
G1 X129.879 Y138.123 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.295624
G1 F4153
G1 X130.548 Y138.326 E.0144
G1 X116.385 Y137.712 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4153
G1 X128.595 Y137.712 E.45769
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.595 Y137.712 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/63
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
G3 Z4.8 I1.183 J-.287 P1  F30000
G1 X124.639 Y129.638 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X124.639 Y129.658 E.00078
G3 X125.365 Y131.21 I-40.545 J19.913 E.0655
G1 X125.365 Y129.449 E.06731
G1 X124.639 Y129.449 E.02775
G1 X124.639 Y126.572 E.10997
G1 X125.365 Y126.572 E.02775
G1 X125.365 Y123.695 E.10997
G1 X124.639 Y123.695 E.02775
G1 X124.639 Y120.818 E.10997
G1 X125.365 Y120.818 E.02775
G1 X125.365 Y117.941 E.10997
G1 X124.639 Y117.941 E.02775
G1 X124.639 Y115.064 E.10997
G1 X125.365 Y115.064 E.02775
G1 X125.365 Y112.187 E.10997
G1 X124.639 Y112.187 E.02775
G1 X124.639 Y109.309 E.10997
G1 X125.365 Y109.309 E.02775
G1 X125.365 Y106.432 E.10997
G1 X124.639 Y106.432 E.02775
G1 X124.639 Y103.555 E.10997
G1 X125.365 Y103.555 E.02775
G1 X125.365 Y100.678 E.10997
G1 X124.643 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X125.365 Y100.678 E-.27411
G1 X125.365 Y101.957 E-.48589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.216 J-.054 P1  F30000
G1 X124.151 Y129.508 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G3 X124.482 Y129.554 I.131 J.272 E.01086
G1 X124.482 Y103.077 E.81357
G1 X123.963 Y103.085 E.01595
G1 X123.963 Y129.508 E.8119
G1 X123.086 Y129.508 E.02695
G1 X123.086 Y103.085 E.8119
G1 X122.208 Y103.085 E.02695
G1 X122.208 Y129.508 E.8119
G1 X121.331 Y129.508 E.02695
G1 X121.331 Y103.085 E.8119
G1 X120.454 Y103.085 E.02695
G1 X120.454 Y129.508 E.8119
G1 X119.577 Y129.508 E.02695
G1 X119.577 Y103.085 E.8119
G1 X118.7 Y103.085 E.02695
G1 X118.7 Y129.508 E.8119
G1 X118.019 Y129.508 E.02094
G1 X118.019 Y103.077 E.81216
G1 X118.512 Y103.085 E.01515
; WIPE_START
G1 F24000
G1 X118.019 Y103.077 E-.18738
G1 X118.019 Y104.584 E-.57262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.156 J-.38 P1  F30000
G1 X116.733 Y100.678 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X117.857 Y100.678 E.04294
G1 X117.712 Y100.824 E.00785
G1 X117.712 Y102.77 E.07438
G1 X117.862 Y102.92 E.00811
G1 X117.862 Y103.555 E.0243
G1 X116.733 Y103.555 E.04312
G1 X116.733 Y106.432 E.10997
G1 X117.862 Y106.432 E.04312
G1 X117.862 Y109.309 E.10997
G1 X116.733 Y109.309 E.04312
G1 X116.733 Y112.187 E.10997
G1 X117.862 Y112.187 E.04312
G1 X117.862 Y115.064 E.10997
G1 X116.733 Y115.064 E.04312
G1 X116.733 Y117.941 E.10997
G1 X117.862 Y117.941 E.04312
G1 X117.862 Y120.818 E.10997
G1 X116.733 Y120.818 E.04312
G1 X116.733 Y123.695 E.10997
G1 X117.862 Y123.695 E.04312
G1 X117.862 Y126.572 E.10997
G1 X116.733 Y126.572 E.04312
G1 X116.733 Y129.449 E.10997
G1 X117.862 Y129.449 E.04312
; WIPE_START
G1 F24000
G1 X116.733 Y129.449 E-.42868
G1 X116.733 Y128.577 E-.33132
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.034 J1.216 P1  F30000
G1 X154.135 Y129.638 Z5
G1 Z4.6
G1 E.8 F1800
G1 F9000
G1 X154.135 Y131.21 E.06011
G1 X154.34 Y130.786 E.01799
G2 X154.748 Y129.851 I-9.554 J-4.731 E.039
G1 X154.762 Y129.819 E.00137
G2 X154.862 Y129.449 I-.399 J-.306 E.01501
G1 X154.135 Y129.449 E.02775
G1 X154.135 Y126.572 E.10997
G1 X154.862 Y126.572 E.02775
G1 X154.862 Y123.695 E.10997
G1 X154.135 Y123.695 E.02775
G1 X154.135 Y120.818 E.10997
G1 X154.862 Y120.818 E.02775
G1 X154.862 Y117.941 E.10997
G1 X154.135 Y117.941 E.02775
G1 X154.135 Y115.064 E.10997
G1 X154.862 Y115.064 E.02775
G1 X154.862 Y112.187 E.10997
G1 X154.135 Y112.187 E.02775
G1 X154.135 Y109.309 E.10997
G1 X154.862 Y109.309 E.02775
G1 X154.862 Y106.432 E.10997
G1 X154.135 Y106.432 E.02775
G1 X154.135 Y103.555 E.10997
G1 X154.862 Y103.555 E.02775
G1 X154.862 Y102.92 E.0243
G1 X154.712 Y102.77 E.00811
G1 X154.712 Y100.824 E.07438
G1 X154.857 Y100.678 E.00785
G1 X154.135 Y100.678 E.02757
; WIPE_START
G1 F24000
G1 X154.857 Y100.678 E-.27411
G1 X154.712 Y100.824 E-.07807
G1 X154.712 Y101.897 E-.40783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.072 J.575 P1  F30000
G1 X155.349 Y103.085 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X155.019 Y103.077 E.01015
G1 X155.019 Y129.554 E.81357
G1 X155.537 Y129.508 E.01601
G1 X155.537 Y103.085 E.8119
G1 X156.415 Y103.085 E.02695
G1 X156.415 Y129.508 E.8119
G1 X157.292 Y129.508 E.02695
G1 X157.292 Y103.085 E.8119
G1 X158.169 Y103.085 E.02695
G1 X158.169 Y129.508 E.8119
G1 X159.046 Y129.508 E.02695
G1 X159.046 Y103.085 E.8119
G1 X159.923 Y103.085 E.02695
G1 X159.923 Y129.508 E.8119
G1 X160.8 Y129.508 E.02695
G1 X160.8 Y103.085 E.8119
G1 X161.482 Y103.077 E.02094
G1 X161.482 Y129.508 E.81216
G1 X160.989 Y129.508 E.01515
G1 X162.767 Y129.449 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X161.639 Y129.449 E.04312
G1 X161.639 Y126.572 E.10997
G1 X162.767 Y126.572 E.04312
G1 X162.767 Y123.695 E.10997
G1 X161.639 Y123.695 E.04312
G1 X161.639 Y120.818 E.10997
G1 X162.767 Y120.818 E.04312
G1 X162.767 Y117.941 E.10997
G1 X161.639 Y117.941 E.04312
G1 X161.639 Y115.064 E.10997
G1 X162.767 Y115.064 E.04312
G1 X162.767 Y112.187 E.10997
G1 X161.639 Y112.187 E.04312
G1 X161.639 Y109.309 E.10997
G1 X162.767 Y109.309 E.04312
G1 X162.767 Y106.432 E.10997
G1 X161.639 Y106.432 E.04312
G1 X161.639 Y103.555 E.10997
G1 X162.767 Y103.555 E.04312
G1 X162.767 Y100.678 E.10997
G1 X161.643 Y100.678 E.04294
; WIPE_START
G1 F24000
G1 X162.767 Y100.678 E-.42688
G1 X162.767 Y101.555 E-.33312
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.214 J-.08 P1  F30000
G1 X160.84 Y130.65 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X163.307 Y130.651 E.08186
G3 X165.423 Y133.976 I-.1 J2.399 E.15329
G1 X164.81 Y135.419 E.052
G3 X163.479 Y137.946 I-31.265 J-14.856 E.09477
G1 X150.109 Y137.946 E.44351
G1 X150.054 Y137.777 E.00587
G2 X155.649 Y130.649 I-10.328 J-13.867 E.30417
M73 P71 R5
G1 X160.78 Y130.65 E.17019
G1 X160.84 Y130.259 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.326 Y130.259 E.07638
G3 X165.787 Y134.121 I-.119 J2.791 E.16493
G1 X165.168 Y135.58 E.04869
G3 X163.705 Y138.338 I-32.169 J-15.293 E.09595
G1 X148.524 Y138.338 E.46647
G2 X155.389 Y130.257 I-8.799 J-14.432 E.33141
G1 X160.78 Y130.259 E.16564
M204 S10000
; WIPE_START
G1 F24000
G1 X162.78 Y130.259 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.306 J-1.178 P1  F30000
G1 X155.292 Y132.207 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X154.459 Y133.604 I-14.692 J-7.813 E.054
G1 X157.933 Y137.078 E.16297
G1 X159.947 Y137.078 E.06684
G1 X164.991 Y132.035 E.23661
G3 X165.156 Y133.693 I-2.228 J1.058 E.05639
G3 X164.265 Y135.735 I-16.706 J-6.073 E.07394
G1 X159.528 Y130.998 E.22221
G1 X158.352 Y130.998 E.03902
G1 X152.271 Y137.078 E.28525
G1 X153.9 Y137.078 E.05401
G1 X151.08 Y137.512 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F13696.009
G1 X163.167 Y137.512 E.45306
; WIPE_START
G1 F24000
G1 X161.167 Y137.512 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.213 J-.099 P1  F30000
G1 X158.25 Y101.945 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.013 J-1.217 P1  F30000
G1 X118.852 Y101.945 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X118.912 Y101.945 E.1571
G1 X118.46 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X118.52 Y102.337 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X118.46 Y101.257 E-.41103
G1 X119.378 Y101.257 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.203 J.183 P1  F30000
G1 X123.851 Y130.649 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X124.012 Y131.03 E.01375
G2 X129.448 Y137.78 I15.779 J-7.143 E.29055
G1 X129.391 Y137.946 E.00581
G1 X116.018 Y137.946 E.44362
G3 X113.984 Y133.712 I22.876 J-13.594 E.156
G3 X116.295 Y130.649 I2.318 J-.655 E.14727
G1 X123.791 Y130.649 E.24865
G1 X124.111 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X124.37 Y130.869 E.02043
G2 X130.975 Y138.338 I15.435 J-6.995 E.31096
G1 X115.791 Y138.338 E.46655
G3 X113.608 Y133.821 I23.431 J-14.112 E.15437
G3 X116.29 Y130.257 I2.696 J-.763 E.15855
G1 X124.051 Y130.257 E.23846
M204 S10000
; WIPE_START
G1 F24000
G1 X124.37 Y130.869 E-.26235
G1 X124.72 Y131.598 E-.30742
G1 X124.959 Y132.038 E-.19023
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.263 J-1.188 P1  F30000
G1 X124.211 Y132.203 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X125.045 Y133.601 I10.64 J-5.407 E.05403
G1 X121.568 Y137.078 E.16315
G1 X119.553 Y137.078 E.06684
G1 X114.509 Y132.035 E.23662
G2 X114.273 Y133.415 I2.047 J1.06 E.0472
G2 X115.235 Y135.735 I18.448 J-6.291 E.08337
G1 X119.973 Y130.997 E.22227
G1 X121.147 Y130.997 E.03894
G1 X127.229 Y137.078 E.2853
G1 X125.6 Y137.078 E.05401
G1 X116.271 Y137.512 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F13696.009
G1 X128.36 Y137.512 E.45313
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.36 Y137.512 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/63
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
G3 Z5 I.237 J1.194 P1  F30000
G1 X160.845 Y130.65 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2557
G1 X163.291 Y130.651 E.08115
G3 X165.408 Y134.011 I-.08 J2.397 E.15521
G1 X164.805 Y135.429 E.0511
G3 X163.594 Y137.746 I-31.272 J-14.877 E.08674
G1 X150.37 Y137.746 E.43866
G1 X150.313 Y137.582 E.00576
G2 X155.649 Y130.649 I-10.548 J-13.638 E.29342
G1 X160.785 Y130.65 E.17036
G1 X160.845 Y130.258 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2557
G1 X163.308 Y130.259 E.07569
G3 X165.77 Y134.162 I-.097 J2.789 E.16692
G1 X165.163 Y135.59 E.04769
G3 X163.82 Y138.138 I-22.055 J-9.997 E.08854
G1 X148.842 Y138.138 E.46023
G2 X155.389 Y130.257 I-9.175 J-14.282 E.3198
G1 X160.785 Y130.258 E.1658
M204 S10000
; WIPE_START
G1 F24000
G1 X162.785 Y130.259 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.306 J-1.178 P1  F30000
G1 X155.292 Y132.207 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2557
G3 X154.458 Y133.604 I-14.588 J-7.753 E.054
G1 X157.733 Y136.878 E.1536
G1 X160.147 Y136.878 E.08011
G1 X164.991 Y132.035 E.22723
G3 X165.083 Y133.885 I-1.831 J1.019 E.06365
G3 X164.27 Y135.74 I-23.027 J-8.994 E.06721
G1 X159.528 Y130.998 E.22245
G1 X158.352 Y130.998 E.039
G1 X152.471 Y136.878 E.27588
G1 X154.1 Y136.878 E.05401
G1 X163.342 Y137.312 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F2557
G1 X151.383 Y137.312 E.44824
; WIPE_START
G1 F24000
G1 X153.383 Y137.312 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.206 J.166 P1  F30000
G1 X158.25 Y101.945 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2557
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2557
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.013 J-1.217 P1  F30000
G1 X118.852 Y101.945 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2557
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X118.912 Y101.945 E.1571
G1 X118.46 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2557
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X118.52 Y102.337 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X118.46 Y101.257 E-.41103
G1 X119.378 Y101.257 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.203 J.183 P1  F30000
G1 X123.851 Y130.649 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2557
G1 X124.012 Y131.029 E.0137
G2 X129.187 Y137.58 I15.753 J-7.125 E.27968
G1 X129.13 Y137.746 E.00581
G1 X115.903 Y137.746 E.43877
G3 X114.052 Y133.912 I26.525 J-15.175 E.14132
G3 X116.295 Y130.649 I2.238 J-.865 E.15453
G1 X123.791 Y130.649 E.24865
G1 X124.111 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2557
G1 X124.369 Y130.868 E.02039
M73 P72 R5
G2 X130.661 Y138.138 I15.405 J-6.974 E.29955
G1 X115.676 Y138.138 E.46044
G3 X113.608 Y133.822 I23.066 J-13.707 E.14724
G3 X116.29 Y130.257 I2.684 J-.772 E.1588
G1 X124.051 Y130.257 E.23845
M204 S10000
; WIPE_START
G1 F24000
G1 X124.369 Y130.868 E-.26184
G1 X124.719 Y131.595 E-.3069
G1 X124.959 Y132.038 E-.19126
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.263 J-1.188 P1  F30000
G1 X124.211 Y132.203 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2557
G2 X125.045 Y133.601 I10.658 J-5.413 E.05403
G1 X121.768 Y136.878 E.15376
G1 X119.353 Y136.878 E.08011
G1 X114.513 Y132.039 E.22704
G2 X114.274 Y133.42 I1.973 J1.052 E.04728
G2 X115.235 Y135.735 I18.703 J-6.406 E.08321
G1 X119.973 Y130.997 E.22227
G1 X121.147 Y130.997 E.03894
G1 X127.029 Y136.878 E.27591
G1 X125.4 Y136.878 E.05401
G1 X116.156 Y137.312 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2557
G1 X128.119 Y137.312 E.44839
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X126.119 Y137.312 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/63
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
G3 Z5.2 I1.201 J-.197 P1  F30000
G1 X124.858 Y129.638 Z5.2
G1 Z4.84
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F9000
G2 X125.163 Y130.791 I2.112 J.059 E.04359
G1 X125.365 Y131.21 E.01676
G1 X125.365 Y129.449 E.06347
G1 X124.858 Y129.449 E.01824
G1 X124.858 Y126.572 E.10367
G1 X125.365 Y126.572 E.01824
G1 X125.365 Y123.695 E.10367
G1 X124.858 Y123.695 E.01824
G1 X124.859 Y120.818 E.10367
G1 X125.365 Y120.818 E.01824
G1 X125.365 Y117.941 E.10367
G1 X124.859 Y117.941 E.01824
G1 X124.859 Y115.064 E.10367
G1 X125.365 Y115.064 E.01824
G1 X125.365 Y112.187 E.10367
G1 X124.859 Y112.187 E.01824
G1 X124.859 Y109.309 E.10367
G1 X125.365 Y109.309 E.01824
G1 X125.365 Y106.432 E.10367
G1 X124.859 Y106.432 E.01824
G1 X124.859 Y103.555 E.10367
G1 X125.365 Y103.555 E.01824
G1 X125.365 Y100.678 E.10367
G1 X124.643 Y100.678 E.02599
; WIPE_START
G1 F24000
G1 X125.365 Y100.678 E-.27411
G1 X125.365 Y101.957 E-.48589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.24 I-1.216 J-.054 P1  F30000
G1 X124.151 Y129.508 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G3 X124.482 Y129.554 I.131 J.272 E.01273
G1 X124.482 Y103.077 E.95406
G1 X123.963 Y103.085 E.0187
G1 X123.963 Y129.508 E.9521
G1 X123.086 Y129.508 E.0316
G1 X123.086 Y103.085 E.9521
G1 X122.208 Y103.085 E.0316
G1 X122.208 Y129.508 E.9521
G1 X121.331 Y129.508 E.0316
G1 X121.331 Y103.085 E.9521
G1 X120.454 Y103.085 E.0316
G1 X120.454 Y129.508 E.9521
G1 X119.577 Y129.508 E.0316
G1 X119.577 Y103.085 E.9521
G1 X118.7 Y103.085 E.0316
G1 X118.7 Y129.508 E.9521
G1 X118.019 Y129.508 E.02456
G1 X118.019 Y103.077 E.95241
G1 X118.512 Y103.085 E.01777
; WIPE_START
G1 F24000
G1 X118.019 Y103.077 E-.18739
G1 X118.019 Y104.584 E-.57262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.24 I1.156 J-.38 P1  F30000
G1 X116.733 Y100.678 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X117.857 Y100.678 E.04048
G1 X117.712 Y100.824 E.0074
G1 X117.642 Y103.555 E.09847
G1 X116.733 Y103.555 E.03272
G1 X116.733 Y106.432 E.10367
G1 X117.642 Y106.432 E.03272
G1 X117.642 Y109.309 E.10367
G1 X116.733 Y109.309 E.03272
G1 X116.733 Y112.187 E.10367
G1 X117.642 Y112.187 E.03272
G1 X117.642 Y115.064 E.10367
G1 X116.733 Y115.064 E.03272
G1 X116.733 Y117.941 E.10367
G1 X117.642 Y117.941 E.03272
G1 X117.642 Y120.818 E.10367
G1 X116.733 Y120.818 E.03272
G1 X116.733 Y123.695 E.10367
G1 X117.642 Y123.695 E.03272
G1 X117.642 Y126.572 E.10367
G1 X116.733 Y126.572 E.03272
G1 X116.733 Y129.449 E.10367
G1 X117.642 Y129.449 E.03272
; WIPE_START
G1 F24000
G1 X116.733 Y129.449 E-.34507
G1 X116.733 Y128.357 E-.41493
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.24 I-.042 J1.216 P1  F30000
G1 X154.135 Y129.638 Z5.24
G1 Z4.84
G1 E.8 F1800
G1 F9000
G1 X154.135 Y131.21 E.05668
G2 X154.642 Y129.449 I-2.345 J-1.627 E.06723
G1 X154.135 Y129.449 E.01823
G1 X154.135 Y126.572 E.10367
G1 X154.642 Y126.572 E.01823
G1 X154.642 Y123.695 E.10367
G1 X154.135 Y123.695 E.01823
G1 X154.135 Y120.818 E.10367
G1 X154.642 Y120.818 E.01823
G1 X154.642 Y117.941 E.10367
G1 X154.135 Y117.941 E.01823
G1 X154.135 Y115.064 E.10367
G1 X154.642 Y115.064 E.01823
G1 X154.642 Y112.187 E.10367
G1 X154.135 Y112.187 E.01823
G1 X154.135 Y109.309 E.10367
G1 X154.642 Y109.309 E.01823
G1 X154.642 Y106.432 E.10367
G1 X154.135 Y106.432 E.01823
G1 X154.135 Y103.555 E.10367
G1 X154.642 Y103.555 E.01823
G1 X154.712 Y100.824 E.09847
G1 X154.857 Y100.678 E.0074
G1 X154.135 Y100.678 E.02599
; WIPE_START
G1 F24000
G1 X154.857 Y100.678 E-.27411
G1 X154.712 Y100.824 E-.07807
G1 X154.684 Y101.896 E-.40783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.24 I-1.062 J.594 P1  F30000
G1 X155.349 Y103.085 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X155.019 Y103.077 E.01191
G1 X155.019 Y129.554 E.95406
G3 X155.537 Y129.508 I.335 J.831 E.01904
G1 X155.537 Y103.085 E.9521
G1 X156.415 Y103.085 E.0316
G1 X156.415 Y129.508 E.9521
G1 X157.292 Y129.508 E.0316
G1 X157.292 Y103.085 E.9521
G1 X158.169 Y103.085 E.0316
G1 X158.169 Y129.508 E.9521
G1 X159.046 Y129.508 E.0316
G1 X159.046 Y103.085 E.9521
G1 X159.923 Y103.085 E.0316
G1 X159.923 Y129.508 E.9521
G1 X160.8 Y129.508 E.0316
G1 X160.8 Y103.085 E.9521
G1 X161.482 Y103.077 E.02456
G1 X161.482 Y129.508 E.95241
G1 X160.989 Y129.508 E.01777
G1 X162.767 Y129.449 F30000
; FEATURE: Support
G1 F9000
G1 X161.859 Y129.449 E.03272
G1 X161.859 Y126.572 E.10367
G1 X162.767 Y126.572 E.03272
G1 X162.767 Y123.695 E.10367
G1 X161.859 Y123.695 E.03272
G1 X161.859 Y120.818 E.10367
G1 X162.767 Y120.818 E.03272
G1 X162.767 Y117.941 E.10367
G1 X161.859 Y117.941 E.03272
G1 X161.859 Y115.064 E.10367
G1 X162.767 Y115.064 E.03272
G1 X162.767 Y112.187 E.10367
G1 X161.859 Y112.187 E.03272
G1 X161.859 Y109.309 E.10367
G1 X162.767 Y109.309 E.03272
G1 X162.767 Y106.432 E.10367
G1 X161.859 Y106.432 E.03272
G1 X161.859 Y103.555 E.10367
G1 X162.767 Y103.555 E.03272
G1 X162.767 Y100.678 E.10367
G1 X161.643 Y100.678 E.04048
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X162.767 Y100.678 E-.42688
G1 X162.767 Y101.555 E-.33312
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/63
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
G3 Z5.24 I-.729 J-.975 P1  F30000
G1 X123.851 Y130.649 Z5.24
M73 P73 R5
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X124.011 Y131.028 E.01365
G2 X129.126 Y137.546 I15.947 J-7.249 E.27746
G1 X115.789 Y137.546 E.44242
G3 X114 Y133.764 I25.868 J-14.549 E.13887
G3 X116.295 Y130.649 I2.297 J-.711 E.14916
G1 X123.791 Y130.649 E.24864
G1 X124.111 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X124.369 Y130.866 E.02034
G2 X130.349 Y137.938 I15.418 J-6.975 E.28824
G1 X115.562 Y137.938 E.45437
G3 X113.627 Y133.883 I25.833 J-14.819 E.13818
G3 X116.29 Y130.257 I2.672 J-.829 E.16064
G1 X124.051 Y130.257 E.23845
M204 S10000
; WIPE_START
G1 F24000
M73 P73 R4
G1 X124.369 Y130.866 E-.26133
G1 X124.718 Y131.593 E-.30637
G1 X124.959 Y132.038 E-.1923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.263 J-1.188 P1  F30000
G1 X124.211 Y132.203 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X125.045 Y133.601 I10.673 J-5.418 E.05403
G1 X121.968 Y136.678 E.14437
G1 X119.153 Y136.678 E.09338
G1 X114.513 Y132.039 E.21765
G2 X114.265 Y133.371 I1.992 J1.06 E.04566
G2 X115.235 Y135.735 I21.47 J-7.429 E.0848
G1 X119.973 Y130.997 E.22227
G1 X121.147 Y130.997 E.03894
G1 X126.829 Y136.678 E.26653
G1 X125.2 Y136.678 E.05401
G1 X116.042 Y137.112 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F13696.009
G1 X127.89 Y137.112 E.4441
; WIPE_START
G1 F24000
G1 X125.89 Y137.112 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.193 J-.239 P1  F30000
G1 X118.852 Y101.945 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X118.912 Y101.945 E.1571
G1 X118.46 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X118.52 Y102.337 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X118.46 Y101.257 E-.41103
G1 X119.378 Y101.257 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.022 J1.217 P1  F30000
G1 X158.25 Y101.945 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.202 J.193 P1  F30000
G1 X160.85 Y130.65 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X163.282 Y130.651 E.08067
G3 X165.448 Y133.914 I-.074 J2.399 E.15193
G1 X164.801 Y135.439 E.05497
G3 X163.709 Y137.546 I-32.393 J-15.45 E.0787
G1 X150.623 Y137.546 E.4341
G1 X150.566 Y137.382 E.00576
G2 X155.649 Y130.649 I-10.872 J-13.495 E.28269
G1 X160.79 Y130.65 E.17053
G1 X160.85 Y130.258 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.294 Y130.259 E.07509
G3 X165.813 Y134.057 I-.087 J2.792 E.16378
G1 X165.158 Y135.601 E.05152
G3 X163.935 Y137.938 I-27.379 J-12.837 E.08107
G1 X149.15 Y137.938 E.4543
G2 X155.389 Y130.257 I-9.448 J-14.048 E.30857
G1 X160.79 Y130.258 E.16595
M204 S10000
; WIPE_START
G1 F24000
G1 X162.79 Y130.259 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.306 J-1.178 P1  F30000
G1 X155.292 Y132.207 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X154.458 Y133.604 I-14.485 J-7.694 E.054
G1 X157.533 Y136.678 E.14422
G1 X160.347 Y136.678 E.09338
G1 X164.987 Y132.039 E.21763
G3 X165.178 Y132.476 I-1.171 J.774 E.0159
G2 X165.126 Y132.848 I.126 J.207 E.01425
G3 X165.155 Y133.438 I-4.723 J.529 E.01961
G1 X165.222 Y133.438 E.0022
G3 X165.12 Y133.795 I-1.482 J-.229 E.01235
G3 X164.27 Y135.74 I-22.315 J-8.598 E.07043
G1 X159.528 Y130.998 E.22243
G1 X158.352 Y130.998 E.03901
G1 X152.671 Y136.678 E.26649
G1 X154.3 Y136.678 E.05401
G1 X149.83 Y137.726 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.320184
G1 F15000
G1 X150.41 Y137.53 E.01382
G1 X151.55 Y137.112 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F13696.009
G1 X163.397 Y137.112 E.44405
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 5.08
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X161.397 Y137.112 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/63
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
G3 Z5.4 I.906 J-.813 P1  F30000
G1 X154.79 Y129.751 Z5.4
G1 Z5.08
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F4763
G3 X154.135 Y131.211 I-51.651 J-22.292 E.05767
G1 X154.135 Y129.449 E.06349
G1 X162.767 Y129.449 E.31101
G1 X162.767 Y126.761 E.09688
G1 X154.135 Y129.261 F30000
G1 F4763
G1 X154.135 Y126.572 E.09688
G1 X162.767 Y126.572 E.31101
G1 X162.767 Y123.695 E.10367
G1 X154.135 Y123.695 E.31101
G1 X154.135 Y120.818 E.10367
G1 X162.767 Y120.818 E.31101
G1 X162.767 Y117.941 E.10367
G1 X154.135 Y117.941 E.31101
G1 X154.135 Y115.064 E.10367
G1 X162.767 Y115.064 E.31101
G1 X162.767 Y112.187 E.10367
G1 X154.135 Y112.187 E.31101
G1 X154.135 Y109.309 E.10367
G1 X162.767 Y109.309 E.31101
G1 X162.767 Y106.432 E.10367
G1 X154.135 Y106.432 E.31101
G1 X154.135 Y103.555 E.10367
G1 X162.767 Y103.555 E.31101
G1 X162.767 Y100.678 E.10367
G1 X161.643 Y100.678 E.04048
G1 X161.789 Y100.824 E.0074
G1 X161.789 Y102.77 E.07013
G1 X161.473 Y103.085 E.01608
G1 X155.027 Y103.085 E.23228
G1 X154.712 Y102.77 E.01608
G1 X154.712 Y100.824 E.07013
G1 X154.857 Y100.678 E.0074
G1 X154.135 Y100.678 E.02599
; WIPE_START
G1 F24000
G1 X154.857 Y100.678 E-.27411
G1 X154.712 Y100.824 E-.07807
G1 X154.712 Y101.897 E-.40783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.48 I.039 J-1.216 P1  F30000
G1 X116.733 Y100.678 Z5.48
G1 Z5.08
G1 E.8 F1800
G1 F4763
G1 X117.857 Y100.678 E.04048
G1 X117.712 Y100.824 E.0074
G1 X117.712 Y102.77 E.07013
G1 X118.027 Y103.085 E.01608
G1 X124.473 Y103.085 E.23228
G1 X124.789 Y102.77 E.01608
G1 X124.789 Y100.824 E.07013
G1 X124.643 Y100.678 E.0074
G1 X125.365 Y100.678 E.02599
G1 X125.365 Y103.555 E.10367
G1 X116.733 Y103.555 E.31101
G1 X116.733 Y106.432 E.10367
G1 X125.365 Y106.432 E.31101
G1 X125.365 Y109.309 E.10367
G1 X116.733 Y109.309 E.31101
G1 X116.733 Y112.187 E.10367
G1 X125.365 Y112.187 E.31101
G1 X125.365 Y115.064 E.10367
G1 X116.733 Y115.064 E.31101
G1 X116.733 Y117.941 E.10367
G1 X125.365 Y117.941 E.31101
G1 X125.365 Y120.818 E.10367
G1 X116.733 Y120.818 E.31101
G1 X116.733 Y123.695 E.10367
G1 X125.365 Y123.695 E.31101
G1 X125.365 Y126.572 E.10367
G1 X116.733 Y126.572 E.31101
G1 X116.733 Y129.449 E.10367
G1 X125.365 Y129.449 E.31101
G1 X125.365 Y131.211 E.06348
G3 X124.71 Y129.751 I32.852 J-15.615 E.05766
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X125.365 Y131.211 E-.60803
G1 X125.365 Y130.811 E-.15197
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/63
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
G3 Z5.48 I.13 J-1.21 P1  F30000
G1 X123.851 Y130.649 Z5.48
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4763
G1 X124.011 Y131.026 E.01361
G2 X128.887 Y137.346 I15.962 J-7.277 E.26711
G1 X115.675 Y137.346 E.43829
G3 X114 Y133.762 I22.207 J-12.563 E.13133
G3 X116.295 Y130.649 I2.298 J-.709 E.14909
G1 X123.791 Y130.649 E.24864
G1 X124.113 Y130.261 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4763
G2 X130.064 Y137.738 I15.638 J-6.341 E.2977
G1 X115.448 Y137.738 E.44912
G3 X113.626 Y133.881 I22.313 J-12.898 E.1312
G3 X116.29 Y130.257 I2.673 J-.827 E.16056
G1 X124.053 Y130.261 E.23851
M204 S10000
; WIPE_START
G1 F24000
G1 X124.368 Y130.865 E-.25899
G1 X124.717 Y131.591 E-.30585
G1 X124.961 Y132.042 E-.19516
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.258 J-1.189 P1  F30000
G1 X124.208 Y132.206 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4763
M73 P74 R4
G2 X125.045 Y133.601 I12.238 J-6.392 E.05401
G1 X122.168 Y136.478 E.13497
G1 X118.953 Y136.478 E.10664
G1 X114.508 Y132.034 E.2085
G2 X114.259 Y133.326 I1.807 J1.019 E.04441
G2 X115.235 Y135.735 I19.201 J-6.379 E.08629
G1 X119.973 Y130.997 E.22228
G1 X121.147 Y130.997 E.03894
G1 X126.629 Y136.478 E.25715
G1 X127.4 Y136.478 E.02559
G3 X126.805 Y135.862 I5.867 J-6.265 E.02843
G1 X115.928 Y136.912 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4763
G1 X127.669 Y136.912 E.44008
; WIPE_START
G1 F24000
G1 X125.669 Y136.912 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.194 J-.233 P1  F30000
G1 X118.852 Y101.945 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4763
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X118.912 Y101.945 E.1571
G1 X118.46 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4763
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X118.52 Y102.337 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X118.46 Y101.257 E-.41103
G1 X119.378 Y101.257 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.022 J1.217 P1  F30000
G1 X158.25 Y101.945 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4763
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4763
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.202 J.193 P1  F30000
G1 X160.855 Y130.65 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4763
G1 X163.275 Y130.65 E.08027
G3 X165.374 Y134.095 I-.07 J2.405 E.1587
G3 X163.824 Y137.346 I-29.09 J-11.874 E.11952
G1 X150.618 Y137.346 E.43809
G2 X155.649 Y130.649 I-10.992 J-13.497 E.28061
G1 X160.795 Y130.65 E.1707
G1 X160.855 Y130.258 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4763
G1 X163.28 Y130.258 E.0745
G3 X165.735 Y134.248 I-.076 J2.797 E.17058
G3 X164.336 Y137.244 I-26.569 J-10.582 E.10167
G1 X164.05 Y137.738 E.01751
G1 X149.441 Y137.738 E.44891
G2 X155.389 Y130.257 I-9.678 J-13.801 E.29776
G1 X160.795 Y130.258 E.16611
M204 S10000
; WIPE_START
G1 F24000
G1 X162.795 Y130.258 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.306 J-1.178 P1  F30000
G1 X155.292 Y132.207 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4763
G3 X154.458 Y133.604 I-14.383 J-7.636 E.054
G1 X157.333 Y136.478 E.13485
G1 X160.547 Y136.478 E.10664
G1 X164.989 Y132.037 E.20837
G3 X165.117 Y133.803 I-2.125 J1.041 E.0602
G3 X164.265 Y135.735 I-16.607 J-6.165 E.07009
G1 X159.528 Y130.998 E.22223
G1 X158.352 Y130.998 E.039
G1 X152.871 Y136.478 E.25712
G1 X152.096 Y136.478 E.02573
G2 X152.692 Y135.869 I-6.16 J-6.629 E.02829
G1 X151.772 Y136.912 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4763
G1 X163.512 Y136.912 E.44004
; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X161.512 Y136.912 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/63
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
G3 Z5.6 I.887 J-.833 P1  F30000
G1 X154.79 Y129.751 Z5.6
G1 Z5.32
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F4730
G3 X154.135 Y131.211 I-55.539 J-24.033 E.05768
G1 X154.135 Y129.449 E.06349
G1 X162.767 Y129.449 E.31101
G1 X162.767 Y126.761 E.09688
G1 X154.135 Y129.261 F30000
G1 F4730
G1 X154.135 Y126.572 E.09688
G1 X162.767 Y126.572 E.31101
G1 X162.767 Y123.695 E.10367
G1 X154.135 Y123.695 E.31101
G1 X154.135 Y120.818 E.10367
G1 X162.767 Y120.818 E.31101
G1 X162.767 Y117.941 E.10367
G1 X154.135 Y117.941 E.31101
G1 X154.135 Y115.064 E.10367
G1 X162.767 Y115.064 E.31101
G1 X162.767 Y112.187 E.10367
G1 X154.135 Y112.187 E.31101
G1 X154.135 Y109.309 E.10367
G1 X162.767 Y109.309 E.31101
G1 X162.767 Y106.432 E.10367
G1 X154.135 Y106.432 E.31101
G1 X154.135 Y103.555 E.10367
G1 X162.767 Y103.555 E.31101
G1 X162.767 Y100.678 E.10367
G1 X161.643 Y100.678 E.04048
G1 X161.789 Y100.824 E.0074
G1 X161.789 Y102.77 E.07013
G1 X161.473 Y103.085 E.01608
G1 X155.027 Y103.085 E.23228
G1 X154.712 Y102.77 E.01608
G1 X154.712 Y100.824 E.07013
G1 X154.857 Y100.678 E.0074
G1 X154.135 Y100.678 E.02599
; WIPE_START
G1 F24000
G1 X154.857 Y100.678 E-.27411
G1 X154.712 Y100.824 E-.07807
G1 X154.712 Y101.897 E-.40783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.72 I.039 J-1.216 P1  F30000
G1 X116.733 Y100.678 Z5.72
G1 Z5.32
G1 E.8 F1800
G1 F4730
G1 X117.857 Y100.678 E.04048
G1 X117.712 Y100.824 E.0074
G1 X117.712 Y102.77 E.07013
G1 X118.027 Y103.085 E.01608
G1 X124.473 Y103.085 E.23228
G1 X124.789 Y102.77 E.01608
G1 X124.789 Y100.824 E.07013
G1 X124.643 Y100.678 E.0074
G1 X125.365 Y100.678 E.02599
G1 X125.365 Y103.555 E.10367
G1 X116.733 Y103.555 E.31101
G1 X116.733 Y106.432 E.10367
G1 X125.365 Y106.432 E.31101
G1 X125.365 Y109.309 E.10367
G1 X116.733 Y109.309 E.31101
G1 X116.733 Y112.187 E.10367
G1 X125.365 Y112.187 E.31101
G1 X125.365 Y115.064 E.10367
G1 X116.733 Y115.064 E.31101
G1 X116.733 Y117.941 E.10367
G1 X125.365 Y117.941 E.31101
G1 X125.365 Y120.818 E.10367
G1 X116.733 Y120.818 E.31101
G1 X116.733 Y123.695 E.10367
G1 X125.365 Y123.695 E.31101
G1 X125.365 Y126.572 E.10367
G1 X116.733 Y126.572 E.31101
G1 X116.733 Y129.449 E.10367
G1 X125.365 Y129.449 E.31101
G1 X125.365 Y131.211 E.06348
G1 X125.158 Y130.781 E.01718
G3 X124.71 Y129.751 I24.002 J-11.061 E.0405
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X125.158 Y130.781 E-.42702
G1 X125.365 Y131.211 E-.18114
G1 X125.365 Y130.811 E-.15183
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/63
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
G3 Z5.72 I.13 J-1.21 P1  F30000
G1 X123.851 Y130.649 Z5.72
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4730
G1 X124.01 Y131.025 E.01356
G2 X128.638 Y137.146 I15.872 J-7.192 E.25663
G1 X115.562 Y137.146 E.43375
G1 X115.44 Y136.931 E.0082
G3 X113.985 Y133.713 I24.202 J-12.886 E.11723
G3 X116.295 Y130.649 I2.312 J-.66 E.14739
G1 X123.791 Y130.649 E.24864
G1 X124.111 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4730
G1 X124.125 Y130.291 E.00113
G2 X129.778 Y137.538 I15.672 J-6.397 E.28601
G1 X115.334 Y137.538 E.44383
G3 X113.609 Y133.824 I22.399 J-12.664 E.12594
G3 X116.29 Y130.257 I2.69 J-.77 E.15876
G1 X124.051 Y130.257 E.23845
M204 S10000
; WIPE_START
G1 F24000
G1 X124.125 Y130.291 E-.03105
G1 X124.368 Y130.864 E-.23656
G1 X124.715 Y131.588 E-.30533
G1 X124.95 Y132.021 E-.18707
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.295 J-1.181 P1  F30000
G1 X124.208 Y132.207 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4730
G2 X125.042 Y133.604 I14.283 J-7.579 E.054
G1 X122.368 Y136.278 E.12547
G1 X118.753 Y136.278 E.11991
G1 X114.512 Y132.038 E.19894
G2 X114.251 Y133.262 I1.785 J1.021 E.04219
G2 X115.238 Y135.733 I11.907 J-3.322 E.08843
G1 X119.973 Y130.997 E.22216
G1 X121.147 Y130.997 E.03894
G1 X126.429 Y136.278 E.24777
M73 P75 R4
G1 X127.199 Y136.278 E.02554
G3 X126.613 Y135.652 I5.983 J-6.181 E.02848
G1 X115.829 Y136.712 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F4730
G1 X127.459 Y136.712 E.43593
; WIPE_START
G1 F24000
G1 X125.459 Y136.712 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.196 J-.227 P1  F30000
G1 X118.852 Y101.945 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4730
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X118.912 Y101.945 E.1571
G1 X118.46 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4730
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X118.52 Y102.337 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X118.46 Y101.257 E-.41103
G1 X119.378 Y101.257 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.022 J1.217 P1  F30000
G1 X158.25 Y101.945 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4730
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4730
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.202 J.193 P1  F30000
G1 X160.86 Y130.65 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4730
G1 X163.257 Y130.65 E.07952
G3 X165.356 Y134.139 I-.054 J2.408 E.16088
G3 X164.007 Y137.029 I-26.066 J-10.409 E.10588
G1 X163.939 Y137.146 E.00445
G1 X150.866 Y137.146 E.43366
G2 X155.649 Y130.649 I-11.374 J-13.382 E.27002
G1 X160.8 Y130.65 E.17087
G1 X160.86 Y130.258 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4730
G1 X163.262 Y130.258 E.07381
G3 X165.717 Y134.291 I-.06 J2.8 E.17259
G3 X164.166 Y137.538 I-29.365 J-12.043 E.11062
G1 X149.719 Y137.538 E.44392
G2 X155.389 Y130.257 I-9.924 J-13.578 E.28726
G1 X160.8 Y130.258 E.16627
M204 S10000
; WIPE_START
G1 F24000
G1 X162.8 Y130.258 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.306 J-1.178 P1  F30000
G1 X155.292 Y132.207 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4730
G3 X154.458 Y133.604 I-14.209 J-7.535 E.054
G1 X157.133 Y136.278 E.12547
G1 X160.747 Y136.278 E.11991
G1 X164.988 Y132.038 E.19893
G3 X165.118 Y133.799 I-1.766 J1.016 E.06057
G3 X164.263 Y135.733 I-15.012 J-5.483 E.07021
G1 X159.528 Y130.998 E.22214
G1 X158.352 Y130.997 E.03898
G1 X153.071 Y136.278 E.24774
G1 X152.297 Y136.278 E.02569
G2 X152.885 Y135.659 I-6.255 J-6.525 E.02833
G1 X151.978 Y136.712 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4730
G1 X163.613 Y136.712 E.43609
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 5.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X161.613 Y136.712 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/63
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
G3 Z5.8 I.857 J-.864 P1  F30000
G1 X154.734 Y129.885 Z5.8
G1 Z5.56
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F4800
G1 X154.749 Y129.85 E.00137
G3 X155.537 Y129.508 I.642 J.4 E.03294
G1 X155.537 Y103.085 E.95211
G1 X156.415 Y103.085 E.0316
G1 X156.415 Y129.508 E.95211
G1 X157.292 Y129.508 E.0316
G1 X157.292 Y103.085 E.95211
G1 X158.169 Y103.085 E.0316
G1 X158.169 Y129.508 E.95211
G1 X159.046 Y129.508 E.0316
G1 X159.046 Y103.085 E.95211
G1 X159.923 Y103.085 E.0316
G1 X159.923 Y129.508 E.95211
G1 X160.8 Y129.508 E.0316
G1 X160.8 Y103.085 E.95212
G1 X161.473 Y103.085 E.02426
G1 X161.544 Y103.015 E.0036
; WIPE_START
G1 F24000
G1 X161.473 Y103.085 E-.03794
G1 X160.8 Y103.085 E-.2558
G1 X160.8 Y104.312 E-.46626
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.96 I1.037 J.636 P1  F30000
G1 X162.767 Y101.105 Z5.96
G1 Z5.56
G1 E.8 F1800
G1 F4800
G1 X162.767 Y100.678 E.01539
G1 X162.554 Y100.678 E.00766
G1 X162.554 Y129.508 E1.03885
G1 X161.677 Y129.508 E.0316
G1 X161.677 Y102.881 E.95947
G1 X161.789 Y102.77 E.00568
G1 X161.789 Y100.824 E.07013
G1 X161.677 Y100.678 E.0066
; WIPE_START
G1 F24000
G1 X161.789 Y100.824 E-.06961
G1 X161.789 Y102.64 E-.69039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.96 I.271 J-1.186 P1  F30000
G1 X154.712 Y101.022 Z5.96
G1 Z5.56
G1 E.8 F1800
G1 F4800
G3 X154.857 Y100.678 I.245 J-.099 E.01494
G1 X154.66 Y100.678 E.00708
G1 X154.66 Y130.058 E1.05866
G3 X154.135 Y131.211 I-16.697 J-6.906 E.04566
G1 X154.135 Y100.678 E1.1002
G1 X154.472 Y100.678 E.01212
; WIPE_START
G1 F24000
G1 X154.135 Y100.678 E-.12784
G1 X154.135 Y102.342 E-.63216
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.96 I.069 J-1.215 P1  F30000
G1 X125.028 Y100.678 Z5.96
G1 Z5.56
G1 E.8 F1800
G1 F4800
G1 X125.365 Y100.678 E.01212
G1 X125.365 Y131.211 E1.10019
G1 X125.119 Y130.699 E.02044
G3 X124.84 Y130.059 I6.642 J-3.277 E.0252
G1 X124.84 Y100.678 E1.05867
G1 X124.643 Y100.678 E.00708
G3 X124.789 Y101.022 I-.099 J.245 E.01494
; WIPE_START
G1 F24000
G1 X124.789 Y100.824 E-.07541
G1 X124.643 Y100.678 E-.07808
G1 X124.84 Y100.678 E-.07464
G1 X124.84 Y102.078 E-.53187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.96 I-1.159 J-.371 P1  F30000
G1 X124.538 Y103.02 Z5.96
G1 Z5.56
G1 E.8 F1800
G1 F4800
G1 X124.473 Y103.085 E.00331
G1 X123.963 Y103.085 E.01839
G1 X123.963 Y129.508 E.9521
G1 X123.086 Y129.508 E.0316
G1 X123.086 Y103.085 E.9521
G1 X122.208 Y103.085 E.0316
G1 X122.208 Y129.508 E.9521
G1 X121.331 Y129.508 E.0316
G1 X121.331 Y103.085 E.9521
G1 X120.454 Y103.085 E.0316
G1 X120.454 Y129.508 E.9521
G1 X119.577 Y129.508 E.0316
G1 X119.577 Y103.085 E.9521
G1 X118.7 Y103.085 E.0316
G1 X118.7 Y129.508 E.9521
G1 X117.823 Y129.508 E.0316
G1 X117.823 Y102.881 E.95945
G1 X117.712 Y102.77 E.00568
G1 X117.712 Y100.824 E.07013
G1 X117.823 Y100.678 E.0066
G1 X116.946 Y100.678 E.0316
G1 X116.946 Y129.508 E1.03883
G1 X116.733 Y129.508 E.00766
G1 X116.733 Y129.081 E.01539
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X116.733 Y129.508 E-.16227
G1 X116.946 Y129.508 E-.08079
G1 X116.946 Y128.148 E-.51695
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/63
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
G3 Z5.96 I-.414 J1.144 P1  F30000
G1 X123.851 Y130.649 Z5.96
M73 P76 R4
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X124.01 Y131.024 E.01352
G2 X128.411 Y136.946 I15.796 J-7.144 E.24663
G1 X115.448 Y136.946 E.42999
G3 X113.985 Y133.714 I28.509 J-14.855 E.11773
G3 X116.295 Y130.649 I2.308 J-.664 E.14752
G1 X123.791 Y130.649 E.24864
G1 X124.111 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X124.138 Y130.32 E.00212
G2 X129.517 Y137.338 I15.699 J-6.465 E.27487
G1 X115.22 Y137.338 E.43933
G1 X115.105 Y137.135 E.00717
G3 X113.609 Y133.826 I28.368 J-14.813 E.11164
G3 X116.29 Y130.257 I2.684 J-.775 E.15891
G1 X124.051 Y130.257 E.23845
M204 S10000
; WIPE_START
G1 F24000
G1 X124.138 Y130.32 E-.04085
G1 X124.367 Y130.863 E-.22387
G1 X124.714 Y131.586 E-.3048
G1 X124.952 Y132.027 E-.19048
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.287 J-1.183 P1  F30000
G1 X124.208 Y132.207 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X125.04 Y133.606 I15.834 J-8.459 E.054
G1 X122.568 Y136.078 E.11597
G1 X126.229 Y136.078 E.12144
G1 X121.147 Y130.997 E.23838
G1 X119.973 Y130.997 E.03894
G1 X115.235 Y135.735 E.22229
G1 X115.406 Y136.078 E.01272
G1 X118.553 Y136.078 E.10439
G1 X114.512 Y132.038 E.18956
G3 X115.765 Y131.069 I1.791 J1.021 E.05393
G1 X115.717 Y136.512 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F13696.009
G1 X127.259 Y136.512 E.43263
; WIPE_START
G1 F24000
G1 X125.259 Y136.512 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.197 J-.222 P1  F30000
G1 X118.852 Y101.945 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X118.912 Y101.945 E.1571
G1 X118.46 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X118.52 Y102.337 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X118.46 Y101.257 E-.41103
G1 X119.378 Y101.257 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.022 J1.217 P1  F30000
G1 X158.25 Y101.945 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.202 J.193 P1  F30000
G1 X160.865 Y130.649 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X163.24 Y130.65 E.07877
G3 X165.338 Y134.182 I-.039 J2.413 E.16307
G3 X164.052 Y136.946 I-26.431 J-10.627 E.10116
G1 X151.089 Y136.946 E.42998
G2 X155.649 Y130.649 I-11.499 J-13.126 E.26007
G1 X160.805 Y130.649 E.17104
G1 X160.865 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.245 Y130.257 E.07311
G3 X165.7 Y134.335 I-.044 J2.804 E.17462
G3 X164.28 Y137.338 I-24.987 J-9.977 E.10212
G1 X149.99 Y137.338 E.4391
G2 X155.389 Y130.257 I-10.222 J-13.394 E.27691
G1 X160.805 Y130.257 E.16642
M204 S10000
; WIPE_START
G1 F24000
G1 X162.805 Y130.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.805 J.913 P1  F30000
G1 X163.732 Y131.075 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X164.988 Y132.038 I-.501 J1.952 E.05395
G1 X160.947 Y136.078 E.18954
G1 X164.094 Y136.078 E.10439
G1 X164.265 Y135.735 E.01272
G1 X159.527 Y130.997 E.22227
G1 X158.353 Y130.997 E.03897
G1 X153.271 Y136.078 E.23837
G1 X156.933 Y136.078 E.12144
G1 X154.461 Y133.606 E.11597
G2 X155.292 Y132.207 I-15.003 J-9.858 E.054
G1 X152.188 Y136.512 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F13696.009
G1 X163.723 Y136.512 E.43238
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X161.723 Y136.512 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/63
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
G3 Z6 I.837 J-.883 P1  F30000
G1 X154.734 Y129.885 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F4800
G1 X154.753 Y129.84 E.00176
G3 X155.537 Y129.508 I.576 J.27 E.03363
G1 X155.537 Y103.085 E.95211
G1 X156.415 Y103.085 E.0316
G1 X156.415 Y129.508 E.95211
G1 X157.292 Y129.508 E.0316
G1 X157.292 Y103.085 E.95211
G1 X158.169 Y103.085 E.0316
G1 X158.169 Y129.508 E.95211
G1 X159.046 Y129.508 E.0316
G1 X159.046 Y103.085 E.95211
G1 X159.923 Y103.085 E.0316
G1 X159.923 Y129.508 E.95211
G1 X160.8 Y129.508 E.0316
G1 X160.8 Y103.085 E.95212
G1 X161.473 Y103.085 E.02426
G1 X161.544 Y103.015 E.0036
; WIPE_START
G1 F24000
G1 X161.473 Y103.085 E-.03794
G1 X160.8 Y103.085 E-.2558
G1 X160.8 Y104.312 E-.46626
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.037 J.636 P1  F30000
G1 X162.767 Y101.105 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G1 X162.767 Y100.678 E.01539
G1 X162.554 Y100.678 E.00766
G1 X162.554 Y129.508 E1.03885
G1 X161.677 Y129.508 E.0316
G1 X161.677 Y102.881 E.95947
G1 X161.789 Y102.77 E.00568
G1 X161.789 Y100.824 E.07013
G1 X161.677 Y100.678 E.0066
; WIPE_START
G1 F24000
G1 X161.789 Y100.824 E-.06961
G1 X161.789 Y102.64 E-.69039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.271 J-1.186 P1  F30000
G1 X154.712 Y101.022 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G3 X154.857 Y100.678 I.245 J-.099 E.01494
G1 X154.66 Y100.678 E.00708
G1 X154.66 Y130.058 E1.05866
G3 X154.135 Y131.211 I-16.87 J-6.984 E.04566
G1 X154.135 Y100.678 E1.10021
G1 X154.472 Y100.678 E.01212
; WIPE_START
G1 F24000
G1 X154.135 Y100.678 E-.12784
G1 X154.135 Y102.342 E-.63216
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.069 J-1.215 P1  F30000
G1 X125.028 Y100.678 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G1 X125.365 Y100.678 E.01212
G1 X125.365 Y131.211 E1.1002
G1 X125.155 Y130.775 E.01744
G3 X124.84 Y130.059 I7.419 J-3.696 E.0282
G1 X124.84 Y100.678 E1.05868
G1 X124.643 Y100.678 E.00708
G3 X124.789 Y101.022 I-.099 J.245 E.01494
; WIPE_START
G1 F24000
M73 P77 R4
G1 X124.789 Y100.824 E-.07541
G1 X124.643 Y100.678 E-.07808
G1 X124.84 Y100.678 E-.07464
G1 X124.84 Y102.078 E-.53187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.159 J-.371 P1  F30000
G1 X124.538 Y103.02 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G1 X124.473 Y103.085 E.00331
G1 X123.963 Y103.085 E.01839
G1 X123.963 Y129.508 E.9521
G1 X123.086 Y129.508 E.0316
G1 X123.086 Y103.085 E.9521
G1 X122.208 Y103.085 E.0316
G1 X122.208 Y129.508 E.9521
G1 X121.331 Y129.508 E.0316
G1 X121.331 Y103.085 E.9521
G1 X120.454 Y103.085 E.0316
G1 X120.454 Y129.508 E.9521
G1 X119.577 Y129.508 E.0316
G1 X119.577 Y103.085 E.9521
G1 X118.7 Y103.085 E.0316
G1 X118.7 Y129.508 E.9521
G1 X117.823 Y129.508 E.0316
G1 X117.823 Y102.881 E.95945
G1 X117.712 Y102.77 E.00568
G1 X117.712 Y100.824 E.07013
G1 X117.823 Y100.678 E.0066
G1 X116.946 Y100.678 E.0316
G1 X116.946 Y129.508 E1.03883
G1 X116.733 Y129.508 E.00766
G1 X116.733 Y129.081 E.01539
; WIPE_START
G1 F24000
G1 X116.733 Y129.508 E-.16227
G1 X116.946 Y129.508 E-.08079
G1 X116.946 Y128.148 E-.51695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.414 J1.144 P1  F30000
G1 X123.851 Y130.649 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X124.009 Y131.023 E.01347
G2 X128.19 Y136.746 I15.722 J-7.097 E.23679
G1 X115.348 Y136.746 E.426
G3 X114.716 Y135.476 I31.549 J-16.494 E.04706
G1 X114.054 Y133.917 E.05618
G3 X116.295 Y130.649 I2.243 J-.864 E.15453
G1 X123.791 Y130.649 E.24864
G1 X124.111 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X124.15 Y130.35 E.0031
G2 X129.257 Y137.138 I15.727 J-6.516 E.2638
G1 X115.106 Y137.138 E.4348
G3 X113.625 Y133.877 I24.728 J-13.203 E.11013
G3 X116.29 Y130.257 I2.667 J-.828 E.16056
G1 X124.051 Y130.257 E.23845
M204 S10000
; WIPE_START
G1 F24000
G1 X124.15 Y130.35 E-.05166
G1 X124.367 Y130.861 E-.21119
G1 X124.713 Y131.583 E-.30428
G1 X124.954 Y132.03 E-.19288
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.282 J-1.184 P1  F30000
G1 X124.208 Y132.207 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X125.04 Y133.606 I15.802 J-8.44 E.054
G1 X122.768 Y135.878 E.10658
G1 X126.029 Y135.878 E.10818
G1 X121.147 Y130.997 E.229
G1 X119.973 Y130.997 E.03894
G1 X115.235 Y135.736 E.2223
G1 X115.306 Y135.878 E.00529
G1 X118.353 Y135.878 E.10108
G1 X114.511 Y132.036 E.18024
G3 X115.765 Y131.069 I1.78 J1.011 E.05397
G1 X115.617 Y136.312 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F13696.068
G1 X127.052 Y136.312 E.42862
; WIPE_START
G1 F24000
G1 X125.052 Y136.312 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.198 J-.216 P1  F30000
G1 X118.852 Y101.945 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y101.945 E.00981
G1 X118.912 Y101.945 E.1571
G1 X118.46 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X118.52 Y102.337 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X118.46 Y101.257 E-.41103
G1 X119.378 Y101.257 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.022 J1.217 P1  F30000
G1 X158.25 Y101.945 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.201 J.194 P1  F30000
G1 X160.87 Y130.649 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X163.222 Y130.649 E.07802
G3 X165.446 Y133.918 I-.011 J2.398 E.15415
G3 X164.152 Y136.746 I-31.633 J-12.769 E.10319
G1 X151.328 Y136.746 E.4254
G2 X155.649 Y130.649 I-11.879 J-13 E.24979
G1 X160.81 Y130.649 E.17121
G1 X160.87 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.227 Y130.257 E.07242
G3 X165.812 Y134.058 I-.016 J2.791 E.16598
G3 X164.394 Y137.138 I-32.924 J-13.303 E.10421
G1 X150.243 Y137.138 E.43481
G2 X155.389 Y130.257 I-10.476 J-13.201 E.26698
G1 X160.81 Y130.257 E.16658
M204 S10000
; WIPE_START
G1 F24000
G1 X162.81 Y130.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.805 J.912 P1  F30000
G1 X163.733 Y131.071 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X164.991 Y132.035 I-.763 J2.298 E.05356
G1 X161.147 Y135.878 E.1803
G1 X164.195 Y135.878 E.10108
G1 X164.266 Y135.736 E.00529
G1 X159.527 Y130.997 E.22229
G1 X158.353 Y130.997 E.03896
G1 X153.471 Y135.878 E.22899
G1 X156.733 Y135.878 E.10818
G1 X154.461 Y133.606 E.10658
G2 X155.292 Y132.207 I-14.97 J-9.839 E.054
G1 X152.385 Y136.312 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F13696.009
G1 X163.823 Y136.312 E.42876
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X161.823 Y136.312 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/63
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
G3 Z6.2 I.18 J-1.204 P1  F30000
G1 X123.851 Y130.649 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2314
G1 X124.008 Y131.021 E.01343
G2 X127.957 Y136.546 I16.016 J-7.275 E.22666
G1 X115.248 Y136.546 E.42158
G3 X114.721 Y135.486 I26.321 J-13.756 E.03927
G1 X114.052 Y133.912 E.05671
G3 X116.295 Y130.649 I2.242 J-.862 E.15444
G1 X123.791 Y130.649 E.24864
G1 X124.111 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2314
G1 X124.162 Y130.379 E.00408
G2 X129.012 Y136.938 I15.539 J-6.417 E.25315
G1 X115.006 Y136.938 E.43034
G3 X114.363 Y135.647 I32.057 J-16.778 E.04431
G1 X113.687 Y134.057 E.0531
G3 X116.29 Y130.257 I2.607 J-1.005 E.16636
G1 X124.051 Y130.257 E.23845
M204 S10000
; WIPE_START
G1 F24000
G1 X124.162 Y130.379 E-.06297
G1 X124.366 Y130.86 E-.1985
G1 X124.712 Y131.581 E-.30375
G1 X124.955 Y132.032 E-.19478
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.278 J-1.185 P1  F30000
G1 X124.208 Y132.207 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2314
G2 X125.04 Y133.606 I15.772 J-8.423 E.054
G1 X122.968 Y135.678 E.0972
G1 X125.829 Y135.678 E.09491
G1 X121.147 Y130.997 E.21962
G1 X119.973 Y130.997 E.03894
G1 X115.292 Y135.678 E.21962
G1 X118.153 Y135.678 E.09491
G1 X114.512 Y132.038 E.17079
G3 X115.766 Y131.067 I1.84 J1.082 E.05388
G1 X115.517 Y136.112 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2314
G1 X126.86 Y136.112 E.4252
; WIPE_START
G1 F24000
G1 X124.86 Y136.112 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.199 J-.211 P1  F30000
G1 X118.852 Y101.945 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2314
G1 X118.852 Y101.649 E.00981
G1 X123.648 Y101.649 E.15909
M73 P78 R4
G1 X123.648 Y101.945 E.00981
G1 X118.912 Y101.945 E.1571
G1 X118.46 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2314
G1 X118.46 Y101.257 E.03319
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.337 E.03319
G1 X118.52 Y102.337 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X118.46 Y101.257 E-.41103
G1 X119.378 Y101.257 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.022 J1.217 P1  F30000
G1 X158.25 Y101.945 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2314
G1 X155.852 Y101.945 E.07954
G1 X155.852 Y101.649 E.00981
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y101.945 E.00981
G1 X158.31 Y101.945 E.07755
G1 X158.25 Y102.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2314
G1 X155.46 Y102.337 E.08573
G1 X155.46 Y101.257 E.03319
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.337 E.03319
G1 X158.31 Y102.337 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X156.31 Y102.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.201 J.194 P1  F30000
G1 X160.875 Y130.651 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2314
G1 X163.332 Y130.652 E.08148
G3 X165.446 Y133.918 I-.125 J2.399 E.15044
G3 X164.252 Y136.546 I-29.83 J-11.971 E.09577
G1 X151.534 Y136.546 E.42187
G2 X155.649 Y130.649 I-11.955 J-12.726 E.24025
G1 X160.815 Y130.651 E.17137
G1 X160.875 Y130.259 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2314
G1 X163.351 Y130.26 E.07607
G3 X165.812 Y134.059 I-.146 J2.791 E.16208
G3 X164.494 Y136.938 I-30.961 J-12.437 E.09734
G1 X150.492 Y136.938 E.43022
G2 X155.389 Y130.257 I-10.897 J-13.122 E.2571
G1 X160.815 Y130.259 E.16673
M204 S10000
; WIPE_START
G1 F24000
G1 X162.815 Y130.26 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.803 J.914 P1  F30000
G1 X163.734 Y131.067 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2314
G3 X164.991 Y132.035 I-.72 J2.234 E.05367
G1 X161.347 Y135.678 E.17092
G1 X164.209 Y135.678 E.09491
G1 X159.529 Y130.999 E.21954
G1 X158.352 Y130.998 E.03903
G1 X153.671 Y135.678 E.21957
G1 X156.533 Y135.678 E.09491
G1 X154.461 Y133.606 E.0972
G2 X155.292 Y132.207 I-14.941 J-9.822 E.054
G1 X152.576 Y136.112 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2314
G1 X163.924 Y136.112 E.42535
M106 S234.6
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X161.924 Y136.112 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/63
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
G3 Z6.4 I1.182 J-.291 P1  F30000
G1 X158.929 Y123.973 Z6.4
G1 Z6.2
G1 E.8 F1800
M204 S5000
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X158.706 Y124.045 E.00777
G3 X157.995 Y120.01 I-.456 J-2 E.22057
G1 X158.199 Y119.994 E.00679
G3 X159.093 Y123.916 I.051 J2.051 E.18666
G1 X158.986 Y123.953 E.00379
M106 S234.6
M204 S10000
G1 X158.778 Y123.618 F30000
M204 S5000
M106 S255
G1 F3000
G3 X158.044 Y120.399 I-.528 J-1.573 E.18388
G1 X158.209 Y120.387 E.00549
G3 X158.835 Y123.598 I.041 J1.659 E.15447
M106 S234.6
M204 S10000
; WIPE_START
G1 F24000
G1 X158.457 Y123.694 E-.1482
G1 X158.126 Y123.702 E-.12563
G1 X157.8 Y123.645 E-.12564
G1 X157.493 Y123.524 E-.12563
G1 X157.215 Y123.345 E-.12563
M73 P78 R3
G1 X157.009 Y123.144 E-.10926
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.203 J.184 P1  F30000
G1 X158.706 Y112.045 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
M106 S255
G1 F3000
G3 X157.995 Y108.01 I-.456 J-2 E.22058
G1 X158.199 Y107.994 E.00679
G3 X158.764 Y112.031 I.051 J2.051 E.19824
M106 S234.6
M204 S10000
G1 X158.619 Y111.663 F30000
M204 S5000
M106 S255
G1 F3000
G3 X158.044 Y108.399 I-.369 J-1.618 E.1784
G1 X158.209 Y108.387 E.00549
G3 X158.677 Y111.649 I.041 J1.659 E.15995
M106 S234.6
M204 S10000
; WIPE_START
G1 F24000
G1 X158.291 Y111.706 E-.1482
G1 X158.126 Y111.702 E-.0629
G1 X157.8 Y111.645 E-.12564
G1 X157.493 Y111.524 E-.12563
G1 X157.215 Y111.345 E-.12563
G1 X156.978 Y111.114 E-.12563
G1 X156.91 Y111.013 E-.04636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.195 J.228 P1  F30000
G1 X160.648 Y130.649 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X163.205 Y130.649 E.08482
G3 X165.446 Y133.918 I.006 J2.399 E.15473
G3 X164.352 Y136.346 I-28.122 J-11.212 E.08835
G1 X151.741 Y136.346 E.41834
G2 X155.852 Y130.144 I-12.032 J-12.44 E.24876
G1 X155.852 Y129.847 E.00987
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X155.852 Y102.747 E.89896
M106 S234.6
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X155.852 Y101.649 E.03642
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y102.747 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X160.648 Y129.847 E.89896
M106 S234.6
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X160.648 Y130.229 E.01269
G1 X160.648 Y130.589 E.01193
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.21 Y130.257 E.06667
G3 X165.812 Y134.058 I.001 J2.791 E.16652
G3 X164.594 Y136.738 I-29 J-11.571 E.09047
G1 X150.727 Y136.738 E.42608
G2 X155.46 Y130.089 I-11.125 J-12.928 E.25322
G1 X155.46 Y129.847 E.00745
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X155.46 Y102.747 E.89896
M106 S234.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.46 Y101.257 E.04578
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y102.747 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X161.04 Y129.847 E.89896
M106 S234.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X161.04 Y130.197 E.01075
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.297 J-1.18 P1  F30000
G1 X160.12 Y130.988 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.431179
M106 S255
G1 F3000
G1 X160.12 Y123.732 E.22956
G1 X160.012 Y123.641 E.00448
G3 X159.732 Y123.907 I-.799 J-.559 E.01231
G1 X159.732 Y130.818 E.21864
G1 X159.344 Y130.818 E.01228
G1 X159.344 Y124.16 E.21066
G1 X158.955 Y124.323 E.01332
G1 X158.955 Y130.818 E.2055
G1 X158.567 Y130.818 E.01228
G1 X158.567 Y124.411 E.2027
G1 X158.179 Y124.425 E.01229
G1 X158.179 Y130.818 E.20227
G1 X157.791 Y130.818 E.01228
G1 X157.791 Y124.378 E.20375
G3 X157.402 Y124.266 I.083 J-1.016 E.01287
G1 X157.402 Y130.818 E.20729
G1 X157.014 Y130.818 E.01228
M73 P79 R3
G1 X157.014 Y124.077 E.21329
G3 X156.626 Y123.781 I.537 J-1.108 E.01554
G1 X156.626 Y130.818 E.22263
G1 X156.238 Y130.818 E.01228
G1 X156.238 Y123.47 E.23248
M106 S234.6
G1 X156.297 Y123.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F15000
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111407
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148187
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161452
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.129186
G1 X156.078 Y122.734 E.00075
; WIPE_START
G1 F24000
G1 X156.096 Y122.839 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.217 J-.015 P1  F30000
G1 X156.079 Y121.362 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.119475
G1 F15000
G3 X156.149 Y120.947 I8.239 J1.192 E.00262
G1 X156.226 Y120.944 F30000
; LINE_WIDTH: 0.147271
G1 F15000
G1 X156.153 Y121.041 E.00103
; LINE_WIDTH: 0.181645
G1 X156.056 Y121.183 E.00195
G1 X156.226 Y120.944 F30000
; LINE_WIDTH: 0.111407
G1 F15000
G1 X156.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973919
G1 X156.358 Y120.778 E.00044
; WIPE_START
G1 F24000
G1 X156.294 Y120.854 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.011 J1.217 P1  F30000
G1 X160.171 Y120.82 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.122621
G1 F15000
G1 X160.269 Y120.947 E.00104
; LINE_WIDTH: 0.16333
G1 X160.336 Y121.039 E.00111
; LINE_WIDTH: 0.186686
G1 X160.444 Y121.201 E.00229
G1 X160.421 Y121.362 F30000
; LINE_WIDTH: 0.113041
G1 F15000
G2 X160.355 Y120.972 I-7.884 J1.138 E.00226
G1 X160.298 Y120.616 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452593
M106 S255
G1 F3000
G1 X160.298 Y111.759 E.29568
G1 X160.24 Y111.832 E.00315
G1 X160.012 Y111.641 E.00994
G1 X159.889 Y111.774 E.00604
G1 X159.889 Y120.321 E.28532
G2 X159.479 Y120.012 I-1.067 J.99 E.01721
G1 X159.479 Y112.089 E.26449
G1 X159.069 Y112.283 E.01514
G1 X159.069 Y119.816 E.25145
G2 X158.66 Y119.706 I-.476 J.959 E.01425
G1 X158.66 Y112.39 E.24424
G3 X158.25 Y112.423 I-.287 J-.997 E.01381
G1 X158.25 Y119.67 E.24192
G2 X157.84 Y119.703 I-.123 J1.03 E.01381
G1 X157.84 Y112.387 E.24424
G3 X157.431 Y112.277 I.066 J-1.068 E.01425
G1 X157.431 Y119.81 E.25146
G1 X157.021 Y120.004 E.01514
G1 X157.021 Y112.081 E.26449
G3 X156.611 Y111.767 I.572 J-1.17 E.01735
G1 X156.611 Y120.32 E.28551
G1 X156.488 Y120.452 E.00603
G1 X156.28 Y120.277 E.0091
G1 X156.202 Y120.365 E.00393
G1 X156.202 Y111.445 E.29777
M106 S234.6
G1 X156.297 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973908
G1 F15000
G1 X156.237 Y111.141 E.00044
; LINE_WIDTH: 0.1114
G1 X156.179 Y111.055 E.00058
; LINE_WIDTH: 0.14818
G3 X156.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161446
G1 X156.096 Y110.839 E.00103
; LINE_WIDTH: 0.129183
G1 X156.078 Y110.734 E.00075
; WIPE_START
G1 F24000
G1 X156.096 Y110.839 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.217 J-.015 P1  F30000
G1 X156.079 Y109.362 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.119477
G1 F15000
G3 X156.149 Y108.947 I8.253 J1.194 E.00262
G1 X156.226 Y108.944 F30000
; LINE_WIDTH: 0.111403
G1 F15000
G1 X156.294 Y108.854 E.00063
; LINE_WIDTH: 0.0973917
G1 X156.358 Y108.778 E.00044
G1 X156.226 Y108.944 F30000
; LINE_WIDTH: 0.147271
G1 F15000
G1 X156.153 Y109.041 E.00103
; LINE_WIDTH: 0.181646
G1 X156.056 Y109.183 E.00195
; WIPE_START
G1 F24000
G1 X156.153 Y109.041 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.05 J1.216 P1  F30000
G1 X160.203 Y108.874 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.126787
G1 F15000
G1 X160.321 Y109.038 E.00138
; LINE_WIDTH: 0.173118
G1 X160.379 Y109.124 E.0011
; LINE_WIDTH: 0.13607
G1 X160.404 Y109.255 E.00101
; LINE_WIDTH: 0.0969206
G1 X160.422 Y109.359 E.00047
G1 X160.299 Y108.617 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452595
M106 S255
G1 F3000
G1 X160.299 Y101.982 E.22151
G1 X159.889 Y101.982 E.01368
G1 X159.889 Y108.326 E.21179
G2 X159.479 Y108.012 I-.982 J.856 E.01735
G1 X159.479 Y101.982 E.20131
G1 X159.069 Y101.982 E.01368
G1 X159.069 Y107.816 E.19476
G2 X158.66 Y107.706 I-.476 J.958 E.01425
G1 X158.66 Y101.982 E.1911
G1 X158.25 Y101.982 E.01368
G1 X158.25 Y107.67 E.18989
G2 X157.84 Y107.703 I-.123 J1.03 E.01381
G1 X157.84 Y101.982 E.19099
G1 X157.431 Y101.982 E.01368
G1 X157.431 Y107.81 E.19455
G1 X157.021 Y108.004 E.01514
G1 X157.021 Y101.982 E.20104
G1 X156.611 Y101.982 E.01368
G1 X156.611 Y108.32 E.21157
G1 X156.488 Y108.452 E.00604
G1 X156.28 Y108.277 E.0091
G1 X156.202 Y108.365 E.00393
G1 X156.202 Y101.812 E.21876
M106 S234.6
; WIPE_START
G1 F24000
G1 X156.202 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.039 J.634 P1  F30000
G1 X160.421 Y110.731 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.119479
G1 F15000
G3 X160.351 Y111.146 I-8.237 J-1.191 E.00262
G1 X160.274 Y111.149 F30000
; LINE_WIDTH: 0.179234
G1 F15000
G1 X160.343 Y111.058 E.00126
; LINE_WIDTH: 0.195637
G1 X160.444 Y110.91 E.00224
G1 X160.274 Y111.149 F30000
; LINE_WIDTH: 0.129167
G1 F15000
G1 X160.142 Y111.315 E.00149
; WIPE_START
G1 F24000
G1 X160.274 Y111.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.217 J.015 P1  F30000
G1 X160.421 Y122.731 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.119481
G1 F15000
G3 X160.351 Y123.146 I-8.335 J-1.206 E.00262
G1 X160.274 Y123.149 F30000
; LINE_WIDTH: 0.179233
G1 F15000
G1 X160.343 Y123.058 E.00126
; LINE_WIDTH: 0.195641
G1 X160.444 Y122.91 E.00224
G1 X160.274 Y123.149 F30000
; LINE_WIDTH: 0.129168
G1 F15000
G1 X160.142 Y123.316 E.00149
; WIPE_START
G1 F24000
G1 X160.274 Y123.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.115 J.487 P1  F30000
G1 X163.735 Y131.068 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X164.986 Y132.04 I-.568 J2.021 E.05388
G1 X161.547 Y135.478 E.1613
G1 X164.009 Y135.478 E.08164
G1 X159.74 Y131.21 E.20024
G1 X158.14 Y131.21 E.05309
G1 X153.871 Y135.478 E.20024
G1 X156.333 Y135.478 E.08164
G1 X154.462 Y133.608 E.08777
G2 X155.292 Y132.208 I-15.736 J-10.272 E.05401
G1 X164.084 Y135.912 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502896
G1 F13696.366
G1 X152.827 Y135.912 E.42193
; WIPE_START
G1 F24000
G1 X154.827 Y135.912 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.4 J-1.149 P1  F30000
G1 X120.695 Y124.02 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G3 X120.995 Y120.01 I.555 J-1.975 E.18666
G1 X121.199 Y119.994 E.00679
G3 X120.753 Y124.036 I.051 J2.051 E.23215
M106 S234.6
M204 S10000
G1 X120.801 Y123.643 F30000
M204 S5000
M106 S255
G1 F3000
G3 X121.044 Y120.399 I.449 J-1.597 E.15096
G1 X121.209 Y120.387 E.00549
G3 X120.859 Y123.658 I.041 J1.659 E.18738
M106 S234.6
M204 S10000
; WIPE_START
G1 F24000
G1 X120.493 Y123.524 E-.14821
G1 X120.215 Y123.345 E-.12563
G1 X119.978 Y123.114 E-.12563
G1 X119.792 Y122.841 E-.12563
G1 X119.664 Y122.536 E-.12564
G1 X119.607 Y122.254 E-.10925
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.204 J.177 P1  F30000
G1 X121.097 Y112.091 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
M106 S255
G1 F3000
G3 X120.995 Y108.01 I.153 J-2.046 E.20023
G1 X121.199 Y107.994 E.00679
G3 X121.157 Y112.095 I.051 J2.051 E.21858
M106 S234.6
M204 S10000
G1 X121.126 Y111.7 F30000
M204 S5000
M106 S255
G1 F3000
G3 X121.044 Y108.399 I.124 J-1.655 E.16194
G1 X121.209 Y108.387 E.00549
G3 X121.186 Y111.704 I.041 J1.659 E.1764
M106 S234.6
M204 S10000
; WIPE_START
G1 F24000
G1 X120.8 Y111.645 E-.14825
G1 X120.493 Y111.524 E-.12563
G1 X120.215 Y111.345 E-.12563
G1 X119.978 Y111.114 E-.12563
G1 X119.792 Y110.841 E-.12564
G1 X119.68 Y110.576 E-.10922
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.216 J-.05 P1  F30000
G1 X118.852 Y130.649 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X118.852 Y129.847 E.02661
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X118.852 Y102.747 E.89896
M106 S234.6
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X118.852 Y101.649 E.03642
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y102.747 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X123.648 Y129.847 E.89896
M106 S234.6
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X123.648 Y130.144 E.00987
G2 X123.674 Y130.229 I.113 J.012 E.00302
G2 X127.759 Y136.346 I16.102 J-6.333 E.24587
G1 X115.148 Y136.346 E.41834
G3 X114.725 Y135.496 I21.108 J-11.027 E.03148
G1 X114.054 Y133.917 E.05692
G3 X116.295 Y130.649 I2.236 J-.869 E.15469
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y129.847 E.0126
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X118.46 Y102.747 E.89896
M106 S234.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y101.257 E.04578
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y102.747 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X124.04 Y129.847 E.89896
M106 S234.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X124.04 Y130.052 E.0063
G2 X124.094 Y130.216 I.356 J-.025 E.00535
G2 X128.773 Y136.738 I15.672 J-6.305 E.24903
G1 X114.906 Y136.738 E.42609
G3 X114.368 Y135.657 I26.844 J-14.047 E.03709
G1 X113.688 Y134.058 E.05339
G3 X116.29 Y130.257 I2.602 J-1.01 E.16651
M73 P80 R3
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.46 Y129.847 E-.15746
G1 X118.46 Y128.261 E-.60254
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.878 J-.843 P1  F30000
G1 X115.765 Y131.069 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X114.515 Y132.041 I.559 J2.009 E.05388
G1 X117.953 Y135.478 E.16127
G1 X115.492 Y135.478 E.08164
G1 X119.76 Y131.21 E.20024
G1 X121.36 Y131.21 E.05309
G1 X125.629 Y135.478 E.20024
G1 X123.168 Y135.478 E.08164
G1 X125.038 Y133.608 E.08777
G3 X124.209 Y132.208 I15.735 J-10.272 E.05401
G1 X123.263 Y130.988 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.431179
M106 S255
G1 F3000
G1 X123.263 Y123.803 E.2273
G1 X123.24 Y123.832 E.00117
G1 X123.012 Y123.641 E.00942
G1 X122.874 Y123.789 E.00638
G1 X122.874 Y130.818 E.22239
G1 X122.486 Y130.818 E.01228
G1 X122.486 Y124.084 E.21305
G1 X122.098 Y124.271 E.01363
G1 X122.098 Y130.818 E.20715
G1 X121.71 Y130.818 E.01228
G1 X121.71 Y124.379 E.20373
G3 X121.321 Y124.421 I-.3 J-.939 E.01244
G1 X121.321 Y130.818 E.20238
G1 X120.933 Y130.818 E.01228
G1 X120.933 Y124.403 E.20295
G1 X120.545 Y124.322 E.01255
G1 X120.545 Y130.818 E.20552
G1 X120.157 Y130.818 E.01228
G1 X120.157 Y124.169 E.21037
G1 X119.768 Y123.918 E.01462
G1 X119.768 Y130.818 E.21831
G1 X119.38 Y130.818 E.01228
G1 X119.38 Y123.362 E.2359
M106 S234.6
G1 X119.297 Y123.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F15000
G1 X119.237 Y123.141 E.00044
; LINE_WIDTH: 0.111409
G1 X119.179 Y123.055 E.00058
; LINE_WIDTH: 0.14819
G3 X119.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X119.096 Y122.839 E.00103
; LINE_WIDTH: 0.129188
G1 X119.078 Y122.734 E.00075
; WIPE_START
G1 F24000
G1 X119.096 Y122.839 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.216 J.034 P1  F30000
G1 X119.149 Y120.947 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.119479
G1 F15000
G2 X119.079 Y121.362 I8.249 J1.618 E.00262
G1 X119.056 Y121.183 F30000
; LINE_WIDTH: 0.181645
G1 F15000
G1 X119.153 Y121.041 E.00195
; LINE_WIDTH: 0.147271
G1 X119.226 Y120.944 E.00103
; LINE_WIDTH: 0.111407
G1 X119.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973919
G1 X119.358 Y120.778 E.00044
; WIPE_START
G1 F24000
G1 X119.294 Y120.854 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.656 J1.025 P1  F30000
G1 X123.142 Y123.315 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.129166
G1 F15000
G1 X123.274 Y123.149 E.00149
; LINE_WIDTH: 0.179228
G1 X123.343 Y123.058 E.00126
; LINE_WIDTH: 0.195637
G1 X123.444 Y122.91 E.00224
G1 X123.421 Y122.731 F30000
; LINE_WIDTH: 0.119477
G1 F15000
G3 X123.351 Y123.146 I-8.254 J-1.194 E.00262
; WIPE_START
G1 F24000
G1 X123.421 Y122.731 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.216 J-.046 P1  F30000
G1 X123.355 Y120.972 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.113042
G1 F15000
G3 X123.421 Y121.362 I-7.754 J1.518 E.00226
G1 X123.444 Y121.201 F30000
; LINE_WIDTH: 0.186684
G1 F15000
G1 X123.336 Y121.039 E.00229
; LINE_WIDTH: 0.163329
G1 X123.269 Y120.947 E.00111
; LINE_WIDTH: 0.122622
G1 X123.171 Y120.82 E.00104
G1 X123.298 Y120.62 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452593
M106 S255
G1 F3000
G1 X123.298 Y111.759 E.29582
G1 X123.24 Y111.832 E.00315
G1 X123.012 Y111.641 E.00994
G1 X122.889 Y111.774 E.00604
G1 X122.889 Y120.321 E.28532
G2 X122.479 Y120.012 I-1.067 J.99 E.01721
G1 X122.479 Y112.089 E.26449
G1 X122.069 Y112.283 E.01514
G1 X122.069 Y119.816 E.25145
G2 X121.66 Y119.706 I-.476 J.958 E.01425
G1 X121.66 Y112.39 E.24424
G3 X121.25 Y112.423 I-.287 J-.997 E.01381
G1 X121.25 Y119.67 E.24192
G2 X120.84 Y119.703 I-.123 J1.03 E.01381
G1 X120.84 Y112.387 E.24424
G3 X120.431 Y112.277 I.066 J-1.068 E.01425
G1 X120.431 Y119.81 E.25146
G1 X120.021 Y120.004 E.01514
G1 X120.021 Y112.081 E.26449
G3 X119.611 Y111.767 I.572 J-1.17 E.01735
G1 X119.611 Y120.32 E.28551
G1 X119.488 Y120.452 E.00603
G1 X119.28 Y120.277 E.0091
G1 X119.202 Y120.365 E.00393
G1 X119.202 Y111.445 E.29777
M106 S234.6
G1 X119.297 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973906
G1 F15000
G1 X119.237 Y111.141 E.00044
; LINE_WIDTH: 0.111399
G1 X119.179 Y111.055 E.00058
; LINE_WIDTH: 0.148177
G3 X119.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16145
G1 X119.096 Y110.839 E.00103
; LINE_WIDTH: 0.129185
G1 X119.078 Y110.734 E.00075
; WIPE_START
G1 F24000
G1 X119.096 Y110.839 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.216 J.034 P1  F30000
G1 X119.149 Y108.947 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.119481
G1 F15000
G2 X119.079 Y109.362 I8.263 J1.62 E.00262
G1 X119.056 Y109.183 F30000
; LINE_WIDTH: 0.181649
G1 F15000
G1 X119.153 Y109.041 E.00195
; LINE_WIDTH: 0.147272
G1 X119.226 Y108.944 E.00103
; LINE_WIDTH: 0.111404
G1 X119.294 Y108.854 E.00063
; LINE_WIDTH: 0.0973916
G1 X119.358 Y108.778 E.00044
; WIPE_START
G1 F24000
G1 X119.294 Y108.854 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.656 J1.025 P1  F30000
G1 X123.142 Y111.315 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.129165
G1 F15000
G1 X123.274 Y111.149 E.00149
; LINE_WIDTH: 0.17923
G1 X123.343 Y111.058 E.00126
; LINE_WIDTH: 0.195633
G1 X123.444 Y110.91 E.00224
G1 X123.421 Y110.731 F30000
; LINE_WIDTH: 0.119475
G1 F15000
G3 X123.351 Y111.146 I-8.241 J-1.192 E.00262
; WIPE_START
G1 F24000
G1 X123.421 Y110.731 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.217 J.001 P1  F30000
G1 X123.422 Y109.359 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.0969206
G1 F15000
G1 X123.404 Y109.255 E.00047
; LINE_WIDTH: 0.136068
G1 X123.379 Y109.124 E.00101
; LINE_WIDTH: 0.173115
G1 X123.321 Y109.038 E.0011
; LINE_WIDTH: 0.126785
G1 X123.203 Y108.874 E.00138
G1 X123.298 Y108.623 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452595
M106 S255
G1 F3000
G1 X123.298 Y101.982 E.22171
G1 X122.889 Y101.982 E.01368
G1 X122.889 Y108.326 E.21179
G2 X122.479 Y108.012 I-.982 J.856 E.01735
G1 X122.479 Y101.982 E.20131
G1 X122.069 Y101.982 E.01368
G1 X122.069 Y107.816 E.19476
G2 X121.66 Y107.706 I-.476 J.958 E.01425
G1 X121.66 Y101.982 E.1911
G1 X121.25 Y101.982 E.01368
G1 X121.25 Y107.67 E.18989
G2 X120.84 Y107.703 I-.123 J1.03 E.01381
G1 X120.84 Y101.982 E.19099
G1 X120.431 Y101.982 E.01368
G1 X120.431 Y107.81 E.19455
G1 X120.021 Y108.004 E.01514
G1 X120.021 Y101.982 E.20104
G1 X119.611 Y101.982 E.01368
G1 X119.611 Y108.32 E.21157
G1 X119.488 Y108.452 E.00604
G1 X119.28 Y108.277 E.0091
G1 X119.202 Y108.365 E.00393
G1 X119.202 Y101.812 E.21876
M106 S234.6
; WIPE_START
G1 F24000
G1 X119.202 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.209 J-.143 P1  F30000
G1 X115.416 Y135.912 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5029
G1 F13696.248
G1 X126.676 Y135.912 E.42203
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.676 Y135.912 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/63
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
G3 Z6.6 I.405 J1.147 P1  F30000
G1 X159.631 Y123.561 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9529
G1 X159.607 Y123.584 E.00111
G3 X157.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X158.199 Y119.994 E.00679
G3 X159.885 Y123.285 I.051 J2.051 E.15274
G1 X159.672 Y123.517 E.01045
G1 X159.339 Y123.298 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9529
G1 X159.079 Y123.483 E.0098
G3 X158.044 Y120.399 I-.829 J-1.437 E.18049
G1 X158.209 Y120.387 E.00509
G3 X159.383 Y123.257 I.041 J1.659 E.1231
M204 S10000
; WIPE_START
G1 F24000
G1 X159.079 Y123.483 E-.14382
G1 X158.779 Y123.62 E-.12557
G1 X158.457 Y123.694 E-.12564
G1 X158.126 Y123.702 E-.12563
G1 X157.8 Y123.645 E-.12564
G1 X157.522 Y123.535 E-.11371
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.201 J.198 P1  F30000
G1 X159.474 Y111.691 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9529
G1 X159.447 Y111.711 E.00111
G3 X157.995 Y108.01 I-1.197 J-1.666 E.24771
G1 X158.199 Y107.994 E.00679
G3 X159.753 Y111.441 I.051 J2.051 E.15952
G1 X159.518 Y111.651 E.01045
G1 X159.218 Y111.393 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9529
G3 X158.044 Y108.399 I-.968 J-1.347 E.18558
G1 X158.209 Y108.387 E.00508
G3 X159.266 Y111.357 I.041 J1.659 E.12783
M204 S10000
; WIPE_START
G1 F24000
G1 X158.933 Y111.56 E-.14822
G1 X158.62 Y111.665 E-.12563
G1 X158.291 Y111.706 E-.12563
G1 X158.126 Y111.702 E-.0629
G1 X157.8 Y111.645 E-.12564
G1 X157.493 Y111.524 E-.12563
G1 X157.39 Y111.458 E-.04635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.196 J.227 P1  F30000
G1 X161.04 Y130.649 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9529
G1 X163.205 Y130.649 E.07181
G3 X165.446 Y133.918 I.006 J2.399 E.15473
G3 X164.452 Y136.146 I-26.633 J-10.545 E.08094
G1 X151.95 Y136.146 E.41474
G2 X155.852 Y130.169 I-12.332 J-12.315 E.23847
G1 X155.852 Y101.649 E.94606
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.649 E.96198
G1 X160.98 Y130.649 E.01102
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9529
G1 X163.21 Y130.257 E.06667
G3 X165.812 Y134.058 I.001 J2.791 E.16652
G3 X164.694 Y136.538 I-27.06 J-10.713 E.0836
G1 X150.958 Y136.538 E.42208
M73 P81 R3
G2 X155.46 Y130.089 I-11.282 J-12.673 E.24388
G1 X155.46 Y101.257 E.88594
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.928 J.787 P1  F30000
G1 X163.734 Y131.071 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9529
G3 X164.985 Y132.041 I-.549 J1.999 E.05386
G1 X161.747 Y135.278 E.15187
G1 X163.809 Y135.278 E.06837
G1 X160.255 Y131.725 E.16671
G1 X157.625 Y131.725 E.08724
G1 X154.071 Y135.278 E.16671
G1 X156.133 Y135.278 E.06837
G1 X154.46 Y133.606 E.07844
G2 X155.292 Y132.207 I-14.863 J-9.775 E.054
G1 X155.771 Y131.333 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.416443
G1 F9529
G1 X159.775 Y131.333 E.12189
G2 X160.989 Y131.354 I.941 J-19.091 E.03696
G1 X161.348 Y131.023 E.01485
G1 X160.444 Y131.019 E.02749
G1 X160.256 Y130.852 E.00767
G1 X160.256 Y123.79 E.21496
G1 X160.137 Y123.816 E.0037
G1 X160.017 Y123.722 E.00466
G1 X159.854 Y123.892 E.00717
G1 X159.456 Y124.173 E.01482
G1 X159.011 Y124.37 E.01482
G1 X158.535 Y124.475 E.01482
G1 X158.049 Y124.483 E.01482
G1 X157.57 Y124.395 E.01482
G1 X157.118 Y124.214 E.01482
G1 X156.704 Y123.94 E.0151
G1 X156.412 Y123.624 E.01309
G1 X156.316 Y123.696 E.00364
G1 X156.244 Y123.682 E.00223
G1 X156.244 Y130.21 E.1987
G1 X156.228 Y130.285 E.00235
G1 X155.795 Y131.278 E.03297
G1 X158.096 Y126.334 F30000
; LINE_WIDTH: 0.351907
G1 F9529
G1 X158.096 Y129.481 E.07924
G1 X158.405 Y129.481 E.00778
G1 X158.405 Y126.33 E.07935
G1 X158.156 Y126.333 E.00627
G1 X157.753 Y125.997 F30000
; LINE_WIDTH: 0.419999
G1 F9529
G1 X157.753 Y129.824 E.1176
G1 X158.748 Y129.824 E.03058
G1 X158.748 Y125.961 E.11872
G3 X157.813 Y125.997 I-.852 J-10.062 E.02876
G1 X157.375 Y125.51 F30000
G1 F9529
G1 X157.375 Y130.202 E.14417
G1 X159.125 Y130.202 E.05375
G1 X159.125 Y125.505 E.14432
G1 X158.564 Y125.606 E.01752
G1 X157.852 Y125.597 E.02186
G1 X157.434 Y125.521 E.01305
G1 X156.998 Y124.981 F30000
G1 F9529
G1 X156.998 Y130.21 E.16067
G1 X156.921 Y130.579 E.01158
G1 X159.502 Y130.579 E.07929
G1 X159.502 Y124.98 E.17202
G1 X159.179 Y125.105 E.01064
G1 X158.554 Y125.229 E.01956
G1 X157.918 Y125.226 E.01956
G1 X157.294 Y125.097 E.01956
G1 X157.054 Y125.003 E.00792
G1 X156.621 Y124.342 F30000
G1 F9529
G1 X156.621 Y130.21 E.18031
G1 X156.574 Y130.436 E.00711
G1 X156.347 Y130.956 E.01742
G1 X159.982 Y130.956 E.1117
G1 X159.879 Y130.852 E.0045
G1 X159.879 Y124.339 E.20014
G1 X159.611 Y124.517 E.00988
G1 X159.095 Y124.738 E.01726
G1 X158.545 Y124.852 E.01726
G1 X157.983 Y124.855 E.01726
G1 X157.432 Y124.746 E.01726
G1 X156.913 Y124.531 E.01726
G1 X156.672 Y124.374 E.00884
G1 X156.297 Y123.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973918
G1 F9529
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111406
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148191
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161452
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.129186
G1 X156.078 Y122.734 E.00075
G1 X156.079 Y121.362 F30000
; LINE_WIDTH: 0.119464
G1 F9529
G3 X156.149 Y120.947 I8.332 J1.206 E.00262
G1 X156.226 Y120.944 F30000
; LINE_WIDTH: 0.147281
G1 F9529
G1 X156.153 Y121.041 E.00103
; LINE_WIDTH: 0.181653
G1 X156.056 Y121.183 E.00195
G1 X156.226 Y120.944 F30000
; LINE_WIDTH: 0.111417
G1 F9529
G1 X156.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973916
G1 X156.358 Y120.778 E.00044
G1 X158.096 Y117.763 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9529
G1 X158.405 Y117.759 E.00778
G1 X158.405 Y114.33 E.08633
G1 X158.096 Y114.334 E.00778
G1 X158.096 Y117.703 E.08482
G1 X157.753 Y118.132 F30000
; LINE_WIDTH: 0.419999
G1 F9529
G3 X158.748 Y118.096 I.892 J10.723 E.03061
G1 X158.748 Y113.961 E.12705
G3 X157.753 Y113.997 I-.891 J-10.705 E.03061
G1 X157.753 Y118.072 E.12521
G1 X157.375 Y118.589 F30000
G1 F9529
G1 X157.936 Y118.487 E.01752
G1 X158.648 Y118.496 E.02186
G1 X159.125 Y118.583 E.01489
G1 X159.125 Y113.505 E.15606
G1 X158.564 Y113.606 E.01752
G1 X157.852 Y113.597 E.02186
G1 X157.375 Y113.51 E.01489
G1 X157.375 Y118.529 E.15421
G1 X156.998 Y119.113 F30000
G1 F9529
G1 X157.321 Y118.988 E.01064
G1 X157.946 Y118.864 E.01956
G1 X158.582 Y118.867 E.01956
G1 X159.206 Y118.996 E.01956
G1 X159.502 Y119.112 E.00977
G1 X159.502 Y112.98 E.18842
G1 X159.179 Y113.106 E.01064
G1 X158.554 Y113.229 E.01956
G1 X157.918 Y113.226 E.01956
G1 X157.294 Y113.097 E.01956
G1 X156.998 Y112.981 E.00977
G1 X156.998 Y119.053 E.18657
G1 X156.621 Y119.755 F30000
G1 F9529
G1 X156.889 Y119.576 E.00988
G1 X157.405 Y119.355 E.01726
G1 X157.955 Y119.241 E.01726
G1 X158.517 Y119.238 E.01726
G1 X159.068 Y119.347 E.01726
G1 X159.587 Y119.563 E.01726
G1 X159.879 Y119.751 E.01068
G1 X159.879 Y112.339 E.22777
G1 X159.611 Y112.517 E.00988
G1 X159.095 Y112.738 E.01726
G1 X158.545 Y112.852 E.01726
G1 X157.983 Y112.855 E.01726
G1 X157.432 Y112.746 E.01726
G1 X156.913 Y112.531 E.01726
G1 X156.621 Y112.342 E.01068
G1 X156.621 Y119.695 E.22593
G1 X156.244 Y120.305 F30000
G1 F9529
G1 X156.371 Y120.287 E.00392
G1 X156.483 Y120.371 E.00433
G1 X156.646 Y120.201 E.00724
G1 X157.044 Y119.92 E.01496
G1 X157.489 Y119.723 E.01496
G1 X157.965 Y119.618 E.01496
G1 X158.452 Y119.61 E.01496
G1 X158.93 Y119.698 E.01496
G1 X159.382 Y119.879 E.01496
G1 X159.796 Y120.154 E.01525
G1 X160.088 Y120.469 E.01321
G1 X160.191 Y120.391 E.00395
G1 X160.256 Y120.403 E.00203
G1 X160.256 Y111.79 E.26465
G1 X160.137 Y111.816 E.00373
G1 X160.017 Y111.722 E.0047
G1 X159.854 Y111.892 E.00724
G1 X159.456 Y112.173 E.01496
G1 X159.011 Y112.37 E.01496
G1 X158.535 Y112.475 E.01496
G1 X158.049 Y112.483 E.01496
G1 X157.57 Y112.395 E.01496
G1 X157.118 Y112.214 E.01496
G1 X156.704 Y111.94 E.01525
G1 X156.412 Y111.624 E.01321
G1 X156.316 Y111.696 E.00367
G1 X156.244 Y111.682 E.00225
G1 X156.244 Y120.245 E.26313
G1 X160.203 Y120.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126788
G1 F9529
G1 X160.321 Y121.038 E.00138
; LINE_WIDTH: 0.173121
G1 X160.379 Y121.124 E.0011
; LINE_WIDTH: 0.136072
G1 X160.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969206
G1 X160.422 Y121.359 E.00047
G1 X160.421 Y122.731 F30000
; LINE_WIDTH: 0.119483
G1 F9529
G3 X160.351 Y123.146 I-8.333 J-1.206 E.00262
G1 X160.274 Y123.149 F30000
; LINE_WIDTH: 0.179242
G1 F9529
G1 X160.343 Y123.058 E.00126
; LINE_WIDTH: 0.195644
G1 X160.444 Y122.91 E.00224
G1 X160.274 Y123.149 F30000
; LINE_WIDTH: 0.129172
G1 F9529
G1 X160.142 Y123.316 E.00149
G1 X160.142 Y111.315 F30000
; LINE_WIDTH: 0.129171
G1 F9529
G1 X160.274 Y111.149 E.00149
; LINE_WIDTH: 0.17924
G1 X160.343 Y111.058 E.00126
; LINE_WIDTH: 0.195637
G1 X160.444 Y110.91 E.00224
G1 X160.421 Y110.731 F30000
; LINE_WIDTH: 0.119476
G1 F9529
G3 X160.351 Y111.146 I-8.32 J-1.204 E.00262
G1 X160.422 Y109.359 F30000
; LINE_WIDTH: 0.0969206
G1 F9529
G1 X160.404 Y109.255 E.00047
; LINE_WIDTH: 0.136069
G1 X160.379 Y109.124 E.00101
; LINE_WIDTH: 0.173116
G1 X160.321 Y109.038 E.0011
; LINE_WIDTH: 0.126785
G1 X160.203 Y108.874 E.00138
G1 X158.096 Y105.763 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9529
G1 X158.405 Y105.759 E.00778
G1 X158.405 Y103.892 E.04701
G1 X158.096 Y103.892 E.00778
G1 X158.096 Y105.703 E.0456
G1 X157.753 Y106.132 F30000
; LINE_WIDTH: 0.419999
G1 F9529
G3 X158.748 Y106.096 I.891 J10.705 E.03061
G1 X158.748 Y103.549 E.07825
G1 X157.753 Y103.549 E.03058
G1 X157.753 Y106.072 E.07753
G1 X157.375 Y106.589 F30000
G1 F9529
G1 X157.937 Y106.487 E.01752
G1 X158.648 Y106.496 E.02186
G1 X159.125 Y106.583 E.01489
G1 X159.125 Y103.172 E.10482
G1 X157.375 Y103.172 E.05375
G1 X157.375 Y106.529 E.10314
G1 X156.998 Y107.113 F30000
G1 F9529
G1 X157.321 Y106.988 E.01064
G1 X157.946 Y106.864 E.01956
G1 X158.582 Y106.867 E.01956
G1 X159.206 Y106.996 E.01956
G1 X159.502 Y107.112 E.00977
G1 X159.502 Y102.795 E.13266
G1 X156.998 Y102.795 E.07692
G1 X156.998 Y107.053 E.13084
G1 X156.621 Y107.755 F30000
G1 F9529
G1 X156.889 Y107.576 E.00988
G1 X157.405 Y107.355 E.01726
G1 X157.955 Y107.241 E.01726
G1 X158.517 Y107.238 E.01726
G1 X159.068 Y107.347 E.01726
G1 X159.587 Y107.563 E.01726
G1 X159.879 Y107.751 E.01068
G1 X159.879 Y102.418 E.16388
G1 X156.621 Y102.418 E.10009
G1 X156.621 Y107.695 E.16214
G1 X156.244 Y108.305 F30000
G1 F9529
G1 X156.371 Y108.287 E.00392
G1 X156.483 Y108.371 E.00433
G1 X156.646 Y108.201 E.00724
G1 X157.044 Y107.92 E.01496
G1 X157.489 Y107.723 E.01496
G1 X157.965 Y107.618 E.01496
G1 X158.452 Y107.61 E.01496
G1 X158.93 Y107.698 E.01496
G1 X159.382 Y107.879 E.01496
G1 X159.796 Y108.154 E.01525
G1 X160.088 Y108.469 E.01321
G1 X160.191 Y108.391 E.00395
G1 X160.256 Y108.403 E.00203
G1 X160.256 Y102.041 E.19549
G1 X156.244 Y102.041 E.12327
G1 X156.244 Y108.245 E.19065
G1 X156.358 Y108.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973919
G1 F9529
G1 X156.294 Y108.854 E.00044
; LINE_WIDTH: 0.111408
G1 X156.226 Y108.944 E.00063
; LINE_WIDTH: 0.147271
G1 X156.153 Y109.041 E.00103
; LINE_WIDTH: 0.181642
G1 X156.056 Y109.183 E.00195
G1 X156.079 Y109.362 F30000
; LINE_WIDTH: 0.119473
G1 F9529
G3 X156.149 Y108.947 I8.248 J1.193 E.00262
G1 X156.078 Y110.734 F30000
; LINE_WIDTH: 0.129185
G1 F9529
G1 X156.096 Y110.839 E.00075
; LINE_WIDTH: 0.16145
G1 X156.115 Y110.943 E.00103
; LINE_WIDTH: 0.148189
G2 X156.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111409
G1 X156.237 Y111.141 E.00058
; LINE_WIDTH: 0.0973915
G1 X156.297 Y111.22 E.00044
; WIPE_START
G1 F24000
G1 X156.237 Y111.141 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.206 J-.161 P1  F30000
G1 X152.95 Y135.712 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F9529
G1 X164.124 Y135.712 E.41884
; WIPE_START
G1 F24000
G1 X162.124 Y135.712 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.358 J-1.163 P1  F30000
G1 X122.631 Y123.561 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9529
G1 X122.607 Y123.584 E.00111
G3 X120.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X121.199 Y119.994 E.00679
G3 X122.885 Y123.285 I.051 J2.051 E.15274
G1 X122.672 Y123.517 E.01045
G1 X122.339 Y123.298 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9529
G1 X122.079 Y123.483 E.0098
G3 X121.044 Y120.399 I-.829 J-1.437 E.18049
G1 X121.209 Y120.387 E.00509
G3 X122.383 Y123.257 I.041 J1.659 E.1231
M204 S10000
; WIPE_START
G1 F24000
G1 X122.079 Y123.483 E-.14382
G1 X121.779 Y123.62 E-.12557
G1 X121.457 Y123.694 E-.12564
G1 X121.126 Y123.702 E-.12563
G1 X120.8 Y123.645 E-.12564
G1 X120.522 Y123.535 E-.11371
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.208 J.144 P1  F30000
G1 X122.334 Y108.307 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9529
G1 X122.364 Y108.322 E.00111
G3 X120.995 Y108.01 I-1.114 J1.723 E.38006
G1 X121.199 Y107.994 E.00679
G3 X122 Y108.136 I.051 J2.051 E.02717
G1 X122.281 Y108.28 E.01046
G1 X122.151 Y108.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9529
G3 X121.044 Y108.399 I-.901 J1.393 E.28473
G1 X121.209 Y108.387 E.00508
G3 X122.1 Y108.621 I.041 J1.659 E.02869
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14826
G1 X122.622 Y109.111 E-.12564
G1 X122.78 Y109.402 E-.12563
G1 X122.877 Y109.718 E-.12563
G1 X122.909 Y109.977 E-.0991
G1 X122.892 Y110.294 E-.12081
G1 X122.882 Y110.332 E-.01493
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.194 J-.237 P1  F30000
G1 X118.852 Y130.649 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9529
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.169 E.94606
G2 X127.559 Y136.146 I16.279 J-6.383 E.23861
G1 X115.048 Y136.146 E.41501
G3 X114.73 Y135.506 I15.888 J-8.294 E.02369
G1 X114.052 Y133.912 E.05746
G3 X116.295 Y130.649 I2.242 J-.862 E.15443
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9529
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88594
G2 X128.543 Y136.538 I15.781 J-6.223 E.24388
G1 X114.806 Y136.538 E.42209
G3 X114.373 Y135.667 I21.62 J-11.312 E.02988
G1 X113.687 Y134.056 E.05379
G3 X116.29 Y130.257 I2.607 J-1.005 E.16635
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.887 J-.833 P1  F30000
G1 X115.765 Y131.069 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9529
G2 X114.515 Y132.041 I.52 J1.96 E.05396
G1 X117.753 Y135.278 E.1519
G1 X115.692 Y135.278 E.06837
G1 X119.245 Y131.725 E.16671
G1 X121.875 Y131.725 E.08724
G1 X125.429 Y135.278 E.16671
G1 X123.368 Y135.278 E.06837
G1 X125.04 Y133.606 E.07844
G3 X124.209 Y132.207 I14.864 J-9.775 E.054
G1 X123.723 Y131.333 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415764
G1 F9529
G1 X123.271 Y130.283 E.03472
G1 X123.256 Y129.327 E.02906
G1 X123.256 Y123.79 E.16823
G1 X123.137 Y123.816 E.00369
G1 X123.017 Y123.722 E.00465
G1 X122.854 Y123.892 E.00716
G1 X122.456 Y124.173 E.01479
G1 X122.011 Y124.37 E.01479
G1 X121.535 Y124.475 E.01479
G1 X121.049 Y124.483 E.01479
G1 X120.57 Y124.395 E.01479
G1 X120.118 Y124.214 E.01479
G1 X119.704 Y123.94 E.01508
G1 X119.412 Y123.624 E.01306
G1 X119.316 Y123.696 E.00363
G1 X119.244 Y123.682 E.00223
G1 X119.244 Y130.852 E.21785
G1 X119.056 Y131.019 E.00766
G1 X118.154 Y131.019 E.0274
G1 X118.483 Y131.343 E.01402
G2 X123.663 Y131.333 I1.099 J-781.512 E.15737
G1 X121.405 Y126.33 F30000
; LINE_WIDTH: 0.351907
G1 F9529
G1 X121.096 Y126.334 E.00778
G1 X121.096 Y129.481 E.07924
G1 X121.405 Y129.481 E.00778
G1 X121.405 Y126.39 E.07783
G1 X121.748 Y125.961 F30000
; LINE_WIDTH: 0.419999
G1 F9529
G3 X120.753 Y125.997 I-.891 J-10.71 E.03061
G1 X120.753 Y129.824 E.1176
G1 X121.748 Y129.824 E.03058
G1 X121.748 Y126.021 E.11687
G1 X122.125 Y125.505 F30000
G1 F9529
G1 X121.564 Y125.606 E.01752
G1 X120.852 Y125.597 E.02186
G1 X120.375 Y125.51 E.01489
G1 X120.375 Y130.202 E.14417
G1 X122.125 Y130.202 E.05375
G1 X122.125 Y125.565 E.14248
G1 X122.502 Y124.98 F30000
G1 F9529
G1 X122.179 Y125.105 E.01064
G1 X121.554 Y125.229 E.01956
G1 X120.918 Y125.226 E.01956
G1 X120.294 Y125.097 E.01956
G1 X119.998 Y124.981 E.00977
G1 X119.998 Y130.579 E.172
G2 X122.575 Y130.577 I1.067 J-429.676 E.07917
G1 X122.502 Y130.21 E.01151
G1 X122.502 Y125.04 E.15885
G1 X122.879 Y124.339 F30000
G1 F9529
G1 X122.611 Y124.517 E.00988
G1 X122.095 Y124.738 E.01726
G1 X121.545 Y124.852 E.01726
G1 X120.983 Y124.855 E.01726
G1 X120.432 Y124.746 E.01726
G1 X119.913 Y124.531 E.01726
G1 X119.621 Y124.342 E.01068
G1 X119.621 Y130.852 E.20004
G1 X119.534 Y130.956 E.00415
G1 X123.146 Y130.956 E.11096
G1 X122.923 Y130.43 E.01754
G1 X122.879 Y130.21 E.0069
G1 X122.879 Y124.399 E.17856
G1 X123.142 Y123.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129171
G1 F9529
G1 X123.274 Y123.149 E.00149
; LINE_WIDTH: 0.179238
G1 X123.343 Y123.058 E.00126
; LINE_WIDTH: 0.195637
G1 X123.444 Y122.91 E.00224
G1 X123.421 Y122.731 F30000
; LINE_WIDTH: 0.119479
G1 F9529
G3 X123.351 Y123.146 I-8.337 J-1.207 E.00262
G1 X123.422 Y121.359 F30000
; LINE_WIDTH: 0.0969206
G1 F9529
G1 X123.404 Y121.255 E.00047
; LINE_WIDTH: 0.13607
G1 X123.379 Y121.124 E.00101
; LINE_WIDTH: 0.173118
G1 X123.321 Y121.038 E.0011
; LINE_WIDTH: 0.126786
G1 X123.203 Y120.874 E.00138
G1 X123.256 Y120.403 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9529
G1 X123.256 Y111.79 E.26465
G1 X123.137 Y111.816 E.00373
G1 X123.017 Y111.722 E.0047
G1 X122.854 Y111.892 E.00724
G1 X122.456 Y112.173 E.01496
G1 X122.011 Y112.37 E.01496
G1 X121.535 Y112.475 E.01496
G1 X121.049 Y112.483 E.01496
G1 X120.57 Y112.395 E.01496
G1 X120.118 Y112.214 E.01496
G1 X119.704 Y111.94 E.01525
G1 X119.412 Y111.624 E.01321
G1 X119.316 Y111.696 E.00367
G1 X119.244 Y111.682 E.00225
G1 X119.244 Y120.305 E.26498
G1 X119.371 Y120.287 E.00392
G1 X119.483 Y120.371 E.00433
G1 X119.646 Y120.201 E.00724
G1 X120.044 Y119.92 E.01496
G1 X120.489 Y119.723 E.01496
G1 X120.965 Y119.618 E.01496
G1 X121.452 Y119.61 E.01496
G1 X121.93 Y119.698 E.01496
G1 X122.382 Y119.879 E.01496
G1 X122.796 Y120.154 E.01525
G1 X123.088 Y120.469 E.01321
G1 X123.197 Y120.392 E.00409
G1 X122.879 Y119.751 F30000
G1 F9529
G1 X122.879 Y112.339 E.22777
G1 X122.611 Y112.517 E.00988
G1 X122.095 Y112.738 E.01726
G1 X121.545 Y112.852 E.01726
M73 P82 R3
G1 X120.983 Y112.855 E.01726
G1 X120.432 Y112.746 E.01726
G1 X119.913 Y112.531 E.01726
G1 X119.621 Y112.342 E.01068
G1 X119.621 Y119.755 E.22777
G1 X119.889 Y119.576 E.00988
G1 X120.405 Y119.355 E.01726
G1 X120.955 Y119.241 E.01726
G1 X121.517 Y119.238 E.01726
G1 X122.068 Y119.347 E.01726
G1 X122.587 Y119.563 E.01726
G1 X122.828 Y119.719 E.00884
G1 X122.502 Y119.112 F30000
G1 F9529
G1 X122.502 Y112.98 E.18842
G1 X122.179 Y113.106 E.01064
G1 X121.554 Y113.229 E.01956
G1 X120.918 Y113.226 E.01956
G1 X120.294 Y113.097 E.01956
G1 X119.998 Y112.981 E.00977
G1 X119.998 Y119.113 E.18842
G1 X120.321 Y118.988 E.01064
G1 X120.946 Y118.864 E.01956
G1 X121.582 Y118.867 E.01956
G1 X122.206 Y118.996 E.01956
G1 X122.446 Y119.09 E.00792
G1 X122.125 Y118.583 F30000
G1 F9529
G1 X122.125 Y113.505 E.15606
G1 X121.564 Y113.606 E.01752
G1 X120.852 Y113.597 E.02186
G1 X120.375 Y113.51 E.01489
G1 X120.375 Y118.589 E.15606
G1 X120.936 Y118.487 E.01752
G1 X121.648 Y118.496 E.02186
G1 X122.066 Y118.573 E.01305
G1 X121.748 Y118.096 F30000
G1 F9529
G1 X121.748 Y113.961 E.12705
G3 X120.753 Y113.997 I-.891 J-10.706 E.03061
G1 X120.753 Y118.132 E.12705
G3 X121.688 Y118.097 I.853 J10.075 E.02876
G1 X121.405 Y117.759 F30000
; LINE_WIDTH: 0.351907
G1 F9529
G1 X121.405 Y114.33 E.08633
G1 X121.096 Y114.334 E.00778
G1 X121.096 Y117.763 E.08633
G1 X121.345 Y117.76 E.00627
G1 X119.358 Y120.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F9529
G1 X119.294 Y120.854 E.00044
; LINE_WIDTH: 0.111417
G1 X119.226 Y120.944 E.00063
; LINE_WIDTH: 0.147282
G1 X119.153 Y121.041 E.00103
; LINE_WIDTH: 0.181655
G1 X119.056 Y121.183 E.00195
G1 X119.079 Y121.362 F30000
; LINE_WIDTH: 0.119468
G1 F9529
G3 X119.149 Y120.947 I8.326 J1.205 E.00262
G1 X119.078 Y122.734 F30000
; LINE_WIDTH: 0.129188
G1 F9529
G1 X119.096 Y122.839 E.00075
; LINE_WIDTH: 0.161456
G1 X119.115 Y122.943 E.00103
; LINE_WIDTH: 0.148195
G2 X119.179 Y123.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.11141
G1 X119.237 Y123.141 E.00058
; LINE_WIDTH: 0.0973921
G1 X119.297 Y123.22 E.00044
G1 X119.297 Y111.22 F30000
; LINE_WIDTH: 0.0973914
G1 F9529
G1 X119.237 Y111.141 E.00044
; LINE_WIDTH: 0.111407
G1 X119.179 Y111.055 E.00058
; LINE_WIDTH: 0.148186
G3 X119.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X119.096 Y110.839 E.00103
; LINE_WIDTH: 0.129188
G1 X119.078 Y110.734 E.00075
G1 X119.079 Y109.362 F30000
; LINE_WIDTH: 0.119477
G1 F9529
G3 X119.149 Y108.947 I8.259 J1.194 E.00262
G1 X119.226 Y108.944 F30000
; LINE_WIDTH: 0.11141
G1 F9529
G1 X119.294 Y108.854 E.00063
; LINE_WIDTH: 0.0973921
G1 X119.358 Y108.778 E.00044
G1 X119.226 Y108.944 F30000
; LINE_WIDTH: 0.147273
G1 F9529
G1 X119.153 Y109.041 E.00103
; LINE_WIDTH: 0.181645
G1 X119.056 Y109.183 E.00195
; WIPE_START
G1 F24000
G1 X119.153 Y109.041 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.05 J1.216 P1  F30000
G1 X123.203 Y108.874 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.126784
G1 F9529
G1 X123.321 Y109.038 E.00138
; LINE_WIDTH: 0.173115
G1 X123.379 Y109.124 E.0011
; LINE_WIDTH: 0.136068
G1 X123.404 Y109.255 E.00101
; LINE_WIDTH: 0.0969206
G1 X123.422 Y109.359 E.00047
G1 X123.256 Y108.403 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9529
G1 X123.256 Y102.041 E.19549
G1 X119.244 Y102.041 E.12327
G1 X119.244 Y108.305 E.19249
G1 X119.371 Y108.287 E.00392
G1 X119.483 Y108.371 E.00433
G1 X119.646 Y108.201 E.00724
G1 X120.044 Y107.92 E.01496
G1 X120.489 Y107.723 E.01496
G1 X120.965 Y107.618 E.01496
G1 X121.452 Y107.61 E.01496
G1 X121.93 Y107.698 E.01496
G1 X122.382 Y107.879 E.01496
G1 X122.796 Y108.154 E.01525
G1 X123.088 Y108.469 E.01321
G1 X123.197 Y108.392 E.00409
G1 X122.879 Y107.751 F30000
G1 F9529
G1 X122.879 Y102.418 E.16388
G1 X119.621 Y102.418 E.10009
G1 X119.621 Y107.755 E.16398
G1 X119.889 Y107.576 E.00988
G1 X120.405 Y107.355 E.01726
G1 X120.955 Y107.241 E.01726
G1 X121.517 Y107.238 E.01726
G1 X122.068 Y107.347 E.01726
G1 X122.587 Y107.563 E.01726
G1 X122.828 Y107.719 E.00884
G1 X122.502 Y107.112 F30000
G1 F9529
G1 X122.502 Y102.795 E.13266
G1 X119.998 Y102.795 E.07692
G1 X119.998 Y107.113 E.13268
G1 X120.321 Y106.988 E.01064
G1 X120.946 Y106.864 E.01956
G1 X121.582 Y106.867 E.01956
G1 X122.206 Y106.996 E.01956
G1 X122.446 Y107.09 E.00792
G1 X122.125 Y106.583 F30000
G1 F9529
G1 X122.125 Y103.172 E.10482
G1 X120.375 Y103.172 E.05375
G1 X120.375 Y106.589 E.10498
G1 X120.937 Y106.487 E.01752
G1 X121.648 Y106.496 E.02186
G1 X122.066 Y106.573 E.01305
G1 X121.748 Y106.096 F30000
G1 F9529
G1 X121.748 Y103.549 E.07825
G1 X120.753 Y103.549 E.03058
G1 X120.753 Y106.132 E.07937
G3 X121.688 Y106.097 I.852 J10.056 E.02876
G1 X121.405 Y105.759 F30000
; LINE_WIDTH: 0.351907
G1 F9529
G1 X121.405 Y103.892 E.04701
G1 X121.096 Y103.892 E.00778
G1 X121.096 Y105.763 E.04711
G1 X121.345 Y105.76 E.00627
G1 X123.421 Y110.731 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119472
G1 F9529
G3 X123.351 Y111.146 I-8.31 J-1.202 E.00262
G1 X123.274 Y111.149 F30000
; LINE_WIDTH: 0.179238
G1 F9529
G1 X123.343 Y111.058 E.00126
; LINE_WIDTH: 0.195634
G1 X123.444 Y110.91 E.00224
G1 X123.274 Y111.149 F30000
; LINE_WIDTH: 0.12917
G1 F9529
G1 X123.142 Y111.315 E.00149
; WIPE_START
G1 F24000
G1 X123.274 Y111.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.158 J-.375 P1  F30000
G1 X115.316 Y135.712 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F9529
G1 X126.493 Y135.712 E.41892
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.493 Y135.712 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/63
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
G3 Z6.8 I.398 J1.15 P1  F30000
G1 X159.631 Y123.561 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9473
G1 X159.607 Y123.584 E.00111
G3 X157.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X158.199 Y119.994 E.00679
G3 X159.885 Y123.285 I.051 J2.051 E.15274
G1 X159.672 Y123.517 E.01045
G1 X159.357 Y123.282 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9473
G1 X159.347 Y123.29 E.00039
G3 X158.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X158.209 Y120.387 E.00509
G3 X159.572 Y123.048 I.041 J1.659 E.11443
G1 X159.398 Y123.238 E.00792
M204 S10000
; WIPE_START
G1 F24000
G1 X159.347 Y123.29 E-.02755
G1 X159.08 Y123.484 E-.12556
G1 X158.779 Y123.62 E-.12564
G1 X158.457 Y123.694 E-.12563
G1 X158.126 Y123.702 E-.12563
G1 X157.8 Y123.645 E-.12565
G1 X157.545 Y123.544 E-.10434
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.202 J.191 P1  F30000
G1 X159.419 Y111.73 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9473
G1 X159.093 Y111.915 E.01244
G3 X157.995 Y108.01 I-.843 J-1.87 E.23415
G1 X158.199 Y107.994 E.00679
G3 X159.468 Y111.696 I.051 J2.051 E.17221
G1 X159.218 Y111.393 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9473
G3 X158.044 Y108.399 I-.968 J-1.347 E.18558
G1 X158.209 Y108.387 E.00509
G3 X159.266 Y111.357 I.041 J1.659 E.12783
M204 S10000
; WIPE_START
G1 F24000
G1 X158.933 Y111.56 E-.14821
G1 X158.62 Y111.665 E-.12563
G1 X158.291 Y111.706 E-.12563
G1 X157.962 Y111.682 E-.12564
G1 X157.644 Y111.592 E-.12563
G1 X157.388 Y111.461 E-.10925
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.195 J.228 P1  F30000
G1 X161.04 Y130.649 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9473
G1 X163.205 Y130.649 E.07181
G3 X165.446 Y133.918 I.006 J2.399 E.15472
G3 X164.551 Y135.946 I-30.479 J-12.241 E.07354
G1 X152.153 Y135.946 E.41128
G2 X155.852 Y130.169 I-12.819 J-12.282 E.22899
G1 X155.852 Y101.649 E.94606
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.649 E.96198
G1 X160.98 Y130.649 E.01102
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9473
G1 X163.21 Y130.257 E.06667
G3 X165.812 Y134.058 I.001 J2.791 E.16652
G3 X164.794 Y136.338 I-29.444 J-11.79 E.07673
G1 X151.179 Y136.338 E.41834
G2 X155.46 Y130.089 I-11.518 J-12.481 E.23471
G1 X155.46 Y101.257 E.88594
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.928 J.787 P1  F30000
G1 X163.734 Y131.071 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9473
G3 X164.985 Y132.041 I-.55 J2 E.05386
G1 X161.947 Y135.078 E.14248
G1 X163.609 Y135.078 E.0551
G1 X160.255 Y131.725 E.15732
G1 X157.625 Y131.725 E.08724
G1 X154.271 Y135.078 E.15732
G1 X155.933 Y135.078 E.0551
G1 X154.46 Y133.606 E.06906
G2 X155.292 Y132.207 I-14.84 J-9.761 E.054
G1 X155.771 Y131.333 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.416443
G1 F9473
G1 X159.775 Y131.333 E.12189
G2 X160.989 Y131.354 I.941 J-19.091 E.03696
G1 X161.348 Y131.023 E.01485
G1 X160.444 Y131.019 E.02749
G1 X160.256 Y130.852 E.00767
G1 X160.256 Y123.79 E.21496
G1 X160.137 Y123.816 E.0037
G1 X160.017 Y123.722 E.00466
G1 X159.854 Y123.892 E.00717
G1 X159.456 Y124.173 E.01482
G1 X159.011 Y124.37 E.01482
G1 X158.535 Y124.475 E.01482
G1 X158.049 Y124.483 E.01482
G1 X157.57 Y124.395 E.01482
G1 X157.118 Y124.214 E.01482
G1 X156.704 Y123.94 E.0151
G1 X156.412 Y123.624 E.01309
G1 X156.316 Y123.696 E.00364
G1 X156.244 Y123.682 E.00223
G1 X156.244 Y130.21 E.1987
G1 X156.228 Y130.285 E.00235
G1 X155.795 Y131.278 E.03297
G1 X158.096 Y126.334 F30000
; LINE_WIDTH: 0.351907
G1 F9473
G1 X158.096 Y129.481 E.07924
G1 X158.405 Y129.481 E.00778
G1 X158.405 Y126.33 E.07935
G1 X158.156 Y126.333 E.00627
G1 X157.753 Y125.997 F30000
; LINE_WIDTH: 0.419999
G1 F9473
G1 X157.753 Y129.824 E.11759
G1 X158.748 Y129.824 E.03058
G1 X158.748 Y125.961 E.11872
G3 X157.813 Y125.997 I-.853 J-10.079 E.02876
G1 X157.375 Y125.51 F30000
G1 F9473
G1 X157.375 Y130.202 E.14417
G1 X159.125 Y130.202 E.05375
G1 X159.125 Y125.505 E.14432
G1 X158.564 Y125.606 E.01752
G1 X157.852 Y125.597 E.02186
G1 X157.434 Y125.521 E.01305
G1 X156.998 Y124.981 F30000
G1 F9473
G1 X156.998 Y130.21 E.16067
G1 X156.921 Y130.579 E.01158
G1 X159.502 Y130.579 E.07929
G1 X159.502 Y124.98 E.17202
G1 X159.179 Y125.106 E.01064
G1 X158.554 Y125.229 E.01956
G1 X157.918 Y125.226 E.01956
G1 X157.294 Y125.097 E.01956
G1 X157.054 Y125.003 E.00792
G1 X156.621 Y124.342 F30000
G1 F9473
G1 X156.621 Y130.21 E.1803
G1 X156.574 Y130.436 E.00711
G1 X156.347 Y130.956 E.01742
G1 X159.982 Y130.956 E.1117
G1 X159.879 Y130.852 E.0045
G1 X159.879 Y124.339 E.20014
G1 X159.611 Y124.517 E.00988
G1 X159.095 Y124.738 E.01726
G1 X158.545 Y124.852 E.01726
G1 X157.983 Y124.855 E.01726
G1 X157.432 Y124.746 E.01726
G1 X156.913 Y124.531 E.01726
G1 X156.672 Y124.374 E.00884
G1 X156.297 Y123.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.097392
G1 F9473
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111413
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148194
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161452
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.129187
G1 X156.078 Y122.734 E.00075
G1 X156.079 Y121.362 F30000
; LINE_WIDTH: 0.119461
G1 F9473
G3 X156.149 Y120.947 I8.317 J1.203 E.00262
G1 X156.226 Y120.944 F30000
; LINE_WIDTH: 0.111409
G1 F9473
G1 X156.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973915
G1 X156.358 Y120.778 E.00044
G1 X156.226 Y120.944 F30000
; LINE_WIDTH: 0.147274
G1 F9473
G1 X156.153 Y121.041 E.00103
; LINE_WIDTH: 0.181648
G1 X156.056 Y121.183 E.00195
G1 X158.096 Y117.763 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9473
G1 X158.405 Y117.759 E.00778
G1 X158.405 Y114.33 E.08633
G1 X158.096 Y114.334 E.00778
G1 X158.096 Y117.703 E.08482
G1 X157.753 Y118.132 F30000
; LINE_WIDTH: 0.419999
G1 F9473
G3 X158.748 Y118.096 I.892 J10.732 E.03061
G1 X158.748 Y113.961 E.12705
G3 X157.753 Y113.997 I-.892 J-10.726 E.03061
G1 X157.753 Y118.072 E.12521
G1 X157.375 Y118.589 F30000
G1 F9473
G1 X157.936 Y118.487 E.01752
G1 X158.648 Y118.496 E.02186
G1 X159.125 Y118.583 E.01489
G1 X159.125 Y113.505 E.15606
G1 X158.564 Y113.606 E.01752
G1 X157.852 Y113.597 E.02186
G1 X157.375 Y113.51 E.01489
G1 X157.375 Y118.529 E.15421
G1 X156.998 Y119.113 F30000
G1 F9473
G1 X157.321 Y118.988 E.01064
G1 X157.946 Y118.864 E.01956
G1 X158.582 Y118.867 E.01956
G1 X159.206 Y118.996 E.01956
G1 X159.502 Y119.112 E.00977
G1 X159.502 Y112.98 E.18842
G1 X159.179 Y113.105 E.01064
G1 X158.554 Y113.229 E.01956
G1 X157.918 Y113.226 E.01956
G1 X157.294 Y113.097 E.01956
G1 X156.998 Y112.981 E.00977
G1 X156.998 Y119.053 E.18657
G1 X156.621 Y119.755 F30000
G1 F9473
G1 X156.889 Y119.576 E.00988
G1 X157.405 Y119.355 E.01726
G1 X157.955 Y119.241 E.01726
G1 X158.517 Y119.238 E.01726
G1 X159.068 Y119.347 E.01726
G1 X159.587 Y119.563 E.01726
G1 X159.879 Y119.751 E.01068
G1 X159.879 Y112.339 E.22777
G1 X159.611 Y112.517 E.00988
G1 X159.095 Y112.738 E.01726
G1 X158.545 Y112.852 E.01726
G1 X157.983 Y112.855 E.01726
G1 X157.432 Y112.746 E.01726
G1 X156.913 Y112.531 E.01726
G1 X156.621 Y112.342 E.01068
G1 X156.621 Y119.695 E.22593
G1 X156.244 Y120.316 F30000
G1 F9473
G1 X156.371 Y120.287 E.00399
G1 X156.483 Y120.371 E.00433
G1 X156.646 Y120.201 E.00724
G1 X157.044 Y119.92 E.01496
G1 X157.489 Y119.723 E.01496
G1 X157.965 Y119.618 E.01496
G1 X158.451 Y119.61 E.01496
G1 X158.93 Y119.698 E.01496
G1 X159.382 Y119.879 E.01496
G1 X159.796 Y120.154 E.01525
G1 X160.088 Y120.469 E.01321
G1 X160.191 Y120.391 E.00395
G1 X160.256 Y120.403 E.00203
G1 X160.256 Y111.79 E.26466
G1 X160.137 Y111.816 E.00373
G1 X160.017 Y111.722 E.0047
G1 X159.854 Y111.892 E.00724
G1 X159.456 Y112.173 E.01496
G1 X159.011 Y112.37 E.01496
G1 X158.535 Y112.475 E.01496
G1 X158.049 Y112.483 E.01496
G1 X157.57 Y112.395 E.01496
G1 X157.118 Y112.214 E.01496
G1 X156.704 Y111.94 E.01525
G1 X156.412 Y111.624 E.01321
G1 X156.316 Y111.696 E.00367
G1 X156.244 Y111.682 E.00225
G1 X156.244 Y120.256 E.26347
G1 X160.203 Y120.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126787
G1 F9473
G1 X160.321 Y121.038 E.00138
; LINE_WIDTH: 0.173118
G1 X160.379 Y121.124 E.0011
; LINE_WIDTH: 0.13607
G1 X160.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969205
G1 X160.422 Y121.359 E.00047
G1 X160.421 Y122.731 F30000
; LINE_WIDTH: 0.119479
G1 F9473
G3 X160.351 Y123.146 I-8.333 J-1.206 E.00262
G1 X160.274 Y123.149 F30000
; LINE_WIDTH: 0.179227
G1 F9473
G1 X160.343 Y123.058 E.00126
; LINE_WIDTH: 0.195637
G1 X160.444 Y122.91 E.00224
G1 X160.274 Y123.149 F30000
; LINE_WIDTH: 0.129165
G1 F9473
G1 X160.142 Y123.315 E.00149
G1 X160.142 Y111.315 F30000
; LINE_WIDTH: 0.129163
G1 F9473
G1 X160.274 Y111.149 E.00149
; LINE_WIDTH: 0.179224
G1 X160.343 Y111.058 E.00126
; LINE_WIDTH: 0.195633
G1 X160.444 Y110.91 E.00224
G1 X160.421 Y110.731 F30000
; LINE_WIDTH: 0.11948
G1 F9473
G3 X160.351 Y111.146 I-8.306 J-1.202 E.00262
G1 X160.422 Y109.359 F30000
; LINE_WIDTH: 0.0969202
G1 F9473
G1 X160.404 Y109.255 E.00047
; LINE_WIDTH: 0.136066
G1 X160.379 Y109.124 E.00101
; LINE_WIDTH: 0.173112
G1 X160.321 Y109.038 E.0011
; LINE_WIDTH: 0.126782
G1 X160.203 Y108.874 E.00138
G1 X158.096 Y105.763 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9473
G1 X158.405 Y105.759 E.00778
G1 X158.405 Y103.892 E.04701
G1 X158.096 Y103.892 E.00778
G1 X158.096 Y105.703 E.0456
G1 X157.753 Y106.132 F30000
; LINE_WIDTH: 0.419999
G1 F9473
G3 X158.748 Y106.096 I.891 J10.712 E.03061
G1 X158.748 Y103.549 E.07825
G1 X157.753 Y103.549 E.03058
G1 X157.753 Y106.072 E.07753
G1 X157.375 Y106.589 F30000
G1 F9473
G1 X157.936 Y106.487 E.01752
G1 X158.648 Y106.496 E.02186
G1 X159.125 Y106.583 E.01489
G1 X159.125 Y103.172 E.10482
G1 X157.375 Y103.172 E.05375
G1 X157.375 Y106.529 E.10314
G1 X156.998 Y107.113 F30000
G1 F9473
G1 X157.321 Y106.988 E.01064
G1 X157.946 Y106.864 E.01956
G1 X158.582 Y106.867 E.01956
G1 X159.206 Y106.996 E.01956
G1 X159.502 Y107.112 E.00977
G1 X159.502 Y102.795 E.13266
G1 X156.998 Y102.795 E.07692
G1 X156.998 Y107.053 E.13084
G1 X156.621 Y107.755 F30000
G1 F9473
G1 X156.889 Y107.576 E.00988
G1 X157.405 Y107.355 E.01726
G1 X157.955 Y107.241 E.01726
G1 X158.517 Y107.238 E.01726
G1 X159.068 Y107.347 E.01726
G1 X159.587 Y107.563 E.01726
G1 X159.879 Y107.751 E.01068
G1 X159.879 Y102.418 E.16388
G1 X156.621 Y102.418 E.10009
G1 X156.621 Y107.695 E.16214
G1 X156.244 Y108.305 F30000
G1 F9473
G1 X156.371 Y108.287 E.00392
G1 X156.483 Y108.371 E.00433
G1 X156.646 Y108.201 E.00724
G1 X157.044 Y107.92 E.01496
G1 X157.489 Y107.723 E.01496
G1 X157.965 Y107.618 E.01496
G1 X158.452 Y107.61 E.01496
G1 X158.93 Y107.698 E.01496
G1 X159.382 Y107.879 E.01496
G1 X159.796 Y108.154 E.01525
G1 X160.088 Y108.469 E.01321
G1 X160.191 Y108.391 E.00395
G1 X160.256 Y108.403 E.00203
G1 X160.256 Y102.041 E.19549
G1 X156.244 Y102.041 E.12327
G1 X156.244 Y108.245 E.19065
G1 X156.358 Y108.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.097391
G1 F9473
G1 X156.294 Y108.854 E.00044
; LINE_WIDTH: 0.111405
G1 X156.226 Y108.944 E.00063
; LINE_WIDTH: 0.147263
G1 X156.153 Y109.041 E.00103
; LINE_WIDTH: 0.18163
G1 X156.056 Y109.183 E.00195
G1 X156.079 Y109.362 F30000
; LINE_WIDTH: 0.11947
G1 F9473
G3 X156.149 Y108.947 I8.336 J1.206 E.00262
G1 X156.078 Y110.734 F30000
; LINE_WIDTH: 0.129187
G1 F9473
G1 X156.096 Y110.839 E.00075
; LINE_WIDTH: 0.161454
G1 X156.115 Y110.943 E.00103
; LINE_WIDTH: 0.14818
G2 X156.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111403
G1 X156.237 Y111.141 E.00058
; LINE_WIDTH: 0.0973909
G1 X156.297 Y111.22 E.00044
; WIPE_START
G1 F24000
G1 X156.237 Y111.141 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.207 J-.154 P1  F30000
G1 X153.129 Y135.512 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F9473
G1 X164.223 Y135.512 E.41583
; WIPE_START
G1 F24000
G1 X162.223 Y135.512 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.352 J-1.165 P1  F30000
G1 X122.631 Y123.561 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9473
G1 X122.607 Y123.584 E.00111
G3 X120.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X121.199 Y119.994 E.00679
G3 X122.885 Y123.285 I.051 J2.051 E.15274
G1 X122.672 Y123.517 E.01045
G1 X122.357 Y123.282 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9473
G1 X122.347 Y123.29 E.00039
G3 X121.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X121.209 Y120.387 E.00509
G3 X122.572 Y123.048 I.041 J1.659 E.11443
G1 X122.398 Y123.238 E.00792
M204 S10000
; WIPE_START
G1 F24000
G1 X122.347 Y123.29 E-.02755
G1 X122.08 Y123.484 E-.12556
G1 X121.779 Y123.62 E-.12564
G1 X121.457 Y123.694 E-.12563
G1 X121.126 Y123.702 E-.12563
G1 X120.8 Y123.645 E-.12565
G1 X120.545 Y123.544 E-.10434
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.208 J.147 P1  F30000
G1 X122.39 Y108.343 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9473
G1 X122.683 Y108.577 E.01245
G3 X120.995 Y108.01 I-1.433 J1.468 E.36648
G1 X121.199 Y107.994 E.00679
G3 X122.341 Y108.308 I.051 J2.051 E.03987
G1 X122.151 Y108.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9473
G3 X121.044 Y108.399 I-.901 J1.393 E.28473
G1 X121.209 Y108.387 E.00509
G3 X122.1 Y108.621 I.041 J1.659 E.02869
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14826
G1 X122.622 Y109.111 E-.12564
G1 X122.78 Y109.402 E-.12563
G1 X122.877 Y109.718 E-.12563
G1 X122.909 Y109.982 E-.101
G1 X122.892 Y110.294 E-.11892
G1 X122.882 Y110.332 E-.01492
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.194 J-.237 P1  F30000
G1 X118.852 Y130.649 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9473
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.169 E.94606
G2 X127.346 Y135.946 I16.542 J-6.517 E.22897
G1 X114.949 Y135.946 E.41123
G1 X114.733 Y135.512 E.01609
G1 X114.052 Y133.912 E.05767
G3 X116.295 Y130.649 I2.242 J-.861 E.15443
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9473
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88594
G2 X128.324 Y136.338 I15.757 J-6.21 E.23477
G1 X114.706 Y136.338 E.41843
G1 X114.376 Y135.676 E.02272
G1 X113.687 Y134.056 E.05408
G3 X116.29 Y130.257 I2.607 J-1.005 E.16635
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.889 J-.832 P1  F30000
G1 X115.767 Y131.075 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P83 R3
G1 F9473
G2 X114.515 Y132.041 I.528 J1.978 E.05385
G1 X117.553 Y135.078 E.1425
G1 X115.892 Y135.078 E.0551
G1 X119.245 Y131.725 E.15732
G1 X121.875 Y131.725 E.08724
G1 X125.229 Y135.078 E.15732
G1 X123.568 Y135.078 E.0551
G1 X125.04 Y133.606 E.06906
G3 X124.209 Y132.207 I14.84 J-9.762 E.054
G1 X123.723 Y131.333 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415764
G1 F9473
G1 X123.271 Y130.283 E.03472
G1 X123.256 Y129.327 E.02906
G1 X123.256 Y123.79 E.16823
G1 X123.137 Y123.816 E.00369
G1 X123.017 Y123.722 E.00465
G1 X122.854 Y123.892 E.00716
G1 X122.456 Y124.173 E.01479
G1 X122.011 Y124.37 E.01479
G1 X121.535 Y124.475 E.01479
G1 X121.049 Y124.483 E.01479
G1 X120.57 Y124.395 E.01479
G1 X120.118 Y124.214 E.01479
G1 X119.704 Y123.94 E.01508
G1 X119.412 Y123.624 E.01306
G1 X119.316 Y123.696 E.00363
G1 X119.244 Y123.682 E.00223
G1 X119.244 Y130.852 E.21785
G1 X119.056 Y131.019 E.00766
G1 X118.154 Y131.019 E.0274
G1 X118.483 Y131.343 E.01402
G2 X123.663 Y131.333 I1.099 J-781.514 E.15737
G1 X121.405 Y126.33 F30000
; LINE_WIDTH: 0.351907
G1 F9473
G1 X121.096 Y126.334 E.00778
G1 X121.096 Y129.481 E.07924
G1 X121.405 Y129.481 E.00778
G1 X121.405 Y126.39 E.07783
G1 X121.748 Y125.961 F30000
; LINE_WIDTH: 0.419999
G1 F9473
G3 X120.753 Y125.997 I-.892 J-10.728 E.03061
G1 X120.753 Y129.824 E.11759
G1 X121.748 Y129.824 E.03058
G1 X121.748 Y126.021 E.11687
G1 X122.125 Y125.505 F30000
G1 F9473
G1 X121.564 Y125.606 E.01752
G1 X120.852 Y125.597 E.02186
G1 X120.375 Y125.51 E.01489
G1 X120.375 Y130.202 E.14417
G1 X122.125 Y130.202 E.05375
G1 X122.125 Y125.565 E.14248
G1 X122.502 Y124.98 F30000
G1 F9473
G1 X122.179 Y125.106 E.01064
G1 X121.554 Y125.229 E.01956
G1 X120.918 Y125.226 E.01956
G1 X120.294 Y125.097 E.01956
G1 X119.998 Y124.981 E.00977
G1 X119.998 Y130.579 E.172
G2 X122.575 Y130.577 I1.067 J-416.738 E.07917
G1 X122.502 Y130.21 E.01151
G1 X122.502 Y125.04 E.15885
G1 X122.879 Y124.339 F30000
G1 F9473
G1 X122.611 Y124.517 E.00988
G1 X122.095 Y124.738 E.01726
G1 X121.545 Y124.852 E.01726
G1 X120.983 Y124.855 E.01726
G1 X120.432 Y124.746 E.01726
G1 X119.913 Y124.531 E.01726
G1 X119.621 Y124.342 E.01068
G1 X119.621 Y130.852 E.20004
G1 X119.534 Y130.956 E.00415
G1 X123.146 Y130.956 E.11096
G1 X122.923 Y130.43 E.01754
G1 X122.879 Y130.21 E.0069
G1 X122.879 Y124.399 E.17856
G1 X123.142 Y123.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F9473
G1 X123.274 Y123.149 E.00149
; LINE_WIDTH: 0.179225
G1 X123.343 Y123.058 E.00126
; LINE_WIDTH: 0.195634
G1 X123.444 Y122.91 E.00224
G1 X123.421 Y122.731 F30000
; LINE_WIDTH: 0.119475
G1 F9473
G3 X123.351 Y123.146 I-8.322 J-1.204 E.00262
G1 X123.422 Y121.359 F30000
; LINE_WIDTH: 0.0969205
G1 F9473
G1 X123.404 Y121.255 E.00047
; LINE_WIDTH: 0.136068
G1 X123.379 Y121.124 E.00101
; LINE_WIDTH: 0.173113
G1 X123.321 Y121.038 E.0011
; LINE_WIDTH: 0.126785
G1 X123.203 Y120.874 E.00138
G1 X123.256 Y120.403 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9473
G1 X123.256 Y111.79 E.26466
G1 X123.137 Y111.816 E.00373
G1 X123.017 Y111.722 E.0047
G1 X122.854 Y111.892 E.00724
G1 X122.456 Y112.173 E.01496
G1 X122.011 Y112.37 E.01496
G1 X121.535 Y112.475 E.01496
G1 X121.049 Y112.483 E.01496
G1 X120.57 Y112.395 E.01496
G1 X120.118 Y112.214 E.01496
G1 X119.704 Y111.94 E.01525
G1 X119.412 Y111.624 E.01321
G1 X119.316 Y111.696 E.00367
G1 X119.244 Y111.682 E.00225
G1 X119.244 Y120.305 E.26498
G1 X119.371 Y120.287 E.00393
G1 X119.483 Y120.371 E.00433
G1 X119.646 Y120.201 E.00724
G1 X120.044 Y119.92 E.01496
G1 X120.489 Y119.723 E.01496
G1 X120.965 Y119.618 E.01496
G1 X121.451 Y119.61 E.01496
G1 X121.93 Y119.698 E.01496
G1 X122.382 Y119.879 E.01496
G1 X122.796 Y120.154 E.01525
G1 X123.088 Y120.469 E.01321
G1 X123.197 Y120.392 E.00409
G1 X122.879 Y119.751 F30000
G1 F9473
G1 X122.879 Y112.339 E.22777
G1 X122.611 Y112.517 E.00988
G1 X122.095 Y112.738 E.01726
G1 X121.545 Y112.852 E.01726
G1 X120.983 Y112.855 E.01726
G1 X120.432 Y112.746 E.01726
G1 X119.913 Y112.531 E.01726
G1 X119.621 Y112.342 E.01068
G1 X119.621 Y119.755 E.22777
G1 X119.889 Y119.576 E.00988
G1 X120.405 Y119.355 E.01726
G1 X120.955 Y119.241 E.01726
G1 X121.517 Y119.238 E.01726
G1 X122.068 Y119.347 E.01726
G1 X122.587 Y119.563 E.01726
G1 X122.828 Y119.719 E.00884
G1 X122.502 Y119.112 F30000
G1 F9473
G1 X122.502 Y112.98 E.18842
G1 X122.179 Y113.105 E.01064
G1 X121.554 Y113.229 E.01956
G1 X120.918 Y113.226 E.01956
G1 X120.294 Y113.097 E.01956
G1 X119.998 Y112.981 E.00977
G1 X119.998 Y119.113 E.18842
G1 X120.321 Y118.988 E.01064
G1 X120.946 Y118.864 E.01956
G1 X121.582 Y118.867 E.01956
G1 X122.206 Y118.996 E.01956
G1 X122.446 Y119.09 E.00792
G1 X122.125 Y118.583 F30000
G1 F9473
G1 X122.125 Y113.505 E.15606
G1 X121.564 Y113.606 E.01752
G1 X120.852 Y113.597 E.02186
G1 X120.375 Y113.51 E.01489
G1 X120.375 Y118.589 E.15606
G1 X120.936 Y118.487 E.01752
G1 X121.648 Y118.496 E.02186
G1 X122.066 Y118.573 E.01305
G1 X121.748 Y118.096 F30000
G1 F9473
G1 X121.748 Y113.961 E.12705
G3 X120.753 Y113.997 I-.892 J-10.728 E.03061
G1 X120.753 Y118.132 E.12705
G3 X121.688 Y118.097 I.854 J10.082 E.02876
G1 X121.405 Y117.759 F30000
; LINE_WIDTH: 0.351907
G1 F9473
G1 X121.405 Y114.33 E.08633
G1 X121.096 Y114.334 E.00778
G1 X121.096 Y117.763 E.08633
G1 X121.345 Y117.76 E.00627
G1 X119.358 Y120.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F9473
G1 X119.294 Y120.854 E.00044
; LINE_WIDTH: 0.111414
G1 X119.226 Y120.944 E.00063
; LINE_WIDTH: 0.147278
G1 X119.153 Y121.041 E.00103
; LINE_WIDTH: 0.181652
G1 X119.056 Y121.183 E.00195
G1 X119.079 Y121.362 F30000
; LINE_WIDTH: 0.119466
G1 F9473
G3 X119.149 Y120.947 I8.313 J1.203 E.00262
G1 X119.078 Y122.734 F30000
; LINE_WIDTH: 0.129189
G1 F9473
G1 X119.096 Y122.839 E.00075
; LINE_WIDTH: 0.161456
G1 X119.115 Y122.943 E.00103
; LINE_WIDTH: 0.148191
G2 X119.179 Y123.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111411
G1 X119.237 Y123.141 E.00058
; LINE_WIDTH: 0.0973919
G1 X119.297 Y123.22 E.00044
G1 X119.297 Y111.22 F30000
; LINE_WIDTH: 0.0973912
G1 F9473
G1 X119.237 Y111.141 E.00044
; LINE_WIDTH: 0.111407
G1 X119.179 Y111.055 E.00058
; LINE_WIDTH: 0.148184
G3 X119.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X119.096 Y110.839 E.00103
; LINE_WIDTH: 0.129189
G1 X119.078 Y110.734 E.00075
G1 X119.079 Y109.362 F30000
; LINE_WIDTH: 0.119474
G1 F9473
G3 X119.149 Y108.947 I8.327 J1.205 E.00262
G1 X119.226 Y108.944 F30000
; LINE_WIDTH: 0.147264
G1 F9473
G1 X119.153 Y109.041 E.00103
; LINE_WIDTH: 0.181633
G1 X119.056 Y109.183 E.00195
G1 X119.226 Y108.944 F30000
; LINE_WIDTH: 0.111405
G1 F9473
G1 X119.294 Y108.854 E.00063
; LINE_WIDTH: 0.0973921
G1 X119.358 Y108.778 E.00044
; WIPE_START
G1 F24000
G1 X119.294 Y108.854 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.006 J1.217 P1  F30000
G1 X123.203 Y108.874 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.126779
G1 F9473
G1 X123.321 Y109.038 E.00138
; LINE_WIDTH: 0.173106
G1 X123.379 Y109.124 E.0011
; LINE_WIDTH: 0.136064
G1 X123.404 Y109.255 E.00101
; LINE_WIDTH: 0.0969202
G1 X123.422 Y109.359 E.00047
G1 X123.256 Y108.403 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9473
G1 X123.256 Y102.041 E.19549
G1 X119.244 Y102.041 E.12327
G1 X119.244 Y108.305 E.1925
G1 X119.371 Y108.287 E.00392
G1 X119.483 Y108.371 E.00433
G1 X119.646 Y108.201 E.00724
G1 X120.044 Y107.92 E.01496
G1 X120.489 Y107.723 E.01496
G1 X120.965 Y107.618 E.01496
G1 X121.452 Y107.61 E.01496
G1 X121.93 Y107.698 E.01496
G1 X122.382 Y107.879 E.01496
G1 X122.796 Y108.154 E.01525
G1 X123.088 Y108.469 E.01321
G1 X123.197 Y108.393 E.00409
G1 X122.879 Y107.751 F30000
G1 F9473
G1 X122.879 Y102.418 E.16388
G1 X119.621 Y102.418 E.10009
G1 X119.621 Y107.755 E.16398
G1 X119.889 Y107.576 E.00988
G1 X120.405 Y107.355 E.01726
G1 X120.955 Y107.241 E.01726
G1 X121.517 Y107.238 E.01726
G1 X122.068 Y107.347 E.01726
G1 X122.587 Y107.563 E.01726
G1 X122.828 Y107.719 E.00884
G1 X122.502 Y107.112 F30000
G1 F9473
G1 X122.502 Y102.795 E.13266
G1 X119.998 Y102.795 E.07692
G1 X119.998 Y107.113 E.13268
G1 X120.321 Y106.988 E.01064
G1 X120.946 Y106.864 E.01956
G1 X121.582 Y106.867 E.01956
G1 X122.206 Y106.996 E.01956
G1 X122.446 Y107.09 E.00792
G1 X122.125 Y106.583 F30000
G1 F9473
G1 X122.125 Y103.172 E.10482
G1 X120.375 Y103.172 E.05375
G1 X120.375 Y106.589 E.10498
G1 X120.936 Y106.487 E.01752
G1 X121.648 Y106.496 E.02186
G1 X122.066 Y106.573 E.01305
G1 X121.748 Y106.096 F30000
G1 F9473
G1 X121.748 Y103.549 E.07825
G1 X120.753 Y103.549 E.03058
G1 X120.753 Y106.132 E.07937
G3 X121.688 Y106.097 I.853 J10.063 E.02876
G1 X121.405 Y105.759 F30000
; LINE_WIDTH: 0.351907
G1 F9473
G1 X121.405 Y103.892 E.04701
G1 X121.096 Y103.892 E.00778
G1 X121.096 Y105.763 E.04711
G1 X121.345 Y105.76 E.00627
G1 X123.421 Y110.731 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119476
G1 F9473
G3 X123.351 Y111.146 I-8.324 J-1.205 E.00262
G1 X123.274 Y111.149 F30000
; LINE_WIDTH: 0.179222
G1 F9473
G1 X123.343 Y111.058 E.00126
; LINE_WIDTH: 0.19563
G1 X123.444 Y110.91 E.00224
G1 X123.274 Y111.149 F30000
; LINE_WIDTH: 0.129163
G1 F9473
G1 X123.142 Y111.315 E.00149
; WIPE_START
G1 F24000
G1 X123.274 Y111.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.155 J-.382 P1  F30000
G1 X115.218 Y135.512 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F9473
G1 X126.314 Y135.512 E.41592
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.314 Y135.512 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/63
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
G3 Z7 I.389 J1.153 P1  F30000
G1 X159.581 Y123.605 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5692
G1 X159.275 Y123.822 E.01244
G3 X157.995 Y120.01 I-1.025 J-1.777 E.24093
G1 X158.199 Y119.994 E.00679
G3 X159.627 Y123.566 I.051 J2.051 E.16543
G1 X159.376 Y123.262 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5692
G1 X159.347 Y123.29 E.00123
G3 X158.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X158.209 Y120.387 E.00509
G3 X159.572 Y123.048 I.041 J1.659 E.11443
G1 X159.417 Y123.218 E.00708
M204 S10000
; WIPE_START
G1 F24000
G1 X159.347 Y123.29 E-.03799
G1 X159.08 Y123.484 E-.12557
G1 X158.779 Y123.62 E-.12563
G1 X158.457 Y123.694 E-.12564
G1 X158.126 Y123.702 E-.12563
G1 X157.8 Y123.645 E-.12563
G1 X157.57 Y123.555 E-.09391
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.202 J.193 P1  F30000
G1 X159.474 Y111.691 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5692
G1 X159.447 Y111.711 E.00111
G3 X157.995 Y108.01 I-1.197 J-1.666 E.24771
G1 X158.199 Y107.994 E.00679
G3 X159.753 Y111.441 I.051 J2.051 E.15952
G1 X159.518 Y111.651 E.01045
G1 X159.217 Y111.396 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5692
G1 X158.932 Y111.558 E.01006
G3 X158.044 Y108.399 I-.682 J-1.513 E.17541
G1 X158.209 Y108.387 E.00509
G3 X159.263 Y111.359 I.041 J1.659 E.12794
M204 S10000
; WIPE_START
G1 F24000
G1 X158.932 Y111.558 E-.14685
G1 X158.62 Y111.665 E-.12556
G1 X158.291 Y111.706 E-.12563
G1 X157.962 Y111.682 E-.12564
G1 X157.644 Y111.592 E-.12563
G1 X157.384 Y111.459 E-.11069
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.195 J.228 P1  F30000
G1 X161.04 Y130.649 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5692
G1 X163.205 Y130.649 E.07181
G3 X165.446 Y133.918 I.006 J2.399 E.15472
G3 X164.651 Y135.746 I-34.61 J-13.963 E.06613
G1 X152.335 Y135.746 E.40854
G2 X155.852 Y130.169 I-12.869 J-12.012 E.22001
G1 X155.852 Y101.649 E.94606
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.649 E.96198
G1 X160.98 Y130.649 E.01102
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5692
G1 X163.21 Y130.257 E.06667
G3 X165.812 Y134.058 I.001 J2.791 E.16652
G3 X164.894 Y136.138 I-29.905 J-11.965 E.06986
G1 X151.392 Y136.138 E.41487
G2 X155.46 Y130.089 I-11.833 J-12.35 E.2257
G1 X155.46 Y101.257 E.88594
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.929 J.787 P1  F30000
G1 X163.733 Y131.071 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5692
G3 X164.988 Y132.038 I-.56 J2.023 E.05387
G1 X162.147 Y134.878 E.13324
G1 X163.409 Y134.878 E.04183
G1 X156.2 Y127.67 E.33815
G1 X156.2 Y125.474 E.07287
G1 X157.395 Y124.279 E.05602
G2 X159.943 Y123.737 I.856 J-2.238 E.09138
G1 X160.3 Y124.094 E.01673
G1 X160.3 Y129.05 E.16442
G1 X154.471 Y134.878 E.27342
G1 X155.733 Y134.878 E.04183
G1 X154.46 Y133.606 E.05967
G2 X155.292 Y132.207 I-14.818 J-9.749 E.054
G1 X153.293 Y135.312 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5692
G1 X164.31 Y135.312 E.41294
; WIPE_START
G1 F24000
G1 X162.31 Y135.312 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.204 J-.176 P1  F30000
G1 X160.203 Y120.874 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126781
G1 F5692
G1 X160.321 Y121.038 E.00138
; LINE_WIDTH: 0.173109
G1 X160.379 Y121.124 E.0011
; LINE_WIDTH: 0.136064
G1 X160.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969199
G1 X160.422 Y121.359 E.00047
G1 X160.351 Y123.146 F30000
; LINE_WIDTH: 0.11947
G1 F5692
G2 X160.421 Y122.731 I-8.173 J-1.607 E.00262
G1 X160.444 Y122.91 F30000
; LINE_WIDTH: 0.195637
G1 F5692
G1 X160.343 Y123.058 E.00224
; LINE_WIDTH: 0.179237
G1 X160.274 Y123.149 E.00126
; LINE_WIDTH: 0.12917
G1 X160.142 Y123.315 E.00149
; WIPE_START
G1 F24000
G1 X160.274 Y123.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.022 J-1.217 P1  F30000
G1 X156.297 Y123.22 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.0973919
G1 F5692
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111412
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148193
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16145
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.129185
G1 X156.078 Y122.734 E.00075
G1 X156.149 Y120.947 F30000
; LINE_WIDTH: 0.119466
G1 F5692
G2 X156.079 Y121.362 I8.251 J1.619 E.00262
G1 X156.056 Y121.183 F30000
; LINE_WIDTH: 0.181643
G1 F5692
G1 X156.153 Y121.041 E.00195
; LINE_WIDTH: 0.147269
G1 X156.226 Y120.944 E.00103
; LINE_WIDTH: 0.111404
G1 X156.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973918
G1 X156.358 Y120.778 E.00044
M73 P83 R2
G1 X157.996 Y119.661 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5692
G2 X156.559 Y120.353 I.302 J2.464 E.05385
G1 X156.2 Y119.994 E.01684
G1 X156.2 Y117.798 E.07287
G1 X160.3 Y113.698 E.19231
G1 X160.3 Y116.418 E.09021
G1 X156.2 Y112.318 E.19231
G1 X156.2 Y111.73 E.01953
G1 X156.4 Y111.578 E.00833
G2 X156.999 Y112.085 I2.361 J-2.181 E.02608
G1 X156.297 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973912
G1 F5692
G1 X156.237 Y111.141 E.00044
; LINE_WIDTH: 0.11139
G1 X156.179 Y111.055 E.00058
; LINE_WIDTH: 0.148168
M73 P84 R2
G3 X156.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161446
G1 X156.096 Y110.839 E.00103
; LINE_WIDTH: 0.129183
G1 X156.078 Y110.734 E.00075
G1 X156.149 Y108.947 F30000
; LINE_WIDTH: 0.119475
G1 F5692
G2 X156.079 Y109.362 I8.169 J1.606 E.00262
G1 X156.056 Y109.183 F30000
; LINE_WIDTH: 0.181648
G1 F5692
G1 X156.153 Y109.041 E.00195
; LINE_WIDTH: 0.147276
G1 X156.226 Y108.944 E.00103
; LINE_WIDTH: 0.111413
G1 X156.294 Y108.854 E.00063
; LINE_WIDTH: 0.0973923
G1 X156.358 Y108.778 E.00044
G1 X157.063 Y107.959 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5692
G3 X158.635 Y107.687 I1.156 J2 E.05404
G1 X160.3 Y106.022 E.07808
G1 X160.3 Y108.364 E.07766
G1 X160.1 Y108.515 E.00833
G3 X156.2 Y104.642 I75.022 J-79.437 E.18232
G1 X156.2 Y102.446 E.07287
G1 X156.649 Y101.997 E.02105
G1 X158.277 Y101.997 E.05401
G1 X160.203 Y108.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126784
G1 F5692
G1 X160.321 Y109.038 E.00138
; LINE_WIDTH: 0.173117
G1 X160.379 Y109.124 E.0011
; LINE_WIDTH: 0.136069
G1 X160.404 Y109.255 E.00101
; LINE_WIDTH: 0.0969206
G1 X160.422 Y109.359 E.00047
G1 X160.351 Y111.146 F30000
; LINE_WIDTH: 0.119481
G1 F5692
G2 X160.421 Y110.731 I-8.247 J-1.618 E.00262
G1 X160.444 Y110.91 F30000
; LINE_WIDTH: 0.195634
G1 F5692
G1 X160.343 Y111.058 E.00224
; LINE_WIDTH: 0.179228
G1 X160.274 Y111.149 E.00126
; LINE_WIDTH: 0.129166
G1 X160.142 Y111.315 E.00149
; WIPE_START
G1 F24000
G1 X160.274 Y111.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.382 J-1.156 P1  F30000
G1 X122.581 Y123.605 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5692
G1 X122.275 Y123.822 E.01244
G3 X120.995 Y120.01 I-1.025 J-1.777 E.24093
G1 X121.199 Y119.994 E.00679
G3 X122.627 Y123.566 I.051 J2.051 E.16543
G1 X122.376 Y123.262 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5692
G1 X122.347 Y123.29 E.00123
G3 X121.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X121.209 Y120.387 E.00509
G3 X122.572 Y123.048 I.041 J1.659 E.11443
G1 X122.417 Y123.218 E.00708
M204 S10000
; WIPE_START
G1 F24000
G1 X122.347 Y123.29 E-.03799
G1 X122.08 Y123.484 E-.12557
G1 X121.779 Y123.62 E-.12563
G1 X121.457 Y123.694 E-.12564
G1 X121.126 Y123.702 E-.12563
G1 X120.8 Y123.645 E-.12563
G1 X120.57 Y123.555 E-.09391
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.208 J.145 P1  F30000
G1 X122.39 Y108.343 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5692
G1 X122.683 Y108.577 E.01245
G3 X120.995 Y108.01 I-1.433 J1.468 E.36648
G1 X121.199 Y107.994 E.00679
G3 X122.341 Y108.308 I.051 J2.051 E.03987
G1 X122.151 Y108.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5692
G3 X121.044 Y108.399 I-.901 J1.393 E.28473
G1 X121.209 Y108.387 E.00509
G3 X122.1 Y108.621 I.041 J1.659 E.02869
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14826
G1 X122.622 Y109.111 E-.12564
G1 X122.78 Y109.402 E-.12563
G1 X122.877 Y109.718 E-.12563
G1 X122.909 Y109.987 E-.10289
G1 X122.892 Y110.294 E-.11702
G1 X122.882 Y110.332 E-.01493
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.194 J-.237 P1  F30000
G1 X118.852 Y130.649 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5692
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.169 E.94606
G2 X127.168 Y135.746 I16.322 J-6.402 E.22007
G1 X114.849 Y135.746 E.40864
G1 X114.737 Y135.522 E.0083
G1 X114.054 Y133.917 E.05786
G3 X116.295 Y130.649 I2.236 J-.87 E.1547
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5692
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88594
G2 X128.105 Y136.138 I15.773 J-6.21 E.22569
G1 X114.606 Y136.138 E.41478
G1 X114.381 Y135.686 E.0155
G1 X113.688 Y134.058 E.05437
G3 X116.29 Y130.257 I2.602 J-1.01 E.16651
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.888 J-.832 P1  F30000
G1 X115.767 Y131.073 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5692
G2 X114.512 Y132.037 I.554 J2.02 E.05387
G1 X117.353 Y134.878 E.13328
G1 X116.092 Y134.878 E.04183
G1 X123.3 Y127.67 E.33815
G1 X123.3 Y125.474 E.07287
G1 X122.108 Y124.282 E.05588
G3 X119.558 Y123.736 I-.852 J-2.248 E.09145
G1 X119.2 Y124.094 E.01678
G1 X119.2 Y129.05 E.16442
G1 X125.029 Y134.878 E.27342
G1 X123.768 Y134.878 E.04183
G1 X125.04 Y133.606 E.05967
G3 X124.209 Y132.207 I14.818 J-9.748 E.054
G1 X123.142 Y123.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129168
G1 F5692
G1 X123.274 Y123.149 E.00149
; LINE_WIDTH: 0.179235
G1 X123.343 Y123.058 E.00126
; LINE_WIDTH: 0.195634
G1 X123.444 Y122.91 E.00224
G1 X123.421 Y122.731 F30000
; LINE_WIDTH: 0.119468
G1 F5692
G3 X123.351 Y123.146 I-8.331 J-1.205 E.00262
G1 X123.422 Y121.359 F30000
; LINE_WIDTH: 0.0969199
G1 F5692
G1 X123.404 Y121.255 E.00047
; LINE_WIDTH: 0.136062
G1 X123.379 Y121.124 E.00101
; LINE_WIDTH: 0.173104
G1 X123.321 Y121.038 E.0011
; LINE_WIDTH: 0.126779
G1 X123.203 Y120.874 E.00138
G1 X121.503 Y119.663 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5692
G3 X122.94 Y120.355 I-.188 J2.229 E.05407
G1 X123.3 Y119.994 E.0169
G1 X123.3 Y117.798 E.07287
G1 X119.2 Y113.698 E.19231
G1 X119.2 Y116.418 E.09021
G1 X123.3 Y112.318 E.19231
G1 X123.3 Y111.781 E.01783
G1 X123.242 Y111.854 E.00308
G1 X123.013 Y111.662 E.00991
G3 X122.479 Y112.108 I-1.37 J-1.098 E.02324
G1 X123.142 Y111.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F5692
G1 X123.274 Y111.149 E.00149
; LINE_WIDTH: 0.179228
G1 X123.343 Y111.058 E.00126
; LINE_WIDTH: 0.195631
G1 X123.444 Y110.91 E.00224
G1 X123.421 Y110.731 F30000
; LINE_WIDTH: 0.119476
G1 F5692
G3 X123.351 Y111.146 I-8.323 J-1.204 E.00262
G1 X123.422 Y109.359 F30000
; LINE_WIDTH: 0.0969206
G1 F5692
G1 X123.404 Y109.255 E.00047
; LINE_WIDTH: 0.136067
G1 X123.379 Y109.124 E.00101
; LINE_WIDTH: 0.173112
G1 X123.321 Y109.038 E.0011
; LINE_WIDTH: 0.126781
G1 X123.203 Y108.874 E.00138
G1 X122.431 Y107.963 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5692
G2 X120.861 Y107.683 I-1.195 J2.16 E.05385
G1 X119.2 Y106.022 E.07791
G1 X119.2 Y108.345 E.07706
G1 X119.278 Y108.256 E.00393
G1 X119.487 Y108.431 E.00907
G3 X119.792 Y108.15 I.848 J.613 E.01385
G1 X123.3 Y104.642 E.16455
G1 X123.3 Y102.446 E.07287
G1 X122.851 Y101.997 E.02105
G1 X121.223 Y101.997 E.05401
G1 X119.358 Y108.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973919
G1 F5692
G1 X119.294 Y108.854 E.00044
; LINE_WIDTH: 0.111413
G1 X119.226 Y108.944 E.00063
; LINE_WIDTH: 0.147277
G1 X119.153 Y109.041 E.00103
; LINE_WIDTH: 0.18165
G1 X119.056 Y109.183 E.00195
G1 X119.079 Y109.362 F30000
; LINE_WIDTH: 0.119479
G1 F5692
G3 X119.149 Y108.947 I8.319 J1.204 E.00262
G1 X119.078 Y110.734 F30000
; LINE_WIDTH: 0.129185
G1 F5692
G1 X119.096 Y110.839 E.00075
; LINE_WIDTH: 0.16145
G1 X119.115 Y110.943 E.00103
; LINE_WIDTH: 0.148173
G2 X119.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111394
G1 X119.237 Y111.141 E.00058
; LINE_WIDTH: 0.0973918
G1 X119.297 Y111.22 E.00044
G1 X119.358 Y120.778 F30000
; LINE_WIDTH: 0.0973916
G1 F5692
G1 X119.294 Y120.854 E.00044
; LINE_WIDTH: 0.111404
G1 X119.226 Y120.944 E.00063
; LINE_WIDTH: 0.14727
G1 X119.153 Y121.041 E.00103
; LINE_WIDTH: 0.181646
G1 X119.056 Y121.183 E.00195
G1 X119.079 Y121.362 F30000
; LINE_WIDTH: 0.11947
G1 F5692
G3 X119.149 Y120.947 I8.332 J1.206 E.00262
G1 X119.078 Y122.734 F30000
; LINE_WIDTH: 0.129187
G1 F5692
G1 X119.096 Y122.839 E.00075
; LINE_WIDTH: 0.161454
G1 X119.115 Y122.943 E.00103
; LINE_WIDTH: 0.148191
G2 X119.179 Y123.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111411
G1 X119.237 Y123.141 E.00058
; LINE_WIDTH: 0.0973917
G1 X119.297 Y123.22 E.00044
; WIPE_START
G1 F24000
G1 X119.237 Y123.141 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.153 J-.39 P1  F30000
G1 X115.124 Y135.312 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5692
G1 X126.148 Y135.312 E.41321
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.148 Y135.312 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/63
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
G3 Z7.2 I.382 J1.156 P1  F30000
G1 X159.581 Y123.605 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5635
G1 X159.275 Y123.822 E.01244
G3 X157.995 Y120.01 I-1.025 J-1.777 E.24092
G1 X158.199 Y119.994 E.00679
G3 X159.627 Y123.566 I.051 J2.051 E.16543
G1 X159.396 Y123.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5635
G1 X159.347 Y123.29 E.00215
G3 X158.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X158.209 Y120.387 E.00509
G3 X159.572 Y123.048 I.041 J1.659 E.11443
G1 X159.437 Y123.196 E.00616
M204 S10000
; WIPE_START
G1 F24000
G1 X159.347 Y123.29 E-.04935
G1 X159.08 Y123.484 E-.12557
G1 X158.779 Y123.62 E-.12564
G1 X158.457 Y123.694 E-.12563
G1 X158.126 Y123.702 E-.12563
G1 X157.8 Y123.645 E-.12564
G1 X157.598 Y123.565 E-.08255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.202 J.19 P1  F30000
G1 X159.474 Y111.691 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5635
G1 X159.447 Y111.711 E.00111
G3 X157.995 Y108.01 I-1.197 J-1.666 E.24771
G1 X158.199 Y107.994 E.00679
G3 X159.753 Y111.441 I.051 J2.051 E.15952
G1 X159.518 Y111.651 E.01045
G1 X159.215 Y111.397 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5635
G1 X158.932 Y111.558 E.01001
G3 X158.044 Y108.399 I-.682 J-1.513 E.17541
G1 X158.209 Y108.387 E.00509
G3 X159.262 Y111.36 I.041 J1.659 E.12798
M204 S10000
; WIPE_START
G1 F24000
G1 X158.932 Y111.558 E-.1463
G1 X158.62 Y111.665 E-.12556
G1 X158.291 Y111.706 E-.12563
G1 X158.126 Y111.702 E-.06289
G1 X157.8 Y111.645 E-.12564
G1 X157.493 Y111.524 E-.12564
G1 X157.386 Y111.455 E-.04834
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.195 J.228 P1  F30000
G1 X161.04 Y130.649 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5635
G1 X163.205 Y130.649 E.07181
G3 X165.445 Y133.92 I.004 J2.4 E.15476
G3 X164.752 Y135.546 I-33.471 J-13.309 E.05863
G1 X152.518 Y135.546 E.40584
G2 X155.852 Y130.169 I-12.794 J-11.656 E.21106
G1 X155.852 Y101.649 E.94606
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.649 E.96198
G1 X160.98 Y130.649 E.01102
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5635
G1 X163.21 Y130.257 E.06667
G3 X165.812 Y134.059 I-.001 J2.792 E.16651
G3 X164.994 Y135.938 I-33.051 J-13.271 E.06296
G1 X151.598 Y135.938 E.41162
G2 X155.46 Y130.089 I-11.945 J-12.087 E.21691
G1 X155.46 Y101.257 E.88594
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.929 J.787 P1  F30000
G1 X163.733 Y131.071 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5635
G3 X164.988 Y132.038 I-.52 J1.971 E.05396
G1 X162.347 Y134.678 E.12386
G1 X163.209 Y134.678 E.02856
G1 X156.2 Y127.67 E.32876
G1 X156.2 Y125.474 E.07287
G1 X157.395 Y124.279 E.05602
G2 X159.943 Y123.737 I.856 J-2.238 E.09138
G1 X160.3 Y124.094 E.01673
G1 X160.3 Y129.05 E.16442
G1 X154.671 Y134.678 E.26403
G1 X155.533 Y134.678 E.02856
G1 X154.46 Y133.606 E.05029
G2 X155.292 Y132.207 I-14.819 J-9.75 E.054
G1 X153.466 Y135.112 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5635
G1 X164.406 Y135.112 E.41008
; WIPE_START
G1 F24000
G1 X162.406 Y135.112 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.203 J-.186 P1  F30000
G1 X160.203 Y120.874 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126787
G1 F5635
G1 X160.321 Y121.038 E.00138
; LINE_WIDTH: 0.17312
G1 X160.379 Y121.124 E.0011
; LINE_WIDTH: 0.136071
G1 X160.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969208
G1 X160.422 Y121.359 E.00047
G1 X160.351 Y123.146 F30000
; LINE_WIDTH: 0.119476
G1 F5635
G2 X160.421 Y122.731 I-8.248 J-1.618 E.00262
G1 X160.444 Y122.91 F30000
; LINE_WIDTH: 0.195638
G1 F5635
G1 X160.343 Y123.058 E.00224
; LINE_WIDTH: 0.17923
G1 X160.274 Y123.149 E.00126
; LINE_WIDTH: 0.129167
G1 X160.142 Y123.315 E.00149
; WIPE_START
G1 F24000
G1 X160.274 Y123.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.022 J-1.217 P1  F30000
G1 X156.297 Y123.22 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0973915
G1 F5635
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111406
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148189
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161448
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.129185
G1 X156.078 Y122.734 E.00075
G1 X156.149 Y120.947 F30000
; LINE_WIDTH: 0.11947
G1 F5635
G2 X156.079 Y121.362 I8.251 J1.619 E.00262
G1 X156.056 Y121.183 F30000
; LINE_WIDTH: 0.181635
G1 F5635
G1 X156.153 Y121.041 E.00195
; LINE_WIDTH: 0.147264
G1 X156.226 Y120.944 E.00103
; LINE_WIDTH: 0.111401
G1 X156.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973913
G1 X156.358 Y120.778 E.00044
G1 X157.996 Y119.661 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5635
G2 X156.559 Y120.353 I.302 J2.464 E.05385
G1 X156.2 Y119.994 E.01684
G1 X156.2 Y117.798 E.07287
G1 X160.3 Y113.698 E.19231
G1 X160.3 Y116.418 E.09021
G1 X156.2 Y112.318 E.19231
G1 X156.2 Y111.73 E.01953
G1 X156.401 Y111.578 E.00833
G2 X156.999 Y112.085 I2.36 J-2.181 E.02608
G1 X156.297 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973909
G1 F5635
G1 X156.237 Y111.141 E.00044
; LINE_WIDTH: 0.111399
M73 P85 R2
G1 X156.179 Y111.055 E.00058
; LINE_WIDTH: 0.148179
G3 X156.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161448
G1 X156.096 Y110.839 E.00103
; LINE_WIDTH: 0.129184
G1 X156.078 Y110.734 E.00075
G1 X156.149 Y108.947 F30000
; LINE_WIDTH: 0.119477
G1 F5635
G2 X156.079 Y109.362 I8.178 J1.608 E.00262
G1 X156.056 Y109.183 F30000
; LINE_WIDTH: 0.181648
G1 F5635
G1 X156.153 Y109.041 E.00195
; LINE_WIDTH: 0.147275
G1 X156.226 Y108.944 E.00103
; LINE_WIDTH: 0.111411
G1 X156.294 Y108.854 E.00063
; LINE_WIDTH: 0.0973914
G1 X156.358 Y108.778 E.00044
G1 X157.063 Y107.959 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5635
G3 X158.635 Y107.687 I1.156 J2 E.05404
G1 X160.3 Y106.022 E.07808
G1 X160.3 Y108.364 E.07766
G1 X160.1 Y108.515 E.00833
G3 X156.2 Y104.642 I75.104 J-79.518 E.18232
G1 X156.2 Y102.446 E.07287
G1 X156.649 Y101.997 E.02105
G1 X158.277 Y101.997 E.05401
G1 X160.203 Y108.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126783
G1 F5635
G1 X160.321 Y109.038 E.00138
; LINE_WIDTH: 0.173111
G1 X160.379 Y109.124 E.0011
; LINE_WIDTH: 0.136067
G1 X160.404 Y109.255 E.00101
; LINE_WIDTH: 0.0969205
G1 X160.422 Y109.359 E.00047
G1 X160.351 Y111.146 F30000
; LINE_WIDTH: 0.119472
G1 F5635
G2 X160.421 Y110.731 I-8.16 J-1.605 E.00262
G1 X160.444 Y110.91 F30000
; LINE_WIDTH: 0.195634
G1 F5635
G1 X160.343 Y111.058 E.00224
; LINE_WIDTH: 0.179222
G1 X160.274 Y111.149 E.00126
; LINE_WIDTH: 0.129162
G1 X160.142 Y111.315 E.00149
; WIPE_START
G1 F24000
G1 X160.274 Y111.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.381 J-1.156 P1  F30000
G1 X122.631 Y123.561 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5635
G1 X122.607 Y123.584 E.00111
G3 X120.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X121.199 Y119.994 E.00679
G3 X122.885 Y123.285 I.051 J2.051 E.15274
G1 X122.672 Y123.517 E.01045
G1 X122.396 Y123.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5635
G1 X122.347 Y123.29 E.00215
G3 X121.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X121.209 Y120.387 E.00509
G3 X122.572 Y123.048 I.041 J1.659 E.11443
G1 X122.437 Y123.196 E.00616
M204 S10000
; WIPE_START
G1 F24000
G1 X122.347 Y123.29 E-.04935
G1 X122.08 Y123.484 E-.12557
G1 X121.779 Y123.62 E-.12564
G1 X121.457 Y123.694 E-.12563
G1 X121.126 Y123.702 E-.12563
G1 X120.8 Y123.645 E-.12564
G1 X120.598 Y123.565 E-.08254
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.209 J.142 P1  F30000
G1 X122.39 Y108.343 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5635
G1 X122.683 Y108.577 E.01245
G3 X120.995 Y108.01 I-1.433 J1.468 E.36648
G1 X121.199 Y107.994 E.00679
G3 X122.341 Y108.308 I.051 J2.051 E.03987
G1 X122.151 Y108.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5635
G3 X121.044 Y108.399 I-.901 J1.393 E.28473
G1 X121.209 Y108.387 E.00509
G3 X122.1 Y108.621 I.041 J1.659 E.02869
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14825
G1 X122.622 Y109.111 E-.12563
G1 X122.78 Y109.402 E-.12564
G1 X122.877 Y109.718 E-.12564
G1 X122.909 Y109.992 E-.10478
G1 X122.892 Y110.294 E-.11514
G1 X122.882 Y110.332 E-.01493
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.194 J-.237 P1  F30000
G1 X118.852 Y130.649 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5635
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.169 E.94606
G2 X126.987 Y135.546 I16.126 J-6.288 E.21114
G1 X114.748 Y135.546 E.40599
G1 X114.054 Y133.917 E.05872
G3 X116.295 Y130.649 I2.236 J-.87 E.1547
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5635
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88594
G2 X127.905 Y135.938 I15.834 J-6.262 E.21695
G1 X114.506 Y135.938 E.4117
G1 X114.386 Y135.696 E.00829
G1 X113.688 Y134.058 E.05471
G3 X116.29 Y130.257 I2.602 J-1.01 E.16651
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.888 J-.832 P1  F30000
G1 X115.767 Y131.073 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5635
G2 X114.512 Y132.038 I.552 J2.018 E.05387
G1 X117.153 Y134.678 E.12389
G1 X116.292 Y134.678 E.02856
G1 X123.3 Y127.67 E.32876
G1 X123.3 Y125.474 E.07287
G1 X122.108 Y124.282 E.05588
G3 X119.558 Y123.736 I-.852 J-2.248 E.09145
G1 X119.2 Y124.094 E.01678
G1 X119.2 Y129.05 E.16442
G1 X124.829 Y134.678 E.26403
G1 X123.968 Y134.678 E.02856
G1 X125.04 Y133.606 E.05029
G3 X124.209 Y132.207 I14.842 J-9.761 E.054
G1 X123.142 Y123.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129168
G1 F5635
G1 X123.274 Y123.149 E.00149
; LINE_WIDTH: 0.179229
G1 X123.343 Y123.058 E.00126
; LINE_WIDTH: 0.195635
G1 X123.444 Y122.91 E.00224
G1 X123.421 Y122.731 F30000
; LINE_WIDTH: 0.119472
G1 F5635
G3 X123.351 Y123.146 I-8.323 J-1.204 E.00262
G1 X123.422 Y121.359 F30000
; LINE_WIDTH: 0.0969205
G1 F5635
G1 X123.404 Y121.255 E.00047
; LINE_WIDTH: 0.136069
G1 X123.379 Y121.124 E.00101
; LINE_WIDTH: 0.173117
G1 X123.321 Y121.038 E.0011
; LINE_WIDTH: 0.126786
G1 X123.203 Y120.874 E.00138
G1 X121.503 Y119.663 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5635
G3 X122.94 Y120.355 I-.188 J2.229 E.05407
G1 X123.3 Y119.994 E.0169
G1 X123.3 Y117.798 E.07287
G1 X119.2 Y113.698 E.19231
G1 X119.2 Y116.418 E.09021
G1 X123.3 Y112.318 E.19231
G1 X123.3 Y111.781 E.01783
G1 X123.242 Y111.854 E.00308
G1 X123.013 Y111.662 E.00991
G3 X122.479 Y112.108 I-1.37 J-1.098 E.02324
G1 X123.142 Y111.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129162
G1 F5635
G1 X123.274 Y111.149 E.00149
; LINE_WIDTH: 0.179221
G1 X123.343 Y111.058 E.00126
; LINE_WIDTH: 0.195631
G1 X123.444 Y110.91 E.00224
G1 X123.421 Y110.731 F30000
; LINE_WIDTH: 0.11947
G1 F5635
G3 X123.351 Y111.146 I-8.332 J-1.206 E.00262
G1 X123.422 Y109.359 F30000
; LINE_WIDTH: 0.0969205
G1 F5635
G1 X123.404 Y109.255 E.00047
; LINE_WIDTH: 0.136064
G1 X123.379 Y109.124 E.00101
; LINE_WIDTH: 0.173107
G1 X123.321 Y109.038 E.0011
; LINE_WIDTH: 0.12678
G1 X123.203 Y108.874 E.00138
G1 X122.431 Y107.963 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5635
G2 X120.861 Y107.683 I-1.195 J2.16 E.05385
G1 X119.2 Y106.022 E.07791
G1 X119.2 Y108.345 E.07706
G1 X119.278 Y108.256 E.00393
G1 X119.487 Y108.431 E.00907
G3 X119.792 Y108.15 I.848 J.613 E.01385
G1 X123.3 Y104.642 E.16455
G1 X123.3 Y102.446 E.07287
G1 X122.851 Y101.997 E.02105
G1 X121.223 Y101.997 E.05401
G1 X119.358 Y108.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F5635
G1 X119.294 Y108.854 E.00044
; LINE_WIDTH: 0.111413
G1 X119.226 Y108.944 E.00063
; LINE_WIDTH: 0.147277
G1 X119.153 Y109.041 E.00103
; LINE_WIDTH: 0.181651
G1 X119.056 Y109.183 E.00195
G1 X119.079 Y109.362 F30000
; LINE_WIDTH: 0.119481
G1 F5635
G3 X119.149 Y108.947 I8.334 J1.206 E.00262
G1 X119.078 Y110.734 F30000
; LINE_WIDTH: 0.129186
G1 F5635
G1 X119.096 Y110.839 E.00075
; LINE_WIDTH: 0.161452
G1 X119.115 Y110.943 E.00103
; LINE_WIDTH: 0.148181
G2 X119.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111401
G1 X119.237 Y111.141 E.00058
; LINE_WIDTH: 0.0973908
G1 X119.297 Y111.22 E.00044
G1 X119.358 Y120.778 F30000
; LINE_WIDTH: 0.0973914
G1 F5635
G1 X119.294 Y120.854 E.00044
; LINE_WIDTH: 0.111401
G1 X119.226 Y120.944 E.00063
; LINE_WIDTH: 0.147264
G1 X119.153 Y121.041 E.00103
; LINE_WIDTH: 0.181637
G1 X119.056 Y121.183 E.00195
G1 X119.079 Y121.362 F30000
; LINE_WIDTH: 0.119475
G1 F5635
G3 X119.149 Y120.947 I8.317 J1.203 E.00262
G1 X119.078 Y122.734 F30000
; LINE_WIDTH: 0.129187
G1 F5635
G1 X119.096 Y122.839 E.00075
; LINE_WIDTH: 0.161452
G1 X119.115 Y122.943 E.00103
; LINE_WIDTH: 0.148187
G2 X119.179 Y123.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111404
G1 X119.237 Y123.141 E.00058
; LINE_WIDTH: 0.0973913
G1 X119.297 Y123.22 E.00044
; WIPE_START
G1 F24000
G1 X119.237 Y123.141 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.148 J-.403 P1  F30000
G1 X115.034 Y135.112 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F5635
G1 X125.981 Y135.112 E.41032
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.981 Y135.112 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/63
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
G3 Z7.4 I.375 J1.158 P1  F30000
G1 X159.602 Y123.578 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
G1 X159.447 Y123.711 E.00677
G3 X157.995 Y120.01 I-1.197 J-1.666 E.24771
G1 X158.199 Y119.994 E.00679
G3 X159.753 Y123.441 I.051 J2.051 E.15953
G1 X159.646 Y123.538 E.00478
G1 X159.418 Y123.217 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
G1 X159.347 Y123.29 E.00312
G3 X158.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X158.209 Y120.387 E.00509
G3 X159.572 Y123.048 I.041 J1.659 E.11443
G1 X159.458 Y123.172 E.00518
M204 S10000
; WIPE_START
G1 F24000
G1 X159.347 Y123.29 E-.06143
G1 X159.08 Y123.484 E-.12557
G1 X158.779 Y123.62 E-.12564
G1 X158.457 Y123.694 E-.12564
G1 X158.126 Y123.702 E-.12562
G1 X157.8 Y123.645 E-.12564
G1 X157.628 Y123.577 E-.07046
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.203 J.187 P1  F30000
G1 X159.474 Y111.691 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
G1 X159.447 Y111.711 E.00111
G3 X157.995 Y108.01 I-1.197 J-1.666 E.24771
G1 X158.199 Y107.994 E.00679
G3 X159.753 Y111.441 I.051 J2.051 E.15952
G1 X159.518 Y111.651 E.01045
G1 X159.214 Y111.398 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
G1 X158.932 Y111.558 E.00996
G3 X158.044 Y108.399 I-.682 J-1.513 E.17541
G1 X158.209 Y108.387 E.00509
G3 X159.261 Y111.361 I.041 J1.659 E.12803
M204 S10000
; WIPE_START
G1 F24000
G1 X158.932 Y111.558 E-.14569
G1 X158.62 Y111.665 E-.12556
G1 X158.291 Y111.706 E-.12563
G1 X158.126 Y111.702 E-.06289
G1 X157.8 Y111.645 E-.12564
G1 X157.493 Y111.524 E-.12563
G1 X157.384 Y111.454 E-.04896
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.195 J.228 P1  F30000
G1 X161.04 Y130.649 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
G1 X163.205 Y130.649 E.07181
G3 X165.445 Y133.92 I.001 J2.402 E.15471
G3 X164.84 Y135.346 I-28.008 J-11.058 E.05138
G1 X152.702 Y135.346 E.40263
G2 X155.852 Y130.169 I-13.356 J-11.674 E.20202
G1 X155.852 Y101.649 E.94606
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.649 E.96198
G1 X160.98 Y130.649 E.01102
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
G1 X163.21 Y130.257 E.06667
G3 X165.812 Y134.059 I-.004 J2.795 E.16644
G3 X165.094 Y135.738 I-51.275 J-20.928 E.05609
G1 X151.798 Y135.738 E.40856
G2 X155.46 Y130.089 I-12.274 J-11.968 E.2082
G1 X155.46 Y101.257 E.88594
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.929 J.787 P1  F30000
G1 X163.733 Y131.071 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5578
G3 X164.99 Y132.036 I-.765 J2.296 E.05354
G1 X162.547 Y134.478 E.11458
G1 X163.009 Y134.478 E.01529
G1 X156.2 Y127.67 E.31938
G1 X156.2 Y125.474 E.07287
G1 X157.395 Y124.279 E.05602
G2 X159.943 Y123.737 I.856 J-2.238 E.09138
G1 X160.3 Y124.094 E.01673
G1 X160.3 Y129.05 E.16442
G1 X154.871 Y134.478 E.25465
G1 X155.333 Y134.478 E.01529
G1 X154.46 Y133.606 E.04091
G2 X155.292 Y132.207 I-14.799 J-9.738 E.054
G1 X153.621 Y134.912 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F5578
G1 X164.496 Y134.912 E.40762
; WIPE_START
G1 F24000
G1 X162.496 Y134.912 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.201 J-.196 P1  F30000
G1 X160.203 Y120.874 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126784
G1 F5578
G1 X160.321 Y121.038 E.00138
; LINE_WIDTH: 0.173113
G1 X160.379 Y121.124 E.0011
; LINE_WIDTH: 0.136068
G1 X160.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969206
G1 X160.422 Y121.359 E.00047
G1 X160.351 Y123.146 F30000
; LINE_WIDTH: 0.119472
G1 F5578
G2 X160.421 Y122.731 I-8.234 J-1.616 E.00262
G1 X160.444 Y122.91 F30000
; LINE_WIDTH: 0.195633
G1 F5578
G1 X160.343 Y123.058 E.00224
; LINE_WIDTH: 0.179222
G1 X160.274 Y123.149 E.00126
; LINE_WIDTH: 0.129163
G1 X160.142 Y123.315 E.00149
; WIPE_START
G1 F24000
G1 X160.274 Y123.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.022 J-1.217 P1  F30000
G1 X156.297 Y123.22 Z7.6
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.0973914
G1 F5578
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111406
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148181
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161462
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.129192
G1 X156.078 Y122.734 E.00075
G1 X156.149 Y120.947 F30000
; LINE_WIDTH: 0.119468
G1 F5578
G2 X156.079 Y121.362 I8.238 J1.617 E.00262
G1 X156.056 Y121.183 F30000
; LINE_WIDTH: 0.181648
G1 F5578
G1 X156.153 Y121.041 E.00195
; LINE_WIDTH: 0.147273
G1 X156.226 Y120.944 E.00103
; LINE_WIDTH: 0.111407
G1 X156.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973919
G1 X156.358 Y120.778 E.00044
G1 X157.996 Y119.661 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5578
G2 X156.559 Y120.353 I.302 J2.464 E.05385
G1 X156.2 Y119.994 E.01684
G1 X156.2 Y117.798 E.07287
G1 X160.3 Y113.698 E.19231
G1 X160.3 Y116.418 E.09021
G1 X156.2 Y112.318 E.19231
G1 X156.2 Y111.73 E.01953
G1 X156.401 Y111.578 E.00833
M73 P86 R2
G2 X156.999 Y112.085 I2.36 J-2.181 E.02608
G1 X156.297 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.097391
G1 F5578
G1 X156.237 Y111.141 E.00044
; LINE_WIDTH: 0.111401
G1 X156.179 Y111.055 E.00058
; LINE_WIDTH: 0.148175
G3 X156.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X156.096 Y110.839 E.00103
; LINE_WIDTH: 0.12919
G1 X156.078 Y110.734 E.00075
G1 X156.149 Y108.947 F30000
; LINE_WIDTH: 0.119475
G1 F5578
G2 X156.079 Y109.362 I8.182 J1.608 E.00262
G1 X156.056 Y109.183 F30000
; LINE_WIDTH: 0.18164
G1 F5578
G1 X156.153 Y109.041 E.00195
; LINE_WIDTH: 0.147269
G1 X156.226 Y108.944 E.00103
; LINE_WIDTH: 0.111407
G1 X156.294 Y108.854 E.00063
; LINE_WIDTH: 0.0973919
G1 X156.358 Y108.778 E.00044
G1 X157.063 Y107.959 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5578
G3 X158.635 Y107.687 I1.156 J2 E.05404
G1 X160.3 Y106.022 E.07808
G1 X160.3 Y108.364 E.07766
G1 X160.1 Y108.515 E.00833
G3 X156.2 Y104.642 I75.088 J-79.503 E.18232
G1 X156.2 Y102.446 E.07287
G1 X156.649 Y101.997 E.02105
G1 X158.277 Y101.997 E.05401
G1 X160.203 Y108.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126782
G1 F5578
G1 X160.321 Y109.038 E.00138
; LINE_WIDTH: 0.173112
G1 X160.379 Y109.124 E.0011
; LINE_WIDTH: 0.136067
G1 X160.404 Y109.255 E.00101
; LINE_WIDTH: 0.0969206
G1 X160.422 Y109.359 E.00047
G1 X160.351 Y111.146 F30000
; LINE_WIDTH: 0.119475
G1 F5578
G2 X160.421 Y110.731 I-8.162 J-1.605 E.00262
G1 X160.444 Y110.91 F30000
; LINE_WIDTH: 0.195635
G1 F5578
G1 X160.343 Y111.058 E.00224
; LINE_WIDTH: 0.179222
G1 X160.274 Y111.149 E.00126
; LINE_WIDTH: 0.129162
G1 X160.142 Y111.315 E.00149
; WIPE_START
G1 F24000
G1 X160.274 Y111.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.381 J-1.156 P1  F30000
G1 X122.602 Y123.578 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
G1 X122.447 Y123.711 E.00677
G3 X120.995 Y120.01 I-1.197 J-1.666 E.24771
G1 X121.199 Y119.994 E.00679
G3 X122.753 Y123.441 I.051 J2.051 E.15953
G1 X122.646 Y123.538 E.00478
G1 X122.418 Y123.217 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
G1 X122.347 Y123.29 E.00312
G3 X121.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X121.209 Y120.387 E.00509
G3 X122.572 Y123.048 I.041 J1.659 E.11443
G1 X122.458 Y123.172 E.00518
M204 S10000
; WIPE_START
G1 F24000
G1 X122.347 Y123.29 E-.06143
G1 X122.08 Y123.484 E-.12557
G1 X121.779 Y123.62 E-.12564
G1 X121.457 Y123.694 E-.12564
G1 X121.126 Y123.702 E-.12562
G1 X120.8 Y123.645 E-.12564
G1 X120.628 Y123.577 E-.07046
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.209 J.135 P1  F30000
G1 X122.334 Y108.307 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
G1 X122.364 Y108.322 E.00111
G3 X120.995 Y108.01 I-1.114 J1.723 E.38006
G1 X121.199 Y107.994 E.00679
G3 X122 Y108.136 I.051 J2.051 E.02717
G1 X122.281 Y108.28 E.01046
G1 X122.151 Y108.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
G3 X121.044 Y108.399 I-.901 J1.393 E.28473
G1 X121.209 Y108.387 E.00509
G3 X122.1 Y108.621 I.041 J1.659 E.02869
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14825
G1 X122.622 Y109.111 E-.12564
G1 X122.78 Y109.402 E-.12563
G1 X122.877 Y109.718 E-.12563
G1 X122.909 Y109.997 E-.10666
G1 X122.892 Y110.294 E-.11324
G1 X122.882 Y110.332 E-.01494
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.194 J-.237 P1  F30000
G1 X118.852 Y130.649 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.169 E.94606
G2 X126.79 Y135.346 I16.659 J-6.568 E.20185
G1 X114.663 Y135.346 E.40227
G1 X114.054 Y133.917 E.05151
G3 X116.295 Y130.649 I2.236 J-.87 E.1547
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88594
G2 X127.705 Y135.738 I15.671 J-6.155 E.2083
G1 X114.406 Y135.738 E.40864
G1 X113.688 Y134.058 E.05612
G3 X116.29 Y130.257 I2.602 J-1.01 E.16651
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.888 J-.832 P1  F30000
G1 X115.766 Y131.073 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5578
G2 X114.511 Y132.037 I.551 J2.017 E.05384
G1 X116.953 Y134.478 E.11455
G1 X116.492 Y134.478 E.01529
G1 X123.3 Y127.67 E.31938
G1 X123.3 Y125.474 E.07287
G1 X122.108 Y124.282 E.05588
G3 X119.558 Y123.736 I-.852 J-2.248 E.09145
G1 X119.2 Y124.094 E.01678
G1 X119.2 Y129.05 E.16442
G1 X124.629 Y134.478 E.25465
G1 X124.168 Y134.478 E.01529
G1 X125.04 Y133.606 E.04091
G3 X124.208 Y132.207 I14.8 J-9.738 E.054
G1 X123.142 Y123.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129162
G1 F5578
G1 X123.274 Y123.149 E.00149
; LINE_WIDTH: 0.179219
G1 X123.343 Y123.058 E.00126
; LINE_WIDTH: 0.195629
G1 X123.444 Y122.91 E.00224
G1 X123.421 Y122.731 F30000
; LINE_WIDTH: 0.119468
G1 F5578
G3 X123.351 Y123.146 I-8.31 J-1.202 E.00262
G1 X123.422 Y121.359 F30000
; LINE_WIDTH: 0.0969206
G1 F5578
G1 X123.404 Y121.255 E.00047
; LINE_WIDTH: 0.136065
G1 X123.379 Y121.124 E.00101
; LINE_WIDTH: 0.173108
G1 X123.321 Y121.038 E.0011
; LINE_WIDTH: 0.126781
G1 X123.203 Y120.874 E.00138
G1 X121.503 Y119.663 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5578
G3 X122.94 Y120.355 I-.188 J2.229 E.05407
G1 X123.3 Y119.994 E.0169
G1 X123.3 Y117.798 E.07287
G1 X119.2 Y113.698 E.19231
G1 X119.2 Y116.418 E.09021
G1 X123.3 Y112.318 E.19231
G1 X123.3 Y111.781 E.01783
G1 X123.242 Y111.854 E.00308
G1 X123.013 Y111.662 E.00991
G3 X122.479 Y112.108 I-1.37 J-1.098 E.02324
G1 X123.142 Y111.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129161
G1 F5578
G1 X123.274 Y111.149 E.00149
; LINE_WIDTH: 0.179219
G1 X123.343 Y111.058 E.00126
; LINE_WIDTH: 0.195631
G1 X123.444 Y110.91 E.00224
G1 X123.421 Y110.731 F30000
; LINE_WIDTH: 0.119472
G1 F5578
G3 X123.351 Y111.146 I-8.322 J-1.204 E.00262
G1 X123.422 Y109.359 F30000
; LINE_WIDTH: 0.0969206
G1 F5578
G1 X123.404 Y109.255 E.00047
; LINE_WIDTH: 0.136065
G1 X123.379 Y109.124 E.00101
; LINE_WIDTH: 0.173108
G1 X123.321 Y109.038 E.0011
; LINE_WIDTH: 0.12678
G1 X123.203 Y108.874 E.00138
G1 X122.431 Y107.963 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5578
G2 X120.861 Y107.683 I-1.195 J2.16 E.05385
G1 X119.2 Y106.022 E.07791
G1 X119.2 Y108.345 E.07706
G1 X119.278 Y108.256 E.00393
G1 X119.487 Y108.431 E.00907
G3 X119.792 Y108.15 I.848 J.613 E.01385
G1 X123.3 Y104.642 E.16455
G1 X123.3 Y102.446 E.07287
G1 X122.851 Y101.997 E.02105
G1 X121.223 Y101.997 E.05401
G1 X119.358 Y108.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973919
G1 F5578
G1 X119.294 Y108.854 E.00044
; LINE_WIDTH: 0.111408
G1 X119.226 Y108.944 E.00063
; LINE_WIDTH: 0.147271
G1 X119.153 Y109.041 E.00103
; LINE_WIDTH: 0.181642
G1 X119.056 Y109.183 E.00195
G1 X119.079 Y109.362 F30000
; LINE_WIDTH: 0.119479
G1 F5578
G3 X119.149 Y108.947 I8.244 J1.192 E.00262
G1 X119.078 Y110.734 F30000
; LINE_WIDTH: 0.129192
G1 F5578
G1 X119.096 Y110.839 E.00075
; LINE_WIDTH: 0.161464
G1 X119.115 Y110.943 E.00103
; LINE_WIDTH: 0.148179
G2 X119.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111405
G1 X119.237 Y111.141 E.00058
; LINE_WIDTH: 0.0973912
G1 X119.297 Y111.22 E.00044
G1 X119.358 Y120.778 F30000
; LINE_WIDTH: 0.0973918
G1 F5578
G1 X119.294 Y120.854 E.00044
; LINE_WIDTH: 0.111408
G1 X119.226 Y120.944 E.00063
; LINE_WIDTH: 0.147275
G1 X119.153 Y121.041 E.00103
; LINE_WIDTH: 0.181649
G1 X119.056 Y121.183 E.00195
G1 X119.079 Y121.362 F30000
; LINE_WIDTH: 0.119472
G1 F5578
G3 X119.149 Y120.947 I8.304 J1.201 E.00262
G1 X119.078 Y122.734 F30000
; LINE_WIDTH: 0.129194
G1 F5578
G1 X119.096 Y122.839 E.00075
; LINE_WIDTH: 0.161466
G1 X119.115 Y122.943 E.00103
; LINE_WIDTH: 0.148181
G2 X119.179 Y123.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111405
G1 X119.237 Y123.141 E.00058
; LINE_WIDTH: 0.0973913
G1 X119.297 Y123.22 E.00044
; WIPE_START
G1 F24000
G1 X119.237 Y123.141 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.143 J-.417 P1  F30000
G1 X114.949 Y134.912 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5578
G1 X125.824 Y134.912 E.40761
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.824 Y134.912 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/63
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
G3 Z7.6 I1.211 J-.116 P1  F30000
G1 X122.73 Y123.465 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5494
G1 X122.447 Y123.711 E.01244
G3 X120.995 Y120.01 I-1.197 J-1.666 E.24771
G1 X121.199 Y119.994 E.00679
G3 X122.771 Y123.422 I.051 J2.051 E.15864
G1 X122.453 Y123.188 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5494
G1 X122.218 Y123.393 E.00957
G3 X121.044 Y120.399 I-.968 J-1.348 E.18557
G1 X121.209 Y120.387 E.00509
G3 X122.493 Y123.144 I.041 J1.659 E.11825
M204 S10000
; WIPE_START
G1 F24000
G1 X122.218 Y123.393 E-.14096
G1 X121.933 Y123.56 E-.12557
G1 X121.62 Y123.665 E-.12564
G1 X121.291 Y123.706 E-.12563
G1 X120.962 Y123.682 E-.12564
G1 X120.8 Y123.645 E-.0629
G1 X120.669 Y123.593 E-.05367
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.209 J.136 P1  F30000
G1 X122.39 Y108.343 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5494
G1 X122.683 Y108.577 E.01245
G3 X120.995 Y108.01 I-1.433 J1.468 E.36648
G1 X121.199 Y107.994 E.00679
G3 X122.341 Y108.308 I.051 J2.051 E.03987
G1 X122.151 Y108.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5494
G3 X121.044 Y108.399 I-.901 J1.393 E.28473
G1 X121.209 Y108.387 E.00509
G3 X122.1 Y108.621 I.041 J1.659 E.02869
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14825
G1 X122.622 Y109.111 E-.12564
G1 X122.78 Y109.402 E-.12563
G1 X122.877 Y109.718 E-.12564
G1 X122.909 Y110.001 E-.10854
G1 X122.892 Y110.294 E-.11137
G1 X122.882 Y110.332 E-.01493
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.194 J-.237 P1  F30000
G1 X118.852 Y130.649 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5494
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.169 E.94606
G2 X126.627 Y135.146 I16.364 J-6.414 E.19329
G1 X114.578 Y135.146 E.39969
G1 X114.052 Y133.912 E.0445
G3 X116.295 Y130.649 I2.242 J-.861 E.15441
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5494
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88594
G2 X127.508 Y135.538 I15.939 J-6.316 E.19964
G1 X114.319 Y135.538 E.40526
G1 X113.687 Y134.056 E.04948
G3 X116.29 Y130.257 I2.607 J-1.005 E.16635
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.888 J-.832 P1  F30000
G1 X115.767 Y131.071 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5494
G2 X114.511 Y132.037 I.688 J2.194 E.05364
G1 X116.753 Y134.278 E.10516
G1 X116.692 Y134.278 E.00203
G1 X123.3 Y127.67 E.31
G1 X123.3 Y125.474 E.07287
G1 X122.108 Y124.282 E.05588
G3 X119.558 Y123.736 I-.852 J-2.248 E.09145
G1 X119.2 Y124.094 E.01678
G1 X119.2 Y129.05 E.16442
G1 X124.429 Y134.278 E.24527
G1 X124.368 Y134.278 E.00203
G1 X125.04 Y133.606 E.03152
G3 X124.208 Y132.207 I14.824 J-9.752 E.054
G1 X123.142 Y123.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129167
G1 F5494
G1 X123.274 Y123.149 E.00149
; LINE_WIDTH: 0.179227
G1 X123.343 Y123.058 E.00126
; LINE_WIDTH: 0.195634
G1 X123.444 Y122.91 E.00224
G1 X123.421 Y122.731 F30000
; LINE_WIDTH: 0.119466
G1 F5494
G3 X123.351 Y123.146 I-8.316 J-1.203 E.00262
G1 X123.422 Y121.359 F30000
; LINE_WIDTH: 0.0969205
G1 F5494
G1 X123.404 Y121.255 E.00047
; LINE_WIDTH: 0.136068
G1 X123.379 Y121.124 E.00101
; LINE_WIDTH: 0.173114
G1 X123.321 Y121.038 E.0011
; LINE_WIDTH: 0.126785
G1 X123.203 Y120.874 E.00138
G1 X121.503 Y119.663 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5494
G3 X122.94 Y120.355 I-.188 J2.229 E.05407
G1 X123.3 Y119.994 E.0169
G1 X123.3 Y117.798 E.07287
G1 X119.2 Y113.698 E.19231
G1 X119.2 Y116.418 E.09021
G1 X123.3 Y112.318 E.19231
G1 X123.3 Y111.781 E.01783
G1 X123.242 Y111.854 E.00308
G1 X123.013 Y111.662 E.00991
G3 X122.479 Y112.108 I-1.37 J-1.098 E.02324
G1 X123.142 Y111.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129159
G1 F5494
G1 X123.274 Y111.149 E.00149
; LINE_WIDTH: 0.179213
G1 X123.343 Y111.058 E.00126
; LINE_WIDTH: 0.195631
G1 X123.444 Y110.91 E.00224
G1 X123.421 Y110.731 F30000
; LINE_WIDTH: 0.119471
G1 F5494
G3 X123.351 Y111.146 I-8.236 J-1.191 E.00262
G1 X123.422 Y109.359 F30000
; LINE_WIDTH: 0.0969205
G1 F5494
G1 X123.404 Y109.255 E.00047
; LINE_WIDTH: 0.136066
G1 X123.379 Y109.124 E.00101
; LINE_WIDTH: 0.173109
G1 X123.321 Y109.038 E.0011
; LINE_WIDTH: 0.126781
G1 X123.203 Y108.874 E.00138
G1 X122.431 Y107.963 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5494
G2 X120.861 Y107.683 I-1.195 J2.16 E.05385
G1 X119.2 Y106.022 E.07791
G1 X119.2 Y108.345 E.07706
G1 X119.278 Y108.256 E.00393
G1 X119.487 Y108.431 E.00907
G3 X119.792 Y108.15 I.848 J.613 E.01385
G1 X123.3 Y104.642 E.16455
G1 X123.3 Y102.446 E.07287
G1 X122.851 Y101.997 E.02105
G1 X121.223 Y101.997 E.05401
G1 X119.358 Y108.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F5494
G1 X119.294 Y108.854 E.00044
; LINE_WIDTH: 0.111408
G1 X119.226 Y108.944 E.00063
; LINE_WIDTH: 0.147275
G1 X119.153 Y109.041 E.00103
; LINE_WIDTH: 0.181648
G1 X119.056 Y109.183 E.00195
G1 X119.079 Y109.362 F30000
; LINE_WIDTH: 0.119483
G1 F5494
G3 X119.149 Y108.947 I8.335 J1.206 E.00262
G1 X119.078 Y110.734 F30000
; LINE_WIDTH: 0.12919
G1 F5494
G1 X119.096 Y110.839 E.00075
; LINE_WIDTH: 0.16146
G1 X119.115 Y110.943 E.00103
; LINE_WIDTH: 0.148184
G2 X119.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111409
G1 X119.237 Y111.141 E.00058
; LINE_WIDTH: 0.0973914
M73 P87 R2
G1 X119.297 Y111.22 E.00044
G1 X119.358 Y120.778 F30000
; LINE_WIDTH: 0.0973919
G1 F5494
G1 X119.294 Y120.854 E.00044
; LINE_WIDTH: 0.111407
G1 X119.226 Y120.944 E.00063
; LINE_WIDTH: 0.147271
G1 X119.153 Y121.041 E.00103
; LINE_WIDTH: 0.181643
G1 X119.056 Y121.183 E.00195
G1 X119.079 Y121.362 F30000
; LINE_WIDTH: 0.119469
G1 F5494
G3 X119.149 Y120.947 I8.312 J1.203 E.00262
G1 X119.078 Y122.734 F30000
; LINE_WIDTH: 0.129191
G1 F5494
G1 X119.096 Y122.839 E.00075
; LINE_WIDTH: 0.161462
G1 X119.115 Y122.943 E.00103
; LINE_WIDTH: 0.148186
G2 X119.179 Y123.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.11141
G1 X119.237 Y123.141 E.00058
; LINE_WIDTH: 0.0973915
G1 X119.297 Y123.22 E.00044
; WIPE_START
G1 F24000
G1 X119.237 Y123.141 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.138 J-.43 P1  F30000
G1 X114.865 Y134.712 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F5494
G1 X125.663 Y134.712 E.40475
; WIPE_START
G1 F24000
G1 X123.663 Y134.712 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.363 J1.161 P1  F30000
G1 X159.775 Y123.416 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5494
G1 X159.753 Y123.441 E.0011
G3 X157.995 Y120.01 I-1.503 J-1.396 E.26128
G1 X158.199 Y119.994 E.00679
G3 X160 Y123.116 I.051 J2.051 E.14596
G1 X159.811 Y123.368 E.01046
G1 X159.453 Y123.188 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5494
G1 X159.218 Y123.393 E.00957
G3 X158.044 Y120.399 I-.968 J-1.348 E.18557
G1 X158.209 Y120.387 E.00509
G3 X159.493 Y123.144 I.041 J1.659 E.11825
M204 S10000
; WIPE_START
G1 F24000
G1 X159.218 Y123.393 E-.14096
G1 X158.933 Y123.56 E-.12557
G1 X158.62 Y123.665 E-.12564
G1 X158.291 Y123.706 E-.12563
G1 X157.962 Y123.682 E-.12564
G1 X157.8 Y123.645 E-.0629
G1 X157.669 Y123.593 E-.05367
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.204 J.178 P1  F30000
G1 X159.419 Y111.73 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5494
G1 X159.093 Y111.915 E.01244
G3 X157.995 Y108.01 I-.843 J-1.87 E.23415
G1 X158.199 Y107.994 E.00679
G3 X159.468 Y111.696 I.051 J2.051 E.17221
G1 X159.212 Y111.399 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5494
G1 X158.932 Y111.558 E.0099
G3 X158.044 Y108.399 I-.682 J-1.513 E.17541
G1 X158.209 Y108.387 E.00509
G3 X159.26 Y111.362 I.041 J1.659 E.12808
M204 S10000
; WIPE_START
G1 F24000
G1 X158.932 Y111.558 E-.14503
G1 X158.62 Y111.665 E-.12556
G1 X158.291 Y111.706 E-.12563
G1 X157.962 Y111.682 E-.12564
G1 X157.644 Y111.592 E-.12563
G1 X157.38 Y111.457 E-.11251
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.199 J.208 P1  F30000
G1 X160.648 Y130.257 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5494
G1 X160.648 Y130.649 E.01301
G1 X163.205 Y130.649 E.08482
G3 X165.446 Y133.917 I.001 J2.402 E.15461
G3 X164.928 Y135.146 I-23.348 J-9.132 E.04424
G1 X152.871 Y135.146 E.39995
G2 X155.852 Y130.169 I-13.41 J-11.414 E.19333
G1 X155.852 Y101.649 E.94606
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.197 E.94699
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5494
G1 X163.21 Y130.257 E.06667
G3 X165.812 Y134.058 I-.004 J2.795 E.16641
G3 X165.184 Y135.538 I-28.12 J-11.07 E.04939
G1 X151.991 Y135.538 E.40537
G2 X155.46 Y130.089 I-12.387 J-11.714 E.19967
G1 X155.46 Y101.257 E.88594
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.929 J.786 P1  F30000
G1 X163.733 Y131.071 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5494
G3 X164.99 Y132.036 I-.726 J2.246 E.05359
G1 X162.747 Y134.278 E.10518
G1 X162.809 Y134.278 E.00203
G1 X156.2 Y127.67 E.31
G1 X156.2 Y125.474 E.07287
G1 X157.395 Y124.279 E.05602
G2 X159.943 Y123.737 I.856 J-2.238 E.09138
G1 X160.3 Y124.094 E.01673
G1 X160.3 Y129.05 E.16442
G1 X155.071 Y134.278 E.24527
G1 X155.133 Y134.278 E.00203
G1 X154.461 Y133.606 E.03152
G2 X155.292 Y132.207 I-14.825 J-9.752 E.054
G1 X153.774 Y134.712 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5494
G1 X164.579 Y134.712 E.40503
; WIPE_START
G1 F24000
G1 X162.579 Y134.712 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.199 J-.206 P1  F30000
G1 X160.203 Y120.874 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126788
G1 F5494
G1 X160.321 Y121.038 E.00138
; LINE_WIDTH: 0.173119
G1 X160.379 Y121.124 E.0011
; LINE_WIDTH: 0.136071
G1 X160.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969205
G1 X160.422 Y121.359 E.00047
G1 X160.351 Y123.146 F30000
; LINE_WIDTH: 0.11947
G1 F5494
G2 X160.421 Y122.731 I-8.257 J-1.619 E.00262
G1 X160.444 Y122.91 F30000
; LINE_WIDTH: 0.195638
G1 F5494
G1 X160.343 Y123.058 E.00224
; LINE_WIDTH: 0.179228
G1 X160.274 Y123.149 E.00126
; LINE_WIDTH: 0.129167
G1 X160.142 Y123.315 E.00149
; WIPE_START
G1 F24000
G1 X160.274 Y123.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.022 J-1.217 P1  F30000
G1 X156.297 Y123.22 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.0973915
G1 F5494
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111411
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148188
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.129189
G1 X156.078 Y122.734 E.00075
G1 X156.149 Y120.947 F30000
; LINE_WIDTH: 0.119466
G1 F5494
G2 X156.079 Y121.362 I8.245 J1.618 E.00262
G1 X156.056 Y121.183 F30000
; LINE_WIDTH: 0.181639
G1 F5494
G1 X156.153 Y121.041 E.00195
; LINE_WIDTH: 0.147269
G1 X156.226 Y120.944 E.00103
; LINE_WIDTH: 0.111407
G1 X156.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973921
G1 X156.358 Y120.778 E.00044
G1 X157.996 Y119.661 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5494
G2 X156.559 Y120.353 I.302 J2.464 E.05385
G1 X156.2 Y119.994 E.01684
G1 X156.2 Y117.798 E.07287
G1 X160.3 Y113.698 E.19231
G1 X160.3 Y116.418 E.09021
G1 X156.2 Y112.318 E.19231
G1 X156.2 Y111.73 E.01953
G1 X156.401 Y111.578 E.00833
G2 X156.999 Y112.085 I2.361 J-2.181 E.02608
G1 X156.297 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973909
G1 F5494
G1 X156.237 Y111.141 E.00044
; LINE_WIDTH: 0.111406
G1 X156.179 Y111.055 E.00058
; LINE_WIDTH: 0.14818
G3 X156.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X156.096 Y110.839 E.00103
; LINE_WIDTH: 0.129188
G1 X156.078 Y110.734 E.00075
G1 X156.149 Y108.947 F30000
; LINE_WIDTH: 0.119479
G1 F5494
G2 X156.079 Y109.362 I8.183 J1.609 E.00262
G1 X156.056 Y109.183 F30000
; LINE_WIDTH: 0.181646
G1 F5494
G1 X156.153 Y109.041 E.00195
; LINE_WIDTH: 0.147273
G1 X156.226 Y108.944 E.00103
; LINE_WIDTH: 0.111407
G1 X156.294 Y108.854 E.00063
; LINE_WIDTH: 0.0973912
G1 X156.358 Y108.778 E.00044
G1 X157.063 Y107.959 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5494
G3 X158.635 Y107.687 I1.156 J2 E.05404
G1 X160.3 Y106.022 E.07808
G1 X160.3 Y108.364 E.07766
G1 X160.1 Y108.515 E.00833
G3 X156.2 Y104.642 I75.079 J-79.494 E.18232
G1 X156.2 Y102.446 E.07287
G1 X156.649 Y101.997 E.02105
G1 X158.277 Y101.997 E.05401
G1 X160.203 Y108.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126784
G1 F5494
G1 X160.321 Y109.038 E.00138
; LINE_WIDTH: 0.173113
G1 X160.379 Y109.124 E.0011
; LINE_WIDTH: 0.136068
G1 X160.404 Y109.255 E.00101
; LINE_WIDTH: 0.0969205
G1 X160.422 Y109.359 E.00047
G1 X160.351 Y111.146 F30000
; LINE_WIDTH: 0.119475
G1 F5494
G2 X160.421 Y110.731 I-8.16 J-1.605 E.00262
G1 X160.444 Y110.91 F30000
; LINE_WIDTH: 0.195635
G1 F5494
G1 X160.343 Y111.058 E.00224
; LINE_WIDTH: 0.179215
G1 X160.274 Y111.149 E.00126
; LINE_WIDTH: 0.12916
G1 X160.142 Y111.315 E.00149
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X160.274 Y111.149 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/63
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
G3 Z7.8 I-1.216 J-.037 P1  F30000
G1 X159.904 Y123.258 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5456
G1 X159.885 Y123.285 E.00111
G3 X157.995 Y120.01 I-1.635 J-1.24 E.26806
G1 X158.199 Y119.994 E.00679
G3 X160.098 Y122.936 I.051 J2.051 E.13917
G1 X159.935 Y123.206 E.01045
G1 X159.48 Y123.15 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5456
G1 X159.347 Y123.29 E.00591
G3 X158.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X158.209 Y120.387 E.00509
G3 X159.572 Y123.048 I.041 J1.659 E.11443
G1 X159.52 Y123.106 E.00239
M204 S10000
; WIPE_START
G1 F24000
G1 X159.347 Y123.29 E-.09595
G1 X159.08 Y123.484 E-.12557
G1 X158.779 Y123.62 E-.12563
G1 X158.457 Y123.694 E-.12564
G1 X158.126 Y123.702 E-.12562
G1 X157.8 Y123.645 E-.12564
G1 X157.712 Y123.61 E-.03595
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.205 J.173 P1  F30000
G1 X159.419 Y111.73 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5456
G1 X159.093 Y111.915 E.01244
G3 X157.995 Y108.01 I-.843 J-1.87 E.23415
G1 X158.199 Y107.994 E.00679
G3 X159.468 Y111.696 I.051 J2.051 E.17221
G1 X159.211 Y111.4 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5456
G1 X158.932 Y111.558 E.00985
G3 X158.044 Y108.399 I-.682 J-1.513 E.17541
G1 X158.209 Y108.387 E.00509
G3 X159.258 Y111.363 I.041 J1.659 E.12814
M204 S10000
; WIPE_START
G1 F24000
G1 X158.932 Y111.558 E-.14435
G1 X158.62 Y111.665 E-.12556
G1 X158.291 Y111.706 E-.12563
G1 X158.126 Y111.702 E-.06289
G1 X157.8 Y111.645 E-.12564
G1 X157.493 Y111.524 E-.12563
G1 X157.381 Y111.452 E-.05029
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.199 J.208 P1  F30000
G1 X160.648 Y130.257 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5456
G1 X160.648 Y130.649 E.01301
G1 X163.205 Y130.649 E.08482
G3 X165.447 Y133.917 I.006 J2.399 E.15469
G3 X165.017 Y134.946 I-19.546 J-7.557 E.03698
G1 X153.044 Y134.946 E.39716
G2 X155.852 Y130.169 I-13.651 J-11.238 E.18457
G1 X155.852 Y101.649 E.94606
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.197 E.94699
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5456
G1 X163.21 Y130.257 E.06667
G3 X165.812 Y134.058 I.001 J2.791 E.16651
G3 X165.273 Y135.338 I-24.316 J-9.494 E.04267
G1 X152.178 Y135.338 E.40239
G2 X155.46 Y130.089 I-12.486 J-11.459 E.19128
G1 X155.46 Y101.257 E.88594
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.925 J.79 P1  F30000
G1 X163.736 Y131.068 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5456
G3 X164.985 Y132.041 I-.549 J1.993 E.05388
G1 X162.947 Y134.078 E.0956
G1 X162.609 Y134.078 E.01124
G1 X156.2 Y127.67 E.30062
G1 X156.2 Y125.474 E.07287
G1 X157.395 Y124.279 E.05602
G2 X159.943 Y123.737 I.856 J-2.238 E.09138
G1 X160.3 Y124.094 E.01673
G1 X160.3 Y129.05 E.16442
G1 X155.271 Y134.078 E.23589
G1 X154.933 Y134.078 E.01124
G1 X154.461 Y133.607 E.02214
G2 X155.292 Y132.207 I-14.807 J-9.742 E.054
G1 X153.929 Y134.512 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5456
G1 X164.668 Y134.512 E.40255
; WIPE_START
G1 F24000
G1 X162.668 Y134.512 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.198 J-.216 P1  F30000
G1 X160.203 Y120.874 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126786
G1 F5456
G1 X160.321 Y121.038 E.00138
; LINE_WIDTH: 0.173119
G1 X160.379 Y121.124 E.0011
; LINE_WIDTH: 0.13607
G1 X160.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969207
G1 X160.422 Y121.359 E.00047
G1 X160.351 Y123.146 F30000
; LINE_WIDTH: 0.119475
G1 F5456
G2 X160.421 Y122.731 I-8.32 J-1.629 E.00262
G1 X160.444 Y122.91 F30000
; LINE_WIDTH: 0.195632
G1 F5456
G1 X160.343 Y123.058 E.00224
; LINE_WIDTH: 0.17923
G1 X160.274 Y123.149 E.00126
; LINE_WIDTH: 0.129166
G1 X160.142 Y123.315 E.00149
; WIPE_START
G1 F24000
G1 X160.274 Y123.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.022 J-1.217 P1  F30000
G1 X156.297 Y123.22 Z8
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.097392
G1 F5456
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111414
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148191
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.129188
G1 X156.078 Y122.734 E.00075
G1 X156.149 Y120.947 F30000
; LINE_WIDTH: 0.119466
G1 F5456
G2 X156.079 Y121.362 I8.247 J1.618 E.00262
G1 X156.056 Y121.183 F30000
; LINE_WIDTH: 0.181638
G1 F5456
G1 X156.153 Y121.041 E.00195
; LINE_WIDTH: 0.147264
G1 X156.226 Y120.944 E.00103
; LINE_WIDTH: 0.111399
G1 X156.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973915
G1 X156.358 Y120.778 E.00044
G1 X157.996 Y119.661 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5456
G2 X156.559 Y120.353 I.302 J2.464 E.05385
G1 X156.2 Y119.994 E.01684
G1 X156.2 Y117.798 E.07287
G1 X160.3 Y113.698 E.19231
G1 X160.3 Y116.418 E.09021
G1 X156.2 Y112.318 E.19231
G1 X156.2 Y111.73 E.01953
G1 X156.401 Y111.578 E.00833
G2 X156.999 Y112.085 I2.361 J-2.182 E.02608
G1 X156.297 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973908
M73 P88 R2
G1 F5456
G1 X156.237 Y111.141 E.00044
; LINE_WIDTH: 0.1114
G1 X156.179 Y111.055 E.00058
; LINE_WIDTH: 0.148177
G3 X156.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161452
G1 X156.096 Y110.839 E.00103
; LINE_WIDTH: 0.129186
G1 X156.078 Y110.734 E.00075
G1 X156.149 Y108.947 F30000
; LINE_WIDTH: 0.119474
G1 F5456
G2 X156.079 Y109.362 I8.261 J1.62 E.00262
G1 X156.056 Y109.183 F30000
; LINE_WIDTH: 0.181648
G1 F5456
G1 X156.153 Y109.041 E.00195
; LINE_WIDTH: 0.147275
G1 X156.226 Y108.944 E.00103
; LINE_WIDTH: 0.11141
G1 X156.294 Y108.854 E.00063
; LINE_WIDTH: 0.0973912
G1 X156.358 Y108.778 E.00044
G1 X157.063 Y107.959 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5456
G3 X158.635 Y107.687 I1.156 J2 E.05404
G1 X160.3 Y106.022 E.07808
G1 X160.3 Y108.364 E.07766
G1 X160.1 Y108.515 E.00833
G3 X156.2 Y104.642 I75.081 J-79.495 E.18232
G1 X156.2 Y102.446 E.07287
G1 X156.649 Y101.997 E.02105
G1 X158.277 Y101.997 E.05401
G1 X160.203 Y108.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126784
G1 F5456
G1 X160.321 Y109.038 E.00138
; LINE_WIDTH: 0.173111
G1 X160.379 Y109.124 E.0011
; LINE_WIDTH: 0.136067
G1 X160.404 Y109.255 E.00101
; LINE_WIDTH: 0.0969205
G1 X160.422 Y109.359 E.00047
G1 X160.351 Y111.146 F30000
; LINE_WIDTH: 0.11947
G1 F5456
G2 X160.421 Y110.731 I-8.233 J-1.616 E.00262
G1 X160.444 Y110.91 F30000
; LINE_WIDTH: 0.195631
G1 F5456
G1 X160.343 Y111.058 E.00224
; LINE_WIDTH: 0.179235
G1 X160.274 Y111.149 E.00126
; LINE_WIDTH: 0.129166
G1 X160.142 Y111.315 E.00149
; WIPE_START
G1 F24000
G1 X160.274 Y111.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.375 J-1.158 P1  F30000
G1 X122.904 Y123.258 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5456
G1 X122.885 Y123.285 E.00111
G3 X120.995 Y120.01 I-1.635 J-1.24 E.26806
G1 X121.199 Y119.994 E.00679
G3 X123.098 Y122.936 I.051 J2.051 E.13917
G1 X122.935 Y123.206 E.01045
G1 X122.48 Y123.15 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5456
G1 X122.347 Y123.29 E.00592
G3 X121.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X121.209 Y120.387 E.00509
G3 X122.572 Y123.048 I.041 J1.659 E.11443
G1 X122.52 Y123.106 E.00239
M204 S10000
; WIPE_START
G1 F24000
G1 X122.347 Y123.29 E-.09595
G1 X122.08 Y123.484 E-.12557
G1 X121.779 Y123.62 E-.12563
G1 X121.457 Y123.694 E-.12564
G1 X121.126 Y123.702 E-.12562
G1 X120.8 Y123.645 E-.12564
G1 X120.712 Y123.61 E-.03594
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.21 J.133 P1  F30000
G1 X122.39 Y108.343 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5456
G1 X122.683 Y108.577 E.01245
G3 X120.995 Y108.01 I-1.433 J1.468 E.36648
G1 X121.199 Y107.994 E.00679
G3 X122.341 Y108.308 I.051 J2.051 E.03987
G1 X122.151 Y108.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5456
G3 X121.044 Y108.399 I-.901 J1.393 E.28473
G1 X121.209 Y108.387 E.00509
G3 X122.1 Y108.621 I.041 J1.659 E.02869
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14825
G1 X122.622 Y109.111 E-.12563
G1 X122.78 Y109.402 E-.12564
G1 X122.877 Y109.718 E-.12563
G1 X122.909 Y110.006 E-.11043
G1 X122.892 Y110.294 E-.10949
G1 X122.882 Y110.332 E-.01494
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.194 J-.237 P1  F30000
G1 X118.852 Y130.649 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5456
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.169 E.94606
G2 X126.464 Y134.946 I16.328 J-6.407 E.18472
G1 X114.492 Y134.946 E.39712
G1 X114.052 Y133.911 E.03729
G3 X116.295 Y130.649 I2.242 J-.861 E.15441
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5456
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88594
G2 X127.327 Y135.338 I15.718 J-6.189 E.19136
G1 X114.233 Y135.338 E.40232
G1 X113.687 Y134.056 E.0428
G3 X116.29 Y130.257 I2.607 J-1.005 E.16635
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.887 J-.833 P1  F30000
G1 X115.764 Y131.07 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5456
G2 X114.515 Y132.041 I.553 J2 E.05384
G1 X116.553 Y134.078 E.0956
G1 X116.892 Y134.078 E.01124
G1 X123.3 Y127.67 E.30062
G1 X123.3 Y125.474 E.07287
G1 X122.108 Y124.282 E.05588
G3 X119.558 Y123.736 I-.852 J-2.248 E.09145
G1 X119.2 Y124.094 E.01678
G1 X119.2 Y129.05 E.16442
G1 X124.229 Y134.078 E.23589
G1 X124.568 Y134.078 E.01124
G1 X125.04 Y133.607 E.02214
G3 X124.208 Y132.207 I14.807 J-9.742 E.054
G1 X123.142 Y123.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F5456
G1 X123.274 Y123.149 E.00149
; LINE_WIDTH: 0.179228
G1 X123.343 Y123.058 E.00126
; LINE_WIDTH: 0.19563
G1 X123.444 Y122.91 E.00224
G1 X123.421 Y122.731 F30000
; LINE_WIDTH: 0.119472
G1 F5456
G3 X123.351 Y123.146 I-8.322 J-1.204 E.00262
G1 X123.422 Y121.359 F30000
; LINE_WIDTH: 0.0969207
G1 F5456
G1 X123.404 Y121.255 E.00047
; LINE_WIDTH: 0.136068
G1 X123.379 Y121.124 E.00101
; LINE_WIDTH: 0.173114
G1 X123.321 Y121.038 E.0011
; LINE_WIDTH: 0.126784
G1 X123.203 Y120.874 E.00138
G1 X121.503 Y119.663 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5456
G3 X122.94 Y120.355 I-.188 J2.229 E.05407
G1 X123.3 Y119.994 E.0169
G1 X123.3 Y117.798 E.07287
G1 X119.2 Y113.698 E.19231
G1 X119.2 Y116.418 E.09021
G1 X123.3 Y112.318 E.19231
G1 X123.3 Y111.781 E.01783
G1 X123.242 Y111.854 E.00308
G1 X123.013 Y111.662 E.00991
G3 X122.479 Y112.108 I-1.37 J-1.098 E.02324
G1 X123.142 Y111.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129166
G1 F5456
G1 X123.274 Y111.149 E.00149
; LINE_WIDTH: 0.179234
G1 X123.343 Y111.058 E.00126
; LINE_WIDTH: 0.195627
G1 X123.444 Y110.91 E.00224
G1 X123.421 Y110.731 F30000
; LINE_WIDTH: 0.119465
G1 F5456
G3 X123.351 Y111.146 I-8.308 J-1.202 E.00262
G1 X123.422 Y109.359 F30000
; LINE_WIDTH: 0.0969205
G1 F5456
G1 X123.404 Y109.255 E.00047
; LINE_WIDTH: 0.136064
G1 X123.379 Y109.124 E.00101
; LINE_WIDTH: 0.173108
G1 X123.321 Y109.038 E.0011
; LINE_WIDTH: 0.126781
G1 X123.203 Y108.874 E.00138
G1 X122.431 Y107.963 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5456
G2 X120.861 Y107.683 I-1.195 J2.16 E.05385
G1 X119.2 Y106.022 E.07791
G1 X119.2 Y108.345 E.07706
G1 X119.278 Y108.256 E.00393
G1 X119.487 Y108.431 E.00907
G3 X119.792 Y108.15 I.848 J.613 E.01385
G1 X123.3 Y104.642 E.16455
G1 X123.3 Y102.446 E.07287
G1 X122.851 Y101.997 E.02105
G1 X121.223 Y101.997 E.05401
G1 X119.358 Y108.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.097392
G1 F5456
G1 X119.294 Y108.854 E.00044
; LINE_WIDTH: 0.11141
G1 X119.226 Y108.944 E.00063
; LINE_WIDTH: 0.147275
G1 X119.153 Y109.041 E.00103
; LINE_WIDTH: 0.181648
G1 X119.056 Y109.183 E.00195
G1 X119.079 Y109.362 F30000
; LINE_WIDTH: 0.119479
G1 F5456
G3 X119.149 Y108.947 I8.327 J1.205 E.00262
G1 X119.078 Y110.734 F30000
; LINE_WIDTH: 0.129188
G1 F5456
G1 X119.096 Y110.839 E.00075
; LINE_WIDTH: 0.161456
G1 X119.115 Y110.943 E.00103
; LINE_WIDTH: 0.148176
G2 X119.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.1114
G1 X119.237 Y111.141 E.00058
; LINE_WIDTH: 0.0973908
G1 X119.297 Y111.22 E.00044
G1 X119.358 Y120.778 F30000
; LINE_WIDTH: 0.0973916
G1 F5456
G1 X119.294 Y120.854 E.00044
; LINE_WIDTH: 0.111402
G1 X119.226 Y120.944 E.00063
; LINE_WIDTH: 0.147267
G1 X119.153 Y121.041 E.00103
; LINE_WIDTH: 0.181639
G1 X119.056 Y121.183 E.00195
G1 X119.079 Y121.362 F30000
; LINE_WIDTH: 0.11947
G1 F5456
G3 X119.149 Y120.947 I8.328 J1.205 E.00262
G1 X119.078 Y122.734 F30000
; LINE_WIDTH: 0.12919
G1 F5456
G1 X119.096 Y122.839 E.00075
; LINE_WIDTH: 0.16146
G1 X119.115 Y122.943 E.00103
; LINE_WIDTH: 0.148194
G2 X119.179 Y123.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111415
G1 X119.237 Y123.141 E.00058
; LINE_WIDTH: 0.0973908
G1 X119.297 Y123.22 E.00044
; WIPE_START
G1 F24000
G1 X119.237 Y123.141 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.133 J-.444 P1  F30000
G1 X114.779 Y134.512 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5456
G1 X125.513 Y134.512 E.40234
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.513 Y134.512 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/63
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
G3 Z8 I.358 J1.163 P1  F30000
G1 X159.864 Y123.311 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6671
G1 X159.607 Y123.584 E.01244
G3 X157.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X158.199 Y119.994 E.00679
G3 X159.901 Y123.264 I.051 J2.051 E.15186
G1 X159.502 Y123.126 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6671
G1 X159.347 Y123.29 E.00692
G3 X158.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X158.209 Y120.387 E.00509
G3 X159.572 Y123.048 I.041 J1.659 E.11443
G1 X159.542 Y123.081 E.00138
M204 S10000
; WIPE_START
G1 F24000
G1 X159.347 Y123.29 E-.10842
G1 X159.08 Y123.484 E-.12557
G1 X158.779 Y123.62 E-.12563
G1 X158.457 Y123.694 E-.12564
G1 X158.126 Y123.702 E-.12563
G1 X157.8 Y123.645 E-.12563
G1 X157.743 Y123.622 E-.02347
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.205 J.167 P1  F30000
G1 X159.39 Y111.75 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6671
G1 X159.363 Y111.77 E.00111
G3 X158.089 Y108 I-1.113 J-1.724 E.24754
G1 X158.206 Y107.995 E.00389
G3 X159.683 Y111.515 I.044 J2.052 E.16269
G1 X159.437 Y111.713 E.01045
G1 X159.201 Y111.401 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6671
G1 X159.15 Y111.441 E.00199
G3 X158.123 Y108.391 I-.9 J-1.394 E.18558
G1 X158.211 Y108.387 E.0027
G3 X159.409 Y111.235 I.039 J1.659 E.122
G1 X159.248 Y111.363 E.00632
M204 S10000
; WIPE_START
G1 F24000
G1 X159.15 Y111.441 E-.04738
G1 X158.857 Y111.592 E-.12561
G1 X158.538 Y111.682 E-.12563
G1 X158.289 Y111.706 E-.09529
G1 X157.962 Y111.682 E-.12464
G1 X157.644 Y111.592 E-.12563
G1 X157.372 Y111.453 E-.11582
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.195 J.228 P1  F30000
G1 X161.04 Y130.649 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6671
G1 X163.205 Y130.649 E.07181
G3 X165.445 Y133.921 I.006 J2.399 E.15483
G3 X165.106 Y134.746 I-15.662 J-5.951 E.02958
G1 X153.204 Y134.746 E.39482
G2 X155.852 Y130.168 I-13.841 J-11.063 E.17607
G1 X155.852 Y101.649 E.94605
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.649 E.96198
G1 X160.98 Y130.649 E.01102
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6671
G1 X163.21 Y130.257 E.06667
G3 X165.812 Y134.06 I.001 J2.791 E.16655
G3 X165.362 Y135.138 I-20.486 J-7.909 E.0359
G1 X152.359 Y135.138 E.39957
G2 X155.46 Y130.089 I-12.843 J-11.367 E.18298
G1 X155.46 Y101.257 E.88594
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.157 J.378 P1  F30000
G1 X163.422 Y131.423 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6671
G3 X164.688 Y132.338 I-.239 J1.662 E.0539
G1 X163.836 Y133.189 E.03993
G1 X161.72 Y133.19 E.07022
G1 X156.608 Y128.077 E.23982
G1 X156.608 Y125.066 E.09988
G1 X157.081 Y124.593 E.02219
G2 X159.086 Y124.726 I1.167 J-2.421 E.06833
G1 X159.893 Y124.542 E.02744
G1 X159.893 Y129.457 E.16306
G1 X156.16 Y133.19 E.17512
G1 X155.228 Y133.19 E.03091
G3 X155.556 Y132.576 I97.216 J51.47 E.02311
G1 X154.072 Y134.312 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6671
G1 X164.756 Y134.312 E.40045
; WIPE_START
G1 F24000
G1 X162.756 Y134.312 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.199 J-.209 P1  F30000
G1 X160.3 Y120.223 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6671
G1 X160.3 Y111.811 E.27904
G1 X158.922 Y112.351 E.0491
G3 X157.173 Y112.192 I-.657 J-2.467 E.05947
G1 X156.2 Y111.811 E.03465
G1 X156.2 Y120.062 E.27371
G3 X158.147 Y119.658 I3.169 J10.365 E.06604
G1 X158.147 Y119.658 E0
G3 X158.52 Y119.666 I.165 J.927 E.01248
G1 X158.52 Y119.666 E0
G3 X159.324 Y119.9 I-.175 J2.105 E.02796
G1 X160.3 Y120.283 E.03476
G1 X160.203 Y120.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126785
G1 F6671
G1 X160.321 Y121.038 E.00138
; LINE_WIDTH: 0.173116
G1 X160.379 Y121.124 E.0011
; LINE_WIDTH: 0.136069
G1 X160.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969208
G1 X160.422 Y121.359 E.00047
G1 X160.345 Y123.151 F30000
; LINE_WIDTH: 0.143973
G1 F6671
G2 X160.422 Y122.734 I-12.429 J-2.497 E.00349
G1 X160.444 Y122.911 F30000
; LINE_WIDTH: 0.195651
G1 F6671
G1 X160.341 Y123.062 E.00228
; LINE_WIDTH: 0.17799
G1 X160.273 Y123.151 E.00123
; LINE_WIDTH: 0.128678
G1 X160.142 Y123.315 E.00147
G1 X157.599 Y124.36 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6671
G2 X158.995 Y124.329 I.641 J-2.596 E.04687
G1 X160.3 Y124.031 E.04438
G1 X160.3 Y130.997 E.23107
G3 X163.611 Y131.042 I.329 J96.832 E.10985
G3 X165.175 Y133.596 I-.41 J2.007 E.11142
G1 X154.55 Y133.597 E.35247
G2 X155.48 Y131.851 I-254.675 J-136.861 E.06563
G2 X156.2 Y130.239 I-16.898 J-8.513 E.0586
G1 X156.2 Y123.811 E.21324
G1 X157.543 Y124.338 E.04786
G1 X156.297 Y123.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F6671
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111403
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148184
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.12919
G1 X156.078 Y122.734 E.00075
G1 X156.155 Y120.942 F30000
; LINE_WIDTH: 0.143964
G1 F6671
G2 X156.078 Y121.359 I12.473 J2.505 E.00349
G1 X156.056 Y121.182 F30000
; LINE_WIDTH: 0.180116
G1 F6671
G1 X156.156 Y121.037 E.00198
; LINE_WIDTH: 0.146455
G1 X156.227 Y120.943 E.00099
; LINE_WIDTH: 0.111418
G1 X156.294 Y120.854 E.00062
; LINE_WIDTH: 0.0973918
G1 X156.358 Y120.778 E.00044
G1 X156.608 Y119.019 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6671
G1 X156.608 Y117.391 E.05401
G1 X159.893 Y114.105 E.15411
G1 X159.893 Y116.011 E.0632
M73 P89 R2
G1 X156.608 Y112.726 E.15411
G1 X156.608 Y112.408 E.01054
G1 X157.024 Y112.571 E.01485
G2 X157.847 Y112.817 I1.019 J-1.913 E.02868
G1 X156.297 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973912
G1 F6671
G1 X156.237 Y111.141 E.00044
; LINE_WIDTH: 0.111404
G1 X156.179 Y111.055 E.00058
; LINE_WIDTH: 0.148185
G3 X156.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161446
G1 X156.096 Y110.839 E.00103
; LINE_WIDTH: 0.129183
G1 X156.078 Y110.734 E.00075
G1 X156.078 Y109.359 F30000
; LINE_WIDTH: 0.129185
G1 F6671
G1 X156.096 Y109.255 E.00075
; LINE_WIDTH: 0.161449
G1 X156.115 Y109.15 E.00103
; LINE_WIDTH: 0.148188
G3 X156.179 Y109.038 I.185 J.032 E.00113
; LINE_WIDTH: 0.111404
G1 X156.237 Y108.952 E.00058
; LINE_WIDTH: 0.0973917
G1 X156.297 Y108.874 E.00044
; WIPE_START
G1 F24000
G1 X156.237 Y108.952 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.604 J1.057 P1  F30000
G1 X160.203 Y111.22 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.126783
G1 F6671
G1 X160.321 Y111.055 E.00138
; LINE_WIDTH: 0.173113
G1 X160.379 Y110.97 E.0011
; LINE_WIDTH: 0.136067
G1 X160.404 Y110.839 E.00101
; LINE_WIDTH: 0.0969204
G1 X160.422 Y110.734 E.00047
G1 X160.422 Y109.359 F30000
; LINE_WIDTH: 0.0969202
G1 F6671
G1 X160.404 Y109.255 E.00047
; LINE_WIDTH: 0.136067
G1 X160.379 Y109.124 E.00101
; LINE_WIDTH: 0.173114
G1 X160.321 Y109.038 E.0011
; LINE_WIDTH: 0.126784
G1 X160.203 Y108.874 E.00138
G1 X160.3 Y108.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6671
G1 X159.254 Y107.872 E.03726
G2 X157.173 Y107.901 I-1.011 J2.143 E.07149
G1 X156.2 Y108.283 E.03465
G1 X156.2 Y102.131 E.20405
G1 X160.3 Y102.131 E.13598
G1 X160.3 Y108.223 E.20206
G1 X159.893 Y104.801 F30000
G1 F6671
G1 X159.893 Y106.429 E.05401
G1 X158.987 Y107.335 E.0425
G1 X158.873 Y107.315 E.00382
G1 X156.608 Y105.05 E.10629
G1 X156.608 Y103.421 E.05401
; WIPE_START
G1 F24000
G1 X156.608 Y105.05 E-.61876
G1 X156.87 Y105.312 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.569 J-1.076 P1  F30000
G1 X122.864 Y123.311 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6671
G1 X122.607 Y123.584 E.01244
G3 X120.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X121.199 Y119.994 E.00679
G3 X122.901 Y123.264 I.051 J2.051 E.15186
G1 X122.502 Y123.126 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6671
G1 X122.347 Y123.29 E.00692
G3 X121.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X121.209 Y120.387 E.00509
G3 X122.572 Y123.048 I.041 J1.659 E.11443
G1 X122.542 Y123.081 E.00138
M204 S10000
; WIPE_START
G1 F24000
G1 X122.347 Y123.29 E-.10842
G1 X122.08 Y123.484 E-.12557
G1 X121.779 Y123.62 E-.12563
G1 X121.457 Y123.694 E-.12564
G1 X121.126 Y123.702 E-.12563
G1 X120.8 Y123.645 E-.12563
G1 X120.743 Y123.622 E-.02347
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.21 J.126 P1  F30000
G1 X122.334 Y108.307 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6671
G1 X122.364 Y108.323 E.00111
G3 X121.089 Y108 I-1.114 J1.724 E.38331
G1 X121.206 Y107.995 E.00389
G3 X122 Y108.136 I.044 J2.052 E.02691
G1 X122.281 Y108.28 E.01046
G1 X122.151 Y108.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6671
G3 X121.123 Y108.391 I-.901 J1.394 E.28731
G1 X121.211 Y108.387 E.0027
G3 X122.1 Y108.621 I.039 J1.659 E.0286
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14825
G1 X122.622 Y109.111 E-.12563
G1 X122.78 Y109.402 E-.12564
G1 X122.877 Y109.718 E-.12563
G1 X122.91 Y110.047 E-.12564
G1 X122.882 Y110.333 E-.10921
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.194 J-.237 P1  F30000
G1 X118.852 Y130.649 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6671
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.168 E.94605
G2 X126.302 Y134.746 I16.303 J-6.394 E.17617
G1 X114.407 Y134.746 E.39456
G1 X114.054 Y133.917 E.02987
G3 X116.295 Y130.649 I2.235 J-.87 E.1547
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6671
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88594
G2 X127.146 Y135.138 I15.707 J-6.184 E.18309
G1 X114.148 Y135.138 E.3994
G1 X113.688 Y134.058 E.03605
G3 X116.29 Y130.257 I2.602 J-1.011 E.16651
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.981 J-.721 P1  F30000
G1 X116.078 Y131.423 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6671
G2 X114.846 Y132.281 I.211 J1.617 E.05178
G1 X114.812 Y132.338 E.00218
G1 X115.664 Y133.19 E.04
G1 X117.78 Y133.19 E.07018
G1 X119.607 Y131.404 E.08477
G1 X122.893 Y128.077 E.15509
G1 X122.893 Y125.066 E.09988
G1 X122.465 Y124.639 E.02005
G3 X119.607 Y124.408 I-1.174 J-3.264 E.09805
G1 X119.607 Y129.457 E.1675
G1 X123.34 Y133.19 E.17512
G1 X124.272 Y133.19 E.03091
G2 X123.944 Y132.576 I-96.531 J51.104 E.02311
G1 X120.599 Y124.36 F30000
G1 F6671
G2 X121.995 Y124.329 I.641 J-2.596 E.04687
G1 X123.3 Y124.031 E.04438
G1 X123.3 Y130.239 E.20593
G1 X123.376 Y130.42 E.00653
G2 X124.95 Y133.597 I24.314 J-10.068 E.1177
G1 X114.324 Y133.597 E.35249
G3 X116.153 Y131.008 I1.973 J-.547 E.12025
G3 X119.2 Y130.997 I2.899 J370.743 E.1011
G1 X119.2 Y123.811 E.23838
G1 X120.543 Y124.338 E.04786
G1 X119.297 Y123.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973919
G1 F6671
G1 X119.237 Y123.141 E.00044
; LINE_WIDTH: 0.11141
G1 X119.179 Y123.055 E.00058
; LINE_WIDTH: 0.148191
M73 P89 R1
G3 X119.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161462
G1 X119.096 Y122.839 E.00103
; LINE_WIDTH: 0.129192
G1 X119.078 Y122.734 E.00075
G1 X119.078 Y121.359 F30000
; LINE_WIDTH: 0.143968
G1 F6671
G3 X119.155 Y120.942 I12.496 J2.078 E.00349
G1 X119.227 Y120.943 F30000
; LINE_WIDTH: 0.11142
G1 F6671
G1 X119.294 Y120.854 E.00062
; LINE_WIDTH: 0.0973917
G1 X119.358 Y120.778 E.00044
G1 X119.227 Y120.943 F30000
; LINE_WIDTH: 0.146457
G1 F6671
G1 X119.156 Y121.037 E.00099
; LINE_WIDTH: 0.180119
G1 X119.056 Y121.182 E.00198
; WIPE_START
G1 F24000
G1 X119.156 Y121.037 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.049 J1.216 P1  F30000
G1 X123.203 Y120.874 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.126784
G1 F6671
G1 X123.321 Y121.038 E.00138
; LINE_WIDTH: 0.173114
G1 X123.379 Y121.124 E.0011
; LINE_WIDTH: 0.136068
G1 X123.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969208
G1 X123.422 Y121.359 E.00047
G1 X123.3 Y120.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6671
G1 X122.297 Y119.889 E.03572
G2 X121.52 Y119.666 I-.94 J1.811 E.027
G1 X121.52 Y119.666 E0
G2 X121.147 Y119.658 I-.209 J.918 E.01248
G1 X121.147 Y119.658 E0
G2 X119.2 Y120.062 I1.223 J10.769 E.06604
G1 X119.2 Y111.811 E.27371
G1 X120.173 Y112.192 E.03465
G2 X121.922 Y112.351 I1.092 J-2.308 E.05947
G1 X123.3 Y111.811 E.0491
G1 X123.3 Y120.223 E.27904
G1 X122.893 Y119.019 F30000
G1 F6671
G1 X122.893 Y117.391 E.05401
G1 X119.607 Y114.105 E.15411
G1 X119.607 Y116.011 E.0632
G1 X122.893 Y112.726 E.15411
G1 X122.893 Y112.408 E.01055
G3 X121.654 Y112.823 I-1.941 J-3.728 E.0435
G1 X123.203 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12678
G1 F6671
G1 X123.321 Y111.055 E.00138
; LINE_WIDTH: 0.173107
G1 X123.379 Y110.97 E.0011
; LINE_WIDTH: 0.136064
G1 X123.404 Y110.839 E.00101
; LINE_WIDTH: 0.0969204
G1 X123.422 Y110.734 E.00047
G1 X123.422 Y109.359 F30000
; LINE_WIDTH: 0.0969202
G1 F6671
G1 X123.404 Y109.255 E.00047
; LINE_WIDTH: 0.136065
G1 X123.379 Y109.124 E.00101
; LINE_WIDTH: 0.173108
G1 X123.321 Y109.038 E.0011
; LINE_WIDTH: 0.126781
G1 X123.203 Y108.874 E.00138
G1 X123.3 Y108.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6671
G1 X122.153 Y107.832 E.04087
G2 X120.173 Y107.901 I-.916 J2.16 E.06785
G1 X119.2 Y108.283 E.03465
G1 X119.2 Y102.131 E.20405
G1 X123.3 Y102.131 E.13598
G1 X123.3 Y108.223 E.20206
G1 X119.297 Y108.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F6671
G1 X119.237 Y108.953 E.00044
; LINE_WIDTH: 0.111402
G1 X119.179 Y109.038 E.00058
; LINE_WIDTH: 0.148184
G2 X119.115 Y109.15 I.121 J.144 E.00113
; LINE_WIDTH: 0.161453
G1 X119.096 Y109.255 E.00103
; LINE_WIDTH: 0.129187
G1 X119.078 Y109.359 E.00075
G1 X119.078 Y110.734 F30000
; LINE_WIDTH: 0.129185
G1 F6671
G1 X119.096 Y110.839 E.00075
; LINE_WIDTH: 0.16145
G1 X119.115 Y110.943 E.00103
; LINE_WIDTH: 0.148181
G2 X119.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111399
G1 X119.237 Y111.141 E.00058
; LINE_WIDTH: 0.097391
G1 X119.297 Y111.22 E.00044
G1 X119.607 Y104.801 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6671
G1 X119.607 Y106.429 E.05401
G1 X120.514 Y107.335 E.0425
G1 X120.629 Y107.313 E.0039
G1 X122.893 Y105.05 E.1062
G1 X122.893 Y103.421 E.05401
G1 X123.422 Y122.734 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.143969
G1 F6671
G3 X123.345 Y123.151 I-12.514 J-2.081 E.00349
G1 X123.273 Y123.151 F30000
; LINE_WIDTH: 0.128676
G1 F6671
G1 X123.142 Y123.315 E.00147
G1 X123.273 Y123.151 F30000
; LINE_WIDTH: 0.177988
G1 F6671
G1 X123.341 Y123.062 E.00123
; LINE_WIDTH: 0.195649
G1 X123.444 Y122.911 E.00228
; WIPE_START
G1 F24000
G1 X123.341 Y123.062 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.965 J-.742 P1  F30000
G1 X114.694 Y134.312 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6671
G1 X125.364 Y134.312 E.39994
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.364 Y134.312 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/63
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
G3 Z8.2 I.351 J1.165 P1  F30000
G1 X159.864 Y123.311 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6643
G1 X159.607 Y123.584 E.01244
G3 X157.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X158.199 Y119.994 E.00679
G3 X159.901 Y123.264 I.051 J2.051 E.15186
G1 X159.526 Y123.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6643
G1 X159.347 Y123.29 E.00801
G3 X158.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X158.209 Y120.387 E.00509
G3 X159.572 Y123.048 I.041 J1.659 E.11443
G1 X159.566 Y123.055 E.00029
M204 S10000
; WIPE_START
G1 F24000
G1 X159.347 Y123.29 E-.12185
G1 X159.08 Y123.484 E-.12557
G1 X158.779 Y123.62 E-.12563
G1 X158.457 Y123.694 E-.12564
G1 X158.126 Y123.702 E-.12563
G1 X157.8 Y123.645 E-.12564
G1 X157.776 Y123.635 E-.01004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.205 J.171 P1  F30000
G1 X159.474 Y111.691 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6643
G1 X159.447 Y111.711 E.00111
G3 X157.995 Y108.01 I-1.197 J-1.666 E.24771
G1 X158.199 Y107.994 E.00679
G3 X159.753 Y111.441 I.051 J2.051 E.15952
G1 X159.518 Y111.651 E.01045
G1 X159.207 Y111.401 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6643
G1 X158.932 Y111.558 E.00973
G3 X158.044 Y108.399 I-.682 J-1.513 E.17541
G1 X158.209 Y108.387 E.00509
G3 X159.255 Y111.366 I.041 J1.659 E.12825
M204 S10000
; WIPE_START
G1 F24000
G1 X158.932 Y111.558 E-.14296
G1 X158.62 Y111.665 E-.12556
G1 X158.291 Y111.706 E-.12563
G1 X157.962 Y111.682 E-.12564
G1 X157.644 Y111.592 E-.12563
G1 X157.375 Y111.455 E-.11458
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.195 J.228 P1  F30000
G1 X161.04 Y130.649 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6643
G1 X163.205 Y130.649 E.07181
G3 X165.447 Y133.917 I.001 J2.402 E.15459
G1 X165.19 Y134.546 E.02253
G1 X153.368 Y134.546 E.39217
G2 X155.852 Y130.168 I-14.044 J-10.864 E.16751
G1 X155.852 Y101.649 E.94605
G1 X160.648 Y101.649 E.15909
G1 X160.648 Y130.649 E.96198
G1 X160.98 Y130.649 E.01102
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6643
G1 X163.21 Y130.257 E.06667
G3 X165.812 Y134.058 I-.004 J2.795 E.1664
G3 X165.451 Y134.938 I-16.704 J-6.341 E.02922
G1 X152.534 Y134.938 E.39693
G2 X155.46 Y130.089 I-12.844 J-11.06 E.17483
G1 X155.46 Y101.257 E.88594
G1 X161.04 Y101.257 E.17146
G1 X161.04 Y130.197 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.156 J.379 P1  F30000
G1 X163.424 Y131.423 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6643
G3 X164.685 Y132.341 I-.198 J1.599 E.05403
G1 X163.836 Y133.189 E.03982
G1 X161.72 Y133.19 E.07022
G1 X156.608 Y128.077 E.23982
G1 X156.608 Y125.066 E.09988
G1 X157.081 Y124.593 E.02219
G2 X159.086 Y124.726 I1.176 J-2.562 E.06817
G1 X159.893 Y124.542 E.02744
G1 X159.893 Y129.457 E.16306
G1 X156.16 Y133.19 E.17512
G1 X155.228 Y133.19 E.03091
G3 X155.556 Y132.576 I104.185 J55.2 E.02311
G1 X154.221 Y134.112 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6643
G1 X164.838 Y134.112 E.39793
; WIPE_START
G1 F24000
G1 X162.838 Y134.112 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.197 J-.219 P1  F30000
G1 X160.3 Y120.223 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6643
G1 X160.3 Y111.811 E.27904
G1 X159.179 Y112.251 E.03994
G3 X157.173 Y112.192 I-.943 J-2.109 E.06887
G1 X156.2 Y111.811 E.03465
G1 X156.2 Y120.062 E.27371
G1 X157.505 Y119.764 E.04438
G3 X158.771 Y119.711 I.739 J2.461 E.04249
G1 X158.771 Y119.711 E0
G3 X159.327 Y119.901 I-.192 J1.471 E.01963
G1 X160.3 Y120.283 E.03465
G1 X160.203 Y120.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126784
G1 F6643
G1 X160.321 Y121.038 E.00138
; LINE_WIDTH: 0.173114
G1 X160.379 Y121.124 E.0011
; LINE_WIDTH: 0.136068
G1 X160.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969203
G1 X160.422 Y121.359 E.00047
G1 X160.351 Y123.146 F30000
; LINE_WIDTH: 0.119473
G1 F6643
G2 X160.421 Y122.731 I-8.147 J-1.603 E.00262
G1 X160.444 Y122.91 F30000
; LINE_WIDTH: 0.195639
G1 F6643
G1 X160.343 Y123.058 E.00224
; LINE_WIDTH: 0.179229
G1 X160.274 Y123.149 E.00126
; LINE_WIDTH: 0.129166
G1 X160.142 Y123.315 E.00149
G1 X157.599 Y124.36 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6643
G2 X158.995 Y124.329 I.641 J-2.596 E.04687
G1 X160.3 Y124.031 E.04438
G1 X160.3 Y130.997 E.23107
G3 X163.611 Y131.042 I.331 J96.666 E.10986
G3 X165.175 Y133.596 I-.391 J1.995 E.11168
G1 X154.55 Y133.597 E.35247
G2 X155.481 Y131.85 I-269.319 J-144.667 E.06568
G2 X156.2 Y130.239 I-16.939 J-8.529 E.05855
G1 X156.2 Y123.811 E.21324
G1 X157.543 Y124.338 E.04786
G1 X156.297 Y123.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F6643
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111405
M73 P90 R1
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148185
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.12919
G1 X156.078 Y122.734 E.00075
G1 X156.149 Y120.947 F30000
; LINE_WIDTH: 0.119475
G1 F6643
G2 X156.079 Y121.362 I8.164 J1.606 E.00262
G1 X156.056 Y121.183 F30000
; LINE_WIDTH: 0.181641
G1 F6643
G1 X156.153 Y121.041 E.00195
; LINE_WIDTH: 0.147271
G1 X156.226 Y120.944 E.00103
; LINE_WIDTH: 0.111408
G1 X156.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973917
G1 X156.358 Y120.778 E.00044
G1 X156.608 Y119.019 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6643
G1 X156.608 Y117.391 E.05401
G1 X159.893 Y114.105 E.15411
G1 X159.893 Y116.011 E.0632
G1 X156.608 Y112.726 E.15411
G1 X156.608 Y112.408 E.01054
G1 X157.024 Y112.571 E.01485
G2 X157.847 Y112.817 I1.019 J-1.913 E.02868
G1 X156.297 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973907
G1 F6643
G1 X156.237 Y111.141 E.00044
; LINE_WIDTH: 0.111401
G1 X156.179 Y111.055 E.00058
; LINE_WIDTH: 0.148178
G3 X156.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X156.096 Y110.839 E.00103
; LINE_WIDTH: 0.129188
G1 X156.078 Y110.734 E.00075
G1 X156.149 Y108.947 F30000
; LINE_WIDTH: 0.119464
G1 F6643
G2 X156.079 Y109.362 I8.265 J1.621 E.00262
G1 X156.056 Y109.183 F30000
; LINE_WIDTH: 0.181639
G1 F6643
G1 X156.153 Y109.041 E.00195
; LINE_WIDTH: 0.147266
G1 X156.226 Y108.944 E.00103
; LINE_WIDTH: 0.111399
G1 X156.294 Y108.854 E.00063
; LINE_WIDTH: 0.0973917
G1 X156.358 Y108.778 E.00044
G1 X157.755 Y107.603 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.536176
G1 F6643
G1 X157.984 Y107.582 E.00926
G1 X160.3 Y108.223 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6643
G1 X160.3 Y102.131 E.20206
G1 X156.2 Y102.131 E.13598
G1 X156.2 Y108.283 E.20405
G1 X157.27 Y107.863 E.03811
G1 X157.26 Y107.47 E.01305
G1 X157.557 Y107.157 E.0143
G1 X158.444 Y107.135 E.02942
G1 X158.483 Y107.66 E.01745
G3 X158.979 Y107.764 I-.479 J3.508 E.01683
G1 X160.3 Y108.283 E.04706
G1 X160.203 Y108.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126781
G1 F6643
G1 X160.321 Y109.038 E.00138
; LINE_WIDTH: 0.173109
G1 X160.379 Y109.124 E.0011
; LINE_WIDTH: 0.136065
G1 X160.404 Y109.255 E.00101
; LINE_WIDTH: 0.0969203
G1 X160.422 Y109.359 E.00047
G1 X160.351 Y111.146 F30000
; LINE_WIDTH: 0.119472
G1 F6643
G2 X160.421 Y110.731 I-8.244 J-1.617 E.00262
G1 X160.444 Y110.91 F30000
; LINE_WIDTH: 0.195638
G1 F6643
G1 X160.343 Y111.058 E.00224
; LINE_WIDTH: 0.179226
G1 X160.274 Y111.149 E.00126
; LINE_WIDTH: 0.129164
G1 X160.142 Y111.315 E.00149
G1 X159.893 Y104.801 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6643
G1 X159.893 Y106.429 E.05401
G1 X158.987 Y107.335 E.0425
G3 X158.865 Y107.307 I-.041 J-.101 E.00442
G1 X158.821 Y106.719 E.01957
G1 X158.29 Y106.732 E.01762
G1 X156.608 Y105.05 E.07892
G1 X156.608 Y103.421 E.05401
; WIPE_START
G1 F24000
G1 X156.608 Y105.05 E-.61876
G1 X156.87 Y105.312 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.569 J-1.076 P1  F30000
G1 X122.864 Y123.311 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6643
G1 X122.607 Y123.584 E.01244
G3 X120.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X121.199 Y119.994 E.00679
G3 X122.901 Y123.264 I.051 J2.051 E.15186
G1 X122.526 Y123.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6643
G1 X122.347 Y123.29 E.00801
G3 X121.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X121.209 Y120.387 E.00509
G3 X122.572 Y123.048 I.041 J1.659 E.11443
G1 X122.566 Y123.055 E.00029
M204 S10000
; WIPE_START
G1 F24000
G1 X122.347 Y123.29 E-.12185
G1 X122.08 Y123.484 E-.12557
G1 X121.779 Y123.62 E-.12563
G1 X121.457 Y123.694 E-.12564
G1 X121.126 Y123.702 E-.12563
G1 X120.8 Y123.645 E-.12564
G1 X120.776 Y123.635 E-.01004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.211 J.123 P1  F30000
G1 X122.334 Y108.307 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6643
G1 X122.364 Y108.322 E.00111
G3 X120.995 Y108.01 I-1.114 J1.723 E.38006
G1 X121.199 Y107.994 E.00679
G3 X122 Y108.136 I.051 J2.051 E.02717
G1 X122.281 Y108.28 E.01046
G1 X122.151 Y108.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6643
G3 X121.044 Y108.399 I-.901 J1.393 E.28473
G1 X121.209 Y108.387 E.00509
G3 X122.1 Y108.621 I.041 J1.659 E.02869
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14825
G1 X122.622 Y109.111 E-.12564
G1 X122.78 Y109.402 E-.12563
G1 X122.877 Y109.718 E-.12563
G1 X122.91 Y110.016 E-.11419
G1 X122.892 Y110.294 E-.10573
G1 X122.882 Y110.332 E-.01494
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.194 J-.237 P1  F30000
G1 X118.852 Y130.649 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6643
G1 X118.852 Y101.649 E.96198
G1 X123.648 Y101.649 E.15909
G1 X123.648 Y130.168 E.94605
G2 X126.132 Y134.546 I16.528 J-6.487 E.16751
G1 X114.322 Y134.546 E.39177
G3 X113.937 Y133.517 I4.347 J-2.213 E.03651
G3 X116.295 Y130.649 I2.357 J-.465 E.14077
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6643
G1 X118.46 Y101.257 E.89109
G1 X124.04 Y101.257 E.17146
G1 X124.04 Y130.089 E.88594
G2 X126.966 Y134.938 I15.775 J-6.213 E.17483
G1 X114.063 Y134.938 E.39649
G1 X113.688 Y134.059 E.02936
G3 X116.29 Y130.257 I2.602 J-1.011 E.16652
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.981 J-.721 P1  F30000
G1 X116.078 Y131.423 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6643
G2 X114.813 Y132.338 I.274 J1.711 E.05376
G1 X115.664 Y133.19 E.03996
G1 X117.78 Y133.19 E.07018
G1 X119.607 Y131.404 E.08477
G1 X122.893 Y128.077 E.15509
G1 X122.893 Y125.066 E.09988
G1 X122.465 Y124.639 E.02005
G3 X120.316 Y124.686 I-1.142 J-3.086 E.07264
G1 X119.607 Y124.408 E.02526
G1 X119.607 Y129.457 E.1675
G1 X123.34 Y133.19 E.17512
G1 X124.272 Y133.19 E.03091
G2 X123.944 Y132.576 I-103.459 J54.812 E.02311
G1 X120.465 Y124.307 F30000
G1 F6643
G2 X121.995 Y124.329 I.799 J-2.374 E.0516
G1 X123.3 Y124.031 E.04438
G1 X123.3 Y130.239 E.20592
G1 X123.746 Y131.28 E.03756
G2 X124.95 Y133.597 I26.846 J-12.475 E.08667
G1 X114.324 Y133.597 E.35249
G3 X116.153 Y131.008 I1.972 J-.547 E.12026
G3 X119.2 Y130.997 I2.899 J370.755 E.1011
G1 X119.2 Y123.811 E.23838
G1 X120.409 Y124.285 E.04307
G1 X119.297 Y123.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F6643
G1 X119.237 Y123.141 E.00044
; LINE_WIDTH: 0.111405
G1 X119.179 Y123.055 E.00058
; LINE_WIDTH: 0.148185
G3 X119.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161462
G1 X119.096 Y122.839 E.00103
; LINE_WIDTH: 0.129192
G1 X119.078 Y122.734 E.00075
G1 X119.079 Y121.362 F30000
; LINE_WIDTH: 0.119479
G1 F6643
G3 X119.149 Y120.947 I8.245 J1.192 E.00262
G1 X119.226 Y120.944 F30000
; LINE_WIDTH: 0.147273
G1 F6643
G1 X119.153 Y121.041 E.00103
; LINE_WIDTH: 0.181644
G1 X119.056 Y121.183 E.00195
G1 X119.226 Y120.944 F30000
; LINE_WIDTH: 0.111411
G1 F6643
G1 X119.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973916
G1 X119.358 Y120.778 E.00044
; WIPE_START
G1 F24000
G1 X119.294 Y120.854 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.006 J1.217 P1  F30000
G1 X123.203 Y120.874 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.126781
G1 F6643
G1 X123.321 Y121.038 E.00138
; LINE_WIDTH: 0.17311
G1 X123.379 Y121.124 E.0011
; LINE_WIDTH: 0.136066
G1 X123.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969201
G1 X123.422 Y121.359 E.00047
G1 X123.3 Y120.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6643
G1 X122.327 Y119.901 E.03465
G2 X121.771 Y119.711 I-.749 J1.281 E.01963
G1 X121.771 Y119.711 E0
G2 X120.505 Y119.764 I-.528 J2.515 E.04249
G1 X119.2 Y120.062 E.04438
G1 X119.2 Y111.811 E.27371
G1 X120.173 Y112.192 E.03465
G2 X122.179 Y112.251 I1.063 J-2.051 E.06887
G1 X123.3 Y111.811 E.03994
G1 X123.3 Y120.223 E.27904
G1 X122.893 Y119.019 F30000
G1 F6643
G1 X122.893 Y117.391 E.05401
G1 X119.607 Y114.105 E.15411
G1 X119.607 Y116.011 E.0632
G1 X122.893 Y112.726 E.15411
G1 X122.893 Y112.408 E.01054
G3 X122.077 Y112.728 I-4.687 J-10.739 E.02906
G3 X121.655 Y112.824 I-1.349 J-4.937 E.01436
G1 X123.142 Y111.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129164
G1 F6643
G1 X123.274 Y111.149 E.00149
; LINE_WIDTH: 0.179224
G1 X123.343 Y111.058 E.00126
; LINE_WIDTH: 0.195637
G1 X123.444 Y110.91 E.00224
G1 X123.421 Y110.731 F30000
; LINE_WIDTH: 0.119468
G1 F6643
G3 X123.351 Y111.146 I-8.319 J-1.204 E.00262
G1 X123.422 Y109.359 F30000
; LINE_WIDTH: 0.0969203
G1 F6643
G1 X123.404 Y109.255 E.00047
; LINE_WIDTH: 0.136064
G1 X123.379 Y109.124 E.00101
; LINE_WIDTH: 0.173108
G1 X123.321 Y109.038 E.0011
; LINE_WIDTH: 0.126781
G1 X123.203 Y108.874 E.00138
G1 X123.3 Y108.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6643
G1 X122.327 Y107.901 E.03465
G2 X121.483 Y107.66 I-1.223 J2.683 E.02923
G1 X121.444 Y107.135 E.01745
G1 X120.557 Y107.157 E.02942
G1 X120.26 Y107.47 E.0143
G1 X120.27 Y107.863 E.01305
G1 X119.2 Y108.283 E.03811
G1 X119.2 Y102.131 E.20405
G1 X123.3 Y102.131 E.13598
G1 X123.3 Y108.223 E.20206
G1 X120.755 Y107.603 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.536176
G1 F6643
G1 X120.984 Y107.582 E.00926
G1 X119.358 Y108.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F6643
G1 X119.294 Y108.854 E.00044
; LINE_WIDTH: 0.111402
G1 X119.226 Y108.944 E.00063
; LINE_WIDTH: 0.147268
G1 X119.153 Y109.041 E.00103
; LINE_WIDTH: 0.181641
G1 X119.056 Y109.183 E.00195
G1 X119.079 Y109.362 F30000
; LINE_WIDTH: 0.119468
G1 F6643
G3 X119.149 Y108.947 I8.313 J1.203 E.00262
G1 X119.078 Y110.734 F30000
; LINE_WIDTH: 0.12919
G1 F6643
G1 X119.096 Y110.839 E.00075
; LINE_WIDTH: 0.16146
G1 X119.115 Y110.943 E.00103
; LINE_WIDTH: 0.148181
G2 X119.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111405
G1 X119.237 Y111.141 E.00058
; LINE_WIDTH: 0.0973909
G1 X119.297 Y111.22 E.00044
G1 X119.607 Y104.801 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6643
G1 X119.607 Y106.429 E.05401
G1 X120.161 Y106.983 E.02597
G1 X120.379 Y106.755 E.01046
G1 X121.208 Y106.734 E.02753
G1 X122.893 Y105.05 E.07902
G1 X122.893 Y103.421 E.05401
G1 X123.421 Y122.731 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.11947
G1 F6643
G3 X123.351 Y123.146 I-8.322 J-1.204 E.00262
G1 X123.274 Y123.149 F30000
; LINE_WIDTH: 0.129166
G1 F6643
G1 X123.142 Y123.315 E.00149
G1 X123.274 Y123.149 F30000
; LINE_WIDTH: 0.179227
G1 F6643
G1 X123.343 Y123.058 E.00126
; LINE_WIDTH: 0.195637
G1 X123.444 Y122.91 E.00224
; WIPE_START
G1 F24000
G1 X123.343 Y123.058 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.955 J-.755 P1  F30000
G1 X114.608 Y134.112 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6643
G1 X125.219 Y134.112 E.39772
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.219 Y134.112 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/63
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
G3 Z8.4 I1.216 J-.038 P1  F30000
G1 X122.878 Y123.28 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6494
G1 X122.753 Y123.441 E.00677
G3 X120.995 Y120.01 I-1.503 J-1.396 E.26128
G1 X121.199 Y119.994 E.00679
G3 X123 Y123.116 I.051 J2.051 E.14596
G1 X122.914 Y123.232 E.00478
G1 X122.549 Y123.076 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6494
G1 X122.347 Y123.29 E.00903
G3 X121.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X121.209 Y120.387 E.00509
G3 X122.586 Y123.029 I.041 J1.659 E.11371
M204 S10000
; WIPE_START
G1 F24000
G1 X122.347 Y123.29 E-.13436
G1 X122.08 Y123.484 E-.12556
G1 X121.779 Y123.62 E-.12564
G1 X121.457 Y123.694 E-.12564
G1 X121.126 Y123.702 E-.12563
G1 X120.807 Y123.646 E-.12316
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.211 J.121 P1  F30000
G1 X122.334 Y108.307 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6494
G1 X122.364 Y108.322 E.00111
G3 X120.995 Y108.01 I-1.114 J1.723 E.38006
G1 X121.199 Y107.994 E.00679
G3 X122 Y108.136 I.051 J2.051 E.02717
G1 X122.281 Y108.28 E.01046
G1 X122.151 Y108.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6494
G3 X121.044 Y108.399 I-.901 J1.393 E.28473
G1 X121.209 Y108.387 E.00509
G3 X122.1 Y108.621 I.041 J1.659 E.02869
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14825
G1 X122.622 Y109.111 E-.12564
G1 X122.78 Y109.402 E-.12563
G1 X122.877 Y109.718 E-.12563
G1 X122.91 Y110.021 E-.11608
G1 X122.892 Y110.294 E-.10384
G1 X122.882 Y110.332 E-.01493
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.194 J-.237 P1  F30000
G1 X118.852 Y130.649 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6494
G1 X118.852 Y101.654 E.96182
G1 X123.648 Y101.654 E.15909
G1 X123.648 Y130.168 E.94589
G2 X125.983 Y134.346 I16.406 J-6.431 E.15924
G1 X114.237 Y134.346 E.38967
G3 X113.893 Y132.929 I2.705 J-1.406 E.04882
G3 X116.295 Y130.649 I2.397 J.119 E.12126
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6494
G1 X118.46 Y101.262 E.89093
G1 X124.04 Y101.262 E.17146
G1 X124.04 Y130.089 E.88579
G2 X126.8 Y134.738 I15.907 J-6.3 E.16681
G1 X113.978 Y134.738 E.39399
G3 X113.613 Y133.841 I5.932 J-2.93 E.02977
G3 X116.29 Y130.257 I2.681 J-.789 E.15935
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.981 J-.721 P1  F30000
G1 X116.078 Y131.423 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6494
G2 X114.812 Y132.337 I.217 J1.634 E.05398
G1 X115.546 Y133.071 E.03443
G1 X117.899 Y133.071 E.07806
G1 X119.607 Y131.401 E.07927
G1 X122.893 Y128.077 E.15501
G1 X122.893 Y125.066 E.09988
G1 X122.465 Y124.639 E.02005
G3 X120.024 Y124.571 I-1.137 J-3.055 E.08304
G1 X119.607 Y124.408 E.01485
G1 X119.607 Y129.457 E.1675
G1 X123.222 Y133.071 E.16954
G1 X124.209 Y133.071 E.03275
G2 X123.907 Y132.506 I-102.402 J54.342 E.02127
G1 X125.143 Y133.912 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6494
G1 X114.587 Y133.912 E.39569
; WIPE_START
G1 F24000
G1 X116.587 Y133.912 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.191 J.251 P1  F30000
G1 X119.358 Y120.778 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F6494
G1 X119.294 Y120.854 E.00044
; LINE_WIDTH: 0.111415
G1 X119.226 Y120.944 E.00063
; LINE_WIDTH: 0.147279
G1 X119.153 Y121.041 E.00103
; LINE_WIDTH: 0.181652
G1 X119.056 Y121.183 E.00195
G1 X119.079 Y121.362 F30000
; LINE_WIDTH: 0.119472
G1 F6494
G3 X119.149 Y120.947 I8.326 J1.205 E.00262
G1 X119.078 Y122.734 F30000
; LINE_WIDTH: 0.12919
G1 F6494
G1 X119.096 Y122.839 E.00075
; LINE_WIDTH: 0.16146
G1 X119.115 Y122.943 E.00103
; LINE_WIDTH: 0.148183
G2 X119.179 Y123.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111407
G1 X119.237 Y123.141 E.00058
; LINE_WIDTH: 0.0973913
G1 X119.297 Y123.22 E.00044
G1 X120.117 Y124.17 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6494
M73 P91 R1
G1 X119.2 Y123.811 E.03266
G1 X119.2 Y130.995 E.23834
G1 X116.084 Y131.009 E.10339
G2 X114.289 Y133.478 I.214 J2.042 E.11418
G1 X124.887 Y133.478 E.35155
G3 X123.735 Y131.257 I24.494 J-14.106 E.08304
G1 X123.3 Y130.239 E.03672
G1 X123.3 Y124.031 E.20592
G1 X121.854 Y124.361 E.04919
G3 X120.173 Y124.192 I-.625 J-2.234 E.05736
G1 X123.142 Y123.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129167
G1 F6494
G1 X123.274 Y123.149 E.00149
; LINE_WIDTH: 0.179234
G1 X123.343 Y123.058 E.00126
; LINE_WIDTH: 0.195633
G1 X123.444 Y122.91 E.00224
G1 X123.421 Y122.731 F30000
; LINE_WIDTH: 0.119473
G1 F6494
G3 X123.351 Y123.146 I-8.221 J-1.189 E.00262
G1 X123.422 Y121.359 F30000
; LINE_WIDTH: 0.0969206
G1 F6494
G1 X123.404 Y121.255 E.00047
; LINE_WIDTH: 0.136068
G1 X123.379 Y121.124 E.00101
; LINE_WIDTH: 0.173113
G1 X123.321 Y121.038 E.0011
; LINE_WIDTH: 0.126785
G1 X123.203 Y120.874 E.00138
G1 X123.3 Y120.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6494
G1 X122.229 Y119.862 E.03816
G2 X120.505 Y119.764 I-.995 J2.281 E.05851
G1 X119.2 Y120.062 E.04438
G1 X119.2 Y111.811 E.27371
G1 X120.233 Y112.216 E.03681
G2 X122.179 Y112.251 I1.009 J-2.052 E.06667
G1 X123.3 Y111.811 E.03994
G1 X123.3 Y120.223 E.27904
G1 X122.893 Y119.019 F30000
G1 F6494
G1 X122.893 Y117.391 E.05401
G1 X119.607 Y114.105 E.15411
G1 X119.607 Y116.011 E.0632
G1 X122.893 Y112.726 E.15411
G1 X122.893 Y112.408 E.01054
G3 X122.077 Y112.728 I-4.687 J-10.742 E.02906
G3 X121.655 Y112.824 I-1.349 J-4.936 E.01436
G1 X123.142 Y111.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129168
G1 F6494
G1 X123.274 Y111.149 E.00149
; LINE_WIDTH: 0.179233
G1 X123.343 Y111.058 E.00126
; LINE_WIDTH: 0.195636
G1 X123.444 Y110.91 E.00224
G1 X123.421 Y110.731 F30000
; LINE_WIDTH: 0.119477
G1 F6494
G3 X123.351 Y111.146 I-8.24 J-1.192 E.00262
G1 X123.422 Y109.359 F30000
; LINE_WIDTH: 0.0969203
G1 F6494
G1 X123.404 Y109.255 E.00047
; LINE_WIDTH: 0.13607
G1 X123.379 Y109.124 E.00101
; LINE_WIDTH: 0.173118
G1 X123.321 Y109.038 E.0011
; LINE_WIDTH: 0.126788
G1 X123.203 Y108.874 E.00138
G1 X123.3 Y108.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6494
G1 X122.002 Y107.773 E.04624
G2 X120.321 Y107.843 I-.754 J2.121 E.05719
G1 X119.2 Y108.283 E.03994
G1 X119.2 Y102.131 E.20405
G1 X123.3 Y102.131 E.13598
G1 X123.3 Y108.223 E.20206
G1 X119.358 Y108.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F6494
G1 X119.294 Y108.854 E.00044
; LINE_WIDTH: 0.111408
G1 X119.226 Y108.944 E.00063
; LINE_WIDTH: 0.14727
G1 X119.153 Y109.041 E.00103
; LINE_WIDTH: 0.18164
G1 X119.056 Y109.183 E.00195
G1 X119.079 Y109.362 F30000
; LINE_WIDTH: 0.119477
G1 F6494
G3 X119.149 Y108.947 I8.259 J1.194 E.00262
G1 X119.078 Y110.734 F30000
; LINE_WIDTH: 0.129192
G1 F6494
G1 X119.096 Y110.839 E.00075
; LINE_WIDTH: 0.161462
G1 X119.115 Y110.943 E.00103
; LINE_WIDTH: 0.14819
G2 X119.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111406
G1 X119.237 Y111.141 E.00058
; LINE_WIDTH: 0.097392
G1 X119.297 Y111.22 E.00044
G1 X119.607 Y104.801 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6494
G1 X119.607 Y106.429 E.05401
G1 X120.514 Y107.336 E.04254
G1 X120.629 Y107.313 E.00388
G1 X122.893 Y105.05 E.1062
G1 X122.893 Y103.421 E.05401
; WIPE_START
G1 F24000
G1 X122.893 Y105.05 E-.61876
G1 X122.63 Y105.312 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.529 J1.096 P1  F30000
G1 X159.878 Y123.28 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6494
G1 X159.753 Y123.441 E.00677
G3 X157.995 Y120.01 I-1.503 J-1.396 E.26128
G1 X158.199 Y119.994 E.00679
G3 X160 Y123.116 I.051 J2.051 E.14596
G1 X159.914 Y123.232 E.00478
G1 X159.549 Y123.076 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6494
G1 X159.347 Y123.29 E.00903
G3 X158.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X158.209 Y120.387 E.00509
G3 X159.586 Y123.029 I.041 J1.659 E.11371
M204 S10000
; WIPE_START
G1 F24000
G1 X159.347 Y123.29 E-.13436
G1 X159.08 Y123.484 E-.12556
G1 X158.779 Y123.62 E-.12564
G1 X158.457 Y123.694 E-.12564
G1 X158.126 Y123.702 E-.12563
G1 X157.807 Y123.646 E-.12316
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.206 J.163 P1  F30000
G1 X159.419 Y111.73 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6494
G1 X159.093 Y111.915 E.01244
G3 X157.995 Y108.01 I-.843 J-1.87 E.23415
G1 X158.199 Y107.994 E.00679
G3 X159.468 Y111.696 I.051 J2.051 E.17221
G1 X159.206 Y111.402 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6494
G1 X158.932 Y111.558 E.00968
G3 X158.044 Y108.399 I-.682 J-1.513 E.17541
G1 X158.209 Y108.387 E.00509
G3 X159.254 Y111.367 I.041 J1.659 E.12831
M204 S10000
; WIPE_START
G1 F24000
G1 X158.932 Y111.558 E-.14228
G1 X158.62 Y111.665 E-.12556
G1 X158.291 Y111.706 E-.12563
G1 X158.126 Y111.702 E-.06289
G1 X157.8 Y111.645 E-.12564
G1 X157.493 Y111.524 E-.12564
G1 X157.377 Y111.449 E-.05235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.195 J.228 P1  F30000
G1 X161.04 Y130.649 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6494
G1 X163.205 Y130.649 E.07181
G3 X165.445 Y133.921 I.006 J2.399 E.15485
G1 X165.272 Y134.346 E.0152
G1 X153.517 Y134.346 E.38994
G2 X155.852 Y130.168 I-14.206 J-10.684 E.15923
G1 X155.852 Y101.654 E.94589
G1 X160.648 Y101.654 E.15909
G1 X160.648 Y130.649 E.96182
G1 X160.98 Y130.649 E.01102
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6494
G1 X163.21 Y130.257 E.06667
G3 X165.812 Y134.06 I.001 J2.791 E.16656
G1 X165.535 Y134.738 E.02249
G1 X152.702 Y134.738 E.39433
G2 X155.46 Y130.089 I-13.315 J-11.041 E.16676
G1 X155.46 Y101.262 E.88579
G1 X161.04 Y101.262 E.17146
G1 X161.04 Y130.197 E.88909
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.157 J.379 P1  F30000
G1 X163.423 Y131.423 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6494
G3 X164.686 Y132.34 I-.244 J1.665 E.05386
G1 X163.955 Y133.071 E.03432
G1 X161.601 Y133.071 E.07806
G1 X156.608 Y128.077 E.23428
G1 X156.608 Y125.066 E.09988
G1 X157.081 Y124.593 E.02219
G2 X159.086 Y124.726 I1.167 J-2.421 E.06833
G1 X159.893 Y124.542 E.02744
G1 X159.893 Y129.457 E.16306
G1 X156.279 Y133.071 E.16954
G1 X155.291 Y133.071 E.03275
G3 X155.594 Y132.506 I103.239 J54.789 E.02127
G1 X154.357 Y133.912 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6494
G1 X164.916 Y133.912 E.39577
; WIPE_START
G1 F24000
G1 X162.916 Y133.912 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.195 J-.228 P1  F30000
G1 X160.3 Y120.223 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6494
G1 X160.3 Y111.811 E.27904
G1 X159.179 Y112.251 E.03994
G3 X157.234 Y112.216 I-.936 J-2.086 E.06666
G1 X156.2 Y111.811 E.03682
G1 X156.2 Y120.062 E.27371
G1 X157.505 Y119.764 E.04438
G3 X159.246 Y119.869 I.731 J2.384 E.05912
G1 X160.3 Y120.283 E.03755
G1 X160.203 Y120.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126787
G1 F6494
G1 X160.321 Y121.038 E.00138
; LINE_WIDTH: 0.173118
G1 X160.379 Y121.124 E.0011
; LINE_WIDTH: 0.13607
G1 X160.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969206
G1 X160.422 Y121.359 E.00047
G1 X160.351 Y123.146 F30000
; LINE_WIDTH: 0.119477
G1 F6494
G2 X160.421 Y122.731 I-8.165 J-1.606 E.00262
G1 X160.444 Y122.91 F30000
; LINE_WIDTH: 0.195637
G1 F6494
G1 X160.343 Y123.058 E.00224
; LINE_WIDTH: 0.179239
G1 X160.274 Y123.149 E.00126
; LINE_WIDTH: 0.129169
G1 X160.142 Y123.315 E.00149
G1 X157.173 Y124.192 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6494
G2 X158.995 Y124.329 I1.075 J-2.111 E.06224
G1 X160.3 Y124.031 E.04438
G1 X160.3 Y130.997 E.23107
G3 X163.611 Y131.042 I.333 J96.49 E.10986
G3 X165.21 Y133.478 I-.4 J2.005 E.10759
G1 X154.613 Y133.478 E.35151
G2 X155.482 Y131.849 I-260.909 J-140.109 E.06126
G2 X156.2 Y130.239 I-16.946 J-8.53 E.0585
G1 X156.2 Y123.811 E.21324
G1 X157.117 Y124.17 E.03266
G1 X156.297 Y123.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F6494
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111408
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148185
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.129188
G1 X156.078 Y122.734 E.00075
G1 X156.149 Y120.947 F30000
; LINE_WIDTH: 0.119468
G1 F6494
G2 X156.079 Y121.362 I8.245 J1.618 E.00262
G1 X156.056 Y121.183 F30000
; LINE_WIDTH: 0.181652
G1 F6494
G1 X156.153 Y121.041 E.00195
; LINE_WIDTH: 0.147279
G1 X156.226 Y120.944 E.00103
; LINE_WIDTH: 0.111415
G1 X156.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973918
G1 X156.358 Y120.778 E.00044
G1 X156.608 Y119.019 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6494
G1 X156.608 Y117.391 E.05401
G1 X159.893 Y114.105 E.15411
G1 X159.893 Y116.011 E.0632
G1 X156.608 Y112.726 E.15411
G1 X156.608 Y112.408 E.01054
G1 X157.085 Y112.595 E.01702
G2 X157.847 Y112.817 I.929 J-1.774 E.0265
G1 X156.297 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F6494
G1 X156.237 Y111.141 E.00044
; LINE_WIDTH: 0.111405
G1 X156.179 Y111.055 E.00058
; LINE_WIDTH: 0.148186
G3 X156.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X156.096 Y110.839 E.00103
; LINE_WIDTH: 0.12919
G1 X156.078 Y110.734 E.00075
G1 X156.149 Y108.947 F30000
; LINE_WIDTH: 0.119473
G1 F6494
G2 X156.079 Y109.362 I8.177 J1.607 E.00262
G1 X156.056 Y109.183 F30000
; LINE_WIDTH: 0.181638
G1 F6494
G1 X156.153 Y109.041 E.00195
; LINE_WIDTH: 0.147268
G1 X156.226 Y108.944 E.00103
; LINE_WIDTH: 0.111406
G1 X156.294 Y108.854 E.00063
; LINE_WIDTH: 0.0973913
G1 X156.358 Y108.778 E.00044
; WIPE_START
G1 F24000
G1 X156.294 Y108.854 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.656 J1.025 P1  F30000
G1 X160.142 Y111.315 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.129169
G1 F6494
G1 X160.274 Y111.149 E.00149
; LINE_WIDTH: 0.179236
G1 X160.343 Y111.058 E.00126
; LINE_WIDTH: 0.195638
G1 X160.444 Y110.91 E.00224
G1 X160.421 Y110.731 F30000
; LINE_WIDTH: 0.119481
G1 F6494
G3 X160.351 Y111.146 I-8.32 J-1.204 E.00262
G1 X160.422 Y109.359 F30000
; LINE_WIDTH: 0.0969203
G1 F6494
G1 X160.404 Y109.255 E.00047
; LINE_WIDTH: 0.136072
G1 X160.379 Y109.124 E.00101
; LINE_WIDTH: 0.173122
G1 X160.321 Y109.038 E.0011
; LINE_WIDTH: 0.126789
G1 X160.203 Y108.874 E.00138
G1 X160.3 Y108.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6494
G1 X159.11 Y107.815 E.04241
G2 X157.321 Y107.843 I-.863 J2.076 E.06101
G1 X156.2 Y108.283 E.03994
G1 X156.2 Y102.131 E.20405
G1 X160.3 Y102.131 E.13598
G1 X160.3 Y108.223 E.20206
G1 X159.893 Y104.801 F30000
G1 F6494
G1 X159.893 Y106.429 E.05401
G1 X158.987 Y107.335 E.0425
G1 X158.873 Y107.315 E.00382
G1 X156.608 Y105.05 E.10629
G1 X156.608 Y103.421 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X156.608 Y105.05 E-.61876
G1 X156.87 Y105.312 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/63
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
G3 Z8.6 I-1.2 J.2 P1  F30000
G1 X159.864 Y123.311 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6565
G1 X159.607 Y123.584 E.01244
G3 X157.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X158.199 Y119.994 E.00679
G3 X159.901 Y123.264 I.051 J2.051 E.15186
G1 X159.57 Y123.053 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6565
G1 X159.347 Y123.29 E.01001
G3 X158.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X158.209 Y120.387 E.00509
G3 X159.605 Y123.004 I.041 J1.659 E.11274
M204 S10000
; WIPE_START
G1 F24000
G1 X159.347 Y123.29 E-.14626
G1 X159.08 Y123.484 E-.12557
G1 X158.779 Y123.62 E-.12563
G1 X158.457 Y123.694 E-.12564
G1 X158.126 Y123.702 E-.12562
G1 X157.838 Y123.651 E-.11127
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.206 J.16 P1  F30000
G1 X159.419 Y111.73 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6565
G1 X159.093 Y111.915 E.01244
G3 X157.995 Y108.01 I-.843 J-1.87 E.23415
G1 X158.199 Y107.994 E.00679
G3 X159.468 Y111.696 I.051 J2.051 E.17221
G1 X159.204 Y111.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6565
G1 X158.932 Y111.558 E.00962
G3 X158.044 Y108.399 I-.682 J-1.513 E.17541
G1 X158.209 Y108.387 E.00509
G3 X159.252 Y111.368 I.041 J1.659 E.12836
M204 S10000
; WIPE_START
G1 F24000
G1 X158.932 Y111.558 E-.14163
G1 X158.62 Y111.665 E-.12556
G1 X158.291 Y111.706 E-.12563
G1 X157.962 Y111.682 E-.12563
G1 X157.8 Y111.645 E-.06289
G1 X157.493 Y111.524 E-.12564
G1 X157.375 Y111.448 E-.05301
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.199 J.209 P1  F30000
G1 X160.648 Y130.257 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6565
G1 X160.648 Y130.649 E.01301
G1 X163.205 Y130.649 E.08482
G3 X165.353 Y134.146 I0 J2.409 E.16295
G1 X153.662 Y134.146 E.38782
G2 X155.852 Y130.168 I-14.134 J-10.374 E.15103
G1 X155.852 Y101.695 E.94452
G1 X160.648 Y101.695 E.15909
G1 X160.648 Y130.197 E.94545
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6565
G1 X163.21 Y130.257 E.06667
G3 X165.813 Y134.058 I-.004 J2.795 E.1664
G1 X165.617 Y134.538 E.01592
G1 X152.869 Y134.538 E.3917
G2 X155.46 Y130.089 I-13.213 J-10.674 E.15879
G1 X155.46 Y101.303 E.88452
G1 X161.04 Y101.303 E.17146
G1 X161.04 Y130.197 E.88782
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.157 J.378 P1  F30000
G1 X163.422 Y131.423 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6565
G3 X164.689 Y132.337 I-.201 J1.615 E.05407
G1 X164.155 Y132.871 E.02509
G1 X161.401 Y132.871 E.09133
G1 X156.608 Y128.077 E.22489
G1 X156.608 Y125.066 E.09988
G1 X157.081 Y124.593 E.02219
G2 X159.086 Y124.726 I1.167 J-2.421 E.06833
G1 X159.893 Y124.542 E.02744
G1 X159.893 Y129.457 E.16306
G1 X156.479 Y132.871 E.16016
G1 X155.398 Y132.871 E.03584
G3 X155.657 Y132.388 I95.516 J50.822 E.01817
G1 X154.492 Y133.712 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6565
G1 X164.985 Y133.712 E.39332
; WIPE_START
G1 F24000
G1 X162.985 Y133.712 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.194 J-.238 P1  F30000
G1 X160.3 Y120.223 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6565
G1 X160.3 Y111.811 E.27904
G1 X159.179 Y112.251 E.03995
G3 X157.173 Y112.192 I-.943 J-2.109 E.06886
G1 X156.2 Y111.811 E.03465
G1 X156.2 Y120.062 E.27371
G1 X157.505 Y119.764 E.04438
G3 X159.327 Y119.901 I.738 J2.38 E.06208
G1 X160.3 Y120.283 E.03465
G1 X160.203 Y120.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126788
G1 F6565
G1 X160.321 Y121.038 E.00138
; LINE_WIDTH: 0.173119
G1 X160.379 Y121.124 E.0011
; LINE_WIDTH: 0.136071
G1 X160.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969208
G1 X160.422 Y121.359 E.00047
G1 X160.351 Y123.146 F30000
; LINE_WIDTH: 0.119472
G1 F6565
G2 X160.421 Y122.731 I-8.257 J-1.619 E.00262
M73 P92 R1
G1 X160.444 Y122.91 F30000
; LINE_WIDTH: 0.195635
G1 F6565
G1 X160.343 Y123.058 E.00224
; LINE_WIDTH: 0.179238
G1 X160.274 Y123.149 E.00126
; LINE_WIDTH: 0.12917
G1 X160.142 Y123.315 E.00149
G1 X157.599 Y124.36 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6565
G2 X158.995 Y124.329 I.641 J-2.596 E.04687
G1 X160.3 Y124.031 E.04438
G1 X160.3 Y130.995 E.23102
G1 X163.483 Y131.02 E.10559
G3 X165.242 Y133.278 I-.335 J2.075 E.10446
G1 X154.72 Y133.278 E.34904
G2 X155.483 Y131.847 I-233.476 J-125.36 E.0538
G2 X156.2 Y130.239 I-17.725 J-8.876 E.05844
G1 X156.2 Y123.811 E.21324
G1 X157.543 Y124.338 E.04786
G1 X156.297 Y123.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973909
G1 F6565
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111399
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148173
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161464
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.129193
G1 X156.078 Y122.734 E.00075
G1 X156.149 Y120.947 F30000
; LINE_WIDTH: 0.119474
G1 F6565
G2 X156.079 Y121.362 I8.236 J1.616 E.00262
G1 X156.056 Y121.183 F30000
; LINE_WIDTH: 0.181653
G1 F6565
G1 X156.153 Y121.041 E.00195
; LINE_WIDTH: 0.147276
G1 X156.226 Y120.944 E.00103
; LINE_WIDTH: 0.111406
G1 X156.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973898
G1 X156.358 Y120.778 E.00044
G1 X156.608 Y119.019 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6565
G1 X156.608 Y117.391 E.05401
G1 X159.893 Y114.105 E.15411
G1 X159.893 Y116.011 E.0632
G1 X156.608 Y112.726 E.15411
G1 X156.608 Y112.408 E.01054
G1 X157.024 Y112.571 E.01485
G2 X157.847 Y112.817 I1.019 J-1.913 E.02868
G1 X156.297 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973907
G1 F6565
G1 X156.237 Y111.141 E.00044
; LINE_WIDTH: 0.111399
G1 X156.179 Y111.055 E.00058
; LINE_WIDTH: 0.148173
G3 X156.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161462
G1 X156.096 Y110.839 E.00103
; LINE_WIDTH: 0.129191
G1 X156.078 Y110.734 E.00075
G1 X156.149 Y108.947 F30000
; LINE_WIDTH: 0.119473
G1 F6565
G2 X156.079 Y109.362 I8.177 J1.607 E.00262
G1 X156.056 Y109.183 F30000
; LINE_WIDTH: 0.181648
G1 F6565
G1 X156.153 Y109.041 E.00195
; LINE_WIDTH: 0.147274
G1 X156.226 Y108.944 E.00103
; LINE_WIDTH: 0.111408
G1 X156.294 Y108.854 E.00063
; LINE_WIDTH: 0.0973917
G1 X156.358 Y108.778 E.00044
; WIPE_START
G1 F24000
G1 X156.294 Y108.854 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.656 J1.025 P1  F30000
G1 X160.142 Y111.315 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.129166
G1 F6565
G1 X160.274 Y111.149 E.00149
; LINE_WIDTH: 0.179229
G1 X160.343 Y111.058 E.00126
; LINE_WIDTH: 0.195634
G1 X160.444 Y110.91 E.00224
G1 X160.421 Y110.731 F30000
; LINE_WIDTH: 0.119475
G1 F6565
G3 X160.351 Y111.146 I-8.245 J-1.192 E.00262
G1 X160.422 Y109.359 F30000
; LINE_WIDTH: 0.0969206
G1 F6565
G1 X160.404 Y109.255 E.00047
; LINE_WIDTH: 0.136067
G1 X160.379 Y109.124 E.00101
; LINE_WIDTH: 0.173111
G1 X160.321 Y109.038 E.0011
; LINE_WIDTH: 0.126784
G1 X160.203 Y108.874 E.00138
G1 X160.3 Y108.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6565
G1 X159.236 Y107.865 E.03792
G2 X157.321 Y107.843 I-.981 J2.053 E.06554
G1 X156.2 Y108.283 E.03994
G1 X156.2 Y102.131 E.20405
G1 X160.3 Y102.131 E.13598
G1 X160.3 Y108.223 E.20206
G1 X159.893 Y104.801 F30000
G1 F6565
G1 X159.893 Y106.429 E.05401
G1 X158.987 Y107.335 E.0425
G1 X158.873 Y107.315 E.00382
G1 X156.608 Y105.05 E.10629
G1 X156.608 Y103.421 E.05401
; WIPE_START
G1 F24000
G1 X156.608 Y105.05 E-.61876
G1 X156.87 Y105.312 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.569 J-1.076 P1  F30000
G1 X122.864 Y123.311 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6565
G1 X122.607 Y123.584 E.01244
G3 X120.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X121.199 Y119.994 E.00679
G3 X122.901 Y123.264 I.051 J2.051 E.15186
G1 X122.57 Y123.053 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6565
G1 X122.347 Y123.29 E.01001
G3 X121.044 Y120.399 I-1.097 J-1.244 E.19066
G1 X121.209 Y120.387 E.00509
G3 X122.605 Y123.004 I.041 J1.659 E.11274
M204 S10000
; WIPE_START
G1 F24000
G1 X122.347 Y123.29 E-.14626
G1 X122.08 Y123.484 E-.12557
G1 X121.779 Y123.62 E-.12563
G1 X121.457 Y123.694 E-.12564
G1 X121.126 Y123.702 E-.12562
G1 X120.838 Y123.651 E-.11127
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.211 J.118 P1  F30000
G1 X122.334 Y108.307 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6565
G1 X122.364 Y108.322 E.00111
G3 X120.995 Y108.01 I-1.114 J1.723 E.38006
G1 X121.199 Y107.994 E.00679
G3 X122 Y108.136 I.051 J2.051 E.02717
G1 X122.281 Y108.28 E.01046
G1 X122.151 Y108.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6565
G3 X121.044 Y108.399 I-.901 J1.393 E.28472
G1 X121.209 Y108.387 E.00509
G3 X122.1 Y108.621 I.041 J1.659 E.02869
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14824
G1 X122.622 Y109.111 E-.12563
G1 X122.78 Y109.402 E-.12564
G1 X122.877 Y109.718 E-.12563
G1 X122.91 Y110.026 E-.11797
G1 X122.892 Y110.294 E-.10196
G1 X122.882 Y110.332 E-.01493
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.194 J-.237 P1  F30000
G1 X118.852 Y130.649 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6565
G1 X118.852 Y101.695 E.96045
G1 X123.648 Y101.695 E.15909
G1 X123.648 Y130.168 E.94452
G2 X125.838 Y134.146 I16.324 J-6.397 E.15103
G1 X114.151 Y134.146 E.38766
G3 X116.295 Y130.649 I2.145 J-1.09 E.16289
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6565
G1 X118.46 Y101.303 E.88967
G1 X124.04 Y101.303 E.17146
G1 X124.04 Y130.089 E.88452
G2 X126.639 Y134.538 I15.771 J-6.23 E.15892
G1 X113.892 Y134.538 E.39167
G3 X113.498 Y133.033 I3.169 J-1.634 E.04818
G3 X116.29 Y130.257 I2.798 J.022 E.13421
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.981 J-.721 P1  F30000
G1 X116.078 Y131.423 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6565
G2 X114.812 Y132.337 I.217 J1.634 E.05398
G1 X115.346 Y132.871 E.02505
G1 X118.099 Y132.871 E.09133
G1 X119.607 Y131.401 E.06989
G1 X122.893 Y128.077 E.15501
G1 X122.893 Y125.066 E.09988
G1 X122.465 Y124.639 E.02005
G3 X119.607 Y124.408 I-1.177 J-3.223 E.09812
G1 X119.607 Y129.457 E.1675
G1 X123.022 Y132.871 E.16016
G1 X124.102 Y132.871 E.03584
G2 X123.844 Y132.388 I-94.782 J50.43 E.01817
G1 X120.599 Y124.36 F30000
G1 F6565
G2 X121.549 Y124.431 I.707 J-3.058 E.03171
G1 X123.3 Y124.031 E.05957
G1 X123.3 Y130.239 E.20592
G1 X123.376 Y130.419 E.00647
G2 X124.78 Y133.278 I22.24 J-9.15 E.10577
G1 X114.255 Y133.25 E.34916
G3 X116.084 Y131.009 I2.057 J-.188 E.10631
G1 X119.2 Y130.995 E.10339
G1 X119.2 Y123.811 E.23834
G1 X120.543 Y124.338 E.04786
G1 X119.297 Y123.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973913
G1 F6565
G1 X119.237 Y123.141 E.00044
; LINE_WIDTH: 0.111405
G1 X119.179 Y123.055 E.00058
; LINE_WIDTH: 0.14818
G3 X119.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161468
G1 X119.096 Y122.839 E.00103
; LINE_WIDTH: 0.129194
G1 X119.078 Y122.734 E.00075
G1 X119.079 Y121.362 F30000
; LINE_WIDTH: 0.119478
G1 F6565
G3 X119.149 Y120.947 I8.404 J1.217 E.00262
G1 X119.226 Y120.944 F30000
; LINE_WIDTH: 0.111408
G1 F6565
G1 X119.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973917
G1 X119.358 Y120.778 E.00044
G1 X119.226 Y120.944 F30000
; LINE_WIDTH: 0.14728
G1 F6565
G1 X119.153 Y121.041 E.00103
; LINE_WIDTH: 0.181658
G1 X119.056 Y121.183 E.00195
; WIPE_START
G1 F24000
G1 X119.153 Y121.041 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.05 J1.216 P1  F30000
G1 X123.203 Y120.874 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.126788
G1 F6565
G1 X123.321 Y121.038 E.00138
; LINE_WIDTH: 0.173119
G1 X123.379 Y121.124 E.0011
; LINE_WIDTH: 0.13607
G1 X123.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969208
G1 X123.422 Y121.359 E.00047
G1 X123.3 Y120.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6565
G1 X122.327 Y119.901 E.03465
G2 X120.505 Y119.764 I-1.085 J2.244 E.06208
G1 X119.2 Y120.062 E.04438
G1 X119.2 Y111.811 E.27371
G1 X120.173 Y112.192 E.03465
G2 X122.179 Y112.251 I1.063 J-2.051 E.06886
G1 X123.3 Y111.811 E.03995
G1 X123.3 Y120.223 E.27904
G1 X122.893 Y119.019 F30000
G1 F6565
G1 X122.893 Y117.391 E.05401
G1 X119.607 Y114.105 E.15411
G1 X119.607 Y116.011 E.0632
G1 X122.893 Y112.726 E.15411
G1 X122.893 Y112.408 E.01054
G3 X122.077 Y112.728 I-4.688 J-10.744 E.02906
G3 X121.655 Y112.824 I-1.349 J-4.936 E.01436
G1 X123.142 Y111.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F6565
G1 X123.274 Y111.149 E.00149
; LINE_WIDTH: 0.179227
G1 X123.343 Y111.058 E.00126
; LINE_WIDTH: 0.195631
G1 X123.444 Y110.91 E.00224
G1 X123.421 Y110.731 F30000
; LINE_WIDTH: 0.11947
G1 F6565
G3 X123.351 Y111.146 I-8.249 J-1.193 E.00262
G1 X123.422 Y109.359 F30000
; LINE_WIDTH: 0.0969206
G1 F6565
G1 X123.404 Y109.255 E.00047
; LINE_WIDTH: 0.136068
G1 X123.379 Y109.124 E.00101
; LINE_WIDTH: 0.173113
G1 X123.321 Y109.038 E.0011
; LINE_WIDTH: 0.126784
G1 X123.203 Y108.874 E.00138
G1 X123.3 Y108.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6565
G1 X122.149 Y107.831 E.04101
G2 X120.321 Y107.843 I-.9 J2.066 E.06242
G1 X119.2 Y108.283 E.03995
G1 X119.2 Y102.131 E.20405
G1 X123.3 Y102.131 E.13598
G1 X123.3 Y108.223 E.20206
G1 X119.358 Y108.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F6565
G1 X119.294 Y108.854 E.00044
; LINE_WIDTH: 0.111411
G1 X119.226 Y108.944 E.00063
; LINE_WIDTH: 0.147278
G1 X119.153 Y109.041 E.00103
; LINE_WIDTH: 0.181653
G1 X119.056 Y109.183 E.00195
G1 X119.079 Y109.362 F30000
; LINE_WIDTH: 0.119477
G1 F6565
G3 X119.149 Y108.947 I8.244 J1.192 E.00262
G1 X119.078 Y110.734 F30000
; LINE_WIDTH: 0.129193
G1 F6565
G1 X119.096 Y110.839 E.00075
; LINE_WIDTH: 0.161466
G1 X119.115 Y110.943 E.00103
; LINE_WIDTH: 0.148179
G2 X119.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111403
G1 X119.237 Y111.141 E.00058
; LINE_WIDTH: 0.0973913
G1 X119.297 Y111.22 E.00044
G1 X119.607 Y104.801 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6565
G1 X119.607 Y106.429 E.05401
G1 X120.514 Y107.336 E.04254
G1 X120.629 Y107.313 E.00388
G1 X122.893 Y105.05 E.1062
G1 X122.893 Y103.421 E.05401
G1 X123.421 Y122.731 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119468
G1 F6565
G3 X123.351 Y123.146 I-8.317 J-1.203 E.00262
G1 X123.274 Y123.149 F30000
; LINE_WIDTH: 0.129169
G1 F6565
G1 X123.142 Y123.315 E.00149
G1 X123.274 Y123.149 F30000
; LINE_WIDTH: 0.179237
G1 F6565
G1 X123.343 Y123.058 E.00126
; LINE_WIDTH: 0.195632
G1 X123.444 Y122.91 E.00224
; WIPE_START
G1 F24000
G1 X123.343 Y123.058 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.934 J-.78 P1  F30000
G1 X114.453 Y133.712 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F6565
G1 X124.948 Y133.712 E.39339
M106 S242.25
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122.948 Y133.712 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/63
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
G3 Z8.8 I.331 J1.171 P1  F30000
G1 X159.904 Y123.257 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X159.885 Y123.285 E.00111
G3 X157.995 Y120.01 I-1.635 J-1.239 E.26806
G1 X158.199 Y119.994 E.00679
G3 X160.098 Y122.936 I.051 J2.051 E.13917
G1 X159.935 Y123.206 E.01045
G1 X159.586 Y123.028 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.572 Y123.048 E.00075
G3 X158.044 Y120.399 I-1.322 J-1.002 E.20082
G1 X158.209 Y120.387 E.00509
G3 X159.745 Y122.766 I.041 J1.659 E.10426
G1 X159.617 Y122.977 E.00756
M204 S10000
; WIPE_START
G1 F24000
G1 X159.572 Y123.048 E-.03206
G1 X159.349 Y123.291 E-.12557
G1 X159.08 Y123.484 E-.12564
G1 X158.779 Y123.62 E-.12563
G1 X158.457 Y123.694 E-.12565
G1 X158.126 Y123.702 E-.12563
G1 X157.867 Y123.657 E-.09982
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.207 J.154 P1  F30000
G1 X159.39 Y111.75 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X159.363 Y111.77 E.00111
G3 X158 Y108.009 I-1.111 J-1.725 E.24432
G1 X158.199 Y107.994 E.00661
G3 X159.683 Y111.516 I.054 J2.051 E.16307
G1 X159.437 Y111.713 E.01046
G1 X159.196 Y111.405 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.15 Y111.44 E.00177
G3 X158.046 Y108.399 I-.899 J-1.394 E.18304
G1 X158.209 Y108.387 E.00503
G3 X159.408 Y111.234 I.042 J1.659 E.1221
G1 X159.243 Y111.368 E.00653
M204 S10000
; WIPE_START
G1 F24000
G1 X159.15 Y111.44 E-.04474
G1 X158.857 Y111.592 E-.12557
G1 X158.553 Y111.679 E-.11986
G1 X158.291 Y111.706 E-.10005
G1 X157.962 Y111.682 E-.12564
G1 X157.644 Y111.592 E-.12563
G1 X157.366 Y111.45 E-.11851
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.195 J.229 P1  F30000
G1 X161.04 Y130.649 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X163.205 Y130.649 E.07181
G3 X165.436 Y133.946 I.001 J2.403 E.15562
G1 X153.819 Y133.946 E.38537
G2 X155.852 Y130.168 I-15.261 J-10.652 E.14261
G1 X155.852 Y101.783 E.9416
G1 X160.648 Y101.783 E.15909
G1 X160.648 Y130.649 E.95753
G1 X160.98 Y130.649 E.01102
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X163.21 Y130.257 E.06667
G3 X165.699 Y134.338 I-.006 J2.803 E.17589
G1 X153.029 Y134.338 E.38931
G2 X155.46 Y130.089 I-13.678 J-10.648 E.15092
G1 X155.46 Y101.391 E.88182
G1 X161.04 Y101.391 E.17146
G1 X161.04 Y130.197 E.88512
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.16 J.368 P1  F30000
G1 X164.159 Y133.778 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.409312
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X165.231 Y133.026 E.07021
G2 X165.164 Y132.513 I-1.552 J-.059 E.02791
G1 X163.647 Y133.575 E.0993
G1 X162.846 Y133.575 E.04294
G1 X164.984 Y132.078 E.13993
G2 X164.721 Y131.701 I-1.247 J.59 E.02474
G1 X162.045 Y133.575 E.17516
G1 X161.244 Y133.575 E.04294
G1 X164.371 Y131.386 E.20464
G2 X163.913 Y131.146 I-1.14 J1.618 E.0278
G1 X160.443 Y133.575 E.22708
G1 X159.642 Y133.575 E.04294
G1 X163.279 Y131.029 E.23797
G1 X162.483 Y131.026 E.04268
G1 X158.842 Y133.576 E.23829
G1 X158.041 Y133.576 E.04294
G1 X161.687 Y131.023 E.23861
G1 X160.891 Y131.019 E.04268
G1 X157.24 Y133.576 E.23893
G1 X156.439 Y133.576 E.04294
G1 X160.278 Y130.887 E.25128
G1 X160.278 Y130.327 E.03006
G1 X155.638 Y133.576 E.30369
G1 X154.837 Y133.576 E.04293
G1 X160.278 Y129.766 E.3561
G1 X160.278 Y129.205 E.03006
G1 X154.913 Y132.962 E.35117
G1 X155.389 Y132.068 E.05435
G1 X160.278 Y128.645 E.31997
G1 X160.278 Y128.084 E.03006
G1 X155.81 Y131.213 E.29247
G2 X156.15 Y130.414 I-8.511 J-4.098 E.04658
G1 X160.278 Y127.523 E.27019
M73 P93 R1
G1 X160.278 Y126.962 E.03006
G1 X156.222 Y129.803 E.26548
G1 X156.222 Y129.242 E.03006
G1 X160.278 Y126.402 E.26548
G1 X160.278 Y125.841 E.03006
G1 X156.222 Y128.681 E.26548
G1 X156.222 Y128.121 E.03006
G1 X160.278 Y125.28 E.26548
G1 X160.278 Y124.72 E.03006
G1 X156.222 Y127.56 E.26548
G1 X156.222 Y126.999 E.03006
G1 X160.278 Y124.159 E.26548
G1 X160.278 Y124.058 E.0054
G1 X159.304 Y124.281 E.05359
G1 X156.222 Y126.438 E.2017
G1 X156.222 Y125.878 E.03006
G1 X158.247 Y124.46 E.13253
G1 X158.069 Y124.464 E.00954
G1 X157.572 Y124.372 E.02711
G1 X156.222 Y125.317 E.08834
G1 X156.222 Y124.756 E.03006
G1 X157.059 Y124.17 E.05476
G1 X156.545 Y123.969 E.02955
G1 X156.019 Y124.337 E.03442
M106 S242.25
G1 X156.152 Y123.47 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X156.088 Y123.507 E.00204
G1 X156.152 Y123.543 E.00204
G1 X156.173 Y123.507 E.00118
G1 X156.398 Y123.505 E.00624
G1 X156.398 Y123.578 E.00204
G1 X156.41 Y123.572 E.00038
G1 X156.297 Y123.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F15000
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111408
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148186
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.129188
G1 X156.078 Y122.734 E.00075
G1 X156.078 Y121.359 F30000
; LINE_WIDTH: 0.124518
G1 F15000
G1 X156.094 Y121.267 E.00062
; LINE_WIDTH: 0.152115
G1 X156.11 Y121.175 E.00083
; LINE_WIDTH: 0.153606
G1 X156.156 Y120.941 E.00215
G1 X156.228 Y120.941 F30000
; LINE_WIDTH: 0.111417
G1 F15000
G1 X156.294 Y120.854 E.00061
; LINE_WIDTH: 0.0973923
G1 X156.358 Y120.778 E.00044
G1 X156.228 Y120.941 F30000
; LINE_WIDTH: 0.145819
G1 F15000
G1 X156.158 Y121.034 E.00097
; LINE_WIDTH: 0.17894
G1 X156.056 Y121.181 E.00199
G1 X156.18 Y120.403 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X156.273 Y120.36 E.00284
G1 X156.425 Y120.38 E.00425
G1 X160.102 Y120.515 F30000
G1 F15000
G1 X160.038 Y120.552 E.00204
G1 X160.087 Y120.58 E.00155
G1 X160.203 Y120.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126782
G1 F15000
G1 X160.321 Y121.038 E.00138
; LINE_WIDTH: 0.173111
G1 X160.379 Y121.124 E.0011
; LINE_WIDTH: 0.136066
G1 X160.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969203
G1 X160.422 Y121.359 E.00047
G1 X160.421 Y122.731 F30000
; LINE_WIDTH: 0.119478
G1 F15000
G3 X160.351 Y123.146 I-8.308 J-1.202 E.00262
G1 X160.274 Y123.149 F30000
; LINE_WIDTH: 0.129169
G1 F15000
G1 X160.142 Y123.315 E.00149
G1 X160.274 Y123.149 F30000
; LINE_WIDTH: 0.179234
G1 F15000
G1 X160.343 Y123.058 E.00126
; LINE_WIDTH: 0.195635
G1 X160.444 Y122.91 E.00224
G1 X160.016 Y123.706 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.395426
G1 F15000
G1 X160.276 Y123.725 E.00749
G1 X160.481 Y119.901 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.403459
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X159.386 Y119.901 E.05702
G1 X158.907 Y119.713 E.02683
G1 X158.431 Y119.629 E.02515
G1 X157.949 Y119.641 E.02515
G1 X156.81 Y119.901 E.06086
G1 X156.222 Y119.901 E.03061
G1 X156.222 Y119.448 E.02362
G1 X160.278 Y119.448 E.21129
G1 X160.278 Y118.994 E.02362
G1 X156.222 Y118.994 E.21129
G1 X156.222 Y118.541 E.02362
G1 X160.278 Y118.541 E.21129
G1 X160.278 Y118.087 E.02362
G1 X156.222 Y118.087 E.21129
G1 X156.222 Y117.634 E.02362
G1 X160.278 Y117.634 E.21129
G1 X160.278 Y117.18 E.02362
G1 X156.222 Y117.18 E.21129
G1 X156.222 Y116.727 E.02362
G1 X160.278 Y116.727 E.21129
G1 X160.278 Y116.273 E.02362
G1 X156.222 Y116.273 E.21129
G1 X156.222 Y115.82 E.02362
G1 X160.278 Y115.82 E.21129
G1 X160.278 Y115.366 E.02362
G1 X156.222 Y115.366 E.21129
G1 X156.222 Y114.913 E.02362
G1 X160.278 Y114.913 E.21129
G1 X160.278 Y114.459 E.02362
G1 X156.222 Y114.459 E.21129
G1 X156.222 Y114.006 E.02362
G1 X160.278 Y114.006 E.21129
G1 X160.278 Y113.553 E.02362
G1 X156.222 Y113.553 E.21129
G1 X156.222 Y113.099 E.02362
G1 X160.278 Y113.099 E.21129
G1 X160.278 Y112.646 E.02362
G1 X156.222 Y112.646 E.21129
G1 X156.222 Y112.192 E.02362
G1 X157.114 Y112.192 E.04647
G1 X157.593 Y112.38 E.02683
G2 X158.911 Y112.379 I.655 J-2.691 E.06931
G1 X159.386 Y112.192 E.02657
G1 X160.481 Y112.192 E.05701
M106 S242.25
G1 X160.104 Y111.505 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X160.04 Y111.542 E.00204
G1 X160.088 Y111.57 E.00155
G1 X160.203 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126786
G1 F15000
G1 X160.321 Y111.055 E.00138
; LINE_WIDTH: 0.173115
G1 X160.379 Y110.97 E.0011
; LINE_WIDTH: 0.136067
G1 X160.404 Y110.839 E.00101
; LINE_WIDTH: 0.0969204
G1 X160.422 Y110.734 E.00047
G1 X160.422 Y109.359 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X160.404 Y109.255 E.00047
; LINE_WIDTH: 0.136066
G1 X160.379 Y109.124 E.00101
; LINE_WIDTH: 0.17311
G1 X160.321 Y109.038 E.0011
; LINE_WIDTH: 0.126781
G1 X160.203 Y108.874 E.00138
G1 X160.102 Y108.515 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X160.038 Y108.552 E.00204
G1 X160.087 Y108.58 E.00155
G1 X156.46 Y108.552 F30000
G1 F15000
G1 X156.397 Y108.588 E.00204
G1 X156.397 Y108.515 E.00204
G1 X156.075 Y108.589 E.00913
G1 X156.124 Y108.617 E.00155
G1 X156.297 Y108.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F15000
G1 X156.237 Y108.953 E.00044
; LINE_WIDTH: 0.111404
G1 X156.179 Y109.038 E.00058
; LINE_WIDTH: 0.14818
G2 X156.115 Y109.15 I.121 J.144 E.00113
; LINE_WIDTH: 0.161457
G1 X156.096 Y109.255 E.00103
; LINE_WIDTH: 0.129189
G1 X156.078 Y109.359 E.00075
G1 X156.078 Y110.734 F30000
; LINE_WIDTH: 0.129188
G1 F15000
G1 X156.096 Y110.839 E.00075
; LINE_WIDTH: 0.161454
G1 X156.115 Y110.943 E.00103
; LINE_WIDTH: 0.14818
G2 X156.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111401
G1 X156.237 Y111.141 E.00058
; LINE_WIDTH: 0.097391
G1 X156.297 Y111.22 E.00044
G1 X156.152 Y111.47 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X156.088 Y111.507 E.00204
G1 X156.152 Y111.543 E.00204
G1 X156.173 Y111.507 E.00118
G1 X156.398 Y111.505 E.00624
G1 X156.398 Y111.578 E.00204
G1 X156.41 Y111.571 E.00038
G1 X156.019 Y107.868 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.425254
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X157.197 Y107.868 E.06815
G3 X158.431 Y107.629 I1.094 J2.34 E.0735
G1 X158.907 Y107.713 E.02793
G1 X159.303 Y107.868 E.02465
G1 X160.278 Y107.868 E.05643
G1 X160.278 Y107.393 E.0275
G1 X156.222 Y107.393 E.23474
G1 X156.222 Y106.918 E.0275
G1 X160.278 Y106.918 E.23474
G1 X160.278 Y106.443 E.0275
G1 X156.222 Y106.443 E.23474
G1 X156.222 Y105.967 E.0275
G1 X160.278 Y105.967 E.23474
G1 X160.278 Y105.492 E.0275
G1 X156.222 Y105.492 E.23474
G1 X156.222 Y105.017 E.0275
G1 X160.278 Y105.017 E.23474
G1 X160.278 Y104.542 E.0275
G1 X156.222 Y104.542 E.23474
G1 X156.222 Y104.066 E.0275
G1 X160.278 Y104.066 E.23474
G1 X160.278 Y103.591 E.0275
G1 X156.222 Y103.591 E.23474
G1 X156.222 Y103.116 E.0275
G1 X160.278 Y103.116 E.23474
G1 X160.278 Y102.641 E.0275
G1 X156.222 Y102.641 E.23474
G1 X156.222 Y102.165 E.0275
G1 X160.481 Y102.165 E.24646
M106 S242.25
; WIPE_START
G1 F24000
G1 X158.481 Y102.165 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.621 J-1.046 P1  F30000
G1 X122.864 Y123.311 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X122.607 Y123.584 E.01244
G3 X120.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X121.199 Y119.994 E.00679
G3 X122.901 Y123.264 I.051 J2.051 E.15186
G1 X122.586 Y123.028 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X122.572 Y123.048 E.00075
G3 X121.044 Y120.399 I-1.322 J-1.002 E.20082
G1 X121.209 Y120.387 E.00509
G3 X122.745 Y122.766 I.041 J1.659 E.10426
G1 X122.617 Y122.977 E.00756
M204 S10000
; WIPE_START
G1 F24000
G1 X122.572 Y123.048 E-.03206
G1 X122.349 Y123.291 E-.12557
G1 X122.08 Y123.484 E-.12564
G1 X121.779 Y123.62 E-.12563
G1 X121.457 Y123.694 E-.12565
G1 X121.126 Y123.702 E-.12563
G1 X120.867 Y123.657 E-.09982
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.211 J.12 P1  F30000
G1 X122.39 Y108.343 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X122.684 Y108.576 E.01245
G3 X121 Y108.009 I-1.432 J1.469 E.36662
G1 X121.199 Y107.994 E.00661
G3 X122.342 Y108.307 I.054 J2.051 E.03989
G1 X122.151 Y108.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X121.046 Y108.399 I-.9 J1.394 E.28477
G1 X121.209 Y108.387 E.00503
G3 X122.1 Y108.62 I.042 J1.659 E.02869
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14827
G1 X122.622 Y109.111 E-.12563
G1 X122.78 Y109.402 E-.12564
G1 X122.877 Y109.718 E-.12563
G1 X122.91 Y110.047 E-.12564
G1 X122.882 Y110.333 E-.1092
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.194 J-.237 P1  F30000
G1 X118.852 Y130.649 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X118.852 Y101.783 E.95753
G1 X123.648 Y101.783 E.15909
G1 X123.648 Y130.168 E.9416
G2 X125.681 Y133.946 I17.295 J-6.875 E.14261
G1 X114.064 Y133.946 E.38538
G3 X116.295 Y130.649 I2.227 J-.896 E.15571
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.46 Y101.391 E.88696
G1 X124.04 Y101.391 E.17146
G1 X124.04 Y130.089 E.88182
G2 X126.476 Y134.338 I15.93 J-6.311 E.151
G1 X113.807 Y134.338 E.38928
G3 X116.29 Y130.257 I2.491 J-1.28 E.1758
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.115 J-.489 P1  F30000
G1 X115.983 Y133.778 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.405036
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X114.264 Y133.104 E.09691
G3 X114.314 Y132.634 I1.378 J-.092 E.0249
G1 X116.712 Y133.576 E.13526
G1 X117.958 Y133.576 E.06539
G1 X114.448 Y132.198 E.19791
G1 X114.691 Y131.805 E.02427
G1 X119.203 Y133.576 E.25447
G1 X120.449 Y133.576 E.06539
G1 X115.043 Y131.454 E.30486
G3 X115.545 Y131.162 I1.344 J1.734 E.03057
G1 X121.694 Y133.576 E.34679
G1 X122.94 Y133.576 E.06539
G1 X116.449 Y131.028 E.36603
G1 X117.682 Y131.023 E.0647
G1 X124.185 Y133.576 E.36677
G1 X124.915 Y133.576 E.03829
G1 X124.778 Y133.32 E.01524
G1 X118.914 Y131.018 E.3307
G1 X119.222 Y131.017 E.01616
G1 X119.222 Y130.65 E.01925
G1 X124.449 Y132.701 E.29476
G1 X124.119 Y132.083 E.03677
G1 X119.222 Y130.161 E.27618
G1 X119.222 Y129.672 E.02566
G1 X123.816 Y131.476 E.25909
G3 X123.548 Y130.881 I6.32 J-3.213 E.03424
G1 X119.222 Y129.184 E.24395
G1 X119.222 Y128.695 E.02566
G1 X123.3 Y130.296 E.23001
G1 X123.278 Y130.243 E.00298
G1 X123.278 Y129.798 E.02337
G1 X119.222 Y128.206 E.22876
G1 X119.222 Y127.717 E.02566
G1 X123.278 Y129.309 E.22876
G1 X123.278 Y128.82 E.02566
G1 X119.222 Y127.228 E.22876
G1 X119.222 Y126.74 E.02566
G1 X123.278 Y128.332 E.22876
G1 X123.278 Y127.843 E.02566
G1 X119.222 Y126.251 E.22876
G1 X119.222 Y125.762 E.02566
G1 X123.278 Y127.354 E.22876
G1 X123.278 Y126.865 E.02566
G1 X119.222 Y125.273 E.22876
G1 X119.222 Y124.784 E.02566
G1 X123.278 Y126.376 E.22876
G1 X123.278 Y125.887 E.02566
G1 X119.222 Y124.295 E.22876
G1 X119.222 Y123.842 E.0238
G1 X120.593 Y124.38 E.07735
G1 X120.758 Y124.409 E.00876
G1 X123.278 Y125.399 E.14214
G1 X123.278 Y124.91 E.02566
G1 X121.906 Y124.371 E.07738
G1 X122.694 Y124.191 E.04241
G1 X123.481 Y124.5 E.04439
M106 S242.25
G1 X123.016 Y123.706 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.395426
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X123.276 Y123.725 E.00749
G1 X123.142 Y123.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129168
G1 F15000
G1 X123.274 Y123.149 E.00149
; LINE_WIDTH: 0.179234
G1 X123.343 Y123.058 E.00126
; LINE_WIDTH: 0.195633
G1 X123.444 Y122.91 E.00224
G1 X123.421 Y122.731 F30000
; LINE_WIDTH: 0.119475
G1 F15000
G3 X123.351 Y123.146 I-8.395 J-1.215 E.00262
G1 X123.422 Y121.359 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
M73 P94 R1
G1 X123.404 Y121.255 E.00047
; LINE_WIDTH: 0.136064
G1 X123.379 Y121.124 E.00101
; LINE_WIDTH: 0.173107
G1 X123.321 Y121.038 E.0011
; LINE_WIDTH: 0.12678
G1 X123.203 Y120.874 E.00138
G1 X123.102 Y120.515 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X123.038 Y120.552 E.00204
G1 X123.087 Y120.58 E.00155
G1 X123.481 Y119.901 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.403459
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X122.386 Y119.901 E.05702
G1 X121.907 Y119.713 E.02683
G1 X121.431 Y119.629 E.02515
G1 X120.949 Y119.641 E.02515
G1 X119.81 Y119.901 E.06086
G1 X119.222 Y119.901 E.03061
G1 X119.222 Y119.448 E.02362
G1 X123.278 Y119.448 E.21129
G1 X123.278 Y118.994 E.02362
G1 X119.222 Y118.994 E.21129
G1 X119.222 Y118.541 E.02362
G1 X123.278 Y118.541 E.21129
G1 X123.278 Y118.087 E.02362
G1 X119.222 Y118.087 E.21129
G1 X119.222 Y117.634 E.02362
G1 X123.278 Y117.634 E.21129
G1 X123.278 Y117.18 E.02362
G1 X119.222 Y117.18 E.21129
G1 X119.222 Y116.727 E.02362
G1 X123.278 Y116.727 E.21129
G1 X123.278 Y116.273 E.02362
G1 X119.222 Y116.273 E.21129
G1 X119.222 Y115.82 E.02362
G1 X123.278 Y115.82 E.21129
G1 X123.278 Y115.366 E.02362
G1 X119.222 Y115.366 E.21129
G1 X119.222 Y114.913 E.02362
G1 X123.278 Y114.913 E.21129
G1 X123.278 Y114.459 E.02362
G1 X119.222 Y114.459 E.21129
G1 X119.222 Y114.006 E.02362
G1 X123.278 Y114.006 E.21129
G1 X123.278 Y113.553 E.02362
G1 X119.222 Y113.553 E.21129
G1 X119.222 Y113.099 E.02362
G1 X123.278 Y113.099 E.21129
G1 X123.278 Y112.646 E.02362
G1 X119.222 Y112.646 E.21129
G1 X119.222 Y112.192 E.02362
G1 X120.114 Y112.192 E.04647
G1 X120.593 Y112.38 E.02683
G2 X121.911 Y112.379 I.655 J-2.691 E.06931
G1 X122.386 Y112.192 E.02657
G1 X123.481 Y112.192 E.05701
M106 S242.25
G1 X123.104 Y111.505 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X123.04 Y111.542 E.00204
G1 X123.088 Y111.57 E.00155
G1 X123.203 Y111.22 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126783
G1 F15000
G1 X123.321 Y111.055 E.00138
; LINE_WIDTH: 0.173111
G1 X123.379 Y110.97 E.0011
; LINE_WIDTH: 0.136065
G1 X123.404 Y110.839 E.00101
; LINE_WIDTH: 0.0969204
G1 X123.422 Y110.734 E.00047
G1 X123.422 Y109.359 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X123.404 Y109.255 E.00047
; LINE_WIDTH: 0.136064
G1 X123.379 Y109.124 E.00101
; LINE_WIDTH: 0.173107
G1 X123.321 Y109.038 E.0011
; LINE_WIDTH: 0.126779
G1 X123.203 Y108.874 E.00138
G1 X123.102 Y108.515 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X123.038 Y108.552 E.00204
G1 X123.087 Y108.58 E.00155
G1 X119.46 Y108.552 F30000
G1 F15000
G1 X119.397 Y108.588 E.00204
G1 X119.397 Y108.515 E.00204
G1 X119.075 Y108.589 E.00913
G1 X119.124 Y108.617 E.00155
G1 X119.297 Y108.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F15000
G1 X119.237 Y108.953 E.00044
; LINE_WIDTH: 0.111404
G1 X119.179 Y109.038 E.00058
; LINE_WIDTH: 0.148179
G2 X119.115 Y109.15 I.121 J.144 E.00113
; LINE_WIDTH: 0.161461
G1 X119.096 Y109.255 E.00103
; LINE_WIDTH: 0.129191
G1 X119.078 Y109.359 E.00075
G1 X119.078 Y110.734 F30000
; LINE_WIDTH: 0.12919
G1 F15000
G1 X119.096 Y110.839 E.00075
; LINE_WIDTH: 0.161458
G1 X119.115 Y110.943 E.00103
; LINE_WIDTH: 0.148177
G2 X119.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111398
G1 X119.237 Y111.141 E.00058
; LINE_WIDTH: 0.0973908
G1 X119.297 Y111.22 E.00044
G1 X119.152 Y111.47 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X119.088 Y111.507 E.00204
G1 X119.152 Y111.543 E.00204
G1 X119.173 Y111.507 E.00118
G1 X119.398 Y111.505 E.00624
G1 X119.398 Y111.578 E.00204
G1 X119.41 Y111.571 E.00038
G1 X119.019 Y107.868 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.425254
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X120.197 Y107.868 E.06815
G3 X121.431 Y107.629 I1.094 J2.34 E.0735
G1 X121.907 Y107.713 E.02793
G1 X122.303 Y107.868 E.02465
G1 X123.278 Y107.868 E.05643
G1 X123.278 Y107.393 E.0275
G1 X119.222 Y107.393 E.23474
G1 X119.222 Y106.918 E.0275
G1 X123.278 Y106.918 E.23474
G1 X123.278 Y106.443 E.0275
G1 X119.222 Y106.443 E.23474
G1 X119.222 Y105.967 E.0275
G1 X123.278 Y105.967 E.23474
G1 X123.278 Y105.492 E.0275
G1 X119.222 Y105.492 E.23474
G1 X119.222 Y105.017 E.0275
G1 X123.278 Y105.017 E.23474
G1 X123.278 Y104.542 E.0275
G1 X119.222 Y104.542 E.23474
G1 X119.222 Y104.066 E.0275
G1 X123.278 Y104.066 E.23474
G1 X123.278 Y103.591 E.0275
G1 X119.222 Y103.591 E.23474
G1 X119.222 Y103.116 E.0275
G1 X123.278 Y103.116 E.23474
G1 X123.278 Y102.641 E.0275
G1 X119.222 Y102.641 E.23474
G1 X119.222 Y102.165 E.0275
G1 X123.481 Y102.165 E.24646
M106 S242.25
; WIPE_START
G1 F24000
G1 X121.481 Y102.165 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.207 J-.152 P1  F30000
G1 X119.18 Y120.403 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X119.273 Y120.36 E.00284
G1 X119.425 Y120.38 E.00425
G1 X119.358 Y120.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F15000
G1 X119.294 Y120.854 E.00044
; LINE_WIDTH: 0.111419
G1 X119.228 Y120.941 E.00061
; LINE_WIDTH: 0.145821
G1 X119.158 Y121.034 E.00097
; LINE_WIDTH: 0.178942
G1 X119.056 Y121.181 E.00199
G1 X119.11 Y121.175 F30000
; LINE_WIDTH: 0.153609
G1 F15000
G1 X119.156 Y120.941 E.00215
G1 X119.11 Y121.175 F30000
; LINE_WIDTH: 0.15212
G1 F15000
G1 X119.094 Y121.267 E.00083
; LINE_WIDTH: 0.12452
G1 X119.078 Y121.359 E.00062
G1 X119.078 Y122.734 F30000
; LINE_WIDTH: 0.12919
G1 F15000
G1 X119.096 Y122.839 E.00075
; LINE_WIDTH: 0.16146
G1 X119.115 Y122.943 E.00103
; LINE_WIDTH: 0.148189
G2 X119.179 Y123.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111411
G1 X119.237 Y123.141 E.00058
; LINE_WIDTH: 0.097392
G1 X119.297 Y123.22 E.00044
G1 X119.152 Y123.47 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X119.088 Y123.507 E.00204
G1 X119.152 Y123.543 E.00204
G1 X119.173 Y123.507 E.00118
G1 X119.398 Y123.505 E.00624
G1 X119.398 Y123.578 E.00204
G1 X119.41 Y123.572 E.00038
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.398 Y123.578 E-.0206
G1 X119.398 Y123.505 E-.11139
G1 X119.173 Y123.507 E-.34094
G1 X119.152 Y123.543 E-.06431
G1 X119.088 Y123.507 E-.11139
G1 X119.152 Y123.47 E-.11139
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/63
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
G3 Z9 I.005 J1.217 P1  F30000
G1 X159.864 Y123.311 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9449
G1 X159.607 Y123.584 E.01244
G3 X157.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X158.199 Y119.994 E.00679
G3 X159.901 Y123.264 I.051 J2.051 E.15187
G1 X159.6 Y123.005 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9449
G1 X159.572 Y123.048 E.00158
G3 X158.044 Y120.399 I-1.322 J-1.002 E.20082
G1 X158.209 Y120.387 E.00509
G3 X159.745 Y122.766 I.041 J1.659 E.10426
G1 X159.631 Y122.954 E.00673
M204 S10000
; WIPE_START
G1 F24000
G1 X159.572 Y123.048 E-.0423
G1 X159.349 Y123.291 E-.12557
G1 X159.08 Y123.484 E-.12563
G1 X158.779 Y123.62 E-.12564
G1 X158.457 Y123.694 E-.12564
G1 X158.126 Y123.702 E-.12563
G1 X157.894 Y123.661 E-.08959
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.207 J.159 P1  F30000
G1 X159.474 Y111.691 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9449
G1 X159.447 Y111.711 E.00111
G3 X157.995 Y108.01 I-1.197 J-1.666 E.24771
G1 X158.199 Y107.994 E.00679
G3 X159.753 Y111.441 I.051 J2.051 E.15952
G1 X159.518 Y111.651 E.01045
G1 X159.202 Y111.405 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9449
G1 X158.932 Y111.558 E.00953
G3 X158.044 Y108.399 I-.682 J-1.513 E.17541
G1 X158.209 Y108.387 E.00509
G3 X159.25 Y111.37 I.041 J1.659 E.12846
M204 S10000
; WIPE_START
G1 F24000
G1 X158.932 Y111.558 E-.14045
G1 X158.62 Y111.665 E-.12557
G1 X158.291 Y111.706 E-.12563
G1 X157.962 Y111.682 E-.12564
G1 X157.644 Y111.592 E-.12563
G1 X157.369 Y111.452 E-.11708
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.195 J.229 P1  F30000
G1 X161.04 Y130.649 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9449
G1 X163.205 Y130.649 E.07181
G3 X165.506 Y133.746 I.001 J2.403 E.14859
G1 X153.952 Y133.746 E.38328
G2 X155.852 Y130.168 I-15.047 J-10.287 E.13464
G1 X155.852 Y101.935 E.93656
G1 X160.648 Y101.935 E.15909
G1 X160.648 Y130.649 E.95249
G1 X160.98 Y130.649 E.01102
G1 X161.04 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9449
G1 X163.21 Y130.257 E.06667
G3 X165.78 Y134.138 I-.004 J2.794 E.16905
G1 X153.183 Y134.138 E.38708
G2 X155.46 Y130.089 I-13.525 J-10.273 E.14318
G1 X155.46 Y101.543 E.87715
G1 X161.04 Y101.543 E.17146
G1 X161.04 Y130.197 E.88045
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.781 J-.933 P1  F30000
G1 X157.375 Y125.51 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9449
G1 X157.375 Y130.21 E.14441
G1 X157.32 Y130.588 E.01173
G3 X156.606 Y132.222 I-16.321 J-6.158 E.05484
G1 X159.676 Y132.222 E.09434
G1 X160.058 Y132.209 E.01172
; LINE_WIDTH: 0.462282
G1 X160.439 Y132.197 E.01304
G1 X159.748 Y131.972 E.02484
; LINE_WIDTH: 0.419999
G1 X159.31 Y131.526 E.01921
G1 X159.133 Y130.995 E.0172
G3 X159.125 Y125.505 I275.637 J-3.138 E.1687
G1 X158.564 Y125.606 E.01752
G1 X157.852 Y125.597 E.02186
G1 X157.434 Y125.521 E.01305
G1 X157.753 Y125.997 F30000
G1 F9449
G1 X157.753 Y130.21 E.12943
G1 X157.682 Y130.695 E.01509
G3 X157.204 Y131.845 I-15.232 J-5.655 E.03826
G1 X159.11 Y131.845 E.05858
G1 X158.986 Y131.718 E.00546
G1 X158.769 Y131.12 E.01955
G1 X158.748 Y130.592 E.01625
G1 X158.748 Y125.961 E.14229
G3 X157.813 Y125.997 I-.853 J-10.078 E.02876
G1 X158.096 Y126.334 F30000
; LINE_WIDTH: 0.351907
G1 F9449
G1 X158.096 Y130.21 E.09758
G1 X158.033 Y130.8 E.01496
; LINE_WIDTH: 0.398827
G1 X157.991 Y130.967 E.00499
; LINE_WIDTH: 0.475403
G3 X157.821 Y131.438 I-1.593 J-.309 E.0177
G1 X158.459 Y131.438 E.02247
G1 X158.367 Y131.184 E.0095
; LINE_WIDTH: 0.48038
G1 X158.377 Y130.987 E.00705
; LINE_WIDTH: 0.443098
G1 X158.386 Y130.789 E.00645
; LINE_WIDTH: 0.405816
G1 X158.396 Y130.592 E.00585
; LINE_WIDTH: 0.353316
G1 X158.405 Y126.33 E.10779
M73 P94 R0
G1 X158.156 Y126.333 E.0063
G1 X160.439 Y132.197 F30000
; LINE_WIDTH: 0.471072
G1 F9449
G1 X163.218 Y132.202 E.09697
G1 X155.986 Y132.599 F30000
; LINE_WIDTH: 0.419999
G1 F9449
G1 X164.355 Y132.599 E.25713
G1 X164.188 Y132.275 E.01119
G1 X163.852 Y131.986 E.01363
G2 X163.28 Y131.806 I-.66 J1.096 E.0186
G1 X160.441 Y131.794 E.08725
G1 X159.947 Y131.652 E.01579
G1 X159.634 Y131.333 E.01372
G1 X159.507 Y130.954 E.01228
G3 X159.502 Y124.98 I397.929 J-3.359 E.18355
G1 X159.179 Y125.105 E.01064
G1 X158.554 Y125.229 E.01956
G1 X157.918 Y125.226 E.01956
G1 X157.294 Y125.097 E.01956
G1 X156.998 Y124.981 E.00977
G1 X156.998 Y130.21 E.16066
G1 X156.924 Y130.576 E.01149
G3 X156.015 Y132.546 I-19.035 J-7.594 E.06671
G1 X155.344 Y132.976 F30000
G1 F9449
G1 X164.831 Y132.976 E.29152
G1 X164.81 Y132.766 E.00648
G1 X164.633 Y132.261 E.01645
G1 X164.424 Y131.98 E.01078
G1 X164.021 Y131.649 E.016
G2 X163.282 Y131.429 I-.835 J1.451 E.02393
G1 X160.442 Y131.417 E.08725
G1 X160.146 Y131.332 E.00947
G1 X159.958 Y131.14 E.00823
G1 X159.879 Y130.851 E.00921
G1 X159.879 Y124.339 E.20012
G1 X159.611 Y124.517 E.00988
G1 X159.095 Y124.738 E.01726
G1 X158.545 Y124.852 E.01726
G1 X157.983 Y124.855 E.01726
G1 X157.432 Y124.746 E.01726
G1 X156.913 Y124.531 E.01726
G1 X156.621 Y124.342 E.01068
G1 X156.621 Y130.21 E.1803
G1 X156.532 Y130.536 E.0104
G3 X155.375 Y132.925 I-16.403 J-6.468 E.08164
G1 X154.668 Y133.353 F30000
G1 F9449
G1 X165.176 Y133.353 E.32289
G2 X165.185 Y132.728 I-1.521 J-.334 E.01934
G1 X165.009 Y132.19 E.01741
G1 X164.763 Y131.778 E.01473
G1 X164.321 Y131.378 E.01831
G1 X163.886 Y131.159 E.01497
G1 X163.283 Y131.052 E.01883
G1 X160.444 Y131.04 E.08725
G1 X160.282 Y130.948 E.00571
G1 X160.256 Y130.21 E.02269
G1 X160.256 Y123.79 E.19726
G1 X160.137 Y123.816 E.00373
G1 X160.017 Y123.722 E.0047
G1 X159.854 Y123.892 E.00724
G1 X159.456 Y124.173 E.01496
G1 X159.011 Y124.37 E.01496
G1 X158.535 Y124.475 E.01496
G1 X158.049 Y124.483 E.01496
G1 X157.57 Y124.395 E.01496
G1 X157.118 Y124.214 E.01496
G1 X156.704 Y123.94 E.01525
G1 X156.412 Y123.624 E.01321
G1 X156.316 Y123.696 E.00367
G1 X156.244 Y123.682 E.00225
G1 X156.244 Y130.21 E.20058
G3 X154.7 Y133.302 I-14.608 J-5.364 E.10644
; WIPE_START
G1 F24000
G1 X155.123 Y132.616 E-.30642
G1 X155.52 Y131.871 E-.32073
G1 X155.671 Y131.556 E-.13285
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.214 J.091 P1  F30000
G1 X156.297 Y123.22 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973907
G1 F9449
G1 X156.237 Y123.141 E.00044
; LINE_WIDTH: 0.111398
G1 X156.179 Y123.055 E.00058
; LINE_WIDTH: 0.148173
G3 X156.115 Y122.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X156.096 Y122.839 E.00103
; LINE_WIDTH: 0.12919
G1 X156.078 Y122.734 E.00075
G1 X156.079 Y121.362 F30000
; LINE_WIDTH: 0.119472
G1 F9449
G3 X156.149 Y120.947 I8.323 J1.204 E.00262
G1 X156.226 Y120.944 F30000
; LINE_WIDTH: 0.111411
G1 F9449
G1 X156.294 Y120.854 E.00063
; LINE_WIDTH: 0.0973915
G1 X156.358 Y120.778 E.00044
G1 X156.226 Y120.944 F30000
; LINE_WIDTH: 0.147275
G1 F9449
G1 X156.153 Y121.041 E.00103
; LINE_WIDTH: 0.181648
G1 X156.056 Y121.183 E.00195
G1 X158.096 Y117.763 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9449
G1 X158.405 Y117.759 E.00778
G1 X158.405 Y114.33 E.08633
G1 X158.096 Y114.334 E.00778
G1 X158.096 Y117.703 E.08482
G1 X157.753 Y118.132 F30000
; LINE_WIDTH: 0.419999
G1 F9449
G3 X158.748 Y118.096 I.892 J10.727 E.03061
G1 X158.748 Y113.961 E.12705
G3 X157.753 Y113.997 I-.892 J-10.728 E.03061
G1 X157.753 Y118.072 E.12521
G1 X157.375 Y118.589 F30000
G1 F9449
G1 X157.936 Y118.487 E.01752
G1 X158.648 Y118.496 E.02186
G1 X159.125 Y118.583 E.01489
G1 X159.125 Y113.505 E.15606
G1 X158.564 Y113.606 E.01752
G1 X157.852 Y113.597 E.02186
G1 X157.375 Y113.51 E.01489
G1 X157.375 Y118.529 E.15421
G1 X156.998 Y119.113 F30000
G1 F9449
G1 X157.321 Y118.988 E.01064
G1 X157.946 Y118.864 E.01956
G1 X158.582 Y118.867 E.01956
G1 X159.206 Y118.996 E.01956
G1 X159.502 Y119.112 E.00977
G1 X159.502 Y112.98 E.18842
G1 X159.179 Y113.105 E.01064
G1 X158.554 Y113.229 E.01956
G1 X157.918 Y113.226 E.01956
G1 X157.294 Y113.097 E.01956
G1 X156.998 Y112.981 E.00977
G1 X156.998 Y119.053 E.18657
G1 X156.621 Y119.755 F30000
G1 F9449
G1 X156.889 Y119.576 E.00988
G1 X157.405 Y119.355 E.01726
G1 X157.955 Y119.241 E.01726
G1 X158.517 Y119.238 E.01726
G1 X159.068 Y119.347 E.01726
G1 X159.587 Y119.563 E.01726
G1 X159.879 Y119.751 E.01068
G1 X159.879 Y112.339 E.22777
G1 X159.611 Y112.517 E.00988
G1 X159.095 Y112.738 E.01726
G1 X158.545 Y112.852 E.01726
G1 X157.983 Y112.855 E.01726
G1 X157.432 Y112.746 E.01726
G1 X156.913 Y112.53 E.01726
G1 X156.621 Y112.342 E.01068
G1 X156.621 Y119.695 E.22593
G1 X156.244 Y120.305 F30000
G1 F9449
G1 X156.371 Y120.287 E.00392
G1 X156.483 Y120.371 E.00433
G1 X156.646 Y120.201 E.00724
G1 X157.044 Y119.92 E.01496
G1 X157.489 Y119.723 E.01496
G1 X157.965 Y119.618 E.01496
G1 X158.451 Y119.61 E.01496
G1 X158.93 Y119.698 E.01496
G1 X159.382 Y119.879 E.01496
G1 X159.796 Y120.154 E.01525
G1 X160.088 Y120.469 E.01321
G1 X160.191 Y120.391 E.00395
G1 X160.256 Y120.403 E.00203
G1 X160.256 Y111.79 E.26466
G1 X160.137 Y111.816 E.00373
G1 X160.017 Y111.722 E.0047
G1 X159.854 Y111.892 E.00724
G1 X159.456 Y112.173 E.01496
G1 X159.011 Y112.37 E.01496
G1 X158.535 Y112.475 E.01496
G1 X158.049 Y112.483 E.01496
G1 X157.57 Y112.395 E.01496
G1 X157.118 Y112.214 E.01496
G1 X156.704 Y111.94 E.01525
G1 X156.412 Y111.624 E.01321
G1 X156.316 Y111.696 E.00367
G1 X156.244 Y111.682 E.00225
M73 P95 R0
G1 X156.244 Y120.245 E.26313
G1 X160.203 Y120.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126778
G1 F9449
G1 X160.321 Y121.038 E.00138
; LINE_WIDTH: 0.173108
G1 X160.379 Y121.124 E.0011
; LINE_WIDTH: 0.136065
G1 X160.404 Y121.255 E.00101
; LINE_WIDTH: 0.0969205
G1 X160.422 Y121.359 E.00047
G1 X160.421 Y122.731 F30000
; LINE_WIDTH: 0.119481
G1 F9449
G3 X160.351 Y123.146 I-8.319 J-1.204 E.00262
G1 X160.274 Y123.149 F30000
; LINE_WIDTH: 0.129168
G1 F9449
G1 X160.142 Y123.315 E.00149
G1 X160.274 Y123.149 F30000
; LINE_WIDTH: 0.179231
G1 F9449
G1 X160.343 Y123.058 E.00126
; LINE_WIDTH: 0.195637
G1 X160.444 Y122.91 E.00224
G1 X160.142 Y111.315 F30000
; LINE_WIDTH: 0.129166
G1 F9449
G1 X160.274 Y111.149 E.00149
; LINE_WIDTH: 0.179227
G1 X160.343 Y111.058 E.00126
; LINE_WIDTH: 0.195635
G1 X160.444 Y110.91 E.00224
G1 X160.421 Y110.731 F30000
; LINE_WIDTH: 0.119479
G1 F9449
G3 X160.351 Y111.146 I-8.333 J-1.206 E.00262
G1 X160.422 Y109.359 F30000
; LINE_WIDTH: 0.0969206
G1 F9449
G1 X160.404 Y109.255 E.00047
; LINE_WIDTH: 0.136069
G1 X160.379 Y109.124 E.00101
; LINE_WIDTH: 0.173116
G1 X160.321 Y109.038 E.0011
; LINE_WIDTH: 0.126786
G1 X160.203 Y108.874 E.00138
G1 X158.096 Y105.763 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9449
G1 X158.405 Y105.759 E.00778
G1 X158.405 Y104.178 E.0398
G1 X158.096 Y104.178 E.00778
G1 X158.096 Y105.703 E.03839
G1 X157.753 Y106.132 F30000
; LINE_WIDTH: 0.419999
G1 F9449
G3 X158.748 Y106.096 I.891 J10.709 E.03061
G1 X158.748 Y103.835 E.06946
G1 X157.753 Y103.835 E.03058
G1 X157.753 Y106.072 E.06874
G1 X157.375 Y106.589 F30000
G1 F9449
G1 X157.936 Y106.487 E.01752
G1 X158.648 Y106.496 E.02186
G1 X159.125 Y106.583 E.01489
G1 X159.125 Y103.458 E.09603
G1 X157.375 Y103.458 E.05375
G1 X157.375 Y106.529 E.09435
G1 X156.998 Y107.113 F30000
G1 F9449
G1 X157.321 Y106.988 E.01064
G1 X157.946 Y106.864 E.01956
G1 X158.582 Y106.867 E.01956
G1 X159.206 Y106.996 E.01956
G1 X159.502 Y107.112 E.00977
G1 X159.502 Y103.081 E.12387
G1 X156.998 Y103.081 E.07692
G1 X156.998 Y107.053 E.12204
G1 X156.621 Y107.755 F30000
G1 F9449
G1 X156.889 Y107.576 E.00988
G1 X157.405 Y107.355 E.01726
G1 X157.955 Y107.241 E.01726
G1 X158.517 Y107.238 E.01726
G1 X159.068 Y107.347 E.01726
G1 X159.587 Y107.563 E.01726
G1 X159.879 Y107.751 E.01068
G1 X159.879 Y102.704 E.15509
G1 X156.621 Y102.704 E.10009
G1 X156.621 Y107.695 E.15335
G1 X156.244 Y108.305 F30000
G1 F9449
G1 X156.371 Y108.287 E.00392
G1 X156.483 Y108.371 E.00433
G1 X156.646 Y108.201 E.00724
G1 X157.044 Y107.92 E.01496
G1 X157.489 Y107.723 E.01496
G1 X157.965 Y107.618 E.01496
G1 X158.452 Y107.61 E.01496
G1 X158.93 Y107.698 E.01496
G1 X159.382 Y107.879 E.01496
G1 X159.796 Y108.154 E.01525
G1 X160.088 Y108.469 E.01321
G1 X160.191 Y108.391 E.00395
G1 X160.256 Y108.403 E.00203
G1 X160.256 Y102.327 E.1867
G1 X156.244 Y102.327 E.12327
G1 X156.244 Y108.245 E.18186
G1 X156.358 Y108.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973918
G1 F9449
G1 X156.294 Y108.854 E.00044
; LINE_WIDTH: 0.111408
G1 X156.226 Y108.944 E.00063
; LINE_WIDTH: 0.147271
G1 X156.153 Y109.041 E.00103
; LINE_WIDTH: 0.181642
G1 X156.056 Y109.183 E.00195
G1 X156.079 Y109.362 F30000
; LINE_WIDTH: 0.119475
G1 F9449
G3 X156.149 Y108.947 I8.249 J1.193 E.00262
G1 X156.078 Y110.734 F30000
; LINE_WIDTH: 0.129189
G1 F9449
G1 X156.096 Y110.839 E.00075
; LINE_WIDTH: 0.161458
G1 X156.115 Y110.943 E.00103
; LINE_WIDTH: 0.148188
G2 X156.179 Y111.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111412
G1 X156.237 Y111.141 E.00058
; LINE_WIDTH: 0.0973915
G1 X156.297 Y111.22 E.00044
; WIPE_START
G1 F24000
G1 X156.237 Y111.141 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.417 J-1.143 P1  F30000
G1 X122.864 Y123.311 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9449
G1 X122.607 Y123.584 E.01244
G3 X120.995 Y120.01 I-1.357 J-1.539 E.25449
G1 X121.199 Y119.994 E.00679
G3 X122.901 Y123.264 I.051 J2.051 E.15187
G1 X122.6 Y123.005 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9449
G1 X122.572 Y123.048 E.00158
G3 X121.044 Y120.399 I-1.322 J-1.002 E.20082
G1 X121.209 Y120.387 E.00509
G3 X122.745 Y122.766 I.041 J1.659 E.10426
G1 X122.631 Y122.954 E.00673
M204 S10000
; WIPE_START
G1 F24000
G1 X122.572 Y123.048 E-.0423
G1 X122.349 Y123.291 E-.12557
G1 X122.08 Y123.484 E-.12563
G1 X121.779 Y123.62 E-.12564
G1 X121.457 Y123.694 E-.12564
G1 X121.126 Y123.702 E-.12563
G1 X120.894 Y123.661 E-.08959
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.211 J.118 P1  F30000
G1 X122.39 Y108.343 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9449
G1 X122.683 Y108.577 E.01245
G3 X120.995 Y108.01 I-1.433 J1.468 E.36648
G1 X121.199 Y107.994 E.00679
G3 X122.341 Y108.308 I.051 J2.051 E.03987
G1 X122.151 Y108.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9449
G3 X121.044 Y108.399 I-.901 J1.393 E.28473
G1 X121.209 Y108.387 E.00509
G3 X122.1 Y108.621 I.041 J1.659 E.02869
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14825
G1 X122.622 Y109.111 E-.12563
G1 X122.78 Y109.402 E-.12564
G1 X122.877 Y109.718 E-.12563
G1 X122.91 Y110.036 E-.12177
G1 X122.892 Y110.294 E-.09816
G1 X122.882 Y110.332 E-.01492
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.194 J-.237 P1  F30000
G1 X118.852 Y130.649 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9449
G1 X118.852 Y101.935 E.95249
G1 X123.648 Y101.935 E.15909
G1 X123.648 Y130.168 E.93656
G2 X125.548 Y133.746 I16.948 J-6.71 E.13464
G1 X113.994 Y133.746 E.38328
G3 X116.295 Y130.649 I2.3 J-.694 E.14859
G1 X118.792 Y130.649 E.08283
G1 X118.46 Y130.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9449
G1 X118.46 Y101.543 E.8823
G1 X124.04 Y101.543 E.17146
G1 X124.04 Y130.089 E.87715
G2 X126.318 Y134.138 I15.803 J-6.225 E.14318
G1 X113.722 Y134.138 E.38703
G3 X116.29 Y130.257 I2.572 J-1.088 E.16904
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.065 J-.589 P1  F30000
G1 X116.222 Y132.203 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.459872
G1 F9449
G1 X119.23 Y132.189 E.1022
G1 X124.819 Y133.353 F30000
; LINE_WIDTH: 0.419999
G1 F9449
G3 X123.256 Y130.21 I14.813 J-9.327 E.10807
G1 X123.256 Y123.79 E.19726
G1 X123.137 Y123.816 E.00373
G1 X123.017 Y123.722 E.0047
G1 X122.854 Y123.892 E.00724
G1 X122.456 Y124.173 E.01496
G1 X122.011 Y124.37 E.01496
G1 X121.535 Y124.475 E.01496
G1 X121.049 Y124.483 E.01496
G1 X120.57 Y124.395 E.01496
G1 X120.118 Y124.214 E.01496
G1 X119.704 Y123.94 E.01525
G1 X119.412 Y123.624 E.01321
G1 X119.316 Y123.696 E.00367
G1 X119.244 Y123.682 E.00225
G1 X119.244 Y130.851 E.2203
G1 X119.218 Y130.948 E.00307
G1 X119.088 Y131.037 E.00484
G1 X119.056 Y131.04 E.00098
G1 X116.092 Y131.052 E.09108
G1 X115.613 Y131.159 E.01508
G1 X115.182 Y131.376 E.01485
G1 X114.739 Y131.776 E.01832
G1 X114.489 Y132.194 E.01498
G1 X114.316 Y132.725 E.01715
G2 X114.324 Y133.353 I1.535 J.295 E.01945
G1 X124.759 Y133.353 E.32066
G1 X124.153 Y132.976 F30000
G1 F9449
G3 X122.968 Y130.536 I16.819 J-9.675 E.08343
G1 X122.879 Y130.21 E.0104
G1 X122.879 Y124.339 E.1804
G1 X122.611 Y124.517 E.00988
G1 X122.095 Y124.738 E.01726
G1 X121.545 Y124.852 E.01726
G1 X120.983 Y124.855 E.01726
G1 X120.432 Y124.746 E.01726
G1 X119.913 Y124.531 E.01726
G1 X119.621 Y124.342 E.01068
G1 X119.621 Y130.851 E.20002
G1 X119.542 Y131.14 E.00921
G1 X119.354 Y131.332 E.00823
G1 X119.058 Y131.417 E.00947
G1 X116.135 Y131.429 E.08982
G1 X115.659 Y131.559 E.01516
G1 X115.326 Y131.754 E.01186
G1 X114.987 Y132.083 E.01453
G1 X114.844 Y132.322 E.00855
G1 X114.691 Y132.763 E.01433
G1 X114.669 Y132.976 E.00659
G1 X124.093 Y132.976 E.28957
G1 X123.514 Y132.599 F30000
G1 F9449
G3 X122.516 Y130.372 I14.032 J-7.625 E.07505
G1 X122.502 Y130.21 E.00502
G1 X122.502 Y124.98 E.16068
G1 X122.179 Y125.105 E.01064
G1 X121.554 Y125.229 E.01956
G1 X120.918 Y125.226 E.01956
G1 X120.294 Y125.097 E.01956
G1 X119.998 Y124.981 E.00977
G1 X119.998 Y130.851 E.18038
G1 X119.986 Y131.001 E.0046
G1 X119.866 Y131.333 E.01086
G1 X119.553 Y131.652 E.01372
G1 X119.219 Y131.78 E.01102
G1 X119.06 Y131.794 E.0049
G1 X116.177 Y131.806 E.08857
G1 X115.828 Y131.896 E.01108
G1 X115.579 Y132.034 E.00876
G1 X115.3 Y132.294 E.0117
G1 X115.145 Y132.599 E.01053
G1 X123.454 Y132.599 E.25531
G1 X121.405 Y126.33 F30000
; LINE_WIDTH: 0.351907
G1 F9449
G1 X121.096 Y126.334 E.00778
G1 X121.096 Y130.21 E.09758
G1 X121.119 Y130.851 E.01617
; LINE_WIDTH: 0.398827
G1 X121.126 Y131.018 E.00484
; LINE_WIDTH: 0.475906
G1 X121.133 Y131.184 E.00588
G1 X121.041 Y131.438 E.00951
G1 X121.679 Y131.438 E.02249
G1 X121.52 Y131.022 E.01572
; LINE_WIDTH: 0.448828
G1 X121.474 Y130.793 E.00773
; LINE_WIDTH: 0.408681
G1 X121.427 Y130.564 E.00697
; LINE_WIDTH: 0.35332
G1 X121.405 Y130.21 E.00897
G1 X121.405 Y126.39 E.09661
G1 X121.748 Y125.961 F30000
; LINE_WIDTH: 0.419999
G1 F9449
G3 X120.753 Y125.997 I-.892 J-10.727 E.03061
G1 X120.753 Y130.851 E.14915
G1 X120.731 Y131.12 E.00828
G1 X120.514 Y131.718 E.01955
G1 X120.39 Y131.845 E.00546
G1 X122.296 Y131.845 E.05858
G1 X121.926 Y130.976 E.02904
G1 X121.773 Y130.503 E.01527
G1 X121.748 Y130.21 E.00904
G1 X121.748 Y126.021 E.12871
G1 X122.125 Y125.505 F30000
G1 F9449
G1 X121.564 Y125.606 E.01752
G1 X120.852 Y125.597 E.02186
G1 X120.375 Y125.51 E.01489
G1 X120.375 Y130.851 E.16413
G1 X120.359 Y131.06 E.00644
G1 X120.19 Y131.526 E.01521
G1 X119.753 Y131.972 E.01921
G1 X119.521 Y132.079 E.00783
; LINE_WIDTH: 0.479921
G1 X119.29 Y132.186 E.00908
G1 X119.824 Y132.222 E.01906
; LINE_WIDTH: 0.419999
G1 X122.894 Y132.222 E.09434
G3 X122.145 Y130.438 I13.205 J-6.597 E.05952
G1 X122.125 Y130.21 E.00703
G1 X122.125 Y125.565 E.14273
G1 X123.142 Y123.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129166
G1 F9449
G1 X123.274 Y123.149 E.00149
; LINE_WIDTH: 0.179227
G1 X123.343 Y123.058 E.00126
; LINE_WIDTH: 0.195633
G1 X123.444 Y122.91 E.00224
G1 X123.421 Y122.731 F30000
; LINE_WIDTH: 0.119476
G1 F9449
G3 X123.351 Y123.146 I-8.324 J-1.205 E.00262
G1 X123.422 Y121.359 F30000
; LINE_WIDTH: 0.0969205
G1 F9449
G1 X123.404 Y121.255 E.00047
; LINE_WIDTH: 0.136065
G1 X123.379 Y121.124 E.00101
; LINE_WIDTH: 0.173107
G1 X123.321 Y121.038 E.0011
; LINE_WIDTH: 0.126779
G1 X123.203 Y120.874 E.00138
G1 X123.256 Y120.403 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9449
G1 X123.256 Y111.79 E.26466
G1 X123.137 Y111.816 E.00373
G1 X123.017 Y111.722 E.0047
G1 X122.854 Y111.892 E.00724
G1 X122.456 Y112.173 E.01496
G1 X122.011 Y112.37 E.01496
G1 X121.535 Y112.475 E.01496
G1 X121.049 Y112.483 E.01496
G1 X120.57 Y112.395 E.01496
G1 X120.118 Y112.214 E.01496
G1 X119.704 Y111.94 E.01525
G1 X119.412 Y111.624 E.01321
G1 X119.316 Y111.696 E.00367
G1 X119.244 Y111.682 E.00225
G1 X119.244 Y120.305 E.26498
G1 X119.371 Y120.287 E.00392
G1 X119.483 Y120.371 E.00433
G1 X119.646 Y120.201 E.00724
G1 X120.044 Y119.92 E.01496
G1 X120.489 Y119.723 E.01496
G1 X120.965 Y119.618 E.01496
G1 X121.452 Y119.61 E.01496
G1 X121.93 Y119.698 E.01496
G1 X122.382 Y119.879 E.01496
G1 X122.796 Y120.154 E.01525
G1 X123.088 Y120.469 E.01321
G1 X123.197 Y120.393 E.00409
G1 X122.879 Y119.751 F30000
G1 F9449
G1 X122.879 Y112.339 E.22777
G1 X122.611 Y112.517 E.00988
G1 X122.095 Y112.738 E.01726
G1 X121.545 Y112.852 E.01726
G1 X120.983 Y112.855 E.01726
G1 X120.432 Y112.746 E.01726
G1 X119.913 Y112.531 E.01726
G1 X119.621 Y112.342 E.01068
G1 X119.621 Y119.755 E.22777
G1 X119.889 Y119.576 E.00988
G1 X120.405 Y119.355 E.01726
G1 X120.955 Y119.241 E.01726
G1 X121.517 Y119.238 E.01726
G1 X122.068 Y119.347 E.01726
G1 X122.587 Y119.563 E.01726
G1 X122.828 Y119.719 E.00884
G1 X122.502 Y119.112 F30000
G1 F9449
G1 X122.502 Y112.98 E.18842
G1 X122.179 Y113.105 E.01064
G1 X121.554 Y113.229 E.01956
G1 X120.918 Y113.226 E.01956
G1 X120.294 Y113.097 E.01956
G1 X119.998 Y112.981 E.00977
G1 X119.998 Y119.113 E.18842
G1 X120.321 Y118.988 E.01064
G1 X120.946 Y118.864 E.01956
G1 X121.582 Y118.867 E.01956
G1 X122.206 Y118.996 E.01956
G1 X122.446 Y119.09 E.00792
G1 X122.125 Y118.583 F30000
G1 F9449
G1 X122.125 Y113.505 E.15606
G1 X121.564 Y113.606 E.01752
G1 X120.852 Y113.597 E.02186
G1 X120.375 Y113.51 E.01489
G1 X120.375 Y118.589 E.15606
G1 X120.936 Y118.487 E.01752
G1 X121.648 Y118.496 E.02186
G1 X122.066 Y118.573 E.01305
G1 X121.748 Y118.096 F30000
G1 F9449
G1 X121.748 Y113.961 E.12705
G3 X120.753 Y113.997 I-.892 J-10.73 E.03061
G1 X120.753 Y118.132 E.12705
G3 X121.688 Y118.097 I.853 J10.078 E.02876
G1 X121.405 Y117.759 F30000
; LINE_WIDTH: 0.351907
G1 F9449
G1 X121.405 Y114.33 E.08633
G1 X121.096 Y114.334 E.00778
G1 X121.096 Y117.763 E.08633
G1 X121.345 Y117.76 E.00627
G1 X119.358 Y120.778 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F9449
G1 X119.294 Y120.854 E.00044
; LINE_WIDTH: 0.111414
G1 X119.226 Y120.944 E.00063
; LINE_WIDTH: 0.147278
G1 X119.153 Y121.041 E.00103
; LINE_WIDTH: 0.18165
G1 X119.056 Y121.183 E.00195
G1 X119.079 Y121.362 F30000
; LINE_WIDTH: 0.119476
G1 F9449
G3 X119.149 Y120.947 I8.319 J1.204 E.00262
G1 X119.078 Y122.734 F30000
; LINE_WIDTH: 0.129192
G1 F9449
G1 X119.096 Y122.839 E.00075
; LINE_WIDTH: 0.161464
G1 X119.115 Y122.943 E.00103
; LINE_WIDTH: 0.148177
G2 X119.179 Y123.055 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111403
G1 X119.237 Y123.141 E.00058
; LINE_WIDTH: 0.097391
G1 X119.297 Y123.22 E.00044
G1 X119.297 Y111.22 F30000
; LINE_WIDTH: 0.0973916
G1 F9449
G1 X119.237 Y111.141 E.00044
; LINE_WIDTH: 0.11141
G1 X119.179 Y111.055 E.00058
; LINE_WIDTH: 0.148185
G3 X119.115 Y110.943 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161462
G1 X119.096 Y110.839 E.00103
; LINE_WIDTH: 0.129191
G1 X119.078 Y110.734 E.00075
G1 X119.079 Y109.362 F30000
; LINE_WIDTH: 0.119479
G1 F9449
G3 X119.149 Y108.947 I8.243 J1.192 E.00262
G1 X119.226 Y108.944 F30000
; LINE_WIDTH: 0.147272
G1 F9449
G1 X119.153 Y109.041 E.00103
; LINE_WIDTH: 0.181645
G1 X119.056 Y109.183 E.00195
G1 X119.226 Y108.944 F30000
; LINE_WIDTH: 0.111408
G1 F9449
G1 X119.294 Y108.854 E.00063
; LINE_WIDTH: 0.0973918
G1 X119.358 Y108.778 E.00044
; WIPE_START
G1 F24000
G1 X119.294 Y108.854 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.006 J1.217 P1  F30000
G1 X123.203 Y108.874 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.126786
G1 F9449
G1 X123.321 Y109.038 E.00138
; LINE_WIDTH: 0.173115
G1 X123.379 Y109.124 E.0011
; LINE_WIDTH: 0.136069
G1 X123.404 Y109.255 E.00101
; LINE_WIDTH: 0.0969206
G1 X123.422 Y109.359 E.00047
G1 X123.256 Y108.403 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9449
G1 X123.256 Y102.327 E.1867
G1 X119.244 Y102.327 E.12327
G1 X119.244 Y108.305 E.1837
G1 X119.371 Y108.287 E.00392
G1 X119.483 Y108.371 E.00433
G1 X119.646 Y108.201 E.00724
G1 X120.044 Y107.92 E.01496
G1 X120.489 Y107.723 E.01496
G1 X120.965 Y107.618 E.01496
G1 X121.452 Y107.61 E.01496
G1 X121.93 Y107.698 E.01496
G1 X122.382 Y107.879 E.01496
G1 X122.796 Y108.154 E.01525
G1 X123.088 Y108.469 E.01321
G1 X123.197 Y108.392 E.00409
G1 X122.879 Y107.751 F30000
G1 F9449
G1 X122.879 Y102.704 E.15509
G1 X119.621 Y102.704 E.10009
G1 X119.621 Y107.755 E.15519
G1 X119.889 Y107.576 E.00988
G1 X120.405 Y107.355 E.01726
G1 X120.955 Y107.241 E.01726
G1 X121.517 Y107.238 E.01726
G1 X122.068 Y107.347 E.01726
G1 X122.587 Y107.563 E.01726
G1 X122.828 Y107.719 E.00884
G1 X122.502 Y107.112 F30000
G1 F9449
G1 X122.502 Y103.081 E.12387
G1 X119.998 Y103.081 E.07692
G1 X119.998 Y107.113 E.12389
G1 X120.321 Y106.988 E.01064
G1 X120.946 Y106.864 E.01956
G1 X121.582 Y106.867 E.01956
G1 X122.206 Y106.996 E.01956
G1 X122.446 Y107.09 E.00792
G1 X122.125 Y106.583 F30000
G1 F9449
G1 X122.125 Y103.458 E.09603
G1 X120.375 Y103.458 E.05375
G1 X120.375 Y106.589 E.09619
G1 X120.936 Y106.487 E.01752
G1 X121.648 Y106.496 E.02186
G1 X122.066 Y106.573 E.01305
G1 X121.748 Y106.096 F30000
G1 F9449
G1 X121.748 Y103.835 E.06946
G1 X120.753 Y103.835 E.03058
G1 X120.753 Y106.132 E.07058
G3 X121.688 Y106.097 I.852 J10.061 E.02876
G1 X121.405 Y105.759 F30000
; LINE_WIDTH: 0.351907
G1 F9449
G1 X121.405 Y104.178 E.0398
G1 X121.096 Y104.178 E.00778
G1 X121.096 Y105.763 E.0399
G1 X121.345 Y105.76 E.00627
G1 X123.421 Y110.731 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119475
G1 F9449
G3 X123.351 Y111.146 I-8.323 J-1.204 E.00262
G1 X123.274 Y111.149 F30000
; LINE_WIDTH: 0.179226
G1 F9449
G1 X123.343 Y111.058 E.00126
; LINE_WIDTH: 0.195633
G1 X123.444 Y110.91 E.00224
G1 X123.274 Y111.149 F30000
; LINE_WIDTH: 0.129164
G1 F9449
G1 X123.142 Y111.315 E.00149
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.274 Y111.149 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/63
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
G3 Z9.2 I-.377 J1.157 P1  F30000
G1 X159.613 Y122.985 Z9.2
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.572 Y123.048 E.00231
G3 X158.044 Y120.399 I-1.322 J-1.002 E.20082
G1 X158.209 Y120.387 E.00509
G3 X159.745 Y122.766 I.041 J1.659 E.10426
G1 X159.644 Y122.933 E.00599
M204 S10000
; WIPE_START
G1 F24000
G1 X159.572 Y123.048 E-.05142
G1 X159.349 Y123.291 E-.12557
G1 X159.08 Y123.484 E-.12563
G1 X158.779 Y123.62 E-.12564
G1 X158.457 Y123.694 E-.12564
G1 X158.126 Y123.702 E-.12563
G1 X157.917 Y123.665 E-.08047
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.21 J.127 P1  F30000
G1 X159.2 Y111.405 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X158.932 Y111.558 E.00949
G3 X158.044 Y108.399 I-.682 J-1.513 E.17541
G1 X158.209 Y108.387 E.00509
G3 X159.249 Y111.37 I.041 J1.659 E.1285
M204 S10000
; WIPE_START
G1 F24000
G1 X158.932 Y111.558 E-.13995
G1 X158.62 Y111.665 E-.12556
G1 X158.291 Y111.706 E-.12563
G1 X157.962 Y111.682 E-.12564
G1 X157.643 Y111.592 E-.12564
G1 X157.368 Y111.451 E-.11758
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.194 J.233 P1  F30000
G1 X161.04 Y130.257 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X163.21 Y130.257 E.06667
G3 X165.855 Y133.938 I.001 J2.79 E.16257
G1 X153.328 Y133.938 E.38492
G2 X155.46 Y130.089 I-13.561 J-10.027 E.13557
G1 X155.46 Y101.821 E.8686
G1 X161.04 Y101.821 E.17146
G1 X161.04 Y130.197 E.8719
M204 S10000
; WIPE_START
G1 F24000
G1 X163.039 Y130.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.213 J-.097 P1  F30000
G1 X160.833 Y102.593 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X160.268 Y102.029 E.02454
G1 X159.735 Y102.029
G1 X160.833 Y103.127 E.04772
G1 X160.833 Y103.66
G1 X159.201 Y102.029 E.07089
G1 X158.668 Y102.029
G1 X160.833 Y104.193 E.09406
G1 X160.833 Y104.726
G1 X158.135 Y102.029 E.11724
G1 X157.602 Y102.029
G1 X160.833 Y105.26 E.14041
G1 X160.833 Y105.793
G1 X157.068 Y102.029 E.16358
G1 X156.535 Y102.029
G1 X160.833 Y106.326 E.18676
G1 X160.833 Y106.859
G1 X156.002 Y102.029 E.20993
G1 X155.667 Y102.228
G1 X160.833 Y107.393 E.22445
G1 X160.833 Y107.926
G1 X155.667 Y102.761 E.22445
G1 X155.667 Y103.294
G1 X160.833 Y108.459 E.22445
G1 X160.833 Y108.993
G1 X155.667 Y103.827 E.22445
G1 X155.667 Y104.361
G1 X160.833 Y109.526 E.22445
G1 X159.838 Y109.065
G1 X160.833 Y110.059 E.04321
G1 X160.833 Y110.592
G1 X160.103 Y109.862 E.03173
G1 X160.081 Y110.374
G1 X160.833 Y111.126 E.03266
G1 X160.833 Y111.659
G1 X159.96 Y110.786 E.03793
G1 X159.768 Y111.128
G1 X160.833 Y112.192 E.04625
G1 X160.833 Y112.725
G1 X159.519 Y111.412 E.05707
G1 X159.216 Y111.642
G1 X160.833 Y113.259 E.07025
G1 X160.833 Y113.792
G1 X158.854 Y111.814 E.08596
G1 X158.41 Y111.903
G1 X160.833 Y114.325 E.10528
G1 X160.833 Y114.859
G1 X157.836 Y111.862 E.13023
M204 S10000
; WIPE_START
G1 F24000
G1 X159.25 Y113.276 E-.76
; WIPE_END
M73 P96 R0
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J.002 P1  F30000
G1 X159.257 Y108.483 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X155.667 Y104.894 E.15598
G1 X155.667 Y105.427
G1 X158.431 Y108.19 E.12007
G1 X157.921 Y108.214
G1 X155.667 Y105.96 E.09795
G1 X155.667 Y106.494
G1 X157.513 Y108.339 E.0802
G1 X157.172 Y108.532
G1 X155.667 Y107.027 E.06538
G1 X155.667 Y107.56
G1 X156.888 Y108.781 E.05304
G1 X156.659 Y109.085
G1 X155.667 Y108.093 E.04308
G1 X155.667 Y108.627
G1 X156.489 Y109.448 E.0357
G1 X156.394 Y109.886
G1 X155.667 Y109.16 E.03156
G1 X155.667 Y109.693
G1 X156.437 Y110.463 E.03346
G1 X155.667 Y110.227
G1 X160.833 Y115.392 E.22445
G1 X160.833 Y115.925
G1 X155.667 Y110.76 E.22445
G1 X155.667 Y111.293
G1 X160.833 Y116.458 E.22445
G1 X160.833 Y116.992
G1 X155.667 Y111.826 E.22445
G1 X155.667 Y112.36
G1 X160.833 Y117.525 E.22445
G1 X160.833 Y118.058
G1 X155.667 Y112.893 E.22445
G1 X155.667 Y113.426
G1 X160.833 Y118.591 E.22445
G1 X160.833 Y119.125
G1 X155.667 Y113.959 E.22445
G1 X155.667 Y114.493
G1 X160.833 Y119.658 E.22445
G1 X160.833 Y120.191
G1 X155.667 Y115.026 E.22445
G1 X155.667 Y115.559
G1 X160.833 Y120.724 E.22445
G1 X160.833 Y121.258
G1 X155.667 Y116.093 E.22445
G1 X155.667 Y116.626
G1 X160.833 Y121.791 E.22445
G1 X160.044 Y121.535
G1 X160.833 Y122.324 E.03428
G1 X160.833 Y122.858
G1 X160.116 Y122.141 E.03116
G1 X160.031 Y122.589
G1 X160.833 Y123.391 E.03483
G1 X160.833 Y123.924
G1 X159.87 Y122.962 E.04183
G1 X159.648 Y123.273
G1 X160.833 Y124.457 E.05146
G1 X160.833 Y124.991
G1 X159.372 Y123.53 E.06347
G1 X159.039 Y123.73
G1 X160.833 Y125.524 E.07794
G1 X160.833 Y126.057
G1 X158.64 Y123.865 E.09527
G1 X158.151 Y123.909
G1 X160.833 Y126.59 E.11652
G1 X160.833 Y127.124
G1 X157.432 Y123.723 E.14778
M204 S10000
; WIPE_START
G1 F24000
G1 X158.846 Y125.137 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J-.022 P1  F30000
G1 X158.756 Y120.248 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X155.667 Y117.159 E.13422
G1 X155.667 Y117.692
G1 X158.164 Y120.189 E.10848
G1 X157.706 Y120.264
G1 X155.667 Y118.226 E.08856
G1 X155.667 Y118.759
G1 X157.33 Y120.422 E.07226
G1 X157.018 Y120.642
G1 X155.667 Y119.292 E.05868
G1 X155.667 Y119.825
G1 X156.76 Y120.918 E.04749
G1 X156.561 Y121.252
G1 X155.667 Y120.359 E.03881
G1 X155.667 Y120.892
G1 X156.429 Y121.653 E.03309
G1 X156.394 Y122.151
G1 X155.667 Y121.425 E.03155
G1 X155.667 Y121.959
G1 X156.579 Y122.871 E.03963
G1 X155.667 Y122.492
G1 X160.833 Y127.657 E.22445
G1 X160.833 Y128.19
G1 X155.667 Y123.025 E.22445
G1 X155.667 Y123.558
G1 X160.833 Y128.724 E.22445
G1 X160.833 Y129.257
G1 X155.667 Y124.092 E.22445
G1 X155.667 Y124.625
G1 X160.833 Y129.79 E.22445
G1 X160.833 Y130.323
G1 X155.667 Y125.158 E.22445
M204 S10000
; WIPE_START
G1 F24000
G1 X157.082 Y126.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.623 J1.045 P1  F30000
G1 X163.691 Y130.515 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X165.744 Y132.569 E.08925
G1 X165.787 Y133.144
G1 X163.106 Y130.464 E.11647
G1 X162.573 Y130.464
G1 X165.72 Y133.611 E.13677
G1 X165.306 Y133.73
G1 X162.04 Y130.464 E.14193
G1 X161.507 Y130.464
G1 X164.773 Y133.73 E.14193
G1 X164.24 Y133.73
G1 X160.973 Y130.464 E.14193
M204 S10000
; WIPE_START
G1 F24000
G1 X162.388 Y131.878 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.991 J.706 P1  F30000
G1 X163.706 Y133.73 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X155.667 Y125.691 E.34932
G1 X155.667 Y126.225
G1 X163.173 Y133.73 E.32615
G1 X162.64 Y133.73
G1 X155.667 Y126.758 E.30298
G1 X155.667 Y127.291
G1 X162.106 Y133.73 E.2798
G1 X161.573 Y133.73
G1 X155.667 Y127.824 E.25663
G1 X155.667 Y128.358
G1 X161.04 Y133.73 E.23346
G1 X160.507 Y133.73
G1 X155.667 Y128.891 E.21029
G1 X155.667 Y129.424
G1 X159.973 Y133.73 E.18711
G1 X159.44 Y133.73
G1 X155.667 Y129.958 E.16394
G1 X155.561 Y130.384
G1 X158.907 Y133.73 E.14541
G1 X158.374 Y133.73
G1 X155.402 Y130.759 E.12911
G1 X155.236 Y131.126
G1 X157.84 Y133.73 E.11315
G1 X157.307 Y133.73
G1 X155.064 Y131.487 E.09746
G1 X154.884 Y131.84
G1 X156.774 Y133.73 E.08214
G1 X156.24 Y133.73
G1 X154.698 Y132.188 E.06704
G1 X154.504 Y132.527
G1 X155.707 Y133.73 E.05228
G1 X155.174 Y133.73
G1 X154.305 Y132.861 E.03776
G1 X154.099 Y133.188
G1 X154.641 Y133.73 E.02356
M204 S10000
G1 X154.156 Y133.512 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.171884
G1 F15000
G1 X153.702 Y133.749 E.00538
; WIPE_START
G1 F24000
G1 X154.156 Y133.512 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.156 J.382 P1  F30000
G1 X157.369 Y123.786 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.221946
G1 F15000
G1 X157.217 Y123.664 E.00284
; LINE_WIDTH: 0.168163
G3 X156.787 Y123.267 I3.558 J-4.282 E.00597
; LINE_WIDTH: 0.153612
G1 X156.663 Y123.117 E.00175
; LINE_WIDTH: 0.181167
G1 X156.539 Y122.967 E.00219
; WIPE_START
G1 F24000
G1 X156.663 Y123.117 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.56 J1.081 P1  F30000
G1 X158.165 Y123.895 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0898935
G1 F15000
G1 X157.95 Y123.975 E.00088
; WIPE_START
G1 F24000
G1 X158.165 Y123.895 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.118 J.48 P1  F30000
G1 X160.98 Y130.457 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.165649
G1 F15000
G1 X160.84 Y130.508 E.00149
G1 X160.789 Y130.457 E.00072
G1 X160.84 Y130.316 E.00149
; WIPE_START
G1 F24000
G1 X160.789 Y130.457 E-.3062
G1 X160.84 Y130.508 E-.14764
G1 X160.98 Y130.457 E-.30617
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.419 J1.142 P1  F30000
G1 X165.646 Y132.17 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.133951
G1 F15000
G1 X165.537 Y132.016 E.0014
; LINE_WIDTH: 0.176304
G1 X165.429 Y131.862 E.00205
; LINE_WIDTH: 0.218656
G1 X165.312 Y131.717 E.00266
; LINE_WIDTH: 0.259415
G1 X165.196 Y131.572 E.00328
; LINE_WIDTH: 0.313395
G2 X164.681 Y131.057 I-3.751 J3.241 E.01607
; LINE_WIDTH: 0.299178
G1 X164.494 Y130.904 E.00505
; LINE_WIDTH: 0.251354
G1 X164.359 Y130.807 E.00282
; LINE_WIDTH: 0.211175
G1 X164.224 Y130.71 E.00228
; LINE_WIDTH: 0.170997
G1 X164.09 Y130.612 E.00173
; WIPE_START
G1 F24000
G1 X164.224 Y130.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.132 J-.446 P1  F30000
G1 X160.805 Y122.03 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.121526
G1 F15000
G1 X160.832 Y121.854 E.00114
G1 X160.079 Y121.426 F30000
; LINE_WIDTH: 0.181261
G1 F15000
G1 X159.981 Y121.279 E.00199
; LINE_WIDTH: 0.134715
G1 X159.882 Y121.133 E.00132
G1 X159.176 Y120.429 F30000
; LINE_WIDTH: 0.0986953
G1 F15000
G2 X158.831 Y120.173 I-2.722 J3.303 E.00195
; WIPE_START
G1 F24000
G1 X159.176 Y120.429 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P97 R0
G3 Z9.4 I1.154 J-.385 P1  F30000
G1 X155.694 Y109.986 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.11938
G1 F15000
G1 X155.668 Y110.16 E.00109
; WIPE_START
G1 F24000
G1 X155.694 Y109.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.847 J.874 P1  F30000
G1 X156.557 Y110.823 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881697
G1 F15000
G1 X156.468 Y110.694 E.00058
; LINE_WIDTH: 0.140424
G1 X156.402 Y110.579 E.00105
G1 X156.394 Y109.908 F30000
; LINE_WIDTH: 0.0993485
G1 F15000
G2 X156.317 Y110.076 I1.607 J.837 E.00085
; WIPE_START
G1 F24000
G1 X156.394 Y109.908 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.313 J1.176 P1  F30000
G1 X159.878 Y108.98 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.213646
G1 F15000
G2 X159.318 Y108.423 I-3.162 J2.62 E.011
; WIPE_START
G1 F24000
G1 X159.722 Y108.798 E-.53006
G1 X159.878 Y108.98 E-.22994
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.377 J-1.157 P1  F30000
G1 X157.716 Y108.275 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.114354
G1 F15000
G1 X157.646 Y108.259 E.00042
G1 X157.56 Y108.318 E.00061
; WIPE_START
G1 F24000
G1 X157.646 Y108.259 E-.45162
G1 X157.716 Y108.275 E-.30838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.47 J-1.122 P1  F30000
G1 X122.613 Y122.985 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X122.572 Y123.048 E.00232
G3 X121.044 Y120.399 I-1.322 J-1.002 E.20082
G1 X121.209 Y120.387 E.00509
G3 X122.745 Y122.766 I.041 J1.659 E.10426
G1 X122.644 Y122.933 E.00599
M204 S10000
; WIPE_START
G1 F24000
G1 X122.572 Y123.048 E-.05142
G1 X122.349 Y123.291 E-.12557
G1 X122.08 Y123.484 E-.12563
G1 X121.779 Y123.62 E-.12564
G1 X121.457 Y123.694 E-.12564
G1 X121.126 Y123.702 E-.12563
G1 X120.917 Y123.665 E-.08046
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.213 J.1 P1  F30000
G1 X122.151 Y108.652 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G3 X121.044 Y108.399 I-.901 J1.393 E.28473
G1 X121.209 Y108.387 E.00509
G3 X122.1 Y108.621 I.041 J1.659 E.02869
M204 S10000
; WIPE_START
G1 F24000
G1 X122.409 Y108.858 E-.14825
G1 X122.619 Y109.107 E-.12368
G1 X122.746 Y109.326 E-.09625
G1 X122.859 Y109.637 E-.12564
G1 X122.908 Y109.964 E-.12563
G1 X122.892 Y110.294 E-.12565
G1 X122.882 Y110.332 E-.01491
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.188 J-.264 P1  F30000
G1 X118.46 Y130.257 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X118.46 Y101.821 E.87374
G1 X124.04 Y101.821 E.17146
G1 X124.04 Y130.089 E.8686
G2 X126.172 Y133.938 I15.693 J-6.178 E.13557
G1 X113.646 Y133.938 E.38487
G3 X116.29 Y130.257 I2.642 J-.893 E.16257
G1 X118.4 Y130.257 E.06482
M204 S10000
; WIPE_START
G1 F24000
G1 X118.404 Y128.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.191 J.25 P1  F30000
G1 X123.833 Y102.389 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X123.472 Y102.029 E.01566
G1 X122.939 Y102.029
G1 X123.833 Y102.922 E.03884
G1 X123.833 Y103.455
G1 X122.406 Y102.029 E.06201
G1 X121.872 Y102.029
G1 X123.833 Y103.989 E.08518
G1 X123.833 Y104.522
G1 X121.339 Y102.029 E.10836
G1 X120.806 Y102.029
G1 X123.833 Y105.055 E.13153
G1 X123.833 Y105.589
G1 X120.273 Y102.029 E.1547
G1 X119.739 Y102.029
G1 X123.833 Y106.122 E.17788
G1 X123.833 Y106.655
G1 X119.206 Y102.029 E.20105
G1 X118.673 Y102.029
G1 X123.833 Y107.188 E.22422
G1 X123.833 Y107.722
G1 X118.667 Y102.556 E.22445
G1 X118.667 Y103.09
G1 X123.833 Y108.255 E.22445
G1 X123.833 Y108.788
G1 X118.667 Y103.623 E.22445
G1 X118.667 Y104.156
G1 X123.833 Y109.321 E.22445
G1 X123.833 Y109.855
G1 X118.667 Y104.69 E.22445
G1 X118.667 Y105.223
G1 X121.679 Y108.234 E.13086
G1 X121.102 Y108.19
G1 X118.667 Y105.756 E.10578
G1 X118.667 Y106.289
G1 X120.654 Y108.276 E.08632
G1 X120.291 Y108.446
G1 X118.667 Y106.823 E.07055
G1 X118.667 Y107.356
G1 X119.986 Y108.675 E.05731
G1 X119.736 Y108.958
G1 X118.667 Y107.889 E.04644
G1 X118.667 Y108.422
G1 X119.544 Y109.299 E.03807
G1 X119.421 Y109.709
G1 X118.667 Y108.956 E.03273
G1 X118.667 Y109.489
G1 X119.397 Y110.218 E.0317
G1 X119.659 Y111.014
G1 X118.667 Y110.022 E.04309
M204 S10000
; WIPE_START
G1 F24000
G1 X119.659 Y111.014 E-.5329
G1 X119.472 Y110.446 E-.2271
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.016 J1.217 P1  F30000
G1 X123.833 Y110.388 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X123.059 Y109.614 E.03364
G1 X123.108 Y110.196
G1 X123.833 Y110.921 E.0315
G1 X123.833 Y111.455
G1 X123.014 Y110.636 E.03557
G1 X122.846 Y111.001
G1 X123.833 Y111.988 E.04288
G1 X123.833 Y112.521
G1 X122.618 Y111.306 E.05279
G1 X122.335 Y111.557
G1 X123.833 Y113.054 E.06508
G1 X123.833 Y113.588
G1 X121.995 Y111.75 E.07984
G1 X121.588 Y111.877
G1 X123.833 Y114.121 E.09753
G1 X123.833 Y114.654
G1 X121.084 Y111.905 E.11945
G1 X120.277 Y111.631
G1 X123.833 Y115.187 E.15453
G1 X123.833 Y115.721
G1 X118.667 Y110.555 E.22445
G1 X118.667 Y111.089
G1 X123.833 Y116.254 E.22445
G1 X123.833 Y116.787
G1 X118.667 Y111.622 E.22445
G1 X118.667 Y112.155
G1 X123.833 Y117.321 E.22445
G1 X123.833 Y117.854
G1 X118.667 Y112.689 E.22445
G1 X118.667 Y113.222
G1 X123.833 Y118.387 E.22445
G1 X123.833 Y118.92
G1 X118.667 Y113.755 E.22445
G1 X118.667 Y114.288
G1 X123.833 Y119.454 E.22445
G1 X123.833 Y119.987
G1 X118.667 Y114.822 E.22445
G1 X118.667 Y115.355
G1 X123.833 Y120.52 E.22445
G1 X123.833 Y121.053
G1 X118.667 Y115.888 E.22445
G1 X118.667 Y116.421
G1 X123.833 Y121.587 E.22445
G1 X122.91 Y121.197
G1 X123.833 Y122.12 E.0401
G1 X123.833 Y122.653
G1 X123.111 Y121.931 E.03137
G1 X123.073 Y122.427
G1 X123.833 Y123.186 E.033
G1 X123.833 Y123.72
G1 X122.943 Y122.831 E.03864
G1 X122.745 Y123.166
G1 X123.833 Y124.253 E.04725
G1 X123.833 Y124.786
G1 X122.49 Y123.444 E.05834
G1 X122.18 Y123.667
G1 X123.833 Y125.32 E.07182
G1 X123.833 Y125.853
G1 X121.807 Y123.827 E.08804
G1 X121.351 Y123.904
G1 X123.833 Y126.386 E.10786
G1 X123.833 Y126.919
G1 X120.762 Y123.849 E.13344
M204 S10000
; WIPE_START
G1 F24000
G1 X122.176 Y125.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J-.021 P1  F30000
G1 X122.092 Y120.38 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X118.667 Y116.955 E.14883
G1 X118.667 Y117.488
G1 X121.363 Y120.184 E.11714
G1 X120.872 Y120.226
G1 X118.667 Y118.021 E.09579
G1 X118.667 Y118.555
G1 X120.471 Y120.358 E.07838
G1 X120.137 Y120.557
G1 X118.667 Y119.088 E.06384
G1 X118.667 Y119.621
G1 X119.859 Y120.812 E.05177
G1 X119.636 Y121.123
G1 X118.667 Y120.154 E.04207
G1 X118.667 Y120.688
G1 X119.473 Y121.493 E.035
G1 X119.386 Y121.939
G1 X118.667 Y121.221 E.03122
G1 X118.667 Y121.754
G1 X119.452 Y122.539 E.03409
G1 X118.667 Y122.287
G1 X123.833 Y127.453 E.22445
G1 X123.833 Y127.986
G1 X118.667 Y122.821 E.22445
G1 X118.667 Y123.354
G1 X123.833 Y128.519 E.22445
G1 X123.833 Y129.052
G1 X118.667 Y123.887 E.22445
G1 X118.667 Y124.421
G1 X123.833 Y129.586 E.22445
G1 X123.833 Y130.119
G1 X118.667 Y124.954 E.22445
G1 X118.667 Y125.487
G1 X124.224 Y131.044 E.24148
G1 X124.765 Y132.118
G1 X118.667 Y126.02 E.26498
G1 X118.667 Y126.554
G1 X125.595 Y133.481 E.30104
G1 X125.311 Y133.73
G1 X118.667 Y127.087 E.28869
G1 X118.667 Y127.62
G1 X124.778 Y133.73 E.26551
G1 X124.244 Y133.73
G1 X118.667 Y128.153 E.24234
G1 X118.667 Y128.687
G1 X123.711 Y133.73 E.21917
G1 X123.178 Y133.73
G1 X118.667 Y129.22 E.19599
G1 X118.667 Y129.753
G1 X122.644 Y133.73 E.17282
G1 X122.111 Y133.73
G1 X118.667 Y130.286 E.14965
G1 X118.312 Y130.464
G1 X121.578 Y133.73 E.14193
G1 X121.045 Y133.73
G1 X117.778 Y130.464 E.14193
G1 X117.245 Y130.464
G1 X120.511 Y133.73 E.14193
G1 X119.978 Y133.73
G1 X116.712 Y130.464 E.14193
G1 X116.187 Y130.472
G1 X119.445 Y133.73 E.14158
G1 X118.912 Y133.73
G1 X115.713 Y130.531 E.13901
G1 X115.307 Y130.659
G1 X118.378 Y133.73 E.13347
G1 X117.845 Y133.73
G1 X114.957 Y130.842 E.12552
G1 X114.642 Y131.061
G1 X117.312 Y133.73 E.11601
G1 X116.778 Y133.73
G1 X114.369 Y131.321 E.10471
G1 X114.136 Y131.621
G1 X116.245 Y133.73 E.09165
G1 X115.712 Y133.73
G1 X113.946 Y131.964 E.07675
G1 X113.804 Y132.356
G1 X115.179 Y133.73 E.05973
G1 X114.645 Y133.73
G1 X113.724 Y132.808 E.04006
G1 X113.728 Y133.346
G1 X114.112 Y133.73 E.01671
M204 S10000
; WIPE_START
G1 F24000
G1 X113.728 Y133.346 E-.20666
M73 P98 R0
G1 X113.724 Y132.808 E-.20419
G1 X114.373 Y133.458 E-.34916
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.089 J1.214 P1  F30000
G1 X125.082 Y132.674 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X124.96 Y132.516 E.00074
; LINE_WIDTH: 0.135401
G1 X124.835 Y132.356 E.00153
; LINE_WIDTH: 0.182018
G1 X124.704 Y132.179 E.0025
; WIPE_START
G1 F24000
G1 X124.835 Y132.356 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.062 J-1.215 P1  F30000
G1 X114.053 Y131.805 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.108287
G1 F15000
G1 X113.974 Y131.909 E.0007
; WIPE_START
G1 F24000
G1 X114.053 Y131.805 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.931 J.784 P1  F30000
G1 X120.685 Y123.925 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0921508
G1 F15000
G3 X120.366 Y123.691 I2.177 J-3.297 E.00159
; WIPE_START
G1 F24000
G1 X120.685 Y123.925 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.088 J.546 P1  F30000
G1 X124.001 Y130.528 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.088171
G1 F15000
G1 X123.923 Y130.413 E.00051
; LINE_WIDTH: 0.127747
G1 X123.846 Y130.298 E.00096
; LINE_WIDTH: 0.167323
G1 X123.769 Y130.183 E.0014
; WIPE_START
G1 F24000
G1 X123.846 Y130.298 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.055 J-.607 P1  F30000
G1 X119.607 Y122.935 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X119.512 Y122.793 E.00063
; LINE_WIDTH: 0.132946
G1 X119.416 Y122.651 E.00126
G1 X118.695 Y122.048 F30000
; LINE_WIDTH: 0.121038
G1 F15000
G1 X118.668 Y122.224 E.00113
; WIPE_START
G1 F24000
G1 X118.695 Y122.048 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.264 J1.188 P1  F30000
G1 X122.949 Y121.104 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.214051
G1 F15000
G1 X122.717 Y120.823 E.00507
; LINE_WIDTH: 0.163238
G2 X122.438 Y120.547 I-22.241 J22.243 E.00385
; LINE_WIDTH: 0.169058
G1 X122.296 Y120.433 E.00187
; LINE_WIDTH: 0.197856
G1 X122.154 Y120.318 E.0023
; WIPE_START
G1 F24000
G1 X122.296 Y120.433 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.007 J.683 P1  F30000
G1 X123.174 Y121.728 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.126363
G1 F15000
G1 X123.099 Y121.943 E.00154
; WIPE_START
G1 F24000
G1 X123.174 Y121.728 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J-.004 P1  F30000
G1 X123.129 Y109.543 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.147096
G1 F15000
G1 X123.033 Y109.392 E.00152
; LINE_WIDTH: 0.142593
G1 X122.98 Y109.317 E.00075
; LINE_WIDTH: 0.115381
G1 X122.926 Y109.242 E.00055
; WIPE_START
G1 F24000
G1 X122.98 Y109.317 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.793 J-.923 P1  F30000
G1 X120.216 Y111.692 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.210898
G1 F15000
G3 X119.599 Y111.074 I2.491 J-3.107 E.01198
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X119.779 Y111.291 E-.24469
G1 X120.041 Y111.55 E-.31972
G1 X120.216 Y111.692 E-.19559
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
G1 Z9.5 F900 ; lower z a little
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

    G1 Z109 F600
    G1 Z107

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

