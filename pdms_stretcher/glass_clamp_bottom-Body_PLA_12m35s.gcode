; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 6m 47s; total estimated time: 12m 35s
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
M73 P35 R8
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
M73 P37 R7
G1 X76 F15000
M73 P39 R7
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
M73 P40 R7
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
    G29 A X110 Y110.963 I41.1689 J55.0858
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
M73 P41 R7
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
G1 X145.758 Y162.514 F30000
G1 Z.4
G1 Z.2
M73 P42 R7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X145.782 Y162.549 E.00161
G1 X146.191 Y162.911 E.02032
G1 X146.327 Y162.983 E.00574
G1 X146.276 Y163.191 E.008
G1 X114.677 Y163.191 E1.17692
G1 X114.626 Y162.983 E.008
G1 X114.762 Y162.911 E.00574
G1 X115.171 Y162.549 E.02032
M73 P43 R7
G1 X115.481 Y162.1 E.02032
G1 X115.674 Y161.59 E.02032
G1 X115.74 Y161.048 E.02032
G1 X115.674 Y160.507 E.02032
G1 X115.481 Y159.997 E.02032
G1 X115.171 Y159.548 E.02032
G1 X114.762 Y159.186 E.02032
G1 X114.626 Y159.114 E.00574
G1 X114.677 Y158.906 E.008
G1 X146.276 Y158.906 E1.17692
M73 P44 R7
G1 X146.327 Y159.114 E.008
G1 X146.191 Y159.186 E.00574
G1 X145.782 Y159.548 E.02032
G1 X145.473 Y159.997 E.02032
M73 P44 R6
G1 X145.279 Y160.507 E.02032
G1 X145.213 Y161.048 E.02032
G1 X145.279 Y161.59 E.02032
G1 X145.473 Y162.1 E.02032
G1 X145.724 Y162.464 E.01648
G1 X146.139 Y162.255 F30000
; FEATURE: Outer wall
G1 F3000
G1 X146.127 Y162.244 E.0006
G1 X145.88 Y161.886 E.01619
G1 X145.726 Y161.48 E.01619
G1 X145.674 Y161.048 E.01619
M73 P45 R6
G1 X145.726 Y160.617 E.01619
G1 X145.88 Y160.211 E.01619
G1 X146.127 Y159.853 E.01619
G1 X146.452 Y159.565 E.01619
G1 X146.837 Y159.363 E.01619
G1 X147.259 Y159.259 E.01619
G1 X147.694 Y159.259 E.01619
G1 X148.116 Y159.363 E.01619
G1 X148.501 Y159.565 E.01619
G1 X148.826 Y159.853 E.01619
G1 X149.073 Y160.211 E.01619
G1 X149.227 Y160.617 E.01619
G1 X149.28 Y161.048 E.01619
G1 X149.227 Y161.48 E.01619
G1 X149.073 Y161.886 E.01619
M73 P46 R6
G1 X148.826 Y162.244 E.01619
G1 X148.501 Y162.532 E.01619
G1 X148.116 Y162.734 E.01619
G1 X147.694 Y162.838 E.01619
G1 X147.259 Y162.838 E.01619
G1 X146.837 Y162.734 E.01619
G1 X146.452 Y162.532 E.01619
G1 X146.184 Y162.295 E.01335
; WIPE_START
G1 F24000
G1 X146.127 Y162.244 E-.02896
G1 X145.88 Y161.886 E-.16516
G1 X145.726 Y161.48 E-.16516
G1 X145.674 Y161.048 E-.16516
G1 X145.726 Y160.617 E-.16516
G1 X145.792 Y160.444 E-.07039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.517 J1.102 P1  F30000
G1 X148.626 Y159.114 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X148.677 Y158.906 E.008
G1 X149.62 Y158.906 E.03509
G1 X149.62 Y159.859 E.0355
G1 X149.427 Y159.919 E.00752
G1 X149.171 Y159.548 E.01679
G1 X148.762 Y159.186 E.02032
G1 X148.679 Y159.142 E.0035
; WIPE_START
G1 F24000
G1 X148.677 Y158.906 E-.08987
G1 X149.62 Y158.906 E-.35802
G1 X149.62 Y159.727 E-.31211
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.164 J-.355 P1  F30000
G1 X148.626 Y162.983 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X148.762 Y162.911 E.00574
G1 X149.171 Y162.549 E.02032
G1 X149.427 Y162.178 E.01679
G1 X149.62 Y162.238 E.00752
G1 X149.62 Y163.191 E.0355
G1 X148.677 Y163.191 E.03509
G1 X148.64 Y163.041 E.00577
; WIPE_START
G1 F24000
G1 X148.762 Y162.911 E-.06772
G1 X149.171 Y162.549 E-.20734
G1 X149.427 Y162.178 E-.17132
G1 X149.62 Y162.238 E-.07668
G1 X149.62 Y162.862 E-.23694
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.034 J-1.216 P1  F30000
G1 X115.064 Y161.9 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X115.035 Y161.942 E.0019
G1 X114.826 Y162.244 E.01368
G1 X114.501 Y162.532 E.01619
G1 X114.116 Y162.734 E.01619
G1 X113.694 Y162.838 E.01619
G1 X113.259 Y162.838 E.01619
G1 X112.837 Y162.734 E.01619
G1 X112.452 Y162.532 E.01619
G1 X112.127 Y162.244 E.01619
G1 X111.88 Y161.886 E.01619
G1 X111.726 Y161.48 E.01619
G1 X111.674 Y161.048 E.01619
G1 X111.726 Y160.617 E.01619
G1 X111.88 Y160.211 E.01619
G1 X112.127 Y159.853 E.01619
G1 X112.452 Y159.565 E.01619
G1 X112.837 Y159.363 E.01619
G1 X113.259 Y159.259 E.01619
G1 X113.694 Y159.259 E.01619
G1 X114.116 Y159.363 E.01619
G1 X114.501 Y159.565 E.01619
G1 X114.826 Y159.853 E.01619
G1 X115.073 Y160.211 E.01619
G1 X115.227 Y160.617 E.01619
G1 X115.28 Y161.048 E.01619
G1 X115.227 Y161.48 E.01619
G1 X115.089 Y161.845 E.01456
; WIPE_START
G1 F24000
G1 X115.035 Y161.942 E-.04193
G1 X114.826 Y162.244 E-.13959
G1 X114.501 Y162.532 E-.16516
G1 X114.116 Y162.734 E-.16516
G1 X113.694 Y162.838 E-.16516
G1 X113.476 Y162.838 E-.083
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.163 J-.359 P1  F30000
G1 X112.327 Y159.114 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X112.191 Y159.186 E.00574
G1 X111.782 Y159.548 E.02032
G1 X111.526 Y159.919 E.01679
G1 X111.334 Y159.859 E.00752
G1 X111.334 Y158.906 E.0355
G1 X112.276 Y158.906 E.03509
G1 X112.313 Y159.056 E.00577
; WIPE_START
G1 F24000
G1 X112.191 Y159.186 E-.06774
G1 X111.782 Y159.548 E-.20732
G1 X111.526 Y159.919 E-.17132
G1 X111.334 Y159.859 E-.07668
G1 X111.334 Y159.235 E-.23694
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.176 J.312 P1  F30000
G1 X112.327 Y162.983 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X112.276 Y163.191 E.008
G1 X111.334 Y163.191 E.03509
G1 X111.334 Y162.238 E.0355
G1 X111.526 Y162.178 E.00752
G1 X111.782 Y162.549 E.01679
G1 X112.191 Y162.911 E.02032
G1 X112.274 Y162.955 E.0035
; WIPE_START
G1 F24000
G1 X112.276 Y163.191 E-.08987
G1 X111.334 Y163.191 E-.35802
G1 X111.334 Y162.37 E-.31211
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.04 J1.216 P1  F30000
G1 X150.077 Y163.648 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X110.877 Y163.648 E1.46005
G1 X110.877 Y158.448 E.19368
G1 X150.077 Y158.448 E1.46005
G1 X150.077 Y163.588 E.19145
; WIPE_START
G1 F24000
G1 X148.077 Y163.592 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.89 J.83 P1  F30000
G1 X149.574 Y161.985 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.507418
G1 F3000
G1 X149.608 Y161.796 E.00725
; LINE_WIDTH: 0.475046
G2 X149.649 Y161.559 I-1.955 J-.456 E.00848
; LINE_WIDTH: 0.441761
G1 X149.664 Y161.314 E.00798
; LINE_WIDTH: 0.407874
G2 X149.678 Y161.028 I-2.356 J-.266 E.00852
; LINE_WIDTH: 0.382462
G1 X149.664 Y160.783 E.00679
; LINE_WIDTH: 0.417056
G2 X149.643 Y160.489 I-2.422 J.024 E.00899
; LINE_WIDTH: 0.453652
G1 X149.608 Y160.301 E.00641
; LINE_WIDTH: 0.480535
G1 X149.574 Y160.112 E.00683
; WIPE_START
G1 F24000
G1 X149.608 Y160.301 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.922 J-.794 P1  F30000
G1 X148.434 Y158.937 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.507447
G1 F3000
G1 X148.211 Y158.91 E.00851
; LINE_WIDTH: 0.47205
G1 X147.988 Y158.883 E.00786
; LINE_WIDTH: 0.407726
G2 X147.189 Y158.856 I-.617 J6.408 E.02378
; LINE_WIDTH: 0.401256
M73 P47 R6
G1 X146.966 Y158.883 E.00656
; LINE_WIDTH: 0.436653
G1 X146.742 Y158.91 E.00721
; LINE_WIDTH: 0.47205
G1 X146.519 Y158.937 E.00786
; WIPE_START
G1 F24000
G1 X146.742 Y158.91 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.57 J-1.075 P1  F30000
G1 X145.572 Y159.53 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.503632
G1 F6300
G1 X145.337 Y159.294 E.01253
G1 X144.685 Y159.294 E.02446
G1 X145.159 Y159.768 E.02514
G1 X145.126 Y159.815 E.00215
G1 X144.969 Y160.229 E.01665
G1 X144.033 Y159.294 E.04966
G1 X143.382 Y159.294 E.02446
G1 X144.856 Y160.768 E.07826
G1 X144.822 Y161.048 E.0106
G1 X144.869 Y161.432 E.01451
G1 X142.73 Y159.294 E.11352
G1 X142.079 Y159.294 E.02446
G1 X145.258 Y162.473 E.16877
G1 X145.485 Y162.803 E.01506
G1 X144.936 Y162.803 E.02062
G1 X141.427 Y159.294 E.18629
G1 X140.776 Y159.294 E.02446
G1 X144.285 Y162.803 E.18629
G1 X143.633 Y162.803 E.02446
G1 X140.124 Y159.294 E.18629
G1 X139.473 Y159.294 E.02446
G1 X142.981 Y162.803 E.18629
G1 X142.33 Y162.803 E.02446
G1 X138.821 Y159.294 E.18629
G1 X138.17 Y159.294 E.02446
G1 X141.678 Y162.803 E.18629
G1 X141.027 Y162.803 E.02446
G1 X137.518 Y159.294 E.18629
G1 X136.866 Y159.294 E.02446
G1 X140.375 Y162.803 E.18629
G1 X139.724 Y162.803 E.02446
G1 X136.215 Y159.294 E.18629
G1 X135.563 Y159.294 E.02446
G1 X139.072 Y162.803 E.18629
G1 X138.421 Y162.803 E.02446
G1 X134.912 Y159.294 E.18629
G1 X134.26 Y159.294 E.02446
G1 X137.769 Y162.803 E.18629
G1 X137.118 Y162.803 E.02446
G1 X133.609 Y159.294 E.18629
G1 X132.957 Y159.294 E.02446
G1 X136.466 Y162.803 E.18629
G1 X135.815 Y162.803 E.02446
G1 X132.306 Y159.294 E.18629
G1 X131.654 Y159.294 E.02446
G1 X135.163 Y162.803 E.18629
G1 X134.511 Y162.803 E.02446
G1 X131.003 Y159.294 E.18629
G1 X130.351 Y159.294 E.02446
G1 X133.86 Y162.803 E.18629
G1 X133.208 Y162.803 E.02446
G1 X129.699 Y159.294 E.18629
G1 X129.048 Y159.294 E.02446
G1 X132.557 Y162.803 E.18629
G1 X131.905 Y162.803 E.02446
G1 X128.396 Y159.294 E.18629
G1 X127.745 Y159.294 E.02446
G1 X131.254 Y162.803 E.18629
G1 X130.602 Y162.803 E.02446
G1 X127.093 Y159.294 E.18629
G1 X126.442 Y159.294 E.02446
G1 X129.951 Y162.803 E.18629
G1 X129.299 Y162.803 E.02446
G1 X125.79 Y159.294 E.18629
G1 X125.139 Y159.294 E.02446
G1 X128.648 Y162.803 E.18629
G1 X127.996 Y162.803 E.02446
G1 X124.487 Y159.294 E.18629
G1 X123.836 Y159.294 E.02446
G1 X127.344 Y162.803 E.18629
G1 X126.693 Y162.803 E.02446
G1 X123.184 Y159.294 E.18629
G1 X122.532 Y159.294 E.02446
G1 X126.041 Y162.803 E.18629
G1 X125.39 Y162.803 E.02446
G1 X121.881 Y159.294 E.18629
G1 X121.229 Y159.294 E.02446
G1 X124.738 Y162.803 E.18629
G1 X124.087 Y162.803 E.02446
G1 X120.578 Y159.294 E.18629
G1 X119.926 Y159.294 E.02446
G1 X123.435 Y162.803 E.18629
M73 P48 R6
G1 X122.784 Y162.803 E.02446
G1 X119.275 Y159.294 E.18629
G1 X118.623 Y159.294 E.02446
G1 X122.132 Y162.803 E.18629
G1 X121.481 Y162.803 E.02446
G1 X117.972 Y159.294 E.18629
G1 X117.32 Y159.294 E.02446
G1 X120.829 Y162.803 E.18629
G1 X120.177 Y162.803 E.02446
G1 X116.669 Y159.294 E.18629
G1 X116.017 Y159.294 E.02446
G1 X119.526 Y162.803 E.18629
G1 X118.874 Y162.803 E.02446
G1 X115.696 Y159.625 E.16875
G1 X115.827 Y159.815 E.00868
G1 X116.054 Y160.413 E.02403
G1 X116.085 Y160.665 E.00952
G1 X118.223 Y162.803 E.11351
G1 X117.571 Y162.803 E.02446
G1 X116.097 Y161.329 E.07825
G1 X116.054 Y161.684 E.01342
G1 X115.984 Y161.868 E.00738
G1 X116.92 Y162.803 E.04965
G1 X116.268 Y162.803 E.02446
G1 X115.795 Y162.329 E.02514
G1 X115.529 Y162.715 E.01758
G1 X115.822 Y163.009 E.01559
; WIPE_START
G1 F24000
G1 X115.529 Y162.715 E-.15783
G1 X115.795 Y162.329 E-.17799
G1 X116.268 Y162.803 E-.25445
G1 X116.715 Y162.803 E-.16974
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.188 J-1.202 P1  F30000
G1 X114.434 Y163.159 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.507444
G1 F3000
G1 X114.211 Y163.187 E.00851
; LINE_WIDTH: 0.472048
G1 X113.988 Y163.214 E.00786
; LINE_WIDTH: 0.407726
G3 X113.189 Y163.241 I-.617 J-6.408 E.02378
; LINE_WIDTH: 0.401254
G1 X112.966 Y163.214 E.00656
; LINE_WIDTH: 0.436652
G1 X112.742 Y163.187 E.00721
; LINE_WIDTH: 0.47205
G1 X112.519 Y163.159 E.00786
; WIPE_START
G1 F24000
G1 X112.742 Y163.187 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.805 J-.913 P1  F30000
G1 X111.38 Y161.985 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.480535
G1 F3000
G1 X111.345 Y161.796 E.00683
; LINE_WIDTH: 0.453652
G1 X111.311 Y161.608 E.00641
; LINE_WIDTH: 0.417057
G3 X111.29 Y161.314 I2.401 J-.317 E.00899
; LINE_WIDTH: 0.382464
G1 X111.275 Y161.069 E.00679
; LINE_WIDTH: 0.407875
G3 X111.29 Y160.783 I2.371 J-.02 E.00852
; LINE_WIDTH: 0.44176
G1 X111.305 Y160.538 E.00798
; LINE_WIDTH: 0.475046
G3 X111.345 Y160.301 I1.995 J.218 E.00848
; LINE_WIDTH: 0.507419
G1 X111.38 Y160.112 E.00725
; WIPE_START
G1 F24000
G1 X111.345 Y160.301 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.922 J.794 P1  F30000
G1 X112.519 Y158.937 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.472048
G1 F3000
G1 X112.742 Y158.91 E.00786
; LINE_WIDTH: 0.436651
G1 X112.966 Y158.883 E.00721
; LINE_WIDTH: 0.401255
G1 X113.189 Y158.856 E.00656
; LINE_WIDTH: 0.407726
G3 X113.988 Y158.883 I.182 J6.435 E.02378
; LINE_WIDTH: 0.472051
G1 X114.211 Y158.91 E.00786
; LINE_WIDTH: 0.507448
G1 X114.434 Y158.937 E.00851
; WIPE_START
G1 F24000
G1 X114.211 Y158.91 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.159 J1.207 P1  F30000
G1 X146.519 Y163.159 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.47205
G1 F3000
G1 X146.742 Y163.187 E.00786
; LINE_WIDTH: 0.436652
G1 X146.966 Y163.214 E.00721
; LINE_WIDTH: 0.401254
G1 X147.189 Y163.241 E.00656
; LINE_WIDTH: 0.407726
G2 X147.988 Y163.214 I.182 J-6.435 E.02378
; LINE_WIDTH: 0.472049
M73 P49 R6
G1 X148.211 Y163.187 E.00786
; LINE_WIDTH: 0.507446
G1 X148.434 Y163.159 E.00851
; WIPE_START
G1 F24000
G1 X148.211 Y163.187 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.209 J-.135 P1  F30000
G1 X146.45 Y147.401 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X146.475 Y147.437 E.00161
G1 X146.883 Y147.799 E.02032
G1 X147.02 Y147.87 E.00574
G1 X146.968 Y148.079 E.008
G1 X115.37 Y148.079 E1.17692
G1 X115.318 Y147.87 E.008
G1 X115.455 Y147.799 E.00574
G1 X115.863 Y147.437 E.02032
G1 X116.173 Y146.988 E.02032
G1 X116.367 Y146.477 E.02032
G1 X116.432 Y145.936 E.02032
G1 X116.367 Y145.394 E.02032
G1 X116.173 Y144.884 E.02032
G1 X115.863 Y144.435 E.02032
G1 X115.455 Y144.073 E.02032
G1 X115.318 Y144.001 E.00574
G1 X115.37 Y143.793 E.008
G1 X146.968 Y143.793 E1.17692
G1 X147.02 Y144.001 E.008
G1 X146.883 Y144.073 E.00574
G1 X146.475 Y144.435 E.02032
G1 X146.165 Y144.884 E.02032
G1 X145.971 Y145.394 E.02032
G1 X145.906 Y145.936 E.02032
G1 X145.971 Y146.477 E.02032
G1 X146.165 Y146.988 E.02032
G1 X146.416 Y147.352 E.01648
G1 X146.832 Y147.142 F30000
; FEATURE: Outer wall
G1 F3000
G1 X146.819 Y147.131 E.0006
G1 X146.572 Y146.774 E.01619
G1 X146.418 Y146.367 E.01619
G1 X146.366 Y145.936 E.01619
G1 X146.418 Y145.504 E.01619
G1 X146.572 Y145.098 E.01619
G1 X146.819 Y144.74 E.01619
G1 X147.145 Y144.452 E.01619
G1 X147.53 Y144.25 E.01619
G1 X147.952 Y144.146 E.01619
G1 X148.386 Y144.146 E.01619
G1 X148.808 Y144.25 E.01619
G1 X149.193 Y144.452 E.01619
G1 X149.518 Y144.74 E.01619
G1 X149.765 Y145.098 E.01619
G1 X149.919 Y145.504 E.01619
G1 X149.972 Y145.936 E.01619
G1 X149.919 Y146.367 E.01619
G1 X149.765 Y146.774 E.01619
G1 X149.518 Y147.131 E.01619
G1 X149.193 Y147.42 E.01619
G1 X148.808 Y147.622 E.01619
G1 X148.386 Y147.726 E.01619
G1 X147.952 Y147.726 E.01619
G1 X147.53 Y147.622 E.01619
G1 X147.145 Y147.42 E.01619
G1 X146.876 Y147.182 E.01335
; WIPE_START
G1 F24000
G1 X146.819 Y147.131 E-.02896
G1 X146.572 Y146.774 E-.16516
G1 X146.418 Y146.367 E-.16516
G1 X146.366 Y145.936 E-.16516
G1 X146.418 Y145.504 E-.16516
G1 X146.484 Y145.331 E-.07039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.517 J1.102 P1  F30000
G1 X149.318 Y144.001 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X149.37 Y143.793 E.008
G1 X150.312 Y143.793 E.03509
G1 X150.312 Y144.746 E.0355
G1 X150.119 Y144.806 E.00752
G1 X149.863 Y144.435 E.01679
G1 X149.455 Y144.073 E.02032
G1 X149.371 Y144.029 E.0035
; WIPE_START
G1 F24000
G1 X149.37 Y143.793 E-.08987
G1 X150.312 Y143.793 E-.35802
G1 X150.312 Y144.614 E-.31211
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.164 J-.355 P1  F30000
G1 X149.318 Y147.87 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X149.455 Y147.799 E.00574
G1 X149.863 Y147.437 E.02032
G1 X150.119 Y147.066 E.01679
G1 X150.312 Y147.126 E.00752
G1 X150.312 Y148.079 E.0355
G1 X149.37 Y148.079 E.03509
G1 X149.333 Y147.928 E.00577
; WIPE_START
G1 F24000
G1 X149.455 Y147.799 E-.06772
G1 X149.863 Y147.437 E-.20734
G1 X150.119 Y147.066 E-.17132
G1 X150.312 Y147.126 E-.07668
G1 X150.312 Y147.749 E-.23694
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.034 J-1.216 P1  F30000
G1 X115.756 Y146.787 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X115.727 Y146.829 E.0019
G1 X115.518 Y147.131 E.01368
G1 X115.193 Y147.42 E.01619
G1 X114.808 Y147.622 E.01619
G1 X114.386 Y147.726 E.01619
G1 X113.952 Y147.726 E.01619
G1 X113.53 Y147.622 E.01619
G1 X113.145 Y147.42 E.01619
G1 X112.819 Y147.131 E.01619
G1 X112.572 Y146.774 E.01619
G1 X112.418 Y146.367 E.01619
G1 X112.366 Y145.936 E.01619
G1 X112.418 Y145.504 E.01619
G1 X112.572 Y145.098 E.01619
G1 X112.819 Y144.74 E.01619
G1 X113.145 Y144.452 E.01619
G1 X113.53 Y144.25 E.01619
G1 X113.952 Y144.146 E.01619
G1 X114.386 Y144.146 E.01619
G1 X114.808 Y144.25 E.01619
G1 X115.193 Y144.452 E.01619
G1 X115.518 Y144.74 E.01619
G1 X115.765 Y145.098 E.01619
G1 X115.919 Y145.504 E.01619
G1 X115.972 Y145.936 E.01619
G1 X115.919 Y146.367 E.01619
G1 X115.781 Y146.733 E.01456
; WIPE_START
G1 F24000
G1 X115.727 Y146.829 E-.04193
G1 X115.518 Y147.131 E-.13959
G1 X115.193 Y147.42 E-.16516
G1 X114.808 Y147.622 E-.16516
G1 X114.386 Y147.726 E-.16516
G1 X114.168 Y147.726 E-.083
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.163 J-.359 P1  F30000
G1 X113.02 Y144.001 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X112.883 Y144.073 E.00574
G1 X112.475 Y144.435 E.02032
G1 X112.219 Y144.806 E.01679
G1 X112.026 Y144.746 E.00752
G1 X112.026 Y143.793 E.0355
G1 X112.968 Y143.793 E.03509
G1 X113.005 Y143.943 E.00577
; WIPE_START
G1 F24000
M73 P50 R6
G1 X112.883 Y144.073 E-.06774
G1 X112.475 Y144.435 E-.20732
G1 X112.219 Y144.806 E-.17132
G1 X112.026 Y144.746 E-.07668
G1 X112.026 Y144.122 E-.23694
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.176 J.312 P1  F30000
G1 X113.02 Y147.87 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X112.968 Y148.079 E.008
G1 X112.026 Y148.079 E.03509
G1 X112.026 Y147.126 E.0355
G1 X112.219 Y147.066 E.00752
G1 X112.475 Y147.437 E.01679
G1 X112.883 Y147.799 E.02032
G1 X112.966 Y147.842 E.0035
; WIPE_START
G1 F24000
G1 X112.968 Y148.079 E-.08987
G1 X112.026 Y148.079 E-.35802
G1 X112.026 Y147.257 E-.31211
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.04 J1.216 P1  F30000
G1 X150.769 Y148.536 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X111.569 Y148.536 E1.46005
G1 X111.569 Y143.336 E.19368
G1 X150.769 Y143.336 E1.46005
G1 X150.769 Y148.476 E.19145
; WIPE_START
G1 F24000
G1 X148.769 Y148.479 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.89 J.83 P1  F30000
G1 X150.266 Y146.872 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.507418
G1 F3000
G1 X150.3 Y146.684 E.00725
; LINE_WIDTH: 0.475046
G2 X150.341 Y146.446 I-1.955 J-.456 E.00848
; LINE_WIDTH: 0.441761
G1 X150.356 Y146.201 E.00798
; LINE_WIDTH: 0.407874
G2 X150.371 Y145.915 I-2.356 J-.266 E.00852
; LINE_WIDTH: 0.382462
G1 X150.356 Y145.67 E.00679
; LINE_WIDTH: 0.417056
G2 X150.335 Y145.376 I-2.422 J.024 E.00899
; LINE_WIDTH: 0.453652
G1 X150.3 Y145.188 E.00641
; LINE_WIDTH: 0.480535
G1 X150.266 Y145 E.00683
; WIPE_START
G1 F24000
G1 X150.3 Y145.188 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.922 J-.794 P1  F30000
G1 X149.126 Y143.825 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.507447
G1 F3000
G1 X148.903 Y143.798 E.00851
; LINE_WIDTH: 0.47205
G1 X148.68 Y143.771 E.00786
; LINE_WIDTH: 0.407726
G2 X147.881 Y143.744 I-.617 J6.408 E.02378
; LINE_WIDTH: 0.401256
G1 X147.658 Y143.771 E.00656
; LINE_WIDTH: 0.436653
G1 X147.435 Y143.798 E.00721
; LINE_WIDTH: 0.47205
G1 X147.211 Y143.825 E.00786
; WIPE_START
G1 F24000
G1 X147.435 Y143.798 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.57 J-1.075 P1  F30000
G1 X146.265 Y144.417 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.503632
G1 F6300
G1 X146.029 Y144.181 E.01253
G1 X145.377 Y144.181 E.02446
G1 X145.851 Y144.655 E.02514
G1 X145.818 Y144.702 E.00215
G1 X145.661 Y145.117 E.01665
G1 X144.726 Y144.181 E.04966
G1 X144.074 Y144.181 E.02446
G1 X145.548 Y145.655 E.07826
G1 X145.514 Y145.936 E.0106
G1 X145.561 Y146.32 E.01451
G1 X143.423 Y144.181 E.11352
G1 X142.771 Y144.181 E.02446
G1 X145.95 Y147.36 E.16877
G1 X146.178 Y147.69 E.01506
G1 X145.628 Y147.69 E.02062
G1 X142.12 Y144.181 E.18629
G1 X141.468 Y144.181 E.02446
G1 X144.977 Y147.69 E.18629
G1 X144.325 Y147.69 E.02446
G1 X140.816 Y144.181 E.18629
G1 X140.165 Y144.181 E.02446
G1 X143.674 Y147.69 E.18629
G1 X143.022 Y147.69 E.02446
G1 X139.513 Y144.181 E.18629
G1 X138.862 Y144.181 E.02446
G1 X142.371 Y147.69 E.18629
G1 X141.719 Y147.69 E.02446
G1 X138.21 Y144.181 E.18629
G1 X137.559 Y144.181 E.02446
G1 X141.068 Y147.69 E.18629
G1 X140.416 Y147.69 E.02446
G1 X136.907 Y144.181 E.18629
G1 X136.256 Y144.181 E.02446
G1 X139.764 Y147.69 E.18629
G1 X139.113 Y147.69 E.02446
G1 X135.604 Y144.181 E.18629
G1 X134.953 Y144.181 E.02446
G1 X138.461 Y147.69 E.18629
G1 X137.81 Y147.69 E.02446
G1 X134.301 Y144.181 E.18629
G1 X133.649 Y144.181 E.02446
G1 X137.158 Y147.69 E.18629
G1 X136.507 Y147.69 E.02446
G1 X132.998 Y144.181 E.18629
G1 X132.346 Y144.181 E.02446
G1 X135.855 Y147.69 E.18629
G1 X135.204 Y147.69 E.02446
G1 X131.695 Y144.181 E.18629
M73 P51 R6
G1 X131.043 Y144.181 E.02446
G1 X134.552 Y147.69 E.18629
G1 X133.901 Y147.69 E.02446
G1 X130.392 Y144.181 E.18629
G1 X129.74 Y144.181 E.02446
G1 X133.249 Y147.69 E.18629
G1 X132.598 Y147.69 E.02446
G1 X129.089 Y144.181 E.18629
G1 X128.437 Y144.181 E.02446
G1 X131.946 Y147.69 E.18629
G1 X131.294 Y147.69 E.02446
G1 X127.786 Y144.181 E.18629
G1 X127.134 Y144.181 E.02446
G1 X130.643 Y147.69 E.18629
G1 X129.991 Y147.69 E.02446
G1 X126.482 Y144.181 E.18629
G1 X125.831 Y144.181 E.02446
G1 X129.34 Y147.69 E.18629
G1 X128.688 Y147.69 E.02446
G1 X125.179 Y144.181 E.18629
G1 X124.528 Y144.181 E.02446
G1 X128.037 Y147.69 E.18629
G1 X127.385 Y147.69 E.02446
G1 X123.876 Y144.181 E.18629
G1 X123.225 Y144.181 E.02446
G1 X126.734 Y147.69 E.18629
G1 X126.082 Y147.69 E.02446
G1 X122.573 Y144.181 E.18629
G1 X121.922 Y144.181 E.02446
G1 X125.431 Y147.69 E.18629
G1 X124.779 Y147.69 E.02446
G1 X121.27 Y144.181 E.18629
G1 X120.619 Y144.181 E.02446
G1 X124.127 Y147.69 E.18629
G1 X123.476 Y147.69 E.02446
G1 X119.967 Y144.181 E.18629
G1 X119.315 Y144.181 E.02446
G1 X122.824 Y147.69 E.18629
G1 X122.173 Y147.69 E.02446
G1 X118.664 Y144.181 E.18629
G1 X118.012 Y144.181 E.02446
G1 X121.521 Y147.69 E.18629
G1 X120.87 Y147.69 E.02446
G1 X117.361 Y144.181 E.18629
G1 X116.709 Y144.181 E.02446
G1 X120.218 Y147.69 E.18629
G1 X119.567 Y147.69 E.02446
G1 X116.388 Y144.512 E.16875
G1 X116.52 Y144.702 E.00868
G1 X116.746 Y145.3 E.02403
G1 X116.777 Y145.552 E.00952
G1 X118.915 Y147.69 E.11351
G1 X118.264 Y147.69 E.02446
G1 X116.79 Y146.216 E.07825
G1 X116.746 Y146.571 E.01342
G1 X116.677 Y146.755 E.00738
G1 X117.612 Y147.69 E.04965
G1 X116.96 Y147.69 E.02446
G1 X116.487 Y147.217 E.02514
G1 X116.221 Y147.602 E.01758
G1 X116.515 Y147.896 E.01559
; WIPE_START
G1 F24000
G1 X116.221 Y147.602 E-.15783
G1 X116.487 Y147.217 E-.17799
G1 X116.96 Y147.69 E-.25445
G1 X117.407 Y147.69 E-.16974
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.188 J-1.202 P1  F30000
G1 X115.126 Y148.047 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.507444
G1 F3000
G1 X114.903 Y148.074 E.00851
; LINE_WIDTH: 0.472048
G1 X114.68 Y148.101 E.00786
; LINE_WIDTH: 0.407726
G3 X113.881 Y148.128 I-.617 J-6.408 E.02378
; LINE_WIDTH: 0.401254
G1 X113.658 Y148.101 E.00656
; LINE_WIDTH: 0.436652
G1 X113.435 Y148.074 E.00721
; LINE_WIDTH: 0.47205
G1 X113.211 Y148.047 E.00786
; WIPE_START
G1 F24000
G1 X113.435 Y148.074 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.805 J-.913 P1  F30000
G1 X112.072 Y146.872 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.480535
M73 P52 R6
G1 F3000
G1 X112.037 Y146.684 E.00683
; LINE_WIDTH: 0.453652
G1 X112.003 Y146.495 E.00641
; LINE_WIDTH: 0.417057
G3 X111.982 Y146.201 I2.401 J-.317 E.00899
; LINE_WIDTH: 0.382464
G1 X111.967 Y145.956 E.00679
; LINE_WIDTH: 0.407875
G3 X111.982 Y145.67 I2.371 J-.02 E.00852
; LINE_WIDTH: 0.44176
G1 X111.997 Y145.425 E.00798
; LINE_WIDTH: 0.475046
G3 X112.037 Y145.188 I1.995 J.218 E.00848
; LINE_WIDTH: 0.507419
G1 X112.072 Y145 E.00725
; WIPE_START
G1 F24000
G1 X112.037 Y145.188 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.922 J.794 P1  F30000
G1 X113.211 Y143.825 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.472048
G1 F3000
G1 X113.435 Y143.798 E.00786
; LINE_WIDTH: 0.436651
G1 X113.658 Y143.771 E.00721
; LINE_WIDTH: 0.401255
G1 X113.881 Y143.744 E.00656
; LINE_WIDTH: 0.407726
G3 X114.68 Y143.771 I.182 J6.435 E.02378
; LINE_WIDTH: 0.472051
G1 X114.903 Y143.798 E.00786
; LINE_WIDTH: 0.507448
G1 X115.126 Y143.825 E.00851
; WIPE_START
G1 F24000
G1 X114.903 Y143.798 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.159 J1.207 P1  F30000
G1 X147.211 Y148.047 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.47205
G1 F3000
G1 X147.435 Y148.074 E.00786
; LINE_WIDTH: 0.436652
G1 X147.658 Y148.101 E.00721
; LINE_WIDTH: 0.401254
G1 X147.881 Y148.128 E.00656
; LINE_WIDTH: 0.407726
G2 X148.68 Y148.101 I.182 J-6.435 E.02378
; LINE_WIDTH: 0.472049
G1 X148.903 Y148.074 E.00786
; LINE_WIDTH: 0.507446
G1 X149.126 Y148.047 E.00851
; WIPE_START
G1 F24000
G1 X148.903 Y148.074 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.19 J-.253 P1  F30000
G1 X144.888 Y129.157 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X145.194 Y129.6 E.02007
G1 X145.806 Y130.143 E.03047
G1 X114.194 Y130.143 E1.17743
G1 X114.806 Y129.6 E.03047
G1 X115.137 Y129.122 E.02167
G1 X115.343 Y128.578 E.02167
M73 P52 R5
G1 X115.413 Y128 E.02167
G1 X115.343 Y127.422 E.02167
G1 X115.137 Y126.878 E.02167
G1 X114.806 Y126.4 E.02167
G1 X114.194 Y125.857 E.03047
G1 X145.806 Y125.857 E1.17743
G1 X145.194 Y126.4 E.03047
G1 X144.863 Y126.878 E.02167
G1 X144.657 Y127.422 E.02167
G1 X144.587 Y128 E.02167
G1 X144.657 Y128.578 E.02167
G1 X144.857 Y129.106 E.02104
G1 X145.265 Y128.891 F30000
; FEATURE: Outer wall
G1 F3000
G1 X145.104 Y128.467 E.01688
G1 X145.047 Y128 E.01754
G1 X145.054 Y127.939 E.00227
G1 X145.104 Y127.533 E.01526
G1 X145.271 Y127.092 E.01754
G1 X145.538 Y126.705 E.01754
G1 X145.891 Y126.393 E.01754
G1 X146.307 Y126.174 E.01754
G1 X146.765 Y126.061 E.01754
G1 X147.235 Y126.061 E.01754
G1 X147.693 Y126.174 E.01754
G1 X148.109 Y126.393 E.01754
G1 X148.462 Y126.705 E.01754
G1 X148.729 Y127.092 E.01754
G1 X148.896 Y127.533 E.01754
G1 X148.953 Y128 E.01754
G1 X148.896 Y128.467 E.01754
G1 X148.729 Y128.908 E.01754
G1 X148.462 Y129.295 E.01754
G1 X148.109 Y129.607 E.01754
G1 X147.693 Y129.826 E.01754
G1 X147.235 Y129.939 E.01754
G1 X146.765 Y129.939 E.01754
G1 X146.307 Y129.826 E.01754
G1 X145.891 Y129.607 E.01754
G1 X145.538 Y129.295 E.01754
G1 X145.295 Y128.943 E.01595
; WIPE_START
G1 F24000
G1 X145.104 Y128.467 E-.19462
G1 X145.047 Y128 E-.1789
G1 X145.054 Y127.939 E-.02319
G1 X145.104 Y127.533 E-.15572
G1 X145.271 Y127.092 E-.1789
G1 X145.314 Y127.03 E-.02867
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.459 J1.127 P1  F30000
G1 X148.194 Y125.857 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X149.143 Y125.857 E.03534
G1 X149.143 Y126.548 E.02573
G1 X148.95 Y126.608 E.00752
G1 X148.806 Y126.4 E.00943
G1 X148.239 Y125.897 E.02824
; WIPE_START
G1 F24000
G1 X149.143 Y125.857 E-.34385
M73 P53 R5
G1 X149.143 Y126.548 E-.26254
G1 X148.95 Y126.608 E-.07668
G1 X148.835 Y126.441 E-.07692
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.199 J-.208 P1  F30000
G1 X148.194 Y130.143 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X148.806 Y129.6 E.03047
G1 X148.95 Y129.392 E.00943
G1 X149.143 Y129.452 E.00752
G1 X149.143 Y130.143 E.02573
G1 X148.254 Y130.143 E.03311
; WIPE_START
G1 F24000
G1 X148.806 Y129.6 E-.29423
G1 X148.95 Y129.392 E-.09621
G1 X149.143 Y129.452 E-.07668
G1 X149.143 Y130.143 E-.26254
G1 X149.063 Y130.143 E-.03033
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.121 J-1.211 P1  F30000
G1 X114.442 Y126.687 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X114.462 Y126.705 E.001
G1 X114.729 Y127.092 E.01754
G1 X114.896 Y127.533 E.01754
G1 X114.946 Y127.939 E.01526
G1 X114.953 Y128 E.00227
G1 X114.896 Y128.467 E.01754
G1 X114.729 Y128.908 E.01754
G1 X114.462 Y129.295 E.01754
G1 X114.109 Y129.607 E.01754
G1 X113.693 Y129.826 E.01754
G1 X113.235 Y129.939 E.01754
G1 X112.765 Y129.939 E.01754
G1 X112.307 Y129.826 E.01754
G1 X111.891 Y129.607 E.01754
G1 X111.538 Y129.295 E.01754
G1 X111.271 Y128.908 E.01754
G1 X111.104 Y128.467 E.01754
G1 X111.047 Y128 E.01754
G1 X111.054 Y127.939 E.00227
G1 X111.104 Y127.533 E.01526
G1 X111.271 Y127.092 E.01754
G1 X111.538 Y126.705 E.01754
G1 X111.891 Y126.393 E.01754
G1 X112.307 Y126.174 E.01754
G1 X112.765 Y126.061 E.01754
G1 X113.235 Y126.061 E.01754
G1 X113.693 Y126.174 E.01754
G1 X114.109 Y126.393 E.01754
G1 X114.397 Y126.647 E.0143
; WIPE_START
G1 F24000
G1 X114.462 Y126.705 E-.03305
G1 X114.729 Y127.092 E-.17891
G1 X114.896 Y127.533 E-.1789
G1 X114.946 Y127.939 E-.15572
G1 X114.953 Y128 E-.02319
G1 X114.896 Y128.467 E-.1789
G1 X114.886 Y128.495 E-.01133
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.792 J-.924 P1  F30000
G1 X111.806 Y125.857 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X111.194 Y126.4 E.03047
G1 X111.05 Y126.608 E.00943
G1 X110.857 Y126.548 E.00752
G1 X110.857 Y125.857 E.02573
G1 X111.746 Y125.857 E.03311
; WIPE_START
G1 F24000
G1 X111.194 Y126.4 E-.29423
G1 X111.05 Y126.608 E-.09621
G1 X110.857 Y126.548 E-.07668
G1 X110.857 Y125.857 E-.26254
G1 X110.937 Y125.857 E-.03033
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.199 J.207 P1  F30000
G1 X111.652 Y130.007 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X111.806 Y130.143 E.00764
G1 X110.857 Y130.143 E.03534
G1 X110.857 Y129.452 E.02573
G1 X111.05 Y129.392 E.00752
G1 X111.194 Y129.6 E.00943
G1 X111.608 Y129.967 E.0206
; WIPE_START
G1 F24000
G1 X111.806 Y130.143 E-.10076
G1 X110.857 Y130.143 E-.36058
G1 X110.857 Y129.452 E-.26254
G1 X110.948 Y129.424 E-.03611
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.037 J1.216 P1  F30000
G1 X149.6 Y130.6 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X110.4 Y130.6 E1.46005
G1 X110.4 Y125.4 E.19368
G1 X149.6 Y125.4 E1.46005
G1 X149.6 Y130.54 E.19145
; WIPE_START
G1 F24000
G1 X147.6 Y130.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.802 J.915 P1  F30000
G1 X149.124 Y129.207 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461116
G1 F3000
G1 X149.154 Y129.047 E.00553
; LINE_WIDTH: 0.421616
G1 X149.183 Y128.888 E.00501
; LINE_WIDTH: 0.382117
G1 X149.212 Y128.728 E.00448
; LINE_WIDTH: 0.336258
G2 X149.245 Y128.538 I-1.569 J-.37 E.00462
; LINE_WIDTH: 0.295585
G1 X149.261 Y128.275 E.00543
; LINE_WIDTH: 0.261217
G2 X149.277 Y127.989 I-2.356 J-.275 E.0051
; LINE_WIDTH: 0.231914
G1 X149.261 Y127.725 E.00406
; LINE_WIDTH: 0.267113
G2 X149.241 Y127.431 I-2.423 J.015 E.00539
; LINE_WIDTH: 0.303118
G1 X149.212 Y127.272 E.00344
; LINE_WIDTH: 0.342617
G1 X149.183 Y127.112 E.00396
; LINE_WIDTH: 0.382116
G1 X149.154 Y126.953 E.00448
; LINE_WIDTH: 0.421615
G1 X149.124 Y126.793 E.00501
; WIPE_START
G1 F24000
G1 X149.154 Y126.953 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.72 J-.981 P1  F30000
G1 X147.351 Y125.629 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.16302
G1 F3000
G3 X147.932 Y125.991 I-2.667 J4.931 E.00671
; LINE_WIDTH: 0.10292
G1 X148.06 Y126.079 E.00076
G1 X147.775 Y125.791 F30000
; LINE_WIDTH: 0.311476
G1 F3000
G1 X147.532 Y125.762 E.00537
; LINE_WIDTH: 0.257292
G2 X146.712 Y125.732 I-.652 J6.709 E.01433
; LINE_WIDTH: 0.250153
G1 X146.468 Y125.762 E.00414
; LINE_WIDTH: 0.280816
G1 X146.225 Y125.791 E.00476
G1 X145.94 Y126.079 F30000
; LINE_WIDTH: 0.136822
G1 F3000
G1 X146.068 Y125.991 E.00119
; LINE_WIDTH: 0.170725
G1 X146.196 Y125.902 E.00162
; LINE_WIDTH: 0.176519
G1 X146.649 Y125.629 E.00576
; WIPE_START
G1 F24000
G1 X146.196 Y125.902 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.516 J-1.102 P1  F30000
G1 X144.895 Y126.511 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.506332
G1 F6300
G1 X144.63 Y126.246 E.01416
G1 X143.974 Y126.246 E.02475
M73 P54 R5
G1 X144.491 Y126.763 E.02762
G1 X144.311 Y127.238 E.01919
G1 X143.319 Y126.246 E.05299
G1 X142.664 Y126.246 E.02475
G1 X144.219 Y127.801 E.08309
G1 X144.195 Y128 E.00755
G1 X144.255 Y128.492 E.01873
G1 X142.008 Y126.246 E.11999
G1 X141.353 Y126.246 E.02475
G1 X144.753 Y129.645 E.18156
G1 X144.828 Y129.754 E.00501
G1 X144.206 Y129.754 E.02347
G1 X140.697 Y126.246 E.18738
G1 X140.042 Y126.246 E.02475
G1 X143.551 Y129.754 E.18738
G1 X142.896 Y129.754 E.02475
G1 X139.387 Y126.246 E.18738
G1 X138.731 Y126.246 E.02475
G1 X142.24 Y129.754 E.18738
G1 X141.585 Y129.754 E.02475
G1 X138.076 Y126.246 E.18738
G1 X137.421 Y126.246 E.02475
G1 X140.929 Y129.754 E.18738
G1 X140.274 Y129.754 E.02475
G1 X136.765 Y126.246 E.18738
G1 X136.11 Y126.246 E.02475
G1 X139.619 Y129.754 E.18738
G1 X138.963 Y129.754 E.02475
G1 X135.455 Y126.246 E.18738
G1 X134.799 Y126.246 E.02475
G1 X138.308 Y129.754 E.18738
G1 X137.653 Y129.754 E.02475
G1 X134.144 Y126.246 E.18738
G1 X133.488 Y126.246 E.02475
G1 X136.997 Y129.754 E.18738
G1 X136.342 Y129.754 E.02475
G1 X132.833 Y126.246 E.18738
G1 X132.178 Y126.246 E.02475
G1 X135.687 Y129.754 E.18738
G1 X135.031 Y129.754 E.02475
G1 X131.522 Y126.246 E.18738
G1 X130.867 Y126.246 E.02475
G1 X134.376 Y129.754 E.18738
G1 X133.72 Y129.754 E.02475
G1 X130.212 Y126.246 E.18738
G1 X129.556 Y126.246 E.02475
G1 X133.065 Y129.754 E.18738
G1 X132.41 Y129.754 E.02475
G1 X128.901 Y126.246 E.18738
G1 X128.246 Y126.246 E.02475
G1 X131.754 Y129.754 E.18738
G1 X131.099 Y129.754 E.02475
G1 X127.59 Y126.246 E.18738
G1 X126.935 Y126.246 E.02475
G1 X130.444 Y129.754 E.18738
G1 X129.788 Y129.754 E.02475
G1 X126.279 Y126.246 E.18738
G1 X125.624 Y126.246 E.02475
G1 X129.133 Y129.754 E.18738
G1 X128.478 Y129.754 E.02475
G1 X124.969 Y126.246 E.18738
G1 X124.313 Y126.246 E.02475
G1 X127.822 Y129.754 E.18738
G1 X127.167 Y129.754 E.02475
G1 X123.658 Y126.246 E.18738
G1 X123.003 Y126.246 E.02475
G1 X126.511 Y129.754 E.18738
G1 X125.856 Y129.754 E.02475
G1 X122.347 Y126.246 E.18738
G1 X121.692 Y126.246 E.02475
G1 X125.201 Y129.754 E.18738
G1 X124.545 Y129.754 E.02475
G1 X121.037 Y126.246 E.18738
G1 X120.381 Y126.246 E.02475
G1 X123.89 Y129.754 E.18738
G1 X123.235 Y129.754 E.02475
G1 X119.726 Y126.246 E.18738
G1 X119.07 Y126.246 E.02475
G1 X122.579 Y129.754 E.18738
G1 X121.924 Y129.754 E.02475
G1 X118.415 Y126.246 E.18738
G1 X117.76 Y126.246 E.02475
G1 X121.269 Y129.754 E.18738
G1 X120.613 Y129.754 E.02475
G1 X117.104 Y126.246 E.18738
G1 X116.449 Y126.246 E.02475
G1 X119.958 Y129.754 E.18738
G1 X119.302 Y129.754 E.02475
G1 X115.794 Y126.246 E.18738
G1 X115.172 Y126.246 E.02347
G1 X115.248 Y126.355 E.00503
G1 X118.647 Y129.754 E.18154
G1 X117.992 Y129.754 E.02475
G1 X115.745 Y127.508 E.11999
G1 X115.805 Y128 E.01873
G1 X115.781 Y128.199 E.00756
G1 X117.336 Y129.754 E.08308
G1 X116.681 Y129.754 E.02475
G1 X115.689 Y128.762 E.05299
G1 X115.509 Y129.237 E.01919
G1 X116.026 Y129.754 E.02761
G1 X115.37 Y129.754 E.02475
G1 X115.105 Y129.489 E.01416
; WIPE_START
M73 P55 R5
G1 F24000
G1 X115.37 Y129.754 E-.14244
G1 X116.026 Y129.754 E-.24904
G1 X115.509 Y129.237 E-.27788
G1 X115.593 Y129.014 E-.09064
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.63 J-1.041 P1  F30000
G1 X113.351 Y130.371 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.16302
G1 F3000
G2 X113.932 Y130.009 I-2.668 J-4.933 E.00671
; LINE_WIDTH: 0.10292
G1 X114.06 Y129.921 E.00076
G1 X113.775 Y130.209 F30000
; LINE_WIDTH: 0.311476
G1 F3000
G1 X113.532 Y130.238 E.00537
; LINE_WIDTH: 0.257293
G3 X112.712 Y130.268 I-.652 J-6.709 E.01433
; LINE_WIDTH: 0.250152
G1 X112.468 Y130.238 E.00414
; LINE_WIDTH: 0.280814
G1 X112.225 Y130.209 E.00476
G1 X111.94 Y129.921 F30000
; LINE_WIDTH: 0.136822
G1 F3000
G1 X112.068 Y130.009 E.00119
; LINE_WIDTH: 0.170723
G1 X112.196 Y130.098 E.00162
; LINE_WIDTH: 0.176517
G1 X112.649 Y130.371 E.00576
; WIPE_START
G1 F24000
G1 X112.196 Y130.098 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.681 J-1.009 P1  F30000
G1 X110.876 Y129.207 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.421617
G1 F3000
G1 X110.846 Y129.047 E.00501
; LINE_WIDTH: 0.382117
G1 X110.817 Y128.888 E.00448
; LINE_WIDTH: 0.342618
G1 X110.788 Y128.728 E.00396
; LINE_WIDTH: 0.303118
G1 X110.759 Y128.569 E.00344
; LINE_WIDTH: 0.267115
G3 X110.739 Y128.275 I2.404 J-.309 E.00539
; LINE_WIDTH: 0.231918
G1 X110.723 Y128.011 E.00406
; LINE_WIDTH: 0.26122
G3 X110.739 Y127.725 I2.372 J-.011 E.0051
; LINE_WIDTH: 0.295586
G1 X110.755 Y127.462 E.00543
; LINE_WIDTH: 0.336259
G3 X110.788 Y127.272 I1.603 J.18 E.00462
; LINE_WIDTH: 0.382118
G1 X110.817 Y127.112 E.00448
; LINE_WIDTH: 0.421617
G1 X110.846 Y126.953 E.00501
; LINE_WIDTH: 0.461115
G1 X110.876 Y126.793 E.00553
; WIPE_START
G1 F24000
G1 X110.846 Y126.953 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.72 J.981 P1  F30000
G1 X112.649 Y125.629 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.176515
G1 F3000
G1 X112.196 Y125.902 E.00576
; LINE_WIDTH: 0.170721
G1 X112.068 Y125.991 E.00162
; LINE_WIDTH: 0.13682
G1 X111.94 Y126.079 E.00119
G1 X112.225 Y125.791 F30000
; LINE_WIDTH: 0.280814
G1 F3000
G1 X112.468 Y125.762 E.00476
; LINE_WIDTH: 0.250152
G1 X112.712 Y125.732 E.00414
; LINE_WIDTH: 0.257293
G3 X113.532 Y125.762 I.167 J6.739 E.01433
; LINE_WIDTH: 0.311475
G1 X113.775 Y125.791 E.00537
G1 X114.06 Y126.079 F30000
; LINE_WIDTH: 0.10292
G1 F3000
G1 X113.932 Y125.991 E.00076
; LINE_WIDTH: 0.16302
G2 X113.351 Y125.629 I-3.252 J4.574 E.00671
; WIPE_START
G1 F24000
G1 X113.932 Y125.991 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.162 J1.206 P1  F30000
G1 X146.649 Y130.371 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.176516
G1 F3000
G1 X146.196 Y130.098 E.00576
; LINE_WIDTH: 0.170723
G1 X146.068 Y130.009 E.00162
; LINE_WIDTH: 0.136822
G1 X145.94 Y129.921 E.00119
G1 X146.225 Y130.209 F30000
; LINE_WIDTH: 0.280814
G1 F3000
G1 X146.468 Y130.238 E.00476
; LINE_WIDTH: 0.250152
G1 X146.712 Y130.268 E.00414
; LINE_WIDTH: 0.257293
G2 X147.532 Y130.238 I.167 J-6.739 E.01433
; LINE_WIDTH: 0.311478
G1 X147.775 Y130.209 E.00537
G1 X148.06 Y129.921 F30000
; LINE_WIDTH: 0.10292
G1 F3000
G1 X147.932 Y130.009 E.00076
; LINE_WIDTH: 0.163022
G3 X147.351 Y130.371 I-3.253 J-4.575 E.00671
; WIPE_START
G1 F24000
G1 X147.932 Y130.009 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.201 J-.197 P1  F30000
G1 X145.161 Y113.12 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X145.467 Y113.563 E.02007
G1 X146.079 Y114.106 E.03047
G1 X114.467 Y114.106 E1.17743
G1 X115.079 Y113.563 E.03047
G1 X115.41 Y113.084 E.02167
G1 X115.616 Y112.54 E.02167
G1 X115.686 Y111.963 E.02167
G1 X115.616 Y111.385 E.02167
G1 X115.41 Y110.841 E.02167
G1 X115.079 Y110.362 E.02167
G1 X114.467 Y109.82 E.03047
G1 X146.079 Y109.82 E1.17743
G1 X145.467 Y110.362 E.03047
G1 X145.136 Y110.841 E.02167
G1 X144.93 Y111.385 E.02167
G1 X144.86 Y111.963 E.02167
G1 X144.93 Y112.54 E.02167
G1 X145.13 Y113.068 E.02104
G1 X145.538 Y112.854 F30000
; FEATURE: Outer wall
G1 F3000
G1 X145.377 Y112.43 E.01688
G1 X145.32 Y111.963 E.01754
G1 X145.327 Y111.902 E.00227
G1 X145.377 Y111.495 E.01526
G1 X145.544 Y111.055 E.01754
G1 X145.811 Y110.668 E.01754
G1 X146.164 Y110.355 E.01754
G1 X146.581 Y110.137 E.01754
M73 P56 R5
G1 X147.038 Y110.024 E.01754
G1 X147.508 Y110.024 E.01754
G1 X147.966 Y110.137 E.01754
G1 X148.382 Y110.355 E.01754
G1 X148.735 Y110.668 E.01754
G1 X149.002 Y111.055 E.01754
G1 X149.169 Y111.495 E.01754
G1 X149.226 Y111.963 E.01754
G1 X149.169 Y112.43 E.01754
G1 X149.002 Y112.87 E.01754
G1 X148.735 Y113.258 E.01754
G1 X148.382 Y113.57 E.01754
G1 X147.966 Y113.789 E.01754
G1 X147.508 Y113.901 E.01754
G1 X147.038 Y113.901 E.01754
G1 X146.581 Y113.789 E.01754
G1 X146.164 Y113.57 E.01754
G1 X145.811 Y113.258 E.01754
G1 X145.568 Y112.905 E.01595
; WIPE_START
G1 F24000
G1 X145.377 Y112.43 E-.19462
G1 X145.32 Y111.963 E-.1789
G1 X145.327 Y111.902 E-.02319
G1 X145.377 Y111.495 E-.15572
G1 X145.544 Y111.055 E-.1789
G1 X145.587 Y110.993 E-.02867
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.459 J1.127 P1  F30000
G1 X148.467 Y109.82 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X149.416 Y109.82 E.03534
G1 X149.416 Y110.511 E.02573
G1 X149.223 Y110.571 E.00752
G1 X149.079 Y110.362 E.00943
G1 X148.512 Y109.86 E.02824
; WIPE_START
G1 F24000
G1 X149.416 Y109.82 E-.34385
G1 X149.416 Y110.511 E-.26254
G1 X149.223 Y110.571 E-.07668
G1 X149.108 Y110.404 E-.07692
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.199 J-.208 P1  F30000
G1 X148.467 Y114.106 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X149.079 Y113.563 E.03047
G1 X149.223 Y113.355 E.00943
G1 X149.416 Y113.415 E.00752
G1 X149.416 Y114.106 E.02573
G1 X148.527 Y114.106 E.03311
; WIPE_START
G1 F24000
G1 X149.079 Y113.563 E-.29423
G1 X149.223 Y113.355 E-.09621
G1 X149.416 Y113.415 E-.07668
G1 X149.416 Y114.106 E-.26254
G1 X149.336 Y114.106 E-.03033
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.121 J-1.211 P1  F30000
G1 X114.715 Y110.65 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X114.735 Y110.668 E.001
G1 X115.002 Y111.055 E.01754
G1 X115.169 Y111.495 E.01754
G1 X115.219 Y111.902 E.01526
G1 X115.226 Y111.963 E.00227
G1 X115.169 Y112.43 E.01754
G1 X115.002 Y112.87 E.01754
G1 X114.735 Y113.258 E.01754
G1 X114.382 Y113.57 E.01754
G1 X113.966 Y113.789 E.01754
G1 X113.508 Y113.901 E.01754
G1 X113.038 Y113.901 E.01754
G1 X112.581 Y113.789 E.01754
G1 X112.164 Y113.57 E.01754
G1 X111.811 Y113.258 E.01754
G1 X111.544 Y112.87 E.01754
G1 X111.377 Y112.43 E.01754
G1 X111.32 Y111.963 E.01754
G1 X111.327 Y111.902 E.00227
G1 X111.377 Y111.495 E.01526
G1 X111.544 Y111.055 E.01754
G1 X111.811 Y110.668 E.01754
G1 X112.164 Y110.355 E.01754
G1 X112.581 Y110.137 E.01754
G1 X113.038 Y110.024 E.01754
G1 X113.508 Y110.024 E.01754
G1 X113.966 Y110.137 E.01754
G1 X114.382 Y110.355 E.01754
G1 X114.67 Y110.61 E.0143
; WIPE_START
G1 F24000
G1 X114.735 Y110.668 E-.03305
G1 X115.002 Y111.055 E-.17891
G1 X115.169 Y111.495 E-.1789
G1 X115.219 Y111.902 E-.15572
G1 X115.226 Y111.963 E-.02319
G1 X115.169 Y112.43 E-.1789
G1 X115.159 Y112.458 E-.01133
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.792 J-.924 P1  F30000
G1 X112.079 Y109.82 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X111.467 Y110.362 E.03047
G1 X111.323 Y110.571 E.00943
G1 X111.13 Y110.511 E.00752
G1 X111.13 Y109.82 E.02573
G1 X112.019 Y109.82 E.03311
; WIPE_START
G1 F24000
G1 X111.467 Y110.362 E-.29423
G1 X111.323 Y110.571 E-.09621
G1 X111.13 Y110.511 E-.07668
G1 X111.13 Y109.82 E-.26254
G1 X111.21 Y109.82 E-.03033
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.199 J.207 P1  F30000
G1 X111.925 Y113.97 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X112.079 Y114.106 E.00764
G1 X111.13 Y114.106 E.03534
G1 X111.13 Y113.415 E.02573
G1 X111.323 Y113.355 E.00752
G1 X111.467 Y113.563 E.00943
G1 X111.881 Y113.93 E.0206
; WIPE_START
G1 F24000
G1 X112.079 Y114.106 E-.10076
G1 X111.13 Y114.106 E-.36058
G1 X111.13 Y113.415 E-.26254
G1 X111.221 Y113.386 E-.03611
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.037 J1.216 P1  F30000
G1 X149.873 Y114.563 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X110.673 Y114.563 E1.46005
G1 X110.673 Y109.363 E.19368
G1 X149.873 Y109.363 E1.46005
G1 X149.873 Y114.503 E.19145
; WIPE_START
G1 F24000
G1 X147.873 Y114.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.802 J.915 P1  F30000
G1 X149.397 Y113.17 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461116
G1 F3000
G1 X149.427 Y113.01 E.00553
; LINE_WIDTH: 0.421616
G1 X149.456 Y112.85 E.00501
; LINE_WIDTH: 0.382117
G1 X149.485 Y112.691 E.00448
; LINE_WIDTH: 0.336258
G2 X149.518 Y112.5 I-1.569 J-.37 E.00462
; LINE_WIDTH: 0.295585
G1 X149.534 Y112.237 E.00543
; LINE_WIDTH: 0.261217
G2 X149.55 Y111.951 I-2.356 J-.275 E.0051
; LINE_WIDTH: 0.231914
G1 X149.534 Y111.688 E.00406
; LINE_WIDTH: 0.267113
G2 X149.514 Y111.394 I-2.423 J.015 E.00539
; LINE_WIDTH: 0.303118
M73 P57 R5
G1 X149.485 Y111.234 E.00344
; LINE_WIDTH: 0.342617
G1 X149.456 Y111.075 E.00396
; LINE_WIDTH: 0.382116
G1 X149.427 Y110.915 E.00448
; LINE_WIDTH: 0.421615
G1 X149.397 Y110.756 E.00501
; WIPE_START
G1 F24000
G1 X149.427 Y110.915 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.72 J-.981 P1  F30000
G1 X147.624 Y109.591 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.16302
G1 F3000
G3 X148.205 Y109.953 I-2.667 J4.931 E.00671
; LINE_WIDTH: 0.10292
G1 X148.333 Y110.042 E.00076
G1 X148.048 Y109.754 F30000
; LINE_WIDTH: 0.311476
G1 F3000
G1 X147.805 Y109.724 E.00537
; LINE_WIDTH: 0.257292
G2 X146.985 Y109.695 I-.652 J6.709 E.01433
; LINE_WIDTH: 0.250153
G1 X146.742 Y109.724 E.00414
; LINE_WIDTH: 0.280816
G1 X146.498 Y109.754 E.00476
G1 X146.213 Y110.042 F30000
; LINE_WIDTH: 0.136822
G1 F3000
G1 X146.341 Y109.953 E.00119
; LINE_WIDTH: 0.170725
G1 X146.469 Y109.865 E.00162
; LINE_WIDTH: 0.176519
G1 X146.922 Y109.591 E.00576
; WIPE_START
G1 F24000
G1 X146.469 Y109.865 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.516 J-1.102 P1  F30000
G1 X145.168 Y110.473 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.506332
G1 F6300
G1 X144.903 Y110.208 E.01416
G1 X144.247 Y110.208 E.02475
G1 X144.764 Y110.725 E.02762
G1 X144.584 Y111.201 E.01919
G1 X143.592 Y110.208 E.05299
G1 X142.937 Y110.208 E.02475
G1 X144.492 Y111.764 E.08309
G1 X144.468 Y111.963 E.00755
G1 X144.528 Y112.455 E.01873
G1 X142.281 Y110.208 E.11999
G1 X141.626 Y110.208 E.02475
G1 X145.026 Y113.608 E.18156
G1 X145.101 Y113.717 E.00501
G1 X144.479 Y113.717 E.02347
G1 X140.97 Y110.208 E.18738
G1 X140.315 Y110.208 E.02475
G1 X143.824 Y113.717 E.18738
G1 X143.169 Y113.717 E.02475
G1 X139.66 Y110.208 E.18738
G1 X139.004 Y110.208 E.02475
G1 X142.513 Y113.717 E.18738
G1 X141.858 Y113.717 E.02475
G1 X138.349 Y110.208 E.18738
G1 X137.694 Y110.208 E.02475
G1 X141.202 Y113.717 E.18738
G1 X140.547 Y113.717 E.02475
G1 X137.038 Y110.208 E.18738
G1 X136.383 Y110.208 E.02475
G1 X139.892 Y113.717 E.18738
G1 X139.236 Y113.717 E.02475
G1 X135.728 Y110.208 E.18738
G1 X135.072 Y110.208 E.02475
G1 X138.581 Y113.717 E.18738
G1 X137.926 Y113.717 E.02475
G1 X134.417 Y110.208 E.18738
G1 X133.761 Y110.208 E.02475
G1 X137.27 Y113.717 E.18738
G1 X136.615 Y113.717 E.02475
G1 X133.106 Y110.208 E.18738
G1 X132.451 Y110.208 E.02475
G1 X135.96 Y113.717 E.18738
G1 X135.304 Y113.717 E.02475
G1 X131.795 Y110.208 E.18738
G1 X131.14 Y110.208 E.02475
G1 X134.649 Y113.717 E.18738
G1 X133.993 Y113.717 E.02475
G1 X130.485 Y110.208 E.18738
G1 X129.829 Y110.208 E.02475
G1 X133.338 Y113.717 E.18738
G1 X132.683 Y113.717 E.02475
G1 X129.174 Y110.208 E.18738
G1 X128.519 Y110.208 E.02475
G1 X132.027 Y113.717 E.18738
G1 X131.372 Y113.717 E.02475
G1 X127.863 Y110.208 E.18738
G1 X127.208 Y110.208 E.02475
G1 X130.717 Y113.717 E.18738
G1 X130.061 Y113.717 E.02475
G1 X126.552 Y110.208 E.18738
G1 X125.897 Y110.208 E.02475
G1 X129.406 Y113.717 E.18738
G1 X128.751 Y113.717 E.02475
G1 X125.242 Y110.208 E.18738
G1 X124.586 Y110.208 E.02475
G1 X128.095 Y113.717 E.18738
G1 X127.44 Y113.717 E.02475
G1 X123.931 Y110.208 E.18738
G1 X123.276 Y110.208 E.02475
G1 X126.784 Y113.717 E.18738
G1 X126.129 Y113.717 E.02475
G1 X122.62 Y110.208 E.18738
G1 X121.965 Y110.208 E.02475
G1 X125.474 Y113.717 E.18738
M73 P58 R5
G1 X124.818 Y113.717 E.02475
G1 X121.31 Y110.208 E.18738
G1 X120.654 Y110.208 E.02475
G1 X124.163 Y113.717 E.18738
G1 X123.508 Y113.717 E.02475
G1 X119.999 Y110.208 E.18738
G1 X119.343 Y110.208 E.02475
G1 X122.852 Y113.717 E.18738
G1 X122.197 Y113.717 E.02475
G1 X118.688 Y110.208 E.18738
G1 X118.033 Y110.208 E.02475
G1 X121.542 Y113.717 E.18738
G1 X120.886 Y113.717 E.02475
G1 X117.377 Y110.208 E.18738
G1 X116.722 Y110.208 E.02475
G1 X120.231 Y113.717 E.18738
G1 X119.575 Y113.717 E.02475
G1 X116.067 Y110.208 E.18738
G1 X115.445 Y110.208 E.02347
G1 X115.521 Y110.318 E.00503
G1 X118.92 Y113.717 E.18154
G1 X118.265 Y113.717 E.02475
G1 X116.018 Y111.47 E.11999
G1 X116.078 Y111.963 E.01873
G1 X116.054 Y112.161 E.00756
G1 X117.609 Y113.717 E.08308
G1 X116.954 Y113.717 E.02475
G1 X115.962 Y112.725 E.05299
G1 X115.782 Y113.2 E.01919
G1 X116.299 Y113.717 E.02761
G1 X115.643 Y113.717 E.02475
G1 X115.378 Y113.452 E.01416
; WIPE_START
G1 F24000
G1 X115.643 Y113.717 E-.14244
G1 X116.299 Y113.717 E-.24904
G1 X115.782 Y113.2 E-.27788
G1 X115.866 Y112.977 E-.09064
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.63 J-1.041 P1  F30000
G1 X113.624 Y114.334 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.16302
G1 F3000
G2 X114.205 Y113.972 I-2.668 J-4.933 E.00671
; LINE_WIDTH: 0.10292
G1 X114.333 Y113.884 E.00076
G1 X114.048 Y114.171 F30000
; LINE_WIDTH: 0.311476
G1 F3000
G1 X113.805 Y114.201 E.00537
; LINE_WIDTH: 0.257293
G3 X112.985 Y114.23 I-.652 J-6.709 E.01433
; LINE_WIDTH: 0.250152
G1 X112.742 Y114.201 E.00414
; LINE_WIDTH: 0.280814
G1 X112.498 Y114.171 E.00476
G1 X112.213 Y113.884 F30000
; LINE_WIDTH: 0.136822
G1 F3000
G1 X112.341 Y113.972 E.00119
; LINE_WIDTH: 0.170723
G1 X112.469 Y114.061 E.00162
; LINE_WIDTH: 0.176517
G1 X112.922 Y114.334 E.00576
; WIPE_START
G1 F24000
G1 X112.469 Y114.061 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.681 J-1.009 P1  F30000
G1 X111.149 Y113.17 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.421617
G1 F3000
G1 X111.119 Y113.01 E.00501
; LINE_WIDTH: 0.382117
G1 X111.09 Y112.85 E.00448
; LINE_WIDTH: 0.342618
G1 X111.061 Y112.691 E.00396
; LINE_WIDTH: 0.303118
G1 X111.032 Y112.531 E.00344
; LINE_WIDTH: 0.267115
G3 X111.012 Y112.237 I2.404 J-.309 E.00539
; LINE_WIDTH: 0.231918
G1 X110.996 Y111.974 E.00406
; LINE_WIDTH: 0.26122
G3 X111.012 Y111.688 I2.372 J-.011 E.0051
; LINE_WIDTH: 0.295586
G1 X111.028 Y111.425 E.00543
; LINE_WIDTH: 0.336259
G3 X111.061 Y111.234 I1.603 J.18 E.00462
; LINE_WIDTH: 0.382118
G1 X111.09 Y111.075 E.00448
; LINE_WIDTH: 0.421617
G1 X111.119 Y110.915 E.00501
; LINE_WIDTH: 0.461115
G1 X111.149 Y110.756 E.00553
; WIPE_START
G1 F24000
G1 X111.119 Y110.915 E-.76
; WIPE_END
M73 P59 R5
G1 E-.04 F1800
G17
G3 Z.6 I.72 J.981 P1  F30000
G1 X112.922 Y109.591 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.176515
G1 F3000
G1 X112.469 Y109.865 E.00576
; LINE_WIDTH: 0.170721
G1 X112.341 Y109.953 E.00162
; LINE_WIDTH: 0.13682
G1 X112.213 Y110.042 E.00119
G1 X112.498 Y109.754 F30000
; LINE_WIDTH: 0.280814
G1 F3000
G1 X112.742 Y109.724 E.00476
; LINE_WIDTH: 0.250152
G1 X112.985 Y109.695 E.00414
; LINE_WIDTH: 0.257293
G3 X113.805 Y109.724 I.167 J6.739 E.01433
; LINE_WIDTH: 0.311475
G1 X114.048 Y109.754 E.00537
G1 X114.333 Y110.042 F30000
; LINE_WIDTH: 0.10292
G1 F3000
G1 X114.205 Y109.953 E.00076
; LINE_WIDTH: 0.16302
G2 X113.624 Y109.591 I-3.252 J4.574 E.00671
; WIPE_START
G1 F24000
G1 X114.205 Y109.953 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.162 J1.206 P1  F30000
G1 X146.922 Y114.334 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.176516
G1 F3000
G1 X146.469 Y114.061 E.00576
; LINE_WIDTH: 0.170723
G1 X146.341 Y113.972 E.00162
; LINE_WIDTH: 0.136822
G1 X146.213 Y113.884 E.00119
G1 X146.498 Y114.171 F30000
; LINE_WIDTH: 0.280814
G1 F3000
G1 X146.742 Y114.201 E.00476
; LINE_WIDTH: 0.250152
G1 X146.985 Y114.23 E.00414
; LINE_WIDTH: 0.257293
G2 X147.805 Y114.201 I.167 J-6.739 E.01433
; LINE_WIDTH: 0.311478
G1 X148.048 Y114.171 E.00537
G1 X148.333 Y113.884 F30000
; LINE_WIDTH: 0.10292
G1 F3000
G1 X148.205 Y113.972 E.00076
; LINE_WIDTH: 0.163022
G3 X147.624 Y114.334 I-3.253 J-4.575 E.00671
M106 S247.35
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X148.205 Y113.972 E-.76
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
G3 Z.6 I-1.216 J-.057 P1  F30000
G1 X145.952 Y162.346 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.7 Y161.981 E.01471
G1 X145.654 Y161.86 E.00429
G1 X145.528 Y161.529 E.01175
G1 X145.47 Y161.048 E.01605
G1 X145.528 Y160.568 E.01605
G1 X145.7 Y160.116 E.01605
G1 X145.975 Y159.718 E.01605
G1 X146.337 Y159.397 E.01605
G1 X146.765 Y159.172 E.01605
G1 X147.235 Y159.057 E.01605
G1 X147.718 Y159.057 E.01605
G1 X148.188 Y159.172 E.01605
G1 X148.616 Y159.397 E.01605
G1 X148.713 Y159.483 E.00429
G1 X148.979 Y159.718 E.01175
G1 X149.253 Y160.116 E.01605
G1 X149.425 Y160.568 E.01605
G1 X149.483 Y161.048 E.01605
G1 X149.425 Y161.529 E.01605
G1 X149.253 Y161.981 E.01605
G1 X148.979 Y162.379 E.01605
G1 X148.616 Y162.7 E.01605
G1 X148.188 Y162.925 E.01605
G1 X147.718 Y163.04 E.01605
G1 X147.235 Y163.04 E.01605
G1 X146.765 Y162.925 E.01605
G1 X146.337 Y162.7 E.01605
G1 X145.99 Y162.392 E.01539
G1 X146.279 Y162.11 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X147.282 Y159.449 I1.2 J-1.067 E.10733
G3 X148.392 Y159.722 I.146 J1.797 E.03574
G1 X148.683 Y159.98 E.01194
G3 X146.319 Y162.154 I-1.204 J1.063 E.15301
M204 S10000
; WIPE_START
G1 F24000
G1 X146.05 Y161.797 E-.16982
G1 X145.912 Y161.434 E-.14763
G1 X145.865 Y161.048 E-.14763
G1 X145.912 Y160.663 E-.14763
G1 X146.049 Y160.3 E-.14729
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.068 J-1.215 P1  F30000
G1 X115.23 Y162.014 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.979 Y162.379 E.01471
G1 X114.616 Y162.7 E.01605
G1 X114.188 Y162.925 E.01605
G1 X113.718 Y163.04 E.01605
G1 X113.235 Y163.04 E.01605
G1 X112.765 Y162.925 E.01605
G1 X112.337 Y162.7 E.01605
G1 X111.975 Y162.379 E.01605
G1 X111.7 Y161.981 E.01605
G1 X111.528 Y161.529 E.01605
G1 X111.47 Y161.048 E.01605
G1 X111.528 Y160.568 E.01605
G1 X111.7 Y160.116 E.01605
G1 X111.975 Y159.718 E.01605
G1 X112.337 Y159.397 E.01605
G1 X112.451 Y159.337 E.00429
G1 X112.765 Y159.172 E.01175
G1 X113.235 Y159.057 E.01605
G1 X113.718 Y159.057 E.01605
G1 X114.188 Y159.172 E.01605
G1 X114.616 Y159.397 E.01605
G1 X114.979 Y159.718 E.01605
G1 X115.253 Y160.116 E.01605
G1 X115.425 Y160.568 E.01605
G1 X115.483 Y161.048 E.01605
G1 X115.425 Y161.529 E.01605
G1 X115.26 Y161.962 E.01539
G1 X114.894 Y161.793 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X112.561 Y159.722 I-1.42 J-.75 E.17869
G1 X112.905 Y159.542 E.01194
G1 X113.282 Y159.449 E.01194
G3 X114.921 Y161.739 I.192 J1.594 E.10555
M204 S10000
; WIPE_START
G1 F24000
G1 X114.683 Y162.117 E-.16986
G1 X114.392 Y162.375 E-.14763
G1 X114.048 Y162.555 E-.14763
G1 X113.671 Y162.648 E-.14763
G1 X113.283 Y162.648 E-.14725
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.027 J1.217 P1  F30000
G1 X149.875 Y163.446 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.079 Y163.446 E1.28693
G1 X111.079 Y158.651 E.15909
G1 X149.875 Y158.651 E1.28693
G1 X149.875 Y163.386 E.1571
G1 X150.267 Y163.838 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.687 Y163.838 E1.21618
G1 X110.687 Y158.258 E.17146
G1 X150.267 Y158.258 E1.21618
G1 X150.267 Y163.778 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.267 Y163.782 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.837 J.883 P1  F30000
G1 X149.153 Y162.942 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645608
G1 F10453.17
G1 X149.332 Y162.958 E.00881
G1 X149.263 Y162.368 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134651
G1 F15000
G1 X149.375 Y162.24 E.00127
; LINE_WIDTH: 0.172382
G1 X149.488 Y162.113 E.00179
; LINE_WIDTH: 0.178252
G1 X149.671 Y161.879 E.00327
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X149.614 Y161.766 E.00238
; LINE_WIDTH: 0.144825
G1 X149.649 Y161.574 E.00162
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.240634
G1 F15000
G1 X149.543 Y162.151 E.00315
G1 X148.571 Y162.98 F30000
; LINE_WIDTH: 0.0969196
G1 F15000
G1 X148.431 Y163.077 E.00075
; LINE_WIDTH: 0.137972
G1 X148.276 Y163.179 E.00143
; LINE_WIDTH: 0.17135
G1 X148.11 Y163.199 E.00176
; LINE_WIDTH: 0.134135
G1 X147.943 Y163.219 E.00125
G1 X147.01 Y163.219 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X146.844 Y163.199 E.00074
; LINE_WIDTH: 0.137457
G1 X146.662 Y163.174 E.00141
; LINE_WIDTH: 0.17238
G1 X146.522 Y163.077 E.00179
; LINE_WIDTH: 0.13465
G1 X146.383 Y162.98 E.00127
G1 X143.235 Y161.203 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351909
G1 F15000
G1 X143.235 Y160.894 E.00778
G1 X117.719 Y160.894 E.64246
G1 X117.719 Y161.203 E.00778
G1 X143.175 Y161.203 E.64094
G1 X143.568 Y161.048 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X143.616 Y160.551 E.01536
G1 X117.337 Y160.551 E.80748
G1 X117.385 Y161.048 E.01536
G1 X117.337 Y161.546 E.01536
G1 X143.616 Y161.546 E.80748
G1 X143.574 Y161.108 E.01351
G1 X143.955 Y161.208 F30000
G1 F15000
G3 X144.065 Y160.174 I4.479 J-.045 E.03201
G1 X116.888 Y160.174 E.83507
G1 X116.998 Y160.889 E.02225
G3 X116.888 Y161.923 I-4.479 J.045 E.03201
G1 X144.065 Y161.923 E.83507
G1 X143.964 Y161.267 E.0204
G1 X144.329 Y161.162 F30000
G1 F15000
G1 X144.394 Y160.406 E.02333
G1 X144.595 Y159.797 E.01971
G1 X116.358 Y159.797 E.86764
G1 X116.56 Y160.406 E.01971
G1 X116.624 Y160.935 E.01638
G1 X116.56 Y161.691 E.02333
G1 X116.358 Y162.3 E.01971
G1 X144.595 Y162.3 E.86764
G1 X144.394 Y161.691 E.01971
G1 X144.337 Y161.222 E.01454
G1 X144.704 Y161.117 F30000
G1 F15000
G1 X144.768 Y160.451 E.02055
G1 X144.99 Y159.82 E.02055
G1 X145.246 Y159.42 E.01461
G1 X115.707 Y159.42 E.90764
G1 X115.964 Y159.82 E.01461
G1 X116.153 Y160.319 E.01638
G1 X116.25 Y160.98 E.02055
G1 X116.185 Y161.646 E.02055
G1 X115.964 Y162.277 E.02055
G1 X115.707 Y162.677 E.01461
G1 X145.246 Y162.677 E.90764
G1 X144.99 Y162.277 E.01461
G1 X144.801 Y161.778 E.01638
G1 X144.712 Y161.176 E.0187
G1 X145.078 Y161.071 F30000
G1 F15000
G1 X145.142 Y160.497 E.01777
G1 X145.342 Y159.954 E.01777
G1 X145.666 Y159.475 E.01777
G3 X145.965 Y159.202 I1.272 J1.096 E.01247
G1 X145.904 Y159.112 E.00337
G1 X145.917 Y159.043 E.00216
G1 X115.03 Y159.043 E.94908
G3 X114.988 Y159.202 I-.121 J.054 E.00549
G1 X115.287 Y159.475 E.01244
G1 X115.59 Y159.914 E.01638
G1 X115.8 Y160.452 E.01777
G1 X115.875 Y161.026 E.01777
G1 X115.811 Y161.6 E.01777
G1 X115.611 Y162.143 E.01777
G1 X115.287 Y162.622 E.01777
G1 X114.988 Y162.895 E.01244
G1 X115.047 Y162.983 E.00327
G1 X115.03 Y163.054 E.00226
G1 X145.914 Y163.054 E.94898
G3 X145.965 Y162.895 I.117 J-.051 E.00562
M73 P60 R5
G1 X145.666 Y162.622 E.01244
G1 X145.363 Y162.183 E.01638
G1 X145.153 Y161.645 E.01777
G1 X145.086 Y161.131 E.01593
G1 X146.383 Y159.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134651
G1 F15000
G1 X146.522 Y159.02 E.00127
; LINE_WIDTH: 0.172382
G1 X146.662 Y158.923 E.00179
; LINE_WIDTH: 0.137457
G1 X146.844 Y158.898 E.00141
; LINE_WIDTH: 0.0969201
G1 X147.01 Y158.878 E.00074
G1 X147.943 Y158.878 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X148.11 Y158.898 E.00125
; LINE_WIDTH: 0.17135
G1 X148.276 Y158.918 E.00176
; LINE_WIDTH: 0.137974
G1 X148.431 Y159.02 E.00143
; LINE_WIDTH: 0.0969199
G1 X148.571 Y159.117 E.00075
G1 X149.151 Y159.156 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.646692
G1 F10434.403
G1 X149.332 Y159.139 E.00891
G1 X149.263 Y159.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134651
G1 F15000
G1 X149.375 Y159.857 E.00127
; LINE_WIDTH: 0.172381
G1 X149.488 Y159.984 E.00179
; LINE_WIDTH: 0.17825
G1 X149.671 Y160.218 E.00327
G1 X149.578 Y160.138 F30000
; LINE_WIDTH: 0.192728
G1 F15000
G1 X149.543 Y159.946 E.00238
G1 X149.578 Y160.138 F30000
; LINE_WIDTH: 0.144824
G1 F15000
G1 X149.614 Y160.331 E.00162
; LINE_WIDTH: 0.09692
G1 X149.649 Y160.523 E.00086
; WIPE_START
G1 F24000
G1 X149.614 Y160.331 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.042 J-1.216 P1  F30000
G1 X114.571 Y159.117 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.0969202
G1 F15000
G1 X114.431 Y159.02 E.00075
; LINE_WIDTH: 0.137971
G1 X114.276 Y158.918 E.00143
; LINE_WIDTH: 0.17135
G1 X114.11 Y158.898 E.00176
; LINE_WIDTH: 0.134135
G1 X113.943 Y158.878 E.00125
G1 X113.01 Y158.878 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X112.844 Y158.898 E.00074
; LINE_WIDTH: 0.137458
G1 X112.662 Y158.923 E.00141
; LINE_WIDTH: 0.172383
G1 X112.522 Y159.02 E.00179
; LINE_WIDTH: 0.134651
G1 X112.383 Y159.117 E.00127
G1 X111.572 Y159.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.606332
G1 F11181.87
G1 X111.739 Y159.15 E.00769
G1 X111.691 Y159.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969206
G1 F15000
G1 X111.578 Y159.857 E.00075
; LINE_WIDTH: 0.158639
G2 X111.282 Y160.218 I2.802 J2.596 E.0044
G1 X111.375 Y160.138 F30000
; LINE_WIDTH: 0.240632
G1 F15000
G1 X111.41 Y159.946 E.00315
G1 X111.375 Y160.138 F30000
; LINE_WIDTH: 0.192728
G1 F15000
G1 X111.34 Y160.331 E.00238
; LINE_WIDTH: 0.144824
G1 X111.304 Y160.523 E.00162
G1 X111.304 Y161.574 F30000
; LINE_WIDTH: 0.144825
G1 F15000
G1 X111.34 Y161.766 E.00162
; LINE_WIDTH: 0.19273
G1 X111.375 Y161.959 E.00238
; LINE_WIDTH: 0.240634
G1 X111.41 Y162.151 E.00315
G1 X111.578 Y162.24 F30000
; LINE_WIDTH: 0.15864
G1 F15000
G3 X111.282 Y161.879 I2.802 J-2.596 E.0044
G1 X111.578 Y162.24 F30000
; LINE_WIDTH: 0.096921
G1 F15000
G1 X111.691 Y162.368 E.00075
G1 X111.565 Y162.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608156
G1 F11145.788
G1 X111.739 Y162.946 E.00805
G1 X112.383 Y162.98 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134649
G1 F15000
G1 X112.522 Y163.077 E.00127
; LINE_WIDTH: 0.172379
G1 X112.662 Y163.174 E.00179
; LINE_WIDTH: 0.137457
G1 X112.844 Y163.199 E.00141
; LINE_WIDTH: 0.0969204
G1 X113.01 Y163.219 E.00074
G1 X113.943 Y163.219 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X114.11 Y163.199 E.00125
; LINE_WIDTH: 0.17135
G1 X114.276 Y163.179 E.00176
; LINE_WIDTH: 0.137969
G1 X114.431 Y163.077 E.00143
; LINE_WIDTH: 0.0969194
G1 X114.571 Y162.98 E.00075
; WIPE_START
G1 F24000
G1 X114.431 Y163.077 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.537 J1.092 P1  F30000
G1 X146.644 Y147.233 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.392 Y146.868 E.01471
G1 X146.346 Y146.747 E.00429
G1 X146.221 Y146.416 E.01175
G1 X146.162 Y145.936 E.01605
G1 X146.221 Y145.456 E.01605
G1 X146.392 Y145.003 E.01605
G1 X146.667 Y144.605 E.01605
G1 X147.029 Y144.284 E.01605
G1 X147.457 Y144.06 E.01605
G1 X147.927 Y143.944 E.01605
G1 X148.411 Y143.944 E.01605
G1 X148.88 Y144.06 E.01605
G1 X149.309 Y144.284 E.01605
G1 X149.406 Y144.37 E.00429
G1 X149.671 Y144.605 E.01175
G1 X149.946 Y145.003 E.01605
G1 X150.117 Y145.456 E.01605
G1 X150.175 Y145.936 E.01605
G1 X150.117 Y146.416 E.01605
G1 X149.946 Y146.868 E.01605
G1 X149.671 Y147.266 E.01605
G1 X149.309 Y147.587 E.01605
G1 X148.88 Y147.812 E.01605
G1 X148.411 Y147.928 E.01605
G1 X147.927 Y147.928 E.01605
G1 X147.457 Y147.812 E.01605
G1 X147.029 Y147.587 E.01605
G1 X146.682 Y147.28 E.01539
G1 X146.971 Y146.997 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X147.975 Y144.336 I1.2 J-1.067 E.10733
G3 X149.084 Y144.61 I.146 J1.797 E.03574
G1 X149.375 Y144.867 E.01194
G3 X147.012 Y147.041 I-1.204 J1.063 E.15301
M204 S10000
; WIPE_START
G1 F24000
G1 X146.742 Y146.685 E-.16982
G1 X146.604 Y146.321 E-.14763
G1 X146.557 Y145.936 E-.14763
G1 X146.604 Y145.55 E-.14763
G1 X146.742 Y145.188 E-.14729
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.068 J-1.215 P1  F30000
G1 X115.923 Y146.901 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.671 Y147.266 E.01471
G1 X115.309 Y147.587 E.01605
G1 X114.88 Y147.812 E.01605
G1 X114.411 Y147.928 E.01605
G1 X113.927 Y147.928 E.01605
G1 X113.457 Y147.812 E.01605
G1 X113.029 Y147.587 E.01605
G1 X112.667 Y147.266 E.01605
G1 X112.392 Y146.868 E.01605
G1 X112.221 Y146.416 E.01605
G1 X112.162 Y145.936 E.01605
G1 X112.221 Y145.456 E.01605
G1 X112.392 Y145.003 E.01605
G1 X112.667 Y144.605 E.01605
G1 X113.029 Y144.284 E.01605
G1 X113.144 Y144.224 E.00429
G1 X113.457 Y144.06 E.01175
G1 X113.927 Y143.944 E.01605
G1 X114.411 Y143.944 E.01605
G1 X114.88 Y144.06 E.01605
G1 X115.309 Y144.284 E.01605
G1 X115.671 Y144.605 E.01605
G1 X115.946 Y145.003 E.01605
G1 X116.117 Y145.456 E.01605
G1 X116.175 Y145.936 E.01605
G1 X116.117 Y146.416 E.01605
G1 X115.953 Y146.85 E.01539
G1 X115.587 Y146.68 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X113.253 Y144.61 I-1.42 J-.75 E.17869
G1 X113.597 Y144.429 E.01194
G1 X113.975 Y144.336 E.01194
G3 X115.614 Y146.626 I.192 J1.594 E.10555
M204 S10000
; WIPE_START
G1 F24000
G1 X115.375 Y147.004 E-.16986
G1 X115.084 Y147.262 E-.14763
G1 X114.74 Y147.443 E-.14763
G1 X114.363 Y147.536 E-.14763
G1 X113.976 Y147.536 E-.14725
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.027 J1.217 P1  F30000
G1 X150.567 Y148.334 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.771 Y148.334 E1.28693
G1 X111.771 Y143.538 E.15909
G1 X150.567 Y143.538 E1.28693
M73 P60 R4
G1 X150.567 Y148.274 E.1571
G1 X150.959 Y148.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.379 Y148.726 E1.21618
G1 X111.379 Y143.146 E.17146
G1 X150.959 Y143.146 E1.21618
G1 X150.959 Y148.666 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.959 Y148.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.837 J.883 P1  F30000
G1 X149.845 Y147.829 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645608
G1 F10453.17
G1 X150.024 Y147.845 E.00881
G1 X149.955 Y147.255 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134651
G1 F15000
G1 X150.068 Y147.128 E.00127
; LINE_WIDTH: 0.172382
G1 X150.18 Y147 E.00179
; LINE_WIDTH: 0.178252
G1 X150.363 Y146.767 E.00327
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X150.306 Y146.654 E.00238
; LINE_WIDTH: 0.144825
G1 X150.341 Y146.462 E.00162
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.240634
G1 F15000
G1 X150.236 Y147.038 E.00315
G1 X149.263 Y147.868 F30000
; LINE_WIDTH: 0.0969196
G1 F15000
G1 X149.123 Y147.964 E.00075
; LINE_WIDTH: 0.137972
G1 X148.969 Y148.066 E.00143
; LINE_WIDTH: 0.17135
G1 X148.802 Y148.086 E.00176
; LINE_WIDTH: 0.134135
G1 X148.635 Y148.106 E.00125
G1 X147.703 Y148.106 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X147.536 Y148.086 E.00074
; LINE_WIDTH: 0.137457
G1 X147.355 Y148.061 E.00141
; LINE_WIDTH: 0.17238
G1 X147.215 Y147.964 E.00179
; LINE_WIDTH: 0.13465
G1 X147.075 Y147.868 E.00127
G1 X143.927 Y146.09 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351909
G1 F15000
G1 X143.927 Y145.781 E.00778
G1 X118.411 Y145.781 E.64246
G1 X118.411 Y146.09 E.00778
G1 X143.867 Y146.09 E.64094
G1 X144.261 Y145.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X144.308 Y145.438 E.01536
G1 X118.029 Y145.438 E.80748
G1 X118.077 Y145.936 E.01536
G1 X118.029 Y146.433 E.01536
G1 X144.308 Y146.433 E.80748
G1 X144.266 Y145.996 E.01351
G1 X144.647 Y146.095 F30000
G1 F15000
G3 X144.757 Y145.061 I4.479 J-.045 E.03201
G1 X117.58 Y145.061 E.83507
G1 X117.691 Y145.777 E.02225
G3 X117.58 Y146.81 I-4.479 J.045 E.03201
G1 X144.757 Y146.81 E.83507
G1 X144.656 Y146.154 E.0204
G1 X145.022 Y146.049 F30000
G1 F15000
G1 X145.086 Y145.293 E.02333
G1 X145.287 Y144.684 E.01971
G1 X117.05 Y144.684 E.86764
G1 X117.252 Y145.293 E.01971
G1 X117.316 Y145.822 E.01638
G1 X117.252 Y146.579 E.02333
G1 X117.05 Y147.187 E.01971
G1 X145.287 Y147.187 E.86764
G1 X145.086 Y146.579 E.01971
G1 X145.029 Y146.109 E.01454
G1 X145.396 Y146.004 F30000
G1 F15000
G1 X145.46 Y145.338 E.02055
G1 X145.682 Y144.707 E.02055
G1 X145.938 Y144.307 E.01461
G1 X116.4 Y144.307 E.90764
G1 X116.656 Y144.707 E.01461
G1 X116.845 Y145.206 E.01638
G1 X116.942 Y145.868 E.02055
G1 X116.878 Y146.533 E.02055
G1 X116.656 Y147.164 E.02055
G1 X116.4 Y147.565 E.01461
G1 X145.938 Y147.565 E.90764
G1 X145.682 Y147.164 E.01461
G1 X145.493 Y146.666 E.01638
G1 X145.405 Y146.063 E.0187
G1 X145.77 Y145.959 F30000
G1 F15000
G1 X145.834 Y145.384 E.01777
G1 X146.034 Y144.841 E.01777
G1 X146.358 Y144.362 E.01777
G3 X146.658 Y144.09 I1.272 J1.096 E.01247
G1 X146.596 Y143.999 E.00337
G1 X146.61 Y143.93 E.00216
G1 X115.722 Y143.93 E.94908
G3 X115.68 Y144.09 I-.121 J.054 E.00549
G1 X115.979 Y144.362 E.01244
G1 X116.282 Y144.801 E.01638
G1 X116.492 Y145.34 E.01777
G1 X116.568 Y145.913 E.01777
G1 X116.503 Y146.488 E.01777
G1 X116.303 Y147.03 E.01777
G1 X115.979 Y147.509 E.01777
G1 X115.68 Y147.782 E.01244
G1 X115.74 Y147.87 E.00327
G1 X115.722 Y147.942 E.00226
G1 X146.607 Y147.942 E.94898
G3 X146.658 Y147.782 I.117 J-.051 E.00562
G1 X146.358 Y147.509 E.01244
G1 X146.056 Y147.071 E.01638
G1 X145.845 Y146.532 E.01777
G1 X145.778 Y146.018 E.01593
G1 X147.075 Y144.004 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134651
G1 F15000
G1 X147.215 Y143.907 E.00127
; LINE_WIDTH: 0.172382
G1 X147.355 Y143.811 E.00179
; LINE_WIDTH: 0.137457
G1 X147.536 Y143.785 E.00141
; LINE_WIDTH: 0.0969201
G1 X147.703 Y143.765 E.00074
G1 X148.635 Y143.765 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X148.802 Y143.785 E.00125
; LINE_WIDTH: 0.17135
G1 X148.969 Y143.806 E.00176
; LINE_WIDTH: 0.137974
G1 X149.123 Y143.907 E.00143
; LINE_WIDTH: 0.0969199
G1 X149.263 Y144.004 E.00075
G1 X149.843 Y144.043 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.646692
G1 F10434.403
G1 X150.024 Y144.027 E.00891
G1 X149.955 Y144.617 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134651
G1 F15000
G1 X150.068 Y144.744 E.00127
; LINE_WIDTH: 0.172381
G1 X150.18 Y144.871 E.00179
; LINE_WIDTH: 0.17825
G1 X150.363 Y145.105 E.00327
G1 X150.271 Y145.026 F30000
; LINE_WIDTH: 0.144824
G1 F15000
G1 X150.306 Y145.218 E.00162
; LINE_WIDTH: 0.09692
G1 X150.341 Y145.41 E.00086
G1 X150.271 Y145.026 F30000
; LINE_WIDTH: 0.192728
G1 F15000
G1 X150.236 Y144.834 E.00238
; WIPE_START
G1 F24000
G1 X150.271 Y145.026 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.036 J-1.216 P1  F30000
G1 X115.263 Y144.004 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.0969202
G1 F15000
G1 X115.123 Y143.907 E.00075
; LINE_WIDTH: 0.137971
G1 X114.968 Y143.806 E.00143
; LINE_WIDTH: 0.17135
G1 X114.802 Y143.785 E.00176
; LINE_WIDTH: 0.134135
G1 X114.635 Y143.765 E.00125
G1 X113.703 Y143.765 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X113.536 Y143.785 E.00074
; LINE_WIDTH: 0.137458
G1 X113.355 Y143.811 E.00141
; LINE_WIDTH: 0.172383
G1 X113.215 Y143.907 E.00179
; LINE_WIDTH: 0.134651
G1 X113.075 Y144.004 E.00127
G1 X112.265 Y144.023 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.606332
G1 F11181.87
G1 X112.431 Y144.038 E.00769
G1 X112.383 Y144.617 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969206
G1 F15000
G1 X112.27 Y144.744 E.00075
; LINE_WIDTH: 0.158639
G2 X111.975 Y145.105 I2.802 J2.596 E.0044
G1 X112.067 Y145.026 F30000
; LINE_WIDTH: 0.192728
G1 F15000
G1 X112.032 Y145.218 E.00238
; LINE_WIDTH: 0.144824
G1 X111.997 Y145.41 E.00162
G1 X112.067 Y145.026 F30000
; LINE_WIDTH: 0.240632
G1 F15000
G1 X112.102 Y144.834 E.00315
G1 X111.997 Y146.462 F30000
; LINE_WIDTH: 0.144825
G1 F15000
G1 X112.032 Y146.654 E.00162
; LINE_WIDTH: 0.19273
G1 X112.067 Y146.846 E.00238
; LINE_WIDTH: 0.240634
G1 X112.102 Y147.038 E.00315
G1 X112.27 Y147.128 F30000
; LINE_WIDTH: 0.15864
G1 F15000
G3 X111.975 Y146.767 I2.802 J-2.596 E.0044
G1 X112.27 Y147.128 F30000
; LINE_WIDTH: 0.096921
G1 F15000
G1 X112.383 Y147.255 E.00075
G1 X112.257 Y147.848 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608156
G1 F11145.788
G1 X112.431 Y147.833 E.00805
G1 X113.075 Y147.868 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134649
G1 F15000
G1 X113.215 Y147.964 E.00127
; LINE_WIDTH: 0.172379
G1 X113.355 Y148.061 E.00179
; LINE_WIDTH: 0.137457
G1 X113.536 Y148.086 E.00141
; LINE_WIDTH: 0.0969204
G1 X113.703 Y148.106 E.00074
G1 X114.635 Y148.106 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X114.802 Y148.086 E.00125
; LINE_WIDTH: 0.17135
G1 X114.969 Y148.066 E.00176
; LINE_WIDTH: 0.137969
M73 P61 R4
G1 X115.123 Y147.964 E.00143
; LINE_WIDTH: 0.0969194
G1 X115.263 Y147.868 E.00075
; WIPE_START
G1 F24000
G1 X115.123 Y147.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.65 J1.029 P1  F30000
G1 X145.113 Y129.035 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.091 Y129.002 E.00134
G1 X144.906 Y128.516 E.01725
G1 X144.844 Y128 E.01725
G1 X144.906 Y127.484 E.01725
G1 X145.091 Y126.998 E.01725
G1 X145.386 Y126.57 E.01725
G1 X145.775 Y126.225 E.01725
G1 X146.235 Y125.984 E.01725
G1 X146.74 Y125.859 E.01725
G1 X147.26 Y125.859 E.01725
G1 X147.765 Y125.984 E.01725
G1 X148.225 Y126.225 E.01725
G1 X148.614 Y126.57 E.01725
G1 X148.909 Y126.998 E.01725
G1 X149.094 Y127.484 E.01725
G1 X149.157 Y128 E.01725
G1 X149.094 Y128.516 E.01725
G1 X148.909 Y129.002 E.01725
G1 X148.614 Y129.43 E.01725
G1 X148.225 Y129.775 E.01725
G1 X147.765 Y130.016 E.01725
G1 X147.26 Y130.141 E.01725
G1 X146.74 Y130.141 E.01725
G1 X146.235 Y130.016 E.01725
G1 X145.775 Y129.775 E.01725
G1 X145.386 Y129.43 E.01725
G1 X145.147 Y129.085 E.01392
G1 X145.44 Y128.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.29 Y128.422 E.01305
G1 X145.238 Y128 E.01305
G1 X145.29 Y127.578 E.01305
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.474 Y128.868 E.01121
M204 S10000
; WIPE_START
G1 F24000
G1 X145.29 Y128.422 E-.18359
G1 X145.238 Y128 E-.16137
G1 X145.29 Y127.578 E-.16137
G1 X145.44 Y127.181 E-.16137
G1 X145.578 Y126.981 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.015 J-1.217 P1  F30000
G1 X114.637 Y126.603 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.909 Y126.998 E.01591
G1 X115.094 Y127.484 E.01725
G1 X115.157 Y128 E.01725
G1 X115.094 Y128.516 E.01725
G1 X114.909 Y129.002 E.01725
G1 X114.614 Y129.43 E.01725
G1 X114.225 Y129.775 E.01725
G1 X113.765 Y130.016 E.01725
G1 X113.26 Y130.141 E.01725
G1 X112.74 Y130.141 E.01725
G1 X112.235 Y130.016 E.01725
G1 X111.775 Y129.775 E.01725
G1 X111.386 Y129.43 E.01725
G1 X111.091 Y129.002 E.01725
G1 X110.906 Y128.516 E.01725
G1 X110.844 Y128 E.01725
G1 X110.906 Y127.484 E.01725
G1 X111.091 Y126.998 E.01725
G1 X111.386 Y126.57 E.01725
G1 X111.775 Y126.225 E.01725
G1 X112.235 Y125.984 E.01725
G1 X112.74 Y125.859 E.01725
G1 X113.26 Y125.859 E.01725
G1 X113.765 Y125.984 E.01725
G1 X114.225 Y126.225 E.01725
G1 X114.599 Y126.557 E.01659
G1 X114.313 Y126.827 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.319 Y126.832 E.00023
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.56 Y128.819 E.01305
G1 X114.319 Y129.168 E.01305
G1 X114.001 Y129.45 E.01305
G1 X113.625 Y129.647 E.01305
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.238 Y128 E.01305
G1 X111.29 Y127.578 E.01305
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.268 Y126.787 E.01097
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.02568
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.627 Y128.64 E-.08883
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.061 J1.215 P1  F30000
G1 X149.398 Y130.398 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.602 Y130.398 E1.28693
G1 X110.602 Y125.602 E.15909
G1 X149.398 Y125.602 E1.28693
G1 X149.398 Y130.338 E.1571
G1 X149.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.666 J1.018 P1  F30000
G1 X149.194 Y129.814 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329882
G1 F15000
G1 X147.978 Y130.194 E.0298
G1 X148.772 Y130.194 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X149.194 Y129.084 E.04968
G1 X149.194 Y126.916 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X148.772 Y125.806 E.04532
G1 X149.194 Y126.186 F30000
; LINE_WIDTH: 0.329883
G1 F15000
G1 X147.978 Y125.806 E.0298
G1 X146.022 Y125.806 F30000
; LINE_WIDTH: 0.130749
G1 F15000
G1 X145.821 Y125.945 E.00175
; WIPE_START
G1 F24000
G1 X146.022 Y125.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.217 J0 P1  F30000
G1 X146.022 Y130.194 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.130746
G1 F15000
G1 X145.821 Y130.055 E.00175
G1 X143.703 Y128.114 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X143.771 Y127.321 E.02444
G1 X143.959 Y126.748 E.01853
G1 X116.041 Y126.748 E.85786
G1 X116.229 Y127.321 E.01853
G1 X116.297 Y127.886 E.01749
G1 X116.229 Y128.679 E.02444
G1 X116.041 Y129.252 E.01853
G1 X143.959 Y129.252 E.85786
G1 X143.771 Y128.679 E.01853
G1 X143.71 Y128.173 E.01565
G1 X143.328 Y128.159 F30000
G1 F15000
G3 X143.434 Y127.125 I4.895 J-.022 E.03199
G1 X116.566 Y127.125 E.82558
G1 X116.672 Y127.841 E.02222
G3 X116.566 Y128.875 I-4.895 J.022 E.03199
G1 X143.434 Y128.875 E.82558
G1 X143.337 Y128.218 E.02038
G1 X117.392 Y127.846 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X117.392 Y128.154 E.00778
G1 X142.608 Y128.154 E.6349
G1 X142.608 Y127.846 E.00778
G1 X117.452 Y127.846 E.63339
G1 X117.058 Y128 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X117.01 Y128.498 E.01536
G1 X142.99 Y128.498 E.79826
G1 X142.942 Y128 E.01536
G1 X142.99 Y127.502 E.01536
G1 X117.01 Y127.502 E.79826
G1 X117.053 Y127.94 E.01351
G1 X115.923 Y127.932 F30000
G1 F15000
G1 X115.854 Y128.633 E.02166
G1 X115.62 Y129.298 E.02166
G1 X115.412 Y129.629 E.01201
G1 X144.588 Y129.629 E.89652
G1 X144.38 Y129.298 E.01201
G1 X144.178 Y128.766 E.01749
G1 X144.077 Y128.068 E.02166
G1 X144.146 Y127.367 E.02166
G1 X144.38 Y126.702 E.02166
G1 X144.588 Y126.371 E.01201
G1 X115.412 Y126.371 E.89652
G1 X115.62 Y126.702 E.01201
G1 X115.822 Y127.234 E.01749
G1 X115.914 Y127.872 E.01981
G1 X115.549 Y127.977 F30000
G1 F15000
G1 X115.48 Y128.588 E.01888
G1 X115.267 Y129.164 E.01888
G1 X114.923 Y129.673 E.01888
G1 X114.612 Y129.992 E.01369
G1 X115.667 Y130.006 E.03241
G1 X145.378 Y130.006 E.91296
G2 X145.383 Y129.951 I-.029 J-.03 E.00184
G1 X145.077 Y129.673 E.0127
G1 X144.754 Y129.205 E.01749
G1 X144.531 Y128.632 E.01888
G1 X144.451 Y128.023 E.01888
G1 X144.52 Y127.412 E.01888
G1 X144.733 Y126.836 E.01888
G1 X145.077 Y126.327 E.01888
G1 X145.388 Y126.008 E.01369
G1 X144.333 Y125.994 E.03241
G1 X114.622 Y125.994 E.91296
G1 X114.617 Y126.049 E.00169
G1 X114.923 Y126.327 E.01269
G1 X115.246 Y126.795 E.01749
G1 X115.469 Y127.368 E.01888
G1 X115.541 Y127.918 E.01704
G1 X114.179 Y125.945 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X113.978 Y125.806 E.00108
G1 X112.022 Y125.806 F30000
; LINE_WIDTH: 0.309038
G1 F15000
G1 X110.806 Y126.186 E.02764
G1 X111.228 Y125.806 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X110.806 Y126.916 E.04967
G1 X110.806 Y129.084 F30000
; LINE_WIDTH: 0.55611
G1 F12276.156
G1 X111.228 Y130.194 E.04968
G1 X110.806 Y129.814 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X112.022 Y130.194 E.02764
G1 X113.978 Y130.194 F30000
; LINE_WIDTH: 0.0969194
G1 F15000
G1 X114.179 Y130.055 E.00108
; WIPE_START
G1 F24000
G1 X113.978 Y130.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.584 J1.067 P1  F30000
G1 X145.386 Y112.998 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.364 Y112.965 E.00134
G1 X145.179 Y112.479 E.01725
G1 X145.117 Y111.963 E.01725
G1 X145.179 Y111.447 E.01725
G1 X145.364 Y110.96 E.01725
G1 X145.659 Y110.533 E.01725
G1 X146.048 Y110.188 E.01725
G1 X146.508 Y109.946 E.01725
G1 X147.013 Y109.822 E.01725
G1 X147.533 Y109.822 E.01725
G1 X148.038 Y109.946 E.01725
G1 X148.498 Y110.188 E.01725
G1 X148.887 Y110.533 E.01725
G1 X149.183 Y110.96 E.01725
G1 X149.367 Y111.447 E.01725
G1 X149.43 Y111.963 E.01725
G1 X149.367 Y112.479 E.01725
G1 X149.183 Y112.965 E.01725
G1 X148.887 Y113.393 E.01725
G1 X148.498 Y113.737 E.01725
G1 X148.038 Y113.979 E.01725
G1 X147.533 Y114.103 E.01725
G1 X147.013 Y114.103 E.01725
G1 X146.508 Y113.979 E.01725
G1 X146.048 Y113.737 E.01725
G1 X145.659 Y113.393 E.01725
G1 X145.421 Y113.047 E.01392
G1 X145.713 Y112.781 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.563 Y112.384 E.01305
G1 X145.512 Y111.963 E.01305
G1 X145.563 Y111.541 E.01305
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.747 Y112.831 E.01121
M204 S10000
; WIPE_START
G1 F24000
G1 X145.563 Y112.384 E-.18359
G1 X145.512 Y111.963 E-.16137
G1 X145.563 Y111.541 E-.16137
G1 X145.713 Y111.144 E-.16137
G1 X145.851 Y110.944 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.015 J-1.217 P1  F30000
G1 X114.91 Y110.566 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.183 Y110.96 E.01591
G1 X115.367 Y111.447 E.01725
G1 X115.43 Y111.963 E.01725
G1 X115.367 Y112.479 E.01725
G1 X115.183 Y112.965 E.01725
G1 X114.887 Y113.393 E.01725
G1 X114.498 Y113.737 E.01725
G1 X114.038 Y113.979 E.01725
G1 X113.533 Y114.103 E.01725
G1 X113.013 Y114.103 E.01725
G1 X112.508 Y113.979 E.01725
G1 X112.048 Y113.737 E.01725
G1 X111.659 Y113.393 E.01725
G1 X111.364 Y112.965 E.01725
G1 X111.179 Y112.479 E.01725
G1 X111.117 Y111.963 E.01725
G1 X111.179 Y111.447 E.01725
G1 X111.364 Y110.96 E.01725
G1 X111.659 Y110.533 E.01725
G1 X112.048 Y110.188 E.01725
G1 X112.508 Y109.946 E.01725
G1 X113.013 Y109.822 E.01725
G1 X113.533 Y109.822 E.01725
G1 X114.038 Y109.946 E.01725
G1 X114.498 Y110.188 E.01725
G1 X114.872 Y110.52 E.01659
G1 X114.586 Y110.789 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.592 Y110.795 E.00023
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.833 Y112.781 E.01305
G1 X114.592 Y113.131 E.01305
G1 X114.274 Y113.412 E.01305
G1 X113.898 Y113.61 E.01305
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.512 Y111.963 E.01305
G1 X111.563 Y111.541 E.01305
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.541 Y110.75 E.01097
M204 S10000
; WIPE_START
G1 F24000
G1 X114.592 Y110.795 E-.02568
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.901 Y112.603 E-.08883
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.061 J1.215 P1  F30000
G1 X149.671 Y114.361 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.875 Y114.361 E1.28693
G1 X110.875 Y109.565 E.15909
G1 X149.671 Y109.565 E1.28693
G1 X149.671 Y114.301 E.1571
G1 X150.063 Y114.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M73 P62 R4
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.666 J1.018 P1  F30000
G1 X149.467 Y113.776 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329882
G1 F15000
G1 X148.251 Y114.157 E.0298
G1 X149.045 Y114.157 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X149.467 Y113.047 E.04968
G1 X149.467 Y110.878 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X149.045 Y109.768 E.04532
G1 X149.467 Y110.149 F30000
; LINE_WIDTH: 0.329883
G1 F15000
G1 X148.251 Y109.768 E.0298
G1 X146.295 Y109.768 F30000
; LINE_WIDTH: 0.130749
G1 F15000
G1 X146.094 Y109.907 E.00175
; WIPE_START
G1 F24000
G1 X146.295 Y109.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.217 J0 P1  F30000
G1 X146.295 Y114.157 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.130746
G1 F15000
G1 X146.094 Y114.018 E.00175
G1 X143.976 Y112.076 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X144.044 Y111.284 E.02444
G1 X144.232 Y110.711 E.01853
G1 X116.314 Y110.711 E.85786
G1 X116.502 Y111.284 E.01853
G1 X116.57 Y111.849 E.01749
G1 X116.502 Y112.641 E.02444
G1 X116.314 Y113.214 E.01853
G1 X144.232 Y113.214 E.85786
G1 X144.044 Y112.641 E.01853
G1 X143.983 Y112.136 E.01565
G1 X143.601 Y112.122 F30000
G1 F15000
G3 X143.707 Y111.088 I4.895 J-.022 E.03199
G1 X116.839 Y111.088 E.82558
G1 X116.945 Y111.804 E.02222
G3 X116.839 Y112.837 I-4.895 J.022 E.03199
G1 X143.707 Y112.837 E.82558
G1 X143.61 Y112.181 E.02038
G1 X117.665 Y111.808 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X117.665 Y112.117 E.00778
G1 X142.881 Y112.117 E.6349
G1 X142.881 Y111.808 E.00778
G1 X117.725 Y111.808 E.63339
G1 X117.331 Y111.963 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X117.283 Y112.46 E.01536
G1 X143.263 Y112.46 E.79826
G1 X143.215 Y111.963 E.01536
G1 X143.263 Y111.465 E.01536
G1 X117.283 Y111.465 E.79826
G1 X117.326 Y111.903 E.01351
G1 X116.196 Y111.894 F30000
G1 F15000
G1 X116.127 Y112.596 E.02166
G1 X115.893 Y113.261 E.02166
G1 X115.685 Y113.591 E.01201
G1 X144.861 Y113.591 E.89652
G1 X144.653 Y113.261 E.01201
G1 X144.451 Y112.728 E.01749
G1 X144.35 Y112.031 E.02166
G1 X144.419 Y111.329 E.02166
G1 X144.653 Y110.665 E.02166
G1 X144.861 Y110.334 E.01201
G1 X115.685 Y110.334 E.89652
G1 X115.893 Y110.665 E.01201
G1 X116.095 Y111.197 E.01749
G1 X116.187 Y111.835 E.01981
G1 X115.822 Y111.94 F30000
G1 F15000
G1 X115.753 Y112.551 E.01888
G1 X115.54 Y113.127 E.01888
G1 X115.196 Y113.636 E.01888
G1 X114.885 Y113.955 E.01369
G1 X115.94 Y113.968 E.03241
G1 X145.652 Y113.968 E.91296
G2 X145.656 Y113.914 I-.029 J-.03 E.00184
G1 X145.35 Y113.636 E.0127
G1 X145.027 Y113.167 E.01749
G1 X144.804 Y112.595 E.01888
G1 X144.724 Y111.985 E.01888
G1 X144.793 Y111.375 E.01888
G1 X145.006 Y110.798 E.01888
G1 X145.35 Y110.29 E.01888
G1 X145.661 Y109.97 E.01369
G1 X144.606 Y109.957 E.03241
G1 X114.895 Y109.957 E.91296
G1 X114.89 Y110.012 E.00169
G1 X115.196 Y110.29 E.01269
G1 X115.519 Y110.758 E.01749
G1 X115.742 Y111.331 E.01888
G1 X115.814 Y111.88 E.01704
G1 X114.452 Y109.907 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X114.251 Y109.768 E.00108
G1 X112.295 Y109.768 F30000
; LINE_WIDTH: 0.309038
G1 F15000
G1 X111.079 Y110.149 E.02764
G1 X111.501 Y109.768 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X111.079 Y110.878 E.04967
G1 X111.079 Y113.047 F30000
; LINE_WIDTH: 0.55611
G1 F12276.156
G1 X111.501 Y114.157 E.04968
G1 X111.079 Y113.776 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X112.295 Y114.157 E.02764
G1 X114.251 Y114.157 F30000
; LINE_WIDTH: 0.0969194
G1 F15000
G1 X114.452 Y114.018 E.00108
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.251 Y114.157 E-.76
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
G3 Z.8 I-1.017 J.669 P1  F30000
G1 X145.952 Y162.346 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.7 Y161.981 E.01472
G1 X145.528 Y161.529 E.01605
G1 X145.47 Y161.048 E.01605
G1 X145.528 Y160.568 E.01605
G1 X145.7 Y160.116 E.01605
G1 X145.975 Y159.718 E.01605
G1 X146.337 Y159.397 E.01605
G1 X146.485 Y159.32 E.00554
G1 X146.765 Y159.172 E.01051
G1 X147.235 Y159.057 E.01605
G1 X147.718 Y159.057 E.01605
G1 X148.188 Y159.172 E.01605
G1 X148.616 Y159.397 E.01605
G1 X148.979 Y159.718 E.01605
G1 X149.253 Y160.116 E.01605
G1 X149.425 Y160.568 E.01605
G1 X149.483 Y161.048 E.01605
G1 X149.425 Y161.529 E.01605
G1 X149.253 Y161.981 E.01605
G1 X148.979 Y162.379 E.01605
G1 X148.616 Y162.7 E.01605
G1 X148.469 Y162.777 E.00554
G1 X148.188 Y162.925 E.01051
G1 X147.718 Y163.04 E.01605
G1 X147.235 Y163.04 E.01605
G1 X146.765 Y162.925 E.01605
G1 X146.337 Y162.7 E.01605
G1 X145.99 Y162.392 E.01538
G1 X146.276 Y162.112 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X146.561 Y159.722 I1.199 J-1.069 E.08361
G1 X146.905 Y159.542 E.01194
G1 X147.282 Y159.449 E.01194
G3 X146.316 Y162.156 I.192 J1.595 E.20073
M204 S10000
; WIPE_START
G1 F24000
G1 X146.05 Y161.797 E-.16992
G1 X145.912 Y161.434 E-.14763
G1 X145.865 Y161.048 E-.14763
G1 X145.912 Y160.663 E-.14763
G1 X146.049 Y160.301 E-.14718
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.068 J-1.215 P1  F30000
G1 X115.231 Y162.014 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.979 Y162.379 E.01472
G1 X114.616 Y162.7 E.01605
G1 X114.188 Y162.925 E.01605
G1 X113.718 Y163.04 E.01605
G1 X113.235 Y163.04 E.01605
G1 X112.765 Y162.925 E.01605
G1 X112.337 Y162.7 E.01605
G1 X111.975 Y162.379 E.01605
G1 X111.7 Y161.981 E.01605
G1 X111.528 Y161.529 E.01605
G1 X111.47 Y161.048 E.01605
G1 X111.528 Y160.568 E.01605
G1 X111.7 Y160.116 E.01605
G1 X111.975 Y159.718 E.01605
G1 X112.337 Y159.397 E.01605
G1 X112.485 Y159.32 E.00554
G1 X112.765 Y159.172 E.01051
G1 X113.235 Y159.057 E.01605
G1 X113.718 Y159.057 E.01605
G1 X114.188 Y159.172 E.01605
G1 X114.616 Y159.397 E.01605
G1 X114.979 Y159.718 E.01605
G1 X115.253 Y160.116 E.01605
G1 X115.425 Y160.568 E.01605
G1 X115.483 Y161.048 E.01605
G1 X115.425 Y161.529 E.01605
G1 X115.26 Y161.962 E.01538
G1 X114.904 Y161.797 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X112.561 Y159.722 I-1.427 J-.749 E.1795
G1 X112.905 Y159.542 E.01194
G1 X113.282 Y159.449 E.01194
G3 X114.93 Y161.744 I.194 J1.6 E.10586
M204 S10000
; WIPE_START
G1 F24000
G1 X114.683 Y162.117 E-.17016
G1 X114.392 Y162.375 E-.14763
G1 X114.048 Y162.555 E-.14763
G1 X113.671 Y162.648 E-.14763
G1 X113.284 Y162.648 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.027 J1.217 P1  F30000
G1 X149.875 Y163.446 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.079 Y163.446 E1.28693
G1 X111.079 Y158.651 E.15909
G1 X149.875 Y158.651 E1.28693
G1 X149.875 Y163.386 E.1571
G1 X150.267 Y163.838 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.687 Y163.838 E1.21618
G1 X110.687 Y158.258 E.17146
G1 X150.267 Y158.258 E1.21618
G1 X150.267 Y163.778 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.267 Y163.782 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.837 J.883 P1  F30000
G1 X149.153 Y162.942 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6456
G1 F10453.308
G1 X149.332 Y162.958 E.00881
G1 X149.263 Y162.368 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134653
G1 F15000
G1 X149.375 Y162.24 E.00127
; LINE_WIDTH: 0.172384
G1 X149.488 Y162.113 E.00179
; LINE_WIDTH: 0.178253
G1 X149.671 Y161.879 E.00327
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.192731
G1 F15000
G1 X149.614 Y161.766 E.00238
; LINE_WIDTH: 0.144826
G1 X149.649 Y161.574 E.00162
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.240636
G1 F15000
G1 X149.543 Y162.151 E.00315
G1 X148.571 Y162.98 F30000
; LINE_WIDTH: 0.0969194
G1 F15000
G1 X148.431 Y163.077 E.00075
; LINE_WIDTH: 0.137971
G1 X148.276 Y163.179 E.00143
; LINE_WIDTH: 0.17135
G1 X148.11 Y163.199 E.00176
; LINE_WIDTH: 0.134135
G1 X147.943 Y163.219 E.00125
G1 X147.01 Y163.219 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X146.844 Y163.199 E.00074
; LINE_WIDTH: 0.137458
G1 X146.662 Y163.174 E.00141
; LINE_WIDTH: 0.17238
G1 X146.522 Y163.077 E.00179
; LINE_WIDTH: 0.13465
G1 X146.383 Y162.98 E.00127
G1 X143.235 Y161.203 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351909
G1 F15000
G1 X143.235 Y160.894 E.00778
G1 X117.719 Y160.894 E.64246
G1 X117.719 Y161.203 E.00778
G1 X143.175 Y161.203 E.64094
G1 X143.568 Y161.048 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X143.616 Y160.551 E.01536
G1 X117.337 Y160.551 E.80748
G1 X117.385 Y161.048 E.01536
G1 X117.337 Y161.546 E.01536
G1 X143.616 Y161.546 E.80748
G1 X143.574 Y161.108 E.01351
G1 X143.955 Y161.208 F30000
G1 F15000
G3 X144.065 Y160.174 I4.479 J-.045 E.03201
G1 X116.888 Y160.174 E.83507
G1 X116.998 Y160.889 E.02225
G3 X116.888 Y161.923 I-4.479 J.045 E.03201
G1 X144.065 Y161.923 E.83507
G1 X143.964 Y161.267 E.0204
G1 X144.329 Y161.162 F30000
G1 F15000
G1 X144.394 Y160.406 E.02333
G1 X144.595 Y159.797 E.01971
G1 X116.358 Y159.797 E.86764
G1 X116.56 Y160.406 E.01971
G1 X116.624 Y160.935 E.01638
M73 P63 R4
G1 X116.56 Y161.691 E.02333
G1 X116.358 Y162.3 E.01971
G1 X144.595 Y162.3 E.86764
G1 X144.394 Y161.691 E.01971
G1 X144.337 Y161.222 E.01454
G1 X144.704 Y161.117 F30000
G1 F15000
G1 X144.768 Y160.451 E.02055
G1 X144.99 Y159.82 E.02055
G1 X145.246 Y159.42 E.01461
G1 X115.707 Y159.42 E.90764
G1 X115.964 Y159.82 E.01461
G1 X116.153 Y160.319 E.01638
G1 X116.25 Y160.98 E.02055
G1 X116.185 Y161.646 E.02055
G1 X115.964 Y162.277 E.02055
G1 X115.707 Y162.677 E.01461
G1 X145.246 Y162.677 E.90764
G1 X144.99 Y162.277 E.01461
G1 X144.801 Y161.778 E.01638
G1 X144.712 Y161.176 E.0187
G1 X145.078 Y161.071 F30000
G1 F15000
G1 X145.142 Y160.497 E.01777
G1 X145.342 Y159.954 E.01777
G1 X145.666 Y159.475 E.01777
G1 X145.965 Y159.202 E.01244
G1 X145.9 Y159.108 E.00352
G1 X145.914 Y159.043 E.00205
G1 X115.03 Y159.043 E.94898
G3 X114.988 Y159.202 I-.121 J.054 E.00549
G1 X115.287 Y159.475 E.01244
G1 X115.59 Y159.914 E.01638
G1 X115.8 Y160.452 E.01777
G1 X115.875 Y161.026 E.01777
G1 X115.811 Y161.6 E.01777
G1 X115.611 Y162.143 E.01777
G1 X115.287 Y162.622 E.01777
G1 X114.988 Y162.895 E.01244
G1 X115.047 Y162.983 E.00327
G1 X115.03 Y163.054 E.00226
G1 X145.917 Y163.054 E.94908
G3 X145.965 Y162.895 I.126 J-.049 E.00553
G1 X145.666 Y162.622 E.01244
G1 X145.363 Y162.183 E.01638
G1 X145.153 Y161.645 E.01777
G1 X145.086 Y161.131 E.01593
G1 X146.383 Y159.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134651
G1 F15000
G1 X146.522 Y159.02 E.00127
; LINE_WIDTH: 0.172382
G1 X146.662 Y158.923 E.00179
; LINE_WIDTH: 0.137457
G1 X146.844 Y158.898 E.00141
; LINE_WIDTH: 0.0969201
G1 X147.01 Y158.878 E.00074
G1 X147.943 Y158.878 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X148.11 Y158.898 E.00125
; LINE_WIDTH: 0.17135
G1 X148.276 Y158.918 E.00176
; LINE_WIDTH: 0.137972
G1 X148.431 Y159.02 E.00143
; LINE_WIDTH: 0.09692
G1 X148.571 Y159.117 E.00075
G1 X149.151 Y159.156 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.646692
G1 F10434.403
G1 X149.332 Y159.139 E.00891
G1 X149.263 Y159.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X149.375 Y159.857 E.00127
; LINE_WIDTH: 0.172379
G1 X149.488 Y159.984 E.00179
; LINE_WIDTH: 0.178248
G1 X149.671 Y160.218 E.00327
G1 X149.578 Y160.138 F30000
; LINE_WIDTH: 0.144825
G1 F15000
G1 X149.614 Y160.331 E.00162
; LINE_WIDTH: 0.0969199
G1 X149.649 Y160.523 E.00086
G1 X149.578 Y160.138 F30000
; LINE_WIDTH: 0.19273
G1 F15000
G1 X149.543 Y159.946 E.00238
; WIPE_START
G1 F24000
G1 X149.578 Y160.138 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.036 J-1.216 P1  F30000
G1 X114.571 Y159.117 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.0969199
G1 F15000
G1 X114.431 Y159.02 E.00075
; LINE_WIDTH: 0.137969
G1 X114.276 Y158.918 E.00143
; LINE_WIDTH: 0.171348
G1 X114.11 Y158.898 E.00176
; LINE_WIDTH: 0.134134
G1 X113.943 Y158.878 E.00125
G1 X113.01 Y158.878 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X112.844 Y158.898 E.00074
; LINE_WIDTH: 0.137457
G1 X112.662 Y158.923 E.00141
; LINE_WIDTH: 0.172379
G1 X112.522 Y159.02 E.00179
; LINE_WIDTH: 0.134649
G1 X112.383 Y159.117 E.00127
G1 X111.572 Y159.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.606326
G1 F11181.99
G1 X111.739 Y159.15 E.00769
G1 X111.691 Y159.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969206
G1 F15000
G1 X111.578 Y159.857 E.00075
; LINE_WIDTH: 0.158641
G2 X111.282 Y160.218 I2.803 J2.597 E.0044
G1 X111.375 Y160.138 F30000
; LINE_WIDTH: 0.240636
G1 F15000
G1 X111.41 Y159.946 E.00315
G1 X111.375 Y160.138 F30000
; LINE_WIDTH: 0.192731
G1 F15000
G1 X111.34 Y160.331 E.00238
; LINE_WIDTH: 0.144826
G1 X111.304 Y160.523 E.00162
G1 X111.304 Y161.574 F30000
; LINE_WIDTH: 0.144825
G1 F15000
G1 X111.34 Y161.766 E.00162
; LINE_WIDTH: 0.19273
G1 X111.375 Y161.959 E.00238
; LINE_WIDTH: 0.240634
G1 X111.41 Y162.151 E.00315
G1 X111.578 Y162.24 F30000
; LINE_WIDTH: 0.158639
G1 F15000
G3 X111.282 Y161.879 I2.802 J-2.596 E.0044
G1 X111.578 Y162.24 F30000
; LINE_WIDTH: 0.096921
G1 F15000
G1 X111.691 Y162.368 E.00075
G1 X111.565 Y162.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608156
G1 F11145.788
G1 X111.739 Y162.946 E.00805
G1 X112.383 Y162.98 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X112.522 Y163.077 E.00127
; LINE_WIDTH: 0.172379
G1 X112.662 Y163.174 E.00179
; LINE_WIDTH: 0.137458
G1 X112.844 Y163.199 E.00141
; LINE_WIDTH: 0.0969204
G1 X113.01 Y163.219 E.00074
G1 X113.943 Y163.219 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X114.11 Y163.199 E.00125
; LINE_WIDTH: 0.17135
G1 X114.276 Y163.179 E.00176
; LINE_WIDTH: 0.137969
G1 X114.431 Y163.077 E.00143
; LINE_WIDTH: 0.0969194
G1 X114.571 Y162.98 E.00075
; WIPE_START
G1 F24000
G1 X114.431 Y163.077 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.537 J1.092 P1  F30000
G1 X146.644 Y147.233 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.392 Y146.868 E.01472
G1 X146.221 Y146.416 E.01605
G1 X146.162 Y145.936 E.01605
G1 X146.221 Y145.456 E.01605
G1 X146.392 Y145.003 E.01605
G1 X146.667 Y144.605 E.01605
G1 X147.029 Y144.284 E.01605
G1 X147.177 Y144.207 E.00554
G1 X147.457 Y144.06 E.01051
G1 X147.927 Y143.944 E.01605
G1 X148.411 Y143.944 E.01605
G1 X148.88 Y144.06 E.01605
G1 X149.309 Y144.284 E.01605
G1 X149.671 Y144.605 E.01605
G1 X149.946 Y145.003 E.01605
G1 X150.117 Y145.456 E.01605
G1 X150.175 Y145.936 E.01605
G1 X150.117 Y146.416 E.01605
G1 X149.946 Y146.868 E.01605
G1 X149.671 Y147.266 E.01605
G1 X149.309 Y147.587 E.01605
G1 X149.161 Y147.665 E.00554
G1 X148.88 Y147.812 E.01051
G1 X148.411 Y147.928 E.01605
G1 X147.927 Y147.928 E.01605
G1 X147.457 Y147.812 E.01605
G1 X147.029 Y147.587 E.01605
G1 X146.682 Y147.28 E.01538
G1 X146.968 Y147 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X147.253 Y144.61 I1.199 J-1.069 E.08361
G1 X147.597 Y144.429 E.01194
G1 X147.975 Y144.336 E.01194
G3 X147.009 Y147.044 I.192 J1.595 E.20073
M204 S10000
; WIPE_START
G1 F24000
G1 X146.742 Y146.685 E-.16992
G1 X146.604 Y146.321 E-.14763
G1 X146.557 Y145.936 E-.14763
G1 X146.604 Y145.55 E-.14763
G1 X146.742 Y145.188 E-.14718
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.068 J-1.215 P1  F30000
G1 X115.923 Y146.901 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.671 Y147.266 E.01472
G1 X115.309 Y147.587 E.01605
G1 X114.88 Y147.812 E.01605
G1 X114.411 Y147.928 E.01605
G1 X113.927 Y147.928 E.01605
G1 X113.457 Y147.812 E.01605
G1 X113.029 Y147.587 E.01605
G1 X112.667 Y147.266 E.01605
G1 X112.392 Y146.868 E.01605
G1 X112.221 Y146.416 E.01605
G1 X112.162 Y145.936 E.01605
G1 X112.221 Y145.456 E.01605
G1 X112.392 Y145.003 E.01605
G1 X112.667 Y144.605 E.01605
G1 X113.029 Y144.284 E.01605
G1 X113.177 Y144.207 E.00554
G1 X113.457 Y144.06 E.01051
G1 X113.927 Y143.944 E.01605
G1 X114.411 Y143.944 E.01605
G1 X114.88 Y144.06 E.01605
G1 X115.309 Y144.284 E.01605
G1 X115.671 Y144.605 E.01605
G1 X115.946 Y145.003 E.01605
G1 X116.117 Y145.456 E.01605
G1 X116.175 Y145.936 E.01605
G1 X116.117 Y146.416 E.01605
G1 X115.953 Y146.85 E.01538
G1 X115.596 Y146.685 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X113.253 Y144.61 I-1.427 J-.749 E.1795
G1 X113.597 Y144.429 E.01194
G1 X113.975 Y144.336 E.01194
G3 X115.623 Y146.631 I.194 J1.6 E.10586
M204 S10000
; WIPE_START
G1 F24000
G1 X115.375 Y147.004 E-.17016
G1 X115.084 Y147.262 E-.14763
G1 X114.74 Y147.443 E-.14763
G1 X114.363 Y147.536 E-.14763
G1 X113.976 Y147.536 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.027 J1.217 P1  F30000
G1 X150.567 Y148.334 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.771 Y148.334 E1.28693
G1 X111.771 Y143.538 E.15909
G1 X150.567 Y143.538 E1.28693
G1 X150.567 Y148.274 E.1571
G1 X150.959 Y148.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.379 Y148.726 E1.21618
G1 X111.379 Y143.146 E.17146
G1 X150.959 Y143.146 E1.21618
G1 X150.959 Y148.666 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.959 Y148.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.837 J.883 P1  F30000
G1 X149.845 Y147.829 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6456
G1 F10453.308
G1 X150.024 Y147.845 E.00881
G1 X149.955 Y147.255 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134653
G1 F15000
G1 X150.068 Y147.128 E.00127
; LINE_WIDTH: 0.172384
G1 X150.18 Y147 E.00179
; LINE_WIDTH: 0.178253
G1 X150.363 Y146.767 E.00327
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.240636
G1 F15000
G1 X150.236 Y147.038 E.00315
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.192731
G1 F15000
G1 X150.306 Y146.654 E.00238
; LINE_WIDTH: 0.144826
G1 X150.341 Y146.462 E.00162
G1 X150.341 Y145.41 F30000
; LINE_WIDTH: 0.0969199
G1 F15000
G1 X150.306 Y145.218 E.00086
; LINE_WIDTH: 0.144825
G1 X150.271 Y145.026 E.00162
; LINE_WIDTH: 0.19273
G1 X150.236 Y144.834 E.00238
G1 X150.18 Y144.871 F30000
; LINE_WIDTH: 0.178248
G1 F15000
G1 X150.363 Y145.105 E.00327
G1 X150.18 Y144.871 F30000
; LINE_WIDTH: 0.172379
G1 F15000
G1 X150.068 Y144.744 E.00179
; LINE_WIDTH: 0.13465
G1 X149.955 Y144.617 E.00127
G1 X149.843 Y144.043 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.646692
G1 F10434.403
G1 X150.024 Y144.027 E.00891
G1 X149.263 Y144.004 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.09692
G1 F15000
G1 X149.123 Y143.907 E.00075
; LINE_WIDTH: 0.137972
G1 X148.969 Y143.806 E.00143
; LINE_WIDTH: 0.17135
G1 X148.802 Y143.785 E.00176
; LINE_WIDTH: 0.134135
G1 X148.635 Y143.765 E.00125
G1 X147.703 Y143.765 F30000
; LINE_WIDTH: 0.0969201
G1 F15000
G1 X147.536 Y143.785 E.00074
; LINE_WIDTH: 0.137457
G1 X147.355 Y143.811 E.00141
; LINE_WIDTH: 0.172382
G1 X147.215 Y143.907 E.00179
; LINE_WIDTH: 0.134651
G1 X147.075 Y144.004 E.00127
G1 X143.927 Y146.09 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351909
G1 F15000
G1 X143.927 Y145.781 E.00778
G1 X118.411 Y145.781 E.64246
G1 X118.411 Y146.09 E.00778
G1 X143.867 Y146.09 E.64094
G1 X144.261 Y145.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X144.308 Y145.438 E.01536
G1 X118.029 Y145.438 E.80748
G1 X118.077 Y145.936 E.01536
G1 X118.029 Y146.433 E.01536
G1 X144.308 Y146.433 E.80748
G1 X144.266 Y145.996 E.01351
G1 X144.647 Y146.095 F30000
G1 F15000
G3 X144.757 Y145.061 I4.479 J-.045 E.03201
G1 X117.58 Y145.061 E.83507
G1 X117.691 Y145.777 E.02225
G3 X117.58 Y146.81 I-4.479 J.045 E.03201
G1 X144.757 Y146.81 E.83507
G1 X144.656 Y146.154 E.0204
G1 X145.022 Y146.049 F30000
G1 F15000
G1 X145.086 Y145.293 E.02333
G1 X145.287 Y144.684 E.01971
G1 X117.05 Y144.684 E.86764
G1 X117.252 Y145.293 E.01971
G1 X117.316 Y145.822 E.01638
G1 X117.252 Y146.579 E.02333
G1 X117.05 Y147.187 E.01971
G1 X145.287 Y147.187 E.86764
G1 X145.086 Y146.579 E.01971
G1 X145.029 Y146.109 E.01454
G1 X145.396 Y146.004 F30000
G1 F15000
G1 X145.46 Y145.338 E.02055
G1 X145.682 Y144.707 E.02055
G1 X145.938 Y144.307 E.01461
G1 X116.4 Y144.307 E.90764
G1 X116.656 Y144.707 E.01461
G1 X116.845 Y145.206 E.01638
G1 X116.942 Y145.868 E.02055
G1 X116.878 Y146.533 E.02055
G1 X116.656 Y147.164 E.02055
G1 X116.4 Y147.565 E.01461
G1 X145.938 Y147.565 E.90764
G1 X145.682 Y147.164 E.01461
G1 X145.493 Y146.666 E.01638
G1 X145.405 Y146.063 E.0187
G1 X145.77 Y145.959 F30000
G1 F15000
G1 X145.834 Y145.384 E.01777
G1 X146.034 Y144.841 E.01777
G1 X146.358 Y144.362 E.01777
G1 X146.658 Y144.09 E.01244
G1 X146.593 Y143.995 E.00352
G1 X146.607 Y143.93 E.00205
G1 X115.722 Y143.93 E.94898
G3 X115.68 Y144.09 I-.121 J.054 E.00549
G1 X115.979 Y144.362 E.01244
G1 X116.282 Y144.801 E.01638
G1 X116.492 Y145.34 E.01777
G1 X116.568 Y145.913 E.01777
G1 X116.503 Y146.488 E.01777
G1 X116.303 Y147.03 E.01777
G1 X115.979 Y147.509 E.01777
G1 X115.68 Y147.782 E.01244
G1 X115.74 Y147.87 E.00327
G1 X115.722 Y147.942 E.00226
G1 X146.61 Y147.942 E.94908
G3 X146.658 Y147.782 I.126 J-.049 E.00553
G1 X146.358 Y147.509 E.01244
G1 X146.056 Y147.071 E.01638
G1 X145.845 Y146.532 E.01777
G1 X145.778 Y146.018 E.01593
G1 X147.075 Y147.868 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X147.215 Y147.964 E.00127
; LINE_WIDTH: 0.17238
G1 X147.355 Y148.061 E.00179
; LINE_WIDTH: 0.137458
G1 X147.536 Y148.086 E.00141
; LINE_WIDTH: 0.0969204
G1 X147.703 Y148.106 E.00074
G1 X148.635 Y148.106 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X148.802 Y148.086 E.00125
; LINE_WIDTH: 0.17135
G1 X148.968 Y148.066 E.00176
; LINE_WIDTH: 0.137971
G1 X149.123 Y147.964 E.00143
; LINE_WIDTH: 0.0969194
G1 X149.263 Y147.868 E.00075
G1 X115.263 Y147.868 F30000
; LINE_WIDTH: 0.0969194
G1 F15000
G1 X115.123 Y147.964 E.00075
; LINE_WIDTH: 0.137969
G1 X114.969 Y148.066 E.00143
; LINE_WIDTH: 0.17135
M73 P64 R4
G1 X114.802 Y148.086 E.00176
; LINE_WIDTH: 0.134135
G1 X114.635 Y148.106 E.00125
G1 X113.703 Y148.106 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X113.536 Y148.086 E.00074
; LINE_WIDTH: 0.137458
G1 X113.355 Y148.061 E.00141
; LINE_WIDTH: 0.172379
G1 X113.215 Y147.964 E.00179
; LINE_WIDTH: 0.13465
G1 X113.075 Y147.868 E.00127
G1 X112.257 Y147.848 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608156
G1 F11145.788
G1 X112.431 Y147.833 E.00805
G1 X112.383 Y147.255 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.096921
G1 F15000
G1 X112.27 Y147.128 E.00075
; LINE_WIDTH: 0.158639
G3 X111.975 Y146.767 I2.802 J-2.596 E.0044
G1 X112.067 Y146.846 F30000
; LINE_WIDTH: 0.240634
G1 F15000
G1 X112.102 Y147.038 E.00315
G1 X112.067 Y146.846 F30000
; LINE_WIDTH: 0.19273
G1 F15000
G1 X112.032 Y146.654 E.00238
; LINE_WIDTH: 0.144825
G1 X111.997 Y146.462 E.00162
G1 X111.997 Y145.41 F30000
; LINE_WIDTH: 0.144826
G1 F15000
G1 X112.032 Y145.218 E.00162
; LINE_WIDTH: 0.192731
G1 X112.067 Y145.026 E.00238
; LINE_WIDTH: 0.240636
G1 X112.102 Y144.834 E.00315
G1 X112.27 Y144.744 F30000
; LINE_WIDTH: 0.0969206
G1 F15000
G1 X112.383 Y144.617 E.00075
G1 X112.27 Y144.744 F30000
; LINE_WIDTH: 0.158641
G1 F15000
G2 X111.975 Y145.105 I2.803 J2.597 E.0044
G1 X112.265 Y144.023 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.606326
G1 F11181.99
G1 X112.431 Y144.038 E.00769
G1 X113.075 Y144.004 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134649
G1 F15000
G1 X113.215 Y143.907 E.00127
; LINE_WIDTH: 0.172379
G1 X113.355 Y143.811 E.00179
; LINE_WIDTH: 0.137457
G1 X113.536 Y143.785 E.00141
; LINE_WIDTH: 0.0969203
G1 X113.703 Y143.765 E.00074
G1 X114.635 Y143.765 F30000
; LINE_WIDTH: 0.134134
G1 F15000
G1 X114.802 Y143.785 E.00125
; LINE_WIDTH: 0.171348
G1 X114.968 Y143.806 E.00176
; LINE_WIDTH: 0.137969
G1 X115.123 Y143.907 E.00143
; LINE_WIDTH: 0.0969199
G1 X115.263 Y144.004 E.00075
; WIPE_START
G1 F24000
G1 X115.123 Y143.907 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.541 J1.09 P1  F30000
G1 X145.113 Y129.035 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.091 Y129.002 E.00133
G1 X144.906 Y128.516 E.01725
G1 X144.844 Y128 E.01725
G1 X144.906 Y127.484 E.01725
G1 X145.091 Y126.998 E.01725
G1 X145.386 Y126.57 E.01725
G1 X145.775 Y126.225 E.01725
G1 X146.235 Y125.984 E.01725
G1 X146.74 Y125.859 E.01725
G1 X147.26 Y125.859 E.01725
G1 X147.765 Y125.984 E.01725
G1 X148.225 Y126.225 E.01725
G1 X148.614 Y126.57 E.01725
G1 X148.909 Y126.998 E.01725
G1 X149.094 Y127.484 E.01725
G1 X149.157 Y128 E.01725
G1 X149.094 Y128.516 E.01725
G1 X148.909 Y129.002 E.01725
G1 X148.614 Y129.43 E.01725
G1 X148.225 Y129.775 E.01725
G1 X147.765 Y130.016 E.01724
G1 X147.26 Y130.141 E.01725
G1 X146.74 Y130.141 E.01725
G1 X146.235 Y130.016 E.01725
G1 X145.775 Y129.775 E.01725
G1 X145.386 Y129.43 E.01725
G1 X145.147 Y129.085 E.01392
G1 X145.44 Y128.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.29 Y128.422 E.01305
G1 X145.279 Y128.334 E.0027
G1 X145.238 Y128 E.01035
G1 X145.29 Y127.578 E.01305
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.474 Y128.868 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.29 Y128.422 E-.18359
G1 X145.279 Y128.334 E-.03335
G1 X145.238 Y128 E-.12802
G1 X145.29 Y127.578 E-.16137
G1 X145.44 Y127.181 E-.16137
G1 X145.578 Y126.981 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.015 J-1.217 P1  F30000
G1 X114.637 Y126.603 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.909 Y126.998 E.01591
G1 X115.094 Y127.484 E.01725
G1 X115.157 Y128 E.01725
G1 X115.094 Y128.516 E.01725
G1 X114.909 Y129.002 E.01725
G1 X114.614 Y129.43 E.01725
G1 X114.225 Y129.775 E.01725
G1 X113.765 Y130.016 E.01725
G1 X113.26 Y130.141 E.01725
G1 X112.74 Y130.141 E.01725
G1 X112.235 Y130.016 E.01725
G1 X111.775 Y129.775 E.01725
G1 X111.386 Y129.43 E.01725
G1 X111.091 Y129.002 E.01725
G1 X110.906 Y128.516 E.01725
G1 X110.89 Y128.382 E.00449
G1 X110.844 Y128 E.01275
G1 X110.906 Y127.484 E.01725
G1 X111.091 Y126.998 E.01725
G1 X111.386 Y126.57 E.01725
G1 X111.775 Y126.225 E.01725
G1 X112.235 Y125.984 E.01725
G1 X112.74 Y125.859 E.01725
G1 X113.26 Y125.859 E.01725
G1 X113.765 Y125.984 E.01725
G1 X114.225 Y126.225 E.01725
G1 X114.326 Y126.315 E.00449
G1 X114.599 Y126.557 E.0121
G1 X114.31 Y126.824 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.319 Y126.832 E.00035
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.56 Y128.819 E.01305
G1 X114.319 Y129.168 E.01305
G1 X114.001 Y129.45 E.01305
G1 X113.625 Y129.647 E.01305
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.279 Y128.334 E.0027
G1 X111.238 Y128 E.01035
G1 X111.29 Y127.578 E.01305
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.265 Y126.785 E.01086
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.02709
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.629 Y128.637 E-.08742
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.062 J1.215 P1  F30000
G1 X149.398 Y130.398 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.602 Y130.398 E1.28693
G1 X110.602 Y125.602 E.15909
G1 X149.398 Y125.602 E1.28693
G1 X149.398 Y130.338 E.1571
G1 X149.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.666 J1.018 P1  F30000
G1 X149.194 Y129.814 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X147.978 Y130.194 E.0298
G1 X148.772 Y130.194 F30000
; LINE_WIDTH: 0.55611
G1 F12276.161
G1 X149.194 Y129.084 E.04968
G1 X149.194 Y126.916 F30000
; LINE_WIDTH: 0.511113
G1 F13455.986
G1 X148.772 Y125.806 E.04532
G1 X149.194 Y126.186 F30000
; LINE_WIDTH: 0.329883
G1 F15000
G1 X147.978 Y125.806 E.0298
G1 X146.022 Y125.806 F30000
; LINE_WIDTH: 0.130746
G1 F15000
G1 X145.821 Y125.945 E.00175
; WIPE_START
G1 F24000
G1 X146.022 Y125.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.216 J-.058 P1  F30000
G1 X145.821 Y130.055 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.130745
G1 F15000
G1 X146.022 Y130.194 E.00175
G1 X117.392 Y127.846 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351909
G1 F15000
G1 X117.392 Y128.154 E.00778
G1 X142.608 Y128.154 E.6349
G1 X142.608 Y127.846 E.00778
G1 X117.452 Y127.846 E.63339
G1 X117.058 Y128 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X117.01 Y128.498 E.01536
G1 X142.99 Y128.498 E.79826
G1 X142.942 Y128 E.01536
G1 X142.99 Y127.502 E.01536
G1 X117.01 Y127.502 E.79826
G1 X117.053 Y127.94 E.01351
G1 X116.672 Y128.159 F30000
G1 F15000
G1 X116.603 Y128.724 E.01749
G1 X116.566 Y128.875 E.00476
G1 X143.434 Y128.875 E.82558
G1 X143.328 Y128.159 E.02222
G3 X143.434 Y127.125 I4.895 J-.022 E.03199
G1 X116.566 Y127.125 E.82558
G1 X116.672 Y127.841 E.02222
G1 X116.672 Y128.099 E.00793
G1 X116.297 Y127.886 F30000
G1 F15000
G1 X116.229 Y128.679 E.02444
G1 X116.041 Y129.252 E.01853
G1 X143.959 Y129.252 E.85786
G1 X143.771 Y128.679 E.01853
G1 X143.703 Y128.114 E.01749
G1 X143.771 Y127.321 E.02444
G1 X143.959 Y126.748 E.01853
G1 X116.041 Y126.748 E.85786
G1 X116.229 Y127.321 E.01853
G1 X116.29 Y127.827 E.01565
G1 X115.923 Y127.932 F30000
G1 F15000
G1 X115.854 Y128.633 E.02166
G1 X115.62 Y129.298 E.02166
G1 X115.412 Y129.629 E.01201
G1 X144.588 Y129.629 E.89652
G1 X144.38 Y129.298 E.01201
G1 X144.178 Y128.766 E.01749
G1 X144.077 Y128.068 E.02166
G1 X144.146 Y127.367 E.02166
G1 X144.38 Y126.702 E.02166
G1 X144.588 Y126.371 E.01201
G1 X115.412 Y126.371 E.89652
G1 X115.62 Y126.702 E.01201
G1 X115.822 Y127.234 E.01749
G1 X115.914 Y127.872 E.01981
G1 X115.549 Y127.977 F30000
G1 F15000
G1 X115.48 Y128.588 E.01888
G1 X115.267 Y129.164 E.01888
G1 X114.923 Y129.673 E.01888
G1 X114.612 Y129.992 E.01369
G1 X115.667 Y130.006 E.03241
G1 X145.378 Y130.006 E.91296
G2 X145.383 Y129.951 I-.029 J-.03 E.00184
G1 X145.077 Y129.673 E.0127
G1 X144.754 Y129.205 E.01749
G1 X144.531 Y128.632 E.01888
G1 X144.451 Y128.023 E.01888
G1 X144.52 Y127.412 E.01888
G1 X144.733 Y126.836 E.01888
G1 X145.077 Y126.327 E.01888
G1 X145.388 Y126.008 E.01369
G1 X144.333 Y125.994 E.03241
G1 X114.622 Y125.994 E.91296
G1 X114.617 Y126.049 E.00169
G1 X114.923 Y126.327 E.0127
G1 X115.246 Y126.795 E.01749
G1 X115.469 Y127.368 E.01888
G1 X115.541 Y127.918 E.01704
G1 X114.179 Y125.945 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X113.978 Y125.806 E.00108
G1 X112.022 Y125.806 F30000
; LINE_WIDTH: 0.309038
G1 F15000
G1 X110.806 Y126.186 E.02764
G1 X111.228 Y125.806 F30000
; LINE_WIDTH: 0.556113
G1 F12276.086
G1 X110.806 Y126.916 E.04968
G1 X110.806 Y129.084 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X111.228 Y130.194 E.04968
G1 X110.806 Y129.814 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X112.022 Y130.194 E.02764
G1 X113.978 Y130.194 F30000
; LINE_WIDTH: 0.0969194
G1 F15000
G1 X114.179 Y130.055 E.00108
; WIPE_START
G1 F24000
G1 X113.978 Y130.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.584 J1.067 P1  F30000
G1 X145.386 Y112.998 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.364 Y112.965 E.00133
G1 X145.179 Y112.479 E.01725
G1 X145.117 Y111.963 E.01725
G1 X145.179 Y111.447 E.01725
G1 X145.364 Y110.96 E.01725
G1 X145.659 Y110.533 E.01725
G1 X146.048 Y110.188 E.01725
G1 X146.508 Y109.946 E.01725
G1 X147.013 Y109.822 E.01725
G1 X147.533 Y109.822 E.01725
G1 X148.038 Y109.946 E.01725
G1 X148.498 Y110.188 E.01725
G1 X148.887 Y110.533 E.01725
G1 X149.183 Y110.96 E.01725
G1 X149.367 Y111.447 E.01725
G1 X149.43 Y111.963 E.01725
G1 X149.367 Y112.479 E.01725
G1 X149.183 Y112.965 E.01725
G1 X148.887 Y113.393 E.01725
G1 X148.498 Y113.737 E.01725
G1 X148.038 Y113.979 E.01724
G1 X147.533 Y114.103 E.01725
G1 X147.013 Y114.103 E.01725
G1 X146.508 Y113.979 E.01725
G1 X146.048 Y113.737 E.01725
G1 X145.659 Y113.393 E.01725
G1 X145.42 Y113.047 E.01392
G1 X145.713 Y112.781 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.563 Y112.384 E.01305
G1 X145.552 Y112.297 E.0027
G1 X145.512 Y111.963 E.01035
G1 X145.563 Y111.541 E.01305
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.747 Y112.831 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.563 Y112.384 E-.18359
G1 X145.552 Y112.297 E-.03335
G1 X145.512 Y111.963 E-.12802
G1 X145.563 Y111.541 E-.16137
G1 X145.713 Y111.144 E-.16137
G1 X145.851 Y110.944 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.015 J-1.217 P1  F30000
G1 X114.91 Y110.566 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.183 Y110.96 E.01591
G1 X115.367 Y111.447 E.01725
G1 X115.43 Y111.963 E.01725
G1 X115.367 Y112.479 E.01725
G1 X115.183 Y112.965 E.01725
G1 X114.887 Y113.393 E.01725
G1 X114.498 Y113.737 E.01725
M73 P65 R4
G1 X114.038 Y113.979 E.01725
G1 X113.533 Y114.103 E.01725
G1 X113.013 Y114.103 E.01725
G1 X112.508 Y113.979 E.01725
G1 X112.048 Y113.737 E.01725
G1 X111.659 Y113.393 E.01725
G1 X111.364 Y112.965 E.01725
G1 X111.179 Y112.479 E.01725
G1 X111.163 Y112.344 E.00449
G1 X111.117 Y111.963 E.01275
G1 X111.179 Y111.447 E.01725
G1 X111.364 Y110.96 E.01725
G1 X111.659 Y110.533 E.01725
G1 X112.048 Y110.188 E.01725
G1 X112.508 Y109.946 E.01725
G1 X113.013 Y109.822 E.01725
G1 X113.533 Y109.822 E.01725
G1 X114.038 Y109.946 E.01725
G1 X114.498 Y110.188 E.01725
G1 X114.599 Y110.278 E.00449
G1 X114.872 Y110.52 E.0121
G1 X114.583 Y110.787 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.592 Y110.795 E.00035
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.833 Y112.781 E.01305
G1 X114.592 Y113.131 E.01305
G1 X114.274 Y113.412 E.01305
G1 X113.898 Y113.61 E.01305
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.552 Y112.297 E.0027
G1 X111.512 Y111.963 E.01035
G1 X111.563 Y111.541 E.01305
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.538 Y110.747 E.01086
M204 S10000
; WIPE_START
G1 F24000
G1 X114.592 Y110.795 E-.02709
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.902 Y112.599 E-.08742
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.062 J1.215 P1  F30000
G1 X149.671 Y114.361 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.875 Y114.361 E1.28693
G1 X110.875 Y109.565 E.15909
G1 X149.671 Y109.565 E1.28693
G1 X149.671 Y114.301 E.1571
G1 X150.063 Y114.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.666 J1.018 P1  F30000
G1 X149.467 Y113.776 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X148.251 Y114.157 E.0298
G1 X149.045 Y114.157 F30000
; LINE_WIDTH: 0.55611
G1 F12276.161
G1 X149.467 Y113.047 E.04968
G1 X149.467 Y110.878 F30000
; LINE_WIDTH: 0.511113
G1 F13455.986
G1 X149.045 Y109.768 E.04532
G1 X149.467 Y110.149 F30000
; LINE_WIDTH: 0.329883
G1 F15000
G1 X148.251 Y109.768 E.0298
G1 X146.295 Y109.768 F30000
; LINE_WIDTH: 0.130746
G1 F15000
G1 X146.094 Y109.907 E.00175
; WIPE_START
G1 F24000
G1 X146.295 Y109.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.216 J-.058 P1  F30000
G1 X146.094 Y114.018 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.130745
G1 F15000
G1 X146.295 Y114.157 E.00175
G1 X117.665 Y111.808 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351909
G1 F15000
G1 X117.665 Y112.117 E.00778
G1 X142.881 Y112.117 E.6349
G1 X142.881 Y111.808 E.00778
G1 X117.725 Y111.808 E.63339
G1 X117.331 Y111.963 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X117.283 Y112.46 E.01536
G1 X143.263 Y112.46 E.79826
G1 X143.215 Y111.963 E.01536
G1 X143.263 Y111.465 E.01536
G1 X117.283 Y111.465 E.79826
G1 X117.326 Y111.903 E.01351
G1 X116.945 Y112.122 F30000
G1 F15000
G1 X116.876 Y112.687 E.01749
G1 X116.839 Y112.837 E.00476
G1 X143.707 Y112.837 E.82558
G1 X143.601 Y112.122 E.02222
G3 X143.707 Y111.088 I4.895 J-.022 E.03199
G1 X116.839 Y111.088 E.82558
G1 X116.945 Y111.804 E.02222
G1 X116.945 Y112.062 E.00793
G1 X116.57 Y111.849 F30000
G1 F15000
G1 X116.502 Y112.641 E.02444
G1 X116.314 Y113.214 E.01853
G1 X144.232 Y113.214 E.85786
G1 X144.044 Y112.641 E.01853
G1 X143.976 Y112.076 E.01749
G1 X144.044 Y111.284 E.02444
G1 X144.232 Y110.711 E.01853
G1 X116.314 Y110.711 E.85786
G1 X116.502 Y111.284 E.01853
G1 X116.563 Y111.789 E.01565
G1 X116.196 Y111.894 F30000
G1 F15000
G1 X116.127 Y112.596 E.02166
G1 X115.893 Y113.261 E.02166
G1 X115.685 Y113.591 E.01201
G1 X144.861 Y113.591 E.89652
G1 X144.653 Y113.261 E.01201
G1 X144.451 Y112.728 E.01749
G1 X144.35 Y112.031 E.02166
G1 X144.419 Y111.329 E.02166
G1 X144.653 Y110.665 E.02166
G1 X144.861 Y110.334 E.01201
G1 X115.685 Y110.334 E.89652
G1 X115.893 Y110.665 E.01201
G1 X116.095 Y111.197 E.01749
G1 X116.187 Y111.835 E.01981
G1 X115.822 Y111.94 F30000
G1 F15000
G1 X115.753 Y112.551 E.01888
G1 X115.54 Y113.127 E.01888
G1 X115.196 Y113.636 E.01888
G1 X114.885 Y113.955 E.01369
G1 X115.94 Y113.968 E.03241
G1 X145.652 Y113.968 E.91296
G2 X145.656 Y113.914 I-.029 J-.03 E.00184
G1 X145.35 Y113.636 E.0127
G1 X145.027 Y113.167 E.01749
G1 X144.804 Y112.595 E.01888
G1 X144.724 Y111.985 E.01888
G1 X144.793 Y111.375 E.01888
G1 X145.006 Y110.798 E.01888
G1 X145.35 Y110.29 E.01888
G1 X145.661 Y109.97 E.01369
G1 X144.606 Y109.957 E.03241
G1 X114.895 Y109.957 E.91296
G1 X114.89 Y110.011 E.00169
G1 X115.196 Y110.29 E.0127
G1 X115.519 Y110.758 E.01749
G1 X115.742 Y111.331 E.01888
G1 X115.814 Y111.88 E.01704
G1 X114.452 Y109.907 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X114.251 Y109.768 E.00108
G1 X112.295 Y109.768 F30000
; LINE_WIDTH: 0.309038
G1 F15000
G1 X111.079 Y110.149 E.02764
G1 X111.501 Y109.768 F30000
; LINE_WIDTH: 0.556113
G1 F12276.086
G1 X111.079 Y110.878 E.04968
G1 X111.079 Y113.047 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X111.501 Y114.157 E.04968
G1 X111.079 Y113.776 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X112.295 Y114.157 E.02764
G1 X114.251 Y114.157 F30000
; LINE_WIDTH: 0.0969194
G1 F15000
G1 X114.452 Y114.018 E.00108
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.251 Y114.157 E-.76
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
G3 Z1 I-1.017 J.669 P1  F30000
G1 X145.952 Y162.346 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15409
G1 X145.7 Y161.981 E.01472
G1 X145.528 Y161.529 E.01605
G1 X145.47 Y161.048 E.01605
G1 X145.528 Y160.568 E.01605
G1 X145.7 Y160.116 E.01605
G1 X145.975 Y159.718 E.01605
G1 X146.337 Y159.397 E.01605
G1 X146.765 Y159.172 E.01605
G1 X147.235 Y159.057 E.01605
G1 X147.718 Y159.057 E.01605
G1 X148.188 Y159.172 E.01605
G1 X148.616 Y159.397 E.01605
G1 X148.979 Y159.718 E.01605
G1 X149.253 Y160.116 E.01605
G1 X149.425 Y160.568 E.01605
G1 X149.483 Y161.048 E.01605
G1 X149.425 Y161.529 E.01605
G1 X149.253 Y161.981 E.01605
G1 X148.979 Y162.379 E.01605
G1 X148.616 Y162.7 E.01605
G1 X148.188 Y162.925 E.01605
G1 X147.718 Y163.04 E.01605
G1 X147.235 Y163.04 E.01605
G1 X146.765 Y162.925 E.01605
G1 X146.337 Y162.7 E.01605
G1 X146.184 Y162.564 E.00678
G1 X145.99 Y162.392 E.0086
G1 X146.279 Y162.11 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X147.282 Y159.449 I1.2 J-1.067 E.10733
G3 X148.392 Y159.722 I.146 J1.797 E.03574
G1 X148.683 Y159.98 E.01194
G3 X146.319 Y162.154 I-1.204 J1.063 E.15302
M204 S10000
; WIPE_START
G1 F24000
G1 X146.05 Y161.797 E-.16984
G1 X145.912 Y161.434 E-.14763
G1 X145.865 Y161.048 E-.14763
G1 X145.912 Y160.663 E-.14763
G1 X146.049 Y160.3 E-.14727
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.065 J-1.215 P1  F30000
G1 X115.267 Y161.944 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15409
G1 X115.253 Y161.981 E.00132
G1 X114.979 Y162.379 E.01605
G1 X114.616 Y162.7 E.01605
G1 X114.188 Y162.925 E.01605
G1 X113.718 Y163.04 E.01605
G1 X113.235 Y163.04 E.01605
G1 X112.765 Y162.925 E.01605
G1 X112.337 Y162.7 E.01605
G1 X111.975 Y162.379 E.01605
G1 X111.7 Y161.981 E.01605
G1 X111.528 Y161.529 E.01605
G1 X111.47 Y161.048 E.01605
G1 X111.528 Y160.568 E.01605
G1 X111.7 Y160.116 E.01605
G1 X111.975 Y159.718 E.01605
G1 X112.337 Y159.397 E.01605
G1 X112.518 Y159.302 E.00678
G1 X112.765 Y159.172 E.00927
G1 X113.235 Y159.057 E.01605
G1 X113.718 Y159.057 E.01605
G1 X114.188 Y159.172 E.01605
G1 X114.616 Y159.397 E.01605
G1 X114.979 Y159.718 E.01605
G1 X115.253 Y160.116 E.01605
G1 X115.425 Y160.568 E.01605
G1 X115.459 Y160.846 E.00927
G1 X115.483 Y161.048 E.00678
G1 X115.425 Y161.529 E.01605
G1 X115.289 Y161.888 E.01273
G1 X114.9 Y161.796 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X112.561 Y159.722 I-1.42 J-.754 E.17862
G1 X112.905 Y159.542 E.01194
G1 X113.282 Y159.449 E.01194
G3 X115.041 Y160.663 I.194 J1.6 E.0718
G1 X115.088 Y161.048 E.01194
G3 X114.927 Y161.742 I-1.608 J-.007 E.02207
M204 S10000
; WIPE_START
G1 F24000
G1 X114.683 Y162.117 E-.17005
G1 X114.392 Y162.375 E-.14763
G1 X114.048 Y162.555 E-.14763
G1 X113.671 Y162.648 E-.14763
G1 X113.284 Y162.648 E-.14706
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.027 J1.217 P1  F30000
G1 X149.875 Y163.446 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15409
G1 X111.079 Y163.446 E1.28693
G1 X111.079 Y158.651 E.15909
G1 X149.875 Y158.651 E1.28693
G1 X149.875 Y163.386 E.1571
G1 X150.267 Y163.838 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.687 Y163.838 E1.21618
G1 X110.687 Y158.258 E.17146
G1 X150.267 Y158.258 E1.21618
G1 X150.267 Y163.778 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.267 Y163.782 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.837 J.883 P1  F30000
G1 X149.153 Y162.942 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645598
G1 F10453.343
G1 X149.332 Y162.958 E.00881
G1 X149.263 Y162.368 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134651
G1 F15000
G1 X149.375 Y162.24 E.00127
; LINE_WIDTH: 0.17238
G1 X149.488 Y162.113 E.00179
; LINE_WIDTH: 0.178249
G1 X149.671 Y161.879 E.00327
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.240634
G1 F15000
G1 X149.543 Y162.151 E.00315
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X149.614 Y161.766 E.00238
; LINE_WIDTH: 0.144825
G1 X149.649 Y161.574 E.00162
G1 X149.649 Y160.523 F30000
; LINE_WIDTH: 0.0969199
G1 F15000
G1 X149.614 Y160.331 E.00086
; LINE_WIDTH: 0.144825
G1 X149.578 Y160.138 E.00162
; LINE_WIDTH: 0.192731
G1 X149.543 Y159.946 E.00238
G1 X149.488 Y159.984 F30000
; LINE_WIDTH: 0.172382
G1 F15000
G1 X149.375 Y159.857 E.00179
; LINE_WIDTH: 0.134652
G1 X149.263 Y159.729 E.00127
G1 X149.488 Y159.984 F30000
; LINE_WIDTH: 0.178252
G1 F15000
G1 X149.671 Y160.218 E.00327
G1 X149.151 Y159.156 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.646692
G1 F10434.403
G1 X149.332 Y159.139 E.00891
G1 X148.571 Y159.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.09692
G1 F15000
G1 X148.431 Y159.02 E.00075
; LINE_WIDTH: 0.13797
G1 X148.276 Y158.918 E.00143
; LINE_WIDTH: 0.171348
G1 X148.11 Y158.898 E.00176
; LINE_WIDTH: 0.134134
G1 X147.943 Y158.878 E.00125
G1 X147.01 Y158.878 F30000
; LINE_WIDTH: 0.0969201
G1 F15000
G1 X146.844 Y158.898 E.00074
; LINE_WIDTH: 0.137457
G1 X146.662 Y158.923 E.00141
; LINE_WIDTH: 0.172382
G1 X146.522 Y159.02 E.00179
; LINE_WIDTH: 0.134651
G1 X146.383 Y159.117 E.00127
G1 X145.363 Y159 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P66 R4
G1 F15409
G1 X145.351 Y159.068 E.00226
G1 X145.592 Y159.418 E.01413
G1 X145.188 Y160.484 E.03782
G2 X145.188 Y161.613 I2.289 J.564 E.03779
G1 X145.751 Y163.096 E.05264
G1 X115.202 Y163.098 E1.01335
G1 X115.765 Y161.613 E.0527
G2 X115.629 Y160.125 I-2.379 J-.532 E.05036
G1 X115.202 Y158.999 E.03995
G1 X145.303 Y159 E.9985
G1 X142.559 Y159.407 F30000
G1 F15409
G1 X144.188 Y159.407 E.05401
G1 X144.893 Y160.113 E.0331
G2 X144.893 Y161.984 I2.055 J.935 E.06398
G1 X144.188 Y162.69 E.0331
G1 X139.794 Y162.69 E.14575
G1 X136.511 Y159.407 E.154
G1 X139.794 Y159.407 E.10889
G1 X136.511 Y162.69 E.154
G1 X132.118 Y162.69 E.14572
G1 X128.835 Y159.407 E.15403
G1 X132.118 Y159.407 E.10892
G1 X128.835 Y162.69 E.15403
G1 X124.443 Y162.691 E.14569
G1 X121.158 Y159.406 E.15407
G1 X124.443 Y159.406 E.10895
G1 X121.158 Y162.691 E.15407
G1 X116.767 Y162.691 E.14567
G1 X116.06 Y161.984 E.03317
G2 X116.06 Y160.113 I-2.485 J-.935 E.06342
G1 X116.767 Y159.406 E.03317
G1 X118.395 Y159.406 E.05401
G1 X114.571 Y159.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.09692
G1 F15000
G1 X114.431 Y159.02 E.00075
; LINE_WIDTH: 0.13797
G1 X114.276 Y158.918 E.00143
; LINE_WIDTH: 0.17135
G1 X114.11 Y158.898 E.00176
; LINE_WIDTH: 0.134135
G1 X113.943 Y158.878 E.00125
G1 X113.01 Y158.878 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X112.844 Y158.898 E.00074
; LINE_WIDTH: 0.137457
G1 X112.662 Y158.923 E.00141
; LINE_WIDTH: 0.172379
G1 X112.522 Y159.02 E.00179
; LINE_WIDTH: 0.134649
G1 X112.383 Y159.117 E.00127
G1 X111.572 Y159.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.606324
G1 F11182.029
G1 X111.739 Y159.15 E.00769
G1 X111.691 Y159.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969205
G1 F15000
G1 X111.578 Y159.857 E.00075
; LINE_WIDTH: 0.158641
G2 X111.282 Y160.218 I2.803 J2.597 E.0044
G1 X111.375 Y160.138 F30000
; LINE_WIDTH: 0.19273
G1 F15000
G1 X111.34 Y160.331 E.00238
; LINE_WIDTH: 0.144825
G1 X111.304 Y160.523 E.00162
G1 X111.375 Y160.138 F30000
; LINE_WIDTH: 0.240635
G1 F15000
G1 X111.41 Y159.946 E.00315
G1 X111.304 Y161.574 F30000
; LINE_WIDTH: 0.144825
G1 F15000
G1 X111.34 Y161.766 E.00162
; LINE_WIDTH: 0.19273
G1 X111.375 Y161.959 E.00238
; LINE_WIDTH: 0.240634
G1 X111.41 Y162.151 E.00315
G1 X111.578 Y162.24 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X111.691 Y162.368 E.00075
G1 X111.578 Y162.24 F30000
; LINE_WIDTH: 0.158638
G1 F15000
G3 X111.282 Y161.879 I2.804 J-2.598 E.0044
G1 X111.565 Y162.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608158
G1 F11145.747
G1 X111.739 Y162.946 E.00805
G1 X112.383 Y162.98 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134649
G1 F15000
G1 X112.522 Y163.077 E.00127
; LINE_WIDTH: 0.172379
G1 X112.662 Y163.174 E.00179
; LINE_WIDTH: 0.137458
G1 X112.844 Y163.199 E.00141
; LINE_WIDTH: 0.0969204
G1 X113.01 Y163.219 E.00074
G1 X113.943 Y163.219 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X114.11 Y163.199 E.00125
; LINE_WIDTH: 0.17135
G1 X114.276 Y163.179 E.00176
; LINE_WIDTH: 0.137971
G1 X114.431 Y163.077 E.00143
; LINE_WIDTH: 0.0969208
G1 X114.571 Y162.98 E.00075
G1 X146.383 Y162.98 F30000
; LINE_WIDTH: 0.134651
G1 F15000
G1 X146.522 Y163.077 E.00127
; LINE_WIDTH: 0.172381
G1 X146.662 Y163.174 E.00179
; LINE_WIDTH: 0.137458
G1 X146.844 Y163.199 E.00141
; LINE_WIDTH: 0.0969204
G1 X147.01 Y163.219 E.00074
G1 X147.943 Y163.219 F30000
; LINE_WIDTH: 0.134134
G1 F15000
G1 X148.11 Y163.199 E.00125
; LINE_WIDTH: 0.171348
G1 X148.276 Y163.179 E.00176
; LINE_WIDTH: 0.137972
G1 X148.431 Y163.077 E.00143
; LINE_WIDTH: 0.096921
G1 X148.571 Y162.98 E.00075
; WIPE_START
G1 F24000
G1 X148.431 Y163.077 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.209 J-.136 P1  F30000
G1 X146.644 Y147.234 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15409
G1 X146.392 Y146.868 E.01472
G1 X146.221 Y146.416 E.01605
G1 X146.162 Y145.936 E.01605
G1 X146.221 Y145.456 E.01605
G1 X146.392 Y145.003 E.01605
G1 X146.667 Y144.605 E.01605
G1 X147.029 Y144.284 E.01605
G1 X147.457 Y144.06 E.01605
G1 X147.927 Y143.944 E.01605
G1 X148.411 Y143.944 E.01605
G1 X148.88 Y144.06 E.01605
G1 X149.309 Y144.284 E.01605
G1 X149.671 Y144.605 E.01605
G1 X149.946 Y145.003 E.01605
G1 X150.117 Y145.456 E.01605
G1 X150.175 Y145.936 E.01605
G1 X150.117 Y146.416 E.01605
G1 X149.946 Y146.868 E.01605
G1 X149.671 Y147.266 E.01605
G1 X149.309 Y147.587 E.01605
G1 X148.88 Y147.812 E.01605
G1 X148.411 Y147.928 E.01605
G1 X147.927 Y147.928 E.01605
G1 X147.457 Y147.812 E.01605
G1 X147.029 Y147.587 E.01605
G1 X146.876 Y147.452 E.00678
G1 X146.682 Y147.28 E.0086
G1 X146.971 Y146.997 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X147.975 Y144.336 I1.2 J-1.067 E.10733
G3 X149.084 Y144.61 I.146 J1.797 E.03574
G1 X149.375 Y144.867 E.01194
G3 X147.012 Y147.041 I-1.204 J1.063 E.15302
M204 S10000
; WIPE_START
G1 F24000
G1 X146.742 Y146.685 E-.16984
G1 X146.604 Y146.321 E-.14763
G1 X146.557 Y145.936 E-.14763
G1 X146.604 Y145.55 E-.14763
G1 X146.742 Y145.188 E-.14727
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.065 J-1.215 P1  F30000
G1 X115.96 Y146.831 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15409
G1 X115.946 Y146.868 E.00132
G1 X115.671 Y147.266 E.01605
G1 X115.309 Y147.587 E.01605
G1 X114.88 Y147.812 E.01605
G1 X114.411 Y147.928 E.01605
G1 X113.927 Y147.928 E.01605
G1 X113.457 Y147.812 E.01605
G1 X113.029 Y147.587 E.01605
G1 X112.667 Y147.266 E.01605
G1 X112.392 Y146.868 E.01605
G1 X112.221 Y146.416 E.01605
G1 X112.162 Y145.936 E.01605
G1 X112.221 Y145.456 E.01605
G1 X112.392 Y145.003 E.01605
G1 X112.667 Y144.605 E.01605
G1 X113.029 Y144.284 E.01605
G1 X113.21 Y144.19 E.00678
G1 X113.457 Y144.06 E.00927
G1 X113.927 Y143.944 E.01605
G1 X114.411 Y143.944 E.01605
G1 X114.88 Y144.06 E.01605
G1 X115.309 Y144.284 E.01605
G1 X115.671 Y144.605 E.01605
G1 X115.946 Y145.003 E.01605
G1 X116.117 Y145.456 E.01605
G1 X116.151 Y145.733 E.00927
G1 X116.175 Y145.936 E.00678
G1 X116.117 Y146.416 E.01605
G1 X115.981 Y146.775 E.01273
G1 X115.593 Y146.683 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X113.253 Y144.61 I-1.42 J-.754 E.17862
G1 X113.597 Y144.429 E.01194
G1 X113.975 Y144.336 E.01194
G3 X115.734 Y145.55 I.194 J1.6 E.0718
G1 X115.78 Y145.936 E.01194
G3 X115.62 Y146.63 I-1.608 J-.007 E.02207
M204 S10000
; WIPE_START
G1 F24000
G1 X115.375 Y147.004 E-.17005
G1 X115.084 Y147.262 E-.14763
G1 X114.74 Y147.443 E-.14763
G1 X114.363 Y147.536 E-.14763
G1 X113.976 Y147.536 E-.14706
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.027 J1.217 P1  F30000
G1 X150.567 Y148.334 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15409
G1 X111.771 Y148.334 E1.28693
G1 X111.771 Y143.538 E.15909
G1 X150.567 Y143.538 E1.28693
G1 X150.567 Y148.274 E.1571
G1 X150.959 Y148.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.379 Y148.726 E1.21618
G1 X111.379 Y143.146 E.17146
G1 X150.959 Y143.146 E1.21618
G1 X150.959 Y148.666 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.959 Y148.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.837 J.883 P1  F30000
G1 X149.845 Y147.829 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645598
G1 F10453.343
G1 X150.024 Y147.845 E.00881
G1 X149.955 Y147.255 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134651
G1 F15000
G1 X150.068 Y147.128 E.00127
; LINE_WIDTH: 0.17238
G1 X150.18 Y147 E.00179
; LINE_WIDTH: 0.178249
G1 X150.363 Y146.767 E.00327
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X150.306 Y146.654 E.00238
; LINE_WIDTH: 0.144825
G1 X150.341 Y146.462 E.00162
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.240634
G1 F15000
G1 X150.236 Y147.038 E.00315
G1 X149.263 Y147.868 F30000
; LINE_WIDTH: 0.096921
G1 F15000
G1 X149.123 Y147.964 E.00075
; LINE_WIDTH: 0.137972
G1 X148.969 Y148.066 E.00143
; LINE_WIDTH: 0.171348
G1 X148.802 Y148.086 E.00176
; LINE_WIDTH: 0.134134
G1 X148.635 Y148.106 E.00125
G1 X147.703 Y148.106 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X147.536 Y148.086 E.00074
; LINE_WIDTH: 0.137458
G1 X147.355 Y148.061 E.00141
; LINE_WIDTH: 0.172381
G1 X147.215 Y147.964 E.00179
; LINE_WIDTH: 0.134651
G1 X147.075 Y147.868 E.00127
; WIPE_START
G1 F24000
G1 X147.215 Y147.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.216 J-.043 P1  F30000
G1 X147.075 Y144.004 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.134651
G1 F15000
G1 X147.215 Y143.907 E.00127
; LINE_WIDTH: 0.172382
G1 X147.355 Y143.811 E.00179
; LINE_WIDTH: 0.137457
G1 X147.536 Y143.785 E.00141
; LINE_WIDTH: 0.0969201
G1 X147.703 Y143.765 E.00074
G1 X148.635 Y143.765 F30000
; LINE_WIDTH: 0.134134
G1 F15000
G1 X148.802 Y143.785 E.00125
; LINE_WIDTH: 0.171348
G1 X148.968 Y143.806 E.00176
; LINE_WIDTH: 0.13797
G1 X149.123 Y143.907 E.00143
; LINE_WIDTH: 0.09692
G1 X149.263 Y144.004 E.00075
G1 X149.843 Y144.043 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.646692
G1 F10434.403
G1 X150.024 Y144.027 E.00891
G1 X149.955 Y144.617 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134652
G1 F15000
G1 X150.068 Y144.744 E.00127
; LINE_WIDTH: 0.172382
G1 X150.18 Y144.871 E.00179
; LINE_WIDTH: 0.178252
G1 X150.363 Y145.105 E.00327
G1 X150.271 Y145.026 F30000
; LINE_WIDTH: 0.192731
G1 F15000
G1 X150.236 Y144.834 E.00238
G1 X150.271 Y145.026 F30000
; LINE_WIDTH: 0.144825
G1 F15000
G1 X150.306 Y145.218 E.00162
; LINE_WIDTH: 0.0969199
G1 X150.341 Y145.41 E.00086
; WIPE_START
G1 F24000
G1 X150.306 Y145.218 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.363 J-1.161 P1  F30000
G1 X146.055 Y143.888 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15409
G1 X146.043 Y143.955 E.00226
G1 X146.284 Y144.306 E.01413
G1 X145.88 Y145.372 E.03782
G2 X145.88 Y146.5 I2.289 J.564 E.03779
G1 X146.443 Y147.984 E.05264
G1 X115.894 Y147.985 E1.01335
G1 X116.458 Y146.5 E.0527
G2 X116.321 Y145.012 I-2.379 J-.532 E.05036
G1 X115.894 Y143.886 E.03995
G1 X145.995 Y143.888 E.9985
G1 X143.252 Y144.295 F30000
G1 F15409
G1 X144.88 Y144.295 E.05401
G1 X145.585 Y145 E.0331
G2 X145.585 Y146.871 I2.055 J.935 E.06398
G1 X144.88 Y147.577 E.0331
G1 X140.486 Y147.577 E.14575
G1 X137.203 Y144.294 E.154
G1 X140.486 Y144.295 E.10889
G1 X137.203 Y147.577 E.154
G1 X132.811 Y147.577 E.14572
G1 X129.527 Y144.294 E.15403
G1 X132.811 Y144.294 E.10892
G1 X129.527 Y147.578 E.15403
G1 X125.135 Y147.578 E.14569
G1 X121.851 Y144.294 E.15407
G1 X125.135 Y144.294 E.10895
G1 X121.851 Y147.578 E.15407
G1 X117.459 Y147.578 E.14567
G1 X116.752 Y146.871 E.03317
G2 X116.752 Y145 I-2.485 J-.935 E.06342
G1 X117.459 Y144.293 E.03317
G1 X119.088 Y144.293 E.05401
G1 X115.263 Y144.004 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.09692
G1 F15000
G1 X115.123 Y143.907 E.00075
; LINE_WIDTH: 0.13797
G1 X114.968 Y143.806 E.00143
; LINE_WIDTH: 0.17135
G1 X114.802 Y143.785 E.00176
; LINE_WIDTH: 0.134135
G1 X114.635 Y143.765 E.00125
G1 X113.703 Y143.765 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X113.536 Y143.785 E.00074
; LINE_WIDTH: 0.137457
G1 X113.355 Y143.811 E.00141
; LINE_WIDTH: 0.172379
G1 X113.215 Y143.907 E.00179
; LINE_WIDTH: 0.134649
G1 X113.075 Y144.004 E.00127
G1 X112.265 Y144.023 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.606324
G1 F11182.029
G1 X112.431 Y144.038 E.00769
G1 X112.383 Y144.617 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969205
G1 F15000
G1 X112.27 Y144.744 E.00075
; LINE_WIDTH: 0.158641
G2 X111.975 Y145.105 I2.803 J2.597 E.0044
G1 X112.067 Y145.026 F30000
; LINE_WIDTH: 0.240635
G1 F15000
G1 X112.102 Y144.834 E.00315
G1 X112.067 Y145.026 F30000
; LINE_WIDTH: 0.19273
G1 F15000
G1 X112.032 Y145.218 E.00238
; LINE_WIDTH: 0.144825
G1 X111.997 Y145.41 E.00162
G1 X111.997 Y146.462 F30000
; LINE_WIDTH: 0.144825
G1 F15000
G1 X112.032 Y146.654 E.00162
; LINE_WIDTH: 0.19273
G1 X112.067 Y146.846 E.00238
; LINE_WIDTH: 0.240634
G1 X112.102 Y147.038 E.00315
G1 X112.27 Y147.128 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X112.383 Y147.255 E.00075
G1 X112.27 Y147.128 F30000
; LINE_WIDTH: 0.158638
G1 F15000
G3 X111.975 Y146.767 I2.804 J-2.598 E.0044
G1 X112.257 Y147.848 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608158
G1 F11145.747
G1 X112.431 Y147.833 E.00805
G1 X113.075 Y147.868 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134649
G1 F15000
G1 X113.215 Y147.964 E.00127
; LINE_WIDTH: 0.172379
G1 X113.355 Y148.061 E.00179
; LINE_WIDTH: 0.137458
G1 X113.536 Y148.086 E.00141
; LINE_WIDTH: 0.0969204
G1 X113.703 Y148.106 E.00074
G1 X114.635 Y148.106 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X114.802 Y148.086 E.00125
; LINE_WIDTH: 0.17135
G1 X114.968 Y148.066 E.00176
; LINE_WIDTH: 0.137971
G1 X115.123 Y147.964 E.00143
; LINE_WIDTH: 0.0969208
G1 X115.263 Y147.868 E.00075
; WIPE_START
G1 F24000
G1 X115.123 Y147.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.652 J1.028 P1  F30000
G1 X145.076 Y128.965 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15409
G1 X144.906 Y128.516 E.01591
G1 X144.844 Y128 E.01725
G1 X144.906 Y127.484 E.01725
G1 X145.091 Y126.998 E.01725
G1 X145.386 Y126.57 E.01725
G1 X145.775 Y126.225 E.01725
G1 X146.235 Y125.984 E.01725
G1 X146.74 Y125.859 E.01725
G1 X147.26 Y125.859 E.01725
G1 X147.765 Y125.984 E.01725
G1 X148.225 Y126.225 E.01725
G1 X148.614 Y126.57 E.01725
G1 X148.909 Y126.998 E.01725
G1 X149.094 Y127.484 E.01725
G1 X149.157 Y128 E.01725
G1 X149.094 Y128.516 E.01725
G1 X148.909 Y129.002 E.01725
G1 X148.614 Y129.43 E.01725
G1 X148.225 Y129.775 E.01725
G1 X147.765 Y130.016 E.01725
G1 X147.26 Y130.141 E.01725
G1 X146.74 Y130.141 E.01725
G1 X146.235 Y130.016 E.01725
G1 X145.775 Y129.775 E.01725
G1 X145.386 Y129.43 E.01725
G1 X145.102 Y129.019 E.01659
G1 X145.44 Y128.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.29 Y128.422 E.01305
G1 X145.238 Y128 E.01305
G1 X145.29 Y127.578 E.01305
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
M73 P67 R4
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.474 Y128.868 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.29 Y128.422 E-.18359
G1 X145.238 Y128 E-.16137
G1 X145.29 Y127.578 E-.16137
G1 X145.44 Y127.181 E-.16137
G1 X145.578 Y126.981 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.015 J-1.217 P1  F30000
G1 X114.637 Y126.603 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15409
G1 X114.909 Y126.998 E.01591
G1 X115.094 Y127.484 E.01725
G1 X115.157 Y128 E.01725
G1 X115.094 Y128.516 E.01725
G1 X114.909 Y129.002 E.01725
G1 X114.614 Y129.43 E.01725
G1 X114.225 Y129.775 E.01725
G1 X113.765 Y130.016 E.01725
G1 X113.26 Y130.141 E.01725
G1 X112.74 Y130.141 E.01725
G1 X112.235 Y130.016 E.01725
G1 X111.775 Y129.775 E.01725
G1 X111.386 Y129.43 E.01725
G1 X111.091 Y129.002 E.01725
G1 X110.906 Y128.516 E.01725
G1 X110.844 Y128 E.01724
G1 X110.906 Y127.484 E.01725
G1 X111.091 Y126.998 E.01725
G1 X111.386 Y126.57 E.01725
G1 X111.775 Y126.225 E.01725
G1 X112.235 Y125.984 E.01725
G1 X112.74 Y125.859 E.01725
G1 X113.26 Y125.859 E.01725
G1 X113.765 Y125.984 E.01725
G1 X114.225 Y126.225 E.01725
G1 X114.599 Y126.557 E.01659
G1 X114.307 Y126.822 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.319 Y126.832 E.00047
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.56 Y128.819 E.01305
G1 X114.319 Y129.168 E.01305
G1 X114.001 Y129.45 E.01305
G1 X113.625 Y129.647 E.01305
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.238 Y128 E.01305
G1 X111.29 Y127.578 E.01305
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.262 Y126.782 E.01073
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.02862
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.63 Y128.633 E-.08589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.062 J1.215 P1  F30000
G1 X149.398 Y130.398 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15409
G1 X110.602 Y130.398 E1.28693
G1 X110.602 Y125.602 E.15909
G1 X149.398 Y125.602 E1.28693
G1 X149.398 Y130.338 E.1571
G1 X149.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.666 J1.018 P1  F30000
G1 X149.194 Y129.814 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X147.978 Y130.194 E.0298
G1 X148.772 Y130.194 F30000
; LINE_WIDTH: 0.556113
G1 F12276.09
G1 X149.194 Y129.084 E.04968
G1 X149.194 Y126.916 F30000
; LINE_WIDTH: 0.511113
G1 F13455.986
G1 X148.772 Y125.806 E.04532
G1 X149.194 Y126.186 F30000
; LINE_WIDTH: 0.329881
G1 F15000
G1 X147.978 Y125.806 E.0298
G1 X146.022 Y125.806 F30000
; LINE_WIDTH: 0.130746
G1 F15000
G1 X145.821 Y125.945 E.00175
; WIPE_START
G1 F24000
G1 X146.022 Y125.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.216 J-.058 P1  F30000
G1 X145.821 Y130.055 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.130745
G1 F15000
G1 X146.022 Y130.194 E.00175
G1 X121.903 Y125.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15409
G1 X120.274 Y125.95 E.05401
G1 X124.374 Y130.05 E.19231
G1 X127.95 Y130.05 E.11864
G1 X132.05 Y125.95 E.19231
G1 X135.626 Y125.95 E.11864
G1 X139.726 Y130.05 E.19231
G1 X143.302 Y130.05 E.11864
G1 X144.617 Y128.735 E.06167
G3 X144.617 Y127.265 I1.735 J-.735 E.0501
G1 X143.302 Y125.95 E.06167
G1 X139.726 Y125.95 E.11864
G1 X135.626 Y130.05 E.19231
G1 X132.05 Y130.05 E.11864
G1 X127.95 Y125.95 E.19231
G1 X124.374 Y125.95 E.11864
G1 X120.274 Y130.05 E.19231
G1 X116.698 Y130.05 E.11864
G1 X115.383 Y128.735 E.06167
G2 X115.383 Y127.265 I-1.735 J-.735 E.0501
G1 X116.698 Y125.95 E.06167
G1 X115.069 Y125.95 E.05401
G1 X114.179 Y125.945 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X113.978 Y125.806 E.00108
G1 X112.022 Y125.806 F30000
; LINE_WIDTH: 0.30904
G1 F15000
G1 X110.806 Y126.186 E.02764
G1 X111.228 Y125.806 F30000
; LINE_WIDTH: 0.556115
G1 F12276.054
G1 X110.806 Y126.916 E.04968
G1 X110.806 Y129.084 F30000
; LINE_WIDTH: 0.556112
G1 F12276.107
G1 X111.228 Y130.194 E.04968
G1 X110.806 Y129.814 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X112.022 Y130.194 E.02764
G1 X113.978 Y130.194 F30000
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X114.179 Y130.055 E.00108
; WIPE_START
G1 F24000
G1 X113.978 Y130.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.587 J1.066 P1  F30000
G1 X145.349 Y112.927 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15409
G1 X145.179 Y112.479 E.01591
G1 X145.117 Y111.963 E.01725
G1 X145.179 Y111.447 E.01725
G1 X145.364 Y110.96 E.01725
G1 X145.659 Y110.533 E.01725
G1 X146.048 Y110.188 E.01725
G1 X146.508 Y109.946 E.01725
G1 X147.013 Y109.822 E.01725
G1 X147.533 Y109.822 E.01725
G1 X148.038 Y109.946 E.01725
G1 X148.498 Y110.188 E.01725
G1 X148.887 Y110.533 E.01725
G1 X149.183 Y110.96 E.01725
G1 X149.367 Y111.447 E.01725
G1 X149.43 Y111.963 E.01725
G1 X149.367 Y112.479 E.01725
G1 X149.183 Y112.965 E.01725
G1 X148.887 Y113.393 E.01725
G1 X148.498 Y113.737 E.01725
G1 X148.038 Y113.979 E.01725
G1 X147.533 Y114.103 E.01725
G1 X147.013 Y114.103 E.01725
G1 X146.508 Y113.979 E.01725
G1 X146.048 Y113.737 E.01725
G1 X145.659 Y113.393 E.01725
G1 X145.375 Y112.981 E.01659
G1 X145.713 Y112.781 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.563 Y112.384 E.01305
G1 X145.512 Y111.963 E.01305
G1 X145.563 Y111.541 E.01305
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.747 Y112.831 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.563 Y112.384 E-.18359
G1 X145.512 Y111.963 E-.16137
G1 X145.563 Y111.541 E-.16137
G1 X145.713 Y111.144 E-.16137
G1 X145.851 Y110.944 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.015 J-1.217 P1  F30000
G1 X114.91 Y110.566 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15409
G1 X115.183 Y110.96 E.01591
G1 X115.367 Y111.447 E.01725
G1 X115.43 Y111.963 E.01725
G1 X115.367 Y112.479 E.01725
G1 X115.183 Y112.965 E.01725
G1 X114.887 Y113.393 E.01725
G1 X114.498 Y113.737 E.01725
G1 X114.038 Y113.979 E.01725
G1 X113.533 Y114.103 E.01725
G1 X113.013 Y114.103 E.01725
G1 X112.508 Y113.979 E.01725
G1 X112.048 Y113.737 E.01725
G1 X111.659 Y113.393 E.01725
G1 X111.364 Y112.965 E.01725
G1 X111.179 Y112.479 E.01725
G1 X111.117 Y111.963 E.01724
G1 X111.179 Y111.447 E.01725
G1 X111.364 Y110.96 E.01725
G1 X111.659 Y110.533 E.01725
G1 X112.048 Y110.188 E.01725
G1 X112.508 Y109.946 E.01725
G1 X113.013 Y109.822 E.01725
G1 X113.533 Y109.822 E.01725
G1 X114.038 Y109.946 E.01725
G1 X114.498 Y110.188 E.01725
G1 X114.872 Y110.519 E.01659
G1 X114.58 Y110.784 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.592 Y110.795 E.00047
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.833 Y112.781 E.01305
G1 X114.592 Y113.131 E.01305
G1 X114.274 Y113.412 E.01305
G1 X113.898 Y113.61 E.01305
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.512 Y111.963 E.01305
G1 X111.563 Y111.541 E.01305
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.535 Y110.745 E.01073
M204 S10000
; WIPE_START
G1 F24000
G1 X114.592 Y110.795 E-.02862
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.903 Y112.596 E-.08589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.062 J1.215 P1  F30000
G1 X149.671 Y114.361 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15409
G1 X110.875 Y114.361 E1.28693
G1 X110.875 Y109.565 E.15909
G1 X149.671 Y109.565 E1.28693
G1 X149.671 Y114.301 E.1571
G1 X150.063 Y114.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.666 J1.018 P1  F30000
G1 X149.467 Y113.776 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X148.251 Y114.157 E.0298
G1 X149.045 Y114.157 F30000
; LINE_WIDTH: 0.556113
G1 F12276.09
G1 X149.467 Y113.047 E.04968
G1 X149.467 Y110.878 F30000
; LINE_WIDTH: 0.511113
G1 F13455.986
G1 X149.045 Y109.768 E.04532
G1 X149.467 Y110.149 F30000
; LINE_WIDTH: 0.329881
G1 F15000
G1 X148.251 Y109.768 E.0298
G1 X146.295 Y109.768 F30000
; LINE_WIDTH: 0.130746
G1 F15000
G1 X146.094 Y109.907 E.00175
; WIPE_START
G1 F24000
G1 X146.295 Y109.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.216 J-.058 P1  F30000
G1 X146.094 Y114.018 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.130745
G1 F15000
G1 X146.295 Y114.157 E.00175
G1 X122.176 Y109.913 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15409
G1 X120.547 Y109.913 E.05401
G1 X124.647 Y114.012 E.19231
G1 X128.223 Y114.012 E.11864
G1 X132.323 Y109.913 E.19231
G1 X135.899 Y109.913 E.11864
G1 X139.999 Y114.012 E.19231
G1 X143.575 Y114.012 E.11864
G1 X144.89 Y112.698 E.06167
G3 X144.89 Y111.227 I1.735 J-.735 E.0501
G1 X143.575 Y109.913 E.06167
G1 X139.999 Y109.913 E.11864
G1 X135.899 Y114.012 E.19231
G1 X132.323 Y114.012 E.11864
G1 X128.223 Y109.913 E.19231
G1 X124.647 Y109.913 E.11864
G1 X120.547 Y114.012 E.19231
G1 X116.971 Y114.012 E.11864
G1 X115.656 Y112.698 E.06167
G2 X115.656 Y111.227 I-1.735 J-.735 E.0501
G1 X116.971 Y109.913 E.06167
G1 X115.342 Y109.913 E.05401
G1 X114.452 Y109.907 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X114.251 Y109.768 E.00108
G1 X112.295 Y109.768 F30000
; LINE_WIDTH: 0.30904
G1 F15000
G1 X111.079 Y110.149 E.02764
G1 X111.501 Y109.768 F30000
; LINE_WIDTH: 0.556115
G1 F12276.054
G1 X111.079 Y110.878 E.04968
G1 X111.079 Y113.047 F30000
; LINE_WIDTH: 0.556112
G1 F12276.107
G1 X111.501 Y114.157 E.04968
G1 X111.079 Y113.776 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X112.295 Y114.157 E.02764
G1 X114.251 Y114.157 F30000
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X114.452 Y114.018 E.00108
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.251 Y114.157 E-.76
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
G3 Z1.2 I-1.017 J.669 P1  F30000
G1 X146.004 Y162.405 Z1.2
G1 Z1
M73 P68 R4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.975 Y162.379 E.00131
G1 X145.7 Y161.981 E.01605
G1 X145.528 Y161.529 E.01605
G1 X145.47 Y161.048 E.01605
G1 X145.528 Y160.568 E.01605
G1 X145.7 Y160.116 E.01605
G1 X145.975 Y159.718 E.01605
G1 X146.337 Y159.397 E.01605
G1 X146.765 Y159.172 E.01605
G1 X147.235 Y159.057 E.01605
G1 X147.718 Y159.057 E.01605
G1 X148.188 Y159.172 E.01605
G1 X148.616 Y159.397 E.01605
G1 X148.979 Y159.718 E.01605
G1 X149.253 Y160.116 E.01605
G1 X149.425 Y160.568 E.01605
G1 X149.483 Y161.048 E.01605
G1 X149.425 Y161.529 E.01605
G1 X149.253 Y161.981 E.01605
G1 X148.979 Y162.379 E.01605
G1 X148.616 Y162.7 E.01605
G1 X148.188 Y162.925 E.01605
G1 X147.718 Y163.04 E.01605
G1 X147.235 Y163.04 E.01605
G1 X146.765 Y162.925 E.01605
G1 X146.337 Y162.7 E.01605
G1 X146.156 Y162.539 E.00802
G1 X146.049 Y162.445 E.00472
G1 X146.27 Y162.117 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X147.282 Y159.449 I1.206 J-1.069 E.1077
G1 X147.671 Y159.449 E.01194
G3 X146.311 Y162.161 I-.194 J1.6 E.18963
M204 S10000
; WIPE_START
G1 F24000
G1 X146.05 Y161.797 E-.17016
G1 X145.912 Y161.434 E-.14763
G1 X145.865 Y161.048 E-.14763
G1 X145.912 Y160.663 E-.14763
G1 X146.049 Y160.301 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.068 J-1.215 P1  F30000
G1 X115.231 Y162.014 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.979 Y162.379 E.01473
G1 X114.616 Y162.7 E.01605
G1 X114.188 Y162.925 E.01605
G1 X113.718 Y163.04 E.01605
G1 X113.235 Y163.04 E.01605
G1 X112.765 Y162.925 E.01605
G1 X112.337 Y162.7 E.01605
G1 X111.975 Y162.379 E.01605
G1 X111.7 Y161.981 E.01605
G1 X111.528 Y161.529 E.01605
G1 X111.47 Y161.048 E.01605
G1 X111.528 Y160.568 E.01605
G1 X111.7 Y160.116 E.01605
G1 X111.975 Y159.718 E.01605
G1 X112.337 Y159.397 E.01605
G1 X112.765 Y159.172 E.01605
G1 X113.235 Y159.057 E.01605
G1 X113.718 Y159.057 E.01605
G1 X114.188 Y159.172 E.01605
G1 X114.616 Y159.397 E.01605
G1 X114.979 Y159.718 E.01605
G1 X115.253 Y160.116 E.01605
G1 X115.425 Y160.568 E.01605
G1 X115.454 Y160.808 E.00802
G1 X115.483 Y161.048 E.00802
G1 X115.425 Y161.529 E.01605
G1 X115.261 Y161.962 E.01537
G1 X114.904 Y161.797 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X113.282 Y159.449 I-1.427 J-.749 E.20343
G3 X115.041 Y160.663 I.194 J1.6 E.0718
G1 X115.088 Y161.048 E.01194
G3 X114.93 Y161.744 I-1.612 J0 E.0221
M204 S10000
; WIPE_START
G1 F24000
G1 X114.683 Y162.117 E-.17016
G1 X114.392 Y162.375 E-.14763
G1 X114.048 Y162.555 E-.14763
G1 X113.671 Y162.648 E-.14763
G1 X113.284 Y162.648 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.027 J1.217 P1  F30000
G1 X149.875 Y163.446 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.079 Y163.446 E1.28693
G1 X111.079 Y158.651 E.15909
G1 X149.875 Y158.651 E1.28693
G1 X149.875 Y163.386 E.1571
G1 X150.267 Y163.838 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.687 Y163.838 E1.21618
G1 X110.687 Y158.258 E.17146
G1 X150.267 Y158.258 E1.21618
G1 X150.267 Y163.778 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.267 Y163.782 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.837 J.883 P1  F30000
G1 X149.153 Y162.942 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645606
G1 F10453.205
G1 X149.332 Y162.958 E.00881
G1 X149.263 Y162.368 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X149.375 Y162.24 E.00127
; LINE_WIDTH: 0.172379
G1 X149.488 Y162.113 E.00179
; LINE_WIDTH: 0.178249
G1 X149.671 Y161.879 E.00327
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X149.614 Y161.766 E.00238
; LINE_WIDTH: 0.144824
G1 X149.649 Y161.574 E.00162
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.240633
G1 F15000
G1 X149.543 Y162.151 E.00315
G1 X148.571 Y162.98 F30000
; LINE_WIDTH: 0.0969196
G1 F15000
G1 X148.431 Y163.077 E.00075
; LINE_WIDTH: 0.137972
G1 X148.276 Y163.179 E.00143
; LINE_WIDTH: 0.17135
G1 X148.11 Y163.199 E.00176
; LINE_WIDTH: 0.134135
G1 X147.943 Y163.219 E.00125
M73 P68 R3
G1 X147.01 Y163.219 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X146.844 Y163.199 E.00074
; LINE_WIDTH: 0.137458
G1 X146.662 Y163.174 E.00141
; LINE_WIDTH: 0.172385
G1 X146.522 Y163.077 E.00179
; LINE_WIDTH: 0.134653
G1 X146.382 Y162.98 E.00127
; WIPE_START
G1 F24000
G1 X146.522 Y163.077 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.216 J-.043 P1  F30000
G1 X146.383 Y159.117 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.134651
G1 F15000
G1 X146.522 Y159.02 E.00127
; LINE_WIDTH: 0.172382
G1 X146.662 Y158.923 E.00179
; LINE_WIDTH: 0.137457
G1 X146.844 Y158.898 E.00141
; LINE_WIDTH: 0.0969201
G1 X147.01 Y158.878 E.00074
G1 X147.943 Y158.878 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X148.11 Y158.898 E.00125
; LINE_WIDTH: 0.17135
G1 X148.276 Y158.918 E.00176
; LINE_WIDTH: 0.137972
G1 X148.431 Y159.02 E.00143
; LINE_WIDTH: 0.09692
G1 X148.571 Y159.117 E.00075
G1 X149.153 Y159.155 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6456
G1 F10453.308
G1 X149.332 Y159.139 E.00881
G1 X149.263 Y159.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134652
G1 F15000
G1 X149.375 Y159.857 E.00127
; LINE_WIDTH: 0.172384
G1 X149.488 Y159.984 E.00179
; LINE_WIDTH: 0.178253
G1 X149.671 Y160.218 E.00327
G1 X149.578 Y160.138 F30000
; LINE_WIDTH: 0.19273
G1 F15000
G1 X149.543 Y159.946 E.00238
G1 X149.578 Y160.138 F30000
; LINE_WIDTH: 0.144825
G1 F15000
G1 X149.614 Y160.331 E.00162
; LINE_WIDTH: 0.09692
G1 X149.649 Y160.523 E.00086
; WIPE_START
G1 F24000
G1 X149.614 Y160.331 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.396 J-1.151 P1  F30000
G1 X145.751 Y159 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.298 Y160.195 E.04237
G2 X145.381 Y162.121 I2.192 J.87 E.06588
G1 X145.751 Y163.096 E.03461
G1 X115.202 Y163.098 E1.01335
G1 X115.612 Y162.018 E.03833
G2 X115.573 Y159.976 I-2.253 J-.978 E.06986
G1 X115.202 Y158.999 E.03467
G1 X145.691 Y159 E1.01136
G1 X142.559 Y159.407 F30000
G1 F15476.087
G1 X144.188 Y159.407 E.05401
G1 X144.893 Y160.113 E.0331
G2 X144.893 Y161.984 I2.504 J.935 E.0634
G1 X144.188 Y162.689 E.0331
G1 X139.794 Y162.69 E.14575
G1 X136.511 Y159.407 E.154
G1 X139.794 Y159.407 E.10889
G1 X136.511 Y162.69 E.154
G1 X132.118 Y162.69 E.14572
G1 X128.835 Y159.407 E.15403
G1 X132.118 Y159.407 E.10892
G1 X128.835 Y162.69 E.15403
G1 X124.443 Y162.691 E.14569
G1 X121.158 Y159.406 E.15407
G1 X124.443 Y159.406 E.10895
G1 X121.158 Y162.691 E.15407
G1 X116.767 Y162.691 E.14567
G1 X116.06 Y161.984 E.03317
G2 X116.06 Y160.113 I-2.504 J-.935 E.0634
G1 X116.767 Y159.406 E.03317
G1 X118.395 Y159.406 E.05401
G1 X114.571 Y159.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969199
G1 F15000
G1 X114.431 Y159.02 E.00075
; LINE_WIDTH: 0.137969
G1 X114.276 Y158.918 E.00143
; LINE_WIDTH: 0.17135
G1 X114.11 Y158.898 E.00176
; LINE_WIDTH: 0.134135
G1 X113.943 Y158.878 E.00125
G1 X113.01 Y158.878 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X112.844 Y158.898 E.00074
; LINE_WIDTH: 0.137457
G1 X112.662 Y158.923 E.00141
; LINE_WIDTH: 0.172382
G1 X112.522 Y159.02 E.00179
; LINE_WIDTH: 0.134651
G1 X112.383 Y159.117 E.00127
G1 X111.572 Y159.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.606332
G1 F11181.87
G1 X111.739 Y159.15 E.00769
G1 X111.691 Y159.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X111.578 Y159.857 E.00075
; LINE_WIDTH: 0.158637
G2 X111.282 Y160.218 I2.802 J2.596 E.0044
G1 X111.375 Y160.138 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X111.34 Y160.331 E.00238
; LINE_WIDTH: 0.144825
G1 X111.304 Y160.523 E.00162
G1 X111.375 Y160.138 F30000
; LINE_WIDTH: 0.240634
G1 F15000
G1 X111.41 Y159.946 E.00315
G1 X111.304 Y161.574 F30000
; LINE_WIDTH: 0.144824
G1 F15000
G1 X111.34 Y161.766 E.00162
; LINE_WIDTH: 0.192728
G1 X111.375 Y161.959 E.00238
; LINE_WIDTH: 0.240632
G1 X111.41 Y162.151 E.00315
G1 X111.578 Y162.24 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X111.691 Y162.368 E.00075
G1 X111.578 Y162.24 F30000
; LINE_WIDTH: 0.158637
G1 F15000
G3 X111.282 Y161.879 I2.802 J-2.596 E.0044
G1 X111.565 Y162.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608158
G1 F11145.747
G1 X111.739 Y162.946 E.00805
G1 X112.383 Y162.98 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X112.522 Y163.077 E.00127
; LINE_WIDTH: 0.172381
G1 X112.662 Y163.174 E.00179
; LINE_WIDTH: 0.137458
G1 X112.844 Y163.199 E.00141
; LINE_WIDTH: 0.0969204
G1 X113.01 Y163.219 E.00074
G1 X113.943 Y163.219 F30000
; LINE_WIDTH: 0.134134
G1 F15000
G1 X114.11 Y163.199 E.00125
; LINE_WIDTH: 0.171348
G1 X114.276 Y163.179 E.00176
; LINE_WIDTH: 0.137969
G1 X114.431 Y163.077 E.00143
; LINE_WIDTH: 0.0969193
G1 X114.571 Y162.98 E.00075
; WIPE_START
G1 F24000
G1 X114.431 Y163.077 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.535 J1.093 P1  F30000
G1 X146.697 Y147.293 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.667 Y147.266 E.00131
G1 X146.392 Y146.868 E.01605
G1 X146.221 Y146.416 E.01605
G1 X146.162 Y145.936 E.01605
G1 X146.221 Y145.456 E.01605
G1 X146.392 Y145.003 E.01605
G1 X146.667 Y144.605 E.01605
G1 X147.029 Y144.284 E.01605
G1 X147.457 Y144.06 E.01605
G1 X147.927 Y143.944 E.01605
G1 X148.411 Y143.944 E.01605
G1 X148.88 Y144.06 E.01605
G1 X149.309 Y144.284 E.01605
G1 X149.671 Y144.605 E.01605
G1 X149.946 Y145.003 E.01605
G1 X150.117 Y145.456 E.01605
G1 X150.175 Y145.936 E.01605
G1 X150.117 Y146.416 E.01605
G1 X149.946 Y146.868 E.01605
G1 X149.671 Y147.266 E.01605
G1 X149.309 Y147.587 E.01605
G1 X148.88 Y147.812 E.01605
G1 X148.411 Y147.928 E.01605
G1 X147.927 Y147.928 E.01605
G1 X147.457 Y147.812 E.01605
G1 X147.029 Y147.587 E.01605
G1 X146.848 Y147.427 E.00802
G1 X146.742 Y147.332 E.00472
G1 X146.963 Y147.004 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X147.975 Y144.336 I1.206 J-1.069 E.1077
G1 X148.363 Y144.336 E.01194
G3 X147.003 Y147.048 I-.194 J1.6 E.18963
M204 S10000
; WIPE_START
G1 F24000
G1 X146.742 Y146.685 E-.17016
G1 X146.604 Y146.321 E-.14763
G1 X146.557 Y145.936 E-.14763
G1 X146.604 Y145.55 E-.14763
G1 X146.741 Y145.189 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.068 J-1.215 P1  F30000
G1 X115.923 Y146.901 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.671 Y147.266 E.01473
G1 X115.309 Y147.587 E.01605
G1 X114.88 Y147.812 E.01605
G1 X114.411 Y147.928 E.01605
G1 X113.927 Y147.928 E.01605
G1 X113.457 Y147.812 E.01605
G1 X113.029 Y147.587 E.01605
G1 X112.667 Y147.266 E.01605
G1 X112.392 Y146.868 E.01605
G1 X112.221 Y146.416 E.01605
G1 X112.162 Y145.936 E.01605
G1 X112.221 Y145.456 E.01605
G1 X112.392 Y145.003 E.01605
G1 X112.667 Y144.605 E.01605
G1 X113.029 Y144.284 E.01605
G1 X113.457 Y144.06 E.01605
G1 X113.927 Y143.944 E.01605
G1 X114.411 Y143.944 E.01605
G1 X114.88 Y144.06 E.01605
G1 X115.309 Y144.284 E.01605
G1 X115.671 Y144.605 E.01605
G1 X115.946 Y145.003 E.01605
G1 X116.117 Y145.456 E.01605
G1 X116.146 Y145.696 E.00802
G1 X116.175 Y145.936 E.00802
G1 X116.117 Y146.416 E.01605
G1 X115.953 Y146.849 E.01537
G1 X115.596 Y146.685 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X113.975 Y144.336 I-1.427 J-.749 E.20343
G3 X115.734 Y145.55 I.194 J1.6 E.0718
G1 X115.78 Y145.936 E.01194
G3 X115.623 Y146.631 I-1.612 J0 E.0221
M204 S10000
; WIPE_START
G1 F24000
G1 X115.375 Y147.004 E-.17016
G1 X115.084 Y147.262 E-.14763
G1 X114.74 Y147.443 E-.14763
G1 X114.363 Y147.536 E-.14763
G1 X113.976 Y147.536 E-.14695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.027 J1.217 P1  F30000
G1 X150.567 Y148.334 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.771 Y148.334 E1.28693
G1 X111.771 Y143.538 E.15909
G1 X150.567 Y143.538 E1.28693
G1 X150.567 Y148.274 E.1571
G1 X150.959 Y148.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.379 Y148.726 E1.21618
G1 X111.379 Y143.146 E.17146
G1 X150.959 Y143.146 E1.21618
G1 X150.959 Y148.666 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.959 Y148.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.837 J.883 P1  F30000
G1 X149.845 Y147.829 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645606
G1 F10453.205
G1 X150.024 Y147.845 E.00881
G1 X149.955 Y147.255 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X150.068 Y147.128 E.00127
; LINE_WIDTH: 0.172379
G1 X150.18 Y147 E.00179
; LINE_WIDTH: 0.178249
G1 X150.363 Y146.767 E.00327
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X150.306 Y146.654 E.00238
; LINE_WIDTH: 0.144824
G1 X150.341 Y146.462 E.00162
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.240633
G1 F15000
G1 X150.236 Y147.038 E.00315
G1 X149.263 Y147.868 F30000
; LINE_WIDTH: 0.0969196
G1 F15000
G1 X149.123 Y147.964 E.00075
; LINE_WIDTH: 0.137972
G1 X148.969 Y148.066 E.00143
; LINE_WIDTH: 0.17135
G1 X148.802 Y148.086 E.00176
; LINE_WIDTH: 0.134135
G1 X148.635 Y148.106 E.00125
G1 X147.703 Y148.106 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X147.536 Y148.086 E.00074
; LINE_WIDTH: 0.137458
G1 X147.355 Y148.061 E.00141
; LINE_WIDTH: 0.172385
G1 X147.215 Y147.964 E.00179
; LINE_WIDTH: 0.134653
G1 X147.075 Y147.868 E.00127
; WIPE_START
G1 F24000
G1 X147.215 Y147.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.216 J-.043 P1  F30000
G1 X147.075 Y144.004 Z1.4
G1 Z1
M73 P69 R3
G1 E.8 F1800
; LINE_WIDTH: 0.134651
G1 F15000
G1 X147.215 Y143.907 E.00127
; LINE_WIDTH: 0.172382
G1 X147.355 Y143.811 E.00179
; LINE_WIDTH: 0.137457
G1 X147.536 Y143.785 E.00141
; LINE_WIDTH: 0.0969201
G1 X147.703 Y143.765 E.00074
G1 X148.635 Y143.765 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X148.802 Y143.785 E.00125
; LINE_WIDTH: 0.17135
G1 X148.969 Y143.806 E.00176
; LINE_WIDTH: 0.137972
G1 X149.123 Y143.907 E.00143
; LINE_WIDTH: 0.09692
G1 X149.263 Y144.004 E.00075
G1 X149.845 Y144.043 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6456
G1 F10453.308
G1 X150.024 Y144.027 E.00881
G1 X149.955 Y144.617 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134652
G1 F15000
G1 X150.068 Y144.744 E.00127
; LINE_WIDTH: 0.172384
G1 X150.18 Y144.871 E.00179
; LINE_WIDTH: 0.178253
G1 X150.363 Y145.105 E.00327
G1 X150.271 Y145.026 F30000
; LINE_WIDTH: 0.144825
G1 F15000
G1 X150.306 Y145.218 E.00162
; LINE_WIDTH: 0.09692
G1 X150.341 Y145.41 E.00086
G1 X150.271 Y145.026 F30000
; LINE_WIDTH: 0.19273
G1 F15000
G1 X150.236 Y144.834 E.00238
G1 X146.443 Y143.888 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.99 Y145.082 E.04237
G2 X146.073 Y147.008 I2.192 J.87 E.06588
G1 X146.443 Y147.984 E.03461
G1 X115.894 Y147.985 E1.01335
G1 X116.304 Y146.905 E.03833
G2 X116.265 Y144.863 I-2.253 J-.978 E.06986
G1 X115.894 Y143.886 E.03467
G1 X146.383 Y143.888 E1.01136
G1 X143.252 Y144.295 F30000
G1 F15476.087
G1 X144.88 Y144.295 E.05401
G1 X145.585 Y145 E.0331
G2 X145.585 Y146.871 I2.504 J.935 E.0634
G1 X144.88 Y147.577 E.0331
G1 X140.486 Y147.577 E.14575
G1 X137.203 Y144.294 E.154
G1 X140.486 Y144.295 E.10889
G1 X137.203 Y147.577 E.154
G1 X132.811 Y147.577 E.14572
G1 X129.527 Y144.294 E.15403
G1 X132.811 Y144.294 E.10892
G1 X129.527 Y147.578 E.15403
G1 X125.135 Y147.578 E.14569
G1 X121.851 Y144.294 E.15407
G1 X125.135 Y144.294 E.10895
G1 X121.851 Y147.578 E.15407
G1 X117.459 Y147.578 E.14567
G1 X116.752 Y146.871 E.03317
G2 X116.752 Y145 I-2.504 J-.935 E.0634
G1 X117.459 Y144.293 E.03317
G1 X119.088 Y144.293 E.05401
G1 X115.263 Y144.004 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969199
G1 F15000
G1 X115.123 Y143.907 E.00075
; LINE_WIDTH: 0.137969
G1 X114.968 Y143.806 E.00143
; LINE_WIDTH: 0.17135
G1 X114.802 Y143.785 E.00176
; LINE_WIDTH: 0.134135
G1 X114.635 Y143.765 E.00125
G1 X113.703 Y143.765 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X113.536 Y143.785 E.00074
; LINE_WIDTH: 0.137457
G1 X113.355 Y143.811 E.00141
; LINE_WIDTH: 0.172382
G1 X113.215 Y143.907 E.00179
; LINE_WIDTH: 0.134651
G1 X113.075 Y144.004 E.00127
G1 X112.265 Y144.023 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.606332
G1 F11181.87
G1 X112.431 Y144.038 E.00769
G1 X112.383 Y144.617 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X112.27 Y144.744 E.00075
; LINE_WIDTH: 0.158637
G2 X111.975 Y145.105 I2.802 J2.596 E.0044
G1 X112.067 Y145.026 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X112.032 Y145.218 E.00238
; LINE_WIDTH: 0.144825
G1 X111.997 Y145.41 E.00162
G1 X112.067 Y145.026 F30000
; LINE_WIDTH: 0.240634
G1 F15000
G1 X112.102 Y144.834 E.00315
G1 X111.997 Y146.462 F30000
; LINE_WIDTH: 0.144824
G1 F15000
G1 X112.032 Y146.654 E.00162
; LINE_WIDTH: 0.192728
G1 X112.067 Y146.846 E.00238
; LINE_WIDTH: 0.240632
G1 X112.102 Y147.038 E.00315
G1 X112.27 Y147.128 F30000
; LINE_WIDTH: 0.158637
G1 F15000
G3 X111.975 Y146.767 I2.802 J-2.596 E.0044
G1 X112.27 Y147.128 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X112.383 Y147.255 E.00075
G1 X112.257 Y147.848 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608158
G1 F11145.747
G1 X112.431 Y147.833 E.00805
G1 X113.075 Y147.868 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X113.215 Y147.964 E.00127
; LINE_WIDTH: 0.172381
G1 X113.355 Y148.061 E.00179
; LINE_WIDTH: 0.137458
G1 X113.536 Y148.086 E.00141
; LINE_WIDTH: 0.0969204
G1 X113.703 Y148.106 E.00074
G1 X114.635 Y148.106 F30000
; LINE_WIDTH: 0.134134
G1 F15000
G1 X114.802 Y148.086 E.00125
; LINE_WIDTH: 0.171348
G1 X114.968 Y148.066 E.00176
; LINE_WIDTH: 0.137969
G1 X115.123 Y147.964 E.00143
; LINE_WIDTH: 0.0969193
G1 X115.263 Y147.868 E.00075
; WIPE_START
G1 F24000
G1 X115.123 Y147.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.65 J1.029 P1  F30000
G1 X145.113 Y129.035 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.091 Y129.002 E.00133
G1 X144.906 Y128.516 E.01725
G1 X144.844 Y128 E.01725
G1 X144.906 Y127.484 E.01725
G1 X145.091 Y126.998 E.01725
G1 X145.386 Y126.57 E.01725
G1 X145.775 Y126.225 E.01725
G1 X146.235 Y125.984 E.01725
G1 X146.74 Y125.859 E.01725
G1 X147.26 Y125.859 E.01725
G1 X147.765 Y125.984 E.01725
G1 X148.225 Y126.225 E.01724
G1 X148.614 Y126.57 E.01725
G1 X148.909 Y126.998 E.01725
G1 X149.094 Y127.484 E.01725
G1 X149.157 Y128 E.01725
G1 X149.094 Y128.516 E.01725
G1 X148.909 Y129.002 E.01725
G1 X148.614 Y129.43 E.01725
G1 X148.225 Y129.775 E.01725
G1 X147.765 Y130.016 E.01724
G1 X147.26 Y130.141 E.01725
G1 X146.74 Y130.141 E.01725
G1 X146.235 Y130.016 E.01725
G1 X145.775 Y129.775 E.01724
G1 X145.386 Y129.43 E.01725
G1 X145.147 Y129.085 E.01393
G1 X145.44 Y128.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.29 Y128.422 E.01305
G1 X145.238 Y128 E.01305
G1 X145.29 Y127.578 E.01305
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.474 Y128.868 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.29 Y128.422 E-.18359
G1 X145.238 Y128 E-.16137
G1 X145.29 Y127.578 E-.16137
G1 X145.44 Y127.181 E-.16137
G1 X145.578 Y126.981 E-.09229
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.015 J-1.217 P1  F30000
G1 X114.637 Y126.603 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.909 Y126.998 E.01592
G1 X115.094 Y127.484 E.01725
G1 X115.157 Y128 E.01725
G1 X115.094 Y128.516 E.01725
G1 X114.909 Y129.002 E.01725
G1 X114.614 Y129.43 E.01725
G1 X114.225 Y129.775 E.01725
G1 X113.765 Y130.016 E.01725
G1 X113.26 Y130.141 E.01725
G1 X112.74 Y130.141 E.01725
G1 X112.235 Y130.016 E.01725
G1 X111.775 Y129.775 E.01724
G1 X111.386 Y129.43 E.01725
G1 X111.091 Y129.002 E.01725
G1 X110.906 Y128.516 E.01725
G1 X110.843 Y128 E.01725
G1 X110.906 Y127.484 E.01725
G1 X111.091 Y126.998 E.01725
G1 X111.386 Y126.57 E.01725
G1 X111.775 Y126.225 E.01725
G1 X112.235 Y125.984 E.01725
G1 X112.74 Y125.859 E.01725
G1 X113.26 Y125.859 E.01725
G1 X113.765 Y125.984 E.01725
G1 X114.225 Y126.225 E.01725
G1 X114.599 Y126.557 E.01658
G1 X114.304 Y126.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.319 Y126.832 E.0006
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.56 Y128.819 E.01305
G1 X114.319 Y129.168 E.01305
G1 X114.001 Y129.45 E.01305
G1 X113.625 Y129.647 E.01305
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.238 Y128 E.01305
G1 X111.29 Y127.578 E.01305
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.259 Y126.779 E.0106
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.03025
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.632 Y128.629 E-.08427
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.062 J1.215 P1  F30000
G1 X149.398 Y130.398 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.602 Y130.398 E1.28693
G1 X110.602 Y125.602 E.15909
G1 X149.398 Y125.602 E1.28693
G1 X149.398 Y130.338 E.1571
G1 X149.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.666 J1.018 P1  F30000
G1 X149.194 Y129.814 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X147.978 Y130.194 E.0298
G1 X148.772 Y130.194 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X149.194 Y129.084 E.04968
G1 X149.194 Y126.916 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X148.772 Y125.806 E.04532
G1 X149.194 Y126.186 F30000
; LINE_WIDTH: 0.329879
G1 F15000
G1 X147.978 Y125.806 E.0298
G1 X146.022 Y125.806 F30000
; LINE_WIDTH: 0.130744
G1 F15000
G1 X145.821 Y125.945 E.00175
; WIPE_START
G1 F24000
G1 X146.022 Y125.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.217 J0 P1  F30000
G1 X146.022 Y130.194 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.130746
G1 F15000
G1 X145.821 Y130.055 E.00175
G1 X144.931 Y130.05 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.302 Y130.05 E.05401
G1 X144.617 Y128.735 E.06167
G3 X144.617 Y127.265 I1.735 J-.735 E.0501
G1 X143.302 Y125.95 E.06167
G1 X139.726 Y125.95 E.11864
G1 X135.626 Y130.05 E.19231
G1 X132.05 Y130.05 E.11864
G1 X127.95 Y125.95 E.19231
G1 X124.374 Y125.95 E.11864
G1 X120.274 Y130.05 E.19231
G1 X116.698 Y130.05 E.11864
G1 X115.383 Y128.735 E.06167
G2 X115.383 Y127.265 I-1.735 J-.735 E.0501
G1 X116.698 Y125.95 E.06167
G1 X120.274 Y125.95 E.11864
G1 X124.374 Y130.05 E.19231
G1 X127.95 Y130.05 E.11864
G1 X132.05 Y125.95 E.19231
G1 X135.626 Y125.95 E.11864
G1 X139.726 Y130.05 E.19231
G1 X138.097 Y130.05 E.05401
G1 X114.179 Y130.055 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X113.978 Y130.194 E.00108
G1 X112.022 Y130.194 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X110.806 Y129.814 E.02764
G1 X111.228 Y130.194 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X110.806 Y129.084 E.04968
G1 X110.806 Y126.916 F30000
; LINE_WIDTH: 0.556113
G1 F12276.09
G1 X111.228 Y125.806 E.04968
G1 X110.806 Y126.186 F30000
; LINE_WIDTH: 0.309035
G1 F15000
G1 X112.022 Y125.806 E.02764
G1 X113.978 Y125.806 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X114.179 Y125.945 E.00108
; WIPE_START
G1 F24000
G1 X113.978 Y125.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.46 J1.127 P1  F30000
G1 X145.386 Y112.998 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.364 Y112.965 E.00133
G1 X145.179 Y112.479 E.01725
G1 X145.117 Y111.963 E.01725
G1 X145.179 Y111.447 E.01725
G1 X145.364 Y110.96 E.01725
G1 X145.659 Y110.533 E.01725
G1 X146.048 Y110.188 E.01725
G1 X146.508 Y109.946 E.01725
G1 X147.013 Y109.822 E.01725
G1 X147.533 Y109.822 E.01725
G1 X148.038 Y109.946 E.01725
G1 X148.498 Y110.188 E.01724
G1 X148.887 Y110.533 E.01725
G1 X149.183 Y110.96 E.01725
G1 X149.367 Y111.447 E.01725
G1 X149.43 Y111.963 E.01725
G1 X149.367 Y112.479 E.01725
G1 X149.183 Y112.965 E.01725
G1 X148.887 Y113.393 E.01725
G1 X148.498 Y113.737 E.01725
G1 X148.038 Y113.979 E.01724
G1 X147.533 Y114.103 E.01725
G1 X147.013 Y114.103 E.01725
G1 X146.508 Y113.979 E.01725
G1 X146.048 Y113.737 E.01724
G1 X145.659 Y113.393 E.01725
G1 X145.42 Y113.047 E.01393
G1 X145.713 Y112.781 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.563 Y112.384 E.01305
G1 X145.512 Y111.963 E.01305
G1 X145.563 Y111.541 E.01305
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
M73 P70 R3
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.747 Y112.831 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.563 Y112.384 E-.18359
G1 X145.512 Y111.963 E-.16137
G1 X145.563 Y111.541 E-.16137
G1 X145.713 Y111.144 E-.16137
G1 X145.851 Y110.944 E-.09229
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.015 J-1.217 P1  F30000
G1 X114.91 Y110.566 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.183 Y110.96 E.01592
G1 X115.367 Y111.447 E.01725
G1 X115.43 Y111.963 E.01725
G1 X115.367 Y112.479 E.01725
G1 X115.183 Y112.965 E.01725
G1 X114.887 Y113.393 E.01725
G1 X114.498 Y113.737 E.01725
G1 X114.038 Y113.979 E.01725
G1 X113.533 Y114.103 E.01725
G1 X113.013 Y114.103 E.01725
G1 X112.508 Y113.979 E.01725
G1 X112.048 Y113.737 E.01724
G1 X111.659 Y113.393 E.01725
G1 X111.364 Y112.965 E.01725
G1 X111.179 Y112.479 E.01725
G1 X111.117 Y111.963 E.01725
G1 X111.179 Y111.447 E.01725
G1 X111.364 Y110.96 E.01725
G1 X111.659 Y110.533 E.01725
G1 X112.048 Y110.188 E.01725
G1 X112.508 Y109.946 E.01725
G1 X113.013 Y109.822 E.01725
G1 X113.533 Y109.822 E.01725
G1 X114.038 Y109.946 E.01725
G1 X114.498 Y110.188 E.01725
G1 X114.872 Y110.519 E.01658
G1 X114.577 Y110.782 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.592 Y110.795 E.0006
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.833 Y112.781 E.01305
G1 X114.592 Y113.131 E.01305
G1 X114.274 Y113.412 E.01305
G1 X113.898 Y113.61 E.01305
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.512 Y111.963 E.01305
G1 X111.563 Y111.541 E.01305
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.532 Y110.742 E.0106
M204 S10000
; WIPE_START
G1 F24000
G1 X114.592 Y110.795 E-.03025
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.905 Y112.592 E-.08427
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.062 J1.215 P1  F30000
G1 X149.671 Y114.361 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.875 Y114.361 E1.28693
G1 X110.875 Y109.565 E.15909
G1 X149.671 Y109.565 E1.28693
G1 X149.671 Y114.301 E.1571
G1 X150.063 Y114.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.666 J1.018 P1  F30000
G1 X149.467 Y113.776 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X148.251 Y114.157 E.0298
G1 X149.045 Y114.157 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X149.467 Y113.047 E.04968
G1 X149.467 Y110.878 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X149.045 Y109.768 E.04532
G1 X149.467 Y110.149 F30000
; LINE_WIDTH: 0.329879
G1 F15000
G1 X148.251 Y109.768 E.0298
G1 X146.295 Y109.768 F30000
; LINE_WIDTH: 0.130744
G1 F15000
G1 X146.094 Y109.907 E.00175
; WIPE_START
G1 F24000
G1 X146.295 Y109.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.217 J0 P1  F30000
G1 X146.295 Y114.157 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.130746
G1 F15000
G1 X146.094 Y114.018 E.00175
G1 X145.204 Y114.012 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.575 Y114.012 E.05401
G1 X144.89 Y112.698 E.06167
G3 X144.89 Y111.227 I1.735 J-.735 E.0501
G1 X143.575 Y109.913 E.06167
G1 X139.999 Y109.913 E.11864
G1 X135.899 Y114.012 E.19231
G1 X132.323 Y114.012 E.11864
G1 X128.223 Y109.913 E.19231
G1 X124.647 Y109.913 E.11864
G1 X120.547 Y114.012 E.19231
G1 X116.971 Y114.012 E.11864
G1 X115.656 Y112.698 E.06167
G2 X115.656 Y111.227 I-1.735 J-.735 E.0501
G1 X116.971 Y109.913 E.06167
G1 X120.547 Y109.913 E.11864
G1 X124.647 Y114.012 E.19231
G1 X128.223 Y114.012 E.11864
G1 X132.323 Y109.913 E.19231
G1 X135.899 Y109.913 E.11864
G1 X139.999 Y114.012 E.19231
G1 X138.37 Y114.012 E.05401
G1 X114.452 Y114.018 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X114.251 Y114.157 E.00108
G1 X112.295 Y114.157 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X111.079 Y113.776 E.02764
G1 X111.501 Y114.157 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X111.079 Y113.047 E.04968
G1 X111.079 Y110.878 F30000
; LINE_WIDTH: 0.556113
G1 F12276.09
G1 X111.501 Y109.768 E.04968
G1 X111.079 Y110.149 F30000
; LINE_WIDTH: 0.309035
G1 F15000
G1 X112.295 Y109.768 E.02764
G1 X114.251 Y109.768 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X114.452 Y109.907 E.00108
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.251 Y109.768 E-.76
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
G3 Z1.4 I-1.042 J.628 P1  F30000
G1 X145.952 Y162.347 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15088
G1 X145.7 Y161.981 E.01474
G1 X145.528 Y161.529 E.01605
G1 X145.47 Y161.048 E.01605
G1 X145.528 Y160.568 E.01605
G1 X145.7 Y160.116 E.01605
G1 X145.975 Y159.718 E.01605
G1 X146.337 Y159.397 E.01605
G1 X146.765 Y159.172 E.01605
G1 X147.235 Y159.057 E.01605
G1 X147.718 Y159.057 E.01605
G1 X148.188 Y159.172 E.01605
G1 X148.616 Y159.397 E.01605
G1 X148.979 Y159.718 E.01605
G1 X149.253 Y160.116 E.01605
G1 X149.425 Y160.568 E.01605
G1 X149.483 Y161.048 E.01605
G1 X149.425 Y161.529 E.01605
G1 X149.253 Y161.981 E.01605
G1 X148.979 Y162.379 E.01605
G1 X148.616 Y162.7 E.01605
G1 X148.188 Y162.925 E.01605
G1 X147.718 Y163.04 E.01605
G1 X147.235 Y163.04 E.01605
G1 X146.765 Y162.925 E.01605
G1 X146.337 Y162.7 E.01605
G1 X145.99 Y162.393 E.01536
G1 X146.278 Y162.111 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X147.282 Y159.449 I1.199 J-1.068 E.10742
G1 X147.671 Y159.449 E.01194
G3 X146.318 Y162.155 I-.194 J1.594 E.18877
M204 S10000
; WIPE_START
G1 F24000
G1 X146.05 Y161.797 E-.16985
G1 X145.912 Y161.434 E-.14763
G1 X145.865 Y161.048 E-.14763
G1 X145.912 Y160.663 E-.14763
G1 X146.049 Y160.3 E-.14726
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.068 J-1.215 P1  F30000
G1 X115.231 Y162.013 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15088
G1 X114.979 Y162.379 E.01474
G1 X114.616 Y162.7 E.01605
G1 X114.188 Y162.925 E.01605
G1 X113.718 Y163.04 E.01605
G1 X113.235 Y163.04 E.01605
G1 X112.765 Y162.925 E.01605
G1 X112.337 Y162.7 E.01605
G1 X111.975 Y162.379 E.01605
G1 X111.7 Y161.981 E.01605
G1 X111.528 Y161.529 E.01605
G1 X111.47 Y161.048 E.01605
G1 X111.528 Y160.568 E.01605
G1 X111.7 Y160.116 E.01605
G1 X111.975 Y159.718 E.01605
G1 X112.337 Y159.397 E.01605
G1 X112.765 Y159.172 E.01605
G1 X113.235 Y159.057 E.01605
G1 X113.718 Y159.057 E.01605
G1 X114.188 Y159.172 E.01605
G1 X114.616 Y159.397 E.01605
G1 X114.979 Y159.718 E.01605
G1 X115.253 Y160.116 E.01605
G1 X115.425 Y160.568 E.01605
G1 X115.483 Y161.048 E.01605
G1 X115.425 Y161.529 E.01605
G1 X115.261 Y161.962 E.01536
G1 X114.896 Y161.793 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X113.282 Y159.449 I-1.419 J-.751 E.20251
G1 X113.671 Y159.449 E.01194
G3 X114.923 Y161.74 I-.194 J1.594 E.09368
M204 S10000
; WIPE_START
G1 F24000
G1 X114.683 Y162.117 E-.16991
G1 X114.392 Y162.375 E-.14763
G1 X114.048 Y162.555 E-.14763
G1 X113.671 Y162.648 E-.14763
G1 X113.284 Y162.648 E-.1472
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.027 J1.217 P1  F30000
G1 X149.875 Y163.446 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15088
G1 X111.079 Y163.446 E1.28693
G1 X111.079 Y158.651 E.15909
G1 X149.875 Y158.651 E1.28693
G1 X149.875 Y163.386 E.1571
G1 X150.267 Y163.838 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.687 Y163.838 E1.21618
G1 X110.687 Y158.258 E.17146
G1 X150.267 Y158.258 E1.21618
G1 X150.267 Y163.778 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.267 Y163.782 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.837 J.883 P1  F30000
G1 X149.153 Y162.942 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645606
G1 F10453.205
G1 X149.332 Y162.958 E.00881
G1 X149.263 Y162.368 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X149.375 Y162.24 E.00127
; LINE_WIDTH: 0.172379
G1 X149.488 Y162.113 E.00179
; LINE_WIDTH: 0.178249
G1 X149.671 Y161.879 E.00327
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.240633
G1 F15000
G1 X149.543 Y162.151 E.00315
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X149.614 Y161.766 E.00238
; LINE_WIDTH: 0.144824
G1 X149.649 Y161.574 E.00162
G1 X149.649 Y160.523 F30000
; LINE_WIDTH: 0.096919
G1 F15000
G1 X149.614 Y160.331 E.00086
; LINE_WIDTH: 0.144824
G1 X149.578 Y160.138 E.00162
; LINE_WIDTH: 0.192729
G1 X149.543 Y159.946 E.00238
G1 X149.488 Y159.984 F30000
; LINE_WIDTH: 0.178252
G1 F15000
G1 X149.671 Y160.218 E.00327
G1 X149.488 Y159.984 F30000
; LINE_WIDTH: 0.172382
G1 F15000
G1 X149.375 Y159.857 E.00179
; LINE_WIDTH: 0.134652
G1 X149.263 Y159.729 E.00127
G1 X149.151 Y159.156 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.646686
G1 F10434.506
G1 X149.332 Y159.139 E.00891
G1 X148.571 Y159.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969201
G1 F15000
G1 X148.431 Y159.02 E.00075
; LINE_WIDTH: 0.137971
G1 X148.276 Y158.918 E.00143
; LINE_WIDTH: 0.17135
G1 X148.11 Y158.898 E.00176
; LINE_WIDTH: 0.134135
G1 X147.943 Y158.878 E.00125
G1 X147.01 Y158.878 F30000
; LINE_WIDTH: 0.0969201
G1 F15000
G1 X146.844 Y158.898 E.00074
; LINE_WIDTH: 0.137457
G1 X146.662 Y158.923 E.00141
; LINE_WIDTH: 0.172382
G1 X146.522 Y159.02 E.00179
; LINE_WIDTH: 0.134651
G1 X146.383 Y159.117 E.00127
G1 X145.751 Y159 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15088
G1 X145.381 Y159.976 E.03461
G2 X145.188 Y161.613 I2.372 J1.109 E.05561
G1 X145.751 Y163.096 E.05264
G1 X115.202 Y163.098 E1.01335
G1 X115.765 Y161.613 E.0527
G2 X115.629 Y160.125 I-2.459 J-.525 E.05031
G1 X115.202 Y158.999 E.03995
G1 X145.691 Y159 E1.01136
G1 X142.559 Y159.407 F30000
G1 F15088
G1 X144.188 Y159.407 E.05401
G1 X144.893 Y160.113 E.0331
G2 X144.893 Y161.984 I2.055 J.935 E.06398
G1 X144.188 Y162.689 E.0331
G1 X139.794 Y162.69 E.14575
G1 X136.511 Y159.407 E.154
G1 X139.794 Y159.407 E.10889
G1 X136.511 Y162.69 E.154
G1 X132.118 Y162.69 E.14572
G1 X128.835 Y159.407 E.15403
G1 X132.118 Y159.407 E.10892
G1 X128.835 Y162.69 E.15403
G1 X124.443 Y162.691 E.14569
G1 X121.158 Y159.406 E.15407
G1 X124.443 Y159.406 E.10895
G1 X121.158 Y162.691 E.15407
G1 X116.767 Y162.691 E.14567
G1 X116.06 Y161.984 E.03317
G2 X116.06 Y160.113 I-2.374 J-.935 E.06354
G1 X116.767 Y159.406 E.03317
G1 X118.395 Y159.406 E.05401
G1 X114.571 Y159.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.09692
G1 F15000
G1 X114.431 Y159.02 E.00075
; LINE_WIDTH: 0.13797
G1 X114.276 Y158.918 E.00143
; LINE_WIDTH: 0.17135
G1 X114.11 Y158.898 E.00176
; LINE_WIDTH: 0.134135
G1 X113.943 Y158.878 E.00125
G1 X113.01 Y158.878 F30000
; LINE_WIDTH: 0.0969201
G1 F15000
G1 X112.844 Y158.898 E.00074
; LINE_WIDTH: 0.137457
G1 X112.662 Y158.923 E.00141
; LINE_WIDTH: 0.172379
G1 X112.522 Y159.02 E.00179
; LINE_WIDTH: 0.13465
G1 X112.383 Y159.117 E.00127
G1 X111.572 Y159.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60633
G1 F11181.911
G1 X111.738 Y159.15 E.00763
G1 X111.691 Y159.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969205
G1 F15000
G1 X111.578 Y159.857 E.00075
; LINE_WIDTH: 0.158637
G2 X111.282 Y160.218 I2.802 J2.596 E.0044
M73 P71 R3
G1 X111.375 Y160.138 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X111.34 Y160.331 E.00238
; LINE_WIDTH: 0.144825
G1 X111.304 Y160.523 E.00162
G1 X111.375 Y160.138 F30000
; LINE_WIDTH: 0.240633
G1 F15000
G1 X111.41 Y159.946 E.00315
G1 X111.304 Y161.574 F30000
; LINE_WIDTH: 0.144825
G1 F15000
G1 X111.34 Y161.766 E.00162
; LINE_WIDTH: 0.19273
G1 X111.375 Y161.959 E.00238
; LINE_WIDTH: 0.240634
G1 X111.41 Y162.151 E.00315
G1 X111.578 Y162.24 F30000
; LINE_WIDTH: 0.158637
G1 F15000
G3 X111.282 Y161.879 I2.802 J-2.596 E.0044
G1 X111.578 Y162.24 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X111.691 Y162.368 E.00075
G1 X111.565 Y162.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608158
G1 F11145.747
G1 X111.739 Y162.946 E.00805
G1 X112.383 Y162.98 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134649
G1 F15000
G1 X112.522 Y163.077 E.00127
; LINE_WIDTH: 0.172378
G1 X112.662 Y163.174 E.00179
; LINE_WIDTH: 0.137458
G1 X112.844 Y163.199 E.00141
; LINE_WIDTH: 0.0969204
G1 X113.01 Y163.219 E.00074
G1 X113.943 Y163.219 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X114.11 Y163.199 E.00125
; LINE_WIDTH: 0.17135
G1 X114.276 Y163.179 E.00176
; LINE_WIDTH: 0.13797
G1 X114.431 Y163.077 E.00143
; LINE_WIDTH: 0.0969208
G1 X114.571 Y162.98 E.00075
G1 X146.383 Y162.98 F30000
; LINE_WIDTH: 0.13465
G1 F15000
G1 X146.522 Y163.077 E.00127
; LINE_WIDTH: 0.17238
G1 X146.662 Y163.174 E.00179
; LINE_WIDTH: 0.137458
G1 X146.844 Y163.199 E.00141
; LINE_WIDTH: 0.0969204
G1 X147.01 Y163.219 E.00074
G1 X147.943 Y163.219 F30000
; LINE_WIDTH: 0.134134
G1 F15000
G1 X148.11 Y163.199 E.00125
; LINE_WIDTH: 0.171348
G1 X148.276 Y163.179 E.00176
; LINE_WIDTH: 0.137972
G1 X148.431 Y163.077 E.00143
; LINE_WIDTH: 0.0969209
G1 X148.571 Y162.98 E.00075
; WIPE_START
G1 F24000
G1 X148.431 Y163.077 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.209 J-.136 P1  F30000
G1 X146.645 Y147.234 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15088
G1 X146.392 Y146.868 E.01474
G1 X146.221 Y146.416 E.01605
G1 X146.162 Y145.936 E.01605
G1 X146.221 Y145.456 E.01605
G1 X146.392 Y145.003 E.01605
G1 X146.667 Y144.605 E.01605
G1 X147.029 Y144.284 E.01605
G1 X147.457 Y144.06 E.01605
G1 X147.927 Y143.944 E.01605
G1 X148.411 Y143.944 E.01605
G1 X148.88 Y144.06 E.01605
G1 X149.309 Y144.284 E.01605
G1 X149.671 Y144.605 E.01605
G1 X149.946 Y145.003 E.01605
G1 X150.117 Y145.456 E.01605
G1 X150.175 Y145.936 E.01605
G1 X150.117 Y146.416 E.01605
G1 X149.946 Y146.868 E.01605
G1 X149.671 Y147.266 E.01605
G1 X149.309 Y147.587 E.01605
G1 X148.88 Y147.812 E.01605
G1 X148.411 Y147.928 E.01605
G1 X147.927 Y147.928 E.01605
G1 X147.457 Y147.812 E.01605
G1 X147.029 Y147.587 E.01605
G1 X146.682 Y147.28 E.01536
G1 X146.97 Y146.998 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X147.975 Y144.336 I1.199 J-1.068 E.10742
G1 X148.363 Y144.336 E.01194
G3 X147.011 Y147.042 I-.194 J1.594 E.18877
M204 S10000
; WIPE_START
G1 F24000
G1 X146.742 Y146.685 E-.16985
G1 X146.604 Y146.321 E-.14763
G1 X146.557 Y145.936 E-.14763
G1 X146.604 Y145.55 E-.14763
G1 X146.742 Y145.188 E-.14726
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.068 J-1.215 P1  F30000
G1 X115.923 Y146.901 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15088
G1 X115.671 Y147.266 E.01474
G1 X115.309 Y147.587 E.01605
G1 X114.88 Y147.812 E.01605
G1 X114.411 Y147.928 E.01605
G1 X113.927 Y147.928 E.01605
G1 X113.457 Y147.812 E.01605
G1 X113.029 Y147.587 E.01605
G1 X112.667 Y147.266 E.01605
G1 X112.392 Y146.868 E.01605
G1 X112.221 Y146.416 E.01605
G1 X112.162 Y145.936 E.01605
G1 X112.221 Y145.456 E.01605
G1 X112.392 Y145.003 E.01605
G1 X112.667 Y144.605 E.01605
G1 X113.029 Y144.284 E.01605
G1 X113.457 Y144.06 E.01605
G1 X113.927 Y143.944 E.01605
G1 X114.411 Y143.944 E.01605
G1 X114.88 Y144.06 E.01605
G1 X115.309 Y144.284 E.01605
G1 X115.671 Y144.605 E.01605
G1 X115.946 Y145.003 E.01605
G1 X116.117 Y145.456 E.01605
G1 X116.175 Y145.936 E.01605
G1 X116.117 Y146.416 E.01605
G1 X115.953 Y146.849 E.01536
G1 X115.588 Y146.681 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X113.975 Y144.336 I-1.419 J-.751 E.20251
G1 X114.363 Y144.336 E.01194
G3 X115.615 Y146.627 I-.194 J1.594 E.09368
M204 S10000
; WIPE_START
G1 F24000
G1 X115.375 Y147.004 E-.16991
G1 X115.084 Y147.262 E-.14763
G1 X114.74 Y147.443 E-.14763
G1 X114.363 Y147.536 E-.14763
G1 X113.976 Y147.536 E-.1472
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.027 J1.217 P1  F30000
G1 X150.567 Y148.334 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15088
G1 X111.771 Y148.334 E1.28693
G1 X111.771 Y143.538 E.15909
G1 X150.567 Y143.538 E1.28693
G1 X150.567 Y148.274 E.1571
G1 X150.959 Y148.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.379 Y148.726 E1.21618
G1 X111.379 Y143.146 E.17146
G1 X150.959 Y143.146 E1.21618
G1 X150.959 Y148.666 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.959 Y148.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.837 J.883 P1  F30000
G1 X149.845 Y147.829 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645606
G1 F10453.205
G1 X150.024 Y147.845 E.00881
G1 X149.955 Y147.255 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X150.068 Y147.128 E.00127
; LINE_WIDTH: 0.172379
G1 X150.18 Y147 E.00179
; LINE_WIDTH: 0.178249
G1 X150.363 Y146.767 E.00327
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.240633
G1 F15000
G1 X150.236 Y147.038 E.00315
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X150.306 Y146.654 E.00238
; LINE_WIDTH: 0.144824
G1 X150.341 Y146.462 E.00162
G1 X150.341 Y145.41 F30000
; LINE_WIDTH: 0.096919
G1 F15000
G1 X150.306 Y145.218 E.00086
; LINE_WIDTH: 0.144824
G1 X150.271 Y145.026 E.00162
; LINE_WIDTH: 0.192729
G1 X150.236 Y144.834 E.00238
G1 X150.18 Y144.871 F30000
; LINE_WIDTH: 0.172382
G1 F15000
G1 X150.068 Y144.744 E.00179
; LINE_WIDTH: 0.134652
G1 X149.955 Y144.617 E.00127
G1 X150.18 Y144.871 F30000
; LINE_WIDTH: 0.178252
G1 F15000
G1 X150.363 Y145.105 E.00327
G1 X149.843 Y144.043 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.646686
G1 F10434.506
G1 X150.024 Y144.027 E.00891
G1 X149.263 Y144.004 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969201
G1 F15000
G1 X149.123 Y143.907 E.00075
; LINE_WIDTH: 0.137971
G1 X148.969 Y143.806 E.00143
; LINE_WIDTH: 0.17135
G1 X148.802 Y143.785 E.00176
; LINE_WIDTH: 0.134135
G1 X148.635 Y143.765 E.00125
G1 X147.703 Y143.765 F30000
; LINE_WIDTH: 0.0969201
G1 F15000
G1 X147.536 Y143.785 E.00074
; LINE_WIDTH: 0.137457
G1 X147.355 Y143.811 E.00141
; LINE_WIDTH: 0.172382
G1 X147.215 Y143.907 E.00179
; LINE_WIDTH: 0.134651
G1 X147.075 Y144.004 E.00127
G1 X146.443 Y143.888 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15088
G1 X146.073 Y144.863 E.03461
G2 X145.88 Y146.5 I2.372 J1.109 E.05561
G1 X146.443 Y147.984 E.05264
G1 X115.894 Y147.985 E1.01335
G1 X116.458 Y146.5 E.0527
G2 X116.321 Y145.012 I-2.459 J-.525 E.05031
G1 X115.894 Y143.886 E.03995
G1 X146.383 Y143.888 E1.01136
G1 X143.252 Y144.295 F30000
G1 F15088
G1 X144.88 Y144.295 E.05401
G1 X145.585 Y145 E.0331
G2 X145.585 Y146.871 I2.055 J.935 E.06398
G1 X144.88 Y147.577 E.0331
G1 X140.486 Y147.577 E.14575
G1 X137.203 Y144.294 E.154
G1 X140.486 Y144.295 E.10889
G1 X137.203 Y147.577 E.154
G1 X132.811 Y147.577 E.14572
G1 X129.527 Y144.294 E.15403
G1 X132.811 Y144.294 E.10892
G1 X129.527 Y147.578 E.15403
G1 X125.135 Y147.578 E.14569
G1 X121.851 Y144.294 E.15407
G1 X125.135 Y144.294 E.10895
G1 X121.851 Y147.578 E.15407
G1 X117.459 Y147.578 E.14567
G1 X116.752 Y146.871 E.03317
G2 X116.752 Y145 I-2.374 J-.935 E.06354
G1 X117.459 Y144.293 E.03317
G1 X119.088 Y144.293 E.05401
G1 X115.263 Y144.004 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.09692
G1 F15000
G1 X115.123 Y143.907 E.00075
; LINE_WIDTH: 0.13797
G1 X114.968 Y143.806 E.00143
; LINE_WIDTH: 0.17135
G1 X114.802 Y143.785 E.00176
; LINE_WIDTH: 0.134135
G1 X114.635 Y143.765 E.00125
G1 X113.703 Y143.765 F30000
; LINE_WIDTH: 0.0969201
G1 F15000
G1 X113.536 Y143.785 E.00074
; LINE_WIDTH: 0.137457
G1 X113.355 Y143.811 E.00141
; LINE_WIDTH: 0.172379
G1 X113.215 Y143.907 E.00179
; LINE_WIDTH: 0.13465
G1 X113.075 Y144.004 E.00127
G1 X112.265 Y144.023 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60633
G1 F11181.911
G1 X112.43 Y144.037 E.00763
G1 X112.383 Y144.617 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969205
G1 F15000
G1 X112.27 Y144.744 E.00075
; LINE_WIDTH: 0.158637
G2 X111.975 Y145.105 I2.802 J2.596 E.0044
G1 X112.067 Y145.026 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X112.032 Y145.218 E.00238
; LINE_WIDTH: 0.144825
G1 X111.997 Y145.41 E.00162
G1 X112.067 Y145.026 F30000
; LINE_WIDTH: 0.240633
G1 F15000
G1 X112.102 Y144.834 E.00315
G1 X111.997 Y146.462 F30000
; LINE_WIDTH: 0.144825
G1 F15000
G1 X112.032 Y146.654 E.00162
; LINE_WIDTH: 0.19273
G1 X112.067 Y146.846 E.00238
; LINE_WIDTH: 0.240634
G1 X112.102 Y147.038 E.00315
G1 X112.27 Y147.128 F30000
; LINE_WIDTH: 0.158637
G1 F15000
G3 X111.975 Y146.767 I2.802 J-2.596 E.0044
G1 X112.27 Y147.128 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X112.383 Y147.255 E.00075
G1 X112.257 Y147.848 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608158
G1 F11145.747
G1 X112.431 Y147.833 E.00805
G1 X113.075 Y147.868 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134649
G1 F15000
G1 X113.215 Y147.964 E.00127
; LINE_WIDTH: 0.172378
G1 X113.355 Y148.061 E.00179
; LINE_WIDTH: 0.137458
G1 X113.536 Y148.086 E.00141
; LINE_WIDTH: 0.0969204
G1 X113.703 Y148.106 E.00074
G1 X114.635 Y148.106 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X114.802 Y148.086 E.00125
; LINE_WIDTH: 0.17135
G1 X114.968 Y148.066 E.00176
; LINE_WIDTH: 0.13797
G1 X115.123 Y147.964 E.00143
; LINE_WIDTH: 0.0969208
G1 X115.263 Y147.868 E.00075
G1 X147.075 Y147.868 F30000
; LINE_WIDTH: 0.13465
G1 F15000
G1 X147.215 Y147.964 E.00127
; LINE_WIDTH: 0.17238
G1 X147.355 Y148.061 E.00179
; LINE_WIDTH: 0.137458
G1 X147.536 Y148.086 E.00141
; LINE_WIDTH: 0.0969204
G1 X147.703 Y148.106 E.00074
G1 X148.635 Y148.106 F30000
; LINE_WIDTH: 0.134134
G1 F15000
G1 X148.802 Y148.086 E.00125
; LINE_WIDTH: 0.171348
G1 X148.969 Y148.066 E.00176
; LINE_WIDTH: 0.137972
G1 X149.123 Y147.964 E.00143
; LINE_WIDTH: 0.0969209
G1 X149.263 Y147.868 E.00075
; WIPE_START
G1 F24000
G1 X149.123 Y147.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.191 J-.252 P1  F30000
G1 X145.113 Y129.035 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15088
G1 X145.091 Y129.002 E.00133
G1 X144.906 Y128.516 E.01725
G1 X144.844 Y128 E.01725
G1 X144.906 Y127.484 E.01725
G1 X145.091 Y126.998 E.01725
G1 X145.386 Y126.57 E.01725
G1 X145.775 Y126.225 E.01725
G1 X146.235 Y125.984 E.01724
G1 X146.74 Y125.859 E.01725
G1 X147.26 Y125.859 E.01725
G1 X147.765 Y125.984 E.01725
G1 X148.225 Y126.225 E.01724
G1 X148.614 Y126.57 E.01725
G1 X148.909 Y126.998 E.01725
G1 X149.094 Y127.484 E.01725
G1 X149.157 Y128 E.01725
G1 X149.094 Y128.516 E.01725
G1 X148.909 Y129.002 E.01725
G1 X148.614 Y129.43 E.01725
G1 X148.225 Y129.775 E.01725
G1 X147.765 Y130.016 E.01724
G1 X147.26 Y130.141 E.01725
G1 X146.74 Y130.141 E.01725
G1 X146.235 Y130.016 E.01725
G1 X145.775 Y129.775 E.01724
G1 X145.386 Y129.43 E.01725
G1 X145.147 Y129.084 E.01393
G1 X145.44 Y128.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.29 Y128.422 E.01305
G1 X145.238 Y128 E.01305
G1 X145.29 Y127.578 E.01305
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.474 Y128.868 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.29 Y128.422 E-.18359
G1 X145.238 Y128 E-.16137
G1 X145.29 Y127.578 E-.16137
G1 X145.44 Y127.181 E-.16137
G1 X145.578 Y126.981 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.015 J-1.217 P1  F30000
G1 X114.637 Y126.603 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15088
G1 X114.909 Y126.998 E.01592
G1 X115.094 Y127.484 E.01725
G1 X115.157 Y128 E.01725
G1 X115.094 Y128.516 E.01725
G1 X114.909 Y129.002 E.01725
G1 X114.614 Y129.43 E.01725
G1 X114.225 Y129.775 E.01725
G1 X113.765 Y130.016 E.01725
G1 X113.26 Y130.141 E.01725
G1 X112.74 Y130.141 E.01725
G1 X112.235 Y130.016 E.01725
G1 X111.775 Y129.775 E.01724
G1 X111.386 Y129.43 E.01725
G1 X111.091 Y129.002 E.01725
G1 X110.906 Y128.516 E.01725
G1 X110.844 Y128 E.01725
G1 X110.906 Y127.484 E.01725
G1 X111.091 Y126.998 E.01725
G1 X111.386 Y126.57 E.01725
G1 X111.775 Y126.225 E.01725
G1 X112.235 Y125.984 E.01724
G1 X112.74 Y125.859 E.01725
G1 X113.26 Y125.859 E.01725
G1 X113.765 Y125.984 E.01725
G1 X114.225 Y126.225 E.01725
G1 X114.599 Y126.557 E.01658
G1 X114.301 Y126.816 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.319 Y126.832 E.00074
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.56 Y128.819 E.01305
G1 X114.319 Y129.168 E.01305
G1 X114.001 Y129.45 E.01305
G1 X113.625 Y129.647 E.01305
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.238 Y128 E.01305
G1 X111.29 Y127.578 E.01305
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.256 Y126.776 E.01047
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.03194
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.633 Y128.625 E-.08257
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.062 J1.215 P1  F30000
G1 X149.398 Y130.398 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15088
G1 X110.602 Y130.398 E1.28693
G1 X110.602 Y125.602 E.15909
G1 X149.398 Y125.602 E1.28693
G1 X149.398 Y130.338 E.1571
G1 X149.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.666 J1.018 P1  F30000
G1 X149.194 Y129.814 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X147.978 Y130.194 E.0298
G1 X148.772 Y130.194 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X149.194 Y129.084 E.04968
G1 X149.194 Y126.916 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X148.772 Y125.806 E.04532
G1 X149.194 Y126.186 F30000
; LINE_WIDTH: 0.329879
M73 P72 R3
G1 F15000
G1 X147.978 Y125.806 E.0298
G1 X146.022 Y125.806 F30000
; LINE_WIDTH: 0.130745
G1 F15000
G1 X145.821 Y125.945 E.00175
; WIPE_START
G1 F24000
G1 X146.022 Y125.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.217 J0 P1  F30000
G1 X146.022 Y130.194 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.130746
G1 F15000
G1 X145.821 Y130.055 E.00175
G1 X144.931 Y130.05 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15088
G1 X143.302 Y130.05 E.05401
G1 X144.617 Y128.735 E.06167
G3 X144.617 Y127.265 I1.735 J-.735 E.0501
G1 X143.302 Y125.95 E.06167
G1 X139.726 Y125.95 E.11864
G1 X135.626 Y130.05 E.19231
G1 X132.05 Y130.05 E.11864
G1 X127.95 Y125.95 E.19231
G1 X124.374 Y125.95 E.11864
G1 X120.274 Y130.05 E.19231
G1 X116.698 Y130.05 E.11864
G1 X115.383 Y128.735 E.06167
G2 X115.383 Y127.265 I-1.735 J-.735 E.0501
G1 X116.698 Y125.95 E.06167
G1 X120.274 Y125.95 E.11864
G1 X124.374 Y130.05 E.19231
G1 X127.95 Y130.05 E.11864
G1 X132.05 Y125.95 E.19231
G1 X135.626 Y125.95 E.11864
G1 X139.726 Y130.05 E.19231
G1 X138.097 Y130.05 E.05401
G1 X114.179 Y130.055 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X113.978 Y130.194 E.00108
G1 X112.022 Y130.194 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X110.806 Y129.814 E.02764
G1 X111.228 Y130.194 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X110.806 Y129.084 E.04968
G1 X110.806 Y126.916 F30000
; LINE_WIDTH: 0.556113
G1 F12276.09
G1 X111.228 Y125.806 E.04968
G1 X110.806 Y126.186 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X112.022 Y125.806 E.02764
G1 X113.978 Y125.806 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X114.179 Y125.945 E.00108
; WIPE_START
G1 F24000
G1 X113.978 Y125.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.46 J1.127 P1  F30000
G1 X145.386 Y112.998 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15088
G1 X145.364 Y112.965 E.00133
G1 X145.179 Y112.479 E.01725
G1 X145.117 Y111.963 E.01725
G1 X145.179 Y111.447 E.01725
G1 X145.364 Y110.96 E.01725
G1 X145.659 Y110.533 E.01725
G1 X146.048 Y110.188 E.01725
G1 X146.508 Y109.946 E.01724
G1 X147.013 Y109.822 E.01725
G1 X147.533 Y109.822 E.01725
G1 X148.038 Y109.946 E.01725
G1 X148.498 Y110.188 E.01724
G1 X148.887 Y110.533 E.01725
G1 X149.183 Y110.96 E.01725
G1 X149.367 Y111.447 E.01725
G1 X149.43 Y111.963 E.01725
G1 X149.367 Y112.479 E.01725
G1 X149.183 Y112.965 E.01725
G1 X148.887 Y113.393 E.01725
G1 X148.498 Y113.737 E.01725
G1 X148.038 Y113.979 E.01724
G1 X147.533 Y114.103 E.01725
G1 X147.013 Y114.103 E.01725
G1 X146.508 Y113.979 E.01725
G1 X146.048 Y113.737 E.01724
G1 X145.659 Y113.393 E.01725
G1 X145.42 Y113.047 E.01393
G1 X145.713 Y112.781 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.563 Y112.384 E.01305
G1 X145.512 Y111.963 E.01305
G1 X145.563 Y111.541 E.01305
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.747 Y112.831 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.563 Y112.384 E-.18359
G1 X145.512 Y111.963 E-.16137
G1 X145.563 Y111.541 E-.16137
G1 X145.713 Y111.144 E-.16137
G1 X145.851 Y110.944 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.015 J-1.217 P1  F30000
G1 X114.91 Y110.565 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15088
G1 X115.183 Y110.96 E.01592
G1 X115.367 Y111.447 E.01725
G1 X115.43 Y111.963 E.01725
G1 X115.367 Y112.479 E.01725
G1 X115.183 Y112.965 E.01725
G1 X114.887 Y113.393 E.01725
G1 X114.498 Y113.737 E.01725
G1 X114.038 Y113.979 E.01725
G1 X113.533 Y114.103 E.01725
G1 X113.013 Y114.103 E.01725
G1 X112.508 Y113.979 E.01725
G1 X112.048 Y113.737 E.01724
G1 X111.659 Y113.393 E.01725
G1 X111.364 Y112.965 E.01725
G1 X111.179 Y112.479 E.01725
G1 X111.117 Y111.963 E.01725
G1 X111.179 Y111.447 E.01725
G1 X111.364 Y110.96 E.01725
G1 X111.659 Y110.533 E.01725
G1 X112.048 Y110.188 E.01725
G1 X112.508 Y109.946 E.01724
G1 X113.013 Y109.822 E.01725
G1 X113.533 Y109.822 E.01725
G1 X114.038 Y109.946 E.01725
G1 X114.498 Y110.188 E.01725
G1 X114.872 Y110.519 E.01658
G1 X114.574 Y110.779 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.592 Y110.795 E.00074
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.833 Y112.781 E.01305
G1 X114.592 Y113.131 E.01305
G1 X114.274 Y113.412 E.01305
G1 X113.898 Y113.61 E.01305
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.512 Y111.963 E.01305
G1 X111.563 Y111.541 E.01305
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.529 Y110.739 E.01047
M204 S10000
; WIPE_START
G1 F24000
G1 X114.592 Y110.795 E-.03194
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.906 Y112.587 E-.08257
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.062 J1.215 P1  F30000
G1 X149.671 Y114.361 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15088
G1 X110.875 Y114.361 E1.28693
G1 X110.875 Y109.565 E.15909
G1 X149.671 Y109.565 E1.28693
G1 X149.671 Y114.301 E.1571
G1 X150.063 Y114.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.666 J1.018 P1  F30000
G1 X149.467 Y113.776 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X148.251 Y114.157 E.0298
G1 X149.045 Y114.157 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X149.467 Y113.047 E.04968
G1 X149.467 Y110.878 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X149.045 Y109.768 E.04532
G1 X149.467 Y110.149 F30000
; LINE_WIDTH: 0.329879
G1 F15000
G1 X148.251 Y109.768 E.0298
G1 X146.295 Y109.768 F30000
; LINE_WIDTH: 0.130745
G1 F15000
G1 X146.094 Y109.907 E.00175
; WIPE_START
G1 F24000
G1 X146.295 Y109.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.217 J0 P1  F30000
G1 X146.295 Y114.157 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.130746
G1 F15000
G1 X146.094 Y114.018 E.00175
G1 X145.204 Y114.012 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15088
G1 X143.575 Y114.012 E.05401
G1 X144.89 Y112.698 E.06167
G3 X144.89 Y111.227 I1.735 J-.735 E.0501
G1 X143.575 Y109.913 E.06167
G1 X139.999 Y109.913 E.11864
G1 X135.899 Y114.012 E.19231
G1 X132.323 Y114.012 E.11864
G1 X128.223 Y109.913 E.19231
G1 X124.647 Y109.913 E.11864
G1 X120.547 Y114.012 E.19231
G1 X116.971 Y114.012 E.11864
G1 X115.656 Y112.698 E.06167
G2 X115.656 Y111.227 I-1.735 J-.735 E.0501
G1 X116.971 Y109.913 E.06167
G1 X120.547 Y109.913 E.11864
G1 X124.647 Y114.012 E.19231
G1 X128.223 Y114.012 E.11864
G1 X132.323 Y109.913 E.19231
G1 X135.899 Y109.913 E.11864
G1 X139.999 Y114.012 E.19231
G1 X138.37 Y114.012 E.05401
G1 X114.452 Y114.018 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X114.251 Y114.157 E.00108
G1 X112.295 Y114.157 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X111.079 Y113.776 E.02764
G1 X111.501 Y114.157 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X111.079 Y113.047 E.04968
G1 X111.079 Y110.878 F30000
; LINE_WIDTH: 0.556113
G1 F12276.09
G1 X111.501 Y109.768 E.04968
G1 X111.079 Y110.149 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X112.295 Y109.768 E.02764
G1 X114.251 Y109.768 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X114.452 Y109.907 E.00108
M106 S234.6
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.251 Y109.768 E-.76
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
G3 Z1.6 I-1.042 J.629 P1  F30000
G1 X146.004 Y162.405 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.975 Y162.379 E.0013
G1 X145.7 Y161.981 E.01605
G1 X145.528 Y161.529 E.01605
G1 X145.47 Y161.048 E.01605
G1 X145.528 Y160.568 E.01605
G1 X145.7 Y160.116 E.01605
G1 X145.975 Y159.718 E.01605
G1 X146.337 Y159.397 E.01605
G1 X146.617 Y159.25 E.01051
G1 X146.765 Y159.172 E.00554
G1 X147.235 Y159.057 E.01605
G1 X147.718 Y159.057 E.01605
G1 X148.188 Y159.172 E.01605
G1 X148.616 Y159.397 E.01605
G1 X148.854 Y159.607 E.01051
G1 X148.979 Y159.718 E.00553
G1 X149.253 Y160.116 E.01605
G1 X149.425 Y160.568 E.01605
G1 X149.483 Y161.048 E.01605
G1 X149.425 Y161.529 E.01605
G1 X149.253 Y161.981 E.01605
G1 X148.979 Y162.379 E.01605
G1 X148.616 Y162.7 E.01605
G1 X148.336 Y162.847 E.01051
G1 X148.188 Y162.925 E.00553
G1 X147.718 Y163.04 E.01605
G1 X147.235 Y163.04 E.01605
G1 X146.765 Y162.925 E.01605
G1 X146.337 Y162.7 E.01605
G1 X146.049 Y162.445 E.01275
G1 X146.271 Y162.117 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.278 Y162.11 E.00031
G3 X146.561 Y159.722 I1.2 J-1.069 E.0835
G1 X146.905 Y159.542 E.01194
G1 X147.282 Y159.449 E.01194
G3 X148.392 Y159.722 I.146 J1.797 E.03574
G1 X148.683 Y159.98 E.01194
G3 X146.567 Y162.366 I-1.205 J1.062 E.14292
G1 X146.317 Y162.156 E.01004
M204 S10000
; WIPE_START
G1 F24000
G1 X146.278 Y162.11 E-.02272
G1 X146.05 Y161.797 E-.1472
G1 X145.912 Y161.434 E-.14763
G1 X145.865 Y161.048 E-.14763
G1 X145.912 Y160.663 E-.14763
G1 X146.049 Y160.301 E-.14719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.068 J-1.215 P1  F30000
M73 P73 R3
G1 X115.231 Y162.013 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.979 Y162.379 E.01474
G1 X114.616 Y162.7 E.01605
G1 X114.336 Y162.847 E.01051
G1 X114.188 Y162.925 E.00553
G1 X113.718 Y163.04 E.01605
G1 X113.235 Y163.04 E.01605
G1 X112.765 Y162.925 E.01605
G1 X112.337 Y162.7 E.01605
G1 X111.975 Y162.379 E.01605
G1 X111.7 Y161.981 E.01605
G1 X111.528 Y161.529 E.01605
G1 X111.47 Y161.048 E.01605
G1 X111.528 Y160.568 E.01605
G1 X111.7 Y160.116 E.01605
G1 X111.975 Y159.718 E.01605
G1 X112.337 Y159.397 E.01605
G1 X112.617 Y159.25 E.01051
G1 X112.765 Y159.172 E.00553
G1 X113.235 Y159.057 E.01605
G1 X113.718 Y159.057 E.01605
G1 X114.188 Y159.172 E.01605
G1 X114.616 Y159.397 E.01605
G1 X114.979 Y159.718 E.01605
G1 X115.253 Y160.116 E.01605
G1 X115.425 Y160.568 E.01605
G1 X115.483 Y161.048 E.01605
G1 X115.425 Y161.529 E.01605
G1 X115.261 Y161.962 E.01536
G1 X114.903 Y161.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.676 Y162.111 E.01189
G3 X112.561 Y159.722 I-1.201 J-1.067 E.16691
G1 X112.905 Y159.542 E.01194
G1 X113.282 Y159.449 E.01194
G3 X114.919 Y161.748 I.192 J1.595 E.10586
M204 S10000
; WIPE_START
G1 F24000
G1 X114.676 Y162.111 E-.16609
G1 X114.392 Y162.375 E-.14725
G1 X114.048 Y162.555 E-.14763
G1 X113.671 Y162.648 E-.14763
G1 X113.282 Y162.648 E-.14763
G1 X113.273 Y162.646 E-.00377
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.027 J1.217 P1  F30000
G1 X149.875 Y163.446 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.079 Y163.446 E1.28693
G1 X111.079 Y158.651 E.15909
G1 X149.875 Y158.651 E1.28693
G1 X149.875 Y163.386 E.1571
G1 X150.267 Y163.838 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.687 Y163.838 E1.21618
G1 X110.687 Y158.258 E.17146
G1 X150.267 Y158.258 E1.21618
G1 X150.267 Y163.778 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.267 Y163.782 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.837 J.883 P1  F30000
G1 X149.153 Y162.942 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645604
G1 F10453.239
G1 X149.332 Y162.958 E.00881
G1 X149.263 Y162.368 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X149.375 Y162.24 E.00127
; LINE_WIDTH: 0.172379
G1 X149.488 Y162.113 E.00179
; LINE_WIDTH: 0.178249
G1 X149.671 Y161.879 E.00327
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X149.614 Y161.766 E.00238
; LINE_WIDTH: 0.144824
G1 X149.649 Y161.574 E.00162
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.240633
G1 F15000
G1 X149.543 Y162.151 E.00315
G1 X148.571 Y162.98 F30000
; LINE_WIDTH: 0.096921
G1 F15000
G1 X148.431 Y163.077 E.00075
; LINE_WIDTH: 0.137973
G1 X148.276 Y163.179 E.00143
; LINE_WIDTH: 0.17135
G1 X148.11 Y163.199 E.00176
; LINE_WIDTH: 0.134135
G1 X147.943 Y163.219 E.00125
G1 X147.01 Y163.219 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X146.844 Y163.199 E.00074
; LINE_WIDTH: 0.137457
G1 X146.662 Y163.174 E.00141
; LINE_WIDTH: 0.172377
G1 X146.522 Y163.077 E.00179
; LINE_WIDTH: 0.134648
G1 X146.383 Y162.98 E.00127
G1 X146.056 Y162.849 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X145.992 Y162.886 E.00204
G1 X146.056 Y162.923 E.00204
G1 X146.077 Y162.886 E.00118
G1 X146.094 Y163.135 E.00692
G1 X146.03 Y163.172 E.00204
G1 X146.079 Y163.2 E.00155
G1 X145.368 Y163.278 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.401278
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X145.368 Y162.15 E.05813
G1 X145.167 Y161.618 E.0293
G1 X145.098 Y161.048 E.02955
G1 X145.167 Y160.479 E.02955
G1 X145.368 Y159.947 E.0293
G1 X145.368 Y159.022 E.04769
G1 X144.917 Y159.022 E.02325
G1 X144.917 Y163.075 E.20885
G1 X144.466 Y163.075 E.02325
G1 X144.466 Y159.022 E.20885
G1 X144.015 Y159.022 E.02325
G1 X144.015 Y163.075 E.20886
G1 X143.563 Y163.075 E.02325
G1 X143.563 Y159.022 E.20886
G1 X143.112 Y159.022 E.02325
G1 X143.112 Y163.075 E.20886
G1 X142.661 Y163.075 E.02325
G1 X142.661 Y159.022 E.20886
G1 X142.21 Y159.022 E.02325
G1 X142.21 Y163.075 E.20887
G1 X141.758 Y163.075 E.02325
G1 X141.758 Y159.022 E.20887
G1 X141.307 Y159.022 E.02325
G1 X141.307 Y163.075 E.20887
G1 X140.856 Y163.075 E.02325
G1 X140.856 Y159.022 E.20887
G1 X140.404 Y159.022 E.02325
G1 X140.404 Y163.075 E.20888
G1 X139.953 Y163.075 E.02325
G1 X139.953 Y159.022 E.20888
G1 X139.502 Y159.022 E.02325
G1 X139.502 Y163.075 E.20888
G1 X139.051 Y163.075 E.02325
G1 X139.051 Y159.022 E.20888
G1 X138.599 Y159.022 E.02325
G1 X138.599 Y163.075 E.20889
G1 X138.148 Y163.075 E.02325
G1 X138.148 Y159.022 E.20889
G1 X137.697 Y159.022 E.02325
G1 X137.697 Y163.075 E.20889
G1 X137.245 Y163.075 E.02325
G1 X137.245 Y159.021 E.20889
G1 X136.794 Y159.021 E.02325
G1 X136.794 Y163.076 E.2089
G1 X136.343 Y163.076 E.02325
G1 X136.343 Y159.021 E.2089
G1 X135.892 Y159.021 E.02325
G1 X135.892 Y163.076 E.2089
G1 X135.44 Y163.076 E.02325
G1 X135.44 Y159.021 E.2089
G1 X134.989 Y159.021 E.02325
G1 X134.989 Y163.076 E.20891
G1 X134.538 Y163.076 E.02325
G1 X134.538 Y159.021 E.20891
G1 X134.087 Y159.021 E.02325
G1 X134.087 Y163.076 E.20891
G1 X133.635 Y163.076 E.02325
G1 X133.635 Y159.021 E.20891
G1 X133.184 Y159.021 E.02325
G1 X133.184 Y163.076 E.20892
G1 X132.733 Y163.076 E.02325
G1 X132.733 Y159.021 E.20892
G1 X132.281 Y159.021 E.02325
G1 X132.281 Y163.076 E.20892
G1 X131.83 Y163.076 E.02325
G1 X131.83 Y159.021 E.20892
G1 X131.379 Y159.021 E.02325
G1 X131.379 Y163.076 E.20893
G1 X130.928 Y163.076 E.02325
G1 X130.928 Y159.021 E.20893
G1 X130.476 Y159.021 E.02325
G1 X130.476 Y163.076 E.20893
G1 X130.025 Y163.076 E.02325
G1 X130.025 Y159.021 E.20893
G1 X129.574 Y159.021 E.02325
G1 X129.574 Y163.076 E.20894
G1 X129.122 Y163.076 E.02325
G1 X129.122 Y159.021 E.20894
G1 X128.671 Y159.021 E.02325
G1 X128.671 Y163.076 E.20894
G1 X128.22 Y163.076 E.02325
G1 X128.22 Y159.021 E.20894
G1 X127.769 Y159.021 E.02325
G1 X127.769 Y163.076 E.20895
G1 X127.317 Y163.076 E.02325
G1 X127.317 Y159.021 E.20895
G1 X126.866 Y159.021 E.02325
G1 X126.866 Y163.076 E.20895
G1 X126.415 Y163.076 E.02325
G1 X126.415 Y159.021 E.20895
G1 X125.964 Y159.021 E.02325
G1 X125.964 Y163.076 E.20896
G1 X125.512 Y163.076 E.02325
G1 X125.512 Y159.021 E.20896
G1 X125.061 Y159.021 E.02325
G1 X125.061 Y163.076 E.20896
G1 X124.61 Y163.076 E.02325
G1 X124.61 Y159.021 E.20896
G1 X124.158 Y159.021 E.02325
G1 X124.158 Y163.076 E.20897
G1 X123.707 Y163.076 E.02325
G1 X123.707 Y159.021 E.20897
G1 X123.256 Y159.021 E.02325
G1 X123.256 Y163.076 E.20897
G1 X122.805 Y163.076 E.02325
G1 X122.805 Y159.021 E.20897
G1 X122.353 Y159.021 E.02325
G1 X122.353 Y163.076 E.20897
G1 X121.902 Y163.076 E.02325
G1 X121.902 Y159.021 E.20898
G1 X121.451 Y159.021 E.02325
G1 X121.451 Y163.076 E.20898
G1 X120.999 Y163.076 E.02325
G1 X120.999 Y159.021 E.20898
G1 X120.548 Y159.021 E.02325
G1 X120.548 Y163.076 E.20898
G1 X120.097 Y163.076 E.02325
G1 X120.097 Y159.021 E.20899
G1 X119.646 Y159.021 E.02325
G1 X119.646 Y163.076 E.20899
G1 X119.194 Y163.076 E.02325
G1 X119.194 Y159.021 E.20899
G1 X118.743 Y159.021 E.02325
G1 X118.743 Y163.076 E.20899
G1 X118.292 Y163.076 E.02325
G1 X118.292 Y159.02 E.209
G1 X117.841 Y159.02 E.02325
G1 X117.841 Y163.077 E.209
G1 X117.389 Y163.077 E.02325
G1 X117.389 Y159.02 E.209
G1 X116.938 Y159.02 E.02325
G1 X116.938 Y163.077 E.209
G1 X116.487 Y163.077 E.02325
G1 X116.487 Y159.02 E.20901
G1 X116.035 Y159.02 E.02325
G1 X116.035 Y163.077 E.20901
G1 X115.584 Y163.077 E.02325
G1 X115.584 Y162.151 E.04768
G1 X115.786 Y161.618 E.0294
G1 X115.856 Y161.048 E.02955
G1 X115.786 Y160.479 E.02955
G1 X115.584 Y159.946 E.0294
G1 X115.584 Y158.818 E.05811
M106 S234.6
G1 X114.918 Y159.214 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X114.914 Y158.977 E.00657
G1 X114.571 Y159.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969198
G1 F15000
G1 X114.431 Y159.02 E.00075
; LINE_WIDTH: 0.137969
G1 X114.276 Y158.918 E.00143
; LINE_WIDTH: 0.171348
G1 X114.11 Y158.898 E.00176
; LINE_WIDTH: 0.134134
G1 X113.943 Y158.878 E.00125
M73 P74 R3
G1 X113.01 Y158.878 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X112.844 Y158.898 E.00074
; LINE_WIDTH: 0.137457
G1 X112.662 Y158.923 E.00141
; LINE_WIDTH: 0.172382
G1 X112.522 Y159.02 E.00179
; LINE_WIDTH: 0.134651
G1 X112.383 Y159.117 E.00127
G1 X111.572 Y159.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60633
G1 F11181.911
G1 X111.739 Y159.15 E.00769
G1 X111.691 Y159.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969206
G1 F15000
G1 X111.578 Y159.857 E.00075
; LINE_WIDTH: 0.158637
G2 X111.282 Y160.218 I2.805 J2.598 E.0044
G1 X111.375 Y160.138 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X111.34 Y160.331 E.00238
; LINE_WIDTH: 0.144825
G1 X111.304 Y160.523 E.00162
G1 X111.375 Y160.138 F30000
; LINE_WIDTH: 0.240634
G1 F15000
G1 X111.41 Y159.946 E.00315
G1 X111.304 Y161.574 F30000
; LINE_WIDTH: 0.144824
G1 F15000
G1 X111.34 Y161.766 E.00162
; LINE_WIDTH: 0.192728
G1 X111.375 Y161.959 E.00238
; LINE_WIDTH: 0.240632
G1 X111.41 Y162.151 E.00315
G1 X111.578 Y162.24 F30000
; LINE_WIDTH: 0.158637
G1 F15000
G3 X111.282 Y161.879 I2.802 J-2.596 E.0044
G1 X111.578 Y162.24 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X111.691 Y162.368 E.00075
G1 X111.565 Y162.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608158
G1 F11145.747
G1 X111.739 Y162.946 E.00805
G1 X112.383 Y162.98 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134649
G1 F15000
G1 X112.522 Y163.077 E.00127
; LINE_WIDTH: 0.172378
G1 X112.662 Y163.174 E.00179
; LINE_WIDTH: 0.137458
G1 X112.844 Y163.199 E.00141
; LINE_WIDTH: 0.0969204
G1 X113.01 Y163.219 E.00074
G1 X113.943 Y163.219 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X114.11 Y163.199 E.00125
; LINE_WIDTH: 0.17135
G1 X114.276 Y163.179 E.00176
; LINE_WIDTH: 0.137972
G1 X114.431 Y163.077 E.00143
; LINE_WIDTH: 0.0969195
G1 X114.571 Y162.98 E.00075
G1 X114.876 Y163.167 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X114.934 Y163.036 E.00399
G1 X114.922 Y162.945 E.00253
G1 X146.094 Y158.888 F30000
G1 F15000
G1 X146.03 Y158.925 E.00204
G1 X146.094 Y158.962 E.00204
G1 X146.056 Y159.174 E.00598
G1 X145.992 Y159.211 E.00204
G1 X146.041 Y159.239 E.00155
G1 X146.383 Y159.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134651
G1 F15000
G1 X146.522 Y159.02 E.00127
; LINE_WIDTH: 0.172382
G1 X146.662 Y158.923 E.00179
; LINE_WIDTH: 0.137456
G1 X146.844 Y158.898 E.00141
; LINE_WIDTH: 0.0969201
G1 X147.01 Y158.878 E.00074
G1 X147.943 Y158.878 F30000
; LINE_WIDTH: 0.134134
G1 F15000
G1 X148.11 Y158.898 E.00125
; LINE_WIDTH: 0.171348
G1 X148.276 Y158.918 E.00176
; LINE_WIDTH: 0.137971
G1 X148.431 Y159.02 E.00143
; LINE_WIDTH: 0.09692
G1 X148.571 Y159.117 E.00075
G1 X149.151 Y159.156 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.646694
G1 F10434.368
G1 X149.332 Y159.139 E.00891
G1 X149.263 Y159.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X149.375 Y159.857 E.00127
; LINE_WIDTH: 0.172379
G1 X149.488 Y159.984 E.00179
; LINE_WIDTH: 0.178248
G1 X149.671 Y160.218 E.00327
G1 X149.578 Y160.138 F30000
; LINE_WIDTH: 0.19273
G1 F15000
G1 X149.543 Y159.946 E.00238
G1 X149.578 Y160.138 F30000
; LINE_WIDTH: 0.144825
G1 F15000
G1 X149.614 Y160.331 E.00162
; LINE_WIDTH: 0.09692
G1 X149.649 Y160.523 E.00086
; WIPE_START
G1 F24000
G1 X149.614 Y160.331 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.188 J-.266 P1  F30000
G1 X146.696 Y147.292 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.667 Y147.266 E.0013
G1 X146.392 Y146.868 E.01605
G1 X146.221 Y146.416 E.01605
G1 X146.162 Y145.936 E.01605
G1 X146.221 Y145.456 E.01605
G1 X146.392 Y145.003 E.01605
G1 X146.667 Y144.605 E.01605
G1 X147.029 Y144.284 E.01605
G1 X147.31 Y144.137 E.01051
G1 X147.457 Y144.06 E.00554
G1 X147.927 Y143.944 E.01605
G1 X148.411 Y143.944 E.01605
G1 X148.88 Y144.06 E.01605
G1 X149.309 Y144.284 E.01605
G1 X149.546 Y144.495 E.01051
G1 X149.671 Y144.605 E.00553
G1 X149.946 Y145.003 E.01605
G1 X150.117 Y145.456 E.01605
G1 X150.175 Y145.936 E.01605
G1 X150.117 Y146.416 E.01605
G1 X149.946 Y146.868 E.01605
G1 X149.671 Y147.266 E.01605
G1 X149.309 Y147.587 E.01605
G1 X149.028 Y147.734 E.01051
G1 X148.88 Y147.812 E.00553
G1 X148.411 Y147.928 E.01605
G1 X147.927 Y147.928 E.01605
G1 X147.457 Y147.812 E.01605
G1 X147.029 Y147.587 E.01605
G1 X146.741 Y147.332 E.01275
G1 X146.963 Y147.005 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.97 Y146.998 E.00031
G3 X147.253 Y144.61 I1.2 J-1.069 E.0835
G1 X147.597 Y144.429 E.01194
G1 X147.975 Y144.336 E.01194
G3 X149.084 Y144.61 I.146 J1.797 E.03574
G1 X149.375 Y144.867 E.01194
G3 X147.26 Y147.253 I-1.205 J1.062 E.14292
G1 X147.009 Y147.043 E.01004
M204 S10000
; WIPE_START
G1 F24000
G1 X146.97 Y146.998 E-.02272
G1 X146.742 Y146.685 E-.1472
G1 X146.604 Y146.321 E-.14763
G1 X146.557 Y145.936 E-.14763
G1 X146.604 Y145.55 E-.14763
G1 X146.742 Y145.188 E-.14719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.068 J-1.215 P1  F30000
G1 X115.923 Y146.901 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.671 Y147.266 E.01474
G1 X115.309 Y147.587 E.01605
G1 X115.028 Y147.734 E.01051
G1 X114.88 Y147.812 E.00553
G1 X114.411 Y147.928 E.01605
G1 X113.927 Y147.928 E.01605
G1 X113.457 Y147.812 E.01605
G1 X113.029 Y147.587 E.01605
G1 X112.667 Y147.266 E.01605
G1 X112.392 Y146.868 E.01605
G1 X112.221 Y146.416 E.01605
G1 X112.162 Y145.936 E.01605
G1 X112.221 Y145.456 E.01605
G1 X112.392 Y145.003 E.01605
G1 X112.667 Y144.605 E.01605
G1 X113.029 Y144.284 E.01605
G1 X113.31 Y144.137 E.01051
G1 X113.457 Y144.06 E.00553
G1 X113.927 Y143.944 E.01605
G1 X114.411 Y143.944 E.01605
G1 X114.88 Y144.06 E.01605
G1 X115.309 Y144.284 E.01605
G1 X115.671 Y144.605 E.01605
G1 X115.946 Y145.003 E.01605
G1 X116.117 Y145.456 E.01605
G1 X116.175 Y145.936 E.01605
G1 X116.117 Y146.416 E.01605
G1 X115.953 Y146.849 E.01536
G1 X115.596 Y146.685 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.368 Y146.998 E.01189
G3 X113.253 Y144.61 I-1.201 J-1.067 E.16691
G1 X113.597 Y144.429 E.01194
G1 X113.975 Y144.336 E.01194
G3 X115.611 Y146.635 I.192 J1.595 E.10586
M204 S10000
; WIPE_START
G1 F24000
G1 X115.368 Y146.998 E-.16609
G1 X115.084 Y147.262 E-.14725
G1 X114.74 Y147.443 E-.14763
G1 X114.363 Y147.536 E-.14763
G1 X113.975 Y147.536 E-.14763
G1 X113.965 Y147.533 E-.00377
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.027 J1.217 P1  F30000
G1 X150.567 Y148.334 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.771 Y148.334 E1.28693
G1 X111.771 Y143.538 E.15909
G1 X150.567 Y143.538 E1.28693
G1 X150.567 Y148.274 E.1571
G1 X150.959 Y148.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.379 Y148.726 E1.21618
G1 X111.379 Y143.146 E.17146
G1 X150.959 Y143.146 E1.21618
G1 X150.959 Y148.666 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.959 Y148.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.837 J.883 P1  F30000
G1 X149.845 Y147.829 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645604
G1 F10453.239
G1 X150.024 Y147.845 E.00881
G1 X149.955 Y147.255 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X150.068 Y147.128 E.00127
; LINE_WIDTH: 0.172379
G1 X150.18 Y147 E.00179
; LINE_WIDTH: 0.178249
G1 X150.363 Y146.767 E.00327
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.240633
G1 F15000
G1 X150.236 Y147.038 E.00315
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X150.306 Y146.654 E.00238
; LINE_WIDTH: 0.144824
G1 X150.341 Y146.462 E.00162
G1 X150.341 Y145.41 F30000
; LINE_WIDTH: 0.09692
G1 F15000
G1 X150.306 Y145.218 E.00086
; LINE_WIDTH: 0.144825
G1 X150.271 Y145.026 E.00162
; LINE_WIDTH: 0.19273
G1 X150.236 Y144.834 E.00238
G1 X150.18 Y144.871 F30000
; LINE_WIDTH: 0.178248
G1 F15000
G1 X150.363 Y145.105 E.00327
G1 X150.18 Y144.871 F30000
; LINE_WIDTH: 0.172379
G1 F15000
G1 X150.068 Y144.744 E.00179
; LINE_WIDTH: 0.13465
G1 X149.955 Y144.617 E.00127
G1 X149.843 Y144.043 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.646694
G1 F10434.368
G1 X150.024 Y144.027 E.00891
G1 X149.263 Y144.004 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.09692
G1 F15000
G1 X149.123 Y143.907 E.00075
; LINE_WIDTH: 0.137971
G1 X148.968 Y143.806 E.00143
; LINE_WIDTH: 0.171348
G1 X148.802 Y143.785 E.00176
; LINE_WIDTH: 0.134134
G1 X148.635 Y143.765 E.00125
G1 X147.703 Y143.765 F30000
; LINE_WIDTH: 0.0969201
G1 F15000
G1 X147.536 Y143.785 E.00074
; LINE_WIDTH: 0.137456
G1 X147.355 Y143.811 E.00141
; LINE_WIDTH: 0.172382
G1 X147.215 Y143.907 E.00179
; LINE_WIDTH: 0.134651
G1 X147.075 Y144.004 E.00127
G1 X146.786 Y143.775 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X146.722 Y143.812 E.00204
G1 X146.786 Y143.849 E.00204
G1 X146.748 Y144.061 E.00598
G1 X146.684 Y144.098 E.00204
G1 X146.733 Y144.126 E.00155
G1 X146.748 Y147.737 F30000
G1 F15000
G1 X146.684 Y147.773 E.00204
G1 X146.748 Y147.81 E.00204
G1 X146.769 Y147.773 E.00118
G1 X146.786 Y148.023 E.00692
G1 X146.722 Y148.06 E.00204
G1 X146.771 Y148.088 E.00155
G1 X147.075 Y147.868 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134648
G1 F15000
G1 X147.215 Y147.964 E.00127
; LINE_WIDTH: 0.172377
G1 X147.355 Y148.061 E.00179
; LINE_WIDTH: 0.137457
G1 X147.536 Y148.086 E.00141
; LINE_WIDTH: 0.0969204
G1 X147.703 Y148.106 E.00074
G1 X148.635 Y148.106 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X148.802 Y148.086 E.00125
; LINE_WIDTH: 0.17135
G1 X148.968 Y148.066 E.00176
; LINE_WIDTH: 0.137973
G1 X149.123 Y147.964 E.00143
; LINE_WIDTH: 0.096921
G1 X149.263 Y147.868 E.00075
G1 X146.061 Y148.165 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.401278
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X146.061 Y147.037 E.05813
G1 X145.859 Y146.505 E.0293
G1 X145.79 Y145.936 E.02955
G1 X145.859 Y145.366 E.02955
G1 X146.061 Y144.835 E.0293
G1 X146.061 Y143.909 E.04769
G1 X145.609 Y143.909 E.02325
G1 X145.609 Y147.962 E.20885
G1 X145.158 Y147.962 E.02325
G1 X145.158 Y143.909 E.20885
G1 X144.707 Y143.909 E.02325
G1 X144.707 Y147.962 E.20886
G1 X144.256 Y147.962 E.02325
G1 X144.256 Y143.909 E.20886
G1 X143.804 Y143.909 E.02325
G1 X143.804 Y147.963 E.20886
G1 X143.353 Y147.963 E.02325
G1 X143.353 Y143.909 E.20886
G1 X142.902 Y143.909 E.02325
G1 X142.902 Y147.963 E.20887
G1 X142.451 Y147.963 E.02325
G1 X142.451 Y143.909 E.20887
G1 X141.999 Y143.909 E.02325
G1 X141.999 Y147.963 E.20887
G1 X141.548 Y147.963 E.02325
G1 X141.548 Y143.909 E.20887
G1 X141.097 Y143.909 E.02325
G1 X141.097 Y147.963 E.20888
G1 X140.645 Y147.963 E.02325
G1 X140.645 Y143.909 E.20888
G1 X140.194 Y143.909 E.02325
G1 X140.194 Y147.963 E.20888
G1 X139.743 Y147.963 E.02325
G1 X139.743 Y143.909 E.20888
G1 X139.292 Y143.909 E.02325
G1 X139.292 Y147.963 E.20889
G1 X138.84 Y147.963 E.02325
G1 X138.84 Y143.909 E.20889
G1 X138.389 Y143.909 E.02325
G1 X138.389 Y147.963 E.20889
G1 X137.938 Y147.963 E.02325
G1 X137.938 Y143.909 E.20889
G1 X137.486 Y143.909 E.02325
G1 X137.486 Y147.963 E.2089
G1 X137.035 Y147.963 E.02325
G1 X137.035 Y143.909 E.2089
G1 X136.584 Y143.909 E.02325
G1 X136.584 Y147.963 E.2089
G1 X136.133 Y147.963 E.02325
G1 X136.133 Y143.909 E.2089
G1 X135.681 Y143.909 E.02325
G1 X135.681 Y147.963 E.20891
G1 X135.23 Y147.963 E.02325
G1 X135.23 Y143.909 E.20891
G1 X134.779 Y143.909 E.02325
G1 X134.779 Y147.963 E.20891
G1 X134.328 Y147.963 E.02325
G1 X134.328 Y143.909 E.20891
G1 X133.876 Y143.909 E.02325
G1 X133.876 Y147.963 E.20892
G1 X133.425 Y147.963 E.02325
G1 X133.425 Y143.909 E.20892
G1 X132.974 Y143.909 E.02325
G1 X132.974 Y147.963 E.20892
G1 X132.522 Y147.963 E.02325
G1 X132.522 Y143.909 E.20892
G1 X132.071 Y143.908 E.02325
G1 X132.071 Y147.963 E.20893
G1 X131.62 Y147.963 E.02325
G1 X131.62 Y143.908 E.20893
G1 X131.169 Y143.908 E.02325
G1 X131.169 Y147.963 E.20893
G1 X130.717 Y147.963 E.02325
G1 X130.717 Y143.908 E.20893
G1 X130.266 Y143.908 E.02325
G1 X130.266 Y147.963 E.20894
G1 X129.815 Y147.963 E.02325
G1 X129.815 Y143.908 E.20894
G1 X129.363 Y143.908 E.02325
G1 X129.363 Y147.963 E.20894
G1 X128.912 Y147.963 E.02325
G1 X128.912 Y143.908 E.20894
G1 X128.461 Y143.908 E.02325
G1 X128.461 Y147.963 E.20895
G1 X128.01 Y147.963 E.02325
G1 X128.01 Y143.908 E.20895
G1 X127.558 Y143.908 E.02325
G1 X127.558 Y147.963 E.20895
G1 X127.107 Y147.963 E.02325
G1 X127.107 Y143.908 E.20895
G1 X126.656 Y143.908 E.02325
G1 X126.656 Y147.963 E.20896
G1 X126.205 Y147.963 E.02325
G1 X126.205 Y143.908 E.20896
M73 P75 R3
G1 X125.753 Y143.908 E.02325
G1 X125.753 Y147.963 E.20896
G1 X125.302 Y147.963 E.02325
G1 X125.302 Y143.908 E.20896
G1 X124.851 Y143.908 E.02325
G1 X124.851 Y147.964 E.20897
G1 X124.399 Y147.964 E.02325
G1 X124.399 Y143.908 E.20897
G1 X123.948 Y143.908 E.02325
G1 X123.948 Y147.964 E.20897
G1 X123.497 Y147.964 E.02325
G1 X123.497 Y143.908 E.20897
G1 X123.046 Y143.908 E.02325
G1 X123.046 Y147.964 E.20897
G1 X122.594 Y147.964 E.02325
G1 X122.594 Y143.908 E.20898
G1 X122.143 Y143.908 E.02325
G1 X122.143 Y147.964 E.20898
G1 X121.692 Y147.964 E.02325
G1 X121.692 Y143.908 E.20898
G1 X121.24 Y143.908 E.02325
G1 X121.24 Y147.964 E.20898
G1 X120.789 Y147.964 E.02325
G1 X120.789 Y143.908 E.20899
G1 X120.338 Y143.908 E.02325
G1 X120.338 Y147.964 E.20899
G1 X119.887 Y147.964 E.02325
G1 X119.887 Y143.908 E.20899
G1 X119.435 Y143.908 E.02325
G1 X119.435 Y147.964 E.20899
G1 X118.984 Y147.964 E.02325
G1 X118.984 Y143.908 E.209
G1 X118.533 Y143.908 E.02325
G1 X118.533 Y147.964 E.209
G1 X118.082 Y147.964 E.02325
G1 X118.082 Y143.908 E.209
G1 X117.63 Y143.908 E.02325
G1 X117.63 Y147.964 E.209
G1 X117.179 Y147.964 E.02325
G1 X117.179 Y143.908 E.20901
G1 X116.728 Y143.908 E.02325
G1 X116.728 Y147.964 E.20901
G1 X116.276 Y147.964 E.02325
G1 X116.276 Y147.039 E.04768
G1 X116.479 Y146.505 E.0294
G1 X116.548 Y145.936 E.02955
G1 X116.479 Y145.366 E.02955
G1 X116.276 Y144.833 E.0294
G1 X116.276 Y143.705 E.05811
M106 S234.6
G1 X115.611 Y144.101 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X115.607 Y143.864 E.00657
G1 X115.263 Y144.004 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969198
G1 F15000
G1 X115.123 Y143.907 E.00075
; LINE_WIDTH: 0.137969
G1 X114.968 Y143.806 E.00143
; LINE_WIDTH: 0.171348
G1 X114.802 Y143.785 E.00176
; LINE_WIDTH: 0.134134
G1 X114.635 Y143.765 E.00125
G1 X113.703 Y143.765 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X113.536 Y143.785 E.00074
; LINE_WIDTH: 0.137457
G1 X113.355 Y143.811 E.00141
; LINE_WIDTH: 0.172382
G1 X113.215 Y143.907 E.00179
; LINE_WIDTH: 0.134651
G1 X113.075 Y144.004 E.00127
G1 X112.265 Y144.023 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60633
G1 F11181.911
G1 X112.431 Y144.038 E.00769
G1 X112.383 Y144.617 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969206
G1 F15000
G1 X112.27 Y144.744 E.00075
; LINE_WIDTH: 0.158637
G2 X111.975 Y145.105 I2.805 J2.598 E.0044
G1 X112.067 Y145.026 F30000
; LINE_WIDTH: 0.240634
G1 F15000
G1 X112.102 Y144.834 E.00315
G1 X112.067 Y145.026 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X112.032 Y145.218 E.00238
; LINE_WIDTH: 0.144825
G1 X111.997 Y145.41 E.00162
G1 X111.997 Y146.462 F30000
; LINE_WIDTH: 0.144824
G1 F15000
G1 X112.032 Y146.654 E.00162
; LINE_WIDTH: 0.192728
G1 X112.067 Y146.846 E.00238
; LINE_WIDTH: 0.240632
G1 X112.102 Y147.038 E.00315
G1 X112.27 Y147.128 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X112.383 Y147.255 E.00075
G1 X112.27 Y147.128 F30000
; LINE_WIDTH: 0.158637
G1 F15000
G3 X111.975 Y146.767 I2.802 J-2.596 E.0044
G1 X112.257 Y147.848 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608158
G1 F11145.747
G1 X112.431 Y147.833 E.00805
G1 X113.075 Y147.868 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134649
G1 F15000
G1 X113.215 Y147.964 E.00127
; LINE_WIDTH: 0.172378
G1 X113.355 Y148.061 E.00179
; LINE_WIDTH: 0.137458
G1 X113.536 Y148.086 E.00141
; LINE_WIDTH: 0.0969204
G1 X113.703 Y148.106 E.00074
G1 X114.635 Y148.106 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X114.802 Y148.086 E.00125
; LINE_WIDTH: 0.17135
G1 X114.968 Y148.066 E.00176
; LINE_WIDTH: 0.137972
G1 X115.123 Y147.964 E.00143
; LINE_WIDTH: 0.0969195
G1 X115.263 Y147.868 E.00075
G1 X115.568 Y148.055 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X115.627 Y147.923 E.00399
G1 X115.615 Y147.832 E.00253
; WIPE_START
G1 F24000
G1 X115.627 Y147.923 E-.295
G1 X115.568 Y148.055 E-.465
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.661 J1.022 P1  F30000
G1 X145.076 Y128.965 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.906 Y128.516 E.01592
G1 X144.844 Y128 E.01725
G1 X144.906 Y127.484 E.01725
G1 X145.091 Y126.998 E.01725
G1 X145.386 Y126.57 E.01725
G1 X145.775 Y126.225 E.01725
G1 X146.235 Y125.984 E.01724
G1 X146.74 Y125.859 E.01725
G1 X147.26 Y125.859 E.01725
G1 X147.765 Y125.984 E.01725
G1 X148.225 Y126.225 E.01725
G1 X148.614 Y126.57 E.01725
G1 X148.909 Y126.998 E.01725
G1 X149.094 Y127.484 E.01725
G1 X149.157 Y128 E.01725
G1 X149.094 Y128.516 E.01725
G1 X148.909 Y129.002 E.01725
G1 X148.614 Y129.43 E.01725
G1 X148.225 Y129.775 E.01725
G1 X147.765 Y130.016 E.01725
G1 X147.26 Y130.141 E.01725
G1 X146.74 Y130.141 E.01725
G1 X146.235 Y130.016 E.01725
G1 X145.775 Y129.775 E.01724
G1 X145.386 Y129.43 E.01725
G1 X145.102 Y129.019 E.01658
G1 X145.44 Y128.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.29 Y128.422 E.01305
G1 X145.238 Y128 E.01305
G1 X145.29 Y127.578 E.01305
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.474 Y128.868 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.29 Y128.422 E-.18359
G1 X145.238 Y128 E-.16137
G1 X145.29 Y127.578 E-.16137
G1 X145.44 Y127.181 E-.16137
G1 X145.578 Y126.981 E-.09229
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.015 J-1.217 P1  F30000
G1 X114.637 Y126.603 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.909 Y126.998 E.01592
G1 X115.094 Y127.484 E.01725
G1 X115.157 Y128 E.01725
G1 X115.094 Y128.516 E.01725
G1 X114.909 Y129.002 E.01725
G1 X114.614 Y129.43 E.01725
G1 X114.225 Y129.775 E.01725
G1 X113.765 Y130.016 E.01725
G1 X113.26 Y130.141 E.01725
G1 X112.74 Y130.141 E.01725
G1 X112.235 Y130.016 E.01725
G1 X111.775 Y129.775 E.01724
G1 X111.386 Y129.43 E.01725
G1 X111.091 Y129.002 E.01725
G1 X110.906 Y128.516 E.01725
G1 X110.844 Y128 E.01724
G1 X110.906 Y127.484 E.01725
G1 X111.091 Y126.998 E.01725
G1 X111.386 Y126.57 E.01725
G1 X111.775 Y126.225 E.01725
G1 X112.235 Y125.984 E.01725
G1 X112.74 Y125.859 E.01725
G1 X113.26 Y125.859 E.01725
G1 X113.765 Y125.984 E.01725
G1 X114.225 Y126.225 E.01725
G1 X114.599 Y126.557 E.01658
G1 X114.297 Y126.813 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.319 Y126.832 E.00088
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.56 Y128.819 E.01305
G1 X114.319 Y129.168 E.01305
G1 X114.001 Y129.45 E.01305
G1 X113.625 Y129.647 E.01305
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.238 Y128 E.01305
G1 X111.29 Y127.578 E.01305
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.252 Y126.773 E.01032
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.03369
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.635 Y128.62 E-.08082
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.062 J1.215 P1  F30000
G1 X149.398 Y130.398 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.602 Y130.398 E1.28693
G1 X110.602 Y125.602 E.15909
G1 X149.398 Y125.602 E1.28693
G1 X149.398 Y130.338 E.1571
G1 X149.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.666 J1.018 P1  F30000
G1 X149.194 Y129.814 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X147.978 Y130.194 E.0298
G1 X148.772 Y130.194 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X149.194 Y129.084 E.04968
G1 X149.194 Y126.916 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X148.772 Y125.806 E.04532
G1 X149.194 Y126.186 F30000
; LINE_WIDTH: 0.329879
G1 F15000
G1 X147.978 Y125.806 E.0298
G1 X146.022 Y125.806 F30000
; LINE_WIDTH: 0.130745
G1 F15000
G1 X145.821 Y125.945 E.00175
; WIPE_START
G1 F24000
G1 X146.022 Y125.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J0 P1  F30000
G1 X146.022 Y130.194 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.130746
G1 F15000
G1 X145.821 Y130.055 E.00175
G1 X144.931 Y130.05 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.302 Y130.05 E.05401
G1 X144.617 Y128.735 E.06167
G3 X144.617 Y127.265 I1.735 J-.735 E.0501
G1 X143.302 Y125.95 E.06167
G1 X139.726 Y125.95 E.11864
G1 X135.626 Y130.05 E.19231
G1 X132.05 Y130.05 E.11864
G1 X127.95 Y125.95 E.19231
G1 X124.374 Y125.95 E.11864
G1 X120.274 Y130.05 E.19231
G1 X116.698 Y130.05 E.11864
G1 X115.383 Y128.735 E.06167
G2 X115.383 Y127.265 I-1.735 J-.735 E.0501
G1 X116.698 Y125.95 E.06167
G1 X120.274 Y125.95 E.11864
G1 X124.374 Y130.05 E.19231
G1 X127.95 Y130.05 E.11864
G1 X132.05 Y125.95 E.19231
G1 X135.626 Y125.95 E.11864
M73 P76 R3
G1 X139.726 Y130.05 E.19231
G1 X138.097 Y130.05 E.05401
G1 X114.179 Y130.055 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X113.978 Y130.194 E.00108
G1 X112.022 Y130.194 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X110.806 Y129.814 E.02764
G1 X111.228 Y130.194 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X110.806 Y129.084 E.04968
G1 X110.806 Y126.916 F30000
; LINE_WIDTH: 0.556113
G1 F12276.09
G1 X111.228 Y125.806 E.04968
G1 X110.806 Y126.186 F30000
; LINE_WIDTH: 0.309035
G1 F15000
G1 X112.022 Y125.806 E.02764
G1 X113.978 Y125.806 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X114.179 Y125.945 E.00108
; WIPE_START
G1 F24000
G1 X113.978 Y125.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.462 J1.126 P1  F30000
G1 X145.349 Y112.928 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.179 Y112.479 E.01592
G1 X145.117 Y111.963 E.01725
G1 X145.179 Y111.447 E.01725
G1 X145.364 Y110.96 E.01725
G1 X145.659 Y110.533 E.01725
G1 X146.048 Y110.188 E.01725
G1 X146.508 Y109.946 E.01724
G1 X147.013 Y109.822 E.01725
G1 X147.533 Y109.822 E.01725
G1 X148.038 Y109.946 E.01725
G1 X148.498 Y110.188 E.01725
G1 X148.887 Y110.533 E.01725
G1 X149.183 Y110.96 E.01725
G1 X149.367 Y111.447 E.01725
G1 X149.43 Y111.963 E.01725
G1 X149.367 Y112.479 E.01725
G1 X149.183 Y112.965 E.01725
G1 X148.887 Y113.393 E.01725
G1 X148.498 Y113.737 E.01725
G1 X148.038 Y113.979 E.01725
G1 X147.533 Y114.103 E.01725
G1 X147.013 Y114.103 E.01725
G1 X146.508 Y113.979 E.01725
G1 X146.048 Y113.737 E.01724
G1 X145.659 Y113.393 E.01725
G1 X145.375 Y112.981 E.01658
G1 X145.713 Y112.781 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.563 Y112.384 E.01305
G1 X145.512 Y111.963 E.01305
G1 X145.563 Y111.541 E.01305
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
M73 P76 R2
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.747 Y112.831 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.563 Y112.384 E-.18359
G1 X145.512 Y111.963 E-.16137
G1 X145.563 Y111.541 E-.16137
G1 X145.713 Y111.144 E-.16137
G1 X145.851 Y110.944 E-.09229
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.015 J-1.217 P1  F30000
G1 X114.91 Y110.565 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.183 Y110.96 E.01592
G1 X115.367 Y111.447 E.01725
G1 X115.43 Y111.963 E.01725
G1 X115.367 Y112.479 E.01725
G1 X115.183 Y112.965 E.01725
G1 X114.887 Y113.393 E.01725
G1 X114.498 Y113.737 E.01725
G1 X114.038 Y113.979 E.01725
G1 X113.533 Y114.103 E.01725
G1 X113.013 Y114.103 E.01725
G1 X112.508 Y113.979 E.01725
G1 X112.048 Y113.737 E.01724
G1 X111.659 Y113.393 E.01725
G1 X111.364 Y112.965 E.01725
G1 X111.179 Y112.479 E.01725
G1 X111.117 Y111.963 E.01724
G1 X111.179 Y111.447 E.01725
G1 X111.364 Y110.96 E.01725
G1 X111.659 Y110.533 E.01725
G1 X112.048 Y110.188 E.01725
G1 X112.508 Y109.946 E.01725
G1 X113.013 Y109.822 E.01725
G1 X113.533 Y109.822 E.01725
G1 X114.038 Y109.946 E.01725
G1 X114.498 Y110.188 E.01725
G1 X114.872 Y110.519 E.01658
G1 X114.57 Y110.776 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.592 Y110.795 E.00088
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.833 Y112.781 E.01305
G1 X114.592 Y113.131 E.01305
G1 X114.274 Y113.412 E.01305
G1 X113.898 Y113.61 E.01305
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.512 Y111.963 E.01305
G1 X111.563 Y111.541 E.01305
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.525 Y110.736 E.01032
M204 S10000
; WIPE_START
G1 F24000
G1 X114.592 Y110.795 E-.03369
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.908 Y112.583 E-.08082
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.062 J1.215 P1  F30000
G1 X149.671 Y114.361 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.875 Y114.361 E1.28693
G1 X110.875 Y109.565 E.15909
G1 X149.671 Y109.565 E1.28693
G1 X149.671 Y114.301 E.1571
G1 X150.063 Y114.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.666 J1.018 P1  F30000
G1 X149.467 Y113.776 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X148.251 Y114.157 E.0298
G1 X149.045 Y114.157 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X149.467 Y113.047 E.04968
G1 X149.467 Y110.878 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X149.045 Y109.768 E.04532
G1 X149.467 Y110.149 F30000
; LINE_WIDTH: 0.329879
G1 F15000
G1 X148.251 Y109.768 E.0298
G1 X146.295 Y109.768 F30000
; LINE_WIDTH: 0.130745
G1 F15000
G1 X146.094 Y109.907 E.00175
; WIPE_START
G1 F24000
G1 X146.295 Y109.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J0 P1  F30000
G1 X146.295 Y114.157 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.130746
G1 F15000
G1 X146.094 Y114.018 E.00175
G1 X145.204 Y114.012 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.575 Y114.012 E.05401
G1 X144.89 Y112.698 E.06167
G3 X144.89 Y111.227 I1.735 J-.735 E.0501
G1 X143.575 Y109.913 E.06167
G1 X139.999 Y109.913 E.11864
G1 X135.899 Y114.012 E.19231
G1 X132.323 Y114.012 E.11864
G1 X128.223 Y109.913 E.19231
G1 X124.647 Y109.913 E.11864
G1 X120.547 Y114.012 E.19231
G1 X116.971 Y114.012 E.11864
G1 X115.656 Y112.698 E.06167
G2 X115.656 Y111.227 I-1.735 J-.735 E.0501
G1 X116.971 Y109.913 E.06167
G1 X120.547 Y109.913 E.11864
G1 X124.647 Y114.012 E.19231
G1 X128.223 Y114.012 E.11864
G1 X132.323 Y109.913 E.19231
G1 X135.899 Y109.913 E.11864
G1 X139.999 Y114.012 E.19231
G1 X138.37 Y114.012 E.05401
G1 X114.452 Y114.018 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X114.251 Y114.157 E.00108
G1 X112.295 Y114.157 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X111.079 Y113.776 E.02764
G1 X111.501 Y114.157 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X111.079 Y113.047 E.04968
G1 X111.079 Y110.878 F30000
; LINE_WIDTH: 0.556113
G1 F12276.09
G1 X111.501 Y109.768 E.04968
G1 X111.079 Y110.149 F30000
; LINE_WIDTH: 0.309035
G1 F15000
G1 X112.295 Y109.768 E.02764
G1 X114.251 Y109.768 F30000
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X114.452 Y109.907 E.00108
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.251 Y109.768 E-.76
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
G3 Z1.8 I-1.042 J.629 P1  F30000
G1 X146.004 Y162.405 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.975 Y162.379 E.0013
G1 X145.7 Y161.981 E.01605
G1 X145.528 Y161.529 E.01605
G1 X145.47 Y161.048 E.01605
G1 X145.528 Y160.568 E.01605
G1 X145.7 Y160.116 E.01605
G1 X145.975 Y159.718 E.01605
G1 X146.337 Y159.397 E.01605
G1 X146.651 Y159.232 E.01175
G1 X146.765 Y159.172 E.00429
G1 X147.235 Y159.057 E.01605
G1 X147.718 Y159.057 E.01605
G1 X148.188 Y159.172 E.01605
G1 X148.616 Y159.397 E.01605
G1 X148.882 Y159.632 E.01175
G1 X148.979 Y159.718 E.00429
G1 X149.253 Y160.116 E.01605
G1 X149.425 Y160.568 E.01605
G1 X149.483 Y161.048 E.01605
G1 X149.425 Y161.529 E.01605
G1 X149.253 Y161.981 E.01605
G1 X148.979 Y162.379 E.01605
G1 X148.616 Y162.7 E.01605
G1 X148.188 Y162.925 E.01605
G1 X147.718 Y163.04 E.01605
G1 X147.235 Y163.04 E.01605
G1 X146.765 Y162.925 E.01605
G1 X146.337 Y162.7 E.01605
G1 X146.072 Y162.465 E.01175
G1 X146.049 Y162.445 E.001
G1 X146.271 Y162.118 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.278 Y162.11 E.00031
G3 X146.561 Y159.722 I1.2 J-1.069 E.0835
G1 X146.905 Y159.542 E.01194
G1 X147.282 Y159.449 E.01194
G3 X148.392 Y159.722 I.146 J1.797 E.03574
G1 X148.683 Y159.98 E.01194
G3 X146.333 Y162.17 I-1.205 J1.062 E.15231
G1 X146.318 Y162.156 E.00063
M204 S10000
; WIPE_START
G1 F24000
G1 X146.278 Y162.11 E-.02307
G1 X146.05 Y161.797 E-.1472
G1 X145.912 Y161.434 E-.14763
G1 X145.865 Y161.048 E-.14763
G1 X145.912 Y160.663 E-.14763
G1 X146.049 Y160.302 E-.14683
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.067 J-1.215 P1  F30000
G1 X115.231 Y162.013 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.979 Y162.379 E.01475
G1 X114.616 Y162.7 E.01605
G1 X114.188 Y162.925 E.01605
G1 X113.718 Y163.04 E.01605
G1 X113.235 Y163.04 E.01605
G1 X112.765 Y162.925 E.01605
G1 X112.337 Y162.7 E.01605
G1 X111.975 Y162.379 E.01605
G1 X111.7 Y161.981 E.01605
G1 X111.528 Y161.529 E.01605
G1 X111.47 Y161.048 E.01605
G1 X111.528 Y160.568 E.01605
G1 X111.7 Y160.116 E.01605
G1 X111.975 Y159.718 E.01605
G1 X112.337 Y159.397 E.01605
G1 X112.765 Y159.172 E.01605
G1 X113.235 Y159.057 E.01605
G1 X113.718 Y159.057 E.01605
G1 X114.188 Y159.172 E.01605
G1 X114.616 Y159.397 E.01605
G1 X114.979 Y159.718 E.01605
G1 X115.253 Y160.116 E.01605
G1 X115.425 Y160.568 E.01605
G1 X115.483 Y161.048 E.01605
G1 X115.425 Y161.529 E.01605
G1 X115.261 Y161.961 E.01535
G1 X114.903 Y161.799 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.676 Y162.111 E.01186
G3 X113.282 Y159.449 I-1.199 J-1.068 E.19061
G1 X113.671 Y159.449 E.01194
G3 X114.919 Y161.748 I-.194 J1.594 E.09395
M204 S10000
; WIPE_START
G1 F24000
G1 X114.676 Y162.111 E-.16613
G1 X114.392 Y162.375 E-.14724
G1 X114.048 Y162.555 E-.14763
G1 X113.671 Y162.648 E-.14763
G1 X113.282 Y162.648 E-.14763
G1 X113.273 Y162.646 E-.00374
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.027 J1.217 P1  F30000
G1 X149.875 Y163.446 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.079 Y163.446 E1.28693
G1 X111.079 Y158.651 E.15909
G1 X149.875 Y158.651 E1.28693
G1 X149.875 Y163.386 E.1571
G1 X150.267 Y163.838 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.687 Y163.838 E1.21618
G1 X110.687 Y158.258 E.17146
G1 X150.267 Y158.258 E1.21618
G1 X150.267 Y163.778 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.267 Y163.782 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.837 J.883 P1  F30000
G1 X149.153 Y162.942 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645606
G1 F10453.205
G1 X149.332 Y162.958 E.00881
G1 X149.263 Y162.368 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X149.375 Y162.24 E.00127
; LINE_WIDTH: 0.172379
G1 X149.488 Y162.113 E.00179
; LINE_WIDTH: 0.178249
G1 X149.671 Y161.879 E.00327
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.240633
G1 F15000
G1 X149.543 Y162.151 E.00315
G1 X149.578 Y161.959 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X149.614 Y161.766 E.00238
; LINE_WIDTH: 0.144824
G1 X149.649 Y161.574 E.00162
G1 X149.649 Y160.523 F30000
; LINE_WIDTH: 0.0969199
G1 F15000
G1 X149.614 Y160.331 E.00086
; LINE_WIDTH: 0.144825
G1 X149.578 Y160.138 E.00162
; LINE_WIDTH: 0.19273
G1 X149.543 Y159.946 E.00238
G1 X149.488 Y159.984 F30000
; LINE_WIDTH: 0.17825
G1 F15000
G1 X149.671 Y160.218 E.00327
M73 P77 R2
G1 X149.488 Y159.984 F30000
; LINE_WIDTH: 0.172379
G1 F15000
G1 X149.375 Y159.857 E.00179
; LINE_WIDTH: 0.13465
G1 X149.263 Y159.729 E.00127
G1 X149.151 Y159.155 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645648
G1 F10452.476
G1 X149.243 Y159.146 E.00457
; LINE_WIDTH: 0.619863
G1 F10919.623
G1 X149.336 Y159.136 E.00437
G1 X148.571 Y159.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.09692
G1 F15000
G1 X148.431 Y159.02 E.00075
; LINE_WIDTH: 0.137972
G1 X148.276 Y158.918 E.00143
; LINE_WIDTH: 0.171348
G1 X148.11 Y158.898 E.00176
; LINE_WIDTH: 0.134134
G1 X147.943 Y158.878 E.00125
G1 X147.01 Y158.878 F30000
; LINE_WIDTH: 0.09692
G1 F15000
G1 X146.844 Y158.898 E.00074
; LINE_WIDTH: 0.137456
G1 X146.662 Y158.923 E.00141
; LINE_WIDTH: 0.172383
G1 X146.522 Y159.02 E.00179
; LINE_WIDTH: 0.134652
G1 X146.383 Y159.117 E.00127
G1 X145.078 Y161.071 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X145.142 Y160.497 E.01777
G1 X145.342 Y159.954 E.01777
G1 X145.666 Y159.475 E.01777
G1 X145.965 Y159.202 E.01244
G1 X145.904 Y159.112 E.00337
G1 X145.917 Y159.043 E.00216
G1 X115.027 Y159.043 E.94918
G3 X114.988 Y159.202 I-.127 J.054 E.00541
G1 X115.287 Y159.475 E.01244
G1 X115.59 Y159.914 E.01638
G1 X115.8 Y160.452 E.01777
G1 X115.875 Y161.026 E.01777
G1 X115.811 Y161.6 E.01777
G1 X115.611 Y162.143 E.01777
G1 X115.287 Y162.622 E.01777
G1 X114.988 Y162.895 E.01244
G1 X115.047 Y162.983 E.00327
G1 X115.03 Y163.054 E.00226
G1 X145.917 Y163.054 E.94908
G3 X145.965 Y162.895 I.126 J-.049 E.00553
G1 X145.666 Y162.622 E.01244
G1 X145.363 Y162.183 E.01638
G1 X145.153 Y161.645 E.01777
G1 X145.086 Y161.131 E.01593
G1 X144.704 Y161.117 F30000
G1 F15000
G1 X144.768 Y160.451 E.02055
G1 X144.99 Y159.82 E.02055
G1 X145.246 Y159.42 E.01461
G1 X115.707 Y159.42 E.90764
G1 X115.964 Y159.82 E.01461
G1 X116.153 Y160.319 E.01638
G1 X116.25 Y160.98 E.02055
G1 X116.185 Y161.646 E.02055
G1 X115.964 Y162.277 E.02055
G1 X115.707 Y162.677 E.01461
G1 X145.246 Y162.677 E.90764
G1 X144.99 Y162.277 E.01461
G1 X144.801 Y161.778 E.01638
G1 X144.712 Y161.176 E.0187
G1 X144.329 Y161.162 F30000
G1 F15000
G1 X144.394 Y160.406 E.02333
G1 X144.595 Y159.797 E.01971
G1 X116.358 Y159.797 E.86764
G1 X116.56 Y160.406 E.01971
G1 X116.624 Y160.935 E.01638
G1 X116.56 Y161.691 E.02333
G1 X116.358 Y162.3 E.01971
G1 X144.595 Y162.3 E.86764
G1 X144.394 Y161.691 E.01971
G1 X144.337 Y161.222 E.01454
G1 X143.955 Y160.889 F30000
G1 F15000
G3 X144.065 Y160.174 I3.002 J.096 E.0223
G1 X116.888 Y160.174 E.83507
G1 X116.998 Y160.889 E.02225
G3 X116.888 Y161.923 I-4.479 J.045 E.03201
G1 X144.065 Y161.923 E.83507
G1 X143.955 Y161.208 E.02224
G1 X143.955 Y160.949 E.00793
G1 X143.568 Y161.048 F30000
G1 F15000
G1 X143.616 Y160.551 E.01536
G1 X117.337 Y160.551 E.80748
G1 X117.385 Y161.048 E.01536
G1 X117.337 Y161.546 E.01536
G1 X143.616 Y161.546 E.80748
G1 X143.574 Y161.108 E.01351
G1 X143.235 Y161.203 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X143.235 Y160.894 E.00778
G1 X117.719 Y160.894 E.64246
G1 X117.719 Y161.203 E.00778
G1 X143.175 Y161.203 E.64094
G1 X146.383 Y162.98 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X146.522 Y163.077 E.00127
; LINE_WIDTH: 0.17238
G1 X146.662 Y163.174 E.00179
; LINE_WIDTH: 0.137458
G1 X146.844 Y163.199 E.00141
; LINE_WIDTH: 0.0969204
G1 X147.01 Y163.219 E.00074
G1 X147.943 Y163.219 F30000
; LINE_WIDTH: 0.134134
G1 F15000
G1 X148.11 Y163.199 E.00125
; LINE_WIDTH: 0.171348
G1 X148.276 Y163.179 E.00176
; LINE_WIDTH: 0.137972
G1 X148.431 Y163.077 E.00143
; LINE_WIDTH: 0.0969209
G1 X148.571 Y162.98 E.00075
G1 X114.571 Y162.98 F30000
; LINE_WIDTH: 0.0969208
G1 F15000
G1 X114.431 Y163.077 E.00075
; LINE_WIDTH: 0.137971
G1 X114.276 Y163.179 E.00143
; LINE_WIDTH: 0.17135
G1 X114.11 Y163.199 E.00176
; LINE_WIDTH: 0.134135
G1 X113.943 Y163.219 E.00125
G1 X113.01 Y163.219 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X112.844 Y163.199 E.00074
; LINE_WIDTH: 0.137458
G1 X112.662 Y163.174 E.00141
; LINE_WIDTH: 0.172376
G1 X112.522 Y163.077 E.00179
; LINE_WIDTH: 0.134648
G1 X112.383 Y162.98 E.00127
G1 X111.565 Y162.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608154
G1 F11145.826
G1 X111.739 Y162.946 E.00805
G1 X111.691 Y162.368 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969211
G1 F15000
G1 X111.578 Y162.24 E.00075
; LINE_WIDTH: 0.158639
G3 X111.282 Y161.879 I2.804 J-2.598 E.0044
G1 X111.375 Y161.959 F30000
; LINE_WIDTH: 0.240634
G1 F15000
G1 X111.41 Y162.151 E.00315
G1 X111.375 Y161.959 F30000
; LINE_WIDTH: 0.19273
G1 F15000
G1 X111.34 Y161.766 E.00238
; LINE_WIDTH: 0.144825
G1 X111.304 Y161.574 E.00162
G1 X111.304 Y160.523 F30000
; LINE_WIDTH: 0.144824
G1 F15000
G1 X111.34 Y160.331 E.00162
; LINE_WIDTH: 0.192728
G1 X111.375 Y160.138 E.00238
; LINE_WIDTH: 0.240632
G1 X111.41 Y159.946 E.00315
G1 X111.578 Y159.857 F30000
; LINE_WIDTH: 0.158636
G1 F15000
G2 X111.282 Y160.218 I2.802 J2.596 E.0044
G1 X111.578 Y159.857 F30000
; LINE_WIDTH: 0.0969205
G1 F15000
G1 X111.691 Y159.729 E.00075
G1 X111.572 Y159.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.606334
G1 F11181.831
G1 X111.739 Y159.15 E.00769
G1 X112.383 Y159.117 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134651
G1 F15000
G1 X112.522 Y159.02 E.00127
; LINE_WIDTH: 0.172382
G1 X112.662 Y158.923 E.00179
; LINE_WIDTH: 0.137456
G1 X112.844 Y158.898 E.00141
; LINE_WIDTH: 0.0969199
G1 X113.01 Y158.878 E.00074
G1 X113.943 Y158.878 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X114.11 Y158.898 E.00125
; LINE_WIDTH: 0.17135
G1 X114.276 Y158.918 E.00176
; LINE_WIDTH: 0.13797
G1 X114.431 Y159.02 E.00143
; LINE_WIDTH: 0.09692
G1 X114.571 Y159.117 E.00075
; WIPE_START
G1 F24000
G1 X114.431 Y159.02 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.416 J1.144 P1  F30000
G1 X146.696 Y147.292 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.667 Y147.266 E.0013
G1 X146.392 Y146.868 E.01605
G1 X146.221 Y146.416 E.01605
G1 X146.162 Y145.936 E.01605
G1 X146.221 Y145.456 E.01605
G1 X146.392 Y145.003 E.01605
G1 X146.667 Y144.605 E.01605
G1 X147.029 Y144.284 E.01605
G1 X147.343 Y144.12 E.01175
G1 X147.457 Y144.06 E.00429
G1 X147.927 Y143.944 E.01605
G1 X148.411 Y143.944 E.01605
G1 X148.88 Y144.06 E.01605
G1 X149.309 Y144.284 E.01605
G1 X149.574 Y144.519 E.01175
G1 X149.671 Y144.605 E.00429
G1 X149.946 Y145.003 E.01605
G1 X150.117 Y145.456 E.01605
G1 X150.175 Y145.936 E.01605
G1 X150.117 Y146.416 E.01605
G1 X149.946 Y146.868 E.01605
G1 X149.671 Y147.266 E.01605
G1 X149.309 Y147.587 E.01605
G1 X148.88 Y147.812 E.01605
G1 X148.411 Y147.928 E.01605
G1 X147.927 Y147.928 E.01605
G1 X147.457 Y147.812 E.01605
G1 X147.029 Y147.587 E.01605
G1 X146.764 Y147.352 E.01175
G1 X146.741 Y147.332 E.001
G1 X146.964 Y147.005 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.97 Y146.998 E.00031
G3 X147.253 Y144.61 I1.2 J-1.069 E.0835
G1 X147.597 Y144.429 E.01194
G1 X147.975 Y144.336 E.01194
G3 X149.084 Y144.61 I.146 J1.797 E.03574
G1 X149.375 Y144.867 E.01194
G3 X147.026 Y147.057 I-1.205 J1.062 E.15231
G1 X147.01 Y147.044 E.00063
M204 S10000
; WIPE_START
G1 F24000
G1 X146.97 Y146.998 E-.02307
G1 X146.742 Y146.685 E-.1472
G1 X146.604 Y146.321 E-.14763
G1 X146.557 Y145.936 E-.14763
G1 X146.604 Y145.55 E-.14763
G1 X146.741 Y145.189 E-.14683
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.067 J-1.215 P1  F30000
G1 X115.923 Y146.9 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.671 Y147.266 E.01475
G1 X115.309 Y147.587 E.01605
G1 X114.88 Y147.812 E.01605
G1 X114.411 Y147.928 E.01605
G1 X113.927 Y147.928 E.01605
G1 X113.457 Y147.812 E.01605
G1 X113.029 Y147.587 E.01605
G1 X112.667 Y147.266 E.01605
G1 X112.392 Y146.868 E.01605
G1 X112.221 Y146.416 E.01605
G1 X112.162 Y145.936 E.01605
G1 X112.221 Y145.456 E.01605
G1 X112.392 Y145.003 E.01605
G1 X112.667 Y144.605 E.01605
G1 X113.029 Y144.284 E.01605
G1 X113.457 Y144.06 E.01605
G1 X113.927 Y143.944 E.01605
G1 X114.411 Y143.944 E.01605
G1 X114.88 Y144.06 E.01605
G1 X115.309 Y144.284 E.01605
G1 X115.671 Y144.605 E.01605
G1 X115.946 Y145.003 E.01605
G1 X116.117 Y145.456 E.01605
G1 X116.175 Y145.936 E.01605
G1 X116.117 Y146.416 E.01605
G1 X115.953 Y146.849 E.01535
G1 X115.595 Y146.686 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.368 Y146.998 E.01186
G3 X113.975 Y144.336 I-1.199 J-1.068 E.19061
G1 X114.363 Y144.336 E.01194
G3 X115.612 Y146.635 I-.194 J1.594 E.09395
M204 S10000
; WIPE_START
G1 F24000
G1 X115.368 Y146.998 E-.16613
G1 X115.084 Y147.262 E-.14724
G1 X114.74 Y147.443 E-.14763
G1 X114.363 Y147.536 E-.14763
G1 X113.975 Y147.536 E-.14763
G1 X113.965 Y147.533 E-.00374
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.027 J1.217 P1  F30000
G1 X150.567 Y148.334 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.771 Y148.334 E1.28693
G1 X111.771 Y143.538 E.15909
G1 X150.567 Y143.538 E1.28693
G1 X150.567 Y148.274 E.1571
G1 X150.959 Y148.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.379 Y148.726 E1.21618
G1 X111.379 Y143.146 E.17146
G1 X150.959 Y143.146 E1.21618
G1 X150.959 Y148.666 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.959 Y148.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.837 J.883 P1  F30000
G1 X149.845 Y147.829 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645606
G1 F10453.205
G1 X150.024 Y147.845 E.00881
G1 X149.955 Y147.255 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X150.068 Y147.128 E.00127
; LINE_WIDTH: 0.172379
G1 X150.18 Y147 E.00179
; LINE_WIDTH: 0.178249
G1 X150.363 Y146.767 E.00327
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.240633
G1 F15000
G1 X150.236 Y147.038 E.00315
G1 X150.271 Y146.846 F30000
; LINE_WIDTH: 0.192729
G1 F15000
G1 X150.306 Y146.654 E.00238
; LINE_WIDTH: 0.144824
G1 X150.341 Y146.462 E.00162
G1 X150.341 Y145.41 F30000
; LINE_WIDTH: 0.0969199
G1 F15000
G1 X150.306 Y145.218 E.00086
; LINE_WIDTH: 0.144825
G1 X150.271 Y145.026 E.00162
; LINE_WIDTH: 0.19273
G1 X150.236 Y144.834 E.00238
G1 X150.18 Y144.871 F30000
; LINE_WIDTH: 0.172379
G1 F15000
G1 X150.068 Y144.744 E.00179
; LINE_WIDTH: 0.13465
G1 X149.955 Y144.617 E.00127
G1 X150.18 Y144.871 F30000
; LINE_WIDTH: 0.17825
G1 F15000
G1 X150.363 Y145.105 E.00327
G1 X149.843 Y144.043 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.645648
G1 F10452.476
G1 X149.936 Y144.033 E.00457
; LINE_WIDTH: 0.619863
G1 F10919.623
G1 X150.028 Y144.023 E.00437
G1 X149.263 Y144.004 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.09692
G1 F15000
G1 X149.123 Y143.907 E.00075
; LINE_WIDTH: 0.137972
G1 X148.968 Y143.806 E.00143
; LINE_WIDTH: 0.171348
G1 X148.802 Y143.785 E.00176
; LINE_WIDTH: 0.134134
G1 X148.635 Y143.765 E.00125
G1 X147.703 Y143.765 F30000
; LINE_WIDTH: 0.09692
G1 F15000
G1 X147.536 Y143.785 E.00074
; LINE_WIDTH: 0.137456
G1 X147.355 Y143.811 E.00141
; LINE_WIDTH: 0.172383
G1 X147.215 Y143.907 E.00179
; LINE_WIDTH: 0.134652
G1 X147.075 Y144.004 E.00127
G1 X145.77 Y145.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X145.834 Y145.384 E.01777
G1 X146.034 Y144.841 E.01777
G1 X146.358 Y144.362 E.01777
G1 X146.658 Y144.09 E.01244
G1 X146.596 Y143.999 E.00337
G1 X146.61 Y143.93 E.00216
G1 X115.719 Y143.93 E.94918
G3 X115.68 Y144.09 I-.127 J.054 E.00541
G1 X115.979 Y144.362 E.01244
G1 X116.282 Y144.801 E.01638
G1 X116.492 Y145.34 E.01777
G1 X116.568 Y145.913 E.01777
G1 X116.503 Y146.488 E.01777
G1 X116.303 Y147.03 E.01777
G1 X115.979 Y147.509 E.01777
G1 X115.68 Y147.782 E.01244
G1 X115.74 Y147.87 E.00327
G1 X115.722 Y147.942 E.00226
G1 X146.61 Y147.942 E.94908
G3 X146.658 Y147.782 I.126 J-.049 E.00553
G1 X146.358 Y147.509 E.01244
G1 X146.056 Y147.071 E.01638
G1 X145.845 Y146.532 E.01777
G1 X145.778 Y146.018 E.01593
G1 X145.396 Y146.004 F30000
G1 F15000
G1 X145.46 Y145.338 E.02055
G1 X145.682 Y144.707 E.02055
G1 X145.938 Y144.307 E.01461
G1 X116.4 Y144.307 E.90764
G1 X116.656 Y144.707 E.01461
G1 X116.845 Y145.206 E.01638
G1 X116.942 Y145.868 E.02055
G1 X116.878 Y146.533 E.02055
G1 X116.656 Y147.164 E.02055
G1 X116.4 Y147.565 E.01461
G1 X145.938 Y147.565 E.90764
G1 X145.682 Y147.164 E.01461
G1 X145.493 Y146.666 E.01638
G1 X145.405 Y146.063 E.0187
G1 X145.022 Y146.049 F30000
G1 F15000
G1 X145.086 Y145.293 E.02333
G1 X145.287 Y144.684 E.01971
G1 X117.05 Y144.684 E.86764
G1 X117.252 Y145.293 E.01971
G1 X117.316 Y145.822 E.01638
G1 X117.252 Y146.579 E.02333
G1 X117.05 Y147.187 E.01971
G1 X145.287 Y147.187 E.86764
G1 X145.086 Y146.579 E.01971
G1 X145.029 Y146.109 E.01454
G1 X144.647 Y145.777 F30000
G1 F15000
G3 X144.757 Y145.061 I3.002 J.096 E.0223
G1 X117.58 Y145.061 E.83507
G1 X117.691 Y145.777 E.02225
G3 X117.58 Y146.81 I-4.479 J.045 E.03201
G1 X144.757 Y146.81 E.83507
M73 P78 R2
G1 X144.647 Y146.095 E.02224
G1 X144.647 Y145.837 E.00793
G1 X144.261 Y145.936 F30000
G1 F15000
G1 X144.308 Y145.438 E.01536
G1 X118.029 Y145.438 E.80748
G1 X118.077 Y145.936 E.01536
G1 X118.029 Y146.433 E.01536
G1 X144.308 Y146.433 E.80748
G1 X144.266 Y145.996 E.01351
G1 X143.927 Y146.09 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X143.927 Y145.781 E.00778
G1 X118.411 Y145.781 E.64246
G1 X118.411 Y146.09 E.00778
G1 X143.867 Y146.09 E.64094
G1 X147.075 Y147.868 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13465
G1 F15000
G1 X147.215 Y147.964 E.00127
; LINE_WIDTH: 0.17238
G1 X147.355 Y148.061 E.00179
; LINE_WIDTH: 0.137458
G1 X147.536 Y148.086 E.00141
; LINE_WIDTH: 0.0969204
G1 X147.703 Y148.106 E.00074
G1 X148.635 Y148.106 F30000
; LINE_WIDTH: 0.134134
G1 F15000
G1 X148.802 Y148.086 E.00125
; LINE_WIDTH: 0.171348
G1 X148.969 Y148.066 E.00176
; LINE_WIDTH: 0.137972
G1 X149.123 Y147.964 E.00143
; LINE_WIDTH: 0.0969209
G1 X149.263 Y147.868 E.00075
G1 X115.263 Y147.868 F30000
; LINE_WIDTH: 0.0969208
G1 F15000
G1 X115.123 Y147.964 E.00075
; LINE_WIDTH: 0.137971
G1 X114.968 Y148.066 E.00143
; LINE_WIDTH: 0.17135
G1 X114.802 Y148.086 E.00176
; LINE_WIDTH: 0.134135
G1 X114.635 Y148.106 E.00125
G1 X113.703 Y148.106 F30000
; LINE_WIDTH: 0.0969204
G1 F15000
G1 X113.536 Y148.086 E.00074
; LINE_WIDTH: 0.137458
G1 X113.355 Y148.061 E.00141
; LINE_WIDTH: 0.172376
G1 X113.215 Y147.964 E.00179
; LINE_WIDTH: 0.134648
G1 X113.075 Y147.868 E.00127
G1 X112.257 Y147.848 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.608154
G1 F11145.826
G1 X112.431 Y147.833 E.00805
G1 X112.383 Y147.255 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969211
G1 F15000
G1 X112.27 Y147.128 E.00075
; LINE_WIDTH: 0.158639
G3 X111.975 Y146.767 I2.804 J-2.598 E.0044
G1 X112.067 Y146.846 F30000
; LINE_WIDTH: 0.19273
G1 F15000
G1 X112.032 Y146.654 E.00238
; LINE_WIDTH: 0.144825
G1 X111.997 Y146.462 E.00162
G1 X112.067 Y146.846 F30000
; LINE_WIDTH: 0.240634
G1 F15000
G1 X112.102 Y147.038 E.00315
G1 X111.997 Y145.41 F30000
; LINE_WIDTH: 0.144824
G1 F15000
G1 X112.032 Y145.218 E.00162
; LINE_WIDTH: 0.192728
G1 X112.067 Y145.026 E.00238
; LINE_WIDTH: 0.240632
G1 X112.102 Y144.834 E.00315
G1 X112.27 Y144.744 F30000
; LINE_WIDTH: 0.0969205
G1 F15000
G1 X112.383 Y144.617 E.00075
G1 X112.27 Y144.744 F30000
; LINE_WIDTH: 0.158636
G1 F15000
G2 X111.975 Y145.105 I2.802 J2.596 E.0044
G1 X112.265 Y144.023 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.606334
G1 F11181.831
G1 X112.431 Y144.038 E.00769
G1 X113.075 Y144.004 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134651
G1 F15000
G1 X113.215 Y143.907 E.00127
; LINE_WIDTH: 0.172382
G1 X113.355 Y143.811 E.00179
; LINE_WIDTH: 0.137456
G1 X113.536 Y143.785 E.00141
; LINE_WIDTH: 0.0969199
G1 X113.703 Y143.765 E.00074
G1 X114.635 Y143.765 F30000
; LINE_WIDTH: 0.134135
G1 F15000
G1 X114.802 Y143.785 E.00125
; LINE_WIDTH: 0.17135
G1 X114.968 Y143.806 E.00176
; LINE_WIDTH: 0.13797
G1 X115.123 Y143.907 E.00143
; LINE_WIDTH: 0.09692
G1 X115.263 Y144.004 E.00075
; WIPE_START
G1 F24000
G1 X115.123 Y143.907 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.541 J1.09 P1  F30000
G1 X145.113 Y129.035 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.091 Y129.002 E.00132
G1 X144.906 Y128.516 E.01725
G1 X144.844 Y128 E.01725
G1 X144.906 Y127.484 E.01725
G1 X145.091 Y126.998 E.01725
G1 X145.386 Y126.57 E.01725
G1 X145.775 Y126.225 E.01725
G1 X146.235 Y125.984 E.01724
G1 X146.74 Y125.859 E.01725
G1 X147.26 Y125.859 E.01725
G1 X147.765 Y125.984 E.01725
G1 X148.225 Y126.225 E.01724
G1 X148.614 Y126.57 E.01725
G1 X148.909 Y126.998 E.01725
G1 X149.094 Y127.484 E.01725
G1 X149.157 Y128 E.01725
G1 X149.094 Y128.516 E.01725
G1 X148.909 Y129.002 E.01725
G1 X148.614 Y129.43 E.01725
G1 X148.225 Y129.775 E.01725
G1 X147.765 Y130.016 E.01724
G1 X147.26 Y130.141 E.01725
G1 X146.74 Y130.141 E.01725
G1 X146.235 Y130.016 E.01725
G1 X145.775 Y129.775 E.01724
G1 X145.386 Y129.43 E.01725
G1 X145.147 Y129.084 E.01394
G1 X145.44 Y128.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.29 Y128.422 E.01305
G1 X145.238 Y128 E.01305
G1 X145.29 Y127.578 E.01305
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.474 Y128.868 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.29 Y128.422 E-.18359
G1 X145.238 Y128 E-.16137
G1 X145.29 Y127.578 E-.16137
G1 X145.44 Y127.181 E-.16137
G1 X145.578 Y126.981 E-.09229
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.015 J-1.217 P1  F30000
G1 X114.637 Y126.603 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.909 Y126.998 E.01593
G1 X115.094 Y127.484 E.01725
G1 X115.157 Y128 E.01725
G1 X115.094 Y128.516 E.01725
G1 X114.909 Y129.002 E.01725
G1 X114.614 Y129.43 E.01725
G1 X114.225 Y129.775 E.01725
G1 X113.765 Y130.016 E.01725
G1 X113.26 Y130.141 E.01725
G1 X112.74 Y130.141 E.01725
G1 X112.235 Y130.016 E.01725
G1 X111.775 Y129.775 E.01724
G1 X111.386 Y129.43 E.01725
G1 X111.091 Y129.002 E.01725
G1 X110.906 Y128.516 E.01725
G1 X110.843 Y128 E.01725
G1 X110.906 Y127.484 E.01725
G1 X111.091 Y126.998 E.01725
G1 X111.386 Y126.57 E.01725
G1 X111.775 Y126.225 E.01725
G1 X112.235 Y125.984 E.01724
G1 X112.74 Y125.859 E.01725
G1 X113.26 Y125.859 E.01725
G1 X113.765 Y125.984 E.01725
G1 X114.225 Y126.225 E.01725
G1 X114.599 Y126.557 E.01657
G1 X114.294 Y126.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.319 Y126.832 E.00102
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.56 Y128.819 E.01305
G1 X114.319 Y129.168 E.01305
G1 X114.001 Y129.45 E.01305
G1 X113.625 Y129.647 E.01305
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.238 Y128 E.01305
G1 X111.29 Y127.578 E.01305
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.249 Y126.77 E.01018
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.03546
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.637 Y128.616 E-.07905
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.062 J1.215 P1  F30000
G1 X149.398 Y130.398 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.602 Y130.398 E1.28693
G1 X110.602 Y125.602 E.15909
G1 X149.398 Y125.602 E1.28693
G1 X149.398 Y130.338 E.1571
G1 X149.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.666 J1.018 P1  F30000
G1 X149.194 Y129.814 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X147.978 Y130.194 E.0298
G1 X148.772 Y130.194 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X149.194 Y129.084 E.04968
G1 X149.194 Y126.916 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X148.772 Y125.806 E.04532
G1 X149.194 Y126.186 F30000
; LINE_WIDTH: 0.329879
G1 F15000
G1 X147.978 Y125.806 E.0298
G1 X146.022 Y125.806 F30000
; LINE_WIDTH: 0.130745
G1 F15000
G1 X145.821 Y125.945 E.00175
; WIPE_START
G1 F24000
G1 X146.022 Y125.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.216 J-.058 P1  F30000
G1 X145.821 Y130.055 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.130745
G1 F15000
G1 X146.022 Y130.194 E.00175
G1 X121.903 Y125.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X120.274 Y125.95 E.05401
G1 X124.374 Y130.05 E.19231
G1 X127.95 Y130.05 E.11864
G1 X132.05 Y125.95 E.19231
G1 X135.626 Y125.95 E.11864
G1 X139.726 Y130.05 E.19231
G1 X143.302 Y130.05 E.11864
G1 X144.617 Y128.735 E.06167
G3 X144.617 Y127.265 I1.735 J-.735 E.0501
G1 X143.302 Y125.95 E.06167
G1 X139.726 Y125.95 E.11864
G1 X135.626 Y130.05 E.19231
G1 X132.05 Y130.05 E.11864
G1 X127.95 Y125.95 E.19231
G1 X124.374 Y125.95 E.11864
G1 X120.274 Y130.05 E.19231
G1 X116.698 Y130.05 E.11864
G1 X115.383 Y128.735 E.06167
G2 X115.383 Y127.265 I-1.735 J-.735 E.0501
G1 X116.698 Y125.95 E.06167
G1 X115.069 Y125.95 E.05401
G1 X114.179 Y125.945 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X113.978 Y125.806 E.00108
G1 X112.022 Y125.806 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X110.806 Y126.186 E.02764
G1 X111.228 Y125.806 F30000
; LINE_WIDTH: 0.556113
G1 F12276.09
G1 X110.806 Y126.916 E.04968
G1 X110.806 Y129.084 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X111.228 Y130.194 E.04968
G1 X110.806 Y129.814 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X112.022 Y130.194 E.02764
G1 X113.978 Y130.194 F30000
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X114.179 Y130.055 E.00108
; WIPE_START
G1 F24000
G1 X113.978 Y130.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.584 J1.067 P1  F30000
G1 X145.386 Y112.998 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.364 Y112.965 E.00132
G1 X145.179 Y112.479 E.01725
G1 X145.117 Y111.963 E.01725
G1 X145.179 Y111.447 E.01725
G1 X145.364 Y110.96 E.01725
G1 X145.659 Y110.533 E.01725
G1 X146.048 Y110.188 E.01725
G1 X146.508 Y109.946 E.01724
G1 X147.013 Y109.822 E.01725
G1 X147.533 Y109.822 E.01725
G1 X148.038 Y109.946 E.01725
G1 X148.498 Y110.188 E.01724
G1 X148.887 Y110.533 E.01725
G1 X149.183 Y110.96 E.01725
G1 X149.367 Y111.447 E.01725
G1 X149.43 Y111.963 E.01725
G1 X149.367 Y112.479 E.01725
G1 X149.183 Y112.965 E.01725
G1 X148.887 Y113.393 E.01725
G1 X148.498 Y113.737 E.01725
G1 X148.038 Y113.979 E.01724
G1 X147.533 Y114.103 E.01725
G1 X147.013 Y114.103 E.01725
G1 X146.508 Y113.979 E.01725
G1 X146.048 Y113.737 E.01724
G1 X145.659 Y113.393 E.01725
G1 X145.42 Y113.047 E.01394
G1 X145.713 Y112.781 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.563 Y112.384 E.01305
G1 X145.512 Y111.963 E.01305
G1 X145.563 Y111.541 E.01305
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.747 Y112.831 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.563 Y112.384 E-.18359
G1 X145.512 Y111.963 E-.16137
G1 X145.563 Y111.541 E-.16137
G1 X145.713 Y111.144 E-.16137
G1 X145.851 Y110.944 E-.09229
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.015 J-1.217 P1  F30000
G1 X114.91 Y110.565 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.183 Y110.96 E.01593
G1 X115.367 Y111.447 E.01725
G1 X115.43 Y111.963 E.01725
G1 X115.367 Y112.479 E.01725
G1 X115.183 Y112.965 E.01725
G1 X114.887 Y113.393 E.01725
G1 X114.498 Y113.737 E.01725
G1 X114.038 Y113.979 E.01725
G1 X113.533 Y114.103 E.01725
G1 X113.013 Y114.103 E.01725
G1 X112.508 Y113.979 E.01725
G1 X112.048 Y113.737 E.01724
G1 X111.659 Y113.393 E.01725
G1 X111.364 Y112.965 E.01725
G1 X111.179 Y112.479 E.01725
G1 X111.117 Y111.963 E.01725
G1 X111.179 Y111.447 E.01725
G1 X111.364 Y110.96 E.01725
M73 P79 R2
G1 X111.659 Y110.533 E.01725
G1 X112.048 Y110.188 E.01725
G1 X112.508 Y109.946 E.01724
G1 X113.013 Y109.822 E.01725
G1 X113.533 Y109.822 E.01725
G1 X114.038 Y109.946 E.01725
G1 X114.498 Y110.188 E.01725
G1 X114.872 Y110.519 E.01657
G1 X114.567 Y110.772 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.592 Y110.795 E.00102
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.833 Y112.781 E.01305
G1 X114.592 Y113.131 E.01305
G1 X114.274 Y113.412 E.01305
G1 X113.898 Y113.61 E.01305
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.512 Y111.963 E.01305
G1 X111.563 Y111.541 E.01305
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.522 Y110.733 E.01018
M204 S10000
; WIPE_START
G1 F24000
G1 X114.592 Y110.795 E-.03546
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.91 Y112.579 E-.07905
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.062 J1.215 P1  F30000
G1 X149.671 Y114.361 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.875 Y114.361 E1.28693
G1 X110.875 Y109.565 E.15909
G1 X149.671 Y109.565 E1.28693
G1 X149.671 Y114.301 E.1571
G1 X150.063 Y114.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.666 J1.018 P1  F30000
G1 X149.467 Y113.776 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X148.251 Y114.157 E.0298
G1 X149.045 Y114.157 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X149.467 Y113.047 E.04968
G1 X149.467 Y110.878 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X149.045 Y109.768 E.04532
G1 X149.467 Y110.149 F30000
; LINE_WIDTH: 0.329879
G1 F15000
G1 X148.251 Y109.768 E.0298
G1 X146.295 Y109.768 F30000
; LINE_WIDTH: 0.130745
G1 F15000
G1 X146.094 Y109.907 E.00175
; WIPE_START
G1 F24000
G1 X146.295 Y109.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.216 J-.058 P1  F30000
G1 X146.094 Y114.018 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.130745
G1 F15000
G1 X146.295 Y114.157 E.00175
G1 X122.176 Y109.913 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X120.547 Y109.913 E.05401
G1 X124.647 Y114.012 E.19231
G1 X128.223 Y114.012 E.11864
G1 X132.323 Y109.913 E.19231
G1 X135.899 Y109.913 E.11864
G1 X139.999 Y114.012 E.19231
G1 X143.575 Y114.012 E.11864
G1 X144.89 Y112.698 E.06167
G3 X144.89 Y111.227 I1.735 J-.735 E.0501
G1 X143.575 Y109.913 E.06167
G1 X139.999 Y109.913 E.11864
G1 X135.899 Y114.012 E.19231
G1 X132.323 Y114.012 E.11864
G1 X128.223 Y109.913 E.19231
G1 X124.647 Y109.913 E.11864
G1 X120.547 Y114.012 E.19231
G1 X116.971 Y114.012 E.11864
G1 X115.656 Y112.698 E.06167
G2 X115.656 Y111.227 I-1.735 J-.735 E.0501
G1 X116.971 Y109.913 E.06167
G1 X115.342 Y109.913 E.05401
G1 X114.452 Y109.907 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969203
G1 F15000
G1 X114.251 Y109.768 E.00108
G1 X112.295 Y109.768 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X111.079 Y110.149 E.02764
G1 X111.501 Y109.768 F30000
; LINE_WIDTH: 0.556113
G1 F12276.09
G1 X111.079 Y110.878 E.04968
G1 X111.079 Y113.047 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X111.501 Y114.157 E.04968
G1 X111.079 Y113.776 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X112.295 Y114.157 E.02764
G1 X114.251 Y114.157 F30000
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X114.452 Y114.018 E.00108
M106 S244.8
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.251 Y114.157 E-.76
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
G3 Z2 I-1.012 J.676 P1  F30000
G1 X146.269 Y162.115 Z2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.057 Y161.793 E.01184
G3 X147.282 Y159.449 I1.419 J-.751 E.09552
G1 X147.671 Y159.449 E.01194
G3 X146.312 Y162.148 I-.194 J1.594 E.18907
M204 S10000
; WIPE_START
G1 F24000
G1 X146.057 Y161.793 E-.1657
G1 X145.912 Y161.434 E-.14726
G1 X145.865 Y161.048 E-.14763
G1 X145.912 Y160.663 E-.14763
G1 X146.034 Y160.341 E-.13082
G1 X146.064 Y160.295 E-.02096
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.059 J-1.216 P1  F30000
G1 X114.902 Y161.799 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X114.676 Y162.111 E.01184
G3 X113.282 Y159.449 I-1.199 J-1.068 E.19061
G1 X113.671 Y159.449 E.01194
G3 X114.919 Y161.748 I-.194 J1.594 E.09395
M204 S10000
; WIPE_START
G1 F24000
G1 X114.676 Y162.111 E-.16611
G1 X114.392 Y162.375 E-.14724
G1 X114.048 Y162.555 E-.14763
G1 X113.671 Y162.648 E-.14763
G1 X113.282 Y162.648 E-.14763
G1 X113.273 Y162.646 E-.00377
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.039 J1.216 P1  F30000
G1 X150.267 Y163.838 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X110.687 Y163.838 E1.21618
G1 X110.687 Y158.258 E.17146
G1 X150.267 Y158.258 E1.21618
G1 X150.267 Y163.778 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.267 Y163.782 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.186 J.273 P1  F30000
G1 X149.491 Y158.466 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X150.059 Y159.034 E.02468
G1 X150.059 Y159.567
G1 X148.958 Y158.466 E.04785
G1 X148.425 Y158.466
G1 X150.059 Y160.1 E.07102
G1 X150.059 Y160.634
G1 X147.892 Y158.466 E.0942
G1 X148.368 Y159.475
G1 X147.358 Y158.466 E.04386
G1 X146.825 Y158.466
G1 X147.6 Y159.241 E.0337
G1 X147.105 Y159.279
G1 X146.292 Y158.466 E.03533
G1 X145.759 Y158.466
G1 X146.705 Y159.412 E.04113
G1 X146.372 Y159.613
G1 X145.225 Y158.466 E.04983
G1 X144.692 Y158.466
G1 X146.095 Y159.869 E.06097
G1 X145.884 Y160.191
G1 X144.159 Y158.466 E.07498
G1 X143.625 Y158.466
G1 X145.726 Y160.567 E.0913
G1 X145.658 Y161.032
G1 X143.092 Y158.466 E.11151
G1 X142.559 Y158.466
G1 X145.79 Y161.697 E.14039
M204 S10000
; WIPE_START
G1 F24000
G1 X144.375 Y160.282 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.026 J1.217 P1  F30000
G1 X149.074 Y160.182 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X150.059 Y161.167 E.0428
G1 X150.059 Y161.7
G1 X149.282 Y160.923 E.03378
G1 X149.251 Y161.425
G1 X150.059 Y162.233 E.03511
G1 X150.059 Y162.767
G1 X149.116 Y161.823 E.041
G1 X148.909 Y162.15
G1 X150.059 Y163.3 E.04997
G1 X149.857 Y163.631
G1 X148.65 Y162.424 E.05247
G1 X148.333 Y162.64
G1 X149.324 Y163.631 E.04307
G1 X148.791 Y163.631
G1 X147.952 Y162.793 E.03644
G1 X147.482 Y162.856
G1 X148.257 Y163.631 E.0337
G1 X147.724 Y163.631
G1 X146.848 Y162.755 E.03808
G1 X147.191 Y163.631
G1 X142.026 Y158.466 E.22445
G1 X141.492 Y158.466
G1 X146.658 Y163.631 E.22445
G1 X146.124 Y163.631
G1 X140.959 Y158.466 E.22445
G1 X140.426 Y158.466
G1 X145.591 Y163.631 E.22445
G1 X145.058 Y163.631
G1 X139.893 Y158.466 E.22445
G1 X139.359 Y158.466
G1 X144.524 Y163.631 E.22445
G1 X143.991 Y163.631
G1 X138.826 Y158.466 E.22445
G1 X138.293 Y158.466
G1 X143.458 Y163.631 E.22445
G1 X142.925 Y163.631
G1 X137.759 Y158.466 E.22445
G1 X137.226 Y158.466
G1 X142.391 Y163.631 E.22445
G1 X141.858 Y163.631
G1 X136.693 Y158.466 E.22445
G1 X136.16 Y158.466
G1 X141.325 Y163.631 E.22445
G1 X140.792 Y163.631
G1 X135.626 Y158.466 E.22445
G1 X135.093 Y158.466
G1 X140.258 Y163.631 E.22445
G1 X139.725 Y163.631
G1 X134.56 Y158.466 E.22445
G1 X134.027 Y158.466
G1 X139.192 Y163.631 E.22445
G1 X138.659 Y163.631
G1 X133.493 Y158.466 E.22445
G1 X132.96 Y158.466
G1 X138.125 Y163.631 E.22445
G1 X137.592 Y163.631
G1 X132.427 Y158.466 E.22445
G1 X131.893 Y158.466
G1 X137.059 Y163.631 E.22445
G1 X136.525 Y163.631
G1 X131.36 Y158.466 E.22445
G1 X130.827 Y158.466
G1 X135.992 Y163.631 E.22445
G1 X135.459 Y163.631
G1 X130.294 Y158.466 E.22445
M73 P80 R2
G1 X129.76 Y158.466
G1 X134.926 Y163.631 E.22445
G1 X134.392 Y163.631
G1 X129.227 Y158.466 E.22445
G1 X128.694 Y158.466
G1 X133.859 Y163.631 E.22445
G1 X133.326 Y163.631
G1 X128.161 Y158.466 E.22445
G1 X127.627 Y158.466
G1 X132.793 Y163.631 E.22445
G1 X132.259 Y163.631
G1 X127.094 Y158.466 E.22445
G1 X126.561 Y158.466
G1 X131.726 Y163.631 E.22445
G1 X131.193 Y163.631
G1 X126.028 Y158.466 E.22445
G1 X125.494 Y158.466
G1 X130.659 Y163.631 E.22445
G1 X130.126 Y163.631
G1 X124.961 Y158.466 E.22445
G1 X124.428 Y158.466
G1 X129.593 Y163.631 E.22445
G1 X129.06 Y163.631
G1 X123.894 Y158.466 E.22445
G1 X123.361 Y158.466
G1 X128.526 Y163.631 E.22445
G1 X127.993 Y163.631
G1 X122.828 Y158.466 E.22445
G1 X122.295 Y158.466
G1 X127.46 Y163.631 E.22445
G1 X126.927 Y163.631
G1 X121.761 Y158.466 E.22445
G1 X121.228 Y158.466
G1 X126.393 Y163.631 E.22445
G1 X125.86 Y163.631
G1 X120.695 Y158.466 E.22445
G1 X120.162 Y158.466
G1 X125.327 Y163.631 E.22445
G1 X124.793 Y163.631
G1 X119.628 Y158.466 E.22445
G1 X119.095 Y158.466
G1 X124.26 Y163.631 E.22445
G1 X123.727 Y163.631
G1 X118.562 Y158.466 E.22445
G1 X118.028 Y158.466
G1 X123.194 Y163.631 E.22445
G1 X122.66 Y163.631
G1 X117.495 Y158.466 E.22445
G1 X116.962 Y158.466
G1 X122.127 Y163.631 E.22445
G1 X121.594 Y163.631
G1 X116.429 Y158.466 E.22445
G1 X115.895 Y158.466
G1 X121.061 Y163.631 E.22445
G1 X120.527 Y163.631
G1 X115.362 Y158.466 E.22445
G1 X114.829 Y158.466
G1 X119.994 Y163.631 E.22445
G1 X119.461 Y163.631
G1 X114.296 Y158.466 E.22445
G1 X113.762 Y158.466
G1 X118.928 Y163.631 E.22445
G1 X118.394 Y163.631
G1 X115.156 Y160.393 E.1407
G1 X115.295 Y161.065
G1 X117.861 Y163.631 E.1115
G1 X117.328 Y163.631
G1 X115.227 Y161.53 E.0913
G1 X115.076 Y161.913
G1 X116.794 Y163.631 E.07467
G1 X116.261 Y163.631
G1 X114.858 Y162.228 E.06096
G1 X114.581 Y162.484
G1 X115.728 Y163.631 E.04983
G1 X115.195 Y163.631
G1 X114.248 Y162.685 E.04113
G1 X113.848 Y162.818
G1 X114.661 Y163.631 E.03533
G1 X114.128 Y163.631
G1 X113.353 Y162.856 E.0337
G1 X112.585 Y162.622
G1 X113.595 Y163.631 E.04386
M204 S10000
; WIPE_START
G1 F24000
G1 X112.585 Y162.622 E-.54245
G1 X113.133 Y162.789 E-.21755
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.171 J.33 P1  F30000
G1 X114.105 Y159.342 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X113.229 Y158.466 E.03808
G1 X112.696 Y158.466
G1 X113.471 Y159.241 E.0337
G1 X113.001 Y159.304
G1 X112.162 Y158.466 E.03644
G1 X111.629 Y158.466
G1 X112.62 Y159.457 E.04307
G1 X112.304 Y159.673
G1 X111.096 Y158.466 E.05247
G1 X110.894 Y158.797
G1 X112.044 Y159.947 E.04997
G1 X111.838 Y160.274
G1 X110.894 Y159.331 E.041
G1 X110.894 Y159.864
G1 X111.702 Y160.672 E.03511
G1 X111.671 Y161.174
G1 X110.894 Y160.397 E.03378
G1 X110.894 Y160.93
G1 X111.879 Y161.915 E.04281
G1 X110.894 Y161.464
G1 X113.062 Y163.631 E.09419
G1 X112.528 Y163.631
G1 X110.894 Y161.997 E.07102
G1 X110.894 Y162.53
G1 X111.995 Y163.631 E.04784
M73 P81 R2
G1 X111.462 Y163.631
G1 X110.894 Y163.063 E.02467
M204 S10000
; WIPE_START
G1 F24000
G1 X111.462 Y163.631 E-.30508
G1 X111.995 Y163.631 E-.20264
G1 X111.526 Y163.162 E-.25227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.869 J.852 P1  F30000
G1 X114.81 Y159.811 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0886314
G1 F15000
G2 X114.516 Y159.535 I-2.416 J2.279 E.0015
; LINE_WIDTH: 0.112153
G1 X114.4 Y159.45 E.00081
; LINE_WIDTH: 0.146704
G1 X114.284 Y159.365 E.00122
; LINE_WIDTH: 0.181256
G1 X114.168 Y159.279 E.00162
; WIPE_START
G1 F24000
G1 X114.284 Y159.365 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.867 J.854 P1  F30000
G1 X115.227 Y160.322 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.169291
G1 F15000
G1 X115.123 Y160.179 E.00183
; LINE_WIDTH: 0.164062
G1 X114.981 Y160.009 E.00218
; LINE_WIDTH: 0.126116
G1 X114.84 Y159.839 E.0015
; WIPE_START
G1 F24000
G1 X114.981 Y160.009 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.896 J-.823 P1  F30000
G1 X112.524 Y162.683 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.194789
G1 F15000
G3 X111.84 Y162.001 I2.431 J-3.124 E.01198
; WIPE_START
G1 F24000
G1 X112.084 Y162.293 E-.29832
G1 X112.4 Y162.591 E-.34069
G1 X112.524 Y162.683 E-.12099
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.149 J.401 P1  F30000
G1 X113.724 Y159.25 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.0904562
G1 F15000
G2 X113.549 Y159.164 I-.789 J1.37 E.00076
; WIPE_START
G1 F24000
G1 X113.724 Y159.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.03 J1.217 P1  F30000
G1 X149.135 Y160.122 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.231744
G1 F15000
G1 X149.008 Y159.969 E.00306
; LINE_WIDTH: 0.187859
G2 X148.456 Y159.434 I-3.006 J2.547 E.00909
; WIPE_START
G1 F24000
G1 X148.869 Y159.804 E-.54783
G1 X149.008 Y159.969 E-.21217
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.755 J-.954 P1  F30000
G1 X146.114 Y162.258 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X145.973 Y162.089 E.00081
; LINE_WIDTH: 0.143454
G3 X145.719 Y161.767 I2.512 J-2.237 E.00336
; WIPE_START
G1 F24000
G1 X145.973 Y162.089 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.816 J.903 P1  F30000
G1 X146.751 Y162.793 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.201302
G1 F15000
G1 X146.594 Y162.677 E.00251
; LINE_WIDTH: 0.154958
G1 X146.431 Y162.556 E.00185
; LINE_WIDTH: 0.110745
G1 X146.142 Y162.285 E.00219
; WIPE_START
G1 F24000
G1 X146.431 Y162.556 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.439 J1.135 P1  F30000
G1 X147.404 Y162.933 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.0945239
G1 F15000
G3 X147.23 Y162.846 I.615 J-1.458 E.00082
G1 X147.423 Y163.597 F30000
; LINE_WIDTH: 0.129444
G1 F15000
G1 X147.24 Y163.632 E.00131
; WIPE_START
G1 F24000
G1 X147.423 Y163.597 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J-.034 P1  F30000
G1 X146.961 Y147.003 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.75 Y146.681 E.01184
G3 X147.975 Y144.336 I1.419 J-.751 E.09552
G1 X148.363 Y144.336 E.01194
G3 X147.004 Y147.035 I-.194 J1.594 E.18907
M204 S10000
; WIPE_START
G1 F24000
G1 X146.75 Y146.681 E-.1657
G1 X146.604 Y146.321 E-.14726
G1 X146.557 Y145.936 E-.14763
G1 X146.604 Y145.55 E-.14763
G1 X146.726 Y145.228 E-.13082
G1 X146.756 Y145.182 E-.02096
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.059 J-1.216 P1  F30000
G1 X115.595 Y146.687 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X115.368 Y146.998 E.01184
G3 X113.975 Y144.336 I-1.199 J-1.068 E.19061
G1 X114.363 Y144.336 E.01194
G3 X115.611 Y146.635 I-.194 J1.594 E.09395
M204 S10000
; WIPE_START
G1 F24000
G1 X115.368 Y146.998 E-.16611
G1 X115.084 Y147.262 E-.14724
G1 X114.74 Y147.443 E-.14763
G1 X114.363 Y147.536 E-.14763
G1 X113.975 Y147.536 E-.14763
G1 X113.965 Y147.533 E-.00377
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.039 J1.216 P1  F30000
G1 X150.959 Y148.726 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X111.379 Y148.726 E1.21618
G1 X111.379 Y143.146 E.17146
G1 X150.959 Y143.146 E1.21618
G1 X150.959 Y148.666 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.959 Y148.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.186 J.273 P1  F30000
G1 X150.184 Y143.353 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X150.752 Y143.921 E.02468
G1 X150.752 Y144.454
G1 X149.65 Y143.353 E.04785
G1 X149.117 Y143.353
G1 X150.752 Y144.988 E.07102
G1 X150.752 Y145.521
G1 X148.584 Y143.353 E.0942
G1 X149.06 Y144.362
G1 X148.051 Y143.353 E.04386
G1 X147.517 Y143.353
G1 X148.293 Y144.129 E.0337
G1 X147.797 Y144.166
G1 X146.984 Y143.353 E.03533
G1 X146.451 Y143.353
G1 X147.397 Y144.3 E.04113
G1 X147.064 Y144.5
G1 X145.918 Y143.353 E.04983
G1 X145.384 Y143.353
G1 X146.787 Y144.756 E.06097
G1 X146.576 Y145.079
G1 X144.851 Y143.353 E.07498
G1 X144.318 Y143.353
G1 X146.419 Y145.454 E.0913
G1 X146.35 Y145.919
G1 X143.784 Y143.353 E.11151
G1 X143.251 Y143.353
G1 X146.482 Y146.584 E.14039
M204 S10000
; WIPE_START
G1 F24000
G1 X145.068 Y145.17 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.026 J1.217 P1  F30000
G1 X149.767 Y145.069 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X150.752 Y146.054 E.0428
G1 X150.752 Y146.587
G1 X149.974 Y145.81 E.03378
G1 X149.944 Y146.313
G1 X150.752 Y147.121 E.03511
G1 X150.752 Y147.654
G1 X149.808 Y146.71 E.041
G1 X149.602 Y147.037
G1 X150.752 Y148.187 E.04997
G1 X150.549 Y148.518
G1 X149.342 Y147.311 E.05247
G1 X149.025 Y147.527
G1 X150.016 Y148.518 E.04307
G1 X149.483 Y148.518
G1 X148.644 Y147.68 E.03644
G1 X148.174 Y147.743
G1 X148.95 Y148.518 E.0337
G1 X148.416 Y148.518
G1 X147.54 Y147.642 E.03808
G1 X147.883 Y148.518
G1 X142.718 Y143.353 E.22445
G1 X142.185 Y143.353
G1 X147.35 Y148.518 E.22445
G1 X146.817 Y148.518
G1 X141.651 Y143.353 E.22445
G1 X141.118 Y143.353
G1 X146.283 Y148.518 E.22445
G1 X145.75 Y148.518
G1 X140.585 Y143.353 E.22445
G1 X140.052 Y143.353
G1 X145.217 Y148.518 E.22445
G1 X144.683 Y148.518
G1 X139.518 Y143.353 E.22445
G1 X138.985 Y143.353
G1 X144.15 Y148.518 E.22445
G1 X143.617 Y148.518
G1 X138.452 Y143.353 E.22445
G1 X137.918 Y143.353
G1 X143.084 Y148.518 E.22445
G1 X142.55 Y148.518
G1 X137.385 Y143.353 E.22445
G1 X136.852 Y143.353
G1 X142.017 Y148.518 E.22445
G1 X141.484 Y148.518
G1 X136.319 Y143.353 E.22445
G1 X135.785 Y143.353
G1 X140.951 Y148.518 E.22445
G1 X140.417 Y148.518
G1 X135.252 Y143.353 E.22445
G1 X134.719 Y143.353
G1 X139.884 Y148.518 E.22445
G1 X139.351 Y148.518
G1 X134.186 Y143.353 E.22445
G1 X133.652 Y143.353
G1 X138.818 Y148.518 E.22445
G1 X138.284 Y148.518
G1 X133.119 Y143.353 E.22445
G1 X132.586 Y143.353
G1 X137.751 Y148.518 E.22445
G1 X137.218 Y148.518
G1 X132.052 Y143.353 E.22445
G1 X131.519 Y143.353
G1 X136.684 Y148.518 E.22445
G1 X136.151 Y148.518
G1 X130.986 Y143.353 E.22445
G1 X130.453 Y143.353
G1 X135.618 Y148.518 E.22445
G1 X135.085 Y148.518
G1 X129.919 Y143.353 E.22445
G1 X129.386 Y143.353
G1 X134.551 Y148.518 E.22445
G1 X134.018 Y148.518
G1 X128.853 Y143.353 E.22445
M73 P82 R2
G1 X128.32 Y143.353
G1 X133.485 Y148.518 E.22445
G1 X132.952 Y148.518
G1 X127.786 Y143.353 E.22445
G1 X127.253 Y143.353
G1 X132.418 Y148.518 E.22445
G1 X131.885 Y148.518
G1 X126.72 Y143.353 E.22445
G1 X126.187 Y143.353
G1 X131.352 Y148.518 E.22445
G1 X130.818 Y148.518
G1 X125.653 Y143.353 E.22445
G1 X125.12 Y143.353
G1 X130.285 Y148.518 E.22445
G1 X129.752 Y148.518
G1 X124.587 Y143.353 E.22445
G1 X124.053 Y143.353
G1 X129.219 Y148.518 E.22445
G1 X128.685 Y148.518
G1 X123.52 Y143.353 E.22445
G1 X122.987 Y143.353
G1 X128.152 Y148.518 E.22445
G1 X127.619 Y148.518
G1 X122.454 Y143.353 E.22445
G1 X121.92 Y143.353
G1 X127.086 Y148.518 E.22445
G1 X126.552 Y148.518
G1 X121.387 Y143.353 E.22445
G1 X120.854 Y143.353
G1 X126.019 Y148.518 E.22445
G1 X125.486 Y148.518
G1 X120.321 Y143.353 E.22445
G1 X119.787 Y143.353
G1 X124.952 Y148.518 E.22445
G1 X124.419 Y148.518
G1 X119.254 Y143.353 E.22445
G1 X118.721 Y143.353
G1 X123.886 Y148.518 E.22445
G1 X123.353 Y148.518
G1 X118.187 Y143.353 E.22445
G1 X117.654 Y143.353
G1 X122.819 Y148.518 E.22445
G1 X122.286 Y148.518
G1 X117.121 Y143.353 E.22445
G1 X116.588 Y143.353
G1 X121.753 Y148.518 E.22445
G1 X121.22 Y148.518
G1 X116.054 Y143.353 E.22445
G1 X115.521 Y143.353
G1 X120.686 Y148.518 E.22445
G1 X120.153 Y148.518
G1 X114.988 Y143.353 E.22445
G1 X114.455 Y143.353
G1 X119.62 Y148.518 E.22445
G1 X119.087 Y148.518
G1 X115.849 Y145.28 E.1407
G1 X115.987 Y145.953
G1 X118.553 Y148.518 E.1115
G1 X118.02 Y148.518
G1 X115.919 Y146.417 E.0913
G1 X115.768 Y146.8
G1 X117.487 Y148.518 E.07467
G1 X116.953 Y148.518
G1 X115.551 Y147.115 E.06096
G1 X115.273 Y147.372
G1 X116.42 Y148.518 E.04983
G1 X115.887 Y148.518
G1 X114.94 Y147.572 E.04113
G1 X114.541 Y147.705
G1 X115.354 Y148.518 E.03533
G1 X114.82 Y148.518
G1 X114.045 Y147.743 E.0337
G1 X113.278 Y147.509
G1 X114.287 Y148.518 E.04386
M204 S10000
; WIPE_START
G1 F24000
G1 X113.278 Y147.509 E-.54245
G1 X113.825 Y147.676 E-.21755
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.171 J.33 P1  F30000
G1 X114.798 Y144.229 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X113.921 Y143.353 E.03808
G1 X113.388 Y143.353
G1 X114.163 Y144.129 E.0337
G1 X113.693 Y144.192
G1 X112.855 Y143.353 E.03644
G1 X112.321 Y143.353
G1 X113.313 Y144.344 E.04307
G1 X112.996 Y144.561
G1 X111.788 Y143.353 E.05247
G1 X111.586 Y143.685
G1 X112.736 Y144.834 E.04997
G1 X112.53 Y145.161
G1 X111.586 Y144.218 E.041
G1 X111.586 Y144.751
G1 X112.394 Y145.559 E.03511
G1 X112.364 Y146.062
G1 X111.586 Y145.284 E.03378
G1 X111.586 Y145.818
G1 X112.571 Y146.803 E.04281
G1 X111.586 Y146.351
G1 X113.754 Y148.518 E.09419
G1 X113.221 Y148.518
G1 X111.586 Y146.884 E.07102
G1 X111.586 Y147.417
G1 X112.687 Y148.518 E.04784
G1 X112.154 Y148.518
G1 X111.586 Y147.951 E.02467
M204 S10000
; WIPE_START
G1 F24000
G1 X112.154 Y148.518 E-.30508
G1 X112.687 Y148.518 E-.20264
G1 X112.218 Y148.049 E-.25227
; WIPE_END
G1 E-.04 F1800
G17
M73 P83 R2
G3 Z2.2 I.869 J.852 P1  F30000
G1 X115.502 Y144.698 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0886314
G1 F15000
G2 X115.208 Y144.423 I-2.416 J2.279 E.0015
; LINE_WIDTH: 0.112153
G1 X115.092 Y144.337 E.00081
; LINE_WIDTH: 0.146704
G1 X114.976 Y144.252 E.00122
; LINE_WIDTH: 0.181256
G1 X114.86 Y144.167 E.00162
; WIPE_START
G1 F24000
G1 X114.976 Y144.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.867 J.854 P1  F30000
G1 X115.919 Y145.21 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.169291
G1 F15000
G1 X115.815 Y145.066 E.00183
; LINE_WIDTH: 0.164062
G1 X115.674 Y144.896 E.00218
; LINE_WIDTH: 0.126116
G1 X115.532 Y144.727 E.0015
; WIPE_START
G1 F24000
G1 X115.674 Y144.896 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.896 J-.823 P1  F30000
G1 X113.216 Y147.57 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.194789
G1 F15000
G3 X112.532 Y146.889 I2.431 J-3.124 E.01198
; WIPE_START
G1 F24000
G1 X112.776 Y147.18 E-.29832
G1 X113.093 Y147.478 E-.34069
G1 X113.216 Y147.57 E-.12099
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.149 J.401 P1  F30000
G1 X114.416 Y144.138 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.0904562
G1 F15000
G2 X114.241 Y144.051 I-.789 J1.37 E.00076
; WIPE_START
G1 F24000
G1 X114.416 Y144.138 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.03 J1.217 P1  F30000
G1 X149.827 Y145.009 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.231744
G1 F15000
G1 X149.7 Y144.856 E.00306
; LINE_WIDTH: 0.187859
G2 X149.148 Y144.321 I-3.006 J2.547 E.00909
; WIPE_START
G1 F24000
G1 X149.561 Y144.691 E-.54783
G1 X149.7 Y144.856 E-.21217
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.755 J-.954 P1  F30000
G1 X146.806 Y147.145 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X146.665 Y146.976 E.00081
; LINE_WIDTH: 0.143454
G3 X146.412 Y146.654 I2.512 J-2.237 E.00336
; WIPE_START
G1 F24000
G1 X146.665 Y146.976 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.816 J.903 P1  F30000
G1 X147.443 Y147.68 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.201302
G1 F15000
G1 X147.286 Y147.565 E.00251
; LINE_WIDTH: 0.154958
G1 X147.123 Y147.444 E.00185
; LINE_WIDTH: 0.110745
G1 X146.834 Y147.172 E.00219
; WIPE_START
G1 F24000
G1 X147.123 Y147.444 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.439 J1.135 P1  F30000
G1 X148.097 Y147.821 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.0945239
G1 F15000
G3 X147.922 Y147.734 I.615 J-1.458 E.00082
G1 X148.116 Y148.484 F30000
; LINE_WIDTH: 0.129444
G1 F15000
G1 X147.933 Y148.519 E.00131
; WIPE_START
G1 F24000
G1 X148.116 Y148.484 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.203 J-.186 P1  F30000
G1 X145.113 Y129.035 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.091 Y129.002 E.00132
G1 X144.906 Y128.516 E.01725
G1 X144.844 Y128 E.01725
G1 X144.906 Y127.484 E.01725
G1 X145.091 Y126.998 E.01725
G1 X145.386 Y126.57 E.01725
G1 X145.775 Y126.225 E.01725
G1 X146.235 Y125.984 E.01725
G1 X146.74 Y125.859 E.01725
G1 X147.26 Y125.859 E.01725
G1 X147.765 Y125.984 E.01725
G1 X148.225 Y126.225 E.01724
G1 X148.614 Y126.57 E.01725
G1 X148.909 Y126.998 E.01725
G1 X149.094 Y127.484 E.01725
G1 X149.157 Y128 E.01725
G1 X149.094 Y128.516 E.01725
G1 X148.909 Y129.002 E.01725
G1 X148.614 Y129.43 E.01725
G1 X148.225 Y129.775 E.01725
G1 X147.765 Y130.016 E.01725
G1 X147.26 Y130.141 E.01725
G1 X146.74 Y130.141 E.01725
G1 X146.235 Y130.016 E.01725
G1 X145.775 Y129.775 E.01724
G1 X145.386 Y129.43 E.01725
G1 X145.147 Y129.084 E.01394
G1 X145.44 Y128.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.29 Y128.422 E.01305
G1 X145.238 Y128 E.01305
G1 X145.29 Y127.578 E.01305
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.474 Y128.868 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.29 Y128.422 E-.18359
G1 X145.238 Y128 E-.16137
G1 X145.29 Y127.578 E-.16137
G1 X145.44 Y127.181 E-.16137
G1 X145.578 Y126.981 E-.09229
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.022 J-1.217 P1  F30000
G1 X114.438 Y126.414 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.614 Y126.57 E.0078
G1 X114.909 Y126.998 E.01725
G1 X115.094 Y127.484 E.01725
G1 X115.157 Y128 E.01725
G1 X115.094 Y128.516 E.01725
G1 X114.909 Y129.002 E.01725
G1 X114.614 Y129.43 E.01725
G1 X114.225 Y129.775 E.01725
G1 X113.765 Y130.016 E.01725
G1 X113.26 Y130.141 E.01725
G1 X112.74 Y130.141 E.01725
G1 X112.235 Y130.016 E.01725
G1 X111.775 Y129.775 E.01724
G1 X111.386 Y129.43 E.01725
G1 X111.091 Y129.002 E.01725
G1 X110.906 Y128.516 E.01725
G1 X110.844 Y128 E.01725
G1 X110.906 Y127.484 E.01725
G1 X111.091 Y126.998 E.01725
G1 X111.386 Y126.57 E.01725
G1 X111.775 Y126.225 E.01725
G1 X112.235 Y125.984 E.01725
G1 X112.74 Y125.859 E.01725
G1 X113.26 Y125.859 E.01725
G1 X113.765 Y125.984 E.01725
G1 X114.225 Y126.225 E.01724
G1 X114.393 Y126.374 E.00746
G1 X114.285 Y126.803 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.319 Y126.832 E.00136
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.56 Y128.819 E.01305
G1 X114.319 Y129.168 E.01305
G1 X114.001 Y129.45 E.01305
G1 X113.625 Y129.647 E.01305
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.238 Y128 E.01305
G1 X111.29 Y127.578 E.01305
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.178 Y126.708 E.00729
G1 X114.24 Y126.763 E.00255
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.03962
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.64 Y128.606 E-.07489
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.063 J1.215 P1  F30000
G1 X149.398 Y130.398 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.602 Y130.398 E1.28693
G1 X110.602 Y125.602 E.15909
G1 X149.398 Y125.602 E1.28693
G1 X149.398 Y130.338 E.1571
G1 X149.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.666 J1.018 P1  F30000
G1 X149.194 Y129.814 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X147.978 Y130.194 E.0298
G1 X148.772 Y130.194 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X149.194 Y129.084 E.04968
G1 X149.194 Y126.916 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X148.772 Y125.806 E.04532
G1 X149.194 Y126.186 F30000
; LINE_WIDTH: 0.329879
G1 F15000
G1 X147.978 Y125.806 E.0298
G1 X146.022 Y125.806 F30000
; LINE_WIDTH: 0.130748
G1 F15000
G1 X145.821 Y125.945 E.00175
G1 X144.587 Y127.344 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.115 Y125.95 E.04944
G1 X114.885 Y125.95 E1.0028
G1 X115.229 Y126.858 E.0322
G3 X115.434 Y128.6 I-2.523 J1.181 E.0592
G1 X114.885 Y130.05 E.05143
G1 X145.115 Y130.05 E1.0028
G1 X144.566 Y128.6 E.05143
G3 X144.566 Y127.4 I2.435 J-.6 E.0402
G1 X145.821 Y130.055 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130745
G1 F15000
G1 X146.022 Y130.194 E.00175
G1 X142.081 Y129.643 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.709 Y129.643 E.05401
G1 X144.301 Y129.051 E.02776
G3 X144.301 Y126.949 I2.239 J-1.051 E.072
G1 X143.709 Y126.357 E.02776
G1 X139.319 Y126.357 E.14565
G1 X136.033 Y129.643 E.15411
G1 X139.319 Y129.643 E.10897
G1 X136.033 Y126.357 E.15411
G1 X131.643 Y126.357 E.14565
G1 X128.357 Y129.643 E.15411
G1 X131.643 Y129.643 E.10897
G1 X128.357 Y126.357 E.15411
G1 X126.729 Y126.357 E.05401
G1 X125.595 Y129.643 F30000
G1 F15476.087
G1 X123.967 Y129.643 E.05401
G1 X120.681 Y126.357 E.15411
G1 X123.967 Y126.357 E.10897
G1 X120.681 Y129.643 E.15411
G1 X116.291 Y129.643 E.14565
G1 X115.699 Y129.051 E.02776
G2 X115.699 Y126.949 I-2.239 J-1.051 E.072
G1 X116.291 Y126.357 E.02776
G1 X117.919 Y126.357 E.05401
G1 X114.179 Y125.945 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969194
G1 F15000
G1 X113.978 Y125.806 E.00108
G1 X112.022 Y125.806 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X110.806 Y126.186 E.02764
G1 X111.228 Y125.806 F30000
; LINE_WIDTH: 0.556113
G1 F12276.09
G1 X110.806 Y126.916 E.04968
G1 X110.806 Y129.084 F30000
; LINE_WIDTH: 0.556112
G1 F12276.107
G1 X111.228 Y130.194 E.04968
G1 X110.806 Y129.814 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X112.022 Y130.194 E.02764
G1 X113.978 Y130.194 F30000
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X114.179 Y130.055 E.00108
; WIPE_START
G1 F24000
G1 X113.978 Y130.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.584 J1.067 P1  F30000
G1 X145.386 Y112.997 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.364 Y112.965 E.00132
G1 X145.179 Y112.479 E.01725
G1 X145.117 Y111.963 E.01725
G1 X145.179 Y111.447 E.01725
G1 X145.364 Y110.96 E.01725
G1 X145.659 Y110.533 E.01725
G1 X146.048 Y110.188 E.01725
G1 X146.508 Y109.946 E.01725
G1 X147.013 Y109.822 E.01725
G1 X147.533 Y109.822 E.01725
G1 X148.038 Y109.946 E.01725
G1 X148.498 Y110.188 E.01724
G1 X148.887 Y110.533 E.01725
G1 X149.183 Y110.96 E.01725
G1 X149.367 Y111.447 E.01725
G1 X149.43 Y111.963 E.01725
G1 X149.367 Y112.479 E.01725
G1 X149.183 Y112.965 E.01725
G1 X148.887 Y113.393 E.01725
G1 X148.498 Y113.737 E.01725
G1 X148.038 Y113.979 E.01725
M73 P84 R2
G1 X147.533 Y114.103 E.01725
G1 X147.013 Y114.103 E.01725
G1 X146.508 Y113.979 E.01725
G1 X146.048 Y113.737 E.01724
G1 X145.659 Y113.393 E.01725
G1 X145.42 Y113.047 E.01394
G1 X145.713 Y112.781 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.563 Y112.384 E.01305
G1 X145.512 Y111.963 E.01305
G1 X145.563 Y111.541 E.01305
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.747 Y112.831 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.563 Y112.384 E-.18359
G1 X145.512 Y111.963 E-.16137
G1 X145.563 Y111.541 E-.16137
G1 X145.713 Y111.144 E-.16137
G1 X145.851 Y110.944 E-.09229
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.022 J-1.217 P1  F30000
G1 X114.711 Y110.377 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.887 Y110.533 E.0078
G1 X115.183 Y110.96 E.01725
G1 X115.367 Y111.447 E.01725
G1 X115.43 Y111.963 E.01725
G1 X115.367 Y112.479 E.01725
G1 X115.183 Y112.965 E.01725
G1 X114.887 Y113.393 E.01725
G1 X114.498 Y113.737 E.01725
G1 X114.038 Y113.979 E.01725
G1 X113.533 Y114.103 E.01725
G1 X113.013 Y114.103 E.01725
G1 X112.508 Y113.979 E.01725
G1 X112.048 Y113.737 E.01724
G1 X111.659 Y113.393 E.01725
G1 X111.364 Y112.965 E.01725
G1 X111.179 Y112.479 E.01725
G1 X111.117 Y111.963 E.01725
G1 X111.179 Y111.447 E.01725
G1 X111.364 Y110.96 E.01725
G1 X111.659 Y110.533 E.01725
G1 X112.048 Y110.188 E.01725
G1 X112.508 Y109.946 E.01725
G1 X113.013 Y109.822 E.01725
G1 X113.533 Y109.822 E.01725
G1 X114.038 Y109.946 E.01725
G1 X114.498 Y110.188 E.01724
G1 X114.666 Y110.337 E.00746
G1 X114.558 Y110.765 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.592 Y110.795 E.00136
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.833 Y112.781 E.01305
G1 X114.592 Y113.131 E.01305
G1 X114.274 Y113.412 E.01305
G1 X113.898 Y113.61 E.01305
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.512 Y111.963 E.01305
G1 X111.563 Y111.541 E.01305
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.451 Y110.67 E.00729
G1 X114.514 Y110.725 E.00255
M204 S10000
; WIPE_START
G1 F24000
M73 P84 R1
G1 X114.592 Y110.795 E-.03962
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.914 Y112.568 E-.07489
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.063 J1.215 P1  F30000
G1 X149.671 Y114.361 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.875 Y114.361 E1.28693
G1 X110.875 Y109.565 E.15909
G1 X149.671 Y109.565 E1.28693
G1 X149.671 Y114.301 E.1571
G1 X150.063 Y114.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.666 J1.018 P1  F30000
G1 X149.467 Y113.776 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F15000
G1 X148.251 Y114.157 E.0298
G1 X149.045 Y114.157 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X149.467 Y113.047 E.04968
G1 X149.467 Y110.878 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X149.045 Y109.768 E.04532
G1 X149.467 Y110.149 F30000
; LINE_WIDTH: 0.329879
G1 F15000
G1 X148.251 Y109.768 E.0298
G1 X146.295 Y109.768 F30000
; LINE_WIDTH: 0.130748
G1 F15000
G1 X146.094 Y109.907 E.00175
G1 X144.86 Y111.306 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.388 Y109.913 E.04944
G1 X115.158 Y109.913 E1.0028
G1 X115.502 Y110.821 E.0322
G3 X115.708 Y112.563 I-2.523 J1.181 E.0592
G1 X115.158 Y114.012 E.05143
G1 X145.388 Y114.012 E1.0028
G1 X144.839 Y112.563 E.05143
G3 X144.839 Y111.363 I2.435 J-.6 E.0402
G1 X146.094 Y114.018 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130745
G1 F15000
G1 X146.295 Y114.157 E.00175
G1 X142.354 Y113.605 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.982 Y113.605 E.05401
G1 X144.574 Y113.013 E.02776
G3 X144.574 Y110.912 I2.239 J-1.051 E.072
G1 X143.982 Y110.32 E.02776
G1 X139.592 Y110.32 E.14565
G1 X136.306 Y113.605 E.15411
G1 X139.592 Y113.605 E.10897
G1 X136.306 Y110.32 E.15411
G1 X131.916 Y110.32 E.14565
G1 X128.63 Y113.605 E.15411
G1 X131.916 Y113.605 E.10897
G1 X128.63 Y110.32 E.15411
G1 X127.002 Y110.32 E.05401
G1 X125.868 Y113.605 F30000
G1 F15476.087
G1 X124.24 Y113.605 E.05401
G1 X120.955 Y110.32 E.15411
G1 X124.24 Y110.32 E.10897
G1 X120.955 Y113.605 E.15411
G1 X116.564 Y113.605 E.14565
G1 X115.972 Y113.013 E.02776
G2 X115.972 Y110.912 I-2.239 J-1.051 E.072
G1 X116.564 Y110.32 E.02776
G1 X118.192 Y110.32 E.05401
G1 X114.452 Y109.907 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969194
G1 F15000
G1 X114.251 Y109.768 E.00108
G1 X112.295 Y109.768 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X111.079 Y110.149 E.02764
G1 X111.501 Y109.768 F30000
; LINE_WIDTH: 0.556113
G1 F12276.09
G1 X111.079 Y110.878 E.04968
G1 X111.079 Y113.047 F30000
; LINE_WIDTH: 0.556112
G1 F12276.107
G1 X111.501 Y114.157 E.04968
G1 X111.079 Y113.776 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X112.295 Y114.157 E.02764
G1 X114.251 Y114.157 F30000
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X114.452 Y114.018 E.00108
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.251 Y114.157 E-.76
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
G3 Z2.2 I-.528 J1.096 P1  F30000
G1 X145.113 Y129.035 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6346
G1 X145.091 Y129.002 E.00131
G1 X144.906 Y128.516 E.01725
G1 X144.844 Y128 E.01725
G1 X144.906 Y127.484 E.01725
G1 X145.091 Y126.998 E.01725
G1 X145.386 Y126.57 E.01725
G1 X145.775 Y126.225 E.01725
G1 X146.235 Y125.984 E.01724
G1 X146.74 Y125.859 E.01725
G1 X147.26 Y125.859 E.01725
G1 X147.765 Y125.984 E.01725
G1 X148.225 Y126.225 E.01724
G1 X148.614 Y126.57 E.01725
G1 X148.909 Y126.998 E.01725
G1 X149.094 Y127.484 E.01725
G1 X149.157 Y128 E.01725
G1 X149.094 Y128.516 E.01725
G1 X148.909 Y129.002 E.01725
G1 X148.614 Y129.43 E.01725
G1 X148.225 Y129.775 E.01725
G1 X147.765 Y130.016 E.01724
G1 X147.26 Y130.141 E.01725
G1 X146.74 Y130.141 E.01725
G1 X146.235 Y130.016 E.01725
G1 X145.775 Y129.775 E.01724
G1 X145.386 Y129.43 E.01725
G1 X145.147 Y129.084 E.01394
G1 X145.44 Y128.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6346
G1 X145.29 Y128.422 E.01305
G1 X145.238 Y128 E.01305
G1 X145.29 Y127.578 E.01305
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.474 Y128.868 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.29 Y128.422 E-.18359
G1 X145.238 Y128 E-.16137
G1 X145.29 Y127.578 E-.16137
G1 X145.44 Y127.181 E-.16137
G1 X145.578 Y126.981 E-.09229
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.022 J-1.217 P1  F30000
G1 X114.457 Y126.431 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6346
G1 X114.614 Y126.57 E.00697
G1 X114.909 Y126.998 E.01725
G1 X115.094 Y127.484 E.01725
G1 X115.157 Y128 E.01725
G1 X115.094 Y128.516 E.01725
G1 X114.909 Y129.002 E.01725
G1 X114.614 Y129.43 E.01725
G1 X114.225 Y129.775 E.01725
G1 X113.765 Y130.016 E.01725
G1 X113.26 Y130.141 E.01725
G1 X112.74 Y130.141 E.01725
G1 X112.235 Y130.016 E.01725
G1 X111.775 Y129.775 E.01725
G1 X111.386 Y129.43 E.01725
G1 X111.091 Y129.002 E.01725
G1 X110.906 Y128.516 E.01725
G1 X110.844 Y128 E.01724
G1 X110.906 Y127.484 E.01725
G1 X111.091 Y126.998 E.01725
G1 X111.386 Y126.57 E.01725
G1 X111.775 Y126.225 E.01725
G1 X112.235 Y125.984 E.01724
G1 X112.74 Y125.859 E.01725
G1 X113.26 Y125.859 E.01725
G1 X113.765 Y125.984 E.01725
G1 X114.225 Y126.225 E.01724
G1 X114.412 Y126.391 E.00829
G1 X114.283 Y126.8 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6346
G1 X114.319 Y126.832 E.00147
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.56 Y128.819 E.01305
G1 X114.319 Y129.168 E.01305
G1 X114.001 Y129.45 E.01305
G1 X113.625 Y129.647 E.01305
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.238 Y128 E.01305
G1 X111.29 Y127.578 E.01305
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.197 Y126.724 E.00806
G1 X114.238 Y126.76 E.00168
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.04099
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.642 Y128.602 E-.07352
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.063 J1.215 P1  F30000
G1 X149.398 Y130.398 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6346
G1 X110.602 Y130.398 E1.28693
G1 X110.602 Y125.602 E.15909
G1 X149.398 Y125.602 E1.28693
G1 X149.398 Y130.338 E.1571
G1 X149.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6346
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.666 J1.018 P1  F30000
G1 X149.194 Y129.814 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F6346
G1 X147.978 Y130.194 E.0298
G1 X148.772 Y130.194 F30000
; LINE_WIDTH: 0.556112
G1 F6346
G1 X149.194 Y129.084 E.04968
G1 X149.194 Y126.916 F30000
; LINE_WIDTH: 0.511111
G1 F6346
G1 X148.772 Y125.806 E.04532
G1 X149.194 Y126.186 F30000
; LINE_WIDTH: 0.329879
G1 F6346
G1 X147.978 Y125.806 E.0298
G1 X146.022 Y125.806 F30000
; LINE_WIDTH: 0.130745
G1 F6346
G1 X145.821 Y125.945 E.00175
G1 X144.587 Y127.344 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6346
G1 X145.115 Y125.95 E.04944
G1 X114.885 Y125.95 E1.0028
G1 X115.434 Y127.4 E.05143
G3 X115.434 Y128.6 I-2.435 J.6 E.0402
G1 X114.885 Y130.05 E.05143
G1 X145.115 Y130.05 E1.0028
G1 X144.566 Y128.6 E.05143
G3 X144.566 Y127.4 I2.435 J-.6 E.0402
G1 X145.821 Y130.055 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130746
G1 F6346
G1 X146.022 Y130.194 E.00175
G1 X142.081 Y129.643 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6346
G1 X143.709 Y129.643 E.05401
G1 X144.301 Y129.051 E.02776
G3 X144.301 Y126.949 I2.239 J-1.051 E.072
G1 X143.709 Y126.357 E.02776
G1 X139.319 Y126.357 E.14565
G1 X136.033 Y129.643 E.15411
G1 X139.319 Y129.643 E.10897
G1 X136.033 Y126.357 E.15411
G1 X131.643 Y126.357 E.14565
M73 P85 R1
G1 X128.357 Y129.643 E.15411
G1 X131.643 Y129.643 E.10897
G1 X128.357 Y126.357 E.15411
G1 X126.729 Y126.357 E.05401
G1 X125.595 Y129.643 F30000
G1 F6346
G1 X123.967 Y129.643 E.05401
G1 X120.681 Y126.357 E.15411
G1 X123.967 Y126.357 E.10897
G1 X120.681 Y129.643 E.15411
G1 X116.291 Y129.643 E.14565
G1 X115.699 Y129.051 E.02776
G2 X115.699 Y126.949 I-2.239 J-1.051 E.072
G1 X116.291 Y126.357 E.02776
G1 X117.919 Y126.357 E.05401
G1 X114.179 Y125.945 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969194
G1 F6346
G1 X113.978 Y125.806 E.00108
G1 X112.022 Y125.806 F30000
; LINE_WIDTH: 0.309036
G1 F6346
G1 X110.806 Y126.186 E.02764
G1 X111.228 Y125.806 F30000
; LINE_WIDTH: 0.556113
G1 F6346
G1 X110.806 Y126.916 E.04968
G1 X110.806 Y129.084 F30000
; LINE_WIDTH: 0.556114
G1 F6346
G1 X111.228 Y130.194 E.04968
G1 X110.806 Y129.814 F30000
; LINE_WIDTH: 0.309036
G1 F6346
G1 X112.022 Y130.194 E.02764
G1 X113.978 Y130.194 F30000
; LINE_WIDTH: 0.0969195
G1 F6346
G1 X114.179 Y130.055 E.00108
; WIPE_START
G1 F24000
G1 X113.978 Y130.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.584 J1.067 P1  F30000
G1 X145.386 Y112.997 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6346
G1 X145.364 Y112.965 E.00131
G1 X145.179 Y112.479 E.01725
G1 X145.117 Y111.963 E.01725
G1 X145.179 Y111.447 E.01725
G1 X145.364 Y110.96 E.01725
G1 X145.659 Y110.533 E.01725
G1 X146.048 Y110.188 E.01725
G1 X146.508 Y109.946 E.01724
G1 X147.013 Y109.822 E.01725
G1 X147.533 Y109.822 E.01725
G1 X148.038 Y109.946 E.01725
G1 X148.498 Y110.188 E.01724
G1 X148.887 Y110.533 E.01725
G1 X149.183 Y110.96 E.01725
G1 X149.367 Y111.447 E.01725
G1 X149.43 Y111.963 E.01725
G1 X149.367 Y112.479 E.01725
G1 X149.183 Y112.965 E.01725
G1 X148.887 Y113.393 E.01725
G1 X148.498 Y113.737 E.01725
G1 X148.038 Y113.979 E.01724
G1 X147.533 Y114.103 E.01725
G1 X147.013 Y114.103 E.01725
G1 X146.508 Y113.979 E.01725
G1 X146.048 Y113.737 E.01724
G1 X145.659 Y113.393 E.01725
G1 X145.42 Y113.047 E.01394
G1 X145.713 Y112.781 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6346
G1 X145.563 Y112.384 E.01305
G1 X145.512 Y111.963 E.01305
G1 X145.563 Y111.541 E.01305
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.747 Y112.831 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X145.563 Y112.384 E-.18359
G1 X145.512 Y111.963 E-.16137
G1 X145.563 Y111.541 E-.16137
G1 X145.713 Y111.144 E-.16137
G1 X145.851 Y110.944 E-.09229
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.022 J-1.217 P1  F30000
G1 X114.73 Y110.393 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6346
G1 X114.887 Y110.533 E.00697
G1 X115.183 Y110.96 E.01725
G1 X115.367 Y111.447 E.01725
G1 X115.43 Y111.963 E.01725
G1 X115.367 Y112.479 E.01725
G1 X115.183 Y112.965 E.01725
G1 X114.887 Y113.393 E.01725
G1 X114.498 Y113.737 E.01725
G1 X114.038 Y113.979 E.01725
G1 X113.533 Y114.103 E.01725
G1 X113.013 Y114.103 E.01725
G1 X112.508 Y113.979 E.01725
G1 X112.048 Y113.737 E.01725
G1 X111.659 Y113.393 E.01725
G1 X111.364 Y112.965 E.01725
G1 X111.179 Y112.479 E.01725
G1 X111.117 Y111.963 E.01724
G1 X111.179 Y111.447 E.01725
G1 X111.364 Y110.96 E.01725
G1 X111.659 Y110.533 E.01725
G1 X112.048 Y110.188 E.01725
G1 X112.508 Y109.946 E.01724
G1 X113.013 Y109.822 E.01725
G1 X113.533 Y109.822 E.01725
G1 X114.038 Y109.946 E.01725
G1 X114.498 Y110.188 E.01724
G1 X114.685 Y110.354 E.00829
G1 X114.556 Y110.763 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6346
G1 X114.592 Y110.795 E.00147
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.833 Y112.781 E.01305
G1 X114.592 Y113.131 E.01305
G1 X114.274 Y113.412 E.01305
G1 X113.898 Y113.61 E.01305
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.512 Y111.963 E.01305
G1 X111.563 Y111.541 E.01305
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.47 Y110.687 E.00806
G1 X114.511 Y110.723 E.00168
M204 S10000
; WIPE_START
G1 F24000
G1 X114.592 Y110.795 E-.04099
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.915 Y112.565 E-.07352
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.063 J1.215 P1  F30000
G1 X149.671 Y114.361 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6346
G1 X110.875 Y114.361 E1.28693
G1 X110.875 Y109.565 E.15909
G1 X149.671 Y109.565 E1.28693
G1 X149.671 Y114.301 E.1571
G1 X150.063 Y114.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6346
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.666 J1.018 P1  F30000
G1 X149.467 Y113.776 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F6346
G1 X148.251 Y114.157 E.0298
G1 X149.045 Y114.157 F30000
; LINE_WIDTH: 0.556112
G1 F6346
G1 X149.467 Y113.047 E.04968
G1 X149.467 Y110.878 F30000
; LINE_WIDTH: 0.511111
G1 F6346
G1 X149.045 Y109.768 E.04532
G1 X149.467 Y110.149 F30000
; LINE_WIDTH: 0.329879
G1 F6346
G1 X148.251 Y109.768 E.0298
G1 X146.295 Y109.768 F30000
; LINE_WIDTH: 0.130745
G1 F6346
G1 X146.094 Y109.907 E.00175
G1 X144.86 Y111.306 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6346
G1 X145.388 Y109.913 E.04944
G1 X115.158 Y109.913 E1.0028
G1 X115.708 Y111.363 E.05143
G3 X115.708 Y112.563 I-2.435 J.6 E.0402
G1 X115.158 Y114.012 E.05143
G1 X145.388 Y114.012 E1.0028
G1 X144.839 Y112.563 E.05143
G3 X144.839 Y111.363 I2.435 J-.6 E.0402
G1 X146.094 Y114.018 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130746
G1 F6346
G1 X146.295 Y114.157 E.00175
G1 X142.354 Y113.605 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6346
G1 X143.982 Y113.605 E.05401
G1 X144.574 Y113.013 E.02776
G3 X144.574 Y110.912 I2.239 J-1.051 E.072
G1 X143.982 Y110.32 E.02776
G1 X139.592 Y110.32 E.14565
G1 X136.306 Y113.605 E.15411
G1 X139.592 Y113.605 E.10897
G1 X136.306 Y110.32 E.15411
G1 X131.916 Y110.32 E.14565
G1 X128.63 Y113.605 E.15411
G1 X131.916 Y113.605 E.10897
G1 X128.63 Y110.32 E.15411
G1 X127.002 Y110.32 E.05401
G1 X125.868 Y113.605 F30000
G1 F6346
G1 X124.24 Y113.605 E.05401
G1 X120.955 Y110.32 E.15411
G1 X124.24 Y110.32 E.10897
G1 X120.955 Y113.605 E.15411
G1 X116.564 Y113.605 E.14565
G1 X115.972 Y113.013 E.02776
G2 X115.972 Y110.912 I-2.239 J-1.051 E.072
G1 X116.564 Y110.32 E.02776
G1 X118.192 Y110.32 E.05401
G1 X114.452 Y109.907 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969194
G1 F6346
G1 X114.251 Y109.768 E.00108
G1 X112.295 Y109.768 F30000
; LINE_WIDTH: 0.309036
G1 F6346
G1 X111.079 Y110.149 E.02764
G1 X111.501 Y109.768 F30000
; LINE_WIDTH: 0.556113
G1 F6346
G1 X111.079 Y110.878 E.04968
G1 X111.079 Y113.047 F30000
; LINE_WIDTH: 0.556114
G1 F6346
G1 X111.501 Y114.157 E.04968
G1 X111.079 Y113.776 F30000
; LINE_WIDTH: 0.309036
G1 F6346
G1 X112.295 Y114.157 E.02764
G1 X114.251 Y114.157 F30000
; LINE_WIDTH: 0.0969195
G1 F6346
G1 X114.452 Y114.018 E.00108
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.251 Y114.157 E-.76
; WIPE_END
M73 P86 R1
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
G3 Z2.4 I-.527 J1.097 P1  F30000
G1 X145.077 Y128.965 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6346
G1 X144.906 Y128.516 E.01594
G1 X144.844 Y128 E.01725
G1 X144.906 Y127.484 E.01725
G1 X145.091 Y126.998 E.01725
G1 X145.386 Y126.57 E.01725
G1 X145.775 Y126.225 E.01725
G1 X146.235 Y125.984 E.01725
G1 X146.74 Y125.859 E.01725
G1 X147.26 Y125.859 E.01725
G1 X147.765 Y125.984 E.01725
G1 X148.225 Y126.225 E.01724
G1 X148.614 Y126.57 E.01725
G1 X148.909 Y126.998 E.01725
G1 X149.094 Y127.484 E.01725
G1 X149.157 Y128 E.01725
G1 X149.094 Y128.516 E.01725
G1 X148.909 Y129.002 E.01725
G1 X148.614 Y129.43 E.01725
G1 X148.225 Y129.775 E.01725
G1 X147.765 Y130.016 E.01724
G1 X147.26 Y130.141 E.01725
G1 X146.74 Y130.141 E.01725
G1 X146.235 Y130.016 E.01725
G1 X145.775 Y129.775 E.01724
G1 X145.386 Y129.43 E.01725
G1 X145.102 Y129.019 E.01656
G1 X145.44 Y128.818 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6346
G1 X145.29 Y128.422 E.01304
G1 X145.238 Y128 E.01305
G1 X145.29 Y127.578 E.01305
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.474 Y128.868 E.01121
M204 S10000
; WIPE_START
G1 F24000
G1 X145.29 Y128.422 E-.18351
G1 X145.238 Y128 E-.16137
G1 X145.29 Y127.578 E-.16137
G1 X145.44 Y127.181 E-.16137
G1 X145.578 Y126.981 E-.09238
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.021 J-1.217 P1  F30000
G1 X114.476 Y126.447 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6346
G1 X114.476 Y126.447 E0
G1 X114.614 Y126.57 E.00614
G1 X114.909 Y126.998 E.01725
G1 X115.094 Y127.484 E.01725
G1 X115.157 Y128 E.01725
G1 X115.094 Y128.516 E.01725
G1 X114.909 Y129.002 E.01725
G1 X114.614 Y129.43 E.01725
G1 X114.225 Y129.775 E.01725
G1 X113.765 Y130.016 E.01725
G1 X113.26 Y130.141 E.01725
G1 X112.74 Y130.141 E.01725
G1 X112.235 Y130.016 E.01725
G1 X111.775 Y129.775 E.01724
G1 X111.386 Y129.43 E.01725
G1 X111.091 Y129.002 E.01725
G1 X110.906 Y128.516 E.01725
G1 X110.843 Y128 E.01724
G1 X110.906 Y127.484 E.01725
G1 X111.091 Y126.998 E.01725
G1 X111.386 Y126.57 E.01725
G1 X111.775 Y126.225 E.01725
G1 X112.235 Y125.984 E.01724
G1 X112.74 Y125.859 E.01725
G1 X113.26 Y125.859 E.01725
G1 X113.765 Y125.984 E.01725
G1 X114.225 Y126.225 E.01724
G1 X114.431 Y126.407 E.00911
G1 X114.28 Y126.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6346
G1 X114.319 Y126.832 E.00158
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.56 Y128.819 E.01305
G1 X114.319 Y129.168 E.01305
G1 X114.001 Y129.45 E.01305
G1 X113.625 Y129.647 E.01305
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.238 Y128 E.01305
G1 X111.29 Y127.578 E.01305
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.216 Y126.741 E.00882
G1 X114.235 Y126.758 E.00081
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.04232
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.643 Y128.599 E-.0722
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.063 J1.215 P1  F30000
G1 X149.398 Y130.398 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6346
G1 X110.602 Y130.398 E1.28693
G1 X110.602 Y125.602 E.15909
G1 X149.398 Y125.602 E1.28693
G1 X149.398 Y130.338 E.1571
G1 X149.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6346
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.666 J1.018 P1  F30000
G1 X149.194 Y129.814 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F6346
G1 X147.978 Y130.194 E.0298
G1 X148.772 Y130.194 F30000
; LINE_WIDTH: 0.556112
G1 F6346
G1 X149.194 Y129.084 E.04968
G1 X149.194 Y126.916 F30000
; LINE_WIDTH: 0.511111
G1 F6346
G1 X148.772 Y125.806 E.04532
G1 X149.194 Y126.186 F30000
; LINE_WIDTH: 0.329879
G1 F6346
G1 X147.978 Y125.806 E.0298
G1 X146.022 Y125.806 F30000
; LINE_WIDTH: 0.130745
G1 F6346
G1 X145.821 Y125.945 E.00175
G1 X144.587 Y127.344 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6346
G1 X145.115 Y125.95 E.04944
G1 X114.885 Y125.95 E1.0028
G1 X115.434 Y127.4 E.05143
G3 X115.434 Y128.6 I-2.435 J.6 E.0402
G1 X114.885 Y130.05 E.05143
G1 X145.115 Y130.05 E1.0028
G1 X144.566 Y128.6 E.05143
G3 X144.566 Y127.4 I2.435 J-.6 E.0402
G1 X145.821 Y130.055 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130746
G1 F6346
G1 X146.022 Y130.194 E.00175
G1 X142.081 Y129.643 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6346
G1 X143.709 Y129.643 E.05401
G1 X144.301 Y129.051 E.02776
G3 X144.301 Y126.949 I2.239 J-1.051 E.072
G1 X143.709 Y126.357 E.02776
G1 X139.319 Y126.357 E.14565
G1 X136.033 Y129.643 E.15411
G1 X139.319 Y129.643 E.10897
G1 X136.033 Y126.357 E.15411
G1 X131.643 Y126.357 E.14565
G1 X128.357 Y129.643 E.15411
G1 X131.643 Y129.643 E.10897
G1 X128.357 Y126.357 E.15411
G1 X126.729 Y126.357 E.05401
G1 X125.595 Y129.643 F30000
G1 F6346
G1 X123.967 Y129.643 E.05401
G1 X120.681 Y126.357 E.15411
G1 X123.967 Y126.357 E.10897
G1 X120.681 Y129.643 E.15411
G1 X116.291 Y129.643 E.14565
G1 X115.699 Y129.051 E.02776
G2 X115.699 Y126.949 I-2.239 J-1.051 E.072
G1 X116.291 Y126.357 E.02776
G1 X117.919 Y126.357 E.05401
G1 X114.179 Y125.945 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969201
G1 F6346
G1 X113.978 Y125.806 E.00108
G1 X112.022 Y125.806 F30000
; LINE_WIDTH: 0.309036
G1 F6346
G1 X110.806 Y126.186 E.02764
G1 X111.228 Y125.806 F30000
; LINE_WIDTH: 0.556113
G1 F6346
G1 X110.806 Y126.916 E.04968
G1 X110.806 Y129.084 F30000
; LINE_WIDTH: 0.556112
G1 F6346
G1 X111.228 Y130.194 E.04968
G1 X110.806 Y129.814 F30000
; LINE_WIDTH: 0.309036
G1 F6346
G1 X112.022 Y130.194 E.02764
G1 X113.978 Y130.194 F30000
; LINE_WIDTH: 0.0969195
G1 F6346
G1 X114.179 Y130.055 E.00108
; WIPE_START
G1 F24000
G1 X113.978 Y130.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.587 J1.066 P1  F30000
G1 X145.35 Y112.928 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6346
G1 X145.179 Y112.479 E.01594
G1 X145.117 Y111.963 E.01725
G1 X145.179 Y111.447 E.01725
G1 X145.364 Y110.96 E.01725
G1 X145.659 Y110.533 E.01725
G1 X146.048 Y110.188 E.01725
G1 X146.508 Y109.946 E.01725
G1 X147.013 Y109.822 E.01725
G1 X147.533 Y109.822 E.01725
G1 X148.038 Y109.946 E.01725
G1 X148.498 Y110.188 E.01724
G1 X148.887 Y110.533 E.01725
G1 X149.183 Y110.96 E.01725
G1 X149.367 Y111.447 E.01725
G1 X149.43 Y111.963 E.01725
G1 X149.367 Y112.479 E.01725
G1 X149.183 Y112.965 E.01725
G1 X148.887 Y113.393 E.01725
G1 X148.498 Y113.737 E.01725
G1 X148.038 Y113.979 E.01724
G1 X147.533 Y114.103 E.01725
G1 X147.013 Y114.103 E.01725
G1 X146.508 Y113.979 E.01725
G1 X146.048 Y113.737 E.01724
G1 X145.659 Y113.393 E.01725
G1 X145.375 Y112.982 E.01656
G1 X145.713 Y112.781 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6346
G1 X145.563 Y112.384 E.01304
G1 X145.512 Y111.963 E.01305
G1 X145.563 Y111.541 E.01305
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
M73 P87 R1
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.747 Y112.83 E.01121
M204 S10000
; WIPE_START
G1 F24000
G1 X145.563 Y112.384 E-.18351
G1 X145.512 Y111.963 E-.16137
G1 X145.563 Y111.541 E-.16137
G1 X145.713 Y111.144 E-.16137
G1 X145.851 Y110.944 E-.09238
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.021 J-1.217 P1  F30000
G1 X114.749 Y110.41 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6346
G1 X114.749 Y110.41 E0
G1 X114.887 Y110.533 E.00614
G1 X115.183 Y110.96 E.01725
G1 X115.367 Y111.447 E.01725
G1 X115.43 Y111.963 E.01725
G1 X115.367 Y112.479 E.01725
G1 X115.183 Y112.965 E.01725
G1 X114.887 Y113.393 E.01725
G1 X114.498 Y113.737 E.01725
G1 X114.038 Y113.979 E.01725
G1 X113.533 Y114.103 E.01725
G1 X113.013 Y114.103 E.01725
G1 X112.508 Y113.979 E.01725
G1 X112.048 Y113.737 E.01724
G1 X111.659 Y113.393 E.01725
G1 X111.364 Y112.965 E.01725
G1 X111.179 Y112.479 E.01725
G1 X111.117 Y111.963 E.01724
G1 X111.179 Y111.447 E.01725
G1 X111.364 Y110.96 E.01725
G1 X111.659 Y110.533 E.01725
G1 X112.048 Y110.188 E.01725
G1 X112.508 Y109.946 E.01724
G1 X113.013 Y109.822 E.01725
G1 X113.533 Y109.822 E.01725
G1 X114.038 Y109.946 E.01725
G1 X114.498 Y110.188 E.01724
G1 X114.704 Y110.37 E.00911
G1 X114.553 Y110.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6346
G1 X114.592 Y110.795 E.00158
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.833 Y112.781 E.01305
G1 X114.592 Y113.131 E.01305
G1 X114.274 Y113.412 E.01305
G1 X113.898 Y113.61 E.01305
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.512 Y111.963 E.01305
G1 X111.563 Y111.541 E.01305
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.489 Y110.703 E.00882
G1 X114.508 Y110.721 E.00081
M204 S10000
; WIPE_START
G1 F24000
G1 X114.592 Y110.795 E-.04232
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.916 Y112.562 E-.0722
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.063 J1.215 P1  F30000
G1 X149.671 Y114.361 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6346
G1 X110.875 Y114.361 E1.28693
G1 X110.875 Y109.565 E.15909
G1 X149.671 Y109.565 E1.28693
G1 X149.671 Y114.301 E.1571
G1 X150.063 Y114.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6346
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.666 J1.018 P1  F30000
G1 X149.467 Y113.776 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.329878
G1 F6346
G1 X148.251 Y114.157 E.0298
G1 X149.045 Y114.157 F30000
; LINE_WIDTH: 0.556112
G1 F6346
G1 X149.467 Y113.047 E.04968
G1 X149.467 Y110.878 F30000
; LINE_WIDTH: 0.511111
G1 F6346
G1 X149.045 Y109.768 E.04532
G1 X149.467 Y110.149 F30000
; LINE_WIDTH: 0.329879
G1 F6346
G1 X148.251 Y109.768 E.0298
G1 X146.295 Y109.768 F30000
; LINE_WIDTH: 0.130745
G1 F6346
G1 X146.094 Y109.907 E.00175
G1 X144.86 Y111.306 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6346
G1 X145.388 Y109.913 E.04944
G1 X115.158 Y109.913 E1.0028
G1 X115.708 Y111.363 E.05143
G3 X115.708 Y112.563 I-2.435 J.6 E.0402
G1 X115.158 Y114.012 E.05143
G1 X145.388 Y114.012 E1.0028
G1 X144.839 Y112.563 E.05143
G3 X144.839 Y111.363 I2.435 J-.6 E.0402
G1 X146.094 Y114.018 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130746
G1 F6346
G1 X146.295 Y114.157 E.00175
G1 X142.354 Y113.605 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6346
G1 X143.982 Y113.605 E.05401
G1 X144.574 Y113.013 E.02776
G3 X144.574 Y110.912 I2.239 J-1.051 E.072
G1 X143.982 Y110.32 E.02776
G1 X139.592 Y110.32 E.14565
G1 X136.306 Y113.605 E.15411
G1 X139.592 Y113.605 E.10897
G1 X136.306 Y110.32 E.15411
G1 X131.916 Y110.32 E.14565
G1 X128.63 Y113.605 E.15411
G1 X131.916 Y113.605 E.10897
G1 X128.63 Y110.32 E.15411
G1 X127.002 Y110.32 E.05401
G1 X125.868 Y113.605 F30000
G1 F6346
G1 X124.24 Y113.605 E.05401
G1 X120.955 Y110.32 E.15411
G1 X124.24 Y110.32 E.10897
G1 X120.955 Y113.605 E.15411
G1 X116.564 Y113.605 E.14565
G1 X115.972 Y113.013 E.02776
G2 X115.972 Y110.912 I-2.239 J-1.051 E.072
G1 X116.564 Y110.32 E.02776
G1 X118.192 Y110.32 E.05401
G1 X114.452 Y109.907 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969201
G1 F6346
G1 X114.251 Y109.768 E.00108
G1 X112.295 Y109.768 F30000
; LINE_WIDTH: 0.309036
G1 F6346
G1 X111.079 Y110.149 E.02764
G1 X111.501 Y109.768 F30000
; LINE_WIDTH: 0.556113
G1 F6346
G1 X111.079 Y110.878 E.04968
G1 X111.079 Y113.047 F30000
; LINE_WIDTH: 0.556112
G1 F6346
G1 X111.501 Y114.157 E.04968
G1 X111.079 Y113.776 F30000
; LINE_WIDTH: 0.309036
G1 F6346
G1 X112.295 Y114.157 E.02764
G1 X114.251 Y114.157 F30000
; LINE_WIDTH: 0.0969195
G1 F6346
G1 X114.452 Y114.018 E.00108
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.251 Y114.157 E-.76
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
G3 Z2.6 I-.528 J1.096 P1  F30000
G1 X145.113 Y129.035 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6345
G1 X145.091 Y129.002 E.00131
G1 X144.906 Y128.516 E.01725
G1 X144.844 Y128 E.01725
G1 X144.906 Y127.484 E.01725
G1 X145.091 Y126.998 E.01725
G1 X145.386 Y126.57 E.01725
G1 X145.775 Y126.225 E.01725
G1 X146.235 Y125.984 E.01724
G1 X146.74 Y125.859 E.01725
G1 X147.26 Y125.859 E.01725
G1 X147.765 Y125.984 E.01725
G1 X148.225 Y126.225 E.01725
G1 X148.614 Y126.57 E.01725
G1 X148.909 Y126.998 E.01725
G1 X149.094 Y127.484 E.01725
G1 X149.157 Y128 E.01725
G1 X149.094 Y128.516 E.01725
G1 X148.909 Y129.002 E.01725
G1 X148.614 Y129.43 E.01725
G1 X148.225 Y129.775 E.01725
G1 X147.765 Y130.016 E.01725
G1 X147.26 Y130.141 E.01725
G1 X146.74 Y130.141 E.01725
G1 X146.235 Y130.016 E.01725
G1 X145.775 Y129.775 E.01725
G1 X145.386 Y129.43 E.01725
G1 X145.147 Y129.084 E.01395
G1 X145.441 Y128.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6345
G1 X145.44 Y128.819 E.00002
G1 X145.29 Y128.422 E.01305
G1 X145.238 Y128 E.01305
G1 X145.29 Y127.578 E.01305
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.475 Y128.869 E.01118
M204 S10000
; WIPE_START
G1 F24000
G1 X145.44 Y128.819 E-.02309
G1 X145.29 Y128.422 E-.16137
G1 X145.238 Y128 E-.16137
G1 X145.29 Y127.578 E-.16137
G1 X145.44 Y127.181 E-.16137
G1 X145.577 Y126.983 E-.09143
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.015 J-1.217 P1  F30000
G1 X114.637 Y126.602 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6345
G1 X114.909 Y126.998 E.01594
G1 X115.094 Y127.484 E.01725
G1 X115.157 Y128 E.01725
G1 X115.094 Y128.516 E.01725
G1 X114.909 Y129.002 E.01725
G1 X114.614 Y129.43 E.01725
G1 X114.225 Y129.775 E.01725
G1 X113.765 Y130.016 E.01725
G1 X113.26 Y130.141 E.01725
G1 X112.74 Y130.141 E.01725
G1 X112.235 Y130.016 E.01725
G1 X111.775 Y129.775 E.01725
G1 X111.386 Y129.43 E.01725
G1 X111.091 Y129.002 E.01725
G1 X110.906 Y128.516 E.01725
G1 X110.843 Y128 E.01725
G1 X110.906 Y127.484 E.01725
G1 X111.091 Y126.998 E.01725
G1 X111.386 Y126.57 E.01725
G1 X111.775 Y126.225 E.01725
G1 X112.235 Y125.984 E.01724
G1 X112.74 Y125.859 E.01725
G1 X113.26 Y125.859 E.01725
G1 X113.765 Y125.984 E.01725
G1 X114.225 Y126.225 E.01725
G1 X114.494 Y126.464 E.01193
G1 X114.599 Y126.556 E.00463
G1 X114.28 Y126.798 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6345
G1 X114.319 Y126.832 E.00158
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.56 Y128.819 E.01305
G1 X114.319 Y129.168 E.01305
G1 X114.001 Y129.45 E.01305
G1 X113.625 Y129.647 E.01305
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.238 Y128 E.01305
G1 X111.29 Y127.578 E.01305
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.235 Y126.758 E.00963
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.0423
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.643 Y128.599 E-.07221
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.063 J1.215 P1  F30000
G1 X149.398 Y130.398 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6345
G1 X110.602 Y130.398 E1.28693
G1 X110.602 Y125.602 E.15909
G1 X149.398 Y125.602 E1.28693
G1 X149.398 Y130.338 E.1571
G1 X149.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6345
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.666 J1.018 P1  F30000
G1 X149.194 Y129.814 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.32988
G1 F6345
G1 X147.978 Y130.194 E.0298
G1 X148.772 Y130.194 F30000
; LINE_WIDTH: 0.556114
G1 F6345
G1 X149.194 Y129.084 E.04968
G1 X149.194 Y126.916 F30000
; LINE_WIDTH: 0.511113
G1 F6345
G1 X148.772 Y125.806 E.04532
G1 X149.194 Y126.186 F30000
; LINE_WIDTH: 0.329879
G1 F6345
G1 X147.978 Y125.806 E.0298
G1 X146.022 Y125.806 F30000
; LINE_WIDTH: 0.130745
G1 F6345
G1 X145.821 Y125.945 E.00175
G1 X144.587 Y127.344 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6345
G1 X145.115 Y125.95 E.04944
G1 X114.885 Y125.95 E1.0028
G1 X115.229 Y126.858 E.0322
G3 X115.434 Y128.6 I-2.523 J1.181 E.0592
G1 X114.885 Y130.05 E.05143
G1 X145.115 Y130.05 E1.0028
G1 X144.566 Y128.6 E.05143
G3 X144.566 Y127.4 I2.435 J-.6 E.0402
G1 X145.821 Y130.055 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130748
G1 F6345
G1 X146.022 Y130.194 E.00175
G1 X142.081 Y129.643 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6345
G1 X143.709 Y129.643 E.05401
G1 X144.301 Y129.051 E.02776
G3 X144.301 Y126.949 I2.239 J-1.051 E.072
G1 X143.709 Y126.357 E.02776
G1 X139.319 Y126.357 E.14565
G1 X136.033 Y129.643 E.15411
G1 X139.319 Y129.643 E.10897
M73 P88 R1
G1 X136.033 Y126.357 E.15411
G1 X131.643 Y126.357 E.14565
G1 X128.357 Y129.643 E.15411
G1 X131.643 Y129.643 E.10897
G1 X128.357 Y126.357 E.15411
G1 X126.729 Y126.357 E.05401
G1 X125.595 Y129.643 F30000
G1 F6345
G1 X123.967 Y129.643 E.05401
G1 X120.681 Y126.357 E.15411
G1 X123.967 Y126.357 E.10897
G1 X120.681 Y129.643 E.15411
G1 X116.291 Y129.643 E.14565
G1 X115.699 Y129.051 E.02776
G2 X115.699 Y126.949 I-2.239 J-1.051 E.072
G1 X116.291 Y126.357 E.02776
G1 X117.919 Y126.357 E.05401
G1 X114.179 Y125.945 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969194
G1 F6345
G1 X113.978 Y125.806 E.00108
G1 X112.022 Y125.806 F30000
; LINE_WIDTH: 0.309035
G1 F6345
G1 X110.806 Y126.186 E.02764
G1 X111.228 Y125.806 F30000
; LINE_WIDTH: 0.55611
G1 F6345
G1 X110.806 Y126.916 E.04967
G1 X110.806 Y129.084 F30000
; LINE_WIDTH: 0.556114
G1 F6345
G1 X111.228 Y130.194 E.04968
G1 X110.806 Y129.814 F30000
; LINE_WIDTH: 0.309036
G1 F6345
G1 X112.022 Y130.194 E.02764
G1 X113.978 Y130.194 F30000
; LINE_WIDTH: 0.0969195
G1 F6345
G1 X114.179 Y130.055 E.00108
; WIPE_START
G1 F24000
G1 X113.978 Y130.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.584 J1.067 P1  F30000
G1 X145.386 Y112.997 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6345
G1 X145.364 Y112.965 E.00131
G1 X145.179 Y112.479 E.01725
G1 X145.117 Y111.963 E.01725
G1 X145.179 Y111.447 E.01725
G1 X145.364 Y110.96 E.01725
G1 X145.659 Y110.533 E.01725
G1 X146.048 Y110.188 E.01725
G1 X146.508 Y109.946 E.01724
G1 X147.013 Y109.822 E.01725
G1 X147.533 Y109.822 E.01725
G1 X148.038 Y109.946 E.01725
G1 X148.498 Y110.188 E.01725
G1 X148.887 Y110.533 E.01725
G1 X149.183 Y110.96 E.01725
G1 X149.367 Y111.447 E.01725
G1 X149.43 Y111.963 E.01725
G1 X149.367 Y112.479 E.01725
G1 X149.183 Y112.965 E.01725
G1 X148.887 Y113.393 E.01725
G1 X148.498 Y113.737 E.01725
G1 X148.038 Y113.979 E.01725
G1 X147.533 Y114.103 E.01725
G1 X147.013 Y114.103 E.01725
G1 X146.508 Y113.979 E.01725
G1 X146.048 Y113.737 E.01725
G1 X145.659 Y113.393 E.01725
G1 X145.42 Y113.047 E.01395
G1 X145.714 Y112.782 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6345
G1 X145.713 Y112.781 E.00002
G1 X145.563 Y112.384 E.01305
G1 X145.512 Y111.963 E.01305
G1 X145.563 Y111.541 E.01305
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.748 Y112.831 E.01118
M204 S10000
; WIPE_START
G1 F24000
G1 X145.713 Y112.781 E-.02309
G1 X145.563 Y112.384 E-.16137
G1 X145.512 Y111.963 E-.16137
G1 X145.563 Y111.541 E-.16137
G1 X145.713 Y111.144 E-.16137
G1 X145.85 Y110.946 E-.09143
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.015 J-1.217 P1  F30000
G1 X114.91 Y110.565 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6345
G1 X115.183 Y110.96 E.01594
G1 X115.367 Y111.447 E.01725
G1 X115.43 Y111.963 E.01725
G1 X115.367 Y112.479 E.01725
G1 X115.183 Y112.965 E.01725
G1 X114.887 Y113.393 E.01725
G1 X114.498 Y113.737 E.01725
G1 X114.038 Y113.979 E.01725
G1 X113.533 Y114.103 E.01725
G1 X113.013 Y114.103 E.01725
G1 X112.508 Y113.979 E.01725
G1 X112.048 Y113.737 E.01725
G1 X111.659 Y113.393 E.01725
G1 X111.364 Y112.965 E.01725
G1 X111.179 Y112.479 E.01725
G1 X111.117 Y111.963 E.01725
G1 X111.179 Y111.447 E.01725
G1 X111.364 Y110.96 E.01725
G1 X111.659 Y110.533 E.01725
G1 X112.048 Y110.188 E.01725
G1 X112.508 Y109.946 E.01724
G1 X113.013 Y109.822 E.01725
G1 X113.533 Y109.822 E.01725
G1 X114.038 Y109.946 E.01725
G1 X114.498 Y110.188 E.01725
G1 X114.767 Y110.426 E.01193
G1 X114.872 Y110.519 E.00463
G1 X114.553 Y110.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6345
G1 X114.592 Y110.795 E.00158
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.833 Y112.781 E.01305
G1 X114.592 Y113.131 E.01305
G1 X114.274 Y113.412 E.01305
G1 X113.898 Y113.61 E.01305
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.512 Y111.963 E.01305
G1 X111.563 Y111.541 E.01305
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.508 Y110.721 E.00963
M204 S10000
; WIPE_START
G1 F24000
G1 X114.592 Y110.795 E-.0423
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.916 Y112.562 E-.07221
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.063 J1.215 P1  F30000
G1 X149.671 Y114.361 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6345
G1 X110.875 Y114.361 E1.28693
G1 X110.875 Y109.565 E.15909
G1 X149.671 Y109.565 E1.28693
G1 X149.671 Y114.301 E.1571
G1 X150.063 Y114.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6345
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.666 J1.018 P1  F30000
G1 X149.467 Y113.776 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.32988
G1 F6345
G1 X148.251 Y114.157 E.0298
G1 X149.045 Y114.157 F30000
; LINE_WIDTH: 0.556114
G1 F6345
G1 X149.467 Y113.047 E.04968
G1 X149.467 Y110.878 F30000
; LINE_WIDTH: 0.511113
G1 F6345
G1 X149.045 Y109.768 E.04532
G1 X149.467 Y110.149 F30000
; LINE_WIDTH: 0.329879
G1 F6345
G1 X148.251 Y109.768 E.0298
G1 X146.295 Y109.768 F30000
; LINE_WIDTH: 0.130745
G1 F6345
G1 X146.094 Y109.907 E.00175
G1 X144.86 Y111.306 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6345
G1 X145.388 Y109.913 E.04944
G1 X115.158 Y109.913 E1.0028
G1 X115.502 Y110.821 E.0322
G3 X115.708 Y112.563 I-2.523 J1.181 E.0592
G1 X115.158 Y114.012 E.05143
G1 X145.388 Y114.012 E1.0028
G1 X144.839 Y112.563 E.05143
G3 X144.839 Y111.363 I2.435 J-.6 E.0402
G1 X146.094 Y114.018 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130748
G1 F6345
G1 X146.295 Y114.157 E.00175
G1 X142.354 Y113.605 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6345
G1 X143.982 Y113.605 E.05401
G1 X144.574 Y113.013 E.02776
G3 X144.574 Y110.912 I2.239 J-1.051 E.072
G1 X143.982 Y110.32 E.02776
G1 X139.592 Y110.32 E.14565
G1 X136.306 Y113.605 E.15411
G1 X139.592 Y113.605 E.10897
G1 X136.306 Y110.32 E.15411
G1 X131.916 Y110.32 E.14565
G1 X128.63 Y113.605 E.15411
G1 X131.916 Y113.605 E.10897
G1 X128.63 Y110.32 E.15411
G1 X127.002 Y110.32 E.05401
G1 X125.868 Y113.605 F30000
G1 F6345
G1 X124.24 Y113.605 E.05401
G1 X120.955 Y110.32 E.15411
G1 X124.24 Y110.32 E.10897
G1 X120.955 Y113.605 E.15411
G1 X116.564 Y113.605 E.14565
G1 X115.972 Y113.013 E.02776
G2 X115.972 Y110.912 I-2.239 J-1.051 E.072
G1 X116.564 Y110.32 E.02776
M73 P89 R1
G1 X118.192 Y110.32 E.05401
G1 X114.452 Y109.907 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969194
G1 F6345
G1 X114.251 Y109.768 E.00108
G1 X112.295 Y109.768 F30000
; LINE_WIDTH: 0.309035
G1 F6345
G1 X111.079 Y110.149 E.02764
G1 X111.501 Y109.768 F30000
; LINE_WIDTH: 0.55611
G1 F6345
G1 X111.079 Y110.878 E.04967
G1 X111.079 Y113.047 F30000
; LINE_WIDTH: 0.556114
G1 F6345
G1 X111.501 Y114.157 E.04968
G1 X111.079 Y113.776 F30000
; LINE_WIDTH: 0.309036
G1 F6345
G1 X112.295 Y114.157 E.02764
G1 X114.251 Y114.157 F30000
; LINE_WIDTH: 0.0969195
G1 F6345
G1 X114.452 Y114.018 E.00108
M106 S242.25
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.251 Y114.157 E-.76
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
G3 Z2.8 I-.527 J1.097 P1  F30000
G1 X145.077 Y128.965 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.906 Y128.516 E.01594
G1 X144.844 Y128 E.01725
G1 X144.906 Y127.484 E.01725
G1 X145.091 Y126.998 E.01725
G1 X145.386 Y126.57 E.01725
G1 X145.775 Y126.225 E.01725
G1 X146.235 Y125.984 E.01725
G1 X146.74 Y125.859 E.01725
G1 X147.26 Y125.859 E.01725
G1 X147.765 Y125.984 E.01725
G1 X148.225 Y126.225 E.01724
G1 X148.614 Y126.57 E.01725
G1 X148.909 Y126.998 E.01725
G1 X149.094 Y127.484 E.01725
G1 X149.157 Y128 E.01725
G1 X149.094 Y128.516 E.01725
G1 X148.909 Y129.002 E.01725
G1 X148.614 Y129.43 E.01725
G1 X148.225 Y129.775 E.01725
G1 X147.765 Y130.016 E.01725
G1 X147.26 Y130.141 E.01725
G1 X146.74 Y130.141 E.01725
G1 X146.235 Y130.016 E.01725
G1 X145.775 Y129.775 E.01724
G1 X145.386 Y129.43 E.01725
G1 X145.102 Y129.019 E.01656
G1 X145.44 Y128.817 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.29 Y128.422 E.01301
G1 X145.238 Y128 E.01305
G1 X145.29 Y127.578 E.01305
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.474 Y128.867 E.01124
M204 S10000
; WIPE_START
G1 F24000
G1 X145.29 Y128.422 E-.18312
G1 X145.238 Y128 E-.16137
G1 X145.29 Y127.578 E-.16137
G1 X145.44 Y127.181 E-.16137
G1 X145.579 Y126.98 E-.09277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.015 J-1.217 P1  F30000
G1 X114.636 Y126.602 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.909 Y126.998 E.01594
G1 X115.094 Y127.484 E.01725
G1 X115.157 Y128 E.01725
G1 X115.094 Y128.516 E.01725
G1 X114.909 Y129.002 E.01725
G1 X114.614 Y129.43 E.01725
G1 X114.225 Y129.775 E.01725
G1 X113.765 Y130.016 E.01725
G1 X113.26 Y130.141 E.01725
G1 X112.74 Y130.141 E.01725
G1 X112.235 Y130.016 E.01725
G1 X111.775 Y129.775 E.01724
G1 X111.386 Y129.43 E.01725
G1 X111.091 Y129.002 E.01725
G1 X110.906 Y128.516 E.01725
G1 X110.843 Y128 E.01724
G1 X110.906 Y127.484 E.01725
G1 X111.091 Y126.998 E.01725
G1 X111.386 Y126.57 E.01725
G1 X111.775 Y126.225 E.01725
G1 X112.235 Y125.984 E.01724
G1 X112.74 Y125.859 E.01725
G1 X113.26 Y125.859 E.01725
G1 X113.765 Y125.984 E.01725
G1 X114.225 Y126.225 E.01725
G1 X114.599 Y126.556 E.01656
G1 X114.277 Y126.795 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.319 Y126.832 E.0017
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.56 Y128.819 E.01305
G1 X114.319 Y129.168 E.01305
G1 X114.001 Y129.45 E.01305
G1 X113.625 Y129.647 E.01305
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.238 Y128 E.01305
G1 X111.29 Y127.578 E.01305
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.232 Y126.755 E.0095
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.04383
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.644 Y128.595 E-.07068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.063 J1.215 P1  F30000
G1 X149.398 Y130.398 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.602 Y130.398 E1.28693
G1 X110.602 Y125.602 E.15909
G1 X149.398 Y125.602 E1.28693
G1 X149.398 Y130.338 E.1571
G1 X149.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.666 J1.018 P1  F30000
G1 X149.194 Y129.814 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.32988
G1 F15000
G1 X147.978 Y130.194 E.0298
G1 X148.772 Y130.194 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X149.194 Y129.084 E.04968
G1 X149.194 Y126.916 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X148.772 Y125.806 E.04532
G1 X149.194 Y126.186 F30000
; LINE_WIDTH: 0.329879
G1 F15000
G1 X147.978 Y125.806 E.0298
G1 X146.022 Y125.806 F30000
; LINE_WIDTH: 0.130748
G1 F15000
G1 X145.821 Y125.945 E.00175
G1 X145.479 Y126 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X145.415 Y126.037 E.00204
G1 X145.464 Y126.065 E.00155
; WIPE_START
G1 F24000
G1 X145.415 Y126.037 E-.32874
G1 X145.479 Y126 E-.43126
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.217 J0 P1  F30000
G1 X145.479 Y129.926 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15000
G1 X145.415 Y129.963 E.00204
G1 X145.464 Y129.991 E.00155
G1 X145.821 Y130.055 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130746
G1 F15000
G1 X146.022 Y130.194 E.00175
G1 X144.73 Y130.231 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40324
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X144.73 Y129.095 E.0591
G1 X144.545 Y128.605 E.02725
G1 X144.471 Y128 E.03172
G1 X144.545 Y127.395 E.03172
G1 X144.73 Y126.905 E.02725
G1 X144.73 Y125.972 E.04856
G1 X144.277 Y125.972 E.02358
G1 X144.277 Y130.028 E.21107
G1 X143.824 Y130.028 E.02358
G1 X143.824 Y125.972 E.21107
G1 X143.371 Y125.972 E.02358
G1 X143.371 Y130.028 E.21107
G1 X142.917 Y130.028 E.02358
G1 X142.917 Y125.972 E.21107
G1 X142.464 Y125.972 E.02358
G1 X142.464 Y130.028 E.21107
G1 X142.011 Y130.028 E.02358
G1 X142.011 Y125.972 E.21107
G1 X141.558 Y125.972 E.02358
G1 X141.558 Y130.028 E.21107
G1 X141.104 Y130.028 E.02358
G1 X141.104 Y125.972 E.21107
G1 X140.651 Y125.972 E.02358
G1 X140.651 Y130.028 E.21107
G1 X140.198 Y130.028 E.02358
G1 X140.198 Y125.972 E.21107
G1 X139.745 Y125.972 E.02358
G1 X139.745 Y130.028 E.21107
G1 X139.291 Y130.028 E.02358
G1 X139.291 Y125.972 E.21107
G1 X138.838 Y125.972 E.02358
G1 X138.838 Y130.028 E.21107
G1 X138.385 Y130.028 E.02358
G1 X138.385 Y125.972 E.21107
G1 X137.932 Y125.972 E.02358
G1 X137.932 Y130.028 E.21107
G1 X137.478 Y130.028 E.02358
G1 X137.478 Y125.972 E.21107
G1 X137.025 Y125.972 E.02358
G1 X137.025 Y130.028 E.21107
G1 X136.572 Y130.028 E.02358
G1 X136.572 Y125.972 E.21107
G1 X136.119 Y125.972 E.02358
G1 X136.119 Y130.028 E.21107
G1 X135.665 Y130.028 E.02358
G1 X135.665 Y125.972 E.21107
G1 X135.212 Y125.972 E.02358
G1 X135.212 Y130.028 E.21107
G1 X134.759 Y130.028 E.02358
G1 X134.759 Y125.972 E.21107
G1 X134.306 Y125.972 E.02358
G1 X134.306 Y130.028 E.21107
G1 X133.853 Y130.028 E.02358
G1 X133.853 Y125.972 E.21107
G1 X133.399 Y125.972 E.02358
G1 X133.399 Y130.028 E.21107
G1 X132.946 Y130.028 E.02358
G1 X132.946 Y125.972 E.21107
G1 X132.493 Y125.972 E.02358
G1 X132.493 Y130.028 E.21107
G1 X132.04 Y130.028 E.02358
G1 X132.04 Y125.972 E.21107
G1 X131.586 Y125.972 E.02358
G1 X131.586 Y130.028 E.21107
G1 X131.133 Y130.028 E.02358
G1 X131.133 Y125.972 E.21107
G1 X130.68 Y125.972 E.02358
G1 X130.68 Y130.028 E.21107
G1 X130.227 Y130.028 E.02358
G1 X130.227 Y125.972 E.21107
G1 X129.773 Y125.972 E.02358
G1 X129.773 Y130.028 E.21107
G1 X129.32 Y130.028 E.02358
G1 X129.32 Y125.972 E.21107
G1 X128.867 Y125.972 E.02358
G1 X128.867 Y130.028 E.21107
G1 X128.414 Y130.028 E.02358
G1 X128.414 Y125.972 E.21107
G1 X127.96 Y125.972 E.02358
G1 X127.96 Y130.028 E.21107
G1 X127.507 Y130.028 E.02358
G1 X127.507 Y125.972 E.21107
G1 X127.054 Y125.972 E.02358
G1 X127.054 Y130.028 E.21107
G1 X126.601 Y130.028 E.02358
G1 X126.601 Y125.972 E.21107
G1 X126.147 Y125.972 E.02358
G1 X126.147 Y130.028 E.21107
G1 X125.694 Y130.028 E.02358
G1 X125.694 Y125.972 E.21107
G1 X125.241 Y125.972 E.02358
G1 X125.241 Y130.028 E.21107
G1 X124.788 Y130.028 E.02358
G1 X124.788 Y125.972 E.21107
G1 X124.334 Y125.972 E.02358
G1 X124.334 Y130.028 E.21107
G1 X123.881 Y130.028 E.02358
G1 X123.881 Y125.972 E.21107
G1 X123.428 Y125.972 E.02358
G1 X123.428 Y130.028 E.21107
M73 P90 R1
G1 X122.975 Y130.028 E.02358
G1 X122.975 Y125.972 E.21107
G1 X122.522 Y125.972 E.02358
G1 X122.522 Y130.028 E.21107
G1 X122.068 Y130.028 E.02358
G1 X122.068 Y125.972 E.21107
G1 X121.615 Y125.972 E.02358
G1 X121.615 Y130.028 E.21107
G1 X121.162 Y130.028 E.02358
G1 X121.162 Y125.972 E.21107
G1 X120.709 Y125.972 E.02358
G1 X120.709 Y130.028 E.21107
G1 X120.255 Y130.028 E.02358
G1 X120.255 Y125.972 E.21107
G1 X119.802 Y125.972 E.02358
G1 X119.802 Y130.028 E.21107
G1 X119.349 Y130.028 E.02358
G1 X119.349 Y125.972 E.21107
G1 X118.896 Y125.972 E.02358
G1 X118.896 Y130.028 E.21107
G1 X118.442 Y130.028 E.02358
G1 X118.442 Y125.972 E.21107
G1 X117.989 Y125.972 E.02358
G1 X117.989 Y130.028 E.21107
G1 X117.536 Y130.028 E.02358
G1 X117.536 Y125.972 E.21107
G1 X117.083 Y125.972 E.02358
G1 X117.083 Y130.028 E.21107
G1 X116.629 Y130.028 E.02358
G1 X116.629 Y125.972 E.21107
G1 X116.176 Y125.972 E.02358
G1 X116.176 Y130.028 E.21107
G1 X115.723 Y130.028 E.02358
G1 X115.723 Y125.972 E.21107
G1 X115.27 Y125.972 E.02358
G1 X115.27 Y126.905 E.04855
G1 X115.455 Y127.395 E.02726
G1 X115.529 Y128 E.03172
G1 X115.455 Y128.605 E.03172
G1 X115.27 Y129.095 E.02726
G1 X115.27 Y130.231 E.05909
M106 S242.25
G1 X114.561 Y129.926 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X114.497 Y129.963 E.00204
G1 X114.545 Y129.991 E.00155
G1 X114.179 Y130.055 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X113.978 Y130.194 E.00108
G1 X112.022 Y130.194 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X110.806 Y129.814 E.02764
G1 X111.228 Y130.194 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X110.806 Y129.084 E.04968
G1 X110.806 Y126.916 F30000
; LINE_WIDTH: 0.556115
G1 F12276.054
G1 X111.228 Y125.806 E.04968
G1 X110.806 Y126.186 F30000
; LINE_WIDTH: 0.309035
G1 F15000
G1 X112.022 Y125.806 E.02764
G1 X113.978 Y125.806 F30000
; LINE_WIDTH: 0.0969202
G1 F15000
G1 X114.179 Y125.945 E.00108
G1 X114.563 Y126.005 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X114.499 Y126.041 E.00204
G1 X114.548 Y126.07 E.00155
; WIPE_START
G1 F24000
G1 X114.499 Y126.041 E-.32874
G1 X114.563 Y126.005 E-.43126
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.476 J1.12 P1  F30000
G1 X145.35 Y112.928 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.179 Y112.479 E.01594
G1 X145.117 Y111.963 E.01725
G1 X145.179 Y111.447 E.01725
G1 X145.364 Y110.96 E.01725
G1 X145.659 Y110.533 E.01725
G1 X146.048 Y110.188 E.01725
G1 X146.508 Y109.946 E.01725
G1 X147.013 Y109.822 E.01725
G1 X147.533 Y109.822 E.01725
G1 X148.038 Y109.946 E.01725
G1 X148.498 Y110.188 E.01724
G1 X148.887 Y110.533 E.01725
G1 X149.183 Y110.96 E.01725
G1 X149.367 Y111.447 E.01725
G1 X149.43 Y111.963 E.01725
G1 X149.367 Y112.479 E.01725
G1 X149.183 Y112.965 E.01725
G1 X148.887 Y113.393 E.01725
G1 X148.498 Y113.737 E.01725
G1 X148.038 Y113.979 E.01725
G1 X147.533 Y114.103 E.01725
G1 X147.013 Y114.103 E.01725
G1 X146.508 Y113.979 E.01725
G1 X146.048 Y113.737 E.01724
G1 X145.659 Y113.393 E.01725
G1 X145.375 Y112.982 E.01656
G1 X145.713 Y112.78 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.563 Y112.384 E.01301
G1 X145.512 Y111.963 E.01305
G1 X145.563 Y111.541 E.01305
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.747 Y112.83 E.01124
M204 S10000
; WIPE_START
G1 F24000
G1 X145.563 Y112.384 E-.18312
G1 X145.512 Y111.963 E-.16137
G1 X145.563 Y111.541 E-.16137
G1 X145.713 Y111.144 E-.16137
G1 X145.852 Y110.943 E-.09277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.015 J-1.217 P1  F30000
G1 X114.91 Y110.565 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X115.183 Y110.96 E.01594
G1 X115.367 Y111.447 E.01725
G1 X115.43 Y111.963 E.01725
G1 X115.367 Y112.479 E.01725
G1 X115.183 Y112.965 E.01725
G1 X114.887 Y113.393 E.01725
G1 X114.498 Y113.737 E.01725
G1 X114.038 Y113.979 E.01725
G1 X113.533 Y114.103 E.01725
G1 X113.013 Y114.103 E.01725
G1 X112.508 Y113.979 E.01725
G1 X112.048 Y113.737 E.01724
G1 X111.659 Y113.393 E.01725
G1 X111.364 Y112.965 E.01725
G1 X111.179 Y112.479 E.01725
G1 X111.117 Y111.963 E.01724
G1 X111.179 Y111.447 E.01725
G1 X111.364 Y110.96 E.01725
G1 X111.659 Y110.533 E.01725
G1 X112.048 Y110.188 E.01725
G1 X112.508 Y109.946 E.01724
G1 X113.013 Y109.822 E.01725
G1 X113.533 Y109.822 E.01725
G1 X114.038 Y109.946 E.01725
G1 X114.498 Y110.188 E.01725
G1 X114.872 Y110.519 E.01656
G1 X114.55 Y110.758 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.592 Y110.795 E.0017
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.833 Y112.781 E.01305
G1 X114.592 Y113.131 E.01305
G1 X114.274 Y113.412 E.01305
G1 X113.898 Y113.61 E.01305
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.512 Y111.963 E.01305
G1 X111.563 Y111.541 E.01305
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.505 Y110.718 E.0095
M204 S10000
; WIPE_START
G1 F24000
G1 X114.592 Y110.795 E-.04383
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.917 Y112.558 E-.07068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.063 J1.215 P1  F30000
G1 X149.671 Y114.361 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X110.875 Y114.361 E1.28693
G1 X110.875 Y109.565 E.15909
G1 X149.671 Y109.565 E1.28693
G1 X149.671 Y114.301 E.1571
G1 X150.063 Y114.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.666 J1.018 P1  F30000
G1 X149.467 Y113.776 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.32988
G1 F15000
G1 X148.251 Y114.157 E.0298
G1 X149.045 Y114.157 F30000
; LINE_WIDTH: 0.556112
G1 F12276.126
G1 X149.467 Y113.047 E.04968
G1 X149.467 Y110.878 F30000
; LINE_WIDTH: 0.511111
G1 F13456.065
G1 X149.045 Y109.768 E.04532
G1 X149.467 Y110.149 F30000
; LINE_WIDTH: 0.329879
G1 F15000
G1 X148.251 Y109.768 E.0298
G1 X146.295 Y109.768 F30000
; LINE_WIDTH: 0.130748
G1 F15000
G1 X146.094 Y109.907 E.00175
G1 X145.752 Y109.963 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X145.688 Y110 E.00204
G1 X145.737 Y110.028 E.00155
; WIPE_START
G1 F24000
G1 X145.688 Y110 E-.32874
G1 X145.752 Y109.963 E-.43126
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.217 J0 P1  F30000
G1 X145.752 Y113.889 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15000
G1 X145.688 Y113.926 E.00204
G1 X145.737 Y113.954 E.00155
G1 X146.094 Y114.018 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130746
G1 F15000
G1 X146.295 Y114.157 E.00175
G1 X145.003 Y114.193 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40324
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X145.003 Y113.058 E.0591
G1 X144.818 Y112.568 E.02725
G1 X144.744 Y111.963 E.03172
G1 X144.818 Y111.357 E.03172
G1 X145.003 Y110.868 E.02725
G1 X145.003 Y109.934 E.04856
G1 X144.55 Y109.934 E.02358
G1 X144.55 Y113.991 E.21107
G1 X144.097 Y113.991 E.02358
G1 X144.097 Y109.934 E.21107
G1 X143.644 Y109.934 E.02358
G1 X143.644 Y113.991 E.21107
G1 X143.19 Y113.991 E.02358
G1 X143.19 Y109.934 E.21107
G1 X142.737 Y109.934 E.02358
G1 X142.737 Y113.991 E.21107
G1 X142.284 Y113.991 E.02358
G1 X142.284 Y109.934 E.21107
G1 X141.831 Y109.934 E.02358
G1 X141.831 Y113.991 E.21107
M73 P91 R1
G1 X141.377 Y113.991 E.02358
G1 X141.377 Y109.934 E.21107
G1 X140.924 Y109.934 E.02358
G1 X140.924 Y113.991 E.21107
G1 X140.471 Y113.991 E.02358
G1 X140.471 Y109.934 E.21107
G1 X140.018 Y109.934 E.02358
G1 X140.018 Y113.991 E.21107
G1 X139.564 Y113.991 E.02358
G1 X139.564 Y109.934 E.21107
G1 X139.111 Y109.934 E.02358
G1 X139.111 Y113.991 E.21107
G1 X138.658 Y113.991 E.02358
G1 X138.658 Y109.934 E.21107
G1 X138.205 Y109.934 E.02358
G1 X138.205 Y113.991 E.21107
G1 X137.751 Y113.991 E.02358
G1 X137.751 Y109.934 E.21107
G1 X137.298 Y109.934 E.02358
G1 X137.298 Y113.991 E.21107
G1 X136.845 Y113.991 E.02358
G1 X136.845 Y109.934 E.21107
G1 X136.392 Y109.934 E.02358
G1 X136.392 Y113.991 E.21107
G1 X135.939 Y113.991 E.02358
G1 X135.939 Y109.934 E.21107
G1 X135.485 Y109.934 E.02358
G1 X135.485 Y113.991 E.21107
G1 X135.032 Y113.991 E.02358
G1 X135.032 Y109.934 E.21107
G1 X134.579 Y109.934 E.02358
G1 X134.579 Y113.991 E.21107
G1 X134.126 Y113.991 E.02358
G1 X134.126 Y109.934 E.21107
G1 X133.672 Y109.934 E.02358
G1 X133.672 Y113.991 E.21107
G1 X133.219 Y113.991 E.02358
G1 X133.219 Y109.934 E.21107
G1 X132.766 Y109.934 E.02358
G1 X132.766 Y113.991 E.21107
G1 X132.313 Y113.991 E.02358
G1 X132.313 Y109.934 E.21107
G1 X131.859 Y109.934 E.02358
G1 X131.859 Y113.991 E.21107
G1 X131.406 Y113.991 E.02358
G1 X131.406 Y109.934 E.21107
G1 X130.953 Y109.934 E.02358
G1 X130.953 Y113.991 E.21107
G1 X130.5 Y113.991 E.02358
G1 X130.5 Y109.934 E.21107
G1 X130.046 Y109.934 E.02358
G1 X130.046 Y113.991 E.21107
G1 X129.593 Y113.991 E.02358
G1 X129.593 Y109.934 E.21107
G1 X129.14 Y109.934 E.02358
G1 X129.14 Y113.991 E.21107
G1 X128.687 Y113.991 E.02358
G1 X128.687 Y109.934 E.21107
G1 X128.233 Y109.934 E.02358
G1 X128.233 Y113.991 E.21107
G1 X127.78 Y113.991 E.02358
G1 X127.78 Y109.934 E.21107
G1 X127.327 Y109.934 E.02358
G1 X127.327 Y113.991 E.21107
G1 X126.874 Y113.991 E.02358
G1 X126.874 Y109.934 E.21107
G1 X126.42 Y109.934 E.02358
G1 X126.42 Y113.991 E.21107
G1 X125.967 Y113.991 E.02358
G1 X125.967 Y109.934 E.21107
G1 X125.514 Y109.934 E.02358
G1 X125.514 Y113.991 E.21107
G1 X125.061 Y113.991 E.02358
G1 X125.061 Y109.934 E.21107
G1 X124.608 Y109.934 E.02358
G1 X124.608 Y113.991 E.21107
G1 X124.154 Y113.991 E.02358
G1 X124.154 Y109.934 E.21107
G1 X123.701 Y109.934 E.02358
G1 X123.701 Y113.991 E.21107
G1 X123.248 Y113.991 E.02358
G1 X123.248 Y109.934 E.21107
G1 X122.795 Y109.934 E.02358
G1 X122.795 Y113.991 E.21107
G1 X122.341 Y113.991 E.02358
G1 X122.341 Y109.934 E.21107
G1 X121.888 Y109.934 E.02358
G1 X121.888 Y113.991 E.21107
G1 X121.435 Y113.991 E.02358
G1 X121.435 Y109.934 E.21107
G1 X120.982 Y109.934 E.02358
G1 X120.982 Y113.991 E.21107
G1 X120.528 Y113.991 E.02358
G1 X120.528 Y109.934 E.21107
G1 X120.075 Y109.934 E.02358
G1 X120.075 Y113.991 E.21107
G1 X119.622 Y113.991 E.02358
G1 X119.622 Y109.934 E.21107
G1 X119.169 Y109.934 E.02358
G1 X119.169 Y113.991 E.21107
G1 X118.715 Y113.991 E.02358
G1 X118.715 Y109.934 E.21107
G1 X118.262 Y109.934 E.02358
G1 X118.262 Y113.991 E.21107
G1 X117.809 Y113.991 E.02358
G1 X117.809 Y109.934 E.21107
G1 X117.356 Y109.934 E.02358
G1 X117.356 Y113.991 E.21107
G1 X116.902 Y113.991 E.02358
G1 X116.902 Y109.934 E.21107
G1 X116.449 Y109.934 E.02358
G1 X116.449 Y113.991 E.21107
G1 X115.996 Y113.991 E.02358
G1 X115.996 Y109.934 E.21107
G1 X115.543 Y109.934 E.02358
G1 X115.543 Y110.868 E.04855
G1 X115.729 Y111.357 E.02726
G1 X115.802 Y111.963 E.03172
G1 X115.729 Y112.568 E.03172
G1 X115.543 Y113.058 E.02726
G1 X115.543 Y114.193 E.05909
M106 S242.25
G1 X114.834 Y113.888 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X114.77 Y113.925 E.00204
G1 X114.818 Y113.953 E.00155
G1 X114.452 Y114.018 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969195
G1 F15000
G1 X114.251 Y114.157 E.00108
G1 X112.295 Y114.157 F30000
; LINE_WIDTH: 0.309036
G1 F15000
G1 X111.079 Y113.776 E.02764
G1 X111.501 Y114.157 F30000
; LINE_WIDTH: 0.556114
G1 F12276.059
G1 X111.079 Y113.047 E.04968
G1 X111.079 Y110.878 F30000
; LINE_WIDTH: 0.556115
G1 F12276.054
G1 X111.501 Y109.768 E.04968
G1 X111.079 Y110.149 F30000
; LINE_WIDTH: 0.309035
G1 F15000
G1 X112.295 Y109.768 E.02764
G1 X114.251 Y109.768 F30000
; LINE_WIDTH: 0.0969202
G1 F15000
G1 X114.452 Y109.907 E.00108
G1 X114.836 Y109.967 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X114.772 Y110.004 E.00204
G1 X114.821 Y110.032 E.00155
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.772 Y110.004 E-.32874
G1 X114.836 Y109.967 E-.43126
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
G3 Z3 I-.649 J1.03 P1  F30000
G1 X145.113 Y129.034 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10423
G1 X145.091 Y129.002 E.0013
G1 X144.906 Y128.516 E.01725
G1 X144.844 Y128 E.01725
G1 X144.906 Y127.484 E.01725
G1 X145.091 Y126.998 E.01725
G1 X145.386 Y126.57 E.01725
G1 X145.775 Y126.225 E.01725
G1 X146.235 Y125.984 E.01725
G1 X146.74 Y125.859 E.01725
G1 X147.26 Y125.859 E.01725
G1 X147.765 Y125.984 E.01725
G1 X148.225 Y126.225 E.01725
G1 X148.614 Y126.57 E.01725
G1 X148.909 Y126.998 E.01725
G1 X149.094 Y127.484 E.01725
G1 X149.157 Y128 E.01725
G1 X149.094 Y128.516 E.01725
G1 X148.909 Y129.002 E.01725
G1 X148.614 Y129.43 E.01725
G1 X148.225 Y129.775 E.01725
G1 X147.765 Y130.016 E.01725
G1 X147.26 Y130.141 E.01725
G1 X146.74 Y130.141 E.01725
G1 X146.235 Y130.016 E.01725
G1 X145.775 Y129.775 E.01724
G1 X145.386 Y129.43 E.01725
G1 X145.147 Y129.084 E.01395
G1 X145.44 Y128.817 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10423
G1 X145.29 Y128.422 E.013
G1 X145.238 Y128 E.01305
G1 X145.29 Y127.578 E.01305
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.473 Y128.867 E.01126
M204 S10000
; WIPE_START
G1 F24000
G1 X145.29 Y128.422 E-.18295
G1 X145.238 Y128 E-.16137
G1 X145.29 Y127.578 E-.16137
G1 X145.44 Y127.181 E-.16137
G1 X145.579 Y126.98 E-.09294
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.015 J-1.217 P1  F30000
G1 X114.636 Y126.602 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10423
G1 X114.909 Y126.998 E.01595
G1 X115.094 Y127.484 E.01725
G1 X115.157 Y128 E.01725
G1 X115.094 Y128.516 E.01725
G1 X114.909 Y129.002 E.01725
G1 X114.614 Y129.43 E.01725
G1 X114.225 Y129.775 E.01725
G1 X113.765 Y130.016 E.01725
G1 X113.26 Y130.141 E.01725
G1 X112.74 Y130.141 E.01725
G1 X112.235 Y130.016 E.01725
G1 X111.775 Y129.775 E.01725
G1 X111.386 Y129.43 E.01725
G1 X111.091 Y129.002 E.01725
G1 X110.906 Y128.516 E.01725
M73 P92 R1
G1 X110.843 Y128 E.01725
G1 X110.906 Y127.484 E.01725
G1 X111.091 Y126.998 E.01725
G1 X111.386 Y126.57 E.01725
G1 X111.775 Y126.225 E.01725
G1 X112.235 Y125.984 E.01725
G1 X112.74 Y125.859 E.01725
G1 X113.26 Y125.859 E.01725
G1 X113.765 Y125.984 E.01725
G1 X114.225 Y126.225 E.01725
G1 X114.531 Y126.497 E.01358
G1 X114.599 Y126.556 E.00297
G1 X114.274 Y126.793 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10423
G1 X114.319 Y126.832 E.00181
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.56 Y128.819 E.01305
G1 X114.319 Y129.168 E.01305
G1 X114.001 Y129.45 E.01305
G1 X113.625 Y129.647 E.01305
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.238 Y128 E.01305
G1 X111.29 Y127.578 E.01305
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.229 Y126.753 E.00939
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.04524
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.646 Y128.592 E-.06928
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.063 J1.215 P1  F30000
G1 X149.398 Y130.398 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10423
G1 X110.602 Y130.398 E1.28693
G1 X110.602 Y125.602 E.15909
G1 X149.398 Y125.602 E1.28693
G1 X149.398 Y130.338 E.1571
G1 X149.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10423
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.666 J1.018 P1  F30000
G1 X149.194 Y129.814 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.32988
G1 F10423
G1 X147.978 Y130.194 E.0298
G1 X148.772 Y130.194 F30000
; LINE_WIDTH: 0.556116
G1 F10423
G1 X149.194 Y129.084 E.04968
G1 X149.194 Y126.916 F30000
; LINE_WIDTH: 0.511113
G1 F10423
G1 X148.772 Y125.806 E.04532
G1 X149.194 Y126.186 F30000
; LINE_WIDTH: 0.32988
G1 F10423
G1 X147.978 Y125.806 E.0298
G1 X146.022 Y125.806 F30000
; LINE_WIDTH: 0.130748
G1 F10423
G1 X145.821 Y125.945 E.00175
; WIPE_START
G1 F24000
G1 X146.022 Y125.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.217 J0 P1  F30000
G1 X146.022 Y130.194 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.130745
G1 F10423
G1 X145.821 Y130.055 E.00175
G1 X143.703 Y128.114 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F10423
G1 X143.771 Y127.321 E.02444
M73 P92 R0
G1 X143.959 Y126.748 E.01853
G1 X116.041 Y126.748 E.85786
G1 X116.229 Y127.321 E.01853
G1 X116.297 Y127.886 E.01749
G1 X116.229 Y128.679 E.02444
G1 X116.041 Y129.252 E.01853
G1 X143.959 Y129.252 E.85786
G1 X143.771 Y128.679 E.01853
G1 X143.71 Y128.173 E.01565
G1 X143.328 Y127.841 F30000
G1 F10423
G1 X143.397 Y127.276 E.01749
G1 X143.434 Y127.125 E.00476
G1 X116.566 Y127.125 E.82558
G1 X116.672 Y127.841 E.02222
G3 X116.566 Y128.875 I-4.895 J.022 E.03199
G1 X143.434 Y128.875 E.82558
G1 X143.328 Y128.159 E.02222
G1 X143.328 Y127.901 E.00793
G1 X142.608 Y127.846 F30000
; LINE_WIDTH: 0.351909
G1 F10423
G1 X117.392 Y127.846 E.6349
G1 X117.392 Y128.154 E.00778
G1 X142.608 Y128.154 E.6349
G1 X142.608 Y127.906 E.00627
G1 X117.058 Y128 F30000
; LINE_WIDTH: 0.419999
G1 F10423
G1 X117.01 Y128.498 E.01536
G1 X142.99 Y128.498 E.79826
G1 X142.942 Y128 E.01536
G1 X142.99 Y127.502 E.01536
G1 X117.01 Y127.502 E.79826
G1 X117.053 Y127.94 E.01351
G1 X115.923 Y127.932 F30000
G1 F10423
G1 X115.854 Y128.633 E.02166
G1 X115.62 Y129.298 E.02166
G1 X115.412 Y129.629 E.01201
G1 X144.588 Y129.629 E.89652
G1 X144.38 Y129.298 E.01201
G1 X144.178 Y128.766 E.01749
G1 X144.077 Y128.068 E.02166
G1 X144.146 Y127.367 E.02166
G1 X144.38 Y126.702 E.02166
G1 X144.588 Y126.371 E.01201
G1 X115.412 Y126.371 E.89652
G1 X115.62 Y126.702 E.01201
G1 X115.822 Y127.234 E.01749
G1 X115.914 Y127.872 E.01981
G1 X115.549 Y127.977 F30000
G1 F10423
G1 X115.48 Y128.588 E.01888
G1 X115.267 Y129.164 E.01888
G1 X114.923 Y129.673 E.01888
G1 X114.612 Y129.992 E.01369
G1 X115.667 Y130.006 E.03241
G1 X145.378 Y130.006 E.91296
G2 X145.383 Y129.951 I-.029 J-.03 E.00184
G1 X145.077 Y129.673 E.0127
G1 X144.754 Y129.205 E.01749
G1 X144.531 Y128.632 E.01888
G1 X144.451 Y128.023 E.01888
G1 X144.52 Y127.412 E.01888
G1 X144.733 Y126.836 E.01888
G1 X145.077 Y126.327 E.01888
G1 X145.388 Y126.008 E.01369
G1 X144.333 Y125.994 E.03241
G1 X114.622 Y125.994 E.91295
G1 X114.617 Y126.049 E.00169
G1 X114.923 Y126.327 E.01269
G1 X115.246 Y126.795 E.01749
G1 X115.469 Y127.368 E.01888
G1 X115.541 Y127.918 E.01704
G1 X114.179 Y125.945 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969202
G1 F10423
G1 X113.978 Y125.806 E.00108
G1 X112.022 Y125.806 F30000
; LINE_WIDTH: 0.309036
G1 F10423
G1 X110.806 Y126.186 E.02764
G1 X111.228 Y125.806 F30000
; LINE_WIDTH: 0.55611
G1 F10423
G1 X110.806 Y126.916 E.04967
G1 X110.806 Y129.084 F30000
; LINE_WIDTH: 0.556114
G1 F10423
G1 X111.228 Y130.194 E.04968
G1 X110.806 Y129.814 F30000
; LINE_WIDTH: 0.309036
G1 F10423
G1 X112.022 Y130.194 E.02764
G1 X113.978 Y130.194 F30000
; LINE_WIDTH: 0.0969193
G1 F10423
G1 X114.179 Y130.055 E.00108
; WIPE_START
G1 F24000
G1 X113.978 Y130.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.584 J1.067 P1  F30000
G1 X145.386 Y112.997 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10423
G1 X145.364 Y112.965 E.0013
G1 X145.179 Y112.479 E.01725
G1 X145.117 Y111.963 E.01725
G1 X145.179 Y111.447 E.01725
G1 X145.364 Y110.96 E.01725
G1 X145.659 Y110.533 E.01725
G1 X146.048 Y110.188 E.01725
G1 X146.508 Y109.946 E.01725
G1 X147.013 Y109.822 E.01725
G1 X147.533 Y109.822 E.01725
G1 X148.038 Y109.946 E.01725
G1 X148.498 Y110.188 E.01725
G1 X148.887 Y110.533 E.01725
G1 X149.183 Y110.96 E.01725
G1 X149.367 Y111.447 E.01725
G1 X149.43 Y111.963 E.01725
G1 X149.367 Y112.479 E.01725
G1 X149.183 Y112.965 E.01725
G1 X148.887 Y113.393 E.01725
G1 X148.498 Y113.737 E.01725
G1 X148.038 Y113.979 E.01725
G1 X147.533 Y114.103 E.01725
G1 X147.013 Y114.103 E.01725
G1 X146.508 Y113.979 E.01725
G1 X146.048 Y113.737 E.01724
G1 X145.659 Y113.393 E.01725
G1 X145.42 Y113.046 E.01395
G1 X145.713 Y112.78 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10423
G1 X145.563 Y112.384 E.013
G1 X145.512 Y111.963 E.01305
G1 X145.563 Y111.541 E.01305
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.746 Y112.829 E.01126
M204 S10000
; WIPE_START
G1 F24000
G1 X145.563 Y112.384 E-.18295
G1 X145.512 Y111.963 E-.16137
G1 X145.563 Y111.541 E-.16137
G1 X145.713 Y111.144 E-.16137
G1 X145.852 Y110.943 E-.09294
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.015 J-1.217 P1  F30000
G1 X114.909 Y110.565 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10423
G1 X115.183 Y110.96 E.01595
G1 X115.367 Y111.447 E.01725
G1 X115.43 Y111.963 E.01725
G1 X115.367 Y112.479 E.01725
G1 X115.183 Y112.965 E.01725
G1 X114.887 Y113.393 E.01725
G1 X114.498 Y113.737 E.01725
G1 X114.038 Y113.979 E.01725
G1 X113.533 Y114.103 E.01725
G1 X113.013 Y114.103 E.01725
G1 X112.508 Y113.979 E.01725
G1 X112.048 Y113.737 E.01725
G1 X111.659 Y113.393 E.01725
G1 X111.364 Y112.965 E.01725
G1 X111.179 Y112.479 E.01725
G1 X111.117 Y111.963 E.01725
G1 X111.179 Y111.447 E.01725
G1 X111.364 Y110.96 E.01725
G1 X111.659 Y110.533 E.01725
G1 X112.048 Y110.188 E.01725
G1 X112.508 Y109.946 E.01725
G1 X113.013 Y109.822 E.01725
G1 X113.533 Y109.822 E.01725
G1 X114.038 Y109.946 E.01725
G1 X114.498 Y110.188 E.01725
G1 X114.805 Y110.459 E.01358
G1 X114.872 Y110.519 E.00297
G1 X114.547 Y110.755 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10423
G1 X114.592 Y110.795 E.00181
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.833 Y112.781 E.01305
G1 X114.592 Y113.131 E.01305
G1 X114.274 Y113.412 E.01305
G1 X113.898 Y113.61 E.01305
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.512 Y111.963 E.01305
G1 X111.563 Y111.541 E.01305
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.502 Y110.716 E.00939
M204 S10000
; WIPE_START
G1 F24000
G1 X114.592 Y110.795 E-.04524
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.919 Y112.555 E-.06928
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.063 J1.215 P1  F30000
G1 X149.671 Y114.361 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10423
G1 X110.875 Y114.361 E1.28693
G1 X110.875 Y109.565 E.15909
G1 X149.671 Y109.565 E1.28693
G1 X149.671 Y114.301 E.1571
G1 X150.063 Y114.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10423
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.666 J1.018 P1  F30000
G1 X149.467 Y113.776 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.32988
G1 F10423
G1 X148.251 Y114.157 E.0298
G1 X149.045 Y114.157 F30000
; LINE_WIDTH: 0.556116
G1 F10423
G1 X149.467 Y113.047 E.04968
G1 X149.467 Y110.878 F30000
; LINE_WIDTH: 0.511113
G1 F10423
G1 X149.045 Y109.768 E.04532
G1 X149.467 Y110.149 F30000
; LINE_WIDTH: 0.32988
G1 F10423
G1 X148.251 Y109.768 E.0298
G1 X146.295 Y109.768 F30000
; LINE_WIDTH: 0.130748
G1 F10423
G1 X146.094 Y109.907 E.00175
; WIPE_START
G1 F24000
G1 X146.295 Y109.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.217 J0 P1  F30000
G1 X146.295 Y114.157 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.130745
G1 F10423
G1 X146.094 Y114.018 E.00175
G1 X143.976 Y112.076 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F10423
G1 X144.044 Y111.284 E.02444
G1 X144.232 Y110.711 E.01853
G1 X116.314 Y110.711 E.85786
G1 X116.502 Y111.284 E.01853
G1 X116.57 Y111.849 E.01749
G1 X116.502 Y112.641 E.02444
M73 P93 R0
G1 X116.314 Y113.214 E.01853
G1 X144.232 Y113.214 E.85786
G1 X144.044 Y112.641 E.01853
G1 X143.983 Y112.136 E.01565
G1 X143.601 Y111.804 F30000
G1 F10423
G1 X143.67 Y111.238 E.01749
G1 X143.707 Y111.088 E.00476
G1 X116.839 Y111.088 E.82558
G1 X116.945 Y111.804 E.02222
G3 X116.839 Y112.837 I-4.895 J.022 E.03199
G1 X143.707 Y112.837 E.82558
G1 X143.601 Y112.122 E.02222
G1 X143.601 Y111.864 E.00793
G1 X142.881 Y111.808 F30000
; LINE_WIDTH: 0.351909
G1 F10423
G1 X117.665 Y111.808 E.6349
G1 X117.665 Y112.117 E.00778
G1 X142.881 Y112.117 E.6349
G1 X142.881 Y111.868 E.00627
G1 X117.331 Y111.963 F30000
; LINE_WIDTH: 0.419999
G1 F10423
G1 X117.283 Y112.46 E.01536
G1 X143.263 Y112.46 E.79826
G1 X143.215 Y111.963 E.01536
G1 X143.263 Y111.465 E.01536
G1 X117.283 Y111.465 E.79826
G1 X117.326 Y111.903 E.01351
G1 X116.196 Y111.894 F30000
G1 F10423
G1 X116.127 Y112.596 E.02166
G1 X115.893 Y113.261 E.02166
G1 X115.685 Y113.591 E.01201
G1 X144.861 Y113.591 E.89652
G1 X144.653 Y113.261 E.01201
G1 X144.451 Y112.728 E.01749
G1 X144.35 Y112.031 E.02166
G1 X144.419 Y111.329 E.02166
G1 X144.653 Y110.665 E.02166
G1 X144.861 Y110.334 E.01201
G1 X115.685 Y110.334 E.89652
G1 X115.893 Y110.665 E.01201
G1 X116.095 Y111.197 E.01749
G1 X116.187 Y111.835 E.01981
G1 X115.822 Y111.94 F30000
G1 F10423
G1 X115.753 Y112.551 E.01888
G1 X115.54 Y113.127 E.01888
G1 X115.196 Y113.636 E.01888
G1 X114.885 Y113.955 E.01369
G1 X115.94 Y113.968 E.03241
G1 X145.652 Y113.968 E.91296
G2 X145.656 Y113.914 I-.029 J-.03 E.00184
G1 X145.35 Y113.636 E.0127
G1 X145.027 Y113.167 E.01749
G1 X144.804 Y112.595 E.01888
G1 X144.724 Y111.985 E.01888
G1 X144.793 Y111.375 E.01888
G1 X145.006 Y110.798 E.01888
G1 X145.35 Y110.29 E.01888
G1 X145.661 Y109.97 E.01369
G1 X144.606 Y109.957 E.03241
G1 X114.895 Y109.957 E.91295
G1 X114.89 Y110.012 E.00169
G1 X115.196 Y110.29 E.01269
G1 X115.519 Y110.758 E.01749
G1 X115.742 Y111.331 E.01888
G1 X115.814 Y111.88 E.01704
G1 X114.452 Y109.907 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969202
G1 F10423
G1 X114.251 Y109.768 E.00108
G1 X112.295 Y109.768 F30000
; LINE_WIDTH: 0.309036
G1 F10423
G1 X111.079 Y110.149 E.02764
G1 X111.501 Y109.768 F30000
; LINE_WIDTH: 0.55611
G1 F10423
G1 X111.079 Y110.878 E.04967
G1 X111.079 Y113.047 F30000
; LINE_WIDTH: 0.556114
G1 F10423
G1 X111.501 Y114.157 E.04968
G1 X111.079 Y113.776 F30000
; LINE_WIDTH: 0.309036
G1 F10423
G1 X112.295 Y114.157 E.02764
G1 X114.251 Y114.157 F30000
; LINE_WIDTH: 0.0969193
G1 F10423
G1 X114.452 Y114.018 E.00108
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.251 Y114.157 E-.76
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
G3 Z3.2 I-.518 J1.101 P1  F30000
G1 X145.441 Y128.82 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.44 Y128.819 E.00007
G1 X145.29 Y128.422 E.01305
G1 X145.243 Y128.038 E.01188
G1 X145.29 Y127.578 E.01418
G1 X145.44 Y127.181 E.01305
G1 X145.681 Y126.832 E.01305
G1 X145.999 Y126.55 E.01305
G1 X146.375 Y126.353 E.01305
G1 X146.788 Y126.251 E.01305
G1 X147.212 Y126.251 E.01305
G1 X147.625 Y126.353 E.01305
G1 X148.001 Y126.55 E.01305
G1 X148.319 Y126.832 E.01305
G1 X148.56 Y127.181 E.01305
G1 X148.71 Y127.578 E.01305
G1 X148.762 Y128 E.01305
G1 X148.71 Y128.422 E.01305
G1 X148.56 Y128.819 E.01305
G1 X148.319 Y129.168 E.01305
G1 X148.001 Y129.45 E.01305
G1 X147.625 Y129.647 E.01305
G1 X147.212 Y129.749 E.01305
G1 X146.788 Y129.749 E.01305
G1 X146.375 Y129.647 E.01305
G1 X145.999 Y129.45 E.01305
G1 X145.681 Y129.168 E.01305
G1 X145.476 Y128.87 E.01114
M204 S10000
; WIPE_START
G1 F24000
G1 X145.44 Y128.819 E-.02362
G1 X145.29 Y128.422 E-.16137
G1 X145.243 Y128.038 E-.14695
G1 X145.29 Y127.578 E-.17541
G1 X145.44 Y127.181 E-.16137
G1 X145.577 Y126.984 E-.09128
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.008 J-1.217 P1  F30000
G1 X114.272 Y126.791 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X114.319 Y126.832 E.00192
G1 X114.56 Y127.181 E.01305
G1 X114.71 Y127.578 E.01305
G1 X114.762 Y128 E.01305
G1 X114.71 Y128.422 E.01305
G1 X114.573 Y128.783 E.01188
G1 X114.319 Y129.168 E.01418
G1 X113.967 Y129.467 E.01418
G1 X113.625 Y129.647 E.01188
G1 X113.212 Y129.749 E.01305
G1 X112.788 Y129.749 E.01305
G1 X112.375 Y129.647 E.01305
G1 X111.999 Y129.45 E.01305
G1 X111.681 Y129.168 E.01305
G1 X111.44 Y128.819 E.01305
G1 X111.29 Y128.422 E.01305
G1 X111.243 Y128.038 E.01188
G1 X111.29 Y127.578 E.01418
G1 X111.44 Y127.181 E.01305
G1 X111.681 Y126.832 E.01305
G1 X111.999 Y126.55 E.01305
G1 X112.375 Y126.353 E.01305
G1 X112.788 Y126.251 E.01305
G1 X113.212 Y126.251 E.01305
G1 X113.625 Y126.353 E.01305
G1 X114.001 Y126.55 E.01305
G1 X114.227 Y126.751 E.00929
M204 S10000
; WIPE_START
G1 F24000
G1 X114.319 Y126.832 E-.0465
G1 X114.56 Y127.181 E-.16137
G1 X114.71 Y127.578 E-.16137
G1 X114.762 Y128 E-.16137
G1 X114.71 Y128.422 E-.16137
G1 X114.647 Y128.589 E-.06801
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.076 J1.215 P1  F30000
G1 X149.79 Y130.79 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X110.21 Y130.79 E1.21618
G1 X110.21 Y125.21 E.17146
G1 X149.79 Y125.21 E1.21618
G1 X149.79 Y130.73 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X147.79 Y130.733 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.186 J.273 P1  F30000
G1 X149.015 Y125.417 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X149.583 Y125.985 E.02468
G1 X149.583 Y126.519
G1 X148.481 Y125.417 E.04785
G1 X147.948 Y125.417
G1 X149.583 Y127.052 E.07102
G1 X149.583 Y127.585
G1 X147.415 Y125.417 E.0942
G1 X147.597 Y126.132
G1 X146.882 Y125.417 E.03107
G1 X146.348 Y125.417
G1 X146.975 Y126.044 E.02723
G1 X146.505 Y126.107
G1 X145.815 Y125.417 E.02998
G1 X145.282 Y125.417
G1 X146.118 Y126.254 E.03634
G1 X145.79 Y126.459
G1 X144.749 Y125.417 E.04525
G1 X144.215 Y125.417
G1 X145.511 Y126.713 E.05632
G1 X145.294 Y127.029
G1 X143.682 Y125.417 E.07003
G1 X143.149 Y125.417
G1 X145.134 Y127.403 E.08628
G1 X145.053 Y127.855
G1 X142.616 Y125.417 E.10593
G1 X142.082 Y125.417
G1 X145.08 Y128.415 E.13026
M204 S10000
; WIPE_START
G1 F24000
G1 X143.666 Y127.001 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.093 J1.213 P1  F30000
G1 X148.865 Y127.4 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X149.583 Y128.118 E.0312
G1 X149.583 Y128.652
G1 X148.966 Y128.035 E.02679
G1 X148.901 Y128.503
G1 X149.583 Y129.185 E.02961
G1 X149.583 Y129.718
G1 X148.755 Y128.89 E.03599
G1 X148.541 Y129.21
G1 X149.583 Y130.251 E.04524
G1 X149.381 Y130.583
G1 X148.279 Y129.481 E.04789
G1 X147.967 Y129.702
G1 X148.847 Y130.583 E.03827
G1 X148.314 Y130.583
G1 X147.599 Y129.867 E.03109
G1 X147.154 Y129.956
G1 X147.781 Y130.583 E.02723
G1 X147.247 Y130.583
G1 X146.575 Y129.91 E.02924
G1 X146.714 Y130.583
G1 X141.549 Y125.417 E.22445
G1 X141.016 Y125.417
G1 X146.181 Y130.583 E.22445
G1 X145.648 Y130.583
G1 X140.482 Y125.417 E.22445
G1 X139.949 Y125.417
G1 X145.114 Y130.583 E.22445
G1 X144.581 Y130.583
G1 X139.416 Y125.417 E.22445
M73 P94 R0
G1 X138.883 Y125.417
G1 X144.048 Y130.583 E.22445
G1 X143.515 Y130.583
G1 X138.349 Y125.417 E.22445
G1 X137.816 Y125.417
G1 X142.981 Y130.583 E.22445
G1 X142.448 Y130.583
G1 X137.283 Y125.417 E.22445
G1 X136.75 Y125.417
G1 X141.915 Y130.583 E.22445
G1 X141.381 Y130.583
G1 X136.216 Y125.417 E.22445
G1 X135.683 Y125.417
G1 X140.848 Y130.583 E.22445
G1 X140.315 Y130.583
G1 X135.15 Y125.417 E.22445
G1 X134.616 Y125.417
G1 X139.782 Y130.583 E.22445
G1 X139.248 Y130.583
G1 X134.083 Y125.417 E.22445
G1 X133.55 Y125.417
G1 X138.715 Y130.583 E.22445
G1 X138.182 Y130.583
G1 X133.017 Y125.417 E.22445
G1 X132.483 Y125.417
G1 X137.649 Y130.583 E.22445
G1 X137.115 Y130.583
G1 X131.95 Y125.417 E.22445
G1 X131.417 Y125.417
G1 X136.582 Y130.583 E.22445
G1 X136.049 Y130.583
G1 X130.884 Y125.417 E.22445
G1 X130.35 Y125.417
G1 X135.516 Y130.583 E.22445
G1 X134.982 Y130.583
G1 X129.817 Y125.417 E.22445
G1 X129.284 Y125.417
G1 X134.449 Y130.583 E.22445
G1 X133.916 Y130.583
G1 X128.75 Y125.417 E.22445
G1 X128.217 Y125.417
G1 X133.382 Y130.583 E.22445
G1 X132.849 Y130.583
G1 X127.684 Y125.417 E.22445
G1 X127.151 Y125.417
G1 X132.316 Y130.583 E.22445
G1 X131.783 Y130.583
G1 X126.617 Y125.417 E.22445
G1 X126.084 Y125.417
G1 X131.249 Y130.583 E.22445
G1 X130.716 Y130.583
G1 X125.551 Y125.417 E.22445
G1 X125.018 Y125.417
G1 X130.183 Y130.583 E.22445
G1 X129.65 Y130.583
G1 X124.484 Y125.417 E.22445
G1 X123.951 Y125.417
G1 X129.116 Y130.583 E.22445
G1 X128.583 Y130.583
G1 X123.418 Y125.417 E.22445
G1 X122.885 Y125.417
G1 X128.05 Y130.583 E.22445
G1 X127.516 Y130.583
G1 X122.351 Y125.417 E.22445
G1 X121.818 Y125.417
G1 X126.983 Y130.583 E.22445
G1 X126.45 Y130.583
G1 X121.285 Y125.417 E.22445
G1 X120.751 Y125.417
G1 X125.917 Y130.583 E.22445
G1 X125.383 Y130.583
G1 X120.218 Y125.417 E.22445
G1 X119.685 Y125.417
G1 X124.85 Y130.583 E.22445
G1 X124.317 Y130.583
G1 X119.152 Y125.417 E.22445
G1 X118.618 Y125.417
G1 X123.784 Y130.583 E.22445
G1 X123.25 Y130.583
G1 X118.085 Y125.417 E.22445
G1 X117.552 Y125.417
G1 X122.717 Y130.583 E.22445
G1 X122.184 Y130.583
G1 X117.019 Y125.417 E.22445
G1 X116.485 Y125.417
G1 X121.65 Y130.583 E.22445
G1 X121.117 Y130.583
G1 X115.952 Y125.417 E.22445
G1 X115.419 Y125.417
G1 X120.584 Y130.583 E.22445
G1 X120.051 Y130.583
G1 X114.885 Y125.417 E.22445
G1 X114.352 Y125.417
G1 X119.517 Y130.583 E.22445
G1 X118.984 Y130.583
G1 X113.819 Y125.417 E.22445
G1 X113.286 Y125.417
G1 X118.451 Y130.583 E.22445
G1 X117.918 Y130.583
G1 X114.92 Y127.585 E.13026
G1 X114.952 Y128.15
G1 X117.384 Y130.583 E.10569
G1 X116.851 Y130.583
G1 X114.866 Y128.597 E.08628
G1 X114.701 Y128.966
G1 X116.318 Y130.583 E.07026
G1 X115.785 Y130.583
G1 X114.489 Y129.287 E.05631
G1 X114.205 Y129.537
G1 X115.251 Y130.583 E.04545
G1 X114.718 Y130.583
G1 X113.882 Y129.746 E.03634
G1 X113.495 Y129.893
G1 X114.185 Y130.583 E.02998
G1 X113.651 Y130.583
G1 X113.025 Y129.956 E.02723
G1 X112.403 Y129.868
G1 X113.118 Y130.583 E.03107
M204 S10000
; WIPE_START
G1 F24000
G1 X112.403 Y129.868 E-.3843
G1 X113.025 Y129.956 E-.23869
G1 X113.28 Y130.211 E-.13701
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.216 J.043 P1  F30000
G1 X113.425 Y126.09 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X112.752 Y125.417 E.02924
G1 X112.219 Y125.417
G1 X112.846 Y126.044 E.02723
G1 X112.401 Y126.133
G1 X111.686 Y125.417 E.03109
G1 X111.153 Y125.417
M73 P95 R0
G1 X112.033 Y126.298 E.03827
G1 X111.721 Y126.519
G1 X110.619 Y125.417 E.04789
G1 X110.417 Y125.749
G1 X111.458 Y126.79 E.04524
G1 X111.245 Y127.11
G1 X110.417 Y126.282 E.03598
G1 X110.417 Y126.815
G1 X111.099 Y127.497 E.02961
G1 X111.041 Y127.972
G1 X110.417 Y127.349 E.02711
G1 X110.417 Y127.882
G1 X111.135 Y128.6 E.0312
G1 X110.417 Y128.415
G1 X112.585 Y130.583 E.09419
G1 X112.052 Y130.583
G1 X110.417 Y128.948 E.07102
G1 X110.417 Y129.482
G1 X111.518 Y130.583 E.04784
G1 X110.985 Y130.583
G1 X110.417 Y130.015 E.02467
M204 S10000
; WIPE_START
G1 F24000
G1 X110.985 Y130.583 E-.30508
G1 X111.518 Y130.583 E-.20264
G1 X111.049 Y130.113 E-.25227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.697 J.997 P1  F30000
G1 X114.972 Y127.371 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.120545
G1 F15000
G1 X114.91 Y127.595 E.00147
; WIPE_START
G1 F24000
G1 X114.972 Y127.371 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.023 J1.217 P1  F30000
G1 X144.975 Y127.933 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.11232
G1 F15000
G2 X145.044 Y128.091 I1.425 J-.532 E.00098
G1 X145.028 Y128.63 F30000
; LINE_WIDTH: 0.12036
G1 F15000
G1 X145.09 Y128.405 E.00147
; WIPE_START
G1 F24000
G1 X145.028 Y128.63 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.831 J.889 P1  F30000
G1 X146.43 Y129.94 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10672
G1 F15000
G3 X146.232 Y129.806 I.99 J-1.683 E.00124
; WIPE_START
G1 F24000
G1 X146.43 Y129.94 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.926 J.789 P1  F30000
G1 X146.959 Y130.561 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.103642
G1 F15000
G1 X146.821 Y130.581 E.00069
; WIPE_START
G1 F24000
G1 X146.959 Y130.561 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.025 J-1.217 P1  F30000
G1 X112.408 Y129.863 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.171979
G1 F15000
G1 X112.27 Y129.892 E.00149
; LINE_WIDTH: 0.197216
G1 X112.166 Y129.816 E.00161
; LINE_WIDTH: 0.160867
G1 X112.063 Y129.74 E.00123
; LINE_WIDTH: 0.124518
G1 X111.96 Y129.664 E.00085
G1 X111.341 Y129.043 F30000
; LINE_WIDTH: 0.102494
G1 F15000
G3 X111.101 Y128.733 I2.424 J-2.119 E.0019
G1 X110.439 Y128.17 F30000
; LINE_WIDTH: 0.112497
G1 F15000
G1 X110.418 Y128.332 E.00093
G1 X111.053 Y127.961 F30000
; LINE_WIDTH: 0.106107
G1 F15000
G1 X110.969 Y128.167 E.00114
; WIPE_START
G1 F24000
G1 X111.053 Y127.961 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.664 J1.02 P1  F30000
G1 X113.768 Y126.193 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.100533
G1 F15000
G2 X113.5 Y126.015 I-1.59 J2.096 E.00151
; WIPE_START
G1 F24000
G1 X113.768 Y126.193 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.028 J1.217 P1  F30000
G1 X147.331 Y125.418 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881701
G1 F15000
G1 X147.169 Y125.439 E.0006
; WIPE_START
G1 F24000
G1 X147.331 Y125.418 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.963 J.744 P1  F30000
G1 X148.04 Y126.336 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X147.88 Y126.219 E.00073
; LINE_WIDTH: 0.131628
G1 X147.72 Y126.101 E.00143
; WIPE_START
G1 F24000
G1 X147.88 Y126.219 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.878 J.842 P1  F30000
G1 X148.94 Y127.324 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.113155
G1 F15000
G2 X148.659 Y126.958 I-3.149 J2.122 E.00265
; WIPE_START
G1 F24000
G1 X148.94 Y127.324 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.188 J-.264 P1  F30000
G1 X145.715 Y112.783 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.713 Y112.781 E.00007
G1 X145.563 Y112.384 E.01305
G1 X145.516 Y112 E.01188
G1 X145.563 Y111.541 E.01418
G1 X145.713 Y111.144 E.01305
G1 X145.955 Y110.795 E.01305
G1 X146.272 Y110.513 E.01305
G1 X146.648 Y110.316 E.01305
G1 X147.061 Y110.214 E.01305
G1 X147.485 Y110.214 E.01305
G1 X147.898 Y110.316 E.01305
G1 X148.274 Y110.513 E.01305
G1 X148.592 Y110.795 E.01305
G1 X148.833 Y111.144 E.01305
G1 X148.983 Y111.541 E.01305
G1 X149.035 Y111.963 E.01305
G1 X148.983 Y112.384 E.01305
G1 X148.833 Y112.781 E.01305
G1 X148.592 Y113.131 E.01305
G1 X148.274 Y113.412 E.01305
G1 X147.898 Y113.61 E.01305
G1 X147.485 Y113.711 E.01305
G1 X147.061 Y113.711 E.01305
G1 X146.648 Y113.61 E.01305
G1 X146.272 Y113.412 E.01305
G1 X145.955 Y113.131 E.01305
G1 X145.749 Y112.832 E.01114
M204 S10000
; WIPE_START
G1 F24000
G1 X145.713 Y112.781 E-.02362
G1 X145.563 Y112.384 E-.16137
G1 X145.516 Y112 E-.14695
G1 X145.563 Y111.541 E-.17541
G1 X145.713 Y111.144 E-.16137
G1 X145.85 Y110.946 E-.09128
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.008 J-1.217 P1  F30000
G1 X114.545 Y110.753 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X114.592 Y110.795 E.00192
G1 X114.833 Y111.144 E.01305
G1 X114.983 Y111.541 E.01305
G1 X115.035 Y111.963 E.01305
G1 X114.983 Y112.384 E.01305
G1 X114.846 Y112.746 E.01188
G1 X114.592 Y113.131 E.01418
G1 X114.24 Y113.43 E.01418
G1 X113.898 Y113.61 E.01188
G1 X113.485 Y113.711 E.01305
G1 X113.061 Y113.711 E.01305
G1 X112.648 Y113.61 E.01305
G1 X112.272 Y113.412 E.01305
G1 X111.955 Y113.131 E.01305
G1 X111.713 Y112.781 E.01305
G1 X111.563 Y112.384 E.01305
G1 X111.516 Y112 E.01188
G1 X111.563 Y111.541 E.01418
G1 X111.713 Y111.144 E.01305
G1 X111.955 Y110.795 E.01305
G1 X112.272 Y110.513 E.01305
G1 X112.648 Y110.316 E.01305
G1 X113.061 Y110.214 E.01305
G1 X113.485 Y110.214 E.01305
G1 X113.898 Y110.316 E.01305
G1 X114.274 Y110.513 E.01305
G1 X114.5 Y110.713 E.00929
M204 S10000
; WIPE_START
G1 F24000
G1 X114.592 Y110.795 E-.0465
G1 X114.833 Y111.144 E-.16137
G1 X114.983 Y111.541 E-.16137
G1 X115.035 Y111.963 E-.16137
G1 X114.983 Y112.384 E-.16137
G1 X114.92 Y112.552 E-.06801
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.076 J1.215 P1  F30000
G1 X150.063 Y114.753 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X110.483 Y114.753 E1.21618
G1 X110.483 Y109.173 E.17146
G1 X150.063 Y109.173 E1.21618
G1 X150.063 Y114.693 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X148.063 Y114.696 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.186 J.273 P1  F30000
G1 X149.288 Y109.38 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X149.856 Y109.948 E.02468
G1 X149.856 Y110.481
G1 X148.755 Y109.38 E.04785
G1 X148.221 Y109.38
G1 X149.856 Y111.014 E.07102
G1 X149.856 Y111.548
G1 X147.688 Y109.38 E.0942
G1 X147.87 Y110.095
G1 X147.155 Y109.38 E.03107
G1 X146.621 Y109.38
G1 X147.248 Y110.007 E.02723
G1 X146.778 Y110.07
G1 X146.088 Y109.38 E.02998
G1 X145.555 Y109.38
G1 X146.391 Y110.216 E.03634
G1 X146.063 Y110.421
G1 X145.022 Y109.38 E.04525
G1 X144.488 Y109.38
G1 X145.784 Y110.676 E.05632
G1 X145.567 Y110.991
G1 X143.955 Y109.38 E.07003
G1 X143.422 Y109.38
G1 X145.407 Y111.366 E.08628
G1 X145.326 Y111.818
G1 X142.889 Y109.38 E.10593
G1 X142.355 Y109.38
G1 X145.353 Y112.378 E.13026
M204 S10000
; WIPE_START
G1 F24000
G1 X143.939 Y110.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.093 J1.213 P1  F30000
G1 X149.138 Y111.363 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X149.856 Y112.081 E.0312
G1 X149.856 Y112.614
G1 X149.239 Y111.998 E.02679
G1 X149.174 Y112.466
G1 X149.856 Y113.147 E.02961
G1 X149.856 Y113.681
G1 X149.028 Y112.853 E.03599
G1 X148.815 Y113.173
G1 X149.856 Y114.214 E.04524
G1 X149.654 Y114.545
G1 X148.552 Y113.443 E.04789
G1 X148.24 Y113.665
G1 X149.12 Y114.545 E.03827
G1 X148.587 Y114.545
G1 X147.872 Y113.83 E.03109
G1 X147.427 Y113.919
G1 X148.054 Y114.545 E.02723
G1 X147.521 Y114.545
G1 X146.848 Y113.872 E.02924
G1 X146.987 Y114.545
G1 X141.822 Y109.38 E.22445
G1 X141.289 Y109.38
G1 X146.454 Y114.545 E.22445
G1 X145.921 Y114.545
G1 X140.755 Y109.38 E.22445
G1 X140.222 Y109.38
G1 X145.387 Y114.545 E.22445
G1 X144.854 Y114.545
M73 P96 R0
G1 X139.689 Y109.38 E.22445
G1 X139.156 Y109.38
G1 X144.321 Y114.545 E.22445
G1 X143.788 Y114.545
G1 X138.622 Y109.38 E.22445
G1 X138.089 Y109.38
G1 X143.254 Y114.545 E.22445
G1 X142.721 Y114.545
G1 X137.556 Y109.38 E.22445
G1 X137.023 Y109.38
G1 X142.188 Y114.545 E.22445
G1 X141.655 Y114.545
G1 X136.489 Y109.38 E.22445
G1 X135.956 Y109.38
G1 X141.121 Y114.545 E.22445
G1 X140.588 Y114.545
G1 X135.423 Y109.38 E.22445
G1 X134.89 Y109.38
G1 X140.055 Y114.545 E.22445
G1 X139.521 Y114.545
G1 X134.356 Y109.38 E.22445
G1 X133.823 Y109.38
G1 X138.988 Y114.545 E.22445
G1 X138.455 Y114.545
G1 X133.29 Y109.38 E.22445
G1 X132.756 Y109.38
G1 X137.922 Y114.545 E.22445
G1 X137.388 Y114.545
G1 X132.223 Y109.38 E.22445
G1 X131.69 Y109.38
G1 X136.855 Y114.545 E.22445
G1 X136.322 Y114.545
G1 X131.157 Y109.38 E.22445
G1 X130.623 Y109.38
G1 X135.789 Y114.545 E.22445
G1 X135.255 Y114.545
G1 X130.09 Y109.38 E.22445
G1 X129.557 Y109.38
G1 X134.722 Y114.545 E.22445
G1 X134.189 Y114.545
G1 X129.024 Y109.38 E.22445
G1 X128.49 Y109.38
G1 X133.655 Y114.545 E.22445
G1 X133.122 Y114.545
G1 X127.957 Y109.38 E.22445
G1 X127.424 Y109.38
G1 X132.589 Y114.545 E.22445
G1 X132.056 Y114.545
G1 X126.89 Y109.38 E.22445
G1 X126.357 Y109.38
G1 X131.522 Y114.545 E.22445
G1 X130.989 Y114.545
G1 X125.824 Y109.38 E.22445
G1 X125.291 Y109.38
G1 X130.456 Y114.545 E.22445
G1 X129.923 Y114.545
G1 X124.757 Y109.38 E.22445
G1 X124.224 Y109.38
G1 X129.389 Y114.545 E.22445
G1 X128.856 Y114.545
G1 X123.691 Y109.38 E.22445
G1 X123.158 Y109.38
G1 X128.323 Y114.545 E.22445
G1 X127.79 Y114.545
G1 X122.624 Y109.38 E.22445
G1 X122.091 Y109.38
G1 X127.256 Y114.545 E.22445
G1 X126.723 Y114.545
G1 X121.558 Y109.38 E.22445
G1 X121.024 Y109.38
G1 X126.19 Y114.545 E.22445
G1 X125.656 Y114.545
G1 X120.491 Y109.38 E.22445
G1 X119.958 Y109.38
G1 X125.123 Y114.545 E.22445
G1 X124.59 Y114.545
G1 X119.425 Y109.38 E.22445
G1 X118.891 Y109.38
G1 X124.057 Y114.545 E.22445
G1 X123.523 Y114.545
G1 X118.358 Y109.38 E.22445
G1 X117.825 Y109.38
G1 X122.99 Y114.545 E.22445
G1 X122.457 Y114.545
G1 X117.292 Y109.38 E.22445
G1 X116.758 Y109.38
G1 X121.924 Y114.545 E.22445
G1 X121.39 Y114.545
G1 X116.225 Y109.38 E.22445
G1 X115.692 Y109.38
G1 X120.857 Y114.545 E.22445
G1 X120.324 Y114.545
G1 X115.159 Y109.38 E.22445
G1 X114.625 Y109.38
G1 X119.79 Y114.545 E.22445
G1 X119.257 Y114.545
G1 X114.092 Y109.38 E.22445
G1 X113.559 Y109.38
G1 X118.724 Y114.545 E.22445
G1 X118.191 Y114.545
G1 X115.193 Y111.548 E.13026
G1 X115.225 Y112.113
G1 X117.657 Y114.545 E.10569
G1 X117.124 Y114.545
G1 X115.139 Y112.56 E.08628
M73 P97 R0
G1 X114.974 Y112.928
G1 X116.591 Y114.545 E.07026
G1 X116.058 Y114.545
G1 X114.762 Y113.249 E.05631
G1 X114.478 Y113.499
G1 X115.524 Y114.545 E.04545
G1 X114.991 Y114.545
G1 X114.155 Y113.709 E.03634
G1 X113.768 Y113.855
G1 X114.458 Y114.545 E.02998
G1 X113.924 Y114.545
G1 X113.298 Y113.919 E.02723
G1 X112.676 Y113.83
G1 X113.391 Y114.545 E.03107
M204 S10000
; WIPE_START
G1 F24000
G1 X112.676 Y113.83 E-.3843
G1 X113.298 Y113.919 E-.23869
G1 X113.553 Y114.174 E-.13701
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.216 J.043 P1  F30000
G1 X113.698 Y110.053 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X113.025 Y109.38 E.02924
G1 X112.492 Y109.38
G1 X113.119 Y110.007 E.02723
G1 X112.674 Y110.096
G1 X111.959 Y109.38 E.03109
G1 X111.426 Y109.38
G1 X112.306 Y110.261 E.03827
G1 X111.994 Y110.482
G1 X110.892 Y109.38 E.04789
G1 X110.69 Y109.711
G1 X111.732 Y110.752 E.04524
G1 X111.519 Y111.073
G1 X110.69 Y110.245 E.03598
G1 X110.69 Y110.778
G1 X111.372 Y111.459 E.02961
G1 X111.314 Y111.935
G1 X110.69 Y111.311 E.02711
G1 X110.69 Y111.844
G1 X111.409 Y112.563 E.0312
G1 X110.69 Y112.378
G1 X112.858 Y114.545 E.09419
G1 X112.325 Y114.545
G1 X110.69 Y112.911 E.07102
G1 X110.69 Y113.444
G1 X111.791 Y114.545 E.04784
G1 X111.258 Y114.545
G1 X110.69 Y113.978 E.02467
M204 S10000
; WIPE_START
G1 F24000
G1 X111.258 Y114.545 E-.30508
G1 X111.791 Y114.545 E-.20264
G1 X111.322 Y114.076 E-.25227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.697 J.997 P1  F30000
G1 X115.245 Y111.333 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.120545
G1 F15000
G1 X115.183 Y111.558 E.00147
; WIPE_START
G1 F24000
G1 X115.245 Y111.333 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.023 J1.217 P1  F30000
G1 X145.248 Y111.896 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.11232
G1 F15000
G2 X145.317 Y112.054 I1.425 J-.532 E.00098
G1 X145.301 Y112.592 F30000
; LINE_WIDTH: 0.12036
G1 F15000
G1 X145.363 Y112.368 E.00147
; WIPE_START
G1 F24000
G1 X145.301 Y112.592 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.831 J.889 P1  F30000
G1 X146.703 Y113.902 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10672
G1 F15000
G3 X146.505 Y113.769 I.99 J-1.683 E.00124
; WIPE_START
G1 F24000
G1 X146.703 Y113.902 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.926 J.789 P1  F30000
G1 X147.232 Y114.523 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.103642
G1 F15000
G1 X147.094 Y114.544 E.00069
; WIPE_START
G1 F24000
G1 X147.232 Y114.523 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.025 J-1.217 P1  F30000
G1 X112.681 Y113.825 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.171979
G1 F15000
G1 X112.543 Y113.854 E.00149
; LINE_WIDTH: 0.197216
G1 X112.439 Y113.778 E.00161
; LINE_WIDTH: 0.160867
G1 X112.336 Y113.702 E.00123
; LINE_WIDTH: 0.124518
G1 X112.233 Y113.626 E.00085
G1 X111.614 Y113.006 F30000
; LINE_WIDTH: 0.102494
G1 F15000
G3 X111.374 Y112.695 I2.424 J-2.119 E.0019
G1 X110.712 Y112.133 F30000
; LINE_WIDTH: 0.112497
G1 F15000
G1 X110.691 Y112.295 E.00093
G1 X111.326 Y111.924 F30000
; LINE_WIDTH: 0.106107
G1 F15000
G1 X111.242 Y112.129 E.00114
; WIPE_START
G1 F24000
G1 X111.326 Y111.924 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.664 J1.02 P1  F30000
G1 X114.041 Y110.156 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.100533
G1 F15000
G2 X113.773 Y109.978 I-1.59 J2.096 E.00151
; WIPE_START
G1 F24000
G1 X114.041 Y110.156 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.028 J1.217 P1  F30000
G1 X147.604 Y109.381 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881701
G1 F15000
G1 X147.443 Y109.401 E.0006
; WIPE_START
G1 F24000
G1 X147.604 Y109.381 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.963 J.744 P1  F30000
G1 X148.313 Y110.299 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X148.153 Y110.181 E.00073
; LINE_WIDTH: 0.131628
G1 X147.993 Y110.064 E.00143
; WIPE_START
G1 F24000
G1 X148.153 Y110.181 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.878 J.842 P1  F30000
G1 X149.214 Y111.287 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.113155
G1 F15000
G2 X148.932 Y110.92 I-3.149 J2.122 E.00265
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X149.214 Y111.287 E-.76
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

