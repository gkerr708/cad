; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 12m 12s; total estimated time: 18m 1s
; total layer number: 64
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
M73 P24 R13
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
M73 P26 R13
G1 X76 F15000
M73 P27 R13
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
M73 P27 R12
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
M73 P28 R12
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
    G29 A X99.0621 Y101.939 I61.8758 J53.5821
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
M73 P29 R12
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
; layer num/total_layer_count: 1/64
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
G1 X111.799 Y135.693 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
G1 X110.58 Y135.693 E.0454
G3 X108.85 Y131.425 I20.009 J-10.596 E.1718
G1 X108.85 Y102.334 E1.08355
G1 X108.645 Y102.129 E.0108
G1 X102.355 Y102.129 E.23428
G1 X102.15 Y102.334 E.0108
G1 X102.15 Y131.5 E1.08633
G2 X103.418 Y135.693 I29.737 J-6.708 E.16328
M73 P30 R12
G1 X99.291 Y135.693 E.15373
G1 X99.291 Y100.168 E1.32316
G1 X111.799 Y100.168 E.46588
G1 X111.799 Y135.624 E1.32061
G1 X111.388 Y135.281 F30000
G1 F3000
G1 X110.824 Y135.281 E.021
G3 X109.261 Y131.363 I20.361 J-10.388 E.15734
G1 X109.261 Y102.163 E1.08757
G1 X108.815 Y101.717 E.02349
G1 X102.185 Y101.717 E.24697
G1 X101.739 Y102.163 E.02349
M73 P31 R12
G1 X101.739 Y131.525 E1.09362
G2 X102.829 Y135.281 I28.733 J-6.303 E.14578
G1 X99.702 Y135.281 E.11645
G1 X99.702 Y100.579 E1.29252
G1 X111.388 Y100.579 E.43524
G1 X111.388 Y135.281 E1.29252
G1 X110.88 Y133.322 F30000
G1 F3000
G1 X110.514 Y133.396 E.01391
G3 X109.769 Y131.285 I21.183 J-8.658 E.08341
G1 X109.769 Y101.953 E1.09252
G1 X108.903 Y101.087 E.04561
G1 X110.88 Y101.087 E.07361
G1 X110.88 Y133.322 E1.20063
; WIPE_START
G1 F24000
G1 X110.88 Y131.322 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.445 J-1.133 P1  F30000
G1 X102.096 Y134.773 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X100.21 Y134.773 E.07026
G1 X100.21 Y101.087 E1.25469
G1 X102.097 Y101.087 E.07027
G1 X101.231 Y101.953 E.04561
M73 P32 R12
G1 X101.231 Y131.556 E1.1026
G2 X102.096 Y134.773 I30.019 J-6.352 E.12415
G1 X101.413 Y134.266 F30000
G1 F3000
G1 X100.718 Y134.266 E.02589
G1 X100.718 Y133.312 E.0355
G1 X101.108 Y133.255 E.0147
G1 X101.413 Y134.266 E.03931
; WIPE_START
G1 F24000
G1 X101.108 Y133.255 E-.4011
G1 X100.718 Y133.312 E-.14996
G1 X100.718 Y133.862 E-.20895
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.037 J1.216 P1  F30000
G1 X160.709 Y135.693 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X156.582 Y135.693 E.15373
G1 X156.627 Y135.582 E.00445
G2 X157.85 Y131.5 I-29.141 J-10.953 E.15884
G1 X157.85 Y102.334 E1.08633
G1 X157.645 Y102.129 E.0108
G1 X151.355 Y102.129 E.23428
G1 X151.15 Y102.334 E.0108
G1 X151.15 Y131.425 E1.08355
G3 X149.42 Y135.693 I-21.74 J-6.329 E.1718
G1 X148.201 Y135.693 E.0454
G1 X148.201 Y100.168 E1.32316
G1 X160.709 Y100.168 E.46588
G1 X160.709 Y135.624 E1.32061
; WIPE_START
G1 F24000
G1 X160.709 Y133.624 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.165 J-1.206 P1  F30000
G1 X148.612 Y135.281 Z.6
G1 Z.2
M73 P33 R12
G1 E.8 F1800
G1 F3000
G1 X148.612 Y100.579 E1.29252
G1 X160.298 Y100.579 E.43524
G1 X160.298 Y135.281 E1.29252
G1 X157.171 Y135.281 E.11645
G2 X158.261 Y131.525 I-27.642 J-10.059 E.14578
G1 X158.261 Y102.163 E1.09362
G1 X157.815 Y101.717 E.02349
G1 X151.185 Y101.717 E.24697
G1 X150.739 Y102.163 E.02349
G1 X150.739 Y131.363 E1.08757
G3 X149.176 Y135.281 I-21.922 J-6.469 E.15734
G1 X148.612 Y135.281 E.021
; WIPE_START
G1 F24000
G1 X149.176 Y135.281 E-.21428
G1 X149.772 Y133.974 E-.54572
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.119 J1.211 P1  F30000
G1 X157.904 Y134.773 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G2 X158.769 Y131.556 I-29.16 J-9.571 E.12415
G1 X158.769 Y101.953 E1.10261
G1 X157.903 Y101.087 E.04561
G1 X159.79 Y101.087 E.07027
G1 X159.79 Y134.773 E1.25469
G1 X157.904 Y134.773 E.07026
G1 X158.587 Y134.266 F30000
G1 F3000
G1 X158.892 Y133.255 E.03932
G1 X159.282 Y133.312 E.0147
G1 X159.282 Y134.266 E.0355
G1 X158.587 Y134.266 E.02589
; WIPE_START
G1 F24000
M73 P33 R11
G1 X159.282 Y134.266 E-.26412
G1 X159.282 Y133.312 E-.36217
G1 X158.934 Y133.261 E-.13371
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.269 J-1.187 P1  F30000
G1 X150.231 Y131.285 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G3 X149.486 Y133.396 I-21.67 J-6.456 E.08341
G1 X149.12 Y133.322 E.01391
G1 X149.12 Y101.087 E1.20062
G1 X151.097 Y101.087 E.07361
G1 X150.231 Y101.953 E.04561
G1 X150.231 Y131.285 E1.09252
; WIPE_START
G1 F24000
G1 X150.231 Y129.285 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.909 J.809 P1  F30000
G1 X152.342 Y131.656 Z.6
G1 Z.2
M73 P34 R11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X152.357 Y131.609 E.00183
G1 X152.357 Y103.336 E1.05308
G1 X156.643 Y103.336 E.15963
G1 X156.643 Y131.374 E1.04431
G3 X103.357 Y131.374 I-26.643 J-6.025 E2.74371
G1 X103.357 Y103.336 E1.04431
G1 X107.643 Y103.336 E.15963
G1 X107.643 Y131.609 E1.05308
G2 X151.983 Y132.817 I22.357 J-6.264 E2.19726
G1 X152.325 Y131.714 E.043
G1 X151.866 Y131.65 F30000
; FEATURE: Outer wall
G1 F3000
G1 X151.9 Y131.54 E.00429
G1 X151.9 Y102.879 E1.06751
G1 X157.1 Y102.879 E.19368
G1 X157.1 Y131.43 E1.06342
G3 X102.9 Y131.43 I-27.1 J-6.083 E2.79311
G1 X102.9 Y102.879 E1.06342
G1 X108.1 Y102.879 E.19368
G1 X108.1 Y131.54 E1.06751
G2 X151.549 Y132.669 I21.9 J-6.192 E2.1518
G1 X151.848 Y131.707 E.03753
; WIPE_START
G1 F24000
G1 X151.9 Y131.54 E-.06657
G1 X151.9 Y129.715 E-.69343
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.205 J.167 P1  F30000
G1 X155.535 Y103.519 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500625
G1 F6300
G1 X156.254 Y104.238 E.03796
G1 X156.254 Y104.886 E.02414
G1 X155.093 Y103.724 E.06125
G1 X154.446 Y103.724 E.02414
G1 X156.254 Y105.533 E.09539
G1 X156.254 Y106.18 E.02414
G1 X153.799 Y103.724 E.12953
G1 X153.151 Y103.724 E.02414
G1 X156.254 Y106.827 E.16368
G1 X156.254 Y107.475 E.02414
G1 X152.746 Y103.966 E.18508
G1 X152.746 Y104.613 E.02414
G1 X156.254 Y108.122 E.18508
G1 X156.254 Y108.769 E.02414
G1 X152.746 Y105.26 E.18508
G1 X152.746 Y105.908 E.02414
G1 X156.254 Y109.417 E.18508
G1 X156.254 Y110.064 E.02414
G1 X152.746 Y106.555 E.18508
G1 X152.746 Y107.202 E.02414
G1 X156.254 Y110.711 E.18508
G1 X156.254 Y111.358 E.02414
G1 X152.746 Y107.85 E.18508
G1 X152.746 Y108.497 E.02414
G1 X156.254 Y112.006 E.18508
G1 X156.254 Y112.653 E.02414
G1 X152.746 Y109.144 E.18508
M73 P35 R11
G1 X152.746 Y109.792 E.02414
G1 X156.254 Y113.3 E.18508
G1 X156.254 Y113.948 E.02414
G1 X152.746 Y110.439 E.18508
G1 X152.746 Y111.086 E.02414
G1 X156.254 Y114.595 E.18508
G1 X156.254 Y115.242 E.02414
G1 X152.746 Y111.733 E.18508
G1 X152.746 Y112.381 E.02414
G1 X156.254 Y115.89 E.18508
G1 X156.254 Y116.537 E.02414
G1 X152.746 Y113.028 E.18508
G1 X152.746 Y113.675 E.02414
G1 X156.254 Y117.184 E.18508
G1 X156.254 Y117.831 E.02414
G1 X152.746 Y114.323 E.18508
G1 X152.746 Y114.97 E.02414
G1 X156.254 Y118.479 E.18508
G1 X156.254 Y119.126 E.02414
G1 X152.746 Y115.617 E.18508
G1 X152.746 Y116.264 E.02414
G1 X156.254 Y119.773 E.18508
G1 X156.254 Y120.421 E.02414
G1 X152.746 Y116.912 E.18508
G1 X152.746 Y117.559 E.02414
G1 X156.254 Y121.068 E.18508
G1 X156.254 Y121.715 E.02414
G1 X152.746 Y118.206 E.18508
G1 X152.746 Y118.854 E.02414
G1 X156.254 Y122.362 E.18508
G1 X156.254 Y123.01 E.02414
G1 X152.746 Y119.501 E.18508
G1 X152.746 Y120.148 E.02414
G1 X156.254 Y123.657 E.18508
G1 X156.254 Y124.304 E.02414
G1 X152.746 Y120.796 E.18508
G1 X152.746 Y121.443 E.02414
G1 X156.254 Y124.952 E.18508
G1 X156.254 Y125.599 E.02414
G1 X152.746 Y122.09 E.18508
G1 X152.746 Y122.737 E.02414
G1 X156.254 Y126.246 E.18508
G1 X156.254 Y126.893 E.02414
G1 X152.746 Y123.385 E.18508
G1 X152.746 Y124.032 E.02414
G1 X156.254 Y127.541 E.18508
M73 P36 R11
G1 X156.254 Y128.188 E.02414
G1 X152.746 Y124.679 E.18508
G1 X152.746 Y125.327 E.02414
G1 X156.254 Y128.835 E.18508
G1 X156.254 Y129.483 E.02414
G1 X152.746 Y125.974 E.18508
G1 X152.746 Y126.621 E.02414
G1 X156.254 Y130.13 E.18508
G1 X156.254 Y130.777 E.02414
G1 X152.746 Y127.268 E.18508
G1 X152.746 Y127.916 E.02414
G1 X156.235 Y131.405 E.18404
G1 X156.106 Y131.923 E.01992
G1 X152.746 Y128.563 E.17725
G1 X152.746 Y129.21 E.02414
G1 X155.977 Y132.442 E.17045
G3 X155.829 Y132.941 I-5.149 J-1.253 E.01943
G1 X152.746 Y129.858 E.16265
G1 X152.746 Y130.505 E.02414
G1 X155.679 Y133.439 E.15474
G3 X155.522 Y133.929 I-5.062 J-1.351 E.01921
G1 X152.746 Y131.152 E.14646
G1 X152.746 Y131.668 E.01926
G1 X152.714 Y131.768 E.0039
G1 X155.352 Y134.406 E.13914
G1 X155.182 Y134.884 E.0189
G1 X152.561 Y132.262 E.1383
G1 X152.407 Y132.755 E.01928
G1 X154.998 Y135.347 E.1367
G1 X154.809 Y135.805 E.01849
G1 X152.24 Y133.236 E.13551
G1 X152.066 Y133.709 E.01881
G1 X154.619 Y136.262 E.13464
G1 X154.412 Y136.702 E.01814
G1 X151.887 Y134.177 E.13318
G1 X151.694 Y134.632 E.01841
G1 X154.205 Y137.142 E.13243
G3 X153.991 Y137.576 I-4.516 J-1.953 E.01804
G1 X151.501 Y135.086 E.13135
G3 X151.291 Y135.523 I-4.496 J-1.888 E.0181
G1 X153.766 Y137.998 E.13055
G1 X153.541 Y138.421 E.01785
G1 X151.08 Y135.959 E.12984
G3 X150.859 Y136.386 I-4.4 J-1.998 E.01793
G1 X153.306 Y138.833 E.12905
G1 X153.064 Y139.238 E.0176
G1 X150.63 Y136.804 E.12837
G3 X150.401 Y137.222 I-4.305 J-2.096 E.01778
G1 X152.822 Y139.643 E.12772
G3 X152.567 Y140.035 I-4.113 J-2.398 E.01746
G1 X150.154 Y137.623 E.12725
G1 X149.908 Y138.024 E.01755
G1 X152.308 Y140.424 E.1266
G1 X152.049 Y140.812 E.01741
G1 X149.652 Y138.416 E.12642
G1 X149.389 Y138.8 E.01737
G1 X151.775 Y141.185 E.12583
G1 X151.5 Y141.557 E.01726
G1 X149.126 Y139.184 E.12521
G1 X148.846 Y139.551 E.01723
G1 X151.223 Y141.928 E.12537
G1 X150.932 Y142.284 E.01716
G1 X148.566 Y139.919 E.12476
G3 X148.279 Y140.279 I-3.757 J-2.707 E.01718
G1 X150.64 Y142.64 E.12455
G3 X150.345 Y142.992 I-3.73 J-2.819 E.01715
G1 X147.983 Y140.63 E.12462
G1 X147.687 Y140.981 E.01713
G1 X150.038 Y143.332 E.12402
G1 X149.731 Y143.672 E.01709
G1 X147.376 Y141.317 E.1242
G1 X147.064 Y141.653 E.01708
G1 X149.418 Y144.007 E.12419
G1 X149.095 Y144.331 E.01707
G1 X146.746 Y141.982 E.1239
G1 X146.417 Y142.301 E.01707
G1 X148.772 Y144.655 E.12417
G3 X148.441 Y144.972 I-3.389 J-3.197 E.01708
G1 X146.089 Y142.62 E.12407
G3 X145.748 Y142.926 I-3.246 J-3.272 E.0171
G1 X148.102 Y145.28 E.12417
G1 X147.763 Y145.588 E.01709
G1 X145.404 Y143.229 E.12444
G3 X145.055 Y143.528 I-3.207 J-3.391 E.01713
G1 X147.415 Y145.888 E.12448
G1 X147.06 Y146.18 E.01715
G1 X144.695 Y143.815 E.12475
G1 X144.334 Y144.101 E.01718
G1 X146.705 Y146.472 E.12503
G3 X146.339 Y146.753 I-3.042 J-3.578 E.01722
G1 X143.962 Y144.377 E.12534
G1 X143.585 Y144.647 E.0173
G1 X145.967 Y147.029 E.12564
G1 X145.596 Y147.305 E.01726
G1 X143.206 Y144.915 E.12608
G1 X142.812 Y145.168 E.01747
G1 X145.211 Y147.568 E.12656
G1 X144.824 Y147.827 E.0174
G1 X142.418 Y145.422 E.12688
G3 X142.013 Y145.664 I-2.637 J-3.943 E.01761
G1 X144.436 Y148.087 E.12778
G3 X144.032 Y148.33 I-2.672 J-3.979 E.0176
G1 X141.602 Y145.901 E.12814
G3 X141.189 Y146.134 I-2.552 J-4.039 E.01773
G1 X143.627 Y148.573 E.12863
G3 X143.22 Y148.813 I-2.644 J-4.02 E.01764
G1 X140.76 Y146.353 E.12975
G1 X140.332 Y146.572 E.01794
G1 X142.799 Y149.039 E.1301
G1 X142.377 Y149.264 E.01784
G1 X139.89 Y146.778 E.13115
G1 X139.444 Y146.979 E.01826
G1 X141.948 Y149.483 E.1321
G1 X141.509 Y149.691 E.01813
G1 X138.991 Y147.173 E.1328
M73 P37 R11
G1 X138.526 Y147.356 E.01863
G1 X141.07 Y149.899 E.13417
G3 X140.618 Y150.095 I-2.216 J-4.491 E.01836
G1 X138.061 Y147.538 E.1349
G3 X137.576 Y147.7 I-1.878 J-4.786 E.01907
G1 X140.161 Y150.285 E.13632
G1 X139.703 Y150.475 E.01847
G1 X137.092 Y147.863 E.13776
G3 X136.592 Y148.011 I-1.752 J-4.997 E.01943
G1 X139.227 Y150.645 E.13896
G1 X138.75 Y150.816 E.01888
G1 X136.087 Y148.153 E.14048
G3 X135.572 Y148.285 I-1.57 J-5.052 E.01984
G1 X138.266 Y150.979 E.14211
G1 X137.77 Y151.13 E.01935
G1 X135.045 Y148.405 E.14373
G3 X134.511 Y148.519 I-1.407 J-5.304 E.02036
G1 X137.273 Y151.281 E.1457
G3 X136.759 Y151.414 I-1.612 J-5.158 E.01981
G1 X133.96 Y148.615 E.14762
G3 X133.406 Y148.708 I-1.205 J-5.526 E.02099
G1 X136.242 Y151.544 E.1496
G3 X135.716 Y151.666 I-1.502 J-5.279 E.02012
G1 X132.83 Y148.78 E.15223
G3 X132.251 Y148.847 I-.97 J-5.787 E.02177
G1 X135.177 Y151.773 E.15433
G1 X134.637 Y151.881 E.02053
G1 X131.648 Y148.892 E.15763
G3 X131.04 Y148.931 I-.694 J-6.091 E.02275
G1 X134.074 Y151.966 E.16006
G1 X133.511 Y152.05 E.02125
G1 X130.408 Y148.947 E.16365
G3 X129.765 Y148.951 I-.365 J-6.457 E.02399
G1 X132.931 Y152.117 E.16699
G1 X132.342 Y152.175 E.02208
G1 X129.101 Y148.935 E.17092
G3 X128.417 Y148.897 I.034 J-6.895 E.02559
G1 X131.742 Y152.223 E.17539
G1 X131.125 Y152.253 E.02304
G1 X127.717 Y148.845 E.17975
G3 X126.981 Y148.756 I.525 J-7.44 E.02767
G1 X130.5 Y152.276 E.18564
G1 X129.853 Y152.276 E.02414
G1 X126.226 Y148.648 E.19134
G1 X125.44 Y148.51 E.02974
G1 X129.199 Y152.269 E.19826
G1 X128.518 Y152.235 E.02542
G1 X124.609 Y148.326 E.20619
G3 X123.74 Y148.105 I1.792 J-8.838 E.03346
G1 X127.828 Y152.192 E.21559
G1 X127.11 Y152.121 E.02691
G1 X122.822 Y147.834 E.22613
G3 X121.84 Y147.499 I2.876 J-10.036 E.03874
G1 X126.373 Y152.032 E.23913
G1 X125.613 Y151.919 E.02867
G1 X120.767 Y147.073 E.25562
G3 X119.567 Y146.521 I4.889 J-12.196 E.04929
G1 X124.819 Y151.772 E.27702
G3 X124.005 Y151.606 I1.287 J-8.357 E.031
G1 X117.566 Y145.167 E.33962
; WIPE_START
G1 F24000
G1 X118.98 Y146.581 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.175 J-.318 P1  F30000
G1 X107.46 Y103.991 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X107.194 Y103.724 E.01406
G1 X106.546 Y103.724 E.02414
G1 X107.254 Y104.432 E.03735
G1 X107.254 Y105.08 E.02414
G1 X105.899 Y103.724 E.0715
G1 X105.252 Y103.724 E.02414
G1 X107.254 Y105.727 E.10564
G1 X107.254 Y106.374 E.02414
G1 X104.604 Y103.724 E.13978
G1 X103.957 Y103.724 E.02414
G1 X107.254 Y107.022 E.17392
G1 X107.254 Y107.669 E.02414
G1 X103.746 Y104.16 E.18508
G1 X103.746 Y104.807 E.02414
G1 X107.254 Y108.316 E.18508
G1 X107.254 Y108.964 E.02414
G1 X103.746 Y105.455 E.18508
G1 X103.746 Y106.102 E.02414
G1 X107.254 Y109.611 E.18508
G1 X107.254 Y110.258 E.02414
G1 X103.746 Y106.749 E.18508
G1 X103.746 Y107.397 E.02414
G1 X107.254 Y110.905 E.18508
G1 X107.254 Y111.553 E.02414
G1 X103.746 Y108.044 E.18508
G1 X103.746 Y108.691 E.02414
G1 X107.254 Y112.2 E.18508
G1 X107.254 Y112.847 E.02414
G1 X103.746 Y109.338 E.18508
G1 X103.746 Y109.986 E.02414
G1 X107.254 Y113.495 E.18508
G1 X107.254 Y114.142 E.02414
G1 X103.746 Y110.633 E.18508
G1 X103.746 Y111.28 E.02414
G1 X107.254 Y114.789 E.18508
G1 X107.254 Y115.436 E.02414
G1 X103.746 Y111.928 E.18508
G1 X103.746 Y112.575 E.02414
G1 X107.254 Y116.084 E.18508
G1 X107.254 Y116.731 E.02414
G1 X103.746 Y113.222 E.18508
G1 X103.746 Y113.87 E.02414
G1 X107.254 Y117.378 E.18508
G1 X107.254 Y118.026 E.02414
G1 X103.746 Y114.517 E.18508
G1 X103.746 Y115.164 E.02414
G1 X107.254 Y118.673 E.18508
G1 X107.254 Y119.32 E.02414
M73 P38 R11
G1 X103.746 Y115.811 E.18508
G1 X103.746 Y116.459 E.02414
G1 X107.254 Y119.968 E.18508
G1 X107.254 Y120.615 E.02414
G1 X103.746 Y117.106 E.18508
G1 X103.746 Y117.753 E.02414
G1 X107.254 Y121.262 E.18508
G1 X107.254 Y121.909 E.02414
G1 X103.746 Y118.401 E.18508
G1 X103.746 Y119.048 E.02414
G1 X107.254 Y122.557 E.18508
G1 X107.254 Y123.204 E.02414
G1 X103.746 Y119.695 E.18508
G1 X103.746 Y120.342 E.02414
G1 X107.254 Y123.851 E.18508
G1 X107.254 Y124.499 E.02414
G1 X103.746 Y120.99 E.18508
G1 X103.746 Y121.637 E.02414
G1 X107.254 Y125.146 E.18508
G1 X107.254 Y125.793 E.02414
G1 X103.746 Y122.284 E.18508
G1 X103.746 Y122.932 E.02414
G1 X107.254 Y126.44 E.18508
G1 X107.254 Y127.088 E.02414
G1 X103.746 Y123.579 E.18508
G1 X103.746 Y124.226 E.02414
G1 X107.254 Y127.735 E.18508
G1 X107.254 Y128.382 E.02414
G1 X103.746 Y124.873 E.18508
G1 X103.746 Y125.521 E.02414
G1 X107.254 Y129.03 E.18508
G1 X107.254 Y129.677 E.02414
G1 X103.746 Y126.168 E.18508
G1 X103.746 Y126.815 E.02414
G1 X107.254 Y130.324 E.18508
G1 X107.254 Y130.971 E.02414
G1 X103.746 Y127.463 E.18508
G1 X103.746 Y128.11 E.02414
G1 X107.254 Y131.619 E.18508
G1 X107.254 Y131.668 E.00185
G1 X107.525 Y132.537 E.03393
G1 X103.746 Y128.757 E.19936
G1 X103.746 Y129.405 E.02414
G1 X107.866 Y133.525 E.21735
G2 X108.292 Y134.598 I11.112 J-3.788 E.04308
G1 X103.746 Y130.052 E.23981
G1 X103.746 Y130.699 E.02414
G1 X108.84 Y135.794 E.26872
G2 X109.571 Y137.172 I14.206 J-6.651 E.05821
G1 X103.752 Y131.353 E.30692
G1 X103.966 Y132.215 E.03311
G1 X110.74 Y138.988 E.35726
G1 X110.869 Y139.177 E.00857
G2 X116.359 Y144.607 I19.307 J-14.029 E.28925
G1 X123.141 Y151.389 E.35773
G3 X122.237 Y151.132 I2.161 J-9.321 E.03508
G1 X104.225 Y133.12 E.95006
G2 X104.528 Y134.071 I9.817 J-2.611 E.03725
G1 X121.287 Y150.829 E.88395
G1 X120.276 Y150.466 E.04005
G1 X104.893 Y135.083 E.81142
G1 X105.347 Y136.184 E.04444
G1 X119.17 Y150.007 E.72912
G1 X117.951 Y149.436 E.05022
G1 X105.918 Y137.403 E.63467
G1 X106.683 Y138.815 E.0599
G1 X116.544 Y148.676 E.52012
G3 X114.788 Y147.567 I10.389 J-18.4 E.07748
G1 X107.787 Y140.566 E.36931
G1 X107.964 Y140.833 E.01197
G2 X111.198 Y144.625 I21.675 J-15.209 E.18616
G1 X113.356 Y146.783 E.11381
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X111.942 Y145.368 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/64
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
G3 Z.6 I.394 J1.151 P1  F30000
G1 X152.088 Y131.616 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X152.102 Y131.57 E.00157
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.223 E1.93436
G1 X152.07 Y131.673 E.03686
G1 X151.682 Y131.599 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y131.511 E.00285
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.161 E1.75966
G1 X151.665 Y131.656 E.03062
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.05799
G1 X151.71 Y129.663 E-.70201
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.038 J-1.216 P1  F30000
M73 P39 R11
G1 X105.654 Y131.111 Z.8
M73 P39 R10
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F15000
G1 X105.654 Y105.324 E.64928
G1 X105.346 Y105.324 E.00778
G1 X105.346 Y131.13 E.64976
G1 X105.399 Y131.248 E.00326
; LINE_WIDTH: 0.399162
G1 X105.453 Y131.366 E.00376
; LINE_WIDTH: 0.446417
G1 X105.506 Y131.484 E.00425
; LINE_WIDTH: 0.493672
G1 F13976.668
G1 X105.56 Y131.601 E.00475
; LINE_WIDTH: 0.540926
G1 F12650.451
G1 X105.581 Y131.494 E.00445
; LINE_WIDTH: 0.493672
G1 F13976.668
G1 X105.602 Y131.386 E.00403
; LINE_WIDTH: 0.446417
G1 F15000
G1 X105.622 Y131.278 E.00361
; LINE_WIDTH: 0.399162
G1 X105.643 Y131.17 E.00319
G1 X105.56 Y131.601 F30000
; LINE_WIDTH: 0.540926
G1 F12650.451
G1 X105.622 Y131.905 E.01255
; LINE_WIDTH: 0.478441
G1 F14465.457
G2 X105.689 Y132.227 I1.742 J-.197 E.0117
G2 X154.311 Y132.227 I24.311 J-6.886 E2.32207
; LINE_WIDTH: 0.472554
G1 F14663.643
G1 X154.369 Y131.943 E.01013
; LINE_WIDTH: 0.50674
G1 F13582.855
G1 X154.428 Y131.66 E.01093
; WIPE_START
G1 F24000
G1 X154.369 Y131.943 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.741 J-.965 P1  F30000
G1 X130.61 Y150.198 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.419999
G1 F15000
G3 X106.074 Y132.107 I-.612 J-24.853 E1.00832
G1 X105.998 Y131.601 E.0157
G1 X105.998 Y104.981 E.81796
G1 X105.002 Y104.981 E.03058
G1 X105.002 Y131.172 E.80478
G2 X154.998 Y131.172 I24.998 J-5.82 E2.11682
G1 X154.998 Y104.981 E.80478
G1 X154.002 Y104.981 E.03058
G1 X154.002 Y131.601 E.81796
G1 X153.926 Y132.107 E.0157
G3 X130.67 Y150.197 I-23.936 J-6.778 E.96889
G1 X130.6 Y149.821 F30000
G1 F15000
G3 X106.434 Y131.994 I-.602 J-24.476 E.99332
G1 X106.375 Y131.601 E.01221
G1 X106.375 Y104.604 E.82955
G1 X104.625 Y104.604 E.05375
G1 X104.625 Y131.219 E.81779
G2 X155.375 Y131.219 I25.375 J-5.867 E2.15043
G1 X155.375 Y104.604 E.81779
G1 X153.625 Y104.604 E.05375
G1 X153.625 Y131.601 E.82955
G1 X153.566 Y131.994 E.01221
G3 X130.66 Y149.82 I-23.579 J-6.67 E.95447
G1 X130.59 Y149.445 F30000
G1 F15000
G3 X106.794 Y131.882 I-.593 J-24.098 E.97833
G1 X106.752 Y131.601 E.00872
G1 X106.752 Y104.227 E.84114
G1 X104.248 Y104.227 E.07692
G1 X104.248 Y131.265 E.83079
G2 X155.752 Y131.265 I25.752 J-5.914 E2.18404
G1 X155.752 Y104.227 E.83079
G1 X153.248 Y104.227 E.07692
G1 X153.248 Y131.601 E.84114
G1 X153.206 Y131.882 E.00872
G3 X130.65 Y149.443 I-23.219 J-6.558 E.94008
G1 X130.58 Y149.068 F30000
G1 F15000
G3 X107.153 Y131.765 I-.583 J-23.722 E.96349
G1 X107.129 Y131.111 E.02009
G1 X107.129 Y103.85 E.83767
G1 X103.871 Y103.85 E.10009
G1 X103.871 Y131.311 E.8438
G2 X156.129 Y131.311 I26.129 J-5.961 E2.21766
G1 X156.129 Y103.85 E.8438
G1 X152.871 Y103.85 E.10009
G1 X152.871 Y131.601 E.85272
G1 X152.846 Y131.77 E.00523
G3 X130.64 Y149.066 I-22.863 J-6.45 E.92567
G1 X130.57 Y148.691 F30000
G1 F15000
G3 X107.514 Y131.656 I-.567 J-23.352 E.94832
G1 X107.506 Y103.473 E.86598
G1 X103.494 Y103.473 E.12327
G1 X103.494 Y131.357 E.8568
G2 X156.506 Y131.357 I26.506 J-6.008 E2.25127
G1 X156.506 Y103.473 E.8568
G1 X152.494 Y103.473 E.12327
G1 X152.486 Y131.658 E.86604
G3 X130.63 Y148.689 I-22.503 J-6.339 E.91127
; WIPE_START
G1 F24000
G1 X131.203 Y148.674 E-.21798
G1 X132.324 Y148.59 E-.427
G1 X132.624 Y148.552 E-.11503
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.762 J.949 P1  F30000
G1 X154.346 Y131.111 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.351907
G1 F15000
G1 X154.369 Y131.234 E.00314
; LINE_WIDTH: 0.399162
G1 X154.393 Y131.356 E.00362
; LINE_WIDTH: 0.446417
G1 X154.416 Y131.479 E.0041
; LINE_WIDTH: 0.493672
G1 F13976.668
G1 X154.44 Y131.601 E.00458
; LINE_WIDTH: 0.540926
G1 F12650.451
G1 X154.494 Y131.484 E.00525
; LINE_WIDTH: 0.493672
G1 F13976.668
G1 X154.547 Y131.366 E.00475
; LINE_WIDTH: 0.446417
G1 F15000
G1 X154.601 Y131.248 E.00425
; LINE_WIDTH: 0.352025
G1 X154.654 Y131.13 E.00326
G1 X154.654 Y105.324 E.65001
G1 X154.346 Y105.324 E.00778
G1 X154.346 Y131.051 E.64802
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 0.457143
; LAYER_HEIGHT: 0.0571429
; WIPE_START
G1 F24000
G1 X154.346 Y129.051 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/64
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
G3 Z.8 I-.526 J-1.098 P1  F30000
G1 X150.14 Y131.066 Z.8
G1 Z.457
M73 P40 R10
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X150.14 Y133.727 E.10173
G2 X150.961 Y131.397 I-21.706 J-8.965 E.0945
G1 X150.961 Y130.877 E.01986
G1 X150.14 Y130.877 E.03141
G1 X150.14 Y128 E.10997
G1 X150.961 Y128 E.03141
G1 X150.961 Y125.123 E.10997
G1 X150.14 Y125.123 E.03141
G1 X150.14 Y122.246 E.10997
G1 X150.961 Y122.246 E.03141
G1 X150.961 Y119.369 E.10997
G1 X150.14 Y119.369 E.03141
G1 X150.14 Y116.492 E.10997
G1 X150.961 Y116.492 E.03141
G1 X150.961 Y113.615 E.10997
G1 X150.14 Y113.615 E.03141
G1 X150.14 Y110.738 E.10997
G1 X150.961 Y110.738 E.03141
G1 X150.961 Y107.86 E.10997
G1 X150.14 Y107.86 E.03141
G1 X150.14 Y104.983 E.10997
G1 X150.961 Y104.983 E.03141
G1 X150.961 Y102.256 E.10426
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.857 I.168 J1.205 P1  F30000
G1 X157.889 Y102.106 Z.857
G1 Z.457
G1 E.8 F1800
G1 F9000
G1 X158.771 Y102.106 E.0337
G1 X158.771 Y104.983 E.10997
G1 X158.039 Y104.983 E.02799
G1 X158.039 Y107.86 E.10997
G1 X158.771 Y107.86 E.02799
G1 X158.771 Y110.738 E.10997
G1 X158.039 Y110.738 E.02799
G1 X158.039 Y113.615 E.10997
G1 X158.771 Y113.615 E.02799
G1 X158.771 Y116.492 E.10997
G1 X158.039 Y116.492 E.02799
G1 X158.039 Y119.369 E.10997
G1 X158.771 Y119.369 E.02799
G1 X158.771 Y122.246 E.10997
G1 X158.039 Y122.246 E.02799
G1 X158.039 Y125.123 E.10997
G1 X158.771 Y125.123 E.02799
G1 X158.771 Y128 E.10997
G1 X158.039 Y128 E.02799
G1 X158.039 Y130.877 E.10997
G1 X158.771 Y130.877 E.02799
G1 X158.771 Y133.754 E.10997
G1 X157.448 Y133.754 E.05057
; WIPE_START
G1 F24000
G1 X158.771 Y133.754 E-.50281
G1 X158.771 Y133.077 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.857 I.049 J-1.216 P1  F30000
G1 X109.039 Y131.066 Z.857
G1 Z.457
G1 E.8 F1800
G1 F9000
G1 X109.039 Y131.397 E.01266
G2 X109.86 Y133.727 I22.527 J-6.634 E.0945
G1 X109.86 Y130.877 E.10894
G1 X109.039 Y130.877 E.03141
G1 X109.039 Y128 E.10997
G1 X109.86 Y128 E.03141
G1 X109.86 Y125.123 E.10997
G1 X109.039 Y125.123 E.03141
G1 X109.039 Y122.246 E.10997
G1 X109.86 Y122.246 E.03141
G1 X109.86 Y119.369 E.10997
G1 X109.039 Y119.369 E.03141
G1 X109.039 Y116.492 E.10997
G1 X109.86 Y116.492 E.03141
G1 X109.86 Y113.615 E.10997
G1 X109.039 Y113.615 E.03141
G1 X109.039 Y110.738 E.10997
G1 X109.86 Y110.738 E.03141
G1 X109.86 Y107.86 E.10997
G1 X109.039 Y107.86 E.03141
G1 X109.039 Y104.983 E.10997
G1 X109.86 Y104.983 E.03141
G1 X109.86 Y102.106 E.10997
G1 X108.889 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.857 I.144 J-1.208 P1  F30000
G1 X101.229 Y102.106 Z.857
G1 Z.457
G1 E.8 F1800
G1 F9000
G1 X102.111 Y102.106 E.0337
G1 X101.961 Y102.256 E.00807
G1 X101.961 Y104.983 E.10426
G1 X101.229 Y104.983 E.02799
G1 X101.229 Y107.86 E.10997
G1 X101.961 Y107.86 E.02799
G1 X101.961 Y110.738 E.10997
G1 X101.229 Y110.738 E.02799
G1 X101.229 Y113.615 E.10997
G1 X101.961 Y113.615 E.02799
G1 X101.961 Y116.492 E.10997
G1 X101.229 Y116.492 E.02799
G1 X101.229 Y119.369 E.10997
G1 X101.961 Y119.369 E.02799
G1 X101.961 Y122.246 E.10997
G1 X101.229 Y122.246 E.02799
G1 X101.229 Y125.123 E.10997
G1 X101.961 Y125.123 E.02799
G1 X101.961 Y128 E.10997
G1 X101.229 Y128 E.02799
G1 X101.229 Y130.877 E.10997
G1 X101.961 Y130.877 E.02799
G2 X101.969 Y131.577 I2.862 J.317 E.02681
G2 X102.552 Y133.754 I22.564 J-4.874 E.08619
G1 X101.229 Y133.754 E.05057
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.142857
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.377 Y133.1 E-.25719
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/64
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
G3 Z.857 I.036 J1.216 P1  F30000
G1 X152.088 Y131.616 Z.857
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y131.57 E.00157
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.229 E1.93411
G1 X152.07 Y131.673 E.03686
G1 X151.681 Y131.605 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y131.511 E.00302
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.167 E1.75945
G1 X151.663 Y131.662 E.03045
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.06016
G1 X151.71 Y129.669 E-.69984
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.584 J1.068 P1  F30000
G1 X154.346 Y131.111 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F15000
G1 X154.369 Y131.234 E.00314
; LINE_WIDTH: 0.399162
G1 X154.393 Y131.356 E.00362
; LINE_WIDTH: 0.446416
G1 X154.416 Y131.479 E.0041
; LINE_WIDTH: 0.49367
G1 F13976.714
G1 X154.44 Y131.601 E.00458
; LINE_WIDTH: 0.540924
G1 F12650.501
G1 X154.494 Y131.484 E.00525
; LINE_WIDTH: 0.49367
G1 F13976.714
G1 X154.547 Y131.366 E.00475
; LINE_WIDTH: 0.446416
G1 F15000
G1 X154.601 Y131.248 E.00425
; LINE_WIDTH: 0.352025
G1 X154.654 Y131.13 E.00326
G1 X154.654 Y105.324 E.65001
G1 X154.346 Y105.324 E.00778
G1 X154.346 Y131.051 E.64802
; WIPE_START
G1 F24000
G1 X154.346 Y129.051 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.81 J-.909 P1  F30000
G1 X130.609 Y150.198 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.419999
G1 F15000
G3 X106.074 Y132.107 I-.614 J-24.85 E1.0083
G1 X105.998 Y131.601 E.0157
G1 X105.998 Y104.981 E.81796
G1 X105.002 Y104.981 E.03058
G1 X105.002 Y131.172 E.80478
G2 X154.998 Y131.172 I24.998 J-5.82 E2.11682
G1 X154.998 Y104.981 E.80478
G1 X154.002 Y104.981 E.03058
G1 X154.002 Y131.601 E.81796
G1 X153.926 Y132.107 E.0157
G3 X130.669 Y150.196 I-23.933 J-6.775 E.96891
G1 X130.599 Y149.821 F30000
G1 F15000
G3 X106.434 Y131.994 I-.603 J-24.474 E.99328
G1 X106.375 Y131.601 E.01221
G1 X106.375 Y104.604 E.82955
G1 X104.625 Y104.604 E.05375
G1 X104.625 Y131.219 E.81779
G2 X155.375 Y131.219 I25.375 J-5.867 E2.15043
G1 X155.375 Y104.604 E.81779
G1 X153.625 Y104.604 E.05375
G1 X153.625 Y131.601 E.82955
G1 X153.566 Y131.994 E.01221
G3 X130.659 Y149.819 I-23.575 J-6.665 E.95452
G1 X130.588 Y149.444 F30000
G1 F15000
G3 X106.794 Y131.882 I-.594 J-24.095 E.97827
G1 X106.752 Y131.601 E.00872
G1 X106.752 Y104.227 E.84114
G1 X104.248 Y104.227 E.07692
G1 X104.248 Y131.265 E.83079
G2 X155.752 Y131.265 I25.752 J-5.914 E2.18404
G1 X155.752 Y104.227 E.83079
G1 X153.248 Y104.227 E.07692
G1 X153.248 Y131.601 E.84114
G1 X153.206 Y131.882 E.00872
G3 X130.648 Y149.442 I-23.218 J-6.557 E.94013
G1 X130.567 Y148.69 F30000
G1 F15000
G3 X107.514 Y131.656 I-.572 J-23.342 E.94829
G1 X107.506 Y103.473 E.86598
G1 X103.494 Y103.473 E.12327
G1 X103.494 Y131.357 E.8568
G2 X156.506 Y131.357 I26.506 J-6.008 E2.25127
G1 X156.506 Y103.473 E.8568
G1 X152.494 Y103.473 E.12327
G1 X152.486 Y131.658 E.86604
G3 X130.627 Y148.687 I-22.496 J-6.332 E.91137
G1 X129.418 Y149.068 F30000
G1 F15000
G3 X107.153 Y131.765 I.589 J-23.734 E.92771
G1 X107.129 Y131.111 E.02009
G1 X107.129 Y103.85 E.83767
G1 X103.871 Y103.85 E.10009
G1 X103.871 Y131.311 E.8438
G2 X156.129 Y131.311 I26.129 J-5.961 E2.21766
G1 X156.129 Y103.85 E.8438
G1 X152.871 Y103.85 E.10009
G1 X152.871 Y131.601 E.85272
M73 P41 R10
G1 X152.846 Y131.77 E.00523
G3 X129.478 Y149.07 I-22.86 J-6.446 E.96141
; WIPE_START
G1 F24000
G1 X130.016 Y149.082 E-.20471
G1 X131.244 Y149.048 E-.4669
G1 X131.476 Y149.031 E-.08839
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.679 J-1.01 P1  F30000
G1 X105.56 Y131.601 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.540928
G1 F12650.399
G1 X105.622 Y131.905 E.01255
; LINE_WIDTH: 0.478393
G1 F14467.026
G2 X105.689 Y132.227 I1.743 J-.198 E.0117
G2 X154.311 Y132.227 I24.311 J-6.887 E2.32177
; LINE_WIDTH: 0.472554
G1 F14663.643
G1 X154.369 Y131.943 E.01013
; LINE_WIDTH: 0.506739
G1 F13582.884
G1 X154.428 Y131.66 E.01093
; WIPE_START
G1 F24000
G1 X154.369 Y131.943 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.021 J-1.217 P1  F30000
G1 X105.654 Y131.111 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.351907
G1 F15000
G1 X105.654 Y105.324 E.64928
G1 X105.346 Y105.324 E.00778
G1 X105.346 Y131.13 E.64976
G1 X105.399 Y131.248 E.00326
; LINE_WIDTH: 0.399163
G1 X105.453 Y131.366 E.00376
; LINE_WIDTH: 0.446418
G1 X105.506 Y131.484 E.00425
; LINE_WIDTH: 0.493673
G1 F13976.621
G1 X105.56 Y131.601 E.00475
; LINE_WIDTH: 0.540928
G1 F12650.399
G1 X105.581 Y131.494 E.00445
; LINE_WIDTH: 0.493673
G1 F13976.621
G1 X105.602 Y131.386 E.00403
; LINE_WIDTH: 0.446418
G1 F15000
G1 X105.622 Y131.278 E.00361
; LINE_WIDTH: 0.399163
G1 X105.643 Y131.17 E.00319
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 0.714286
; LAYER_HEIGHT: 0.114286
; WIPE_START
G1 F24000
G1 X105.622 Y131.278 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/64
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
G3 Z1 I.076 J1.215 P1  F30000
G1 X109.039 Y131.066 Z1
G1 Z.714
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F8685
G1 X109.039 Y131.397 E.01266
G2 X109.86 Y133.727 I22.527 J-6.634 E.0945
G1 X109.86 Y130.877 E.10894
G1 X109.039 Y130.877 E.03141
G1 X109.039 Y128 E.10997
G1 X109.86 Y128 E.03141
G1 X109.86 Y125.123 E.10997
G1 X109.039 Y125.123 E.03141
G1 X109.039 Y122.246 E.10997
G1 X109.86 Y122.246 E.03141
G1 X109.86 Y119.369 E.10997
G1 X109.039 Y119.369 E.03141
G1 X109.039 Y116.492 E.10997
G1 X109.86 Y116.492 E.03141
G1 X109.86 Y113.615 E.10997
G1 X109.039 Y113.615 E.03141
G1 X109.039 Y110.738 E.10997
G1 X109.86 Y110.738 E.03141
G1 X109.86 Y107.86 E.10997
G1 X109.039 Y107.86 E.03141
G1 X109.039 Y104.983 E.10997
G1 X109.86 Y104.983 E.03141
G1 X109.86 Y102.106 E.10997
G1 X108.889 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.114 I.144 J-1.208 P1  F30000
G1 X101.229 Y102.106 Z1.114
G1 Z.714
G1 E.8 F1800
G1 F8685
G1 X102.111 Y102.106 E.0337
G1 X101.961 Y102.256 E.00807
G1 X101.961 Y104.983 E.10426
G1 X101.229 Y104.983 E.02799
G1 X101.229 Y107.86 E.10997
G1 X101.961 Y107.86 E.02799
G1 X101.961 Y110.738 E.10997
G1 X101.229 Y110.738 E.02799
G1 X101.229 Y113.615 E.10997
G1 X101.961 Y113.615 E.02799
G1 X101.961 Y116.492 E.10997
G1 X101.229 Y116.492 E.02799
G1 X101.229 Y119.369 E.10997
G1 X101.961 Y119.369 E.02799
G1 X101.961 Y122.246 E.10997
G1 X101.229 Y122.246 E.02799
G1 X101.229 Y125.123 E.10997
G1 X101.961 Y125.123 E.02799
G1 X101.961 Y128 E.10997
G1 X101.229 Y128 E.02799
G1 X101.229 Y130.877 E.10997
G1 X101.961 Y130.877 E.02799
G2 X101.969 Y131.577 I2.862 J.317 E.02681
G2 X102.552 Y133.754 I22.565 J-4.874 E.08619
G1 X101.229 Y133.754 E.05057
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.377 Y133.1 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.114 I.052 J1.216 P1  F30000
G1 X150.14 Y131.066 Z1.114
G1 Z.714
G1 E.8 F1800
G1 F8685
G1 X150.14 Y133.727 E.10173
G2 X150.961 Y131.397 I-21.705 J-8.965 E.0945
G1 X150.961 Y130.877 E.01986
G1 X150.14 Y130.877 E.03141
G1 X150.14 Y128 E.10997
G1 X150.961 Y128 E.03141
G1 X150.961 Y125.123 E.10997
G1 X150.14 Y125.123 E.03141
G1 X150.14 Y122.246 E.10997
G1 X150.961 Y122.246 E.03141
G1 X150.961 Y119.369 E.10997
G1 X150.14 Y119.369 E.03141
G1 X150.14 Y116.492 E.10997
G1 X150.961 Y116.492 E.03141
G1 X150.961 Y113.615 E.10997
G1 X150.14 Y113.615 E.03141
G1 X150.14 Y110.738 E.10997
G1 X150.961 Y110.738 E.03141
G1 X150.961 Y107.86 E.10997
G1 X150.14 Y107.86 E.03141
G1 X150.14 Y104.983 E.10997
G1 X150.961 Y104.983 E.03141
G1 X150.961 Y102.256 E.10426
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.114 I.168 J1.205 P1  F30000
G1 X157.889 Y102.106 Z1.114
G1 Z.714
G1 E.8 F1800
G1 F8685
G1 X158.771 Y102.106 E.0337
G1 X158.771 Y104.983 E.10997
G1 X158.039 Y104.983 E.02799
G1 X158.039 Y107.86 E.10997
G1 X158.771 Y107.86 E.02799
G1 X158.771 Y110.738 E.10997
G1 X158.039 Y110.738 E.02799
G1 X158.039 Y113.615 E.10997
G1 X158.771 Y113.615 E.02799
G1 X158.771 Y116.492 E.10997
G1 X158.039 Y116.492 E.02799
G1 X158.039 Y119.369 E.10997
G1 X158.771 Y119.369 E.02799
G1 X158.771 Y122.246 E.10997
G1 X158.039 Y122.246 E.02799
G1 X158.039 Y125.123 E.10997
G1 X158.771 Y125.123 E.02799
G1 X158.771 Y128 E.10997
G1 X158.039 Y128 E.02799
G1 X158.039 Y130.877 E.10997
G1 X158.771 Y130.877 E.02799
G1 X158.771 Y133.754 E.10997
G1 X157.448 Y133.754 E.05057
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.0857143
; WIPE_START
G1 F24000
G1 X158.771 Y133.754 E-.50281
G1 X158.771 Y133.077 E-.25719
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/64
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
G3 Z1.114 I.26 J-1.189 P1  F30000
G1 X152.088 Y131.616 Z1.114
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8685
G1 X152.102 Y131.57 E.00157
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.226 E1.93421
G1 X152.07 Y131.673 E.03686
G1 X151.679 Y131.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8685
G1 X151.71 Y131.511 E.0032
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.1 E2.32147
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.661 Y131.668 E.03026
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.0624
G1 X151.71 Y129.675 E-.6976
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.696 J.998 P1  F30000
G1 X155.497 Y132.316 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8685
G1 X155.893 Y132.316 E.01316
G1 X156.143 Y131.313 E.0343
G1 X156.143 Y131.115 E.00656
G1 X152.857 Y127.83 E.15411
G1 X152.857 Y128.17 E.01131
G1 X156.143 Y124.885 E.15411
G1 X156.143 Y123.439 E.04799
G1 X152.857 Y120.154 E.15411
G1 X152.857 Y120.495 E.01131
G1 X156.143 Y117.209 E.15411
G1 X156.143 Y115.763 E.04799
G1 X152.857 Y112.478 E.15411
G1 X152.857 Y112.819 E.01131
G1 X156.143 Y109.533 E.15411
G1 X156.143 Y108.087 E.04799
G1 X152.857 Y104.802 E.15411
G1 X152.857 Y105.143 E.01131
G1 X154.164 Y103.836 E.06129
G1 X155.792 Y103.836 E.05401
G1 X156.55 Y131.302 F30000
G1 F8685
G1 X156.55 Y103.429 E.92461
G1 X152.45 Y103.429 E.13598
G1 X152.45 Y132.723 E.97173
G1 X156.203 Y132.723 E.1245
G2 X156.55 Y131.362 I-13.668 J-4.203 E.04659
G1 X141.941 Y149.813 F30000
M73 P42 R10
G1 F8685
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.081 Y133.13 I-35.028 J-15.869 E.14366
G1 X155.574 Y133.13 E.01681
G1 X137.061 Y151.643 E.86847
G2 X138.013 Y151.365 I-2.35 J-9.813 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.29 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.536 E.03291
G1 X104.426 Y133.13 E.86847
G1 X103.919 Y133.13 E.01681
G2 X105.481 Y137.167 I36.593 J-11.834 E.14366
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13595
G2 X118.059 Y149.814 I8.905 J-15.297 E.05403
G1 X107.55 Y131.532 F30000
G1 F8685
G1 X107.55 Y103.429 E.93224
G1 X103.45 Y103.429 E.13598
G1 X103.45 Y131.362 E.9266
G2 X103.797 Y132.723 I13.996 J-2.837 E.04659
G1 X107.55 Y132.723 E.1245
G1 X107.55 Y131.592 E.0375
G1 X104.503 Y132.316 F30000
G1 F8685
G1 X104.107 Y132.316 E.01315
G1 X103.857 Y131.313 E.0343
G1 X103.857 Y131.115 E.00656
G1 X107.143 Y127.83 E.15411
G1 X107.143 Y128.17 E.01131
G1 X103.857 Y124.885 E.15411
G1 X103.857 Y123.439 E.04799
G1 X107.143 Y120.154 E.15411
G1 X107.143 Y120.495 E.01131
G1 X103.857 Y117.209 E.15411
G1 X103.857 Y115.763 E.04799
G1 X107.143 Y112.478 E.15411
G1 X107.143 Y112.819 E.01131
G1 X103.857 Y109.533 E.15411
G1 X103.857 Y108.087 E.04799
G1 X107.143 Y104.802 E.15411
G1 X107.143 Y105.143 E.01131
G1 X105.836 Y103.836 E.06129
G1 X104.208 Y103.836 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 0.971429
; LAYER_HEIGHT: 0.171429
; WIPE_START
G1 F24000
G1 X105.836 Y103.836 E-.61876
G1 X106.099 Y104.099 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/64
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
G3 Z1.2 I.707 J.99 P1  F30000
G1 X108.889 Y102.106 Z1.2
G1 Z.971
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F8709
G1 X109.86 Y102.106 E.03712
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y113.615 E.10997
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
G1 X109.86 Y122.246 E.10997
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y128 E.10997
G1 X109.039 Y128 E.03141
G1 X109.039 Y130.877 E.10997
G1 X109.86 Y130.877 E.03141
G1 X109.86 Y133.727 E.10894
G3 X109.039 Y131.397 I21.706 J-8.965 E.0945
G1 X109.039 Y131.066 E.01266
; WIPE_START
G1 F24000
G1 X109.039 Y131.397 E-.12582
G1 X109.594 Y132.971 E-.63418
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.371 I-.114 J-1.212 P1  F30000
G1 X101.229 Y133.754 Z1.371
G1 Z.971
G1 E.8 F1800
G1 F8709
G1 X102.552 Y133.754 E.05057
G3 X101.969 Y131.577 I21.982 J-7.052 E.08619
G3 X101.961 Y130.877 I2.854 J-.382 E.02681
G1 X101.229 Y130.877 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y107.86 E.10997
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y102.256 E.10426
G1 X102.111 Y102.106 E.00807
G1 X101.229 Y102.106 E.0337
; WIPE_START
G1 F24000
G1 X102.111 Y102.106 E-.33502
G1 X101.961 Y102.256 E-.08028
G1 X101.961 Y103.163 E-.34469
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.371 I-.61 J1.053 P1  F30000
G1 X150.14 Y131.066 Z1.371
G1 Z.971
G1 E.8 F1800
G1 F8709
G1 X150.14 Y133.727 E.10173
G2 X150.961 Y131.397 I-21.705 J-8.965 E.0945
G1 X150.961 Y130.877 E.01986
G1 X150.14 Y130.877 E.03141
G1 X150.14 Y128 E.10997
G1 X150.961 Y128 E.03141
G1 X150.961 Y125.123 E.10997
G1 X150.14 Y125.123 E.03141
G1 X150.14 Y122.246 E.10997
G1 X150.961 Y122.246 E.03141
G1 X150.961 Y119.369 E.10997
G1 X150.14 Y119.369 E.03141
G1 X150.14 Y116.492 E.10997
G1 X150.961 Y116.492 E.03141
G1 X150.961 Y113.615 E.10997
G1 X150.14 Y113.615 E.03141
G1 X150.14 Y110.738 E.10997
G1 X150.961 Y110.738 E.03141
G1 X150.961 Y107.86 E.10997
G1 X150.14 Y107.86 E.03141
G1 X150.14 Y104.983 E.10997
G1 X150.961 Y104.983 E.03141
G1 X150.961 Y102.256 E.10426
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.371 I.168 J1.205 P1  F30000
G1 X157.889 Y102.106 Z1.371
G1 Z.971
G1 E.8 F1800
G1 F8709
G1 X158.771 Y102.106 E.0337
G1 X158.771 Y104.983 E.10997
G1 X158.039 Y104.983 E.02799
G1 X158.039 Y107.86 E.10997
G1 X158.771 Y107.86 E.02799
G1 X158.771 Y110.738 E.10997
G1 X158.039 Y110.738 E.02799
G1 X158.039 Y113.615 E.10997
G1 X158.771 Y113.615 E.02799
G1 X158.771 Y116.492 E.10997
G1 X158.039 Y116.492 E.02799
G1 X158.039 Y119.369 E.10997
G1 X158.771 Y119.369 E.02799
G1 X158.771 Y122.246 E.10997
G1 X158.039 Y122.246 E.02799
G1 X158.039 Y125.123 E.10997
G1 X158.771 Y125.123 E.02799
G1 X158.771 Y128 E.10997
G1 X158.039 Y128 E.02799
G1 X158.039 Y130.877 E.10997
G1 X158.771 Y130.877 E.02799
G1 X158.771 Y133.754 E.10997
G1 X157.448 Y133.754 E.05057
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.0285714
; WIPE_START
G1 F24000
G1 X158.771 Y133.754 E-.50281
G1 X158.771 Y133.077 E-.25719
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/64
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
G3 Z1.371 I.26 J-1.189 P1  F30000
G1 X152.088 Y131.616 Z1.371
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8709
G1 X152.102 Y131.57 E.00157
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.226 E1.93421
G1 X152.07 Y131.673 E.03686
G1 X151.677 Y131.616 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8709
G1 X151.71 Y131.511 E.00339
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.101 E2.32142
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.659 Y131.673 E.03008
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.06473
G1 X151.71 Y129.681 E-.69527
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.695 J.999 P1  F30000
G1 X155.497 Y132.316 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8709
G1 X155.893 Y132.316 E.01316
G1 X156.143 Y131.313 E.0343
G1 X156.143 Y131.115 E.00656
G1 X152.857 Y127.83 E.15411
G1 X152.857 Y128.17 E.01131
G1 X156.143 Y124.885 E.15411
G1 X156.143 Y123.439 E.04799
G1 X152.857 Y120.154 E.15411
G1 X152.857 Y120.495 E.01131
G1 X156.143 Y117.209 E.15411
G1 X156.143 Y115.763 E.04799
G1 X152.857 Y112.478 E.15411
G1 X152.857 Y112.819 E.01131
G1 X156.143 Y109.533 E.15411
G1 X156.143 Y108.087 E.04799
G1 X152.857 Y104.802 E.15411
G1 X152.857 Y105.143 E.01131
G1 X154.164 Y103.836 E.06129
G1 X155.792 Y103.836 E.05401
G1 X156.55 Y131.302 F30000
G1 F8709
G1 X156.55 Y103.429 E.92461
G1 X152.45 Y103.429 E.13598
G1 X152.45 Y132.723 E.97173
G1 X156.203 Y132.723 E.1245
M73 P43 R10
G2 X156.55 Y131.362 I-13.668 J-4.203 E.04659
G1 X141.941 Y149.813 F30000
G1 F8709
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.081 Y133.13 I-35.028 J-15.869 E.14366
G1 X155.574 Y133.13 E.01681
G1 X137.061 Y151.643 E.86847
G2 X138.013 Y151.365 I-2.35 J-9.813 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.536 E.03291
G1 X104.426 Y133.13 E.86847
G1 X103.919 Y133.13 E.01681
G2 X105.481 Y137.167 I36.592 J-11.834 E.14366
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.27 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13595
G2 X118.059 Y149.814 I9.08 J-15.63 E.05403
G1 X107.55 Y131.532 F30000
G1 F8709
G1 X107.55 Y103.429 E.93224
G1 X103.45 Y103.429 E.13598
G1 X103.45 Y131.362 E.9266
G2 X103.797 Y132.723 I13.996 J-2.837 E.04659
G1 X107.55 Y132.723 E.1245
G1 X107.55 Y131.592 E.0375
G1 X104.503 Y132.316 F30000
G1 F8709
G1 X104.107 Y132.316 E.01315
G1 X103.857 Y131.313 E.0343
G1 X103.857 Y131.115 E.00656
G1 X107.143 Y127.83 E.15411
G1 X107.143 Y128.17 E.01131
G1 X103.857 Y124.885 E.15411
G1 X103.857 Y123.439 E.04799
G1 X107.143 Y120.154 E.15411
G1 X107.143 Y120.495 E.01131
G1 X103.857 Y117.209 E.15411
G1 X103.857 Y115.763 E.04799
G1 X107.143 Y112.478 E.15411
G1 X107.143 Y112.819 E.01131
G1 X103.857 Y109.533 E.15411
G1 X103.857 Y108.087 E.04799
G1 X107.143 Y104.802 E.15411
G1 X107.143 Y105.143 E.01131
G1 X105.836 Y103.836 E.06129
G1 X104.208 Y103.836 E.05401
M106 S242.25
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X105.836 Y103.836 E-.61876
G1 X106.099 Y104.099 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/64
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
G3 Z1.4 I-.625 J1.044 P1  F30000
G1 X152.088 Y131.616 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X152.102 Y131.57 E.00157
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.051 E2.46839
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X122.31 Y146.984 I22.105 J-6.224 E.72727
G1 X122.31 Y146.984 E0
G2 X151.74 Y132.734 I7.684 J-21.647 E1.20697
G1 X152.07 Y131.673 E.03686
G1 X151.675 Y131.622 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y131.511 E.00358
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.101 E2.32142
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.161 E1.75966
G1 X151.657 Y131.679 E.02988
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.06713
G1 X151.71 Y129.687 E-.69287
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.206 J.161 P1  F30000
G1 X152.117 Y132.739 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X152.053 Y132.775 E.00204
G1 X152.102 Y132.803 E.00155
G1 X156.399 Y132.702 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400014
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X152.472 Y132.702 E.20108
G1 X152.472 Y132.252 E.02304
G1 X156.307 Y132.252 E.19635
G1 X156.418 Y131.801 E.02374
G1 X152.472 Y131.801 E.20208
G1 X152.472 Y131.351 E.02304
G1 X156.528 Y131.351 E.2077
G1 X156.528 Y130.901 E.02304
G1 X152.472 Y130.901 E.2077
G1 X152.472 Y130.451 E.02304
G1 X156.528 Y130.451 E.2077
G1 X156.528 Y130.001 E.02304
G1 X152.472 Y130.001 E.2077
G1 X152.472 Y129.551 E.02304
G1 X156.528 Y129.551 E.2077
G1 X156.528 Y129.101 E.02304
G1 X152.472 Y129.101 E.2077
G1 X152.472 Y128.651 E.02304
G1 X156.528 Y128.651 E.2077
G1 X156.528 Y128.201 E.02304
G1 X152.472 Y128.201 E.2077
G1 X152.472 Y127.751 E.02304
G1 X156.528 Y127.751 E.2077
G1 X156.528 Y127.301 E.02304
G1 X152.472 Y127.301 E.2077
G1 X152.472 Y126.851 E.02304
G1 X156.528 Y126.851 E.2077
G1 X156.528 Y126.401 E.02304
G1 X152.472 Y126.401 E.2077
G1 X152.472 Y125.951 E.02304
G1 X156.528 Y125.951 E.2077
G1 X156.528 Y125.501 E.02304
G1 X152.472 Y125.501 E.2077
G1 X152.472 Y125.051 E.02304
G1 X156.528 Y125.051 E.2077
G1 X156.528 Y124.601 E.02304
G1 X152.472 Y124.601 E.2077
G1 X152.472 Y124.151 E.02304
G1 X156.528 Y124.151 E.2077
G1 X156.528 Y123.701 E.02304
G1 X152.472 Y123.701 E.2077
G1 X152.472 Y123.251 E.02304
G1 X156.528 Y123.251 E.2077
G1 X156.528 Y122.801 E.02304
G1 X152.472 Y122.801 E.2077
G1 X152.472 Y122.351 E.02304
G1 X156.528 Y122.351 E.2077
G1 X156.528 Y121.901 E.02304
G1 X152.472 Y121.901 E.2077
G1 X152.472 Y121.451 E.02304
G1 X156.528 Y121.451 E.2077
M73 P44 R10
G1 X156.528 Y121.001 E.02304
G1 X152.472 Y121.001 E.2077
G1 X152.472 Y120.551 E.02304
G1 X156.528 Y120.551 E.2077
G1 X156.528 Y120.101 E.02304
G1 X152.472 Y120.101 E.2077
G1 X152.472 Y119.651 E.02304
G1 X156.528 Y119.651 E.2077
G1 X156.528 Y119.201 E.02304
G1 X152.472 Y119.201 E.2077
G1 X152.472 Y118.751 E.02304
G1 X156.528 Y118.751 E.2077
G1 X156.528 Y118.301 E.02304
G1 X152.472 Y118.301 E.2077
G1 X152.472 Y117.851 E.02304
G1 X156.528 Y117.851 E.2077
G1 X156.528 Y117.401 E.02304
G1 X152.472 Y117.401 E.2077
G1 X152.472 Y116.951 E.02304
G1 X156.528 Y116.951 E.2077
G1 X156.528 Y116.501 E.02304
G1 X152.472 Y116.501 E.2077
G1 X152.472 Y116.051 E.02304
G1 X156.528 Y116.051 E.2077
G1 X156.528 Y115.601 E.02304
G1 X152.472 Y115.601 E.2077
G1 X152.472 Y115.151 E.02304
G1 X156.528 Y115.151 E.2077
G1 X156.528 Y114.701 E.02304
G1 X152.472 Y114.701 E.2077
G1 X152.472 Y114.251 E.02304
G1 X156.528 Y114.251 E.2077
G1 X156.528 Y113.801 E.02304
G1 X152.472 Y113.801 E.2077
G1 X152.472 Y113.351 E.02304
G1 X156.528 Y113.351 E.2077
G1 X156.528 Y112.901 E.02304
G1 X152.472 Y112.901 E.2077
G1 X152.472 Y112.451 E.02304
G1 X156.528 Y112.451 E.2077
G1 X156.528 Y112.001 E.02304
G1 X152.472 Y112.001 E.2077
G1 X152.472 Y111.551 E.02304
G1 X156.528 Y111.551 E.2077
G1 X156.528 Y111.101 E.02304
G1 X152.472 Y111.101 E.2077
G1 X152.472 Y110.651 E.02304
G1 X156.528 Y110.651 E.2077
G1 X156.528 Y110.201 E.02304
G1 X152.472 Y110.201 E.2077
G1 X152.472 Y109.751 E.02304
G1 X156.528 Y109.751 E.2077
G1 X156.528 Y109.301 E.02304
G1 X152.472 Y109.301 E.2077
G1 X152.472 Y108.851 E.02304
G1 X156.528 Y108.851 E.2077
G1 X156.528 Y108.401 E.02304
G1 X152.472 Y108.401 E.2077
G1 X152.472 Y107.951 E.02304
G1 X156.528 Y107.951 E.2077
G1 X156.528 Y107.501 E.02304
G1 X152.472 Y107.501 E.2077
G1 X152.472 Y107.051 E.02304
G1 X156.528 Y107.051 E.2077
G1 X156.528 Y106.601 E.02304
G1 X152.472 Y106.601 E.2077
G1 X152.472 Y106.151 E.02304
G1 X156.528 Y106.151 E.2077
G1 X156.528 Y105.701 E.02304
G1 X152.472 Y105.701 E.2077
G1 X152.472 Y105.251 E.02304
G1 X156.528 Y105.251 E.2077
G1 X156.528 Y104.801 E.02304
G1 X152.472 Y104.801 E.2077
G1 X152.472 Y104.351 E.02304
G1 X156.528 Y104.351 E.2077
G1 X156.528 Y103.901 E.02304
G1 X152.472 Y103.901 E.2077
G1 X152.472 Y103.451 E.02304
G1 X156.731 Y103.451 E.21807
M106 S242.25
; WIPE_START
G1 F24000
G1 X154.731 Y103.451 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.173 J-.324 P1  F30000
G1 X141.941 Y149.813 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.626 J-24.054 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X149.713 Y137.777 I-23.688 J-17.037 E.054
G1 X153.773 Y138.614 F30000
G1 F15476.087
G2 X154.519 Y137.167 I-14.332 J-8.31 E.05402
G1 X151.555 Y134.203 E.13905
G2 X151.965 Y133.13 I-10.572 J-4.651 E.03812
G1 X155.574 Y133.13 E.11972
G1 X137.061 Y151.643 E.86847
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X104.426 Y133.13 E.86847
G1 X108.035 Y133.13 E.11972
G2 X108.445 Y134.203 I10.981 J-3.578 E.03812
G1 X105.481 Y137.167 E.13905
G2 X106.227 Y138.614 I15.077 J-6.863 E.05402
G1 X110.287 Y137.777 F30000
G1 F15476.087
G2 X111.2 Y139.124 I24.601 J-15.69 E.054
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13595
G2 X118.059 Y149.814 I9.254 J-15.963 E.05403
G1 X107.926 Y132.739 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
M73 P44 R9
G1 F15000
G1 X107.862 Y132.775 E.00204
G1 X107.91 Y132.803 E.00155
G1 X103.95 Y132.904 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.405034
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X107.528 Y132.273 E.19075
G1 X107.528 Y131.811 E.02426
G1 X103.75 Y132.477 E.20142
G1 X103.64 Y132.035 E.02395
G1 X107.528 Y131.349 E.20729
G1 X107.528 Y130.887 E.02426
G1 X103.53 Y131.592 E.21316
G3 X103.472 Y131.14 I.88 J-.342 E.02415
G1 X107.528 Y130.425 E.21623
G1 X107.528 Y129.963 E.02426
G1 X103.472 Y130.678 E.21623
G1 X103.472 Y130.216 E.02426
G1 X107.528 Y129.501 E.21623
G1 X107.528 Y129.039 E.02426
G1 X103.472 Y129.754 E.21623
G1 X103.472 Y129.292 E.02426
G1 X107.528 Y128.577 E.21623
G1 X107.528 Y128.115 E.02426
G1 X103.472 Y128.83 E.21623
G1 X103.472 Y128.368 E.02426
G1 X107.528 Y127.653 E.21623
G1 X107.528 Y127.19 E.02426
G1 X103.472 Y127.906 E.21623
G1 X103.472 Y127.444 E.02426
G1 X107.528 Y126.728 E.21623
G1 X107.528 Y126.266 E.02426
G1 X103.472 Y126.982 E.21623
G1 X103.472 Y126.52 E.02426
G1 X107.528 Y125.804 E.21623
G1 X107.528 Y125.342 E.02426
G1 X103.472 Y126.058 E.21623
G1 X103.472 Y125.595 E.02426
G1 X107.528 Y124.88 E.21623
G1 X107.528 Y124.418 E.02426
G1 X103.472 Y125.133 E.21623
G1 X103.472 Y124.671 E.02426
G1 X107.528 Y123.956 E.21623
G1 X107.528 Y123.494 E.02426
G1 X103.472 Y124.209 E.21623
G1 X103.472 Y123.747 E.02426
G1 X107.528 Y123.032 E.21623
G1 X107.528 Y122.57 E.02426
G1 X103.472 Y123.285 E.21623
G1 X103.472 Y122.823 E.02426
G1 X107.528 Y122.108 E.21623
G1 X107.528 Y121.646 E.02426
G1 X103.472 Y122.361 E.21623
G1 X103.472 Y121.899 E.02426
G1 X107.528 Y121.184 E.21623
G1 X107.528 Y120.722 E.02426
G1 X103.472 Y121.437 E.21623
G1 X103.472 Y120.975 E.02426
G1 X107.528 Y120.26 E.21623
G1 X107.528 Y119.798 E.02426
G1 X103.472 Y120.513 E.21623
G1 X103.472 Y120.051 E.02426
G1 X107.528 Y119.336 E.21623
G1 X107.528 Y118.874 E.02426
G1 X103.472 Y119.589 E.21623
G1 X103.472 Y119.127 E.02426
G1 X107.528 Y118.411 E.21623
G1 X107.528 Y117.949 E.02426
G1 X103.472 Y118.665 E.21623
G1 X103.472 Y118.203 E.02426
G1 X107.528 Y117.487 E.21623
G1 X107.528 Y117.025 E.02426
G1 X103.472 Y117.741 E.21623
G1 X103.472 Y117.278 E.02426
G1 X107.528 Y116.563 E.21623
G1 X107.528 Y116.101 E.02426
G1 X103.472 Y116.816 E.21623
G1 X103.472 Y116.354 E.02426
G1 X107.528 Y115.639 E.21623
G1 X107.528 Y115.177 E.02426
G1 X103.472 Y115.892 E.21623
G1 X103.472 Y115.43 E.02426
G1 X107.528 Y114.715 E.21623
G1 X107.528 Y114.253 E.02426
G1 X103.472 Y114.968 E.21623
G1 X103.472 Y114.506 E.02426
G1 X107.528 Y113.791 E.21623
G1 X107.528 Y113.329 E.02426
G1 X103.472 Y114.044 E.21623
G1 X103.472 Y113.582 E.02426
G1 X107.528 Y112.867 E.21623
G1 X107.528 Y112.405 E.02426
G1 X103.472 Y113.12 E.21623
G1 X103.472 Y112.658 E.02426
G1 X107.528 Y111.943 E.21623
G1 X107.528 Y111.481 E.02426
G1 X103.472 Y112.196 E.21623
G1 X103.472 Y111.734 E.02426
G1 X107.528 Y111.019 E.21623
G1 X107.528 Y110.557 E.02426
G1 X103.472 Y111.272 E.21623
G1 X103.472 Y110.81 E.02426
G1 X107.528 Y110.094 E.21623
G1 X107.528 Y109.632 E.02426
G1 X103.472 Y110.348 E.21623
G1 X103.472 Y109.886 E.02426
G1 X107.528 Y109.17 E.21623
G1 X107.528 Y108.708 E.02426
G1 X103.472 Y109.424 E.21623
G1 X103.472 Y108.962 E.02426
G1 X107.528 Y108.246 E.21623
M73 P45 R9
G1 X107.528 Y107.784 E.02426
G1 X103.472 Y108.499 E.21623
G1 X103.472 Y108.037 E.02426
G1 X107.528 Y107.322 E.21623
G1 X107.528 Y106.86 E.02426
G1 X103.472 Y107.575 E.21623
G1 X103.472 Y107.113 E.02426
G1 X107.528 Y106.398 E.21623
G1 X107.528 Y105.936 E.02426
G1 X103.472 Y106.651 E.21623
G1 X103.472 Y106.189 E.02426
G1 X107.528 Y105.474 E.21623
G1 X107.528 Y105.012 E.02426
G1 X103.472 Y105.727 E.21623
G1 X103.472 Y105.265 E.02426
G1 X107.528 Y104.55 E.21623
G1 X107.528 Y104.088 E.02426
G1 X103.472 Y104.803 E.21623
G1 X103.472 Y104.341 E.02426
G1 X107.528 Y103.626 E.21623
G1 X107.528 Y103.451 E.0092
G1 X105.901 Y103.451 E.08541
G1 X103.269 Y103.915 E.1403
M106 S242.25
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 1.22857
; LAYER_HEIGHT: 0.0285714
; WIPE_START
G1 F24000
G1 X105.239 Y103.567 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/64
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
G3 Z1.6 I.452 J1.13 P1  F30000
G1 X108.889 Y102.106 Z1.6
G1 Z1.229
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.86 Y102.106 E.03712
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y113.615 E.10997
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
G1 X109.86 Y122.246 E.10997
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y128 E.10997
G1 X109.039 Y128 E.03141
G1 X109.039 Y130.877 E.10997
G1 X109.86 Y130.877 E.03141
G1 X109.86 Y133.727 E.10894
G1 X109.715 Y133.386 E.01419
G3 X109.039 Y131.066 I7.19 J-3.356 E.09274
; WIPE_START
G1 F24000
G1 X109.039 Y131.397 E-.12582
G1 X109.576 Y132.977 E-.63418
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.629 I-.113 J-1.212 P1  F30000
G1 X101.229 Y133.754 Z1.629
G1 Z1.229
G1 E.8 F1800
G1 F9000
G1 X102.552 Y133.754 E.05057
G3 X101.969 Y131.577 I21.981 J-7.052 E.08619
G3 X101.961 Y130.877 I2.854 J-.382 E.02681
G1 X101.229 Y130.877 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y107.86 E.10997
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y102.256 E.10426
G1 X102.111 Y102.106 E.00807
G1 X101.229 Y102.106 E.0337
; WIPE_START
G1 F24000
G1 X102.111 Y102.106 E-.33502
G1 X101.961 Y102.256 E-.08028
G1 X101.961 Y103.163 E-.34469
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.629 I-.61 J1.053 P1  F30000
G1 X150.14 Y131.066 Z1.629
G1 Z1.229
G1 E.8 F1800
G1 F9000
G1 X150.14 Y133.727 E.10173
G2 X150.961 Y131.397 I-21.706 J-8.965 E.0945
G1 X150.961 Y130.877 E.01986
G1 X150.14 Y130.877 E.03141
G1 X150.14 Y128 E.10997
G1 X150.961 Y128 E.03141
G1 X150.961 Y125.123 E.10997
G1 X150.14 Y125.123 E.03141
G1 X150.14 Y122.246 E.10997
G1 X150.961 Y122.246 E.03141
G1 X150.961 Y119.369 E.10997
G1 X150.14 Y119.369 E.03141
G1 X150.14 Y116.492 E.10997
G1 X150.961 Y116.492 E.03141
G1 X150.961 Y113.615 E.10997
G1 X150.14 Y113.615 E.03141
G1 X150.14 Y110.738 E.10997
G1 X150.961 Y110.738 E.03141
G1 X150.961 Y107.86 E.10997
G1 X150.14 Y107.86 E.03141
G1 X150.14 Y104.983 E.10997
G1 X150.961 Y104.983 E.03141
G1 X150.961 Y102.256 E.10426
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.629 I.168 J1.205 P1  F30000
G1 X157.889 Y102.106 Z1.629
G1 Z1.229
G1 E.8 F1800
G1 F9000
G1 X158.771 Y102.106 E.0337
G1 X158.771 Y104.983 E.10997
G1 X158.039 Y104.983 E.02799
G1 X158.039 Y107.86 E.10997
G1 X158.771 Y107.86 E.02799
G1 X158.771 Y110.738 E.10997
G1 X158.039 Y110.738 E.02799
G1 X158.039 Y113.615 E.10997
G1 X158.771 Y113.615 E.02799
G1 X158.771 Y116.492 E.10997
G1 X158.039 Y116.492 E.02799
G1 X158.039 Y119.369 E.10997
G1 X158.771 Y119.369 E.02799
G1 X158.771 Y122.246 E.10997
G1 X158.039 Y122.246 E.02799
G1 X158.039 Y125.123 E.10997
G1 X158.771 Y125.123 E.02799
G1 X158.771 Y128 E.10997
G1 X158.039 Y128 E.02799
G1 X158.039 Y130.877 E.10997
G1 X158.771 Y130.877 E.02799
G1 X158.771 Y133.754 E.10997
G1 X157.448 Y133.754 E.05057
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.171429
; WIPE_START
G1 F24000
G1 X158.771 Y133.754 E-.50281
G1 X158.771 Y133.077 E-.25719
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/64
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
G3 Z1.629 I.26 J-1.189 P1  F30000
G1 X152.088 Y131.616 Z1.629
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F13858
G1 X152.102 Y131.57 E.00157
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X122.333 Y146.991 I22.137 J-6.255 E.72798
G1 X122.333 Y146.991 E0
G2 X151.741 Y132.734 I7.665 J-21.646 E1.20624
G1 X152.07 Y131.673 E.03686
G1 X151.673 Y131.628 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y131.511 E.00378
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.655 Y131.686 E.02968
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.06961
G1 X151.71 Y129.694 E-.69039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.205 J.173 P1  F30000
G1 X152.147 Y132.738 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F13858
G1 X156.153 Y132.738 E.12311
G1 X156.506 Y131.357 E.0438
G1 X156.506 Y103.473 E.8568
G1 X152.494 Y103.473 E.12327
G1 X152.494 Y131.601 E.86431
G1 X152.165 Y132.681 E.03468
G1 X152.66 Y132.361 F30000
G1 F13858
G1 X155.868 Y132.361 E.09856
G1 X156.129 Y131.311 E.03325
G1 X156.129 Y103.85 E.8438
G1 X152.871 Y103.85 E.10009
G1 X152.871 Y131.601 E.85272
G1 X152.676 Y132.303 E.02238
G1 X153.174 Y131.984 F30000
G1 F13858
G1 X155.573 Y131.984 E.07372
G1 X155.752 Y131.265 E.02277
G1 X155.752 Y104.227 E.83079
G1 X153.248 Y104.227 E.07692
G1 X153.248 Y131.601 E.84114
G1 X153.185 Y131.925 E.01013
G1 X153.625 Y131.601 F30000
G1 F13858
G2 X155.278 Y131.607 I1.263 J-135.975 E.05078
G1 X155.375 Y131.164 E.01391
G1 X155.375 Y104.604 E.81612
G1 X153.625 Y104.604 E.05375
G1 X153.625 Y131.541 E.82771
G1 X154.002 Y131.23 F30000
G1 F13858
G1 X154.983 Y131.23 E.03014
G1 X154.998 Y130.732 E.01529
G1 X154.998 Y104.981 E.79125
G1 X154.002 Y104.981 E.03058
G1 X154.002 Y131.17 E.8047
G1 X154.346 Y130.887 F30000
; LINE_WIDTH: 0.351907
G1 F13858
G1 X154.654 Y130.887 E.00778
G1 X154.654 Y105.324 E.64362
G1 X154.346 Y105.324 E.00778
G1 X154.346 Y130.827 E.64211
G1 X153.773 Y138.614 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F13858
G2 X154.519 Y137.167 I-14.332 J-8.31 E.05402
G1 X151.555 Y134.203 E.13905
G2 X151.965 Y133.13 I-10.571 J-4.651 E.03812
G1 X155.574 Y133.13 E.11972
G1 X137.061 Y151.643 E.86847
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.289 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X104.426 Y133.13 E.86847
G1 X108.035 Y133.13 E.11972
G2 X108.445 Y134.203 I10.981 J-3.578 E.03812
G1 X105.481 Y137.167 E.13905
G2 X106.227 Y138.614 I15.077 J-6.863 E.05402
G1 X110.287 Y137.777 F30000
M73 P46 R9
G1 F13858
G2 X111.2 Y139.124 I24.6 J-15.689 E.054
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.903 Y143.097 E.13057
G2 X119.514 Y146.162 I16.908 J-20.439 E.184
G1 X116.616 Y149.06 E.13595
G2 X118.059 Y149.814 I9.43 J-16.298 E.05403
G1 X105.654 Y130.887 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F13858
G1 X105.654 Y105.324 E.64362
G1 X105.346 Y105.324 E.00778
G1 X105.346 Y130.887 E.64362
G1 X105.594 Y130.887 E.00627
G1 X105.998 Y131.23 F30000
; LINE_WIDTH: 0.419999
G1 F13858
G1 X105.998 Y104.981 E.80654
G1 X105.002 Y104.981 E.03058
G1 X105.002 Y131.172 E.80478
G1 X105.017 Y131.23 E.00181
G1 X105.938 Y131.23 E.02829
G1 X106.375 Y130.732 F30000
G1 F13858
G1 X106.375 Y104.604 E.80284
G1 X104.625 Y104.604 E.05375
G1 X104.625 Y131.219 E.81779
G1 X104.722 Y131.607 E.01229
G1 X106.375 Y131.607 E.05081
G1 X106.375 Y130.792 E.02503
G1 X107.129 Y130.732 F30000
G1 F13858
G1 X107.129 Y103.85 E.82601
G1 X103.871 Y103.85 E.10009
G1 X103.871 Y131.311 E.8438
G1 X104.132 Y132.361 E.03325
G1 X107.34 Y132.361 E.09856
G1 X107.155 Y131.771 E.019
G1 X107.13 Y130.792 E.03008
G1 X106.826 Y131.984 F30000
G1 F13858
G1 X106.752 Y131.601 E.01197
G1 X106.752 Y104.227 E.84114
G1 X104.248 Y104.227 E.07692
G1 X104.248 Y131.265 E.83079
G1 X104.427 Y131.984 E.02277
G1 X106.766 Y131.984 E.07188
G1 X107.853 Y132.738 F30000
G1 F13858
G1 X107.514 Y131.658 E.03478
G1 X107.506 Y103.473 E.86605
G1 X103.494 Y103.473 E.12327
G1 X103.494 Y131.357 E.8568
G1 X103.847 Y132.738 E.0438
G1 X107.793 Y132.738 E.12127
; WIPE_START
G1 F24000
G1 X105.793 Y132.738 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.52 J1.1 P1  F30000
G1 X141.941 Y149.813 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F13858
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X149.713 Y137.777 I-23.688 J-17.037 E.054
; CHANGE_LAYER
; Z_HEIGHT: 1.48571
; LAYER_HEIGHT: 0.0857143
; WIPE_START
G1 F24000
G1 X148.8 Y139.124 E-.61855
G1 X149.063 Y139.387 E-.14145
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/64
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
G3 Z1.8 I1.207 J.156 P1  F30000
G1 X150.14 Y131.066 Z1.8
G1 Z1.486
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X150.14 Y133.727 E.10173
G2 X150.961 Y131.397 I-21.705 J-8.965 E.0945
G1 X150.961 Y130.877 E.01986
G1 X150.14 Y130.877 E.03141
G1 X150.14 Y128 E.10997
G1 X150.961 Y128 E.03141
G1 X150.961 Y125.123 E.10997
G1 X150.14 Y125.123 E.03141
G1 X150.14 Y122.246 E.10997
G1 X150.961 Y122.246 E.03141
G1 X150.961 Y119.369 E.10997
G1 X150.14 Y119.369 E.03141
G1 X150.14 Y116.492 E.10997
G1 X150.961 Y116.492 E.03141
G1 X150.961 Y113.615 E.10997
G1 X150.14 Y113.615 E.03141
G1 X150.14 Y110.738 E.10997
G1 X150.961 Y110.738 E.03141
G1 X150.961 Y107.86 E.10997
G1 X150.14 Y107.86 E.03141
G1 X150.14 Y104.983 E.10997
G1 X150.961 Y104.983 E.03141
G1 X150.961 Y102.256 E.10426
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.886 I.168 J1.205 P1  F30000
G1 X157.889 Y102.106 Z1.886
G1 Z1.486
G1 E.8 F1800
G1 F9000
G1 X158.771 Y102.106 E.0337
G1 X158.771 Y104.983 E.10997
G1 X158.039 Y104.983 E.02799
G1 X158.039 Y107.86 E.10997
G1 X158.771 Y107.86 E.02799
G1 X158.771 Y110.738 E.10997
G1 X158.039 Y110.738 E.02799
G1 X158.039 Y113.615 E.10997
G1 X158.771 Y113.615 E.02799
G1 X158.771 Y116.492 E.10997
G1 X158.039 Y116.492 E.02799
G1 X158.039 Y119.369 E.10997
G1 X158.771 Y119.369 E.02799
G1 X158.771 Y122.246 E.10997
G1 X158.039 Y122.246 E.02799
G1 X158.039 Y125.123 E.10997
G1 X158.771 Y125.123 E.02799
G1 X158.771 Y128 E.10997
G1 X158.039 Y128 E.02799
G1 X158.039 Y130.877 E.10997
G1 X158.771 Y130.877 E.02799
G1 X158.771 Y133.754 E.10997
G1 X157.448 Y133.754 E.05057
; WIPE_START
G1 F24000
G1 X158.771 Y133.754 E-.50281
G1 X158.771 Y133.077 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.886 I.049 J-1.216 P1  F30000
G1 X109.039 Y131.066 Z1.886
G1 Z1.486
G1 E.8 F1800
G1 F9000
G1 X109.039 Y131.397 E.01266
G2 X109.86 Y133.727 I22.527 J-6.634 E.0945
G1 X109.86 Y130.877 E.10894
G1 X109.039 Y130.877 E.03141
G1 X109.039 Y128 E.10997
G1 X109.86 Y128 E.03141
G1 X109.86 Y125.123 E.10997
G1 X109.039 Y125.123 E.03141
G1 X109.039 Y122.246 E.10997
G1 X109.86 Y122.246 E.03141
G1 X109.86 Y119.369 E.10997
G1 X109.039 Y119.369 E.03141
G1 X109.039 Y116.492 E.10997
G1 X109.86 Y116.492 E.03141
G1 X109.86 Y113.615 E.10997
G1 X109.039 Y113.615 E.03141
G1 X109.039 Y110.738 E.10997
G1 X109.86 Y110.738 E.03141
G1 X109.86 Y107.86 E.10997
G1 X109.039 Y107.86 E.03141
G1 X109.039 Y104.983 E.10997
G1 X109.86 Y104.983 E.03141
G1 X109.86 Y102.106 E.10997
G1 X108.889 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.886 I.144 J-1.208 P1  F30000
G1 X101.229 Y102.106 Z1.886
G1 Z1.486
G1 E.8 F1800
G1 F9000
G1 X102.111 Y102.106 E.0337
G1 X101.961 Y102.256 E.00807
G1 X101.961 Y104.983 E.10426
G1 X101.229 Y104.983 E.02799
G1 X101.229 Y107.86 E.10997
G1 X101.961 Y107.86 E.02799
G1 X101.961 Y110.738 E.10997
G1 X101.229 Y110.738 E.02799
G1 X101.229 Y113.615 E.10997
G1 X101.961 Y113.615 E.02799
G1 X101.961 Y116.492 E.10997
G1 X101.229 Y116.492 E.02799
G1 X101.229 Y119.369 E.10997
G1 X101.961 Y119.369 E.02799
G1 X101.961 Y122.246 E.10997
G1 X101.229 Y122.246 E.02799
G1 X101.229 Y125.123 E.10997
G1 X101.961 Y125.123 E.02799
G1 X101.961 Y128 E.10997
G1 X101.229 Y128 E.02799
G1 X101.229 Y130.877 E.10997
G1 X101.961 Y130.877 E.02799
G2 X102.317 Y132.972 I7.965 J-.273 E.08144
G1 X102.552 Y133.754 E.03124
G1 X101.229 Y133.754 E.05057
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.114286
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.357 Y133.106 E-.25719
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/64
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
G3 Z1.886 I.013 J1.217 P1  F30000
G1 X151.907 Y132.557 Z1.886
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X156.617 Y132.557 E.15625
G3 X103.383 Y132.557 I-26.617 J-7.215 E2.38964
G1 X108.205 Y132.557 E.15998
G1 X108.261 Y132.734 E.00616
G2 X151.795 Y132.557 I21.737 J-7.385 E1.89984
G1 X151.847 Y132.557 E.00174
G1 X151.671 Y131.635 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y131.511 E.00399
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.161 E1.75966
G1 X151.653 Y131.692 E.02948
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.07215
G1 X151.71 Y129.701 E-.68785
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.415 J1.144 P1  F30000
G1 X157.032 Y131.631 Z2
G1 Z1.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X156.329 Y132.334 E.03056
G1 X155.796 Y132.334
G1 X157.083 Y131.047 E.05593
G1 X157.083 Y130.514
G1 X155.262 Y132.334 E.0791
G1 X154.729 Y132.334
G1 X157.083 Y129.981 E.10227
G1 X157.083 Y129.447
G1 X154.196 Y132.334 E.12545
G1 X153.662 Y132.334
G1 X157.083 Y128.914 E.14862
G1 X157.083 Y128.381
G1 X153.129 Y132.334 E.17179
G1 X152.596 Y132.334
G1 X157.083 Y127.847 E.19497
G1 X157.083 Y127.314
G1 X152.063 Y132.334 E.21814
G1 X151.734 Y132.129
G1 X157.083 Y126.781 E.23241
G1 X157.083 Y126.248
G1 X151.917 Y131.413 E.22445
G1 X151.917 Y130.88
G1 X157.083 Y125.714 E.22445
G1 X157.083 Y125.181
G1 X151.917 Y130.346 E.22445
G1 X151.917 Y129.813
G1 X157.083 Y124.648 E.22445
G1 X157.083 Y124.115
G1 X151.917 Y129.28 E.22445
G1 X151.917 Y128.747
G1 X157.083 Y123.581 E.22445
G1 X157.083 Y123.048
G1 X151.917 Y128.213 E.22445
G1 X151.917 Y127.68
G1 X157.083 Y122.515 E.22445
G1 X157.083 Y121.982
G1 X151.917 Y127.147 E.22445
G1 X151.917 Y126.613
G1 X157.083 Y121.448 E.22445
G1 X157.083 Y120.915
G1 X151.917 Y126.08 E.22445
M73 P47 R9
G1 X151.917 Y125.547
G1 X157.083 Y120.382 E.22445
G1 X157.083 Y119.848
G1 X151.917 Y125.014 E.22445
G1 X151.917 Y124.48
G1 X157.083 Y119.315 E.22445
G1 X157.083 Y118.782
G1 X151.917 Y123.947 E.22445
G1 X151.917 Y123.414
G1 X157.083 Y118.249 E.22445
G1 X157.083 Y117.715
G1 X151.917 Y122.881 E.22445
G1 X151.917 Y122.347
G1 X157.083 Y117.182 E.22445
G1 X157.083 Y116.649
G1 X151.917 Y121.814 E.22445
G1 X151.917 Y121.281
G1 X157.083 Y116.116 E.22445
G1 X157.083 Y115.582
G1 X151.917 Y120.747 E.22445
G1 X151.917 Y120.214
G1 X157.083 Y115.049 E.22445
G1 X157.083 Y114.516
G1 X151.917 Y119.681 E.22445
G1 X151.917 Y119.148
G1 X157.083 Y113.982 E.22445
G1 X157.083 Y113.449
G1 X151.917 Y118.614 E.22445
G1 X151.917 Y118.081
G1 X157.083 Y112.916 E.22445
G1 X157.083 Y112.383
G1 X151.917 Y117.548 E.22445
G1 X151.917 Y117.015
G1 X157.083 Y111.849 E.22445
G1 X157.083 Y111.316
G1 X151.917 Y116.481 E.22445
G1 X151.917 Y115.948
G1 X157.083 Y110.783 E.22445
G1 X157.083 Y110.25
G1 X151.917 Y115.415 E.22445
G1 X151.917 Y114.882
G1 X157.083 Y109.716 E.22445
G1 X157.083 Y109.183
G1 X151.917 Y114.348 E.22445
G1 X151.917 Y113.815
G1 X157.083 Y108.65 E.22445
G1 X157.083 Y108.116
G1 X151.917 Y113.282 E.22445
G1 X151.917 Y112.748
G1 X157.083 Y107.583 E.22445
G1 X157.083 Y107.05
G1 X151.917 Y112.215 E.22445
G1 X151.917 Y111.682
G1 X157.083 Y106.517 E.22445
G1 X157.083 Y105.983
G1 X151.917 Y111.149 E.22445
G1 X151.917 Y110.615
G1 X157.083 Y105.45 E.22445
G1 X157.083 Y104.917
G1 X151.917 Y110.082 E.22445
G1 X151.917 Y109.549
G1 X157.083 Y104.384 E.22445
G1 X157.083 Y103.85
G1 X151.917 Y109.016 E.22445
G1 X151.917 Y108.482
G1 X157.083 Y103.317 E.22445
G1 X156.743 Y103.123
G1 X151.917 Y107.949 E.2097
G1 X151.917 Y107.416
G1 X156.21 Y103.123 E.18652
G1 X155.676 Y103.123
G1 X151.917 Y106.882 E.16335
G1 X151.917 Y106.349
G1 X155.143 Y103.123 E.14018
G1 X154.61 Y103.123
G1 X151.917 Y105.816 E.117
G1 X151.917 Y105.283
G1 X154.077 Y103.123 E.09383
G1 X153.543 Y103.123
G1 X151.917 Y104.749 E.07066
G1 X151.917 Y104.216
G1 X153.01 Y103.123 E.04748
G1 X152.477 Y103.123
G1 X151.917 Y103.683 E.02431
M204 S10000
; WIPE_START
G1 F24000
G1 X152.477 Y103.123 E-.30066
G1 X153.01 Y103.123 E-.20264
G1 X152.532 Y103.601 E-.2567
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.217 J-.027 P1  F30000
G1 X151.906 Y131.401 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.166631
G1 F15000
G1 X151.961 Y131.546 E.00156
G1 X151.871 Y131.713 E.00191
; WIPE_START
G1 F24000
G1 X151.961 Y131.546 E-.41837
G1 X151.906 Y131.401 E-.34163
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.07 J-.579 P1  F30000
G1 X141.941 Y149.813 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.149 Y132.905 I-34.035 J-15.454 E.15146
G1 X155.799 Y132.905 E.01159
G1 X137.061 Y151.643 E.87904
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.289 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X104.201 Y132.905 E.87904
G1 X103.851 Y132.905 E.01159
G2 X105.481 Y137.167 I35.665 J-11.192 E.15146
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
G1 X107.801 Y132.334 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.204 Y131.931 E.0175
G1 X108.083 Y131.519
G1 X107.268 Y132.334 E.0354
G1 X106.735 Y132.334
G1 X108.083 Y130.986 E.05857
G1 X108.083 Y130.453
G1 X106.201 Y132.334 E.08175
G1 X105.668 Y132.334
G1 X108.083 Y129.92 E.10492
G1 X108.083 Y129.386
G1 X105.135 Y132.334 E.12809
G1 X104.602 Y132.334
G1 X108.083 Y128.853 E.15127
G1 X108.083 Y128.32
G1 X104.068 Y132.334 E.17444
G1 X103.535 Y132.334
G1 X108.083 Y127.787 E.19761
G1 X108.083 Y127.253
G1 X103.115 Y132.221 E.21588
G1 X103.008 Y131.794
G1 X108.083 Y126.72 E.22049
G1 X108.083 Y126.187
G1 X102.917 Y131.352 E.22445
G1 X102.917 Y130.819
G1 X108.083 Y125.654 E.22445
G1 X108.083 Y125.12
G1 X102.917 Y130.285 E.22445
G1 X102.917 Y129.752
G1 X108.083 Y124.587 E.22445
G1 X108.083 Y124.054
G1 X102.917 Y129.219 E.22445
G1 X102.917 Y128.686
G1 X108.083 Y123.52 E.22445
G1 X108.083 Y122.987
G1 X102.917 Y128.152 E.22445
G1 X102.917 Y127.619
G1 X108.083 Y122.454 E.22445
G1 X108.083 Y121.921
G1 X102.917 Y127.086 E.22445
G1 X102.917 Y126.553
G1 X108.083 Y121.387 E.22445
G1 X108.083 Y120.854
G1 X102.917 Y126.019 E.22445
G1 X102.917 Y125.486
G1 X108.083 Y120.321 E.22445
G1 X108.083 Y119.788
G1 X102.917 Y124.953 E.22445
G1 X102.917 Y124.419
G1 X108.083 Y119.254 E.22445
G1 X108.083 Y118.721
G1 X102.917 Y123.886 E.22445
G1 X102.917 Y123.353
G1 X108.083 Y118.188 E.22445
G1 X108.083 Y117.654
G1 X102.917 Y122.82 E.22445
G1 X102.917 Y122.286
G1 X108.083 Y117.121 E.22445
G1 X108.083 Y116.588
G1 X102.917 Y121.753 E.22445
G1 X102.917 Y121.22
G1 X108.083 Y116.055 E.22445
G1 X108.083 Y115.521
G1 X102.917 Y120.687 E.22445
M73 P48 R9
G1 X102.917 Y120.153
G1 X108.083 Y114.988 E.22445
G1 X108.083 Y114.455
G1 X102.917 Y119.62 E.22445
G1 X102.917 Y119.087
G1 X108.083 Y113.922 E.22445
G1 X108.083 Y113.388
G1 X102.917 Y118.554 E.22445
G1 X102.917 Y118.02
G1 X108.083 Y112.855 E.22445
G1 X108.083 Y112.322
G1 X102.917 Y117.487 E.22445
G1 X102.917 Y116.954
G1 X108.083 Y111.789 E.22445
G1 X108.083 Y111.255
G1 X102.917 Y116.42 E.22445
G1 X102.917 Y115.887
G1 X108.083 Y110.722 E.22445
G1 X108.083 Y110.189
G1 X102.917 Y115.354 E.22445
G1 X102.917 Y114.821
G1 X108.083 Y109.655 E.22445
G1 X108.083 Y109.122
G1 X102.917 Y114.287 E.22445
G1 X102.917 Y113.754
G1 X108.083 Y108.589 E.22445
G1 X108.083 Y108.056
G1 X102.917 Y113.221 E.22445
G1 X102.917 Y112.688
G1 X108.083 Y107.522 E.22445
G1 X108.083 Y106.989
G1 X102.917 Y112.154 E.22445
G1 X102.917 Y111.621
G1 X108.083 Y106.456 E.22445
G1 X108.083 Y105.923
G1 X102.917 Y111.088 E.22445
G1 X102.917 Y110.554
G1 X108.083 Y105.389 E.22445
G1 X108.083 Y104.856
G1 X102.917 Y110.021 E.22445
G1 X102.917 Y109.488
G1 X108.083 Y104.323 E.22445
G1 X108.083 Y103.789
G1 X102.917 Y108.955 E.22445
G1 X102.917 Y108.421
G1 X108.083 Y103.256 E.22445
G1 X107.682 Y103.123
G1 X102.917 Y107.888 E.20705
G1 X102.917 Y107.355
G1 X107.149 Y103.123 E.18388
G1 X106.616 Y103.123
G1 X102.917 Y106.822 E.16071
G1 X102.917 Y106.288
G1 X106.082 Y103.123 E.13753
G1 X105.549 Y103.123
G1 X102.917 Y105.755 E.11436
G1 X102.917 Y105.222
G1 X105.016 Y103.123 E.09119
G1 X104.483 Y103.123
G1 X102.917 Y104.689 E.06801
G1 X102.917 Y104.155
G1 X103.949 Y103.123 E.04484
G1 X103.416 Y103.123
G1 X102.917 Y103.622 E.02167
M204 S10000
G1 X102.906 Y102.991 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.255134
G1 F15000
G1 X108.094 Y102.991 E.08971
; WIPE_START
G1 F24000
G1 X106.094 Y102.991 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I0 J1.217 P1  F30000
G1 X151.906 Y102.991 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15000
G1 X157.094 Y102.991 E.08971
; CHANGE_LAYER
; Z_HEIGHT: 1.74286
; LAYER_HEIGHT: 0.142857
; WIPE_START
G1 F24000
G1 X155.094 Y102.991 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/64
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
G3 Z2 I.367 J1.16 P1  F30000
G1 X157.889 Y102.106 Z2
G1 Z1.743
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F5709
G1 X158.771 Y102.106 E.0337
G1 X158.771 Y104.983 E.10997
G1 X158.039 Y104.983 E.02799
G1 X158.039 Y107.86 E.10997
G1 X158.771 Y107.86 E.02799
G1 X158.771 Y110.738 E.10997
G1 X158.039 Y110.738 E.02799
G1 X158.039 Y113.615 E.10997
G1 X158.771 Y113.615 E.02799
G1 X158.771 Y116.492 E.10997
G1 X158.039 Y116.492 E.02799
G1 X158.039 Y119.369 E.10997
G1 X158.771 Y119.369 E.02799
G1 X158.771 Y122.246 E.10997
G1 X158.039 Y122.246 E.02799
G1 X158.039 Y125.123 E.10997
G1 X158.771 Y125.123 E.02799
G1 X158.771 Y128 E.10997
G1 X158.039 Y128 E.02799
G1 X158.039 Y130.877 E.10997
G1 X158.771 Y130.877 E.02799
G1 X158.771 Y133.754 E.10997
G1 X157.448 Y133.754 E.05057
; WIPE_START
G1 F24000
G1 X158.771 Y133.754 E-.50281
G1 X158.771 Y133.077 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.143 I.276 J-1.185 P1  F30000
G1 X150.14 Y131.066 Z2.143
G1 Z1.743
G1 E.8 F1800
G1 F5709
G1 X150.14 Y133.727 E.10173
G2 X150.961 Y131.397 I-21.705 J-8.965 E.0945
G1 X150.961 Y130.877 E.01986
G1 X150.14 Y130.877 E.03141
G1 X150.14 Y128 E.10997
G1 X150.961 Y128 E.03141
G1 X150.961 Y125.123 E.10997
G1 X150.14 Y125.123 E.03141
G1 X150.14 Y122.246 E.10997
G1 X150.961 Y122.246 E.03141
G1 X150.961 Y119.369 E.10997
G1 X150.14 Y119.369 E.03141
G1 X150.14 Y116.492 E.10997
G1 X150.961 Y116.492 E.03141
G1 X150.961 Y113.615 E.10997
G1 X150.14 Y113.615 E.03141
G1 X150.14 Y110.738 E.10997
G1 X150.961 Y110.738 E.03141
G1 X150.961 Y107.86 E.10997
G1 X150.14 Y107.86 E.03141
G1 X150.14 Y104.983 E.10997
G1 X150.961 Y104.983 E.03141
G1 X150.961 Y102.256 E.10426
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.143 I-.676 J-1.012 P1  F30000
G1 X109.039 Y131.066 Z2.143
G1 Z1.743
G1 E.8 F1800
G1 F5709
G1 X109.039 Y131.397 E.01266
G2 X109.86 Y133.727 I22.527 J-6.634 E.0945
G1 X109.86 Y130.877 E.10894
G1 X109.039 Y130.877 E.03141
G1 X109.039 Y128 E.10997
G1 X109.86 Y128 E.03141
G1 X109.86 Y125.123 E.10997
G1 X109.039 Y125.123 E.03141
G1 X109.039 Y122.246 E.10997
G1 X109.86 Y122.246 E.03141
G1 X109.86 Y119.369 E.10997
G1 X109.039 Y119.369 E.03141
G1 X109.039 Y116.492 E.10997
G1 X109.86 Y116.492 E.03141
G1 X109.86 Y113.615 E.10997
G1 X109.039 Y113.615 E.03141
G1 X109.039 Y110.738 E.10997
G1 X109.86 Y110.738 E.03141
G1 X109.86 Y107.86 E.10997
G1 X109.039 Y107.86 E.03141
G1 X109.039 Y104.983 E.10997
G1 X109.86 Y104.983 E.03141
G1 X109.86 Y102.106 E.10997
G1 X108.889 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.143 I.144 J-1.208 P1  F30000
G1 X101.229 Y102.106 Z2.143
G1 Z1.743
G1 E.8 F1800
G1 F5709
G1 X102.111 Y102.106 E.0337
G1 X101.961 Y102.256 E.00807
G1 X101.961 Y104.983 E.10426
G1 X101.229 Y104.983 E.02799
G1 X101.229 Y107.86 E.10997
G1 X101.961 Y107.86 E.02799
G1 X101.961 Y110.738 E.10997
G1 X101.229 Y110.738 E.02799
G1 X101.229 Y113.615 E.10997
G1 X101.961 Y113.615 E.02799
G1 X101.961 Y116.492 E.10997
G1 X101.229 Y116.492 E.02799
G1 X101.229 Y119.369 E.10997
G1 X101.961 Y119.369 E.02799
G1 X101.961 Y122.246 E.10997
G1 X101.229 Y122.246 E.02799
G1 X101.229 Y125.123 E.10997
G1 X101.961 Y125.123 E.02799
G1 X101.961 Y128 E.10997
G1 X101.229 Y128 E.02799
G1 X101.229 Y130.877 E.10997
G1 X101.961 Y130.877 E.02799
G1 X101.914 Y131.354 E.01831
G1 X102.22 Y132.586 E.04852
G2 X102.552 Y133.754 I12.193 J-2.835 E.04645
G1 X101.229 Y133.754 E.05057
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0571429
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.367 Y133.103 E-.25719
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/64
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
G3 Z2.143 I.582 J1.069 P1  F30000
G1 X156.898 Y103.377 Z2.143
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5709
G1 X152.102 Y103.377 E.15909
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.317 E.00782
G1 X157.29 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5709
G1 X151.71 Y103.769 E.17146
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.709 E.03134
M204 S10000
; WIPE_START
G1 F24000
G1 X155.29 Y103.73 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.008 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5709
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
M73 P49 R9
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5709
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5709
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.718 E2.42199
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.376 E1.91458
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5709
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.332 E2.30631
G1 X108.346 Y131.689 E.17136
G1 X108.455 Y132.039 E.01127
G2 X151.638 Y131.746 I21.547 J-6.685 E1.77012
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5709
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.289 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/64
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
G3 Z2.2 I1.11 J-.5 P1  F30000
G1 X108.889 Y131.066 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.149 Y131.75 E.02797
G2 X109.86 Y133.727 I21.264 J-6.537 E.08037
G1 X109.86 Y130.877 E.10894
G1 X108.889 Y130.877 E.03715
G1 X108.889 Y128 E.10997
G1 X109.86 Y128 E.03715
G1 X109.86 Y125.123 E.10997
G1 X108.889 Y125.123 E.03715
G1 X108.889 Y122.246 E.10997
G1 X109.86 Y122.246 E.03715
G1 X109.86 Y119.369 E.10997
G1 X108.889 Y119.369 E.03715
G1 X108.889 Y116.492 E.10997
G1 X109.86 Y116.492 E.03715
G1 X109.86 Y113.615 E.10997
G1 X108.889 Y113.615 E.03715
G1 X108.889 Y110.738 E.10997
G1 X109.86 Y110.738 E.03715
G1 X109.86 Y107.86 E.10997
G1 X108.889 Y107.86 E.03715
G1 X108.889 Y104.983 E.10997
G1 X109.86 Y104.983 E.03715
G1 X109.86 Y102.106 E.10997
G1 X108.889 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.215 J-.07 P1  F30000
G1 X108.262 Y130.94 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X108.731 Y130.98 E.01449
G1 X108.731 Y104.509 E.8134
G1 X108.073 Y104.517 E.02023
G1 X108.073 Y130.94 E.8119
G1 X107.196 Y130.94 E.02695
G1 X107.196 Y104.517 E.8119
G1 X106.319 Y104.517 E.02695
G1 X106.319 Y130.94 E.8119
G1 X105.442 Y130.94 E.02695
G1 X105.442 Y104.517 E.8119
G1 X104.565 Y104.517 E.02695
G1 X104.565 Y130.94 E.8119
G1 X103.688 Y130.94 E.02695
G1 X103.688 Y104.517 E.8119
G1 X102.811 Y104.517 E.02695
G1 X102.811 Y130.94 E.8119
G1 X102.269 Y130.94 E.01665
G1 X102.269 Y104.509 E.81216
G1 X102.622 Y104.517 E.01086
; WIPE_START
G1 F24000
G1 X102.269 Y104.509 E-.13436
G1 X102.269 Y106.155 E-.62564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.179 J-.303 P1  F30000
G1 X101.229 Y102.106 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X102.111 Y102.106 E.0337
G1 X101.961 Y102.256 E.00807
G1 X101.961 Y104.202 E.07438
G1 X102.111 Y104.352 E.00811
G1 X102.111 Y104.983 E.02414
G1 X101.229 Y104.983 E.03372
G1 X101.229 Y107.86 E.10997
G1 X102.111 Y107.86 E.03372
G1 X102.111 Y110.738 E.10997
G1 X101.229 Y110.738 E.03372
G1 X101.229 Y113.615 E.10997
G1 X102.111 Y113.615 E.03372
G1 X102.111 Y116.492 E.10997
G1 X101.229 Y116.492 E.03372
G1 X101.229 Y119.369 E.10997
G1 X102.111 Y119.369 E.03372
G1 X102.111 Y122.246 E.10997
G1 X101.229 Y122.246 E.03372
G1 X101.229 Y125.123 E.10997
G1 X102.111 Y125.123 E.03372
G1 X102.111 Y128 E.10997
G1 X101.229 Y128 E.03372
G1 X101.229 Y130.877 E.10997
G1 X102.111 Y130.877 E.03372
G3 X101.914 Y131.354 I-.404 J.112 E.02125
G2 X102.552 Y133.754 I29.485 J-6.556 E.09496
G1 X101.229 Y133.754 E.05057
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.378 Y133.1 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.052 J1.216 P1  F30000
G1 X150.14 Y131.066 Z2.4
G1 Z2
G1 E.8 F1800
G1 F9000
G1 X150.14 Y133.727 E.10173
G3 X151.111 Y131.096 I57.402 J19.707 E.10722
M73 P50 R9
G1 X151.111 Y130.877 E.00837
G1 X150.14 Y130.877 E.03715
G1 X150.14 Y128 E.10997
G1 X151.111 Y128 E.03715
G1 X151.111 Y125.123 E.10997
G1 X150.14 Y125.123 E.03715
G1 X150.14 Y122.246 E.10997
G1 X151.111 Y122.246 E.03715
G1 X151.111 Y119.369 E.10997
G1 X150.14 Y119.369 E.03715
G1 X150.14 Y116.492 E.10997
M73 P50 R8
G1 X151.111 Y116.492 E.03715
G1 X151.111 Y113.615 E.10997
G1 X150.14 Y113.615 E.03715
G1 X150.14 Y110.738 E.10997
G1 X151.111 Y110.738 E.03715
G1 X151.111 Y107.86 E.10997
G1 X150.14 Y107.86 E.03715
G1 X150.14 Y104.983 E.10997
G1 X151.111 Y104.983 E.03715
G1 X151.111 Y104.352 E.02414
G1 X150.961 Y104.202 E.00811
G1 X150.961 Y102.256 E.07438
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.072 J.577 P1  F30000
G1 X151.738 Y104.517 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X151.269 Y104.509 E.01444
G1 X151.269 Y130.98 E.8134
G1 X151.927 Y130.94 E.02027
G1 X151.927 Y104.517 E.8119
G1 X152.804 Y104.517 E.02695
G1 X152.804 Y130.94 E.8119
G1 X153.681 Y130.94 E.02695
G1 X153.681 Y104.517 E.8119
G1 X154.558 Y104.517 E.02695
G1 X154.558 Y130.94 E.8119
G1 X155.435 Y130.94 E.02695
G1 X155.435 Y104.517 E.8119
G1 X156.312 Y104.517 E.02695
G1 X156.312 Y130.94 E.8119
G1 X157.189 Y130.94 E.02695
G1 X157.189 Y104.517 E.8119
G1 X157.731 Y104.509 E.01666
G1 X157.731 Y130.94 E.81216
G1 X157.378 Y130.94 E.01086
; WIPE_START
G1 F24000
G1 X157.731 Y130.94 E-.13432
G1 X157.731 Y129.294 E-.62568
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.215 J-.077 P1  F30000
G1 X157.448 Y133.754 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X158.771 Y133.754 E.05057
G1 X158.771 Y130.877 E.10997
G1 X157.889 Y130.877 E.03372
G1 X157.889 Y128 E.10997
G1 X158.771 Y128 E.03372
G1 X158.771 Y125.123 E.10997
G1 X157.889 Y125.123 E.03372
G1 X157.889 Y122.246 E.10997
G1 X158.771 Y122.246 E.03372
G1 X158.771 Y119.369 E.10997
G1 X157.889 Y119.369 E.03372
G1 X157.889 Y116.492 E.10997
G1 X158.771 Y116.492 E.03372
G1 X158.771 Y113.615 E.10997
G1 X157.889 Y113.615 E.03372
G1 X157.889 Y110.738 E.10997
G1 X158.771 Y110.738 E.03372
G1 X158.771 Y107.86 E.10997
G1 X157.889 Y107.86 E.03372
G1 X157.889 Y104.983 E.10997
G1 X158.771 Y104.983 E.03372
G1 X158.771 Y102.106 E.10997
G1 X157.889 Y102.106 E.0337
; WIPE_START
G1 F24000
G1 X158.771 Y102.106 E-.33503
G1 X158.771 Y103.225 E-.42497
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.098 J-1.213 P1  F30000
G1 X156.898 Y103.377 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y103.377 E.15909
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.317 E.00782
G1 X157.29 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y103.769 E.17146
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.709 E.03134
M204 S10000
; WIPE_START
G1 F24000
G1 X155.29 Y103.73 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.008 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.719 E2.42195
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.383 E1.91434
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.333 E2.30628
G1 X108.346 Y131.689 E.17136
G1 X108.434 Y131.973 E.00913
G2 X151.638 Y131.746 I21.568 J-6.615 E1.7724
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.074 Y151.63 E.90097
G2 X138.013 Y151.365 I-2.775 J-11.628 E.03236
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.289 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/64
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
G3 Z2.4 I.913 J.805 P1  F30000
G1 X156.898 Y103.377 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4047
G1 X152.102 Y103.377 E.15909
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.317 E.00782
G1 X157.29 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4047
G1 X151.71 Y103.769 E.17146
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.709 E.03134
M204 S10000
; WIPE_START
G1 F24000
G1 X155.29 Y103.73 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.008 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4047
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4047
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
M73 P51 R8
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4047
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.72 E2.42191
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.383 E1.91433
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4047
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.333 E2.30625
G1 X108.346 Y131.689 E.17136
G1 X108.413 Y131.906 E.007
G2 X151.638 Y131.746 I21.588 J-6.548 E1.77455
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4047
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-4.316 J-16.543 E.0329
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.289 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 2.25
; LAYER_HEIGHT: 0.05
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/64
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
G3 Z2.6 I1.115 J-.488 P1  F30000
G1 X109.108 Y131.066 Z2.6
G1 Z2.25
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.25
G1 F9000
G2 X109.517 Y132.846 I4.471 J-.089 E.06865
G2 X109.86 Y133.727 I9.021 J-3.007 E.0353
G1 X109.86 Y130.877 E.10636
G1 X109.108 Y130.877 E.02806
G1 X109.108 Y128 E.10736
G1 X109.86 Y128 E.02806
G1 X109.86 Y125.123 E.10736
G1 X109.108 Y125.123 E.02806
G1 X109.108 Y122.246 E.10736
G1 X109.86 Y122.246 E.02806
G1 X109.86 Y119.369 E.10736
G1 X109.108 Y119.369 E.02806
G1 X109.108 Y116.492 E.10736
G1 X109.86 Y116.492 E.02806
G1 X109.86 Y113.615 E.10736
G1 X109.108 Y113.615 E.02806
G1 X109.109 Y110.738 E.10736
G1 X109.86 Y110.738 E.02806
G1 X109.86 Y107.86 E.10736
G1 X109.109 Y107.86 E.02806
G1 X109.109 Y104.983 E.10736
G1 X109.86 Y104.983 E.02806
G1 X109.86 Y102.106 E.10736
G1 X108.889 Y102.106 E.03625
; WIPE_START
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.65 I-1.215 J-.07 P1  F30000
G1 X108.262 Y130.94 Z2.65
G1 Z2.25
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X108.731 Y130.98 E.0176
G1 X108.731 Y104.509 E.98782
G1 X108.073 Y104.517 E.02457
G1 X108.073 Y130.94 E.986
G1 X107.196 Y130.94 E.03273
G1 X107.196 Y104.517 E.986
G1 X106.319 Y104.517 E.03273
G1 X106.319 Y130.94 E.986
G1 X105.442 Y130.94 E.03273
G1 X105.442 Y104.517 E.986
G1 X104.565 Y104.517 E.03273
G1 X104.565 Y130.94 E.986
G1 X103.688 Y130.94 E.03273
G1 X103.688 Y104.517 E.986
G1 X102.811 Y104.517 E.03273
G1 X102.811 Y130.94 E.986
G1 X102.269 Y130.94 E.02023
G1 X102.269 Y104.509 E.98631
G1 X102.622 Y104.517 E.01319
; WIPE_START
G1 F24000
G1 X102.269 Y104.509 E-.13437
G1 X102.269 Y106.155 E-.62563
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.65 I1.179 J-.303 P1  F30000
G1 X101.229 Y102.106 Z2.65
G1 Z2.25
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X102.111 Y102.106 E.0329
G1 X101.961 Y102.256 E.00788
G1 X101.891 Y104.983 E.10182
G1 X101.229 Y104.983 E.02471
G1 X101.229 Y107.86 E.10736
G1 X101.891 Y107.86 E.02471
G1 X101.891 Y110.738 E.10736
G1 X101.229 Y110.738 E.02471
G1 X101.229 Y113.615 E.10736
G1 X101.891 Y113.615 E.02471
G1 X101.891 Y116.492 E.10736
G1 X101.229 Y116.492 E.02471
G1 X101.229 Y119.369 E.10736
G1 X101.891 Y119.369 E.02471
G1 X101.891 Y122.246 E.10736
G1 X101.229 Y122.246 E.02471
G1 X101.229 Y125.123 E.10736
G1 X101.891 Y125.123 E.02471
G1 X101.891 Y128 E.10736
G1 X101.229 Y128 E.02471
G1 X101.229 Y130.877 E.10736
G1 X101.891 Y130.877 E.02471
G1 X101.891 Y131.731 E.03185
G1 X102.046 Y131.885 E.00816
G2 X102.552 Y133.754 I19.382 J-4.247 E.07228
G1 X101.229 Y133.754 E.04938
; WIPE_START
M73 P52 R8
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.375 Y133.101 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.65 I.052 J1.216 P1  F30000
G1 X150.14 Y131.066 Z2.65
G1 Z2.25
G1 E.8 F1800
G1 F9000
G1 X150.14 Y133.727 E.09932
G2 X150.891 Y131.621 I-20.851 J-8.631 E.08348
G1 X150.891 Y130.877 E.02777
G1 X150.14 Y130.877 E.02806
G1 X150.14 Y128 E.10736
G1 X150.891 Y128 E.02806
G1 X150.891 Y125.123 E.10736
G1 X150.14 Y125.123 E.02806
G1 X150.14 Y122.246 E.10736
G1 X150.891 Y122.246 E.02806
G1 X150.891 Y119.369 E.10736
G1 X150.14 Y119.369 E.02806
G1 X150.14 Y116.492 E.10736
G1 X150.891 Y116.492 E.02806
G1 X150.891 Y113.615 E.10736
G1 X150.14 Y113.615 E.02806
G1 X150.14 Y110.738 E.10736
G1 X150.891 Y110.738 E.02806
G1 X150.891 Y107.86 E.10736
G1 X150.14 Y107.86 E.02806
G1 X150.14 Y104.983 E.10736
G1 X150.891 Y104.983 E.02806
G1 X150.961 Y102.256 E.10182
G1 X151.111 Y102.106 E.00788
G1 X150.14 Y102.106 E.03624
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.94 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.65 I-1.065 J.588 P1  F30000
G1 X151.738 Y104.517 Z2.65
G1 Z2.25
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X151.269 Y104.509 E.01754
G1 X151.269 Y130.98 E.98782
G1 X151.927 Y130.94 E.02462
G1 X151.927 Y104.517 E.986
G1 X152.804 Y104.517 E.03273
G1 X152.804 Y130.94 E.986
G1 X153.681 Y130.94 E.03273
G1 X153.681 Y104.517 E.986
G1 X154.558 Y104.517 E.03273
G1 X154.558 Y130.94 E.986
G1 X155.435 Y130.94 E.03273
G1 X155.435 Y104.517 E.986
G1 X156.312 Y104.517 E.03273
G1 X156.312 Y130.94 E.986
G1 X157.189 Y130.94 E.03273
G1 X157.189 Y104.517 E.986
G1 X157.731 Y104.509 E.02023
G1 X157.731 Y130.94 E.98631
G1 X157.378 Y130.94 E.01319
; WIPE_START
G1 F24000
G1 X157.731 Y130.94 E-.13433
G1 X157.731 Y129.294 E-.62567
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.65 I-1.215 J-.077 P1  F30000
G1 X157.448 Y133.754 Z2.65
G1 Z2.25
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X158.771 Y133.754 E.04938
G1 X158.771 Y130.877 E.10736
G1 X158.109 Y130.877 E.02471
G1 X158.109 Y128 E.10736
G1 X158.771 Y128 E.02471
G1 X158.771 Y125.123 E.10736
G1 X158.109 Y125.123 E.02471
G1 X158.109 Y122.246 E.10736
G1 X158.771 Y122.246 E.02471
G1 X158.771 Y119.369 E.10736
G1 X158.109 Y119.369 E.02471
G1 X158.109 Y116.492 E.10736
G1 X158.771 Y116.492 E.02471
G1 X158.771 Y113.615 E.10736
G1 X158.109 Y113.615 E.02471
G1 X158.109 Y110.738 E.10736
G1 X158.771 Y110.738 E.02471
G1 X158.771 Y107.86 E.10736
G1 X158.109 Y107.86 E.02471
G1 X158.109 Y104.983 E.10736
G1 X158.771 Y104.983 E.02471
G1 X158.771 Y102.106 E.10736
G1 X157.889 Y102.106 E.0329
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.15
; WIPE_START
G1 F24000
G1 X158.771 Y102.106 E-.33503
G1 X158.771 Y103.225 E-.42497
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/64
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
G3 Z2.65 I-.098 J-1.213 P1  F30000
G1 X156.898 Y103.377 Z2.65
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y103.377 E.15909
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.317 E.00782
G1 X157.29 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y103.769 E.17146
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.709 E.03134
M204 S10000
; WIPE_START
G1 F24000
G1 X155.29 Y103.73 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.008 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.721 E2.42188
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.383 E1.91434
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.334 E2.30623
G1 X108.346 Y131.689 E.17136
G1 X108.393 Y131.84 E.00486
G2 X151.638 Y131.746 I21.609 J-6.484 E1.77665
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-4.518 J-17.233 E.0329
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.289 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 2.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/64
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
G3 Z2.8 I1.11 J-.498 P1  F30000
G1 X108.971 Y131.179 Z2.8
G1 Z2.5
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.25
M73 P53 R8
G1 F6443
G1 X109.107 Y131.617 E.01713
G2 X109.86 Y133.727 I21.618 J-6.526 E.08365
G1 X109.86 Y130.877 E.10636
G1 X101.229 Y130.877 E.32208
G1 X101.229 Y128 E.10736
G1 X109.86 Y128 E.32208
G1 X109.86 Y125.123 E.10736
G1 X101.229 Y125.123 E.32208
G1 X101.229 Y122.246 E.10736
G1 X109.86 Y122.246 E.32208
G1 X109.86 Y119.369 E.10736
G1 X101.229 Y119.369 E.32208
G1 X101.229 Y116.492 E.10736
G1 X109.86 Y116.492 E.32208
G1 X109.86 Y113.615 E.10736
G1 X101.229 Y113.615 E.32208
G1 X101.229 Y110.738 E.10736
G1 X109.86 Y110.738 E.32208
G1 X109.86 Y107.86 E.10736
G1 X101.229 Y107.86 E.32208
G1 X101.229 Y104.983 E.10736
G1 X109.86 Y104.983 E.32208
G1 X109.86 Y102.106 E.10736
G1 X108.889 Y102.106 E.03625
G1 X109.039 Y102.256 E.00788
G1 X109.039 Y104.202 E.07262
G1 X108.723 Y104.517 E.01665
G1 X102.277 Y104.517 E.24054
G1 X101.961 Y104.202 E.01665
G1 X101.961 Y102.256 E.07262
G1 X102.111 Y102.106 E.00788
G1 X101.229 Y102.106 E.0329
G1 X101.229 Y131.066 F30000
G1 F6443
G1 X101.229 Y133.754 E.10033
G1 X102.552 Y133.754 E.04938
G3 X101.914 Y131.354 I24.226 J-7.728 E.09272
G1 X102.051 Y131.179 E.0083
; WIPE_START
G1 F24000
G1 X101.914 Y131.354 E-.08447
G1 X102.371 Y133.072 E-.67553
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.9 I-.015 J1.217 P1  F30000
G1 X157.448 Y133.754 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F6443
G1 X158.771 Y133.754 E.04938
G1 X158.771 Y130.877 E.10736
G1 X150.14 Y130.877 E.32208
G1 X150.14 Y128 E.10736
G1 X158.771 Y128 E.32208
G1 X158.771 Y125.123 E.10736
G1 X150.14 Y125.123 E.32208
G1 X150.14 Y122.246 E.10736
G1 X158.771 Y122.246 E.32208
G1 X158.771 Y119.369 E.10736
G1 X150.14 Y119.369 E.32208
G1 X150.14 Y116.492 E.10736
G1 X158.771 Y116.492 E.32208
G1 X158.771 Y113.615 E.10736
G1 X150.14 Y113.615 E.32208
G1 X150.14 Y110.738 E.10736
G1 X158.771 Y110.738 E.32208
G1 X158.771 Y107.86 E.10736
G1 X150.14 Y107.86 E.32208
G1 X150.14 Y104.983 E.10736
G1 X158.771 Y104.983 E.32208
G1 X158.771 Y102.106 E.10736
G1 X157.889 Y102.106 E.0329
G1 X158.039 Y102.256 E.00788
G1 X158.039 Y104.202 E.07262
G1 X157.723 Y104.517 E.01665
G1 X151.277 Y104.517 E.24054
G1 X150.961 Y104.202 E.01665
G1 X150.961 Y102.256 E.07262
G1 X151.111 Y102.106 E.00788
G1 X150.14 Y102.106 E.03624
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/64
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
G3 Z2.9 I-.062 J1.215 P1  F30000
G1 X156.898 Y103.377 Z2.9
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6443
G1 X152.102 Y103.377 E.15909
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.317 E.00782
G1 X157.29 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6443
G1 X151.71 Y103.769 E.17146
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.709 E.03134
M204 S10000
; WIPE_START
G1 F24000
G1 X155.29 Y103.73 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.008 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6443
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6443
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6443
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.724 E2.42171
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.378 E1.91451
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6443
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.336 E2.30613
G1 X108.346 Y131.689 E.17136
G1 X108.372 Y131.773 E.00273
G2 X151.638 Y131.746 I21.629 J-6.421 E1.77868
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6443
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-2.35 J-9.813 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.289 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S247.35
; CHANGE_LAYER
; Z_HEIGHT: 2.75
; LAYER_HEIGHT: 0.15
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/64
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
G3 Z3 I1.103 J-.514 P1  F30000
G1 X109.827 Y133.649 Z3
G1 Z2.75
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.25
G1 F4800
G1 X109.827 Y102.106 E1.17705
G1 X108.95 Y102.106 E.03273
G2 X109.039 Y102.256 I.119 J.03 E.0072
G1 X109.039 Y104.202 E.07262
G1 X108.95 Y104.29 E.00467
G1 X108.95 Y131.141 E1.00198
G1 X108.677 Y130.94 E.01266
G1 X108.073 Y130.94 E.02253
G1 X108.073 Y104.517 E.986
G1 X107.196 Y104.517 E.03273
G1 X107.196 Y130.94 E.986
M73 P54 R8
G1 X106.319 Y130.94 E.03273
G1 X106.319 Y104.517 E.986
G1 X105.442 Y104.517 E.03273
G1 X105.442 Y130.94 E.986
G1 X104.565 Y130.94 E.03273
G1 X104.565 Y104.517 E.986
G1 X103.688 Y104.517 E.03273
G1 X103.688 Y130.94 E.986
G1 X102.811 Y130.94 E.03273
G1 X102.811 Y104.517 E.986
G1 X102.235 Y104.475 E.02153
; WIPE_START
G1 F24000
G1 X102.811 Y104.517 E-.21923
G1 X102.811 Y105.94 E-.54077
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.15 I-1.217 J-.009 P1  F30000
G1 X102.622 Y130.94 Z3.15
G1 Z2.75
G1 E.8 F1800
G1 F4800
G1 X102.237 Y130.94 E.01435
G1 X101.933 Y131.329 E.01842
G1 X101.933 Y102.106 E1.09048
G1 X101.229 Y102.106 E.02628
G1 X101.229 Y133.754 E1.18098
G1 X101.933 Y133.754 E.02628
G1 X101.933 Y131.432 E.08665
; WIPE_START
G1 F24000
G1 X101.933 Y133.432 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.15 I1.136 J.436 P1  F30000
G1 X102.235 Y132.646 Z3.15
G1 Z2.75
G1 E.8 F1800
G1 F4800
G2 X102.552 Y133.754 I11.587 J-2.717 E.04304
G1 X102.122 Y133.754 E.01606
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.20657
G1 X102.235 Y132.646 E-.55343
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.15 I-.025 J1.217 P1  F30000
G1 X150.173 Y133.649 Z3.15
G1 Z2.75
G1 E.8 F1800
G1 F4800
G1 X150.173 Y102.106 E1.17705
G1 X151.05 Y102.106 E.03273
G3 X150.961 Y102.256 I-.119 J.03 E.0072
G1 X150.961 Y104.202 E.07262
G1 X151.05 Y104.29 E.00467
G1 X151.039 Y131.15 E1.00229
G3 X150.474 Y132.869 I-17.549 J-4.805 E.06755
; WIPE_START
G1 F24000
G1 X151.039 Y131.15 E-.68762
G1 X151.039 Y130.959 E-.07238
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.15 I-.46 J1.127 P1  F30000
G1 X157.878 Y133.754 Z3.15
G1 Z2.75
G1 E.8 F1800
G1 F4800
G1 X157.448 Y133.754 E.01606
G2 X157.765 Y132.646 I-11.271 J-3.825 E.04304
; WIPE_START
G1 F24000
G1 X157.448 Y133.754 E-.55343
G1 X157.878 Y133.754 E-.20657
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.15 I1.213 J.098 P1  F30000
G1 X158.067 Y131.432 Z3.15
G1 Z2.75
G1 E.8 F1800
G1 F4800
G1 X158.067 Y133.754 E.08665
G1 X158.771 Y133.754 E.02628
G1 X158.771 Y102.106 E1.18098
G1 X158.067 Y102.106 E.02628
G1 X158.067 Y131.329 E1.09048
G1 X157.763 Y130.94 E.01842
G1 X157.189 Y130.94 E.02139
G1 X157.189 Y104.517 E.986
G1 X156.312 Y104.517 E.03273
G1 X156.312 Y130.94 E.986
G1 X155.435 Y130.94 E.03273
G1 X155.435 Y104.517 E.986
G1 X154.558 Y104.517 E.03273
G1 X154.558 Y130.94 E.986
G1 X153.681 Y130.94 E.03273
G1 X153.681 Y104.517 E.986
G1 X152.804 Y104.517 E.03273
G1 X152.804 Y130.94 E.986
G1 X151.927 Y130.94 E.03273
G1 X151.927 Y104.517 E.986
G1 X151.277 Y104.517 E.02426
G1 X151.183 Y104.424 E.00495
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.05
; WIPE_START
G1 F24000
G1 X151.277 Y104.517 E-.05036
G1 X151.927 Y104.517 E-.24702
G1 X151.927 Y105.735 E-.46262
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/64
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
G3 Z3.15 I.522 J1.1 P1  F30000
G1 X156.898 Y103.377 Z3.15
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y103.377 E.15909
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.317 E.00782
G1 X157.29 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y103.769 E.17146
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.709 E.03134
M204 S10000
; WIPE_START
G1 F24000
G1 X155.29 Y103.73 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.008 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P55 R8
G1 F15476.087
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.724 E2.42171
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.383 E1.91434
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.336 E2.30613
G1 X108.346 Y131.689 E.17136
G1 X108.351 Y131.707 E.00059
G2 X151.638 Y131.746 I21.649 J-6.354 E1.78089
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.229 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-2.35 J-9.813 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.289 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/64
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
G3 Z3.2 I1.103 J-.514 P1  F30000
G1 X109.827 Y133.649 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.25
G1 F4800
G1 X109.827 Y102.106 E1.17705
G1 X108.95 Y102.106 E.03273
G2 X109.039 Y102.256 I.119 J.03 E.0072
G1 X109.039 Y104.202 E.07262
G1 X108.95 Y104.29 E.00467
G1 X108.95 Y131.141 E1.00198
G1 X108.677 Y130.94 E.01266
G1 X108.073 Y130.94 E.02253
G1 X108.073 Y104.517 E.986
G1 X107.196 Y104.517 E.03273
G1 X107.196 Y130.94 E.986
G1 X106.319 Y130.94 E.03273
G1 X106.319 Y104.517 E.986
G1 X105.442 Y104.517 E.03273
G1 X105.442 Y130.94 E.986
G1 X104.565 Y130.94 E.03273
G1 X104.565 Y104.517 E.986
G1 X103.688 Y104.517 E.03273
G1 X103.688 Y130.94 E.986
G1 X102.811 Y130.94 E.03273
G1 X102.811 Y104.517 E.986
G1 X102.235 Y104.475 E.02153
; WIPE_START
G1 F24000
G1 X102.811 Y104.517 E-.21923
G1 X102.811 Y105.94 E-.54077
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J-.009 P1  F30000
G1 X102.622 Y130.94 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4800
G1 X102.237 Y130.94 E.01435
G1 X101.933 Y131.329 E.01842
G1 X101.933 Y102.106 E1.09048
G1 X101.229 Y102.106 E.02628
G1 X101.229 Y133.754 E1.18098
G1 X101.933 Y133.754 E.02628
G1 X101.933 Y131.432 E.08665
; WIPE_START
G1 F24000
G1 X101.933 Y133.432 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.136 J.436 P1  F30000
G1 X102.235 Y132.646 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4800
G2 X102.552 Y133.754 I11.587 J-2.717 E.04304
G1 X102.122 Y133.754 E.01606
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.20657
G1 X102.235 Y132.646 E-.55343
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.025 J1.217 P1  F30000
G1 X150.173 Y133.649 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4800
G1 X150.173 Y102.106 E1.17705
G1 X151.05 Y102.106 E.03273
G3 X150.961 Y102.256 I-.119 J.03 E.0072
G1 X150.961 Y104.202 E.07262
G1 X151.05 Y104.29 E.00467
G1 X151.039 Y131.15 E1.00229
M73 P55 R7
G3 X150.474 Y132.869 I-17.549 J-4.805 E.06755
; WIPE_START
G1 F24000
G1 X151.039 Y131.15 E-.68762
G1 X151.039 Y130.959 E-.07238
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.46 J1.127 P1  F30000
G1 X157.878 Y133.754 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4800
G1 X157.448 Y133.754 E.01606
G2 X157.765 Y132.646 I-11.271 J-3.825 E.04304
; WIPE_START
G1 F24000
G1 X157.448 Y133.754 E-.55343
G1 X157.878 Y133.754 E-.20657
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.213 J.098 P1  F30000
G1 X158.067 Y131.432 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4800
G1 X158.067 Y133.754 E.08665
G1 X158.771 Y133.754 E.02628
G1 X158.771 Y102.106 E1.18098
G1 X158.067 Y102.106 E.02628
G1 X158.067 Y131.329 E1.09048
G1 X157.763 Y130.94 E.01842
G1 X157.189 Y130.94 E.02139
G1 X157.189 Y104.517 E.986
G1 X156.312 Y104.517 E.03273
G1 X156.312 Y130.94 E.986
G1 X155.435 Y130.94 E.03273
G1 X155.435 Y104.517 E.986
G1 X154.558 Y104.517 E.03273
G1 X154.558 Y130.94 E.986
G1 X153.681 Y130.94 E.03273
G1 X153.681 Y104.517 E.986
G1 X152.804 Y104.517 E.03273
G1 X152.804 Y130.94 E.986
G1 X151.927 Y130.94 E.03273
G1 X151.927 Y104.517 E.986
G1 X151.277 Y104.517 E.02426
G1 X151.183 Y104.424 E.00495
; WIPE_START
G1 F24000
G1 X151.277 Y104.517 E-.05036
G1 X151.927 Y104.517 E-.24702
G1 X151.927 Y105.735 E-.46262
; WIPE_END
M73 P56 R7
G1 E-.04 F1800
G17
G3 Z3.4 I.522 J1.1 P1  F30000
G1 X156.898 Y103.377 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y103.377 E.15909
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.317 E.00782
G1 X157.29 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y103.769 E.17146
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.709 E.03134
M204 S10000
; WIPE_START
G1 F24000
G1 X155.29 Y103.73 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.008 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.713 E2.42219
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.376 E1.91458
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.325 E2.30658
G1 X108.346 Y131.689 E.17136
G1 X108.632 Y132.608 E.02958
G2 X151.638 Y131.746 I21.366 J-7.257 E1.75196
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.289 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/64
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
G3 Z3.4 I.913 J.805 P1  F30000
G1 X156.898 Y103.377 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4047
G1 X152.102 Y103.377 E.15909
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.317 E.00782
G1 X157.29 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4047
G1 X151.71 Y103.769 E.17146
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.709 E.03134
M204 S10000
; WIPE_START
G1 F24000
G1 X155.29 Y103.73 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.008 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4047
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4047
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4047
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.719 E2.42194
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.383 E1.91434
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4047
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.325 E2.30658
G1 X108.346 Y131.689 E.17136
G1 X108.632 Y132.608 E.02958
G2 X151.638 Y131.746 I21.366 J-7.259 E1.7519
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4047
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-7.617 J-40.463 E.07726
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.27 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S229.5
; CHANGE_LAYER
; Z_HEIGHT: 3.25714
; LAYER_HEIGHT: 0.0571427
; WIPE_START
M73 P57 R7
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/64
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
G3 Z3.6 I1.113 J-.492 P1  F30000
G1 X109.039 Y131.066 Z3.6
G1 Z3.257
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G2 X109.715 Y133.386 I7.867 J-1.036 E.09274
G1 X109.86 Y133.727 E.01419
G1 X109.86 Y130.877 E.10894
G1 X109.039 Y130.877 E.03141
G1 X109.039 Y128 E.10997
G1 X109.86 Y128 E.03141
G1 X109.86 Y125.123 E.10997
G1 X109.039 Y125.123 E.03141
G1 X109.039 Y122.246 E.10997
G1 X109.86 Y122.246 E.03141
G1 X109.86 Y119.369 E.10997
G1 X109.039 Y119.369 E.03141
G1 X109.039 Y116.492 E.10997
G1 X109.86 Y116.492 E.03141
G1 X109.86 Y113.615 E.10997
G1 X109.039 Y113.615 E.03141
G1 X109.039 Y110.738 E.10997
G1 X109.86 Y110.738 E.03141
G1 X109.86 Y107.86 E.10997
G1 X109.039 Y107.86 E.03141
G1 X109.039 Y104.983 E.10997
G1 X109.86 Y104.983 E.03141
G1 X109.86 Y102.106 E.10997
G1 X108.889 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.657 I.144 J-1.208 P1  F30000
G1 X101.229 Y102.106 Z3.657
G1 Z3.257
G1 E.8 F1800
G1 F9000
G1 X102.111 Y102.106 E.0337
G1 X101.961 Y102.256 E.00807
G1 X101.961 Y104.983 E.10426
G1 X101.229 Y104.983 E.02799
G1 X101.229 Y107.86 E.10997
G1 X101.961 Y107.86 E.02799
G1 X101.961 Y110.738 E.10997
G1 X101.229 Y110.738 E.02799
G1 X101.229 Y113.615 E.10997
G1 X101.961 Y113.615 E.02799
G1 X101.961 Y116.492 E.10997
G1 X101.229 Y116.492 E.02799
G1 X101.229 Y119.369 E.10997
G1 X101.961 Y119.369 E.02799
G1 X101.961 Y122.246 E.10997
G1 X101.229 Y122.246 E.02799
G1 X101.229 Y125.123 E.10997
G1 X101.961 Y125.123 E.02799
G1 X101.961 Y128 E.10997
G1 X101.229 Y128 E.02799
G1 X101.229 Y130.877 E.10997
G1 X101.961 Y130.877 E.02799
G1 X101.914 Y131.354 E.01831
G1 X101.972 Y131.588 E.00922
G2 X102.552 Y133.754 I22.449 J-4.852 E.08575
G1 X101.229 Y133.754 E.05057
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.377 Y133.1 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.657 I.052 J1.216 P1  F30000
G1 X150.14 Y131.066 Z3.657
G1 Z3.257
G1 E.8 F1800
G1 F9000
G1 X150.14 Y133.727 E.10173
G2 X150.961 Y131.397 I-52.805 J-19.933 E.09446
G1 X150.961 Y130.877 E.01986
G1 X150.14 Y130.877 E.03141
G1 X150.14 Y128 E.10997
G1 X150.961 Y128 E.03141
G1 X150.961 Y125.123 E.10997
G1 X150.14 Y125.123 E.03141
G1 X150.14 Y122.246 E.10997
G1 X150.961 Y122.246 E.03141
G1 X150.961 Y119.369 E.10997
G1 X150.14 Y119.369 E.03141
G1 X150.14 Y116.492 E.10997
G1 X150.961 Y116.492 E.03141
G1 X150.961 Y113.615 E.10997
G1 X150.14 Y113.615 E.03141
G1 X150.14 Y110.738 E.10997
G1 X150.961 Y110.738 E.03141
G1 X150.961 Y107.86 E.10997
G1 X150.14 Y107.86 E.03141
G1 X150.14 Y104.983 E.10997
G1 X150.961 Y104.983 E.03141
G1 X150.961 Y102.256 E.10426
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.657 I.168 J1.205 P1  F30000
G1 X157.889 Y102.106 Z3.657
G1 Z3.257
G1 E.8 F1800
G1 F9000
G1 X158.771 Y102.106 E.0337
G1 X158.771 Y104.983 E.10997
G1 X158.039 Y104.983 E.02799
G1 X158.039 Y107.86 E.10997
G1 X158.771 Y107.86 E.02799
G1 X158.771 Y110.738 E.10997
G1 X158.039 Y110.738 E.02799
G1 X158.039 Y113.615 E.10997
G1 X158.771 Y113.615 E.02799
G1 X158.771 Y116.492 E.10997
G1 X158.039 Y116.492 E.02799
G1 X158.039 Y119.369 E.10997
G1 X158.771 Y119.369 E.02799
G1 X158.771 Y122.246 E.10997
G1 X158.039 Y122.246 E.02799
G1 X158.039 Y125.123 E.10997
G1 X158.771 Y125.123 E.02799
G1 X158.771 Y128 E.10997
G1 X158.039 Y128 E.02799
G1 X158.039 Y130.877 E.10997
G1 X158.771 Y130.877 E.02799
G1 X158.771 Y133.754 E.10997
G1 X157.448 Y133.754 E.05057
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.142857
; WIPE_START
G1 F24000
G1 X158.771 Y133.754 E-.50281
G1 X158.771 Y133.077 E-.25719
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/64
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
G3 Z3.657 I.223 J-1.196 P1  F30000
G1 X152.024 Y131.821 Z3.657
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y131.57 E.0087
G1 X152.102 Y131.279 E.00968
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X152.102 Y104.179 E.89896
M106 S229.5
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X152.102 Y103.081 E.03642
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y104.179 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X156.898 Y131.279 E.89896
M106 S229.5
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X156.898 Y131.405 E.00419
G1 X156.834 Y131.661 E.00876
G3 X103.102 Y131.405 I-26.837 J-6.311 E2.45927
G1 X103.102 Y131.279 E.00419
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X103.102 Y104.179 E.89896
M106 S229.5
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X103.102 Y103.081 E.03642
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y104.179 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X107.898 Y131.279 E.89896
M106 S229.5
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X107.898 Y131.491 E.00705
G2 X107.926 Y131.661 I.298 J.038 E.0058
G2 X151.741 Y132.734 I22.075 J-6.313 E1.93113
G1 X152.006 Y131.878 E.02974
G1 X151.644 Y131.702 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y131.484 E.00702
G1 X151.71 Y131.279 E.0063
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X151.71 Y104.179 E.89896
M106 S229.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y102.689 E.04578
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y104.179 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X157.29 Y131.279 E.89896
M106 S229.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.29 Y131.402 E.00378
G3 X157.242 Y131.648 I-1.096 J-.088 E.00772
G3 X102.71 Y131.402 I-27.238 J-6.291 E2.31637
G1 X102.71 Y131.279 E.00378
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X102.71 Y104.179 E.89896
M106 S229.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y102.689 E.04578
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y104.179 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X108.29 Y131.279 E.89896
M106 S229.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y131.484 E.0063
G2 X151.362 Y132.606 I21.71 J-6.118 E1.76049
M73 P58 R7
G1 X151.626 Y131.759 E.02724
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.484 E-.10957
G1 X151.71 Y131.279 E-.0779
G1 X151.71 Y129.772 E-.57253
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.529 J1.096 P1  F30000
G1 X156.554 Y132.109 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.440447
M106 S255
G1 F3000
G1 X156.554 Y103.414 E.92951
G1 X156.157 Y103.414 E.01288
G1 X156.157 Y132.25 E.9341
G1 X155.759 Y132.25 E.01288
G1 X155.759 Y103.414 E.9341
G1 X155.362 Y103.414 E.01288
G1 X155.362 Y132.25 E.9341
G1 X154.964 Y132.25 E.01288
G1 X154.964 Y103.414 E.9341
G1 X154.567 Y103.414 E.01288
G1 X154.567 Y132.25 E.9341
G1 X154.169 Y132.25 E.01288
G1 X154.169 Y103.414 E.9341
G1 X153.772 Y103.414 E.01288
G1 X153.772 Y132.25 E.9341
G1 X153.374 Y132.25 E.01288
G1 X153.374 Y103.414 E.9341
G1 X152.977 Y103.414 E.01288
G1 X152.977 Y132.25 E.9341
G1 X152.579 Y132.25 E.01288
G1 X152.579 Y103.244 E.9396
M106 S229.5
; WIPE_START
G1 F24000
G1 X152.579 Y105.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.184 J-.283 P1  F30000
G1 X141.941 Y149.813 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.229 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.228 Y132.642 I-33.612 J-15.277 E.16056
G1 X156.062 Y132.642 E.00551
G1 X137.061 Y151.643 E.89135
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.938 Y132.642 E.89135
G1 X103.772 Y132.642 E.00551
G2 X105.481 Y137.167 I35.321 J-10.752 E.16056
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
G1 X107.421 Y132.42 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.440448
M106 S255
G1 F3000
G1 X107.421 Y103.414 E.9396
G1 X107.023 Y103.414 E.01288
G1 X107.023 Y132.25 E.9341
G1 X106.626 Y132.25 E.01288
G1 X106.626 Y103.414 E.9341
M73 P59 R7
G1 X106.228 Y103.414 E.01288
G1 X106.228 Y132.25 E.9341
G1 X105.831 Y132.25 E.01288
G1 X105.831 Y103.414 E.9341
G1 X105.433 Y103.414 E.01288
G1 X105.433 Y132.25 E.9341
G1 X105.036 Y132.25 E.01288
G1 X105.036 Y103.414 E.9341
G1 X104.638 Y103.414 E.01288
G1 X104.638 Y132.25 E.9341
G1 X104.241 Y132.25 E.01288
G1 X104.241 Y103.414 E.9341
G1 X103.843 Y103.414 E.01288
G1 X103.843 Y132.25 E.9341
G1 X103.656 Y132.25 E.00608
G1 X103.446 Y131.406 E.02819
G1 X103.446 Y103.244 E.91224
M106 S229.5
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3.51429
; LAYER_HEIGHT: 0.114286
; WIPE_START
G1 F24000
G1 X103.446 Y105.244 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/64
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
G3 Z3.8 I.994 J-.702 P1  F30000
G1 X101.229 Y102.106 Z3.8
G1 Z3.514
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X102.111 Y102.106 E.0337
G1 X101.961 Y102.256 E.00807
G1 X101.961 Y104.983 E.10426
G1 X101.229 Y104.983 E.02799
G1 X101.229 Y107.86 E.10997
G1 X101.961 Y107.86 E.02799
G1 X101.961 Y110.738 E.10997
G1 X101.229 Y110.738 E.02799
G1 X101.229 Y113.615 E.10997
G1 X101.961 Y113.615 E.02799
G1 X101.961 Y116.492 E.10997
G1 X101.229 Y116.492 E.02799
G1 X101.229 Y119.369 E.10997
G1 X101.961 Y119.369 E.02799
G1 X101.961 Y122.246 E.10997
G1 X101.229 Y122.246 E.02799
G1 X101.229 Y125.123 E.10997
G1 X101.961 Y125.123 E.02799
G1 X101.961 Y128 E.10997
G1 X101.229 Y128 E.02799
G1 X101.229 Y130.877 E.10997
G1 X101.961 Y130.877 E.02799
G2 X101.969 Y131.577 I2.862 J.317 E.02681
G2 X102.552 Y133.754 I22.564 J-4.874 E.08619
G1 X101.229 Y133.754 E.05057
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.377 Y133.1 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.914 I.356 J1.164 P1  F30000
G1 X109.039 Y131.066 Z3.914
G1 Z3.514
G1 E.8 F1800
G1 F9000
G1 X109.039 Y131.397 E.01266
G2 X109.86 Y133.727 I22.527 J-6.634 E.0945
G1 X109.86 Y130.877 E.10894
G1 X109.039 Y130.877 E.03141
G1 X109.039 Y128 E.10997
G1 X109.86 Y128 E.03141
G1 X109.86 Y125.123 E.10997
G1 X109.039 Y125.123 E.03141
G1 X109.039 Y122.246 E.10997
G1 X109.86 Y122.246 E.03141
G1 X109.86 Y119.369 E.10997
G1 X109.039 Y119.369 E.03141
G1 X109.039 Y116.492 E.10997
G1 X109.86 Y116.492 E.03141
G1 X109.86 Y113.615 E.10997
G1 X109.039 Y113.615 E.03141
G1 X109.039 Y110.738 E.10997
G1 X109.86 Y110.738 E.03141
G1 X109.86 Y107.86 E.10997
G1 X109.039 Y107.86 E.03141
G1 X109.039 Y104.983 E.10997
G1 X109.86 Y104.983 E.03141
G1 X109.86 Y102.106 E.10997
G1 X108.889 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.914 I-.693 J1 P1  F30000
G1 X150.14 Y131.066 Z3.914
G1 Z3.514
G1 E.8 F1800
G1 F9000
G1 X150.14 Y133.727 E.10173
G2 X150.961 Y131.397 I-21.706 J-8.965 E.0945
G1 X150.961 Y130.877 E.01986
G1 X150.14 Y130.877 E.03141
G1 X150.14 Y128 E.10997
G1 X150.961 Y128 E.03141
M73 P60 R7
G1 X150.961 Y125.123 E.10997
G1 X150.14 Y125.123 E.03141
G1 X150.14 Y122.246 E.10997
G1 X150.961 Y122.246 E.03141
G1 X150.961 Y119.369 E.10997
G1 X150.14 Y119.369 E.03141
G1 X150.14 Y116.492 E.10997
G1 X150.961 Y116.492 E.03141
G1 X150.961 Y113.615 E.10997
G1 X150.14 Y113.615 E.03141
G1 X150.14 Y110.738 E.10997
G1 X150.961 Y110.738 E.03141
G1 X150.961 Y107.86 E.10997
G1 X150.14 Y107.86 E.03141
G1 X150.14 Y104.983 E.10997
G1 X150.961 Y104.983 E.03141
G1 X150.961 Y102.256 E.10426
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.914 I.168 J1.205 P1  F30000
G1 X157.889 Y102.106 Z3.914
G1 Z3.514
G1 E.8 F1800
G1 F9000
G1 X158.771 Y102.106 E.0337
G1 X158.771 Y104.983 E.10997
G1 X158.039 Y104.983 E.02799
G1 X158.039 Y107.86 E.10997
G1 X158.771 Y107.86 E.02799
G1 X158.771 Y110.738 E.10997
G1 X158.039 Y110.738 E.02799
G1 X158.039 Y113.615 E.10997
G1 X158.771 Y113.615 E.02799
G1 X158.771 Y116.492 E.10997
G1 X158.039 Y116.492 E.02799
G1 X158.039 Y119.369 E.10997
G1 X158.771 Y119.369 E.02799
G1 X158.771 Y122.246 E.10997
G1 X158.039 Y122.246 E.02799
G1 X158.039 Y125.123 E.10997
G1 X158.771 Y125.123 E.02799
G1 X158.771 Y128 E.10997
G1 X158.039 Y128 E.02799
G1 X158.039 Y130.877 E.10997
G1 X158.771 Y130.877 E.02799
G1 X158.771 Y133.754 E.10997
G1 X157.448 Y133.754 E.05057
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0857141
; WIPE_START
G1 F24000
G1 X158.771 Y133.754 E-.50281
G1 X158.771 Y133.077 E-.25719
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/64
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
G3 Z3.914 I.221 J-1.197 P1  F30000
G1 X152.022 Y131.829 Z3.914
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F13535
G1 X152.102 Y131.57 E.00897
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.226 E1.93421
G1 X152.004 Y131.886 E.02947
G1 X151.647 Y131.712 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y131.511 E.00647
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.629 Y131.769 E.027
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.10283
G1 X151.71 Y129.781 E-.65717
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.48 J1.118 P1  F30000
G1 X154.346 Y130.914 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F13535
G1 X154.654 Y130.914 E.00778
G1 X154.654 Y105.324 E.6443
G1 X154.346 Y105.324 E.00778
G1 X154.346 Y130.854 E.64279
G1 X154.002 Y131.257 F30000
; LINE_WIDTH: 0.419999
G1 F13535
G1 X154.977 Y131.257 E.02993
G1 X154.998 Y130.759 E.0153
G1 X154.998 Y104.981 E.79208
G1 X154.002 Y104.981 E.03058
G1 X154.002 Y131.197 E.80553
G1 X153.62 Y131.634 F30000
G1 F13535
G1 X155.271 Y131.634 E.05073
G1 X155.375 Y131.161 E.01488
G1 X155.375 Y104.604 E.81601
G1 X153.625 Y104.604 E.05375
G1 X153.625 Y131.574 E.82871
G1 X153.165 Y132.011 F30000
G1 F13535
G1 X155.566 Y132.011 E.07378
G1 X155.752 Y131.265 E.02362
G1 X155.752 Y104.227 E.83079
G1 X153.248 Y104.227 E.07692
G1 X153.248 Y131.601 E.84114
G1 X153.177 Y131.952 E.01099
G1 X152.651 Y132.388 F30000
G1 F13535
G1 X155.861 Y132.388 E.09864
G1 X156.129 Y131.311 E.0341
G1 X156.129 Y103.85 E.8438
G1 X152.871 Y103.85 E.10009
G1 X152.871 Y131.601 E.85272
G1 X152.667 Y132.33 E.02325
G1 X152.137 Y132.765 F30000
G1 F13535
G1 X156.145 Y132.765 E.12316
G1 X156.506 Y131.357 E.04466
G1 X156.506 Y103.473 E.8568
G1 X152.494 Y103.473 E.12327
G1 X152.494 Y131.601 E.86431
G1 X152.155 Y132.708 E.03555
G1 X149.713 Y137.777 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F13535
G3 X148.8 Y139.124 I-24.599 J-15.688 E.054
G1 X151.597 Y141.921 E.13123
G3 X147.88 Y145.88 I-22.36 J-17.27 E.18042
G1 X145.102 Y143.102 E.13036
G3 X140.486 Y146.162 I-17.246 J-20.999 E.18403
G1 X143.384 Y149.06 E.13596
G3 X141.941 Y149.813 I-8.378 J-14.292 E.05403
G1 X153.773 Y138.614 F30000
G1 F13535
G2 X154.519 Y137.167 I-14.332 J-8.31 E.05402
G1 X151.555 Y134.203 E.13905
G2 X151.955 Y133.157 I-10.306 J-4.538 E.03717
G1 X155.547 Y133.157 E.11915
G1 X137.061 Y151.643 E.86721
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X104.453 Y133.157 E.86721
G1 X108.045 Y133.157 E.11915
G2 X108.445 Y134.203 I10.706 J-3.492 E.03717
G1 X105.481 Y137.167 E.13905
G2 X106.227 Y138.614 I15.077 J-6.863 E.05402
G1 X110.287 Y137.777 F30000
G1 F13535
G2 X111.2 Y139.124 I24.6 J-15.689 E.054
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.377 J-14.291 E.05403
G1 X105.654 Y130.914 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F13535
G1 X105.654 Y105.324 E.6443
G1 X105.346 Y105.324 E.00778
G1 X105.346 Y130.914 E.6443
G1 X105.594 Y130.914 E.00627
G1 X105.998 Y131.257 F30000
; LINE_WIDTH: 0.419999
G1 F13535
G1 X105.998 Y104.981 E.80737
G1 X105.002 Y104.981 E.03058
G1 X105.002 Y131.172 E.80478
G1 X105.023 Y131.257 E.00267
G1 X105.938 Y131.257 E.02809
G1 X106.375 Y130.759 F30000
G1 F13535
G1 X106.375 Y104.604 E.80367
G1 X104.625 Y104.604 E.05375
G1 X104.625 Y131.219 E.81779
G1 X104.729 Y131.634 E.01314
G1 X106.38 Y131.634 E.05073
G1 X106.375 Y130.819 E.02503
G1 X107.129 Y130.759 F30000
G1 F13535
G1 X107.129 Y103.85 E.82684
G1 X103.871 Y103.85 E.10009
G1 X103.871 Y131.311 E.8438
G1 X104.139 Y132.388 E.0341
G1 X107.349 Y132.388 E.09864
G1 X107.155 Y131.771 E.01986
G1 X107.13 Y130.819 E.02927
G1 X106.835 Y132.011 F30000
G1 F13535
G1 X106.752 Y131.601 E.01284
G1 X106.752 Y104.227 E.84114
G1 X104.248 Y104.227 E.07692
G1 X104.248 Y131.265 E.83079
G1 X104.434 Y132.011 E.02362
G1 X106.775 Y132.011 E.07194
G1 X107.863 Y132.765 F30000
G1 F13535
G1 X107.515 Y131.658 E.03566
G1 X107.506 Y103.473 E.86605
G1 X103.494 Y103.473 E.12327
G1 X103.494 Y131.357 E.8568
G1 X103.855 Y132.765 E.04466
G1 X107.803 Y132.765 E.12131
; CHANGE_LAYER
; Z_HEIGHT: 3.77143
; LAYER_HEIGHT: 0.171429
; WIPE_START
G1 F24000
G1 X105.803 Y132.765 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/64
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
G3 Z4 I.566 J1.077 P1  F30000
G1 X109.039 Y131.066 Z4
G1 Z3.771
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.039 Y131.397 E.01266
G2 X109.86 Y133.727 I22.527 J-6.634 E.0945
G1 X109.86 Y130.877 E.10894
G1 X109.039 Y130.877 E.03141
G1 X109.039 Y128 E.10997
G1 X109.86 Y128 E.03141
G1 X109.86 Y125.123 E.10997
G1 X109.039 Y125.123 E.03141
G1 X109.039 Y122.246 E.10997
G1 X109.86 Y122.246 E.03141
G1 X109.86 Y119.369 E.10997
G1 X109.039 Y119.369 E.03141
G1 X109.039 Y116.492 E.10997
G1 X109.86 Y116.492 E.03141
G1 X109.86 Y113.615 E.10997
G1 X109.039 Y113.615 E.03141
G1 X109.039 Y110.738 E.10997
G1 X109.86 Y110.738 E.03141
G1 X109.86 Y107.86 E.10997
G1 X109.039 Y107.86 E.03141
G1 X109.039 Y104.983 E.10997
G1 X109.86 Y104.983 E.03141
G1 X109.86 Y102.106 E.10997
G1 X108.889 Y102.106 E.03712
; WIPE_START
M73 P61 R7
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.171 I.144 J-1.208 P1  F30000
G1 X101.229 Y102.106 Z4.171
G1 Z3.771
G1 E.8 F1800
G1 F9000
G1 X102.111 Y102.106 E.0337
G1 X101.961 Y102.256 E.00807
G1 X101.961 Y104.983 E.10426
G1 X101.229 Y104.983 E.02799
G1 X101.229 Y107.86 E.10997
G1 X101.961 Y107.86 E.02799
G1 X101.961 Y110.738 E.10997
G1 X101.229 Y110.738 E.02799
G1 X101.229 Y113.615 E.10997
G1 X101.961 Y113.615 E.02799
G1 X101.961 Y116.492 E.10997
G1 X101.229 Y116.492 E.02799
G1 X101.229 Y119.369 E.10997
G1 X101.961 Y119.369 E.02799
G1 X101.961 Y122.246 E.10997
G1 X101.229 Y122.246 E.02799
G1 X101.229 Y125.123 E.10997
G1 X101.961 Y125.123 E.02799
G1 X101.961 Y128 E.10997
G1 X101.229 Y128 E.02799
G1 X101.229 Y130.877 E.10997
G1 X101.961 Y130.877 E.02799
G2 X101.969 Y131.577 I2.862 J.317 E.02681
G2 X102.552 Y133.754 I22.564 J-4.874 E.08619
G1 X101.229 Y133.754 E.05057
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.377 Y133.1 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.171 I.052 J1.216 P1  F30000
G1 X150.14 Y131.066 Z4.171
G1 Z3.771
G1 E.8 F1800
G1 F9000
G1 X150.14 Y133.727 E.10173
G2 X150.961 Y131.397 I-21.706 J-8.965 E.0945
G1 X150.961 Y130.877 E.01986
G1 X150.14 Y130.877 E.03141
G1 X150.14 Y128 E.10997
G1 X150.961 Y128 E.03141
G1 X150.961 Y125.123 E.10997
G1 X150.14 Y125.123 E.03141
G1 X150.14 Y122.246 E.10997
G1 X150.961 Y122.246 E.03141
G1 X150.961 Y119.369 E.10997
G1 X150.14 Y119.369 E.03141
G1 X150.14 Y116.492 E.10997
G1 X150.961 Y116.492 E.03141
G1 X150.961 Y113.615 E.10997
G1 X150.14 Y113.615 E.03141
G1 X150.14 Y110.738 E.10997
G1 X150.961 Y110.738 E.03141
G1 X150.961 Y107.86 E.10997
G1 X150.14 Y107.86 E.03141
G1 X150.14 Y104.983 E.10997
G1 X150.961 Y104.983 E.03141
G1 X150.961 Y102.256 E.10426
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
M73 P61 R6
G3 Z4.171 I.168 J1.205 P1  F30000
G1 X157.889 Y102.106 Z4.171
G1 Z3.771
G1 E.8 F1800
G1 F9000
G1 X158.771 Y102.106 E.0337
G1 X158.771 Y104.983 E.10997
G1 X158.039 Y104.983 E.02799
G1 X158.039 Y107.86 E.10997
G1 X158.771 Y107.86 E.02799
G1 X158.771 Y110.738 E.10997
G1 X158.039 Y110.738 E.02799
G1 X158.039 Y113.615 E.10997
G1 X158.771 Y113.615 E.02799
G1 X158.771 Y116.492 E.10997
G1 X158.039 Y116.492 E.02799
G1 X158.039 Y119.369 E.10997
G1 X158.771 Y119.369 E.02799
G1 X158.771 Y122.246 E.10997
G1 X158.039 Y122.246 E.02799
G1 X158.039 Y125.123 E.10997
G1 X158.771 Y125.123 E.02799
G1 X158.771 Y128 E.10997
G1 X158.039 Y128 E.02799
G1 X158.039 Y130.877 E.10997
G1 X158.771 Y130.877 E.02799
G1 X158.771 Y133.754 E.10997
G1 X157.448 Y133.754 E.05057
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0285714
; WIPE_START
G1 F24000
G1 X158.771 Y133.754 E-.50281
G1 X158.771 Y133.077 E-.25719
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/64
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
G3 Z4.171 I.22 J-1.197 P1  F30000
G1 X152.019 Y131.836 Z4.171
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F13532
G1 X152.102 Y131.57 E.00924
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.058 E2.46808
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.226 E1.93421
G1 X152.001 Y131.894 E.0292
G1 X151.645 Y131.72 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y131.511 E.00672
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.108 E2.32114
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.627 Y131.777 E.02674
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.10592
G1 X151.71 Y129.789 E-.65408
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.477 J1.119 P1  F30000
G1 X154.346 Y130.914 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F13532
G1 X154.654 Y130.914 E.00778
G1 X154.654 Y105.324 E.6443
G1 X154.346 Y105.324 E.00778
G1 X154.346 Y130.854 E.64279
G1 X154.002 Y131.257 F30000
; LINE_WIDTH: 0.419999
G1 F13532
G1 X154.977 Y131.257 E.02993
G1 X154.998 Y130.759 E.0153
G1 X154.998 Y104.981 E.79208
G1 X154.002 Y104.981 E.03058
G1 X154.002 Y131.197 E.80553
G1 X153.62 Y131.634 F30000
G1 F13532
G1 X155.271 Y131.634 E.05073
G1 X155.375 Y131.161 E.01488
G1 X155.375 Y104.604 E.81601
G1 X153.625 Y104.604 E.05375
G1 X153.625 Y131.574 E.82871
G1 X153.165 Y132.011 F30000
G1 F13532
G1 X155.566 Y132.011 E.07378
G1 X155.752 Y131.265 E.02362
G1 X155.752 Y104.227 E.83079
G1 X153.248 Y104.227 E.07692
G1 X153.248 Y131.601 E.84114
G1 X153.177 Y131.952 E.01099
G1 X152.651 Y132.388 F30000
G1 F13532
G1 X155.861 Y132.388 E.09864
G1 X156.129 Y131.311 E.0341
G1 X156.129 Y103.85 E.8438
G1 X152.871 Y103.85 E.10009
G1 X152.871 Y131.601 E.85272
G1 X152.667 Y132.33 E.02325
G1 X152.137 Y132.765 F30000
G1 F13532
G1 X156.145 Y132.765 E.12316
G1 X156.506 Y131.357 E.04466
G1 X156.506 Y103.473 E.8568
G1 X152.494 Y103.473 E.12327
G1 X152.494 Y131.601 E.86431
G1 X152.155 Y132.708 E.03555
G1 X149.713 Y137.777 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F13532
G3 X148.8 Y139.124 I-24.599 J-15.688 E.054
G1 X151.597 Y141.921 E.13123
G3 X147.88 Y145.88 I-22.36 J-17.269 E.18042
G1 X145.102 Y143.102 E.13036
G3 X140.486 Y146.162 I-17.246 J-20.999 E.18403
G1 X143.384 Y149.06 E.13596
G3 X141.941 Y149.813 I-8.378 J-14.292 E.05403
G1 X153.773 Y138.614 F30000
G1 F13532
G2 X154.519 Y137.167 I-14.332 J-8.31 E.05402
G1 X151.555 Y134.203 E.13905
G2 X151.955 Y133.157 I-10.306 J-4.538 E.03717
G1 X155.547 Y133.157 E.11915
G1 X137.061 Y151.643 E.86721
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X104.453 Y133.157 E.86721
G1 X108.045 Y133.157 E.11915
G2 X108.445 Y134.203 I10.706 J-3.492 E.03717
G1 X105.481 Y137.167 E.13905
G2 X106.227 Y138.614 I15.077 J-6.863 E.05402
G1 X110.287 Y137.777 F30000
G1 F13532
G2 X111.2 Y139.124 I24.6 J-15.689 E.054
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.377 J-14.291 E.05403
G1 X105.654 Y130.914 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F13532
G1 X105.654 Y105.324 E.6443
G1 X105.346 Y105.324 E.00778
G1 X105.346 Y130.914 E.6443
G1 X105.594 Y130.914 E.00627
G1 X105.998 Y131.257 F30000
; LINE_WIDTH: 0.419999
G1 F13532
G1 X105.998 Y104.981 E.80737
G1 X105.002 Y104.981 E.03058
G1 X105.002 Y131.172 E.80478
G1 X105.023 Y131.257 E.00267
G1 X105.938 Y131.257 E.02809
G1 X106.375 Y130.759 F30000
G1 F13532
G1 X106.375 Y104.604 E.80367
G1 X104.625 Y104.604 E.05375
G1 X104.625 Y131.219 E.81779
G1 X104.729 Y131.634 E.01314
G1 X106.38 Y131.634 E.05073
G1 X106.375 Y130.819 E.02503
G1 X107.129 Y130.759 F30000
G1 F13532
G1 X107.129 Y103.85 E.82684
G1 X103.871 Y103.85 E.10009
G1 X103.871 Y131.311 E.8438
G1 X104.139 Y132.388 E.0341
G1 X107.349 Y132.388 E.09864
G1 X107.155 Y131.771 E.01986
G1 X107.13 Y130.819 E.02927
G1 X106.835 Y132.011 F30000
G1 F13532
G1 X106.752 Y131.601 E.01284
G1 X106.752 Y104.227 E.84114
G1 X104.248 Y104.227 E.07692
G1 X104.248 Y131.265 E.83079
G1 X104.434 Y132.011 E.02362
G1 X106.775 Y132.011 E.07194
G1 X107.863 Y132.765 F30000
G1 F13532
G1 X107.515 Y131.658 E.03566
G1 X107.506 Y103.473 E.86605
G1 X103.494 Y103.473 E.12327
M73 P62 R6
G1 X103.494 Y131.357 E.8568
G1 X103.855 Y132.765 E.04466
G1 X107.803 Y132.765 E.12131
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X105.803 Y132.765 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/64
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
G3 Z4.2 I.024 J1.217 P1  F30000
G1 X152.017 Y131.844 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10947
G1 X152.102 Y131.57 E.00951
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.047 E2.4686
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.225 E1.93428
G1 X151.999 Y131.901 E.02893
G1 X151.642 Y131.727 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10947
G1 X151.71 Y131.511 E.00697
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.096 E2.32164
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.161 E1.75966
G1 X151.625 Y131.785 E.02649
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.10904
G1 X151.71 Y129.798 E-.65096
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.204 J.179 P1  F30000
G1 X152.147 Y132.738 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F10947
G1 X156.153 Y132.738 E.12311
G1 X156.506 Y131.357 E.0438
G1 X156.506 Y103.473 E.8568
G1 X152.494 Y103.473 E.12327
G1 X152.494 Y131.601 E.86431
G1 X152.165 Y132.681 E.03468
G1 X152.66 Y132.361 F30000
G1 F10947
G1 X155.868 Y132.361 E.09856
G1 X156.129 Y131.311 E.03325
G1 X156.129 Y103.85 E.8438
G1 X152.871 Y103.85 E.10009
G1 X152.871 Y131.601 E.85272
G1 X152.676 Y132.303 E.02238
G1 X153.174 Y131.984 F30000
G1 F10947
G1 X155.573 Y131.984 E.07372
G1 X155.752 Y131.265 E.02277
G1 X155.752 Y104.227 E.83079
G1 X153.248 Y104.227 E.07692
G1 X153.248 Y131.601 E.84114
G1 X153.185 Y131.925 E.01013
G1 X153.625 Y131.601 F30000
G1 F10947
G2 X155.278 Y131.607 I1.263 J-135.975 E.05078
G1 X155.375 Y131.164 E.01391
G1 X155.375 Y104.604 E.81612
G1 X153.625 Y104.604 E.05375
G1 X153.625 Y131.541 E.82771
G1 X154.002 Y131.23 F30000
G1 F10947
G1 X154.983 Y131.23 E.03014
G1 X154.998 Y130.732 E.01529
G1 X154.998 Y104.981 E.79125
G1 X154.002 Y104.981 E.03058
G1 X154.002 Y131.17 E.8047
G1 X154.346 Y130.887 F30000
; LINE_WIDTH: 0.351907
G1 F10947
G1 X154.654 Y130.887 E.00778
G1 X154.654 Y105.324 E.64362
G1 X154.346 Y105.324 E.00778
G1 X154.346 Y130.827 E.64211
G1 X153.773 Y138.614 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10947
G2 X154.519 Y137.167 I-14.332 J-8.31 E.05402
G1 X151.555 Y134.203 E.13905
G2 X151.965 Y133.13 I-10.571 J-4.651 E.03812
G1 X155.574 Y133.13 E.11972
G1 X137.061 Y151.643 E.86847
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X104.426 Y133.13 E.86847
G1 X108.035 Y133.13 E.11972
G2 X108.445 Y134.203 I10.981 J-3.578 E.03812
G1 X105.481 Y137.167 E.13905
G2 X106.227 Y138.614 I15.077 J-6.863 E.05402
G1 X110.287 Y137.777 F30000
G1 F10947
G2 X111.2 Y139.124 I24.6 J-15.689 E.054
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
G1 X105.654 Y130.887 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F10947
G1 X105.654 Y105.324 E.64362
G1 X105.346 Y105.324 E.00778
G1 X105.346 Y130.887 E.64362
G1 X105.594 Y130.887 E.00627
G1 X105.998 Y131.23 F30000
; LINE_WIDTH: 0.419999
G1 F10947
G1 X105.998 Y104.981 E.80654
G1 X105.002 Y104.981 E.03058
G1 X105.002 Y131.172 E.80478
G1 X105.017 Y131.23 E.00181
G1 X105.938 Y131.23 E.02829
G1 X106.375 Y130.732 F30000
G1 F10947
G1 X106.375 Y104.604 E.80284
G1 X104.625 Y104.604 E.05375
G1 X104.625 Y131.219 E.81779
G1 X104.722 Y131.607 E.01229
G1 X106.375 Y131.607 E.05081
G1 X106.375 Y130.792 E.02503
G1 X107.129 Y130.732 F30000
G1 F10947
G1 X107.129 Y103.85 E.82601
G1 X103.871 Y103.85 E.10009
G1 X103.871 Y131.311 E.8438
G1 X104.132 Y132.361 E.03325
G1 X107.34 Y132.361 E.09856
G1 X107.155 Y131.771 E.019
G1 X107.13 Y130.792 E.03008
G1 X106.826 Y131.984 F30000
G1 F10947
G1 X106.752 Y131.601 E.01197
G1 X106.752 Y104.227 E.84114
G1 X104.248 Y104.227 E.07692
G1 X104.248 Y131.265 E.83079
G1 X104.427 Y131.984 E.02277
G1 X106.766 Y131.984 E.07188
G1 X107.853 Y132.738 F30000
G1 F10947
G1 X107.514 Y131.658 E.03478
G1 X107.506 Y103.473 E.86605
G1 X103.494 Y103.473 E.12327
G1 X103.494 Y131.357 E.8568
G1 X103.847 Y132.738 E.0438
G1 X107.793 Y132.738 E.12127
; WIPE_START
G1 F24000
G1 X105.793 Y132.738 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.52 J1.1 P1  F30000
G1 X141.941 Y149.813 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10947
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.059 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.229 E.18042
G1 X148.8 Y139.124 E.13123
G2 X149.713 Y137.777 I-23.686 J-17.036 E.054
; CHANGE_LAYER
; Z_HEIGHT: 4.02857
; LAYER_HEIGHT: 0.0285716
; WIPE_START
G1 F24000
G1 X148.8 Y139.124 E-.61855
G1 X149.063 Y139.387 E-.14145
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/64
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
G3 Z4.4 I1.207 J.156 P1  F30000
G1 X150.14 Y131.066 Z4.4
G1 Z4.029
M73 P63 R6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X150.14 Y133.727 E.10173
G2 X150.961 Y131.397 I-21.706 J-8.965 E.0945
G1 X150.961 Y130.877 E.01986
G1 X150.14 Y130.877 E.03141
G1 X150.14 Y128 E.10997
G1 X150.961 Y128 E.03141
G1 X150.961 Y125.123 E.10997
G1 X150.14 Y125.123 E.03141
G1 X150.14 Y122.246 E.10997
G1 X150.961 Y122.246 E.03141
G1 X150.961 Y119.369 E.10997
G1 X150.14 Y119.369 E.03141
G1 X150.14 Y116.492 E.10997
G1 X150.961 Y116.492 E.03141
G1 X150.961 Y113.615 E.10997
G1 X150.14 Y113.615 E.03141
G1 X150.14 Y110.738 E.10997
G1 X150.961 Y110.738 E.03141
G1 X150.961 Y107.86 E.10997
G1 X150.14 Y107.86 E.03141
G1 X150.14 Y104.983 E.10997
G1 X150.961 Y104.983 E.03141
G1 X150.961 Y102.256 E.10426
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.429 I.168 J1.205 P1  F30000
G1 X157.889 Y102.106 Z4.429
G1 Z4.029
G1 E.8 F1800
G1 F9000
G1 X158.771 Y102.106 E.0337
G1 X158.771 Y104.983 E.10997
G1 X158.039 Y104.983 E.02799
G1 X158.039 Y107.86 E.10997
G1 X158.771 Y107.86 E.02799
G1 X158.771 Y110.738 E.10997
G1 X158.039 Y110.738 E.02799
G1 X158.039 Y113.615 E.10997
G1 X158.771 Y113.615 E.02799
G1 X158.771 Y116.492 E.10997
G1 X158.039 Y116.492 E.02799
G1 X158.039 Y119.369 E.10997
G1 X158.771 Y119.369 E.02799
G1 X158.771 Y122.246 E.10997
G1 X158.039 Y122.246 E.02799
G1 X158.039 Y125.123 E.10997
G1 X158.771 Y125.123 E.02799
G1 X158.771 Y128 E.10997
G1 X158.039 Y128 E.02799
G1 X158.039 Y130.877 E.10997
G1 X158.771 Y130.877 E.02799
G1 X158.771 Y133.754 E.10997
G1 X157.448 Y133.754 E.05057
; WIPE_START
G1 F24000
G1 X158.771 Y133.754 E-.50281
G1 X158.771 Y133.077 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.429 I.049 J-1.216 P1  F30000
G1 X109.039 Y131.066 Z4.429
G1 Z4.029
G1 E.8 F1800
G1 F9000
G2 X109.505 Y132.813 I6.299 J-.745 E.06936
G2 X109.86 Y133.727 I9.361 J-3.113 E.03751
G1 X109.86 Y130.877 E.10894
G1 X109.039 Y130.877 E.03141
G1 X109.039 Y128 E.10997
G1 X109.86 Y128 E.03141
G1 X109.86 Y125.123 E.10997
G1 X109.039 Y125.123 E.03141
G1 X109.039 Y122.246 E.10997
G1 X109.86 Y122.246 E.03141
G1 X109.86 Y119.369 E.10997
G1 X109.039 Y119.369 E.03141
G1 X109.039 Y116.492 E.10997
G1 X109.86 Y116.492 E.03141
G1 X109.86 Y113.615 E.10997
G1 X109.039 Y113.615 E.03141
G1 X109.039 Y110.738 E.10997
G1 X109.86 Y110.738 E.03141
G1 X109.86 Y107.86 E.10997
G1 X109.039 Y107.86 E.03141
G1 X109.039 Y104.983 E.10997
G1 X109.86 Y104.983 E.03141
G1 X109.86 Y102.106 E.10997
G1 X108.889 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.429 I.144 J-1.208 P1  F30000
G1 X101.229 Y102.106 Z4.429
G1 Z4.029
G1 E.8 F1800
G1 F9000
G1 X102.111 Y102.106 E.0337
G1 X101.961 Y102.256 E.00807
G1 X101.961 Y104.983 E.10426
G1 X101.229 Y104.983 E.02799
G1 X101.229 Y107.86 E.10997
G1 X101.961 Y107.86 E.02799
G1 X101.961 Y110.738 E.10997
G1 X101.229 Y110.738 E.02799
G1 X101.229 Y113.615 E.10997
G1 X101.961 Y113.615 E.02799
G1 X101.961 Y116.492 E.10997
G1 X101.229 Y116.492 E.02799
G1 X101.229 Y119.369 E.10997
G1 X101.961 Y119.369 E.02799
G1 X101.961 Y122.246 E.10997
G1 X101.229 Y122.246 E.02799
G1 X101.229 Y125.123 E.10997
G1 X101.961 Y125.123 E.02799
G1 X101.961 Y128 E.10997
G1 X101.229 Y128 E.02799
G1 X101.229 Y130.877 E.10997
G1 X101.961 Y130.877 E.02799
G2 X101.969 Y131.577 I2.862 J.317 E.02681
G2 X102.552 Y133.754 I22.564 J-4.874 E.08619
G1 X101.229 Y133.754 E.05057
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.171428
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.377 Y133.1 E-.25719
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/64
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
G3 Z4.429 I.031 J1.217 P1  F30000
G1 X152.014 Y131.852 Z4.429
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F14097
G1 X152.102 Y131.57 E.00978
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.226 E1.93421
G1 X151.997 Y131.909 E.02865
G1 X151.64 Y131.735 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y131.511 E.00723
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.622 Y131.793 E.02624
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.11217
G1 X151.71 Y129.806 E-.64783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.204 J.179 P1  F30000
G1 X152.147 Y132.738 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F14097
G1 X156.153 Y132.738 E.12311
G1 X156.506 Y131.357 E.0438
G1 X156.506 Y103.473 E.8568
G1 X152.494 Y103.473 E.12327
G1 X152.494 Y131.601 E.86431
G1 X152.165 Y132.681 E.03468
G1 X152.66 Y132.361 F30000
G1 F14097
G1 X155.868 Y132.361 E.09856
G1 X156.129 Y131.311 E.03325
G1 X156.129 Y103.85 E.8438
G1 X152.871 Y103.85 E.10009
G1 X152.871 Y131.601 E.85272
G1 X152.676 Y132.303 E.02238
G1 X153.174 Y131.984 F30000
G1 F14097
G1 X155.573 Y131.984 E.07372
G1 X155.752 Y131.265 E.02277
G1 X155.752 Y104.227 E.83079
G1 X153.248 Y104.227 E.07692
G1 X153.248 Y131.601 E.84114
G1 X153.185 Y131.925 E.01013
G1 X153.625 Y131.601 F30000
G1 F14097
G2 X155.278 Y131.607 I1.263 J-135.975 E.05078
G1 X155.375 Y131.164 E.01391
G1 X155.375 Y104.604 E.81612
G1 X153.625 Y104.604 E.05375
G1 X153.625 Y131.541 E.82771
G1 X154.002 Y131.23 F30000
G1 F14097
G1 X154.983 Y131.23 E.03014
G1 X154.998 Y130.732 E.01529
G1 X154.998 Y104.981 E.79125
G1 X154.002 Y104.981 E.03058
G1 X154.002 Y131.17 E.8047
G1 X154.346 Y130.887 F30000
; LINE_WIDTH: 0.351907
G1 F14097
G1 X154.654 Y130.887 E.00778
G1 X154.654 Y105.324 E.64362
G1 X154.346 Y105.324 E.00778
G1 X154.346 Y130.827 E.64211
G1 X153.773 Y138.614 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14097
G2 X154.519 Y137.167 I-14.332 J-8.31 E.05402
G1 X151.555 Y134.203 E.13905
G2 X151.965 Y133.13 I-10.571 J-4.651 E.03812
G1 X155.574 Y133.13 E.11972
G1 X137.061 Y151.643 E.86847
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X104.426 Y133.13 E.86847
G1 X108.035 Y133.13 E.11972
G2 X108.445 Y134.203 I10.981 J-3.578 E.03812
G1 X105.481 Y137.167 E.13905
G2 X106.227 Y138.614 I15.077 J-6.863 E.05402
G1 X110.287 Y137.777 F30000
G1 F14097
G2 X111.2 Y139.124 I24.6 J-15.689 E.054
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.377 J-14.291 E.05403
G1 X105.654 Y130.887 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F14097
G1 X105.654 Y105.324 E.64362
G1 X105.346 Y105.324 E.00778
G1 X105.346 Y130.887 E.64362
G1 X105.594 Y130.887 E.00627
G1 X105.998 Y131.23 F30000
; LINE_WIDTH: 0.419999
G1 F14097
G1 X105.998 Y104.981 E.80654
G1 X105.002 Y104.981 E.03058
G1 X105.002 Y131.172 E.80478
G1 X105.017 Y131.23 E.00181
G1 X105.938 Y131.23 E.02829
G1 X106.375 Y130.732 F30000
G1 F14097
G1 X106.375 Y104.604 E.80284
G1 X104.625 Y104.604 E.05375
G1 X104.625 Y131.219 E.81779
G1 X104.722 Y131.607 E.01229
G1 X106.375 Y131.607 E.05081
G1 X106.375 Y130.792 E.02503
G1 X107.129 Y130.732 F30000
M73 P64 R6
G1 F14097
G1 X107.129 Y103.85 E.82601
G1 X103.871 Y103.85 E.10009
G1 X103.871 Y131.311 E.8438
G1 X104.132 Y132.361 E.03325
G1 X107.34 Y132.361 E.09856
G1 X107.155 Y131.771 E.019
G1 X107.13 Y130.792 E.03008
G1 X106.826 Y131.984 F30000
G1 F14097
G1 X106.752 Y131.601 E.01197
G1 X106.752 Y104.227 E.84114
G1 X104.248 Y104.227 E.07692
G1 X104.248 Y131.265 E.83079
G1 X104.427 Y131.984 E.02277
G1 X106.766 Y131.984 E.07188
G1 X107.853 Y132.738 F30000
G1 F14097
G1 X107.514 Y131.658 E.03478
G1 X107.506 Y103.473 E.86605
G1 X103.494 Y103.473 E.12327
G1 X103.494 Y131.357 E.8568
G1 X103.847 Y132.738 E.0438
G1 X107.793 Y132.738 E.12127
; WIPE_START
G1 F24000
G1 X105.793 Y132.738 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.52 J1.1 P1  F30000
G1 X141.941 Y149.813 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14097
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.229 E.18042
G1 X148.8 Y139.124 E.13123
G2 X149.713 Y137.777 I-23.686 J-17.036 E.054
; CHANGE_LAYER
; Z_HEIGHT: 4.28571
; LAYER_HEIGHT: 0.0857143
; WIPE_START
G1 F24000
G1 X148.8 Y139.124 E-.61855
G1 X149.063 Y139.387 E-.14145
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/64
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
G3 Z4.6 I1.207 J.156 P1  F30000
G1 X150.14 Y131.066 Z4.6
G1 Z4.286
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X150.14 Y133.727 E.10173
G2 X150.961 Y131.397 I-21.706 J-8.965 E.0945
G1 X150.961 Y130.877 E.01986
G1 X150.14 Y130.877 E.03141
G1 X150.14 Y128 E.10997
G1 X150.961 Y128 E.03141
G1 X150.961 Y125.123 E.10997
G1 X150.14 Y125.123 E.03141
G1 X150.14 Y122.246 E.10997
G1 X150.961 Y122.246 E.03141
G1 X150.961 Y119.369 E.10997
G1 X150.14 Y119.369 E.03141
G1 X150.14 Y116.492 E.10997
G1 X150.961 Y116.492 E.03141
G1 X150.961 Y113.615 E.10997
G1 X150.14 Y113.615 E.03141
G1 X150.14 Y110.738 E.10997
G1 X150.961 Y110.738 E.03141
G1 X150.961 Y107.86 E.10997
G1 X150.14 Y107.86 E.03141
G1 X150.14 Y104.983 E.10997
G1 X150.961 Y104.983 E.03141
G1 X150.961 Y102.256 E.10426
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.686 I.168 J1.205 P1  F30000
G1 X157.889 Y102.106 Z4.686
G1 Z4.286
G1 E.8 F1800
G1 F9000
G1 X158.771 Y102.106 E.0337
G1 X158.771 Y104.983 E.10997
G1 X158.039 Y104.983 E.02799
G1 X158.039 Y107.86 E.10997
G1 X158.771 Y107.86 E.02799
G1 X158.771 Y110.738 E.10997
G1 X158.039 Y110.738 E.02799
G1 X158.039 Y113.615 E.10997
G1 X158.771 Y113.615 E.02799
G1 X158.771 Y116.492 E.10997
G1 X158.039 Y116.492 E.02799
G1 X158.039 Y119.369 E.10997
G1 X158.771 Y119.369 E.02799
G1 X158.771 Y122.246 E.10997
G1 X158.039 Y122.246 E.02799
G1 X158.039 Y125.123 E.10997
G1 X158.771 Y125.123 E.02799
G1 X158.771 Y128 E.10997
G1 X158.039 Y128 E.02799
G1 X158.039 Y130.877 E.10997
G1 X158.771 Y130.877 E.02799
G1 X158.771 Y133.754 E.10997
G1 X157.448 Y133.754 E.05057
; WIPE_START
G1 F24000
G1 X158.771 Y133.754 E-.50281
G1 X158.771 Y133.077 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.686 I.049 J-1.216 P1  F30000
G1 X109.039 Y131.066 Z4.686
G1 Z4.286
G1 E.8 F1800
G1 F9000
G1 X109.039 Y131.397 E.01266
G2 X109.86 Y133.727 I22.527 J-6.634 E.0945
G1 X109.86 Y130.877 E.10894
G1 X109.039 Y130.877 E.03141
G1 X109.039 Y128 E.10997
G1 X109.86 Y128 E.03141
G1 X109.86 Y125.123 E.10997
G1 X109.039 Y125.123 E.03141
G1 X109.039 Y122.246 E.10997
G1 X109.86 Y122.246 E.03141
G1 X109.86 Y119.369 E.10997
G1 X109.039 Y119.369 E.03141
G1 X109.039 Y116.492 E.10997
G1 X109.86 Y116.492 E.03141
G1 X109.86 Y113.615 E.10997
G1 X109.039 Y113.615 E.03141
G1 X109.039 Y110.738 E.10997
G1 X109.86 Y110.738 E.03141
G1 X109.86 Y107.86 E.10997
G1 X109.039 Y107.86 E.03141
G1 X109.039 Y104.983 E.10997
G1 X109.86 Y104.983 E.03141
G1 X109.86 Y102.106 E.10997
G1 X108.889 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.686 I.144 J-1.208 P1  F30000
G1 X101.229 Y102.106 Z4.686
G1 Z4.286
G1 E.8 F1800
G1 F9000
G1 X102.111 Y102.106 E.0337
G1 X101.961 Y102.256 E.00807
G1 X101.961 Y104.983 E.10426
G1 X101.229 Y104.983 E.02799
G1 X101.229 Y107.86 E.10997
G1 X101.961 Y107.86 E.02799
G1 X101.961 Y110.738 E.10997
G1 X101.229 Y110.738 E.02799
G1 X101.229 Y113.615 E.10997
G1 X101.961 Y113.615 E.02799
G1 X101.961 Y116.492 E.10997
G1 X101.229 Y116.492 E.02799
G1 X101.229 Y119.369 E.10997
G1 X101.961 Y119.369 E.02799
G1 X101.961 Y122.246 E.10997
G1 X101.229 Y122.246 E.02799
G1 X101.229 Y125.123 E.10997
G1 X101.961 Y125.123 E.02799
G1 X101.961 Y128 E.10997
G1 X101.229 Y128 E.02799
G1 X101.229 Y130.877 E.10997
G1 X101.961 Y130.877 E.02799
G2 X101.969 Y131.577 I2.862 J.317 E.02681
G2 X102.552 Y133.754 I22.564 J-4.874 E.08619
G1 X101.229 Y133.754 E.05057
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.114286
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.377 Y133.1 E-.25719
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/64
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
G3 Z4.686 I.013 J1.217 P1  F30000
G1 X151.795 Y132.557 Z4.686
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X156.617 Y132.557 E.15998
G3 X103.383 Y132.557 I-26.617 J-7.215 E2.38964
G1 X108.205 Y132.557 E.15998
G1 X108.261 Y132.734 E.00616
G2 X151.776 Y132.613 I21.737 J-7.377 E1.89816
G1 X151.638 Y131.743 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y131.511 E.00748
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.62 Y131.8 E.02599
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.11531
G1 X151.71 Y129.814 E-.64469
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.393 J1.152 P1  F30000
G1 X157.032 Y131.631 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X156.329 Y132.334 E.03056
G1 X155.796 Y132.334
G1 X157.083 Y131.047 E.05593
G1 X157.083 Y130.514
G1 X155.262 Y132.334 E.0791
G1 X154.729 Y132.334
G1 X157.083 Y129.981 E.10227
G1 X157.083 Y129.447
G1 X154.196 Y132.334 E.12545
G1 X153.662 Y132.334
G1 X157.083 Y128.914 E.14862
G1 X157.083 Y128.381
G1 X153.129 Y132.334 E.17179
G1 X152.596 Y132.334
G1 X157.083 Y127.847 E.19497
G1 X157.083 Y127.314
G1 X152.063 Y132.334 E.21814
G1 X151.734 Y132.129
G1 X157.083 Y126.781 E.23241
G1 X157.083 Y126.248
G1 X151.917 Y131.413 E.22445
G1 X151.917 Y130.88
G1 X157.083 Y125.714 E.22445
G1 X157.083 Y125.181
G1 X151.917 Y130.346 E.22445
G1 X151.917 Y129.813
G1 X157.083 Y124.648 E.22445
G1 X157.083 Y124.115
G1 X151.917 Y129.28 E.22445
G1 X151.917 Y128.747
G1 X157.083 Y123.581 E.22445
G1 X157.083 Y123.048
G1 X151.917 Y128.213 E.22445
G1 X151.917 Y127.68
G1 X157.083 Y122.515 E.22445
G1 X157.083 Y121.982
G1 X151.917 Y127.147 E.22445
G1 X151.917 Y126.613
G1 X157.083 Y121.448 E.22445
G1 X157.083 Y120.915
G1 X151.917 Y126.08 E.22445
G1 X151.917 Y125.547
G1 X157.083 Y120.382 E.22445
G1 X157.083 Y119.848
G1 X151.917 Y125.014 E.22445
G1 X151.917 Y124.48
G1 X157.083 Y119.315 E.22445
G1 X157.083 Y118.782
G1 X151.917 Y123.947 E.22445
G1 X151.917 Y123.414
G1 X157.083 Y118.249 E.22445
G1 X157.083 Y117.715
G1 X151.917 Y122.881 E.22445
G1 X151.917 Y122.347
G1 X157.083 Y117.182 E.22445
G1 X157.083 Y116.649
G1 X151.917 Y121.814 E.22445
G1 X151.917 Y121.281
G1 X157.083 Y116.116 E.22445
G1 X157.083 Y115.582
G1 X151.917 Y120.747 E.22445
G1 X151.917 Y120.214
G1 X157.083 Y115.049 E.22445
G1 X157.083 Y114.516
G1 X151.917 Y119.681 E.22445
G1 X151.917 Y119.148
G1 X157.083 Y113.982 E.22445
M73 P65 R6
G1 X157.083 Y113.449
G1 X151.917 Y118.614 E.22445
G1 X151.917 Y118.081
G1 X157.083 Y112.916 E.22445
G1 X157.083 Y112.383
G1 X151.917 Y117.548 E.22445
G1 X151.917 Y117.015
G1 X157.083 Y111.849 E.22445
G1 X157.083 Y111.316
G1 X151.917 Y116.481 E.22445
G1 X151.917 Y115.948
G1 X157.083 Y110.783 E.22445
G1 X157.083 Y110.25
G1 X151.917 Y115.415 E.22445
G1 X151.917 Y114.882
G1 X157.083 Y109.716 E.22445
G1 X157.083 Y109.183
G1 X151.917 Y114.348 E.22445
G1 X151.917 Y113.815
G1 X157.083 Y108.65 E.22445
G1 X157.083 Y108.116
G1 X151.917 Y113.282 E.22445
G1 X151.917 Y112.748
G1 X157.083 Y107.583 E.22445
G1 X157.083 Y107.05
G1 X151.917 Y112.215 E.22445
G1 X151.917 Y111.682
G1 X157.083 Y106.517 E.22445
G1 X157.083 Y105.983
G1 X151.917 Y111.149 E.22445
G1 X151.917 Y110.615
G1 X157.083 Y105.45 E.22445
G1 X157.083 Y104.917
G1 X151.917 Y110.082 E.22445
G1 X151.917 Y109.549
G1 X157.083 Y104.384 E.22445
G1 X157.083 Y103.85
G1 X151.917 Y109.016 E.22445
G1 X151.917 Y108.482
G1 X157.083 Y103.317 E.22445
G1 X156.743 Y103.123
G1 X151.917 Y107.949 E.2097
G1 X151.917 Y107.416
G1 X156.21 Y103.123 E.18652
G1 X155.676 Y103.123
G1 X151.917 Y106.882 E.16335
G1 X151.917 Y106.349
G1 X155.143 Y103.123 E.14018
G1 X154.61 Y103.123
G1 X151.917 Y105.816 E.117
G1 X151.917 Y105.283
G1 X154.077 Y103.123 E.09383
G1 X153.543 Y103.123
G1 X151.917 Y104.749 E.07066
G1 X151.917 Y104.216
G1 X153.01 Y103.123 E.04748
G1 X152.477 Y103.123
G1 X151.917 Y103.683 E.02431
M204 S10000
; WIPE_START
G1 F24000
G1 X152.477 Y103.123 E-.30066
G1 X153.01 Y103.123 E-.20264
G1 X152.532 Y103.601 E-.2567
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.217 J-.027 P1  F30000
G1 X151.906 Y131.401 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.166631
G1 F15000
G1 X151.961 Y131.546 E.00156
G1 X151.871 Y131.713 E.00191
; WIPE_START
G1 F24000
G1 X151.961 Y131.546 E-.41838
G1 X151.906 Y131.401 E-.34162
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.07 J-.579 P1  F30000
G1 X141.941 Y149.813 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.229 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.149 Y132.905 I-34.035 J-15.454 E.15146
G1 X155.799 Y132.905 E.01159
G1 X137.061 Y151.643 E.87904
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X104.201 Y132.905 E.87904
G1 X103.851 Y132.905 E.01159
G2 X105.481 Y137.167 I35.665 J-11.192 E.15146
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.377 J-14.291 E.05403
G1 X107.801 Y132.334 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.204 Y131.931 E.0175
G1 X108.083 Y131.519
G1 X107.268 Y132.334 E.0354
G1 X106.735 Y132.334
G1 X108.083 Y130.986 E.05857
G1 X108.083 Y130.453
G1 X106.201 Y132.334 E.08175
G1 X105.668 Y132.334
G1 X108.083 Y129.92 E.10492
G1 X108.083 Y129.386
G1 X105.135 Y132.334 E.12809
G1 X104.602 Y132.334
G1 X108.083 Y128.853 E.15127
G1 X108.083 Y128.32
G1 X104.068 Y132.334 E.17444
G1 X103.535 Y132.334
G1 X108.083 Y127.787 E.19761
G1 X108.083 Y127.253
G1 X103.115 Y132.221 E.21588
G1 X103.008 Y131.794
G1 X108.083 Y126.72 E.22049
G1 X108.083 Y126.187
G1 X102.917 Y131.352 E.22445
G1 X102.917 Y130.819
G1 X108.083 Y125.654 E.22445
G1 X108.083 Y125.12
G1 X102.917 Y130.285 E.22445
G1 X102.917 Y129.752
G1 X108.083 Y124.587 E.22445
G1 X108.083 Y124.054
G1 X102.917 Y129.219 E.22445
G1 X102.917 Y128.686
G1 X108.083 Y123.52 E.22445
G1 X108.083 Y122.987
G1 X102.917 Y128.152 E.22445
G1 X102.917 Y127.619
G1 X108.083 Y122.454 E.22445
G1 X108.083 Y121.921
G1 X102.917 Y127.086 E.22445
G1 X102.917 Y126.553
G1 X108.083 Y121.387 E.22445
G1 X108.083 Y120.854
G1 X102.917 Y126.019 E.22445
G1 X102.917 Y125.486
G1 X108.083 Y120.321 E.22445
G1 X108.083 Y119.788
G1 X102.917 Y124.953 E.22445
G1 X102.917 Y124.419
G1 X108.083 Y119.254 E.22445
G1 X108.083 Y118.721
G1 X102.917 Y123.886 E.22445
G1 X102.917 Y123.353
G1 X108.083 Y118.188 E.22445
G1 X108.083 Y117.654
G1 X102.917 Y122.82 E.22445
G1 X102.917 Y122.286
G1 X108.083 Y117.121 E.22445
G1 X108.083 Y116.588
G1 X102.917 Y121.753 E.22445
G1 X102.917 Y121.22
G1 X108.083 Y116.055 E.22445
G1 X108.083 Y115.521
G1 X102.917 Y120.687 E.22445
G1 X102.917 Y120.153
G1 X108.083 Y114.988 E.22445
G1 X108.083 Y114.455
G1 X102.917 Y119.62 E.22445
G1 X102.917 Y119.087
G1 X108.083 Y113.922 E.22445
G1 X108.083 Y113.388
G1 X102.917 Y118.554 E.22445
G1 X102.917 Y118.02
G1 X108.083 Y112.855 E.22445
G1 X108.083 Y112.322
G1 X102.917 Y117.487 E.22445
G1 X102.917 Y116.954
G1 X108.083 Y111.789 E.22445
G1 X108.083 Y111.255
G1 X102.917 Y116.42 E.22445
G1 X102.917 Y115.887
G1 X108.083 Y110.722 E.22445
G1 X108.083 Y110.189
G1 X102.917 Y115.354 E.22445
G1 X102.917 Y114.821
G1 X108.083 Y109.655 E.22445
M73 P66 R6
G1 X108.083 Y109.122
G1 X102.917 Y114.287 E.22445
G1 X102.917 Y113.754
G1 X108.083 Y108.589 E.22445
G1 X108.083 Y108.056
G1 X102.917 Y113.221 E.22445
G1 X102.917 Y112.688
G1 X108.083 Y107.522 E.22445
G1 X108.083 Y106.989
G1 X102.917 Y112.154 E.22445
G1 X102.917 Y111.621
G1 X108.083 Y106.456 E.22445
G1 X108.083 Y105.923
G1 X102.917 Y111.088 E.22445
G1 X102.917 Y110.554
G1 X108.083 Y105.389 E.22445
G1 X108.083 Y104.856
G1 X102.917 Y110.021 E.22445
G1 X102.917 Y109.488
G1 X108.083 Y104.323 E.22445
G1 X108.083 Y103.789
G1 X102.917 Y108.955 E.22445
G1 X102.917 Y108.421
G1 X108.083 Y103.256 E.22445
G1 X107.682 Y103.123
G1 X102.917 Y107.888 E.20705
G1 X102.917 Y107.355
G1 X107.149 Y103.123 E.18388
G1 X106.616 Y103.123
G1 X102.917 Y106.822 E.16071
G1 X102.917 Y106.288
G1 X106.082 Y103.123 E.13753
G1 X105.549 Y103.123
G1 X102.917 Y105.755 E.11436
G1 X102.917 Y105.222
G1 X105.016 Y103.123 E.09119
G1 X104.483 Y103.123
G1 X102.917 Y104.689 E.06801
G1 X102.917 Y104.155
G1 X103.949 Y103.123 E.04484
G1 X103.416 Y103.123
G1 X102.917 Y103.622 E.02167
M204 S10000
G1 X102.906 Y102.991 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.255134
G1 F15000
G1 X108.094 Y102.991 E.08971
; WIPE_START
G1 F24000
G1 X106.094 Y102.991 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I0 J1.217 P1  F30000
G1 X151.906 Y102.991 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15000
G1 X157.094 Y102.991 E.08971
; CHANGE_LAYER
; Z_HEIGHT: 4.54286
; LAYER_HEIGHT: 0.142857
; WIPE_START
G1 F24000
G1 X155.094 Y102.991 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/64
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
G3 Z4.8 I.367 J1.16 P1  F30000
G1 X157.889 Y102.106 Z4.8
G1 Z4.543
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F5701
G1 X158.771 Y102.106 E.0337
G1 X158.771 Y104.983 E.10997
G1 X158.039 Y104.983 E.02799
G1 X158.039 Y107.86 E.10997
G1 X158.771 Y107.86 E.02799
G1 X158.771 Y110.738 E.10997
G1 X158.039 Y110.738 E.02799
G1 X158.039 Y113.615 E.10997
G1 X158.771 Y113.615 E.02799
G1 X158.771 Y116.492 E.10997
G1 X158.039 Y116.492 E.02799
G1 X158.039 Y119.369 E.10997
G1 X158.771 Y119.369 E.02799
G1 X158.771 Y122.246 E.10997
G1 X158.039 Y122.246 E.02799
G1 X158.039 Y125.123 E.10997
G1 X158.771 Y125.123 E.02799
G1 X158.771 Y128 E.10997
G1 X158.039 Y128 E.02799
G1 X158.039 Y130.877 E.10997
G1 X158.771 Y130.877 E.02799
G1 X158.771 Y133.754 E.10997
G1 X157.448 Y133.754 E.05057
; WIPE_START
G1 F24000
G1 X158.771 Y133.754 E-.50281
G1 X158.771 Y133.077 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.943 I.276 J-1.185 P1  F30000
G1 X150.14 Y131.066 Z4.943
G1 Z4.543
G1 E.8 F1800
G1 F5701
G1 X150.14 Y133.727 E.10173
G2 X150.961 Y131.397 I-21.705 J-8.965 E.0945
G1 X150.961 Y130.877 E.01986
G1 X150.14 Y130.877 E.03141
G1 X150.14 Y128 E.10997
G1 X150.961 Y128 E.03141
G1 X150.961 Y125.123 E.10997
G1 X150.14 Y125.123 E.03141
G1 X150.14 Y122.246 E.10997
G1 X150.961 Y122.246 E.03141
G1 X150.961 Y119.369 E.10997
G1 X150.14 Y119.369 E.03141
G1 X150.14 Y116.492 E.10997
G1 X150.961 Y116.492 E.03141
G1 X150.961 Y113.615 E.10997
G1 X150.14 Y113.615 E.03141
G1 X150.14 Y110.738 E.10997
G1 X150.961 Y110.738 E.03141
G1 X150.961 Y107.86 E.10997
G1 X150.14 Y107.86 E.03141
G1 X150.14 Y104.983 E.10997
G1 X150.961 Y104.983 E.03141
G1 X150.961 Y102.256 E.10426
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.943 I-.676 J-1.012 P1  F30000
G1 X109.039 Y131.066 Z4.943
G1 Z4.543
G1 E.8 F1800
G1 F5701
G2 X109.715 Y133.386 I7.867 J-1.036 E.09274
G1 X109.86 Y133.727 E.01419
G1 X109.86 Y130.877 E.10894
G1 X109.039 Y130.877 E.03141
G1 X109.039 Y128 E.10997
G1 X109.86 Y128 E.03141
G1 X109.86 Y125.123 E.10997
G1 X109.039 Y125.123 E.03141
G1 X109.039 Y122.246 E.10997
G1 X109.86 Y122.246 E.03141
G1 X109.86 Y119.369 E.10997
G1 X109.039 Y119.369 E.03141
G1 X109.039 Y116.492 E.10997
G1 X109.86 Y116.492 E.03141
G1 X109.86 Y113.615 E.10997
G1 X109.039 Y113.615 E.03141
G1 X109.039 Y110.738 E.10997
G1 X109.86 Y110.738 E.03141
G1 X109.86 Y107.86 E.10997
G1 X109.039 Y107.86 E.03141
G1 X109.039 Y104.983 E.10997
G1 X109.86 Y104.983 E.03141
G1 X109.86 Y102.106 E.10997
G1 X108.889 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.943 I.144 J-1.208 P1  F30000
G1 X101.229 Y102.106 Z4.943
G1 Z4.543
G1 E.8 F1800
G1 F5701
G1 X102.111 Y102.106 E.0337
G1 X101.961 Y102.256 E.00807
G1 X101.961 Y104.983 E.10426
G1 X101.229 Y104.983 E.02799
G1 X101.229 Y107.86 E.10997
G1 X101.961 Y107.86 E.02799
G1 X101.961 Y110.738 E.10997
G1 X101.229 Y110.738 E.02799
G1 X101.229 Y113.615 E.10997
G1 X101.961 Y113.615 E.02799
G1 X101.961 Y116.492 E.10997
G1 X101.229 Y116.492 E.02799
G1 X101.229 Y119.369 E.10997
M73 P66 R5
G1 X101.961 Y119.369 E.02799
G1 X101.961 Y122.246 E.10997
G1 X101.229 Y122.246 E.02799
G1 X101.229 Y125.123 E.10997
G1 X101.961 Y125.123 E.02799
G1 X101.961 Y128 E.10997
G1 X101.229 Y128 E.02799
G1 X101.229 Y130.877 E.10997
G1 X101.961 Y130.877 E.02799
G1 X101.914 Y131.354 E.01831
G2 X102.552 Y133.754 I24.864 J-5.327 E.09497
G1 X101.229 Y133.754 E.05057
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0571427
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.378 Y133.1 E-.25719
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/64
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
G3 Z4.943 I.603 J1.057 P1  F30000
G1 X154.5 Y103.377 Z4.943
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5701
G1 X152.102 Y103.377 E.07954
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.377 E.00981
G1 X154.56 Y103.377 E.07755
G1 X154.5 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5701
G1 X151.71 Y103.769 E.08573
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.769 E.03319
G1 X154.56 Y103.769 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y103.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.01 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5701
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5701
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5701
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.724 E2.42171
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.383 E1.91434
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5701
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.336 E2.30613
G1 X108.346 Y131.689 E.17136
G1 X108.632 Y132.608 E.02958
G2 X151.638 Y131.746 I21.366 J-7.259 E1.7519
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5701
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-10.492 J-20.835 E.18414
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.229 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.114 E.16795
G1 X137.061 Y151.643 E.90158
M73 P67 R5
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/64
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
G3 Z5 I1.11 J-.5 P1  F30000
G1 X108.889 Y131.066 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X108.889 Y131.096 E.00116
G3 X109.341 Y132.367 I-4.174 J2.202 E.05175
G2 X109.86 Y133.727 I13.92 J-4.535 E.05567
G1 X109.86 Y130.877 E.10894
G1 X108.889 Y130.877 E.03715
G1 X108.889 Y128 E.10997
G1 X109.86 Y128 E.03715
G1 X109.86 Y125.123 E.10997
G1 X108.889 Y125.123 E.03715
G1 X108.889 Y122.246 E.10997
G1 X109.86 Y122.246 E.03715
G1 X109.86 Y119.369 E.10997
G1 X108.889 Y119.369 E.03715
G1 X108.889 Y116.492 E.10997
G1 X109.86 Y116.492 E.03715
G1 X109.86 Y113.615 E.10997
G1 X108.889 Y113.615 E.03715
G1 X108.889 Y110.738 E.10997
G1 X109.86 Y110.738 E.03715
G1 X109.86 Y107.86 E.10997
G1 X108.889 Y107.86 E.03715
G1 X108.889 Y104.983 E.10997
G1 X109.86 Y104.983 E.03715
G1 X109.86 Y102.106 E.10997
G1 X108.889 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.215 J-.07 P1  F30000
G1 X108.262 Y130.94 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X108.731 Y130.98 E.01449
G1 X108.731 Y104.509 E.8134
G1 X108.073 Y104.517 E.02023
G1 X108.073 Y130.94 E.8119
G1 X107.196 Y130.94 E.02695
G1 X107.196 Y104.517 E.8119
G1 X106.319 Y104.517 E.02695
G1 X106.319 Y130.94 E.8119
G1 X105.442 Y130.94 E.02695
G1 X105.442 Y104.517 E.8119
G1 X104.565 Y104.517 E.02695
G1 X104.565 Y130.94 E.8119
G1 X103.688 Y130.94 E.02695
G1 X103.688 Y104.517 E.8119
G1 X102.811 Y104.517 E.02695
G1 X102.811 Y130.94 E.8119
G1 X102.269 Y130.94 E.01665
G1 X102.269 Y104.509 E.81216
G1 X102.622 Y104.517 E.01086
; WIPE_START
G1 F24000
G1 X102.269 Y104.509 E-.13436
G1 X102.269 Y106.155 E-.62564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.179 J-.303 P1  F30000
G1 X101.229 Y102.106 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X102.111 Y102.106 E.0337
G1 X101.961 Y102.256 E.00807
G1 X101.961 Y104.202 E.07438
G1 X102.111 Y104.352 E.00811
G1 X102.111 Y104.983 E.02414
G1 X101.229 Y104.983 E.03372
G1 X101.229 Y107.86 E.10997
G1 X102.111 Y107.86 E.03372
G1 X102.111 Y110.738 E.10997
G1 X101.229 Y110.738 E.03372
G1 X101.229 Y113.615 E.10997
G1 X102.111 Y113.615 E.03372
G1 X102.111 Y116.492 E.10997
G1 X101.229 Y116.492 E.03372
G1 X101.229 Y119.369 E.10997
G1 X102.111 Y119.369 E.03372
G1 X102.111 Y122.246 E.10997
G1 X101.229 Y122.246 E.03372
G1 X101.229 Y125.123 E.10997
G1 X102.111 Y125.123 E.03372
G1 X102.111 Y128 E.10997
G1 X101.229 Y128 E.03372
G1 X101.229 Y130.877 E.10997
G1 X102.111 Y130.877 E.03372
G3 X101.914 Y131.354 I-.404 J.112 E.02125
G2 X102.552 Y133.754 I24.864 J-5.328 E.09497
G1 X101.229 Y133.754 E.05057
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.378 Y133.1 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.052 J1.216 P1  F30000
G1 X150.14 Y131.066 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F9000
G1 X150.14 Y133.727 E.10173
G3 X151.111 Y131.096 I57.402 J19.707 E.10722
G1 X151.111 Y130.877 E.00837
G1 X150.14 Y130.877 E.03715
G1 X150.14 Y128 E.10997
G1 X151.111 Y128 E.03715
G1 X151.111 Y125.123 E.10997
G1 X150.14 Y125.123 E.03715
G1 X150.14 Y122.246 E.10997
G1 X151.111 Y122.246 E.03715
G1 X151.111 Y119.369 E.10997
G1 X150.14 Y119.369 E.03715
G1 X150.14 Y116.492 E.10997
G1 X151.111 Y116.492 E.03715
G1 X151.111 Y113.615 E.10997
G1 X150.14 Y113.615 E.03715
G1 X150.14 Y110.738 E.10997
G1 X151.111 Y110.738 E.03715
G1 X151.111 Y107.86 E.10997
G1 X150.14 Y107.86 E.03715
G1 X150.14 Y104.983 E.10997
G1 X151.111 Y104.983 E.03715
G1 X151.111 Y104.352 E.02414
G1 X150.961 Y104.202 E.00811
M73 P68 R5
G1 X150.961 Y102.256 E.07438
G1 X151.111 Y102.106 E.00807
G1 X150.14 Y102.106 E.03712
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.072 J.577 P1  F30000
G1 X151.738 Y104.517 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X151.269 Y104.509 E.01444
G1 X151.269 Y130.98 E.8134
G1 X151.927 Y130.94 E.02027
G1 X151.927 Y104.517 E.8119
G1 X152.804 Y104.517 E.02695
G1 X152.804 Y130.94 E.8119
G1 X153.681 Y130.94 E.02695
G1 X153.681 Y104.517 E.8119
G1 X154.558 Y104.517 E.02695
G1 X154.558 Y130.94 E.8119
G1 X155.435 Y130.94 E.02695
G1 X155.435 Y104.517 E.8119
G1 X156.312 Y104.517 E.02695
G1 X156.312 Y130.94 E.8119
G1 X157.189 Y130.94 E.02695
G1 X157.189 Y104.517 E.8119
G1 X157.731 Y104.509 E.01666
G1 X157.731 Y130.94 E.81216
G1 X157.378 Y130.94 E.01086
; WIPE_START
G1 F24000
G1 X157.731 Y130.94 E-.13432
G1 X157.731 Y129.294 E-.62568
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.215 J-.077 P1  F30000
G1 X157.448 Y133.754 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X158.771 Y133.754 E.05057
G1 X158.771 Y130.877 E.10997
G1 X157.889 Y130.877 E.03372
G1 X157.889 Y128 E.10997
G1 X158.771 Y128 E.03372
G1 X158.771 Y125.123 E.10997
G1 X157.889 Y125.123 E.03372
G1 X157.889 Y122.246 E.10997
G1 X158.771 Y122.246 E.03372
G1 X158.771 Y119.369 E.10997
G1 X157.889 Y119.369 E.03372
G1 X157.889 Y116.492 E.10997
G1 X158.771 Y116.492 E.03372
G1 X158.771 Y113.615 E.10997
G1 X157.889 Y113.615 E.03372
G1 X157.889 Y110.738 E.10997
G1 X158.771 Y110.738 E.03372
G1 X158.771 Y107.86 E.10997
G1 X157.889 Y107.86 E.03372
G1 X157.889 Y104.983 E.10997
G1 X158.771 Y104.983 E.03372
G1 X158.771 Y102.106 E.10997
G1 X157.889 Y102.106 E.0337
; WIPE_START
G1 F24000
G1 X158.771 Y102.106 E-.33503
G1 X158.771 Y103.225 E-.42497
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.043 J-1.216 P1  F30000
G1 X154.5 Y103.377 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y103.377 E.07954
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.377 E.00981
G1 X154.56 Y103.377 E.07755
G1 X154.5 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y103.769 E.08573
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.769 E.03319
G1 X154.56 Y103.769 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y103.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.01 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.713 E2.42219
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.376 E1.91458
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.325 E2.30658
G1 X108.346 Y131.689 E.17136
G1 X108.632 Y132.608 E.02958
G2 X151.638 Y131.746 I21.366 J-7.258 E1.75191
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.384 Y149.06 I-6.934 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-6.94 J-25.525 E.03289
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/64
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
G3 Z5.2 I.937 J.776 P1  F30000
G1 X154.5 Y103.377 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4043
G1 X152.102 Y103.377 E.07954
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.377 E.00981
G1 X154.56 Y103.377 E.07755
G1 X154.5 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4043
G1 X151.71 Y103.769 E.08573
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.769 E.03319
G1 X154.56 Y103.769 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y103.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.01 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4043
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4043
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4043
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.724 E2.42171
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.376 E1.91458
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4043
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.336 E2.30613
G1 X108.346 Y131.689 E.17136
G1 X108.632 Y132.608 E.02958
G2 X151.638 Y131.746 I21.366 J-7.258 E1.75191
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4043
G2 X143.384 Y149.06 I-6.934 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
M73 P69 R5
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 5.04
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/64
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
G3 Z5.4 I1.115 J-.488 P1  F30000
G1 X109.108 Y131.066 Z5.4
G1 Z5.04
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F9000
G2 X109.341 Y132.367 I2.203 J.278 E.04837
G2 X109.86 Y133.727 I13.92 J-4.535 E.05249
G1 X109.86 Y130.877 E.1027
G1 X109.108 Y130.877 E.0271
G1 X109.108 Y128 E.10367
G1 X109.86 Y128 E.0271
G1 X109.86 Y125.123 E.10367
G1 X109.108 Y125.123 E.0271
G1 X109.108 Y122.246 E.10367
G1 X109.86 Y122.246 E.0271
G1 X109.86 Y119.369 E.10367
G1 X109.108 Y119.369 E.0271
G1 X109.108 Y116.492 E.10367
G1 X109.86 Y116.492 E.0271
G1 X109.86 Y113.615 E.10367
G1 X109.108 Y113.615 E.0271
G1 X109.109 Y110.738 E.10367
G1 X109.86 Y110.738 E.0271
G1 X109.86 Y107.86 E.10367
G1 X109.109 Y107.86 E.02709
G1 X109.109 Y104.983 E.10367
G1 X109.86 Y104.983 E.02709
G1 X109.86 Y102.106 E.10367
G1 X108.889 Y102.106 E.035
; WIPE_START
G1 F24000
G1 X109.86 Y102.106 E-.36909
G1 X109.86 Y103.135 E-.39091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.44 I-1.215 J-.07 P1  F30000
G1 X108.262 Y130.94 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X108.731 Y130.98 E.01699
G1 X108.731 Y104.509 E.95386
G1 X108.073 Y104.517 E.02373
G1 X108.073 Y130.94 E.9521
G1 X107.196 Y130.94 E.0316
G1 X107.196 Y104.517 E.9521
G1 X106.319 Y104.517 E.0316
G1 X106.319 Y130.94 E.9521
G1 X105.442 Y130.94 E.0316
G1 X105.442 Y104.517 E.9521
G1 X104.565 Y104.517 E.0316
G1 X104.565 Y130.94 E.9521
G1 X103.688 Y130.94 E.0316
G1 X103.688 Y104.517 E.9521
G1 X102.811 Y104.517 E.0316
G1 X102.811 Y130.94 E.9521
G1 X102.269 Y130.94 E.01953
G1 X102.269 Y104.509 E.95241
G1 X102.622 Y104.517 E.01274
; WIPE_START
G1 F24000
G1 X102.269 Y104.509 E-.13437
G1 X102.269 Y106.155 E-.62563
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.44 I1.179 J-.303 P1  F30000
G1 X101.229 Y102.106 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X102.111 Y102.106 E.03177
G1 X101.961 Y102.256 E.00761
G1 X101.891 Y104.983 E.09832
G1 X101.229 Y104.983 E.02386
G1 X101.229 Y107.86 E.10367
G1 X101.891 Y107.86 E.02386
G1 X101.891 Y110.738 E.10367
G1 X101.229 Y110.738 E.02386
G1 X101.229 Y113.615 E.10367
G1 X101.891 Y113.615 E.02386
G1 X101.891 Y116.492 E.10367
G1 X101.229 Y116.492 E.02386
G1 X101.229 Y119.369 E.10367
G1 X101.891 Y119.369 E.02386
G1 X101.891 Y122.246 E.10367
G1 X101.229 Y122.246 E.02386
G1 X101.229 Y125.123 E.10367
G1 X101.891 Y125.123 E.02386
G1 X101.891 Y128 E.10367
G1 X101.229 Y128 E.02386
G1 X101.229 Y130.877 E.10367
G1 X101.891 Y130.877 E.02386
G1 X101.891 Y131.731 E.03076
G1 X102.046 Y131.885 E.00788
G2 X102.552 Y133.754 I19.381 J-4.247 E.06979
G1 X101.229 Y133.754 E.04768
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.50281
G1 X102.375 Y133.101 E-.25719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.44 I.052 J1.216 P1  F30000
G1 X150.14 Y131.066 Z5.44
M73 P70 R5
G1 Z5.04
G1 E.8 F1800
G1 F9000
G1 X150.14 Y133.727 E.09591
G2 X150.891 Y131.621 I-20.851 J-8.631 E.08061
G1 X150.891 Y130.877 E.02681
G1 X150.14 Y130.877 E.02709
G1 X150.14 Y128 E.10367
G1 X150.891 Y128 E.02709
G1 X150.891 Y125.123 E.10367
G1 X150.14 Y125.123 E.02709
G1 X150.14 Y122.246 E.10367
G1 X150.891 Y122.246 E.02709
G1 X150.891 Y119.369 E.10367
G1 X150.14 Y119.369 E.02709
G1 X150.14 Y116.492 E.10367
G1 X150.891 Y116.492 E.02709
G1 X150.891 Y113.615 E.10367
G1 X150.14 Y113.615 E.02709
G1 X150.14 Y110.738 E.10367
G1 X150.891 Y110.738 E.02709
G1 X150.891 Y107.86 E.10367
G1 X150.14 Y107.86 E.02709
G1 X150.14 Y104.983 E.10367
G1 X150.891 Y104.983 E.02709
G1 X150.961 Y102.256 E.09832
G1 X151.111 Y102.106 E.00761
G1 X150.14 Y102.106 E.035
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.94 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.44 I-1.065 J.588 P1  F30000
G1 X151.738 Y104.517 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X151.269 Y104.509 E.01694
G1 X151.269 Y130.98 E.95386
G1 X151.927 Y130.94 E.02377
G1 X151.927 Y104.517 E.9521
G1 X152.804 Y104.517 E.0316
G1 X152.804 Y130.94 E.9521
G1 X153.681 Y130.94 E.0316
G1 X153.681 Y104.517 E.9521
G1 X154.558 Y104.517 E.0316
G1 X154.558 Y130.94 E.9521
G1 X155.435 Y130.94 E.0316
G1 X155.435 Y104.517 E.9521
G1 X156.312 Y104.517 E.0316
G1 X156.312 Y130.94 E.9521
G1 X157.189 Y130.94 E.0316
G1 X157.189 Y104.517 E.9521
G1 X157.731 Y104.509 E.01953
G1 X157.731 Y130.94 E.95241
G1 X157.378 Y130.94 E.01274
; WIPE_START
G1 F24000
G1 X157.731 Y130.94 E-.13433
G1 X157.731 Y129.294 E-.62567
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.44 I-1.215 J-.077 P1  F30000
G1 X157.448 Y133.754 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X158.771 Y133.754 E.04768
G1 X158.771 Y130.877 E.10367
G1 X158.109 Y130.877 E.02386
G1 X158.109 Y128 E.10367
G1 X158.771 Y128 E.02386
G1 X158.771 Y125.123 E.10367
G1 X158.109 Y125.123 E.02386
G1 X158.109 Y122.246 E.10367
G1 X158.771 Y122.246 E.02386
G1 X158.771 Y119.369 E.10367
G1 X158.109 Y119.369 E.02386
G1 X158.109 Y116.492 E.10367
G1 X158.771 Y116.492 E.02386
G1 X158.771 Y113.615 E.10367
G1 X158.109 Y113.615 E.02386
G1 X158.109 Y110.738 E.10367
G1 X158.771 Y110.738 E.02386
G1 X158.771 Y107.86 E.10367
G1 X158.109 Y107.86 E.02386
G1 X158.109 Y104.983 E.10367
G1 X158.771 Y104.983 E.02386
G1 X158.771 Y102.106 E.10367
G1 X157.889 Y102.106 E.03177
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X158.771 Y102.106 E-.33503
G1 X158.771 Y103.225 E-.42497
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/64
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
G3 Z5.44 I-.043 J-1.216 P1  F30000
G1 X154.5 Y103.377 Z5.44
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y103.377 E.07954
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.377 E.00981
G1 X154.56 Y103.377 E.07755
G1 X154.5 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y103.769 E.08573
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.769 E.03319
G1 X154.56 Y103.769 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y103.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.01 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.724 E2.42171
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.376 E1.91458
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.336 E2.30613
G1 X108.346 Y131.689 E.17136
G1 X108.35 Y131.703 E.00045
G2 X151.638 Y131.746 I21.65 J-6.351 E1.78098
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 5.28
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/64
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
G3 Z5.6 I1.11 J-.498 P1  F30000
G1 X108.971 Y131.179 Z5.6
G1 Z5.28
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F6434
G1 X109.079 Y131.526 E.01311
G2 X109.86 Y133.727 I21.955 J-6.556 E.0842
G1 X109.86 Y130.877 E.1027
G1 X101.229 Y130.877 E.31101
G1 X101.229 Y128 E.10367
G1 X109.86 Y128 E.31101
G1 X109.86 Y125.123 E.10367
G1 X101.229 Y125.123 E.31101
G1 X101.229 Y122.246 E.10367
G1 X109.86 Y122.246 E.31101
G1 X109.86 Y119.369 E.10367
G1 X101.229 Y119.369 E.31101
M73 P71 R5
G1 X101.229 Y116.492 E.10367
G1 X109.86 Y116.492 E.31101
G1 X109.86 Y113.615 E.10367
G1 X101.229 Y113.615 E.31101
G1 X101.229 Y110.738 E.10367
G1 X109.86 Y110.738 E.31101
G1 X109.86 Y107.86 E.10367
G1 X101.229 Y107.86 E.31101
G1 X101.229 Y104.983 E.10367
G1 X109.86 Y104.983 E.31101
G1 X109.86 Y102.106 E.10367
G1 X108.889 Y102.106 E.035
G1 X109.039 Y102.256 E.00761
G1 X109.039 Y104.202 E.07013
G1 X108.723 Y104.517 E.01608
G1 X102.277 Y104.517 E.23228
G1 X101.961 Y104.202 E.01608
G1 X101.961 Y102.256 E.07013
G1 X102.111 Y102.106 E.00761
G1 X101.229 Y102.106 E.03177
G1 X101.229 Y131.066 F30000
G1 F6434
G1 X101.229 Y133.754 E.09688
G1 X102.552 Y133.754 E.04768
G3 X101.914 Y131.354 I24.226 J-7.728 E.08953
G1 X102.051 Y131.179 E.00801
; WIPE_START
G1 F24000
G1 X101.914 Y131.354 E-.08447
G1 X102.371 Y133.072 E-.67553
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.68 I-.015 J1.217 P1  F30000
G1 X157.448 Y133.754 Z5.68
G1 Z5.28
G1 E.8 F1800
G1 F6434
G1 X158.771 Y133.754 E.04768
G1 X158.771 Y130.877 E.10367
G1 X150.14 Y130.877 E.31101
G1 X150.14 Y128 E.10367
G1 X158.771 Y128 E.31101
G1 X158.771 Y125.123 E.10367
G1 X150.14 Y125.123 E.31101
G1 X150.14 Y122.246 E.10367
G1 X158.771 Y122.246 E.31101
G1 X158.771 Y119.369 E.10367
G1 X150.14 Y119.369 E.31101
G1 X150.14 Y116.492 E.10367
G1 X158.771 Y116.492 E.31101
G1 X158.771 Y113.615 E.10367
G1 X150.14 Y113.615 E.31101
G1 X150.14 Y110.738 E.10367
G1 X158.771 Y110.738 E.31101
G1 X158.771 Y107.86 E.10367
G1 X150.14 Y107.86 E.31101
G1 X150.14 Y104.983 E.10367
G1 X158.771 Y104.983 E.31101
G1 X158.771 Y102.106 E.10367
G1 X157.889 Y102.106 E.03177
G1 X158.039 Y102.256 E.00761
G1 X158.039 Y104.202 E.07013
G1 X157.723 Y104.517 E.01608
G1 X151.277 Y104.517 E.23228
G1 X150.961 Y104.202 E.01608
G1 X150.961 Y102.256 E.07013
G1 X151.111 Y102.106 E.00761
G1 X150.14 Y102.106 E.035
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/64
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
G3 Z5.68 I-.104 J1.213 P1  F30000
G1 X154.5 Y103.377 Z5.68
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6434
G1 X152.102 Y103.377 E.07954
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.377 E.00981
G1 X154.56 Y103.377 E.07755
G1 X154.5 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6434
G1 X151.71 Y103.769 E.08573
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.769 E.03319
G1 X154.56 Y103.769 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y103.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.01 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6434
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6434
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6434
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.724 E2.42171
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.383 E1.91433
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6434
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.336 E2.30613
G1 X108.346 Y131.689 E.17136
G1 X108.364 Y131.749 E.00194
G2 X151.638 Y131.746 I21.636 J-6.396 E1.77949
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6434
G2 X143.384 Y149.06 I-6.934 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.229 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.289 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 5.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/64
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
G3 Z5.8 I1.11 J-.498 P1  F30000
G1 X108.971 Y131.179 Z5.8
G1 Z5.52
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F6434
G1 X109.079 Y131.526 E.01311
G2 X109.86 Y133.727 I21.955 J-6.556 E.0842
G1 X109.86 Y130.877 E.1027
G1 X101.229 Y130.877 E.31101
G1 X101.229 Y128 E.10367
G1 X109.86 Y128 E.31101
G1 X109.86 Y125.123 E.10367
G1 X101.229 Y125.123 E.31101
G1 X101.229 Y122.246 E.10367
G1 X109.86 Y122.246 E.31101
G1 X109.86 Y119.369 E.10367
G1 X101.229 Y119.369 E.31101
G1 X101.229 Y116.492 E.10367
G1 X109.86 Y116.492 E.31101
G1 X109.86 Y113.615 E.10367
G1 X101.229 Y113.615 E.31101
G1 X101.229 Y110.738 E.10367
G1 X109.86 Y110.738 E.31101
G1 X109.86 Y107.86 E.10367
G1 X101.229 Y107.86 E.31101
G1 X101.229 Y104.983 E.10367
G1 X109.86 Y104.983 E.31101
G1 X109.86 Y102.106 E.10367
G1 X108.889 Y102.106 E.035
G1 X109.039 Y102.256 E.00761
G1 X109.039 Y104.202 E.07013
G1 X108.723 Y104.517 E.01608
G1 X102.277 Y104.517 E.23228
G1 X101.961 Y104.202 E.01608
G1 X101.961 Y102.256 E.07013
G1 X102.111 Y102.106 E.00761
G1 X101.229 Y102.106 E.03177
G1 X101.229 Y131.066 F30000
G1 F6434
M73 P72 R5
G1 X101.229 Y133.754 E.09688
G1 X102.552 Y133.754 E.04768
G3 X101.914 Y131.354 I24.226 J-7.728 E.08953
G1 X102.051 Y131.179 E.00801
; WIPE_START
G1 F24000
G1 X101.914 Y131.354 E-.08447
G1 X102.371 Y133.072 E-.67553
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.92 I-.015 J1.217 P1  F30000
G1 X157.448 Y133.754 Z5.92
G1 Z5.52
G1 E.8 F1800
G1 F6434
G1 X158.771 Y133.754 E.04768
G1 X158.771 Y130.877 E.10367
G1 X150.14 Y130.877 E.31101
G1 X150.14 Y128 E.10367
G1 X158.771 Y128 E.31101
G1 X158.771 Y125.123 E.10367
G1 X150.14 Y125.123 E.31101
G1 X150.14 Y122.246 E.10367
G1 X158.771 Y122.246 E.31101
G1 X158.771 Y119.369 E.10367
G1 X150.14 Y119.369 E.31101
G1 X150.14 Y116.492 E.10367
G1 X158.771 Y116.492 E.31101
G1 X158.771 Y113.615 E.10367
G1 X150.14 Y113.615 E.31101
G1 X150.14 Y110.738 E.10367
G1 X158.771 Y110.738 E.31101
G1 X158.771 Y107.86 E.10367
G1 X150.14 Y107.86 E.31101
G1 X150.14 Y104.983 E.10367
G1 X158.771 Y104.983 E.31101
G1 X158.771 Y102.106 E.10367
G1 X157.889 Y102.106 E.03177
G1 X158.039 Y102.256 E.00761
G1 X158.039 Y104.202 E.07013
G1 X157.723 Y104.517 E.01608
G1 X151.277 Y104.517 E.23228
G1 X150.961 Y104.202 E.01608
G1 X150.961 Y102.256 E.07013
G1 X151.111 Y102.106 E.00761
G1 X150.14 Y102.106 E.035
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X151.111 Y102.106 E-.36909
G1 X150.961 Y102.256 E-.08028
G1 X150.961 Y103.073 E-.31063
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/64
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
G3 Z5.92 I-.104 J1.213 P1  F30000
G1 X154.5 Y103.377 Z5.92
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6434
G1 X152.102 Y103.377 E.07954
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.377 E.00981
G1 X154.56 Y103.377 E.07755
G1 X154.5 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6434
G1 X151.71 Y103.769 E.08573
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.769 E.03319
G1 X154.56 Y103.769 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y103.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.01 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z6
M73 P72 R4
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6434
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6434
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6434
G1 X156.73 Y132.081 E.15879
G3 X155.74 Y135.237 I-28.721 J-7.277 E.10978
G1 X155.54 Y135.721 E.01737
G3 X103.27 Y132.081 I-25.54 J-10.365 E2.29457
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.376 E1.91458
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6434
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.336 E2.30613
G1 X108.346 Y131.689 E.17136
G1 X108.379 Y131.795 E.00342
G2 X151.638 Y131.746 I21.622 J-6.442 E1.77799
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6434
G2 X143.384 Y149.06 I-6.935 J-15.046 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.289 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S247.35
; CHANGE_LAYER
; Z_HEIGHT: 5.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/64
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
G3 Z6 I1.103 J-.514 P1  F30000
G1 X109.827 Y133.649 Z6
G1 Z5.76
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F4800
G1 X109.827 Y102.106 E1.13659
G1 X108.95 Y102.106 E.0316
G2 X109.039 Y102.256 I.119 J.03 E.00695
G1 X109.039 Y104.202 E.07013
G1 X108.95 Y104.29 E.00451
G1 X108.95 Y131.141 E.96753
G1 X109.108 Y131.618 E.0181
; WIPE_START
G1 F24000
G1 X108.95 Y131.141 E-.19093
G1 X108.95 Y129.644 E-.56907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.16 I-.628 J-1.043 P1  F30000
G1 X102.122 Y133.754 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F4800
G1 X102.552 Y133.754 E.01551
G3 X102.235 Y132.646 I11.27 J-3.825 E.04156
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.55343
G1 X102.122 Y133.754 E-.20657
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.16 I1.213 J-.098 P1  F30000
G1 X101.933 Y131.432 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F4800
G1 X101.933 Y133.754 E.08367
G1 X101.229 Y133.754 E.02538
G1 X101.229 Y102.106 E1.14038
G1 X101.933 Y102.106 E.02538
G1 X101.933 Y131.329 E1.05299
G1 X102.237 Y130.94 E.01778
G1 X102.811 Y130.94 E.02065
G1 X102.811 Y104.517 E.9521
G1 X103.688 Y104.517 E.0316
G1 X103.688 Y130.94 E.9521
G1 X104.565 Y130.94 E.0316
G1 X104.565 Y104.517 E.9521
G1 X105.442 Y104.517 E.0316
G1 X105.442 Y130.94 E.9521
G1 X106.319 Y130.94 E.0316
M73 P73 R4
G1 X106.319 Y104.517 E.9521
G1 X107.196 Y104.517 E.0316
G1 X107.196 Y130.94 E.9521
G1 X108.073 Y130.94 E.0316
G1 X108.073 Y104.517 E.9521
G1 X108.723 Y104.517 E.02342
G1 X108.817 Y104.424 E.00478
; WIPE_START
G1 F24000
G1 X108.723 Y104.517 E-.05037
G1 X108.073 Y104.517 E-.24701
G1 X108.073 Y105.735 E-.46262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.16 I.037 J1.216 P1  F30000
G1 X151.183 Y104.424 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F4800
G1 X151.277 Y104.517 E.00478
G1 X151.927 Y104.517 E.02342
G1 X151.927 Y130.94 E.9521
G1 X152.804 Y130.94 E.0316
G1 X152.804 Y104.517 E.9521
G1 X153.681 Y104.517 E.0316
G1 X153.681 Y130.94 E.9521
G1 X154.558 Y130.94 E.0316
G1 X154.558 Y104.517 E.9521
G1 X155.435 Y104.517 E.0316
G1 X155.435 Y130.94 E.9521
G1 X156.312 Y130.94 E.0316
G1 X156.312 Y104.517 E.9521
G1 X157.189 Y104.517 E.0316
G1 X157.189 Y130.94 E.9521
G1 X157.763 Y130.94 E.02065
G1 X158.067 Y131.329 E.01778
G1 X158.067 Y102.106 E1.05299
G1 X158.771 Y102.106 E.02538
G1 X158.771 Y133.754 E1.14038
G1 X158.067 Y133.754 E.02538
G1 X158.067 Y131.432 E.08367
; WIPE_START
G1 F24000
G1 X158.067 Y133.432 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.16 I1.136 J-.436 P1  F30000
G1 X157.765 Y132.646 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F4800
G3 X157.448 Y133.754 I-11.588 J-2.717 E.04156
G1 X157.878 Y133.754 E.01551
; WIPE_START
G1 F24000
G1 X157.448 Y133.754 E-.20657
G1 X157.765 Y132.646 E-.55343
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.16 I-.037 J-1.216 P1  F30000
G1 X150.474 Y132.869 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F4800
G2 X151.039 Y131.15 I-16.985 J-6.524 E.06523
G1 X151.05 Y104.29 E.96783
G1 X150.961 Y104.202 E.00451
G1 X150.961 Y102.256 E.07013
G2 X151.05 Y102.106 I-.03 J-.119 E.00695
G1 X150.173 Y102.106 E.0316
G1 X150.173 Y133.649 E1.13659
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X150.173 Y131.649 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/64
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
G3 Z6.16 I1.203 J.184 P1  F30000
G1 X154.5 Y103.377 Z6.16
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y103.377 E.07954
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.377 E.00981
G1 X154.56 Y103.377 E.07755
G1 X154.5 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y103.769 E.08573
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.769 E.03319
G1 X154.56 Y103.769 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y103.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.01 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.724 E2.42171
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.383 E1.91434
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.336 E2.30613
G1 X108.346 Y131.689 E.17136
G1 X108.393 Y131.841 E.00491
G2 X151.638 Y131.746 I21.608 J-6.487 E1.77653
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.384 Y149.06 I-6.935 J-15.046 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-2.351 J-9.814 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
M73 P74 R4
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.289 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/64
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
G3 Z6.2 I1.103 J-.514 P1  F30000
G1 X109.827 Y133.649 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F4800
G1 X109.827 Y102.106 E1.13659
G1 X108.95 Y102.106 E.0316
G2 X109.039 Y102.256 I.119 J.03 E.00695
G1 X109.039 Y104.202 E.07013
G1 X108.95 Y104.29 E.00451
G1 X108.95 Y131.141 E.96753
G1 X109.122 Y131.665 E.01985
; WIPE_START
G1 F24000
G1 X108.95 Y131.141 E-.2093
G1 X108.95 Y129.692 E-.5507
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.622 J-1.046 P1  F30000
G1 X102.122 Y133.754 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4800
G1 X102.552 Y133.754 E.01551
G3 X102.235 Y132.646 I11.27 J-3.825 E.04156
; WIPE_START
G1 F24000
G1 X102.552 Y133.754 E-.55343
G1 X102.122 Y133.754 E-.20657
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.213 J-.098 P1  F30000
G1 X101.933 Y131.432 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4800
G1 X101.933 Y133.754 E.08367
G1 X101.229 Y133.754 E.02538
G1 X101.229 Y102.106 E1.14038
G1 X101.933 Y102.106 E.02538
G1 X101.933 Y131.329 E1.05299
G1 X102.237 Y130.94 E.01778
G1 X102.811 Y130.94 E.02065
G1 X102.811 Y104.517 E.9521
G1 X103.688 Y104.517 E.0316
G1 X103.688 Y130.94 E.9521
G1 X104.565 Y130.94 E.0316
G1 X104.565 Y104.517 E.9521
G1 X105.442 Y104.517 E.0316
G1 X105.442 Y130.94 E.9521
G1 X106.319 Y130.94 E.0316
G1 X106.319 Y104.517 E.9521
G1 X107.196 Y104.517 E.0316
G1 X107.196 Y130.94 E.9521
G1 X108.073 Y130.94 E.0316
G1 X108.073 Y104.517 E.9521
G1 X108.723 Y104.517 E.02342
G1 X108.817 Y104.424 E.00478
; WIPE_START
G1 F24000
G1 X108.723 Y104.517 E-.05037
G1 X108.073 Y104.517 E-.24701
G1 X108.073 Y105.735 E-.46262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.037 J1.216 P1  F30000
G1 X151.183 Y104.424 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4800
G1 X151.277 Y104.517 E.00478
G1 X151.927 Y104.517 E.02342
G1 X151.927 Y130.94 E.9521
G1 X152.804 Y130.94 E.0316
G1 X152.804 Y104.517 E.9521
G1 X153.681 Y104.517 E.0316
G1 X153.681 Y130.94 E.9521
G1 X154.558 Y130.94 E.0316
G1 X154.558 Y104.517 E.9521
G1 X155.435 Y104.517 E.0316
G1 X155.435 Y130.94 E.9521
G1 X156.312 Y130.94 E.0316
G1 X156.312 Y104.517 E.9521
G1 X157.189 Y104.517 E.0316
G1 X157.189 Y130.94 E.9521
G1 X157.763 Y130.94 E.02065
G1 X158.067 Y131.329 E.01778
G1 X158.067 Y102.106 E1.05299
G1 X158.771 Y102.106 E.02538
G1 X158.771 Y133.754 E1.14038
G1 X158.067 Y133.754 E.02538
G1 X158.067 Y131.432 E.08367
; WIPE_START
G1 F24000
G1 X158.067 Y133.432 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.136 J-.436 P1  F30000
G1 X157.765 Y132.646 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4800
G3 X157.448 Y133.754 I-11.588 J-2.717 E.04156
G1 X157.878 Y133.754 E.01551
; WIPE_START
G1 F24000
G1 X157.448 Y133.754 E-.20657
G1 X157.765 Y132.646 E-.55343
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.037 J-1.216 P1  F30000
G1 X150.474 Y132.869 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4800
G2 X151.039 Y131.15 I-16.985 J-6.524 E.06523
G1 X151.05 Y104.29 E.96783
G1 X150.961 Y104.202 E.00451
G1 X150.961 Y102.256 E.07013
G2 X151.05 Y102.106 I-.03 J-.119 E.00695
G1 X150.173 Y102.106 E.0316
G1 X150.173 Y133.649 E1.13659
; WIPE_START
G1 F24000
G1 X150.173 Y131.649 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.203 J.184 P1  F30000
G1 X154.5 Y103.377 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y103.377 E.07954
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.377 E.00981
G1 X154.56 Y103.377 E.07755
G1 X154.5 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y103.769 E.08573
G1 X151.71 Y102.689 E.03319
M73 P75 R4
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.769 E.03319
G1 X154.56 Y103.769 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y103.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.01 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.724 E2.42171
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.383 E1.91434
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.336 E2.30613
G1 X108.346 Y131.689 E.17136
G1 X108.407 Y131.887 E.00639
G2 X151.638 Y131.746 I21.594 J-6.532 E1.77506
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.384 Y149.06 I-6.934 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.229 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.114 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-5.304 J-25.923 E.07727
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.289 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/64
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
G3 Z6.4 I.937 J.776 P1  F30000
G1 X154.5 Y103.377 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4043
G1 X152.102 Y103.377 E.07954
G1 X152.102 Y103.081 E.00981
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y103.377 E.00981
G1 X154.56 Y103.377 E.07755
G1 X154.5 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4043
G1 X151.71 Y103.769 E.08573
G1 X151.71 Y102.689 E.03319
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y103.769 E.03319
G1 X154.56 Y103.769 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y103.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.01 J-1.217 P1  F30000
G1 X103.102 Y103.377 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4043
G1 X103.102 Y103.081 E.00981
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y103.377 E.00981
G1 X103.162 Y103.377 E.1571
G1 X102.71 Y103.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4043
G1 X102.71 Y102.689 E.03319
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y103.769 E.03319
G1 X102.77 Y103.769 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y102.689 E-.41103
G1 X103.628 Y102.689 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.632 J1.04 P1  F30000
G1 X151.943 Y132.081 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4043
G1 X156.73 Y132.081 E.15879
G3 X103.27 Y132.081 I-26.73 J-6.719 E2.42196
G1 X108.057 Y132.081 E.15879
G1 X108.261 Y132.734 E.02269
G2 X151.925 Y132.138 I21.736 J-7.383 E1.91434
G1 X151.654 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4043
G1 X157.231 Y131.689 E.17136
G3 X102.769 Y131.689 I-27.231 J-6.335 E2.30618
G1 X108.346 Y131.689 E.17136
G1 X108.422 Y131.934 E.00788
G2 X151.638 Y131.746 I21.58 J-6.576 E1.77365
M204 S10000
; WIPE_START
G1 F24000
G1 X153.637 Y131.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.022 J-.661 P1  F30000
G1 X141.941 Y149.813 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4043
G2 X143.384 Y149.06 I-6.934 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.229 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.285 Y132.429 I-25.27 J-12.113 E.16795
G1 X137.061 Y151.643 E.90158
G2 X138.013 Y151.365 I-2.35 J-9.814 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-11.924 J-67.533 E.07725
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.715 Y132.429 E.90158
G2 X105.481 Y137.167 I27.035 J-7.375 E.16795
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
M106 S234.6
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.616 Y149.06 E-.61864
G1 X116.879 Y148.797 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/64
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
G3 Z6.6 I.658 J1.023 P1  F30000
G1 X153.945 Y124.952 Z6.6
G1 Z6.4
G1 E.8 F1800
M204 S5000
; FEATURE: Overhang wall
M106 S255
M73 P76 R4
G1 F3000
G3 X154.245 Y120.942 I.555 J-1.975 E.18666
G1 X154.449 Y120.927 E.00679
G3 X154.003 Y124.968 I.051 J2.051 E.23216
M106 S234.6
M204 S10000
G1 X154.051 Y124.575 F30000
M204 S5000
M106 S255
G1 F3000
G3 X154.294 Y121.331 I.449 J-1.597 E.15097
G1 X154.459 Y121.319 E.00549
G3 X154.109 Y124.59 I.041 J1.659 E.18738
M106 S234.6
M204 S10000
; WIPE_START
G1 F24000
G1 X153.743 Y124.456 E-.14821
G1 X153.465 Y124.277 E-.12563
G1 X153.228 Y124.046 E-.12563
G1 X153.042 Y123.773 E-.12564
G1 X152.914 Y123.468 E-.12563
G1 X152.857 Y123.186 E-.10926
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.209 J.139 P1  F30000
G1 X154.144 Y111.998 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
M106 S255
G1 F3000
G3 X154.245 Y107.942 I.356 J-2.02 E.19345
G1 X154.449 Y107.927 E.00679
G3 X154.203 Y112.007 I.051 J2.051 E.22537
M106 S234.6
M204 S10000
G1 X154.212 Y111.612 F30000
M204 S5000
M106 S255
G1 F3000
G3 X154.294 Y108.331 I.288 J-1.634 E.15645
G1 X154.459 Y108.319 E.00549
G3 X154.271 Y111.621 I.041 J1.659 E.18189
M106 S234.6
M204 S10000
; WIPE_START
G1 F24000
G1 X153.893 Y111.524 E-.1482
G1 X153.599 Y111.373 E-.12563
G1 X153.465 Y111.277 E-.0629
G1 X153.228 Y111.046 E-.12564
G1 X153.042 Y110.773 E-.12563
G1 X152.914 Y110.468 E-.12564
G1 X152.889 Y110.349 E-.04637
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.009 J-1.217 P1  F30000
G1 X107.427 Y110.68 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
M106 S255
G1 F3000
G3 X105.245 Y107.942 I-1.927 J-.703 E.28842
G1 X105.449 Y107.927 E.00679
G3 X107.447 Y110.624 I.051 J2.051 E.1304
M106 S234.6
M204 S10000
G1 X107.059 Y110.546 F30000
M204 S5000
M106 S255
G1 F3000
G3 X105.294 Y108.331 I-1.559 J-.568 E.23326
G1 X105.459 Y108.319 E.00549
G3 X107.078 Y110.489 I.041 J1.659 E.10508
M106 S234.6
M204 S10000
; WIPE_START
G1 F24000
G1 X106.917 Y110.844 E-.14822
G1 X106.717 Y111.108 E-.12564
G1 X106.469 Y111.327 E-.12564
G1 X106.183 Y111.492 E-.12563
G1 X105.869 Y111.597 E-.12564
G1 X105.584 Y111.633 E-.10924
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.2 J.2 P1  F30000
G1 X107.528 Y123.284 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
M106 S255
G1 F3000
G3 X105.245 Y120.942 I-2.028 J-.307 E.30199
G1 X105.449 Y120.927 E.00679
G3 X107.536 Y123.225 I.051 J2.051 E.11683
M106 S234.6
M204 S10000
G1 X107.108 Y123.388 F30000
M204 S5000
M106 S255
G1 F3000
G3 X105.294 Y121.331 I-1.608 J-.41 E.23875
G1 X105.459 Y121.319 E.00549
G3 X107.121 Y123.33 I.041 J1.659 E.0996
M106 S234.6
M204 S10000
; WIPE_START
G1 F24000
G1 X106.996 Y123.699 E-.14822
G1 X106.823 Y123.981 E-.12563
G1 X106.599 Y124.224 E-.12564
G1 X106.33 Y124.417 E-.12563
G1 X106.029 Y124.553 E-.12563
G1 X105.749 Y124.617 E-.10924
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.19 J1.202 P1  F30000
G1 X151.988 Y131.938 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X152.102 Y131.57 E.01275
G1 X152.102 Y131.279 E.00968
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X152.102 Y104.179 E.89896
M106 S234.6
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X152.102 Y103.081 E.03642
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y104.179 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X156.898 Y131.279 E.89896
M106 S234.6
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X156.898 Y131.405 E.00419
G1 X156.834 Y131.661 E.00876
G3 X103.102 Y131.405 I-26.837 J-6.308 E2.45941
G1 X103.102 Y131.279 E.00419
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X103.102 Y104.179 E.89896
M106 S234.6
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X103.102 Y103.081 E.03642
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y104.179 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X107.898 Y131.279 E.89896
M106 S234.6
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X107.898 Y131.491 E.00705
G2 X107.926 Y131.661 I.298 J.038 E.0058
G2 X151.741 Y132.734 I22.075 J-6.316 E1.93102
G1 X151.97 Y131.995 E.02568
G1 X151.608 Y131.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y131.484 E.01077
G1 X151.71 Y131.279 E.0063
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X151.71 Y104.179 E.89896
M106 S234.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y102.689 E.04578
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y104.179 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X157.29 Y131.279 E.89896
M106 S234.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.29 Y131.402 E.00378
G3 X157.242 Y131.648 I-1.096 J-.088 E.00772
G3 X102.71 Y131.402 I-27.238 J-6.282 E2.31676
G1 X102.71 Y131.279 E.00378
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X102.71 Y104.179 E.89896
M106 S234.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y102.689 E.04578
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y104.179 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X108.29 Y131.279 E.89896
M106 S234.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y131.484 E.0063
G2 X151.362 Y132.606 I21.71 J-6.128 E1.76013
G1 X151.59 Y131.876 E.02348
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.484 E-.15602
G1 X151.71 Y131.279 E-.0779
G1 X151.71 Y129.894 E-.52608
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.506 J1.107 P1  F30000
G1 X156.554 Y132.109 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.440447
M106 S255
G1 F3000
G1 X156.554 Y124.683 E.24055
G1 X156.49 Y124.765 E.00338
M73 P77 R4
G1 X156.262 Y124.573 E.00964
G1 X156.157 Y124.686 E.00498
G1 X156.157 Y132.25 E.24503
G1 X155.759 Y132.25 E.01288
G1 X155.759 Y124.999 E.23488
G1 X155.694 Y125.047 E.00262
G1 X155.362 Y125.196 E.0118
G1 X155.362 Y132.25 E.2285
G1 X154.964 Y132.25 E.01288
G1 X154.964 Y125.31 E.22483
G3 X154.567 Y125.354 I-.308 J-.961 E.01304
G1 X154.567 Y132.25 E.2234
G1 X154.169 Y132.25 E.01288
G1 X154.169 Y125.333 E.22407
G1 X153.853 Y125.277 E.0104
G1 X153.772 Y125.245 E.00284
G1 X153.772 Y132.25 E.22691
G1 X153.374 Y132.25 E.01288
G1 X153.374 Y125.08 E.23227
G1 X152.977 Y124.812 E.01553
G1 X152.977 Y132.25 E.24095
G1 X152.579 Y132.25 E.01288
G1 X152.579 Y124.332 E.25648
M106 S234.6
G1 X152.547 Y124.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973919
G1 F15000
G1 X152.487 Y124.073 E.00044
; LINE_WIDTH: 0.111411
G1 X152.429 Y123.987 E.00058
; LINE_WIDTH: 0.148189
G3 X152.365 Y123.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X152.346 Y123.771 E.00103
; LINE_WIDTH: 0.12919
G1 X152.328 Y123.666 E.00075
; WIPE_START
G1 F24000
G1 X152.346 Y123.771 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.216 J.034 P1  F30000
G1 X152.399 Y121.879 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.119476
G1 F15000
G2 X152.329 Y122.294 I8.253 J1.619 E.00262
G1 X152.306 Y122.115 F30000
; LINE_WIDTH: 0.181649
G1 F15000
G1 X152.403 Y121.973 E.00195
; LINE_WIDTH: 0.147277
G1 X152.476 Y121.876 E.00103
; LINE_WIDTH: 0.111413
G1 X152.544 Y121.786 E.00063
; LINE_WIDTH: 0.0973918
G1 X152.608 Y121.71 E.00044
; WIPE_START
G1 F24000
G1 X152.544 Y121.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.656 J1.025 P1  F30000
G1 X156.392 Y124.248 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.129172
G1 F15000
G1 X156.524 Y124.081 E.00149
; LINE_WIDTH: 0.17924
G1 X156.593 Y123.99 E.00126
; LINE_WIDTH: 0.195641
G1 X156.694 Y123.842 E.00224
G1 X156.671 Y123.664 F30000
; LINE_WIDTH: 0.119478
G1 F15000
G3 X156.601 Y124.078 I-8.319 J-1.204 E.00262
; WIPE_START
G1 F24000
G1 X156.671 Y123.664 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J.001 P1  F30000
G1 X156.672 Y122.292 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.0969202
G1 F15000
G1 X156.654 Y122.187 E.00047
; LINE_WIDTH: 0.136069
G1 X156.629 Y122.056 E.00101
; LINE_WIDTH: 0.173119
G1 X156.571 Y121.97 E.0011
; LINE_WIDTH: 0.126787
G1 X156.453 Y121.806 E.00138
G1 X156.548 Y121.555 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452593
M106 S255
G1 F3000
G1 X156.548 Y111.691 E.32932
G1 X156.49 Y111.765 E.00315
G1 X156.262 Y111.573 E.00994
G1 X156.139 Y111.706 E.00604
G1 X156.139 Y121.258 E.31889
G2 X155.729 Y120.944 I-.981 J.856 E.01735
G1 X155.729 Y112.021 E.29787
G1 X155.319 Y112.216 E.01514
G1 X155.319 Y120.748 E.28484
G2 X154.91 Y120.638 I-.476 J.958 E.01425
G1 X154.91 Y112.322 E.27762
G3 X154.5 Y112.355 I-.287 J-.997 E.01381
G1 X154.5 Y120.602 E.2753
G2 X154.09 Y120.635 I-.123 J1.03 E.01381
G1 X154.09 Y112.319 E.27762
G3 X153.681 Y112.209 I.066 J-1.068 E.01425
G1 X153.681 Y120.742 E.28484
G1 X153.271 Y120.936 E.01514
G1 X153.271 Y112.013 E.29788
G3 X152.861 Y111.699 I.572 J-1.17 E.01735
G1 X152.861 Y121.252 E.3189
G1 X152.738 Y121.384 E.00603
G1 X152.529 Y121.209 E.0091
G1 X152.452 Y121.297 E.00393
G1 X152.452 Y111.378 E.33115
M106 S234.6
G1 X152.547 Y111.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973912
G1 F15000
G1 X152.487 Y111.073 E.00044
; LINE_WIDTH: 0.11139
G1 X152.429 Y110.987 E.00058
; LINE_WIDTH: 0.148164
G3 X152.365 Y110.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X152.346 Y110.771 E.00103
; LINE_WIDTH: 0.129188
G1 X152.328 Y110.666 E.00075
; WIPE_START
G1 F24000
G1 X152.346 Y110.771 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.216 J.034 P1  F30000
G1 X152.399 Y108.879 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.119472
G1 F15000
G2 X152.329 Y109.294 I8.25 J1.618 E.00262
G1 X152.306 Y109.115 F30000
; LINE_WIDTH: 0.18165
G1 F15000
G1 X152.403 Y108.973 E.00195
; LINE_WIDTH: 0.147279
G1 X152.476 Y108.876 E.00103
; LINE_WIDTH: 0.111416
G1 X152.544 Y108.786 E.00063
; LINE_WIDTH: 0.0973917
G1 X152.608 Y108.71 E.00044
; WIPE_START
G1 F24000
G1 X152.544 Y108.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.656 J1.025 P1  F30000
G1 X156.392 Y111.248 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.129163
G1 F15000
G1 X156.524 Y111.081 E.00149
; LINE_WIDTH: 0.179223
G1 X156.593 Y110.99 E.00126
; LINE_WIDTH: 0.195631
G1 X156.694 Y110.842 E.00224
G1 X156.671 Y110.664 F30000
; LINE_WIDTH: 0.119479
G1 F15000
G3 X156.601 Y111.078 I-8.245 J-1.192 E.00262
; WIPE_START
G1 F24000
G1 X156.671 Y110.664 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J.001 P1  F30000
G1 X156.672 Y109.292 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.0969206
G1 F15000
G1 X156.654 Y109.187 E.00047
; LINE_WIDTH: 0.136072
G1 X156.629 Y109.056 E.00101
; LINE_WIDTH: 0.173122
G1 X156.571 Y108.97 E.0011
; LINE_WIDTH: 0.126789
G1 X156.453 Y108.806 E.00138
G1 X156.548 Y108.549 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452595
M106 S255
G1 F3000
G1 X156.548 Y103.414 E.17144
G1 X156.139 Y103.414 E.01368
G1 X156.139 Y108.258 E.16172
G2 X155.729 Y107.944 I-.982 J.856 E.01735
G1 X155.729 Y103.414 E.15123
G1 X155.319 Y103.414 E.01368
G1 X155.319 Y107.748 E.14468
G2 X154.91 Y107.638 I-.476 J.958 E.01425
G1 X154.91 Y103.414 E.14102
G1 X154.5 Y103.414 E.01368
G1 X154.5 Y107.602 E.13981
G2 X154.09 Y107.635 I-.123 J1.03 E.01381
G1 X154.09 Y103.414 E.14092
G1 X153.681 Y103.414 E.01368
G1 X153.681 Y107.742 E.14448
G1 X153.271 Y107.936 E.01514
G1 X153.271 Y103.414 E.15096
G1 X152.861 Y103.414 E.01368
G1 X152.861 Y108.252 E.1615
G1 X152.738 Y108.384 E.00604
G1 X152.529 Y108.209 E.0091
G1 X152.452 Y108.297 E.00393
G1 X152.452 Y103.244 E.16869
M106 S234.6
; WIPE_START
G1 F24000
G1 X152.452 Y105.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.184 J-.279 P1  F30000
G1 X141.941 Y149.813 Z6.8
M73 P77 R3
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X143.384 Y149.06 I-6.935 J-15.045 E.05403
G1 X140.486 Y146.162 E.13596
G2 X145.102 Y143.102 I-12.63 J-24.06 E.18403
G1 X147.88 Y145.88 E.13036
G2 X151.597 Y141.921 I-18.643 J-21.228 E.18042
G1 X148.8 Y139.124 E.13123
G2 X151.555 Y134.203 I-22.281 J-15.706 E.18741
G1 X154.519 Y137.167 E.13905
G2 X156.228 Y132.642 I-33.612 J-15.277 E.16056
G1 X156.062 Y132.642 E.00551
G1 X137.061 Y151.643 E.89135
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-12.391 J-70.464 E.07725
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X103.938 Y132.642 E.89135
G1 X103.772 Y132.642 E.00551
G2 X105.481 Y137.167 I35.321 J-10.752 E.16056
G1 X108.445 Y134.203 E.13905
G2 X111.2 Y139.124 I25.036 J-10.785 E.18741
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I14.972 J-17.57 E.18415
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
G1 X107.421 Y132.42 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.440447
M106 S255
G1 F3000
G1 X107.421 Y124.707 E.24985
G1 X107.262 Y124.573 E.00673
G3 X107.023 Y124.81 I-.704 J-.471 E.01095
G1 X107.023 Y132.25 E.24102
G1 X106.626 Y132.25 E.01288
G1 X106.626 Y125.077 E.23236
G1 X106.228 Y125.249 E.01403
G1 X106.228 Y132.25 E.22678
G1 X105.831 Y132.25 E.01288
G1 X105.831 Y125.34 E.22384
G1 X105.433 Y125.357 E.01289
G1 X105.433 Y132.25 E.22329
G1 X105.036 Y132.25 E.01288
G1 X105.036 Y125.309 E.22484
G3 X104.638 Y125.193 I.09 J-1.041 E.01351
M73 P78 R3
G1 X104.638 Y132.25 E.22861
G1 X104.241 Y132.25 E.01288
G1 X104.241 Y124.994 E.23506
G3 X103.843 Y124.682 I.573 J-1.139 E.01648
G1 X103.843 Y132.25 E.24517
G1 X103.656 Y132.25 E.00608
G1 X103.446 Y131.406 E.02819
G1 X103.446 Y124.37 E.22792
M106 S234.6
G1 X103.547 Y124.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973911
G1 F15000
G1 X103.487 Y124.073 E.00044
; LINE_WIDTH: 0.111415
G1 X103.429 Y123.987 E.00058
; LINE_WIDTH: 0.148193
G3 X103.365 Y123.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161464
G1 X103.346 Y123.771 E.00103
; LINE_WIDTH: 0.129192
G1 X103.328 Y123.666 E.00075
; WIPE_START
G1 F24000
G1 X103.346 Y123.771 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.216 J.034 P1  F30000
G1 X103.399 Y121.879 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.11948
G1 F15000
G2 X103.329 Y122.294 I8.233 J1.616 E.00262
G1 X103.306 Y122.115 F30000
; LINE_WIDTH: 0.181652
G1 F15000
G1 X103.403 Y121.973 E.00195
; LINE_WIDTH: 0.147278
G1 X103.476 Y121.876 E.00103
; LINE_WIDTH: 0.111413
G1 X103.544 Y121.786 E.00063
; LINE_WIDTH: 0.0973917
G1 X103.608 Y121.71 E.00044
; WIPE_START
G1 F24000
G1 X103.544 Y121.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.656 J1.025 P1  F30000
G1 X107.392 Y124.248 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.12917
G1 F15000
G1 X107.524 Y124.081 E.00149
; LINE_WIDTH: 0.179236
G1 X107.593 Y123.99 E.00126
; LINE_WIDTH: 0.195637
G1 X107.694 Y123.842 E.00224
G1 X107.671 Y123.664 F30000
; LINE_WIDTH: 0.119475
G1 F15000
G3 X107.601 Y124.078 I-8.323 J-1.204 E.00262
; WIPE_START
G1 F24000
G1 X107.671 Y123.664 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J.001 P1  F30000
G1 X107.672 Y122.292 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.0969202
G1 F15000
G1 X107.654 Y122.187 E.00047
; LINE_WIDTH: 0.136067
G1 X107.629 Y122.056 E.00101
; LINE_WIDTH: 0.173114
G1 X107.571 Y121.97 E.0011
; LINE_WIDTH: 0.126784
G1 X107.453 Y121.806 E.00138
G1 X107.548 Y121.549 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452593
M106 S255
G1 F3000
G1 X107.548 Y111.691 E.32911
G1 X107.49 Y111.764 E.00315
G1 X107.262 Y111.573 E.00994
G1 X107.139 Y111.706 E.00604
G1 X107.139 Y121.258 E.31889
G2 X106.729 Y120.944 I-.981 J.856 E.01735
G1 X106.729 Y112.021 E.29787
G1 X106.319 Y112.216 E.01514
G1 X106.319 Y120.748 E.28484
G2 X105.91 Y120.638 I-.476 J.958 E.01425
G1 X105.91 Y112.322 E.27762
G3 X105.5 Y112.355 I-.287 J-.997 E.01381
G1 X105.5 Y120.602 E.2753
G2 X105.09 Y120.635 I-.123 J1.03 E.01381
G1 X105.09 Y112.319 E.27762
G3 X104.681 Y112.209 I.066 J-1.068 E.01425
G1 X104.681 Y120.742 E.28484
G1 X104.271 Y120.936 E.01514
G1 X104.271 Y112.013 E.29788
G3 X103.861 Y111.699 I.572 J-1.17 E.01735
G1 X103.861 Y121.252 E.3189
G1 X103.738 Y121.384 E.00603
G1 X103.53 Y121.209 E.0091
G1 X103.452 Y121.297 E.00393
G1 X103.452 Y111.378 E.33115
M106 S234.6
G1 X103.547 Y111.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973903
G1 F15000
G1 X103.487 Y111.073 E.00044
; LINE_WIDTH: 0.111392
G1 X103.429 Y110.987 E.00058
; LINE_WIDTH: 0.148168
G3 X103.365 Y110.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X103.346 Y110.771 E.00103
; LINE_WIDTH: 0.12919
G1 X103.328 Y110.666 E.00075
; WIPE_START
G1 F24000
G1 X103.346 Y110.771 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.216 J.034 P1  F30000
G1 X103.399 Y108.879 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.119476
G1 F15000
G2 X103.329 Y109.294 I8.258 J1.619 E.00262
G1 X103.306 Y109.115 F30000
; LINE_WIDTH: 0.181651
G1 F15000
G1 X103.403 Y108.973 E.00195
; LINE_WIDTH: 0.147279
G1 X103.476 Y108.876 E.00103
; LINE_WIDTH: 0.111416
G1 X103.544 Y108.786 E.00063
; LINE_WIDTH: 0.0973917
G1 X103.608 Y108.71 E.00044
; WIPE_START
G1 F24000
G1 X103.544 Y108.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.656 J1.025 P1  F30000
G1 X107.392 Y111.248 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.129162
G1 F15000
G1 X107.524 Y111.081 E.00149
; LINE_WIDTH: 0.179223
G1 X107.593 Y110.99 E.00126
; LINE_WIDTH: 0.195628
G1 X107.694 Y110.842 E.00224
G1 X107.671 Y110.664 F30000
; LINE_WIDTH: 0.119475
G1 F15000
G3 X107.601 Y111.078 I-8.235 J-1.191 E.00262
; WIPE_START
G1 F24000
G1 X107.671 Y110.664 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J.001 P1  F30000
G1 X107.672 Y109.292 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.0969206
G1 F15000
G1 X107.654 Y109.187 E.00047
; LINE_WIDTH: 0.136071
G1 X107.629 Y109.056 E.00101
; LINE_WIDTH: 0.17312
G1 X107.571 Y108.97 E.0011
; LINE_WIDTH: 0.126789
G1 X107.453 Y108.806 E.00138
G1 X107.548 Y108.556 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452595
M106 S255
G1 F3000
G1 X107.548 Y103.414 E.17164
G1 X107.139 Y103.414 E.01368
G1 X107.139 Y108.258 E.16172
G2 X106.729 Y107.944 I-.982 J.856 E.01735
G1 X106.729 Y103.414 E.15123
G1 X106.319 Y103.414 E.01368
G1 X106.319 Y107.748 E.14468
G2 X105.91 Y107.638 I-.476 J.958 E.01425
G1 X105.91 Y103.414 E.14102
G1 X105.5 Y103.414 E.01368
G1 X105.5 Y107.602 E.13981
G2 X105.09 Y107.635 I-.123 J1.03 E.01381
G1 X105.09 Y103.414 E.14092
G1 X104.681 Y103.414 E.01368
G1 X104.681 Y107.742 E.14448
G1 X104.271 Y107.936 E.01514
G1 X104.271 Y103.414 E.15096
G1 X103.861 Y103.414 E.01368
G1 X103.861 Y108.252 E.1615
G1 X103.738 Y108.384 E.00604
G1 X103.53 Y108.209 E.0091
G1 X103.452 Y108.297 E.00393
G1 X103.452 Y103.244 E.16869
M106 S234.6
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X103.452 Y105.244 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/64
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
G3 Z6.8 I-.368 J1.16 P1  F30000
G1 X156.316 Y122.028 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11345
G1 X156.461 Y122.374 E.01243
G3 X154.245 Y120.942 I-1.961 J.604 E.33253
G1 X154.449 Y120.927 E.00679
G3 X156.29 Y121.975 I.051 J2.051 E.07384
G1 X155.869 Y122.054 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11345
G1 X155.958 Y122.185 E.00487
G3 X154.294 Y121.331 I-1.458 J.793 E.25929
G1 X154.459 Y121.319 E.00509
G3 X155.772 Y121.912 I.041 J1.659 E.04579
G1 X155.835 Y122.004 E.00344
M204 S10000
; WIPE_START
G1 F24000
G1 X155.958 Y122.185 E-.08307
G1 X156.087 Y122.489 E-.12562
G1 X156.152 Y122.811 E-.12488
G1 X156.158 Y123.062 E-.09512
G1 X156.109 Y123.388 E-.12555
G1 X155.996 Y123.699 E-.12564
G1 X155.886 Y123.879 E-.08012
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.203 J-.182 P1  F30000
G1 X153.506 Y108.186 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11345
G1 X153.846 Y108.033 E.01237
G3 X154.245 Y107.942 I.654 J1.945 E.01358
G1 X154.449 Y107.927 E.00679
G3 X153.453 Y108.213 I.051 J2.051 E.39284
G1 X153.698 Y108.528 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11345
G1 X153.971 Y108.405 E.00922
G3 X154.294 Y108.331 I.529 J1.573 E.01018
G1 X154.459 Y108.319 E.00508
G3 X153.644 Y108.556 I.041 J1.659 E.29399
M204 S10000
; WIPE_START
G1 F24000
G1 X153.971 Y108.405 E-.13679
G1 X154.294 Y108.331 E-.12564
G1 X154.459 Y108.319 E-.06289
G1 X154.788 Y108.344 E-.12564
G1 X155.107 Y108.433 E-.12563
G1 X155.401 Y108.584 E-.12564
G1 X155.52 Y108.679 E-.05777
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.08 J-1.214 P1  F30000
G1 X105.177 Y112.003 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11345
G1 X105.144 Y111.998 E.00111
G3 X105.245 Y107.942 I.356 J-2.02 E.19345
G1 X105.449 Y107.927 E.00679
G3 X105.551 Y112.028 I.051 J2.051 E.21379
G1 X105.237 Y112.007 E.01045
G1 X105.212 Y111.612 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11345
G3 X105.294 Y108.331 I.288 J-1.634 E.14492
G1 X105.459 Y108.319 E.00508
G3 X105.271 Y111.621 I.041 J1.659 E.16849
M204 S10000
; WIPE_START
G1 F24000
G1 X104.893 Y111.524 E-.14821
G1 X104.599 Y111.373 E-.12563
G1 X104.341 Y111.167 E-.12563
G1 X104.128 Y110.914 E-.12564
G1 X103.971 Y110.626 E-.12464
G1 X103.891 Y110.388 E-.09528
G1 X103.885 Y110.349 E-.01498
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.197 J.222 P1  F30000
G1 X106.554 Y124.737 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11345
G1 X106.525 Y124.754 E.00111
G3 X105.245 Y120.942 I-1.025 J-1.777 E.24093
G1 X105.449 Y120.927 E.00679
G3 X106.857 Y124.516 I.051 J2.051 E.16631
G1 X106.602 Y124.702 E.01044
G1 X106.272 Y124.443 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11345
G1 X106.028 Y124.551 E.0082
G3 X105.294 Y121.331 I-.528 J-1.573 E.17033
G1 X105.459 Y121.319 E.00509
G3 X106.329 Y124.415 I.041 J1.659 E.13476
G1 X106.326 Y124.416 E.00011
M204 S10000
; WIPE_START
G1 F24000
G1 X106.028 Y124.551 E-.12419
G1 X105.706 Y124.626 E-.12555
G1 X105.378 Y124.634 E-.12488
G1 X105.13 Y124.597 E-.09511
G1 X104.817 Y124.492 E-.12557
G1 X104.531 Y124.327 E-.12564
G1 X104.454 Y124.259 E-.03906
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.194 J1.201 P1  F30000
G1 X151.985 Y131.945 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11345
G1 X152.102 Y131.57 E.01301
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.226 E1.93421
G1 X151.968 Y132.002 E.02542
G1 X151.611 Y131.828 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11345
G1 X151.71 Y131.511 E.01022
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.593 Y131.885 E.02325
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.14916
G1 X151.71 Y129.903 E-.61084
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.204 J.18 P1  F30000
G1 X152.137 Y132.765 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11345
G1 X156.145 Y132.765 E.12316
G1 X156.506 Y131.357 E.04466
G1 X156.506 Y124.722 E.20388
G1 X156.387 Y124.748 E.00373
G1 X156.267 Y124.654 E.0047
G1 X156.104 Y124.824 E.00724
G1 X155.706 Y125.106 E.01496
G1 X155.261 Y125.302 E.01496
G1 X154.786 Y125.407 E.01495
G3 X153.477 Y125.2 I-.251 J-2.649 E.04114
G1 X153.051 Y124.946 E.01525
G1 X152.743 Y124.646 E.01321
G1 X152.625 Y124.737 E.00457
G1 X152.494 Y124.711 E.0041
G1 X152.494 Y131.601 E.21173
G1 X152.155 Y132.708 E.03555
G1 X154.346 Y127.266 F30000
; LINE_WIDTH: 0.351907
G1 F11345
G1 X154.346 Y130.914 E.09183
G1 X154.654 Y130.914 E.00778
G1 X154.654 Y127.262 E.09193
G1 X154.406 Y127.266 E.00627
G1 X154.002 Y126.895 F30000
; LINE_WIDTH: 0.419999
G1 F11345
G1 X154.002 Y131.257 E.13401
M73 P79 R3
G1 X154.977 Y131.257 E.02993
G1 X154.998 Y130.759 E.0153
G1 X154.998 Y126.893 E.11879
G3 X154.062 Y126.899 I-.491 J-3.948 E.0288
G1 X153.625 Y126.442 F30000
G1 F11345
G1 X153.62 Y131.634 E.15953
G1 X155.271 Y131.634 E.05073
G1 X155.375 Y131.161 E.01488
G1 X155.375 Y126.437 E.14515
G1 X154.815 Y126.538 E.01749
G1 X154.146 Y126.535 E.02055
G1 X153.684 Y126.452 E.0144
G1 X153.248 Y125.946 F30000
G1 F11345
G1 X153.248 Y131.601 E.17376
G1 X153.165 Y132.011 E.01284
G1 X155.566 Y132.011 E.07378
G1 X155.752 Y131.265 E.02362
G1 X155.752 Y125.912 E.16446
G1 X155.429 Y126.038 E.01064
G1 X154.805 Y126.161 E.01954
G1 X154.201 Y126.162 E.01855
G3 X153.306 Y125.963 I.561 J-4.623 E.02823
G1 X152.871 Y125.28 F30000
G1 F11345
G1 X152.871 Y131.601 E.19424
G1 X152.651 Y132.388 E.02509
G1 X155.861 Y132.388 E.09864
G1 X156.129 Y131.311 E.0341
G1 X156.129 Y125.271 E.18559
G1 X155.861 Y125.449 E.00988
G1 X155.345 Y125.67 E.01726
G1 X154.795 Y125.784 E.01724
G1 X154.257 Y125.789 E.01655
G1 X153.815 Y125.715 E.01377
G1 X153.289 Y125.526 E.01717
G1 X152.923 Y125.311 E.01305
G1 X152.608 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F11345
G1 X152.544 Y124.172 E.00044
; LINE_WIDTH: 0.111411
G1 X152.476 Y124.081 E.00063
; LINE_WIDTH: 0.147276
G1 X152.403 Y123.985 E.00103
; LINE_WIDTH: 0.181649
G1 X152.306 Y123.842 E.00195
G1 X152.329 Y123.664 F30000
; LINE_WIDTH: 0.119472
G1 F11345
G2 X152.399 Y124.078 I8.307 J-1.202 E.00262
G1 X152.329 Y122.294 F30000
; LINE_WIDTH: 0.119472
G1 F11345
G3 X152.399 Y121.879 I8.321 J1.204 E.00262
G1 X152.476 Y121.876 F30000
; LINE_WIDTH: 0.147273
G1 F11345
G1 X152.403 Y121.973 E.00103
; LINE_WIDTH: 0.181648
G1 X152.306 Y122.115 E.00195
G1 X152.476 Y121.876 F30000
; LINE_WIDTH: 0.111407
G1 F11345
G1 X152.544 Y121.786 E.00063
; LINE_WIDTH: 0.0973896
G1 X152.608 Y121.71 E.00044
G1 X154.346 Y118.695 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F11345
G1 X154.654 Y118.691 E.00778
G1 X154.654 Y114.262 E.11151
G1 X154.346 Y114.266 E.00778
G1 X154.346 Y118.635 E.11
G1 X154.002 Y119.064 F30000
; LINE_WIDTH: 0.419999
G1 F11345
G3 X154.998 Y119.028 I.891 J10.706 E.03061
G1 X154.998 Y113.893 E.15778
G3 X154.002 Y113.93 I-.892 J-10.725 E.03061
G1 X154.002 Y119.004 E.15594
G1 X153.625 Y119.521 F30000
G1 F11345
G1 X154.186 Y119.42 E.01752
G1 X154.898 Y119.428 E.02186
G1 X155.375 Y119.516 E.01489
G1 X155.375 Y113.437 E.18678
G1 X154.814 Y113.538 E.01752
G1 X154.102 Y113.53 E.02186
G1 X153.625 Y113.442 E.01489
G1 X153.625 Y119.461 E.18494
G1 X153.248 Y120.045 F30000
G1 F11345
G1 X153.571 Y119.92 E.01064
G1 X154.196 Y119.796 E.01956
G1 X154.832 Y119.799 E.01956
G1 X155.456 Y119.928 E.01956
G1 X155.752 Y120.044 E.00977
G1 X155.752 Y112.912 E.21914
G1 X155.429 Y113.038 E.01064
G1 X154.804 Y113.161 E.01956
G1 X154.168 Y113.158 E.01956
G1 X153.544 Y113.029 E.01956
G1 X153.248 Y112.913 E.00977
G1 X153.248 Y119.985 E.2173
G1 X152.871 Y120.687 F30000
G1 F11345
G1 X153.139 Y120.508 E.00988
G1 X153.655 Y120.287 E.01726
G1 X154.205 Y120.173 E.01726
G1 X154.767 Y120.171 E.01726
G1 X155.318 Y120.279 E.01726
G1 X155.837 Y120.495 E.01726
G1 X156.129 Y120.683 E.01068
G1 X156.129 Y112.271 E.2585
G1 X155.861 Y112.449 E.00988
G1 X155.345 Y112.67 E.01726
G1 X154.795 Y112.784 E.01726
G1 X154.233 Y112.787 E.01726
G1 X153.682 Y112.678 E.01726
G1 X153.163 Y112.463 E.01726
G1 X152.871 Y112.274 E.01068
G1 X152.871 Y120.627 E.25665
G1 X152.494 Y121.238 F30000
G1 F11345
G1 X152.621 Y121.219 E.00392
G1 X152.733 Y121.303 E.00433
G1 X152.896 Y121.133 E.00724
G1 X153.294 Y120.852 E.01496
G1 X153.739 Y120.655 E.01496
G1 X154.215 Y120.55 E.01496
G1 X154.701 Y120.542 E.01496
G1 X155.18 Y120.63 E.01496
G1 X155.632 Y120.812 E.01496
G1 X156.046 Y121.086 E.01525
G1 X156.338 Y121.401 E.01321
G1 X156.439 Y121.325 E.00388
G1 X156.506 Y121.337 E.00209
G1 X156.506 Y111.722 E.29543
G1 X156.387 Y111.748 E.00373
G1 X156.267 Y111.654 E.0047
G1 X156.104 Y111.824 E.00724
G1 X155.706 Y112.106 E.01496
G1 X155.261 Y112.302 E.01496
G1 X154.785 Y112.407 E.01496
G1 X154.299 Y112.415 E.01496
G1 X153.82 Y112.327 E.01496
G1 X153.368 Y112.146 E.01496
G1 X152.954 Y111.872 E.01525
G1 X152.662 Y111.556 E.01321
G1 X152.566 Y111.628 E.00367
G1 X152.494 Y111.614 E.00225
G1 X152.494 Y121.178 E.29386
G1 X156.453 Y121.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126786
G1 F11345
G1 X156.571 Y121.97 E.00138
; LINE_WIDTH: 0.173117
G1 X156.629 Y122.056 E.0011
; LINE_WIDTH: 0.136069
G1 X156.654 Y122.187 E.00101
; LINE_WIDTH: 0.0969202
G1 X156.672 Y122.292 E.00047
G1 X156.671 Y123.664 F30000
; LINE_WIDTH: 0.11948
G1 F11345
G3 X156.601 Y124.078 I-8.306 J-1.202 E.00262
G1 X156.524 Y124.081 F30000
; LINE_WIDTH: 0.179235
G1 F11345
G1 X156.593 Y123.99 E.00126
; LINE_WIDTH: 0.195636
G1 X156.694 Y123.842 E.00224
G1 X156.524 Y124.081 F30000
; LINE_WIDTH: 0.129168
G1 F11345
G1 X156.392 Y124.248 E.00149
G1 X156.392 Y111.248 F30000
; LINE_WIDTH: 0.129162
G1 F11345
G1 X156.524 Y111.081 E.00149
; LINE_WIDTH: 0.179219
G1 X156.593 Y110.99 E.00126
; LINE_WIDTH: 0.195629
G1 X156.694 Y110.842 E.00224
G1 X156.671 Y110.664 F30000
; LINE_WIDTH: 0.119477
G1 F11345
G3 X156.601 Y111.078 I-8.245 J-1.192 E.00262
G1 X156.672 Y109.292 F30000
; LINE_WIDTH: 0.0969205
G1 F11345
G1 X156.654 Y109.187 E.00047
; LINE_WIDTH: 0.136068
G1 X156.629 Y109.056 E.00101
; LINE_WIDTH: 0.173115
G1 X156.571 Y108.97 E.0011
; LINE_WIDTH: 0.126783
G1 X156.453 Y108.806 E.00138
G1 X154.346 Y105.695 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F11345
G1 X154.654 Y105.691 E.00778
G1 X154.654 Y105.324 E.00924
G1 X154.346 Y105.324 E.00778
G1 X154.346 Y105.635 E.00783
G1 X154.002 Y106.064 F30000
; LINE_WIDTH: 0.419999
G1 F11345
G3 X154.998 Y106.028 I.891 J10.706 E.03061
G1 X154.998 Y104.981 E.03216
G1 X154.002 Y104.981 E.03058
G1 X154.002 Y106.004 E.03144
G1 X153.625 Y106.521 F30000
G1 F11345
G1 X154.186 Y106.42 E.01752
G1 X154.898 Y106.428 E.02186
G1 X155.375 Y106.516 E.01489
G1 X155.375 Y104.604 E.05873
G1 X153.625 Y104.604 E.05375
G1 X153.625 Y106.461 E.05705
G1 X153.248 Y107.045 F30000
G1 F11345
G1 X153.571 Y106.92 E.01064
G1 X154.196 Y106.796 E.01956
G1 X154.832 Y106.799 E.01956
G1 X155.456 Y106.928 E.01956
G1 X155.752 Y107.044 E.00977
G1 X155.752 Y104.227 E.08657
G1 X153.248 Y104.227 E.07692
G1 X153.248 Y106.985 E.08475
G1 X152.871 Y107.687 F30000
G1 F11345
G1 X153.139 Y107.508 E.00988
G1 X153.655 Y107.287 E.01726
G1 X154.205 Y107.173 E.01726
G1 X154.767 Y107.171 E.01726
G1 X155.318 Y107.279 E.01726
G1 X155.837 Y107.495 E.01726
G1 X156.129 Y107.683 E.01068
G1 X156.129 Y103.85 E.11779
G1 X152.871 Y103.85 E.10009
G1 X152.871 Y107.627 E.11605
G1 X152.494 Y108.238 F30000
G1 F11345
G1 X152.621 Y108.219 E.00392
G1 X152.733 Y108.303 E.00433
G1 X152.896 Y108.133 E.00724
G1 X153.294 Y107.852 E.01496
G1 X153.739 Y107.655 E.01496
G1 X154.215 Y107.55 E.01496
G1 X154.701 Y107.542 E.01496
G1 X155.18 Y107.63 E.01496
G1 X155.632 Y107.812 E.01496
G1 X156.046 Y108.086 E.01525
G1 X156.338 Y108.401 E.01321
G1 X156.441 Y108.324 E.00395
G1 X156.506 Y108.335 E.00203
G1 X156.506 Y103.473 E.1494
G1 X152.494 Y103.473 E.12327
G1 X152.494 Y108.178 E.14456
G1 X152.608 Y108.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973912
G1 F11345
G1 X152.544 Y108.786 E.00044
; LINE_WIDTH: 0.111406
G1 X152.476 Y108.876 E.00063
; LINE_WIDTH: 0.14727
G1 X152.403 Y108.973 E.00103
; LINE_WIDTH: 0.181642
G1 X152.306 Y109.115 E.00195
G1 X152.329 Y109.294 F30000
; LINE_WIDTH: 0.119466
G1 F11345
G3 X152.399 Y108.879 I8.316 J1.203 E.00262
G1 X152.329 Y110.664 F30000
; LINE_WIDTH: 0.126449
G1 F11345
G1 X152.355 Y110.821 E.00108
; LINE_WIDTH: 0.166516
G1 X152.367 Y110.887 E.00068
; LINE_WIDTH: 0.146001
G2 X152.429 Y110.987 I.162 J-.03 E.00101
; LINE_WIDTH: 0.111385
G1 X152.487 Y111.073 E.00058
; LINE_WIDTH: 0.0973909
G1 X152.547 Y111.152 E.00044
; WIPE_START
G1 F24000
G1 X152.487 Y111.073 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.21 J-.126 P1  F30000
G1 X149.713 Y137.777 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11345
G3 X148.8 Y139.124 I-24.599 J-15.688 E.054
G1 X151.597 Y141.921 E.13123
G3 X147.88 Y145.88 I-22.36 J-17.27 E.18042
G1 X145.102 Y143.102 E.13036
G3 X140.486 Y146.162 I-17.246 J-20.999 E.18403
G1 X143.384 Y149.06 E.13596
G3 X141.941 Y149.813 I-8.378 J-14.293 E.05403
G1 X153.773 Y138.614 F30000
G1 F11345
G2 X154.519 Y137.167 I-14.332 J-8.31 E.05402
G1 X151.555 Y134.203 E.13905
G2 X151.955 Y133.157 I-10.306 J-4.538 E.03717
G1 X155.547 Y133.157 E.11915
G1 X137.061 Y151.643 E.86721
G2 X138.013 Y151.365 I-2.35 J-9.812 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.505 Y148.523 I-12.898 J-73.655 E.07725
G1 X128.498 Y152.53 E.18798
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X104.453 Y133.157 E.86721
G1 X108.045 Y133.157 E.11915
G2 X108.445 Y134.203 I10.706 J-3.492 E.03717
G1 X105.481 Y137.167 E.13905
G2 X106.227 Y138.614 I15.077 J-6.863 E.05402
G1 X110.287 Y137.777 F30000
G1 F11345
G2 X111.2 Y139.124 I24.601 J-15.69 E.054
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I14.955 J-17.544 E.18415
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
G1 X107.863 Y132.765 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11345
G1 X107.515 Y131.658 E.03566
G1 X107.506 Y124.722 E.21313
G1 X107.387 Y124.748 E.00373
G1 X107.267 Y124.654 E.0047
G1 X107.104 Y124.824 E.00724
G1 X106.706 Y125.106 E.01496
G1 X106.261 Y125.302 E.01496
G1 X105.786 Y125.407 E.01495
G3 X104.477 Y125.2 I-.251 J-2.649 E.04114
G1 X104.051 Y124.946 E.01525
G1 X103.743 Y124.646 E.01321
G1 X103.625 Y124.737 E.00457
G1 X103.494 Y124.711 E.0041
G1 X103.494 Y131.357 E.20422
G1 X103.855 Y132.765 E.04466
G1 X107.803 Y132.765 E.12131
G1 X105.654 Y127.262 F30000
; LINE_WIDTH: 0.351907
G1 F11345
G1 X105.346 Y127.266 E.00778
G1 X105.346 Y130.914 E.09183
G1 X105.654 Y130.914 E.00778
G1 X105.654 Y127.322 E.09042
G1 X105.998 Y126.893 F30000
; LINE_WIDTH: 0.419999
G1 F11345
G3 X105.002 Y126.895 I-.507 J-4.203 E.03065
G1 X105.002 Y131.172 E.13142
G1 X105.023 Y131.257 E.00267
G1 X105.998 Y131.257 E.02993
G1 X105.998 Y126.953 E.13223
G1 X106.375 Y126.437 F30000
G1 F11345
G1 X105.815 Y126.538 E.01749
G1 X105.146 Y126.535 E.02055
G1 X104.625 Y126.442 E.01625
G1 X104.625 Y131.219 E.14677
G1 X104.729 Y131.634 E.01314
G1 X106.38 Y131.634 E.05073
G3 X106.375 Y126.497 I453.082 J-3.006 E.15784
G1 X106.752 Y125.912 F30000
G1 F11345
G1 X106.429 Y126.038 E.01064
G1 X105.805 Y126.161 E.01954
G1 X105.201 Y126.162 E.01855
G3 X104.248 Y125.946 I.615 J-4.924 E.03007
G1 X104.248 Y131.265 E.16342
G1 X104.434 Y132.011 E.02362
G1 X106.835 Y132.011 E.07378
G1 X106.752 Y131.601 E.01284
G1 X106.752 Y125.972 E.17296
G1 X107.129 Y125.271 F30000
G1 F11345
G1 X106.861 Y125.449 E.00988
G1 X106.345 Y125.67 E.01726
G1 X105.795 Y125.784 E.01724
G1 X105.257 Y125.789 E.01655
G1 X104.815 Y125.715 E.01377
G1 X104.289 Y125.526 E.01717
G1 X103.871 Y125.28 E.01489
G1 X103.871 Y131.311 E.18531
G1 X104.139 Y132.388 E.0341
G1 X107.349 Y132.388 E.09864
G1 X107.155 Y131.771 E.01986
G1 X107.129 Y130.759 E.03111
G1 X107.129 Y125.331 E.1668
G1 X107.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F11345
G1 X107.524 Y124.081 E.00149
; LINE_WIDTH: 0.179229
G1 X107.593 Y123.99 E.00126
; LINE_WIDTH: 0.195631
G1 X107.694 Y123.842 E.00224
G1 X107.671 Y123.664 F30000
; LINE_WIDTH: 0.119476
G1 F11345
G3 X107.601 Y124.078 I-8.31 J-1.202 E.00262
G1 X107.672 Y122.292 F30000
; LINE_WIDTH: 0.0969202
G1 F11345
G1 X107.654 Y122.187 E.00047
; LINE_WIDTH: 0.136067
G1 X107.629 Y122.056 E.00101
; LINE_WIDTH: 0.173114
G1 X107.571 Y121.97 E.0011
; LINE_WIDTH: 0.126784
G1 X107.453 Y121.806 E.00138
G1 X107.506 Y121.335 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11345
G1 X107.506 Y111.722 E.29538
G1 X107.387 Y111.748 E.00373
G1 X107.267 Y111.654 E.0047
G1 X107.104 Y111.824 E.00724
G1 X106.706 Y112.106 E.01496
G1 X106.261 Y112.302 E.01496
G1 X105.785 Y112.407 E.01496
G1 X105.299 Y112.415 E.01496
G1 X104.82 Y112.327 E.01496
G1 X104.368 Y112.146 E.01496
G1 X103.954 Y111.872 E.01525
G1 X103.662 Y111.556 E.01321
G1 X103.566 Y111.628 E.00367
G1 X103.494 Y111.614 E.00225
G1 X103.494 Y121.238 E.29571
G1 X103.621 Y121.219 E.00392
G1 X103.733 Y121.303 E.00433
G1 X103.896 Y121.133 E.00724
G1 X104.294 Y120.852 E.01496
G1 X104.739 Y120.655 E.01496
G1 X105.215 Y120.55 E.01496
G1 X105.701 Y120.542 E.01496
G1 X106.18 Y120.63 E.01496
G1 X106.632 Y120.812 E.01496
G1 X107.046 Y121.086 E.01525
G1 X107.338 Y121.401 E.01321
G1 X107.447 Y121.325 E.00409
G1 X107.129 Y120.683 F30000
G1 F11345
G1 X107.129 Y112.271 E.2585
G1 X106.861 Y112.449 E.00988
G1 X106.345 Y112.67 E.01726
G1 X105.795 Y112.784 E.01726
G1 X105.233 Y112.787 E.01726
G1 X104.682 Y112.678 E.01726
G1 X104.163 Y112.463 E.01726
G1 X103.871 Y112.274 E.01068
G1 X103.871 Y120.687 E.2585
G1 X104.139 Y120.508 E.00988
G1 X104.655 Y120.287 E.01726
G1 X105.205 Y120.173 E.01726
G1 X105.767 Y120.171 E.01726
G1 X106.318 Y120.279 E.01726
G1 X106.837 Y120.495 E.01726
G1 X107.078 Y120.651 E.00884
G1 X106.752 Y120.044 F30000
G1 F11345
G1 X106.752 Y112.912 E.21914
G1 X106.429 Y113.038 E.01064
G1 X105.804 Y113.161 E.01956
G1 X105.168 Y113.158 E.01956
G1 X104.544 Y113.029 E.01956
G1 X104.248 Y112.913 E.00977
G1 X104.248 Y120.045 E.21914
G1 X104.571 Y119.92 E.01064
G1 X105.196 Y119.796 E.01956
G1 X105.832 Y119.799 E.01956
G1 X106.456 Y119.928 E.01956
G1 X106.696 Y120.022 E.00792
G1 X106.375 Y119.516 F30000
G1 F11345
G1 X106.375 Y113.437 E.18678
G1 X105.814 Y113.538 E.01752
G1 X105.102 Y113.53 E.02186
G1 X104.625 Y113.442 E.01489
G1 X104.625 Y119.521 E.18678
G1 X105.186 Y119.42 E.01752
G1 X105.898 Y119.428 E.02186
G1 X106.316 Y119.505 E.01305
G1 X105.998 Y119.028 F30000
G1 F11345
G1 X105.998 Y113.893 E.15778
G3 X105.002 Y113.93 I-.892 J-10.726 E.03061
G1 X105.002 Y119.064 E.15778
G3 X105.938 Y119.029 I.852 J10.058 E.02876
G1 X105.654 Y118.691 F30000
; LINE_WIDTH: 0.351907
G1 F11345
G1 X105.654 Y114.262 E.11151
G1 X105.346 Y114.266 E.00778
G1 X105.346 Y118.695 E.11151
G1 X105.594 Y118.692 E.00627
G1 X103.608 Y121.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F11345
G1 X103.544 Y121.786 E.00044
; LINE_WIDTH: 0.111408
G1 X103.476 Y121.876 E.00063
; LINE_WIDTH: 0.147275
G1 X103.403 Y121.973 E.00103
; LINE_WIDTH: 0.18165
G1 X103.306 Y122.115 E.00195
G1 X103.329 Y122.294 F30000
; LINE_WIDTH: 0.119476
G1 F11345
G3 X103.399 Y121.879 I8.328 J1.205 E.00262
G1 X103.329 Y123.664 F30000
; LINE_WIDTH: 0.119478
G1 F11345
G2 X103.399 Y124.078 I8.231 J-1.19 E.00262
G1 X103.476 Y124.081 F30000
; LINE_WIDTH: 0.147276
G1 F11345
G1 X103.403 Y123.985 E.00103
; LINE_WIDTH: 0.181649
G1 X103.306 Y123.842 E.00195
G1 X103.476 Y124.081 F30000
; LINE_WIDTH: 0.11141
G1 F11345
G1 X103.544 Y124.172 E.00063
; LINE_WIDTH: 0.0973919
G1 X103.608 Y124.248 E.00044
G1 X103.547 Y111.152 F30000
; LINE_WIDTH: 0.0973913
G1 F11345
G1 X103.487 Y111.073 E.00044
; LINE_WIDTH: 0.111388
G1 X103.429 Y110.987 E.00058
; LINE_WIDTH: 0.146005
G3 X103.367 Y110.887 I.1 J-.131 E.00101
; LINE_WIDTH: 0.16652
G1 X103.355 Y110.821 E.00068
; LINE_WIDTH: 0.126453
G1 X103.329 Y110.664 E.00108
G1 X103.329 Y109.294 F30000
; LINE_WIDTH: 0.11947
G1 F11345
G3 X103.399 Y108.879 I8.327 J1.205 E.00262
G1 X103.476 Y108.876 F30000
; LINE_WIDTH: 0.147271
G1 F11345
G1 X103.403 Y108.973 E.00103
; LINE_WIDTH: 0.181644
G1 X103.306 Y109.115 E.00195
G1 X103.476 Y108.876 F30000
; LINE_WIDTH: 0.111406
G1 F11345
G1 X103.544 Y108.786 E.00063
; LINE_WIDTH: 0.0973912
G1 X103.608 Y108.71 E.00044
; WIPE_START
G1 F24000
G1 X103.544 Y108.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.006 J1.217 P1  F30000
G1 X107.453 Y108.806 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.126782
G1 F11345
G1 X107.571 Y108.97 E.00138
; LINE_WIDTH: 0.17311
G1 X107.629 Y109.056 E.0011
; LINE_WIDTH: 0.136066
G1 X107.654 Y109.187 E.00101
; LINE_WIDTH: 0.0969205
M73 P80 R3
G1 X107.672 Y109.292 E.00047
G1 X107.506 Y108.335 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11345
G1 X107.506 Y103.473 E.1494
G1 X103.494 Y103.473 E.12327
G1 X103.494 Y108.238 E.1464
G1 X103.621 Y108.219 E.00392
G1 X103.733 Y108.303 E.00433
G1 X103.896 Y108.133 E.00724
G1 X104.294 Y107.852 E.01496
G1 X104.739 Y107.655 E.01496
G1 X105.215 Y107.55 E.01496
G1 X105.701 Y107.542 E.01496
G1 X106.18 Y107.63 E.01496
G1 X106.632 Y107.812 E.01496
G1 X107.046 Y108.086 E.01525
G1 X107.338 Y108.401 E.01321
G1 X107.447 Y108.325 E.00409
G1 X107.129 Y107.683 F30000
G1 F11345
G1 X107.129 Y103.85 E.11779
G1 X103.871 Y103.85 E.10009
G1 X103.871 Y107.687 E.11789
G1 X104.139 Y107.508 E.00988
G1 X104.655 Y107.287 E.01726
G1 X105.205 Y107.173 E.01726
G1 X105.767 Y107.171 E.01726
G1 X106.318 Y107.279 E.01726
G1 X106.837 Y107.495 E.01726
G1 X107.078 Y107.651 E.00884
G1 X106.752 Y107.044 F30000
G1 F11345
G1 X106.752 Y104.227 E.08657
G1 X104.248 Y104.227 E.07692
G1 X104.248 Y107.045 E.08659
G1 X104.571 Y106.92 E.01064
G1 X105.196 Y106.796 E.01956
G1 X105.832 Y106.799 E.01956
G1 X106.456 Y106.928 E.01956
G1 X106.696 Y107.022 E.00792
G1 X106.375 Y106.516 F30000
G1 F11345
G1 X106.375 Y104.604 E.05873
G1 X104.625 Y104.604 E.05375
G1 X104.625 Y106.521 E.05889
G1 X105.186 Y106.42 E.01752
G1 X105.898 Y106.428 E.02186
G1 X106.316 Y106.505 E.01305
G1 X105.998 Y106.028 F30000
G1 F11345
G1 X105.998 Y104.981 E.03216
G1 X105.002 Y104.981 E.03058
G1 X105.002 Y106.064 E.03328
G3 X105.938 Y106.029 I.852 J10.058 E.02876
G1 X105.654 Y105.691 F30000
; LINE_WIDTH: 0.351907
G1 F11345
G1 X105.654 Y105.324 E.00924
G1 X105.346 Y105.324 E.00778
G1 X105.346 Y105.695 E.00934
G1 X105.594 Y105.692 E.00627
G1 X107.671 Y110.664 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119473
G1 F11345
G3 X107.601 Y111.078 I-8.249 J-1.193 E.00262
G1 X107.524 Y111.081 F30000
; LINE_WIDTH: 0.129158
G1 F11345
G1 X107.392 Y111.248 E.00149
G1 X107.524 Y111.081 F30000
; LINE_WIDTH: 0.179212
G1 F11345
G1 X107.593 Y110.99 E.00126
; LINE_WIDTH: 0.195624
G1 X107.694 Y110.842 E.00224
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.593 Y110.99 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/64
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
G3 Z7 I-.268 J1.187 P1  F30000
G1 X156.284 Y121.969 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11379
G1 X156.302 Y121.997 E.00112
G3 X154.245 Y120.942 I-1.802 J.98 E.34611
G1 X154.449 Y120.927 E.00679
G3 X156.072 Y121.66 I.051 J2.051 E.06112
G1 X156.25 Y121.919 E.01044
G1 X155.895 Y122.092 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11379
G1 X155.958 Y122.185 E.00345
G3 X154.294 Y121.331 I-1.458 J.793 E.25929
G1 X154.459 Y121.319 E.00509
G3 X155.772 Y121.912 I.041 J1.659 E.04579
G1 X155.861 Y122.043 E.00487
M204 S10000
; WIPE_START
G1 F24000
G1 X155.958 Y122.185 E-.06542
G1 X156.087 Y122.489 E-.12561
G1 X156.152 Y122.812 E-.12498
G1 X156.158 Y123.062 E-.09506
G1 X156.109 Y123.388 E-.12552
G1 X155.996 Y123.699 E-.12563
G1 X155.862 Y123.919 E-.09778
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.205 J-.173 P1  F30000
G1 X153.595 Y108.14 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11379
G1 X153.944 Y108.003 E.01245
G3 X154.339 Y107.933 I.556 J1.975 E.01333
G1 X154.456 Y107.927 E.00389
G3 X153.54 Y108.165 I.043 J2.051 E.39588
G1 X153.701 Y108.528 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11379
G1 X153.743 Y108.501 E.00152
G3 X154.373 Y108.323 I.757 J1.476 E.02027
G1 X154.461 Y108.319 E.0027
G3 X153.465 Y108.681 I.039 J1.659 E.28718
G1 X153.651 Y108.561 E.0068
M204 S10000
; WIPE_START
G1 F24000
G1 X153.743 Y108.501 E-.04154
G1 X154.05 Y108.381 E-.12563
G1 X154.373 Y108.323 E-.12464
G1 X154.461 Y108.319 E-.03345
G1 X154.788 Y108.344 E-.12464
G1 X155.107 Y108.433 E-.12563
G1 X155.401 Y108.584 E-.12564
G1 X155.522 Y108.681 E-.05884
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.08 J-1.214 P1  F30000
G1 X105.111 Y111.991 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11379
G1 X104.751 Y111.887 E.01244
G3 X105.339 Y107.933 I.749 J-1.91 E.18301
G1 X105.456 Y107.927 E.00389
G3 X105.17 Y112.002 I.043 J2.051 E.22621
G1 X105.212 Y111.612 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11379
G3 X105.373 Y108.323 I.288 J-1.634 E.14738
G1 X105.461 Y108.319 E.0027
G3 X105.271 Y111.621 I.039 J1.659 E.1684
M204 S10000
; WIPE_START
G1 F24000
G1 X104.893 Y111.524 E-.1482
G1 X104.599 Y111.373 E-.12563
G1 X104.341 Y111.167 E-.12563
G1 X104.128 Y110.914 E-.12564
G1 X103.97 Y110.624 E-.12562
G1 X103.913 Y110.468 E-.0629
G1 X103.889 Y110.349 E-.04636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.197 J.222 P1  F30000
G1 X106.554 Y124.737 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11379
G1 X106.525 Y124.754 E.00111
G3 X105.245 Y120.942 I-1.025 J-1.777 E.24093
G1 X105.449 Y120.927 E.00679
G3 X106.857 Y124.516 I.051 J2.051 E.16631
G1 X106.602 Y124.702 E.01045
G1 X106.292 Y124.434 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11379
G1 X106.028 Y124.551 E.00887
G3 X105.294 Y121.331 I-.528 J-1.573 E.17033
G1 X105.459 Y121.319 E.00509
G3 X106.345 Y124.406 I.041 J1.659 E.13419
M204 S10000
; WIPE_START
G1 F24000
G1 X106.028 Y124.551 E-.13242
G1 X105.706 Y124.626 E-.12556
G1 X105.376 Y124.634 E-.12563
G1 X105.05 Y124.577 E-.12564
G1 X104.743 Y124.456 E-.12564
G1 X104.466 Y124.278 E-.12511
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.194 J1.201 P1  F30000
G1 X151.983 Y131.952 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11379
G1 X152.102 Y131.57 E.01326
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.226 E1.93421
G1 X151.965 Y132.01 E.02517
G1 X151.609 Y131.835 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11379
G1 X151.71 Y131.511 E.01045
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.591 Y131.893 E.02301
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.15206
G1 X151.71 Y129.911 E-.60794
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.204 J.18 P1  F30000
G1 X152.137 Y132.765 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11379
G1 X156.145 Y132.765 E.12316
G1 X156.506 Y131.357 E.04466
G1 X156.506 Y124.722 E.20388
G1 X156.387 Y124.748 E.00373
G1 X156.267 Y124.654 E.0047
G1 X156.104 Y124.824 E.00724
G1 X155.706 Y125.106 E.01496
G1 X155.261 Y125.302 E.01496
G1 X154.785 Y125.407 E.01496
G1 X154.299 Y125.415 E.01496
G1 X153.82 Y125.327 E.01496
G1 X153.368 Y125.146 E.01496
G1 X152.954 Y124.872 E.01525
G1 X152.662 Y124.556 E.01321
G1 X152.566 Y124.628 E.00367
G1 X152.494 Y124.614 E.00225
G1 X152.494 Y131.601 E.21471
G1 X152.155 Y132.708 E.03555
G1 X154.346 Y127.266 F30000
; LINE_WIDTH: 0.351907
G1 F11379
G1 X154.346 Y130.914 E.09183
G1 X154.654 Y130.914 E.00778
G1 X154.654 Y127.262 E.09193
G1 X154.406 Y127.266 E.00627
G1 X154.002 Y126.93 F30000
; LINE_WIDTH: 0.419999
G1 F11379
G1 X154.002 Y131.257 E.13296
G1 X154.977 Y131.257 E.02993
G1 X154.998 Y130.759 E.0153
G1 X154.998 Y126.893 E.11879
G3 X154.062 Y126.929 I-.854 J-10.084 E.02876
G1 X153.625 Y126.442 F30000
G1 F11379
G1 X153.62 Y131.634 E.15953
G1 X155.271 Y131.634 E.05073
G1 X155.375 Y131.161 E.01488
G1 X155.375 Y126.437 E.14515
G1 X154.814 Y126.538 E.01752
G1 X154.102 Y126.53 E.02186
G1 X153.684 Y126.453 E.01305
G1 X153.248 Y125.913 F30000
G1 F11379
G1 X153.248 Y131.601 E.17478
G1 X153.165 Y132.011 E.01284
G1 X155.566 Y132.011 E.07378
G1 X155.752 Y131.265 E.02362
G1 X155.752 Y125.912 E.16446
G1 X155.429 Y126.038 E.01064
G1 X154.804 Y126.161 E.01956
G1 X154.168 Y126.158 E.01956
G1 X153.544 Y126.029 E.01956
G1 X153.304 Y125.935 E.00792
G1 X152.871 Y125.274 F30000
G1 F11379
G1 X152.871 Y131.601 E.19442
G1 X152.651 Y132.388 E.02509
G1 X155.861 Y132.388 E.09864
G1 X156.129 Y131.311 E.0341
G1 X156.129 Y125.271 E.18559
G1 X155.861 Y125.449 E.00988
G1 X155.345 Y125.67 E.01726
G1 X154.795 Y125.784 E.01726
G1 X154.233 Y125.787 E.01726
G1 X153.682 Y125.678 E.01726
G1 X153.163 Y125.463 E.01726
G1 X152.922 Y125.307 E.00884
G1 X152.547 Y124.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973913
G1 F11379
G1 X152.487 Y124.073 E.00044
; LINE_WIDTH: 0.111403
G1 X152.429 Y123.987 E.00058
; LINE_WIDTH: 0.148184
G3 X152.365 Y123.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16145
G1 X152.346 Y123.771 E.00103
; LINE_WIDTH: 0.129185
G1 X152.328 Y123.666 E.00075
G1 X152.328 Y122.292 F30000
; LINE_WIDTH: 0.129184
G1 F11379
G1 X152.346 Y122.187 E.00075
; LINE_WIDTH: 0.161448
G1 X152.365 Y122.082 E.00103
; LINE_WIDTH: 0.137099
G3 X152.429 Y121.979 I.162 J.03 E.00095
; LINE_WIDTH: 0.103104
G1 X152.491 Y121.886 E.00055
; LINE_WIDTH: 0.0971952
G1 X152.527 Y121.838 E.00027
G1 X152.494 Y121.373 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11379
G3 X152.635 Y121.43 I.031 J.124 E.00498
G1 X152.899 Y121.131 E.01225
G1 X153.294 Y120.852 E.01486
G1 X153.739 Y120.655 E.01496
G1 X154.215 Y120.55 E.01496
G1 X154.701 Y120.542 E.01496
G1 X155.18 Y120.63 E.01496
G1 X155.632 Y120.812 E.01496
G1 X156.046 Y121.086 E.01525
G1 X156.338 Y121.401 E.01321
G1 X156.441 Y121.324 E.00395
G1 X156.506 Y121.335 E.00203
G1 X156.506 Y111.722 E.29538
G1 X156.387 Y111.748 E.00373
G1 X156.267 Y111.654 E.0047
G1 X156.104 Y111.824 E.00724
G1 X155.706 Y112.106 E.01496
G1 X155.261 Y112.302 E.01496
G1 X154.785 Y112.407 E.01496
G1 X154.299 Y112.415 E.01496
G1 X153.82 Y112.327 E.01496
G1 X153.368 Y112.146 E.01496
G1 X152.954 Y111.872 E.01525
G1 X152.662 Y111.556 E.01321
G1 X152.566 Y111.628 E.00367
G1 X152.494 Y111.614 E.00225
G1 X152.494 Y121.313 E.29802
G1 X152.871 Y120.687 F30000
G1 F11379
G1 X153.139 Y120.508 E.00988
G1 X153.655 Y120.287 E.01726
G1 X154.205 Y120.173 E.01726
G1 X154.767 Y120.171 E.01726
G1 X155.318 Y120.279 E.01726
G1 X155.837 Y120.495 E.01726
G1 X156.129 Y120.683 E.01068
G1 X156.129 Y112.271 E.2585
G1 X155.861 Y112.449 E.00988
G1 X155.345 Y112.67 E.01726
G1 X154.795 Y112.784 E.01726
G1 X154.233 Y112.787 E.01726
G1 X153.682 Y112.678 E.01726
G1 X153.163 Y112.463 E.01726
G1 X152.871 Y112.274 E.01068
G1 X152.871 Y120.627 E.25665
G1 X153.248 Y120.045 F30000
G1 F11379
G1 X153.571 Y119.92 E.01064
G1 X154.196 Y119.796 E.01956
G1 X154.832 Y119.799 E.01956
G1 X155.456 Y119.928 E.01956
G1 X155.752 Y120.044 E.00977
G1 X155.752 Y112.912 E.21914
G1 X155.429 Y113.038 E.01064
G1 X154.804 Y113.161 E.01956
G1 X154.168 Y113.158 E.01956
G1 X153.544 Y113.029 E.01956
G1 X153.248 Y112.913 E.00977
G1 X153.248 Y119.985 E.2173
G1 X153.625 Y119.521 F30000
G1 F11379
G1 X154.186 Y119.42 E.01752
G1 X154.898 Y119.428 E.02186
G1 X155.375 Y119.516 E.01489
G1 X155.375 Y113.437 E.18678
G1 X154.814 Y113.538 E.01752
G1 X154.102 Y113.53 E.02186
G1 X153.625 Y113.442 E.01489
G1 X153.625 Y119.461 E.18494
G1 X154.002 Y119.064 F30000
G1 F11379
G3 X154.998 Y119.028 I.892 J10.727 E.03061
G1 X154.998 Y113.893 E.15778
G3 X154.002 Y113.93 I-.892 J-10.732 E.03061
G1 X154.002 Y119.004 E.15594
G1 X154.346 Y118.695 F30000
; LINE_WIDTH: 0.351907
G1 F11379
G1 X154.654 Y118.691 E.00778
G1 X154.654 Y114.262 E.11151
G1 X154.346 Y114.266 E.00778
G1 X154.346 Y118.635 E.11
G1 X156.453 Y121.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126786
G1 F11379
G1 X156.571 Y121.97 E.00138
; LINE_WIDTH: 0.173115
G1 X156.629 Y122.056 E.0011
; LINE_WIDTH: 0.136068
G1 X156.654 Y122.187 E.00101
; LINE_WIDTH: 0.0969205
G1 X156.672 Y122.292 E.00047
G1 X156.671 Y123.664 F30000
; LINE_WIDTH: 0.119477
G1 F11379
G3 X156.601 Y124.078 I-8.246 J-1.193 E.00262
G1 X156.524 Y124.081 F30000
; LINE_WIDTH: 0.129164
G1 F11379
G1 X156.392 Y124.248 E.00149
G1 X156.524 Y124.081 F30000
; LINE_WIDTH: 0.179227
G1 F11379
G1 X156.593 Y123.99 E.00126
; LINE_WIDTH: 0.195637
G1 X156.694 Y123.842 E.00224
G1 X156.392 Y111.248 F30000
; LINE_WIDTH: 0.129163
G1 F11379
G1 X156.524 Y111.081 E.00149
; LINE_WIDTH: 0.179223
G1 X156.593 Y110.99 E.00126
; LINE_WIDTH: 0.195635
G1 X156.694 Y110.842 E.00224
G1 X156.671 Y110.664 F30000
; LINE_WIDTH: 0.119483
G1 F11379
G3 X156.601 Y111.078 I-8.333 J-1.206 E.00262
G1 X156.672 Y109.292 F30000
; LINE_WIDTH: 0.0969206
G1 F11379
G1 X156.654 Y109.187 E.00047
; LINE_WIDTH: 0.136068
G1 X156.629 Y109.056 E.00101
; LINE_WIDTH: 0.173114
G1 X156.571 Y108.97 E.0011
; LINE_WIDTH: 0.126784
G1 X156.453 Y108.806 E.00138
; WIPE_START
G1 F24000
G1 X156.571 Y108.97 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.05 J-1.216 P1  F30000
G1 X152.547 Y108.806 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.0973917
G1 F11379
G1 X152.487 Y108.885 E.00044
; LINE_WIDTH: 0.111407
G1 X152.429 Y108.97 E.00058
; LINE_WIDTH: 0.148183
G2 X152.365 Y109.082 I.121 J.144 E.00113
; LINE_WIDTH: 0.161457
G1 X152.346 Y109.187 E.00103
; LINE_WIDTH: 0.129189
G1 X152.328 Y109.292 E.00075
G1 X152.494 Y108.339 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11379
G3 X152.662 Y108.401 I.041 J.148 E.00588
G1 X152.99 Y108.055 E.01464
G1 X153.401 Y107.794 E.01496
G1 X153.856 Y107.62 E.01495
G1 X154.506 Y107.54 E.02013
G1 X155.144 Y107.62 E.01976
G1 X155.632 Y107.812 E.01611
G1 X156.046 Y108.086 E.01525
G1 X156.338 Y108.401 E.01321
G1 X156.441 Y108.324 E.00395
G1 X156.506 Y108.335 E.00203
G1 X156.506 Y103.473 E.1494
G1 X152.494 Y103.473 E.12327
G1 X152.494 Y108.279 E.14767
G1 X152.871 Y107.683 F30000
G1 F11379
G1 X153.263 Y107.443 E.01413
G1 X153.79 Y107.249 E.01724
G1 X154.319 Y107.163 E.01648
G1 X154.769 Y107.171 E.01383
G1 X155.318 Y107.279 E.01719
G1 X155.837 Y107.495 E.01726
G1 X156.129 Y107.683 E.01068
G1 X156.129 Y103.85 E.11779
G1 X152.871 Y103.85 E.10009
G1 X152.871 Y107.623 E.11595
G1 X153.248 Y107.044 F30000
G1 F11379
G1 X153.724 Y106.878 E.01549
G1 X154.318 Y106.786 E.01847
G1 X154.835 Y106.8 E.01588
G1 X155.456 Y106.928 E.01949
G1 X155.752 Y107.044 E.00977
G1 X155.752 Y104.227 E.08657
G1 X153.248 Y104.227 E.07692
G1 X153.248 Y106.984 E.08472
G1 X153.625 Y106.515 F30000
G1 F11379
G1 X154.317 Y106.409 E.0215
G3 X155.375 Y106.516 I.176 J3.57 E.03278
G1 X155.375 Y104.604 E.05873
G1 X153.625 Y104.604 E.05375
G1 X153.625 Y106.455 E.05689
G1 X154.002 Y106.062 F30000
G1 F11379
G1 X154.666 Y106.031 E.02041
G1 X154.998 Y106.063 E.01024
G1 X154.998 Y104.981 E.03323
G1 X154.002 Y104.981 E.03058
G1 X154.002 Y106.002 E.03137
G1 X154.346 Y105.689 F30000
; LINE_WIDTH: 0.351907
G1 F11379
G1 X154.654 Y105.688 E.00778
G1 X154.654 Y105.324 E.00916
G1 X154.346 Y105.324 E.00778
G1 X154.346 Y105.629 E.00768
G1 X152.328 Y110.666 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129187
G1 F11379
G1 X152.346 Y110.771 E.00075
; LINE_WIDTH: 0.161454
G1 X152.365 Y110.876 E.00103
; LINE_WIDTH: 0.148168
G2 X152.429 Y110.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111392
G1 X152.487 Y111.073 E.00058
; LINE_WIDTH: 0.0973915
G1 X152.547 Y111.152 E.00044
; WIPE_START
G1 F24000
G1 X152.487 Y111.073 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.21 J-.126 P1  F30000
G1 X149.713 Y137.777 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11379
G3 X148.8 Y139.124 I-24.599 J-15.688 E.054
G1 X151.597 Y141.921 E.13123
G3 X147.88 Y145.88 I-22.36 J-17.27 E.18042
G1 X145.102 Y143.102 E.13036
G3 X140.486 Y146.162 I-17.246 J-20.999 E.18403
G1 X143.384 Y149.06 E.13596
G3 X141.956 Y149.806 I-8.297 J-14.14 E.05346
G1 X141.941 Y149.813 E.00057
G1 X153.773 Y138.614 F30000
G1 F11379
G2 X154.519 Y137.167 I-14.332 J-8.31 E.05402
G1 X151.555 Y134.203 E.13905
G2 X151.955 Y133.157 I-10.305 J-4.538 E.03717
G1 X155.547 Y133.157 E.11915
G1 X137.061 Y151.643 E.86721
G2 X138.013 Y151.365 I-2.35 J-9.814 E.03291
G1 X134.805 Y148.157 E.15049
G3 X132.51 Y148.518 I-11.047 J-62.719 E.07708
G1 X128.498 Y152.53 E.1882
G2 X131.502 Y152.53 I1.502 J-27.504 E.0997
G1 X127.495 Y148.523 E.18798
G3 X125.195 Y148.157 I3.004 J-26.288 E.07727
G1 X121.987 Y151.365 E.15049
G2 X122.939 Y151.643 I3.302 J-9.535 E.03291
G1 X104.453 Y133.157 E.86721
G1 X108.045 Y133.157 E.11915
G2 X108.445 Y134.203 I10.706 J-3.492 E.03717
G1 X105.481 Y137.167 E.13905
G2 X106.227 Y138.614 I15.077 J-6.863 E.05402
G1 X110.287 Y137.777 F30000
M73 P81 R3
G1 F11379
G2 X111.2 Y139.124 I24.6 J-15.689 E.054
G1 X108.403 Y141.921 E.13123
G2 X112.12 Y145.88 I22.36 J-17.269 E.18042
G1 X114.898 Y143.102 E.13036
G2 X119.514 Y146.162 I17.246 J-20.999 E.18403
G1 X116.616 Y149.06 E.13596
G2 X118.059 Y149.813 I8.378 J-14.292 E.05403
G1 X107.863 Y132.765 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11379
G1 X107.515 Y131.658 E.03566
G1 X107.506 Y124.722 E.21313
G1 X107.387 Y124.748 E.00373
G1 X107.267 Y124.654 E.0047
G1 X107.104 Y124.824 E.00724
G1 X106.706 Y125.106 E.01496
G1 X106.261 Y125.302 E.01496
G1 X105.785 Y125.407 E.01496
G1 X105.299 Y125.415 E.01496
G1 X104.82 Y125.327 E.01496
G1 X104.368 Y125.146 E.01496
G1 X103.954 Y124.872 E.01525
G1 X103.662 Y124.556 E.01321
G1 X103.566 Y124.628 E.00367
G1 X103.494 Y124.614 E.00225
G1 X103.494 Y131.357 E.2072
G1 X103.855 Y132.765 E.04466
G1 X107.803 Y132.765 E.12131
G1 X105.654 Y127.262 F30000
; LINE_WIDTH: 0.351907
G1 F11379
G1 X105.346 Y127.266 E.00778
G1 X105.346 Y130.914 E.09183
G1 X105.654 Y130.914 E.00778
G1 X105.654 Y127.322 E.09042
G1 X105.998 Y126.893 F30000
; LINE_WIDTH: 0.419999
G1 F11379
G3 X105.002 Y126.93 I-.892 J-10.733 E.03061
G1 X105.002 Y131.172 E.13037
G1 X105.023 Y131.257 E.00267
G1 X105.998 Y131.257 E.02993
G1 X105.998 Y126.953 E.13224
G1 X106.375 Y126.437 F30000
G1 F11379
G1 X105.814 Y126.538 E.01752
G1 X105.102 Y126.53 E.02186
G1 X104.625 Y126.442 E.01489
G1 X104.625 Y131.219 E.14677
G1 X104.729 Y131.634 E.01314
G1 X106.38 Y131.634 E.05073
G3 X106.375 Y126.497 I453.083 J-3.006 E.15784
G1 X106.752 Y125.912 F30000
G1 F11379
G1 X106.429 Y126.038 E.01064
G1 X105.804 Y126.161 E.01956
G1 X105.168 Y126.158 E.01956
G1 X104.544 Y126.029 E.01956
G1 X104.248 Y125.913 E.00977
G1 X104.248 Y131.265 E.16444
G1 X104.434 Y132.011 E.02362
G1 X106.835 Y132.011 E.07378
G1 X106.752 Y131.601 E.01284
G1 X106.752 Y125.972 E.17296
G1 X107.129 Y125.271 F30000
G1 F11379
G1 X106.861 Y125.449 E.00988
G1 X106.345 Y125.67 E.01726
G1 X105.795 Y125.784 E.01726
G1 X105.233 Y125.787 E.01726
G1 X104.682 Y125.678 E.01726
G1 X104.163 Y125.463 E.01726
G1 X103.871 Y125.274 E.01068
G1 X103.871 Y131.311 E.18549
G1 X104.139 Y132.388 E.0341
G1 X107.349 Y132.388 E.09864
G1 X107.155 Y131.771 E.01986
G1 X107.129 Y130.759 E.03111
G1 X107.129 Y125.331 E.1668
G1 X107.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129164
G1 F11379
G1 X107.524 Y124.081 E.00149
; LINE_WIDTH: 0.179226
G1 X107.593 Y123.99 E.00126
; LINE_WIDTH: 0.195635
G1 X107.694 Y123.842 E.00224
G1 X107.671 Y123.664 F30000
; LINE_WIDTH: 0.119473
G1 F11379
G3 X107.601 Y124.078 I-8.235 J-1.191 E.00262
G1 X107.672 Y122.292 F30000
; LINE_WIDTH: 0.0969205
G1 F11379
G1 X107.654 Y122.187 E.00047
; LINE_WIDTH: 0.136066
G1 X107.629 Y122.056 E.00101
; LINE_WIDTH: 0.173112
G1 X107.571 Y121.97 E.0011
; LINE_WIDTH: 0.126784
G1 X107.453 Y121.806 E.00138
G1 X107.506 Y121.335 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11379
G1 X107.506 Y111.722 E.29538
G1 X107.387 Y111.748 E.00373
G1 X107.267 Y111.654 E.0047
G1 X107.104 Y111.824 E.00724
G1 X106.706 Y112.106 E.01496
G1 X106.261 Y112.302 E.01496
G1 X105.785 Y112.407 E.01496
G1 X105.299 Y112.415 E.01496
G1 X104.82 Y112.327 E.01496
G1 X104.368 Y112.146 E.01496
G1 X103.954 Y111.872 E.01525
G1 X103.662 Y111.556 E.01321
G1 X103.566 Y111.628 E.00367
G1 X103.494 Y111.614 E.00225
G1 X103.494 Y121.388 E.30034
G1 X103.626 Y121.439 E.00435
G1 X103.899 Y121.131 E.01264
G1 X104.294 Y120.852 E.01486
G1 X104.739 Y120.655 E.01496
G1 X105.215 Y120.55 E.01496
G1 X105.701 Y120.542 E.01496
G1 X106.18 Y120.63 E.01496
G1 X106.632 Y120.812 E.01496
G1 X107.046 Y121.086 E.01525
G1 X107.338 Y121.401 E.01321
G1 X107.447 Y121.325 E.00409
G1 X107.129 Y120.683 F30000
G1 F11379
G1 X107.129 Y112.271 E.2585
G1 X106.861 Y112.449 E.00988
G1 X106.345 Y112.67 E.01726
G1 X105.795 Y112.784 E.01726
G1 X105.233 Y112.787 E.01726
G1 X104.682 Y112.678 E.01726
G1 X104.163 Y112.463 E.01726
G1 X103.871 Y112.274 E.01068
G1 X103.871 Y120.687 E.2585
G1 X104.139 Y120.508 E.00988
G1 X104.655 Y120.287 E.01726
G1 X105.205 Y120.173 E.01726
G1 X105.767 Y120.171 E.01726
G1 X106.318 Y120.279 E.01726
G1 X106.837 Y120.495 E.01726
G1 X107.078 Y120.651 E.00884
G1 X106.752 Y120.044 F30000
G1 F11379
G1 X106.752 Y112.912 E.21914
G1 X106.429 Y113.038 E.01064
G1 X105.804 Y113.161 E.01956
G1 X105.168 Y113.158 E.01956
G1 X104.544 Y113.029 E.01956
G1 X104.248 Y112.913 E.00977
G1 X104.248 Y120.045 E.21914
G1 X104.571 Y119.92 E.01064
G1 X105.196 Y119.796 E.01956
G1 X105.832 Y119.799 E.01956
G1 X106.456 Y119.928 E.01956
G1 X106.696 Y120.022 E.00792
G1 X106.375 Y119.516 F30000
G1 F11379
G1 X106.375 Y113.437 E.18678
G1 X105.814 Y113.538 E.01752
G1 X105.102 Y113.53 E.02186
G1 X104.625 Y113.442 E.0149
G1 X104.625 Y119.521 E.18678
G1 X105.186 Y119.42 E.01752
G1 X105.898 Y119.428 E.02186
G1 X106.316 Y119.505 E.01305
G1 X105.998 Y119.063 F30000
G1 F11379
G1 X105.998 Y113.893 E.15885
G3 X105.002 Y113.93 I-.892 J-10.734 E.03061
G1 X105.002 Y119.064 E.15778
G3 X105.938 Y119.055 I.509 J4.275 E.02881
G1 X105.654 Y118.691 F30000
; LINE_WIDTH: 0.351907
G1 F11379
G1 X105.654 Y114.262 E.11151
G1 X105.346 Y114.266 E.00778
G1 X105.346 Y118.695 E.11151
G1 X105.594 Y118.692 E.00627
G1 X103.527 Y121.837 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0971998
G1 F11379
G1 X103.491 Y121.886 E.00027
; LINE_WIDTH: 0.10332
G1 X103.429 Y121.979 E.00055
; LINE_WIDTH: 0.137386
G2 X103.365 Y122.082 I.099 J.133 E.00096
; LINE_WIDTH: 0.161453
G1 X103.346 Y122.187 E.00103
; LINE_WIDTH: 0.129186
G1 X103.328 Y122.292 E.00075
G1 X103.328 Y123.666 F30000
; LINE_WIDTH: 0.129187
G1 F11379
G1 X103.346 Y123.771 E.00075
; LINE_WIDTH: 0.161454
G1 X103.365 Y123.876 E.00103
; LINE_WIDTH: 0.148187
G2 X103.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111407
G1 X103.487 Y124.073 E.00058
; LINE_WIDTH: 0.0973915
G1 X103.547 Y124.152 E.00044
G1 X103.547 Y111.152 F30000
; LINE_WIDTH: 0.0973905
G1 F11379
G1 X103.487 Y111.073 E.00044
; LINE_WIDTH: 0.111395
G1 X103.429 Y110.987 E.00058
; LINE_WIDTH: 0.148172
G3 X103.365 Y110.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X103.346 Y110.771 E.00103
; LINE_WIDTH: 0.129189
G1 X103.328 Y110.666 E.00075
G1 X103.328 Y109.292 F30000
; LINE_WIDTH: 0.129191
G1 F11379
G1 X103.346 Y109.187 E.00075
; LINE_WIDTH: 0.161461
G1 X103.365 Y109.082 E.00103
; LINE_WIDTH: 0.148179
G3 X103.429 Y108.97 I.185 J.032 E.00113
; LINE_WIDTH: 0.111404
G1 X103.487 Y108.885 E.00058
; LINE_WIDTH: 0.0973917
G1 X103.547 Y108.806 E.00044
; WIPE_START
G1 F24000
G1 X103.487 Y108.885 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.024 J1.217 P1  F30000
G1 X107.453 Y108.806 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.126784
G1 F11379
G1 X107.571 Y108.97 E.00138
; LINE_WIDTH: 0.173113
G1 X107.629 Y109.056 E.0011
; LINE_WIDTH: 0.136068
G1 X107.654 Y109.187 E.00101
; LINE_WIDTH: 0.0969206
G1 X107.672 Y109.292 E.00047
G1 X107.506 Y108.335 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11379
G1 X107.506 Y103.473 E.1494
G1 X103.494 Y103.473 E.12327
G1 X103.494 Y108.343 E.14963
G3 X103.662 Y108.401 I.047 J.136 E.00589
G1 X103.99 Y108.055 E.01465
G1 X104.401 Y107.794 E.01496
G1 X104.856 Y107.62 E.01495
G1 X105.506 Y107.54 E.02013
G1 X106.144 Y107.62 E.01976
G1 X106.632 Y107.812 E.01611
G1 X107.046 Y108.086 E.01525
G1 X107.338 Y108.401 E.01321
G1 X107.447 Y108.325 E.00409
G1 X107.129 Y107.683 F30000
G1 F11379
G1 X107.129 Y103.85 E.11779
G1 X103.871 Y103.85 E.10009
G1 X103.871 Y107.683 E.11779
G1 X104.263 Y107.443 E.01413
G1 X104.79 Y107.249 E.01724
G1 X105.319 Y107.163 E.01648
G1 X105.769 Y107.171 E.01383
G1 X106.318 Y107.279 E.01719
G1 X106.837 Y107.495 E.01726
G1 X107.078 Y107.651 E.00884
G1 X106.752 Y107.044 F30000
G1 F11379
G1 X106.752 Y104.227 E.08657
G1 X104.248 Y104.227 E.07692
G1 X104.248 Y107.044 E.08657
G1 X104.724 Y106.878 E.01549
G1 X105.318 Y106.786 E.01847
G1 X105.835 Y106.8 E.01588
G1 X106.456 Y106.928 E.01949
G1 X106.696 Y107.022 E.00792
G1 X106.375 Y106.516 F30000
G1 F11379
G1 X106.375 Y104.604 E.05873
G1 X104.625 Y104.604 E.05375
G1 X104.625 Y106.515 E.05873
G1 X105.317 Y106.409 E.0215
G1 X105.9 Y106.428 E.01793
G1 X106.316 Y106.505 E.01298
G1 X105.998 Y106.063 F30000
G1 F11379
G1 X105.998 Y104.981 E.03323
G1 X105.002 Y104.981 E.03058
G1 X105.002 Y106.062 E.03322
G1 X105.666 Y106.031 E.02041
G1 X105.938 Y106.057 E.00839
G1 X105.654 Y105.688 F30000
; LINE_WIDTH: 0.351907
G1 F11379
G1 X105.654 Y105.324 E.00916
G1 X105.346 Y105.324 E.00778
G1 X105.346 Y105.689 E.00919
G1 X105.594 Y105.688 E.00627
G1 X107.671 Y110.664 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119479
G1 F11379
G3 X107.601 Y111.078 I-8.337 J-1.207 E.00262
G1 X107.524 Y111.081 F30000
; LINE_WIDTH: 0.129163
G1 F11379
G1 X107.392 Y111.248 E.00149
G1 X107.524 Y111.081 F30000
; LINE_WIDTH: 0.179222
G1 F11379
G1 X107.593 Y110.99 E.00126
; LINE_WIDTH: 0.195631
G1 X107.694 Y110.842 E.00224
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.593 Y110.99 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/64
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
G3 Z7.2 I-.269 J1.187 P1  F30000
G1 X156.316 Y122.028 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7418
G1 X156.461 Y122.374 E.01244
G3 X154.245 Y120.942 I-1.961 J.604 E.33253
G1 X154.449 Y120.927 E.00679
G3 X156.29 Y121.974 I.051 J2.051 E.07383
G1 X155.924 Y122.135 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7418
G1 X155.958 Y122.185 E.00183
G3 X154.294 Y121.331 I-1.458 J.793 E.25929
G1 X154.459 Y121.319 E.00509
G3 X155.772 Y121.912 I.041 J1.659 E.04579
G1 X155.891 Y122.086 E.00648
M204 S10000
; WIPE_START
G1 F24000
G1 X155.958 Y122.185 E-.04548
G1 X156.087 Y122.489 E-.12561
G1 X156.152 Y122.812 E-.12506
G1 X156.158 Y123.062 E-.09502
G1 X156.109 Y123.388 E-.12548
G1 X155.996 Y123.699 E-.12562
G1 X155.834 Y123.963 E-.11772
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.203 J-.183 P1  F30000
G1 X153.446 Y108.221 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7418
G1 X153.474 Y108.201 E.00111
G3 X154.245 Y107.942 I1.026 J1.776 E.02717
G1 X154.449 Y107.927 E.00679
G3 X153.142 Y108.44 I.051 J2.051 E.38006
G1 X153.398 Y108.256 E.01046
G1 X153.692 Y108.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7418
G1 X153.971 Y108.405 E.0094
G3 X154.294 Y108.331 I.529 J1.573 E.01018
G1 X154.459 Y108.319 E.00509
G3 X153.64 Y108.559 I.041 J1.659 E.29381
M204 S10000
; WIPE_START
G1 F24000
G1 X153.971 Y108.405 E-.13897
G1 X154.294 Y108.331 E-.12564
G1 X154.459 Y108.319 E-.06289
G1 X154.788 Y108.344 E-.12564
G1 X155.107 Y108.433 E-.12563
G1 X155.401 Y108.584 E-.12564
G1 X155.515 Y108.675 E-.05559
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.08 J-1.214 P1  F30000
G1 X105.111 Y111.991 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7418
G1 X104.751 Y111.887 E.01244
G3 X105.245 Y107.942 I.749 J-1.91 E.17988
G1 X105.449 Y107.927 E.00679
G3 X105.17 Y112.002 I.051 J2.051 E.22648
G1 X105.212 Y111.612 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7418
G3 X105.294 Y108.331 I.288 J-1.634 E.14492
G1 X105.459 Y108.319 E.00509
G3 X105.271 Y111.621 I.041 J1.659 E.16849
M204 S10000
; WIPE_START
G1 F24000
G1 X104.893 Y111.524 E-.14821
G1 X104.599 Y111.373 E-.12563
G1 X104.465 Y111.277 E-.0629
G1 X104.228 Y111.046 E-.12563
G1 X104.042 Y110.773 E-.12563
G1 X103.913 Y110.468 E-.12564
G1 X103.889 Y110.349 E-.04636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.197 J.222 P1  F30000
G1 X106.554 Y124.737 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7418
G1 X106.525 Y124.754 E.00111
G3 X105.245 Y120.942 I-1.025 J-1.777 E.24093
G1 X105.449 Y120.927 E.00679
G3 X106.857 Y124.516 I.051 J2.051 E.16631
G1 X106.602 Y124.702 E.01045
G1 X106.315 Y124.424 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7418
G1 X106.028 Y124.551 E.00963
G3 X105.294 Y121.331 I-.528 J-1.573 E.17033
G1 X105.459 Y121.319 E.00509
G3 X106.366 Y124.393 I.041 J1.659 E.13344
M204 S10000
; WIPE_START
G1 F24000
G1 X106.028 Y124.551 E-.1417
G1 X105.706 Y124.626 E-.12556
G1 X105.376 Y124.634 E-.12564
G1 X105.05 Y124.577 E-.12563
G1 X104.743 Y124.456 E-.12564
G1 X104.487 Y124.291 E-.11583
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.194 J1.201 P1  F30000
G1 X151.981 Y131.959 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7418
G1 X152.102 Y131.57 E.01351
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.226 E1.93421
G1 X151.963 Y132.017 E.02492
G1 X151.606 Y131.843 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7418
G1 X151.71 Y131.511 E.01068
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.589 Y131.9 E.02278
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.15492
G1 X151.71 Y129.918 E-.60508
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.184 J.281 P1  F30000
G1 X153.773 Y138.614 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7418
G2 X154.519 Y137.167 I-14.331 J-8.31 E.05402
G1 X151.555 Y134.203 E.13905
G3 X148.8 Y139.124 I-25.036 J-10.785 E.18741
G1 X151.597 Y141.921 E.13123
G3 X147.88 Y145.88 I-22.36 J-17.27 E.18042
G1 X145.102 Y143.102 E.13036
G3 X140.486 Y146.162 I-17.246 J-20.999 E.18403
G1 X143.384 Y149.06 E.13596
G3 X141.984 Y149.793 I-8.149 J-13.864 E.05244
G1 X141.941 Y149.813 E.00159
G1 X118.059 Y149.813 F30000
G1 F7418
G3 X116.616 Y149.06 I6.935 J-15.045 E.05403
G1 X119.514 Y146.162 E.13596
G3 X114.898 Y143.102 I12.63 J-24.059 E.18403
G1 X112.12 Y145.88 E.13036
G3 X108.403 Y141.921 I18.643 J-21.228 E.18042
G1 X111.2 Y139.124 E.13123
G3 X108.445 Y134.203 I22.281 J-15.706 E.18741
G1 X105.481 Y137.167 E.13905
G2 X106.227 Y138.614 I15.077 J-6.863 E.05402
G1 X107.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129171
G1 F7418
G1 X107.524 Y124.081 E.00149
; LINE_WIDTH: 0.179241
G1 X107.593 Y123.99 E.00126
; LINE_WIDTH: 0.195637
G1 X107.694 Y123.842 E.00224
G1 X107.671 Y123.664 F30000
; LINE_WIDTH: 0.119474
G1 F7418
G3 X107.601 Y124.078 I-8.308 J-1.202 E.00262
G1 X107.672 Y122.292 F30000
; LINE_WIDTH: 0.0969207
G1 F7418
G1 X107.654 Y122.187 E.00047
; LINE_WIDTH: 0.136069
G1 X107.629 Y122.056 E.00101
; LINE_WIDTH: 0.173116
G1 X107.571 Y121.97 E.0011
; LINE_WIDTH: 0.126786
G1 X107.453 Y121.806 E.00138
G1 X107.392 Y111.248 F30000
; LINE_WIDTH: 0.12917
G1 F7418
M73 P82 R3
G1 X107.524 Y111.081 E.00149
; LINE_WIDTH: 0.179238
G1 X107.593 Y110.99 E.00126
; LINE_WIDTH: 0.195636
G1 X107.694 Y110.842 E.00224
G1 X107.671 Y110.664 F30000
; LINE_WIDTH: 0.119468
G1 F7418
G3 X107.601 Y111.078 I-8.316 J-1.203 E.00262
G1 X107.672 Y109.292 F30000
; LINE_WIDTH: 0.0969206
G1 F7418
G1 X107.654 Y109.187 E.00047
; LINE_WIDTH: 0.136068
G1 X107.629 Y109.056 E.00101
; LINE_WIDTH: 0.173113
G1 X107.571 Y108.97 E.0011
; LINE_WIDTH: 0.126784
G1 X107.453 Y108.806 E.00138
G1 X103.801 Y103.429 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7418
G1 X105.429 Y103.429 E.05401
G1 X107.55 Y105.55 E.09948
G1 X107.55 Y104.395 E.03832
G1 X103.652 Y108.292 E.18285
G1 X103.528 Y108.188 E.00538
G1 X103.45 Y108.278 E.00393
G1 X103.45 Y106.931 E.04465
G1 X103.608 Y108.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973913
G1 F7418
G1 X103.544 Y108.786 E.00044
; LINE_WIDTH: 0.111413
G1 X103.476 Y108.876 E.00063
; LINE_WIDTH: 0.14728
G1 X103.403 Y108.973 E.00103
; LINE_WIDTH: 0.181657
G1 X103.306 Y109.115 E.00195
G1 X103.329 Y109.294 F30000
; LINE_WIDTH: 0.119481
G1 F7418
G3 X103.399 Y108.879 I8.32 J1.204 E.00262
G1 X103.328 Y110.666 F30000
; LINE_WIDTH: 0.129189
G1 F7418
G1 X103.346 Y110.771 E.00075
; LINE_WIDTH: 0.161458
G1 X103.365 Y110.876 E.00103
; LINE_WIDTH: 0.148176
G2 X103.429 Y110.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111398
G1 X103.487 Y111.073 E.00058
; LINE_WIDTH: 0.0973909
G1 X103.547 Y111.152 E.00044
G1 X104.894 Y112.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7418
G2 X106.482 Y112.158 I.606 J-2.189 E.05405
G1 X107.55 Y113.226 E.05006
G1 X107.55 Y112.071 E.03832
G1 X103.45 Y116.17 E.19231
G1 X103.45 Y116.802 E.02098
G1 X107.55 Y120.902 E.19231
G1 X107.55 Y119.746 E.03832
G1 X106.495 Y120.801 E.04947
G2 X104.907 Y120.662 I-.973 J1.973 E.0541
G1 X103.608 Y121.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973922
G1 F7418
G1 X103.544 Y121.786 E.00044
; LINE_WIDTH: 0.11142
G1 X103.476 Y121.876 E.00063
; LINE_WIDTH: 0.147285
G1 X103.403 Y121.973 E.00103
; LINE_WIDTH: 0.181657
G1 X103.306 Y122.115 E.00195
G1 X103.329 Y122.294 F30000
; LINE_WIDTH: 0.119476
G1 F7418
G3 X103.399 Y121.879 I8.319 J1.204 E.00262
G1 X103.328 Y123.666 F30000
; LINE_WIDTH: 0.129191
G1 F7418
G1 X103.346 Y123.771 E.00075
; LINE_WIDTH: 0.16146
G1 X103.365 Y123.876 E.00103
; LINE_WIDTH: 0.148194
G2 X103.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111415
G1 X103.487 Y124.073 E.00058
; LINE_WIDTH: 0.0973921
G1 X103.547 Y124.152 E.00044
G1 X103.45 Y126.159 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7418
G1 X103.45 Y124.662 E.04967
G1 X103.555 Y124.583 E.00435
G1 X107.55 Y128.578 E.18741
G1 X107.55 Y127.422 E.03832
G1 X103.482 Y131.49 E.19082
G1 X103.712 Y132.416 E.03165
G1 X122.939 Y151.643 E.90196
G3 X121.987 Y151.365 I2.35 J-9.814 E.03291
G1 X125.195 Y148.157 E.15049
G2 X127.495 Y148.523 I5.304 J-25.922 E.07727
G1 X131.502 Y152.53 E.18798
G3 X128.498 Y152.53 I-1.502 J-27.504 E.0997
G1 X132.505 Y148.523 E.18798
G2 X134.805 Y148.157 I-3.004 J-26.289 E.07727
G1 X138.013 Y151.365 E.15049
G3 X137.061 Y151.643 I-3.303 J-9.536 E.03291
G1 X156.288 Y132.416 E.90196
G1 X156.518 Y131.49 E.03165
G1 X152.45 Y127.422 E.19082
G1 X152.45 Y128.578 E.03832
G1 X156.356 Y124.672 E.18322
G1 X156.492 Y124.786 E.00588
G1 X156.55 Y124.713 E.00309
G1 X156.55 Y126.071 E.04505
G1 X156.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129172
G1 F7418
G1 X156.524 Y124.081 E.00149
; LINE_WIDTH: 0.179244
G1 X156.593 Y123.99 E.00126
; LINE_WIDTH: 0.195641
G1 X156.694 Y123.842 E.00224
G1 X156.671 Y123.664 F30000
; LINE_WIDTH: 0.119477
G1 F7418
G3 X156.601 Y124.078 I-8.307 J-1.202 E.00262
G1 X156.672 Y122.292 F30000
; LINE_WIDTH: 0.0969207
G1 F7418
G1 X156.654 Y122.187 E.00047
; LINE_WIDTH: 0.136069
G1 X156.629 Y122.056 E.00101
; LINE_WIDTH: 0.173116
G1 X156.571 Y121.97 E.0011
; LINE_WIDTH: 0.126785
G1 X156.453 Y121.806 E.00138
G1 X155.095 Y120.656 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7418
G2 X153.507 Y120.804 I-.598 J2.177 E.05406
G1 X152.45 Y119.746 E.04959
G1 X152.45 Y120.902 E.03832
G1 X156.55 Y116.802 E.19231
G1 X156.55 Y116.17 E.02098
G1 X152.45 Y112.071 E.19231
G1 X152.45 Y113.226 E.03832
G1 X153.515 Y112.161 E.04996
G2 X155.104 Y112.293 I.964 J-1.965 E.05411
G1 X156.392 Y111.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129171
G1 F7418
G1 X156.524 Y111.081 E.00149
; LINE_WIDTH: 0.179239
G1 X156.593 Y110.99 E.00126
; LINE_WIDTH: 0.195637
G1 X156.694 Y110.842 E.00224
G1 X156.671 Y110.664 F30000
; LINE_WIDTH: 0.119472
G1 F7418
G3 X156.601 Y111.078 I-8.327 J-1.205 E.00262
G1 X156.672 Y109.292 F30000
; LINE_WIDTH: 0.0969206
G1 F7418
G1 X156.654 Y109.187 E.00047
; LINE_WIDTH: 0.13607
G1 X156.629 Y109.056 E.00101
; LINE_WIDTH: 0.173118
G1 X156.571 Y108.97 E.0011
; LINE_WIDTH: 0.126786
G1 X156.453 Y108.806 E.00138
G1 X156.55 Y106.809 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7418
G1 X156.55 Y108.296 E.04932
G1 X156.437 Y108.381 E.00469
G1 X152.45 Y104.395 E.18702
G1 X152.45 Y105.55 E.03832
G1 X154.571 Y103.429 E.09948
G1 X156.199 Y103.429 E.05401
G1 X152.608 Y108.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973912
G1 F7418
G1 X152.544 Y108.786 E.00044
; LINE_WIDTH: 0.11141
G1 X152.476 Y108.876 E.00063
; LINE_WIDTH: 0.147277
G1 X152.403 Y108.973 E.00103
; LINE_WIDTH: 0.181653
G1 X152.306 Y109.115 E.00195
G1 X152.329 Y109.294 F30000
; LINE_WIDTH: 0.119477
G1 F7418
G3 X152.399 Y108.879 I8.235 J1.191 E.00262
G1 X152.328 Y110.666 F30000
; LINE_WIDTH: 0.129187
G1 F7418
G1 X152.346 Y110.771 E.00075
; LINE_WIDTH: 0.161454
G1 X152.365 Y110.876 E.00103
; LINE_WIDTH: 0.148171
G2 X152.429 Y110.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111393
G1 X152.487 Y111.073 E.00058
; LINE_WIDTH: 0.0973906
G1 X152.547 Y111.152 E.00044
G1 X152.608 Y121.71 F30000
; LINE_WIDTH: 0.0973924
G1 F7418
G1 X152.544 Y121.786 E.00044
; LINE_WIDTH: 0.111417
G1 X152.476 Y121.876 E.00063
; LINE_WIDTH: 0.147282
G1 X152.403 Y121.973 E.00103
; LINE_WIDTH: 0.181656
G1 X152.306 Y122.115 E.00195
G1 X152.329 Y122.294 F30000
; LINE_WIDTH: 0.119472
G1 F7418
G3 X152.399 Y121.879 I8.323 J1.204 E.00262
G1 X152.328 Y123.666 F30000
; LINE_WIDTH: 0.129189
G1 F7418
G1 X152.346 Y123.771 E.00075
; LINE_WIDTH: 0.161456
G1 X152.365 Y123.876 E.00103
; LINE_WIDTH: 0.14819
G2 X152.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111412
G1 X152.487 Y124.073 E.00058
; LINE_WIDTH: 0.0973919
G1 X152.547 Y124.152 E.00044
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X152.487 Y124.073 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/64
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
G3 Z7.4 I.573 J1.073 P1  F30000
G1 X156.316 Y122.028 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7469
G1 X156.461 Y122.374 E.01245
G3 X154.245 Y120.942 I-1.961 J.604 E.33253
G1 X154.449 Y120.927 E.00679
G3 X156.289 Y121.974 I.051 J2.051 E.07382
G1 X155.957 Y122.183 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7469
G1 X155.958 Y122.185 E.00008
G3 X154.294 Y121.331 I-1.458 J.793 E.25929
G1 X154.459 Y121.319 E.00509
G3 X155.772 Y121.912 I.041 J1.659 E.04579
G1 X155.923 Y122.133 E.00824
M204 S10000
; WIPE_START
G1 F24000
G1 X155.958 Y122.185 E-.02372
G1 X156.087 Y122.489 E-.12562
G1 X156.152 Y122.813 E-.12563
G1 X156.152 Y123.144 E-.12563
G1 X156.087 Y123.467 E-.12515
G1 X155.996 Y123.7 E-.09499
G1 X155.823 Y123.981 E-.12542
G1 X155.799 Y124.008 E-.01384
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.204 J-.179 P1  F30000
G1 X153.446 Y108.221 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7469
G1 X153.474 Y108.201 E.00111
G3 X154.245 Y107.942 I1.026 J1.776 E.02717
G1 X154.449 Y107.927 E.00679
G3 X153.142 Y108.44 I.051 J2.051 E.38006
G1 X153.398 Y108.256 E.01046
G1 X153.69 Y108.532 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7469
G1 X153.971 Y108.405 E.00949
G3 X154.294 Y108.331 I.529 J1.573 E.01018
G1 X154.459 Y108.319 E.00509
G3 X153.637 Y108.561 I.041 J1.659 E.29372
M204 S10000
; WIPE_START
G1 F24000
G1 X153.971 Y108.405 E-.14008
G1 X154.294 Y108.331 E-.12564
G1 X154.459 Y108.319 E-.06289
G1 X154.788 Y108.344 E-.12564
G1 X155.107 Y108.433 E-.12563
G1 X155.401 Y108.584 E-.12563
G1 X155.513 Y108.673 E-.05448
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.08 J-1.214 P1  F30000
G1 X105.111 Y111.991 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7469
G1 X104.751 Y111.887 E.01244
G3 X105.245 Y107.942 I.749 J-1.91 E.17988
G1 X105.449 Y107.927 E.00679
G3 X105.17 Y112.002 I.051 J2.051 E.22648
G1 X105.212 Y111.612 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7469
G3 X105.294 Y108.331 I.288 J-1.634 E.14492
G1 X105.459 Y108.319 E.00509
G3 X105.271 Y111.621 I.041 J1.659 E.16849
M204 S10000
; WIPE_START
G1 F24000
G1 X104.893 Y111.524 E-.1482
G1 X104.599 Y111.373 E-.12564
G1 X104.465 Y111.277 E-.06289
G1 X104.228 Y111.046 E-.12563
G1 X104.042 Y110.773 E-.12564
G1 X103.913 Y110.468 E-.12564
G1 X103.889 Y110.349 E-.04636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.198 J.216 P1  F30000
G1 X106.496 Y124.77 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7469
G1 X106.153 Y124.922 E.01244
G3 X105.245 Y120.942 I-.653 J-1.945 E.22736
G1 X105.449 Y120.927 E.00679
G3 X106.548 Y124.741 I.051 J2.051 E.179
G1 X106.338 Y124.411 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7469
G1 X106.329 Y124.415 E.0003
G3 X105.294 Y121.331 I-.829 J-1.437 E.18049
G1 X105.459 Y121.319 E.00509
G3 X106.597 Y124.222 I.041 J1.659 E.12459
G1 X106.387 Y124.376 E.00801
M204 S10000
; WIPE_START
G1 F24000
G1 X106.329 Y124.415 E-.02641
G1 X106.029 Y124.553 E-.12556
G1 X105.706 Y124.626 E-.12564
G1 X105.376 Y124.634 E-.12563
G1 X105.05 Y124.577 E-.12564
G1 X104.743 Y124.456 E-.12564
G1 X104.509 Y124.306 E-.10549
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.194 J1.201 P1  F30000
G1 X151.979 Y131.966 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7469
G1 X152.102 Y131.57 E.01376
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.226 E1.93421
G1 X151.961 Y132.024 E.02468
G1 X151.604 Y131.85 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7469
G1 X151.71 Y131.511 E.01091
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.586 Y131.907 E.02256
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.15773
G1 X151.71 Y129.926 E-.60227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.184 J.281 P1  F30000
G1 X153.773 Y138.614 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7469
G2 X154.519 Y137.167 I-14.332 J-8.31 E.05402
G1 X151.555 Y134.203 E.13905
G3 X148.8 Y139.124 I-25.036 J-10.785 E.18741
G1 X151.597 Y141.921 E.13123
G3 X147.88 Y145.88 I-22.36 J-17.27 E.18042
G1 X145.102 Y143.102 E.13036
G3 X140.486 Y146.162 I-17.246 J-20.999 E.18403
G1 X143.384 Y149.06 E.13594
G3 X141.941 Y149.814 I-9.952 J-17.293 E.05403
G1 X118.059 Y149.813 F30000
G1 F7469
G3 X116.616 Y149.06 I6.934 J-15.045 E.05403
G1 X119.514 Y146.162 E.13596
G3 X114.898 Y143.102 I12.624 J-24.05 E.18403
G1 X112.12 Y145.88 E.13036
G3 X108.403 Y141.921 I18.643 J-21.228 E.18042
G1 X111.2 Y139.124 E.13123
G3 X108.445 Y134.203 I22.281 J-15.706 E.18741
G1 X105.481 Y137.167 E.13905
G2 X106.227 Y138.614 I15.077 J-6.863 E.05402
G1 X103.45 Y126.159 F30000
G1 F7469
G1 X103.45 Y124.662 E.04967
G1 X103.555 Y124.583 E.00435
G1 X107.55 Y128.578 E.18741
G1 X107.55 Y127.422 E.03832
G1 X103.482 Y131.49 E.19082
G1 X103.712 Y132.416 E.03166
G1 X122.939 Y151.643 E.90196
G3 X121.987 Y151.365 I2.35 J-9.813 E.03291
G1 X125.195 Y148.157 E.15049
G2 X127.495 Y148.523 I5.304 J-25.922 E.07727
G1 X131.502 Y152.53 E.18798
G3 X128.498 Y152.53 I-1.502 J-27.504 E.0997
G1 X132.505 Y148.523 E.18798
G2 X134.805 Y148.157 I-3.004 J-26.289 E.07727
G1 X138.013 Y151.365 E.15049
M73 P83 R3
G3 X137.061 Y151.643 I-3.302 J-9.534 E.03291
G1 X156.288 Y132.416 E.90196
G1 X156.518 Y131.49 E.03166
G1 X152.45 Y127.422 E.19082
G1 X152.45 Y128.578 E.03832
G1 X156.356 Y124.672 E.18322
G1 X156.492 Y124.786 E.00588
G1 X156.55 Y124.713 E.00309
G1 X156.55 Y126.071 E.04505
G1 X156.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.128914
G1 F7469
G1 X156.524 Y124.082 E.00148
; LINE_WIDTH: 0.178591
G1 X156.592 Y123.992 E.00125
; LINE_WIDTH: 0.195653
G1 X156.694 Y123.843 E.00226
G1 X156.672 Y123.666 F30000
; LINE_WIDTH: 0.135855
G1 F7469
G3 X156.596 Y124.082 I-12.411 J-2.039 E.0032
G1 X156.672 Y122.292 F30000
; LINE_WIDTH: 0.0969206
G1 F7469
G1 X156.654 Y122.187 E.00047
; LINE_WIDTH: 0.136069
G1 X156.629 Y122.056 E.00101
; LINE_WIDTH: 0.173116
G1 X156.571 Y121.97 E.0011
; LINE_WIDTH: 0.126785
G1 X156.453 Y121.806 E.00138
G1 X155.095 Y120.656 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7469
G2 X153.507 Y120.804 I-.598 J2.177 E.05406
G1 X152.45 Y119.746 E.04959
G1 X152.45 Y120.902 E.03832
G1 X156.55 Y116.802 E.19231
G1 X156.55 Y116.17 E.02098
G1 X152.45 Y112.071 E.19231
G1 X152.45 Y113.226 E.03832
G1 X153.515 Y112.161 E.04996
G2 X155.104 Y112.293 I.964 J-1.965 E.05411
G1 X156.392 Y111.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129168
G1 F7469
G1 X156.524 Y111.081 E.00149
; LINE_WIDTH: 0.179231
G1 X156.593 Y110.99 E.00126
; LINE_WIDTH: 0.195636
G1 X156.694 Y110.842 E.00224
G1 X156.671 Y110.664 F30000
; LINE_WIDTH: 0.119483
G1 F7469
G3 X156.601 Y111.078 I-8.322 J-1.204 E.00262
G1 X156.672 Y109.292 F30000
; LINE_WIDTH: 0.0969202
G1 F7469
G1 X156.654 Y109.187 E.00047
; LINE_WIDTH: 0.136066
G1 X156.629 Y109.056 E.00101
; LINE_WIDTH: 0.173109
G1 X156.571 Y108.97 E.0011
; LINE_WIDTH: 0.12678
G1 X156.453 Y108.806 E.00138
G1 X156.55 Y106.809 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7469
G1 X156.55 Y108.296 E.04932
G1 X156.437 Y108.381 E.00469
G1 X152.45 Y104.395 E.18702
G1 X152.45 Y105.55 E.03832
G1 X154.571 Y103.429 E.09948
G1 X156.199 Y103.429 E.05401
G1 X154.587 Y107.492 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518646
G1 F7469
G1 X154.728 Y107.51 E.00552
G1 X152.608 Y108.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973918
G1 F7469
G1 X152.544 Y108.786 E.00044
; LINE_WIDTH: 0.111406
G1 X152.476 Y108.876 E.00063
; LINE_WIDTH: 0.147266
G1 X152.403 Y108.973 E.00103
; LINE_WIDTH: 0.181635
G1 X152.306 Y109.115 E.00195
G1 X152.329 Y109.294 F30000
; LINE_WIDTH: 0.119471
G1 F7469
G3 X152.399 Y108.879 I8.234 J1.191 E.00262
G1 X152.328 Y110.666 F30000
; LINE_WIDTH: 0.129192
G1 F7469
G1 X152.346 Y110.771 E.00075
; LINE_WIDTH: 0.161464
G1 X152.365 Y110.876 E.00103
; LINE_WIDTH: 0.148171
G2 X152.429 Y110.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111398
G1 X152.487 Y111.073 E.00058
; LINE_WIDTH: 0.0973906
G1 X152.547 Y111.152 E.00044
G1 X152.608 Y121.71 F30000
; LINE_WIDTH: 0.0973916
G1 F7469
G1 X152.544 Y121.786 E.00044
; LINE_WIDTH: 0.111415
M73 P83 R2
G1 X152.476 Y121.876 E.00063
; LINE_WIDTH: 0.147278
G1 X152.403 Y121.973 E.00103
; LINE_WIDTH: 0.181651
G1 X152.306 Y122.115 E.00195
G1 X152.329 Y122.294 F30000
; LINE_WIDTH: 0.119479
G1 F7469
G3 X152.399 Y121.879 I8.254 J1.194 E.00262
G1 X152.328 Y123.666 F30000
; LINE_WIDTH: 0.129188
G1 F7469
G1 X152.346 Y123.771 E.00075
; LINE_WIDTH: 0.161456
G1 X152.365 Y123.876 E.00103
; LINE_WIDTH: 0.148194
G2 X152.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111416
G1 X152.487 Y124.073 E.00058
; LINE_WIDTH: 0.0973922
G1 X152.547 Y124.152 E.00044
; WIPE_START
G1 F24000
G1 X152.487 Y124.073 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.006 J-1.217 P1  F30000
G1 X107.694 Y123.843 Z7.6
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.195651
G1 F7469
G1 X107.592 Y123.992 E.00226
; LINE_WIDTH: 0.178593
G1 X107.524 Y124.082 E.00125
; LINE_WIDTH: 0.128915
G1 X107.392 Y124.248 E.00148
G1 X107.596 Y124.082 F30000
; LINE_WIDTH: 0.135851
G1 F7469
G2 X107.672 Y123.666 I-12.351 J-2.458 E.0032
G1 X107.672 Y122.292 F30000
; LINE_WIDTH: 0.0969206
G1 F7469
G1 X107.654 Y122.187 E.00047
; LINE_WIDTH: 0.136067
G1 X107.629 Y122.056 E.00101
; LINE_WIDTH: 0.173112
G1 X107.571 Y121.97 E.0011
; LINE_WIDTH: 0.126783
G1 X107.453 Y121.806 E.00138
G1 X104.907 Y120.662 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7469
G3 X106.495 Y120.801 I.615 J2.112 E.0541
G1 X107.55 Y119.746 E.04947
G1 X107.55 Y120.902 E.03832
G1 X103.45 Y116.802 E.19231
G1 X103.45 Y116.17 E.02098
G1 X107.55 Y112.071 E.19231
G1 X107.55 Y113.226 E.03832
G1 X106.482 Y112.158 E.05006
G3 X104.894 Y112.3 I-.983 J-2.048 E.05405
G1 X103.547 Y111.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973907
G1 F7469
G1 X103.487 Y111.073 E.00044
; LINE_WIDTH: 0.111395
G1 X103.429 Y110.987 E.00058
; LINE_WIDTH: 0.148168
G3 X103.365 Y110.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161468
G1 X103.346 Y110.771 E.00103
; LINE_WIDTH: 0.129194
G1 X103.328 Y110.666 E.00075
G1 X103.329 Y109.294 F30000
; LINE_WIDTH: 0.119475
G1 F7469
G3 X103.399 Y108.879 I8.245 J1.192 E.00262
G1 X103.476 Y108.876 F30000
; LINE_WIDTH: 0.147268
G1 F7469
G1 X103.403 Y108.973 E.00103
; LINE_WIDTH: 0.181638
G1 X103.306 Y109.115 E.00195
G1 X103.476 Y108.876 F30000
; LINE_WIDTH: 0.111408
G1 F7469
G1 X103.544 Y108.786 E.00063
; LINE_WIDTH: 0.0973917
G1 X103.608 Y108.71 E.00044
G1 X103.45 Y106.931 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7469
G1 X103.45 Y108.278 E.04465
G1 X103.528 Y108.188 E.00393
G1 X103.652 Y108.292 E.00538
G1 X107.55 Y104.395 E.18285
G1 X107.55 Y105.55 E.03832
G1 X105.429 Y103.429 E.09948
G1 X103.801 Y103.429 E.05401
G1 X105.587 Y107.492 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518646
G1 F7469
G1 X105.728 Y107.51 E.00552
G1 X107.453 Y108.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126781
G1 F7469
G1 X107.571 Y108.97 E.00138
; LINE_WIDTH: 0.17311
G1 X107.629 Y109.056 E.0011
; LINE_WIDTH: 0.136065
G1 X107.654 Y109.187 E.00101
; LINE_WIDTH: 0.0969202
G1 X107.672 Y109.292 E.00047
G1 X107.671 Y110.664 F30000
; LINE_WIDTH: 0.119479
G1 F7469
G3 X107.601 Y111.078 I-8.255 J-1.194 E.00262
G1 X107.524 Y111.081 F30000
; LINE_WIDTH: 0.179229
G1 F7469
G1 X107.593 Y110.99 E.00126
; LINE_WIDTH: 0.195633
G1 X107.694 Y110.842 E.00224
G1 X107.524 Y111.081 F30000
; LINE_WIDTH: 0.129167
G1 F7469
G1 X107.392 Y111.248 E.00149
G1 X103.608 Y121.71 F30000
; LINE_WIDTH: 0.0973917
G1 F7469
G1 X103.544 Y121.786 E.00044
; LINE_WIDTH: 0.111417
G1 X103.476 Y121.876 E.00063
; LINE_WIDTH: 0.147281
G1 X103.403 Y121.973 E.00103
; LINE_WIDTH: 0.181653
G1 X103.306 Y122.115 E.00195
G1 X103.329 Y122.294 F30000
; LINE_WIDTH: 0.119483
G1 F7469
G3 X103.399 Y121.879 I8.334 J1.206 E.00262
G1 X103.328 Y123.666 F30000
; LINE_WIDTH: 0.12919
G1 F7469
G1 X103.346 Y123.771 E.00075
; LINE_WIDTH: 0.16146
G1 X103.365 Y123.876 E.00103
; LINE_WIDTH: 0.148197
G2 X103.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111418
G1 X103.487 Y124.073 E.00058
; LINE_WIDTH: 0.097391
G1 X103.547 Y124.152 E.00044
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X103.487 Y124.073 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/64
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
G3 Z7.6 I.048 J1.216 P1  F30000
G1 X156.284 Y121.969 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7412
G1 X156.302 Y121.997 E.00111
G3 X154.245 Y120.942 I-1.802 J.98 E.34611
G1 X154.449 Y120.927 E.00679
G3 X156.072 Y121.66 I.051 J2.051 E.06112
G1 X156.25 Y121.92 E.01046
G1 X155.982 Y122.241 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7412
G1 X156.086 Y122.49 E.0083
G3 X154.294 Y121.331 I-1.586 J.488 E.24912
G1 X154.459 Y121.319 E.00509
G3 X155.958 Y122.185 I.041 J1.659 E.05596
G1 X155.958 Y122.185 E.00001
M204 S10000
; WIPE_START
G1 F24000
G1 X156.086 Y122.49 E-.1254
G1 X156.152 Y122.812 E-.12519
G1 X156.158 Y123.062 E-.09496
G1 X156.109 Y123.388 E-.12538
G1 X155.996 Y123.699 E-.12563
G1 X155.823 Y123.981 E-.12563
G1 X155.756 Y124.054 E-.03781
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.206 J-.164 P1  F30000
G1 X153.595 Y108.14 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7412
G1 X153.944 Y108.003 E.01245
G3 X154.339 Y107.933 I.556 J1.975 E.01333
G1 X154.456 Y107.927 E.00389
G3 X153.54 Y108.165 I.044 J2.051 E.39588
G1 X153.694 Y108.533 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7412
G1 X153.743 Y108.501 E.00179
G3 X154.373 Y108.323 I.757 J1.476 E.02027
G1 X154.461 Y108.319 E.0027
G3 X153.465 Y108.681 I.039 J1.659 E.28718
G1 X153.643 Y108.565 E.00653
M204 S10000
; WIPE_START
G1 F24000
G1 X153.743 Y108.501 E-.04489
G1 X154.05 Y108.381 E-.12564
G1 X154.373 Y108.323 E-.12463
G1 X154.461 Y108.319 E-.03345
G1 X154.788 Y108.344 E-.12464
G1 X155.107 Y108.433 E-.12563
G1 X155.401 Y108.584 E-.12564
G1 X155.515 Y108.675 E-.05549
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.08 J-1.214 P1  F30000
G1 X105.111 Y111.991 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7412
G1 X104.751 Y111.887 E.01244
G3 X105.339 Y107.933 I.749 J-1.91 E.18301
G1 X105.456 Y107.927 E.00389
G3 X105.17 Y112.002 I.044 J2.051 E.22621
G1 X105.212 Y111.612 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7412
G3 X105.373 Y108.323 I.288 J-1.634 E.14738
G1 X105.461 Y108.319 E.0027
G3 X105.271 Y111.621 I.039 J1.659 E.1684
M204 S10000
; WIPE_START
G1 F24000
G1 X104.893 Y111.524 E-.1482
G1 X104.599 Y111.373 E-.12564
G1 X104.341 Y111.167 E-.12563
G1 X104.128 Y110.914 E-.12564
G1 X103.97 Y110.624 E-.12563
G1 X103.913 Y110.468 E-.0629
G1 X103.889 Y110.349 E-.04636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.198 J.216 P1  F30000
G1 X106.496 Y124.77 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7412
G1 X106.153 Y124.922 E.01244
G3 X105.245 Y120.942 I-.653 J-1.945 E.22736
G1 X105.449 Y120.927 E.00679
G3 X106.548 Y124.741 I.051 J2.051 E.179
G1 X106.362 Y124.394 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7412
G1 X106.329 Y124.415 E.00119
G3 X105.294 Y121.331 I-.829 J-1.437 E.18049
G1 X105.459 Y121.319 E.00509
G3 X106.597 Y124.222 I.041 J1.659 E.12459
G1 X106.41 Y124.359 E.00711
M204 S10000
; WIPE_START
G1 F24000
G1 X106.329 Y124.415 E-.03754
G1 X106.029 Y124.553 E-.12556
G1 X105.706 Y124.626 E-.12563
G1 X105.376 Y124.634 E-.12563
G1 X105.05 Y124.577 E-.12564
G1 X104.743 Y124.456 E-.12563
G1 X104.534 Y124.321 E-.09436
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.194 J1.201 P1  F30000
G1 X151.976 Y131.973 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7412
G1 X152.102 Y131.57 E.014
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.226 E1.93421
G1 X151.959 Y132.031 E.02444
G1 X151.602 Y131.857 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7412
G1 X151.71 Y131.511 E.01113
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.584 Y131.914 E.02233
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.16047
G1 X151.71 Y129.933 E-.59953
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.184 J.281 P1  F30000
G1 X153.773 Y138.614 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7412
G2 X154.519 Y137.167 I-14.331 J-8.31 E.05402
G1 X151.555 Y134.203 E.13905
G3 X148.8 Y139.124 I-25.036 J-10.785 E.18741
G1 X151.597 Y141.921 E.13123
G3 X147.88 Y145.88 I-22.36 J-17.27 E.18042
G1 X145.102 Y143.102 E.13036
G3 X140.486 Y146.162 I-17.246 J-20.999 E.18403
G1 X143.384 Y149.06 E.13594
G3 X141.941 Y149.814 I-9.779 J-16.964 E.05403
G1 X118.059 Y149.813 F30000
G1 F7412
G3 X116.616 Y149.06 I6.935 J-15.046 E.05403
G1 X119.514 Y146.162 E.13596
G3 X114.898 Y143.102 I12.63 J-24.059 E.18403
G1 X112.12 Y145.88 E.13036
G3 X108.404 Y141.92 I18.498 J-21.081 E.18042
G1 X111.2 Y139.124 E.13118
G3 X108.445 Y134.203 I22.281 J-15.706 E.18741
G1 X105.481 Y137.167 E.13905
G2 X106.227 Y138.614 I15.077 J-6.863 E.05402
G1 X107.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129162
G1 F7412
G1 X107.524 Y124.081 E.00149
; LINE_WIDTH: 0.179221
G1 X107.593 Y123.99 E.00126
; LINE_WIDTH: 0.195631
G1 X107.694 Y123.842 E.00224
G1 X107.671 Y123.664 F30000
; LINE_WIDTH: 0.119472
G1 F7412
G3 X107.601 Y124.078 I-8.308 J-1.202 E.00262
G1 X107.672 Y122.292 F30000
; LINE_WIDTH: 0.0969217
G1 F7412
M73 P84 R2
G1 X107.654 Y122.187 E.00047
; LINE_WIDTH: 0.136068
G1 X107.629 Y122.056 E.00101
; LINE_WIDTH: 0.173114
G1 X107.571 Y121.97 E.0011
; LINE_WIDTH: 0.126784
G1 X107.453 Y121.806 E.00138
G1 X107.392 Y111.248 F30000
; LINE_WIDTH: 0.129164
G1 F7412
G1 X107.524 Y111.081 E.00149
; LINE_WIDTH: 0.179226
G1 X107.593 Y110.99 E.00126
; LINE_WIDTH: 0.195631
G1 X107.694 Y110.842 E.00224
G1 X107.671 Y110.664 F30000
; LINE_WIDTH: 0.11947
G1 F7412
G3 X107.601 Y111.078 I-8.31 J-1.203 E.00262
G1 X107.672 Y109.292 F30000
; LINE_WIDTH: 0.0969205
G1 F7412
G1 X107.654 Y109.187 E.00047
; LINE_WIDTH: 0.136068
G1 X107.629 Y109.056 E.00101
; LINE_WIDTH: 0.173115
G1 X107.571 Y108.97 E.0011
; LINE_WIDTH: 0.126784
G1 X107.453 Y108.806 E.00138
G1 X103.801 Y103.429 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7412
G1 X105.429 Y103.429 E.05401
G1 X107.55 Y105.55 E.09948
G1 X107.55 Y104.395 E.03832
G1 X103.563 Y108.381 E.18702
G1 X103.45 Y108.296 E.00469
G1 X103.45 Y106.809 E.04932
G1 X103.547 Y108.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.097392
G1 F7412
G1 X103.487 Y108.885 E.00044
; LINE_WIDTH: 0.111409
G1 X103.429 Y108.97 E.00058
; LINE_WIDTH: 0.148189
G2 X103.365 Y109.082 I.121 J.144 E.00113
; LINE_WIDTH: 0.161455
G1 X103.346 Y109.187 E.00103
; LINE_WIDTH: 0.129188
G1 X103.328 Y109.292 E.00075
G1 X103.328 Y110.666 F30000
; LINE_WIDTH: 0.129191
G1 F7412
G1 X103.346 Y110.771 E.00075
; LINE_WIDTH: 0.16146
G1 X103.365 Y110.876 E.00103
; LINE_WIDTH: 0.148175
G2 X103.429 Y110.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111399
G1 X103.487 Y111.073 E.00058
; LINE_WIDTH: 0.0973906
G1 X103.547 Y111.152 E.00044
G1 X104.894 Y112.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7412
G2 X106.482 Y112.158 I.606 J-2.189 E.05405
G1 X107.55 Y113.226 E.05006
G1 X107.55 Y112.071 E.03832
G1 X103.45 Y116.17 E.19231
G1 X103.45 Y116.802 E.02098
G1 X107.55 Y120.902 E.19231
G1 X107.55 Y119.746 E.03832
G1 X106.495 Y120.801 E.04947
G2 X104.907 Y120.662 I-.973 J1.973 E.0541
G1 X103.535 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0972786
G1 F7412
G1 X103.49 Y121.886 E.00033
; LINE_WIDTH: 0.10623
G1 X103.429 Y121.976 E.00056
; LINE_WIDTH: 0.141378
G2 X103.365 Y122.082 I.107 J.137 E.00102
; LINE_WIDTH: 0.161464
G1 X103.346 Y122.187 E.00103
; LINE_WIDTH: 0.129192
G1 X103.328 Y122.292 E.00075
G1 X103.328 Y123.666 F30000
; LINE_WIDTH: 0.129191
G1 F7412
G1 X103.346 Y123.771 E.00075
; LINE_WIDTH: 0.16146
G1 X103.365 Y123.876 E.00103
; LINE_WIDTH: 0.148188
G2 X103.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111407
G1 X103.487 Y124.073 E.00058
; LINE_WIDTH: 0.0973918
G1 X103.547 Y124.152 E.00044
G1 X103.45 Y126.159 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7412
G1 X103.45 Y124.662 E.04967
G1 X103.555 Y124.583 E.00435
G1 X107.55 Y128.578 E.18741
G1 X107.55 Y127.422 E.03832
G1 X103.482 Y131.49 E.19082
G1 X103.712 Y132.416 E.03165
G1 X122.939 Y151.643 E.90196
G3 X121.987 Y151.365 I2.35 J-9.813 E.03291
G1 X125.195 Y148.157 E.15049
G2 X127.495 Y148.523 I5.304 J-25.922 E.07727
G1 X131.502 Y152.53 E.18798
G3 X128.498 Y152.53 I-1.502 J-27.504 E.0997
G1 X132.505 Y148.523 E.18798
G2 X134.805 Y148.157 I-3.004 J-26.289 E.07727
G1 X138.013 Y151.365 E.15049
G3 X137.061 Y151.643 I-3.303 J-9.536 E.03291
G1 X156.288 Y132.416 E.90196
G1 X156.518 Y131.49 E.03165
G1 X152.45 Y127.422 E.19082
G1 X152.45 Y128.578 E.03832
G1 X156.356 Y124.672 E.18322
G1 X156.492 Y124.786 E.00588
G1 X156.55 Y124.713 E.00308
G1 X156.55 Y126.071 E.04505
G1 X156.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129163
G1 F7412
G1 X156.524 Y124.081 E.00149
; LINE_WIDTH: 0.179223
G1 X156.593 Y123.99 E.00126
; LINE_WIDTH: 0.195633
G1 X156.694 Y123.842 E.00224
G1 X156.671 Y123.664 F30000
; LINE_WIDTH: 0.119475
G1 F7412
G3 X156.601 Y124.078 I-8.39 J-1.215 E.00262
G1 X156.672 Y122.292 F30000
; LINE_WIDTH: 0.0969217
G1 F7412
G1 X156.654 Y122.187 E.00047
; LINE_WIDTH: 0.13607
G1 X156.629 Y122.056 E.00101
; LINE_WIDTH: 0.173117
G1 X156.571 Y121.97 E.0011
; LINE_WIDTH: 0.126786
G1 X156.453 Y121.806 E.00138
G1 X155.095 Y120.656 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7412
G2 X153.507 Y120.804 I-.598 J2.177 E.05406
G1 X152.45 Y119.746 E.04959
G1 X152.45 Y120.902 E.03832
G1 X156.55 Y116.802 E.19231
G1 X156.55 Y116.17 E.02098
G1 X152.45 Y112.071 E.19231
G1 X152.45 Y113.226 E.03832
G1 X153.515 Y112.161 E.04996
G2 X155.104 Y112.293 I.964 J-1.965 E.05411
G1 X156.392 Y111.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F7412
G1 X156.524 Y111.081 E.00149
; LINE_WIDTH: 0.179227
G1 X156.593 Y110.99 E.00126
; LINE_WIDTH: 0.195632
G1 X156.694 Y110.842 E.00224
G1 X156.671 Y110.664 F30000
; LINE_WIDTH: 0.119474
G1 F7412
G3 X156.601 Y111.078 I-8.305 J-1.202 E.00262
G1 X156.672 Y109.292 F30000
; LINE_WIDTH: 0.0969205
G1 F7412
G1 X156.654 Y109.187 E.00047
; LINE_WIDTH: 0.136069
G1 X156.629 Y109.056 E.00101
; LINE_WIDTH: 0.173116
G1 X156.571 Y108.97 E.0011
; LINE_WIDTH: 0.126785
G1 X156.453 Y108.806 E.00138
G1 X156.55 Y106.809 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7412
G1 X156.55 Y108.296 E.04932
G1 X156.437 Y108.381 E.00469
G1 X152.45 Y104.395 E.18702
G1 X152.45 Y105.55 E.03832
G1 X154.571 Y103.429 E.09948
G1 X156.199 Y103.429 E.05401
G1 X152.547 Y108.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973918
G1 F7412
G1 X152.487 Y108.885 E.00044
; LINE_WIDTH: 0.111411
G1 X152.429 Y108.97 E.00058
; LINE_WIDTH: 0.148191
G2 X152.365 Y109.082 I.121 J.144 E.00113
; LINE_WIDTH: 0.161451
G1 X152.346 Y109.187 E.00103
; LINE_WIDTH: 0.129186
G1 X152.328 Y109.292 E.00075
G1 X152.328 Y110.666 F30000
; LINE_WIDTH: 0.129189
G1 F7412
G1 X152.346 Y110.771 E.00075
; LINE_WIDTH: 0.161456
G1 X152.365 Y110.876 E.00103
; LINE_WIDTH: 0.148171
G2 X152.429 Y110.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111396
G1 X152.487 Y111.073 E.00058
; LINE_WIDTH: 0.0973905
G1 X152.547 Y111.152 E.00044
G1 X152.535 Y121.825 F30000
; LINE_WIDTH: 0.0972776
G1 F7412
G1 X152.49 Y121.886 E.00033
; LINE_WIDTH: 0.106223
G1 X152.429 Y121.976 E.00056
; LINE_WIDTH: 0.14137
G2 X152.365 Y122.082 I.107 J.137 E.00102
; LINE_WIDTH: 0.16146
G1 X152.346 Y122.187 E.00103
; LINE_WIDTH: 0.12919
G1 X152.328 Y122.292 E.00075
G1 X152.328 Y123.666 F30000
; LINE_WIDTH: 0.129189
G1 F7412
G1 X152.346 Y123.771 E.00075
; LINE_WIDTH: 0.161456
G1 X152.365 Y123.876 E.00103
; LINE_WIDTH: 0.148193
G2 X152.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111413
G1 X152.487 Y124.073 E.00058
; LINE_WIDTH: 0.097392
G1 X152.547 Y124.152 E.00044
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X152.487 Y124.073 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/64
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
G3 Z7.8 I.639 J1.036 P1  F30000
G1 X156.175 Y121.797 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7326
G1 X156.196 Y121.823 E.0011
G3 X154.245 Y120.942 I-1.696 J1.155 E.3529
G1 X154.449 Y120.927 E.00679
G3 X155.933 Y121.509 I.051 J2.051 E.05433
G1 X156.136 Y121.751 E.01047
G1 X156.005 Y122.288 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7326
G1 X156.029 Y122.334 E.00162
G3 X154.294 Y121.331 I-1.529 J.644 E.25421
G1 X154.459 Y121.319 E.00509
G3 X155.871 Y122.044 I.041 J1.659 E.05087
G1 X155.976 Y122.235 E.00669
M204 S10000
; WIPE_START
G1 F24000
G1 X156.029 Y122.334 E-.04281
G1 X156.127 Y122.65 E-.12561
G1 X156.159 Y122.936 E-.10944
G1 X156.142 Y123.226 E-.11046
G1 X156.06 Y123.547 E-.12563
G1 X155.917 Y123.844 E-.12564
G1 X155.725 Y124.097 E-.12041
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.205 J-.173 P1  F30000
G1 X153.446 Y108.221 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7326
G1 X153.474 Y108.201 E.00111
G3 X154.245 Y107.942 I1.026 J1.776 E.02717
G1 X154.449 Y107.927 E.00679
G3 X153.142 Y108.44 I.051 J2.051 E.38006
G1 X153.398 Y108.256 E.01046
G1 X153.684 Y108.535 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7326
G1 X153.971 Y108.405 E.00969
G3 X154.294 Y108.331 I.529 J1.573 E.01018
G1 X154.459 Y108.319 E.00509
G3 X153.632 Y108.564 I.041 J1.659 E.29353
M204 S10000
; WIPE_START
G1 F24000
G1 X153.971 Y108.405 E-.1425
G1 X154.294 Y108.331 E-.12565
G1 X154.459 Y108.319 E-.06289
G1 X154.788 Y108.344 E-.12564
G1 X155.107 Y108.433 E-.12563
G1 X155.401 Y108.584 E-.12564
G1 X155.508 Y108.67 E-.05206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.08 J-1.214 P1  F30000
G1 X105.111 Y111.991 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7326
G1 X104.751 Y111.887 E.01244
G3 X105.245 Y107.942 I.749 J-1.91 E.17988
G1 X105.449 Y107.927 E.00679
G3 X105.17 Y112.002 I.051 J2.051 E.22648
G1 X105.212 Y111.612 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7326
G3 X105.294 Y108.331 I.288 J-1.634 E.14492
G1 X105.459 Y108.319 E.00509
G3 X105.271 Y111.621 I.041 J1.659 E.16849
M204 S10000
; WIPE_START
G1 F24000
G1 X104.893 Y111.524 E-.14821
G1 X104.599 Y111.373 E-.12563
G1 X104.465 Y111.277 E-.0629
G1 X104.228 Y111.046 E-.12563
G1 X104.042 Y110.773 E-.12563
G1 X103.913 Y110.468 E-.12564
G1 X103.889 Y110.349 E-.04636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.195 J.232 P1  F30000
G1 X106.669 Y124.662 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7326
G1 X106.343 Y124.848 E.01244
G3 X105.245 Y120.942 I-.843 J-1.87 E.23414
G1 X105.449 Y120.927 E.00679
G3 X106.718 Y124.628 I.051 J2.051 E.17221
G1 X106.396 Y124.369 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7326
G1 X106.182 Y124.49 E.00756
G3 X105.294 Y121.331 I-.682 J-1.513 E.17541
G1 X105.459 Y121.319 E.00509
G3 X106.468 Y124.325 I.041 J1.659 E.12968
G1 X106.447 Y124.338 E.00074
M204 S10000
; WIPE_START
G1 F24000
G1 X106.182 Y124.49 E-.11632
G1 X105.869 Y124.597 E-.12556
G1 X105.541 Y124.638 E-.12563
G1 X105.212 Y124.614 E-.12564
G1 X105.05 Y124.577 E-.06289
G1 X104.743 Y124.456 E-.12563
G1 X104.569 Y124.344 E-.07833
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.194 J1.201 P1  F30000
G1 X151.974 Y131.98 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7326
G1 X152.102 Y131.57 E.01423
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.053 E2.46832
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.226 E1.93421
G1 X151.957 Y132.037 E.0242
G1 X151.6 Y131.863 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7326
G1 X151.71 Y131.511 E.01135
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.103 E2.32136
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.582 Y131.921 E.02212
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.16316
G1 X151.71 Y129.94 E-.59684
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.184 J.282 P1  F30000
G1 X153.773 Y138.614 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7326
G2 X154.519 Y137.167 I-14.331 J-8.31 E.05402
G1 X151.555 Y134.203 E.13905
G3 X148.8 Y139.124 I-25.036 J-10.785 E.18741
G1 X151.597 Y141.921 E.13123
G3 X147.88 Y145.88 I-22.36 J-17.27 E.18042
G1 X145.102 Y143.102 E.13036
G3 X140.486 Y146.162 I-17.246 J-20.999 E.18403
G1 X143.384 Y149.06 E.13595
G3 X141.941 Y149.814 I-9.604 J-16.631 E.05403
G1 X118.059 Y149.813 F30000
G1 F7326
G3 X116.616 Y149.06 I6.935 J-15.045 E.05403
G1 X119.514 Y146.162 E.13596
G3 X114.898 Y143.102 I12.63 J-24.059 E.18403
G1 X112.12 Y145.88 E.13036
G3 X108.403 Y141.921 I18.643 J-21.228 E.18042
G1 X111.2 Y139.124 E.13123
G3 X108.445 Y134.203 I22.281 J-15.706 E.18741
G1 X105.481 Y137.167 E.13905
G2 X106.227 Y138.614 I15.077 J-6.863 E.05402
G1 X107.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129163
G1 F7326
G1 X107.524 Y124.081 E.00149
; LINE_WIDTH: 0.179222
G1 X107.593 Y123.99 E.00126
; LINE_WIDTH: 0.195631
G1 X107.694 Y123.842 E.00224
G1 X107.671 Y123.664 F30000
; LINE_WIDTH: 0.119464
G1 F7326
G3 X107.601 Y124.078 I-8.337 J-1.207 E.00262
G1 X107.672 Y122.292 F30000
; LINE_WIDTH: 0.0969203
G1 F7326
M73 P85 R2
G1 X107.654 Y122.187 E.00047
; LINE_WIDTH: 0.136066
G1 X107.629 Y122.056 E.00101
; LINE_WIDTH: 0.173111
G1 X107.571 Y121.97 E.0011
; LINE_WIDTH: 0.126784
G1 X107.453 Y121.806 E.00138
G1 X107.392 Y111.248 F30000
; LINE_WIDTH: 0.129162
G1 F7326
G1 X107.524 Y111.081 E.00149
; LINE_WIDTH: 0.17922
G1 X107.593 Y110.99 E.00126
; LINE_WIDTH: 0.195628
G1 X107.694 Y110.842 E.00224
G1 X107.671 Y110.664 F30000
; LINE_WIDTH: 0.119475
G1 F7326
G3 X107.601 Y111.078 I-8.324 J-1.205 E.00262
G1 X107.672 Y109.292 F30000
; LINE_WIDTH: 0.0969204
G1 F7326
G1 X107.654 Y109.187 E.00047
; LINE_WIDTH: 0.136068
G1 X107.629 Y109.056 E.00101
; LINE_WIDTH: 0.173114
G1 X107.571 Y108.97 E.0011
; LINE_WIDTH: 0.126785
G1 X107.453 Y108.806 E.00138
G1 X103.801 Y103.429 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7326
G1 X105.429 Y103.429 E.05401
G1 X107.55 Y105.55 E.09948
G1 X107.55 Y104.395 E.03832
G1 X103.652 Y108.292 E.18285
G1 X103.528 Y108.188 E.00538
G1 X103.45 Y108.278 E.00393
G1 X103.45 Y106.931 E.04465
G1 X103.608 Y108.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F7326
G1 X103.544 Y108.786 E.00044
; LINE_WIDTH: 0.111406
G1 X103.476 Y108.876 E.00063
; LINE_WIDTH: 0.147273
G1 X103.403 Y108.973 E.00103
; LINE_WIDTH: 0.181649
G1 X103.306 Y109.115 E.00195
G1 X103.329 Y109.294 F30000
; LINE_WIDTH: 0.119479
G1 F7326
G3 X103.399 Y108.879 I8.327 J1.205 E.00262
G1 X103.328 Y110.666 F30000
; LINE_WIDTH: 0.129188
G1 F7326
G1 X103.346 Y110.771 E.00075
; LINE_WIDTH: 0.161456
G1 X103.365 Y110.876 E.00103
; LINE_WIDTH: 0.148171
G2 X103.429 Y110.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111392
G1 X103.487 Y111.073 E.00058
; LINE_WIDTH: 0.0973903
G1 X103.547 Y111.152 E.00044
G1 X104.894 Y112.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7326
G2 X106.482 Y112.158 I.606 J-2.189 E.05405
G1 X107.55 Y113.226 E.05006
G1 X107.55 Y112.071 E.03832
G1 X103.45 Y116.17 E.19231
G1 X103.45 Y116.802 E.02098
G1 X107.55 Y120.902 E.19231
G1 X107.55 Y119.746 E.03832
G1 X106.495 Y120.801 E.04947
G2 X104.907 Y120.662 I-.973 J1.973 E.0541
G1 X103.608 Y121.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F7326
G1 X103.544 Y121.786 E.00044
; LINE_WIDTH: 0.111414
G1 X103.476 Y121.876 E.00063
; LINE_WIDTH: 0.14728
G1 X103.403 Y121.973 E.00103
; LINE_WIDTH: 0.181654
G1 X103.306 Y122.115 E.00195
G1 X103.329 Y122.294 F30000
; LINE_WIDTH: 0.119483
G1 F7326
G3 X103.399 Y121.879 I8.32 J1.204 E.00262
G1 X103.328 Y123.666 F30000
; LINE_WIDTH: 0.129188
G1 F7326
G1 X103.346 Y123.771 E.00075
; LINE_WIDTH: 0.161456
G1 X103.365 Y123.876 E.00103
; LINE_WIDTH: 0.14819
G2 X103.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111408
G1 X103.487 Y124.073 E.00058
; LINE_WIDTH: 0.0973918
G1 X103.547 Y124.152 E.00044
G1 X103.45 Y126.159 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7326
G1 X103.45 Y124.662 E.04967
G1 X103.555 Y124.583 E.00435
G1 X107.55 Y128.578 E.18741
G1 X107.55 Y127.422 E.03832
G1 X103.482 Y131.49 E.19082
G1 X103.712 Y132.416 E.03165
G1 X122.939 Y151.643 E.90196
G3 X121.987 Y151.365 I2.35 J-9.814 E.03291
G1 X125.195 Y148.157 E.15049
G2 X127.495 Y148.523 I5.304 J-25.922 E.07727
G1 X131.502 Y152.53 E.18798
G3 X128.498 Y152.53 I-1.502 J-27.504 E.0997
G1 X132.505 Y148.523 E.18798
G2 X134.805 Y148.157 I-3.004 J-26.289 E.07727
G1 X138.013 Y151.365 E.15049
G3 X137.061 Y151.643 I-3.302 J-9.535 E.03291
G1 X156.288 Y132.416 E.90196
G1 X156.518 Y131.49 E.03165
G1 X152.45 Y127.422 E.19082
G1 X152.45 Y128.578 E.03832
G1 X156.356 Y124.672 E.18322
G1 X156.492 Y124.786 E.00588
G1 X156.55 Y124.713 E.00308
G1 X156.55 Y126.071 E.04505
G1 X156.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129164
G1 F7326
G1 X156.524 Y124.081 E.00149
; LINE_WIDTH: 0.179225
G1 X156.593 Y123.99 E.00126
; LINE_WIDTH: 0.195635
G1 X156.694 Y123.842 E.00224
G1 X156.671 Y123.664 F30000
; LINE_WIDTH: 0.119468
G1 F7326
G3 X156.601 Y124.078 I-8.314 J-1.203 E.00262
G1 X156.672 Y122.292 F30000
; LINE_WIDTH: 0.0969203
G1 F7326
G1 X156.654 Y122.187 E.00047
; LINE_WIDTH: 0.136068
G1 X156.629 Y122.056 E.00101
; LINE_WIDTH: 0.173115
G1 X156.571 Y121.97 E.0011
; LINE_WIDTH: 0.126786
G1 X156.453 Y121.806 E.00138
G1 X155.095 Y120.656 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7326
G2 X153.507 Y120.804 I-.598 J2.177 E.05406
G1 X152.45 Y119.746 E.04959
G1 X152.45 Y120.902 E.03832
G1 X156.55 Y116.802 E.19231
G1 X156.55 Y116.17 E.02098
G1 X152.45 Y112.071 E.19231
G1 X152.45 Y113.226 E.03832
G1 X153.515 Y112.161 E.04996
G2 X155.104 Y112.293 I.964 J-1.965 E.05411
G1 X156.392 Y111.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129163
G1 F7326
G1 X156.524 Y111.081 E.00149
; LINE_WIDTH: 0.179221
G1 X156.593 Y110.99 E.00126
; LINE_WIDTH: 0.195632
G1 X156.694 Y110.842 E.00224
G1 X156.671 Y110.664 F30000
; LINE_WIDTH: 0.119479
G1 F7326
G3 X156.601 Y111.078 I-8.334 J-1.206 E.00262
G1 X156.672 Y109.292 F30000
; LINE_WIDTH: 0.0969204
G1 F7326
G1 X156.654 Y109.187 E.00047
; LINE_WIDTH: 0.136069
G1 X156.629 Y109.056 E.00101
; LINE_WIDTH: 0.173115
G1 X156.571 Y108.97 E.0011
; LINE_WIDTH: 0.126785
G1 X156.453 Y108.806 E.00138
G1 X156.55 Y106.809 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7326
G1 X156.55 Y108.296 E.04932
G1 X156.437 Y108.381 E.00469
G1 X152.45 Y104.395 E.18702
G1 X152.45 Y105.55 E.03832
G1 X154.571 Y103.429 E.09948
G1 X156.199 Y103.429 E.05401
G1 X152.608 Y108.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F7326
G1 X152.544 Y108.786 E.00044
; LINE_WIDTH: 0.111406
G1 X152.476 Y108.876 E.00063
; LINE_WIDTH: 0.147272
G1 X152.403 Y108.973 E.00103
; LINE_WIDTH: 0.181646
G1 X152.306 Y109.115 E.00195
G1 X152.329 Y109.294 F30000
; LINE_WIDTH: 0.119474
G1 F7326
G3 X152.399 Y108.879 I8.333 J1.206 E.00262
G1 X152.328 Y110.666 F30000
; LINE_WIDTH: 0.129186
G1 F7326
G1 X152.346 Y110.771 E.00075
; LINE_WIDTH: 0.161452
G1 X152.365 Y110.876 E.00103
; LINE_WIDTH: 0.148168
G2 X152.429 Y110.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.11139
G1 X152.487 Y111.073 E.00058
; LINE_WIDTH: 0.0973913
G1 X152.547 Y111.152 E.00044
G1 X152.608 Y121.71 F30000
; LINE_WIDTH: 0.0973918
G1 F7326
G1 X152.544 Y121.786 E.00044
; LINE_WIDTH: 0.111413
G1 X152.476 Y121.876 E.00063
; LINE_WIDTH: 0.147278
G1 X152.403 Y121.973 E.00103
; LINE_WIDTH: 0.181652
G1 X152.306 Y122.115 E.00195
G1 X152.329 Y122.294 F30000
; LINE_WIDTH: 0.119478
G1 F7326
G3 X152.399 Y121.879 I8.31 J1.202 E.00262
G1 X152.328 Y123.666 F30000
; LINE_WIDTH: 0.129186
G1 F7326
G1 X152.346 Y123.771 E.00075
; LINE_WIDTH: 0.161452
G1 X152.365 Y123.876 E.00103
; LINE_WIDTH: 0.148187
G2 X152.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111407
G1 X152.487 Y124.073 E.00058
; LINE_WIDTH: 0.0973916
G1 X152.547 Y124.152 E.00044
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X152.487 Y124.073 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/64
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
G3 Z8 I.59 J1.065 P1  F30000
G1 X156.284 Y121.969 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9369
G1 X156.302 Y121.997 E.0011
G3 X154.245 Y120.942 I-1.802 J.98 E.34611
G1 X154.449 Y120.927 E.00679
G3 X156.072 Y121.66 I.051 J2.051 E.06112
G1 X156.25 Y121.92 E.01047
G1 X156.033 Y122.363 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9369
G1 X156.086 Y122.49 E.00423
G3 X154.294 Y121.331 I-1.586 J.488 E.24912
G1 X154.459 Y121.319 E.00509
G3 X155.958 Y122.185 I.041 J1.659 E.05596
G1 X156.01 Y122.307 E.00408
M204 S10000
; WIPE_START
G1 F24000
G1 X156.086 Y122.49 E-.07507
G1 X156.152 Y122.813 E-.12532
G1 X156.158 Y123.062 E-.09496
G1 X156.109 Y123.388 E-.12526
G1 X155.996 Y123.699 E-.12563
G1 X155.823 Y123.981 E-.12564
G1 X155.666 Y124.151 E-.08813
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.205 J-.168 P1  F30000
G1 X153.446 Y108.221 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9369
G1 X153.474 Y108.201 E.00111
G3 X154.245 Y107.942 I1.026 J1.776 E.02717
G1 X154.449 Y107.927 E.00679
G3 X153.142 Y108.44 I.051 J2.051 E.38006
G1 X153.398 Y108.256 E.01046
G1 X153.681 Y108.536 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9369
G1 X153.971 Y108.405 E.00979
G3 X154.294 Y108.331 I.529 J1.573 E.01018
G1 X154.459 Y108.319 E.00509
G3 X153.629 Y108.566 I.041 J1.659 E.29343
M204 S10000
; WIPE_START
G1 F24000
G1 X153.971 Y108.405 E-.14376
G1 X154.294 Y108.331 E-.12564
G1 X154.459 Y108.319 E-.06289
G1 X154.788 Y108.344 E-.12564
G1 X155.107 Y108.433 E-.12563
G1 X155.401 Y108.584 E-.12564
G1 X155.505 Y108.667 E-.0508
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.08 J-1.214 P1  F30000
G1 X105.111 Y111.991 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9369
G1 X104.751 Y111.887 E.01244
G3 X105.245 Y107.942 I.749 J-1.91 E.17988
G1 X105.449 Y107.927 E.00679
G3 X105.17 Y112.002 I.051 J2.051 E.22647
G1 X105.212 Y111.612 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9369
G3 X105.294 Y108.331 I.288 J-1.634 E.14492
G1 X105.459 Y108.319 E.00509
G3 X105.271 Y111.621 I.041 J1.659 E.16849
M204 S10000
; WIPE_START
G1 F24000
G1 X104.893 Y111.524 E-.1482
G1 X104.599 Y111.373 E-.12564
G1 X104.465 Y111.277 E-.0629
G1 X104.228 Y111.046 E-.12563
G1 X104.042 Y110.773 E-.12563
G1 X103.914 Y110.468 E-.12563
G1 X103.889 Y110.349 E-.04636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.198 J.216 P1  F30000
G1 X106.496 Y124.77 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9369
G1 X106.153 Y124.922 E.01244
G3 X105.245 Y120.942 I-.653 J-1.945 E.22736
G1 X105.449 Y120.927 E.00679
G3 X106.548 Y124.741 I.051 J2.051 E.179
G1 X106.412 Y124.358 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9369
G1 X106.329 Y124.415 E.00308
G3 X105.294 Y121.331 I-.829 J-1.437 E.18049
G1 X105.459 Y121.319 E.00509
G3 X106.597 Y124.222 I.041 J1.659 E.12459
G1 X106.46 Y124.323 E.00523
M204 S10000
; WIPE_START
G1 F24000
G1 X106.329 Y124.415 E-.06088
G1 X106.029 Y124.553 E-.12556
G1 X105.706 Y124.626 E-.12563
G1 X105.376 Y124.634 E-.12563
G1 X105.05 Y124.577 E-.12564
G1 X104.743 Y124.456 E-.12563
G1 X104.586 Y124.355 E-.07103
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.194 J1.201 P1  F30000
G1 X151.972 Y131.987 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9369
G1 X152.102 Y131.57 E.01446
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.052 E2.46835
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.226 E1.93421
G1 X151.955 Y132.044 E.02397
G1 X151.598 Y131.87 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9369
G1 X151.71 Y131.511 E.01156
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.102 E2.32139
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.58 Y131.927 E.0219
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.16579
G1 X151.71 Y129.947 E-.59422
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.183 J.287 P1  F30000
G1 X152.449 Y132.994 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9369
G3 X151.865 Y134.514 I-16.867 J-5.599 E.05402
G1 X154.213 Y136.861 E.11014
G3 X153.473 Y138.311 I-15.109 J-6.803 E.05402
G1 X141.637 Y149.507 F30000
G1 F9369
G2 X143.083 Y148.759 I-7.227 J-15.747 E.05402
G1 X140.788 Y146.464 E.10765
G3 X139.316 Y147.159 I-7.71 J-14.436 E.05402
; WIPE_START
G1 F24000
G1 X140.788 Y146.464 E-.61858
G1 X141.052 Y146.728 E-.14142
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.026 J-1.217 P1  F30000
G1 X120.684 Y147.159 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F9369
G3 X119.212 Y146.464 I6.239 J-15.133 E.05402
G1 X116.917 Y148.759 E.10766
G2 X118.363 Y149.507 I8.32 J-14.325 E.05402
G1 X106.527 Y138.311 F30000
G1 F9369
G3 X105.787 Y136.861 I14.366 J-8.251 E.05402
G1 X108.134 Y134.514 E.11014
G3 X107.551 Y132.994 I16.294 J-7.122 E.05402
G1 X107.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129166
G1 F9369
G1 X107.524 Y124.081 E.00149
; LINE_WIDTH: 0.179229
G1 X107.593 Y123.99 E.00126
; LINE_WIDTH: 0.195633
G1 X107.694 Y123.842 E.00224
M73 P86 R2
G1 X107.671 Y123.664 F30000
; LINE_WIDTH: 0.119468
G1 F9369
G3 X107.601 Y124.078 I-8.317 J-1.203 E.00262
G1 X107.672 Y122.291 F30000
; LINE_WIDTH: 0.0969207
G1 F9369
G1 X107.654 Y122.187 E.00047
; LINE_WIDTH: 0.136071
G1 X107.629 Y122.056 E.00101
; LINE_WIDTH: 0.173119
G1 X107.571 Y121.97 E.0011
; LINE_WIDTH: 0.126789
G1 X107.453 Y121.806 E.00138
; WIPE_START
G1 F24000
G1 X107.571 Y121.97 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.197 J-.222 P1  F30000
G1 X104.208 Y103.836 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9369
G1 X105.836 Y103.836 E.05401
G1 X107.143 Y105.143 E.06129
G1 X107.143 Y104.802 E.01131
G1 X104.639 Y107.305 E.11746
G3 X106.246 Y107.269 I.871 J2.979 E.05393
G1 X107.55 Y108.155 F30000
G1 F9369
G1 X107.55 Y103.429 E.15676
G1 X103.45 Y103.429 E.13598
G1 X103.45 Y107.994 E.15143
G1 X105.201 Y107.595 E.05957
G3 X106.577 Y107.833 I.219 J2.826 E.04681
G1 X107.55 Y108.215 E.03465
G1 X107.453 Y108.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12678
G1 F9369
G1 X107.571 Y108.97 E.00138
; LINE_WIDTH: 0.173107
G1 X107.629 Y109.056 E.0011
; LINE_WIDTH: 0.136064
G1 X107.654 Y109.187 E.00101
; LINE_WIDTH: 0.09692
G1 X107.672 Y109.292 E.00047
G1 X107.601 Y111.078 F30000
; LINE_WIDTH: 0.119473
G1 F9369
G2 X107.671 Y110.664 I-8.151 J-1.603 E.00262
G1 X107.694 Y110.842 F30000
; LINE_WIDTH: 0.195624
G1 F9369
G1 X107.593 Y110.99 E.00224
; LINE_WIDTH: 0.17921
G1 X107.524 Y111.081 E.00126
; LINE_WIDTH: 0.129157
G1 X107.392 Y111.248 E.00149
G1 X104.423 Y112.124 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9369
G2 X105.834 Y112.355 I1.092 J-2.251 E.04809
G1 X107.55 Y111.965 E.05838
G1 X107.55 Y121.215 E.30683
G1 X106.252 Y120.705 E.04624
G2 X105.087 Y120.621 I-.706 J1.661 E.03945
G1 X103.45 Y120.994 E.05569
G1 X103.45 Y111.743 E.30689
G1 X104.367 Y112.102 E.03266
G1 X103.547 Y111.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.097391
G1 F9369
G1 X103.487 Y111.073 E.00044
; LINE_WIDTH: 0.111401
G1 X103.429 Y110.987 E.00058
; LINE_WIDTH: 0.148177
G3 X103.365 Y110.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161462
G1 X103.346 Y110.771 E.00103
; LINE_WIDTH: 0.129191
G1 X103.328 Y110.666 E.00075
G1 X103.399 Y108.879 F30000
; LINE_WIDTH: 0.11947
G1 F9369
G2 X103.329 Y109.294 I8.174 J1.607 E.00262
G1 X103.306 Y109.115 F30000
; LINE_WIDTH: 0.181648
G1 F9369
G1 X103.403 Y108.973 E.00195
; LINE_WIDTH: 0.147275
G1 X103.476 Y108.876 E.00103
; LINE_WIDTH: 0.11141
G1 X103.544 Y108.786 E.00063
; LINE_WIDTH: 0.0973915
G1 X103.608 Y108.71 E.00044
; WIPE_START
G1 F24000
G1 X103.544 Y108.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.027 J.653 P1  F30000
G1 X107.143 Y114.447 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9369
G1 X107.143 Y112.819 E.05401
G1 X106.863 Y112.539 E.01313
G1 X107.143 Y112.475 E.00952
G1 X103.857 Y115.763 E.15417
G1 X103.857 Y117.209 E.04799
G1 X107.143 Y120.495 E.15411
G1 X107.143 Y120.154 E.01131
G1 X106.809 Y120.487 E.01564
G2 X105.23 Y120.187 I-1.441 J3.278 E.05377
G1 X103.608 Y121.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F9369
G1 X103.544 Y121.786 E.00044
; LINE_WIDTH: 0.111413
G1 X103.476 Y121.876 E.00063
; LINE_WIDTH: 0.147281
G1 X103.403 Y121.973 E.00103
; LINE_WIDTH: 0.181658
G1 X103.306 Y122.115 E.00195
G1 X103.329 Y122.294 F30000
; LINE_WIDTH: 0.119483
G1 F9369
G3 X103.399 Y121.879 I8.319 J1.204 E.00262
G1 X103.328 Y123.666 F30000
; LINE_WIDTH: 0.129192
G1 F9369
G1 X103.346 Y123.771 E.00075
; LINE_WIDTH: 0.161462
G1 X103.365 Y123.876 E.00103
; LINE_WIDTH: 0.148185
G2 X103.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.11141
G1 X103.487 Y124.073 E.00058
; LINE_WIDTH: 0.0973917
G1 X103.547 Y124.152 E.00044
G1 X104.423 Y125.124 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9369
G1 X104.812 Y125.277 E.01388
G2 X105.947 Y125.329 I.648 J-1.739 E.0383
G1 X107.55 Y124.963 E.05452
G1 X107.55 Y131.623 E.22093
G2 X152.45 Y131.623 I22.45 J-6.281 E2.00751
G1 X152.45 Y124.743 E.22825
G1 X153.812 Y125.277 E.04854
G2 X154.934 Y125.332 I.646 J-1.717 E.03785
G1 X156.55 Y124.963 E.05498
G1 X156.55 Y131.362 E.21227
G3 X103.45 Y131.362 I-26.55 J-6.045 E2.43318
G1 X103.45 Y124.743 E.21959
G1 X104.367 Y125.102 E.03266
G1 X103.857 Y126.164 F30000
G1 F9369
G1 X103.857 Y125.34 E.02735
G1 X104.606 Y125.633 E.02666
G1 X107.143 Y128.17 E.11902
G1 X107.143 Y127.83 E.01131
G1 X103.857 Y131.115 E.15411
G2 X104.309 Y133.013 I11.371 J-1.703 E.06481
G1 X111.576 Y140.28 E.34091
G2 X112.647 Y141.506 I12.85 J-10.143 E.05402
G1 X110.909 Y139.415 F30000
G1 F9369
G1 X108.694 Y141.63 E.10395
G2 X112.408 Y145.592 I24.38 J-19.135 E.18037
G1 X114.61 Y143.39 E.10331
G2 X115.055 Y143.759 I3.925 J-4.283 E.01918
G1 X122.313 Y151.038 E.34101
G1 X124.855 Y148.497 E.11923
G2 X127.946 Y148.974 I5.031 J-22.33 E.10385
G1 X131.114 Y152.141 E.14858
G3 X128.886 Y152.141 I-1.114 J-27.71 E.0739
G1 X132.054 Y148.974 E.14858
G2 X135.145 Y148.497 I-2.178 J-24.353 E.10384
G1 X137.687 Y151.038 E.11923
G1 X144.945 Y143.759 E.34101
G2 X145.39 Y143.39 I-3.48 J-4.651 E.01918
G1 X147.592 Y145.592 E.10331
G2 X151.306 Y141.63 I-18.28 J-20.859 E.18043
G1 X149.091 Y139.415 E.10395
G1 X147.353 Y141.506 F30000
G1 F9369
G2 X148.115 Y140.646 I-8.257 J-8.087 E.03815
G1 X155.691 Y133.013 E.35673
G2 X156.143 Y131.313 I-17.065 J-5.444 E.05839
G1 X156.143 Y131.115 E.00656
G1 X152.857 Y127.83 E.15411
G1 X152.857 Y128.17 E.01131
G1 X155.38 Y125.648 E.11834
G1 X156.143 Y125.474 E.02594
G1 X156.143 Y126.32 E.02807
G1 X156.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F9369
G1 X156.524 Y124.081 E.00149
; LINE_WIDTH: 0.179229
G1 X156.593 Y123.99 E.00126
; LINE_WIDTH: 0.195635
G1 X156.694 Y123.842 E.00224
G1 X156.671 Y123.664 F30000
; LINE_WIDTH: 0.119472
G1 F9369
G3 X156.601 Y124.078 I-8.326 J-1.205 E.00262
G1 X156.672 Y122.292 F30000
; LINE_WIDTH: 0.0969207
G1 F9369
G1 X156.654 Y122.187 E.00047
; LINE_WIDTH: 0.136073
G1 X156.629 Y122.056 E.00101
; LINE_WIDTH: 0.173124
G1 X156.571 Y121.97 E.0011
; LINE_WIDTH: 0.126792
G1 X156.453 Y121.806 E.00138
; WIPE_START
G1 F24000
G1 X156.571 Y121.97 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.58 J-1.07 P1  F30000
G1 X152.547 Y124.152 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.0973917
G1 F9369
G1 X152.487 Y124.073 E.00044
; LINE_WIDTH: 0.111412
G1 X152.429 Y123.987 E.00058
; LINE_WIDTH: 0.148187
G3 X152.365 Y123.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X152.346 Y123.771 E.00103
; LINE_WIDTH: 0.12919
G1 X152.328 Y123.666 E.00075
G1 X152.399 Y121.879 F30000
; LINE_WIDTH: 0.119478
G1 F9369
G2 X152.329 Y122.294 I8.238 J1.617 E.00262
G1 X152.306 Y122.115 F30000
; LINE_WIDTH: 0.181656
G1 F9369
G1 X152.403 Y121.973 E.00195
; LINE_WIDTH: 0.14728
G1 X152.476 Y121.876 E.00103
; LINE_WIDTH: 0.111411
G1 X152.544 Y121.786 E.00063
; LINE_WIDTH: 0.097392
G1 X152.608 Y121.71 E.00044
G1 X152.857 Y118.525 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9369
G1 X152.857 Y120.154 E.05401
G1 X153.126 Y120.422 E.01261
G1 X152.871 Y120.481 E.00867
G1 X156.143 Y117.209 E.15346
G1 X156.143 Y115.763 E.04799
G1 X152.857 Y112.478 E.15411
G1 X152.857 Y112.819 E.01131
G1 X153.201 Y112.475 E.01613
G2 X154.494 Y112.778 I1.325 J-2.743 E.04439
G1 X154.781 Y112.771 E.00953
G1 X153.423 Y112.124 F30000
G1 F9369
G2 X154.834 Y112.355 I1.092 J-2.251 E.04809
G1 X156.55 Y111.965 E.05838
G1 X156.55 Y121.215 E.30683
G1 X155.252 Y120.705 E.04624
G2 X154.086 Y120.621 I-.707 J1.663 E.0395
G1 X152.45 Y120.994 E.05564
G1 X152.45 Y111.743 E.30689
G1 X153.367 Y112.102 E.03266
G1 X152.547 Y111.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973906
G1 F9369
G1 X152.487 Y111.073 E.00044
; LINE_WIDTH: 0.111398
G1 X152.429 Y110.987 E.00058
; LINE_WIDTH: 0.148172
G3 X152.365 Y110.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X152.346 Y110.771 E.00103
; LINE_WIDTH: 0.12919
G1 X152.328 Y110.666 E.00075
G1 X152.399 Y108.879 F30000
; LINE_WIDTH: 0.119468
G1 F9369
G2 X152.329 Y109.294 I8.26 J1.62 E.00262
G1 X152.306 Y109.115 F30000
; LINE_WIDTH: 0.181646
G1 F9369
G1 X152.403 Y108.973 E.00195
; LINE_WIDTH: 0.147273
G1 X152.476 Y108.876 E.00103
; LINE_WIDTH: 0.111408
G1 X152.544 Y108.786 E.00063
; LINE_WIDTH: 0.0973914
G1 X152.608 Y108.71 E.00044
; WIPE_START
G1 F24000
G1 X152.544 Y108.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.656 J1.025 P1  F30000
G1 X156.392 Y111.248 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.129158
G1 F9369
G1 X156.524 Y111.081 E.00149
; LINE_WIDTH: 0.179213
G1 X156.593 Y110.99 E.00126
; LINE_WIDTH: 0.195628
G1 X156.694 Y110.842 E.00224
G1 X156.671 Y110.664 F30000
; LINE_WIDTH: 0.119477
G1 F9369
G3 X156.601 Y111.078 I-8.231 J-1.19 E.00262
G1 X156.672 Y109.292 F30000
; LINE_WIDTH: 0.09692
G1 F9369
G1 X156.654 Y109.187 E.00047
; LINE_WIDTH: 0.136065
G1 X156.629 Y109.056 E.00101
; LINE_WIDTH: 0.173112
G1 X156.571 Y108.97 E.0011
; LINE_WIDTH: 0.126783
G1 X156.453 Y108.806 E.00138
G1 X156.55 Y108.215 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9369
G1 X155.577 Y107.833 E.03465
G2 X154.201 Y107.595 I-1.157 J2.587 E.04681
G1 X152.45 Y107.994 E.05957
G1 X152.45 Y103.429 E.15143
G1 X156.55 Y103.429 E.13598
G1 X156.55 Y108.155 E.15676
G1 X156.143 Y106.819 F30000
G1 F9369
G1 X156.143 Y107.618 E.0265
G1 X155.37 Y107.315 E.02752
G1 X152.857 Y104.802 E.11789
G1 X152.857 Y105.143 E.01131
G1 X154.164 Y103.836 E.06129
G1 X155.792 Y103.836 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X154.164 Y103.836 E-.61876
G1 X153.901 Y104.099 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/64
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
G3 Z8.2 I-1.206 J.165 P1  F30000
G1 X156.376 Y122.152 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9179
G1 X156.391 Y122.182 E.0011
G3 X154.245 Y120.942 I-1.891 J.796 E.33932
G1 X154.449 Y120.927 E.00679
G3 X156.196 Y121.823 I.051 J2.051 E.06791
G1 X156.347 Y122.1 E.01047
G1 X156.062 Y122.438 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9179
G1 X156.126 Y122.65 E.00682
G3 X154.294 Y121.331 I-1.627 J.328 E.24403
G1 X154.459 Y121.319 E.00509
G3 X156.029 Y122.334 I.041 J1.659 E.06105
G1 X156.044 Y122.381 E.0015
M204 S10000
; WIPE_START
G1 F24000
G1 X156.126 Y122.65 E-.10709
G1 X156.16 Y122.979 E-.1256
G1 X156.127 Y123.308 E-.12564
G1 X156.03 Y123.624 E-.12564
G1 X155.872 Y123.914 E-.12563
G1 X155.659 Y124.167 E-.12564
G1 X155.608 Y124.208 E-.02478
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.206 J-.163 P1  F30000
G1 X153.446 Y108.221 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9179
G1 X153.474 Y108.201 E.00111
G3 X154.245 Y107.942 I1.026 J1.776 E.02717
G1 X154.449 Y107.927 E.00679
G3 X153.142 Y108.44 I.051 J2.051 E.38006
G1 X153.398 Y108.256 E.01046
G1 X153.678 Y108.537 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9179
G1 X153.971 Y108.405 E.0099
G3 X154.294 Y108.331 I.529 J1.573 E.01018
G1 X154.459 Y108.319 E.00509
G3 X153.626 Y108.567 I.041 J1.659 E.29332
M204 S10000
; WIPE_START
G1 F24000
G1 X153.971 Y108.405 E-.14502
G1 X154.294 Y108.331 E-.12564
G1 X154.459 Y108.319 E-.06289
G1 X154.788 Y108.344 E-.12564
G1 X155.107 Y108.433 E-.12563
G1 X155.401 Y108.584 E-.12563
G1 X155.503 Y108.665 E-.04955
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.08 J-1.214 P1  F30000
G1 X105.111 Y111.991 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9179
G1 X104.751 Y111.887 E.01244
G3 X105.245 Y107.942 I.749 J-1.91 E.17988
G1 X105.449 Y107.927 E.00679
G3 X105.17 Y112.002 I.051 J2.051 E.22647
G1 X105.212 Y111.612 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9179
G3 X105.294 Y108.331 I.288 J-1.634 E.14492
G1 X105.459 Y108.319 E.00509
G3 X105.271 Y111.621 I.041 J1.659 E.16849
M204 S10000
; WIPE_START
G1 F24000
G1 X104.893 Y111.524 E-.1482
G1 X104.599 Y111.373 E-.12564
G1 X104.465 Y111.277 E-.06289
G1 X104.228 Y111.046 E-.12564
G1 X104.042 Y110.773 E-.12563
G1 X103.914 Y110.468 E-.12563
G1 X103.889 Y110.349 E-.04636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.196 J.227 P1  F30000
G1 X106.608 Y124.695 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9179
G1 X106.435 Y124.803 E.00677
G3 X105.245 Y120.942 I-.936 J-1.826 E.23753
G1 X105.449 Y120.927 E.00679
G3 X106.778 Y124.582 I.051 J2.051 E.1697
G1 X106.658 Y124.661 E.00478
G1 X106.444 Y124.339 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9179
G1 X106.4 Y124.372 E.00169
G3 X105.294 Y121.331 I-.9 J-1.394 E.18303
G1 X105.459 Y121.319 E.00509
G3 X106.658 Y124.166 I.041 J1.659 E.12205
G1 X106.49 Y124.301 E.00662
M204 S10000
; WIPE_START
G1 F24000
G1 X106.4 Y124.372 E-.04364
G1 X106.107 Y124.524 E-.12556
G1 X105.791 Y124.613 E-.12464
G1 X105.541 Y124.638 E-.09529
G1 X105.212 Y124.614 E-.12564
G1 X105.05 Y124.577 E-.06289
G1 X104.743 Y124.456 E-.12563
G1 X104.617 Y124.375 E-.05672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.193 J1.202 P1  F30000
G1 X151.97 Y131.993 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9179
G1 X152.102 Y131.57 E.01469
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.224 E1.93433
G1 X151.953 Y132.05 E.02375
G1 X151.596 Y131.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9179
G1 X151.71 Y131.511 E.01177
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.161 E1.75966
G1 X151.578 Y131.934 E.0217
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.16834
G1 X151.71 Y129.954 E-.59166
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.183 J.287 P1  F30000
G1 X152.449 Y132.994 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9179
G3 X152.018 Y134.154 I-11.828 J-3.726 E.04107
G1 X151.865 Y134.514 E.01296
G1 X154.213 Y136.861 E.11014
G3 X153.473 Y138.311 I-15.109 J-6.803 E.05402
G1 X149.091 Y139.415 F30000
G1 F9179
G1 X151.306 Y141.63 E.10395
G3 X147.592 Y145.592 I-21.994 J-16.898 E.18043
G1 X145.39 Y143.39 E.10331
G3 X144.945 Y143.759 I-3.924 J-4.282 E.01918
G1 X137.687 Y151.038 E.34101
G1 X135.145 Y148.497 E.11923
G3 X133.282 Y148.836 I-5.551 J-25.218 E.06284
G1 X133.321 Y149.396 E.01861
G1 X131.496 Y149.532 E.06073
G1 X128.886 Y152.141 E.12241
G2 X131.114 Y152.141 I1.114 J-27.711 E.0739
G1 X127.946 Y148.974 E.14858
M73 P87 R2
G1 X127.74 Y148.959 E.00688
G3 X124.855 Y148.497 I3.23 J-29.408 E.09695
G1 X122.313 Y151.038 E.11923
G1 X115.055 Y143.759 E.34101
G3 X114.61 Y143.39 I3.48 J-4.652 E.01918
G1 X112.408 Y145.592 E.10331
G3 X108.694 Y141.63 I18.279 J-20.859 E.18043
G1 X110.909 Y139.415 E.10395
G1 X112.647 Y141.506 F30000
G1 F9179
G3 X111.576 Y140.28 I11.777 J-11.367 E.05402
G1 X104.309 Y133.013 E.34091
G3 X103.857 Y131.115 I10.919 J-3.602 E.06481
G1 X107.143 Y127.83 E.15411
G1 X107.143 Y128.17 E.01131
G1 X104.606 Y125.633 E.11902
G1 X103.857 Y125.34 E.02666
G1 X103.857 Y126.164 E.02735
G1 X104.367 Y125.102 F30000
G1 F9179
G1 X103.45 Y124.743 E.03266
G1 X103.45 Y131.362 E.21959
G2 X156.55 Y131.362 I26.55 J-6.014 E2.4346
G1 X156.55 Y124.963 E.21227
G1 X155.207 Y125.27 E.04569
G3 X153.423 Y125.124 I-.717 J-2.224 E.06093
G1 X152.45 Y124.743 E.03465
G1 X152.45 Y131.623 E.22825
G3 X132.849 Y148.48 I-22.539 J-6.384 E.90844
G1 X132.887 Y149.02 E.01796
G1 X131.838 Y149.098 E.03488
G1 X131.793 Y148.586 E.01708
G3 X107.55 Y131.623 I-1.783 J-23.259 E1.06318
G1 X107.55 Y124.963 E.22093
G1 X106.207 Y125.27 E.04569
G3 X104.423 Y125.124 I-.717 J-2.224 E.06093
G1 X103.547 Y124.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973921
G1 F9179
G1 X103.487 Y124.073 E.00044
; LINE_WIDTH: 0.111412
G1 X103.429 Y123.987 E.00058
; LINE_WIDTH: 0.14819
G3 X103.365 Y123.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161462
G1 X103.346 Y123.771 E.00103
; LINE_WIDTH: 0.129192
G1 X103.328 Y123.666 E.00075
G1 X103.329 Y122.294 F30000
; LINE_WIDTH: 0.119478
G1 F9179
G3 X103.399 Y121.879 I8.306 J1.202 E.00262
G1 X103.476 Y121.876 F30000
; LINE_WIDTH: 0.111405
G1 F9179
G1 X103.544 Y121.786 E.00063
; LINE_WIDTH: 0.0973912
G1 X103.608 Y121.71 E.00044
G1 X103.476 Y121.876 F30000
; LINE_WIDTH: 0.147271
G1 F9179
G1 X103.403 Y121.973 E.00103
; LINE_WIDTH: 0.181645
G1 X103.306 Y122.115 E.00195
G1 X105.23 Y120.187 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9179
G3 X106.809 Y120.487 I.211 J3.194 E.05389
G1 X107.143 Y120.154 E.01564
G1 X107.143 Y120.495 E.01131
G1 X103.857 Y117.209 E.15411
G1 X103.857 Y115.763 E.04799
G1 X107.143 Y112.475 E.15417
G1 X106.863 Y112.539 E.00952
G1 X107.143 Y112.819 E.01313
G1 X107.143 Y114.447 E.05401
G1 X107.453 Y111.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126779
G1 F9179
G1 X107.571 Y110.987 E.00138
; LINE_WIDTH: 0.173106
G1 X107.629 Y110.902 E.0011
; LINE_WIDTH: 0.136064
G1 X107.654 Y110.771 E.00101
; LINE_WIDTH: 0.0969204
G1 X107.672 Y110.666 E.00047
G1 X107.672 Y109.292 F30000
; LINE_WIDTH: 0.0969206
G1 F9179
G1 X107.654 Y109.187 E.00047
; LINE_WIDTH: 0.136065
G1 X107.629 Y109.056 E.00101
; LINE_WIDTH: 0.173108
G1 X107.571 Y108.97 E.0011
; LINE_WIDTH: 0.126782
G1 X107.453 Y108.806 E.00138
G1 X107.55 Y108.215 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9179
G1 X106.577 Y107.833 E.03465
G2 X105.043 Y107.631 I-1.051 J2.051 E.05234
G1 X103.45 Y107.994 E.0542
G1 X103.45 Y103.429 E.15143
G1 X107.55 Y103.429 E.13598
G1 X107.55 Y108.155 E.15676
G1 X106.246 Y107.269 F30000
G1 F9179
G2 X104.639 Y107.305 I-.721 J3.681 E.05373
G1 X107.143 Y104.802 E.11746
G1 X107.143 Y105.143 E.01131
G1 X105.836 Y103.836 E.06129
G1 X104.208 Y103.836 E.05401
G1 X103.608 Y108.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F9179
G1 X103.544 Y108.786 E.00044
; LINE_WIDTH: 0.111414
G1 X103.476 Y108.876 E.00063
; LINE_WIDTH: 0.147277
G1 X103.403 Y108.973 E.00103
; LINE_WIDTH: 0.181648
G1 X103.306 Y109.115 E.00195
G1 X103.329 Y109.294 F30000
; LINE_WIDTH: 0.119485
G1 F9179
G3 X103.399 Y108.879 I8.333 J1.206 E.00262
G1 X103.328 Y110.666 F30000
; LINE_WIDTH: 0.129194
G1 F9179
G1 X103.346 Y110.771 E.00075
; LINE_WIDTH: 0.161468
G1 X103.365 Y110.876 E.00103
; LINE_WIDTH: 0.148169
G2 X103.429 Y110.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111397
G1 X103.487 Y111.073 E.00058
; LINE_WIDTH: 0.0973903
G1 X103.547 Y111.152 E.00044
G1 X104.367 Y112.102 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9179
G1 X103.45 Y111.743 E.03266
G1 X103.45 Y120.994 E.30689
G1 X105.02 Y120.636 E.05341
G3 X106.286 Y120.719 I.479 J2.386 E.04259
G1 X107.55 Y121.215 E.04502
G1 X107.55 Y111.965 E.30683
G1 X105.883 Y112.344 E.05671
G3 X104.423 Y112.124 I-.34 J-2.706 E.04959
G1 X107.453 Y121.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126781
G1 F9179
G1 X107.571 Y121.97 E.00138
; LINE_WIDTH: 0.173107
G1 X107.629 Y122.056 E.0011
; LINE_WIDTH: 0.136065
G1 X107.654 Y122.187 E.00101
; LINE_WIDTH: 0.0969201
G1 X107.672 Y122.292 E.00047
G1 X107.672 Y123.666 F30000
; LINE_WIDTH: 0.0969204
G1 F9179
G1 X107.654 Y123.771 E.00047
; LINE_WIDTH: 0.136068
G1 X107.629 Y123.902 E.00101
; LINE_WIDTH: 0.173115
G1 X107.571 Y123.987 E.0011
; LINE_WIDTH: 0.126785
G1 X107.453 Y124.152 E.00138
G1 X107.551 Y132.994 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9179
G2 X108.134 Y134.514 I15.554 J-5.095 E.05402
G1 X105.787 Y136.861 E.11014
G2 X106.527 Y138.311 I15.107 J-6.802 E.05402
G1 X118.363 Y149.507 F30000
G1 F9179
G3 X116.917 Y148.759 I6.874 J-15.072 E.05402
G1 X119.212 Y146.464 E.10766
G2 X120.684 Y147.159 I7.713 J-14.443 E.05402
G1 X132.234 Y148.633 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.504754
G1 F9179
G1 X132.361 Y148.622 E.00479
G1 X139.316 Y147.159 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9179
G2 X140.788 Y146.464 I-6.237 J-15.128 E.05402
G1 X143.083 Y148.759 E.10763
G3 X141.637 Y149.507 I-9.195 J-15.994 E.05402
G1 X147.353 Y141.506 F30000
G1 F9179
G2 X148.424 Y140.28 I-11.777 J-11.367 E.05402
G1 X155.691 Y133.013 E.34091
G2 X156.143 Y131.313 I-17.065 J-5.444 E.05839
G1 X156.143 Y131.115 E.00656
G1 X152.857 Y127.83 E.15411
G1 X152.857 Y128.17 E.01131
G1 X155.38 Y125.648 E.11834
G1 X156.143 Y125.474 E.02594
G1 X156.143 Y126.32 E.02807
G1 X156.453 Y124.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126787
G1 F9179
G1 X156.571 Y123.987 E.00138
; LINE_WIDTH: 0.173119
G1 X156.629 Y123.902 E.0011
; LINE_WIDTH: 0.13607
G1 X156.654 Y123.771 E.00101
; LINE_WIDTH: 0.0969204
G1 X156.672 Y123.666 E.00047
G1 X156.672 Y122.292 F30000
; LINE_WIDTH: 0.0969201
G1 F9179
G1 X156.654 Y122.187 E.00047
; LINE_WIDTH: 0.136067
G1 X156.629 Y122.056 E.00101
; LINE_WIDTH: 0.173112
G1 X156.571 Y121.97 E.0011
; LINE_WIDTH: 0.126784
G1 X156.453 Y121.806 E.00138
; WIPE_START
G1 F24000
G1 X156.571 Y121.97 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.08 J-1.214 P1  F30000
G1 X152.608 Y121.71 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.0973915
G1 F9179
G1 X152.544 Y121.786 E.00044
; LINE_WIDTH: 0.111407
G1 X152.476 Y121.876 E.00063
; LINE_WIDTH: 0.147272
G1 X152.403 Y121.973 E.00103
; LINE_WIDTH: 0.181645
G1 X152.306 Y122.115 E.00195
G1 X152.329 Y122.294 F30000
; LINE_WIDTH: 0.119475
G1 F9179
G3 X152.399 Y121.88 I8.395 J1.215 E.00262
G1 X152.328 Y123.666 F30000
; LINE_WIDTH: 0.12919
G1 F9179
G1 X152.346 Y123.771 E.00075
; LINE_WIDTH: 0.161458
G1 X152.365 Y123.876 E.00103
; LINE_WIDTH: 0.148187
G2 X152.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.11141
G1 X152.487 Y124.073 E.00058
; LINE_WIDTH: 0.0973918
G1 X152.547 Y124.152 E.00044
G1 X152.857 Y118.525 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9179
G1 X152.857 Y120.154 E.05401
G1 X153.126 Y120.422 E.01261
G1 X152.871 Y120.481 E.00867
G1 X156.143 Y117.209 E.15346
G1 X156.143 Y115.763 E.04799
G1 X152.857 Y112.478 E.15411
G1 X152.857 Y112.819 E.01131
G1 X153.201 Y112.475 E.01613
G2 X154.201 Y112.767 I1.615 J-3.666 E.03465
G1 X154.201 Y112.767 E0
G2 X154.781 Y112.771 I.298 J-1.43 E.01937
G1 X153.423 Y112.124 F30000
G1 F9179
G2 X154.272 Y112.366 I1.023 J-1.979 E.02948
G1 X154.272 Y112.366 E0
G2 X154.874 Y112.346 I.004 J-8.786 E.01998
G1 X156.55 Y111.965 E.05701
G1 X156.55 Y121.215 E.30683
G1 X155.286 Y120.719 E.04504
G2 X154.018 Y120.636 I-.786 J2.303 E.04264
G1 X152.45 Y120.994 E.05334
G1 X152.45 Y111.743 E.30689
G1 X153.367 Y112.102 E.03266
G1 X152.547 Y111.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973906
G1 F9179
G1 X152.487 Y111.073 E.00044
; LINE_WIDTH: 0.111401
G1 X152.429 Y110.987 E.00058
; LINE_WIDTH: 0.148172
G3 X152.365 Y110.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161464
G1 X152.346 Y110.771 E.00103
; LINE_WIDTH: 0.129192
G1 X152.328 Y110.666 E.00075
G1 X152.329 Y109.294 F30000
; LINE_WIDTH: 0.119481
G1 F9179
G3 X152.399 Y108.879 I8.338 J1.207 E.00262
G1 X152.476 Y108.876 F30000
; LINE_WIDTH: 0.147275
G1 F9179
G1 X152.403 Y108.973 E.00103
; LINE_WIDTH: 0.181646
G1 X152.306 Y109.115 E.00195
G1 X152.476 Y108.876 F30000
; LINE_WIDTH: 0.111411
G1 F9179
G1 X152.544 Y108.786 E.00063
; LINE_WIDTH: 0.0973916
G1 X152.608 Y108.71 E.00044
; WIPE_START
G1 F24000
G1 X152.544 Y108.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.006 J1.217 P1  F30000
G1 X156.453 Y108.806 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.126784
G1 F9179
G1 X156.571 Y108.97 E.00138
; LINE_WIDTH: 0.173114
G1 X156.629 Y109.056 E.0011
; LINE_WIDTH: 0.136068
G1 X156.654 Y109.187 E.00101
; LINE_WIDTH: 0.0969206
G1 X156.672 Y109.292 E.00047
G1 X156.55 Y108.215 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9179
G1 X155.577 Y107.833 E.03465
G2 X154.037 Y107.632 I-1.051 J2.051 E.05255
G1 X152.45 Y107.994 E.05399
G1 X152.45 Y103.429 E.15143
G1 X156.55 Y103.429 E.13598
G1 X156.55 Y108.155 E.15676
G1 X156.143 Y106.819 F30000
G1 F9179
G1 X156.143 Y107.618 E.0265
G1 X155.37 Y107.315 E.02752
G1 X152.857 Y104.802 E.11789
G1 X152.857 Y105.143 E.01131
G1 X154.164 Y103.836 E.06129
G1 X155.792 Y103.836 E.05401
G1 X156.672 Y110.666 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969204
G1 F9179
G1 X156.654 Y110.771 E.00047
; LINE_WIDTH: 0.136064
G1 X156.629 Y110.902 E.00101
; LINE_WIDTH: 0.173106
G1 X156.571 Y110.987 E.0011
; LINE_WIDTH: 0.126778
G1 X156.453 Y111.152 E.00138
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X156.571 Y110.987 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/64
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
G3 Z8.4 I-1.217 J-.013 P1  F30000
G1 X156.449 Y122.343 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9161
G1 X156.461 Y122.374 E.0011
G3 X154.245 Y120.942 I-1.961 J.604 E.33253
G1 X154.449 Y120.927 E.00679
G3 X156.302 Y121.997 I.051 J2.051 E.0747
G1 X156.425 Y122.288 E.01047
G1 X156.091 Y122.513 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9161
G1 X156.151 Y122.813 E.00941
G3 X154.294 Y121.331 I-1.651 J.165 E.23896
G1 X154.459 Y121.319 E.00509
G3 X156.075 Y122.455 I.041 J1.659 E.06502
M204 S10000
; WIPE_START
G1 F24000
G1 X156.151 Y122.813 E-.13906
G1 X156.158 Y123.063 E-.09497
G1 X156.109 Y123.388 E-.12512
G1 X155.996 Y123.699 E-.12563
G1 X155.823 Y123.981 E-.12563
G1 X155.599 Y124.224 E-.12564
G1 X155.547 Y124.26 E-.02395
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.207 J-.158 P1  F30000
G1 X153.446 Y108.221 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9161
G1 X153.474 Y108.201 E.00111
G3 X154.245 Y107.942 I1.026 J1.776 E.02717
G1 X154.449 Y107.927 E.00679
G3 X153.142 Y108.44 I.051 J2.051 E.38006
G1 X153.398 Y108.256 E.01046
G1 X153.675 Y108.539 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9161
G1 X153.971 Y108.405 E.01
G3 X154.294 Y108.331 I.529 J1.573 E.01018
G1 X154.459 Y108.319 E.00509
G3 X153.623 Y108.569 I.041 J1.659 E.29322
M204 S10000
; WIPE_START
G1 F24000
G1 X153.971 Y108.405 E-.14625
G1 X154.294 Y108.331 E-.12564
G1 X154.459 Y108.319 E-.06289
G1 X154.788 Y108.344 E-.12564
G1 X155.107 Y108.433 E-.12563
G1 X155.401 Y108.584 E-.12564
G1 X155.5 Y108.663 E-.04831
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.081 J-1.214 P1  F30000
G1 X105.177 Y112.003 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9161
G1 X105.144 Y111.998 E.00111
G3 X105.245 Y107.942 I.356 J-2.02 E.19345
G1 X105.449 Y107.927 E.00679
G3 X105.551 Y112.028 I.051 J2.051 E.21379
G1 X105.237 Y112.007 E.01045
G1 X105.212 Y111.612 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9161
G3 X105.294 Y108.331 I.288 J-1.634 E.14492
G1 X105.459 Y108.319 E.00509
G3 X105.271 Y111.621 I.041 J1.659 E.16849
M204 S10000
; WIPE_START
G1 F24000
G1 X104.893 Y111.524 E-.14821
G1 X104.599 Y111.373 E-.12564
G1 X104.465 Y111.277 E-.06289
G1 X104.228 Y111.046 E-.12564
G1 X104.042 Y110.773 E-.12563
G1 X103.913 Y110.468 E-.12563
G1 X103.889 Y110.349 E-.04635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.198 J.216 P1  F30000
G1 X106.496 Y124.77 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9161
G1 X106.153 Y124.922 E.01244
G3 X105.245 Y120.942 I-.653 J-1.945 E.22736
G1 X105.449 Y120.927 E.00679
G3 X106.548 Y124.741 I.051 J2.051 E.179
G1 X106.462 Y124.322 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9161
G1 X106.329 Y124.415 E.00497
G3 X105.294 Y121.331 I-.829 J-1.437 E.18049
G1 X105.459 Y121.319 E.00509
G3 X106.597 Y124.222 I.041 J1.659 E.12459
G1 X106.51 Y124.287 E.00334
M204 S10000
; WIPE_START
G1 F24000
M73 P88 R2
G1 X106.329 Y124.415 E-.08422
G1 X106.029 Y124.553 E-.12556
G1 X105.706 Y124.626 E-.12563
G1 X105.376 Y124.634 E-.12564
G1 X105.05 Y124.577 E-.12564
G1 X104.743 Y124.456 E-.12563
G1 X104.637 Y124.388 E-.04768
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.193 J1.202 P1  F30000
G1 X151.968 Y131.999 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9161
G1 X152.102 Y131.57 E.0149
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.052 E2.46835
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.226 E1.93421
G1 X151.951 Y132.057 E.02353
G1 X151.594 Y131.883 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9161
G1 X151.71 Y131.511 E.01197
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.165 E1.75953
G1 X151.576 Y131.94 E.0215
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.17082
G1 X151.71 Y129.96 E-.58918
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.182 J.288 P1  F30000
G1 X152.449 Y132.994 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9161
G3 X152.018 Y134.154 I-34.862 J-12.268 E.04106
G1 X151.865 Y134.514 E.01296
G1 X154.213 Y136.861 E.11014
G3 X153.473 Y138.311 I-15.109 J-6.803 E.05402
G1 X149.091 Y139.415 F30000
G1 F9161
G1 X151.306 Y141.63 E.10395
G3 X147.592 Y145.592 I-21.995 J-16.898 E.18043
G1 X145.39 Y143.39 E.10331
G3 X144.945 Y143.759 I-3.925 J-4.284 E.01917
G1 X137.687 Y151.038 E.34101
G1 X135.145 Y148.497 E.11923
G3 X132.054 Y148.974 I-5.273 J-23.9 E.10384
G1 X128.886 Y152.141 E.14858
G2 X131.114 Y152.141 I1.114 J-27.711 E.0739
G1 X127.946 Y148.974 E.14858
G1 X127.74 Y148.959 E.00688
G3 X124.855 Y148.497 I3.23 J-29.408 E.09695
G1 X122.313 Y151.038 E.11923
G1 X115.055 Y143.759 E.34101
G3 X114.61 Y143.39 I3.48 J-4.652 E.01918
G1 X112.408 Y145.592 E.10331
G3 X108.694 Y141.63 I18.28 J-20.86 E.18043
G1 X110.909 Y139.415 E.10395
G1 X112.647 Y141.506 F30000
G1 F9161
G3 X111.576 Y140.28 I11.977 J-11.541 E.05402
G1 X104.309 Y133.013 E.34091
G3 X103.857 Y131.115 I10.92 J-3.602 E.06481
G1 X107.143 Y127.83 E.15411
G1 X107.143 Y128.17 E.01131
G1 X104.606 Y125.633 E.11902
G1 X103.857 Y125.34 E.02666
G1 X103.857 Y126.164 E.02735
G1 X104.367 Y125.102 F30000
G1 F9161
G1 X103.45 Y124.743 E.03266
G1 X103.45 Y131.362 E.21959
G2 X135.684 Y151.973 I26.547 J-6.006 E1.40737
G1 X135.684 Y151.973 E0
G2 X156.55 Y131.362 I-5.78 J-26.719 E1.02689
G1 X156.55 Y124.963 E.21227
G1 X155.245 Y125.261 E.04438
G3 X153.423 Y125.124 I-.748 J-2.248 E.06224
G1 X152.45 Y124.743 E.03465
G1 X152.45 Y131.623 E.22825
G1 X152.119 Y132.685 E.03689
G3 X107.55 Y131.623 I-22.123 J-7.339 E1.97051
G1 X107.55 Y124.963 E.22093
G1 X106.245 Y125.261 E.04438
G3 X104.423 Y125.124 I-.748 J-2.248 E.06224
G1 X103.547 Y124.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F9161
G1 X103.487 Y124.073 E.00044
; LINE_WIDTH: 0.11141
G1 X103.429 Y123.987 E.00058
; LINE_WIDTH: 0.14819
G3 X103.365 Y123.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X103.346 Y123.771 E.00103
; LINE_WIDTH: 0.129189
G1 X103.328 Y123.666 E.00075
G1 X103.329 Y122.294 F30000
; LINE_WIDTH: 0.119474
G1 F9161
G3 X103.399 Y121.879 I8.328 J1.205 E.00262
G1 X103.476 Y121.876 F30000
; LINE_WIDTH: 0.147276
G1 F9161
G1 X103.403 Y121.973 E.00103
; LINE_WIDTH: 0.181644
G1 X103.306 Y122.115 E.00195
G1 X103.476 Y121.876 F30000
; LINE_WIDTH: 0.111416
G1 F9161
G1 X103.544 Y121.786 E.00063
; LINE_WIDTH: 0.0973917
G1 X103.608 Y121.71 E.00044
G1 X105.23 Y120.187 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9161
G3 X106.809 Y120.487 I.226 J3.113 E.05392
G1 X107.143 Y120.154 E.01564
G1 X107.143 Y120.495 E.01131
G1 X103.857 Y117.209 E.15411
G1 X103.857 Y115.763 E.04799
G1 X107.143 Y112.475 E.15417
G1 X106.863 Y112.539 E.00952
G1 X107.143 Y112.819 E.01313
G1 X107.143 Y114.447 E.05401
G1 X107.392 Y111.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129163
G1 F9161
G1 X107.524 Y111.081 E.00149
; LINE_WIDTH: 0.179222
G1 X107.593 Y110.99 E.00126
; LINE_WIDTH: 0.195627
G1 X107.694 Y110.842 E.00224
G1 X107.671 Y110.664 F30000
; LINE_WIDTH: 0.119468
G1 F9161
G3 X107.601 Y111.078 I-8.316 J-1.203 E.00262
G1 X107.672 Y109.292 F30000
; LINE_WIDTH: 0.0969205
G1 F9161
G1 X107.654 Y109.187 E.00047
; LINE_WIDTH: 0.136065
G1 X107.629 Y109.056 E.00101
; LINE_WIDTH: 0.173107
G1 X107.571 Y108.97 E.0011
; LINE_WIDTH: 0.12678
G1 X107.453 Y108.806 E.00138
G1 X107.55 Y108.215 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9161
G1 X106.577 Y107.833 E.03465
G2 X105.201 Y107.595 I-1.085 J2.171 E.04699
G1 X103.45 Y107.994 E.05957
G1 X103.45 Y103.429 E.15143
G1 X107.55 Y103.429 E.13598
G1 X107.55 Y108.155 E.15676
G1 X106.246 Y107.269 F30000
G1 F9161
G1 X105.785 Y107.188 E.01551
G2 X104.639 Y107.305 I-.236 J3.345 E.03841
G1 X107.143 Y104.802 E.11746
G1 X107.143 Y105.143 E.01131
G1 X105.836 Y103.836 E.06129
G1 X104.208 Y103.836 E.05401
G1 X103.608 Y108.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973921
G1 F9161
G1 X103.544 Y108.786 E.00044
; LINE_WIDTH: 0.111414
G1 X103.476 Y108.876 E.00063
; LINE_WIDTH: 0.147278
G1 X103.403 Y108.973 E.00103
; LINE_WIDTH: 0.181651
G1 X103.306 Y109.115 E.00195
G1 X103.329 Y109.294 F30000
; LINE_WIDTH: 0.119481
G1 F9161
G3 X103.399 Y108.879 I8.328 J1.205 E.00262
G1 X103.328 Y110.666 F30000
; LINE_WIDTH: 0.12919
G1 F9161
G1 X103.346 Y110.771 E.00075
; LINE_WIDTH: 0.161458
G1 X103.365 Y110.876 E.00103
; LINE_WIDTH: 0.148169
G2 X103.429 Y110.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111395
G1 X103.487 Y111.073 E.00058
; LINE_WIDTH: 0.0973902
G1 X103.547 Y111.152 E.00044
G1 X104.367 Y112.102 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9161
G1 X103.45 Y111.743 E.03266
G1 X103.45 Y120.994 E.30689
G1 X105.201 Y120.595 E.05957
G3 X106.346 Y120.742 I.251 J2.56 E.0386
G1 X107.55 Y121.215 E.04291
G1 X107.55 Y111.965 E.30683
G1 X105.837 Y112.354 E.05827
G3 X104.423 Y112.124 I-.318 J-2.509 E.04818
G1 X107.453 Y121.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126784
G1 F9161
G1 X107.571 Y121.97 E.00138
; LINE_WIDTH: 0.173113
G1 X107.629 Y122.056 E.0011
; LINE_WIDTH: 0.136067
G1 X107.654 Y122.187 E.00101
; LINE_WIDTH: 0.0969206
G1 X107.672 Y122.292 E.00047
G1 X107.671 Y123.664 F30000
; LINE_WIDTH: 0.119472
G1 F9161
G3 X107.601 Y124.078 I-8.309 J-1.202 E.00262
G1 X107.524 Y124.081 F30000
; LINE_WIDTH: 0.179229
G1 F9161
G1 X107.593 Y123.99 E.00126
; LINE_WIDTH: 0.195633
G1 X107.694 Y123.842 E.00224
G1 X107.524 Y124.081 F30000
; LINE_WIDTH: 0.129168
G1 F9161
G1 X107.392 Y124.248 E.00149
G1 X107.551 Y132.994 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9161
G2 X108.134 Y134.514 I16.878 J-5.602 E.05402
G1 X105.787 Y136.861 E.11014
G2 X106.527 Y138.311 I15.107 J-6.802 E.05402
G1 X118.363 Y149.507 F30000
G1 F9161
G3 X116.917 Y148.759 I6.873 J-15.071 E.05402
G1 X119.212 Y146.464 E.10766
G2 X120.684 Y147.159 I7.711 J-14.438 E.05402
; WIPE_START
G1 F24000
G1 X119.212 Y146.464 E-.61858
G1 X118.948 Y146.728 E-.14142
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.026 J1.217 P1  F30000
G1 X139.316 Y147.159 Z8.6
G1 Z8.2
G1 E.8 F1800
G1 F9161
G2 X140.788 Y146.464 I-6.236 J-15.128 E.05402
G1 X143.083 Y148.759 E.10763
G3 X141.637 Y149.507 I-9.021 J-15.662 E.05402
G1 X147.353 Y141.506 F30000
G1 F9161
G2 X148.103 Y140.66 I-8.117 J-7.957 E.03753
G1 X148.424 Y140.28 E.01649
G1 X155.691 Y133.013 E.34091
G2 X156.143 Y131.313 I-17.065 J-5.444 E.05839
G1 X156.143 Y131.115 E.00656
G1 X152.857 Y127.83 E.15411
G1 X152.857 Y128.17 E.01131
G1 X155.38 Y125.648 E.11834
G1 X156.143 Y125.474 E.02594
G1 X156.143 Y126.32 E.02807
G1 X156.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129167
G1 F9161
G1 X156.524 Y124.081 E.00149
; LINE_WIDTH: 0.17923
G1 X156.593 Y123.99 E.00126
; LINE_WIDTH: 0.195637
G1 X156.694 Y123.842 E.00224
G1 X156.671 Y123.664 F30000
; LINE_WIDTH: 0.119475
G1 F9161
G3 X156.601 Y124.078 I-8.391 J-1.215 E.00262
G1 X156.672 Y122.292 F30000
; LINE_WIDTH: 0.0969206
G1 F9161
G1 X156.654 Y122.187 E.00047
; LINE_WIDTH: 0.136069
G1 X156.629 Y122.056 E.00101
; LINE_WIDTH: 0.173118
G1 X156.571 Y121.97 E.0011
; LINE_WIDTH: 0.126786
G1 X156.453 Y121.806 E.00138
; WIPE_START
G1 F24000
G1 X156.571 Y121.97 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.08 J-1.214 P1  F30000
G1 X152.608 Y121.71 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.0973915
G1 F9161
G1 X152.544 Y121.786 E.00044
; LINE_WIDTH: 0.111414
G1 X152.476 Y121.876 E.00063
; LINE_WIDTH: 0.147274
G1 X152.403 Y121.973 E.00103
; LINE_WIDTH: 0.181644
G1 X152.306 Y122.115 E.00195
G1 X152.329 Y122.294 F30000
; LINE_WIDTH: 0.11947
G1 F9161
G3 X152.399 Y121.879 I8.322 J1.204 E.00262
G1 X152.328 Y123.666 F30000
; LINE_WIDTH: 0.129187
G1 F9161
G1 X152.346 Y123.771 E.00075
; LINE_WIDTH: 0.161452
G1 X152.365 Y123.876 E.00103
; LINE_WIDTH: 0.14819
G2 X152.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111411
G1 X152.487 Y124.073 E.00058
; LINE_WIDTH: 0.0973917
G1 X152.547 Y124.152 E.00044
G1 X152.857 Y118.525 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9161
G1 X152.857 Y120.154 E.05401
G1 X153.126 Y120.422 E.01261
G1 X152.871 Y120.481 E.00867
G1 X156.143 Y117.209 E.15346
G1 X156.143 Y115.763 E.04799
G1 X152.857 Y112.478 E.15411
G1 X152.857 Y112.819 E.01131
G1 X153.201 Y112.475 E.01613
G2 X154.529 Y112.777 I1.151 J-1.989 E.04585
G1 X154.781 Y112.771 E.00837
G1 X153.423 Y112.124 F30000
G1 F9161
G2 X154.836 Y112.354 I1.096 J-2.279 E.04817
G1 X156.55 Y111.965 E.05828
G1 X156.55 Y121.215 E.30683
G1 X155.345 Y120.742 E.04293
G2 X154.201 Y120.595 I-.892 J2.413 E.03858
G1 X152.45 Y120.994 E.05957
G1 X152.45 Y111.743 E.30689
G1 X153.367 Y112.102 E.03266
G1 X152.547 Y111.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973912
G1 F9161
G1 X152.487 Y111.073 E.00044
; LINE_WIDTH: 0.111392
G1 X152.429 Y110.987 E.00058
; LINE_WIDTH: 0.148166
G3 X152.365 Y110.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161454
G1 X152.346 Y110.771 E.00103
; LINE_WIDTH: 0.129188
G1 X152.328 Y110.666 E.00075
G1 X152.329 Y109.294 F30000
; LINE_WIDTH: 0.119476
G1 F9161
G3 X152.399 Y108.879 I8.337 J1.206 E.00262
G1 X152.476 Y108.876 F30000
; LINE_WIDTH: 0.147277
G1 F9161
G1 X152.403 Y108.973 E.00103
; LINE_WIDTH: 0.181651
G1 X152.306 Y109.115 E.00195
G1 X152.476 Y108.876 F30000
; LINE_WIDTH: 0.111413
G1 F9161
G1 X152.544 Y108.786 E.00063
; LINE_WIDTH: 0.0973921
G1 X152.608 Y108.71 E.00044
G1 X152.469 Y108.248 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F9161
G3 X152.667 Y108.341 I-.039 J.342 E.00618
G1 X156.143 Y106.819 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9161
G1 X156.143 Y107.618 E.0265
M73 P88 R1
G1 X155.37 Y107.315 E.02752
G1 X152.857 Y104.802 E.11789
G1 X152.857 Y105.143 E.01131
G1 X154.164 Y103.836 E.06129
G1 X155.792 Y103.836 E.05401
G1 X156.55 Y108.155 F30000
G1 F9161
G1 X156.55 Y103.429 E.15676
G1 X152.45 Y103.429 E.13598
G1 X152.45 Y107.774 E.14414
G1 X152.673 Y107.943 E.00928
G1 X154.201 Y107.595 E.05199
G3 X154.717 Y107.589 I.294 J3.487 E.01713
G1 X154.717 Y107.589 E0
G3 X155.577 Y107.833 I-.173 J2.25 E.02985
G1 X156.55 Y108.215 E.03465
G1 X156.453 Y108.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126783
G1 F9161
G1 X156.571 Y108.97 E.00138
; LINE_WIDTH: 0.173113
G1 X156.629 Y109.056 E.0011
; LINE_WIDTH: 0.136067
G1 X156.654 Y109.187 E.00101
; LINE_WIDTH: 0.0969205
G1 X156.672 Y109.292 E.00047
G1 X156.671 Y110.664 F30000
; LINE_WIDTH: 0.119472
G1 F9161
G3 X156.601 Y111.078 I-8.326 J-1.205 E.00262
G1 X156.524 Y111.081 F30000
; LINE_WIDTH: 0.129165
G1 F9161
G1 X156.392 Y111.248 E.00149
G1 X156.524 Y111.081 F30000
; LINE_WIDTH: 0.179224
M73 P89 R1
G1 F9161
G1 X156.593 Y110.99 E.00126
; LINE_WIDTH: 0.195631
G1 X156.694 Y110.842 E.00224
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X156.593 Y110.99 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/64
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
G3 Z8.6 I-1.217 J-.01 P1  F30000
G1 X156.502 Y122.54 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9390
G1 X156.511 Y122.572 E.00111
G3 X154.245 Y120.942 I-2.011 J.405 E.32574
G1 X154.449 Y120.927 E.00679
G3 X156.391 Y122.182 I.051 J2.051 E.08148
G1 X156.484 Y122.483 E.01046
G1 X156.107 Y122.583 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9390
G1 X156.126 Y122.65 E.00215
G3 X154.294 Y121.331 I-1.627 J.328 E.24403
G1 X154.459 Y121.319 E.00509
G3 X156.029 Y122.334 I.041 J1.659 E.06105
G1 X156.089 Y122.526 E.00616
M204 S10000
; WIPE_START
G1 F24000
G1 X156.126 Y122.65 E-.04937
G1 X156.16 Y122.957 E-.11747
G1 X156.142 Y123.226 E-.10241
G1 X156.06 Y123.547 E-.12563
G1 X155.917 Y123.844 E-.12564
G1 X155.717 Y124.108 E-.12563
G1 X155.492 Y124.306 E-.11385
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.208 J-.149 P1  F30000
G1 X153.504 Y108.187 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9390
G1 X153.846 Y108.033 E.01245
G3 X154.245 Y107.942 I.654 J1.945 E.01358
G1 X154.449 Y107.927 E.00679
G3 X153.451 Y108.214 I.051 J2.051 E.39276
G1 X153.672 Y108.54 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9390
G1 X153.971 Y108.405 E.01009
G3 X154.294 Y108.331 I.529 J1.573 E.01018
G1 X154.459 Y108.319 E.00509
G3 X153.62 Y108.571 I.041 J1.659 E.29313
M204 S10000
; WIPE_START
G1 F24000
G1 X153.971 Y108.405 E-.14744
G1 X154.294 Y108.331 E-.12564
G1 X154.459 Y108.319 E-.06289
G1 X154.788 Y108.344 E-.12564
G1 X155.107 Y108.433 E-.12563
G1 X155.401 Y108.584 E-.12563
G1 X155.498 Y108.661 E-.04713
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.081 J-1.214 P1  F30000
G1 X105.177 Y112.003 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9390
G1 X105.144 Y111.998 E.00111
G3 X105.245 Y107.942 I.356 J-2.02 E.19345
G1 X105.449 Y107.927 E.00679
G3 X105.551 Y112.028 I.051 J2.051 E.21379
G1 X105.237 Y112.007 E.01045
G1 X105.212 Y111.612 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9390
G3 X105.294 Y108.331 I.288 J-1.634 E.14492
G1 X105.459 Y108.319 E.00509
G3 X105.271 Y111.621 I.041 J1.659 E.16849
M204 S10000
; WIPE_START
G1 F24000
G1 X104.893 Y111.524 E-.14821
G1 X104.599 Y111.373 E-.12564
G1 X104.465 Y111.277 E-.06289
G1 X104.228 Y111.046 E-.12564
G1 X104.042 Y110.773 E-.12563
G1 X103.914 Y110.468 E-.12563
G1 X103.889 Y110.349 E-.04636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.195 J.232 P1  F30000
G1 X106.669 Y124.662 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9390
G1 X106.343 Y124.848 E.01244
G3 X105.245 Y120.942 I-.843 J-1.87 E.23414
G1 X105.449 Y120.927 E.00679
G3 X106.718 Y124.628 I.051 J2.051 E.17221
G1 X106.498 Y124.301 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9390
G1 X106.468 Y124.325 E.00117
G3 X105.294 Y121.331 I-.968 J-1.348 E.18557
G1 X105.459 Y121.319 E.00509
G3 X106.716 Y124.107 I.041 J1.659 E.11951
G1 X106.543 Y124.261 E.00713
M204 S10000
; WIPE_START
G1 F24000
G1 X106.468 Y124.325 E-.0373
G1 X106.183 Y124.492 E-.12556
G1 X105.869 Y124.597 E-.12564
G1 X105.541 Y124.638 E-.12563
G1 X105.212 Y124.614 E-.12564
G1 X105.05 Y124.577 E-.06289
G1 X104.743 Y124.456 E-.12563
G1 X104.672 Y124.411 E-.03171
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.193 J1.202 P1  F30000
G1 X151.966 Y132.005 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9390
G1 X152.102 Y131.57 E.01511
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.223 E1.93434
G1 X151.949 Y132.063 E.02332
G1 X151.592 Y131.889 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9390
G1 X151.71 Y131.511 E.01216
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.099 E2.3215
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.161 E1.75966
G1 X151.574 Y131.946 E.0213
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.17322
G1 X151.71 Y129.967 E-.58678
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.182 J.288 P1  F30000
G1 X152.449 Y132.994 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9390
G3 X151.865 Y134.514 I-16.867 J-5.599 E.05402
G1 X154.213 Y136.861 E.11014
G3 X153.473 Y138.311 I-15.109 J-6.803 E.05402
G1 X141.637 Y149.507 F30000
G1 F9390
G1 X141.795 Y149.432 E.0058
G2 X143.083 Y148.759 I-6.668 J-14.327 E.04823
G1 X140.788 Y146.464 E.10764
G3 X139.316 Y147.159 I-12.252 J-24.064 E.05401
; WIPE_START
G1 F24000
G1 X140.788 Y146.464 E-.61858
G1 X141.052 Y146.728 E-.14142
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.026 J-1.217 P1  F30000
G1 X120.684 Y147.159 Z8.8
G1 Z8.4
G1 E.8 F1800
G1 F9390
G3 X119.212 Y146.464 I6.239 J-15.133 E.05402
G1 X116.917 Y148.759 E.10766
G2 X118.363 Y149.507 I8.319 J-14.324 E.05402
G1 X106.527 Y138.311 F30000
G1 F9390
G3 X105.787 Y136.861 I14.366 J-8.251 E.05402
G1 X108.134 Y134.514 E.11014
G3 X107.551 Y132.994 I16.294 J-7.122 E.05402
G1 X107.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129166
G1 F9390
G1 X107.524 Y124.081 E.00149
; LINE_WIDTH: 0.179232
G1 X107.593 Y123.99 E.00126
; LINE_WIDTH: 0.195631
G1 X107.694 Y123.842 E.00224
G1 X107.671 Y123.664 F30000
; LINE_WIDTH: 0.119468
G1 F9390
G3 X107.601 Y124.078 I-8.317 J-1.203 E.00262
G1 X107.672 Y122.292 F30000
; LINE_WIDTH: 0.0969208
G1 F9390
G1 X107.654 Y122.187 E.00047
; LINE_WIDTH: 0.136067
G1 X107.629 Y122.056 E.00101
; LINE_WIDTH: 0.173111
G1 X107.571 Y121.97 E.0011
; LINE_WIDTH: 0.126784
G1 X107.453 Y121.806 E.00138
; WIPE_START
G1 F24000
G1 X107.571 Y121.97 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.197 J-.222 P1  F30000
G1 X104.208 Y103.836 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9390
G1 X105.836 Y103.836 E.05401
G1 X107.143 Y105.143 E.06129
G1 X107.143 Y104.802 E.01131
G1 X104.639 Y107.305 E.11746
G3 X105.832 Y107.196 I.879 J3.027 E.04
G1 X106.246 Y107.269 E.01392
G1 X107.55 Y108.155 F30000
G1 F9390
G1 X107.55 Y103.429 E.15676
G1 X103.45 Y103.429 E.13598
G1 X103.45 Y107.994 E.15143
G1 X105.201 Y107.595 E.05957
G3 X106.577 Y107.833 I.247 J2.662 E.04687
G1 X107.55 Y108.215 E.03465
G1 X107.453 Y108.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126786
G1 F9390
G1 X107.571 Y108.97 E.00138
; LINE_WIDTH: 0.173115
G1 X107.629 Y109.056 E.0011
; LINE_WIDTH: 0.136068
G1 X107.654 Y109.187 E.00101
; LINE_WIDTH: 0.0969205
G1 X107.672 Y109.292 E.00047
G1 X107.601 Y111.078 F30000
; LINE_WIDTH: 0.119478
G1 F9390
G2 X107.671 Y110.664 I-8.254 J-1.619 E.00262
G1 X107.694 Y110.842 F30000
; LINE_WIDTH: 0.195634
G1 F9390
G1 X107.593 Y110.99 E.00224
; LINE_WIDTH: 0.179235
G1 X107.524 Y111.081 E.00126
; LINE_WIDTH: 0.129169
G1 X107.392 Y111.248 E.00149
G1 X104.423 Y112.124 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9390
G2 X105.834 Y112.355 I1.065 J-2.088 E.0482
G1 X107.55 Y111.965 E.05837
G1 X107.55 Y121.215 E.30683
G1 X106.577 Y120.833 E.03465
G2 X105.201 Y120.594 I-1.129 J2.423 E.04686
G1 X103.45 Y120.994 E.05958
G1 X103.45 Y111.743 E.30689
G1 X104.367 Y112.102 E.03266
G1 X103.547 Y111.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973907
G1 F9390
G1 X103.487 Y111.073 E.00044
; LINE_WIDTH: 0.111397
G1 X103.429 Y110.987 E.00058
; LINE_WIDTH: 0.14817
G3 X103.365 Y110.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161468
G1 X103.346 Y110.771 E.00103
; LINE_WIDTH: 0.129195
G1 X103.328 Y110.666 E.00075
G1 X103.399 Y108.879 F30000
; LINE_WIDTH: 0.119472
G1 F9390
G2 X103.329 Y109.294 I8.271 J1.621 E.00262
G1 X103.306 Y109.115 F30000
; LINE_WIDTH: 0.181655
G1 F9390
G1 X103.403 Y108.973 E.00195
; LINE_WIDTH: 0.14728
G1 X103.476 Y108.876 E.00103
; LINE_WIDTH: 0.111413
G1 X103.544 Y108.786 E.00063
; LINE_WIDTH: 0.0973918
G1 X103.608 Y108.71 E.00044
; WIPE_START
G1 F24000
G1 X103.544 Y108.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.027 J.653 P1  F30000
G1 X107.143 Y114.447 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9390
G1 X107.143 Y112.819 E.05401
G1 X106.863 Y112.539 E.01313
G1 X107.143 Y112.475 E.00952
G1 X103.857 Y115.763 E.15417
G1 X103.857 Y117.209 E.04799
G1 X107.143 Y120.495 E.15411
G1 X107.143 Y120.154 E.01131
G1 X106.809 Y120.487 E.01564
G2 X105.23 Y120.187 I-1.306 J2.569 E.05403
G1 X103.608 Y121.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F9390
G1 X103.544 Y121.786 E.00044
; LINE_WIDTH: 0.111413
G1 X103.476 Y121.876 E.00063
; LINE_WIDTH: 0.147277
G1 X103.403 Y121.973 E.00103
; LINE_WIDTH: 0.18165
G1 X103.306 Y122.115 E.00195
G1 X103.329 Y122.294 F30000
; LINE_WIDTH: 0.119481
G1 F9390
G3 X103.399 Y121.879 I8.32 J1.204 E.00262
G1 X103.328 Y123.666 F30000
; LINE_WIDTH: 0.129192
G1 F9390
G1 X103.346 Y123.771 E.00075
; LINE_WIDTH: 0.161464
G1 X103.365 Y123.876 E.00103
; LINE_WIDTH: 0.148191
G2 X103.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111417
G1 X103.487 Y124.073 E.00058
; LINE_WIDTH: 0.0973921
G1 X103.547 Y124.152 E.00044
G1 X104.423 Y125.124 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9390
G2 X105.013 Y125.321 I.781 J-1.362 E.02077
G1 X105.013 Y125.321 E0
G2 X106.245 Y125.261 I.496 J-2.504 E.04134
G1 X107.55 Y124.963 E.04438
G1 X107.55 Y131.623 E.22093
G2 X152.45 Y131.623 I22.45 J-6.281 E2.00752
G1 X152.45 Y124.743 E.22825
G1 X153.423 Y125.124 E.03465
G2 X154.013 Y125.321 I.781 J-1.362 E.02077
G1 X154.013 Y125.321 E0
G2 X155.245 Y125.261 I.496 J-2.504 E.04134
G1 X156.55 Y124.963 E.04438
G1 X156.55 Y131.362 E.21227
G3 X103.45 Y131.362 I-26.55 J-6.007 E2.4349
G1 X103.45 Y124.743 E.21959
G1 X104.367 Y125.102 E.03266
G1 X103.857 Y126.164 F30000
G1 F9390
G1 X103.857 Y125.34 E.02735
G1 X104.606 Y125.633 E.02666
G1 X107.143 Y128.17 E.11902
G1 X107.143 Y127.83 E.01131
G1 X103.857 Y131.115 E.15411
G2 X104.309 Y133.013 I11.371 J-1.703 E.06481
G1 X111.576 Y140.28 E.34091
G2 X112.647 Y141.506 I12.848 J-10.141 E.05402
G1 X110.909 Y139.415 F30000
G1 F9390
G1 X108.694 Y141.63 E.10395
G2 X112.408 Y145.592 I21.994 J-16.897 E.18043
G1 X114.61 Y143.39 E.10331
G2 X115.055 Y143.759 I3.924 J-4.282 E.01918
G1 X122.313 Y151.038 E.34101
G1 X124.855 Y148.497 E.11923
G2 X127.74 Y148.959 I6.115 J-28.946 E.09695
G1 X127.946 Y148.974 E.00688
G1 X131.114 Y152.141 E.14858
G3 X128.886 Y152.141 I-1.114 J-27.711 E.0739
G1 X132.054 Y148.974 E.14858
G2 X135.145 Y148.497 I-2.182 J-24.376 E.10384
G1 X137.687 Y151.038 E.11923
G1 X144.945 Y143.759 E.34101
G2 X145.39 Y143.39 I-3.48 J-4.651 E.01918
G1 X147.592 Y145.592 E.10331
G2 X151.286 Y141.658 I-22.187 J-24.532 E.17921
G1 X149.091 Y139.415 E.10413
G1 X147.353 Y141.506 F30000
G1 F9390
G2 X148.424 Y140.28 I-11.777 J-11.367 E.05402
G1 X155.691 Y133.013 E.34091
G2 X156.143 Y131.313 I-17.065 J-5.444 E.05839
G1 X156.143 Y131.115 E.00656
G1 X152.857 Y127.83 E.15411
G1 X152.857 Y128.17 E.01131
G1 X155.38 Y125.648 E.11834
G1 X156.143 Y125.474 E.02594
G1 X156.143 Y126.32 E.02807
G1 X156.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129167
G1 F9390
G1 X156.524 Y124.081 E.00149
; LINE_WIDTH: 0.179233
G1 X156.593 Y123.99 E.00126
; LINE_WIDTH: 0.195633
G1 X156.694 Y123.842 E.00224
G1 X156.671 Y123.664 F30000
; LINE_WIDTH: 0.119472
G1 F9390
G3 X156.601 Y124.078 I-8.312 J-1.203 E.00262
G1 X156.672 Y122.292 F30000
; LINE_WIDTH: 0.0969208
G1 F9390
G1 X156.654 Y122.187 E.00047
; LINE_WIDTH: 0.136069
G1 X156.629 Y122.056 E.00101
; LINE_WIDTH: 0.173114
G1 X156.571 Y121.97 E.0011
; LINE_WIDTH: 0.126786
G1 X156.453 Y121.806 E.00138
; WIPE_START
G1 F24000
G1 X156.571 Y121.97 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.58 J-1.07 P1  F30000
G1 X152.547 Y124.152 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.0973918
G1 F9390
G1 X152.487 Y124.073 E.00044
; LINE_WIDTH: 0.111413
G1 X152.429 Y123.987 E.00058
; LINE_WIDTH: 0.148187
G3 X152.365 Y123.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X152.346 Y123.771 E.00103
; LINE_WIDTH: 0.12919
G1 X152.328 Y123.666 E.00075
G1 X152.399 Y121.879 F30000
; LINE_WIDTH: 0.119477
M73 P90 R1
G1 F9390
G2 X152.329 Y122.294 I8.169 J1.606 E.00262
G1 X152.306 Y122.115 F30000
; LINE_WIDTH: 0.181648
G1 F9390
G1 X152.403 Y121.973 E.00195
; LINE_WIDTH: 0.147275
G1 X152.476 Y121.876 E.00103
; LINE_WIDTH: 0.111411
G1 X152.544 Y121.786 E.00063
; LINE_WIDTH: 0.0973915
G1 X152.608 Y121.71 E.00044
G1 X152.857 Y118.525 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9390
G1 X152.857 Y120.154 E.05401
G1 X153.126 Y120.422 E.01261
G1 X152.871 Y120.481 E.00867
G1 X156.143 Y117.209 E.15346
G1 X156.143 Y115.763 E.04799
G1 X152.857 Y112.478 E.15411
G1 X152.857 Y112.819 E.01131
G1 X153.201 Y112.475 E.01613
G2 X154.781 Y112.771 I1.267 J-2.399 E.05413
G1 X153.423 Y112.124 F30000
G1 F9390
G2 X154.834 Y112.355 I1.134 J-2.508 E.04798
G1 X156.55 Y111.965 E.05837
G1 X156.55 Y121.215 E.30683
G1 X155.577 Y120.833 E.03465
G2 X154.201 Y120.594 I-1.129 J2.423 E.04686
G1 X152.45 Y120.994 E.05958
G1 X152.45 Y111.743 E.30689
G1 X153.367 Y112.102 E.03266
G1 X152.547 Y111.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973908
G1 F9390
G1 X152.487 Y111.073 E.00044
; LINE_WIDTH: 0.111398
G1 X152.429 Y110.987 E.00058
; LINE_WIDTH: 0.148171
G3 X152.365 Y110.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161464
G1 X152.346 Y110.771 E.00103
; LINE_WIDTH: 0.129193
G1 X152.328 Y110.666 E.00075
G1 X152.399 Y108.879 F30000
; LINE_WIDTH: 0.119468
G1 F9390
G2 X152.329 Y109.294 I8.26 J1.62 E.00262
G1 X152.306 Y109.115 F30000
; LINE_WIDTH: 0.181651
G1 F9390
G1 X152.403 Y108.973 E.00195
; LINE_WIDTH: 0.147276
G1 X152.476 Y108.876 E.00103
; LINE_WIDTH: 0.11141
G1 X152.544 Y108.786 E.00063
; LINE_WIDTH: 0.0973913
G1 X152.608 Y108.71 E.00044
; WIPE_START
G1 F24000
G1 X152.544 Y108.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.656 J1.025 P1  F30000
G1 X156.392 Y111.248 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.12917
G1 F9390
G1 X156.524 Y111.081 E.00149
; LINE_WIDTH: 0.179237
G1 X156.593 Y110.99 E.00126
; LINE_WIDTH: 0.195637
G1 X156.694 Y110.842 E.00224
G1 X156.671 Y110.664 F30000
; LINE_WIDTH: 0.119483
G1 F9390
G3 X156.601 Y111.078 I-8.319 J-1.204 E.00262
G1 X156.672 Y109.292 F30000
; LINE_WIDTH: 0.0969205
G1 F9390
G1 X156.654 Y109.187 E.00047
; LINE_WIDTH: 0.136069
G1 X156.629 Y109.056 E.00101
; LINE_WIDTH: 0.173116
G1 X156.571 Y108.97 E.0011
; LINE_WIDTH: 0.126786
G1 X156.453 Y108.806 E.00138
G1 X156.55 Y108.215 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9390
G1 X155.151 Y107.666 E.04985
G2 X154.201 Y107.595 I-.651 J2.313 E.0318
G1 X152.45 Y107.994 E.05957
G1 X152.45 Y103.429 E.15143
G1 X156.55 Y103.429 E.13598
G1 X156.55 Y108.155 E.15676
G1 X156.143 Y106.819 F30000
G1 F9390
G1 X156.143 Y107.618 E.0265
G1 X155.37 Y107.315 E.02752
G1 X152.857 Y104.802 E.11789
G1 X152.857 Y105.143 E.01131
G1 X154.164 Y103.836 E.06129
G1 X155.792 Y103.836 E.05401
M106 S224.4
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X154.164 Y103.836 E-.61876
G1 X153.901 Y104.099 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/64
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
G3 Z8.8 I-1.205 J.17 P1  F30000
G1 X156.515 Y122.605 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X156.551 Y122.979 E.01245
G3 X154.245 Y120.942 I-2.052 J-.001 E.31217
G1 X154.449 Y120.927 E.00679
G3 X156.506 Y122.546 I.051 J2.051 E.09418
G1 X156.125 Y122.641 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X156.126 Y122.65 E.00029
G3 X154.294 Y121.331 I-1.627 J.328 E.24403
G1 X154.459 Y121.319 E.00509
G3 X156.029 Y122.334 I.041 J1.659 E.06105
G1 X156.107 Y122.583 E.00802
M204 S10000
; WIPE_START
G1 F24000
G1 X156.126 Y122.65 E-.02637
G1 X156.16 Y122.979 E-.12559
G1 X156.127 Y123.308 E-.12563
G1 X156.03 Y123.624 E-.12564
G1 X155.872 Y123.914 E-.12563
G1 X155.67 Y124.156 E-.11953
G1 X155.469 Y124.327 E-.10038
G1 X155.444 Y124.342 E-.01122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.208 J-.15 P1  F30000
G1 X153.446 Y108.221 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.474 Y108.201 E.00111
G3 X154.245 Y107.942 I1.026 J1.776 E.02717
G1 X154.449 Y107.927 E.00679
G3 X153.142 Y108.44 I.051 J2.051 E.38006
G1 X153.398 Y108.256 E.01046
G1 X153.67 Y108.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X154.294 Y108.331 I.83 J1.437 E.02035
G1 X154.459 Y108.319 E.00509
G3 X153.619 Y108.572 I.041 J1.659 E.29306
M204 S10000
; WIPE_START
G1 F24000
G1 X153.971 Y108.405 E-.14825
G1 X154.294 Y108.331 E-.12564
G1 X154.459 Y108.319 E-.06289
G1 X154.788 Y108.344 E-.12564
G1 X155.107 Y108.433 E-.12563
G1 X155.401 Y108.584 E-.12564
G1 X155.496 Y108.66 E-.04631
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.08 J-1.214 P1  F30000
G1 X105.111 Y111.991 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X104.751 Y111.887 E.01244
G3 X105.245 Y107.942 I.749 J-1.91 E.17988
G1 X105.449 Y107.927 E.00679
G3 X105.17 Y112.002 I.051 J2.051 E.22647
G1 X105.212 Y111.612 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X105.294 Y108.331 I.288 J-1.634 E.14492
G1 X105.459 Y108.319 E.00509
G3 X105.271 Y111.621 I.041 J1.659 E.16849
M204 S10000
; WIPE_START
G1 F24000
G1 X104.893 Y111.524 E-.14821
G1 X104.599 Y111.373 E-.12564
G1 X104.465 Y111.277 E-.0629
G1 X104.228 Y111.046 E-.12563
G1 X104.042 Y110.773 E-.12563
G1 X103.913 Y110.468 E-.12563
G1 X103.889 Y110.349 E-.04636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.195 J.232 P1  F30000
G1 X106.669 Y124.663 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.343 Y124.848 E.01241
G3 X105.245 Y120.942 I-.843 J-1.87 E.23414
G1 X105.449 Y120.927 E.00679
G3 X106.718 Y124.628 I.051 J2.051 E.17224
G1 X106.52 Y124.284 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.468 Y124.325 E.00204
G3 X105.294 Y121.331 I-.968 J-1.348 E.18558
G1 X105.459 Y121.319 E.00509
G3 X106.669 Y124.155 I.041 J1.659 E.12156
G1 X106.565 Y124.244 E.00422
M204 S10000
; WIPE_START
G1 F24000
G1 X106.468 Y124.325 E-.04805
G1 X106.183 Y124.492 E-.12558
G1 X105.869 Y124.597 E-.12563
G1 X105.541 Y124.638 E-.12563
G1 X105.212 Y124.614 E-.12564
G1 X104.893 Y124.524 E-.12563
G1 X104.697 Y124.424 E-.08383
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.183 J1.203 P1  F30000
G1 X152.088 Y131.615 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X152.102 Y131.57 E.00155
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.227 E1.93421
G1 X152.07 Y131.672 E.03688
G1 X151.594 Y131.882 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y131.511 E.01197
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.103 E2.32135
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.161 E1.75966
G1 X151.576 Y131.94 E.0215
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.17077
G1 X151.71 Y129.96 E-.58923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.208 J.15 P1  F30000
G1 X152.402 Y124.402 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X152.338 Y124.439 E.00204
G1 X152.402 Y124.476 E.00204
G1 X152.423 Y124.439 E.00118
G1 X152.648 Y124.437 E.00624
G1 X152.648 Y124.51 E.00204
G1 X152.66 Y124.504 E.00038
G1 X152.547 Y124.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F15000
G1 X152.487 Y124.073 E.00044
; LINE_WIDTH: 0.111405
G1 X152.429 Y123.987 E.00058
; LINE_WIDTH: 0.148186
G3 X152.365 Y123.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161452
G1 X152.346 Y123.771 E.00103
; LINE_WIDTH: 0.129187
G1 X152.328 Y123.666 E.00075
G1 X152.329 Y122.294 F30000
; LINE_WIDTH: 0.119465
G1 F15000
G3 X152.399 Y121.879 I8.294 J1.2 E.00262
G1 X152.476 Y121.876 F30000
; LINE_WIDTH: 0.111407
G1 F15000
G1 X152.544 Y121.786 E.00063
; LINE_WIDTH: 0.0973916
G1 X152.608 Y121.71 E.00044
G1 X152.476 Y121.876 F30000
; LINE_WIDTH: 0.147275
G1 F15000
G1 X152.403 Y121.973 E.00103
; LINE_WIDTH: 0.181652
G1 X152.306 Y122.115 E.00195
G1 X152.734 Y121.319 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.395089
G1 F15000
G1 X152.505 Y121.296 E.0066
G1 X152.482 Y121.308 E.00076
G1 X155.382 Y120.951 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.403198
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X156.528 Y120.851 E.05987
G1 X156.528 Y120.396 E.02367
G1 X152.472 Y120.751 E.21183
G1 X152.472 Y120.296 E.02367
G1 X156.528 Y119.941 E.21183
G1 X156.528 Y119.486 E.02367
G1 X152.472 Y119.841 E.21183
G1 X152.472 Y119.386 E.02367
G1 X156.528 Y119.031 E.21183
G1 X156.528 Y118.576 E.02367
G1 X152.472 Y118.931 E.21183
G1 X152.472 Y118.476 E.02367
G1 X156.528 Y118.121 E.21183
G1 X156.528 Y117.666 E.02367
G1 X152.472 Y118.021 E.21183
G1 X152.472 Y117.566 E.02367
G1 X156.528 Y117.211 E.21183
G1 X156.528 Y116.756 E.02367
G1 X152.472 Y117.111 E.21183
G1 X152.472 Y116.656 E.02367
G1 X156.528 Y116.301 E.21183
G1 X156.528 Y115.846 E.02367
G1 X152.472 Y116.201 E.21183
G1 X152.472 Y115.746 E.02367
G1 X156.528 Y115.391 E.21183
G1 X156.528 Y114.936 E.02367
G1 X152.472 Y115.291 E.21183
G1 X152.472 Y114.836 E.02367
G1 X156.528 Y114.482 E.21183
G1 X156.528 Y114.027 E.02367
G1 X152.472 Y114.381 E.21183
G1 X152.472 Y113.927 E.02367
G1 X156.528 Y113.572 E.21183
G1 X156.528 Y113.117 E.02367
G1 X152.472 Y113.472 E.21183
G1 X152.472 Y113.017 E.02367
G1 X156.528 Y112.662 E.21183
G1 X156.528 Y112.207 E.02367
G1 X152.472 Y112.562 E.21183
G1 X152.472 Y112.107 E.02367
G1 X153.618 Y112.007 E.05986
M106 S224.4
G1 X152.402 Y111.402 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X152.338 Y111.439 E.00204
G1 X152.402 Y111.476 E.00204
G1 X152.423 Y111.439 E.00118
G1 X152.648 Y111.437 E.00624
G1 X152.648 Y111.51 E.00204
G1 X152.66 Y111.504 E.00038
G1 X152.547 Y111.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973902
G1 F15000
G1 X152.487 Y111.073 E.00044
; LINE_WIDTH: 0.111392
G1 X152.429 Y110.987 E.00058
; LINE_WIDTH: 0.14817
G3 X152.365 Y110.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161452
G1 X152.346 Y110.771 E.00103
; LINE_WIDTH: 0.129187
G1 X152.328 Y110.666 E.00075
G1 X152.329 Y109.294 F30000
; LINE_WIDTH: 0.119477
G1 F15000
G3 X152.399 Y108.879 I8.235 J1.191 E.00262
G1 X152.476 Y108.876 F30000
; LINE_WIDTH: 0.111416
G1 F15000
G1 X152.544 Y108.786 E.00063
; LINE_WIDTH: 0.0973919
G1 X152.608 Y108.71 E.00044
G1 X152.476 Y108.876 F30000
; LINE_WIDTH: 0.147284
G1 F15000
G1 X152.403 Y108.973 E.00103
; LINE_WIDTH: 0.181661
G1 X152.306 Y109.115 E.00195
G1 X152.427 Y108.333 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X152.628 Y108.294 E.00566
G1 X152.676 Y108.305 E.00137
G1 X156.352 Y108.447 F30000
G1 F15000
G1 X156.288 Y108.484 E.00204
G1 X156.337 Y108.512 E.00155
G1 X156.453 Y108.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126783
G1 F15000
G1 X156.571 Y108.97 E.00138
; LINE_WIDTH: 0.173111
G1 X156.629 Y109.056 E.0011
; LINE_WIDTH: 0.136067
G1 X156.654 Y109.187 E.00101
; LINE_WIDTH: 0.0969205
G1 X156.672 Y109.292 E.00047
G1 X156.672 Y110.666 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X156.654 Y110.771 E.00047
; LINE_WIDTH: 0.136066
G1 X156.629 Y110.902 E.00101
; LINE_WIDTH: 0.173109
G1 X156.571 Y110.987 E.0011
; LINE_WIDTH: 0.12678
G1 X156.453 Y111.152 E.00138
G1 X156.382 Y111.546 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.452168
G1 F15000
G2 X156.373 Y111.635 I-.026 J.042 E.00664
G1 X156.731 Y107.792 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.430702
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X155.532 Y107.792 E.07116
G1 X155.157 Y107.645 E.02394
G1 X154.681 Y107.561 E.02866
G1 X154.199 Y107.573 E.02866
G1 X153.239 Y107.792 E.05845
G1 X152.472 Y107.792 E.04552
G1 X152.472 Y107.312 E.02854
G1 X156.528 Y107.312 E.24079
G1 X156.528 Y106.831 E.02854
G1 X152.472 Y106.831 E.24079
G1 X152.472 Y106.35 E.02854
G1 X156.528 Y106.35 E.24079
G1 X156.528 Y105.869 E.02854
G1 X152.472 Y105.869 E.24079
G1 X152.472 Y105.389 E.02854
G1 X156.528 Y105.389 E.24079
G1 X156.528 Y104.908 E.02854
G1 X152.472 Y104.908 E.24079
G1 X152.472 Y104.427 E.02854
G1 X156.528 Y104.427 E.24079
G1 X156.528 Y103.947 E.02854
G1 X152.472 Y103.947 E.24079
G1 X152.472 Y103.466 E.02854
G1 X156.731 Y103.466 E.25281
M106 S224.4
G1 X156.352 Y121.447 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X156.288 Y121.484 E.00204
G1 X156.337 Y121.512 E.00155
G1 X156.453 Y121.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126783
G1 F15000
G1 X156.571 Y121.97 E.00138
; LINE_WIDTH: 0.173111
G1 X156.629 Y122.056 E.0011
; LINE_WIDTH: 0.136066
G1 X156.654 Y122.187 E.00101
; LINE_WIDTH: 0.0969202
G1 X156.672 Y122.292 E.00047
G1 X156.672 Y123.666 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X156.654 Y123.771 E.00047
; LINE_WIDTH: 0.135585
G1 X156.63 Y123.9 E.00099
; LINE_WIDTH: 0.172102
G1 X156.571 Y123.986 E.0011
; LINE_WIDTH: 0.126161
G1 X156.456 Y124.147 E.00134
G1 X156.385 Y124.543 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.453486
G1 F15000
G2 X156.377 Y124.632 I-.026 J.042 E.00669
G1 X156.731 Y125.392 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.405564
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X152.472 Y125.073 E.22479
G1 X152.472 Y125.53 E.02405
G1 X156.528 Y125.833 E.2141
G1 X156.528 Y126.29 E.02405
G1 X152.472 Y125.987 E.2141
G1 X152.472 Y126.444 E.02405
G1 X156.528 Y126.747 E.2141
G1 X156.528 Y127.204 E.02405
G1 X152.472 Y126.901 E.2141
G1 X152.472 Y127.357 E.02405
G1 X156.528 Y127.661 E.2141
G1 X156.528 Y128.118 E.02405
G1 X152.472 Y127.814 E.2141
G1 X152.472 Y128.271 E.02405
G1 X156.528 Y128.574 E.2141
G1 X156.528 Y129.031 E.02405
G1 X152.472 Y128.728 E.2141
G1 X152.472 Y129.185 E.02405
G1 X156.528 Y129.488 E.2141
G1 X156.528 Y129.945 E.02405
G1 X152.472 Y129.642 E.2141
G1 X152.472 Y130.099 E.02405
G1 X156.528 Y130.402 E.2141
G1 X156.528 Y130.859 E.02405
G1 X152.472 Y130.555 E.2141
G1 X152.472 Y131.012 E.02405
G1 X156.528 Y131.315 E.2141
M73 P91 R1
G1 X156.528 Y131.36 E.00233
G1 X156.428 Y131.765 E.02196
G1 X152.472 Y131.469 E.20879
G1 X152.472 Y131.627 E.0083
G1 X152.381 Y131.919 E.01611
G1 X156.316 Y132.213 E.20771
G3 X156.2 Y132.661 I-4.615 J-.96 E.02438
G1 X152.241 Y132.365 E.20891
G1 X152.102 Y132.812 E.02461
G1 X156.065 Y133.108 E.20915
G1 X155.93 Y133.555 E.02456
G1 X151.941 Y133.257 E.21055
G1 X151.778 Y133.701 E.02493
G1 X155.787 Y134.001 E.21162
G1 X155.629 Y134.446 E.02486
G1 X151.603 Y134.145 E.21248
G1 X151.415 Y134.588 E.02532
G1 X155.47 Y134.891 E.21405
G3 X155.299 Y135.335 I-4.599 J-1.517 E.02506
G1 X151.226 Y135.031 E.21502
G1 X151.012 Y135.471 E.02579
G1 X155.117 Y135.778 E.21666
G1 X154.934 Y136.221 E.02523
G1 X150.798 Y135.912 E.2183
G3 X150.566 Y136.352 I-4.53 J-2.109 E.02617
G1 X154.733 Y136.663 E.21992
G1 X154.525 Y137.105 E.02568
G1 X150.326 Y136.791 E.22164
G3 X150.075 Y137.229 I-4.526 J-2.297 E.02657
G1 X154.317 Y137.546 E.22389
G3 X154.083 Y137.985 I-4.593 J-2.162 E.02621
G1 X149.807 Y137.665 E.22572
G3 X149.535 Y138.102 I-4.52 J-2.506 E.02706
G1 X153.849 Y138.425 E.22769
G3 X153.607 Y138.863 I-4.58 J-2.243 E.02639
G1 X149.238 Y138.537 E.23062
G1 X148.94 Y138.971 E.02773
G1 X153.346 Y139.301 E.23254
G1 X153.084 Y139.738 E.02681
G1 X148.614 Y139.404 E.23594
G1 X148.285 Y139.836 E.02859
G1 X152.804 Y140.174 E.23848
G1 X152.514 Y140.609 E.02752
G1 X147.931 Y140.266 E.24187
G1 X147.569 Y140.696 E.02958
G1 X152.22 Y141.044 E.24549
G1 X151.9 Y141.477 E.02834
G1 X147.182 Y141.124 E.24901
G1 X146.784 Y141.551 E.03072
G1 X151.58 Y141.91 E.25311
G3 X151.239 Y142.341 I-4.555 J-3.249 E.02895
G1 X146.359 Y141.976 E.25756
G1 X145.922 Y142.4 E.03204
G1 X150.886 Y142.771 E.262
G3 X150.526 Y143.201 I-4.549 J-3.45 E.02955
G1 X145.452 Y142.822 E.26779
G1 X144.973 Y143.243 E.03356
G1 X150.139 Y143.629 E.27264
G1 X149.752 Y144.057 E.03037
G1 X144.449 Y143.661 E.2799
G3 X143.91 Y144.077 I-4.453 J-5.199 E.03585
G1 X149.331 Y144.482 E.28608
G1 X148.906 Y144.908 E.03161
G1 X143.333 Y144.491 E.29416
G3 X142.72 Y144.902 I-4.434 J-5.954 E.03888
G1 X148.454 Y145.331 E.30265
G1 X147.989 Y145.753 E.03305
G1 X142.079 Y145.311 E.31197
G1 X141.376 Y145.715 E.04266
G1 X147.499 Y146.173 E.32318
G1 X146.99 Y146.592 E.0347
G1 X140.624 Y146.116 E.33603
G3 X139.814 Y146.512 I-4.385 J-7.929 E.04745
G1 X146.454 Y147.008 E.35046
G1 X145.895 Y147.423 E.03663
G1 X138.932 Y146.903 E.36757
G1 X137.95 Y147.286 E.05544
G1 X145.303 Y147.836 E.38806
G1 X144.689 Y148.247 E.03889
G1 X136.832 Y147.66 E.41468
G3 X135.513 Y148.018 I-4.257 J-13.073 E.072
G1 X144.024 Y148.654 E.44926
G3 X143.339 Y149.06 I-4.292 J-6.47 E.04193
G1 X133.876 Y148.352 E.49946
G3 X131.483 Y148.63 I-3.969 J-23.728 E.12684
G1 X142.587 Y149.46 E.58605
G3 X141.797 Y149.858 I-4.623 J-8.202 E.04658
G1 X114.691 Y147.832 E1.43067
G3 X113.966 Y147.321 I4.832 J-7.621 E.04669
G1 X125.073 Y148.151 E.58621
G3 X122.748 Y147.52 I5.129 J-23.506 E.12683
G1 X113.283 Y146.813 E.49959
G3 X112.668 Y146.31 I4.805 J-6.505 E.04183
G1 X121.179 Y146.946 E.44927
G3 X119.928 Y146.396 I4.902 J-12.847 E.072
G1 X112.073 Y145.809 E.4146
G1 X111.524 Y145.311 E.03897
G1 X118.877 Y145.861 E.3881
G1 X117.964 Y145.335 E.05544
G1 X111.001 Y144.815 E.36751
G1 X110.509 Y144.321 E.03671
G1 X117.155 Y144.818 E.35079
G3 X116.408 Y144.305 I5.122 J-8.262 E.0477
G1 X110.043 Y143.83 E.33598
G1 X109.599 Y143.34 E.03477
G1 X115.723 Y143.797 E.32322
G1 X115.089 Y143.293 E.04266
G1 X109.179 Y142.851 E.31192
G1 X108.781 Y142.365 E.0331
G1 X114.516 Y142.793 E.30269
G3 X113.97 Y142.296 I4.725 J-5.726 E.03888
G1 X108.398 Y141.879 E.2941
G1 X108.04 Y141.396 E.03166
G1 X113.461 Y141.801 E.2861
G3 X112.99 Y141.309 I4.705 J-4.971 E.03585
G1 X107.689 Y140.913 E.27983
G1 X107.368 Y140.432 E.03041
G1 X112.534 Y140.818 E.27264
G1 X112.123 Y140.33 E.03356
G1 X107.048 Y139.951 E.26786
G3 X106.757 Y139.472 I4.719 J-3.197 E.02949
G1 X111.721 Y139.844 E.26198
G1 X111.352 Y139.359 E.03204
G1 X106.471 Y138.994 E.2576
G3 X106.2 Y138.517 I4.714 J-2.996 E.0289
G1 X110.995 Y138.876 E.25306
G1 X110.665 Y138.394 E.03072
G1 X105.947 Y138.041 E.24902
G1 X105.693 Y137.566 E.02837
G1 X110.346 Y137.913 E.24556
G1 X110.051 Y137.435 E.02958
G1 X105.469 Y137.092 E.24185
G1 X105.246 Y136.618 E.02755
G1 X109.765 Y136.956 E.23852
G1 X109.504 Y136.48 E.02859
G1 X105.035 Y136.146 E.23589
G1 X104.841 Y135.675 E.02684
G1 X109.246 Y136.004 E.23255
G1 X109.017 Y135.53 E.02773
G1 X104.646 Y135.203 E.23067
G3 X104.473 Y134.733 I4.688 J-1.991 E.02635
G1 X108.787 Y135.056 E.22766
G3 X108.583 Y134.584 I4.638 J-2.278 E.02706
G1 X104.306 Y134.264 E.22574
G3 X104.142 Y133.795 I4.686 J-1.904 E.02617
G1 X108.383 Y134.112 E.22383
G3 X108.2 Y133.641 I4.634 J-2.069 E.02657
G1 X104.001 Y133.328 E.22163
G1 X103.86 Y132.86 E.02569
G1 X108.028 Y133.172 E.21996
G3 X107.864 Y132.703 I4.629 J-1.881 E.02617
G1 X103.729 Y132.394 E.21825
G1 X103.613 Y131.928 E.02525
G1 X107.718 Y132.235 E.21665
G1 X107.572 Y131.767 E.02579
G1 X103.497 Y131.463 E.21506
G1 X103.472 Y131.36 E.00558
G1 X103.472 Y131.004 E.01873
G1 X107.528 Y131.307 E.2141
G1 X107.528 Y130.85 E.02405
G1 X103.472 Y130.547 E.2141
G1 X103.472 Y130.09 E.02405
G1 X107.528 Y130.393 E.2141
G1 X107.528 Y129.937 E.02405
G1 X103.472 Y129.633 E.2141
G1 X103.472 Y129.176 E.02405
G1 X107.528 Y129.48 E.2141
G1 X107.528 Y129.023 E.02405
G1 X103.472 Y128.72 E.2141
G1 X103.472 Y128.263 E.02405
G1 X107.528 Y128.566 E.2141
G1 X107.528 Y128.109 E.02405
G1 X103.472 Y127.806 E.2141
G1 X103.472 Y127.349 E.02405
G1 X107.528 Y127.652 E.2141
G1 X107.528 Y127.196 E.02405
G1 X103.472 Y126.892 E.2141
G1 X103.472 Y126.435 E.02405
G1 X107.528 Y126.739 E.2141
G1 X107.528 Y126.282 E.02405
G1 X103.472 Y125.979 E.2141
G1 X103.472 Y125.522 E.02405
G1 X107.528 Y125.825 E.2141
G1 X107.528 Y125.368 E.02405
M73 P92 R1
G1 X103.269 Y125.05 E.22479
M106 S224.4
G1 X103.402 Y124.402 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X103.338 Y124.439 E.00204
G1 X103.402 Y124.476 E.00204
G1 X103.423 Y124.439 E.00118
G1 X103.648 Y124.437 E.00624
G1 X103.648 Y124.51 E.00204
G1 X103.66 Y124.504 E.00038
G1 X103.547 Y124.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F15000
G1 X103.487 Y124.073 E.00044
; LINE_WIDTH: 0.111408
G1 X103.429 Y123.987 E.00058
; LINE_WIDTH: 0.148189
G3 X103.365 Y123.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X103.346 Y123.771 E.00103
; LINE_WIDTH: 0.129189
G1 X103.328 Y123.666 E.00075
G1 X103.329 Y122.294 F30000
; LINE_WIDTH: 0.11947
G1 F15000
G3 X103.399 Y121.879 I8.304 J1.201 E.00262
G1 X103.476 Y121.876 F30000
; LINE_WIDTH: 0.14728
G1 F15000
G1 X103.403 Y121.973 E.00103
; LINE_WIDTH: 0.181657
G1 X103.306 Y122.115 E.00195
G1 X103.476 Y121.876 F30000
; LINE_WIDTH: 0.111411
G1 F15000
G1 X103.544 Y121.786 E.00063
; LINE_WIDTH: 0.0973915
G1 X103.608 Y121.71 E.00044
G1 X103.427 Y121.333 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X103.628 Y121.294 E.00566
G1 X103.676 Y121.305 E.00137
G1 X106.382 Y120.951 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.403198
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X107.528 Y120.851 E.05987
G1 X107.528 Y120.396 E.02367
G1 X103.472 Y120.751 E.21183
G1 X103.472 Y120.296 E.02367
G1 X107.528 Y119.941 E.21183
G1 X107.528 Y119.486 E.02367
G1 X103.472 Y119.841 E.21183
G1 X103.472 Y119.386 E.02367
G1 X107.528 Y119.031 E.21183
G1 X107.528 Y118.576 E.02367
G1 X103.472 Y118.931 E.21183
G1 X103.472 Y118.476 E.02367
G1 X107.528 Y118.121 E.21183
G1 X107.528 Y117.666 E.02367
G1 X103.472 Y118.021 E.21183
G1 X103.472 Y117.566 E.02367
G1 X107.528 Y117.211 E.21183
G1 X107.528 Y116.756 E.02367
G1 X103.472 Y117.111 E.21183
G1 X103.472 Y116.656 E.02367
G1 X107.528 Y116.301 E.21183
G1 X107.528 Y115.846 E.02367
G1 X103.472 Y116.201 E.21183
G1 X103.472 Y115.746 E.02367
G1 X107.528 Y115.391 E.21183
G1 X107.528 Y114.936 E.02367
G1 X103.472 Y115.291 E.21183
G1 X103.472 Y114.836 E.02367
G1 X107.528 Y114.482 E.21183
G1 X107.528 Y114.027 E.02367
G1 X103.472 Y114.381 E.21183
G1 X103.472 Y113.927 E.02367
G1 X107.528 Y113.572 E.21183
G1 X107.528 Y113.117 E.02367
G1 X103.472 Y113.472 E.21183
G1 X103.472 Y113.017 E.02367
G1 X107.528 Y112.662 E.21183
G1 X107.528 Y112.207 E.02367
G1 X103.472 Y112.562 E.21183
G1 X103.472 Y112.107 E.02367
G1 X104.618 Y112.007 E.05986
M106 S224.4
G1 X103.402 Y111.402 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X103.338 Y111.439 E.00204
G1 X103.402 Y111.476 E.00204
G1 X103.423 Y111.439 E.00118
G1 X103.648 Y111.437 E.00624
G1 X103.648 Y111.51 E.00204
G1 X103.66 Y111.504 E.00038
G1 X103.547 Y111.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973924
G1 F15000
G1 X103.487 Y111.073 E.00044
; LINE_WIDTH: 0.111389
G1 X103.429 Y110.987 E.00058
; LINE_WIDTH: 0.148167
G3 X103.365 Y110.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X103.346 Y110.771 E.00103
; LINE_WIDTH: 0.129189
G1 X103.328 Y110.666 E.00075
G1 X103.329 Y109.294 F30000
; LINE_WIDTH: 0.119481
G1 F15000
G3 X103.399 Y108.879 I8.32 J1.204 E.00262
G1 X103.476 Y108.876 F30000
; LINE_WIDTH: 0.111417
G1 F15000
G1 X103.544 Y108.786 E.00063
; LINE_WIDTH: 0.097392
G1 X103.608 Y108.71 E.00044
G1 X103.476 Y108.876 F30000
; LINE_WIDTH: 0.147285
G1 F15000
G1 X103.403 Y108.973 E.00103
; LINE_WIDTH: 0.181661
G1 X103.306 Y109.115 E.00195
G1 X103.427 Y108.333 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X103.628 Y108.294 E.00566
G1 X103.676 Y108.305 E.00137
G1 X107.352 Y108.447 F30000
G1 F15000
G1 X107.288 Y108.484 E.00204
G1 X107.337 Y108.512 E.00155
G1 X107.453 Y108.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126781
G1 F15000
G1 X107.571 Y108.97 E.00138
; LINE_WIDTH: 0.173107
G1 X107.629 Y109.056 E.0011
; LINE_WIDTH: 0.136065
G1 X107.654 Y109.187 E.00101
; LINE_WIDTH: 0.0969206
G1 X107.672 Y109.292 E.00047
G1 X107.672 Y110.666 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X107.654 Y110.771 E.00047
; LINE_WIDTH: 0.136064
G1 X107.629 Y110.902 E.00101
; LINE_WIDTH: 0.173104
G1 X107.571 Y110.987 E.0011
; LINE_WIDTH: 0.126776
G1 X107.453 Y111.152 E.00138
G1 X107.382 Y111.546 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.452172
G1 F15000
G2 X107.373 Y111.635 I-.026 J.042 E.00664
G1 X107.731 Y107.792 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.430701
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X106.532 Y107.792 E.07116
G1 X106.157 Y107.645 E.02393
G1 X105.681 Y107.561 E.02866
G1 X105.199 Y107.573 E.02866
G1 X104.239 Y107.792 E.05845
G1 X103.472 Y107.792 E.04552
G1 X103.472 Y107.312 E.02853
G1 X107.528 Y107.312 E.24079
G1 X107.528 Y106.831 E.02853
G1 X103.472 Y106.831 E.24079
G1 X103.472 Y106.35 E.02853
G1 X107.528 Y106.35 E.24079
G1 X107.528 Y105.869 E.02853
G1 X103.472 Y105.869 E.24079
G1 X103.472 Y105.389 E.02853
G1 X107.528 Y105.389 E.24079
G1 X107.528 Y104.908 E.02853
G1 X103.472 Y104.908 E.24079
G1 X103.472 Y104.427 E.02853
G1 X107.528 Y104.427 E.24079
G1 X107.528 Y103.947 E.02853
G1 X103.472 Y103.947 E.24079
G1 X103.472 Y103.466 E.02853
G1 X107.731 Y103.466 E.25281
M106 S224.4
G1 X107.352 Y121.447 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X107.288 Y121.484 E.00204
G1 X107.337 Y121.512 E.00155
G1 X107.453 Y121.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126781
G1 F15000
G1 X107.571 Y121.97 E.00138
; LINE_WIDTH: 0.173108
G1 X107.629 Y122.056 E.0011
; LINE_WIDTH: 0.136064
G1 X107.654 Y122.187 E.00101
; LINE_WIDTH: 0.0969202
G1 X107.672 Y122.292 E.00047
G1 X107.672 Y123.666 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X107.654 Y123.771 E.00047
; LINE_WIDTH: 0.135583
G1 X107.63 Y123.9 E.00099
; LINE_WIDTH: 0.172096
G1 X107.571 Y123.986 E.0011
; LINE_WIDTH: 0.12616
G1 X107.456 Y124.147 E.00134
G1 X107.385 Y124.543 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.453496
G1 F15000
G2 X107.377 Y124.632 I-.026 J.042 E.00669
; WIPE_START
G1 F24000
G1 X107.334 Y124.632 E-.16484
G1 X107.308 Y124.587 E-.19839
G1 X107.334 Y124.543 E-.19839
G1 X107.385 Y124.543 E-.19839
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.929 J.786 P1  F30000
G1 X131.244 Y152.724 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.405564
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X127.884 Y152.473 E.17733
G3 X123.084 Y151.657 I1.95 J-26.011 E.25667
G1 X132.926 Y152.393 E.5195
G1 X133.334 Y152.353 E.02158
G1 X134.657 Y152.156 E.07037
G1 X134.988 Y152.09 E.01779
G1 X121.095 Y151.051 E.73331
G3 X119.602 Y150.483 I5.03 J-15.45 E.08409
G1 X136.547 Y151.75 E.89434
G2 X137.854 Y151.391 I-2.996 J-13.466 E.07138
G1 X118.363 Y149.934 E1.02875
G3 X117.29 Y149.397 I4.922 J-11.176 E.06319
G1 X138.996 Y151.019 E1.14566
G2 X140.022 Y150.639 I-3.35 J-10.619 E.05762
G1 X116.332 Y148.868 E1.25036
G1 X115.463 Y148.346 E.05336
G1 X141.372 Y150.283 E1.36751
M106 S224.4
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.378 Y150.134 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/64
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
G3 Z9 I1.031 J.646 P1  F30000
G1 X156.536 Y122.74 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X156.541 Y122.774 E.00114
G3 X154.245 Y120.942 I-2.041 J.203 E.31897
G1 X154.449 Y120.927 E.00679
G3 X156.461 Y122.374 I.051 J2.051 E.08827
G1 X156.524 Y122.681 E.01041
G1 X156.13 Y122.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X156.151 Y122.813 E.00333
G3 X154.294 Y121.331 I-1.651 J.164 E.23895
G1 X154.459 Y121.319 E.00509
G3 X156.086 Y122.49 I.041 J1.659 E.06613
G1 X156.118 Y122.648 E.00498
M204 S10000
; WIPE_START
G1 F24000
G1 X156.151 Y122.813 E-.06398
G1 X156.158 Y123.064 E-.09513
G1 X156.109 Y123.388 E-.12482
G1 X155.996 Y123.699 E-.12563
G1 X155.823 Y123.981 E-.12564
G1 X155.599 Y124.224 E-.12563
G1 X155.387 Y124.376 E-.09917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.208 J-.145 P1  F30000
G1 X153.446 Y108.221 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.474 Y108.201 E.00111
G3 X154.245 Y107.942 I1.026 J1.776 E.02717
G1 X154.449 Y107.927 E.00679
G3 X153.142 Y108.44 I.051 J2.051 E.38006
G1 X153.398 Y108.256 E.01046
G1 X153.667 Y108.543 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.67 Y108.541 E.00011
G3 X154.294 Y108.331 I.83 J1.437 E.02035
G1 X154.459 Y108.319 E.00509
G3 X153.402 Y108.734 I.041 J1.659 E.28472
G1 X153.618 Y108.578 E.00821
M204 S10000
; WIPE_START
G1 F24000
G1 X153.67 Y108.541 E-.02412
G1 X153.971 Y108.405 E-.12563
G1 X154.294 Y108.331 E-.12564
G1 X154.459 Y108.319 E-.06289
G1 X154.788 Y108.344 E-.12564
G1 X155.107 Y108.433 E-.12563
G1 X155.401 Y108.584 E-.12563
G1 X155.493 Y108.658 E-.04482
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.081 J-1.214 P1  F30000
G1 X105.177 Y112.003 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X105.144 Y111.998 E.00111
G3 X105.245 Y107.942 I.356 J-2.02 E.19345
G1 X105.449 Y107.927 E.00679
G3 X105.551 Y112.028 I.051 J2.051 E.21379
G1 X105.237 Y112.007 E.01045
G1 X105.212 Y111.612 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X105.294 Y108.331 I.288 J-1.634 E.14492
G1 X105.459 Y108.319 E.00509
G3 X105.271 Y111.621 I.041 J1.659 E.16849
M204 S10000
; WIPE_START
G1 F24000
G1 X104.893 Y111.524 E-.14821
G1 X104.599 Y111.373 E-.12564
G1 X104.465 Y111.277 E-.06289
G1 X104.228 Y111.046 E-.12564
G1 X104.042 Y110.773 E-.12563
G1 X103.913 Y110.468 E-.12564
G1 X103.889 Y110.349 E-.04636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.191 J.252 P1  F30000
G1 X106.881 Y124.493 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.857 Y124.516 E.00111
G3 X105.245 Y120.942 I-1.357 J-1.539 E.25449
G1 X105.449 Y120.927 E.00679
G3 X107.135 Y124.217 I.051 J2.051 E.15274
G1 X106.922 Y124.449 E.01045
G1 X106.547 Y124.26 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.329 Y124.415 E.00822
G3 X105.294 Y121.331 I-.829 J-1.437 E.18049
G1 X105.459 Y121.319 E.00509
G3 X106.597 Y124.222 I.041 J1.659 E.12459
G1 X106.595 Y124.224 E.00009
M204 S10000
; WIPE_START
G1 F24000
G1 X106.329 Y124.415 E-.12441
G1 X106.029 Y124.553 E-.12557
G1 X105.706 Y124.626 E-.12563
G1 X105.376 Y124.634 E-.12564
G1 X105.05 Y124.577 E-.12564
G1 X104.743 Y124.456 E-.12563
G1 X104.726 Y124.445 E-.00749
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.182 J1.203 P1  F30000
G1 X152.088 Y131.615 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X152.102 Y131.57 E.00155
G1 X152.102 Y103.081 E.94505
G1 X156.898 Y103.081 E.15909
G1 X156.898 Y131.405 E.93957
M73 P93 R1
G3 X103.102 Y131.405 I-26.898 J-6.057 E2.46812
G1 X103.102 Y103.081 E.93957
G1 X107.898 Y103.081 E.15909
G1 X107.898 Y131.57 E.94505
G2 X151.741 Y132.734 I22.102 J-6.223 E1.93436
G1 X152.07 Y131.672 E.03688
G1 X151.592 Y131.888 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y131.511 E.01214
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.161 E1.75966
G1 X151.575 Y131.945 E.02133
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.17293
G1 X151.71 Y129.966 E-.58707
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.871 J.85 P1  F30000
G1 X154.346 Y127.266 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F15000
G1 X154.346 Y131.111 E.09682
G1 X154.369 Y131.234 E.00314
; LINE_WIDTH: 0.399162
G1 X154.393 Y131.356 E.00362
; LINE_WIDTH: 0.446417
G1 X154.416 Y131.479 E.0041
; LINE_WIDTH: 0.493672
G1 F13976.668
G1 X154.44 Y131.601 E.00458
; LINE_WIDTH: 0.540926
G1 F12650.451
G1 X154.494 Y131.484 E.00525
; LINE_WIDTH: 0.493672
G1 F13976.668
G1 X154.547 Y131.366 E.00475
; LINE_WIDTH: 0.446417
G1 F15000
G1 X154.601 Y131.248 E.00425
; LINE_WIDTH: 0.353347
G1 X154.654 Y131.13 E.00327
G1 X154.654 Y127.262 E.09785
G1 X154.406 Y127.266 E.0063
; WIPE_START
G1 F24000
G1 X154.654 Y127.262 E-.09463
G1 X154.654 Y129.013 E-.66537
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.782 J-.933 P1  F30000
G1 X129.389 Y150.199 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.419999
G1 F15000
G3 X106.074 Y132.107 I.612 J-24.858 E.97081
G1 X105.998 Y131.601 E.0157
G1 X105.998 Y126.893 E.14468
G3 X105.002 Y126.93 I-.892 J-10.721 E.03061
G1 X105.002 Y131.172 E.13037
G2 X154.998 Y131.172 I24.998 J-5.82 E2.11682
G1 X154.998 Y126.893 E.13149
G3 X154.002 Y126.93 I-.891 J-10.719 E.03061
G1 X154.002 Y131.601 E.14355
G1 X153.926 Y132.107 E.0157
G3 X129.449 Y150.201 I-23.935 J-6.776 E1.00641
G1 X129.399 Y149.822 F30000
G1 F15000
G3 X106.434 Y131.994 I.609 J-24.488 E.95635
G1 X106.375 Y131.601 E.01221
G1 X106.375 Y126.437 E.1587
G1 X105.814 Y126.538 E.01752
G1 X105.102 Y126.53 E.02186
G1 X104.625 Y126.442 E.01489
G1 X104.625 Y131.219 E.14677
G2 X155.375 Y131.219 I25.375 J-5.867 E2.15043
G1 X155.375 Y126.437 E.14693
G1 X154.814 Y126.538 E.01752
G1 X154.102 Y126.53 E.02186
G1 X153.625 Y126.442 E.01489
G1 X153.625 Y131.601 E.15854
G1 X153.566 Y131.994 E.01221
G3 X129.459 Y149.824 I-23.58 J-6.67 E.99139
G1 X129.408 Y149.445 F30000
G1 F15000
G3 X106.794 Y131.882 I.592 J-24.103 E.942
G1 X106.752 Y131.601 E.00872
G1 X106.752 Y125.912 E.17481
G1 X106.429 Y126.038 E.01064
G1 X105.804 Y126.161 E.01956
G1 X105.168 Y126.158 E.01956
G1 X104.544 Y126.029 E.01956
G1 X104.248 Y125.913 E.00977
G1 X104.248 Y131.265 E.16444
G2 X155.752 Y131.265 I25.752 J-5.914 E2.18404
G1 X155.752 Y125.912 E.16446
G1 X155.429 Y126.038 E.01064
G1 X154.804 Y126.161 E.01956
G1 X154.168 Y126.158 E.01956
G1 X153.544 Y126.029 E.01956
G1 X153.248 Y125.913 E.00977
G1 X153.248 Y131.601 E.17478
G1 X153.206 Y131.882 E.00872
G3 X129.468 Y149.447 I-23.22 J-6.558 E.9764
G1 X129.418 Y149.068 F30000
G1 F15000
G3 X107.153 Y131.765 I.589 J-23.734 E.92771
G1 X107.129 Y131.111 E.02009
G1 X107.129 Y125.271 E.17947
G1 X106.861 Y125.449 E.00988
G1 X106.345 Y125.67 E.01726
G1 X105.795 Y125.784 E.01726
G1 X105.233 Y125.787 E.01726
G1 X104.682 Y125.678 E.01726
G1 X104.163 Y125.463 E.01726
G1 X103.871 Y125.274 E.01068
G1 X103.871 Y131.311 E.18549
G2 X156.129 Y131.311 I26.129 J-5.961 E2.21766
G1 X156.129 Y125.271 E.18559
G1 X155.861 Y125.449 E.00988
G1 X155.345 Y125.67 E.01726
G1 X154.795 Y125.784 E.01726
G1 X154.233 Y125.787 E.01726
G1 X153.682 Y125.678 E.01726
G1 X153.163 Y125.463 E.01726
G1 X152.871 Y125.274 E.01068
G1 X152.871 Y131.601 E.19442
G1 X152.846 Y131.77 E.00523
G3 X129.478 Y149.07 I-22.86 J-6.446 E.96141
G1 X129.427 Y148.691 F30000
G1 F15000
G3 X107.514 Y131.656 I.573 J-23.349 E.91324
G1 X107.506 Y124.722 E.21306
G1 X107.387 Y124.748 E.00373
G1 X107.267 Y124.654 E.0047
G1 X107.104 Y124.824 E.00724
G1 X106.706 Y125.106 E.01496
G1 X106.261 Y125.302 E.01496
G1 X105.785 Y125.407 E.01496
G1 X105.299 Y125.415 E.01496
G1 X104.82 Y125.327 E.01496
G1 X104.368 Y125.146 E.01496
G1 X103.954 Y124.872 E.01525
G1 X103.662 Y124.556 E.01321
G1 X103.566 Y124.628 E.00367
G1 X103.494 Y124.614 E.00225
G1 X103.494 Y131.357 E.2072
G2 X156.506 Y131.357 I26.506 J-6.008 E2.25127
G1 X156.506 Y124.722 E.20388
G1 X156.387 Y124.748 E.00373
G1 X156.267 Y124.654 E.0047
G1 X156.104 Y124.824 E.00724
G1 X155.706 Y125.106 E.01496
G1 X155.261 Y125.302 E.01496
G1 X154.785 Y125.407 E.01496
G1 X154.299 Y125.415 E.01496
G1 X153.82 Y125.327 E.01496
G1 X153.368 Y125.146 E.01496
G1 X152.954 Y124.872 E.01525
G1 X152.662 Y124.556 E.01321
G1 X152.566 Y124.628 E.00367
G1 X152.494 Y124.614 E.00225
G1 X152.486 Y131.658 E.21643
G3 X129.487 Y148.693 I-22.504 J-6.339 E.9464
; WIPE_START
G1 F24000
G1 X130.005 Y148.706 E-.19679
G1 X131.166 Y148.676 E-.44133
G1 X131.486 Y148.652 E-.12188
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.669 J-1.017 P1  F30000
G1 X105.56 Y131.601 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.540928
G1 F12650.399
G1 X105.622 Y131.905 E.01255
; LINE_WIDTH: 0.478123
G1 F14476.016
G2 X105.689 Y132.227 I1.742 J-.197 E.01169
G2 X154.311 Y132.227 I24.311 J-6.884 E2.32046
; LINE_WIDTH: 0.472554
G1 F14663.643
G1 X154.369 Y131.943 E.01013
; LINE_WIDTH: 0.50674
G1 F13582.855
G1 X154.428 Y131.66 E.01093
; WIPE_START
G1 F24000
G1 X154.369 Y131.943 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.116 J-1.211 P1  F30000
G1 X105.654 Y127.262 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.351907
G1 F15000
G1 X105.346 Y127.266 E.00778
G1 X105.346 Y131.13 E.09729
G1 X105.399 Y131.248 E.00326
; LINE_WIDTH: 0.399163
G1 X105.453 Y131.366 E.00376
; LINE_WIDTH: 0.446418
G1 X105.506 Y131.484 E.00425
; LINE_WIDTH: 0.493673
G1 F13976.621
G1 X105.56 Y131.601 E.00475
; LINE_WIDTH: 0.540928
G1 F12650.399
G1 X105.584 Y131.479 E.00506
; LINE_WIDTH: 0.493673
G1 F13976.621
G1 X105.607 Y131.356 E.00458
; LINE_WIDTH: 0.446418
G1 F15000
G1 X105.631 Y131.234 E.0041
; LINE_WIDTH: 0.353414
G1 X105.654 Y131.111 E.00316
G1 X105.654 Y127.322 E.09587
G1 X107.392 Y124.248 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129167
G1 F15000
G1 X107.524 Y124.081 E.00149
; LINE_WIDTH: 0.179234
G1 X107.593 Y123.99 E.00126
; LINE_WIDTH: 0.195633
G1 X107.694 Y123.842 E.00224
G1 X107.671 Y123.664 F30000
; LINE_WIDTH: 0.119466
G1 F15000
G3 X107.601 Y124.078 I-8.317 J-1.203 E.00262
G1 X107.672 Y122.292 F30000
; LINE_WIDTH: 0.0969202
G1 F15000
G1 X107.654 Y122.187 E.00047
; LINE_WIDTH: 0.136067
G1 X107.629 Y122.056 E.00101
; LINE_WIDTH: 0.173112
G1 X107.571 Y121.97 E.0011
; LINE_WIDTH: 0.126784
G1 X107.453 Y121.806 E.00138
G1 X107.506 Y121.335 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X107.506 Y111.722 E.29538
G1 X107.387 Y111.748 E.00373
G1 X107.267 Y111.654 E.0047
G1 X107.104 Y111.824 E.00724
G1 X106.706 Y112.106 E.01496
G1 X106.261 Y112.302 E.01496
G1 X105.785 Y112.407 E.01496
G1 X105.299 Y112.415 E.01496
G1 X104.82 Y112.327 E.01496
G1 X104.368 Y112.146 E.01496
G1 X103.954 Y111.872 E.01525
G1 X103.662 Y111.556 E.01321
G1 X103.566 Y111.628 E.00367
G1 X103.494 Y111.614 E.00225
G1 X103.494 Y121.237 E.29571
G1 X103.621 Y121.219 E.00393
G1 X103.733 Y121.303 E.00433
G1 X103.896 Y121.133 E.00724
G1 X104.294 Y120.852 E.01496
G1 X104.739 Y120.655 E.01496
G1 X105.215 Y120.55 E.01496
G1 X105.701 Y120.542 E.01496
G1 X106.18 Y120.63 E.01496
G1 X106.632 Y120.812 E.01496
G1 X107.046 Y121.086 E.01525
G1 X107.338 Y121.401 E.01321
G1 X107.447 Y121.325 E.00409
G1 X107.129 Y120.683 F30000
G1 F15000
G1 X107.129 Y112.271 E.2585
G1 X106.861 Y112.449 E.00988
G1 X106.345 Y112.67 E.01726
G1 X105.795 Y112.784 E.01726
G1 X105.233 Y112.787 E.01726
G1 X104.682 Y112.678 E.01726
G1 X104.163 Y112.463 E.01726
G1 X103.871 Y112.274 E.01068
G1 X103.871 Y120.687 E.2585
G1 X104.139 Y120.508 E.00988
G1 X104.655 Y120.287 E.01726
G1 X105.205 Y120.173 E.01726
G1 X105.767 Y120.171 E.01726
G1 X106.318 Y120.279 E.01726
G1 X106.837 Y120.495 E.01726
G1 X107.078 Y120.651 E.00884
G1 X106.752 Y120.044 F30000
G1 F15000
G1 X106.752 Y112.912 E.21914
G1 X106.429 Y113.038 E.01064
G1 X105.804 Y113.161 E.01956
G1 X105.168 Y113.158 E.01956
G1 X104.544 Y113.029 E.01956
G1 X104.248 Y112.913 E.00977
G1 X104.248 Y120.045 E.21914
G1 X104.571 Y119.92 E.01064
G1 X105.196 Y119.796 E.01956
G1 X105.832 Y119.799 E.01956
G1 X106.456 Y119.928 E.01956
G1 X106.696 Y120.022 E.00792
G1 X106.375 Y119.516 F30000
G1 F15000
G1 X106.375 Y113.437 E.18678
G1 X105.814 Y113.538 E.01752
G1 X105.102 Y113.53 E.02186
G1 X104.625 Y113.442 E.01489
G1 X104.625 Y119.521 E.18678
G1 X105.186 Y119.42 E.01752
G1 X105.898 Y119.428 E.02186
G1 X106.316 Y119.505 E.01305
G1 X105.998 Y119.028 F30000
G1 F15000
G1 X105.998 Y113.893 E.15778
G3 X105.002 Y113.93 I-.891 J-10.714 E.03061
G1 X105.002 Y119.064 E.15778
G3 X105.938 Y119.029 I.853 J10.078 E.02876
G1 X105.654 Y118.691 F30000
; LINE_WIDTH: 0.351907
G1 F15000
G1 X105.654 Y114.262 E.11151
G1 X105.346 Y114.266 E.00778
G1 X105.346 Y118.695 E.11151
G1 X105.594 Y118.692 E.00627
G1 X103.608 Y121.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.097392
G1 F15000
G1 X103.544 Y121.786 E.00044
; LINE_WIDTH: 0.11142
G1 X103.476 Y121.876 E.00063
; LINE_WIDTH: 0.147288
G1 X103.403 Y121.973 E.00103
; LINE_WIDTH: 0.181665
G1 X103.306 Y122.115 E.00195
G1 X103.329 Y122.294 F30000
; LINE_WIDTH: 0.119478
G1 F15000
G3 X103.399 Y121.879 I8.305 J1.202 E.00262
G1 X103.328 Y123.666 F30000
; LINE_WIDTH: 0.129193
G1 F15000
G1 X103.346 Y123.771 E.00075
; LINE_WIDTH: 0.161466
G1 X103.365 Y123.876 E.00103
; LINE_WIDTH: 0.148175
G2 X103.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111402
G1 X103.487 Y124.073 E.00058
; LINE_WIDTH: 0.0973908
G1 X103.547 Y124.152 E.00044
G1 X103.547 Y111.152 F30000
; LINE_WIDTH: 0.0973916
G1 F15000
G1 X103.487 Y111.073 E.00044
; LINE_WIDTH: 0.111389
G1 X103.429 Y110.987 E.00058
; LINE_WIDTH: 0.148169
G3 X103.365 Y110.876 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X103.346 Y110.771 E.00103
; LINE_WIDTH: 0.129189
G1 X103.328 Y110.666 E.00075
G1 X103.329 Y109.294 F30000
; LINE_WIDTH: 0.119481
G1 F15000
G3 X103.399 Y108.879 I8.332 J1.206 E.00262
G1 X103.476 Y108.876 F30000
; LINE_WIDTH: 0.111413
G1 F15000
G1 X103.544 Y108.786 E.00063
; LINE_WIDTH: 0.0973914
G1 X103.608 Y108.71 E.00044
G1 X103.476 Y108.876 F30000
; LINE_WIDTH: 0.14728
G1 F15000
G1 X103.403 Y108.973 E.00103
; LINE_WIDTH: 0.181657
G1 X103.306 Y109.115 E.00195
; WIPE_START
G1 F24000
G1 X103.403 Y108.973 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.05 J1.216 P1  F30000
M73 P94 R1
G1 X107.453 Y108.806 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.126785
G1 F15000
G1 X107.571 Y108.97 E.00138
; LINE_WIDTH: 0.173114
G1 X107.629 Y109.056 E.0011
; LINE_WIDTH: 0.136068
G1 X107.654 Y109.187 E.00101
; LINE_WIDTH: 0.0969209
G1 X107.672 Y109.292 E.00047
G1 X107.506 Y108.335 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X107.506 Y103.473 E.1494
G1 X103.494 Y103.473 E.12327
G1 X103.494 Y108.238 E.1464
G1 X103.621 Y108.219 E.00393
G1 X103.733 Y108.303 E.00433
G1 X103.896 Y108.133 E.00724
G1 X104.294 Y107.852 E.01496
G1 X104.739 Y107.655 E.01496
G1 X105.215 Y107.55 E.01496
G1 X105.701 Y107.542 E.01496
G1 X106.18 Y107.63 E.01496
G1 X106.632 Y107.812 E.01496
G1 X107.046 Y108.086 E.01525
G1 X107.338 Y108.401 E.01321
G1 X107.447 Y108.325 E.00409
G1 X107.129 Y107.683 F30000
G1 F15000
G1 X107.129 Y103.85 E.11779
G1 X103.871 Y103.85 E.10009
G1 X103.871 Y107.687 E.11789
G1 X104.139 Y107.508 E.00988
G1 X104.655 Y107.287 E.01726
G1 X105.205 Y107.173 E.01726
G1 X105.767 Y107.171 E.01726
G1 X106.318 Y107.279 E.01726
G1 X106.837 Y107.495 E.01726
G1 X107.078 Y107.651 E.00884
G1 X106.752 Y107.044 F30000
G1 F15000
G1 X106.752 Y104.227 E.08657
G1 X104.248 Y104.227 E.07692
G1 X104.248 Y107.045 E.08659
G1 X104.571 Y106.92 E.01064
G1 X105.196 Y106.796 E.01956
G1 X105.832 Y106.799 E.01956
G1 X106.456 Y106.928 E.01956
G1 X106.696 Y107.022 E.00792
G1 X106.375 Y106.516 F30000
G1 F15000
G1 X106.375 Y104.604 E.05873
G1 X104.625 Y104.604 E.05375
G1 X104.625 Y106.521 E.05889
G1 X105.186 Y106.42 E.01752
G1 X105.898 Y106.428 E.02186
G1 X106.316 Y106.505 E.01305
G1 X105.998 Y106.028 F30000
G1 F15000
G1 X105.998 Y104.981 E.03216
G1 X105.002 Y104.981 E.03058
G1 X105.002 Y106.064 E.03328
G3 X105.938 Y106.029 I.853 J10.063 E.02876
G1 X105.654 Y105.691 F30000
; LINE_WIDTH: 0.351907
G1 F15000
G1 X105.654 Y105.324 E.00924
G1 X105.346 Y105.324 E.00778
G1 X105.346 Y105.695 E.00934
G1 X105.594 Y105.692 E.00627
G1 X107.671 Y110.664 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119474
G1 F15000
G3 X107.601 Y111.078 I-8.322 J-1.204 E.00262
G1 X107.524 Y111.081 F30000
; LINE_WIDTH: 0.129161
G1 F15000
G1 X107.392 Y111.248 E.00149
G1 X107.524 Y111.081 F30000
; LINE_WIDTH: 0.179217
G1 F15000
G1 X107.593 Y110.99 E.00126
; LINE_WIDTH: 0.195631
G1 X107.694 Y110.842 E.00224
; WIPE_START
G1 F24000
G1 X107.593 Y110.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.009 J1.217 P1  F30000
G1 X152.328 Y110.666 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.129187
G1 F15000
G1 X152.346 Y110.771 E.00075
; LINE_WIDTH: 0.161452
G1 X152.365 Y110.876 E.00103
; LINE_WIDTH: 0.148174
G2 X152.429 Y110.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111395
G1 X152.487 Y111.073 E.00058
; LINE_WIDTH: 0.0973904
G1 X152.547 Y111.152 E.00044
G1 X152.329 Y109.294 F30000
; LINE_WIDTH: 0.119476
G1 F15000
G3 X152.399 Y108.879 I8.337 J1.207 E.00262
G1 X152.476 Y108.876 F30000
; LINE_WIDTH: 0.111411
G1 F15000
G1 X152.544 Y108.786 E.00063
; LINE_WIDTH: 0.0973912
G1 X152.608 Y108.71 E.00044
G1 X152.476 Y108.876 F30000
; LINE_WIDTH: 0.147278
G1 F15000
G1 X152.403 Y108.973 E.00103
; LINE_WIDTH: 0.181655
G1 X152.306 Y109.115 E.00195
G1 X154.346 Y105.695 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F15000
G1 X154.654 Y105.691 E.00778
G1 X154.654 Y105.324 E.00924
G1 X154.346 Y105.324 E.00778
G1 X154.346 Y105.635 E.00783
G1 X154.002 Y106.064 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G3 X154.998 Y106.028 I.891 J10.712 E.03061
G1 X154.998 Y104.981 E.03216
G1 X154.002 Y104.981 E.03058
G1 X154.002 Y106.004 E.03144
G1 X153.625 Y106.521 F30000
G1 F15000
G1 X154.186 Y106.42 E.01752
G1 X154.898 Y106.428 E.02186
G1 X155.375 Y106.516 E.01489
G1 X155.375 Y104.604 E.05873
G1 X153.625 Y104.604 E.05375
G1 X153.625 Y106.461 E.05705
G1 X153.248 Y107.045 F30000
G1 F15000
G1 X153.571 Y106.92 E.01064
G1 X154.196 Y106.796 E.01956
G1 X154.832 Y106.799 E.01956
G1 X155.456 Y106.928 E.01956
G1 X155.752 Y107.044 E.00977
G1 X155.752 Y104.227 E.08657
G1 X153.248 Y104.227 E.07692
G1 X153.248 Y106.985 E.08475
G1 X152.871 Y107.687 F30000
G1 F15000
G1 X153.139 Y107.508 E.00988
G1 X153.655 Y107.287 E.01726
G1 X154.205 Y107.173 E.01726
G1 X154.767 Y107.171 E.01726
G1 X155.318 Y107.279 E.01726
G1 X155.837 Y107.495 E.01726
G1 X156.129 Y107.683 E.01068
G1 X156.129 Y103.85 E.11779
G1 X152.871 Y103.85 E.10009
G1 X152.871 Y107.627 E.11605
G1 X152.494 Y108.238 F30000
G1 F15000
G1 X152.621 Y108.219 E.00392
G1 X152.733 Y108.303 E.00433
G1 X152.896 Y108.133 E.00724
G1 X153.294 Y107.852 E.01496
G1 X153.739 Y107.655 E.01496
G1 X154.215 Y107.55 E.01496
G1 X154.701 Y107.542 E.01496
G1 X155.18 Y107.63 E.01496
G1 X155.632 Y107.812 E.01496
G1 X156.046 Y108.086 E.01525
G1 X156.338 Y108.401 E.01321
G1 X156.441 Y108.324 E.00395
G1 X156.506 Y108.335 E.00203
G1 X156.506 Y103.473 E.1494
G1 X152.494 Y103.473 E.12327
G1 X152.494 Y108.178 E.14456
G1 X156.453 Y108.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126782
G1 F15000
G1 X156.571 Y108.97 E.00138
; LINE_WIDTH: 0.173111
G1 X156.629 Y109.056 E.0011
; LINE_WIDTH: 0.136067
G1 X156.654 Y109.187 E.00101
; LINE_WIDTH: 0.0969209
G1 X156.672 Y109.292 E.00047
G1 X156.671 Y110.664 F30000
; LINE_WIDTH: 0.119479
G1 F15000
G3 X156.601 Y111.078 I-8.332 J-1.206 E.00262
G1 X156.524 Y111.081 F30000
; LINE_WIDTH: 0.179219
G1 F15000
G1 X156.593 Y110.99 E.00126
; LINE_WIDTH: 0.195632
G1 X156.694 Y110.842 E.00224
G1 X156.524 Y111.081 F30000
; LINE_WIDTH: 0.129162
G1 F15000
G1 X156.392 Y111.248 E.00149
G1 X154.346 Y118.695 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F15000
G1 X154.654 Y118.691 E.00778
G1 X154.654 Y114.262 E.11151
G1 X154.346 Y114.266 E.00778
G1 X154.346 Y118.635 E.11
G1 X154.002 Y119.064 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G3 X154.998 Y119.028 I.892 J10.729 E.03061
G1 X154.998 Y113.893 E.15778
G3 X154.002 Y113.93 I-.891 J-10.713 E.03061
G1 X154.002 Y119.004 E.15594
G1 X153.625 Y119.521 F30000
G1 F15000
G1 X154.186 Y119.42 E.01752
G1 X154.898 Y119.428 E.02186
G1 X155.375 Y119.516 E.01489
G1 X155.375 Y113.437 E.18678
G1 X154.814 Y113.538 E.01752
G1 X154.102 Y113.53 E.02186
G1 X153.625 Y113.442 E.01489
G1 X153.625 Y119.461 E.18494
G1 X153.248 Y120.045 F30000
G1 F15000
G1 X153.571 Y119.92 E.01064
G1 X154.196 Y119.796 E.01956
G1 X154.832 Y119.799 E.01956
G1 X155.456 Y119.928 E.01956
G1 X155.752 Y120.044 E.00977
G1 X155.752 Y112.912 E.21914
G1 X155.429 Y113.038 E.01064
G1 X154.804 Y113.161 E.01956
G1 X154.168 Y113.158 E.01956
G1 X153.544 Y113.029 E.01956
G1 X153.248 Y112.913 E.00977
G1 X153.248 Y119.985 E.2173
G1 X152.871 Y120.687 F30000
G1 F15000
G1 X153.139 Y120.508 E.00988
G1 X153.655 Y120.287 E.01726
G1 X154.205 Y120.173 E.01726
G1 X154.767 Y120.171 E.01726
G1 X155.318 Y120.279 E.01726
G1 X155.837 Y120.495 E.01726
G1 X156.129 Y120.683 E.01068
G1 X156.129 Y112.271 E.2585
G1 X155.861 Y112.449 E.00988
G1 X155.345 Y112.67 E.01726
G1 X154.795 Y112.784 E.01726
G1 X154.233 Y112.787 E.01726
G1 X153.682 Y112.678 E.01726
G1 X153.163 Y112.463 E.01726
G1 X152.871 Y112.274 E.01068
G1 X152.871 Y120.627 E.25665
G1 X152.494 Y121.237 F30000
G1 F15000
G1 X152.621 Y121.219 E.00392
G1 X152.733 Y121.303 E.00433
G1 X152.896 Y121.133 E.00724
G1 X153.294 Y120.852 E.01496
G1 X153.739 Y120.655 E.01496
G1 X154.215 Y120.55 E.01496
G1 X154.701 Y120.542 E.01496
G1 X155.18 Y120.63 E.01496
G1 X155.632 Y120.812 E.01496
G1 X156.046 Y121.086 E.01525
G1 X156.338 Y121.401 E.01321
G1 X156.441 Y121.324 E.00395
G1 X156.506 Y121.335 E.00203
G1 X156.506 Y111.722 E.29538
G1 X156.387 Y111.748 E.00373
G1 X156.267 Y111.654 E.0047
G1 X156.104 Y111.824 E.00724
G1 X155.706 Y112.106 E.01496
G1 X155.261 Y112.302 E.01496
G1 X154.785 Y112.407 E.01496
G1 X154.299 Y112.415 E.01496
G1 X153.82 Y112.327 E.01496
G1 X153.368 Y112.146 E.01496
G1 X152.954 Y111.872 E.01525
G1 X152.662 Y111.556 E.01321
G1 X152.566 Y111.628 E.00367
G1 X152.494 Y111.614 E.00225
G1 X152.494 Y121.177 E.29386
G1 X152.608 Y121.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973919
G1 F15000
G1 X152.544 Y121.786 E.00044
; LINE_WIDTH: 0.111416
G1 X152.476 Y121.876 E.00063
; LINE_WIDTH: 0.147283
G1 X152.403 Y121.973 E.00103
; LINE_WIDTH: 0.181658
G1 X152.306 Y122.115 E.00195
G1 X152.329 Y122.294 F30000
; LINE_WIDTH: 0.119474
G1 F15000
G3 X152.399 Y121.879 I8.309 J1.202 E.00262
G1 X152.328 Y123.666 F30000
; LINE_WIDTH: 0.129191
G1 F15000
G1 X152.346 Y123.771 E.00075
; LINE_WIDTH: 0.161462
G1 X152.365 Y123.876 E.00103
; LINE_WIDTH: 0.148177
G2 X152.429 Y123.987 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111404
G1 X152.487 Y124.073 E.00058
; LINE_WIDTH: 0.0973912
G1 X152.547 Y124.152 E.00044
; WIPE_START
G1 F24000
G1 X152.487 Y124.073 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.054 J1.216 P1  F30000
G1 X156.392 Y124.248 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.129169
G1 F15000
G1 X156.524 Y124.081 E.00149
; LINE_WIDTH: 0.179238
G1 X156.593 Y123.99 E.00126
; LINE_WIDTH: 0.195637
G1 X156.694 Y123.842 E.00224
G1 X156.671 Y123.664 F30000
; LINE_WIDTH: 0.119469
G1 F15000
G3 X156.601 Y124.078 I-8.312 J-1.203 E.00262
G1 X156.672 Y122.292 F30000
; LINE_WIDTH: 0.0969202
G1 F15000
G1 X156.654 Y122.187 E.00047
; LINE_WIDTH: 0.136069
G1 X156.629 Y122.056 E.00101
; LINE_WIDTH: 0.173115
G1 X156.571 Y121.97 E.0011
; LINE_WIDTH: 0.126786
G1 X156.453 Y121.806 E.00138
M106 S244.8
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X156.571 Y121.97 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/64
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
G3 Z9.2 I-1.068 J-.584 P1  F30000
G1 X156.138 Y122.762 Z9.2
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X156.157 Y122.896 E.00417
G3 X154.294 Y121.331 I-1.657 J.082 E.23641
G1 X154.459 Y121.319 E.00509
G3 X156.108 Y122.569 I.041 J1.659 E.06867
G1 X156.129 Y122.702 E.00414
M204 S10000
; WIPE_START
G1 F24000
G1 X156.157 Y122.896 E-.07438
G1 X156.142 Y123.226 E-.12559
G1 X156.06 Y123.547 E-.12563
G1 X155.917 Y123.844 E-.12564
G1 X155.717 Y124.108 E-.12563
G1 X155.469 Y124.327 E-.12564
G1 X155.338 Y124.402 E-.05749
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.21 J-.128 P1  F30000
G1 X153.665 Y108.544 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X153.67 Y108.541 E.00019
G3 X154.294 Y108.331 I.83 J1.437 E.02035
G1 X154.459 Y108.319 E.00509
G3 X153.531 Y108.631 I.041 J1.659 E.28981
G1 X153.614 Y108.577 E.00306
M204 S10000
; WIPE_START
G1 F24000
G1 X153.67 Y108.541 E-.02509
G1 X153.971 Y108.405 E-.12564
G1 X154.294 Y108.331 E-.12563
G1 X154.459 Y108.319 E-.06289
G1 X154.788 Y108.344 E-.12564
G1 X155.107 Y108.433 E-.12564
G1 X155.401 Y108.584 E-.12563
G1 X155.491 Y108.656 E-.04384
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.071 J-1.215 P1  F30000
G1 X105.212 Y111.612 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G3 X105.294 Y108.331 I.288 J-1.634 E.14492
G1 X105.459 Y108.319 E.00509
G3 X105.271 Y111.621 I.041 J1.659 E.16849
M204 S10000
; WIPE_START
G1 F24000
G1 X104.893 Y111.524 E-.14821
G1 X104.599 Y111.373 E-.12564
G1 X104.341 Y111.167 E-.12563
G1 X104.128 Y110.914 E-.12562
G1 X103.97 Y110.624 E-.12565
G1 X103.891 Y110.386 E-.09528
G1 X103.885 Y110.35 E-.01396
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.195 J.231 P1  F30000
G1 X106.572 Y124.236 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X106.468 Y124.325 E.0042
G3 X105.294 Y121.331 I-.968 J-1.348 E.18558
G1 X105.459 Y121.319 E.00509
G3 X106.716 Y124.107 I.041 J1.659 E.11951
G1 X106.616 Y124.196 E.0041
M204 S10000
; WIPE_START
G1 F24000
G1 X106.468 Y124.325 E-.07477
G1 X106.183 Y124.492 E-.12557
G1 X105.869 Y124.597 E-.12564
G1 X105.541 Y124.638 E-.12562
G1 X105.212 Y124.614 E-.12564
G1 X104.966 Y124.551 E-.0963
G1 X104.759 Y124.457 E-.08646
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.191 J1.202 P1  F30000
G1 X151.591 Y131.893 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X151.71 Y131.511 E.01231
G1 X151.71 Y102.689 E.88562
G1 X157.29 Y102.689 E.17146
G1 X157.29 Y131.453 E.88385
G3 X102.71 Y131.453 I-27.29 J-6.107 E2.32119
G1 X102.71 Y102.689 E.88385
G1 X108.29 Y102.689 E.17146
G1 X108.29 Y131.511 E.88562
G2 X151.368 Y132.608 I21.71 J-6.161 E1.75966
G1 X151.573 Y131.95 E.02116
M204 S10000
; WIPE_START
G1 F24000
G1 X151.71 Y131.511 E-.17501
G1 X151.71 Y129.971 E-.58499
; WIPE_END
M73 P94 R0
G1 E-.04 F1800
G17
G3 Z9.4 I1.192 J.243 P1  F30000
G1 X157.083 Y103.622 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X156.357 Y102.896 E.03155
G1 X155.823 Y102.896
G1 X157.083 Y104.155 E.05472
G1 X157.083 Y104.689
G1 X155.29 Y102.896 E.07789
G1 X154.757 Y102.896
G1 X157.083 Y105.222 E.10107
G1 X157.083 Y105.755
G1 X154.224 Y102.896 E.12424
G1 X153.69 Y102.896
G1 X157.083 Y106.288 E.14741
G1 X157.083 Y106.822
G1 X153.157 Y102.896 E.17059
G1 X152.624 Y102.896
G1 X157.083 Y107.355 E.19376
G1 X157.083 Y107.888
G1 X152.09 Y102.896 E.21693
G1 X151.917 Y103.256
G1 X157.083 Y108.422 E.22445
G1 X157.083 Y108.955
G1 X151.917 Y103.79 E.22445
G1 X151.917 Y104.323
G1 X157.083 Y109.488 E.22445
G1 X156.121 Y109.06
G1 X157.083 Y110.021 E.04177
G1 X157.083 Y110.555
G1 X156.354 Y109.826 E.03166
G1 X156.327 Y110.332
G1 X157.083 Y111.088 E.03283
G1 X157.083 Y111.621
G1 X156.202 Y110.74 E.03828
G1 X156.007 Y111.079
G1 X157.083 Y112.154 E.04674
G1 X157.083 Y112.688
G1 X155.755 Y111.36 E.05769
G1 X155.449 Y111.587
G1 X157.083 Y113.221 E.07101
G1 X157.083 Y113.754
G1 X155.082 Y111.753 E.08695
G1 X154.631 Y111.835
G1 X157.083 Y114.288 E.10655
G1 X157.083 Y114.821
G1 X154.049 Y111.787 E.13182
M204 S10000
; WIPE_START
G1 F24000
G1 X155.463 Y113.202 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J-.01 P1  F30000
G1 X155.422 Y108.361 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X151.917 Y104.856 E.15229
G1 X151.917 Y105.389
G1 X154.644 Y108.116 E.11849
G1 X154.147 Y108.152
G1 X151.917 Y105.923 E.09688
G1 X151.917 Y106.456
G1 X153.742 Y108.281 E.0793
G1 X153.404 Y108.476
G1 X151.917 Y106.989 E.06462
G1 X151.917 Y107.522
G1 X153.123 Y108.729 E.05241
G1 X152.897 Y109.036
G1 X151.917 Y108.056 E.04258
G1 X151.917 Y108.589
G1 X152.731 Y109.403 E.03535
G1 X152.64 Y109.845
G1 X151.917 Y109.122 E.03139
G1 X151.917 Y109.656
G1 X152.692 Y110.431 E.03368
G1 X151.917 Y110.189
G1 X157.083 Y115.354 E.22445
G1 X157.083 Y115.887
G1 X151.917 Y110.722 E.22445
G1 X151.917 Y111.255
G1 X157.083 Y116.421 E.22445
G1 X157.083 Y116.954
G1 X151.917 Y111.789 E.22445
G1 X151.917 Y112.322
G1 X157.083 Y117.487 E.22445
G1 X157.083 Y118.02
G1 X151.917 Y112.855 E.22445
G1 X151.917 Y113.388
G1 X157.083 Y118.554 E.22445
G1 X157.083 Y119.087
G1 X151.917 Y113.922 E.22445
G1 X151.917 Y114.455
G1 X157.083 Y119.62 E.22445
G1 X157.083 Y120.153
G1 X151.917 Y114.988 E.22445
G1 X151.917 Y115.522
G1 X157.083 Y120.687 E.22445
G1 X157.083 Y121.22
G1 X151.917 Y116.055 E.22445
G1 X151.917 Y116.588
G1 X157.083 Y121.753 E.22445
G1 X157.083 Y122.287
G1 X151.917 Y117.121 E.22445
G1 X151.917 Y117.655
G1 X157.083 Y122.82 E.22445
G1 X156.32 Y122.59
G1 X157.083 Y123.353 E.03315
G1 X157.083 Y123.886
G1 X156.353 Y123.157 E.03168
G1 X156.255 Y123.592
G1 X157.083 Y124.42 E.03595
G1 X157.083 Y124.953
G1 X156.083 Y123.954 E.04342
G1 X155.852 Y124.255
G1 X157.083 Y125.486 E.05348
M73 P95 R0
G1 X157.083 Y126.019
G1 X155.566 Y124.503 E.06591
G1 X155.223 Y124.693
G1 X157.083 Y126.553 E.08083
G1 X157.083 Y127.086
G1 X154.811 Y124.815 E.09869
G1 X154.294 Y124.83
G1 X157.083 Y127.619 E.12119
G1 X157.083 Y128.153
G1 X153.449 Y124.519 E.15789
M204 S10000
; WIPE_START
G1 F24000
G1 X154.863 Y125.933 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J.006 P1  F30000
G1 X154.889 Y121.159 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X151.917 Y118.188 E.12912
G1 X151.917 Y118.721
G1 X154.32 Y121.123 E.10438
G1 X153.881 Y121.218
G1 X151.917 Y119.254 E.08533
G1 X151.917 Y119.788
G1 X153.522 Y121.392 E.06972
G1 X153.22 Y121.624
G1 X151.917 Y120.321 E.05662
G1 X151.917 Y120.854
G1 X152.974 Y121.911 E.0459
G1 X152.785 Y122.255
G1 X151.917 Y121.388 E.03769
G1 X151.917 Y121.921
G1 X152.666 Y122.67 E.03254
G1 X152.649 Y123.185
G1 X151.917 Y122.454 E.03177
G1 X151.917 Y122.987
G1 X152.975 Y124.045 E.04595
G1 X151.917 Y123.521
G1 X157.083 Y128.686 E.22445
G1 X157.083 Y129.219
G1 X151.917 Y124.054 E.22445
G1 X151.917 Y124.587
G1 X157.083 Y129.752 E.22445
G1 X157.083 Y130.286
G1 X151.917 Y125.12 E.22445
G1 X151.917 Y125.654
G1 X157.083 Y130.819 E.22445
G1 X157.083 Y131.352
G1 X151.917 Y126.187 E.22445
G1 X151.917 Y126.72
G1 X156.991 Y131.794 E.22049
G1 X156.885 Y132.221
G1 X151.917 Y127.253 E.21588
G1 X151.917 Y127.787
G1 X156.779 Y132.648 E.21127
G1 X156.658 Y133.061
G1 X151.917 Y128.32 E.20601
G1 X151.917 Y128.853
G1 X156.535 Y133.471 E.20064
G1 X156.411 Y133.88
G1 X151.917 Y129.387 E.19528
G1 X151.917 Y129.92
G1 X156.277 Y134.279 E.18943
G1 X156.137 Y134.672
G1 X151.917 Y130.453 E.18335
G1 X151.917 Y130.986
G1 X155.997 Y135.066 E.17727
G1 X155.851 Y135.453
G1 X151.917 Y131.52 E.17091
G1 X151.796 Y131.932
G1 X155.695 Y135.83 E.16942
G1 X155.539 Y136.208
G1 X151.669 Y132.338 E.16817
G1 X151.54 Y132.742
G1 X155.383 Y136.585 E.167
G1 X155.212 Y136.947
G1 X151.396 Y133.132 E.1658
G1 X151.253 Y133.522
G1 X155.041 Y137.31 E.16461
G1 X154.87 Y137.672
G1 X151.103 Y133.905 E.16372
G1 X150.944 Y134.279
G1 X154.69 Y138.025 E.16279
G1 X154.505 Y138.373
G1 X150.785 Y134.653 E.16165
G1 X150.616 Y135.017
G1 X154.319 Y138.721 E.16094
G1 X154.131 Y139.066
G1 X150.442 Y135.377 E.16034
G1 X150.267 Y135.736
G1 X153.932 Y139.4 E.15924
G1 X153.733 Y139.734
G1 X150.081 Y136.083 E.15866
G1 X149.893 Y136.427
G1 X153.533 Y140.068 E.1582
G1 X153.324 Y140.392
G1 X149.704 Y136.772 E.15733
G1 X149.502 Y137.103
G1 X153.111 Y140.712 E.15684
G1 X152.898 Y141.032
G1 X149.299 Y137.433 E.1564
G1 X149.095 Y137.763
G1 X152.683 Y141.351 E.15588
G1 X152.456 Y141.657
G1 X148.879 Y138.08 E.15545
G1 X148.662 Y138.396
G1 X152.229 Y141.964 E.15502
G1 X152.002 Y142.27
G1 X148.444 Y138.712 E.15463
G1 X148.214 Y139.015
G1 X151.768 Y142.569 E.15447
G1 X151.528 Y142.862
G1 X147.983 Y139.317 E.15405
G1 X147.752 Y139.619
G1 X151.288 Y143.156 E.15368
G1 X151.048 Y143.449
G1 X147.508 Y139.908 E.15385
G1 X147.264 Y140.198
G1 X150.795 Y143.729 E.15347
G1 X150.542 Y144.01
G1 X147.019 Y140.486 E.15312
G1 X146.761 Y140.762
G1 X150.289 Y144.29 E.15329
G1 X150.031 Y144.565
G1 X146.504 Y141.038 E.15326
G1 X146.246 Y141.313
G1 X149.765 Y144.832 E.15292
G1 X149.499 Y145.099
G1 X145.975 Y141.576 E.15311
G1 X145.705 Y141.838
G1 X149.232 Y145.366 E.15329
G1 X148.956 Y145.623
G1 X145.433 Y142.1 E.15309
G1 X145.15 Y142.35
G1 X148.677 Y145.877 E.15328
G1 X148.397 Y146.131
G1 X144.866 Y142.599 E.15347
G1 X144.581 Y142.848
G1 X148.116 Y146.383 E.15364
G1 X147.824 Y146.624
G1 X144.284 Y143.084 E.15383
G1 X143.987 Y143.32
G1 X147.531 Y146.864 E.15403
G1 X147.238 Y147.105
G1 X143.688 Y143.555 E.15429
G1 X143.377 Y143.777
G1 X146.939 Y147.339 E.15477
G1 X146.633 Y147.566
G1 X143.067 Y144 E.15498
G1 X142.754 Y144.22
G1 X146.327 Y147.793 E.15527
G1 X146.021 Y148.021
G1 X142.43 Y144.429 E.15607
G1 X142.105 Y144.638
G1 X145.703 Y148.235 E.15632
G1 X145.383 Y148.449
G1 X141.778 Y144.844 E.15666
G1 X141.44 Y145.039
G1 X145.064 Y148.663 E.15749
G1 X144.739 Y148.872
G1 X141.101 Y145.234 E.15808
G1 X140.758 Y145.424
G1 X144.406 Y149.072 E.1585
G1 X144.073 Y149.272
G1 X140.405 Y145.605 E.15936
G1 X140.052 Y145.785
G1 X143.739 Y149.472 E.16021
G1 X143.394 Y149.66
G1 X139.693 Y145.959 E.16082
G1 X139.325 Y146.124
G1 X143.046 Y149.845 E.16171
G1 X142.699 Y150.031
G1 X138.957 Y146.29 E.1626
G1 X138.58 Y146.445
G1 X142.346 Y150.211 E.16366
G1 X141.984 Y150.383
G1 X138.196 Y146.595 E.16459
G1 X137.813 Y146.745
G1 X141.622 Y150.554 E.16552
G1 X141.26 Y150.726
G1 X137.416 Y146.881 E.16707
G1 X137.016 Y147.015
G1 X140.883 Y150.882 E.16805
G1 X140.506 Y151.038
G1 X136.613 Y147.145 E.16917
G1 X136.197 Y147.262
G1 X140.129 Y151.195 E.17089
G1 X139.742 Y151.341
G1 X135.78 Y147.379 E.17215
G1 X135.354 Y147.485
G1 X139.35 Y151.481 E.17364
G1 X138.957 Y151.622
G1 X134.919 Y147.584 E.17546
G1 X134.484 Y147.682
G1 X138.558 Y151.756 E.17702
G1 X138.149 Y151.88
G1 X134.031 Y147.762 E.17896
G1 X133.577 Y147.842
G1 X137.74 Y152.005 E.18089
G1 X137.327 Y152.125
G1 X133.112 Y147.91 E.18319
G1 X132.638 Y147.969
G1 X136.901 Y152.232 E.18526
M73 P96 R0
G1 X136.475 Y152.339
G1 X132.159 Y148.024 E.18753
G1 X131.663 Y148.061
G1 X136.047 Y152.445 E.19049
G1 X135.602 Y152.533
G1 X131.167 Y148.098 E.19273
G1 X130.648 Y148.113
G1 X135.157 Y152.622 E.19594
G1 X134.711 Y152.709
G1 X130.128 Y148.126 E.19915
G1 X129.587 Y148.118
G1 X134.246 Y152.777 E.20245
G1 X133.782 Y152.846
G1 X129.041 Y148.105 E.20603
G1 X128.474 Y148.071
G1 X133.314 Y152.912 E.21034
G1 X132.829 Y152.96
G1 X127.897 Y148.028 E.2143
G1 X127.297 Y147.961
G1 X132.343 Y153.007 E.21929
G1 X131.849 Y153.046
G1 X126.687 Y147.885 E.2243
G1 X126.045 Y147.775
G1 X131.341 Y153.071 E.23014
G1 X130.833 Y153.096
G1 X125.391 Y147.655 E.23646
G1 X124.701 Y147.498
G1 X130.307 Y153.104 E.24362
G1 X129.773 Y153.104
G1 X123.982 Y147.312 E.25167
G1 X123.235 Y147.099
G1 X129.236 Y153.1 E.26077
G1 X128.675 Y153.072
G1 X122.433 Y146.83 E.27125
G1 X121.575 Y146.505
G1 X128.114 Y153.045 E.28416
G1 X127.532 Y152.995
G1 X120.649 Y146.113 E.29908
G1 X119.622 Y145.618
G1 X126.94 Y152.937 E.31802
G1 X126.334 Y152.864
G1 X118.439 Y144.969 E.34306
M204 S10000
; WIPE_START
G1 F24000
G1 X119.853 Y146.383 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.77 J-.943 P1  F30000
G1 X116.945 Y144.008 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X125.707 Y152.771 E.38079
M204 S10000
; WIPE_START
G1 F24000
G1 X124.293 Y151.356 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.152 J-.392 P1  F30000
G1 X108.083 Y103.683 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X107.296 Y102.896 E.03419
G1 X106.763 Y102.896
G1 X108.083 Y104.216 E.05736
G1 X108.083 Y104.75
G1 X106.229 Y102.896 E.08054
G1 X105.696 Y102.896
G1 X108.083 Y105.283 E.10371
G1 X108.083 Y105.816
G1 X105.163 Y102.896 E.12688
G1 X104.629 Y102.896
G1 X108.083 Y106.349 E.15006
G1 X108.083 Y106.883
G1 X104.096 Y102.896 E.17323
G1 X103.563 Y102.896
G1 X108.083 Y107.416 E.1964
G1 X108.083 Y107.949
G1 X103.03 Y102.896 E.21958
G1 X102.917 Y103.317
G1 X108.083 Y108.482 E.22445
G1 X108.083 Y109.016
G1 X102.917 Y103.85 E.22445
G1 X102.917 Y104.384
G1 X108.083 Y109.549 E.22445
G1 X107.178 Y109.178
G1 X108.083 Y110.082 E.03931
G1 X108.083 Y110.615
G1 X107.357 Y109.89 E.03152
G1 X107.319 Y110.385
G1 X108.083 Y111.149 E.03318
G1 X108.083 Y111.682
G1 X107.185 Y110.785 E.03899
G1 X106.982 Y111.115
G1 X108.083 Y112.215 E.04781
G1 X108.083 Y112.749
G1 X106.723 Y111.389 E.05907
G1 X106.409 Y111.608
G1 X108.083 Y113.282 E.07272
G1 X108.083 Y113.815
G1 X106.032 Y111.765 E.08911
G1 X105.571 Y111.837
G1 X108.083 Y114.348 E.10913
G1 X108.083 Y114.882
G1 X104.969 Y111.768 E.13532
M204 S10000
; WIPE_START
G1 F24000
G1 X106.383 Y113.182 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J-.022 P1  F30000
G1 X106.293 Y108.292 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X102.917 Y104.917 E.14668
G1 X102.917 Y105.45
G1 X105.584 Y108.117 E.11587
G1 X105.097 Y108.163
G1 X102.917 Y105.984 E.09473
G1 X102.917 Y106.517
G1 X104.7 Y108.3 E.07747
G1 X104.369 Y108.502
G1 X102.917 Y107.05 E.06308
G1 X102.917 Y107.583
G1 X104.094 Y108.76 E.05114
G1 X103.874 Y109.073
G1 X102.917 Y108.117 E.04158
G1 X102.917 Y108.65
G1 X103.715 Y109.447 E.03465
G1 X103.634 Y109.9
G1 X102.917 Y109.183 E.03116
G1 X102.917 Y109.716
G1 X103.711 Y110.51 E.03447
G1 X102.917 Y110.25
G1 X108.083 Y115.415 E.22445
G1 X108.083 Y115.948
G1 X102.917 Y110.783 E.22445
G1 X102.917 Y111.316
G1 X108.083 Y116.481 E.22445
G1 X108.083 Y117.015
G1 X102.917 Y111.85 E.22445
G1 X102.917 Y112.383
G1 X108.083 Y117.548 E.22445
G1 X108.083 Y118.081
G1 X102.917 Y112.916 E.22445
G1 X102.917 Y113.449
G1 X108.083 Y118.615 E.22445
G1 X108.083 Y119.148
G1 X102.917 Y113.983 E.22445
G1 X102.917 Y114.516
G1 X108.083 Y119.681 E.22445
G1 X108.083 Y120.214
G1 X102.917 Y115.049 E.22445
G1 X102.917 Y115.582
G1 X108.083 Y120.748 E.22445
G1 X108.083 Y121.281
G1 X102.917 Y116.116 E.22445
G1 X102.917 Y116.649
G1 X108.083 Y121.814 E.22445
G1 X108.083 Y122.347
G1 X102.917 Y117.182 E.22445
G1 X102.917 Y117.715
G1 X108.083 Y122.881 E.22445
G1 X107.341 Y122.672
G1 X108.083 Y123.414 E.03224
G1 X108.083 Y123.947
G1 X107.346 Y123.21 E.03203
G1 X107.239 Y123.637
G1 X108.083 Y124.481 E.03665
G1 X108.083 Y125.014
G1 X107.06 Y123.991 E.04443
G1 X106.823 Y124.287
G1 X108.083 Y125.547 E.05475
G1 X108.083 Y126.08
G1 X106.53 Y124.528 E.06745
G1 X106.181 Y124.712
G1 X108.083 Y126.614 E.08265
G1 X108.083 Y127.147
G1 X105.762 Y124.826 E.10084
G1 X105.22 Y124.818
G1 X108.083 Y127.68 E.12439
M204 S10000
; WIPE_START
G1 F24000
G1 X106.668 Y126.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.2 J-.2 P1  F30000
G1 X105.815 Y121.146 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X102.917 Y118.249 E.12591
G1 X102.917 Y118.782
G1 X105.261 Y121.126 E.10186
G1 X104.839 Y121.237
G1 X102.917 Y119.315 E.08351
G1 X102.917 Y119.849
G1 X104.486 Y121.417 E.06818
G1 X104.191 Y121.656
G1 X102.917 Y120.382 E.05535
G1 X102.917 Y120.915
G1 X103.951 Y121.948 E.0449
G1 X103.769 Y122.299
G1 X102.917 Y121.448 E.03698
M73 P97 R0
G1 X102.917 Y121.982
G1 X103.658 Y122.722 E.03219
G1 X103.652 Y123.249
G1 X102.917 Y122.515 E.03191
G1 X102.917 Y123.048
G1 X108.083 Y128.213 E.22445
G1 X108.083 Y128.747
G1 X102.917 Y123.581 E.22445
G1 X102.917 Y124.115
G1 X108.083 Y129.28 E.22445
G1 X108.083 Y129.813
G1 X102.917 Y124.648 E.22445
G1 X102.917 Y125.181
G1 X108.083 Y130.346 E.22445
G1 X108.083 Y130.88
G1 X102.917 Y125.715 E.22445
G1 X102.917 Y126.248
G1 X108.083 Y131.413 E.22445
G1 X108.266 Y132.129
G1 X102.917 Y126.781 E.23241
G1 X102.917 Y127.314
G1 X108.527 Y132.924 E.24379
G1 X108.84 Y133.77
G1 X102.917 Y127.848 E.25737
G1 X102.917 Y128.381
G1 X109.234 Y134.698 E.27449
G1 X109.726 Y135.723
G1 X102.917 Y128.914 E.29589
G1 X102.917 Y129.447
G1 X110.379 Y136.909 E.32426
M204 S10000
; WIPE_START
G1 F24000
G1 X108.965 Y135.495 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.942 J.77 P1  F30000
G1 X111.35 Y138.413 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X102.917 Y129.981 E.36643
G1 X102.917 Y130.514
G1 X125.07 Y152.667 E.96266
G1 X124.405 Y152.534
G1 X102.917 Y131.047 E.93372
G1 X102.968 Y131.631
G1 X123.727 Y152.39 E.90207
G1 X123.015 Y152.211
G1 X103.144 Y132.341 E.86347
G1 X103.346 Y133.076
G1 X122.282 Y152.011 E.82282
G1 X121.516 Y151.779
G1 X103.577 Y133.839 E.77954
G1 X103.856 Y134.652
G1 X120.704 Y151.501 E.73214
G1 X119.861 Y151.191
G1 X104.168 Y135.497 E.68196
G1 X104.542 Y136.405
G1 X118.95 Y150.813 E.6261
G1 X117.96 Y150.356
G1 X105 Y137.396 E.56321
G1 X105.554 Y138.483
G1 X116.873 Y149.802 E.49188
M204 S10000
; WIPE_START
G1 F24000
G1 X115.459 Y148.388 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.182 J.289 P1  F30000
G1 X115.632 Y149.094 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X106.262 Y139.724 E.40717
M204 S10000
; WIPE_START
G1 F24000
G1 X107.676 Y141.138 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.245 J-1.192 P1  F30000
G1 X107.233 Y141.229 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X114.123 Y148.119 E.29938
M204 S10000
; WIPE_START
G1 F24000
G1 X112.709 Y146.704 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.198 J-.215 P1  F30000
G1 X105.784 Y108.05 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.107556
G1 F15000
G1 X105.571 Y108.129 E.0012
; WIPE_START
G1 F24000
G1 X105.784 Y108.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.739 J.967 P1  F30000
G1 X108.047 Y109.78 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.131491
G1 F15000
G1 X108.083 Y109.596 E.00136
G1 X107.431 Y109.816 F30000
; LINE_WIDTH: 0.130395
G1 F15000
G1 X107.327 Y109.611 E.00164
G1 X107.217 Y109.083 F30000
; LINE_WIDTH: 0.199693
G1 F15000
G1 X107.136 Y108.971 E.00177
; LINE_WIDTH: 0.187063
G1 X107.016 Y108.833 E.00214
; LINE_WIDTH: 0.146396
G1 X106.897 Y108.696 E.00154
G2 X106.68 Y108.487 I-20.847 J21.406 E.00254
; LINE_WIDTH: 0.148016
G1 X106.519 Y108.357 E.00177
; LINE_WIDTH: 0.182516
G1 X106.358 Y108.227 E.00235
; WIPE_START
G1 F24000
G1 X106.519 Y108.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.198 J.212 P1  F30000
G1 X112.003 Y139.304 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X111.835 Y139.111 E.00094
; LINE_WIDTH: 0.121656
G1 X111.667 Y138.918 E.00164
; LINE_WIDTH: 0.155612
G1 X111.496 Y138.722 E.00238
; LINE_WIDTH: 0.189209
G1 X111.289 Y138.474 E.00386
; WIPE_START
G1 F24000
G1 X111.496 Y138.722 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.035 J-.639 P1  F30000
G1 X110.756 Y137.524 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X110.61 Y137.34 E.00087
; LINE_WIDTH: 0.134231
G1 X110.464 Y137.155 E.00175
; LINE_WIDTH: 0.180292
G1 X110.319 Y136.97 E.00263
G1 X110.004 Y136.24 F30000
; LINE_WIDTH: 0.0882048
G1 F15000
G1 X109.891 Y136.089 E.0007
; LINE_WIDTH: 0.131539
G1 X109.777 Y135.937 E.00137
; LINE_WIDTH: 0.174874
G1 X109.664 Y135.786 E.00204
; WIPE_START
G1 F24000
G1 X109.777 Y135.937 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.116 J-.485 P1  F30000
G1 X109.019 Y134.19 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X108.939 Y134.071 E.00053
; LINE_WIDTH: 0.129187
G1 X108.858 Y133.952 E.00101
; LINE_WIDTH: 0.170204
G1 X108.778 Y133.833 E.00149
; WIPE_START
G1 F24000
G1 X108.858 Y133.952 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.167 J-.345 P1  F30000
G1 X106.133 Y124.733 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0928583
G1 F15000
G3 X106.012 Y124.81 I-.826 J-1.16 E.00058
G1 X105.148 Y124.889 F30000
; LINE_WIDTH: 0.126638
G1 F15000
G1 X104.901 Y124.747 E.00195
; WIPE_START
G1 F24000
G1 X105.148 Y124.889 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.174 J.319 P1  F30000
G1 X106.145 Y121.225 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.142516
G1 F15000
G1 X105.885 Y121.076 E.00243
; WIPE_START
G1 F24000
G1 X106.145 Y121.225 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.038 J.635 P1  F30000
G1 X107.347 Y123.189 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.151305
G1 F15000
G1 X107.402 Y123.077 E.0011
G1 X107.351 Y122.949 E.00121
G1 X108.059 Y123.123 F30000
; LINE_WIDTH: 0.115883
G1 F15000
G1 X108.082 Y122.955 E.00101
; WIPE_START
G1 F24000
G1 X108.059 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.186 J-.271 P1  F30000
G1 X105.495 Y111.913 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.101355
G1 F15000
G3 X105.322 Y111.832 I.712 J-1.736 E.00091
G1 X104.895 Y111.841 F30000
; LINE_WIDTH: 0.11383
G1 F15000
G3 X104.531 Y111.568 I2.533 J-3.752 E.00263
G1 X103.902 Y110.939 F30000
; LINE_WIDTH: 0.088865
G1 F15000
G1 X103.849 Y110.875 E.00031
; LINE_WIDTH: 0.100002
G1 X103.762 Y110.745 E.00072
; LINE_WIDTH: 0.142427
G1 X103.676 Y110.616 E.00126
G1 X102.946 Y110.011 F30000
; LINE_WIDTH: 0.121975
G1 F15000
G1 X102.918 Y110.188 E.00115
; WIPE_START
G1 F24000
G1 X102.946 Y110.011 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.213 J.094 P1  F30000
G1 X105.061 Y137.334 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.215075
G1 F15000
G1 X104.97 Y137.203 E.00224
; LINE_WIDTH: 0.172773
G1 X104.878 Y137.073 E.00169
; LINE_WIDTH: 0.130471
G1 X104.786 Y136.942 E.00114
; WIPE_START
G1 F24000
G1 X104.878 Y137.073 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.063 J.593 P1  F30000
G1 X106.323 Y139.663 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.225095
G1 F15000
G1 X106.185 Y139.487 E.00332
; LINE_WIDTH: 0.179453
G1 X106.048 Y139.311 E.00249
; LINE_WIDTH: 0.133811
G1 X105.91 Y139.134 E.00166
; WIPE_START
G1 F24000
G1 X106.048 Y139.311 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.011 J.678 P1  F30000
G1 X107.294 Y141.169 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.230075
G1 F15000
G1 X107.118 Y140.953 E.00425
; LINE_WIDTH: 0.182773
G1 X106.941 Y140.738 E.00317
; LINE_WIDTH: 0.135471
G1 X106.764 Y140.522 E.0021
; WIPE_START
G1 F24000
G1 X106.941 Y140.738 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.311 J1.177 P1  F30000
G1 X142.538 Y150.139 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.110378
G1 F15000
G1 X142.479 Y150.129 E.00033
G1 X142.396 Y150.188 E.00056
; WIPE_START
G1 F24000
G1 X142.479 Y150.129 E-.47971
G1 X142.538 Y150.139 E-.28029
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.12 J-1.211 P1  F30000
G1 X122.631 Y152.117 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881701
G1 F15000
G1 X122.34 Y151.953 E.00123
; WIPE_START
G1 F24000
G1 X122.631 Y152.117 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.399 J-1.15 P1  F30000
G1 X119.363 Y150.985 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881706
G1 F15000
G1 X119.246 Y150.907 E.00052
; LINE_WIDTH: 0.128897
G1 X119.129 Y150.828 E.00098
; LINE_WIDTH: 0.169624
G1 X119.012 Y150.75 E.00145
; WIPE_START
G1 F24000
G1 X119.129 Y150.828 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.482 J-1.117 P1  F30000
G1 X117.387 Y150.077 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881704
G1 F15000
G1 X117.236 Y149.965 E.00069
; LINE_WIDTH: 0.132224
G1 X117.085 Y149.853 E.00137
; LINE_WIDTH: 0.176277
G1 X116.934 Y149.741 E.00204
G1 X116.226 Y149.45 F30000
; LINE_WIDTH: 0.0881698
G1 F15000
G1 X116.048 Y149.311 E.00083
; LINE_WIDTH: 0.133883
G1 X115.87 Y149.172 E.00167
; LINE_WIDTH: 0.179596
G1 X115.692 Y149.033 E.00251
M73 P98 R0
G1 X114.836 Y148.594 F30000
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X114.619 Y148.416 E.00104
; LINE_WIDTH: 0.135543
G1 X114.401 Y148.237 E.00213
; LINE_WIDTH: 0.182918
G1 X114.183 Y148.058 E.00321
; WIPE_START
G1 F24000
G1 X114.401 Y148.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.681 J-1.008 P1  F30000
G1 X112.995 Y147.287 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881698
G1 F15000
G1 X112.91 Y147.214 E.00041
; LINE_WIDTH: 0.101239
G1 X112.574 Y146.909 E.00216
; LINE_WIDTH: 0.14542
G1 X112.237 Y146.603 E.0038
; LINE_WIDTH: 0.189601
G1 X111.9 Y146.298 E.00543
; LINE_WIDTH: 0.233783
G1 X111.408 Y145.829 E.01058
; LINE_WIDTH: 0.288268
G3 X109.956 Y144.398 I28.368 J-30.259 E.04076
; LINE_WIDTH: 0.297718
G1 X109.487 Y143.905 E.01412
; LINE_WIDTH: 0.263566
G1 X109.018 Y143.413 E.01223
; LINE_WIDTH: 0.229414
G1 X108.713 Y143.076 E.00691
; LINE_WIDTH: 0.184257
G1 X108.408 Y142.739 E.00524
; LINE_WIDTH: 0.1391
G1 X108.103 Y142.402 E.00356
; LINE_WIDTH: 0.0939438
G1 X108.063 Y142.355 E.00026
; WIPE_START
G1 F24000
G1 X108.103 Y142.402 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.227 J1.196 P1  F30000
G1 X116.884 Y144.068 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.233538
G1 F15000
G1 X116.679 Y143.894 E.00418
; LINE_WIDTH: 0.194764
G1 X116.474 Y143.72 E.00333
; LINE_WIDTH: 0.155725
G1 X116.267 Y143.545 E.00249
; LINE_WIDTH: 0.116958
G1 X116.061 Y143.361 E.00166
; WIPE_START
G1 F24000
G1 X116.267 Y143.545 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.7 J.995 P1  F30000
G1 X118.378 Y145.03 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.223449
G1 F15000
G1 X118.254 Y144.935 E.00229
; LINE_WIDTH: 0.193995
G1 X118.128 Y144.839 E.00195
; LINE_WIDTH: 0.164929
G1 X117.979 Y144.719 E.0019
; LINE_WIDTH: 0.12655
G1 X117.83 Y144.598 E.00131
; WIPE_START
G1 F24000
G1 X117.979 Y144.719 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.632 J1.04 P1  F30000
G1 X119.56 Y145.68 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.218409
G1 F15000
G1 X119.417 Y145.576 E.00252
; LINE_WIDTH: 0.174996
G1 X119.275 Y145.472 E.0019
; LINE_WIDTH: 0.131583
G1 X119.132 Y145.368 E.00128
; WIPE_START
G1 F24000
G1 X119.275 Y145.472 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.206 J1.199 P1  F30000
G1 X133.5 Y147.919 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0946122
G1 F15000
G1 X133.333 Y147.864 E.00074
; WIPE_START
G1 F24000
G1 X133.5 Y147.919 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.96 J.747 P1  F30000
G1 X152.588 Y123.391 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.128599
G1 F15000
G1 X152.659 Y123.175 E.00159
; WIPE_START
G1 F24000
G1 X152.588 Y123.391 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.011 J.677 P1  F30000
G1 X153.386 Y124.582 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.228129
G1 F15000
G3 X152.934 Y124.127 I2.118 J-2.555 E.00969
; WIPE_START
G1 F24000
G1 X153.087 Y124.302 E-.27443
G1 X153.386 Y124.582 E-.48557
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.215 J.064 P1  F30000
G1 X154.06 Y111.777 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.113163
G1 F15000
G1 X153.831 Y111.836 E.00135
; WIPE_START
G1 F24000
G1 X154.06 Y111.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.176 J.312 P1  F30000
G1 X157.057 Y123.061 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.118531
G1 F15000
G1 X157.082 Y122.889 E.00107
G1 X156.431 Y122.968 F30000
; LINE_WIDTH: 0.119013
G1 F15000
G3 X156.353 Y123.135 I-1.683 J-.68 E.00114
G1 X156.358 Y122.464 F30000
; LINE_WIDTH: 0.120615
G1 F15000
G2 X156.207 Y122.237 I-2.322 J1.383 E.00173
; WIPE_START
G1 F24000
G1 X156.358 Y122.464 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.889 J-.831 P1  F30000
G1 X155.238 Y121.265 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.187949
G1 F15000
G1 X155.022 Y121.129 E.00301
G1 X154.88 Y121.167 E.00173
; WIPE_START
G1 F24000
G1 X155.022 Y121.129 E-.27775
G1 X155.238 Y121.265 E-.48225
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.186 J-.273 P1  F30000
G1 X152.835 Y110.814 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X152.745 Y110.681 E.00059
; LINE_WIDTH: 0.129536
G1 X152.656 Y110.548 E.00113
G1 X151.944 Y109.949 F30000
; LINE_WIDTH: 0.119976
G1 F15000
G1 X151.918 Y110.123 E.00111
; WIPE_START
G1 F24000
G1 X151.944 Y109.949 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.276 J1.185 P1  F30000
G1 X156.162 Y108.968 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.198679
G1 F15000
G2 X155.483 Y108.3 I-3.114 J2.488 E.01213
; WIPE_START
G1 F24000
G1 X155.701 Y108.477 E-.22404
G1 X155.906 Y108.674 E-.22565
G1 X156.162 Y108.968 E-.31031
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.179 J.302 P1  F30000
G1 X156.306 Y109.529 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.172758
G1 F15000
G1 X156.394 Y109.693 E.00196
G1 X156.343 Y109.837 E.00162
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X156.394 Y109.693 E-.34374
G1 X156.306 Y109.529 E-.41626
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

