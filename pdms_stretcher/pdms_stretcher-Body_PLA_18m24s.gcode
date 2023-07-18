; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 12m 36s; total estimated time: 18m 24s
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
M73 P24 R13
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
M73 P25 R13
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
    G29 A X99.0621 Y99.0621 I61.8758 J59.1836
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
M73 P28 R13
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
G1 X111.799 Y132.816 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
G1 X109.247 Y132.816 E.09506
G3 X108.85 Y128.75 I27.999 J-4.784 E.15228
G1 X108.85 Y99.609 E1.08538
M73 P29 R13
G1 X108.645 Y99.404 E.0108
G1 X102.355 Y99.404 E.23428
G1 X102.15 Y99.609 E.0108
G1 X102.15 Y128.758 E1.08568
G2 X102.45 Y132.816 I30.812 J-.242 E.15165
M73 P29 R12
G1 X99.291 Y132.816 E.11769
G1 X99.291 Y97.291 E1.32316
G1 X111.799 Y97.291 E.46588
G1 X111.799 Y132.747 E1.32061
G1 X111.388 Y132.404 F30000
G1 F3000
G1 X109.592 Y132.404 E.06688
G3 X109.261 Y128.745 I28.568 J-4.424 E.13694
G1 X109.261 Y99.439 E1.09153
M73 P30 R12
G1 X108.815 Y98.993 E.02349
G1 X102.185 Y98.993 E.24697
G1 X101.739 Y99.439 E.02349
G1 X101.739 Y128.763 E1.09222
G2 X101.984 Y132.404 I30.112 J-.201 E.13601
G1 X99.702 Y132.404 E.08499
G1 X99.702 Y97.702 E1.29252
G1 X111.388 Y97.702 E.43524
G1 X111.388 Y132.404 E1.29252
G1 X110.88 Y131.896 F30000
G1 F3000
G1 X110.012 Y131.896 E.03231
G3 X109.769 Y128.738 I22.943 J-3.353 E.11806
G1 X109.769 Y99.229 E1.09913
G1 X108.751 Y98.21 E.05365
G1 X110.88 Y98.21 E.0793
G1 X110.88 Y131.896 E1.25469
; WIPE_START
G1 F24000
G1 X110.88 Y129.896 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.251 J-1.191 P1  F30000
G1 X101.408 Y131.896 Z.6
G1 Z.2
G1 E.8 F1800
M73 P31 R12
G1 F3000
G1 X100.21 Y131.896 E.04463
G1 X100.21 Y98.21 E1.25469
G1 X102.249 Y98.21 E.07596
G1 X101.231 Y99.229 E.05365
G1 X101.231 Y128.769 E1.10029
G2 X101.408 Y131.896 I33.145 J-.313 E.11669
; WIPE_START
G1 F24000
G1 X101.295 Y129.9 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.06 J1.216 P1  F30000
G1 X160.709 Y132.816 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X157.55 Y132.816 E.11766
G2 X157.85 Y128.759 I-30.676 J-4.306 E.1516
G1 X157.85 Y99.609 E1.08572
G1 X157.645 Y99.404 E.0108
G1 X151.355 Y99.404 E.23428
G1 X151.15 Y99.609 E.0108
G1 X151.15 Y128.75 E1.08538
G3 X150.753 Y132.816 I-28.227 J-.701 E.15228
G1 X148.201 Y132.816 E.09506
G1 X148.201 Y97.291 E1.32316
G1 X160.709 Y97.291 E.46588
G1 X160.709 Y132.747 E1.32061
; WIPE_START
G1 F24000
G1 X160.709 Y130.747 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.165 J-1.206 P1  F30000
G1 X148.612 Y132.404 Z.6
M73 P32 R12
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X148.612 Y97.702 E1.29252
G1 X160.298 Y97.702 E.43524
G1 X160.298 Y132.404 E1.29252
G1 X158.016 Y132.404 E.08498
G2 X158.261 Y128.764 I-30.011 J-3.848 E.13596
G1 X158.261 Y99.439 E1.09226
G1 X157.815 Y98.993 E.02349
G1 X151.185 Y98.993 E.24697
G1 X150.739 Y99.439 E.02349
G1 X150.739 Y128.745 E1.09153
G3 X150.408 Y132.404 I-28.677 J-.745 E.13695
G1 X148.612 Y132.404 E.06688
; WIPE_START
G1 F24000
G1 X150.408 Y132.404 E-.68237
G1 X150.437 Y132.202 E-.07763
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.046 J1.216 P1  F30000
G1 X158.592 Y131.896 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G2 X158.769 Y128.771 I-33.065 J-3.444 E.11665
G1 X158.769 Y99.229 E1.10033
G1 X157.751 Y98.21 E.05365
G1 X159.79 Y98.21 E.07596
G1 X159.79 Y131.896 E1.25469
G1 X158.592 Y131.896 E.04463
; WIPE_START
G1 F24000
G1 X159.79 Y131.896 E-.45528
G1 X159.79 Y131.094 E-.30472
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.041 J-1.216 P1  F30000
G1 X150.13 Y130.769 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X149.989 Y131.896 E.04233
G1 X149.12 Y131.896 E.03234
G1 X149.12 Y98.21 E1.25469
G1 X151.249 Y98.21 E.07929
G1 X150.231 Y99.229 E.05365
G1 X150.231 Y128.738 E1.09913
G3 X150.13 Y130.769 I-20.39 J.004 E.07574
; WIPE_START
G1 F24000
M73 P33 R12
G1 X150.229 Y128.771 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.627 J-1.043 P1  F30000
G1 X103.357 Y100.611 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X107.643 Y100.611 E.15963
G1 X107.643 Y128.765 E1.04861
G2 X152.357 Y128.765 I22.357 J-.017 E2.61476
G1 X152.357 Y100.611 E1.04861
G1 X156.643 Y100.611 E.15963
G1 X156.643 Y128.744 E1.04782
G3 X103.357 Y128.744 I-26.643 J.002 E3.11771
G1 X103.357 Y100.671 E1.04558
G1 X102.9 Y100.154 F30000
; FEATURE: Outer wall
G1 F3000
G1 X108.1 Y100.154 E.19368
G1 X108.1 Y128.759 E1.06543
G2 X151.9 Y128.759 I21.9 J-.012 E2.5617
G1 X151.9 Y100.154 E1.06543
G1 X157.1 Y100.154 E.19368
G1 X157.1 Y128.749 E1.06506
G3 X102.9 Y128.749 I-27.1 J-.004 E3.17077
G1 X102.9 Y100.214 E1.06282
; WIPE_START
G1 F24000
G1 X104.9 Y100.191 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.014 J1.217 P1  F30000
G1 X155.535 Y100.794 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500622
G1 F6300
G1 X156.254 Y101.514 E.03796
G1 X156.254 Y102.161 E.02414
G1 X155.093 Y101 E.06125
G1 X154.446 Y101 E.02414
G1 X156.254 Y102.808 E.09539
G1 X156.254 Y103.456 E.02414
G1 X153.799 Y101 E.12953
G1 X153.151 Y101 E.02414
G1 X156.254 Y104.103 E.16367
G1 X156.254 Y104.75 E.02414
G1 X152.746 Y101.241 E.18508
G1 X152.746 Y101.889 E.02414
G1 X156.254 Y105.398 E.18508
G1 X156.254 Y106.045 E.02414
G1 X152.746 Y102.536 E.18508
G1 X152.746 Y103.183 E.02414
G1 X156.254 Y106.692 E.18508
G1 X156.254 Y107.339 E.02414
G1 X152.746 Y103.831 E.18508
G1 X152.746 Y104.478 E.02414
G1 X156.254 Y107.987 E.18508
G1 X156.254 Y108.634 E.02414
G1 X152.746 Y105.125 E.18508
G1 X152.746 Y105.772 E.02414
G1 X156.254 Y109.281 E.18508
M73 P34 R12
G1 X156.254 Y109.929 E.02414
G1 X152.746 Y106.42 E.18508
G1 X152.746 Y107.067 E.02414
G1 X156.254 Y110.576 E.18508
G1 X156.254 Y111.223 E.02414
G1 X152.746 Y107.714 E.18508
G1 X152.746 Y108.362 E.02414
G1 X156.254 Y111.87 E.18508
G1 X156.254 Y112.518 E.02414
G1 X152.746 Y109.009 E.18508
G1 X152.746 Y109.656 E.02414
G1 X156.254 Y113.165 E.18508
G1 X156.254 Y113.812 E.02414
G1 X152.746 Y110.303 E.18508
G1 X152.746 Y110.951 E.02414
G1 X156.254 Y114.46 E.18508
G1 X156.254 Y115.107 E.02414
G1 X152.746 Y111.598 E.18508
M73 P35 R11
G1 X152.746 Y112.245 E.02414
G1 X156.254 Y115.754 E.18508
G1 X156.254 Y116.401 E.02414
G1 X152.746 Y112.893 E.18508
G1 X152.746 Y113.54 E.02414
G1 X156.254 Y117.049 E.18508
G1 X156.254 Y117.696 E.02414
G1 X152.746 Y114.187 E.18508
G1 X152.746 Y114.834 E.02414
G1 X156.254 Y118.343 E.18508
G1 X156.254 Y118.991 E.02414
G1 X152.746 Y115.482 E.18508
G1 X152.746 Y116.129 E.02414
G1 X156.254 Y119.638 E.18508
G1 X156.254 Y120.285 E.02414
G1 X152.746 Y116.776 E.18508
G1 X152.746 Y117.424 E.02414
G1 X156.254 Y120.932 E.18508
G1 X156.254 Y121.58 E.02414
G1 X152.746 Y118.071 E.18508
G1 X152.746 Y118.718 E.02414
G1 X156.254 Y122.227 E.18508
G1 X156.254 Y122.874 E.02414
G1 X152.746 Y119.365 E.18508
G1 X152.746 Y120.013 E.02414
G1 X156.254 Y123.522 E.18508
G1 X156.254 Y124.169 E.02414
G1 X152.746 Y120.66 E.18508
G1 X152.746 Y121.307 E.02414
G1 X156.254 Y124.816 E.18508
G1 X156.254 Y125.463 E.02414
G1 X152.746 Y121.955 E.18508
G1 X152.746 Y122.602 E.02414
G1 X156.254 Y126.111 E.18508
G1 X156.254 Y126.758 E.02414
G1 X152.746 Y123.249 E.18508
G1 X152.746 Y123.896 E.02414
G1 X156.254 Y127.405 E.18508
G1 X156.254 Y128.053 E.02414
G1 X152.746 Y124.544 E.18508
G1 X152.746 Y125.191 E.02414
G1 X156.254 Y128.7 E.18508
G3 X156.24 Y129.332 I-12.688 J.019 E.0236
G1 X152.746 Y125.838 E.1843
G1 X152.746 Y126.486 E.02414
G1 X156.224 Y129.964 E.18346
G3 X156.183 Y130.571 I-6.099 J-.103 E.02269
G1 X152.746 Y127.133 E.18133
G1 X152.746 Y127.78 E.02414
G1 X156.138 Y131.173 E.17895
G3 X156.075 Y131.757 I-5.882 J-.343 E.02192
G1 X152.746 Y128.428 E.17561
G3 X152.738 Y129.067 I-12.832 J.171 E.02387
G1 X156.003 Y132.332 E.1722
G3 X155.92 Y132.897 I-5.7 J-.544 E.0213
G1 X152.722 Y129.699 E.16868
G3 X152.686 Y130.31 I-6.14 J-.058 E.02284
G1 X155.823 Y133.447 E.16547
G3 X155.724 Y133.995 I-5.6 J-.732 E.02078
G1 X152.641 Y130.912 E.16261
G3 X152.574 Y131.492 I-5.844 J-.384 E.02179
G1 X155.604 Y134.522 E.15983
G1 X155.484 Y135.05 E.02017
G1 X152.502 Y132.067 E.1573
G3 X152.408 Y132.621 I-5.593 J-.662 E.02095
G1 X155.349 Y135.562 E.15515
G1 X155.207 Y136.068 E.01957
G1 X152.311 Y133.171 E.15277
G3 X152.194 Y133.702 I-5.375 J-.901 E.02028
G1 X155.062 Y136.569 E.15125
G1 X154.899 Y137.054 E.01906
G1 X152.074 Y134.229 E.14901
G3 X151.938 Y134.74 I-5.186 J-1.111 E.01973
G1 X154.736 Y137.538 E.14761
G3 X154.562 Y138.011 I-4.823 J-1.512 E.0188
G1 X151.796 Y135.245 E.14591
G3 X151.642 Y135.738 I-5.018 J-1.296 E.01928
G1 X154.379 Y138.476 E.14441
G1 X154.197 Y138.941 E.01862
G1 X151.479 Y136.223 E.14337
G3 X151.309 Y136.7 I-4.868 J-1.463 E.01891
G1 X153.996 Y139.387 E.14174
G1 X153.795 Y139.833 E.01825
G1 X151.127 Y137.165 E.14075
G3 X150.942 Y137.628 I-4.735 J-1.614 E.0186
G1 X153.588 Y140.274 E.13955
G1 X153.369 Y140.702 E.01793
G1 X150.741 Y138.074 E.1386
G1 X150.54 Y138.52 E.01825
G1 X153.149 Y141.13 E.13764
G3 X152.92 Y141.548 I-4.3 J-2.09 E.01779
G1 X150.324 Y138.952 E.1369
G1 X150.105 Y139.38 E.01794
G1 X152.683 Y141.958 E.13596
G1 X152.446 Y142.368 E.01767
G1 X149.879 Y139.801 E.13541
G1 X149.642 Y140.211 E.01767
G1 X152.195 Y142.765 E.13468
G1 X151.941 Y143.158 E.01746
G1 X149.405 Y140.621 E.13379
G1 X149.151 Y141.015 E.01746
G1 X151.687 Y143.551 E.13378
G1 X151.416 Y143.928 E.0173
G1 X148.897 Y141.408 E.13289
M73 P36 R11
G3 X148.633 Y141.791 I-3.972 J-2.452 E.01737
G1 X151.145 Y144.304 E.13254
G3 X150.871 Y144.677 I-3.876 J-2.557 E.01728
G1 X148.362 Y142.168 E.13236
G3 X148.089 Y142.542 I-3.884 J-2.549 E.01728
G1 X150.584 Y145.038 E.13163
G1 X150.297 Y145.398 E.01718
G1 X147.802 Y142.902 E.13163
G1 X147.514 Y143.262 E.01718
G1 X150.004 Y145.752 E.13132
G1 X149.701 Y146.096 E.0171
G1 X147.216 Y143.611 E.13105
G1 X146.913 Y143.955 E.0171
G1 X149.397 Y146.44 E.13105
G3 X149.086 Y146.775 I-3.52 J-2.954 E.01709
G1 X146.606 Y144.295 E.13081
G1 X146.286 Y144.623 E.01707
G1 X148.766 Y147.103 E.13081
G1 X148.446 Y147.431 E.01707
G1 X145.967 Y144.951 E.13081
G3 X145.635 Y145.267 I-3.33 J-3.163 E.01708
G1 X148.117 Y147.748 E.13089
G1 X147.781 Y148.06 E.01708
G1 X145.299 Y145.578 E.13089
G3 X144.959 Y145.885 I-3.249 J-3.252 E.0171
G1 X147.445 Y148.371 E.13111
G3 X147.097 Y148.67 I-3.169 J-3.342 E.01713
G1 X144.607 Y146.181 E.1313
G1 X144.255 Y146.476 E.01714
G1 X146.745 Y148.965 E.1313
G1 X146.393 Y149.261 E.01714
G1 X143.89 Y146.759 E.13198
G1 X143.522 Y147.037 E.01723
G1 X146.025 Y149.541 E.13204
G1 X145.657 Y149.82 E.01723
G1 X143.148 Y147.311 E.13233
G1 X142.763 Y147.573 E.01737
G1 X145.287 Y150.097 E.13312
G1 X144.902 Y150.36 E.01737
G1 X142.379 Y147.836 E.13312
G3 X141.978 Y148.083 I-2.677 J-3.885 E.01755
G1 X144.517 Y150.622 E.13392
G3 X144.128 Y150.879 I-2.774 J-3.775 E.01743
G1 X141.577 Y148.328 E.13456
G3 X141.166 Y148.565 I-2.579 J-3.991 E.01768
G1 X143.726 Y151.125 E.13501
G1 X143.324 Y151.37 E.01756
G1 X140.747 Y148.794 E.13592
G3 X140.326 Y149.02 I-2.477 J-4.108 E.01784
G1 X142.914 Y151.607 E.13648
G1 X142.494 Y151.835 E.0178
G1 X139.889 Y149.23 E.13742
G1 X139.452 Y149.441 E.01809
G1 X142.075 Y152.064 E.13836
G3 X141.643 Y152.278 I-2.366 J-4.227 E.01802
G1 X139.001 Y149.636 E.13935
G1 X138.546 Y149.828 E.01843
G1 X141.206 Y152.489 E.14031
G3 X140.768 Y152.698 I-2.315 J-4.285 E.01811
G1 X138.081 Y150.011 E.1417
G1 X137.607 Y150.184 E.01884
G1 X140.312 Y152.89 E.14272
G1 X139.857 Y153.082 E.01843
G1 X137.127 Y150.352 E.14398
G1 X136.633 Y150.504 E.01931
G1 X139.394 Y153.266 E.14563
G1 X138.919 Y153.438 E.01884
G1 X136.137 Y150.656 E.14675
G1 X135.621 Y150.787 E.01986
G1 X138.444 Y153.611 E.14893
G3 X137.953 Y153.767 I-1.81 J-4.843 E.01923
G1 X135.105 Y150.919 E.15023
G3 X134.569 Y151.03 I-1.378 J-5.321 E.02044
G1 X137.459 Y153.92 E.15244
G3 X136.958 Y154.066 I-1.716 J-4.946 E.01947
G1 X134.03 Y151.138 E.15442
G3 X133.471 Y151.227 I-1.165 J-5.555 E.02111
G1 X136.442 Y154.197 E.15668
G1 X135.926 Y154.329 E.01986
G1 X132.909 Y151.312 E.15914
G3 X132.324 Y151.374 I-.919 J-5.826 E.02194
G1 X135.391 Y154.441 E.16177
G1 X134.853 Y154.55 E.02049
G1 X131.736 Y151.433 E.16441
G3 X131.12 Y151.465 I-.634 J-6.213 E.02298
G1 X134.303 Y154.648 E.16788
G1 X133.741 Y154.733 E.02122
G1 X130.501 Y151.493 E.17088
G1 X129.854 Y151.493 E.02414
G1 X133.174 Y154.814 E.17514
G1 X132.586 Y154.872 E.02206
G1 X129.195 Y151.481 E.17887
G1 X128.513 Y151.447 E.02544
G1 X131.997 Y154.931 E.18377
G3 X131.383 Y154.964 I-.633 J-6.142 E.02297
G1 X127.806 Y151.387 E.18865
G3 X127.082 Y151.31 I.41 J-7.294 E.02718
G1 X130.766 Y154.995 E.19434
G3 X130.124 Y155 I-.377 J-6.426 E.02395
G1 X126.319 Y151.195 E.20069
G3 X125.525 Y151.049 I1.072 J-8.028 E.03012
G1 X129.477 Y155 E.20843
G3 X128.803 Y154.973 I-.066 J-6.77 E.02518
G1 X124.698 Y150.869 E.21648
G3 X123.829 Y150.647 I1.79 J-8.827 E.03347
G1 X128.121 Y154.939 E.22639
G3 X127.407 Y154.872 I.317 J-7.192 E.02678
G1 X122.893 Y150.358 E.23807
G3 X121.888 Y150 I3.087 J-10.254 E.03984
G1 X126.685 Y154.797 E.25303
G1 X125.922 Y154.682 E.02875
G1 X120.788 Y149.548 E.27081
G1 X119.547 Y148.954 E.05132
G1 X125.142 Y154.549 E.29512
G1 X124.331 Y154.385 E.03087
G1 X117.342 Y147.396 E.36862
; WIPE_START
G1 F24000
G1 X118.757 Y148.811 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.184 J-.281 P1  F30000
G1 X107.46 Y101.266 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X107.194 Y101 E.01404
G1 X106.547 Y101 E.02414
M73 P37 R11
G1 X107.254 Y101.708 E.03734
G1 X107.254 Y102.355 E.02414
G1 X105.899 Y101 E.07148
G1 X105.252 Y101 E.02414
G1 X107.254 Y103.002 E.10562
G1 X107.254 Y103.65 E.02414
G1 X104.605 Y101 E.13976
G1 X103.957 Y101 E.02414
G1 X107.254 Y104.297 E.1739
G1 X107.254 Y104.944 E.02414
G1 X103.746 Y101.435 E.18508
G1 X103.746 Y102.083 E.02414
G1 X107.254 Y105.591 E.18508
G1 X107.254 Y106.239 E.02414
G1 X103.746 Y102.73 E.18508
G1 X103.746 Y103.377 E.02414
G1 X107.254 Y106.886 E.18508
G1 X107.254 Y107.533 E.02414
G1 X103.746 Y104.024 E.18508
G1 X103.746 Y104.672 E.02414
G1 X107.254 Y108.181 E.18508
G1 X107.254 Y108.828 E.02414
G1 X103.746 Y105.319 E.18508
G1 X103.746 Y105.966 E.02414
G1 X107.254 Y109.475 E.18508
G1 X107.254 Y110.122 E.02414
G1 X103.746 Y106.614 E.18508
G1 X103.746 Y107.261 E.02414
G1 X107.254 Y110.77 E.18508
G1 X107.254 Y111.417 E.02414
G1 X103.746 Y107.908 E.18508
G1 X103.746 Y108.555 E.02414
G1 X107.254 Y112.064 E.18508
G1 X107.254 Y112.712 E.02414
G1 X103.746 Y109.203 E.18508
G1 X103.746 Y109.85 E.02414
G1 X107.254 Y113.359 E.18508
G1 X107.254 Y114.006 E.02414
G1 X103.746 Y110.497 E.18508
G1 X103.746 Y111.145 E.02414
G1 X107.254 Y114.653 E.18508
G1 X107.254 Y115.301 E.02414
G1 X103.746 Y111.792 E.18508
G1 X103.746 Y112.439 E.02414
G1 X107.254 Y115.948 E.18508
G1 X107.254 Y116.595 E.02414
G1 X103.746 Y113.086 E.18508
G1 X103.746 Y113.734 E.02414
G1 X107.254 Y117.243 E.18508
G1 X107.254 Y117.89 E.02414
G1 X103.746 Y114.381 E.18508
G1 X103.746 Y115.028 E.02414
G1 X107.254 Y118.537 E.18508
G1 X107.254 Y119.184 E.02414
G1 X103.746 Y115.676 E.18508
G1 X103.746 Y116.323 E.02414
G1 X107.254 Y119.832 E.18508
G1 X107.254 Y120.479 E.02414
G1 X103.746 Y116.97 E.18508
G1 X103.746 Y117.618 E.02414
G1 X107.254 Y121.126 E.18508
G1 X107.254 Y121.774 E.02414
G1 X103.746 Y118.265 E.18508
G1 X103.746 Y118.912 E.02414
G1 X107.254 Y122.421 E.18508
G1 X107.254 Y123.068 E.02414
G1 X103.746 Y119.559 E.18508
G1 X103.746 Y120.207 E.02414
G1 X107.254 Y123.715 E.18508
G1 X107.254 Y124.363 E.02414
G1 X103.746 Y120.854 E.18508
G1 X103.746 Y121.501 E.02414
G1 X107.254 Y125.01 E.18508
G1 X107.254 Y125.657 E.02414
G1 X103.746 Y122.149 E.18508
G1 X103.746 Y122.796 E.02414
G1 X107.254 Y126.305 E.18508
G1 X107.254 Y126.952 E.02414
G1 X103.746 Y123.443 E.18508
G1 X103.746 Y124.09 E.02414
G1 X107.254 Y127.599 E.18508
G1 X107.254 Y128.247 E.02414
G1 X103.746 Y124.738 E.18508
G1 X103.746 Y125.385 E.02414
G1 X107.258 Y128.897 E.18524
G1 X107.274 Y129.561 E.02477
G1 X103.746 Y126.032 E.18612
G1 X103.746 Y126.68 E.02414
G1 X107.309 Y130.243 E.18795
G1 X107.361 Y130.943 E.02617
G1 X103.746 Y127.327 E.19072
G1 X103.746 Y127.974 E.02414
G1 X107.45 Y131.679 E.1954
G2 X107.559 Y132.435 I7.719 J-.729 E.02852
G1 X103.746 Y128.621 E.20116
G2 X103.759 Y129.282 I13.256 J.059 E.02466
G1 X107.698 Y133.221 E.20775
G2 X107.887 Y134.057 I8.473 J-1.473 E.03198
G1 X103.776 Y129.946 E.21684
G2 X103.822 Y130.64 I6.972 J-.115 E.02593
G1 X108.117 Y134.935 E.22656
G2 X108.402 Y135.867 I9.476 J-2.383 E.03635
G1 X103.874 Y131.339 E.2388
G2 X103.966 Y132.078 I7.37 J-.538 E.02778
G1 X108.758 Y136.87 E.25275
G2 X109.213 Y137.972 I11.273 J-4.009 E.0445
G1 X104.067 Y132.827 E.2714
M73 P38 R11
G1 X104.206 Y133.613 E.02976
G1 X109.813 Y139.219 E.29572
G2 X110.646 Y140.701 I24.829 J-13.004 E.06341
G1 X104.374 Y134.428 E.33083
G2 X104.568 Y135.27 I8.527 J-1.523 E.03221
G1 X123.475 Y154.176 E.99723
G3 X122.584 Y153.933 I1.991 J-9.044 E.03444
G1 X104.822 Y136.17 E.9369
G2 X105.123 Y137.119 I9.554 J-2.514 E.03715
G1 X121.648 Y153.644 E.87162
G1 X120.631 Y153.275 E.04035
G1 X105.484 Y138.127 E.79898
G2 X105.927 Y139.218 I11.153 J-3.901 E.04395
G1 X119.535 Y152.825 E.71772
G3 X118.324 Y152.262 I5.033 J-12.405 E.04979
G1 X106.491 Y140.429 E.62414
G2 X107.241 Y141.826 I14.367 J-6.809 E.05914
G1 X116.945 Y151.53 E.51185
G1 X116.873 Y151.491 E.00306
G3 X115.19 Y150.422 I9.863 J-17.395 E.07438
G1 X108.308 Y143.544 E.36292
G2 X111.65 Y147.53 I21.659 J-14.766 E.19436
G1 X113.746 Y149.626 E.11053
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X112.332 Y148.211 E-.76
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
G3 Z.6 I1.195 J-.23 P1  F30000
G1 X103.102 Y100.356 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30237
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J-.001 E2.80303
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.63401
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.609 J1.053 P1  F30000
G1 X154.346 Y128.717 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351354
G1 F15000
G3 X105.654 Y128.717 I-24.346 J.03 E1.92382
G1 X105.654 Y102.6 E.65641
G1 X105.346 Y102.6 E.00777
G1 X105.346 Y128.719 E.65646
G2 X154.654 Y128.717 I24.654 J.026 E1.94805
G1 X154.654 Y102.6 E.65641
G1 X154.346 Y102.6 E.00777
G1 X154.346 Y128.657 E.6549
; WIPE_START
G1 F24000
G1 X154.346 Y126.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.053 J-1.216 P1  F30000
G1 X107.506 Y128.717 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.419999
G1 F15000
G1 X107.506 Y100.748 E.85939
G1 X103.494 Y100.748 E.12327
G1 X103.494 Y128.742 E.86016
G2 X156.506 Y128.742 I26.506 J.006 E2.55905
G1 X156.506 Y100.748 E.86016
G1 X152.494 Y100.748 E.12327
G1 X152.494 Y128.769 E.86099
G3 X107.506 Y128.777 I-22.494 J-.021 E2.16985
G1 X107.129 Y128.717 F30000
G1 F15000
G1 X107.129 Y101.126 E.8478
G1 X103.871 Y101.126 E.10009
G1 X103.871 Y128.737 E.84843
G2 X156.129 Y128.737 I26.129 J.013 E2.52304
G1 X156.129 Y101.126 E.84843
G1 X152.871 Y101.126 E.10009
G1 X152.871 Y128.764 E.84926
G3 X107.129 Y128.777 I-22.871 J-.017 E2.2064
G1 X106.752 Y128.717 F30000
G1 F15000
G1 X106.752 Y101.503 E.83622
G1 X104.248 Y101.503 E.07692
M73 P39 R11
G1 X104.248 Y128.732 E.8367
G2 X155.752 Y128.732 I25.752 J.016 E2.48685
G1 X155.752 Y101.503 E.8367
G1 X153.248 Y101.503 E.07692
G1 X153.248 Y128.764 E.83767
G3 X106.752 Y128.777 I-23.248 J-.017 E2.2428
G1 X106.375 Y128.717 F30000
G1 F15000
G1 X106.375 Y101.88 E.82463
G1 X104.625 Y101.88 E.05375
G1 X104.625 Y128.728 E.82496
G2 X155.375 Y128.728 I25.375 J.02 E2.45069
G1 X155.375 Y101.88 E.82496
G1 X153.625 Y101.88 E.05375
G1 X153.625 Y128.764 E.82609
G3 X106.375 Y128.777 I-23.625 J-.017 E2.2792
G1 X105.998 Y128.717 F30000
G1 F15000
G1 X105.998 Y102.257 E.81304
G1 X105.002 Y102.257 E.03058
G1 X105.002 Y128.723 E.81323
G2 X154.998 Y128.723 I24.998 J.026 E2.41466
G1 X154.998 Y102.257 E.81323
G1 X154.002 Y102.257 E.03058
G1 X154.002 Y128.764 E.8145
G3 X105.998 Y128.777 I-24.002 J-.017 E2.3156
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 0.457143
; LAYER_HEIGHT: 0.0571429
; WIPE_START
G1 F24000
G1 X106.03 Y129.993 E-.46229
G1 X106.09 Y130.774 E-.29771
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
G3 Z.8 I-.041 J1.216 P1  F30000
G1 X109.147 Y130.877 Z.8
G1 Z.457
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.86 Y130.877 E.02725
G1 X109.86 Y128 E.10997
G1 X109.039 Y128 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y122.246 E.10997
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y113.615 E.10997
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y102.106 E.10997
G1 X109.86 Y102.106 E.03141
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.857 I.123 J-1.211 P1  F30000
G1 X101.229 Y99.229 Z.857
G1 Z.457
G1 E.8 F1800
G1 F9000
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y102.106 E.09842
G1 X101.229 Y102.106 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y107.86 E.10997
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.961 Y128.758 E.02896
G2 X102.05 Y130.877 I41.86 J-.697 E.08109
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.001 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.857 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z.857
G1 Z.457
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.02726
G2 X150.961 Y128 I-61.906 J-3.782 E.11006
G1 X150.14 Y128 E.03141
G1 X150.14 Y125.123 E.10997
G1 X150.961 Y125.123 E.03141
G1 X150.961 Y122.246 E.10997
G1 X150.14 Y122.246 E.03141
G1 X150.14 Y119.369 E.10997
G1 X150.961 Y119.369 E.03141
G1 X150.961 Y116.492 E.10997
G1 X150.14 Y116.492 E.03141
G1 X150.14 Y113.615 E.10997
G1 X150.961 Y113.615 E.03141
G1 X150.961 Y110.738 E.10997
G1 X150.14 Y110.738 E.03141
G1 X150.14 Y107.86 E.10997
G1 X150.961 Y107.86 E.03141
G1 X150.961 Y104.983 E.10997
G1 X150.14 Y104.983 E.03141
G1 X150.14 Y102.106 E.10997
G1 X150.961 Y102.106 E.03141
G1 X150.961 Y99.531 E.09842
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.857 I.134 J1.21 P1  F30000
G1 X157.737 Y99.229 Z.857
G1 Z.457
G1 E.8 F1800
G1 F9000
G1 X158.771 Y99.229 E.03953
G1 X158.771 Y102.106 E.10997
G1 X158.039 Y102.106 E.02799
G1 X158.039 Y104.983 E.10997
G1 X158.771 Y104.983 E.02799
G1 X158.771 Y107.86 E.10997
G1 X158.039 Y107.86 E.02799
G1 X158.039 Y110.738 E.10997
G1 X158.771 Y110.738 E.02799
G1 X158.771 Y113.615 E.10997
G1 X158.039 Y113.615 E.02799
G1 X158.039 Y116.492 E.10997
G1 X158.771 Y116.492 E.02799
G1 X158.771 Y119.369 E.10997
G1 X158.039 Y119.369 E.02799
G1 X158.039 Y122.246 E.10997
G1 X158.771 Y122.246 E.02799
G1 X158.771 Y125.123 E.10997
G1 X158.039 Y125.123 E.02799
G1 X158.039 Y128 E.10997
M73 P40 R11
G1 X158.771 Y128 E.02799
G1 X158.771 Y130.877 E.10997
G1 X157.95 Y130.877 E.03139
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.142857
; WIPE_START
G1 F24000
G1 X158.771 Y130.877 E-.3121
G1 X158.771 Y129.698 E-.4479
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
G3 Z.857 I.567 J-1.077 P1  F30000
G1 X103.102 Y100.356 Z.857
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30237
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J.003 E2.80328
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.003 E2.09551
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.63401
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.211 J.118 P1  F30000
G1 X107.506 Y128.717 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X107.506 Y100.748 E.85939
G1 X103.494 Y100.748 E.12327
G1 X103.494 Y128.742 E.86016
G2 X156.506 Y128.742 I26.506 J.004 E2.55891
G1 X156.506 Y100.748 E.86016
G1 X152.494 Y100.748 E.12327
G1 X152.494 Y128.769 E.86099
G3 X107.506 Y128.777 I-22.494 J-.021 E2.16985
G1 X107.129 Y128.717 F30000
G1 F15000
G1 X107.129 Y101.126 E.8478
G1 X103.871 Y101.126 E.10009
G1 X103.871 Y128.737 E.84843
G2 X156.129 Y128.737 I26.129 J.009 E2.5228
G1 X156.129 Y101.126 E.84843
G1 X152.871 Y101.126 E.10009
G1 X152.871 Y128.764 E.84926
G3 X107.129 Y128.777 I-22.871 J-.017 E2.2064
G1 X106.752 Y128.717 F30000
G1 F15000
G1 X106.752 Y101.503 E.83622
G1 X104.248 Y101.503 E.07692
G1 X104.248 Y128.732 E.8367
G2 X155.752 Y128.732 I25.752 J.013 E2.48669
G1 X155.752 Y101.503 E.8367
G1 X153.248 Y101.503 E.07692
G1 X153.248 Y128.764 E.83767
G3 X106.752 Y128.777 I-23.248 J-.017 E2.2428
G1 X106.375 Y128.717 F30000
G1 F15000
G1 X106.375 Y101.88 E.82463
G1 X104.625 Y101.88 E.05375
G1 X104.625 Y128.728 E.82496
G2 X155.375 Y128.728 I25.375 J.018 E2.45057
G1 X155.375 Y101.88 E.82496
G1 X153.625 Y101.88 E.05375
G1 X153.625 Y128.764 E.82609
G3 X106.375 Y128.777 I-23.625 J-.017 E2.2792
G1 X105.998 Y128.717 F30000
M73 P40 R10
G1 F15000
G1 X105.998 Y102.257 E.81304
G1 X105.002 Y102.257 E.03058
G1 X105.002 Y128.723 E.81323
G2 X154.998 Y128.723 I24.998 J.023 E2.41446
G1 X154.998 Y102.257 E.81323
G1 X154.002 Y102.257 E.03058
G1 X154.002 Y128.764 E.8145
G3 X105.998 Y128.777 I-24.002 J-.017 E2.3156
G1 X105.654 Y128.717 F30000
; LINE_WIDTH: 0.351367
G1 F15000
G1 X105.654 Y102.6 E.65644
G1 X105.346 Y102.6 E.00777
G1 X105.346 Y128.719 E.65649
G2 X154.654 Y128.717 I24.654 J.027 E1.94821
G1 X154.654 Y102.6 E.65644
G1 X154.346 Y102.6 E.00777
G1 X154.346 Y128.717 E.65644
G3 X105.655 Y128.777 I-24.345 J.031 E1.92238
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 0.714286
; LAYER_HEIGHT: 0.114286
; WIPE_START
G1 F24000
G1 X105.683 Y129.917 E-.4334
G1 X105.746 Y130.774 E-.3266
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
G3 Z1 I-.037 J1.216 P1  F30000
G1 X109.147 Y130.877 Z1
G1 Z.714
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.86 Y130.877 E.02726
G1 X109.86 Y128 E.10997
G1 X109.039 Y128 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y122.246 E.10997
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y113.615 E.10997
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y102.106 E.10997
G1 X109.86 Y102.106 E.03141
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.114 I.123 J-1.211 P1  F30000
G1 X101.229 Y99.229 Z1.114
G1 Z.714
G1 E.8 F1800
G1 F9000
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y102.106 E.09842
G1 X101.229 Y102.106 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y107.86 E.10997
M73 P41 R10
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.961 Y128.758 E.02896
G2 X102.05 Y130.877 I41.86 J-.697 E.08109
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.001 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.114 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z1.114
G1 Z.714
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.02726
G2 X150.961 Y128 I-61.906 J-3.782 E.11006
G1 X150.14 Y128 E.03141
G1 X150.14 Y125.123 E.10997
G1 X150.961 Y125.123 E.03141
G1 X150.961 Y122.246 E.10997
G1 X150.14 Y122.246 E.03141
G1 X150.14 Y119.369 E.10997
G1 X150.961 Y119.369 E.03141
G1 X150.961 Y116.492 E.10997
G1 X150.14 Y116.492 E.03141
G1 X150.14 Y113.615 E.10997
G1 X150.961 Y113.615 E.03141
G1 X150.961 Y110.738 E.10997
G1 X150.14 Y110.738 E.03141
G1 X150.14 Y107.86 E.10997
G1 X150.961 Y107.86 E.03141
G1 X150.961 Y104.983 E.10997
G1 X150.14 Y104.983 E.03141
G1 X150.14 Y102.106 E.10997
G1 X150.961 Y102.106 E.03141
G1 X150.961 Y99.531 E.09842
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.114 I.134 J1.21 P1  F30000
G1 X157.737 Y99.229 Z1.114
G1 Z.714
G1 E.8 F1800
G1 F9000
G1 X158.771 Y99.229 E.03953
G1 X158.771 Y102.106 E.10997
G1 X158.039 Y102.106 E.02799
G1 X158.039 Y104.983 E.10997
G1 X158.771 Y104.983 E.02799
G1 X158.771 Y107.86 E.10997
G1 X158.039 Y107.86 E.02799
G1 X158.039 Y110.738 E.10997
G1 X158.771 Y110.738 E.02799
G1 X158.771 Y113.615 E.10997
G1 X158.039 Y113.615 E.02799
G1 X158.039 Y116.492 E.10997
G1 X158.771 Y116.492 E.02799
G1 X158.771 Y119.369 E.10997
G1 X158.039 Y119.369 E.02799
G1 X158.039 Y122.246 E.10997
G1 X158.771 Y122.246 E.02799
G1 X158.771 Y125.123 E.10997
G1 X158.039 Y125.123 E.02799
G1 X158.039 Y128 E.10997
G1 X158.771 Y128 E.02799
G1 X158.771 Y130.877 E.10997
G1 X157.95 Y130.877 E.03139
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.0857143
; WIPE_START
G1 F24000
G1 X158.771 Y130.877 E-.3121
G1 X158.771 Y129.698 E-.4479
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
G3 Z1.114 I.567 J-1.077 P1  F30000
G1 X103.102 Y100.356 Z1.114
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9120
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30237
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J.003 E2.80331
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9120
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.634
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.217 J.033 P1  F30000
G1 X104.74 Y101.112 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9120
G1 X103.857 Y101.112 E.02928
G1 X103.857 Y101.857 E.02474
G1 X107.143 Y105.143 E.15411
G1 X107.143 Y104.802 E.01131
G1 X103.857 Y108.087 E.15411
G1 X103.857 Y109.533 E.04799
G1 X107.143 Y112.819 E.15411
G1 X107.143 Y112.478 E.01131
G1 X103.857 Y115.763 E.15411
G1 X103.857 Y117.209 E.04799
G1 X107.143 Y120.495 E.15411
G1 X107.143 Y120.154 E.01131
G1 X103.857 Y123.439 E.15411
G1 X103.857 Y124.885 E.04799
G1 X107.143 Y128.17 E.15411
G1 X107.143 Y127.83 E.01131
G1 X105.381 Y129.591 E.08265
G1 X103.879 Y129.591 E.04982
G1 X103.876 Y129.465 E.00419
G1 X107.55 Y128.706 F30000
G1 F9120
G1 X107.55 Y100.705 E.92886
G1 X103.45 Y100.705 E.13598
G1 X103.482 Y129.998 E.97173
G1 X107.58 Y129.998 E.13596
G1 X107.55 Y128.766 E.04089
G1 X106.195 Y130.406 F30000
G1 F9120
G1 X104.567 Y130.406 E.05401
G1 X103.582 Y131.39 E.04619
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.117 J-14.478 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.995 Y137.653 I27.378 J-16.417 E.19093
G1 X108.268 Y134.38 E.15355
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F9120
G2 X113.756 Y144.244 I20.236 J-16.884 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F9120
G3 X151.732 Y134.38 I-28.337 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.384 J-15.853 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X155.433 Y130.406 E.04619
G1 X153.805 Y130.406 E.05401
G1 X156.55 Y128.682 F30000
G1 F9120
G1 X156.55 Y100.705 E.92807
G1 X152.45 Y100.705 E.13598
G1 X152.42 Y129.998 E.97173
G1 X156.518 Y129.998 E.13596
G1 X156.55 Y128.742 E.04168
G1 X156.124 Y129.465 F30000
G1 F9120
G1 X156.121 Y129.591 E.00419
G1 X154.619 Y129.591 E.04982
G1 X152.857 Y127.83 E.08265
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
G1 X156.143 Y101.857 E.15411
G1 X156.143 Y101.112 E.02474
G1 X155.26 Y101.112 E.02928
; WIPE_START
G1 F24000
G1 X156.143 Y101.112 E-.33538
G1 X156.143 Y101.857 E-.28338
G1 X155.88 Y102.12 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.154 J-.388 P1  F30000
G1 X138.469 Y153.916 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F9120
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F9120
G3 X123.206 Y150.146 I3.601 J-15.928 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 0.971429
; LAYER_HEIGHT: 0.171429
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z1.2 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z1.2
G1 Z.971
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.86 Y130.877 E.02726
G1 X109.86 Y128 E.10997
M73 P42 R10
G1 X109.039 Y128 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y122.246 E.10997
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y113.615 E.10997
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y102.106 E.10997
G1 X109.86 Y102.106 E.03141
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.371 I.123 J-1.211 P1  F30000
G1 X101.229 Y99.229 Z1.371
G1 Z.971
G1 E.8 F1800
G1 F9000
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y102.106 E.09842
G1 X101.229 Y102.106 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y107.86 E.10997
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.961 Y128.758 E.02896
G2 X102.05 Y130.877 I41.86 J-.697 E.08109
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.001 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.371 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z1.371
G1 Z.971
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.02726
G2 X150.961 Y128 I-61.906 J-3.782 E.11006
G1 X150.14 Y128 E.03141
G1 X150.14 Y125.123 E.10997
G1 X150.961 Y125.123 E.03141
G1 X150.961 Y122.246 E.10997
G1 X150.14 Y122.246 E.03141
G1 X150.14 Y119.369 E.10997
G1 X150.961 Y119.369 E.03141
G1 X150.961 Y116.492 E.10997
G1 X150.14 Y116.492 E.03141
G1 X150.14 Y113.615 E.10997
G1 X150.961 Y113.615 E.03141
G1 X150.961 Y110.738 E.10997
G1 X150.14 Y110.738 E.03141
G1 X150.14 Y107.86 E.10997
G1 X150.961 Y107.86 E.03141
G1 X150.961 Y104.983 E.10997
G1 X150.14 Y104.983 E.03141
G1 X150.14 Y102.106 E.10997
G1 X150.961 Y102.106 E.03141
G1 X150.961 Y99.531 E.09842
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.371 I.134 J1.21 P1  F30000
G1 X157.737 Y99.229 Z1.371
G1 Z.971
G1 E.8 F1800
G1 F9000
G1 X158.771 Y99.229 E.03953
G1 X158.771 Y102.106 E.10997
G1 X158.039 Y102.106 E.02799
G1 X158.039 Y104.983 E.10997
G1 X158.771 Y104.983 E.02799
G1 X158.771 Y107.86 E.10997
G1 X158.039 Y107.86 E.02799
G1 X158.039 Y110.738 E.10997
G1 X158.771 Y110.738 E.02799
G1 X158.771 Y113.615 E.10997
G1 X158.039 Y113.615 E.02799
G1 X158.039 Y116.492 E.10997
G1 X158.771 Y116.492 E.02799
G1 X158.771 Y119.369 E.10997
G1 X158.039 Y119.369 E.02799
G1 X158.039 Y122.246 E.10997
G1 X158.771 Y122.246 E.02799
G1 X158.771 Y125.123 E.10997
G1 X158.039 Y125.123 E.02799
G1 X158.039 Y128 E.10997
G1 X158.771 Y128 E.02799
G1 X158.771 Y130.877 E.10997
G1 X157.95 Y130.877 E.03139
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.0285714
; WIPE_START
G1 F24000
G1 X158.771 Y130.877 E-.3121
G1 X158.771 Y129.698 E-.4479
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
G3 Z1.371 I.567 J-1.077 P1  F30000
G1 X103.102 Y100.356 Z1.371
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9178
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.011 E2.30258
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J-.001 E2.80303
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9178
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.002 E2.63427
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.217 J.033 P1  F30000
G1 X104.74 Y101.112 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9178
G1 X103.857 Y101.112 E.02928
G1 X103.857 Y101.857 E.02474
G1 X107.143 Y105.143 E.15411
G1 X107.143 Y104.802 E.01131
G1 X103.857 Y108.087 E.15411
G1 X103.857 Y109.533 E.04799
G1 X107.143 Y112.819 E.15411
G1 X107.143 Y112.478 E.01131
G1 X103.857 Y115.763 E.15411
G1 X103.857 Y117.209 E.04799
G1 X107.143 Y120.495 E.15411
G1 X107.143 Y120.154 E.01131
G1 X103.857 Y123.439 E.15411
G1 X103.857 Y124.885 E.04799
G1 X107.143 Y128.17 E.15411
G1 X107.143 Y127.83 E.01131
G1 X105.381 Y129.591 E.08265
G1 X103.879 Y129.591 E.04982
G1 X103.876 Y129.465 E.00419
G1 X107.55 Y128.706 F30000
G1 F9178
G1 X107.55 Y100.705 E.92886
G1 X103.45 Y100.705 E.13598
G1 X103.482 Y129.998 E.97173
G1 X107.58 Y129.998 E.13596
G1 X107.55 Y128.766 E.04089
G1 X106.195 Y130.406 F30000
G1 F9178
G1 X104.567 Y130.406 E.05401
G1 X103.582 Y131.39 E.04619
G2 X103.71 Y132.414 I10.323 J-.77 E.03423
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.996 Y137.652 I27.256 J-16.351 E.19095
G1 X108.268 Y134.38 E.15351
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F9178
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-20.999 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F9178
G3 X151.732 Y134.38 I-28.337 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X155.433 Y130.406 E.04619
G1 X153.805 Y130.406 E.05401
G1 X156.55 Y128.682 F30000
G1 F9178
G1 X156.55 Y100.705 E.92807
G1 X152.45 Y100.705 E.13598
G1 X152.42 Y129.998 E.97173
G1 X156.518 Y129.998 E.13596
G1 X156.55 Y128.742 E.04168
G1 X156.124 Y129.465 F30000
G1 F9178
G1 X156.121 Y129.591 E.00419
G1 X154.619 Y129.591 E.04982
G1 X152.857 Y127.83 E.08265
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
G1 X156.143 Y101.857 E.15411
G1 X156.143 Y101.112 E.02474
G1 X155.26 Y101.112 E.02928
; WIPE_START
G1 F24000
G1 X156.143 Y101.112 E-.33538
G1 X156.143 Y101.857 E-.28338
G1 X155.88 Y102.12 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.154 J-.388 P1  F30000
G1 X138.469 Y153.916 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9178
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
M73 P43 R10
G1 F9178
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S239.7
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z1.4 I1.157 J-.377 P1  F30000
G1 X103.102 Y100.356 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.012 E2.30254
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J.003 E2.80327
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.007 E2.09531
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.002 E2.63422
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.283 J1.184 P1  F30000
G1 X107.731 Y100.726 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.400014
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X103.472 Y100.726 E.21807
G1 X103.472 Y101.176 E.02304
G1 X107.528 Y101.176 E.2077
G1 X107.528 Y101.626 E.02304
G1 X103.472 Y101.626 E.2077
G1 X103.472 Y102.076 E.02304
G1 X107.528 Y102.076 E.2077
G1 X107.528 Y102.526 E.02304
G1 X103.472 Y102.526 E.2077
G1 X103.472 Y102.976 E.02304
G1 X107.528 Y102.976 E.2077
G1 X107.528 Y103.426 E.02304
G1 X103.472 Y103.426 E.2077
G1 X103.472 Y103.876 E.02304
G1 X107.528 Y103.876 E.2077
G1 X107.528 Y104.326 E.02304
G1 X103.472 Y104.326 E.2077
G1 X103.472 Y104.776 E.02304
G1 X107.528 Y104.776 E.2077
G1 X107.528 Y105.226 E.02304
G1 X103.472 Y105.226 E.2077
G1 X103.472 Y105.676 E.02304
G1 X107.528 Y105.676 E.2077
G1 X107.528 Y106.126 E.02304
G1 X103.472 Y106.126 E.2077
G1 X103.472 Y106.576 E.02304
G1 X107.528 Y106.576 E.2077
G1 X107.528 Y107.026 E.02304
G1 X103.472 Y107.026 E.2077
G1 X103.472 Y107.476 E.02304
G1 X107.528 Y107.476 E.2077
G1 X107.528 Y107.926 E.02304
G1 X103.472 Y107.926 E.2077
G1 X103.472 Y108.376 E.02304
G1 X107.528 Y108.376 E.2077
G1 X107.528 Y108.826 E.02304
G1 X103.472 Y108.826 E.2077
G1 X103.472 Y109.276 E.02304
G1 X107.528 Y109.276 E.2077
G1 X107.528 Y109.726 E.02304
G1 X103.472 Y109.726 E.2077
G1 X103.472 Y110.176 E.02304
G1 X107.528 Y110.176 E.2077
G1 X107.528 Y110.626 E.02304
G1 X103.472 Y110.626 E.2077
G1 X103.472 Y111.076 E.02304
G1 X107.528 Y111.076 E.2077
G1 X107.528 Y111.526 E.02304
G1 X103.472 Y111.526 E.2077
G1 X103.472 Y111.976 E.02304
G1 X107.528 Y111.976 E.2077
G1 X107.528 Y112.426 E.02304
G1 X103.472 Y112.426 E.2077
G1 X103.472 Y112.877 E.02304
G1 X107.528 Y112.877 E.2077
G1 X107.528 Y113.327 E.02304
G1 X103.472 Y113.327 E.2077
G1 X103.472 Y113.777 E.02304
G1 X107.528 Y113.777 E.2077
G1 X107.528 Y114.227 E.02304
G1 X103.472 Y114.227 E.2077
G1 X103.472 Y114.677 E.02304
G1 X107.528 Y114.677 E.2077
G1 X107.528 Y115.127 E.02304
G1 X103.472 Y115.127 E.2077
G1 X103.472 Y115.577 E.02304
G1 X107.528 Y115.577 E.2077
G1 X107.528 Y116.027 E.02304
G1 X103.472 Y116.027 E.2077
G1 X103.472 Y116.477 E.02304
G1 X107.528 Y116.477 E.2077
G1 X107.528 Y116.927 E.02304
G1 X103.472 Y116.927 E.2077
G1 X103.472 Y117.377 E.02304
G1 X107.528 Y117.377 E.2077
G1 X107.528 Y117.827 E.02304
G1 X103.472 Y117.827 E.2077
G1 X103.472 Y118.277 E.02304
G1 X107.528 Y118.277 E.2077
G1 X107.528 Y118.727 E.02304
G1 X103.472 Y118.727 E.2077
G1 X103.472 Y119.177 E.02304
G1 X107.528 Y119.177 E.2077
G1 X107.528 Y119.627 E.02304
G1 X103.472 Y119.627 E.2077
G1 X103.472 Y120.077 E.02304
G1 X107.528 Y120.077 E.2077
G1 X107.528 Y120.527 E.02304
G1 X103.472 Y120.527 E.2077
G1 X103.472 Y120.977 E.02304
G1 X107.528 Y120.977 E.2077
G1 X107.528 Y121.427 E.02304
G1 X103.472 Y121.427 E.2077
G1 X103.472 Y121.877 E.02304
G1 X107.528 Y121.877 E.2077
G1 X107.528 Y122.327 E.02304
G1 X103.472 Y122.327 E.2077
G1 X103.472 Y122.777 E.02304
G1 X107.528 Y122.777 E.2077
G1 X107.528 Y123.227 E.02304
G1 X103.472 Y123.227 E.2077
G1 X103.472 Y123.677 E.02304
G1 X107.528 Y123.677 E.2077
G1 X107.528 Y124.127 E.02304
G1 X103.472 Y124.127 E.2077
G1 X103.472 Y124.577 E.02304
G1 X107.528 Y124.577 E.2077
G1 X107.528 Y125.027 E.02304
G1 X103.472 Y125.027 E.2077
G1 X103.472 Y125.477 E.02304
G1 X107.528 Y125.477 E.2077
G1 X107.528 Y125.927 E.02304
G1 X103.472 Y125.927 E.2077
G1 X103.472 Y126.377 E.02304
G1 X107.528 Y126.377 E.2077
G1 X107.528 Y126.827 E.02304
G1 X103.472 Y126.827 E.2077
G1 X103.472 Y127.277 E.02304
G1 X107.528 Y127.277 E.2077
G1 X107.528 Y127.727 E.02304
G1 X103.472 Y127.727 E.2077
G1 X103.472 Y128.177 E.02304
G1 X107.528 Y128.177 E.2077
G1 X107.528 Y128.627 E.02304
G1 X103.472 Y128.627 E.2077
G2 X103.48 Y129.077 I9.027 J.058 E.02305
G1 X107.536 Y129.077 E.20767
G1 X107.547 Y129.527 E.02305
G1 X103.491 Y129.527 E.20767
G1 X103.503 Y129.977 E.02305
G1 X107.761 Y129.977 E.21804
M106 S239.7
G1 X106.195 Y130.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X104.567 Y130.406 E.05401
G1 X103.582 Y131.39 E.04619
G2 X103.71 Y132.414 I10.321 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.996 Y137.652 I27.139 J-16.288 E.19096
G1 X108.268 Y134.38 E.15347
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F15476.087
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-20.999 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F15476.087
G3 X151.732 Y134.38 I-28.337 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X155.433 Y130.406 E.04619
M73 P44 R10
G1 X153.805 Y130.406 E.05401
G1 X156.7 Y129.977 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400014
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X152.442 Y129.977 E.21804
G1 X152.453 Y129.527 E.02305
G1 X156.509 Y129.527 E.20767
G1 X156.52 Y129.077 E.02305
G1 X152.464 Y129.077 E.20767
G2 X152.472 Y128.627 I-9.018 J-.38 E.02305
G1 X156.528 Y128.627 E.2077
G1 X156.528 Y128.177 E.02304
G1 X152.472 Y128.177 E.2077
G1 X152.472 Y127.727 E.02304
G1 X156.528 Y127.727 E.2077
G1 X156.528 Y127.277 E.02304
G1 X152.472 Y127.277 E.2077
G1 X152.472 Y126.827 E.02304
G1 X156.528 Y126.827 E.2077
G1 X156.528 Y126.377 E.02304
G1 X152.472 Y126.377 E.2077
G1 X152.472 Y125.927 E.02304
G1 X156.528 Y125.927 E.2077
G1 X156.528 Y125.477 E.02304
G1 X152.472 Y125.477 E.2077
G1 X152.472 Y125.027 E.02304
G1 X156.528 Y125.027 E.2077
G1 X156.528 Y124.577 E.02304
G1 X152.472 Y124.577 E.2077
G1 X152.472 Y124.127 E.02304
G1 X156.528 Y124.127 E.2077
G1 X156.528 Y123.677 E.02304
G1 X152.472 Y123.677 E.2077
G1 X152.472 Y123.227 E.02304
G1 X156.528 Y123.227 E.2077
G1 X156.528 Y122.777 E.02304
G1 X152.472 Y122.777 E.2077
G1 X152.472 Y122.327 E.02304
G1 X156.528 Y122.327 E.2077
G1 X156.528 Y121.877 E.02304
G1 X152.472 Y121.877 E.2077
G1 X152.472 Y121.427 E.02304
G1 X156.528 Y121.427 E.2077
G1 X156.528 Y120.977 E.02304
G1 X152.472 Y120.977 E.2077
G1 X152.472 Y120.527 E.02304
G1 X156.528 Y120.527 E.2077
G1 X156.528 Y120.077 E.02304
G1 X152.472 Y120.077 E.2077
G1 X152.472 Y119.627 E.02304
G1 X156.528 Y119.627 E.2077
G1 X156.528 Y119.177 E.02304
G1 X152.472 Y119.177 E.2077
G1 X152.472 Y118.727 E.02304
G1 X156.528 Y118.727 E.2077
G1 X156.528 Y118.277 E.02304
G1 X152.472 Y118.277 E.2077
G1 X152.472 Y117.827 E.02304
G1 X156.528 Y117.827 E.2077
G1 X156.528 Y117.377 E.02304
G1 X152.472 Y117.377 E.2077
G1 X152.472 Y116.927 E.02304
G1 X156.528 Y116.927 E.2077
G1 X156.528 Y116.477 E.02304
G1 X152.472 Y116.477 E.2077
G1 X152.472 Y116.027 E.02304
G1 X156.528 Y116.027 E.2077
G1 X156.528 Y115.577 E.02304
G1 X152.472 Y115.577 E.2077
G1 X152.472 Y115.127 E.02304
G1 X156.528 Y115.127 E.2077
G1 X156.528 Y114.677 E.02304
G1 X152.472 Y114.677 E.2077
G1 X152.472 Y114.227 E.02304
G1 X156.528 Y114.227 E.2077
G1 X156.528 Y113.777 E.02304
G1 X152.472 Y113.777 E.2077
G1 X152.472 Y113.327 E.02304
G1 X156.528 Y113.327 E.2077
G1 X156.528 Y112.877 E.02304
G1 X152.472 Y112.877 E.2077
G1 X152.472 Y112.426 E.02304
G1 X156.528 Y112.426 E.2077
G1 X156.528 Y111.976 E.02304
G1 X152.472 Y111.976 E.2077
G1 X152.472 Y111.526 E.02304
G1 X156.528 Y111.526 E.2077
G1 X156.528 Y111.076 E.02304
G1 X152.472 Y111.076 E.2077
G1 X152.472 Y110.626 E.02304
G1 X156.528 Y110.626 E.2077
G1 X156.528 Y110.176 E.02304
G1 X152.472 Y110.176 E.2077
G1 X152.472 Y109.726 E.02304
G1 X156.528 Y109.726 E.2077
G1 X156.528 Y109.276 E.02304
G1 X152.472 Y109.276 E.2077
G1 X152.472 Y108.826 E.02304
G1 X156.528 Y108.826 E.2077
G1 X156.528 Y108.376 E.02304
G1 X152.472 Y108.376 E.2077
G1 X152.472 Y107.926 E.02304
G1 X156.528 Y107.926 E.2077
G1 X156.528 Y107.476 E.02304
G1 X152.472 Y107.476 E.2077
G1 X152.472 Y107.026 E.02304
G1 X156.528 Y107.026 E.2077
G1 X156.528 Y106.576 E.02304
G1 X152.472 Y106.576 E.2077
G1 X152.472 Y106.126 E.02304
G1 X156.528 Y106.126 E.2077
G1 X156.528 Y105.676 E.02304
G1 X152.472 Y105.676 E.2077
G1 X152.472 Y105.226 E.02304
G1 X156.528 Y105.226 E.2077
G1 X156.528 Y104.776 E.02304
G1 X152.472 Y104.776 E.2077
G1 X152.472 Y104.326 E.02304
G1 X156.528 Y104.326 E.2077
G1 X156.528 Y103.876 E.02304
G1 X152.472 Y103.876 E.2077
G1 X152.472 Y103.426 E.02304
G1 X156.528 Y103.426 E.2077
G1 X156.528 Y102.976 E.02304
G1 X152.472 Y102.976 E.2077
G1 X152.472 Y102.526 E.02304
G1 X156.528 Y102.526 E.2077
G1 X156.528 Y102.076 E.02304
G1 X152.472 Y102.076 E.2077
G1 X152.472 Y101.626 E.02304
G1 X156.528 Y101.626 E.2077
G1 X156.528 Y101.176 E.02304
G1 X152.472 Y101.176 E.2077
G1 X152.472 Y100.726 E.02304
G1 X156.731 Y100.726 E.21807
M106 S239.7
; WIPE_START
G1 F24000
G1 X154.731 Y100.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.164 J-.356 P1  F30000
G1 X138.469 Y153.916 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.169 J-15.49 E.05402
G1 X124.774 Y150.583 F30000
G1 F15476.087
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 1.22857
; LAYER_HEIGHT: 0.0285714
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z1.6 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z1.6
G1 Z1.229
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.86 Y130.877 E.02726
G1 X109.86 Y128 E.10997
G1 X109.039 Y128 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y122.246 E.10997
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y113.615 E.10997
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y102.106 E.10997
G1 X109.86 Y102.106 E.03141
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.629 I.123 J-1.211 P1  F30000
G1 X101.229 Y99.229 Z1.629
G1 Z1.229
G1 E.8 F1800
G1 F9000
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y102.106 E.09842
G1 X101.229 Y102.106 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y107.86 E.10997
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.961 Y128.758 E.02896
G2 X102.05 Y130.877 I41.86 J-.697 E.08109
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.001 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.629 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z1.629
G1 Z1.229
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.02726
G2 X150.961 Y128 I-61.906 J-3.782 E.11006
G1 X150.14 Y128 E.03141
G1 X150.14 Y125.123 E.10997
G1 X150.961 Y125.123 E.03141
G1 X150.961 Y122.246 E.10997
G1 X150.14 Y122.246 E.03141
G1 X150.14 Y119.369 E.10997
G1 X150.961 Y119.369 E.03141
G1 X150.961 Y116.492 E.10997
G1 X150.14 Y116.492 E.03141
G1 X150.14 Y113.615 E.10997
G1 X150.961 Y113.615 E.03141
G1 X150.961 Y110.738 E.10997
G1 X150.14 Y110.738 E.03141
G1 X150.14 Y107.86 E.10997
G1 X150.961 Y107.86 E.03141
G1 X150.961 Y104.983 E.10997
G1 X150.14 Y104.983 E.03141
G1 X150.14 Y102.106 E.10997
G1 X150.961 Y102.106 E.03141
G1 X150.961 Y99.531 E.09842
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.629 I.134 J1.21 P1  F30000
G1 X157.737 Y99.229 Z1.629
G1 Z1.229
G1 E.8 F1800
G1 F9000
G1 X158.771 Y99.229 E.03953
G1 X158.771 Y102.106 E.10997
G1 X158.039 Y102.106 E.02799
G1 X158.039 Y104.983 E.10997
G1 X158.771 Y104.983 E.02799
G1 X158.771 Y107.86 E.10997
G1 X158.039 Y107.86 E.02799
G1 X158.039 Y110.738 E.10997
G1 X158.771 Y110.738 E.02799
G1 X158.771 Y113.615 E.10997
G1 X158.039 Y113.615 E.02799
G1 X158.039 Y116.492 E.10997
G1 X158.771 Y116.492 E.02799
G1 X158.771 Y119.369 E.10997
G1 X158.039 Y119.369 E.02799
G1 X158.039 Y122.246 E.10997
G1 X158.771 Y122.246 E.02799
G1 X158.771 Y125.123 E.10997
G1 X158.039 Y125.123 E.02799
G1 X158.039 Y128 E.10997
G1 X158.771 Y128 E.02799
G1 X158.771 Y130.877 E.10997
G1 X157.95 Y130.877 E.03139
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.171429
; WIPE_START
G1 F24000
G1 X158.771 Y130.877 E-.3121
G1 X158.771 Y129.698 E-.4479
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
G3 Z1.629 I.567 J-1.077 P1  F30000
M73 P45 R10
G1 X103.102 Y100.356 Z1.629
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F14716
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30237
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J-.001 E2.80303
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.63401
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.216 J.041 P1  F30000
G1 X105.654 Y128.162 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F14716
G1 X105.654 Y102.6 E.64362
G1 X105.346 Y102.6 E.00778
G1 X105.346 Y128.162 E.64362
G1 X105.594 Y128.162 E.00627
G1 X105.998 Y128.505 F30000
; LINE_WIDTH: 0.419999
G1 F14716
G1 X105.998 Y102.257 E.80654
G1 X105.002 Y102.257 E.03058
G1 X105.002 Y128.505 E.80654
G1 X105.938 Y128.505 E.02873
G1 X106.375 Y128.008 F30000
G1 F14716
G1 X106.375 Y101.88 E.80284
G1 X104.625 Y101.88 E.05375
G1 X104.629 Y128.882 E.82971
G1 X106.377 Y128.882 E.05371
G1 X106.375 Y128.068 E.02503
G1 X106.752 Y128.008 F30000
G1 F14716
G1 X106.752 Y101.503 E.81443
G1 X104.248 Y101.503 E.07692
G1 X104.248 Y128.732 E.8367
G1 X104.261 Y129.259 E.0162
G1 X106.764 Y129.259 E.07689
G1 X106.752 Y128.068 E.03662
G1 X107.129 Y128.008 F30000
G1 F14716
G1 X107.129 Y101.126 E.82601
G1 X103.871 Y101.126 E.10009
G1 X103.871 Y128.737 E.84843
G1 X103.894 Y129.636 E.02764
G1 X107.15 Y129.636 E.10007
G3 X107.129 Y128.068 I31.73 J-1.221 E.04821
G1 X107.506 Y128.008 F30000
G1 F14716
G1 X107.506 Y100.748 E.8376
G1 X103.494 Y100.748 E.12327
G1 X103.494 Y128.742 E.86016
G1 X103.526 Y130.014 E.03909
G1 X107.533 Y130.014 E.12314
G1 X107.533 Y129.867 E.00451
G3 X107.506 Y128.068 I36.163 J-1.451 E.05529
G1 X106.195 Y130.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14716
G1 X104.567 Y130.406 E.05401
G1 X103.582 Y131.39 E.04619
G2 X103.71 Y132.414 I10.321 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.997 Y137.651 I27.027 J-16.228 E.19098
G1 X108.268 Y134.38 E.15343
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F14716
G2 X113.756 Y144.244 I20.232 J-16.88 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F14716
G3 X151.732 Y134.38 I-28.337 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.385 J-15.854 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X155.433 Y130.406 E.04619
G1 X153.805 Y130.406 E.05401
G1 X154.346 Y128.162 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F14716
G1 X154.654 Y128.162 E.00778
G1 X154.654 Y102.6 E.64362
G1 X154.346 Y102.6 E.00778
G1 X154.346 Y128.102 E.64211
G1 X154.002 Y128.505 F30000
; LINE_WIDTH: 0.419999
G1 F14716
G1 X154.998 Y128.505 E.03058
G1 X154.998 Y102.257 E.80654
G1 X154.002 Y102.257 E.03058
G1 X154.002 Y128.445 E.8047
G1 X153.625 Y128.764 F30000
G1 F14716
G1 X153.623 Y128.882 E.00363
G1 X155.371 Y128.882 E.05371
G1 X155.375 Y101.88 E.82971
G1 X153.625 Y101.88 E.05375
G1 X153.625 Y128.704 E.82424
G1 X153.248 Y128.764 F30000
G1 F14716
G1 X153.236 Y129.259 E.01522
G1 X155.739 Y129.259 E.07689
G1 X155.752 Y128.732 E.0162
G1 X155.752 Y101.503 E.8367
G1 X153.248 Y101.503 E.07692
G1 X153.248 Y128.704 E.83583
G1 X152.871 Y128.764 F30000
G1 F14716
G1 X152.85 Y129.636 E.02681
G1 X156.106 Y129.636 E.10007
G1 X156.129 Y128.737 E.02764
G1 X156.129 Y101.126 E.84843
G1 X152.871 Y101.126 E.10009
G1 X152.871 Y128.704 E.84742
G1 X152.494 Y128.764 F30000
G1 F14716
G1 X152.494 Y128.769 E.00014
G2 X152.467 Y130.014 I25.224 J1.179 E.03825
G1 X156.474 Y130.014 E.12314
G1 X156.506 Y128.742 E.03909
G1 X156.506 Y100.748 E.86016
G1 X152.494 Y100.748 E.12327
G1 X152.494 Y128.704 E.859
; WIPE_START
G1 F24000
G1 X152.494 Y126.704 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.986 J-.713 P1  F30000
G1 X135.226 Y150.583 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14716
G2 X136.794 Y150.146 I-3.6 J-15.927 E.05402
G1 X139.993 Y153.345 E.15007
G3 X138.469 Y153.916 I-6.489 J-14.985 E.05403
G1 X124.774 Y150.583 F30000
G1 F14716
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
M73 P45 R9
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 1.48571
; LAYER_HEIGHT: 0.0857143
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z1.8 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z1.8
G1 Z1.486
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.86 Y130.877 E.02726
G1 X109.86 Y128 E.10997
G1 X109.039 Y128 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y122.246 E.10997
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y113.615 E.10997
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y102.106 E.10997
G1 X109.86 Y102.106 E.03141
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.886 I.123 J-1.211 P1  F30000
G1 X101.229 Y99.229 Z1.886
G1 Z1.486
G1 E.8 F1800
G1 F9000
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y102.106 E.09842
G1 X101.229 Y102.106 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y107.86 E.10997
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.961 Y128.758 E.02896
G2 X102.05 Y130.877 I41.861 J-.697 E.08109
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.001 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.886 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z1.886
G1 Z1.486
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.02726
G2 X150.961 Y128 I-61.906 J-3.782 E.11006
M73 P46 R9
G1 X150.14 Y128 E.03141
G1 X150.14 Y125.123 E.10997
G1 X150.961 Y125.123 E.03141
G1 X150.961 Y122.246 E.10997
G1 X150.14 Y122.246 E.03141
G1 X150.14 Y119.369 E.10997
G1 X150.961 Y119.369 E.03141
G1 X150.961 Y116.492 E.10997
G1 X150.14 Y116.492 E.03141
G1 X150.14 Y113.615 E.10997
G1 X150.961 Y113.615 E.03141
G1 X150.961 Y110.738 E.10997
G1 X150.14 Y110.738 E.03141
G1 X150.14 Y107.86 E.10997
G1 X150.961 Y107.86 E.03141
G1 X150.961 Y104.983 E.10997
G1 X150.14 Y104.983 E.03141
G1 X150.14 Y102.106 E.10997
G1 X150.961 Y102.106 E.03141
G1 X150.961 Y99.531 E.09842
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.886 I.134 J1.21 P1  F30000
G1 X157.737 Y99.229 Z1.886
G1 Z1.486
G1 E.8 F1800
G1 F9000
G1 X158.771 Y99.229 E.03953
G1 X158.771 Y102.106 E.10997
G1 X158.039 Y102.106 E.02799
G1 X158.039 Y104.983 E.10997
G1 X158.771 Y104.983 E.02799
G1 X158.771 Y107.86 E.10997
G1 X158.039 Y107.86 E.02799
G1 X158.039 Y110.738 E.10997
G1 X158.771 Y110.738 E.02799
G1 X158.771 Y113.615 E.10997
G1 X158.039 Y113.615 E.02799
G1 X158.039 Y116.492 E.10997
G1 X158.771 Y116.492 E.02799
G1 X158.771 Y119.369 E.10997
G1 X158.039 Y119.369 E.02799
G1 X158.039 Y122.246 E.10997
G1 X158.771 Y122.246 E.02799
G1 X158.771 Y125.123 E.10997
G1 X158.039 Y125.123 E.02799
G1 X158.039 Y128 E.10997
G1 X158.771 Y128 E.02799
G1 X158.771 Y130.877 E.10997
G1 X157.95 Y130.877 E.03139
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.114286
; WIPE_START
G1 F24000
G1 X158.771 Y130.877 E-.3121
G1 X158.771 Y129.698 E-.4479
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
G3 Z1.886 I-.003 J-1.217 P1  F30000
G1 X103.129 Y129.832 Z1.886
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X107.923 Y129.832 E.15903
G1 X108.008 Y130.955 E.03735
G2 X152.077 Y129.832 I21.993 J-2.208 E2.19402
G1 X156.871 Y129.832 E.15903
G1 X156.864 Y130.095 E.00873
G3 X103.132 Y129.892 I-26.862 J-1.347 E2.7202
; WIPE_START
G1 F24000
G1 X105.131 Y129.867 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.213 J-.098 P1  F30000
G1 X102.71 Y99.964 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.007 E2.09528
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.004 E2.63413
G1 X102.71 Y100.024 E.88271
M204 S10000
G1 X102.906 Y100.266 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.255134
G1 F15000
G1 X108.094 Y100.266 E.08971
; WIPE_START
G1 F24000
G1 X106.094 Y100.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.214 J.085 P1  F30000
G1 X108.085 Y128.851 Z2
G1 Z1.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.326 Y129.61 E.03297
G1 X106.793 Y129.61
G1 X108.083 Y128.32 E.05605
G1 X108.083 Y127.787
G1 X106.26 Y129.61 E.07922
G1 X105.726 Y129.61
G1 X108.083 Y127.253 E.10239
G1 X108.083 Y126.72
G1 X105.193 Y129.61 E.12557
G1 X104.66 Y129.61
G1 X108.083 Y126.187 E.14874
G1 X108.083 Y125.654
G1 X104.126 Y129.61 E.17191
G1 X103.593 Y129.61
G1 X108.083 Y125.12 E.19509
G1 X108.083 Y124.587
G1 X103.06 Y129.61 E.21826
G1 X102.929 Y129.207
G1 X108.083 Y124.054 E.22396
G1 X108.083 Y123.52
G1 X102.917 Y128.686 E.22445
G1 X102.917 Y128.152
G1 X108.083 Y122.987 E.22445
G1 X108.083 Y122.454
G1 X102.917 Y127.619 E.22445
G1 X102.917 Y127.086
G1 X108.083 Y121.921 E.22445
G1 X108.083 Y121.387
G1 X102.917 Y126.553 E.22445
G1 X102.917 Y126.019
G1 X108.083 Y120.854 E.22445
G1 X108.083 Y120.321
G1 X102.917 Y125.486 E.22445
G1 X102.917 Y124.953
G1 X108.083 Y119.788 E.22445
G1 X108.083 Y119.254
G1 X102.917 Y124.419 E.22445
G1 X102.917 Y123.886
G1 X108.083 Y118.721 E.22445
G1 X108.083 Y118.188
G1 X102.917 Y123.353 E.22445
G1 X102.917 Y122.82
G1 X108.083 Y117.654 E.22445
G1 X108.083 Y117.121
G1 X102.917 Y122.286 E.22445
G1 X102.917 Y121.753
G1 X108.083 Y116.588 E.22445
G1 X108.083 Y116.055
G1 X102.917 Y121.22 E.22445
G1 X102.917 Y120.687
G1 X108.083 Y115.521 E.22445
G1 X108.083 Y114.988
G1 X102.917 Y120.153 E.22445
G1 X102.917 Y119.62
G1 X108.083 Y114.455 E.22445
G1 X108.083 Y113.922
G1 X102.917 Y119.087 E.22445
G1 X102.917 Y118.554
G1 X108.083 Y113.388 E.22445
G1 X108.083 Y112.855
G1 X102.917 Y118.02 E.22445
G1 X102.917 Y117.487
G1 X108.083 Y112.322 E.22445
G1 X108.083 Y111.789
G1 X102.917 Y116.954 E.22445
G1 X102.917 Y116.42
G1 X108.083 Y111.255 E.22445
G1 X108.083 Y110.722
G1 X102.917 Y115.887 E.22445
G1 X102.917 Y115.354
G1 X108.083 Y110.189 E.22445
G1 X108.083 Y109.655
G1 X102.917 Y114.821 E.22445
G1 X102.917 Y114.287
G1 X108.083 Y109.122 E.22445
G1 X108.083 Y108.589
G1 X102.917 Y113.754 E.22445
G1 X102.917 Y113.221
G1 X108.083 Y108.056 E.22445
G1 X108.083 Y107.522
G1 X102.917 Y112.688 E.22445
G1 X102.917 Y112.154
G1 X108.083 Y106.989 E.22445
G1 X108.083 Y106.456
G1 X102.917 Y111.621 E.22445
G1 X102.917 Y111.088
G1 X108.083 Y105.923 E.22445
G1 X108.083 Y105.389
G1 X102.917 Y110.554 E.22445
G1 X102.917 Y110.021
G1 X108.083 Y104.856 E.22445
G1 X108.083 Y104.323
G1 X102.917 Y109.488 E.22445
G1 X102.917 Y108.955
G1 X108.083 Y103.789 E.22445
G1 X108.083 Y103.256
G1 X102.917 Y108.421 E.22445
G1 X102.917 Y107.888
G1 X108.083 Y102.723 E.22445
G1 X108.083 Y102.19
G1 X102.917 Y107.355 E.22445
G1 X102.917 Y106.822
G1 X108.083 Y101.656 E.22445
G1 X108.083 Y101.123
G1 X102.917 Y106.288 E.22445
G1 X102.917 Y105.755
G1 X108.083 Y100.59 E.22445
G1 X107.74 Y100.399
G1 X102.917 Y105.222 E.20958
G1 X102.917 Y104.689
G1 X107.207 Y100.399 E.1864
G1 X106.674 Y100.399
G1 X102.917 Y104.155 E.16323
G1 X102.917 Y103.622
G1 X106.14 Y100.399 E.14006
G1 X105.607 Y100.399
G1 X102.917 Y103.089 E.11688
G1 X102.917 Y102.555
G1 X105.074 Y100.399 E.09371
G1 X104.541 Y100.399
G1 X102.917 Y102.022 E.07054
G1 X102.917 Y101.489
G1 X104.007 Y100.399 E.04737
G1 X103.474 Y100.399
G1 X102.917 Y100.956 E.02419
M204 S10000
; WIPE_START
G1 F24000
G1 X103.474 Y100.399 E-.29918
G1 X104.007 Y100.399 E-.20264
G1 X103.527 Y100.879 E-.25817
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.211 J.12 P1  F30000
G1 X106.42 Y130.18 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M73 P47 R9
G1 X104.792 Y130.18 E.05401
G1 X103.582 Y131.39 E.05675
G2 X103.71 Y132.414 I8.873 J-.587 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.992 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F15476.087
G2 X113.756 Y144.244 I20.234 J-16.882 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F15476.087
G3 X151.732 Y134.38 I-28.337 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.856 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-8.752 J-1.612 E.03424
G1 X155.208 Y130.18 E.05675
G1 X153.58 Y130.18 E.05401
G1 X157.078 Y128.918 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X156.387 Y129.61 E.03005
G1 X155.854 Y129.61
G1 X157.083 Y128.381 E.0534
G1 X157.083 Y127.847
G1 X155.32 Y129.61 E.07658
G1 X154.787 Y129.61
G1 X157.083 Y127.314 E.09975
G1 X157.083 Y126.781
G1 X154.254 Y129.61 E.12292
G1 X153.721 Y129.61
G1 X157.083 Y126.248 E.14609
G1 X157.083 Y125.714
G1 X153.187 Y129.61 E.16927
G1 X152.654 Y129.61
G1 X157.083 Y125.181 E.19244
G1 X157.083 Y124.648
G1 X152.121 Y129.61 E.21561
G1 X151.904 Y129.293
G1 X157.083 Y124.115 E.22503
G1 X157.083 Y123.581
G1 X151.917 Y128.747 E.22445
G1 X151.917 Y128.213
G1 X157.083 Y123.048 E.22445
G1 X157.083 Y122.515
G1 X151.917 Y127.68 E.22445
G1 X151.917 Y127.147
G1 X157.083 Y121.982 E.22445
G1 X157.083 Y121.448
G1 X151.917 Y126.613 E.22445
G1 X151.917 Y126.08
G1 X157.083 Y120.915 E.22445
G1 X157.083 Y120.382
G1 X151.917 Y125.547 E.22445
G1 X151.917 Y125.014
G1 X157.083 Y119.848 E.22445
G1 X157.083 Y119.315
G1 X151.917 Y124.48 E.22445
G1 X151.917 Y123.947
G1 X157.083 Y118.782 E.22445
G1 X157.083 Y118.249
G1 X151.917 Y123.414 E.22445
G1 X151.917 Y122.881
G1 X157.083 Y117.715 E.22445
G1 X157.083 Y117.182
G1 X151.917 Y122.347 E.22445
G1 X151.917 Y121.814
G1 X157.083 Y116.649 E.22445
G1 X157.083 Y116.116
G1 X151.917 Y121.281 E.22445
G1 X151.917 Y120.747
G1 X157.083 Y115.582 E.22445
G1 X157.083 Y115.049
G1 X151.917 Y120.214 E.22445
G1 X151.917 Y119.681
G1 X157.083 Y114.516 E.22445
G1 X157.083 Y113.982
G1 X151.917 Y119.148 E.22445
G1 X151.917 Y118.614
G1 X157.083 Y113.449 E.22445
G1 X157.083 Y112.916
G1 X151.917 Y118.081 E.22445
G1 X151.917 Y117.548
G1 X157.083 Y112.383 E.22445
G1 X157.083 Y111.849
G1 X151.917 Y117.015 E.22445
G1 X151.917 Y116.481
G1 X157.083 Y111.316 E.22445
G1 X157.083 Y110.783
G1 X151.917 Y115.948 E.22445
G1 X151.917 Y115.415
G1 X157.083 Y110.25 E.22445
G1 X157.083 Y109.716
G1 X151.917 Y114.882 E.22445
G1 X151.917 Y114.348
G1 X157.083 Y109.183 E.22445
G1 X157.083 Y108.65
G1 X151.917 Y113.815 E.22445
G1 X151.917 Y113.282
G1 X157.083 Y108.116 E.22445
G1 X157.083 Y107.583
G1 X151.917 Y112.748 E.22445
G1 X151.917 Y112.215
G1 X157.083 Y107.05 E.22445
G1 X157.083 Y106.517
G1 X151.917 Y111.682 E.22445
G1 X151.917 Y111.149
G1 X157.083 Y105.983 E.22445
G1 X157.083 Y105.45
G1 X151.917 Y110.615 E.22445
G1 X151.917 Y110.082
G1 X157.083 Y104.917 E.22445
G1 X157.083 Y104.384
G1 X151.917 Y109.549 E.22445
G1 X151.917 Y109.016
G1 X157.083 Y103.85 E.22445
G1 X157.083 Y103.317
G1 X151.917 Y108.482 E.22445
G1 X151.917 Y107.949
G1 X157.083 Y102.784 E.22445
G1 X157.083 Y102.251
G1 X151.917 Y107.416 E.22445
G1 X151.917 Y106.882
G1 X157.083 Y101.717 E.22445
G1 X157.083 Y101.184
G1 X151.917 Y106.349 E.22445
G1 X151.917 Y105.816
G1 X157.083 Y100.651 E.22445
G1 X156.801 Y100.399
G1 X151.917 Y105.283 E.21222
G1 X151.917 Y104.749
G1 X156.268 Y100.399 E.18905
G1 X155.735 Y100.399
G1 X151.917 Y104.216 E.16588
G1 X151.917 Y103.683
G1 X155.201 Y100.399 E.1427
G1 X154.668 Y100.399
G1 X151.917 Y103.15 E.11953
G1 X151.917 Y102.616
G1 X154.135 Y100.399 E.09636
G1 X153.602 Y100.399
G1 X151.917 Y102.083 E.07318
G1 X151.917 Y101.55
G1 X153.068 Y100.399 E.05001
G1 X152.535 Y100.399
G1 X151.917 Y101.016 E.02684
M204 S10000
G1 X151.906 Y100.266 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.255134
G1 F15000
G1 X157.094 Y100.266 E.08971
; WIPE_START
G1 F24000
G1 X155.094 Y100.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.132 J-.447 P1  F30000
G1 X135.226 Y150.583 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X136.794 Y150.146 I-3.601 J-15.927 E.05402
G1 X139.993 Y153.345 E.15007
G3 X138.469 Y153.916 I-6.489 J-14.985 E.05403
G1 X124.774 Y150.583 F30000
G1 F15476.087
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 1.74286
; LAYER_HEIGHT: 0.142857
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z2 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z2
G1 Z1.743
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F5866
G1 X109.86 Y130.877 E.02726
G1 X109.86 Y128 E.10997
G1 X109.039 Y128 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y122.246 E.10997
M73 P48 R9
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y113.615 E.10997
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y102.106 E.10997
G1 X109.86 Y102.106 E.03141
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.143 I.123 J-1.211 P1  F30000
G1 X101.229 Y99.229 Z2.143
G1 Z1.743
G1 E.8 F1800
G1 F5866
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y102.106 E.09842
G1 X101.229 Y102.106 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y107.86 E.10997
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.956 Y128.541 E.02067
G2 X102.05 Y130.877 I23.614 J.215 E.08941
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.003 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.143 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z2.143
G1 Z1.743
G1 E.8 F1800
G1 F5866
G1 X150.853 Y130.877 E.02726
G2 X150.961 Y128 I-27.285 J-2.472 E.1101
G1 X150.14 Y128 E.03141
G1 X150.14 Y125.123 E.10997
G1 X150.961 Y125.123 E.03141
G1 X150.961 Y122.246 E.10997
G1 X150.14 Y122.246 E.03141
G1 X150.14 Y119.369 E.10997
G1 X150.961 Y119.369 E.03141
G1 X150.961 Y116.492 E.10997
G1 X150.14 Y116.492 E.03141
G1 X150.14 Y113.615 E.10997
G1 X150.961 Y113.615 E.03141
G1 X150.961 Y110.738 E.10997
G1 X150.14 Y110.738 E.03141
G1 X150.14 Y107.86 E.10997
G1 X150.961 Y107.86 E.03141
G1 X150.961 Y104.983 E.10997
G1 X150.14 Y104.983 E.03141
G1 X150.14 Y102.106 E.10997
G1 X150.961 Y102.106 E.03141
G1 X150.961 Y99.531 E.09842
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.143 I.134 J1.21 P1  F30000
G1 X157.737 Y99.229 Z2.143
G1 Z1.743
G1 E.8 F1800
G1 F5866
G1 X158.771 Y99.229 E.03953
G1 X158.771 Y102.106 E.10997
G1 X158.039 Y102.106 E.02799
G1 X158.039 Y104.983 E.10997
G1 X158.771 Y104.983 E.02799
G1 X158.771 Y107.86 E.10997
G1 X158.039 Y107.86 E.02799
G1 X158.039 Y110.738 E.10997
G1 X158.771 Y110.738 E.02799
G1 X158.771 Y113.615 E.10997
G1 X158.039 Y113.615 E.02799
G1 X158.039 Y116.492 E.10997
G1 X158.771 Y116.492 E.02799
G1 X158.771 Y119.369 E.10997
G1 X158.039 Y119.369 E.02799
G1 X158.039 Y122.246 E.10997
G1 X158.771 Y122.246 E.02799
G1 X158.771 Y125.123 E.10997
G1 X158.039 Y125.123 E.02799
G1 X158.039 Y128 E.10997
G1 X158.771 Y128 E.02799
G1 X158.771 Y130.877 E.10997
G1 X157.95 Y130.877 E.03139
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0571429
; WIPE_START
G1 F24000
G1 X158.771 Y130.877 E-.3121
G1 X158.771 Y129.698 E-.4479
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
G3 Z2.143 I1.204 J-.177 P1  F30000
G1 X154.5 Y100.652 Z2.143
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5866
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5866
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5866
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5866
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.204 J.176 P1  F30000
G1 X107.913 Y129.356 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5866
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.101 E2.24646
G1 X156.883 Y129.356 E.15907
G3 X103.117 Y129.356 I-26.883 J-.597 E2.76257
G1 X107.853 Y129.356 E.15708
G1 X108.295 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5866
G1 X108.303 Y129.262 E.00915
G2 X151.705 Y128.964 I21.699 J-.509 E2.07306
G1 X157.285 Y128.964 E.17145
G3 X102.715 Y128.964 I-27.285 J-.211 E2.62097
G1 X108.235 Y128.964 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.303 Y129.262 E-.11595
G1 X108.317 Y129.836 E-.21841
G1 X108.398 Y130.916 E-.41134
G1 X108.402 Y130.953 E-.0143
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.777 J-.937 P1  F30000
G1 X106.896 Y129.705 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5866
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F5866
G2 X113.756 Y144.244 I20.234 J-16.882 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.242 Y144.242 E.13601
G2 X147.325 Y143.027 I-17.482 J-16.663 E.054
G1 X152.078 Y132.79 F30000
G1 F5866
G3 X151.732 Y134.38 I-28.337 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F5866
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F5866
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z2.2 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.86 Y130.877 E.02726
G1 X109.86 Y128 E.10997
G1 X108.889 Y128 E.03715
G1 X108.889 Y125.123 E.10997
M73 P49 R9
G1 X109.86 Y125.123 E.03715
G1 X109.86 Y122.246 E.10997
G1 X108.889 Y122.246 E.03715
G1 X108.889 Y119.369 E.10997
G1 X109.86 Y119.369 E.03715
G1 X109.86 Y116.492 E.10997
G1 X108.889 Y116.492 E.03715
G1 X108.889 Y113.615 E.10997
G1 X109.86 Y113.615 E.03715
G1 X109.86 Y110.738 E.10997
G1 X108.889 Y110.738 E.03715
G1 X108.889 Y107.86 E.10997
G1 X109.86 Y107.86 E.03715
G1 X109.86 Y104.983 E.10997
G1 X108.889 Y104.983 E.03715
G1 X108.889 Y102.106 E.10997
G1 X109.86 Y102.106 E.03715
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.215 J-.069 P1  F30000
G1 X108.262 Y128.216 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X108.731 Y128.228 E.01444
G1 X108.731 Y101.784 E.81253
G1 X108.073 Y101.793 E.02023
G1 X108.073 Y128.216 E.8119
G1 X107.196 Y128.216 E.02695
G1 X107.196 Y101.793 E.8119
G1 X106.319 Y101.793 E.02695
G1 X106.319 Y128.216 E.8119
G1 X105.442 Y128.216 E.02695
G1 X105.442 Y101.793 E.8119
G1 X104.565 Y101.793 E.02695
G1 X104.565 Y128.216 E.8119
G1 X103.688 Y128.216 E.02695
G1 X103.688 Y101.793 E.8119
G1 X102.811 Y101.793 E.02695
G1 X102.811 Y128.216 E.8119
G1 X102.269 Y128.22 E.01666
G1 X102.269 Y101.784 E.8123
G1 X102.622 Y101.793 E.01086
; WIPE_START
G1 F24000
G1 X102.269 Y101.784 E-.13436
G1 X102.269 Y103.431 E-.62564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.181 J-.292 P1  F30000
G1 X101.229 Y99.229 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y101.477 E.07438
G1 X102.111 Y101.627 E.00811
G1 X102.111 Y102.106 E.01831
G1 X101.229 Y102.106 E.03372
G1 X101.229 Y104.983 E.10997
G1 X102.111 Y104.983 E.03372
G1 X102.111 Y107.86 E.10997
G1 X101.229 Y107.86 E.03372
G1 X101.229 Y110.738 E.10997
G1 X102.111 Y110.738 E.03372
G1 X102.111 Y113.615 E.10997
G1 X101.229 Y113.615 E.03372
G1 X101.229 Y116.492 E.10997
G1 X102.111 Y116.492 E.03372
G1 X102.111 Y119.369 E.10997
G1 X101.229 Y119.369 E.03372
G1 X101.229 Y122.246 E.10997
G1 X102.111 Y122.246 E.03372
G1 X102.111 Y125.123 E.10997
G1 X101.229 Y125.123 E.03372
G1 X101.229 Y128 E.10997
G1 X102.111 Y128 E.03372
G3 X101.956 Y128.541 I-.355 J.191 E.02381
G2 X102.05 Y130.877 I23.614 J.215 E.08941
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.003 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z2.4
G1 Z2
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.02726
G2 X150.967 Y128.522 I-30.429 J-2.659 E.09015
G1 X151.111 Y128.381 E.00771
G1 X151.111 Y128 E.01456
G1 X150.14 Y128 E.03715
G1 X150.14 Y125.123 E.10997
G1 X151.111 Y125.123 E.03715
G1 X151.111 Y122.246 E.10997
G1 X150.14 Y122.246 E.03715
G1 X150.14 Y119.369 E.10997
G1 X151.111 Y119.369 E.03715
G1 X151.111 Y116.492 E.10997
G1 X150.14 Y116.492 E.03715
G1 X150.14 Y113.615 E.10997
G1 X151.111 Y113.615 E.03715
G1 X151.111 Y110.738 E.10997
G1 X150.14 Y110.738 E.03715
G1 X150.14 Y107.86 E.10997
G1 X151.111 Y107.86 E.03715
G1 X151.111 Y104.983 E.10997
G1 X150.14 Y104.983 E.03715
G1 X150.14 Y102.106 E.10997
G1 X151.111 Y102.106 E.03715
G1 X151.111 Y101.627 E.01831
G1 X150.961 Y101.477 E.00811
G1 X150.961 Y99.531 E.07438
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.119 J.479 P1  F30000
G1 X151.738 Y101.793 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X151.269 Y101.784 E.01444
G1 X151.269 Y128.228 E.81253
G1 X151.927 Y128.216 E.02024
G1 X151.927 Y101.793 E.8119
G1 X152.804 Y101.793 E.02695
G1 X152.804 Y128.216 E.8119
G1 X153.681 Y128.216 E.02695
G1 X153.681 Y101.793 E.8119
G1 X154.558 Y101.793 E.02695
G1 X154.558 Y128.216 E.8119
G1 X155.435 Y128.216 E.02695
G1 X155.435 Y101.793 E.8119
G1 X156.312 Y101.793 E.02695
G1 X156.312 Y128.216 E.8119
G1 X157.189 Y128.216 E.02695
G1 X157.189 Y101.793 E.8119
G1 X157.731 Y101.784 E.01666
G1 X157.731 Y128.22 E.8123
G1 X157.378 Y128.216 E.01086
; WIPE_START
G1 F24000
G1 X157.731 Y128.22 E-.13433
G1 X157.731 Y126.574 E-.62567
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.215 J.062 P1  F30000
G1 X157.95 Y130.877 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X158.771 Y130.877 E.03139
G1 X158.771 Y128 E.10997
G1 X157.889 Y128 E.03372
G1 X157.889 Y125.123 E.10997
G1 X158.771 Y125.123 E.03372
G1 X158.771 Y122.246 E.10997
G1 X157.889 Y122.246 E.03372
G1 X157.889 Y119.369 E.10997
G1 X158.771 Y119.369 E.03372
G1 X158.771 Y116.492 E.10997
G1 X157.889 Y116.492 E.03372
G1 X157.889 Y113.615 E.10997
G1 X158.771 Y113.615 E.03372
G1 X158.771 Y110.738 E.10997
G1 X157.889 Y110.738 E.03372
G1 X157.889 Y107.86 E.10997
G1 X158.771 Y107.86 E.03372
G1 X158.771 Y104.983 E.10997
G1 X157.889 Y104.983 E.03372
G1 X157.889 Y102.106 E.10997
G1 X158.771 Y102.106 E.03372
G1 X158.771 Y99.229 E.10997
G1 X157.737 Y99.229 E.03953
; WIPE_START
G1 F24000
G1 X158.771 Y99.229 E-.39302
G1 X158.771 Y100.195 E-.36698
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.13 J-1.21 P1  F30000
G1 X154.5 Y100.652 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.01 J-1.217 P1  F30000
M73 P50 R9
G1 X103.102 Y100.652 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.204 J.176 P1  F30000
G1 X107.913 Y129.356 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.105 E2.24624
G1 X156.883 Y129.356 E.15907
G3 X103.117 Y129.356 I-26.883 J-.602 E2.76226
G1 X107.853 Y129.356 E.15708
G1 X108.295 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.301 Y129.195 E.00709
G2 X151.705 Y128.964 I21.7 J-.44 E2.07525
G1 X157.285 Y128.964 E.17145
G3 X102.715 Y128.964 I-27.285 J-.214 E2.62078
G1 X108.235 Y128.964 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.301 Y129.195 E-.09112
G1 X108.317 Y129.836 E-.24387
G1 X108.398 Y130.916 E-.41134
G1 X108.402 Y130.952 E-.01367
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.776 J-.937 P1  F30000
G1 X106.896 Y129.705 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F15476.087
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.242 Y144.242 E.13602
G2 X147.325 Y143.027 I-17.346 J-16.546 E.054
G1 X152.078 Y132.79 F30000
G1 F15476.087
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z2.4
G1 Z2
G1 E.8 F1800
G1 F15476.087
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-7.636 J-24.341 E.05401
G1 X124.774 Y150.583 F30000
G1 F15476.087
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z2.4 I1.019 J.665 P1  F30000
G1 X154.5 Y100.652 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4245
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4245
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4245
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4245
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.204 J.176 P1  F30000
G1 X107.913 Y129.356 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4245
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.101 E2.24646
G1 X156.883 Y129.356 E.15907
G3 X103.117 Y129.356 I-26.883 J-.602 E2.76226
G1 X107.853 Y129.356 E.15708
G1 X108.295 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4245
G1 X108.299 Y129.128 E.00503
G2 X151.705 Y128.964 I21.702 J-.375 E2.07719
G1 X157.285 Y128.964 E.17145
G3 X102.715 Y128.964 I-27.285 J-.214 E2.62078
G1 X108.235 Y128.964 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.299 Y129.128 E-.06678
G1 X108.317 Y129.836 E-.26933
G1 X108.398 Y130.916 E-.41134
G1 X108.402 Y130.949 E-.01255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.775 J-.938 P1  F30000
G1 X106.896 Y129.705 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4245
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F4245
G2 X113.756 Y144.244 I20.235 J-16.884 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F4245
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
M73 P51 R9
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F4245
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F4245
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 2.25
; LAYER_HEIGHT: 0.05
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
; WIPE_END
M73 P51 R8
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
G3 Z2.6 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z2.6
G1 Z2.25
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.25
G1 F9000
G1 X109.86 Y130.877 E.02661
G1 X109.86 Y128 E.10736
G1 X109.109 Y128 E.02806
G1 X109.109 Y125.123 E.10736
G1 X109.86 Y125.123 E.02806
G1 X109.86 Y122.246 E.10736
G1 X109.109 Y122.246 E.02806
G1 X109.109 Y119.369 E.10736
G1 X109.86 Y119.369 E.02806
G1 X109.86 Y116.492 E.10736
G1 X109.109 Y116.492 E.02806
G1 X109.109 Y113.615 E.10736
G1 X109.86 Y113.615 E.02806
G1 X109.86 Y110.738 E.10736
G1 X109.109 Y110.738 E.02806
G1 X109.109 Y107.86 E.10736
G1 X109.86 Y107.86 E.02806
G1 X109.86 Y104.983 E.10736
G1 X109.109 Y104.983 E.02806
G1 X109.109 Y102.106 E.10736
G1 X109.86 Y102.106 E.02806
G1 X109.86 Y99.229 E.10736
G1 X108.737 Y99.229 E.04194
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.65 I-1.215 J-.069 P1  F30000
G1 X108.262 Y128.216 Z2.65
G1 Z2.25
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X108.731 Y128.228 E.01754
G1 X108.731 Y101.784 E.98676
G1 X108.073 Y101.793 E.02457
G1 X108.073 Y128.216 E.986
G1 X107.196 Y128.216 E.03273
G1 X107.196 Y101.793 E.986
G1 X106.319 Y101.793 E.03273
G1 X106.319 Y128.216 E.986
G1 X105.442 Y128.216 E.03273
G1 X105.442 Y101.793 E.986
G1 X104.565 Y101.793 E.03273
G1 X104.565 Y128.216 E.986
G1 X103.688 Y128.216 E.03273
G1 X103.688 Y101.793 E.986
G1 X102.811 Y101.793 E.03273
G1 X102.811 Y128.216 E.986
G1 X102.269 Y128.22 E.02023
G1 X102.269 Y101.784 E.98649
G1 X102.622 Y101.793 E.01319
; WIPE_START
G1 F24000
G1 X102.269 Y101.784 E-.13437
G1 X102.269 Y103.431 E-.62563
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.65 I1.181 J-.292 P1  F30000
G1 X101.229 Y99.229 Z2.65
G1 Z2.25
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X102.263 Y99.229 E.03859
G1 X101.961 Y99.531 E.01594
G1 X101.891 Y102.106 E.09613
G1 X101.229 Y102.106 E.02471
G1 X101.229 Y104.983 E.10736
G1 X101.891 Y104.983 E.02471
G1 X101.891 Y107.86 E.10736
G1 X101.229 Y107.86 E.02471
G1 X101.229 Y110.738 E.10736
G1 X101.891 Y110.738 E.02471
G1 X101.891 Y113.615 E.10736
G1 X101.229 Y113.615 E.02471
G1 X101.229 Y116.492 E.10736
G1 X101.891 Y116.492 E.02471
G1 X101.891 Y119.369 E.10736
G1 X101.229 Y119.369 E.02471
G1 X101.229 Y122.246 E.10736
G1 X101.891 Y122.246 E.02471
G1 X101.891 Y125.123 E.10736
G1 X101.229 Y125.123 E.02471
G1 X101.229 Y128 E.10736
G1 X101.891 Y128 E.02471
G1 X101.891 Y129.006 E.03755
G1 X101.97 Y129.084 E.00412
G2 X102.05 Y130.877 I18.143 J.079 E.06699
G1 X101.229 Y130.877 E.03065
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X101.997 Y129.7 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.65 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z2.65
G1 Z2.25
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.02661
G2 X150.953 Y129.068 I-27.943 J-2.465 E.06761
G1 X150.891 Y129.006 E.00327
G1 X150.891 Y128 E.03755
G1 X150.14 Y128 E.02806
G1 X150.14 Y125.123 E.10736
G1 X150.891 Y125.123 E.02806
G1 X150.891 Y122.246 E.10736
G1 X150.14 Y122.246 E.02806
G1 X150.14 Y119.369 E.10736
G1 X150.891 Y119.369 E.02806
G1 X150.891 Y116.492 E.10736
G1 X150.14 Y116.492 E.02806
G1 X150.14 Y113.615 E.10736
G1 X150.891 Y113.615 E.02806
G1 X150.891 Y110.738 E.10736
G1 X150.14 Y110.738 E.02806
G1 X150.14 Y107.86 E.10736
G1 X150.891 Y107.86 E.02806
G1 X150.891 Y104.983 E.10736
G1 X150.14 Y104.983 E.02806
G1 X150.14 Y102.106 E.10736
G1 X150.891 Y102.106 E.02806
G1 X150.961 Y99.531 E.09613
G1 X151.263 Y99.229 E.01594
G1 X150.14 Y99.229 E.04194
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.949 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.65 I-1.116 J.486 P1  F30000
G1 X151.738 Y101.793 Z2.65
G1 Z2.25
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X151.269 Y101.784 E.01754
G1 X151.269 Y128.228 E.98676
G1 X151.927 Y128.216 E.02458
G1 X151.927 Y101.793 E.986
G1 X152.804 Y101.793 E.03273
G1 X152.804 Y128.216 E.986
G1 X153.681 Y128.216 E.03273
G1 X153.681 Y101.793 E.986
G1 X154.558 Y101.793 E.03273
G1 X154.558 Y128.216 E.986
G1 X155.435 Y128.216 E.03273
G1 X155.435 Y101.793 E.986
G1 X156.312 Y101.793 E.03273
G1 X156.312 Y128.216 E.986
G1 X157.189 Y128.216 E.03273
G1 X157.189 Y101.793 E.986
G1 X157.731 Y101.784 E.02023
G1 X157.731 Y128.22 E.98649
G1 X157.378 Y128.216 E.01319
; WIPE_START
G1 F24000
G1 X157.731 Y128.22 E-.13434
G1 X157.731 Y126.574 E-.62566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.65 I-1.215 J.062 P1  F30000
G1 X157.95 Y130.877 Z2.65
G1 Z2.25
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X158.771 Y130.877 E.03065
G1 X158.771 Y128 E.10736
G1 X158.109 Y128 E.02471
G1 X158.109 Y125.123 E.10736
G1 X158.771 Y125.123 E.02471
G1 X158.771 Y122.246 E.10736
G1 X158.109 Y122.246 E.02471
G1 X158.109 Y119.369 E.10736
G1 X158.771 Y119.369 E.02471
G1 X158.771 Y116.492 E.10736
G1 X158.109 Y116.492 E.02471
G1 X158.109 Y113.615 E.10736
G1 X158.771 Y113.615 E.02471
G1 X158.771 Y110.738 E.10736
G1 X158.109 Y110.738 E.02471
G1 X158.109 Y107.86 E.10736
G1 X158.771 Y107.86 E.02471
G1 X158.771 Y104.983 E.10736
G1 X158.109 Y104.983 E.02471
G1 X158.109 Y102.106 E.10736
G1 X158.771 Y102.106 E.02471
G1 X158.771 Y99.229 E.10736
G1 X157.737 Y99.229 E.03859
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.15
; WIPE_START
G1 F24000
G1 X158.771 Y99.229 E-.39302
G1 X158.771 Y100.195 E-.36698
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
G3 Z2.65 I-.13 J-1.21 P1  F30000
G1 X154.5 Y100.652 Z2.65
G1 Z2.4
M73 P52 R8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.204 J.176 P1  F30000
G1 X107.913 Y129.356 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.104 E2.24627
G1 X156.883 Y129.356 E.15907
G3 X103.117 Y129.356 I-26.883 J-.599 E2.76245
G1 X107.853 Y129.356 E.15708
G1 X108.295 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.298 Y129.061 E.00297
G2 X151.705 Y128.964 I21.703 J-.309 E2.07926
G1 X157.285 Y128.964 E.17145
G3 X102.715 Y128.964 I-27.285 J-.212 E2.62091
G1 X108.235 Y128.964 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.298 Y129.061 E-.04372
G1 X108.317 Y129.836 E-.29479
G1 X108.398 Y130.916 E-.41134
G1 X108.401 Y130.942 E-.01015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.773 J-.94 P1  F30000
G1 X106.896 Y129.705 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F15476.087
G2 X113.756 Y144.244 I20.234 J-16.882 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.242 Y144.242 E.13603
G2 X147.325 Y143.027 I-17.095 J-16.33 E.054
G1 X152.078 Y132.79 F30000
G1 F15476.087
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.225 Y150.581 I-6.738 J-21.219 E.05401
G1 X124.774 Y150.583 F30000
G1 F15476.087
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 2.5
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z2.8 I1.105 J-.511 P1  F30000
G1 X108.807 Y128.302 Z2.8
G1 Z2.5
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.25
G1 F6760
G1 X109.033 Y128.522 E.01176
G2 X109.147 Y130.877 I30.896 J-.321 E.08802
G1 X109.86 Y130.877 E.02661
G1 X109.86 Y128 E.10736
G1 X101.229 Y128 E.32208
G1 X101.229 Y125.123 E.10736
G1 X109.86 Y125.123 E.32208
G1 X109.86 Y122.246 E.10736
G1 X101.229 Y122.246 E.32208
G1 X101.229 Y119.369 E.10736
G1 X109.86 Y119.369 E.32208
G1 X109.86 Y116.492 E.10736
G1 X101.229 Y116.492 E.32208
G1 X101.229 Y113.615 E.10736
G1 X109.86 Y113.615 E.32208
G1 X109.86 Y110.738 E.10736
G1 X101.229 Y110.738 E.32208
G1 X101.229 Y107.86 E.10736
G1 X109.86 Y107.86 E.32208
G1 X109.86 Y104.983 E.10736
G1 X101.229 Y104.983 E.32208
G1 X101.229 Y102.106 E.10736
G1 X109.86 Y102.106 E.32208
G1 X109.86 Y99.229 E.10736
G1 X108.737 Y99.229 E.04194
G1 X109.039 Y99.531 E.01594
G1 X109.039 Y101.477 E.07262
G1 X108.723 Y101.793 E.01665
G1 X102.277 Y101.793 E.24054
G1 X101.961 Y101.477 E.01665
G1 X101.961 Y99.531 E.07262
G1 X102.263 Y99.229 E.01594
G1 X101.229 Y99.229 E.03859
G1 X101.229 Y128.189 F30000
G1 F6760
G1 X101.229 Y130.877 E.10033
G1 X102.05 Y130.877 E.03065
G3 X101.956 Y128.541 I23.519 J-2.122 E.08729
G1 X102.189 Y128.302 E.01246
; WIPE_START
G1 F24000
G1 X101.956 Y128.541 E-.12692
G1 X102.023 Y130.205 E-.63308
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.9 I.051 J1.216 P1  F30000
G1 X150.14 Y128.189 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F6760
G1 X150.14 Y130.877 E.10033
G1 X150.853 Y130.877 E.02661
G2 X150.967 Y128.522 I-30.429 J-2.659 E.08802
G1 X151.193 Y128.302 E.01176
G1 X157.811 Y128.302 F30000
G1 F6760
G1 X158.044 Y128.541 E.01246
G3 X157.95 Y130.877 I-23.614 J.215 E.08729
G1 X158.771 Y130.877 E.03065
G1 X158.771 Y128 E.10736
G1 X150.14 Y128 E.32208
G1 X150.14 Y125.123 E.10736
G1 X158.771 Y125.123 E.32208
G1 X158.771 Y122.246 E.10736
G1 X150.14 Y122.246 E.32208
G1 X150.14 Y119.369 E.10736
G1 X158.771 Y119.369 E.32208
G1 X158.771 Y116.492 E.10736
G1 X150.14 Y116.492 E.32208
G1 X150.14 Y113.615 E.10736
G1 X158.771 Y113.615 E.32208
G1 X158.771 Y110.738 E.10736
G1 X150.14 Y110.738 E.32208
G1 X150.14 Y107.86 E.10736
G1 X158.771 Y107.86 E.32208
G1 X158.771 Y104.983 E.10736
G1 X150.14 Y104.983 E.32208
G1 X150.14 Y102.106 E.10736
G1 X158.771 Y102.106 E.32208
G1 X158.771 Y99.229 E.10736
G1 X157.737 Y99.229 E.03859
G1 X158.039 Y99.531 E.01594
G1 X158.039 Y101.477 E.07262
G1 X157.723 Y101.793 E.01665
G1 X151.277 Y101.793 E.24054
G1 X150.961 Y101.477 E.01665
G1 X150.961 Y99.531 E.07262
G1 X151.263 Y99.229 E.01594
G1 X150.14 Y99.229 E.04194
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
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
G3 Z2.9 I-.227 J1.196 P1  F30000
G1 X154.5 Y100.652 Z2.9
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6760
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6760
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z3
M73 P53 R8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6760
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6760
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.204 J.176 P1  F30000
G1 X107.913 Y129.356 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6760
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.101 E2.24646
G1 X156.883 Y129.356 E.15907
G3 X103.117 Y129.356 I-26.883 J-.602 E2.76226
G1 X107.853 Y129.356 E.15708
G1 X108.295 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6760
G1 X108.296 Y128.994 E.00091
G2 X151.705 Y128.964 I21.704 J-.241 E2.08142
G1 X157.285 Y128.964 E.17145
G3 X102.715 Y128.964 I-27.285 J-.214 E2.62078
G1 X108.235 Y128.964 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.296 Y128.994 E-.02569
G1 X108.317 Y129.836 E-.32025
G1 X108.398 Y130.916 E-.41134
G1 X108.399 Y130.923 E-.00272
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.766 J-.945 P1  F30000
G1 X106.896 Y129.705 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6760
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F6760
G2 X113.756 Y144.244 I20.234 J-16.882 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F6760
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z3
G1 Z2.6
G1 E.8 F1800
G1 F6760
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F6760
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S247.35
; CHANGE_LAYER
; Z_HEIGHT: 2.75
; LAYER_HEIGHT: 0.15
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z3 I.985 J-.715 P1  F30000
G1 X102.235 Y128.255 Z3
G1 Z2.75
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.25
G1 F4800
G1 X102.811 Y128.216 E.02152
G1 X102.811 Y101.793 E.986
G1 X103.688 Y101.793 E.03273
G1 X103.688 Y128.216 E.986
G1 X104.565 Y128.216 E.03273
G1 X104.565 Y101.793 E.986
G1 X105.442 Y101.793 E.03273
G1 X105.442 Y128.216 E.986
G1 X106.319 Y128.216 E.03273
G1 X106.319 Y101.793 E.986
G1 X107.196 Y101.793 E.03273
G1 X107.196 Y128.216 E.986
G1 X108.073 Y128.216 E.03273
G1 X108.073 Y101.793 E.986
G1 X108.723 Y101.793 E.02426
G1 X108.817 Y101.699 E.00495
; WIPE_START
G1 F24000
G1 X108.723 Y101.793 E-.05037
G1 X108.073 Y101.793 E-.24701
G1 X108.073 Y103.01 E-.46262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.15 I1.193 J.24 P1  F30000
G1 X108.817 Y99.309 Z3.15
G1 Z2.75
G1 E.8 F1800
G1 F4800
G1 X108.737 Y99.229 E.00424
G1 X108.95 Y99.229 E.00797
G2 X109.039 Y99.531 I.195 J.107 E.01304
G1 X109.039 Y101.477 E.07262
G1 X108.95 Y101.566 E.00467
G1 X108.95 Y128.441 E1.00288
G1 X109.033 Y128.522 E.00432
G2 X109.147 Y130.877 I32.313 J-.39 E.08801
G1 X109.827 Y130.877 E.02537
G1 X109.827 Y99.229 E1.18098
; WIPE_START
G1 F24000
G1 X109.827 Y101.229 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.15 I.251 J-1.191 P1  F30000
G1 X101.961 Y99.57 Z3.15
G1 Z2.75
G1 E.8 F1800
G1 F4800
G1 X102.263 Y99.229 E.01699
G1 X101.933 Y99.229 E.01231
G1 X101.933 Y130.877 E1.18097
G1 X101.229 Y130.877 E.02628
G1 X101.229 Y99.229 E1.18098
G1 X101.745 Y99.229 E.01925
; WIPE_START
G1 F24000
G1 X101.229 Y99.229 E-.19598
G1 X101.229 Y100.713 E-.56402
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.15 I.037 J1.216 P1  F30000
G1 X150.173 Y99.229 Z3.15
G1 Z2.75
G1 E.8 F1800
G1 F4800
G1 X150.173 Y130.877 E1.18098
G1 X150.853 Y130.877 E.02537
G2 X150.967 Y128.522 I-30.428 J-2.659 E.08802
G1 X151.05 Y128.441 E.00432
G1 X151.05 Y101.566 E1.00288
G1 X150.961 Y101.477 E.00467
G3 X151.05 Y99.229 I7.602 J-.827 E.08426
G1 X151.263 Y99.229 E.00797
G1 X151.183 Y99.309 E.00424
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.04314
G1 X151.05 Y99.229 E-.08116
G1 X151.05 Y99.443 E-.08116
G1 X150.961 Y99.531 E-.04752
G1 X150.961 Y100.865 E-.50702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.15 I.266 J1.187 P1  F30000
G1 X158.255 Y99.229 Z3.15
G1 Z2.75
G1 E.8 F1800
G1 F4800
G1 X158.771 Y99.229 E.01925
G1 X158.771 Y130.877 E1.18098
G1 X158.067 Y130.877 E.02628
M73 P54 R8
G1 X158.067 Y99.229 E1.18098
G1 X157.737 Y99.229 E.01231
G1 X158.039 Y99.57 E.01699
; WIPE_START
G1 F24000
G1 X157.737 Y99.229 E-.173
G1 X158.067 Y99.229 E-.1254
G1 X158.067 Y100.444 E-.46159
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.15 I-1.186 J-.274 P1  F30000
G1 X157.765 Y101.751 Z3.15
G1 Z2.75
G1 E.8 F1800
G1 F4800
G1 X157.189 Y101.793 E.02153
G1 X157.189 Y128.216 E.986
G1 X156.312 Y128.216 E.03273
G1 X156.312 Y101.793 E.986
G1 X155.435 Y101.793 E.03273
G1 X155.435 Y128.216 E.986
G1 X154.558 Y128.216 E.03273
G1 X154.558 Y101.793 E.986
G1 X153.681 Y101.793 E.03273
G1 X153.681 Y128.216 E.986
G1 X152.804 Y128.216 E.03273
G1 X152.804 Y101.793 E.986
G1 X151.927 Y101.793 E.03273
G1 X151.927 Y128.216 E.986
G1 X151.281 Y128.216 E.02411
G1 X151.185 Y128.309 E.005
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.05
; WIPE_START
G1 F24000
G1 X151.281 Y128.216 E-.05095
G1 X151.927 Y128.216 E-.24552
G1 X151.927 Y126.996 E-.46352
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
G3 Z3.15 I1.211 J.118 P1  F30000
G1 X154.5 Y100.652 Z3.15
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.204 J.176 P1  F30000
G1 X107.913 Y129.356 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.105 E2.24624
G1 X156.883 Y129.356 E.15907
G3 X103.117 Y129.356 I-26.883 J-.594 E2.76281
G1 X107.853 Y129.356 E.15708
G1 X108.295 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.317 Y129.836 E.02681
G2 X151.705 Y128.964 I21.681 J-1.087 E2.05553
G1 X157.285 Y128.964 E.17145
G3 X102.715 Y128.964 I-27.285 J-.213 E2.62087
G1 X108.235 Y128.964 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.317 Y129.836 E-.33287
G1 X108.398 Y130.916 E-.41134
G1 X108.403 Y130.957 E-.01578
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.778 J-.936 P1  F30000
G1 X106.896 Y129.705 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F15476.087
G2 X113.756 Y144.244 I20.234 J-16.882 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F15476.087
G3 X151.732 Y134.38 I-28.335 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15476.087
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F15476.087
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z3.2 I.985 J-.715 P1  F30000
G1 X102.235 Y128.255 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.25
G1 F4800
G1 X102.811 Y128.216 E.02152
G1 X102.811 Y101.793 E.986
G1 X103.688 Y101.793 E.03273
G1 X103.688 Y128.216 E.986
G1 X104.565 Y128.216 E.03273
G1 X104.565 Y101.793 E.986
G1 X105.442 Y101.793 E.03273
G1 X105.442 Y128.216 E.986
G1 X106.319 Y128.216 E.03273
G1 X106.319 Y101.793 E.986
G1 X107.196 Y101.793 E.03273
G1 X107.196 Y128.216 E.986
M73 P55 R8
G1 X108.073 Y128.216 E.03273
G1 X108.073 Y101.793 E.986
G1 X108.723 Y101.793 E.02426
G1 X108.817 Y101.699 E.00495
; WIPE_START
G1 F24000
G1 X108.723 Y101.793 E-.05037
G1 X108.073 Y101.793 E-.24701
G1 X108.073 Y103.01 E-.46262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.193 J.24 P1  F30000
G1 X108.817 Y99.309 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4800
G1 X108.737 Y99.229 E.00424
G1 X108.95 Y99.229 E.00797
G2 X109.039 Y99.531 I.195 J.107 E.01304
G1 X109.039 Y101.477 E.07262
G1 X108.95 Y101.566 E.00467
G1 X108.95 Y128.441 E1.00288
G1 X109.033 Y128.522 E.00432
G2 X109.147 Y130.877 I133.033 J-5.283 E.088
G1 X109.827 Y130.877 E.02537
G1 X109.827 Y99.229 E1.18098
; WIPE_START
G1 F24000
G1 X109.827 Y101.229 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.251 J-1.191 P1  F30000
G1 X101.961 Y99.57 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4800
G1 X102.263 Y99.229 E.01699
G1 X101.933 Y99.229 E.01231
G1 X101.933 Y130.877 E1.18097
G1 X101.229 Y130.877 E.02628
G1 X101.229 Y99.229 E1.18098
G1 X101.745 Y99.229 E.01925
; WIPE_START
G1 F24000
G1 X101.229 Y99.229 E-.19598
G1 X101.229 Y100.713 E-.56402
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.037 J1.216 P1  F30000
G1 X150.173 Y99.229 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4800
G1 X150.173 Y130.877 E1.18098
G1 X150.853 Y130.877 E.02537
G2 X150.967 Y128.522 I-30.428 J-2.659 E.08802
G1 X151.05 Y128.441 E.00432
G1 X151.05 Y101.566 E1.00288
G1 X150.961 Y101.477 E.00467
G3 X151.05 Y99.229 I7.602 J-.827 E.08426
G1 X151.263 Y99.229 E.00797
G1 X151.183 Y99.309 E.00424
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.04314
G1 X151.05 Y99.229 E-.08116
G1 X151.05 Y99.443 E-.08116
G1 X150.961 Y99.531 E-.04752
G1 X150.961 Y100.865 E-.50702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.266 J1.187 P1  F30000
G1 X158.255 Y99.229 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4800
G1 X158.771 Y99.229 E.01925
G1 X158.771 Y130.877 E1.18098
G1 X158.067 Y130.877 E.02628
G1 X158.067 Y99.229 E1.18098
G1 X157.737 Y99.229 E.01231
G1 X158.039 Y99.57 E.01699
; WIPE_START
G1 F24000
G1 X157.737 Y99.229 E-.173
G1 X158.067 Y99.229 E-.1254
G1 X158.067 Y100.444 E-.46159
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.186 J-.274 P1  F30000
G1 X157.765 Y101.751 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4800
G1 X157.189 Y101.793 E.02153
G1 X157.189 Y128.216 E.986
G1 X156.312 Y128.216 E.03273
G1 X156.312 Y101.793 E.986
G1 X155.435 Y101.793 E.03273
G1 X155.435 Y128.216 E.986
G1 X154.558 Y128.216 E.03273
G1 X154.558 Y101.793 E.986
G1 X153.681 Y101.793 E.03273
G1 X153.681 Y128.216 E.986
G1 X152.804 Y128.216 E.03273
G1 X152.804 Y101.793 E.986
G1 X151.927 Y101.793 E.03273
G1 X151.927 Y128.216 E.986
G1 X151.281 Y128.216 E.02411
G1 X151.185 Y128.309 E.005
; WIPE_START
G1 F24000
G1 X151.281 Y128.216 E-.05095
G1 X151.927 Y128.216 E-.24552
G1 X151.927 Y126.996 E-.46352
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.211 J.118 P1  F30000
G1 X154.5 Y100.652 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.204 J.176 P1  F30000
G1 X107.913 Y129.356 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.105 E2.24624
G1 X156.883 Y129.356 E.15907
G3 X103.117 Y129.356 I-26.883 J-.595 E2.76273
G1 X107.853 Y129.356 E.15708
G1 X108.295 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.317 Y129.836 E.02681
G2 X151.705 Y128.964 I21.681 J-1.087 E2.05553
G1 X157.285 Y128.964 E.17145
M73 P56 R8
G3 X102.715 Y128.964 I-27.285 J-.214 E2.62078
G1 X108.235 Y128.964 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.317 Y129.836 E-.33287
G1 X108.398 Y130.916 E-.41134
G1 X108.403 Y130.957 E-.01578
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.778 J-.936 P1  F30000
G1 X106.896 Y129.705 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03423
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F15476.087
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.446 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.964 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F15476.087
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-7.374 J-23.392 E.05401
G1 X124.774 Y150.583 F30000
G1 F15476.087
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z3.4 I1.019 J.665 P1  F30000
G1 X154.5 Y100.652 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4244
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4244
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4244
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4244
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.204 J.176 P1  F30000
G1 X107.913 Y129.356 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4244
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.105 E2.24624
G1 X156.883 Y129.356 E.15907
G3 X103.117 Y129.356 I-26.883 J-.602 E2.76226
G1 X107.853 Y129.356 E.15708
G1 X108.295 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4244
G1 X108.317 Y129.836 E.02681
G2 X151.705 Y128.964 I21.681 J-1.087 E2.05553
G1 X157.285 Y128.964 E.17145
G3 X102.715 Y128.964 I-27.285 J-.214 E2.62078
G1 X108.235 Y128.964 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.317 Y129.836 E-.33287
G1 X108.398 Y130.916 E-.41134
G1 X108.403 Y130.957 E-.01578
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.778 J-.936 P1  F30000
G1 X106.896 Y129.705 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4244
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F4244
G2 X113.756 Y144.244 I20.234 J-16.882 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
M73 P56 R7
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F4244
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.215 J-1.796 E.03423
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
M73 P57 R7
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F4244
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F4244
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S229.5
; CHANGE_LAYER
; Z_HEIGHT: 3.25714
; LAYER_HEIGHT: 0.0571427
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z3.6 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z3.6
G1 Z3.257
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.86 Y130.877 E.02726
G1 X109.86 Y128 E.10997
G1 X109.039 Y128 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y122.246 E.10997
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y113.615 E.10997
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y102.106 E.10997
G1 X109.86 Y102.106 E.03141
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.657 I.123 J-1.211 P1  F30000
G1 X101.229 Y99.229 Z3.657
G1 Z3.257
G1 E.8 F1800
G1 F9000
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y102.106 E.09842
G1 X101.229 Y102.106 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y107.86 E.10997
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.962 Y128.766 E.02926
G2 X102.05 Y130.877 I21.351 J.159 E.08081
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.001 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.657 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z3.657
G1 Z3.257
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.02726
G2 X150.961 Y128 I-61.906 J-3.782 E.11006
G1 X150.14 Y128 E.03141
G1 X150.14 Y125.123 E.10997
G1 X150.961 Y125.123 E.03141
G1 X150.961 Y122.246 E.10997
G1 X150.14 Y122.246 E.03141
G1 X150.14 Y119.369 E.10997
G1 X150.961 Y119.369 E.03141
G1 X150.961 Y116.492 E.10997
G1 X150.14 Y116.492 E.03141
G1 X150.14 Y113.615 E.10997
G1 X150.961 Y113.615 E.03141
G1 X150.961 Y110.738 E.10997
G1 X150.14 Y110.738 E.03141
G1 X150.14 Y107.86 E.10997
G1 X150.961 Y107.86 E.03141
G1 X150.961 Y104.983 E.10997
G1 X150.14 Y104.983 E.03141
G1 X150.14 Y102.106 E.10997
G1 X150.961 Y102.106 E.03141
G1 X150.961 Y99.531 E.09842
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.657 I.134 J1.21 P1  F30000
G1 X157.737 Y99.229 Z3.657
G1 Z3.257
G1 E.8 F1800
G1 F9000
G1 X158.771 Y99.229 E.03953
G1 X158.771 Y102.106 E.10997
G1 X158.039 Y102.106 E.02799
G1 X158.039 Y104.983 E.10997
G1 X158.771 Y104.983 E.02799
G1 X158.771 Y107.86 E.10997
G1 X158.039 Y107.86 E.02799
G1 X158.039 Y110.738 E.10997
G1 X158.771 Y110.738 E.02799
G1 X158.771 Y113.615 E.10997
G1 X158.039 Y113.615 E.02799
G1 X158.039 Y116.492 E.10997
G1 X158.771 Y116.492 E.02799
G1 X158.771 Y119.369 E.10997
G1 X158.039 Y119.369 E.02799
G1 X158.039 Y122.246 E.10997
G1 X158.771 Y122.246 E.02799
G1 X158.771 Y125.123 E.10997
G1 X158.039 Y125.123 E.02799
G1 X158.039 Y128 E.10997
G1 X158.771 Y128 E.02799
G1 X158.771 Y130.877 E.10997
G1 X157.95 Y130.877 E.03139
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.142857
; WIPE_START
G1 F24000
G1 X158.771 Y130.877 E-.3121
G1 X158.771 Y129.698 E-.4479
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
G3 Z3.657 I.562 J-1.079 P1  F30000
G1 X103.102 Y100.707 Z3.657
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X103.102 Y100.356 E.01163
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y101.454 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X107.898 Y128.554 E.89896
M106 S229.5
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X107.902 Y128.937 E.01269
G2 X152.102 Y128.554 I22.1 J-.185 E2.30358
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X152.102 Y101.454 E.89896
M106 S229.5
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X152.102 Y100.356 E.03642
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y101.454 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X156.898 Y128.554 E.89896
M106 S229.5
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X156.893 Y128.937 E.01269
G3 X103.102 Y128.554 I-26.896 J-.186 E2.80328
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X103.102 Y101.454 E.89896
M106 S229.5
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X103.102 Y100.767 E.0228
G1 X102.71 Y100.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y99.964 E.02282
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.454 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X108.29 Y128.554 E.89896
M106 S229.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.294 Y128.923 E.01134
G2 X151.71 Y128.554 I21.708 J-.171 E2.09639
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X151.71 Y101.454 E.89896
M106 S229.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y99.964 E.04578
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.454 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X157.29 Y128.554 E.89896
M106 S229.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.286 Y128.923 E.01134
G3 X102.71 Y128.554 I-27.288 J-.173 E2.63495
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X102.71 Y101.454 E.89896
M106 S229.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y100.767 E.02112
M204 S10000
G1 X103.436 Y100.52 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.420431
M106 S255
G1 F3000
G1 X103.436 Y128.753 E.86852
G1 X103.455 Y129.526 E.02378
G1 X103.813 Y129.526 E.01102
G1 X103.813 Y100.69 E.88707
G1 X104.191 Y100.69 E.01161
G1 X104.191 Y129.526 E.88707
G1 X104.568 Y129.526 E.01161
G1 X104.568 Y100.69 E.88707
G1 X104.946 Y100.69 E.01161
G1 X104.946 Y129.526 E.88707
G1 X105.323 Y129.526 E.01161
G1 X105.323 Y100.69 E.88707
G1 X105.701 Y100.69 E.01161
G1 X105.701 Y129.526 E.88707
G1 X106.078 Y129.526 E.01161
G1 X106.078 Y100.69 E.88707
G1 X106.456 Y100.69 E.01161
G1 X106.456 Y129.526 E.88707
G1 X106.833 Y129.526 E.01161
G1 X106.833 Y100.69 E.88707
G1 X107.211 Y100.69 E.01161
G1 X107.211 Y129.695 E.89229
M106 S229.5
G1 X106.683 Y129.918 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X105.054 Y129.918 E.05401
G1 X103.582 Y131.39 E.06907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I23.12 J-14.38 E.19098
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F15476.087
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
M73 P58 R7
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.153 J-18.099 E.054
G1 X152.078 Y132.79 F30000
G1 F15476.087
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.856 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.946 Y129.918 E.06907
G1 X153.317 Y129.918 E.05401
G1 X156.565 Y129.695 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.420431
M106 S255
G1 F3000
G1 X156.565 Y100.69 E.89229
G1 X156.187 Y100.69 E.01161
G1 X156.187 Y129.526 E.88707
G1 X155.809 Y129.526 E.01161
G1 X155.809 Y100.69 E.88707
G1 X155.432 Y100.69 E.01161
G1 X155.432 Y129.526 E.88707
G1 X155.054 Y129.526 E.01161
G1 X155.054 Y100.69 E.88707
G1 X154.677 Y100.69 E.01161
G1 X154.677 Y129.526 E.88707
G1 X154.299 Y129.526 E.01161
G1 X154.299 Y100.69 E.88707
G1 X153.922 Y100.69 E.01161
G1 X153.922 Y129.526 E.88707
G1 X153.544 Y129.526 E.01161
G1 X153.544 Y100.69 E.88707
G1 X153.167 Y100.69 E.01161
G1 X153.167 Y129.526 E.88707
G1 X152.789 Y129.526 E.01161
G1 X152.789 Y100.52 E.89229
M106 S229.5
; WIPE_START
G1 F24000
G1 X152.789 Y102.52 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.172 J-.327 P1  F30000
G1 X138.469 Y153.916 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-7.235 J-22.893 E.05401
G1 X124.774 Y150.583 F30000
G1 F15476.087
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3.51429
; LAYER_HEIGHT: 0.114286
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z3.8 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z3.8
G1 Z3.514
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.86 Y130.877 E.02726
G1 X109.86 Y128 E.10997
G1 X109.039 Y128 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y122.246 E.10997
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
M73 P59 R7
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y113.615 E.10997
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y102.106 E.10997
G1 X109.86 Y102.106 E.03141
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.914 I.123 J-1.211 P1  F30000
G1 X101.229 Y99.229 Z3.914
G1 Z3.514
G1 E.8 F1800
G1 F9000
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y102.106 E.09842
G1 X101.229 Y102.106 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y107.86 E.10997
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.961 Y128.758 E.02896
G2 X102.05 Y130.877 I41.86 J-.697 E.08109
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.001 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.914 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z3.914
G1 Z3.514
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.02726
G2 X150.961 Y128 I-61.906 J-3.782 E.11006
G1 X150.14 Y128 E.03141
G1 X150.14 Y125.123 E.10997
G1 X150.961 Y125.123 E.03141
G1 X150.961 Y122.246 E.10997
G1 X150.14 Y122.246 E.03141
G1 X150.14 Y119.369 E.10997
G1 X150.961 Y119.369 E.03141
G1 X150.961 Y116.492 E.10997
G1 X150.14 Y116.492 E.03141
G1 X150.14 Y113.615 E.10997
G1 X150.961 Y113.615 E.03141
G1 X150.961 Y110.738 E.10997
G1 X150.14 Y110.738 E.03141
G1 X150.14 Y107.86 E.10997
G1 X150.961 Y107.86 E.03141
G1 X150.961 Y104.983 E.10997
G1 X150.14 Y104.983 E.03141
G1 X150.14 Y102.106 E.10997
G1 X150.961 Y102.106 E.03141
G1 X150.961 Y99.531 E.09842
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.914 I.134 J1.21 P1  F30000
G1 X157.737 Y99.229 Z3.914
G1 Z3.514
G1 E.8 F1800
G1 F9000
G1 X158.771 Y99.229 E.03953
G1 X158.771 Y102.106 E.10997
G1 X158.039 Y102.106 E.02799
G1 X158.039 Y104.983 E.10997
G1 X158.771 Y104.983 E.02799
G1 X158.771 Y107.86 E.10997
G1 X158.039 Y107.86 E.02799
G1 X158.039 Y110.738 E.10997
G1 X158.771 Y110.738 E.02799
G1 X158.771 Y113.615 E.10997
G1 X158.039 Y113.615 E.02799
G1 X158.039 Y116.492 E.10997
G1 X158.771 Y116.492 E.02799
G1 X158.771 Y119.369 E.10997
G1 X158.039 Y119.369 E.02799
G1 X158.039 Y122.246 E.10997
G1 X158.771 Y122.246 E.02799
G1 X158.771 Y125.123 E.10997
G1 X158.039 Y125.123 E.02799
G1 X158.039 Y128 E.10997
G1 X158.771 Y128 E.02799
G1 X158.771 Y130.877 E.10997
G1 X157.95 Y130.877 E.03139
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0857141
; WIPE_START
G1 F24000
G1 X158.771 Y130.877 E-.3121
G1 X158.771 Y129.698 E-.4479
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
G3 Z3.914 I.567 J-1.077 P1  F30000
G1 X103.102 Y100.356 Z3.914
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F14731
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30239
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J-.001 E2.80303
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09517
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.63401
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.214 J.086 P1  F30000
G1 X106.752 Y128.764 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F14731
G1 X106.752 Y101.503 E.83767
G1 X104.248 Y101.503 E.07692
G1 X104.248 Y128.732 E.8367
G1 X104.262 Y129.286 E.01702
G1 X106.764 Y129.286 E.07689
G1 X106.753 Y128.824 E.0142
G1 X107.506 Y128.035 F30000
G1 F14731
G1 X107.506 Y100.748 E.83843
G1 X103.494 Y100.748 E.12327
G1 X103.494 Y128.742 E.86016
G1 X103.527 Y130.04 E.03992
G1 X107.546 Y130.04 E.1235
G3 X107.506 Y128.095 I38.716 J-1.769 E.05981
G1 X107.129 Y128.035 F30000
G1 F14731
G1 X107.129 Y101.126 E.82684
G1 X103.871 Y101.126 E.10009
G1 X103.871 Y128.737 E.84843
G1 X103.894 Y129.663 E.02847
G1 X107.151 Y129.663 E.10007
G3 X107.129 Y128.095 I31.738 J-1.234 E.04821
G1 X106.375 Y128.035 F30000
G1 F14731
G1 X106.375 Y101.88 E.80367
G1 X104.625 Y101.88 E.05375
G1 X104.63 Y128.909 E.83054
G1 X106.378 Y128.909 E.05371
G1 X106.375 Y128.095 E.02503
G1 X105.998 Y128.532 F30000
G1 F14731
G1 X105.998 Y102.257 E.80737
G1 X105.002 Y102.257 E.03058
G1 X105.002 Y128.532 E.80737
G1 X105.938 Y128.532 E.02873
G1 X105.654 Y128.189 F30000
; LINE_WIDTH: 0.351907
G1 F14731
G1 X105.654 Y102.6 E.6443
M73 P60 R7
G1 X105.346 Y102.6 E.00778
G1 X105.346 Y128.189 E.6443
G1 X105.594 Y128.189 E.00627
G1 X106.168 Y130.433 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14731
G1 X104.54 Y130.433 E.05401
G1 X103.582 Y131.39 E.04492
G2 X103.71 Y132.414 I10.321 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F14731
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.153 J-18.099 E.054
G1 X152.078 Y132.79 F30000
G1 F14731
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.176 J-1.791 E.03424
G1 X155.46 Y130.433 E.04492
G1 X153.832 Y130.433 E.05401
G1 X154.346 Y128.189 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F14731
G1 X154.654 Y128.189 E.00778
G1 X154.654 Y102.6 E.6443
G1 X154.346 Y102.6 E.00778
G1 X154.346 Y128.129 E.64279
G1 X154.002 Y128.532 F30000
; LINE_WIDTH: 0.419999
G1 F14731
G1 X154.998 Y128.532 E.03058
G1 X154.998 Y102.257 E.80737
G1 X154.002 Y102.257 E.03058
G1 X154.002 Y128.472 E.80553
G1 X153.625 Y128.764 F30000
G1 F14731
G1 X153.622 Y128.909 E.00445
G1 X155.37 Y128.909 E.05371
G1 X155.375 Y101.88 E.83054
G1 X153.625 Y101.88 E.05375
G1 X153.625 Y128.704 E.82424
G1 X153.248 Y128.764 F30000
G1 F14731
G1 X153.236 Y129.286 E.01605
G1 X155.738 Y129.286 E.07689
G1 X155.752 Y128.732 E.01702
G1 X155.752 Y101.503 E.8367
G1 X153.248 Y101.503 E.07692
G1 X153.248 Y128.704 E.83583
G1 X152.871 Y128.764 F30000
G1 F14731
G1 X152.849 Y129.663 E.02764
G1 X156.106 Y129.663 E.10007
G1 X156.129 Y128.737 E.02847
G1 X156.129 Y101.126 E.84843
G1 X152.871 Y101.126 E.10009
G1 X152.871 Y128.704 E.84742
G1 X152.494 Y128.764 F30000
G1 F14731
G1 X152.494 Y128.769 E.00014
G2 X152.466 Y130.04 I33.337 J1.382 E.03908
G1 X156.473 Y130.04 E.12315
G1 X156.506 Y128.742 E.03992
G1 X156.506 Y100.748 E.86016
G1 X152.494 Y100.748 E.12327
G1 X152.494 Y128.704 E.859
; WIPE_START
G1 F24000
G1 X152.494 Y126.704 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.986 J-.713 P1  F30000
G1 X135.226 Y150.583 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14731
G2 X136.794 Y150.146 I-3.6 J-15.927 E.05402
G1 X139.993 Y153.345 E.15007
G3 X138.469 Y153.916 I-6.489 J-14.985 E.05403
G1 X124.774 Y150.583 F30000
G1 F14731
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 3.77143
; LAYER_HEIGHT: 0.171429
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z4 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z4
G1 Z3.771
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.86 Y130.877 E.02726
G1 X109.86 Y128 E.10997
G1 X109.039 Y128 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y122.246 E.10997
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y113.615 E.10997
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y102.106 E.10997
G1 X109.86 Y102.106 E.03141
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.171 I.123 J-1.211 P1  F30000
G1 X101.229 Y99.229 Z4.171
G1 Z3.771
G1 E.8 F1800
G1 F9000
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y102.106 E.09842
G1 X101.229 Y102.106 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y107.86 E.10997
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.961 Y128.758 E.02896
G2 X102.05 Y130.877 I41.86 J-.697 E.08109
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.001 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.171 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z4.171
G1 Z3.771
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.02726
G2 X150.961 Y128 I-61.906 J-3.782 E.11006
G1 X150.14 Y128 E.03141
G1 X150.14 Y125.123 E.10997
G1 X150.961 Y125.123 E.03141
G1 X150.961 Y122.246 E.10997
G1 X150.14 Y122.246 E.03141
G1 X150.14 Y119.369 E.10997
G1 X150.961 Y119.369 E.03141
G1 X150.961 Y116.492 E.10997
G1 X150.14 Y116.492 E.03141
G1 X150.14 Y113.615 E.10997
G1 X150.961 Y113.615 E.03141
G1 X150.961 Y110.738 E.10997
G1 X150.14 Y110.738 E.03141
G1 X150.14 Y107.86 E.10997
G1 X150.961 Y107.86 E.03141
G1 X150.961 Y104.983 E.10997
G1 X150.14 Y104.983 E.03141
G1 X150.14 Y102.106 E.10997
G1 X150.961 Y102.106 E.03141
G1 X150.961 Y99.531 E.09842
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.171 I.134 J1.21 P1  F30000
G1 X157.737 Y99.229 Z4.171
G1 Z3.771
G1 E.8 F1800
G1 F9000
G1 X158.771 Y99.229 E.03953
G1 X158.771 Y102.106 E.10997
G1 X158.039 Y102.106 E.02799
G1 X158.039 Y104.983 E.10997
G1 X158.771 Y104.983 E.02799
G1 X158.771 Y107.86 E.10997
G1 X158.039 Y107.86 E.02799
G1 X158.039 Y110.738 E.10997
G1 X158.771 Y110.738 E.02799
G1 X158.771 Y113.615 E.10997
G1 X158.039 Y113.615 E.02799
G1 X158.039 Y116.492 E.10997
G1 X158.771 Y116.492 E.02799
G1 X158.771 Y119.369 E.10997
G1 X158.039 Y119.369 E.02799
G1 X158.039 Y122.246 E.10997
G1 X158.771 Y122.246 E.02799
G1 X158.771 Y125.123 E.10997
G1 X158.039 Y125.123 E.02799
G1 X158.039 Y128 E.10997
G1 X158.771 Y128 E.02799
G1 X158.771 Y130.877 E.10997
G1 X157.95 Y130.877 E.03139
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0285714
; WIPE_START
G1 F24000
G1 X158.771 Y130.877 E-.3121
G1 X158.771 Y129.698 E-.4479
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
G3 Z4.171 I.567 J-1.077 P1  F30000
G1 X103.102 Y100.356 Z4.171
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F14732
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30238
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J-.001 E2.80303
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09516
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.63401
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.214 J.086 P1  F30000
G1 X106.752 Y128.764 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F14732
G1 X106.752 Y101.503 E.83767
G1 X104.248 Y101.503 E.07692
G1 X104.248 Y128.732 E.8367
G1 X104.262 Y129.286 E.01702
G1 X106.764 Y129.286 E.07689
G1 X106.753 Y128.824 E.0142
G1 X107.506 Y128.764 F30000
G1 F14732
G1 X107.506 Y100.748 E.86085
G1 X103.494 Y100.748 E.12327
G1 X103.494 Y128.742 E.86016
G1 X103.527 Y130.04 E.03992
G1 X107.534 Y130.04 E.12315
G2 X107.507 Y128.824 I-32.006 J.102 E.03738
G1 X107.129 Y128.035 F30000
G1 F14732
G1 X107.129 Y101.126 E.82684
G1 X103.871 Y101.126 E.10009
G1 X103.871 Y128.737 E.84843
G1 X103.894 Y129.663 E.02847
G1 X107.151 Y129.663 E.10007
G3 X107.129 Y128.095 I31.738 J-1.234 E.04821
G1 X106.375 Y128.035 F30000
M73 P61 R7
G1 F14732
G1 X106.375 Y101.88 E.80367
G1 X104.625 Y101.88 E.05375
G1 X104.63 Y128.909 E.83054
G1 X106.378 Y128.909 E.05371
G1 X106.375 Y128.095 E.02503
G1 X105.998 Y128.532 F30000
G1 F14732
G1 X105.998 Y102.257 E.80737
G1 X105.002 Y102.257 E.03058
G1 X105.002 Y128.532 E.80737
G1 X105.938 Y128.532 E.02873
G1 X105.654 Y128.189 F30000
; LINE_WIDTH: 0.351907
G1 F14732
G1 X105.654 Y102.6 E.6443
G1 X105.346 Y102.6 E.00778
G1 X105.346 Y128.189 E.6443
G1 X105.594 Y128.189 E.00627
G1 X106.168 Y130.433 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14732
G1 X104.54 Y130.433 E.05401
G1 X103.582 Y131.39 E.04492
G2 X103.71 Y132.414 I10.321 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I23.12 J-14.38 E.19098
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F14732
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.153 J-18.099 E.054
G1 X152.078 Y132.79 F30000
G1 F14732
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.856 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.182 J-1.792 E.03424
G1 X155.46 Y130.433 E.04492
G1 X153.832 Y130.433 E.05401
G1 X154.346 Y128.189 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F14732
G1 X154.654 Y128.189 E.00778
G1 X154.654 Y102.6 E.6443
G1 X154.346 Y102.6 E.00778
G1 X154.346 Y128.129 E.64279
G1 X154.002 Y128.532 F30000
; LINE_WIDTH: 0.419999
G1 F14732
G1 X154.998 Y128.532 E.03058
G1 X154.998 Y102.257 E.80737
G1 X154.002 Y102.257 E.03058
G1 X154.002 Y128.472 E.80553
G1 X153.625 Y128.764 F30000
G1 F14732
G1 X153.622 Y128.909 E.00445
G1 X155.37 Y128.909 E.05371
G1 X155.375 Y101.88 E.83054
G1 X153.625 Y101.88 E.05375
G1 X153.625 Y128.704 E.82424
G1 X153.248 Y128.764 F30000
G1 F14732
G1 X153.236 Y129.286 E.01605
G1 X155.738 Y129.286 E.07689
G1 X155.752 Y128.732 E.01702
G1 X155.752 Y101.503 E.8367
G1 X153.248 Y101.503 E.07692
G1 X153.248 Y128.704 E.83583
G1 X152.871 Y128.764 F30000
G1 F14732
G1 X152.849 Y129.663 E.02764
G1 X156.106 Y129.663 E.10007
G1 X156.129 Y128.737 E.02847
G1 X156.129 Y101.126 E.84843
G1 X152.871 Y101.126 E.10009
G1 X152.871 Y128.704 E.84742
G1 X152.494 Y128.764 F30000
G1 F14732
G1 X152.494 Y128.769 E.00014
G2 X152.466 Y130.04 I33.337 J1.382 E.03908
G1 X156.473 Y130.04 E.12315
G1 X156.506 Y128.742 E.03992
G1 X156.506 Y100.748 E.86016
G1 X152.494 Y100.748 E.12327
G1 X152.494 Y128.704 E.859
; WIPE_START
G1 F24000
G1 X152.494 Y126.704 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.986 J-.713 P1  F30000
G1 X135.226 Y150.583 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14732
G2 X136.706 Y150.173 I-3.374 J-15.038 E.05099
G1 X136.794 Y150.146 E.00303
G1 X139.993 Y153.345 E.15007
G3 X138.469 Y153.916 I-6.489 J-14.985 E.05403
G1 X124.774 Y150.583 F30000
G1 F14732
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z4.2 I1.157 J-.377 P1  F30000
G1 X103.102 Y100.356 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11257
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30237
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J-.001 E2.80303
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11257
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.63401
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.216 J.041 P1  F30000
G1 X105.654 Y128.162 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F11257
G1 X105.654 Y102.6 E.64362
G1 X105.346 Y102.6 E.00778
G1 X105.346 Y128.162 E.64362
G1 X105.594 Y128.162 E.00627
G1 X105.998 Y128.505 F30000
; LINE_WIDTH: 0.419999
G1 F11257
G1 X105.998 Y102.257 E.80654
G1 X105.002 Y102.257 E.03058
G1 X105.002 Y128.505 E.80654
G1 X105.938 Y128.505 E.02873
G1 X106.375 Y128.008 F30000
G1 F11257
G1 X106.375 Y101.88 E.80284
G1 X104.625 Y101.88 E.05375
G1 X104.629 Y128.882 E.82971
G1 X106.377 Y128.882 E.05371
G1 X106.375 Y128.068 E.02503
G1 X106.752 Y128.008 F30000
G1 F11257
G1 X106.752 Y101.503 E.81443
G1 X104.248 Y101.503 E.07692
G1 X104.248 Y128.732 E.8367
G1 X104.261 Y129.259 E.0162
G1 X106.764 Y129.259 E.07689
G1 X106.752 Y128.068 E.03662
G1 X107.129 Y128.008 F30000
G1 F11257
G1 X107.129 Y101.126 E.82601
G1 X103.871 Y101.126 E.10009
G1 X103.871 Y128.737 E.84843
G1 X103.894 Y129.636 E.02764
G1 X107.15 Y129.636 E.10007
G3 X107.129 Y128.068 I31.73 J-1.221 E.04821
G1 X107.506 Y128.008 F30000
G1 F11257
G1 X107.506 Y100.748 E.8376
G1 X103.494 Y100.748 E.12327
M73 P62 R7
G1 X103.494 Y128.742 E.86016
G1 X103.526 Y130.014 E.03909
M73 P62 R6
G1 X107.533 Y130.014 E.12314
G1 X107.533 Y129.867 E.00451
G3 X107.506 Y128.068 I36.163 J-1.451 E.05529
G1 X106.195 Y130.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11257
G1 X104.567 Y130.406 E.05401
G1 X103.582 Y131.39 E.04619
G2 X103.71 Y132.414 I10.321 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I23.12 J-14.38 E.19098
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.991 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F11257
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F11257
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X155.433 Y130.406 E.04619
G1 X153.805 Y130.406 E.05401
G1 X154.346 Y128.162 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F11257
G1 X154.654 Y128.162 E.00778
G1 X154.654 Y102.6 E.64362
G1 X154.346 Y102.6 E.00778
G1 X154.346 Y128.102 E.64211
G1 X154.002 Y128.505 F30000
; LINE_WIDTH: 0.419999
G1 F11257
G1 X154.998 Y128.505 E.03058
G1 X154.998 Y102.257 E.80654
G1 X154.002 Y102.257 E.03058
G1 X154.002 Y128.445 E.8047
G1 X153.625 Y128.764 F30000
G1 F11257
G1 X153.623 Y128.882 E.00363
G1 X155.371 Y128.882 E.05371
G1 X155.375 Y101.88 E.82971
G1 X153.625 Y101.88 E.05375
G1 X153.625 Y128.704 E.82424
G1 X153.248 Y128.764 F30000
G1 F11257
G1 X153.236 Y129.259 E.01522
G1 X155.739 Y129.259 E.07689
G1 X155.752 Y128.732 E.0162
G1 X155.752 Y101.503 E.8367
G1 X153.248 Y101.503 E.07692
G1 X153.248 Y128.704 E.83583
G1 X152.871 Y128.764 F30000
G1 F11257
G1 X152.85 Y129.636 E.02681
G1 X156.106 Y129.636 E.10007
G1 X156.129 Y128.737 E.02764
G1 X156.129 Y101.126 E.84843
G1 X152.871 Y101.126 E.10009
G1 X152.871 Y128.704 E.84742
G1 X152.494 Y128.764 F30000
G1 F11257
G1 X152.494 Y128.769 E.00014
G2 X152.467 Y130.014 I25.224 J1.179 E.03825
G1 X156.474 Y130.014 E.12314
G1 X156.506 Y128.742 E.03909
G1 X156.506 Y100.748 E.86016
G1 X152.494 Y100.748 E.12327
G1 X152.494 Y128.704 E.859
; WIPE_START
G1 F24000
G1 X152.494 Y126.704 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.986 J-.713 P1  F30000
G1 X135.226 Y150.583 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11257
G2 X136.794 Y150.146 I-3.6 J-15.927 E.05402
G1 X139.993 Y153.345 E.15007
G3 X138.469 Y153.916 I-6.489 J-14.985 E.05403
G1 X124.774 Y150.583 F30000
G1 F11257
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 4.02857
; LAYER_HEIGHT: 0.0285716
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z4.4 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z4.4
G1 Z4.029
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.86 Y130.877 E.02726
G1 X109.86 Y128 E.10997
G1 X109.039 Y128 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y122.246 E.10997
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y113.615 E.10997
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y102.106 E.10997
G1 X109.86 Y102.106 E.03141
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.429 I.123 J-1.211 P1  F30000
G1 X101.229 Y99.229 Z4.429
G1 Z4.029
G1 E.8 F1800
G1 F9000
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y102.106 E.09842
G1 X101.229 Y102.106 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y107.86 E.10997
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.961 Y128.758 E.02896
G2 X102.05 Y130.877 I41.86 J-.697 E.08109
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.001 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.429 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z4.429
G1 Z4.029
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.02726
G2 X150.961 Y128 I-61.906 J-3.782 E.11006
G1 X150.14 Y128 E.03141
G1 X150.14 Y125.123 E.10997
G1 X150.961 Y125.123 E.03141
G1 X150.961 Y122.246 E.10997
G1 X150.14 Y122.246 E.03141
G1 X150.14 Y119.369 E.10997
G1 X150.961 Y119.369 E.03141
G1 X150.961 Y116.492 E.10997
G1 X150.14 Y116.492 E.03141
G1 X150.14 Y113.615 E.10997
G1 X150.961 Y113.615 E.03141
G1 X150.961 Y110.738 E.10997
G1 X150.14 Y110.738 E.03141
G1 X150.14 Y107.86 E.10997
G1 X150.961 Y107.86 E.03141
G1 X150.961 Y104.983 E.10997
G1 X150.14 Y104.983 E.03141
G1 X150.14 Y102.106 E.10997
G1 X150.961 Y102.106 E.03141
G1 X150.961 Y99.531 E.09842
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.429 I.134 J1.21 P1  F30000
G1 X157.737 Y99.229 Z4.429
G1 Z4.029
G1 E.8 F1800
G1 F9000
G1 X158.771 Y99.229 E.03953
G1 X158.771 Y102.106 E.10997
G1 X158.039 Y102.106 E.02799
G1 X158.039 Y104.983 E.10997
G1 X158.771 Y104.983 E.02799
G1 X158.771 Y107.86 E.10997
G1 X158.039 Y107.86 E.02799
G1 X158.039 Y110.738 E.10997
G1 X158.771 Y110.738 E.02799
G1 X158.771 Y113.615 E.10997
G1 X158.039 Y113.615 E.02799
G1 X158.039 Y116.492 E.10997
G1 X158.771 Y116.492 E.02799
G1 X158.771 Y119.369 E.10997
G1 X158.039 Y119.369 E.02799
G1 X158.039 Y122.246 E.10997
G1 X158.771 Y122.246 E.02799
G1 X158.771 Y125.123 E.10997
G1 X158.039 Y125.123 E.02799
G1 X158.039 Y128 E.10997
G1 X158.771 Y128 E.02799
G1 X158.771 Y130.877 E.10997
G1 X157.95 Y130.877 E.03139
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.171428
; WIPE_START
G1 F24000
G1 X158.771 Y130.877 E-.3121
G1 X158.771 Y129.698 E-.4479
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
G3 Z4.429 I.567 J-1.077 P1  F30000
G1 X103.102 Y100.356 Z4.429
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F14716
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30237
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J.004 E2.80335
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
M73 P63 R6
G3 X102.71 Y128.752 I-27.29 J-.006 E2.634
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.216 J.041 P1  F30000
G1 X105.654 Y128.162 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F14716
G1 X105.654 Y102.6 E.64362
G1 X105.346 Y102.6 E.00778
G1 X105.346 Y128.162 E.64362
G1 X105.594 Y128.162 E.00627
G1 X105.998 Y128.505 F30000
; LINE_WIDTH: 0.419999
G1 F14716
G1 X105.998 Y102.257 E.80654
G1 X105.002 Y102.257 E.03058
G1 X105.002 Y128.505 E.80654
G1 X105.938 Y128.505 E.02873
G1 X106.375 Y128.008 F30000
G1 F14716
G1 X106.375 Y101.88 E.80284
G1 X104.625 Y101.88 E.05375
G1 X104.629 Y128.882 E.82971
G1 X106.377 Y128.882 E.05371
G1 X106.375 Y128.068 E.02503
G1 X106.752 Y128.008 F30000
G1 F14716
G1 X106.752 Y101.503 E.81443
G1 X104.248 Y101.503 E.07692
G1 X104.248 Y128.732 E.8367
G1 X104.261 Y129.259 E.0162
G1 X106.764 Y129.259 E.07689
G1 X106.752 Y128.068 E.03662
G1 X107.129 Y128.008 F30000
G1 F14716
G1 X107.129 Y101.126 E.82601
G1 X103.871 Y101.126 E.10009
G1 X103.871 Y128.737 E.84843
G1 X103.894 Y129.636 E.02764
G1 X107.15 Y129.636 E.10007
G3 X107.129 Y128.068 I31.73 J-1.221 E.04821
G1 X107.506 Y128.008 F30000
G1 F14716
G1 X107.506 Y100.748 E.8376
G1 X103.494 Y100.748 E.12327
G1 X103.494 Y128.742 E.86016
G1 X103.526 Y130.014 E.03909
G1 X107.533 Y130.014 E.12314
G1 X107.533 Y129.867 E.00451
G3 X107.506 Y128.068 I36.163 J-1.451 E.05529
G1 X106.195 Y130.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14716
G1 X104.567 Y130.406 E.05401
G1 X103.582 Y131.39 E.04619
G2 X103.71 Y132.414 I10.321 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I23.12 J-14.38 E.19098
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.989 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F14716
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F14716
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X155.433 Y130.406 E.04619
G1 X153.805 Y130.406 E.05401
G1 X154.346 Y128.162 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F14716
G1 X154.654 Y128.162 E.00778
G1 X154.654 Y102.6 E.64362
G1 X154.346 Y102.6 E.00778
G1 X154.346 Y128.102 E.64211
G1 X154.002 Y128.505 F30000
; LINE_WIDTH: 0.419999
G1 F14716
G1 X154.998 Y128.505 E.03058
G1 X154.998 Y102.257 E.80654
G1 X154.002 Y102.257 E.03058
G1 X154.002 Y128.445 E.8047
G1 X153.625 Y128.764 F30000
G1 F14716
G1 X153.623 Y128.882 E.00363
G1 X155.371 Y128.882 E.05371
G1 X155.375 Y101.88 E.82971
G1 X153.625 Y101.88 E.05375
G1 X153.625 Y128.704 E.82424
G1 X153.248 Y128.764 F30000
G1 F14716
G1 X153.236 Y129.259 E.01522
G1 X155.739 Y129.259 E.07689
G1 X155.752 Y128.732 E.0162
G1 X155.752 Y101.503 E.8367
G1 X153.248 Y101.503 E.07692
G1 X153.248 Y128.704 E.83583
G1 X152.871 Y128.764 F30000
G1 F14716
G1 X152.85 Y129.636 E.02681
G1 X156.106 Y129.636 E.10007
G1 X156.129 Y128.737 E.02764
G1 X156.129 Y101.126 E.84843
G1 X152.871 Y101.126 E.10009
G1 X152.871 Y128.704 E.84742
G1 X152.494 Y128.764 F30000
G1 F14716
G1 X152.494 Y128.769 E.00014
G2 X152.467 Y130.014 I25.224 J1.179 E.03825
G1 X156.474 Y130.014 E.12314
G1 X156.506 Y128.742 E.03909
G1 X156.506 Y100.748 E.86016
G1 X152.494 Y100.748 E.12327
G1 X152.494 Y128.704 E.859
; WIPE_START
G1 F24000
G1 X152.494 Y126.704 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.986 J-.713 P1  F30000
G1 X135.226 Y150.583 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14716
G2 X136.794 Y150.146 I-3.6 J-15.927 E.05402
G1 X139.993 Y153.345 E.15007
G3 X138.469 Y153.916 I-6.489 J-14.985 E.05403
G1 X124.774 Y150.583 F30000
G1 F14716
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 4.28571
; LAYER_HEIGHT: 0.0857143
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z4.6 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z4.6
G1 Z4.286
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.86 Y130.877 E.02726
G1 X109.86 Y128 E.10997
G1 X109.039 Y128 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y122.246 E.10997
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y113.615 E.10997
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y102.106 E.10997
G1 X109.86 Y102.106 E.03141
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.686 I.123 J-1.211 P1  F30000
G1 X101.229 Y99.229 Z4.686
G1 Z4.286
G1 E.8 F1800
G1 F9000
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y102.106 E.09842
G1 X101.229 Y102.106 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y107.86 E.10997
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.961 Y128.758 E.02896
G2 X102.05 Y130.877 I41.861 J-.697 E.08109
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.001 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.686 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z4.686
G1 Z4.286
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.02726
G2 X150.961 Y128 I-61.906 J-3.782 E.11006
G1 X150.14 Y128 E.03141
G1 X150.14 Y125.123 E.10997
G1 X150.961 Y125.123 E.03141
G1 X150.961 Y122.246 E.10997
G1 X150.14 Y122.246 E.03141
G1 X150.14 Y119.369 E.10997
G1 X150.961 Y119.369 E.03141
G1 X150.961 Y116.492 E.10997
G1 X150.14 Y116.492 E.03141
G1 X150.14 Y113.615 E.10997
G1 X150.961 Y113.615 E.03141
G1 X150.961 Y110.738 E.10997
G1 X150.14 Y110.738 E.03141
G1 X150.14 Y107.86 E.10997
G1 X150.961 Y107.86 E.03141
M73 P64 R6
G1 X150.961 Y104.983 E.10997
G1 X150.14 Y104.983 E.03141
G1 X150.14 Y102.106 E.10997
G1 X150.961 Y102.106 E.03141
G1 X150.961 Y99.531 E.09842
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.686 I.134 J1.21 P1  F30000
G1 X157.737 Y99.229 Z4.686
G1 Z4.286
G1 E.8 F1800
G1 F9000
G1 X158.771 Y99.229 E.03953
G1 X158.771 Y102.106 E.10997
G1 X158.039 Y102.106 E.02799
G1 X158.039 Y104.983 E.10997
G1 X158.771 Y104.983 E.02799
G1 X158.771 Y107.86 E.10997
G1 X158.039 Y107.86 E.02799
G1 X158.039 Y110.738 E.10997
G1 X158.771 Y110.738 E.02799
G1 X158.771 Y113.615 E.10997
G1 X158.039 Y113.615 E.02799
G1 X158.039 Y116.492 E.10997
G1 X158.771 Y116.492 E.02799
G1 X158.771 Y119.369 E.10997
G1 X158.039 Y119.369 E.02799
G1 X158.039 Y122.246 E.10997
G1 X158.771 Y122.246 E.02799
G1 X158.771 Y125.123 E.10997
G1 X158.039 Y125.123 E.02799
G1 X158.039 Y128 E.10997
G1 X158.771 Y128 E.02799
G1 X158.771 Y130.877 E.10997
G1 X157.95 Y130.877 E.03139
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.114286
; WIPE_START
G1 F24000
G1 X158.771 Y130.877 E-.3121
G1 X158.771 Y129.698 E-.4479
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
G3 Z4.686 I-.003 J-1.217 P1  F30000
G1 X103.129 Y129.832 Z4.686
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X107.923 Y129.832 E.15903
G1 X108.008 Y130.955 E.03735
G2 X152.077 Y129.832 I21.993 J-2.208 E2.19402
G1 X156.871 Y129.832 E.15903
G1 X156.864 Y130.095 E.00873
G3 X103.132 Y129.892 I-26.862 J-1.347 E2.7202
; WIPE_START
G1 F24000
G1 X105.131 Y129.867 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.213 J-.098 P1  F30000
G1 X102.71 Y99.964 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.634
G1 X102.71 Y100.024 E.88271
M204 S10000
G1 X102.906 Y100.266 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.255134
G1 F15000
G1 X108.094 Y100.266 E.08971
; WIPE_START
G1 F24000
G1 X106.094 Y100.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.214 J.085 P1  F30000
G1 X108.085 Y128.851 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.326 Y129.61 E.03297
G1 X106.793 Y129.61
G1 X108.083 Y128.32 E.05605
G1 X108.083 Y127.787
G1 X106.26 Y129.61 E.07922
G1 X105.726 Y129.61
G1 X108.083 Y127.253 E.10239
G1 X108.083 Y126.72
G1 X105.193 Y129.61 E.12557
G1 X104.66 Y129.61
G1 X108.083 Y126.187 E.14874
G1 X108.083 Y125.654
G1 X104.126 Y129.61 E.17191
G1 X103.593 Y129.61
G1 X108.083 Y125.12 E.19509
G1 X108.083 Y124.587
G1 X103.06 Y129.61 E.21826
G1 X102.929 Y129.207
G1 X108.083 Y124.054 E.22396
G1 X108.083 Y123.52
G1 X102.917 Y128.686 E.22445
G1 X102.917 Y128.152
G1 X108.083 Y122.987 E.22445
G1 X108.083 Y122.454
G1 X102.917 Y127.619 E.22445
G1 X102.917 Y127.086
G1 X108.083 Y121.921 E.22445
G1 X108.083 Y121.387
G1 X102.917 Y126.553 E.22445
G1 X102.917 Y126.019
G1 X108.083 Y120.854 E.22445
G1 X108.083 Y120.321
G1 X102.917 Y125.486 E.22445
G1 X102.917 Y124.953
G1 X108.083 Y119.788 E.22445
G1 X108.083 Y119.254
G1 X102.917 Y124.419 E.22445
G1 X102.917 Y123.886
G1 X108.083 Y118.721 E.22445
G1 X108.083 Y118.188
G1 X102.917 Y123.353 E.22445
G1 X102.917 Y122.82
G1 X108.083 Y117.654 E.22445
G1 X108.083 Y117.121
G1 X102.917 Y122.286 E.22445
G1 X102.917 Y121.753
G1 X108.083 Y116.588 E.22445
G1 X108.083 Y116.055
G1 X102.917 Y121.22 E.22445
G1 X102.917 Y120.687
G1 X108.083 Y115.521 E.22445
G1 X108.083 Y114.988
G1 X102.917 Y120.153 E.22445
G1 X102.917 Y119.62
G1 X108.083 Y114.455 E.22445
G1 X108.083 Y113.922
G1 X102.917 Y119.087 E.22445
G1 X102.917 Y118.554
G1 X108.083 Y113.388 E.22445
G1 X108.083 Y112.855
G1 X102.917 Y118.02 E.22445
G1 X102.917 Y117.487
G1 X108.083 Y112.322 E.22445
G1 X108.083 Y111.789
G1 X102.917 Y116.954 E.22445
G1 X102.917 Y116.42
G1 X108.083 Y111.255 E.22445
G1 X108.083 Y110.722
G1 X102.917 Y115.887 E.22445
G1 X102.917 Y115.354
G1 X108.083 Y110.189 E.22445
G1 X108.083 Y109.655
G1 X102.917 Y114.821 E.22445
G1 X102.917 Y114.287
G1 X108.083 Y109.122 E.22445
G1 X108.083 Y108.589
G1 X102.917 Y113.754 E.22445
G1 X102.917 Y113.221
G1 X108.083 Y108.056 E.22445
G1 X108.083 Y107.522
G1 X102.917 Y112.688 E.22445
G1 X102.917 Y112.154
G1 X108.083 Y106.989 E.22445
G1 X108.083 Y106.456
G1 X102.917 Y111.621 E.22445
G1 X102.917 Y111.088
G1 X108.083 Y105.923 E.22445
G1 X108.083 Y105.389
G1 X102.917 Y110.554 E.22445
G1 X102.917 Y110.021
G1 X108.083 Y104.856 E.22445
G1 X108.083 Y104.323
G1 X102.917 Y109.488 E.22445
G1 X102.917 Y108.955
G1 X108.083 Y103.789 E.22445
G1 X108.083 Y103.256
G1 X102.917 Y108.421 E.22445
G1 X102.917 Y107.888
G1 X108.083 Y102.723 E.22445
G1 X108.083 Y102.19
G1 X102.917 Y107.355 E.22445
G1 X102.917 Y106.822
G1 X108.083 Y101.656 E.22445
G1 X108.083 Y101.123
G1 X102.917 Y106.288 E.22445
G1 X102.917 Y105.755
G1 X108.083 Y100.59 E.22445
G1 X107.74 Y100.399
G1 X102.917 Y105.222 E.20958
G1 X102.917 Y104.689
G1 X107.207 Y100.399 E.1864
G1 X106.674 Y100.399
G1 X102.917 Y104.155 E.16323
G1 X102.917 Y103.622
G1 X106.14 Y100.399 E.14006
G1 X105.607 Y100.399
G1 X102.917 Y103.089 E.11688
G1 X102.917 Y102.555
G1 X105.074 Y100.399 E.09371
G1 X104.541 Y100.399
G1 X102.917 Y102.022 E.07054
G1 X102.917 Y101.489
G1 X104.007 Y100.399 E.04737
G1 X103.474 Y100.399
G1 X102.917 Y100.956 E.02419
M204 S10000
; WIPE_START
G1 F24000
G1 X103.474 Y100.399 E-.29918
G1 X104.007 Y100.399 E-.20264
G1 X103.527 Y100.879 E-.25817
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.211 J.12 P1  F30000
G1 X106.42 Y130.18 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X104.792 Y130.18 E.05401
G1 X103.582 Y131.39 E.05675
G2 X103.71 Y132.414 I8.873 J-.587 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
M73 P65 R6
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.99 J-6.925 E.054
G1 X112.675 Y143.027 F30000
G1 F15476.087
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-20.999 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F15476.087
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-8.751 J-1.612 E.03424
G1 X155.208 Y130.18 E.05675
G1 X153.58 Y130.18 E.05401
G1 X157.078 Y128.918 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X156.387 Y129.61 E.03005
G1 X155.854 Y129.61
G1 X157.083 Y128.381 E.0534
G1 X157.083 Y127.847
G1 X155.32 Y129.61 E.07658
G1 X154.787 Y129.61
G1 X157.083 Y127.314 E.09975
G1 X157.083 Y126.781
G1 X154.254 Y129.61 E.12292
G1 X153.721 Y129.61
G1 X157.083 Y126.248 E.14609
G1 X157.083 Y125.714
G1 X153.187 Y129.61 E.16927
G1 X152.654 Y129.61
G1 X157.083 Y125.181 E.19244
G1 X157.083 Y124.648
G1 X152.121 Y129.61 E.21561
G1 X151.904 Y129.293
G1 X157.083 Y124.115 E.22503
G1 X157.083 Y123.581
G1 X151.917 Y128.747 E.22445
G1 X151.917 Y128.213
G1 X157.083 Y123.048 E.22445
G1 X157.083 Y122.515
G1 X151.917 Y127.68 E.22445
G1 X151.917 Y127.147
G1 X157.083 Y121.982 E.22445
G1 X157.083 Y121.448
G1 X151.917 Y126.613 E.22445
G1 X151.917 Y126.08
G1 X157.083 Y120.915 E.22445
G1 X157.083 Y120.382
G1 X151.917 Y125.547 E.22445
G1 X151.917 Y125.014
G1 X157.083 Y119.848 E.22445
G1 X157.083 Y119.315
G1 X151.917 Y124.48 E.22445
G1 X151.917 Y123.947
G1 X157.083 Y118.782 E.22445
G1 X157.083 Y118.249
G1 X151.917 Y123.414 E.22445
G1 X151.917 Y122.881
G1 X157.083 Y117.715 E.22445
G1 X157.083 Y117.182
G1 X151.917 Y122.347 E.22445
G1 X151.917 Y121.814
G1 X157.083 Y116.649 E.22445
G1 X157.083 Y116.116
G1 X151.917 Y121.281 E.22445
G1 X151.917 Y120.747
G1 X157.083 Y115.582 E.22445
G1 X157.083 Y115.049
G1 X151.917 Y120.214 E.22445
G1 X151.917 Y119.681
G1 X157.083 Y114.516 E.22445
G1 X157.083 Y113.982
G1 X151.917 Y119.148 E.22445
G1 X151.917 Y118.614
G1 X157.083 Y113.449 E.22445
G1 X157.083 Y112.916
G1 X151.917 Y118.081 E.22445
G1 X151.917 Y117.548
G1 X157.083 Y112.383 E.22445
G1 X157.083 Y111.849
G1 X151.917 Y117.015 E.22445
G1 X151.917 Y116.481
G1 X157.083 Y111.316 E.22445
G1 X157.083 Y110.783
G1 X151.917 Y115.948 E.22445
G1 X151.917 Y115.415
G1 X157.083 Y110.25 E.22445
G1 X157.083 Y109.716
G1 X151.917 Y114.882 E.22445
G1 X151.917 Y114.348
G1 X157.083 Y109.183 E.22445
G1 X157.083 Y108.65
G1 X151.917 Y113.815 E.22445
G1 X151.917 Y113.282
G1 X157.083 Y108.116 E.22445
G1 X157.083 Y107.583
G1 X151.917 Y112.748 E.22445
G1 X151.917 Y112.215
G1 X157.083 Y107.05 E.22445
G1 X157.083 Y106.517
G1 X151.917 Y111.682 E.22445
G1 X151.917 Y111.149
G1 X157.083 Y105.983 E.22445
G1 X157.083 Y105.45
G1 X151.917 Y110.615 E.22445
G1 X151.917 Y110.082
G1 X157.083 Y104.917 E.22445
G1 X157.083 Y104.384
G1 X151.917 Y109.549 E.22445
G1 X151.917 Y109.016
G1 X157.083 Y103.85 E.22445
G1 X157.083 Y103.317
G1 X151.917 Y108.482 E.22445
G1 X151.917 Y107.949
G1 X157.083 Y102.784 E.22445
G1 X157.083 Y102.251
G1 X151.917 Y107.416 E.22445
G1 X151.917 Y106.882
G1 X157.083 Y101.717 E.22445
G1 X157.083 Y101.184
G1 X151.917 Y106.349 E.22445
G1 X151.917 Y105.816
G1 X157.083 Y100.651 E.22445
G1 X156.801 Y100.399
G1 X151.917 Y105.283 E.21222
G1 X151.917 Y104.749
G1 X156.268 Y100.399 E.18905
G1 X155.735 Y100.399
G1 X151.917 Y104.216 E.16588
G1 X151.917 Y103.683
G1 X155.201 Y100.399 E.1427
G1 X154.668 Y100.399
G1 X151.917 Y103.15 E.11953
G1 X151.917 Y102.616
G1 X154.135 Y100.399 E.09636
G1 X153.602 Y100.399
G1 X151.917 Y102.083 E.07318
G1 X151.917 Y101.55
G1 X153.068 Y100.399 E.05001
G1 X152.535 Y100.399
G1 X151.917 Y101.016 E.02684
M204 S10000
G1 X151.906 Y100.266 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.255134
G1 F15000
G1 X157.094 Y100.266 E.08971
; WIPE_START
G1 F24000
G1 X155.094 Y100.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.132 J-.447 P1  F30000
G1 X135.226 Y150.583 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X136.794 Y150.146 I-3.6 J-15.927 E.05402
G1 X139.993 Y153.345 E.15007
G3 X138.469 Y153.916 I-6.489 J-14.985 E.05403
G1 X124.774 Y150.583 F30000
G1 F15476.087
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 4.54286
; LAYER_HEIGHT: 0.142857
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z4.8 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z4.8
G1 Z4.543
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F5893
G1 X109.86 Y130.877 E.02726
G1 X109.86 Y128 E.10997
G1 X109.039 Y128 E.03141
G1 X109.039 Y125.123 E.10997
G1 X109.86 Y125.123 E.03141
G1 X109.86 Y122.246 E.10997
G1 X109.039 Y122.246 E.03141
G1 X109.039 Y119.369 E.10997
G1 X109.86 Y119.369 E.03141
G1 X109.86 Y116.492 E.10997
G1 X109.039 Y116.492 E.03141
G1 X109.039 Y113.615 E.10997
M73 P66 R6
G1 X109.86 Y113.615 E.03141
G1 X109.86 Y110.738 E.10997
G1 X109.039 Y110.738 E.03141
G1 X109.039 Y107.86 E.10997
G1 X109.86 Y107.86 E.03141
G1 X109.86 Y104.983 E.10997
G1 X109.039 Y104.983 E.03141
G1 X109.039 Y102.106 E.10997
G1 X109.86 Y102.106 E.03141
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.943 I.123 J-1.211 P1  F30000
G1 X101.229 Y99.229 Z4.943
G1 Z4.543
G1 E.8 F1800
G1 F5893
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y102.106 E.09842
G1 X101.229 Y102.106 E.02799
G1 X101.229 Y104.983 E.10997
G1 X101.961 Y104.983 E.02799
G1 X101.961 Y107.86 E.10997
G1 X101.229 Y107.86 E.02799
G1 X101.229 Y110.738 E.10997
G1 X101.961 Y110.738 E.02799
G1 X101.961 Y113.615 E.10997
G1 X101.229 Y113.615 E.02799
G1 X101.229 Y116.492 E.10997
G1 X101.961 Y116.492 E.02799
G1 X101.961 Y119.369 E.10997
G1 X101.229 Y119.369 E.02799
G1 X101.229 Y122.246 E.10997
G1 X101.961 Y122.246 E.02799
G1 X101.961 Y125.123 E.10997
G1 X101.229 Y125.123 E.02799
G1 X101.229 Y128 E.10997
G1 X101.961 Y128 E.02799
G1 X101.956 Y128.541 E.02067
G2 X102.05 Y130.877 I23.614 J.215 E.08941
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.003 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.943 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z4.943
G1 Z4.543
G1 E.8 F1800
G1 F5893
G1 X150.853 Y130.877 E.02726
G2 X150.961 Y128 I-61.906 J-3.782 E.11006
G1 X150.14 Y128 E.03141
G1 X150.14 Y125.123 E.10997
G1 X150.961 Y125.123 E.03141
G1 X150.961 Y122.246 E.10997
G1 X150.14 Y122.246 E.03141
G1 X150.14 Y119.369 E.10997
G1 X150.961 Y119.369 E.03141
G1 X150.961 Y116.492 E.10997
G1 X150.14 Y116.492 E.03141
G1 X150.14 Y113.615 E.10997
G1 X150.961 Y113.615 E.03141
G1 X150.961 Y110.738 E.10997
G1 X150.14 Y110.738 E.03141
G1 X150.14 Y107.86 E.10997
G1 X150.961 Y107.86 E.03141
G1 X150.961 Y104.983 E.10997
G1 X150.14 Y104.983 E.03141
G1 X150.14 Y102.106 E.10997
G1 X150.961 Y102.106 E.03141
G1 X150.961 Y99.531 E.09842
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.943 I.134 J1.21 P1  F30000
G1 X157.737 Y99.229 Z4.943
G1 Z4.543
G1 E.8 F1800
G1 F5893
G1 X158.771 Y99.229 E.03953
G1 X158.771 Y102.106 E.10997
G1 X158.039 Y102.106 E.02799
G1 X158.039 Y104.983 E.10997
G1 X158.771 Y104.983 E.02799
G1 X158.771 Y107.86 E.10997
G1 X158.039 Y107.86 E.02799
G1 X158.039 Y110.738 E.10997
G1 X158.771 Y110.738 E.02799
G1 X158.771 Y113.615 E.10997
G1 X158.039 Y113.615 E.02799
G1 X158.039 Y116.492 E.10997
G1 X158.771 Y116.492 E.02799
G1 X158.771 Y119.369 E.10997
G1 X158.039 Y119.369 E.02799
G1 X158.039 Y122.246 E.10997
G1 X158.771 Y122.246 E.02799
G1 X158.771 Y125.123 E.10997
G1 X158.039 Y125.123 E.02799
G1 X158.039 Y128 E.10997
G1 X158.771 Y128 E.02799
G1 X158.771 Y130.877 E.10997
G1 X157.95 Y130.877 E.03139
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0571427
; WIPE_START
G1 F24000
G1 X158.771 Y130.877 E-.3121
G1 X158.771 Y129.698 E-.4479
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
G3 Z4.943 I1.204 J-.177 P1  F30000
G1 X154.5 Y100.652 Z4.943
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5893
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5893
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5893
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5893
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.217 J-.021 P1  F30000
G1 X103.117 Y129.356 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5893
G1 X107.913 Y129.356 E.15907
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.103 E2.24634
G1 X156.883 Y129.356 E.15907
G3 X103.119 Y129.416 I-26.883 J-.602 E2.76027
G1 X102.715 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5893
G1 X108.295 Y128.964 E.17145
G1 X108.317 Y129.836 E.02681
G2 X151.705 Y128.964 I21.681 J-1.085 E2.05563
G1 X157.285 Y128.964 E.17145
G3 X102.716 Y129.024 I-27.285 J-.214 E2.61894
M204 S10000
; WIPE_START
G1 F24000
G1 X104.716 Y129.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.373 J1.158 P1  F30000
G1 X106.896 Y129.705 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5893
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F5893
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F5893
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.215 J-1.796 E.03423
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z5
G1 Z4.6
G1 E.8 F1800
G1 F5893
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F5893
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z5 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X109.86 Y130.877 E.02726
G1 X109.86 Y128 E.10997
G1 X108.889 Y128 E.03715
G1 X108.889 Y125.123 E.10997
G1 X109.86 Y125.123 E.03715
G1 X109.86 Y122.246 E.10997
G1 X108.889 Y122.246 E.03715
G1 X108.889 Y119.369 E.10997
G1 X109.86 Y119.369 E.03715
G1 X109.86 Y116.492 E.10997
G1 X108.889 Y116.492 E.03715
G1 X108.889 Y113.615 E.10997
G1 X109.86 Y113.615 E.03715
G1 X109.86 Y110.738 E.10997
M73 P67 R6
G1 X108.889 Y110.738 E.03715
G1 X108.889 Y107.86 E.10997
G1 X109.86 Y107.86 E.03715
G1 X109.86 Y104.983 E.10997
G1 X108.889 Y104.983 E.03715
G1 X108.889 Y102.106 E.10997
G1 X109.86 Y102.106 E.03715
G1 X109.86 Y99.229 E.10997
G1 X108.737 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.215 J-.069 P1  F30000
G1 X108.262 Y128.216 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X108.731 Y128.228 E.01444
G1 X108.731 Y101.784 E.81253
G1 X108.073 Y101.793 E.02023
G1 X108.073 Y128.216 E.8119
G1 X107.196 Y128.216 E.02695
G1 X107.196 Y101.793 E.8119
G1 X106.319 Y101.793 E.02695
G1 X106.319 Y128.216 E.8119
G1 X105.442 Y128.216 E.02695
G1 X105.442 Y101.793 E.8119
G1 X104.565 Y101.793 E.02695
G1 X104.565 Y128.216 E.8119
G1 X103.688 Y128.216 E.02695
G1 X103.688 Y101.793 E.8119
G1 X102.811 Y101.793 E.02695
G1 X102.811 Y128.216 E.8119
G1 X102.269 Y128.22 E.01666
G1 X102.269 Y101.784 E.8123
G1 X102.622 Y101.793 E.01086
; WIPE_START
G1 F24000
G1 X102.269 Y101.784 E-.13436
G1 X102.269 Y103.431 E-.62564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.181 J-.292 P1  F30000
G1 X101.229 Y99.229 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X102.263 Y99.229 E.03953
G1 X101.961 Y99.531 E.01632
G1 X101.961 Y101.477 E.07438
G1 X102.111 Y101.627 E.00811
G1 X102.111 Y102.106 E.01831
G1 X101.229 Y102.106 E.03372
G1 X101.229 Y104.983 E.10997
G1 X102.111 Y104.983 E.03372
G1 X102.111 Y107.86 E.10997
G1 X101.229 Y107.86 E.03372
G1 X101.229 Y110.738 E.10997
G1 X102.111 Y110.738 E.03372
G1 X102.111 Y113.615 E.10997
G1 X101.229 Y113.615 E.03372
G1 X101.229 Y116.492 E.10997
G1 X102.111 Y116.492 E.03372
G1 X102.111 Y119.369 E.10997
G1 X101.229 Y119.369 E.03372
G1 X101.229 Y122.246 E.10997
G1 X102.111 Y122.246 E.03372
G1 X102.111 Y125.123 E.10997
G1 X101.229 Y125.123 E.03372
G1 X101.229 Y128 E.10997
G1 X102.111 Y128 E.03372
G3 X101.956 Y128.541 I-.355 J.191 E.02381
G2 X102.05 Y130.877 I23.614 J.215 E.08941
G1 X101.229 Y130.877 E.03139
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X102.003 Y129.699 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.02726
G2 X150.967 Y128.522 I-30.429 J-2.659 E.09015
G1 X151.111 Y128.381 E.00771
G1 X151.111 Y128 E.01456
G1 X150.14 Y128 E.03715
G1 X150.14 Y125.123 E.10997
M73 P67 R5
G1 X151.111 Y125.123 E.03715
G1 X151.111 Y122.246 E.10997
G1 X150.14 Y122.246 E.03715
G1 X150.14 Y119.369 E.10997
G1 X151.111 Y119.369 E.03715
G1 X151.111 Y116.492 E.10997
G1 X150.14 Y116.492 E.03715
G1 X150.14 Y113.615 E.10997
G1 X151.111 Y113.615 E.03715
G1 X151.111 Y110.738 E.10997
G1 X150.14 Y110.738 E.03715
G1 X150.14 Y107.86 E.10997
G1 X151.111 Y107.86 E.03715
G1 X151.111 Y104.983 E.10997
G1 X150.14 Y104.983 E.03715
G1 X150.14 Y102.106 E.10997
G1 X151.111 Y102.106 E.03715
G1 X151.111 Y101.627 E.01831
G1 X150.961 Y101.477 E.00811
G1 X150.961 Y99.531 E.07438
G1 X151.263 Y99.229 E.01632
G1 X150.14 Y99.229 E.04296
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.119 J.479 P1  F30000
G1 X151.738 Y101.793 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X151.269 Y101.784 E.01444
G1 X151.269 Y128.228 E.81253
G1 X151.927 Y128.216 E.02024
G1 X151.927 Y101.793 E.8119
G1 X152.804 Y101.793 E.02695
G1 X152.804 Y128.216 E.8119
G1 X153.681 Y128.216 E.02695
G1 X153.681 Y101.793 E.8119
G1 X154.558 Y101.793 E.02695
G1 X154.558 Y128.216 E.8119
G1 X155.435 Y128.216 E.02695
G1 X155.435 Y101.793 E.8119
G1 X156.312 Y101.793 E.02695
G1 X156.312 Y128.216 E.8119
G1 X157.189 Y128.216 E.02695
G1 X157.189 Y101.793 E.8119
G1 X157.731 Y101.784 E.01666
G1 X157.731 Y128.22 E.8123
G1 X157.378 Y128.216 E.01086
; WIPE_START
G1 F24000
G1 X157.731 Y128.22 E-.13433
G1 X157.731 Y126.574 E-.62567
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.215 J.062 P1  F30000
G1 X157.95 Y130.877 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.257143
G1 F9000
G1 X158.771 Y130.877 E.03139
G1 X158.771 Y128 E.10997
G1 X157.889 Y128 E.03372
G1 X157.889 Y125.123 E.10997
G1 X158.771 Y125.123 E.03372
G1 X158.771 Y122.246 E.10997
G1 X157.889 Y122.246 E.03372
G1 X157.889 Y119.369 E.10997
G1 X158.771 Y119.369 E.03372
G1 X158.771 Y116.492 E.10997
G1 X157.889 Y116.492 E.03372
G1 X157.889 Y113.615 E.10997
G1 X158.771 Y113.615 E.03372
G1 X158.771 Y110.738 E.10997
G1 X157.889 Y110.738 E.03372
G1 X157.889 Y107.86 E.10997
G1 X158.771 Y107.86 E.03372
G1 X158.771 Y104.983 E.10997
G1 X157.889 Y104.983 E.03372
G1 X157.889 Y102.106 E.10997
G1 X158.771 Y102.106 E.03372
G1 X158.771 Y99.229 E.10997
G1 X157.737 Y99.229 E.03953
; WIPE_START
G1 F24000
G1 X158.771 Y99.229 E-.39302
G1 X158.771 Y100.195 E-.36698
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.13 J-1.21 P1  F30000
G1 X154.5 Y100.652 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
M73 P68 R5
G3 Z5.2 I-1.217 J-.021 P1  F30000
G1 X103.117 Y129.356 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.913 Y129.356 E.15907
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.103 E2.24636
G1 X156.883 Y129.356 E.15907
G3 X103.119 Y129.416 I-26.883 J-.602 E2.76027
G1 X102.715 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.295 Y128.964 E.17145
G1 X108.317 Y129.836 E.02681
G2 X151.705 Y128.964 I21.681 J-1.085 E2.05565
G1 X157.285 Y128.964 E.17145
G3 X102.716 Y129.024 I-27.285 J-.214 E2.61894
M204 S10000
; WIPE_START
G1 F24000
G1 X104.716 Y129.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.373 J1.158 P1  F30000
G1 X106.896 Y129.705 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F15476.087
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.153 J-18.099 E.054
G1 X152.078 Y132.79 F30000
G1 F15476.087
G3 X151.732 Y134.38 I-28.335 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F15476.087
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-6.744 J-21.136 E.05401
G1 X124.774 Y150.583 F30000
G1 F15476.087
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z5.2 I1.019 J.665 P1  F30000
G1 X154.5 Y100.652 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4270
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4270
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4270
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4270
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.217 J-.021 P1  F30000
G1 X103.117 Y129.356 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4270
G1 X107.913 Y129.356 E.15907
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.101 E2.24646
G1 X156.883 Y129.356 E.15907
G3 X103.119 Y129.416 I-26.883 J-.594 E2.76082
G1 X102.715 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4270
G1 X108.295 Y128.964 E.17145
G1 X108.317 Y129.836 E.02681
G2 X151.705 Y128.964 I21.681 J-1.082 E2.05581
G1 X157.285 Y128.964 E.17145
G3 X102.716 Y129.024 I-27.285 J-.206 E2.61946
M204 S10000
; WIPE_START
G1 F24000
G1 X104.716 Y129.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.373 J1.158 P1  F30000
G1 X106.896 Y129.705 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4270
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F4270
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.153 J-18.099 E.054
G1 X152.078 Y132.79 F30000
G1 F4270
G3 X151.732 Y134.38 I-28.335 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.002 J-.691 P1  F30000
M73 P69 R5
G1 X138.469 Y153.916 Z5.4
G1 Z5
G1 E.8 F1800
G1 F4270
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F4270
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 5.04
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z5.4 I1.088 J-.545 P1  F30000
G1 X109.147 Y130.877 Z5.4
G1 Z5.04
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F9000
G1 X109.86 Y130.877 E.0257
G1 X109.86 Y128 E.10367
G1 X109.109 Y128 E.02709
G1 X109.109 Y125.123 E.10367
G1 X109.86 Y125.123 E.02709
G1 X109.86 Y122.246 E.10367
G1 X109.109 Y122.246 E.02709
G1 X109.109 Y119.369 E.10367
G1 X109.86 Y119.369 E.02709
G1 X109.86 Y116.492 E.10367
G1 X109.109 Y116.492 E.02709
G1 X109.109 Y113.615 E.10367
G1 X109.86 Y113.615 E.02709
G1 X109.86 Y110.738 E.10367
G1 X109.109 Y110.738 E.02709
G1 X109.109 Y107.86 E.10367
G1 X109.86 Y107.86 E.02709
G1 X109.86 Y104.983 E.10367
G1 X109.109 Y104.983 E.02709
G1 X109.109 Y102.106 E.10367
G1 X109.86 Y102.106 E.02709
G1 X109.86 Y99.229 E.10367
G1 X108.737 Y99.229 E.0405
; WIPE_START
G1 F24000
G1 X109.86 Y99.229 E-.42709
G1 X109.86 Y100.105 E-.33291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.44 I-1.215 J-.069 P1  F30000
G1 X108.262 Y128.216 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X108.731 Y128.228 E.01694
G1 X108.731 Y101.784 E.95284
G1 X108.073 Y101.793 E.02373
G1 X108.073 Y128.216 E.9521
G1 X107.196 Y128.216 E.0316
G1 X107.196 Y101.793 E.9521
G1 X106.319 Y101.793 E.0316
G1 X106.319 Y128.216 E.9521
G1 X105.442 Y128.216 E.0316
G1 X105.442 Y101.793 E.9521
G1 X104.565 Y101.793 E.0316
G1 X104.565 Y128.216 E.9521
G1 X103.688 Y128.216 E.0316
G1 X103.688 Y101.793 E.9521
G1 X102.811 Y101.793 E.0316
G1 X102.811 Y128.216 E.9521
G1 X102.269 Y128.22 E.01953
G1 X102.269 Y101.784 E.95257
G1 X102.622 Y101.793 E.01274
; WIPE_START
G1 F24000
G1 X102.269 Y101.784 E-.13437
G1 X102.269 Y103.431 E-.62563
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.44 I1.181 J-.292 P1  F30000
G1 X101.229 Y99.229 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X102.263 Y99.229 E.03727
G1 X101.961 Y99.531 E.01539
G1 X101.891 Y102.106 E.09282
G1 X101.229 Y102.106 E.02386
G1 X101.229 Y104.983 E.10367
G1 X101.891 Y104.983 E.02386
G1 X101.891 Y107.86 E.10367
G1 X101.229 Y107.86 E.02386
G1 X101.229 Y110.738 E.10367
G1 X101.891 Y110.738 E.02386
G1 X101.891 Y113.615 E.10367
G1 X101.229 Y113.615 E.02386
G1 X101.229 Y116.492 E.10367
G1 X101.891 Y116.492 E.02386
G1 X101.891 Y119.369 E.10367
G1 X101.229 Y119.369 E.02386
G1 X101.229 Y122.246 E.10367
G1 X101.891 Y122.246 E.02386
G1 X101.891 Y125.123 E.10367
G1 X101.229 Y125.123 E.02386
G1 X101.229 Y128 E.10367
G1 X101.891 Y128 E.02386
G1 X101.891 Y129.006 E.03626
G1 X101.97 Y129.084 E.00398
G2 X102.05 Y130.877 I18.143 J.079 E.06469
G1 X101.229 Y130.877 E.02959
; WIPE_START
G1 F24000
G1 X102.05 Y130.877 E-.31209
G1 X101.997 Y129.7 E-.44791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.44 I-.03 J1.217 P1  F30000
G1 X150.14 Y130.877 Z5.44
G1 Z5.04
G1 E.8 F1800
G1 F9000
G1 X150.853 Y130.877 E.0257
G2 X150.953 Y129.068 I-27.943 J-2.465 E.06529
G1 X150.891 Y129.006 E.00316
G1 X150.891 Y128 E.03626
G1 X150.14 Y128 E.02709
G1 X150.14 Y125.123 E.10367
G1 X150.891 Y125.123 E.02709
G1 X150.891 Y122.246 E.10367
G1 X150.14 Y122.246 E.02709
G1 X150.14 Y119.369 E.10367
G1 X150.891 Y119.369 E.02709
G1 X150.891 Y116.492 E.10367
G1 X150.14 Y116.492 E.02709
G1 X150.14 Y113.615 E.10367
G1 X150.891 Y113.615 E.02709
G1 X150.891 Y110.738 E.10367
G1 X150.14 Y110.738 E.02709
G1 X150.14 Y107.86 E.10367
G1 X150.891 Y107.86 E.02709
G1 X150.891 Y104.983 E.10367
G1 X150.14 Y104.983 E.02709
G1 X150.14 Y102.106 E.10367
G1 X150.891 Y102.106 E.02709
G1 X150.961 Y99.531 E.09282
G1 X151.263 Y99.229 E.01539
G1 X150.14 Y99.229 E.0405
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.949 Y99.98 E-.17063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.44 I-1.116 J.486 P1  F30000
G1 X151.738 Y101.793 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X151.269 Y101.784 E.01694
G1 X151.269 Y128.228 E.95284
G1 X151.927 Y128.216 E.02373
G1 X151.927 Y101.793 E.9521
G1 X152.804 Y101.793 E.0316
G1 X152.804 Y128.216 E.9521
G1 X153.681 Y128.216 E.0316
G1 X153.681 Y101.793 E.9521
G1 X154.558 Y101.793 E.0316
G1 X154.558 Y128.216 E.9521
G1 X155.435 Y128.216 E.0316
G1 X155.435 Y101.793 E.9521
G1 X156.312 Y101.793 E.0316
G1 X156.312 Y128.216 E.9521
G1 X157.189 Y128.216 E.0316
G1 X157.189 Y101.793 E.9521
G1 X157.731 Y101.784 E.01953
G1 X157.731 Y128.22 E.95257
G1 X157.378 Y128.216 E.01274
; WIPE_START
G1 F24000
G1 X157.731 Y128.22 E-.13434
G1 X157.731 Y126.574 E-.62566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.44 I-1.215 J.062 P1  F30000
G1 X157.95 Y130.877 Z5.44
G1 Z5.04
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X158.771 Y130.877 E.02959
G1 X158.771 Y128 E.10367
G1 X158.109 Y128 E.02386
G1 X158.109 Y125.123 E.10367
G1 X158.771 Y125.123 E.02386
G1 X158.771 Y122.246 E.10367
G1 X158.109 Y122.246 E.02386
G1 X158.109 Y119.369 E.10367
G1 X158.771 Y119.369 E.02386
G1 X158.771 Y116.492 E.10367
G1 X158.109 Y116.492 E.02386
G1 X158.109 Y113.615 E.10367
G1 X158.771 Y113.615 E.02386
G1 X158.771 Y110.738 E.10367
G1 X158.109 Y110.738 E.02386
G1 X158.109 Y107.86 E.10367
G1 X158.771 Y107.86 E.02386
G1 X158.771 Y104.983 E.10367
G1 X158.109 Y104.983 E.02386
G1 X158.109 Y102.106 E.10367
G1 X158.771 Y102.106 E.02386
G1 X158.771 Y99.229 E.10367
G1 X157.737 Y99.229 E.03727
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X158.771 Y99.229 E-.39302
G1 X158.771 Y100.195 E-.36698
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
G3 Z5.44 I-.13 J-1.21 P1  F30000
G1 X154.5 Y100.652 Z5.44
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M73 P70 R5
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.217 J-.021 P1  F30000
G1 X103.117 Y129.356 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.913 Y129.356 E.15907
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.104 E2.24632
G1 X156.883 Y129.356 E.15907
G3 X103.119 Y129.416 I-26.883 J-.602 E2.76027
G1 X102.715 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.295 Y128.964 E.17145
G1 X108.317 Y129.836 E.02681
G2 X151.705 Y128.964 I21.681 J-1.085 E2.05561
G1 X157.285 Y128.964 E.17145
G3 X102.716 Y129.024 I-27.285 J-.214 E2.61894
M204 S10000
; WIPE_START
G1 F24000
G1 X104.716 Y129.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.373 J1.158 P1  F30000
G1 X106.896 Y129.705 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F15476.087
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-20.999 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.153 J-18.099 E.054
G1 X152.078 Y132.79 F30000
G1 F15476.087
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F15476.087
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-6.604 J-20.633 E.05401
G1 X124.774 Y150.583 F30000
G1 F15476.087
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 5.28
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z5.6 I1.105 J-.511 P1  F30000
G1 X108.807 Y128.302 Z5.6
G1 Z5.28
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F6788
G1 X109.033 Y128.522 E.01136
G2 X109.147 Y130.877 I115.509 J-4.432 E.08497
G1 X109.86 Y130.877 E.0257
G1 X109.86 Y128 E.10367
G1 X101.229 Y128 E.31101
G1 X101.229 Y125.123 E.10367
G1 X109.86 Y125.123 E.31101
G1 X109.86 Y122.246 E.10367
G1 X101.229 Y122.246 E.31101
G1 X101.229 Y119.369 E.10367
G1 X109.86 Y119.369 E.31101
G1 X109.86 Y116.492 E.10367
G1 X101.229 Y116.492 E.31101
G1 X101.229 Y113.615 E.10367
G1 X109.86 Y113.615 E.31101
G1 X109.86 Y110.738 E.10367
G1 X101.229 Y110.738 E.31101
G1 X101.229 Y107.86 E.10367
G1 X109.86 Y107.86 E.31101
G1 X109.86 Y104.983 E.10367
G1 X101.229 Y104.983 E.31101
G1 X101.229 Y102.106 E.10367
G1 X109.86 Y102.106 E.31101
G1 X109.86 Y99.229 E.10367
G1 X108.737 Y99.229 E.0405
G1 X109.039 Y99.531 E.01539
G1 X109.039 Y101.477 E.07013
G1 X108.723 Y101.793 E.01608
G1 X102.277 Y101.793 E.23228
G1 X101.961 Y101.477 E.01608
G1 X101.961 Y99.531 E.07013
G1 X102.263 Y99.229 E.01539
G1 X101.229 Y99.229 E.03727
G1 X101.229 Y128.189 F30000
G1 F6788
G1 X101.229 Y130.877 E.09688
G1 X102.05 Y130.877 E.02959
G3 X101.956 Y128.541 I23.519 J-2.122 E.08429
G1 X102.189 Y128.302 E.01203
; WIPE_START
G1 F24000
G1 X101.956 Y128.541 E-.12692
G1 X102.023 Y130.205 E-.63308
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.68 I.051 J1.216 P1  F30000
G1 X150.14 Y128.189 Z5.68
G1 Z5.28
G1 E.8 F1800
G1 F6788
G1 X150.14 Y130.877 E.09688
G1 X150.853 Y130.877 E.0257
G2 X150.967 Y128.522 I-30.429 J-2.659 E.08499
G1 X151.193 Y128.302 E.01136
G1 X157.811 Y128.302 F30000
G1 F6788
G1 X158.044 Y128.541 E.01203
G3 X157.95 Y130.877 I-23.614 J.215 E.08429
G1 X158.771 Y130.877 E.02959
G1 X158.771 Y128 E.10367
G1 X150.14 Y128 E.31101
G1 X150.14 Y125.123 E.10367
G1 X158.771 Y125.123 E.31101
G1 X158.771 Y122.246 E.10367
G1 X150.14 Y122.246 E.31101
G1 X150.14 Y119.369 E.10367
G1 X158.771 Y119.369 E.31101
G1 X158.771 Y116.492 E.10367
G1 X150.14 Y116.492 E.31101
G1 X150.14 Y113.615 E.10367
G1 X158.771 Y113.615 E.31101
G1 X158.771 Y110.738 E.10367
G1 X150.14 Y110.738 E.31101
G1 X150.14 Y107.86 E.10367
G1 X158.771 Y107.86 E.31101
G1 X158.771 Y104.983 E.10367
G1 X150.14 Y104.983 E.31101
G1 X150.14 Y102.106 E.10367
G1 X158.771 Y102.106 E.31101
G1 X158.771 Y99.229 E.10367
G1 X157.737 Y99.229 E.03727
G1 X158.039 Y99.531 E.01539
G1 X158.039 Y101.477 E.07013
G1 X157.723 Y101.793 E.01608
G1 X151.277 Y101.793 E.23228
G1 X150.961 Y101.477 E.01608
G1 X150.961 Y99.531 E.07013
G1 X151.263 Y99.229 E.01539
G1 X150.14 Y99.229 E.0405
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
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
G3 Z5.68 I-.227 J1.196 P1  F30000
G1 X154.5 Y100.652 Z5.68
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6788
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6788
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6788
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P71 R5
G1 F6788
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.217 J-.021 P1  F30000
G1 X103.117 Y129.356 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6788
G1 X107.913 Y129.356 E.15907
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.101 E2.24646
G1 X156.883 Y129.356 E.15907
G3 X103.119 Y129.416 I-26.883 J-.594 E2.76082
G1 X102.715 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6788
G1 X108.295 Y128.969 E.17146
G2 X151.705 Y128.964 I21.705 J-.217 E2.0821
G1 X157.285 Y128.964 E.17145
G3 X102.716 Y129.024 I-27.285 J-.206 E2.61946
M204 S10000
; WIPE_START
G1 F24000
G1 X104.716 Y129.005 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.372 J1.159 P1  F30000
G1 X106.896 Y129.705 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6788
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F6788
G2 X113.756 Y144.244 I20.234 J-16.882 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F6788
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F6788
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F6788
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 5.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z5.8 I1.105 J-.511 P1  F30000
G1 X108.807 Y128.302 Z5.8
G1 Z5.52
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F6788
G1 X109.033 Y128.522 E.01136
G2 X109.147 Y130.877 I96.006 J-3.484 E.08497
G1 X109.86 Y130.877 E.0257
G1 X109.86 Y128 E.10367
G1 X101.229 Y128 E.31101
G1 X101.229 Y125.123 E.10367
G1 X109.86 Y125.123 E.31101
G1 X109.86 Y122.246 E.10367
G1 X101.229 Y122.246 E.31101
G1 X101.229 Y119.369 E.10367
G1 X109.86 Y119.369 E.31101
G1 X109.86 Y116.492 E.10367
G1 X101.229 Y116.492 E.31101
G1 X101.229 Y113.615 E.10367
G1 X109.86 Y113.615 E.31101
G1 X109.86 Y110.738 E.10367
G1 X101.229 Y110.738 E.31101
G1 X101.229 Y107.86 E.10367
G1 X109.86 Y107.86 E.31101
G1 X109.86 Y104.983 E.10367
G1 X101.229 Y104.983 E.31101
G1 X101.229 Y102.106 E.10367
G1 X109.86 Y102.106 E.31101
G1 X109.86 Y99.229 E.10367
G1 X108.737 Y99.229 E.0405
G1 X109.039 Y99.531 E.01539
G1 X109.039 Y101.477 E.07013
G1 X108.723 Y101.793 E.01608
G1 X102.277 Y101.793 E.23228
G1 X101.961 Y101.477 E.01608
G1 X101.961 Y99.531 E.07013
G1 X102.263 Y99.229 E.01539
G1 X101.229 Y99.229 E.03727
G1 X101.229 Y128.189 F30000
G1 F6788
G1 X101.229 Y130.877 E.09688
G1 X102.05 Y130.877 E.02959
G3 X101.956 Y128.541 I23.519 J-2.122 E.08429
G1 X102.189 Y128.302 E.01203
; WIPE_START
G1 F24000
G1 X101.956 Y128.541 E-.12692
G1 X102.023 Y130.205 E-.63308
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.92 I.051 J1.216 P1  F30000
G1 X150.14 Y128.189 Z5.92
G1 Z5.52
G1 E.8 F1800
G1 F6788
G1 X150.14 Y130.877 E.09688
G1 X150.853 Y130.877 E.0257
G2 X150.967 Y128.522 I-30.429 J-2.659 E.08499
G1 X151.193 Y128.302 E.01136
G1 X157.811 Y128.302 F30000
G1 F6788
G1 X158.044 Y128.541 E.01203
G3 X157.95 Y130.877 I-23.614 J.215 E.08429
G1 X158.771 Y130.877 E.02959
G1 X158.771 Y128 E.10367
G1 X150.14 Y128 E.31101
G1 X150.14 Y125.123 E.10367
G1 X158.771 Y125.123 E.31101
G1 X158.771 Y122.246 E.10367
G1 X150.14 Y122.246 E.31101
G1 X150.14 Y119.369 E.10367
G1 X158.771 Y119.369 E.31101
G1 X158.771 Y116.492 E.10367
G1 X150.14 Y116.492 E.31101
G1 X150.14 Y113.615 E.10367
G1 X158.771 Y113.615 E.31101
G1 X158.771 Y110.738 E.10367
G1 X150.14 Y110.738 E.31101
G1 X150.14 Y107.86 E.10367
G1 X158.771 Y107.86 E.31101
G1 X158.771 Y104.983 E.10367
G1 X150.14 Y104.983 E.31101
G1 X150.14 Y102.106 E.10367
G1 X158.771 Y102.106 E.31101
G1 X158.771 Y99.229 E.10367
G1 X157.737 Y99.229 E.03727
G1 X158.039 Y99.531 E.01539
G1 X158.039 Y101.477 E.07013
G1 X157.723 Y101.793 E.01608
G1 X151.277 Y101.793 E.23228
G1 X150.961 Y101.477 E.01608
G1 X150.961 Y99.531 E.07013
G1 X151.263 Y99.229 E.01539
G1 X150.14 Y99.229 E.0405
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.42708
G1 X150.961 Y99.531 E-.16229
G1 X150.961 Y99.98 E-.17063
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
G3 Z5.92 I-.227 J1.196 P1  F30000
G1 X154.5 Y100.652 Z5.92
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6788
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6788
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6788
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6788
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
M73 P72 R5
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.217 J-.021 P1  F30000
G1 X103.117 Y129.356 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6788
G1 X107.913 Y129.356 E.15907
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.105 E2.24623
G1 X156.883 Y129.356 E.15907
G3 X103.119 Y129.416 I-26.883 J-.6 E2.76042
G1 X102.715 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6788
G1 X108.295 Y128.964 E.17145
G1 X108.296 Y129.016 E.00158
G2 X151.705 Y128.964 I21.704 J-.257 E2.08107
G1 X157.285 Y128.964 E.17145
G3 X102.716 Y129.024 I-27.285 J-.206 E2.61946
M204 S10000
; WIPE_START
G1 F24000
G1 X104.716 Y129.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.373 J1.158 P1  F30000
G1 X106.896 Y129.705 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6788
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F6788
G2 X113.756 Y144.244 I20.234 J-16.882 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-20.999 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F6788
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z6
G1 Z5.6
G1 E.8 F1800
G1 F6788
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F6788
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S247.35
; CHANGE_LAYER
; Z_HEIGHT: 5.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z6 I.985 J-.715 P1  F30000
G1 X102.235 Y128.255 Z6
G1 Z5.76
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F4800
G1 X102.811 Y128.216 E.02078
G1 X102.811 Y101.793 E.9521
G1 X103.688 Y101.793 E.0316
G1 X103.688 Y128.216 E.9521
G1 X104.565 Y128.216 E.0316
G1 X104.565 Y101.793 E.9521
G1 X105.442 Y101.793 E.0316
G1 X105.442 Y128.216 E.9521
G1 X106.319 Y128.216 E.0316
G1 X106.319 Y101.793 E.9521
G1 X107.196 Y101.793 E.0316
G1 X107.196 Y128.216 E.9521
G1 X108.073 Y128.216 E.0316
G1 X108.073 Y101.793 E.9521
G1 X108.723 Y101.793 E.02342
G1 X108.817 Y101.699 E.00478
; WIPE_START
G1 F24000
G1 X108.723 Y101.793 E-.05037
G1 X108.073 Y101.793 E-.24701
G1 X108.073 Y103.01 E-.46262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.16 I1.193 J.24 P1  F30000
G1 X108.817 Y99.309 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F4800
G1 X108.737 Y99.229 E.00409
G1 X108.95 Y99.229 E.0077
G2 X109.039 Y99.531 I.195 J.107 E.01259
G1 X109.039 Y101.477 E.07013
G1 X108.95 Y101.566 E.00451
G1 X108.95 Y128.441 E.9684
G1 X109.033 Y128.522 E.00417
G2 X109.147 Y130.877 I95.993 J-3.484 E.08497
G1 X109.827 Y130.877 E.0245
G1 X109.827 Y99.229 E1.14038
; WIPE_START
G1 F24000
G1 X109.827 Y101.229 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.16 I.251 J-1.191 P1  F30000
G1 X101.961 Y99.57 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F4800
G1 X102.263 Y99.229 E.0164
G1 X101.933 Y99.229 E.01189
G1 X101.933 Y130.877 E1.14038
G1 X101.229 Y130.877 E.02538
G1 X101.229 Y99.229 E1.14038
G1 X101.745 Y99.229 E.01858
; WIPE_START
G1 F24000
G1 X101.229 Y99.229 E-.19598
G1 X101.229 Y100.713 E-.56402
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.16 I.037 J1.216 P1  F30000
G1 X150.173 Y99.229 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F4800
G1 X150.173 Y130.877 E1.14038
G1 X150.853 Y130.877 E.0245
G2 X150.967 Y128.522 I-30.428 J-2.659 E.08499
G1 X151.05 Y128.441 E.00417
G1 X151.05 Y101.566 E.9684
G1 X150.961 Y101.477 E.00451
G3 X151.05 Y99.229 I7.602 J-.827 E.08137
M73 P72 R4
G1 X151.263 Y99.229 E.0077
G1 X151.183 Y99.309 E.00409
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.04314
G1 X151.05 Y99.229 E-.08116
G1 X151.05 Y99.443 E-.08116
G1 X150.961 Y99.531 E-.04752
G1 X150.961 Y100.865 E-.50702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.16 I.266 J1.187 P1  F30000
G1 X158.255 Y99.229 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F4800
G1 X158.771 Y99.229 E.01858
G1 X158.771 Y130.877 E1.14038
G1 X158.067 Y130.877 E.02538
G1 X158.067 Y99.229 E1.14038
G1 X157.737 Y99.229 E.01189
G1 X158.039 Y99.57 E.0164
; WIPE_START
G1 F24000
G1 X157.737 Y99.229 E-.173
G1 X158.067 Y99.229 E-.1254
G1 X158.067 Y100.444 E-.46159
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.16 I-1.186 J-.274 P1  F30000
M73 P73 R4
G1 X157.765 Y101.751 Z6.16
G1 Z5.76
G1 E.8 F1800
G1 F4800
G1 X157.189 Y101.793 E.02079
G1 X157.189 Y128.216 E.9521
G1 X156.312 Y128.216 E.0316
G1 X156.312 Y101.793 E.9521
G1 X155.435 Y101.793 E.0316
G1 X155.435 Y128.216 E.9521
G1 X154.558 Y128.216 E.0316
G1 X154.558 Y101.793 E.9521
G1 X153.681 Y101.793 E.0316
G1 X153.681 Y128.216 E.9521
G1 X152.804 Y128.216 E.0316
G1 X152.804 Y101.793 E.9521
G1 X151.927 Y101.793 E.0316
G1 X151.927 Y128.216 E.9521
G1 X151.281 Y128.216 E.02328
G1 X151.185 Y128.309 E.00483
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X151.281 Y128.216 E-.05095
G1 X151.927 Y128.216 E-.24552
G1 X151.927 Y126.996 E-.46352
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
G3 Z6.16 I1.211 J.118 P1  F30000
G1 X154.5 Y100.652 Z6.16
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.217 J-.021 P1  F30000
G1 X103.117 Y129.356 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.913 Y129.356 E.15907
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.101 E2.24646
G1 X156.883 Y129.356 E.15907
G3 X103.119 Y129.416 I-26.883 J-.602 E2.76027
G1 X102.715 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.295 Y128.964 E.17145
G1 X108.298 Y129.062 E.00302
G2 X151.705 Y128.964 I21.703 J-.31 E2.07922
G1 X157.285 Y128.964 E.17145
G3 X102.716 Y129.024 I-27.285 J-.214 E2.61894
M204 S10000
; WIPE_START
G1 F24000
G1 X104.716 Y129.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.373 J1.158 P1  F30000
G1 X106.896 Y129.705 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F15476.087
G2 X113.756 Y144.244 I20.234 J-16.882 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.156 J-18.102 E.054
G1 X152.078 Y132.79 F30000
G1 F15476.087
G3 X151.732 Y134.38 I-28.335 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F15476.087
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F15476.087
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z6.2 I.985 J-.715 P1  F30000
G1 X102.235 Y128.255 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F4800
G1 X102.811 Y128.216 E.02078
G1 X102.811 Y101.793 E.9521
G1 X103.688 Y101.793 E.0316
G1 X103.688 Y128.216 E.9521
G1 X104.565 Y128.216 E.0316
G1 X104.565 Y101.793 E.9521
G1 X105.442 Y101.793 E.0316
G1 X105.442 Y128.216 E.9521
G1 X106.319 Y128.216 E.0316
G1 X106.319 Y101.793 E.9521
G1 X107.196 Y101.793 E.0316
G1 X107.196 Y128.216 E.9521
G1 X108.073 Y128.216 E.0316
G1 X108.073 Y101.793 E.9521
G1 X108.723 Y101.793 E.02342
G1 X108.817 Y101.699 E.00478
; WIPE_START
G1 F24000
G1 X108.723 Y101.793 E-.05037
G1 X108.073 Y101.793 E-.24701
G1 X108.073 Y103.01 E-.46262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.193 J.24 P1  F30000
G1 X108.817 Y99.309 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4800
G1 X108.737 Y99.229 E.00409
G1 X108.95 Y99.229 E.0077
G2 X109.039 Y99.531 I.195 J.107 E.01259
G1 X109.039 Y101.477 E.07013
G1 X108.95 Y101.566 E.00451
G1 X108.95 Y128.441 E.9684
G1 X109.033 Y128.522 E.00417
G2 X109.147 Y130.877 I81.534 J-2.781 E.08497
G1 X109.827 Y130.877 E.0245
G1 X109.827 Y99.229 E1.14038
; WIPE_START
G1 F24000
G1 X109.827 Y101.229 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P74 R4
G3 Z6.4 I.251 J-1.191 P1  F30000
G1 X101.961 Y99.57 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4800
G1 X102.263 Y99.229 E.0164
G1 X101.933 Y99.229 E.01189
G1 X101.933 Y130.877 E1.14038
G1 X101.229 Y130.877 E.02538
G1 X101.229 Y99.229 E1.14038
G1 X101.745 Y99.229 E.01858
; WIPE_START
G1 F24000
G1 X101.229 Y99.229 E-.19598
G1 X101.229 Y100.713 E-.56402
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.037 J1.216 P1  F30000
G1 X150.173 Y99.229 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4800
G1 X150.173 Y130.877 E1.14038
G1 X150.853 Y130.877 E.0245
G2 X150.967 Y128.522 I-30.428 J-2.659 E.08499
G1 X151.05 Y128.441 E.00417
G1 X151.05 Y101.566 E.9684
G1 X150.961 Y101.477 E.00451
G3 X151.05 Y99.229 I7.602 J-.827 E.08137
G1 X151.263 Y99.229 E.0077
G1 X151.183 Y99.309 E.00409
; WIPE_START
G1 F24000
G1 X151.263 Y99.229 E-.04314
G1 X151.05 Y99.229 E-.08116
G1 X151.05 Y99.443 E-.08116
G1 X150.961 Y99.531 E-.04752
G1 X150.961 Y100.865 E-.50702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.266 J1.187 P1  F30000
G1 X158.255 Y99.229 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4800
G1 X158.771 Y99.229 E.01858
G1 X158.771 Y130.877 E1.14038
G1 X158.067 Y130.877 E.02538
G1 X158.067 Y99.229 E1.14038
G1 X157.737 Y99.229 E.01189
G1 X158.039 Y99.57 E.0164
; WIPE_START
G1 F24000
G1 X157.737 Y99.229 E-.173
G1 X158.067 Y99.229 E-.1254
G1 X158.067 Y100.444 E-.46159
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.186 J-.274 P1  F30000
G1 X157.765 Y101.751 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4800
G1 X157.189 Y101.793 E.02079
G1 X157.189 Y128.216 E.9521
G1 X156.312 Y128.216 E.0316
G1 X156.312 Y101.793 E.9521
G1 X155.435 Y101.793 E.0316
G1 X155.435 Y128.216 E.9521
G1 X154.558 Y128.216 E.0316
G1 X154.558 Y101.793 E.9521
G1 X153.681 Y101.793 E.0316
G1 X153.681 Y128.216 E.9521
G1 X152.804 Y128.216 E.0316
G1 X152.804 Y101.793 E.9521
G1 X151.927 Y101.793 E.0316
G1 X151.927 Y128.216 E.9521
G1 X151.281 Y128.216 E.02328
G1 X151.185 Y128.309 E.00483
; WIPE_START
G1 F24000
G1 X151.281 Y128.216 E-.05095
G1 X151.927 Y128.216 E-.24552
G1 X151.927 Y126.996 E-.46352
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.211 J.118 P1  F30000
G1 X154.5 Y100.652 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.217 J-.021 P1  F30000
G1 X103.117 Y129.356 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.913 Y129.356 E.15907
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.105 E2.24623
G1 X156.883 Y129.356 E.15907
G3 X103.119 Y129.416 I-26.883 J-.597 E2.76058
G1 X102.715 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.295 Y128.964 E.17145
G1 X108.299 Y129.109 E.00445
G2 X151.705 Y128.964 I21.702 J-.35 E2.07819
G1 X157.285 Y128.964 E.17145
G3 X102.716 Y129.024 I-27.285 J-.206 E2.61946
M204 S10000
; WIPE_START
G1 F24000
G1 X104.716 Y129.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.373 J1.158 P1  F30000
G1 X106.896 Y129.705 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F15476.087
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
M73 P75 R4
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.153 J-18.099 E.054
G1 X152.078 Y132.79 F30000
G1 F15476.087
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z6.4
G1 Z6
G1 E.8 F1800
G1 F15476.087
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F15476.087
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z6.4 I1.019 J.665 P1  F30000
G1 X154.5 Y100.652 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4269
G1 X152.102 Y100.652 E.07954
G1 X152.102 Y100.356 E.00981
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y100.652 E.00981
G1 X154.56 Y100.652 E.07755
G1 X154.5 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4269
G1 X151.71 Y101.044 E.08573
G1 X151.71 Y99.964 E.03319
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.044 E.03319
G1 X154.56 Y101.044 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X152.56 Y101.044 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.01 J-1.217 P1  F30000
G1 X103.102 Y100.652 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4269
G1 X103.102 Y100.356 E.00981
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y100.652 E.00981
G1 X103.162 Y100.652 E.1571
G1 X102.71 Y101.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4269
G1 X102.71 Y99.964 E.03319
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.044 E.03319
G1 X102.77 Y101.044 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X102.71 Y99.964 E-.41103
G1 X103.628 Y99.964 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.217 J-.021 P1  F30000
G1 X103.117 Y129.356 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4269
G1 X107.913 Y129.356 E.15907
G1 X107.925 Y129.856 E.01658
G2 X152.087 Y129.356 I22.071 J-1.101 E2.24646
G1 X156.883 Y129.356 E.15907
G3 X103.119 Y129.416 I-26.883 J-.596 E2.76068
G1 X102.715 Y128.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4269
G1 X108.295 Y128.964 E.17145
G1 X108.3 Y129.156 E.00588
G2 X151.705 Y128.964 I21.701 J-.403 E2.07634
G1 X157.285 Y128.964 E.17145
G3 X102.716 Y129.024 I-27.285 J-.213 E2.619
M204 S10000
; WIPE_START
G1 F24000
G1 X104.716 Y129.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.373 J1.158 P1  F30000
G1 X106.896 Y129.705 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4269
G1 X105.267 Y129.705 E.05401
G1 X103.582 Y131.39 E.07907
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F4269
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F4269
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.178 J-1.792 E.03424
G1 X154.733 Y129.705 E.07907
G1 X153.104 Y129.705 E.05401
; WIPE_START
G1 F24000
G1 X154.733 Y129.705 E-.61876
G1 X154.995 Y129.967 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.002 J-.691 P1  F30000
G1 X138.469 Y153.916 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F4269
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F4269
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S232.05
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
M73 P76 R4
G1 X120.27 Y153.082 E-.14136
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
G3 Z6.6 I.878 J.843 P1  F30000
G1 X152.651 Y119.364 Z6.6
G1 Z6.4
G1 E.8 F1800
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G3 X154.245 Y118.217 I1.849 J.889 E.06791
G1 X154.449 Y118.202 E.00679
G3 X152.626 Y119.418 I.051 J2.051 E.35091
M106 S232.05
M204 S10000
G1 X153.005 Y119.534 F30000
M204 S5000
M106 S255
G1 F3000
G3 X154.294 Y118.607 I1.495 J.719 E.05492
G1 X154.459 Y118.595 E.00549
G3 X152.98 Y119.589 I.041 J1.659 E.28342
M106 S232.05
M204 S10000
; WIPE_START
G1 F24000
G1 X153.177 Y119.252 E-.14824
G1 X153.401 Y119.009 E-.12564
G1 X153.67 Y118.816 E-.12563
G1 X153.971 Y118.68 E-.12563
G1 X154.294 Y118.607 E-.12564
G1 X154.459 Y118.595 E-.06289
G1 X154.58 Y118.604 E-.04632
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.196 J-.222 P1  F30000
G1 X152.451 Y107.145 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
M106 S255
G1 F3000
G3 X154.245 Y105.217 I2.049 J.108 E.09484
G1 X154.449 Y105.202 E.00679
G3 X152.449 Y107.205 I.051 J2.051 E.32397
M106 S232.05
M204 S10000
G1 X152.843 Y107.169 F30000
M204 S5000
M106 S255
G1 F3000
G3 X154.294 Y105.607 I1.657 J.084 E.07681
G1 X154.459 Y105.595 E.00549
G3 X152.841 Y107.229 I.041 J1.659 E.26154
M106 S232.05
M204 S10000
; WIPE_START
G1 F24000
G1 X152.891 Y106.845 E-.14739
G1 X153.004 Y106.534 E-.12564
G1 X153.177 Y106.252 E-.12564
G1 X153.401 Y106.009 E-.12562
G1 X153.67 Y105.816 E-.12564
G1 X153.934 Y105.697 E-.11006
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.01 J-1.217 P1  F30000
G1 X104.846 Y105.308 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
M106 S255
G1 F3000
G3 X105.245 Y105.217 I.654 J1.945 E.01358
G1 X105.449 Y105.202 E.00679
G3 X104.79 Y105.328 I.051 J2.051 E.40523
M106 S232.05
M204 S10000
G1 X104.971 Y105.68 F30000
M204 S5000
M106 S255
G1 F3000
G3 X105.294 Y105.607 I.529 J1.573 E.01099
G1 X105.459 Y105.595 E.00549
G3 X104.915 Y105.701 I.041 J1.659 E.32736
M106 S232.05
M204 S10000
; WIPE_START
G1 F24000
G1 X105.294 Y105.607 E-.14827
G1 X105.459 Y105.595 E-.06289
G1 X105.788 Y105.619 E-.12564
G1 X106.107 Y105.709 E-.12563
G1 X106.401 Y105.86 E-.12564
G1 X106.659 Y106.066 E-.12563
G1 X106.738 Y106.159 E-.04631
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.208 J-.15 P1  F30000
G1 X105.245 Y118.217 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
M106 S255
G1 F3000
G1 X105.449 Y118.202 E.00679
G3 X105.185 Y118.226 I.051 J2.051 E.41882
M106 S232.05
M204 S10000
G1 X105.294 Y118.607 F30000
M204 S5000
M106 S255
G1 F3000
G1 X105.459 Y118.595 E.00549
G3 X105.234 Y118.615 I.041 J1.659 E.33835
M106 S232.05
M204 S10000
; WIPE_START
G1 F24000
G1 X105.459 Y118.595 E-.08561
G1 X105.788 Y118.619 E-.12564
G1 X106.107 Y118.709 E-.12564
G1 X106.401 Y118.86 E-.12563
G1 X106.535 Y118.956 E-.0629
G1 X106.772 Y119.187 E-.12562
G1 X106.933 Y119.424 E-.10896
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.193 J-.24 P1  F30000
G1 X103.102 Y100.356 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y101.454 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X107.898 Y128.554 E.89896
M106 S232.05
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X107.902 Y128.937 E.01269
G2 X152.102 Y128.554 I22.1 J-.188 E2.30339
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X152.102 Y101.454 E.89896
M106 S232.05
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X152.102 Y100.356 E.03642
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y101.454 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X156.898 Y128.554 E.89896
M106 S232.05
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X156.893 Y128.937 E.01269
G3 X103.102 Y128.554 I-26.896 J-.186 E2.80328
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X103.102 Y101.454 E.89896
M106 S232.05
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X103.102 Y100.416 E.03443
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y101.454 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X108.29 Y128.554 E.89896
M106 S232.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.294 Y128.923 E.01134
G2 X151.71 Y128.554 I21.708 J-.175 E2.09621
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X151.71 Y101.454 E.89896
M106 S232.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.71 Y99.964 E.04578
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y101.454 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X157.29 Y128.554 E.89896
M106 S232.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.286 Y128.923 E.01134
G3 X102.71 Y128.554 I-27.288 J-.173 E2.63495
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X102.71 Y101.454 E.89896
M106 S232.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.71 Y100.024 E.04394
M204 S10000
G1 X103.452 Y100.52 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452595
M106 S255
G1 F3000
G1 X103.452 Y105.573 E.16869
G1 X103.53 Y105.485 E.00393
G1 X103.738 Y105.66 E.0091
G1 X103.861 Y105.527 E.00604
G1 X103.861 Y100.69 E.1615
G1 X104.271 Y100.69 E.01368
G1 X104.271 Y105.212 E.15096
G1 X104.681 Y105.017 E.01514
G1 X104.681 Y100.69 E.14448
G1 X105.09 Y100.69 E.01368
G1 X105.09 Y104.911 E.14092
G3 X105.5 Y104.878 I.287 J.997 E.01381
G1 X105.5 Y100.69 E.13981
G1 X105.91 Y100.69 E.01368
G1 X105.91 Y104.914 E.14102
G3 X106.319 Y105.024 I-.066 J1.068 E.01425
G1 X106.319 Y100.69 E.14468
G1 X106.729 Y100.69 E.01368
G1 X106.729 Y105.22 E.15123
G3 X107.139 Y105.534 I-.572 J1.17 E.01735
G1 X107.139 Y100.69 E.16172
G1 X107.548 Y100.69 E.01368
G1 X107.548 Y105.831 E.17164
M106 S232.05
G1 X107.453 Y106.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126789
G1 F15000
G1 X107.571 Y106.246 E.00138
; LINE_WIDTH: 0.17312
G1 X107.629 Y106.331 E.0011
; LINE_WIDTH: 0.136071
G1 X107.654 Y106.462 E.00101
; LINE_WIDTH: 0.0969206
G1 X107.672 Y106.567 E.00047
; WIPE_START
G1 F24000
G1 X107.654 Y106.462 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.216 J-.034 P1  F30000
G1 X107.601 Y108.354 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.119475
G1 F15000
G2 X107.671 Y107.939 I-8.165 J-1.606 E.00262
G1 X107.694 Y108.118 F30000
; LINE_WIDTH: 0.195627
G1 F15000
G1 X107.593 Y108.266 E.00224
; LINE_WIDTH: 0.17922
G1 X107.524 Y108.357 E.00126
; LINE_WIDTH: 0.129162
G1 X107.392 Y108.523 E.00149
; WIPE_START
G1 F24000
G1 X107.524 Y108.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P77 R4
G3 Z6.8 I.63 J-1.041 P1  F30000
G1 X103.608 Y105.985 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.0973917
G1 F15000
G1 X103.544 Y106.061 E.00044
; LINE_WIDTH: 0.111416
G1 X103.476 Y106.152 E.00063
; LINE_WIDTH: 0.147279
G1 X103.403 Y106.248 E.00103
; LINE_WIDTH: 0.181651
G1 X103.306 Y106.391 E.00195
G1 X103.329 Y106.569 F30000
; LINE_WIDTH: 0.119476
G1 F15000
G3 X103.399 Y106.155 I8.328 J1.205 E.00262
; WIPE_START
G1 F24000
G1 X103.329 Y106.569 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.217 J-.001 P1  F30000
G1 X103.328 Y107.942 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.12919
G1 F15000
G1 X103.346 Y108.046 E.00075
; LINE_WIDTH: 0.16146
G1 X103.365 Y108.151 E.00103
; LINE_WIDTH: 0.148168
G2 X103.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111392
G1 X103.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973903
G1 X103.547 Y108.427 E.00044
G1 X103.452 Y108.653 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452593
M106 S255
G1 F3000
G1 X103.452 Y118.573 E.33115
G1 X103.53 Y118.485 E.00393
G1 X103.738 Y118.66 E.0091
G1 X103.861 Y118.527 E.00603
G1 X103.861 Y108.975 E.3189
G2 X104.271 Y109.289 I.982 J-.856 E.01735
G1 X104.271 Y118.212 E.29788
G1 X104.681 Y118.017 E.01514
G1 X104.681 Y109.485 E.28484
G2 X105.09 Y109.595 I.476 J-.958 E.01425
G1 X105.09 Y117.911 E.27762
G3 X105.5 Y117.878 I.287 J.997 E.01381
G1 X105.5 Y109.631 E.2753
G2 X105.91 Y109.598 I.123 J-1.03 E.01381
G1 X105.91 Y117.914 E.27762
G3 X106.319 Y118.024 I-.066 J1.068 E.01425
G1 X106.319 Y109.491 E.28484
G1 X106.729 Y109.297 E.01514
G1 X106.729 Y118.22 E.29787
G3 X107.139 Y118.534 I-.572 J1.17 E.01735
G1 X107.139 Y108.981 E.31889
G1 X107.262 Y108.849 E.00604
G1 X107.49 Y109.04 E.00994
G1 X107.548 Y108.966 E.00315
G1 X107.548 Y118.825 E.32911
M106 S232.05
G1 X107.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126788
G1 F15000
G1 X107.571 Y119.246 E.00138
; LINE_WIDTH: 0.173122
G1 X107.629 Y119.331 E.0011
; LINE_WIDTH: 0.136071
G1 X107.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969206
G1 X107.672 Y119.567 E.00047
; WIPE_START
G1 F24000
G1 X107.654 Y119.462 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.216 J-.034 P1  F30000
G1 X107.601 Y121.354 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.119475
G1 F15000
G2 X107.671 Y120.939 I-8.252 J-1.619 E.00262
G1 X107.694 Y121.118 F30000
; LINE_WIDTH: 0.195637
G1 F15000
G1 X107.593 Y121.266 E.00224
; LINE_WIDTH: 0.179237
G1 X107.524 Y121.357 E.00126
; LINE_WIDTH: 0.12917
G1 X107.392 Y121.523 E.00149
; WIPE_START
G1 F24000
G1 X107.524 Y121.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.63 J-1.041 P1  F30000
G1 X103.608 Y118.985 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.0973922
G1 F15000
G1 X103.544 Y119.061 E.00044
; LINE_WIDTH: 0.111422
G1 X103.476 Y119.152 E.00063
; LINE_WIDTH: 0.147288
G1 X103.403 Y119.248 E.00103
; LINE_WIDTH: 0.181661
G1 X103.306 Y119.391 E.00195
G1 X103.329 Y119.569 F30000
; LINE_WIDTH: 0.119479
G1 F15000
G3 X103.399 Y119.155 I8.32 J1.204 E.00262
; WIPE_START
G1 F24000
G1 X103.329 Y119.569 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.217 J-.001 P1  F30000
G1 X103.328 Y120.942 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.129192
G1 F15000
G1 X103.346 Y121.046 E.00075
; LINE_WIDTH: 0.161464
G1 X103.365 Y121.151 E.00103
; LINE_WIDTH: 0.148193
G2 X103.429 Y121.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111415
G1 X103.487 Y121.348 E.00058
; LINE_WIDTH: 0.0973911
G1 X103.547 Y121.427 E.00044
G1 X103.436 Y121.632 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.420431
M106 S255
G1 F3000
G1 X103.436 Y128.753 E.21907
G1 X103.455 Y129.526 E.02377
G1 X103.813 Y129.526 E.01102
G1 X103.813 Y121.928 E.23373
G2 X104.191 Y122.237 I.953 J-.779 E.01511
G1 X104.191 Y129.526 E.22422
G1 X104.568 Y129.526 E.01161
G1 X104.568 Y122.441 E.21795
G2 X104.946 Y122.569 I.506 J-.87 E.01235
G1 X104.946 Y129.526 E.214
G1 X105.323 Y129.526 E.01161
G1 X105.323 Y122.635 E.21197
G1 X105.701 Y122.626 E.01162
G1 X105.701 Y129.526 E.21226
G1 X106.078 Y129.526 E.01161
G1 X106.078 Y122.559 E.2143
G2 X106.456 Y122.43 I-.132 J-.999 E.01236
G1 X106.456 Y129.526 E.21829
G1 X106.833 Y129.526 E.01161
G1 X106.833 Y122.222 E.22468
G2 X107.211 Y121.904 I-.599 J-1.093 E.01529
G1 X107.211 Y129.695 E.23969
M106 S232.05
G1 X106.683 Y129.918 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X105.054 Y129.918 E.05401
G1 X103.582 Y131.39 E.06907
G2 X103.71 Y132.414 I10.323 J-.77 E.03423
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I23.12 J-14.38 E.19098
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F15476.087
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-20.999 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.153 J-18.099 E.054
G1 X152.078 Y132.79 F30000
G1 F15476.087
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.182 J-1.792 E.03424
G1 X154.946 Y129.918 E.06907
G1 X153.317 Y129.918 E.05401
G1 X156.565 Y129.695 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.420431
M106 S255
G1 F3000
G1 X156.565 Y121.946 E.2384
G1 X156.49 Y122.04 E.0037
G1 X156.262 Y121.849 E.00916
G1 X156.187 Y121.929 E.00338
G1 X156.187 Y129.526 E.23369
G1 X155.809 Y129.526 E.01161
G1 X155.809 Y122.239 E.22416
G3 X155.432 Y122.44 I-.687 J-.833 E.01325
G1 X155.432 Y129.526 E.21797
G1 X155.054 Y129.526 E.01161
G1 X155.054 Y122.565 E.21414
G3 X154.677 Y122.626 I-.342 J-.903 E.01185
G1 X154.677 Y129.526 E.21224
G1 X154.299 Y129.526 E.01161
G1 X154.299 Y122.631 E.21209
G1 X153.922 Y122.565 E.01179
G1 X153.922 Y129.526 E.21413
G1 X153.544 Y129.526 E.01161
G1 X153.544 Y122.432 E.21823
G3 X153.167 Y122.222 I.331 J-1.039 E.01338
G1 X153.167 Y129.526 E.22469
G1 X152.789 Y129.526 E.01161
G1 X152.789 Y121.662 E.24192
M106 S232.05
G1 X152.547 Y121.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973919
G1 F15000
G1 X152.487 Y121.348 E.00044
; LINE_WIDTH: 0.111411
G1 X152.429 Y121.263 E.00058
; LINE_WIDTH: 0.148189
G3 X152.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X152.346 Y121.046 E.00103
; LINE_WIDTH: 0.12919
G1 X152.328 Y120.942 E.00075
; WIPE_START
G1 F24000
G1 X152.346 Y121.046 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.216 J.034 P1  F30000
G1 X152.399 Y119.155 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.119475
G1 F15000
G2 X152.329 Y119.569 I8.169 J1.606 E.00262
G1 X152.306 Y119.391 F30000
; LINE_WIDTH: 0.181659
G1 F15000
G1 X152.403 Y119.248 E.00195
; LINE_WIDTH: 0.147286
G1 X152.476 Y119.152 E.00103
; LINE_WIDTH: 0.111422
G1 X152.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973923
G1 X152.608 Y118.985 E.00044
; WIPE_START
G1 F24000
G1 X152.544 Y119.061 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.656 J1.025 P1  F30000
G1 X156.392 Y121.523 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.129171
G1 F15000
G1 X156.524 Y121.357 E.00149
; LINE_WIDTH: 0.179239
G1 X156.593 Y121.266 E.00126
; LINE_WIDTH: 0.195641
G1 X156.694 Y121.118 E.00224
G1 X156.671 Y120.939 F30000
; LINE_WIDTH: 0.119478
G1 F15000
G3 X156.601 Y121.354 I-8.319 J-1.204 E.00262
; WIPE_START
G1 F24000
G1 X156.671 Y120.939 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J.001 P1  F30000
G1 X156.672 Y119.567 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.0969206
G1 F15000
G1 X156.654 Y119.462 E.00047
; LINE_WIDTH: 0.136074
G1 X156.629 Y119.331 E.00101
; LINE_WIDTH: 0.173127
G1 X156.571 Y119.246 E.0011
; LINE_WIDTH: 0.126791
G1 X156.453 Y119.081 E.00138
G1 X156.548 Y118.825 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452593
M106 S255
G1 F3000
G1 X156.548 Y108.966 E.32911
G1 X156.49 Y109.04 E.00315
G1 X156.262 Y108.849 E.00994
G1 X156.139 Y108.981 E.00604
G1 X156.139 Y118.534 E.31889
G2 X155.729 Y118.22 I-.981 J.856 E.01735
G1 X155.729 Y109.297 E.29787
G1 X155.319 Y109.491 E.01514
G1 X155.319 Y118.024 E.28484
G2 X154.91 Y117.914 I-.476 J.958 E.01425
G1 X154.91 Y109.598 E.27762
G3 X154.5 Y109.631 I-.287 J-.997 E.01381
G1 X154.5 Y117.878 E.2753
G2 X154.09 Y117.911 I-.123 J1.03 E.01381
G1 X154.09 Y109.595 E.27762
G3 X153.681 Y109.485 I.066 J-1.068 E.01425
G1 X153.681 Y118.017 E.28484
G1 X153.271 Y118.212 E.01514
G1 X153.271 Y109.289 E.29788
G3 X152.861 Y108.975 I.572 J-1.17 E.01735
G1 X152.861 Y118.527 E.3189
G1 X152.738 Y118.66 E.00603
G1 X152.53 Y118.485 E.0091
G1 X152.452 Y118.573 E.00393
G1 X152.452 Y108.653 E.33115
M106 S232.05
G1 X152.547 Y108.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973912
G1 F15000
G1 X152.487 Y108.348 E.00044
; LINE_WIDTH: 0.11139
G1 X152.429 Y108.263 E.00058
; LINE_WIDTH: 0.148164
G3 X152.365 Y108.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X152.346 Y108.046 E.00103
; LINE_WIDTH: 0.129188
G1 X152.328 Y107.942 E.00075
; WIPE_START
G1 F24000
G1 X152.346 Y108.046 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.216 J.034 P1  F30000
G1 X152.399 Y106.155 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.119472
G1 F15000
G2 X152.329 Y106.569 I8.25 J1.618 E.00262
G1 X152.306 Y106.391 F30000
; LINE_WIDTH: 0.18165
M73 P78 R4
G1 F15000
G1 X152.403 Y106.248 E.00195
; LINE_WIDTH: 0.147279
G1 X152.476 Y106.152 E.00103
; LINE_WIDTH: 0.111416
G1 X152.544 Y106.061 E.00063
; LINE_WIDTH: 0.0973917
G1 X152.608 Y105.985 E.00044
; WIPE_START
G1 F24000
G1 X152.544 Y106.061 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.656 J1.025 P1  F30000
G1 X156.392 Y108.523 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.129161
G1 F15000
G1 X156.524 Y108.357 E.00149
; LINE_WIDTH: 0.17922
G1 X156.593 Y108.266 E.00126
; LINE_WIDTH: 0.195631
G1 X156.694 Y108.118 E.00224
G1 X156.671 Y107.939 F30000
; LINE_WIDTH: 0.119479
G1 F15000
G3 X156.601 Y108.354 I-8.245 J-1.192 E.00262
; WIPE_START
G1 F24000
G1 X156.671 Y107.939 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J.001 P1  F30000
G1 X156.672 Y106.567 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.0969206
G1 F15000
G1 X156.654 Y106.462 E.00047
; LINE_WIDTH: 0.136072
G1 X156.629 Y106.331 E.00101
; LINE_WIDTH: 0.173122
G1 X156.571 Y106.246 E.0011
; LINE_WIDTH: 0.126789
G1 X156.453 Y106.081 E.00138
G1 X156.548 Y105.825 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452595
M106 S255
G1 F3000
G1 X156.548 Y100.69 E.17144
G1 X156.139 Y100.69 E.01368
G1 X156.139 Y105.534 E.16172
G2 X155.729 Y105.22 I-.982 J.856 E.01735
G1 X155.729 Y100.69 E.15123
G1 X155.319 Y100.69 E.01368
G1 X155.319 Y105.024 E.14468
G2 X154.91 Y104.914 I-.476 J.958 E.01425
G1 X154.91 Y100.69 E.14102
G1 X154.5 Y100.69 E.01368
G1 X154.5 Y104.878 E.13981
G2 X154.09 Y104.911 I-.123 J1.03 E.01381
G1 X154.09 Y100.69 E.14092
G1 X153.681 Y100.69 E.01368
G1 X153.681 Y105.017 E.14448
G1 X153.271 Y105.212 E.01514
G1 X153.271 Y100.69 E.15096
G1 X152.861 Y100.69 E.01368
G1 X152.861 Y105.527 E.1615
G1 X152.738 Y105.66 E.00604
G1 X152.529 Y105.485 E.0091
G1 X152.452 Y105.573 E.00393
G1 X152.452 Y100.52 E.16869
M106 S232.05
; WIPE_START
G1 F24000
G1 X152.452 Y102.52 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.174 J-.319 P1  F30000
G1 X138.469 Y153.916 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X139.993 Y153.345 I-4.965 J-15.556 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F15476.087
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z6.8 I.832 J.888 P1  F30000
G1 X153.445 Y122.012 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11725
G1 X153.143 Y121.792 E.01241
G3 X154.245 Y118.217 I1.357 J-1.539 E.15613
G1 X154.449 Y118.202 E.00679
G3 X153.497 Y122.043 I.051 J2.051 E.25026
G1 X153.714 Y121.713 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11725
G1 X153.671 Y121.69 E.0015
G3 X154.294 Y118.607 I.829 J-1.437 E.12713
G1 X154.459 Y118.595 E.00509
G3 X153.907 Y121.803 I.041 J1.659 E.18008
G1 X153.769 Y121.738 E.00468
M204 S10000
; WIPE_START
G1 F24000
G1 X153.671 Y121.69 E-.04138
G1 X153.401 Y121.499 E-.12556
G1 X153.177 Y121.257 E-.12563
M73 P78 R3
G1 X153.004 Y120.975 E-.12564
G1 X152.891 Y120.664 E-.12563
G1 X152.842 Y120.337 E-.12564
G1 X152.854 Y120.099 E-.09052
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.202 J.192 P1  F30000
G1 X155.218 Y105.334 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11725
G1 X155.25 Y105.343 E.00111
G3 X154.245 Y105.217 I-.75 J1.91 E.39364
G1 X154.449 Y105.202 E.00679
G3 X154.856 Y105.233 I.051 J2.051 E.01358
G1 X155.16 Y105.318 E.01046
G1 X155.107 Y105.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11725
G3 X154.294 Y105.607 I-.607 J1.544 E.2949
G1 X154.459 Y105.595 E.00508
G3 X155.05 Y105.688 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X155.401 Y105.86 E-.14826
G1 X155.659 Y106.066 E-.12563
G1 X155.872 Y106.319 E-.12563
G1 X156.03 Y106.609 E-.12564
G1 X156.127 Y106.925 E-.12563
G1 X156.158 Y107.185 E-.09937
G1 X156.157 Y107.211 E-.00984
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.041 J-1.216 P1  F30000
G1 X104.506 Y105.462 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11725
G1 X104.846 Y105.308 E.01237
G3 X105.245 Y105.217 I.654 J1.945 E.01358
G1 X105.449 Y105.202 E.00679
G3 X104.453 Y105.489 I.051 J2.051 E.39284
G1 X104.698 Y105.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11725
G1 X104.971 Y105.68 E.00922
G3 X105.294 Y105.607 I.529 J1.573 E.01018
G1 X105.459 Y105.595 E.00508
G3 X104.644 Y105.832 I.041 J1.659 E.29399
M204 S10000
; WIPE_START
G1 F24000
G1 X104.971 Y105.68 E-.13679
G1 X105.294 Y105.607 E-.12564
G1 X105.459 Y105.595 E-.06289
G1 X105.788 Y105.619 E-.12564
G1 X106.107 Y105.709 E-.12563
G1 X106.401 Y105.86 E-.12564
G1 X106.52 Y105.954 E-.05777
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.217 J.016 P1  F30000
G1 X106.724 Y121.899 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11725
G1 X106.697 Y121.919 E.00111
G3 X105.245 Y118.217 I-1.197 J-1.666 E.24771
G1 X105.449 Y118.202 E.00679
G3 X107.003 Y121.649 I.051 J2.051 E.15953
G1 X106.768 Y121.859 E.01045
G1 X106.558 Y121.524 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11725
G1 X106.468 Y121.601 E.00363
G3 X105.294 Y118.607 I-.968 J-1.348 E.18558
G1 X105.459 Y118.595 E.00509
G3 X106.716 Y121.382 I.041 J1.659 E.11951
G1 X106.602 Y121.484 E.00468
M204 S10000
; WIPE_START
G1 F24000
G1 X106.468 Y121.601 E-.06763
G1 X106.183 Y121.768 E-.12557
G1 X105.869 Y121.873 E-.12563
G1 X105.541 Y121.914 E-.12563
G1 X105.212 Y121.889 E-.12564
G1 X104.906 Y121.804 E-.12054
G1 X104.741 Y121.726 E-.06935
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.213 J-.093 P1  F30000
G1 X103.102 Y100.356 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11725
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30237
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J.001 E2.80314
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11725
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.004 E2.63411
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.197 J-.22 P1  F30000
G1 X103.608 Y105.985 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973912
G1 F11725
G1 X103.544 Y106.061 E.00044
; LINE_WIDTH: 0.111406
G1 X103.476 Y106.152 E.00063
; LINE_WIDTH: 0.147271
G1 X103.403 Y106.248 E.00103
; LINE_WIDTH: 0.181644
G1 X103.306 Y106.391 E.00195
G1 X103.329 Y106.569 F30000
; LINE_WIDTH: 0.11947
G1 F11725
G3 X103.399 Y106.155 I8.327 J1.205 E.00262
G1 X103.329 Y107.939 F30000
; LINE_WIDTH: 0.126453
G1 F11725
G1 X103.355 Y108.096 E.00108
; LINE_WIDTH: 0.16652
G1 X103.367 Y108.162 E.00068
; LINE_WIDTH: 0.146005
G2 X103.429 Y108.263 I.162 J-.03 E.00101
; LINE_WIDTH: 0.111388
G1 X103.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973913
G1 X103.547 Y108.427 E.00044
; WIPE_START
G1 F24000
G1 X103.487 Y108.348 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.054 J1.216 P1  F30000
G1 X107.392 Y108.523 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.129158
G1 F11725
G1 X107.524 Y108.357 E.00149
; LINE_WIDTH: 0.179212
G1 X107.593 Y108.266 E.00126
; LINE_WIDTH: 0.195624
G1 X107.694 Y108.118 E.00224
G1 X107.671 Y107.939 F30000
; LINE_WIDTH: 0.119473
G1 F11725
G3 X107.601 Y108.354 I-8.249 J-1.193 E.00262
G1 X107.672 Y106.567 F30000
; LINE_WIDTH: 0.0969205
G1 F11725
G1 X107.654 Y106.462 E.00047
; LINE_WIDTH: 0.136066
G1 X107.629 Y106.331 E.00101
; LINE_WIDTH: 0.17311
G1 X107.571 Y106.246 E.0011
; LINE_WIDTH: 0.126782
G1 X107.453 Y106.081 E.00138
G1 X107.506 Y105.611 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11725
G1 X107.506 Y100.748 E.1494
G1 X103.494 Y100.748 E.12327
G1 X103.494 Y105.513 E.1464
G1 X103.621 Y105.494 E.00392
G1 X103.733 Y105.579 E.00433
G1 X103.896 Y105.409 E.00724
G1 X104.294 Y105.127 E.01496
G1 X104.739 Y104.931 E.01496
G1 X105.215 Y104.826 E.01496
G1 X105.701 Y104.818 E.01496
G1 X106.18 Y104.906 E.01496
G1 X106.632 Y105.087 E.01496
G1 X107.046 Y105.361 E.01525
G1 X107.338 Y105.677 E.01321
G1 X107.447 Y105.6 E.00409
G1 X107.129 Y104.959 F30000
G1 F11725
G1 X107.129 Y101.126 E.11779
G1 X103.871 Y101.126 E.10009
G1 X103.871 Y104.962 E.11789
G1 X104.139 Y104.784 E.00988
G1 X104.655 Y104.563 E.01726
G1 X105.205 Y104.449 E.01726
G1 X105.767 Y104.446 E.01726
G1 X106.318 Y104.555 E.01726
G1 X106.837 Y104.77 E.01726
G1 X107.078 Y104.926 E.00884
G1 X106.752 Y104.32 F30000
G1 F11725
G1 X106.752 Y101.503 E.08657
G1 X104.248 Y101.503 E.07692
G1 X104.248 Y104.321 E.08659
G1 X104.571 Y104.195 E.01064
G1 X105.196 Y104.072 E.01956
G1 X105.832 Y104.075 E.01956
G1 X106.456 Y104.204 E.01956
G1 X106.696 Y104.298 E.00792
G1 X106.375 Y103.791 F30000
G1 F11725
G1 X106.375 Y101.88 E.05873
G1 X104.625 Y101.88 E.05375
G1 X104.625 Y103.796 E.05889
G1 X105.186 Y103.695 E.01752
G1 X105.898 Y103.703 E.02186
G1 X106.316 Y103.78 E.01305
G1 X105.998 Y103.303 F30000
G1 F11725
G1 X105.998 Y102.257 E.03216
G1 X105.002 Y102.257 E.03058
G1 X105.002 Y103.34 E.03328
G3 X105.938 Y103.304 I.852 J10.058 E.02876
G1 X105.654 Y102.967 F30000
; LINE_WIDTH: 0.351907
G1 F11725
G1 X105.654 Y102.6 E.00924
G1 X105.346 Y102.6 E.00778
G1 X105.346 Y102.971 E.00934
G1 X105.594 Y102.967 E.00627
; WIPE_START
G1 F24000
G1 X105.346 Y102.971 E-.14604
G1 X105.346 Y102.6 E-.21756
G1 X105.654 Y102.6 E-.18121
G1 X105.654 Y102.967 E-.21519
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.209 J.143 P1  F30000
G1 X107.506 Y118.611 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.419999
G1 F11725
G1 X107.506 Y108.997 E.29538
G1 X107.387 Y109.024 E.00373
M73 P79 R3
G1 X107.267 Y108.93 E.0047
G1 X107.104 Y109.1 E.00724
G1 X106.706 Y109.381 E.01496
G1 X106.261 Y109.578 E.01496
G1 X105.785 Y109.683 E.01496
G1 X105.299 Y109.691 E.01496
G1 X104.82 Y109.603 E.01496
G1 X104.368 Y109.421 E.01496
G1 X103.954 Y109.147 E.01525
G1 X103.662 Y108.832 E.01321
G1 X103.566 Y108.903 E.00367
G1 X103.494 Y108.889 E.00225
G1 X103.494 Y118.513 E.29571
G1 X103.621 Y118.494 E.00392
G1 X103.733 Y118.579 E.00433
G1 X103.896 Y118.409 E.00724
G1 X104.294 Y118.127 E.01496
G1 X104.739 Y117.931 E.01496
G1 X105.215 Y117.826 E.01496
G1 X105.701 Y117.818 E.01496
G1 X106.18 Y117.906 E.01496
G1 X106.632 Y118.087 E.01496
G1 X107.046 Y118.361 E.01525
G1 X107.338 Y118.677 E.01321
G1 X107.447 Y118.6 E.00409
G1 X107.129 Y117.959 F30000
G1 F11725
G1 X107.129 Y109.546 E.2585
G1 X106.861 Y109.725 E.00988
G1 X106.345 Y109.946 E.01726
G1 X105.795 Y110.06 E.01726
G1 X105.233 Y110.062 E.01726
G1 X104.682 Y109.954 E.01726
G1 X104.163 Y109.738 E.01726
G1 X103.871 Y109.55 E.01068
G1 X103.871 Y117.962 E.2585
G1 X104.139 Y117.784 E.00988
G1 X104.655 Y117.563 E.01726
G1 X105.205 Y117.449 E.01726
G1 X105.767 Y117.446 E.01726
G1 X106.318 Y117.555 E.01726
G1 X106.837 Y117.77 E.01726
G1 X107.078 Y117.926 E.00884
G1 X106.752 Y117.32 F30000
G1 F11725
G1 X106.752 Y110.188 E.21914
G1 X106.429 Y110.313 E.01064
G1 X105.804 Y110.437 E.01956
G1 X105.168 Y110.434 E.01956
G1 X104.544 Y110.305 E.01956
G1 X104.248 Y110.189 E.00977
G1 X104.248 Y117.321 E.21914
G1 X104.571 Y117.195 E.01064
G1 X105.196 Y117.072 E.01956
G1 X105.832 Y117.075 E.01956
G1 X106.456 Y117.204 E.01956
G1 X106.696 Y117.298 E.00792
G1 X106.375 Y116.791 F30000
G1 F11725
G1 X106.375 Y110.712 E.18678
G1 X105.814 Y110.814 E.01752
G1 X105.102 Y110.805 E.02186
G1 X104.625 Y110.717 E.01489
G1 X104.625 Y116.796 E.18678
G1 X105.186 Y116.695 E.01752
G1 X105.898 Y116.703 E.02186
G1 X106.316 Y116.78 E.01305
G1 X105.998 Y116.303 F30000
G1 F11725
G1 X105.998 Y111.169 E.15778
G3 X105.002 Y111.205 I-.892 J-10.724 E.03061
G1 X105.002 Y116.34 E.15778
G3 X105.938 Y116.304 I.852 J10.059 E.02876
G1 X105.654 Y115.967 F30000
; LINE_WIDTH: 0.351907
G1 F11725
G1 X105.654 Y111.538 E.11151
G1 X105.346 Y111.542 E.00778
G1 X105.346 Y115.971 E.11151
G1 X105.594 Y115.967 E.00627
G1 X103.608 Y118.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F11725
G1 X103.544 Y119.061 E.00044
; LINE_WIDTH: 0.111407
G1 X103.476 Y119.152 E.00063
; LINE_WIDTH: 0.147273
G1 X103.403 Y119.248 E.00103
; LINE_WIDTH: 0.181648
G1 X103.306 Y119.391 E.00195
G1 X103.329 Y119.569 F30000
; LINE_WIDTH: 0.119479
G1 F11725
G3 X103.399 Y119.155 I8.244 J1.192 E.00262
G1 X103.329 Y120.939 F30000
; LINE_WIDTH: 0.119478
G1 F11725
G2 X103.399 Y121.354 I8.231 J-1.19 E.00262
G1 X103.476 Y121.357 F30000
; LINE_WIDTH: 0.111412
G1 F11725
G1 X103.544 Y121.447 E.00063
; LINE_WIDTH: 0.0973918
G1 X103.608 Y121.523 E.00044
G1 X103.476 Y121.357 F30000
; LINE_WIDTH: 0.147277
G1 F11725
G1 X103.403 Y121.26 E.00103
; LINE_WIDTH: 0.18165
G1 X103.306 Y121.118 E.00195
; WIPE_START
G1 F24000
G1 X103.403 Y121.26 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.08 J1.214 P1  F30000
G1 X107.392 Y121.523 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.129167
G1 F11725
G1 X107.524 Y121.357 E.00149
; LINE_WIDTH: 0.179231
G1 X107.593 Y121.266 E.00126
; LINE_WIDTH: 0.19563
G1 X107.694 Y121.118 E.00224
G1 X107.671 Y120.939 F30000
; LINE_WIDTH: 0.119476
G1 F11725
G3 X107.601 Y121.354 I-8.31 J-1.203 E.00262
G1 X107.672 Y119.567 F30000
; LINE_WIDTH: 0.0969206
G1 F11725
G1 X107.654 Y119.462 E.00047
; LINE_WIDTH: 0.13607
G1 X107.629 Y119.331 E.00101
; LINE_WIDTH: 0.173118
G1 X107.571 Y119.246 E.0011
; LINE_WIDTH: 0.126786
G1 X107.453 Y119.081 E.00138
G1 X106.752 Y128.764 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11725
G1 X106.752 Y123.188 E.17135
G1 X106.429 Y123.313 E.01064
G1 X105.804 Y123.437 E.01956
G1 X105.168 Y123.434 E.01956
G1 X104.567 Y123.313 E.01882
G1 X104.248 Y123.196 E.01044
G1 X104.248 Y128.732 E.17011
G1 X104.262 Y129.286 E.01702
G1 X106.764 Y129.286 E.07689
G1 X106.753 Y128.824 E.0142
G1 X107.506 Y128.764 F30000
G1 F11725
G1 X107.506 Y121.997 E.20793
G1 X107.387 Y122.024 E.00373
G1 X107.267 Y121.93 E.0047
G1 X107.104 Y122.1 E.00724
G1 X106.706 Y122.381 E.01496
G1 X106.261 Y122.578 E.01496
G1 X105.785 Y122.683 E.01496
G1 X105.299 Y122.691 E.01496
G3 X104.05 Y122.222 I.275 J-2.626 E.04142
G1 X103.743 Y121.922 E.01321
G1 X103.625 Y122.012 E.00457
G1 X103.494 Y121.986 E.0041
G1 X103.494 Y128.742 E.20757
G1 X103.527 Y130.04 E.03992
G1 X107.534 Y130.04 E.12315
G2 X107.507 Y128.824 I-32.006 J.102 E.03738
G1 X107.129 Y128.035 F30000
G1 F11725
G1 X107.129 Y122.546 E.16864
G1 X106.861 Y122.725 E.00988
G1 X106.345 Y122.946 E.01726
G1 X105.795 Y123.06 E.01726
G1 X105.233 Y123.062 E.01726
G1 X104.697 Y122.959 E.01678
G3 X103.871 Y122.556 I.811 J-2.706 E.02836
G1 X103.871 Y128.737 E.18994
G1 X103.894 Y129.663 E.02847
G1 X107.151 Y129.663 E.10007
G3 X107.129 Y128.095 I31.738 J-1.234 E.04821
G1 X106.375 Y128.035 F30000
G1 F11725
G1 X106.375 Y123.712 E.13281
G1 X105.814 Y123.814 E.01752
G1 X105.102 Y123.805 E.02186
G1 X104.625 Y123.718 E.0149
G1 X104.63 Y128.909 E.15952
G1 X106.378 Y128.909 E.05371
G1 X106.375 Y128.095 E.02503
G1 X105.998 Y128.532 F30000
G1 F11725
G1 X105.998 Y124.169 E.13408
G3 X105.002 Y124.205 I-.894 J-10.768 E.03061
G1 X105.002 Y128.532 E.13295
G1 X105.938 Y128.532 E.02873
G1 X105.654 Y128.189 F30000
; LINE_WIDTH: 0.351907
G1 F11725
G1 X105.654 Y124.538 E.09193
G1 X105.346 Y124.542 E.00778
G1 X105.346 Y128.189 E.09183
G1 X105.594 Y128.189 E.00627
G1 X106.168 Y130.433 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11725
G1 X104.54 Y130.433 E.05401
G1 X103.582 Y131.39 E.04492
G2 X103.71 Y132.414 I10.321 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F11725
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-20.999 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.153 J-18.099 E.054
G1 X152.078 Y132.79 F30000
G1 F11725
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.856 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.176 J-1.791 E.03424
G1 X155.46 Y130.433 E.04492
G1 X153.832 Y130.433 E.05401
G1 X154.346 Y128.189 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F11725
G1 X154.654 Y128.189 E.00778
G1 X154.654 Y124.538 E.09193
G1 X154.346 Y124.542 E.00778
G1 X154.346 Y128.129 E.09032
G1 X154.002 Y128.532 F30000
; LINE_WIDTH: 0.419999
G1 F11725
G1 X154.998 Y128.532 E.03058
G1 X154.998 Y124.169 E.13408
G3 X154.002 Y124.205 I-.894 J-10.766 E.03061
G1 X154.002 Y128.472 E.13111
G1 X153.625 Y128.764 F30000
G1 F11725
G1 X153.622 Y128.909 E.00445
G1 X155.37 Y128.909 E.05371
G2 X155.375 Y123.712 I-502.015 J-3.036 E.15969
G1 X154.814 Y123.814 E.01752
G1 X154.102 Y123.805 E.02186
G1 X153.625 Y123.718 E.0149
G1 X153.625 Y128.704 E.15323
G1 X153.248 Y128.764 F30000
G1 F11725
G1 X153.236 Y129.286 E.01605
G1 X155.738 Y129.286 E.07689
G1 X155.752 Y128.732 E.01702
G1 X155.752 Y123.188 E.17037
G1 X155.429 Y123.313 E.01064
G1 X154.804 Y123.437 E.01956
G1 X154.168 Y123.434 E.01956
G1 X153.567 Y123.313 E.01882
G1 X153.248 Y123.196 E.01044
G1 X153.248 Y128.704 E.16925
G1 X152.871 Y128.764 F30000
G1 F11725
G1 X152.849 Y129.663 E.02764
G1 X156.106 Y129.663 E.10007
G1 X156.129 Y128.737 E.02847
G1 X156.129 Y122.546 E.19023
G1 X155.861 Y122.725 E.00988
G1 X155.345 Y122.946 E.01726
G1 X154.795 Y123.06 E.01726
G1 X154.233 Y123.062 E.01726
G1 X153.697 Y122.959 E.01678
G3 X152.871 Y122.556 I.811 J-2.706 E.02836
G1 X152.871 Y128.704 E.18893
G1 X152.494 Y128.764 F30000
G1 F11725
G1 X152.494 Y128.769 E.00014
G2 X152.466 Y130.04 I33.337 J1.382 E.03908
G1 X156.473 Y130.04 E.12315
G1 X156.506 Y128.742 E.03992
G1 X156.506 Y121.997 E.20723
G1 X156.387 Y122.024 E.00373
G1 X156.267 Y121.93 E.0047
G1 X156.104 Y122.1 E.00724
G1 X155.706 Y122.381 E.01496
G1 X155.261 Y122.578 E.01496
G1 X154.785 Y122.683 E.01496
G1 X154.299 Y122.691 E.01496
G3 X153.05 Y122.222 I.275 J-2.626 E.04142
G1 X152.743 Y121.922 E.01321
G1 X152.625 Y122.012 E.00457
G1 X152.494 Y121.986 E.0041
G1 X152.494 Y128.704 E.20642
G1 X152.608 Y121.523 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F11725
G1 X152.544 Y121.447 E.00044
; LINE_WIDTH: 0.111411
G1 X152.476 Y121.357 E.00063
; LINE_WIDTH: 0.147276
G1 X152.403 Y121.26 E.00103
; LINE_WIDTH: 0.181649
G1 X152.306 Y121.118 E.00195
G1 X152.329 Y120.939 F30000
; LINE_WIDTH: 0.119472
G1 F11725
G2 X152.399 Y121.354 I8.307 J-1.202 E.00262
G1 X152.329 Y119.569 F30000
; LINE_WIDTH: 0.119475
G1 F11725
G3 X152.399 Y119.155 I8.249 J1.193 E.00262
G1 X152.476 Y119.152 F30000
; LINE_WIDTH: 0.111407
G1 F11725
G1 X152.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973916
G1 X152.608 Y118.985 E.00044
G1 X152.476 Y119.152 F30000
; LINE_WIDTH: 0.147273
G1 F11725
G1 X152.403 Y119.248 E.00103
; LINE_WIDTH: 0.181648
G1 X152.306 Y119.391 E.00195
G1 X154.346 Y115.971 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F11725
G1 X154.654 Y115.967 E.00778
G1 X154.654 Y111.538 E.11151
G1 X154.346 Y111.542 E.00778
G1 X154.346 Y115.911 E.11
G1 X154.002 Y116.34 F30000
; LINE_WIDTH: 0.419999
G1 F11725
G3 X154.998 Y116.338 I.505 J4.204 E.03065
G1 X154.998 Y111.169 E.15885
G3 X154.002 Y111.205 I-.892 J-10.723 E.03061
G1 X154.002 Y116.28 E.15594
G1 X153.625 Y116.796 F30000
G1 F11725
G1 X154.186 Y116.695 E.01752
G1 X154.898 Y116.703 E.02186
G1 X155.375 Y116.791 E.01489
G1 X155.375 Y110.712 E.18678
G1 X154.814 Y110.814 E.01752
G1 X154.102 Y110.805 E.02186
G1 X153.625 Y110.717 E.01489
G1 X153.625 Y116.736 E.18494
G1 X153.248 Y117.321 F30000
G1 F11725
G1 X153.571 Y117.195 E.01064
G1 X154.196 Y117.072 E.01956
G1 X154.832 Y117.075 E.01956
G1 X155.456 Y117.204 E.01956
G1 X155.752 Y117.32 E.00977
G1 X155.752 Y110.188 E.21914
G1 X155.429 Y110.313 E.01064
G1 X154.804 Y110.437 E.01956
G1 X154.168 Y110.434 E.01956
G1 X153.544 Y110.305 E.01956
G1 X153.248 Y110.189 E.00977
G1 X153.248 Y117.261 E.2173
G1 X152.871 Y117.962 F30000
G1 F11725
G1 X153.139 Y117.784 E.00988
G1 X153.655 Y117.563 E.01726
G1 X154.205 Y117.449 E.01726
G1 X154.767 Y117.446 E.01726
G1 X155.318 Y117.555 E.01726
G1 X155.837 Y117.77 E.01726
G1 X156.129 Y117.959 E.01068
G1 X156.129 Y109.546 E.2585
G1 X155.861 Y109.725 E.00988
G1 X155.345 Y109.946 E.01726
G1 X154.795 Y110.06 E.01726
G1 X154.233 Y110.062 E.01726
G1 X153.682 Y109.954 E.01726
G1 X153.163 Y109.738 E.01726
G1 X152.871 Y109.55 E.01068
G1 X152.871 Y117.902 E.25665
G1 X152.494 Y118.513 F30000
G1 F11725
G1 X152.621 Y118.494 E.00392
G1 X152.733 Y118.579 E.00433
G1 X152.896 Y118.409 E.00724
G1 X153.294 Y118.127 E.01496
G1 X153.739 Y117.931 E.01496
G1 X154.215 Y117.826 E.01496
G1 X154.701 Y117.818 E.01496
G1 X155.18 Y117.906 E.01496
G1 X155.632 Y118.087 E.01496
G1 X156.046 Y118.361 E.01525
G1 X156.338 Y118.677 E.01321
G1 X156.441 Y118.599 E.00395
G1 X156.506 Y118.611 E.00203
G1 X156.506 Y108.997 E.29538
G1 X156.387 Y109.024 E.00373
G1 X156.267 Y108.93 E.0047
G1 X156.104 Y109.1 E.00724
G1 X155.706 Y109.381 E.01496
G1 X155.261 Y109.578 E.01496
G1 X154.785 Y109.683 E.01496
G1 X154.299 Y109.691 E.01496
G1 X153.82 Y109.603 E.01496
G1 X153.368 Y109.421 E.01496
G1 X152.954 Y109.147 E.01525
G1 X152.662 Y108.832 E.01321
G1 X152.566 Y108.903 E.00367
G1 X152.494 Y108.889 E.00225
G1 X152.494 Y118.453 E.29386
G1 X156.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126789
G1 F11725
G1 X156.571 Y119.246 E.00138
; LINE_WIDTH: 0.173122
G1 X156.629 Y119.331 E.0011
; LINE_WIDTH: 0.136072
G1 X156.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969206
G1 X156.672 Y119.567 E.00047
G1 X156.671 Y120.939 F30000
; LINE_WIDTH: 0.11948
G1 F11725
G3 X156.601 Y121.354 I-8.306 J-1.202 E.00262
G1 X156.524 Y121.357 F30000
; LINE_WIDTH: 0.129167
G1 F11725
G1 X156.392 Y121.523 E.00149
G1 X156.524 Y121.357 F30000
; LINE_WIDTH: 0.179233
G1 F11725
G1 X156.593 Y121.266 E.00126
; LINE_WIDTH: 0.195634
G1 X156.694 Y121.118 E.00224
G1 X156.392 Y108.523 F30000
; LINE_WIDTH: 0.129162
G1 F11725
G1 X156.524 Y108.357 E.00149
; LINE_WIDTH: 0.179219
G1 X156.593 Y108.266 E.00126
; LINE_WIDTH: 0.195629
G1 X156.694 Y108.118 E.00224
G1 X156.671 Y107.939 F30000
; LINE_WIDTH: 0.119477
G1 F11725
G3 X156.601 Y108.354 I-8.245 J-1.192 E.00262
G1 X156.672 Y106.567 F30000
; LINE_WIDTH: 0.0969205
G1 F11725
G1 X156.654 Y106.462 E.00047
; LINE_WIDTH: 0.136068
G1 X156.629 Y106.331 E.00101
; LINE_WIDTH: 0.173115
G1 X156.571 Y106.246 E.0011
; LINE_WIDTH: 0.126783
G1 X156.453 Y106.081 E.00138
G1 X154.346 Y102.971 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F11725
G1 X154.654 Y102.967 E.00778
G1 X154.654 Y102.6 E.00924
G1 X154.346 Y102.6 E.00778
G1 X154.346 Y102.911 E.00783
G1 X154.002 Y103.34 F30000
; LINE_WIDTH: 0.419999
G1 F11725
G3 X154.998 Y103.303 I.891 J10.706 E.03061
G1 X154.998 Y102.257 E.03216
G1 X154.002 Y102.257 E.03058
G1 X154.002 Y103.28 E.03144
G1 X153.625 Y103.796 F30000
G1 F11725
G1 X154.186 Y103.695 E.01752
G1 X154.898 Y103.703 E.02186
G1 X155.375 Y103.791 E.01489
G1 X155.375 Y101.88 E.05873
G1 X153.625 Y101.88 E.05375
G1 X153.625 Y103.736 E.05705
G1 X153.248 Y104.321 F30000
G1 F11725
G1 X153.571 Y104.195 E.01064
G1 X154.196 Y104.072 E.01956
G1 X154.832 Y104.075 E.01956
G1 X155.456 Y104.204 E.01956
G1 X155.752 Y104.32 E.00977
G1 X155.752 Y101.503 E.08657
G1 X153.248 Y101.503 E.07692
G1 X153.248 Y104.261 E.08475
G1 X152.871 Y104.962 F30000
G1 F11725
G1 X153.139 Y104.784 E.00988
G1 X153.655 Y104.563 E.01726
G1 X154.205 Y104.449 E.01726
G1 X154.767 Y104.446 E.01726
G1 X155.318 Y104.555 E.01726
G1 X155.837 Y104.77 E.01726
G1 X156.129 Y104.959 E.01068
G1 X156.129 Y101.126 E.11779
G1 X152.871 Y101.126 E.10009
G1 X152.871 Y104.902 E.11605
G1 X152.494 Y105.513 F30000
G1 F11725
G1 X152.621 Y105.494 E.00392
G1 X152.733 Y105.579 E.00433
G1 X152.896 Y105.409 E.00724
G1 X153.294 Y105.127 E.01496
G1 X153.739 Y104.931 E.01496
G1 X154.215 Y104.826 E.01496
G1 X154.701 Y104.818 E.01496
G1 X155.18 Y104.906 E.01496
G1 X155.632 Y105.087 E.01496
G1 X156.046 Y105.361 E.01525
G1 X156.338 Y105.677 E.01321
G1 X156.441 Y105.599 E.00395
G1 X156.506 Y105.611 E.00203
G1 X156.506 Y100.748 E.1494
G1 X152.494 Y100.748 E.12327
G1 X152.494 Y105.453 E.14456
G1 X152.608 Y105.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973912
G1 F11725
G1 X152.544 Y106.061 E.00044
; LINE_WIDTH: 0.111406
G1 X152.476 Y106.152 E.00063
; LINE_WIDTH: 0.14727
G1 X152.403 Y106.248 E.00103
; LINE_WIDTH: 0.181642
G1 X152.306 Y106.391 E.00195
G1 X152.329 Y106.569 F30000
; LINE_WIDTH: 0.119466
G1 F11725
G3 X152.399 Y106.155 I8.316 J1.203 E.00262
G1 X152.329 Y107.939 F30000
; LINE_WIDTH: 0.126449
G1 F11725
G1 X152.355 Y108.096 E.00108
; LINE_WIDTH: 0.166516
G1 X152.367 Y108.162 E.00068
; LINE_WIDTH: 0.146001
G2 X152.429 Y108.263 I.162 J-.03 E.00101
; LINE_WIDTH: 0.111385
G1 X152.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973909
G1 X152.547 Y108.427 E.00044
; WIPE_START
G1 F24000
G1 X152.487 Y108.348 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.127 J-.46 P1  F30000
G1 X135.226 Y150.583 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11725
G2 X136.794 Y150.146 I-3.6 J-15.927 E.05402
G1 X139.993 Y153.345 E.15007
G3 X138.469 Y153.916 I-6.489 J-14.984 E.05403
G1 X124.774 Y150.583 F30000
G1 F11725
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z7 I.83 J.89 P1  F30000
G1 X153.535 Y122.063 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11790
G1 X153.221 Y121.858 E.01244
G3 X154.245 Y118.217 I1.278 J-1.605 E.15952
G1 X154.449 Y118.202 E.00679
G3 X153.588 Y122.091 I.051 J2.051 E.24683
G1 X153.722 Y121.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11790
G1 X153.466 Y121.551 E.00938
G3 X154.294 Y118.607 I1.034 J-1.298 E.11951
G1 X154.459 Y118.595 E.00509
G3 X153.775 Y121.746 I.041 J1.659 E.1845
M204 S10000
; WIPE_START
G1 F24000
G1 X153.466 Y121.551 E-.13872
G1 X153.228 Y121.321 E-.12557
G1 X153.042 Y121.048 E-.12563
G1 X152.914 Y120.744 E-.12563
G1 X152.848 Y120.42 E-.12564
G1 X152.848 Y120.107 E-.1188
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.201 J.198 P1  F30000
G1 X155.28 Y105.359 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11790
G1 X155.613 Y105.53 E.01245
G3 X154.339 Y105.208 I-1.114 J1.723 E.38317
G1 X154.456 Y105.202 E.00389
G3 X155.225 Y105.334 I.043 J2.051 E.02603
G1 X155.106 Y105.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11790
G3 X154.373 Y105.599 I-.607 J1.544 E.29735
G1 X154.461 Y105.595 E.0027
G3 X155.05 Y105.688 I.039 J1.659 E.01843
M204 S10000
; WIPE_START
G1 F24000
G1 X155.401 Y105.86 E-.14826
G1 X155.659 Y106.066 E-.12563
G1 X155.872 Y106.319 E-.12563
G1 X156.03 Y106.609 E-.12564
G1 X156.127 Y106.925 E-.12563
G1 X156.159 Y107.19 E-.1014
G1 X156.157 Y107.211 E-.00781
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.042 J-1.216 P1  F30000
G1 X104.595 Y105.415 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11790
G1 X104.944 Y105.279 E.01245
G3 X105.339 Y105.208 I.556 J1.975 E.01333
G1 X105.456 Y105.202 E.00389
G3 X104.54 Y105.44 I.043 J2.051 E.39588
G1 X104.701 Y105.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11790
G1 X104.743 Y105.777 E.00152
G3 X105.373 Y105.599 I.757 J1.476 E.02027
G1 X105.461 Y105.595 E.0027
G3 X104.465 Y105.956 I.039 J1.659 E.28718
G1 X104.651 Y105.836 E.0068
M204 S10000
; WIPE_START
G1 F24000
G1 X104.743 Y105.777 E-.04154
G1 X105.05 Y105.656 E-.12563
G1 X105.373 Y105.599 E-.12464
G1 X105.461 Y105.595 E-.03345
G1 X105.788 Y105.619 E-.12464
G1 X106.107 Y105.709 E-.12563
G1 X106.401 Y105.86 E-.12564
G1 X106.522 Y105.956 E-.05884
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.217 J.028 P1  F30000
G1 X106.881 Y121.769 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11790
G1 X106.857 Y121.792 E.00111
G3 X105.245 Y118.217 I-1.357 J-1.539 E.25449
G1 X105.449 Y118.202 E.00679
G3 X107.135 Y121.493 I.051 J2.051 E.15274
G1 X106.922 Y121.725 E.01045
G1 X106.59 Y121.505 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11790
G1 X106.329 Y121.69 E.00984
G3 X105.294 Y118.607 I-.829 J-1.437 E.18049
G1 X105.459 Y118.595 E.00509
G3 X106.634 Y121.464 I.041 J1.659 E.12306
M204 S10000
; WIPE_START
G1 F24000
G1 X106.329 Y121.69 E-.14433
G1 X106.029 Y121.828 E-.12556
G1 X105.706 Y121.902 E-.12564
G1 X105.376 Y121.91 E-.12563
G1 X105.05 Y121.852 E-.12564
G1 X104.773 Y121.744 E-.1132
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.213 J-.095 P1  F30000
G1 X103.102 Y100.356 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11790
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.007 E2.30283
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J.004 E2.80335
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11790
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.003 E2.09556
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.63399
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.195 J-.229 P1  F30000
G1 X103.547 Y106.081 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F11790
G1 X103.487 Y106.16 E.00044
; LINE_WIDTH: 0.111404
G1 X103.429 Y106.246 E.00058
; LINE_WIDTH: 0.148179
G2 X103.365 Y106.357 I.121 J.144 E.00113
; LINE_WIDTH: 0.161461
G1 X103.346 Y106.462 E.00103
; LINE_WIDTH: 0.129191
G1 X103.328 Y106.567 E.00075
G1 X103.328 Y107.942 F30000
; LINE_WIDTH: 0.129189
G1 F11790
G1 X103.346 Y108.046 E.00075
; LINE_WIDTH: 0.161458
G1 X103.365 Y108.151 E.00103
; LINE_WIDTH: 0.148172
G2 X103.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111395
G1 X103.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973905
M73 P80 R3
G1 X103.547 Y108.427 E.00044
; WIPE_START
G1 F24000
G1 X103.487 Y108.348 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.054 J1.216 P1  F30000
G1 X107.392 Y108.523 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.129163
G1 F11790
G1 X107.524 Y108.357 E.00149
; LINE_WIDTH: 0.179222
G1 X107.593 Y108.266 E.00126
; LINE_WIDTH: 0.195631
G1 X107.694 Y108.118 E.00224
G1 X107.671 Y107.939 F30000
; LINE_WIDTH: 0.119479
G1 F11790
G3 X107.601 Y108.354 I-8.337 J-1.207 E.00262
G1 X107.672 Y106.567 F30000
; LINE_WIDTH: 0.0969206
G1 F11790
G1 X107.654 Y106.462 E.00047
; LINE_WIDTH: 0.136068
G1 X107.629 Y106.331 E.00101
; LINE_WIDTH: 0.173113
G1 X107.571 Y106.246 E.0011
; LINE_WIDTH: 0.126784
G1 X107.453 Y106.081 E.00138
G1 X107.506 Y105.611 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11790
G1 X107.506 Y100.748 E.1494
G1 X103.494 Y100.748 E.12327
G1 X103.494 Y105.618 E.14963
G3 X103.662 Y105.677 I.047 J.136 E.00589
G1 X103.99 Y105.331 E.01465
G1 X104.401 Y105.07 E.01496
G1 X104.856 Y104.896 E.01495
G1 X105.506 Y104.816 E.02013
G1 X106.144 Y104.896 E.01976
G1 X106.632 Y105.087 E.01611
G1 X107.046 Y105.361 E.01525
G1 X107.338 Y105.677 E.01321
G1 X107.447 Y105.6 E.00409
G1 X107.129 Y104.959 F30000
G1 F11790
G1 X107.129 Y101.126 E.11779
G1 X103.871 Y101.126 E.10009
G1 X103.871 Y104.959 E.11779
G1 X104.263 Y104.719 E.01413
G1 X104.79 Y104.524 E.01724
G1 X105.319 Y104.439 E.01648
G1 X105.769 Y104.447 E.01383
G1 X106.318 Y104.555 E.01719
G1 X106.837 Y104.77 E.01726
G1 X107.078 Y104.926 E.00884
G1 X106.752 Y104.32 F30000
G1 F11790
G1 X106.752 Y101.503 E.08657
G1 X104.248 Y101.503 E.07692
G1 X104.248 Y104.32 E.08657
G1 X104.724 Y104.153 E.01549
G1 X105.318 Y104.062 E.01847
G1 X105.835 Y104.075 E.01588
G1 X106.456 Y104.204 E.01949
G1 X106.696 Y104.298 E.00792
G1 X106.375 Y103.791 F30000
G1 F11790
G1 X106.375 Y101.88 E.05873
G1 X104.625 Y101.88 E.05375
G1 X104.625 Y103.791 E.05873
G1 X105.317 Y103.685 E.0215
G1 X105.9 Y103.704 E.01793
G1 X106.316 Y103.78 E.01298
G1 X105.998 Y103.338 F30000
G1 F11790
G1 X105.998 Y102.257 E.03323
G1 X105.002 Y102.257 E.03058
G1 X105.002 Y103.338 E.03322
G1 X105.666 Y103.307 E.02041
G1 X105.938 Y103.332 E.00839
G1 X105.654 Y102.964 F30000
; LINE_WIDTH: 0.351907
G1 F11790
G1 X105.654 Y102.6 E.00916
G1 X105.346 Y102.6 E.00778
G1 X105.346 Y102.965 E.00919
G1 X105.594 Y102.964 E.00627
; WIPE_START
G1 F24000
G1 X105.346 Y102.965 E-.14705
G1 X105.346 Y102.6 E-.2155
G1 X105.654 Y102.6 E-.18249
G1 X105.654 Y102.964 E-.21496
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.209 J.143 P1  F30000
G1 X107.506 Y118.607 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.419999
G1 F11790
G1 X107.506 Y108.997 E.29528
G1 X107.387 Y109.024 E.00373
G1 X107.267 Y108.93 E.0047
G1 X107.104 Y109.1 E.00724
G1 X106.706 Y109.381 E.01496
G1 X106.261 Y109.578 E.01496
G1 X105.785 Y109.683 E.01496
G1 X105.299 Y109.691 E.01496
G1 X104.82 Y109.603 E.01496
G1 X104.368 Y109.421 E.01496
G1 X103.954 Y109.147 E.01525
G1 X103.662 Y108.832 E.01321
G1 X103.566 Y108.903 E.00367
G1 X103.494 Y108.889 E.00225
G1 X103.494 Y118.647 E.29982
G3 X103.636 Y118.704 I.032 J.125 E.00502
G1 X103.899 Y118.407 E.0122
G1 X104.294 Y118.127 E.01486
G1 X104.739 Y117.931 E.01496
G1 X105.215 Y117.826 E.01496
G1 X105.701 Y117.818 E.01496
G1 X106.18 Y117.906 E.01496
G1 X106.632 Y118.087 E.01496
G1 X107.046 Y118.361 E.01525
G1 X107.338 Y118.677 E.01321
G1 X107.447 Y118.596 E.00416
G1 X107.129 Y117.959 F30000
G1 F11790
G1 X107.129 Y109.546 E.2585
G1 X106.861 Y109.725 E.00988
G1 X106.345 Y109.946 E.01726
G1 X105.795 Y110.06 E.01726
G1 X105.233 Y110.062 E.01726
G1 X104.682 Y109.954 E.01726
G1 X104.163 Y109.738 E.01726
G1 X103.871 Y109.55 E.01068
G1 X103.871 Y117.962 E.2585
G1 X104.139 Y117.784 E.00988
G1 X104.655 Y117.563 E.01726
G1 X105.205 Y117.449 E.01726
G1 X105.767 Y117.446 E.01726
G1 X106.318 Y117.555 E.01726
G1 X106.837 Y117.77 E.01726
G1 X107.078 Y117.926 E.00884
G1 X106.752 Y117.32 F30000
G1 F11790
G1 X106.752 Y110.188 E.21914
G1 X106.429 Y110.313 E.01064
G1 X105.804 Y110.437 E.01956
G1 X105.168 Y110.434 E.01956
G1 X104.544 Y110.305 E.01956
G1 X104.248 Y110.189 E.00977
G1 X104.248 Y117.321 E.21914
G1 X104.571 Y117.195 E.01064
G1 X105.196 Y117.072 E.01956
G1 X105.832 Y117.075 E.01956
G1 X106.456 Y117.204 E.01956
G1 X106.696 Y117.298 E.00792
G1 X106.375 Y116.791 F30000
G1 F11790
G1 X106.375 Y110.712 E.18678
G1 X105.814 Y110.814 E.01752
G1 X105.102 Y110.805 E.02186
G1 X104.625 Y110.717 E.01489
G1 X104.625 Y116.796 E.18678
G1 X105.186 Y116.695 E.01752
G1 X105.898 Y116.703 E.02186
G1 X106.316 Y116.78 E.01305
G1 X105.998 Y116.303 F30000
G1 F11790
G1 X105.998 Y111.169 E.15778
G3 X105.002 Y111.205 I-.892 J-10.732 E.03061
G1 X105.002 Y116.34 E.15778
G3 X105.938 Y116.304 I.853 J10.078 E.02876
G1 X105.654 Y115.967 F30000
; LINE_WIDTH: 0.351907
G1 F11790
G1 X105.654 Y111.538 E.11151
G1 X105.346 Y111.542 E.00778
G1 X105.346 Y115.971 E.11151
G1 X105.594 Y115.967 E.00627
G1 X107.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126784
G1 F11790
G1 X107.571 Y119.246 E.00138
; LINE_WIDTH: 0.173114
G1 X107.629 Y119.331 E.0011
; LINE_WIDTH: 0.136067
G1 X107.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969206
G1 X107.672 Y119.567 E.00047
G1 X107.671 Y120.939 F30000
; LINE_WIDTH: 0.119473
G1 F11790
G3 X107.601 Y121.354 I-8.236 J-1.191 E.00262
G1 X107.524 Y121.357 F30000
; LINE_WIDTH: 0.179224
G1 F11790
G1 X107.593 Y121.266 E.00126
; LINE_WIDTH: 0.195633
G1 X107.694 Y121.118 E.00224
G1 X107.524 Y121.357 F30000
; LINE_WIDTH: 0.129163
G1 F11790
G1 X107.392 Y121.523 E.00149
; WIPE_START
G1 F24000
G1 X107.524 Y121.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.022 J-1.217 P1  F30000
G1 X103.547 Y121.427 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.0973915
G1 F11790
G1 X103.487 Y121.348 E.00044
; LINE_WIDTH: 0.111407
G1 X103.429 Y121.263 E.00058
; LINE_WIDTH: 0.148187
G3 X103.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161454
G1 X103.346 Y121.046 E.00103
; LINE_WIDTH: 0.129187
G1 X103.328 Y120.942 E.00075
G1 X103.328 Y119.567 F30000
; LINE_WIDTH: 0.129184
G1 F11790
G1 X103.346 Y119.462 E.00075
; LINE_WIDTH: 0.161448
G1 X103.365 Y119.357 E.00103
; LINE_WIDTH: 0.137526
G3 X103.429 Y119.254 I.163 J.03 E.00096
; LINE_WIDTH: 0.103417
G1 X103.491 Y119.162 E.00055
; LINE_WIDTH: 0.097203
G1 X103.528 Y119.112 E.00027
G1 X106.752 Y128.764 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11790
G1 X106.752 Y123.188 E.17134
G1 X106.429 Y123.313 E.01064
G1 X105.804 Y123.437 E.01956
G1 X105.168 Y123.434 E.01956
G1 X104.544 Y123.305 E.01956
G1 X104.248 Y123.189 E.00977
G1 X104.248 Y128.732 E.17034
G1 X104.262 Y129.286 E.01702
G1 X106.764 Y129.286 E.07689
G1 X106.753 Y128.824 E.0142
G1 X107.506 Y128.764 F30000
G1 F11790
G1 X107.506 Y121.997 E.20792
G1 X107.387 Y122.024 E.00373
G1 X107.267 Y121.93 E.0047
G1 X107.104 Y122.1 E.00724
G1 X106.706 Y122.381 E.01496
G1 X106.261 Y122.578 E.01496
G1 X105.785 Y122.683 E.01496
G1 X105.299 Y122.691 E.01496
G1 X104.82 Y122.603 E.01496
G1 X104.368 Y122.421 E.01496
G1 X103.954 Y122.147 E.01525
G1 X103.662 Y121.832 E.01321
G1 X103.566 Y121.903 E.00367
G1 X103.494 Y121.889 E.00225
G1 X103.494 Y128.742 E.21055
G1 X103.527 Y130.04 E.03992
G1 X107.534 Y130.04 E.12315
G2 X107.507 Y128.824 I-31.957 J.101 E.03738
G1 X107.129 Y128.035 F30000
G1 F11790
G1 X107.129 Y122.546 E.16864
G1 X106.861 Y122.725 E.00988
G1 X106.345 Y122.946 E.01726
G1 X105.795 Y123.06 E.01726
G1 X105.233 Y123.062 E.01726
G1 X104.682 Y122.954 E.01726
G1 X104.163 Y122.738 E.01726
G1 X103.871 Y122.55 E.01068
G1 X103.871 Y128.737 E.19013
G1 X103.894 Y129.663 E.02847
G1 X107.151 Y129.663 E.10007
G3 X107.129 Y128.095 I31.738 J-1.234 E.04821
G1 X106.375 Y128.035 F30000
G1 F11790
G1 X106.375 Y123.712 E.13281
G1 X105.814 Y123.814 E.01752
G1 X105.102 Y123.805 E.02186
G1 X104.625 Y123.717 E.01489
G1 X104.63 Y128.909 E.15953
G1 X106.378 Y128.909 E.05371
G1 X106.375 Y128.095 E.02503
G1 X105.998 Y128.532 F30000
G1 F11790
G1 X105.998 Y124.169 E.13408
G3 X105.002 Y124.205 I-.892 J-10.733 E.03061
G1 X105.002 Y128.532 E.13296
G1 X105.938 Y128.532 E.02873
G1 X105.654 Y128.189 F30000
; LINE_WIDTH: 0.351907
G1 F11790
G1 X105.654 Y124.538 E.09193
G1 X105.346 Y124.542 E.00778
G1 X105.346 Y128.189 E.09183
G1 X105.594 Y128.189 E.00627
G1 X106.168 Y130.433 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11790
G1 X104.54 Y130.433 E.05401
G1 X103.582 Y131.39 E.04492
G2 X103.71 Y132.414 I10.321 J-.77 E.03424
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.114 J-14.476 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I23.12 J-14.38 E.19098
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F11790
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.153 J-18.099 E.054
G1 X152.078 Y132.79 F30000
G1 F11790
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.176 J-1.791 E.03424
G1 X155.46 Y130.433 E.04492
G1 X153.832 Y130.433 E.05401
G1 X154.346 Y128.189 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F11790
G1 X154.654 Y128.189 E.00778
G1 X154.654 Y124.538 E.09193
G1 X154.346 Y124.542 E.00778
G1 X154.346 Y128.129 E.09032
G1 X154.002 Y128.532 F30000
; LINE_WIDTH: 0.419999
G1 F11790
G1 X154.998 Y128.532 E.03058
G1 X154.998 Y124.169 E.13408
G3 X154.002 Y124.205 I-.892 J-10.732 E.03061
G1 X154.002 Y128.472 E.13111
G1 X153.625 Y128.764 F30000
G1 F11790
G1 X153.622 Y128.909 E.00445
G1 X155.37 Y128.909 E.05371
G2 X155.375 Y123.712 I-502.015 J-3.036 E.15969
G1 X154.814 Y123.814 E.01752
G1 X154.102 Y123.805 E.02186
G1 X153.625 Y123.717 E.01489
G1 X153.625 Y128.704 E.15323
G1 X153.248 Y128.764 F30000
G1 F11790
G1 X153.236 Y129.286 E.01605
G1 X155.738 Y129.286 E.07689
G1 X155.752 Y128.732 E.01702
G1 X155.752 Y123.188 E.17037
G1 X155.429 Y123.313 E.01064
G1 X154.804 Y123.437 E.01956
G1 X154.168 Y123.434 E.01956
G1 X153.544 Y123.305 E.01956
G1 X153.248 Y123.189 E.00977
G1 X153.248 Y128.704 E.16948
G1 X152.871 Y128.764 F30000
G1 F11790
G1 X152.849 Y129.663 E.02764
G1 X156.106 Y129.663 E.10007
G1 X156.129 Y128.737 E.02847
G1 X156.129 Y122.546 E.19023
G1 X155.861 Y122.725 E.00988
G1 X155.345 Y122.946 E.01726
G1 X154.795 Y123.06 E.01726
G1 X154.233 Y123.062 E.01726
G1 X153.682 Y122.954 E.01726
G1 X153.163 Y122.738 E.01726
G1 X152.871 Y122.55 E.01068
G1 X152.871 Y128.704 E.18912
G1 X152.494 Y128.764 F30000
G1 F11790
G1 X152.494 Y128.769 E.00014
G2 X152.466 Y130.04 I33.337 J1.382 E.03908
G1 X156.473 Y130.04 E.12315
G1 X156.506 Y128.742 E.03992
G1 X156.506 Y121.997 E.20723
G1 X156.387 Y122.024 E.00373
G1 X156.267 Y121.93 E.0047
G1 X156.104 Y122.1 E.00724
G1 X155.706 Y122.381 E.01496
G1 X155.261 Y122.578 E.01496
G1 X154.785 Y122.683 E.01496
G1 X154.299 Y122.691 E.01496
G1 X153.82 Y122.603 E.01496
G1 X153.368 Y122.421 E.01496
G1 X152.954 Y122.147 E.01525
G1 X152.662 Y121.832 E.01321
G1 X152.566 Y121.903 E.00367
G1 X152.494 Y121.889 E.00225
G1 X152.494 Y128.704 E.2094
G1 X152.547 Y121.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973913
G1 F11790
G1 X152.487 Y121.348 E.00044
; LINE_WIDTH: 0.111403
G1 X152.429 Y121.263 E.00058
; LINE_WIDTH: 0.148184
G3 X152.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16145
G1 X152.346 Y121.046 E.00103
; LINE_WIDTH: 0.129185
G1 X152.328 Y120.942 E.00075
G1 X152.328 Y119.567 F30000
; LINE_WIDTH: 0.129183
G1 F11790
G1 X152.346 Y119.462 E.00075
; LINE_WIDTH: 0.161446
G1 X152.365 Y119.357 E.00103
; LINE_WIDTH: 0.13724
G3 X152.429 Y119.254 I.162 J.03 E.00096
; LINE_WIDTH: 0.103204
G1 X152.491 Y119.162 E.00055
; LINE_WIDTH: 0.0971979
G1 X152.527 Y119.113 E.00027
G1 X152.494 Y118.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11790
G1 X152.626 Y118.715 E.00434
G1 X152.899 Y118.407 E.01265
G1 X153.294 Y118.127 E.01486
G1 X153.739 Y117.931 E.01496
G1 X154.215 Y117.826 E.01496
G1 X154.701 Y117.818 E.01496
G1 X155.18 Y117.906 E.01496
G1 X155.632 Y118.087 E.01496
G1 X156.046 Y118.361 E.01525
G1 X156.338 Y118.677 E.01321
G1 X156.441 Y118.599 E.00395
G1 X156.506 Y118.611 E.00203
G1 X156.506 Y108.997 E.29538
G1 X156.387 Y109.024 E.00373
G1 X156.267 Y108.93 E.0047
G1 X156.104 Y109.1 E.00724
G1 X155.706 Y109.381 E.01496
G1 X155.261 Y109.578 E.01496
G1 X154.785 Y109.683 E.01496
G1 X154.299 Y109.691 E.01496
G1 X153.82 Y109.603 E.01496
G1 X153.368 Y109.421 E.01496
G1 X152.954 Y109.147 E.01525
G1 X152.662 Y108.832 E.01321
G1 X152.566 Y108.903 E.00367
G1 X152.494 Y108.889 E.00225
G1 X152.494 Y118.604 E.29851
G1 X152.871 Y117.962 F30000
G1 F11790
G1 X153.139 Y117.784 E.00988
G1 X153.655 Y117.563 E.01726
G1 X154.205 Y117.449 E.01726
G1 X154.767 Y117.446 E.01726
G1 X155.318 Y117.555 E.01726
G1 X155.837 Y117.77 E.01726
G1 X156.129 Y117.959 E.01068
G1 X156.129 Y109.546 E.2585
G1 X155.861 Y109.725 E.00988
G1 X155.345 Y109.946 E.01726
G1 X154.795 Y110.06 E.01726
G1 X154.233 Y110.062 E.01726
G1 X153.682 Y109.954 E.01726
G1 X153.163 Y109.738 E.01726
G1 X152.871 Y109.55 E.01068
G1 X152.871 Y117.902 E.25665
G1 X153.248 Y117.321 F30000
G1 F11790
G1 X153.571 Y117.195 E.01064
G1 X154.196 Y117.072 E.01956
G1 X154.832 Y117.075 E.01956
G1 X155.456 Y117.204 E.01956
G1 X155.752 Y117.32 E.00977
G1 X155.752 Y110.188 E.21914
G1 X155.429 Y110.313 E.01064
G1 X154.804 Y110.437 E.01956
G1 X154.168 Y110.434 E.01956
G1 X153.544 Y110.305 E.01956
G1 X153.248 Y110.189 E.00977
G1 X153.248 Y117.261 E.2173
G1 X153.625 Y116.796 F30000
G1 F11790
G1 X154.186 Y116.695 E.01752
G1 X154.898 Y116.703 E.02186
G1 X155.375 Y116.791 E.01489
G1 X155.375 Y110.712 E.18678
G1 X154.814 Y110.814 E.01752
G1 X154.102 Y110.805 E.02186
G1 X153.625 Y110.717 E.01489
G1 X153.625 Y116.736 E.18494
G1 X154.002 Y116.34 F30000
G1 F11790
G3 X154.998 Y116.303 I.892 J10.728 E.03061
G1 X154.998 Y111.169 E.15778
G3 X154.002 Y111.205 I-.892 J-10.73 E.03061
G1 X154.002 Y116.28 E.15594
G1 X154.346 Y115.971 F30000
; LINE_WIDTH: 0.351907
G1 F11790
G1 X154.654 Y115.967 E.00778
G1 X154.654 Y111.538 E.11151
G1 X154.346 Y111.542 E.00778
G1 X154.346 Y115.911 E.11
G1 X156.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126785
G1 F11790
G1 X156.571 Y119.246 E.00138
; LINE_WIDTH: 0.173118
G1 X156.629 Y119.331 E.0011
; LINE_WIDTH: 0.13607
G1 X156.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969206
G1 X156.672 Y119.567 E.00047
G1 X156.671 Y120.939 F30000
; LINE_WIDTH: 0.119477
G1 F11790
G3 X156.601 Y121.354 I-8.246 J-1.193 E.00262
G1 X156.524 Y121.357 F30000
; LINE_WIDTH: 0.179227
G1 F11790
G1 X156.593 Y121.266 E.00126
; LINE_WIDTH: 0.195637
G1 X156.694 Y121.118 E.00224
G1 X156.524 Y121.357 F30000
; LINE_WIDTH: 0.129165
G1 F11790
G1 X156.392 Y121.523 E.00149
G1 X156.392 Y108.523 F30000
; LINE_WIDTH: 0.129164
G1 F11790
G1 X156.524 Y108.357 E.00149
; LINE_WIDTH: 0.179223
G1 X156.593 Y108.266 E.00126
; LINE_WIDTH: 0.195635
G1 X156.694 Y108.118 E.00224
G1 X156.671 Y107.939 F30000
; LINE_WIDTH: 0.119483
G1 F11790
G3 X156.601 Y108.354 I-8.333 J-1.206 E.00262
G1 X156.672 Y106.567 F30000
; LINE_WIDTH: 0.0969206
G1 F11790
G1 X156.654 Y106.462 E.00047
; LINE_WIDTH: 0.136068
G1 X156.629 Y106.331 E.00101
; LINE_WIDTH: 0.173114
G1 X156.571 Y106.246 E.0011
; LINE_WIDTH: 0.126784
G1 X156.453 Y106.081 E.00138
; WIPE_START
G1 F24000
G1 X156.571 Y106.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.05 J-1.216 P1  F30000
G1 X152.547 Y106.081 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.0973917
G1 F11790
M73 P81 R3
G1 X152.487 Y106.16 E.00044
; LINE_WIDTH: 0.111407
G1 X152.429 Y106.246 E.00058
; LINE_WIDTH: 0.148183
G2 X152.365 Y106.357 I.121 J.144 E.00113
; LINE_WIDTH: 0.161457
G1 X152.346 Y106.462 E.00103
; LINE_WIDTH: 0.129189
G1 X152.328 Y106.567 E.00075
G1 X152.494 Y105.614 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F11790
G3 X152.662 Y105.677 I.041 J.148 E.00588
G1 X152.99 Y105.331 E.01464
G1 X153.401 Y105.07 E.01496
G1 X153.856 Y104.896 E.01495
G1 X154.506 Y104.816 E.02013
G1 X155.144 Y104.896 E.01976
G1 X155.632 Y105.087 E.01611
G1 X156.046 Y105.361 E.01525
G1 X156.338 Y105.677 E.01321
G1 X156.441 Y105.599 E.00395
G1 X156.506 Y105.611 E.00203
G1 X156.506 Y100.748 E.1494
G1 X152.494 Y100.748 E.12327
G1 X152.494 Y105.554 E.14767
G1 X152.871 Y104.959 F30000
G1 F11790
G1 X153.263 Y104.719 E.01413
G1 X153.79 Y104.524 E.01724
G1 X154.319 Y104.439 E.01648
G1 X154.769 Y104.447 E.01383
G1 X155.318 Y104.555 E.01719
G1 X155.837 Y104.77 E.01726
G1 X156.129 Y104.959 E.01068
G1 X156.129 Y101.126 E.11779
G1 X152.871 Y101.126 E.10009
G1 X152.871 Y104.899 E.11595
G1 X153.248 Y104.32 F30000
G1 F11790
G1 X153.724 Y104.153 E.01549
G1 X154.318 Y104.062 E.01847
G1 X154.835 Y104.075 E.01588
G1 X155.456 Y104.204 E.01949
G1 X155.752 Y104.32 E.00977
G1 X155.752 Y101.503 E.08657
G1 X153.248 Y101.503 E.07692
G1 X153.248 Y104.26 E.08472
G1 X153.625 Y103.791 F30000
G1 F11790
G1 X154.317 Y103.685 E.0215
G3 X155.375 Y103.791 I.176 J3.57 E.03278
G1 X155.375 Y101.88 E.05873
G1 X153.625 Y101.88 E.05375
G1 X153.625 Y103.731 E.05689
G1 X154.002 Y103.338 F30000
G1 F11790
G1 X154.666 Y103.307 E.02041
G1 X154.998 Y103.338 E.01024
G1 X154.998 Y102.257 E.03323
G1 X154.002 Y102.257 E.03058
G1 X154.002 Y103.278 E.03137
G1 X154.346 Y102.965 F30000
; LINE_WIDTH: 0.351907
G1 F11790
G1 X154.654 Y102.964 E.00778
G1 X154.654 Y102.6 E.00916
G1 X154.346 Y102.6 E.00778
G1 X154.346 Y102.905 E.00768
G1 X152.328 Y107.942 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129187
G1 F11790
G1 X152.346 Y108.046 E.00075
; LINE_WIDTH: 0.161454
G1 X152.365 Y108.151 E.00103
; LINE_WIDTH: 0.148168
G2 X152.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111392
G1 X152.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973915
G1 X152.547 Y108.427 E.00044
; WIPE_START
G1 F24000
G1 X152.487 Y108.348 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.127 J-.46 P1  F30000
G1 X135.226 Y150.583 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11790
G2 X136.794 Y150.146 I-3.6 J-15.927 E.05402
G1 X139.993 Y153.345 E.15007
G3 X138.469 Y153.916 I-6.489 J-14.985 E.05403
G1 X124.774 Y150.583 F30000
G1 F11790
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
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
G3 Z7.2 I.829 J.891 P1  F30000
G1 X153.595 Y122.093 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7712
G1 X153.565 Y122.079 E.00111
G3 X154.245 Y118.217 I.935 J-1.826 E.17309
G1 X154.449 Y118.202 E.00679
G3 X153.945 Y122.228 I.051 J2.051 E.23414
G1 X153.651 Y122.115 E.01045
G1 X153.725 Y121.72 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7712
G1 X153.466 Y121.551 E.00949
G3 X154.294 Y118.607 I1.034 J-1.298 E.11951
G1 X154.459 Y118.595 E.00509
G3 X153.778 Y121.747 I.041 J1.659 E.18439
M204 S10000
; WIPE_START
G1 F24000
G1 X153.466 Y121.551 E-.14005
G1 X153.228 Y121.321 E-.12557
G1 X153.042 Y121.048 E-.12564
G1 X152.914 Y120.744 E-.12563
G1 X152.848 Y120.42 E-.12548
G1 X152.842 Y120.17 E-.09502
G1 X152.851 Y120.111 E-.02263
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.202 J.192 P1  F30000
G1 X155.218 Y105.334 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7712
G1 X155.25 Y105.343 E.00111
G3 X154.245 Y105.217 I-.75 J1.91 E.39364
G1 X154.449 Y105.202 E.00679
G3 X154.856 Y105.233 I.051 J2.051 E.01358
G1 X155.16 Y105.318 E.01046
G1 X155.107 Y105.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7712
G3 X154.294 Y105.607 I-.607 J1.544 E.2949
G1 X154.459 Y105.595 E.00509
G3 X155.05 Y105.688 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X155.401 Y105.86 E-.14826
G1 X155.659 Y106.066 E-.12563
G1 X155.872 Y106.319 E-.12563
G1 X156.03 Y106.609 E-.12564
G1 X156.127 Y106.925 E-.12563
G1 X156.159 Y107.196 E-.10342
G1 X156.158 Y107.211 E-.00579
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.04 J-1.216 P1  F30000
G1 X104.446 Y105.496 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7712
G1 X104.474 Y105.477 E.00111
G3 X105.245 Y105.217 I1.026 J1.776 E.02717
G1 X105.449 Y105.202 E.00679
G3 X104.142 Y105.715 I.051 J2.051 E.38006
G1 X104.398 Y105.531 E.01046
G1 X104.692 Y105.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7712
G1 X104.971 Y105.68 E.0094
G3 X105.294 Y105.607 I.529 J1.573 E.01018
G1 X105.459 Y105.595 E.00509
G3 X104.64 Y105.835 I.041 J1.659 E.29381
M204 S10000
; WIPE_START
G1 F24000
G1 X104.971 Y105.68 E-.13897
G1 X105.294 Y105.607 E-.12564
G1 X105.459 Y105.595 E-.06289
G1 X105.788 Y105.619 E-.12564
G1 X106.107 Y105.709 E-.12563
G1 X106.401 Y105.86 E-.12564
G1 X106.515 Y105.951 E-.05559
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.216 J.036 P1  F30000
G1 X106.98 Y121.673 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7712
G1 X106.697 Y121.919 E.01244
G3 X105.245 Y118.217 I-1.197 J-1.666 E.24771
G1 X105.449 Y118.202 E.00679
G3 X107.021 Y121.63 I.051 J2.051 E.15865
G1 X106.616 Y121.473 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7712
G1 X106.468 Y121.601 E.00601
G3 X105.294 Y118.607 I-.968 J-1.348 E.18557
G1 X105.459 Y118.595 E.00509
G3 X106.716 Y121.382 I.041 J1.659 E.11951
G1 X106.66 Y121.432 E.00229
M204 S10000
; WIPE_START
G1 F24000
G1 X106.468 Y121.601 E-.09714
G1 X106.183 Y121.768 E-.12557
G1 X105.869 Y121.873 E-.12564
G1 X105.541 Y121.914 E-.12563
G1 X105.376 Y121.91 E-.0629
G1 X105.05 Y121.852 E-.12563
G1 X104.811 Y121.759 E-.09751
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.213 J-.097 P1  F30000
G1 X103.102 Y100.356 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7712
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30237
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J.001 E2.80319
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7712
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.004 E2.63415
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.072 J-.576 P1  F30000
G1 X104.333 Y100.705 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7712
G1 X103.45 Y100.705 E.02928
G1 X103.45 Y101.45 E.02474
G1 X107.55 Y105.55 E.19231
G1 X107.55 Y104.395 E.03832
G1 X106.737 Y105.207 E.03812
G2 X105.177 Y104.876 I-1.271 J2.147 E.05386
G1 X103.608 Y105.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973913
G1 F7712
G1 X103.544 Y106.061 E.00044
; LINE_WIDTH: 0.111413
G1 X103.476 Y106.152 E.00063
; LINE_WIDTH: 0.14728
G1 X103.403 Y106.248 E.00103
; LINE_WIDTH: 0.181657
G1 X103.306 Y106.391 E.00195
G1 X103.329 Y106.569 F30000
; LINE_WIDTH: 0.119481
G1 F7712
G3 X103.399 Y106.155 I8.32 J1.204 E.00262
G1 X103.328 Y107.942 F30000
; LINE_WIDTH: 0.129189
G1 F7712
G1 X103.346 Y108.046 E.00075
; LINE_WIDTH: 0.161458
G1 X103.365 Y108.151 E.00103
; LINE_WIDTH: 0.148176
G2 X103.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111398
G1 X103.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973909
G1 X103.547 Y108.427 E.00044
G1 X104.604 Y109.471 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7712
G3 X103.65 Y108.786 I.616 J-1.863 E.03958
G2 X103.45 Y109.126 I.029 J.246 E.01516
G1 X107.55 Y113.226 E.19231
G1 X107.55 Y112.071 E.03832
G1 X103.45 Y116.17 E.19231
G1 X103.45 Y116.802 E.02098
G1 X104.659 Y118.011 E.05669
G3 X106.253 Y117.981 I.84 J2.322 E.05385
G1 X107.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126783
G1 F7712
G1 X107.571 Y119.246 E.00138
; LINE_WIDTH: 0.173114
G1 X107.629 Y119.331 E.0011
; LINE_WIDTH: 0.136068
G1 X107.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969209
G1 X107.672 Y119.567 E.00047
G1 X107.601 Y121.354 F30000
; LINE_WIDTH: 0.119468
G1 F7712
G2 X107.671 Y120.939 I-8.246 J-1.618 E.00262
G1 X107.694 Y121.118 F30000
; LINE_WIDTH: 0.195637
G1 F7712
G1 X107.593 Y121.266 E.00224
; LINE_WIDTH: 0.179245
G1 X107.524 Y121.357 E.00126
; LINE_WIDTH: 0.129173
G1 X107.392 Y121.523 E.00149
G1 X106.356 Y122.491 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7712
G3 X104.763 Y122.533 I-.859 J-2.314 E.05385
G1 X103.45 Y123.846 E.06157
G1 X103.45 Y124.478 E.02098
G1 X107.55 Y128.578 E.19231
G1 X107.55 Y127.422 E.03832
G1 X103.582 Y131.39 E.18613
G2 X103.71 Y132.414 I10.312 J-.769 E.03423
G1 X109.778 Y138.482 E.28467
G2 X110.484 Y139.84 I11.744 J-5.248 E.0508
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I23.12 J-14.38 E.19098
G1 X108.268 Y134.38 E.15369
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F7712
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-20.999 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F7712
G3 X151.732 Y134.38 I-28.334 J-5.333 E.054
G1 X155.008 Y137.656 E.15369
G3 X152.505 Y142.829 I-30.297 J-11.469 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.389 J-15.856 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.194 J-1.794 E.03423
G1 X152.45 Y127.422 E.18613
G1 X152.45 Y128.578 E.03832
G1 X156.55 Y124.478 E.19231
G1 X156.55 Y123.846 E.02098
G1 X155.241 Y122.537 E.06138
G3 X153.647 Y122.488 I-.73 J-2.179 E.05404
G1 X152.547 Y121.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F7712
G1 X152.487 Y121.348 E.00044
; LINE_WIDTH: 0.111408
G1 X152.429 Y121.263 E.00058
; LINE_WIDTH: 0.148186
G3 X152.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X152.346 Y121.046 E.00103
; LINE_WIDTH: 0.129189
G1 X152.328 Y120.942 E.00075
G1 X152.399 Y119.155 F30000
; LINE_WIDTH: 0.119473
G1 F7712
G2 X152.329 Y119.569 I8.155 J1.604 E.00262
G1 X152.306 Y119.391 F30000
; LINE_WIDTH: 0.181648
G1 F7712
G1 X152.403 Y119.248 E.00195
; LINE_WIDTH: 0.147273
G1 X152.476 Y119.152 E.00103
; LINE_WIDTH: 0.111407
G1 X152.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973911
G1 X152.608 Y118.985 E.00044
G1 X153.742 Y117.975 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7712
G3 X155.337 Y118.015 I.743 J2.199 E.05403
G1 X156.55 Y116.802 E.05687
G1 X156.55 Y116.17 E.02098
G1 X152.45 Y112.071 E.19231
G1 X152.45 Y113.226 E.03832
G1 X156.55 Y109.126 E.19231
G1 X156.55 Y108.989 E.00457
G1 X156.492 Y109.061 E.00309
G1 X156.263 Y108.869 E.00991
G3 X155.368 Y109.486 I-1.803 J-1.661 E.03635
G1 X156.392 Y108.523 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129171
G1 F7712
G1 X156.524 Y108.357 E.00149
; LINE_WIDTH: 0.179239
G1 X156.593 Y108.266 E.00126
; LINE_WIDTH: 0.195637
G1 X156.694 Y108.118 E.00224
G1 X156.671 Y107.939 F30000
; LINE_WIDTH: 0.119472
G1 F7712
G3 X156.601 Y108.354 I-8.327 J-1.205 E.00262
M73 P82 R3
G1 X156.672 Y106.567 F30000
; LINE_WIDTH: 0.0969206
G1 F7712
G1 X156.654 Y106.462 E.00047
; LINE_WIDTH: 0.13607
G1 X156.629 Y106.331 E.00101
; LINE_WIDTH: 0.173118
G1 X156.571 Y106.246 E.0011
; LINE_WIDTH: 0.126786
G1 X156.453 Y106.081 E.00138
G1 X154.821 Y104.883 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7712
G2 X153.258 Y105.202 I-.311 J2.46 E.05385
G1 X152.45 Y104.395 E.0379
G1 X152.45 Y105.55 E.03832
G2 X152.528 Y105.463 I-.454 J-.485 E.00385
G1 X156.55 Y101.45 E.18847
G1 X156.55 Y100.705 E.02474
G1 X155.667 Y100.705 E.02928
G1 X152.608 Y105.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973912
G1 F7712
G1 X152.544 Y106.061 E.00044
; LINE_WIDTH: 0.11141
G1 X152.476 Y106.152 E.00063
; LINE_WIDTH: 0.147277
G1 X152.403 Y106.248 E.00103
; LINE_WIDTH: 0.181653
G1 X152.306 Y106.391 E.00195
G1 X152.329 Y106.569 F30000
; LINE_WIDTH: 0.119477
G1 F7712
G3 X152.399 Y106.155 I8.235 J1.191 E.00262
G1 X152.328 Y107.942 F30000
; LINE_WIDTH: 0.129187
G1 F7712
G1 X152.346 Y108.046 E.00075
; LINE_WIDTH: 0.161454
G1 X152.365 Y108.151 E.00103
; LINE_WIDTH: 0.148171
G2 X152.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111393
G1 X152.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973906
G1 X152.547 Y108.427 E.00044
G1 X156.453 Y119.081 F30000
; LINE_WIDTH: 0.126784
G1 F7712
G1 X156.571 Y119.246 E.00138
; LINE_WIDTH: 0.173117
G1 X156.629 Y119.331 E.0011
; LINE_WIDTH: 0.13607
G1 X156.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969209
G1 X156.672 Y119.567 E.00047
G1 X156.601 Y121.354 F30000
; LINE_WIDTH: 0.119472
G1 F7712
G2 X156.671 Y120.939 I-8.257 J-1.619 E.00262
G1 X156.694 Y121.118 F30000
; LINE_WIDTH: 0.19564
G1 F7712
G1 X156.593 Y121.266 E.00224
; LINE_WIDTH: 0.179245
G1 X156.524 Y121.357 E.00126
; LINE_WIDTH: 0.129172
G1 X156.392 Y121.523 E.00149
; WIPE_START
G1 F24000
G1 X156.524 Y121.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.064 J-.59 P1  F30000
G1 X138.469 Y153.916 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7712
G2 X139.993 Y153.345 I-4.965 J-15.556 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F7712
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.076 J-.568 P1  F30000
G1 X103.547 Y121.427 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F7712
G1 X103.487 Y121.348 E.00044
; LINE_WIDTH: 0.111405
G1 X103.429 Y121.263 E.00058
; LINE_WIDTH: 0.148184
G3 X103.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X103.346 Y121.046 E.00103
; LINE_WIDTH: 0.129191
G1 X103.328 Y120.942 E.00075
G1 X103.399 Y119.155 F30000
; LINE_WIDTH: 0.119477
G1 F7712
G2 X103.329 Y119.569 I8.161 J1.605 E.00262
G1 X103.306 Y119.391 F30000
; LINE_WIDTH: 0.18165
G1 F7712
G1 X103.403 Y119.248 E.00195
; LINE_WIDTH: 0.147275
G1 X103.476 Y119.152 E.00103
; LINE_WIDTH: 0.111408
G1 X103.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973919
G1 X103.608 Y118.985 E.00044
G1 X107.392 Y108.523 F30000
; LINE_WIDTH: 0.12917
G1 F7712
G1 X107.524 Y108.357 E.00149
; LINE_WIDTH: 0.179238
G1 X107.593 Y108.266 E.00126
; LINE_WIDTH: 0.195636
G1 X107.694 Y108.118 E.00224
G1 X107.671 Y107.939 F30000
; LINE_WIDTH: 0.119468
G1 F7712
G3 X107.601 Y108.354 I-8.316 J-1.203 E.00262
G1 X107.672 Y106.567 F30000
; LINE_WIDTH: 0.0969206
G1 F7712
G1 X107.654 Y106.462 E.00047
; LINE_WIDTH: 0.136068
G1 X107.629 Y106.331 E.00101
; LINE_WIDTH: 0.173113
G1 X107.571 Y106.246 E.0011
; LINE_WIDTH: 0.126784
G1 X107.453 Y106.081 E.00138
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.571 Y106.246 E-.76
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
G3 Z7.4 I-.396 J1.151 P1  F30000
G1 X153.535 Y122.063 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7711
G1 X153.221 Y121.858 E.01244
G3 X154.245 Y118.217 I1.278 J-1.605 E.15953
G1 X154.449 Y118.202 E.00679
G3 X153.588 Y122.091 I.051 J2.051 E.24683
G1 X153.728 Y121.722 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7711
G1 X153.466 Y121.551 E.00961
G3 X154.294 Y118.607 I1.034 J-1.298 E.11951
G1 X154.459 Y118.595 E.00509
G3 X153.781 Y121.749 I.041 J1.659 E.18428
M204 S10000
; WIPE_START
G1 F24000
G1 X153.466 Y121.551 E-.14148
G1 X153.228 Y121.321 E-.12557
G1 X153.042 Y121.048 E-.12564
G1 X152.914 Y120.744 E-.12563
G1 X152.848 Y120.42 E-.12543
G1 X152.842 Y120.17 E-.09498
G1 X152.85 Y120.115 E-.02127
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.202 J.192 P1  F30000
G1 X155.218 Y105.334 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7711
G1 X155.25 Y105.343 E.00111
G3 X154.245 Y105.217 I-.75 J1.91 E.39364
G1 X154.449 Y105.202 E.00679
G3 X154.856 Y105.233 I.051 J2.051 E.01358
G1 X155.16 Y105.318 E.01046
G1 X155.107 Y105.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7711
G3 X154.294 Y105.607 I-.607 J1.544 E.2949
G1 X154.459 Y105.595 E.00509
G3 X155.05 Y105.688 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X155.401 Y105.86 E-.14826
G1 X155.659 Y106.066 E-.12564
G1 X155.872 Y106.319 E-.12563
G1 X156.03 Y106.609 E-.12564
G1 X156.127 Y106.925 E-.12563
G1 X156.156 Y107.211 E-.10921
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.04 J-1.216 P1  F30000
G1 X104.446 Y105.496 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7711
G1 X104.474 Y105.477 E.00111
G3 X105.245 Y105.217 I1.026 J1.776 E.02717
G1 X105.449 Y105.202 E.00679
G3 X104.142 Y105.715 I.051 J2.051 E.38006
G1 X104.398 Y105.531 E.01046
G1 X104.69 Y105.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7711
G1 X104.971 Y105.68 E.00949
G3 X105.294 Y105.607 I.529 J1.573 E.01018
G1 X105.459 Y105.595 E.00509
G3 X104.637 Y105.836 I.041 J1.659 E.29372
M204 S10000
; WIPE_START
G1 F24000
G1 X104.971 Y105.68 E-.14008
G1 X105.294 Y105.607 E-.12564
G1 X105.459 Y105.595 E-.06289
G1 X105.788 Y105.619 E-.12564
G1 X106.107 Y105.709 E-.12563
G1 X106.401 Y105.86 E-.12563
G1 X106.513 Y105.949 E-.05448
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.217 J.028 P1  F30000
G1 X106.881 Y121.769 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7711
G1 X106.857 Y121.792 E.00111
G3 X105.245 Y118.217 I-1.357 J-1.539 E.25449
G1 X105.449 Y118.202 E.00679
G3 X107.135 Y121.492 I.051 J2.051 E.15274
G1 X106.922 Y121.725 E.01045
G1 X106.633 Y121.462 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7711
G1 X106.597 Y121.498 E.00154
G3 X105.294 Y118.607 I-1.097 J-1.244 E.19066
G1 X105.459 Y118.595 E.00509
G3 X106.822 Y121.256 I.041 J1.659 E.11443
G1 X106.673 Y121.418 E.00677
M204 S10000
; WIPE_START
G1 F24000
G1 X106.597 Y121.498 E-.04182
G1 X106.33 Y121.692 E-.12557
G1 X106.029 Y121.828 E-.12563
G1 X105.706 Y121.902 E-.12564
G1 X105.376 Y121.91 E-.12563
G1 X105.05 Y121.852 E-.12564
G1 X104.83 Y121.766 E-.09008
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.213 J-.098 P1  F30000
G1 X103.102 Y100.356 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7711
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30237
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J-.001 E2.80303
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7711
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.63401
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.072 J-.576 P1  F30000
G1 X104.333 Y100.705 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7711
G1 X103.45 Y100.705 E.02928
G1 X103.45 Y101.45 E.02474
G1 X107.55 Y105.55 E.19231
G1 X107.55 Y104.395 E.03832
G1 X106.737 Y105.207 E.03812
G2 X106.201 Y104.961 I-.876 J1.202 E.01969
G1 X106.235 Y104.695 E.00889
G1 X105.587 Y104.767 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518646
G1 F7711
G1 X105.728 Y104.785 E.00552
G1 X107.453 Y106.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126781
G1 F7711
G1 X107.571 Y106.246 E.00138
; LINE_WIDTH: 0.17311
G1 X107.629 Y106.331 E.0011
; LINE_WIDTH: 0.136065
G1 X107.654 Y106.462 E.00101
; LINE_WIDTH: 0.0969202
G1 X107.672 Y106.567 E.00047
G1 X107.672 Y107.942 F30000
; LINE_WIDTH: 0.0969204
G1 F7711
G1 X107.654 Y108.046 E.00047
; LINE_WIDTH: 0.136064
G1 X107.629 Y108.177 E.00101
; LINE_WIDTH: 0.173106
G1 X107.571 Y108.263 E.0011
; LINE_WIDTH: 0.126778
G1 X107.453 Y108.427 E.00138
G1 X104.604 Y109.471 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7711
G3 X103.65 Y108.786 I.616 J-1.863 E.03958
G2 X103.45 Y109.126 I.029 J.246 E.01516
G1 X107.55 Y113.226 E.19231
G1 X107.55 Y112.071 E.03832
G1 X103.45 Y116.17 E.19231
G1 X103.45 Y116.802 E.02098
G1 X104.659 Y118.011 E.05669
G3 X106.253 Y117.981 I.84 J2.322 E.05385
G1 X107.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126784
G1 F7711
G1 X107.571 Y119.246 E.00138
; LINE_WIDTH: 0.173115
G1 X107.629 Y119.331 E.0011
; LINE_WIDTH: 0.136068
G1 X107.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969205
G1 X107.672 Y119.567 E.00047
G1 X107.672 Y120.942 F30000
; LINE_WIDTH: 0.135851
G1 F7711
G3 X107.596 Y121.358 I-12.424 J-2.042 E.0032
G1 X107.524 Y121.358 F30000
; LINE_WIDTH: 0.178588
G1 F7711
G1 X107.592 Y121.268 E.00125
; LINE_WIDTH: 0.195648
G1 X107.694 Y121.118 E.00226
G1 X107.524 Y121.358 F30000
; LINE_WIDTH: 0.128914
G1 F7711
G1 X107.392 Y121.523 E.00148
G1 X106.356 Y122.491 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7711
G3 X104.763 Y122.533 I-.859 J-2.314 E.05385
G1 X103.45 Y123.846 E.06157
G1 X103.45 Y124.478 E.02098
G1 X107.55 Y128.578 E.19231
G1 X107.55 Y127.422 E.03832
G1 X103.582 Y131.39 E.18613
G2 X103.71 Y132.414 I10.323 J-.77 E.03424
G1 X109.758 Y138.462 E.28372
G2 X110.484 Y139.84 I28.706 J-14.257 E.05168
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I22.749 J-14.2 E.19099
G1 X108.268 Y134.38 E.15368
G3 X107.922 Y132.79 I27.99 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F7711
G2 X113.756 Y144.244 I20.235 J-16.883 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-20.999 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F7711
G3 X151.732 Y134.38 I-28.334 J-5.334 E.054
G1 X155.008 Y137.656 E.15368
G3 X152.505 Y142.829 I-30.297 J-11.468 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.388 J-15.855 E.0517
G1 X156.28 Y132.424 E.28322
G2 X156.418 Y131.39 I-8.769 J-1.698 E.03462
G1 X152.45 Y127.422 E.18613
G1 X152.45 Y128.578 E.03832
G1 X156.55 Y124.478 E.19231
G1 X156.55 Y123.846 E.02098
G1 X155.241 Y122.537 E.06138
G3 X153.647 Y122.488 I-.73 J-2.179 E.05404
G1 X152.547 Y121.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973911
G1 F7711
G1 X152.487 Y121.348 E.00044
; LINE_WIDTH: 0.111421
G1 X152.429 Y121.263 E.00058
; LINE_WIDTH: 0.1482
G3 X152.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X152.346 Y121.046 E.00103
; LINE_WIDTH: 0.129188
G1 X152.328 Y120.942 E.00075
G1 X152.329 Y119.569 F30000
; LINE_WIDTH: 0.119479
G1 F7711
G3 X152.399 Y119.155 I8.253 J1.194 E.00262
G1 X152.476 Y119.152 F30000
; LINE_WIDTH: 0.147279
G1 F7711
G1 X152.403 Y119.248 E.00103
; LINE_WIDTH: 0.18165
G1 X152.306 Y119.391 E.00195
G1 X152.476 Y119.152 F30000
; LINE_WIDTH: 0.111416
G1 F7711
G1 X152.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973922
G1 X152.608 Y118.985 E.00044
G1 X153.742 Y117.975 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7711
G3 X155.337 Y118.015 I.743 J2.199 E.05403
G1 X156.55 Y116.802 E.05687
G1 X156.55 Y116.17 E.02098
G1 X152.45 Y112.071 E.19231
G1 X152.45 Y113.226 E.03832
G1 X156.55 Y109.126 E.19231
G2 X156.35 Y108.786 I-.229 J-.095 E.01516
G3 X155.396 Y109.474 I-1.625 J-1.248 E.03954
M73 P83 R3
G1 X156.453 Y108.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126781
G1 F7711
G1 X156.571 Y108.263 E.00138
; LINE_WIDTH: 0.17311
G1 X156.629 Y108.177 E.0011
; LINE_WIDTH: 0.136067
G1 X156.654 Y108.046 E.00101
; LINE_WIDTH: 0.0969204
G1 X156.672 Y107.941 E.00047
G1 X156.672 Y106.567 F30000
; LINE_WIDTH: 0.0969202
G1 F7711
G1 X156.654 Y106.462 E.00047
; LINE_WIDTH: 0.136066
G1 X156.629 Y106.331 E.00101
; LINE_WIDTH: 0.173109
G1 X156.571 Y106.246 E.0011
; LINE_WIDTH: 0.12678
G1 X156.453 Y106.081 E.00138
G1 X154.587 Y104.767 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518646
G1 F7711
G1 X154.728 Y104.785 E.00552
G1 X154.458 Y104.318 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7711
G1 X154.13 Y104.548 E.01328
G1 X154.068 Y104.9 E.01187
G2 X153.258 Y105.202 I.583 J2.801 E.02878
G1 X152.45 Y104.395 E.0379
G1 X152.45 Y105.55 E.03832
G2 X152.528 Y105.463 I-.454 J-.485 E.00385
G1 X156.55 Y101.45 E.18847
G1 X156.55 Y100.705 E.02474
G1 X155.667 Y100.705 E.02928
G1 X152.608 Y105.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973918
G1 F7711
G1 X152.544 Y106.061 E.00044
; LINE_WIDTH: 0.111406
G1 X152.476 Y106.152 E.00063
; LINE_WIDTH: 0.147266
G1 X152.403 Y106.248 E.00103
; LINE_WIDTH: 0.181635
G1 X152.306 Y106.391 E.00195
G1 X152.329 Y106.569 F30000
; LINE_WIDTH: 0.119471
G1 F7711
G3 X152.399 Y106.155 I8.234 J1.191 E.00262
G1 X152.328 Y107.942 F30000
; LINE_WIDTH: 0.129192
G1 F7711
G1 X152.346 Y108.046 E.00075
; LINE_WIDTH: 0.161464
G1 X152.365 Y108.151 E.00103
; LINE_WIDTH: 0.148171
G2 X152.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111398
G1 X152.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973906
G1 X152.547 Y108.427 E.00044
G1 X156.453 Y119.081 F30000
; LINE_WIDTH: 0.126786
G1 F7711
G1 X156.571 Y119.246 E.00138
; LINE_WIDTH: 0.173119
G1 X156.629 Y119.331 E.0011
; LINE_WIDTH: 0.136071
G1 X156.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969205
G1 X156.672 Y119.567 E.00047
G1 X156.672 Y120.942 F30000
; LINE_WIDTH: 0.135855
G1 F7711
G3 X156.596 Y121.358 I-12.412 J-2.039 E.0032
G1 X156.524 Y121.358 F30000
; LINE_WIDTH: 0.17859
G1 F7711
G1 X156.592 Y121.268 E.00125
; LINE_WIDTH: 0.195652
G1 X156.694 Y121.118 E.00226
G1 X156.524 Y121.358 F30000
; LINE_WIDTH: 0.128914
G1 F7711
G1 X156.392 Y121.523 E.00148
; WIPE_START
G1 F24000
G1 X156.524 Y121.358 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.984 J-.717 P1  F30000
G1 X135.226 Y150.583 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7711
G2 X136.794 Y150.146 I-3.6 J-15.927 E.05402
G1 X139.993 Y153.345 E.15007
G3 X138.469 Y153.916 I-6.489 J-14.984 E.05403
G1 X124.774 Y150.583 F30000
G1 F7711
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.076 J-.568 P1  F30000
G1 X103.547 Y121.427 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.097391
G1 F7711
G1 X103.487 Y121.348 E.00044
; LINE_WIDTH: 0.111418
G1 X103.429 Y121.263 E.00058
; LINE_WIDTH: 0.148197
G3 X103.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X103.346 Y121.046 E.00103
; LINE_WIDTH: 0.12919
G1 X103.328 Y120.942 E.00075
G1 X103.329 Y119.569 F30000
; LINE_WIDTH: 0.119483
G1 F7711
G3 X103.399 Y119.155 I8.334 J1.206 E.00262
G1 X103.476 Y119.152 F30000
; LINE_WIDTH: 0.111416
G1 F7711
G1 X103.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973923
G1 X103.608 Y118.985 E.00044
G1 X103.476 Y119.152 F30000
; LINE_WIDTH: 0.14728
G1 F7711
G1 X103.403 Y119.248 E.00103
; LINE_WIDTH: 0.181653
G1 X103.306 Y119.391 E.00195
G1 X103.547 Y108.427 F30000
; LINE_WIDTH: 0.0973907
G1 F7711
G1 X103.487 Y108.348 E.00044
; LINE_WIDTH: 0.111395
G1 X103.429 Y108.263 E.00058
; LINE_WIDTH: 0.148168
G3 X103.365 Y108.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161468
G1 X103.346 Y108.046 E.00103
; LINE_WIDTH: 0.129194
G1 X103.328 Y107.942 E.00075
G1 X103.329 Y106.569 F30000
; LINE_WIDTH: 0.119475
G1 F7711
G3 X103.399 Y106.155 I8.245 J1.192 E.00262
G1 X103.476 Y106.152 F30000
; LINE_WIDTH: 0.111408
G1 F7711
G1 X103.544 Y106.061 E.00063
; LINE_WIDTH: 0.0973917
G1 X103.608 Y105.985 E.00044
G1 X103.476 Y106.152 F30000
; LINE_WIDTH: 0.147268
G1 F7711
G1 X103.403 Y106.248 E.00103
; LINE_WIDTH: 0.181638
G1 X103.306 Y106.391 E.00195
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X103.403 Y106.248 E-.76
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
G3 Z7.6 I-.366 J1.161 P1  F30000
G1 X153.535 Y122.063 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7717
G1 X153.221 Y121.858 E.01244
G3 X154.245 Y118.217 I1.278 J-1.605 E.15953
G1 X154.449 Y118.202 E.00679
G3 X153.588 Y122.091 I.051 J2.051 E.24683
G1 X153.731 Y121.724 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7717
G1 X153.466 Y121.551 E.00974
G3 X154.294 Y118.607 I1.034 J-1.298 E.11951
G1 X154.459 Y118.595 E.00509
G3 X153.785 Y121.751 I.041 J1.659 E.18415
M204 S10000
; WIPE_START
G1 F24000
G1 X153.466 Y121.551 E-.14301
G1 X153.228 Y121.321 E-.12556
G1 X153.042 Y121.048 E-.12564
G1 X152.913 Y120.744 E-.12563
G1 X152.848 Y120.42 E-.12563
G1 X152.848 Y120.118 E-.11452
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.201 J.198 P1  F30000
G1 X155.28 Y105.359 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7717
G1 X155.613 Y105.53 E.01245
G3 X154.339 Y105.208 I-1.114 J1.723 E.38317
G1 X154.456 Y105.202 E.00389
G3 X155.225 Y105.334 I.044 J2.051 E.02603
G1 X155.106 Y105.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7717
G3 X154.373 Y105.599 I-.607 J1.544 E.29735
G1 X154.461 Y105.595 E.0027
G3 X155.05 Y105.688 I.039 J1.659 E.01843
M204 S10000
; WIPE_START
G1 F24000
G1 X155.401 Y105.86 E-.14826
G1 X155.659 Y106.066 E-.12563
G1 X155.872 Y106.319 E-.12563
G1 X156.03 Y106.609 E-.12564
G1 X156.127 Y106.925 E-.12564
G1 X156.159 Y107.206 E-.10744
G1 X156.159 Y107.211 E-.00177
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.042 J-1.216 P1  F30000
G1 X104.595 Y105.415 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7717
G1 X104.944 Y105.279 E.01245
G3 X105.339 Y105.208 I.556 J1.975 E.01333
G1 X105.456 Y105.202 E.00389
G3 X104.54 Y105.44 I.044 J2.051 E.39588
G1 X104.694 Y105.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7717
G1 X104.743 Y105.777 E.00179
G3 X105.373 Y105.599 I.757 J1.476 E.02027
G1 X105.461 Y105.595 E.0027
G3 X104.465 Y105.956 I.039 J1.659 E.28718
G1 X104.643 Y105.841 E.00653
M204 S10000
; WIPE_START
G1 F24000
G1 X104.743 Y105.777 E-.04489
G1 X105.05 Y105.656 E-.12564
G1 X105.373 Y105.599 E-.12463
G1 X105.461 Y105.595 E-.03345
G1 X105.788 Y105.619 E-.12464
G1 X106.107 Y105.709 E-.12563
G1 X106.401 Y105.86 E-.12564
G1 X106.515 Y105.951 E-.05549
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.217 J.028 P1  F30000
G1 X106.881 Y121.769 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7717
G1 X106.857 Y121.792 E.00111
G3 X105.245 Y118.217 I-1.357 J-1.539 E.25449
G1 X105.449 Y118.202 E.00679
G3 X107.135 Y121.492 I.051 J2.051 E.15274
G1 X106.922 Y121.725 E.01045
G1 X106.655 Y121.438 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7717
G1 X106.597 Y121.498 E.00256
G3 X105.294 Y118.607 I-1.097 J-1.244 E.19066
G1 X105.459 Y118.595 E.00509
G3 X106.822 Y121.256 I.041 J1.659 E.11443
G1 X106.696 Y121.394 E.00575
M204 S10000
; WIPE_START
G1 F24000
G1 X106.597 Y121.498 E-.05446
G1 X106.33 Y121.692 E-.12556
G1 X106.029 Y121.828 E-.12564
G1 X105.706 Y121.902 E-.12563
G1 X105.376 Y121.91 E-.12563
G1 X105.05 Y121.852 E-.12564
G1 X104.861 Y121.778 E-.07743
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.213 J-.1 P1  F30000
G1 X103.102 Y100.356 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7717
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.012 E2.30254
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J.002 E2.80325
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7717
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.007 E2.0953
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.003 E2.63421
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.072 J-.576 P1  F30000
G1 X104.333 Y100.705 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7717
G1 X103.45 Y100.705 E.02928
G1 X103.45 Y101.45 E.02474
G1 X107.55 Y105.55 E.19231
G1 X107.55 Y104.395 E.03832
G1 X106.737 Y105.207 E.03812
G2 X105.178 Y104.883 I-1.245 J2.076 E.05383
G1 X103.547 Y106.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.097392
G1 F7717
G1 X103.487 Y106.16 E.00044
; LINE_WIDTH: 0.111409
G1 X103.429 Y106.246 E.00058
; LINE_WIDTH: 0.148189
G2 X103.365 Y106.357 I.121 J.144 E.00113
; LINE_WIDTH: 0.161455
G1 X103.346 Y106.462 E.00103
; LINE_WIDTH: 0.129188
G1 X103.328 Y106.567 E.00075
G1 X103.328 Y107.942 F30000
; LINE_WIDTH: 0.129191
G1 F7717
G1 X103.346 Y108.046 E.00075
; LINE_WIDTH: 0.16146
G1 X103.365 Y108.151 E.00103
; LINE_WIDTH: 0.148175
G2 X103.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111399
G1 X103.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973906
G1 X103.547 Y108.427 E.00044
G1 X104.604 Y109.471 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7717
G3 X103.65 Y108.786 I.616 J-1.863 E.03957
G2 X103.45 Y109.126 I.029 J.246 E.01516
G1 X107.55 Y113.226 E.19231
G1 X107.55 Y112.071 E.03832
G1 X103.45 Y116.17 E.19231
G1 X103.45 Y116.802 E.02098
G1 X104.659 Y118.011 E.05669
G3 X106.253 Y117.981 I.84 J2.322 E.05385
G1 X107.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126787
G1 F7717
G1 X107.571 Y119.246 E.00138
; LINE_WIDTH: 0.173118
G1 X107.629 Y119.331 E.0011
; LINE_WIDTH: 0.136069
G1 X107.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969209
G1 X107.672 Y119.567 E.00047
G1 X107.601 Y121.354 F30000
; LINE_WIDTH: 0.119472
G1 F7717
G2 X107.671 Y120.939 I-8.238 J-1.617 E.00262
M73 P83 R2
G1 X107.694 Y121.118 F30000
; LINE_WIDTH: 0.195629
G1 F7717
G1 X107.593 Y121.266 E.00224
; LINE_WIDTH: 0.17922
G1 X107.524 Y121.357 E.00126
; LINE_WIDTH: 0.129162
G1 X107.392 Y121.523 E.00149
G1 X106.356 Y122.491 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7717
G3 X104.763 Y122.533 I-.859 J-2.314 E.05385
G1 X103.45 Y123.846 E.06157
G1 X103.45 Y124.478 E.02098
G1 X107.55 Y128.578 E.19231
G1 X107.55 Y127.422 E.03832
G1 X103.582 Y131.39 E.18613
G2 X103.71 Y132.414 I10.314 J-.769 E.03423
G1 X109.774 Y138.478 E.28449
G2 X110.484 Y139.84 I12.061 J-5.425 E.05096
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15369
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F7717
G2 X113.756 Y144.244 I20.234 J-16.882 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-21 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.154 J-18.1 E.054
G1 X152.078 Y132.79 F30000
G1 F7717
G3 X151.732 Y134.38 I-28.335 J-5.334 E.054
G1 X155.008 Y137.656 E.15369
G3 X152.505 Y142.829 I-30.297 J-11.469 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.389 J-15.856 E.0517
G1 X156.281 Y132.423 E.28326
G2 X156.418 Y131.39 I-8.895 J-1.706 E.03458
G1 X152.45 Y127.422 E.18613
G1 X152.45 Y128.578 E.03832
G1 X156.55 Y124.478 E.19231
G1 X156.55 Y123.846 E.02098
G1 X155.241 Y122.537 E.06138
G3 X153.647 Y122.488 I-.73 J-2.179 E.05404
G1 X152.547 Y121.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973913
G1 F7717
G1 X152.487 Y121.348 E.00044
; LINE_WIDTH: 0.111407
G1 X152.429 Y121.263 E.00058
; LINE_WIDTH: 0.148185
G3 X152.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X152.346 Y121.046 E.00103
; LINE_WIDTH: 0.129189
G1 X152.328 Y120.942 E.00075
G1 X152.404 Y119.15 F30000
; LINE_WIDTH: 0.138231
G1 F7717
G2 X152.328 Y119.567 I12.462 J2.486 E.00329
G1 X152.306 Y119.39 F30000
; LINE_WIDTH: 0.180652
G1 F7717
G1 X152.405 Y119.246 E.00197
; LINE_WIDTH: 0.146738
G1 X152.476 Y119.151 E.00101
; LINE_WIDTH: 0.111404
G1 X152.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973915
G1 X152.608 Y118.985 E.00044
G1 X153.742 Y117.975 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7717
G3 X155.337 Y118.015 I.743 J2.199 E.05403
M73 P84 R2
G1 X156.55 Y116.802 E.05687
G1 X156.55 Y116.17 E.02098
G1 X152.45 Y112.071 E.19231
G1 X152.45 Y113.226 E.03832
G1 X156.55 Y109.126 E.19231
G1 X156.55 Y108.989 E.00457
G1 X156.492 Y109.061 E.00308
G1 X156.263 Y108.869 E.00991
G3 X155.368 Y109.486 I-1.803 J-1.661 E.03635
G1 X156.392 Y108.523 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F7717
G1 X156.524 Y108.357 E.00149
; LINE_WIDTH: 0.179227
G1 X156.593 Y108.266 E.00126
; LINE_WIDTH: 0.195632
G1 X156.694 Y108.118 E.00224
G1 X156.671 Y107.939 F30000
; LINE_WIDTH: 0.119474
G1 F7717
G3 X156.601 Y108.354 I-8.305 J-1.202 E.00262
G1 X156.672 Y106.567 F30000
; LINE_WIDTH: 0.0969205
G1 F7717
G1 X156.654 Y106.462 E.00047
; LINE_WIDTH: 0.136069
G1 X156.629 Y106.331 E.00101
; LINE_WIDTH: 0.173116
G1 X156.571 Y106.246 E.0011
; LINE_WIDTH: 0.126785
G1 X156.453 Y106.081 E.00138
G1 X154.822 Y104.883 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7717
G2 X153.263 Y105.207 I-.316 J2.394 E.05383
G1 X152.45 Y104.395 E.03812
G1 X152.45 Y105.55 E.03832
G1 X156.55 Y101.45 E.19231
G1 X156.55 Y100.705 E.02474
G1 X155.667 Y100.705 E.02928
G1 X152.547 Y106.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973918
G1 F7717
G1 X152.487 Y106.16 E.00044
; LINE_WIDTH: 0.111411
G1 X152.429 Y106.246 E.00058
; LINE_WIDTH: 0.148191
G2 X152.365 Y106.357 I.121 J.144 E.00113
; LINE_WIDTH: 0.161451
G1 X152.346 Y106.462 E.00103
; LINE_WIDTH: 0.129186
G1 X152.328 Y106.567 E.00075
G1 X152.328 Y107.942 F30000
; LINE_WIDTH: 0.129189
G1 F7717
G1 X152.346 Y108.046 E.00075
; LINE_WIDTH: 0.161456
G1 X152.365 Y108.151 E.00103
; LINE_WIDTH: 0.148171
G2 X152.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111396
G1 X152.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973905
G1 X152.547 Y108.427 E.00044
G1 X156.453 Y119.081 F30000
; LINE_WIDTH: 0.126785
G1 F7717
G1 X156.571 Y119.246 E.00138
; LINE_WIDTH: 0.173116
G1 X156.629 Y119.331 E.0011
; LINE_WIDTH: 0.136069
G1 X156.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969209
G1 X156.672 Y119.567 E.00047
G1 X156.601 Y121.353 F30000
; LINE_WIDTH: 0.119475
G1 F7717
G2 X156.671 Y120.939 I-8.319 J-1.629 E.00262
G1 X156.694 Y121.118 F30000
; LINE_WIDTH: 0.195632
G1 F7717
G1 X156.593 Y121.266 E.00224
; LINE_WIDTH: 0.179219
G1 X156.524 Y121.357 E.00126
; LINE_WIDTH: 0.129161
G1 X156.392 Y121.523 E.00149
; WIPE_START
G1 F24000
G1 X156.524 Y121.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.064 J-.59 P1  F30000
G1 X138.469 Y153.916 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7717
G2 X139.993 Y153.345 I-4.965 J-15.557 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F7717
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.984 E.05403
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.076 J-.568 P1  F30000
G1 X103.547 Y121.427 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973919
G1 F7717
G1 X103.487 Y121.348 E.00044
; LINE_WIDTH: 0.11141
G1 X103.429 Y121.263 E.00058
; LINE_WIDTH: 0.148188
G3 X103.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X103.346 Y121.046 E.00103
; LINE_WIDTH: 0.129191
G1 X103.328 Y120.942 E.00075
G1 X103.404 Y119.15 F30000
; LINE_WIDTH: 0.138236
G1 F7717
G2 X103.328 Y119.567 I12.448 J2.483 E.00329
G1 X103.306 Y119.39 F30000
; LINE_WIDTH: 0.180654
G1 F7717
G1 X103.405 Y119.246 E.00197
; LINE_WIDTH: 0.146739
G1 X103.476 Y119.151 E.00101
; LINE_WIDTH: 0.111406
G1 X103.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973917
G1 X103.608 Y118.985 E.00044
G1 X107.392 Y108.523 F30000
; LINE_WIDTH: 0.129164
G1 F7717
G1 X107.524 Y108.357 E.00149
; LINE_WIDTH: 0.179226
G1 X107.593 Y108.266 E.00126
; LINE_WIDTH: 0.195631
G1 X107.694 Y108.118 E.00224
G1 X107.671 Y107.939 F30000
; LINE_WIDTH: 0.11947
G1 F7717
G3 X107.601 Y108.354 I-8.31 J-1.203 E.00262
G1 X107.672 Y106.567 F30000
; LINE_WIDTH: 0.0969205
G1 F7717
G1 X107.654 Y106.462 E.00047
; LINE_WIDTH: 0.136068
G1 X107.629 Y106.331 E.00101
; LINE_WIDTH: 0.173115
G1 X107.571 Y106.246 E.0011
; LINE_WIDTH: 0.126784
G1 X107.453 Y106.081 E.00138
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.571 Y106.246 E-.76
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
G3 Z7.8 I-.396 J1.151 P1  F30000
G1 X153.595 Y122.093 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7713
G1 X153.565 Y122.079 E.00111
G3 X154.245 Y118.217 I.935 J-1.826 E.17309
G1 X154.449 Y118.202 E.00679
G3 X153.945 Y122.228 I.051 J2.051 E.23414
G1 X153.651 Y122.115 E.01045
G1 X153.734 Y121.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7713
G1 X153.466 Y121.551 E.00986
G3 X154.294 Y118.607 I1.034 J-1.298 E.11951
G1 X154.459 Y118.595 E.00509
G3 X153.789 Y121.752 I.041 J1.659 E.18403
M204 S10000
; WIPE_START
G1 F24000
G1 X153.466 Y121.551 E-.14449
G1 X153.228 Y121.321 E-.12557
G1 X153.042 Y121.048 E-.12563
G1 X152.914 Y120.744 E-.12563
G1 X152.848 Y120.42 E-.12532
G1 X152.842 Y120.171 E-.09496
G1 X152.849 Y120.123 E-.0184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.202 J.192 P1  F30000
G1 X155.218 Y105.334 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7713
G1 X155.25 Y105.343 E.00111
G3 X154.245 Y105.217 I-.75 J1.91 E.39364
G1 X154.449 Y105.202 E.00679
G3 X154.856 Y105.233 I.051 J2.051 E.01358
G1 X155.16 Y105.318 E.01046
G1 X155.107 Y105.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7713
G3 X154.294 Y105.607 I-.607 J1.544 E.2949
G1 X154.459 Y105.595 E.00509
G3 X155.05 Y105.688 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X155.401 Y105.86 E-.14826
G1 X155.659 Y106.066 E-.12563
G1 X155.872 Y106.319 E-.12564
G1 X156.03 Y106.609 E-.12563
G1 X156.127 Y106.925 E-.12563
G1 X156.159 Y107.211 E-.1092
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.04 J-1.216 P1  F30000
G1 X104.446 Y105.496 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7713
G1 X104.474 Y105.477 E.00111
G3 X105.245 Y105.217 I1.026 J1.776 E.02717
G1 X105.449 Y105.202 E.00679
G3 X104.142 Y105.715 I.051 J2.051 E.38006
G1 X104.398 Y105.531 E.01046
G1 X104.684 Y105.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7713
G1 X104.971 Y105.68 E.00969
G3 X105.294 Y105.607 I.529 J1.573 E.01018
G1 X105.459 Y105.595 E.00509
G3 X104.632 Y105.839 I.041 J1.659 E.29353
M204 S10000
; WIPE_START
G1 F24000
G1 X104.971 Y105.68 E-.1425
G1 X105.294 Y105.607 E-.12565
G1 X105.459 Y105.595 E-.06289
G1 X105.788 Y105.619 E-.12564
G1 X106.107 Y105.709 E-.12563
G1 X106.401 Y105.86 E-.12564
G1 X106.508 Y105.945 E-.05206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.216 J.038 P1  F30000
G1 X106.997 Y121.644 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7713
G1 X106.857 Y121.792 E.00677
G3 X105.245 Y118.217 I-1.357 J-1.539 E.25449
G1 X105.449 Y118.202 E.00679
G3 X107.135 Y121.493 I.051 J2.051 E.15274
G1 X107.038 Y121.599 E.00478
G1 X106.69 Y121.407 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7713
G1 X106.468 Y121.601 E.00905
G3 X105.294 Y118.607 I-.968 J-1.348 E.18557
G1 X105.459 Y118.595 E.00509
G3 X106.732 Y121.365 I.041 J1.659 E.11877
M204 S10000
; WIPE_START
G1 F24000
G1 X106.468 Y121.601 E-.13459
G1 X106.183 Y121.768 E-.12556
G1 X105.869 Y121.873 E-.12564
G1 X105.541 Y121.914 E-.12563
G1 X105.212 Y121.889 E-.12564
G1 X105.05 Y121.852 E-.06289
G1 X104.903 Y121.795 E-.06005
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.213 J-.102 P1  F30000
G1 X103.102 Y100.356 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7713
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.011 E2.30256
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J.003 E2.80329
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7713
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.006 E2.09533
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.002 E2.63424
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.072 J-.576 P1  F30000
G1 X104.333 Y100.705 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7713
G1 X103.45 Y100.705 E.02928
G1 X103.45 Y101.45 E.02474
G1 X107.55 Y105.55 E.19231
G1 X107.55 Y104.395 E.03832
G1 X106.737 Y105.207 E.03812
G2 X105.177 Y104.876 I-1.271 J2.147 E.05386
G1 X103.608 Y105.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F7713
G1 X103.544 Y106.061 E.00044
; LINE_WIDTH: 0.111406
G1 X103.476 Y106.152 E.00063
; LINE_WIDTH: 0.147273
G1 X103.403 Y106.248 E.00103
; LINE_WIDTH: 0.181649
G1 X103.306 Y106.391 E.00195
G1 X103.329 Y106.569 F30000
; LINE_WIDTH: 0.119479
G1 F7713
G3 X103.399 Y106.155 I8.327 J1.205 E.00262
G1 X103.328 Y107.941 F30000
; LINE_WIDTH: 0.129188
G1 F7713
G1 X103.346 Y108.046 E.00075
; LINE_WIDTH: 0.161456
G1 X103.365 Y108.151 E.00103
; LINE_WIDTH: 0.148171
G2 X103.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111392
G1 X103.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973903
G1 X103.547 Y108.427 E.00044
G1 X104.604 Y109.471 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7713
G3 X103.65 Y108.786 I.616 J-1.863 E.03957
G2 X103.45 Y109.126 I.029 J.246 E.01516
G1 X107.55 Y113.226 E.19231
G1 X107.55 Y112.071 E.03832
G1 X103.45 Y116.17 E.19231
G1 X103.45 Y116.802 E.02098
G1 X104.659 Y118.011 E.05669
G3 X106.253 Y117.981 I.84 J2.322 E.05385
G1 X107.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126786
G1 F7713
G1 X107.571 Y119.246 E.00138
; LINE_WIDTH: 0.173117
G1 X107.629 Y119.331 E.0011
; LINE_WIDTH: 0.136068
G1 X107.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969205
G1 X107.672 Y119.567 E.00047
G1 X107.601 Y121.354 F30000
; LINE_WIDTH: 0.119464
G1 F7713
G2 X107.671 Y120.939 I-8.267 J-1.621 E.00262
G1 X107.694 Y121.118 F30000
; LINE_WIDTH: 0.195631
G1 F7713
G1 X107.593 Y121.266 E.00224
; LINE_WIDTH: 0.179222
G1 X107.524 Y121.357 E.00126
; LINE_WIDTH: 0.129163
G1 X107.392 Y121.523 E.00149
G1 X106.356 Y122.491 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7713
G3 X104.763 Y122.533 I-.859 J-2.314 E.05385
G1 X103.45 Y123.846 E.06157
G1 X103.45 Y124.478 E.02098
G1 X107.55 Y128.578 E.19231
G1 X107.55 Y127.422 E.03832
G1 X103.582 Y131.39 E.18613
G2 X103.71 Y132.414 I10.312 J-.769 E.03423
G1 X109.757 Y138.461 E.2837
G2 X110.484 Y139.84 I29.115 J-14.477 E.0517
G1 X107.495 Y142.829 E.14024
G3 X104.992 Y137.656 I27.794 J-16.641 E.19088
G1 X108.268 Y134.38 E.15369
G3 X107.922 Y132.79 I27.988 J-6.924 E.054
G1 X112.675 Y143.027 F30000
G1 F7713
G2 X113.756 Y144.244 I20.234 J-16.882 E.054
G1 X110.859 Y147.141 E.13593
G2 X115.015 Y150.661 I19.186 J-18.445 E.18098
G1 X117.97 Y147.706 E.13863
G2 X120.28 Y148.984 I12.424 J-19.721 E.08762
G1 X126.34 Y155.043 E.28426
G1 X126.031 Y154.997 E.01035
G1 X129.83 Y151.198 E.17822
G1 X130.17 Y151.198 E.01128
G1 X133.969 Y154.997 E.17822
G1 X133.66 Y155.043 E.01035
G1 X139.72 Y148.984 E.28426
G2 X142.03 Y147.706 I-10.114 J-20.999 E.08762
G1 X144.985 Y150.661 E.13863
G2 X149.141 Y147.141 I-15.029 J-21.965 E.18098
G1 X146.244 Y144.244 E.13593
G2 X147.325 Y143.027 I-19.153 J-18.099 E.054
G1 X152.078 Y132.79 F30000
G1 F7713
G3 X151.732 Y134.38 I-28.334 J-5.333 E.054
G1 X155.008 Y137.656 E.15369
G3 X152.505 Y142.829 I-30.297 J-11.469 E.19088
G1 X149.516 Y139.84 E.14024
G2 X150.243 Y138.461 I-28.389 J-15.856 E.0517
G1 X156.29 Y132.414 E.2837
G2 X156.418 Y131.39 I-10.198 J-1.794 E.03423
G1 X152.45 Y127.422 E.18613
G1 X152.45 Y128.578 E.03832
G1 X156.55 Y124.478 E.19231
G1 X156.55 Y123.846 E.02098
G1 X155.241 Y122.537 E.06138
G3 X153.647 Y122.488 I-.73 J-2.179 E.05404
G1 X152.547 Y121.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F7713
G1 X152.487 Y121.348 E.00044
; LINE_WIDTH: 0.111406
G1 X152.429 Y121.263 E.00058
; LINE_WIDTH: 0.148183
G3 X152.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X152.346 Y121.046 E.00103
; LINE_WIDTH: 0.12919
G1 X152.328 Y120.942 E.00075
G1 X152.399 Y119.155 F30000
; LINE_WIDTH: 0.119478
G1 F7713
G2 X152.329 Y119.569 I8.24 J1.617 E.00262
G1 X152.306 Y119.391 F30000
; LINE_WIDTH: 0.181637
G1 F7713
G1 X152.403 Y119.248 E.00195
; LINE_WIDTH: 0.147266
M73 P85 R2
G1 X152.476 Y119.152 E.00103
; LINE_WIDTH: 0.111404
G1 X152.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973918
G1 X152.608 Y118.985 E.00044
G1 X153.742 Y117.975 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7713
G3 X155.337 Y118.015 I.743 J2.199 E.05403
G1 X156.55 Y116.802 E.05687
G1 X156.55 Y116.17 E.02098
G1 X152.45 Y112.071 E.19231
G1 X152.45 Y113.226 E.03832
G1 X156.55 Y109.126 E.19231
G1 X156.55 Y108.989 E.00457
G1 X156.492 Y109.061 E.00308
G1 X156.263 Y108.869 E.00991
G3 X155.368 Y109.486 I-1.803 J-1.661 E.03635
G1 X156.392 Y108.523 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129163
G1 F7713
G1 X156.524 Y108.357 E.00149
; LINE_WIDTH: 0.179221
G1 X156.593 Y108.266 E.00126
; LINE_WIDTH: 0.195632
G1 X156.694 Y108.118 E.00224
G1 X156.671 Y107.939 F30000
; LINE_WIDTH: 0.119479
G1 F7713
G3 X156.601 Y108.354 I-8.334 J-1.206 E.00262
G1 X156.672 Y106.567 F30000
; LINE_WIDTH: 0.0969204
G1 F7713
G1 X156.654 Y106.462 E.00047
; LINE_WIDTH: 0.136069
G1 X156.629 Y106.331 E.00101
; LINE_WIDTH: 0.173115
G1 X156.571 Y106.246 E.0011
; LINE_WIDTH: 0.126785
G1 X156.453 Y106.081 E.00138
G1 X154.821 Y104.883 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7713
G2 X153.258 Y105.202 I-.311 J2.46 E.05385
G1 X152.45 Y104.395 E.0379
G1 X152.45 Y105.55 E.03832
G2 X152.528 Y105.463 I-.454 J-.485 E.00385
G1 X156.55 Y101.45 E.18847
G1 X156.55 Y100.705 E.02474
G1 X155.667 Y100.705 E.02928
G1 X152.608 Y105.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F7713
G1 X152.544 Y106.061 E.00044
; LINE_WIDTH: 0.111406
G1 X152.476 Y106.152 E.00063
; LINE_WIDTH: 0.147272
G1 X152.403 Y106.248 E.00103
; LINE_WIDTH: 0.181646
G1 X152.306 Y106.391 E.00195
G1 X152.329 Y106.569 F30000
; LINE_WIDTH: 0.119474
G1 F7713
G3 X152.399 Y106.155 I8.333 J1.206 E.00262
G1 X152.328 Y107.942 F30000
; LINE_WIDTH: 0.129186
G1 F7713
G1 X152.346 Y108.046 E.00075
; LINE_WIDTH: 0.161452
G1 X152.365 Y108.151 E.00103
; LINE_WIDTH: 0.148168
G2 X152.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.11139
G1 X152.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973913
G1 X152.547 Y108.427 E.00044
G1 X156.453 Y119.081 F30000
; LINE_WIDTH: 0.126788
G1 F7713
G1 X156.571 Y119.246 E.00138
; LINE_WIDTH: 0.173121
G1 X156.629 Y119.331 E.0011
; LINE_WIDTH: 0.136071
G1 X156.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969205
G1 X156.672 Y119.567 E.00047
G1 X156.601 Y121.354 F30000
; LINE_WIDTH: 0.119468
G1 F7713
G2 X156.671 Y120.939 I-8.243 J-1.617 E.00262
G1 X156.694 Y121.118 F30000
; LINE_WIDTH: 0.195635
G1 F7713
G1 X156.593 Y121.266 E.00224
; LINE_WIDTH: 0.179225
G1 X156.524 Y121.357 E.00126
; LINE_WIDTH: 0.129164
G1 X156.392 Y121.523 E.00149
; WIPE_START
G1 F24000
G1 X156.524 Y121.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.064 J-.59 P1  F30000
G1 X138.469 Y153.916 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7713
G2 X139.993 Y153.345 I-4.965 J-15.556 E.05403
G1 X136.794 Y150.146 E.15007
G3 X135.226 Y150.583 I-5.168 J-15.489 E.05402
G1 X124.774 Y150.583 F30000
G1 F7713
G3 X123.206 Y150.146 I3.601 J-15.927 E.05402
G1 X120.007 Y153.345 E.15007
G2 X121.531 Y153.916 I6.489 J-14.985 E.05403
; WIPE_START
G1 F24000
G1 X120.007 Y153.345 E-.61864
G1 X120.27 Y153.082 E-.14136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.076 J-.568 P1  F30000
G1 X103.547 Y121.427 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F7713
G1 X103.487 Y121.348 E.00044
; LINE_WIDTH: 0.111407
G1 X103.429 Y121.263 E.00058
; LINE_WIDTH: 0.148186
G3 X103.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161464
G1 X103.346 Y121.046 E.00103
; LINE_WIDTH: 0.129192
G1 X103.328 Y120.942 E.00075
G1 X103.399 Y119.155 F30000
; LINE_WIDTH: 0.119483
G1 F7713
G2 X103.329 Y119.569 I8.25 J1.618 E.00262
G1 X103.306 Y119.391 F30000
; LINE_WIDTH: 0.181639
G1 F7713
G1 X103.403 Y119.248 E.00195
; LINE_WIDTH: 0.147268
G1 X103.476 Y119.152 E.00103
; LINE_WIDTH: 0.111407
G1 X103.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973922
G1 X103.608 Y118.985 E.00044
G1 X107.392 Y108.523 F30000
; LINE_WIDTH: 0.129162
G1 F7713
G1 X107.524 Y108.357 E.00149
; LINE_WIDTH: 0.17922
G1 X107.593 Y108.266 E.00126
; LINE_WIDTH: 0.195628
G1 X107.694 Y108.118 E.00224
G1 X107.671 Y107.939 F30000
; LINE_WIDTH: 0.119475
G1 F7713
G3 X107.601 Y108.354 I-8.324 J-1.205 E.00262
G1 X107.672 Y106.567 F30000
; LINE_WIDTH: 0.0969204
G1 F7713
G1 X107.654 Y106.462 E.00047
; LINE_WIDTH: 0.136068
G1 X107.629 Y106.331 E.00101
; LINE_WIDTH: 0.173114
G1 X107.571 Y106.246 E.0011
; LINE_WIDTH: 0.126785
G1 X107.453 Y106.081 E.00138
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.571 Y106.246 E-.76
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
G3 Z8 I-.396 J1.151 P1  F30000
G1 X153.535 Y122.063 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9786
G1 X153.221 Y121.858 E.01244
G3 X154.245 Y118.217 I1.278 J-1.605 E.15953
G1 X154.449 Y118.202 E.00679
G3 X153.588 Y122.091 I.051 J2.051 E.24683
G1 X153.738 Y121.729 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9786
G1 X153.466 Y121.551 E.00999
G3 X154.294 Y118.607 I1.034 J-1.298 E.11951
G1 X154.459 Y118.595 E.00509
G3 X153.792 Y121.754 I.041 J1.659 E.1839
M204 S10000
; WIPE_START
G1 F24000
G1 X153.466 Y121.551 E-.1461
G1 X153.228 Y121.321 E-.12557
G1 X153.042 Y121.048 E-.12563
G1 X152.914 Y120.744 E-.12563
G1 X152.848 Y120.421 E-.12526
G1 X152.842 Y120.171 E-.09496
G1 X152.848 Y120.127 E-.01684
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.201 J.198 P1  F30000
G1 X155.28 Y105.359 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9786
G1 X155.614 Y105.53 E.01245
G3 X154.245 Y105.217 I-1.114 J1.723 E.38006
G1 X154.449 Y105.202 E.00679
G3 X155.225 Y105.334 I.051 J2.051 E.02629
G1 X155.107 Y105.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9786
G3 X154.294 Y105.607 I-.607 J1.544 E.2949
G1 X154.459 Y105.595 E.00509
G3 X155.05 Y105.688 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X155.401 Y105.86 E-.14826
G1 X155.659 Y106.066 E-.12563
G1 X155.872 Y106.319 E-.12563
G1 X156.03 Y106.609 E-.12564
G1 X156.127 Y106.925 E-.12562
G1 X156.159 Y107.211 E-.10921
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.04 J-1.216 P1  F30000
G1 X104.446 Y105.496 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9786
G1 X104.474 Y105.477 E.00111
G3 X105.245 Y105.217 I1.026 J1.776 E.02717
G1 X105.449 Y105.202 E.00679
G3 X104.142 Y105.715 I.051 J2.051 E.38006
G1 X104.398 Y105.531 E.01046
G1 X104.681 Y105.812 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9786
G1 X104.971 Y105.68 E.00979
G3 X105.294 Y105.607 I.529 J1.573 E.01018
G1 X105.459 Y105.595 E.00509
G3 X104.629 Y105.841 I.041 J1.659 E.29343
M204 S10000
; WIPE_START
G1 F24000
G1 X104.971 Y105.68 E-.14376
G1 X105.294 Y105.607 E-.12564
G1 X105.459 Y105.595 E-.06289
G1 X105.788 Y105.619 E-.12564
G1 X106.107 Y105.709 E-.12563
G1 X106.401 Y105.86 E-.12564
G1 X106.505 Y105.943 E-.0508
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.216 J.037 P1  F30000
G1 X106.98 Y121.673 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9786
G1 X106.697 Y121.919 E.01244
G3 X105.245 Y118.217 I-1.197 J-1.666 E.24771
G1 X105.449 Y118.202 E.00679
G3 X107.021 Y121.629 I.051 J2.051 E.15864
G1 X106.716 Y121.384 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9786
G1 X106.468 Y121.601 E.01013
G3 X105.294 Y118.607 I-.968 J-1.348 E.18558
G1 X105.459 Y118.595 E.00509
G3 X106.754 Y121.339 I.041 J1.659 E.11773
M204 S10000
; WIPE_START
G1 F24000
G1 X106.468 Y121.601 E-.1474
G1 X106.183 Y121.768 E-.12557
G1 X105.869 Y121.873 E-.12564
G1 X105.541 Y121.914 E-.12563
G1 X105.212 Y121.889 E-.12564
G1 X105.05 Y121.852 E-.06289
G1 X104.935 Y121.807 E-.04724
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.213 J-.104 P1  F30000
G1 X103.102 Y100.356 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9786
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30237
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J-.001 E2.80303
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9786
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.63401
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.217 J.033 P1  F30000
G1 X104.74 Y101.112 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9786
G1 X103.857 Y101.112 E.02928
G1 X103.857 Y101.857 E.02474
G1 X106.732 Y104.732 E.13486
G1 X107.077 Y104.867 E.01229
G1 X107.143 Y104.802 E.00308
G1 X107.143 Y103.173 E.05401
G1 X107.55 Y105.43 F30000
G1 F9786
G1 X107.55 Y100.705 E.15676
G1 X103.45 Y100.705 E.13598
G1 X103.45 Y105.27 E.15143
G1 X105.201 Y104.87 E.05957
G3 X106.577 Y105.109 I.219 J2.826 E.04681
G1 X107.55 Y105.49 E.03465
G1 X107.453 Y106.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12678
G1 F9786
G1 X107.571 Y106.246 E.00138
; LINE_WIDTH: 0.173107
G1 X107.629 Y106.331 E.0011
; LINE_WIDTH: 0.136064
G1 X107.654 Y106.462 E.00101
; LINE_WIDTH: 0.09692
G1 X107.672 Y106.567 E.00047
G1 X107.601 Y108.354 F30000
; LINE_WIDTH: 0.119473
G1 F9786
G2 X107.671 Y107.939 I-8.151 J-1.604 E.00262
G1 X107.694 Y108.118 F30000
; LINE_WIDTH: 0.195624
G1 F9786
G1 X107.593 Y108.266 E.00224
; LINE_WIDTH: 0.179211
G1 X107.524 Y108.357 E.00126
; LINE_WIDTH: 0.129158
G1 X107.392 Y108.523 E.00149
; WIPE_START
G1 F24000
G1 X107.524 Y108.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.63 J-1.041 P1  F30000
G1 X103.608 Y105.985 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.0973915
G1 F9786
G1 X103.544 Y106.061 E.00044
; LINE_WIDTH: 0.11141
G1 X103.476 Y106.152 E.00063
; LINE_WIDTH: 0.147275
G1 X103.403 Y106.248 E.00103
; LINE_WIDTH: 0.181648
G1 X103.306 Y106.391 E.00195
G1 X103.329 Y106.569 F30000
; LINE_WIDTH: 0.11947
G1 F9786
G3 X103.399 Y106.155 I8.244 J1.192 E.00262
G1 X103.328 Y107.942 F30000
; LINE_WIDTH: 0.129191
G1 F9786
G1 X103.346 Y108.046 E.00075
; LINE_WIDTH: 0.161462
G1 X103.365 Y108.151 E.00103
; LINE_WIDTH: 0.148177
G2 X103.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111401
G1 X103.487 Y108.348 E.00058
; LINE_WIDTH: 0.097391
G1 X103.547 Y108.427 E.00044
G1 X103.857 Y111.099 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9786
G1 X103.857 Y109.615 E.04921
G1 X103.992 Y109.668 E.00481
G1 X107.143 Y112.819 E.14778
G1 X107.143 Y112.478 E.01131
G1 X103.857 Y115.763 E.15411
G1 X103.857 Y117.209 E.04799
G1 X104.305 Y117.657 E.021
G3 X105.908 Y117.485 I1.197 J3.599 E.0539
G1 X107.55 Y118.43 F30000
G1 F9786
G1 X107.55 Y109.017 E.31225
G1 X106.426 Y109.459 E.04004
G3 X104.423 Y109.4 I-.938 J-2.182 E.06865
G1 X103.45 Y109.018 E.03465
G1 X103.45 Y118.27 E.30689
G1 X104.755 Y117.972 E.04438
G3 X106.208 Y117.964 I.741 J2.475 E.04887
G1 X107.55 Y118.49 E.04781
G1 X107.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126783
G1 F9786
G1 X107.571 Y119.246 E.00138
; LINE_WIDTH: 0.173111
G1 X107.629 Y119.331 E.0011
; LINE_WIDTH: 0.136067
G1 X107.654 Y119.462 E.00101
; LINE_WIDTH: 0.096921
G1 X107.672 Y119.567 E.00047
G1 X107.601 Y121.354 F30000
; LINE_WIDTH: 0.119468
G1 F9786
G2 X107.671 Y120.939 I-8.246 J-1.618 E.00262
G1 X107.694 Y121.118 F30000
; LINE_WIDTH: 0.195637
G1 F9786
G1 X107.593 Y121.266 E.00224
; LINE_WIDTH: 0.179235
G1 X107.524 Y121.357 E.00126
; LINE_WIDTH: 0.129169
G1 X107.392 Y121.523 E.00149
; WIPE_START
G1 F24000
G1 X107.524 Y121.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.63 J-1.041 P1  F30000
G1 X103.608 Y118.985 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.0973916
G1 F9786
G1 X103.544 Y119.061 E.00044
; LINE_WIDTH: 0.111414
G1 X103.476 Y119.152 E.00063
; LINE_WIDTH: 0.147281
G1 X103.403 Y119.248 E.00103
; LINE_WIDTH: 0.181656
G1 X103.306 Y119.391 E.00195
G1 X103.329 Y119.569 F30000
; LINE_WIDTH: 0.119483
G1 F9786
G3 X103.399 Y119.155 I8.319 J1.204 E.00262
G1 X103.328 Y120.942 F30000
; LINE_WIDTH: 0.129192
G1 F9786
G1 X103.346 Y121.046 E.00075
; LINE_WIDTH: 0.161462
G1 X103.365 Y121.151 E.00103
; LINE_WIDTH: 0.148183
G2 X103.429 Y121.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111407
G1 X103.487 Y121.348 E.00058
; LINE_WIDTH: 0.0973915
G1 X103.547 Y121.427 E.00044
G1 X104.367 Y122.378 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9786
G1 X103.45 Y122.018 E.03266
G1 X103.45 Y128.742 E.22305
G2 X156.516 Y130.078 I26.55 J-.008 E2.72198
G2 X156.55 Y122.239 I-157.089 J-4.587 E.26006
G1 X155.245 Y122.537 E.04438
G3 X153.809 Y122.551 I-.749 J-2.925 E.04813
G1 X152.45 Y122.018 E.0484
G1 X152.45 Y128.766 E.22384
G3 X118.951 Y148.293 I-22.453 J-.021 E1.55235
G1 X118.951 Y148.293 E0
G3 X107.718 Y131.443 I11.227 J-19.653 E.69645
G1 X107.718 Y131.443 E0
G3 X107.577 Y129.873 I15.657 J-2.193 E.05231
G3 X107.55 Y122.239 I153.043 J-4.371 E.25328
G1 X105.799 Y122.638 E.05957
G3 X104.809 Y122.551 I-.231 J-3.041 E.03312
G1 X104.423 Y122.4 E.01375
G1 X106.042 Y123.001 F30000
G1 F9786
G3 X104.449 Y122.847 I-.539 J-2.76 E.05384
G1 X103.857 Y123.439 E.02774
G1 X103.857 Y124.885 E.04799
G1 X107.143 Y128.17 E.15411
G1 X107.143 Y127.83 E.01131
G1 X103.962 Y131.01 E.14922
G2 X104.193 Y132.897 I30.348 J-2.767 E.06307
G1 X108.943 Y137.647 E.22284
G1 X109.329 Y138.503 E.03113
G2 X110.186 Y140.138 I26.193 J-12.688 E.06124
G1 X107.789 Y142.535 E.11245
G3 X105.313 Y137.335 I23.352 J-14.309 E.1914
G1 X107.938 Y134.71 E.12312
G3 X107.567 Y133.125 I26.971 J-7.137 E.054
G1 X112.386 Y143.316 F30000
G1 F9786
G2 X113.468 Y144.532 I21.281 J-17.869 E.054
G1 X111.147 Y146.853 E.10892
M73 P86 R2
G2 X115.244 Y150.324 I19.728 J-19.138 E.17842
G1 X115.308 Y150.368 E.00257
G1 X117.674 Y148.002 E.11099
G2 X121.094 Y149.798 I12.649 J-19.927 E.12829
G1 X125.855 Y154.559 E.22333
G1 X126.389 Y154.639 E.01791
G1 X129.423 Y151.605 E.14235
G2 X130.577 Y151.605 I.573 J-480.743 E.03827
G1 X133.611 Y154.639 E.14235
G1 X134.145 Y154.559 E.01791
G1 X138.906 Y149.798 E.22332
G2 X141.968 Y148.22 I-8.562 J-20.379 E.11438
G1 X142.326 Y148.002 E.01391
G1 X144.692 Y150.368 E.11099
G2 X148.853 Y146.853 I-14.445 J-21.327 E.18103
G1 X146.532 Y144.532 E.10892
G2 X147.614 Y143.316 I-20.203 J-19.089 E.054
G1 X152.433 Y133.125 F30000
G1 F9786
G3 X152.062 Y134.71 I-27.338 J-5.551 E.054
G1 X154.687 Y137.335 E.12312
G3 X154.435 Y138.029 I-7.077 J-2.177 E.02449
G1 X154.435 Y138.029 E0
G3 X152.211 Y142.535 I-32.584 J-13.281 E.16684
G1 X149.814 Y140.138 E.11245
G2 X151.057 Y137.647 I-21.231 J-12.152 E.09237
G1 X155.807 Y132.897 E.22284
G2 X156.038 Y131.01 I-33.65 J-5.087 E.06307
G1 X152.857 Y127.83 E.14922
G1 X152.857 Y128.17 E.01131
G1 X156.143 Y124.885 E.15411
G1 X156.143 Y123.439 E.04799
G1 X155.581 Y122.877 E.02633
G1 X155.147 Y122.976 E.01476
G3 X153.977 Y123.003 I-.675 J-3.916 E.03899
G1 X152.547 Y121.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973911
G1 F9786
G1 X152.487 Y121.348 E.00044
; LINE_WIDTH: 0.111402
G1 X152.429 Y121.263 E.00058
; LINE_WIDTH: 0.148177
G3 X152.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X152.346 Y121.046 E.00103
; LINE_WIDTH: 0.12919
G1 X152.328 Y120.942 E.00075
G1 X152.399 Y119.155 F30000
; LINE_WIDTH: 0.119478
G1 F9786
G2 X152.329 Y119.569 I8.238 J1.617 E.00262
G1 X152.306 Y119.391 F30000
; LINE_WIDTH: 0.181654
G1 F9786
G1 X152.403 Y119.248 E.00195
; LINE_WIDTH: 0.14728
G1 X152.476 Y119.152 E.00103
; LINE_WIDTH: 0.111413
G1 X152.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973918
G1 X152.608 Y118.985 E.00044
G1 X154.063 Y117.484 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9786
G3 X155.353 Y117.583 I.496 J1.986 E.04366
G1 X155.651 Y117.7 E.01064
G1 X156.143 Y117.209 E.02304
G1 X156.143 Y115.763 E.04799
G1 X152.857 Y112.478 E.15411
G1 X152.857 Y112.819 E.01131
G1 X156.008 Y109.668 E.14781
G1 X156.143 Y109.615 E.00479
G1 X156.143 Y111.099 E.04922
G1 X156.392 Y108.523 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129158
G1 F9786
G1 X156.524 Y108.357 E.00149
; LINE_WIDTH: 0.179213
G1 X156.593 Y108.266 E.00126
; LINE_WIDTH: 0.195628
G1 X156.694 Y108.118 E.00224
G1 X156.671 Y107.939 F30000
; LINE_WIDTH: 0.119477
G1 F9786
G3 X156.601 Y108.354 I-8.231 J-1.19 E.00262
G1 X156.672 Y106.567 F30000
; LINE_WIDTH: 0.09692
G1 F9786
G1 X156.654 Y106.462 E.00047
; LINE_WIDTH: 0.136065
G1 X156.629 Y106.331 E.00101
; LINE_WIDTH: 0.173112
G1 X156.571 Y106.246 E.0011
; LINE_WIDTH: 0.126783
G1 X156.453 Y106.081 E.00138
G1 X156.55 Y105.49 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9786
G1 X155.577 Y105.109 E.03465
G2 X154.201 Y104.87 I-1.157 J2.587 E.04681
G1 X152.45 Y105.27 E.05957
G1 X152.45 Y100.705 E.15143
G1 X156.55 Y100.705 E.13598
G1 X156.55 Y105.43 E.15676
G1 X156.143 Y101.857 F30000
G1 F9786
G1 X153.354 Y104.646 E.13081
G1 X152.608 Y105.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F9786
G1 X152.544 Y106.061 E.00044
; LINE_WIDTH: 0.111408
G1 X152.476 Y106.152 E.00063
; LINE_WIDTH: 0.147273
G1 X152.403 Y106.248 E.00103
; LINE_WIDTH: 0.181646
G1 X152.306 Y106.391 E.00195
G1 X152.329 Y106.569 F30000
; LINE_WIDTH: 0.119468
G1 F9786
G3 X152.399 Y106.155 I8.33 J1.205 E.00262
G1 X152.328 Y107.942 F30000
; LINE_WIDTH: 0.12919
G1 F9786
G1 X152.346 Y108.046 E.00075
; LINE_WIDTH: 0.161458
G1 X152.365 Y108.151 E.00103
; LINE_WIDTH: 0.148172
G2 X152.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111398
G1 X152.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973906
G1 X152.547 Y108.427 E.00044
G1 X156.55 Y118.43 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9786
G1 X156.55 Y109.017 E.31225
G1 X155.426 Y109.459 E.04004
G3 X153.423 Y109.4 I-.938 J-2.182 E.06865
G1 X152.45 Y109.018 E.03465
G1 X152.45 Y118.27 E.30689
G1 X153.755 Y117.972 E.04438
G3 X155.204 Y117.962 I.742 J2.48 E.04874
G1 X156.55 Y118.49 E.04795
G1 X156.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126785
G1 F9786
G1 X156.571 Y119.246 E.00138
; LINE_WIDTH: 0.173116
G1 X156.629 Y119.331 E.0011
; LINE_WIDTH: 0.136069
G1 X156.654 Y119.462 E.00101
; LINE_WIDTH: 0.096921
G1 X156.672 Y119.567 E.00047
G1 X156.601 Y121.354 F30000
; LINE_WIDTH: 0.119472
G1 F9786
G2 X156.671 Y120.939 I-8.257 J-1.619 E.00262
G1 X156.694 Y121.118 F30000
; LINE_WIDTH: 0.195638
G1 F9786
G1 X156.593 Y121.266 E.00224
; LINE_WIDTH: 0.179237
G1 X156.524 Y121.357 E.00126
; LINE_WIDTH: 0.129169
G1 X156.392 Y121.523 E.00149
; WIPE_START
G1 F24000
G1 X156.524 Y121.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.057 J-.603 P1  F30000
G1 X138.152 Y153.589 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9786
G2 X139.682 Y153.034 I-13.214 J-38.831 E.054
G1 X137.119 Y150.471 E.12022
G1 X136.804 Y150.569 E.01094
G3 X135.555 Y150.92 I-4.143 J-12.341 E.04308
G1 X124.445 Y150.92 F30000
G1 F9786
G3 X123.417 Y150.637 I2.32 J-10.441 E.03541
G1 X122.881 Y150.471 E.01861
G1 X120.318 Y153.034 E.12022
G2 X121.848 Y153.589 I14.746 J-38.282 E.054
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.318 Y153.034 E-.61861
G1 X120.581 Y152.771 E-.14139
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
G3 Z8.2 I.83 J.89 P1  F30000
G1 X153.535 Y122.063 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9765
G1 X153.221 Y121.858 E.01244
G3 X154.245 Y118.217 I1.278 J-1.605 E.15952
G1 X154.449 Y118.202 E.00679
G3 X153.588 Y122.091 I.051 J2.051 E.24683
G1 X153.742 Y121.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9765
G1 X153.466 Y121.551 E.01013
G3 X154.294 Y118.607 I1.034 J-1.298 E.11951
G1 X154.459 Y118.595 E.00509
G3 X153.795 Y121.755 I.041 J1.659 E.1838
M204 S10000
; WIPE_START
G1 F24000
G1 X153.466 Y121.551 E-.14737
G1 X153.228 Y121.321 E-.12558
G1 X153.042 Y121.048 E-.12563
G1 X152.914 Y120.744 E-.12563
G1 X152.848 Y120.421 E-.12519
G1 X152.842 Y120.171 E-.09497
G1 X152.848 Y120.13 E-.01563
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.202 J.192 P1  F30000
G1 X155.218 Y105.334 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9765
G1 X155.25 Y105.343 E.00111
G3 X154.245 Y105.217 I-.75 J1.91 E.39364
G1 X154.449 Y105.202 E.00679
G3 X154.856 Y105.233 I.051 J2.051 E.01358
G1 X155.16 Y105.318 E.01046
G1 X155.107 Y105.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9765
G3 X154.294 Y105.607 I-.607 J1.544 E.2949
G1 X154.459 Y105.595 E.00509
G3 X155.05 Y105.688 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X155.401 Y105.86 E-.14825
G1 X155.659 Y106.066 E-.12564
G1 X155.872 Y106.319 E-.12563
G1 X156.03 Y106.609 E-.12563
G1 X156.127 Y106.925 E-.12563
G1 X156.156 Y107.211 E-.10921
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.041 J-1.216 P1  F30000
G1 X104.504 Y105.463 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9765
G1 X104.846 Y105.308 E.01245
G3 X105.245 Y105.217 I.654 J1.945 E.01358
G1 X105.449 Y105.202 E.00679
G3 X104.451 Y105.49 I.051 J2.051 E.39276
G1 X104.678 Y105.813 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9765
G1 X104.971 Y105.68 E.0099
G3 X105.294 Y105.607 I.529 J1.573 E.01018
G1 X105.459 Y105.595 E.00509
G3 X104.626 Y105.843 I.041 J1.659 E.29332
M204 S10000
; WIPE_START
G1 F24000
G1 X104.971 Y105.68 E-.14502
G1 X105.294 Y105.607 E-.12564
G1 X105.459 Y105.595 E-.06289
G1 X105.788 Y105.619 E-.12564
G1 X106.107 Y105.709 E-.12563
G1 X106.401 Y105.86 E-.12563
G1 X106.503 Y105.941 E-.04955
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.216 J.046 P1  F30000
G1 X107.091 Y121.546 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9765
G1 X107.071 Y121.572 E.00111
G3 X105.245 Y118.217 I-1.571 J-1.319 E.26467
G1 X105.449 Y118.202 E.00679
G3 X107.301 Y121.235 I.051 J2.051 E.14257
G1 X107.125 Y121.496 E.01045
G1 X106.742 Y121.351 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9765
G1 X106.534 Y121.551 E.00886
G3 X105.294 Y118.607 I-1.034 J-1.298 E.18812
G1 X105.459 Y118.595 E.00509
G3 X106.782 Y121.306 I.041 J1.659 E.11641
M204 S10000
; WIPE_START
G1 F24000
G1 X106.534 Y121.551 E-.13235
G1 X106.257 Y121.732 E-.12556
G1 X105.95 Y121.852 E-.12564
G1 X105.704 Y121.902 E-.09528
G1 X105.376 Y121.91 E-.12463
G1 X105.05 Y121.852 E-.12564
G1 X104.975 Y121.823 E-.0309
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.212 J-.106 P1  F30000
G1 X103.102 Y100.356 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9765
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30237
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J-.001 E2.80303
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9765
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.63401
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.217 J.033 P1  F30000
G1 X104.74 Y101.112 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9765
G1 X103.857 Y101.112 E.02928
G1 X103.857 Y101.857 E.02474
G1 X106.732 Y104.732 E.13486
G1 X107.077 Y104.867 E.01229
G1 X107.143 Y104.802 E.00308
G1 X107.143 Y103.173 E.05401
G1 X107.55 Y105.43 F30000
G1 F9765
G1 X107.55 Y100.705 E.15676
G1 X103.45 Y100.705 E.13598
G1 X103.45 Y105.27 E.15143
G1 X105.043 Y104.906 E.0542
G3 X106.577 Y105.109 I.483 J2.254 E.05234
G1 X107.55 Y105.49 E.03465
G1 X107.453 Y106.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126782
G1 F9765
G1 X107.571 Y106.246 E.00138
; LINE_WIDTH: 0.173108
G1 X107.629 Y106.331 E.0011
; LINE_WIDTH: 0.136065
G1 X107.654 Y106.462 E.00101
; LINE_WIDTH: 0.0969206
G1 X107.672 Y106.567 E.00047
G1 X107.672 Y107.942 F30000
; LINE_WIDTH: 0.0969204
G1 F9765
G1 X107.654 Y108.046 E.00047
; LINE_WIDTH: 0.136063
G1 X107.629 Y108.177 E.00101
; LINE_WIDTH: 0.173104
G1 X107.571 Y108.263 E.0011
; LINE_WIDTH: 0.126779
G1 X107.453 Y108.427 E.00138
; WIPE_START
G1 F24000
G1 X107.571 Y108.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.606 J-1.055 P1  F30000
G1 X103.608 Y105.985 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.0973916
G1 F9765
G1 X103.544 Y106.061 E.00044
; LINE_WIDTH: 0.111414
G1 X103.476 Y106.152 E.00063
; LINE_WIDTH: 0.147277
G1 X103.403 Y106.248 E.00103
; LINE_WIDTH: 0.181648
G1 X103.306 Y106.391 E.00195
G1 X103.329 Y106.569 F30000
; LINE_WIDTH: 0.119485
G1 F9765
G3 X103.399 Y106.155 I8.333 J1.206 E.00262
G1 X103.328 Y107.941 F30000
; LINE_WIDTH: 0.129194
G1 F9765
G1 X103.346 Y108.046 E.00075
; LINE_WIDTH: 0.161468
G1 X103.365 Y108.151 E.00103
; LINE_WIDTH: 0.148169
G2 X103.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111397
G1 X103.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973903
G1 X103.547 Y108.427 E.00044
G1 X103.857 Y111.099 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9765
G1 X103.857 Y109.615 E.04921
G1 X103.992 Y109.668 E.00481
G1 X107.143 Y112.819 E.14778
G1 X107.143 Y112.478 E.01131
G1 X103.857 Y115.763 E.15411
G1 X103.857 Y117.209 E.04799
G1 X104.305 Y117.657 E.021
G3 X105.908 Y117.485 I1.163 J3.286 E.05398
G1 X107.55 Y118.43 F30000
G1 F9765
G1 X107.55 Y109.017 E.31225
G1 X106.565 Y109.405 E.03509
G3 X104.423 Y109.4 I-1.066 J-2.211 E.07355
G1 X103.45 Y109.018 E.03465
G1 X103.45 Y118.27 E.30689
M73 P87 R2
G1 X104.755 Y117.972 E.04438
G3 X106.096 Y117.932 I.747 J2.515 E.04503
G1 X107.55 Y118.49 E.05164
G1 X107.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126784
G1 F9765
G1 X107.571 Y119.246 E.00138
; LINE_WIDTH: 0.173113
G1 X107.629 Y119.331 E.0011
; LINE_WIDTH: 0.136069
G1 X107.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969218
G1 X107.672 Y119.567 E.00047
G1 X107.672 Y120.942 F30000
; LINE_WIDTH: 0.0969204
G1 F9765
G1 X107.654 Y121.046 E.00047
; LINE_WIDTH: 0.136068
G1 X107.629 Y121.177 E.00101
; LINE_WIDTH: 0.173115
G1 X107.571 Y121.263 E.0011
; LINE_WIDTH: 0.126785
G1 X107.453 Y121.427 E.00138
; WIPE_START
G1 F24000
G1 X107.571 Y121.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.606 J-1.055 P1  F30000
G1 X103.608 Y118.985 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.0973912
G1 F9765
G1 X103.544 Y119.061 E.00044
; LINE_WIDTH: 0.111407
G1 X103.476 Y119.152 E.00063
; LINE_WIDTH: 0.147269
G1 X103.403 Y119.248 E.00103
; LINE_WIDTH: 0.18164
G1 X103.306 Y119.391 E.00195
G1 X103.329 Y119.569 F30000
; LINE_WIDTH: 0.119478
G1 F9765
G3 X103.399 Y119.155 I8.306 J1.202 E.00262
G1 X103.328 Y120.942 F30000
; LINE_WIDTH: 0.129192
G1 F9765
G1 X103.346 Y121.046 E.00075
; LINE_WIDTH: 0.161462
G1 X103.365 Y121.151 E.00103
; LINE_WIDTH: 0.14819
G2 X103.429 Y121.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111412
G1 X103.487 Y121.348 E.00058
; LINE_WIDTH: 0.0973921
G1 X103.547 Y121.427 E.00044
G1 X104.367 Y122.378 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9765
G1 X103.45 Y122.018 E.03266
G1 X103.45 Y128.742 E.22305
G2 X156.516 Y130.078 I26.55 J.004 E2.72276
G2 X156.55 Y122.239 I-157.093 J-4.587 E.26006
G1 X155.207 Y122.545 E.04569
G3 X153.423 Y122.4 I-.717 J-2.224 E.06093
G1 X152.45 Y122.018 E.03465
G1 X152.45 Y128.766 E.22384
G3 X118.951 Y148.293 I-22.453 J-.021 E1.55235
G1 X118.951 Y148.293 E0
G3 X107.577 Y129.873 I11.079 J-19.562 E.74922
G3 X107.55 Y122.239 I153.043 J-4.371 E.25328
G1 X106.207 Y122.545 E.04569
G3 X104.423 Y122.4 I-.717 J-2.224 E.06093
G1 X106.042 Y123.003 F30000
G1 F9765
G3 X105.833 Y123.045 I-.787 J-3.407 E.00707
G3 X104.449 Y122.847 I-.32 J-2.71 E.04692
G1 X103.857 Y123.439 E.02774
G1 X103.857 Y124.885 E.04799
G1 X107.143 Y128.17 E.15411
G1 X107.143 Y127.83 E.01131
G1 X103.962 Y131.01 E.14922
G2 X104.193 Y132.897 I30.347 J-2.767 E.06307
G1 X108.943 Y137.647 E.22284
G1 X109.369 Y138.59 E.0343
G2 X110.186 Y140.138 I25.596 J-12.532 E.05807
G1 X107.789 Y142.535 E.11245
G3 X105.313 Y137.335 I22.515 J-13.911 E.19143
G1 X107.938 Y134.71 E.12312
G3 X107.567 Y133.125 I26.971 J-7.137 E.054
G1 X112.386 Y143.316 F30000
G1 F9765
G2 X113.468 Y144.532 I21.281 J-17.869 E.054
G1 X111.147 Y146.853 E.10892
G2 X115.002 Y150.159 I19.078 J-18.35 E.16872
G1 X115.308 Y150.368 E.0123
G1 X117.674 Y148.002 E.11099
G2 X121.094 Y149.798 I12.649 J-19.927 E.12829
G1 X125.855 Y154.559 E.22333
G1 X126.389 Y154.639 E.01791
G1 X129.423 Y151.605 E.14235
G2 X130.577 Y151.605 I.573 J-480.743 E.03827
G1 X133.611 Y154.639 E.14235
G1 X134.145 Y154.559 E.01791
G1 X138.906 Y149.798 E.22332
G2 X141.968 Y148.22 I-8.562 J-20.379 E.11438
G1 X142.326 Y148.002 E.01391
G1 X144.692 Y150.368 E.11099
G2 X148.853 Y146.853 I-14.737 J-21.673 E.18101
G1 X146.532 Y144.532 E.10892
G2 X147.614 Y143.316 I-20.204 J-19.09 E.054
G1 X152.433 Y133.125 F30000
G1 F9765
G3 X152.062 Y134.71 I-27.338 J-5.551 E.054
G1 X154.687 Y137.335 E.12312
G3 X152.211 Y142.535 I-25.219 J-8.819 E.19142
G1 X149.814 Y140.138 E.11245
G2 X151.057 Y137.647 I-21.231 J-12.152 E.09237
G1 X155.807 Y132.897 E.22284
G2 X156.038 Y131.01 I-40.717 J-5.954 E.06307
G1 X152.857 Y127.83 E.14922
G1 X152.857 Y128.17 E.01131
G1 X156.143 Y124.885 E.15411
G1 X156.143 Y123.439 E.04799
G1 X155.581 Y122.877 E.02633
G3 X154.945 Y123.023 I-2.859 J-11.058 E.02165
G3 X153.978 Y123.003 I-.423 J-3.066 E.03223
G1 X152.547 Y121.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973918
G1 F9765
G1 X152.487 Y121.348 E.00044
; LINE_WIDTH: 0.11141
G1 X152.429 Y121.263 E.00058
; LINE_WIDTH: 0.148187
G3 X152.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X152.346 Y121.046 E.00103
; LINE_WIDTH: 0.12919
G1 X152.328 Y120.942 E.00075
G1 X152.399 Y119.155 F30000
; LINE_WIDTH: 0.119475
G1 F9765
G2 X152.329 Y119.569 I8.324 J1.63 E.00262
G1 X152.306 Y119.391 F30000
; LINE_WIDTH: 0.181639
G1 F9765
G1 X152.403 Y119.248 E.00195
; LINE_WIDTH: 0.147269
G1 X152.476 Y119.152 E.00103
; LINE_WIDTH: 0.111407
G1 X152.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973912
G1 X152.608 Y118.985 E.00044
G1 X154.063 Y117.484 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9765
G3 X155.167 Y117.531 I.418 J3.187 E.03684
G1 X155.167 Y117.531 E0
G3 X155.651 Y117.7 I-.177 J1.281 E.01714
G1 X156.143 Y117.209 E.02304
G1 X156.143 Y115.763 E.04799
G1 X152.857 Y112.478 E.15411
G1 X152.857 Y112.819 E.01131
G1 X156.008 Y109.668 E.14781
G1 X156.143 Y109.615 E.00479
G1 X156.143 Y111.099 E.04922
G1 X156.453 Y108.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126778
G1 F9765
G1 X156.571 Y108.263 E.00138
; LINE_WIDTH: 0.173105
G1 X156.629 Y108.177 E.0011
; LINE_WIDTH: 0.136064
G1 X156.654 Y108.046 E.00101
; LINE_WIDTH: 0.0969204
G1 X156.672 Y107.942 E.00047
G1 X156.672 Y106.567 F30000
; LINE_WIDTH: 0.0969206
G1 F9765
G1 X156.654 Y106.462 E.00047
; LINE_WIDTH: 0.136068
G1 X156.629 Y106.331 E.00101
; LINE_WIDTH: 0.173114
G1 X156.571 Y106.246 E.0011
; LINE_WIDTH: 0.126784
G1 X156.453 Y106.081 E.00138
G1 X156.55 Y105.49 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9765
G1 X155.577 Y105.109 E.03465
G2 X154.037 Y104.908 I-1.051 J2.051 E.05255
G1 X152.45 Y105.27 E.05399
G1 X152.45 Y100.705 E.15143
G1 X156.55 Y100.705 E.13598
G1 X156.55 Y105.43 E.15676
G1 X156.143 Y101.857 F30000
G1 F9765
G1 X153.354 Y104.646 E.13081
G1 X152.608 Y105.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F9765
G1 X152.544 Y106.061 E.00044
; LINE_WIDTH: 0.111411
G1 X152.476 Y106.152 E.00063
; LINE_WIDTH: 0.147275
G1 X152.403 Y106.248 E.00103
; LINE_WIDTH: 0.181646
G1 X152.306 Y106.391 E.00195
G1 X152.329 Y106.569 F30000
; LINE_WIDTH: 0.119481
G1 F9765
G3 X152.399 Y106.155 I8.338 J1.207 E.00262
G1 X152.328 Y107.942 F30000
; LINE_WIDTH: 0.129192
G1 F9765
G1 X152.346 Y108.046 E.00075
; LINE_WIDTH: 0.161464
G1 X152.365 Y108.151 E.00103
; LINE_WIDTH: 0.148172
G2 X152.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111401
G1 X152.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973906
G1 X152.547 Y108.427 E.00044
G1 X156.55 Y118.43 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9765
G1 X156.55 Y109.017 E.31225
G1 X155.565 Y109.405 E.03509
G3 X153.423 Y109.4 I-1.067 J-2.139 E.0737
G1 X152.45 Y109.018 E.03465
G1 X152.45 Y118.27 E.30689
G1 X153.755 Y117.972 E.04438
G3 X155.096 Y117.932 I.747 J2.515 E.04503
G1 X156.55 Y118.49 E.05164
G1 X156.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126787
G1 F9765
G1 X156.571 Y119.246 E.00138
; LINE_WIDTH: 0.173118
G1 X156.629 Y119.331 E.0011
; LINE_WIDTH: 0.13607
G1 X156.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969218
G1 X156.672 Y119.567 E.00047
G1 X156.672 Y120.941 F30000
; LINE_WIDTH: 0.0969204
G1 F9765
G1 X156.654 Y121.046 E.00047
; LINE_WIDTH: 0.13607
G1 X156.629 Y121.177 E.00101
; LINE_WIDTH: 0.173119
G1 X156.571 Y121.263 E.0011
; LINE_WIDTH: 0.126787
G1 X156.453 Y121.427 E.00138
; WIPE_START
G1 F24000
G1 X156.571 Y121.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.057 J-.602 P1  F30000
G1 X138.152 Y153.589 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9765
G2 X139.682 Y153.034 I-13.214 J-38.83 E.054
G1 X137.119 Y150.471 E.12022
G1 X136.804 Y150.569 E.01094
G3 X135.555 Y150.92 I-4.143 J-12.341 E.04308
G1 X124.445 Y150.92 F30000
G1 F9765
G3 X123.417 Y150.637 I2.32 J-10.441 E.03541
G1 X122.881 Y150.471 E.01861
G1 X120.318 Y153.034 E.12022
G2 X121.848 Y153.589 I14.746 J-38.282 E.054
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.318 Y153.034 E-.61861
G1 X120.581 Y152.771 E-.14139
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
G3 Z8.4 I.83 J.89 P1  F30000
G1 X153.535 Y122.063 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9877
G1 X153.221 Y121.858 E.01244
G3 X154.245 Y118.217 I1.278 J-1.605 E.15953
G1 X154.449 Y118.202 E.00679
G3 X153.588 Y122.091 I.051 J2.051 E.24683
G1 X153.746 Y121.733 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9877
G1 X153.743 Y121.73 E.00013
G3 X154.294 Y118.607 I.756 J-1.477 E.12968
G1 X154.459 Y118.595 E.00509
G3 X154.051 Y121.851 I.041 J1.659 E.17541
G1 X153.802 Y121.755 E.00819
M204 S10000
; WIPE_START
G1 F24000
G1 X153.743 Y121.73 E-.02421
G1 X153.465 Y121.552 E-.12557
G1 X153.228 Y121.321 E-.12564
G1 X153.042 Y121.048 E-.12564
G1 X152.914 Y120.744 E-.12563
G1 X152.848 Y120.421 E-.12511
G1 X152.842 Y120.171 E-.095
G1 X152.847 Y120.137 E-.01321
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.202 J.192 P1  F30000
G1 X155.218 Y105.334 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9877
G1 X155.25 Y105.343 E.00111
G3 X154.245 Y105.217 I-.75 J1.91 E.39364
G1 X154.449 Y105.202 E.00679
G3 X154.856 Y105.233 I.051 J2.051 E.01358
G1 X155.16 Y105.318 E.01046
G1 X155.107 Y105.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9877
G3 X154.294 Y105.607 I-.607 J1.544 E.2949
G1 X154.459 Y105.595 E.00509
G3 X155.05 Y105.688 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X155.401 Y105.86 E-.14826
G1 X155.659 Y106.066 E-.12563
G1 X155.872 Y106.319 E-.12563
G1 X156.03 Y106.609 E-.12564
G1 X156.127 Y106.925 E-.12562
G1 X156.158 Y107.211 E-.10921
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.04 J-1.216 P1  F30000
G1 X104.446 Y105.496 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9877
G1 X104.474 Y105.477 E.00111
G3 X105.245 Y105.217 I1.026 J1.776 E.02717
G1 X105.449 Y105.202 E.00679
G3 X104.142 Y105.715 I.051 J2.051 E.38006
G1 X104.398 Y105.531 E.01046
G1 X104.675 Y105.814 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9877
G1 X104.971 Y105.68 E.01
G3 X105.294 Y105.607 I.529 J1.573 E.01018
G1 X105.459 Y105.595 E.00509
G3 X104.623 Y105.845 I.041 J1.659 E.29322
M204 S10000
; WIPE_START
G1 F24000
G1 X104.971 Y105.68 E-.14625
G1 X105.294 Y105.607 E-.12564
G1 X105.459 Y105.595 E-.06289
G1 X105.788 Y105.619 E-.12564
G1 X106.107 Y105.709 E-.12563
G1 X106.401 Y105.86 E-.12564
G1 X106.5 Y105.939 E-.04831
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.216 J.051 P1  F30000
G1 X107.154 Y121.465 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9877
G1 X107.135 Y121.493 E.00111
G3 X105.245 Y118.217 I-1.635 J-1.24 E.26806
G1 X105.449 Y118.202 E.00679
G3 X107.348 Y121.144 I.051 J2.051 E.13917
G1 X107.185 Y121.414 E.01045
G1 X106.766 Y121.318 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9877
G1 X106.597 Y121.498 E.00758
G3 X105.294 Y118.607 I-1.097 J-1.244 E.19066
G1 X105.459 Y118.595 E.00509
G3 X106.822 Y121.256 I.041 J1.659 E.11443
G1 X106.806 Y121.273 E.00073
M204 S10000
; WIPE_START
G1 F24000
G1 X106.597 Y121.498 E-.11651
G1 X106.33 Y121.692 E-.12557
G1 X106.029 Y121.828 E-.12563
G1 X105.706 Y121.902 E-.12563
G1 X105.376 Y121.91 E-.12564
G1 X105.05 Y121.852 E-.12564
G1 X105.013 Y121.838 E-.01539
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.212 J-.108 P1  F30000
G1 X103.102 Y100.356 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9877
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30237
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J.002 E2.80325
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9877
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.003 E2.6342
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.217 J.033 P1  F30000
G1 X104.74 Y101.112 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9877
G1 X103.857 Y101.112 E.02928
G1 X103.857 Y101.857 E.02474
G1 X106.732 Y104.732 E.13486
G1 X107.077 Y104.867 E.01229
G1 X107.143 Y104.802 E.00308
G1 X107.143 Y103.173 E.05401
G1 X107.55 Y105.43 F30000
G1 F9877
G1 X107.55 Y100.705 E.15676
G1 X103.45 Y100.705 E.13598
G1 X103.45 Y105.27 E.15143
G1 X105.201 Y104.87 E.05957
G3 X106.577 Y105.109 I.291 J2.409 E.04699
G1 X107.55 Y105.49 E.03465
G1 X107.453 Y106.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12678
G1 F9877
G1 X107.571 Y106.246 E.00138
; LINE_WIDTH: 0.173107
G1 X107.629 Y106.331 E.0011
; LINE_WIDTH: 0.136065
G1 X107.654 Y106.462 E.00101
; LINE_WIDTH: 0.0969205
G1 X107.672 Y106.567 E.00047
G1 X107.601 Y108.354 F30000
; LINE_WIDTH: 0.119468
G1 F9877
G2 X107.671 Y107.939 I-8.246 J-1.618 E.00262
G1 X107.694 Y108.118 F30000
; LINE_WIDTH: 0.195627
G1 F9877
G1 X107.593 Y108.266 E.00224
; LINE_WIDTH: 0.179222
G1 X107.524 Y108.357 E.00126
; LINE_WIDTH: 0.129163
G1 X107.392 Y108.523 E.00149
; WIPE_START
G1 F24000
G1 X107.524 Y108.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.63 J-1.041 P1  F30000
G1 X103.608 Y105.985 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.0973921
G1 F9877
G1 X103.544 Y106.061 E.00044
; LINE_WIDTH: 0.111414
G1 X103.476 Y106.152 E.00063
; LINE_WIDTH: 0.147278
G1 X103.403 Y106.248 E.00103
; LINE_WIDTH: 0.181651
G1 X103.306 Y106.391 E.00195
G1 X103.329 Y106.569 F30000
; LINE_WIDTH: 0.119481
G1 F9877
G3 X103.399 Y106.155 I8.328 J1.205 E.00262
M73 P88 R2
G1 X103.328 Y107.942 F30000
; LINE_WIDTH: 0.12919
G1 F9877
G1 X103.346 Y108.046 E.00075
; LINE_WIDTH: 0.161458
G1 X103.365 Y108.151 E.00103
; LINE_WIDTH: 0.148169
G2 X103.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111395
G1 X103.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973902
G1 X103.547 Y108.427 E.00044
G1 X103.857 Y111.099 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9877
G1 X103.857 Y109.615 E.04921
G1 X103.992 Y109.668 E.00481
G1 X107.143 Y112.819 E.14778
G1 X107.143 Y112.478 E.01131
G1 X103.857 Y115.763 E.15411
G1 X103.857 Y117.209 E.04799
G1 X104.305 Y117.657 E.021
G3 X105.908 Y117.485 I1.192 J3.558 E.05391
G1 X107.55 Y118.43 F30000
G1 F9877
G1 X107.55 Y109.017 E.31225
G3 X105.777 Y109.639 I-3.837 J-8.101 E.06243
G1 X105.63 Y109.643 E.00488
G3 X104.423 Y109.4 I-.115 J-2.549 E.04125
G1 X103.45 Y109.018 E.03465
G1 X103.45 Y118.27 E.30689
G1 X104.755 Y117.972 E.04438
G3 X106.219 Y117.968 I.739 J2.463 E.04925
G1 X107.55 Y118.49 E.04743
G1 X107.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126785
G1 F9877
G1 X107.571 Y119.246 E.00138
; LINE_WIDTH: 0.173116
G1 X107.629 Y119.331 E.0011
; LINE_WIDTH: 0.136069
G1 X107.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969217
G1 X107.672 Y119.567 E.00047
G1 X107.601 Y121.354 F30000
; LINE_WIDTH: 0.119472
G1 F9877
G2 X107.671 Y120.939 I-8.238 J-1.617 E.00262
G1 X107.694 Y121.118 F30000
; LINE_WIDTH: 0.195631
G1 F9877
G1 X107.593 Y121.266 E.00224
; LINE_WIDTH: 0.179223
G1 X107.524 Y121.357 E.00126
; LINE_WIDTH: 0.129166
G1 X107.392 Y121.523 E.00149
; WIPE_START
G1 F24000
G1 X107.524 Y121.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.63 J-1.041 P1  F30000
G1 X103.608 Y118.985 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.0973918
G1 F9877
G1 X103.544 Y119.061 E.00044
; LINE_WIDTH: 0.111413
G1 X103.476 Y119.152 E.00063
; LINE_WIDTH: 0.147275
G1 X103.403 Y119.248 E.00103
; LINE_WIDTH: 0.181646
G1 X103.306 Y119.391 E.00195
G1 X103.329 Y119.569 F30000
; LINE_WIDTH: 0.119479
G1 F9877
G3 X103.399 Y119.155 I8.333 J1.206 E.00262
G1 X103.328 Y120.942 F30000
; LINE_WIDTH: 0.129189
G1 F9877
G1 X103.346 Y121.046 E.00075
; LINE_WIDTH: 0.161456
G1 X103.365 Y121.151 E.00103
; LINE_WIDTH: 0.14819
G2 X103.429 Y121.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.11141
G1 X103.487 Y121.348 E.00058
; LINE_WIDTH: 0.0973916
G1 X103.547 Y121.427 E.00044
G1 X104.367 Y122.378 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9877
G1 X103.45 Y122.018 E.03266
G1 X103.45 Y128.742 E.22305
G2 X156.514 Y130.114 I26.55 J-.016 E2.72025
G2 X156.55 Y122.239 I-156.386 J-4.652 E.26125
G1 X156.336 Y122.288 E.00728
G1 X156.442 Y122.436 E.00607
G1 X155.695 Y122.974 E.03056
G1 X155.269 Y122.905 E.0143
G1 X155.039 Y122.584 E.01311
G3 X153.423 Y122.4 I-.564 J-2.237 E.05513
G1 X152.45 Y122.018 E.03465
G1 X152.45 Y128.766 E.22384
G3 X107.577 Y129.873 I-22.451 J-.019 E2.30164
G3 X107.55 Y122.239 I153.043 J-4.371 E.25328
G1 X106.245 Y122.537 E.04438
G3 X104.423 Y122.4 I-.748 J-2.248 E.06224
G1 X106.042 Y123.001 F30000
G1 F9877
G3 X104.449 Y122.847 I-.583 J-2.302 E.05415
G1 X103.857 Y123.439 E.02774
G1 X103.857 Y124.885 E.04799
G1 X107.143 Y128.17 E.15411
G1 X107.143 Y127.83 E.01131
G1 X103.962 Y131.01 E.14922
G2 X104.193 Y132.897 I30.347 J-2.767 E.06307
G1 X108.943 Y137.647 E.22284
G1 X109.369 Y138.59 E.0343
G2 X110.186 Y140.138 I25.594 J-12.531 E.05807
G1 X107.789 Y142.535 E.11245
G3 X105.313 Y137.335 I22.514 J-13.91 E.19143
G1 X107.938 Y134.71 E.12312
G3 X107.567 Y133.125 I26.971 J-7.137 E.054
G1 X112.386 Y143.316 F30000
G1 F9877
G2 X113.468 Y144.532 I21.281 J-17.869 E.054
G1 X111.147 Y146.853 E.10892
G2 X115.002 Y150.159 I19.077 J-18.349 E.16872
G1 X115.308 Y150.368 E.0123
G1 X117.674 Y148.002 E.11099
G2 X121.094 Y149.798 I16.696 J-27.631 E.12823
G1 X125.855 Y154.559 E.22333
G1 X126.389 Y154.639 E.01791
G1 X129.423 Y151.605 E.14235
G2 X130.577 Y151.605 I.573 J-480.743 E.03827
G1 X133.611 Y154.639 E.14235
G1 X134.145 Y154.559 E.01791
G1 X138.906 Y149.798 E.22332
G2 X142.326 Y148.002 I-8.949 J-21.19 E.1283
G1 X144.692 Y150.368 E.11099
G2 X145.291 Y149.957 I-3.832 J-6.231 E.02412
G1 X145.291 Y149.957 E0
G2 X148.853 Y146.853 I-21.496 J-28.271 E.15683
G1 X146.532 Y144.532 E.10892
G2 X147.614 Y143.316 I-20.204 J-19.09 E.054
G1 X152.433 Y133.125 F30000
G1 F9877
G3 X152.062 Y134.71 I-27.338 J-5.551 E.054
G1 X154.687 Y137.335 E.12312
G3 X152.211 Y142.535 I-25.134 J-8.779 E.19142
G1 X149.814 Y140.138 E.11245
G2 X151.057 Y137.647 I-21.231 J-12.152 E.09237
G1 X155.807 Y132.897 E.22284
G2 X156.038 Y131.01 I-33.647 J-5.087 E.06307
G1 X152.857 Y127.83 E.14922
G1 X152.857 Y128.17 E.01131
G1 X156.143 Y124.885 E.15411
G1 X156.143 Y123.439 E.04799
G1 X155.977 Y123.273 E.00779
G1 X155.795 Y123.403 E.00741
G1 X155.037 Y123.279 E.02548
G1 X154.866 Y123.041 E.00974
G3 X154.523 Y123.053 I-.201 J-.842 E.01145
G1 X155.583 Y122.5 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.535646
G1 F9877
G1 X155.79 Y122.37 E.00979
G1 X156.392 Y121.523 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129166
G1 F9877
G1 X156.524 Y121.357 E.00149
; LINE_WIDTH: 0.179226
G1 X156.593 Y121.266 E.00126
; LINE_WIDTH: 0.195635
G1 X156.694 Y121.118 E.00224
G1 X156.671 Y120.939 F30000
; LINE_WIDTH: 0.119475
G1 F9877
G3 X156.601 Y121.353 I-8.391 J-1.215 E.00262
G1 X156.672 Y119.567 F30000
; LINE_WIDTH: 0.0969217
G1 F9877
G1 X156.654 Y119.462 E.00047
; LINE_WIDTH: 0.136071
G1 X156.629 Y119.331 E.00101
; LINE_WIDTH: 0.17312
G1 X156.571 Y119.246 E.0011
; LINE_WIDTH: 0.126787
G1 X156.453 Y119.081 E.00138
G1 X156.55 Y118.49 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9877
G1 X155.224 Y117.97 E.04724
G2 X153.755 Y117.972 I-.731 J2.461 E.04943
G1 X152.45 Y118.27 E.04438
G1 X152.45 Y109.018 E.30689
G1 X153.423 Y109.4 E.03465
G2 X154.63 Y109.643 I1.092 J-2.306 E.04125
G1 X154.777 Y109.639 E.00488
G2 X156.55 Y109.017 I-2.064 J-8.723 E.06243
G1 X156.55 Y118.43 E.31225
; WIPE_START
G1 F24000
G1 X156.55 Y116.43 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.95 J-.761 P1  F30000
G1 X152.547 Y121.427 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F9877
G1 X152.487 Y121.348 E.00044
; LINE_WIDTH: 0.111411
G1 X152.429 Y121.263 E.00058
; LINE_WIDTH: 0.14819
G3 X152.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161452
G1 X152.346 Y121.046 E.00103
; LINE_WIDTH: 0.129187
G1 X152.328 Y120.942 E.00075
G1 X152.399 Y119.155 F30000
; LINE_WIDTH: 0.119475
G1 F9877
G2 X152.329 Y119.569 I8.252 J1.619 E.00262
G1 X152.306 Y119.391 F30000
; LINE_WIDTH: 0.181644
G1 F9877
G1 X152.403 Y119.248 E.00195
; LINE_WIDTH: 0.147274
G1 X152.476 Y119.152 E.00103
; LINE_WIDTH: 0.111413
G1 X152.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973918
G1 X152.608 Y118.985 E.00044
G1 X154.063 Y117.484 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9877
G3 X154.42 Y117.457 I.244 J.869 E.01195
G1 X154.42 Y117.457 E0
G3 X155.373 Y117.591 I.065 J3 E.03205
G1 X155.651 Y117.7 E.00994
G1 X156.143 Y117.209 E.02304
G1 X156.143 Y115.763 E.04799
G1 X152.857 Y112.478 E.15411
G1 X152.857 Y112.819 E.01131
G1 X156.008 Y109.668 E.14781
G1 X156.143 Y109.615 E.00479
G1 X156.143 Y111.099 E.04922
G1 X156.392 Y108.523 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F9877
G1 X156.524 Y108.357 E.00149
; LINE_WIDTH: 0.179226
G1 X156.593 Y108.266 E.00126
; LINE_WIDTH: 0.195633
G1 X156.694 Y108.118 E.00224
G1 X156.671 Y107.939 F30000
; LINE_WIDTH: 0.119472
G1 F9877
G3 X156.601 Y108.354 I-8.326 J-1.205 E.00262
G1 X156.672 Y106.567 F30000
; LINE_WIDTH: 0.0969205
G1 F9877
G1 X156.654 Y106.462 E.00047
; LINE_WIDTH: 0.136067
G1 X156.629 Y106.331 E.00101
; LINE_WIDTH: 0.173113
G1 X156.571 Y106.246 E.0011
; LINE_WIDTH: 0.126783
G1 X156.453 Y106.081 E.00138
G1 X156.55 Y105.49 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9877
G1 X155.577 Y105.109 E.03465
G2 X154.717 Y104.865 I-1.033 J2.006 E.02985
G1 X154.717 Y104.865 E0
G2 X154.201 Y104.87 I-.222 J3.492 E.01713
G1 X152.673 Y105.219 E.05199
G1 X152.45 Y105.05 E.00928
G1 X152.45 Y100.705 E.14414
G1 X156.55 Y100.705 E.13598
G1 X156.55 Y105.43 E.15676
G1 X156.143 Y101.857 F30000
G1 F9877
G1 X153.354 Y104.646 E.13081
G1 X152.469 Y105.524 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F9877
G3 X152.667 Y105.616 I-.039 J.342 E.00618
G1 X152.608 Y105.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973921
G1 F9877
G1 X152.544 Y106.061 E.00044
; LINE_WIDTH: 0.111413
G1 X152.476 Y106.152 E.00063
; LINE_WIDTH: 0.147277
G1 X152.403 Y106.248 E.00103
; LINE_WIDTH: 0.181651
G1 X152.306 Y106.391 E.00195
G1 X152.329 Y106.569 F30000
; LINE_WIDTH: 0.119476
G1 F9877
G3 X152.399 Y106.155 I8.337 J1.206 E.00262
G1 X152.328 Y107.942 F30000
; LINE_WIDTH: 0.129188
G1 F9877
G1 X152.346 Y108.046 E.00075
; LINE_WIDTH: 0.161454
G1 X152.365 Y108.151 E.00103
; LINE_WIDTH: 0.148166
G2 X152.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111392
G1 X152.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973912
G1 X152.547 Y108.427 E.00044
; WIPE_START
G1 F24000
G1 X152.487 Y108.348 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.16 J-.368 P1  F30000
G1 X138.152 Y153.589 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9877
G2 X139.682 Y153.034 I-13.214 J-38.83 E.054
G1 X137.119 Y150.471 E.12022
G1 X136.804 Y150.569 E.01094
G3 X135.555 Y150.92 I-4.144 J-12.345 E.04308
G1 X124.445 Y150.92 F30000
G1 F9877
G3 X123.417 Y150.637 I2.32 J-10.441 E.03541
G1 X122.881 Y150.471 E.01861
G1 X120.318 Y153.034 E.12022
G2 X121.848 Y153.589 I14.746 J-38.282 E.054
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.318 Y153.034 E-.61861
G1 X120.581 Y152.771 E-.14139
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
G3 Z8.6 I.83 J.89 P1  F30000
G1 X153.535 Y122.063 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9782
G1 X153.221 Y121.857 E.01244
G3 X154.245 Y118.217 I1.278 J-1.604 E.15952
G1 X154.449 Y118.202 E.00679
G3 X153.588 Y122.091 I.051 J2.051 E.24683
G1 X153.75 Y121.735 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9782
G1 X153.743 Y121.73 E.00025
G3 X154.294 Y118.607 I.756 J-1.477 E.12968
G1 X154.459 Y118.595 E.00509
G3 X154.051 Y121.851 I.041 J1.659 E.17541
G1 X153.806 Y121.756 E.00806
M204 S10000
; WIPE_START
G1 F24000
G1 X153.743 Y121.73 E-.02578
G1 X153.465 Y121.552 E-.12556
G1 X153.228 Y121.321 E-.12563
G1 X153.042 Y121.048 E-.12564
G1 X152.914 Y120.744 E-.12563
G1 X152.848 Y120.421 E-.12503
G1 X152.842 Y120.171 E-.09503
G1 X152.846 Y120.141 E-.01169
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.201 J.198 P1  F30000
G1 X155.28 Y105.359 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9782
G1 X155.614 Y105.53 E.01245
G3 X154.245 Y105.217 I-1.114 J1.723 E.38006
G1 X154.449 Y105.202 E.00679
G3 X155.225 Y105.334 I.051 J2.051 E.02629
G1 X155.107 Y105.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9782
G3 X154.294 Y105.607 I-.607 J1.544 E.2949
G1 X154.459 Y105.595 E.00509
G3 X155.05 Y105.688 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X155.401 Y105.86 E-.14826
G1 X155.659 Y106.066 E-.12564
G1 X155.872 Y106.319 E-.12563
G1 X156.03 Y106.609 E-.12564
G1 X156.127 Y106.925 E-.12564
G1 X156.157 Y107.211 E-.1092
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.04 J-1.216 P1  F30000
G1 X104.446 Y105.496 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9782
G1 X104.474 Y105.477 E.00111
G3 X105.245 Y105.217 I1.026 J1.776 E.02717
G1 X105.449 Y105.202 E.00679
G3 X104.142 Y105.715 I.051 J2.051 E.38006
G1 X104.398 Y105.531 E.01046
G1 X104.672 Y105.816 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9782
G1 X104.971 Y105.68 E.01009
G3 X105.294 Y105.607 I.529 J1.573 E.01018
G1 X105.459 Y105.595 E.00509
G3 X104.62 Y105.846 I.041 J1.659 E.29313
M204 S10000
; WIPE_START
G1 F24000
G1 X104.971 Y105.68 E-.14743
G1 X105.294 Y105.607 E-.12564
G1 X105.459 Y105.595 E-.06289
G1 X105.788 Y105.619 E-.12564
G1 X106.107 Y105.709 E-.12563
G1 X106.401 Y105.86 E-.12563
G1 X106.498 Y105.937 E-.04713
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.216 J.048 P1  F30000
G1 X107.114 Y121.518 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9782
G1 X106.857 Y121.792 E.01244
G3 X105.245 Y118.217 I-1.357 J-1.539 E.25449
G1 X105.449 Y118.202 E.00679
G3 X107.151 Y121.471 I.051 J2.051 E.15186
G1 X106.789 Y121.294 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9782
G1 X106.597 Y121.498 E.0086
G3 X105.294 Y118.607 I-1.097 J-1.244 E.19066
G1 X105.459 Y118.595 E.00509
G3 X106.828 Y121.248 I.041 J1.659 E.11414
M204 S10000
; WIPE_START
G1 F24000
G1 X106.597 Y121.498 E-.1291
G1 X106.33 Y121.692 E-.12556
G1 X106.029 Y121.828 E-.12564
G1 X105.706 Y121.902 E-.12563
G1 X105.376 Y121.91 E-.12564
G1 X105.05 Y121.852 E-.12563
G1 X105.044 Y121.85 E-.00279
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.212 J-.109 P1  F30000
G1 X103.102 Y100.356 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9782
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X132.65 Y150.695 I22.105 J-.013 E1.23941
G1 X132.748 Y150.685 E.00326
G2 X152.102 Y128.762 I-2.756 J-21.938 E1.05993
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J.002 E2.80324
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9782
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.003 E2.63419
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.217 J.033 P1  F30000
G1 X104.74 Y101.112 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9782
G1 X103.857 Y101.112 E.02928
G1 X103.857 Y101.857 E.02474
G1 X106.732 Y104.732 E.13486
G1 X107.077 Y104.867 E.01229
G1 X107.143 Y104.802 E.00308
G1 X107.143 Y103.173 E.05401
G1 X107.55 Y105.43 F30000
G1 F9782
G1 X107.55 Y100.705 E.15676
G1 X103.45 Y100.705 E.13598
G1 X103.45 Y105.27 E.15143
G1 X105.201 Y104.87 E.05957
G3 X106.577 Y105.109 I.247 J2.662 E.04687
G1 X107.55 Y105.49 E.03465
G1 X107.453 Y106.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126786
G1 F9782
G1 X107.571 Y106.246 E.00138
; LINE_WIDTH: 0.173115
G1 X107.629 Y106.331 E.0011
; LINE_WIDTH: 0.136068
G1 X107.654 Y106.462 E.00101
; LINE_WIDTH: 0.0969205
G1 X107.672 Y106.567 E.00047
G1 X107.601 Y108.354 F30000
; LINE_WIDTH: 0.119478
G1 F9782
G2 X107.671 Y107.939 I-8.254 J-1.619 E.00262
G1 X107.694 Y108.118 F30000
; LINE_WIDTH: 0.195634
G1 F9782
G1 X107.593 Y108.266 E.00224
; LINE_WIDTH: 0.179235
G1 X107.524 Y108.357 E.00126
; LINE_WIDTH: 0.129169
G1 X107.392 Y108.523 E.00149
; WIPE_START
G1 F24000
G1 X107.524 Y108.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.63 J-1.041 P1  F30000
G1 X103.608 Y105.985 Z8.8
G1 Z8.4
M73 P89 R2
G1 E.8 F1800
; LINE_WIDTH: 0.0973918
G1 F9782
G1 X103.544 Y106.061 E.00044
; LINE_WIDTH: 0.111413
G1 X103.476 Y106.152 E.00063
; LINE_WIDTH: 0.14728
G1 X103.403 Y106.248 E.00103
; LINE_WIDTH: 0.181655
G1 X103.306 Y106.391 E.00195
G1 X103.329 Y106.569 F30000
; LINE_WIDTH: 0.119472
G1 F9782
G3 X103.399 Y106.155 I8.342 J1.207 E.00262
G1 X103.328 Y107.942 F30000
; LINE_WIDTH: 0.129195
G1 F9782
G1 X103.346 Y108.046 E.00075
; LINE_WIDTH: 0.161468
G1 X103.365 Y108.151 E.00103
; LINE_WIDTH: 0.148172
G2 X103.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111399
M73 P89 R1
G1 X103.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973907
G1 X103.547 Y108.427 E.00044
G1 X103.857 Y111.099 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9782
G1 X103.857 Y109.615 E.04921
G1 X103.992 Y109.668 E.00481
G1 X107.143 Y112.819 E.14778
G1 X107.143 Y112.478 E.01131
G1 X103.857 Y115.763 E.15411
G1 X103.857 Y117.209 E.04799
G1 X104.305 Y117.657 E.021
G3 X105.908 Y117.485 I1.163 J3.286 E.05398
G1 X107.55 Y118.43 F30000
G1 F9782
G1 X107.55 Y109.017 E.31225
G1 X106.426 Y109.459 E.04004
G3 X104.748 Y109.528 I-.928 J-2.151 E.057
G1 X103.45 Y109.018 E.04624
G1 X103.45 Y118.27 E.30689
G1 X104.755 Y117.972 E.0444
G3 X106.457 Y118.061 I.724 J2.462 E.05761
G1 X107.55 Y118.49 E.03895
G1 X107.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126787
G1 F9782
G1 X107.571 Y119.246 E.00138
; LINE_WIDTH: 0.173117
G1 X107.629 Y119.331 E.0011
; LINE_WIDTH: 0.13607
G1 X107.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969207
G1 X107.672 Y119.567 E.00047
G1 X107.601 Y121.354 F30000
; LINE_WIDTH: 0.119471
G1 F9782
G2 X107.671 Y120.939 I-8.169 J-1.606 E.00262
G1 X107.694 Y121.118 F30000
; LINE_WIDTH: 0.195634
G1 F9782
G1 X107.593 Y121.266 E.00224
; LINE_WIDTH: 0.179226
G1 X107.524 Y121.357 E.00126
; LINE_WIDTH: 0.129164
G1 X107.392 Y121.523 E.00149
; WIPE_START
G1 F24000
G1 X107.524 Y121.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.63 J-1.041 P1  F30000
G1 X103.608 Y118.985 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.0973916
G1 F9782
G1 X103.544 Y119.061 E.00044
; LINE_WIDTH: 0.111401
G1 X103.476 Y119.152 E.00063
; LINE_WIDTH: 0.147266
G1 X103.403 Y119.248 E.00103
; LINE_WIDTH: 0.181639
G1 X103.306 Y119.391 E.00195
G1 X103.329 Y119.569 F30000
; LINE_WIDTH: 0.119481
G1 F9782
G3 X103.399 Y119.155 I8.318 J1.204 E.00262
G1 X103.328 Y120.942 F30000
; LINE_WIDTH: 0.129192
G1 F9782
G1 X103.346 Y121.046 E.00075
; LINE_WIDTH: 0.161464
G1 X103.365 Y121.151 E.00103
; LINE_WIDTH: 0.14819
G2 X103.429 Y121.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111415
G1 X103.487 Y121.348 E.00058
; LINE_WIDTH: 0.0973922
G1 X103.547 Y121.427 E.00044
G1 X104.367 Y122.378 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9782
G1 X103.45 Y122.018 E.03266
G1 X103.45 Y128.742 E.22305
G2 X156.516 Y130.078 I26.55 J.003 E2.72272
G2 X156.55 Y122.239 I-157.093 J-4.587 E.26006
G1 X155.245 Y122.537 E.04438
G3 X153.423 Y122.4 I-.724 J-2.565 E.06189
G1 X152.45 Y122.018 E.03465
G1 X152.45 Y128.766 E.22384
G3 X107.577 Y129.873 I-22.451 J-.019 E2.30165
G3 X107.55 Y122.239 I153.043 J-4.371 E.25328
G1 X105.799 Y122.638 E.05957
G3 X104.423 Y122.4 I-.256 J-2.613 E.04689
G1 X106.042 Y123.001 F30000
G1 F9782
G3 X104.449 Y122.847 I-.508 J-3.076 E.05369
G1 X103.857 Y123.439 E.02774
G1 X103.857 Y124.885 E.04799
G1 X107.143 Y128.17 E.15411
G1 X107.143 Y127.83 E.01131
G1 X103.962 Y131.01 E.14922
G2 X104.193 Y132.897 I30.349 J-2.767 E.06307
G1 X108.943 Y137.647 E.22284
G2 X110.186 Y140.138 I23.619 J-10.233 E.09237
G1 X107.789 Y142.535 E.11245
G3 X105.313 Y137.335 I22.316 J-13.816 E.19143
G1 X107.938 Y134.71 E.12312
G3 X107.567 Y133.125 I26.971 J-7.137 E.054
G1 X112.386 Y143.316 F30000
G1 F9782
G2 X113.468 Y144.532 I21.281 J-17.869 E.054
G1 X111.147 Y146.853 E.10892
G2 X115.308 Y150.368 I22.396 J-22.301 E.18091
G1 X117.674 Y148.002 E.11099
G2 X121.094 Y149.798 I16.696 J-27.631 E.12823
G1 X125.855 Y154.559 E.22333
G1 X126.389 Y154.639 E.01791
G1 X129.423 Y151.605 E.14235
G2 X130.577 Y151.605 I.573 J-480.743 E.03827
G1 X133.611 Y154.639 E.14235
G1 X134.145 Y154.559 E.01791
G1 X138.906 Y149.798 E.22332
G2 X141.968 Y148.22 I-14.031 J-30.992 E.11432
G1 X142.326 Y148.002 E.01391
G1 X144.692 Y150.368 E.11099
G2 X148.853 Y146.853 I-14.559 J-21.462 E.18102
G1 X146.532 Y144.532 E.10892
G2 X147.614 Y143.316 I-20.204 J-19.091 E.054
G1 X152.433 Y133.125 F30000
G1 F9782
G3 X152.062 Y134.71 I-27.338 J-5.551 E.054
G1 X154.687 Y137.335 E.12312
G3 X152.211 Y142.535 I-25.219 J-8.819 E.19142
G1 X149.814 Y140.138 E.11245
G2 X151.057 Y137.647 I-31.828 J-17.441 E.09235
G1 X155.807 Y132.897 E.22284
G2 X156.038 Y131.01 I-35.718 J-5.341 E.06307
G1 X152.857 Y127.83 E.14922
G1 X152.857 Y128.17 E.01131
G1 X156.143 Y124.885 E.15411
G1 X156.143 Y123.439 E.04799
G1 X155.581 Y122.877 E.02633
G1 X155.336 Y122.933 E.00835
G3 X153.977 Y123.003 I-.826 J-2.817 E.04556
G1 X152.547 Y121.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973919
G1 F9782
G1 X152.487 Y121.348 E.00044
; LINE_WIDTH: 0.111414
G1 X152.429 Y121.263 E.00058
; LINE_WIDTH: 0.148187
G3 X152.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X152.346 Y121.046 E.00103
; LINE_WIDTH: 0.12919
G1 X152.328 Y120.942 E.00075
G1 X152.399 Y119.155 F30000
; LINE_WIDTH: 0.119476
G1 F9782
G2 X152.329 Y119.569 I8.252 J1.619 E.00262
G1 X152.306 Y119.391 F30000
; LINE_WIDTH: 0.181637
G1 F9782
G1 X152.403 Y119.248 E.00195
; LINE_WIDTH: 0.147264
G1 X152.476 Y119.152 E.00103
; LINE_WIDTH: 0.111399
G1 X152.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973913
G1 X152.608 Y118.985 E.00044
G1 X154.063 Y117.484 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9782
G3 X155.629 Y117.691 I.38 J3.146 E.05294
G1 X156.143 Y117.209 E.02338
G1 X156.143 Y115.763 E.04799
G1 X152.857 Y112.478 E.15411
G1 X152.857 Y112.819 E.01131
G1 X156.008 Y109.668 E.14781
G1 X156.143 Y109.615 E.00479
G1 X156.143 Y111.099 E.04922
G1 X156.392 Y108.523 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12917
G1 F9782
G1 X156.524 Y108.357 E.00149
; LINE_WIDTH: 0.179237
G1 X156.593 Y108.266 E.00126
; LINE_WIDTH: 0.195637
G1 X156.694 Y108.118 E.00224
G1 X156.671 Y107.939 F30000
; LINE_WIDTH: 0.119483
G1 F9782
G3 X156.601 Y108.354 I-8.319 J-1.204 E.00262
G1 X156.672 Y106.567 F30000
; LINE_WIDTH: 0.0969205
G1 F9782
G1 X156.654 Y106.462 E.00047
; LINE_WIDTH: 0.136069
G1 X156.629 Y106.331 E.00101
; LINE_WIDTH: 0.173116
G1 X156.571 Y106.246 E.0011
; LINE_WIDTH: 0.126786
G1 X156.453 Y106.081 E.00138
G1 X156.55 Y105.49 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9782
G1 X155.151 Y104.941 E.04985
G2 X154.201 Y104.87 I-.651 J2.313 E.0318
G1 X152.45 Y105.27 E.05957
G1 X152.45 Y100.705 E.15143
G1 X156.55 Y100.705 E.13598
G1 X156.55 Y105.43 E.15676
G1 X156.143 Y101.857 F30000
G1 F9782
G1 X153.354 Y104.646 E.13081
G1 X152.608 Y105.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973913
G1 F9782
G1 X152.544 Y106.061 E.00044
; LINE_WIDTH: 0.11141
G1 X152.476 Y106.152 E.00063
; LINE_WIDTH: 0.147276
G1 X152.403 Y106.248 E.00103
; LINE_WIDTH: 0.181651
G1 X152.306 Y106.391 E.00195
G1 X152.329 Y106.569 F30000
; LINE_WIDTH: 0.119468
G1 F9782
G3 X152.399 Y106.155 I8.331 J1.205 E.00262
G1 X152.328 Y107.942 F30000
; LINE_WIDTH: 0.129193
G1 F9782
G1 X152.346 Y108.046 E.00075
; LINE_WIDTH: 0.161464
G1 X152.365 Y108.151 E.00103
; LINE_WIDTH: 0.148167
G2 X152.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111396
G1 X152.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973905
G1 X152.547 Y108.427 E.00044
G1 X156.55 Y118.43 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9782
G1 X156.55 Y109.017 E.31225
G1 X155.427 Y109.459 E.04004
G3 X153.715 Y109.515 I-.926 J-2.144 E.05816
G1 X152.45 Y109.018 E.04506
G1 X152.45 Y118.27 E.30689
G1 X153.755 Y117.972 E.04438
G3 X155.48 Y118.07 I.724 J2.487 E.05845
G1 X156.55 Y118.49 E.03812
G1 X156.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126789
G1 F9782
G1 X156.571 Y119.246 E.00138
; LINE_WIDTH: 0.173121
G1 X156.629 Y119.331 E.0011
; LINE_WIDTH: 0.136072
G1 X156.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969207
G1 X156.672 Y119.567 E.00047
G1 X156.601 Y121.354 F30000
; LINE_WIDTH: 0.119475
G1 F9782
G2 X156.671 Y120.939 I-8.161 J-1.605 E.00262
G1 X156.694 Y121.118 F30000
; LINE_WIDTH: 0.195638
G1 F9782
G1 X156.593 Y121.266 E.00224
; LINE_WIDTH: 0.17923
G1 X156.524 Y121.357 E.00126
; LINE_WIDTH: 0.129165
G1 X156.392 Y121.523 E.00149
; WIPE_START
G1 F24000
G1 X156.524 Y121.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.057 J-.603 P1  F30000
G1 X138.152 Y153.589 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9782
G2 X139.682 Y153.034 I-13.215 J-38.834 E.054
G1 X137.119 Y150.471 E.12022
G1 X136.804 Y150.569 E.01094
G3 X135.555 Y150.92 I-4.143 J-12.341 E.04308
G1 X124.445 Y150.92 F30000
G1 F9782
G3 X123.691 Y150.721 I5.868 J-23.839 E.02587
G1 X122.881 Y150.471 E.02814
G1 X120.318 Y153.034 E.12022
G2 X121.848 Y153.589 I14.746 J-38.282 E.054
M106 S219.3
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X120.318 Y153.034 E-.61861
G1 X120.581 Y152.771 E-.14139
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
G3 Z8.8 I.833 J.887 P1  F30000
G1 X153.393 Y121.971 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X153.221 Y121.858 E.00681
G3 X154.245 Y118.217 I1.278 J-1.605 E.15953
G1 X154.449 Y118.202 E.00679
G3 X153.565 Y122.079 I.051 J2.051 E.24771
G1 X153.443 Y122.003 E.00475
G1 X153.75 Y121.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.6 Y121.647 E.0052
G3 X154.294 Y118.607 I.9 J-1.394 E.12459
G1 X154.459 Y118.595 E.00509
G3 X153.894 Y121.798 I.041 J1.659 E.18049
G1 X153.804 Y121.753 E.00311
M204 S10000
; WIPE_START
G1 F24000
G1 X153.6 Y121.647 E-.08708
G1 X153.465 Y121.552 E-.06287
G1 X153.228 Y121.321 E-.12563
G1 X153.042 Y121.048 E-.12564
G1 X152.913 Y120.744 E-.12563
G1 X152.848 Y120.421 E-.12493
G1 X152.842 Y120.171 E-.09509
G1 X152.847 Y120.137 E-.01313
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.202 J.192 P1  F30000
G1 X155.218 Y105.334 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X155.25 Y105.343 E.00111
G3 X154.245 Y105.217 I-.75 J1.91 E.39364
G1 X154.449 Y105.202 E.00679
G3 X154.856 Y105.233 I.051 J2.051 E.01358
G1 X155.16 Y105.318 E.01046
G1 X155.107 Y105.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X154.294 Y105.607 I-.607 J1.544 E.2949
G1 X154.459 Y105.595 E.00509
G3 X155.05 Y105.688 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X155.401 Y105.86 E-.14826
G1 X155.659 Y106.066 E-.12564
G1 X155.872 Y106.319 E-.12564
G1 X156.03 Y106.609 E-.12563
G1 X156.127 Y106.925 E-.12564
G1 X156.156 Y107.211 E-.1092
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.041 J-1.216 P1  F30000
G1 X104.504 Y105.463 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X104.846 Y105.308 E.01245
G3 X105.245 Y105.217 I.654 J1.945 E.01358
G1 X105.449 Y105.202 E.00679
G3 X104.451 Y105.49 I.051 J2.051 E.39276
G1 X104.67 Y105.817 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X105.294 Y105.607 I.83 J1.437 E.02035
G1 X105.459 Y105.595 E.00509
G3 X104.619 Y105.847 I.041 J1.659 E.29306
M204 S10000
; WIPE_START
G1 F24000
G1 X104.971 Y105.68 E-.14825
G1 X105.294 Y105.607 E-.12564
G1 X105.459 Y105.595 E-.06289
G1 X105.788 Y105.619 E-.12564
G1 X106.107 Y105.709 E-.12563
G1 X106.401 Y105.86 E-.12564
G1 X106.496 Y105.936 E-.04631
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.216 J.056 P1  F30000
G1 X107.212 Y121.381 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.194 Y121.41 E.00112
G3 X105.245 Y118.217 I-1.695 J-1.157 E.27145
G1 X105.449 Y118.202 E.00679
G3 X107.39 Y121.051 I.051 J2.051 E.13578
G1 X107.241 Y121.328 E.01044
G1 X106.809 Y121.264 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.669 Y121.43 E.00667
G3 X105.294 Y118.607 I-1.17 J-1.177 E.19369
G1 X105.459 Y118.595 E.00509
G3 X106.87 Y121.189 I.041 J1.659 E.11189
G1 X106.847 Y121.218 E.00114
M204 S10000
; WIPE_START
G1 F24000
G1 X106.669 Y121.43 E-.10529
G1 X106.469 Y121.602 E-.10034
G1 X106.183 Y121.768 E-.12565
G1 X105.869 Y121.873 E-.12563
G1 X105.541 Y121.914 E-.12563
G1 X105.212 Y121.889 E-.12564
G1 X105.08 Y121.852 E-.05183
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.212 J-.112 P1  F30000
G1 X103.102 Y100.356 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.011 E2.30258
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J.003 E2.80332
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.63401
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.289 J1.182 P1  F30000
G1 X107.731 Y100.741 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.430701
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X103.472 Y100.741 E.25281
G1 X103.472 Y101.222 E.02853
G1 X107.528 Y101.222 E.24079
G1 X107.528 Y101.703 E.02853
G1 X103.472 Y101.703 E.24079
G1 X103.472 Y102.184 E.02853
G1 X107.528 Y102.184 E.24079
G1 X107.528 Y102.664 E.02853
G1 X103.472 Y102.664 E.24079
G1 X103.472 Y103.145 E.02853
G1 X107.528 Y103.145 E.24079
G1 X107.528 Y103.626 E.02853
G1 X103.472 Y103.626 E.24079
G1 X103.472 Y104.106 E.02853
G1 X107.528 Y104.106 E.24079
G1 X107.528 Y104.587 E.02853
G1 X103.472 Y104.587 E.24079
G1 X103.472 Y105.068 E.02853
G1 X104.239 Y105.068 E.04552
G1 X105.199 Y104.849 E.05845
G1 X105.681 Y104.837 E.02866
G1 X106.157 Y104.92 E.02866
G1 X106.532 Y105.068 E.02393
G1 X107.731 Y105.068 E.07116
M106 S219.3
G1 X107.352 Y105.723 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X107.288 Y105.759 E.00204
G1 X107.337 Y105.787 E.00155
G1 X107.453 Y106.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126781
G1 F15000
M73 P90 R1
G1 X107.571 Y106.246 E.00138
; LINE_WIDTH: 0.173107
G1 X107.629 Y106.331 E.0011
; LINE_WIDTH: 0.136065
G1 X107.654 Y106.462 E.00101
; LINE_WIDTH: 0.0969206
G1 X107.672 Y106.567 E.00047
G1 X107.672 Y107.942 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X107.654 Y108.046 E.00047
; LINE_WIDTH: 0.136064
G1 X107.629 Y108.177 E.00101
; LINE_WIDTH: 0.173104
G1 X107.571 Y108.263 E.0011
; LINE_WIDTH: 0.126776
G1 X107.453 Y108.427 E.00138
G1 X107.354 Y108.712 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X107.29 Y108.749 E.00204
G1 X107.338 Y108.777 E.00155
G1 X104.618 Y109.282 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.403198
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X103.472 Y109.382 E.05986
G1 X103.472 Y109.837 E.02367
G1 X107.528 Y109.482 E.21183
G1 X107.528 Y109.937 E.02367
G1 X103.472 Y110.292 E.21183
G1 X103.472 Y110.747 E.02367
G1 X107.528 Y110.392 E.21183
G1 X107.528 Y110.847 E.02367
G1 X103.472 Y111.202 E.21183
G1 X103.472 Y111.657 E.02367
G1 X107.528 Y111.302 E.21183
G1 X107.528 Y111.757 E.02367
G1 X103.472 Y112.112 E.21183
G1 X103.472 Y112.567 E.02367
G1 X107.528 Y112.212 E.21183
G1 X107.528 Y112.667 E.02367
G1 X103.472 Y113.022 E.21183
G1 X103.472 Y113.477 E.02367
G1 X107.528 Y113.122 E.21183
G1 X107.528 Y113.577 E.02367
G1 X103.472 Y113.932 E.21183
G1 X103.472 Y114.387 E.02367
G1 X107.528 Y114.032 E.21183
G1 X107.528 Y114.487 E.02367
G1 X103.472 Y114.842 E.21183
G1 X103.472 Y115.296 E.02367
G1 X107.528 Y114.942 E.21183
G1 X107.528 Y115.396 E.02367
G1 X103.472 Y115.751 E.21183
G1 X103.472 Y116.206 E.02367
G1 X107.528 Y115.851 E.21183
G1 X107.528 Y116.306 E.02367
G1 X103.472 Y116.661 E.21183
G1 X103.472 Y117.116 E.02367
G1 X107.528 Y116.761 E.21183
G1 X107.528 Y117.216 E.02367
G1 X103.472 Y117.571 E.21183
G1 X103.472 Y118.026 E.02367
G1 X107.528 Y117.671 E.21183
G1 X107.528 Y118.126 E.02367
G1 X106.382 Y118.226 E.05987
M106 S219.3
G1 X107.352 Y118.723 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X107.288 Y118.759 E.00204
G1 X107.337 Y118.787 E.00155
G1 X107.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126788
G1 F15000
G1 X107.571 Y119.246 E.00138
; LINE_WIDTH: 0.173119
G1 X107.629 Y119.331 E.0011
; LINE_WIDTH: 0.13607
G1 X107.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969201
G1 X107.672 Y119.567 E.00047
G1 X107.672 Y120.942 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X107.654 Y121.046 E.00047
; LINE_WIDTH: 0.135583
G1 X107.63 Y121.175 E.00099
; LINE_WIDTH: 0.172098
G1 X107.571 Y121.262 E.0011
; LINE_WIDTH: 0.12616
G1 X107.456 Y121.423 E.00134
G1 X107.385 Y121.818 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.453498
G1 F15000
G2 X107.377 Y121.907 I-.026 J.042 E.00669
; WIPE_START
G1 F24000
G1 X107.334 Y121.907 E-.16484
G1 X107.308 Y121.863 E-.19839
G1 X107.334 Y121.818 E-.19839
G1 X107.385 Y121.818 E-.19839
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.123 J-1.211 P1  F30000
G1 X103.547 Y121.427 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F15000
G1 X103.487 Y121.348 E.00044
; LINE_WIDTH: 0.111408
G1 X103.429 Y121.263 E.00058
; LINE_WIDTH: 0.148189
G3 X103.365 Y121.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X103.346 Y121.046 E.00103
; LINE_WIDTH: 0.129189
G1 X103.328 Y120.942 E.00075
G1 X103.402 Y121.678 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X103.338 Y121.714 E.00204
G1 X103.402 Y121.751 E.00204
G1 X103.423 Y121.714 E.00118
G1 X103.648 Y121.712 E.00624
G1 X103.648 Y121.786 E.00204
G1 X103.66 Y121.779 E.00038
G1 X103.269 Y122.395 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400389
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X104.352 Y122.395 E.05556
G1 X104.843 Y122.588 E.02706
G1 X105.319 Y122.672 E.02477
G1 X105.801 Y122.66 E.02477
G1 X106.96 Y122.395 E.06097
G1 X107.528 Y122.395 E.02914
G1 X107.528 Y122.846 E.0231
G1 X103.472 Y122.846 E.20809
G1 X103.472 Y123.296 E.0231
G1 X107.528 Y123.296 E.20809
G1 X107.528 Y123.747 E.0231
G1 X103.472 Y123.747 E.20809
G1 X103.472 Y124.197 E.0231
G1 X107.528 Y124.197 E.20809
G1 X107.528 Y124.647 E.0231
G1 X103.472 Y124.647 E.20809
G1 X103.472 Y125.098 E.0231
G1 X107.528 Y125.098 E.20809
G1 X107.528 Y125.548 E.0231
G1 X103.472 Y125.548 E.20809
G1 X103.472 Y125.998 E.0231
G1 X107.528 Y125.998 E.20809
G1 X107.528 Y126.449 E.0231
G1 X103.472 Y126.449 E.20809
G1 X103.472 Y126.899 E.0231
G1 X107.528 Y126.899 E.20809
G1 X107.528 Y127.35 E.0231
G1 X103.472 Y127.35 E.20809
G1 X103.472 Y127.8 E.0231
G1 X107.528 Y127.8 E.20809
G1 X107.528 Y128.25 E.0231
G1 X103.472 Y128.25 E.20809
G1 X103.472 Y128.701 E.0231
G1 X107.528 Y128.701 E.20809
G2 X107.538 Y129.151 I9.034 J.033 E.02311
G1 X103.482 Y129.151 E.20806
G1 X103.493 Y129.602 E.02311
G1 X107.549 Y129.602 E.20806
G2 X107.569 Y130.052 I4.522 J.024 E.02314
G1 X103.504 Y130.052 E.20852
G2 X103.537 Y130.502 I4.528 J-.101 E.02317
G1 X107.603 Y130.502 E.20858
G1 X107.637 Y130.953 E.02317
G1 X103.571 Y130.953 E.20858
G2 X103.605 Y131.403 I4.525 J-.116 E.02318
G1 X107.691 Y131.403 E.20962
G1 X107.748 Y131.854 E.02329
G1 X103.661 Y131.854 E.20962
G1 X103.718 Y132.304 E.02329
G1 X107.814 Y132.304 E.21015
G1 X107.894 Y132.754 E.02346
G1 X103.777 Y132.754 E.2112
G1 X103.856 Y133.205 E.02346
G1 X107.973 Y133.205 E.2112
G1 X108.076 Y133.655 E.0237
G1 X103.935 Y133.655 E.2124
G2 X104.02 Y134.105 I4.555 J-.62 E.02352
G1 X108.179 Y134.105 E.21334
G2 X108.295 Y134.556 I4.57 J-.941 E.02387
G1 X104.123 Y134.556 E.21404
G1 X104.225 Y135.006 E.0237
G1 X108.422 Y135.006 E.21527
G2 X108.553 Y135.457 I4.578 J-1.087 E.02407
G1 X104.336 Y135.457 E.21629
G1 X104.463 Y135.907 E.024
G1 X108.704 Y135.907 E.21755
G1 X108.855 Y136.357 E.02437
G1 X104.59 Y136.357 E.21882
G2 X104.729 Y136.808 I4.582 J-1.173 E.0242
G1 X109.027 Y136.808 E.22049
G1 X109.204 Y137.258 E.02482
G1 X104.881 Y137.258 E.22179
G1 X105.032 Y137.709 E.02437
G1 X109.394 Y137.709 E.22378
G1 X109.597 Y138.159 E.02535
G1 X105.202 Y138.159 E.22548
G1 X105.379 Y138.609 E.02482
G1 X109.811 Y138.609 E.22735
G1 X110.04 Y139.06 E.02592
G1 X105.559 Y139.06 E.22986
G1 X105.761 Y139.51 E.02532
G1 X110.269 Y139.51 E.23128
G1 X110.529 Y139.961 E.02668
G1 X105.963 Y139.961 E.23426
G2 X106.174 Y140.411 I4.429 J-1.804 E.02554
G1 X110.789 Y140.411 E.23675
G2 X111.076 Y140.861 I4.656 J-2.648 E.0274
G1 X106.405 Y140.861 E.23962
G1 X106.636 Y141.312 E.02596
G1 X111.367 Y141.312 E.24269
G2 X111.683 Y141.762 I4.67 J-2.944 E.02825
G1 X106.888 Y141.762 E.24601
G1 X107.148 Y142.212 E.02668
G1 X112.007 Y142.212 E.24929
G2 X112.358 Y142.663 I4.687 J-3.286 E.02929
G1 X107.413 Y142.663 E.25366
G1 X107.704 Y143.113 E.0275
G1 X112.717 Y143.113 E.25716
G2 X113.107 Y143.564 I4.708 J-3.684 E.03058
G1 X107.995 Y143.564 E.26226
G2 X108.309 Y144.014 I4.669 J-2.92 E.02818
G1 X113.505 Y144.014 E.26654
G2 X113.942 Y144.464 I4.73 J-4.152 E.03221
G1 X108.633 Y144.464 E.27234
G2 X108.968 Y144.915 I4.679 J-3.131 E.02881
G1 X114.388 Y144.915 E.27808
G1 X114.874 Y145.365 E.03397
G1 X109.327 Y145.365 E.28455
G2 X109.687 Y145.816 I4.69 J-3.379 E.02959
G1 X115.383 Y145.816 E.29223
G1 X115.92 Y146.266 E.03594
G1 X110.084 Y146.266 E.29937
G1 X110.482 Y146.716 E.03082
G1 X116.507 Y146.716 E.30911
G2 X117.126 Y147.167 I4.822 J-5.976 E.03929
G1 X110.914 Y147.167 E.31871
G1 X111.353 Y147.617 E.03228
G1 X117.787 Y147.617 E.33007
G2 X118.522 Y148.068 I4.879 J-7.134 E.04422
G1 X111.825 Y148.068 E.34352
G1 X112.311 Y148.518 E.03397
G1 X119.319 Y148.518 E.35953
G2 X120.198 Y148.968 I4.952 J-8.583 E.05069
G1 X112.833 Y148.968 E.37783
G1 X113.37 Y149.419 E.03594
G1 X121.187 Y149.419 E.40102
G2 X122.329 Y149.869 I5.083 J-11.216 E.063
G1 X113.955 Y149.869 E.4296
G2 X114.553 Y150.319 I4.811 J-5.77 E.03844
G1 X123.697 Y150.319 E.46906
G2 X125.528 Y150.77 I6.709 J-23.337 E.0968
G1 X115.214 Y150.77 E.52915
G2 X115.905 Y151.22 I4.858 J-6.702 E.04235
G1 X144.095 Y151.22 E1.44613
G2 X144.786 Y150.77 I-4.166 J-7.152 E.04235
G1 X134.472 Y150.77 E.52915
G2 X136.303 Y150.319 I-4.877 J-23.787 E.0968
G1 X145.447 Y150.319 E.46906
G2 X146.045 Y149.869 I-4.213 J-6.22 E.03844
G1 X137.671 Y149.869 E.4296
G2 X138.813 Y149.419 I-3.941 J-11.666 E.063
G1 X146.63 Y149.419 E.40102
G1 X147.167 Y148.968 E.03594
G1 X139.802 Y148.968 E.37783
G2 X140.681 Y148.518 I-4.073 J-9.034 E.05069
G1 X147.689 Y148.518 E.35953
G1 X148.175 Y148.068 E.03397
G1 X141.478 Y148.068 E.34352
G2 X142.213 Y147.617 I-4.146 J-7.586 E.04422
G1 X148.647 Y147.617 E.33007
G1 X149.086 Y147.167 E.03228
G1 X142.874 Y147.167 E.31871
G2 X143.493 Y146.716 I-4.203 J-6.427 E.03929
G1 X149.518 Y146.716 E.30911
G1 X149.916 Y146.266 E.03082
G1 X144.08 Y146.266 E.29937
G1 X144.617 Y145.816 E.03594
G1 X150.313 Y145.816 E.29223
M73 P91 R1
G2 X150.673 Y145.365 I-4.332 J-3.831 E.02959
G1 X145.126 Y145.365 E.28455
G1 X145.612 Y144.915 E.03397
G1 X151.032 Y144.915 E.27808
G2 X151.367 Y144.464 I-4.345 J-3.582 E.02881
G1 X146.058 Y144.464 E.27234
G2 X146.495 Y144.014 I-4.294 J-4.603 E.03221
G1 X151.691 Y144.014 E.26654
G2 X152.005 Y143.564 I-4.355 J-3.371 E.02818
G1 X146.893 Y143.564 E.26226
G2 X147.283 Y143.113 I-4.317 J-4.134 E.03058
G1 X152.296 Y143.113 E.25716
G1 X152.587 Y142.663 E.0275
G1 X147.642 Y142.663 E.25366
G2 X147.993 Y142.212 I-4.337 J-3.736 E.02929
G1 X152.852 Y142.212 E.24929
G1 X153.112 Y141.762 E.02668
G1 X148.317 Y141.762 E.24601
G2 X148.633 Y141.312 I-4.354 J-3.395 E.02825
G1 X153.364 Y141.312 E.24269
G1 X153.595 Y140.861 E.02596
G1 X148.924 Y140.861 E.23962
G2 X149.211 Y140.411 I-4.369 J-3.098 E.0274
G1 X153.826 Y140.411 E.23675
G2 X154.038 Y139.961 I-4.406 J-2.351 E.02555
G1 X149.471 Y139.961 E.2343
G1 X149.731 Y139.51 E.02668
G1 X154.241 Y139.51 E.23139
G1 X154.444 Y139.06 E.02535
G1 X149.962 Y139.06 E.22994
G1 X150.193 Y138.609 E.02596
G1 X154.621 Y138.609 E.22717
G1 X154.798 Y138.159 E.02482
G1 X150.403 Y138.159 E.22548
G1 X150.606 Y137.709 E.02535
G1 X154.968 Y137.709 E.22378
G1 X155.119 Y137.258 E.02437
G1 X150.796 Y137.258 E.22179
G1 X150.973 Y136.808 E.02482
G1 X155.271 Y136.808 E.22049
G2 X155.41 Y136.357 I-4.442 J-1.623 E.0242
G1 X151.145 Y136.357 E.21882
G1 X151.296 Y135.907 E.02437
G1 X155.537 Y135.907 E.21755
G1 X155.664 Y135.457 E.024
G1 X151.447 Y135.457 E.21629
G2 X151.578 Y135.006 I-4.447 J-1.538 E.02407
G1 X155.775 Y135.006 E.21527
G1 X155.877 Y134.556 E.0237
G1 X151.705 Y134.556 E.21404
G2 X151.821 Y134.105 I-4.454 J-1.392 E.02387
G1 X155.98 Y134.105 E.21334
G2 X156.065 Y133.655 I-4.47 J-1.07 E.02352
G1 X151.924 Y133.655 E.2124
G1 X152.027 Y133.205 E.0237
G1 X156.144 Y133.205 E.2112
G2 X156.223 Y132.754 I-4.681 J-1.051 E.02346
G1 X152.106 Y132.754 E.21117
G1 X152.186 Y132.304 E.02346
G1 X156.28 Y132.304 E.21004
G1 X156.338 Y131.854 E.02329
G1 X152.252 Y131.854 E.20957
G1 X152.309 Y131.403 E.02329
G1 X156.395 Y131.403 E.20962
G2 X156.429 Y130.953 I-4.309 J-.553 E.02318
G1 X152.363 Y130.953 E.20858
G1 X152.397 Y130.502 E.02317
G1 X156.463 Y130.502 E.20858
G2 X156.496 Y130.052 I-4.495 J-.551 E.02317
G1 X152.431 Y130.052 E.20852
G2 X152.451 Y129.602 I-4.502 J-.427 E.02314
G1 X156.507 Y129.602 E.20806
G1 X156.518 Y129.151 E.02311
G1 X152.462 Y129.151 E.20806
G2 X152.472 Y128.701 I-9.025 J-.418 E.02311
G1 X156.528 Y128.701 E.20809
G1 X156.528 Y128.25 E.0231
G1 X152.472 Y128.25 E.20809
G1 X152.472 Y127.8 E.0231
G1 X156.528 Y127.8 E.20809
G1 X156.528 Y127.35 E.0231
G1 X152.472 Y127.35 E.20809
G1 X152.472 Y126.899 E.0231
G1 X156.528 Y126.899 E.20809
G1 X156.528 Y126.449 E.0231
G1 X152.472 Y126.449 E.20809
G1 X152.472 Y125.998 E.0231
G1 X156.528 Y125.998 E.20809
G1 X156.528 Y125.548 E.0231
G1 X152.472 Y125.548 E.20809
G1 X152.472 Y125.098 E.0231
G1 X156.528 Y125.098 E.20809
G1 X156.528 Y124.647 E.0231
G1 X152.472 Y124.647 E.20809
G1 X152.472 Y124.197 E.0231
G1 X156.528 Y124.197 E.20809
G1 X156.528 Y123.747 E.0231
G1 X152.472 Y123.747 E.20809
G1 X152.472 Y123.296 E.0231
G1 X156.528 Y123.296 E.20809
G1 X156.528 Y122.846 E.0231
G1 X152.472 Y122.846 E.20809
G1 X152.472 Y122.395 E.0231
G1 X153.352 Y122.395 E.04518
G1 X153.843 Y122.588 E.02706
G1 X154.319 Y122.672 E.02477
G1 X154.801 Y122.66 E.02477
G1 X155.96 Y122.395 E.06097
G1 X156.731 Y122.395 E.03952
M106 S219.3
G1 X156.385 Y121.818 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.453488
; LAYER_HEIGHT: 0.2
G1 F15000
G2 X156.377 Y121.907 I-.026 J.042 E.00669
G1 X156.456 Y121.423 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126162
G1 F15000
G1 X156.571 Y121.262 E.00134
; LINE_WIDTH: 0.172102
G1 X156.63 Y121.175 E.0011
; LINE_WIDTH: 0.135585
G1 X156.654 Y121.046 E.00099
; LINE_WIDTH: 0.0969204
G1 X156.672 Y120.942 E.00047
G1 X156.672 Y119.567 F30000
; LINE_WIDTH: 0.0969201
G1 F15000
G1 X156.654 Y119.462 E.00047
; LINE_WIDTH: 0.136071
G1 X156.629 Y119.331 E.00101
; LINE_WIDTH: 0.173121
G1 X156.571 Y119.246 E.0011
; LINE_WIDTH: 0.126789
G1 X156.453 Y119.081 E.00138
G1 X156.352 Y118.723 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X156.288 Y118.759 E.00204
G1 X156.337 Y118.787 E.00155
G1 X155.382 Y118.226 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.403198
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X156.528 Y118.126 E.05987
G1 X156.528 Y117.671 E.02367
G1 X152.472 Y118.026 E.21183
G1 X152.472 Y117.571 E.02367
G1 X156.528 Y117.216 E.21183
G1 X156.528 Y116.761 E.02367
G1 X152.472 Y117.116 E.21183
G1 X152.472 Y116.661 E.02367
G1 X156.528 Y116.306 E.21183
G1 X156.528 Y115.851 E.02367
G1 X152.472 Y116.206 E.21183
G1 X152.472 Y115.751 E.02367
G1 X156.528 Y115.396 E.21183
G1 X156.528 Y114.942 E.02367
G1 X152.472 Y115.296 E.21183
G1 X152.472 Y114.842 E.02367
G1 X156.528 Y114.487 E.21183
G1 X156.528 Y114.032 E.02367
G1 X152.472 Y114.387 E.21183
G1 X152.472 Y113.932 E.02367
G1 X156.528 Y113.577 E.21183
G1 X156.528 Y113.122 E.02367
G1 X152.472 Y113.477 E.21183
G1 X152.472 Y113.022 E.02367
G1 X156.528 Y112.667 E.21183
G1 X156.528 Y112.212 E.02367
G1 X152.472 Y112.567 E.21183
G1 X152.472 Y112.112 E.02367
G1 X156.528 Y111.757 E.21183
G1 X156.528 Y111.302 E.02367
G1 X152.472 Y111.657 E.21183
G1 X152.472 Y111.202 E.02367
G1 X156.528 Y110.847 E.21183
G1 X156.528 Y110.392 E.02367
G1 X152.472 Y110.747 E.21183
G1 X152.472 Y110.292 E.02367
G1 X156.528 Y109.937 E.21183
G1 X156.528 Y109.482 E.02367
G1 X152.472 Y109.837 E.21183
G1 X152.472 Y109.382 E.02367
G1 X153.618 Y109.282 E.05986
M106 S219.3
G1 X152.402 Y108.677 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X152.338 Y108.714 E.00204
G1 X152.402 Y108.751 E.00204
G1 X152.423 Y108.714 E.00118
G1 X152.648 Y108.712 E.00624
G1 X152.648 Y108.786 E.00204
G1 X152.66 Y108.779 E.00038
G1 X152.547 Y108.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973902
G1 F15000
G1 X152.487 Y108.348 E.00044
; LINE_WIDTH: 0.111392
G1 X152.429 Y108.263 E.00058
; LINE_WIDTH: 0.14817
G3 X152.365 Y108.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161452
G1 X152.346 Y108.046 E.00103
; LINE_WIDTH: 0.129187
G1 X152.328 Y107.942 E.00075
G1 X152.329 Y106.569 F30000
; LINE_WIDTH: 0.119477
G1 F15000
G3 X152.399 Y106.155 I8.235 J1.191 E.00262
G1 X152.476 Y106.152 F30000
; LINE_WIDTH: 0.147284
G1 F15000
G1 X152.403 Y106.248 E.00103
; LINE_WIDTH: 0.181661
G1 X152.306 Y106.391 E.00195
G1 X152.476 Y106.152 F30000
; LINE_WIDTH: 0.111416
G1 F15000
G1 X152.544 Y106.061 E.00063
; LINE_WIDTH: 0.0973919
G1 X152.608 Y105.985 E.00044
G1 X152.427 Y105.608 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
M73 P92 R1
G1 X152.628 Y105.569 E.00566
G1 X152.676 Y105.581 E.00137
G1 X156.352 Y105.723 F30000
G1 F15000
G1 X156.288 Y105.759 E.00204
G1 X156.337 Y105.787 E.00155
G1 X156.453 Y106.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126783
G1 F15000
G1 X156.571 Y106.246 E.00138
; LINE_WIDTH: 0.173111
G1 X156.629 Y106.331 E.0011
; LINE_WIDTH: 0.136067
G1 X156.654 Y106.462 E.00101
; LINE_WIDTH: 0.0969205
G1 X156.672 Y106.567 E.00047
G1 X156.672 Y107.942 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X156.654 Y108.046 E.00047
; LINE_WIDTH: 0.136066
G1 X156.629 Y108.177 E.00101
; LINE_WIDTH: 0.173109
G1 X156.571 Y108.263 E.0011
; LINE_WIDTH: 0.12678
G1 X156.453 Y108.427 E.00138
G1 X156.354 Y108.712 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X156.29 Y108.749 E.00204
G1 X156.338 Y108.777 E.00155
G1 X156.731 Y105.068 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.430702
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X155.532 Y105.068 E.07116
G1 X155.157 Y104.92 E.02394
G1 X154.681 Y104.837 E.02866
G1 X154.199 Y104.849 E.02866
G1 X153.239 Y105.068 E.05845
G1 X152.472 Y105.068 E.04552
G1 X152.472 Y104.587 E.02854
G1 X156.528 Y104.587 E.24079
G1 X156.528 Y104.106 E.02854
G1 X152.472 Y104.106 E.24079
G1 X152.472 Y103.626 E.02854
G1 X156.528 Y103.626 E.24079
G1 X156.528 Y103.145 E.02854
G1 X152.472 Y103.145 E.24079
G1 X152.472 Y102.664 E.02854
G1 X156.528 Y102.664 E.24079
G1 X156.528 Y102.184 E.02854
G1 X152.472 Y102.184 E.24079
G1 X152.472 Y101.703 E.02854
G1 X156.528 Y101.703 E.24079
G1 X156.528 Y101.222 E.02854
G1 X152.472 Y101.222 E.24079
G1 X152.472 Y100.741 E.02854
G1 X156.731 Y100.741 E.25281
M106 S219.3
; WIPE_START
G1 F24000
G1 X154.731 Y100.741 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.207 J-.156 P1  F30000
G1 X152.427 Y118.608 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X152.628 Y118.569 E.00566
G1 X152.676 Y118.581 E.00137
G1 X152.608 Y118.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973913
G1 F15000
G1 X152.544 Y119.061 E.00044
; LINE_WIDTH: 0.111402
G1 X152.476 Y119.152 E.00063
; LINE_WIDTH: 0.147269
G1 X152.403 Y119.248 E.00103
; LINE_WIDTH: 0.181644
G1 X152.306 Y119.391 E.00195
G1 X152.329 Y119.569 F30000
; LINE_WIDTH: 0.119465
G1 F15000
G3 X152.399 Y119.155 I8.294 J1.2 E.00262
G1 X152.328 Y120.942 F30000
; LINE_WIDTH: 0.129187
G1 F15000
G1 X152.346 Y121.046 E.00075
; LINE_WIDTH: 0.161452
G1 X152.365 Y121.151 E.00103
; LINE_WIDTH: 0.148186
G2 X152.429 Y121.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111405
G1 X152.487 Y121.348 E.00058
; LINE_WIDTH: 0.0973915
G1 X152.547 Y121.427 E.00044
G1 X152.402 Y121.677 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X152.338 Y121.714 E.00204
G1 X152.402 Y121.751 E.00204
G1 X152.423 Y121.714 E.00118
G1 X152.648 Y121.712 E.00624
G1 X152.648 Y121.786 E.00204
G1 X152.66 Y121.779 E.00038
; WIPE_START
G1 F24000
G1 X152.648 Y121.786 E-.0206
G1 X152.648 Y121.712 E-.11139
G1 X152.423 Y121.714 E-.34093
G1 X152.402 Y121.751 E-.06431
G1 X152.338 Y121.714 E-.11139
G1 X152.402 Y121.677 E-.11139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.169 J-.337 P1  F30000
G1 X143.746 Y151.671 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.400389
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X116.642 Y151.671 E1.39044
G2 X117.458 Y152.121 I4.92 J-7.946 E.04781
G1 X142.542 Y152.121 E1.28684
G3 X141.665 Y152.571 I-4.95 J-8.567 E.05063
G1 X118.335 Y152.571 E1.19679
G2 X119.296 Y153.022 I4.993 J-9.404 E.05447
G1 X140.704 Y153.022 E1.09819
G1 X139.626 Y153.472 E.0599
G1 X120.374 Y153.472 E.98765
G1 X121.622 Y153.923 E.06807
G1 X138.378 Y153.923 E.85958
G1 X137.185 Y154.291 E.06406
G1 X136.861 Y154.373 E.01712
G1 X123.139 Y154.373 E.70398
G2 X125.118 Y154.823 I5.502 J-19.603 E.10417
G1 X134.882 Y154.823 E.50093
G1 X134.607 Y154.879 E.01444
G3 X130.664 Y155.274 I-4.935 J-29.415 E.20339
G1 X126.653 Y155.274 E.20578
M106 S219.3
; WIPE_START
G1 F24000
G1 X128.653 Y155.274 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.993 J-.704 P1  F30000
G1 X103.329 Y119.569 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11947
; LAYER_HEIGHT: 0.2
G1 F15000
G3 X103.399 Y119.155 I8.304 J1.201 E.00262
G1 X103.476 Y119.152 F30000
; LINE_WIDTH: 0.111405
G1 F15000
G1 X103.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973915
G1 X103.608 Y118.985 E.00044
G1 X103.476 Y119.152 F30000
; LINE_WIDTH: 0.147272
G1 F15000
G1 X103.403 Y119.248 E.00103
; LINE_WIDTH: 0.181646
G1 X103.306 Y119.391 E.00195
G1 X103.427 Y118.608 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X103.628 Y118.569 E.00566
G1 X103.676 Y118.581 E.00137
G1 X103.402 Y108.677 F30000
G1 F15000
G1 X103.338 Y108.714 E.00204
G1 X103.402 Y108.751 E.00204
G1 X103.423 Y108.714 E.00118
G1 X103.648 Y108.712 E.00624
G1 X103.648 Y108.786 E.00204
G1 X103.66 Y108.779 E.00038
G1 X103.547 Y108.427 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973924
G1 F15000
G1 X103.487 Y108.348 E.00044
; LINE_WIDTH: 0.111389
G1 X103.429 Y108.263 E.00058
; LINE_WIDTH: 0.148167
G3 X103.365 Y108.151 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X103.346 Y108.046 E.00103
; LINE_WIDTH: 0.129189
G1 X103.328 Y107.942 E.00075
G1 X103.329 Y106.569 F30000
; LINE_WIDTH: 0.119481
G1 F15000
G3 X103.399 Y106.155 I8.32 J1.204 E.00262
G1 X103.476 Y106.152 F30000
; LINE_WIDTH: 0.147285
G1 F15000
G1 X103.403 Y106.248 E.00103
; LINE_WIDTH: 0.181661
G1 X103.306 Y106.391 E.00195
G1 X103.476 Y106.152 F30000
; LINE_WIDTH: 0.111417
G1 F15000
G1 X103.544 Y106.061 E.00063
; LINE_WIDTH: 0.097392
G1 X103.608 Y105.985 E.00044
G1 X103.427 Y105.608 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X103.628 Y105.569 E.00566
G1 X103.676 Y105.581 E.00137
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X103.628 Y105.569 E-.14839
G1 X103.427 Y105.608 E-.61161
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
G3 Z9 I-.38 J1.156 P1  F30000
G1 X153.595 Y122.093 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.565 Y122.079 E.00111
G3 X154.245 Y118.217 I.935 J-1.826 E.17309
G1 X154.449 Y118.202 E.00679
G3 X153.945 Y122.228 I.051 J2.051 E.23414
G1 X153.651 Y122.115 E.01045
G1 X153.757 Y121.737 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.743 Y121.73 E.00047
G3 X154.294 Y118.607 I.756 J-1.477 E.12967
G1 X154.459 Y118.595 E.00509
G3 X154.051 Y121.851 I.041 J1.659 E.17541
G1 X153.813 Y121.759 E.00783
M204 S10000
; WIPE_START
G1 F24000
G1 X153.743 Y121.73 E-.02861
G1 X153.465 Y121.552 E-.12557
G1 X153.228 Y121.321 E-.12564
G1 X153.042 Y121.048 E-.12563
G1 X152.914 Y120.744 E-.12563
G1 X152.848 Y120.422 E-.12483
G1 X152.842 Y120.171 E-.09515
G1 X152.845 Y120.148 E-.00893
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.201 J.198 P1  F30000
G1 X155.28 Y105.359 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X155.614 Y105.53 E.01245
G3 X154.245 Y105.217 I-1.114 J1.723 E.38006
G1 X154.449 Y105.202 E.00679
G3 X155.225 Y105.334 I.051 J2.051 E.02629
G1 X155.107 Y105.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X154.294 Y105.607 I-.607 J1.544 E.2949
G1 X154.459 Y105.595 E.00509
G3 X155.05 Y105.688 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X155.401 Y105.86 E-.14826
G1 X155.659 Y106.066 E-.12564
G1 X155.872 Y106.319 E-.12563
G1 X156.03 Y106.609 E-.12563
G1 X156.127 Y106.925 E-.12564
G1 X156.157 Y107.211 E-.1092
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.04 J-1.216 P1  F30000
G1 X104.446 Y105.496 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X104.474 Y105.477 E.00111
G3 X105.245 Y105.217 I1.026 J1.776 E.02717
G1 X105.449 Y105.202 E.00679
G3 X104.142 Y105.715 I.051 J2.051 E.38006
G1 X104.398 Y105.531 E.01046
G1 X104.667 Y105.818 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X104.67 Y105.817 E.00011
G3 X105.294 Y105.607 I.83 J1.437 E.02035
G1 X105.459 Y105.595 E.00509
G3 X104.402 Y106.01 I.041 J1.659 E.28472
G1 X104.618 Y105.854 E.00821
M204 S10000
; WIPE_START
G1 F24000
G1 X104.67 Y105.817 E-.02412
G1 X104.971 Y105.68 E-.12563
G1 X105.294 Y105.607 E-.12564
G1 X105.459 Y105.595 E-.06289
G1 X105.788 Y105.619 E-.12564
G1 X106.107 Y105.709 E-.12563
G1 X106.401 Y105.86 E-.12563
G1 X106.493 Y105.933 E-.04482
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.216 J.048 P1  F30000
G1 X107.114 Y121.518 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.857 Y121.792 E.01244
G3 X105.245 Y118.217 I-1.357 J-1.539 E.25449
G1 X105.449 Y118.202 E.00679
G3 X107.151 Y121.471 I.051 J2.051 E.15187
G1 X106.828 Y121.249 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.822 Y121.256 E.00026
G3 X105.294 Y118.607 I-1.322 J-1.002 E.20082
G1 X105.459 Y118.595 E.00509
G3 X106.994 Y120.974 I.041 J1.659 E.10426
G1 X106.859 Y121.198 E.00805
M204 S10000
; WIPE_START
G1 F24000
G1 X106.822 Y121.256 E-.026
G1 X106.599 Y121.499 E-.12556
G1 X106.33 Y121.692 E-.12564
G1 X106.029 Y121.828 E-.12564
G1 X105.706 Y121.902 E-.12563
G1 X105.376 Y121.91 E-.12564
G1 X105.102 Y121.862 E-.10589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.212 J-.113 P1  F30000
G1 X103.102 Y100.356 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.898 Y100.356 E.15909
G1 X107.898 Y128.762 E.94226
G2 X152.102 Y128.762 I22.102 J-.014 E2.30237
G1 X152.102 Y100.356 E.94226
G1 X156.898 Y100.356 E.15909
G1 X156.898 Y128.747 E.94176
G3 X103.102 Y128.747 I-26.898 J-.001 E2.80303
G1 X103.102 Y100.416 E.93977
G1 X102.71 Y99.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.63401
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.197 J-.22 P1  F30000
G1 X103.608 Y105.985 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F15000
G1 X103.544 Y106.061 E.00044
; LINE_WIDTH: 0.111413
G1 X103.476 Y106.152 E.00063
; LINE_WIDTH: 0.14728
G1 X103.403 Y106.248 E.00103
; LINE_WIDTH: 0.181657
G1 X103.306 Y106.391 E.00195
G1 X103.329 Y106.569 F30000
; LINE_WIDTH: 0.119481
G1 F15000
G3 X103.399 Y106.155 I8.332 J1.206 E.00262
G1 X103.328 Y107.942 F30000
; LINE_WIDTH: 0.129189
G1 F15000
G1 X103.346 Y108.046 E.00075
; LINE_WIDTH: 0.161456
G1 X103.365 Y108.151 E.00103
; LINE_WIDTH: 0.148169
G2 X103.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111389
G1 X103.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973916
G1 X103.547 Y108.427 E.00044
; WIPE_START
G1 F24000
G1 X103.487 Y108.348 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.054 J1.216 P1  F30000
G1 X107.392 Y108.523 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.129161
G1 F15000
G1 X107.524 Y108.357 E.00149
; LINE_WIDTH: 0.179217
G1 X107.593 Y108.266 E.00126
; LINE_WIDTH: 0.195631
G1 X107.694 Y108.118 E.00224
G1 X107.671 Y107.939 F30000
; LINE_WIDTH: 0.119474
G1 F15000
G3 X107.601 Y108.354 I-8.322 J-1.204 E.00262
G1 X107.672 Y106.567 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X107.654 Y106.462 E.00047
; LINE_WIDTH: 0.136068
G1 X107.629 Y106.331 E.00101
; LINE_WIDTH: 0.173114
G1 X107.571 Y106.246 E.0011
; LINE_WIDTH: 0.126785
G1 X107.453 Y106.081 E.00138
G1 X107.506 Y105.611 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X107.506 Y100.748 E.1494
G1 X103.494 Y100.748 E.12327
G1 X103.494 Y105.513 E.1464
M73 P93 R1
G1 X103.621 Y105.494 E.00393
G1 X103.733 Y105.579 E.00433
G1 X103.896 Y105.409 E.00724
G1 X104.294 Y105.127 E.01496
G1 X104.739 Y104.931 E.01496
G1 X105.215 Y104.826 E.01496
G1 X105.701 Y104.818 E.01496
G1 X106.18 Y104.906 E.01496
G1 X106.632 Y105.087 E.01496
G1 X107.046 Y105.361 E.01525
G1 X107.338 Y105.677 E.01321
G1 X107.447 Y105.6 E.00409
G1 X107.129 Y104.959 F30000
G1 F15000
G1 X107.129 Y101.126 E.11779
G1 X103.871 Y101.126 E.10009
G1 X103.871 Y104.962 E.11789
G1 X104.139 Y104.784 E.00988
G1 X104.655 Y104.563 E.01726
G1 X105.205 Y104.449 E.01726
G1 X105.767 Y104.446 E.01726
G1 X106.318 Y104.555 E.01726
G1 X106.837 Y104.77 E.01726
G1 X107.078 Y104.926 E.00884
G1 X106.752 Y104.32 F30000
G1 F15000
G1 X106.752 Y101.503 E.08657
G1 X104.248 Y101.503 E.07692
G1 X104.248 Y104.321 E.08659
G1 X104.571 Y104.195 E.01064
G1 X105.196 Y104.072 E.01956
G1 X105.832 Y104.075 E.01956
G1 X106.456 Y104.204 E.01956
G1 X106.696 Y104.298 E.00792
G1 X106.375 Y103.791 F30000
G1 F15000
G1 X106.375 Y101.88 E.05873
G1 X104.625 Y101.88 E.05375
G1 X104.625 Y103.796 E.05889
G1 X105.186 Y103.695 E.01752
G1 X105.898 Y103.703 E.02186
G1 X106.316 Y103.78 E.01305
G1 X105.998 Y103.303 F30000
G1 F15000
G1 X105.998 Y102.257 E.03216
G1 X105.002 Y102.257 E.03058
G1 X105.002 Y103.34 E.03328
G3 X105.938 Y103.304 I.853 J10.063 E.02876
G1 X105.654 Y102.967 F30000
; LINE_WIDTH: 0.351907
G1 F15000
G1 X105.654 Y102.6 E.00924
G1 X105.346 Y102.6 E.00778
G1 X105.346 Y102.971 E.00934
G1 X105.594 Y102.967 E.00627
; WIPE_START
G1 F24000
G1 X105.346 Y102.971 E-.14604
G1 X105.346 Y102.6 E-.21756
G1 X105.654 Y102.6 E-.18121
G1 X105.654 Y102.967 E-.21519
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.209 J.143 P1  F30000
G1 X107.506 Y118.611 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.419999
G1 F15000
G1 X107.506 Y108.997 E.29538
G1 X107.387 Y109.024 E.00373
G1 X107.267 Y108.93 E.0047
G1 X107.104 Y109.1 E.00724
G1 X106.706 Y109.381 E.01496
G1 X106.261 Y109.578 E.01496
G1 X105.785 Y109.683 E.01496
G1 X105.299 Y109.691 E.01496
G1 X104.82 Y109.603 E.01496
G1 X104.368 Y109.421 E.01496
G1 X103.954 Y109.147 E.01525
G1 X103.662 Y108.832 E.01321
G1 X103.566 Y108.903 E.00367
G1 X103.494 Y108.889 E.00225
G1 X103.494 Y118.513 E.29571
G1 X103.621 Y118.494 E.00393
G1 X103.733 Y118.579 E.00433
G1 X103.896 Y118.409 E.00724
G1 X104.294 Y118.127 E.01496
G1 X104.739 Y117.931 E.01496
G1 X105.215 Y117.826 E.01496
G1 X105.701 Y117.818 E.01496
G1 X106.18 Y117.906 E.01496
G1 X106.632 Y118.087 E.01496
G1 X107.046 Y118.361 E.01525
G1 X107.338 Y118.677 E.01321
G1 X107.447 Y118.6 E.00409
G1 X107.129 Y117.959 F30000
G1 F15000
G1 X107.129 Y109.546 E.2585
G1 X106.861 Y109.725 E.00988
G1 X106.345 Y109.946 E.01726
G1 X105.795 Y110.06 E.01726
G1 X105.233 Y110.062 E.01726
G1 X104.682 Y109.954 E.01726
G1 X104.163 Y109.738 E.01726
G1 X103.871 Y109.55 E.01068
G1 X103.871 Y117.962 E.2585
G1 X104.139 Y117.784 E.00988
G1 X104.655 Y117.563 E.01726
G1 X105.205 Y117.449 E.01726
G1 X105.767 Y117.446 E.01726
G1 X106.318 Y117.555 E.01726
G1 X106.837 Y117.77 E.01726
G1 X107.078 Y117.926 E.00884
G1 X106.752 Y117.32 F30000
G1 F15000
G1 X106.752 Y110.188 E.21914
G1 X106.429 Y110.313 E.01064
G1 X105.804 Y110.437 E.01956
G1 X105.168 Y110.434 E.01956
G1 X104.544 Y110.305 E.01956
G1 X104.248 Y110.189 E.00977
G1 X104.248 Y117.321 E.21914
G1 X104.571 Y117.195 E.01064
G1 X105.196 Y117.072 E.01956
G1 X105.832 Y117.075 E.01956
G1 X106.456 Y117.204 E.01956
G1 X106.696 Y117.298 E.00792
G1 X106.375 Y116.791 F30000
G1 F15000
G1 X106.375 Y110.712 E.18678
G1 X105.814 Y110.814 E.01752
G1 X105.102 Y110.805 E.02186
G1 X104.625 Y110.717 E.01489
G1 X104.625 Y116.796 E.18678
G1 X105.186 Y116.695 E.01752
G1 X105.898 Y116.703 E.02186
G1 X106.316 Y116.78 E.01305
G1 X105.998 Y116.303 F30000
G1 F15000
G1 X105.998 Y111.169 E.15778
G3 X105.002 Y111.205 I-.891 J-10.717 E.03061
G1 X105.002 Y116.34 E.15778
G3 X105.938 Y116.304 I.853 J10.078 E.02876
G1 X105.654 Y115.967 F30000
; LINE_WIDTH: 0.351907
G1 F15000
G1 X105.654 Y111.538 E.11151
G1 X105.346 Y111.542 E.00778
G1 X105.346 Y115.971 E.11151
G1 X105.594 Y115.967 E.00627
G1 X103.608 Y118.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973922
G1 F15000
G1 X103.544 Y119.061 E.00044
; LINE_WIDTH: 0.111416
G1 X103.476 Y119.152 E.00063
; LINE_WIDTH: 0.147282
G1 X103.403 Y119.248 E.00103
; LINE_WIDTH: 0.181656
G1 X103.306 Y119.391 E.00195
G1 X103.329 Y119.569 F30000
; LINE_WIDTH: 0.119478
G1 F15000
G3 X103.399 Y119.155 I8.304 J1.201 E.00262
G1 X103.328 Y120.941 F30000
; LINE_WIDTH: 0.129193
G1 F15000
G1 X103.346 Y121.046 E.00075
; LINE_WIDTH: 0.161466
G1 X103.365 Y121.151 E.00103
; LINE_WIDTH: 0.148175
G2 X103.429 Y121.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111402
G1 X103.487 Y121.348 E.00058
; LINE_WIDTH: 0.0973908
G1 X103.547 Y121.427 E.00044
; WIPE_START
G1 F24000
G1 X103.487 Y121.348 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.054 J1.216 P1  F30000
G1 X107.392 Y121.523 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.129167
G1 F15000
G1 X107.524 Y121.357 E.00149
; LINE_WIDTH: 0.179234
G1 X107.593 Y121.266 E.00126
; LINE_WIDTH: 0.195633
G1 X107.694 Y121.118 E.00224
G1 X107.671 Y120.939 F30000
; LINE_WIDTH: 0.119466
G1 F15000
G3 X107.601 Y121.354 I-8.316 J-1.203 E.00262
G1 X107.672 Y119.567 F30000
; LINE_WIDTH: 0.0969205
G1 F15000
G1 X107.654 Y119.462 E.00047
; LINE_WIDTH: 0.136066
G1 X107.629 Y119.331 E.00101
; LINE_WIDTH: 0.173109
G1 X107.571 Y119.246 E.0011
; LINE_WIDTH: 0.12678
G1 X107.453 Y119.081 E.00138
G1 X107.506 Y128.717 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X107.506 Y121.997 E.20647
G1 X107.387 Y122.024 E.00373
G1 X107.267 Y121.93 E.0047
G1 X107.104 Y122.1 E.00724
G1 X106.706 Y122.381 E.01496
G1 X106.261 Y122.578 E.01496
G1 X105.785 Y122.683 E.01496
G1 X105.299 Y122.691 E.01496
G1 X104.82 Y122.603 E.01496
G1 X104.368 Y122.421 E.01496
G1 X103.954 Y122.147 E.01525
G1 X103.662 Y121.832 E.01321
G1 X103.566 Y121.903 E.00367
G1 X103.494 Y121.889 E.00225
G1 X103.494 Y128.742 E.21055
G2 X156.506 Y128.742 I26.506 J.004 E2.55891
G1 X156.506 Y121.997 E.20723
G1 X156.387 Y122.024 E.00373
G1 X156.267 Y121.93 E.0047
G1 X156.104 Y122.1 E.00724
G1 X155.706 Y122.381 E.01496
G1 X155.261 Y122.578 E.01496
G1 X154.785 Y122.683 E.01496
G1 X154.299 Y122.691 E.01496
G1 X153.82 Y122.603 E.01496
G1 X153.368 Y122.421 E.01496
G1 X152.954 Y122.147 E.01525
G1 X152.662 Y121.832 E.01321
G1 X152.566 Y121.903 E.00367
G1 X152.494 Y121.889 E.00225
G1 X152.494 Y128.769 E.21139
G3 X107.506 Y128.777 I-22.494 J-.021 E2.16985
G1 X107.129 Y128.717 F30000
G1 F15000
G1 X107.129 Y122.546 E.1896
G1 X106.861 Y122.725 E.00988
G1 X106.345 Y122.946 E.01726
G1 X105.795 Y123.06 E.01726
G1 X105.233 Y123.062 E.01726
G1 X104.682 Y122.954 E.01726
G1 X104.163 Y122.738 E.01726
G1 X103.871 Y122.55 E.01068
G1 X103.871 Y128.737 E.19013
G2 X156.129 Y128.737 I26.129 J.009 E2.5228
G1 X156.129 Y122.546 E.19023
G1 X155.861 Y122.725 E.00988
G1 X155.345 Y122.946 E.01726
G1 X154.795 Y123.06 E.01726
G1 X154.233 Y123.062 E.01726
G1 X153.682 Y122.954 E.01726
G1 X153.163 Y122.738 E.01726
G1 X152.871 Y122.55 E.01068
G1 X152.871 Y128.764 E.19096
G3 X107.129 Y128.777 I-22.871 J-.017 E2.2064
G1 X106.752 Y128.717 F30000
G1 F15000
G1 X106.752 Y123.188 E.16989
G1 X106.429 Y123.313 E.01064
G1 X105.804 Y123.437 E.01956
G1 X105.168 Y123.434 E.01956
G1 X104.544 Y123.305 E.01956
G1 X104.248 Y123.189 E.00977
G1 X104.248 Y128.732 E.17034
G2 X155.752 Y128.732 I25.752 J.013 E2.48669
G1 X155.752 Y123.188 E.17037
G1 X155.429 Y123.313 E.01064
G1 X154.804 Y123.437 E.01956
G1 X154.168 Y123.434 E.01956
G1 X153.544 Y123.305 E.01956
G1 X153.248 Y123.189 E.00977
G1 X153.248 Y128.764 E.17132
G3 X106.752 Y128.777 I-23.248 J-.017 E2.2428
G1 X106.375 Y128.717 F30000
G1 F15000
G1 X106.375 Y123.712 E.15377
G1 X105.814 Y123.814 E.01752
G1 X105.102 Y123.805 E.02186
G1 X104.625 Y123.717 E.01489
G1 X104.625 Y128.728 E.15395
G2 X155.375 Y128.728 I25.375 J.018 E2.45057
G1 X155.375 Y123.712 E.15411
G1 X154.814 Y123.814 E.01752
G1 X154.102 Y123.805 E.02186
G1 X153.625 Y123.717 E.01489
G1 X153.625 Y128.764 E.15508
G3 X106.375 Y128.777 I-23.625 J-.017 E2.2792
G1 X105.998 Y128.717 F30000
G1 F15000
G1 X105.998 Y124.169 E.13975
G3 X105.002 Y124.205 I-.891 J-10.716 E.03061
G1 X105.002 Y128.723 E.13882
G2 X154.998 Y128.723 I24.998 J.023 E2.41446
G1 X154.998 Y124.169 E.13994
G3 X154.002 Y124.205 I-.891 J-10.713 E.03061
G1 X154.002 Y128.764 E.14009
G3 X105.998 Y128.777 I-24.002 J-.017 E2.3156
G1 X105.654 Y128.717 F30000
; LINE_WIDTH: 0.351078
G1 F15000
G1 X105.654 Y124.538 E.10494
G1 X105.346 Y124.542 E.00776
G1 X105.346 Y128.719 E.10489
G2 X154.654 Y128.717 I24.654 J.027 E1.94638
G1 X154.654 Y124.538 E.10494
G1 X154.346 Y124.542 E.00776
G3 X154.344 Y128.815 I-190.97 J2.087 E.10731
G3 X105.655 Y128.777 I-24.345 J-.068 E1.91804
; WIPE_START
G1 F24000
G1 X105.683 Y129.917 E-.4334
G1 X105.746 Y130.774 E-.3266
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.251 J1.191 P1  F30000
G1 X152.328 Y120.942 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.129191
G1 F15000
G1 X152.346 Y121.046 E.00075
; LINE_WIDTH: 0.161462
G1 X152.365 Y121.151 E.00103
; LINE_WIDTH: 0.148177
G2 X152.429 Y121.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111404
G1 X152.487 Y121.348 E.00058
; LINE_WIDTH: 0.0973912
G1 X152.547 Y121.427 E.00044
G1 X152.329 Y119.569 F30000
; LINE_WIDTH: 0.119474
G1 F15000
G3 X152.399 Y119.155 I8.309 J1.202 E.00262
G1 X152.476 Y119.152 F30000
; LINE_WIDTH: 0.111416
G1 F15000
G1 X152.544 Y119.061 E.00063
; LINE_WIDTH: 0.0973922
G1 X152.608 Y118.985 E.00044
G1 X152.476 Y119.152 F30000
; LINE_WIDTH: 0.147281
G1 F15000
G1 X152.403 Y119.248 E.00103
; LINE_WIDTH: 0.181656
G1 X152.306 Y119.391 E.00195
G1 X154.346 Y115.971 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F15000
G1 X154.654 Y115.967 E.00778
G1 X154.654 Y111.538 E.11151
G1 X154.346 Y111.542 E.00778
G1 X154.346 Y115.911 E.11
G1 X154.002 Y116.34 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G3 X154.998 Y116.303 I.892 J10.729 E.03061
G1 X154.998 Y111.169 E.15778
G3 X154.002 Y111.205 I-.891 J-10.716 E.03061
G1 X154.002 Y116.28 E.15594
G1 X153.625 Y116.796 F30000
G1 F15000
G1 X154.186 Y116.695 E.01752
G1 X154.898 Y116.703 E.02186
G1 X155.375 Y116.791 E.01489
G1 X155.375 Y110.712 E.18678
G1 X154.814 Y110.814 E.01752
G1 X154.102 Y110.805 E.02186
G1 X153.625 Y110.717 E.01489
G1 X153.625 Y116.736 E.18494
G1 X153.248 Y117.321 F30000
G1 F15000
G1 X153.571 Y117.195 E.01064
G1 X154.196 Y117.072 E.01956
G1 X154.832 Y117.075 E.01956
G1 X155.456 Y117.204 E.01956
G1 X155.752 Y117.32 E.00977
G1 X155.752 Y110.188 E.21914
G1 X155.429 Y110.313 E.01064
G1 X154.804 Y110.437 E.01956
G1 X154.168 Y110.434 E.01956
G1 X153.544 Y110.305 E.01956
G1 X153.248 Y110.189 E.00977
G1 X153.248 Y117.261 E.2173
G1 X152.871 Y117.962 F30000
G1 F15000
G1 X153.139 Y117.784 E.00988
G1 X153.655 Y117.563 E.01726
G1 X154.205 Y117.449 E.01726
G1 X154.767 Y117.446 E.01726
G1 X155.318 Y117.555 E.01726
G1 X155.837 Y117.77 E.01726
G1 X156.129 Y117.959 E.01068
G1 X156.129 Y109.546 E.2585
G1 X155.861 Y109.725 E.00988
G1 X155.345 Y109.946 E.01726
G1 X154.795 Y110.06 E.01726
G1 X154.233 Y110.062 E.01726
G1 X153.682 Y109.954 E.01726
G1 X153.163 Y109.738 E.01726
G1 X152.871 Y109.55 E.01068
G1 X152.871 Y117.902 E.25665
G1 X152.494 Y118.513 F30000
G1 F15000
G1 X152.621 Y118.494 E.00392
G1 X152.733 Y118.579 E.00433
G1 X152.896 Y118.409 E.00724
G1 X153.294 Y118.127 E.01496
G1 X153.739 Y117.931 E.01496
G1 X154.215 Y117.826 E.01496
G1 X154.701 Y117.818 E.01496
G1 X155.18 Y117.906 E.01496
G1 X155.632 Y118.087 E.01496
G1 X156.046 Y118.361 E.01525
G1 X156.338 Y118.677 E.01321
G1 X156.441 Y118.599 E.00395
G1 X156.506 Y118.611 E.00203
G1 X156.506 Y108.997 E.29538
G1 X156.387 Y109.024 E.00373
G1 X156.267 Y108.93 E.0047
G1 X156.104 Y109.1 E.00724
G1 X155.706 Y109.381 E.01496
G1 X155.261 Y109.578 E.01496
G1 X154.785 Y109.683 E.01496
G1 X154.299 Y109.691 E.01496
G1 X153.82 Y109.603 E.01496
G1 X153.368 Y109.421 E.01496
G1 X152.954 Y109.147 E.01525
G1 X152.662 Y108.832 E.01321
G1 X152.566 Y108.903 E.00367
G1 X152.494 Y108.889 E.00225
G1 X152.494 Y118.453 E.29386
G1 X156.453 Y119.081 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126781
G1 F15000
G1 X156.571 Y119.246 E.00138
; LINE_WIDTH: 0.173111
G1 X156.629 Y119.331 E.0011
; LINE_WIDTH: 0.136066
G1 X156.654 Y119.462 E.00101
; LINE_WIDTH: 0.0969205
G1 X156.672 Y119.567 E.00047
G1 X156.671 Y120.939 F30000
; LINE_WIDTH: 0.11947
G1 F15000
G3 X156.601 Y121.354 I-8.327 J-1.205 E.00262
G1 X156.524 Y121.357 F30000
; LINE_WIDTH: 0.179238
G1 F15000
G1 X156.593 Y121.266 E.00126
; LINE_WIDTH: 0.195637
G1 X156.694 Y121.118 E.00224
G1 X156.524 Y121.357 F30000
; LINE_WIDTH: 0.129169
G1 F15000
G1 X156.392 Y121.523 E.00149
G1 X156.392 Y108.523 F30000
; LINE_WIDTH: 0.129162
G1 F15000
G1 X156.524 Y108.357 E.00149
; LINE_WIDTH: 0.179219
G1 X156.593 Y108.266 E.00126
; LINE_WIDTH: 0.195632
G1 X156.694 Y108.118 E.00224
G1 X156.671 Y107.939 F30000
; LINE_WIDTH: 0.119479
G1 F15000
G3 X156.601 Y108.354 I-8.332 J-1.206 E.00262
G1 X156.672 Y106.567 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X156.654 Y106.462 E.00047
; LINE_WIDTH: 0.136067
G1 X156.629 Y106.331 E.00101
; LINE_WIDTH: 0.173111
G1 X156.571 Y106.246 E.0011
; LINE_WIDTH: 0.126782
G1 X156.453 Y106.081 E.00138
G1 X154.346 Y102.971 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F15000
G1 X154.654 Y102.967 E.00778
G1 X154.654 Y102.6 E.00924
G1 X154.346 Y102.6 E.00778
G1 X154.346 Y102.911 E.00783
G1 X154.002 Y103.34 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G3 X154.998 Y103.303 I.891 J10.712 E.03061
G1 X154.998 Y102.257 E.03216
G1 X154.002 Y102.257 E.03058
G1 X154.002 Y103.28 E.03144
M73 P94 R1
G1 X153.625 Y103.796 F30000
G1 F15000
G1 X154.186 Y103.695 E.01752
G1 X154.898 Y103.703 E.02186
G1 X155.375 Y103.791 E.01489
G1 X155.375 Y101.88 E.05873
G1 X153.625 Y101.88 E.05375
G1 X153.625 Y103.736 E.05705
G1 X153.248 Y104.321 F30000
G1 F15000
G1 X153.571 Y104.195 E.01064
G1 X154.196 Y104.072 E.01956
G1 X154.832 Y104.075 E.01956
G1 X155.456 Y104.204 E.01956
G1 X155.752 Y104.32 E.00977
G1 X155.752 Y101.503 E.08657
G1 X153.248 Y101.503 E.07692
G1 X153.248 Y104.261 E.08475
G1 X152.871 Y104.962 F30000
G1 F15000
G1 X153.139 Y104.784 E.00988
G1 X153.655 Y104.563 E.01726
G1 X154.205 Y104.449 E.01726
G1 X154.767 Y104.446 E.01726
G1 X155.318 Y104.555 E.01726
G1 X155.837 Y104.77 E.01726
G1 X156.129 Y104.959 E.01068
G1 X156.129 Y101.126 E.11779
G1 X152.871 Y101.126 E.10009
G1 X152.871 Y104.902 E.11605
G1 X152.494 Y105.513 F30000
G1 F15000
G1 X152.621 Y105.494 E.00392
G1 X152.733 Y105.579 E.00433
G1 X152.896 Y105.409 E.00724
G1 X153.294 Y105.127 E.01496
G1 X153.739 Y104.931 E.01496
G1 X154.215 Y104.826 E.01496
G1 X154.701 Y104.818 E.01496
G1 X155.18 Y104.906 E.01496
G1 X155.632 Y105.087 E.01496
G1 X156.046 Y105.361 E.01525
G1 X156.338 Y105.677 E.01321
G1 X156.441 Y105.599 E.00395
G1 X156.506 Y105.611 E.00203
G1 X156.506 Y100.748 E.1494
G1 X152.494 Y100.748 E.12327
G1 X152.494 Y105.453 E.14456
G1 X152.608 Y105.985 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973912
G1 F15000
G1 X152.544 Y106.061 E.00044
; LINE_WIDTH: 0.111411
G1 X152.476 Y106.152 E.00063
; LINE_WIDTH: 0.147278
G1 X152.403 Y106.248 E.00103
; LINE_WIDTH: 0.181655
G1 X152.306 Y106.391 E.00195
G1 X152.329 Y106.569 F30000
; LINE_WIDTH: 0.119476
G1 F15000
G3 X152.399 Y106.155 I8.337 J1.207 E.00262
G1 X152.328 Y107.942 F30000
; LINE_WIDTH: 0.129187
G1 F15000
G1 X152.346 Y108.046 E.00075
; LINE_WIDTH: 0.161452
G1 X152.365 Y108.151 E.00103
; LINE_WIDTH: 0.148174
G2 X152.429 Y108.263 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111395
G1 X152.487 Y108.348 E.00058
; LINE_WIDTH: 0.0973904
G1 X152.547 Y108.427 E.00044
M106 S239.7
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X152.487 Y108.348 E-.76
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
G3 Z9.2 I-1.211 J.116 P1  F30000
G1 X153.773 Y121.738 Z9.2
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.6 Y121.647 E.006
G3 X154.294 Y118.607 I.9 J-1.394 E.12459
G1 X154.459 Y118.595 E.00509
G3 X153.894 Y121.798 I.041 J1.659 E.18049
G1 X153.827 Y121.765 E.0023
M204 S10000
; WIPE_START
G1 F24000
G1 X153.6 Y121.647 E-.09704
G1 X153.341 Y121.443 E-.12557
G1 X153.128 Y121.19 E-.12563
G1 X152.97 Y120.899 E-.12564
G1 X152.891 Y120.661 E-.09528
G1 X152.842 Y120.337 E-.12464
G1 X152.85 Y120.163 E-.06619
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.202 J.188 P1  F30000
G1 X155.107 Y105.709 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G3 X154.294 Y105.607 I-.607 J1.544 E.2949
G1 X154.459 Y105.595 E.00509
G3 X155.05 Y105.688 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X155.401 Y105.86 E-.14825
G1 X155.655 Y106.062 E-.12361
G1 X155.823 Y106.252 E-.09631
G1 X155.996 Y106.534 E-.12563
G1 X156.109 Y106.845 E-.12564
G1 X156.158 Y107.172 E-.12563
G1 X156.156 Y107.211 E-.01493
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.033 J-1.217 P1  F30000
G1 X104.665 Y105.82 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X104.67 Y105.817 E.00018
G3 X105.294 Y105.607 I.83 J1.437 E.02035
G1 X105.459 Y105.595 E.00509
G3 X104.531 Y105.906 I.041 J1.659 E.28981
G1 X104.614 Y105.852 E.00306
M204 S10000
; WIPE_START
G1 F24000
G1 X104.67 Y105.817 E-.02509
G1 X104.971 Y105.68 E-.12564
G1 X105.294 Y105.607 E-.12563
G1 X105.459 Y105.595 E-.06289
G1 X105.788 Y105.619 E-.12564
G1 X106.107 Y105.709 E-.12564
G1 X106.401 Y105.86 E-.12563
G1 X106.491 Y105.931 E-.04384
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.217 J.027 P1  F30000
G1 X106.83 Y121.234 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X106.716 Y121.382 E.00576
G3 X105.294 Y118.607 I-1.216 J-1.129 E.19574
G1 X105.459 Y118.595 E.00509
G3 X106.915 Y121.119 I.041 J1.659 E.10935
G1 X106.866 Y121.186 E.00254
M204 S10000
; WIPE_START
G1 F24000
G1 X106.716 Y121.382 E-.09406
G1 X106.469 Y121.602 E-.12557
G1 X106.183 Y121.768 E-.12564
G1 X105.869 Y121.873 E-.12563
G1 X105.541 Y121.914 E-.12563
G1 X105.212 Y121.889 E-.12564
G1 X105.116 Y121.862 E-.03783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.21 J-.133 P1  F30000
G1 X102.71 Y99.964 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.29 Y99.964 E.17146
G1 X108.29 Y128.757 E.88472
G2 X151.71 Y128.757 I21.71 J-.009 E2.09515
G1 X151.71 Y99.964 E.88472
G1 X157.29 Y99.964 E.17146
G1 X157.29 Y128.752 E.88456
G3 X102.71 Y128.752 I-27.29 J-.006 E2.63398
G1 X102.71 Y100.024 E.88271
M204 S10000
; WIPE_START
G1 F24000
G1 X104.71 Y100.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.022 J1.217 P1  F30000
G1 X157.083 Y100.956 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X156.299 Y100.172 E.03407
G1 X155.765 Y100.172
G1 X157.083 Y101.489 E.05725
G1 X157.083 Y102.022
G1 X155.232 Y100.172 E.08042
G1 X154.699 Y100.172
G1 X157.083 Y102.556 E.10359
G1 X157.083 Y103.089
G1 X154.165 Y100.172 E.12677
G1 X153.632 Y100.172
G1 X157.083 Y103.622 E.14994
G1 X157.083 Y104.155
G1 X153.099 Y100.172 E.17311
G1 X152.566 Y100.172
G1 X157.083 Y104.689 E.19628
G1 X157.083 Y105.222
G1 X152.032 Y100.172 E.21946
G1 X151.917 Y100.59
G1 X157.083 Y105.755 E.22445
G1 X157.083 Y106.288
G1 X151.917 Y101.123 E.22445
G1 X151.917 Y101.657
G1 X157.083 Y106.822 E.22445
G1 X156.175 Y106.448
G1 X157.083 Y107.355 E.03942
G1 X157.083 Y107.888
G1 X156.357 Y107.163 E.03152
G1 X156.319 Y107.658
G1 X157.083 Y108.422 E.03316
G1 X157.083 Y108.955
G1 X156.186 Y108.058 E.03896
G1 X155.984 Y108.389
G1 X157.083 Y109.488 E.04776
G1 X157.083 Y110.021
G1 X155.725 Y108.664 E.059
G1 X155.411 Y108.883
G1 X157.083 Y110.555 E.07264
G1 X157.083 Y111.088
G1 X155.034 Y109.04 E.08901
G1 X154.574 Y109.112
G1 X157.083 Y111.621 E.10902
G1 X157.083 Y112.154
G1 X153.973 Y109.045 E.13512
M204 S10000
; WIPE_START
G1 F24000
G1 X155.387 Y110.459 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J-.022 P1  F30000
G1 X155.297 Y105.57 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X151.917 Y102.19 E.14688
G1 X151.917 Y102.723
G1 X154.586 Y105.392 E.11598
G1 X154.1 Y105.438
G1 X151.917 Y103.256 E.09482
G1 X151.917 Y103.79
G1 X153.702 Y105.574 E.07756
G1 X153.371 Y105.776
G1 X151.917 Y104.323 E.06315
G1 X151.917 Y104.856
G1 X153.096 Y106.034 E.05119
G1 X152.875 Y106.347
G1 X151.917 Y105.389 E.04162
G1 X151.917 Y105.923
G1 X152.715 Y106.721 E.03468
G1 X152.634 Y107.173
G1 X151.917 Y106.456 E.03115
G1 X151.917 Y106.989
G1 X152.71 Y107.782 E.03443
G1 X151.917 Y107.522
G1 X157.083 Y112.688 E.22445
G1 X157.083 Y113.221
G1 X151.917 Y108.056 E.22445
G1 X151.917 Y108.589
G1 X157.083 Y113.754 E.22445
G1 X157.083 Y114.288
G1 X151.917 Y109.122 E.22445
G1 X151.917 Y109.656
G1 X157.083 Y114.821 E.22445
G1 X157.083 Y115.354
G1 X151.917 Y110.189 E.22445
G1 X151.917 Y110.722
G1 X157.083 Y115.887 E.22445
G1 X157.083 Y116.421
G1 X151.917 Y111.255 E.22445
G1 X151.917 Y111.789
G1 X157.083 Y116.954 E.22445
G1 X157.083 Y117.487
M73 P94 R0
G1 X151.917 Y112.322 E.22445
G1 X151.917 Y112.855
G1 X157.083 Y118.02 E.22445
G1 X157.083 Y118.554
G1 X151.917 Y113.388 E.22445
G1 X151.917 Y113.922
G1 X157.083 Y119.087 E.22445
G1 X157.083 Y119.62
G1 X151.917 Y114.455 E.22445
G1 X151.917 Y114.988
G1 X157.083 Y120.153 E.22445
G1 X156.34 Y119.944
G1 X157.083 Y120.687 E.03228
G1 X157.083 Y121.22
G1 X156.346 Y120.483 E.03201
G1 X156.24 Y120.911
G1 X157.083 Y121.753 E.03662
G1 X157.083 Y122.287
G1 X156.061 Y121.265 E.04438
G1 X155.824 Y121.561
G1 X157.083 Y122.82 E.0547
G1 X157.083 Y123.353
G1 X155.532 Y121.802 E.06738
G1 X155.182 Y121.986
G1 X157.083 Y123.886 E.08257
G1 X157.083 Y124.42
G1 X154.764 Y122.101 E.10075
G1 X154.223 Y122.094
G1 X157.083 Y124.953 E.12425
M204 S10000
; WIPE_START
G1 F24000
G1 X155.668 Y123.539 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.201 J-.2 P1  F30000
G1 X154.818 Y118.422 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X151.917 Y115.522 E.12605
G1 X151.917 Y116.055
G1 X154.264 Y118.401 E.10195
G1 X153.841 Y118.512
G1 X151.917 Y116.588 E.08359
G1 X151.917 Y117.121
G1 X153.488 Y118.692 E.06825
G1 X153.192 Y118.93
G1 X151.917 Y117.655 E.05541
G1 X151.917 Y118.188
G1 X152.952 Y119.222 E.04494
G1 X152.769 Y119.573
G1 X151.917 Y118.721 E.03702
G1 X151.917 Y119.254
G1 X152.659 Y119.996 E.03221
G1 X152.652 Y120.522
G1 X151.917 Y119.788 E.03191
G1 X151.917 Y120.321
G1 X157.083 Y125.486 E.22445
G1 X157.083 Y126.019
G1 X151.917 Y120.854 E.22445
G1 X151.917 Y121.388
G1 X157.083 Y126.553 E.22445
G1 X157.083 Y127.086
G1 X151.917 Y121.921 E.22445
G1 X151.917 Y122.454
G1 X157.083 Y127.619 E.22445
G1 X157.083 Y128.153
G1 X151.917 Y122.987 E.22445
G1 X151.917 Y123.521
G1 X157.083 Y128.686 E.22445
G1 X157.071 Y129.208
G1 X151.917 Y124.054 E.22396
G1 X151.917 Y124.587
G1 X157.058 Y129.728 E.22339
G1 X157.038 Y130.241
G1 X151.917 Y125.12 E.22253
G1 X151.917 Y125.654
G1 X157.001 Y130.737 E.22091
G1 X156.964 Y131.233
G1 X151.917 Y126.187 E.21928
G1 X151.917 Y126.72
G1 X156.915 Y131.717 E.21715
G1 X156.855 Y132.191
G1 X151.917 Y127.253 E.21457
G1 X151.917 Y127.787
G1 X156.796 Y132.665 E.21199
G1 X156.721 Y133.124
G1 X151.917 Y128.32 E.20875
G1 X151.915 Y128.851
G1 X156.641 Y133.577 E.20538
G1 X156.561 Y134.031
G1 X151.902 Y129.371 E.20247
M73 P95 R0
G1 X151.887 Y129.89
G1 X156.466 Y134.469 E.19898
G1 X156.367 Y134.903
G1 X151.85 Y130.386 E.19629
G1 X151.813 Y130.882
G1 X156.268 Y135.337 E.1936
G1 X156.155 Y135.757
G1 X151.756 Y131.358 E.19116
G1 X151.696 Y131.832
G1 X156.038 Y136.173 E.18866
G1 X155.921 Y136.59
G1 X151.625 Y132.293 E.18669
G1 X151.545 Y132.747
G1 X155.793 Y136.995 E.18459
G1 X155.659 Y137.394
G1 X151.46 Y133.196 E.18243
G1 X151.361 Y133.63
G1 X155.524 Y137.793 E.18091
G1 X155.383 Y138.185
G1 X151.262 Y134.064 E.17908
G1 X151.149 Y134.484
G1 X155.233 Y138.568 E.17746
G1 X155.083 Y138.951
G1 X151.032 Y134.901 E.17601
G1 X150.911 Y135.313
G1 X154.93 Y139.332 E.17465
G1 X154.764 Y139.699
G1 X150.777 Y135.712 E.17327
G1 X150.643 Y136.111
G1 X154.598 Y140.067 E.17189
G1 X154.432 Y140.434
G1 X150.498 Y136.5 E.17097
G1 X150.348 Y136.882
G1 X154.255 Y140.789 E.16977
G1 X154.074 Y141.142
G1 X150.197 Y137.265 E.16845
G1 X150.032 Y137.633
G1 X153.893 Y141.494 E.1678
G1 X153.707 Y141.841
G1 X149.866 Y138 E.1669
G1 X149.696 Y138.364
G1 X153.511 Y142.179 E.16581
G1 X153.316 Y142.517
G1 X149.515 Y138.716 E.16518
G1 X149.334 Y139.069
G1 X153.121 Y142.855 E.16455
G1 X152.913 Y143.18
G1 X149.146 Y139.414 E.16368
G1 X148.951 Y139.752
G1 X152.703 Y143.504 E.16307
G1 X152.494 Y143.828
G1 X148.756 Y140.09 E.16245
G1 X148.55 Y140.418
G1 X152.279 Y144.146 E.16202
G1 X152.056 Y144.457
G1 X148.341 Y140.742 E.16143
G1 X148.132 Y141.066
G1 X151.833 Y144.767 E.16083
G1 X151.61 Y145.077
G1 X147.91 Y141.377 E.16076
G1 X147.687 Y141.688
G1 X151.374 Y145.375 E.16023
G1 X151.138 Y145.672
G1 X147.464 Y141.998 E.15966
G1 X147.227 Y142.294
G1 X150.901 Y145.968 E.15966
G1 X150.66 Y146.26
G1 X146.991 Y142.591 E.15946
G1 X146.752 Y142.886
G1 X150.41 Y146.544 E.15896
G1 X150.16 Y146.827
G1 X146.502 Y143.169 E.15896
G1 X146.252 Y143.452
G1 X149.91 Y147.11 E.15896
G1 X149.65 Y147.383
G1 X145.998 Y143.732 E.15867
G1 X145.735 Y144.002
G1 X149.386 Y147.653 E.15867
G1 X149.123 Y147.923
G1 X145.472 Y144.272 E.15867
G1 X145.204 Y144.537
G1 X148.857 Y148.191 E.15877
G1 X148.581 Y148.447
G1 X144.927 Y144.794 E.15877
G1 X144.651 Y145.05
G1 X148.304 Y148.704 E.15877
G1 X148.027 Y148.961
G1 X144.368 Y145.301 E.15904
G1 X144.078 Y145.544
G1 X147.743 Y149.209 E.15926
G1 X147.453 Y149.452
G1 X143.788 Y145.787 E.15926
G1 X143.49 Y146.023
G1 X147.163 Y149.696 E.1596
G1 X146.872 Y149.938
G1 X143.187 Y146.253 E.16016
G1 X142.883 Y146.483
G1 X146.569 Y150.168 E.16016
G1 X146.265 Y150.398
G1 X142.57 Y146.703 E.16058
G1 X142.253 Y146.919
G1 X145.962 Y150.628 E.16117
G1 X145.652 Y150.851
G1 X141.936 Y147.135 E.16147
G1 X141.607 Y147.339
G1 X145.335 Y151.067 E.16199
G1 X145.018 Y151.283
G1 X141.276 Y147.542 E.16259
G1 X140.944 Y147.743
G1 X144.7 Y151.5 E.16323
G1 X144.37 Y151.702
G1 X140.599 Y147.931 E.16386
G1 X140.254 Y148.119
G1 X144.039 Y151.904 E.16448
G1 X143.708 Y152.107
G1 X139.905 Y148.303 E.16526
G1 X139.545 Y148.477
G1 X143.37 Y152.302 E.16621
G1 X143.024 Y152.49
G1 X139.185 Y148.65 E.16685
G1 X138.817 Y148.815
G1 X142.679 Y152.678 E.16784
G1 X142.333 Y152.865
G1 X138.442 Y148.974 E.1691
G1 X138.067 Y149.132
G1 X141.973 Y153.038 E.16976
G1 X141.613 Y153.212
G1 X137.678 Y149.277 E.171
G1 X137.287 Y149.419
G1 X141.253 Y153.385 E.17235
G1 X140.883 Y153.548
G1 X136.893 Y149.558 E.1734
G1 X136.485 Y149.683
G1 X140.508 Y153.706 E.17481
G1 X140.133 Y153.864
G1 X136.077 Y149.809 E.17622
G1 X135.658 Y149.923
G1 X139.752 Y154.017 E.17787
G1 X139.361 Y154.159
G1 X135.233 Y150.032 E.17935
G1 X134.805 Y150.137
G1 X138.97 Y154.301 E.18096
G1 X138.577 Y154.441
G1 X134.362 Y150.226 E.18316
G1 X133.918 Y150.316
G1 X138.169 Y154.567 E.18473
G1 X137.762 Y154.693
G1 X133.46 Y150.391 E.18695
G1 X132.996 Y150.46
G1 X137.354 Y154.819 E.18938
G1 X136.93 Y154.928
G1 X132.524 Y150.522 E.19145
G1 X132.039 Y150.57
G1 X136.505 Y155.036 E.19405
G1 X136.08 Y155.144
G1 X131.551 Y150.615 E.19682
G1 X131.043 Y150.64
G1 X135.639 Y155.236 E.19971
G1 X135.195 Y155.326
G1 X130.534 Y150.665 E.20254
G1 X130.001 Y150.665
G1 X134.751 Y155.415 E.20643
G1 X134.29 Y155.488
G1 X129.468 Y150.665 E.20956
G1 X128.907 Y150.638
G1 X133.827 Y155.557 E.21378
G1 X133.363 Y155.627
G1 X128.345 Y150.609 E.21807
G1 X127.752 Y150.549
G1 X132.878 Y155.676 E.22277
G1 X132.394 Y155.724
G1 X127.153 Y150.483 E.22773
G1 X126.525 Y150.389
G1 X131.903 Y155.767 E.23371
G1 X131.395 Y155.792
G1 X125.878 Y150.275 E.23976
G1 X125.21 Y150.14
G1 X130.888 Y155.818 E.24673
G1 X130.365 Y155.828
G1 X124.5 Y149.964 E.25484
G1 X123.763 Y149.76
G1 X129.831 Y155.828 E.26369
G1 X129.297 Y155.827
G1 X122.99 Y149.52 E.27409
G1 X122.151 Y149.214
G1 X128.736 Y155.799 E.28613
G1 X128.174 Y155.771
G1 X121.245 Y148.842 E.30111
G1 X120.246 Y148.376
G1 X127.593 Y155.723 E.31924
M73 P96 R0
G1 X127 Y155.663
G1 X119.109 Y147.773 E.34289
M204 S10000
; WIPE_START
G1 F24000
G1 X120.524 Y149.187 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.768 J-.944 P1  F30000
G1 X117.67 Y146.867 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X126.394 Y155.591 E.3791
G1 X125.766 Y155.496
G1 X114.95 Y144.679 E.47004
M204 S10000
; WIPE_START
G1 F24000
G1 X116.364 Y146.094 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.197 J-.22 P1  F30000
G1 X108.083 Y101.017 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X107.238 Y100.172 E.03672
G1 X106.704 Y100.172
G1 X108.083 Y101.55 E.05989
G1 X108.083 Y102.083
G1 X106.171 Y100.172 E.08306
G1 X105.638 Y100.172
G1 X108.083 Y102.616 E.10624
G1 X108.083 Y103.15
G1 X105.105 Y100.172 E.12941
G1 X104.571 Y100.172
G1 X108.083 Y103.683 E.15258
G1 X108.083 Y104.216
G1 X104.038 Y100.172 E.17576
G1 X103.505 Y100.172
G1 X108.083 Y104.75 E.19893
G1 X108.083 Y105.283
G1 X102.971 Y100.172 E.2221
G1 X102.917 Y100.651
G1 X108.083 Y105.816 E.22445
G1 X108.083 Y106.349
G1 X102.917 Y101.184 E.22445
G1 X102.917 Y101.717
G1 X108.083 Y106.883 E.22445
G1 X107.232 Y106.565
G1 X108.083 Y107.416 E.03697
G1 X108.083 Y107.949
G1 X107.36 Y107.227 E.03139
G1 X107.312 Y107.711
G1 X108.083 Y108.482 E.03351
G1 X108.083 Y109.016
G1 X107.164 Y108.097 E.03992
G1 X106.954 Y108.421
G1 X108.083 Y109.549 E.04903
G1 X108.083 Y110.082
G1 X106.69 Y108.689 E.06054
G1 X106.369 Y108.902
G1 X108.083 Y110.615 E.07446
G1 X108.083 Y111.149
G1 X105.985 Y109.051 E.09116
G1 X105.514 Y109.114
G1 X108.083 Y111.682 E.1116
G1 X108.083 Y112.215
G1 X104.873 Y109.006 E.13947
M204 S10000
; WIPE_START
G1 F24000
G1 X106.287 Y110.42 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J-.022 P1  F30000
G1 X106.197 Y105.53 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X102.917 Y102.251 E.14252
G1 X102.917 Y102.784
G1 X105.527 Y105.394 E.1134
G1 X105.05 Y105.45
G1 X102.917 Y103.317 E.09267
G1 X102.917 Y103.85
G1 X104.66 Y105.593 E.07573
G1 X104.335 Y105.802
G1 X102.917 Y104.384 E.06161
G1 X102.917 Y104.917
G1 X104.066 Y106.066 E.04992
G1 X103.852 Y106.385
G1 X102.917 Y105.45 E.04062
G1 X102.917 Y105.984
G1 X103.699 Y106.765 E.03397
G1 X103.637 Y107.237
G1 X102.917 Y106.517 E.03129
G1 X102.917 Y107.05
G1 X103.745 Y107.877 E.03595
G1 X102.917 Y107.583
G1 X108.083 Y112.749 E.22445
G1 X108.083 Y113.282
G1 X102.917 Y108.117 E.22445
G1 X102.917 Y108.65
G1 X108.083 Y113.815 E.22445
G1 X108.083 Y114.348
G1 X102.917 Y109.183 E.22445
G1 X102.917 Y109.716
G1 X108.083 Y114.882 E.22445
G1 X108.083 Y115.415
G1 X102.917 Y110.25 E.22445
G1 X102.917 Y110.783
G1 X108.083 Y115.948 E.22445
G1 X108.083 Y116.481
G1 X102.917 Y111.316 E.22445
G1 X102.917 Y111.85
G1 X108.083 Y117.015 E.22445
G1 X108.083 Y117.548
G1 X102.917 Y112.383 E.22445
G1 X102.917 Y112.916
G1 X108.083 Y118.081 E.22445
G1 X108.083 Y118.615
G1 X102.917 Y113.449 E.22445
G1 X102.917 Y113.983
G1 X108.083 Y119.148 E.22445
G1 X108.083 Y119.681
G1 X102.917 Y114.516 E.22445
G1 X102.917 Y115.049
G1 X106.714 Y118.846 E.16497
G1 X105.744 Y118.409
G1 X102.917 Y115.582 E.12284
G1 X102.917 Y116.116
G1 X105.214 Y118.412 E.0998
G1 X104.799 Y118.531
G1 X102.917 Y116.649 E.08177
G1 X102.917 Y117.182
G1 X104.452 Y118.717 E.06671
G1 X104.163 Y118.961
G1 X102.917 Y117.715 E.05414
G1 X102.917 Y118.249
G1 X103.929 Y119.26 E.04394
G1 X103.753 Y119.618
G1 X102.917 Y118.782 E.03631
G1 X102.917 Y119.315
G1 X103.651 Y120.049 E.03186
G1 X103.668 Y120.599
G1 X102.917 Y119.849 E.03261
M204 S10000
; WIPE_START
G1 F24000
G1 X103.668 Y120.599 E-.40328
G1 X103.651 Y120.049 E-.20929
G1 X103.376 Y119.774 E-.14743
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.24 J1.193 P1  F30000
G1 X106.927 Y119.059 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X108.083 Y120.214 E.05021
G1 X108.083 Y120.748
G1 X107.35 Y120.015 E.03185
G1 X107.338 Y120.536
G1 X108.083 Y121.281 E.03236
G1 X108.083 Y121.814
G1 X107.224 Y120.955 E.03733
G1 X107.038 Y121.303
G1 X108.083 Y122.347 E.04538
G1 X108.083 Y122.881
G1 X106.795 Y121.593 E.05597
G1 X106.497 Y121.828
G1 X108.083 Y123.414 E.06892
G1 X108.083 Y123.947
G1 X106.141 Y122.005 E.08439
G1 X105.711 Y122.109
G1 X108.083 Y124.481 E.10305
G1 X108.083 Y125.014
G1 X105.149 Y122.081 E.12746
M204 S10000
; WIPE_START
G1 F24000
G1 X106.564 Y123.495 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.79 J-.926 P1  F30000
G1 X102.917 Y120.382 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X108.083 Y125.547 E.22445
G1 X108.083 Y126.08
G1 X102.917 Y120.915 E.22445
G1 X102.917 Y121.448
G1 X108.083 Y126.614 E.22445
G1 X108.083 Y127.147
G1 X102.917 Y121.982 E.22445
G1 X102.917 Y122.515
G1 X108.083 Y127.68 E.22445
G1 X108.083 Y128.213
G1 X102.917 Y123.048 E.22445
G1 X102.917 Y123.581
G1 X108.083 Y128.747 E.22445
G1 X108.096 Y129.293
G1 X102.917 Y124.115 E.22503
G1 X102.917 Y124.648
G1 X108.11 Y129.84 E.22562
G1 X108.152 Y130.416
G1 X102.917 Y125.181 E.22749
G1 X102.917 Y125.715
G1 X108.199 Y130.996 E.2295
G1 X108.275 Y131.606
G1 X102.917 Y126.248 E.23282
G1 X102.917 Y126.781
G1 X108.364 Y132.227 E.23667
G1 X108.478 Y132.875
G1 X102.917 Y127.314 E.24163
G1 X102.917 Y127.848
G1 X108.621 Y133.551 E.24783
G1 X108.784 Y134.248
G1 X102.917 Y128.381 E.25494
G1 X102.922 Y128.918
G1 X108.993 Y134.99 E.26383
G1 X109.244 Y135.774
G1 X102.935 Y129.465 E.27416
G1 X102.949 Y130.012
G1 X109.544 Y136.608 E.28661
G1 X109.912 Y137.509
G1 X102.987 Y130.584 E.30093
G1 X103.03 Y131.16
G1 X110.379 Y138.509 E.31934
M204 S10000
; WIPE_START
G1 F24000
M73 P97 R0
G1 X108.965 Y137.095 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.954 J.756 P1  F30000
G1 X110.995 Y139.658 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X103.09 Y131.753 E.34351
G1 X103.166 Y132.363
G1 X111.866 Y141.063 E.37805
M204 S10000
; WIPE_START
G1 F24000
G1 X110.452 Y139.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.919 J.798 P1  F30000
G1 X113.973 Y143.702 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X103.254 Y132.984 E.46578
G1 X103.368 Y133.631
G1 X125.128 Y155.391 E.94558
G1 X124.46 Y155.256
G1 X103.493 Y134.289 E.91111
G1 X103.651 Y134.98
G1 X123.779 Y155.108 E.87466
G1 X123.063 Y154.926
G1 X103.826 Y135.688 E.83596
G1 X104.034 Y136.43
G1 X122.323 Y154.719 E.79473
G1 X121.552 Y154.481
G1 X104.279 Y137.208 E.75059
G1 X104.549 Y138.011
G1 X120.729 Y154.192 E.7031
G1 X119.869 Y153.865
G1 X104.893 Y138.889 E.65079
G1 X105.291 Y139.82
G1 X118.947 Y153.476 E.59343
G1 X117.929 Y152.991
G1 X105.765 Y140.827 E.52858
M204 S10000
; WIPE_START
G1 F24000
G1 X107.179 Y142.241 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.402 J-1.149 P1  F30000
G1 X106.359 Y141.954 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X116.797 Y152.393 E.4536
M204 S10000
; WIPE_START
G1 F24000
G1 X115.383 Y150.978 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.202 J.191 P1  F30000
G1 X115.484 Y151.612 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X107.153 Y143.282 E.36202
M204 S10000
; WIPE_START
G1 F24000
G1 X108.567 Y144.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.943 J-.769 P1  F30000
G1 X108.327 Y144.99 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X113.74 Y150.402 E.2352
M204 S10000
; WIPE_START
G1 F24000
G1 X112.326 Y148.988 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.211 J-.124 P1  F30000
G1 X108.05 Y107.117 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.127397
G1 F15000
G1 X108.083 Y106.935 E.00127
G1 X107.268 Y106.468 F30000
; LINE_WIDTH: 0.1991
G1 F15000
G1 X107.197 Y106.367 E.00157
; LINE_WIDTH: 0.171686
G1 X107.119 Y106.259 E.0014
; LINE_WIDTH: 0.145771
G1 X107 Y106.121 E.00153
; LINE_WIDTH: 0.105282
G1 X106.669 Y105.78 E.00242
; LINE_WIDTH: 0.106453
G1 X106.525 Y105.664 E.00095
; LINE_WIDTH: 0.162594
G2 X106.264 Y105.463 I-2.133 J2.494 E.00322
; WIPE_START
G1 F24000
G1 X106.525 Y105.664 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.212 J-.108 P1  F30000
G1 X105.399 Y118.33 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0936597
G1 F15000
G2 X105.241 Y118.409 I.697 J1.597 E.00073
; WIPE_START
G1 F24000
G1 X105.399 Y118.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.213 J-.1 P1  F30000
G1 X105.083 Y122.146 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.175074
G1 F15000
G3 X104.801 Y121.987 I1.477 J-2.953 E.0035
; WIPE_START
G1 F24000
G1 X105.083 Y122.146 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.204 J.175 P1  F30000
G1 X108.388 Y144.929 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.23369
G1 F15000
G1 X108.168 Y144.671 E.00527
; LINE_WIDTH: 0.185184
G1 X107.949 Y144.412 E.00393
; LINE_WIDTH: 0.136677
G1 X107.729 Y144.154 E.00259
; WIPE_START
G1 F24000
G1 X107.949 Y144.412 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.036 J-.639 P1  F30000
G1 X107.213 Y143.221 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.228631
G1 F15000
G1 X107.067 Y143.039 E.00353
; LINE_WIDTH: 0.189163
G1 X106.92 Y142.858 E.00278
; LINE_WIDTH: 0.149697
G1 X106.842 Y142.756 E.00112
; LINE_WIDTH: 0.118933
G1 X106.763 Y142.653 E.0008
G1 X106.42 Y141.893 F30000
; LINE_WIDTH: 0.223577
G1 F15000
G1 X106.259 Y141.683 E.00389
; LINE_WIDTH: 0.178304
G1 X106.166 Y141.557 E.00173
; LINE_WIDTH: 0.133237
G1 X106.074 Y141.43 E.00115
G1 X105.826 Y140.766 F30000
; LINE_WIDTH: 0.218525
G1 F15000
G1 X105.726 Y140.629 E.00242
; LINE_WIDTH: 0.17978
G1 X105.627 Y140.492 E.00189
; LINE_WIDTH: 0.141035
G1 X105.579 Y140.422 E.00068
; LINE_WIDTH: 0.114603
G1 X105.531 Y140.352 E.00049
; WIPE_START
G1 F24000
G1 X105.579 Y140.422 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.212 J-.112 P1  F30000
G1 X103.774 Y120.946 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X103.691 Y120.823 E.00055
; LINE_WIDTH: 0.136739
G1 X103.597 Y120.669 E.00137
; WIPE_START
G1 F24000
G1 X103.691 Y120.823 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.215 J-.067 P1  F30000
G1 X102.948 Y107.348 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.125346
G1 F15000
G1 X102.917 Y107.527 E.00123
; WIPE_START
G1 F24000
G1 X102.948 Y107.348 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.849 J.872 P1  F30000
G1 X104.027 Y108.397 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X103.931 Y108.282 E.00055
; LINE_WIDTH: 0.115605
G1 X103.83 Y108.158 E.00094
; LINE_WIDTH: 0.142671
G1 X103.709 Y107.979 E.00176
; WIPE_START
G1 F24000
G1 X103.83 Y108.158 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.835 J.886 P1  F30000
G1 X104.803 Y109.076 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.157378
G1 F15000
G1 X104.626 Y108.947 E.00204
; LINE_WIDTH: 0.153844
G1 X104.496 Y108.842 E.00151
; LINE_WIDTH: 0.121007
G1 X104.367 Y108.738 E.00106
; WIPE_START
G1 F24000
G1 X104.496 Y108.842 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.176 J.312 P1  F30000
G1 X107.409 Y119.807 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0961619
G1 F15000
G1 X107.337 Y120.028 E.00101
; WIPE_START
G1 F24000
G1 X107.409 Y119.807 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.214 J.085 P1  F30000
G1 X108.088 Y129.552 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0996402
G1 F15000
G1 X108.088 Y129.302 E.00116
; WIPE_START
G1 F24000
G1 X108.088 Y129.552 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.208 J.15 P1  F30000
G1 X108.537 Y133.179 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.123842
G1 F15000
G1 X108.41 Y132.942 E.00177
; WIPE_START
G1 F24000
G1 X108.537 Y133.179 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.156 J.381 P1  F30000
G1 X110.111 Y137.947 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881696
G1 F15000
G1 X110.044 Y137.851 E.00043
; LINE_WIDTH: 0.127514
G1 X109.978 Y137.755 E.00081
; LINE_WIDTH: 0.185644
G1 X109.85 Y137.571 E.0026
; WIPE_START
G1 F24000
G1 X109.978 Y137.755 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.078 J.565 P1  F30000
G1 X110.63 Y138.999 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.088171
G1 F15000
G1 X110.526 Y138.856 E.00065
; LINE_WIDTH: 0.131605
G1 X110.422 Y138.713 E.00128
; LINE_WIDTH: 0.175038
G1 X110.318 Y138.57 E.0019
; WIPE_START
G1 F24000
G1 X110.422 Y138.713 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.045 J.624 P1  F30000
G1 X111.323 Y140.224 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0883086
G1 F15000
G1 X111.292 Y140.186 E.00018
; LINE_WIDTH: 0.0938462
G1 X111.173 Y140.03 E.00081
; LINE_WIDTH: 0.13709
G1 X111.053 Y139.875 E.0015
; LINE_WIDTH: 0.180335
G1 X110.934 Y139.719 E.00219
; WIPE_START
G1 F24000
G1 X111.053 Y139.875 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.999 J.695 P1  F30000
G1 X112.454 Y141.888 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X112.238 Y141.633 E.00123
; LINE_WIDTH: 0.135972
G1 X112.021 Y141.378 E.00254
; LINE_WIDTH: 0.183773
G1 X111.805 Y141.124 E.00384
; WIPE_START
G1 F24000
G1 X112.021 Y141.378 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.926 J.79 P1  F30000
G1 X114.89 Y144.739 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.239633
G1 F15000
G1 X113.913 Y143.762 E.02215
; WIPE_START
G1 F24000
G1 X114.89 Y144.739 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.763 J.948 P1  F30000
G1 X117.61 Y146.927 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.231159
G1 F15000
G1 X117.399 Y146.752 E.0042
; LINE_WIDTH: 0.188416
G1 X117.186 Y146.576 E.00328
; LINE_WIDTH: 0.146046
G1 X117.018 Y146.43 E.00187
; LINE_WIDTH: 0.117108
G1 X116.85 Y146.283 E.00135
; WIPE_START
G1 F24000
G1 X117.018 Y146.43 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.65 J1.029 P1  F30000
G1 X119.122 Y147.76 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.166675
G1 F15000
G1 X119.017 Y147.774 E.00107
; LINE_WIDTH: 0.171501
G1 X118.997 Y147.776 E.00022
; LINE_WIDTH: 0.218016
G1 X118.976 Y147.779 E.00029
G1 X118.902 Y147.72 E.00135
; LINE_WIDTH: 0.200251
G1 X118.772 Y147.618 E.00212
; LINE_WIDTH: 0.162891
G1 X118.642 Y147.515 E.00162
; LINE_WIDTH: 0.12553
G1 X118.511 Y147.413 E.00112
; WIPE_START
G1 F24000
G1 X118.642 Y147.515 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.624 J1.045 P1  F30000
G1 X120.185 Y148.438 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.215998
G1 F15000
G1 X120.084 Y148.367 E.00174
; LINE_WIDTH: 0.188767
M73 P98 R0
G1 X119.981 Y148.294 E.0015
; LINE_WIDTH: 0.161868
G1 X119.91 Y148.241 E.00086
; LINE_WIDTH: 0.136604
G1 X119.756 Y148.126 E.00147
; WIPE_START
G1 F24000
G1 X119.91 Y148.241 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.524 J1.098 P1  F30000
G1 X122.087 Y149.279 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.184079
G1 F15000
G1 X121.972 Y149.204 E.00158
; LINE_WIDTH: 0.182618
G1 X121.902 Y149.156 E.00097
; LINE_WIDTH: 0.149963
G1 X121.831 Y149.109 E.00074
; LINE_WIDTH: 0.117307
G1 X121.75 Y149.054 E.0006
; WIPE_START
G1 F24000
G1 X121.831 Y149.109 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.435 J1.137 P1  F30000
G1 X123.699 Y149.824 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.108763
G1 F15000
G1 X123.41 Y149.649 E.00181
; WIPE_START
G1 F24000
G1 X123.699 Y149.824 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.806 J-.912 P1  F30000
G1 X119.365 Y153.653 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881689
G1 F15000
G1 X119.246 Y153.573 E.00053
; LINE_WIDTH: 0.129089
G1 X119.128 Y153.494 E.001
; LINE_WIDTH: 0.17001
G1 X119.01 Y153.414 E.00148
; WIPE_START
G1 F24000
G1 X119.128 Y153.494 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.501 J-1.109 P1  F30000
G1 X117.321 Y152.677 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X117.167 Y152.562 E.00071
; LINE_WIDTH: 0.132464
G1 X117.012 Y152.447 E.0014
; LINE_WIDTH: 0.176758
G1 X116.858 Y152.331 E.0021
G1 X116.093 Y151.984 F30000
; LINE_WIDTH: 0.0881696
G1 F15000
G1 X115.91 Y151.84 E.00086
; LINE_WIDTH: 0.134148
G1 X115.727 Y151.696 E.00173
; LINE_WIDTH: 0.180125
G1 X115.544 Y151.552 E.0026
; WIPE_START
G1 F24000
G1 X115.727 Y151.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.626 J-1.044 P1  F30000
G1 X114.587 Y151.012 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X114.403 Y150.859 E.00088
; LINE_WIDTH: 0.130867
G1 X114.218 Y150.706 E.00172
; LINE_WIDTH: 0.173564
G1 X114.009 Y150.524 E.00295
; LINE_WIDTH: 0.204895
G1 X113.8 Y150.342 E.00366
; WIPE_START
G1 F24000
G1 X114.009 Y150.524 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.734 J-.971 P1  F30000
G1 X112.187 Y149.147 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881698
G1 F15000
G1 X112.086 Y149.054 E.00051
; LINE_WIDTH: 0.0981932
G1 X111.6 Y148.586 E.00304
; LINE_WIDTH: 0.140308
G3 X110.156 Y147.147 I27.812 J-29.358 E.01618
; LINE_WIDTH: 0.130903
G1 X109.671 Y146.63 E.00508
; WIPE_START
G1 F24000
G1 X110.156 Y147.147 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.181 J1.203 P1  F30000
G1 X154.412 Y140.481 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0872038
G1 F15000
G1 X154.328 Y140.596 E.00051
; WIPE_START
G1 F24000
G1 X154.412 Y140.481 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.216 J.048 P1  F30000
G1 X155.135 Y122.007 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0932934
G1 F15000
G3 X155.014 Y122.085 I-.827 J-1.159 E.00059
G1 X154.151 Y122.166 F30000
; LINE_WIDTH: 0.121481
G1 F15000
G1 X153.904 Y122.022 E.00183
; WIPE_START
G1 F24000
G1 X154.151 Y122.166 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.174 J.32 P1  F30000
G1 X155.149 Y118.502 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.144549
G1 F15000
G1 X154.889 Y118.352 E.00249
; WIPE_START
G1 F24000
G1 X155.149 Y118.502 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.038 J.635 P1  F30000
G1 X156.348 Y120.462 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.15064
G1 F15000
G1 X156.402 Y120.35 E.00109
G1 X156.348 Y120.219 E.00124
G1 X157.059 Y120.396 F30000
; LINE_WIDTH: 0.116007
G1 F15000
G1 X157.082 Y120.228 E.00101
; WIPE_START
G1 F24000
G1 X157.059 Y120.396 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.186 J-.271 P1  F30000
G1 X154.497 Y109.189 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0991665
G1 F15000
G3 X154.326 Y109.109 I.706 J-1.728 E.00087
G1 X153.899 Y109.119 F30000
; LINE_WIDTH: 0.111862
G1 F15000
G3 X153.539 Y108.849 I2.509 J-3.722 E.00253
G1 X152.896 Y108.206 F30000
; LINE_WIDTH: 0.088792
G1 F15000
G1 X152.85 Y108.15 E.00027
; LINE_WIDTH: 0.0979898
G1 X152.762 Y108.019 E.00071
; LINE_WIDTH: 0.141108
G1 X152.675 Y107.889 E.00126
G1 X151.946 Y107.284 F30000
; LINE_WIDTH: 0.12189
G1 F15000
G1 X151.918 Y107.46 E.00115
; WIPE_START
G1 F24000
G1 X151.946 Y107.284 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.215 J.07 P1  F30000
G1 X152.73 Y120.841 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0916162
G1 F15000
G3 X152.578 Y120.595 I2.721 J-1.851 E.00115
; WIPE_START
G1 F24000
G1 X152.73 Y120.841 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.183 J.285 P1  F30000
G1 X156.214 Y106.354 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.199918
G1 F15000
G1 X156.137 Y106.246 E.0017
; LINE_WIDTH: 0.189011
G1 X156.017 Y106.108 E.00217
; LINE_WIDTH: 0.148336
G1 X155.897 Y105.971 E.00156
G2 X155.68 Y105.762 I-20.46 J21.004 E.00259
; LINE_WIDTH: 0.149976
G1 X155.521 Y105.633 E.00178
; LINE_WIDTH: 0.183935
G1 X155.362 Y105.505 E.00235
; WIPE_START
G1 F24000
G1 X155.521 Y105.633 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.032 J.645 P1  F30000
G1 X156.431 Y107.089 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.13262
G1 F15000
G1 X156.327 Y106.883 E.00169
G1 X157.047 Y107.052 F30000
; LINE_WIDTH: 0.131666
G1 F15000
G1 X157.083 Y106.868 E.00136
; WIPE_START
G1 F24000
G1 X157.047 Y107.052 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.739 J-.967 P1  F30000
G1 X154.787 Y105.326 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.105215
G1 F15000
G1 X154.574 Y105.405 E.00115
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X154.787 Y105.326 E-.76
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

