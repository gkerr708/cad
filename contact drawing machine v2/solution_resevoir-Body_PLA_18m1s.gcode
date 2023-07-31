; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 12m 13s; total estimated time: 18m 1s
; total layer number: 85
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
G1 X70 F15000
G1 X100 F5000
M73 P27 R12
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
    G29 A X121.5 Y125.5 I17 J9
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
; layer num/total_layer_count: 1/85
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
G1 X137.643 Y131.643 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F2536
G1 X122.357 Y131.643 E.56934
G1 X122.357 Y124.357 E.27137
G1 X137.643 Y124.357 E.56934
G1 X137.643 Y131.583 E.26914
G1 X138.1 Y132.1 F30000
; FEATURE: Outer wall
G1 F2536
G1 X121.9 Y132.1 E.60339
G1 X121.9 Y123.9 E.30542
M73 P30 R12
G1 X138.1 Y123.9 E.60339
G1 X138.1 Y132.04 E.30318
; WIPE_START
G1 F24000
G1 X136.1 Y132.047 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.215 J.066 P1  F30000
G1 X136.509 Y124.54 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.512863
G1 F2536
G1 X137.254 Y125.285 E.04038
G1 X137.254 Y125.95 E.02545
M73 P31 R12
G1 X136.05 Y124.746 E.06523
G1 X135.385 Y124.746 E.02545
G1 X137.254 Y126.615 E.10122
G1 X137.254 Y127.279 E.02545
G1 X134.721 Y124.746 E.13722
G1 X134.056 Y124.746 E.02545
G1 X137.254 Y127.944 E.17321
G1 X137.254 Y128.608 E.02545
G1 X133.392 Y124.746 E.2092
G1 X132.727 Y124.746 E.02545
G1 X137.254 Y129.273 E.24519
G1 X137.254 Y129.938 E.02545
G1 X132.062 Y124.746 E.28119
G1 X131.398 Y124.746 E.02545
G1 X137.254 Y130.602 E.31718
G1 X137.254 Y131.254 E.02497
G1 X130.733 Y124.746 E.35283
G1 X130.069 Y124.746 E.02545
G1 X136.577 Y131.254 E.3525
G1 X135.913 Y131.254 E.02545
G1 X129.404 Y124.746 E.3525
G1 X128.739 Y124.746 E.02545
G1 X135.248 Y131.254 E.3525
G1 X134.584 Y131.254 E.02545
G1 X128.075 Y124.746 E.3525
G1 X127.41 Y124.746 E.02545
M73 P32 R12
G1 X133.919 Y131.254 E.3525
G1 X133.254 Y131.254 E.02545
G1 X126.746 Y124.746 E.3525
G1 X126.081 Y124.746 E.02545
G1 X132.59 Y131.254 E.3525
G1 X131.925 Y131.254 E.02545
G1 X125.416 Y124.746 E.3525
G1 X124.752 Y124.746 E.02545
G1 X131.261 Y131.254 E.3525
G1 X130.596 Y131.254 E.02545
G1 X124.087 Y124.746 E.3525
G1 X123.423 Y124.746 E.02545
G1 X129.931 Y131.254 E.3525
G1 X129.267 Y131.254 E.02545
G1 X122.746 Y124.746 E.35283
G1 X122.746 Y125.398 E.02498
G1 X128.602 Y131.254 E.31717
G1 X127.938 Y131.254 E.02545
G1 X122.746 Y126.062 E.28118
G1 X122.746 Y126.727 E.02545
G1 X127.273 Y131.254 E.24519
G1 X126.608 Y131.254 E.02545
G1 X122.746 Y127.392 E.20919
G1 X122.746 Y128.056 E.02545
G1 X125.944 Y131.254 E.1732
G1 X125.279 Y131.254 E.02545
G1 X122.746 Y128.721 E.13721
G1 X122.746 Y129.385 E.02545
G1 X124.615 Y131.254 E.10122
G1 X123.95 Y131.254 E.02545
G1 X122.746 Y130.05 E.06522
G1 X122.746 Y130.715 E.02545
G1 X123.491 Y131.46 E.04037
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.746 Y130.715 E-.40061
G1 X122.746 Y130.05 E-.25255
G1 X122.944 Y130.249 E-.10684
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/85
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
G3 Z.6 I-.133 J1.21 P1  F30000
G1 X137.898 Y131.898 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3094
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3094
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.724 J.978 P1  F30000
G1 X136.969 Y131.734 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42135
G1 F3094
G1 X137.565 Y131.139 E.02597
G1 X137.565 Y130.604 E.0165
M73 P33 R12
G1 X136.604 Y131.565 E.04191
G1 X136.069 Y131.565 E.0165
G1 X137.565 Y130.069 E.06525
G1 X137.565 Y129.533 E.0165
G1 X135.533 Y131.565 E.08859
G1 X134.998 Y131.565 E.0165
G1 X137.565 Y128.998 E.11193
G1 X137.565 Y128.463 E.0165
G1 X134.463 Y131.565 E.13527
G1 X133.928 Y131.565 E.0165
G1 X137.565 Y127.928 E.1586
G1 X137.565 Y127.393 E.0165
G1 X133.393 Y131.565 E.18194
G1 X132.857 Y131.565 E.0165
G1 X137.565 Y126.857 E.20528
G1 X137.565 Y126.322 E.0165
G1 X132.322 Y131.565 E.22862
G1 X131.787 Y131.565 E.0165
G1 X137.565 Y125.787 E.25196
G1 X137.565 Y125.252 E.0165
G1 X131.252 Y131.565 E.2753
G1 X130.717 Y131.565 E.0165
G1 X137.565 Y124.717 E.29864
G1 X137.565 Y124.435 E.00868
G1 X137.311 Y124.435 E.00783
G1 X130.182 Y131.565 E.31091
G1 X129.646 Y131.565 E.0165
G1 X136.776 Y124.435 E.31091
G1 X136.24 Y124.435 E.0165
G1 X129.111 Y131.565 E.31091
G1 X128.576 Y131.565 E.0165
G1 X135.705 Y124.435 E.31091
G1 X135.17 Y124.435 E.0165
G1 X128.041 Y131.565 E.31091
G1 X127.506 Y131.565 E.0165
G1 X134.635 Y124.435 E.31091
G1 X134.1 Y124.435 E.0165
G1 X126.97 Y131.565 E.31091
G1 X126.435 Y131.565 E.0165
G1 X133.565 Y124.435 E.31091
G1 X133.029 Y124.435 E.0165
G1 X125.9 Y131.565 E.31091
G1 X125.365 Y131.565 E.0165
G1 X132.494 Y124.435 E.31091
G1 X131.959 Y124.435 E.0165
G1 X124.83 Y131.565 E.31091
G1 X124.295 Y131.565 E.0165
G1 X131.424 Y124.435 E.31091
G1 X130.889 Y124.435 E.0165
G1 X123.759 Y131.565 E.31091
G1 X123.224 Y131.565 E.0165
G1 X130.354 Y124.435 E.31091
G1 X129.818 Y124.435 E.0165
G1 X122.689 Y131.565 E.31091
G1 X122.435 Y131.565 E.00782
G1 X122.435 Y131.283 E.00868
G1 X129.283 Y124.435 E.29864
G1 X128.748 Y124.435 E.0165
G1 X122.435 Y130.748 E.2753
G1 X122.435 Y130.213 E.0165
G1 X128.213 Y124.435 E.25196
G1 X127.678 Y124.435 E.0165
G1 X122.435 Y129.678 E.22862
M73 P33 R11
G1 X122.435 Y129.142 E.0165
G1 X127.142 Y124.435 E.20528
G1 X126.607 Y124.435 E.0165
G1 X122.435 Y128.607 E.18194
G1 X122.435 Y128.072 E.0165
G1 X126.072 Y124.435 E.1586
G1 X125.537 Y124.435 E.0165
G1 X122.435 Y127.537 E.13526
G1 X122.435 Y127.002 E.0165
G1 X125.002 Y124.435 E.11192
G1 X124.467 Y124.435 E.0165
G1 X122.435 Y126.467 E.08858
G1 X122.435 Y125.931 E.0165
G1 X123.931 Y124.435 E.06524
G1 X123.396 Y124.435 E.0165
G1 X122.435 Y125.396 E.0419
G1 X122.435 Y124.861 E.0165
G1 X123.031 Y124.266 E.02596
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.435 Y124.861 E-.31992
G1 X122.435 Y125.396 E-.20337
G1 X122.876 Y124.956 E-.23671
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/85
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
G3 Z.8 I-.511 J1.105 P1  F30000
G1 X137.898 Y131.898 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3100
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3100
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.193 J.239 P1  F30000
G1 X137.734 Y125.031 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42135
G1 F3100
G1 X137.139 Y124.435 E.02597
G1 X136.604 Y124.435 E.0165
G1 X137.565 Y125.396 E.04191
G1 X137.565 Y125.931 E.0165
G1 X136.069 Y124.435 E.06525
G1 X135.533 Y124.435 E.0165
G1 X137.565 Y126.467 E.08859
G1 X137.565 Y127.002 E.0165
G1 X134.998 Y124.435 E.11193
G1 X134.463 Y124.435 E.0165
G1 X137.565 Y127.537 E.13527
G1 X137.565 Y128.072 E.0165
G1 X133.928 Y124.435 E.1586
G1 X133.393 Y124.435 E.0165
G1 X137.565 Y128.607 E.18194
G1 X137.565 Y129.143 E.0165
M73 P34 R11
G1 X132.857 Y124.435 E.20528
G1 X132.322 Y124.435 E.0165
G1 X137.565 Y129.678 E.22862
G1 X137.565 Y130.213 E.0165
G1 X131.787 Y124.435 E.25196
G1 X131.252 Y124.435 E.0165
G1 X137.565 Y130.748 E.2753
G1 X137.565 Y131.283 E.0165
G1 X130.717 Y124.435 E.29864
G1 X130.182 Y124.435 E.0165
G1 X137.311 Y131.565 E.31091
G1 X136.776 Y131.565 E.0165
G1 X129.646 Y124.435 E.31091
G1 X129.111 Y124.435 E.0165
G1 X136.24 Y131.565 E.31091
G1 X135.705 Y131.565 E.0165
G1 X128.576 Y124.435 E.31091
G1 X128.041 Y124.435 E.0165
G1 X135.17 Y131.565 E.31091
G1 X134.635 Y131.565 E.0165
G1 X127.506 Y124.435 E.31091
G1 X126.97 Y124.435 E.0165
G1 X134.1 Y131.565 E.31091
G1 X133.565 Y131.565 E.0165
G1 X126.435 Y124.435 E.31091
G1 X125.9 Y124.435 E.0165
G1 X133.029 Y131.565 E.31091
G1 X132.494 Y131.565 E.0165
G1 X125.365 Y124.435 E.31091
G1 X124.83 Y124.435 E.0165
G1 X131.959 Y131.565 E.31091
G1 X131.424 Y131.565 E.0165
G1 X124.295 Y124.435 E.31091
G1 X123.759 Y124.435 E.0165
G1 X130.889 Y131.565 E.31091
G1 X130.354 Y131.565 E.0165
G1 X123.224 Y124.435 E.31091
G1 X122.689 Y124.435 E.0165
G1 X129.818 Y131.565 E.31091
G1 X129.283 Y131.565 E.0165
G1 X122.435 Y124.717 E.29864
G1 X122.435 Y125.252 E.0165
G1 X128.748 Y131.565 E.2753
G1 X128.213 Y131.565 E.0165
G1 X122.435 Y125.787 E.25196
G1 X122.435 Y126.322 E.0165
G1 X127.678 Y131.565 E.22862
G1 X127.142 Y131.565 E.0165
G1 X122.435 Y126.858 E.20528
G1 X122.435 Y127.393 E.0165
G1 X126.607 Y131.565 E.18194
G1 X126.072 Y131.565 E.0165
G1 X122.435 Y127.928 E.1586
G1 X122.435 Y128.463 E.0165
G1 X125.537 Y131.565 E.13526
G1 X125.002 Y131.565 E.0165
G1 X122.435 Y128.998 E.11192
G1 X122.435 Y129.533 E.0165
G1 X124.467 Y131.565 E.08858
G1 X123.931 Y131.565 E.0165
G1 X122.435 Y130.069 E.06524
G1 X122.435 Y130.604 E.0165
G1 X123.396 Y131.565 E.0419
G1 X122.861 Y131.565 E.0165
G1 X122.266 Y130.969 E.02596
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.861 Y131.565 E-.31992
G1 X123.396 Y131.565 E-.20337
G1 X122.956 Y131.124 E-.23671
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/85
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
G3 Z1 I-.063 J1.215 P1  F30000
G1 X137.898 Y131.898 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.837 J-.883 P1  F30000
G1 X128.079 Y124.45 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.45 Y124.45 E.05401
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X122.45 Y128.126 E.1606
G1 X122.45 Y127.874 E.00838
G1 X125.874 Y124.45 E.1606
G1 X124.245 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.874 Y124.45 E-.61876
G1 X125.611 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/85
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
G3 Z1.2 I-.614 J1.051 P1  F30000
G1 X137.898 Y131.898 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.837 J-.883 P1  F30000
G1 X128.079 Y124.45 Z1.4
M73 P35 R11
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.45 Y124.45 E.05401
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X122.45 Y128.126 E.1606
G1 X122.45 Y127.874 E.00838
G1 X125.874 Y124.45 E.1606
G1 X124.245 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.874 Y124.45 E-.61876
G1 X125.611 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/85
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
G3 Z1.4 I-.614 J1.051 P1  F30000
G1 X137.898 Y131.898 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.837 J-.883 P1  F30000
G1 X128.079 Y124.45 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.45 Y124.45 E.05401
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
M73 P36 R11
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X122.45 Y128.126 E.1606
G1 X122.45 Y127.874 E.00838
G1 X125.874 Y124.45 E.1606
G1 X124.245 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.874 Y124.45 E-.61876
G1 X125.611 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/85
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
G3 Z1.6 I-.614 J1.051 P1  F30000
G1 X137.898 Y131.898 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.837 J-.883 P1  F30000
G1 X128.079 Y124.45 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.45 Y124.45 E.05401
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X122.45 Y128.126 E.1606
G1 X122.45 Y127.874 E.00838
G1 X125.874 Y124.45 E.1606
G1 X124.245 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.874 Y124.45 E-.61876
G1 X125.611 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/85
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
G3 Z1.8 I-.614 J1.051 P1  F30000
G1 X137.898 Y131.898 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P37 R11
G3 Z2 I.837 J-.883 P1  F30000
G1 X128.079 Y124.45 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.45 Y124.45 E.05401
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X122.45 Y128.126 E.1606
G1 X122.45 Y127.874 E.00838
G1 X125.874 Y124.45 E.1606
G1 X124.245 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.874 Y124.45 E-.61876
G1 X125.611 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/85
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
G3 Z2 I-.614 J1.051 P1  F30000
G1 X137.898 Y131.898 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.837 J-.883 P1  F30000
G1 X128.079 Y124.45 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.45 Y124.45 E.05401
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
M73 P38 R11
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X122.45 Y128.126 E.1606
G1 X122.45 Y127.874 E.00838
G1 X125.874 Y124.45 E.1606
G1 X124.245 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.874 Y124.45 E-.61876
G1 X125.611 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/85
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
G3 Z2.2 I-.614 J1.051 P1  F30000
G1 X137.898 Y131.898 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.837 J-.883 P1  F30000
G1 X128.079 Y124.45 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.45 Y124.45 E.05401
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X122.45 Y128.126 E.1606
G1 X122.45 Y127.874 E.00838
G1 X125.874 Y124.45 E.1606
G1 X124.245 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.874 Y124.45 E-.61876
G1 X125.611 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/85
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
G3 Z2.4 I-.614 J1.051 P1  F30000
G1 X137.898 Y131.898 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
M73 P39 R11
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
M73 P39 R10
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.837 J-.883 P1  F30000
G1 X128.079 Y124.45 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.45 Y124.45 E.05401
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X122.45 Y128.126 E.1606
G1 X122.45 Y127.874 E.00838
G1 X125.874 Y124.45 E.1606
G1 X124.245 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.874 Y124.45 E-.61876
G1 X125.611 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/85
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
G3 Z2.6 I-.614 J1.051 P1  F30000
G1 X137.898 Y131.898 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.837 J-.883 P1  F30000
G1 X128.079 Y124.45 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.45 Y124.45 E.05401
M73 P40 R10
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X122.45 Y128.126 E.1606
G1 X122.45 Y127.874 E.00838
G1 X125.874 Y124.45 E.1606
G1 X124.245 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.874 Y124.45 E-.61876
G1 X125.611 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/85
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
G3 Z2.8 I-.614 J1.051 P1  F30000
G1 X137.898 Y131.898 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.837 J-.883 P1  F30000
G1 X128.079 Y124.45 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.45 Y124.45 E.05401
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X122.45 Y128.126 E.1606
G1 X122.45 Y127.874 E.00838
G1 X125.874 Y124.45 E.1606
G1 X124.245 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P41 R10
G1 X125.874 Y124.45 E-.61876
G1 X125.611 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/85
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
G3 Z3 I-.614 J1.051 P1  F30000
G1 X137.898 Y131.898 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.837 J-.883 P1  F30000
G1 X128.079 Y124.45 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.45 Y124.45 E.05401
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X122.45 Y128.126 E.1606
G1 X122.45 Y127.874 E.00838
G1 X125.874 Y124.45 E.1606
G1 X124.245 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.874 Y124.45 E-.61876
G1 X125.611 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/85
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
G3 Z3.2 I-.614 J1.051 P1  F30000
G1 X137.898 Y131.898 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.837 J-.883 P1  F30000
G1 X128.079 Y124.45 Z3.4
M73 P42 R10
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.45 Y124.45 E.05401
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X122.45 Y128.126 E.1606
G1 X122.45 Y127.874 E.00838
G1 X125.874 Y124.45 E.1606
G1 X124.245 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.874 Y124.45 E-.61876
G1 X125.611 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/85
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
G3 Z3.4 I-.614 J1.051 P1  F30000
G1 X137.898 Y131.898 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.837 J-.883 P1  F30000
G1 X128.079 Y124.45 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.45 Y124.45 E.05401
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
M73 P43 R10
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X122.45 Y128.126 E.1606
G1 X122.45 Y127.874 E.00838
G1 X125.874 Y124.45 E.1606
G1 X124.245 Y124.45 E.05401
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.874 Y124.45 E-.61876
G1 X125.611 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/85
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
G3 Z3.6 I-.614 J1.051 P1  F30000
G1 X137.898 Y131.898 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1392
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1392
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.797 J-.92 P1  F30000
G1 X133.184 Y129.547 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1392
G1 X133.175 Y131.175 E.05401
G1 X133.55 Y131.55 E.01759
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X133.179 Y124.821 E.01738
G1 X133.188 Y126.449 E.05401
G1 X132.787 Y127.531 F30000
G1 F1392
G1 X132.77 Y124.45 E.10218
G1 X124.23 Y124.45 E.28329
G2 X124.234 Y131.55 I319.824 J3.353 E.2355
G1 X132.766 Y131.55 E.283
G2 X132.788 Y127.591 I-343.08 J-3.875 E.13133
G1 X131.51 Y124.857 F30000
G1 F1392
G1 X132.365 Y124.857 E.02837
G1 X132.37 Y125.63 E.02564
G1 X126.857 Y131.143 E.25858
G1 X125.467 Y131.143 E.04614
G1 X124.635 Y130.311 E.03903
G3 X124.63 Y125.694 I208.185 J-2.507 E.15315
G1 X125.467 Y124.857 E.03924
G1 X126.857 Y124.857 E.04614
G1 X132.365 Y130.365 E.25838
G1 X132.361 Y131.143 E.02579
G1 X131.51 Y131.143 E.02822
G1 X123.825 Y131.12 F30000
G1 F1392
G1 X123.816 Y129.492 E.05401
G1 X122.45 Y128.126 E.06406
M73 P44 R10
G1 X122.45 Y127.874 E.00838
G1 X123.811 Y126.513 E.06385
G1 X123.82 Y124.884 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.811 Y126.513 E-.61876
G1 X123.549 Y126.775 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/85
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
G3 Z3.8 I-.409 J1.146 P1  F30000
G1 X137.898 Y131.898 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1392
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1392
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.797 J-.92 P1  F30000
G1 X133.184 Y129.547 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1392
G1 X133.175 Y131.175 E.05401
G1 X133.55 Y131.55 E.01759
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
M73 P44 R9
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X133.179 Y124.821 E.01738
G1 X133.188 Y126.449 E.05401
G1 X132.787 Y127.531 F30000
G1 F1392
G1 X132.77 Y124.45 E.10218
G1 X124.23 Y124.45 E.28329
G2 X124.234 Y131.55 I319.824 J3.353 E.2355
G1 X132.766 Y131.55 E.283
G2 X132.788 Y127.591 I-343.08 J-3.875 E.13133
G1 X131.51 Y124.857 F30000
G1 F1392
G1 X132.365 Y124.857 E.02837
G1 X132.37 Y125.63 E.02564
G1 X126.857 Y131.143 E.25858
G1 X125.467 Y131.143 E.04614
G1 X124.635 Y130.311 E.03903
G3 X124.63 Y125.694 I208.185 J-2.507 E.15315
G1 X125.467 Y124.857 E.03924
G1 X126.857 Y124.857 E.04614
G1 X132.365 Y130.365 E.25838
G1 X132.361 Y131.143 E.02579
G1 X131.51 Y131.143 E.02822
G1 X123.825 Y131.12 F30000
G1 F1392
G1 X123.816 Y129.492 E.05401
G1 X122.45 Y128.126 E.06406
G1 X122.45 Y127.874 E.00838
G1 X123.811 Y126.513 E.06385
G1 X123.82 Y124.884 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.811 Y126.513 E-.61876
G1 X123.549 Y126.775 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/85
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
G3 Z4 I-.409 J1.146 P1  F30000
M73 P45 R9
G1 X137.898 Y131.898 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1400
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1400
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.96 J-.748 P1  F30000
G1 X135.755 Y131.55 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1400
G1 X135.218 Y131.55 E.01779
G1 X135.218 Y130.458 E.03622
G1 X137.55 Y128.126 E.10937
G1 X137.55 Y127.874 E.00838
G1 X135.218 Y125.542 E.10937
G1 X135.218 Y124.45 E.03622
G1 X135.755 Y124.45 E.01779
G1 X134.404 Y125.224 F30000
G1 F1400
G1 X134.404 Y124.857 E.01217
G1 X133.143 Y124.857 E.04185
G1 X126.857 Y131.143 E.29485
G1 X125.467 Y131.143 E.04614
G1 X124.635 Y130.311 E.03903
G3 X124.63 Y125.694 I208.185 J-2.507 E.15315
G1 X125.467 Y124.857 E.03924
G1 X126.857 Y124.857 E.04614
G1 X133.143 Y131.143 E.29485
G1 X134.404 Y131.143 E.04185
G1 X134.404 Y130.776 E.01217
G1 X134.811 Y131.49 F30000
G1 F1400
G1 X134.811 Y124.45 E.23351
G1 X124.23 Y124.45 E.351
G2 X124.234 Y131.55 I319.824 J3.353 E.2355
G1 X134.811 Y131.55 E.35085
G1 X123.825 Y131.12 F30000
G1 F1400
G1 X123.816 Y129.492 E.05401
G1 X122.45 Y128.126 E.06406
G1 X122.45 Y127.874 E.00838
G1 X123.811 Y126.513 E.06385
G1 X123.82 Y124.884 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.811 Y126.513 E-.61876
G1 X123.549 Y126.775 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/85
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
G3 Z4.2 I-.409 J1.146 P1  F30000
G1 X137.898 Y131.898 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1400
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1400
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.96 J-.748 P1  F30000
G1 X135.755 Y131.55 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1400
G1 X135.218 Y131.55 E.01779
G1 X135.218 Y130.458 E.03622
G1 X137.55 Y128.126 E.10937
M73 P46 R9
G1 X137.55 Y127.874 E.00838
G1 X135.218 Y125.542 E.10937
G1 X135.218 Y124.45 E.03622
G1 X135.755 Y124.45 E.01779
G1 X134.404 Y125.224 F30000
G1 F1400
G1 X134.404 Y124.857 E.01217
G1 X133.143 Y124.857 E.04185
G1 X126.857 Y131.143 E.29485
G1 X125.467 Y131.143 E.04614
G1 X124.635 Y130.311 E.03903
G3 X124.63 Y125.694 I208.185 J-2.507 E.15315
G1 X125.467 Y124.857 E.03924
G1 X126.857 Y124.857 E.04614
G1 X133.143 Y131.143 E.29485
G1 X134.404 Y131.143 E.04185
G1 X134.404 Y130.776 E.01217
G1 X134.811 Y131.49 F30000
G1 F1400
G1 X134.811 Y124.45 E.23351
G1 X124.23 Y124.45 E.351
G2 X124.234 Y131.55 I319.824 J3.353 E.2355
G1 X134.811 Y131.55 E.35085
G1 X123.825 Y131.12 F30000
G1 F1400
G1 X123.816 Y129.492 E.05401
G1 X122.45 Y128.126 E.06406
G1 X122.45 Y127.874 E.00838
G1 X123.811 Y126.513 E.06385
G1 X123.82 Y124.884 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.811 Y126.513 E-.61876
G1 X123.549 Y126.775 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/85
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
G3 Z4.4 I-.409 J1.146 P1  F30000
G1 X137.898 Y131.898 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1616
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1616
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.96 J-.748 P1  F30000
G1 X135.755 Y131.55 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1616
G1 X135.218 Y131.55 E.01779
G1 X135.218 Y130.458 E.03622
G1 X137.55 Y128.126 E.10937
G1 X137.55 Y127.874 E.00838
G1 X135.218 Y125.542 E.10937
G1 X135.218 Y124.45 E.03622
G1 X135.755 Y124.45 E.01779
G1 X134.811 Y131.49 F30000
G1 F1616
G1 X134.811 Y124.45 E.23351
G1 X133.177 Y124.45 E.0542
G3 X133.173 Y131.55 I-319.927 J3.353 E.2355
G1 X134.811 Y131.55 E.05435
G1 X132.778 Y131.731 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.422747
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X132.737 Y124.472 E.41513
G1 X132.264 Y124.472 E.02704
G1 X132.304 Y131.528 E.40355
M73 P47 R9
G1 X131.831 Y131.528 E.02704
G1 X131.792 Y124.472 E.40355
G1 X131.319 Y124.472 E.02704
G1 X131.358 Y131.528 E.40355
G1 X130.886 Y131.528 E.02704
G1 X130.846 Y124.472 E.40355
G1 X130.373 Y124.472 E.02704
G1 X130.413 Y131.528 E.40355
G1 X129.94 Y131.528 E.02704
G1 X129.901 Y124.472 E.40355
G1 X129.428 Y124.472 E.02704
G1 X129.467 Y131.528 E.40355
G1 X128.995 Y131.528 E.02704
G1 X128.955 Y124.472 E.40355
G1 X128.482 Y124.472 E.02704
G1 X128.522 Y131.528 E.40355
G1 X128.049 Y131.528 E.02704
G1 X128.01 Y124.472 E.40355
G1 X127.537 Y124.472 E.02704
G1 X127.576 Y131.528 E.40355
G1 X127.104 Y131.528 E.02704
G1 X127.064 Y124.472 E.40355
G1 X126.591 Y124.472 E.02704
G1 X126.631 Y131.528 E.40355
G1 X126.158 Y131.528 E.02704
G1 X126.119 Y124.472 E.40355
G1 X125.646 Y124.472 E.02704
G1 X125.685 Y131.528 E.40355
G1 X125.213 Y131.528 E.02704
G1 X125.173 Y124.472 E.40355
G1 X124.7 Y124.472 E.02704
G1 X124.74 Y131.528 E.40355
G1 X124.267 Y131.528 E.02704
G1 X124.227 Y124.269 E.41513
M106 S252.45
G1 X123.82 Y124.884 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1616
G1 X123.811 Y126.513 E.05401
G1 X122.45 Y127.874 E.06385
G1 X122.45 Y128.126 E.00838
G1 X123.816 Y129.492 E.06406
G1 X123.825 Y131.12 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.816 Y129.492 E-.61876
G1 X123.553 Y129.229 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/85
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
G3 Z4.6 I-.223 J1.196 P1  F30000
G1 X137.898 Y131.898 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2356
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.898 Y124.102 E.52398
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2356
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.96 J-.748 P1  F30000
G1 X135.755 Y131.55 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2356
G1 X135.218 Y131.55 E.01779
G1 X135.218 Y130.458 E.03622
G1 X137.55 Y128.126 E.10937
G1 X137.55 Y127.874 E.00838
G1 X135.218 Y125.542 E.10937
G1 X135.218 Y124.45 E.03622
G1 X135.755 Y124.45 E.01779
G1 X134.811 Y131.49 F30000
G1 F2356
G1 X134.811 Y124.45 E.23351
G1 X133.177 Y124.45 E.0542
G3 X133.173 Y131.55 I-319.931 J3.353 E.2355
G1 X134.811 Y131.55 E.05435
G1 X132.106 Y131.734 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427505
G1 F2356
G1 X132.783 Y131.057 E.03003
G1 X132.786 Y130.51 E.01714
G1 X131.732 Y131.565 E.04675
G1 X131.188 Y131.565 E.01704
G1 X132.789 Y129.963 E.07099
G1 X132.793 Y129.416 E.01714
G1 X130.644 Y131.565 E.09523
G1 X130.1 Y131.565 E.01704
G1 X132.796 Y128.869 E.11946
G1 X132.799 Y128.322 E.01714
G1 X129.556 Y131.565 E.1437
G1 X129.012 Y131.565 E.01704
G1 X132.802 Y127.775 E.16794
G1 X132.801 Y127.232 E.01701
G1 X128.468 Y131.565 E.192
G1 X127.924 Y131.565 E.01704
G1 X132.798 Y126.692 E.21597
G1 X132.795 Y126.151 E.01695
G1 X127.381 Y131.565 E.23994
G1 X126.837 Y131.565 E.01704
G1 X132.791 Y125.61 E.26391
G1 X132.788 Y125.069 E.01695
G1 X126.293 Y131.565 E.28789
G1 X125.749 Y131.565 E.01704
G1 X132.785 Y124.528 E.31186
G1 X132.785 Y124.435 E.00291
M73 P48 R9
G1 X132.334 Y124.435 E.01412
G1 X125.205 Y131.565 E.31597
G1 X124.661 Y131.565 E.01704
G1 X131.79 Y124.435 E.31597
G1 X131.247 Y124.435 E.01704
G1 X124.219 Y131.463 E.31147
G1 X124.216 Y130.922 E.01695
G1 X130.703 Y124.435 E.2875
G1 X130.159 Y124.435 E.01704
G1 X124.213 Y130.381 E.26352
G1 X124.21 Y129.84 E.01695
G1 X129.615 Y124.435 E.23955
G1 X129.071 Y124.435 E.01704
G1 X124.207 Y129.3 E.21558
G1 X124.204 Y128.759 E.01695
G1 X128.527 Y124.435 E.19161
G1 X127.983 Y124.435 E.01704
G1 X124.201 Y128.218 E.16764
G1 X124.198 Y127.677 E.01695
G1 X127.439 Y124.435 E.14367
G1 X126.896 Y124.435 E.01704
G1 X124.2 Y127.131 E.11946
G1 X124.203 Y126.584 E.01714
G1 X126.352 Y124.435 E.09522
G1 X125.808 Y124.435 E.01704
G1 X124.206 Y126.037 E.07098
G1 X124.209 Y125.49 E.01714
G1 X125.264 Y124.435 E.04674
G1 X124.72 Y124.435 E.01704
G1 X124.042 Y125.114 E.03007
G1 X123.82 Y124.884 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2356
G1 X123.811 Y126.513 E.05401
G1 X122.45 Y127.874 E.06385
G1 X122.45 Y128.126 E.00838
G1 X123.816 Y129.492 E.06406
G1 X123.825 Y131.12 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.816 Y129.492 E-.61876
G1 X123.553 Y129.229 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/85
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
G3 Z4.8 I-.223 J1.196 P1  F30000
G1 X137.898 Y131.898 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2938
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X126.465 Y124.102 E.14474
G1 X126.446 Y127.6 E.11605
G1 X126.468 Y131.578 E.13194
G1 X130.532 Y131.578 E.13482
G2 X130.535 Y124.102 I-335.902 J-3.854 E.24799
G1 X137.898 Y124.102 E.24425
G1 X137.898 Y131.838 E.25661
G1 X138.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2938
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.29 Y123.71 E.50946
G1 X138.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X136.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.96 J-.748 P1  F30000
G1 X135.755 Y131.55 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2938
G1 X135.218 Y131.55 E.01779
G1 X135.218 Y130.458 E.03622
G1 X137.55 Y128.126 E.10937
G1 X137.55 Y127.874 E.00838
G1 X135.218 Y125.542 E.10937
G1 X135.218 Y124.45 E.03622
G1 X135.755 Y124.45 E.01779
G1 X132.775 Y124.269 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.447616
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X132.816 Y131.528 E.46541
G1 X133.313 Y131.528 E.03191
G1 X133.274 Y124.472 E.45243
G1 X133.771 Y124.472 E.03191
G1 X133.811 Y131.528 E.45243
G1 X134.308 Y131.528 E.03191
G1 X134.269 Y124.472 E.45243
G1 X134.767 Y124.472 E.03191
G1 X134.807 Y131.731 E.46541
M106 S252.45
G1 X132.511 Y131.637 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F2938
G2 X132.516 Y124.423 I-325.693 J-3.819 E.19987
G1 X132.442 Y124.843 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2938
G1 X131.924 Y124.324 E.02253
G1 X131.39 Y124.324
G1 X132.445 Y125.379 E.04583
G1 X132.448 Y125.915
G1 X130.857 Y124.324 E.06913
G1 X130.761 Y124.761
G1 X132.451 Y126.452 E.07346
G1 X132.454 Y126.988
G1 X130.764 Y125.298 E.07346
G1 X130.767 Y125.834
G1 X132.457 Y127.524 E.07346
G1 X132.455 Y128.055
G1 X130.77 Y126.37 E.07324
G1 X130.773 Y126.906
G1 X132.452 Y128.586 E.07298
G1 X132.449 Y129.116
G1 X130.776 Y127.443 E.07272
G1 X130.774 Y127.975
G1 X132.446 Y129.646 E.07264
G1 X132.443 Y130.177
G1 X130.772 Y128.505 E.07264
G1 X130.769 Y129.035
G1 X132.44 Y130.707 E.07264
G1 X132.437 Y131.237
G1 X130.766 Y129.566 E.07264
G1 X130.763 Y130.096
G1 X132.342 Y131.676 E.06864
G1 X131.809 Y131.676
G1 X130.76 Y130.626 E.04559
G1 X130.757 Y131.157
G1 X131.276 Y131.676 E.02255
M204 S10000
G1 X130.313 Y124.314 F30000
M204 S2000
G1 F2938
G1 X129.917 Y123.917 E.01723
G1 X129.384 Y123.917
G1 X130.316 Y124.85 E.04054
G1 X130.319 Y125.387
G1 X128.85 Y123.917 E.06384
G1 X128.317 Y123.917
G1 X130.322 Y125.923 E.08714
G1 X130.325 Y126.459
G1 X127.784 Y123.917 E.11045
G1 X127.25 Y123.917
G1 X130.328 Y126.995 E.13375
G1 X130.331 Y127.532
G1 X126.717 Y123.917 E.15705
G1 X126.686 Y124.419
G1 X130.329 Y128.063 E.15832
G1 X130.326 Y128.593
G1 X126.683 Y124.95 E.15832
M73 P49 R9
G1 X126.68 Y125.48
G1 X130.323 Y129.123 E.15832
G1 X130.32 Y129.654
G1 X126.677 Y126.01 E.15832
G1 X126.674 Y126.541
G1 X130.317 Y130.184 E.15832
G1 X130.314 Y130.714
G1 X126.671 Y127.071 E.15832
G1 X126.668 Y127.601
G1 X130.312 Y131.245 E.15832
G1 X129.889 Y131.355
G1 X126.671 Y128.138 E.13983
G1 X126.674 Y128.674
G1 X129.356 Y131.355 E.11653
G1 X128.823 Y131.355
G1 X126.677 Y129.21 E.09323
G1 X126.68 Y129.746
G1 X128.289 Y131.355 E.06992
G1 X127.756 Y131.355
G1 X126.683 Y130.283 E.04662
G1 X126.686 Y130.819
G1 X127.223 Y131.355 E.02332
M204 S10000
G1 X124.335 Y127.608 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2938
G1 X124.352 Y124.494 E.09567
G1 X122.494 Y124.494 E.0571
G1 X122.494 Y131.506 E.21545
G1 X124.357 Y131.506 E.05723
G1 X124.335 Y127.668 E.11794
G1 X123.958 Y127.609 F30000
G1 F2938
G1 X123.973 Y124.871 E.08412
G1 X122.871 Y124.871 E.03386
G1 X122.871 Y131.129 E.19228
G1 X123.978 Y131.129 E.03399
G1 X123.958 Y127.669 E.10632
G1 X123.592 Y127.614 F30000
; LINE_WIDTH: 0.401843
G1 F2938
G1 X123.592 Y127.604 E.0003
G3 X123.602 Y125.24 I851.224 J2.451 E.06912
G1 X123.24 Y125.24 E.01059
G2 X123.241 Y130.759 I1068.345 J2.549 E.1614
G1 X123.605 Y130.759 E.01065
G3 X123.592 Y127.674 I1113.07 J-6.268 E.09022
G1 X125.524 Y124.324 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2938
G1 X126.238 Y125.038 E.03099
G1 X126.235 Y125.568
G1 X124.991 Y124.324 E.05404
G1 X124.56 Y124.427
G1 X126.232 Y126.098 E.07264
G1 X126.229 Y126.629
G1 X124.557 Y124.957 E.07264
G1 X124.554 Y125.487
G1 X126.226 Y127.159 E.07264
G1 X126.224 Y127.69
G1 X124.551 Y126.018 E.07269
G1 X124.548 Y126.548
G1 X126.227 Y128.227 E.07294
G1 X126.23 Y128.763
G1 X124.545 Y127.078 E.0732
G1 X124.542 Y127.609
G1 X126.233 Y129.299 E.07345
G1 X126.236 Y129.835
G1 X124.545 Y128.145 E.07345
G1 X124.548 Y128.681
G1 X126.239 Y130.371 E.07345
G1 X126.242 Y130.908
G1 X124.551 Y129.217 E.07345
G1 X124.554 Y129.754
G1 X126.245 Y131.444 E.07345
G1 X125.943 Y131.676
G1 X124.557 Y130.29 E.06021
G1 X124.56 Y130.826
G1 X125.41 Y131.676 E.03691
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.56 Y130.826 E-.45648
G1 X124.557 Y130.29 E-.20378
G1 X124.743 Y130.475 E-.09975
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/85
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
G3 Z5 I-.333 J1.17 P1  F30000
G1 X126.941 Y131.101 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2481
G1 X126.941 Y131.102 E.00004
G1 X130.059 Y131.102 E.10343
G2 X130.059 Y124.102 I-314.536 J-3.497 E.23221
G1 X137.898 Y124.102 E.26003
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X126.941 Y124.102 E.16052
G1 X126.922 Y127.6 E.11605
G1 X126.941 Y131.041 E.11413
G1 X127.331 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2481
G1 X129.669 Y130.71 E.07185
G2 X129.665 Y123.71 I-521.25 J-3.19 E.21509
G1 X138.29 Y123.71 E.26502
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X127.335 Y123.71 E.17284
G1 X127.335 Y123.723 E.00041
G2 X127.33 Y130.65 I313.912 J3.689 E.21284
M204 S10000
; WIPE_START
G1 F24000
G1 X129.33 Y130.701 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.359 J-1.163 P1  F30000
G1 X126.74 Y131.5 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2481
G1 X130.26 Y131.5 E.11153
G1 X132.408 Y127.612 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.526336
G1 F2481
G3 X132.399 Y129.566 I-705.411 J-2.082 E.07697
G1 X132.886 Y129.566 E.01919
G2 X132.888 Y126.675 I-1281.291 J-1.933 E.11391
G1 X132.888 Y126.433 E.00952
G1 X132.403 Y126.433 E.0191
G1 X132.408 Y127.552 E.0441
G1 X131.979 Y127.6 F30000
; LINE_WIDTH: 0.419999
G1 F2481
G1 X131.966 Y129.998 E.07366
G1 X133.318 Y129.998 E.04155
G1 X133.318 Y126.002 E.12276
G1 X131.97 Y126.002 E.04142
G1 X131.979 Y127.54 E.04726
G1 X131.602 Y127.6 F30000
G1 F2481
G1 X131.586 Y130.375 E.08524
G1 X133.695 Y130.375 E.06479
G1 X133.695 Y125.625 E.14593
G1 X131.591 Y125.625 E.06466
G1 X131.601 Y127.54 E.05885
G1 X131.225 Y127.6 F30000
G1 F2481
G1 X131.208 Y130.551 E.09066
G1 X131.264 Y130.582 E.00195
G1 X131.312 Y130.752 E.00543
G1 X134.072 Y130.752 E.08479
G1 X134.072 Y125.248 E.1691
G1 X131.212 Y125.248 E.08789
G1 X131.224 Y127.54 E.07043
G1 X130.848 Y127.6 F30000
G1 F2481
G1 X130.83 Y130.718 E.09581
G1 X130.944 Y130.781 E.00399
G1 X131.029 Y131.129 E.01099
G1 X134.449 Y131.129 E.10507
G1 X134.449 Y124.871 E.19228
G1 X130.832 Y124.871 E.11113
G1 X130.847 Y127.54 E.08202
G1 X130.471 Y127.602 F30000
G1 F2481
G1 X130.452 Y130.892 E.10111
G1 X130.624 Y130.981 E.00594
G1 X130.652 Y131.506 E.01616
G1 X134.826 Y131.506 E.12825
G1 X134.826 Y124.494 E.21545
G1 X130.453 Y124.494 E.13437
G1 X130.47 Y127.542 E.09364
; WIPE_START
G1 F24000
G1 X130.459 Y125.542 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.565 J-1.078 P1  F30000
G1 X126.529 Y127.599 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F2481
G1 X126.547 Y124.494 E.09542
G1 X122.494 Y124.494 E.12453
G1 X122.494 Y131.506 E.21545
G1 X126.348 Y131.506 E.1184
G1 X126.376 Y130.981 E.01616
G1 X126.548 Y130.88 E.00611
G1 X126.53 Y127.659 E.09898
G1 X126.152 Y127.6 F30000
G1 F2481
G1 X126.168 Y124.871 E.08386
G1 X122.871 Y124.871 E.10129
G1 X122.871 Y131.129 E.19228
G1 X125.971 Y131.129 E.09523
G1 X126.056 Y130.781 E.01099
G1 X126.17 Y130.718 E.00399
G1 X126.153 Y127.66 E.09396
G1 X125.775 Y127.6 F30000
G1 F2481
G1 X125.788 Y125.248 E.07228
G1 X123.248 Y125.248 E.07805
G1 X123.248 Y130.752 E.1691
G1 X125.688 Y130.752 E.07495
G1 X125.736 Y130.582 E.00543
G1 X125.792 Y130.551 E.00195
G1 X125.776 Y127.66 E.08882
G1 X125.398 Y127.6 F30000
G1 F2481
G1 X125.409 Y125.625 E.06069
G1 X123.625 Y125.625 E.05481
G1 X123.625 Y130.375 E.14593
G1 X125.414 Y130.375 E.05495
M73 P50 R9
G1 X125.399 Y127.66 E.0834
G1 X125.021 Y127.6 F30000
G1 F2481
G1 X125.03 Y126.002 E.0491
G1 X124.002 Y126.002 E.03157
G1 X124.002 Y129.998 E.12276
G1 X125.034 Y129.998 E.03171
G1 X125.021 Y127.66 E.07181
G1 X124.672 Y127.612 F30000
; LINE_WIDTH: 0.366237
G1 F2481
G3 X124.678 Y126.353 I1276.245 J4.842 E.03317
G1 X124.353 Y126.353 E.00856
G2 X124.354 Y129.646 I667.211 J1.424 E.08676
G1 X124.681 Y129.646 E.00861
G3 X124.672 Y127.672 I710.963 J-4.029 E.05201
; WIPE_START
G1 F24000
G1 X124.681 Y129.646 E-.75019
G1 X124.655 Y129.646 E-.00981
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.516 J1.102 P1  F30000
G1 X135.755 Y124.45 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2481
M73 P50 R8
G1 X135.218 Y124.45 E.01779
G1 X135.218 Y125.542 E.03622
G1 X137.55 Y127.874 E.10937
G1 X137.55 Y128.126 E.00838
G1 X135.218 Y130.458 E.10937
G1 X135.218 Y131.55 E.03622
G1 X135.755 Y131.55 E.01779
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.218 Y131.55 E-.20382
G1 X135.218 Y130.458 E-.41494
G1 X135.481 Y130.195 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/85
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
G3 Z5.2 I-.177 J-1.204 P1  F30000
G1 X126.087 Y131.578 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2657
G1 X132.578 Y131.578 E.2153
G1 X132.578 Y124.422 E.23736
G1 X130.428 Y124.422 E.07133
G1 X130.432 Y124.102 E.01062
G1 X137.898 Y124.102 E.24765
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X126.568 Y124.102 E.14813
G1 X126.572 Y124.422 E.01062
G1 X124.422 Y124.422 E.07133
G1 X124.422 Y131.578 E.23736
G1 X126.027 Y131.578 E.05325
; WIPE_START
G1 F24000
G1 X128.027 Y131.578 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.767 J-.945 P1  F30000
G1 X126.958 Y130.71 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2657
G1 X130.042 Y130.71 E.09475
G3 X130.046 Y123.71 I579.045 J-3.147 E.21509
G1 X138.29 Y123.71 E.25331
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X126.954 Y123.71 E.16113
G1 X126.972 Y124.908 E.03683
G2 X126.958 Y130.65 I520.152 J4.11 E.17642
M204 S10000
; WIPE_START
G1 F24000
G1 X128.958 Y130.689 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.135 J-.44 P1  F30000
G1 X126.764 Y125.03 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F2657
G1 X126.378 Y124.645 E.01676
G1 X125.845 Y124.645
G1 X126.761 Y125.561 E.03981
G1 X126.758 Y126.091
G1 X125.311 Y124.645 E.06285
G1 X124.778 Y124.645
G1 X126.755 Y126.621 E.0859
G1 X126.752 Y127.152
G1 X124.645 Y125.044 E.09157
G1 X124.645 Y125.578
G1 X126.751 Y127.684 E.09153
G1 X126.751 Y128.217
G1 X124.645 Y126.111 E.09153
G1 X124.645 Y126.644
G1 X126.751 Y128.75 E.09153
G1 X126.751 Y129.284
G1 X124.645 Y127.177 E.09153
G1 X124.645 Y127.711
G1 X126.751 Y129.817 E.09153
G1 X126.751 Y130.35
G1 X124.645 Y128.244 E.09153
G1 X124.645 Y128.777
G1 X126.751 Y130.884 E.09153
G1 X127.851 Y130.917
G1 X128.264 Y131.33 E.01792
G1 X127.756 Y131.355
G1 X127.318 Y130.917 E.01903
G1 X126.785 Y130.917
G1 X127.223 Y131.355 E.01903
G1 X126.689 Y131.355
G1 X124.645 Y129.311 E.08886
G1 X124.645 Y129.844
G1 X126.156 Y131.355 E.06568
G1 X125.623 Y131.355
G1 X124.645 Y130.377 E.04251
G1 X124.645 Y130.91
G1 X125.09 Y131.355 E.01934
M204 S10000
G1 X126.75 Y130.918 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0908013
G1 F2657
G1 X126.634 Y131.034 E.00064
; WIPE_START
G1 F24000
G1 X126.75 Y130.918 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.217 J-.023 P1  F30000
G1 X126.681 Y127.222 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.13334
G1 F2657
G1 X126.769 Y127.436 E.0017
; WIPE_START
G1 F24000
G1 X126.681 Y127.222 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.804 J-.913 P1  F30000
G1 X123.391 Y124.324 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2657
G1 X124.2 Y125.133 E.03513
G1 X124.2 Y125.666
G1 X122.858 Y124.324 E.0583
G1 X122.519 Y124.518
G1 X124.2 Y126.199 E.07305
G1 X124.2 Y126.733
G1 X122.519 Y125.052 E.07305
G1 X122.519 Y125.585
G1 X124.2 Y127.266 E.07305
G1 X124.2 Y127.799
G1 X122.519 Y126.118 E.07305
G1 X122.519 Y126.652
G1 X124.2 Y128.332 E.07305
G1 X124.2 Y128.866
G1 X122.519 Y127.185 E.07305
G1 X122.519 Y127.718
G1 X124.2 Y129.399 E.07305
G1 X124.2 Y129.932
G1 X122.519 Y128.251 E.07305
G1 X122.519 Y128.785
G1 X124.2 Y130.466 E.07305
G1 X124.2 Y130.999
G1 X122.519 Y129.318 E.07305
G1 X122.519 Y129.851
G1 X124.2 Y131.532 E.07305
G1 X123.81 Y131.676
G1 X122.519 Y130.384 E.0561
G1 X122.519 Y130.918
G1 X123.277 Y131.676 E.03293
M204 S10000
; WIPE_START
G1 F24000
G1 X122.519 Y130.918 E-.40726
G1 X122.519 Y130.384 E-.20264
G1 X122.798 Y130.664 E-.1501
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.596 J1.061 P1  F30000
G1 X132.355 Y125.289 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
G1 F2657
G1 X131.711 Y124.645 E.02802
G1 X131.177 Y124.645
G1 X132.355 Y125.823 E.05119
G1 X132.355 Y126.356
G1 X130.644 Y124.645 E.07436
G1 X130.238 Y124.772
G1 X132.355 Y126.889 E.09202
G1 X132.355 Y127.422
G1 X130.238 Y125.305 E.09202
G1 X130.241 Y125.841
G1 X132.355 Y127.956 E.09189
G1 X132.355 Y128.489
G1 X130.244 Y126.377 E.09176
G1 X130.247 Y126.914
G1 X132.355 Y129.022 E.09163
G1 X132.355 Y129.556
G1 X130.249 Y127.449 E.09153
G1 X130.249 Y127.983
G1 X132.355 Y130.089 E.09153
G1 X132.355 Y130.622
G1 X130.249 Y128.516 E.09153
G1 X130.249 Y129.049
G1 X132.355 Y131.155 E.09153
G1 X132.022 Y131.355
G1 X130.249 Y129.582 E.07705
G1 X130.249 Y130.116
G1 X131.489 Y131.355 E.05387
G1 X130.956 Y131.355
G1 X130.249 Y130.649 E.0307
G1 X129.984 Y130.917
G1 X130.422 Y131.355 E.01903
G1 X129.889 Y131.355
G1 X129.451 Y130.917 E.01903
G1 X128.918 Y130.917
G1 X129.356 Y131.355 E.01903
M204 S10000
G1 X128.757 Y130.899 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.121378
G1 F2657
G1 X128.757 Y131.374 E.00304
G1 X135.755 Y131.55 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P51 R8
G1 F2657
G1 X134.704 Y131.55 E.03487
G1 X134.704 Y130.972 E.01915
G1 X137.55 Y128.126 E.13352
G1 X137.55 Y127.874 E.00838
G1 X134.704 Y125.028 E.13352
G1 X134.704 Y124.45 E.01915
G1 X135.755 Y124.45 E.03487
G1 X134.481 Y124.749 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2657
G1 X134.057 Y124.324 E.01844
G1 X133.524 Y124.324
G1 X134.481 Y125.282 E.04161
G1 X134.481 Y125.815
G1 X132.99 Y124.324 E.06479
G1 X132.8 Y124.668
G1 X134.481 Y126.349 E.07305
G1 X134.481 Y126.882
G1 X132.8 Y125.201 E.07305
G1 X132.8 Y125.734
G1 X134.481 Y127.415 E.07305
G1 X134.481 Y127.948
G1 X132.8 Y126.267 E.07305
G1 X132.8 Y126.801
G1 X134.481 Y128.482 E.07305
G1 X134.481 Y129.015
G1 X132.8 Y127.334 E.07305
G1 X132.8 Y127.867
G1 X134.481 Y129.548 E.07305
G1 X134.481 Y130.081
G1 X132.8 Y128.401 E.07305
G1 X132.8 Y128.934
G1 X134.481 Y130.615 E.07305
G1 X134.481 Y131.148
G1 X132.8 Y129.467 E.07305
G1 X132.8 Y130
G1 X134.475 Y131.676 E.07279
G1 X133.942 Y131.676
G1 X132.8 Y130.534 E.04962
G1 X132.8 Y131.067
G1 X133.409 Y131.676 E.02645
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.8 Y131.067 E-.32709
G1 X132.8 Y130.534 E-.20264
G1 X133.229 Y130.962 E-.23027
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/85
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
G3 Z5.4 I-.02 J-1.217 P1  F30000
G1 X124.898 Y131.102 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1357
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X130.71 Y124.898 E.04616
G1 X130.705 Y124.102 E.0264
G1 X137.898 Y124.102 E.23862
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X126.295 Y124.102 E.1391
G1 X126.29 Y124.898 E.0264
G1 X124.898 Y124.898 E.04616
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1357
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X130.316 Y125.29 E.04282
G2 X130.309 Y123.71 I-61.243 J-.519 E.04855
G1 X138.29 Y123.71 E.24522
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X126.691 Y123.71 E.15304
G1 X126.681 Y124.915 E.03704
G1 X126.684 Y125.29 E.01151
G1 X125.29 Y125.29 E.04283
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1357
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1357
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
G1 X132.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1357
G1 X130.911 Y124.5 E.04418
; WIPE_START
G1 F24000
G1 X132.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I0 J-1.217 P1  F30000
G1 X126.089 Y124.5 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F1357
G1 X124.694 Y124.5 E.04418
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1357
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/85
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
G3 Z5.6 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1338
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X130.921 Y124.898 E.03917
G1 X130.926 Y124.102 E.0264
G1 X137.898 Y124.102 E.23128
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X126.075 Y124.102 E.13178
G1 X126.08 Y124.898 E.0264
M73 P52 R8
G1 X124.898 Y124.898 E.03922
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1338
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X130.527 Y125.29 E.03635
G2 X130.535 Y123.71 I-61.215 J-1.103 E.04855
G1 X138.29 Y123.71 E.23828
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X126.465 Y123.71 E.1461
G1 X126.464 Y123.747 E.00112
G1 X126.475 Y125.29 E.04743
G1 X125.29 Y125.29 E.03641
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1338
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1338
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
G1 X132.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1338
G1 X131.127 Y124.5 E.03734
; WIPE_START
G1 F24000
G1 X132.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I0 J-1.217 P1  F30000
G1 X125.874 Y124.5 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F1338
G1 X124.694 Y124.5 E.03737
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1338
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/85
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
G3 Z5.8 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1326
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.089 Y124.898 E.03361
G1 X131.085 Y124.102 E.0264
G1 X137.898 Y124.102 E.22599
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.914 Y124.102 E.12646
G1 X125.91 Y124.898 E.0264
G1 X124.898 Y124.898 E.03356
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1326
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X130.697 Y125.29 E.03114
G2 X130.691 Y123.71 I-100.537 J-.439 E.04855
G1 X138.29 Y123.71 E.23349
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X126.309 Y123.71 E.1413
G1 X126.301 Y125.089 E.04238
G1 X126.302 Y125.29 E.00617
G1 X125.29 Y125.29 E.03109
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1326
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1326
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
G1 X132.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1326
G1 X131.291 Y124.5 E.03216
; WIPE_START
G1 F24000
G1 X132.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I0 J-1.217 P1  F30000
G1 X125.708 Y124.5 Z6
G1 Z5.6
G1 E.8 F1800
M73 P53 R8
G1 F1326
G1 X124.694 Y124.5 E.03212
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1326
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/85
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
G3 Z6 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1315
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.221 Y124.898 E.02923
G1 X131.223 Y124.102 E.0264
G1 X137.898 Y124.102 E.22141
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.776 Y124.102 E.12186
G1 X125.78 Y124.898 E.0264
G1 X124.898 Y124.898 E.02926
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1315
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X130.828 Y125.29 E.02711
G2 X130.829 Y123.71 I-100.537 J-.894 E.04855
G1 X138.29 Y123.71 E.22925
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X126.171 Y123.71 E.13706
G1 X126.168 Y124.149 E.0135
G1 X126.174 Y125.29 E.03505
G1 X125.29 Y125.29 E.02716
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1315
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1315
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
G1 X132.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1315
G1 X131.426 Y124.5 E.02788
; WIPE_START
G1 F24000
G1 X132.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I0 J-1.217 P1  F30000
G1 X125.574 Y124.5 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F1315
G1 X124.694 Y124.5 E.02787
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1315
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
M73 P54 R8
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/85
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
G3 Z6.2 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1303
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.343 Y124.898 E.02518
G1 X131.341 Y124.102 E.0264
G1 X137.898 Y124.102 E.21751
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.658 Y124.102 E.11795
G1 X125.654 Y124.898 E.0264
G1 X124.898 Y124.898 E.02508
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1303
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X130.952 Y125.29 E.02329
G1 X130.948 Y123.71 E.04855
G1 X138.29 Y123.71 E.22561
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X126.052 Y123.71 E.13341
G1 X126.045 Y125.094 E.04253
G1 X126.046 Y125.29 E.00602
G1 X125.29 Y125.29 E.02324
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1303
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1303
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
G1 X131.74 Y124.5 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.431684
G1 F1303
G1 X132.306 Y124.5 E.01795
; WIPE_START
G1 F24000
G1 X131.74 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.001 J-1.217 P1  F30000
G1 X124.634 Y124.505 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.441122
G1 F1303
G1 X125.198 Y124.5 E.01831
G1 X124.067 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1303
G1 X124.227 Y124.45 E.00532
G1 X124.227 Y124.771 E.01063
G1 X124.55 Y125.076 E.01472
G1 X124.55 Y125.774 E.02318
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
M73 P55 R8
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/85
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
G3 Z6.4 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1297
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.417 Y124.898 E.02274
G1 X131.416 Y124.102 E.0264
G1 X137.898 Y124.102 E.21503
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.582 Y124.102 E.11544
G1 X125.579 Y124.741 E.02121
G1 X125.58 Y124.898 E.00519
G1 X124.898 Y124.898 E.02262
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X131.025 Y125.29 E.02105
G1 X131.023 Y123.71 E.04855
G1 X138.29 Y123.71 E.22329
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X125.976 Y123.71 E.13108
G1 X125.971 Y124.742 E.0317
G1 X125.974 Y125.29 E.01685
G1 X125.29 Y125.29 E.021
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1297
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1297
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
G1 X131.814 Y124.5 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.431684
G1 F1297
G1 X132.306 Y124.504 E.01559
; WIPE_START
G1 F24000
G1 X131.814 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.001 J-1.217 P1  F30000
G1 X124.634 Y124.505 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.441122
G1 F1297
G1 X125.122 Y124.501 E.01585
G1 X124.067 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1297
G1 X124.227 Y124.45 E.00532
G1 X124.227 Y124.771 E.01063
G1 X124.55 Y125.076 E.01472
G1 X124.55 Y125.774 E.02318
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P55 R7
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/85
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
G3 Z6.6 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1284
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.49 Y124.898 E.0203
G1 X131.491 Y124.102 E.0264
G1 X137.898 Y124.102 E.21255
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.508 Y124.102 E.11298
G1 X125.511 Y124.898 E.0264
G1 X124.898 Y124.898 E.02035
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1284
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X131.098 Y125.29 E.01881
G1 X131.099 Y123.71 E.04855
G1 X138.29 Y123.71 E.22097
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X125.9 Y123.71 E.12875
G1 X125.899 Y123.918 E.00641
G1 X125.905 Y125.29 E.04214
G1 X125.29 Y125.29 E.01891
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1284
G1 X132.306 Y131.5 E.24112
M73 P56 R7
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1284
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y124.55 E.03317
G1 X131.838 Y124.533 E.0203
; WIPE_START
G1 F24000
G1 X132.45 Y124.55 E-.23258
G1 X132.45 Y125.55 E-.38
G1 X132.725 Y125.275 E-.14742
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.113 J-1.212 P1  F30000
G1 X124.953 Y124.55 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F1284
G1 X124.55 Y124.55 E.01339
G1 X124.55 Y125.774 E.04063
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/85
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
G3 Z6.8 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1281
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.543 Y124.898 E.01854
G1 X131.542 Y124.102 E.0264
G1 X137.898 Y124.102 E.21083
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.456 Y124.102 E.11126
G1 X125.453 Y124.898 E.0264
G1 X124.898 Y124.898 E.0184
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1281
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X131.152 Y125.29 E.01716
G1 X131.15 Y123.71 E.04855
G1 X138.29 Y123.71 E.21941
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X125.85 Y123.71 E.1272
G1 X125.843 Y125.29 E.04855
G1 X125.29 Y125.29 E.01699
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1281
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1281
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y124.55 E.03317
G1 X131.891 Y124.55 E.01856
G1 X131.891 Y124.481 E.00229
; WIPE_START
G1 F24000
G1 X131.891 Y124.55 E-.02619
G1 X132.45 Y124.55 E-.21257
G1 X132.45 Y125.55 E-.38
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.115 J-1.212 P1  F30000
G1 X124.953 Y124.55 Z7
G1 Z6.6
G1 E.8 F1800
G1 F1281
M73 P57 R7
G1 X124.55 Y124.55 E.01339
G1 X124.55 Y125.774 E.04063
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/85
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
G3 Z7 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1280
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.567 Y124.898 E.01776
G1 X131.566 Y124.102 E.0264
G1 X137.898 Y124.102 E.21004
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.432 Y124.102 E.11045
G1 X125.429 Y124.655 E.01835
G1 X125.43 Y124.898 E.00805
G1 X124.898 Y124.898 E.01766
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1280
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X131.175 Y125.29 E.01644
G1 X131.174 Y123.71 E.04855
G1 X138.29 Y123.71 E.21866
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X125.826 Y123.71 E.12646
G1 X125.822 Y124.655 E.02905
G1 X125.824 Y125.29 E.0195
G1 X125.29 Y125.29 E.01641
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1280
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1280
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.115 J-1.212 P1  F30000
G1 X124.953 Y124.55 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F1280
G1 X124.55 Y124.55 E.01339
G1 X124.55 Y125.774 E.04063
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/85
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
G3 Z7.2 I-1.072 J.575 P1  F30000
M73 P58 R7
G1 X124.898 Y131.102 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1278
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.59 Y124.898 E.01698
G1 X131.59 Y124.102 E.0264
G1 X137.898 Y124.102 E.20924
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.409 Y124.102 E.10971
G1 X125.412 Y124.898 E.0264
G1 X124.898 Y124.898 E.01707
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1278
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X131.198 Y125.29 E.01572
G1 X131.198 Y123.71 E.04855
G1 X138.29 Y123.71 E.21792
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X125.801 Y123.71 E.12571
G1 X125.801 Y123.885 E.00538
G1 X125.806 Y125.29 E.04317
G1 X125.29 Y125.29 E.01586
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1278
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1278
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.115 J-1.212 P1  F30000
G1 X124.953 Y124.55 Z7.4
G1 Z7
G1 E.8 F1800
G1 F1278
G1 X124.55 Y124.55 E.01339
G1 X124.55 Y125.774 E.04063
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/85
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
G3 Z7.4 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1278
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.59 Y124.898 E.01699
G1 X131.59 Y124.102 E.0264
G1 X137.898 Y124.102 E.20925
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.408 Y124.102 E.10965
G1 X125.404 Y124.898 E.0264
G1 X124.898 Y124.898 E.0168
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1278
G1 X131.71 Y130.71 E.19727
M73 P59 R7
G1 X131.71 Y125.29 E.16654
G1 X131.198 Y125.29 E.01573
G1 X131.198 Y123.71 E.04855
G1 X138.29 Y123.71 E.21792
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X125.801 Y123.71 E.12571
G1 X125.795 Y125.29 E.04855
G1 X125.29 Y125.29 E.01552
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1278
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1278
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.115 J-1.212 P1  F30000
G1 X124.953 Y124.55 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F1278
G1 X124.55 Y124.55 E.01339
G1 X124.55 Y125.774 E.04063
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/85
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
G3 Z7.6 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1280
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.566 Y124.898 E.01779
G1 X131.566 Y124.102 E.0264
G1 X137.898 Y124.102 E.21005
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.432 Y124.102 E.11046
G1 X125.43 Y124.64 E.01786
G1 X125.431 Y124.898 E.00854
G1 X124.898 Y124.898 E.01767
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1280
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X131.174 Y125.29 E.01647
G1 X131.174 Y123.71 E.04855
G1 X138.29 Y123.71 E.21867
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X125.826 Y123.71 E.12646
G1 X125.822 Y124.64 E.02859
G1 X125.824 Y125.29 E.01996
G1 X125.29 Y125.29 E.01642
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1280
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1280
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.115 J-1.212 P1  F30000
G1 X124.953 Y124.55 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F1280
M73 P60 R7
G1 X124.55 Y124.55 E.01339
G1 X124.55 Y125.774 E.04063
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/85
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
G3 Z7.8 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1281
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.542 Y124.898 E.01859
G1 X131.542 Y124.102 E.0264
G1 X137.898 Y124.102 E.21085
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.458 Y124.102 E.11132
G1 X125.461 Y124.898 E.0264
G1 X124.898 Y124.898 E.01868
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1281
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X131.15 Y125.29 E.01721
G1 X131.149 Y123.71 E.04855
G1 X138.29 Y123.71 E.21941
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X125.85 Y123.71 E.12721
G1 X125.849 Y123.876 E.00509
G1 X125.854 Y125.29 E.04346
G1 X125.29 Y125.29 E.01734
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1281
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1281
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y124.55 E.03317
G1 X131.89 Y124.55 E.01859
G1 X131.89 Y124.482 E.00225
; WIPE_START
G1 F24000
G1 X131.89 Y124.55 E-.02581
G1 X132.45 Y124.55 E-.21295
G1 X132.45 Y125.55 E-.38
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.115 J-1.212 P1  F30000
G1 X124.953 Y124.55 Z8
G1 Z7.6
G1 E.8 F1800
G1 F1281
G1 X124.55 Y124.55 E.01339
G1 X124.55 Y125.774 E.04063
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
M73 P61 R7
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
M73 P61 R6
G1 E-.04 F1800
; layer num/total_layer_count: 39/85
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
G3 Z8 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1286
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.491 Y124.898 E.02028
G1 X131.491 Y124.102 E.0264
G1 X137.898 Y124.102 E.21254
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.507 Y124.102 E.11294
G1 X125.504 Y124.898 E.0264
G1 X124.898 Y124.898 E.02009
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1286
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X131.109 Y125.29 E.01847
G1 X131.108 Y123.71 E.04855
G1 X138.29 Y123.71 E.22067
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X125.891 Y123.71 E.12847
G1 X125.895 Y125.117 E.04324
G1 X125.894 Y125.29 E.00531
G1 X125.29 Y125.29 E.01856
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1286
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1286
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y124.55 E.03317
G1 X131.839 Y124.533 E.02029
; WIPE_START
G1 F24000
G1 X132.45 Y124.55 E-.23242
G1 X132.45 Y125.55 E-.38
G1 X132.725 Y125.275 E-.14758
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.113 J-1.212 P1  F30000
G1 X124.953 Y124.55 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F1286
G1 X124.55 Y124.55 E.01339
G1 X124.55 Y125.774 E.04063
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/85
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
G3 Z8.2 I-1.072 J.575 P1  F30000
M73 P62 R6
G1 X124.898 Y131.102 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1299
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.415 Y124.898 E.02278
G1 X131.415 Y124.102 E.0264
G1 X137.898 Y124.102 E.21505
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.583 Y124.102 E.11546
G1 X125.581 Y124.555 E.01502
G1 X125.582 Y124.898 E.01138
G1 X124.898 Y124.898 E.02269
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1299
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X131.057 Y125.29 E.02005
G1 X131.023 Y125.29 E.00105
G1 X131.023 Y123.71 E.04855
G1 X131.058 Y123.71 E.00107
G1 X138.29 Y123.71 E.22223
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X125.941 Y123.71 E.13002
G1 X125.976 Y123.71 E.00107
G2 X125.976 Y125.29 I103.498 J.833 E.04855
G1 X125.935 Y125.29 E.00124
G1 X125.29 Y125.29 E.01982
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1299
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1299
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
G1 X131.813 Y124.5 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.431684
G1 F1299
G1 X132.306 Y124.504 E.01562
; WIPE_START
G1 F24000
G1 X131.813 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.001 J-1.217 P1  F30000
G1 X124.634 Y124.505 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.441124
G1 F1299
G1 X125.124 Y124.501 E.0159
G1 X124.067 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1299
G1 X124.227 Y124.45 E.00533
G1 X124.227 Y124.771 E.01064
G1 X124.55 Y125.076 E.01472
G1 X124.55 Y125.774 E.02317
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/85
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
G3 Z8.4 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1305
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.34 Y124.898 E.02528
G1 X131.34 Y124.102 E.0264
G1 X137.898 Y124.102 E.21755
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.661 Y124.102 E.11806
G1 X125.664 Y124.898 E.0264
G1 X124.898 Y124.898 E.02541
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1305
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X130.982 Y125.29 E.02236
G1 X130.948 Y125.29 E.00105
G1 X130.947 Y123.71 E.04855
G1 X130.982 Y123.71 E.00107
G1 X138.29 Y123.71 E.22456
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X126.017 Y123.71 E.13235
G1 X126.052 Y123.71 E.00107
G2 X126.058 Y125.29 I103.714 J.429 E.04855
G1 X126.017 Y125.29 E.00126
G1 X125.29 Y125.29 E.02233
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.371 J-1.159 P1  F30000
M73 P63 R6
G1 X124.694 Y131.5 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1305
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1305
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
G1 X131.738 Y124.5 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.431684
G1 F1305
G1 X132.306 Y124.5 E.01802
; WIPE_START
G1 F24000
G1 X131.738 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.001 J-1.217 P1  F30000
G1 X124.634 Y124.505 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.441122
G1 F1305
G1 X125.205 Y124.5 E.01852
G1 X124.067 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1305
G1 X124.227 Y124.45 E.00532
G1 X124.227 Y124.771 E.01063
G1 X124.55 Y125.076 E.01472
G1 X124.55 Y125.774 E.02318
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/85
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
G3 Z8.6 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1317
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.22 Y124.898 E.02926
G1 X131.22 Y124.102 E.0264
G1 X137.898 Y124.102 E.22151
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.777 Y124.102 E.12191
G1 X125.774 Y124.898 E.0264
G1 X124.898 Y124.898 E.02906
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1317
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X130.907 Y125.29 E.02467
G1 X130.828 Y125.29 E.00244
G1 X130.828 Y123.71 E.04855
G1 X130.906 Y123.71 E.0024
G1 X138.29 Y123.71 E.22688
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X126.093 Y123.71 E.13468
G1 X126.171 Y123.71 E.00239
G2 X126.166 Y125.29 I98.44 J1.119 E.04855
G1 X126.099 Y125.29 E.00206
G1 X125.29 Y125.29 E.02485
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1317
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1317
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
G1 X132.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1317
G1 X131.424 Y124.5 E.02794
; WIPE_START
G1 F24000
G1 X132.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I0 J-1.217 P1  F30000
G1 X125.572 Y124.5 Z8.8
G1 Z8.4
M73 P64 R6
G1 E.8 F1800
G1 F1317
G1 X124.694 Y124.5 E.0278
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1317
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/85
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
G3 Z8.8 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1327
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X131.083 Y124.898 E.0338
G1 X131.083 Y124.102 E.0264
G1 X137.898 Y124.102 E.22608
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X125.914 Y124.102 E.12646
G1 X125.917 Y124.898 E.0264
G1 X124.898 Y124.898 E.03382
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1327
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X130.705 Y125.29 E.03089
G1 X130.691 Y125.29 E.00042
G1 X130.69 Y123.71 E.04855
G1 X130.705 Y123.71 E.00046
G1 X130.787 Y123.71 E.00252
G1 X138.29 Y123.71 E.23054
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X126.294 Y123.71 E.14085
G1 X126.309 Y123.71 E.00046
G2 X126.311 Y125.29 I98.429 J.664 E.04855
G1 X126.289 Y125.29 E.00069
G1 X125.29 Y125.29 E.03068
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1327
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1327
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
G1 X132.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1327
G1 X131.286 Y124.5 E.03229
; WIPE_START
G1 F24000
G1 X132.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I0 J-1.217 P1  F30000
G1 X125.712 Y124.5 Z9
G1 Z8.6
G1 E.8 F1800
G1 F1327
G1 X124.694 Y124.5 E.03225
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1327
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
M73 P65 R6
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/85
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
G3 Z9 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1339
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X130.924 Y124.898 E.03907
G1 X130.925 Y124.102 E.0264
G1 X137.898 Y124.102 E.2313
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X126.071 Y124.102 E.13167
G1 X126.068 Y124.898 E.0264
G1 X124.898 Y124.898 E.0388
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1339
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X130.568 Y125.29 E.03508
G1 X130.532 Y125.29 E.00113
G1 X130.533 Y123.71 E.04855
G1 X130.567 Y123.71 E.00104
G1 X130.649 Y123.71 E.00252
G1 X138.29 Y123.71 E.23478
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X126.432 Y123.71 E.14509
G1 X126.465 Y123.71 E.00103
G1 X126.458 Y125.29 E.04855
G1 X126.434 Y125.29 E.00073
G1 X125.29 Y125.29 E.03515
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1339
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1339
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
G1 X132.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1339
G1 X131.128 Y124.5 E.0373
; WIPE_START
G1 F24000
G1 X132.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I0 J-1.217 P1  F30000
G1 X125.866 Y124.5 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F1339
G1 X124.694 Y124.5 E.03711
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1339
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/85
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
G3 Z9.2 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1350
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X130.701 Y124.898 E.04648
G1 X130.7 Y124.102 E.0264
G1 X137.898 Y124.102 E.23876
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
M73 P66 R6
G1 X122.102 Y124.102 E.2586
G1 X126.297 Y124.102 E.13916
G1 X126.296 Y124.382 E.0093
G1 X126.298 Y124.898 E.0171
G1 X124.898 Y124.898 E.04645
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1350
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X130.327 Y125.29 E.04251
M106 S255
G1 F1800
G1 X130.309 Y125.29 E.00054
G1 X130.308 Y123.71 E.04855
G1 X130.328 Y123.71 E.00063
M106 S252.45
G1 F1350
G1 X130.492 Y123.71 E.00504
G1 X138.29 Y123.71 E.2396
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X126.67 Y123.71 E.15242
M106 S255
G1 F1800
G1 X126.691 Y123.71 E.00064
G2 X126.692 Y125.29 I86.304 J.747 E.04855
G1 X126.663 Y125.29 E.00089
M106 S252.45
G1 F1350
G1 X125.29 Y125.29 E.04218
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1350
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1350
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
G1 X132.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1350
G1 X130.904 Y124.5 E.0444
; WIPE_START
G1 F24000
G1 X132.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I0 J-1.217 P1  F30000
G1 X126.093 Y124.5 Z9.4
G1 Z9
G1 E.8 F1800
G1 F1350
G1 X124.694 Y124.5 E.0443
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1350
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/85
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
G3 Z9.4 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1370
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X130.439 Y124.898 E.05518
G1 X130.44 Y124.102 E.0264
M73 P66 R5
G1 X137.898 Y124.102 E.24739
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X126.555 Y124.102 E.14771
G1 X126.55 Y124.898 E.0264
G1 X124.898 Y124.898 E.05481
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1370
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X130.104 Y125.29 E.04934
M106 S255
G1 F1800
G1 X130.046 Y125.29 E.00179
G1 X130.049 Y123.71 E.04855
G1 X130.103 Y123.71 E.00167
M106 S252.45
G1 F1370
G1 X130.267 Y123.71 E.00504
G1 X138.29 Y123.71 E.24652
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X126.896 Y123.71 E.15935
M106 S255
G1 F1800
G1 X126.95 Y123.71 E.00164
G1 X126.94 Y125.29 E.04855
G1 X126.897 Y125.29 E.00132
M106 S252.45
G1 F1370
G1 X125.29 Y125.29 E.04938
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1370
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1370
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
M73 P67 R5
G1 X132.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1370
G1 X130.643 Y124.5 E.05267
; WIPE_START
G1 F24000
G1 X132.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I0 J-1.217 P1  F30000
G1 X126.349 Y124.5 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F1370
G1 X124.694 Y124.5 E.05242
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1370
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/85
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
G3 Z9.6 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1445
G1 X132.102 Y131.102 E.23898
G1 X132.102 Y124.898 E.2058
G1 X130.064 Y124.898 E.0676
G1 X130.062 Y124.102 E.0264
G1 X137.898 Y124.102 E.25994
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X126.94 Y124.102 E.16047
G1 X126.944 Y124.898 E.0264
G1 X124.898 Y124.898 E.06788
G1 X124.898 Y131.042 E.20381
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1445
G1 X131.71 Y130.71 E.19727
G1 X131.71 Y125.29 E.16654
G1 X130.005 Y125.29 E.05239
G1 X129.759 Y125.29 E.00756
M106 S255
G1 F600
G1 X129.673 Y125.29 E.00263
G1 X129.669 Y123.71 E.04855
G1 X129.762 Y123.71 E.00286
M106 S252.45
G1 F1445
G1 X130.008 Y123.71 E.00756
G1 X138.29 Y123.71 E.25449
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X126.991 Y123.71 E.16226
G1 X127.237 Y123.71 E.00756
M106 S255
G1 F600
G1 X127.331 Y123.71 E.00289
G2 X127.339 Y125.29 I66.534 J.455 E.04855
G1 X127.227 Y125.29 E.00343
M106 S252.45
G1 F1445
G1 X126.981 Y125.29 E.00756
G1 X125.29 Y125.29 E.05195
G1 X125.29 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X127.29 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.371 J-1.159 P1  F30000
G1 X124.694 Y131.5 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1445
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1445
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
G1 X132.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1445
G1 X130.267 Y124.5 E.06459
; WIPE_START
G1 F24000
G1 X132.267 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I0 J-1.217 P1  F30000
G1 X126.738 Y124.5 Z9.8
G1 Z9.4
M73 P68 R5
G1 E.8 F1800
G1 F1445
G1 X124.694 Y124.5 E.06476
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1445
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.346 Y131.55 E-.03828
G1 X124.346 Y130.936 E-.23323
G1 X124.55 Y130.936 E-.07734
G1 X124.55 Y130.226 E-.2699
G1 X124.287 Y129.963 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/85
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
G3 Z9.8 I-1.072 J.575 P1  F30000
G1 X124.898 Y131.102 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1465
G1 X124.898 Y124.898 E.2058
G1 X127.746 Y124.898 E.09449
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X129.262 Y124.898 E.05028
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1465
G1 X129.645 Y124.898 E.01269
G1 X132.102 Y124.898 E.08152
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1465
G1 X125.29 Y125.29 E.16654
G1 X127.749 Y125.29 E.07555
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X129.263 Y125.29 E.05024
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1465
G1 X129.632 Y125.29 E.01134
G1 X131.71 Y125.29 E.06384
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1465
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X127.742 Y124.102 E.18708
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X129.26 Y124.102 E.05035
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1465
G1 X129.642 Y124.102 E.01269
G1 X137.838 Y124.102 E.27186
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1465
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X127.741 Y123.71 E.18531
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X129.259 Y123.71 E.05035
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1465
G1 X129.628 Y123.71 E.01134
G1 X138.23 Y123.71 E.26433
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1465
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1465
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1465
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1465
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/85
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
G3 Z10 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
M73 P69 R5
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/85
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
G3 Z10.2 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P70 R5
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/85
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
G3 Z10.4 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
M73 P71 R5
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/85
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
G3 Z10.6 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/85
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
G3 Z10.8 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
M73 P72 R5
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.243 J-1.192 P1  F30000
M73 P72 R4
G1 X132.306 Y124.5 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/85
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
G3 Z11 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
M73 P73 R4
G1 E-.04 F1800
G17
G3 Z11.2 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/85
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
G3 Z11.2 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P74 R4
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/85
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
G3 Z11.4 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/85
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
G3 Z11.6 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
M73 P75 R4
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/85
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
G3 Z11.8 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P76 R4
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/85
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
G3 Z12 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.243 J-1.192 P1  F30000
M73 P77 R4
G1 X132.306 Y124.5 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/85
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
G3 Z12.2 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
M73 P77 R3
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
M73 P78 R3
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/85
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
G3 Z12.4 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/85
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
G3 Z12.6 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
M73 P79 R3
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/85
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
G3 Z12.8 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
M73 P80 R3
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/85
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
G3 Z13 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
M73 P81 R3
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/85
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
G3 Z13.2 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/85
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
G3 Z13.4 I-.726 J-.976 P1  F30000
M73 P82 R3
G1 X124.898 Y131.102 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/85
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
G3 Z13.6 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P83 R3
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
M73 P83 R2
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/85
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
G3 Z13.8 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
M73 P84 R2
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/85
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
G3 Z14 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
M73 P85 R2
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/85
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
G3 Z14.2 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/85
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
G3 Z14.4 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
M73 P86 R2
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/85
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
G3 Z14.6 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
M73 P87 R2
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/85
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
G3 Z14.8 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
M73 P88 R2
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/85
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
G3 Z15 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
M73 P88 R1
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
M73 P89 R1
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/85
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
G3 Z15.2 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/85
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
G3 Z15.4 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
M73 P90 R1
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/85
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
G3 Z15.6 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z15.8
G1 Z15.4
M73 P91 R1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/85
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
G3 Z15.8 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1490
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1490
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1490
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.243 J-1.192 P1  F30000
G1 X132.306 Y124.5 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X124.694 Y124.5 E.24112
G1 X124.245 Y124.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
G1 X124.346 Y124.45 E.00334
G1 X124.346 Y125.064 E.02036
G1 X124.55 Y125.064 E.00675
G1 X124.55 Y125.774 E.02356
G1 X122.45 Y127.874 E.09848
G1 X122.45 Y128.126 E.00838
G1 X124.55 Y130.226 E.09848
G1 X124.55 Y130.936 E.02356
G1 X124.346 Y130.936 E.00675
G1 X124.346 Y131.55 E.02036
G1 X124.245 Y131.55 E.00334
G1 X124.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1490
G1 X132.306 Y131.5 E.24112
G1 X132.45 Y128.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1490
M73 P92 R1
G1 X132.45 Y130.45 E.05401
G1 X133.55 Y131.55 E.05157
G1 X134.126 Y131.55 E.01913
G1 X137.55 Y128.126 E.1606
G1 X137.55 Y127.874 E.00838
G1 X134.126 Y124.45 E.1606
G1 X133.55 Y124.45 E.01913
G1 X132.45 Y125.55 E.05157
G1 X132.45 Y127.178 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.45 Y125.55 E-.61876
G1 X132.713 Y125.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/85
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
G3 Z16 I-.726 J-.976 P1  F30000
G1 X124.898 Y131.102 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1750
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1750
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1750
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1750
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.162 J-1.206 P1  F30000
G1 X133.061 Y125.013 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1750
G1 X133.061 Y124.857 E.00517
G1 X134.533 Y124.857 E.04884
G1 X137.143 Y127.467 E.1224
G1 X137.143 Y128.533 E.03539
G1 X134.533 Y131.143 E.1224
G1 X133.061 Y131.143 E.04884
G1 X133.061 Y130.987 E.00517
G1 X132.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1750
G1 X124.694 Y131.5 E.24112
G1 X124.55 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1750
G1 X122.45 Y130.936 E.06964
G1 X122.45 Y125.064 E.19478
G1 X124.55 Y125.064 E.06964
G1 X124.55 Y130.876 E.19279
G1 X123.225 Y130.529 F30000
G1 F1750
G1 X124.143 Y130.529 E.03045
G1 X124.143 Y129.819 E.02356
G1 X122.857 Y128.533 E.06029
G1 X122.857 Y127.467 E.03539
G1 X124.143 Y126.181 E.06029
G1 X124.143 Y125.471 E.02356
G1 X123.225 Y125.471 E.03045
G1 X124.694 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1750
G1 X132.306 Y124.5 E.24112
G1 X137.55 Y131.49 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1750
G1 X137.55 Y124.45 E.23351
G1 X132.654 Y124.45 E.1624
G1 X132.654 Y125.064 E.02036
G1 X132.45 Y125.064 E.00675
G1 X132.45 Y130.936 E.19478
G1 X132.654 Y130.936 E.00675
G1 X132.654 Y131.55 E.02036
M73 P93 R1
G1 X137.55 Y131.55 E.1624
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.55 Y131.55 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/85
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
G3 Z16.2 I.051 J-1.216 P1  F30000
G1 X124.898 Y131.102 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1751
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1751
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1751
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1751
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.162 J-1.206 P1  F30000
G1 X133.061 Y125.013 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1751
G1 X133.061 Y124.857 E.00517
G1 X134.533 Y124.857 E.04884
G1 X137.143 Y127.467 E.1224
G1 X137.143 Y128.533 E.03539
G1 X134.533 Y131.143 E.1224
G1 X133.061 Y131.143 E.04884
G1 X133.061 Y130.987 E.00517
G1 X132.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1751
G1 X124.694 Y131.5 E.24112
G1 X124.55 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1751
G1 X122.45 Y130.936 E.06964
G1 X122.45 Y125.064 E.19478
G1 X124.55 Y125.064 E.06964
G1 X124.55 Y130.876 E.19279
G1 X123.225 Y130.529 F30000
G1 F1751
G1 X124.143 Y130.529 E.03045
G1 X124.143 Y129.819 E.02356
G1 X122.857 Y128.533 E.06029
G1 X122.857 Y127.467 E.03539
G1 X124.143 Y126.181 E.06029
G1 X124.143 Y125.471 E.02356
G1 X123.225 Y125.471 E.03045
G1 X124.694 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1751
G1 X132.306 Y124.5 E.24112
G1 X137.55 Y131.49 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1751
G1 X137.55 Y124.45 E.23351
G1 X132.654 Y124.45 E.1624
G1 X132.654 Y125.064 E.02036
G1 X132.45 Y125.064 E.00675
G1 X132.45 Y130.936 E.19478
G1 X132.654 Y130.936 E.00675
G1 X132.654 Y131.55 E.02036
G1 X137.55 Y131.55 E.1624
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X135.55 Y131.55 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/85
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
G3 Z16.4 I.051 J-1.216 P1  F30000
G1 X124.898 Y131.102 Z16.4
G1 Z16.2
M73 P94 R1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1751
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1751
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1751
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1751
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.162 J-1.206 P1  F30000
G1 X133.061 Y125.013 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1751
G1 X133.061 Y124.857 E.00517
G1 X134.533 Y124.857 E.04884
G1 X137.143 Y127.467 E.1224
G1 X137.143 Y128.533 E.03539
G1 X134.533 Y131.143 E.1224
G1 X133.061 Y131.143 E.04884
G1 X133.061 Y130.987 E.00517
G1 X132.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1751
G1 X124.694 Y131.5 E.24112
G1 X124.55 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1751
G1 X122.45 Y130.936 E.06964
G1 X122.45 Y125.064 E.19478
G1 X124.55 Y125.064 E.06964
G1 X124.55 Y130.876 E.19279
G1 X123.225 Y130.529 F30000
G1 F1751
G1 X124.143 Y130.529 E.03045
G1 X124.143 Y129.819 E.02356
G1 X122.857 Y128.533 E.06029
G1 X122.857 Y127.467 E.03539
G1 X124.143 Y126.181 E.06029
G1 X124.143 Y125.471 E.02356
G1 X123.225 Y125.471 E.03045
G1 X124.694 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1751
G1 X132.306 Y124.5 E.24112
G1 X137.55 Y131.49 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1751
G1 X137.55 Y124.45 E.23351
G1 X132.654 Y124.45 E.1624
G1 X132.654 Y125.064 E.02036
G1 X132.45 Y125.064 E.00675
G1 X132.45 Y130.936 E.19478
M73 P94 R0
G1 X132.654 Y130.936 E.00675
G1 X132.654 Y131.55 E.02036
G1 X137.55 Y131.55 E.1624
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X135.55 Y131.55 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/85
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
G3 Z16.6 I.051 J-1.216 P1  F30000
G1 X124.898 Y131.102 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1751
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1751
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1751
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1751
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.162 J-1.206 P1  F30000
G1 X133.061 Y125.013 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1751
G1 X133.061 Y124.857 E.00517
M73 P95 R0
G1 X134.533 Y124.857 E.04884
G1 X137.143 Y127.467 E.1224
G1 X137.143 Y128.533 E.03539
G1 X134.533 Y131.143 E.1224
G1 X133.061 Y131.143 E.04884
G1 X133.061 Y130.987 E.00517
G1 X132.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1751
G1 X124.694 Y131.5 E.24112
G1 X124.55 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1751
G1 X122.45 Y130.936 E.06964
G1 X122.45 Y125.064 E.19478
G1 X124.55 Y125.064 E.06964
G1 X124.55 Y130.876 E.19279
G1 X123.225 Y130.529 F30000
G1 F1751
G1 X124.143 Y130.529 E.03045
G1 X124.143 Y129.819 E.02356
G1 X122.857 Y128.533 E.06029
G1 X122.857 Y127.467 E.03539
G1 X124.143 Y126.181 E.06029
G1 X124.143 Y125.471 E.02356
G1 X123.225 Y125.471 E.03045
G1 X124.694 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1751
G1 X132.306 Y124.5 E.24112
G1 X137.55 Y131.49 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1751
G1 X137.55 Y124.45 E.23351
G1 X132.654 Y124.45 E.1624
G1 X132.654 Y125.064 E.02036
G1 X132.45 Y125.064 E.00675
G1 X132.45 Y130.936 E.19478
G1 X132.654 Y130.936 E.00675
G1 X132.654 Y131.55 E.02036
G1 X137.55 Y131.55 E.1624
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X135.55 Y131.55 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/85
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
G3 Z16.8 I.051 J-1.216 P1  F30000
G1 X124.898 Y131.102 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1874
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1874
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1874
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1874
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
G1 X137.731 Y124.481 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.41915
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X132.675 Y124.481 E.28421
G1 X132.675 Y124.951 E.02638
G1 X137.528 Y124.951 E.27283
G1 X137.528 Y125.42 E.02638
G1 X132.472 Y125.42 E.28427
G1 X132.472 Y125.889 E.02638
G1 X137.528 Y125.889 E.28427
G1 X137.528 Y126.358 E.02638
G1 X132.472 Y126.358 E.28427
G1 X132.472 Y126.827 E.02638
G1 X137.528 Y126.827 E.28427
G1 X137.528 Y127.296 E.02638
G1 X132.472 Y127.296 E.28427
G1 X132.472 Y127.765 E.02638
G1 X137.528 Y127.765 E.28427
G1 X137.528 Y128.235 E.02638
G1 X132.472 Y128.235 E.28427
G1 X132.472 Y128.704 E.02638
G1 X137.528 Y128.704 E.28427
G1 X137.528 Y129.173 E.02638
G1 X132.472 Y129.173 E.28427
G1 X132.472 Y129.642 E.02638
G1 X137.528 Y129.642 E.28427
G1 X137.528 Y130.111 E.02638
G1 X132.472 Y130.111 E.28427
G1 X132.472 Y130.58 E.02638
G1 X137.528 Y130.58 E.28427
G1 X137.528 Y131.05 E.02638
G1 X132.675 Y131.05 E.27283
G1 X132.675 Y131.519 E.02638
M73 P96 R0
G1 X137.731 Y131.519 E.28421
M106 S252.45
G1 X132.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
; LAYER_HEIGHT: 0.2
G1 F1874
G1 X124.694 Y131.5 E.24112
G1 X124.213 Y131.417 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.597882
G1 F1874
G1 X122.643 Y131.417 E.07101
G1 X122.269 Y130.898 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.432989
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X124.528 Y130.898 E.13552
G1 X124.528 Y130.415 E.02898
G1 X122.472 Y130.415 E.12337
G1 X122.472 Y129.932 E.02898
G1 X124.528 Y129.932 E.12337
G1 X124.528 Y129.449 E.02898
G1 X122.472 Y129.449 E.12337
G1 X122.472 Y128.966 E.02898
G1 X124.528 Y128.966 E.12337
G1 X124.528 Y128.483 E.02898
G1 X122.472 Y128.483 E.12337
G1 X122.472 Y128 E.02898
G1 X124.528 Y128 E.12337
G1 X124.528 Y127.517 E.02898
G1 X122.472 Y127.517 E.12337
G1 X122.472 Y127.034 E.02898
G1 X124.528 Y127.034 E.12337
G1 X124.528 Y126.551 E.02898
G1 X122.472 Y126.551 E.12337
G1 X122.472 Y126.068 E.02898
G1 X124.528 Y126.068 E.12337
G1 X124.528 Y125.585 E.02898
G1 X122.472 Y125.585 E.12337
G1 X122.472 Y125.102 E.02898
G1 X124.731 Y125.102 E.13552
M106 S252.45
G1 X122.583 Y124.583 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.597882
; LAYER_HEIGHT: 0.2
G1 F1874
G1 X124.153 Y124.583 E.07101
G1 X124.694 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1874
G1 X132.306 Y124.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X130.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/85
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
G3 Z17 I-.941 J-.771 P1  F30000
G1 X124.898 Y131.102 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2433
G1 X124.898 Y124.898 E.2058
G1 X132.102 Y124.898 E.23898
G1 X132.102 Y131.102 E.2058
G1 X124.958 Y131.102 E.23698
G1 X125.29 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.419 J1.143 P1  F30000
G1 X137.898 Y124.102 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2433
G1 X137.898 Y131.898 E.2586
G1 X122.102 Y131.898 E.52398
G1 X122.102 Y124.102 E.2586
G1 X137.838 Y124.102 E.52199
G1 X138.29 Y123.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X138.244 Y125.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.124 J-1.211 P1  F30000
G1 X132.494 Y125.123 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2433
G1 X132.494 Y130.892 E.17727
G1 X132.669 Y130.98 E.006
G1 X132.698 Y131.506 E.01618
G1 X137.506 Y131.506 E.14774
G1 X137.506 Y124.494 E.21545
G1 X132.698 Y124.494 E.14774
G1 X132.669 Y125.02 E.01618
G1 X132.546 Y125.092 E.00438
G1 X134.784 Y129.216 F30000
; LINE_WIDTH: 0.474828
G1 F2433
G1 X135.216 Y129.216 E.0152
G1 X135.216 Y126.784 E.08559
G1 X134.784 Y126.784 E.0152
G1 X134.784 Y129.156 E.08348
G1 X134.38 Y129.62 F30000
; LINE_WIDTH: 0.419999
G1 F2433
G1 X135.62 Y129.62 E.03813
G1 X135.62 Y126.38 E.09958
G1 X134.38 Y126.38 E.03813
G1 X134.38 Y129.56 E.09774
G1 X134.002 Y129.998 F30000
G1 F2433
G1 X135.998 Y129.998 E.0613
G1 X135.998 Y126.002 E.12276
G1 X134.002 Y126.002 E.0613
G1 X134.002 Y129.938 E.12091
G1 X133.625 Y130.375 F30000
G1 F2433
G1 X136.375 Y130.375 E.08448
G1 X136.375 Y125.625 E.14593
G1 X133.625 Y125.625 E.08448
G1 X133.625 Y130.315 E.14409
G1 X133.248 Y130.545 F30000
G1 F2433
G1 X133.306 Y130.577 E.00203
G1 X133.357 Y130.752 E.00558
G1 X136.752 Y130.752 E.10432
G1 X136.752 Y125.248 E.1691
G1 X133.357 Y125.248 E.10432
G1 X133.306 Y125.423 E.00558
G1 X133.248 Y125.455 E.00203
G1 X133.248 Y130.485 E.15458
G1 X132.871 Y130.715 F30000
M73 P97 R0
G1 F2433
G1 X132.987 Y130.779 E.00407
G1 X133.075 Y131.129 E.01109
G1 X137.129 Y131.129 E.12457
G1 X137.129 Y124.871 E.19228
G1 X133.075 Y124.871 E.12457
G1 X132.987 Y125.221 E.01109
G1 X132.871 Y125.285 E.00407
G1 X132.871 Y130.655 E.16498
G1 X132.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2433
G1 X124.694 Y131.5 E.24112
G1 X123.72 Y130.517 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483144
G1 F2433
G1 X123.72 Y125.483 E.18056
G3 X123.607 Y125.28 I.151 J-.217 E.00865
G1 X123.28 Y125.28 E.01173
G1 X123.28 Y130.72 E.19516
G1 X123.607 Y130.72 E.01173
G1 X123.676 Y130.553 E.00649
G1 X124.129 Y130.708 F30000
; LINE_WIDTH: 0.419999
G1 F2433
G1 X124.129 Y125.292 E.1664
G1 X123.992 Y125.186 E.00532
G1 X123.925 Y124.871 E.00989
G1 X122.871 Y124.871 E.03239
G1 X122.871 Y131.129 E.19228
G1 X123.925 Y131.129 E.03239
G1 X124.022 Y130.765 E.01157
G1 X124.076 Y130.736 E.00189
G1 X124.506 Y130.877 F30000
G1 F2433
G1 X124.506 Y125.123 E.17681
G1 X124.325 Y125.008 E.00659
G1 X124.302 Y124.494 E.01581
G1 X122.494 Y124.494 E.05556
G1 X122.494 Y131.506 E.21545
G1 X124.302 Y131.506 E.05556
G1 X124.325 Y130.992 E.01581
G1 X124.455 Y130.909 E.00475
G1 X124.694 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2433
G1 X132.306 Y124.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X130.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/85
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
G3 Z17.2 I-.947 J-.765 P1  F30000
G1 X125.29 Y130.71 Z17.2
G1 Z17
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2852
G1 X125.29 Y125.29 E.16654
G1 X131.71 Y125.29 E.19727
G1 X131.71 Y130.71 E.16654
G1 X125.35 Y130.71 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X125.328 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.438 J1.135 P1  F30000
G1 X138.29 Y123.71 Z17.4
G1 Z17
G1 E.8 F1800
M204 S5000
G1 F2852
G1 X138.29 Y132.29 E.26364
G1 X121.71 Y132.29 E.50946
G1 X121.71 Y123.71 E.26364
G1 X138.23 Y123.71 E.50761
M204 S10000
G1 X137.383 Y123.917 F30000
M204 S2000
; FEATURE: Top surface
G1 F2852
G1 X138.083 Y124.617 E.03042
G1 X138.083 Y125.151
G1 X136.849 Y123.917 E.05359
G1 X136.316 Y123.917
G1 X138.083 Y125.684 E.07676
G1 X138.083 Y126.217
G1 X135.783 Y123.917 E.09994
G1 X135.25 Y123.917
G1 X138.083 Y126.75 E.12311
G1 X138.083 Y127.284
G1 X134.716 Y123.917 E.14628
G1 X134.183 Y123.917
G1 X138.083 Y127.817 E.16946
G1 X138.083 Y128.35
G1 X133.65 Y123.917 E.19263
G1 X133.116 Y123.917
G1 X138.083 Y128.884 E.2158
G1 X138.083 Y129.417
G1 X132.583 Y123.917 E.23898
G1 X132.05 Y123.917
G1 X138.083 Y129.95 E.26215
G1 X138.083 Y130.483
G1 X131.517 Y123.917 E.28532
G1 X130.983 Y123.917
G1 X138.083 Y131.017 E.3085
G1 X138.083 Y131.55
G1 X131.917 Y125.385 E.26791
G1 X131.917 Y125.918
G1 X138.082 Y132.083 E.26788
G1 X137.549 Y132.083
G1 X131.917 Y126.451 E.24471
G1 X131.917 Y126.984
G1 X137.016 Y132.083 E.22154
G1 X136.482 Y132.083
G1 X131.917 Y127.518 E.19837
G1 X131.917 Y128.051
G1 X135.949 Y132.083 E.17519
G1 X135.416 Y132.083
G1 X131.917 Y128.584 E.15202
G1 X131.917 Y129.118
G1 X134.882 Y132.083 E.12885
G1 X134.349 Y132.083
G1 X131.917 Y129.651 E.10567
G1 X131.917 Y130.184
G1 X133.816 Y132.083 E.0825
G1 X133.283 Y132.083
G1 X131.917 Y130.717 E.05933
G1 X131.584 Y130.917
G1 X132.749 Y132.083 E.05063
G1 X132.216 Y132.083
G1 X131.051 Y130.917 E.05063
G1 X130.518 Y130.917
G1 X131.683 Y132.083 E.05063
G1 X131.15 Y132.083
G1 X129.984 Y130.917 E.05063
G1 X129.451 Y130.917
G1 X130.616 Y132.083 E.05063
G1 X130.083 Y132.083
G1 X128.918 Y130.917 E.05063
G1 X128.385 Y130.917
G1 X129.55 Y132.083 E.05063
G1 X129.016 Y132.083
G1 X127.851 Y130.917 E.05063
G1 X127.318 Y130.917
G1 X128.483 Y132.083 E.05063
G1 X127.95 Y132.083
G1 X126.785 Y130.917 E.05063
G1 X126.251 Y130.917
G1 X127.417 Y132.083 E.05063
G1 X126.883 Y132.083
G1 X125.718 Y130.917 E.05063
G1 X125.185 Y130.917
G1 X126.35 Y132.083 E.05063
M204 S10000
; WIPE_START
G1 F24000
G1 X125.185 Y130.917 E-.62619
G1 X125.537 Y130.917 E-.13381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.996 J.699 P1  F30000
G1 X130.45 Y123.917 Z17.4
G1 Z17
G1 E.8 F1800
M204 S2000
G1 F2852
G1 X131.615 Y125.083 E.05063
G1 X131.082 Y125.083
G1 X129.917 Y123.917 E.05063
G1 X129.384 Y123.917
G1 X130.549 Y125.083 E.05063
G1 X130.016 Y125.083
G1 X128.85 Y123.917 E.05063
G1 X128.317 Y123.917
G1 X129.482 Y125.083 E.05063
G1 X128.949 Y125.083
G1 X127.784 Y123.917 E.05063
G1 X127.25 Y123.917
G1 X128.416 Y125.083 E.05063
G1 X127.882 Y125.083
G1 X126.717 Y123.917 E.05063
G1 X126.184 Y123.917
G1 X127.349 Y125.083 E.05063
M73 P98 R0
G1 X126.816 Y125.083
G1 X125.651 Y123.917 E.05063
G1 X125.117 Y123.917
G1 X126.283 Y125.083 E.05063
G1 X125.749 Y125.083
G1 X124.584 Y123.917 E.05063
G1 X124.051 Y123.917
G1 X125.216 Y125.083 E.05063
G1 X125.083 Y125.482
G1 X123.518 Y123.917 E.06801
G1 X122.984 Y123.917
G1 X125.083 Y126.016 E.09118
G1 X125.083 Y126.549
G1 X122.451 Y123.917 E.11435
G1 X121.918 Y123.917
G1 X125.083 Y127.082 E.13753
G1 X125.083 Y127.615
G1 X121.917 Y124.45 E.13754
G1 X121.917 Y124.984
G1 X125.083 Y128.149 E.13754
G1 X125.083 Y128.682
G1 X121.917 Y125.517 E.13754
G1 X121.917 Y126.05
G1 X125.083 Y129.215 E.13754
G1 X125.083 Y129.749
G1 X121.917 Y126.583 E.13754
G1 X121.917 Y127.117
G1 X125.083 Y130.282 E.13754
G1 X125.083 Y130.815
G1 X121.917 Y127.65 E.13754
G1 X121.917 Y128.183
G1 X125.817 Y132.083 E.16945
G1 X125.284 Y132.083
G1 X121.917 Y128.716 E.14628
G1 X121.917 Y129.25
G1 X124.75 Y132.083 E.1231
G1 X124.217 Y132.083
G1 X121.917 Y129.783 E.09993
G1 X121.917 Y130.316
G1 X123.684 Y132.083 E.07676
G1 X123.15 Y132.083
G1 X121.917 Y130.85 E.05358
G1 X121.917 Y131.383
G1 X122.617 Y132.083 E.03041
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X121.917 Y131.383 E-.37609
G1 X121.917 Y130.85 E-.20264
G1 X122.255 Y131.187 E-.18126
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
G1 Z17.5 F900 ; lower z a little
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

    G1 Z117 F600
    G1 Z115

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

