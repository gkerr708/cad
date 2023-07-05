; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 7m 5s; total estimated time: 12m 54s
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
M73 P0 R12
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
M73 P34 R8
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
M73 P36 R8
G1 X76 F15000
M73 P38 R7
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
M73 P39 R7
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
M73 P40 R7
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
G1 X128.328 Y114.748 F30000
G1 Z.4
G1 Z.2
M73 P41 R7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X128.339 Y114.746 E.0004
G3 X129.667 Y114.647 I1.661 J13.252 E.04962
G1 X130.333 Y114.647 E.02481
G3 X127.681 Y114.846 I-.333 J13.351 E3.02623
G1 X128.269 Y114.757 E.02217
G1 X128.392 Y115.201 F30000
; FEATURE: Outer wall
G1 F3000
G1 X128.396 Y115.2 E.00014
M73 P42 R7
G3 X129.678 Y115.104 I1.604 J12.798 E.04792
G1 X130.322 Y115.104 E.02396
G3 X127.76 Y115.296 I-.322 J12.894 E2.92264
G1 X128.333 Y115.209 E.02159
; WIPE_START
G1 F24000
G1 X128.396 Y115.2 E-.02419
G1 X129.036 Y115.136 E-.24442
G1 X129.678 Y115.104 E-.24442
G1 X130.322 Y115.104 E-.24442
G1 X130.328 Y115.104 E-.00255
; WIPE_END
M73 P43 R7
G1 E-.04 F1800
G17
G3 Z.6 I.008 J-1.217 P1  F30000
G1 X114.592 Y115.004 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X114.562 Y115.004 E.00109
G3 X114.188 Y110.011 I-.063 J-2.506 E.28399
G1 X114.437 Y109.993 E.00931
G3 X114.949 Y114.964 I.062 J2.506 E.2788
G1 X114.651 Y114.998 E.01116
G1 X114.536 Y114.549 F30000
; FEATURE: Outer wall
G1 F3000
G1 X114.144 Y114.517 E.01465
G3 X114.245 Y110.465 I.355 J-2.018 E.21696
G1 X114.449 Y110.45 E.00761
G3 X114.596 Y114.546 I.051 J2.049 E.23809
; WIPE_START
G1 F24000
G1 X114.144 Y114.517 E-.17205
M73 P44 R7
G1 X113.751 Y114.409 E-.15507
G1 X113.388 Y114.222 E-.15517
G1 X113.222 Y114.103 E-.07768
G1 X112.929 Y113.818 E-.15516
G1 X112.863 Y113.72 E-.04486
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.217 J.003 P1  F30000
G1 X112.951 Y145.472 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X112.938 Y145.459 E.00069
G3 X114.188 Y141.011 I1.562 J-1.96 E.21885
G1 X114.437 Y140.993 E.00931
M73 P45 R7
G3 X113.141 Y145.605 I.062 J2.506 E.34913
G1 X113 Y145.506 E.00638
G1 X113.207 Y145.089 F30000
; FEATURE: Outer wall
G1 F3000
G1 X112.931 Y144.817 E.01446
G3 X114.245 Y141.465 I1.569 J-1.318 E.1637
G1 X114.449 Y141.45 E.00761
G3 X113.254 Y145.126 I.051 J2.049 E.29155
; WIPE_START
G1 F24000
G1 X112.931 Y144.817 E-.17011
G1 X112.699 Y144.481 E-.15509
G1 X112.541 Y144.104 E-.15515
G1 X112.46 Y143.709 E-.1534
G1 X112.452 Y143.398 E-.11825
G1 X112.455 Y143.377 E-.00799
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.07 J1.215 P1  F30000
G1 X143.922 Y141.551 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X143.936 Y141.539 E.00069
G3 X145.188 Y141.011 I1.564 J1.959 E.05125
G1 X145.437 Y140.993 E.00931
G3 X143.749 Y141.705 I.062 J2.506 E.51673
G1 X143.877 Y141.591 E.00639
G1 X144.237 Y141.887 F30000
; FEATURE: Outer wall
G1 F3000
G1 X144.565 Y141.675 E.01452
G3 X145.245 Y141.465 I.935 J1.823 E.02666
G1 X145.449 Y141.45 E.00761
G3 X144.19 Y141.923 I.051 J2.049 E.42852
; WIPE_START
G1 F24000
G1 X144.565 Y141.675 E-.17078
G1 X144.94 Y141.528 E-.15339
G1 X145.245 Y141.465 E-.11824
G1 X145.449 Y141.45 E-.07766
G1 X145.856 Y141.481 E-.15516
G1 X146.071 Y141.541 E-.08478
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.212 J-.111 P1  F30000
G1 X143.307 Y111.285 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X143.432 Y111.09 E.00862
G3 X145.199 Y110.011 I2.073 J1.408 E.0795
G1 X145.437 Y109.993 E.00891
G3 X143.283 Y111.339 I.068 J2.506 E.48733
G1 X143.71 Y111.503 F30000
; FEATURE: Outer wall
G1 F3000
G1 X143.931 Y111.183 E.01447
G3 X145.25 Y110.465 I1.571 J1.315 E.05728
M73 P45 R6
G1 X145.449 Y110.45 E.00743
G3 X143.683 Y111.556 I.053 J2.048 E.39813
; WIPE_START
G1 F24000
G1 X143.931 Y111.183 E-.17022
G1 X144.222 Y110.897 E-.15509
G1 X144.565 Y110.675 E-.15515
G1 X144.945 Y110.526 E-.15517
G1 X145.25 Y110.465 E-.11834
G1 X145.266 Y110.464 E-.00602
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.201 J.196 P1  F30000
G1 X151.643 Y149.643 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X108.357 Y149.643 E1.61223
G1 X108.357 Y106.357 E1.61223
M73 P46 R6
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
G1 X148.382 Y112.204 E.1524
G3 X148.374 Y112.847 I-2.111 J.296 E.02422
G1 X151.254 Y115.728 E.15281
G1 X151.254 Y116.379 E.02442
G1 X148.258 Y113.383 E.15895
G3 X148.066 Y113.841 I-2.388 J-.732 E.01869
G1 X151.254 Y117.03 E.16916
G1 X151.254 Y117.681 E.02442
G1 X147.813 Y114.239 E.18258
G3 X147.509 Y114.586 I-2.904 J-2.234 E.01732
G1 X151.254 Y118.332 E.1987
G1 X151.254 Y118.983 E.02442
G1 X147.149 Y114.878 E.21777
G3 X146.737 Y115.116 I-1.716 J-2.493 E.01789
M73 P47 R6
G1 X151.254 Y119.634 E.23965
G1 X151.254 Y120.285 E.02442
G1 X146.263 Y115.294 E.26477
G3 X145.705 Y115.386 I-.658 J-2.241 E.02129
G1 X151.254 Y120.936 E.2944
G1 X151.254 Y121.587 E.02442
G1 X144.751 Y115.084 E.34497
; WIPE_START
G1 F24000
G1 X146.166 Y116.498 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.217 J-.022 P1  F30000
G1 X146.045 Y109.867 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X142.923 Y106.746 E.1656
G1 X142.272 Y106.746 E.02442
G1 X145.146 Y109.625 E.15261
G2 X144.619 Y109.744 I.197 J2.106 E.02033
G1 X141.621 Y106.746 E.15904
G1 X140.97 Y106.746 E.02442
G1 X144.158 Y109.934 E.16912
G2 X143.76 Y110.187 I1.067 J2.113 E.01772
G1 X140.319 Y106.746 E.18256
G1 X139.668 Y106.746 E.02442
G1 X143.415 Y110.493 E.19878
G2 X143.121 Y110.849 I1.634 J1.651 E.01737
G1 X139.017 Y106.746 E.21769
G1 X138.366 Y106.746 E.02442
G1 X142.884 Y111.264 E.23967
G2 X142.708 Y111.739 I2.679 J1.262 E.01903
G1 X137.715 Y106.746 E.26487
G1 X137.064 Y106.746 E.02442
G1 X142.613 Y112.295 E.29437
G2 X142.646 Y112.979 I2.962 J.201 E.02574
G1 X136.413 Y106.746 E.33065
G1 X135.762 Y106.746 E.02442
G1 X151.254 Y122.238 E.82184
G1 X151.254 Y122.889 E.02442
G1 X135.111 Y106.746 E.85638
G1 X134.46 Y106.746 E.02442
M73 P48 R6
G1 X151.254 Y123.54 E.89091
G1 X151.254 Y124.191 E.02442
G1 X133.809 Y106.746 E.92545
G1 X133.158 Y106.746 E.02442
G1 X151.254 Y124.842 E.95998
G1 X151.254 Y125.493 E.02442
G1 X132.507 Y106.746 E.99451
G1 X131.856 Y106.746 E.02442
G1 X151.254 Y126.144 E1.02905
G1 X151.254 Y126.795 E.02442
G1 X131.205 Y106.746 E1.06358
G1 X130.554 Y106.746 E.02442
G1 X151.254 Y127.446 E1.09812
G1 X151.254 Y128.097 E.02442
G1 X129.903 Y106.746 E1.13265
G1 X129.252 Y106.746 E.02442
G1 X151.254 Y128.748 E1.16719
G1 X151.254 Y129.399 E.02442
G1 X128.601 Y106.746 E1.20172
G1 X127.95 Y106.746 E.02442
G1 X151.254 Y130.05 E1.23625
G1 X151.254 Y130.701 E.02442
G1 X142.169 Y121.616 E.48194
G3 X142.733 Y122.831 I-12.843 J6.7 E.05026
G1 X151.254 Y131.352 E.45202
G1 X151.254 Y132.003 E.02442
G1 X143.103 Y123.851 E.43243
G3 X143.354 Y124.754 I-16.833 J5.177 E.03515
G1 X151.254 Y132.654 E.41909
G1 X151.254 Y133.305 E.02442
G1 X143.526 Y125.577 E.40995
G3 X143.642 Y126.343 I-7.616 J1.536 E.02907
G1 X151.254 Y133.956 E.40385
G1 X151.254 Y134.607 E.02442
G1 X143.709 Y127.062 E.40025
G3 X143.74 Y127.743 I-7.037 J.654 E.02559
G1 X151.254 Y135.258 E.39865
G1 X151.254 Y135.909 E.02442
G1 X143.736 Y128.391 E.39883
G3 X143.705 Y129.01 I-6.221 J-.008 E.02327
G1 X151.254 Y136.56 E.40051
G1 X151.254 Y137.211 E.02442
G1 X143.648 Y129.605 E.4035
G3 X143.57 Y130.177 I-5.776 J-.498 E.02169
G1 X151.254 Y137.862 E.40766
G1 X151.254 Y138.513 E.02442
G1 X143.472 Y130.73 E.41285
G1 X143.351 Y131.26 E.02039
G1 X151.254 Y139.164 E.41927
G1 X151.254 Y139.815 E.02442
G1 X143.213 Y131.774 E.42656
G3 X143.061 Y132.273 I-5.071 J-1.277 E.01957
G1 X151.254 Y140.466 E.43464
G1 X151.254 Y141.117 E.02442
G1 X142.895 Y132.758 E.44345
G1 X142.711 Y133.225 E.01884
G1 X151.254 Y141.768 E.45319
G1 X151.254 Y142.419 E.02442
G1 X142.514 Y133.678 E.46368
G3 X142.305 Y134.12 I-4.533 J-1.873 E.01835
M73 P49 R6
G1 X151.254 Y143.07 E.47477
G1 X151.254 Y143.721 E.02442
G1 X142.084 Y134.551 E.48647
G3 X141.847 Y134.964 I-4.264 J-2.171 E.0179
G1 X151.254 Y144.372 E.49906
G1 X151.254 Y145.023 E.02442
G1 X141.6 Y135.368 E.51216
G3 X141.343 Y135.763 I-4.083 J-2.371 E.01766
G1 X146.295 Y140.715 E.26268
G3 X148.283 Y142.702 I-.808 J2.796 E.11004
G1 X151.254 Y145.674 E.15764
G1 X151.254 Y146.325 E.02442
G1 X148.395 Y143.466 E.15166
G3 X148.341 Y144.063 I-3.545 J-.02 E.02251
G1 X151.254 Y146.976 E.15453
G1 X151.254 Y147.627 E.02442
G1 X148.192 Y144.564 E.16246
G3 X147.975 Y144.999 I-2.864 J-1.157 E.01823
G1 X151.254 Y148.278 E.17396
G1 X151.254 Y148.929 E.02442
G1 X147.704 Y145.379 E.18834
G3 X147.377 Y145.703 I-1.783 J-1.472 E.0173
G1 X150.929 Y149.254 E.18842
G1 X150.278 Y149.254 E.02442
G1 X146.999 Y145.976 E.17393
G3 X146.566 Y146.193 I-1.305 J-2.056 E.01822
G1 X149.627 Y149.254 E.16238
G1 X148.976 Y149.254 E.02442
G1 X146.056 Y146.335 E.15487
G3 X145.464 Y146.394 I-.549 J-2.53 E.02238
G1 X148.531 Y149.46 E.16268
; WIPE_START
G1 F24000
G1 X147.116 Y148.046 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.196 J-.226 P1  F30000
G1 X145.752 Y140.823 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X141.071 Y136.142 E.24832
G3 X140.789 Y136.511 I-3.838 J-2.639 E.01743
G1 X144.943 Y140.665 E.22038
G2 X144.434 Y140.807 I.609 J3.181 E.01986
M73 P50 R6
G1 X140.499 Y136.871 E.20876
G1 X140.194 Y137.217 E.0173
G1 X144.001 Y141.024 E.20197
G2 X143.623 Y141.297 I1.602 J2.616 E.01751
G1 X139.878 Y137.553 E.19864
G3 X139.555 Y137.88 I-3.443 J-3.078 E.01727
G1 X143.296 Y141.621 E.19846
G2 X143.025 Y142.001 I2.775 J2.266 E.01752
G1 X139.217 Y138.194 E.20199
G3 X138.869 Y138.497 I-3.209 J-3.336 E.01732
G1 X142.808 Y142.436 E.20896
G2 X142.659 Y142.937 I3.614 J1.351 E.01964
G1 X138.512 Y138.791 E.21995
G1 X138.142 Y139.072 E.01743
G1 X142.821 Y143.751 E.24823
; WIPE_START
G1 F24000
G1 X141.407 Y142.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.776 J-.937 P1  F30000
G1 X137.612 Y139.193 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X142.717 Y144.298 E.27081
G2 X144.705 Y146.285 I2.796 J-.808 E.11003
G1 X147.674 Y149.254 E.1575
G1 X147.023 Y149.254 E.02442
G1 X137.369 Y139.601 E.5121
G1 X136.965 Y139.848 E.01776
G1 X146.372 Y149.254 E.499
G1 X145.721 Y149.254 E.02442
G1 X136.548 Y140.081 E.48661
G3 X136.12 Y140.305 I-2.451 J-4.172 E.0181
G1 X145.07 Y149.254 E.47476
G1 X144.419 Y149.254 E.02442
G1 X135.681 Y140.516 E.46354
G3 X135.224 Y140.711 I-2.175 J-4.482 E.01863
G1 X143.768 Y149.254 E.45323
G1 X143.117 Y149.254 E.02442
G1 X134.755 Y140.893 E.44357
G3 X134.274 Y141.062 I-1.939 J-4.74 E.01916
G1 X142.466 Y149.254 E.43458
G1 X141.815 Y149.254 E.02442
G1 X133.776 Y141.216 E.42644
G3 X133.26 Y141.35 I-1.605 J-5.108 E.02003
G1 X141.164 Y149.254 E.4193
G1 X140.513 Y149.254 E.02442
G1 X132.727 Y141.468 E.41303
G3 X132.176 Y141.569 I-1.282 J-5.465 E.021
G1 X139.862 Y149.254 E.4077
G1 X139.211 Y149.254 E.02442
G1 X131.606 Y141.65 E.40342
G3 X131.014 Y141.708 I-.883 J-5.907 E.02234
G1 X138.56 Y149.254 E.40031
G1 X137.909 Y149.254 E.02442
G1 X130.394 Y141.739 E.39867
G3 X129.745 Y141.742 I-.35 J-6.494 E.02433
G1 X137.258 Y149.254 E.39853
G1 X136.607 Y149.254 E.02442
G1 X129.065 Y141.712 E.4001
G3 X128.346 Y141.645 I.315 J-7.231 E.02707
G1 X135.956 Y149.254 E.40367
G1 X135.305 Y149.254 E.02442
G1 X127.581 Y141.531 E.40973
G3 X126.753 Y141.353 I1.362 J-8.386 E.03179
M73 P51 R6
G1 X134.654 Y149.254 E.41913
G1 X134.003 Y149.254 E.02442
G1 X125.849 Y141.1 E.43257
G3 X124.832 Y140.734 I4.547 J-14.23 E.04055
G1 X133.352 Y149.254 E.45199
G1 X132.701 Y149.254 E.02442
G1 X123.083 Y139.636 E.51022
; WIPE_START
G1 F24000
G1 X124.497 Y141.051 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.087 J.547 P1  F30000
G1 X136.917 Y116.364 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X127.299 Y106.746 E.51022
G1 X126.648 Y106.746 E.02442
G1 X135.168 Y115.266 E.45199
G2 X134.151 Y114.9 I-5.565 J13.866 E.04055
G1 X125.997 Y106.746 E.43257
G1 X125.346 Y106.746 E.02442
G1 X133.247 Y114.647 E.41913
G2 X132.419 Y114.469 I-2.191 J8.21 E.03179
G1 X124.695 Y106.746 E.40973
G1 X124.044 Y106.746 E.02442
G1 X131.654 Y114.355 E.40367
G2 X130.935 Y114.288 I-1.033 J7.163 E.02707
G1 X123.393 Y106.746 E.4001
G1 X122.742 Y106.746 E.02442
G1 X130.255 Y114.258 E.39853
G2 X129.606 Y114.261 I-.299 J6.496 E.02433
G1 X122.091 Y106.746 E.39867
G1 X121.44 Y106.746 E.02442
G1 X128.986 Y114.292 E.40031
G2 X128.394 Y114.35 I.291 J5.967 E.02234
G1 X120.789 Y106.746 E.40342
G1 X120.138 Y106.746 E.02442
G1 X127.824 Y114.431 E.4077
G2 X127.273 Y114.532 I.731 J5.566 E.021
G1 X119.487 Y106.746 E.41303
G1 X118.836 Y106.746 E.02442
G1 X126.74 Y114.65 E.41931
G2 X126.224 Y114.784 I1.088 J5.242 E.02003
G1 X118.185 Y106.746 E.42644
G1 X117.534 Y106.746 E.02442
G1 X125.726 Y114.938 E.43458
G2 X125.245 Y115.107 I1.457 J4.908 E.01916
G1 X116.883 Y106.746 E.44357
G1 X116.232 Y106.746 E.02442
G1 X124.776 Y115.289 E.45324
G2 X124.319 Y115.484 I1.717 J4.673 E.01863
G1 X115.581 Y106.746 E.46354
G1 X114.93 Y106.746 E.02442
G1 X123.88 Y115.695 E.47476
G2 X123.452 Y115.919 I2.024 J4.396 E.0181
M73 P52 R6
G1 X114.279 Y106.746 E.48661
G1 X113.628 Y106.746 E.02442
G1 X123.035 Y116.152 E.499
G1 X122.631 Y116.399 E.01776
G1 X112.977 Y106.746 E.5121
G1 X112.326 Y106.746 E.02442
G1 X115.295 Y109.715 E.1575
G3 X117.283 Y111.702 I-.808 J2.796 E.11004
G1 X122.24 Y116.659 E.26296
G2 X121.858 Y116.928 I2.507 J3.96 E.01753
G1 X117.395 Y112.466 E.23673
G3 X117.341 Y113.063 I-3.545 J-.02 E.02251
G1 X121.488 Y117.209 E.21994
G2 X121.131 Y117.503 I2.771 J3.719 E.01735
G1 X117.192 Y113.564 E.20896
G3 X116.975 Y113.999 I-2.864 J-1.157 E.01823
G1 X120.783 Y117.806 E.20199
G1 X120.445 Y118.12 E.01728
G1 X116.704 Y114.379 E.19846
G3 X116.377 Y114.703 I-1.782 J-1.472 E.0173
G1 X120.122 Y118.447 E.19864
G2 X119.806 Y118.783 I3.206 J3.325 E.01728
G1 X115.999 Y114.976 E.20197
G3 X115.566 Y115.193 I-1.305 J-2.056 E.01822
G1 X119.501 Y119.129 E.20876
G2 X119.211 Y119.489 I3.466 J3.09 E.01737
G1 X115.056 Y115.335 E.22038
G3 X114.464 Y115.394 I-.549 J-2.53 E.02238
G1 X119.076 Y120.006 E.24467
; WIPE_START
G1 F24000
G1 X117.662 Y118.592 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.155 J-.383 P1  F30000
G1 X114.752 Y109.823 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X111.675 Y106.746 E.16324
G1 X111.024 Y106.746 E.02442
G1 X113.939 Y109.661 E.15464
G2 X113.436 Y109.809 I.589 J2.923 E.01969
G1 X110.373 Y106.746 E.16251
G1 X109.722 Y106.746 E.02442
G1 X113 Y110.024 E.17391
G2 X112.622 Y110.297 I1.174 J2.027 E.01752
G1 X109.071 Y106.746 E.18838
G1 X108.746 Y106.746 E.01221
G1 X108.746 Y107.071 E.01221
G1 X112.298 Y110.623 E.18843
G2 X112.023 Y110.999 I2.965 J2.458 E.01748
G1 X108.746 Y107.722 E.17384
M73 P53 R6
G1 X108.746 Y108.373 E.02442
G1 X111.808 Y111.436 E.16248
G2 X111.661 Y111.94 I2.8 J1.092 E.01971
G1 X108.746 Y109.024 E.15467
G1 X108.746 Y109.675 E.02442
G1 X111.823 Y112.752 E.16324
; WIPE_START
G1 F24000
G1 X110.408 Y111.338 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.664 J-1.02 P1  F30000
G1 X108.54 Y110.12 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X111.717 Y113.298 E.16855
G2 X113.705 Y115.285 I2.796 J-.808 E.11003
G1 X118.657 Y120.237 E.26268
G2 X118.4 Y120.632 I3.827 J2.766 E.01766
G1 X108.746 Y110.977 E.51216
G1 X108.746 Y111.628 E.02442
G1 X118.153 Y121.036 E.49906
G2 X117.916 Y121.449 I4.027 J2.585 E.0179
G1 X108.746 Y112.279 E.48647
G1 X108.746 Y112.93 E.02442
G1 X117.695 Y121.88 E.47477
G2 X117.486 Y122.322 I4.324 J2.315 E.01835
G1 X108.746 Y113.581 E.46368
G1 X108.746 Y114.232 E.02442
G1 X117.289 Y122.775 E.45319
G1 X117.105 Y123.243 E.01884
G1 X108.746 Y114.883 E.44345
G1 X108.746 Y115.534 E.02442
G1 X116.939 Y123.727 E.43464
G2 X116.787 Y124.226 I4.92 J1.776 E.01957
G1 X108.746 Y116.185 E.42656
G1 X108.746 Y116.836 E.02442
G1 X116.649 Y124.74 E.41927
G1 X116.528 Y125.27 E.02039
G1 X108.746 Y117.487 E.41285
M73 P53 R5
G1 X108.746 Y118.138 E.02442
G1 X116.43 Y125.823 E.40766
G2 X116.352 Y126.395 I5.697 J1.071 E.02169
G1 X108.746 Y118.789 E.4035
G1 X108.746 Y119.44 E.02442
G1 X116.295 Y126.99 E.40051
G2 X116.264 Y127.609 I6.189 J.627 E.02327
G1 X108.746 Y120.091 E.39883
G1 X108.746 Y120.742 E.02442
G1 X116.26 Y128.257 E.39865
G2 X116.291 Y128.938 I7.068 J.027 E.02559
G1 X108.746 Y121.393 E.40025
G1 X108.746 Y122.044 E.02442
G1 X116.358 Y129.657 E.40385
G2 X116.474 Y130.423 I7.732 J-.77 E.02907
G1 X108.746 Y122.695 E.40995
G1 X108.746 Y123.346 E.02442
G1 X116.646 Y131.246 E.41909
G2 X116.897 Y132.149 I17.081 J-4.274 E.03515
G1 X108.746 Y123.997 E.43244
G1 X108.746 Y124.648 E.02442
G1 X117.267 Y133.169 E.45202
G2 X117.831 Y134.384 I13.409 J-5.486 E.05027
G1 X108.746 Y125.299 E.48194
G1 X108.746 Y125.95 E.02442
G1 X132.05 Y149.254 E1.23625
G1 X131.399 Y149.254 E.02442
G1 X108.746 Y126.601 E1.20172
G1 X108.746 Y127.252 E.02442
G1 X130.748 Y149.254 E1.16718
G1 X130.097 Y149.254 E.02442
G1 X108.746 Y127.903 E1.13265
G1 X108.746 Y128.554 E.02442
G1 X129.446 Y149.254 E1.09812
M73 P54 R5
G1 X128.795 Y149.254 E.02442
G1 X108.746 Y129.205 E1.06358
G1 X108.746 Y129.856 E.02442
G1 X128.144 Y149.254 E1.02905
G1 X127.493 Y149.254 E.02442
G1 X108.746 Y130.507 E.99451
G1 X108.746 Y131.158 E.02442
G1 X126.842 Y149.254 E.95998
G1 X126.191 Y149.254 E.02442
G1 X108.746 Y131.809 E.92544
G1 X108.746 Y132.46 E.02442
G1 X125.54 Y149.254 E.89091
G1 X124.889 Y149.254 E.02442
G1 X108.746 Y133.111 E.85638
G1 X108.746 Y133.762 E.02442
G1 X124.238 Y149.254 E.82184
G1 X123.587 Y149.254 E.02442
G1 X117.354 Y143.022 E.33064
G3 X117.387 Y143.705 I-2.929 J.483 E.02574
G1 X122.936 Y149.254 E.29437
G1 X122.285 Y149.254 E.02442
G1 X117.292 Y144.261 E.26487
G3 X117.118 Y144.739 I-2.041 J-.473 E.0191
G1 X121.634 Y149.254 E.23956
G1 X120.983 Y149.254 E.02442
G1 X116.878 Y145.149 E.21778
G3 X116.585 Y145.508 I-2.618 J-1.834 E.01737
G1 X120.332 Y149.254 E.19875
G1 X119.681 Y149.254 E.02442
G1 X116.24 Y145.813 E.18254
G3 X115.84 Y146.065 I-1.856 J-2.51 E.01773
G1 X119.03 Y149.254 E.16921
G1 X118.379 Y149.254 E.02442
G1 X115.382 Y146.258 E.15897
G3 X114.849 Y146.375 I-1.106 J-3.738 E.0205
G1 X117.728 Y149.254 E.15272
G1 X117.077 Y149.254 E.02442
G1 X113.955 Y146.133 E.1656
; WIPE_START
G1 F24000
G1 X115.369 Y147.547 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.217 J-.022 P1  F30000
G1 X115.249 Y140.916 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X108.746 Y134.413 E.34497
G1 X108.746 Y135.064 E.02442
M73 P55 R5
G1 X114.295 Y140.614 E.2944
G2 X113.739 Y140.708 I.206 J2.899 E.0212
G1 X108.746 Y135.715 E.26488
G1 X108.746 Y136.366 E.02442
G1 X113.262 Y140.883 E.23961
G2 X112.85 Y141.121 I.985 J2.181 E.0179
G1 X108.746 Y137.017 E.21772
G1 X108.746 Y137.668 E.02442
G1 X112.493 Y141.415 E.1988
G2 X112.185 Y141.759 I2.745 J2.773 E.0173
G1 X108.746 Y138.319 E.18246
G1 X108.746 Y138.97 E.02442
G1 X111.935 Y142.16 E.1692
G2 X111.744 Y142.619 I2.64 J1.37 E.01869
G1 X108.746 Y139.621 E.15904
G1 X108.746 Y140.272 E.02442
G1 X111.627 Y143.153 E.15284
G2 X111.618 Y143.796 I5.038 J.387 E.02412
G1 X108.746 Y140.923 E.1524
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
M73 P56 R5
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
G3 Z.6 I1.067 J.586 P1  F30000
G1 X128.38 Y114.998 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X129.021 Y114.934 E.02136
G3 X129.673 Y114.902 I.979 J13.064 E.02167
G1 X130.327 Y114.902 E.02167
G3 X128.321 Y115.006 I-.327 J13.096 E2.66372
G1 X128.42 Y115.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X129.683 Y115.294 I1.58 J12.609 E.03895
G1 X130.317 Y115.294 E.01947
G3 X128.36 Y115.396 I-.317 J12.704 E2.39322
M204 S10000
; WIPE_START
G1 F24000
G1 X129.05 Y115.325 E-.2636
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.356 Y115.296 E-.01475
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.042 J-1.216 P1  F30000
G1 X114.522 Y114.75 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.109 Y114.716 E.01375
G3 X114.22 Y110.265 I.391 J-2.217 E.21229
G1 X114.444 Y110.248 E.00745
G3 X114.582 Y114.749 I.056 J2.251 E.23375
G1 X114.546 Y114.357 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X114.269 Y110.654 I-.046 J-1.859 E.17377
G1 X114.454 Y110.64 E.0057
G3 X114.606 Y114.355 I.046 J1.859 E.17762
M204 S10000
; WIPE_START
G1 F24000
G1 X114.177 Y114.332 E-.16333
G1 X113.82 Y114.232 E-.14077
G1 X113.491 Y114.063 E-.14077
G1 X113.34 Y113.954 E-.07047
G1 X113.075 Y113.696 E-.14077
G1 X112.921 Y113.47 E-.10389
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.217 J.008 P1  F30000
G1 X113.124 Y145.28 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X113.097 Y145.259 E.00112
G3 X114.22 Y141.265 I1.403 J-1.761 E.17507
G1 X114.444 Y141.248 E.00745
G3 X113.473 Y145.502 I.056 J2.251 E.27184
G1 X113.174 Y145.312 E.01176
G1 X113.341 Y144.953 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X114.269 Y141.654 I1.159 J-1.454 E.13391
G1 X114.454 Y141.64 E.0057
G3 X113.389 Y144.989 I.046 J1.859 E.21748
M204 S10000
; WIPE_START
G1 F24000
G1 X113.075 Y144.696 E-.16333
G1 X112.866 Y144.39 E-.14077
G1 X112.722 Y144.048 E-.14076
G1 X112.649 Y143.687 E-.13995
G1 X112.642 Y143.407 E-.10651
G1 X112.669 Y143.228 E-.06866
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.057 J1.216 P1  F30000
G1 X144.071 Y141.762 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.096 Y141.739 E.00113
G3 X145.22 Y141.265 I1.404 J1.76 E.04099
G1 X145.444 Y141.248 E.00745
G3 X143.775 Y142.052 I.056 J2.251 E.40591
G1 X144.028 Y141.804 E.01176
G1 X144.34 Y142.046 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X145.269 Y141.654 I1.16 J1.453 E.03135
G1 X145.454 Y141.64 E.0057
G3 X144.294 Y142.084 I.046 J1.859 E.32003
M204 S10000
; WIPE_START
G1 F24000
G1 X144.649 Y141.846 E-.16257
G1 X144.908 Y141.737 E-.10651
G1 X145.269 Y141.654 E-.14071
G1 X145.454 Y141.64 E-.07048
G1 X145.823 Y141.668 E-.14076
G1 X146.175 Y141.767 E-.13897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.212 J-.105 P1  F30000
G1 X143.541 Y111.395 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.774 Y111.052 E.01376
G3 X145.22 Y110.265 I1.726 J1.447 E.0559
G1 X145.444 Y110.248 E.00745
G3 X143.509 Y111.446 I.056 J2.251 E.3903
G1 X143.866 Y111.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X145.269 Y110.654 I1.634 J.889 E.05416
G1 X145.454 Y110.64 E.0057
G3 X143.839 Y111.663 I.046 J1.859 E.29738
M204 S10000
; WIPE_START
G1 F24000
G1 X144.075 Y111.304 E-.16339
G1 X144.34 Y111.046 E-.14077
G1 X144.651 Y110.845 E-.14076
G1 X144.994 Y110.71 E-.13978
G1 X145.269 Y110.654 E-.10664
G1 X145.449 Y110.641 E-.06866
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.201 J.197 P1  F30000
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
M73 P57 R5
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
G1 X146.178 Y145.986 E.15565
G3 X145.556 Y146.074 I-.528 J-1.494 E.01944
G1 X142.066 Y149.565 E.15183
G1 X141.532 Y149.565 E.01642
G1 X145.06 Y146.037 E.15345
G3 X144.636 Y145.927 I.06 J-1.103 E.01356
G1 X140.998 Y149.565 E.15824
G1 X140.465 Y149.565 E.01642
G1 X144.263 Y145.766 E.16523
G1 X143.939 Y145.557 E.01188
G1 X139.931 Y149.565 E.17434
G1 X139.397 Y149.565 E.01642
G1 X143.66 Y145.302 E.18543
G3 X143.415 Y145.013 I.593 J-.75 E.01173
G1 X138.863 Y149.565 E.19801
G1 X138.329 Y149.565 E.01642
G1 X143.206 Y144.688 E.21215
G1 X143.048 Y144.312 E.01254
G1 X137.795 Y149.565 E.22848
G1 X137.262 Y149.565 E.01642
G1 X142.949 Y143.877 E.24741
G1 X142.925 Y143.758 E.00375
G1 X142.925 Y143.367 E.01201
G1 X136.728 Y149.565 E.26958
G1 X136.194 Y149.565 E.01642
G1 X143.031 Y142.727 E.29743
G1 X143.227 Y142.262 E.01551
G1 X143.518 Y141.837 E.01585
G1 X143.886 Y141.477 E.01585
G1 X144.31 Y141.203 E.01552
G1 X144.722 Y141.036 E.01367
G1 X151.565 Y134.194 E.29764
G1 X151.565 Y134.728 E.01642
G1 X145.365 Y140.928 E.26969
G3 X145.875 Y140.951 I.196 J1.273 E.01581
G1 X151.565 Y135.262 E.24751
G1 X151.565 Y135.795 E.01642
G1 X146.309 Y141.051 E.22863
G1 X146.69 Y141.204 E.01264
G1 X151.565 Y136.329 E.21203
G1 X151.565 Y136.863 E.01642
G1 X147.015 Y141.413 E.19792
G3 X147.301 Y141.66 I-.468 J.833 E.01172
G1 X151.565 Y137.397 E.18545
G1 X151.565 Y137.931 E.01642
G1 X147.554 Y141.942 E.17447
G1 X147.77 Y142.259 E.01182
G1 X151.565 Y138.465 E.16505
G1 X151.565 Y138.998 E.01642
G1 X147.929 Y142.634 E.15814
G1 X147.973 Y142.737 E.00345
G1 X148.038 Y143.059 E.0101
G1 X151.565 Y139.532 E.15342
G1 X151.565 Y140.066 E.01642
G1 X148.075 Y143.556 E.1518
G1 X148.075 Y143.758 E.00621
G1 X147.991 Y144.174 E.01305
G1 X151.734 Y140.43 E.16284
G1 X140.185 Y136.499 F30000
G1 F15000
G1 X151.565 Y125.119 E.49501
G1 X151.565 Y124.585 E.01642
G1 X141.879 Y134.271 E.42134
G2 X142.367 Y133.249 I-9.996 J-5.404 E.03486
G1 X151.565 Y124.051 E.40009
G1 X151.565 Y123.518 E.01642
G1 X142.695 Y132.387 E.38581
G2 X142.937 Y131.612 I-7.646 J-2.806 E.02499
G1 X151.565 Y122.984 E.37531
G1 X151.565 Y122.45 E.01642
G1 X143.115 Y130.899 E.36755
G2 X143.244 Y130.236 I-6.579 J-1.626 E.02079
G1 X151.565 Y121.916 E.36193
G1 X151.565 Y121.382 E.01642
G1 X143.334 Y129.612 E.35801
G2 X143.393 Y129.02 I-5.901 J-.879 E.01831
G1 X151.565 Y120.848 E.35548
G1 X151.565 Y120.315 E.01642
G1 X143.424 Y128.455 E.3541
G2 X143.433 Y127.912 I-5.436 J-.363 E.01671
G1 X151.565 Y119.781 E.3537
G1 X151.565 Y119.247 E.01642
G1 X143.42 Y127.392 E.3543
G1 X143.385 Y126.893 E.01539
G1 X151.565 Y118.713 E.35581
G1 X151.565 Y118.179 E.01642
G1 X143.337 Y126.407 E.3579
G2 X143.275 Y125.936 I-4.756 J.388 E.01464
G1 X151.565 Y117.646 E.36061
G1 X151.565 Y117.112 E.01642
G1 X143.195 Y125.482 E.36409
G2 X143.102 Y125.041 I-4.462 J.713 E.01386
G1 X151.565 Y116.578 E.36814
G1 X151.565 Y116.044 E.01642
G1 X142.999 Y124.61 E.3726
G1 X142.882 Y124.193 E.01331
G1 X151.565 Y115.51 E.3777
G1 X151.565 Y114.976 E.01642
G1 X142.754 Y123.787 E.38327
G2 X142.619 Y123.388 I-4.064 J1.153 E.01296
G1 X151.565 Y114.443 E.38914
G1 X151.565 Y113.909 E.01642
G1 X142.468 Y123.005 E.39568
G2 X142.312 Y122.628 I-3.854 J1.384 E.01256
G1 X151.565 Y113.375 E.40251
G1 X151.565 Y112.841 E.01642
G1 X142.146 Y122.26 E.40973
G2 X141.968 Y121.904 I-3.66 J1.598 E.01225
G1 X151.565 Y112.307 E.41744
G1 X151.565 Y111.774 E.01642
G1 X141.786 Y121.552 E.42535
G1 X141.591 Y121.213 E.01202
G1 X151.565 Y111.24 E.43385
G1 X151.565 Y110.706 E.01642
G1 X141.391 Y120.88 E.44256
G1 X141.181 Y120.556 E.01188
G1 X151.565 Y110.172 E.45168
G1 X151.565 Y109.638 E.01642
G1 X147.968 Y113.235 E.15646
G1 X148.036 Y113.013 E.00715
G1 X148.079 Y112.59 E.01306
G1 X151.565 Y109.104 E.15164
G1 X151.565 Y108.571 E.01642
G1 X148.047 Y112.089 E.15303
G1 X148.036 Y111.987 E.00313
G1 X147.937 Y111.665 E.01039
G1 X151.565 Y108.037 E.15781
G1 X151.565 Y107.503 E.01642
G1 X147.775 Y111.293 E.16486
G2 X147.571 Y110.963 I-.919 J.338 E.01201
G1 X151.565 Y106.969 E.17371
G1 X151.565 Y106.435 E.01642
G1 X147.328 Y110.672 E.18431
G1 X147.035 Y110.431 E.01166
G1 X151.031 Y106.435 E.17381
G1 X150.497 Y106.435 E.01642
G1 X146.707 Y110.225 E.16486
G2 X146.338 Y110.061 I-.591 J.831 E.01252
G1 X149.963 Y106.435 E.15771
G1 X149.429 Y106.435 E.01642
G1 X145.916 Y109.949 E.15283
G2 X145.404 Y109.927 I-.329 J1.687 E.01582
G1 X148.896 Y106.435 E.15187
G1 X148.362 Y106.435 E.01642
G1 X144.782 Y110.015 E.15573
G1 X144.319 Y110.197 E.01528
G1 X143.887 Y110.477 E.01585
G1 X143.518 Y110.837 E.01585
G1 X143.227 Y111.262 E.01585
G1 X143.019 Y111.778 E.01711
G1 X137.761 Y117.036 E.2287
G3 X138.069 Y117.262 I-2.116 J3.191 E.01175
G1 X142.925 Y112.406 E.21125
G1 X142.925 Y112.758 E.01082
G1 X142.956 Y112.909 E.00475
G1 X138.372 Y117.492 E.19937
G3 X138.663 Y117.736 I-2.3 J3.04 E.01166
G1 X143.059 Y113.339 E.19124
G1 X143.218 Y113.715 E.01254
M73 P58 R5
G1 X138.95 Y117.982 E.18563
G1 X139.227 Y118.239 E.01162
G1 X143.431 Y114.036 E.18284
G2 X143.679 Y114.321 I.83 J-.472 E.01172
G1 X139.498 Y118.502 E.18187
G1 X139.762 Y118.772 E.01161
G1 X143.962 Y114.572 E.1827
G1 X144.286 Y114.781 E.01188
G1 X140.016 Y119.051 E.18574
G1 X140.267 Y119.335 E.01163
G1 X144.664 Y114.938 E.19126
G2 X145.092 Y115.043 I.474 J-1.008 E.01367
G1 X140.505 Y119.63 E.19956
G3 X140.74 Y119.929 I-2.876 J2.504 E.0117
G1 X145.59 Y115.079 E.21098
G2 X146.235 Y114.968 I-.027 J-2.084 E.02021
G1 X140.842 Y120.361 E.2346
; WIPE_START
G1 F24000
G1 X142.256 Y118.947 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.109 J.502 P1  F30000
G1 X147.998 Y106.266 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X137.444 Y116.819 E.45907
G2 X137.12 Y116.61 I-2.259 J3.147 E.01188
G1 X147.294 Y106.435 E.44259
G1 X146.76 Y106.435 E.01642
G1 X136.788 Y116.407 E.43378
G2 X136.446 Y116.216 I-2.087 J3.337 E.01207
G1 X146.226 Y106.435 E.42546
G1 X145.693 Y106.435 E.01642
G1 X136.099 Y116.029 E.41733
G1 X135.738 Y115.856 E.0123
G1 X145.159 Y106.435 E.40978
G1 X144.625 Y106.435 E.01642
G1 X135.372 Y115.688 E.4025
G1 X134.996 Y115.53 E.01253
G1 X144.091 Y106.435 E.39562
G1 X143.557 Y106.435 E.01642
G1 X134.609 Y115.384 E.38926
G2 X134.215 Y115.244 I-1.598 J3.877 E.01286
G1 X143.023 Y106.435 E.38318
G1 X142.49 Y106.435 E.01642
G1 X133.807 Y115.118 E.3777
G2 X133.388 Y115.003 I-1.367 J4.132 E.01335
G1 X141.956 Y106.435 E.37268
G1 X141.422 Y106.435 E.01642
G1 X132.962 Y114.896 E.36802
G1 X132.518 Y114.806 E.01393
G1 X140.888 Y106.435 E.36411
G1 X140.354 Y106.435 E.01642
G1 X132.062 Y114.728 E.36071
G2 X131.595 Y114.661 I-.901 J4.647 E.01452
G1 X139.821 Y106.435 E.35782
G1 X139.287 Y106.435 E.01642
G1 X131.11 Y114.612 E.3557
G2 X130.606 Y114.582 I-.557 J5.029 E.01552
G1 X138.753 Y106.435 E.35438
G1 X138.219 Y106.435 E.01642
G1 X130.086 Y114.569 E.35379
G2 X129.546 Y114.574 I-.21 J5.41 E.01661
G1 X137.685 Y106.435 E.35405
G1 X137.151 Y106.435 E.01642
G1 X128.984 Y114.603 E.3553
G1 X128.39 Y114.663 E.01834
G1 X136.618 Y106.435 E.35788
G1 X136.084 Y106.435 E.01642
G1 X127.766 Y114.754 E.36184
G2 X127.103 Y114.883 I.96 J6.704 E.02078
G1 X135.55 Y106.435 E.36745
G1 X135.016 Y106.435 E.01642
G1 X126.393 Y115.058 E.3751
G2 X125.615 Y115.302 I6.786 J22.987 E.02508
G1 X134.482 Y106.435 E.38572
G1 X133.949 Y106.435 E.01642
G1 X124.745 Y115.639 E.40037
G2 X123.729 Y116.121 I5.589 J13.093 E.03458
G1 X133.415 Y106.435 E.42133
G1 X132.881 Y106.435 E.01642
G1 X122.371 Y116.945 E.45717
G2 X118.935 Y120.381 I7.517 J10.953 E.15031
G1 X108.435 Y130.881 E.45674
G1 X108.435 Y131.415 E.01642
G1 X118.121 Y121.729 E.42134
G2 X117.633 Y122.751 I9.997 J5.404 E.03486
G1 X108.435 Y131.949 E.4001
G1 X108.435 Y132.482 E.01642
G1 X117.305 Y123.613 E.38581
G2 X117.063 Y124.388 I7.646 J2.806 E.02499
G1 X108.435 Y133.016 E.37531
G1 X108.435 Y133.55 E.01642
G1 X116.885 Y125.1 E.36755
G2 X116.756 Y125.763 I6.579 J1.626 E.02079
G1 X108.435 Y134.084 E.36193
G1 X108.435 Y134.618 E.01642
G1 X116.666 Y126.387 E.35801
G2 X116.607 Y126.979 I5.902 J.879 E.01831
G1 X108.435 Y135.151 E.35548
G1 X108.435 Y135.685 E.01642
G1 X116.576 Y127.545 E.3541
G2 X116.567 Y128.088 I5.435 J.363 E.01671
G1 X108.435 Y136.219 E.3537
G1 X108.435 Y136.753 E.01642
G1 X116.58 Y128.608 E.3543
G1 X116.615 Y129.107 E.01539
G1 X108.435 Y137.287 E.35581
G1 X108.435 Y137.821 E.01642
G1 X116.663 Y129.593 E.3579
G2 X116.725 Y130.064 I4.755 J-.388 E.01464
G1 X108.435 Y138.354 E.36061
G1 X108.435 Y138.888 E.01642
G1 X116.805 Y130.518 E.36409
G2 X116.898 Y130.959 I4.463 J-.713 E.01386
G1 X108.435 Y139.422 E.36814
G1 X108.435 Y139.956 E.01642
G1 X117.001 Y131.39 E.3726
G1 X117.118 Y131.807 E.01331
G1 X108.435 Y140.49 E.3777
G1 X108.435 Y141.023 E.01642
G1 X117.246 Y132.213 E.38326
G2 X117.381 Y132.612 I4.061 J-1.152 E.01296
G1 X108.435 Y141.557 E.38913
G1 X108.435 Y142.091 E.01642
G1 X117.532 Y132.995 E.39568
G2 X117.688 Y133.372 I3.854 J-1.383 E.01256
G1 X108.435 Y142.625 E.40251
G1 X108.435 Y143.159 E.01642
G1 X117.854 Y133.74 E.40972
G2 X118.032 Y134.096 I3.661 J-1.598 E.01225
G1 X108.435 Y143.693 E.41744
G1 X108.435 Y144.226 E.01642
G1 X118.214 Y134.448 E.42535
G1 X118.409 Y134.787 E.01202
G1 X108.435 Y144.76 E.43385
G1 X108.435 Y145.294 E.01642
G1 X118.609 Y135.12 E.44256
G1 X118.819 Y135.444 E.01188
G1 X108.266 Y145.998 E.45906
G1 X111.469 Y149.734 F30000
G1 F15000
G1 X115.228 Y145.975 E.16353
G1 X114.822 Y146.068 E.01281
G1 X114.596 Y146.073 E.00695
G1 X111.104 Y149.565 E.15187
G1 X110.571 Y149.565 E.01642
G1 X114.092 Y146.043 E.1532
G3 X113.664 Y145.938 I.045 J-1.113 E.01367
G1 X110.037 Y149.565 E.15777
G1 X109.503 Y149.565 E.01642
G1 X113.286 Y145.781 E.16457
G1 X112.962 Y145.572 E.01188
G1 X108.969 Y149.565 E.17368
G1 X108.435 Y149.565 E.01642
G1 X112.679 Y145.321 E.1846
G3 X112.431 Y145.036 I.581 J-.757 E.01172
G1 X108.435 Y149.031 E.17379
G1 X108.435 Y148.497 E.01642
G1 X112.218 Y144.715 E.16453
G1 X112.059 Y144.339 E.01254
G1 X108.435 Y147.963 E.15764
G1 X108.435 Y147.429 E.01642
G1 X111.955 Y143.909 E.15313
G3 X111.917 Y143.414 I1.398 J-.357 E.01537
G1 X108.435 Y146.896 E.15147
G1 X108.435 Y146.362 E.01642
G1 X112.025 Y142.772 E.15614
G1 X112.169 Y142.377 E.01293
G1 X112.437 Y141.938 E.01585
G1 X112.788 Y141.56 E.01585
G1 X113.206 Y141.259 E.01585
G1 X113.676 Y141.047 E.01585
G1 X113.772 Y141.025 E.00303
G1 X119.037 Y135.76 E.22902
G1 X119.26 Y136.071 E.01176
G1 X114.404 Y140.927 E.21123
G3 X114.907 Y140.957 I.176 J1.26 E.01561
G1 X119.495 Y136.37 E.19956
G2 X119.733 Y136.665 I3.08 J-2.238 E.01168
G1 X115.336 Y141.062 E.19126
G1 X115.714 Y141.219 E.01256
G1 X119.984 Y136.949 E.18574
G2 X120.238 Y137.228 I2.924 J-2.412 E.01163
G1 X116.038 Y141.428 E.1827
G3 X116.321 Y141.679 I-.479 J.825 E.01171
G1 X120.502 Y137.498 E.18187
G2 X120.773 Y137.761 I2.769 J-2.583 E.01162
G1 X116.569 Y141.964 E.18284
G1 X116.782 Y142.285 E.01185
G1 X121.05 Y138.018 E.18563
G2 X121.337 Y138.264 I2.613 J-2.756 E.01165
G1 X116.941 Y142.661 E.19124
G1 X116.973 Y142.737 E.00255
G1 X117.044 Y143.091 E.0111
G1 X121.627 Y138.508 E.19936
G1 X121.931 Y138.738 E.01172
G1 X117.083 Y143.586 E.21091
G1 X117.008 Y144.139 E.01714
G1 X116.975 Y144.228 E.00291
G1 X122.238 Y138.964 E.22894
G1 X122.556 Y139.181 E.01182
G1 X112.172 Y149.565 E.45169
G1 X112.706 Y149.565 E.01642
G1 X122.88 Y139.39 E.44259
G1 X123.212 Y139.593 E.01194
G1 X113.24 Y149.565 E.43378
G1 X113.774 Y149.565 E.01642
G1 X123.554 Y139.784 E.42546
G2 X123.901 Y139.971 I2.046 J-3.381 E.01213
M73 P59 R5
G1 X114.307 Y149.565 E.41733
G1 X114.841 Y149.565 E.01642
G1 X124.262 Y140.144 E.40978
G2 X124.628 Y140.312 I1.859 J-3.589 E.0124
G1 X115.375 Y149.565 E.40251
G1 X115.909 Y149.565 E.01642
G1 X125.004 Y140.47 E.39562
G2 X125.391 Y140.616 I1.658 J-3.81 E.01275
G1 X116.443 Y149.565 E.38926
G1 X116.976 Y149.565 E.01642
G1 X125.785 Y140.756 E.38318
G1 X126.193 Y140.882 E.01313
G1 X117.51 Y149.565 E.37771
G1 X118.044 Y149.565 E.01642
G1 X126.611 Y140.997 E.37268
G2 X127.038 Y141.104 I1.287 J-4.22 E.01354
G1 X118.578 Y149.565 E.36802
G1 X119.112 Y149.565 E.01642
G1 X127.482 Y141.194 E.36411
G2 X127.938 Y141.272 I1.011 J-4.526 E.01423
G1 X119.646 Y149.565 E.36071
G1 X120.179 Y149.565 E.01642
G1 X128.405 Y141.339 E.35782
G1 X128.89 Y141.387 E.015
G1 X120.713 Y149.565 E.3557
G1 X121.247 Y149.565 E.01642
G1 X129.394 Y141.418 E.35438
G2 X129.914 Y141.431 I.396 J-5.204 E.01602
G1 X121.781 Y149.565 E.35379
G1 X122.315 Y149.565 E.01642
G1 X130.454 Y141.426 E.35405
G2 X131.016 Y141.397 I-.006 J-5.645 E.01733
G1 X122.848 Y149.565 E.3553
G1 X123.382 Y149.565 E.01642
G1 X131.609 Y141.337 E.35788
G2 X132.234 Y141.246 I-.6 J-6.307 E.01943
G1 X123.916 Y149.565 E.36184
G1 X124.45 Y149.565 E.01642
G1 X132.897 Y141.118 E.36745
G2 X133.607 Y140.942 I-1.407 J-7.197 E.0225
G1 X124.984 Y149.565 E.3751
G1 X125.518 Y149.565 E.01642
G1 X134.385 Y140.698 E.38571
G2 X135.255 Y140.361 I-2.939 J-8.891 E.02873
G1 X126.051 Y149.565 E.40037
G1 X126.585 Y149.565 E.01642
G1 X136.271 Y139.879 E.42132
G2 X137.629 Y139.055 I-6.474 J-12.198 E.04888
G1 X127.119 Y149.565 E.45717
G1 X127.653 Y149.565 E.01642
G1 X151.565 Y125.653 E1.04015
G1 X151.565 Y126.187 E.01642
G1 X128.187 Y149.565 E1.01693
G1 X128.72 Y149.565 E.01642
G1 X151.565 Y126.72 E.99371
G1 X151.565 Y127.254 E.01642
G1 X129.254 Y149.565 E.97049
G1 X129.788 Y149.565 E.01642
G1 X151.565 Y127.788 E.94727
G1 X151.565 Y128.322 E.01642
G1 X130.322 Y149.565 E.92405
G1 X130.856 Y149.565 E.01642
G1 X151.565 Y128.856 E.90083
G1 X151.565 Y129.39 E.01642
G1 X131.39 Y149.565 E.87761
G1 X131.923 Y149.565 E.01642
G1 X151.565 Y129.923 E.85439
G1 X151.565 Y130.457 E.01642
G1 X132.457 Y149.565 E.83117
G1 X132.991 Y149.565 E.01642
G1 X151.565 Y130.991 E.80794
G1 X151.565 Y131.525 E.01642
G1 X133.525 Y149.565 E.78472
G1 X134.059 Y149.565 E.01642
G1 X151.565 Y132.059 E.7615
G1 X151.565 Y132.593 E.01642
G1 X134.592 Y149.565 E.73828
G1 X135.126 Y149.565 E.01642
G1 X151.565 Y133.126 E.71506
G1 X151.565 Y133.66 E.01642
G1 X135.49 Y149.734 E.69922
; WIPE_START
G1 F24000
G1 X136.905 Y148.32 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.163 J-.358 P1  F30000
G1 X123.976 Y106.266 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X116.953 Y113.288 E.30547
G1 X117.008 Y113.139 E.00489
G1 X117.084 Y112.624 E.016
G1 X123.272 Y106.435 E.2692
G1 X122.738 Y106.435 E.01642
G1 X117.051 Y112.123 E.2474
G1 X116.952 Y111.688 E.01372
G1 X122.205 Y106.435 E.22848
G1 X121.671 Y106.435 E.01642
G1 X116.794 Y111.312 E.21215
G1 X116.585 Y110.987 E.01188
G1 X121.137 Y106.435 E.198
G1 X120.603 Y106.435 E.01642
G1 X116.34 Y110.698 E.18543
G1 X116.061 Y110.443 E.01162
G1 X120.069 Y106.435 E.17434
G1 X119.535 Y106.435 E.01642
G1 X115.737 Y110.234 E.16523
G1 X115.364 Y110.073 E.0125
G1 X119.002 Y106.435 E.15824
G1 X118.468 Y106.435 E.01642
G1 X114.94 Y109.963 E.15345
G2 X114.444 Y109.926 I-.34 J1.21 E.01542
G1 X117.934 Y106.435 E.15183
G1 X117.4 Y106.435 E.01642
G1 X113.822 Y110.014 E.15566
G1 X113.676 Y110.047 E.0046
G1 X113.206 Y110.259 E.01585
G1 X112.788 Y110.56 E.01585
G1 X112.437 Y110.938 E.01585
G1 X112.169 Y111.377 E.01585
G1 X112.003 Y111.833 E.01491
G1 X108.435 Y115.4 E.15518
G1 X108.435 Y115.934 E.01642
G1 X111.918 Y112.451 E.15151
G2 X111.962 Y112.941 I1.423 J.12 E.01521
G1 X108.435 Y116.468 E.15341
G1 X108.435 Y117.002 E.01642
G1 X112.071 Y113.366 E.15814
G1 X112.23 Y113.741 E.01252
G1 X108.435 Y117.535 E.16505
G1 X108.435 Y118.069 E.01642
G1 X112.446 Y114.058 E.17447
G2 X112.699 Y114.34 I.822 J-.484 E.0117
G1 X108.435 Y118.603 E.18545
G1 X108.435 Y119.137 E.01642
G1 X112.985 Y114.587 E.19792
G1 X113.31 Y114.796 E.01188
G1 X108.435 Y119.671 E.21203
G1 X108.435 Y120.204 E.01642
G1 X113.691 Y114.949 E.22863
G1 X113.799 Y114.991 E.00357
G1 X114.125 Y115.049 E.01018
G1 X108.435 Y120.738 E.2475
G1 X108.435 Y121.272 E.01642
G1 X114.635 Y115.072 E.26969
G1 X114.822 Y115.068 E.00574
G1 X115.278 Y114.964 E.01438
G1 X108.435 Y121.806 E.29764
G1 X108.435 Y122.34 E.01642
G1 X124.34 Y106.435 E.69184
G1 X124.874 Y106.435 E.01642
G1 X108.435 Y122.874 E.71506
G1 X108.435 Y123.407 E.01642
G1 X125.407 Y106.435 E.73828
G1 X125.941 Y106.435 E.01642
G1 X108.435 Y123.941 E.7615
G1 X108.435 Y124.475 E.01642
G1 X126.475 Y106.435 E.78472
G1 X127.009 Y106.435 E.01642
G1 X108.435 Y125.009 E.80794
G1 X108.435 Y125.543 E.01642
G1 X127.543 Y106.435 E.83116
G1 X128.077 Y106.435 E.01642
G1 X108.435 Y126.077 E.85438
G1 X108.435 Y126.61 E.01642
G1 X128.61 Y106.435 E.8776
G1 X129.144 Y106.435 E.01642
G1 X108.435 Y127.144 E.90083
G1 X108.435 Y127.678 E.01642
G1 X129.678 Y106.435 E.92405
G1 X130.212 Y106.435 E.01642
G1 X108.435 Y128.212 E.94727
G1 X108.435 Y128.746 E.01642
G1 X130.746 Y106.435 E.97049
G1 X131.279 Y106.435 E.01642
G1 X108.435 Y129.279 E.99371
G1 X108.435 Y129.813 E.01642
G1 X131.813 Y106.435 E1.01693
G1 X132.347 Y106.435 E.01642
G1 X108.266 Y130.517 E1.04753
G1 X108.266 Y115.036 F30000
G1 F15000
G1 X116.866 Y106.435 E.37412
G1 X116.332 Y106.435 E.01642
G1 X108.435 Y114.332 E.34352
G1 X108.435 Y113.799 E.01642
G1 X115.799 Y106.435 E.3203
G1 X115.265 Y106.435 E.01642
G1 X108.435 Y113.265 E.29708
G1 X108.435 Y112.731 E.01642
G1 X114.731 Y106.435 E.27386
G1 X114.197 Y106.435 E.01642
G1 X108.435 Y112.197 E.25064
G1 X108.435 Y111.663 E.01642
G1 X113.663 Y106.435 E.22742
G1 X113.13 Y106.435 E.01642
G1 X108.435 Y111.13 E.2042
M73 P60 R5
G1 X108.435 Y110.596 E.01642
G1 X112.596 Y106.435 E.18098
G1 X112.062 Y106.435 E.01642
G1 X108.435 Y110.062 E.15775
G1 X108.435 Y109.528 E.01642
G1 X111.528 Y106.435 E.13453
G1 X110.994 Y106.435 E.01642
G1 X108.435 Y108.994 E.11131
G1 X108.435 Y108.46 E.01642
G1 X110.46 Y106.435 E.08809
G1 X109.927 Y106.435 E.01642
G1 X108.435 Y107.927 E.06487
G1 X108.435 Y107.393 E.01642
G1 X109.393 Y106.435 E.04165
G1 X108.859 Y106.435 E.01642
G1 X108.266 Y107.029 E.02581
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.859 Y106.435 E-.31886
G1 X109.393 Y106.435 E-.20285
G1 X108.949 Y106.879 E-.23829
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
G3 Z.8 I-.469 J1.123 P1  F30000
G1 X128.38 Y114.998 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X129.021 Y114.934 E.02136
G3 X129.673 Y114.902 I.979 J13.064 E.02167
G1 X130.327 Y114.902 E.02167
G3 X128.321 Y115.006 I-.327 J13.096 E2.66372
G1 X128.42 Y115.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X129.683 Y115.294 I1.58 J12.609 E.03895
G1 X130.317 Y115.294 E.01947
G3 X128.36 Y115.396 I-.317 J12.704 E2.39322
M204 S10000
; WIPE_START
G1 F24000
G1 X129.05 Y115.325 E-.2636
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.356 Y115.296 E-.01475
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.042 J-1.216 P1  F30000
G1 X114.522 Y114.75 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.109 Y114.716 E.01375
G3 X114.22 Y110.265 I.391 J-2.217 E.21229
G1 X114.444 Y110.248 E.00745
G3 X114.582 Y114.749 I.056 J2.251 E.23375
G1 X114.546 Y114.357 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X114.269 Y110.654 I-.046 J-1.859 E.17377
G1 X114.454 Y110.64 E.0057
G3 X114.606 Y114.355 I.046 J1.859 E.17762
M204 S10000
; WIPE_START
G1 F24000
G1 X114.177 Y114.332 E-.16334
G1 X113.82 Y114.232 E-.14076
G1 X113.491 Y114.063 E-.14076
G1 X113.34 Y113.954 E-.07048
G1 X113.075 Y113.696 E-.14077
G1 X112.921 Y113.47 E-.10389
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.217 J.008 P1  F30000
G1 X113.124 Y145.28 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X113.097 Y145.259 E.00112
G3 X114.22 Y141.265 I1.403 J-1.761 E.17507
G1 X114.444 Y141.248 E.00745
G3 X113.473 Y145.502 I.056 J2.251 E.27184
G1 X113.174 Y145.312 E.01176
G1 X113.341 Y144.953 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X114.269 Y141.654 I1.159 J-1.454 E.13391
G1 X114.454 Y141.64 E.0057
G3 X113.389 Y144.989 I.046 J1.859 E.21748
M204 S10000
; WIPE_START
G1 F24000
G1 X113.075 Y144.696 E-.16333
G1 X112.866 Y144.39 E-.14077
G1 X112.722 Y144.048 E-.14077
G1 X112.649 Y143.687 E-.14006
G1 X112.642 Y143.407 E-.10645
G1 X112.669 Y143.228 E-.06862
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.057 J1.216 P1  F30000
G1 X144.071 Y141.762 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.096 Y141.739 E.00112
G3 X145.22 Y141.265 I1.404 J1.76 E.04099
G1 X145.444 Y141.248 E.00745
G3 X143.775 Y142.052 I.056 J2.251 E.40591
G1 X144.028 Y141.804 E.01176
G1 X144.336 Y142.05 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.34 Y142.046 E.00019
G3 X145.269 Y141.654 I1.16 J1.453 E.03135
G1 X145.454 Y141.64 E.0057
G3 X144.075 Y142.304 I.046 J1.859 E.31047
G1 X144.293 Y142.092 E.00935
M204 S10000
; WIPE_START
G1 F24000
G1 X144.34 Y142.046 E-.02515
G1 X144.65 Y141.846 E-.14005
G1 X144.908 Y141.737 E-.10646
G1 X145.269 Y141.654 E-.14068
G1 X145.454 Y141.64 E-.07047
G1 X145.639 Y141.645 E-.07047
G1 X146.004 Y141.709 E-.14077
G1 X146.165 Y141.773 E-.06596
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.212 J-.106 P1  F30000
G1 X143.508 Y111.454 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.522 Y111.423 E.00112
G3 X145.221 Y110.265 I1.978 J1.076 E.07081
G1 X145.444 Y110.248 E.00743
G3 X143.348 Y111.836 I.056 J2.251 E.37611
G1 X143.485 Y111.509 E.01176
G1 X143.864 Y111.615 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.867 Y111.611 E.00016
G3 X145.269 Y110.654 I1.633 J.888 E.05416
G1 X145.454 Y110.64 E.00569
G3 X143.723 Y111.952 I.046 J1.859 E.28768
G1 X143.841 Y111.671 E.00937
M204 S10000
; WIPE_START
G1 F24000
G1 X143.867 Y111.611 E-.0248
G1 X144.075 Y111.304 E-.14074
G1 X144.34 Y111.046 E-.14077
G1 X144.651 Y110.845 E-.14077
G1 X144.994 Y110.71 E-.14006
G1 X145.269 Y110.654 E-.10645
G1 X145.443 Y110.641 E-.06641
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.201 J.197 P1  F30000
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
G3 Z1 I1.134 J.442 P1  F30000
G1 X151.734 Y146.531 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420388
G1 F15000
G1 X147.981 Y142.778 E.16327
G1 X148.075 Y143.242 E.01457
G1 X148.075 Y143.406 E.00503
G1 X151.565 Y146.896 E.1518
G1 X151.565 Y147.429 E.01642
G1 X148.044 Y143.909 E.15313
G1 X147.973 Y144.263 E.0111
G1 X147.941 Y144.339 E.00255
G1 X151.565 Y147.963 E.15765
G1 X151.565 Y148.497 E.01642
G1 X147.782 Y144.715 E.16453
G1 X147.569 Y145.036 E.01185
G1 X151.565 Y149.031 E.17379
G1 X151.565 Y149.565 E.01642
G1 X147.321 Y145.321 E.1846
G3 X147.038 Y145.572 I-.764 J-.576 E.01171
G1 X151.031 Y149.565 E.17368
G1 X150.497 Y149.565 E.01642
G1 X146.714 Y145.782 E.16456
G1 X146.343 Y145.944 E.01246
G1 X149.963 Y149.565 E.15748
G1 X149.429 Y149.565 E.01642
G1 X145.912 Y146.047 E.15301
G1 X145.822 Y146.068 E.00284
G1 X145.409 Y146.078 E.0127
G1 X148.896 Y149.565 E.15167
G1 X148.362 Y149.565 E.01642
G1 X144.781 Y145.984 E.15576
G1 X144.319 Y145.803 E.01525
G1 X143.887 Y145.523 E.01585
G1 X143.518 Y145.163 E.01585
G1 X143.227 Y144.738 E.01585
G1 X143.019 Y144.222 E.01711
G1 X137.761 Y138.964 E.2287
G2 X138.069 Y138.738 I-2.117 J-3.192 E.01175
G1 X142.925 Y143.594 E.21125
G1 X142.925 Y143.242 E.01082
G1 X142.956 Y143.091 E.00475
M73 P61 R5
G1 X138.372 Y138.508 E.19937
G2 X138.663 Y138.264 I-2.298 J-3.037 E.01166
G1 X143.059 Y142.661 E.19124
G1 X143.218 Y142.285 E.01254
G1 X138.95 Y138.018 E.18563
G1 X139.227 Y137.761 E.01162
G1 X143.431 Y141.964 E.18284
G3 X143.679 Y141.679 I.83 J.472 E.01172
G1 X139.498 Y137.498 E.18187
G1 X139.762 Y137.228 E.01161
G1 X143.962 Y141.428 E.1827
G1 X144.286 Y141.218 E.01187
G1 X140.016 Y136.949 E.18573
G1 X140.267 Y136.665 E.01163
G1 X144.657 Y141.056 E.19098
G1 X145.088 Y140.953 E.01363
G1 X140.505 Y136.37 E.19937
G2 X140.74 Y136.071 I-2.876 J-2.504 E.0117
G1 X145.591 Y140.922 E.21102
G1 X145.693 Y140.919 E.00315
G1 X146.219 Y141.016 E.01644
G1 X140.963 Y135.76 E.22862
G2 X141.181 Y135.444 I-3.055 J-2.342 E.01181
G1 X151.565 Y145.828 E.45168
G1 X151.565 Y145.294 E.01642
G1 X141.391 Y135.12 E.44256
G2 X141.591 Y134.787 I-3.24 J-2.173 E.01197
G1 X151.565 Y144.76 E.43385
G1 X151.565 Y144.226 E.01642
G1 X141.786 Y134.448 E.42535
G2 X141.968 Y134.096 I-3.435 J-1.998 E.01219
G1 X151.565 Y143.693 E.41744
G1 X151.565 Y143.159 E.01642
G1 X142.146 Y133.74 E.40973
G1 X142.312 Y133.372 E.01241
G1 X151.565 Y142.625 E.40251
G1 X151.565 Y142.091 E.01642
G1 X142.468 Y132.995 E.39568
G1 X142.619 Y132.612 E.01267
G1 X151.565 Y141.557 E.38914
G1 X151.565 Y141.024 E.01642
G1 X142.754 Y132.213 E.38327
G2 X142.882 Y131.807 I-4.002 J-1.485 E.01309
G1 X151.565 Y140.49 E.3777
G1 X151.565 Y139.956 E.01642
G1 X142.999 Y131.39 E.3726
G2 X143.102 Y130.959 I-4.271 J-1.242 E.01364
G1 X151.565 Y139.422 E.36814
G1 X151.565 Y138.888 E.01642
G1 X143.195 Y130.518 E.36409
G1 X143.275 Y130.064 E.01417
G1 X151.565 Y138.354 E.36061
G1 X151.565 Y137.821 E.01642
G1 X143.337 Y129.593 E.3579
G2 X143.386 Y129.108 I-4.831 J-.735 E.01499
G1 X151.565 Y137.287 E.35577
G1 X151.565 Y136.753 E.01642
G1 X143.42 Y128.609 E.35427
G1 X143.433 Y128.088 E.01603
G1 X151.565 Y136.219 E.3537
G1 X151.565 Y135.685 E.01642
G1 X143.424 Y127.545 E.3541
M73 P61 R4
G2 X143.39 Y126.977 I-6.744 J.121 E.01751
G1 X151.565 Y135.152 E.35559
G1 X151.565 Y134.618 E.01642
G1 X143.334 Y126.388 E.35801
G2 X143.244 Y125.764 I-6.295 J.591 E.0194
G1 X151.565 Y134.084 E.36193
G1 X151.565 Y133.55 E.01642
G1 X143.115 Y125.101 E.36755
G2 X142.937 Y124.388 I-7.223 J1.43 E.02259
G1 X151.565 Y133.016 E.37531
G1 X151.565 Y132.482 E.01642
G1 X142.695 Y123.613 E.38581
G2 X142.367 Y122.751 I-17.947 J6.342 E.02838
G1 X151.565 Y131.949 E.40009
G1 X151.565 Y131.415 E.01642
G1 X141.879 Y121.729 E.42134
G2 X141.065 Y120.381 I-9.018 J4.526 E.04846
G1 X151.565 Y130.881 E.45673
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
G1 X151.565 Y123.407 E.73828
G1 X151.565 Y122.874 E.01642
G1 X135.126 Y106.435 E.71506
G1 X135.66 Y106.435 E.01642
G1 X151.734 Y122.51 E.69922
G1 X151.734 Y107.029 F30000
G1 F15000
G1 X151.141 Y106.435 E.02581
G1 X150.607 Y106.435 E.01642
G1 X151.565 Y107.393 E.04165
G1 X151.565 Y107.927 E.01642
G1 X150.073 Y106.435 E.06487
G1 X149.539 Y106.435 E.01642
G1 X151.565 Y108.461 E.08809
G1 X151.565 Y108.994 E.01642
G1 X149.006 Y106.435 E.11132
G1 X148.472 Y106.435 E.01642
G1 X151.565 Y109.528 E.13454
G1 X151.565 Y110.062 E.01642
G1 X147.938 Y106.435 E.15776
G1 X147.404 Y106.435 E.01642
G1 X151.565 Y110.596 E.18098
G1 X151.565 Y111.13 E.01642
G1 X146.87 Y106.435 E.2042
G1 X146.337 Y106.435 E.01642
G1 X151.565 Y111.663 E.22742
G1 X151.565 Y112.197 E.01642
G1 X145.803 Y106.435 E.25064
G1 X145.269 Y106.435 E.01642
G1 X151.565 Y112.731 E.27386
G1 X151.565 Y113.265 E.01642
G1 X144.735 Y106.435 E.29708
G1 X144.201 Y106.435 E.01642
G1 X151.565 Y113.799 E.3203
G1 X151.565 Y114.333 E.01642
G1 X143.667 Y106.435 E.34353
G1 X143.134 Y106.435 E.01642
G1 X151.565 Y114.866 E.36675
G1 X151.565 Y115.4 E.01642
G1 X147.991 Y111.826 E.15546
G1 X148.075 Y112.242 E.01305
G1 X148.075 Y112.444 E.00621
G1 X151.565 Y115.934 E.1518
G1 X151.565 Y116.468 E.01642
G1 X148.038 Y112.941 E.15342
G1 X147.973 Y113.263 E.0101
G1 X147.929 Y113.366 E.00345
G1 X151.565 Y117.002 E.15814
G1 X151.565 Y117.535 E.01642
G1 X147.77 Y113.741 E.16505
G1 X147.554 Y114.058 E.01182
G1 X151.565 Y118.069 E.17447
G1 X151.565 Y118.603 E.01642
G1 X147.301 Y114.34 E.18545
G3 X147.015 Y114.587 I-.755 J-.586 E.01172
G1 X151.565 Y119.137 E.19792
G1 X151.565 Y119.671 E.01642
M73 P62 R4
G1 X146.69 Y114.796 E.21203
G1 X146.309 Y114.949 E.01264
G1 X151.565 Y120.205 E.22863
G1 X151.565 Y120.738 E.01642
G1 X145.881 Y115.054 E.24725
G1 X145.371 Y115.079 E.01568
G1 X151.565 Y121.272 E.26941
G1 X151.565 Y121.806 E.01642
G1 X144.718 Y114.959 E.29784
G1 X144.319 Y114.803 E.01316
G1 X143.887 Y114.523 E.01585
G1 X143.518 Y114.163 E.01585
G1 X143.227 Y113.738 E.01585
G1 X143.031 Y113.273 E.01551
G1 X136.194 Y106.435 E.29743
G1 X136.728 Y106.435 E.01642
G1 X142.925 Y112.633 E.26958
G1 X142.925 Y112.242 E.01201
G1 X142.949 Y112.123 E.00375
G1 X137.262 Y106.435 E.24741
G1 X137.795 Y106.435 E.01642
G1 X143.048 Y111.688 E.22849
G1 X143.206 Y111.312 E.01254
G1 X138.329 Y106.435 E.21215
G1 X138.863 Y106.435 E.01642
G1 X143.415 Y110.987 E.19801
G3 X143.66 Y110.698 I.837 J.461 E.01173
G1 X139.397 Y106.435 E.18543
G1 X139.931 Y106.435 E.01642
G1 X143.939 Y110.443 E.17434
G1 X144.263 Y110.234 E.01188
G1 X140.465 Y106.435 E.16523
G1 X140.998 Y106.435 E.01642
G1 X144.636 Y110.073 E.15823
G3 X145.055 Y109.958 I.537 J1.139 E.01343
G1 X141.532 Y106.435 E.15324
G1 X142.066 Y106.435 E.01642
G1 X145.554 Y109.923 E.15171
G1 X145.693 Y109.919 E.0043
G1 X146.168 Y110.003 E.01481
G1 X142.43 Y106.266 E.16258
G1 X138.525 Y117.841 F30000
G1 F15000
G1 X127.119 Y106.435 E.49615
G1 X126.585 Y106.435 E.01642
G1 X136.271 Y116.121 E.42132
G2 X135.255 Y115.639 I-6.605 J12.614 E.03458
G1 X126.051 Y106.435 E.40037
G1 X125.518 Y106.435 E.01642
G1 X134.385 Y115.302 E.38571
G2 X133.607 Y115.058 I-7.562 J22.739 E.02508
G1 X124.984 Y106.435 E.3751
G1 X124.45 Y106.435 E.01642
G1 X132.897 Y114.882 E.36745
G2 X132.234 Y114.754 I-1.623 J6.576 E.02077
G1 X123.916 Y106.435 E.36184
G1 X123.382 Y106.435 E.01642
G1 X131.609 Y114.663 E.35788
G1 X131.016 Y114.603 E.01834
G1 X122.848 Y106.435 E.3553
G1 X122.315 Y106.435 E.01642
G1 X130.454 Y114.574 E.35405
G2 X129.914 Y114.569 I-.329 J5.404 E.01661
G1 X121.781 Y106.435 E.35379
G1 X121.247 Y106.435 E.01642
G1 X129.394 Y114.582 E.35438
G2 X128.89 Y114.613 I.053 J5.059 E.01552
G1 X120.713 Y106.435 E.3557
G1 X120.179 Y106.435 E.01642
G1 X128.405 Y114.661 E.35782
G2 X127.938 Y114.728 I.433 J4.714 E.01452
G1 X119.646 Y106.435 E.36071
G1 X119.112 Y106.435 E.01642
G1 X127.482 Y114.806 E.36411
G1 X127.038 Y114.896 E.01393
G1 X118.578 Y106.435 E.36802
G1 X118.044 Y106.435 E.01642
G1 X126.611 Y115.003 E.37268
G2 X126.193 Y115.118 I.948 J4.248 E.01335
G1 X117.51 Y106.435 E.37771
G1 X116.976 Y106.435 E.01642
G1 X125.785 Y115.244 E.38318
G2 X125.391 Y115.384 I1.204 J4.017 E.01286
G1 X116.443 Y106.435 E.38926
G1 X115.909 Y106.435 E.01642
G1 X125.004 Y115.53 E.39562
G1 X124.628 Y115.688 E.01254
G1 X115.375 Y106.435 E.40251
G1 X114.841 Y106.435 E.01642
G1 X124.262 Y115.856 E.40978
G1 X123.901 Y116.029 E.0123
G1 X114.307 Y106.435 E.41733
G1 X113.774 Y106.435 E.01642
G1 X123.554 Y116.216 E.42546
G2 X123.212 Y116.407 I1.744 J3.527 E.01207
G1 X113.24 Y106.435 E.43378
G1 X112.706 Y106.435 E.01642
G1 X122.88 Y116.61 E.44259
G2 X122.556 Y116.819 I1.934 J3.356 E.01188
G1 X112.172 Y106.435 E.45169
G1 X111.638 Y106.435 E.01642
G1 X115.219 Y110.016 E.15576
G1 X114.693 Y109.919 E.01644
G1 X114.591 Y109.922 E.00315
G1 X111.104 Y106.435 E.15167
G1 X110.571 Y106.435 E.01642
G1 X114.088 Y109.953 E.15301
G1 X113.657 Y110.056 E.01363
G1 X110.037 Y106.435 E.15748
G1 X109.503 Y106.435 E.01642
G1 X113.289 Y110.221 E.1647
G2 X112.966 Y110.432 I.358 J.905 E.01195
G1 X108.969 Y106.435 E.17385
G1 X108.435 Y106.435 E.01642
G1 X112.678 Y110.678 E.18455
G1 X112.424 Y110.958 E.01163
G1 X108.435 Y106.969 E.17353
G1 X108.435 Y107.503 E.01642
G1 X112.222 Y111.29 E.16472
G2 X112.064 Y111.665 I.85 J.579 E.01262
G1 X108.435 Y108.037 E.15783
G1 X108.435 Y108.571 E.01642
G1 X111.957 Y112.093 E.15321
G2 X111.922 Y112.591 I1.381 J.348 E.01545
G1 X108.435 Y109.104 E.15167
G1 X108.435 Y109.638 E.01642
G1 X112.019 Y113.222 E.15589
G1 X112.227 Y113.738 E.01711
G1 X112.518 Y114.163 E.01585
G1 X112.887 Y114.523 E.01585
G1 X113.319 Y114.803 E.01585
G1 X113.781 Y114.984 E.01525
G1 X119.037 Y120.24 E.22863
G1 X119.26 Y119.929 E.01176
G1 X114.409 Y115.078 E.21103
G1 X114.822 Y115.068 E.01271
G1 X114.912 Y115.047 E.00284
G1 X119.495 Y119.63 E.19937
G3 X119.733 Y119.335 I3.08 J2.238 E.01168
G1 X115.343 Y114.945 E.19097
G1 X115.711 Y114.779 E.01241
G1 X119.984 Y119.051 E.18586
G3 X120.238 Y118.772 I2.925 J2.412 E.01163
G1 X116.034 Y114.568 E.18287
G2 X116.322 Y114.322 I-.465 J-.835 E.01172
G1 X120.502 Y118.502 E.18182
G3 X120.773 Y118.239 I2.769 J2.584 E.01162
G1 X116.575 Y114.042 E.18258
G1 X116.778 Y113.71 E.01194
G1 X121.05 Y117.982 E.18582
G3 X121.337 Y117.736 I2.613 J2.755 E.01165
G1 X116.936 Y113.335 E.19143
G2 X117.043 Y112.907 I-1.005 J-.477 E.01364
G1 X121.627 Y117.492 E.19944
G1 X121.931 Y117.262 E.01172
G1 X117.078 Y112.409 E.21112
G1 X117.073 Y112.233 E.00542
G1 X116.981 Y111.778 E.01426
G1 X122.361 Y117.158 E.23401
; WIPE_START
G1 F24000
G1 X120.946 Y115.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.502 J-1.109 P1  F30000
G1 X108.266 Y110.002 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X118.819 Y120.556 E.45906
G1 X118.609 Y120.88 E.01188
G1 X108.435 Y110.706 E.44256
G1 X108.435 Y111.24 E.01642
G1 X118.409 Y121.213 E.43385
G1 X118.214 Y121.552 E.01202
G1 X108.435 Y111.774 E.42535
G1 X108.435 Y112.307 E.01642
G1 X118.032 Y121.904 E.41744
G2 X117.854 Y122.26 I3.482 J1.954 E.01225
G1 X108.435 Y112.841 E.40973
G1 X108.435 Y113.375 E.01642
G1 X117.688 Y122.628 E.40251
G2 X117.532 Y123.005 I3.698 J1.761 E.01256
G1 X108.435 Y113.909 E.39568
G1 X108.435 Y114.443 E.01642
G1 X117.381 Y123.388 E.38913
G2 X117.246 Y123.787 I3.928 J1.551 E.01296
G1 X108.435 Y114.977 E.38326
G1 X108.435 Y115.51 E.01642
G1 X117.118 Y124.193 E.3777
G1 X117.001 Y124.61 E.01331
G1 X108.435 Y116.044 E.3726
G1 X108.435 Y116.578 E.01642
G1 X116.898 Y125.041 E.36814
G2 X116.805 Y125.482 I4.368 J1.153 E.01386
G1 X108.435 Y117.112 E.36409
G1 X108.435 Y117.646 E.01642
G1 X116.725 Y125.936 E.36061
G2 X116.663 Y126.407 I4.692 J.859 E.01464
G1 X108.435 Y118.179 E.3579
G1 X108.435 Y118.713 E.01642
G1 X116.614 Y126.892 E.35576
G2 X116.58 Y127.391 I4.986 J.594 E.01541
G1 X108.435 Y119.247 E.35427
G1 X108.435 Y119.781 E.01642
G1 X116.567 Y127.912 E.3537
G2 X116.576 Y128.455 I5.445 J.18 E.01671
G1 X108.435 Y120.315 E.3541
G1 X108.435 Y120.849 E.01642
G1 X116.61 Y129.023 E.35559
G2 X116.666 Y129.613 I5.145 J-.188 E.01822
G1 X108.435 Y121.382 E.35801
G1 X108.435 Y121.916 E.01642
G1 X116.756 Y130.237 E.36193
G2 X116.885 Y130.9 I6.707 J-.963 E.02079
G1 X108.435 Y122.45 E.36755
G1 X108.435 Y122.984 E.01642
G1 X117.063 Y131.612 E.37531
G2 X117.305 Y132.387 I7.887 J-2.031 E.02499
G1 X108.435 Y123.518 E.38581
G1 X108.435 Y124.051 E.01642
G1 X117.633 Y133.249 E.4001
G2 X118.121 Y134.271 I10.486 J-4.382 E.03486
G1 X108.435 Y124.585 E.42134
G1 X108.435 Y125.119 E.01642
G1 X118.935 Y135.619 E.45674
G2 X122.371 Y139.055 I10.953 J-7.517 E.15031
G1 X132.881 Y149.565 E.45717
G1 X133.415 Y149.565 E.01642
G1 X123.729 Y139.879 E.42133
G2 X124.745 Y140.361 I6.605 J-12.614 E.03458
G1 X133.949 Y149.565 E.40037
G1 X134.482 Y149.565 E.01642
G1 X125.615 Y140.698 E.38572
G2 X126.393 Y140.942 I7.563 J-22.74 E.02508
G1 X135.016 Y149.565 E.3751
G1 X135.55 Y149.565 E.01642
G1 X127.103 Y141.117 E.36745
M73 P63 R4
G2 X127.766 Y141.246 I1.623 J-6.575 E.02077
G1 X136.084 Y149.565 E.36184
G1 X136.618 Y149.565 E.01642
G1 X128.39 Y141.337 E.35788
G1 X128.984 Y141.397 E.01834
G1 X137.151 Y149.565 E.3553
G1 X137.685 Y149.565 E.01642
G1 X129.546 Y141.426 E.35405
G2 X130.086 Y141.431 I.329 J-5.403 E.01661
G1 X138.219 Y149.565 E.35379
G1 X138.753 Y149.565 E.01642
G1 X130.606 Y141.418 E.35438
G2 X131.11 Y141.388 I-.053 J-5.059 E.01552
G1 X139.287 Y149.565 E.3557
G1 X139.821 Y149.565 E.01642
G1 X131.595 Y141.339 E.35782
G2 X132.062 Y141.272 I-.433 J-4.713 E.01452
G1 X140.354 Y149.565 E.36071
G1 X140.888 Y149.565 E.01642
G1 X132.518 Y141.194 E.36411
G1 X132.962 Y141.104 E.01393
G1 X141.422 Y149.565 E.36802
G1 X141.956 Y149.565 E.01642
G1 X133.388 Y140.997 E.37268
G2 X133.807 Y140.882 I-.948 J-4.248 E.01335
G1 X142.49 Y149.565 E.3777
G1 X143.023 Y149.565 E.01642
G1 X134.215 Y140.756 E.38318
G2 X134.609 Y140.616 I-1.204 J-4.017 E.01286
G1 X143.557 Y149.565 E.38926
G1 X144.091 Y149.565 E.01642
G1 X134.996 Y140.47 E.39562
G1 X135.372 Y140.312 E.01253
G1 X144.625 Y149.565 E.4025
G1 X145.159 Y149.565 E.01642
G1 X135.738 Y140.144 E.40978
G1 X136.099 Y139.971 E.0123
G1 X145.693 Y149.565 E.41733
G1 X146.226 Y149.565 E.01642
G1 X136.446 Y139.784 E.42546
G2 X136.788 Y139.593 I-1.745 J-3.528 E.01207
G1 X146.76 Y149.565 E.43378
G1 X147.294 Y149.565 E.01642
G1 X137.12 Y139.39 E.44259
G2 X137.444 Y139.181 I-1.934 J-3.356 E.01188
G1 X147.998 Y149.734 E.45907
G1 X132.517 Y149.734 F30000
G1 F15000
G1 X108.435 Y125.653 E1.04753
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
G1 X108.435 Y133.126 E.71506
G1 X108.435 Y133.66 E.01642
G1 X124.34 Y149.565 E.69184
G1 X123.806 Y149.565 E.01642
G1 X116.969 Y142.727 E.29742
G1 X117.073 Y143.233 E.01587
G1 X117.077 Y143.369 E.00421
G1 X123.272 Y149.565 E.26949
G1 X122.738 Y149.565 E.01642
G1 X117.048 Y143.874 E.24754
G3 X116.947 Y144.307 I-1.121 J-.034 E.01376
G1 X122.204 Y149.565 E.22872
G1 X121.671 Y149.565 E.01642
G1 X116.793 Y144.687 E.2122
G1 X116.59 Y145.018 E.01194
G1 X121.137 Y149.565 E.19778
G1 X120.603 Y149.565 E.01642
G1 X116.34 Y145.302 E.18542
G3 X116.057 Y145.552 I-.76 J-.577 E.01171
G1 X120.069 Y149.565 E.17454
G1 X119.535 Y149.565 E.01642
G1 X115.737 Y145.767 E.16521
G1 X115.369 Y145.933 E.01241
G1 X119.002 Y149.565 E.15799
G1 X118.468 Y149.565 E.01642
G1 X114.943 Y146.04 E.15332
G1 X114.822 Y146.068 E.00383
G1 X114.446 Y146.077 E.01155
G1 X117.934 Y149.565 E.15171
G1 X117.4 Y149.565 E.01642
G1 X113.832 Y145.997 E.1552
G1 X113.319 Y145.803 E.01687
G1 X112.887 Y145.523 E.01585
G1 X112.518 Y145.163 E.01585
G1 X112.227 Y144.738 E.01585
G1 X112.027 Y144.263 E.01585
G1 X112.009 Y144.174 E.0028
G1 X108.435 Y140.6 E.15546
G1 X108.435 Y140.066 E.01642
G1 X111.921 Y143.552 E.15163
G3 X111.962 Y143.059 I1.403 J-.13 E.01528
G1 X108.435 Y139.532 E.15343
G1 X108.435 Y138.998 E.01642
G1 X112.074 Y142.637 E.15828
G3 X112.237 Y142.266 I.999 J.217 E.01255
G1 X108.435 Y138.465 E.16535
G1 X108.435 Y137.931 E.01642
G1 X112.44 Y141.935 E.17418
G1 X112.696 Y141.658 E.01162
G1 X108.435 Y137.397 E.18536
G1 X108.435 Y136.863 E.01642
G1 X112.988 Y141.416 E.19804
G3 X113.316 Y141.21 I.674 J.707 E.01199
G1 X108.435 Y136.329 E.21229
G1 X108.435 Y135.796 E.01642
G1 X113.685 Y141.045 E.22835
G1 X114.119 Y140.946 E.01371
G1 X108.435 Y135.262 E.24725
G1 X108.435 Y134.728 E.01642
G1 X114.629 Y140.921 E.2694
G1 X115.201 Y141.009 E.01781
G1 X115.282 Y141.041 E.00269
G1 X108.266 Y134.024 E.30522
G1 X109.029 Y149.734 F30000
G1 F15000
G1 X108.435 Y149.141 E.02581
G1 X108.435 Y148.607 E.01642
G1 X109.393 Y149.565 E.04165
G1 X109.927 Y149.565 E.01642
G1 X108.435 Y148.073 E.06487
G1 X108.435 Y147.54 E.01642
G1 X110.46 Y149.565 E.08809
G1 X110.994 Y149.565 E.01642
G1 X108.435 Y147.006 E.11131
G1 X108.435 Y146.472 E.01642
G1 X111.528 Y149.565 E.13453
G1 X112.062 Y149.565 E.01642
G1 X108.435 Y145.938 E.15775
G1 X108.435 Y145.404 E.01642
G1 X112.596 Y149.565 E.18098
G1 X113.13 Y149.565 E.01642
G1 X108.435 Y144.87 E.2042
G1 X108.435 Y144.337 E.01642
G1 X113.663 Y149.565 E.22742
G1 X114.197 Y149.565 E.01642
G1 X108.435 Y143.803 E.25064
G1 X108.435 Y143.269 E.01642
G1 X114.731 Y149.565 E.27386
G1 X115.265 Y149.565 E.01642
G1 X108.435 Y142.735 E.29708
G1 X108.435 Y142.201 E.01642
G1 X115.799 Y149.565 E.3203
G1 X116.332 Y149.565 E.01642
G1 X108.435 Y141.668 E.34352
G1 X108.435 Y141.134 E.01642
G1 X117.036 Y149.734 E.37412
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.622 Y148.32 E-.76
; WIPE_END
M73 P64 R4
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
G3 Z1 I1.137 J.435 P1  F30000
G1 X128.38 Y114.998 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10192
G1 X129.021 Y114.934 E.02136
G3 X129.673 Y114.902 I.979 J13.064 E.02167
G1 X130.327 Y114.902 E.02167
G3 X128.321 Y115.006 I-.327 J13.096 E2.66372
G1 X128.42 Y115.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10192
G3 X129.683 Y115.294 I1.58 J12.609 E.03895
G1 X130.317 Y115.294 E.01947
G3 X128.36 Y115.396 I-.317 J12.704 E2.39322
M204 S10000
; WIPE_START
G1 F24000
G1 X129.05 Y115.325 E-.26362
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.356 Y115.296 E-.01474
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.042 J-1.216 P1  F30000
G1 X114.522 Y114.75 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10192
G1 X114.109 Y114.716 E.01375
G3 X114.22 Y110.265 I.391 J-2.217 E.21229
G1 X114.444 Y110.248 E.00745
G3 X114.582 Y114.749 I.056 J2.251 E.23375
G1 X114.546 Y114.357 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10192
G3 X114.269 Y110.654 I-.046 J-1.859 E.17377
G1 X114.454 Y110.64 E.0057
G3 X114.606 Y114.355 I.046 J1.859 E.17762
M204 S10000
; WIPE_START
G1 F24000
G1 X114.177 Y114.332 E-.16333
G1 X113.996 Y114.291 E-.07047
G1 X113.651 Y114.155 E-.14076
G1 X113.34 Y113.954 E-.14077
G1 X113.075 Y113.696 E-.14077
G1 X112.921 Y113.47 E-.10389
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.217 J.008 P1  F30000
G1 X113.124 Y145.28 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10192
G1 X113.097 Y145.259 E.00112
G3 X114.22 Y141.265 I1.403 J-1.761 E.17507
G1 X114.444 Y141.248 E.00745
G3 X113.473 Y145.502 I.056 J2.251 E.27184
G1 X113.174 Y145.312 E.01176
G1 X113.343 Y144.956 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10192
G1 X113.341 Y144.953 E.00012
G3 X114.269 Y141.654 I1.159 J-1.454 E.13391
G1 X114.454 Y141.64 E.0057
G3 X113.652 Y145.153 I.046 J1.859 E.20793
G1 X113.394 Y144.989 E.00943
M204 S10000
; WIPE_START
G1 F24000
G1 X113.341 Y144.953 E-.02405
G1 X113.075 Y144.696 E-.1407
G1 X112.866 Y144.39 E-.14077
G1 X112.722 Y144.048 E-.14077
G1 X112.649 Y143.687 E-.14015
G1 X112.642 Y143.407 E-.1064
G1 X112.668 Y143.232 E-.06717
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.057 J1.216 P1  F30000
G1 X144.068 Y141.765 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10192
G1 X144.09 Y141.744 E.00101
G3 X145.22 Y141.265 I1.41 J1.755 E.04124
G1 X145.444 Y141.248 E.00745
G3 X143.775 Y142.052 I.056 J2.251 E.40591
G1 X144.025 Y141.807 E.01163
G1 X144.33 Y142.055 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10192
G1 X144.338 Y142.047 E.00034
G3 X145.269 Y141.654 I1.162 J1.451 E.03143
G1 X145.454 Y141.64 E.0057
G3 X144.075 Y142.304 I.046 J1.859 E.31047
G1 X144.287 Y142.097 E.00912
M204 S10000
; WIPE_START
G1 F24000
G1 X144.338 Y142.047 E-.02697
G1 X144.57 Y141.889 E-.10664
G1 X144.908 Y141.737 E-.14077
G1 X145.269 Y141.654 E-.14076
G1 X145.454 Y141.64 E-.07048
G1 X145.823 Y141.668 E-.14076
G1 X146.161 Y141.763 E-.13362
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.212 J-.106 P1  F30000
G1 X143.508 Y111.454 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10192
G1 X143.522 Y111.423 E.00112
G3 X145.221 Y110.265 I1.978 J1.075 E.07082
G1 X145.444 Y110.248 E.00742
G3 X143.349 Y111.836 I.057 J2.251 E.37611
G1 X143.485 Y111.509 E.01176
G1 X143.861 Y111.622 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10192
G1 X143.867 Y111.611 E.00038
G3 X145.269 Y110.654 I1.633 J.888 E.05416
G1 X145.454 Y110.64 E.00569
G3 X143.723 Y111.952 I.046 J1.859 E.28768
G1 X143.838 Y111.677 E.00915
M204 S10000
; WIPE_START
G1 F24000
G1 X143.867 Y111.611 E-.02753
G1 X144.075 Y111.304 E-.14075
G1 X144.34 Y111.046 E-.14077
G1 X144.651 Y110.845 E-.14076
G1 X144.995 Y110.71 E-.14015
G1 X145.269 Y110.654 E-.1064
G1 X145.436 Y110.642 E-.06363
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.201 J.198 P1  F30000
G1 X151.898 Y149.898 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10192
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10192
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
G1 F10192
G1 X151.55 Y149.55 E.05401
G1 X147.333 Y145.333 E.19783
G3 X143.519 Y145.185 I-1.838 J-1.852 E.14201
G1 X139.154 Y149.55 E.20474
G1 X136.198 Y149.55 E.09807
G1 X127.935 Y141.287 E.38761
G3 X125.137 Y140.539 I2.115 J-13.526 E.09627
G1 X116.126 Y149.55 E.42269
G1 X113.17 Y149.55 E.09807
G1 X108.45 Y144.83 E.2214
G1 X108.45 Y141.874 E.09807
G1 X117.463 Y132.861 E.4228
G3 X116.71 Y130.062 I12.761 J-4.935 E.09635
G1 X108.45 Y121.802 E.38746
G1 X108.45 Y118.846 E.09807
G1 X112.818 Y114.478 E.20492
G3 X112.667 Y110.667 I1.68 J-1.975 E.14213
G1 X108.45 Y106.45 E.19783
G1 X110.079 Y106.45 E.05401
; WIPE_START
G1 F24000
G1 X108.45 Y106.45 E-.61876
G1 X108.713 Y106.713 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.828 J.892 P1  F30000
G1 X140.587 Y136.29 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F10192
G3 X139.509 Y137.509 I-10.92 J-8.579 E.05401
G1 X143.668 Y141.668 E.19513
G3 X147.182 Y141.522 I1.836 J1.844 E.12806
G1 X151.55 Y137.154 E.20492
G1 X151.55 Y134.198 E.09807
G1 X143.29 Y125.938 E.38746
G2 X142.537 Y123.139 I-13.515 J2.135 E.09635
G1 X151.55 Y114.126 E.4228
G1 X151.55 Y111.17 E.09807
G1 X146.83 Y106.45 E.2214
G1 X143.874 Y106.45 E.09807
G1 X134.863 Y115.461 E.42269
G2 X132.065 Y114.713 I-4.914 J12.779 E.09627
G1 X123.802 Y106.45 E.38761
G1 X120.846 Y106.45 E.09807
G1 X116.481 Y110.815 E.20474
G3 X116.333 Y114.333 I-1.99 J1.678 E.12827
G1 X120.491 Y118.491 E.19509
G2 X119.413 Y119.71 I9.841 J9.797 E.05401
G1 X108.45 Y124.893 F30000
G1 F10192
G1 X108.45 Y126.522 E.05401
G1 X128.522 Y106.45 E.94159
M73 P65 R4
G1 X131.478 Y106.45 E.09807
G1 X151.55 Y126.522 E.94159
G1 X151.55 Y129.478 E.09807
G1 X131.478 Y149.55 E.94159
G1 X128.522 Y149.55 E.09807
G1 X108.45 Y129.478 E.94159
G1 X108.45 Y131.107 E.05401
G1 X119.413 Y136.29 F30000
G1 F10192
G2 X120.491 Y137.509 I10.92 J-8.579 E.05401
G1 X116.331 Y141.669 E.19514
G2 X112.817 Y141.52 I-1.836 J1.802 E.1285
G1 X108.45 Y137.154 E.20483
G1 X108.45 Y134.198 E.09807
G1 X116.71 Y125.938 E.38746
G3 X117.463 Y123.139 I13.514 J2.135 E.09635
G1 X108.45 Y114.126 E.4228
G1 X108.45 Y111.17 E.09807
G1 X113.17 Y106.45 E.2214
G1 X116.126 Y106.45 E.09807
G1 X125.137 Y115.461 E.42269
G3 X127.935 Y114.713 I4.914 J12.779 E.09627
G1 X136.198 Y106.45 E.38761
G1 X139.154 Y106.45 E.09807
G1 X143.519 Y110.815 E.20474
G3 X147.331 Y110.669 I1.975 J1.703 E.14199
G1 X151.55 Y106.45 E.19788
G1 X149.921 Y106.45 E.05401
; WIPE_START
G1 F24000
G1 X151.55 Y106.45 E-.61876
G1 X151.287 Y106.713 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.94 J-.773 P1  F30000
G1 X140.587 Y119.71 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F10192
G2 X139.509 Y118.491 I-10.92 J8.579 E.05401
G1 X143.669 Y114.331 E.19514
G2 X147.183 Y114.48 I1.836 J-1.802 E.1285
G1 X151.55 Y118.846 E.20483
G1 X151.55 Y121.802 E.09807
G1 X143.29 Y130.062 E.38746
G3 X142.537 Y132.861 I-13.515 J-2.135 E.09635
G1 X151.55 Y141.874 E.4228
G1 X151.55 Y144.83 E.09807
G1 X146.83 Y149.55 E.2214
G1 X143.874 Y149.55 E.09807
G1 X134.863 Y140.539 E.42269
G3 X132.065 Y141.287 I-4.914 J-12.778 E.09627
G1 X123.802 Y149.55 E.38761
G1 X120.846 Y149.55 E.09807
G1 X116.475 Y145.179 E.20504
G3 X112.669 Y145.331 I-1.974 J-1.683 E.14192
G1 X108.45 Y149.55 E.19788
G1 X110.079 Y149.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.45 Y149.55 E-.61876
G1 X108.713 Y149.287 E-.14124
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
G3 Z1.2 I1.056 J.605 P1  F30000
G1 X128.38 Y114.998 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10179
G1 X129.021 Y114.934 E.02136
G3 X129.673 Y114.902 I.979 J13.064 E.02167
G1 X130.327 Y114.902 E.02167
G3 X128.321 Y115.006 I-.327 J13.096 E2.66372
G1 X128.42 Y115.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10179
G3 X129.683 Y115.294 I1.58 J12.609 E.03895
G1 X130.317 Y115.294 E.01947
G3 X128.36 Y115.396 I-.317 J12.704 E2.39322
M204 S10000
; WIPE_START
G1 F24000
G1 X129.05 Y115.325 E-.26362
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.356 Y115.296 E-.01474
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.042 J-1.216 P1  F30000
G1 X114.522 Y114.75 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10179
G1 X114.109 Y114.716 E.01375
G3 X114.22 Y110.265 I.391 J-2.217 E.21229
G1 X114.444 Y110.248 E.00745
G3 X114.582 Y114.749 I.056 J2.251 E.23375
G1 X114.546 Y114.357 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10179
G3 X114.269 Y110.654 I-.046 J-1.859 E.17377
G1 X114.454 Y110.64 E.0057
G3 X114.606 Y114.355 I.046 J1.859 E.17762
M204 S10000
; WIPE_START
G1 F24000
G1 X114.177 Y114.332 E-.16333
G1 X113.82 Y114.232 E-.14077
G1 X113.491 Y114.063 E-.14077
G1 X113.34 Y113.954 E-.07047
G1 X113.075 Y113.696 E-.14077
G1 X112.921 Y113.47 E-.10389
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.217 J.008 P1  F30000
G1 X113.124 Y145.28 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10179
G1 X113.097 Y145.259 E.00112
G3 X114.22 Y141.265 I1.403 J-1.761 E.17507
G1 X114.444 Y141.248 E.00745
G3 X113.473 Y145.502 I.056 J2.251 E.27184
G1 X113.174 Y145.312 E.01176
G1 X113.347 Y144.959 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10179
G1 X113.341 Y144.953 E.00024
G3 X114.269 Y141.654 I1.159 J-1.454 E.13391
G1 X114.454 Y141.64 E.0057
G3 X113.652 Y145.153 I.046 J1.859 E.20793
G1 X113.397 Y144.991 E.00929
M204 S10000
; WIPE_START
G1 F24000
G1 X113.341 Y144.953 E-.02568
G1 X113.075 Y144.696 E-.14069
G1 X112.866 Y144.39 E-.14077
G1 X112.722 Y144.048 E-.14077
G1 X112.649 Y143.687 E-.14023
G1 X112.642 Y143.407 E-.10636
G1 X112.668 Y143.236 E-.06549
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.057 J1.216 P1  F30000
G1 X144.071 Y141.762 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10179
G1 X144.096 Y141.739 E.00112
G3 X145.22 Y141.265 I1.404 J1.76 E.04099
G1 X145.444 Y141.248 E.00745
G3 X143.775 Y142.052 I.056 J2.251 E.40591
G1 X144.028 Y141.804 E.01177
G1 X144.325 Y142.06 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10179
G1 X144.34 Y142.046 E.00065
G3 X145.269 Y141.654 I1.16 J1.453 E.03135
G1 X145.454 Y141.64 E.0057
G3 X144.075 Y142.304 I.046 J1.859 E.31047
G1 X144.282 Y142.102 E.00889
M204 S10000
; WIPE_START
G1 F24000
G1 X144.34 Y142.046 E-.03084
G1 X144.65 Y141.845 E-.14023
G1 X144.908 Y141.736 E-.10636
G1 X145.269 Y141.654 E-.14059
G1 X145.454 Y141.64 E-.07048
G1 X145.823 Y141.668 E-.14076
G1 X146.154 Y141.761 E-.13075
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.212 J-.104 P1  F30000
G1 X143.541 Y111.395 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10179
G1 X143.775 Y111.052 E.01376
G3 X145.221 Y110.265 I1.726 J1.446 E.05593
G1 X145.444 Y110.248 E.00741
G3 X143.51 Y111.446 I.057 J2.251 E.39014
G1 X143.858 Y111.629 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10179
G1 X143.867 Y111.611 E.00062
G3 X145.269 Y110.654 I1.633 J.888 E.05416
G1 X145.454 Y110.64 E.00568
G3 X143.723 Y111.952 I.046 J1.859 E.28768
G1 X143.835 Y111.684 E.00892
M204 S10000
; WIPE_START
G1 F24000
G1 X143.867 Y111.611 E-.03045
G1 X144.075 Y111.304 E-.14074
G1 X144.34 Y111.046 E-.14077
G1 X144.651 Y110.845 E-.14077
G1 X144.995 Y110.71 E-.14024
G1 X145.269 Y110.654 E-.10636
G1 X145.428 Y110.642 E-.06068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.201 J.198 P1  F30000
G1 X151.898 Y149.898 Z1.4
M73 P66 R4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10179
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10179
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
G1 F10179
G1 X151.55 Y149.55 E.05401
G1 X147.333 Y145.333 E.19783
G3 X143.519 Y145.185 I-1.838 J-1.852 E.14201
G1 X139.154 Y149.55 E.20474
G1 X136.198 Y149.55 E.09807
G1 X127.935 Y141.287 E.38761
G3 X125.137 Y140.539 I2.115 J-13.526 E.09627
G1 X116.126 Y149.55 E.42269
G1 X113.17 Y149.55 E.09807
G1 X108.45 Y144.83 E.2214
G1 X108.45 Y141.874 E.09807
G1 X117.463 Y132.861 E.4228
G3 X116.71 Y130.062 I12.761 J-4.935 E.09635
G1 X108.45 Y121.802 E.38746
G1 X108.45 Y118.846 E.09807
G1 X112.818 Y114.478 E.20492
G2 X116.335 Y114.335 I1.68 J-1.998 E.1281
G1 X120.491 Y118.491 E.19499
G2 X119.413 Y119.71 I9.841 J9.797 E.05401
G1 X108.45 Y124.893 F30000
G1 F10179
G1 X108.45 Y126.522 E.05401
G1 X128.522 Y106.45 E.94159
G1 X131.478 Y106.45 E.09807
G1 X151.55 Y126.522 E.94159
G1 X151.55 Y129.478 E.09807
G1 X131.478 Y149.55 E.94159
G1 X128.522 Y149.55 E.09807
G1 X108.45 Y129.478 E.94159
G1 X108.45 Y131.107 E.05401
G1 X119.413 Y136.29 F30000
G1 F10179
G2 X120.491 Y137.509 I10.92 J-8.58 E.05401
G1 X116.331 Y141.669 E.19514
G2 X112.817 Y141.52 I-1.836 J1.802 E.1285
G1 X108.45 Y137.154 E.20483
G1 X108.45 Y134.198 E.09807
G1 X116.71 Y125.938 E.38746
G3 X117.463 Y123.139 I13.514 J2.135 E.09635
G1 X108.45 Y114.126 E.4228
G1 X108.45 Y111.17 E.09807
G1 X113.17 Y106.45 E.2214
G1 X116.126 Y106.45 E.09807
G1 X125.137 Y115.461 E.42269
G3 X127.935 Y114.713 I4.914 J12.779 E.09627
G1 X136.198 Y106.45 E.38761
G1 X139.154 Y106.45 E.09807
G1 X143.519 Y110.815 E.20474
G3 X147.331 Y110.669 I1.975 J1.703 E.14199
G1 X151.55 Y106.45 E.19788
G1 X149.921 Y106.45 E.05401
; WIPE_START
G1 F24000
G1 X151.55 Y106.45 E-.61876
G1 X151.287 Y106.713 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.94 J-.773 P1  F30000
G1 X140.587 Y119.71 Z1.4
G1 Z1
G1 E.8 F1800
G1 F10179
G2 X139.509 Y118.491 I-10.919 J8.579 E.05401
G1 X143.669 Y114.331 E.19514
G2 X147.183 Y114.48 I1.836 J-1.802 E.1285
G1 X151.55 Y118.846 E.20483
G1 X151.55 Y121.802 E.09807
G1 X143.29 Y130.062 E.38746
G3 X142.537 Y132.861 I-13.515 J-2.135 E.09635
G1 X151.55 Y141.874 E.4228
G1 X151.55 Y144.83 E.09807
G1 X146.83 Y149.55 E.2214
G1 X143.874 Y149.55 E.09807
G1 X134.863 Y140.539 E.42269
G3 X132.065 Y141.287 I-4.914 J-12.778 E.09627
G1 X123.802 Y149.55 E.38761
G1 X120.846 Y149.55 E.09807
G1 X116.475 Y145.179 E.20504
G3 X112.669 Y145.331 I-1.974 J-1.683 E.14192
G1 X108.45 Y149.55 E.19788
G1 X110.079 Y149.55 E.05401
; WIPE_START
G1 F24000
G1 X108.45 Y149.55 E-.61876
G1 X108.713 Y149.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.459 J1.127 P1  F30000
G1 X140.587 Y136.29 Z1.4
G1 Z1
G1 E.8 F1800
G1 F10179
G3 X139.509 Y137.509 I-10.92 J-8.579 E.05401
G1 X143.669 Y141.669 E.19514
G3 X147.182 Y141.522 I1.836 J1.843 E.12806
G1 X151.55 Y137.154 E.20492
G1 X151.55 Y134.198 E.09807
G1 X143.29 Y125.938 E.38746
G2 X142.537 Y123.139 I-13.515 J2.135 E.09635
G1 X151.55 Y114.126 E.4228
G1 X151.55 Y111.17 E.09807
G1 X146.83 Y106.45 E.2214
G1 X143.874 Y106.45 E.09807
G1 X134.863 Y115.461 E.42269
G2 X132.065 Y114.713 I-4.914 J12.779 E.09627
G1 X123.802 Y106.45 E.38761
G1 X120.846 Y106.45 E.09807
G1 X116.481 Y110.815 E.20474
G2 X112.667 Y110.667 I-1.976 J1.705 E.14201
G1 X108.45 Y106.45 E.19783
G1 X110.079 Y106.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.45 Y106.45 E-.61876
G1 X108.713 Y106.713 E-.14124
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
G3 Z1.4 I-.472 J1.122 P1  F30000
G1 X128.38 Y114.998 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10133
G1 X129.021 Y114.934 E.02136
G3 X129.673 Y114.902 I.979 J13.064 E.02167
G1 X130.327 Y114.902 E.02167
G3 X128.321 Y115.006 I-.327 J13.096 E2.66372
G1 X128.42 Y115.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10133
G3 X129.683 Y115.294 I1.58 J12.609 E.03895
G1 X130.317 Y115.294 E.01947
G3 X128.36 Y115.396 I-.317 J12.704 E2.39322
M204 S10000
; WIPE_START
G1 F24000
G1 X129.05 Y115.325 E-.2636
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.356 Y115.296 E-.01475
; WIPE_END
M73 P67 R4
G1 E-.04 F1800
G17
G3 Z1.6 I.042 J-1.216 P1  F30000
G1 X114.523 Y114.75 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10133
G1 X114.109 Y114.716 E.01375
G3 X114.22 Y110.265 I.391 J-2.217 E.21229
G1 X114.444 Y110.248 E.00745
G3 X114.582 Y114.749 I.056 J2.251 E.23375
G1 X114.546 Y114.357 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10133
G3 X114.269 Y110.654 I-.046 J-1.859 E.17377
G1 X114.454 Y110.64 E.0057
G3 X114.606 Y114.355 I.046 J1.859 E.17762
M204 S10000
; WIPE_START
G1 F24000
G1 X114.177 Y114.332 E-.16333
G1 X113.82 Y114.232 E-.14077
G1 X113.491 Y114.063 E-.14077
G1 X113.34 Y113.954 E-.07047
G1 X113.075 Y113.696 E-.14077
G1 X112.921 Y113.47 E-.10389
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.079 J1.214 P1  F30000
G1 X143.488 Y111.494 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10133
G1 X143.704 Y111.14 E.01376
G3 X145.22 Y110.265 I1.796 J1.36 E.05962
G1 X145.444 Y110.248 E.00745
G3 X143.459 Y111.546 I.056 J2.251 E.38657
G1 X143.853 Y111.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10133
G1 X144.017 Y111.377 E.00969
G3 X145.269 Y110.654 I1.483 J1.123 E.04561
G1 X145.454 Y110.64 E.0057
G3 X143.822 Y111.697 I.046 J1.859 E.29622
M204 S10000
; WIPE_START
G1 F24000
G1 X144.017 Y111.377 E-.14259
G1 X144.269 Y111.105 E-.14077
G1 X144.57 Y110.889 E-.14077
G1 X144.908 Y110.737 E-.14076
G1 X145.269 Y110.654 E-.14077
G1 X145.411 Y110.643 E-.05434
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.216 J-.056 P1  F30000
G1 X143.986 Y141.836 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10133
G1 X144.01 Y141.811 E.00112
G3 X145.22 Y141.265 I1.49 J1.688 E.04472
G1 X145.444 Y141.248 E.00745
G3 X143.705 Y142.14 I.056 J2.251 E.40218
G1 X143.946 Y141.88 E.01177
G1 X144.313 Y142.073 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10133
G1 X144.57 Y141.889 E.00971
G3 X145.269 Y141.654 I.93 J1.61 E.0228
G1 X145.454 Y141.64 E.0057
G3 X144.265 Y142.109 I.046 J1.859 E.31885
M204 S10000
; WIPE_START
G1 F24000
G1 X144.57 Y141.889 E-.14285
G1 X144.908 Y141.737 E-.14077
G1 X145.269 Y141.654 E-.14077
G1 X145.454 Y141.64 E-.07048
G1 X145.823 Y141.668 E-.14076
G1 X146.138 Y141.757 E-.12437
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.129 J-1.21 P1  F30000
G1 X113.124 Y145.28 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10133
G1 X113.097 Y145.259 E.00111
G3 X114.22 Y141.265 I1.403 J-1.761 E.17507
G1 X114.444 Y141.248 E.00745
G3 X113.473 Y145.502 I.056 J2.251 E.27184
G1 X113.174 Y145.312 E.01176
G1 X113.35 Y144.961 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10133
G1 X113.341 Y144.953 E.00038
G3 X114.269 Y141.654 I1.159 J-1.454 E.13391
G1 X114.454 Y141.64 E.0057
G3 X113.652 Y145.153 I.046 J1.859 E.20793
G1 X113.401 Y144.993 E.00916
M204 S10000
; WIPE_START
G1 F24000
G1 X113.341 Y144.953 E-.02739
G1 X113.075 Y144.696 E-.1407
G1 X112.866 Y144.39 E-.14077
G1 X112.722 Y144.048 E-.14078
G1 X112.649 Y143.686 E-.1403
G1 X112.642 Y143.407 E-.10633
G1 X112.667 Y143.241 E-.06374
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.204 J1.2 P1  F30000
G1 X151.898 Y149.898 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10133
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10133
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
G1 F10133
G1 X151.55 Y149.55 E.05401
G1 X147.331 Y145.331 E.19788
G2 X147.182 Y141.522 I-1.841 J-1.835 E.14195
G1 X151.55 Y137.154 E.20492
G1 X151.55 Y134.198 E.09807
G1 X143.29 Y125.938 E.38746
G2 X142.537 Y123.139 I-13.515 J2.135 E.09635
G1 X151.55 Y114.126 E.4228
G1 X151.55 Y111.17 E.09807
G1 X146.83 Y106.45 E.2214
G1 X143.874 Y106.45 E.09807
G1 X134.863 Y115.461 E.42269
G2 X132.065 Y114.713 I-4.914 J12.779 E.09627
G1 X123.802 Y106.45 E.38761
G1 X120.846 Y106.45 E.09807
G1 X116.481 Y110.815 E.20474
G3 X116.333 Y114.333 I-1.99 J1.678 E.12827
G1 X120.491 Y118.491 E.19509
G2 X119.413 Y119.71 I9.841 J9.797 E.05401
G1 X108.45 Y124.893 F30000
G1 F10133
G1 X108.45 Y126.522 E.05401
G1 X128.522 Y106.45 E.94159
G1 X131.478 Y106.45 E.09807
G1 X151.55 Y126.522 E.94159
G1 X151.55 Y129.478 E.09807
G1 X131.478 Y149.55 E.94159
G1 X128.522 Y149.55 E.09807
G1 X108.45 Y129.478 E.94159
G1 X108.45 Y131.107 E.05401
G1 X119.413 Y136.29 F30000
G1 F10133
G2 X120.491 Y137.509 I10.92 J-8.579 E.05401
G1 X116.331 Y141.669 E.19514
G2 X112.817 Y141.52 I-1.836 J1.802 E.1285
G1 X108.45 Y137.154 E.20483
G1 X108.45 Y134.198 E.09807
G1 X116.71 Y125.938 E.38746
G3 X117.463 Y123.139 I13.514 J2.135 E.09635
G1 X108.45 Y114.126 E.4228
G1 X108.45 Y111.17 E.09807
G1 X113.17 Y106.45 E.2214
G1 X116.126 Y106.45 E.09807
G1 X125.137 Y115.461 E.42269
G3 X127.935 Y114.713 I4.914 J12.779 E.09627
G1 X136.198 Y106.45 E.38761
G1 X139.154 Y106.45 E.09807
G1 X143.525 Y110.821 E.20504
G3 X147.331 Y110.669 I1.974 J1.683 E.14192
G1 X151.55 Y106.45 E.19788
G1 X149.921 Y106.45 E.05401
; WIPE_START
G1 F24000
G1 X151.55 Y106.45 E-.61876
G1 X151.287 Y106.713 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.94 J-.773 P1  F30000
G1 X140.587 Y119.71 Z1.6
G1 Z1.2
M73 P68 R4
G1 E.8 F1800
G1 F10133
G2 X139.509 Y118.491 I-10.92 J8.579 E.05401
G1 X143.669 Y114.331 E.19514
G2 X147.178 Y114.474 I1.832 J-1.818 E.12816
G1 X151.55 Y118.846 E.20508
G1 X151.55 Y121.802 E.09807
G1 X143.29 Y130.062 E.38746
G3 X142.537 Y132.861 I-13.515 J-2.135 E.09635
G1 X151.55 Y141.874 E.4228
G1 X151.55 Y144.83 E.09807
G1 X146.83 Y149.55 E.2214
G1 X143.874 Y149.55 E.09807
G1 X134.863 Y140.539 E.42269
G3 X132.065 Y141.287 I-4.914 J-12.778 E.09627
G1 X123.802 Y149.55 E.38761
G1 X120.846 Y149.55 E.09807
G1 X116.475 Y145.179 E.20504
G3 X112.669 Y145.331 I-1.974 J-1.683 E.14192
G1 X108.45 Y149.55 E.19788
G1 X110.079 Y149.55 E.05401
; WIPE_START
G1 F24000
G1 X108.45 Y149.55 E-.61876
G1 X108.713 Y149.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.459 J1.127 P1  F30000
G1 X140.587 Y136.29 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F10133
G3 X139.509 Y137.509 I-10.92 J-8.579 E.05401
G1 X143.667 Y141.667 E.19509
G2 X143.519 Y145.185 I1.842 J1.84 E.12827
G1 X139.154 Y149.55 E.20474
G1 X136.198 Y149.55 E.09807
G1 X127.935 Y141.287 E.38761
G3 X125.137 Y140.539 I2.115 J-13.526 E.09627
G1 X116.126 Y149.55 E.42269
G1 X113.17 Y149.55 E.09807
G1 X108.45 Y144.83 E.2214
G1 X108.45 Y141.874 E.09807
G1 X117.463 Y132.861 E.4228
G3 X116.71 Y130.062 I12.761 J-4.935 E.09635
G1 X108.45 Y121.802 E.38746
G1 X108.45 Y118.846 E.09807
G1 X112.818 Y114.478 E.20492
G3 X112.667 Y110.667 I1.68 J-1.975 E.14213
G1 X108.45 Y106.45 E.19783
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
G3 Z1.6 I-.472 J1.122 P1  F30000
G1 X128.38 Y114.998 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10129
G1 X129.021 Y114.934 E.02136
G3 X129.673 Y114.902 I.979 J13.064 E.02167
G1 X130.327 Y114.902 E.02167
G3 X128.321 Y115.006 I-.327 J13.096 E2.66372
G1 X128.42 Y115.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10129
G3 X129.683 Y115.294 I1.58 J12.609 E.03895
G1 X130.317 Y115.294 E.01947
G3 X128.36 Y115.396 I-.317 J12.704 E2.39322
M204 S10000
; WIPE_START
G1 F24000
G1 X129.05 Y115.325 E-.2636
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.356 Y115.296 E-.01475
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.042 J-1.216 P1  F30000
G1 X114.523 Y114.75 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10129
G1 X114.109 Y114.716 E.01376
G3 X114.22 Y110.265 I.391 J-2.217 E.21229
G1 X114.444 Y110.248 E.00745
G3 X114.582 Y114.749 I.056 J2.251 E.23374
G1 X114.546 Y114.357 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10129
G3 X114.269 Y110.654 I-.046 J-1.859 E.17377
G1 X114.454 Y110.64 E.0057
G3 X114.606 Y114.355 I.046 J1.859 E.17762
M204 S10000
; WIPE_START
G1 F24000
G1 X114.177 Y114.332 E-.16333
G1 X113.82 Y114.232 E-.14077
G1 X113.491 Y114.063 E-.14076
G1 X113.34 Y113.954 E-.07048
G1 X113.075 Y113.696 E-.14077
G1 X112.921 Y113.47 E-.10389
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.076 J1.215 P1  F30000
G1 X143.459 Y111.554 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10129
G1 X143.471 Y111.523 E.00112
G3 X145.22 Y110.265 I2.029 J.976 E.07452
G1 X145.444 Y110.248 E.00745
G3 X143.318 Y111.944 I.056 J2.251 E.37238
G1 X143.438 Y111.611 E.01177
G1 X143.849 Y111.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10129
G1 X144.017 Y111.377 E.00992
G3 X145.269 Y110.654 I1.482 J1.122 E.0456
G1 X145.454 Y110.64 E.0057
G3 X143.819 Y111.704 I.046 J1.859 E.29584
M204 S10000
; WIPE_START
G1 F24000
G1 X144.017 Y111.377 E-.14547
G1 X144.269 Y111.105 E-.14076
G1 X144.57 Y110.889 E-.14077
G1 X144.908 Y110.737 E-.14077
G1 X145.269 Y110.654 E-.14077
G1 X145.404 Y110.644 E-.05146
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.216 J-.053 P1  F30000
G1 X144.037 Y141.791 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10129
G1 X144.374 Y141.549 E.01376
G3 X145.22 Y141.265 I1.126 J1.949 E.02981
G1 X145.444 Y141.248 E.00745
G3 X143.99 Y141.829 I.056 J2.251 E.41622
G1 X144.307 Y142.078 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10129
G1 X144.57 Y141.889 E.00994
G3 X145.269 Y141.654 I.93 J1.61 E.0228
G1 X145.454 Y141.64 E.0057
G3 X144.259 Y142.114 I.046 J1.859 E.31862
M204 S10000
; WIPE_START
G1 F24000
G1 X144.57 Y141.889 E-.14572
G1 X144.908 Y141.737 E-.14077
G1 X145.269 Y141.654 E-.14076
G1 X145.454 Y141.64 E-.07048
G1 X145.823 Y141.668 E-.14076
G1 X146.131 Y141.755 E-.1215
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.129 J-1.21 P1  F30000
G1 X113.124 Y145.28 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10129
G1 X113.097 Y145.259 E.00111
G3 X114.22 Y141.265 I1.403 J-1.761 E.17507
G1 X114.444 Y141.248 E.00745
G3 X113.473 Y145.502 I.056 J2.251 E.27184
G1 X113.174 Y145.312 E.01177
G1 X113.354 Y144.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10129
G1 X113.341 Y144.953 E.00052
G3 X114.269 Y141.654 I1.159 J-1.454 E.13391
G1 X114.454 Y141.64 E.0057
G3 X113.652 Y145.153 I.046 J1.859 E.20793
G1 X113.405 Y144.996 E.00901
M204 S10000
; WIPE_START
G1 F24000
G1 X113.341 Y144.953 E-.02915
G1 X113.075 Y144.696 E-.14069
G1 X112.866 Y144.39 E-.14077
G1 X112.722 Y144.048 E-.14076
G1 X112.649 Y143.686 E-.14038
G1 X112.642 Y143.407 E-.10632
G1 X112.666 Y143.245 E-.06193
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.203 J1.2 P1  F30000
G1 X151.898 Y149.898 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10129
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10129
G1 X107.71 Y150.29 E1.36982
M73 P69 R4
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
G1 F10129
G1 X151.55 Y149.55 E.05401
G1 X147.331 Y145.331 E.19788
G2 X147.182 Y141.522 I-1.841 J-1.835 E.14195
G1 X151.55 Y137.154 E.20492
G1 X151.55 Y134.198 E.09807
G1 X143.29 Y125.938 E.38746
G2 X142.537 Y123.139 I-13.515 J2.135 E.09635
G1 X151.55 Y114.126 E.4228
G1 X151.55 Y111.17 E.09807
G1 X146.83 Y106.45 E.2214
G1 X143.874 Y106.45 E.09807
G1 X134.863 Y115.461 E.42269
M73 P69 R3
G2 X132.065 Y114.713 I-4.914 J12.779 E.09627
G1 X123.802 Y106.45 E.38761
G1 X120.846 Y106.45 E.09807
G1 X116.481 Y110.815 E.20474
G3 X116.333 Y114.333 I-1.99 J1.678 E.12827
G1 X120.491 Y118.491 E.19509
G2 X119.413 Y119.71 I9.842 J9.798 E.05401
G1 X108.45 Y124.893 F30000
G1 F10129
G1 X108.45 Y126.522 E.05401
G1 X128.522 Y106.45 E.94159
G1 X131.478 Y106.45 E.09807
G1 X151.55 Y126.522 E.94159
G1 X151.55 Y129.478 E.09807
G1 X131.478 Y149.55 E.94159
G1 X128.522 Y149.55 E.09807
G1 X108.45 Y129.478 E.94159
G1 X108.45 Y131.107 E.05401
G1 X119.413 Y136.29 F30000
G1 F10129
G2 X120.491 Y137.509 I10.92 J-8.58 E.05401
G1 X116.331 Y141.669 E.19514
G2 X112.817 Y141.52 I-1.836 J1.802 E.1285
G1 X108.45 Y137.154 E.20483
G1 X108.45 Y134.198 E.09807
G1 X116.71 Y125.938 E.38746
G3 X117.463 Y123.139 I13.514 J2.135 E.09635
G1 X108.45 Y114.126 E.4228
G1 X108.45 Y111.17 E.09807
G1 X113.17 Y106.45 E.2214
G1 X116.126 Y106.45 E.09807
G1 X125.137 Y115.461 E.42269
G3 X127.935 Y114.713 I4.914 J12.779 E.09627
G1 X136.198 Y106.45 E.38761
G1 X139.154 Y106.45 E.09807
G1 X143.525 Y110.821 E.20504
G2 X143.669 Y114.331 I1.963 J1.678 E.12817
G1 X139.509 Y118.491 E.19514
G3 X140.587 Y119.71 I-9.841 J9.797 E.05401
; WIPE_START
G1 F24000
G1 X139.509 Y118.491 E-.61831
G1 X139.772 Y118.228 E-.14169
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.922 J.794 P1  F30000
G1 X149.921 Y106.45 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F10129
G1 X151.55 Y106.45 E.05401
G1 X147.331 Y110.669 E.19788
G3 X147.182 Y114.478 I-1.841 J1.835 E.14195
G1 X151.55 Y118.846 E.20492
G1 X151.55 Y121.802 E.09807
G1 X143.29 Y130.062 E.38746
G3 X142.537 Y132.861 I-13.515 J-2.135 E.09635
G1 X151.55 Y141.874 E.4228
G1 X151.55 Y144.83 E.09807
G1 X146.83 Y149.55 E.2214
G1 X143.874 Y149.55 E.09807
G1 X134.863 Y140.539 E.42269
G3 X132.065 Y141.287 I-4.914 J-12.778 E.09627
G1 X123.802 Y149.55 E.38761
G1 X120.846 Y149.55 E.09807
G1 X116.475 Y145.179 E.20504
G3 X112.669 Y145.331 I-1.974 J-1.683 E.14192
G1 X108.45 Y149.55 E.19788
G1 X110.079 Y149.55 E.05401
; WIPE_START
G1 F24000
G1 X108.45 Y149.55 E-.61876
G1 X108.713 Y149.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.459 J1.127 P1  F30000
G1 X140.587 Y136.29 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F10129
G3 X139.509 Y137.509 I-10.92 J-8.579 E.05401
G1 X143.667 Y141.667 E.19509
G2 X143.519 Y145.185 I1.842 J1.84 E.12827
G1 X139.154 Y149.55 E.20474
G1 X136.198 Y149.55 E.09807
G1 X127.935 Y141.287 E.38761
G3 X125.137 Y140.539 I2.115 J-13.526 E.09627
G1 X116.126 Y149.55 E.42269
G1 X113.17 Y149.55 E.09807
G1 X108.45 Y144.83 E.2214
G1 X108.45 Y141.874 E.09807
G1 X117.463 Y132.861 E.4228
G3 X116.71 Y130.062 I12.761 J-4.935 E.09635
G1 X108.45 Y121.802 E.38746
G1 X108.45 Y118.846 E.09807
G1 X112.818 Y114.478 E.20492
G3 X112.667 Y110.667 I1.68 J-1.975 E.14213
G1 X108.45 Y106.45 E.19783
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
G3 Z1.8 I-.472 J1.122 P1  F30000
G1 X128.38 Y114.998 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10121
G1 X129.021 Y114.934 E.02136
G3 X129.673 Y114.902 I.979 J13.065 E.02167
G1 X130.327 Y114.902 E.02167
G3 X128.321 Y115.006 I-.327 J13.097 E2.66396
G1 X128.42 Y115.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10121
G3 X129.683 Y115.294 I1.58 J12.611 E.03895
G1 X130.317 Y115.294 E.01947
G3 X128.36 Y115.396 I-.317 J12.706 E2.39348
M204 S10000
; WIPE_START
G1 F24000
G1 X129.05 Y115.325 E-.26362
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.356 Y115.296 E-.01475
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.042 J-1.216 P1  F30000
G1 X114.523 Y114.75 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10121
G1 X114.109 Y114.716 E.01376
M73 P70 R3
G3 X114.22 Y110.265 I.391 J-2.217 E.21229
G1 X114.444 Y110.248 E.00745
G3 X114.583 Y114.749 I.056 J2.251 E.23374
G1 X114.546 Y114.357 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10121
G3 X114.269 Y110.654 I-.046 J-1.859 E.17377
G1 X114.454 Y110.64 E.0057
G3 X114.606 Y114.355 I.046 J1.859 E.17762
M204 S10000
; WIPE_START
G1 F24000
G1 X114.177 Y114.332 E-.16333
G1 X113.82 Y114.232 E-.14076
G1 X113.568 Y114.11 E-.10664
G1 X113.269 Y113.895 E-.13977
G1 X113.017 Y113.623 E-.14076
G1 X112.923 Y113.469 E-.06872
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.217 J.009 P1  F30000
G1 X113.16 Y145.307 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10121
G1 X112.85 Y145.031 E.01376
G3 X114.22 Y141.265 I1.65 J-1.532 E.1639
G1 X114.444 Y141.248 E.00745
G3 X113.208 Y145.342 I.056 J2.251 E.28213
G1 X113.367 Y144.969 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10121
G1 X113.138 Y144.764 E.00945
G3 X114.269 Y141.654 I1.362 J-1.265 E.12537
G1 X114.454 Y141.64 E.0057
G3 X113.415 Y145.009 I.046 J1.859 E.21647
G1 X113.413 Y145.007 E.00008
M204 S10000
; WIPE_START
G1 F24000
G1 X113.138 Y144.764 E-.13959
G1 X112.913 Y144.47 E-.14069
G1 X112.752 Y144.136 E-.14077
G1 X112.661 Y143.777 E-.14077
G1 X112.642 Y143.407 E-.14077
G1 X112.665 Y143.258 E-.0574
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.058 J1.216 P1  F30000
G1 X144.07 Y141.763 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10121
G1 X144.096 Y141.739 E.00116
G3 X145.22 Y141.265 I1.404 J1.76 E.04099
G1 X145.444 Y141.248 E.00745
G3 X143.775 Y142.052 I.056 J2.251 E.40591
G1 X144.027 Y141.805 E.01173
G1 X144.307 Y142.078 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10121
G1 X144.34 Y142.046 E.00141
G3 X145.269 Y141.654 I1.16 J1.453 E.03135
G1 X145.454 Y141.64 E.0057
G3 X144.075 Y142.304 I.046 J1.859 E.31047
G1 X144.264 Y142.12 E.00813
M204 S10000
; WIPE_START
G1 F24000
G1 X144.34 Y142.046 E-.04026
G1 X144.572 Y141.888 E-.10663
G1 X144.908 Y141.737 E-.13977
G1 X145.269 Y141.654 E-.14076
G1 X145.454 Y141.64 E-.07048
G1 X145.823 Y141.668 E-.14077
G1 X146.13 Y141.754 E-.12133
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.212 J-.105 P1  F30000
G1 X143.508 Y111.454 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10121
G1 X143.525 Y111.424 E.00111
G3 X145.227 Y110.264 I1.979 J1.074 E.07098
G1 X145.444 Y110.248 E.0072
G3 X143.352 Y111.837 I.06 J2.251 E.37617
G1 X143.486 Y111.509 E.01176
G1 X143.849 Y111.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10121
G1 X143.868 Y111.611 E.00137
G3 X145.271 Y110.654 I1.633 J.888 E.05421
G1 X145.454 Y110.64 E.00562
G3 X143.724 Y111.952 I.048 J1.858 E.2877
G1 X143.826 Y111.707 E.00816
M204 S10000
; WIPE_START
G1 F24000
G1 X143.868 Y111.611 E-.03976
G1 X144.075 Y111.304 E-.1407
G1 X144.34 Y111.046 E-.14077
G1 X144.651 Y110.845 E-.14077
G1 X144.996 Y110.709 E-.14077
G1 X145.271 Y110.654 E-.10665
G1 X145.404 Y110.644 E-.05059
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.201 J.199 P1  F30000
G1 X151.898 Y149.898 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10121
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10121
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
G1 F10121
G1 X151.55 Y149.55 E.05401
G1 X147.331 Y145.331 E.19788
G3 X143.519 Y145.185 I-1.838 J-1.848 E.142
G1 X139.154 Y149.55 E.20474
G1 X136.198 Y149.55 E.09807
G1 X127.935 Y141.287 E.38761
G3 X125.137 Y140.539 I2.115 J-13.526 E.09627
G1 X116.126 Y149.55 E.42269
G1 X113.17 Y149.55 E.09807
G1 X108.45 Y144.83 E.2214
G1 X108.45 Y141.874 E.09807
G1 X117.463 Y132.861 E.4228
G3 X116.71 Y130.062 I12.761 J-4.935 E.09635
G1 X108.45 Y121.802 E.38746
G1 X108.45 Y118.846 E.09807
G1 X112.822 Y114.474 E.2051
G2 X116.333 Y114.333 I1.678 J-1.978 E.12802
G1 X120.491 Y118.491 E.19509
G2 X119.413 Y119.71 I9.841 J9.797 E.05401
G1 X108.45 Y124.893 F30000
G1 F10121
G1 X108.45 Y126.522 E.05401
G1 X128.522 Y106.45 E.94159
G1 X131.478 Y106.45 E.09807
G1 X151.55 Y126.522 E.94159
G1 X151.55 Y129.478 E.09807
G1 X131.478 Y149.55 E.94159
G1 X128.522 Y149.55 E.09807
G1 X108.45 Y129.478 E.94159
G1 X108.45 Y131.107 E.05401
G1 X119.413 Y136.29 F30000
G1 F10121
G2 X120.491 Y137.509 I10.92 J-8.58 E.05401
G1 X116.331 Y141.669 E.19514
G2 X112.817 Y141.52 I-1.836 J1.802 E.1285
G1 X108.45 Y137.154 E.20483
G1 X108.45 Y134.198 E.09807
G1 X116.71 Y125.938 E.38746
G3 X117.463 Y123.139 I13.514 J2.135 E.09635
G1 X108.45 Y114.126 E.4228
G1 X108.45 Y111.17 E.09807
G1 X113.17 Y106.45 E.2214
G1 X116.126 Y106.45 E.09807
G1 X125.137 Y115.461 E.42269
G3 X127.935 Y114.713 I4.914 J12.779 E.09627
G1 X136.198 Y106.45 E.38761
G1 X139.154 Y106.45 E.09807
G1 X143.519 Y110.815 E.20474
G2 X143.669 Y114.331 I2.004 J1.676 E.12811
G1 X139.509 Y118.491 E.19514
G3 X140.587 Y119.71 I-9.841 J9.797 E.05401
G1 X145.654 Y115.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.52908
G1 F10121
G1 X145.909 Y115.146 E.0102
; WIPE_START
G1 F24000
G1 X145.654 Y115.185 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.093 J.534 P1  F30000
G1 X149.921 Y106.45 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10121
G1 X151.55 Y106.45 E.05401
M73 P71 R3
G1 X147.331 Y110.669 E.19788
G3 X147.182 Y114.478 I-1.841 J1.835 E.14195
G1 X151.55 Y118.846 E.20492
G1 X151.55 Y121.802 E.09807
G1 X143.29 Y130.062 E.38746
G3 X142.537 Y132.861 I-13.515 J-2.135 E.09635
G1 X151.55 Y141.874 E.4228
G1 X151.55 Y144.83 E.09807
G1 X146.83 Y149.55 E.2214
G1 X143.874 Y149.55 E.09807
G1 X134.863 Y140.539 E.42269
G3 X132.065 Y141.287 I-4.914 J-12.778 E.09627
G1 X123.802 Y149.55 E.38761
G1 X120.846 Y149.55 E.09807
G1 X116.475 Y145.179 E.20504
G3 X112.665 Y145.335 I-1.977 J-1.677 E.14213
G1 X108.45 Y149.55 E.19772
G1 X110.079 Y149.55 E.05401
; WIPE_START
G1 F24000
G1 X108.45 Y149.55 E-.61876
G1 X108.713 Y149.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.459 J1.127 P1  F30000
G1 X140.587 Y136.29 Z2
G1 Z1.6
G1 E.8 F1800
G1 F10121
G3 X139.509 Y137.509 I-10.92 J-8.579 E.05401
G1 X143.669 Y141.669 E.19514
G3 X147.182 Y141.522 I1.836 J1.843 E.12806
G1 X151.55 Y137.154 E.20492
G1 X151.55 Y134.198 E.09807
G1 X143.29 Y125.938 E.38746
G2 X142.537 Y123.139 I-13.515 J2.135 E.09635
G1 X151.55 Y114.126 E.4228
G1 X151.55 Y111.17 E.09807
G1 X146.83 Y106.45 E.2214
G1 X143.874 Y106.45 E.09807
G1 X134.863 Y115.461 E.42269
G2 X132.065 Y114.713 I-4.914 J12.779 E.09627
G1 X123.802 Y106.45 E.38761
G1 X120.846 Y106.45 E.09807
G1 X116.481 Y110.815 E.20474
G2 X112.667 Y110.667 I-1.976 J1.705 E.14201
G1 X108.45 Y106.45 E.19783
G1 X110.079 Y106.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.45 Y106.45 E-.61876
G1 X108.713 Y106.713 E-.14124
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
G3 Z2 I-.472 J1.122 P1  F30000
G1 X128.38 Y114.998 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F13273
G1 X129.021 Y114.934 E.02136
G3 X129.673 Y114.902 I.979 J13.064 E.02167
G3 X131.993 Y115.054 I.327 J12.754 E.07723
G1 X132.275 Y115.097 E.00946
G3 X128.321 Y115.006 I-2.275 J12.901 E2.5987
G1 X128.42 Y115.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X129.683 Y115.294 I1.581 J12.609 E.03895
G3 X131.935 Y115.442 I.317 J12.373 E.06943
G1 X132.207 Y115.483 E.00846
G3 X128.36 Y115.396 I-2.207 J12.515 E2.33479
M204 S10000
; WIPE_START
G1 F24000
G1 X129.05 Y115.325 E-.26362
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.356 Y115.296 E-.01474
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.042 J-1.216 P1  F30000
G1 X114.522 Y114.75 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13273
G1 X114.109 Y114.716 E.01374
G3 X114.22 Y110.265 I.391 J-2.217 E.21229
G1 X114.444 Y110.248 E.00745
G3 X114.582 Y114.749 I.056 J2.251 E.23376
G1 X114.546 Y114.357 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X114.269 Y110.654 I-.046 J-1.859 E.17377
G1 X114.454 Y110.64 E.0057
G3 X114.606 Y114.355 I.046 J1.859 E.17762
M204 S10000
; WIPE_START
G1 F24000
G1 X114.177 Y114.332 E-.16335
G1 X113.82 Y114.232 E-.14076
G1 X113.491 Y114.063 E-.14077
G1 X113.34 Y113.954 E-.07047
G1 X113.075 Y113.696 E-.14078
G1 X112.921 Y113.47 E-.10388
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.217 J.008 P1  F30000
G1 X113.124 Y145.28 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13273
G1 X113.097 Y145.259 E.00111
G3 X114.22 Y141.265 I1.403 J-1.761 E.17507
G1 X114.444 Y141.248 E.00745
G3 X113.473 Y145.502 I.056 J2.251 E.27184
G1 X113.174 Y145.312 E.01177
G1 X113.362 Y144.969 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.341 Y144.953 E.0008
G3 X114.269 Y141.654 I1.159 J-1.454 E.13391
G1 X114.454 Y141.64 E.0057
G3 X113.652 Y145.153 I.046 J1.859 E.20793
G1 X113.413 Y145.001 E.00873
M204 S10000
; WIPE_START
G1 F24000
G1 X113.341 Y144.953 E-.0327
G1 X113.075 Y144.696 E-.14069
G1 X112.866 Y144.39 E-.14077
G1 X112.722 Y144.048 E-.14077
G1 X112.649 Y143.686 E-.14049
G1 X112.642 Y143.406 E-.10632
G1 X112.665 Y143.255 E-.05825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.058 J1.216 P1  F30000
G1 X144.07 Y141.764 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13273
G1 X144.094 Y141.74 E.00112
G3 X145.22 Y141.265 I1.406 J1.758 E.04106
G1 X145.444 Y141.248 E.00745
G3 X143.775 Y142.052 I.056 J2.251 E.40591
G1 X144.027 Y141.805 E.0117
G1 X144.301 Y142.084 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.34 Y142.046 E.00165
G3 X145.269 Y141.654 I1.16 J1.453 E.03138
G1 X145.454 Y141.64 E.0057
G3 X144.075 Y142.304 I.046 J1.859 E.31047
G1 X144.258 Y142.125 E.00787
M204 S10000
; WIPE_START
G1 F24000
G1 X144.34 Y142.046 E-.04319
G1 X144.571 Y141.888 E-.10631
G1 X144.908 Y141.737 E-.14038
G1 X145.269 Y141.654 E-.14076
G1 X145.454 Y141.64 E-.07048
G1 X145.823 Y141.668 E-.14076
G1 X146.004 Y141.709 E-.07048
G1 X146.121 Y141.755 E-.04764
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.212 J-.105 P1  F30000
G1 X143.508 Y111.454 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13273
G1 X143.522 Y111.423 E.00111
G3 X145.22 Y110.265 I1.978 J1.076 E.0708
G1 X145.444 Y110.248 E.00745
G3 X143.348 Y111.836 I.056 J2.251 E.3761
G1 X143.485 Y111.509 E.01177
G1 X143.846 Y111.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.867 Y111.611 E.00163
G3 X145.269 Y110.654 I1.633 J.888 E.05415
G1 X145.454 Y110.64 E.0057
G3 X143.723 Y111.952 I.046 J1.859 E.28768
G1 X143.822 Y111.715 E.0079
M204 S10000
; WIPE_START
G1 F24000
G1 X143.867 Y111.611 E-.04297
G1 X144.075 Y111.304 E-.14075
G1 X144.34 Y111.046 E-.14077
G1 X144.651 Y110.845 E-.14049
G1 X144.909 Y110.736 E-.10631
G1 X145.269 Y110.654 E-.14038
G1 X145.396 Y110.645 E-.04832
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.201 J.199 P1  F30000
G1 X151.898 Y149.898 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13273
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
G1 F13273
G1 X108.45 Y149.55 E1.42968
G1 X108.45 Y106.45 E1.42968
G1 X151.55 Y106.45 E1.42968
G1 X151.55 Y149.49 E1.42769
G1 X149.514 Y149.143 F30000
M73 P72 R3
G1 F13273
G1 X151.143 Y149.143 E.05401
G1 X147.619 Y145.619 E.16528
G3 X143.499 Y145.735 I-2.12 J-2.067 E.15122
G1 X143.231 Y145.473 E.01245
G1 X139.561 Y149.143 E.17214
G1 X135.791 Y149.143 E.12508
G1 X128.412 Y141.764 E.34615
G2 X131.588 Y141.764 I1.588 J-14.972 E.10556
G1 X124.209 Y149.143 E.34615
G1 X120.439 Y149.143 E.12508
G1 X116.769 Y145.473 E.17214
G3 X112.685 Y145.896 I-2.272 J-2.007 E.14962
G3 X112.377 Y145.623 I2.322 J-2.942 E.01366
G1 X108.857 Y149.143 E.1651
G1 X110.486 Y149.143 E.05401
; WIPE_START
G1 F24000
G1 X108.857 Y149.143 E-.61876
G1 X109.12 Y148.88 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.027 J.652 P1  F30000
G1 X114.176 Y140.917 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F13273
G2 X115.268 Y145.981 I.331 J2.578 E.28547
G1 X115.268 Y145.981 E0
G2 X114.236 Y140.916 I-.772 J-2.481 E.25336
G1 X117.841 Y134.648 F30000
G1 F13273
G3 X117.204 Y133.316 I70.141 J-34.386 E.04896
G1 X117.149 Y133.175 E.00503
G1 X108.857 Y141.467 E.38897
G1 X108.857 Y145.237 E.12508
G1 X112.763 Y149.143 E.18321
G1 X116.533 Y149.143 E.12508
G1 X124.824 Y140.852 E.38892
G3 X120.203 Y137.797 I5.593 J-13.479 E.18487
G1 X116.619 Y141.381 E.16813
G2 X112.525 Y141.229 I-2.129 J2.131 E.14946
G1 X108.857 Y137.561 E.17205
G1 X108.857 Y133.791 E.12508
G1 X116.237 Y126.411 E.3462
G2 X116.159 Y127.334 I20.797 J2.233 E.03073
G2 X116.149 Y128.304 I12.557 J.607 E.03219
G1 X116.15 Y128.316 E.00039
G2 X116.21 Y129.374 I20.683 J-.647 E.03516
G1 X116.237 Y129.589 E.0072
G1 X108.857 Y122.209 E.3462
G1 X108.857 Y118.439 E.12508
G1 X112.53 Y114.767 E.17227
G3 X112.379 Y110.379 I1.964 J-2.263 E.1634
G1 X108.857 Y106.857 E.16522
G1 X110.486 Y106.857 E.05401
G1 X114.539 Y109.908 F30000
G1 F13273
G2 X115.486 Y110.105 I-.044 J2.591 E.50779
G2 X114.599 Y109.907 I-1.053 J2.633 E.03026
G1 X129.665 Y114.554 F30000
G1 F13273
G2 X120.521 Y118.46 I.395 J13.578 E.33767
G1 X120.521 Y118.46 E0
G2 X129.725 Y114.554 I9.479 J9.536 E2.46258
; WIPE_START
G1 F24000
G1 X131.005 Y114.587 E-.48675
G1 X131.719 Y114.676 E-.27325
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.722 J-.98 P1  F30000
G1 X108.857 Y131.514 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F13273
G1 X108.857 Y129.885 E.05401
G1 X128.115 Y149.143 E.9034
G1 X131.885 Y149.143 E.12508
G1 X151.143 Y129.885 E.9034
G1 X151.143 Y126.115 E.12508
G1 X131.885 Y106.857 E.9034
G1 X128.115 Y106.857 E.12508
G1 X108.857 Y126.115 E.9034
G1 X108.857 Y124.486 E.05401
G1 X117.841 Y121.352 F30000
G1 F13273
G2 X117.149 Y122.825 I35.228 J17.467 E.05398
G1 X108.857 Y114.533 E.38897
G1 X108.857 Y110.763 E.12508
G1 X112.763 Y106.857 E.18321
G1 X116.533 Y106.857 E.12508
G1 X124.824 Y115.148 E.38892
G2 X120.23 Y118.176 I5.622 J13.527 E.1836
G1 X116.621 Y114.621 E.16806
G2 X116.85 Y114.374 I-1.714 J-1.82 E.01118
G2 X116.769 Y110.527 I-2.394 J-1.874 E.1382
G1 X120.439 Y106.857 E.17214
G1 X124.209 Y106.857 E.12508
G1 X131.576 Y114.235 E.34585
G2 X128.412 Y114.236 I-1.576 J16.539 E.10513
G1 X135.791 Y106.857 E.34615
G1 X139.561 Y106.857 E.12508
G1 X143.231 Y110.527 E.17214
G3 X143.568 Y110.198 I3.469 J3.219 E.01565
G3 X147.619 Y110.381 I1.925 J2.327 E.14749
G1 X151.143 Y106.857 E.16528
G1 X149.514 Y106.857 E.05401
G1 X145.532 Y109.908 F30000
G1 F13273
G1 X145.694 Y109.904 E.00539
G3 X145.141 Y109.925 I-.179 J2.596 E.52383
G1 X145.141 Y109.925 E0
G3 X145.472 Y109.91 I.204 J.812 E.01108
; WIPE_START
G1 F24000
G1 X145.141 Y109.925 E-.12605
G1 X145.141 Y109.925 E0
G1 X144.668 Y110.034 E-.18421
G1 X144.199 Y110.246 E-.19581
G1 X143.778 Y110.548 E-.19696
G1 X143.676 Y110.658 E-.05697
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.205 J-.171 P1  F30000
G1 X142.159 Y121.352 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F13273
G3 X142.851 Y122.825 I-35.234 J17.47 E.05398
G1 X151.143 Y114.533 E.38897
G1 X151.143 Y110.763 E.12508
G1 X147.237 Y106.857 E.18321
G1 X143.467 Y106.857 E.12508
G1 X135.176 Y115.148 E.38892
G3 X139.797 Y118.203 I-5.357 J13.122 E.18494
G1 X143.381 Y114.619 E.16813
G2 X147.469 Y114.766 I2.123 J-2.112 E.14942
G1 X151.143 Y118.439 E.17231
G1 X151.143 Y122.209 E.12508
G1 X143.763 Y129.589 E.3462
G2 X143.763 Y126.411 I-13.866 J-1.589 E.10566
G1 X151.143 Y133.791 E.3462
G1 X151.143 Y137.561 E.12508
G1 X147.469 Y141.234 E.17231
G2 X143.379 Y141.379 I-1.968 J2.242 E.14961
G1 X139.797 Y137.797 E.16807
G3 X135.176 Y140.852 I-9.837 J-9.854 E.18499
G1 X143.467 Y149.143 E.38892
G1 X147.237 Y149.143 E.12508
G1 X151.143 Y145.237 E.18321
G1 X151.143 Y141.467 E.12508
G1 X142.851 Y133.175 E.38897
G3 X142.159 Y134.648 I-35.924 J-15.997 E.05398
G1 X145.176 Y140.917 F30000
M73 P73 R3
G1 F13273
G2 X145.695 Y140.904 I.324 J2.58 E.52463
G1 X145.236 Y140.916 E.0152
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X145.695 Y140.904 E-.17417
G1 X146.205 Y140.994 E-.19696
G1 X146.687 Y141.184 E-.19696
G1 X147.112 Y141.458 E-.19192
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
G3 Z2.2 I.993 J-.704 P1  F30000
G1 X128.361 Y115.001 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F13103
G1 X128.371 Y114.999 E.00031
G3 X129.673 Y114.902 I1.629 J12.999 E.04335
G3 X132.034 Y115.06 I.327 J12.784 E.07861
G1 X132.275 Y115.097 E.00808
G3 X127.725 Y115.097 I-2.275 J12.901 E2.5787
G1 X128.302 Y115.01 E.01937
G1 X128.42 Y115.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X129.683 Y115.294 I1.581 J12.609 E.03895
G3 X131.976 Y115.448 I.317 J12.403 E.07071
G1 X132.207 Y115.483 E.00718
G3 X128.36 Y115.396 I-2.207 J12.515 E2.33479
M204 S10000
; WIPE_START
G1 F24000
G1 X129.05 Y115.325 E-.26362
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.356 Y115.296 E-.01474
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.042 J-1.216 P1  F30000
G1 X114.523 Y114.75 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13103
G1 X114.109 Y114.716 E.01376
G3 X114.22 Y110.265 I.391 J-2.217 E.21229
G1 X114.444 Y110.248 E.00745
G3 X114.583 Y114.749 I.056 J2.251 E.23374
G1 X114.546 Y114.357 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X114.269 Y110.654 I-.046 J-1.859 E.17377
G1 X114.454 Y110.64 E.0057
G3 X114.606 Y114.355 I.046 J1.859 E.17762
M204 S10000
; WIPE_START
G1 F24000
G1 X114.177 Y114.332 E-.16333
G1 X113.853 Y114.243 E-.12759
G1 X113.57 Y114.111 E-.11881
G1 X113.269 Y113.895 E-.14077
G1 X113.017 Y113.623 E-.14077
G1 X112.923 Y113.469 E-.06873
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.217 J.009 P1  F30000
G1 X113.16 Y145.307 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13103
G1 X112.85 Y145.031 E.01376
G3 X114.22 Y141.265 I1.65 J-1.532 E.1639
G1 X114.444 Y141.248 E.00745
G3 X113.208 Y145.342 I.056 J2.251 E.28213
G1 X113.373 Y144.974 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.138 Y144.764 E.00967
G3 X114.269 Y141.654 I1.362 J-1.265 E.12537
G1 X114.454 Y141.64 E.0057
G3 X113.419 Y145.012 I.046 J1.859 E.21633
M204 S10000
; WIPE_START
G1 F24000
G1 X113.138 Y144.764 E-.14241
G1 X112.913 Y144.47 E-.1407
G1 X112.752 Y144.136 E-.14077
G1 X112.661 Y143.777 E-.14077
G1 X112.642 Y143.407 E-.14077
G1 X112.663 Y143.265 E-.05459
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.057 J1.216 P1  F30000
G1 X144.037 Y141.791 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13103
G1 X144.374 Y141.549 E.01377
G3 X145.22 Y141.265 I1.126 J1.949 E.02981
G1 X145.444 Y141.248 E.00745
G3 X143.99 Y141.829 I.056 J2.251 E.41621
G1 X144.288 Y142.091 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.57 Y141.889 E.01065
G3 X145.269 Y141.654 I.93 J1.61 E.0228
G1 X145.454 Y141.64 E.0057
G3 X144.242 Y142.13 I.046 J1.859 E.31791
M204 S10000
; WIPE_START
G1 F24000
G1 X144.57 Y141.889 E-.15444
G1 X144.908 Y141.737 E-.14076
G1 X145.269 Y141.654 E-.14077
G1 X145.454 Y141.64 E-.07048
G1 X145.823 Y141.668 E-.14076
G1 X146.109 Y141.748 E-.11279
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.212 J-.106 P1  F30000
G1 X143.459 Y111.554 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13103
G1 X143.471 Y111.523 E.00111
G3 X145.22 Y110.265 I2.029 J.976 E.07452
G1 X145.444 Y110.248 E.00745
G3 X143.318 Y111.944 I.056 J2.251 E.37238
G1 X143.438 Y111.611 E.01177
G1 X143.837 Y111.672 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.017 Y111.377 E.01064
G3 X145.269 Y110.654 I1.482 J1.122 E.0456
G1 X145.454 Y110.64 E.0057
G3 X143.809 Y111.725 I.046 J1.859 E.29513
M204 S10000
; WIPE_START
G1 F24000
G1 X144.017 Y111.377 E-.15425
G1 X144.269 Y111.105 E-.14076
G1 X144.57 Y110.889 E-.14077
G1 X144.908 Y110.737 E-.14077
G1 X145.269 Y110.654 E-.14077
G1 X145.381 Y110.646 E-.04269
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.201 J.199 P1  F30000
G1 X151.898 Y149.898 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13103
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
G1 F13103
G1 X108.45 Y149.55 E1.42968
G1 X108.45 Y106.45 E1.42968
G1 X151.55 Y106.45 E1.42968
G1 X151.55 Y149.49 E1.42769
G1 X149.514 Y149.143 F30000
G1 F13103
G1 X151.143 Y149.143 E.05401
G1 X147.621 Y145.621 E.16522
G2 X147.85 Y145.374 I-1.711 J-1.817 E.01118
G2 X147.469 Y141.234 I-2.355 J-1.871 E.15223
G1 X151.143 Y137.561 E.17231
G1 X151.143 Y133.791 E.12508
G1 X143.763 Y126.411 E.3462
G3 X143.763 Y129.589 I-13.866 J1.589 E.10566
G1 X151.143 Y122.209 E.3462
G1 X151.143 Y118.439 E.12508
G1 X147.475 Y114.771 E.17205
G2 X147.619 Y110.381 I-1.965 J-2.262 E.16356
G1 X151.143 Y106.857 E.16528
G1 X149.514 Y106.857 E.05401
G1 X145.236 Y109.916 F30000
G1 F13103
G3 X143.081 Y111.573 I.27 J2.58 E.44584
G1 X143.081 Y111.573 E0
G3 X145.176 Y109.917 I2.54 J1.061 E.09248
G1 X129.725 Y114.554 F30000
G1 F13103
G3 X138.824 Y138.149 I.254 J13.454 E1.09059
G1 X138.824 Y138.149 E0
G3 X129.665 Y114.554 I-8.814 J-10.154 E1.70862
; WIPE_START
G1 F24000
G1 X127.675 Y114.753 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.678 J-1.01 P1  F30000
G1 X117.841 Y121.352 Z2.4
G1 Z2
G1 E.8 F1800
G1 F13103
G2 X117.149 Y122.825 I35.228 J17.467 E.05398
G1 X108.857 Y114.533 E.38897
G1 X108.857 Y110.763 E.12508
G1 X112.763 Y106.857 E.18321
G1 X116.533 Y106.857 E.12508
G1 X124.824 Y115.148 E.38892
G2 X120.203 Y118.203 I5.218 J12.912 E.18499
G1 X116.621 Y114.621 E.16807
G1 X116.679 Y114.558 E.00283
G2 X116.769 Y110.527 I-2.192 J-2.066 E.14655
G1 X120.439 Y106.857 E.17214
G1 X124.209 Y106.857 E.12508
G1 X131.576 Y114.235 E.34585
M73 P74 R3
G2 X128.412 Y114.236 I-1.576 J16.539 E.10513
G1 X135.791 Y106.857 E.34615
G1 X139.561 Y106.857 E.12508
G1 X143.237 Y110.533 E.17243
G2 X143.381 Y114.619 I2.245 J1.967 E.14942
G1 X139.797 Y118.203 E.16813
G2 X135.176 Y115.148 I-9.821 J9.83 E.18499
G1 X143.467 Y106.857 E.38892
G1 X147.237 Y106.857 E.12508
G1 X151.143 Y110.763 E.18321
G1 X151.143 Y114.533 E.12508
G1 X142.851 Y122.825 E.38897
G2 X142.159 Y121.352 I-35.926 J15.998 E.05398
G1 X151.143 Y124.486 F30000
G1 F13103
G1 X151.143 Y126.115 E.05401
G1 X131.885 Y106.857 E.9034
G1 X128.115 Y106.857 E.12508
G1 X108.857 Y126.115 E.9034
G1 X108.857 Y129.885 E.12508
G1 X128.115 Y149.143 E.9034
G1 X131.885 Y149.143 E.12508
G1 X151.143 Y129.885 E.9034
G1 X151.143 Y131.514 E.05401
G1 X145.236 Y140.916 F30000
G1 F13103
G1 X145.695 Y140.904 E.0152
G3 X145.176 Y140.917 I-.195 J2.589 E.52395
G1 X142.159 Y134.648 F30000
G1 F13103
G2 X142.851 Y133.175 I-35.231 J-17.469 E.05398
G1 X151.143 Y141.467 E.38897
G1 X151.143 Y145.237 E.12508
G1 X147.237 Y149.143 E.18321
G1 X143.467 Y149.143 E.12508
G1 X135.176 Y140.852 E.38892
G2 X139.797 Y137.797 I-5.606 J-13.499 E.18487
G1 X143.379 Y141.379 E.16807
G1 X143.328 Y141.435 E.0025
G2 X143.231 Y145.473 I2.175 J2.073 E.14696
G1 X139.561 Y149.143 E.17214
G1 X135.791 Y149.143 E.12508
G1 X128.412 Y141.764 E.34615
G2 X131.588 Y141.764 I1.588 J-14.972 E.10556
G1 X124.209 Y149.143 E.34615
G1 X120.439 Y149.143 E.12508
G1 X116.763 Y145.467 E.17243
G3 X112.377 Y145.623 I-2.265 J-1.946 E.16356
G1 X108.857 Y149.143 E.1651
G1 X110.486 Y149.143 E.05401
; WIPE_START
G1 F24000
G1 X108.857 Y149.143 E-.61876
G1 X109.12 Y148.88 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.018 J.666 P1  F30000
G1 X114.333 Y140.913 Z2.4
G1 Z2
G1 E.8 F1800
G1 F13103
G2 X115.205 Y140.994 I.199 J2.589 E.51202
G2 X114.393 Y140.912 I-.61 J1.967 E.02725
G1 X117.841 Y134.648 F30000
G1 F13103
G3 X117.204 Y133.316 I70.136 J-34.384 E.04896
G1 X117.149 Y133.175 E.00503
G1 X108.857 Y141.467 E.38897
G1 X108.857 Y145.237 E.12508
G1 X112.763 Y149.143 E.18321
G1 X116.533 Y149.143 E.12508
G1 X124.824 Y140.852 E.38892
G3 X120.203 Y137.797 I5.22 J-12.915 E.18498
G1 X116.619 Y141.381 E.16813
G2 X112.765 Y141.056 I-2.119 J2.113 E.13951
G1 X112.525 Y141.229 E.00981
G1 X108.857 Y137.561 E.17205
G1 X108.857 Y133.791 E.12508
G1 X116.237 Y126.411 E.3462
G2 X116.237 Y129.589 I14.823 J1.589 E.10563
G1 X108.857 Y122.209 E.3462
G1 X108.857 Y118.439 E.12508
G1 X112.53 Y114.767 E.17227
G3 X112.348 Y110.413 I1.954 J-2.262 E.16197
G1 X112.379 Y110.379 E.00151
G1 X108.857 Y106.857 E.16522
G1 X110.486 Y106.857 E.05401
G1 X114.546 Y109.908 F30000
G1 F13103
G2 X113.818 Y115.01 I-.031 J2.598 E.24839
G1 X114.249 Y115.086 E.0145
G2 X114.606 Y109.907 I.25 J-2.585 E.27531
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.205 Y109.994 E-.2301
G1 X115.687 Y110.184 E-.19696
G1 X116.123 Y110.465 E-.19696
G1 X116.379 Y110.715 E-.13598
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
G3 Z2.4 I-.409 J1.146 P1  F30000
G1 X128.38 Y114.998 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F13012
G1 X129.021 Y114.934 E.02136
G3 X129.673 Y114.902 I.979 J13.065 E.02167
G1 X130.327 Y114.902 E.02167
G3 X128.321 Y115.006 I-.327 J13.098 E2.66406
G1 X128.42 Y115.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.42 Y115.389 E0
G3 X129.683 Y115.294 I1.58 J12.611 E.03895
G1 X130.317 Y115.294 E.01947
G3 X127.793 Y115.483 I-.317 J12.706 E2.37596
G1 X128.36 Y115.398 E.01763
M204 S10000
; WIPE_START
G1 F24000
G1 X128.42 Y115.389 E-.02282
G1 X129.05 Y115.325 E-.24081
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.356 Y115.296 E-.01472
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.042 J-1.216 P1  F30000
G1 X114.523 Y114.75 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13012
G1 X114.109 Y114.716 E.01376
G3 X114.22 Y110.265 I.391 J-2.217 E.21229
G1 X114.444 Y110.248 E.00745
G3 X114.583 Y114.749 I.056 J2.251 E.23374
G1 X114.547 Y114.36 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.546 Y114.357 E.00007
G3 X114.269 Y110.654 I-.046 J-1.859 E.17377
G1 X114.454 Y110.64 E.0057
G3 X114.913 Y114.311 I.046 J1.859 E.16807
G1 X114.606 Y114.352 E.00953
M204 S10000
; WIPE_START
G1 F24000
G1 X114.546 Y114.357 E-.02278
G1 X114.177 Y114.332 E-.14069
G1 X113.82 Y114.232 E-.14076
G1 X113.491 Y114.063 E-.14077
G1 X113.34 Y113.954 E-.07048
G1 X113.075 Y113.696 E-.14077
G1 X112.921 Y113.47 E-.10375
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.217 J.006 P1  F30000
G1 X113.071 Y145.238 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13012
G1 X112.776 Y144.947 E.01376
G3 X114.22 Y141.265 I1.724 J-1.448 E.16018
G1 X114.444 Y141.248 E.00745
G3 X113.118 Y145.276 I.056 J2.251 E.28585
G1 X113.37 Y144.974 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.341 Y144.953 E.00108
G3 X114.269 Y141.654 I1.159 J-1.454 E.13391
G1 X114.454 Y141.64 E.0057
G3 X113.652 Y145.153 I.046 J1.859 E.20793
G1 X113.42 Y145.006 E.00845
M204 S10000
; WIPE_START
G1 F24000
G1 X113.341 Y144.953 E-.03617
G1 X113.075 Y144.696 E-.14069
M73 P75 R3
G1 X112.866 Y144.39 E-.14077
G1 X112.722 Y144.048 E-.14077
G1 X112.649 Y143.686 E-.14059
G1 X112.642 Y143.406 E-.10636
G1 X112.664 Y143.264 E-.05465
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.057 J1.216 P1  F30000
G1 X144.037 Y141.791 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13012
G1 X144.374 Y141.549 E.01377
G3 X145.22 Y141.265 I1.126 J1.949 E.02981
G1 X145.444 Y141.248 E.00745
G3 X143.99 Y141.829 I.056 J2.251 E.41621
G1 X144.282 Y142.096 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.57 Y141.889 E.01088
G3 X145.269 Y141.654 I.93 J1.61 E.0228
G1 X145.454 Y141.64 E.0057
G3 X144.237 Y142.135 I.046 J1.859 E.31768
M204 S10000
; WIPE_START
G1 F24000
G1 X144.57 Y141.889 E-.15724
G1 X144.908 Y141.737 E-.14076
G1 X145.269 Y141.654 E-.14077
G1 X145.454 Y141.64 E-.07048
G1 X145.823 Y141.668 E-.14076
G1 X146.102 Y141.746 E-.10999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.212 J-.105 P1  F30000
G1 X143.488 Y111.494 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13012
G1 X143.705 Y111.14 E.01377
G3 X145.22 Y110.265 I1.795 J1.359 E.05962
G1 X145.444 Y110.248 E.00745
G3 X143.46 Y111.547 I.056 J2.251 E.3864
G1 X143.833 Y111.679 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.017 Y111.377 E.01087
G3 X145.269 Y110.654 I1.482 J1.122 E.0456
G1 X145.454 Y110.64 E.0057
G3 X143.806 Y111.732 I.046 J1.859 E.2949
M204 S10000
; WIPE_START
G1 F24000
G1 X144.017 Y111.377 E-.15707
G1 X144.269 Y111.105 E-.14076
G1 X144.57 Y110.889 E-.14077
G1 X144.908 Y110.737 E-.14077
G1 X145.269 Y110.654 E-.14077
G1 X145.373 Y110.646 E-.03987
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.2 J.2 P1  F30000
G1 X151.898 Y149.898 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13012
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
G1 F13012
G1 X108.45 Y149.55 E1.42968
G1 X108.45 Y106.45 E1.42968
G1 X151.55 Y106.45 E1.42968
G1 X151.55 Y149.49 E1.42769
G1 X149.514 Y149.143 F30000
G1 F13012
G1 X151.143 Y149.143 E.05401
G1 X147.621 Y145.621 E.16522
G2 X147.85 Y145.374 I-1.711 J-1.818 E.01118
G2 X147.469 Y141.234 I-2.374 J-1.869 E.15206
G1 X151.143 Y137.561 E.17231
G1 X151.143 Y133.791 E.12508
G1 X143.763 Y126.411 E.3462
G3 X143.763 Y129.589 I-13.866 J1.589 E.10566
G1 X151.143 Y122.209 E.3462
G1 X151.143 Y118.439 E.12508
G1 X147.475 Y114.771 E.17205
G2 X147.619 Y110.381 I-1.965 J-2.262 E.16356
G1 X151.143 Y106.857 E.16528
G1 X149.514 Y106.857 E.05401
G1 X145.721 Y109.909 F30000
G1 F13012
G3 X144.344 Y110.18 I-.206 J2.587 E.49382
G1 X144.344 Y110.18 E0
G3 X145.661 Y109.905 I1.206 J2.486 E.0451
G1 X145.661 Y109.905 E0
G1 X129.725 Y114.554 F30000
G1 F13012
G3 X120.521 Y118.46 I.277 J13.446 E2.4632
G1 X120.521 Y118.46 E0
G3 X129.665 Y114.554 I9.499 J9.58 E.33779
; WIPE_START
G1 F24000
G1 X128.328 Y114.654 E-.50955
G1 X127.678 Y114.768 E-.25045
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.677 J-1.011 P1  F30000
G1 X117.841 Y121.352 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F13012
G2 X117.149 Y122.825 I35.228 J17.467 E.05398
G1 X108.857 Y114.533 E.38897
G1 X108.857 Y110.763 E.12508
G1 X112.763 Y106.857 E.18321
G1 X116.533 Y106.857 E.12508
G1 X124.824 Y115.148 E.38892
G2 X120.23 Y118.176 I5.622 J13.527 E.1836
G1 X116.621 Y114.621 E.16806
G3 X112.53 Y114.767 I-2.124 J-2.136 E.14929
G1 X108.857 Y118.439 E.17227
G1 X108.857 Y122.209 E.12508
G1 X116.237 Y129.589 E.3462
G3 X116.237 Y126.411 I14.679 J-1.589 E.10564
G1 X108.857 Y133.791 E.3462
G1 X108.857 Y137.561 E.12508
G1 X112.525 Y141.229 E.17205
G3 X116.619 Y141.381 I1.965 J2.291 E.14939
G1 X120.203 Y137.797 E.16813
G2 X124.824 Y140.852 I9.841 J-9.86 E.18498
G1 X116.533 Y149.143 E.38892
G1 X112.763 Y149.143 E.12508
G1 X108.857 Y145.237 E.18321
G1 X108.857 Y141.467 E.12508
G1 X117.149 Y133.175 E.38897
G1 X117.204 Y133.316 E.00503
G2 X117.841 Y134.648 I70.778 J-33.055 E.04896
G1 X114.236 Y140.916 F30000
G1 F13012
G3 X116.997 Y142.78 I.214 J2.659 E.11935
G1 X116.997 Y142.78 E0
G3 X114.176 Y140.917 I-2.498 J.715 E.41951
; WIPE_START
G1 F24000
G1 X113.671 Y141.033 E-.19696
G1 X113.199 Y141.246 E-.19696
G1 X112.778 Y141.548 E-.19696
G1 X112.475 Y141.875 E-.16912
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.174 J-.321 P1  F30000
G1 X110.486 Y149.143 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F13012
G1 X108.857 Y149.143 E.05401
G1 X112.377 Y145.623 E.1651
G2 X116.763 Y145.467 I2.121 J-2.11 E.16347
G1 X120.439 Y149.143 E.17243
G1 X124.209 Y149.143 E.12508
G1 X131.588 Y141.764 E.34615
G3 X128.412 Y141.764 I-1.588 J-14.91 E.10556
G1 X135.791 Y149.143 E.34615
G1 X139.561 Y149.143 E.12508
G1 X143.231 Y145.473 E.17214
G3 X143.309 Y141.455 I2.267 J-1.966 E.14608
G1 X143.379 Y141.379 E.00341
G1 X139.797 Y137.797 E.16807
G3 X135.176 Y140.852 I-9.837 J-9.854 E.18499
G1 X143.467 Y149.143 E.38892
G1 X147.237 Y149.143 E.12508
G1 X151.143 Y145.237 E.18321
G1 X151.143 Y141.467 E.12508
G1 X142.851 Y133.175 E.38897
G3 X142.159 Y134.648 I-35.924 J-15.997 E.05398
G1 X145.176 Y140.917 F30000
G1 F13012
G2 X147.839 Y142.38 I.315 J2.581 E.43427
G1 X147.839 Y142.38 E0
M73 P76 R3
G2 X145.236 Y140.916 I-2.342 J1.118 E.10554
G1 X151.143 Y131.514 F30000
G1 F13012
G1 X151.143 Y129.885 E.05401
G1 X131.885 Y149.143 E.9034
G1 X128.115 Y149.143 E.12508
G1 X108.857 Y129.885 E.9034
G1 X108.857 Y126.115 E.12508
G1 X128.115 Y106.857 E.9034
G1 X131.885 Y106.857 E.12508
G1 X151.143 Y126.115 E.9034
G1 X151.143 Y124.486 E.05401
G1 X142.159 Y121.352 F30000
G1 F13012
G3 X142.851 Y122.825 I-35.234 J17.47 E.05398
G1 X151.143 Y114.533 E.38897
G1 X151.143 Y110.763 E.12508
G1 X147.237 Y106.857 E.18321
G1 X143.467 Y106.857 E.12508
G1 X135.176 Y115.148 E.38892
G3 X139.797 Y118.203 I-5.2 J12.886 E.18499
G1 X143.381 Y114.619 E.16813
G3 X143.237 Y110.533 I2.102 J-2.12 E.14941
G1 X139.561 Y106.857 E.17243
G1 X135.791 Y106.857 E.12508
G1 X128.412 Y114.236 E.34615
G3 X131.588 Y114.236 I1.588 J14.007 E.10559
G1 X124.209 Y106.857 E.34615
G1 X120.439 Y106.857 E.12508
G1 X116.769 Y110.527 E.17214
G2 X112.379 Y110.379 I-2.265 J2.012 E.16299
G1 X108.857 Y106.857 E.16522
G1 X110.486 Y106.857 E.05401
G1 X114.545 Y109.908 F30000
G1 F13012
G2 X114.576 Y115.089 I-.05 J2.591 E.27436
G1 X114.576 Y115.089 E0
G2 X115.134 Y115.012 I.089 J-1.418 E.01881
G1 X115.134 Y115.012 E0
G2 X114.605 Y109.907 I-.626 J-2.515 E.24591
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.205 Y109.994 E-.2304
G1 X115.687 Y110.184 E-.19696
G1 X116.123 Y110.465 E-.19696
G1 X116.378 Y110.714 E-.13568
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
G3 Z2.6 I-.409 J1.146 P1  F30000
G1 X128.38 Y114.998 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F13241
G1 X129.021 Y114.934 E.02136
G3 X129.673 Y114.902 I.979 J13.065 E.02167
G1 X130.327 Y114.902 E.02167
G3 X128.321 Y115.006 I-.327 J13.098 E2.66402
G1 X128.419 Y115.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.42 Y115.389 E0
G3 X129.683 Y115.294 I1.58 J12.611 E.03895
G1 X130.317 Y115.294 E.01947
G3 X127.793 Y115.483 I-.317 J12.706 E2.37592
G1 X128.36 Y115.398 E.01763
M204 S10000
; WIPE_START
G1 F24000
G1 X128.42 Y115.389 E-.02286
G1 X129.05 Y115.325 E-.24083
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.355 Y115.296 E-.01467
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.042 J-1.216 P1  F30000
G1 X114.523 Y114.75 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13241
G1 X114.109 Y114.716 E.01377
G3 X114.22 Y110.265 I.391 J-2.217 E.21229
G1 X114.444 Y110.248 E.00745
G3 X114.583 Y114.749 I.056 J2.251 E.23374
G1 X114.546 Y114.36 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.177 Y114.33 E.01136
G3 X114.269 Y110.654 I.323 J-1.831 E.16238
G1 X114.454 Y110.64 E.0057
G3 X114.604 Y114.355 I.046 J1.859 E.17769
M204 S10000
; WIPE_START
G1 F24000
G1 X114.177 Y114.33 E-.16236
G1 X113.82 Y114.232 E-.14068
G1 X113.491 Y114.063 E-.14076
G1 X113.34 Y113.954 E-.07048
G1 X113.075 Y113.696 E-.14077
G1 X112.919 Y113.468 E-.10495
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.217 J.008 P1  F30000
G1 X113.124 Y145.279 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13241
G1 X113.097 Y145.259 E.00111
G3 X114.22 Y141.265 I1.403 J-1.761 E.17507
G1 X114.444 Y141.248 E.00745
G3 X113.473 Y145.502 I.056 J2.251 E.27184
G1 X113.174 Y145.312 E.01177
G1 X113.373 Y144.976 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.341 Y144.953 E.00121
G3 X114.269 Y141.654 I1.159 J-1.454 E.13391
G1 X114.454 Y141.64 E.0057
G3 X113.652 Y145.153 I.046 J1.859 E.20793
G1 X113.424 Y145.008 E.00831
M204 S10000
; WIPE_START
G1 F24000
G1 X113.341 Y144.953 E-.0378
G1 X113.075 Y144.696 E-.1407
G1 X112.866 Y144.39 E-.14077
G1 X112.722 Y144.048 E-.14077
G1 X112.649 Y143.686 E-.14063
G1 X112.642 Y143.406 E-.1064
G1 X112.663 Y143.268 E-.05293
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.056 J1.216 P1  F30000
G1 X143.987 Y141.835 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13241
G1 X144.01 Y141.811 E.00111
G3 X145.22 Y141.265 I1.49 J1.688 E.04472
G1 X145.444 Y141.248 E.00745
G3 X143.705 Y142.14 I.056 J2.251 E.40218
G1 X143.946 Y141.879 E.01178
G1 X144.277 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.57 Y141.889 E.0111
G3 X145.269 Y141.654 I.93 J1.61 E.0228
G1 X145.454 Y141.64 E.0057
G3 X144.232 Y142.139 I.046 J1.859 E.31747
M204 S10000
; WIPE_START
G1 F24000
G1 X144.57 Y141.889 E-.15991
G1 X144.908 Y141.737 E-.14077
G1 X145.269 Y141.654 E-.14076
G1 X145.454 Y141.64 E-.07048
G1 X145.823 Y141.668 E-.14076
G1 X146.095 Y141.744 E-.10731
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.212 J-.106 P1  F30000
G1 X143.459 Y111.554 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13241
G1 X143.471 Y111.523 E.00111
G3 X145.22 Y110.265 I2.029 J.976 E.07452
G1 X145.444 Y110.248 E.00745
G3 X143.318 Y111.944 I.056 J2.251 E.37238
G1 X143.438 Y111.61 E.01178
G1 X143.829 Y111.685 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.017 Y111.377 E.01109
G3 X145.269 Y110.654 I1.482 J1.122 E.0456
G1 X145.454 Y110.64 E.0057
G3 X143.803 Y111.739 I.046 J1.859 E.29468
M204 S10000
; WIPE_START
G1 F24000
G1 X144.017 Y111.377 E-.15977
G1 X144.269 Y111.105 E-.14076
G1 X144.57 Y110.889 E-.14077
G1 X144.908 Y110.737 E-.14077
G1 X145.269 Y110.654 E-.14077
G1 X145.366 Y110.647 E-.03716
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.2 J.2 P1  F30000
G1 X151.898 Y149.898 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13241
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
M73 P76 R2
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
G1 F13241
G1 X108.45 Y149.55 E1.42968
G1 X108.45 Y106.45 E1.42968
G1 X151.55 Y106.45 E1.42968
G1 X151.55 Y149.49 E1.42769
G1 X149.514 Y149.143 F30000
G1 F13241
G1 X151.143 Y149.143 E.05401
G1 X147.619 Y145.619 E.16528
G2 X147.469 Y141.234 I-2.106 J-2.123 E.1634
G1 X151.143 Y137.561 E.17231
G1 X151.143 Y133.791 E.12508
G1 X143.763 Y126.411 E.3462
G3 X143.763 Y129.589 I-13.866 J1.589 E.10566
G1 X151.143 Y122.209 E.3462
G1 X151.143 Y118.439 E.12508
G1 X147.469 Y114.766 E.17231
G3 X143.381 Y114.619 I-1.966 J-2.276 E.14926
G1 X139.77 Y118.176 E.16812
G2 X135.176 Y115.148 I-9.796 J9.863 E.18373
G1 X143.467 Y106.857 E.38892
G1 X147.237 Y106.857 E.12508
G1 X151.143 Y110.763 E.18321
G1 X151.143 Y114.533 E.12508
G1 X142.851 Y122.825 E.38897
G2 X142.159 Y121.352 I-35.926 J15.998 E.05398
G1 X142.912 Y113.191 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49884
G1 F13241
G1 X142.97 Y113.404 E.00822
G1 X145.176 Y109.917 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F13241
G1 X145.058 Y109.944 E.00401
G2 X142.911 Y112.746 I.437 J2.559 E.12877
G1 X142.408 Y112.874 E.0172
G1 X142.582 Y113.734 E.0291
G1 X142.941 Y113.972 E.0143
G1 X143.317 Y113.896 E.01272
M73 P77 R2
G2 X145.236 Y109.916 I2.182 J-1.401 E.36499
G1 X149.514 Y106.857 F30000
G1 F13241
G1 X151.143 Y106.857 E.05401
G1 X147.619 Y110.381 E.16528
G1 X147.478 Y110.242 E.00656
G2 X143.237 Y110.533 I-1.977 J2.24 E.15689
G1 X139.561 Y106.857 E.17243
G1 X135.791 Y106.857 E.12508
G1 X128.412 Y114.236 E.34615
G1 X128.471 Y114.23 E.00198
G3 X131.529 Y114.23 I1.529 J13.903 E.10162
G1 X131.588 Y114.236 E.00198
G1 X124.209 Y106.857 E.34615
G1 X120.439 Y106.857 E.12508
G1 X116.769 Y110.527 E.17214
G1 X116.5 Y110.265 E.01246
G2 X112.379 Y110.379 I-2 J2.244 E.1507
G1 X108.857 Y106.857 E.16522
G1 X110.486 Y106.857 E.05401
G1 X114.549 Y109.908 F30000
G1 F13241
G2 X116.773 Y113.748 I-.047 J2.592 E.36355
G1 X117.281 Y113.923 E.01783
G1 X117.567 Y113.197 E.02588
G1 X117.395 Y112.802 E.0143
G1 X117.09 Y112.681 E.01089
G2 X114.609 Y109.907 I-2.605 J-.167 E.13746
; WIPE_START
G1 F24000
G1 X115.205 Y109.994 E-.22905
G1 X115.687 Y110.184 E-.19695
G1 X116.123 Y110.465 E-.19696
G1 X116.381 Y110.717 E-.13704
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.182 J.289 P1  F30000
G1 X117.031 Y113.38 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49884
G1 F13241
G1 X117.073 Y113.262 E.00467
G1 X117.841 Y121.352 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F13241
G2 X117.149 Y122.825 I35.228 J17.467 E.05398
G1 X108.857 Y114.533 E.38897
G1 X108.857 Y110.763 E.12508
G1 X112.763 Y106.857 E.18321
G1 X116.533 Y106.857 E.12508
G1 X124.824 Y115.148 E.38892
G2 X120.203 Y118.203 I5.486 J13.318 E.1849
G1 X116.621 Y114.621 E.16807
G3 X112.53 Y114.767 I-2.124 J-2.14 E.14926
G1 X108.857 Y118.439 E.17227
G1 X108.857 Y122.209 E.12508
G1 X116.237 Y129.589 E.3462
G3 X116.237 Y126.411 I16.176 J-1.589 E.1056
G1 X108.857 Y133.791 E.3462
G1 X108.857 Y137.561 E.12508
G1 X112.525 Y141.229 E.17205
G3 X116.619 Y141.381 I1.966 J2.269 E.14958
G1 X120.203 Y137.797 E.16813
G2 X124.824 Y140.852 I10.213 J-10.423 E.18487
G1 X116.533 Y149.143 E.38892
G1 X112.763 Y149.143 E.12508
G1 X108.857 Y145.237 E.18321
G1 X108.857 Y141.467 E.12508
G1 X117.149 Y133.175 E.38897
G1 X117.204 Y133.316 E.00503
G2 X117.841 Y134.648 I70.778 J-33.055 E.04896
G1 X114.236 Y140.916 F30000
G1 F13241
G3 X117.052 Y143.054 I.259 J2.582 E.12903
G1 X117.431 Y143.13 E.0128
G1 X117.669 Y143.489 E.0143
G1 X117.495 Y144.356 E.02933
G1 X116.982 Y144.279 E.01721
G3 X116.594 Y145.04 I-2.361 J-.723 E.02847
G1 X116.594 Y145.04 E0
G3 X114.176 Y140.917 I-2.089 J-1.545 E.34031
; WIPE_START
G1 F24000
G1 X113.671 Y141.033 E-.19696
G1 X113.199 Y141.246 E-.19696
G1 X112.778 Y141.548 E-.19696
G1 X112.475 Y141.875 E-.16912
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.477 J1.12 P1  F30000
G1 X117.153 Y143.868 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.498842
G1 F13241
G1 X117.183 Y143.643 E.00847
G1 X110.486 Y149.143 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F13241
G1 X108.857 Y149.143 E.05401
G1 X112.377 Y145.623 E.1651
G2 X116.568 Y145.677 I2.123 J-2.114 E.15401
G1 X116.763 Y145.467 E.0095
G1 X120.439 Y149.143 E.17243
G1 X124.209 Y149.143 E.12508
G1 X131.588 Y141.764 E.34615
G3 X128.412 Y141.764 I-1.588 J-14.972 E.10556
G1 X135.791 Y149.143 E.34615
G1 X139.561 Y149.143 E.12508
G1 X143.231 Y145.473 E.17214
G3 X143.379 Y141.379 I2.271 J-1.967 E.14952
G1 X139.797 Y137.797 E.16807
G3 X135.176 Y140.852 I-9.837 J-9.854 E.18499
G1 X143.467 Y149.143 E.38892
G1 X147.237 Y149.143 E.12508
G1 X151.143 Y145.237 E.18321
G1 X151.143 Y141.467 E.12508
G1 X142.851 Y133.175 E.38897
G3 X142.159 Y134.648 I-35.924 J-15.997 E.05398
G1 X145.176 Y140.917 F30000
G1 F13241
G2 X145.695 Y140.904 I.323 J2.579 E.52442
G1 X145.236 Y140.916 E.0152
G1 X151.143 Y131.514 F30000
G1 F13241
G1 X151.143 Y129.885 E.05401
G1 X131.885 Y149.143 E.9034
G1 X128.115 Y149.143 E.12508
G1 X108.857 Y129.885 E.9034
G1 X108.857 Y126.115 E.12508
G1 X128.115 Y106.857 E.9034
G1 X131.885 Y106.857 E.12508
G1 X151.143 Y126.115 E.9034
G1 X151.143 Y124.486 E.05401
; WIPE_START
G1 F24000
G1 X151.143 Y126.115 E-.61876
G1 X150.88 Y125.852 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.573 J-1.073 P1  F30000
G1 X129.725 Y114.554 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F13241
G1 X130.335 Y114.554 E.02026
G3 X129.665 Y114.554 I-.335 J13.44 E2.77983
M106 S160.65
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.327 Y114.654 E-.50956
G1 X127.678 Y114.768 E-.25044
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
G3 Z2.8 I-.379 J1.156 P1  F30000
G1 X128.38 Y114.998 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X129.021 Y114.934 E.02136
G3 X129.673 Y114.902 I.979 J13.056 E.02167
G3 X120.769 Y118.706 I.329 J13.096 E2.40146
G1 X120.769 Y118.706 E0
G3 X128.321 Y115.006 I9.231 J9.285 E.284
G1 X128.419 Y115.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.42 Y115.389 E.00001
G3 X129.683 Y115.294 I1.58 J12.609 E.03895
G1 X130.317 Y115.294 E.01947
G3 X127.793 Y115.483 I-.317 J12.704 E2.37558
G1 X128.36 Y115.398 E.01762
M204 S10000
; WIPE_START
G1 F24000
G1 X128.42 Y115.389 E-.0229
G1 X129.05 Y115.325 E-.24083
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.355 Y115.296 E-.01463
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.042 J-1.216 P1  F30000
G1 X114.523 Y114.75 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.109 Y114.716 E.01377
M73 P78 R2
G3 X114.22 Y110.265 I.391 J-2.217 E.21229
G1 X114.444 Y110.248 E.00745
G3 X114.583 Y114.749 I.056 J2.251 E.23373
G1 X114.547 Y114.36 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.546 Y114.357 E.00007
G3 X114.269 Y110.654 I-.046 J-1.859 E.17377
G1 X114.454 Y110.64 E.0057
G3 X114.913 Y114.311 I.046 J1.859 E.16807
G1 X114.607 Y114.352 E.00951
M204 S10000
; WIPE_START
G1 F24000
G1 X114.546 Y114.357 E-.02306
G1 X114.177 Y114.332 E-.14069
G1 X113.82 Y114.232 E-.14077
G1 X113.491 Y114.063 E-.14076
G1 X113.214 Y113.843 E-.13421
G1 X113.017 Y113.623 E-.1122
G1 X112.923 Y113.47 E-.06831
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.079 J1.214 P1  F30000
G1 X143.488 Y111.494 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.705 Y111.14 E.01377
G3 X145.22 Y110.265 I1.795 J1.359 E.05962
G1 X145.444 Y110.248 E.00745
G3 X143.459 Y111.547 I.056 J2.251 E.3864
G1 X143.825 Y111.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.017 Y111.377 E.0113
G3 X145.269 Y110.654 I1.482 J1.122 E.0456
G1 X145.454 Y110.64 E.0057
G3 X143.801 Y111.745 I.046 J1.859 E.29447
M204 S10000
; WIPE_START
G1 F24000
G1 X144.017 Y111.377 E-.16231
G1 X144.269 Y111.105 E-.14075
G1 X144.57 Y110.889 E-.14077
G1 X144.908 Y110.737 E-.14077
G1 X145.269 Y110.654 E-.14077
G1 X145.36 Y110.647 E-.03463
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.216 J-.054 P1  F30000
G1 X143.987 Y141.835 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.01 Y141.811 E.00111
G3 X145.22 Y141.265 I1.49 J1.688 E.04472
G1 X145.444 Y141.248 E.00745
G3 X143.705 Y142.14 I.056 J2.251 E.40218
G1 X143.946 Y141.879 E.01178
G1 X144.271 Y142.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.57 Y141.889 E.01131
G3 X145.269 Y141.654 I.93 J1.61 E.0228
G1 X145.454 Y141.64 E.0057
G3 X144.227 Y142.144 I.046 J1.859 E.31726
M204 S10000
; WIPE_START
G1 F24000
G1 X144.57 Y141.889 E-.16243
G1 X144.908 Y141.737 E-.14077
G1 X145.269 Y141.654 E-.14076
G1 X145.454 Y141.64 E-.07048
G1 X145.823 Y141.668 E-.14076
G1 X146.088 Y141.743 E-.10479
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.131 J-1.21 P1  F30000
G1 X113.16 Y145.307 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.85 Y145.031 E.01376
G3 X114.22 Y141.265 I1.65 J-1.532 E.1639
G1 X114.444 Y141.248 E.00745
G3 X113.208 Y145.343 I.056 J2.251 E.28213
G1 X113.381 Y144.981 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.138 Y144.764 E.01003
G3 X114.269 Y141.654 I1.362 J-1.265 E.12537
G1 X114.454 Y141.64 E.0057
G3 X113.428 Y145.018 I.046 J1.859 E.21597
M204 S10000
; WIPE_START
G1 F24000
G1 X113.138 Y144.764 E-.14673
G1 X112.913 Y144.47 E-.1407
G1 X112.752 Y144.136 E-.14076
G1 X112.661 Y143.777 E-.14077
G1 X112.642 Y143.407 E-.14077
G1 X112.662 Y143.276 E-.05026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.203 J1.2 P1  F30000
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
G3 Z3 I.85 J.871 P1  F30000
G1 X150.804 Y149.731 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.402371
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X151.528 Y149.025 E.05238
G1 X151.528 Y148.393 E.03274
G1 X150.364 Y149.528 E.08425
G1 X149.716 Y149.528 E.03357
G1 X151.528 Y147.761 E.13114
G1 X151.528 Y147.129 E.03274
G1 X149.068 Y149.528 E.17802
G1 X148.421 Y149.528 E.03357
G1 X151.528 Y146.497 E.22491
G1 X151.528 Y145.865 E.03274
G1 X147.773 Y149.528 E.2718
G1 X147.125 Y149.528 E.03357
G1 X151.528 Y145.233 E.31869
G1 X151.528 Y144.601 E.03274
G1 X146.477 Y149.528 E.36558
G1 X145.829 Y149.528 E.03357
G1 X151.528 Y143.969 E.41246
G1 X151.528 Y143.337 E.03274
G1 X145.181 Y149.528 E.45935
G1 X144.533 Y149.528 E.03357
G1 X151.528 Y142.705 E.50624
G1 X151.528 Y142.074 E.03274
G1 X143.885 Y149.528 E.55313
G1 X143.238 Y149.528 E.03357
G1 X151.528 Y141.442 E.60002
G1 X151.528 Y140.81 E.03274
G1 X148.015 Y144.236 E.25423
G1 X148.111 Y143.761 E.02509
G1 X148.111 Y143.51 E.01299
G1 X151.528 Y140.178 E.24728
G1 X151.528 Y139.546 E.03274
G1 X148.051 Y142.938 E.25169
G2 X147.895 Y142.458 I-1.265 J.146 E.02631
G1 X151.528 Y138.914 E.26297
G1 X151.528 Y138.282 E.03274
G1 X147.669 Y142.046 E.27928
G2 X147.385 Y141.691 I-1.02 J.525 E.02371
G1 X151.528 Y137.65 E.29983
G1 X151.528 Y137.018 E.03274
G1 X147.046 Y141.39 E.32438
G1 X146.649 Y141.146 E.02417
G1 X151.528 Y136.386 E.35314
G1 X151.528 Y135.754 E.03274
G1 X146.182 Y140.969 E.3869
G1 X145.696 Y140.883 E.02557
G1 X145.62 Y140.885 E.00393
G1 X151.528 Y135.122 E.42757
G1 X151.528 Y134.49 E.03274
G1 X144.896 Y140.959 E.47998
G1 X144.664 Y141.012 E.01232
G1 X144.188 Y141.227 E.02708
G1 X143.763 Y141.532 E.02708
G1 X143.408 Y141.915 E.02708
G1 X143.135 Y142.361 E.02708
G1 X142.958 Y142.85 E.02695
G1 X136.111 Y149.528 E.49551
G1 X136.759 Y149.528 E.03357
G1 X142.885 Y143.553 E.44334
G2 X142.96 Y144.112 I1.606 J.069 E.02937
G1 X137.407 Y149.528 E.40187
G1 X138.055 Y149.528 E.03357
G1 X143.123 Y144.584 E.36683
G2 X143.355 Y144.99 I1.119 J-.371 E.02437
G1 X138.702 Y149.528 E.33674
G1 X139.35 Y149.528 E.03357
G1 X143.645 Y145.339 E.31085
G2 X143.991 Y145.634 I.902 J-.707 E.02369
G1 X139.998 Y149.528 E.28895
G1 X140.646 Y149.528 E.03357
M73 P79 R2
G1 X144.395 Y145.872 E.27132
G1 X144.789 Y146.026 E.02194
G1 X144.87 Y146.04 E.00423
G1 X141.294 Y149.528 E.25878
G1 X141.942 Y149.528 E.03357
G1 X145.443 Y146.114 E.25336
G2 X146.174 Y146.032 I.138 J-2.083 E.03834
G1 X142.382 Y149.731 E.27444
M106 S160.65
G1 X135.255 Y149.731 F30000
M106 S255
G1 F3000
G1 X151.528 Y133.859 E1.1777
G1 X151.528 Y133.227 E.03274
G1 X134.815 Y149.528 E1.20956
G1 X134.167 Y149.528 E.03357
G1 X151.528 Y132.595 E1.25645
G1 X151.528 Y131.963 E.03274
G1 X133.519 Y149.528 E1.30334
G1 X132.872 Y149.528 E.03357
G1 X151.528 Y131.331 E1.35023
G1 X151.528 Y130.699 E.03274
G1 X132.224 Y149.528 E1.39711
G1 X131.576 Y149.528 E.03357
G1 X151.528 Y130.067 E1.444
G1 X151.528 Y129.435 E.03274
G1 X130.928 Y149.528 E1.49089
G1 X130.28 Y149.528 E.03357
G1 X151.528 Y128.803 E1.53778
G1 X151.528 Y128.171 E.03274
G1 X129.632 Y149.528 E1.58467
G1 X128.984 Y149.528 E.03357
G1 X151.528 Y127.539 E1.63156
G1 X151.528 Y126.907 E.03274
G1 X128.336 Y149.528 E1.67844
G1 X127.689 Y149.528 E.03357
G1 X151.528 Y126.275 E1.72533
G1 X151.528 Y125.644 E.03274
G1 X127.041 Y149.528 E1.77222
G1 X126.393 Y149.528 E.03357
G1 X136.208 Y139.955 E.71033
G3 X134.987 Y140.513 I-7.482 J-14.739 E.06954
G1 X125.745 Y149.528 E.6689
G1 X125.097 Y149.528 E.03357
G1 X133.976 Y140.868 E.64261
G3 X133.075 Y141.115 I-2.926 J-8.905 E.04843
G1 X124.449 Y149.528 E.62428
G1 X123.801 Y149.528 E.03357
G1 X132.258 Y141.28 E.61203
G3 X131.502 Y141.385 I-1.431 J-7.518 E.03954
G1 X123.153 Y149.528 E.60423
G1 X122.506 Y149.528 E.03357
G1 X130.793 Y141.445 E.59976
G3 X130.121 Y141.468 I-.564 J-6.712 E.03481
G1 X121.858 Y149.528 E.59806
G1 X121.21 Y149.528 E.03357
G1 X129.483 Y141.459 E.59874
G3 X128.872 Y141.422 I.061 J-6.135 E.03169
G1 X120.562 Y149.528 E.60145
G1 X119.914 Y149.528 E.03357
G1 X128.287 Y141.362 E.60594
G1 X127.725 Y141.277 E.0294
G1 X119.266 Y149.528 E.61222
G1 X118.618 Y149.528 E.03357
G1 X127.186 Y141.171 E.62006
G3 X126.664 Y141.048 I.973 J-5.287 E.02778
G1 X117.97 Y149.528 E.6292
G1 X117.323 Y149.528 E.03357
G1 X126.159 Y140.909 E.63951
G3 X125.669 Y140.756 I1.293 J-4.99 E.02664
G1 X116.675 Y149.528 E.65091
G1 X116.027 Y149.528 E.03357
G1 X125.197 Y140.584 E.66365
G3 X124.74 Y140.398 I1.634 J-4.674 E.02558
G1 X115.379 Y149.528 E.67744
G1 X114.731 Y149.528 E.03357
G1 X124.294 Y140.201 E.69211
M73 P80 R2
G1 X123.86 Y139.992 E.02494
G1 X114.083 Y149.528 E.7076
G1 X113.435 Y149.528 E.03357
G1 X123.444 Y139.765 E.72438
G3 X123.039 Y139.529 I2.162 J-4.185 E.02434
G1 X112.787 Y149.528 E.7419
G1 X112.14 Y149.528 E.03357
G1 X122.642 Y139.284 E.76011
G1 X122.261 Y139.024 E.02391
G1 X117.039 Y144.117 E.3779
G2 X117.111 Y143.415 I-1.701 J-.529 E.03681
G1 X121.891 Y138.753 E.34591
G3 X121.53 Y138.474 I2.619 J-3.76 E.02368
G1 X117.034 Y142.858 E.32533
G1 X117.008 Y142.726 E.00696
G1 X116.866 Y142.39 E.0189
G1 X121.181 Y138.181 E.3123
G3 X120.845 Y137.878 I2.874 J-3.522 E.02349
G1 X116.63 Y141.989 E.30503
G2 X116.336 Y141.643 I-1.001 J.554 E.02365
G1 X120.517 Y137.566 E.30255
G1 X120.201 Y137.242 E.02344
G1 X115.987 Y141.352 E.30495
G1 X115.697 Y141.165 E.01788
G1 X115.579 Y141.118 E.00659
G1 X119.897 Y136.906 E.31253
G3 X119.602 Y136.562 I3.298 J-3.129 E.02349
G1 X115.099 Y140.954 E.32587
G1 X114.696 Y140.883 E.02121
G1 X114.52 Y140.887 E.00914
G1 X119.319 Y136.207 E.34729
G3 X119.048 Y135.839 I3.554 J-2.893 E.02368
G1 X113.768 Y140.989 E.38212
G1 X113.664 Y141.012 E.00553
G1 X113.188 Y141.227 E.02708
G1 X112.763 Y141.532 E.02708
G1 X112.408 Y141.915 E.02708
G1 X112.135 Y142.361 E.02708
M73 P81 R2
G1 X112.012 Y142.702 E.01878
G1 X108.472 Y146.155 E.25618
G1 X108.472 Y146.786 E.03274
G1 X111.883 Y143.459 E.2469
G1 X111.905 Y143.891 E.02242
G1 X111.941 Y144.034 E.00765
G1 X108.472 Y147.418 E.2511
G1 X108.472 Y148.05 E.03274
G1 X112.092 Y144.519 E.26202
G1 X112.261 Y144.868 E.0201
G1 X112.312 Y144.936 E.00442
G1 X108.472 Y148.682 E.27793
G1 X108.472 Y149.314 E.03274
G1 X112.59 Y145.297 E.29805
G1 X112.93 Y145.597 E.0235
G1 X108.9 Y149.528 E.29166
G1 X109.548 Y149.528 E.03357
G1 X113.33 Y145.84 E.27367
G1 X113.411 Y145.887 E.0049
G1 X113.788 Y146.025 E.02076
G1 X110.196 Y149.528 E.25994
G1 X110.844 Y149.528 E.03357
G1 X114.342 Y146.116 E.25317
G1 X114.826 Y146.104 E.0251
G1 X115.056 Y146.052 E.01221
G1 X111.284 Y149.731 E.27299
M106 S160.65
G1 X108.269 Y145.72 F30000
M106 S255
G1 F3000
G1 X118.787 Y135.462 E.76116
G1 X118.536 Y135.074 E.02391
G1 X108.472 Y144.891 E.72838
G1 X108.472 Y144.259 E.03274
G1 X118.301 Y134.672 E.71134
G3 X118.075 Y134.26 I4.011 J-2.468 E.02434
G1 X108.472 Y143.627 E.69499
G1 X108.472 Y142.995 E.03274
G1 X117.859 Y133.839 E.67938
G1 X117.661 Y133.4 E.02494
G1 X108.472 Y142.363 E.66505
G1 X108.472 Y141.731 E.03274
G1 X117.475 Y132.95 E.65156
G3 X117.3 Y132.488 I4.539 J-1.979 E.02558
G1 X108.472 Y141.099 E.63893
G1 X108.472 Y140.467 E.03274
G1 X117.14 Y132.012 E.62736
G3 X116.999 Y131.518 I4.879 J-1.662 E.02664
G1 X108.472 Y139.835 E.61713
G1 X108.472 Y139.203 E.03274
G1 X116.873 Y131.009 E.60799
G3 X116.762 Y130.485 I5.2 J-1.366 E.02778
G1 X108.472 Y138.571 E.60002
G1 X108.472 Y137.94 E.03274
G1 X116.67 Y129.943 E.59334
G1 X116.6 Y129.38 E.0294
G1 X108.472 Y137.308 E.58823
G1 X108.472 Y136.676 E.03274
G1 X116.554 Y128.793 E.58491
G3 X116.532 Y128.182 I6.111 J-.519 E.0317
G1 X108.472 Y136.044 E.58337
G1 X108.472 Y135.412 E.03274
G1 X116.539 Y127.543 E.58386
G3 X116.579 Y126.872 I6.737 J.061 E.03481
G1 X108.472 Y134.78 E.58672
G1 X108.472 Y134.148 E.03274
G1 X116.657 Y126.165 E.59236
G3 X116.781 Y125.412 I7.603 J.865 E.03954
G1 X108.472 Y133.516 E.60133
G1 X108.472 Y132.884 E.03274
G1 X116.966 Y124.599 E.61475
G3 X117.236 Y123.704 I9.099 J2.253 E.04843
G1 X108.472 Y132.252 E.63425
G1 X108.472 Y131.62 E.03274
G1 X117.615 Y122.702 E.66171
G3 X118.204 Y121.496 I15.14 J6.642 E.06954
G1 X108.472 Y130.988 E.70431
G1 X108.472 Y130.356 E.03274
G1 X132.959 Y106.472 E1.77222
G1 X133.607 Y106.472 E.03357
G1 X123.792 Y116.045 E.71033
G3 X125.013 Y115.487 I7.482 J14.74 E.06954
G1 X134.255 Y106.472 E.66891
G1 X134.903 Y106.472 E.03357
G1 X126.024 Y115.132 E.64261
G3 X126.925 Y114.885 I2.926 J8.904 E.04843
G1 X135.551 Y106.472 E.62428
G1 X136.199 Y106.472 E.03357
G1 X127.742 Y114.72 E.61203
G3 X128.498 Y114.615 I1.431 J7.518 E.03954
G1 X136.847 Y106.472 E.60423
G1 X137.494 Y106.472 E.03357
G1 X129.207 Y114.555 E.59976
M73 P82 R2
G3 X129.879 Y114.532 I.564 J6.713 E.03481
G1 X138.142 Y106.472 E.59806
G1 X138.79 Y106.472 E.03357
G1 X130.517 Y114.541 E.59874
G3 X131.128 Y114.578 I-.061 J6.134 E.0317
G1 X139.438 Y106.472 E.60145
G1 X140.086 Y106.472 E.03357
G1 X131.713 Y114.638 E.60594
G1 X132.275 Y114.723 E.0294
G1 X140.734 Y106.472 E.61222
G1 X141.382 Y106.472 E.03357
G1 X132.814 Y114.829 E.62006
G3 X133.336 Y114.952 I-.973 J5.287 E.02778
G1 X142.03 Y106.472 E.6292
G1 X142.677 Y106.472 E.03357
G1 X133.841 Y115.091 E.63951
G3 X134.331 Y115.244 I-1.293 J4.992 E.02664
G1 X143.325 Y106.472 E.65091
G1 X143.973 Y106.472 E.03357
G1 X134.803 Y115.416 E.66365
G3 X135.26 Y115.602 I-1.634 J4.674 E.02558
G1 X144.621 Y106.472 E.67744
G1 X145.269 Y106.472 E.03357
G1 X135.706 Y115.799 E.69211
G1 X136.14 Y116.008 E.02494
G1 X145.917 Y106.472 E.7076
G1 X146.565 Y106.472 E.03357
G1 X136.556 Y116.235 E.72438
G3 X136.961 Y116.471 I-2.162 J4.185 E.02434
G1 X147.213 Y106.472 E.7419
G1 X147.86 Y106.472 E.03357
G1 X137.21 Y116.86 E.77082
M106 S160.65
; WIPE_START
G1 F24000
G1 X138.641 Y115.464 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.494 J1.112 P1  F30000
G1 X151.731 Y109.648 Z3
G1 Z2.6
G1 E.8 F1800
M106 S255
G1 F3000
G1 X148.004 Y113.283 E.26973
G1 X148.111 Y112.761 E.0276
G1 X148.111 Y112.546 E.01114
G1 X151.528 Y109.214 E.24728
G1 X151.528 Y108.582 E.03274
G1 X148.057 Y111.968 E.25125
G2 X147.905 Y111.483 I-1.274 J.132 E.02647
G1 X151.528 Y107.95 E.26219
G1 X151.528 Y107.318 E.03274
G1 X147.684 Y111.067 E.27822
G2 X147.404 Y110.709 I-1.027 J.514 E.02374
G1 X151.528 Y106.686 E.29851
G1 X151.528 Y106.472 E.01109
G1 X151.1 Y106.472 E.0222
G1 X147.068 Y110.404 E.29178
G1 X146.675 Y110.156 E.0241
M73 P83 R2
G1 X150.452 Y106.472 E.27335
G1 X149.804 Y106.472 E.03357
G1 X146.213 Y109.975 E.2599
G1 X145.658 Y109.884 E.02913
G1 X149.156 Y106.472 E.25317
G1 X148.508 Y106.472 E.03357
G1 X144.944 Y109.948 E.25796
G1 X144.664 Y110.012 E.01487
G1 X144.188 Y110.227 E.02708
G1 X143.763 Y110.532 E.02708
G1 X143.408 Y110.915 E.02708
G1 X143.135 Y111.361 E.02708
G1 X142.951 Y111.893 E.02914
G1 X137.739 Y116.976 E.37719
G3 X138.109 Y117.247 I-2.529 J3.843 E.02377
G1 X142.885 Y112.588 E.34568
G2 X142.966 Y113.142 I1.594 J.052 E.02914
G1 X138.47 Y117.526 E.32533
G1 X138.819 Y117.819 E.02355
G1 X143.134 Y113.61 E.3123
G2 X143.37 Y114.011 I1.112 J-.383 E.0243
G1 X139.155 Y118.122 E.30503
G3 X139.483 Y118.434 I-2.961 J3.444 E.02346
G1 X143.664 Y114.357 E.30255
G2 X144.013 Y114.648 I.895 J-.718 E.02372
G1 X139.799 Y118.758 E.30495
G3 X140.103 Y119.094 I-3.212 J3.209 E.02346
G1 X144.421 Y114.882 E.31253
G1 X144.789 Y115.026 E.02049
G1 X144.901 Y115.046 E.00586
G1 X140.398 Y119.438 E.32587
G1 X140.681 Y119.793 E.02355
G1 X145.48 Y115.113 E.34729
G2 X146.22 Y115.023 I.118 J-2.122 E.03882
G1 X140.952 Y120.161 E.38128
G3 X141.213 Y120.538 I-3.645 J2.81 E.02377
G1 X151.528 Y110.477 E.74651
G1 X151.528 Y111.109 E.03274
G1 X141.464 Y120.926 E.72838
G3 X141.699 Y121.328 I-3.912 J2.561 E.02416
G1 X151.528 Y111.741 E.71134
G1 X151.528 Y112.373 E.03274
G1 X141.925 Y121.74 E.69499
G3 X142.141 Y122.161 I-4.109 J2.369 E.02454
G1 X151.528 Y113.005 E.67938
G1 X151.528 Y113.637 E.03274
G1 X142.339 Y122.6 E.66505
G3 X142.525 Y123.05 I-4.417 J2.093 E.02525
G1 X151.528 Y114.269 E.65156
G1 X151.528 Y114.901 E.03274
G1 X142.7 Y123.512 E.63893
G1 X142.86 Y123.988 E.02601
G1 X151.528 Y115.533 E.62736
G1 X151.528 Y116.165 E.03274
G1 X143.001 Y124.482 E.61713
G3 X143.127 Y124.991 I-5.032 J1.52 E.02717
G1 X151.528 Y116.797 E.60799
G1 X151.528 Y117.429 E.03274
G1 X143.238 Y125.515 E.60002
G3 X143.33 Y126.057 I-5.384 J1.195 E.02849
G1 X151.528 Y118.06 E.59334
G1 X151.528 Y118.692 E.03274
G1 X143.4 Y126.62 E.58823
G3 X143.446 Y127.207 I-5.86 J.754 E.03052
G1 X151.528 Y119.324 E.58491
G1 X151.528 Y119.956 E.03274
G1 X143.468 Y127.818 E.58337
G3 X143.459 Y128.459 I-7.587 J.22 E.03318
G1 X151.528 Y120.588 E.58398
G1 X151.528 Y121.22 E.03274
G1 X143.421 Y129.127 E.58672
G3 X143.343 Y129.835 I-7.131 J-.427 E.03691
G1 X151.528 Y121.852 E.59236
G1 X151.528 Y122.484 E.03274
G1 X143.219 Y130.588 E.60133
G3 X143.034 Y131.401 I-21.059 J-4.375 E.04319
G1 X151.528 Y123.116 E.61475
G1 X151.528 Y123.748 E.03274
G1 X142.764 Y132.296 E.63425
G3 X142.385 Y133.298 I-15.195 J-5.181 E.05552
G1 X151.528 Y124.38 E.66171
G1 X151.528 Y125.012 E.03274
G1 X141.241 Y135.045 E.74447
M106 S160.65
; WIPE_START
G1 F24000
G1 X142.673 Y133.649 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.555 J-1.083 P1  F30000
G1 X108.269 Y116.02 Z3
G1 Z2.6
G1 E.8 F1800
M106 S255
G1 F3000
M73 P84 R2
G1 X111.885 Y112.493 E.26168
G1 X111.905 Y112.891 E.02065
G1 X111.949 Y113.063 E.00918
G1 X108.472 Y116.454 E.25163
G1 X108.472 Y117.086 E.03274
G1 X112.104 Y113.543 E.26287
G1 X112.261 Y113.868 E.01869
G1 X112.328 Y113.957 E.00576
G1 X108.472 Y117.718 E.27906
G1 X108.472 Y118.35 E.03274
G1 X112.61 Y114.314 E.29946
G1 X112.868 Y114.555 E.01829
G1 X112.954 Y114.61 E.0053
G1 X108.472 Y118.982 E.32438
G1 X108.472 Y119.614 E.03274
G1 X113.351 Y114.854 E.35314
G1 X113.818 Y115.031 E.02585
G1 X108.472 Y120.246 E.3869
G1 X108.472 Y120.878 E.03274
G1 X114.38 Y115.115 E.42757
G1 X114.826 Y115.104 E.02315
G1 X115.104 Y115.041 E.01475
G1 X108.269 Y121.707 E.49464
M106 S160.65
G1 X108.269 Y129.922 F30000
M106 S255
G1 F3000
G1 X132.311 Y106.472 E1.73999
G1 X131.664 Y106.472 E.03357
G1 X108.472 Y129.093 E1.67844
G1 X108.472 Y128.461 E.03274
G1 X131.016 Y106.472 E1.63155
G1 X130.368 Y106.472 E.03357
G1 X108.472 Y127.829 E1.58467
G1 X108.472 Y127.197 E.03274
G1 X129.72 Y106.472 E1.53778
G1 X129.072 Y106.472 E.03357
M73 P84 R1
G1 X108.472 Y126.565 E1.49089
G1 X108.472 Y125.933 E.03274
G1 X128.424 Y106.472 E1.444
G1 X127.776 Y106.472 E.03357
G1 X108.472 Y125.301 E1.39711
G1 X108.472 Y124.669 E.03274
G1 X127.128 Y106.472 E1.35023
G1 X126.481 Y106.472 E.03357
G1 X108.472 Y124.037 E1.30334
G1 X108.472 Y123.405 E.03274
G1 X125.833 Y106.472 E1.25645
G1 X125.185 Y106.472 E.03357
G1 X108.472 Y122.773 E1.20956
G1 X108.472 Y122.141 E.03274
G1 X124.537 Y106.472 E1.16267
G1 X123.889 Y106.472 E.03357
G1 X117.03 Y113.162 E.49637
G2 X117.111 Y112.451 I-1.718 J-.556 E.03731
G1 X123.241 Y106.472 E.44363
G1 X122.593 Y106.472 E.03357
G1 X117.04 Y111.888 E.40188
G2 X116.877 Y111.416 I-1.25 J.169 E.02607
G1 X121.945 Y106.472 E.36683
G1 X121.298 Y106.472 E.03357
G1 X116.645 Y111.01 E.33674
G2 X116.355 Y110.661 I-1.008 J.543 E.02367
G1 X120.65 Y106.472 E.31084
G1 X120.002 Y106.472 E.03357
G1 X116.009 Y110.366 E.28895
G1 X115.697 Y110.165 E.01924
G1 X115.605 Y110.128 E.00513
G1 X119.354 Y106.472 E.27132
G1 X118.706 Y106.472 E.03357
G1 X115.13 Y109.96 E.25878
G1 X114.696 Y109.883 E.02285
G1 X114.557 Y109.886 E.00719
G1 X118.058 Y106.472 E.25336
G1 X117.41 Y106.472 E.03357
G1 X113.816 Y109.978 E.26013
G1 X113.664 Y110.012 E.00807
G1 X113.188 Y110.227 E.02708
G1 X112.763 Y110.532 E.02708
G1 X112.408 Y110.915 E.02708
M73 P85 R1
G1 X112.135 Y111.361 E.02708
G1 X111.991 Y111.757 E.02184
G1 X108.472 Y115.19 E.25472
G1 X108.472 Y114.558 E.03274
G1 X116.762 Y106.472 E.60002
G1 X116.115 Y106.472 E.03357
G1 X108.472 Y113.926 E.55313
G1 X108.472 Y113.295 E.03274
G1 X115.467 Y106.472 E.50624
G1 X114.819 Y106.472 E.03357
G1 X108.472 Y112.663 E.45935
G1 X108.472 Y112.031 E.03274
G1 X114.171 Y106.472 E.41246
G1 X113.523 Y106.472 E.03357
G1 X108.472 Y111.399 E.36558
G1 X108.472 Y110.767 E.03274
G1 X112.875 Y106.472 E.31869
G1 X112.227 Y106.472 E.03357
G1 X108.472 Y110.135 E.2718
G1 X108.472 Y109.503 E.03274
G1 X111.579 Y106.472 E.22491
G1 X110.932 Y106.472 E.03357
G1 X108.472 Y108.871 E.17802
G1 X108.472 Y108.239 E.03274
G1 X110.284 Y106.472 E.13113
G1 X109.636 Y106.472 E.03357
G1 X108.472 Y107.607 E.08425
G1 X108.472 Y106.975 E.03274
G1 X109.196 Y106.269 E.05238
M106 S160.65
M106 S237.15
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P86 R1
G1 X108.472 Y106.975 E-.38422
G1 X108.472 Y107.607 E-.24013
G1 X108.727 Y107.358 E-.13565
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
G3 Z3 I-.441 J1.134 P1  F30000
G1 X128.361 Y115.001 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.371 Y114.999 E.00031
G3 X129.673 Y114.902 I1.629 J13 E.04335
G1 X130.327 Y114.902 E.02167
G3 X127.725 Y115.097 I-.327 J13.097 E2.64396
G1 X128.302 Y115.01 E.01937
G1 X128.42 Y115.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X129.05 Y115.325 E.01946
G3 X129.683 Y115.294 I.95 J12.674 E.01947
G1 X130.317 Y115.294 E.01947
G3 X128.36 Y115.396 I-.317 J12.706 E2.39349
M204 S10000
; WIPE_START
G1 F24000
G1 X129.05 Y115.325 E-.26348
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.356 Y115.296 E-.01488
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.042 J-1.216 P1  F30000
G1 X114.523 Y114.75 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.109 Y114.716 E.01377
G3 X114.22 Y110.265 I.391 J-2.217 E.21229
G1 X114.444 Y110.248 E.00745
G3 X114.583 Y114.749 I.056 J2.251 E.23373
G1 X114.548 Y114.36 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.546 Y114.357 E.00008
G3 X114.269 Y110.654 I-.046 J-1.859 E.17377
G1 X114.454 Y110.64 E.0057
G3 X114.913 Y114.311 I.046 J1.859 E.16807
G1 X114.607 Y114.352 E.0095
M204 S10000
; WIPE_START
G1 F24000
G1 X114.546 Y114.357 E-.02318
G1 X114.177 Y114.332 E-.14069
G1 X113.82 Y114.232 E-.14077
G1 X113.501 Y114.069 E-.13642
G1 X113.269 Y113.895 E-.10999
G1 X113.017 Y113.623 E-.14077
G1 X112.924 Y113.47 E-.06819
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.217 J.009 P1  F30000
G1 X113.16 Y145.307 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.85 Y145.031 E.01377
G3 X114.22 Y141.265 I1.65 J-1.532 E.1639
G1 X114.444 Y141.248 E.00745
G3 X113.208 Y145.343 I.056 J2.251 E.28213
G1 X113.384 Y144.984 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.138 Y144.764 E.01013
G3 X114.269 Y141.654 I1.362 J-1.265 E.12537
G1 X114.454 Y141.64 E.0057
G3 X113.431 Y145.02 I.046 J1.859 E.21587
M204 S10000
; WIPE_START
G1 F24000
G1 X113.138 Y144.764 E-.14798
G1 X112.913 Y144.47 E-.1407
G1 X112.752 Y144.136 E-.14077
G1 X112.661 Y143.777 E-.14077
G1 X112.642 Y143.407 E-.14077
G1 X112.661 Y143.28 E-.04901
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.056 J1.216 P1  F30000
G1 X143.987 Y141.835 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.01 Y141.811 E.00111
G3 X145.22 Y141.265 I1.49 J1.688 E.04472
G1 X145.444 Y141.248 E.00745
G3 X143.705 Y142.14 I.056 J2.251 E.40218
G1 X143.946 Y141.879 E.01178
G1 X144.265 Y142.109 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.269 Y142.105 E.00018
G3 X145.269 Y141.654 I1.231 J1.393 E.0342
G1 X145.454 Y141.64 E.0057
G3 X144.017 Y142.377 I.046 J1.859 E.30762
G1 X144.224 Y142.153 E.00936
M204 S10000
; WIPE_START
G1 F24000
G1 X144.269 Y142.105 E-.025
G1 X144.57 Y141.889 E-.14076
G1 X144.908 Y141.737 E-.14078
G1 X145.269 Y141.654 E-.14076
G1 X145.454 Y141.64 E-.07047
G1 X145.639 Y141.645 E-.07047
G1 X146.004 Y141.709 E-.14077
G1 X146.08 Y141.739 E-.03099
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.213 J-.104 P1  F30000
G1 X143.488 Y111.494 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.705 Y111.14 E.01377
G3 X145.22 Y110.265 I1.795 J1.359 E.05962
G1 X145.444 Y110.248 E.00745
G3 X143.459 Y111.547 I.056 J2.251 E.38639
G1 X143.822 Y111.698 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.824 Y111.693 E.00017
G3 X145.269 Y110.654 I1.675 J.806 E.057
G1 X145.454 Y110.64 E.0057
G3 X143.698 Y112.041 I.046 J1.859 E.28483
G1 X143.802 Y111.755 E.00937
M204 S10000
; WIPE_START
G1 F24000
G1 X143.824 Y111.693 E-.02489
G1 X144.017 Y111.377 E-.14075
G1 X144.269 Y111.105 E-.14077
G1 X144.57 Y110.889 E-.14078
G1 X144.908 Y110.737 E-.14077
G1 X145.269 Y110.654 E-.14077
G1 X145.351 Y110.648 E-.03129
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.2 J.2 P1  F30000
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
G1 X146.178 Y145.986 E.15566
G3 X145.556 Y146.074 I-.528 J-1.494 E.01944
G1 X142.066 Y149.565 E.15183
G1 X141.532 Y149.565 E.01642
G1 X145.06 Y146.037 E.15345
G3 X144.636 Y145.927 I.06 J-1.103 E.01356
G1 X140.998 Y149.565 E.15824
G1 X140.465 Y149.565 E.01642
G1 X144.263 Y145.766 E.16523
M73 P87 R1
G1 X143.939 Y145.557 E.01188
G1 X139.931 Y149.565 E.17434
G1 X139.397 Y149.565 E.01642
G1 X143.66 Y145.302 E.18543
G3 X143.415 Y145.013 I.593 J-.75 E.01173
G1 X138.863 Y149.565 E.19801
G1 X138.329 Y149.565 E.01642
G1 X143.206 Y144.688 E.21215
G1 X143.048 Y144.312 E.01253
G1 X137.795 Y149.565 E.22848
G1 X137.262 Y149.565 E.01642
G1 X142.949 Y143.877 E.24741
G1 X142.926 Y143.762 E.00362
G1 X142.917 Y143.375 E.01189
G1 X136.728 Y149.565 E.26923
G1 X136.194 Y149.565 E.01642
G1 X143.047 Y142.712 E.29809
G1 X143.169 Y142.377 E.01096
G1 X143.437 Y141.938 E.01585
G1 X143.788 Y141.56 E.01585
G1 X144.206 Y141.259 E.01585
G1 X144.722 Y141.036 E.01729
G1 X151.565 Y134.194 E.29764
G1 X151.565 Y134.728 E.01642
G1 X145.365 Y140.928 E.26969
G3 X145.875 Y140.951 I.196 J1.273 E.01581
G1 X151.565 Y135.262 E.24751
G1 X151.565 Y135.795 E.01642
G1 X146.309 Y141.051 E.22863
G1 X146.69 Y141.204 E.01264
G1 X151.565 Y136.329 E.21203
G1 X151.565 Y136.863 E.01642
G1 X147.015 Y141.413 E.19792
G3 X147.301 Y141.66 I-.468 J.833 E.01172
G1 X151.565 Y137.397 E.18545
G1 X151.565 Y137.931 E.01642
G1 X147.554 Y141.942 E.17447
G1 X147.77 Y142.259 E.01182
G1 X151.565 Y138.465 E.16505
G1 X151.565 Y138.998 E.01642
G1 X147.929 Y142.634 E.15814
G1 X147.973 Y142.737 E.00345
G1 X148.038 Y143.059 E.0101
G1 X151.565 Y139.532 E.15341
G1 X151.565 Y140.066 E.01642
G1 X148.081 Y143.549 E.15153
G1 X148.083 Y143.64 E.00278
G1 X147.997 Y144.167 E.01644
G1 X151.734 Y140.43 E.16256
G1 X140.185 Y136.499 F30000
G1 F15000
G1 X151.565 Y125.119 E.49502
G1 X151.565 Y124.585 E.01642
G1 X141.879 Y134.271 E.42134
G2 X142.367 Y133.249 I-9.995 J-5.403 E.03486
G1 X151.565 Y124.051 E.40009
G1 X151.565 Y123.518 E.01642
G1 X142.695 Y132.387 E.38581
G2 X142.937 Y131.612 I-7.646 J-2.806 E.02499
G1 X151.565 Y122.984 E.37531
G1 X151.565 Y122.45 E.01642
G1 X143.115 Y130.899 E.36755
G2 X143.244 Y130.236 I-6.579 J-1.626 E.02079
G1 X151.565 Y121.916 E.36193
G1 X151.565 Y121.382 E.01642
G1 X143.334 Y129.612 E.35801
G2 X143.393 Y129.02 I-5.901 J-.879 E.01831
G1 X151.565 Y120.848 E.35548
G1 X151.565 Y120.315 E.01642
G1 X143.424 Y128.455 E.3541
G2 X143.433 Y127.912 I-5.436 J-.363 E.01671
G1 X151.565 Y119.781 E.3537
G1 X151.565 Y119.247 E.01642
G1 X143.42 Y127.391 E.35427
G2 X143.386 Y126.892 I-5.021 J.095 E.0154
G1 X151.565 Y118.713 E.35577
G1 X151.565 Y118.179 E.01642
G1 X143.337 Y126.407 E.3579
G2 X143.275 Y125.936 I-4.756 J.388 E.01464
G1 X151.565 Y117.646 E.36061
G1 X151.565 Y117.112 E.01642
G1 X143.195 Y125.482 E.36409
G2 X143.102 Y125.041 I-4.462 J.713 E.01386
G1 X151.565 Y116.578 E.36814
G1 X151.565 Y116.044 E.01642
G1 X142.999 Y124.61 E.3726
G1 X142.882 Y124.193 E.01331
G1 X151.565 Y115.51 E.3777
G1 X151.565 Y114.976 E.01642
G1 X142.754 Y123.787 E.38327
G2 X142.619 Y123.388 I-4.06 J1.151 E.01296
G1 X151.565 Y114.443 E.38914
G1 X151.565 Y113.909 E.01642
G1 X142.468 Y123.005 E.39568
G2 X142.312 Y122.628 I-3.855 J1.384 E.01256
G1 X151.565 Y113.375 E.40251
G1 X151.565 Y112.841 E.01642
G1 X142.146 Y122.26 E.40973
G2 X141.968 Y121.904 I-3.659 J1.597 E.01225
G1 X151.565 Y112.307 E.41744
G1 X151.565 Y111.774 E.01642
G1 X141.786 Y121.552 E.42535
G1 X141.591 Y121.213 E.01202
G1 X151.565 Y111.24 E.43385
G1 X151.565 Y110.706 E.01642
G1 X141.391 Y120.88 E.44256
G1 X141.181 Y120.556 E.01188
G1 X151.565 Y110.172 E.45168
G1 X151.565 Y109.638 E.01642
G1 X147.975 Y113.228 E.15613
G1 X148.008 Y113.139 E.00291
G1 X148.082 Y112.587 E.01712
G1 X151.565 Y109.104 E.15149
G1 X151.565 Y108.571 E.01642
G1 X148.044 Y112.091 E.15313
G1 X147.973 Y111.737 E.0111
G1 X147.941 Y111.661 E.00255
G1 X151.565 Y108.037 E.15765
G1 X151.565 Y107.503 E.01642
G1 X147.782 Y111.285 E.16453
G1 X147.569 Y110.964 E.01185
G1 X151.565 Y106.969 E.17379
G1 X151.565 Y106.435 E.01642
G1 X147.321 Y110.679 E.1846
G2 X147.038 Y110.428 I-.762 J.574 E.01171
G1 X151.031 Y106.435 E.17368
G1 X150.497 Y106.435 E.01642
G1 X146.714 Y110.219 E.16457
G1 X146.336 Y110.062 E.01256
G1 X149.963 Y106.435 E.15776
G1 X149.429 Y106.435 E.01642
G1 X145.907 Y109.957 E.1532
G2 X145.404 Y109.927 I-.327 J1.23 E.01561
G1 X148.896 Y106.435 E.15187
G1 X148.362 Y106.435 E.01642
G1 X144.772 Y110.025 E.15615
G1 X144.676 Y110.047 E.00303
G1 X144.206 Y110.259 E.01585
G1 X143.788 Y110.56 E.01585
G1 X143.437 Y110.937 E.01585
G1 X143.169 Y111.377 E.01585
G1 X143.025 Y111.772 E.01293
G1 X137.761 Y117.036 E.22895
G3 X138.069 Y117.262 I-2.116 J3.191 E.01175
G1 X142.918 Y112.413 E.21094
G2 X142.956 Y112.909 I1.408 J.142 E.01538
G1 X138.372 Y117.492 E.19937
G3 X138.663 Y117.736 I-2.298 J3.038 E.01166
G1 X143.059 Y113.339 E.19124
G1 X143.218 Y113.715 E.01254
G1 X138.95 Y117.982 E.18563
G1 X139.227 Y118.239 E.01162
G1 X143.431 Y114.036 E.18284
G2 X143.679 Y114.321 I.83 J-.472 E.01172
G1 X139.498 Y118.502 E.18187
G1 X139.762 Y118.772 E.01161
G1 X143.962 Y114.572 E.1827
G1 X144.286 Y114.781 E.01188
G1 X140.016 Y119.051 E.18574
G1 X140.267 Y119.335 E.01163
G1 X144.664 Y114.938 E.19126
G2 X145.092 Y115.043 I.474 J-1.008 E.01367
G1 X140.505 Y119.63 E.19956
G3 X140.74 Y119.929 I-2.876 J2.504 E.0117
G1 X145.596 Y115.073 E.21123
G1 X145.822 Y115.068 E.00695
G1 X146.228 Y114.975 E.01281
G1 X140.842 Y120.361 E.2343
; WIPE_START
G1 F24000
G1 X142.256 Y118.947 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.109 J.502 P1  F30000
G1 X147.998 Y106.266 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X137.444 Y116.819 E.45907
G2 X137.12 Y116.61 I-2.259 J3.147 E.01188
G1 X147.294 Y106.435 E.44259
G1 X146.76 Y106.435 E.01642
G1 X136.788 Y116.407 E.43378
G2 X136.446 Y116.216 I-2.088 J3.337 E.01207
G1 X146.226 Y106.435 E.42546
G1 X145.693 Y106.435 E.01642
G1 X136.099 Y116.029 E.41733
G1 X135.738 Y115.856 E.0123
G1 X145.159 Y106.435 E.40978
G1 X144.625 Y106.435 E.01642
G1 X135.372 Y115.688 E.4025
G1 X134.996 Y115.53 E.01253
G1 X144.091 Y106.435 E.39562
G1 X143.557 Y106.435 E.01642
G1 X134.609 Y115.384 E.38926
G2 X134.215 Y115.244 I-1.598 J3.877 E.01286
G1 X143.023 Y106.435 E.38318
G1 X142.49 Y106.435 E.01642
G1 X133.807 Y115.118 E.3777
G2 X133.388 Y115.003 I-1.367 J4.133 E.01335
G1 X141.956 Y106.435 E.37268
G1 X141.422 Y106.435 E.01642
G1 X132.962 Y114.896 E.36802
G1 X132.518 Y114.806 E.01393
G1 X140.888 Y106.435 E.36411
G1 X140.354 Y106.435 E.01642
G1 X132.062 Y114.728 E.36071
G2 X131.595 Y114.661 I-.901 J4.647 E.01452
G1 X139.821 Y106.435 E.35782
G1 X139.287 Y106.435 E.01642
G1 X131.11 Y114.612 E.3557
G2 X130.606 Y114.582 I-.557 J5.029 E.01552
G1 X138.753 Y106.435 E.35438
G1 X138.219 Y106.435 E.01642
G1 X130.086 Y114.569 E.35379
G2 X129.546 Y114.574 I-.21 J5.41 E.01661
G1 X137.685 Y106.435 E.35405
G1 X137.151 Y106.435 E.01642
G1 X128.984 Y114.603 E.3553
G1 X128.39 Y114.663 E.01834
G1 X136.618 Y106.435 E.35788
G1 X136.084 Y106.435 E.01642
G1 X127.766 Y114.754 E.36184
G2 X127.103 Y114.883 I.96 J6.704 E.02078
G1 X135.55 Y106.435 E.36745
G1 X135.016 Y106.435 E.01642
M73 P88 R1
G1 X126.393 Y115.058 E.3751
G2 X125.615 Y115.302 I6.785 J22.984 E.02508
G1 X134.482 Y106.435 E.38572
G1 X133.949 Y106.435 E.01642
G1 X124.745 Y115.639 E.40037
G2 X123.729 Y116.121 I5.589 J13.094 E.03458
G1 X133.415 Y106.435 E.42133
G1 X132.881 Y106.435 E.01642
G1 X122.371 Y116.945 E.45717
G2 X118.935 Y120.381 I7.517 J10.953 E.15031
G1 X108.435 Y130.881 E.45674
G1 X108.435 Y131.415 E.01642
G1 X118.121 Y121.729 E.42134
G2 X117.633 Y122.751 I9.997 J5.404 E.03486
G1 X108.435 Y131.949 E.4001
G1 X108.435 Y132.482 E.01642
G1 X117.305 Y123.613 E.38581
G2 X117.063 Y124.388 I7.646 J2.806 E.02499
G1 X108.435 Y133.016 E.37531
G1 X108.435 Y133.55 E.01642
G1 X116.885 Y125.1 E.36755
G2 X116.756 Y125.763 I6.579 J1.626 E.02079
G1 X108.435 Y134.084 E.36193
G1 X108.435 Y134.618 E.01642
G1 X116.666 Y126.387 E.35801
G2 X116.607 Y126.979 I5.902 J.879 E.01831
G1 X108.435 Y135.151 E.35548
G1 X108.435 Y135.685 E.01642
G1 X116.576 Y127.545 E.3541
G2 X116.567 Y128.088 I5.435 J.363 E.01671
G1 X108.435 Y136.219 E.3537
G1 X108.435 Y136.753 E.01642
G1 X116.58 Y128.609 E.35427
G2 X116.614 Y129.108 I5.02 J-.095 E.01541
G1 X108.435 Y137.287 E.35576
G1 X108.435 Y137.821 E.01642
G1 X116.663 Y129.593 E.3579
G2 X116.725 Y130.064 I4.756 J-.388 E.01464
G1 X108.435 Y138.354 E.36061
G1 X108.435 Y138.888 E.01642
G1 X116.805 Y130.518 E.36409
G2 X116.898 Y130.959 I4.462 J-.712 E.01386
G1 X108.435 Y139.422 E.36814
G1 X108.435 Y139.956 E.01642
G1 X117.001 Y131.39 E.3726
G1 X117.118 Y131.807 E.01331
G1 X108.435 Y140.49 E.3777
G1 X108.435 Y141.023 E.01642
G1 X117.246 Y132.213 E.38326
G2 X117.381 Y132.612 I4.061 J-1.152 E.01296
G1 X108.435 Y141.557 E.38913
G1 X108.435 Y142.091 E.01642
G1 X117.532 Y132.995 E.39568
G2 X117.688 Y133.372 I3.854 J-1.383 E.01256
G1 X108.435 Y142.625 E.40251
G1 X108.435 Y143.159 E.01642
G1 X117.854 Y133.74 E.40973
G2 X118.032 Y134.096 I3.661 J-1.598 E.01225
G1 X108.435 Y143.693 E.41744
G1 X108.435 Y144.226 E.01642
G1 X118.214 Y134.448 E.42535
G1 X118.409 Y134.787 E.01202
G1 X108.435 Y144.76 E.43385
G1 X108.435 Y145.294 E.01642
G1 X118.609 Y135.12 E.44256
G1 X118.819 Y135.444 E.01188
G1 X108.266 Y145.998 E.45906
G1 X111.469 Y149.734 F30000
G1 F15000
G1 X115.228 Y145.975 E.16353
G1 X114.822 Y146.068 E.01281
G1 X114.596 Y146.073 E.00695
G1 X111.104 Y149.565 E.15187
G1 X110.571 Y149.565 E.01642
G1 X114.092 Y146.043 E.1532
G3 X113.662 Y145.94 I.072 J-1.254 E.0137
G1 X110.037 Y149.565 E.15768
G1 X109.503 Y149.565 E.01642
G1 X113.292 Y145.776 E.16481
G1 X112.959 Y145.575 E.01195
G1 X108.969 Y149.565 E.17357
G1 X108.435 Y149.565 E.01642
G1 X112.676 Y145.324 E.18445
G3 X112.432 Y145.034 I.595 J-.748 E.01173
G1 X108.435 Y149.031 E.17385
G1 X108.435 Y148.497 E.01642
G1 X112.224 Y144.708 E.1648
G1 X112.057 Y144.341 E.0124
G1 X108.435 Y147.963 E.15755
G1 X108.435 Y147.429 E.01642
G1 X111.949 Y143.916 E.15283
G1 X111.918 Y143.413 E.01549
G1 X108.435 Y146.896 E.15148
G1 X108.435 Y146.362 E.01642
G1 X112.025 Y142.772 E.15614
G1 X112.169 Y142.377 E.01293
G1 X112.437 Y141.937 E.01585
G1 X112.788 Y141.56 E.01585
G1 X113.206 Y141.259 E.01585
G1 X113.676 Y141.047 E.01585
G1 X113.772 Y141.025 E.00303
G1 X119.037 Y135.76 E.22902
G1 X119.26 Y136.071 E.01176
G1 X114.404 Y140.927 E.21123
G3 X114.907 Y140.957 I.176 J1.26 E.01561
G1 X119.495 Y136.37 E.19956
G2 X119.733 Y136.665 I3.08 J-2.238 E.01168
G1 X115.336 Y141.062 E.19126
G1 X115.714 Y141.219 E.01256
G1 X119.984 Y136.949 E.18574
G2 X120.238 Y137.228 I2.925 J-2.412 E.01163
G1 X116.038 Y141.428 E.1827
G3 X116.321 Y141.679 I-.479 J.825 E.01171
G1 X120.502 Y137.498 E.18187
G2 X120.773 Y137.761 I2.769 J-2.584 E.01162
G1 X116.569 Y141.964 E.18284
G1 X116.782 Y142.285 E.01185
G1 X121.05 Y138.018 E.18563
G2 X121.337 Y138.264 I2.612 J-2.755 E.01165
G1 X116.941 Y142.661 E.19124
G1 X116.973 Y142.737 E.00255
G1 X117.044 Y143.091 E.0111
G1 X121.627 Y138.508 E.19937
G1 X121.931 Y138.738 E.01172
G1 X117.082 Y143.587 E.21094
G1 X117.008 Y144.139 E.01712
G1 X116.975 Y144.228 E.00291
G1 X122.238 Y138.964 E.22894
G1 X122.556 Y139.181 E.01182
G1 X112.172 Y149.565 E.45169
G1 X112.706 Y149.565 E.01642
G1 X122.88 Y139.39 E.44259
G1 X123.212 Y139.593 E.01194
G1 X113.24 Y149.565 E.43378
G1 X113.774 Y149.565 E.01642
G1 X123.554 Y139.784 E.42546
G2 X123.901 Y139.971 I2.046 J-3.381 E.01213
G1 X114.307 Y149.565 E.41733
G1 X114.841 Y149.565 E.01642
G1 X124.262 Y140.144 E.40978
G2 X124.628 Y140.312 I1.859 J-3.589 E.0124
G1 X115.375 Y149.565 E.40251
G1 X115.909 Y149.565 E.01642
G1 X125.004 Y140.47 E.39562
G2 X125.391 Y140.616 I1.658 J-3.81 E.01275
G1 X116.443 Y149.565 E.38926
G1 X116.976 Y149.565 E.01642
G1 X125.785 Y140.756 E.38318
G1 X126.193 Y140.882 E.01313
G1 X117.51 Y149.565 E.37771
G1 X118.044 Y149.565 E.01642
G1 X126.611 Y140.997 E.37268
G2 X127.038 Y141.104 I1.287 J-4.22 E.01354
G1 X118.578 Y149.565 E.36802
G1 X119.112 Y149.565 E.01642
G1 X127.482 Y141.194 E.36411
G2 X127.938 Y141.272 I1.011 J-4.526 E.01423
G1 X119.646 Y149.565 E.36071
G1 X120.179 Y149.565 E.01642
G1 X128.405 Y141.339 E.35782
G1 X128.89 Y141.387 E.015
G1 X120.713 Y149.565 E.3557
G1 X121.247 Y149.565 E.01642
G1 X129.394 Y141.418 E.35438
G2 X129.914 Y141.431 I.396 J-5.204 E.01602
G1 X121.781 Y149.565 E.35379
G1 X122.315 Y149.565 E.01642
G1 X130.454 Y141.426 E.35405
G2 X131.016 Y141.397 I-.006 J-5.646 E.01733
G1 X122.848 Y149.565 E.3553
G1 X123.382 Y149.565 E.01642
G1 X131.609 Y141.337 E.35788
G2 X132.234 Y141.246 I-.6 J-6.307 E.01943
G1 X123.916 Y149.565 E.36184
G1 X124.45 Y149.565 E.01642
G1 X132.897 Y141.118 E.36745
G2 X133.607 Y140.942 I-1.407 J-7.197 E.0225
G1 X124.984 Y149.565 E.3751
G1 X125.518 Y149.565 E.01642
G1 X134.385 Y140.698 E.38571
G2 X135.255 Y140.361 I-2.939 J-8.891 E.02873
G1 X126.051 Y149.565 E.40037
G1 X126.585 Y149.565 E.01642
G1 X136.271 Y139.879 E.42132
G2 X137.629 Y139.055 I-6.473 J-12.198 E.04888
G1 X127.119 Y149.565 E.45717
G1 X127.653 Y149.565 E.01642
G1 X151.565 Y125.653 E1.04015
G1 X151.565 Y126.187 E.01642
G1 X128.187 Y149.565 E1.01693
G1 X128.72 Y149.565 E.01642
G1 X151.565 Y126.72 E.99371
G1 X151.565 Y127.254 E.01642
G1 X129.254 Y149.565 E.97049
G1 X129.788 Y149.565 E.01642
G1 X151.565 Y127.788 E.94727
G1 X151.565 Y128.322 E.01642
G1 X130.322 Y149.565 E.92405
G1 X130.856 Y149.565 E.01642
G1 X151.565 Y128.856 E.90083
G1 X151.565 Y129.39 E.01642
G1 X131.39 Y149.565 E.87761
G1 X131.923 Y149.565 E.01642
G1 X151.565 Y129.923 E.85439
M73 P89 R1
G1 X151.565 Y130.457 E.01642
G1 X132.457 Y149.565 E.83117
G1 X132.991 Y149.565 E.01642
G1 X151.565 Y130.991 E.80794
G1 X151.565 Y131.525 E.01642
G1 X133.525 Y149.565 E.78472
G1 X134.059 Y149.565 E.01642
G1 X151.565 Y132.059 E.7615
G1 X151.565 Y132.593 E.01642
G1 X134.592 Y149.565 E.73828
G1 X135.126 Y149.565 E.01642
G1 X151.565 Y133.126 E.71506
G1 X151.565 Y133.66 E.01642
G1 X135.49 Y149.734 E.69922
; WIPE_START
G1 F24000
G1 X136.905 Y148.32 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.163 J-.358 P1  F30000
G1 X123.976 Y106.266 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X116.953 Y113.288 E.30547
G1 X117.008 Y113.139 E.00489
G1 X117.083 Y112.625 E.01598
G1 X123.272 Y106.435 E.26923
G1 X122.738 Y106.435 E.01642
G1 X117.051 Y112.123 E.24741
G1 X116.952 Y111.688 E.01372
G1 X122.205 Y106.435 E.22848
G1 X121.671 Y106.435 E.01642
G1 X116.794 Y111.312 E.21215
G1 X116.585 Y110.987 E.01188
G1 X121.137 Y106.435 E.198
G1 X120.603 Y106.435 E.01642
G1 X116.34 Y110.698 E.18543
G1 X116.061 Y110.443 E.01162
G1 X120.069 Y106.435 E.17434
G1 X119.535 Y106.435 E.01642
G1 X115.737 Y110.234 E.16523
G1 X115.364 Y110.073 E.0125
G1 X119.002 Y106.435 E.15824
G1 X118.468 Y106.435 E.01642
G1 X114.94 Y109.963 E.15345
G2 X114.444 Y109.926 I-.34 J1.209 E.01542
G1 X117.934 Y106.435 E.15183
G1 X117.4 Y106.435 E.01642
G1 X113.822 Y110.014 E.15566
G1 X113.676 Y110.047 E.0046
G1 X113.206 Y110.259 E.01585
G1 X112.788 Y110.56 E.01585
G1 X112.437 Y110.937 E.01585
G1 X112.169 Y111.377 E.01585
G1 X112.003 Y111.833 E.01491
G1 X108.435 Y115.4 E.15518
G1 X108.435 Y115.934 E.01642
G1 X111.919 Y112.45 E.15155
G1 X111.957 Y112.946 E.01532
G1 X108.435 Y116.468 E.15317
G1 X108.435 Y117.002 E.01642
G1 X112.065 Y113.372 E.15789
G1 X112.236 Y113.734 E.01233
G1 X108.435 Y117.535 E.16535
G1 X108.435 Y118.069 E.01642
G1 X112.448 Y114.056 E.17457
G2 X112.696 Y114.342 I.834 J-.471 E.01172
G1 X108.435 Y118.603 E.18534
G1 X108.435 Y119.137 E.01642
G1 X112.979 Y114.593 E.19767
G1 X113.31 Y114.796 E.01194
G1 X108.435 Y119.671 E.21204
G1 X108.435 Y120.204 E.01642
G1 X113.691 Y114.949 E.22863
G1 X113.799 Y114.991 E.00357
G1 X114.125 Y115.049 E.01018
G1 X108.435 Y120.738 E.2475
G1 X108.435 Y121.272 E.01642
G1 X114.635 Y115.072 E.26969
G1 X114.822 Y115.068 E.00574
G1 X115.278 Y114.964 E.01438
G1 X108.435 Y121.806 E.29764
G1 X108.435 Y122.34 E.01642
G1 X124.34 Y106.435 E.69184
G1 X124.874 Y106.435 E.01642
G1 X108.435 Y122.874 E.71506
G1 X108.435 Y123.407 E.01642
G1 X125.407 Y106.435 E.73828
G1 X125.941 Y106.435 E.01642
G1 X108.435 Y123.941 E.7615
G1 X108.435 Y124.475 E.01642
G1 X126.475 Y106.435 E.78472
G1 X127.009 Y106.435 E.01642
G1 X108.435 Y125.009 E.80794
G1 X108.435 Y125.543 E.01642
G1 X127.543 Y106.435 E.83116
G1 X128.077 Y106.435 E.01642
G1 X108.435 Y126.077 E.85438
G1 X108.435 Y126.61 E.01642
G1 X128.61 Y106.435 E.8776
G1 X129.144 Y106.435 E.01642
G1 X108.435 Y127.144 E.90083
G1 X108.435 Y127.678 E.01642
G1 X129.678 Y106.435 E.92405
G1 X130.212 Y106.435 E.01642
G1 X108.435 Y128.212 E.94727
G1 X108.435 Y128.746 E.01642
G1 X130.746 Y106.435 E.97049
G1 X131.279 Y106.435 E.01642
G1 X108.435 Y129.279 E.99371
G1 X108.435 Y129.813 E.01642
G1 X131.813 Y106.435 E1.01693
G1 X132.347 Y106.435 E.01642
G1 X108.266 Y130.517 E1.04753
G1 X108.266 Y115.036 F30000
G1 F15000
G1 X116.866 Y106.435 E.37412
G1 X116.332 Y106.435 E.01642
G1 X108.435 Y114.332 E.34352
G1 X108.435 Y113.799 E.01642
G1 X115.799 Y106.435 E.3203
G1 X115.265 Y106.435 E.01642
G1 X108.435 Y113.265 E.29708
G1 X108.435 Y112.731 E.01642
G1 X114.731 Y106.435 E.27386
G1 X114.197 Y106.435 E.01642
G1 X108.435 Y112.197 E.25064
G1 X108.435 Y111.663 E.01642
G1 X113.663 Y106.435 E.22742
G1 X113.13 Y106.435 E.01642
G1 X108.435 Y111.13 E.2042
G1 X108.435 Y110.596 E.01642
G1 X112.596 Y106.435 E.18098
G1 X112.062 Y106.435 E.01642
G1 X108.435 Y110.062 E.15775
G1 X108.435 Y109.528 E.01642
G1 X111.528 Y106.435 E.13453
G1 X110.994 Y106.435 E.01642
G1 X108.435 Y108.994 E.11131
G1 X108.435 Y108.46 E.01642
G1 X110.46 Y106.435 E.08809
G1 X109.927 Y106.435 E.01642
G1 X108.435 Y107.927 E.06487
G1 X108.435 Y107.393 E.01642
G1 X109.393 Y106.435 E.04165
G1 X108.859 Y106.435 E.01642
G1 X108.266 Y107.029 E.02581
M106 S224.4
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.859 Y106.435 E-.31886
G1 X109.393 Y106.435 E-.20285
G1 X108.949 Y106.879 E-.23829
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
G3 Z3.2 I-.487 J1.115 P1  F30000
G1 X128.419 Y115.389 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.42 Y115.389 E.00001
G3 X129.683 Y115.294 I1.58 J12.609 E.03895
G1 X130.317 Y115.294 E.01947
G3 X127.793 Y115.483 I-.317 J12.704 E2.37558
G1 X128.36 Y115.398 E.01762
M204 S10000
; WIPE_START
M73 P90 R1
G1 F24000
G1 X128.42 Y115.389 E-.02297
G1 X129.05 Y115.325 E-.24082
G1 X129.683 Y115.294 E-.24082
G1 X130.317 Y115.294 E-.24082
G1 X130.355 Y115.296 E-.01456
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.072 J-1.215 P1  F30000
G1 X114.548 Y114.359 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X114.546 Y114.357 E.00008
G3 X114.269 Y110.654 I-.046 J-1.859 E.17377
G1 X114.454 Y110.64 E.0057
G3 X114.913 Y114.311 I.046 J1.859 E.16807
G1 X114.607 Y114.352 E.00949
M204 S10000
; WIPE_START
G1 F24000
G1 X114.546 Y114.357 E-.0233
G1 X114.361 Y114.355 E-.07044
G1 X113.996 Y114.291 E-.14077
G1 X113.651 Y114.155 E-.14077
G1 X113.34 Y113.954 E-.14076
G1 X113.075 Y113.696 E-.14077
G1 X112.922 Y113.471 E-.10319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J.018 P1  F30000
G1 X113.383 Y144.982 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X113.341 Y144.953 E.00155
G3 X114.269 Y141.654 I1.159 J-1.454 E.13391
G1 X114.454 Y141.64 E.0057
G3 X113.652 Y145.153 I.046 J1.859 E.20793
G1 X113.433 Y145.014 E.00797
M204 S10000
; WIPE_START
G1 F24000
G1 X113.341 Y144.953 E-.04202
G1 X113.075 Y144.696 E-.1407
G1 X112.866 Y144.39 E-.14077
G1 X112.722 Y144.048 E-.14077
G1 X112.649 Y143.685 E-.14075
G1 X112.642 Y143.405 E-.1066
G1 X112.661 Y143.279 E-.0484
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.045 J1.216 P1  F30000
G1 X144.261 Y142.114 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X144.269 Y142.105 E.00036
G3 X145.269 Y141.654 I1.231 J1.393 E.0342
G1 X145.454 Y141.64 E.0057
G3 X144.017 Y142.377 I.046 J1.859 E.30762
G1 X144.22 Y142.158 E.00917
M204 S10000
; WIPE_START
G1 F24000
G1 X144.269 Y142.105 E-.02728
G1 X144.57 Y141.889 E-.14076
G1 X144.908 Y141.737 E-.14077
G1 X145.269 Y141.654 E-.14076
G1 X145.454 Y141.64 E-.07048
G1 X145.639 Y141.645 E-.07047
G1 X146.004 Y141.709 E-.14077
G1 X146.074 Y141.737 E-.0287
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.214 J-.091 P1  F30000
G1 X143.82 Y111.704 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X143.824 Y111.693 E.00036
G3 X145.269 Y110.654 I1.675 J.806 E.057
G1 X145.454 Y110.64 E.0057
G3 X143.698 Y112.041 I.046 J1.859 E.28483
G1 X143.8 Y111.76 E.00918
M204 S10000
; WIPE_START
G1 F24000
G1 X143.824 Y111.693 E-.02719
G1 X144.017 Y111.377 E-.14075
G1 X144.269 Y111.105 E-.14077
G1 X144.57 Y110.889 E-.14078
G1 X144.908 Y110.737 E-.14077
G1 X145.269 Y110.654 E-.14076
G1 X145.345 Y110.648 E-.02899
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.199 J.21 P1  F30000
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
G3 Z3.4 I1.217 J.03 P1  F30000
G1 X151.379 Y105.917 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X152.083 Y106.621 E.03058
G1 X152.083 Y107.154
G1 X150.846 Y105.917 E.05376
G1 X150.312 Y105.917
G1 X152.083 Y107.688 E.07693
G1 X152.083 Y108.221
G1 X149.779 Y105.917 E.1001
G1 X149.246 Y105.917
G1 X152.083 Y108.754 E.12327
G1 X152.083 Y109.288
G1 X148.712 Y105.917 E.14645
G1 X148.179 Y105.917
G1 X152.083 Y109.821 E.16962
G1 X152.083 Y110.354
G1 X147.646 Y105.917 E.19279
G1 X147.113 Y105.917
G1 X152.083 Y110.887 E.21597
G1 X152.083 Y111.421
G1 X146.579 Y105.917 E.23914
G1 X146.046 Y105.917
G1 X152.083 Y111.954 E.26231
G1 X152.083 Y112.487
G1 X145.513 Y105.917 E.28549
G1 X144.98 Y105.917
G1 X152.083 Y113.02 E.30866
G1 X152.083 Y113.554
G1 X144.446 Y105.917 E.33183
G1 X143.913 Y105.917
G1 X152.083 Y114.087 E.35501
G1 X152.083 Y114.62
G1 X143.38 Y105.917 E.37818
G1 X142.847 Y105.917
G1 X152.083 Y115.153 E.40135
G1 X152.083 Y115.687
G1 X142.313 Y105.917 E.42453
G1 X141.78 Y105.917
G1 X146.664 Y110.801 E.21223
G1 X145.79 Y110.461
G1 X141.247 Y105.917 E.19744
G1 X140.713 Y105.917
G1 X145.243 Y110.447 E.19685
G1 X144.814 Y110.551
G1 X140.18 Y105.917 E.20136
G1 X139.647 Y105.917
G1 X144.45 Y110.72 E.2087
G1 X144.139 Y110.943
G1 X139.114 Y105.917 E.21839
G1 X138.58 Y105.917
G1 X143.881 Y111.218 E.23035
G1 X143.673 Y111.543
G1 X138.047 Y105.917 E.24445
G1 X137.514 Y105.917
G1 X143.519 Y111.923 E.26097
G1 X143.437 Y112.374
G1 X136.981 Y105.917 E.28057
G1 X136.447 Y105.917
G1 X143.494 Y112.964 E.3062
M204 S10000
; WIPE_START
G1 F24000
G1 X142.08 Y111.55 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.051 J1.216 P1  F30000
G1 X147.196 Y111.333 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X152.083 Y116.22 E.21236
G1 X152.083 Y116.753
G1 X147.542 Y112.213 E.19731
G1 X147.544 Y112.748
G1 X152.083 Y117.287 E.19721
G1 X152.083 Y117.82
G1 X147.443 Y113.18 E.20162
G1 X147.274 Y113.545
G1 X152.083 Y118.353 E.20896
G1 X152.083 Y118.886
G1 X147.051 Y113.855 E.21865
G1 X146.779 Y114.116
G1 X152.083 Y119.42 E.23048
G1 X152.083 Y119.953
G1 X146.456 Y114.327 E.24449
G1 X146.076 Y114.48
G1 X152.083 Y120.486 E.26101
G1 X152.083 Y121.019
G1 X145.619 Y114.556 E.28086
G1 X145.039 Y114.509
G1 X152.083 Y121.553 E.30609
G1 X152.083 Y122.086
G1 X135.914 Y105.917 E.7026
M73 P91 R1
G1 X135.381 Y105.917
G1 X152.083 Y122.619 E.72578
G1 X152.083 Y123.153
G1 X134.847 Y105.917 E.74895
G1 X134.314 Y105.917
G1 X152.083 Y123.686 E.77212
G1 X152.083 Y124.219
G1 X133.781 Y105.917 E.7953
G1 X133.248 Y105.917
G1 X152.083 Y124.752 E.81847
G1 X152.083 Y125.286
G1 X132.714 Y105.917 E.84164
G1 X132.181 Y105.917
G1 X152.083 Y125.819 E.86482
G1 X152.083 Y126.352
G1 X131.648 Y105.917 E.88799
G1 X131.115 Y105.917
G1 X152.083 Y126.885 E.91116
G1 X152.083 Y127.419
G1 X130.581 Y105.917 E.93434
G1 X130.048 Y105.917
G1 X152.083 Y127.952 E.95751
G1 X152.083 Y128.485
G1 X129.515 Y105.917 E.98068
G1 X128.981 Y105.917
G1 X152.083 Y129.019 E1.00386
G1 X152.083 Y129.552
G1 X128.448 Y105.917 E1.02703
G1 X127.915 Y105.917
G1 X152.083 Y130.085 E1.0502
G1 X152.083 Y130.618
G1 X127.382 Y105.917 E1.07337
G1 X126.848 Y105.917
G1 X152.083 Y131.152 E1.09655
G1 X152.083 Y131.685
G1 X126.315 Y105.917 E1.11972
G1 X125.782 Y105.917
G1 X137.024 Y117.16 E.48854
M204 S10000
; WIPE_START
G1 F24000
G1 X135.61 Y115.746 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.182 J.29 P1  F30000
G1 X135.783 Y116.452 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X125.249 Y105.917 E.45779
G1 X124.715 Y105.917
G1 X134.813 Y116.015 E.43878
G1 X133.978 Y115.713
G1 X124.182 Y105.917 E.42567
G1 X123.649 Y105.917
G1 X133.228 Y115.496 E.41625
G1 X132.536 Y115.338
G1 X123.116 Y105.917 E.40937
G1 X122.582 Y105.917
G1 X131.89 Y115.226 E.40449
G1 X131.282 Y115.15
G1 X122.049 Y105.917 E.40121
G1 X121.516 Y105.917
G1 X130.704 Y115.106 E.39927
G1 X130.152 Y115.086
G1 X120.982 Y105.917 E.39844
G1 X120.449 Y105.917
G1 X129.621 Y115.089 E.39857
G1 X129.113 Y115.115
G1 X119.916 Y105.917 E.39967
G1 X119.383 Y105.917
G1 X128.625 Y115.16 E.40162
G1 X128.151 Y115.219
G1 X118.849 Y105.917 E.40421
G1 X118.316 Y105.917
G1 X127.691 Y115.292 E.40738
G1 X127.247 Y115.382
G1 X117.783 Y105.917 E.41127
G1 X117.25 Y105.917
G1 X126.817 Y115.485 E.41575
G1 X126.397 Y115.598
G1 X116.716 Y105.917 E.42065
G1 X116.183 Y105.917
G1 X125.989 Y115.723 E.42612
G1 X125.594 Y115.861
G1 X115.65 Y105.917 E.43212
G1 X115.116 Y105.917
G1 X125.206 Y116.007 E.43844
G1 X124.831 Y116.165
M73 P92 R1
G1 X114.583 Y105.917 E.44531
G1 X114.05 Y105.917
G1 X124.465 Y116.333 E.45259
G1 X124.105 Y116.506
G1 X113.517 Y105.917 E.46012
G1 X112.983 Y105.917
G1 X123.76 Y116.694 E.46829
G1 X123.42 Y116.887
G1 X112.45 Y105.917 E.47669
G1 X111.917 Y105.917
G1 X123.089 Y117.089 E.48548
G1 X122.768 Y117.302
G1 X111.384 Y105.917 E.4947
G1 X110.85 Y105.917
G1 X122.451 Y117.518 E.50411
G1 X122.148 Y117.748
G1 X116.524 Y112.124 E.24437
G1 X116.554 Y112.687
G1 X121.849 Y117.982 E.2301
G1 X121.559 Y118.226
G1 X116.462 Y113.129 E.22149
G1 X116.301 Y113.501
G1 X121.278 Y118.478 E.21627
G1 X121.001 Y118.735
G1 X116.085 Y113.818 E.21365
G1 X115.82 Y114.086
G1 X120.736 Y119.003 E.21365
G1 X120.476 Y119.276
G1 X115.505 Y114.305 E.21602
G1 X115.134 Y114.467
G1 X120.226 Y119.559 E.22129
M73 P92 R0
G1 X119.983 Y119.849
G1 X114.688 Y114.554 E.23009
G1 X114.124 Y114.524
G1 X119.746 Y120.146 E.24431
M204 S10000
; WIPE_START
G1 F24000
G1 X118.332 Y118.732 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.123 J-.47 P1  F30000
G1 X114.876 Y110.476 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X110.317 Y105.917 E.1981
G1 X109.784 Y105.917
G1 X114.312 Y110.446 E.19677
G1 X113.866 Y110.533
G1 X109.25 Y105.917 E.20058
G1 X108.717 Y105.917
G1 X113.495 Y110.695 E.20762
G1 X113.18 Y110.914
G1 X108.184 Y105.917 E.21711
G1 X107.917 Y106.184
G1 X112.915 Y111.182 E.21717
G1 X112.699 Y111.499
G1 X107.917 Y106.717 E.20779
G1 X107.917 Y107.251
G1 X112.538 Y111.871 E.2008
G1 X112.446 Y112.313
G1 X107.917 Y107.784 E.19681
G1 X107.917 Y108.317
G1 X112.476 Y112.876 E.19809
M204 S10000
; WIPE_START
G1 F24000
G1 X111.062 Y111.461 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.777 J-.936 P1  F30000
G1 X107.917 Y108.85 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X119.521 Y120.454 E.50422
G1 X119.3 Y120.766
G1 X107.917 Y109.384 E.49461
G1 X107.917 Y109.917
G1 X119.09 Y121.09 E.48552
G1 X118.888 Y121.42
G1 X107.917 Y110.45 E.4767
G1 X107.917 Y110.984
G1 X118.692 Y121.758 E.46822
G1 X118.509 Y122.108
G1 X107.917 Y111.517 E.46025
G1 X107.917 Y112.05
G1 X118.331 Y122.464 E.45252
G1 X118.165 Y122.831
G1 X107.917 Y112.583 E.44531
G1 X107.917 Y113.117
G1 X118.008 Y123.208 E.4385
G1 X117.858 Y123.591
G1 X107.917 Y113.65 E.43199
G1 X107.917 Y114.183
G1 X117.724 Y123.99 E.42616
G1 X117.599 Y124.398
G1 X107.917 Y114.716 E.4207
G1 X107.917 Y115.25
G1 X117.482 Y124.814 E.41561
G1 X117.383 Y125.248
G1 X107.917 Y115.783 E.41131
G1 X107.917 Y116.316
G1 X117.294 Y125.693 E.40746
G1 X117.217 Y126.149
G1 X107.917 Y116.85 E.40413
M73 P93 R0
G1 X107.917 Y117.383
G1 X117.158 Y126.623 E.40155
G1 X117.117 Y127.115
G1 X107.917 Y117.916 E.39975
G1 X107.917 Y118.449
G1 X117.092 Y127.624 E.39868
G1 X117.086 Y128.151
G1 X107.917 Y118.983 E.39843
G1 X107.917 Y119.516
G1 X117.103 Y128.701 E.39915
G1 X117.146 Y129.278
G1 X107.917 Y120.049 E.40103
G1 X107.917 Y120.582
G1 X117.222 Y129.887 E.40433
G1 X117.334 Y130.532
G1 X107.917 Y121.116 E.40919
G1 X107.917 Y121.649
G1 X117.492 Y131.224 E.41607
G1 X117.714 Y131.979
G1 X107.917 Y122.182 E.42571
G1 X107.917 Y122.715
G1 X118.018 Y132.816 E.4389
G1 X118.455 Y133.786
G1 X107.917 Y123.249 E.4579
G1 X107.917 Y123.782
G1 X119.172 Y135.037 E.48907
M204 S10000
; WIPE_START
G1 F24000
G1 X117.758 Y133.622 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.585 J1.067 P1  F30000
G1 X140.828 Y120.964 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X152.083 Y132.218 E.48905
G1 X152.083 Y132.751
G1 X141.545 Y122.214 E.45789
G1 X141.983 Y123.185
G1 X152.083 Y133.285 E.4389
G1 X152.083 Y133.818
G1 X142.286 Y124.022 E.4257
G1 X142.508 Y124.777
G1 X152.083 Y134.351 E.41606
G1 X152.083 Y134.884
G1 X142.666 Y125.468 E.40918
G1 X142.778 Y126.113
G1 X152.083 Y135.418 E.40433
G1 X152.083 Y135.951
G1 X142.854 Y126.722 E.40103
G1 X142.897 Y127.299
G1 X152.083 Y136.484 E.39915
G1 X152.083 Y137.018
G1 X142.914 Y127.849 E.39843
G1 X142.908 Y128.376
G1 X152.083 Y137.551 E.39868
G1 X152.083 Y138.084
G1 X142.883 Y128.885 E.39975
G1 X142.842 Y129.377
G1 X152.083 Y138.617 E.40155
G1 X152.083 Y139.151
G1 X142.783 Y129.851 E.40413
G1 X142.706 Y130.307
G1 X152.083 Y139.684 E.40746
G1 X152.083 Y140.217
G1 X142.617 Y130.752 E.41131
G1 X142.518 Y131.186
G1 X152.083 Y140.75 E.41561
G1 X152.083 Y141.284
G1 X142.401 Y131.602 E.4207
G1 X142.276 Y132.01
G1 X152.083 Y141.817 E.42616
G1 X152.083 Y142.35
G1 X142.141 Y132.409 E.43199
G1 X141.992 Y132.792
G1 X152.083 Y142.884 E.43851
G1 X152.083 Y143.417
G1 X141.835 Y133.169 E.44531
G1 X141.669 Y133.537
G1 X152.083 Y143.95 E.45252
G1 X152.083 Y144.483
G1 X141.491 Y133.892 E.46025
G1 X141.308 Y134.242
G1 X152.083 Y145.017 E.46823
G1 X152.083 Y145.55
G1 X141.112 Y134.58 E.47671
G1 X140.91 Y134.91
G1 X152.083 Y146.083 E.48552
G1 X152.083 Y146.616
G1 X140.7 Y135.234 E.49461
G1 X140.479 Y135.546
G1 X152.083 Y147.15 E.50423
G1 X152.083 Y147.683
G1 X147.524 Y143.124 E.19809
G1 X147.554 Y143.687
G1 X152.083 Y148.216 E.19681
G1 X152.083 Y148.75
G1 X147.462 Y144.129 E.2008
G1 X147.301 Y144.501
G1 X152.083 Y149.283 E.2078
M73 P94 R0
G1 X152.083 Y149.816
G1 X147.085 Y144.818 E.21718
G1 X146.82 Y145.086
G1 X151.816 Y150.083 E.21711
G1 X151.283 Y150.083
G1 X146.505 Y145.305 E.20762
G1 X146.134 Y145.467
G1 X150.749 Y150.083 E.20058
G1 X150.216 Y150.083
G1 X145.688 Y145.554 E.19677
G1 X145.124 Y145.524
G1 X149.683 Y150.083 E.1981
M204 S10000
; WIPE_START
G1 F24000
G1 X148.269 Y148.668 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.155 J-.384 P1  F30000
G1 X145.876 Y141.476 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X140.254 Y135.854 E.24431
G1 X140.017 Y136.151
G1 X145.312 Y141.446 E.23009
G1 X144.866 Y141.533
G1 X139.774 Y136.441 E.22129
G1 X139.524 Y136.724
G1 X144.495 Y141.695 E.21602
G1 X144.18 Y141.914
G1 X139.264 Y136.997 E.21365
G1 X138.999 Y137.266
G1 X143.915 Y142.182 E.21362
G1 X143.699 Y142.499
G1 X138.723 Y137.523 E.21626
G1 X138.441 Y137.774
G1 X143.538 Y142.871 E.22149
G1 X143.446 Y143.313
G1 X138.151 Y138.018 E.2301
G1 X137.852 Y138.252
G1 X143.476 Y143.876 E.24437
M204 S10000
; WIPE_START
G1 F24000
G1 X142.062 Y142.461 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.805 J-.913 P1  F30000
G1 X137.549 Y138.482 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X149.15 Y150.083 E.50411
G1 X148.616 Y150.083
G1 X137.232 Y138.698 E.4947
G1 X136.911 Y138.911
G1 X148.083 Y150.083 E.48548
G1 X147.55 Y150.083
G1 X136.58 Y139.113 E.47669
G1 X136.24 Y139.306
G1 X147.016 Y150.083 E.46829
G1 X146.483 Y150.083
G1 X135.895 Y139.494 E.46012
G1 X135.535 Y139.667
G1 X145.95 Y150.083 E.45259
G1 X145.417 Y150.083
G1 X135.169 Y139.835 E.44531
G1 X134.794 Y139.993
G1 X144.883 Y150.083 E.43844
G1 X144.35 Y150.083
G1 X134.406 Y140.139 E.43212
G1 X134.011 Y140.277
G1 X143.817 Y150.083 E.42611
G1 X143.284 Y150.083
G1 X133.603 Y140.402 E.42065
G1 X133.183 Y140.515
G1 X142.75 Y150.083 E.41575
G1 X142.217 Y150.083
G1 X132.753 Y140.618 E.41127
G1 X132.309 Y140.708
G1 X141.684 Y150.083 E.40737
G1 X141.15 Y150.083
G1 X131.849 Y140.781 E.40421
G1 X131.375 Y140.84
G1 X140.617 Y150.083 E.40162
G1 X140.084 Y150.083
G1 X130.887 Y140.885 E.39967
G1 X130.379 Y140.911
G1 X139.551 Y150.083 E.39856
G1 X139.017 Y150.083
G1 X129.848 Y140.914 E.39844
G1 X129.296 Y140.894
G1 X138.484 Y150.083 E.39927
G1 X137.951 Y150.083
G1 X128.718 Y140.85 E.40121
G1 X128.109 Y140.774
G1 X137.418 Y150.083 E.40449
G1 X136.884 Y150.083
G1 X127.464 Y140.662 E.40937
G1 X126.772 Y140.504
G1 X136.351 Y150.083 E.41625
G1 X135.818 Y150.083
G1 X126.022 Y140.287 E.42567
G1 X125.187 Y139.985
G1 X135.285 Y150.083 E.43879
G1 X134.751 Y150.083
G1 X124.216 Y139.548 E.4578
M204 S10000
; WIPE_START
G1 F24000
G1 X125.63 Y140.962 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.76 J-.951 P1  F30000
M73 P95 R0
G1 X122.975 Y138.84 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X134.218 Y150.083 E.48855
G1 X133.685 Y150.083
G1 X107.917 Y124.315 E1.11971
G1 X107.917 Y124.849
G1 X133.151 Y150.083 E1.09654
G1 X132.618 Y150.083
G1 X107.917 Y125.382 E1.07337
G1 X107.917 Y125.915
G1 X132.085 Y150.083 E1.0502
G1 X131.552 Y150.083
G1 X107.917 Y126.448 E1.02702
G1 X107.917 Y126.982
G1 X131.018 Y150.083 E1.00385
G1 X130.485 Y150.083
G1 X107.917 Y127.515 E.98068
G1 X107.917 Y128.048
G1 X129.952 Y150.083 E.9575
G1 X129.419 Y150.083
G1 X107.917 Y128.581 E.93433
G1 X107.917 Y129.115
G1 X128.885 Y150.083 E.91116
G1 X128.352 Y150.083
G1 X107.917 Y129.648 E.88798
G1 X107.917 Y130.181
G1 X127.819 Y150.083 E.86481
G1 X127.285 Y150.083
G1 X107.917 Y130.715 E.84164
G1 X107.917 Y131.248
G1 X126.752 Y150.083 E.81846
G1 X126.219 Y150.083
G1 X107.917 Y131.781 E.79529
G1 X107.917 Y132.314
G1 X125.686 Y150.083 E.77212
G1 X125.152 Y150.083
G1 X107.917 Y132.848 E.74894
G1 X107.917 Y133.381
G1 X124.619 Y150.083 E.72577
G1 X124.086 Y150.083
G1 X107.917 Y133.914 E.7026
G1 X107.917 Y134.447
G1 X114.961 Y141.491 E.30608
G1 X114.381 Y141.444
G1 X107.917 Y134.981 E.28086
G1 X107.917 Y135.514
G1 X113.924 Y141.52 E.261
G1 X113.543 Y141.673
G1 X107.917 Y136.047 E.24448
G1 X107.917 Y136.581
G1 X113.221 Y141.884 E.23047
G1 X112.949 Y142.145
G1 X107.917 Y137.114 E.21865
G1 X107.917 Y137.647
G1 X112.726 Y142.456 E.20895
G1 X112.557 Y142.82
G1 X107.917 Y138.18 E.20161
G1 X107.917 Y138.714
G1 X112.456 Y143.252 E.19721
G1 X112.458 Y143.788
G1 X107.917 Y139.247 E.19731
G1 X107.917 Y139.78
G1 X112.805 Y144.667 E.21237
M204 S10000
; WIPE_START
G1 F24000
G1 X111.39 Y143.253 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.051 J1.216 P1  F30000
G1 X116.506 Y143.036 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X123.553 Y150.083 E.30619
G1 X123.019 Y150.083
G1 X116.563 Y143.626 E.28057
G1 X116.48 Y144.077
G1 X122.486 Y150.083 E.26097
G1 X121.953 Y150.083
M73 P96 R0
G1 X116.327 Y144.457 E.24445
G1 X116.119 Y144.782
G1 X121.42 Y150.083 E.23035
G1 X120.886 Y150.083
G1 X115.861 Y145.057 E.21839
G1 X115.55 Y145.28
G1 X120.353 Y150.083 E.2087
G1 X119.82 Y150.083
G1 X115.186 Y145.449 E.20136
G1 X114.756 Y145.553
G1 X119.286 Y150.083 E.19685
G1 X118.753 Y150.083
G1 X114.209 Y145.539 E.19744
G1 X113.336 Y145.198
G1 X118.22 Y150.083 E.21224
G1 X117.687 Y150.083
G1 X107.917 Y140.313 E.42452
G1 X107.917 Y140.847
G1 X117.153 Y150.083 E.40135
G1 X116.62 Y150.083
G1 X107.917 Y141.38 E.37817
G1 X107.917 Y141.913
G1 X116.087 Y150.083 E.355
G1 X115.554 Y150.083
G1 X107.917 Y142.446 E.33183
G1 X107.917 Y142.98
G1 X115.02 Y150.083 E.30865
G1 X114.487 Y150.083
G1 X107.917 Y143.513 E.28548
G1 X107.917 Y144.046
G1 X113.954 Y150.083 E.26231
G1 X113.42 Y150.083
G1 X107.917 Y144.58 E.23913
G1 X107.917 Y145.113
G1 X112.887 Y150.083 E.21596
G1 X112.354 Y150.083
G1 X107.917 Y145.646 E.19279
G1 X107.917 Y146.179
G1 X111.821 Y150.083 E.16961
G1 X111.287 Y150.083
G1 X107.917 Y146.713 E.14644
G1 X107.917 Y147.246
G1 X110.754 Y150.083 E.12327
G1 X110.221 Y150.083
G1 X107.917 Y147.779 E.1001
G1 X107.917 Y148.312
G1 X109.688 Y150.083 E.07692
G1 X109.154 Y150.083
G1 X107.917 Y148.846 E.05375
G1 X107.917 Y149.379
G1 X108.621 Y150.083 E.03058
M204 S10000
; WIPE_START
G1 F24000
G1 X107.917 Y149.379 E-.37813
G1 X107.917 Y148.846 E-.20264
G1 X108.251 Y149.179 E-.17923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.749 J.959 P1  F30000
G1 X113.275 Y145.259 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.220435
G1 F15000
G3 X112.744 Y144.728 I1.915 J-2.444 E.01089
; WIPE_START
G1 F24000
G1 X112.87 Y144.879 E-.19875
G1 X113.275 Y145.259 E-.56125
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.694 J1 P1  F30000
G1 X116.572 Y142.971 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.188798
G1 F15000
G1 X116.517 Y142.871 E.00135
; LINE_WIDTH: 0.170469
G1 X116.451 Y142.773 E.00123
; LINE_WIDTH: 0.129319
G1 X116.385 Y142.674 E.00083
; WIPE_START
G1 F24000
G1 X116.451 Y142.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.157 J1.207 P1  F30000
G1 X132.284 Y140.71 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0973743
G1 F15000
G1 X132.127 Y140.793 E.00079
; WIPE_START
G1 F24000
G1 X132.284 Y140.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.117 J-1.211 P1  F30000
G1 X130.397 Y140.893 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.102377
G1 F15000
G1 X130.185 Y140.984 E.00112
; WIPE_START
G1 F24000
G1 X130.397 Y140.893 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.106 J-1.212 P1  F30000
G1 X126.705 Y140.57 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.109741
G1 F15000
G3 X126.44 Y140.414 I6.025 J-10.532 E.00168
; WIPE_START
G1 F24000
G1 X126.705 Y140.57 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.382 J-1.155 P1  F30000
G1 X125.125 Y140.047 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.210929
G1 F15000
G1 X125.006 Y139.968 E.00195
; LINE_WIDTH: 0.170009
G1 X124.888 Y139.888 E.00148
; LINE_WIDTH: 0.129089
G1 X124.77 Y139.809 E.001
G1 X124.155 Y139.609 F30000
; LINE_WIDTH: 0.215915
G1 F15000
M73 P97 R0
G1 X124.075 Y139.553 E.00138
; LINE_WIDTH: 0.21278
G1 X123.952 Y139.461 E.00212
; LINE_WIDTH: 0.171243
G1 X123.83 Y139.37 E.0016
; LINE_WIDTH: 0.129707
G1 X123.708 Y139.278 E.00108
G1 X122.915 Y138.9 F30000
; LINE_WIDTH: 0.231159
G1 F15000
G1 X122.68 Y138.706 E.00468
; LINE_WIDTH: 0.182625
G1 X122.443 Y138.509 E.0035
; LINE_WIDTH: 0.134437
G1 X122.171 Y138.273 E.00269
; WIPE_START
G1 F24000
G1 X122.443 Y138.509 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.855 J-.866 P1  F30000
G1 X119.708 Y135.81 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X119.566 Y135.643 E.00081
; LINE_WIDTH: 0.122388
G1 X119.424 Y135.476 E.00142
; LINE_WIDTH: 0.157176
G1 X119.28 Y135.306 E.00207
; LINE_WIDTH: 0.191515
G1 X119.111 Y135.097 E.00326
G1 X118.719 Y134.289 F30000
; LINE_WIDTH: 0.0885598
G1 F15000
G1 X118.639 Y134.186 E.00048
; LINE_WIDTH: 0.116283
G1 X118.557 Y134.073 E.00083
; LINE_WIDTH: 0.150364
G1 X118.475 Y133.96 E.00122
; LINE_WIDTH: 0.184445
G1 X118.393 Y133.847 E.00161
; WIPE_START
G1 F24000
G1 X118.475 Y133.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.216 J-.036 P1  F30000
G1 X118.144 Y122.878 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.094927
G1 F15000
G1 X118.085 Y122.964 E.00044
G1 X118.097 Y123.03 E.00028
; WIPE_START
G1 F24000
G1 X118.085 Y122.964 E-.2958
G1 X118.144 Y122.878 E-.4642
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.753 J.956 P1  F30000
G1 X127.873 Y115.208 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.101147
G1 F15000
G1 X127.716 Y115.29 E.00084
; WIPE_START
G1 F24000
G1 X127.873 Y115.208 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.119 J1.211 P1  F30000
G1 X129.815 Y115.016 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.103676
G1 F15000
G1 X129.603 Y115.107 E.00114
; WIPE_START
G1 F24000
G1 X129.815 Y115.016 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.183 J1.203 P1  F30000
G1 X133.56 Y115.586 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.104513
G1 F15000
G2 X133.294 Y115.43 I-6.23 J10.275 E.00154
; WIPE_START
G1 F24000
G1 X133.56 Y115.586 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.415 J1.144 P1  F30000
G1 X135.23 Y116.191 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X135.112 Y116.112 E.00053
; LINE_WIDTH: 0.129089
G1 X134.993 Y116.032 E.001
; LINE_WIDTH: 0.17001
G1 X134.875 Y115.953 E.00148
; WIPE_START
G1 F24000
G1 X134.993 Y116.032 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.571 J1.075 P1  F30000
G1 X136.292 Y116.722 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X136.17 Y116.63 E.00056
; LINE_WIDTH: 0.129671
G1 X136.047 Y116.539 E.00108
; LINE_WIDTH: 0.187892
G1 X135.845 Y116.391 E.00296
; WIPE_START
G1 F24000
G1 X136.047 Y116.539 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.675 J1.012 P1  F30000
G1 X137.828 Y117.727 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0884624
G1 F15000
G1 X137.555 Y117.489 E.00134
; LINE_WIDTH: 0.134708
G1 X137.32 Y117.294 E.00229
; LINE_WIDTH: 0.182933
G1 X137.085 Y117.099 E.00349
; WIPE_START
G1 F24000
G1 X137.32 Y117.294 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.865 J.856 P1  F30000
G1 X140.889 Y120.903 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.228125
G1 F15000
G1 X140.717 Y120.691 E.00412
; LINE_WIDTH: 0.190722
G1 X140.576 Y120.524 E.00263
; LINE_WIDTH: 0.156538
G1 X140.434 Y120.357 E.00202
; LINE_WIDTH: 0.122355
G1 X140.293 Y120.191 E.00142
; WIPE_START
G1 F24000
G1 X140.434 Y120.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.019 J.666 P1  F30000
G1 X141.607 Y122.153 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.218528
G1 F15000
G1 X141.525 Y122.04 E.002
; LINE_WIDTH: 0.184412
G1 X141.443 Y121.927 E.00161
; LINE_WIDTH: 0.149852
G1 X141.359 Y121.813 E.00123
; LINE_WIDTH: 0.115654
G1 X141.282 Y121.711 E.00076
; WIPE_START
G1 F24000
G1 X141.359 Y121.813 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.216 J.059 P1  F30000
G1 X141.903 Y132.97 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.111089
G1 F15000
G1 X141.915 Y133.036 E.00037
G1 X141.856 Y133.122 E.00058
; WIPE_START
G1 F24000
G1 X141.915 Y133.036 E-.46414
G1 X141.903 Y132.97 E-.29586
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.088 J.546 P1  F30000
G1 X146.213 Y141.561 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.144734
G1 F15000
G1 X145.947 Y141.405 E.00256
; WIPE_START
G1 F24000
G1 X146.213 Y141.561 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.657 J-1.024 P1  F30000
G1 X143.446 Y143.335 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.103683
G1 F15000
G2 X143.368 Y143.502 I1.849 J.967 E.00091
G1 X143.564 Y144.204 F30000
; LINE_WIDTH: 0.108479
G1 F15000
G3 X143.403 Y143.948 I2.456 J-1.714 E.00161
; WIPE_START
G1 F24000
G1 X143.564 Y144.204 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.83 J.89 P1  F30000
G1 X145.053 Y145.595 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.150307
G1 F15000
G1 X144.787 Y145.439 E.0027
; WIPE_START
G1 F24000
G1 X145.053 Y145.595 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.86 J.861 P1  F30000
G1 X147.597 Y143.052 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.121387
G1 F15000
G2 X147.436 Y142.796 I-2.612 J1.455 E.00193
; WIPE_START
G1 F24000
G1 X147.597 Y143.052 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J-.013 P1  F30000
G1 X147.256 Y111.273 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.219229
G1 F15000
G2 X146.725 Y110.741 I-3.338 J2.804 E.01082
; WIPE_START
G1 F24000
G1 X147.13 Y111.121 E-.56098
G1 X147.256 Y111.273 E-.19902
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.598 J-1.06 P1  F30000
G1 X143.615 Y113.326 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X143.549 Y113.227 E.00044
; LINE_WIDTH: 0.13356
G1 X143.476 Y113.117 E.00097
; LINE_WIDTH: 0.177051
G1 X143.428 Y113.029 E.00109
; WIPE_START
G1 F24000
G1 X143.476 Y113.117 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.048 J-1.216 P1  F30000
G1 X116.597 Y112.052 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.121383
G1 F15000
G2 X116.436 Y111.796 I-2.614 J1.456 E.00193
; WIPE_START
G1 F24000
G1 X116.597 Y112.052 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.86 J-.861 P1  F30000
G1 X114.053 Y114.595 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.150297
G1 F15000
G1 X113.787 Y114.439 E.0027
; WIPE_START
G1 F24000
G1 X114.053 Y114.595 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.83 J-.89 P1  F30000
G1 X112.564 Y113.204 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.108483
G1 F15000
G3 X112.403 Y112.948 I2.455 J-1.713 E.00161
G1 X112.446 Y112.335 F30000
; LINE_WIDTH: 0.103684
G1 F15000
G2 X112.368 Y112.502 I1.847 J.966 E.00091
; WIPE_START
G1 F24000
G1 X112.446 Y112.335 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.657 J1.024 P1  F30000
G1 X115.213 Y110.561 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.144732
G1 F15000
G1 X114.947 Y110.405 E.00256
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X115.213 Y110.561 E-.76
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

