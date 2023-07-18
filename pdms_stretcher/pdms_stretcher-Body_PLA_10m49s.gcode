; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 5m 1s; total estimated time: 10m 49s
; total layer number: 30
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
M73 P0 R10
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
M73 P40 R6
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
M73 P41 R6
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

G1 X70 F9000
M73 P43 R6
G1 X76 F15000
M73 P46 R5
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
M73 P47 R5
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
    G29 A X125.55 Y115.35 I8.9 J29.3
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
M73 P48 R5
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
; layer num/total_layer_count: 1/30
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
G1 X127.95 Y114.85 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F2556
G3 X130.221 Y114.886 I.31 J51.31 E.08462
M73 P49 R5
G1 X130.221 Y141.114 E.97689
G3 X127.95 Y141.15 I-1.961 J-51.274 E.08462
G1 X127.95 Y115.75 E.94607
G1 X127.95 Y114.91 E.0313
G1 X127.493 Y114.388 F30000
; FEATURE: Inner wall
G1 F2556
G1 X127.493 Y115.75 E.05074
M73 P50 R5
G1 X127.493 Y141.793 E.97
G1 X126.407 Y141.793 E.04045
G1 X126.407 Y114.207 E1.02747
G1 X127.493 Y114.207 E.04045
G1 X127.493 Y114.328 E.00449
; WIPE_START
G1 F24000
G1 X127.493 Y115.75 E-.54049
G1 X127.493 Y116.328 E-.21951
; WIPE_END
G1 E-.04 F1800
G17
M73 P51 R5
G3 Z.6 I.501 J1.109 P1  F30000
G1 X130.679 Y114.887 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F2556
G3 X132.325 Y114.85 I1.63 J35.888 E.06133
G1 X133.15 Y114.85 E.03074
G1 X133.15 Y141.15 E.97959
G3 X130.679 Y141.113 I-.551 J-45.157 E.09207
G1 X130.679 Y114.947 E.97458
; WIPE_START
G1 F24000
M73 P52 R5
G1 X132.325 Y114.85 E-.62657
G1 X132.676 Y114.85 E-.13343
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.215 J.061 P1  F30000
G1 X134.05 Y142.25 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2556
G1 X125.95 Y142.25 E.30169
G1 X125.95 Y113.75 E1.06152
G1 X134.05 Y113.75 E.30169
G1 X134.05 Y142.19 E1.05928
G1 X133.512 Y141.628 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.685908
G1 F2556
M73 P53 R5
G1 X133.491 Y141.691 E.00346
G1 X133.378 Y141.7 E.00592
G1 X131.451 Y141.695 E.10098
; LINE_WIDTH: 0.703188
G2 X128.855 Y141.699 I-1.23 J42.647 E.13968
G1 X127.722 Y141.7 E.06099
G1 X126.95 Y141.564 F30000
; LINE_WIDTH: 0.67169
G1 F2556
G1 X126.95 Y114.436 E1.38999
G1 X127.722 Y114.3 F30000
; LINE_WIDTH: 0.696313
G1 F2556
G1 X129.371 Y114.305 E.08782
G2 X131.894 Y114.301 I1.194 J-41.719 E.13437
G1 X133.49 Y114.31 E.08498
; LINE_WIDTH: 0.705198
G1 X133.512 Y114.372 E.00357
; LINE_WIDTH: 0.661327
G1 X133.534 Y114.434 E.00333
; LINE_WIDTH: 0.617455
G1 X133.556 Y114.497 E.00309
; LINE_WIDTH: 0.573584
G1 X133.578 Y114.559 E.00286
; LINE_WIDTH: 0.48595
G1 X133.6 Y114.621 E.00239
G1 X133.6 Y141.379 E.966
; LINE_WIDTH: 0.485842
M73 P53 R4
G1 X133.578 Y141.442 E.00238
; LINE_WIDTH: 0.529605
G1 X133.556 Y141.504 E.00262
; LINE_WIDTH: 0.573367
M73 P54 R4
G1 X133.534 Y141.566 E.00285
; LINE_WIDTH: 0.617129
G1 X133.512 Y141.628 E.00309
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.534 Y141.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/30
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
G3 Z.6 I1.193 J-.239 P1  F30000
G1 X128.14 Y114.648 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3814
G1 X133.352 Y114.648 E.17289
G1 X133.352 Y141.352 E.88583
G1 X127.748 Y141.352 E.1859
G1 X127.748 Y114.648 E.88583
G1 X128.08 Y114.648 E.01102
; WIPE_START
G1 F24000
G1 X130.08 Y114.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.558 J1.082 P1  F30000
G1 X130.84 Y115.04 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3814
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F3814
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
M73 P55 R4
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.205 J.17 P1  F30000
G1 X133.848 Y142.048 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3814
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y113.952 E.93199
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y141.988 E.93
G1 X134.24 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3814
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.56 E.8874
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.38 E.88556
M204 S10000
G1 X133.644 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3814
G1 X127.544 Y141.7 E.14354
G1 X130.45 Y141.156 F30000
; LINE_WIDTH: 0.430842
G1 F3814
G1 X130.45 Y114.844 E.83174
G1 X127.544 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3814
G1 X133.644 Y114.3 E.14354
G1 X133.528 Y114.3 F30000
; LINE_WIDTH: 0.176066
G1 F3814
G1 X133.456 Y114.156 E.00175
G1 X133.528 Y114.3 F30000
; LINE_WIDTH: 0.131684
G1 F3814
G1 X133.6 Y114.444 E.00117
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.19668
G1 X133.528 Y141.7 E.00117
; LINE_WIDTH: 0.220448
G1 X133.456 Y141.844 E.00234
; WIPE_START
G1 F24000
G1 X133.528 Y141.7 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.185 J-.276 P1  F30000
G1 X127.356 Y115.194 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.432739
G1 F3814
G1 X127.335 Y114.877 E.01009
G1 X127.203 Y114.827 E.00447
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.420198
G1 X126.544 Y115.194 E.00404
G1 X126.544 Y140.883 E.78977
; LINE_WIDTH: 0.419999
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.420092
G1 X127.217 Y141.189 E.00192
G1 X127.356 Y141.127 E.00467
G1 X127.356 Y115.254 E.79521
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3814
G1 X126.95 Y115.254 E.90766
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P56 R4
G1 F24000
G1 X126.95 Y117.254 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/30
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
G3 Z.8 I1.107 J.506 P1  F30000
G1 X128.14 Y114.648 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3793
G1 X133.352 Y114.648 E.17289
G1 X133.352 Y141.352 E.88583
G1 X127.748 Y141.352 E.1859
G1 X127.748 Y114.648 E.88583
G1 X128.08 Y114.648 E.01102
; WIPE_START
G1 F24000
G1 X130.08 Y114.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.558 J1.082 P1  F30000
G1 X130.84 Y115.04 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3793
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F3793
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.205 J.17 P1  F30000
G1 X133.848 Y142.048 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3793
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y113.952 E.93199
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y141.988 E.93
G1 X134.24 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3793
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.56 E.8874
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.38 E.88556
M204 S10000
G1 X133.644 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3793
G1 X127.544 Y141.7 E.14354
G1 X130.45 Y141.156 F30000
; LINE_WIDTH: 0.430842
G1 F3793
G1 X130.45 Y114.844 E.83174
G1 X127.544 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3793
G1 X133.644 Y114.3 E.14354
G1 X133.528 Y114.3 F30000
; LINE_WIDTH: 0.176066
G1 F3793
G1 X133.456 Y114.156 E.00175
G1 X133.528 Y114.3 F30000
; LINE_WIDTH: 0.131684
G1 F3793
G1 X133.6 Y114.444 E.00117
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.19668
G1 X133.528 Y141.7 E.00117
; LINE_WIDTH: 0.220448
G1 X133.456 Y141.844 E.00234
; WIPE_START
G1 F24000
G1 X133.528 Y141.7 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.185 J-.276 P1  F30000
G1 X127.356 Y115.194 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.432739
G1 F3793
G1 X127.335 Y114.877 E.01009
G1 X127.203 Y114.827 E.00447
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
M73 P57 R4
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.420198
G1 X126.544 Y115.194 E.00404
G1 X126.544 Y140.883 E.78977
; LINE_WIDTH: 0.419999
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.420092
G1 X127.217 Y141.189 E.00192
G1 X127.356 Y141.127 E.00467
G1 X127.356 Y115.254 E.79521
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3793
G1 X126.95 Y115.254 E.90766
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.95 Y117.254 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/30
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
G3 Z1 I1.107 J.506 P1  F30000
G1 X128.14 Y114.648 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3308
G1 X133.352 Y114.648 E.17289
G1 X133.352 Y141.352 E.88583
G1 X127.748 Y141.352 E.1859
G1 X127.748 Y114.648 E.88583
G1 X128.08 Y114.648 E.01102
; WIPE_START
G1 F24000
G1 X130.08 Y114.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.558 J1.082 P1  F30000
G1 X130.84 Y115.04 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3308
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F3308
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.205 J.17 P1  F30000
G1 X133.848 Y142.048 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3308
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y113.952 E.93199
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y141.988 E.93
G1 X134.24 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3308
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.56 E.8874
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.38 E.88556
M204 S10000
G1 X133.644 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3308
G1 X127.544 Y141.7 E.14354
G1 X126.719 Y141.7 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3308
G1 X127.196 Y141.7 E.01581
M73 P58 R4
G1 X127.196 Y141.186 E.01704
G1 X127.4 Y141.186 E.00675
G1 X127.4 Y140.752 E.01441
G1 X126.5 Y139.852 E.04219
G1 X126.5 Y139.176 E.02245
G1 X127.4 Y138.276 E.04219
G1 X127.4 Y133.076 E.17252
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y117.724 E.17252
G1 X126.5 Y116.824 E.04219
G1 X126.5 Y116.148 E.02245
G1 X127.4 Y115.248 E.04219
G1 X127.4 Y114.814 E.01441
G1 X127.196 Y114.814 E.00675
G1 X127.196 Y114.3 E.01704
G1 X126.719 Y114.3 E.01581
G1 X127.544 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3308
G1 X133.644 Y114.3 E.14354
G1 X133.456 Y114.156 F30000
; LINE_WIDTH: 0.176066
G1 F3308
G1 X133.528 Y114.3 E.00175
; LINE_WIDTH: 0.131684
G1 X133.6 Y114.444 E.00117
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.19668
G1 X133.528 Y141.7 E.00117
; LINE_WIDTH: 0.220448
G1 X133.456 Y141.844 E.00234
G1 X130.45 Y141.156 F30000
; LINE_WIDTH: 0.430842
G1 F3308
G1 X130.45 Y114.844 E.83174
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.45 Y116.844 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/30
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
G3 Z1.2 I.838 J-.882 P1  F30000
G1 X128.14 Y114.648 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3308
G1 X133.352 Y114.648 E.17289
G1 X133.352 Y141.352 E.88583
G1 X127.748 Y141.352 E.1859
G1 X127.748 Y114.648 E.88583
G1 X128.08 Y114.648 E.01102
; WIPE_START
G1 F24000
M73 P59 R4
G1 X130.08 Y114.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.558 J1.082 P1  F30000
G1 X130.84 Y115.04 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3308
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F3308
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.205 J.17 P1  F30000
G1 X133.848 Y142.048 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3308
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y113.952 E.93199
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y141.988 E.93
G1 X134.24 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3308
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.56 E.8874
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.38 E.88556
M204 S10000
G1 X133.644 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3308
G1 X127.544 Y141.7 E.14354
G1 X126.719 Y141.7 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3308
G1 X127.196 Y141.7 E.01581
G1 X127.196 Y141.186 E.01704
G1 X127.4 Y141.186 E.00675
G1 X127.4 Y140.752 E.01441
G1 X126.5 Y139.852 E.04219
G1 X126.5 Y139.176 E.02245
G1 X127.4 Y138.276 E.04219
G1 X127.4 Y133.076 E.17252
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y117.724 E.17252
G1 X126.5 Y116.824 E.04219
G1 X126.5 Y116.148 E.02245
G1 X127.4 Y115.248 E.04219
G1 X127.4 Y114.814 E.01441
G1 X127.196 Y114.814 E.00675
G1 X127.196 Y114.3 E.01704
G1 X126.719 Y114.3 E.01581
G1 X127.544 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3308
G1 X133.644 Y114.3 E.14354
G1 X133.456 Y114.156 F30000
; LINE_WIDTH: 0.176066
G1 F3308
G1 X133.528 Y114.3 E.00175
; LINE_WIDTH: 0.131684
G1 X133.6 Y114.444 E.00117
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.19668
G1 X133.528 Y141.7 E.00117
; LINE_WIDTH: 0.220448
G1 X133.456 Y141.844 E.00234
G1 X130.45 Y141.156 F30000
; LINE_WIDTH: 0.430842
G1 F3308
G1 X130.45 Y114.844 E.83174
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.45 Y116.844 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/30
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
M73 P60 R4
G3 Z1.4 I.838 J-.882 P1  F30000
G1 X128.14 Y114.648 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3643
G1 X133.352 Y114.648 E.17289
G1 X133.352 Y141.352 E.88583
G1 X127.748 Y141.352 E.1859
G1 X127.748 Y114.648 E.88583
G1 X128.08 Y114.648 E.01102
; WIPE_START
G1 F24000
G1 X130.08 Y114.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.558 J1.082 P1  F30000
G1 X130.84 Y115.04 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3643
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F3643
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.205 J.17 P1  F30000
G1 X133.848 Y142.048 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3643
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y113.952 E.93199
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y141.988 E.93
G1 X134.24 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3643
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.56 E.8874
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.38 E.88556
M204 S10000
G1 X133.644 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3643
G1 X127.544 Y141.7 E.14354
G1 X130.45 Y141.156 F30000
; LINE_WIDTH: 0.430842
G1 F3643
G1 X130.45 Y114.844 E.83174
G1 X127.544 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3643
G1 X133.644 Y114.3 E.14354
G1 X133.528 Y114.3 F30000
; LINE_WIDTH: 0.131684
G1 F3643
G1 X133.6 Y114.444 E.00117
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.19668
G1 X133.528 Y141.7 E.00117
; LINE_WIDTH: 0.220448
G1 X133.456 Y141.844 E.00234
; WIPE_START
G1 F24000
G1 X133.528 Y141.7 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.976 J-.726 P1  F30000
G1 X127.356 Y133.403 Z1.6
G1 Z1.2
M73 P61 R4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3643
G1 X126.544 Y133.403 E.02494
G1 X126.544 Y141.297 E.24254
G1 X127.167 Y141.297 E.01915
G1 X127.217 Y141.189 E.00365
G1 X127.356 Y141.127 E.00467
G1 X127.356 Y133.463 E.23548
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3643
G1 X126.95 Y133.869 E.24839
G1 X127.4 Y131.447 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3643
G1 X127.4 Y133.011 E.05188
G1 X127.335 Y133.011 E.00213
G1 X126.5 Y132.176 E.03917
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X126.635 Y123.689 E.00633
G1 X127.4 Y123.689 E.02535
G1 X127.4 Y124.553 E.02866
G1 X127.356 Y123.297 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3643
G1 X127.356 Y115.403 E.24254
G1 X126.544 Y115.403 E.02494
G1 X126.544 Y123.297 E.24254
G1 X127.296 Y123.297 E.0231
G1 X126.95 Y122.891 F30000
; LINE_WIDTH: 0.477526
G1 F3643
G1 X126.95 Y115.869 E.24867
; WIPE_START
G1 F24000
G1 X126.95 Y117.869 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.603 J1.057 P1  F30000
G1 X133.456 Y114.156 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.176066
G1 F3643
G1 X133.528 Y114.3 E.00175
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.456 Y114.156 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/30
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
G3 Z1.6 I-.112 J-1.212 P1  F30000
G1 X128.14 Y114.648 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3641
G1 X133.352 Y114.648 E.17289
G1 X133.352 Y141.352 E.88583
G1 X127.748 Y141.352 E.1859
G1 X127.748 Y114.648 E.88583
G1 X128.08 Y114.648 E.01102
; WIPE_START
G1 F24000
G1 X130.08 Y114.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.558 J1.082 P1  F30000
G1 X130.84 Y115.04 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3641
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F3641
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
M73 P62 R4
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.205 J.17 P1  F30000
G1 X133.848 Y142.048 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3641
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y113.952 E.93199
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y141.988 E.93
G1 X134.24 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3641
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.56 E.8874
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.38 E.88556
M204 S10000
G1 X133.644 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3641
G1 X127.544 Y141.7 E.14354
G1 X130.45 Y141.156 F30000
; LINE_WIDTH: 0.430842
G1 F3641
G1 X130.45 Y114.844 E.83174
G1 X127.544 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3641
G1 X133.644 Y114.3 E.14354
G1 X133.528 Y114.3 F30000
; LINE_WIDTH: 0.131684
G1 F3641
G1 X133.6 Y114.444 E.00117
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.19668
G1 X133.528 Y141.7 E.00117
; LINE_WIDTH: 0.220448
G1 X133.456 Y141.844 E.00234
; WIPE_START
G1 F24000
G1 X133.528 Y141.7 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.976 J-.726 P1  F30000
G1 X127.356 Y133.403 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3641
G1 X126.544 Y133.403 E.02494
G1 X126.544 Y141.297 E.24254
G1 X127.167 Y141.297 E.01915
G1 X127.217 Y141.189 E.00365
G1 X127.356 Y141.127 E.00467
G1 X127.356 Y133.463 E.23548
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3641
G1 X126.95 Y133.869 E.24839
G1 X127.4 Y131.447 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3641
G1 X127.4 Y133.011 E.05188
G1 X127.335 Y133.011 E.00213
G1 X126.5 Y132.176 E.03917
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X126.635 Y123.689 E.00633
G1 X127.4 Y123.689 E.02535
G1 X127.4 Y124.553 E.02866
G1 X127.356 Y123.297 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3641
G1 X127.356 Y115.403 E.24254
G1 X126.544 Y115.403 E.02494
G1 X126.544 Y123.297 E.24254
G1 X127.296 Y123.297 E.0231
G1 X126.95 Y122.891 F30000
; LINE_WIDTH: 0.477526
M73 P63 R4
G1 F3641
G1 X126.95 Y115.869 E.24867
; WIPE_START
G1 F24000
G1 X126.95 Y117.869 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.603 J1.057 P1  F30000
G1 X133.456 Y114.156 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.176066
G1 F3641
M73 P63 R3
G1 X133.528 Y114.3 E.00175
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.456 Y114.156 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/30
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
G3 Z1.8 I-.937 J-.776 P1  F30000
G1 X127.748 Y121.048 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3765
G1 X127.748 Y135.652 E.48443
G1 X126.152 Y135.652 E.05294
G1 X126.152 Y121.048 E.48443
G1 X127.688 Y121.048 E.05095
; WIPE_START
G1 F24000
G1 X127.696 Y123.048 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.158 J.375 P1  F30000
G1 X133.848 Y142.048 Z2
G1 Z1.6
G1 E.8 F1800
G1 F3765
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y139.048 E.09951
G1 X127.748 Y139.048 E.05294
G1 X127.748 Y141.352 E.07642
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y117.652 E.09964
G1 X126.152 Y117.652 E.05294
G1 X126.152 Y113.952 E.12273
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y141.988 E.93
; WIPE_START
G1 F24000
G1 X131.848 Y142.004 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.216 J-.045 P1  F30000
G1 X130.84 Y115.04 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3765
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F3765
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.203 J.184 P1  F30000
G1 X134.24 Y142.44 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F3765
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.56 E.8874
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.38 E.88556
M204 S10000
G1 X133.644 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3765
G1 X127.544 Y141.7 E.14354
G1 X127.309 Y141.152 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.405846
G1 F3765
G1 X127.051 Y141.17 E.00766
; LINE_WIDTH: 0.474447
G3 X126.574 Y141.189 I-.368 J-3.319 E.0168
G1 X126.574 Y141.626 E.01537
G1 X127.122 Y141.626 E.01928
G1 X127.125 Y141.331 E.01038
; LINE_WIDTH: 0.475141
G1 X127.196 Y141.262 E.00347
; LINE_WIDTH: 0.440494
G1 X127.266 Y141.194 E.00319
G1 X126.914 Y140.952 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3765
G1 X127.526 Y140.34 E.02658
G1 X127.526 Y139.807
G1 X126.381 Y140.952 E.04975
G1 X126.374 Y140.424
G1 X127.526 Y139.273 E.05002
G1 X126.995 Y139.271
G1 X126.374 Y139.891 E.02696
M204 S10000
G1 X127.44 Y138.826 F30000
M204 S2000
G1 F3765
G1 X127.933 Y138.333 E.02142
G1 X127.933 Y137.8
G1 X126.907 Y138.826 E.04459
G1 X126.373 Y138.826
M73 P64 R3
G1 X127.933 Y137.266 E.06776
G1 X127.933 Y136.733
G1 X125.967 Y138.698 E.0854
G1 X125.967 Y138.165
G1 X127.933 Y136.2 E.0854
G1 X127.725 Y135.874
G1 X125.967 Y137.632 E.07638
G1 X125.967 Y137.099
G1 X127.192 Y135.874 E.05321
G1 X126.659 Y135.874
G1 X125.967 Y136.565 E.03003
M204 S10000
G1 X127.103 Y135.429 F30000
M204 S2000
G1 F3765
G1 X127.526 Y135.007 E.01835
G1 X127.526 Y134.474
G1 X126.57 Y135.429 E.04152
G1 X126.374 Y135.092
G1 X127.526 Y133.941 E.05002
G1 X127.184 Y133.748
G1 X126.374 Y134.558 E.0352
M204 S10000
G1 X126.5 Y133.247 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3765
G1 X126.5 Y133.526 E.00924
G1 X127.4 Y133.526 E.02983
G1 X127.4 Y133.076 E.01494
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.15 Y123.174 E.03048
G1 X127.4 Y123.174 E.00828
G1 X127.4 Y124.553 E.04573
G1 X127.526 Y122.209 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3765
G1 X126.783 Y122.952 E.03228
G1 X126.374 Y122.827
G1 X127.526 Y121.675 E.05002
G1 X127.397 Y121.271
G1 X126.374 Y122.293 E.04444
G1 X126.374 Y121.76
G1 X126.864 Y121.271 E.02126
M204 S10000
G1 X127.933 Y120.202 F30000
M204 S2000
G1 F3765
G1 X127.309 Y120.826 E.02712
G1 X126.775 Y120.826
G1 X127.933 Y119.669 E.05029
G1 X127.933 Y119.135
G1 X126.242 Y120.826 E.07346
G1 X125.967 Y120.567
G1 X127.933 Y118.602 E.0854
G1 X127.933 Y118.069
G1 X125.967 Y120.034 E.0854
G1 X125.967 Y119.501
G1 X127.594 Y117.874 E.07068
G1 X127.061 Y117.874
G1 X125.967 Y118.967 E.04751
G1 X125.967 Y118.434
G1 X126.527 Y117.874 E.02433
M204 S10000
G1 X127.951 Y117.902 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136765
G1 F3765
G2 X127.664 Y117.944 I-.093 J.368 E.00228
G1 X126.972 Y117.429 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3765
G1 X127.526 Y116.876 E.02405
G1 X127.526 Y116.343
G1 X126.439 Y117.429 E.04722
G1 X126.374 Y116.961
G1 X127.526 Y115.809 E.05002
G1 X127.053 Y115.748
G1 X126.374 Y116.427 E.0295
M204 S10000
G1 X127.247 Y115.432 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.637302
G1 F3765
G1 X127.247 Y114.931 E.02426
G1 X127.145 Y114.893 E.00526
G1 X127.128 Y114.812 E.00404
; LINE_WIDTH: 0.60338
G1 X127.112 Y114.73 E.00381
; LINE_WIDTH: 0.538978
G3 X127.095 Y114.402 I.781 J-.205 E.01337
G1 X126.602 Y114.402 E.01991
; LINE_WIDTH: 0.535536
G1 X126.619 Y114.64 E.00959
; LINE_WIDTH: 0.569458
G1 X126.636 Y114.879 E.01026
; LINE_WIDTH: 0.629854
G3 X126.653 Y115.432 I-3.883 J.396 E.02651
G1 X127.187 Y115.432 E.02556
G1 X127.544 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3765
G1 X133.644 Y114.3 E.14354
G1 X133.528 Y114.3 F30000
; LINE_WIDTH: 0.131684
G1 F3765
G1 X133.6 Y114.444 E.00117
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.19668
G1 X133.528 Y141.7 E.00117
; LINE_WIDTH: 0.220448
G1 X133.456 Y141.844 E.00234
G1 X130.45 Y141.156 F30000
; LINE_WIDTH: 0.430842
G1 F3765
G1 X130.45 Y114.844 E.83174
G1 X133.456 Y114.156 F30000
; LINE_WIDTH: 0.176066
G1 F3765
G1 X133.528 Y114.3 E.00175
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.456 Y114.156 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/30
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
G3 Z2 I-1.178 J-.306 P1  F30000
G1 X127.748 Y136.127 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3487
G1 X126.152 Y136.127 E.05294
G1 X126.152 Y120.573 E.51599
G1 X127.748 Y120.573 E.05294
G1 X127.748 Y136.067 E.514
; WIPE_START
G1 F24000
G1 X126.152 Y136.127 E-.60685
G1 X126.152 Y135.724 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.062 J.595 P1  F30000
G1 X127.748 Y138.573 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F3487
G1 X127.748 Y141.352 E.0922
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y118.127 E.11542
G1 X126.152 Y118.127 E.05294
G1 X126.152 Y113.952 E.13851
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y138.573 E.11529
G1 X127.688 Y138.573 E.05095
; WIPE_START
G1 F24000
G1 X127.731 Y140.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.208 J.147 P1  F30000
G1 X130.84 Y115.04 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3487
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.001 J-1.217 P1  F30000
M73 P65 R3
G1 X128.14 Y115.04 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F3487
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.211 J-.121 P1  F30000
G1 X127.76 Y138.18 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F3487
G1 X127.76 Y136.52 E.05103
G1 X125.76 Y136.52 E.06145
G1 X125.76 Y120.18 E.50206
G1 X127.76 Y120.18 E.06145
G1 X127.76 Y118.52 E.05103
G1 X125.76 Y118.52 E.06145
G1 X125.76 Y113.56 E.15239
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y138.18 E.13088
G1 X127.7 Y138.18 E.05961
M204 S10000
G1 X127.356 Y138.965 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3487
G1 X126.544 Y138.965 E.02494
G1 X126.544 Y140.883 E.05894
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421038
G1 X127.217 Y141.189 E.00193
G1 X127.356 Y141.127 E.00468
G1 X127.356 Y139.025 E.06478
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3487
G1 X126.95 Y139.43 E.05144
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3487
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.220448
G1 F3487
G1 X133.456 Y141.844 E.00234
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3487
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3487
G1 X127.544 Y114.3 E.14354
G1 X130.45 Y114.844 F30000
; LINE_WIDTH: 0.430842
G1 F3487
G1 X130.45 Y141.156 E.83174
; WIPE_START
G1 F24000
G1 X130.45 Y139.156 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.825 J-.894 P1  F30000
G1 X126.639 Y135.64 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.610274
G1 F3487
G1 X127.197 Y135.64 E.02577
G1 X127.4 Y134.704 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3487
G1 X127.4 Y133.076 E.05401
M73 P66 R3
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.547 E.04569
G1 X127.149 Y121.547 E.00832
G1 X126.643 Y121.06 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.610274
G1 F3487
G1 X127.201 Y121.06 E.02577
; WIPE_START
G1 F24000
G1 X126.643 Y121.06 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.19 J.255 P1  F30000
G1 X127.356 Y117.735 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.421946
G1 F3487
G1 X127.356 Y115.194 E.07851
G1 X127.335 Y114.877 E.00981
G1 X127.203 Y114.827 E.00435
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534292
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.4215
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y117.735 E.07841
G1 X127.296 Y117.735 E.02319
G1 X126.95 Y117.33 F30000
; LINE_WIDTH: 0.477526
G1 F3487
G1 X126.95 Y115.254 E.07352
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.95 Y117.254 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/30
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
G3 Z2.2 I-1.216 J.052 P1  F30000
G1 X127.748 Y135.819 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3454
G1 X126.152 Y135.819 E.05294
G1 X126.152 Y120.881 E.49551
G1 X127.748 Y120.881 E.05294
G1 X127.748 Y135.759 E.49352
; WIPE_START
G1 F24000
G1 X126.152 Y135.819 E-.60685
G1 X126.152 Y135.416 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.105 J.509 P1  F30000
G1 X127.748 Y138.881 Z2.4
G1 Z2
G1 E.8 F1800
G1 F3454
G1 X127.748 Y141.352 E.08196
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y117.819 E.10519
G1 X126.152 Y117.819 E.05294
G1 X126.152 Y113.952 E.12827
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y138.881 E.10505
G1 X127.688 Y138.881 E.05095
; WIPE_START
G1 F24000
G1 X127.737 Y140.881 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.208 J.145 P1  F30000
G1 X130.84 Y115.04 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3454
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F3454
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.211 J-.119 P1  F30000
G1 X127.76 Y138.489 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F3454
G1 X127.76 Y136.211 E.07
G1 X125.76 Y136.211 E.06145
G1 X125.76 Y120.489 E.48309
G1 X127.76 Y120.489 E.06145
G1 X127.76 Y118.211 E.07
G1 X125.76 Y118.211 E.06145
G1 X125.76 Y113.56 E.14291
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y138.489 E.1214
G1 X127.7 Y138.489 E.05961
M204 S10000
G1 X127.356 Y139.273 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3454
G1 X126.544 Y139.273 E.02494
G1 X126.544 Y140.883 E.04946
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526318
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421198
G1 X127.217 Y141.189 E.00193
G1 X127.356 Y141.127 E.00468
G1 X127.356 Y139.333 E.0553
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3454
G1 X126.95 Y139.739 E.04051
M73 P67 R3
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3454
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3454
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3454
G1 X127.544 Y114.3 E.14354
G1 X130.45 Y114.844 F30000
; LINE_WIDTH: 0.430842
G1 F3454
G1 X130.45 Y141.156 E.83174
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3454
G1 X133.528 Y141.7 E.00234
; WIPE_START
G1 F24000
G1 X133.456 Y141.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.928 J-.787 P1  F30000
G1 X127.4 Y134.704 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3454
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.296 E.05401
; WIPE_START
G1 F24000
G1 X127.4 Y122.924 E-.61876
G1 X127.137 Y123.187 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.216 J.046 P1  F30000
G1 X127.356 Y117.427 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42217
G1 F3454
G1 X127.356 Y115.194 E.06902
G1 X127.335 Y114.877 E.00982
G1 X127.203 Y114.827 E.00435
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.421648
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y117.427 E.06892
G1 X127.296 Y117.427 E.0232
G1 X126.95 Y117.021 F30000
; LINE_WIDTH: 0.477526
G1 F3454
G1 X126.95 Y115.254 E.06259
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.95 Y117.021 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/30
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
G3 Z2.4 I-1.216 J.052 P1  F30000
G1 X127.748 Y135.62 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3399
G1 X126.152 Y135.62 E.05294
G1 X126.152 Y121.08 E.48233
G1 X127.748 Y121.08 E.05294
G1 X127.748 Y135.56 E.48034
; WIPE_START
G1 F24000
G1 X126.152 Y135.62 E-.60685
G1 X126.152 Y135.217 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.125 J.465 P1  F30000
G1 X127.748 Y139.08 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F3399
G1 X127.748 Y141.352 E.07537
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y117.62 E.09859
G1 X126.152 Y117.62 E.05294
G1 X126.152 Y113.952 E.12168
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y139.08 E.09846
G1 X127.688 Y139.08 E.05095
; WIPE_START
G1 F24000
G1 X127.741 Y141.079 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.208 J.144 P1  F30000
G1 X130.84 Y115.04 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3399
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F3399
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
M73 P68 R3
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.211 J-.118 P1  F30000
G1 X127.76 Y138.688 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F3399
G1 X127.76 Y136.012 E.08221
G1 X125.76 Y136.012 E.06145
G1 X125.76 Y120.688 E.47088
G1 X127.76 Y120.688 E.06145
G1 X127.76 Y118.012 E.08221
G1 X125.76 Y118.012 E.06145
G1 X125.76 Y113.56 E.1368
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y138.688 E.11529
G1 X127.7 Y138.688 E.05961
M204 S10000
G1 X127.356 Y139.472 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3399
G1 X126.544 Y139.472 E.02494
G1 X126.544 Y140.883 E.04335
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421332
G3 X127.341 Y141.142 I.168 J.103 E.0061
G1 X127.356 Y140.883 E.00801
G1 X127.356 Y139.532 E.04165
G1 X126.95 Y139.878 F30000
; LINE_WIDTH: 0.477526
G1 F3399
G1 X126.95 Y140.823 E.03347
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3399
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3399
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3399
G1 X127.544 Y114.3 E.14354
G1 X127.356 Y117.228 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422343
G1 F3399
G1 X127.356 Y115.194 E.0629
G1 X127.335 Y114.877 E.00982
G1 X127.203 Y114.827 E.00435
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.421761
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y117.228 E.06281
G1 X127.296 Y117.228 E.02321
G1 X126.95 Y116.822 F30000
; LINE_WIDTH: 0.477526
G1 F3399
G1 X126.95 Y115.254 E.05555
G1 X130.45 Y114.844 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F3399
M73 P69 R3
G1 X130.45 Y141.156 E.83174
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3399
G1 X133.528 Y141.7 E.00234
; WIPE_START
G1 F24000
G1 X133.456 Y141.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.928 J-.787 P1  F30000
G1 X127.4 Y134.704 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3399
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.428 E.04963
G1 X127.268 Y121.428 E.00438
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.4 Y121.428 E-.05019
G1 X127.4 Y122.924 E-.56857
G1 X127.137 Y123.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/30
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
G3 Z2.6 I-1.215 J.06 P1  F30000
G1 X127.748 Y135.482 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3380
G1 X126.152 Y135.482 E.05294
G1 X126.152 Y121.218 E.47317
G1 X127.748 Y121.218 E.05294
G1 X127.748 Y135.422 E.47118
; WIPE_START
G1 F24000
G1 X126.152 Y135.482 E-.60685
G1 X126.152 Y135.079 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.135 J.438 P1  F30000
G1 X127.748 Y139.218 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3380
G1 X127.748 Y141.352 E.07079
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y117.482 E.09401
G1 X126.152 Y117.482 E.05294
G1 X126.152 Y113.952 E.1171
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y139.218 E.09388
G1 X127.688 Y139.218 E.05095
; WIPE_START
G1 F24000
G1 X127.744 Y141.217 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.209 J.143 P1  F30000
G1 X130.84 Y115.04 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3380
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F3380
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.211 J-.118 P1  F30000
G1 X127.76 Y138.826 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F3380
G1 X127.76 Y135.874 E.0907
G1 X125.76 Y135.874 E.06145
G1 X125.76 Y120.826 E.46239
G1 X127.76 Y120.826 E.06145
G1 X127.76 Y117.874 E.0907
G1 X125.76 Y117.874 E.06145
G1 X125.76 Y113.56 E.13256
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y138.826 E.11105
G1 X127.7 Y138.826 E.05961
M204 S10000
G1 X127.356 Y139.61 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3380
G1 X126.544 Y139.61 E.02494
G1 X126.544 Y140.883 E.03911
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421439
G1 X127.217 Y141.189 E.00193
G1 X127.356 Y141.127 E.00469
G1 X127.356 Y139.67 E.04494
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3380
G1 X126.95 Y140.076 E.02858
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3380
M73 P70 R3
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3380
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3380
G1 X127.544 Y114.3 E.14354
G1 X127.356 Y117.09 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42248
G1 F3380
G1 X127.356 Y115.194 E.05866
G1 X127.335 Y114.877 E.00983
G1 X127.203 Y114.827 E.00436
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.421848
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y117.09 E.05856
G1 X127.296 Y117.09 E.02321
G1 X126.95 Y116.684 F30000
; LINE_WIDTH: 0.477526
G1 F3380
G1 X126.95 Y115.254 E.05066
G1 X130.45 Y114.844 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F3380
G1 X130.45 Y141.156 E.83174
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3380
G1 X133.528 Y141.7 E.00234
; WIPE_START
G1 F24000
G1 X133.456 Y141.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.928 J-.787 P1  F30000
G1 X127.4 Y134.704 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3380
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.566 E.04505
G1 X127.13 Y121.566 E.00896
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.4 Y121.566 E-.10265
G1 X127.4 Y122.924 E-.51611
G1 X127.137 Y123.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/30
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
G3 Z2.8 I-1.215 J.061 P1  F30000
G1 X127.748 Y135.398 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3370
G1 X126.152 Y135.398 E.05294
G1 X126.152 Y121.302 E.4676
G1 X127.748 Y121.302 E.05294
G1 X127.748 Y135.338 E.46561
; WIPE_START
G1 F24000
G1 X126.152 Y135.398 E-.60685
G1 X126.152 Y134.995 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.141 J.423 P1  F30000
G1 X127.748 Y139.302 Z3
G1 Z2.6
G1 E.8 F1800
G1 F3370
G1 X127.748 Y141.352 E.068
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y117.398 E.09123
G1 X126.152 Y117.398 E.05294
G1 X126.152 Y113.952 E.11431
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y139.302 E.09109
G1 X127.688 Y139.302 E.05095
; WIPE_START
G1 F24000
G1 X127.746 Y141.301 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.209 J.142 P1  F30000
G1 X130.84 Y115.04 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3370
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F3370
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.211 J-.117 P1  F30000
G1 X127.76 Y138.91 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F3370
G1 X127.76 Y135.79 E.09586
G1 X125.76 Y135.79 E.06145
G1 X125.76 Y120.91 E.45723
G1 X127.76 Y120.91 E.06145
M73 P71 R3
G1 X127.76 Y117.79 E.09586
G1 X125.76 Y117.79 E.06145
G1 X125.76 Y113.56 E.12998
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y138.91 E.10847
G1 X127.7 Y138.91 E.05961
M204 S10000
G1 X127.356 Y139.694 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3370
G1 X126.544 Y139.694 E.02494
G1 X126.544 Y140.883 E.03653
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421515
G1 X127.217 Y141.189 E.00193
G1 X127.356 Y141.127 E.00469
G1 X127.356 Y139.754 E.04236
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3370
G1 X126.95 Y140.16 E.0256
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3370
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3370
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3370
G1 X127.544 Y114.3 E.14354
G1 X127.356 Y117.006 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422572
G1 F3370
G1 X127.356 Y115.194 E.05607
G1 X127.335 Y114.877 E.00983
G1 X127.203 Y114.827 E.00436
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.421906
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y117.006 E.05597
G1 X127.296 Y117.006 E.02321
G1 X126.95 Y116.6 F30000
; LINE_WIDTH: 0.477526
G1 F3370
G1 X126.95 Y115.254 E.04769
G1 X130.45 Y114.844 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F3370
G1 X130.45 Y141.156 E.83174
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3370
G1 X133.528 Y141.7 E.00234
; WIPE_START
G1 F24000
G1 X133.456 Y141.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.928 J-.787 P1  F30000
G1 X127.4 Y134.704 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3370
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.65 E.04227
G1 X127.046 Y121.65 E.01175
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P72 R3
G1 X127.4 Y121.65 E-.13457
G1 X127.4 Y122.924 E-.48419
G1 X127.137 Y123.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/30
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
G3 Z3 I-1.215 J.061 P1  F30000
G1 X127.748 Y135.334 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3363
G1 X126.152 Y135.334 E.05294
G1 X126.152 Y121.366 E.46337
G1 X127.748 Y121.366 E.05294
G1 X127.748 Y135.274 E.46138
; WIPE_START
G1 F24000
G1 X126.152 Y135.334 E-.60685
G1 X126.152 Y134.931 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.145 J.412 P1  F30000
G1 X127.748 Y139.366 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F3363
G1 X127.748 Y141.352 E.06589
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y117.334 E.08911
G1 X126.152 Y117.334 E.05294
G1 X126.152 Y113.952 E.1122
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y139.366 E.08898
G1 X127.688 Y139.366 E.05095
; WIPE_START
G1 F24000
G1 X127.748 Y141.352 E-.75518
G1 X127.761 Y141.352 E-.00482
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.209 J.141 P1  F30000
G1 X130.84 Y115.04 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3363
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F3363
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.211 J-.117 P1  F30000
M73 P72 R2
G1 X127.76 Y138.974 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F3363
G1 X127.76 Y135.726 E.09978
G1 X125.76 Y135.726 E.06145
G1 X125.76 Y120.974 E.45331
G1 X127.76 Y120.974 E.06145
G1 X127.76 Y117.726 E.09978
G1 X125.76 Y117.726 E.06145
G1 X125.76 Y113.56 E.12802
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y138.974 E.10651
G1 X127.7 Y138.974 E.05961
M204 S10000
G1 X127.356 Y139.758 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3363
G1 X126.544 Y139.758 E.02494
G1 X126.544 Y140.883 E.03457
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421579
G1 X127.217 Y141.189 E.00193
G1 X127.356 Y141.127 E.00469
G1 X127.356 Y139.818 E.0404
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3363
G1 X126.95 Y140.224 E.02335
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3363
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3363
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3363
G1 X127.544 Y114.3 E.14354
M73 P73 R2
G1 X127.356 Y116.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422646
G1 F3363
G1 X127.356 Y115.194 E.05411
G1 X127.335 Y114.877 E.00983
G1 X127.203 Y114.827 E.00436
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.421952
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y116.942 E.05401
G1 X127.296 Y116.942 E.02322
G1 X126.95 Y116.536 F30000
; LINE_WIDTH: 0.477526
G1 F3363
G1 X126.95 Y115.254 E.04543
G1 X130.45 Y114.844 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F3363
G1 X130.45 Y141.156 E.83174
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3363
G1 X133.528 Y141.7 E.00234
; WIPE_START
G1 F24000
G1 X133.456 Y141.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.928 J-.787 P1  F30000
G1 X127.4 Y134.704 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3363
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.714 E.04015
G1 X126.982 Y121.714 E.01386
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.4 Y121.714 E-.15878
G1 X127.4 Y122.924 E-.45998
G1 X127.137 Y123.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/30
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
G3 Z3.2 I-1.215 J.061 P1  F30000
G1 X127.748 Y135.31 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3360
G1 X126.152 Y135.31 E.05294
G1 X126.152 Y121.39 E.46176
G1 X127.748 Y121.39 E.05294
G1 X127.748 Y135.25 E.45977
; WIPE_START
G1 F24000
G1 X126.152 Y135.31 E-.60685
G1 X126.152 Y134.907 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.146 J.408 P1  F30000
G1 X127.748 Y139.39 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3360
G1 X127.748 Y141.352 E.06508
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y117.31 E.08831
G1 X126.152 Y117.31 E.05294
G1 X126.152 Y113.952 E.11139
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y139.39 E.08817
G1 X127.688 Y139.39 E.05095
; WIPE_START
G1 F24000
G1 X127.748 Y141.352 E-.74596
G1 X127.785 Y141.352 E-.01404
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.209 J.14 P1  F30000
G1 X130.84 Y115.04 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3360
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F3360
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.211 J-.117 P1  F30000
G1 X127.76 Y138.998 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F3360
G1 X127.76 Y135.702 E.10127
G1 X125.76 Y135.702 E.06145
G1 X125.76 Y120.998 E.45182
G1 X127.76 Y120.998 E.06145
G1 X127.76 Y117.702 E.10127
G1 X125.76 Y117.702 E.06145
G1 X125.76 Y113.56 E.12728
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
M73 P74 R2
G1 X125.76 Y138.998 E.10577
G1 X127.7 Y138.998 E.05961
M204 S10000
G1 X127.356 Y139.782 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3360
G1 X126.544 Y139.782 E.02494
G1 X126.544 Y140.883 E.03382
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421604
G1 X127.217 Y141.189 E.00193
G1 X127.356 Y141.127 E.00469
G1 X127.356 Y139.842 E.03965
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3360
G1 X126.95 Y140.248 E.02249
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3360
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3360
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3360
G1 X127.544 Y114.3 E.14354
G1 X127.356 Y116.918 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422675
G1 F3360
G1 X127.356 Y115.194 E.05336
G1 X127.335 Y114.877 E.00983
G1 X127.203 Y114.827 E.00436
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534292
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.42197
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y116.918 E.05326
G1 X127.296 Y116.918 E.02322
G1 X126.95 Y116.512 F30000
; LINE_WIDTH: 0.477526
G1 F3360
G1 X126.95 Y115.254 E.04457
G1 X130.45 Y114.844 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F3360
G1 X130.45 Y141.156 E.83174
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3360
G1 X133.528 Y141.7 E.00234
; WIPE_START
G1 F24000
G1 X133.456 Y141.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.928 J-.787 P1  F30000
G1 X127.4 Y134.704 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3360
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.738 E.03935
G1 X126.958 Y121.738 E.01467
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.4 Y121.738 E-.16801
G1 X127.4 Y122.924 E-.45075
G1 X127.137 Y123.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/30
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
G3 Z3.4 I-1.215 J.061 P1  F30000
G1 X127.748 Y135.31 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3360
G1 X126.152 Y135.31 E.05294
G1 X126.152 Y121.39 E.46176
G1 X127.748 Y121.39 E.05294
G1 X127.748 Y135.25 E.45977
; WIPE_START
G1 F24000
G1 X126.152 Y135.31 E-.60685
G1 X126.152 Y134.907 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.146 J.408 P1  F30000
G1 X127.748 Y139.39 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F3360
G1 X127.748 Y141.352 E.06508
M73 P75 R2
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y117.31 E.08831
G1 X126.152 Y117.31 E.05294
G1 X126.152 Y113.952 E.11139
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y139.39 E.08817
G1 X127.688 Y139.39 E.05095
; WIPE_START
G1 F24000
G1 X127.748 Y141.352 E-.74596
G1 X127.785 Y141.352 E-.01404
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.209 J.14 P1  F30000
G1 X130.84 Y115.04 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3360
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F3360
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.211 J-.117 P1  F30000
G1 X127.76 Y138.998 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F3360
G1 X127.76 Y135.702 E.10127
G1 X125.76 Y135.702 E.06145
G1 X125.76 Y120.998 E.45182
G1 X127.76 Y120.998 E.06145
G1 X127.76 Y117.702 E.10127
G1 X125.76 Y117.702 E.06145
G1 X125.76 Y113.56 E.12728
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y138.998 E.10577
G1 X127.7 Y138.998 E.05961
M204 S10000
G1 X127.356 Y139.782 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3360
G1 X126.544 Y139.782 E.02494
G1 X126.544 Y140.883 E.03382
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421604
G1 X127.217 Y141.189 E.00193
G1 X127.356 Y141.127 E.00469
G1 X127.356 Y139.842 E.03965
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3360
G1 X126.95 Y140.248 E.02249
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3360
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3360
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3360
G1 X127.544 Y114.3 E.14354
G1 X127.356 Y116.918 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422675
G1 F3360
G1 X127.356 Y115.194 E.05336
G1 X127.335 Y114.877 E.00983
M73 P76 R2
G1 X127.203 Y114.827 E.00436
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534292
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.42197
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y116.918 E.05326
G1 X127.296 Y116.918 E.02322
G1 X126.95 Y116.512 F30000
; LINE_WIDTH: 0.477526
G1 F3360
G1 X126.95 Y115.254 E.04457
G1 X130.45 Y114.844 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F3360
G1 X130.45 Y141.156 E.83174
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3360
G1 X133.528 Y141.7 E.00234
; WIPE_START
G1 F24000
G1 X133.456 Y141.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.928 J-.787 P1  F30000
G1 X127.4 Y134.704 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3360
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.738 E.03935
G1 X126.958 Y121.738 E.01467
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.4 Y121.738 E-.16801
G1 X127.4 Y122.924 E-.45075
G1 X127.137 Y123.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/30
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
G3 Z3.6 I-1.215 J.061 P1  F30000
G1 X127.748 Y135.334 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3362
G1 X126.152 Y135.334 E.05294
G1 X126.152 Y121.366 E.46337
G1 X127.748 Y121.366 E.05294
G1 X127.748 Y135.274 E.46138
; WIPE_START
G1 F24000
G1 X126.152 Y135.334 E-.60685
G1 X126.152 Y134.931 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.145 J.412 P1  F30000
G1 X127.748 Y139.366 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F3362
G1 X127.748 Y141.352 E.06589
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y117.334 E.08911
G1 X126.152 Y117.334 E.05294
G1 X126.152 Y113.952 E.1122
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y139.366 E.08898
G1 X127.688 Y139.366 E.05095
; WIPE_START
G1 F24000
G1 X127.748 Y141.352 E-.75518
G1 X127.761 Y141.352 E-.00482
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.209 J.141 P1  F30000
G1 X130.84 Y115.04 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3362
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F3362
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.211 J-.117 P1  F30000
G1 X127.76 Y138.974 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F3362
G1 X127.76 Y135.726 E.09978
G1 X125.76 Y135.726 E.06145
G1 X125.76 Y120.974 E.45331
G1 X127.76 Y120.974 E.06145
G1 X127.76 Y117.726 E.09978
G1 X125.76 Y117.726 E.06145
G1 X125.76 Y113.56 E.12802
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y138.974 E.10651
G1 X127.7 Y138.974 E.05961
M204 S10000
G1 X127.356 Y139.758 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3362
G1 X126.544 Y139.758 E.02494
M73 P77 R2
G1 X126.544 Y140.883 E.03457
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421579
G1 X127.217 Y141.189 E.00193
G1 X127.356 Y141.127 E.00469
G1 X127.356 Y139.818 E.0404
G1 X126.95 Y140.164 F30000
; LINE_WIDTH: 0.477526
G1 F3362
G1 X126.95 Y140.823 E.02335
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3362
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3362
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3362
G1 X127.544 Y114.3 E.14354
G1 X127.356 Y116.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422646
G1 F3362
G1 X127.356 Y115.194 E.05411
G1 X127.335 Y114.877 E.00983
G1 X127.203 Y114.827 E.00436
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.421952
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y116.942 E.05401
G1 X127.296 Y116.942 E.02322
G1 X126.95 Y116.536 F30000
; LINE_WIDTH: 0.477526
G1 F3362
G1 X126.95 Y115.254 E.04543
G1 X130.45 Y114.844 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F3362
G1 X130.45 Y141.156 E.83174
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3362
G1 X133.528 Y141.7 E.00234
; WIPE_START
G1 F24000
G1 X133.456 Y141.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.928 J-.787 P1  F30000
G1 X127.4 Y134.704 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3362
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.714 E.04015
G1 X126.982 Y121.714 E.01386
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.4 Y121.714 E-.15878
G1 X127.4 Y122.924 E-.45998
G1 X127.137 Y123.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/30
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
G3 Z3.8 I-1.215 J.061 P1  F30000
G1 X127.748 Y135.398 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3375
G1 X126.152 Y135.398 E.05294
G1 X126.152 Y121.302 E.4676
G1 X127.748 Y121.302 E.05294
G1 X127.748 Y135.338 E.46561
; WIPE_START
G1 F24000
G1 X126.152 Y135.398 E-.60685
G1 X126.152 Y134.995 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.141 J.423 P1  F30000
G1 X127.748 Y139.302 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3375
G1 X127.748 Y141.352 E.068
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y117.398 E.09123
G1 X126.152 Y117.398 E.05294
G1 X126.152 Y113.952 E.11431
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y139.302 E.09109
G1 X127.688 Y139.302 E.05095
; WIPE_START
G1 F24000
G1 X127.746 Y141.301 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.209 J.142 P1  F30000
M73 P78 R2
G1 X130.84 Y115.04 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3375
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F3375
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.211 J-.117 P1  F30000
G1 X127.76 Y138.91 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F3375
G1 X127.76 Y135.79 E.09586
G1 X127.719 Y135.79 E.00126
G1 X125.76 Y135.79 E.06019
G1 X125.76 Y135.767 E.0007
G1 X125.76 Y120.933 E.45583
G1 X125.76 Y120.91 E.0007
G1 X127.719 Y120.91 E.06019
G1 X127.76 Y120.91 E.00126
G1 X127.76 Y117.79 E.09586
G1 X127.719 Y117.79 E.00126
G1 X125.76 Y117.79 E.06019
G1 X125.76 Y117.767 E.0007
G1 X125.76 Y113.56 E.12928
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y138.933 E.10777
G1 X125.76 Y138.91 E.0007
G1 X127.7 Y138.91 E.05961
M204 S10000
G1 X127.356 Y139.694 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3375
G1 X126.544 Y139.694 E.02494
G1 X126.544 Y140.883 E.03653
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421515
G1 X127.217 Y141.189 E.00193
G1 X127.356 Y141.127 E.00469
G1 X127.356 Y139.754 E.04236
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3375
G1 X126.95 Y140.16 E.0256
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3375
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3375
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3375
G1 X127.544 Y114.3 E.14354
G1 X127.356 Y117.006 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422572
G1 F3375
G1 X127.356 Y115.194 E.05607
G1 X127.335 Y114.877 E.00983
G1 X127.203 Y114.827 E.00436
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.421906
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y117.006 E.05597
G1 X127.296 Y117.006 E.02321
G1 X126.95 Y116.6 F30000
; LINE_WIDTH: 0.477526
G1 F3375
M73 P79 R2
G1 X126.95 Y115.254 E.04769
G1 X130.45 Y114.844 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F3375
G1 X130.45 Y141.156 E.83174
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3375
G1 X133.528 Y141.7 E.00234
; WIPE_START
G1 F24000
G1 X133.456 Y141.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.928 J-.787 P1  F30000
G1 X127.4 Y134.704 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3375
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.65 E.04227
G1 X127.046 Y121.65 E.01175
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.4 Y121.65 E-.13457
G1 X127.4 Y122.924 E-.48419
G1 X127.137 Y123.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/30
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
G3 Z4 I-1.215 J.06 P1  F30000
G1 X127.748 Y135.482 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3385
G1 X126.152 Y135.482 E.05294
G1 X126.152 Y121.218 E.47317
G1 X127.748 Y121.218 E.05294
G1 X127.748 Y135.422 E.47118
; WIPE_START
G1 F24000
G1 X126.152 Y135.482 E-.60685
G1 X126.152 Y135.079 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.135 J.438 P1  F30000
G1 X127.748 Y139.218 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F3385
G1 X127.748 Y141.352 E.07079
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y117.482 E.09401
G1 X126.152 Y117.482 E.05294
G1 X126.152 Y113.952 E.1171
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y139.218 E.09388
G1 X127.688 Y139.218 E.05095
; WIPE_START
G1 F24000
G1 X127.744 Y141.217 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.209 J.143 P1  F30000
G1 X130.84 Y115.04 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3385
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F3385
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.211 J-.118 P1  F30000
G1 X127.76 Y138.826 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F3385
G1 X127.76 Y135.874 E.0907
G1 X127.719 Y135.874 E.00126
G1 X125.76 Y135.874 E.06019
G1 X125.76 Y135.831 E.00132
G1 X125.76 Y120.869 E.45975
G1 X125.76 Y120.826 E.00132
G1 X127.719 Y120.826 E.06019
G1 X127.76 Y120.826 E.00126
G1 X127.76 Y117.874 E.0907
G1 X127.719 Y117.874 E.00126
G1 X125.76 Y117.874 E.06019
G1 X125.76 Y117.831 E.00132
G1 X125.76 Y113.56 E.13124
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y138.869 E.10973
G1 X125.76 Y138.826 E.00132
G1 X127.7 Y138.826 E.05961
M204 S10000
G1 X127.356 Y139.61 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3385
G1 X126.544 Y139.61 E.02494
G1 X126.544 Y140.883 E.03911
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
M73 P80 R2
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421439
G1 X127.217 Y141.189 E.00193
G1 X127.356 Y141.127 E.00469
G1 X127.356 Y139.67 E.04494
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3385
G1 X126.95 Y140.076 E.02858
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3385
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3385
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3385
G1 X127.544 Y114.3 E.14354
G1 X127.356 Y117.09 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42248
G1 F3385
G1 X127.356 Y115.194 E.05866
G1 X127.335 Y114.877 E.00983
G1 X127.203 Y114.827 E.00436
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.421848
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y117.09 E.05856
G1 X127.296 Y117.09 E.02321
G1 X126.95 Y116.684 F30000
; LINE_WIDTH: 0.477526
G1 F3385
G1 X126.95 Y115.254 E.05066
G1 X130.45 Y114.844 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F3385
G1 X130.45 Y141.156 E.83174
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3385
G1 X133.528 Y141.7 E.00234
; WIPE_START
G1 F24000
G1 X133.456 Y141.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.928 J-.787 P1  F30000
G1 X127.4 Y134.704 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3385
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.566 E.04505
G1 X127.13 Y121.566 E.00896
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.4 Y121.566 E-.10265
G1 X127.4 Y122.924 E-.51611
G1 X127.137 Y123.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/30
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
G3 Z4.2 I-1.215 J.06 P1  F30000
G1 X127.748 Y135.62 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3410
G1 X126.152 Y135.62 E.05294
G1 X126.152 Y121.08 E.48233
G1 X127.748 Y121.08 E.05294
G1 X127.748 Y135.56 E.48034
; WIPE_START
G1 F24000
G1 X126.152 Y135.62 E-.60685
G1 X126.152 Y135.217 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.125 J.465 P1  F30000
G1 X127.748 Y139.08 Z4.4
G1 Z4
G1 E.8 F1800
G1 F3410
G1 X127.748 Y141.352 E.07537
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y117.62 E.09859
G1 X126.152 Y117.62 E.05294
G1 X126.152 Y113.952 E.12168
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y139.08 E.09846
G1 X127.688 Y139.08 E.05095
; WIPE_START
G1 F24000
G1 X127.741 Y141.079 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.208 J.144 P1  F30000
G1 X130.84 Y115.04 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3410
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F3410
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.211 J-.118 P1  F30000
M73 P81 R2
G1 X127.76 Y138.688 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F3410
G1 X127.76 Y136.012 E.08221
G1 X127.637 Y136.012 E.00378
G1 F3000
G1 X125.76 Y136.012 E.05768
G1 X125.76 Y135.997 E.00046
G1 F3410
G1 X125.76 Y120.703 E.46995
G1 F3000
G1 X125.76 Y120.688 E.00046
G1 X127.637 Y120.688 E.05768
G1 F3410
G1 X127.76 Y120.688 E.00378
G1 X127.76 Y118.012 E.08221
G1 X127.637 Y118.012 E.00378
G1 F3000
G1 X125.76 Y118.012 E.05768
G1 X125.76 Y117.997 E.00046
G1 F3410
G1 X125.76 Y117.915 E.00252
G1 X125.76 Y113.56 E.13382
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y138.703 E.11483
G1 F3000
G1 X125.76 Y138.688 E.00046
G1 X127.637 Y138.688 E.05768
G1 F3410
G1 X127.7 Y138.688 E.00194
M204 S10000
G1 X127.356 Y139.472 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3410
G1 X126.544 Y139.472 E.02494
G1 X126.544 Y140.883 E.04335
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421329
G1 X127.217 Y141.189 E.00193
M73 P81 R1
G1 X127.356 Y141.127 E.00469
G1 X127.356 Y139.532 E.04919
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3410
G1 X126.95 Y139.938 E.03347
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3410
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3410
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3410
G1 X127.544 Y114.3 E.14354
G1 X127.356 Y117.228 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422343
G1 F3410
G1 X127.356 Y115.194 E.0629
G1 X127.335 Y114.877 E.00982
G1 X127.203 Y114.827 E.00435
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.421761
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y117.228 E.06281
G1 X127.296 Y117.228 E.02321
G1 X126.95 Y116.822 F30000
; LINE_WIDTH: 0.477526
G1 F3410
M73 P82 R1
G1 X126.95 Y115.254 E.05555
G1 X130.45 Y114.844 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F3410
G1 X130.45 Y141.156 E.83174
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3410
G1 X133.528 Y141.7 E.00234
; WIPE_START
G1 F24000
G1 X133.456 Y141.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.928 J-.787 P1  F30000
G1 X127.4 Y134.704 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3410
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.428 E.04963
G1 X127.268 Y121.428 E.00438
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.4 Y121.428 E-.05019
G1 X127.4 Y122.924 E-.56857
G1 X127.137 Y123.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/30
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
G3 Z4.4 I-1.216 J.059 P1  F30000
G1 X127.748 Y135.819 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3464
G1 X126.152 Y135.819 E.05294
G1 X126.152 Y120.881 E.49551
G1 X127.748 Y120.881 E.05294
G1 X127.748 Y135.759 E.49352
; WIPE_START
G1 F24000
G1 X126.152 Y135.819 E-.60685
G1 X126.152 Y135.416 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.105 J.509 P1  F30000
G1 X127.748 Y138.881 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F3464
G1 X127.748 Y141.352 E.08196
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y117.819 E.10519
G1 X126.152 Y117.819 E.05294
G1 X126.152 Y113.952 E.12827
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y138.881 E.10505
G1 X127.688 Y138.881 E.05095
; WIPE_START
G1 F24000
G1 X127.737 Y140.881 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.208 J.145 P1  F30000
G1 X130.84 Y115.04 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3464
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F3464
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.211 J-.119 P1  F30000
G1 X127.76 Y138.489 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F3464
G1 X127.76 Y136.211 E.07
G1 X127.637 Y136.211 E.00378
G1 F3000
G1 X125.76 Y136.211 E.05768
G1 X125.76 Y136.135 E.00233
G1 F3464
G1 X125.76 Y120.565 E.47843
G1 F3000
G1 X125.76 Y120.489 E.00233
G1 X127.637 Y120.489 E.05768
G1 F3464
G1 X127.76 Y120.489 E.00378
G1 X127.76 Y118.211 E.07
G1 X127.637 Y118.211 E.00378
G1 F3000
G1 X125.76 Y118.211 E.05768
G1 X125.76 Y118.135 E.00233
G1 F3464
G1 X125.76 Y118.053 E.00252
G1 X125.76 Y113.56 E.13806
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y138.565 E.11907
G1 F3000
G1 X125.76 Y138.489 E.00233
G1 X127.637 Y138.489 E.05768
G1 F3464
G1 X127.7 Y138.489 E.00194
M204 S10000
G1 X127.356 Y139.273 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3464
G1 X126.544 Y139.273 E.02494
G1 X126.544 Y140.883 E.04946
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526318
M73 P83 R1
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421198
G1 X127.217 Y141.189 E.00193
G1 X127.356 Y141.127 E.00468
G1 X127.356 Y139.333 E.0553
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3464
G1 X126.95 Y139.739 E.04051
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3464
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3464
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3464
G1 X127.544 Y114.3 E.14354
G1 X130.45 Y114.844 F30000
; LINE_WIDTH: 0.430842
G1 F3464
G1 X130.45 Y141.156 E.83174
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3464
G1 X133.528 Y141.7 E.00234
; WIPE_START
G1 F24000
G1 X133.456 Y141.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.928 J-.787 P1  F30000
G1 X127.4 Y134.704 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3464
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.296 E.05401
; WIPE_START
G1 F24000
G1 X127.4 Y122.924 E-.61876
G1 X127.137 Y123.187 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.216 J.046 P1  F30000
G1 X127.356 Y117.427 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42217
G1 F3464
G1 X127.356 Y115.194 E.06902
G1 X127.335 Y114.877 E.00982
G1 X127.203 Y114.827 E.00435
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.421648
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y117.427 E.06892
G1 X127.296 Y117.427 E.0232
G1 X126.95 Y117.021 F30000
; LINE_WIDTH: 0.477526
G1 F3464
G1 X126.95 Y115.254 E.06259
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.95 Y117.021 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/30
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
G3 Z4.6 I-1.216 J.051 P1  F30000
G1 X127.748 Y136.127 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3789
G1 X126.152 Y136.127 E.05294
G1 X126.152 Y120.573 E.51599
G1 X127.748 Y120.573 E.05294
G1 X127.748 Y136.067 E.514
; WIPE_START
G1 F24000
G1 X126.152 Y136.127 E-.60685
G1 X126.152 Y135.724 E-.15315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.062 J.595 P1  F30000
G1 X127.748 Y138.573 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F3789
G1 X127.748 Y141.352 E.0922
G1 X133.352 Y141.352 E.1859
G1 X133.352 Y114.648 E.88583
G1 X127.748 Y114.648 E.1859
G1 X127.748 Y118.127 E.11542
G1 X126.152 Y118.127 E.05294
G1 X126.152 Y113.952 E.13851
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y138.573 E.11529
G1 X127.688 Y138.573 E.05095
; WIPE_START
G1 F24000
G1 X127.731 Y140.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.208 J.147 P1  F30000
G1 X130.84 Y115.04 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3789
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F3789
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.211 J-.121 P1  F30000
G1 X127.76 Y138.18 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F3789
G1 X127.76 Y136.52 E.05103
G1 X127.719 Y136.52 E.00126
G1 F3000
G1 X127.637 Y136.52 E.00252
G1 F3789
G1 X127.473 Y136.52 E.00504
M106 S255
G1 F600
G1 X125.76 Y136.52 E.05264
G1 X125.76 Y136.498 E.00066
M106 S252.45
M73 P84 R1
G1 F3789
G1 X125.76 Y136.252 E.00756
G1 X125.76 Y120.448 E.48561
G1 X125.76 Y120.202 E.00756
M106 S255
G1 F600
G1 X125.76 Y120.18 E.00066
G1 X127.473 Y120.18 E.05264
M106 S252.45
G1 F3789
G1 X127.637 Y120.18 E.00504
G1 F3000
G1 X127.719 Y120.18 E.00252
G1 F3789
G1 X127.76 Y120.18 E.00126
G1 X127.76 Y118.52 E.05103
G1 X127.719 Y118.52 E.00126
G1 F3000
G1 X127.637 Y118.52 E.00252
G1 F3789
G1 X127.473 Y118.52 E.00504
M106 S255
G1 F600
G1 X125.76 Y118.52 E.05264
G1 X125.76 Y118.498 E.00066
M106 S252.45
G1 F3789
G1 X125.76 Y118.252 E.00756
G1 X125.76 Y113.56 E.14417
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y138.448 E.12266
G1 X125.76 Y138.202 E.00756
M106 S255
G1 F600
G1 X125.76 Y138.18 E.00066
G1 X127.473 Y138.18 E.05264
M106 S252.45
G1 F3789
G1 X127.637 Y138.18 E.00504
G1 F3000
G1 X127.7 Y138.18 E.00194
M204 S10000
G1 X127.356 Y138.965 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3789
G1 X126.544 Y138.965 E.02494
G1 X126.544 Y140.883 E.05894
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526318
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.421038
G1 X127.217 Y141.189 E.00193
G1 X127.356 Y141.127 E.00468
G1 X127.356 Y139.025 E.06478
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3789
G1 X126.95 Y139.43 E.05144
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3789
G1 X133.644 Y141.7 E.14354
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.220448
G1 F3789
G1 X133.456 Y141.844 E.00234
G1 X133.528 Y141.7 F30000
; LINE_WIDTH: 0.131947
G1 F3789
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3789
G1 X127.544 Y114.3 E.14354
G1 X130.45 Y114.844 F30000
; LINE_WIDTH: 0.430842
G1 F3789
G1 X130.45 Y141.156 E.83174
; WIPE_START
G1 F24000
G1 X130.45 Y139.156 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.825 J-.894 P1  F30000
G1 X126.639 Y135.64 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.610274
G1 F3789
G1 X127.197 Y135.64 E.02577
G1 X127.4 Y134.704 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3789
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.547 E.04569
G1 X127.149 Y121.547 E.00832
G1 X126.643 Y121.06 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.610276
G1 F3789
G1 X127.201 Y121.06 E.02577
; WIPE_START
G1 F24000
G1 X126.643 Y121.06 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.19 J.255 P1  F30000
G1 X127.356 Y117.735 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.421946
G1 F3789
G1 X127.356 Y115.194 E.07851
G1 X127.335 Y114.877 E.00981
G1 X127.203 Y114.827 E.00435
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.4215
G1 X126.544 Y115.194 E.00406
G1 X126.544 Y117.735 E.07841
M73 P85 R1
G1 X127.296 Y117.735 E.02319
G1 X126.95 Y117.33 F30000
; LINE_WIDTH: 0.477526
G1 F3789
G1 X126.95 Y115.254 E.07352
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.95 Y117.254 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/30
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
G3 Z4.8 I1.145 J.413 P1  F30000
G1 X127.748 Y115.04 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3457
G1 X127.748 Y114.648 E.01301
G1 X133.352 Y114.648 E.1859
G1 X133.352 Y141.352 E.88583
G1 X127.748 Y141.352 E.1859
G1 X127.748 Y115.1 E.87083
; WIPE_START
G1 F24000
G1 X127.748 Y114.648 E-.17179
G1 X129.296 Y114.648 E-.58821
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.299 J1.18 P1  F30000
G1 X130.84 Y115.04 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3457
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F3457
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.348 J-1.166 P1  F30000
G1 X126.152 Y113.952 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3457
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y137.77 E.14189
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X126.152 Y136.93 E.02789
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F3457
G1 X126.152 Y119.77 E.5692
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X126.152 Y118.93 E.02789
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F3457
G1 X126.152 Y118.547 E.01269
G1 X126.152 Y114.012 E.15043
G1 X125.76 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3457
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y137.77 E.14348
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X125.76 Y136.93 E.02789
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3457
G1 X125.76 Y119.77 E.52725
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X125.76 Y118.93 E.02789
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3457
G1 X125.76 Y118.561 E.01134
G1 X125.76 Y113.62 E.15181
M204 S10000
; WIPE_START
G1 F24000
G1 X127.76 Y113.606 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.676 J-1.012 P1  F30000
G1 X126.719 Y114.3 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3457
G1 X127.196 Y114.3 E.01581
G1 X127.196 Y114.814 E.01704
G1 X127.4 Y114.814 E.00675
G1 X127.4 Y115.248 E.01441
G1 X126.5 Y116.148 E.04219
G1 X126.5 Y116.824 E.02245
G1 X127.242 Y117.566 E.03479
G1 X127.4 Y117.566 E.00523
G1 X127.4 Y116.095 E.04878
G1 X127.544 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3457
G1 X133.644 Y114.3 E.14354
G1 X133.456 Y114.156 F30000
; LINE_WIDTH: 0.176066
G1 F3457
G1 X133.528 Y114.3 E.00175
; LINE_WIDTH: 0.131684
G1 X133.6 Y114.444 E.00117
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.19668
G1 X133.528 Y141.7 E.00117
; LINE_WIDTH: 0.220448
G1 X133.456 Y141.844 E.00234
M73 P86 R1
G1 X133.644 Y141.7 F30000
; LINE_WIDTH: 0.331684
G1 F3457
G1 X127.544 Y141.7 E.14354
G1 X127.4 Y140.752 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3457
G1 X126.5 Y139.852 E.04219
G1 X127.386 Y138.912 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.478395
M106 S255
G1 F3000
G1 X127.386 Y135.958 E.10481
G1 X126.95 Y135.958 E.01545
G1 X126.95 Y138.742 E.09879
G1 X126.515 Y138.742 E.01545
G1 X126.515 Y135.788 E.10481
M106 S252.45
G1 X127.4 Y134.704 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3457
G1 X127.4 Y133.076 E.05401
G1 X126.5 Y132.176 E.04219
G1 X126.5 Y131.5 E.02245
G1 X127.4 Y130.6 E.04219
G1 X127.4 Y125.4 E.17252
G1 X126.5 Y124.5 E.04219
G1 X126.5 Y123.824 E.02245
G1 X127.4 Y122.924 E.04219
G1 X127.4 Y121.296 E.05401
G1 X127.386 Y120.912 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.478395
M106 S255
G1 F3000
G1 X127.386 Y117.958 E.10481
G1 X126.95 Y117.958 E.01545
G1 X126.95 Y120.742 E.09879
G1 X126.515 Y120.742 E.01545
G1 X126.515 Y117.788 E.10481
M106 S252.45
; WIPE_START
G1 F24000
G1 X126.515 Y119.788 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.952 J.758 P1  F30000
G1 X130.45 Y114.844 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F3457
G1 X130.45 Y141.156 E.83174
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.45 Y139.156 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/30
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
G3 Z5 I1.212 J-.114 P1  F30000
G1 X128.14 Y114.648 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3514
G1 X133.352 Y114.648 E.17289
G1 X133.352 Y141.352 E.88583
G1 X127.748 Y141.352 E.1859
G1 X127.748 Y114.648 E.88583
G1 X128.08 Y114.648 E.01102
; WIPE_START
G1 F24000
G1 X130.08 Y114.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.558 J1.082 P1  F30000
G1 X130.84 Y115.04 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3514
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F3514
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.348 J-1.166 P1  F30000
G1 X126.152 Y113.952 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3514
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y114.012 E.93
G1 X125.76 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3514
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.76 Y113.606 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.676 J-1.012 P1  F30000
G1 X126.719 Y114.3 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3514
G1 X127.196 Y114.3 E.01581
G1 X127.196 Y114.814 E.01704
G1 X127.4 Y114.814 E.00675
G1 X127.4 Y115.248 E.01441
G1 X126.5 Y116.148 E.04219
G1 X126.5 Y116.824 E.02245
G1 X126.727 Y117.051 E.01065
G1 X127.4 Y117.051 E.0223
G1 X127.4 Y116.095 E.03171
G1 X127.544 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3514
M73 P87 R1
G1 X133.644 Y114.3 E.14354
G1 X133.528 Y114.3 F30000
; LINE_WIDTH: 0.176066
G1 F3514
G1 X133.456 Y114.156 E.00175
G1 X133.528 Y114.3 F30000
; LINE_WIDTH: 0.131684
G1 F3514
G1 X133.6 Y114.444 E.00117
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.19668
G1 X133.528 Y141.7 E.00117
; LINE_WIDTH: 0.220448
G1 X133.456 Y141.844 E.00234
G1 X133.644 Y141.7 F30000
; LINE_WIDTH: 0.331684
G1 F3514
G1 X127.544 Y141.7 E.14354
G1 X127.4 Y140.752 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3514
G1 X126.5 Y139.852 E.04219
; WIPE_START
G1 F24000
G1 X127.4 Y140.752 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.16 J1.206 P1  F30000
G1 X130.45 Y141.156 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F3514
G1 X130.45 Y114.844 E.83174
; WIPE_START
G1 F24000
G1 X130.45 Y116.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.996 J-.699 P1  F30000
G1 X127.356 Y121.257 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3514
G1 X127.356 Y117.443 E.11717
G1 X126.544 Y117.443 E.02494
G1 X126.544 Y121.257 E.11717
G1 X127.296 Y121.257 E.0231
G1 X126.95 Y120.851 F30000
; LINE_WIDTH: 0.477526
G1 F3514
G1 X126.95 Y117.909 E.10418
G1 X127.047 Y121.649 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3514
G1 X127.4 Y121.649 E.0117
G1 X127.4 Y122.924 E.04232
G1 X126.5 Y123.824 E.04219
G1 X126.5 Y124.5 E.02245
G1 X127.4 Y125.4 E.04219
G1 X127.4 Y130.6 E.17252
G1 X126.5 Y131.5 E.04219
G1 X126.5 Y132.176 E.02245
G1 X127.4 Y133.076 E.04219
G1 X127.4 Y134.704 E.05401
G1 X127.356 Y135.443 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3514
G1 X126.544 Y135.443 E.02494
G1 X126.544 Y139.257 E.11717
G1 X127.356 Y139.257 E.02494
G1 X127.356 Y135.503 E.11533
G1 X126.95 Y138.851 F30000
; LINE_WIDTH: 0.477526
G1 F3514
G1 X126.95 Y135.909 E.10418
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.95 Y137.909 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/30
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
G3 Z5.2 I1.215 J.062 P1  F30000
G1 X128.14 Y114.648 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3512
G1 X133.352 Y114.648 E.17289
G1 X133.352 Y141.352 E.88583
G1 X127.748 Y141.352 E.1859
G1 X127.748 Y114.648 E.88583
G1 X128.08 Y114.648 E.01102
; WIPE_START
G1 F24000
G1 X130.08 Y114.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.558 J1.082 P1  F30000
G1 X130.84 Y115.04 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3512
G1 X132.96 Y115.04 E.06514
M73 P88 R1
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F3512
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.348 J-1.166 P1  F30000
G1 X126.152 Y113.952 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3512
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y114.012 E.93
G1 X125.76 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3512
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.76 Y113.606 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.676 J-1.012 P1  F30000
G1 X126.719 Y114.3 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3512
G1 X127.196 Y114.3 E.01581
G1 X127.196 Y114.814 E.01704
G1 X127.4 Y114.814 E.00675
G1 X127.4 Y115.248 E.01441
G1 X126.5 Y116.148 E.04219
G1 X126.5 Y116.824 E.02245
G1 X126.727 Y117.051 E.01065
G1 X127.4 Y117.051 E.0223
G1 X127.4 Y116.095 E.03171
G1 X127.544 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3512
G1 X133.644 Y114.3 E.14354
G1 X133.528 Y114.3 F30000
; LINE_WIDTH: 0.176066
G1 F3512
G1 X133.456 Y114.156 E.00175
G1 X133.528 Y114.3 F30000
; LINE_WIDTH: 0.131684
G1 F3512
G1 X133.6 Y114.444 E.00117
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.19668
G1 X133.528 Y141.7 E.00117
; LINE_WIDTH: 0.220448
G1 X133.456 Y141.844 E.00234
G1 X133.644 Y141.7 F30000
; LINE_WIDTH: 0.331684
G1 F3512
G1 X127.544 Y141.7 E.14354
G1 X127.4 Y140.752 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3512
G1 X126.5 Y139.852 E.04219
; WIPE_START
G1 F24000
G1 X127.4 Y140.752 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.16 J1.206 P1  F30000
G1 X130.45 Y141.156 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F3512
G1 X130.45 Y114.844 E.83174
; WIPE_START
G1 F24000
G1 X130.45 Y116.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.996 J-.699 P1  F30000
G1 X127.356 Y121.257 Z5.4
G1 Z5
M73 P89 R1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3512
G1 X127.356 Y117.443 E.11717
G1 X126.544 Y117.443 E.02494
G1 X126.544 Y121.257 E.11717
G1 X127.296 Y121.257 E.0231
G1 X126.95 Y120.851 F30000
; LINE_WIDTH: 0.477526
G1 F3512
G1 X126.95 Y117.909 E.10418
G1 X127.047 Y121.649 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3512
G1 X127.4 Y121.649 E.0117
G1 X127.4 Y122.924 E.04232
G1 X126.5 Y123.824 E.04219
G1 X126.5 Y124.5 E.02245
G1 X127.4 Y125.4 E.04219
G1 X127.4 Y130.6 E.17252
G1 X126.5 Y131.5 E.04219
G1 X126.5 Y132.176 E.02245
G1 X127.4 Y133.076 E.04219
G1 X127.4 Y134.704 E.05401
G1 X127.356 Y135.443 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3512
G1 X126.544 Y135.443 E.02494
G1 X126.544 Y139.257 E.11717
G1 X127.356 Y139.257 E.02494
G1 X127.356 Y135.503 E.11533
G1 X126.95 Y138.851 F30000
; LINE_WIDTH: 0.477526
G1 F3512
G1 X126.95 Y135.909 E.10418
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.95 Y137.909 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/30
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
G3 Z5.4 I1.215 J.062 P1  F30000
G1 X128.14 Y114.648 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3328
G1 X133.352 Y114.648 E.17289
G1 X133.352 Y141.352 E.88583
G1 X127.748 Y141.352 E.1859
G1 X127.748 Y114.648 E.88583
G1 X128.08 Y114.648 E.01102
; WIPE_START
G1 F24000
G1 X130.08 Y114.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.558 J1.082 P1  F30000
G1 X130.84 Y115.04 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3328
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F3328
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.348 J-1.166 P1  F30000
G1 X126.152 Y113.952 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3328
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y114.012 E.93
G1 X125.76 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3328
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.76 Y113.606 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.676 J-1.012 P1  F30000
G1 X126.719 Y114.3 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3328
G1 X127.196 Y114.3 E.01581
G1 X127.196 Y114.814 E.01704
G1 X127.4 Y114.814 E.00675
G1 X127.4 Y115.248 E.01441
G1 X126.5 Y116.148 E.04219
G1 X126.5 Y116.824 E.02245
G1 X127.4 Y117.724 E.04219
G1 X127.4 Y122.924 E.17252
G1 X126.5 Y123.824 E.04219
G1 X126.5 Y124.5 E.02245
G1 X127.4 Y125.4 E.04219
G1 X127.4 Y130.6 E.17252
G1 X126.5 Y131.5 E.04219
G1 X126.5 Y132.176 E.02245
G1 X127.4 Y133.076 E.04219
G1 X127.4 Y138.276 E.17252
G1 X126.5 Y139.176 E.04219
G1 X126.5 Y139.852 E.02245
M73 P90 R1
G1 X127.4 Y140.752 E.04219
G1 X127.4 Y141.186 E.01441
G1 X127.196 Y141.186 E.00675
G1 X127.196 Y141.7 E.01704
G1 X126.719 Y141.7 E.01581
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3328
G1 X133.644 Y141.7 E.14354
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3328
G1 X133.528 Y141.7 E.00234
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3328
G1 X127.544 Y114.3 E.14354
G1 X130.45 Y114.844 F30000
; LINE_WIDTH: 0.430842
G1 F3328
G1 X130.45 Y141.156 E.83174
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.45 Y139.156 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/30
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
G3 Z5.6 I1.212 J-.114 P1  F30000
G1 X128.14 Y114.648 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3329
G1 X133.352 Y114.648 E.17289
G1 X133.352 Y141.352 E.88583
G1 X127.748 Y141.352 E.1859
G1 X127.748 Y114.648 E.88583
G1 X128.08 Y114.648 E.01102
; WIPE_START
G1 F24000
G1 X130.08 Y114.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.558 J1.082 P1  F30000
G1 X130.84 Y115.04 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3329
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F3329
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.348 J-1.166 P1  F30000
G1 X126.152 Y113.952 Z5.8
G1 Z5.4
M73 P90 R0
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3329
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y114.012 E.93
G1 X125.76 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3329
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.76 Y113.606 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.676 J-1.012 P1  F30000
G1 X126.719 Y114.3 Z5.8
M73 P91 R0
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3329
G1 X127.196 Y114.3 E.01581
G1 X127.196 Y114.814 E.01704
G1 X127.4 Y114.814 E.00675
G1 X127.4 Y115.248 E.01441
G1 X126.5 Y116.148 E.04219
G1 X126.5 Y116.824 E.02245
G1 X127.4 Y117.724 E.04219
G1 X127.4 Y122.924 E.17252
G1 X126.5 Y123.824 E.04219
G1 X126.5 Y124.5 E.02245
G1 X127.4 Y125.4 E.04219
G1 X127.4 Y130.6 E.17252
G1 X126.5 Y131.5 E.04219
G1 X126.5 Y132.176 E.02245
G1 X127.4 Y133.076 E.04219
G1 X127.4 Y138.276 E.17252
G1 X126.5 Y139.176 E.04219
G1 X126.5 Y139.852 E.02245
G1 X127.4 Y140.752 E.04219
G1 X127.4 Y141.186 E.01441
G1 X127.196 Y141.186 E.00675
G1 X127.196 Y141.7 E.01704
G1 X126.719 Y141.7 E.01581
G1 X127.544 Y141.7 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3329
G1 X133.644 Y141.7 E.14354
G1 X133.456 Y141.844 F30000
; LINE_WIDTH: 0.220448
G1 F3329
G1 X133.528 Y141.7 E.00234
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.00117
G1 X133.6 Y114.444 E.19668
; LINE_WIDTH: 0.131684
G1 X133.528 Y114.3 E.00117
; LINE_WIDTH: 0.176066
G1 X133.456 Y114.156 E.00175
G1 X133.644 Y114.3 F30000
; LINE_WIDTH: 0.331684
G1 F3329
G1 X127.544 Y114.3 E.14354
G1 X130.45 Y114.844 F30000
; LINE_WIDTH: 0.430842
G1 F3329
G1 X130.45 Y141.156 E.83174
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.45 Y139.156 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/30
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
G3 Z5.8 I1.212 J-.114 P1  F30000
G1 X128.14 Y114.648 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P92 R0
G1 F3761
G1 X133.352 Y114.648 E.17289
G1 X133.352 Y141.352 E.88583
G1 X127.748 Y141.352 E.1859
G1 X127.748 Y114.648 E.88583
G1 X128.08 Y114.648 E.01102
; WIPE_START
G1 F24000
G1 X130.08 Y114.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.558 J1.082 P1  F30000
G1 X130.84 Y115.04 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3761
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F3761
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.348 J-1.166 P1  F30000
G1 X126.152 Y113.952 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3761
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y114.012 E.93
G1 X125.76 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3761
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.76 Y113.606 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.162 J-.361 P1  F30000
G1 X127.544 Y114.3 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3761
G1 X133.644 Y114.3 E.14354
G1 X133.456 Y114.156 F30000
; LINE_WIDTH: 0.176066
G1 F3761
G1 X133.528 Y114.3 E.00175
; LINE_WIDTH: 0.131684
G1 X133.6 Y114.444 E.00117
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.19668
G1 X133.528 Y141.7 E.00117
; LINE_WIDTH: 0.220448
G1 X133.456 Y141.844 E.00234
G1 X133.644 Y141.7 F30000
; LINE_WIDTH: 0.331684
G1 F3761
G1 X127.544 Y141.7 E.14354
G1 X130.45 Y141.156 F30000
; LINE_WIDTH: 0.430842
G1 F3761
G1 X130.45 Y114.844 E.83174
G1 X127.356 Y115.194 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.432739
G1 F3761
G1 X127.335 Y114.877 E.01009
G1 X127.203 Y114.827 E.00447
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.420198
G1 X126.544 Y115.194 E.00404
G1 X126.544 Y140.883 E.78977
; LINE_WIDTH: 0.419999
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.420092
G1 X127.217 Y141.189 E.00192
G1 X127.356 Y141.127 E.00467
G1 X127.356 Y115.254 E.79521
M73 P93 R0
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3761
G1 X126.95 Y115.254 E.90766
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.95 Y117.254 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/30
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
G3 Z6 I1.107 J.506 P1  F30000
G1 X128.14 Y114.648 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3740
G1 X133.352 Y114.648 E.17289
G1 X133.352 Y141.352 E.88583
G1 X127.748 Y141.352 E.1859
G1 X127.748 Y114.648 E.88583
G1 X128.08 Y114.648 E.01102
; WIPE_START
G1 F24000
G1 X130.08 Y114.648 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.558 J1.082 P1  F30000
G1 X130.84 Y115.04 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3740
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F3740
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.348 J-1.166 P1  F30000
G1 X126.152 Y113.952 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3740
G1 X133.848 Y113.952 E.25529
G1 X133.848 Y142.048 E.93199
G1 X126.152 Y142.048 E.25529
G1 X126.152 Y114.012 E.93
G1 X125.76 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3740
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.76 Y113.606 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.162 J-.361 P1  F30000
G1 X127.544 Y114.3 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.331684
G1 F3740
G1 X133.644 Y114.3 E.14354
G1 X133.456 Y114.156 F30000
; LINE_WIDTH: 0.176066
G1 F3740
G1 X133.528 Y114.3 E.00175
; LINE_WIDTH: 0.131684
G1 X133.6 Y114.444 E.00117
; LINE_WIDTH: 0.131947
G1 X133.6 Y141.556 E.19668
G1 X133.528 Y141.7 E.00117
; LINE_WIDTH: 0.220448
G1 X133.456 Y141.844 E.00234
G1 X133.644 Y141.7 F30000
; LINE_WIDTH: 0.331684
G1 F3740
G1 X127.544 Y141.7 E.14354
G1 X130.45 Y141.156 F30000
; LINE_WIDTH: 0.430842
M73 P94 R0
G1 F3740
G1 X130.45 Y114.844 E.83174
G1 X127.356 Y115.194 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.432739
G1 F3740
G1 X127.335 Y114.877 E.01009
G1 X127.203 Y114.827 E.00447
; LINE_WIDTH: 0.461479
G1 X127.15 Y114.77 E.00267
; LINE_WIDTH: 0.534293
G1 X127.096 Y114.712 E.00314
G1 X127.095 Y114.402 E.01243
G1 X126.602 Y114.402 E.01972
G1 X126.611 Y114.805 E.01613
; LINE_WIDTH: 0.537268
G1 X126.588 Y114.934 E.0053
; LINE_WIDTH: 0.498179
G1 X126.566 Y115.064 E.00488
; LINE_WIDTH: 0.420198
G1 X126.544 Y115.194 E.00404
G1 X126.544 Y140.883 E.78977
; LINE_WIDTH: 0.419999
G1 X126.563 Y141.121 E.00735
; LINE_WIDTH: 0.458512
G1 X126.583 Y141.36 E.0081
; LINE_WIDTH: 0.526319
G1 X126.602 Y141.598 E.00942
G1 X127.095 Y141.598 E.0194
G1 X127.095 Y141.331 E.01054
; LINE_WIDTH: 0.535537
G1 X127.135 Y141.283 E.00251
; LINE_WIDTH: 0.497025
G1 X127.176 Y141.236 E.00231
; LINE_WIDTH: 0.420092
G1 X127.217 Y141.189 E.00192
G1 X127.356 Y141.127 E.00467
G1 X127.356 Y115.254 E.79521
G1 X126.95 Y140.883 F30000
; LINE_WIDTH: 0.477526
G1 F3740
G1 X126.95 Y115.254 E.90766
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.95 Y117.254 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/30
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
G3 Z6.2 I.602 J1.058 P1  F30000
G1 X130.84 Y115.04 Z6.2
G1 Z6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4448
G1 X132.96 Y115.04 E.06514
G1 X132.96 Y140.96 E.79645
G1 X130.84 Y140.96 E.06514
G1 X130.84 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.839 Y115.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.001 J-1.217 P1  F30000
G1 X128.14 Y115.04 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F4448
G1 X130.06 Y115.04 E.059
G1 X130.06 Y140.96 E.79645
G1 X128.14 Y140.96 E.059
G1 X128.14 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X130.06 Y115.04 E-.72996
G1 X130.06 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.415 J-1.144 P1  F30000
G1 X125.76 Y113.56 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F4448
G1 X134.24 Y113.56 E.26057
G1 X134.24 Y142.44 E.8874
G1 X125.76 Y142.44 E.26057
G1 X125.76 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.76 Y113.606 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.509 J1.105 P1  F30000
G1 X130.45 Y114.844 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430842
G1 F4448
G1 X130.45 Y141.156 E.83174
; WIPE_START
G1 F24000
G1 X130.45 Y139.156 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.728 J.975 P1  F30000
M73 P95 R0
G1 X134.033 Y141.832 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4448
G1 X133.632 Y142.233 E.01741
G1 X133.099 Y142.233
G1 X134.033 Y141.299 E.04059
G1 X134.033 Y140.765
G1 X132.565 Y142.233 E.06376
G1 X132.032 Y142.233
G1 X133.097 Y141.167 E.04629
G1 X132.564 Y141.167
G1 X131.499 Y142.233 E.04629
G1 X130.966 Y142.233
G1 X132.031 Y141.167 E.04629
G1 X131.497 Y141.167
G1 X130.432 Y142.233 E.04629
G1 X129.899 Y142.233
G1 X130.768 Y141.363 E.03777
G1 X130.235 Y141.363
G1 X129.366 Y142.233 E.03777
G1 X128.832 Y142.233
G1 X129.898 Y141.167 E.04629
G1 X129.364 Y141.167
G1 X128.299 Y142.233 E.04629
G1 X127.766 Y142.233
G1 X128.831 Y141.167 E.04629
G1 X128.298 Y141.167
G1 X127.233 Y142.233 E.04629
G1 X126.699 Y142.233
G1 X127.933 Y140.999 E.05359
G1 X127.933 Y140.466
G1 X126.166 Y142.233 E.07676
G1 X125.967 Y141.898
G1 X127.933 Y139.933 E.0854
G1 X127.933 Y139.4
G1 X125.967 Y141.365 E.0854
G1 X125.967 Y140.831
G1 X127.933 Y138.866 E.0854
G1 X127.933 Y138.333
G1 X125.967 Y140.298 E.0854
G1 X125.967 Y139.765
G1 X127.933 Y137.8 E.0854
G1 X127.933 Y137.266
G1 X125.967 Y139.232 E.0854
G1 X125.967 Y138.698
G1 X127.933 Y136.733 E.0854
G1 X127.933 Y136.2
G1 X125.967 Y138.165 E.0854
G1 X125.967 Y137.632
G1 X127.933 Y135.667 E.0854
G1 X127.933 Y135.133
G1 X125.967 Y137.099 E.0854
G1 X125.967 Y136.565
G1 X127.933 Y134.6 E.0854
G1 X127.933 Y134.067
G1 X125.967 Y136.032 E.0854
G1 X125.967 Y135.499
G1 X127.933 Y133.534 E.0854
G1 X127.933 Y133
G1 X125.967 Y134.966 E.0854
G1 X125.967 Y134.432
G1 X127.933 Y132.467 E.0854
G1 X127.933 Y131.934
G1 X125.967 Y133.899 E.0854
G1 X125.967 Y133.366
G1 X127.933 Y131.4 E.0854
G1 X127.933 Y130.867
G1 X125.967 Y132.832 E.0854
G1 X125.967 Y132.299
G1 X127.933 Y130.334 E.0854
G1 X127.933 Y129.801
G1 X125.967 Y131.766 E.0854
G1 X125.967 Y131.233
G1 X127.933 Y129.267 E.0854
G1 X127.933 Y128.734
G1 X125.967 Y130.699 E.0854
G1 X125.967 Y130.166
G1 X127.933 Y128.201 E.0854
G1 X127.933 Y127.668
G1 X125.967 Y129.633 E.0854
G1 X125.967 Y129.1
G1 X127.933 Y127.134 E.0854
G1 X127.933 Y126.601
G1 X125.967 Y128.566 E.0854
G1 X125.967 Y128.033
G1 X127.933 Y126.068 E.0854
G1 X127.933 Y125.535
G1 X125.967 Y127.5 E.0854
G1 X125.967 Y126.966
G1 X127.933 Y125.001 E.0854
G1 X127.933 Y124.468
G1 X125.967 Y126.433 E.0854
G1 X125.967 Y125.9
G1 X127.933 Y123.935 E.0854
G1 X127.933 Y123.401
G1 X125.967 Y125.367 E.0854
G1 X125.967 Y124.833
G1 X127.933 Y122.868 E.0854
G1 X127.933 Y122.335
G1 X125.967 Y124.3 E.0854
G1 X125.967 Y123.767
G1 X127.933 Y121.802 E.0854
G1 X127.933 Y121.268
G1 X125.967 Y123.234 E.0854
G1 X125.967 Y122.7
G1 X127.933 Y120.735 E.0854
M73 P96 R0
G1 X127.933 Y120.202
G1 X125.967 Y122.167 E.0854
G1 X125.967 Y121.634
G1 X127.933 Y119.669 E.0854
G1 X127.933 Y119.135
G1 X125.967 Y121.101 E.0854
G1 X125.967 Y120.567
G1 X127.933 Y118.602 E.0854
G1 X127.933 Y118.069
G1 X125.967 Y120.034 E.0854
G1 X125.967 Y119.501
G1 X127.933 Y117.535 E.0854
G1 X127.933 Y117.002
G1 X125.967 Y118.967 E.0854
G1 X125.967 Y118.434
G1 X127.933 Y116.469 E.0854
G1 X127.933 Y115.936
G1 X125.967 Y117.901 E.0854
G1 X125.967 Y117.368
G1 X127.933 Y115.402 E.0854
G1 X127.933 Y114.869
G1 X125.967 Y116.834 E.0854
M204 S10000
; WIPE_START
G1 F24000
G1 X127.382 Y115.42 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.175 J.315 P1  F30000
G1 X134.033 Y140.232 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
G1 F4448
G1 X133.167 Y141.097 E.0376
G1 X133.167 Y140.564
G1 X134.033 Y139.699 E.0376
G1 X134.033 Y139.166
G1 X133.167 Y140.031 E.0376
G1 X133.167 Y139.497
G1 X134.033 Y138.632 E.0376
G1 X134.033 Y138.099
G1 X133.167 Y138.964 E.0376
G1 X133.167 Y138.431
G1 X134.033 Y137.566 E.0376
G1 X134.033 Y137.032
G1 X133.167 Y137.898 E.0376
G1 X133.167 Y137.364
G1 X134.033 Y136.499 E.0376
G1 X134.033 Y135.966
G1 X133.167 Y136.831 E.0376
G1 X133.167 Y136.298
G1 X134.033 Y135.433 E.0376
G1 X134.033 Y134.899
G1 X133.167 Y135.765 E.0376
G1 X133.167 Y135.231
G1 X134.033 Y134.366 E.0376
G1 X134.033 Y133.833
G1 X133.167 Y134.698 E.0376
G1 X133.167 Y134.165
G1 X134.033 Y133.3 E.0376
G1 X134.033 Y132.766
G1 X133.167 Y133.631 E.0376
G1 X133.167 Y133.098
G1 X134.033 Y132.233 E.0376
G1 X134.033 Y131.7
G1 X133.167 Y132.565 E.0376
G1 X133.167 Y132.032
G1 X134.033 Y131.166 E.0376
G1 X134.033 Y130.633
G1 X133.167 Y131.498 E.0376
G1 X133.167 Y130.965
G1 X134.033 Y130.1 E.0376
G1 X134.033 Y129.567
G1 X133.167 Y130.432 E.0376
G1 X133.167 Y129.899
G1 X134.033 Y129.033 E.0376
G1 X134.033 Y128.5
G1 X133.167 Y129.365 E.0376
G1 X133.167 Y128.832
G1 X134.033 Y127.967 E.0376
G1 X134.033 Y127.434
G1 X133.167 Y128.299 E.0376
G1 X133.167 Y127.766
G1 X134.033 Y126.9 E.0376
G1 X134.033 Y126.367
G1 X133.167 Y127.232 E.0376
G1 X133.167 Y126.699
G1 X134.033 Y125.834 E.0376
G1 X134.033 Y125.3
G1 X133.167 Y126.166 E.0376
G1 X133.167 Y125.632
G1 X134.033 Y124.767 E.0376
G1 X134.033 Y124.234
G1 X133.167 Y125.099 E.0376
G1 X133.167 Y124.566
G1 X134.033 Y123.701 E.0376
G1 X134.033 Y123.167
G1 X133.167 Y124.033 E.0376
G1 X133.167 Y123.499
G1 X134.033 Y122.634 E.0376
G1 X134.033 Y122.101
G1 X133.167 Y122.966 E.0376
G1 X133.167 Y122.433
G1 X134.033 Y121.568 E.0376
G1 X134.033 Y121.034
G1 X133.167 Y121.9 E.0376
G1 X133.167 Y121.366
G1 X134.033 Y120.501 E.0376
G1 X134.033 Y119.968
G1 X133.167 Y120.833 E.0376
G1 X133.167 Y120.3
G1 X134.033 Y119.435 E.0376
G1 X134.033 Y118.901
G1 X133.167 Y119.766 E.0376
G1 X133.167 Y119.233
M73 P97 R0
G1 X134.033 Y118.368 E.0376
G1 X134.033 Y117.835
G1 X133.167 Y118.7 E.0376
G1 X133.167 Y118.167
G1 X134.033 Y117.301 E.0376
G1 X134.033 Y116.768
G1 X133.167 Y117.633 E.0376
G1 X133.167 Y117.1
G1 X134.033 Y116.235 E.0376
G1 X134.033 Y115.702
G1 X133.167 Y116.567 E.0376
G1 X133.167 Y116.034
G1 X134.033 Y115.168 E.0376
G1 X134.033 Y114.635
G1 X133.167 Y115.5 E.0376
G1 X133.167 Y114.967
G1 X134.033 Y114.102 E.0376
G1 X133.834 Y113.767
G1 X132.769 Y114.833 E.04629
G1 X132.235 Y114.833
G1 X133.301 Y113.767 E.04629
G1 X132.767 Y113.767
G1 X131.702 Y114.833 E.04629
G1 X131.169 Y114.833
G1 X132.234 Y113.767 E.04629
G1 X131.701 Y113.767
G1 X130.832 Y114.637 E.03777
G1 X130.298 Y114.637
G1 X131.167 Y113.767 E.03777
G1 X130.634 Y113.767
G1 X129.569 Y114.833 E.04629
G1 X129.036 Y114.833
G1 X130.101 Y113.767 E.04629
G1 X129.568 Y113.767
G1 X128.502 Y114.833 E.04629
G1 X127.969 Y114.833
G1 X129.034 Y113.767 E.04629
G1 X128.501 Y113.767
G1 X125.967 Y116.301 E.1101
G1 X125.967 Y115.768
G1 X127.968 Y113.767 E.08693
G1 X127.435 Y113.767
G1 X125.967 Y115.235 E.06375
G1 X125.967 Y114.701
G1 X126.901 Y113.767 E.04058
G1 X126.368 Y113.767
G1 X125.967 Y114.168 E.01741
M204 S10000
; WIPE_START
G1 F24000
G1 X126.368 Y113.767 E-.21528
G1 X126.901 Y113.767 E-.20264
G1 X126.265 Y114.404 E-.34208
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.303 J1.179 P1  F30000
G1 X127.933 Y114.833 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0945632
G1 F4448
G1 X127.818 Y114.718 E.00069
; WIPE_START
G1 F24000
G1 X127.933 Y114.833 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.027 J1.217 P1  F30000
G1 X131.098 Y114.762 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.151198
G1 F4448
G3 X130.854 Y114.772 I-.129 J-.182 E.00229
; WIPE_START
G1 F24000
G1 X130.931 Y114.804 E-.24474
G1 X130.999 Y114.804 E-.19821
G1 X131.098 Y114.762 E-.31705
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.213 J.099 P1  F30000
G1 X133.266 Y141.266 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.142079
G1 F4448
G3 X133.169 Y141.099 I.07 J-.152 E.00166
; WIPE_START
G1 F24000
G1 X133.184 Y141.184 E-.32324
G1 X133.266 Y141.266 E-.43676
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.065 J-1.215 P1  F30000
G1 X131.069 Y141.149 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.208329
G1 F4448
G1 X130.901 Y141.397 E.00403
; LINE_WIDTH: 0.184186
G1 X130.84 Y141.385 E.00072
; LINE_WIDTH: 0.156905
G1 X130.778 Y141.374 E.00058
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X130.84 Y141.385 E-.76
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
G1 Z6.5 F900 ; lower z a little
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

    G1 Z106 F600
    G1 Z104

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

