; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 7m 2s; total estimated time: 12m 51s
; total layer number: 45
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
M73 P34 R8
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
M73 P39 R7
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
M73 P40 R7
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X126.15 Y115.5 I7.7 J29
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
; layer num/total_layer_count: 1/45
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
G1 X130.35 Y115 F30000
G1 Z.4
M73 P41 R7
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F2809
G1 X132.25 Y115 E.07077
G1 X132.25 Y141 E.9684
G1 X130.35 Y141 E.07077
G1 X130.35 Y115.06 E.96617
; WIPE_START
G1 F24000
G1 X132.25 Y115 E-.72236
G1 X132.25 Y115.099 E-.03764
; WIPE_END
M73 P42 R7
G1 E-.04 F1800
G17
G3 Z.6 I-1.211 J-.122 P1  F30000
G1 X129.65 Y141 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2809
G1 X127.75 Y141 E.07077
G1 X127.75 Y115 E.9684
G1 X129.65 Y115 E.07077
G1 X129.65 Y140.94 E.96617
; WIPE_START
M73 P43 R7
G1 F24000
G1 X127.75 Y141 E-.72236
G1 X127.75 Y140.901 E-.03764
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.036 J-.638 P1  F30000
G1 X127.293 Y141.643 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2809
G1 X127.007 Y141.643 E.01065
G1 X127.007 Y114.357 E1.01629
G1 X127.293 Y114.357 E.01065
G1 X127.293 Y141.583 E1.01406
; WIPE_START
G1 F24000
G1 X127.007 Y141.643 E-.11099
M73 P44 R7
G1 X127.007 Y139.935 E-.64901
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.334 J1.17 P1  F30000
G1 X132.993 Y141.643 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2809
G1 X132.707 Y141.643 E.01065
G1 X132.707 Y114.357 E1.01629
G1 X132.993 Y114.357 E.01065
G1 X132.993 Y141.583 E1.01406
G1 X133.45 Y142.1 F30000
; FEATURE: Outer wall
G1 F2809
G1 X126.55 Y142.1 E.257
M73 P45 R7
G1 X126.55 Y113.9 E1.05034
G1 X133.45 Y113.9 E.257
G1 X133.45 Y142.04 E1.04811
; WIPE_START
G1 F24000
G1 X131.45 Y142.057 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.538 J1.091 P1  F30000
G1 X132.479 Y141.55 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.686625
G1 F2809
G1 X130.121 Y141.55 E.12364
G1 X130 Y141.539 E.0064
G1 X130 Y141.504 E.00181
; LINE_WIDTH: 0.6148
G1 X130 Y141.47 E.00161
; LINE_WIDTH: 0.567806
G1 X130 Y141.435 E.00147
; LINE_WIDTH: 0.520812
G1 X130 Y141.401 E.00134
; LINE_WIDTH: 0.473818
G1 X130 Y141.366 E.00121
; LINE_WIDTH: 0.426824
G1 X130 Y141.332 E.00108
; LINE_WIDTH: 0.37983
G1 X130 Y141.297 E.00095
; LINE_WIDTH: 0.332836
G1 X130 Y141.263 E.00081
; LINE_WIDTH: 0.285842
G1 X130 Y141.229 E.00068
; LINE_WIDTH: 0.285903
M73 P45 R6
G1 X130 Y114.737 E.52453
; LINE_WIDTH: 0.37983
G1 X130 Y114.703 E.00095
; LINE_WIDTH: 0.426824
G1 X130 Y114.668 E.00108
; LINE_WIDTH: 0.473818
G1 X130 Y114.634 E.00121
; LINE_WIDTH: 0.520812
G1 X130 Y114.599 E.00134
; LINE_WIDTH: 0.567806
G1 X130 Y114.565 E.00147
; LINE_WIDTH: 0.6148
G1 X130 Y114.53 E.00161
; LINE_WIDTH: 0.661793
G1 X130 Y114.496 E.00174
; LINE_WIDTH: 0.708787
G1 X130 Y114.461 E.00187
; LINE_WIDTH: 0.68584
G1 X132.479 Y114.45 E.12985
; WIPE_START
G1 F24000
G1 X130.479 Y114.459 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.006 J-1.217 P1  F30000
G1 X130 Y114.461 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.68697
G1 F2809
G1 X127.521 Y114.45 E.13008
; WIPE_START
G1 F24000
M73 P46 R6
G1 X129.521 Y114.459 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.214 J-.09 P1  F30000
G1 X127.521 Y141.55 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.686972
G1 F2809
G1 X130 Y141.539 E.13008
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128 Y141.548 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/45
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
G3 Z.6 I1.213 J.099 P1  F30000
G1 X130.148 Y115.19 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.345 J1.167 P1  F30000
G1 X133.248 Y141.898 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.102 E.92204
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.838 E.92005
G1 X133.64 Y142.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.71 E.87818
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.23 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X131.64 Y142.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.648 J1.03 P1  F30000
G1 X132.841 Y141.491 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3399
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
M73 P47 R6
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.509 E.85488
; LINE_WIDTH: 0.410762
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.847 Y141.431 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.779 Y141.51 E-.03978
G1 X132.717 Y141.53 E-.02462
G1 X132.656 Y141.55 E-.02462
G1 X130.89 Y141.55 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/45
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
G3 Z.8 I1.216 J-.034 P1  F30000
G1 X130.148 Y115.19 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.345 J1.167 P1  F30000
G1 X133.248 Y141.898 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.102 E.92204
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.838 E.92005
G1 X133.64 Y142.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.71 E.87818
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.23 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X131.64 Y142.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.648 J1.03 P1  F30000
G1 X132.841 Y141.491 Z1
G1 Z.6
M73 P48 R6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3399
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.509 E.85488
; LINE_WIDTH: 0.410762
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.847 Y141.431 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.779 Y141.51 E-.03978
G1 X132.717 Y141.53 E-.02462
G1 X132.656 Y141.55 E-.02462
G1 X130.89 Y141.55 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/45
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
G3 Z1 I1.216 J-.034 P1  F30000
G1 X130.148 Y115.19 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
M73 P49 R6
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.345 J1.167 P1  F30000
G1 X133.248 Y141.898 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.102 E.92204
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.838 E.92005
G1 X133.64 Y142.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.71 E.87818
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.23 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X131.64 Y142.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.648 J1.03 P1  F30000
G1 X132.841 Y141.491 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3399
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.509 E.85488
; LINE_WIDTH: 0.410762
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.847 Y141.431 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.779 Y141.51 E-.03978
G1 X132.717 Y141.53 E-.02462
G1 X132.656 Y141.55 E-.02462
G1 X130.89 Y141.55 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/45
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
G3 Z1.2 I1.216 J-.034 P1  F30000
G1 X130.148 Y115.19 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.212 J-.105 P1  F30000
M73 P50 R6
G1 X129.852 Y141.202 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.345 J1.167 P1  F30000
G1 X133.248 Y141.898 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.102 E.92204
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.838 E.92005
G1 X133.64 Y142.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.71 E.87818
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.23 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X131.64 Y142.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.648 J1.03 P1  F30000
G1 X132.841 Y141.491 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3399
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.509 E.85488
; LINE_WIDTH: 0.410762
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.847 Y141.431 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.779 Y141.51 E-.03978
G1 X132.717 Y141.53 E-.02462
G1 X132.656 Y141.55 E-.02462
G1 X130.89 Y141.55 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/45
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
G3 Z1.4 I1.216 J-.034 P1  F30000
G1 X130.148 Y115.19 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
M73 P51 R6
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.345 J1.167 P1  F30000
G1 X133.248 Y141.898 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.102 E.92204
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.838 E.92005
G1 X133.64 Y142.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.71 E.87818
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.23 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X131.64 Y142.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.648 J1.03 P1  F30000
G1 X132.841 Y141.491 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3399
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.509 E.85488
; LINE_WIDTH: 0.410762
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.847 Y141.431 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.779 Y141.51 E-.03978
G1 X132.717 Y141.53 E-.02462
G1 X132.656 Y141.55 E-.02462
G1 X130.89 Y141.55 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/45
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
G3 Z1.6 I1.216 J-.034 P1  F30000
G1 X130.148 Y115.19 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X132.06 Y115.19 E.04671
M73 P52 R6
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.345 J1.167 P1  F30000
G1 X133.248 Y141.898 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.102 E.92204
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.838 E.92005
G1 X133.64 Y142.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.71 E.87818
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.23 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X131.64 Y142.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.648 J1.03 P1  F30000
G1 X132.841 Y141.491 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3399
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.509 E.85488
; LINE_WIDTH: 0.410762
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.847 Y141.431 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.779 Y141.51 E-.03978
G1 X132.717 Y141.53 E-.02462
G1 X132.656 Y141.55 E-.02462
G1 X130.89 Y141.55 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/45
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
M73 P53 R6
G3 Z1.8 I1.216 J-.034 P1  F30000
G1 X130.148 Y115.19 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.212 J-.105 P1  F30000
M73 P53 R5
G1 X129.852 Y141.202 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.345 J1.167 P1  F30000
G1 X133.248 Y141.898 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.102 E.92204
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.838 E.92005
G1 X133.64 Y142.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.71 E.87818
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.23 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X131.64 Y142.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.648 J1.03 P1  F30000
G1 X132.841 Y141.491 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3399
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.509 E.85488
; LINE_WIDTH: 0.410762
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.847 Y141.431 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P54 R5
G1 F24000
G1 X132.779 Y141.51 E-.03978
G1 X132.717 Y141.53 E-.02462
G1 X132.656 Y141.55 E-.02462
G1 X130.89 Y141.55 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/45
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
G3 Z2 I1.216 J-.034 P1  F30000
G1 X130.148 Y115.19 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.345 J1.167 P1  F30000
G1 X133.248 Y141.898 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.102 E.92204
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.838 E.92005
G1 X133.64 Y142.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.71 E.87818
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.23 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X131.64 Y142.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.648 J1.03 P1  F30000
G1 X132.841 Y141.491 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3399
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
M73 P55 R5
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.509 E.85488
; LINE_WIDTH: 0.410762
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.847 Y141.431 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.779 Y141.51 E-.03978
G1 X132.717 Y141.53 E-.02462
G1 X132.656 Y141.55 E-.02462
G1 X130.89 Y141.55 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/45
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
G3 Z2.2 I.559 J-1.081 P1  F30000
G1 X129.46 Y140.81 Z2.2
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3407
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.211 J.123 P1  F30000
G1 X130.54 Y114.798 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3407
G1 X132.452 Y114.798 E.06343
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y114.798 E.87587
G1 X130.48 Y114.798 E.01102
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3407
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.216 J.055 P1  F30000
G1 X133.248 Y141.898 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3407
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y129.711 E.40427
G1 X127.548 Y129.711 E.0264
G1 X127.548 Y141.202 E.38118
G1 X129.852 Y141.202 E.07643
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y126.289 E.38118
G1 X126.752 Y126.289 E.0264
G1 X126.752 Y114.102 E.40427
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.838 E.92005
G1 X133.64 Y142.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3407
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.71 E.87818
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.23 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X131.64 Y142.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.661 J1.022 P1  F30000
G1 X132.779 Y141.51 Z2.4
M73 P56 R5
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.371223
G1 F3407
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y129.914 E.36673
G1 X127.178 Y129.488 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3407
G1 X127.733 Y128.934 E.02409
G1 X127.733 Y128.401
G1 X126.645 Y129.488 E.04726
G1 X126.567 Y129.033
G1 X127.733 Y127.868 E.05063
G1 X127.733 Y127.334
G1 X126.567 Y128.5 E.05063
G1 X126.567 Y127.966
G1 X127.733 Y126.801 E.05063
G1 X127.489 Y126.512
G1 X126.567 Y127.433 E.04004
G1 X126.567 Y126.9
G1 X126.956 Y126.512 E.01687
M204 S10000
G1 X127.15 Y126.086 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431705
G1 F3407
G1 X127.15 Y114.594 E.36405
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.841 Y141.491 E-.02462
G1 X132.85 Y141.406 E-.03252
G1 X132.849 Y139.556 E-.70286
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/45
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
G3 Z2.4 I1.21 J-.134 P1  F30000
G1 X130.148 Y115.19 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3328
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3328
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3328
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y126.765 E.39696
G1 X126.752 Y126.765 E.0264
G1 X126.752 Y114.102 E.42005
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y129.235 E.42005
G1 X127.548 Y129.235 E.0264
G1 X127.548 Y141.202 E.39696
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3328
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y127.157 E.36771
G1 X126.36 Y127.157 E.04855
G1 X126.36 Y113.71 E.41319
G1 X133.64 Y113.71 E.22369
M73 P57 R5
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y128.843 E.41319
G1 X127.94 Y128.843 E.04855
G1 X127.94 Y140.81 E.36771
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3328
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y129.439 E.3818
; WIPE_START
G1 F24000
G1 X127.152 Y131.439 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.217 J0 P1  F30000
G1 X127.15 Y126.561 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.431704
G1 F3328
G1 X127.15 Y114.594 E.37912
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/45
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
G3 Z2.6 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3290
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3290
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P58 R5
G1 F3290
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y126.249 E.37986
G1 X126.752 Y126.249 E.0264
G1 X126.752 Y114.102 E.40295
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y129.751 E.40295
G1 X127.548 Y129.751 E.0264
G1 X127.548 Y141.202 E.37986
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3290
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y126.641 E.35187
G1 X126.36 Y126.641 E.04855
G1 X126.36 Y113.71 E.39735
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y129.359 E.39735
G1 X127.94 Y129.359 E.04855
G1 X127.94 Y140.81 E.35187
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3290
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y129.954 E.36547
; WIPE_START
G1 F24000
G1 X127.152 Y131.954 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.217 J0 P1  F30000
G1 X127.15 Y126.046 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.431705
G1 F3290
G1 X127.15 Y114.594 E.36279
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/45
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
G3 Z2.8 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3264
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
M73 P59 R5
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3264
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3264
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.913 E.3687
G1 X126.752 Y125.913 E.0264
G1 X126.752 Y114.102 E.39179
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.087 E.39179
G1 X127.548 Y130.087 E.0264
G1 X127.548 Y141.202 E.3687
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3264
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y126.305 E.34153
G1 X126.36 Y126.305 E.04855
G1 X126.36 Y113.71 E.38701
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y129.695 E.38701
G1 X127.94 Y129.695 E.04855
G1 X127.94 Y140.81 E.34153
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3264
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y130.291 E.35481
; WIPE_START
G1 F24000
G1 X127.152 Y132.291 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.217 J0 P1  F30000
G1 X127.15 Y125.709 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.431705
G1 F3264
G1 X127.15 Y114.594 E.35213
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/45
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
G3 Z3 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z3
M73 P60 R5
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3247
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3247
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3247
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.687 E.36122
G1 X126.752 Y125.687 E.0264
G1 X126.752 Y114.102 E.3843
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.313 E.3843
G1 X127.548 Y130.313 E.0264
G1 X127.548 Y141.202 E.36122
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3247
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y126.079 E.3346
G1 X126.36 Y126.079 E.04855
G1 X126.36 Y113.71 E.38007
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y129.921 E.38007
G1 X127.94 Y129.921 E.04855
G1 X127.94 Y140.81 E.3346
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3247
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y130.516 E.34766
; WIPE_START
G1 F24000
G1 X127.152 Y132.516 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.217 J0 P1  F30000
G1 X127.15 Y125.484 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.431706
G1 F3247
G1 X127.15 Y114.594 E.34498
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
M73 P61 R5
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/45
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
G3 Z3.2 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P61 R4
G1 F3232
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3232
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3232
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.487 E.35457
G1 X126.752 Y125.487 E.0264
G1 X126.752 Y114.102 E.37765
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.513 E.37765
G1 X127.548 Y130.513 E.0264
G1 X127.548 Y141.202 E.35457
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3232
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.879 E.32844
G1 X126.36 Y125.879 E.04855
G1 X126.36 Y113.71 E.37391
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.121 E.37391
G1 X127.94 Y130.121 E.04855
G1 X127.94 Y140.81 E.32844
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3232
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y130.717 E.34131
; WIPE_START
G1 F24000
G1 X127.152 Y132.717 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J0 P1  F30000
G1 X127.15 Y125.283 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.431706
G1 F3232
G1 X127.15 Y114.594 E.33863
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
M73 P62 R4
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/45
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
G3 Z3.4 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3221
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3221
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3221
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.349 E.34999
G1 X126.752 Y125.349 E.0264
G1 X126.752 Y114.102 E.37307
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.651 E.37307
G1 X127.548 Y130.651 E.0264
G1 X127.548 Y141.202 E.34999
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3221
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.741 E.3242
G1 X126.36 Y125.741 E.04855
G1 X126.36 Y113.71 E.36967
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.259 E.36967
G1 X127.94 Y130.259 E.04855
G1 X127.94 Y140.81 E.3242
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3221
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y130.855 E.33694
; WIPE_START
G1 F24000
G1 X127.152 Y132.855 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.217 J0 P1  F30000
G1 X127.15 Y125.145 Z3.6
G1 Z3.2
M73 P63 R4
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3221
G1 X127.15 Y114.594 E.33426
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/45
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
G3 Z3.6 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3211
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3211
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3211
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.211 E.34541
G1 X126.752 Y125.211 E.0264
G1 X126.752 Y114.102 E.36849
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.789 E.36849
G1 X127.548 Y130.789 E.0264
G1 X127.548 Y141.202 E.34541
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3211
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.603 E.31995
G1 X126.36 Y125.603 E.04855
G1 X126.36 Y113.71 E.36543
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.397 E.36543
G1 X127.94 Y130.397 E.04855
G1 X127.94 Y140.81 E.31995
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3211
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y130.993 E.33256
; WIPE_START
M73 P64 R4
G1 F24000
G1 X127.152 Y132.993 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.217 J0 P1  F30000
G1 X127.15 Y125.007 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3211
G1 X127.15 Y114.594 E.32989
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/45
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
G3 Z3.8 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3204
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3204
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3204
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.123 E.3425
G1 X126.752 Y125.123 E.0264
G1 X126.752 Y114.102 E.36558
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.877 E.36558
G1 X127.548 Y130.877 E.0264
G1 X127.548 Y141.202 E.3425
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3204
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.515 E.31726
G1 X126.36 Y125.515 E.04855
G1 X126.36 Y113.71 E.36273
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
M73 P65 R4
G1 X126.36 Y130.485 E.36273
G1 X127.94 Y130.485 E.04855
G1 X127.94 Y140.81 E.31726
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3204
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y131.081 E.32978
; WIPE_START
G1 F24000
G1 X127.152 Y133.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.217 J0 P1  F30000
G1 X127.15 Y124.919 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3204
G1 X127.15 Y114.594 E.32711
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/45
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
G3 Z4 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3198
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3198
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P66 R4
G1 F3198
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.047 E.33998
G1 X126.752 Y125.047 E.0264
G1 X126.752 Y114.102 E.36307
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.953 E.36307
G1 X127.548 Y130.953 E.0264
G1 X127.548 Y141.202 E.33998
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3198
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.439 E.31493
G1 X126.36 Y125.439 E.04855
G1 X126.36 Y113.71 E.3604
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.561 E.3604
G1 X127.94 Y130.561 E.04855
G1 X127.94 Y140.81 E.31493
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3198
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y131.156 E.32738
; WIPE_START
G1 F24000
G1 X127.152 Y133.156 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.217 J0 P1  F30000
G1 X127.15 Y124.844 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3198
G1 X127.15 Y114.594 E.32471
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/45
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
G3 Z4.2 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3192
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
M73 P67 R4
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3192
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3192
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y124.971 E.33747
G1 X126.752 Y124.971 E.0264
G1 X126.752 Y114.102 E.36055
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y131.029 E.36055
G1 X127.548 Y131.029 E.0264
G1 X127.548 Y141.202 E.33747
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3192
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.363 E.3126
G1 X126.36 Y125.363 E.04855
G1 X126.36 Y113.71 E.35807
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.637 E.35807
G1 X127.94 Y130.637 E.04855
G1 X127.94 Y140.81 E.3126
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3192
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y131.232 E.32498
; WIPE_START
G1 F24000
G1 X127.152 Y133.232 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.217 J0 P1  F30000
G1 X127.15 Y124.768 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3192
G1 X127.15 Y114.594 E.3223
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/45
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
G3 Z4.4 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P68 R4
G1 F3191
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3191
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3191
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y124.946 E.33665
G1 X126.752 Y124.946 E.0264
G1 X126.752 Y114.102 E.35973
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y131.054 E.35973
G1 X127.548 Y131.054 E.0264
G1 X127.548 Y141.202 E.33665
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3191
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.339 E.31184
G1 X126.36 Y125.339 E.04855
G1 X126.36 Y113.71 E.35731
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.661 E.35731
G1 X127.94 Y130.661 E.04855
G1 X127.94 Y140.81 E.31184
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3191
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y131.257 E.3242
; WIPE_START
G1 F24000
G1 X127.152 Y133.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.217 J0 P1  F30000
G1 X127.15 Y124.743 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3191
G1 X127.15 Y114.594 E.32152
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
M73 P68 R3
G1 X127.344 Y141.55 E.12518
M73 P69 R3
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/45
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
G3 Z4.6 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3189
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3189
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3189
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y124.922 E.33584
G1 X126.752 Y124.922 E.0264
G1 X126.752 Y114.102 E.35892
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y131.078 E.35892
G1 X127.548 Y131.078 E.0264
G1 X127.548 Y141.202 E.33584
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3189
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.314 E.31109
G1 X126.36 Y125.314 E.04855
G1 X126.36 Y113.71 E.35657
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.686 E.35657
G1 X127.94 Y130.686 E.04855
G1 X127.94 Y140.81 E.31109
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3189
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y131.281 E.32343
; WIPE_START
G1 F24000
G1 X127.152 Y133.281 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.217 J0 P1  F30000
G1 X127.15 Y124.719 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.431708
G1 F3189
G1 X127.15 Y114.594 E.32075
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
M73 P70 R3
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/45
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
G3 Z4.8 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3187
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3187
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3187
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y124.898 E.33504
G1 X126.752 Y124.898 E.0264
G1 X126.752 Y114.102 E.35812
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y131.102 E.35812
G1 X127.548 Y131.102 E.0264
G1 X127.548 Y141.202 E.33504
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3187
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.29 E.31034
G1 X126.36 Y125.29 E.04855
G1 X126.36 Y113.71 E.35582
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.71 E.35582
G1 X127.94 Y130.71 E.04855
G1 X127.94 Y140.81 E.31034
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3187
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.43169
G1 X127.15 Y131.306 E.32266
; WIPE_START
G1 F24000
G1 X127.152 Y133.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.217 J0 P1  F30000
G1 X127.15 Y124.694 Z5
G1 Z4.6
M73 P71 R3
G1 E.8 F1800
; LINE_WIDTH: 0.431708
G1 F3187
G1 X127.15 Y114.594 E.31998
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/45
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
G3 Z5 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3189
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3189
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3189
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y124.922 E.33584
G1 X126.752 Y124.922 E.0264
G1 X126.752 Y114.102 E.35892
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y131.078 E.35892
G1 X127.548 Y131.078 E.0264
G1 X127.548 Y141.202 E.33584
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3189
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.314 E.31109
G1 X126.36 Y125.314 E.04855
G1 X126.36 Y113.71 E.35657
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.686 E.35657
G1 X127.94 Y130.686 E.04855
G1 X127.94 Y140.81 E.31109
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3189
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y131.281 E.32343
; WIPE_START
M73 P72 R3
G1 F24000
G1 X127.152 Y133.281 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.217 J0 P1  F30000
G1 X127.15 Y124.719 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.431708
G1 F3189
G1 X127.15 Y114.594 E.32075
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/45
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
G3 Z5.2 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3191
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3191
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3191
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y124.946 E.33665
G1 X126.752 Y124.946 E.0264
G1 X126.752 Y114.102 E.35973
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y131.054 E.35973
G1 X127.548 Y131.054 E.0264
G1 X127.548 Y141.202 E.33665
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3191
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.339 E.31184
G1 X126.36 Y125.339 E.04855
G1 X126.36 Y113.71 E.35731
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.661 E.35731
G1 X127.94 Y130.661 E.04855
G1 X127.94 Y140.81 E.31184
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
M73 P73 R3
G1 E-.04 F1800
G17
G3 Z5.4 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3191
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y131.257 E.3242
; WIPE_START
G1 F24000
G1 X127.152 Y133.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.217 J0 P1  F30000
G1 X127.15 Y124.743 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3191
G1 X127.15 Y114.594 E.32152
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/45
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
G3 Z5.4 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3192
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3192
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3192
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y124.971 E.33747
G1 X126.752 Y124.971 E.0264
G1 X126.752 Y114.102 E.36055
M73 P74 R3
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y131.029 E.36055
G1 X127.548 Y131.029 E.0264
G1 X127.548 Y141.202 E.33747
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3192
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.363 E.3126
G1 X126.36 Y125.363 E.04855
G1 X126.36 Y113.71 E.35807
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.637 E.35807
G1 X127.94 Y130.637 E.04855
G1 X127.94 Y140.81 E.3126
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3192
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y131.232 E.32498
; WIPE_START
G1 F24000
G1 X127.152 Y133.232 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.217 J0 P1  F30000
G1 X127.15 Y124.768 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3192
G1 X127.15 Y114.594 E.3223
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/45
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
G3 Z5.6 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3204
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
M73 P75 R3
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3204
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3204
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.047 E.33998
G1 X126.752 Y125.047 E.0264
G1 X126.752 Y114.102 E.36307
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.953 E.36307
G1 X127.548 Y130.953 E.0264
G1 X127.548 Y141.202 E.33998
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3204
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.404 E.31386
G1 X127.94 Y125.439 E.00107
G1 X126.36 Y125.439 E.04855
G1 X126.36 Y125.404 E.00107
G1 X126.36 Y113.71 E.35933
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.596 E.35933
G1 X126.36 Y130.561 E.00107
G1 X127.94 Y130.561 E.04855
G1 X127.94 Y130.596 E.00107
G1 X127.94 Y140.81 E.31386
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3204
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y131.156 E.32738
; WIPE_START
G1 F24000
G1 X127.152 Y133.156 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J0 P1  F30000
G1 X127.15 Y124.844 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3204
G1 X127.15 Y114.594 E.32471
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/45
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
G3 Z5.8 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z5.8
M73 P76 R3
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3209
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3209
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3209
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.123 E.3425
G1 X126.752 Y125.123 E.0264
G1 X126.752 Y114.102 E.36558
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.877 E.36558
G1 X127.548 Y130.877 E.0264
G1 X127.548 Y141.202 E.3425
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3209
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.48 E.31619
G1 X127.94 Y125.515 E.00107
G1 X126.36 Y125.515 E.04855
G1 X126.36 Y125.48 E.00107
G1 X126.36 Y113.71 E.36166
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.52 E.36166
G1 X126.36 Y130.485 E.00107
G1 X127.94 Y130.485 E.04855
G1 X127.94 Y130.52 E.00107
G1 X127.94 Y140.81 E.31619
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3209
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y131.081 E.32978
; WIPE_START
G1 F24000
G1 X127.152 Y133.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.217 J0 P1  F30000
G1 X127.15 Y124.919 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.431707
M73 P76 R2
G1 F3209
G1 X127.15 Y114.594 E.32711
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
M73 P77 R2
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/45
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
G3 Z6 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3216
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3216
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3216
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.211 E.34541
G1 X126.752 Y125.211 E.0264
G1 X126.752 Y114.102 E.36849
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.789 E.36849
G1 X127.548 Y130.789 E.0264
G1 X127.548 Y141.202 E.34541
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3216
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.556 E.31852
G1 X127.94 Y125.603 E.00144
G1 X126.36 Y125.603 E.04855
G1 X126.36 Y125.556 E.00144
G1 X126.36 Y113.71 E.36399
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.444 E.36399
G1 X126.36 Y130.397 E.00144
G1 X127.94 Y130.397 E.04855
G1 X127.94 Y130.444 E.00144
G1 X127.94 Y140.81 E.31852
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3216
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y130.993 E.33256
; WIPE_START
G1 F24000
G1 X127.152 Y132.993 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.217 J0 P1  F30000
G1 X127.15 Y125.007 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3216
G1 X127.15 Y114.594 E.32989
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
M73 P78 R2
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/45
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
G3 Z6.2 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3229
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3229
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3229
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.349 E.34999
G1 X126.752 Y125.349 E.0264
G1 X126.752 Y114.102 E.37307
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.651 E.37307
G1 X127.548 Y130.651 E.0264
G1 X127.548 Y141.202 E.34999
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3229
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.726 E.32373
G1 F3000
G1 X127.94 Y125.741 E.00046
G1 X126.36 Y125.741 E.04855
G1 X126.36 Y125.726 E.00046
G1 F3229
G1 X126.36 Y125.644 E.00252
G1 X126.36 Y113.71 E.36669
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.274 E.36921
G1 F3000
G1 X126.36 Y130.259 E.00046
G1 X127.94 Y130.259 E.04855
G1 X127.94 Y130.274 E.00046
G1 F3229
G1 X127.94 Y140.81 E.32373
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3229
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y130.855 E.33694
; WIPE_START
G1 F24000
G1 X127.152 Y132.855 E-.76
; WIPE_END
M73 P79 R2
G1 E-.04 F1800
G17
G3 Z6.4 I1.217 J0 P1  F30000
G1 X127.15 Y125.145 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3229
G1 X127.15 Y114.594 E.33426
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/45
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
G3 Z6.4 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3240
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3240
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3240
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.487 E.35457
G1 X126.752 Y125.487 E.0264
G1 X126.752 Y114.102 E.37765
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.513 E.37765
G1 X127.548 Y130.513 E.0264
G1 X127.548 Y141.202 E.35457
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3240
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y125.864 E.32798
G1 F3000
G1 X127.94 Y125.879 E.00046
G1 X126.36 Y125.879 E.04855
G1 X126.36 Y125.864 E.00046
G1 F3240
G1 X126.36 Y125.782 E.00252
G1 X126.36 Y113.71 E.37093
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y130.136 E.37345
G1 F3000
G1 X126.36 Y130.121 E.00046
G1 X127.94 Y130.121 E.04855
G1 X127.94 Y130.136 E.00046
G1 F3240
G1 X127.94 Y140.81 E.32798
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z6.6
G1 Z6.2
M73 P80 R2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3240
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y130.717 E.34131
; WIPE_START
G1 F24000
G1 X127.152 Y132.717 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.217 J0 P1  F30000
G1 X127.15 Y125.283 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.431706
G1 F3240
G1 X127.15 Y114.594 E.33863
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/45
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
G3 Z6.6 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3256
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3256
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3256
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.687 E.36122
G1 X126.752 Y125.687 E.0264
G1 X126.752 Y114.102 E.3843
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.313 E.3843
G1 X127.548 Y130.313 E.0264
G1 X127.548 Y141.202 E.36122
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3256
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y126.002 E.33222
G1 F3000
G1 X127.94 Y126.079 E.00238
G1 X126.36 Y126.079 E.04855
G1 X126.36 Y126.002 E.00238
G1 F3256
G1 X126.36 Y125.92 E.00252
G1 X126.36 Y113.71 E.37517
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y129.998 E.37769
G1 F3000
G1 X126.36 Y129.921 E.00238
G1 X127.94 Y129.921 E.04855
G1 X127.94 Y129.998 E.00238
G1 F3256
G1 X127.94 Y140.81 E.33222
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
M73 P81 R2
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3256
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y130.516 E.34766
; WIPE_START
G1 F24000
G1 X127.152 Y132.516 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J0 P1  F30000
G1 X127.15 Y125.484 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.431706
G1 F3256
G1 X127.15 Y114.594 E.34498
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/45
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
G3 Z6.8 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3296
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3296
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3296
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y125.913 E.3687
G1 X126.752 Y125.913 E.0264
G1 X126.752 Y114.102 E.39179
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y130.087 E.39179
G1 X127.548 Y130.087 E.0264
G1 X127.548 Y141.202 E.3687
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P82 R2
G1 F3296
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y126.284 E.34089
M106 S255
G1 F1800
G1 X127.94 Y126.305 E.00064
G1 X126.36 Y126.305 E.04855
G1 X126.36 Y126.284 E.00064
M106 S252.45
G1 F3296
G1 X126.36 Y126.12 E.00504
G1 X126.36 Y113.71 E.38133
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y129.716 E.38637
M106 S255
G1 F1800
G1 X126.36 Y129.695 E.00064
G1 X127.94 Y129.695 E.04855
G1 X127.94 Y129.716 E.00064
M106 S252.45
G1 F3296
G1 X127.94 Y140.81 E.34089
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3296
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y130.291 E.35481
; WIPE_START
G1 F24000
G1 X127.152 Y132.291 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.217 J0 P1  F30000
G1 X127.15 Y125.709 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.431705
G1 F3296
G1 X127.15 Y114.594 E.35213
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/45
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
G3 Z7 I1.216 J.04 P1  F30000
G1 X130.148 Y115.19 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3420
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3420
M73 P83 R2
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3420
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y126.249 E.37986
G1 X126.752 Y126.249 E.0264
G1 X126.752 Y114.102 E.40295
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y129.751 E.40295
G1 X127.548 Y129.751 E.0264
G1 X127.548 Y141.202 E.37986
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3420
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y126.346 E.34279
G1 X127.94 Y126.592 E.00756
M106 S255
G1 F600
G1 X127.94 Y126.641 E.00152
G1 X126.36 Y126.641 E.04855
G1 X126.36 Y126.592 E.00152
M106 S252.45
G1 F3420
G1 X126.36 Y126.346 E.00756
G1 X126.36 Y113.71 E.38827
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y129.654 E.38827
G1 X126.36 Y129.408 E.00756
M106 S255
G1 F600
G1 X126.36 Y129.359 E.00152
G1 X127.94 Y129.359 E.04855
G1 X127.94 Y129.408 E.00152
M106 S252.45
G1 F3420
G1 X127.94 Y129.654 E.00756
G1 X127.94 Y140.81 E.34279
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3420
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y129.954 E.36547
; WIPE_START
G1 F24000
G1 X127.152 Y131.954 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.217 J0 P1  F30000
G1 X127.15 Y126.046 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.431705
G1 F3420
G1 X127.15 Y114.594 E.36279
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/45
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
G3 Z7.2 I1.216 J.04 P1  F30000
M73 P84 R2
G1 X130.148 Y115.19 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3340
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3340
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3340
G1 X129.852 Y114.798 E.87587
G1 X127.548 Y114.798 E.07643
G1 X127.548 Y126.765 E.39696
G1 X126.752 Y126.765 E.0264
G1 X126.752 Y126.669 E.00318
G1 X126.752 Y114.102 E.41687
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y129.235 E.42005
G1 X127.548 Y129.235 E.0264
G1 X127.548 Y141.202 E.39696
G1 X129.792 Y141.202 E.07444
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3340
G1 X129.46 Y115.19 E.78723
G1 X127.94 Y115.19 E.04671
G1 X127.94 Y127.051 E.36447
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X127.94 Y127.157 E.0035
G1 X126.36 Y127.157 E.05241
G1 X126.36 Y127.051 E.0035
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3340
G1 X126.36 Y126.682 E.01134
G1 X126.36 Y113.71 E.39861
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y128.949 E.40994
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X126.36 Y128.843 E.0035
G1 X127.94 Y128.843 E.05241
G1 X127.94 Y128.949 E.0035
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3340
G1 X127.94 Y140.81 E.36447
G1 X129.4 Y140.81 E.04486
M204 S10000
; WIPE_START
G1 F24000
M73 P84 R1
G1 X129.405 Y138.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.96 J-.749 P1  F30000
G1 X127.283 Y141.53 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410763
G1 F3340
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431684
G1 X127.15 Y129.439 E.3818
; WIPE_START
G1 F24000
G1 X127.152 Y131.439 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.217 J0 P1  F30000
G1 X127.15 Y126.561 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.431704
G1 F3340
G1 X127.15 Y114.594 E.37912
G1 X127.159 Y114.509 E.00271
G1 X127.221 Y114.49 E.00205
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
M73 P85 R1
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.344 Y141.55 E-.02462
G1 X129.28 Y141.55 E-.73538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/45
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
G3 Z7.4 I.632 J1.04 P1  F30000
G1 X129.852 Y141.202 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3385
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y128.433 E.42357
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X127.548 Y127.567 E.02873
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F3385
G1 X127.548 Y127.184 E.01269
G1 X127.548 Y114.798 E.41088
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3385
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y128.433 E.38031
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X127.94 Y127.567 E.02873
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3385
G1 X127.94 Y127.198 E.01134
G1 X127.94 Y115.19 E.36897
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.212 J.106 P1  F30000
G1 X130.148 Y115.19 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3385
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3385
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.345 J-1.167 P1  F30000
G1 X126.752 Y114.102 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3385
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y128.433 E.44665
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X126.752 Y127.567 E.02873
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F3385
G1 X126.752 Y127.184 E.01269
G1 X126.752 Y114.162 E.43197
G1 X126.36 Y113.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3385
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y128.433 E.42578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X126.36 Y127.567 E.02873
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3385
G1 X126.36 Y127.198 E.01134
G1 X126.36 Y113.77 E.4126
M204 S10000
; WIPE_START
G1 F24000
G1 X128.36 Y113.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.648 J-1.03 P1  F30000
G1 X127.159 Y114.509 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3385
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
M73 P86 R1
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.569 E.85298
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.221 Y114.49 E-.03832
G1 X127.283 Y114.47 E-.02462
G1 X127.344 Y114.45 E-.02462
G1 X129.114 Y114.45 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/45
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
G3 Z7.6 I-.708 J.99 P1  F30000
G1 X130.148 Y115.19 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.216 J-.055 P1  F30000
G1 X126.752 Y114.102 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.162 E.92005
G1 X126.36 Y113.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.77 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X128.36 Y113.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.648 J-1.03 P1  F30000
G1 X127.159 Y114.509 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3390
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.569 E.85298
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P87 R1
G1 F24000
G1 X127.221 Y114.49 E-.03832
G1 X127.283 Y114.47 E-.02462
G1 X127.344 Y114.45 E-.02462
G1 X129.114 Y114.45 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/45
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
G3 Z7.8 I-.708 J.99 P1  F30000
G1 X130.148 Y115.19 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.216 J-.055 P1  F30000
G1 X126.752 Y114.102 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.162 E.92005
G1 X126.36 Y113.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.77 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X128.36 Y113.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.648 J-1.03 P1  F30000
G1 X127.159 Y114.509 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3390
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
M73 P88 R1
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.569 E.85298
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.221 Y114.49 E-.03832
G1 X127.283 Y114.47 E-.02462
G1 X127.344 Y114.45 E-.02462
G1 X129.114 Y114.45 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/45
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
G3 Z8 I-.708 J.99 P1  F30000
G1 X130.148 Y115.19 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.216 J-.055 P1  F30000
G1 X126.752 Y114.102 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.162 E.92005
G1 X126.36 Y113.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.77 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X128.36 Y113.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.648 J-1.03 P1  F30000
G1 X127.159 Y114.509 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3390
M73 P89 R1
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.569 E.85298
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.221 Y114.49 E-.03832
G1 X127.283 Y114.47 E-.02462
G1 X127.344 Y114.45 E-.02462
G1 X129.114 Y114.45 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/45
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
G3 Z8.2 I-.708 J.99 P1  F30000
G1 X130.148 Y115.19 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.216 J-.055 P1  F30000
G1 X126.752 Y114.102 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
M73 P90 R1
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.162 E.92005
G1 X126.36 Y113.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.77 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X128.36 Y113.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.648 J-1.03 P1  F30000
G1 X127.159 Y114.509 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3390
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.569 E.85298
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.221 Y114.49 E-.03832
G1 X127.283 Y114.47 E-.02462
G1 X127.344 Y114.45 E-.02462
G1 X129.114 Y114.45 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/45
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
G3 Z8.4 I-.708 J.99 P1  F30000
G1 X130.148 Y115.19 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
M73 P91 R1
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.216 J-.055 P1  F30000
G1 X126.752 Y114.102 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.162 E.92005
G1 X126.36 Y113.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.77 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X128.36 Y113.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.648 J-1.03 P1  F30000
G1 X127.159 Y114.509 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3390
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.569 E.85298
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.221 Y114.49 E-.03832
G1 X127.283 Y114.47 E-.02462
G1 X127.344 Y114.45 E-.02462
G1 X129.114 Y114.45 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/45
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
G3 Z8.6 I-.708 J.99 P1  F30000
G1 X130.148 Y115.19 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
M73 P92 R1
G1 E-.04 F1800
G17
G3 Z8.8 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.216 J-.055 P1  F30000
G1 X126.752 Y114.102 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.162 E.92005
G1 X126.36 Y113.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
M73 P92 R0
G1 X126.36 Y113.77 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X128.36 Y113.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.648 J-1.03 P1  F30000
G1 X127.159 Y114.509 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3390
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.569 E.85298
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.221 Y114.49 E-.03832
G1 X127.283 Y114.47 E-.02462
G1 X127.344 Y114.45 E-.02462
G1 X129.114 Y114.45 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/45
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
G3 Z8.8 I-.708 J.99 P1  F30000
G1 X130.148 Y115.19 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X130.148 Y114.798 E.01301
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
M73 P93 R0
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.216 J-.055 P1  F30000
G1 X126.752 Y114.102 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.162 E.92005
G1 X126.36 Y113.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.77 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X128.36 Y113.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.648 J-1.03 P1  F30000
G1 X127.159 Y114.509 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3390
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.569 E.85298
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.221 Y114.49 E-.03832
G1 X127.283 Y114.47 E-.02462
G1 X127.344 Y114.45 E-.02462
G1 X129.114 Y114.45 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/45
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
G3 Z9 I-.708 J.99 P1  F30000
G1 X130.148 Y115.19 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X130.148 Y114.798 E.01301
M73 P94 R0
G1 X132.452 Y114.798 E.07643
G1 X132.452 Y141.202 E.87587
G1 X130.148 Y141.202 E.07643
G1 X130.148 Y115.25 E.86088
G1 X130.54 Y115.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.212 J-.105 P1  F30000
G1 X129.852 Y141.202 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X127.548 Y141.202 E.07643
G1 X127.548 Y114.798 E.87587
G1 X129.852 Y114.798 E.07643
G1 X129.852 Y141.142 E.87388
G1 X129.46 Y140.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.216 J-.055 P1  F30000
G1 X126.752 Y114.102 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3390
G1 X133.248 Y114.102 E.21548
G1 X133.248 Y141.898 E.92204
G1 X126.752 Y141.898 E.21548
G1 X126.752 Y114.162 E.92005
G1 X126.36 Y113.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3390
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.77 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X128.36 Y113.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.648 J-1.03 P1  F30000
G1 X127.159 Y114.509 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3390
G1 X127.221 Y114.49 E.00194
; LINE_WIDTH: 0.371223
G1 X127.283 Y114.47 E.00173
; LINE_WIDTH: 0.331684
G1 X127.344 Y114.45 E.00152
; LINE_WIDTH: 0.332161
G1 X132.656 Y114.45 E.12518
G1 X132.717 Y114.47 E.00153
; LINE_WIDTH: 0.410763
G1 X132.779 Y114.49 E.00194
; LINE_WIDTH: 0.450302
G1 X132.841 Y114.509 E.00215
; LINE_WIDTH: 0.431693
G1 X132.85 Y141.406 E.85208
G1 X132.841 Y141.491 E.00271
G1 X132.779 Y141.51 E.00205
; LINE_WIDTH: 0.371223
G1 X132.717 Y141.53 E.00173
; LINE_WIDTH: 0.331684
G1 X132.656 Y141.55 E.00152
; LINE_WIDTH: 0.332161
G1 X127.344 Y141.55 E.12518
G1 X127.283 Y141.53 E.00153
; LINE_WIDTH: 0.410763
G1 X127.221 Y141.51 E.00194
; LINE_WIDTH: 0.450302
G1 X127.159 Y141.491 E.00215
; LINE_WIDTH: 0.431743
G1 X127.159 Y114.569 E.85298
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.221 Y114.49 E-.03832
G1 X127.283 Y114.47 E-.02462
G1 X127.344 Y114.45 E-.02462
G1 X129.114 Y114.45 E-.67245
; WIPE_END
M73 P95 R0
G1 E-.04 F1800
; layer num/total_layer_count: 45/45
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
G3 Z9.2 I-.561 J1.08 P1  F30000
G1 X130.54 Y115.19 Z9.2
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4416
G1 X132.06 Y115.19 E.04671
G1 X132.06 Y140.81 E.78723
G1 X130.54 Y140.81 E.04671
G1 X130.54 Y115.25 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y115.19 E-.57805
G1 X132.06 Y115.669 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.211 J-.125 P1  F30000
G1 X129.46 Y140.81 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F4416
G1 X127.94 Y140.81 E.04671
G1 X127.94 Y115.19 E.78723
G1 X129.46 Y115.19 E.04671
G1 X129.46 Y140.75 E.78539
M204 S10000
; WIPE_START
G1 F24000
G1 X127.94 Y140.81 E-.57805
G1 X127.94 Y140.331 E-.18195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.215 J-.072 P1  F30000
G1 X126.36 Y113.71 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F4416
G1 X133.64 Y113.71 E.22369
G1 X133.64 Y142.29 E.87818
G1 X126.36 Y142.29 E.22369
G1 X126.36 Y113.77 E.87634
M204 S10000
; WIPE_START
G1 F24000
G1 X128.36 Y113.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.208 J1.199 P1  F30000
G1 X133.433 Y114.635 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F4416
G1 X132.715 Y113.917 E.03117
G1 X132.182 Y113.917
G1 X133.433 Y115.168 E.05434
G1 X133.433 Y115.701
G1 X131.649 Y113.917 E.07752
G1 X131.116 Y113.917
G1 X132.181 Y114.983 E.04629
G1 X131.647 Y114.983
G1 X130.582 Y113.917 E.04629
G1 X130.049 Y113.917
G1 X131.114 Y114.983 E.04629
G1 X130.581 Y114.983
G1 X129.516 Y113.917 E.04629
G1 X128.982 Y113.917
G1 X130.333 Y115.268 E.05867
G1 X129.667 Y115.136
G1 X130.333 Y115.801 E.02891
G1 X130.333 Y116.334
G1 X129.667 Y115.669 E.02891
G1 X129.667 Y116.202
G1 X130.333 Y116.867 E.02891
G1 X130.333 Y117.401
G1 X129.667 Y116.735 E.02891
G1 X129.667 Y117.269
G1 X130.333 Y117.934 E.02891
G1 X130.333 Y118.467
G1 X129.667 Y117.802 E.02891
G1 X129.667 Y118.335
G1 X130.333 Y119 E.02891
G1 X130.333 Y119.534
G1 X129.667 Y118.869 E.02891
G1 X129.667 Y119.402
G1 X130.333 Y120.067 E.02891
G1 X130.333 Y120.6
G1 X129.667 Y119.935 E.02891
G1 X129.667 Y120.468
G1 X130.333 Y121.134 E.02891
G1 X130.333 Y121.667
G1 X129.667 Y121.002 E.02891
G1 X129.667 Y121.535
G1 X130.333 Y122.2 E.02891
G1 X130.333 Y122.733
M73 P96 R0
G1 X129.667 Y122.068 E.02891
G1 X129.667 Y122.601
G1 X130.333 Y123.267 E.02891
G1 X130.333 Y123.8
G1 X129.667 Y123.135 E.02891
G1 X129.667 Y123.668
G1 X130.333 Y124.333 E.02891
G1 X130.333 Y124.866
G1 X129.667 Y124.201 E.02891
G1 X129.667 Y124.734
G1 X130.333 Y125.4 E.02891
G1 X130.333 Y125.933
G1 X129.667 Y125.268 E.02891
G1 X129.667 Y125.801
G1 X130.333 Y126.466 E.02891
G1 X130.333 Y127
G1 X129.667 Y126.334 E.02891
G1 X129.667 Y126.868
G1 X130.333 Y127.533 E.02891
G1 X130.333 Y128.066
G1 X129.667 Y127.401 E.02891
G1 X129.667 Y127.934
G1 X130.333 Y128.599 E.02891
G1 X130.333 Y129.133
G1 X129.667 Y128.467 E.02891
G1 X129.667 Y129.001
G1 X130.333 Y129.666 E.02891
G1 X130.333 Y130.199
G1 X129.667 Y129.534 E.02891
G1 X129.667 Y130.067
G1 X130.333 Y130.732 E.02891
G1 X130.333 Y131.266
G1 X129.667 Y130.6 E.02891
G1 X129.667 Y131.134
G1 X130.333 Y131.799 E.02891
G1 X130.333 Y132.332
G1 X129.667 Y131.667 E.02891
G1 X129.667 Y132.2
G1 X130.333 Y132.865 E.02891
G1 X130.333 Y133.399
G1 X129.667 Y132.734 E.02891
G1 X129.667 Y133.267
G1 X130.333 Y133.932 E.02891
G1 X130.333 Y134.465
G1 X129.667 Y133.8 E.02891
G1 X129.667 Y134.333
G1 X130.333 Y134.999 E.02891
G1 X130.333 Y135.532
G1 X129.667 Y134.867 E.02891
G1 X129.667 Y135.4
G1 X130.333 Y136.065 E.02891
G1 X130.333 Y136.598
G1 X129.667 Y135.933 E.02891
G1 X129.667 Y136.466
G1 X130.333 Y137.132 E.02891
G1 X130.333 Y137.665
G1 X129.667 Y137 E.02891
G1 X129.667 Y137.533
G1 X130.333 Y138.198 E.02891
G1 X130.333 Y138.731
G1 X129.667 Y138.066 E.02891
G1 X129.667 Y138.6
G1 X130.333 Y139.265 E.02891
G1 X130.333 Y139.798
G1 X129.667 Y139.133 E.02891
G1 X129.667 Y139.666
G1 X130.333 Y140.331 E.02891
G1 X130.333 Y140.865
G1 X129.667 Y140.199 E.02891
M204 S10000
; WIPE_START
G1 F24000
G1 X130.333 Y140.865 E-.35749
G1 X130.333 Y140.331 E-.20264
G1 X129.961 Y139.959 E-.19987
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.204 J.176 P1  F30000
G1 X133.433 Y116.234 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F4416
G1 X132.267 Y115.069 E.05063
G1 X132.267 Y115.603
G1 X133.433 Y116.768 E.05063
G1 X133.433 Y117.301
G1 X132.267 Y116.136 E.05063
G1 X132.267 Y116.669
G1 X133.433 Y117.834 E.05063
G1 X133.433 Y118.368
G1 X132.267 Y117.202 E.05063
G1 X132.267 Y117.736
G1 X133.433 Y118.901 E.05063
G1 X133.433 Y119.434
G1 X132.267 Y118.269 E.05063
G1 X132.267 Y118.802
G1 X133.433 Y119.967 E.05063
G1 X133.433 Y120.501
G1 X132.267 Y119.335 E.05063
G1 X132.267 Y119.869
G1 X133.433 Y121.034 E.05063
G1 X133.433 Y121.567
G1 X132.267 Y120.402 E.05063
G1 X132.267 Y120.935
G1 X133.433 Y122.1 E.05063
G1 X133.433 Y122.634
G1 X132.267 Y121.469 E.05063
G1 X132.267 Y122.002
G1 X133.433 Y123.167 E.05063
G1 X133.433 Y123.7
G1 X132.267 Y122.535 E.05063
G1 X132.267 Y123.068
G1 X133.433 Y124.234 E.05063
G1 X133.433 Y124.767
G1 X132.267 Y123.602 E.05063
G1 X132.267 Y124.135
G1 X133.433 Y125.3 E.05063
G1 X133.433 Y125.833
G1 X132.267 Y124.668 E.05063
G1 X132.267 Y125.201
G1 X133.433 Y126.367 E.05063
G1 X133.433 Y126.9
G1 X132.267 Y125.735 E.05063
G1 X132.267 Y126.268
G1 X133.433 Y127.433 E.05063
G1 X133.433 Y127.966
G1 X132.267 Y126.801 E.05063
G1 X132.267 Y127.334
G1 X133.433 Y128.5 E.05063
G1 X133.433 Y129.033
G1 X132.267 Y127.868 E.05063
G1 X132.267 Y128.401
G1 X133.433 Y129.566 E.05063
G1 X133.433 Y130.1
G1 X132.267 Y128.934 E.05063
G1 X132.267 Y129.468
G1 X133.433 Y130.633 E.05063
G1 X133.433 Y131.166
G1 X132.267 Y130.001 E.05063
G1 X132.267 Y130.534
G1 X133.433 Y131.699 E.05063
G1 X133.433 Y132.233
G1 X132.267 Y131.067 E.05063
G1 X132.267 Y131.601
G1 X133.433 Y132.766 E.05063
G1 X133.433 Y133.299
G1 X132.267 Y132.134 E.05063
G1 X132.267 Y132.667
G1 X133.433 Y133.832 E.05063
G1 X133.433 Y134.366
G1 X132.267 Y133.2 E.05063
G1 X132.267 Y133.734
G1 X133.433 Y134.899 E.05063
G1 X133.433 Y135.432
G1 X132.267 Y134.267 E.05063
G1 X132.267 Y134.8
G1 X133.433 Y135.965 E.05063
G1 X133.433 Y136.499
G1 X132.267 Y135.334 E.05063
G1 X132.267 Y135.867
G1 X133.433 Y137.032 E.05063
G1 X133.433 Y137.565
G1 X132.267 Y136.4 E.05063
G1 X132.267 Y136.933
G1 X133.433 Y138.099 E.05063
G1 X133.433 Y138.632
M73 P97 R0
G1 X132.267 Y137.467 E.05063
G1 X132.267 Y138
G1 X133.433 Y139.165 E.05063
G1 X133.433 Y139.698
G1 X132.267 Y138.533 E.05063
G1 X132.267 Y139.066
G1 X133.433 Y140.232 E.05063
G1 X133.433 Y140.765
G1 X132.267 Y139.6 E.05063
G1 X132.267 Y140.133
G1 X133.433 Y141.298 E.05063
G1 X133.433 Y141.831
G1 X132.267 Y140.666 E.05063
G1 X132.085 Y141.017
G1 X133.15 Y142.083 E.04629
G1 X132.617 Y142.083
G1 X131.552 Y141.017 E.04629
G1 X131.019 Y141.017
G1 X132.084 Y142.083 E.04629
G1 X131.551 Y142.083
G1 X130.485 Y141.017 E.04629
G1 X131.017 Y142.083
G1 X129.667 Y140.733 E.05867
G1 X129.419 Y141.017
G1 X130.484 Y142.083 E.04629
G1 X129.951 Y142.083
G1 X128.886 Y141.017 E.04629
G1 X128.352 Y141.017
G1 X129.418 Y142.083 E.04629
G1 X128.884 Y142.083
G1 X127.819 Y141.017 E.04629
M204 S10000
; WIPE_START
G1 F24000
G1 X128.884 Y142.083 E-.57245
G1 X129.378 Y142.083 E-.18755
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J.006 P1  F30000
G1 X129.514 Y114.983 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F4416
G1 X128.449 Y113.917 E.04629
G1 X127.916 Y113.917
G1 X128.981 Y114.983 E.04629
G1 X128.448 Y114.983
G1 X127.383 Y113.917 E.04629
G1 X126.849 Y113.917
G1 X127.915 Y114.983 E.04629
G1 X127.733 Y115.334
G1 X126.567 Y114.169 E.05063
G1 X126.567 Y114.702
G1 X127.733 Y115.867 E.05063
G1 X127.733 Y116.4
G1 X126.567 Y115.235 E.05063
G1 X126.567 Y115.769
G1 X127.733 Y116.934 E.05063
G1 X127.733 Y117.467
G1 X126.567 Y116.302 E.05063
G1 X126.567 Y116.835
G1 X127.733 Y118 E.05063
G1 X127.733 Y118.534
G1 X126.567 Y117.368 E.05063
G1 X126.567 Y117.902
G1 X127.733 Y119.067 E.05063
G1 X127.733 Y119.6
G1 X126.567 Y118.435 E.05063
G1 X126.567 Y118.968
G1 X127.733 Y120.133 E.05063
G1 X127.733 Y120.667
G1 X126.567 Y119.501 E.05063
G1 X126.567 Y120.035
G1 X127.733 Y121.2 E.05063
G1 X127.733 Y121.733
G1 X126.567 Y120.568 E.05063
G1 X126.567 Y121.101
G1 X127.733 Y122.266 E.05063
G1 X127.733 Y122.8
G1 X126.567 Y121.634 E.05063
G1 X126.567 Y122.168
G1 X127.733 Y123.333 E.05063
G1 X127.733 Y123.866
G1 X126.567 Y122.701 E.05063
G1 X126.567 Y123.234
G1 X127.733 Y124.4 E.05063
G1 X127.733 Y124.933
G1 X126.567 Y123.768 E.05063
G1 X126.567 Y124.301
G1 X127.733 Y125.466 E.05063
G1 X127.733 Y125.999
G1 X126.567 Y124.834 E.05063
G1 X126.567 Y125.367
G1 X127.733 Y126.533 E.05063
G1 X127.733 Y127.066
G1 X126.567 Y125.901 E.05063
G1 X126.567 Y126.434
G1 X127.733 Y127.599 E.05063
G1 X127.733 Y128.132
G1 X126.567 Y126.967 E.05063
G1 X126.567 Y127.5
G1 X127.733 Y128.666 E.05063
G1 X127.733 Y129.199
G1 X126.567 Y128.034 E.05063
G1 X126.567 Y128.567
G1 X127.733 Y129.732 E.05063
G1 X127.733 Y130.265
G1 X126.567 Y129.1 E.05063
G1 X126.567 Y129.634
G1 X127.733 Y130.799 E.05063
G1 X127.733 Y131.332
G1 X126.567 Y130.167 E.05063
G1 X126.567 Y130.7
G1 X127.733 Y131.865 E.05063
G1 X127.733 Y132.399
G1 X126.567 Y131.233 E.05063
G1 X126.567 Y131.767
G1 X127.733 Y132.932 E.05063
G1 X127.733 Y133.465
G1 X126.567 Y132.3 E.05063
G1 X126.567 Y132.833
G1 X127.733 Y133.998 E.05063
G1 X127.733 Y134.532
G1 X126.567 Y133.366 E.05063
G1 X126.567 Y133.9
G1 X127.733 Y135.065 E.05063
G1 X127.733 Y135.598
G1 X126.567 Y134.433 E.05063
G1 X126.567 Y134.966
G1 X127.733 Y136.131 E.05063
G1 X127.733 Y136.665
G1 X126.567 Y135.5 E.05063
G1 X126.567 Y136.033
G1 X127.733 Y137.198 E.05063
G1 X127.733 Y137.731
G1 X126.567 Y136.566 E.05063
G1 X126.567 Y137.099
G1 X127.733 Y138.265 E.05063
G1 X127.733 Y138.798
G1 X126.567 Y137.633 E.05063
G1 X126.567 Y138.166
G1 X127.733 Y139.331 E.05063
G1 X127.733 Y139.864
G1 X126.567 Y138.699 E.05063
G1 X126.567 Y139.232
G1 X127.733 Y140.398 E.05063
G1 X127.733 Y140.931
G1 X126.567 Y139.766 E.05063
G1 X126.567 Y140.299
G1 X128.351 Y142.083 E.07751
G1 X127.818 Y142.083
G1 X126.567 Y140.832 E.05434
G1 X126.567 Y141.365
G1 X127.285 Y142.083 E.03116
M204 S10000
; WIPE_START
G1 F24000
G1 X126.567 Y141.365 E-.38539
G1 X126.567 Y140.832 E-.20264
G1 X126.887 Y141.152 E-.17197
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.206 J.161 P1  F30000
G1 X130.311 Y115.512 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101927
G1 F4416
G1 X130.331 Y115.38 E.00064
; WIPE_START
G1 F24000
G1 X130.311 Y115.512 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.217 J.007 P1  F30000
G1 X130.453 Y141.034 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.141281
G1 F4416
G1 X130.318 Y141.041 E.00108
G3 X130.262 Y140.935 I.212 J-.18 E.00097
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X130.318 Y141.041 E-.35759
G1 X130.453 Y141.034 E-.40241
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

