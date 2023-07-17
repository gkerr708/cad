; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 6m 13s; total estimated time: 12m 1s
; total layer number: 40
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
M73 P36 R7
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
M73 P37 R7
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

G1 X70 F9000
M73 P39 R7
G1 X76 F15000
M73 P41 R7
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
M73 P41 R6
G1 X70 F15000
M73 P42 R6
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
    G29 A X115 Y126.475 I30 J7.04994
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
M73 P43 R6
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
; layer num/total_layer_count: 1/40
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
G1 X115.857 Y130.668 F30000
G1 Z.4
G1 Z.2
M73 P44 R6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X115.857 Y125.332 E.19874
G1 X144.143 Y125.332 E1.05354
G1 X144.143 Y130.668 E.19874
G1 X115.917 Y130.668 E1.05131
G1 X115.4 Y131.125 F30000
; FEATURE: Outer wall
G1 F3000
G1 X115.4 Y124.875 E.23279
G1 X144.6 Y124.875 E1.08759
M73 P45 R6
G1 X144.6 Y131.125 E.23279
G1 X115.46 Y131.125 E1.08535
; WIPE_START
G1 F24000
G1 X115.441 Y129.125 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.158 J1.207 P1  F30000
G1 X143.036 Y125.515 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500206
G1 F3916
M73 P46 R6
G1 X143.754 Y126.234 E.03788
G1 X143.754 Y126.88 E.0241
G1 X142.595 Y125.721 E.06112
G1 X141.948 Y125.721 E.0241
G1 X143.754 Y127.527 E.0952
G1 X143.754 Y128.174 E.0241
G1 X141.301 Y125.721 E.12928
G1 X140.655 Y125.721 E.0241
G1 X143.754 Y128.82 E.16335
G1 X143.754 Y129.467 E.0241
G1 X140.008 Y125.721 E.19743
G1 X139.361 Y125.721 E.0241
G1 X143.754 Y130.114 E.23151
G1 X143.754 Y130.279 E.00617
M73 P47 R6
G1 X143.273 Y130.279 E.01793
G1 X138.714 Y125.721 E.24024
G1 X138.068 Y125.721 E.0241
G1 X142.627 Y130.279 E.24024
G1 X141.98 Y130.279 E.0241
G1 X137.421 Y125.721 E.24024
G1 X136.774 Y125.721 E.0241
G1 X141.333 Y130.279 E.24024
G1 X140.686 Y130.279 E.0241
G1 X136.128 Y125.721 E.24024
G1 X135.481 Y125.721 E.0241
G1 X140.04 Y130.279 E.24024
G1 X139.393 Y130.279 E.0241
G1 X134.834 Y125.721 E.24024
M73 P48 R6
G1 X134.188 Y125.721 E.0241
G1 X138.746 Y130.279 E.24024
G1 X138.1 Y130.279 E.0241
G1 X133.541 Y125.721 E.24024
G1 X132.894 Y125.721 E.0241
G1 X137.453 Y130.279 E.24024
G1 X136.806 Y130.279 E.0241
G1 X132.247 Y125.721 E.24024
G1 X131.601 Y125.721 E.0241
G1 X136.16 Y130.279 E.24024
G1 X135.513 Y130.279 E.0241
G1 X130.954 Y125.721 E.24024
G1 X130.307 Y125.721 E.0241
G1 X134.866 Y130.279 E.24024
G1 X134.219 Y130.279 E.0241
G1 X129.661 Y125.721 E.24024
G1 X129.014 Y125.721 E.0241
G1 X133.573 Y130.279 E.24024
G1 X132.926 Y130.279 E.0241
G1 X128.367 Y125.721 E.24024
G1 X127.721 Y125.721 E.0241
G1 X132.279 Y130.279 E.24024
G1 X131.633 Y130.279 E.0241
G1 X127.074 Y125.721 E.24024
G1 X126.427 Y125.721 E.0241
G1 X130.986 Y130.279 E.24024
G1 X130.339 Y130.279 E.0241
G1 X125.78 Y125.721 E.24024
G1 X125.134 Y125.721 E.0241
G1 X129.693 Y130.279 E.24024
G1 X129.046 Y130.279 E.0241
G1 X124.487 Y125.721 E.24024
G1 X123.84 Y125.721 E.0241
G1 X128.399 Y130.279 E.24024
G1 X127.752 Y130.279 E.0241
G1 X123.194 Y125.721 E.24024
M73 P49 R6
G1 X122.547 Y125.721 E.0241
G1 X127.106 Y130.279 E.24024
G1 X126.459 Y130.279 E.0241
G1 X121.9 Y125.721 E.24024
G1 X121.254 Y125.721 E.0241
G1 X125.812 Y130.279 E.24024
G1 X125.166 Y130.279 E.0241
G1 X120.607 Y125.721 E.24024
G1 X119.96 Y125.721 E.0241
G1 X124.519 Y130.279 E.24024
G1 X123.872 Y130.279 E.0241
G1 X119.313 Y125.721 E.24024
G1 X118.667 Y125.721 E.0241
G1 X123.226 Y130.279 E.24024
G1 X122.579 Y130.279 E.0241
G1 X118.02 Y125.721 E.24024
G1 X117.373 Y125.721 E.0241
G1 X121.932 Y130.279 E.24024
G1 X121.285 Y130.279 E.0241
G1 X116.727 Y125.721 E.24024
G1 X116.246 Y125.721 E.01793
G1 X116.246 Y125.886 E.00617
G1 X120.639 Y130.279 E.23151
G1 X119.992 Y130.279 E.0241
G1 X116.246 Y126.533 E.19743
G1 X116.246 Y127.18 E.0241
G1 X119.345 Y130.279 E.16335
G1 X118.699 Y130.279 E.0241
G1 X116.246 Y127.826 E.12927
G1 X116.246 Y128.473 E.0241
G1 X118.052 Y130.279 E.09519
G1 X117.405 Y130.279 E.0241
G1 X116.246 Y129.12 E.06111
G1 X116.246 Y129.766 E.0241
G1 X116.964 Y130.485 E.03787
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.246 Y129.766 E-.3862
G1 X116.246 Y129.12 E-.24575
G1 X116.484 Y129.358 E-.12805
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/40
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
G3 Z.6 I-1.06 J-.597 P1  F30000
G1 X115.602 Y130.923 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4155
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4155
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.06 J1.215 P1  F30000
G1 X141.703 Y128 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499801
G1 F4155
G1 X141.703 Y127.772 E.0085
M73 P50 R6
G1 X118.297 Y127.772 E.87144
G1 X118.297 Y128.228 E.01701
G1 X141.703 Y128.228 E.87144
G1 X141.703 Y128.06 E.00627
G1 X142.12 Y128 F30000
; LINE_WIDTH: 0.419999
G1 F4155
G1 X142.12 Y127.355 E.01983
G1 X117.88 Y127.355 E.74485
G1 X117.88 Y128.645 E.03966
G1 X142.12 Y128.645 E.74485
G1 X142.12 Y128.06 E.01799
G1 X142.498 Y128 F30000
G1 F4155
G1 X142.498 Y126.978 E.03142
M73 P50 R5
G1 X117.502 Y126.978 E.76803
G1 X117.502 Y129.023 E.06284
G1 X142.498 Y129.023 E.76803
G1 X142.498 Y128.06 E.02957
G1 X142.875 Y128 F30000
G1 F4155
G1 X142.875 Y126.6 E.04301
G1 X117.125 Y126.6 E.7912
G1 X117.125 Y129.4 E.08601
G1 X142.875 Y129.4 E.7912
G1 X142.875 Y128.06 E.04116
G1 X143.252 Y128 F30000
G1 F4155
G1 X143.252 Y126.223 E.05459
G1 X116.748 Y126.223 E.81437
G1 X116.748 Y129.777 E.10918
G1 X143.252 Y129.777 E.81437
G1 X143.252 Y128.06 E.05275
G1 X143.629 Y128 F30000
G1 F4155
G1 X143.629 Y125.846 E.06618
G1 X116.371 Y125.846 E.83755
G1 X116.371 Y130.154 E.13236
G1 X143.629 Y130.154 E.83755
G1 X143.629 Y128.06 E.06433
G1 X144.006 Y128 F30000
G1 F4155
G1 X144.006 Y125.469 E.07776
G1 X115.994 Y125.469 E.86072
G1 X115.994 Y130.531 E.15553
G1 X144.006 Y130.531 E.86072
G1 X144.006 Y128.06 E.07592
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X144.006 Y130.06 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/40
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
G3 Z.8 I-.037 J-1.216 P1  F30000
G1 X115.602 Y130.923 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4183
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4183
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.06 J1.215 P1  F30000
G1 X141.703 Y128 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499801
G1 F4183
G1 X141.703 Y127.772 E.0085
G1 X118.297 Y127.772 E.87144
M73 P51 R5
G1 X118.297 Y128.228 E.01701
G1 X141.703 Y128.228 E.87144
G1 X141.703 Y128.06 E.00627
G1 X142.12 Y128 F30000
; LINE_WIDTH: 0.419999
G1 F4183
G1 X142.12 Y127.355 E.01983
G1 X117.88 Y127.355 E.74485
G1 X117.88 Y128.645 E.03966
G1 X142.12 Y128.645 E.74485
G1 X142.12 Y128.06 E.01799
G1 X142.498 Y128 F30000
G1 F4183
G1 X142.498 Y126.978 E.03142
G1 X117.502 Y126.978 E.76803
G1 X117.502 Y129.023 E.06284
G1 X142.498 Y129.023 E.76803
G1 X142.498 Y128.06 E.02957
G1 X142.875 Y128 F30000
G1 F4183
G1 X142.875 Y126.6 E.04301
G1 X117.125 Y126.6 E.7912
G1 X117.125 Y129.4 E.08601
G1 X142.875 Y129.4 E.7912
G1 X142.875 Y128.06 E.04116
G1 X143.252 Y128 F30000
G1 F4183
G1 X143.252 Y126.223 E.05459
G1 X116.748 Y126.223 E.81437
G1 X116.748 Y129.777 E.10918
G1 X143.252 Y129.777 E.81437
G1 X143.252 Y128.06 E.05275
G1 X143.629 Y128 F30000
G1 F4183
G1 X143.629 Y125.846 E.06618
G1 X116.371 Y125.846 E.83755
G1 X116.371 Y130.154 E.13236
G1 X143.629 Y130.154 E.83755
G1 X143.629 Y128.06 E.06433
G1 X144.006 Y128 F30000
G1 F4183
G1 X144.006 Y125.469 E.07776
G1 X115.994 Y125.469 E.86072
G1 X115.994 Y130.531 E.15553
G1 X144.006 Y130.531 E.86072
G1 X144.006 Y128.06 E.07592
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X144.006 Y130.06 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/40
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
G3 Z1 I-.037 J-1.216 P1  F30000
G1 X115.602 Y130.923 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2183
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2183
M73 P52 R5
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.906 J.812 P1  F30000
G1 X116.357 Y128.081 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2183
G1 X116.357 Y129.709 E.05401
G1 X116.816 Y130.168 E.02149
G1 X120.156 Y130.168 E.11082
G1 X124.492 Y125.832 E.20337
G1 X127.832 Y125.832 E.11082
G1 X132.168 Y130.168 E.20337
G1 X135.508 Y130.168 E.11082
G1 X139.844 Y125.832 E.20337
G1 X143.184 Y125.832 E.11082
G1 X143.643 Y126.291 E.02149
G1 X143.643 Y129.709 E.11341
G1 X143.184 Y130.168 E.02149
G1 X139.844 Y130.168 E.11082
G1 X135.508 Y125.832 E.20337
G1 X132.168 Y125.832 E.11082
G1 X127.832 Y130.168 E.20337
G1 X124.492 Y130.168 E.11082
G1 X120.156 Y125.832 E.20337
G1 X116.816 Y125.832 E.11082
G1 X116.357 Y126.291 E.02149
G1 X116.357 Y127.919 E.05401
G1 X144.05 Y130.515 F30000
G1 F2183
G1 X144.05 Y125.425 E.16882
G1 X115.95 Y125.425 E.93211
G1 X115.95 Y130.575 E.17081
G1 X144.05 Y130.575 E.93211
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X142.05 Y130.575 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/40
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
G3 Z1.2 I-.016 J-1.217 P1  F30000
G1 X115.602 Y130.923 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2182
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2182
M73 P53 R5
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.906 J.812 P1  F30000
G1 X116.357 Y128.081 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2182
G1 X116.357 Y129.709 E.05401
G1 X116.816 Y130.168 E.02149
G1 X120.156 Y130.168 E.11082
G1 X124.492 Y125.832 E.20337
G1 X127.832 Y125.832 E.11082
G1 X132.168 Y130.168 E.20337
G1 X135.508 Y130.168 E.11082
G1 X139.844 Y125.832 E.20337
G1 X143.184 Y125.832 E.11082
G1 X143.643 Y126.291 E.02149
G1 X143.643 Y129.709 E.11341
G1 X143.184 Y130.168 E.02149
G1 X139.844 Y130.168 E.11082
G1 X135.508 Y125.832 E.20337
G1 X132.168 Y125.832 E.11082
G1 X127.832 Y130.168 E.20337
G1 X124.492 Y130.168 E.11082
G1 X120.156 Y125.832 E.20337
G1 X116.816 Y125.832 E.11082
G1 X116.357 Y126.291 E.02149
G1 X116.357 Y127.919 E.05401
G1 X144.05 Y130.515 F30000
G1 F2182
G1 X144.05 Y125.425 E.16882
G1 X115.95 Y125.425 E.93211
G1 X115.95 Y130.575 E.17081
G1 X144.05 Y130.575 E.93211
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X142.05 Y130.575 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/40
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
G3 Z1.4 I-.016 J-1.217 P1  F30000
G1 X115.602 Y130.923 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10431
G1 X115.602 Y125.077 E.19392
M73 P54 R5
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10431
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.198 J.212 P1  F30000
G1 X115.973 Y125.244 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.402482
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X115.973 Y130.553 E.2752
G1 X116.426 Y130.553 E.02346
G1 X116.426 Y125.447 E.2647
G1 X116.878 Y125.447 E.02346
G1 X116.878 Y130.553 E.2647
G1 X117.33 Y130.553 E.02346
G1 X117.33 Y125.447 E.2647
G1 X117.783 Y125.447 E.02346
G1 X117.783 Y130.553 E.2647
G1 X118.235 Y130.553 E.02346
G1 X118.235 Y125.447 E.2647
G1 X118.688 Y125.447 E.02346
G1 X118.688 Y130.553 E.2647
G1 X119.14 Y130.553 E.02346
G1 X119.14 Y125.447 E.2647
G1 X119.593 Y125.447 E.02346
G1 X119.593 Y130.553 E.2647
G1 X120.045 Y130.553 E.02346
G1 X120.045 Y125.447 E.2647
G1 X120.498 Y125.447 E.02346
G1 X120.498 Y130.553 E.2647
G1 X120.95 Y130.553 E.02346
G1 X120.95 Y125.447 E.2647
G1 X121.403 Y125.447 E.02346
G1 X121.403 Y130.553 E.2647
G1 X121.855 Y130.553 E.02346
M73 P55 R5
G1 X121.855 Y125.447 E.2647
G1 X122.308 Y125.447 E.02346
G1 X122.308 Y130.553 E.2647
G1 X122.76 Y130.553 E.02346
G1 X122.76 Y125.447 E.2647
G1 X123.213 Y125.447 E.02346
G1 X123.213 Y130.553 E.2647
G1 X123.665 Y130.553 E.02346
G1 X123.665 Y125.447 E.2647
G1 X124.118 Y125.447 E.02346
G1 X124.118 Y130.553 E.2647
G1 X124.57 Y130.553 E.02346
G1 X124.57 Y125.447 E.2647
G1 X125.023 Y125.447 E.02346
G1 X125.023 Y130.553 E.2647
G1 X125.475 Y130.553 E.02346
G1 X125.475 Y125.447 E.2647
G1 X125.928 Y125.447 E.02346
G1 X125.928 Y130.553 E.2647
G1 X126.38 Y130.553 E.02346
G1 X126.38 Y125.447 E.2647
G1 X126.833 Y125.447 E.02346
G1 X126.833 Y130.553 E.2647
G1 X127.285 Y130.553 E.02346
G1 X127.285 Y125.447 E.2647
G1 X127.738 Y125.447 E.02346
G1 X127.738 Y130.553 E.2647
G1 X128.19 Y130.553 E.02346
G1 X128.19 Y125.447 E.2647
G1 X128.643 Y125.447 E.02346
G1 X128.643 Y130.553 E.2647
G1 X129.095 Y130.553 E.02346
G1 X129.095 Y125.447 E.2647
G1 X129.547 Y125.447 E.02346
G1 X129.547 Y130.553 E.2647
G1 X130 Y130.553 E.02346
G1 X130 Y125.447 E.2647
G1 X130.452 Y125.447 E.02346
G1 X130.452 Y130.553 E.2647
G1 X130.905 Y130.553 E.02346
G1 X130.905 Y125.447 E.2647
G1 X131.357 Y125.447 E.02346
G1 X131.357 Y130.553 E.2647
G1 X131.81 Y130.553 E.02346
G1 X131.81 Y125.447 E.2647
G1 X132.262 Y125.447 E.02346
G1 X132.262 Y130.553 E.2647
G1 X132.715 Y130.553 E.02346
G1 X132.715 Y125.447 E.2647
G1 X133.167 Y125.447 E.02346
G1 X133.167 Y130.553 E.2647
G1 X133.62 Y130.553 E.02346
G1 X133.62 Y125.447 E.2647
G1 X134.072 Y125.447 E.02346
G1 X134.072 Y130.553 E.2647
G1 X134.525 Y130.553 E.02346
G1 X134.525 Y125.447 E.2647
G1 X134.977 Y125.447 E.02346
G1 X134.977 Y130.553 E.2647
G1 X135.43 Y130.553 E.02346
G1 X135.43 Y125.447 E.2647
G1 X135.882 Y125.447 E.02346
G1 X135.882 Y130.553 E.2647
G1 X136.335 Y130.553 E.02346
G1 X136.335 Y125.447 E.2647
G1 X136.787 Y125.447 E.02346
G1 X136.787 Y130.553 E.2647
G1 X137.24 Y130.553 E.02346
G1 X137.24 Y125.447 E.2647
G1 X137.692 Y125.447 E.02346
G1 X137.692 Y130.553 E.2647
G1 X138.145 Y130.553 E.02346
G1 X138.145 Y125.447 E.2647
G1 X138.597 Y125.447 E.02346
G1 X138.597 Y130.553 E.2647
G1 X139.05 Y130.553 E.02346
G1 X139.05 Y125.447 E.2647
G1 X139.502 Y125.447 E.02346
G1 X139.502 Y130.553 E.2647
G1 X139.955 Y130.553 E.02346
G1 X139.955 Y125.447 E.2647
G1 X140.407 Y125.447 E.02346
G1 X140.407 Y130.553 E.2647
G1 X140.86 Y130.553 E.02346
G1 X140.86 Y125.447 E.2647
G1 X141.312 Y125.447 E.02346
G1 X141.312 Y130.553 E.2647
G1 X141.764 Y130.553 E.02346
G1 X141.764 Y125.447 E.2647
G1 X142.217 Y125.447 E.02346
G1 X142.217 Y130.553 E.2647
G1 X142.669 Y130.553 E.02346
G1 X142.669 Y125.447 E.2647
G1 X143.122 Y125.447 E.02346
G1 X143.122 Y130.553 E.2647
G1 X143.574 Y130.553 E.02346
G1 X143.574 Y125.447 E.2647
G1 X144.027 Y125.447 E.02346
G1 X144.027 Y130.756 E.2752
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X144.027 Y128.756 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/40
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
G3 Z1.6 I-.093 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4184
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4184
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.06 J1.215 P1  F30000
G1 X141.703 Y128 Z1.8
G1 Z1.4
M73 P56 R5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499801
G1 F4184
G1 X141.703 Y127.772 E.0085
G1 X118.297 Y127.772 E.87144
G1 X118.297 Y128.228 E.01701
G1 X141.703 Y128.228 E.87144
G1 X141.703 Y128.06 E.00627
G1 X142.12 Y128 F30000
; LINE_WIDTH: 0.419999
G1 F4184
G1 X142.12 Y127.355 E.01983
G1 X117.88 Y127.355 E.74485
G1 X117.88 Y128.645 E.03966
G1 X142.12 Y128.645 E.74485
G1 X142.12 Y128.06 E.01799
G1 X142.498 Y128 F30000
G1 F4184
G1 X142.498 Y126.978 E.03142
G1 X117.502 Y126.978 E.76803
G1 X117.502 Y129.023 E.06284
G1 X142.498 Y129.023 E.76803
G1 X142.498 Y128.06 E.02957
G1 X142.875 Y128 F30000
G1 F4184
G1 X142.875 Y126.6 E.04301
G1 X117.125 Y126.6 E.7912
G1 X117.125 Y129.4 E.08601
G1 X142.875 Y129.4 E.7912
G1 X142.875 Y128.06 E.04116
G1 X143.252 Y128 F30000
G1 F4184
G1 X143.252 Y126.223 E.05459
G1 X116.748 Y126.223 E.81437
G1 X116.748 Y129.777 E.10918
G1 X143.252 Y129.777 E.81437
G1 X143.252 Y128.06 E.05275
G1 X143.629 Y128 F30000
G1 F4184
G1 X143.629 Y125.846 E.06618
G1 X116.371 Y125.846 E.83755
G1 X116.371 Y130.154 E.13236
G1 X143.629 Y130.154 E.83755
G1 X143.629 Y128.06 E.06433
G1 X144.006 Y128 F30000
G1 F4184
G1 X144.006 Y125.469 E.07776
G1 X115.994 Y125.469 E.86072
G1 X115.994 Y130.531 E.15553
G1 X144.006 Y130.531 E.86072
G1 X144.006 Y128.06 E.07592
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X144.006 Y130.06 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/40
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
G3 Z1.8 I-.037 J-1.216 P1  F30000
G1 X115.602 Y130.923 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5401
G1 X115.602 Y128.657 E.07515
G1 X115.832 Y128.643 E.00763
G1 X115.878 Y129.022 E.01265
G1 X116.099 Y129.605 E.02068
G1 X116.453 Y130.118 E.02068
G1 X116.919 Y130.531 E.02068
G1 X117.311 Y130.737 E.01469
G1 X117.266 Y130.923 E.00635
G1 X115.662 Y130.923 E.05319
; WIPE_START
G1 F24000
G1 X115.609 Y128.924 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.013 J1.217 P1  F30000
G1 X130.375 Y128.77 Z2
G1 Z1.6
G1 E.8 F1800
G1 F5401
G1 X130.303 Y128.175 E.01988
G1 X130.375 Y127.58 E.01988
G1 X130.588 Y127.02 E.01988
G1 X130.928 Y126.527 E.01988
G1 X131.377 Y126.129 E.01988
M73 P57 R5
G1 X131.907 Y125.851 E.01988
G1 X132.489 Y125.708 E.01988
G1 X133.089 Y125.708 E.01988
G1 X133.67 Y125.851 E.01988
G1 X134.201 Y126.129 E.01988
G1 X134.65 Y126.527 E.01988
G1 X134.99 Y127.02 E.01988
G1 X135.202 Y127.58 E.01988
G1 X135.275 Y128.175 E.01988
G1 X135.202 Y128.77 E.01988
G1 X134.99 Y129.33 E.01988
G1 X134.65 Y129.823 E.01988
G1 X134.201 Y130.221 E.01988
G1 X133.67 Y130.499 E.01988
G1 X133.089 Y130.643 E.01988
G1 X132.489 Y130.643 E.01988
G1 X131.907 Y130.499 E.01988
G1 X131.377 Y130.221 E.01988
G1 X130.928 Y129.823 E.01988
G1 X130.588 Y129.33 E.01988
G1 X130.397 Y128.826 E.01789
; WIPE_START
G1 F24000
G1 X130.303 Y128.175 E-.24991
G1 X130.375 Y127.58 E-.22771
G1 X130.588 Y127.02 E-.22771
G1 X130.67 Y126.902 E-.05467
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.256 J1.19 P1  F30000
G1 X138.208 Y128.522 Z2
G1 Z1.6
G1 E.8 F1800
G1 F5401
G1 X138.138 Y127.947 E.01923
G1 X138.209 Y127.364 E.01948
G1 X138.417 Y126.815 E.01948
G1 X138.751 Y126.332 E.01948
G1 X139.19 Y125.943 E.01948
G1 X139.71 Y125.67 E.01948
G1 X140.28 Y125.529 E.01948
G1 X140.868 Y125.529 E.01948
G1 X141.438 Y125.67 E.01948
G1 X141.958 Y125.942 E.01948
G1 X142.397 Y126.332 E.01948
G1 X142.731 Y126.815 E.01948
G1 X142.939 Y127.364 E.01948
G1 X143.01 Y127.947 E.01948
G1 X142.939 Y128.53 E.01948
G1 X142.731 Y129.079 E.01948
G1 X142.397 Y129.562 E.01948
G1 X141.958 Y129.952 E.01948
G1 X141.438 Y130.224 E.01948
G1 X140.868 Y130.365 E.01948
G1 X140.28 Y130.365 E.01948
G1 X139.71 Y130.224 E.01948
G1 X139.19 Y129.952 E.01948
G1 X138.751 Y129.562 E.01948
G1 X138.417 Y129.079 E.01948
G1 X138.228 Y128.579 E.01774
; WIPE_START
G1 F24000
G1 X138.138 Y127.947 E-.24252
G1 X138.209 Y127.364 E-.22313
G1 X138.417 Y126.815 E-.22313
G1 X138.524 Y126.661 E-.07122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.079 J-1.214 P1  F30000
G1 X115.602 Y128.149 Z2
G1 Z1.6
G1 E.8 F1800
G1 F5401
G1 X115.602 Y125.077 E.10191
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X126.503 Y130.923 E.59361
G1 X126.477 Y130.708 E.00718
G1 X126.787 Y130.632 E.0106
G1 X127.328 Y130.348 E.02028
G1 X127.786 Y129.942 E.02028
G1 X128.133 Y129.439 E.02028
G1 X128.35 Y128.868 E.02028
G1 X128.424 Y128.261 E.02028
G1 X128.35 Y127.654 E.02028
G1 X128.133 Y127.082 E.02028
G1 X127.786 Y126.579 E.02028
G1 X127.328 Y126.174 E.02028
G1 X126.787 Y125.89 E.02028
G1 X126.194 Y125.744 E.02028
G1 X125.582 Y125.744 E.02028
G1 X124.989 Y125.89 E.02028
G1 X124.448 Y126.174 E.02028
G1 X123.99 Y126.579 E.02028
G1 X123.643 Y127.082 E.02028
G1 X123.426 Y127.654 E.02028
G1 X123.352 Y128.261 E.02028
G1 X123.426 Y128.868 E.02028
G1 X123.643 Y129.439 E.02028
G1 X123.99 Y129.942 E.02028
G1 X124.448 Y130.348 E.02028
G1 X124.989 Y130.632 E.02028
G1 X125.299 Y130.708 E.0106
G1 X125.273 Y130.923 E.00718
G1 X119.511 Y130.923 E.19114
G1 X119.465 Y130.737 E.00635
G1 X119.857 Y130.531 E.01469
G1 X120.324 Y130.118 E.02068
G1 X120.678 Y129.605 E.02068
G1 X120.899 Y129.022 E.02068
G1 X120.974 Y128.403 E.02068
G1 X120.899 Y127.785 E.02068
G1 X120.678 Y127.202 E.02068
G1 X120.324 Y126.689 E.02068
G1 X119.857 Y126.275 E.02068
G1 X119.305 Y125.986 E.02068
G1 X118.7 Y125.836 E.02068
G1 X118.076 Y125.836 E.02068
G1 X117.471 Y125.986 E.02068
G1 X116.919 Y126.275 E.02068
G1 X116.453 Y126.689 E.02068
G1 X116.099 Y127.202 E.02068
G1 X115.878 Y127.785 E.02068
G1 X115.832 Y128.163 E.01265
G1 X115.662 Y128.153 E.00564
; WIPE_START
G1 F24000
G1 X115.623 Y126.153 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.213 J-.097 P1  F30000
G1 X115.21 Y131.315 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5401
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.823 J.897 P1  F30000
G1 X116.278 Y130.257 Z2
G1 Z1.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F5401
G1 X115.834 Y130.701 E.01929
M204 S10000
G1 X115.999 Y130.269 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.164368
G1 F5401
G3 X115.85 Y129.649 I4.97 J-1.521 E.00631
G1 X116.207 Y130.156 F30000
; LINE_WIDTH: 0.0881695
G1 F5401
G1 X116.164 Y130.104 E.00025
; LINE_WIDTH: 0.0961966
G1 X115.985 Y130.03 E.00084
; LINE_WIDTH: 0.134019
G1 X115.806 Y129.956 E.00144
G1 X115.685 Y128.403 F30000
; LINE_WIDTH: 0.143904
G1 F5401
G1 X115.406 Y128.403 E.0023
G1 X115.685 Y128.403 F30000
; LINE_WIDTH: 0.114145
G1 F5401
G1 X115.964 Y128.403 E.00162
G1 X115.828 Y127.279 F30000
; LINE_WIDTH: 0.127507
G1 F5401
G1 X115.845 Y127.183 E.00068
; LINE_WIDTH: 0.158094
G1 X115.863 Y127.086 E.00092
; LINE_WIDTH: 0.155513
G1 X115.882 Y127.024 E.00059
G1 X116.025 Y126.862 E.00199
; LINE_WIDTH: 0.0969205
G1 X116.169 Y126.7 E.00095
G1 X116.969 Y125.299 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5401
G1 X115.824 Y126.444 E.04973
G1 X115.824 Y125.911
G1 X116.436 Y125.299 E.02656
M204 S10000
G1 X117.183 Y125.66 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.41512
G1 F5401
G1 X117.036 Y125.769 E.00557
; LINE_WIDTH: 0.381313
G1 X116.888 Y125.878 E.00506
; LINE_WIDTH: 0.342432
G2 X116.715 Y126.007 I.991 J1.501 E.00527
; LINE_WIDTH: 0.307811
G1 X116.22 Y126.474 E.01468
G1 X117.373 Y125.537 F30000
; LINE_WIDTH: 0.449842
G1 F5401
G1 X117.691 Y125.498 E.01061
; LINE_WIDTH: 0.400382
G1 X118.009 Y125.459 E.00932
; LINE_WIDTH: 0.395482
G3 X118.767 Y125.459 I.379 J27.676 E.02179
; LINE_WIDTH: 0.449842
G1 X119.085 Y125.498 E.01061
; LINE_WIDTH: 0.499301
G1 X119.403 Y125.537 E.0119
G1 X120.629 Y129.105 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5401
G1 X119.089 Y130.645 E.06694
G1 X118.453 Y130.748
G1 X120.743 Y128.458 E.09951
G1 X120.697 Y127.97
G1 X117.956 Y130.711 E.11911
G1 X117.532 Y130.602
G1 X120.575 Y127.559 E.13223
G1 X120.404 Y127.197
G1 X117.183 Y130.418 E.13999
G1 X116.874 Y130.194
G1 X120.186 Y126.881 E.14394
G1 X119.913 Y126.622
G1 X116.598 Y129.937 E.14405
G1 X116.38 Y129.621
M73 P58 R5
G1 X119.606 Y126.395 E.1402
G1 X119.257 Y126.211
G1 X116.206 Y129.262 E.13255
G1 X116.081 Y128.854
G1 X118.836 Y126.099 E.1197
G1 X118.343 Y126.059
G1 X116.03 Y128.371 E.10048
G1 X116.135 Y127.734
G1 X117.713 Y126.155 E.06859
M204 S10000
G1 X117.189 Y126.385 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881709
G1 F5401
G1 X117.061 Y126.48 E.00059
; LINE_WIDTH: 0.14431
G2 X116.371 Y127.201 I2.626 J3.2 E.00826
G1 X119.762 Y126.506 F30000
; LINE_WIDTH: 0.103891
G1 F5401
G2 X119.664 Y126.426 I-.378 J.362 E.00063
G1 X120.361 Y129.669 F30000
; LINE_WIDTH: 0.0881699
G1 F5401
G1 X120.246 Y129.808 E.00067
; LINE_WIDTH: 0.142057
G1 X120.13 Y129.946 E.00146
G1 X119.72 Y130.332 E.00455
; LINE_WIDTH: 0.115482
G1 X119.628 Y130.4 E.00067
G1 X120.065 Y130.719 F30000
; LINE_WIDTH: 0.134476
G1 F5401
G1 X120.206 Y130.56 E.00158
; LINE_WIDTH: 0.0969197
G1 X120.346 Y130.401 E.00093
G1 X119.297 Y130.874 F30000
; LINE_WIDTH: 0.480262
G1 F5401
G1 X119.007 Y130.909 E.01039
; LINE_WIDTH: 0.402921
G3 X118.058 Y130.944 I-.747 J-7.337 E.02787
; LINE_WIDTH: 0.392824
G1 X117.769 Y130.909 E.00831
; LINE_WIDTH: 0.436544
G1 X117.48 Y130.874 E.00935
G1 X124.151 Y130.382 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5401
G1 X123.833 Y130.701 E.01383
G1 X123.3 Y130.701
G1 X123.869 Y130.132 E.02471
G1 X123.64 Y129.827
G1 X122.767 Y130.701 E.03796
G1 X122.233 Y130.701
G1 X123.43 Y129.504 E.05198
G1 X123.283 Y129.118
G1 X121.7 Y130.701 E.06878
G1 X121.167 Y130.701
G1 X123.18 Y128.687 E.08748
G1 X123.136 Y128.198
G1 X120.634 Y130.701 E.10874
G1 X120.532 Y130.269
G1 X123.213 Y127.588 E.11651
G1 X123.79 Y126.478
G1 X121.07 Y129.197 E.11819
G1 X121.179 Y128.555
G1 X124.435 Y125.299 E.14146
G1 X123.901 Y125.299
G1 X121.155 Y128.046 E.11937
G1 X121.067 Y127.601
G1 X123.368 Y125.299 E.1
G1 X122.835 Y125.299
G1 X120.92 Y127.214 E.0832
G1 X120.724 Y126.877
G1 X121.932 Y125.669 E.05251
G1 X121.692 Y125.375
G1 X120.506 Y126.562 E.05155
G1 X120.228 Y126.307
G1 X121.235 Y125.299 E.04377
G1 X120.702 Y125.299
G1 X119.936 Y126.066 E.03329
G1 X119.586 Y125.882
G1 X120.169 Y125.299 E.02531
M204 S10000
G1 X124.522 Y125.716 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.324859
G1 F5401
G2 X124.252 Y125.916 I1.532 J2.342 E.00773
; LINE_WIDTH: 0.280217
G1 X123.725 Y126.413 E.01401
G1 X124.265 Y130.565 F30000
; LINE_WIDTH: 0.0881699
G1 F5401
G1 X124.136 Y130.719 E.00074
G1 X124.493 Y130.628 F30000
; LINE_WIDTH: 0.107332
G1 F5401
G2 X124.635 Y130.699 I.164 J-.151 E.00085
G1 X126.111 Y130.556 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5401
G1 X128.171 Y128.496 E.08951
G1 X128.164 Y127.969
G1 X125.584 Y130.549 E.11212
G1 X125.156 Y130.444
G1 X128.067 Y127.534 E.12646
G1 X127.913 Y127.154
G1 X124.791 Y130.276 E.13567
G1 X124.466 Y130.067
G1 X127.695 Y126.839 E.14029
G1 X127.435 Y126.565
G1 X124.184 Y129.817 E.14128
G1 X123.96 Y129.507
G1 X127.141 Y126.327 E.13822
G1 X126.791 Y126.143
G1 X123.774 Y129.159 E.13108
G1 X123.637 Y128.763
G1 X126.382 Y126.019 E.11926
G1 X125.901 Y125.966
G1 X123.58 Y128.288 E.1009
G1 X123.654 Y127.68
G1 X125.289 Y126.045 E.07107
M204 S10000
G1 X124.799 Y126.241 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881709
G1 F5401
G1 X124.698 Y126.315 E.00046
; LINE_WIDTH: 0.122655
G1 X124.597 Y126.39 E.00082
; LINE_WIDTH: 0.157138
G1 X124.199 Y126.764 E.00508
; LINE_WIDTH: 0.190135
G1 X124.022 Y126.977 E.00331
; LINE_WIDTH: 0.140149
G1 X123.845 Y127.189 E.00219
; LINE_WIDTH: 0.0901636
G1 X123.83 Y127.212 E.00011
; WIPE_START
G1 F24000
G1 X123.845 Y127.189 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.472 J1.122 P1  F30000
G1 X128.091 Y128.975 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.303936
G1 F5401
G1 X127.795 Y129.331 E.00985
; LINE_WIDTH: 0.376805
G3 X127.119 Y130.044 I-3.273 J-2.426 E.02679
; LINE_WIDTH: 0.367784
G1 X126.968 Y130.155 E.00497
; LINE_WIDTH: 0.327281
G1 X126.816 Y130.267 E.00435
; LINE_WIDTH: 0.286779
G1 X126.665 Y130.378 E.00373
; LINE_WIDTH: 0.246277
G1 X126.514 Y130.489 E.00311
G1 X127.141 Y130.699 F30000
; LINE_WIDTH: 0.10359
G1 F5401
G2 X127.283 Y130.628 I-.022 J-.222 E.0008
G1 X130.867 Y130.066 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5401
G1 X130.232 Y130.701 E.02757
G1 X129.699 Y130.701
G1 X130.625 Y129.775 E.04022
G1 X130.407 Y129.459
G1 X129.166 Y130.701 E.05393
G1 X128.633 Y130.701
G1 X130.255 Y129.079 E.07048
G1 X130.138 Y128.662
G1 X128.099 Y130.701 E.0886
G1 X127.588 Y130.679
G1 X130.081 Y128.186 E.10832
M73 P58 R4
G1 X130.151 Y127.582
G1 X128.418 Y129.315 E.07532
G1 X128.607 Y128.593
G1 X130.625 Y126.575 E.08766
M204 S10000
G1 X131.319 Y125.347 F30000
M204 S2000
G1 F5401
G1 X128.622 Y128.045 E.11723
G1 X128.558 Y127.575
G1 X130.834 Y125.299 E.0989
G1 X130.301 Y125.299
G1 X128.411 Y127.189 E.0821
G1 X128.232 Y126.835
G1 X129.767 Y125.299 E.06671
G1 X129.208 Y125.326
G1 X128.015 Y126.519 E.05185
G1 X127.75 Y126.25
G1 X128.701 Y125.299 E.04132
G1 X128.168 Y125.299
G1 X127.467 Y126 E.03043
M204 S10000
G1 X130.099 Y127.367 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119122
G1 F5401
G1 X130.161 Y127.592 E.00145
G1 X128.49 Y129.387 F30000
; LINE_WIDTH: 0.154436
G1 F5401
G1 X128.359 Y129.565 E.00201
; LINE_WIDTH: 0.150404
G1 X128.242 Y129.706 E.0016
; LINE_WIDTH: 0.119287
G1 X128.124 Y129.846 E.00114
G1 X127.444 Y125.281 F30000
; LINE_WIDTH: 0.151687
G1 F5401
G1 X127.285 Y125.866 E.00538
G1 X127.308 Y125.892 E.00031
; LINE_WIDTH: 0.115793
G1 X127.4 Y125.96 E.00068
G1 X131.368 Y125.886 F30000
; LINE_WIDTH: 0.182132
G1 F5401
G1 X131.207 Y125.901 E.00183
; LINE_WIDTH: 0.233057
G1 X131.169 Y125.907 E.0006
G2 X130.707 Y126.344 I3.376 J4.036 E.00987
G1 X130.564 Y126.515 E.00345
G1 X131.612 Y125.774 F30000
; LINE_WIDTH: 0.440843
G1 F5401
G1 X131.745 Y125.481 E.01045
G1 X131.789 Y125.473 E.00143
; LINE_WIDTH: 0.387767
G1 X131.951 Y125.453 E.00459
; LINE_WIDTH: 0.348385
G1 X132.113 Y125.433 E.00407
; LINE_WIDTH: 0.309004
G1 X132.275 Y125.414 E.00354
; LINE_WIDTH: 0.269622
G1 X132.437 Y125.394 E.00302
; LINE_WIDTH: 0.274478
G3 X133.113 Y125.392 I.351 J5.564 E.01276
G3 X133.303 Y125.414 I-.082 J1.581 E.0036
; LINE_WIDTH: 0.348384
G1 X133.465 Y125.433 E.00407
; LINE_WIDTH: 0.387766
G1 X133.627 Y125.453 E.00459
; LINE_WIDTH: 0.427147
G1 X133.789 Y125.473 E.00511
; LINE_WIDTH: 0.437461
G1 X133.833 Y125.481 E.00142
G1 X133.966 Y125.774 E.01036
; WIPE_START
G1 F24000
G1 X133.833 Y125.481 E-.66826
G1 X133.789 Y125.473 E-.09174
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.209 J-.141 P1  F30000
G1 X133.217 Y130.382 Z2
G1 Z1.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5401
G1 X134.999 Y128.6 E.07742
G1 X135.033 Y128.033
G1 X132.646 Y130.42 E.10375
G1 X132.192 Y130.34
G1 X134.961 Y127.572 E.12032
G1 X134.815 Y127.185
G1 X131.805 Y130.194 E.13078
G1 X131.465 Y130.002
G1 X134.608 Y126.858 E.13659
G1 X134.363 Y126.57
G1 X131.182 Y129.751 E.13823
G1 X130.944 Y129.455
G1 X134.08 Y126.32 E.13626
G1 X133.732 Y126.134
G1 X130.746 Y129.12 E.12975
G1 X130.6 Y128.734
G1 X133.336 Y125.998 E.1189
G1 X132.87 Y125.93
G1 X130.538 Y128.262 E.10134
G1 X130.588 Y127.679
G1 X132.278 Y125.989 E.07345
M204 S10000
; WIPE_START
G1 F24000
G1 X130.864 Y127.403 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.217 J-.008 P1  F30000
G1 X130.851 Y129.282 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.116827
G1 F5401
G1 X130.753 Y129.164 E.00093
; WIPE_START
G1 F24000
G1 X130.851 Y129.282 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.069 J1.215 P1  F30000
G1 X134.877 Y129.054 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.17087
G1 F5401
G1 X134.644 Y129.334 E.00379
; LINE_WIDTH: 0.247262
G3 X134.029 Y129.972 I-2.938 J-2.212 E.0148
; LINE_WIDTH: 0.235211
G1 X133.892 Y130.073 E.00267
; LINE_WIDTH: 0.186197
G1 X133.755 Y130.174 E.00199
; LINE_WIDTH: 0.137184
G1 X133.618 Y130.275 E.00131
G1 X134.801 Y127.146 F30000
; LINE_WIDTH: 0.0885291
G1 F5401
G2 X134.706 Y127.027 I-.537 J.333 E.00057
G1 X131.829 Y126.144 F30000
; LINE_WIDTH: 0.0881709
G1 F5401
G1 X131.731 Y126.216 E.00045
; LINE_WIDTH: 0.122413
G1 X131.633 Y126.288 E.00079
; LINE_WIDTH: 0.156655
G1 X131.536 Y126.36 E.00112
; LINE_WIDTH: 0.190897
G1 X131.15 Y126.723 E.00639
; LINE_WIDTH: 0.222921
G1 X130.942 Y126.972 E.00476
; LINE_WIDTH: 0.17441
G1 X130.734 Y127.222 E.00348
G1 X131.423 Y130.502 F30000
; LINE_WIDTH: 0.127638
G1 F5401
G1 X131.58 Y130.61 E.00132
; LINE_WIDTH: 0.158356
G1 X131.738 Y130.719 E.0018
G1 X133.84 Y130.719 F30000
; LINE_WIDTH: 0.127639
G1 F5401
G1 X133.997 Y130.61 E.00132
; LINE_WIDTH: 0.0969209
G1 X134.155 Y130.502 E.00084
G1 X138.231 Y130.701 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5401
G1 X138.921 Y130.011 E.02998
G1 X138.639 Y129.76
G1 X137.698 Y130.701 E.04087
G1 X137.2 Y130.666
G1 X138.408 Y129.457 E.05251
M73 P59 R4
G1 X138.2 Y129.132
G1 X136.982 Y130.35 E.05292
G1 X136.773 Y130.026
G1 X138.053 Y128.746 E.05561
G1 X137.958 Y128.308
G1 X135.565 Y130.701 E.10398
G1 X135.032 Y130.701
G1 X137.932 Y127.8 E.12603
G1 X138.054 Y127.145
G1 X134.499 Y130.701 E.15452
M204 S10000
G1 X135.092 Y129.574 F30000
M204 S2000
G1 F5401
G1 X138.981 Y125.684 E.169
G1 X138.833 Y125.299
G1 X135.435 Y128.697 E.14765
G1 X135.491 Y128.109
G1 X138.3 Y125.299 E.12207
G1 X137.767 Y125.299
G1 X135.433 Y127.633 E.10141
G1 X135.306 Y127.227
G1 X136.572 Y125.961 E.055
G1 X136.354 Y125.646
G1 X135.146 Y126.854 E.05251
G1 X134.928 Y126.538
G1 X136.128 Y125.338 E.05217
G1 X135.633 Y125.299
G1 X134.678 Y126.255 E.04152
G1 X134.395 Y126.004
G1 X135.1 Y125.299 E.03063
M204 S10000
G1 X136.706 Y129.958 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.21116
G1 F5401
G1 X136.574 Y130.064 E.00232
; LINE_WIDTH: 0.19305
G1 X136.543 Y130.129 E.00088
; LINE_WIDTH: 0.240359
G1 X136.512 Y130.194 E.00115
; LINE_WIDTH: 0.287668
G1 X136.509 Y130.215 E.00043
; LINE_WIDTH: 0.336064
G3 X136.463 Y130.297 I-.094 J.001 E.00237
; LINE_WIDTH: 0.364777
G1 X136.287 Y130.508 E.00721
; LINE_WIDTH: 0.392304
G1 X136.111 Y130.719 E.00782
G1 X135.153 Y129.634 F30000
; LINE_WIDTH: 0.231745
G1 F5401
G1 X135.003 Y129.814 E.0036
; LINE_WIDTH: 0.172266
G3 X134.843 Y130.004 I-1.657 J-1.229 E.00262
G1 X134.368 Y130.451 E.00687
G1 X135.421 Y128.683 F30000
; LINE_WIDTH: 0.180928
G1 F5401
G1 X135.47 Y128.831 E.00175
G1 X135.348 Y129.041 E.00274
G1 X137.315 Y125.281 F30000
; LINE_WIDTH: 0.300123
G1 F5401
G1 X137.094 Y125.546 E.00725
; LINE_WIDTH: 0.252683
G1 X136.873 Y125.812 E.00591
; LINE_WIDTH: 0.205242
G1 X136.777 Y125.942 E.00213
; LINE_WIDTH: 0.161978
G1 X136.682 Y126.072 E.00156
G1 X139.236 Y125.662 F30000
; LINE_WIDTH: 0.130449
G1 F5401
G1 X139.358 Y125.578 E.00106
; LINE_WIDTH: 0.163977
G1 X139.48 Y125.494 E.00146
; LINE_WIDTH: 0.197506
G1 X139.602 Y125.409 E.00187
; LINE_WIDTH: 0.196232
G1 X139.666 Y125.374 E.00092
G1 X139.858 Y125.351 E.00242
; LINE_WIDTH: 0.1414
G1 X140.05 Y125.328 E.00155
; LINE_WIDTH: 0.0969202
G1 X140.242 Y125.304 E.00085
G1 X140.906 Y125.304 F30000
; LINE_WIDTH: 0.1414
G1 F5401
G1 X141.152 Y125.334 E.00199
; LINE_WIDTH: 0.18588
G1 X141.399 Y125.364 E.00289
; LINE_WIDTH: 0.23036
G1 X141.646 Y125.394 E.0038
G1 X141.668 Y125.494 F30000
; LINE_WIDTH: 0.130448
G1 F5401
G1 X141.79 Y125.578 E.00106
; LINE_WIDTH: 0.09692
G1 X141.912 Y125.662 E.00065
G1 X141.668 Y125.494 F30000
; LINE_WIDTH: 0.185011
G1 F5401
G2 X141.333 Y125.281 I-1.908 J2.634 E.0046
G1 X142.74 Y128.325 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5401
G1 X140.949 Y130.116 E.0778
G1 X140.389 Y130.143
G1 X142.764 Y127.768 E.10319
G1 X142.683 Y127.316
G1 X139.945 Y130.053 E.11896
G1 X139.567 Y129.898
G1 X142.536 Y126.929 E.12902
G1 X142.32 Y126.612
G1 X139.237 Y129.695 E.134
G1 X138.954 Y129.445
G1 X142.064 Y126.334 E.13517
G1 X141.77 Y126.095
G1 X138.728 Y129.138 E.1322
G1 X138.545 Y128.788
G1 X141.42 Y125.912 E.12497
G1 X141.006 Y125.792
G1 X138.415 Y128.384 E.1126
G1 X138.368 Y127.897
G1 X140.514 Y125.752 E.09325
G1 X139.874 Y125.858
G1 X138.495 Y127.237 E.05993
M204 S10000
; WIPE_START
G1 F24000
G1 X139.874 Y125.858 E-.74115
G1 X139.923 Y125.85 E-.01885
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.894 J.825 P1  F30000
G1 X142.627 Y128.779 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187857
G1 F5401
G1 X142.39 Y129.063 E.00436
; LINE_WIDTH: 0.261746
G3 X141.782 Y129.697 I-2.915 J-2.189 E.01571
; LINE_WIDTH: 0.250499
G1 X141.675 Y129.775 E.00223
; LINE_WIDTH: 0.210761
G1 X141.569 Y129.853 E.00181
; LINE_WIDTH: 0.171023
G1 X141.463 Y129.932 E.00138
; LINE_WIDTH: 0.124148
G3 X141.331 Y130.024 I-.446 J-.495 E.00107
; WIPE_START
G1 F24000
G1 X141.463 Y129.932 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.037 J-.637 P1  F30000
G1 X139.196 Y126.239 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.0938294
G1 F5401
G2 X138.841 Y126.595 I1.291 J1.638 E.00209
G1 X139.205 Y130.493 F30000
; LINE_WIDTH: 0.350572
G1 F5401
G1 X139.601 Y130.566 E.01009
; LINE_WIDTH: 0.311925
G1 X139.76 Y130.585 E.00351
; LINE_WIDTH: 0.273275
G1 X139.919 Y130.604 E.00301
; LINE_WIDTH: 0.234626
G1 X140.078 Y130.624 E.0025
; LINE_WIDTH: 0.195976
G1 X140.237 Y130.643 E.002
; LINE_WIDTH: 0.201662
G2 X140.892 Y130.644 I.337 J-5.392 E.00848
G2 X141.07 Y130.624 I-.081 J-1.483 E.00231
; LINE_WIDTH: 0.273273
G1 X141.229 Y130.604 E.00301
; LINE_WIDTH: 0.311922
G1 X141.388 Y130.585 E.00351
; LINE_WIDTH: 0.35057
G1 X141.547 Y130.566 E.00402
; LINE_WIDTH: 0.36452
G1 X141.943 Y130.493 E.01055
G1 X144.122 Y130.594 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F5401
G1 X144.058 Y130.63 E.00204
G1 X144.107 Y130.658 E.00155
G1 X144.176 Y130.089 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5401
G1 X143.564 Y130.701 E.02657
G1 X143.031 Y130.701
G1 X144.176 Y129.556 E.04974
G1 X144.176 Y129.023
G1 X142.498 Y130.701 E.07291
G1 X142.17 Y130.495
G1 X144.176 Y128.489 E.08717
G1 X144.176 Y127.956
G1 X142.886 Y129.246 E.05606
G1 X143.176 Y128.422
G1 X144.176 Y127.423 E.04344
G1 X144.176 Y126.89
G1 X143.221 Y127.844 E.04147
G1 X143.163 Y127.368
G1 X144.176 Y126.356 E.04398
G1 X144.176 Y125.823
G1 X143.028 Y126.971 E.04988
G1 X142.858 Y126.608
G1 X144.066 Y125.399 E.05251
G1 X143.632 Y125.299
G1 X142.64 Y126.292 E.04313
G1 X142.38 Y126.019
G1 X143.099 Y125.299 E.03127
M204 S10000
G1 X142.946 Y129.307 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231743
G1 F5401
G1 X142.77 Y129.518 E.00423
; LINE_WIDTH: 0.160717
G3 X142.586 Y129.738 I-1.915 J-1.417 E.00276
G1 X142.096 Y130.199 E.00646
G1 X144.06 Y130.5 F30000
; LINE_WIDTH: 0.0965273
G1 F5401
G3 X143.872 Y130.719 I-1.908 J-1.446 E.00126
G1 X142.008 Y125.305 F30000
; LINE_WIDTH: 0.360432
G1 F5401
G1 X142.198 Y125.389 E.00538
; LINE_WIDTH: 0.393648
G1 X142.388 Y125.473 E.00594
; LINE_WIDTH: 0.426865
G1 X142.366 Y125.528 E.00186
; LINE_WIDTH: 0.379555
G1 X142.344 Y125.583 E.00163
; LINE_WIDTH: 0.332245
G1 X142.322 Y125.639 E.0014
; LINE_WIDTH: 0.284934
G1 X142.152 Y125.843 E.00524
G1 X127.073 Y125.512 F30000
; LINE_WIDTH: 0.455941
G1 F5401
G1 X126.799 Y125.479 E.00931
; LINE_WIDTH: 0.405982
G1 X126.524 Y125.446 E.00818
; LINE_WIDTH: 0.356023
G1 X126.25 Y125.412 E.00706
; LINE_WIDTH: 0.302407
G2 X125.526 Y125.412 I-.362 J34.238 E.0153
; LINE_WIDTH: 0.306063
G1 X125.252 Y125.446 E.00593
; LINE_WIDTH: 0.356023
G1 X124.977 Y125.479 E.00706
; LINE_WIDTH: 0.405984
G1 X124.702 Y125.512 E.00818
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.977 Y125.479 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/40
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
G3 Z2 I-.184 J1.203 P1  F30000
G1 X131.684 Y126.506 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2910
G1 X132.077 Y126.299 E.01474
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X130.982 Y127.323 E.01321
G1 X131.012 Y127.243 E.00283
G1 X131.287 Y126.845 E.01605
G1 X131.634 Y126.538 E.01536
G1 X131.874 Y126.85 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2910
G3 X132.595 Y126.575 I.915 J1.319 E.02392
G1 X132.983 Y126.575 E.01194
G1 X133.36 Y126.668 E.01194
G3 X131.826 Y126.885 I-.571 J1.501 E.26031
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17011
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.147
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.1 J-1.213 P1  F30000
G1 X127.723 Y127.342 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2910
G1 X127.885 Y127.769 E.01514
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.159 Y126.338 E.01645
G1 X125.64 Y126.219 E.01645
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.697 Y127.288 E.01577
G1 X127.359 Y127.489 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2910
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.299 Y126.707 E.01231
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.325 Y127.439 E.01046
M204 S10000
; WIPE_START
G1 F24000
G1 X127.501 Y127.863 E-.17443
G1 X127.549 Y128.261 E-.15221
G1 X127.501 Y128.658 E-.15221
G1 X127.359 Y129.033 E-.15221
G1 X127.166 Y129.312 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.097 J-1.213 P1  F30000
G1 X116.286 Y128.443 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2910
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.135 Y130.373 E.01685
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01684
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2910
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X118.995 Y130.004 E.01268
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2910
G1 X138.674 Y128.415 E.0013
G1 X138.617 Y127.947 E.01565
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01564
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
M73 P60 R4
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.064 Y128.319 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2910
G3 X140.386 Y126.397 I1.51 J-.377 E.08103
G1 X140.762 Y126.397 E.01157
G3 X139.08 Y128.377 I-.188 J1.545 E.20601
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16537
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.634 E-.02243
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2910
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2910
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2910
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137576
G1 F2910
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178232
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152592
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145857
G1 F2910
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194794
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184369
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.14104
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969209
G1 X119.539 Y130.418 E.0008
G1 X120.444 Y130.42 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.402087
G1 F2910
G1 X120.308 Y130.183 E.00799
G1 X120.179 Y130.134 E.00404
G1 X119.949 Y130.337 E.00897
G1 X120.014 Y130.437 E.00349
G1 X119.985 Y130.54 E.00311
G1 X120.435 Y130.514 E.01318
G1 X120.438 Y130.48 E.00102
G1 X121.542 Y130.575 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2910
G1 X120.837 Y130.575 E.02338
G2 X120.686 Y129.917 I-2.367 J.197 E.02246
G1 X120.484 Y129.84 E.00718
G1 X124.295 Y126.029 E.17878
G1 X124.221 Y125.425 E.02018
G1 X119.887 Y125.425 E.14379
G1 X119.872 Y125.548 E.00409
G3 X124.437 Y130.168 I-978.533 J971.45 E.21546
G1 X124.362 Y130.575 E.01371
G1 X123.989 Y130.575 E.01237
G1 X124.733 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392056
G1 F2910
G1 X125.044 Y130.545 E.00901
; LINE_WIDTH: 0.347923
G1 X125.226 Y130.567 E.00455
; LINE_WIDTH: 0.303791
G1 X125.408 Y130.589 E.00389
; LINE_WIDTH: 0.259658
G1 X125.589 Y130.611 E.00323
; LINE_WIDTH: 0.267707
G2 X126.368 Y130.589 I.175 J-7.581 E.01428
; LINE_WIDTH: 0.347924
G1 X126.55 Y130.567 E.00455
; LINE_WIDTH: 0.392056
G1 X126.732 Y130.545 E.00521
; LINE_WIDTH: 0.407886
G1 X127.043 Y130.487 E.00942
G1 X129.054 Y130.575 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2910
G1 X127.425 Y130.575 E.05401
G1 X130.568 Y127.432 E.14743
G2 X130.467 Y128.467 I2.263 J.743 E.03478
G1 X127.541 Y125.541 E.13729
G1 X127.555 Y125.425 E.00385
G1 X129.067 Y125.425 E.05017
G1 X127.057 Y125.986 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.488651
G1 F2910
G1 X127.116 Y125.504 E.01764
G1 X126.683 Y125.484 E.01574
; LINE_WIDTH: 0.427118
G2 X125.614 Y125.462 I-.806 J13.227 E.03346
; LINE_WIDTH: 0.40612
G1 X125.297 Y125.48 E.00942
; LINE_WIDTH: 0.476225
G3 X124.66 Y125.504 I-.612 J-8.018 E.02248
G1 X124.719 Y125.986 E.01715
G1 X124.806 Y126.032 E.00348
G1 X125.031 Y125.927 E.00875
; LINE_WIDTH: 0.477927
G1 X125.301 Y125.877 E.00972
; LINE_WIDTH: 0.421998
G1 X125.57 Y125.828 E.00847
G1 X126.162 Y125.825 E.01827
; LINE_WIDTH: 0.40612
G1 X126.453 Y125.876 E.00876
; LINE_WIDTH: 0.460386
G3 X126.97 Y126.032 I-.029 J1.032 E.01856
G1 X127.004 Y126.014 E.00131
G1 X131.715 Y126 F30000
; LINE_WIDTH: 0.484484
G1 F2910
G1 X131.952 Y125.898 E.00928
; LINE_WIDTH: 0.458242
G1 X132.216 Y125.849 E.00907
; LINE_WIDTH: 0.40356
G1 X132.479 Y125.801 E.00788
G1 X133.057 Y125.799 E.01696
; LINE_WIDTH: 0.388164
G1 X133.341 Y125.848 E.00813
; LINE_WIDTH: 0.423203
G1 X133.626 Y125.898 E.00895
; LINE_WIDTH: 0.476974
G1 X133.862 Y126 E.00912
G3 X134.185 Y125.69 I5.328 J5.217 E.01582
G1 X134.129 Y125.501 E.00696
; LINE_WIDTH: 0.484465
G1 X133.635 Y125.479 E.01781
; LINE_WIDTH: 0.438859
G1 X133.14 Y125.456 E.01597
; LINE_WIDTH: 0.393253
G1 X132.521 Y125.453 E.01767
; LINE_WIDTH: 0.388164
G1 X132.212 Y125.471 E.00872
; LINE_WIDTH: 0.423203
G1 X131.902 Y125.488 E.00961
; LINE_WIDTH: 0.472986
G1 X131.447 Y125.501 E.01598
G1 X131.392 Y125.69 E.00687
G2 X131.671 Y125.959 I5.764 J-5.697 E.01362
G1 X134.211 Y126.288 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2910
G1 X134.507 Y126.041 E.01279
G1 X134.658 Y125.637 E.0143
G1 X134.561 Y125.425 E.00771
G1 X135.101 Y125.425 E.01792
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X136.73 Y130.575 E.05401
G1 X139.248 Y130.022 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.485104
G1 F2910
G1 X139.161 Y130.498 E.01745
G1 X140.047 Y130.498 E.03194
G1 X140.067 Y130.269 E.0083
G1 X139.702 Y130.172 E.01361
G1 X139.335 Y129.98 E.0149
G1 X139.302 Y129.996 E.00132
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.128676
G1 F2910
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166311
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203945
G1 X140.574 Y130.719 E.00248
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.103205
G1 F2910
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
; WIPE_START
G1 F24000
G1 X140.574 Y130.137 E-.62133
G1 X140.574 Y130.152 E-.13867
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.21 J.133 P1  F30000
G1 X141.049 Y125.827 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.429334
G1 F2910
G1 X140.978 Y125.737 E.00364
; LINE_WIDTH: 0.464642
G1 X140.906 Y125.646 E.00397
; LINE_WIDTH: 0.499951
G1 X140.834 Y125.555 E.00431
; LINE_WIDTH: 0.562538
G1 X140.822 Y125.541 E.0008
G1 X140.326 Y125.541 E.021
G1 X140.313 Y125.555 E.0008
; LINE_WIDTH: 0.535248
G1 X140.242 Y125.646 E.00464
; LINE_WIDTH: 0.499941
G1 X140.17 Y125.737 E.00431
; LINE_WIDTH: 0.464633
G1 X140.098 Y125.827 E.00397
G1 X139.172 Y125.879 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373124
G1 F2910
G1 X139.333 Y125.99 E.00527
G1 X139.57 Y125.866 E.00718
G1 X139.465 Y125.76 E.00402
G1 X139.49 Y125.62 E.00383
G1 X139.608 Y125.451 E.00552
G1 X139.205 Y125.451 E.01084
G2 X139.118 Y125.655 I.268 J.234 E.00605
G1 X139.189 Y125.821 E.00487
G1 X143.241 Y126.213 F30000
; LINE_WIDTH: 0.499002
G1 F2910
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.54933
G1 F2910
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2910
G2 X143.629 Y130.154 I.986 J-149.825 E.04448
G2 X143.629 Y126.63 I-438.369 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F2910
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
G1 X134.114 Y130.332 F30000
; LINE_WIDTH: 0.550302
G1 F2910
G1 X134.126 Y130.401 E.00289
G1 X133.671 Y130.473 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.4826
G1 F2910
G1 X133.384 Y130.508 E.01034
; LINE_WIDTH: 0.407221
G3 X132.48 Y130.542 I-.713 J-6.759 E.02689
; LINE_WIDTH: 0.396834
G1 X132.194 Y130.508 E.00832
; LINE_WIDTH: 0.439718
G1 X131.907 Y130.473 E.00933
G1 X131.442 Y130.46 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.561188
G1 F2910
G1 X131.454 Y130.391 E.00295
; WIPE_START
G1 F24000
G1 X131.442 Y130.46 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.424 J-1.141 P1  F30000
G1 X119.38 Y125.978 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.508056
G1 F2910
G1 X119.437 Y125.513 E.01773
G1 X118.767 Y125.489 E.0254
; LINE_WIDTH: 0.456006
G2 X117.602 Y125.513 I-.374 J9.83 E.03926
; LINE_WIDTH: 0.508057
G1 X117.339 Y125.513 E.00995
G1 X117.396 Y125.978 E.01773
G1 X117.495 Y126.012 E.00397
G1 X118.059 Y125.898 E.0218
; LINE_WIDTH: 0.455576
G1 X118.668 Y125.895 E.02048
G1 X119.281 Y126.012 E.021
; LINE_WIDTH: 0.508056
G1 X119.324 Y125.997 E.0017
G1 X116.571 Y126.305 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2910
G1 X116.758 Y126.589 E.01127
G3 X117.117 Y126.315 I.734 J.593 E.01513
G1 X116.987 Y126.225 E.00527
G1 X116.926 Y125.723 E.01679
G1 X116.382 Y126.266 E.02548
G1 X116.321 Y126.211 E.00274
G1 X115.95 Y126.233 E.0123
M73 P61 R4
G1 X115.95 Y125.425 E.0268
G1 X116.317 Y125.425 E.01217
G1 X116.452 Y126.834 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.405682
G1 F2910
G1 X116.388 Y126.713 E.00405
G1 X116.102 Y126.61 E.00899
G1 X115.987 Y126.677 E.00395
G1 X115.987 Y126.974 E.00878
G1 X116.314 Y127.034 E.00984
G1 X116.418 Y126.884 E.00539
G1 X116.056 Y127.378 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.466032
G1 F2910
G1 X116.018 Y127.583 E.00719
; LINE_WIDTH: 0.42308
G2 X115.975 Y127.83 I2.033 J.479 E.00776
; LINE_WIDTH: 0.382299
G1 X115.958 Y128.108 E.00772
; LINE_WIDTH: 0.345048
G2 X115.942 Y128.42 I2.565 J.295 E.00768
; LINE_WIDTH: 0.314882
G1 X115.958 Y128.698 E.00619
; LINE_WIDTH: 0.352988
G2 X115.98 Y129.018 I2.638 J-.02 E.00811
; LINE_WIDTH: 0.392427
G1 X116.018 Y129.224 E.00594
; LINE_WIDTH: 0.429229
G1 X116.056 Y129.429 E.00657
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.018 Y129.224 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/40
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
G3 Z2.2 I.206 J1.199 P1  F30000
G1 X131.62 Y126.55 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2918
G1 X131.649 Y126.524 E.0013
G1 X132.077 Y126.299 E.01605
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.874 Y126.85 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2918
G3 X132.595 Y126.575 I.915 J1.319 E.02392
G1 X132.983 Y126.575 E.01194
G1 X133.36 Y126.668 E.01194
G3 X131.826 Y126.885 I-.571 J1.501 E.26031
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17011
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.147
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.074 J-1.215 P1  F30000
G1 X125.197 Y126.328 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2918
G1 X125.64 Y126.219 E.01514
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.704 Y130.138 E.01318
G1 X126.617 Y130.184 E.00327
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.032 Y127.397 E.01318
G1 X124.067 Y127.305 E.00327
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01644
G1 X124.807 Y126.522 E.00327
G1 X125.14 Y126.347 E.0125
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2918
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.522 Y129.791 E.01074
G1 X126.088 Y129.91 E.01383
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.399 Y127.536 E.01074
G1 X124.644 Y127.159 E.01383
G1 X124.989 Y126.87 E.01383
G1 X125.246 Y126.735 E.0089
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.442 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2918
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.135 Y130.373 E.01685
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.331 Y128.809 E.0033
G1 X116.294 Y128.502 E.01025
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2918
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X118.995 Y130.004 E.01268
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.72 Y128.761 E.01423
G1 X116.684 Y128.463 E.00924
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.088 J1.214 P1  F30000
G1 X138.67 Y128.376 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2918
G1 X138.617 Y127.947 E.01434
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.682 Y128.435 E.01496
G1 X139.064 Y128.319 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2918
G3 X140.386 Y126.397 I1.51 J-.377 E.08104
G1 X140.762 Y126.397 E.01157
G3 X139.079 Y128.377 I-.188 J1.545 E.20604
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16538
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.634 E-.02242
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2918
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2918
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2918
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137579
G1 F2918
G1 X117.387 Y130.521 E.00141
; LINE_WIDTH: 0.178237
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152594
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2918
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184368
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.14104
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.096921
G1 X119.539 Y130.418 E.0008
G1 X120.444 Y130.42 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.402086
G1 F2918
G1 X120.308 Y130.183 E.00799
G1 X120.179 Y130.134 E.00404
G1 X119.949 Y130.337 E.00897
G1 X120.014 Y130.437 E.00349
G1 X119.985 Y130.54 E.00311
G1 X120.435 Y130.514 E.01318
G1 X120.438 Y130.48 E.00102
G1 X121.542 Y130.575 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2918
G1 X120.837 Y130.575 E.02338
G2 X120.686 Y129.917 I-2.367 J.197 E.02246
G1 X120.484 Y129.84 E.00718
G1 X124.295 Y126.029 E.17878
G1 X124.221 Y125.425 E.02018
G1 X119.887 Y125.425 E.14379
G1 X119.872 Y125.548 E.00409
G3 X124.437 Y130.168 I-979.469 J972.374 E.21546
G1 X124.362 Y130.575 E.01371
G1 X123.989 Y130.575 E.01237
G1 X124.733 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392058
G1 F2918
G1 X125.044 Y130.545 E.00901
; LINE_WIDTH: 0.347925
G1 X125.226 Y130.567 E.00455
; LINE_WIDTH: 0.303792
G1 X125.408 Y130.589 E.00389
; LINE_WIDTH: 0.259658
G1 X125.589 Y130.611 E.00323
; LINE_WIDTH: 0.267707
G2 X126.368 Y130.589 I.175 J-7.581 E.01428
; LINE_WIDTH: 0.347922
G1 X126.55 Y130.567 E.00455
; LINE_WIDTH: 0.392054
M73 P62 R4
G1 X126.732 Y130.545 E.00521
; LINE_WIDTH: 0.407884
G1 X127.043 Y130.487 E.00942
G1 X129.054 Y130.575 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2918
G1 X127.425 Y130.575 E.05401
G1 X130.568 Y127.432 E.14743
G2 X130.467 Y128.467 I2.263 J.743 E.03478
G1 X127.541 Y125.541 E.13729
G1 X127.555 Y125.425 E.00385
G1 X129.067 Y125.425 E.05017
G1 X127.057 Y125.986 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.488651
G1 F2918
G1 X127.116 Y125.504 E.01764
G1 X126.683 Y125.484 E.01574
; LINE_WIDTH: 0.427118
G2 X125.614 Y125.462 I-.806 J13.227 E.03346
; LINE_WIDTH: 0.40612
G1 X125.297 Y125.48 E.00942
; LINE_WIDTH: 0.476225
G3 X124.66 Y125.504 I-.612 J-8.018 E.02248
G1 X124.719 Y125.986 E.01715
G1 X124.806 Y126.032 E.00348
G1 X125.031 Y125.927 E.00875
; LINE_WIDTH: 0.477927
G1 X125.301 Y125.877 E.00972
; LINE_WIDTH: 0.421998
G1 X125.57 Y125.828 E.00847
G1 X126.162 Y125.825 E.01827
; LINE_WIDTH: 0.40612
G1 X126.453 Y125.876 E.00876
; LINE_WIDTH: 0.460386
G3 X126.97 Y126.032 I-.029 J1.032 E.01856
G1 X127.004 Y126.014 E.00131
G1 X131.715 Y126 F30000
; LINE_WIDTH: 0.484484
G1 F2918
G1 X131.952 Y125.898 E.00928
; LINE_WIDTH: 0.458242
G1 X132.216 Y125.849 E.00907
; LINE_WIDTH: 0.40356
G1 X132.479 Y125.801 E.00788
G1 X133.057 Y125.799 E.01696
; LINE_WIDTH: 0.388164
G1 X133.341 Y125.848 E.00813
; LINE_WIDTH: 0.423203
G1 X133.626 Y125.898 E.00895
; LINE_WIDTH: 0.476974
G1 X133.862 Y126 E.00912
G3 X134.185 Y125.69 I5.328 J5.217 E.01582
G1 X134.129 Y125.501 E.00696
; LINE_WIDTH: 0.484465
G1 X133.635 Y125.479 E.01781
; LINE_WIDTH: 0.438859
G1 X133.14 Y125.456 E.01597
; LINE_WIDTH: 0.393253
G1 X132.521 Y125.453 E.01767
; LINE_WIDTH: 0.388164
G1 X132.212 Y125.471 E.00872
; LINE_WIDTH: 0.423203
G1 X131.902 Y125.488 E.00961
; LINE_WIDTH: 0.472986
G1 X131.447 Y125.501 E.01598
G1 X131.392 Y125.69 E.00687
G2 X131.671 Y125.959 I5.764 J-5.697 E.01362
G1 X134.211 Y126.288 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2918
G1 X134.507 Y126.041 E.01279
G1 X134.658 Y125.637 E.0143
G1 X134.561 Y125.425 E.00771
G1 X135.101 Y125.425 E.01792
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X136.73 Y130.575 E.05401
G1 X139.248 Y130.022 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.485104
G1 F2918
G1 X139.161 Y130.498 E.01745
G1 X140.047 Y130.498 E.03194
G1 X140.067 Y130.269 E.0083
G1 X139.702 Y130.172 E.01361
G1 X139.335 Y129.98 E.0149
G1 X139.302 Y129.996 E.00132
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.128678
G1 F2918
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166311
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203944
G1 X140.574 Y130.719 E.00248
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.103205
G1 F2918
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
; WIPE_START
G1 F24000
G1 X140.574 Y130.137 E-.62135
G1 X140.574 Y130.152 E-.13865
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.21 J.133 P1  F30000
G1 X141.049 Y125.827 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.429341
G1 F2918
G1 X140.978 Y125.737 E.00364
; LINE_WIDTH: 0.46465
G1 X140.906 Y125.646 E.00397
; LINE_WIDTH: 0.499958
G1 X140.834 Y125.555 E.00431
; LINE_WIDTH: 0.562538
G1 X140.822 Y125.541 E.0008
G1 X140.326 Y125.541 E.021
G1 X140.313 Y125.555 E.0008
; LINE_WIDTH: 0.535258
G1 X140.242 Y125.646 E.00464
; LINE_WIDTH: 0.49995
G1 X140.17 Y125.737 E.00431
; LINE_WIDTH: 0.464642
G1 X140.098 Y125.827 E.00397
G1 X139.172 Y125.879 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.373121
G1 F2918
G1 X139.333 Y125.99 E.00527
G1 X139.57 Y125.866 E.00718
G1 X139.465 Y125.76 E.00402
G1 X139.49 Y125.62 E.00383
G1 X139.608 Y125.451 E.00552
G1 X139.205 Y125.451 E.01084
G2 X139.118 Y125.655 I.268 J.234 E.00605
G1 X139.189 Y125.821 E.00487
G1 X143.241 Y126.213 F30000
; LINE_WIDTH: 0.499002
G1 F2918
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2918
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2918
G2 X143.629 Y130.154 I.986 J-149.518 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F2918
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.559 Y125.469 E.07517
G1 X141.681 Y125.735 E.00898
G1 X141.621 Y125.86 E.00426
G1 X141.927 Y126.027 E.01071
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
G1 X134.114 Y130.332 F30000
; LINE_WIDTH: 0.550298
G1 F2918
G1 X134.126 Y130.401 E.00289
G1 X133.671 Y130.473 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482602
G1 F2918
G1 X133.384 Y130.508 E.01034
; LINE_WIDTH: 0.407222
G3 X132.48 Y130.542 I-.713 J-6.759 E.02689
; LINE_WIDTH: 0.396834
G1 X132.194 Y130.508 E.00832
; LINE_WIDTH: 0.439718
G1 X131.907 Y130.473 E.00933
G1 X131.442 Y130.46 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.56119
G1 F2918
G1 X131.454 Y130.391 E.00295
; WIPE_START
G1 F24000
G1 X131.442 Y130.46 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.424 J-1.141 P1  F30000
G1 X119.38 Y125.978 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.508056
G1 F2918
G1 X119.437 Y125.513 E.01773
G1 X118.767 Y125.489 E.0254
; LINE_WIDTH: 0.456006
G2 X117.602 Y125.513 I-.374 J9.83 E.03926
; LINE_WIDTH: 0.508057
G1 X117.339 Y125.513 E.00995
G1 X117.396 Y125.978 E.01773
G1 X117.495 Y126.012 E.00397
G1 X118.059 Y125.898 E.0218
; LINE_WIDTH: 0.455576
G1 X118.668 Y125.895 E.02048
G1 X119.281 Y126.012 E.021
; LINE_WIDTH: 0.508056
G1 X119.324 Y125.997 E.0017
G1 X116.571 Y126.305 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2918
G1 X116.758 Y126.589 E.01127
G3 X117.117 Y126.315 I.735 J.593 E.01513
G1 X116.987 Y126.225 E.00527
G1 X116.926 Y125.723 E.01679
G1 X116.382 Y126.266 E.02548
G1 X116.321 Y126.211 E.00274
G1 X115.95 Y126.233 E.0123
G1 X115.95 Y125.425 E.0268
G1 X116.317 Y125.425 E.01217
G1 X116.452 Y126.834 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.405683
G1 F2918
G1 X116.388 Y126.713 E.00405
G1 X116.102 Y126.61 E.00899
G1 X115.987 Y126.677 E.00395
G1 X115.987 Y126.974 E.00878
G1 X116.314 Y127.034 E.00984
G1 X116.418 Y126.884 E.00539
G1 X116.056 Y127.378 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.46603
G1 F2918
G1 X116.018 Y127.583 E.00719
; LINE_WIDTH: 0.423078
G2 X115.975 Y127.83 I2.033 J.479 E.00776
; LINE_WIDTH: 0.382297
G1 X115.958 Y128.108 E.00772
; LINE_WIDTH: 0.345047
G2 X115.942 Y128.42 I2.566 J.295 E.00768
; LINE_WIDTH: 0.314884
G1 X115.958 Y128.698 E.00619
; LINE_WIDTH: 0.352986
G2 X115.98 Y129.018 I2.637 J-.02 E.00811
; LINE_WIDTH: 0.392423
G1 X116.018 Y129.224 E.00594
; LINE_WIDTH: 0.429227
G1 X116.056 Y129.429 E.00657
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.018 Y129.224 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/40
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
G3 Z2.4 I.206 J1.199 P1  F30000
G1 X131.62 Y126.55 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2793
G1 X131.649 Y126.524 E.0013
G1 X132.077 Y126.299 E.01605
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.973 Y129.005 E.00365
G1 X130.841 Y128.655 E.0124
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X130.973 Y127.345 E.0124
G1 X131.012 Y127.243 E.00365
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.874 Y126.85 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2793
G3 X132.595 Y126.575 I.915 J1.319 E.02393
G1 X132.983 Y126.575 E.01194
G3 X131.826 Y126.885 I-.194 J1.594 E.27225
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17013
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14698
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.074 J-1.215 P1  F30000
G1 X125.197 Y126.328 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2793
G1 X125.64 Y126.219 E.01514
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.716 Y130.132 E.01276
G1 X126.617 Y130.184 E.00369
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X124.818 Y126.517 E.00369
G1 X125.141 Y126.347 E.01208
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2793
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.533 Y129.785 E.01035
G1 X126.477 Y129.814 E.00196
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.267 Y128.595 E.00196
G1 X124.226 Y128.261 E.01035
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125 Y126.864 E.00196
G1 X125.246 Y126.735 E.00851
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.139 J-1.209 P1  F30000
G1 X116.286 Y128.364 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2793
G1 X116.343 Y127.899 E.01554
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.291 Y126.617 E.00373
G1 X117.641 Y126.434 E.01311
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.235 Y130.321 E.01311
G1 X119.135 Y130.373 E.00373
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.284 Y128.424 E.01617
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2793
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.473 Y126.965 E.002
G1 X117.781 Y126.803 E.01068
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.053 Y129.973 E.01068
G1 X118.995 Y130.004 E.002
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.718 Y128.748 E.002
G1 X116.684 Y128.463 E.00884
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.473 Y126.965 E-.02468
G1 X117.674 Y126.859 E-.08594
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2793
G1 X138.674 Y128.415 E.0013
G1 X138.661 Y128.307 E.0036
G1 X138.617 Y127.947 E.01204
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.065 Y128.319 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2793
G3 X140.386 Y126.397 I1.509 J-.378 E.081
G1 X140.762 Y126.397 E.01157
G1 X141.128 Y126.487 E.01157
G3 X139.081 Y128.377 I-.553 J1.454 E.19436
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16533
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.634 E-.02247
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2793
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2793
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2793
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137578
G1 F2793
G1 X117.387 Y130.521 E.00141
; LINE_WIDTH: 0.178236
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152593
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2793
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184377
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141045
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.096921
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429225
G1 F2793
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.39242
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352985
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423078
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2793
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
M73 P63 R4
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I1.535 J-.833 E.028
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407884
G1 F2793
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392054
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347922
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267707
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347926
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439718
G1 F2793
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2793
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I2.184 J-.821 E.04876
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F2793
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.128678
G1 F2793
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203945
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.211 J-.122 P1  F30000
G1 X140.098 Y125.827 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.464642
G1 F2793
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562538
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499955
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464646
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429336
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2793
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2793
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2793
G2 X143.629 Y130.154 I.986 J-149.519 E.04448
G2 X143.629 Y126.63 I-438.369 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.044 Y130.235 F30000
; LINE_WIDTH: 0.419999
G1 F2793
G1 X141.059 Y130.531 E.00909
G1 X144.006 Y130.531 E.09055
G1 X144.006 Y125.469 E.15553
G1 X141.553 Y125.469 E.07536
G1 X141.692 Y125.731 E.00912
G1 X141.627 Y125.863 E.00453
G1 X141.927 Y126.027 E.0105
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.102 Y130.22 E.01034
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12787
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.644 Y129.048 E-.20179
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/40
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
G3 Z2.6 I.275 J-1.185 P1  F30000
G1 X131.684 Y126.506 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2814
G1 X132.077 Y126.299 E.01474
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.969 Y128.993 E.00405
G1 X130.841 Y128.655 E.01199
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X130.969 Y127.357 E.01199
G1 X131.012 Y127.243 E.00405
G1 X131.287 Y126.845 E.01605
G1 X131.634 Y126.538 E.01536
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2814
G1 X132.217 Y126.668 E.01194
G1 X132.595 Y126.575 E.01194
G3 X131.825 Y126.884 I.194 J1.6 E.28536
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.07 J-1.215 P1  F30000
G1 X125.124 Y126.356 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2814
G1 X125.159 Y126.338 E.00131
G1 X125.64 Y126.219 E.01645
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.023 Y127.421 E.01233
G1 X124.067 Y127.305 E.00411
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.071 Y126.384 E.01315
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2814
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.887 Y129.578 E.00235
G1 X124.644 Y129.363 E.00996
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.39 Y127.56 E.00996
G1 X124.417 Y127.489 E.00235
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
M73 P64 R4
G1 X125.012 Y126.858 E.00235
G1 X125.246 Y126.735 E.00812
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2814
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.303 Y126.611 E.00417
G1 X117.641 Y126.434 E.01268
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.246 Y130.314 E.01268
G1 X119.135 Y130.373 E.00417
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2814
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.064 Y129.967 E.01028
G1 X118.995 Y130.004 E.0024
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2814
G1 X138.674 Y128.415 E.0013
G1 X138.617 Y127.947 E.01565
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2814
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G1 X140.762 Y126.397 E.01157
G1 X141.128 Y126.487 E.01157
G3 X139.073 Y128.379 I-.554 J1.46 E.19528
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2814
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2814
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2814
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137579
G1 F2814
G1 X117.387 Y130.521 E.00141
; LINE_WIDTH: 0.178237
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152594
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2814
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184371
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141041
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.096921
G1 X119.539 Y130.418 E.0008
G1 X120.211 Y130.159 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49884
G1 F2814
G1 X120.328 Y130.041 E.00617
; WIPE_START
G1 F24000
G1 X120.211 Y130.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.211 J-1.199 P1  F30000
G1 X116.056 Y129.429 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429222
G1 F2814
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392416
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352982
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423076
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.466029
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2814
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I1.535 J-.833 E.028
G1 X124.362 Y130.575 E.01371
G1 X120.392 Y130.575 E.1317
G1 X120.804 Y130.21 E.01824
G1 X120.83 Y129.78 E.0143
G1 X120.696 Y129.628 E.00671
G1 X124.899 Y125.425 E.19717
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407888
G1 F2814
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392058
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347925
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347925
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439718
G1 F2814
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2814
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.128678
G1 F2814
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203945
G1 X140.574 Y130.719 E.00248
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.103205
G1 F2814
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
; WIPE_START
G1 F24000
G1 X140.574 Y130.137 E-.62134
G1 X140.574 Y130.152 E-.13866
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.21 J.133 P1  F30000
G1 X141.049 Y125.827 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.429344
G1 F2814
G1 X140.978 Y125.737 E.00364
; LINE_WIDTH: 0.464653
G1 X140.906 Y125.646 E.00397
; LINE_WIDTH: 0.499962
G1 X140.834 Y125.555 E.00431
; LINE_WIDTH: 0.562539
G1 X140.822 Y125.541 E.0008
G1 X140.326 Y125.541 E.021
G1 X140.313 Y125.555 E.0008
; LINE_WIDTH: 0.535258
G1 X140.242 Y125.646 E.00464
; LINE_WIDTH: 0.49995
G1 X140.17 Y125.737 E.00431
; LINE_WIDTH: 0.464642
G1 X140.098 Y125.827 E.00397
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2814
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2814
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2814
G2 X143.629 Y130.154 I.986 J-149.52 E.04448
G2 X143.629 Y126.63 I-438.367 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
M73 P65 R4
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.044 Y130.235 F30000
; LINE_WIDTH: 0.419999
G1 F2814
G1 X141.059 Y130.531 E.00909
G1 X144.006 Y130.531 E.09055
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.102 Y130.22 E.01034
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12787
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.644 Y129.048 E-.20179
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/40
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
G3 Z2.8 I.275 J-1.185 P1  F30000
G1 X131.684 Y126.506 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X132.077 Y126.299 E.01474
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.634 Y126.538 E.01536
G1 X131.874 Y126.85 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X132.595 Y126.575 I.915 J1.32 E.02393
G1 X132.983 Y126.575 E.01194
G3 X131.826 Y126.885 I-.194 J1.594 E.27227
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17013
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14698
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.074 J-1.215 P1  F30000
G1 X125.197 Y126.328 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X125.64 Y126.219 E.01514
G1 X126.136 Y126.219 E.01645
G1 X126.269 Y126.252 E.00453
G1 X126.617 Y126.338 E.01191
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X124.841 Y126.505 E.00453
G1 X125.141 Y126.347 E.01123
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.175 Y126.633 E.00274
G1 X126.477 Y126.707 E.00957
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.023 Y126.852 E.00274
G1 X125.246 Y126.735 E.00773
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.175 Y126.633 E-.03384
G1 X126.477 Y126.707 E-.11837
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.258 Y130.308 E.01224
G1 X119.135 Y130.373 E.00461
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01354
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.076 Y129.961 E.00987
G1 X118.995 Y130.004 E.0028
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.088 J1.214 P1  F30000
G1 X138.67 Y128.376 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X138.617 Y127.947 E.01434
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.682 Y128.435 E.01496
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G1 X140.762 Y126.397 E.01157
G3 X139.073 Y128.379 I-.188 J1.55 E.20687
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522986
G1 F2792
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137576
G1 F2792
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178233
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152592
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145857
G1 F2792
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194794
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184371
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141041
G2 X119.389 Y130.521 I-.836 J-1.401 E.00159
; LINE_WIDTH: 0.096921
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
G1 F2792
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392414
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352981
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423076
G3 X116.018 Y127.583 I2.075 J.232 E.00776
; LINE_WIDTH: 0.466029
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I1.535 J-.833 E.028
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
M73 P66 R4
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.40789
G1 F2792
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.39206
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347926
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347926
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439719
G1 F2792
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F2792
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.128678
G1 F2792
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166313
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203947
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.211 J.122 P1  F30000
G1 X141.049 Y125.827 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.42934
G1 F2792
G1 X140.978 Y125.737 E.00364
; LINE_WIDTH: 0.464649
G1 X140.906 Y125.646 E.00397
; LINE_WIDTH: 0.499957
G1 X140.834 Y125.555 E.00431
; LINE_WIDTH: 0.562538
G1 X140.822 Y125.541 E.0008
G1 X140.326 Y125.541 E.021
G1 X140.313 Y125.555 E.0008
; LINE_WIDTH: 0.535264
G1 X140.242 Y125.646 E.00464
; LINE_WIDTH: 0.499955
G1 X140.17 Y125.737 E.00431
; LINE_WIDTH: 0.464646
G1 X140.098 Y125.827 E.00397
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2792
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2792
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2792
G2 X143.629 Y130.154 I.986 J-149.459 E.04448
G2 X143.629 Y126.63 I-438.367 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F2792
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12427
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.65 Y129.04 E-.2054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/40
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
G3 Z3 I.274 J-1.186 P1  F30000
G1 X131.684 Y126.506 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X131.779 Y126.456 E.00356
G1 X132.077 Y126.299 E.01118
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.634 Y126.538 E.01536
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X132.217 Y126.668 E.01194
G1 X132.595 Y126.575 E.01194
G3 X131.825 Y126.884 I.194 J1.6 E.28536
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.07 J-1.215 P1  F30000
G1 X125.124 Y126.356 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X125.159 Y126.338 E.00131
G1 X125.64 Y126.219 E.01645
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.608 Y129.854 E.00496
G1 X124.349 Y129.624 E.01149
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.071 Y126.384 E.01315
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.868 Y129.561 E.00313
G1 X124.644 Y129.363 E.00918
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.034 Y126.846 E.00313
G1 X125.246 Y126.735 E.00734
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.27 Y130.302 E.0118
G1 X119.135 Y130.373 E.00504
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X118.995 Y130.004 E.01268
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
M73 P66 R3
G1 E-.04 F1800
G17
G3 Z3.2 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X138.674 Y128.415 E.0013
G1 X138.617 Y127.947 E.01565
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.065 Y128.319 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X140.386 Y126.397 I1.509 J-.378 E.08102
G1 X140.762 Y126.397 E.01157
G3 X139.08 Y128.377 I-.188 J1.544 E.20593
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16535
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.634 E-.02245
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2792
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F2792
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178235
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152592
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2792
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184371
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141041
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.096921
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
G1 F2792
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392416
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352982
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423078
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
M73 P67 R3
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I2.208 J-1.446 E.02785
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407888
G1 F2792
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392058
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347925
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347926
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439718
G1 F2792
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103206
G1 F2792
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.128678
G1 F2792
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203947
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.211 J.122 P1  F30000
G1 X141.049 Y125.827 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.429334
G1 F2792
G1 X140.978 Y125.737 E.00364
; LINE_WIDTH: 0.464642
G1 X140.906 Y125.646 E.00397
; LINE_WIDTH: 0.49995
G1 X140.834 Y125.555 E.00431
; LINE_WIDTH: 0.562538
G1 X140.822 Y125.541 E.0008
G1 X140.326 Y125.541 E.021
G1 X140.313 Y125.555 E.0008
; LINE_WIDTH: 0.535266
G1 X140.242 Y125.646 E.00464
; LINE_WIDTH: 0.499957
G1 X140.17 Y125.737 E.00431
; LINE_WIDTH: 0.464648
G1 X140.098 Y125.827 E.00397
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2792
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2792
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2792
G2 X143.629 Y130.154 I.986 J-149.671 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F2792
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.553 Y125.469 E.07536
G1 X141.692 Y125.731 E.00912
G1 X141.627 Y125.863 E.00453
G1 X141.927 Y126.027 E.0105
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12427
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.65 Y129.04 E-.2054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/40
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
G3 Z3.2 I.268 J-1.187 P1  F30000
G1 X131.62 Y126.55 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X131.649 Y126.524 E.0013
G1 X132.077 Y126.299 E.01605
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.874 Y126.85 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X132.595 Y126.575 I.915 J1.319 E.02393
G1 X132.983 Y126.575 E.01194
G3 X131.826 Y126.885 I-.194 J1.594 E.27225
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17012
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14698
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.074 J-1.215 P1  F30000
G1 X125.197 Y126.328 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X125.64 Y126.219 E.01514
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.141 Y126.347 E.01577
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
M73 P68 R3
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.261 Y128.545 E.00352
G1 X124.226 Y128.261 E.00879
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.246 Y126.735 E.01046
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.281 Y130.296 E.01137
G1 X119.135 Y130.373 E.00548
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.099 Y129.949 E.00907
G1 X118.995 Y130.004 E.00361
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X138.674 Y128.415 E.0013
G1 X138.617 Y127.947 E.01565
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G1 X140.762 Y126.397 E.01157
G3 X139.073 Y128.379 I-.188 J1.55 E.20688
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2792
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F2792
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178235
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152592
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145857
G1 F2792
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194794
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184368
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141039
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969194
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
G1 F2792
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392416
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352982
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423078
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I1.535 J-.833 E.028
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.40789
G1 F2792
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.39206
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347926
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347926
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439719
G1 F2792
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F2792
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.128678
G1 F2792
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203945
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.211 J.122 P1  F30000
G1 X141.049 Y125.827 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.429342
G1 F2792
G1 X140.978 Y125.737 E.00364
; LINE_WIDTH: 0.464651
G1 X140.906 Y125.646 E.00397
; LINE_WIDTH: 0.499959
G1 X140.834 Y125.555 E.00431
; LINE_WIDTH: 0.562538
G1 X140.822 Y125.541 E.0008
G1 X140.326 Y125.541 E.021
G1 X140.313 Y125.555 E.0008
; LINE_WIDTH: 0.535264
G1 X140.242 Y125.646 E.00464
; LINE_WIDTH: 0.499955
G1 X140.17 Y125.737 E.00431
; LINE_WIDTH: 0.464646
G1 X140.098 Y125.827 E.00397
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2792
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2792
G2 X143.22 Y129.764 I-.026 J.054 E.0101
M73 P69 R3
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2792
G2 X143.629 Y130.154 I.986 J-149.52 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.044 Y130.235 F30000
; LINE_WIDTH: 0.419999
G1 F2792
G1 X141.059 Y130.531 E.00909
G1 X144.006 Y130.531 E.09055
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.102 Y130.22 E.01034
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12787
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.644 Y129.048 E-.20179
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/40
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
G3 Z3.4 I.275 J-1.185 P1  F30000
G1 X131.684 Y126.506 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X131.801 Y126.444 E.00438
G1 X132.077 Y126.299 E.01036
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.634 Y126.538 E.01536
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X132.217 Y126.668 E.01194
G1 X132.595 Y126.575 E.01194
G3 X131.825 Y126.884 I.194 J1.6 E.28536
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.074 J-1.215 P1  F30000
G1 X125.197 Y126.328 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X125.64 Y126.219 E.01514
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.141 Y126.347 E.01577
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.246 Y126.735 E.01046
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.293 Y130.29 E.01093
G1 X119.135 Y130.373 E.00591
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.111 Y129.943 E.00866
G1 X118.995 Y130.004 E.00402
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.088 J1.214 P1  F30000
G1 X138.67 Y128.376 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X138.617 Y127.947 E.01434
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.682 Y128.435 E.01496
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G1 X140.762 Y126.397 E.01157
G3 X139.073 Y128.379 I-.188 J1.55 E.20688
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.149 Y127.334 E-.09738
G1 X139.191 Y127.221 E-.04567
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2792
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137578
G1 F2792
G1 X117.387 Y130.521 E.00141
; LINE_WIDTH: 0.178236
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152593
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2792
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184371
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141041
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.096921
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429223
G1 F2792
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392416
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352983
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423078
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I1.535 J-.833 E.028
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
M73 P70 R3
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407888
G1 F2792
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392058
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347925
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347926
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.39206
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439718
G1 F2792
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F2792
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.128678
G1 F2792
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166311
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203944
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.211 J-.122 P1  F30000
G1 X140.098 Y125.827 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.464642
G1 F2792
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562538
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499957
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464649
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.42934
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2792
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2792
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2792
G2 X143.629 Y130.154 I.986 J-149.612 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F2792
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12427
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.65 Y129.04 E-.2054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/40
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
G3 Z3.6 I.268 J-1.187 P1  F30000
G1 X131.62 Y126.55 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X131.649 Y126.524 E.0013
G1 X132.077 Y126.299 E.01605
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X130.947 Y127.414 E.00996
G1 X131.012 Y127.243 E.00609
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X132.595 Y126.575 I.915 J1.326 E.02393
G1 X132.983 Y126.575 E.01194
G3 X131.825 Y126.884 I-.194 J1.6 E.27339
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.074 J-1.215 P1  F30000
G1 X125.197 Y126.328 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X125.64 Y126.219 E.01514
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X124.886 Y126.481 E.00622
G1 X125.141 Y126.347 E.00955
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.068 Y126.828 E.0043
G1 X125.246 Y126.735 E.00617
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.361 Y126.581 E.00635
G1 X117.641 Y126.434 E.01049
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.135 Y130.373 E.01685
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X118.995 Y130.004 E.01268
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X138.674 Y128.415 E.0013
G1 X138.617 Y127.947 E.01565
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G1 X140.762 Y126.397 E.01157
G3 X139.073 Y128.379 I-.188 J1.55 E.20687
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2792
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F2792
G1 X117.387 Y130.521 E.00141
; LINE_WIDTH: 0.178234
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152592
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2792
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184367
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.14104
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969209
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
M73 P71 R3
G1 F2792
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392416
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352982
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423078
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I1.535 J-.833 E.028
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407888
G1 F2792
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392058
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347925
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347926
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.39206
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439719
G1 F2792
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103206
G1 F2792
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.128678
G1 F2792
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203946
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.211 J-.122 P1  F30000
G1 X140.098 Y125.827 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.464642
G1 F2792
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562538
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499955
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464647
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429338
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2792
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2792
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2792
G2 X143.629 Y130.154 I.986 J-149.517 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F2792
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.559 Y125.469 E.07517
G1 X141.681 Y125.735 E.00898
G1 X141.621 Y125.86 E.00426
G1 X141.927 Y126.027 E.01071
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12427
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.65 Y129.04 E-.2054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/40
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
G3 Z3.8 I.274 J-1.186 P1  F30000
G1 X131.684 Y126.506 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X131.823 Y126.433 E.00519
G1 X132.077 Y126.299 E.00955
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.503 Y129.697 E.0065
G1 X131.287 Y129.506 E.00955
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X130.943 Y127.426 E.00955
G1 X131.012 Y127.243 E.0065
G1 X131.287 Y126.845 E.01605
G1 X131.634 Y126.538 E.01536
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X132.217 Y126.668 E.01194
G1 X132.595 Y126.575 E.01194
G3 X131.224 Y127.79 I.194 J1.6 E.2513
G1 X131.362 Y127.426 E.01194
G3 X131.825 Y126.884 I1.427 J.749 E.0221
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.07 J-1.215 P1  F30000
G1 X125.124 Y126.356 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X125.159 Y126.338 E.00131
G1 X125.64 Y126.219 E.01645
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X124.897 Y126.475 E.00664
M73 P72 R3
G1 X125.071 Y126.384 E.0065
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.079 Y126.822 E.00469
G1 X125.246 Y126.735 E.00578
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.135 Y130.373 E.01685
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X118.995 Y130.004 E.01268
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.088 J1.214 P1  F30000
G1 X138.67 Y128.376 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X138.617 Y127.947 E.01434
G1 X138.674 Y127.479 E.01565
G1 X138.774 Y127.217 E.00929
G1 X138.842 Y127.038 E.00635
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.682 Y128.435 E.01496
G1 X139.065 Y128.319 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G3 X140.386 Y126.397 I1.509 J-.378 E.081
G1 X140.762 Y126.397 E.01157
G1 X141.128 Y126.487 E.01157
G3 X139.081 Y128.377 I-.553 J1.454 E.19436
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16533
G1 X139.058 Y127.573 E-.14305
G1 X139.14 Y127.356 E-.08839
G1 X139.191 Y127.221 E-.05466
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.634 E-.02247
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2791
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F2791
G1 X117.387 Y130.521 E.00141
; LINE_WIDTH: 0.178234
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152592
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2791
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184367
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.14104
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969209
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
G1 F2791
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392416
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352982
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423078
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2791
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I1.535 J-.833 E.028
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407888
G1 F2791
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392058
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347925
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347926
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439719
G1 F2791
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2791
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F2791
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.128678
G1 F2791
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203945
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.211 J-.122 P1  F30000
G1 X140.098 Y125.827 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.464642
G1 F2791
M73 P73 R3
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562539
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499963
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464654
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429346
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2791
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2791
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2791
G2 X143.629 Y130.154 I.986 J-149.518 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F2791
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.553 Y125.469 E.07536
G1 X141.692 Y125.731 E.00912
G1 X141.627 Y125.863 E.00453
G1 X141.927 Y126.027 E.0105
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12427
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.65 Y129.04 E-.2054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/40
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
G3 Z4 I.268 J-1.187 P1  F30000
G1 X131.62 Y126.55 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X131.649 Y126.524 E.0013
G1 X132.077 Y126.299 E.01605
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.493 Y129.688 E.0069
G1 X131.287 Y129.506 E.00914
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X130.938 Y127.437 E.00914
G1 X131.012 Y127.243 E.0069
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.874 Y126.85 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X132.595 Y126.575 I.915 J1.319 E.02393
G1 X132.983 Y126.575 E.01194
G3 X131.826 Y126.885 I-.194 J1.594 E.27225
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17012
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14698
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.074 J-1.215 P1  F30000
G1 X125.197 Y126.328 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X125.64 Y126.219 E.01514
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.56 Y129.812 E.00706
G1 X124.349 Y129.624 E.00938
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.141 Y126.347 E.01577
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.82 Y129.519 E.00508
G1 X124.644 Y129.363 E.00723
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.09 Y126.816 E.00508
G1 X125.246 Y126.735 E.00538
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.384 Y126.568 E.00722
G1 X117.641 Y126.434 E.00962
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.328 Y130.272 E.00962
G1 X119.135 Y130.373 E.00722
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.146 Y129.925 E.00745
G1 X118.995 Y130.004 E.00523
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X138.674 Y128.415 E.0013
G1 X138.617 Y127.947 E.01565
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G1 X140.762 Y126.397 E.01157
G3 X139.073 Y128.379 I-.188 J1.55 E.20688
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2792
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137579
G1 F2792
G1 X117.387 Y130.521 E.00141
; LINE_WIDTH: 0.178237
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152594
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145857
G1 F2792
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194794
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184368
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.14104
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969209
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
G1 F2792
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392414
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352982
G3 X115.958 Y128.698 I2.615 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423078
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I2.098 J-1.346 E.02786
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
M73 P74 R3
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.40789
G1 F2792
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.39206
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347926
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347925
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439718
G1 F2792
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103206
G1 F2792
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.12868
G1 F2792
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166314
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203947
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.211 J.122 P1  F30000
G1 X141.049 Y125.827 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.429339
G1 F2792
G1 X140.978 Y125.737 E.00364
; LINE_WIDTH: 0.464648
G1 X140.906 Y125.646 E.00397
; LINE_WIDTH: 0.499957
G1 X140.834 Y125.555 E.00431
; LINE_WIDTH: 0.562538
G1 X140.822 Y125.541 E.0008
G1 X140.326 Y125.541 E.021
G1 X140.313 Y125.555 E.0008
; LINE_WIDTH: 0.535264
G1 X140.242 Y125.646 E.00464
; LINE_WIDTH: 0.499955
G1 X140.17 Y125.737 E.00431
; LINE_WIDTH: 0.464646
G1 X140.098 Y125.827 E.00397
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2792
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2792
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2792
G2 X143.629 Y130.154 I.986 J-149.52 E.04448
G2 X143.629 Y126.63 I-438.37 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F2792
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12427
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.65 Y129.04 E-.2054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/40
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
G3 Z4.2 I.274 J-1.186 P1  F30000
G1 X131.684 Y126.506 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2829
G1 X131.844 Y126.421 E.00601
G1 X132.077 Y126.299 E.00874
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.634 Y126.538 E.01536
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2829
G1 X132.217 Y126.668 E.01194
G1 X132.595 Y126.575 E.01194
G3 X131.825 Y126.884 I.194 J1.6 E.28536
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.07 J-1.215 P1  F30000
G1 X125.124 Y126.356 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2829
G1 X125.159 Y126.338 E.00131
G1 X125.64 Y126.219 E.01645
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X124.92 Y126.463 E.00748
G1 X125.071 Y126.384 E.00566
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2829
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.102 Y126.811 E.00547
G1 X125.246 Y126.735 E.00499
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2829
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.34 Y130.266 E.00919
G1 X119.135 Y130.373 E.00766
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2829
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.157 Y129.918 E.00705
G1 X118.995 Y130.004 E.00563
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.088 J1.214 P1  F30000
G1 X138.67 Y128.376 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2829
G1 X138.617 Y127.947 E.01434
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.682 Y128.435 E.01496
G1 X139.065 Y128.319 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2829
G3 X140.386 Y126.397 I1.509 J-.378 E.08102
G1 X140.762 Y126.397 E.01157
G3 X139.08 Y128.377 I-.188 J1.544 E.20593
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16535
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.634 E-.02245
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2829
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2829
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522984
G1 F2829
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
M73 P75 R3
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F2829
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178233
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152593
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2829
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.18437
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141039
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969195
G1 X119.539 Y130.418 E.0008
G1 X120.578 Y129.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.498844
G1 F2829
G1 X120.646 Y129.561 E.00482
G1 X124.733 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392058
G1 F2829
G1 X125.044 Y130.545 E.00901
; LINE_WIDTH: 0.347926
G1 X125.226 Y130.567 E.00455
; LINE_WIDTH: 0.303792
G1 X125.408 Y130.589 E.00389
; LINE_WIDTH: 0.259658
G1 X125.589 Y130.611 E.00323
; LINE_WIDTH: 0.267708
G2 X126.368 Y130.589 I.175 J-7.581 E.01428
; LINE_WIDTH: 0.347926
G1 X126.55 Y130.567 E.00455
; LINE_WIDTH: 0.39206
G1 X126.732 Y130.545 E.00521
; LINE_WIDTH: 0.40789
G1 X127.043 Y130.487 E.00942
G1 X129.054 Y130.575 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2829
G1 X127.425 Y130.575 E.05401
M73 P75 R2
G1 X130.568 Y127.432 E.14743
G2 X130.467 Y128.467 I2.263 J.743 E.03478
G1 X127.425 Y125.425 E.14269
G1 X124.899 Y125.425 E.08382
G1 X121.078 Y129.246 E.17925
G1 X121.144 Y129.611 E.01228
G1 X120.702 Y130.251 E.02582
G1 X120.31 Y130.014 E.0152
G1 X119.939 Y130.385 E.01738
G1 X120.051 Y130.546 E.00652
G1 X120.01 Y130.575 E.00166
G1 X124.362 Y130.575 E.14438
G1 X124.437 Y130.168 E.01371
G3 X123.874 Y129.55 I.972 J-1.451 E.028
G1 X119.749 Y125.425 E.1935
G1 X117.223 Y125.425 E.08382
G1 X115.95 Y126.698 E.05969
G1 X115.95 Y127.004 E.01017
G1 X116.34 Y127.076 E.01315
G3 X116.967 Y126.404 I1.677 J.934 E.03078
G1 X116.056 Y127.378 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.466029
G1 F2829
G1 X116.018 Y127.583 E.00719
; LINE_WIDTH: 0.423076
G2 X115.975 Y127.83 I2.033 J.479 E.00776
; LINE_WIDTH: 0.382297
G1 X115.958 Y128.108 E.00772
; LINE_WIDTH: 0.345047
G2 X115.942 Y128.42 I2.566 J.295 E.00768
; LINE_WIDTH: 0.314883
G1 X115.958 Y128.698 E.00619
; LINE_WIDTH: 0.352982
G2 X115.98 Y129.018 I2.638 J-.02 E.00811
; LINE_WIDTH: 0.392416
G1 X116.018 Y129.224 E.00594
; LINE_WIDTH: 0.429223
G1 X116.056 Y129.429 E.00657
; WIPE_START
G1 F24000
G1 X116.018 Y129.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.095 J1.213 P1  F30000
G1 X131.907 Y130.473 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.439718
G1 F2829
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2829
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.128678
G1 F2829
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203945
G1 X140.574 Y130.719 E.00248
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.103205
G1 F2829
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
; WIPE_START
G1 F24000
G1 X140.574 Y130.137 E-.62134
G1 X140.574 Y130.152 E-.13866
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.21 J.133 P1  F30000
G1 X141.049 Y125.827 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.429342
G1 F2829
G1 X140.978 Y125.737 E.00364
; LINE_WIDTH: 0.464651
G1 X140.906 Y125.646 E.00397
; LINE_WIDTH: 0.499959
G1 X140.834 Y125.555 E.00431
; LINE_WIDTH: 0.562538
G1 X140.822 Y125.541 E.0008
G1 X140.326 Y125.541 E.021
G1 X140.313 Y125.555 E.0008
; LINE_WIDTH: 0.535264
G1 X140.242 Y125.646 E.00464
; LINE_WIDTH: 0.499955
G1 X140.17 Y125.737 E.00431
; LINE_WIDTH: 0.464646
G1 X140.098 Y125.827 E.00397
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2829
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2829
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2829
G2 X143.629 Y130.154 I.986 J-149.52 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.044 Y130.235 F30000
; LINE_WIDTH: 0.419999
G1 F2829
G1 X141.059 Y130.531 E.00909
G1 X144.006 Y130.531 E.09055
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.102 Y130.22 E.01034
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12787
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.644 Y129.048 E-.20179
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/40
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
G3 Z4.4 I.269 J-1.187 P1  F30000
G1 X131.62 Y126.55 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X131.649 Y126.524 E.0013
G1 X132.077 Y126.299 E.01605
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.475 Y129.672 E.00772
G1 X131.287 Y129.506 E.00833
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X130.93 Y127.46 E.00833
G1 X131.012 Y127.243 E.00772
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.874 Y126.85 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X132.595 Y126.575 I.915 J1.319 E.02393
G1 X132.983 Y126.575 E.01194
G3 X131.826 Y126.885 I-.194 J1.594 E.27225
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17012
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14698
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.074 J-1.215 P1  F30000
G1 X125.197 Y126.328 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X125.64 Y126.219 E.01514
G1 X126.136 Y126.219 E.01645
M73 P76 R2
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.141 Y126.347 E.01577
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.246 Y126.735 E.01046
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.351 Y130.26 E.00875
G1 X119.135 Y130.373 E.0081
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.169 Y129.912 E.00664
G1 X118.995 Y130.004 E.00604
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X138.674 Y128.415 E.0013
G1 X138.617 Y127.947 E.01565
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G1 X140.762 Y126.397 E.01157
G3 X139.073 Y128.379 I-.188 J1.55 E.20688
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522984
G1 F2792
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F2792
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178233
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152593
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2792
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184371
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141041
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.096921
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
G1 F2792
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392416
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352982
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423076
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.466029
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I1.535 J-.833 E.028
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407888
G1 F2792
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392058
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347925
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347925
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439718
G1 F2792
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F2792
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.12868
G1 F2792
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166314
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203947
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.211 J-.122 P1  F30000
M73 P77 R2
G1 X140.098 Y125.827 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.464642
G1 F2792
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562538
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499959
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464651
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429342
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2792
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2792
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2792
G2 X143.629 Y130.154 I.986 J-149.612 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.044 Y130.235 F30000
; LINE_WIDTH: 0.419999
G1 F2792
G1 X141.059 Y130.531 E.00909
G1 X144.006 Y130.531 E.09055
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.102 Y130.22 E.01034
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12787
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.644 Y129.048 E-.20179
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/40
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
G3 Z4.6 I.269 J-1.187 P1  F30000
G1 X131.62 Y126.55 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X131.649 Y126.524 E.0013
G1 X132.077 Y126.299 E.01605
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.426 Y127.041 E.00792
G1 X134.566 Y127.243 E.00812
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G3 X132.595 Y126.575 I.915 J1.326 E.02393
G3 X133.995 Y127.107 I.194 J1.6 E.04787
G1 X134.216 Y127.426 E.01194
G3 X131.825 Y126.884 I-1.427 J.749 E.22553
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.074 J-1.215 P1  F30000
G1 X125.197 Y126.328 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X125.64 Y126.219 E.01514
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.141 Y126.347 E.01577
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.246 Y126.735 E.01046
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.135 Y130.373 E.01685
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.181 Y129.906 E.00624
G1 X118.995 Y130.004 E.00644
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.088 J1.214 P1  F30000
G1 X138.67 Y128.376 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X138.617 Y127.947 E.01434
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.682 Y128.435 E.01496
G1 X139.065 Y128.319 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G3 X140.386 Y126.397 I1.509 J-.378 E.08102
G1 X140.762 Y126.397 E.01157
G3 X139.08 Y128.377 I-.188 J1.544 E.20593
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16535
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.634 E-.02245
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2791
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F2791
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178235
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152592
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2791
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184369
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141041
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.096921
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
G1 F2791
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392416
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352982
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423078
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2791
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
M73 P78 R2
G2 X124.437 Y130.168 I1.535 J-.833 E.028
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407888
G1 F2791
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392058
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347925
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347925
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439718
G1 F2791
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2791
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F2791
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.128678
G1 F2791
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203947
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.211 J-.122 P1  F30000
G1 X140.098 Y125.827 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.464642
G1 F2791
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562538
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499959
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464651
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429342
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2791
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2791
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2791
G2 X143.629 Y130.154 I.986 J-149.52 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F2791
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12427
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.65 Y129.04 E-.2054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/40
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
G3 Z4.8 I.268 J-1.187 P1  F30000
G1 X131.62 Y126.55 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X131.649 Y126.524 E.0013
G1 X132.077 Y126.299 E.01605
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.874 Y126.85 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G3 X132.595 Y126.575 I.915 J1.32 E.02393
G1 X132.983 Y126.575 E.01194
G3 X131.826 Y126.885 I-.194 J1.594 E.27227
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17013
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14698
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.07 J-1.215 P1  F30000
G1 X125.124 Y126.356 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X125.159 Y126.338 E.00131
G1 X125.64 Y126.219 E.01645
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X124.953 Y126.446 E.00875
G1 X125.071 Y126.384 E.0044
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.135 Y126.793 E.00664
G1 X125.246 Y126.735 E.00382
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.374 Y130.247 E.00788
G1 X119.135 Y130.373 E.00897
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.192 Y129.9 E.00583
G1 X118.995 Y130.004 E.00684
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X138.674 Y128.415 E.0013
G1 X138.617 Y127.947 E.01565
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.164 Y126.832 E.00733
G1 X142.306 Y127.038 E.00831
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G1 X140.762 Y126.397 E.01157
G1 X141.128 Y126.487 E.01157
G3 X141.743 Y126.912 I-.554 J1.46 E.02319
G1 X141.957 Y127.221 E.01157
G3 X139.073 Y128.379 I-1.383 J.726 E.1605
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z5
M73 P79 R2
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2791
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F2791
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178235
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152592
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2791
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184369
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141041
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969209
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429223
G1 F2791
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392416
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352983
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423077
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2791
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I1.535 J-.833 E.028
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407888
G1 F2791
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392058
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347925
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347926
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439718
G1 F2791
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2791
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F2791
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.128678
G1 F2791
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203947
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.211 J-.122 P1  F30000
G1 X140.098 Y125.827 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.464642
G1 F2791
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562539
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499963
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464654
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429346
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2791
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2791
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2791
G2 X143.629 Y130.154 I.986 J-149.612 E.04448
G2 X143.629 Y126.63 I-438.37 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F2791
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.553 Y125.469 E.07536
G1 X141.692 Y125.731 E.00912
G1 X141.627 Y125.863 E.00453
G1 X141.927 Y126.027 E.0105
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12427
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.65 Y129.04 E-.2054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/40
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
G3 Z5 I.274 J-1.186 P1  F30000
G1 X131.684 Y126.506 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X132.077 Y126.299 E.01474
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.634 Y126.538 E.01536
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
M73 P80 R2
G3 X132.595 Y126.575 I.915 J1.326 E.02393
G1 X132.983 Y126.575 E.01194
G3 X131.825 Y126.884 I-.194 J1.6 E.27339
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.07 J-1.215 P1  F30000
G1 X125.124 Y126.356 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X125.159 Y126.338 E.00131
G1 X125.64 Y126.219 E.01645
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.513 Y129.77 E.00917
G1 X124.349 Y129.624 E.00727
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X124.965 Y126.44 E.00917
G1 X125.071 Y126.384 E.00397
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.773 Y129.476 E.00703
G1 X124.644 Y129.363 E.00528
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.147 Y126.787 E.00703
G1 X125.246 Y126.735 E.00343
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.135 Y130.373 E.01685
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.204 Y129.894 E.00543
G1 X118.995 Y130.004 E.00725
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.088 J1.214 P1  F30000
G1 X138.67 Y128.376 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X138.617 Y127.947 E.01434
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.682 Y128.435 E.01496
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G1 X140.762 Y126.397 E.01157
G1 X141.128 Y126.487 E.01157
G3 X139.073 Y128.379 I-.554 J1.46 E.19528
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2792
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137578
G1 F2792
G1 X117.387 Y130.521 E.00141
; LINE_WIDTH: 0.178236
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152593
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2792
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184369
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141041
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.096921
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
G1 F2792
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392416
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352982
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423078
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I1.988 J-1.246 E.02788
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407888
G1 F2792
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392058
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347925
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303791
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347925
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439718
G1 F2792
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F2792
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.12868
G1 F2792
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166314
M73 P81 R2
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203949
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.211 J-.122 P1  F30000
G1 X140.098 Y125.827 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.464642
G1 F2792
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562539
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499963
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464654
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429346
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2792
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2792
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2792
G2 X143.629 Y130.154 I.986 J-149.518 E.04448
G2 X143.629 Y126.63 I-438.37 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.044 Y130.235 F30000
; LINE_WIDTH: 0.419999
G1 F2792
G1 X141.059 Y130.531 E.00909
G1 X144.006 Y130.531 E.09055
G1 X144.006 Y125.469 E.15553
G1 X141.553 Y125.469 E.07536
G1 X141.692 Y125.731 E.00912
G1 X141.627 Y125.863 E.00453
G1 X141.927 Y126.027 E.0105
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.102 Y130.22 E.01034
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12787
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.644 Y129.048 E-.20179
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/40
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
G3 Z5.2 I.275 J-1.185 P1  F30000
G1 X131.684 Y126.506 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X131.899 Y126.393 E.00804
G1 X132.077 Y126.299 E.0067
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.634 Y126.538 E.01536
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X132.217 Y126.668 E.01194
G1 X132.595 Y126.575 E.01194
G3 X131.825 Y126.884 I.192 J1.594 E.28424
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.07 J-1.215 P1  F30000
G1 X125.124 Y126.356 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X125.159 Y126.338 E.00131
G1 X125.64 Y126.219 E.01645
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.503 Y129.761 E.00959
G1 X124.349 Y129.624 E.00685
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X124.976 Y126.434 E.00959
G1 X125.071 Y126.384 E.00355
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.763 Y129.468 E.00742
G1 X124.644 Y129.363 E.00488
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.158 Y126.781 E.00742
G1 X125.246 Y126.735 E.00304
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.135 Y130.373 E.01685
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X118.995 Y130.004 E.01268
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X138.674 Y128.415 E.0013
G1 X138.617 Y127.947 E.01565
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G1 X140.762 Y126.397 E.01157
G3 X139.073 Y128.379 I-.188 J1.55 E.20688
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2791
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137579
G1 F2791
G1 X117.387 Y130.521 E.00141
; LINE_WIDTH: 0.178237
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152594
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2791
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.18437
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.14104
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969209
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
G1 F2791
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392414
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352982
G3 X115.958 Y128.698 I2.615 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423077
G3 X116.018 Y127.583 I2.075 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2791
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
M73 P82 R2
G2 X124.437 Y130.168 I1.966 J-1.226 E.02789
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.40789
G1 F2791
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.39206
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347926
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347926
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439718
G1 F2791
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2791
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F2791
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.12868
G1 F2791
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166314
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203947
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.211 J-.122 P1  F30000
G1 X140.098 Y125.827 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.464642
G1 F2791
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562538
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499959
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464651
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429342
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2791
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2791
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2791
G2 X143.629 Y130.154 I.986 J-149.52 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.044 Y130.235 F30000
; LINE_WIDTH: 0.419999
G1 F2791
G1 X141.059 Y130.531 E.00909
G1 X144.006 Y130.531 E.09055
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.102 Y130.22 E.01034
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12787
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.644 Y129.048 E-.20179
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/40
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
G3 Z5.4 I.269 J-1.187 P1  F30000
G1 X131.62 Y126.55 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X131.649 Y126.524 E.0013
G1 X132.077 Y126.299 E.01605
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G3 X132.595 Y126.575 I.915 J1.326 E.02393
G1 X132.983 Y126.575 E.01194
G3 X131.825 Y126.884 I-.194 J1.6 E.27339
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.07 J-1.215 P1  F30000
G1 X125.124 Y126.356 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X125.159 Y126.338 E.00131
G1 X125.64 Y126.219 E.01645
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.494 Y129.753 E.01001
G1 X124.349 Y129.624 E.00643
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X124.987 Y126.428 E.01001
G1 X125.071 Y126.384 E.00313
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.754 Y129.46 E.00781
G1 X124.644 Y129.363 E.00449
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.246 Y126.735 E.01046
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.817 Y126.875 E.01028
G1 X119.965 Y127.006 E.00657
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.135 Y130.373 E.01685
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.557 Y127.169 E.00806
G1 X119.669 Y127.268 E.00462
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.227 Y129.882 E.00462
G1 X118.995 Y130.004 E.00806
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.088 J1.214 P1  F30000
G1 X138.67 Y128.376 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X138.617 Y127.947 E.01434
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
M73 P83 R2
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.682 Y128.435 E.01496
G1 X139.065 Y128.319 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G3 X140.386 Y126.397 I1.509 J-.378 E.08102
G1 X140.762 Y126.397 E.01157
G3 X139.08 Y128.377 I-.188 J1.544 E.20593
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16535
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.634 E-.02245
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2791
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137579
G1 F2791
G1 X117.387 Y130.521 E.00141
; LINE_WIDTH: 0.178237
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152594
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2791
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184373
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141027
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0968905
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
G1 F2791
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392414
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352982
G3 X115.958 Y128.698 I2.615 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345046
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382295
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423076
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2791
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I1.944 J-1.206 E.02789
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
M73 P83 R1
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407888
G1 F2791
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392058
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347925
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303791
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347925
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439719
G1 F2791
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2791
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F2791
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.128678
G1 F2791
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203947
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.211 J-.122 P1  F30000
G1 X140.098 Y125.827 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.464642
G1 F2791
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562538
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499959
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464651
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429342
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2791
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2791
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2791
G2 X143.629 Y130.154 I.986 J-149.52 E.04448
G2 X143.629 Y126.63 I-438.37 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F2791
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12427
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.65 Y129.04 E-.2054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/40
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
G3 Z5.6 I.268 J-1.187 P1  F30000
G1 X131.62 Y126.55 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X131.649 Y126.524 E.0013
G1 X131.92 Y126.382 E.01016
G1 X132.077 Y126.299 E.00589
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
M73 P84 R1
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X132.217 Y126.668 E.01194
G1 X132.595 Y126.575 E.01194
G3 X131.825 Y126.884 I.192 J1.594 E.28424
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.074 J-1.215 P1  F30000
G1 X125.197 Y126.328 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X125.64 Y126.219 E.01514
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.141 Y126.347 E.01577
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.243 Y128.393 E.0082
G1 X124.226 Y128.261 E.0041
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.246 Y126.735 E.01046
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.477 Y126.52 E.01071
G1 X117.641 Y126.434 E.00613
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.826 Y126.884 E.01071
G1 X119.965 Y127.006 E.00613
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.421 Y130.223 E.00613
G1 X119.135 Y130.373 E.01071
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.566 Y127.177 E.00846
G1 X119.669 Y127.268 E.00422
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.239 Y129.876 E.00422
G1 X118.995 Y130.004 E.00846
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X138.674 Y128.415 E.0013
G1 X138.617 Y127.947 E.01565
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G1 X140.762 Y126.397 E.01157
G3 X139.073 Y128.379 I-.188 J1.55 E.20688
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2791
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2791
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2791
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137579
G1 F2791
G1 X117.387 Y130.521 E.00141
; LINE_WIDTH: 0.178237
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152594
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2791
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184369
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.14104
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969209
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
G1 F2791
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392414
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352982
G3 X115.958 Y128.698 I2.615 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345046
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382295
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423076
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2791
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
G2 X124.437 Y130.168 I1.535 J-.833 E.028
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407888
G1 F2791
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392058
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347925
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347925
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439719
G1 F2791
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2791
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
M73 P85 R1
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F2791
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.128678
G1 F2791
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203947
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.211 J-.122 P1  F30000
G1 X140.098 Y125.827 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.464642
G1 F2791
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562538
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499959
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464651
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429342
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2791
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2791
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2791
G2 X143.629 Y130.154 I.986 J-149.52 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F2791
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12427
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.65 Y129.04 E-.2054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/40
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
G3 Z5.8 I.268 J-1.187 P1  F30000
G1 X131.62 Y126.55 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X131.649 Y126.524 E.0013
G1 X132.077 Y126.299 E.01605
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X132.595 Y126.575 I.915 J1.326 E.02393
G1 X132.983 Y126.575 E.01194
G3 X131.825 Y126.884 I-.194 J1.6 E.27339
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.074 J-1.215 P1  F30000
G1 X125.197 Y126.328 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X125.64 Y126.219 E.01514
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.141 Y126.347 E.01577
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.246 Y126.735 E.01046
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.433 Y130.217 E.0057
G1 X119.135 Y130.373 E.01115
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.25 Y129.87 E.00381
G1 X118.995 Y130.004 E.00886
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.088 J1.214 P1  F30000
G1 X138.67 Y128.376 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X138.617 Y127.947 E.01434
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.682 Y128.435 E.01496
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G3 X142.09 Y127.573 I.161 J1.59 E.06923
G1 X142.135 Y127.947 E.01157
G3 X139.073 Y128.379 I-1.562 J0 E.13731
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2792
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2792
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F2792
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F2792
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178235
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152592
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F2792
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184369
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141041
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969209
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
G1 F2792
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392416
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352982
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423076
G3 X116.018 Y127.583 I2.075 J.232 E.00776
; LINE_WIDTH: 0.466029
G1 X116.056 Y127.378 E.00719
G1 X116.967 Y126.404 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X116.34 Y127.076 I1.05 J1.607 E.03078
G1 X115.95 Y127.004 E.01315
G1 X115.95 Y126.698 E.01017
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X123.874 Y129.55 E.1935
M73 P86 R1
G2 X124.437 Y130.168 I1.535 J-.833 E.028
G1 X124.362 Y130.575 E.01371
G1 X120.01 Y130.575 E.14438
G1 X120.051 Y130.546 E.00166
G1 X119.939 Y130.385 E.00652
G1 X124.899 Y125.425 E.23265
G1 X127.425 Y125.425 E.08382
G1 X130.467 Y128.467 E.14269
G3 X130.568 Y127.432 I2.364 J-.292 E.03478
G1 X127.425 Y130.575 E.14743
G1 X129.054 Y130.575 E.05401
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407888
G1 F2792
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392058
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347925
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347925
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439719
G1 F2792
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407222
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.482602
G1 X133.671 Y130.473 E.01034
; WIPE_START
G1 F24000
G1 X133.384 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.215 J.071 P1  F30000
G1 X133.649 Y125.984 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2792
G2 X132.054 Y125.946 I-.846 J2.032 E.05416
G1 X132.575 Y125.425 E.02443
G1 X135.101 Y125.425 E.08382
G1 X138.43 Y128.754 E.15618
G3 X138.366 Y127.31 I1.727 J-.801 E.04919
G1 X135.101 Y130.575 E.15314
G1 X140.124 Y130.575 E.1666
G1 X140.124 Y130.448 E.00421
G1 X139.788 Y130.112 E.01573
G3 X138.573 Y129.08 I.711 J-2.069 E.05414
G1 X140.574 Y130.152 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F2792
G1 X140.574 Y130.137 E.00007
G3 X140.639 Y130.117 I.064 J.092 E.00034
G1 X140.574 Y130.152 F30000
; LINE_WIDTH: 0.128678
G1 F2792
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203947
G1 X140.574 Y130.719 E.00248
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.211 J-.122 P1  F30000
G1 X140.098 Y125.827 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.464642
G1 F2792
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562539
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499965
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464656
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429348
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F2792
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F2792
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F2792
G2 X143.629 Y130.154 I.986 J-149.612 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F2792
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.428 Y130.135 E-.12427
G1 X141.927 Y129.867 E-.21517
G1 X142.347 Y129.488 E-.21517
G1 X142.65 Y129.04 E-.2054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/40
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
G3 Z6 I.274 J-1.186 P1  F30000
G1 X131.684 Y126.506 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3091
G1 X131.942 Y126.37 E.00967
G1 X132.077 Y126.299 E.00507
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.634 Y126.538 E.01536
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3091
G1 X132.217 Y126.668 E.01194
G1 X132.595 Y126.575 E.01194
G3 X131.825 Y126.884 I.192 J1.594 E.28424
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.07 J-1.215 P1  F30000
G1 X125.124 Y126.356 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3091
G1 X125.159 Y126.338 E.00131
G1 X125.64 Y126.219 E.01645
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.071 Y126.384 E.01315
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3091
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.203 Y126.757 E.00899
G1 X125.246 Y126.735 E.00148
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3091
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.135 Y130.373 E.01685
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3091
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.262 Y129.863 E.00341
G1 X118.995 Y130.004 E.00927
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3091
G1 X138.674 Y128.415 E.0013
G1 X138.617 Y127.947 E.01565
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
M73 P87 R1
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.065 Y128.319 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3091
G3 X140.386 Y126.397 I1.509 J-.378 E.081
G1 X140.762 Y126.397 E.01157
G1 X141.128 Y126.487 E.01157
G3 X139.081 Y128.377 I-.553 J1.454 E.19436
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16533
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.634 E-.02247
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3091
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3091
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522984
G1 F3091
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F3091
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178233
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152593
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145857
G1 F3091
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194794
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.18437
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141041
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.096921
G1 X119.539 Y130.418 E.0008
G1 X121.346 Y130.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3091
G1 X120.763 Y130.168 E.01933
G1 X121.134 Y129.19 E.03468
G1 X123.439 Y126.885 E.10814
G1 X124.166 Y125.832 E.04241
G1 X120.156 Y125.832 E.13299
G1 X123.138 Y128.814 E.13985
G2 X123.367 Y129.501 I1.509 J-.122 E.02426
G1 X123.62 Y130.168 E.02366
G1 X123.432 Y130.168 E.00623
G1 X124.733 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392058
G1 F3091
G1 X125.044 Y130.545 E.00901
; LINE_WIDTH: 0.347925
G1 X125.226 Y130.567 E.00455
; LINE_WIDTH: 0.303792
G1 X125.408 Y130.589 E.00389
; LINE_WIDTH: 0.259658
G1 X125.589 Y130.611 E.00323
; LINE_WIDTH: 0.267708
G2 X126.368 Y130.589 I.175 J-7.581 E.01428
; LINE_WIDTH: 0.347925
G1 X126.55 Y130.567 E.00455
; LINE_WIDTH: 0.392058
G1 X126.732 Y130.545 E.00521
; LINE_WIDTH: 0.407888
G1 X127.043 Y130.487 E.00942
G1 X129.227 Y130.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3091
G1 X128.156 Y130.168 E.03552
G1 X128.354 Y129.646 E.01849
G1 X130.049 Y127.951 E.07952
G1 X130.038 Y128.038 E.0029
G1 X127.832 Y125.832 E.10348
G1 X129.461 Y125.832 E.05401
G1 X131.01 Y126.632 F30000
G1 F3091
G1 X130.921 Y126.762 E.00521
G2 X130.5 Y128.739 I2.042 J1.468 E.06903
G1 X131.196 Y130.575 E.06511
G1 X127.566 Y130.575 E.12041
G1 X128.225 Y128.837 E.06165
G2 X127.704 Y126.685 I-2.329 J-.575 E.07635
G1 X126.835 Y125.425 E.05076
G1 X131.843 Y125.425 E.16615
G1 X131.044 Y126.583 E.04666
G1 X134.868 Y126.351 F30000
G1 F3091
G1 X134.51 Y125.832 E.02089
G1 X135.508 Y125.832 E.03312
G1 X137.889 Y128.213 E.11167
G3 X137.874 Y127.802 I.826 J-.235 E.01378
G1 X135.508 Y130.168 E.11098
G1 X137.137 Y130.168 E.05401
G1 X138.364 Y127.314 F30000
G1 F3091
G2 X138.833 Y129.457 I2.166 J.649 E.07597
G1 X139.604 Y130.575 E.04506
G1 X134.382 Y130.575 E.17325
G1 X134.98 Y128.996 E.056
G2 X134.567 Y126.632 I-2.24 J-.827 E.0834
G1 X133.734 Y125.425 E.04865
G1 X139.081 Y125.425 E.17734
G1 X138.386 Y127.258 E.06501
G1 X140.098 Y125.827 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.464642
G1 F3091
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562539
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499967
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464658
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.42935
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499
G1 F3091
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F3091
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F3091
G2 X143.629 Y130.154 I.986 J-149.579 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F3091
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.553 Y125.469 E.07536
G1 X141.692 Y125.731 E.00912
G1 X141.627 Y125.863 E.00453
G1 X141.927 Y126.027 E.0105
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
G1 X140.639 Y130.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103206
G1 F3091
G2 X140.574 Y130.137 I-.001 J.112 E.00034
G1 X140.574 Y130.152 E.00007
; LINE_WIDTH: 0.128682
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166315
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203948
G1 X140.574 Y130.719 E.00248
G1 X133.671 Y130.473 F30000
; LINE_WIDTH: 0.482602
G1 F3091
G1 X133.384 Y130.508 E.01034
; LINE_WIDTH: 0.407222
G3 X132.48 Y130.542 I-.713 J-6.759 E.02689
; LINE_WIDTH: 0.396834
G1 X132.194 Y130.508 E.00832
; LINE_WIDTH: 0.439718
G1 X131.907 Y130.473 E.00933
; WIPE_START
G1 F24000
G1 X132.194 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.501 J-1.109 P1  F30000
G1 X123.989 Y126.805 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3091
G1 X124.941 Y125.425 E.05561
G1 X119.297 Y125.425 E.18724
G1 X120.241 Y126.794 E.05517
G3 X120.573 Y129.522 I-1.944 J1.62 E.09636
G1 X120.174 Y130.575 E.03734
G1 X124.21 Y130.575 E.13388
G1 X123.748 Y129.356 E.04322
G3 X123.507 Y128.047 I2.323 J-1.104 E.04468
G1 X123.507 Y128.047 E0
G3 X123.955 Y126.854 I2.406 J.224 E.04276
G1 X117.223 Y125.425 F30000
G1 F3091
G1 X115.95 Y126.698 E.05969
G1 X116.056 Y127.378 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.466029
G1 F3091
G1 X116.018 Y127.583 E.00719
; LINE_WIDTH: 0.423076
G2 X115.975 Y127.83 I2.033 J.479 E.00776
; LINE_WIDTH: 0.382297
G1 X115.958 Y128.108 E.00772
; LINE_WIDTH: 0.345047
G2 X115.942 Y128.42 I2.566 J.295 E.00768
; LINE_WIDTH: 0.314883
G1 X115.958 Y128.698 E.00619
; LINE_WIDTH: 0.352982
G2 X115.98 Y129.018 I2.638 J-.02 E.00811
; LINE_WIDTH: 0.392416
G1 X116.018 Y129.224 E.00594
; LINE_WIDTH: 0.429222
G1 X116.056 Y129.429 E.00657
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.018 Y129.224 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/40
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
G3 Z6.2 I.208 J1.199 P1  F30000
G1 X131.684 Y126.506 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3093
G1 X132.077 Y126.299 E.01474
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
M73 P88 R1
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.634 Y126.538 E.01536
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3093
G3 X132.595 Y126.575 I.915 J1.326 E.02393
G1 X132.983 Y126.575 E.01194
G3 X131.825 Y126.884 I-.194 J1.6 E.27339
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.07 J-1.215 P1  F30000
G1 X125.124 Y126.356 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3093
G1 X125.159 Y126.338 E.00131
G1 X125.64 Y126.219 E.01645
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.032 Y126.404 E.0117
G1 X125.071 Y126.384 E.00144
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3093
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.309 Y127.774 E.00293
G1 X124.417 Y127.489 E.00938
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.214 Y126.751 E.00938
G1 X125.246 Y126.735 E.00109
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3093
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.856 Y126.91 E.01202
G1 X119.965 Y127.006 E.00482
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.135 Y130.373 E.01685
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3093
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.274 Y129.857 E.00301
G1 X118.995 Y130.004 E.00967
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.088 J1.214 P1  F30000
G1 X138.67 Y128.376 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3093
G1 X138.617 Y127.947 E.01434
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.49 Y127.616 E.00458
G1 X142.53 Y127.947 E.01106
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.682 Y128.435 E.01496
G1 X139.068 Y128.318 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3093
G3 X140.386 Y126.397 I1.511 J-.376 E.08089
G3 X142.09 Y127.573 I.188 J1.55 E.06957
G1 X142.135 Y127.947 E.01157
G3 X139.083 Y128.376 I-1.557 J-.005 E.13662
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16527
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.634 E-.02253
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3093
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3093
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F3093
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F3093
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178235
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152592
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F3093
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184371
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141041
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.096921
G1 X119.539 Y130.418 E.0008
G1 X121.346 Y130.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3093
G1 X120.763 Y130.168 E.01933
G1 X121.134 Y129.19 E.03468
G1 X123.439 Y126.885 E.10814
G1 X124.166 Y125.832 E.04241
G1 X120.156 Y125.832 E.13299
G1 X123.138 Y128.814 E.13985
G1 X123.62 Y130.168 E.04767
G1 X123.432 Y130.168 E.00623
G1 X124.733 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392058
G1 F3093
G1 X125.044 Y130.545 E.00901
; LINE_WIDTH: 0.347925
G1 X125.226 Y130.567 E.00455
; LINE_WIDTH: 0.303792
G1 X125.408 Y130.589 E.00389
; LINE_WIDTH: 0.259658
G1 X125.589 Y130.611 E.00323
; LINE_WIDTH: 0.267708
G2 X126.368 Y130.589 I.175 J-7.581 E.01428
; LINE_WIDTH: 0.347925
G1 X126.55 Y130.567 E.00455
; LINE_WIDTH: 0.392058
G1 X126.732 Y130.545 E.00521
; LINE_WIDTH: 0.407888
G1 X127.043 Y130.487 E.00942
G1 X129.227 Y130.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3093
G1 X128.156 Y130.168 E.03552
G1 X128.354 Y129.646 E.01849
G1 X130.049 Y127.951 E.07952
G1 X130.038 Y128.038 E.0029
G1 X127.832 Y125.832 E.10348
G1 X129.461 Y125.832 E.05401
G1 X131.01 Y126.632 F30000
G1 F3093
G2 X130.5 Y128.739 I1.814 J1.555 E.07464
G1 X131.196 Y130.575 E.06511
G1 X127.566 Y130.575 E.12041
G1 X128.225 Y128.837 E.06165
G2 X127.704 Y126.685 I-2.397 J-.558 E.07619
G1 X126.835 Y125.425 E.05076
G1 X131.843 Y125.425 E.16615
G1 X131.044 Y126.583 E.04666
G1 X134.868 Y126.351 F30000
G1 F3093
G1 X134.51 Y125.832 E.02089
G1 X135.508 Y125.832 E.03312
G1 X137.889 Y128.213 E.11167
G3 X137.874 Y127.802 I.826 J-.235 E.01378
G1 X135.508 Y130.168 E.11098
G1 X137.137 Y130.168 E.05401
G1 X138.334 Y127.395 F30000
G1 F3093
G2 X138.833 Y129.457 I2.325 J.528 E.07293
G1 X139.604 Y130.575 E.04506
G1 X134.382 Y130.575 E.17325
G1 X134.885 Y129.248 E.04708
G2 X134.567 Y126.632 I-2.182 J-1.062 E.09238
G1 X133.734 Y125.425 E.04865
G1 X139.081 Y125.425 E.17734
G1 X138.355 Y127.339 E.06788
G1 X140.098 Y125.827 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.464642
G1 F3093
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
M73 P89 R1
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562538
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499959
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464651
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429342
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F3093
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F3093
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F3093
G2 X143.629 Y130.154 I.986 J-149.398 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.044 Y130.235 F30000
; LINE_WIDTH: 0.419999
G1 F3093
G1 X141.059 Y130.531 E.00909
G1 X144.006 Y130.531 E.09055
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.102 Y130.22 E.01034
G1 X140.639 Y130.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F3093
G2 X140.574 Y130.137 I-.001 J.112 E.00034
G1 X140.574 Y130.152 E.00007
; LINE_WIDTH: 0.12868
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166314
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203949
G1 X140.574 Y130.719 E.00248
G1 X133.671 Y130.473 F30000
; LINE_WIDTH: 0.482602
G1 F3093
G1 X133.384 Y130.508 E.01034
; LINE_WIDTH: 0.407222
G3 X132.48 Y130.542 I-.713 J-6.759 E.02689
; LINE_WIDTH: 0.396834
G1 X132.194 Y130.508 E.00832
; LINE_WIDTH: 0.439718
G1 X131.907 Y130.473 E.00933
; WIPE_START
G1 F24000
G1 X132.194 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.509 J-1.105 P1  F30000
G1 X124.031 Y126.745 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3093
G1 X124.941 Y125.425 E.05318
G1 X119.297 Y125.425 E.18724
G1 X120.564 Y127.261 E.074
G3 X120.636 Y129.356 I-2.121 J1.121 E.07196
G1 X120.174 Y130.575 E.04322
G1 X124.21 Y130.575 E.13388
G1 X123.551 Y128.837 E.06165
G3 X123.505 Y128.06 I2.143 J-.515 E.02593
G1 X123.505 Y128.06 E0
G3 X123.996 Y126.794 I2.445 J.221 E.04566
G1 X117.223 Y125.425 F30000
G1 F3093
G1 X115.95 Y126.698 E.05969
G1 X116.056 Y127.378 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.46603
G1 F3093
G1 X116.018 Y127.583 E.00719
; LINE_WIDTH: 0.423078
G2 X115.975 Y127.83 I2.033 J.479 E.00776
; LINE_WIDTH: 0.382297
G1 X115.958 Y128.108 E.00772
; LINE_WIDTH: 0.345047
G2 X115.942 Y128.42 I2.566 J.295 E.00768
; LINE_WIDTH: 0.314881
G1 X115.958 Y128.698 E.00619
; LINE_WIDTH: 0.352981
G2 X115.98 Y129.018 I2.638 J-.02 E.00811
; LINE_WIDTH: 0.392416
G1 X116.018 Y129.224 E.00594
; LINE_WIDTH: 0.429222
G1 X116.056 Y129.429 E.00657
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.018 Y129.224 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/40
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
G3 Z6.4 I.206 J1.199 P1  F30000
G1 X131.62 Y126.55 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3094
G1 X131.649 Y126.524 E.0013
G1 X131.964 Y126.359 E.01179
G1 X132.077 Y126.299 E.00426
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3094
G1 X132.217 Y126.668 E.01194
G1 X132.595 Y126.575 E.01194
G3 X131.825 Y126.884 I.194 J1.6 E.28536
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.07 J-1.215 P1  F30000
G1 X125.124 Y126.356 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3094
G1 X125.159 Y126.338 E.00131
G1 X125.64 Y126.219 E.01645
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.043 Y126.398 E.01212
G1 X125.071 Y126.384 E.00102
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3094
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.226 Y126.746 E.00977
G1 X125.246 Y126.735 E.0007
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3094
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.135 Y130.373 E.01685
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3094
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X118.995 Y130.004 E.01268
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3094
G1 X138.674 Y128.415 E.0013
G1 X138.617 Y127.947 E.01565
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3094
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G1 X140.762 Y126.397 E.01157
G3 X139.073 Y128.379 I-.188 J1.55 E.20688
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3094
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3094
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F3094
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F3094
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178235
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152592
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145857
G1 F3094
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194794
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184369
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.14104
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969209
G1 X119.539 Y130.418 E.0008
G1 X121.346 Y130.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3094
G1 X120.763 Y130.168 E.01933
G1 X121.134 Y129.19 E.03468
G1 X123.439 Y126.885 E.10814
G1 X124.166 Y125.832 E.04241
G1 X120.156 Y125.832 E.13299
G1 X123.138 Y128.814 E.13985
G1 X123.62 Y130.168 E.04767
G1 X123.432 Y130.168 E.00623
G1 X124.733 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392058
G1 F3094
G1 X125.044 Y130.545 E.00901
; LINE_WIDTH: 0.347926
G1 X125.226 Y130.567 E.00455
; LINE_WIDTH: 0.303792
G1 X125.408 Y130.589 E.00389
; LINE_WIDTH: 0.259658
G1 X125.589 Y130.611 E.00323
; LINE_WIDTH: 0.267708
G2 X126.368 Y130.589 I.175 J-7.581 E.01428
; LINE_WIDTH: 0.347925
M73 P90 R1
G1 X126.55 Y130.567 E.00455
; LINE_WIDTH: 0.392058
G1 X126.732 Y130.545 E.00521
; LINE_WIDTH: 0.407888
G1 X127.043 Y130.487 E.00942
G1 X129.227 Y130.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3094
G1 X128.156 Y130.168 E.03552
G1 X128.354 Y129.646 E.01849
G1 X130.049 Y127.951 E.07952
G1 X130.038 Y128.038 E.0029
G1 X127.832 Y125.832 E.10348
G1 X129.461 Y125.832 E.05401
G1 X131.01 Y126.632 F30000
G1 F3094
G2 X130.5 Y128.739 I1.814 J1.555 E.07464
G1 X131.196 Y130.575 E.06511
G1 X127.566 Y130.575 E.12041
G1 X128.225 Y128.837 E.06165
G2 X127.704 Y126.685 I-2.329 J-.575 E.07635
G1 X126.835 Y125.425 E.05076
G1 X131.843 Y125.425 E.16615
G1 X131.044 Y126.583 E.04666
G1 X134.868 Y126.351 F30000
G1 F3094
G1 X134.51 Y125.832 E.02089
G1 X135.508 Y125.832 E.03312
G1 X137.889 Y128.213 E.11167
G3 X137.874 Y127.802 I.826 J-.235 E.01378
G1 X135.508 Y130.168 E.11098
G1 X137.137 Y130.168 E.05401
G1 X138.334 Y127.395 F30000
G1 F3094
G2 X138.833 Y129.457 I2.368 J.518 E.07284
G1 X139.604 Y130.575 E.04506
G1 X134.382 Y130.575 E.17325
G1 X134.885 Y129.248 E.04708
G2 X134.567 Y126.632 I-2.182 J-1.062 E.09238
G1 X133.734 Y125.425 E.04865
G1 X139.081 Y125.425 E.17734
G1 X138.355 Y127.339 E.06788
G1 X140.098 Y125.827 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.464642
G1 F3094
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.49995
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535258
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562538
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499959
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464651
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429342
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F3094
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F3094
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F3094
G2 X143.629 Y130.154 I.986 J-149.517 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F3094
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
G1 X140.639 Y130.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103206
G1 F3094
G2 X140.574 Y130.137 I-.001 J.112 E.00034
G1 X140.574 Y130.152 E.00007
; LINE_WIDTH: 0.128678
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203946
G1 X140.574 Y130.719 E.00248
G1 X133.671 Y130.473 F30000
; LINE_WIDTH: 0.4826
G1 F3094
G1 X133.384 Y130.508 E.01034
; LINE_WIDTH: 0.407221
G3 X132.48 Y130.542 I-.713 J-6.759 E.02689
; LINE_WIDTH: 0.396834
G1 X132.194 Y130.508 E.00832
; LINE_WIDTH: 0.439718
G1 X131.907 Y130.473 E.00933
; WIPE_START
G1 F24000
G1 X132.194 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.526 J-1.098 P1  F30000
G1 X124.106 Y126.635 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3094
G1 X124.941 Y125.425 E.04877
G1 X119.297 Y125.425 E.18724
G1 X120.241 Y126.794 E.05517
G3 X120.573 Y129.522 I-1.872 J1.611 E.09667
G1 X120.174 Y130.575 E.03734
G1 X124.21 Y130.575 E.13388
G1 X123.551 Y128.837 E.06165
G3 X124.072 Y126.685 I2.498 J-.534 E.07597
G1 X117.223 Y125.425 F30000
G1 F3094
G1 X115.95 Y126.698 E.05969
G1 X116.056 Y127.378 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.46603
G1 F3094
G1 X116.018 Y127.583 E.00719
; LINE_WIDTH: 0.423077
G2 X115.975 Y127.83 I2.033 J.479 E.00776
; LINE_WIDTH: 0.382295
G1 X115.958 Y128.108 E.00772
; LINE_WIDTH: 0.345046
G2 X115.942 Y128.42 I2.566 J.295 E.00768
; LINE_WIDTH: 0.314883
G1 X115.958 Y128.698 E.00619
; LINE_WIDTH: 0.352982
G2 X115.98 Y129.018 I2.638 J-.02 E.00811
; LINE_WIDTH: 0.392416
G1 X116.018 Y129.224 E.00594
; LINE_WIDTH: 0.429222
G1 X116.056 Y129.429 E.00657
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.018 Y129.224 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/40
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
G3 Z6.6 I.206 J1.199 P1  F30000
G1 X131.62 Y126.55 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3093
G1 X131.649 Y126.524 E.0013
G1 X131.975 Y126.353 E.0122
G1 X132.077 Y126.299 E.00385
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.374 Y129.583 E.0122
G1 X131.287 Y129.506 E.00385
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X130.882 Y127.586 E.00385
G1 X131.012 Y127.243 E.0122
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3093
G1 X132.217 Y126.668 E.01194
G1 X132.595 Y126.575 E.01194
G3 X131.825 Y126.884 I.192 J1.595 E.28443
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.074 J-1.215 P1  F30000
G1 X125.197 Y126.328 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3093
G1 X125.64 Y126.219 E.01514
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.141 Y126.347 E.01577
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3093
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.246 Y126.735 E.01046
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3093
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.296 Y129.271 E.01289
G1 X120.253 Y129.382 E.00395
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.135 Y130.373 E.01685
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3093
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
M73 P91 R1
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.929 Y129.132 E.01048
G1 X119.904 Y129.199 E.0022
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X119.297 Y129.845 E.0022
G1 X118.995 Y130.004 E.01048
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.088 J1.214 P1  F30000
G1 X138.67 Y128.376 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3093
G1 X138.617 Y127.947 E.01434
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.487 Y127.593 E.0038
G1 X142.53 Y127.947 E.01185
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.682 Y128.435 E.01496
G1 X139.058 Y128.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3093
G3 X140.386 Y126.397 I1.516 J-.374 E.08117
G1 X140.762 Y126.397 E.01157
G3 X139.073 Y128.379 I-.188 J1.55 E.20688
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16558
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.635 E-.02222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3093
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3093
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F3093
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137579
G1 F3093
G1 X117.387 Y130.521 E.00141
; LINE_WIDTH: 0.178237
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152594
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145857
G1 F3093
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194794
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.18437
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141041
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969209
G1 X119.539 Y130.418 E.0008
G1 X121.346 Y130.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3093
G1 X120.763 Y130.168 E.01933
G1 X121.134 Y129.19 E.03468
G1 X123.439 Y126.885 E.10814
G1 X124.166 Y125.832 E.04242
G1 X120.156 Y125.832 E.13299
G1 X123.138 Y128.814 E.13985
G2 X123.326 Y129.392 I1.268 J-.092 E.02037
G1 X123.62 Y130.168 E.02752
G1 X123.432 Y130.168 E.00623
G1 X124.733 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392058
G1 F3093
G1 X125.044 Y130.545 E.00901
; LINE_WIDTH: 0.347926
G1 X125.226 Y130.567 E.00455
; LINE_WIDTH: 0.303792
G1 X125.408 Y130.589 E.00389
; LINE_WIDTH: 0.259658
G1 X125.589 Y130.611 E.00323
; LINE_WIDTH: 0.267708
G2 X126.368 Y130.589 I.175 J-7.581 E.01428
; LINE_WIDTH: 0.347925
G1 X126.55 Y130.567 E.00455
; LINE_WIDTH: 0.392058
G1 X126.732 Y130.545 E.00521
; LINE_WIDTH: 0.407888
G1 X127.043 Y130.487 E.00942
G1 X129.227 Y130.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3093
G1 X128.156 Y130.168 E.03552
G1 X128.354 Y129.646 E.01849
G1 X130.049 Y127.951 E.07952
G1 X130.038 Y128.038 E.0029
G1 X127.832 Y125.832 E.10347
G1 X129.461 Y125.832 E.05401
G1 X131.01 Y126.632 F30000
G1 F3093
G2 X130.535 Y127.52 I2.263 J1.784 E.03359
G1 X130.535 Y127.52 E0
G2 X130.5 Y128.739 I2.675 J.686 E.0408
G1 X131.196 Y130.575 E.06511
G1 X127.566 Y130.575 E.12041
G1 X128.225 Y128.837 E.06165
G2 X127.704 Y126.685 I-2.329 J-.575 E.07635
G1 X126.835 Y125.425 E.05076
G1 X131.843 Y125.425 E.16615
G1 X131.044 Y126.583 E.04666
G1 X134.868 Y126.351 F30000
G1 F3093
G1 X134.51 Y125.832 E.02089
G1 X135.508 Y125.832 E.03312
G1 X137.889 Y128.213 E.11167
G3 X137.874 Y127.802 I.826 J-.235 E.01378
G1 X135.508 Y130.168 E.11098
G1 X137.137 Y130.168 E.05401
G1 X138.334 Y127.395 F30000
G1 F3093
G2 X138.833 Y129.457 I2.342 J.524 E.07289
G1 X139.604 Y130.575 E.04506
G1 X134.382 Y130.575 E.17325
G1 X134.885 Y129.248 E.04708
G2 X134.876 Y127.08 I-2.088 J-1.076 E.07475
G1 X133.734 Y125.425 E.06668
G1 X139.081 Y125.425 E.17734
G1 X138.355 Y127.339 E.06788
G1 X140.098 Y125.827 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.464646
G1 F3093
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.499955
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535264
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562538
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499959
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464651
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429342
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F3093
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F3093
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F3093
G2 X143.629 Y130.154 I.986 J-149.52 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
M73 P91 R0
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F3093
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
G1 X140.639 Y130.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F3093
G2 X140.574 Y130.137 I-.001 J.112 E.00034
G1 X140.574 Y130.152 E.00007
; LINE_WIDTH: 0.128678
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203947
G1 X140.574 Y130.719 E.00248
G1 X133.671 Y130.473 F30000
; LINE_WIDTH: 0.482602
G1 F3093
G1 X133.384 Y130.508 E.01034
; LINE_WIDTH: 0.407222
G3 X132.48 Y130.542 I-.713 J-6.759 E.02689
; LINE_WIDTH: 0.396834
G1 X132.194 Y130.508 E.00832
; LINE_WIDTH: 0.439718
G1 X131.907 Y130.473 E.00933
; WIPE_START
G1 F24000
G1 X132.194 Y130.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.458 J-1.127 P1  F30000
G1 X123.79 Y127.093 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3093
G1 X124.941 Y125.425 E.0672
G1 X119.297 Y125.425 E.18724
G1 X120.241 Y126.794 E.05517
G3 X120.621 Y129.394 I-1.843 J1.597 E.09206
G1 X120.174 Y130.575 E.04187
G1 X124.21 Y130.575 E.13388
G1 X123.706 Y129.248 E.04708
G3 X123.756 Y127.142 I2.276 J-.999 E.07215
G1 X117.223 Y125.425 F30000
G1 F3093
G1 X115.95 Y126.698 E.05969
G1 X116.056 Y127.378 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.46603
G1 F3093
G1 X116.018 Y127.583 E.00719
; LINE_WIDTH: 0.423077
G2 X115.975 Y127.83 I2.033 J.479 E.00776
; LINE_WIDTH: 0.382297
G1 X115.958 Y128.108 E.00772
; LINE_WIDTH: 0.345047
G2 X115.942 Y128.42 I2.566 J.295 E.00768
; LINE_WIDTH: 0.314881
M73 P92 R0
G1 X115.958 Y128.698 E.00619
; LINE_WIDTH: 0.352981
G2 X115.98 Y129.018 I2.637 J-.02 E.00811
; LINE_WIDTH: 0.392414
G1 X116.018 Y129.224 E.00594
; LINE_WIDTH: 0.429222
G1 X116.056 Y129.429 E.00657
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.018 Y129.224 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/40
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
G3 Z6.8 I.206 J1.199 P1  F30000
G1 X131.62 Y126.55 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4037
G1 X131.649 Y126.524 E.0013
G1 X131.986 Y126.347 E.0126
G1 X132.077 Y126.299 E.00344
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.5 Y126.299 E.01605
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.575 Y126.59 E.01275
G1 X131.873 Y126.849 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4037
G1 X132.217 Y126.668 E.01194
G1 X132.595 Y126.575 E.01194
G3 X131.825 Y126.884 I.192 J1.594 E.28424
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17016
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.07 J-1.215 P1  F30000
G1 X125.124 Y126.356 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4037
G1 X125.159 Y126.338 E.00131
G1 X125.64 Y126.219 E.01645
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.944 Y128.261 E.01645
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.844 Y128.365 E.01297
G1 X123.831 Y128.261 E.00348
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.071 Y126.384 E.01315
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4037
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.501 Y127.863 E.01231
G1 X127.549 Y128.261 E.01231
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.233 Y128.318 E.01055
G1 X124.226 Y128.261 E.00176
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.246 Y126.735 E.01046
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.139 J-1.209 P1  F30000
G1 X116.286 Y128.364 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4037
G1 X116.343 Y127.899 E.01554
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.886 Y126.936 E.01333
G1 X119.965 Y127.006 E.00352
G1 X120.253 Y127.424 E.01684
G1 X120.433 Y127.899 E.01685
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.291 Y129.283 E.01333
G1 X120.253 Y129.382 E.00352
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01685
G1 X119.135 Y130.373 E.01685
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.509 E.01333
G1 X116.284 Y128.424 E.00284
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4037
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.626 Y127.23 E.01088
G1 X119.669 Y127.268 E.00179
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.924 Y129.144 E.01088
G1 X119.904 Y129.199 E.00179
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X118.995 Y130.004 E.01268
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.092 J1.213 P1  F30000
G1 X138.688 Y128.452 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4037
G1 X138.674 Y128.415 E.0013
G1 X138.617 Y127.947 E.01565
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.53 Y127.947 E.01565
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.709 Y128.508 E.01235
G1 X139.064 Y128.319 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4037
G3 X140.386 Y126.397 I1.51 J-.378 E.08103
G1 X140.762 Y126.397 E.01157
G3 X139.08 Y128.377 I-.188 J1.545 E.20596
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16536
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.634 E-.02244
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4037
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4037
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F4037
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F4037
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178235
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152592
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145857
G1 F4037
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194794
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.184369
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.14104
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969209
G1 X119.539 Y130.418 E.0008
G1 X119.838 Y130.628 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F4037
G1 X119.914 Y130.465 E.00499
G1 X119.904 Y130.384 E.00226
G1 X120.514 Y130.756 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.408584
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X120.514 Y129.167 E.08488
M106 S252.45
G1 X122.807 Y130.756 F30000
M106 S255
G1 F3000
G1 X122.807 Y125.447 E.2836
G1 X122.348 Y125.447 E.0245
G1 X122.348 Y130.553 E.27279
G1 X121.89 Y130.553 E.0245
G1 X121.89 Y125.447 E.27279
G1 X121.431 Y125.447 E.0245
G1 X121.431 Y130.553 E.27279
G1 X120.972 Y130.553 E.0245
G1 X120.972 Y125.447 E.27279
G1 X120.514 Y125.447 E.0245
G1 X120.514 Y127.151 E.09104
G1 X120.055 Y126.487 E.04313
G1 X120.055 Y125.447 E.05555
G1 X119.597 Y125.447 E.0245
G1 X119.597 Y126.179 E.0391
M106 S252.45
G1 X119.213 Y126.029 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.433999
; LAYER_HEIGHT: 0.2
G1 F4037
G1 X118.84 Y125.489 E.02091
G2 X115.994 Y125.469 I-3.512 J301.832 E.0907
G1 X115.994 Y126.968 E.04776
G1 X116.32 Y127.028 E.01057
G1 X116.533 Y126.729 E.01167
G1 X116.95 Y126.36 E.01776
G1 X117.481 Y126.075 E.0192
G1 X118.06 Y125.908 E.01921
G1 X118.667 Y125.902 E.01934
G1 X119.154 Y126.015 E.01596
G1 X117.159 Y125.833 F30000
; LINE_WIDTH: 0.393639
G1 F4037
G1 X116.358 Y125.833 E.02288
G1 X116.358 Y126.398 E.01615
G1 X116.818 Y126.012 E.01717
G1 X117.106 Y125.861 E.00928
G1 X116.056 Y127.378 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.466029
G1 F4037
G1 X116.018 Y127.583 E.00719
; LINE_WIDTH: 0.423077
G2 X115.975 Y127.83 I2.033 J.479 E.00776
; LINE_WIDTH: 0.382297
G1 X115.958 Y128.108 E.00772
; LINE_WIDTH: 0.345047
G2 X115.942 Y128.42 I2.566 J.295 E.00768
; LINE_WIDTH: 0.314883
G1 X115.958 Y128.698 E.00619
; LINE_WIDTH: 0.352983
G2 X115.98 Y129.018 I2.638 J-.02 E.00811
; LINE_WIDTH: 0.392418
G1 X116.018 Y129.224 E.00594
; LINE_WIDTH: 0.429224
G1 X116.056 Y129.429 E.00657
; WIPE_START
G1 F24000
G1 X116.018 Y129.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.073 J1.215 P1  F30000
G1 X123.724 Y128.763 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.408584
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X123.724 Y130.553 E.09564
G1 X123.265 Y130.553 E.0245
G1 X123.265 Y125.447 E.27279
G1 X123.724 Y125.447 E.0245
G1 X123.724 Y127.167 E.09189
G1 X124.183 Y126.487 E.04382
G1 X124.183 Y125.447 E.05555
G1 X124.641 Y125.447 E.0245
G1 X124.641 Y126.179 E.03911
M106 S252.45
G1 X126.727 Y125.961 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.417912
; LAYER_HEIGHT: 0.2
M73 P93 R0
G1 F4037
G1 X126.388 Y125.47 E.01825
G2 X125.388 Y125.47 I-.5 J17.256 E.03058
G1 X125.048 Y125.961 E.01825
G1 X125.571 Y125.835 E.01642
G1 X126.161 Y125.832 E.01802
G1 X126.669 Y125.948 E.01593
; WIPE_START
G1 F24000
G1 X126.161 Y125.832 E-.19815
G1 X125.571 Y125.835 E-.22413
G1 X125.048 Y125.961 E-.2042
G1 X125.248 Y125.672 E-.13352
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.099 J.522 P1  F30000
G1 X127.366 Y130.131 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.38292
G1 F4037
G1 X127.302 Y130.167 E.00204
G1 X127.351 Y130.195 E.00155
G1 X127.043 Y130.487 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407888
G1 F4037
G1 X126.732 Y130.545 E.00942
; LINE_WIDTH: 0.392058
G1 X126.55 Y130.567 E.00521
; LINE_WIDTH: 0.347925
G1 X126.368 Y130.589 E.00455
; LINE_WIDTH: 0.267708
G3 X125.589 Y130.611 I-.604 J-7.559 E.01428
; LINE_WIDTH: 0.259658
G1 X125.408 Y130.589 E.00323
; LINE_WIDTH: 0.303792
G1 X125.226 Y130.567 E.00389
; LINE_WIDTH: 0.347925
G1 X125.044 Y130.545 E.00455
; LINE_WIDTH: 0.392058
G1 X124.733 Y130.487 E.00901
G1 X124.454 Y130.133 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F4037
G1 X124.39 Y130.17 E.00204
G1 X124.439 Y130.198 E.00155
G1 X128.02 Y130.756 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.421994
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X127.77 Y130.097 E.04013
G1 X128.023 Y129.432 E.04056
G1 X128.448 Y130.553 E.06835
G1 X128.953 Y130.553 E.02877
G1 X128.26 Y128.727 E.11129
G1 X128.317 Y128.261 E.02677
G1 X128.246 Y127.679 E.03337
G1 X128.039 Y127.132 E.03337
G1 X127.188 Y125.899 E.08535
G1 X127.016 Y125.447 E.02757
G1 X127.521 Y125.447 E.02877
G1 X129.458 Y130.553 E.31121
G1 X129.962 Y130.553 E.02877
G1 X128.026 Y125.447 E.31121
G1 X128.531 Y125.447 E.02877
G1 X130.467 Y130.553 E.31121
G1 X130.972 Y130.553 E.02877
G1 X129.035 Y125.447 E.31121
G1 X129.54 Y125.447 E.02877
G1 X130.45 Y127.846 E.1462
G1 X130.479 Y127.606 E.01377
G1 X130.671 Y127.099 E.03091
G1 X130.045 Y125.447 E.10067
G1 X130.55 Y125.447 E.02877
G1 X130.994 Y126.618 E.07139
G1 X131.32 Y126.146 E.03268
G1 X131.055 Y125.447 E.04263
G1 X131.559 Y125.447 E.02877
G1 X131.733 Y125.904 E.02788
M106 S252.45
G1 X131.961 Y125.932 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.400894
; LAYER_HEIGHT: 0.2
G1 F4037
G1 X132.48 Y125.808 E.01555
G1 X133.056 Y125.805 E.01679
G1 X133.616 Y125.932 E.01678
G1 X133.292 Y125.461 E.01666
G2 X132.286 Y125.461 I-.503 J15.098 E.02937
G1 X131.995 Y125.882 E.01491
G1 X133.714 Y125.244 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.411017
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X134.109 Y126.287 E.0603
M106 S252.45
G1 X134.469 Y129.835 F30000
M106 S255
G1 F3000
G1 X134.741 Y130.553 E.04153
G1 X135.234 Y130.553 E.02665
G1 X134.823 Y129.47 E.0626
G1 X135.07 Y128.82 E.03758
G1 X135.727 Y130.553 E.10019
G1 X136.22 Y130.553 E.02665
G1 X134.284 Y125.447 E.29523
G1 X134.777 Y125.447 E.02665
G1 X136.713 Y130.553 E.29523
G1 X137.206 Y130.553 E.02665
G1 X135.27 Y125.447 E.29523
G1 X135.763 Y125.447 E.02665
G1 X137.699 Y130.553 E.29523
G1 X138.192 Y130.553 E.02665
G1 X136.256 Y125.447 E.29523
G1 X136.749 Y125.447 E.02665
G1 X138.686 Y130.553 E.29523
G1 X139.179 Y130.553 E.02665
G1 X137.242 Y125.447 E.29523
G1 X137.735 Y125.447 E.02665
G1 X138.392 Y127.18 E.10019
G1 X138.639 Y126.53 E.03758
G1 X138.228 Y125.447 E.06261
G1 X138.721 Y125.447 E.02665
G1 X138.994 Y126.165 E.04154
M106 S252.45
G1 X139.411 Y125.846 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.552226
; LAYER_HEIGHT: 0.2
G1 F4037
G1 X139.434 Y125.722 E.00527
; LINE_WIDTH: 0.495871
G3 X139.479 Y125.557 I.29 J-.01 E.00641
G1 X140.098 Y125.827 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.464649
G1 F4037
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.499958
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535266
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562538
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499955
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464647
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.429338
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F4037
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F4037
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F4037
G2 X143.629 Y130.154 I.986 J-149.398 E.04448
G2 X143.629 Y126.63 I-438.368 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F4037
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.559 Y125.469 E.07517
G1 X141.681 Y125.735 E.00898
G1 X141.621 Y125.86 E.00426
G1 X141.927 Y126.027 E.01071
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
G1 X140.639 Y130.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103205
G1 F4037
G2 X140.574 Y130.137 I-.001 J.112 E.00034
G1 X140.574 Y130.152 E.00007
; LINE_WIDTH: 0.128674
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166309
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203943
G1 X140.574 Y130.719 E.00248
G1 X140.029 Y130.238 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.593102
G1 F4037
G2 X140.034 Y130.35 I-.03 J.057 E.01212
G1 X134.091 Y130.183 F30000
; LINE_WIDTH: 0.47495
G1 F4037
G2 X134.085 Y130.276 I-.027 J.045 E.00758
G1 X133.671 Y130.473 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.482602
G1 F4037
G1 X133.384 Y130.508 E.01034
; LINE_WIDTH: 0.407222
G3 X132.48 Y130.542 I-.713 J-6.759 E.02689
; LINE_WIDTH: 0.396834
G1 X132.194 Y130.508 E.00832
; LINE_WIDTH: 0.439718
G1 X131.907 Y130.473 E.00933
G1 X131.541 Y130.183 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.474952
G1 F4037
G2 X131.535 Y130.276 I-.027 J.045 E.00758
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.487 Y130.276 E-.17373
G1 X131.46 Y130.229 E-.19542
G1 X131.487 Y130.183 E-.19542
G1 X131.541 Y130.183 E-.19542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/40
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
G3 Z7 I1.216 J.047 P1  F30000
G1 X131.684 Y126.506 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3913
G1 X132.077 Y126.299 E.01474
G1 X132.547 Y126.183 E.01605
G1 X133.031 Y126.183 E.01605
G1 X133.412 Y126.277 E.01301
G1 X133.5 Y126.299 E.00304
G1 X133.929 Y126.524 E.01605
G1 X134.291 Y126.845 E.01605
G1 X134.566 Y127.243 E.01605
G1 X134.737 Y127.695 E.01605
G1 X134.795 Y128.175 E.01605
G1 X134.737 Y128.655 E.01605
G1 X134.566 Y129.108 E.01605
G1 X134.291 Y129.506 E.01605
G1 X133.929 Y129.826 E.01605
G1 X133.5 Y130.051 E.01605
G1 X133.031 Y130.167 E.01605
G1 X132.547 Y130.167 E.01605
G1 X132.077 Y130.051 E.01605
G1 X131.649 Y129.826 E.01605
G1 X131.287 Y129.506 E.01605
G1 X131.012 Y129.108 E.01605
G1 X130.841 Y128.655 E.01605
G1 X130.782 Y128.175 E.01605
G1 X130.841 Y127.695 E.01605
G1 X131.012 Y127.243 E.01605
G1 X131.287 Y126.845 E.01605
G1 X131.634 Y126.538 E.01536
G1 X131.874 Y126.85 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3913
G3 X132.595 Y126.575 I.915 J1.319 E.02392
G1 X132.983 Y126.575 E.01194
G1 X133.36 Y126.668 E.01194
G3 X131.826 Y126.885 I-.571 J1.501 E.26031
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y126.668 E-.17011
G1 X132.595 Y126.575 E-.14763
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14699
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.074 J-1.215 P1  F30000
G1 X125.197 Y126.328 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3913
G1 X125.64 Y126.219 E.01514
G1 X126.136 Y126.219 E.01645
G1 X126.617 Y126.338 E.01645
G1 X127.056 Y126.568 E.01645
G1 X127.427 Y126.897 E.01645
G1 X127.709 Y127.305 E.01645
G1 X127.885 Y127.769 E.01645
G1 X127.896 Y127.86 E.00306
G1 X127.944 Y128.261 E.01339
G1 X127.885 Y128.753 E.01645
G1 X127.709 Y129.216 E.01645
G1 X127.427 Y129.624 E.01645
G1 X127.056 Y129.953 E.01645
G1 X126.617 Y130.184 E.01645
G1 X126.136 Y130.302 E.01645
G1 X125.64 Y130.302 E.01645
G1 X125.159 Y130.184 E.01645
G1 X124.72 Y129.953 E.01645
G1 X124.349 Y129.624 E.01645
G1 X124.067 Y129.216 E.01645
G1 X123.891 Y128.753 E.01645
G1 X123.831 Y128.261 E.01645
G1 X123.891 Y127.769 E.01645
G1 X124.067 Y127.305 E.01645
G1 X124.349 Y126.897 E.01645
G1 X124.72 Y126.568 E.01645
G1 X125.077 Y126.381 E.01339
G1 X125.141 Y126.347 E.00238
G1 X125.299 Y126.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3913
G1 X125.688 Y126.611 E.01231
G1 X126.088 Y126.611 E.01231
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.507 Y127.907 E.01364
G1 X127.549 Y128.261 E.01094
G1 X127.501 Y128.658 E.01231
G1 X127.359 Y129.033 E.01231
G1 X127.132 Y129.363 E.01231
G1 X126.832 Y129.628 E.01231
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.299 Y129.814 E.01231
G1 X124.944 Y129.628 E.01231
G1 X124.644 Y129.363 E.01231
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.226 Y128.261 E.01231
G1 X124.275 Y127.863 E.01231
G1 X124.417 Y127.489 E.01231
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.246 Y126.735 E.01046
M204 S10000
; WIPE_START
G1 F24000
G1 X125.688 Y126.611 E-.17443
G1 X126.088 Y126.611 E-.15221
G1 X126.477 Y126.707 E-.15221
G1 X126.832 Y126.893 E-.15221
G1 X127.086 Y127.118 E-.12894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.148 J-1.208 P1  F30000
G1 X116.286 Y128.443 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3913
G1 X116.282 Y128.403 E.00131
G1 X116.343 Y127.899 E.01685
G1 X116.523 Y127.424 E.01685
G1 X116.811 Y127.006 E.01685
G1 X117.191 Y126.67 E.01685
G1 X117.641 Y126.434 E.01685
G1 X118.134 Y126.312 E.01685
G1 X118.642 Y126.312 E.01685
G1 X119.135 Y126.434 E.01685
G1 X119.585 Y126.67 E.01685
G1 X119.965 Y127.006 E.01685
G1 X120.253 Y127.424 E.01685
G1 X120.433 Y127.899 E.01684
G1 X120.495 Y128.403 E.01685
G1 X120.433 Y128.907 E.01685
G1 X120.253 Y129.382 E.01685
G1 X119.965 Y129.8 E.01685
G1 X119.585 Y130.137 E.01684
G1 X119.503 Y130.18 E.00308
G1 X119.135 Y130.373 E.01377
G1 X118.642 Y130.494 E.01685
G1 X118.134 Y130.494 E.01685
G1 X117.641 Y130.373 E.01685
G1 X117.191 Y130.137 E.01685
G1 X116.811 Y129.8 E.01685
G1 X116.523 Y129.382 E.01685
G1 X116.343 Y128.907 E.01685
G1 X116.294 Y128.502 E.01355
G1 X116.677 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3913
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.32 Y129.833 E.01403
G1 X118.995 Y130.004 E.01129
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17901
G1 X116.873 Y127.608 E-.15679
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.088 J1.214 P1  F30000
G1 X138.67 Y128.376 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3913
G1 X138.617 Y127.947 E.01434
G1 X138.674 Y127.479 E.01565
G1 X138.842 Y127.038 E.01565
G1 X139.109 Y126.65 E.01565
G1 X139.463 Y126.337 E.01565
G1 X139.88 Y126.118 E.01565
G1 X140.338 Y126.005 E.01565
G1 X140.81 Y126.005 E.01565
G1 X141.268 Y126.118 E.01565
G1 X141.685 Y126.337 E.01565
G1 X142.038 Y126.65 E.01565
G1 X142.306 Y127.038 E.01565
G1 X142.474 Y127.479 E.01565
G1 X142.485 Y127.569 E.00301
G1 X142.53 Y127.947 E.01263
G1 X142.474 Y128.415 E.01565
G1 X142.306 Y128.856 E.01565
G1 X142.038 Y129.244 E.01565
G1 X141.685 Y129.557 E.01565
G1 X141.268 Y129.776 E.01565
G1 X140.81 Y129.889 E.01565
G1 X140.338 Y129.889 E.01565
G1 X139.88 Y129.776 E.01565
G1 X139.463 Y129.557 E.01565
G1 X139.109 Y129.244 E.01565
G1 X138.842 Y128.856 E.01565
G1 X138.682 Y128.435 E.01496
G1 X139.065 Y128.319 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3913
G3 X140.386 Y126.397 I1.509 J-.378 E.08102
G1 X140.762 Y126.397 E.01157
G3 X139.081 Y128.377 I-.188 J1.544 E.20589
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16534
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.634 E-.02246
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.213 J-1.198 P1  F30000
G1 X115.602 Y130.923 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3913
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3913
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.687 J1.005 P1  F30000
G1 X116.752 Y130.34 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522985
G1 F3913
G1 X116.46 Y130.072 E.01547
G1 X116.297 Y129.836 E.01126
G1 X116.046 Y129.882 E.00999
G1 X116.046 Y130.479 E.02338
G1 X116.721 Y130.479 E.02641
G1 X116.723 Y130.391 E.00345
G1 X117.237 Y130.418 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F3913
G1 X117.387 Y130.521 E.0014
; LINE_WIDTH: 0.178235
G1 X117.537 Y130.625 E.00201
; LINE_WIDTH: 0.152594
G1 X117.571 Y130.643 E.00035
G1 X117.786 Y130.67 E.00193
; LINE_WIDTH: 0.0969204
G1 X118.001 Y130.696 E.00095
G1 X118.776 Y130.696 F30000
; LINE_WIDTH: 0.145858
G1 F3913
G1 X118.991 Y130.67 E.00182
; LINE_WIDTH: 0.194796
G1 X119.205 Y130.643 E.00268
; LINE_WIDTH: 0.18437
G1 X119.225 Y130.633 E.00025
; LINE_WIDTH: 0.141041
G2 X119.389 Y130.521 I-.835 J-1.4 E.00159
; LINE_WIDTH: 0.0969211
G1 X119.539 Y130.418 E.0008
G1 X116.056 Y129.429 F30000
; LINE_WIDTH: 0.429222
G1 F3913
G1 X116.018 Y129.224 E.00657
; LINE_WIDTH: 0.392416
G1 X115.98 Y129.018 E.00594
; LINE_WIDTH: 0.352983
G3 X115.958 Y128.698 I2.616 J-.34 E.00811
; LINE_WIDTH: 0.314883
G1 X115.942 Y128.42 E.00619
; LINE_WIDTH: 0.345047
G3 X115.958 Y128.108 I2.582 J-.016 E.00768
; LINE_WIDTH: 0.382297
G1 X115.975 Y127.83 E.00772
; LINE_WIDTH: 0.423077
G3 X116.018 Y127.583 I2.076 J.232 E.00776
; LINE_WIDTH: 0.46603
G1 X116.056 Y127.378 E.00719
; WIPE_START
M73 P94 R0
G1 F24000
G1 X116.018 Y127.583 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.385 J1.155 P1  F30000
G1 X124.733 Y130.487 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.392058
G1 F3913
G1 X125.044 Y130.545 E.00901
; LINE_WIDTH: 0.347925
G1 X125.226 Y130.567 E.00455
; LINE_WIDTH: 0.303791
G1 X125.408 Y130.589 E.00389
; LINE_WIDTH: 0.259658
G1 X125.589 Y130.611 E.00323
; LINE_WIDTH: 0.267707
G2 X126.368 Y130.589 I.175 J-7.581 E.01428
; LINE_WIDTH: 0.347925
G1 X126.55 Y130.567 E.00455
; LINE_WIDTH: 0.392058
G1 X126.732 Y130.545 E.00521
; LINE_WIDTH: 0.407888
G1 X127.043 Y130.487 E.00942
G1 X131.907 Y130.473 F30000
; LINE_WIDTH: 0.439719
G1 F3913
G1 X132.194 Y130.508 E.00933
; LINE_WIDTH: 0.396834
G1 X132.48 Y130.542 E.00832
; LINE_WIDTH: 0.407221
G2 X133.384 Y130.508 I.191 J-6.794 E.02689
; LINE_WIDTH: 0.4826
G1 X133.671 Y130.473 E.01034
G1 X136.7 Y127.969 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450834
G1 F3913
G1 X136.707 Y128.205 E.00785
; LINE_WIDTH: 0.48786
G1 X136.714 Y128.441 E.00857
; LINE_WIDTH: 0.524886
G1 X136.72 Y128.677 E.00928
; LINE_WIDTH: 0.561912
G1 X136.723 Y128.766 E.00376
; LINE_WIDTH: 0.598368
G1 X136.726 Y128.855 E.00402
G1 X136.454 Y126.947 F30000
; LINE_WIDTH: 0.359529
G1 F3913
G1 X136.591 Y127.445 E.01332
G1 X136.645 Y127.707 E.0069
; LINE_WIDTH: 0.435561
G1 X136.7 Y127.969 E.00856
G1 X136.794 Y127.445 E.01703
; LINE_WIDTH: 0.359529
G1 X136.887 Y126.947 E.01306
G1 X136.514 Y126.947 E.00963
G1 X135.94 Y126.6 F30000
; LINE_WIDTH: 0.419999
G1 F3913
G1 X136.17 Y127.178 E.01911
G3 X136.311 Y128.334 I-4.284 J1.107 E.0359
G1 X136.246 Y128.863 E.01638
G1 X136.084 Y129.4 E.01721
G1 X137.418 Y129.4 E.041
G1 X137.197 Y128.794 E.01981
G3 X137.165 Y127.271 I3.999 J-.847 E.0471
G1 X137.378 Y126.6 E.02161
G1 X136 Y126.6 E.04236
G1 X135.255 Y126.223 F30000
; LINE_WIDTH: 0.419999
G1 F3913
G1 X135.629 Y126.813 E.02146
G1 X135.818 Y127.312 E.01638
G3 X135.872 Y128.818 I-3.512 J.881 E.04666
G1 X135.629 Y129.537 E.02333
G1 X135.497 Y129.777 E.0084
G1 X138.084 Y129.777 E.07951
G1 X137.779 Y129.286 E.01776
G1 X137.594 Y128.799 E.01601
G3 X137.539 Y127.316 I3.453 J-.869 E.04592
G1 X137.779 Y126.608 E.02296
G1 X138.011 Y126.223 E.01382
G1 X135.315 Y126.223 E.08285
G1 X134.31 Y125.851 F30000
; LINE_WIDTH: 0.419999
G1 F3913
G1 X134.819 Y126.285 E.02058
G1 X135.213 Y126.826 E.02055
G1 X135.465 Y127.445 E.02055
G1 X135.562 Y128.107 E.02055
G1 X135.499 Y128.766 E.02034
G1 X135.276 Y129.403 E.02075
G1 X134.91 Y129.963 E.02055
G1 X134.719 Y130.154 E.00828
G2 X138.969 Y130.151 I1.864 J-438.191 E.13059
G1 X138.581 Y129.804 E.01601
G1 X138.194 Y129.273 E.02018
G1 X137.946 Y128.665 E.02018
G3 X137.851 Y127.879 I4.015 J-.886 E.02437
G1 X137.914 Y127.362 E.01601
G1 X138.131 Y126.742 E.02018
G1 X138.491 Y126.192 E.02018
G1 X138.856 Y125.846 E.01548
G1 X134.37 Y125.849 E.13785
; WIPE_START
G1 F24000
G1 X136.37 Y125.848 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.537 J-1.092 P1  F30000
G1 X129.414 Y129.264 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.575432
G1 F3913
G2 X129.418 Y129.374 I-.029 J.056 E.01128
G1 X130.391 Y128.201 F30000
; LINE_WIDTH: 0.418402
G1 F3913
G1 X130.446 Y127.697 E.01551
G1 X130.654 Y127.081 E.01991
G1 X130.978 Y126.602 E.01769
G1 X131.408 Y126.214 E.01769
G1 X131.917 Y125.94 E.01769
G1 X132.48 Y125.808 E.01769
G1 X133.056 Y125.805 E.01761
G1 X133.618 Y125.924 E.0176
G1 X134.133 Y126.188 E.01769
G1 X134.569 Y126.568 E.01769
G1 X134.902 Y127.04 E.01769
G1 X135.112 Y127.579 E.01769
G1 X135.188 Y128.152 E.01769
G1 X135.124 Y128.72 E.01748
G1 X134.923 Y129.27 E.0179
G1 X134.599 Y129.749 E.01769
G1 X134.17 Y130.136 E.01769
G1 X134.034 Y130.214 E.00479
G1 X134.073 Y130.531 E.00977
G1 X140.085 Y130.531 E.18396
G1 X140.094 Y130.233 E.00912
G1 X139.72 Y130.135 E.01184
G1 X139.258 Y129.893 E.01594
G1 X138.831 Y129.522 E.01732
G1 X138.505 Y129.059 E.01733
G1 X138.299 Y128.531 E.01733
G1 X138.225 Y127.97 E.01733
G1 X138.288 Y127.407 E.01733
G1 X138.484 Y126.876 E.01733
G1 X138.801 Y126.407 E.01733
G1 X139.221 Y126.027 E.01732
G1 X139.52 Y125.864 E.01042
G1 X139.453 Y125.731 E.00456
G1 X139.57 Y125.469 E.00876
G1 X133.674 Y125.469 E.1804
G2 X125.615 Y125.464 I-5.1 J1804.734 E.24656
G3 X119.325 Y125.469 I-3.463 J-417.301 E.19248
; LINE_WIDTH: 0.423998
G3 X117.452 Y125.469 I-.936 J-21.87 E.05817
G1 X115.994 Y125.469 E.04526
G1 X115.994 Y126.968 E.04654
G1 X116.32 Y127.028 E.0103
G1 X116.533 Y126.729 E.01137
G1 X116.95 Y126.36 E.0173
G1 X117.481 Y126.075 E.01871
G1 X118.06 Y125.908 E.01872
G1 X118.667 Y125.902 E.01884
G1 X119.253 Y126.059 E.01885
G1 X119.789 Y126.334 E.01871
G1 X120.243 Y126.729 E.01871
G1 X120.59 Y127.222 E.01871
G1 X120.809 Y127.783 E.01871
G1 X120.887 Y128.381 E.01871
G1 X120.82 Y128.979 E.01871
G1 X120.611 Y129.544 E.01871
G1 X120.273 Y130.043 E.01871
G1 X119.956 Y130.332 E.01332
G1 X120.022 Y130.432 E.00371
G1 X119.994 Y130.531 E.00319
G1 X124.326 Y130.531 E.13452
G1 X124.39 Y130.185 E.01093
G1 X124.04 Y129.868 E.01466
G1 X123.73 Y129.419 E.01693
G1 X123.516 Y128.869 E.01833
G1 X123.444 Y128.326 E.01699
G3 X123.73 Y127.103 I2.92 J.037 E.03933
G1 X124.04 Y126.654 E.01693
G1 X124.478 Y126.258 E.01833
G1 X124.998 Y125.979 E.01833
G1 X125.571 Y125.836 E.01833
; LINE_WIDTH: 0.419302
G1 X126.161 Y125.832 E.01808
G1 X126.735 Y125.963 E.01807
G1 X127.26 Y126.233 E.01811
G1 X127.706 Y126.62 E.01811
G1 X128.046 Y127.103 E.01811
G1 X128.232 Y127.579 E.01569
G1 X128.326 Y128.152 E.01782
G1 X128.283 Y128.727 E.01768
G1 X128.067 Y129.379 E.02105
G1 X127.736 Y129.868 E.01811
G1 X127.386 Y130.185 E.01448
G1 X127.45 Y130.531 E.0108
G1 X131.505 Y130.531 E.12437
G1 X131.543 Y130.214 E.00979
G1 X131.408 Y130.136 E.0048
G1 X131.009 Y129.783 E.01635
G1 X130.676 Y129.31 E.01774
G1 X130.465 Y128.771 E.01774
G1 X130.398 Y128.26 E.01581
G1 X130.016 Y128.243 F30000
; LINE_WIDTH: 0.419999
G1 F3913
G1 X130.071 Y127.651 E.01827
G3 X130.365 Y126.826 I3.805 J.89 E.02697
G1 X130.668 Y126.387 E.01638
G1 X131.158 Y125.932 E.02055
G1 X131.268 Y125.851 E.00421
G2 X127.336 Y125.846 I-2.304 J312.424 E.12083
G1 X127.548 Y125.976 E.00764
G1 X127.956 Y126.338 E.01675
G1 X128.356 Y126.888 E.02092
G3 X128.645 Y127.651 I-3.512 J1.768 E.02512
G1 X128.711 Y128.193 E.01675
G3 X128.603 Y129.027 I-3.647 J-.046 E.02591
G1 X128.419 Y129.512 E.01595
G1 X128.046 Y130.082 E.02092
G1 X127.982 Y130.154 E.00296
G1 X130.859 Y130.154 E.08838
G1 X130.668 Y129.963 E.00828
G1 X130.365 Y129.524 E.01638
G3 X130.023 Y128.303 I2.73 J-1.423 E.03925
G1 X129.592 Y128.125 F30000
; LINE_WIDTH: 0.507938
G1 F3913
G1 X129.644 Y127.866 E.01004
; LINE_WIDTH: 0.42233
G3 X129.949 Y126.813 I4.322 J.681 E.03397
G1 X130.323 Y126.223 E.02159
G2 X128.358 Y126.225 I-.71 J385.172 E.06076
G1 X128.666 Y126.674 E.01686
G1 X128.937 Y127.312 E.02141
; LINE_WIDTH: 0.419999
G1 X129.023 Y127.685 E.01176
; LINE_WIDTH: 0.454446
G1 X129.109 Y128.057 E.01283
; LINE_WIDTH: 0.488893
G1 X129.135 Y128.313 E.00933
; LINE_WIDTH: 0.508192
G1 X129.083 Y128.565 E.00978
; LINE_WIDTH: 0.423416
G3 X128.772 Y129.646 I-4.723 J-.775 E.03495
G1 X128.703 Y129.777 E.00458
G1 X130.081 Y129.777 E.04272
G1 X129.806 Y129.161 E.02092
; LINE_WIDTH: 0.419999
G1 X129.712 Y128.77 E.01236
; LINE_WIDTH: 0.454873
G1 X129.617 Y128.379 E.0135
; LINE_WIDTH: 0.489746
G1 X129.598 Y128.185 E.00708
G1 X129.354 Y127.376 F30000
; LINE_WIDTH: 0.423282
G1 F3913
G3 X129.635 Y126.602 I5.164 J1.442 E.02554
G1 X129.053 Y126.602 E.01805
G3 X129.336 Y127.318 I-3.933 J1.967 E.0239
G1 X124.44 Y125.846 F30000
; LINE_WIDTH: 0.419999
G1 F3913
G1 X119.671 Y125.846 E.14655
G1 X120.076 Y126.078 E.01434
G1 X120.493 Y126.447 E.01712
G1 X120.9 Y127.008 E.02129
G3 X121.261 Y128.335 I-2.915 J1.505 E.04258
G3 X120.964 Y129.678 I-3.319 J-.031 E.04257
G1 X120.655 Y130.154 E.01742
G1 X123.793 Y130.154 E.09642
G1 X123.42 Y129.633 E.01969
G1 X123.163 Y129.003 E.02092
G3 X123.131 Y127.651 I3.147 J-.752 E.04184
G1 X123.357 Y127.009 E.02092
G1 X123.73 Y126.44 E.02092
G1 X124.228 Y125.976 E.02092
G1 X124.389 Y125.878 E.0058
G1 X123.418 Y126.225 F30000
G1 F3913
G2 X120.795 Y126.223 I-1.584 J514.125 E.0806
G1 X121.211 Y126.794 E.02168
G3 X121.568 Y127.736 I-4.146 J2.112 E.03105
G1 X121.635 Y128.29 E.01712
G3 X121.514 Y129.291 I-4.38 J-.024 E.03106
G1 X121.33 Y129.777 E.01597
G1 X123.073 Y129.777 E.05356
G1 X122.811 Y129.136 E.02126
G3 X122.691 Y128.147 I4.122 J-1.002 E.03069
G1 X122.756 Y127.606 E.01675
G1 X123.004 Y126.875 E.0237
G1 X123.386 Y126.275 E.02186
G1 X122.726 Y126.6 F30000
G1 F3913
G1 X121.532 Y126.6 E.03667
G3 X121.943 Y127.691 I-4.081 J2.159 E.0359
G1 X121.99 Y128.247 E.01713
; LINE_WIDTH: 0.38062
G1 X121.982 Y128.604 E.00985
; LINE_WIDTH: 0.411954
G1 X121.973 Y128.962 E.01077
; LINE_WIDTH: 0.460815
G1 X121.904 Y129.375 E.01424
G1 X122.472 Y129.375 E.01932
G1 X122.382 Y129.097 E.00993
; LINE_WIDTH: 0.466209
G1 X122.364 Y128.829 E.00927
; LINE_WIDTH: 0.409878
G3 X122.382 Y127.56 I5.688 J-.555 E.03802
G3 X122.702 Y126.656 I3.928 J.882 E.02877
G1 X122.163 Y126.948 F30000
; LINE_WIDTH: 0.449272
G1 F3913
G2 X122.154 Y127.036 I-.025 J.042 E.00652
G1 X117.159 Y125.833 F30000
; LINE_WIDTH: 0.393638
G1 F3913
G1 X116.358 Y125.833 E.02288
G1 X116.358 Y126.398 E.01615
G1 X116.818 Y126.012 E.01717
G1 X117.106 Y125.861 E.00928
G1 X140.098 Y125.827 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.464646
G1 F3913
G1 X140.17 Y125.737 E.00397
; LINE_WIDTH: 0.499955
G1 X140.242 Y125.646 E.00431
; LINE_WIDTH: 0.535264
G1 X140.313 Y125.555 E.00464
; LINE_WIDTH: 0.562538
G1 X140.326 Y125.541 E.0008
G1 X140.822 Y125.541 E.021
G1 X140.834 Y125.555 E.0008
; LINE_WIDTH: 0.499957
G1 X140.906 Y125.646 E.00431
; LINE_WIDTH: 0.464649
G1 X140.978 Y125.737 E.00397
; LINE_WIDTH: 0.42934
G1 X141.049 Y125.827 E.00364
G1 X143.241 Y126.213 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499002
G1 F3913
G2 X143.238 Y126.312 I-.029 J.049 E.00867
G1 X143.219 Y129.657 F30000
; LINE_WIDTH: 0.549332
G1 F3913
G2 X143.22 Y129.764 I-.026 J.054 E.0101
G1 X142.179 Y130.151 F30000
; LINE_WIDTH: 0.419336
G1 F3913
G2 X143.629 Y130.154 I.986 J-149.612 E.04448
G2 X143.629 Y126.63 I-438.369 J-1.762 E.10809
G1 X143.629 Y125.846 E.02403
G1 X142.291 Y125.846 E.04102
G1 X142.657 Y126.192 E.01545
G1 X142.953 Y126.621 E.01598
G1 X143.204 Y127.228 E.02014
G1 X143.286 Y127.88 E.02015
G1 X143.239 Y128.533 E.02008
G1 X143.017 Y129.152 E.02017
G1 X142.657 Y129.702 E.02014
G1 X142.222 Y130.11 E.0183
G1 X141.054 Y130.233 F30000
; LINE_WIDTH: 0.419999
G1 F3913
G1 X141.062 Y130.531 E.00916
G1 X144.006 Y130.531 E.09044
G1 X144.006 Y125.469 E.15553
G1 X141.539 Y125.469 E.07579
G1 X141.677 Y125.736 E.00923
G1 X141.619 Y125.859 E.00417
G1 X141.927 Y126.027 E.01078
G1 X142.317 Y126.373 E.01601
G1 X142.643 Y126.835 E.0174
G1 X142.849 Y127.363 E.0174
G1 X142.923 Y127.924 E.0174
G1 X142.86 Y128.487 E.0174
G1 X142.664 Y129.018 E.0174
G1 X142.347 Y129.488 E.0174
G1 X141.927 Y129.867 E.0174
G1 X141.428 Y130.135 E.0174
G1 X141.112 Y130.218 E.01005
G1 X140.639 Y130.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103206
G1 F3913
G2 X140.574 Y130.137 I-.001 J.112 E.00034
G1 X140.574 Y130.152 E.00007
; LINE_WIDTH: 0.128678
G1 X140.574 Y130.341 E.00132
; LINE_WIDTH: 0.166312
G1 X140.574 Y130.53 E.0019
; LINE_WIDTH: 0.203946
G1 X140.574 Y130.719 E.00248
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.574 Y130.53 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/40
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
G3 Z7.2 I.474 J-1.121 P1  F30000
G1 X131.874 Y126.85 Z7.2
G1 Z7
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5214
G3 X132.595 Y126.575 I.915 J1.32 E.02392
G1 X132.983 Y126.575 E.01194
M73 P95 R0
G3 X131.826 Y126.885 I-.194 J1.594 E.27228
M204 S10000
; WIPE_START
G1 F24000
G1 X132.221 Y126.668 E-.17126
G1 X132.595 Y126.575 E-.14636
G1 X132.983 Y126.575 E-.14763
G1 X133.36 Y126.668 E-.14763
G1 X133.703 Y126.848 E-.14711
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.02 J-1.217 P1  F30000
G1 X125.298 Y126.709 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F5214
G1 X125.687 Y126.611 E.01233
G1 X126.088 Y126.611 E.01232
G1 X126.477 Y126.707 E.01231
G1 X126.832 Y126.893 E.01231
G1 X127.132 Y127.159 E.01231
G1 X127.359 Y127.489 E.01231
G1 X127.499 Y127.857 E.0121
G1 X127.55 Y128.26 E.0125
G1 X127.501 Y128.658 E.01232
G1 X127.362 Y129.027 E.0121
G1 X127.132 Y129.362 E.0125
G1 X126.832 Y129.628 E.01232
G1 X126.477 Y129.814 E.01231
G1 X126.088 Y129.91 E.01231
G1 X125.688 Y129.91 E.01231
G1 X125.305 Y129.816 E.0121
G1 X124.944 Y129.628 E.0125
G1 X124.644 Y129.363 E.01232
G1 X124.417 Y129.033 E.01231
G1 X124.275 Y128.658 E.01231
G1 X124.227 Y128.267 E.0121
G1 X124.275 Y127.863 E.0125
G1 X124.417 Y127.489 E.01232
G1 X124.644 Y127.159 E.01231
G1 X124.944 Y126.893 E.01231
G1 X125.244 Y126.736 E.01042
M204 S10000
; WIPE_START
G1 F24000
G1 X125.687 Y126.611 E-.17483
G1 X126.088 Y126.611 E-.15238
G1 X126.477 Y126.707 E-.1522
G1 X126.832 Y126.893 E-.15222
G1 X127.085 Y127.117 E-.12837
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.149 J-1.208 P1  F30000
G1 X116.677 Y128.403 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F5214
G1 X116.726 Y127.994 E.01268
G1 X116.873 Y127.608 E.01268
G1 X117.107 Y127.268 E.01268
G1 X117.416 Y126.995 E.01268
G1 X117.781 Y126.803 E.01268
G1 X118.182 Y126.704 E.01268
G1 X118.594 Y126.704 E.01268
G1 X118.995 Y126.803 E.01268
G1 X119.36 Y126.995 E.01268
G1 X119.669 Y127.268 E.01268
G1 X119.904 Y127.608 E.01268
G1 X120.05 Y127.994 E.01268
G1 X120.1 Y128.403 E.01268
G1 X120.05 Y128.813 E.01268
G1 X119.904 Y129.199 E.01268
G1 X119.669 Y129.538 E.01268
G1 X119.36 Y129.812 E.01268
G1 X118.995 Y130.004 E.01268
G1 X118.594 Y130.102 E.01268
G1 X118.182 Y130.102 E.01268
G1 X117.781 Y130.004 E.01268
G1 X117.416 Y129.812 E.01268
G1 X117.107 Y129.538 E.01268
G1 X116.873 Y129.199 E.01268
G1 X116.726 Y128.813 E.01268
G1 X116.684 Y128.463 E.01084
M204 S10000
; WIPE_START
G1 F24000
G1 X116.726 Y127.994 E-.17903
G1 X116.873 Y127.608 E-.15677
G1 X117.107 Y127.268 E-.15679
G1 X117.416 Y126.995 E-.15679
G1 X117.674 Y126.859 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.083 J1.214 P1  F30000
G1 X139.065 Y128.319 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F5214
G3 X140.386 Y126.397 I1.509 J-.378 E.08102
G1 X140.762 Y126.397 E.01157
G3 X139.08 Y128.377 I-.188 J1.544 E.20593
M204 S10000
; WIPE_START
G1 F24000
G1 X139.012 Y127.947 E-.16535
G1 X139.058 Y127.573 E-.14305
G1 X139.191 Y127.221 E-.14305
G1 X139.405 Y126.912 E-.14305
G1 X139.687 Y126.662 E-.14305
G1 X139.739 Y126.634 E-.02245
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.228 J-1.195 P1  F30000
G1 X115.21 Y131.315 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F5214
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
G1 X115.27 Y131.315 E.90707
M204 S10000
; WIPE_START
G1 F24000
G1 X115.252 Y129.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.167 J1.205 P1  F30000
G1 X144.583 Y125.251 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F5214
G1 X144.224 Y124.892 E.0156
G1 X143.69 Y124.892
G1 X144.583 Y125.785 E.03877
G1 X144.583 Y126.318
G1 X143.157 Y124.892 E.06195
G1 X142.624 Y124.892
G1 X144.583 Y126.851 E.08512
G1 X144.583 Y127.384
G1 X142.091 Y124.892 E.10829
G1 X141.557 Y124.892
G1 X144.583 Y127.918 E.13147
G1 X144.583 Y128.451
G1 X141.024 Y124.892 E.15464
G1 X140.491 Y124.892
G1 X144.583 Y128.984 E.17781
G1 X144.583 Y129.518
G1 X142.035 Y126.97 E.1107
G1 X142.326 Y127.794
G1 X144.583 Y130.051 E.09807
G1 X144.583 Y130.584
G1 X142.301 Y128.303 E.09914
G1 X142.167 Y128.702
G1 X144.573 Y131.108 E.10453
G1 X144.04 Y131.108
G1 X141.962 Y129.03 E.09028
G1 X141.698 Y129.299
G1 X143.506 Y131.108 E.07858
G1 X142.973 Y131.108
G1 X141.376 Y129.511 E.06939
G1 X140.987 Y129.655
G1 X142.44 Y131.108 E.06311
G1 X141.906 Y131.108
G1 X140.503 Y129.705 E.06097
G1 X139.782 Y129.516
G1 X141.373 Y131.108 E.06915
M204 S10000
; WIPE_START
G1 F24000
G1 X139.959 Y129.693 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.217 J0 P1  F30000
G1 X139.957 Y124.892 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F5214
G1 X141.528 Y126.463 E.06824
G1 X140.721 Y126.189
G1 X139.424 Y124.892 E.05636
G1 X138.891 Y124.892
G1 X140.222 Y126.224 E.05785
G1 X139.822 Y126.357
G1 X138.358 Y124.892 E.06363
G1 X137.824 Y124.892
G1 X139.491 Y126.559 E.07241
G1 X139.217 Y126.819
G1 X137.291 Y124.892 E.0837
G1 X136.758 Y124.892
G1 X139.002 Y127.136 E.09751
G1 X138.855 Y127.523
G1 X136.225 Y124.892 E.11431
G1 X135.691 Y124.892
G1 X138.811 Y128.013 E.13558
G1 X138.988 Y128.723
G1 X135.158 Y124.892 E.16645
G1 X134.625 Y124.892
G1 X140.84 Y131.108 E.27008
G1 X140.307 Y131.108
G1 X134.091 Y124.892 E.27008
G1 X133.558 Y124.892
G1 X139.773 Y131.108 E.27008
G1 X139.24 Y131.108
G1 X133.025 Y124.892 E.27008
G1 X132.492 Y124.892
G1 X138.707 Y131.108 E.27008
G1 X138.174 Y131.108
G1 X134.405 Y127.339 E.16378
G1 X134.596 Y128.063
G1 X137.64 Y131.108 E.1323
G1 X137.107 Y131.108
G1 X134.562 Y128.563 E.11058
G1 X134.425 Y128.958
G1 X136.574 Y131.108 E.09339
G1 X136.04 Y131.108
G1 X134.218 Y129.286 E.07918
G1 X133.956 Y129.556
G1 X135.507 Y131.108 E.06743
G1 X134.974 Y131.108
G1 X133.637 Y129.771 E.0581
G1 X133.255 Y129.922
G1 X134.441 Y131.108 E.05154
G1 X133.907 Y131.108
G1 X132.782 Y129.982 E.0489
G1 X132.144 Y129.877
G1 X133.374 Y131.108 E.05345
M204 S10000
; WIPE_START
G1 F24000
G1 X132.144 Y129.877 E-.66105
G1 X132.401 Y129.92 E-.09895
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.139 J.429 P1  F30000
G1 X133.654 Y126.588 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F5214
G1 X131.958 Y124.892 E.0737
G1 X131.425 Y124.892
G1 X132.901 Y126.368 E.06412
G1 X132.407 Y126.408
G1 X130.892 Y124.892 E.06586
G1 X130.359 Y124.892
G1 X132.01 Y126.544 E.07176
G1 X131.678 Y126.745
G1 X129.825 Y124.892 E.08051
G1 X129.292 Y124.892
G1 X131.402 Y127.003 E.0917
G1 X131.185 Y127.318
G1 X128.759 Y124.892 E.10541
G1 X128.226 Y124.892
G1 X131.035 Y127.702 E.12211
G1 X130.969 Y128.169
G1 X127.692 Y124.892 E.1424
G1 X127.159 Y124.892
G1 X131.109 Y128.843 E.17166
M204 S10000
; WIPE_START
G1 F24000
G1 X129.695 Y127.429 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.925 J.791 P1  F30000
G1 X132.841 Y131.108 Z7.4
G1 Z7
M73 P96 R0
G1 E.8 F1800
M204 S2000
G1 F5214
G1 X126.626 Y124.892 E.27008
G1 X126.092 Y124.892
G1 X132.308 Y131.108 E.27008
G1 X131.774 Y131.108
G1 X125.559 Y124.892 E.27008
G1 X125.026 Y124.892
G1 X126.749 Y126.616 E.07489
G1 X126.004 Y126.404
G1 X124.493 Y124.892 E.06568
G1 X123.959 Y124.892
G1 X125.509 Y126.442 E.06734
G1 X125.107 Y126.573
G1 X123.426 Y124.892 E.07305
G1 X122.893 Y124.892
G1 X124.77 Y126.77 E.08159
G1 X124.488 Y127.021
G1 X122.36 Y124.892 E.09248
G1 X121.826 Y124.892
G1 X124.27 Y127.336 E.10619
G1 X124.111 Y127.71
G1 X121.293 Y124.892 E.12245
G1 X120.76 Y124.892
G1 X124.031 Y128.163 E.14214
G1 X124.09 Y128.756
G1 X120.226 Y124.892 E.16788
M204 S10000
; WIPE_START
G1 F24000
G1 X121.641 Y126.307 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.226 J1.196 P1  F30000
G1 X127.556 Y127.422 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F5214
G1 X131.241 Y131.108 E.16014
G1 X130.708 Y131.108
G1 X127.744 Y128.144 E.12879
G1 X127.712 Y128.645
G1 X130.175 Y131.108 E.10702
G1 X129.641 Y131.108
G1 X127.577 Y129.043 E.0897
G1 X127.375 Y129.374
G1 X129.108 Y131.108 E.07531
G1 X128.575 Y131.108
G1 X127.118 Y129.651 E.06328
G1 X126.808 Y129.875
G1 X128.041 Y131.108 E.05358
G1 X127.508 Y131.108
G1 X126.438 Y130.038 E.0465
G1 X125.985 Y130.118
G1 X126.975 Y131.108 E.04302
G1 X126.442 Y131.108
G1 X125.383 Y130.049 E.04602
G1 X125.908 Y131.108
G1 X119.693 Y124.892 E.27008
G1 X119.16 Y124.892
G1 X125.375 Y131.108 E.27008
G1 X124.842 Y131.108
G1 X118.627 Y124.892 E.27008
G1 X118.093 Y124.892
G1 X124.309 Y131.108 E.27008
G1 X123.775 Y131.108
G1 X119.888 Y127.221 E.16891
G1 X120.277 Y128.142
G1 X123.242 Y131.108 E.12885
G1 X122.709 Y131.108
G1 X120.276 Y128.674 E.10573
G1 X120.164 Y129.096
G1 X122.175 Y131.108 E.0874
G1 X121.642 Y131.108
G1 X119.983 Y129.449 E.07209
G1 X119.747 Y129.746
G1 X121.109 Y131.108 E.05916
G1 X120.576 Y131.108
G1 X119.461 Y129.993 E.04843
G1 X119.112 Y130.177
G1 X120.042 Y131.108 E.04045
G1 X119.509 Y131.108
G1 X118.693 Y130.292 E.03546
G1 X118.178 Y130.31
G1 X118.976 Y131.108 E.03467
G1 X118.443 Y131.108
G1 X117.343 Y130.008 E.0478
M204 S10000
; WIPE_START
G1 F24000
G1 X118.443 Y131.108 E-.59108
G1 X118.887 Y131.108 E-.16892
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.201 J.198 P1  F30000
G1 X119.579 Y126.912 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F5214
G1 X117.56 Y124.892 E.08774
G1 X117.027 Y124.892
G1 X118.635 Y126.501 E.06989
G1 X118.11 Y126.508
G1 X116.494 Y124.892 E.07022
G1 X115.96 Y124.892
G1 X117.686 Y126.619 E.07501
G1 X117.337 Y126.802
G1 X115.427 Y124.892 E.08298
G1 X115.417 Y125.416
G1 X117.046 Y127.045 E.07079
G1 X116.807 Y127.339
G1 X115.417 Y125.949 E.06037
G1 X115.417 Y126.483
G1 X116.621 Y127.686 E.05231
G1 X116.504 Y128.103
G1 X115.417 Y127.016 E.04723
G1 X115.417 Y127.549
G1 X116.495 Y128.626 E.04682
G1 X116.814 Y129.479
G1 X115.417 Y128.082 E.0607
G1 X115.417 Y128.616
G1 X117.909 Y131.108 E.10829
G1 X117.376 Y131.108
G1 X115.417 Y129.149 E.08511
G1 X115.417 Y129.682
G1 X116.843 Y131.108 E.06194
G1 X116.309 Y131.108
G1 X115.918 Y130.716 E.01701
G1 X115.875 Y130.673
G1 X115.417 Y130.215 E.01987
M204 S10000
; WIPE_START
G1 F24000
G1 X115.875 Y130.673 E-.24569
G1 X115.918 Y130.716 E-.0234
G1 X116.309 Y131.108 E-.21033
G1 X116.843 Y131.108 E-.20264
G1 X116.698 Y130.963 E-.07794
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.019 J.665 P1  F30000
G1 X117.278 Y130.072 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.227379
G1 F5214
G3 X116.754 Y129.54 I2.236 J-2.727 E.01125
; WIPE_START
G1 F24000
G1 X116.91 Y129.726 E-.24679
G1 X117.278 Y130.072 E-.51321
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.005 J1.217 P1  F30000
G1 X125.4 Y130.04 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.171695
G1 F5214
G1 X125.209 Y130.051 E.00201
; LINE_WIDTH: 0.171342
G1 X125.09 Y129.963 E.00154
; LINE_WIDTH: 0.129756
G1 X124.971 Y129.876 E.00104
; WIPE_START
G1 F24000
G1 X125.09 Y129.963 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.564 J-1.078 P1  F30000
G1 X119.875 Y127.233 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.230112
G1 F5214
G1 X119.888 Y127.087 E.00224
G2 X119.639 Y126.852 I-2.249 J2.124 E.00523
; WIPE_START
G1 F24000
G1 X119.888 Y127.087 E-.53223
G1 X119.875 Y127.233 E-.22777
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.02 J1.217 P1  F30000
G1 X127.619 Y127.359 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.224426
G1 F5214
M73 P97 R0
G1 X127.47 Y127.18 E.00345
; LINE_WIDTH: 0.16774
G2 X126.973 Y126.674 I-4.182 J3.609 E.00722
; LINE_WIDTH: 0.185733
G1 X126.811 Y126.554 E.00234
; WIPE_START
G1 F24000
G1 X126.973 Y126.674 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.655 J1.025 P1  F30000
G1 X132.083 Y129.939 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.219352
G1 F5214
G1 X131.915 Y129.816 E.00299
; LINE_WIDTH: 0.170164
G1 X131.747 Y129.692 E.00216
; LINE_WIDTH: 0.118961
G3 X131.42 Y129.384 I37.007 J-39.677 E.00279
; LINE_WIDTH: 0.0934035
G1 X131.28 Y129.217 E.0009
; LINE_WIDTH: 0.150154
G3 X131.04 Y128.912 I2.374 J-2.12 E.00339
; WIPE_START
G1 F24000
G1 X131.28 Y129.217 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.153 J.39 P1  F30000
G1 X132.207 Y126.475 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.10783
G1 F5214
G1 X132.143 Y126.458 E.00035
G1 X132.067 Y126.513 E.0005
; WIPE_START
G1 F24000
G1 X132.143 Y126.458 E-.44503
G1 X132.207 Y126.475 E-.31497
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.408 J1.147 P1  F30000
G1 X134.466 Y127.277 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.229701
G1 F5214
G1 X134.326 Y127.11 E.00332
; LINE_WIDTH: 0.178384
G2 X133.848 Y126.624 I-4.086 J3.545 E.00752
; LINE_WIDTH: 0.19697
G1 X133.716 Y126.527 E.00206
; WIPE_START
G1 F24000
G1 X133.848 Y126.624 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.547 J1.087 P1  F30000
G1 X139.72 Y129.578 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.216782
G1 F5214
G3 X139.534 Y129.439 I1.057 J-1.619 E.00329
; LINE_WIDTH: 0.177685
G3 X139.217 Y129.14 I2.311 J-2.763 E.00479
; LINE_WIDTH: 0.153758
G1 X139.071 Y128.964 E.00207
; LINE_WIDTH: 0.187192
G1 X138.924 Y128.788 E.0027
; WIPE_START
G1 F24000
G1 X139.071 Y128.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.086 J.549 P1  F30000
G1 X140.466 Y126.201 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.137935
G1 F5214
G1 X140.355 Y126.16 E.00091
G1 X140.249 Y126.217 E.00094
; WIPE_START
G1 F24000
G1 X140.355 Y126.16 E-.38539
G1 X140.466 Y126.201 E-.37461
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.485 J1.116 P1  F30000
G1 X142.096 Y126.91 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.214959
G1 F5214
G2 X141.593 Y126.398 I-2.429 J1.883 E.01008
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.939 Y126.724 E-.50338
G1 X142.096 Y126.91 E-.25662
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/40
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
G3 Z7.4 I-.143 J-1.209 P1  F30000
G1 X115.709 Y130.027 Z7.4
G1 Z7.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X116.563 Y130.027 E.02627
G1 X116.563 Y130.751 E.02225
G1 X115.709 Y130.751 E.02627
G1 X115.709 Y130.087 E.02041
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.563 Y130.027 E-.32568
G1 X116.563 Y130.751 E-.27519
G1 X116.145 Y130.751 E-.15912
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/40
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
G3 Z7.6 I1.042 J-.628 P1  F30000
G1 X115.709 Y130.027 Z7.6
G1 Z7.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X116.563 Y130.027 E.02627
G1 X116.563 Y130.751 E.02225
G1 X115.709 Y130.751 E.02627
G1 X115.709 Y130.087 E.02041
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.563 Y130.027 E-.32568
G1 X116.563 Y130.751 E-.27519
G1 X116.145 Y130.751 E-.15912
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/40
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
G3 Z7.8 I1.042 J-.628 P1  F30000
G1 X115.709 Y130.027 Z7.8
G1 Z7.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X116.563 Y130.027 E.02627
G1 X116.563 Y130.751 E.02225
G1 X115.709 Y130.751 E.02627
G1 X115.709 Y130.087 E.02041
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.563 Y130.027 E-.32568
G1 X116.563 Y130.751 E-.27519
G1 X116.145 Y130.751 E-.15912
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/40
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
G3 Z8 I1.042 J-.628 P1  F30000
G1 X115.709 Y130.027 Z8
G1 Z7.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X116.563 Y130.027 E.02627
G1 X116.563 Y130.751 E.02225
G1 X115.709 Y130.751 E.02627
G1 X115.709 Y130.087 E.02041
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.563 Y130.027 E-.32568
G1 X116.563 Y130.751 E-.27519
G1 X116.145 Y130.751 E-.15912
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/40
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
G3 Z8.2 I1.042 J-.628 P1  F30000
G1 X115.709 Y130.027 Z8.2
G1 Z8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X116.563 Y130.027 E.02627
G1 X116.563 Y130.751 E.02225
G1 X115.709 Y130.751 E.02627
G1 X115.709 Y130.087 E.02041
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X116.563 Y130.027 E-.32568
G1 X116.563 Y130.751 E-.27519
G1 X116.145 Y130.751 E-.15912
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
G1 Z8.5 F900 ; lower z a little
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

    G1 Z108 F600
    G1 Z106

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

