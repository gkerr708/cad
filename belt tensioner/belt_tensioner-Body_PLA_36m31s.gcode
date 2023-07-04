; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 30m 43s; total estimated time: 36m 31s
; total layer number: 195
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
M73 P0 R36
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
M73 P11 R32
G1 Y245
M73 P12 R32
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
M73 P12 R31
G1 X76 F15000
M73 P13 R31
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
M73 P14 R31
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X117 Y120 I26 J20
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
; layer num/total_layer_count: 1/195
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
G1 X142.143 Y137.143 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X117.857 Y137.143 E.90456
G1 X117.857 Y118.857 E.68108
G1 X142.143 Y118.857 E.90456
G1 X142.143 Y137.083 E.67884
G1 X142.6 Y137.6 F30000
; FEATURE: Outer wall
G1 F3000
G1 X117.4 Y137.6 E.9386
G1 X117.4 Y118.4 E.71513
G1 X142.6 Y118.4 E.9386
G1 X142.6 Y137.54 E.71289
; WIPE_START
G1 F24000
G1 X140.6 Y137.545 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P15 R31
G3 Z.6 I1.217 J.028 P1  F30000
G1 X141.023 Y119.04 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.506205
G1 F6300
M73 P15 R30
G1 X141.754 Y119.771 E.03905
G1 X141.754 Y120.427 E.02473
G1 X140.573 Y119.246 E.06305
G1 X139.918 Y119.246 E.02473
G1 X141.754 Y121.082 E.09803
G1 X141.754 Y121.737 E.02473
G1 X139.263 Y119.246 E.13301
G1 X138.608 Y119.246 E.02473
G1 X141.754 Y122.392 E.16799
G1 X141.754 Y123.047 E.02473
G1 X137.953 Y119.246 E.20297
G1 X137.298 Y119.246 E.02473
G1 X141.754 Y123.702 E.23795
G1 X141.754 Y124.358 E.02473
G1 X136.642 Y119.246 E.27293
G1 X135.987 Y119.246 E.02473
G1 X141.754 Y125.013 E.30791
G1 X141.754 Y125.668 E.02473
G1 X135.332 Y119.246 E.34289
G1 X134.677 Y119.246 E.02473
G1 X141.754 Y126.323 E.37787
G1 X141.754 Y126.978 E.02473
G1 X134.022 Y119.246 E.41285
G1 X133.366 Y119.246 E.02473
G1 X141.754 Y127.634 E.44783
G1 X141.754 Y128.289 E.02473
G1 X132.711 Y119.246 E.48281
G1 X132.056 Y119.246 E.02473
G1 X141.754 Y128.944 E.51779
G1 X141.754 Y129.599 E.02473
G1 X131.401 Y119.246 E.55277
G1 X130.746 Y119.246 E.02473
G1 X141.754 Y130.254 E.58775
G1 X141.754 Y130.909 E.02473
G1 X130.091 Y119.246 E.62273
G1 X129.435 Y119.246 E.02473
G1 X141.754 Y131.565 E.65771
G1 X141.754 Y132.22 E.02473
G1 X128.78 Y119.246 E.69269
G1 X128.125 Y119.246 E.02473
G1 X141.754 Y132.875 E.72766
M73 P16 R30
G1 X141.754 Y133.53 E.02473
G1 X127.47 Y119.246 E.76264
G1 X126.815 Y119.246 E.02473
G1 X141.754 Y134.185 E.79762
G1 X141.754 Y134.841 E.02473
G1 X126.159 Y119.246 E.8326
G1 X125.504 Y119.246 E.02473
G1 X141.754 Y135.496 E.86758
G1 X141.754 Y136.151 E.02473
G1 X124.849 Y119.246 E.90256
G1 X124.194 Y119.246 E.02473
G1 X141.703 Y136.754 E.93478
G1 X141.048 Y136.754 E.02473
G1 X123.539 Y119.246 E.93478
G1 X122.883 Y119.246 E.02473
G1 X140.392 Y136.754 E.93478
G1 X139.737 Y136.754 E.02473
G1 X122.228 Y119.246 E.93478
G1 X121.573 Y119.246 E.02473
G1 X139.082 Y136.754 E.93478
G1 X138.427 Y136.754 E.02473
G1 X120.918 Y119.246 E.93478
G1 X120.263 Y119.246 E.02473
G1 X137.772 Y136.754 E.93478
G1 X137.116 Y136.754 E.02473
G1 X119.608 Y119.246 E.93478
G1 X118.952 Y119.246 E.02473
G1 X136.461 Y136.754 E.93478
G1 X135.806 Y136.754 E.02473
G1 X118.297 Y119.246 E.93478
G1 X118.246 Y119.246 E.00195
G1 X118.246 Y119.849 E.02279
G1 X135.151 Y136.754 E.90256
G1 X134.496 Y136.754 E.02473
G1 X118.246 Y120.504 E.86758
G1 X118.246 Y121.16 E.02473
G1 X133.84 Y136.754 E.8326
G1 X133.185 Y136.754 E.02473
G1 X118.246 Y121.815 E.79762
G1 X118.246 Y122.47 E.02473
G1 X132.53 Y136.754 E.76264
G1 X131.875 Y136.754 E.02473
G1 X118.246 Y123.125 E.72766
G1 X118.246 Y123.78 E.02473
G1 X131.22 Y136.754 E.69268
G1 X130.565 Y136.754 E.02473
G1 X118.246 Y124.435 E.6577
G1 X118.246 Y125.091 E.02473
G1 X129.909 Y136.754 E.62272
G1 X129.254 Y136.754 E.02473
G1 X118.246 Y125.746 E.58774
G1 X118.246 Y126.401 E.02473
G1 X128.599 Y136.754 E.55276
G1 X127.944 Y136.754 E.02473
G1 X118.246 Y127.056 E.51778
G1 X118.246 Y127.711 E.02473
G1 X127.289 Y136.754 E.4828
G1 X126.633 Y136.754 E.02473
G1 X118.246 Y128.367 E.44782
G1 X118.246 Y129.022 E.02473
G1 X125.978 Y136.754 E.41284
G1 X125.323 Y136.754 E.02473
G1 X118.246 Y129.677 E.37786
G1 X118.246 Y130.332 E.02473
G1 X124.668 Y136.754 E.34288
G1 X124.013 Y136.754 E.02473
G1 X118.246 Y130.987 E.3079
G1 X118.246 Y131.642 E.02473
G1 X123.358 Y136.754 E.27292
G1 X122.702 Y136.754 E.02473
G1 X118.246 Y132.298 E.23794
G1 X118.246 Y132.953 E.02473
G1 X122.047 Y136.754 E.20296
G1 X121.392 Y136.754 E.02473
G1 X118.246 Y133.608 E.16798
G1 X118.246 Y134.263 E.02473
G1 X120.737 Y136.754 E.133
G1 X120.082 Y136.754 E.02473
G1 X118.246 Y134.918 E.09802
G1 X118.246 Y135.574 E.02473
G1 X119.426 Y136.754 E.06305
G1 X118.771 Y136.754 E.02473
G1 X118.04 Y136.023 E.03905
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.771 Y136.754 E-.39303
G1 X119.426 Y136.754 E-.24897
G1 X119.207 Y136.535 E-.118
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/195
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
G3 Z.6 I-.045 J1.216 P1  F30000
G1 X142.398 Y137.398 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10476
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10476
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.724 J.978 P1  F30000
G1 X141.465 Y137.234 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423102
G1 F10476
G1 X142.065 Y136.635 E.02625
G1 X142.065 Y136.098 E.01666
G1 X141.098 Y137.065 E.04237
G1 X140.56 Y137.065 E.01666
G1 X142.065 Y135.56 E.06593
G1 X142.065 Y135.022 E.01666
G1 X140.022 Y137.065 E.08948
G1 X139.485 Y137.065 E.01666
G1 X142.065 Y134.485 E.11304
G1 X142.065 Y133.947 E.01666
G1 X138.947 Y137.065 E.1366
G1 X138.409 Y137.065 E.01666
G1 X142.065 Y133.409 E.16015
M73 P17 R30
G1 X142.065 Y132.872 E.01666
G1 X137.872 Y137.065 E.18371
G1 X137.334 Y137.065 E.01666
G1 X142.065 Y132.334 E.20727
G1 X142.065 Y131.796 E.01666
G1 X136.796 Y137.065 E.23082
G1 X136.259 Y137.065 E.01666
G1 X142.065 Y131.259 E.25438
G1 X142.065 Y130.721 E.01666
G1 X135.721 Y137.065 E.27793
G1 X135.183 Y137.065 E.01666
G1 X142.065 Y130.183 E.30149
G1 X142.065 Y129.646 E.01666
G1 X134.646 Y137.065 E.32505
G1 X134.108 Y137.065 E.01666
G1 X142.065 Y129.108 E.3486
G1 X142.065 Y128.57 E.01666
G1 X133.57 Y137.065 E.37216
G1 X133.033 Y137.065 E.01666
G1 X142.065 Y128.033 E.39571
G1 X142.065 Y127.495 E.01666
G1 X132.495 Y137.065 E.41927
G1 X131.957 Y137.065 E.01666
G1 X142.065 Y126.957 E.44283
G1 X142.065 Y126.42 E.01666
G1 X131.42 Y137.065 E.46638
G1 X130.882 Y137.065 E.01666
G1 X142.065 Y125.882 E.48994
G1 X142.065 Y125.344 E.01666
G1 X130.344 Y137.065 E.51349
G1 X129.807 Y137.065 E.01666
G1 X142.065 Y124.807 E.53705
G1 X142.065 Y124.269 E.01666
G1 X129.269 Y137.065 E.56061
G1 X128.731 Y137.065 E.01666
G1 X142.065 Y123.731 E.58416
G1 X142.065 Y123.194 E.01666
G1 X128.194 Y137.065 E.60772
G1 X127.656 Y137.065 E.01666
G1 X142.065 Y122.656 E.63127
G1 X142.065 Y122.118 E.01666
G1 X127.118 Y137.065 E.65483
G1 X126.581 Y137.065 E.01666
G1 X142.065 Y121.581 E.67839
G1 X142.065 Y121.043 E.01666
G1 X126.043 Y137.065 E.70194
G1 X125.505 Y137.065 E.01666
G1 X142.065 Y120.505 E.7255
G1 X142.065 Y119.968 E.01666
G1 X124.968 Y137.065 E.74906
G1 X124.43 Y137.065 E.01666
G1 X142.065 Y119.43 E.77261
G1 X142.065 Y118.935 E.01533
G1 X142.022 Y118.935 E.00133
G1 X123.892 Y137.065 E.79429
G1 X123.355 Y137.065 E.01666
G1 X141.484 Y118.935 E.79429
G1 X140.946 Y118.935 E.01666
G1 X122.817 Y137.065 E.79429
G1 X122.279 Y137.065 E.01666
G1 X140.409 Y118.935 E.79429
G1 X139.871 Y118.935 E.01666
G1 X121.742 Y137.065 E.79429
G1 X121.204 Y137.065 E.01666
G1 X139.333 Y118.935 E.79429
G1 X138.796 Y118.935 E.01666
G1 X120.666 Y137.065 E.79429
G1 X120.129 Y137.065 E.01666
G1 X138.258 Y118.935 E.79429
G1 X137.72 Y118.935 E.01666
G1 X119.591 Y137.065 E.79429
G1 X119.054 Y137.065 E.01666
G1 X137.183 Y118.935 E.79429
G1 X136.645 Y118.935 E.01666
G1 X118.516 Y137.065 E.79429
G1 X117.978 Y137.065 E.01666
G1 X136.108 Y118.935 E.79429
G1 X135.57 Y118.935 E.01666
G1 X117.935 Y136.57 E.77261
G1 X117.935 Y136.032 E.01666
G1 X135.032 Y118.935 E.74905
G1 X134.495 Y118.935 E.01666
G1 X117.935 Y135.495 E.7255
G1 X117.935 Y134.957 E.01666
G1 X133.957 Y118.935 E.70194
G1 X133.419 Y118.935 E.01666
G1 X117.935 Y134.419 E.67839
G1 X117.935 Y133.882 E.01666
G1 X132.882 Y118.935 E.65483
G1 X132.344 Y118.935 E.01666
G1 X117.935 Y133.344 E.63127
G1 X117.935 Y132.806 E.01666
G1 X131.806 Y118.935 E.60772
G1 X131.269 Y118.935 E.01666
G1 X117.935 Y132.269 E.58416
G1 X117.935 Y131.731 E.01666
G1 X130.731 Y118.935 E.5606
G1 X130.193 Y118.935 E.01666
G1 X117.935 Y131.193 E.53705
G1 X117.935 Y130.656 E.01666
G1 X129.656 Y118.935 E.51349
G1 X129.118 Y118.935 E.01666
G1 X117.935 Y130.118 E.48994
G1 X117.935 Y129.58 E.01666
G1 X128.58 Y118.935 E.46638
G1 X128.043 Y118.935 E.01666
G1 X117.935 Y129.043 E.44282
G1 X117.935 Y128.505 E.01666
G1 X127.505 Y118.935 E.41927
G1 X126.967 Y118.935 E.01666
G1 X117.935 Y127.967 E.39571
G1 X117.935 Y127.43 E.01666
G1 X126.43 Y118.935 E.37216
G1 X125.892 Y118.935 E.01666
G1 X117.935 Y126.892 E.3486
G1 X117.935 Y126.354 E.01666
G1 X125.354 Y118.935 E.32504
G1 X124.817 Y118.935 E.01666
G1 X117.935 Y125.817 E.30149
G1 X117.935 Y125.279 E.01666
G1 X124.279 Y118.935 E.27793
G1 X123.741 Y118.935 E.01666
G1 X117.935 Y124.741 E.25438
G1 X117.935 Y124.204 E.01666
G1 X123.204 Y118.935 E.23082
G1 X122.666 Y118.935 E.01666
G1 X117.935 Y123.666 E.20726
G1 X117.935 Y123.128 E.01666
G1 X122.128 Y118.935 E.18371
G1 X121.591 Y118.935 E.01666
G1 X117.935 Y122.591 E.16015
G1 X117.935 Y122.053 E.01666
G1 X121.053 Y118.935 E.1366
G1 X120.515 Y118.935 E.01666
G1 X117.935 Y121.515 E.11304
G1 X117.935 Y120.978 E.01666
G1 X119.978 Y118.935 E.08948
G1 X119.44 Y118.935 E.01666
G1 X117.935 Y120.44 E.06593
G1 X117.935 Y119.902 E.01666
G1 X118.902 Y118.935 E.04237
G1 X118.365 Y118.935 E.01666
G1 X117.766 Y119.534 E.02625
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.365 Y118.935 E-.32197
G1 X118.902 Y118.935 E-.20431
G1 X118.468 Y119.37 E-.23372
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/195
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
G3 Z.8 I-.732 J.972 P1  F30000
G1 X142.398 Y137.398 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10541
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10541
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.213 J.096 P1  F30000
G1 X142.234 Y119.535 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423102
G1 F10541
G1 X141.635 Y118.935 E.02625
G1 X141.098 Y118.935 E.01666
G1 X142.065 Y119.902 E.04237
G1 X142.065 Y120.44 E.01666
G1 X140.56 Y118.935 E.06593
G1 X140.022 Y118.935 E.01666
G1 X142.065 Y120.978 E.08948
G1 X142.065 Y121.515 E.01666
G1 X139.485 Y118.935 E.11304
G1 X138.947 Y118.935 E.01666
G1 X142.065 Y122.053 E.1366
G1 X142.065 Y122.591 E.01666
G1 X138.409 Y118.935 E.16015
G1 X137.872 Y118.935 E.01666
G1 X142.065 Y123.128 E.18371
G1 X142.065 Y123.666 E.01666
G1 X137.334 Y118.935 E.20727
G1 X136.796 Y118.935 E.01666
G1 X142.065 Y124.204 E.23082
G1 X142.065 Y124.741 E.01666
G1 X136.259 Y118.935 E.25438
G1 X135.721 Y118.935 E.01666
G1 X142.065 Y125.279 E.27793
G1 X142.065 Y125.817 E.01666
G1 X135.183 Y118.935 E.30149
G1 X134.646 Y118.935 E.01666
G1 X142.065 Y126.354 E.32505
G1 X142.065 Y126.892 E.01666
G1 X134.108 Y118.935 E.3486
G1 X133.57 Y118.935 E.01666
G1 X142.065 Y127.43 E.37216
G1 X142.065 Y127.967 E.01666
G1 X133.033 Y118.935 E.39571
G1 X132.495 Y118.935 E.01666
G1 X142.065 Y128.505 E.41927
G1 X142.065 Y129.043 E.01666
G1 X131.957 Y118.935 E.44283
G1 X131.42 Y118.935 E.01666
G1 X142.065 Y129.58 E.46638
G1 X142.065 Y130.118 E.01666
G1 X130.882 Y118.935 E.48994
G1 X130.344 Y118.935 E.01666
G1 X142.065 Y130.656 E.51349
G1 X142.065 Y131.193 E.01666
G1 X129.807 Y118.935 E.53705
G1 X129.269 Y118.935 E.01666
G1 X142.065 Y131.731 E.56061
G1 X142.065 Y132.269 E.01666
G1 X128.731 Y118.935 E.58416
G1 X128.194 Y118.935 E.01666
G1 X142.065 Y132.806 E.60772
G1 X142.065 Y133.344 E.01666
G1 X127.656 Y118.935 E.63127
G1 X127.118 Y118.935 E.01666
G1 X142.065 Y133.882 E.65483
G1 X142.065 Y134.419 E.01666
G1 X126.581 Y118.935 E.67839
G1 X126.043 Y118.935 E.01666
G1 X142.065 Y134.957 E.70194
G1 X142.065 Y135.495 E.01666
G1 X125.505 Y118.935 E.7255
G1 X124.968 Y118.935 E.01666
G1 X142.065 Y136.032 E.74906
G1 X142.065 Y136.57 E.01666
G1 X124.43 Y118.935 E.77261
G1 X123.892 Y118.935 E.01666
G1 X142.022 Y137.065 E.79429
G1 X141.484 Y137.065 E.01666
G1 X123.355 Y118.935 E.79429
G1 X122.817 Y118.935 E.01666
G1 X140.946 Y137.065 E.79429
G1 X140.409 Y137.065 E.01666
G1 X122.279 Y118.935 E.79429
G1 X121.742 Y118.935 E.01666
G1 X139.871 Y137.065 E.79429
G1 X139.333 Y137.065 E.01666
G1 X121.204 Y118.935 E.79429
G1 X120.666 Y118.935 E.01666
G1 X138.796 Y137.065 E.79429
G1 X138.258 Y137.065 E.01666
G1 X120.129 Y118.935 E.79429
G1 X119.591 Y118.935 E.01666
G1 X137.72 Y137.065 E.79429
G1 X137.183 Y137.065 E.01666
G1 X119.054 Y118.935 E.79429
G1 X118.516 Y118.935 E.01666
G1 X136.645 Y137.065 E.79429
G1 X136.108 Y137.065 E.01666
G1 X117.978 Y118.935 E.79429
G1 X117.935 Y118.935 E.00133
G1 X117.935 Y119.43 E.01533
G1 X135.57 Y137.065 E.77261
G1 X135.032 Y137.065 E.01666
G1 X117.935 Y119.968 E.74905
G1 X117.935 Y120.505 E.01666
G1 X134.495 Y137.065 E.7255
G1 X133.957 Y137.065 E.01666
G1 X117.935 Y121.043 E.70194
G1 X117.935 Y121.581 E.01666
G1 X133.419 Y137.065 E.67839
G1 X132.882 Y137.065 E.01666
G1 X117.935 Y122.118 E.65483
G1 X117.935 Y122.656 E.01666
G1 X132.344 Y137.065 E.63127
G1 X131.806 Y137.065 E.01666
G1 X117.935 Y123.194 E.60772
G1 X117.935 Y123.731 E.01666
G1 X131.269 Y137.065 E.58416
G1 X130.731 Y137.065 E.01666
G1 X117.935 Y124.269 E.5606
G1 X117.935 Y124.807 E.01666
G1 X130.193 Y137.065 E.53705
G1 X129.656 Y137.065 E.01666
G1 X117.935 Y125.344 E.51349
G1 X117.935 Y125.882 E.01666
G1 X129.118 Y137.065 E.48994
G1 X128.58 Y137.065 E.01666
G1 X117.935 Y126.42 E.46638
G1 X117.935 Y126.957 E.01666
G1 X128.043 Y137.065 E.44282
G1 X127.505 Y137.065 E.01666
G1 X117.935 Y127.495 E.41927
G1 X117.935 Y128.033 E.01666
G1 X126.967 Y137.065 E.39571
G1 X126.43 Y137.065 E.01666
G1 X117.935 Y128.57 E.37216
G1 X117.935 Y129.108 E.01666
G1 X125.892 Y137.065 E.3486
G1 X125.354 Y137.065 E.01666
G1 X117.935 Y129.646 E.32504
G1 X117.935 Y130.183 E.01666
G1 X124.817 Y137.065 E.30149
G1 X124.279 Y137.065 E.01666
G1 X117.935 Y130.721 E.27793
G1 X117.935 Y131.259 E.01666
G1 X123.741 Y137.065 E.25438
G1 X123.204 Y137.065 E.01666
G1 X117.935 Y131.796 E.23082
G1 X117.935 Y132.334 E.01666
G1 X122.666 Y137.065 E.20726
G1 X122.128 Y137.065 E.01666
G1 X117.935 Y132.872 E.18371
G1 X117.935 Y133.409 E.01666
G1 X121.591 Y137.065 E.16015
G1 X121.053 Y137.065 E.01666
G1 X117.935 Y133.947 E.1366
G1 X117.935 Y134.485 E.01666
G1 X120.515 Y137.065 E.11304
G1 X119.978 Y137.065 E.01666
G1 X117.935 Y135.022 E.08948
G1 X117.935 Y135.56 E.01666
G1 X119.44 Y137.065 E.06593
G1 X118.902 Y137.065 E.01666
G1 X117.935 Y136.098 E.04237
G1 X117.935 Y136.635 E.01666
M73 P17 R29
G1 X118.534 Y137.234 E.02625
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X117.935 Y136.635 E-.32197
G1 X117.935 Y136.098 E-.20431
G1 X118.37 Y136.532 E-.23372
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/195
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
G3 Z1 I-.044 J1.216 P1  F30000
G1 X142.398 Y137.398 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2763
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2763
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.054 J-1.216 P1  F30000
G1 X125.326 Y137.05 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2763
G1 X123.698 Y137.05 E.05401
G1 X117.95 Y131.302 E.26962
G1 X117.95 Y132.374 E.03554
G1 X131.374 Y118.95 E.62972
G1 X128.626 Y118.95 E.09114
G1 X142.05 Y132.374 E.62972
G1 X142.05 Y131.302 E.03554
G1 X136.302 Y137.05 E.26962
G1 X139.05 Y137.05 E.09114
G1 X120.95 Y118.95 E.84908
G1 X123.698 Y118.95 E.09114
G1 X117.95 Y124.698 E.26962
G1 X117.95 Y123.626 E.03554
G1 X131.374 Y137.05 E.62972
G1 X128.626 Y137.05 E.09114
G1 X142.05 Y123.626 E.62972
G1 X142.05 Y124.698 E.03554
G1 X136.302 Y118.95 E.26962
G1 X139.05 Y118.95 E.09114
G1 X120.95 Y137.05 E.84908
G1 X119.322 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y137.05 E-.61876
G1 X121.213 Y136.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/195
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
G3 Z1.2 I-.035 J1.216 P1  F30000
M73 P18 R29
G1 X142.398 Y137.398 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2761
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2761
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.054 J-1.216 P1  F30000
G1 X125.326 Y137.05 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2761
G1 X123.698 Y137.05 E.05401
G1 X117.95 Y131.302 E.26962
G1 X117.95 Y132.374 E.03554
G1 X131.374 Y118.95 E.62972
G1 X128.626 Y118.95 E.09114
G1 X142.05 Y132.374 E.62972
G1 X142.05 Y131.302 E.03554
G1 X136.302 Y137.05 E.26962
G1 X139.05 Y137.05 E.09114
G1 X120.95 Y118.95 E.84908
G1 X123.698 Y118.95 E.09114
G1 X117.95 Y124.698 E.26962
G1 X117.95 Y123.626 E.03554
G1 X131.374 Y137.05 E.62972
G1 X128.626 Y137.05 E.09114
G1 X142.05 Y123.626 E.62972
G1 X142.05 Y124.698 E.03554
G1 X136.302 Y118.95 E.26962
G1 X139.05 Y118.95 E.09114
G1 X120.95 Y137.05 E.84908
G1 X119.322 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y137.05 E-.61876
G1 X121.213 Y136.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/195
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
G3 Z1.4 I-.035 J1.216 P1  F30000
G1 X142.398 Y137.398 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2761
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2761
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.054 J-1.216 P1  F30000
G1 X125.326 Y137.05 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2761
G1 X123.698 Y137.05 E.05401
G1 X117.95 Y131.302 E.26962
G1 X117.95 Y132.374 E.03554
G1 X131.374 Y118.95 E.62972
G1 X128.626 Y118.95 E.09114
G1 X142.05 Y132.374 E.62972
G1 X142.05 Y131.302 E.03554
G1 X136.302 Y137.05 E.26962
G1 X139.05 Y137.05 E.09114
G1 X120.95 Y118.95 E.84908
G1 X123.698 Y118.95 E.09114
G1 X117.95 Y124.698 E.26962
G1 X117.95 Y123.626 E.03554
G1 X131.374 Y137.05 E.62972
G1 X128.626 Y137.05 E.09114
G1 X142.05 Y123.626 E.62972
G1 X142.05 Y124.698 E.03554
G1 X136.302 Y118.95 E.26962
G1 X139.05 Y118.95 E.09114
G1 X120.95 Y137.05 E.84908
G1 X119.322 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y137.05 E-.61876
G1 X121.213 Y136.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/195
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
G3 Z1.6 I-.035 J1.216 P1  F30000
G1 X142.398 Y137.398 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2761
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2761
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.054 J-1.216 P1  F30000
G1 X125.326 Y137.05 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2761
G1 X123.698 Y137.05 E.05401
G1 X117.95 Y131.302 E.26962
G1 X117.95 Y132.374 E.03554
G1 X131.374 Y118.95 E.62972
G1 X128.626 Y118.95 E.09114
G1 X142.05 Y132.374 E.62972
G1 X142.05 Y131.302 E.03554
G1 X136.302 Y137.05 E.26962
G1 X139.05 Y137.05 E.09114
M73 P19 R29
G1 X120.95 Y118.95 E.84908
G1 X123.698 Y118.95 E.09114
G1 X117.95 Y124.698 E.26962
G1 X117.95 Y123.626 E.03554
G1 X131.374 Y137.05 E.62972
G1 X128.626 Y137.05 E.09114
G1 X142.05 Y123.626 E.62972
G1 X142.05 Y124.698 E.03554
G1 X136.302 Y118.95 E.26962
G1 X139.05 Y118.95 E.09114
G1 X120.95 Y137.05 E.84908
G1 X119.322 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y137.05 E-.61876
G1 X121.213 Y136.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/195
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
G3 Z1.8 I-.035 J1.216 P1  F30000
G1 X142.398 Y137.398 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2761
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2761
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.054 J-1.216 P1  F30000
G1 X125.326 Y137.05 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2761
G1 X123.698 Y137.05 E.05401
G1 X117.95 Y131.302 E.26962
G1 X117.95 Y132.374 E.03554
G1 X131.374 Y118.95 E.62972
G1 X128.626 Y118.95 E.09114
G1 X142.05 Y132.374 E.62972
G1 X142.05 Y131.302 E.03554
G1 X136.302 Y137.05 E.26962
G1 X139.05 Y137.05 E.09114
G1 X120.95 Y118.95 E.84908
G1 X123.698 Y118.95 E.09114
G1 X117.95 Y124.698 E.26962
G1 X117.95 Y123.626 E.03554
G1 X131.374 Y137.05 E.62972
G1 X128.626 Y137.05 E.09114
G1 X142.05 Y123.626 E.62972
G1 X142.05 Y124.698 E.03554
G1 X136.302 Y118.95 E.26962
G1 X139.05 Y118.95 E.09114
G1 X120.95 Y137.05 E.84908
G1 X119.322 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y137.05 E-.61876
G1 X121.213 Y136.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/195
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
G3 Z2 I-.035 J1.216 P1  F30000
G1 X142.398 Y137.398 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2761
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2761
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.054 J-1.216 P1  F30000
G1 X125.326 Y137.05 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2761
G1 X123.698 Y137.05 E.05401
G1 X117.95 Y131.302 E.26962
G1 X117.95 Y132.374 E.03554
G1 X131.374 Y118.95 E.62972
G1 X128.626 Y118.95 E.09114
G1 X142.05 Y132.374 E.62972
G1 X142.05 Y131.302 E.03554
G1 X136.302 Y137.05 E.26962
G1 X139.05 Y137.05 E.09114
G1 X120.95 Y118.95 E.84908
G1 X123.698 Y118.95 E.09114
G1 X117.95 Y124.698 E.26962
G1 X117.95 Y123.626 E.03554
G1 X131.374 Y137.05 E.62972
G1 X128.626 Y137.05 E.09114
G1 X142.05 Y123.626 E.62972
G1 X142.05 Y124.698 E.03554
G1 X136.302 Y118.95 E.26962
G1 X139.05 Y118.95 E.09114
G1 X120.95 Y137.05 E.84908
G1 X119.322 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y137.05 E-.61876
G1 X121.213 Y136.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/195
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
G3 Z2.2 I-.035 J1.216 P1  F30000
G1 X142.398 Y137.398 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2761
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2761
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
M73 P20 R29
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.054 J-1.216 P1  F30000
G1 X125.326 Y137.05 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2761
G1 X123.698 Y137.05 E.05401
G1 X117.95 Y131.302 E.26962
G1 X117.95 Y132.374 E.03554
G1 X131.374 Y118.95 E.62972
G1 X128.626 Y118.95 E.09114
G1 X142.05 Y132.374 E.62972
G1 X142.05 Y131.302 E.03554
G1 X136.302 Y137.05 E.26962
G1 X139.05 Y137.05 E.09114
G1 X120.95 Y118.95 E.84908
G1 X123.698 Y118.95 E.09114
G1 X117.95 Y124.698 E.26962
G1 X117.95 Y123.626 E.03554
G1 X131.374 Y137.05 E.62972
G1 X128.626 Y137.05 E.09114
G1 X142.05 Y123.626 E.62972
G1 X142.05 Y124.698 E.03554
G1 X136.302 Y118.95 E.26962
G1 X139.05 Y118.95 E.09114
G1 X120.95 Y137.05 E.84908
G1 X119.322 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y137.05 E-.61876
G1 X121.213 Y136.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/195
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
G3 Z2.4 I-.035 J1.216 P1  F30000
G1 X142.398 Y137.398 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2761
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2761
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.054 J-1.216 P1  F30000
G1 X125.326 Y137.05 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2761
G1 X123.698 Y137.05 E.05401
G1 X117.95 Y131.302 E.26962
G1 X117.95 Y132.374 E.03554
G1 X131.374 Y118.95 E.62972
G1 X128.626 Y118.95 E.09114
G1 X142.05 Y132.374 E.62972
G1 X142.05 Y131.302 E.03554
G1 X136.302 Y137.05 E.26962
G1 X139.05 Y137.05 E.09114
G1 X120.95 Y118.95 E.84908
G1 X123.698 Y118.95 E.09114
G1 X117.95 Y124.698 E.26962
G1 X117.95 Y123.626 E.03554
G1 X131.374 Y137.05 E.62972
G1 X128.626 Y137.05 E.09114
G1 X142.05 Y123.626 E.62972
G1 X142.05 Y124.698 E.03554
G1 X136.302 Y118.95 E.26962
G1 X139.05 Y118.95 E.09114
G1 X120.95 Y137.05 E.84908
M73 P20 R28
G1 X119.322 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y137.05 E-.61876
G1 X121.213 Y136.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/195
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
G3 Z2.6 I-.035 J1.216 P1  F30000
G1 X142.398 Y137.398 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2761
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2761
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.054 J-1.216 P1  F30000
G1 X125.326 Y137.05 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2761
G1 X123.698 Y137.05 E.05401
G1 X117.95 Y131.302 E.26962
G1 X117.95 Y132.374 E.03554
G1 X131.374 Y118.95 E.62972
G1 X128.626 Y118.95 E.09114
G1 X142.05 Y132.374 E.62972
G1 X142.05 Y131.302 E.03554
G1 X136.302 Y137.05 E.26962
G1 X139.05 Y137.05 E.09114
G1 X120.95 Y118.95 E.84908
G1 X123.698 Y118.95 E.09114
G1 X117.95 Y124.698 E.26962
G1 X117.95 Y123.626 E.03554
G1 X131.374 Y137.05 E.62972
G1 X128.626 Y137.05 E.09114
G1 X142.05 Y123.626 E.62972
G1 X142.05 Y124.698 E.03554
G1 X136.302 Y118.95 E.26962
M73 P21 R28
G1 X139.05 Y118.95 E.09114
G1 X120.95 Y137.05 E.84908
G1 X119.322 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y137.05 E-.61876
G1 X121.213 Y136.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/195
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
G3 Z2.8 I-.035 J1.216 P1  F30000
G1 X142.398 Y137.398 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2761
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2761
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.054 J-1.216 P1  F30000
G1 X125.326 Y137.05 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2761
G1 X123.698 Y137.05 E.05401
G1 X117.95 Y131.302 E.26962
G1 X117.95 Y132.374 E.03554
G1 X131.374 Y118.95 E.62972
G1 X128.626 Y118.95 E.09114
G1 X142.05 Y132.374 E.62972
G1 X142.05 Y131.302 E.03554
G1 X136.302 Y137.05 E.26962
G1 X139.05 Y137.05 E.09114
G1 X120.95 Y118.95 E.84908
G1 X123.698 Y118.95 E.09114
G1 X117.95 Y124.698 E.26962
G1 X117.95 Y123.626 E.03554
G1 X131.374 Y137.05 E.62972
G1 X128.626 Y137.05 E.09114
G1 X142.05 Y123.626 E.62972
G1 X142.05 Y124.698 E.03554
G1 X136.302 Y118.95 E.26962
G1 X139.05 Y118.95 E.09114
G1 X120.95 Y137.05 E.84908
G1 X119.322 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y137.05 E-.61876
G1 X121.213 Y136.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/195
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
G3 Z3 I-.035 J1.216 P1  F30000
G1 X142.398 Y137.398 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3532
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3532
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.101 J-.519 P1  F30000
G1 X140.28 Y136.651 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3532
G1 X138.651 Y136.651 E.05401
G1 X139.05 Y137.05 E.01869
G1 X142.05 Y137.05 E.09952
G1 X142.05 Y132.374 E.15511
G1 X141.651 Y131.975 E.01869
G1 X141.651 Y131.701 E.00911
G1 X142.05 Y131.302 E.01869
G1 X142.05 Y124.698 E.21908
G1 X141.651 Y124.299 E.01869
G1 X141.651 Y124.025 E.00911
G1 X142.05 Y123.626 E.01869
G1 X142.05 Y118.95 E.15511
G1 X139.05 Y118.95 E.09952
G1 X138.651 Y119.349 E.01869
G1 X140.28 Y119.349 E.05401
G1 X136.344 Y119.696 F30000
G1 F3532
G1 X136.344 Y118.95 E.02473
G1 X123.656 Y118.95 E.4209
G1 X123.656 Y119.756 E.02672
G1 X119.373 Y119.773 E.14208
G1 X118.756 Y120.414 E.02952
G1 X118.773 Y135.627 E.50464
G1 X119.414 Y136.244 E.02952
G1 X123.656 Y136.244 E.1407
G1 X123.656 Y137.05 E.02672
G1 X136.344 Y137.05 E.4209
G1 X136.344 Y136.244 E.02672
G1 X140.627 Y136.227 E.14208
G1 X141.244 Y135.586 E.02952
G1 X141.244 Y120.414 E.50326
G1 X140.586 Y119.756 E.03089
G1 X136.344 Y119.756 E.1407
G1 X119.72 Y119.349 F30000
G1 F3532
G1 X121.349 Y119.349 E.05401
G1 X120.95 Y118.95 E.01869
G1 X117.95 Y118.95 E.09952
G1 X117.95 Y123.626 E.15511
G1 X118.349 Y124.025 E.01869
G1 X118.349 Y124.299 E.00911
G1 X117.95 Y124.698 E.01869
G1 X117.95 Y131.302 E.21908
G1 X118.349 Y131.701 E.01869
G1 X118.349 Y131.975 E.00911
G1 X117.95 Y132.374 E.01869
G1 X117.95 Y137.05 E.15511
G1 X120.95 Y137.05 E.09952
G1 X121.349 Y136.651 E.01869
G1 X119.72 Y136.651 E.05401
G1 X127.405 Y136.643 F30000
G1 F3532
G1 X129.033 Y136.643 E.05401
G1 X140.837 Y124.839 E.55374
G1 X140.837 Y123.485 E.0449
G1 X137.515 Y120.163 E.15586
M73 P22 R28
G1 X137.837 Y120.163 E.01069
G1 X122.163 Y135.837 E.73531
G1 X122.485 Y135.837 E.01069
G1 X119.163 Y132.515 E.15586
G1 X119.163 Y131.161 E.0449
G1 X130.967 Y119.357 E.55374
G1 X129.033 Y119.357 E.06413
G1 X140.837 Y131.161 E.55374
G1 X140.837 Y132.515 E.0449
G1 X137.515 Y135.837 E.15586
G1 X137.837 Y135.837 E.01069
G1 X122.163 Y120.163 E.73531
G1 X122.485 Y120.163 E.01069
G1 X119.163 Y123.485 E.15586
G1 X119.163 Y124.839 E.0449
G1 X130.967 Y136.643 E.55374
G1 X132.595 Y136.643 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.967 Y136.643 E-.61876
G1 X130.704 Y136.38 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/195
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
G3 Z3.2 I-.106 J1.212 P1  F30000
G1 X142.398 Y137.398 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3523
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3523
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.101 J-.519 P1  F30000
G1 X140.28 Y136.651 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3523
G1 X138.651 Y136.651 E.05401
G1 X139.05 Y137.05 E.01869
G1 X142.05 Y137.05 E.09952
G1 X142.05 Y132.374 E.15511
G1 X141.651 Y131.975 E.01869
G1 X141.651 Y131.701 E.00911
G1 X142.05 Y131.302 E.01869
G1 X142.05 Y124.698 E.21908
G1 X141.651 Y124.299 E.01869
G1 X141.651 Y124.025 E.00911
G1 X142.05 Y123.626 E.01869
G1 X142.05 Y118.95 E.15511
G1 X139.05 Y118.95 E.09952
G1 X138.651 Y119.349 E.01869
G1 X140.28 Y119.349 E.05401
G1 X136.344 Y119.696 F30000
G1 F3523
G1 X136.344 Y118.95 E.02473
G1 X123.656 Y118.95 E.4209
G1 X123.656 Y119.756 E.02672
G1 X119.373 Y119.773 E.14208
G1 X118.756 Y120.414 E.02952
G1 X118.773 Y135.627 E.50464
G1 X119.414 Y136.244 E.02952
G1 X123.656 Y136.244 E.1407
G1 X123.656 Y137.05 E.02672
G1 X136.344 Y137.05 E.4209
G1 X136.344 Y136.244 E.02672
G1 X140.627 Y136.227 E.14208
G1 X141.244 Y135.586 E.02952
G1 X141.244 Y120.414 E.50326
G1 X140.586 Y119.756 E.03089
G1 X136.344 Y119.756 E.1407
G1 X119.72 Y119.349 F30000
G1 F3523
G1 X121.349 Y119.349 E.05401
G1 X120.95 Y118.95 E.01869
G1 X117.95 Y118.95 E.09952
G1 X117.95 Y123.626 E.15511
G1 X118.349 Y124.025 E.01869
G1 X118.349 Y124.299 E.00911
G1 X117.95 Y124.698 E.01869
G1 X117.95 Y131.302 E.21908
G1 X118.349 Y131.701 E.01869
G1 X118.349 Y131.975 E.00911
G1 X117.95 Y132.374 E.01869
G1 X117.95 Y137.05 E.15511
G1 X120.95 Y137.05 E.09952
G1 X121.349 Y136.651 E.01869
G1 X119.72 Y136.651 E.05401
G1 X127.405 Y136.643 F30000
G1 F3523
G1 X129.033 Y136.643 E.05401
G1 X140.837 Y124.839 E.55374
G1 X140.837 Y123.485 E.0449
G1 X137.515 Y120.163 E.15586
G1 X137.837 Y120.163 E.01069
G1 X122.163 Y135.837 E.73531
G1 X122.485 Y135.837 E.01069
G1 X119.163 Y132.515 E.15586
G1 X119.163 Y131.161 E.0449
G1 X130.967 Y119.357 E.55374
G1 X129.033 Y119.357 E.06413
G1 X140.837 Y131.161 E.55374
G1 X140.837 Y132.515 E.0449
G1 X137.515 Y135.837 E.15586
G1 X137.837 Y135.837 E.01069
G1 X122.163 Y120.163 E.73531
G1 X122.485 Y120.163 E.01069
G1 X119.163 Y123.485 E.15586
G1 X119.163 Y124.839 E.0449
G1 X130.967 Y136.643 E.55374
G1 X132.595 Y136.643 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.967 Y136.643 E-.61876
G1 X130.704 Y136.38 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/195
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
G3 Z3.4 I-.106 J1.212 P1  F30000
G1 X142.398 Y137.398 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3523
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3523
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.101 J-.519 P1  F30000
G1 X140.28 Y136.651 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3523
G1 X138.651 Y136.651 E.05401
G1 X139.05 Y137.05 E.01869
G1 X142.05 Y137.05 E.09952
G1 X142.05 Y132.374 E.15511
G1 X141.651 Y131.975 E.01869
G1 X141.651 Y131.701 E.00911
G1 X142.05 Y131.302 E.01869
G1 X142.05 Y124.698 E.21908
G1 X141.651 Y124.299 E.01869
G1 X141.651 Y124.025 E.00911
G1 X142.05 Y123.626 E.01869
G1 X142.05 Y118.95 E.15511
G1 X139.05 Y118.95 E.09952
G1 X138.651 Y119.349 E.01869
G1 X140.28 Y119.349 E.05401
G1 X136.344 Y119.696 F30000
G1 F3523
G1 X136.344 Y118.95 E.02473
G1 X123.656 Y118.95 E.4209
G1 X123.656 Y119.756 E.02672
G1 X119.373 Y119.773 E.14208
G1 X118.756 Y120.414 E.02952
G1 X118.773 Y135.627 E.50464
G1 X119.414 Y136.244 E.02952
G1 X123.656 Y136.244 E.1407
G1 X123.656 Y137.05 E.02672
G1 X136.344 Y137.05 E.4209
G1 X136.344 Y136.244 E.02672
G1 X140.627 Y136.227 E.14208
G1 X141.244 Y135.586 E.02952
G1 X141.244 Y120.414 E.50326
G1 X140.586 Y119.756 E.03089
G1 X136.344 Y119.756 E.1407
G1 X119.72 Y119.349 F30000
G1 F3523
G1 X121.349 Y119.349 E.05401
G1 X120.95 Y118.95 E.01869
G1 X117.95 Y118.95 E.09952
G1 X117.95 Y123.626 E.15511
G1 X118.349 Y124.025 E.01869
G1 X118.349 Y124.299 E.00911
G1 X117.95 Y124.698 E.01869
G1 X117.95 Y131.302 E.21908
G1 X118.349 Y131.701 E.01869
G1 X118.349 Y131.975 E.00911
G1 X117.95 Y132.374 E.01869
G1 X117.95 Y137.05 E.15511
G1 X120.95 Y137.05 E.09952
G1 X121.349 Y136.651 E.01869
G1 X119.72 Y136.651 E.05401
G1 X127.405 Y136.643 F30000
G1 F3523
G1 X129.033 Y136.643 E.05401
G1 X140.837 Y124.839 E.55374
G1 X140.837 Y123.485 E.0449
G1 X137.515 Y120.163 E.15586
G1 X137.837 Y120.163 E.01069
G1 X122.163 Y135.837 E.73531
G1 X122.485 Y135.837 E.01069
G1 X119.163 Y132.515 E.15586
G1 X119.163 Y131.161 E.0449
G1 X130.967 Y119.357 E.55374
G1 X129.033 Y119.357 E.06413
G1 X140.837 Y131.161 E.55374
G1 X140.837 Y132.515 E.0449
G1 X137.515 Y135.837 E.15586
G1 X137.837 Y135.837 E.01069
G1 X122.163 Y120.163 E.73531
G1 X122.485 Y120.163 E.01069
G1 X119.163 Y123.485 E.15586
G1 X119.163 Y124.839 E.0449
G1 X130.967 Y136.643 E.55374
G1 X132.595 Y136.643 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.967 Y136.643 E-.61876
G1 X130.704 Y136.38 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/195
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
G3 Z3.6 I-.106 J1.212 P1  F30000
G1 X142.398 Y137.398 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3523
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3523
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.101 J-.519 P1  F30000
G1 X140.28 Y136.651 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3523
G1 X138.651 Y136.651 E.05401
G1 X139.05 Y137.05 E.01869
G1 X142.05 Y137.05 E.09952
G1 X142.05 Y132.374 E.15511
G1 X141.651 Y131.975 E.01869
G1 X141.651 Y131.701 E.00911
G1 X142.05 Y131.302 E.01869
G1 X142.05 Y124.698 E.21908
G1 X141.651 Y124.299 E.01869
G1 X141.651 Y124.025 E.00911
G1 X142.05 Y123.626 E.01869
G1 X142.05 Y118.95 E.15511
G1 X139.05 Y118.95 E.09952
G1 X138.651 Y119.349 E.01869
G1 X140.28 Y119.349 E.05401
G1 X136.344 Y119.696 F30000
G1 F3523
G1 X136.344 Y118.95 E.02473
G1 X123.656 Y118.95 E.4209
G1 X123.656 Y119.756 E.02672
M73 P23 R28
G1 X119.373 Y119.773 E.14208
G1 X118.756 Y120.414 E.02952
G1 X118.773 Y135.627 E.50464
G1 X119.414 Y136.244 E.02952
G1 X123.656 Y136.244 E.1407
G1 X123.656 Y137.05 E.02672
G1 X136.344 Y137.05 E.4209
G1 X136.344 Y136.244 E.02672
G1 X140.627 Y136.227 E.14208
G1 X141.244 Y135.586 E.02952
G1 X141.244 Y120.414 E.50326
G1 X140.586 Y119.756 E.03089
G1 X136.344 Y119.756 E.1407
G1 X119.72 Y119.349 F30000
G1 F3523
G1 X121.349 Y119.349 E.05401
G1 X120.95 Y118.95 E.01869
G1 X117.95 Y118.95 E.09952
G1 X117.95 Y123.626 E.15511
G1 X118.349 Y124.025 E.01869
G1 X118.349 Y124.299 E.00911
G1 X117.95 Y124.698 E.01869
G1 X117.95 Y131.302 E.21908
G1 X118.349 Y131.701 E.01869
G1 X118.349 Y131.975 E.00911
G1 X117.95 Y132.374 E.01869
G1 X117.95 Y137.05 E.15511
G1 X120.95 Y137.05 E.09952
G1 X121.349 Y136.651 E.01869
G1 X119.72 Y136.651 E.05401
G1 X127.405 Y136.643 F30000
G1 F3523
G1 X129.033 Y136.643 E.05401
G1 X140.837 Y124.839 E.55374
G1 X140.837 Y123.485 E.0449
G1 X137.515 Y120.163 E.15586
G1 X137.837 Y120.163 E.01069
G1 X122.163 Y135.837 E.73531
G1 X122.485 Y135.837 E.01069
G1 X119.163 Y132.515 E.15586
G1 X119.163 Y131.161 E.0449
G1 X130.967 Y119.357 E.55374
G1 X129.033 Y119.357 E.06413
G1 X140.837 Y131.161 E.55374
G1 X140.837 Y132.515 E.0449
G1 X137.515 Y135.837 E.15586
G1 X137.837 Y135.837 E.01069
G1 X122.163 Y120.163 E.73531
G1 X122.485 Y120.163 E.01069
G1 X119.163 Y123.485 E.15586
G1 X119.163 Y124.839 E.0449
G1 X130.967 Y136.643 E.55374
G1 X132.595 Y136.643 E.05401
M106 S234.6
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.967 Y136.643 E-.61876
G1 X130.704 Y136.38 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/195
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
G3 Z3.8 I-.106 J1.212 P1  F30000
G1 X142.398 Y137.398 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.192 J.246 P1  F30000
G1 X141.104 Y136.216 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X141.173 Y136.146 E.00273
G1 X141.219 Y135.892 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40791
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X141.219 Y120.409 E.82437
G1 X140.761 Y119.937 E.03501
G1 X140.761 Y136.063 E.85863
G1 X140.581 Y136.223 E.01279
G1 X140.303 Y136.223 E.01483
G1 X140.303 Y119.777 E.87564
G1 X139.845 Y119.777 E.02438
G1 X139.845 Y136.223 E.87564
G1 X139.387 Y136.223 E.02438
G1 X139.387 Y119.777 E.87564
G1 X138.929 Y119.777 E.02438
G1 X138.929 Y136.223 E.87564
G1 X138.471 Y136.223 E.02438
M73 P23 R27
G1 X138.471 Y119.777 E.87564
G1 X138.013 Y119.777 E.02438
G1 X138.013 Y136.223 E.87564
G1 X137.555 Y136.223 E.02438
G1 X137.555 Y119.777 E.87564
G1 X137.098 Y119.777 E.02438
G1 X137.098 Y136.223 E.87564
G1 X136.64 Y136.223 E.02438
G1 X136.64 Y119.777 E.87564
G1 X136.323 Y119.777 E.01687
G1 X136.323 Y118.972 E.04288
G1 X136.182 Y118.972 E.00751
G1 X136.182 Y137.028 E.96141
G1 X135.724 Y137.028 E.02438
G1 X135.724 Y118.972 E.96141
G1 X135.266 Y118.972 E.02438
G1 X135.266 Y137.028 E.96141
G1 X134.808 Y137.028 E.02438
G1 X134.808 Y118.972 E.96141
G1 X134.35 Y118.972 E.02438
G1 X134.35 Y137.028 E.96141
G1 X133.892 Y137.028 E.02438
G1 X133.892 Y118.972 E.96141
G1 X133.434 Y118.972 E.02438
G1 X133.434 Y137.028 E.96141
G1 X132.976 Y137.028 E.02438
G1 X132.976 Y118.972 E.96141
G1 X132.518 Y118.972 E.02438
G1 X132.518 Y137.028 E.96141
G1 X132.061 Y137.028 E.02438
G1 X132.061 Y118.972 E.96141
G1 X131.603 Y118.972 E.02438
G1 X131.603 Y137.028 E.96141
G1 X131.145 Y137.028 E.02438
G1 X131.145 Y118.972 E.96141
G1 X130.687 Y118.972 E.02438
G1 X130.687 Y137.028 E.96141
G1 X130.229 Y137.028 E.02438
G1 X130.229 Y118.972 E.96141
G1 X129.771 Y118.972 E.02438
G1 X129.771 Y137.028 E.96141
G1 X129.313 Y137.028 E.02438
G1 X129.313 Y118.972 E.96141
G1 X128.855 Y118.972 E.02438
G1 X128.855 Y137.028 E.96141
G1 X128.397 Y137.028 E.02438
G1 X128.397 Y118.972 E.96141
G1 X127.939 Y118.972 E.02438
G1 X127.939 Y137.028 E.96141
G1 X127.481 Y137.028 E.02438
G1 X127.481 Y118.972 E.96141
G1 X127.024 Y118.972 E.02438
G1 X127.024 Y137.028 E.96141
G1 X126.566 Y137.028 E.02438
G1 X126.566 Y118.972 E.96141
G1 X126.108 Y118.972 E.02438
G1 X126.108 Y137.028 E.96141
G1 X125.65 Y137.028 E.02438
G1 X125.65 Y118.972 E.96141
G1 X125.192 Y118.972 E.02438
G1 X125.192 Y137.028 E.96141
G1 X124.734 Y137.028 E.02438
G1 X124.734 Y118.972 E.96141
G1 X124.276 Y118.972 E.02438
G1 X124.276 Y137.028 E.96141
G1 X123.818 Y137.028 E.02438
G1 X123.818 Y118.972 E.96141
G1 X123.677 Y118.972 E.00751
G1 X123.677 Y119.777 E.04288
G1 X123.36 Y119.777 E.01688
G1 X123.36 Y136.223 E.87564
G1 X122.902 Y136.223 E.02438
G1 X122.902 Y119.777 E.87564
G1 X122.444 Y119.777 E.02438
G1 X122.444 Y136.223 E.87564
G1 X121.987 Y136.223 E.02438
G1 X121.987 Y119.777 E.87564
G1 X121.529 Y119.777 E.02438
G1 X121.529 Y136.223 E.87564
G1 X121.071 Y136.223 E.02438
G1 X121.071 Y119.777 E.87564
G1 X120.613 Y119.777 E.02438
G1 X120.613 Y136.223 E.87564
G1 X120.155 Y136.223 E.02438
G1 X120.155 Y119.777 E.87564
G1 X119.697 Y119.777 E.02438
G1 X119.697 Y136.223 E.87564
G1 X119.419 Y136.223 E.01482
G1 X119.239 Y136.063 E.0128
G1 X119.239 Y119.937 E.85863
G1 X118.781 Y120.409 E.03502
G1 X118.781 Y135.891 E.82436
M106 S234.6
G1 X118.784 Y136.104 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X118.854 Y136.173 E.00273
G1 X119.72 Y136.651 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X121.349 Y136.651 E.05401
G1 X120.95 Y137.05 E.01869
G1 X117.95 Y137.05 E.09952
G1 X117.95 Y132.374 E.15511
G1 X118.349 Y131.975 E.01869
G1 X118.349 Y131.701 E.00911
M73 P24 R27
G1 X117.95 Y131.302 E.01869
G1 X117.95 Y124.698 E.21909
G1 X118.349 Y124.299 E.01869
G1 X118.349 Y124.025 E.00911
G1 X117.95 Y123.626 E.01869
G1 X117.95 Y118.95 E.15511
G1 X120.95 Y118.95 E.09952
G1 X121.349 Y119.349 E.01869
G1 X119.72 Y119.349 E.05401
G1 X118.784 Y119.896 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X118.854 Y119.827 E.00273
G1 X140.28 Y119.349 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X138.651 Y119.349 E.05401
G1 X139.05 Y118.95 E.01869
G1 X142.05 Y118.95 E.09952
G1 X142.05 Y123.626 E.15511
G1 X141.651 Y124.025 E.01869
G1 X141.651 Y124.299 E.00911
G1 X142.05 Y124.698 E.01869
G1 X142.05 Y131.302 E.21909
G1 X141.651 Y131.701 E.01869
G1 X141.651 Y131.975 E.00911
G1 X142.05 Y132.374 E.01869
G1 X142.05 Y137.05 E.15511
G1 X139.05 Y137.05 E.09952
G1 X138.651 Y136.651 E.01869
G1 X140.28 Y136.651 E.05401
G1 X141.104 Y119.784 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X141.173 Y119.854 E.00273
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.104 Y119.784 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/195
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
G3 Z4 I-1.214 J.089 P1  F30000
G1 X142.398 Y137.398 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10032
G1 X117.602 Y137.398 E.82252
G1 X117.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.82252
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10032
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.101 J-.519 P1  F30000
G1 X140.28 Y136.651 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10032
G1 X138.651 Y136.651 E.05401
G1 X139.05 Y137.05 E.01869
G1 X142.05 Y137.05 E.09952
G1 X142.05 Y132.374 E.15511
G1 X141.651 Y131.975 E.01869
G1 X141.651 Y131.701 E.00911
G1 X142.05 Y131.302 E.01869
G1 X142.05 Y124.698 E.21909
G1 X141.651 Y124.299 E.01869
G1 X141.651 Y124.025 E.00911
G1 X142.05 Y123.626 E.01869
G1 X142.05 Y118.95 E.15511
G1 X139.05 Y118.95 E.09952
G1 X138.651 Y119.349 E.01869
G1 X140.28 Y119.349 E.05401
G1 X141.322 Y120.093 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420632
G1 F10032
G1 X141.077 Y119.847 E.01068
G1 X140.723 Y119.847 E.01091
G2 X140.436 Y119.741 I-.211 J.13 E.01013
G1 X141.259 Y120.564 E.03581
G1 X141.259 Y121.098 E.01644
G1 X139.902 Y119.741 E.05906
G1 X139.368 Y119.741 E.01644
G1 X141.259 Y121.632 E.08231
G1 X141.259 Y122.166 E.01644
G1 X138.834 Y119.741 E.10556
G1 X138.3 Y119.741 E.01644
G1 X141.259 Y122.7 E.12882
G1 X141.259 Y123.234 E.01644
G1 X137.766 Y119.741 E.15207
G1 X137.232 Y119.741 E.01644
G1 X141.259 Y123.768 E.17532
G1 X141.259 Y124.303 E.01644
G1 X135.892 Y118.935 E.23363
G1 X135.358 Y118.935 E.01644
G1 X141.259 Y124.837 E.25688
G1 X141.259 Y125.371 E.01644
G1 X134.824 Y118.935 E.28013
G1 X134.289 Y118.935 E.01644
G1 X141.259 Y125.905 E.30338
G1 X141.259 Y126.439 E.01644
G1 X133.755 Y118.935 E.32663
G1 X133.221 Y118.935 E.01644
G1 X141.259 Y126.973 E.34988
G1 X141.259 Y127.508 E.01644
G1 X132.687 Y118.935 E.37313
G1 X132.153 Y118.935 E.01644
G1 X141.259 Y128.042 E.39638
G1 X141.259 Y128.576 E.01644
G1 X131.619 Y118.935 E.41964
G1 X131.084 Y118.935 E.01644
G1 X141.259 Y129.11 E.44289
G1 X141.259 Y129.644 E.01644
G1 X130.55 Y118.935 E.46614
G1 X130.016 Y118.935 E.01644
G1 X141.259 Y130.178 E.48939
G1 X141.259 Y130.713 E.01644
G1 X129.482 Y118.935 E.51264
G1 X128.948 Y118.935 E.01644
G1 X141.259 Y131.247 E.53589
G1 X141.259 Y131.781 E.01644
G1 X128.414 Y118.935 E.55914
G1 X127.879 Y118.935 E.01644
G1 X141.259 Y132.315 E.58239
G1 X141.259 Y132.849 E.01644
G1 X127.345 Y118.935 E.60564
G1 X126.811 Y118.935 E.01644
G1 X141.259 Y133.383 E.62889
G1 X141.259 Y133.918 E.01644
G1 X126.277 Y118.935 E.65215
G1 X125.743 Y118.935 E.01644
G1 X141.259 Y134.452 E.6754
G1 X141.259 Y134.986 E.01644
G1 X125.209 Y118.935 E.69865
G1 X124.674 Y118.935 E.01644
G1 X141.259 Y135.52 E.7219
G3 X141.153 Y135.723 I-.197 J.026 E.00751
G1 X141.153 Y135.948 E.00693
G1 X124.14 Y118.935 E.74051
G1 X123.641 Y118.935 E.01537
G1 X123.641 Y118.97 E.00107
G1 X140.824 Y136.153 E.74793
G1 X140.723 Y136.153 E.0031
G3 X140.589 Y136.259 I-.196 J-.109 E.00541
G1 X140.396 Y136.259 E.00593
G1 X123.641 Y119.504 E.72931
G1 X123.641 Y119.741 E.00728
G1 X123.343 Y119.741 E.00916
G1 X139.862 Y136.259 E.71901
G1 X139.328 Y136.259 E.01644
G1 X122.809 Y119.741 E.71901
G1 X122.275 Y119.741 E.01644
G1 X138.793 Y136.259 E.71901
G1 X138.259 Y136.259 E.01644
G1 X121.741 Y119.741 E.71901
G1 X121.207 Y119.741 E.01644
G1 X137.725 Y136.259 E.71901
G1 X137.191 Y136.259 E.01644
G1 X120.672 Y119.741 E.71901
G1 X120.138 Y119.741 E.01644
G1 X136.657 Y136.259 E.71901
G1 X136.359 Y136.259 E.00915
G1 X136.359 Y136.496 E.00729
G1 X119.604 Y119.741 E.72932
G1 X119.411 Y119.741 E.00593
G2 X119.277 Y119.847 I.061 J.215 E.00541
G1 X119.176 Y119.847 E.00311
G1 X136.359 Y137.03 E.74793
G1 X136.359 Y137.065 E.00106
G1 X135.86 Y137.065 E.01538
G1 X118.847 Y120.052 E.74051
G1 X118.847 Y120.277 E.00692
G2 X118.741 Y120.48 I.091 J.177 E.00751
G1 X135.325 Y137.065 E.72189
G1 X134.791 Y137.065 E.01644
G1 X118.741 Y121.014 E.69864
G1 X118.741 Y121.548 E.01644
G1 X134.257 Y137.065 E.67539
G1 X133.723 Y137.065 E.01644
G1 X118.741 Y122.082 E.65214
G1 X118.741 Y122.617 E.01644
G1 X133.189 Y137.065 E.62889
G1 X132.655 Y137.065 E.01644
G1 X118.741 Y123.151 E.60564
G1 X118.741 Y123.685 E.01644
G1 X132.12 Y137.065 E.58239
G1 X131.586 Y137.065 E.01644
G1 X118.741 Y124.219 E.55914
G1 X118.741 Y124.753 E.01644
G1 X131.052 Y137.065 E.53588
G1 X130.518 Y137.065 E.01644
G1 X118.741 Y125.287 E.51263
G1 X118.741 Y125.822 E.01644
G1 X129.984 Y137.065 E.48938
G1 X129.45 Y137.065 E.01644
G1 X118.741 Y126.356 E.46613
G1 X118.741 Y126.89 E.01644
G1 X128.915 Y137.065 E.44288
G1 X128.381 Y137.065 E.01644
G1 X118.741 Y127.424 E.41963
G1 X118.741 Y127.958 E.01644
G1 X127.847 Y137.065 E.39638
G1 X127.313 Y137.065 E.01644
G1 X118.741 Y128.492 E.37313
G1 X118.741 Y129.027 E.01644
G1 X126.779 Y137.065 E.34988
G1 X126.245 Y137.065 E.01644
G1 X118.741 Y129.561 E.32663
G1 X118.741 Y130.095 E.01644
G1 X125.71 Y137.065 E.30337
G1 X125.176 Y137.065 E.01644
G1 X118.741 Y130.629 E.28012
G1 X118.741 Y131.163 E.01644
G1 X124.642 Y137.065 E.25687
G1 X124.108 Y137.065 E.01644
G1 X118.741 Y131.697 E.23362
G1 X118.741 Y132.232 E.01644
G1 X122.768 Y136.259 E.17531
G1 X122.234 Y136.259 E.01644
G1 X118.741 Y132.766 E.15206
G1 X118.741 Y133.3 E.01644
G1 X121.7 Y136.259 E.12881
G1 X121.166 Y136.259 E.01644
G1 X118.741 Y133.834 E.10556
G1 X118.741 Y134.368 E.01644
G1 X120.632 Y136.259 E.08231
G1 X120.098 Y136.259 E.01644
G1 X118.741 Y134.902 E.05906
G1 X118.741 Y135.437 E.01644
G1 X119.563 Y136.259 E.03581
G3 X119.277 Y136.153 I-.075 J-.236 E.01012
G1 X118.923 Y136.153 E.01091
G1 X118.678 Y135.908 E.01067
G1 X119.72 Y136.651 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10032
G1 X121.349 Y136.651 E.05401
G1 X120.95 Y137.05 E.01869
G1 X117.95 Y137.05 E.09952
G1 X117.95 Y132.374 E.15511
G1 X118.349 Y131.975 E.01869
G1 X118.349 Y131.701 E.00911
G1 X117.95 Y131.302 E.01869
G1 X117.95 Y124.698 E.21909
G1 X118.349 Y124.299 E.01869
G1 X118.349 Y124.025 E.00911
G1 X117.95 Y123.626 E.01869
G1 X117.95 Y118.95 E.15511
G1 X120.95 Y118.95 E.09952
G1 X121.349 Y119.349 E.01869
G1 X119.72 Y119.349 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.349 Y119.349 E-.61876
G1 X121.086 Y119.086 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/195
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
G3 Z4.2 I-1.204 J.18 P1  F30000
G1 X123.822 Y137.398 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11179
G1 X117.602 Y137.398 E.20633
G1 X117.602 Y118.602 E.62349
G1 X123.822 Y118.602 E.20633
G1 X123.822 Y119.922 E.04379
G1 X118.922 Y119.922 E.16254
G1 X118.922 Y136.078 E.53591
G1 X123.822 Y136.078 E.16254
G1 X123.822 Y137.338 E.0418
; WIPE_START
G1 F24000
G1 X121.822 Y137.357 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.002 J1.217 P1  F30000
G1 X142.398 Y137.398 Z4.4
G1 Z4
G1 E.8 F1800
G1 F11179
G1 X136.178 Y137.398 E.20633
G1 X136.178 Y136.078 E.04379
G1 X141.078 Y136.078 E.16254
G1 X141.078 Y119.922 E.53591
G1 X136.178 Y119.922 E.16254
G1 X136.178 Y118.602 E.04379
G1 X142.398 Y118.602 E.20633
G1 X142.398 Y137.338 E.6215
G1 X142.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11179
G1 X117.21 Y137.79 E.786
G1 X117.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.786
G1 X142.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X140.79 Y137.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.124 J-.467 P1  F30000
G1 X140.009 Y135.855 Z4.4
G1 Z4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F11179
G1 X140.855 Y135.009 E.03678
G1 X140.855 Y134.476
G1 X139.476 Y135.855 E.05995
G1 X138.943 Y135.855
G1 X140.855 Y133.943 E.08312
G1 X140.855 Y133.409
G1 X138.409 Y135.855 E.10629
G1 X137.876 Y135.855
G1 X140.855 Y132.876 E.12947
G1 X140.855 Y132.343
G1 X137.343 Y135.855 E.15264
G1 X136.809 Y135.855
G1 X140.855 Y131.809 E.17581
G1 X140.855 Y131.276
G1 X136.276 Y135.855 E.19899
M204 S10000
G1 X135.955 Y137.243 F30000
M204 S2000
G1 F11179
G1 X135.616 Y137.583 E.01477
G1 X135.082 Y137.583
G1 X135.955 Y136.709 E.03794
G1 X135.955 Y136.176
G1 X134.549 Y137.583 E.06111
G1 X134.016 Y137.583
G1 X140.855 Y130.743 E.29722
G1 X140.855 Y130.21
G1 X133.482 Y137.583 E.32039
G1 X132.949 Y137.583
G1 X140.855 Y129.676 E.34356
G1 X140.855 Y129.143
G1 X132.416 Y137.583 E.36674
G1 X131.883 Y137.583
G1 X140.855 Y128.61 E.38991
G1 X140.855 Y128.077
G1 X131.349 Y137.583 E.41308
G1 X130.816 Y137.583
G1 X140.855 Y127.543 E.43626
G1 X140.855 Y127.01
G1 X130.283 Y137.583 E.45943
G1 X129.75 Y137.583
G1 X140.855 Y126.477 E.4826
G1 X140.855 Y125.944
G1 X129.216 Y137.583 E.50578
G1 X128.683 Y137.583
G1 X140.855 Y125.41 E.52895
G1 X140.855 Y124.877
G1 X128.15 Y137.583 E.55212
G1 X127.616 Y137.583
G1 X140.855 Y124.344 E.57529
G1 X140.855 Y123.81
G1 X127.083 Y137.583 E.59847
G1 X126.55 Y137.583
G1 X140.855 Y123.277 E.62164
G1 X140.855 Y122.744
G1 X126.017 Y137.583 E.64481
G1 X125.483 Y137.583
G1 X140.855 Y122.211 E.66799
G1 X140.855 Y121.677
G1 X124.95 Y137.583 E.69116
G1 X124.417 Y137.583
G1 X140.855 Y121.144 E.71433
G1 X140.855 Y120.611
G1 X124.045 Y137.422 E.73051
G1 X124.045 Y136.888
G1 X140.66 Y120.273 E.72203
G1 X140.255 Y120.145
G1 X124.045 Y136.355 E.70442
G1 X124.011 Y135.855
G1 X139.722 Y120.145 E.68271
G1 X139.188 Y120.145
G1 X123.478 Y135.855 E.68271
G1 X122.944 Y135.855
G1 X138.655 Y120.145 E.68271
G1 X138.122 Y120.145
G1 X122.411 Y135.855 E.68271
G1 X121.878 Y135.855
G1 X137.589 Y120.145 E.68271
G1 X137.055 Y120.145
G1 X121.345 Y135.855 E.68271
M73 P25 R27
G1 X120.811 Y135.855
G1 X136.522 Y120.145 E.68271
G1 X135.989 Y120.145
G1 X120.278 Y135.855 E.68271
G1 X119.745 Y135.855
G1 X135.955 Y119.645 E.70443
G1 X135.955 Y119.112
G1 X119.34 Y135.727 E.72203
G1 X119.145 Y135.389
G1 X135.955 Y118.578 E.73051
G1 X135.583 Y118.417
G1 X119.145 Y134.856 E.71433
G1 X119.145 Y134.323
G1 X135.05 Y118.417 E.69115
G1 X134.516 Y118.417
G1 X119.145 Y133.789 E.66798
G1 X119.145 Y133.256
G1 X133.983 Y118.417 E.64481
G1 X133.45 Y118.417
G1 X119.145 Y132.723 E.62164
G1 X119.145 Y132.189
G1 X132.917 Y118.417 E.59846
G1 X132.383 Y118.417
G1 X119.145 Y131.656 E.57529
G1 X119.145 Y131.123
G1 X131.85 Y118.417 E.55212
G1 X131.317 Y118.417
G1 X119.145 Y130.59 E.52894
G1 X119.145 Y130.056
G1 X130.784 Y118.417 E.50577
G1 X130.25 Y118.417
G1 X119.145 Y129.523 E.4826
G1 X119.145 Y128.99
G1 X129.717 Y118.417 E.45942
G1 X129.184 Y118.417
G1 X119.145 Y128.457 E.43625
G1 X119.145 Y127.923
G1 X128.651 Y118.417 E.41308
G1 X128.117 Y118.417
G1 X119.145 Y127.39 E.3899
G1 X119.145 Y126.857
G1 X127.584 Y118.417 E.36673
G1 X127.051 Y118.417
G1 X119.145 Y126.323 E.34356
G1 X119.145 Y125.79
G1 X126.517 Y118.417 E.32038
G1 X125.984 Y118.417
G1 X119.145 Y125.257 E.29721
G1 X119.145 Y124.724
G1 X123.724 Y120.145 E.19898
G1 X123.19 Y120.145
G1 X119.145 Y124.19 E.17581
G1 X119.145 Y123.657
G1 X122.657 Y120.145 E.15263
G1 X122.124 Y120.145
G1 X119.145 Y123.124 E.12946
G1 X119.145 Y122.591
G1 X121.591 Y120.145 E.10629
G1 X121.057 Y120.145
G1 X119.145 Y122.057 E.08312
G1 X119.145 Y121.524
G1 X120.524 Y120.145 E.05994
G1 X119.991 Y120.145
G1 X119.145 Y120.991 E.03677
M204 S10000
G1 X124.045 Y119.824 F30000
M204 S2000
G1 F11179
G1 X125.451 Y118.417 E.06111
G1 X124.918 Y118.417
G1 X124.045 Y119.29 E.03794
G1 X124.045 Y118.757
G1 X124.384 Y118.417 E.01476
M204 S10000
G1 X119.602 Y120.126 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.242975
G1 F11179
G1 X119.126 Y120.602 E.01097
; WIPE_START
G1 F24000
G1 X119.602 Y120.126 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.173 J.324 P1  F30000
G1 X123.923 Y135.767 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.11646
G1 F11179
G1 X123.804 Y135.842 E.00084
; LINE_WIDTH: 0.107778
G1 X123.812 Y135.858 E.0001
; LINE_WIDTH: 0.0811504
G1 X123.82 Y135.874 E.00006
G1 X124.408 Y137.574 F30000
; LINE_WIDTH: 0.0974784
G1 F11179
G1 X124.026 Y137.574 E.0017
; WIPE_START
G1 F24000
G1 X124.408 Y137.574 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.159 J1.206 P1  F30000
G1 X140.874 Y135.398 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.243074
G1 F11179
G1 X140.398 Y135.874 E.01097
G1 X137.931 Y137.05 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11179
G1 X136.526 Y137.05 E.04659
G1 X136.526 Y136.826 E.00742
G1 X136.926 Y136.426 E.01876
G1 X138.426 Y136.426 E.04976
G1 X139.05 Y137.05 E.02926
G1 X142.05 Y137.05 E.09952
G1 X142.05 Y132.374 E.15511
G1 X141.426 Y131.75 E.02926
G1 X141.426 Y131.926 E.00583
G1 X142.05 Y131.302 E.02926
G1 X142.05 Y124.698 E.21908
G1 X141.426 Y124.074 E.02926
G1 X141.426 Y124.25 E.00583
G1 X142.05 Y123.626 E.02926
G1 X142.05 Y118.95 E.15511
G1 X139.05 Y118.95 E.09952
G1 X138.426 Y119.574 E.02926
G1 X136.926 Y119.574 E.04976
G1 X136.526 Y119.174 E.01876
G1 X136.526 Y118.95 E.00742
G1 X137.931 Y118.95 E.04659
; WIPE_START
G1 F24000
G1 X136.526 Y118.95 E-.53372
G1 X136.526 Y119.174 E-.08504
G1 X136.789 Y119.437 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.04 J-1.216 P1  F30000
G1 X122.069 Y118.95 Z4.4
G1 Z4
G1 E.8 F1800
G1 F11179
G1 X123.474 Y118.95 E.04659
G1 X123.474 Y119.174 E.00742
G1 X123.074 Y119.574 E.01876
G1 X121.574 Y119.574 E.04976
G1 X120.95 Y118.95 E.02926
G1 X117.95 Y118.95 E.09952
G1 X117.95 Y123.626 E.15511
G1 X118.574 Y124.25 E.02926
G1 X118.574 Y124.074 E.00583
G1 X117.95 Y124.698 E.02926
G1 X117.95 Y131.302 E.21908
G1 X118.574 Y131.926 E.02926
G1 X118.574 Y131.75 E.00583
G1 X117.95 Y132.374 E.02926
G1 X117.95 Y137.05 E.15511
G1 X120.95 Y137.05 E.09952
G1 X121.574 Y136.426 E.02926
G1 X123.074 Y136.426 E.04976
G1 X123.474 Y136.826 E.01876
G1 X123.474 Y137.05 E.00742
G1 X122.069 Y137.05 E.04659
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.474 Y137.05 E-.53372
G1 X123.474 Y136.826 E-.08504
G1 X123.211 Y136.563 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/195
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
G3 Z4.4 I.829 J.891 P1  F30000
G1 X140.602 Y120.398 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2553
G1 X135.702 Y120.398 E.16254
G1 X135.702 Y118.602 E.05957
G1 X142.398 Y118.602 E.22211
G1 X142.398 Y137.398 E.62349
G1 X135.702 Y137.398 E.22211
G1 X135.702 Y135.602 E.05957
G1 X140.602 Y135.602 E.16254
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2553
G1 X135.31 Y120.79 E.15056
G1 X135.31 Y118.21 E.07928
G1 X142.79 Y118.21 E.22984
G1 X142.79 Y137.79 E.60164
G1 X135.31 Y137.79 E.22984
G1 X135.31 Y135.21 E.07928
G1 X140.21 Y135.21 E.15056
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.21 Y120.826 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.469 J1.123 P1  F30000
G1 X140.95 Y121.97 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2553
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
G1 X140.678 Y137.05 F30000
G1 F2553
G1 X139.05 Y137.05 E.05401
G1 X137.95 Y135.95 E.05157
G1 X137.402 Y135.95 E.0182
G1 X136.645 Y136.707 E.0355
G1 X136.645 Y137.05 E.01136
G1 X137.931 Y137.05 E.04265
G1 X136.176 Y136.92 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.584076
G1 F2553
G1 X136.184 Y136.158 E.03361
; WIPE_START
G1 F24000
G1 X136.176 Y136.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.217 J0 P1  F30000
G1 X136.171 Y119.071 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.573824
G1 F2553
G2 X136.178 Y119.852 I10.653 J.284 E.0338
G1 X137.931 Y118.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2553
G1 X136.645 Y118.95 E.04265
G1 X136.645 Y119.293 E.01136
G1 X137.402 Y120.05 E.0355
G1 X137.95 Y120.05 E.0182
G1 X139.05 Y118.95 E.05157
G1 X140.678 Y118.95 E.05401
; WIPE_START
G1 F24000
G1 X139.05 Y118.95 E-.61876
G1 X138.787 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.074 J-1.215 P1  F30000
G1 X119.398 Y120.398 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2553
G1 X119.398 Y135.602 E.50435
G1 X124.298 Y135.602 E.16254
G1 X124.298 Y137.398 E.05957
G1 X117.602 Y137.398 E.22211
G1 X117.602 Y118.602 E.62349
G1 X124.298 Y118.602 E.22211
G1 X124.298 Y120.398 E.05957
G1 X119.458 Y120.398 E.16055
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2553
G1 X119.79 Y135.21 E.44309
G1 X124.69 Y135.21 E.15056
G1 X124.69 Y137.79 E.07928
G1 X117.21 Y137.79 E.22984
G1 X117.21 Y118.21 E.60164
G1 X124.69 Y118.21 E.22984
G1 X124.69 Y120.79 E.07928
G1 X119.85 Y120.79 E.14872
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.875 J-.846 P1  F30000
G1 X119.05 Y121.97 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2553
G1 X119.05 Y123.598 E.05401
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y134.03 E.05401
G1 X119.322 Y137.05 F30000
G1 F2553
G1 X120.95 Y137.05 E.05401
G1 X122.05 Y135.95 E.05157
G1 X122.598 Y135.95 E.0182
G1 X123.355 Y136.707 E.0355
G1 X123.355 Y137.05 E.01136
G1 X122.069 Y137.05 E.04265
G1 X123.829 Y136.929 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.573829
G1 F2553
G2 X123.822 Y136.148 I-10.653 J-.284 E.0338
; WIPE_START
G1 F24000
G1 X123.829 Y136.929 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.217 J0 P1  F30000
G1 X123.824 Y119.08 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.584078
G1 F2553
G1 X123.816 Y119.842 E.03361
G1 X122.069 Y118.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2553
G1 X123.355 Y118.95 E.04265
G1 X123.355 Y119.293 E.01136
G1 X122.598 Y120.05 E.0355
G1 X122.05 Y120.05 E.0182
G1 X120.95 Y118.95 E.05157
G1 X119.322 Y118.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y118.95 E-.61876
G1 X121.213 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/195
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
G3 Z4.6 I-.074 J1.215 P1  F30000
G1 X140.602 Y120.398 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2518
G1 X135.902 Y120.398 E.15591
G1 X135.902 Y118.602 E.05957
G1 X142.398 Y118.602 E.21548
G1 X142.398 Y137.398 E.62349
G1 X135.902 Y137.398 E.21548
G1 X135.902 Y135.602 E.05957
G1 X140.602 Y135.602 E.15591
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2518
G1 X135.51 Y120.79 E.14442
G1 X135.51 Y118.21 E.07928
G1 X142.79 Y118.21 E.22369
G1 X142.79 Y137.79 E.60164
G1 X135.51 Y137.79 E.22369
G1 X135.51 Y135.21 E.07928
G1 X140.21 Y135.21 E.14442
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.21 Y120.824 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.469 J1.123 P1  F30000
G1 X140.95 Y121.97 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2518
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
M73 P26 R27
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
G1 X140.678 Y137.05 F30000
G1 F2518
G1 X139.05 Y137.05 E.05401
G1 X137.95 Y135.95 E.05157
G1 X137.402 Y135.95 E.0182
G1 X136.769 Y136.583 E.02967
G1 X136.769 Y137.05 E.01549
G1 X137.931 Y137.05 E.03853
G1 X136.336 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2518
G1 X136.336 Y136.272 E.02581
; LINE_WIDTH: 0.502908
G1 X136.347 Y136.199 E.00276
; LINE_WIDTH: 0.534276
G1 X136.358 Y136.126 E.00295
; WIPE_START
G1 F24000
G1 X136.347 Y136.199 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.217 J-.001 P1  F30000
G1 X136.333 Y119.033 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.496912
G1 F2518
G1 X136.336 Y119.73 E.02581
; LINE_WIDTH: 0.502916
G1 X136.347 Y119.802 E.00272
; LINE_WIDTH: 0.53428
G1 X136.358 Y119.874 E.00291
G1 X137.931 Y118.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2518
G1 X136.769 Y118.95 E.03853
G1 X136.769 Y119.417 E.01549
G1 X137.402 Y120.05 E.02967
G1 X137.95 Y120.05 E.0182
M73 P26 R26
G1 X139.05 Y118.95 E.05157
G1 X140.678 Y118.95 E.05401
; WIPE_START
G1 F24000
G1 X139.05 Y118.95 E-.61876
G1 X138.787 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.074 J-1.215 P1  F30000
G1 X119.398 Y120.398 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2518
G1 X119.398 Y135.602 E.50435
G1 X124.098 Y135.602 E.15591
G1 X124.098 Y137.398 E.05957
G1 X117.602 Y137.398 E.21548
G1 X117.602 Y118.602 E.62349
G1 X124.098 Y118.602 E.21548
G1 X124.098 Y120.398 E.05957
G1 X119.458 Y120.398 E.15392
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2518
G1 X119.79 Y135.21 E.44309
G1 X124.49 Y135.21 E.14442
G1 X124.49 Y137.79 E.07928
G1 X117.21 Y137.79 E.22369
G1 X117.21 Y118.21 E.60164
G1 X124.49 Y118.21 E.22369
G1 X124.49 Y120.79 E.07928
G1 X119.85 Y120.79 E.14257
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.875 J-.846 P1  F30000
G1 X119.05 Y121.97 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2518
G1 X119.05 Y123.598 E.05401
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y134.03 E.05401
G1 X119.322 Y137.05 F30000
G1 F2518
G1 X120.95 Y137.05 E.05401
G1 X122.05 Y135.95 E.05157
G1 X122.598 Y135.95 E.0182
G1 X123.231 Y136.583 E.02967
G1 X123.231 Y137.05 E.01549
G1 X122.069 Y137.05 E.03853
G1 X123.664 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2518
G1 X123.664 Y136.272 E.02581
G1 X123.653 Y136.199 E.00276
; LINE_WIDTH: 0.534277
G1 X123.642 Y136.126 E.00295
; WIPE_START
G1 F24000
G1 X123.653 Y136.199 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.217 J-.002 P1  F30000
G1 X123.633 Y119.928 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.565644
G1 F2518
G1 X123.648 Y119.514 E.01766
; LINE_WIDTH: 0.534276
G1 X123.662 Y119.1 E.0166
G1 X122.069 Y118.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2518
G1 X123.231 Y118.95 E.03853
G1 X123.231 Y119.417 E.01549
G1 X122.598 Y120.05 E.02967
G1 X122.05 Y120.05 E.0182
G1 X120.95 Y118.95 E.05157
G1 X119.322 Y118.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y118.95 E-.61876
G1 X121.213 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/195
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
G3 Z4.8 I-.074 J1.215 P1  F30000
G1 X140.602 Y120.398 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2484
G1 X136.102 Y120.398 E.14927
G1 X136.102 Y118.602 E.05957
G1 X142.398 Y118.602 E.20884
G1 X142.398 Y137.398 E.62349
G1 X136.102 Y137.398 E.20884
G1 X136.102 Y135.602 E.05957
G1 X140.602 Y135.602 E.14927
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2484
G1 X135.71 Y120.79 E.13827
G1 X135.71 Y118.21 E.07928
G1 X142.79 Y118.21 E.21755
G1 X142.79 Y137.79 E.60164
G1 X135.71 Y137.79 E.21755
G1 X135.71 Y135.21 E.07928
G1 X140.21 Y135.21 E.13827
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.21 Y120.823 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.47 J1.123 P1  F30000
G1 X140.95 Y121.97 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2484
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
G1 X140.678 Y137.05 F30000
G1 F2484
G1 X139.05 Y137.05 E.05401
G1 X137.95 Y135.95 E.05157
G1 X137.402 Y135.95 E.0182
G1 X136.969 Y136.383 E.02029
G1 X136.969 Y137.05 E.02212
G1 X137.931 Y137.05 E.03189
G1 X136.536 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2484
G1 X136.536 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X136.536 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.217 J0 P1  F30000
G1 X136.536 Y119.96 Z5
G1 Z4.6
G1 E.8 F1800
G1 F2484
G1 X136.536 Y119.1 E.03226
G1 X137.931 Y118.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2484
G1 X136.969 Y118.95 E.03189
G1 X136.969 Y119.617 E.02212
G1 X137.402 Y120.05 E.02029
G1 X137.95 Y120.05 E.0182
G1 X139.05 Y118.95 E.05157
G1 X140.678 Y118.95 E.05401
; WIPE_START
G1 F24000
G1 X139.05 Y118.95 E-.61876
G1 X138.787 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.074 J-1.215 P1  F30000
G1 X119.398 Y120.398 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2484
G1 X119.398 Y135.602 E.50435
G1 X123.898 Y135.602 E.14927
G1 X123.898 Y137.398 E.05957
G1 X117.602 Y137.398 E.20884
G1 X117.602 Y118.602 E.62349
G1 X123.898 Y118.602 E.20884
G1 X123.898 Y120.398 E.05957
G1 X119.458 Y120.398 E.14728
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2484
G1 X119.79 Y135.21 E.44309
G1 X124.29 Y135.21 E.13827
G1 X124.29 Y137.79 E.07928
G1 X117.21 Y137.79 E.21755
G1 X117.21 Y118.21 E.60164
G1 X124.29 Y118.21 E.21755
G1 X124.29 Y120.79 E.07928
G1 X119.85 Y120.79 E.13643
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.875 J-.846 P1  F30000
G1 X119.05 Y121.97 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2484
G1 X119.05 Y123.598 E.05401
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y134.03 E.05401
G1 X119.322 Y137.05 F30000
G1 F2484
G1 X120.95 Y137.05 E.05401
G1 X122.05 Y135.95 E.05157
G1 X122.598 Y135.95 E.0182
G1 X123.031 Y136.383 E.02029
G1 X123.031 Y137.05 E.02212
G1 X122.069 Y137.05 E.03189
G1 X123.464 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2484
G1 X123.464 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X123.464 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.217 J0 P1  F30000
G1 X123.464 Y119.96 Z5
G1 Z4.6
G1 E.8 F1800
G1 F2484
G1 X123.464 Y119.1 E.03226
G1 X122.069 Y118.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2484
G1 X123.031 Y118.95 E.03189
G1 X123.031 Y119.617 E.02212
G1 X122.598 Y120.05 E.02029
G1 X122.05 Y120.05 E.0182
G1 X120.95 Y118.95 E.05157
G1 X119.322 Y118.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y118.95 E-.61876
G1 X121.213 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/195
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
G3 Z5 I-.074 J1.215 P1  F30000
G1 X140.602 Y120.398 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2449
G1 X136.302 Y120.398 E.14264
G1 X136.302 Y118.602 E.05957
G1 X142.398 Y118.602 E.20221
G1 X142.398 Y137.398 E.62349
G1 X136.302 Y137.398 E.20221
G1 X136.302 Y135.602 E.05957
G1 X140.602 Y135.602 E.14264
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2449
G1 X135.91 Y120.79 E.13213
G1 X135.91 Y118.21 E.07928
G1 X142.79 Y118.21 E.2114
G1 X142.79 Y137.79 E.60164
G1 X135.91 Y137.79 E.2114
G1 X135.91 Y135.21 E.07928
G1 X140.21 Y135.21 E.13213
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.21 Y120.822 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.47 J1.122 P1  F30000
G1 X140.95 Y121.97 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2449
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
G1 X140.678 Y137.05 F30000
G1 F2449
G1 X139.05 Y137.05 E.05401
G1 X137.95 Y135.95 E.05157
G1 X137.402 Y135.95 E.0182
G1 X137.169 Y136.183 E.0109
G1 X137.169 Y137.05 E.02876
G1 X137.931 Y137.05 E.02526
G1 X136.736 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2449
G1 X136.736 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X136.736 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.217 J0 P1  F30000
G1 X136.736 Y119.96 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F2449
G1 X136.736 Y119.1 E.03226
G1 X137.931 Y118.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2449
G1 X137.169 Y118.95 E.02526
G1 X137.169 Y119.817 E.02876
G1 X137.402 Y120.05 E.0109
G1 X137.95 Y120.05 E.0182
G1 X139.05 Y118.95 E.05157
G1 X140.678 Y118.95 E.05401
; WIPE_START
G1 F24000
G1 X139.05 Y118.95 E-.61876
G1 X138.787 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.074 J-1.215 P1  F30000
G1 X119.398 Y120.398 Z5.2
G1 Z4.8
M73 P27 R26
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2449
G1 X119.398 Y135.602 E.50435
G1 X123.698 Y135.602 E.14264
G1 X123.698 Y137.398 E.05957
G1 X117.602 Y137.398 E.20221
G1 X117.602 Y118.602 E.62349
G1 X123.698 Y118.602 E.20221
G1 X123.698 Y120.398 E.05957
G1 X119.458 Y120.398 E.14065
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2449
G1 X119.79 Y135.21 E.44309
G1 X124.09 Y135.21 E.13213
G1 X124.09 Y137.79 E.07928
G1 X117.21 Y137.79 E.2114
G1 X117.21 Y118.21 E.60164
G1 X124.09 Y118.21 E.2114
G1 X124.09 Y120.79 E.07928
G1 X119.85 Y120.79 E.13028
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.875 J-.846 P1  F30000
G1 X119.05 Y121.97 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2449
G1 X119.05 Y123.598 E.05401
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y134.03 E.05401
G1 X119.322 Y137.05 F30000
G1 F2449
G1 X120.95 Y137.05 E.05401
G1 X122.05 Y135.95 E.05157
G1 X122.598 Y135.95 E.0182
G1 X122.831 Y136.183 E.0109
G1 X122.831 Y137.05 E.02876
G1 X122.069 Y137.05 E.02526
G1 X123.264 Y136.04 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2449
G1 X123.264 Y136.9 E.03226
; WIPE_START
G1 F24000
G1 X123.264 Y136.04 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.217 J0 P1  F30000
G1 X123.264 Y119.96 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F2449
G1 X123.264 Y119.1 E.03226
G1 X122.069 Y118.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2449
G1 X122.831 Y118.95 E.02526
G1 X122.831 Y119.817 E.02876
G1 X122.598 Y120.05 E.0109
G1 X122.05 Y120.05 E.0182
G1 X120.95 Y118.95 E.05157
G1 X119.322 Y118.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y118.95 E-.61876
G1 X121.213 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/195
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
G3 Z5.2 I-.074 J1.215 P1  F30000
G1 X140.602 Y120.398 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2414
G1 X136.502 Y120.398 E.136
G1 X136.502 Y118.602 E.05957
G1 X142.398 Y118.602 E.19558
G1 X142.398 Y137.398 E.62349
G1 X136.502 Y137.398 E.19558
G1 X136.502 Y135.602 E.05957
G1 X140.602 Y135.602 E.136
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2414
G1 X136.11 Y120.79 E.12598
G1 X136.11 Y118.21 E.07928
G1 X142.79 Y118.21 E.20526
G1 X142.79 Y137.79 E.60164
G1 X136.11 Y137.79 E.20526
G1 X136.11 Y135.21 E.07928
G1 X140.21 Y135.21 E.12598
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.21 Y120.821 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.471 J1.122 P1  F30000
G1 X140.95 Y121.97 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2414
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
G1 X140.678 Y137.05 F30000
G1 F2414
G1 X139.05 Y137.05 E.05401
G1 X137.95 Y135.95 E.05157
G1 X137.402 Y135.95 E.0182
G1 X137.369 Y137.05 E.03648
G1 X137.931 Y137.05 E.01862
G1 X136.936 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2414
G1 X136.936 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X136.936 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.217 J0 P1  F30000
G1 X136.936 Y119.96 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2414
G1 X136.936 Y119.1 E.03226
G1 X137.931 Y118.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2414
G1 X137.369 Y118.95 E.01862
G1 X137.402 Y120.05 E.03648
G1 X137.95 Y120.05 E.0182
G1 X139.05 Y118.95 E.05157
G1 X140.678 Y118.95 E.05401
; WIPE_START
G1 F24000
G1 X139.05 Y118.95 E-.61876
G1 X138.787 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.074 J-1.215 P1  F30000
G1 X119.398 Y120.398 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2414
G1 X119.398 Y135.602 E.50435
G1 X123.498 Y135.602 E.136
G1 X123.498 Y137.398 E.05957
G1 X117.602 Y137.398 E.19558
G1 X117.602 Y118.602 E.62349
G1 X123.498 Y118.602 E.19558
G1 X123.498 Y120.398 E.05957
G1 X119.458 Y120.398 E.13401
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2414
G1 X119.79 Y135.21 E.44309
G1 X123.89 Y135.21 E.12598
G1 X123.89 Y137.79 E.07928
G1 X117.21 Y137.79 E.20526
G1 X117.21 Y118.21 E.60164
G1 X123.89 Y118.21 E.20526
G1 X123.89 Y120.79 E.07928
G1 X119.85 Y120.79 E.12414
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.875 J-.846 P1  F30000
G1 X119.05 Y121.97 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2414
G1 X119.05 Y123.598 E.05401
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y134.03 E.05401
G1 X119.322 Y137.05 F30000
G1 F2414
G1 X120.95 Y137.05 E.05401
G1 X122.05 Y135.95 E.05157
G1 X122.598 Y135.95 E.0182
G1 X122.631 Y137.05 E.03648
G1 X122.069 Y137.05 E.01862
G1 X123.064 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2414
G1 X123.064 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X123.064 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.217 J0 P1  F30000
G1 X123.064 Y119.04 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2414
G1 X123.064 Y119.9 E.03226
G1 X122.069 Y118.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2414
G1 X122.631 Y118.95 E.01862
G1 X122.598 Y120.05 E.03648
G1 X122.05 Y120.05 E.0182
G1 X120.95 Y118.95 E.05157
G1 X119.322 Y118.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.95 Y118.95 E-.61876
G1 X121.213 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/195
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
G3 Z5.4 I-.074 J1.215 P1  F30000
G1 X140.602 Y120.398 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2472
G1 X136.702 Y120.398 E.12937
G1 X136.702 Y118.602 E.05957
G1 X142.398 Y118.602 E.18894
G1 X142.398 Y137.398 E.62349
G1 X136.702 Y137.398 E.18894
G1 X136.702 Y135.602 E.05957
G1 X140.602 Y135.602 E.12937
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2472
G1 X136.31 Y120.79 E.11984
G1 X136.31 Y118.21 E.07928
G1 X142.79 Y118.21 E.19911
G1 X142.79 Y137.79 E.60164
G1 X136.31 Y137.79 E.19911
G1 X136.31 Y135.21 E.07928
G1 X140.21 Y135.21 E.11984
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.21 Y120.819 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.735 J.97 P1  F30000
G1 X140.678 Y118.95 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2472
G1 X139.05 Y118.95 E.05401
G1 X137.95 Y120.05 E.05157
G1 X140.95 Y120.05 E.09952
G1 X140.95 Y123.598 E.11772
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y135.95 E.11772
G1 X137.95 Y135.95 E.09952
G1 X139.05 Y137.05 E.05157
G1 X140.678 Y137.05 E.05401
G1 X137.136 Y136.04 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2472
G1 X137.136 Y136.9 E.03226
; WIPE_START
G1 F24000
G1 X137.136 Y136.04 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.217 J0 P1  F30000
G1 X137.136 Y119.04 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F2472
G1 X137.136 Y119.9 E.03226
; WIPE_START
G1 F24000
G1 X137.136 Y119.04 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.093 J-1.213 P1  F30000
G1 X119.398 Y120.398 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2472
G1 X119.398 Y135.602 E.50435
G1 X123.298 Y135.602 E.12937
G1 X123.298 Y137.398 E.05957
G1 X117.602 Y137.398 E.18894
G1 X117.602 Y118.602 E.62349
G1 X123.298 Y118.602 E.18894
G1 X123.298 Y120.398 E.05957
G1 X119.458 Y120.398 E.12738
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2472
G1 X119.79 Y135.21 E.44309
G1 X123.69 Y135.21 E.11984
G1 X123.69 Y137.79 E.07928
G1 X117.21 Y137.79 E.19911
G1 X117.21 Y118.21 E.60164
G1 X123.69 Y118.21 E.19911
G1 X123.69 Y120.79 E.07928
G1 X119.85 Y120.79 E.11799
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.206 J-.163 P1  F30000
G1 X119.322 Y118.95 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2472
G1 X120.95 Y118.95 E.05401
G1 X122.05 Y120.05 E.05157
G1 X119.05 Y120.05 E.09952
G1 X119.05 Y123.598 E.11772
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y135.95 E.11772
G1 X122.05 Y135.95 E.09952
G1 X120.95 Y137.05 E.05157
G1 X119.322 Y137.05 E.05401
G1 X122.864 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2472
G1 X122.864 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X122.864 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.217 J0 P1  F30000
G1 X122.864 Y119.96 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F2472
G1 X122.864 Y119.1 E.03226
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.864 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/195
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
G3 Z5.6 I-.03 J1.217 P1  F30000
G1 X140.602 Y120.398 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2444
G1 X136.902 Y120.398 E.12274
G1 X136.902 Y118.602 E.05957
G1 X142.398 Y118.602 E.18231
G1 X142.398 Y137.398 E.62349
M73 P28 R26
G1 X136.902 Y137.398 E.18231
G1 X136.902 Y135.602 E.05957
G1 X140.602 Y135.602 E.12274
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2444
G1 X136.51 Y120.79 E.11369
G1 X136.51 Y118.21 E.07928
G1 X142.79 Y118.21 E.19297
G1 X142.79 Y137.79 E.60164
G1 X136.51 Y137.79 E.19297
G1 X136.51 Y135.21 E.07928
G1 X140.21 Y135.21 E.11369
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.21 Y120.818 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.734 J.97 P1  F30000
G1 X140.678 Y118.95 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2444
G1 X139.05 Y118.95 E.05401
G1 X137.95 Y120.05 E.05157
G1 X140.95 Y120.05 E.09952
G1 X140.95 Y123.598 E.11772
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y135.95 E.11772
G1 X137.95 Y135.95 E.09952
G1 X139.05 Y137.05 E.05157
G1 X140.678 Y137.05 E.05401
G1 X137.336 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2444
G1 X137.336 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X137.336 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J0 P1  F30000
G1 X137.336 Y119.04 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F2444
G1 X137.336 Y119.9 E.03226
; WIPE_START
G1 F24000
G1 X137.336 Y119.04 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.092 J-1.213 P1  F30000
G1 X119.398 Y120.398 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2444
G1 X119.398 Y135.602 E.50435
G1 X123.098 Y135.602 E.12274
G1 X123.098 Y137.398 E.05957
G1 X117.602 Y137.398 E.18231
G1 X117.602 Y118.602 E.62349
G1 X123.098 Y118.602 E.18231
G1 X123.098 Y120.398 E.05957
G1 X119.458 Y120.398 E.12075
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2444
G1 X119.79 Y135.21 E.44309
G1 X123.49 Y135.21 E.11369
G1 X123.49 Y137.79 E.07928
G1 X117.21 Y137.79 E.19297
G1 X117.21 Y118.21 E.60164
G1 X123.49 Y118.21 E.19297
G1 X123.49 Y120.79 E.07928
G1 X119.85 Y120.79 E.11185
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.206 J-.163 P1  F30000
G1 X119.322 Y118.95 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2444
G1 X120.95 Y118.95 E.05401
G1 X122.05 Y120.05 E.05157
G1 X119.05 Y120.05 E.09952
G1 X119.05 Y123.598 E.11772
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y135.95 E.11772
G1 X122.05 Y135.95 E.09952
G1 X120.95 Y137.05 E.05157
G1 X119.322 Y137.05 E.05401
G1 X122.664 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2444
G1 X122.664 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X122.664 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J0 P1  F30000
G1 X122.664 Y119.96 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F2444
G1 X122.664 Y119.1 E.03226
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.664 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/195
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
G3 Z5.8 I-.03 J1.217 P1  F30000
G1 X140.602 Y120.398 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2417
G1 X137.102 Y120.398 E.1161
G1 X137.102 Y118.602 E.05957
G1 X142.398 Y118.602 E.17567
G1 X142.398 Y137.398 E.62349
G1 X137.102 Y137.398 E.17567
G1 X137.102 Y135.602 E.05957
G1 X140.602 Y135.602 E.1161
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2417
G1 X136.71 Y120.79 E.10755
G1 X136.71 Y118.21 E.07928
G1 X142.79 Y118.21 E.18682
G1 X142.79 Y137.79 E.60164
G1 X136.71 Y137.79 E.18682
G1 X136.71 Y135.21 E.07928
G1 X140.21 Y135.21 E.10755
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.21 Y120.816 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.734 J.971 P1  F30000
G1 X140.678 Y118.95 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2417
G1 X139.05 Y118.95 E.05401
G1 X137.969 Y120.05 E.05113
G1 X140.95 Y120.05 E.09889
G1 X140.95 Y123.598 E.11772
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y135.95 E.11772
G1 X137.969 Y135.95 E.09889
G1 X139.05 Y137.05 E.05113
G1 X140.678 Y137.05 E.05401
G1 X137.536 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2417
G1 X137.536 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X137.536 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.217 J0 P1  F30000
G1 X137.536 Y119.96 Z6
G1 Z5.6
G1 E.8 F1800
G1 F2417
G1 X137.536 Y119.1 E.03226
; WIPE_START
G1 F24000
G1 X137.536 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.029 J-1.217 P1  F30000
G1 X119.398 Y120.398 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2417
G1 X119.398 Y135.602 E.50435
G1 X122.898 Y135.602 E.1161
G1 X122.898 Y137.398 E.05957
G1 X117.602 Y137.398 E.17567
G1 X117.602 Y118.602 E.62349
G1 X122.898 Y118.602 E.17567
G1 X122.898 Y120.398 E.05957
G1 X119.458 Y120.398 E.11411
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2417
G1 X119.79 Y135.21 E.44309
G1 X123.29 Y135.21 E.10755
G1 X123.29 Y137.79 E.07928
G1 X117.21 Y137.79 E.18682
G1 X117.21 Y118.21 E.60164
G1 X123.29 Y118.21 E.18682
G1 X123.29 Y120.79 E.07928
G1 X119.85 Y120.79 E.1057
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.206 J-.163 P1  F30000
G1 X119.322 Y118.95 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2417
G1 X120.95 Y118.95 E.05401
G1 X122.031 Y120.05 E.05113
G1 X119.05 Y120.05 E.09889
G1 X119.05 Y123.598 E.11772
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y135.95 E.11772
G1 X122.031 Y135.95 E.09889
G1 X120.95 Y137.05 E.05113
G1 X119.322 Y137.05 E.05401
G1 X122.464 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2417
G1 X122.464 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X122.464 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.217 J0 P1  F30000
G1 X122.464 Y119.96 Z6
G1 Z5.6
G1 E.8 F1800
G1 F2417
G1 X122.464 Y119.1 E.03226
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.464 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/195
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
G3 Z6 I-.029 J1.217 P1  F30000
G1 X140.602 Y120.398 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2383
G1 X137.302 Y120.398 E.10947
G1 X137.302 Y118.602 E.05957
G1 X142.398 Y118.602 E.16904
G1 X142.398 Y137.398 E.62349
G1 X137.302 Y137.398 E.16904
G1 X137.302 Y135.602 E.05957
M73 P28 R25
G1 X140.602 Y135.602 E.10947
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2383
G1 X136.91 Y120.79 E.1014
G1 X136.91 Y118.21 E.07928
G1 X142.79 Y118.21 E.18068
G1 X142.79 Y137.79 E.60164
G1 X136.91 Y137.79 E.18068
G1 X136.91 Y135.21 E.07928
G1 X140.21 Y135.21 E.1014
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.21 Y120.814 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.733 J.971 P1  F30000
G1 X140.678 Y118.95 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2383
G1 X139.05 Y118.95 E.05401
G1 X138.169 Y119.831 E.04131
G1 X138.169 Y120.05 E.00726
G1 X140.95 Y120.05 E.09226
G1 X140.95 Y123.598 E.11772
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y135.95 E.11772
G1 X138.169 Y135.95 E.09226
G1 X138.169 Y136.169 E.00726
G1 X139.05 Y137.05 E.04131
G1 X140.678 Y137.05 E.05401
G1 X137.736 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2383
G1 X137.736 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X137.736 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.217 J0 P1  F30000
G1 X137.736 Y119.96 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F2383
G1 X137.736 Y119.1 E.03226
; WIPE_START
G1 F24000
G1 X137.736 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.029 J-1.217 P1  F30000
G1 X119.398 Y120.398 Z6.2
M73 P29 R25
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2383
G1 X119.398 Y135.602 E.50435
G1 X122.698 Y135.602 E.10947
G1 X122.698 Y137.398 E.05957
G1 X117.602 Y137.398 E.16904
G1 X117.602 Y118.602 E.62349
G1 X122.698 Y118.602 E.16904
G1 X122.698 Y120.398 E.05957
G1 X119.458 Y120.398 E.10748
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2383
G1 X119.79 Y135.21 E.44309
G1 X123.09 Y135.21 E.1014
G1 X123.09 Y137.79 E.07928
G1 X117.21 Y137.79 E.18068
G1 X117.21 Y118.21 E.60164
G1 X123.09 Y118.21 E.18068
G1 X123.09 Y120.79 E.07928
G1 X119.85 Y120.79 E.09956
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.206 J-.163 P1  F30000
G1 X119.322 Y118.95 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2383
G1 X120.95 Y118.95 E.05401
G1 X121.831 Y119.831 E.04131
G1 X121.831 Y120.05 E.00726
G1 X119.05 Y120.05 E.09226
G1 X119.05 Y123.598 E.11772
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y135.95 E.11772
G1 X121.831 Y135.95 E.09226
G1 X121.831 Y136.169 E.00726
G1 X120.95 Y137.05 E.04131
G1 X119.322 Y137.05 E.05401
G1 X122.264 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2383
G1 X122.264 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X122.264 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.217 J0 P1  F30000
G1 X122.264 Y119.96 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F2383
G1 X122.264 Y119.1 E.03226
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.264 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/195
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
G3 Z6.2 I-.029 J1.217 P1  F30000
G1 X140.602 Y120.398 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2349
G1 X137.502 Y120.398 E.10283
G1 X137.502 Y118.602 E.05957
G1 X142.398 Y118.602 E.1624
G1 X142.398 Y137.398 E.62349
G1 X137.502 Y137.398 E.1624
G1 X137.502 Y135.602 E.05957
G1 X140.602 Y135.602 E.10283
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2349
G1 X137.11 Y120.79 E.09525
G1 X137.11 Y118.21 E.07928
G1 X142.79 Y118.21 E.17453
G1 X142.79 Y137.79 E.60164
G1 X137.11 Y137.79 E.17453
G1 X137.11 Y135.21 E.07928
G1 X140.21 Y135.21 E.09525
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.21 Y120.811 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.733 J.972 P1  F30000
G1 X140.678 Y118.95 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2349
G1 X139.05 Y118.95 E.05401
G1 X138.369 Y119.631 E.03192
G1 X138.369 Y120.05 E.01389
G1 X140.95 Y120.05 E.08562
G1 X140.95 Y123.598 E.11772
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y135.95 E.11772
G1 X138.369 Y135.95 E.08562
G1 X138.369 Y136.369 E.01389
G1 X139.05 Y137.05 E.03192
G1 X140.678 Y137.05 E.05401
G1 X137.936 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2349
G1 X137.936 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X137.936 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.217 J0 P1  F30000
G1 X137.936 Y119.04 Z6.4
G1 Z6
G1 E.8 F1800
G1 F2349
G1 X137.936 Y119.9 E.03226
; WIPE_START
G1 F24000
G1 X137.936 Y119.04 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.089 J-1.214 P1  F30000
G1 X119.398 Y120.398 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2349
G1 X119.398 Y135.602 E.50435
G1 X122.498 Y135.602 E.10283
G1 X122.498 Y137.398 E.05957
G1 X117.602 Y137.398 E.1624
G1 X117.602 Y118.602 E.62349
G1 X122.498 Y118.602 E.1624
G1 X122.498 Y120.398 E.05957
G1 X119.458 Y120.398 E.10084
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2349
G1 X119.79 Y135.21 E.44309
G1 X122.89 Y135.21 E.09525
G1 X122.89 Y137.79 E.07928
G1 X117.21 Y137.79 E.17453
G1 X117.21 Y118.21 E.60164
G1 X122.89 Y118.21 E.17453
G1 X122.89 Y120.79 E.07928
G1 X119.85 Y120.79 E.09341
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.206 J-.163 P1  F30000
G1 X119.322 Y118.95 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2349
G1 X120.95 Y118.95 E.05401
G1 X121.631 Y119.631 E.03192
G1 X121.631 Y120.05 E.01389
G1 X119.05 Y120.05 E.08562
G1 X119.05 Y123.598 E.11772
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y135.95 E.11772
G1 X121.631 Y135.95 E.08562
G1 X121.631 Y136.369 E.01389
G1 X120.95 Y137.05 E.03192
G1 X119.322 Y137.05 E.05401
G1 X122.064 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2349
G1 X122.064 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X122.064 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.217 J0 P1  F30000
G1 X122.064 Y119.96 Z6.4
G1 Z6
G1 E.8 F1800
G1 F2349
G1 X122.064 Y119.1 E.03226
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.064 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/195
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
G3 Z6.4 I-.029 J1.217 P1  F30000
G1 X140.602 Y120.398 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2313
G1 X137.702 Y120.398 E.0962
G1 X137.702 Y118.602 E.05957
G1 X142.398 Y118.602 E.15577
G1 X142.398 Y137.398 E.62349
G1 X137.702 Y137.398 E.15577
G1 X137.702 Y135.602 E.05957
G1 X140.602 Y135.602 E.0962
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2313
G1 X137.31 Y120.79 E.08911
G1 X137.31 Y118.21 E.07928
G1 X142.79 Y118.21 E.16839
G1 X142.79 Y137.79 E.60164
G1 X137.31 Y137.79 E.16839
G1 X137.31 Y135.21 E.07928
G1 X140.21 Y135.21 E.08911
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.21 Y120.809 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.732 J.972 P1  F30000
G1 X140.678 Y118.95 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2313
G1 X139.05 Y118.95 E.05401
G1 X138.569 Y119.431 E.02254
G1 X138.569 Y120.05 E.02053
G1 X140.95 Y120.05 E.07899
G1 X140.95 Y123.598 E.11772
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y135.95 E.11772
G1 X138.569 Y135.95 E.07899
G1 X138.569 Y136.569 E.02053
G1 X139.05 Y137.05 E.02254
G1 X140.678 Y137.05 E.05401
G1 X138.136 Y136.04 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2313
G1 X138.136 Y136.9 E.03226
; WIPE_START
G1 F24000
G1 X138.136 Y136.04 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.217 J0 P1  F30000
G1 X138.136 Y119.96 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F2313
G1 X138.136 Y119.1 E.03226
; WIPE_START
G1 F24000
G1 X138.136 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.028 J-1.217 P1  F30000
G1 X119.398 Y120.398 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2313
G1 X119.398 Y135.602 E.50435
G1 X122.298 Y135.602 E.0962
G1 X122.298 Y137.398 E.05957
G1 X117.602 Y137.398 E.15577
G1 X117.602 Y118.602 E.62349
G1 X122.298 Y118.602 E.15577
G1 X122.298 Y120.398 E.05957
G1 X119.458 Y120.398 E.09421
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2313
G1 X119.79 Y135.21 E.44309
G1 X122.69 Y135.21 E.08911
G1 X122.69 Y137.79 E.07928
G1 X117.21 Y137.79 E.16839
G1 X117.21 Y118.21 E.60164
G1 X122.69 Y118.21 E.16839
G1 X122.69 Y120.79 E.07928
G1 X119.85 Y120.79 E.08727
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.206 J-.163 P1  F30000
G1 X119.322 Y118.95 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2313
G1 X120.95 Y118.95 E.05401
G1 X121.431 Y119.431 E.02254
G1 X121.431 Y120.05 E.02053
G1 X119.05 Y120.05 E.07899
G1 X119.05 Y123.598 E.11772
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y135.95 E.11772
G1 X121.431 Y135.95 E.07899
G1 X121.431 Y136.569 E.02053
G1 X120.95 Y137.05 E.02254
G1 X119.322 Y137.05 E.05401
G1 X121.864 Y136.04 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2313
G1 X121.864 Y136.9 E.03226
; WIPE_START
G1 F24000
G1 X121.864 Y136.04 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.217 J0 P1  F30000
G1 X121.864 Y119.96 Z6.6
G1 Z6.2
G1 E.8 F1800
M73 P30 R25
G1 F2313
G1 X121.864 Y119.1 E.03226
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.864 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/195
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
G3 Z6.6 I-.028 J1.217 P1  F30000
G1 X140.602 Y120.398 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2280
G1 X137.902 Y120.398 E.08956
G1 X137.902 Y118.602 E.05957
G1 X142.398 Y118.602 E.14914
G1 X142.398 Y137.398 E.62349
G1 X137.902 Y137.398 E.14914
G1 X137.902 Y135.602 E.05957
G1 X140.602 Y135.602 E.08956
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2280
G1 X137.51 Y120.79 E.08296
G1 X137.51 Y118.21 E.07928
G1 X142.79 Y118.21 E.16224
G1 X142.79 Y137.79 E.60164
G1 X137.51 Y137.79 E.16224
G1 X137.51 Y135.21 E.07928
G1 X140.21 Y135.21 E.08296
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.21 Y120.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.731 J.973 P1  F30000
G1 X140.678 Y118.95 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2280
G1 X139.05 Y118.95 E.05401
G1 X138.769 Y119.231 E.01316
G1 X138.769 Y120.05 E.02716
G1 X140.95 Y120.05 E.07235
G1 X140.95 Y123.598 E.11772
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y135.95 E.11772
G1 X138.769 Y135.95 E.07235
G1 X138.769 Y136.769 E.02716
G1 X139.05 Y137.05 E.01316
G1 X140.678 Y137.05 E.05401
G1 X138.336 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2280
G1 X138.336 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X138.336 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J0 P1  F30000
G1 X138.336 Y119.96 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F2280
G1 X138.336 Y119.1 E.03226
; WIPE_START
G1 F24000
G1 X138.336 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.028 J-1.217 P1  F30000
G1 X119.398 Y120.398 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2280
G1 X119.398 Y135.602 E.50435
G1 X122.098 Y135.602 E.08956
G1 X122.098 Y137.398 E.05957
G1 X117.602 Y137.398 E.14914
G1 X117.602 Y118.602 E.62349
G1 X122.098 Y118.602 E.14914
G1 X122.098 Y120.398 E.05957
G1 X119.458 Y120.398 E.08757
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2280
G1 X119.79 Y135.21 E.44309
G1 X122.49 Y135.21 E.08296
G1 X122.49 Y137.79 E.07928
G1 X117.21 Y137.79 E.16224
G1 X117.21 Y118.21 E.60164
G1 X122.49 Y118.21 E.16224
G1 X122.49 Y120.79 E.07928
G1 X119.85 Y120.79 E.08112
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.206 J-.163 P1  F30000
G1 X119.322 Y118.95 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2280
G1 X120.95 Y118.95 E.05401
G1 X121.231 Y119.231 E.01316
G1 X121.231 Y120.05 E.02716
G1 X119.05 Y120.05 E.07235
G1 X119.05 Y123.598 E.11772
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y135.95 E.11772
G1 X121.231 Y135.95 E.07235
G1 X121.231 Y136.769 E.02716
G1 X120.95 Y137.05 E.01316
G1 X119.322 Y137.05 E.05401
G1 X121.664 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2280
G1 X121.664 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X121.664 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J0 P1  F30000
G1 X121.664 Y119.96 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F2280
G1 X121.664 Y119.1 E.03226
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.664 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/195
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
G3 Z6.8 I-.028 J1.217 P1  F30000
G1 X140.602 Y120.398 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2034
G1 X138.102 Y120.398 E.08293
G1 X138.102 Y118.602 E.05957
G1 X142.398 Y118.602 E.1425
G1 X142.398 Y137.398 E.62349
G1 X138.102 Y137.398 E.1425
G1 X138.102 Y135.602 E.05957
G1 X140.602 Y135.602 E.08293
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2034
G1 X137.71 Y120.79 E.07682
G1 X137.71 Y118.21 E.07928
G1 X142.79 Y118.21 E.15609
G1 X142.79 Y137.79 E.60164
G1 X137.71 Y137.79 E.15609
G1 X137.71 Y135.21 E.07928
G1 X140.21 Y135.21 E.07682
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.211 Y120.802 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.477 J1.119 P1  F30000
G1 X140.95 Y121.97 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2034
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
G1 X138.536 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2034
G1 X138.536 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X138.536 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.217 J0 P1  F30000
G1 X138.536 Y119.96 Z7
G1 Z6.6
G1 E.8 F1800
G1 F2034
G1 X138.536 Y119.1 E.03226
; WIPE_START
G1 F24000
G1 X138.536 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.028 J-1.217 P1  F30000
G1 X119.398 Y120.398 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2034
G1 X119.398 Y135.602 E.50435
G1 X121.898 Y135.602 E.08293
G1 X121.898 Y137.398 E.05957
G1 X117.602 Y137.398 E.1425
G1 X117.602 Y118.602 E.62349
G1 X121.898 Y118.602 E.1425
G1 X121.898 Y120.398 E.05957
G1 X119.458 Y120.398 E.08094
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2034
G1 X119.79 Y135.21 E.44309
G1 X122.29 Y135.21 E.07682
G1 X122.29 Y137.79 E.07928
G1 X117.21 Y137.79 E.15609
G1 X117.21 Y118.21 E.60164
G1 X122.29 Y118.21 E.15609
G1 X122.29 Y120.79 E.07928
G1 X119.85 Y120.79 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.875 J-.846 P1  F30000
G1 X119.05 Y121.97 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2034
G1 X119.05 Y123.598 E.05401
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y134.03 E.05401
G1 X121.464 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2034
G1 X121.464 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X121.464 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.217 J0 P1  F30000
G1 X121.464 Y119.96 Z7
G1 Z6.6
G1 E.8 F1800
G1 F2034
G1 X121.464 Y119.1 E.03226
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.464 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/195
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
G3 Z7 I-.028 J1.217 P1  F30000
G1 X140.602 Y120.398 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2027
G1 X138.302 Y120.398 E.0763
G1 X138.302 Y118.602 E.05957
G1 X142.398 Y118.602 E.13587
G1 X142.398 Y137.398 E.62349
G1 X138.302 Y137.398 E.13587
G1 X138.302 Y135.602 E.05957
G1 X140.602 Y135.602 E.0763
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2027
G1 X137.91 Y120.79 E.07067
G1 X137.91 Y118.21 E.07928
G1 X142.79 Y118.21 E.14995
G1 X142.79 Y137.79 E.60164
G1 X137.91 Y137.79 E.14995
G1 X137.91 Y135.21 E.07928
G1 X140.21 Y135.21 E.07067
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.211 Y120.798 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.479 J1.119 P1  F30000
G1 X140.95 Y121.97 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2027
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.027 J-.652 P1  F30000
G1 X138.736 Y136.04 Z7.2
G1 Z6.8
M73 P31 R25
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2027
G1 X138.736 Y136.9 E.03226
; WIPE_START
G1 F24000
G1 X138.736 Y136.04 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.217 J0 P1  F30000
G1 X138.736 Y119.96 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F2027
G1 X138.736 Y119.1 E.03226
; WIPE_START
G1 F24000
G1 X138.736 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.028 J-1.217 P1  F30000
G1 X119.398 Y120.398 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2027
G1 X119.398 Y135.602 E.50435
G1 X121.698 Y135.602 E.0763
G1 X121.698 Y137.398 E.05957
G1 X117.602 Y137.398 E.13587
G1 X117.602 Y118.602 E.62349
G1 X121.698 Y118.602 E.13587
G1 X121.698 Y120.398 E.05957
G1 X119.458 Y120.398 E.0743
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2027
G1 X119.79 Y135.21 E.44309
G1 X122.09 Y135.21 E.07067
G1 X122.09 Y137.79 E.07928
G1 X117.21 Y137.79 E.14995
G1 X117.21 Y118.21 E.60164
G1 X122.09 Y118.21 E.14995
G1 X122.09 Y120.79 E.07928
G1 X119.85 Y120.79 E.06883
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.875 J-.846 P1  F30000
G1 X119.05 Y121.97 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2027
G1 X119.05 Y123.598 E.05401
G1 X117.95 Y124.698 E.05157
G1 X117.95 Y123.626 E.03554
G1 X119.05 Y124.726 E.05157
G1 X119.05 Y131.274 E.21723
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y134.03 E.05401
G1 X121.264 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2027
G1 X121.264 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X121.264 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.217 J0 P1  F30000
G1 X121.264 Y119.96 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F2027
G1 X121.264 Y119.1 E.03226
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.264 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/195
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
G3 Z7.2 I-.028 J1.217 P1  F30000
G1 X140.602 Y120.398 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2402
G1 X138.502 Y120.398 E.06966
G1 X138.502 Y118.602 E.05957
G1 X142.398 Y118.602 E.12923
G1 X142.398 Y137.398 E.62349
G1 X138.502 Y137.398 E.12923
G1 X138.502 Y135.602 E.05957
G1 X140.602 Y135.602 E.06966
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2402
G1 X138.11 Y120.79 E.06453
G1 X138.11 Y118.21 E.07928
G1 X142.79 Y118.21 E.1438
G1 X142.79 Y137.79 E.60164
G1 X138.11 Y137.79 E.1438
G1 X138.11 Y135.21 E.07928
G1 X140.21 Y135.21 E.06453
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.211 Y120.793 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.48 J1.118 P1  F30000
G1 X140.95 Y121.97 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2402
G1 X140.95 Y123.598 E.05401
G1 X141.135 Y123.783 E.00867
G1 X141.893 Y123.783 E.02513
G1 X142.05 Y123.626 E.00736
G1 X142.05 Y121.998 E.05401
G1 X140.994 Y124.175 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2402
G1 X140.994 Y131.825 E.23505
G1 X142.006 Y131.825 E.03109
G1 X142.006 Y124.175 E.23505
G1 X141.054 Y124.175 E.02924
G1 X141.341 Y124.523 F30000
; LINE_WIDTH: 0.360223
G1 F2402
G1 X141.341 Y131.478 E.17983
G1 X141.659 Y131.478 E.0082
G1 X141.659 Y124.523 E.17983
G1 X141.401 Y124.523 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y124.523 E-.09778
G1 X141.659 Y126.265 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.117 J-.483 P1  F30000
G1 X138.936 Y119.96 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.502908
G1 F2402
G1 X138.936 Y119.1 E.03226
; WIPE_START
G1 F24000
G1 X138.936 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.205 J.173 P1  F30000
G1 X140.95 Y134.03 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2402
G1 X140.95 Y132.402 E.05401
G1 X141.135 Y132.217 E.00867
G1 X141.893 Y132.217 E.02513
G1 X142.05 Y132.374 E.00736
G1 X142.05 Y134.002 E.05401
G1 X138.936 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2402
G1 X138.936 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X138.936 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.787 J-.928 P1  F30000
G1 X119.398 Y120.398 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2402
G1 X119.398 Y135.602 E.50435
G1 X121.498 Y135.602 E.06966
G1 X121.498 Y137.398 E.05957
G1 X117.602 Y137.398 E.12923
G1 X117.602 Y118.602 E.62349
G1 X121.498 Y118.602 E.12923
G1 X121.498 Y120.398 E.05957
G1 X119.458 Y120.398 E.06767
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2402
G1 X119.79 Y135.21 E.44309
M73 P31 R24
G1 X121.89 Y135.21 E.06453
G1 X121.89 Y137.79 E.07928
G1 X117.21 Y137.79 E.1438
G1 X117.21 Y118.21 E.60164
G1 X121.89 Y118.21 E.1438
G1 X121.89 Y120.79 E.07928
G1 X119.85 Y120.79 E.06268
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.875 J-.846 P1  F30000
G1 X119.05 Y121.97 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2402
G1 X119.05 Y123.598 E.05401
G1 X118.865 Y123.783 E.00867
G1 X118.107 Y123.783 E.02513
G1 X117.95 Y123.626 E.00736
G1 X117.95 Y121.998 E.05401
G1 X119.006 Y124.175 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2402
G1 X117.994 Y124.175 E.03109
G1 X117.994 Y131.825 E.23505
G1 X119.006 Y131.825 E.03109
G1 X119.006 Y124.235 E.2332
G1 X118.659 Y124.523 F30000
; LINE_WIDTH: 0.360223
G1 F2402
G1 X118.341 Y124.523 E.0082
G1 X118.341 Y131.478 E.17983
G1 X118.659 Y131.478 E.0082
G1 X118.659 Y124.583 E.17828
; WIPE_START
G1 F24000
G1 X118.659 Y126.583 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.144 J.416 P1  F30000
G1 X121.064 Y119.96 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.50291
G1 F2402
G1 X121.064 Y119.1 E.03226
; WIPE_START
G1 F24000
G1 X121.064 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.205 J-.173 P1  F30000
G1 X119.05 Y134.03 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2402
G1 X119.05 Y132.402 E.05401
G1 X118.865 Y132.217 E.00867
G1 X118.107 Y132.217 E.02513
G1 X117.95 Y132.374 E.00736
G1 X117.95 Y134.002 E.05401
G1 X121.064 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2402
G1 X121.064 Y136.1 E.03226
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.064 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/195
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
G3 Z7.4 I.787 J.928 P1  F30000
G1 X140.602 Y120.398 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2334
G1 X138.702 Y120.398 E.06303
G1 X138.702 Y118.602 E.05957
G1 X142.398 Y118.602 E.1226
G1 X142.398 Y137.398 E.62349
G1 X138.702 Y137.398 E.1226
G1 X138.702 Y135.602 E.05957
G1 X140.602 Y135.602 E.06303
G1 X140.602 Y120.458 E.50236
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2334
G1 X138.31 Y120.79 E.05838
G1 X138.31 Y118.21 E.07928
G1 X142.79 Y118.21 E.13766
G1 X142.79 Y137.79 E.60164
G1 X138.31 Y137.79 E.13766
G1 X138.31 Y135.21 E.07928
G1 X140.21 Y135.21 E.05838
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.31 Y120.79 E-.72236
G1 X138.31 Y120.691 E-.03764
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.531 J1.095 P1  F30000
G1 X140.95 Y121.97 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2334
G1 X140.95 Y123.598 E.05401
G1 X141.135 Y123.783 E.00867
G1 X141.893 Y123.783 E.02513
G1 X142.05 Y123.626 E.00736
G1 X142.05 Y121.998 E.05401
G1 X140.994 Y124.175 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2334
G1 X140.994 Y131.825 E.23505
G1 X142.006 Y131.825 E.03109
G1 X142.006 Y124.175 E.23505
G1 X141.054 Y124.175 E.02924
G1 X141.341 Y124.523 F30000
; LINE_WIDTH: 0.360223
G1 F2334
G1 X141.341 Y131.478 E.17983
G1 X141.659 Y131.478 E.0082
G1 X141.659 Y124.523 E.17983
G1 X141.401 Y124.523 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y124.523 E-.09778
G1 X141.659 Y126.265 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.13 J-.452 P1  F30000
G1 X139.136 Y119.96 Z7.6
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.502908
G1 F2334
G1 X139.136 Y119.1 E.03226
; WIPE_START
G1 F24000
G1 X139.136 Y119.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.207 J.156 P1  F30000
G1 X140.95 Y134.03 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2334
G1 X140.95 Y132.402 E.05401
G1 X141.135 Y132.217 E.00867
G1 X141.893 Y132.217 E.02513
G1 X142.05 Y132.374 E.00736
G1 X142.05 Y134.002 E.05401
G1 X139.136 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2334
G1 X139.136 Y136.1 E.03226
; WIPE_START
G1 F24000
G1 X139.136 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.782 J-.932 P1  F30000
G1 X119.398 Y120.398 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2334
G1 X119.398 Y135.602 E.50435
G1 X121.298 Y135.602 E.06303
G1 X121.298 Y137.398 E.05957
G1 X117.602 Y137.398 E.1226
G1 X117.602 Y118.602 E.62349
G1 X121.298 Y118.602 E.1226
G1 X121.298 Y120.398 E.05957
G1 X119.458 Y120.398 E.06104
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P32 R24
G1 F2334
G1 X119.79 Y135.21 E.44309
G1 X121.69 Y135.21 E.05838
G1 X121.69 Y137.79 E.07928
G1 X117.21 Y137.79 E.13766
G1 X117.21 Y118.21 E.60164
G1 X121.69 Y118.21 E.13766
G1 X121.69 Y120.79 E.07928
G1 X119.85 Y120.79 E.05654
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.145 J.414 P1  F30000
G1 X120.864 Y119.96 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2334
G1 X120.864 Y119.1 E.03226
G1 X119.05 Y121.97 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2334
G1 X119.05 Y123.598 E.05401
G1 X118.865 Y123.783 E.00867
G1 X118.107 Y123.783 E.02513
G1 X117.95 Y123.626 E.00736
G1 X117.95 Y121.998 E.05401
G1 X119.006 Y124.175 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2334
G1 X117.994 Y124.175 E.03109
G1 X117.994 Y131.825 E.23505
G1 X119.006 Y131.825 E.03109
G1 X119.006 Y124.235 E.2332
G1 X118.659 Y124.523 F30000
; LINE_WIDTH: 0.360223
G1 F2334
G1 X118.341 Y124.523 E.0082
G1 X118.341 Y131.478 E.17983
G1 X118.659 Y131.478 E.0082
G1 X118.659 Y124.583 E.17828
G1 X117.95 Y134.002 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2334
G1 X117.95 Y132.374 E.05401
G1 X118.107 Y132.217 E.00736
G1 X118.865 Y132.217 E.02513
G1 X119.05 Y132.402 E.00867
G1 X119.05 Y134.03 E.05401
G1 X120.864 Y136.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2334
G1 X120.864 Y136.1 E.03226
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.864 Y136.96 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/195
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
G3 Z7.6 I.782 J.932 P1  F30000
G1 X140.602 Y120.398 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3175
G1 X138.902 Y120.398 E.05639
G1 X138.902 Y118.602 E.05957
G1 X142.398 Y118.602 E.11596
G1 X142.398 Y126.424 E.25946
G1 X140.602 Y126.424 E.05957
G1 X140.602 Y120.458 E.1979
; WIPE_START
G1 F24000
G1 X138.902 Y120.398 E-.6464
G1 X138.902 Y120.099 E-.1136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.142 J.421 P1  F30000
G1 X142.398 Y129.576 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F3175
G1 X142.398 Y137.398 E.25946
G1 X138.902 Y137.398 E.11596
G1 X138.902 Y135.602 E.05957
G1 X140.602 Y135.602 E.05639
G1 X140.602 Y129.576 E.19988
G1 X142.338 Y129.576 E.05758
; WIPE_START
G1 F24000
G1 X142.353 Y131.576 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.194 J-.237 P1  F30000
G1 X140.21 Y120.79 Z7.8
G1 Z7.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3175
G1 X138.51 Y120.79 E.05224
G1 X138.51 Y118.21 E.07928
G1 X142.79 Y118.21 E.13151
G1 X142.79 Y137.79 E.60164
G1 X138.51 Y137.79 E.13151
G1 X138.51 Y135.21 E.07928
G1 X140.21 Y135.21 E.05224
G1 X140.21 Y120.85 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X138.51 Y120.79 E-.6464
G1 X138.51 Y120.491 E-.1136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.02 J.663 P1  F30000
G1 X140.994 Y124.313 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3175
G1 X142.006 Y124.313 E.03109
G1 X142.006 Y118.994 E.16343
G1 X139.294 Y118.994 E.08332
G1 X139.294 Y120.006 E.03109
G1 X140.806 Y120.006 E.04644
G1 X140.939 Y120.061 E.00443
G1 X140.994 Y120.194 E.00443
G1 X140.994 Y124.253 E.12471
G1 X141.341 Y123.966 F30000
; LINE_WIDTH: 0.360223
G1 F3175
G1 X141.659 Y123.966 E.0082
G1 X141.659 Y120.194 E.09751
G1 X141.639 Y120.003 E.00498
; LINE_WIDTH: 0.399936
G1 X141.619 Y119.811 E.00561
; LINE_WIDTH: 0.460734
G3 X141.599 Y119.401 I1.97 J-.301 E.014
; LINE_WIDTH: 0.47936
G1 X141.335 Y119.381 E.00943
; LINE_WIDTH: 0.439648
G1 X141.07 Y119.361 E.00857
; LINE_WIDTH: 0.363842
G1 X140.806 Y119.341 E.00694
G1 X139.641 Y119.341 E.03045
G1 X139.641 Y119.659 E.0083
G1 X140.806 Y119.659 E.03045
; LINE_WIDTH: 0.360223
G1 X140.946 Y119.697 E.00376
; LINE_WIDTH: 0.399936
G1 X141.086 Y119.735 E.00423
; LINE_WIDTH: 0.439648
G1 X141.227 Y119.773 E.0047
; LINE_WIDTH: 0.47936
G1 X141.265 Y119.914 E.00517
; LINE_WIDTH: 0.439648
G1 X141.303 Y120.054 E.0047
; LINE_WIDTH: 0.361721
G1 X141.341 Y120.194 E.00378
G1 X141.341 Y123.906 E.09642
G1 X141.718 Y124.52 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3175
G1 X142.176 Y124.977 E.01986
G1 X142.176 Y125.511
G1 X141.185 Y124.52 E.04303
G1 X140.824 Y124.693
G1 X142.176 Y126.044 E.05871
G1 X141.8 Y126.201
G1 X140.824 Y125.226 E.04238
G1 X140.824 Y125.759
G1 X141.266 Y126.201 E.0192
M204 S10000
; WIPE_START
G1 F24000
G1 X140.824 Y125.759 E-.23747
G1 X140.824 Y125.226 E-.20264
G1 X141.42 Y125.821 E-.31988
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.004 J.688 P1  F30000
G1 X142.583 Y127.518 Z7.8
G1 Z7.4
G1 E.8 F1800
M204 S2000
G1 F3175
G1 X141.711 Y126.646 E.03787
G1 X141.178 Y126.646
G1 X142.583 Y128.051 E.06104
G1 X142.583 Y128.584
G1 X140.645 Y126.646 E.08421
G1 X140.417 Y126.952
G1 X142.583 Y129.117 E.09409
G1 X142.286 Y129.354
G1 X140.417 Y127.485 E.0812
G1 X140.417 Y128.019
G1 X141.753 Y129.354 E.05802
G1 X141.219 Y129.354
G1 X140.417 Y128.552 E.03485
M204 S10000
G1 X141.664 Y129.799 F30000
M204 S2000
G1 F3175
G1 X142.176 Y130.31 E.02222
G1 X142.176 Y130.843
G1 X141.131 Y129.799 E.04539
G1 X140.824 Y130.026
G1 X142.176 Y131.377 E.05871
G1 X141.745 Y131.48
G1 X140.824 Y130.559 E.04001
G1 X140.824 Y131.092
G1 X141.212 Y131.48 E.01684
M204 S10000
G1 X140.994 Y131.687 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3175
G1 X140.994 Y135.806 E.12655
G1 X140.939 Y135.939 E.00443
G1 X140.806 Y135.994 E.00443
G1 X139.294 Y135.994 E.04644
G1 X139.294 Y137.006 E.03109
G1 X142.006 Y137.006 E.08332
G1 X142.006 Y131.687 E.16343
G1 X141.054 Y131.687 E.02924
G1 X141.341 Y132.034 F30000
; LINE_WIDTH: 0.360223
G1 F3175
G1 X141.341 Y135.806 E.09751
G1 X141.303 Y135.946 E.00376
; LINE_WIDTH: 0.399936
G1 X141.265 Y136.086 E.00423
; LINE_WIDTH: 0.439648
G1 X141.227 Y136.227 E.0047
; LINE_WIDTH: 0.47936
G1 X141.086 Y136.265 E.00517
; LINE_WIDTH: 0.439648
G1 X140.946 Y136.303 E.0047
; LINE_WIDTH: 0.362293
G1 X140.806 Y136.341 E.00378
G1 X139.641 Y136.341 E.0303
G1 X139.641 Y136.659 E.00826
G1 X140.806 Y136.659 E.0303
; LINE_WIDTH: 0.360223
G1 X140.997 Y136.639 E.00498
; LINE_WIDTH: 0.399936
G1 X141.189 Y136.619 E.00561
; LINE_WIDTH: 0.460734
G3 X141.599 Y136.599 I.301 J1.97 E.014
; LINE_WIDTH: 0.47936
G1 X141.618 Y136.375 E.008
; LINE_WIDTH: 0.441402
G1 X141.637 Y136.151 E.00731
; LINE_WIDTH: 0.362592
G2 X141.659 Y135.806 I-2.738 J-.345 E.00901
G1 X141.659 Y132.034 E.09824
G1 X141.401 Y132.034 E.0067
; WIPE_START
G1 F24000
G1 X141.659 Y132.034 E-.09778
G1 X141.659 Y133.777 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.627 J-1.043 P1  F30000
G1 X119.398 Y120.398 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3175
G1 X119.398 Y126.424 E.19989
G1 X117.602 Y126.424 E.05957
G1 X117.602 Y118.602 E.25946
G1 X121.098 Y118.602 E.11596
G1 X121.098 Y120.398 E.05957
G1 X119.458 Y120.398 E.0544
; WIPE_START
G1 F24000
G1 X119.438 Y122.398 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.179 J-.302 P1  F30000
G1 X117.602 Y129.576 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F3175
G1 X119.398 Y129.576 E.05957
G1 X119.398 Y135.602 E.19988
G1 X121.098 Y135.602 E.05639
G1 X121.098 Y137.398 E.05957
G1 X117.602 Y137.398 E.11596
G1 X117.602 Y129.636 E.25747
; WIPE_START
G1 F24000
G1 X119.398 Y129.576 E-.6828
G1 X119.398 Y129.779 E-.0772
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.216 J.053 P1  F30000
G1 X119.79 Y120.79 Z7.8
G1 Z7.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3175
G1 X119.79 Y135.21 E.44309
G1 X121.49 Y135.21 E.05224
G1 X121.49 Y137.79 E.07928
G1 X117.21 Y137.79 E.13151
G1 X117.21 Y118.21 E.60164
G1 X121.49 Y118.21 E.13151
G1 X121.49 Y120.79 E.07928
G1 X119.85 Y120.79 E.05039
M204 S10000
; WIPE_START
G1 F24000
G1 X119.842 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.067 J-.586 P1  F30000
G1 X119.006 Y124.313 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3175
G1 X119.006 Y120.194 E.12655
G1 X119.061 Y120.061 E.00443
G1 X119.194 Y120.006 E.00443
G1 X120.706 Y120.006 E.04644
G1 X120.706 Y118.994 E.03109
G1 X117.994 Y118.994 E.08332
G1 X117.994 Y124.313 E.16343
G1 X118.946 Y124.313 E.02924
G1 X118.659 Y123.966 F30000
; LINE_WIDTH: 0.360223
G1 F3175
G1 X118.659 Y120.194 E.09751
G1 X118.697 Y120.054 E.00376
; LINE_WIDTH: 0.399936
G1 X118.735 Y119.914 E.00423
; LINE_WIDTH: 0.439648
G1 X118.773 Y119.773 E.0047
; LINE_WIDTH: 0.47936
G1 X118.914 Y119.735 E.00517
; LINE_WIDTH: 0.439648
G1 X119.054 Y119.697 E.0047
; LINE_WIDTH: 0.362293
G1 X119.194 Y119.659 E.00378
G1 X120.359 Y119.659 E.0303
G1 X120.359 Y119.341 E.00826
G1 X119.194 Y119.341 E.0303
; LINE_WIDTH: 0.360223
G1 X119.003 Y119.361 E.00498
; LINE_WIDTH: 0.399936
G1 X118.811 Y119.381 E.00561
; LINE_WIDTH: 0.460734
G3 X118.401 Y119.401 I-.301 J-1.97 E.014
; LINE_WIDTH: 0.47936
G1 X118.381 Y119.665 E.00943
; LINE_WIDTH: 0.439648
G1 X118.361 Y119.93 E.00857
; LINE_WIDTH: 0.362676
G1 X118.341 Y120.194 E.00691
G1 X118.341 Y123.966 E.09827
G1 X118.599 Y123.966 E.0067
G1 X118.788 Y124.52 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3175
G1 X119.176 Y124.908 E.01685
G1 X119.176 Y125.441
G1 X118.255 Y124.52 E.04002
G1 X117.824 Y124.623
G1 X119.176 Y125.975 E.05871
G1 X118.869 Y126.201
G1 X117.824 Y125.157 E.04539
G1 X117.824 Y125.69
G1 X118.336 Y126.201 E.02222
M204 S10000
G1 X119.583 Y127.448 F30000
M204 S2000
G1 F3175
G1 X118.781 Y126.646 E.03485
G1 X118.247 Y126.646
G1 X119.583 Y127.981 E.05803
G1 X119.583 Y128.515
G1 X117.714 Y126.646 E.0812
G1 X117.417 Y126.883
G1 X119.583 Y129.048 E.09409
G1 X119.355 Y129.354
G1 X117.417 Y127.416 E.08421
G1 X117.417 Y127.949
G1 X118.822 Y129.354 E.06104
G1 X118.289 Y129.354
G1 X117.417 Y128.483 E.03786
M204 S10000
; WIPE_START
G1 F24000
G1 X118.289 Y129.354 E-.46827
G1 X118.822 Y129.354 E-.20264
G1 X118.656 Y129.188 E-.08909
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.207 J.153 P1  F30000
G1 X118.734 Y129.799 Z7.8
G1 Z7.4
G1 E.8 F1800
M204 S2000
G1 F3175
G1 X119.176 Y130.241 E.01921
G1 X119.176 Y130.774
G1 X118.2 Y129.799 E.04238
G1 X117.824 Y129.956
G1 X119.176 Y131.307 E.05871
G1 X118.815 Y131.48
G1 X117.824 Y130.489 E.04303
G1 X117.824 Y131.023
G1 X118.281 Y131.48 E.01986
M204 S10000
G1 X119.006 Y131.687 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3175
G1 X117.994 Y131.687 E.03109
G1 X117.994 Y137.006 E.16343
G1 X120.706 Y137.006 E.08332
G1 X120.706 Y135.994 E.03109
G1 X119.194 Y135.994 E.04644
G1 X119.061 Y135.939 E.00443
G1 X119.006 Y135.806 E.00443
G1 X119.006 Y131.747 E.12471
G1 X118.659 Y132.034 F30000
; LINE_WIDTH: 0.360223
G1 F3175
G1 X118.341 Y132.034 E.0082
G1 X118.341 Y135.806 E.09751
G1 X118.361 Y135.997 E.00498
; LINE_WIDTH: 0.399936
G1 X118.381 Y136.189 E.00561
; LINE_WIDTH: 0.460734
G3 X118.401 Y136.599 I-1.97 J.301 E.014
; LINE_WIDTH: 0.47936
G1 X118.665 Y136.619 E.00943
; LINE_WIDTH: 0.439648
G1 X118.93 Y136.639 E.00857
; LINE_WIDTH: 0.363842
G1 X119.194 Y136.659 E.00694
G1 X120.359 Y136.659 E.03045
G1 X120.359 Y136.341 E.0083
G1 X119.194 Y136.341 E.03045
; LINE_WIDTH: 0.360223
G1 X119.054 Y136.303 E.00376
; LINE_WIDTH: 0.399936
G1 X118.914 Y136.265 E.00423
; LINE_WIDTH: 0.439648
G1 X118.773 Y136.227 E.0047
; LINE_WIDTH: 0.47936
G1 X118.735 Y136.086 E.00517
; LINE_WIDTH: 0.439648
G1 X118.697 Y135.946 E.0047
; LINE_WIDTH: 0.361721
G1 X118.659 Y135.806 E.00378
G1 X118.659 Y132.094 E.09641
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.659 Y134.094 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/195
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
G3 Z7.8 I-1.014 J.672 P1  F30000
G1 X119.398 Y135.21 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2836
G1 X119.398 Y135.602 E.01301
G1 X120.898 Y135.602 E.04976
G1 X120.898 Y137.398 E.05957
G1 X117.602 Y137.398 E.10933
G1 X117.602 Y129.101 E.27524
G1 X119.398 Y129.101 E.05957
G1 X119.398 Y135.15 E.20067
G1 X119.79 Y135.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2836
G1 X121.29 Y135.21 E.04609
G1 X121.29 Y137.79 E.07928
G1 X117.21 Y137.79 E.12537
G1 X117.21 Y128.709 E.27905
G1 X119.79 Y128.709 E.07928
G1 X119.79 Y135.15 E.19793
M204 S10000
; WIPE_START
G1 F24000
G1 X121.29 Y135.21 E-.57046
G1 X121.29 Y135.709 E-.18954
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.142 J-.42 P1  F30000
G1 X119.006 Y129.493 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2836
G1 X117.994 Y129.493 E.03109
G1 X117.994 Y137.006 E.23086
G1 X120.506 Y137.006 E.07718
G1 X120.506 Y135.994 E.03109
G1 X119.194 Y135.994 E.0403
G1 X119.061 Y135.939 E.00443
G1 X119.006 Y135.806 E.00443
G1 X119.006 Y129.553 E.19213
G1 X118.659 Y129.84 F30000
; LINE_WIDTH: 0.360223
G1 F2836
G1 X118.341 Y129.84 E.0082
G1 X118.341 Y135.806 E.15425
G1 X118.361 Y135.997 E.00498
; LINE_WIDTH: 0.399936
G1 X118.381 Y136.189 E.00561
; LINE_WIDTH: 0.460734
G3 X118.401 Y136.599 I-1.97 J.301 E.014
; LINE_WIDTH: 0.47936
G1 X118.665 Y136.619 E.00943
; LINE_WIDTH: 0.439648
G1 X118.93 Y136.639 E.00857
; LINE_WIDTH: 0.364418
G1 X119.194 Y136.659 E.00695
G1 X120.159 Y136.659 E.02526
G1 X120.159 Y136.341 E.00831
G1 X119.194 Y136.341 E.02526
; LINE_WIDTH: 0.360223
G1 X119.054 Y136.303 E.00376
; LINE_WIDTH: 0.399936
G1 X118.914 Y136.265 E.00423
; LINE_WIDTH: 0.439648
G1 X118.773 Y136.227 E.0047
; LINE_WIDTH: 0.47936
G1 X118.735 Y136.086 E.00517
; LINE_WIDTH: 0.439648
G1 X118.697 Y135.946 E.0047
; LINE_WIDTH: 0.361178
G1 X118.659 Y135.806 E.00377
G1 X118.659 Y129.9 E.15316
; WIPE_START
G1 F24000
G1 X118.659 Y131.9 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.214 J.078 P1  F30000
G1 X119.398 Y120.398 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2836
G1 X119.398 Y126.899 E.21567
G1 X117.602 Y126.899 E.05957
G1 X117.602 Y118.602 E.27524
G1 X120.898 Y118.602 E.10933
G1 X120.898 Y120.398 E.05957
G1 X119.458 Y120.398 E.04777
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2836
G1 X119.79 Y127.291 E.19977
G1 X117.21 Y127.291 E.07928
G1 X117.21 Y118.21 E.27905
G1 X121.29 Y118.21 E.12537
G1 X121.29 Y120.79 E.07928
G1 X119.85 Y120.79 E.04425
M204 S10000
; WIPE_START
G1 F24000
G1 X119.832 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.188 J-.264 P1  F30000
G1 X119.006 Y126.507 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2836
G1 X119.006 Y120.194 E.19398
G1 X119.061 Y120.061 E.00443
G1 X119.194 Y120.006 E.00443
G1 X120.506 Y120.006 E.0403
G1 X120.506 Y118.994 E.03109
G1 X117.994 Y118.994 E.07718
G1 X117.994 Y126.507 E.23086
G1 X118.946 Y126.507 E.02924
G1 X118.659 Y126.16 F30000
; LINE_WIDTH: 0.360223
G1 F2836
G1 X118.659 Y120.194 E.15425
G1 X118.697 Y120.054 E.00376
; LINE_WIDTH: 0.399936
G1 X118.735 Y119.914 E.00423
; LINE_WIDTH: 0.439648
G1 X118.773 Y119.773 E.0047
; LINE_WIDTH: 0.47936
G1 X118.914 Y119.735 E.00517
; LINE_WIDTH: 0.439648
G1 X119.054 Y119.697 E.0047
; LINE_WIDTH: 0.362639
G1 X119.194 Y119.659 E.00379
G1 X120.159 Y119.659 E.02512
G1 X120.159 Y119.341 E.00827
G1 X119.194 Y119.341 E.02512
; LINE_WIDTH: 0.360223
G1 X119.003 Y119.361 E.00498
; LINE_WIDTH: 0.399936
G1 X118.811 Y119.381 E.00561
; LINE_WIDTH: 0.460734
G3 X118.401 Y119.401 I-.301 J-1.97 E.014
; LINE_WIDTH: 0.47936
G1 X118.381 Y119.665 E.00943
; LINE_WIDTH: 0.439648
G1 X118.361 Y119.93 E.00857
; LINE_WIDTH: 0.361847
G1 X118.341 Y120.194 E.00689
G1 X118.341 Y126.16 E.15504
G1 X118.599 Y126.16 E.00669
; WIPE_START
G1 F24000
G1 X118.341 Y126.16 E-.09778
G1 X118.341 Y124.417 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.216 J1.198 P1  F30000
G1 X140.602 Y120.398 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2836
G1 X139.102 Y120.398 E.04976
G1 X139.102 Y118.602 E.05957
G1 X142.398 Y118.602 E.10933
G1 X142.398 Y126.899 E.27524
G1 X140.602 Y126.899 E.05957
G1 X140.602 Y120.458 E.21368
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2836
G1 X138.71 Y120.79 E.04609
G1 X138.71 Y118.21 E.07928
G1 X142.79 Y118.21 E.12537
G1 X142.79 Y127.291 E.27905
G1 X140.21 Y127.291 E.07928
G1 X140.21 Y120.85 E.19793
M204 S10000
; WIPE_START
G1 F24000
G1 X138.71 Y120.79 E-.57046
G1 X138.71 Y120.291 E-.18954
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.142 J.42 P1  F30000
G1 X140.994 Y126.507 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2836
G1 X142.006 Y126.507 E.03109
G1 X142.006 Y118.994 E.23086
G1 X139.494 Y118.994 E.07718
G1 X139.494 Y120.006 E.03109
G1 X140.806 Y120.006 E.0403
G1 X140.939 Y120.061 E.00443
G1 X140.994 Y120.194 E.00443
G1 X140.994 Y126.447 E.19214
G1 X141.341 Y126.16 F30000
; LINE_WIDTH: 0.360223
G1 F2836
G1 X141.659 Y126.16 E.0082
G1 X141.659 Y120.194 E.15425
G1 X141.639 Y120.003 E.00498
; LINE_WIDTH: 0.399936
G1 X141.619 Y119.811 E.00561
; LINE_WIDTH: 0.460734
G3 X141.599 Y119.401 I1.97 J-.301 E.014
; LINE_WIDTH: 0.47936
G1 X141.335 Y119.381 E.00943
; LINE_WIDTH: 0.439648
G1 X141.07 Y119.361 E.00857
; LINE_WIDTH: 0.364418
G1 X140.806 Y119.341 E.00695
G1 X139.841 Y119.341 E.02526
G1 X139.841 Y119.659 E.00831
G1 X140.806 Y119.659 E.02526
; LINE_WIDTH: 0.360223
G1 X140.946 Y119.697 E.00376
; LINE_WIDTH: 0.399936
G1 X141.086 Y119.735 E.00423
; LINE_WIDTH: 0.439648
G1 X141.227 Y119.773 E.0047
; LINE_WIDTH: 0.47936
G1 X141.265 Y119.914 E.00517
; LINE_WIDTH: 0.439648
G1 X141.303 Y120.054 E.0047
; LINE_WIDTH: 0.361178
G1 X141.341 Y120.194 E.00377
G1 X141.341 Y126.1 E.15316
; WIPE_START
G1 F24000
G1 X141.341 Y124.1 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.214 J-.078 P1  F30000
G1 X140.602 Y135.602 Z8
M73 P33 R24
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2836
G1 X140.602 Y129.101 E.21566
G1 X142.398 Y129.101 E.05957
G1 X142.398 Y137.398 E.27524
G1 X139.102 Y137.398 E.10933
G1 X139.102 Y135.602 E.05957
G1 X140.542 Y135.602 E.04777
G1 X140.21 Y135.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2836
G1 X140.21 Y128.709 E.19977
G1 X142.79 Y128.709 E.07928
G1 X142.79 Y137.79 E.27905
G1 X138.71 Y137.79 E.12537
G1 X138.71 Y135.21 E.07928
G1 X140.15 Y135.21 E.04425
M204 S10000
; WIPE_START
G1 F24000
G1 X140.168 Y133.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.188 J.264 P1  F30000
G1 X140.994 Y129.493 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2836
G1 X140.994 Y135.806 E.19398
G1 X140.939 Y135.939 E.00443
G1 X140.806 Y135.994 E.00443
G1 X139.494 Y135.994 E.0403
G1 X139.494 Y137.006 E.03109
G1 X142.006 Y137.006 E.07718
G1 X142.006 Y129.493 E.23086
G1 X141.054 Y129.493 E.02924
G1 X141.341 Y129.84 F30000
; LINE_WIDTH: 0.360223
G1 F2836
G1 X141.341 Y135.806 E.15425
G1 X141.303 Y135.946 E.00376
; LINE_WIDTH: 0.399936
G1 X141.265 Y136.086 E.00423
; LINE_WIDTH: 0.439648
G1 X141.227 Y136.227 E.0047
; LINE_WIDTH: 0.47936
G1 X141.086 Y136.265 E.00517
; LINE_WIDTH: 0.439648
G1 X140.946 Y136.303 E.0047
; LINE_WIDTH: 0.362639
G1 X140.806 Y136.341 E.00379
G1 X139.841 Y136.341 E.02512
G1 X139.841 Y136.659 E.00827
G1 X140.806 Y136.659 E.02512
; LINE_WIDTH: 0.360223
G1 X140.997 Y136.639 E.00498
; LINE_WIDTH: 0.399936
G1 X141.189 Y136.619 E.00561
; LINE_WIDTH: 0.460734
G3 X141.599 Y136.599 I.301 J1.97 E.014
; LINE_WIDTH: 0.47936
G1 X141.618 Y136.375 E.008
; LINE_WIDTH: 0.441402
G1 X141.637 Y136.151 E.00731
; LINE_WIDTH: 0.361801
G2 X141.659 Y135.806 I-2.738 J-.345 E.00899
G1 X141.659 Y129.84 E.15502
G1 X141.401 Y129.84 E.00669
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y129.84 E-.09778
G1 X141.659 Y131.583 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/195
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
G3 Z8 I-.196 J-1.201 P1  F30000
G1 X119.398 Y135.21 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2643
G1 X119.398 Y135.602 E.01301
G1 X120.698 Y135.602 E.04312
G1 X120.698 Y137.398 E.05957
G1 X117.602 Y137.398 E.10269
G1 X117.602 Y129.701 E.25531
G1 X119.398 Y129.701 E.05957
G1 X119.398 Y135.15 E.18074
G1 X119.79 Y135.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2643
G1 X121.09 Y135.21 E.03995
G1 X121.09 Y137.79 E.07928
G1 X117.21 Y137.79 E.11922
G1 X117.21 Y129.309 E.26059
G1 X119.79 Y129.309 E.07928
G1 X119.79 Y135.15 E.17947
M204 S10000
; WIPE_START
G1 F24000
G1 X121.09 Y135.21 E-.49453
G1 X121.09 Y135.909 E-.26547
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.146 J-.411 P1  F30000
G1 X119.006 Y130.094 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2643
G1 X117.994 Y130.094 E.03109
G1 X117.994 Y137.006 E.2124
G1 X120.306 Y137.006 E.07103
G1 X120.306 Y135.994 E.03109
G1 X119.194 Y135.994 E.03415
G1 X119.061 Y135.939 E.00443
G1 X119.006 Y135.806 E.00443
G1 X119.006 Y130.154 E.17367
G1 X118.659 Y130.441 F30000
; LINE_WIDTH: 0.360223
G1 F2643
G1 X118.341 Y130.441 E.0082
G1 X118.341 Y135.806 E.13872
G1 X118.361 Y135.997 E.00498
; LINE_WIDTH: 0.399936
G1 X118.381 Y136.189 E.00561
; LINE_WIDTH: 0.460734
G3 X118.401 Y136.599 I-1.97 J.301 E.014
; LINE_WIDTH: 0.47936
G1 X118.665 Y136.619 E.00943
; LINE_WIDTH: 0.439648
G1 X118.93 Y136.639 E.00857
; LINE_WIDTH: 0.365213
G2 X119.959 Y136.659 I.647 J-6.841 E.02705
G1 X119.959 Y136.341 E.00833
G1 X119.194 Y136.341 E.02007
; LINE_WIDTH: 0.360223
G1 X119.054 Y136.303 E.00376
; LINE_WIDTH: 0.399936
G1 X118.914 Y136.265 E.00423
; LINE_WIDTH: 0.439648
G1 X118.773 Y136.227 E.0047
; LINE_WIDTH: 0.47936
G1 X118.735 Y136.086 E.00517
; LINE_WIDTH: 0.439648
G1 X118.697 Y135.946 E.0047
; LINE_WIDTH: 0.361283
G1 X118.659 Y135.806 E.00377
G1 X118.659 Y130.501 E.13762
; WIPE_START
G1 F24000
G1 X118.659 Y132.501 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.215 J.074 P1  F30000
G1 X119.398 Y120.398 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2643
G1 X119.398 Y126.299 E.19574
G1 X117.602 Y126.299 E.05957
G1 X117.602 Y118.602 E.25531
G1 X120.698 Y118.602 E.10269
G1 X120.698 Y120.398 E.05957
G1 X119.458 Y120.398 E.04113
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2643
G1 X119.79 Y126.691 E.18131
G1 X117.21 Y126.691 E.07928
G1 X117.21 Y118.21 E.26059
G1 X121.09 Y118.21 E.11922
G1 X121.09 Y120.79 E.07928
G1 X119.85 Y120.79 E.0381
M204 S10000
; WIPE_START
G1 F24000
G1 X119.83 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.177 J-.311 P1  F30000
G1 X119.006 Y125.907 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2643
G1 X119.006 Y120.194 E.17552
G1 X119.061 Y120.061 E.00443
G1 X119.194 Y120.006 E.00443
G1 X120.306 Y120.006 E.03415
G1 X120.306 Y118.994 E.03109
G1 X117.994 Y118.994 E.07103
G1 X117.994 Y125.907 E.2124
G1 X118.946 Y125.907 E.02924
G1 X118.659 Y125.559 F30000
; LINE_WIDTH: 0.360223
G1 F2643
G1 X118.659 Y120.194 E.13872
G1 X118.697 Y120.054 E.00376
; LINE_WIDTH: 0.399936
G1 X118.735 Y119.914 E.00423
; LINE_WIDTH: 0.439648
G1 X118.773 Y119.773 E.0047
; LINE_WIDTH: 0.47936
G1 X118.914 Y119.735 E.00517
; LINE_WIDTH: 0.439648
G1 X119.054 Y119.697 E.0047
; LINE_WIDTH: 0.363124
G1 X119.194 Y119.659 E.00379
G1 X119.959 Y119.659 E.01994
G1 X119.959 Y119.341 E.00828
G1 X119.194 Y119.341 E.01994
; LINE_WIDTH: 0.360223
G1 X119.003 Y119.361 E.00498
; LINE_WIDTH: 0.399936
G1 X118.811 Y119.381 E.00561
; LINE_WIDTH: 0.460734
G3 X118.401 Y119.401 I-.301 J-1.97 E.014
; LINE_WIDTH: 0.47936
G1 X118.381 Y119.665 E.00943
; LINE_WIDTH: 0.439648
G1 X118.361 Y119.93 E.00857
; LINE_WIDTH: 0.362012
G1 X118.341 Y120.194 E.0069
G1 X118.341 Y125.559 E.1395
G1 X118.599 Y125.559 E.00669
; WIPE_START
G1 F24000
G1 X118.341 Y125.559 E-.09778
G1 X118.341 Y123.817 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.185 J1.203 P1  F30000
G1 X140.602 Y120.398 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2643
G1 X139.302 Y120.398 E.04312
G1 X139.302 Y118.602 E.05957
G1 X142.398 Y118.602 E.10269
G1 X142.398 Y126.299 E.25531
G1 X140.602 Y126.299 E.05957
G1 X140.602 Y120.458 E.19375
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2643
G1 X138.91 Y120.79 E.03995
G1 X138.91 Y118.21 E.07928
G1 X142.79 Y118.21 E.11922
G1 X142.79 Y126.691 E.26059
G1 X140.21 Y126.691 E.07928
G1 X140.21 Y120.85 E.17947
M204 S10000
; WIPE_START
G1 F24000
G1 X138.91 Y120.79 E-.49453
G1 X138.91 Y120.091 E-.26547
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.146 J.411 P1  F30000
G1 X140.994 Y125.907 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2643
G1 X142.006 Y125.907 E.03109
G1 X142.006 Y118.994 E.2124
G1 X139.694 Y118.994 E.07103
G1 X139.694 Y120.006 E.03109
G1 X140.806 Y120.006 E.03415
G1 X140.939 Y120.061 E.00443
G1 X140.994 Y120.194 E.00443
G1 X140.994 Y125.847 E.17367
G1 X141.341 Y125.559 F30000
; LINE_WIDTH: 0.360223
G1 F2643
G1 X141.659 Y125.559 E.0082
G1 X141.659 Y120.194 E.13872
G1 X141.639 Y120.003 E.00498
; LINE_WIDTH: 0.399936
G1 X141.619 Y119.811 E.00561
; LINE_WIDTH: 0.460734
G3 X141.599 Y119.401 I1.97 J-.301 E.014
; LINE_WIDTH: 0.47936
G1 X141.335 Y119.381 E.00943
; LINE_WIDTH: 0.439648
G1 X141.07 Y119.361 E.00857
; LINE_WIDTH: 0.365213
G2 X140.041 Y119.341 I-.647 J6.841 E.02705
G1 X140.041 Y119.659 E.00833
G1 X140.806 Y119.659 E.02007
; LINE_WIDTH: 0.360223
G1 X140.946 Y119.697 E.00376
; LINE_WIDTH: 0.399936
G1 X141.086 Y119.735 E.00423
; LINE_WIDTH: 0.439648
G1 X141.227 Y119.773 E.0047
; LINE_WIDTH: 0.47936
G1 X141.265 Y119.914 E.00517
; LINE_WIDTH: 0.439648
G1 X141.303 Y120.054 E.0047
; LINE_WIDTH: 0.361283
G1 X141.341 Y120.194 E.00377
G1 X141.341 Y125.499 E.13762
; WIPE_START
G1 F24000
G1 X141.341 Y123.499 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.215 J-.074 P1  F30000
G1 X140.602 Y135.602 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2643
G1 X140.602 Y129.701 E.19574
G1 X142.398 Y129.701 E.05957
G1 X142.398 Y137.398 E.25531
G1 X139.302 Y137.398 E.10269
G1 X139.302 Y135.602 E.05957
G1 X140.542 Y135.602 E.04113
G1 X140.21 Y135.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2643
G1 X140.21 Y129.309 E.18131
G1 X142.79 Y129.309 E.07928
G1 X142.79 Y137.79 E.26059
G1 X138.91 Y137.79 E.11922
G1 X138.91 Y135.21 E.07928
G1 X140.15 Y135.21 E.0381
M204 S10000
; WIPE_START
G1 F24000
G1 X140.17 Y133.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.177 J.311 P1  F30000
G1 X140.994 Y130.094 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2643
G1 X140.994 Y135.806 E.17552
G1 X140.939 Y135.939 E.00443
G1 X140.806 Y135.994 E.00443
G1 X139.694 Y135.994 E.03415
G1 X139.694 Y137.006 E.03109
G1 X142.006 Y137.006 E.07103
G1 X142.006 Y130.094 E.2124
G1 X141.054 Y130.094 E.02924
G1 X141.341 Y130.441 F30000
; LINE_WIDTH: 0.360223
G1 F2643
G1 X141.341 Y135.806 E.13872
G1 X141.303 Y135.946 E.00376
; LINE_WIDTH: 0.399936
G1 X141.265 Y136.086 E.00423
; LINE_WIDTH: 0.439648
G1 X141.227 Y136.227 E.0047
; LINE_WIDTH: 0.47936
G1 X141.086 Y136.265 E.00517
; LINE_WIDTH: 0.439648
G1 X140.946 Y136.303 E.0047
; LINE_WIDTH: 0.363124
G1 X140.806 Y136.341 E.00379
G1 X140.041 Y136.341 E.01994
G1 X140.041 Y136.659 E.00828
G1 X140.806 Y136.659 E.01994
; LINE_WIDTH: 0.360223
G1 X140.997 Y136.639 E.00498
; LINE_WIDTH: 0.399936
G1 X141.189 Y136.619 E.00561
; LINE_WIDTH: 0.460734
G3 X141.599 Y136.599 I.301 J1.97 E.014
; LINE_WIDTH: 0.47936
G1 X141.618 Y136.375 E.008
; LINE_WIDTH: 0.441402
G1 X141.637 Y136.151 E.00731
; LINE_WIDTH: 0.361959
G2 X141.659 Y135.806 I-2.738 J-.345 E.00899
G1 X141.659 Y130.441 E.13948
G1 X141.401 Y130.441 E.00669
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y130.441 E-.09778
G1 X141.659 Y132.183 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/195
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
G3 Z8.2 I-.164 J-1.206 P1  F30000
G1 X119.398 Y135.21 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2501
G1 X119.398 Y135.602 E.01301
G1 X120.498 Y135.602 E.03649
G1 X120.498 Y137.398 E.05957
G1 X117.602 Y137.398 E.09606
G1 X117.602 Y130.047 E.24384
G1 X119.398 Y130.047 E.05957
G1 X119.398 Y135.15 E.16927
G1 X119.79 Y135.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2501
G1 X120.89 Y135.21 E.0338
G1 X120.89 Y137.79 E.07928
G1 X117.21 Y137.79 E.11308
G1 X117.21 Y129.655 E.24996
G1 X119.79 Y129.655 E.07928
G1 X119.79 Y135.15 E.16884
M204 S10000
; WIPE_START
G1 F24000
G1 X120.89 Y135.21 E-.41862
G1 X120.89 Y136.108 E-.34138
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.155 J-.384 P1  F30000
G1 X119.006 Y130.439 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2501
G1 X117.994 Y130.439 E.03109
G1 X117.994 Y137.006 E.20177
G1 X120.106 Y137.006 E.06489
G1 X120.106 Y135.994 E.03109
G1 X119.194 Y135.994 E.02801
G1 X119.061 Y135.939 E.00443
G1 X119.006 Y135.806 E.00443
G1 X119.006 Y130.499 E.16305
G1 X118.659 Y130.787 F30000
; LINE_WIDTH: 0.360223
G1 F2501
G1 X118.341 Y130.787 E.0082
G1 X118.341 Y135.806 E.12977
G1 X118.361 Y135.997 E.00498
; LINE_WIDTH: 0.399936
G1 X118.381 Y136.189 E.00561
; LINE_WIDTH: 0.460734
G3 X118.401 Y136.599 I-1.97 J.301 E.014
; LINE_WIDTH: 0.47936
G1 X118.665 Y136.619 E.00943
; LINE_WIDTH: 0.439648
G1 X118.93 Y136.639 E.00857
; LINE_WIDTH: 0.366379
G2 X119.759 Y136.659 I.547 J-5.509 E.02187
G1 X119.759 Y136.341 E.00836
G1 X119.194 Y136.341 E.01487
; LINE_WIDTH: 0.360223
G1 X119.054 Y136.303 E.00376
; LINE_WIDTH: 0.399936
G1 X118.914 Y136.265 E.00423
; LINE_WIDTH: 0.439648
G1 X118.773 Y136.227 E.0047
; LINE_WIDTH: 0.47936
G1 X118.735 Y136.086 E.00517
; LINE_WIDTH: 0.439648
G1 X118.697 Y135.946 E.0047
; LINE_WIDTH: 0.361355
G1 X118.659 Y135.806 E.00377
G1 X118.659 Y130.847 E.12868
; WIPE_START
G1 F24000
G1 X118.659 Y132.847 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.215 J.072 P1  F30000
G1 X119.398 Y120.398 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2501
G1 X119.398 Y125.953 E.18426
G1 X117.602 Y125.953 E.05957
G1 X117.602 Y118.602 E.24383
G1 X120.498 Y118.602 E.09606
G1 X120.498 Y120.398 E.05957
G1 X119.458 Y120.398 E.0345
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2501
G1 X119.79 Y126.345 E.17068
G1 X117.21 Y126.345 E.07928
G1 X117.21 Y118.21 E.24996
G1 X120.89 Y118.21 E.11308
G1 X120.89 Y120.79 E.07928
G1 X119.85 Y120.79 E.03196
M204 S10000
; WIPE_START
G1 F24000
G1 X119.828 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.167 J-.346 P1  F30000
G1 X119.006 Y125.561 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2501
G1 X119.006 Y120.194 E.16489
G1 X119.061 Y120.061 E.00443
G1 X119.194 Y120.006 E.00443
G1 X120.106 Y120.006 E.02801
G1 X120.106 Y118.994 E.03109
G1 X117.994 Y118.994 E.06489
G1 X117.994 Y125.561 E.20177
G1 X118.946 Y125.561 E.02924
G1 X118.659 Y125.213 F30000
; LINE_WIDTH: 0.360223
G1 F2501
G1 X118.659 Y120.194 E.12977
G1 X118.697 Y120.054 E.00376
; LINE_WIDTH: 0.399936
G1 X118.735 Y119.914 E.00423
; LINE_WIDTH: 0.439648
G1 X118.773 Y119.773 E.0047
; LINE_WIDTH: 0.47936
G1 X118.914 Y119.735 E.00517
; LINE_WIDTH: 0.439648
G1 X119.054 Y119.697 E.0047
; LINE_WIDTH: 0.363853
G1 X119.194 Y119.659 E.0038
G1 X119.759 Y119.659 E.01476
G1 X119.759 Y119.341 E.0083
G1 X119.194 Y119.341 E.01476
; LINE_WIDTH: 0.360223
G1 X119.003 Y119.361 E.00498
; LINE_WIDTH: 0.399936
G1 X118.811 Y119.381 E.00561
; LINE_WIDTH: 0.460734
G3 X118.401 Y119.401 I-.301 J-1.97 E.014
; LINE_WIDTH: 0.47936
G1 X118.381 Y119.665 E.00943
; LINE_WIDTH: 0.439648
G1 X118.361 Y119.93 E.00857
; LINE_WIDTH: 0.362124
G1 X118.341 Y120.194 E.0069
G1 X118.341 Y125.213 E.13055
G1 X118.599 Y125.213 E.00669
; WIPE_START
G1 F24000
G1 X118.341 Y125.213 E-.09778
G1 X118.341 Y123.471 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.166 J1.206 P1  F30000
G1 X140.602 Y120.398 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2501
G1 X139.502 Y120.398 E.03649
G1 X139.502 Y118.602 E.05957
G1 X142.398 Y118.602 E.09606
G1 X142.398 Y125.953 E.24383
G1 X140.602 Y125.953 E.05957
G1 X140.602 Y120.458 E.18227
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2501
G1 X139.11 Y120.79 E.0338
G1 X139.11 Y118.21 E.07928
G1 X142.79 Y118.21 E.11308
G1 X142.79 Y126.345 E.24996
G1 X140.21 Y126.345 E.07928
G1 X140.21 Y120.85 E.16884
M204 S10000
; WIPE_START
G1 F24000
G1 X139.11 Y120.79 E-.41862
G1 X139.11 Y119.892 E-.34138
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.155 J.384 P1  F30000
G1 X140.994 Y125.561 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2501
G1 X142.006 Y125.561 E.03109
G1 X142.006 Y118.994 E.20177
G1 X139.894 Y118.994 E.06489
G1 X139.894 Y120.006 E.03109
G1 X140.806 Y120.006 E.02801
G1 X140.939 Y120.061 E.00443
G1 X140.994 Y120.194 E.00443
G1 X140.994 Y125.501 E.16305
G1 X141.341 Y125.213 F30000
; LINE_WIDTH: 0.360223
G1 F2501
G1 X141.659 Y125.213 E.0082
G1 X141.659 Y120.194 E.12977
G1 X141.639 Y120.003 E.00498
; LINE_WIDTH: 0.399936
G1 X141.619 Y119.811 E.00561
; LINE_WIDTH: 0.460734
G3 X141.599 Y119.401 I1.97 J-.301 E.014
; LINE_WIDTH: 0.47936
G1 X141.335 Y119.381 E.00943
; LINE_WIDTH: 0.439648
G1 X141.07 Y119.361 E.00857
; LINE_WIDTH: 0.366379
G2 X140.241 Y119.341 I-.547 J5.509 E.02187
G1 X140.241 Y119.659 E.00836
G1 X140.806 Y119.659 E.01487
; LINE_WIDTH: 0.360223
G1 X140.946 Y119.697 E.00376
; LINE_WIDTH: 0.399936
G1 X141.086 Y119.735 E.00423
; LINE_WIDTH: 0.439648
G1 X141.227 Y119.773 E.0047
; LINE_WIDTH: 0.47936
G1 X141.265 Y119.914 E.00517
; LINE_WIDTH: 0.439648
G1 X141.303 Y120.054 E.0047
; LINE_WIDTH: 0.361355
G1 X141.341 Y120.194 E.00377
G1 X141.341 Y125.153 E.12868
; WIPE_START
G1 F24000
G1 X141.341 Y123.153 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.215 J-.072 P1  F30000
G1 X140.602 Y135.602 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2501
G1 X140.602 Y130.047 E.18426
G1 X142.398 Y130.047 E.05957
G1 X142.398 Y137.398 E.24384
G1 X139.502 Y137.398 E.09606
G1 X139.502 Y135.602 E.05957
G1 X140.542 Y135.602 E.0345
G1 X140.21 Y135.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2501
G1 X140.21 Y129.655 E.17068
G1 X142.79 Y129.655 E.07928
G1 X142.79 Y137.79 E.24996
G1 X139.11 Y137.79 E.11308
G1 X139.11 Y135.21 E.07928
G1 X140.15 Y135.21 E.03196
M204 S10000
; WIPE_START
G1 F24000
G1 X140.172 Y133.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.167 J.346 P1  F30000
G1 X140.994 Y130.439 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2501
G1 X140.994 Y135.806 E.16489
G1 X140.939 Y135.939 E.00443
G1 X140.806 Y135.994 E.00443
G1 X139.894 Y135.994 E.02801
G1 X139.894 Y137.006 E.03109
G1 X142.006 Y137.006 E.06489
G1 X142.006 Y130.439 E.20177
G1 X141.054 Y130.439 E.02924
G1 X141.341 Y130.787 F30000
; LINE_WIDTH: 0.360223
G1 F2501
G1 X141.341 Y135.806 E.12977
G1 X141.303 Y135.946 E.00376
; LINE_WIDTH: 0.399936
G1 X141.265 Y136.086 E.00423
; LINE_WIDTH: 0.439648
G1 X141.227 Y136.227 E.0047
; LINE_WIDTH: 0.47936
G1 X141.086 Y136.265 E.00517
; LINE_WIDTH: 0.439648
G1 X140.946 Y136.303 E.0047
; LINE_WIDTH: 0.363853
G1 X140.806 Y136.341 E.0038
G1 X140.241 Y136.341 E.01476
G1 X140.241 Y136.659 E.0083
G1 X140.806 Y136.659 E.01476
; LINE_WIDTH: 0.360223
G1 X140.997 Y136.639 E.00498
; LINE_WIDTH: 0.399936
G1 X141.189 Y136.619 E.00561
; LINE_WIDTH: 0.460734
G3 X141.599 Y136.599 I.301 J1.97 E.014
; LINE_WIDTH: 0.47936
G1 X141.618 Y136.375 E.008
; LINE_WIDTH: 0.441402
G1 X141.637 Y136.151 E.00731
; LINE_WIDTH: 0.362066
G2 X141.659 Y135.806 I-2.738 J-.345 E.009
G1 X141.659 Y130.787 E.13053
G1 X141.401 Y130.787 E.00669
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y130.787 E-.09778
G1 X141.659 Y132.529 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/195
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
G3 Z8.4 I-.146 J-1.208 P1  F30000
G1 X119.398 Y135.21 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2382
G1 X119.398 Y135.602 E.01301
G1 X120.298 Y135.602 E.02985
G1 X120.298 Y137.398 E.05957
M73 P34 R24
G1 X117.602 Y137.398 E.08943
G1 X117.602 Y130.302 E.23537
G1 X119.398 Y130.302 E.05957
G1 X119.398 Y135.15 E.1608
G1 X119.79 Y135.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2382
G1 X120.69 Y135.21 E.02765
G1 X120.69 Y137.79 E.07928
G1 X117.21 Y137.79 E.10693
G1 X117.21 Y129.91 E.24212
G1 X119.79 Y129.91 E.07928
G1 X119.79 Y135.15 E.161
M204 S10000
; WIPE_START
G1 F24000
G1 X120.69 Y135.21 E-.34276
G1 X120.69 Y136.308 E-.41724
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.166 J-.35 P1  F30000
G1 X119.006 Y130.694 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2382
G1 X117.994 Y130.694 E.03109
G1 X117.994 Y137.006 E.19393
G1 X119.906 Y137.006 E.05874
G1 X119.906 Y135.994 E.03109
G1 X119.194 Y135.994 E.02186
G1 X119.061 Y135.939 E.00443
G1 X119.006 Y135.806 E.00443
G1 X119.006 Y130.754 E.15521
G1 X118.659 Y131.042 F30000
; LINE_WIDTH: 0.360223
G1 F2382
G1 X118.341 Y131.042 E.0082
G1 X118.341 Y135.806 E.12318
G1 X118.361 Y135.997 E.00498
; LINE_WIDTH: 0.399936
G1 X118.381 Y136.189 E.00561
; LINE_WIDTH: 0.460734
G3 X118.401 Y136.599 I-1.97 J.301 E.014
; LINE_WIDTH: 0.47936
G1 X118.665 Y136.619 E.00943
; LINE_WIDTH: 0.439648
G1 X118.93 Y136.639 E.00857
; LINE_WIDTH: 0.368257
G2 X119.559 Y136.659 I.447 J-4.177 E.01669
G1 X119.559 Y136.341 E.00841
G1 X119.194 Y136.341 E.00966
; LINE_WIDTH: 0.360223
G1 X119.054 Y136.303 E.00376
; LINE_WIDTH: 0.399936
G1 X118.914 Y136.265 E.00423
; LINE_WIDTH: 0.439648
G1 X118.773 Y136.227 E.0047
; LINE_WIDTH: 0.47936
G1 X118.735 Y136.086 E.00517
; LINE_WIDTH: 0.439648
G1 X118.697 Y135.946 E.0047
; LINE_WIDTH: 0.361414
G1 X118.659 Y135.806 E.00377
G1 X118.659 Y131.102 E.12208
; WIPE_START
G1 F24000
G1 X118.659 Y133.102 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.215 J.071 P1  F30000
G1 X119.398 Y120.398 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2382
G1 X119.398 Y125.698 E.1758
G1 X117.602 Y125.698 E.05957
G1 X117.602 Y118.602 E.23538
G1 X120.298 Y118.602 E.08943
G1 X120.298 Y120.398 E.05957
G1 X119.458 Y120.398 E.02786
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2382
G1 X119.79 Y126.09 E.16285
G1 X117.21 Y126.09 E.07928
G1 X117.21 Y118.21 E.24212
G1 X120.69 Y118.21 E.10693
G1 X120.69 Y120.79 E.07928
G1 X119.85 Y120.79 E.02581
M204 S10000
; WIPE_START
G1 F24000
G1 X119.827 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.157 J-.378 P1  F30000
G1 X119.006 Y125.306 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2382
G1 X119.006 Y120.194 E.15705
G1 X119.061 Y120.061 E.00443
G1 X119.194 Y120.006 E.00443
G1 X119.906 Y120.006 E.02186
G1 X119.906 Y118.994 E.03109
G1 X117.994 Y118.994 E.05874
G1 X117.994 Y125.306 E.19393
G1 X118.946 Y125.306 E.02924
G1 X118.659 Y124.958 F30000
; LINE_WIDTH: 0.360223
G1 F2382
G1 X118.659 Y120.194 E.12318
G1 X118.697 Y120.054 E.00376
; LINE_WIDTH: 0.399936
G1 X118.735 Y119.914 E.00423
; LINE_WIDTH: 0.439648
G1 X118.773 Y119.773 E.0047
; LINE_WIDTH: 0.47936
G1 X118.914 Y119.735 E.00517
; LINE_WIDTH: 0.439648
G1 X119.054 Y119.697 E.0047
; LINE_WIDTH: 0.364625
G1 X119.194 Y119.659 E.00381
G1 X119.559 Y119.659 E.00955
G1 X119.559 Y119.341 E.00832
G1 X119.073 Y119.344 E.01272
; LINE_WIDTH: 0.365484
G1 X118.849 Y119.363 E.00591
; LINE_WIDTH: 0.403443
G1 X118.625 Y119.382 E.00661
; LINE_WIDTH: 0.441402
G1 X118.401 Y119.401 E.00731
; LINE_WIDTH: 0.47936
G1 X118.381 Y119.665 E.00943
; LINE_WIDTH: 0.439648
G1 X118.361 Y119.93 E.00857
; LINE_WIDTH: 0.362216
G1 X118.341 Y120.194 E.0069
G1 X118.341 Y124.958 E.12395
G1 X118.599 Y124.958 E.00669
; WIPE_START
G1 F24000
G1 X118.341 Y124.958 E-.09778
G1 X118.341 Y123.216 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.153 J1.207 P1  F30000
G1 X140.602 Y120.398 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2382
G1 X139.702 Y120.398 E.02985
G1 X139.702 Y118.602 E.05957
G1 X142.398 Y118.602 E.08943
G1 X142.398 Y125.698 E.23538
G1 X140.602 Y125.698 E.05957
G1 X140.602 Y120.458 E.17381
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2382
G1 X139.31 Y120.79 E.02765
G1 X139.31 Y118.21 E.07928
G1 X142.79 Y118.21 E.10693
G1 X142.79 Y126.09 E.24212
G1 X140.21 Y126.09 E.07928
G1 X140.21 Y120.85 E.161
M204 S10000
; WIPE_START
G1 F24000
G1 X139.31 Y120.79 E-.34276
G1 X139.31 Y119.692 E-.41724
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.166 J.35 P1  F30000
G1 X140.994 Y125.306 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2382
G1 X142.006 Y125.306 E.03109
G1 X142.006 Y118.994 E.19393
G1 X140.094 Y118.994 E.05874
G1 X140.094 Y120.006 E.03109
G1 X140.806 Y120.006 E.02186
G1 X140.939 Y120.061 E.00443
G1 X140.994 Y120.194 E.00443
G1 X140.994 Y125.246 E.15521
G1 X141.341 Y124.958 F30000
; LINE_WIDTH: 0.360223
G1 F2382
G1 X141.659 Y124.958 E.0082
G1 X141.659 Y120.194 E.12318
G1 X141.639 Y120.003 E.00498
; LINE_WIDTH: 0.399936
G1 X141.619 Y119.811 E.00561
; LINE_WIDTH: 0.460734
G3 X141.599 Y119.401 I1.97 J-.301 E.014
; LINE_WIDTH: 0.47936
G1 X141.335 Y119.381 E.00943
; LINE_WIDTH: 0.439648
G1 X141.07 Y119.361 E.00857
; LINE_WIDTH: 0.368257
G2 X140.441 Y119.341 I-.447 J4.177 E.01669
G1 X140.441 Y119.659 E.00841
G1 X140.806 Y119.659 E.00966
; LINE_WIDTH: 0.360223
G1 X140.946 Y119.697 E.00376
; LINE_WIDTH: 0.399936
G1 X141.086 Y119.735 E.00423
; LINE_WIDTH: 0.439648
G1 X141.227 Y119.773 E.0047
; LINE_WIDTH: 0.47936
G1 X141.265 Y119.914 E.00517
; LINE_WIDTH: 0.439648
G1 X141.303 Y120.054 E.0047
; LINE_WIDTH: 0.361414
G1 X141.341 Y120.194 E.00377
G1 X141.341 Y124.898 E.12209
; WIPE_START
G1 F24000
G1 X141.341 Y122.898 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.215 J-.071 P1  F30000
G1 X140.602 Y135.602 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2382
G1 X140.602 Y130.302 E.1758
G1 X142.398 Y130.302 E.05957
G1 X142.398 Y137.398 E.23537
G1 X139.702 Y137.398 E.08943
M73 P34 R23
G1 X139.702 Y135.602 E.05957
G1 X140.542 Y135.602 E.02786
G1 X140.21 Y135.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2382
G1 X140.21 Y129.91 E.16285
G1 X142.79 Y129.91 E.07928
G1 X142.79 Y137.79 E.24212
G1 X139.31 Y137.79 E.10693
G1 X139.31 Y135.21 E.07928
G1 X140.15 Y135.21 E.02581
M204 S10000
; WIPE_START
G1 F24000
G1 X140.173 Y133.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.157 J.378 P1  F30000
G1 X140.994 Y130.694 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2382
G1 X140.994 Y135.806 E.15705
G1 X140.939 Y135.939 E.00443
G1 X140.806 Y135.994 E.00443
G1 X140.094 Y135.994 E.02186
G1 X140.094 Y137.006 E.03109
G1 X142.006 Y137.006 E.05874
G1 X142.006 Y130.694 E.19393
G1 X141.054 Y130.694 E.02924
G1 X141.341 Y131.042 F30000
; LINE_WIDTH: 0.360223
G1 F2382
G1 X141.341 Y135.806 E.12318
G1 X141.303 Y135.946 E.00376
; LINE_WIDTH: 0.399936
G1 X141.265 Y136.086 E.00423
; LINE_WIDTH: 0.439648
G1 X141.227 Y136.227 E.0047
; LINE_WIDTH: 0.47936
G1 X141.086 Y136.265 E.00517
; LINE_WIDTH: 0.439648
G1 X140.946 Y136.303 E.0047
; LINE_WIDTH: 0.364625
G1 X140.806 Y136.341 E.00381
G1 X140.441 Y136.341 E.00955
G1 X140.441 Y136.659 E.00832
G1 X140.927 Y136.656 E.01272
; LINE_WIDTH: 0.365484
G1 X141.151 Y136.637 E.00591
; LINE_WIDTH: 0.403443
G1 X141.375 Y136.618 E.00661
; LINE_WIDTH: 0.441402
G1 X141.599 Y136.599 E.00731
; LINE_WIDTH: 0.47936
G1 X141.618 Y136.375 E.008
; LINE_WIDTH: 0.441402
G1 X141.637 Y136.151 E.00731
; LINE_WIDTH: 0.362154
G2 X141.659 Y135.806 I-2.738 J-.345 E.009
G1 X141.659 Y131.042 E.12393
G1 X141.401 Y131.042 E.00669
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.042 E-.09778
G1 X141.659 Y132.784 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/195
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
G3 Z8.6 I-.132 J-1.21 P1  F30000
G1 X119.398 Y135.21 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2278
G1 X119.398 Y135.602 E.01301
G1 X120.098 Y135.602 E.02322
G1 X120.098 Y137.398 E.05957
G1 X117.602 Y137.398 E.08279
G1 X117.602 Y130.502 E.22876
G1 X119.398 Y130.502 E.05957
G1 X119.398 Y135.15 E.15419
G1 X119.79 Y135.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2278
G1 X120.49 Y135.21 E.02151
G1 X120.49 Y137.79 E.07928
G1 X117.21 Y137.79 E.10079
G1 X117.21 Y130.11 E.23599
G1 X119.79 Y130.11 E.07928
G1 X119.79 Y135.15 E.15487
M204 S10000
; WIPE_START
G1 F24000
G1 X120.49 Y135.21 E-.26698
G1 X120.49 Y136.507 E-.49302
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.177 J-.311 P1  F30000
G1 X119.006 Y130.894 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2278
G1 X117.994 Y130.894 E.03109
G1 X117.994 Y137.006 E.1878
G1 X119.706 Y137.006 E.0526
G1 X119.706 Y135.994 E.03109
G1 X119.194 Y135.994 E.01572
G1 X119.061 Y135.939 E.00443
G1 X119.006 Y135.806 E.00443
G1 X119.006 Y130.954 E.14908
G1 X118.659 Y131.241 F30000
; LINE_WIDTH: 0.360223
G1 F2278
G1 X118.341 Y131.241 E.0082
G1 X118.341 Y135.806 E.11802
G1 X118.361 Y135.997 E.00498
; LINE_WIDTH: 0.399936
G1 X118.381 Y136.189 E.00561
; LINE_WIDTH: 0.460734
G3 X118.401 Y136.599 I-1.97 J.301 E.014
; LINE_WIDTH: 0.47936
G1 X118.665 Y136.619 E.00943
; LINE_WIDTH: 0.439648
G1 X118.93 Y136.639 E.00857
; LINE_WIDTH: 0.371784
G2 X119.359 Y136.659 I.347 J-2.846 E.01151
G1 X119.359 Y136.341 E.0085
G1 X119.194 Y136.341 E.0044
; LINE_WIDTH: 0.360223
G1 X119.054 Y136.303 E.00376
; LINE_WIDTH: 0.399936
G1 X118.914 Y136.265 E.00423
; LINE_WIDTH: 0.439648
G1 X118.773 Y136.227 E.0047
; LINE_WIDTH: 0.47936
G1 X118.735 Y136.086 E.00517
; LINE_WIDTH: 0.439648
G1 X118.697 Y135.946 E.0047
; LINE_WIDTH: 0.361465
G1 X118.659 Y135.806 E.00378
G1 X118.659 Y131.301 E.11693
; WIPE_START
G1 F24000
G1 X118.659 Y133.301 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.215 J.07 P1  F30000
G1 X119.398 Y120.398 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2278
G1 X119.398 Y125.498 E.16919
G1 X117.602 Y125.498 E.05957
G1 X117.602 Y118.602 E.22876
G1 X120.098 Y118.602 E.08279
G1 X120.098 Y120.398 E.05957
G1 X119.458 Y120.398 E.02123
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2278
G1 X119.79 Y125.89 E.15672
G1 X117.21 Y125.89 E.07928
G1 X117.21 Y118.21 E.23599
G1 X120.49 Y118.21 E.10079
G1 X120.49 Y120.79 E.07928
G1 X119.85 Y120.79 E.01967
M204 S10000
; WIPE_START
G1 F24000
G1 X119.826 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.147 J-.406 P1  F30000
G1 X119.006 Y125.106 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2278
G1 X119.006 Y120.194 E.15092
G1 X119.061 Y120.061 E.00443
G1 X119.2 Y120.006 E.00459
G1 X119.706 Y120.006 E.01554
G1 X119.706 Y118.994 E.03109
G1 X117.994 Y118.994 E.0526
G1 X117.994 Y125.106 E.1878
G1 X118.946 Y125.106 E.02924
G1 X118.659 Y124.759 F30000
; LINE_WIDTH: 0.360223
G1 F2278
G1 X118.659 Y120.194 E.11802
G1 X118.697 Y120.054 E.00376
; LINE_WIDTH: 0.399936
G1 X118.735 Y119.914 E.00423
; LINE_WIDTH: 0.439648
G1 X118.773 Y119.773 E.0047
; LINE_WIDTH: 0.47936
G1 X118.916 Y119.735 E.00524
; LINE_WIDTH: 0.439648
G1 X119.058 Y119.697 E.00476
; LINE_WIDTH: 0.369606
G3 X119.359 Y119.659 I.222 J.54 E.00817
G1 X119.359 Y119.341 E.00845
; LINE_WIDTH: 0.360223
G1 X119.112 Y119.361 E.00639
; LINE_WIDTH: 0.399936
G1 X118.866 Y119.381 E.00719
; LINE_WIDTH: 0.458264
G3 X118.401 Y119.401 I-.356 J-2.875 E.01576
; LINE_WIDTH: 0.47936
G1 X118.381 Y119.665 E.00943
; LINE_WIDTH: 0.439648
G1 X118.361 Y119.93 E.00857
; LINE_WIDTH: 0.362294
G1 X118.341 Y120.194 E.0069
G1 X118.341 Y124.759 E.11879
G1 X118.599 Y124.759 E.0067
; WIPE_START
G1 F24000
G1 X118.341 Y124.759 E-.09778
G1 X118.341 Y123.016 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.142 J1.209 P1  F30000
G1 X140.602 Y120.398 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2278
G1 X139.902 Y120.398 E.02322
G1 X139.902 Y118.602 E.05957
G1 X142.398 Y118.602 E.08279
G1 X142.398 Y125.498 E.22876
G1 X140.602 Y125.498 E.05957
G1 X140.602 Y120.458 E.1672
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2278
G1 X139.51 Y120.79 E.02151
G1 X139.51 Y118.21 E.07928
G1 X142.79 Y118.21 E.10079
G1 X142.79 Y125.89 E.23599
G1 X140.21 Y125.89 E.07928
G1 X140.21 Y120.85 E.15487
M204 S10000
; WIPE_START
G1 F24000
G1 X139.51 Y120.79 E-.26698
G1 X139.51 Y119.493 E-.49302
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.177 J.311 P1  F30000
G1 X140.994 Y125.106 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2278
G1 X142.006 Y125.106 E.03109
G1 X142.006 Y118.994 E.1878
G1 X140.294 Y118.994 E.0526
G1 X140.294 Y120.006 E.03109
G1 X140.806 Y120.006 E.01572
G1 X140.939 Y120.061 E.00443
G1 X140.994 Y120.194 E.00443
G1 X140.994 Y125.046 E.14908
G1 X141.341 Y124.759 F30000
; LINE_WIDTH: 0.360223
G1 F2278
G1 X141.659 Y124.759 E.0082
G1 X141.659 Y120.194 E.11802
G1 X141.639 Y120.003 E.00498
; LINE_WIDTH: 0.399936
G1 X141.619 Y119.811 E.00561
; LINE_WIDTH: 0.460734
G3 X141.599 Y119.401 I1.97 J-.301 E.014
; LINE_WIDTH: 0.47936
G1 X141.335 Y119.381 E.00943
; LINE_WIDTH: 0.439648
G1 X141.07 Y119.361 E.00857
; LINE_WIDTH: 0.371784
G2 X140.641 Y119.341 I-.347 J2.846 E.01151
G1 X140.641 Y119.659 E.0085
G1 X140.806 Y119.659 E.0044
; LINE_WIDTH: 0.360223
G1 X140.946 Y119.697 E.00376
; LINE_WIDTH: 0.399936
G1 X141.086 Y119.735 E.00423
; LINE_WIDTH: 0.439648
G1 X141.227 Y119.773 E.0047
; LINE_WIDTH: 0.47936
G1 X141.265 Y119.914 E.00517
; LINE_WIDTH: 0.439648
G1 X141.303 Y120.054 E.0047
; LINE_WIDTH: 0.361465
G1 X141.341 Y120.194 E.00378
G1 X141.341 Y124.699 E.11693
; WIPE_START
G1 F24000
G1 X141.341 Y122.699 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.215 J-.07 P1  F30000
G1 X140.602 Y135.602 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2278
G1 X140.602 Y130.502 E.16919
G1 X142.398 Y130.502 E.05957
G1 X142.398 Y137.398 E.22876
G1 X139.902 Y137.398 E.08279
G1 X139.902 Y135.602 E.05957
G1 X140.542 Y135.602 E.02123
G1 X140.21 Y135.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2278
G1 X140.21 Y130.11 E.15672
G1 X142.79 Y130.11 E.07928
G1 X142.79 Y137.79 E.23599
G1 X139.51 Y137.79 E.10079
G1 X139.51 Y135.21 E.07928
G1 X140.15 Y135.21 E.01967
M204 S10000
; WIPE_START
G1 F24000
G1 X140.174 Y133.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.147 J.406 P1  F30000
G1 X140.994 Y130.894 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2278
G1 X140.994 Y135.806 E.15092
G1 X140.939 Y135.939 E.00443
G1 X140.8 Y135.994 E.00459
G1 X140.294 Y135.994 E.01554
G1 X140.294 Y137.006 E.03109
G1 X142.006 Y137.006 E.0526
G1 X142.006 Y130.894 E.1878
G1 X141.054 Y130.894 E.02924
G1 X141.341 Y131.241 F30000
; LINE_WIDTH: 0.360223
G1 F2278
G1 X141.341 Y135.806 E.11802
G1 X141.303 Y135.946 E.00376
; LINE_WIDTH: 0.399936
G1 X141.265 Y136.086 E.00423
; LINE_WIDTH: 0.439648
G1 X141.227 Y136.227 E.0047
; LINE_WIDTH: 0.47936
G1 X141.084 Y136.265 E.00524
; LINE_WIDTH: 0.439648
G1 X140.942 Y136.303 E.00476
; LINE_WIDTH: 0.369606
G3 X140.641 Y136.341 I-.222 J-.54 E.00817
G1 X140.641 Y136.659 E.00845
; LINE_WIDTH: 0.360223
G1 X140.888 Y136.639 E.00639
; LINE_WIDTH: 0.399936
G1 X141.134 Y136.619 E.00719
; LINE_WIDTH: 0.458264
G3 X141.599 Y136.599 I.356 J2.875 E.01576
; LINE_WIDTH: 0.47936
G1 X141.618 Y136.375 E.008
; LINE_WIDTH: 0.441402
G1 X141.637 Y136.151 E.00731
; LINE_WIDTH: 0.362228
G2 X141.659 Y135.806 I-2.738 J-.345 E.009
G1 X141.659 Y131.241 E.11877
G1 X141.401 Y131.241 E.00669
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.241 E-.09778
G1 X141.659 Y132.984 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/195
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
G3 Z8.8 I-.121 J-1.211 P1  F30000
G1 X119.398 Y135.21 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2177
G1 X119.398 Y135.602 E.01301
G1 X119.898 Y135.602 E.01659
G1 X119.898 Y137.398 E.05957
G1 X117.602 Y137.398 E.07616
G1 X117.602 Y130.663 E.2234
G1 X119.398 Y130.663 E.05957
G1 X119.398 Y135.15 E.14883
G1 X119.79 Y135.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2177
G1 X120.29 Y135.21 E.01536
G1 X120.29 Y137.79 E.07928
G1 X117.21 Y137.79 E.09464
G1 X117.21 Y130.271 E.23103
G1 X119.79 Y130.271 E.07928
G1 X119.79 Y135.15 E.14991
M204 S10000
; WIPE_START
G1 F24000
G1 X120.29 Y135.21 E-.19136
G1 X120.29 Y136.706 E-.56864
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.187 J-.27 P1  F30000
G1 X119.006 Y131.055 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2177
G1 X117.994 Y131.055 E.03109
G1 X117.994 Y137.006 E.18284
G1 X119.506 Y137.006 E.04645
G1 X119.506 Y135.994 E.03109
G1 X119.194 Y135.994 E.00957
G1 X119.061 Y135.939 E.00443
G1 X119.006 Y135.806 E.00443
G1 X119.006 Y131.115 E.14412
G1 X118.659 Y131.403 F30000
; LINE_WIDTH: 0.360223
G1 F2177
G1 X118.341 Y131.403 E.0082
G1 X118.341 Y135.806 E.11384
G1 X118.361 Y135.997 E.00498
; LINE_WIDTH: 0.399936
G1 X118.381 Y136.189 E.00561
; LINE_WIDTH: 0.474816
G3 X118.401 Y136.599 I-1.97 J.301 E.01447
G1 X119.099 Y136.599 E.02457
G1 X119.099 Y136.386 E.00748
G1 X118.773 Y136.227 E.01277
; LINE_WIDTH: 0.47936
G1 X118.735 Y136.086 E.00517
; LINE_WIDTH: 0.439648
G1 X118.697 Y135.946 E.0047
; LINE_WIDTH: 0.36151
G1 X118.659 Y135.806 E.00378
G1 X118.659 Y131.463 E.11275
; WIPE_START
G1 F24000
G1 X118.659 Y133.463 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.215 J.069 P1  F30000
G1 X119.398 Y120.398 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2177
G1 X119.398 Y125.337 E.16383
G1 X117.602 Y125.337 E.05957
G1 X117.602 Y118.602 E.2234
G1 X119.898 Y118.602 E.07616
G1 X119.898 Y120.398 E.05957
G1 X119.458 Y120.398 E.0146
G1 X119.79 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2177
G1 X119.79 Y125.729 E.15175
G1 X117.21 Y125.729 E.07928
G1 X117.21 Y118.21 E.23103
G1 X120.29 Y118.21 E.09464
G1 X120.29 Y120.79 E.07928
G1 X119.85 Y120.79 E.01352
M204 S10000
; WIPE_START
G1 F24000
G1 X119.826 Y122.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.137 J-.433 P1  F30000
G1 X119.006 Y124.945 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2177
G1 X119.006 Y120.194 E.14596
M73 P35 R23
G1 X119.061 Y120.061 E.00443
G1 X119.194 Y120.006 E.00443
G1 X119.506 Y120.006 E.00957
G1 X119.506 Y118.994 E.03109
G1 X117.994 Y118.994 E.04645
G1 X117.994 Y124.945 E.18284
G1 X118.946 Y124.945 E.02924
G1 X118.659 Y124.597 F30000
; LINE_WIDTH: 0.360223
G1 F2177
G1 X118.659 Y120.194 E.11385
G1 X118.697 Y120.054 E.00376
; LINE_WIDTH: 0.399936
G1 X118.735 Y119.914 E.00423
; LINE_WIDTH: 0.47529
G1 X118.773 Y119.773 E.00512
G1 X119.099 Y119.614 E.01278
G1 X119.099 Y119.401 E.00749
G1 X118.401 Y119.401 E.0246
; LINE_WIDTH: 0.47936
G1 X118.381 Y119.665 E.00943
; LINE_WIDTH: 0.439648
G1 X118.361 Y119.93 E.00857
; LINE_WIDTH: 0.362362
G1 X118.341 Y120.194 E.0069
G1 X118.341 Y124.597 E.11461
G1 X118.599 Y124.597 E.0067
; WIPE_START
G1 F24000
G1 X118.341 Y124.597 E-.09778
G1 X118.341 Y122.855 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.133 J1.21 P1  F30000
G1 X140.602 Y120.398 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2177
G1 X140.102 Y120.398 E.01659
G1 X140.102 Y118.602 E.05957
G1 X142.398 Y118.602 E.07616
G1 X142.398 Y125.337 E.2234
G1 X140.602 Y125.337 E.05957
G1 X140.602 Y120.458 E.16184
G1 X140.21 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2177
G1 X139.71 Y120.79 E.01536
G1 X139.71 Y118.21 E.07928
G1 X142.79 Y118.21 E.09464
G1 X142.79 Y125.729 E.23103
G1 X140.21 Y125.729 E.07928
G1 X140.21 Y120.85 E.14991
M204 S10000
; WIPE_START
G1 F24000
G1 X139.71 Y120.79 E-.19136
G1 X139.71 Y119.294 E-.56864
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.187 J.27 P1  F30000
G1 X140.994 Y124.945 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2177
G1 X142.006 Y124.945 E.03109
G1 X142.006 Y118.994 E.18284
G1 X140.494 Y118.994 E.04645
G1 X140.494 Y120.006 E.03109
G1 X140.861 Y120.014 E.01129
G1 X140.939 Y120.061 E.00278
G1 X140.994 Y120.194 E.00443
G1 X140.994 Y124.885 E.14412
G1 X141.341 Y124.597 F30000
; LINE_WIDTH: 0.360223
G1 F2177
G1 X141.659 Y124.597 E.0082
G1 X141.659 Y120.194 E.11385
G1 X141.639 Y120.003 E.00498
; LINE_WIDTH: 0.399936
G1 X141.619 Y119.811 E.00561
; LINE_WIDTH: 0.474816
G3 X141.599 Y119.401 I1.97 J-.301 E.01447
G1 X140.901 Y119.401 E.02457
G1 X140.901 Y119.614 E.00748
G1 X141.227 Y119.773 E.01277
; LINE_WIDTH: 0.47936
G1 X141.265 Y119.914 E.00517
; LINE_WIDTH: 0.439648
G1 X141.303 Y120.054 E.0047
; LINE_WIDTH: 0.36151
G1 X141.341 Y120.194 E.00378
G1 X141.341 Y124.537 E.11275
; WIPE_START
G1 F24000
G1 X141.341 Y122.537 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.215 J-.069 P1  F30000
G1 X140.602 Y135.602 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2177
G1 X140.602 Y130.663 E.16383
G1 X142.398 Y130.663 E.05957
G1 X142.398 Y137.398 E.2234
G1 X140.102 Y137.398 E.07616
G1 X140.102 Y135.602 E.05957
G1 X140.542 Y135.602 E.0146
G1 X140.21 Y135.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2177
G1 X140.21 Y130.271 E.15175
G1 X142.79 Y130.271 E.07928
G1 X142.79 Y137.79 E.23103
G1 X139.71 Y137.79 E.09464
G1 X139.71 Y135.21 E.07928
G1 X140.15 Y135.21 E.01352
M204 S10000
; WIPE_START
G1 F24000
G1 X140.174 Y133.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.137 J.433 P1  F30000
G1 X140.994 Y131.055 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2177
G1 X140.994 Y135.806 E.14596
G1 X140.939 Y135.939 E.00443
G1 X140.806 Y135.994 E.00443
G1 X140.494 Y135.994 E.00957
G1 X140.494 Y137.006 E.03109
G1 X142.006 Y137.006 E.04645
G1 X142.006 Y131.055 E.18284
G1 X141.054 Y131.055 E.02924
G1 X141.341 Y131.403 F30000
; LINE_WIDTH: 0.360223
G1 F2177
G1 X141.341 Y135.806 E.11384
G1 X141.303 Y135.946 E.00376
; LINE_WIDTH: 0.399936
G1 X141.265 Y136.086 E.00423
; LINE_WIDTH: 0.47529
G1 X141.227 Y136.227 E.00512
G1 X140.901 Y136.386 E.01278
G1 X140.901 Y136.599 E.00749
G1 X141.599 Y136.599 E.0246
; LINE_WIDTH: 0.47936
G1 X141.618 Y136.375 E.008
; LINE_WIDTH: 0.441402
G1 X141.637 Y136.151 E.00731
; LINE_WIDTH: 0.362293
G2 X141.659 Y135.806 I-2.738 J-.345 E.009
G1 X141.659 Y131.403 E.11459
G1 X141.401 Y131.403 E.0067
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.403 E-.09778
G1 X141.659 Y133.145 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/195
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
G3 Z9 I.611 J-1.053 P1  F30000
G1 X119.698 Y120.398 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2088
G1 X119.398 Y120.398 E.00995
G1 X119.398 Y125.205 E.15946
G1 X117.602 Y125.205 E.05957
G1 X117.602 Y118.602 E.21903
G1 X119.698 Y118.602 E.06952
G1 X119.698 Y120.338 E.05758
G1 X120.09 Y120.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2088
G1 X119.79 Y120.79 E.00922
G1 X119.79 Y125.597 E.1477
G1 X117.21 Y125.597 E.07928
G1 X117.21 Y118.21 E.22698
G1 X120.09 Y118.21 E.08849
G1 X120.09 Y120.73 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y120.79 E-.11626
G1 X119.79 Y122.484 E-.64374
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.153 J-.388 P1  F30000
G1 X119.006 Y124.813 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2088
G1 X119.006 Y120.194 E.14191
G1 X119.079 Y120.045 E.00509
G1 X119.306 Y120.006 E.00708
G1 X119.306 Y118.994 E.03109
G1 X117.994 Y118.994 E.0403
G1 X117.994 Y124.813 E.17879
G1 X118.946 Y124.813 E.02924
G1 X118.659 Y124.466 F30000
; LINE_WIDTH: 0.360223
G1 F2088
G1 X118.659 Y120.194 E.11044
G1 X118.697 Y120.054 E.00376
; LINE_WIDTH: 0.399936
G1 X118.735 Y119.914 E.00423
; LINE_WIDTH: 0.474054
G1 X118.773 Y119.773 E.00511
G1 X118.899 Y119.7 E.00511
G1 X118.899 Y119.401 E.01052
G1 X118.401 Y119.401 E.0175
; LINE_WIDTH: 0.47936
G1 X118.381 Y119.665 E.00943
; LINE_WIDTH: 0.439648
G1 X118.361 Y119.93 E.00857
; LINE_WIDTH: 0.362421
G1 X118.341 Y120.194 E.00691
G1 X118.341 Y124.466 E.1112
G1 X118.599 Y124.466 E.0067
; WIPE_START
G1 F24000
G1 X118.341 Y124.466 E-.09778
G1 X118.341 Y122.723 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.21 J.127 P1  F30000
G1 X119.698 Y135.602 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2088
G1 X119.698 Y137.398 E.05957
G1 X117.602 Y137.398 E.06952
G1 X117.602 Y130.795 E.21903
G1 X119.398 Y130.795 E.05957
G1 X119.398 Y135.602 E.15945
G1 X119.638 Y135.602 E.00796
G1 X119.79 Y135.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2088
G1 X120.09 Y135.21 E.00922
G1 X120.09 Y137.79 E.07928
G1 X117.21 Y137.79 E.08849
G1 X117.21 Y130.403 E.22698
G1 X119.79 Y130.403 E.07928
G1 X119.79 Y135.15 E.14586
M204 S10000
; WIPE_START
G1 F24000
G1 X120.09 Y135.21 E-.11626
G1 X120.09 Y136.904 E-.64374
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.196 J-.227 P1  F30000
G1 X119.006 Y131.187 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2088
G1 X117.994 Y131.187 E.03109
G1 X117.994 Y137.006 E.17879
G1 X119.306 Y137.006 E.0403
G1 X119.306 Y135.994 E.03109
G1 X119.079 Y135.955 E.00708
G1 X119.006 Y135.806 E.00509
G1 X119.006 Y131.247 E.14007
G1 X118.659 Y131.534 F30000
; LINE_WIDTH: 0.360223
G1 F2088
G1 X118.341 Y131.534 E.0082
G1 X118.341 Y135.806 E.11044
G1 X118.361 Y135.997 E.00498
; LINE_WIDTH: 0.399936
G1 X118.381 Y136.189 E.00561
; LINE_WIDTH: 0.473706
G3 X118.401 Y136.599 I-1.97 J.301 E.01443
G1 X118.899 Y136.599 E.01749
G1 X118.899 Y136.3 E.01051
G1 X118.773 Y136.227 E.0051
; LINE_WIDTH: 0.47936
G1 X118.735 Y136.086 E.00517
; LINE_WIDTH: 0.439648
G1 X118.697 Y135.946 E.0047
; LINE_WIDTH: 0.361549
G1 X118.659 Y135.806 E.00378
G1 X118.659 Y131.594 E.10934
; WIPE_START
G1 F24000
G1 X118.659 Y133.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.154 J1.207 P1  F30000
G1 X140.602 Y130.795 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2088
G1 X142.398 Y130.795 E.05957
G1 X142.398 Y137.398 E.21903
G1 X140.302 Y137.398 E.06952
G1 X140.302 Y135.602 E.05957
G1 X140.602 Y135.602 E.00995
G1 X140.602 Y130.855 E.15746
G1 X140.21 Y130.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2088
G1 X142.79 Y130.403 E.07928
G1 X142.79 Y137.79 E.22698
G1 X139.91 Y137.79 E.08849
G1 X139.91 Y135.21 E.07928
G1 X140.21 Y135.21 E.00922
G1 X140.21 Y130.463 E.14586
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.417 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.187 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2088
G1 X140.994 Y135.806 E.14191
G1 X140.921 Y135.955 E.00509
G1 X140.694 Y135.994 E.00708
G1 X140.694 Y137.006 E.03109
G1 X142.006 Y137.006 E.0403
G1 X142.006 Y131.187 E.17879
G1 X141.054 Y131.187 E.02924
G1 X141.341 Y131.534 F30000
; LINE_WIDTH: 0.360223
G1 F2088
G1 X141.341 Y135.806 E.11044
G1 X141.303 Y135.946 E.00376
; LINE_WIDTH: 0.399936
G1 X141.265 Y136.086 E.00423
; LINE_WIDTH: 0.474054
G1 X141.227 Y136.227 E.00511
G1 X141.101 Y136.3 E.00511
G1 X141.101 Y136.599 E.01052
G1 X141.599 Y136.599 E.0175
; LINE_WIDTH: 0.47936
G1 X141.618 Y136.375 E.008
; LINE_WIDTH: 0.441402
G1 X141.637 Y136.151 E.00731
; LINE_WIDTH: 0.362349
G2 X141.659 Y135.806 I-2.738 J-.345 E.00901
G1 X141.659 Y131.534 E.11118
G1 X141.401 Y131.534 E.0067
; WIPE_START
G1 F24000
G1 X141.659 Y131.534 E-.09778
G1 X141.659 Y133.277 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.207 J-.158 P1  F30000
G1 X140.602 Y125.205 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2088
G1 X140.602 Y120.398 E.15946
G1 X140.302 Y120.398 E.00995
G1 X140.302 Y118.602 E.05957
G1 X142.398 Y118.602 E.06952
G1 X142.398 Y125.205 E.21903
G1 X140.662 Y125.205 E.05758
G1 X140.21 Y125.597 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2088
G1 X140.21 Y120.79 E.1477
G1 X139.91 Y120.79 E.00922
G1 X139.91 Y118.21 E.07928
G1 X142.79 Y118.21 E.08849
G1 X142.79 Y125.597 E.22698
G1 X140.27 Y125.597 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.245 Y123.597 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.036 J.638 P1  F30000
G1 X140.994 Y124.813 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2088
G1 X142.006 Y124.813 E.03109
G1 X142.006 Y118.994 E.17879
G1 X140.694 Y118.994 E.0403
G1 X140.694 Y120.006 E.03109
G1 X140.921 Y120.045 E.00708
G1 X140.994 Y120.194 E.00509
G1 X140.994 Y124.753 E.14007
G1 X141.341 Y124.466 F30000
; LINE_WIDTH: 0.360223
G1 F2088
G1 X141.659 Y124.466 E.0082
G1 X141.659 Y120.194 E.11044
G1 X141.639 Y120.003 E.00498
; LINE_WIDTH: 0.399936
G1 X141.619 Y119.811 E.00561
; LINE_WIDTH: 0.473706
G3 X141.599 Y119.401 I1.97 J-.301 E.01443
G1 X141.101 Y119.401 E.01749
G1 X141.101 Y119.7 E.01051
G1 X141.227 Y119.773 E.0051
; LINE_WIDTH: 0.47936
G1 X141.265 Y119.914 E.00517
; LINE_WIDTH: 0.439648
G1 X141.303 Y120.054 E.0047
; LINE_WIDTH: 0.361549
G1 X141.341 Y120.194 E.00378
G1 X141.341 Y124.406 E.10934
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.341 Y122.406 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/195
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
G3 Z9.2 I-.148 J-1.208 P1  F30000
G1 X119.398 Y125.098 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2008
G1 X117.602 Y125.098 E.05957
G1 X117.602 Y118.602 E.21547
G1 X119.498 Y118.602 E.06289
G1 X119.498 Y120.398 E.05957
G1 X119.398 Y120.398 E.00332
G1 X119.398 Y125.038 E.1539
G1 X119.79 Y125.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2008
G1 X117.21 Y125.49 E.07928
G1 X117.21 Y118.21 E.22368
G1 X119.89 Y118.21 E.08235
G1 X119.89 Y120.79 E.07928
G1 X119.79 Y120.79 E.00307
G1 X119.79 Y125.43 E.14256
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.476 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.652 J1.028 P1  F30000
G1 X119.006 Y124.705 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2008
G1 X119.006 Y120.194 E.13861
G3 X119.106 Y120.057 I.119 J-.019 E.0058
G1 X119.106 Y118.994 E.03266
G1 X117.994 Y118.994 E.03416
G1 X117.994 Y124.705 E.17549
G1 X118.946 Y124.705 E.02924
G1 X118.659 Y124.358 F30000
; LINE_WIDTH: 0.368
G1 F2008
G1 X118.659 Y120.194 E.1103
G2 X118.734 Y119.366 I-2.77 J-.668 E.0221
G1 X118.366 Y119.366 E.00973
G1 X118.341 Y120.194 E.02194
G1 X118.341 Y124.358 E.1103
G1 X118.599 Y124.358 E.00682
; WIPE_START
G1 F24000
G1 X118.341 Y124.358 E-.09778
G1 X118.341 Y122.616 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.207 J.154 P1  F30000
G1 X119.398 Y130.903 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2008
G1 X119.398 Y135.602 E.15589
G1 X119.498 Y135.602 E.00332
G1 X119.498 Y137.398 E.05957
G1 X117.602 Y137.398 E.06289
G1 X117.602 Y130.903 E.21546
G1 X119.338 Y130.903 E.05758
G1 X119.79 Y130.51 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2008
G1 X119.79 Y135.21 E.1444
G1 X119.89 Y135.21 E.00307
G1 X119.89 Y137.79 E.07928
G1 X117.21 Y137.79 E.08235
G1 X117.21 Y130.51 E.22368
G1 X119.73 Y130.51 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.756 Y132.51 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.036 J-.639 P1  F30000
G1 X119.006 Y131.295 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2008
G1 X117.994 Y131.295 E.03109
G1 X117.994 Y137.006 E.17549
G1 X119.106 Y137.006 E.03416
G1 X119.106 Y135.943 E.03266
G3 X119.006 Y135.806 I.019 J-.119 E.0058
G1 X119.006 Y131.355 E.13677
G1 X118.659 Y131.642 F30000
; LINE_WIDTH: 0.366378
G1 F2008
G1 X118.341 Y131.642 E.00836
G1 X118.341 Y135.806 E.10975
G3 X118.366 Y136.634 I-10.659 J.736 E.02184
G1 X118.734 Y136.634 E.00968
G1 X118.734 Y136.101 E.01405
G3 X118.659 Y135.806 I.489 J-.281 E.00812
G1 X118.659 Y131.702 E.10817
; WIPE_START
G1 F24000
G1 X118.659 Y133.702 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.154 J1.207 P1  F30000
G1 X140.602 Y130.903 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2008
G1 X142.398 Y130.903 E.05957
G1 X142.398 Y137.398 E.21546
G1 X140.502 Y137.398 E.06289
G1 X140.502 Y135.602 E.05957
G1 X140.602 Y135.602 E.00332
G1 X140.602 Y130.963 E.1539
G1 X140.21 Y130.51 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2008
G1 X142.79 Y130.51 E.07928
G1 X142.79 Y137.79 E.22368
G1 X140.11 Y137.79 E.08235
G1 X140.11 Y135.21 E.07928
G1 X140.21 Y135.21 E.00307
G1 X140.21 Y130.57 E.14256
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.524 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.295 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2008
G1 X140.994 Y135.806 E.13861
G3 X140.894 Y135.943 I-.119 J.019 E.0058
G1 X140.894 Y137.006 E.03266
G1 X142.006 Y137.006 E.03416
G1 X142.006 Y131.295 E.17549
G1 X141.054 Y131.295 E.02924
G1 X141.341 Y131.642 F30000
; LINE_WIDTH: 0.367928
G1 F2008
G1 X141.341 Y135.806 E.11027
G2 X141.266 Y136.634 I3.072 J.696 E.02208
G1 X141.634 Y136.634 E.00973
G2 X141.659 Y135.806 I-41.97 J-1.682 E.02194
G1 X141.659 Y131.642 E.11027
G1 X141.401 Y131.642 E.00681
; WIPE_START
G1 F24000
G1 X141.659 Y131.642 E-.09778
G1 X141.659 Y133.385 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.207 J-.154 P1  F30000
G1 X140.602 Y125.098 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2008
G1 X140.602 Y120.398 E.15589
G1 X140.502 Y120.398 E.00332
G1 X140.502 Y118.602 E.05957
G1 X142.398 Y118.602 E.06289
M73 P36 R23
G1 X142.398 Y125.098 E.21547
G1 X140.662 Y125.098 E.05758
G1 X140.21 Y125.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2008
G1 X140.21 Y120.79 E.14441
G1 X140.11 Y120.79 E.00307
G1 X140.11 Y118.21 E.07928
G1 X142.79 Y118.21 E.08235
G1 X142.79 Y125.49 E.22368
G1 X140.27 Y125.49 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.244 Y123.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.036 J.639 P1  F30000
G1 X140.994 Y124.705 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2008
G1 X142.006 Y124.705 E.03109
G1 X142.006 Y118.994 E.17549
G1 X140.894 Y118.994 E.03416
G1 X140.894 Y120.057 E.03266
G3 X140.994 Y120.194 I-.019 J.119 E.0058
G1 X140.994 Y124.645 E.13677
G1 X141.341 Y124.358 F30000
; LINE_WIDTH: 0.366761
G1 F2008
G1 X141.659 Y124.358 E.00837
G1 X141.659 Y120.194 E.10988
G3 X141.634 Y119.366 I10.659 J-.736 E.02187
G1 X141.266 Y119.366 E.00969
G1 X141.266 Y119.899 E.01407
G1 X141.341 Y120.194 E.00803
G1 X141.341 Y124.298 E.1083
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.341 Y122.298 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/195
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
G3 Z9.4 I-.448 J-1.131 P1  F30000
G1 X119.398 Y130.987 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1972
G1 X119.398 Y137.398 E.21265
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y130.987 E.21265
G1 X119.338 Y130.987 E.05758
G1 X119.79 Y130.595 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1972
G1 X119.79 Y137.79 E.22108
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.595 E.22108
G1 X119.73 Y130.595 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.595 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I1.039 J-.633 P1  F30000
G1 X119.006 Y131.379 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1972
G1 X117.994 Y131.379 E.03109
G1 X117.994 Y137.006 E.17289
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.439 E.17104
G1 X118.659 Y131.727 F30000
; LINE_WIDTH: 0.360223
G1 F1972
G1 X118.341 Y131.727 E.0082
G1 X118.341 Y136.659 E.12752
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.787 E.12597
; WIPE_START
G1 F24000
G1 X118.659 Y133.787 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I1.213 J.102 P1  F30000
G1 X119.398 Y125.013 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1972
G1 X117.602 Y125.013 E.05957
G1 X117.602 Y118.602 E.21265
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.953 E.21066
G1 X119.79 Y125.405 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1972
G1 X117.21 Y125.405 E.07928
G1 X117.21 Y118.21 E.22107
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.345 E.21923
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.391 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.652 J1.028 P1  F30000
G1 X119.006 Y124.621 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1972
G1 X119.006 Y118.994 E.17288
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.621 E.17288
G1 X118.946 Y124.621 E.02924
G1 X118.659 Y124.273 F30000
; LINE_WIDTH: 0.360223
G1 F1972
G1 X118.659 Y119.341 E.12752
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.273 E.12752
G1 X118.599 Y124.273 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.273 E-.09778
G1 X118.341 Y122.531 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y125.013 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1972
G1 X140.602 Y118.602 E.21265
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y125.013 E.21265
G1 X140.662 Y125.013 E.05758
G1 X140.21 Y125.405 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1972
G1 X140.21 Y118.21 E.22107
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.405 E.22107
G1 X140.27 Y125.405 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.405 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-1.039 J.633 P1  F30000
G1 X140.994 Y124.621 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1972
G1 X142.006 Y124.621 E.03109
G1 X142.006 Y118.994 E.17288
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.561 E.17104
G1 X141.341 Y124.273 F30000
; LINE_WIDTH: 0.360223
G1 F1972
G1 X141.659 Y124.273 E.0082
G1 X141.659 Y119.341 E.12752
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.213 E.12597
; WIPE_START
G1 F24000
G1 X141.341 Y122.213 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-1.213 J-.102 P1  F30000
G1 X140.602 Y130.987 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1972
G1 X142.398 Y130.987 E.05957
G1 X142.398 Y137.398 E.21265
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.047 E.21066
G1 X140.21 Y130.595 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1972
G1 X142.79 Y130.595 E.07928
G1 X142.79 Y137.79 E.22108
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.655 E.21923
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.609 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.379 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1972
G1 X140.994 Y137.006 E.17289
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.379 E.17289
G1 X141.054 Y131.379 E.02924
G1 X141.341 Y131.727 F30000
; LINE_WIDTH: 0.360223
G1 F1972
G1 X141.341 Y136.659 E.12752
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.727 E.12752
G1 X141.401 Y131.727 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.727 E-.09778
G1 X141.659 Y133.469 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/195
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
G3 Z9.6 I.131 J-1.21 P1  F30000
G1 X119.398 Y131.053 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1954
G1 X119.398 Y137.398 E.21046
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.053 E.21046
G1 X119.338 Y131.053 E.05758
G1 X119.79 Y130.661 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1954
G1 X119.79 Y137.79 E.21905
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.661 E.21905
G1 X119.73 Y130.661 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.661 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I1.039 J-.633 P1  F30000
G1 X119.006 Y131.445 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1954
G1 X117.994 Y131.445 E.03109
G1 X117.994 Y137.006 E.17086
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.505 E.16901
G1 X118.659 Y131.793 F30000
; LINE_WIDTH: 0.360223
G1 F1954
G1 X118.341 Y131.793 E.0082
G1 X118.341 Y136.659 E.12582
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.853 E.12427
; WIPE_START
G1 F24000
G1 X118.659 Y133.853 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I1.213 J.101 P1  F30000
G1 X119.398 Y124.947 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1954
G1 X117.602 Y124.947 E.05957
G1 X117.602 Y118.602 E.21046
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.887 E.20847
G1 X119.79 Y125.339 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1954
G1 X117.21 Y125.339 E.07928
G1 X117.21 Y118.21 E.21905
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.279 E.2172
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.325 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.652 J1.028 P1  F30000
G1 X119.006 Y124.555 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1954
G1 X119.006 Y118.994 E.17086
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.555 E.17086
G1 X118.946 Y124.555 E.02924
G1 X118.659 Y124.207 F30000
; LINE_WIDTH: 0.360223
G1 F1954
G1 X118.659 Y119.341 E.12582
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.207 E.12582
G1 X118.599 Y124.207 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.207 E-.09778
G1 X118.341 Y122.465 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.947 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1954
G1 X140.602 Y118.602 E.21046
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.947 E.21046
G1 X140.662 Y124.947 E.05758
G1 X140.21 Y125.339 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1954
G1 X140.21 Y118.21 E.21905
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.339 E.21905
G1 X140.27 Y125.339 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.339 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-1.039 J.633 P1  F30000
G1 X140.994 Y124.555 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1954
G1 X142.006 Y124.555 E.03109
G1 X142.006 Y118.994 E.17086
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.495 E.16901
G1 X141.341 Y124.207 F30000
; LINE_WIDTH: 0.360223
G1 F1954
G1 X141.659 Y124.207 E.0082
G1 X141.659 Y119.341 E.12582
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.147 E.12427
; WIPE_START
G1 F24000
G1 X141.341 Y122.147 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-1.213 J-.101 P1  F30000
G1 X140.602 Y131.053 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1954
G1 X142.398 Y131.053 E.05957
G1 X142.398 Y137.398 E.21046
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.113 E.20847
G1 X140.21 Y130.661 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1954
G1 X142.79 Y130.661 E.07928
G1 X142.79 Y137.79 E.21905
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.721 E.2172
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.675 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.445 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1954
G1 X140.994 Y137.006 E.17086
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.445 E.17086
G1 X141.054 Y131.445 E.02924
G1 X141.341 Y131.793 F30000
; LINE_WIDTH: 0.360223
G1 F1954
G1 X141.341 Y136.659 E.12582
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.793 E.12582
G1 X141.401 Y131.793 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.793 E-.09778
G1 X141.659 Y133.535 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/195
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
G3 Z9.8 I.132 J-1.21 P1  F30000
G1 X119.398 Y131.103 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1941
G1 X119.398 Y137.398 E.20883
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.103 E.20883
G1 X119.338 Y131.103 E.05758
G1 X119.79 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1941
G1 X119.79 Y137.79 E.21753
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.71 E.21753
G1 X119.73 Y130.71 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I1.039 J-.633 P1  F30000
G1 X119.006 Y131.495 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1941
G1 X117.994 Y131.495 E.03109
G1 X117.994 Y137.006 E.16934
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.555 E.1675
G1 X118.659 Y131.842 F30000
; LINE_WIDTH: 0.360223
G1 F1941
G1 X118.341 Y131.842 E.0082
M73 P37 R23
G1 X118.341 Y136.659 E.12454
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.902 E.12299
; WIPE_START
G1 F24000
G1 X118.659 Y133.902 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I1.213 J.1 P1  F30000
G1 X119.398 Y124.897 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1941
G1 X117.602 Y124.897 E.05957
G1 X117.602 Y118.602 E.20883
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.837 E.20684
G1 X119.79 Y125.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1941
G1 X117.21 Y125.29 E.07928
G1 X117.21 Y118.21 E.21754
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.23 E.21569
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.276 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P37 R22
G3 Z10 I.652 J1.028 P1  F30000
G1 X119.006 Y124.505 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1941
G1 X119.006 Y118.994 E.16934
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.505 E.16934
G1 X118.946 Y124.505 E.02924
G1 X118.659 Y124.158 F30000
; LINE_WIDTH: 0.360223
G1 F1941
G1 X118.659 Y119.341 E.12455
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.158 E.12455
G1 X118.599 Y124.158 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.158 E-.09778
G1 X118.341 Y122.416 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.897 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1941
G1 X140.602 Y118.602 E.20883
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.897 E.20883
G1 X140.662 Y124.897 E.05758
G1 X140.21 Y125.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1941
G1 X140.21 Y118.21 E.21754
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.29 E.21754
G1 X140.27 Y125.29 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-1.039 J.633 P1  F30000
G1 X140.994 Y124.505 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1941
G1 X142.006 Y124.505 E.03109
G1 X142.006 Y118.994 E.16934
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.445 E.1675
G1 X141.341 Y124.158 F30000
; LINE_WIDTH: 0.360223
G1 F1941
G1 X141.659 Y124.158 E.0082
G1 X141.659 Y119.341 E.12455
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.098 E.12299
; WIPE_START
G1 F24000
G1 X141.341 Y122.098 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-1.213 J-.1 P1  F30000
G1 X140.602 Y131.103 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1941
G1 X142.398 Y131.103 E.05957
G1 X142.398 Y137.398 E.20883
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.163 E.20684
G1 X140.21 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1941
G1 X142.79 Y130.71 E.07928
G1 X142.79 Y137.79 E.21753
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.77 E.21569
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.724 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.495 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1941
G1 X140.994 Y137.006 E.16934
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.495 E.16934
G1 X141.054 Y131.495 E.02924
G1 X141.341 Y131.842 F30000
; LINE_WIDTH: 0.360223
G1 F1941
G1 X141.341 Y136.659 E.12454
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.842 E.12454
G1 X141.401 Y131.842 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.842 E-.09778
G1 X141.659 Y133.585 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/195
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
G3 Z10 I.133 J-1.21 P1  F30000
G1 X119.398 Y131.134 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1933
G1 X119.398 Y137.398 E.2078
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.134 E.2078
G1 X119.338 Y131.134 E.05758
G1 X119.79 Y130.742 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1933
G1 X119.79 Y137.79 E.21658
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.742 E.21658
G1 X119.73 Y130.742 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.741 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.039 J-.633 P1  F30000
G1 X119.006 Y131.526 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1933
G1 X117.994 Y131.526 E.03109
G1 X117.994 Y137.006 E.16839
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.586 E.16655
G1 X118.659 Y131.873 F30000
; LINE_WIDTH: 0.360223
G1 F1933
G1 X118.341 Y131.873 E.0082
G1 X118.341 Y136.659 E.12374
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.933 E.12219
; WIPE_START
G1 F24000
G1 X118.659 Y133.933 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.213 J.099 P1  F30000
G1 X119.398 Y124.866 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1933
G1 X117.602 Y124.866 E.05957
G1 X117.602 Y118.602 E.2078
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.806 E.20581
G1 X119.79 Y125.258 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1933
G1 X117.21 Y125.258 E.07928
G1 X117.21 Y118.21 E.21658
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.198 E.21474
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.245 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.652 J1.028 P1  F30000
G1 X119.006 Y124.474 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1933
G1 X119.006 Y118.994 E.16839
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.474 E.16839
G1 X118.946 Y124.474 E.02924
G1 X118.659 Y124.127 F30000
; LINE_WIDTH: 0.360223
G1 F1933
G1 X118.659 Y119.341 E.12374
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.127 E.12374
G1 X118.599 Y124.127 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.127 E-.09778
G1 X118.341 Y122.384 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.866 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1933
G1 X140.602 Y118.602 E.2078
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.866 E.2078
G1 X140.662 Y124.866 E.05758
G1 X140.21 Y125.258 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1933
G1 X140.21 Y118.21 E.21658
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.258 E.21658
G1 X140.27 Y125.258 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.259 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-1.039 J.633 P1  F30000
G1 X140.994 Y124.474 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1933
G1 X142.006 Y124.474 E.03109
G1 X142.006 Y118.994 E.16839
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.414 E.16655
G1 X141.341 Y124.127 F30000
; LINE_WIDTH: 0.360223
G1 F1933
G1 X141.659 Y124.127 E.0082
G1 X141.659 Y119.341 E.12374
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.067 E.12219
; WIPE_START
G1 F24000
G1 X141.341 Y122.067 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.134 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1933
G1 X142.398 Y131.134 E.05957
G1 X142.398 Y137.398 E.2078
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.194 E.20581
G1 X140.21 Y130.742 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1933
G1 X142.79 Y130.742 E.07928
G1 X142.79 Y137.79 E.21658
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.802 E.21474
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.755 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.526 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1933
G1 X140.994 Y137.006 E.16839
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.526 E.16839
G1 X141.054 Y131.526 E.02924
G1 X141.341 Y131.873 F30000
; LINE_WIDTH: 0.360223
G1 F1933
G1 X141.341 Y136.659 E.12374
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.873 E.12374
G1 X141.401 Y131.873 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.873 E-.09778
G1 X141.659 Y133.616 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/195
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
G3 Z10.2 I.134 J-1.21 P1  F30000
G1 X119.398 Y131.15 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20727
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.15 E.20727
G1 X119.338 Y131.15 E.05758
G1 X119.79 Y130.758 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21609
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.758 E.21609
G1 X119.73 Y130.758 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.758 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I1.039 J-.633 P1  F30000
G1 X119.006 Y131.542 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.542 E.03109
G1 X117.994 Y137.006 E.1679
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.602 E.16605
G1 X118.659 Y131.889 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.889 E.0082
G1 X118.341 Y136.659 E.12333
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.949 E.12177
; WIPE_START
G1 F24000
G1 X118.659 Y133.949 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I1.213 J.099 P1  F30000
G1 X119.398 Y124.85 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.85 E.05957
G1 X117.602 Y118.602 E.20727
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.79 E.20528
G1 X119.79 Y125.242 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.242 E.07928
G1 X117.21 Y118.21 E.21609
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.182 E.21424
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.229 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.652 J1.028 P1  F30000
G1 X119.006 Y124.458 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.1679
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.458 E.1679
G1 X118.946 Y124.458 E.02924
G1 X118.659 Y124.111 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12333
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.111 E.12333
G1 X118.599 Y124.111 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.111 E-.09778
G1 X118.341 Y122.368 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.85 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20727
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.85 E.20727
G1 X140.662 Y124.85 E.05758
G1 X140.21 Y125.242 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21609
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.242 E.21609
G1 X140.27 Y125.242 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.243 E-.76
; WIPE_END
M73 P38 R22
G1 E-.04 F1800
G17
G3 Z10.4 I-1.039 J.633 P1  F30000
G1 X140.994 Y124.458 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.458 E.03109
G1 X142.006 Y118.994 E.1679
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.398 E.16605
G1 X141.341 Y124.111 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.111 E.0082
G1 X141.659 Y119.341 E.12333
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.051 E.12178
; WIPE_START
G1 F24000
G1 X141.341 Y122.051 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.15 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.15 E.05957
G1 X142.398 Y137.398 E.20727
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.21 E.20528
G1 X140.21 Y130.758 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.758 E.07928
G1 X142.79 Y137.79 E.21609
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.818 E.21424
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.771 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.542 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.1679
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.542 E.1679
G1 X141.054 Y131.542 E.02924
G1 X141.341 Y131.889 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12333
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.889 E.12333
G1 X141.401 Y131.889 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.889 E-.09778
G1 X141.659 Y133.632 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/195
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
G3 Z10.4 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/195
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
G3 Z10.6 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
M73 P39 R22
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/195
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
G3 Z10.8 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/195
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
G3 Z11 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
M73 P39 R21
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/195
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
G3 Z11.2 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P40 R21
G3 Z11.4 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/195
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
G3 Z11.4 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/195
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
G3 Z11.6 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
M73 P41 R21
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/195
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
G3 Z11.8 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/195
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
G3 Z12 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/195
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
G3 Z12.2 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z12.4
G1 Z12
M73 P42 R21
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/195
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
G3 Z12.4 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
M73 P42 R20
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/195
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
G3 Z12.6 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
M73 P43 R20
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/195
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
G3 Z12.8 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/195
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
G3 Z13 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
M73 P44 R20
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/195
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
G3 Z13.2 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/195
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
G3 Z13.4 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/195
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
G3 Z13.6 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
M73 P45 R20
G1 E-.04 F1800
G17
G3 Z13.8 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
M73 P45 R19
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/195
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
G3 Z13.8 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/195
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
G3 Z14 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
M73 P46 R19
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/195
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
G3 Z14.2 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/195
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
G3 Z14.4 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/195
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
G3 Z14.6 I.135 J-1.209 P1  F30000
M73 P47 R19
G1 X119.398 Y131.152 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/195
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
G3 Z14.8 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/195
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
G3 Z15 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
M73 P48 R19
G1 F1929
G1 X119.006 Y118.994 E.16782
M73 P48 R18
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/195
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
G3 Z15.2 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/195
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
G3 Z15.4 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z15.6
G1 Z15.2
M73 P49 R18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/195
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
G3 Z15.6 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/195
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
G3 Z15.8 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/195
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
G3 Z16 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
M73 P50 R18
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/195
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
G3 Z16.2 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
M73 P50 R17
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/195
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
G3 Z16.4 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P51 R17
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/195
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
G3 Z16.6 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/195
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
G3 Z16.8 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
M73 P52 R17
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/195
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
G3 Z17 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/195
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
G3 Z17.2 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/195
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
G3 Z17.4 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z17.6
G1 Z17.2
M73 P53 R17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/195
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
G3 Z17.6 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
M73 P53 R16
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/195
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
G3 Z17.8 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
M73 P54 R16
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
G17
G3 Z18 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
G17
G3 Z18.2 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
G17
G3 Z18.4 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P55 R16
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
G17
G3 Z18.6 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
G17
G3 Z18.8 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
M73 P56 R16
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
M73 P56 R15
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
G17
G3 Z19 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
G17
G3 Z19.2 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
M73 P57 R15
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
G17
G3 Z19.4 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
G17
G3 Z19.6 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
G17
G3 Z19.8 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
M73 P58 R15
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
G17
G3 Z20 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
G17
G3 Z20.2 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.152 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20719
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.152 E.20719
G1 X119.338 Y131.152 E.05758
G1 X119.79 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21601
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.76 E.21601
G1 X119.73 Y130.76 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I1.039 J-.634 P1  F30000
G1 X119.006 Y131.544 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.544 E.03109
G1 X117.994 Y137.006 E.16782
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.604 E.16598
G1 X118.659 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.891 E.0082
G1 X118.341 Y136.659 E.12326
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.951 E.12171
; WIPE_START
G1 F24000
G1 X118.659 Y133.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I1.213 J.099 P1  F30000
G1 X119.398 Y124.848 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.848 E.05957
G1 X117.602 Y118.602 E.20719
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.788 E.2052
G1 X119.79 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.24 E.07928
G1 X117.21 Y118.21 E.21601
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.18 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I.652 J1.028 P1  F30000
G1 X119.006 Y124.456 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.16782
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.456 E.16782
G1 X118.946 Y124.456 E.02924
G1 X118.659 Y124.109 F30000
; LINE_WIDTH: 0.360223
M73 P58 R14
G1 F1929
G1 X118.659 Y119.341 E.12326
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.109 E.12326
G1 X118.599 Y124.109 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.109 E-.09778
G1 X118.341 Y122.366 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.848 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20719
M73 P59 R14
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.848 E.20719
G1 X140.662 Y124.848 E.05758
G1 X140.21 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21601
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.24 E.21601
G1 X140.27 Y125.24 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.24 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-1.039 J.634 P1  F30000
G1 X140.994 Y124.456 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.456 E.03109
G1 X142.006 Y118.994 E.16782
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.396 E.16598
G1 X141.341 Y124.109 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.109 E.0082
G1 X141.659 Y119.341 E.12326
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.049 E.12171
; WIPE_START
G1 F24000
G1 X141.341 Y122.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.152 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.152 E.05957
G1 X142.398 Y137.398 E.20719
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.212 E.2052
G1 X140.21 Y130.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.76 E.07928
G1 X142.79 Y137.79 E.21601
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.82 E.21417
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.544 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.16782
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.544 E.16782
G1 X141.054 Y131.544 E.02924
G1 X141.341 Y131.891 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12326
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.891 E.12326
G1 X141.401 Y131.891 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.891 E-.09778
G1 X141.659 Y133.634 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L101
M991 S0 P100 ;notify layer change
G17
G3 Z20.4 I.135 J-1.209 P1  F30000
G1 X119.398 Y131.15 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X119.398 Y137.398 E.20727
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.15 E.20727
G1 X119.338 Y131.15 E.05758
G1 X119.79 Y130.758 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X119.79 Y137.79 E.21609
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.758 E.21609
G1 X119.73 Y130.758 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.757 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I1.039 J-.633 P1  F30000
G1 X119.006 Y131.542 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X117.994 Y131.542 E.03109
G1 X117.994 Y137.006 E.1679
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.602 E.16605
G1 X118.659 Y131.889 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.341 Y131.889 E.0082
G1 X118.341 Y136.659 E.12333
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.949 E.12178
; WIPE_START
G1 F24000
G1 X118.659 Y133.949 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I1.213 J.099 P1  F30000
G1 X119.398 Y124.85 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X117.602 Y124.85 E.05957
G1 X117.602 Y118.602 E.20727
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.79 E.20528
G1 X119.79 Y125.242 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X117.21 Y125.242 E.07928
G1 X117.21 Y118.21 E.21609
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.182 E.21425
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.229 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I.652 J1.028 P1  F30000
G1 X119.006 Y124.458 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X119.006 Y118.994 E.1679
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.458 E.1679
G1 X118.946 Y124.458 E.02924
G1 X118.659 Y124.111 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X118.659 Y119.341 E.12333
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.111 E.12333
G1 X118.599 Y124.111 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.111 E-.09778
G1 X118.341 Y122.368 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.85 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X140.602 Y118.602 E.20727
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.85 E.20727
G1 X140.662 Y124.85 E.05758
G1 X140.21 Y125.242 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X140.21 Y118.21 E.21609
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.242 E.21609
G1 X140.27 Y125.242 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I-1.039 J.633 P1  F30000
G1 X140.994 Y124.458 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X142.006 Y124.458 E.03109
G1 X142.006 Y118.994 E.1679
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.398 E.16606
G1 X141.341 Y124.111 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.659 Y124.111 E.0082
G1 X141.659 Y119.341 E.12333
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.051 E.12178
; WIPE_START
G1 F24000
G1 X141.341 Y122.051 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.15 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1929
G1 X142.398 Y131.15 E.05957
G1 X142.398 Y137.398 E.20727
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.21 E.20528
G1 X140.21 Y130.758 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1929
G1 X142.79 Y130.758 E.07928
G1 X142.79 Y137.79 E.21609
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.818 E.21425
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.771 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.542 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1929
G1 X140.994 Y137.006 E.1679
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.542 E.1679
G1 X141.054 Y131.542 E.02924
G1 X141.341 Y131.889 F30000
; LINE_WIDTH: 0.360223
G1 F1929
G1 X141.341 Y136.659 E.12333
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.889 E.12333
G1 X141.401 Y131.889 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y131.889 E-.09778
G1 X141.659 Y133.632 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L102
M991 S0 P101 ;notify layer change
G17
G3 Z20.6 I.136 J-1.209 P1  F30000
G1 X119.398 Y131.134 Z20.6
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1933
G1 X119.398 Y137.398 E.2078
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.134 E.2078
G1 X119.338 Y131.134 E.05758
G1 X119.79 Y130.742 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1933
G1 X119.79 Y137.79 E.21658
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.742 E.21658
G1 X119.73 Y130.742 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.741 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I1.039 J-.633 P1  F30000
G1 X119.006 Y131.526 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1933
G1 X117.994 Y131.526 E.03109
G1 X117.994 Y137.006 E.16839
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.586 E.16655
G1 X118.659 Y131.873 F30000
; LINE_WIDTH: 0.360223
G1 F1933
G1 X118.341 Y131.873 E.0082
G1 X118.341 Y136.659 E.12374
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.933 E.12219
; WIPE_START
G1 F24000
G1 X118.659 Y133.933 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I1.213 J.099 P1  F30000
G1 X119.398 Y124.866 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1933
G1 X117.602 Y124.866 E.05957
G1 X117.602 Y118.602 E.2078
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.806 E.20581
G1 X119.79 Y125.258 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1933
G1 X117.21 Y125.258 E.07928
G1 X117.21 Y118.21 E.21658
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.198 E.21474
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.245 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I.652 J1.028 P1  F30000
G1 X119.006 Y124.474 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1933
G1 X119.006 Y118.994 E.16839
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.474 E.16839
G1 X118.946 Y124.474 E.02924
G1 X118.659 Y124.127 F30000
; LINE_WIDTH: 0.360223
G1 F1933
G1 X118.659 Y119.341 E.12374
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.127 E.12374
G1 X118.599 Y124.127 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.127 E-.09778
G1 X118.341 Y122.384 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.866 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1933
G1 X140.602 Y118.602 E.2078
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.866 E.2078
G1 X140.662 Y124.866 E.05758
G1 X140.21 Y125.258 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1933
G1 X140.21 Y118.21 E.21658
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.258 E.21658
G1 X140.27 Y125.258 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.259 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I-1.039 J.633 P1  F30000
G1 X140.994 Y124.474 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1933
G1 X142.006 Y124.474 E.03109
G1 X142.006 Y118.994 E.16839
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.414 E.16655
G1 X141.341 Y124.127 F30000
; LINE_WIDTH: 0.360223
G1 F1933
G1 X141.659 Y124.127 E.0082
G1 X141.659 Y119.341 E.12374
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.067 E.12219
; WIPE_START
G1 F24000
G1 X141.341 Y122.067 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I-1.213 J-.099 P1  F30000
G1 X140.602 Y131.134 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1933
G1 X142.398 Y131.134 E.05957
G1 X142.398 Y137.398 E.2078
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.194 E.20581
G1 X140.21 Y130.742 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1933
G1 X142.79 Y130.742 E.07928
G1 X142.79 Y137.79 E.21658
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.802 E.21474
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.755 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.526 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1933
G1 X140.994 Y137.006 E.16839
G1 X142.006 Y137.006 E.03109
M73 P60 R14
G1 X142.006 Y131.526 E.16839
G1 X141.054 Y131.526 E.02924
G1 X141.341 Y131.873 F30000
; LINE_WIDTH: 0.360223
G1 F1933
G1 X141.341 Y136.659 E.12374
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.873 E.12374
G1 X141.401 Y131.873 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.873 E-.09778
G1 X141.659 Y133.616 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L103
M991 S0 P102 ;notify layer change
G17
G3 Z20.8 I.137 J-1.209 P1  F30000
G1 X119.398 Y131.102 Z20.8
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1941
G1 X119.398 Y137.398 E.20883
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.102 E.20883
G1 X119.338 Y131.102 E.05758
G1 X119.79 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1941
G1 X119.79 Y137.79 E.21754
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.71 E.21754
G1 X119.73 Y130.71 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I1.039 J-.633 P1  F30000
G1 X119.006 Y131.495 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1941
G1 X117.994 Y131.495 E.03109
G1 X117.994 Y137.006 E.16935
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.555 E.1675
G1 X118.659 Y131.842 F30000
; LINE_WIDTH: 0.360223
G1 F1941
G1 X118.341 Y131.842 E.0082
G1 X118.341 Y136.659 E.12455
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.902 E.123
; WIPE_START
G1 F24000
G1 X118.659 Y133.902 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I1.213 J.1 P1  F30000
G1 X119.398 Y124.898 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1941
G1 X117.602 Y124.898 E.05957
G1 X117.602 Y118.602 E.20883
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.838 E.20684
G1 X119.79 Y125.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1941
G1 X117.21 Y125.29 E.07928
G1 X117.21 Y118.21 E.21754
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.23 E.21569
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.276 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I.652 J1.028 P1  F30000
G1 X119.006 Y124.505 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1941
G1 X119.006 Y118.994 E.16935
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.505 E.16935
G1 X118.946 Y124.505 E.02924
G1 X118.659 Y124.158 F30000
; LINE_WIDTH: 0.360223
G1 F1941
G1 X118.659 Y119.341 E.12455
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.158 E.12455
G1 X118.599 Y124.158 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.158 E-.09778
G1 X118.341 Y122.416 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.898 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1941
G1 X140.602 Y118.602 E.20883
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.898 E.20883
G1 X140.662 Y124.898 E.05758
G1 X140.21 Y125.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1941
G1 X140.21 Y118.21 E.21754
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.29 E.21754
G1 X140.27 Y125.29 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I-1.039 J.633 P1  F30000
G1 X140.994 Y124.505 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1941
G1 X142.006 Y124.505 E.03109
G1 X142.006 Y118.994 E.16935
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.445 E.1675
G1 X141.341 Y124.158 F30000
; LINE_WIDTH: 0.360223
G1 F1941
G1 X141.659 Y124.158 E.0082
G1 X141.659 Y119.341 E.12455
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.098 E.123
; WIPE_START
G1 F24000
G1 X141.341 Y122.098 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I-1.213 J-.1 P1  F30000
G1 X140.602 Y131.102 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1941
G1 X142.398 Y131.102 E.05957
G1 X142.398 Y137.398 E.20883
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.162 E.20684
G1 X140.21 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1941
G1 X142.79 Y130.71 E.07928
G1 X142.79 Y137.79 E.21754
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.77 E.21569
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.724 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I-.652 J-1.028 P1  F30000
G1 X140.994 Y131.495 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1941
G1 X140.994 Y137.006 E.16935
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.495 E.16935
G1 X141.054 Y131.495 E.02924
G1 X141.341 Y131.842 F30000
; LINE_WIDTH: 0.360223
G1 F1941
G1 X141.341 Y136.659 E.12455
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.842 E.12455
G1 X141.401 Y131.842 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y131.842 E-.09778
G1 X141.659 Y133.584 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L104
M991 S0 P103 ;notify layer change
G17
G3 Z21 I.137 J-1.209 P1  F30000
G1 X119.398 Y131.053 Z21
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1958
G1 X119.398 Y137.398 E.21046
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y131.053 E.21046
G1 X119.338 Y131.053 E.05758
G1 X119.79 Y130.669 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1958
G1 X119.79 Y137.79 E.2188
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.669 E.2188
G1 X119.73 Y130.669 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.747 Y132.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I1.041 J-.63 P1  F30000
G1 X119.006 Y131.445 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1958
G1 X117.994 Y131.445 E.03109
G1 X117.994 Y137.006 E.17086
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.505 E.16901
G1 X118.659 Y131.793 F30000
; LINE_WIDTH: 0.360223
G1 F1958
G1 X118.341 Y131.793 E.0082
G1 X118.341 Y136.659 E.12582
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.853 E.12427
; WIPE_START
G1 F24000
G1 X118.659 Y133.853 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I1.213 J.101 P1  F30000
G1 X119.398 Y124.947 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1958
G1 X117.602 Y124.947 E.05957
G1 X117.602 Y118.602 E.21046
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.887 E.20847
G1 X119.79 Y125.331 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1958
G1 X117.21 Y125.331 E.07928
G1 X117.21 Y118.21 E.2188
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.271 E.21695
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.317 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I.647 J1.031 P1  F30000
G1 X119.006 Y124.555 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1958
G1 X119.006 Y118.994 E.17086
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.555 E.17086
G1 X118.946 Y124.555 E.02924
G1 X118.659 Y124.207 F30000
; LINE_WIDTH: 0.360223
G1 F1958
G1 X118.659 Y119.341 E.12582
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.207 E.12582
G1 X118.599 Y124.207 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.207 E-.09778
G1 X118.341 Y122.465 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-.135 J1.209 P1  F30000
G1 X140.602 Y124.947 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1958
G1 X140.602 Y118.602 E.21046
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y124.947 E.21046
G1 X140.662 Y124.947 E.05758
G1 X140.21 Y125.331 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1958
G1 X140.21 Y118.21 E.2188
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.331 E.2188
G1 X140.27 Y125.331 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y123.331 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-1.041 J.63 P1  F30000
G1 X140.994 Y124.555 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1958
G1 X142.006 Y124.555 E.03109
G1 X142.006 Y118.994 E.17086
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.495 E.16901
G1 X141.341 Y124.207 F30000
; LINE_WIDTH: 0.360223
G1 F1958
G1 X141.659 Y124.207 E.0082
G1 X141.659 Y119.341 E.12582
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.147 E.12427
; WIPE_START
G1 F24000
G1 X141.341 Y122.147 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-1.213 J-.101 P1  F30000
G1 X140.602 Y131.053 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1958
G1 X142.398 Y131.053 E.05957
G1 X142.398 Y137.398 E.21046
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.113 E.20847
G1 X140.21 Y130.669 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1958
G1 X142.79 Y130.669 E.07928
G1 X142.79 Y137.79 E.2188
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.729 E.21695
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-.647 J-1.031 P1  F30000
G1 X140.994 Y131.445 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1958
G1 X140.994 Y137.006 E.17086
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.445 E.17086
G1 X141.054 Y131.445 E.02924
G1 X141.341 Y131.793 F30000
; LINE_WIDTH: 0.360223
G1 F1958
G1 X141.341 Y136.659 E.12582
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.793 E.12582
G1 X141.401 Y131.793 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.793 E-.09778
G1 X141.659 Y133.535 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L105
M991 S0 P104 ;notify layer change
G17
G3 Z21.2 I.138 J-1.209 P1  F30000
G1 X119.398 Y130.987 Z21.2
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1974
G1 X119.398 Y137.398 E.21265
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y130.987 E.21265
G1 X119.338 Y130.987 E.05758
G1 X119.79 Y130.62 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1974
G1 X119.79 Y137.79 E.22031
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.62 E.22031
G1 X117.21 Y130.595 E.00077
G1 X119.755 Y130.595 E.0782
M204 S10000
; WIPE_START
G1 F24000
G1 X119.765 Y132.595 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I1.032 J-.644 P1  F30000
G1 X119.006 Y131.379 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1974
G1 X117.994 Y131.379 E.03109
G1 X117.994 Y137.006 E.17288
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.439 E.17104
G1 X118.659 Y131.727 F30000
; LINE_WIDTH: 0.360223
G1 F1974
G1 X118.341 Y131.727 E.0082
G1 X118.341 Y136.659 E.12752
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.787 E.12597
; WIPE_START
G1 F24000
G1 X118.659 Y133.787 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I1.213 J.102 P1  F30000
G1 X119.398 Y125.013 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P61 R14
G1 F1974
G1 X117.602 Y125.013 E.05957
G1 X117.602 Y118.602 E.21265
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y124.953 E.21066
G1 X119.79 Y125.38 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1974
G1 X119.79 Y125.405 E.00077
G1 X117.21 Y125.405 E.07928
G1 X117.21 Y125.38 E.00077
G1 X117.21 Y118.21 E.22031
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.32 E.21846
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y125.405 E-.03228
G1 X117.875 Y125.405 E-.72772
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I.693 J1 P1  F30000
G1 X119.006 Y124.621 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1974
G1 X119.006 Y118.994 E.17288
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.621 E.17288
G1 X118.946 Y124.621 E.02924
G1 X118.659 Y124.273 F30000
; LINE_WIDTH: 0.360223
G1 F1974
G1 X118.659 Y119.341 E.12752
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.273 E.12752
G1 X118.599 Y124.273 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.273 E-.09778
G1 X118.341 Y122.531 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I-.135 J1.209 P1  F30000
G1 X140.602 Y125.013 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1974
G1 X140.602 Y118.602 E.21265
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y125.013 E.21265
G1 X140.662 Y125.013 E.05758
G1 X140.21 Y125.38 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1974
G1 X140.21 Y118.21 E.22031
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.38 E.22031
G1 X142.79 Y125.405 E.00077
G1 X140.245 Y125.405 E.0782
M204 S10000
; WIPE_START
G1 F24000
G1 X140.235 Y123.405 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I-1.032 J.644 P1  F30000
G1 X140.994 Y124.621 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1974
G1 X142.006 Y124.621 E.03109
G1 X142.006 Y118.994 E.17288
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.561 E.17104
G1 X141.341 Y124.273 F30000
; LINE_WIDTH: 0.360223
G1 F1974
G1 X141.659 Y124.273 E.0082
G1 X141.659 Y119.341 E.12752
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.213 E.12597
; WIPE_START
G1 F24000
G1 X141.341 Y122.213 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I-1.213 J-.102 P1  F30000
G1 X140.602 Y130.987 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1974
G1 X142.398 Y130.987 E.05957
G1 X142.398 Y137.398 E.21265
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y131.047 E.21066
G1 X140.21 Y130.62 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1974
G1 X140.21 Y130.595 E.00077
G1 X142.79 Y130.595 E.07928
G1 X142.79 Y130.62 E.00077
G1 X142.79 Y137.79 E.22031
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.68 E.21846
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y130.595 E-.03229
G1 X142.125 Y130.595 E-.72771
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I-.693 J-1 P1  F30000
G1 X140.994 Y131.379 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1974
G1 X140.994 Y137.006 E.17288
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.379 E.17288
G1 X141.054 Y131.379 E.02924
G1 X141.341 Y131.727 F30000
; LINE_WIDTH: 0.360223
G1 F1974
G1 X141.341 Y136.659 E.12752
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.727 E.12752
G1 X141.401 Y131.727 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.727 E-.09778
G1 X141.659 Y133.469 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L106
M991 S0 P105 ;notify layer change
G17
G3 Z21.4 I.139 J-1.209 P1  F30000
G1 X119.398 Y130.902 Z21.4
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1996
G1 X119.398 Y137.398 E.21547
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y130.902 E.21547
G1 X119.338 Y130.902 E.05758
G1 X119.79 Y130.554 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1996
G1 X119.79 Y137.79 E.22233
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.554 E.22233
G1 X117.21 Y130.51 E.00135
G1 X119.774 Y130.51 E.07878
M204 S10000
; WIPE_START
G1 F24000
G1 X119.778 Y132.51 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I1.027 J-.653 P1  F30000
G1 X119.006 Y131.295 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1996
G1 X117.994 Y131.295 E.03109
G1 X117.994 Y137.006 E.17549
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.355 E.17365
G1 X118.659 Y131.642 F30000
; LINE_WIDTH: 0.360223
G1 F1996
G1 X118.341 Y131.642 E.0082
G1 X118.341 Y136.659 E.12972
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.702 E.12817
; WIPE_START
G1 F24000
G1 X118.659 Y133.702 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I1.212 J.104 P1  F30000
G1 X119.398 Y125.098 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1996
G1 X117.602 Y125.098 E.05957
G1 X117.602 Y118.602 E.21547
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y125.038 E.21348
G1 X119.79 Y125.446 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1996
G1 X119.79 Y125.49 E.00135
G1 X117.21 Y125.49 E.07928
G1 X117.21 Y125.446 E.00135
G1 X117.21 Y118.21 E.22233
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.386 E.22049
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y125.49 E-.03949
G1 X117.894 Y125.49 E-.72051
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I.701 J.995 P1  F30000
G1 X119.006 Y124.705 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1996
G1 X119.006 Y118.994 E.17549
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.705 E.17549
G1 X118.946 Y124.705 E.02924
G1 X118.659 Y124.358 F30000
; LINE_WIDTH: 0.360223
G1 F1996
G1 X118.659 Y119.341 E.12972
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.358 E.12972
G1 X118.599 Y124.358 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.358 E-.09778
G1 X118.341 Y122.616 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y125.098 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1996
G1 X140.602 Y118.602 E.21547
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y125.098 E.21547
G1 X140.662 Y125.098 E.05758
G1 X140.21 Y125.446 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1996
G1 X140.21 Y118.21 E.22233
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.446 E.22233
G1 X142.79 Y125.49 E.00135
G1 X140.226 Y125.49 E.07878
M204 S10000
; WIPE_START
G1 F24000
G1 X140.222 Y123.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I-1.027 J.653 P1  F30000
G1 X140.994 Y124.705 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1996
G1 X142.006 Y124.705 E.03109
G1 X142.006 Y118.994 E.17549
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.645 E.17365
G1 X141.341 Y124.358 F30000
; LINE_WIDTH: 0.360223
G1 F1996
G1 X141.659 Y124.358 E.0082
G1 X141.659 Y119.341 E.12972
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.298 E.12817
; WIPE_START
G1 F24000
G1 X141.341 Y122.298 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I-1.212 J-.104 P1  F30000
G1 X140.602 Y130.902 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1996
G1 X142.398 Y130.902 E.05957
G1 X142.398 Y137.398 E.21547
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y130.962 E.21348
G1 X140.21 Y130.554 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1996
G1 X140.21 Y130.51 E.00135
G1 X142.79 Y130.51 E.07928
G1 X142.79 Y130.554 E.00135
G1 X142.79 Y137.79 E.22233
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.614 E.22049
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y130.51 E-.03948
G1 X142.106 Y130.51 E-.72052
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I-.701 J-.995 P1  F30000
G1 X140.994 Y131.295 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1996
G1 X140.994 Y137.006 E.17549
G1 X142.006 Y137.006 E.03109
M73 P61 R13
G1 X142.006 Y131.295 E.17549
G1 X141.054 Y131.295 E.02924
G1 X141.341 Y131.642 F30000
; LINE_WIDTH: 0.360223
G1 F1996
G1 X141.341 Y136.659 E.12972
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.642 E.12972
G1 X141.401 Y131.642 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 21.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y131.642 E-.09778
G1 X141.659 Y133.384 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L107
M991 S0 P106 ;notify layer change
G17
G3 Z21.6 I.141 J-1.209 P1  F30000
G1 X119.398 Y130.795 Z21.6
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2024
G1 X119.398 Y137.398 E.21903
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y130.795 E.21903
G1 X119.338 Y130.795 E.05758
G1 X119.79 Y130.469 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2024
G1 X119.79 Y137.79 E.22494
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.469 E.22494
G1 X117.21 Y130.403 E.00204
G1 X119.79 Y130.403 E.07928
G1 X119.79 Y130.409 E.0002
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y132.409 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I1.024 J-.657 P1  F30000
G1 X119.006 Y131.187 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2024
G1 X117.994 Y131.187 E.03109
G1 X117.994 Y137.006 E.17879
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.247 E.17695
G1 X118.659 Y131.534 F30000
; LINE_WIDTH: 0.360223
G1 F2024
G1 X118.341 Y131.534 E.0082
G1 X118.341 Y136.659 E.13249
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.594 E.13094
; WIPE_START
G1 F24000
G1 X118.659 Y133.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I1.212 J.107 P1  F30000
G1 X119.398 Y125.205 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2024
G1 X117.602 Y125.205 E.05957
G1 X117.602 Y118.602 E.21903
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y125.145 E.21704
G1 X119.79 Y125.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2024
G1 X119.79 Y125.597 E.00204
G1 X117.21 Y125.597 E.07928
G1 X117.21 Y125.531 E.00204
G1 X117.21 Y118.21 E.22494
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.471 E.2231
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y125.597 E-.04801
G1 X117.916 Y125.597 E-.71199
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I.711 J.988 P1  F30000
G1 X119.006 Y124.813 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2024
G1 X119.006 Y118.994 E.17879
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.813 E.17879
G1 X118.946 Y124.813 E.02924
G1 X118.659 Y124.466 F30000
; LINE_WIDTH: 0.360223
G1 F2024
G1 X118.659 Y119.341 E.13249
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.466 E.13249
G1 X118.599 Y124.466 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.466 E-.09778
G1 X118.341 Y122.723 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y125.205 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2024
G1 X140.602 Y118.602 E.21903
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y125.205 E.21903
G1 X140.662 Y125.205 E.05758
G1 X140.21 Y125.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2024
G1 X140.21 Y118.21 E.22494
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.531 E.22494
G1 X142.79 Y125.597 E.00204
G1 X140.21 Y125.597 E.07928
G1 X140.21 Y125.591 E.00019
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y123.591 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I-1.024 J.657 P1  F30000
G1 X140.994 Y124.813 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2024
M73 P62 R13
G1 X142.006 Y124.813 E.03109
G1 X142.006 Y118.994 E.17879
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.753 E.17695
G1 X141.341 Y124.466 F30000
; LINE_WIDTH: 0.360223
G1 F2024
G1 X141.659 Y124.466 E.0082
G1 X141.659 Y119.341 E.13249
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.406 E.13094
; WIPE_START
G1 F24000
G1 X141.341 Y122.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I-1.212 J-.107 P1  F30000
G1 X140.602 Y130.795 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2024
G1 X142.398 Y130.795 E.05957
G1 X142.398 Y137.398 E.21903
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y130.855 E.21704
G1 X140.21 Y130.469 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2024
G1 X140.21 Y130.403 E.00204
G1 X142.79 Y130.403 E.07928
G1 X142.79 Y130.469 E.00204
G1 X142.79 Y137.79 E.22494
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.529 E.2231
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y130.403 E-.04801
G1 X142.084 Y130.403 E-.71199
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I-.711 J-.988 P1  F30000
G1 X140.994 Y131.187 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2024
G1 X140.994 Y137.006 E.17879
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.187 E.17879
G1 X141.054 Y131.187 E.02924
G1 X141.341 Y131.534 F30000
; LINE_WIDTH: 0.360223
G1 F2024
G1 X141.341 Y136.659 E.13249
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.534 E.13249
G1 X141.401 Y131.534 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 21.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.534 E-.09778
G1 X141.659 Y133.277 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L108
M991 S0 P107 ;notify layer change
G17
G3 Z21.8 I.142 J-1.209 P1  F30000
G1 X119.398 Y130.663 Z21.8
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2060
G1 X119.398 Y137.398 E.2234
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y130.663 E.2234
G1 X119.338 Y130.663 E.05758
G1 X119.79 Y130.362 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2060
G1 X119.79 Y137.79 E.22824
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.28 E.23076
G1 X119.79 Y130.28 E.07928
G1 X119.79 Y130.302 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y132.302 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I1.03 J-.648 P1  F30000
G1 X119.006 Y131.055 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2060
G1 X117.994 Y131.055 E.03109
G1 X117.994 Y137.006 E.18284
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y131.115 E.181
G1 X118.659 Y131.403 F30000
; LINE_WIDTH: 0.360223
G1 F2060
G1 X118.341 Y131.403 E.0082
G1 X118.341 Y136.659 E.1359
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.463 E.13435
; WIPE_START
G1 F24000
G1 X118.659 Y133.463 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I1.212 J.11 P1  F30000
G1 X119.398 Y125.337 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2060
G1 X117.602 Y125.337 E.05957
G1 X117.602 Y118.602 E.2234
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y125.277 E.22141
G1 X119.79 Y125.72 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2060
G1 X117.21 Y125.72 E.07928
G1 X117.21 Y125.638 E.00252
G1 X117.21 Y118.21 E.22824
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.66 E.22892
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y125.706 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I.646 J1.031 P1  F30000
G1 X119.006 Y124.945 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2060
G1 X119.006 Y118.994 E.18284
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y124.945 E.18284
G1 X118.946 Y124.945 E.02924
G1 X118.659 Y124.597 F30000
; LINE_WIDTH: 0.360223
G1 F2060
G1 X118.659 Y119.341 E.1359
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.597 E.1359
G1 X118.599 Y124.597 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.597 E-.09778
G1 X118.341 Y122.855 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I-.135 J1.209 P1  F30000
G1 X140.602 Y125.337 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2060
G1 X140.602 Y118.602 E.2234
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y125.337 E.2234
G1 X140.662 Y125.337 E.05758
G1 X140.21 Y125.638 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2060
G1 X140.21 Y118.21 E.22824
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.72 E.23076
G1 X140.21 Y125.72 E.07928
G1 X140.21 Y125.698 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y123.698 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I-1.03 J.648 P1  F30000
G1 X140.994 Y124.945 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2060
G1 X142.006 Y124.945 E.03109
G1 X142.006 Y118.994 E.18284
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y124.885 E.181
G1 X141.341 Y124.597 F30000
; LINE_WIDTH: 0.360223
G1 F2060
G1 X141.659 Y124.597 E.0082
G1 X141.659 Y119.341 E.1359
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.537 E.13435
; WIPE_START
G1 F24000
G1 X141.341 Y122.537 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I-1.212 J-.11 P1  F30000
G1 X140.602 Y130.663 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2060
G1 X142.398 Y130.663 E.05957
G1 X142.398 Y137.398 E.2234
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y130.723 E.22141
G1 X140.21 Y130.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2060
G1 X142.79 Y130.28 E.07928
G1 X142.79 Y130.362 E.00252
G1 X142.79 Y137.79 E.22824
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.34 E.22892
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y130.294 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I-.646 J-1.031 P1  F30000
G1 X140.994 Y131.055 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2060
G1 X140.994 Y137.006 E.18284
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y131.055 E.18284
G1 X141.054 Y131.055 E.02924
G1 X141.341 Y131.403 F30000
; LINE_WIDTH: 0.360223
G1 F2060
G1 X141.341 Y136.659 E.1359
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.403 E.1359
G1 X141.401 Y131.403 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 21.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y131.403 E-.09778
G1 X141.659 Y133.145 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L109
M991 S0 P108 ;notify layer change
G17
G3 Z22 I.144 J-1.208 P1  F30000
G1 X119.398 Y130.502 Z22
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2099
G1 X119.398 Y137.398 E.22876
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y130.502 E.22876
G1 X119.338 Y130.502 E.05758
G1 X119.79 Y130.23 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2099
G1 X119.79 Y137.79 E.23229
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y130.148 E.23481
G1 X117.21 Y130.11 E.00118
G1 X119.79 Y130.11 E.07928
G1 X119.79 Y130.148 E.00118
G1 X119.79 Y130.17 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y132.17 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I1.037 J-.637 P1  F30000
G1 X119.006 Y130.894 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2099
G1 X117.994 Y130.894 E.03109
G1 X117.994 Y137.006 E.1878
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y130.954 E.18596
G1 X118.659 Y131.241 F30000
; LINE_WIDTH: 0.360223
G1 F2099
G1 X118.341 Y131.241 E.0082
G1 X118.341 Y136.659 E.14008
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.301 E.13853
; WIPE_START
G1 F24000
G1 X118.659 Y133.301 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I1.212 J.115 P1  F30000
G1 X119.398 Y125.498 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2099
G1 X117.602 Y125.498 E.05957
G1 X117.602 Y118.602 E.22876
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y125.438 E.22677
G1 X119.79 Y125.852 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2099
G1 X119.79 Y125.89 E.00118
G1 X117.21 Y125.89 E.07928
G1 X117.21 Y125.852 E.00118
G1 X117.21 Y125.77 E.00252
G1 X117.21 Y118.21 E.23229
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.792 E.23297
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y125.89 E-.03745
G1 X117.889 Y125.89 E-.72255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I.699 J.996 P1  F30000
G1 X119.006 Y125.106 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2099
G1 X119.006 Y118.994 E.1878
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y125.106 E.1878
G1 X118.946 Y125.106 E.02924
G1 X118.659 Y124.759 F30000
; LINE_WIDTH: 0.360223
G1 F2099
G1 X118.659 Y119.341 E.14008
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.759 E.14008
G1 X118.599 Y124.759 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.759 E-.09778
G1 X118.341 Y123.016 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I-.135 J1.209 P1  F30000
G1 X140.602 Y125.498 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2099
G1 X140.602 Y118.602 E.22876
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y125.498 E.22876
G1 X140.662 Y125.498 E.05758
G1 X140.21 Y125.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2099
G1 X140.21 Y118.21 E.23229
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y125.852 E.23481
G1 X142.79 Y125.89 E.00118
G1 X140.21 Y125.89 E.07928
G1 X140.21 Y125.852 E.00118
G1 X140.21 Y125.83 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y123.83 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I-1.037 J.637 P1  F30000
G1 X140.994 Y125.106 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2099
G1 X142.006 Y125.106 E.03109
G1 X142.006 Y118.994 E.1878
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y125.046 E.18596
G1 X141.341 Y124.759 F30000
; LINE_WIDTH: 0.360223
G1 F2099
G1 X141.659 Y124.759 E.0082
G1 X141.659 Y119.341 E.14008
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.699 E.13853
; WIPE_START
G1 F24000
G1 X141.341 Y122.699 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I-1.212 J-.115 P1  F30000
G1 X140.602 Y130.502 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2099
G1 X142.398 Y130.502 E.05957
G1 X142.398 Y137.398 E.22876
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y130.562 E.22677
G1 X140.21 Y130.148 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2099
G1 X140.21 Y130.11 E.00118
G1 X142.79 Y130.11 E.07928
G1 X142.79 Y130.148 E.00118
G1 X142.79 Y130.23 E.00252
G1 X142.79 Y137.79 E.23229
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.208 E.23297
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y130.11 E-.03745
G1 X142.111 Y130.11 E-.72255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I-.699 J-.996 P1  F30000
G1 X140.994 Y130.894 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2099
G1 X140.994 Y137.006 E.1878
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y130.894 E.1878
G1 X141.054 Y130.894 E.02924
G1 X141.341 Y131.241 F30000
; LINE_WIDTH: 0.360223
G1 F2099
G1 X141.341 Y136.659 E.14008
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.241 E.14008
G1 X141.401 Y131.241 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 22
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.241 E-.09778
G1 X141.659 Y132.984 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L110
M991 S0 P109 ;notify layer change
G17
G3 Z22.2 I.146 J-1.208 P1  F30000
G1 X119.398 Y130.302 Z22.2
M73 P63 R13
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2150
G1 X119.398 Y137.398 E.23538
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y130.302 E.23538
G1 X119.338 Y130.302 E.05758
G1 X119.79 Y130.069 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2150
G1 X119.79 Y137.79 E.23725
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y129.987 E.23977
G1 X117.21 Y129.91 E.00235
G1 X119.79 Y129.91 E.07928
G1 X119.79 Y129.987 E.00235
G1 X119.79 Y130.009 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y132.009 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I1.045 J-.624 P1  F30000
G1 X119.006 Y130.694 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2150
G1 X117.994 Y130.694 E.03109
G1 X117.994 Y137.006 E.19393
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y130.754 E.19209
G1 X118.659 Y131.042 F30000
; LINE_WIDTH: 0.360223
G1 F2150
G1 X118.341 Y131.042 E.0082
G1 X118.341 Y136.659 E.14524
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y131.102 E.14369
; WIPE_START
G1 F24000
G1 X118.659 Y133.102 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I1.211 J.121 P1  F30000
G1 X119.398 Y125.698 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2150
G1 X117.602 Y125.698 E.05957
G1 X117.602 Y118.602 E.23538
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y125.638 E.23339
G1 X119.79 Y126.013 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2150
G1 X119.79 Y126.09 E.00235
G1 X117.21 Y126.09 E.07928
G1 X117.21 Y126.013 E.00235
G1 X117.21 Y125.931 E.00252
G1 X117.21 Y118.21 E.23725
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y125.953 E.23793
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y126.09 E-.05187
G1 X117.927 Y126.09 E-.70813
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I.715 J.985 P1  F30000
G1 X119.006 Y125.306 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2150
G1 X119.006 Y118.994 E.19394
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y125.306 E.19394
G1 X118.946 Y125.306 E.02924
G1 X118.659 Y124.958 F30000
; LINE_WIDTH: 0.360223
G1 F2150
G1 X118.659 Y119.341 E.14524
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y124.958 E.14524
G1 X118.599 Y124.958 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y124.958 E-.09778
G1 X118.341 Y123.216 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I-.135 J1.209 P1  F30000
G1 X140.602 Y125.698 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2150
G1 X140.602 Y118.602 E.23538
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y125.698 E.23538
G1 X140.662 Y125.698 E.05758
G1 X140.21 Y125.931 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2150
G1 X140.21 Y118.21 E.23725
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y126.013 E.23977
G1 X142.79 Y126.09 E.00235
G1 X140.21 Y126.09 E.07928
G1 X140.21 Y126.013 E.00235
G1 X140.21 Y125.991 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y123.991 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I-1.045 J.624 P1  F30000
G1 X140.994 Y125.306 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2150
G1 X142.006 Y125.306 E.03109
G1 X142.006 Y118.994 E.19394
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y125.246 E.19209
G1 X141.341 Y124.958 F30000
; LINE_WIDTH: 0.360223
G1 F2150
G1 X141.659 Y124.958 E.0082
G1 X141.659 Y119.341 E.14524
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y124.898 E.14369
; WIPE_START
G1 F24000
G1 X141.341 Y122.898 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I-1.211 J-.121 P1  F30000
G1 X140.602 Y130.302 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2150
G1 X142.398 Y130.302 E.05957
G1 X142.398 Y137.398 E.23538
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y130.362 E.23339
G1 X140.21 Y129.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2150
G1 X140.21 Y129.91 E.00235
G1 X142.79 Y129.91 E.07928
G1 X142.79 Y129.987 E.00235
G1 X142.79 Y130.069 E.00252
G1 X142.79 Y137.79 E.23725
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y130.047 E.23793
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y129.91 E-.05187
G1 X142.074 Y129.91 E-.70813
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I-.715 J-.985 P1  F30000
G1 X140.994 Y130.694 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2150
G1 X140.994 Y137.006 E.19393
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y130.694 E.19393
G1 X141.054 Y130.694 E.02924
G1 X141.341 Y131.042 F30000
; LINE_WIDTH: 0.360223
G1 F2150
G1 X141.341 Y136.659 E.14524
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y131.042 E.14524
G1 X141.401 Y131.042 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 22.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y131.042 E-.09778
G1 X141.659 Y132.784 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L111
M991 S0 P110 ;notify layer change
G17
G3 Z22.4 I.149 J-1.208 P1  F30000
G1 X119.398 Y130.047 Z22.4
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2196
G1 X119.398 Y137.398 E.24383
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y130.047 E.24383
G1 X119.338 Y130.047 E.05758
G1 X119.79 Y129.869 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2196
G1 X119.79 Y137.79 E.24338
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y129.869 E.24338
G1 X117.21 Y129.705 E.00504
M106 S255
G1 F1800
G1 X117.21 Y129.655 E.00154
G1 X119.79 Y129.655 E.07928
G1 X119.79 Y129.705 E.00154
M106 S252.45
G1 F2196
G1 X119.79 Y129.809 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y131.809 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.6 I1.056 J-.605 P1  F30000
G1 X119.006 Y130.439 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2196
G1 X117.994 Y130.439 E.03109
G1 X117.994 Y137.006 E.20177
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y130.499 E.19993
G1 X118.659 Y130.787 F30000
; LINE_WIDTH: 0.360223
G1 F2196
G1 X118.341 Y130.787 E.0082
G1 X118.341 Y136.659 E.15183
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y130.847 E.15028
; WIPE_START
G1 F24000
G1 X118.659 Y132.847 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.6 I1.21 J.13 P1  F30000
G1 X119.398 Y125.953 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2196
G1 X117.602 Y125.953 E.05957
G1 X117.602 Y118.602 E.24383
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y125.893 E.24184
G1 X119.79 Y126.131 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2196
G1 X119.79 Y126.295 E.00504
M106 S255
G1 F1800
G1 X119.79 Y126.345 E.00154
G1 X117.21 Y126.345 E.07928
G1 X117.21 Y126.295 E.00154
M106 S252.45
G1 F2196
G1 X117.21 Y126.131 E.00504
G1 X117.21 Y118.21 E.24339
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y126.071 E.24154
M204 S10000
G1 X119.006 Y125.561 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2196
G1 X119.006 Y118.994 E.20177
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y125.561 E.20177
G1 X118.946 Y125.561 E.02924
G1 X118.659 Y125.213 F30000
; LINE_WIDTH: 0.360223
G1 F2196
G1 X118.659 Y119.341 E.15183
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y125.213 E.15183
G1 X118.599 Y125.213 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y125.213 E-.09778
G1 X118.341 Y123.471 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.6 I-.135 J1.209 P1  F30000
G1 X140.602 Y125.953 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2196
G1 X140.602 Y118.602 E.24383
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y125.953 E.24383
G1 X140.662 Y125.953 E.05758
G1 X140.21 Y126.131 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2196
G1 X140.21 Y118.21 E.24339
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y126.131 E.24339
G1 X142.79 Y126.295 E.00504
M106 S255
G1 F1800
G1 X142.79 Y126.345 E.00154
G1 X140.21 Y126.345 E.07928
G1 X140.21 Y126.295 E.00154
M106 S252.45
G1 F2196
G1 X140.21 Y126.191 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y124.191 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.6 I-1.056 J.605 P1  F30000
G1 X140.994 Y125.561 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2196
G1 X142.006 Y125.561 E.03109
G1 X142.006 Y118.994 E.20177
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y125.501 E.19993
G1 X141.341 Y125.213 F30000
; LINE_WIDTH: 0.360223
G1 F2196
G1 X141.659 Y125.213 E.0082
G1 X141.659 Y119.341 E.15183
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y125.153 E.15028
; WIPE_START
G1 F24000
G1 X141.341 Y123.153 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.6 I-1.21 J-.13 P1  F30000
G1 X140.602 Y130.047 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2196
G1 X142.398 Y130.047 E.05957
G1 X142.398 Y137.398 E.24383
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y130.107 E.24184
G1 X140.21 Y129.869 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2196
G1 X140.21 Y129.705 E.00504
M106 S255
G1 F1800
G1 X140.21 Y129.655 E.00154
G1 X142.79 Y129.655 E.07928
G1 X142.79 Y129.705 E.00154
M106 S252.45
G1 F2196
G1 X142.79 Y129.869 E.00504
G1 X142.79 Y137.79 E.24338
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y129.929 E.24154
M204 S10000
G1 X140.994 Y130.439 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2196
G1 X140.994 Y137.006 E.20177
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y130.439 E.20177
G1 X141.054 Y130.439 E.02924
G1 X141.341 Y130.787 F30000
; LINE_WIDTH: 0.360223
G1 F2196
G1 X141.341 Y136.659 E.15183
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y130.787 E.15183
G1 X141.401 Y130.787 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 22.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y130.787 E-.09778
G1 X141.659 Y132.529 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L112
M991 S0 P111 ;notify layer change
G17
G3 Z22.6 I.153 J-1.207 P1  F30000
G1 X119.398 Y129.701 Z22.6
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2488
G1 X119.398 Y137.398 E.25531
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y129.701 E.25531
G1 X119.338 Y129.701 E.05758
G1 X119.79 Y129.614 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2488
G1 X119.79 Y137.79 E.25122
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y129.614 E.25122
G1 X117.21 Y129.368 E.00756
M106 S255
G1 F600
G1 X117.21 Y129.309 E.00181
G1 X119.79 Y129.309 E.07928
G1 X119.79 Y129.368 E.00181
M106 S252.45
G1 F2488
G1 X119.79 Y129.554 E.00572
M204 S10000
G1 X119.006 Y130.093 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2488
G1 X117.994 Y130.093 E.03109
G1 X117.994 Y137.006 E.2124
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y130.153 E.21055
G1 X118.659 Y130.441 F30000
; LINE_WIDTH: 0.360223
G1 F2488
G1 X118.341 Y130.441 E.0082
G1 X118.341 Y136.659 E.16077
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y130.501 E.15922
; WIPE_START
G1 F24000
G1 X118.659 Y132.501 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.8 I1.208 J.144 P1  F30000
G1 X119.398 Y126.299 Z22.8
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2488
G1 X117.602 Y126.299 E.05957
G1 X117.602 Y118.602 E.25531
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y126.239 E.25332
G1 X119.79 Y126.386 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2488
G1 X119.79 Y126.632 E.00756
M106 S255
G1 F600
G1 X119.79 Y126.691 E.00181
G1 X117.21 Y126.691 E.07928
G1 X117.21 Y126.632 E.00181
M106 S252.45
G1 F2488
G1 X117.21 Y126.386 E.00756
G1 X117.21 Y118.21 E.25122
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y126.326 E.24938
M204 S10000
G1 X119.006 Y125.907 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2488
G1 X119.006 Y118.994 E.2124
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y125.907 E.2124
G1 X118.946 Y125.907 E.02924
G1 X118.659 Y125.559 F30000
; LINE_WIDTH: 0.360223
M73 P64 R13
G1 F2488
G1 X118.659 Y119.341 E.16077
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y125.559 E.16077
G1 X118.599 Y125.559 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y125.559 E-.09778
G1 X118.341 Y123.817 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.8 I-.135 J1.209 P1  F30000
G1 X140.602 Y126.299 Z22.8
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2488
G1 X140.602 Y118.602 E.25531
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y126.299 E.25531
G1 X140.662 Y126.299 E.05758
G1 X140.21 Y126.386 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2488
G1 X140.21 Y118.21 E.25122
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y126.386 E.25122
G1 X142.79 Y126.632 E.00756
M106 S255
G1 F600
G1 X142.79 Y126.691 E.00181
G1 X140.21 Y126.691 E.07928
G1 X140.21 Y126.632 E.00181
M106 S252.45
G1 F2488
G1 X140.21 Y126.446 E.00572
M204 S10000
G1 X140.994 Y125.907 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2488
G1 X142.006 Y125.907 E.03109
G1 X142.006 Y118.994 E.2124
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y125.847 E.21055
G1 X141.341 Y125.559 F30000
; LINE_WIDTH: 0.360223
G1 F2488
G1 X141.659 Y125.559 E.0082
G1 X141.659 Y119.341 E.16077
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y125.499 E.15922
; WIPE_START
G1 F24000
G1 X141.341 Y123.499 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.8 I-1.208 J-.144 P1  F30000
G1 X140.602 Y129.701 Z22.8
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2488
G1 X142.398 Y129.701 E.05957
G1 X142.398 Y137.398 E.25531
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y129.761 E.25332
G1 X140.21 Y129.614 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2488
G1 X140.21 Y129.368 E.00756
M106 S255
G1 F600
G1 X140.21 Y129.309 E.00181
G1 X142.79 Y129.309 E.07928
G1 X142.79 Y129.368 E.00181
M106 S252.45
G1 F2488
G1 X142.79 Y129.614 E.00756
G1 X142.79 Y137.79 E.25122
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y129.674 E.24938
M204 S10000
G1 X140.994 Y130.093 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2488
G1 X140.994 Y137.006 E.2124
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y130.093 E.2124
G1 X141.054 Y130.093 E.02924
G1 X141.341 Y130.441 F30000
; LINE_WIDTH: 0.360223
G1 F2488
G1 X141.341 Y136.659 E.16077
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y130.441 E.16077
G1 X141.401 Y130.441 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.659 Y130.441 E-.09778
G1 X141.659 Y132.183 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L113
M991 S0 P112 ;notify layer change
G17
G3 Z22.8 I.146 J-1.208 P1  F30000
G1 X119.398 Y129.495 Z22.8
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2444
G1 X119.398 Y137.398 E.26216
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y129.112 E.27486
M106 S255
G1 F1800
G1 X119.398 Y129.112 E.05957
M106 S252.45
G1 F2444
G1 X119.398 Y129.282 E.00564
G1 X119.398 Y129.435 E.00507
G1 X119.79 Y129.495 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2444
G1 X119.79 Y137.79 E.25489
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y128.899 E.27319
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X117.21 Y128.709 E.00633
G1 X119.79 Y128.709 E.08558
G1 X119.79 Y128.899 E.00633
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2444
G1 X119.79 Y129.268 E.01134
G1 X119.79 Y129.435 E.00511
M204 S10000
G1 X119.006 Y129.493 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2444
G1 X117.994 Y129.493 E.03109
G1 X117.994 Y137.006 E.23086
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y129.553 E.22902
G1 X118.659 Y129.84 F30000
; LINE_WIDTH: 0.360223
G1 F2444
G1 X118.341 Y129.84 E.0082
G1 X118.341 Y136.659 E.17631
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y129.9 E.17476
; WIPE_START
G1 F24000
G1 X118.659 Y131.9 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I1.215 J.068 P1  F30000
G1 X119.398 Y118.602 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2444
G1 X119.398 Y126.888 E.27486
M106 S255
G1 F1800
G1 X117.602 Y126.888 E.05957
M106 S252.45
G1 F2444
G1 X117.602 Y126.718 E.00564
G1 X117.602 Y118.602 E.26923
G1 X119.338 Y118.602 E.05758
G1 X119.79 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2444
G1 X119.79 Y127.101 E.27319
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.79 Y127.292 E.00633
G1 X117.21 Y127.292 E.08558
G1 X117.21 Y127.101 E.00633
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2444
G1 X117.21 Y126.732 E.01134
G1 X117.21 Y118.21 E.26185
G1 X119.73 Y118.21 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.743 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I-1.209 J-.142 P1  F30000
G1 X119.006 Y126.507 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2444
G1 X119.006 Y118.994 E.23086
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y126.507 E.23086
G1 X118.946 Y126.507 E.02924
G1 X118.659 Y126.16 F30000
; LINE_WIDTH: 0.360223
G1 F2444
G1 X118.659 Y119.341 E.17631
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y126.16 E.17631
G1 X118.599 Y126.16 E.00665
; WIPE_START
M73 P64 R12
G1 F24000
G1 X118.341 Y126.16 E-.09778
G1 X118.341 Y124.417 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I-.079 J1.214 P1  F30000
G1 X140.602 Y125.863 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2444
G1 X140.602 Y118.602 E.24086
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y126.888 E.27486
M106 S255
G1 F1800
G1 X140.602 Y126.888 E.05957
M106 S252.45
G1 F2444
G1 X140.602 Y126.718 E.00564
G1 X140.602 Y125.923 E.02637
G1 X140.21 Y125.863 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2444
G1 X140.21 Y118.21 E.23516
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y127.101 E.27319
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.79 Y127.292 E.00633
G1 X140.21 Y127.292 E.08558
G1 X140.21 Y127.101 E.00633
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2444
G1 X140.21 Y126.732 E.01134
G1 X140.21 Y125.923 E.02484
M204 S10000
G1 X140.994 Y126.507 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2444
G1 X142.006 Y126.507 E.03109
G1 X142.006 Y118.994 E.23086
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y126.447 E.22902
G1 X141.341 Y126.16 F30000
; LINE_WIDTH: 0.360223
G1 F2444
G1 X141.659 Y126.16 E.0082
G1 X141.659 Y119.341 E.17631
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y126.1 E.17476
; WIPE_START
G1 F24000
G1 X141.341 Y124.1 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I-1.215 J-.068 P1  F30000
G1 X140.602 Y137.398 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2444
G1 X140.602 Y129.112 E.27486
M106 S255
G1 F1800
G1 X142.398 Y129.112 E.05957
M106 S252.45
G1 F2444
G1 X142.398 Y129.282 E.00564
G1 X142.398 Y137.398 E.26923
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2444
G1 X140.21 Y128.899 E.27319
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.21 Y128.709 E.00633
G1 X142.79 Y128.709 E.08558
G1 X142.79 Y128.899 E.00633
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2444
G1 X142.79 Y129.268 E.01134
G1 X142.79 Y137.79 E.26185
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.257 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I1.209 J.142 P1  F30000
G1 X140.994 Y129.493 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2444
G1 X140.994 Y137.006 E.23086
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y129.493 E.23086
G1 X141.054 Y129.493 E.02924
G1 X141.341 Y129.84 F30000
; LINE_WIDTH: 0.360223
G1 F2444
G1 X141.341 Y136.659 E.17631
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y129.84 E.17631
G1 X141.401 Y129.84 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 22.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.659 Y129.84 E-.09778
G1 X141.659 Y131.583 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L114
M991 S0 P113 ;notify layer change
G17
G3 Z23 I-1.197 J-.218 P1  F30000
G1 X140.602 Y137.398 Z23
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2405
G1 X140.602 Y128.299 E.30184
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X140.602 Y127.702 E.0198
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2405
G1 X140.602 Y118.602 E.30184
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y127.702 E.30184
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.398 Y128.299 E.0198
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2405
G1 X142.398 Y128.681 E.01269
G1 X142.398 Y137.398 E.28916
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2405
G1 X140.21 Y128.299 E.29165
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.21 Y127.702 E.0198
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2405
G1 X140.21 Y118.21 E.29165
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y127.702 E.29165
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.79 Y128.299 E.0198
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2405
G1 X142.79 Y128.668 E.01134
G1 X142.79 Y137.79 E.28031
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.257 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.2 I1.208 J.145 P1  F30000
G1 X140.994 Y129.647 Z23.2
G1 Z22.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2405
G1 X140.994 Y137.006 E.22612
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y129.647 E.22612
G1 X141.054 Y129.647 E.02924
G1 X141.341 Y129.994 F30000
; LINE_WIDTH: 0.360223
G1 F2405
G1 X141.341 Y136.659 E.17232
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y129.994 E.17232
G1 X141.401 Y129.994 E.00665
G1 X141.878 Y129.44 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.495415
M106 S255
G1 F3000
G1 X141.878 Y126.73 E.09991
G1 X141.426 Y126.73 E.01668
G1 X141.426 Y129.27 E.09365
G1 X140.973 Y129.27 E.01668
G1 X140.973 Y126.56 E.09991
M106 S252.45
G1 X140.994 Y126.353 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2405
G1 X142.006 Y126.353 E.03109
G1 X142.006 Y118.994 E.22612
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y126.293 E.22427
G1 X141.341 Y126.006 F30000
; LINE_WIDTH: 0.360223
G1 F2405
G1 X141.659 Y126.006 E.0082
G1 X141.659 Y119.341 E.17232
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y125.946 E.17077
; WIPE_START
G1 F24000
G1 X141.341 Y123.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.2 I-.294 J-1.181 P1  F30000
G1 X119.398 Y129.417 Z23.2
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2405
G1 X119.398 Y137.398 E.26474
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y128.299 E.30184
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X117.602 Y127.702 E.0198
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2405
G1 X117.602 Y118.602 E.30184
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y127.702 E.30184
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X119.398 Y128.299 E.0198
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2405
G1 X119.398 Y128.681 E.01269
G1 X119.398 Y129.357 E.02243
G1 X119.79 Y129.417 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2405
G1 X119.79 Y137.79 E.25728
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y128.299 E.29165
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X117.21 Y127.702 E.0198
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2405
G1 X117.21 Y118.21 E.29165
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y127.702 E.29165
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.79 Y128.299 E.0198
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2405
G1 X119.79 Y128.668 E.01134
G1 X119.79 Y129.357 E.02119
M204 S10000
G1 X119.006 Y129.647 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2405
G1 X117.994 Y129.647 E.03109
G1 X117.994 Y137.006 E.22612
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y129.707 E.22427
G1 X118.659 Y129.994 F30000
; LINE_WIDTH: 0.360223
G1 F2405
G1 X118.341 Y129.994 E.0082
G1 X118.341 Y136.659 E.17232
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y130.054 E.17077
G1 X118.878 Y129.44 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.495415
M106 S255
G1 F3000
G1 X118.878 Y126.73 E.09991
G1 X118.426 Y126.73 E.01668
G1 X118.426 Y129.27 E.09365
G1 X117.973 Y129.27 E.01668
G1 X117.973 Y126.56 E.09991
M106 S252.45
G1 X119.006 Y126.353 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2405
G1 X119.006 Y118.994 E.22612
G1 X117.994 Y118.994 E.03109
M73 P65 R12
G1 X117.994 Y126.353 E.22612
G1 X118.946 Y126.353 E.02924
G1 X118.659 Y126.006 F30000
; LINE_WIDTH: 0.360223
G1 F2405
G1 X118.659 Y119.341 E.17232
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y126.006 E.17232
G1 X118.599 Y126.006 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 23
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.341 Y126.006 E-.09778
G1 X118.341 Y124.263 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L115
M991 S0 P114 ;notify layer change
G17
G3 Z23.2 I-.618 J1.048 P1  F30000
G1 X140.602 Y137.398 Z23.2
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1839
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1839
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.4 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z23.4
G1 Z23
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1839
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y130.177 E.03641
G1 X141.481 Y130.177 E.0176
G1 X140.994 Y126.215 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1839
G1 X140.994 Y129.785 E.10968
G1 X142.006 Y129.785 E.03109
G1 X142.006 Y126.215 E.10968
G1 X141.054 Y126.215 E.02924
G1 X141.341 Y126.562 F30000
; LINE_WIDTH: 0.360223
G1 F1839
G1 X141.341 Y129.438 E.07434
G1 X141.659 Y129.438 E.0082
G1 X141.659 Y126.562 E.07434
G1 X141.401 Y126.562 E.00665
G1 X141.481 Y125.823 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1839
G1 X140.95 Y125.823 E.0176
G1 X140.95 Y124.726 E.03641
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.4 I-.297 J-1.18 P1  F30000
G1 X119.398 Y129.343 Z23.4
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1839
G1 X119.398 Y137.398 E.26721
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y129.283 E.35429
G1 X119.79 Y129.343 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1839
G1 X119.79 Y137.79 E.25957
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y129.283 E.34023
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y131.283 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.4 I.799 J-.918 P1  F30000
G1 X118.519 Y130.177 Z23.4
G1 Z23
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1839
G1 X119.05 Y130.177 E.0176
G1 X119.05 Y131.274 E.03641
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y134.03 E.05401
G1 X119.006 Y126.215 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1839
G1 X117.994 Y126.215 E.03109
G1 X117.994 Y129.785 E.10968
G1 X119.006 Y129.785 E.03109
G1 X119.006 Y126.275 E.10783
G1 X118.659 Y126.562 F30000
; LINE_WIDTH: 0.360223
G1 F1839
G1 X118.341 Y126.562 E.0082
G1 X118.341 Y129.438 E.07434
G1 X118.659 Y129.438 E.0082
G1 X118.659 Y126.622 E.07279
G1 X118.519 Y125.823 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1839
G1 X119.05 Y125.823 E.0176
G1 X119.05 Y124.726 E.03641
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L116
M991 S0 P115 ;notify layer change
G17
G3 Z23.4 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z23.4
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1839
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1839
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.6 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z23.6
G1 Z23.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1839
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y130.177 E.03641
G1 X141.481 Y130.177 E.0176
G1 X140.994 Y126.215 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1839
G1 X140.994 Y129.785 E.10968
G1 X142.006 Y129.785 E.03109
G1 X142.006 Y126.215 E.10968
G1 X141.054 Y126.215 E.02924
G1 X141.341 Y126.562 F30000
; LINE_WIDTH: 0.360223
G1 F1839
G1 X141.341 Y129.438 E.07434
G1 X141.659 Y129.438 E.0082
G1 X141.659 Y126.562 E.07434
G1 X141.401 Y126.562 E.00665
G1 X141.481 Y125.823 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1839
G1 X140.95 Y125.823 E.0176
G1 X140.95 Y124.726 E.03641
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.6 I-.293 J-1.181 P1  F30000
G1 X119.398 Y129.271 Z23.6
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1839
G1 X119.398 Y137.398 E.26957
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y129.211 E.35193
G1 X119.79 Y129.271 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1839
G1 X119.79 Y137.79 E.26175
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y129.211 E.33804
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y131.211 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.6 I.768 J-.944 P1  F30000
G1 X118.519 Y130.177 Z23.6
G1 Z23.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1839
G1 X119.05 Y130.177 E.0176
G1 X119.05 Y131.274 E.03641
G1 X117.95 Y132.374 E.05157
G1 X117.95 Y131.302 E.03554
G1 X119.05 Y132.402 E.05157
G1 X119.05 Y134.03 E.05401
G1 X119.006 Y126.215 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1839
G1 X117.994 Y126.215 E.03109
G1 X117.994 Y129.785 E.10968
G1 X119.006 Y129.785 E.03109
G1 X119.006 Y126.275 E.10783
G1 X118.659 Y126.562 F30000
; LINE_WIDTH: 0.360223
G1 F1839
G1 X118.341 Y126.562 E.0082
G1 X118.341 Y129.438 E.07434
G1 X118.659 Y129.438 E.0082
G1 X118.659 Y126.622 E.07279
G1 X118.519 Y125.823 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1839
G1 X119.05 Y125.823 E.0176
G1 X119.05 Y124.726 E.03641
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L117
M991 S0 P116 ;notify layer change
G17
G3 Z23.6 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z23.6
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1641
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1641
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z23.8
G1 Z23.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1641
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I-.29 J-1.182 P1  F30000
G1 X119.398 Y129.204 Z23.8
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1641
G1 X119.398 Y137.398 E.2718
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y129.144 E.3497
G1 X119.79 Y129.204 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1641
G1 X119.79 Y137.79 E.26382
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y129.144 E.33598
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y131.144 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I-1.179 J-.302 P1  F30000
G1 X119.05 Y134.03 Z23.8
M73 P66 R12
G1 Z23.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1641
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L118
M991 S0 P117 ;notify layer change
G17
G3 Z23.8 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z23.8
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1641
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1641
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1641
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24 I-.286 J-1.183 P1  F30000
G1 X119.398 Y129.141 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1641
G1 X119.398 Y137.398 E.27388
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y129.081 E.34762
G1 X119.79 Y129.141 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1641
G1 X119.79 Y137.79 E.26574
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y129.081 E.33405
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y131.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24 I-1.18 J-.296 P1  F30000
G1 X119.05 Y134.03 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1641
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 119/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L119
M991 S0 P118 ;notify layer change
G17
G3 Z24 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z24
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.2 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z24.2
G1 Z23.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.2 I-.642 J-1.034 P1  F30000
G1 X119.398 Y137.398 Z24.2
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.2 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z24.2
G1 Z23.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 120/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L120
M991 S0 P119 ;notify layer change
G17
G3 Z24.2 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z24.2
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.4 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X140.95 Y132.402 E.05401
M73 P67 R12
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.4 I-.642 J-1.034 P1  F30000
G1 X119.398 Y137.398 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.4 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P67 R11
G1 F1646
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 121/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L121
M991 S0 P120 ;notify layer change
G17
G3 Z24.4 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z24.4
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.6 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z24.6
G1 Z24.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.6 I-.642 J-1.034 P1  F30000
G1 X119.398 Y137.398 Z24.6
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.6 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z24.6
G1 Z24.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L122
M991 S0 P121 ;notify layer change
G17
G3 Z24.6 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z24.6
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.8 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z24.8
G1 Z24.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.8 I-.642 J-1.034 P1  F30000
G1 X119.398 Y137.398 Z24.8
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.8 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z24.8
G1 Z24.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X119.05 Y132.402 E.05401
M73 P68 R11
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 123/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L123
M991 S0 P122 ;notify layer change
G17
G3 Z24.8 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z24.8
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z25
G1 Z24.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25 I-.642 J-1.034 P1  F30000
G1 X119.398 Y137.398 Z25
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z25
G1 Z24.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 124/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L124
M991 S0 P123 ;notify layer change
G17
G3 Z25 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z25
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.2 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z25.2
G1 Z24.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.2 I-.642 J-1.034 P1  F30000
G1 X119.398 Y137.398 Z25.2
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.2 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z25.2
G1 Z24.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L125
M991 S0 P124 ;notify layer change
G17
G3 Z25.2 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z25.2
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.4 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z25.4
G1 Z25
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
M73 P69 R11
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.4 I-.642 J-1.034 P1  F30000
G1 X119.398 Y137.398 Z25.4
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.4 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z25.4
G1 Z25
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 126/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L126
M991 S0 P125 ;notify layer change
G17
G3 Z25.4 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z25.4
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.6 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z25.6
G1 Z25.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.6 I-.642 J-1.034 P1  F30000
G1 X119.398 Y137.398 Z25.6
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.6 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z25.6
G1 Z25.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 127/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L127
M991 S0 P126 ;notify layer change
G17
G3 Z25.6 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z25.6
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.8 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z25.8
G1 Z25.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.8 I-.642 J-1.034 P1  F30000
G1 X119.398 Y137.398 Z25.8
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.8 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z25.8
G1 Z25.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P69 R10
G1 F1646
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
M73 P70 R10
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 128/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L128
M991 S0 P127 ;notify layer change
G17
G3 Z25.8 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z25.8
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z26
G1 Z25.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26 I-.642 J-1.034 P1  F30000
G1 X119.398 Y137.398 Z26
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z26
G1 Z25.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 129/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L129
M991 S0 P128 ;notify layer change
G17
G3 Z26 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z26
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.2 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z26.2
G1 Z25.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.2 I-.642 J-1.034 P1  F30000
G1 X119.398 Y137.398 Z26.2
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.2 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z26.2
G1 Z25.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 130/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L130
M991 S0 P129 ;notify layer change
G17
G3 Z26.2 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z26.2
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2341
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2341
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.4 I1.209 J.136 P1  F30000
G1 X140.994 Y129.285 Z26.4
G1 Z26
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2341
G1 X140.994 Y136.715 E.22829
G1 X142.006 Y136.715 E.03109
G1 X142.006 Y129.285 E.22829
G1 X141.054 Y129.285 E.02924
G1 X141.341 Y129.632 F30000
; LINE_WIDTH: 0.360223
G1 F2341
G1 X141.341 Y136.368 E.17415
G1 X141.659 Y136.368 E.0082
M73 P71 R10
G1 X141.659 Y129.632 E.17415
G1 X141.401 Y129.632 E.00665
G1 X140.994 Y126.715 F30000
; LINE_WIDTH: 0.419999
G1 F2341
G1 X142.006 Y126.715 E.03109
G1 X142.006 Y119.285 E.22829
G1 X140.994 Y119.285 E.03109
G1 X140.994 Y126.655 E.22645
G1 X141.341 Y126.368 F30000
; LINE_WIDTH: 0.360223
G1 F2341
G1 X141.659 Y126.368 E.0082
G1 X141.659 Y119.632 E.17415
G1 X141.341 Y119.632 E.0082
G1 X141.341 Y126.308 E.1726
; WIPE_START
G1 F24000
G1 X141.341 Y124.308 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.4 I-.623 J-1.045 P1  F30000
G1 X119.398 Y137.398 Z26.4
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2341
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2341
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.4 I1.205 J.172 P1  F30000
G1 X119.006 Y129.285 Z26.4
G1 Z26
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2341
G1 X117.994 Y129.285 E.03109
G1 X117.994 Y136.715 E.22829
G1 X119.006 Y136.715 E.03109
G1 X119.006 Y129.345 E.22645
G1 X118.659 Y129.632 F30000
; LINE_WIDTH: 0.360223
G1 F2341
G1 X118.341 Y129.632 E.0082
G1 X118.341 Y136.368 E.17415
G1 X118.659 Y136.368 E.0082
G1 X118.659 Y129.692 E.1726
G1 X119.006 Y126.715 F30000
; LINE_WIDTH: 0.419999
G1 F2341
G1 X119.006 Y119.285 E.22829
G1 X117.994 Y119.285 E.03109
G1 X117.994 Y126.715 E.22829
G1 X118.946 Y126.715 E.02924
G1 X118.659 Y126.368 F30000
; LINE_WIDTH: 0.360223
G1 F2341
G1 X118.659 Y119.632 E.17415
G1 X118.341 Y119.632 E.0082
G1 X118.341 Y126.368 E.17415
G1 X118.599 Y126.368 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 26.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.341 Y126.368 E-.09778
G1 X118.341 Y124.625 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 131/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L131
M991 S0 P130 ;notify layer change
G17
G3 Z26.4 I-.606 J1.056 P1  F30000
G1 X140.602 Y137.398 Z26.4
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2341
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2341
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.6 I1.209 J.136 P1  F30000
G1 X140.994 Y129.285 Z26.6
G1 Z26.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2341
G1 X140.994 Y136.715 E.22829
G1 X142.006 Y136.715 E.03109
G1 X142.006 Y129.285 E.22829
G1 X141.054 Y129.285 E.02924
G1 X141.341 Y129.632 F30000
; LINE_WIDTH: 0.360223
G1 F2341
G1 X141.341 Y136.368 E.17415
G1 X141.659 Y136.368 E.0082
G1 X141.659 Y129.632 E.17415
G1 X141.401 Y129.632 E.00665
G1 X140.994 Y126.715 F30000
; LINE_WIDTH: 0.419999
G1 F2341
G1 X142.006 Y126.715 E.03109
G1 X142.006 Y119.285 E.22829
G1 X140.994 Y119.285 E.03109
G1 X140.994 Y126.655 E.22645
G1 X141.341 Y126.368 F30000
; LINE_WIDTH: 0.360223
G1 F2341
G1 X141.659 Y126.368 E.0082
G1 X141.659 Y119.632 E.17415
G1 X141.341 Y119.632 E.0082
G1 X141.341 Y126.308 E.1726
; WIPE_START
G1 F24000
G1 X141.341 Y124.308 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.6 I-.623 J-1.045 P1  F30000
G1 X119.398 Y137.398 Z26.6
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2341
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2341
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.6 I1.205 J.172 P1  F30000
G1 X119.006 Y129.285 Z26.6
G1 Z26.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2341
G1 X117.994 Y129.285 E.03109
G1 X117.994 Y136.715 E.22829
G1 X119.006 Y136.715 E.03109
G1 X119.006 Y129.345 E.22645
G1 X118.659 Y129.632 F30000
; LINE_WIDTH: 0.360223
G1 F2341
G1 X118.341 Y129.632 E.0082
G1 X118.341 Y136.368 E.17415
G1 X118.659 Y136.368 E.0082
G1 X118.659 Y129.692 E.1726
G1 X119.006 Y126.715 F30000
; LINE_WIDTH: 0.419999
G1 F2341
G1 X119.006 Y119.285 E.22829
G1 X117.994 Y119.285 E.03109
G1 X117.994 Y126.715 E.22829
G1 X118.946 Y126.715 E.02924
G1 X118.659 Y126.368 F30000
; LINE_WIDTH: 0.360223
G1 F2341
G1 X118.659 Y119.632 E.17415
G1 X118.341 Y119.632 E.0082
G1 X118.341 Y126.368 E.17415
G1 X118.599 Y126.368 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 26.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X118.341 Y126.368 E-.09778
G1 X118.341 Y124.625 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 132/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L132
M991 S0 P131 ;notify layer change
G17
G3 Z26.6 I-.606 J1.056 P1  F30000
G1 X140.602 Y137.398 Z26.6
G1 Z26.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.8 I-.892 J.828 P1  F30000
G1 X141.007 Y136.59 Z26.8
G1 Z26.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.445801
G1 F2715
G1 X141.007 Y136.993 E.01323
G1 X141.993 Y136.993 E.03237
G1 X141.993 Y136.59 E.01323
G1 X141.067 Y136.59 E.0304
G1 X141.628 Y136.37 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2715
G1 X142.176 Y135.822 E.0238
G1 X142.176 Y135.289
G1 X141.095 Y136.37 E.04698
G1 X140.824 Y136.107
G1 X142.176 Y134.755 E.05871
G1 X142.176 Y134.222
G1 X140.824 Y135.573 E.05871
G1 X140.824 Y135.04
G1 X142.176 Y133.689 E.05871
G1 X142.176 Y133.156
G1 X140.824 Y134.507 E.05871
G1 X140.824 Y133.973
G1 X142.176 Y132.622 E.05871
G1 X142.176 Y132.089
G1 X140.824 Y133.44 E.05871
G1 X140.824 Y132.907
G1 X142.176 Y131.556 E.05871
G1 X142.176 Y131.023
G1 X140.824 Y132.374 E.05871
G1 X140.824 Y131.84
G1 X142.176 Y130.489 E.05871
G1 X142.176 Y129.956
G1 X140.824 Y131.307 E.05871
G1 X140.824 Y130.774
G1 X141.968 Y129.63 E.0497
G1 X141.435 Y129.63
G1 X140.824 Y130.241 E.02652
M204 S10000
G1 X142.105 Y129.886 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.157344
G1 F2715
G1 X142.14 Y129.802 E.00085
G1 X142.14 Y129.611 E.00178
G1 X140.994 Y129.423 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2715
G1 X142.006 Y129.423 E.03109
G1 X142.006 Y126.577 E.08744
G1 X140.994 Y126.577 E.03109
G1 X140.994 Y129.363 E.0856
G1 X141.341 Y129.076 F30000
; LINE_WIDTH: 0.360223
G1 F2715
G1 X141.659 Y129.076 E.0082
G1 X141.659 Y126.924 E.05562
G1 X141.341 Y126.924 E.0082
G1 X141.341 Y129.016 E.05407
G1 X142.176 Y125.69 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2715
G1 X141.496 Y126.37 E.02954
G1 X140.962 Y126.37
G1 X142.176 Y125.157 E.05272
G1 X142.176 Y124.623
G1 X140.824 Y125.974 E.05871
G1 X140.824 Y125.441
G1 X142.176 Y124.09 E.05871
G1 X142.176 Y123.557
G1 X140.824 Y124.908 E.05871
G1 X140.824 Y124.375
G1 X142.176 Y123.024 E.05871
G1 X142.176 Y122.49
G1 X140.824 Y123.841 E.05871
G1 X140.824 Y123.308
G1 X142.176 Y121.957 E.05871
G1 X142.176 Y121.424
G1 X140.824 Y122.775 E.05871
G1 X140.824 Y122.242
G1 X142.176 Y120.89 E.05871
G1 X142.176 Y120.357
G1 X140.824 Y121.708 E.05871
G1 X140.824 Y121.175
G1 X142.176 Y119.824 E.05871
G1 X141.836 Y119.63
M73 P72 R10
G1 X140.824 Y120.642 E.04395
G1 X140.824 Y120.108
G1 X141.303 Y119.63 E.02078
M204 S10000
G1 X141.007 Y119.41 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.445802
G1 F2715
G1 X141.993 Y119.41 E.03237
G1 X141.993 Y119.007 E.01323
G1 X141.007 Y119.007 E.03237
G1 X141.007 Y119.35 E.01126
; WIPE_START
G1 F24000
G1 X141.007 Y119.007 E-.13029
G1 X141.993 Y119.007 E-.37464
G1 X141.993 Y119.41 E-.1531
G1 X141.725 Y119.41 E-.10197
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.8 I-.764 J-.948 P1  F30000
G1 X119.398 Y137.398 Z26.8
G1 Z26.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.8 I.855 J.866 P1  F30000
G1 X118.993 Y136.59 Z26.8
G1 Z26.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.445802
G1 F2715
G1 X118.007 Y136.59 E.03237
G1 X118.007 Y136.993 E.01323
G1 X118.993 Y136.993 E.03237
G1 X118.993 Y136.65 E.01126
G1 X118.697 Y136.37 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2715
G1 X119.176 Y135.891 E.02079
G1 X119.176 Y135.358
G1 X118.164 Y136.37 E.04396
G1 X117.824 Y136.176
G1 X119.176 Y134.825 E.05871
G1 X119.176 Y134.292
G1 X117.824 Y135.643 E.05871
G1 X117.824 Y135.109
G1 X119.176 Y133.758 E.05871
G1 X119.176 Y133.225
G1 X117.824 Y134.576 E.05871
G1 X117.824 Y134.043
G1 X119.176 Y132.692 E.05871
G1 X119.176 Y132.159
G1 X117.824 Y133.51 E.05871
G1 X117.824 Y132.976
G1 X119.176 Y131.625 E.05871
G1 X119.176 Y131.092
G1 X117.824 Y132.443 E.05871
G1 X117.824 Y131.91
G1 X119.176 Y130.559 E.05871
G1 X119.176 Y130.025
G1 X117.824 Y131.376 E.05871
G1 X117.824 Y130.843
G1 X119.037 Y129.63 E.05271
G1 X118.504 Y129.63
G1 X117.824 Y130.31 E.02954
M204 S10000
G1 X119.006 Y126.577 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2715
G1 X117.994 Y126.577 E.03109
G1 X117.994 Y129.423 E.08744
G1 X119.006 Y129.423 E.03109
G1 X119.006 Y126.637 E.0856
G1 X118.659 Y126.924 F30000
; LINE_WIDTH: 0.360223
G1 F2715
G1 X118.341 Y126.924 E.0082
G1 X118.341 Y129.076 E.05562
G1 X118.659 Y129.076 E.0082
G1 X118.659 Y126.984 E.05407
G1 X119.176 Y125.759 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2715
G1 X118.565 Y126.37 E.02653
G1 X118.032 Y126.37
G1 X119.176 Y125.226 E.0497
G1 X119.176 Y124.693
G1 X117.824 Y126.044 E.05871
G1 X117.824 Y125.511
G1 X119.176 Y124.159 E.05871
G1 X119.176 Y123.626
G1 X117.824 Y124.977 E.05871
G1 X117.824 Y124.444
G1 X119.176 Y123.093 E.05871
G1 X119.176 Y122.56
G1 X117.824 Y123.911 E.05871
G1 X117.824 Y123.377
G1 X119.176 Y122.026 E.05871
G1 X119.176 Y121.493
G1 X117.824 Y122.844 E.05871
G1 X117.824 Y122.311
G1 X119.176 Y120.96 E.05871
G1 X119.176 Y120.427
G1 X117.824 Y121.778 E.05871
G1 X117.824 Y121.244
G1 X119.176 Y119.893 E.05871
G1 X118.905 Y119.63
G1 X117.824 Y120.711 E.04697
G1 X117.824 Y120.178
G1 X118.372 Y119.63 E.0238
M204 S10000
; WIPE_START
G1 F24000
G1 X117.824 Y120.178 E-.29429
G1 X117.824 Y120.711 E-.20264
G1 X118.314 Y120.222 E-.26307
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.8 I-1.214 J-.086 P1  F30000
G1 X117.895 Y126.114 Z26.8
G1 Z26.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.157243
G1 F2715
G1 X117.86 Y126.198 E.00085
G1 X117.86 Y126.389 E.00178
; WIPE_START
G1 F24000
G1 X117.86 Y126.198 E-.51468
G1 X117.895 Y126.114 E-.24532
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.8 I1.201 J.197 P1  F30000
G1 X118.993 Y119.41 Z26.8
G1 Z26.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.445802
G1 F2715
G1 X118.993 Y119.007 E.01323
G1 X118.007 Y119.007 E.03237
G1 X118.007 Y119.41 E.01323
G1 X118.933 Y119.41 E.0304
; CHANGE_LAYER
; Z_HEIGHT: 26.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.007 Y119.41 E-.35184
G1 X118.007 Y119.007 E-.15309
G1 X118.678 Y119.007 E-.25507
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 133/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L133
M991 S0 P132 ;notify layer change
G17
G3 Z26.8 I-1.183 J.284 P1  F30000
G1 X119.398 Y122.009 Z26.8
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2463
G1 X117.602 Y122.009 E.05957
G1 X117.602 Y118.602 E.11302
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.949 E.11103
G1 X119.79 Y122.401 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2463
G1 X117.21 Y122.401 E.07928
G1 X117.21 Y118.21 E.12879
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y122.341 E.12694
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y122.388 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I.652 J1.028 P1  F30000
G1 X119.006 Y121.617 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2463
G1 X119.006 Y118.994 E.0806
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y121.617 E.0806
G1 X118.946 Y121.617 E.02924
G1 X118.659 Y121.27 F30000
; LINE_WIDTH: 0.360223
G1 F2463
G1 X118.659 Y119.341 E.04987
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y121.27 E.04987
G1 X118.599 Y121.27 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y121.27 E-.09778
G1 X118.341 Y119.527 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I-1.184 J.28 P1  F30000
G1 X119.398 Y123.991 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2463
G1 X119.398 Y132.009 E.26599
G1 X117.602 Y132.009 E.05957
G1 X117.602 Y123.991 E.26599
G1 X119.338 Y123.991 E.05758
G1 X119.79 Y123.599 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2463
G1 X119.79 Y132.401 E.27048
G1 X117.21 Y132.401 E.07928
G1 X117.21 Y123.599 E.27048
G1 X119.73 Y123.599 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.744 Y125.599 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I.844 J-.877 P1  F30000
G1 X119.006 Y124.889 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2463
G1 X119.006 Y124.383 E.01554
G1 X117.994 Y124.383 E.03109
G1 X117.994 Y131.617 E.22229
G1 X119.006 Y131.617 E.03109
G1 X119.006 Y124.949 E.20491
G1 X118.659 Y124.889 F30000
; LINE_WIDTH: 0.360223
G1 F2463
G1 X118.659 Y124.73 E.0041
G1 X118.341 Y124.73 E.0082
G1 X118.341 Y131.27 E.1691
G1 X118.659 Y131.27 E.0082
G1 X118.659 Y124.949 E.16345
; WIPE_START
G1 F24000
G1 X118.659 Y126.949 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I-1.214 J.086 P1  F30000
G1 X119.398 Y137.398 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2463
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y133.991 E.11302
G1 X119.398 Y133.991 E.05957
G1 X119.398 Y137.338 E.11103
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2463
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y133.599 E.12879
G1 X119.79 Y133.599 E.07928
G1 X119.79 Y137.73 E.12694
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I1.146 J.41 P1  F30000
G1 X119.006 Y134.383 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2463
G1 X117.994 Y134.383 E.03109
G1 X117.994 Y137.006 E.0806
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y134.443 E.07875
G1 X118.659 Y134.73 F30000
; LINE_WIDTH: 0.360223
G1 F2463
G1 X118.341 Y134.73 E.0082
G1 X118.341 Y136.659 E.04987
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y134.79 E.04832
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.71009
G1 X118.527 Y136.659 E-.04991
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I.146 J1.208 P1  F30000
G1 X140.602 Y133.991 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2463
G1 X142.398 Y133.991 E.05957
G1 X142.398 Y137.398 E.11302
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.051 E.11103
G1 X140.21 Y133.599 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2463
G1 X142.79 Y133.599 E.07928
G1 X142.79 Y137.79 E.12879
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y133.659 E.12694
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y133.612 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I-.652 J-1.028 P1  F30000
G1 X140.994 Y134.383 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2463
G1 X140.994 Y137.006 E.0806
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y134.383 E.0806
G1 X141.054 Y134.383 E.02924
G1 X141.341 Y134.73 F30000
; LINE_WIDTH: 0.360223
G1 F2463
G1 X141.341 Y136.659 E.04987
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y134.73 E.04987
G1 X141.401 Y134.73 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y134.73 E-.09778
G1 X141.659 Y136.473 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I1.213 J-.103 P1  F30000
G1 X140.602 Y123.991 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2463
G1 X142.398 Y123.991 E.05957
G1 X142.398 Y132.009 E.26599
G1 X140.602 Y132.009 E.05957
G1 X140.602 Y124.051 E.264
G1 X140.21 Y123.599 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2463
G1 X142.79 Y123.599 E.07928
G1 X142.79 Y132.401 E.27048
G1 X140.21 Y132.401 E.07928
G1 X140.21 Y123.659 E.26864
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y123.612 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I-1.203 J-.183 P1  F30000
G1 X140.994 Y131.617 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2463
G1 X142.006 Y131.617 E.03109
G1 X142.006 Y124.383 E.22229
G1 X140.994 Y124.383 E.03109
G1 X140.994 Y131.557 E.22045
G1 X141.341 Y131.27 F30000
; LINE_WIDTH: 0.360223
G1 F2463
G1 X141.659 Y131.27 E.0082
G1 X141.659 Y124.73 E.1691
G1 X141.341 Y124.73 E.0082
G1 X141.341 Y131.21 E.16755
; WIPE_START
G1 F24000
G1 X141.341 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I1.211 J-.124 P1  F30000
G1 X140.602 Y122.009 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2463
G1 X140.602 Y118.602 E.11302
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y122.009 E.11302
G1 X140.662 Y122.009 E.05758
G1 X140.21 Y122.401 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2463
G1 X140.21 Y118.21 E.12879
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y122.401 E.12879
G1 X140.27 Y122.401 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.241 Y120.402 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I-1.035 J.641 P1  F30000
G1 X140.994 Y121.617 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2463
M73 P72 R9
G1 X142.006 Y121.617 E.03109
G1 X142.006 Y118.994 E.0806
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y121.557 E.07875
G1 X141.341 Y121.27 F30000
; LINE_WIDTH: 0.360223
G1 F2463
G1 X141.659 Y121.27 E.0082
G1 X141.659 Y119.341 E.04987
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y121.21 E.04832
; CHANGE_LAYER
; Z_HEIGHT: 26.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.71009
G1 X141.473 Y119.341 E-.04991
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 134/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L134
M991 S0 P133 ;notify layer change
G17
G3 Z27 I-.121 J-1.211 P1  F30000
G1 X119.398 Y121.554 Z27
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2238
G1 X117.602 Y121.554 E.05957
G1 X117.602 Y118.602 E.09792
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.494 E.09593
G1 X119.79 Y121.946 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2238
G1 X117.21 Y121.946 E.07928
G1 X117.21 Y118.21 E.1148
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.886 E.11296
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y121.933 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I.652 J1.028 P1  F30000
G1 X119.006 Y121.162 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2238
G1 X119.006 Y118.994 E.06661
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y121.162 E.06661
G1 X118.946 Y121.162 E.02924
G1 X118.659 Y120.815 F30000
; LINE_WIDTH: 0.360223
G1 F2238
G1 X118.659 Y119.341 E.0381
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.815 E.0381
G1 X118.599 Y120.815 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.815 E-.09778
G1 X118.341 Y119.341 E-.55988
G1 X118.611 Y119.341 E-.10235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I-1.213 J-.1 P1  F30000
G1 X117.602 Y131.554 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2238
G1 X117.602 Y124.446 E.23578
G1 X119.398 Y124.446 E.05957
G1 X119.398 Y131.554 E.23578
G1 X117.662 Y131.554 E.05758
G1 X117.21 Y131.946 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2238
G1 X117.21 Y124.054 E.2425
G1 X119.79 Y124.054 E.07928
G1 X119.79 Y131.946 E.2425
G1 X117.27 Y131.946 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.255 Y129.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I1.137 J.433 P1  F30000
G1 X119.006 Y125.344 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2238
G1 X119.006 Y124.838 E.01554
G1 X117.994 Y124.838 E.03109
G1 X117.994 Y131.162 E.19431
G1 X119.006 Y131.162 E.03109
G1 X119.006 Y125.404 E.17693
G1 X118.659 Y125.344 F30000
; LINE_WIDTH: 0.360223
G1 F2238
G1 X118.659 Y125.185 E.0041
G1 X118.341 Y125.185 E.0082
G1 X118.341 Y130.815 E.14556
G1 X118.659 Y130.815 E.0082
G1 X118.659 Y125.404 E.1399
; WIPE_START
G1 F24000
G1 X118.659 Y127.404 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I-1.214 J.09 P1  F30000
G1 X119.398 Y137.398 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2238
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.446 E.09792
G1 X119.398 Y134.446 E.05957
G1 X119.398 Y137.338 E.09593
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2238
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.054 E.1148
G1 X119.79 Y134.054 E.07928
G1 X119.79 Y137.73 E.11296
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I1.125 J.465 P1  F30000
G1 X119.006 Y134.838 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2238
G1 X117.994 Y134.838 E.03109
G1 X117.994 Y137.006 E.06661
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y134.898 E.06477
G1 X118.659 Y135.185 F30000
; LINE_WIDTH: 0.360223
G1 F2238
G1 X118.341 Y135.185 E.0082
G1 X118.341 Y136.659 E.0381
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.245 E.03654
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.53708
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y136.389 E-.10235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I.106 J1.212 P1  F30000
G1 X140.602 Y134.446 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2238
G1 X142.398 Y134.446 E.05957
G1 X142.398 Y137.398 E.09792
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.506 E.09593
G1 X140.21 Y134.054 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2238
G1 X142.79 Y134.054 E.07928
G1 X142.79 Y137.79 E.1148
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.114 E.11296
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.067 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y134.838 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2238
G1 X140.994 Y137.006 E.06661
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y134.838 E.06661
G1 X141.054 Y134.838 E.02924
G1 X141.341 Y135.185 F30000
; LINE_WIDTH: 0.360223
G1 F2238
G1 X141.341 Y136.659 E.0381
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.185 E.0381
G1 X141.401 Y135.185 E.00665
; WIPE_START
M73 P73 R9
G1 F24000
G1 X141.659 Y135.185 E-.09778
G1 X141.659 Y136.659 E-.55988
G1 X141.389 Y136.659 E-.10235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I1.214 J-.078 P1  F30000
G1 X140.602 Y124.446 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2238
G1 X142.398 Y124.446 E.05957
G1 X142.398 Y131.554 E.23578
G1 X140.602 Y131.554 E.05957
G1 X140.602 Y124.506 E.23379
G1 X140.21 Y124.054 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2238
G1 X142.79 Y124.054 E.07928
G1 X142.79 Y131.946 E.2425
G1 X140.21 Y131.946 E.07928
G1 X140.21 Y124.114 E.24066
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y124.067 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I-1.199 J-.205 P1  F30000
G1 X140.994 Y131.162 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2238
G1 X142.006 Y131.162 E.03109
G1 X142.006 Y124.838 E.19431
G1 X140.994 Y124.838 E.03109
G1 X140.994 Y131.102 E.19247
G1 X141.341 Y130.815 F30000
; LINE_WIDTH: 0.360223
G1 F2238
G1 X141.659 Y130.815 E.0082
G1 X141.659 Y125.185 E.14556
G1 X141.341 Y125.185 E.0082
G1 X141.341 Y130.755 E.144
; WIPE_START
G1 F24000
G1 X141.341 Y128.755 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I1.211 J-.124 P1  F30000
G1 X140.602 Y121.554 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2238
G1 X140.602 Y118.602 E.09792
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.554 E.09792
G1 X140.662 Y121.554 E.05758
G1 X140.21 Y121.946 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2238
G1 X140.21 Y118.21 E.1148
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.946 E.1148
G1 X140.27 Y121.946 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.238 Y119.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I-1.033 J.643 P1  F30000
G1 X140.994 Y121.162 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2238
G1 X142.006 Y121.162 E.03109
G1 X142.006 Y118.994 E.06661
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y121.102 E.06477
G1 X141.341 Y120.815 F30000
; LINE_WIDTH: 0.360223
G1 F2238
G1 X141.659 Y120.815 E.0082
G1 X141.659 Y119.341 E.0381
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.755 E.03654
; CHANGE_LAYER
; Z_HEIGHT: 27
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.53708
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y119.611 E-.10235
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 135/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L135
M991 S0 P134 ;notify layer change
G17
G3 Z27.2 I-.092 J-1.213 P1  F30000
G1 X119.398 Y121.306 Z27.2
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2099
G1 X117.602 Y121.306 E.05957
G1 X117.602 Y118.602 E.0897
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.246 E.08771
G1 X119.79 Y121.698 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2099
G1 X117.21 Y121.698 E.07928
G1 X117.21 Y118.21 E.10719
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.638 E.10534
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y121.685 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I.652 J1.028 P1  F30000
G1 X119.006 Y120.914 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2099
G1 X119.006 Y118.994 E.059
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.914 E.059
G1 X118.946 Y120.914 E.02924
G1 X118.659 Y120.567 F30000
; LINE_WIDTH: 0.360223
G1 F2099
G1 X118.659 Y119.341 E.03169
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.567 E.03169
G1 X118.599 Y120.567 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.567 E-.09778
G1 X118.341 Y119.341 E-.46576
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.541 E-.07589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I-1.212 J-.109 P1  F30000
G1 X117.602 Y131.306 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2099
G1 X117.602 Y124.694 E.21935
G1 X119.398 Y124.694 E.05957
G1 X119.398 Y131.306 E.21935
G1 X117.662 Y131.306 E.05758
G1 X117.21 Y131.698 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2099
G1 X117.21 Y124.302 E.22728
G1 X119.79 Y124.302 E.07928
G1 X119.79 Y131.698 E.22728
G1 X117.27 Y131.698 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.254 Y129.698 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I1.119 J.478 P1  F30000
G1 X119.006 Y125.592 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2099
G1 X119.006 Y125.086 E.01554
G1 X117.994 Y125.086 E.03109
G1 X117.994 Y130.914 E.17909
G1 X119.006 Y130.914 E.03109
G1 X119.006 Y125.652 E.1617
G1 X118.659 Y125.592 F30000
; LINE_WIDTH: 0.360223
G1 F2099
G1 X118.659 Y125.433 E.0041
G1 X118.341 Y125.433 E.0082
G1 X118.341 Y130.567 E.13275
G1 X118.659 Y130.567 E.0082
G1 X118.659 Y125.652 E.12709
; WIPE_START
G1 F24000
G1 X118.659 Y127.652 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I-1.213 J.092 P1  F30000
G1 X119.398 Y137.398 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2099
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.694 E.0897
G1 X119.398 Y134.694 E.05957
G1 X119.398 Y137.338 E.08771
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2099
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.302 E.10719
G1 X119.79 Y134.302 E.07928
G1 X119.79 Y137.73 E.10534
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I1.109 J.501 P1  F30000
G1 X119.006 Y135.086 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2099
G1 X117.994 Y135.086 E.03109
G1 X117.994 Y137.006 E.059
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.146 E.05715
G1 X118.659 Y135.433 F30000
; LINE_WIDTH: 0.360223
G1 F2099
G1 X118.341 Y135.433 E.0082
G1 X118.341 Y136.659 E.03169
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.493 E.03014
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.44296
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y136.142 E-.19647
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I.079 J1.214 P1  F30000
G1 X140.602 Y134.694 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2099
G1 X142.398 Y134.694 E.05957
G1 X142.398 Y137.398 E.0897
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.754 E.08771
G1 X140.21 Y134.302 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2099
G1 X142.79 Y134.302 E.07928
G1 X142.79 Y137.79 E.10719
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.362 E.10534
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.086 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2099
G1 X140.994 Y137.006 E.059
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.086 E.059
G1 X141.054 Y135.086 E.02924
G1 X141.341 Y135.433 F30000
; LINE_WIDTH: 0.360223
G1 F2099
G1 X141.341 Y136.659 E.03169
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.433 E.03169
G1 X141.401 Y135.433 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.433 E-.09778
G1 X141.659 Y136.659 E-.46576
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.459 E-.07589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I1.215 J-.076 P1  F30000
G1 X140.602 Y124.694 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2099
G1 X142.398 Y124.694 E.05957
G1 X142.398 Y131.306 E.21935
G1 X140.602 Y131.306 E.05957
G1 X140.602 Y124.754 E.21736
G1 X140.21 Y124.302 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2099
G1 X142.79 Y124.302 E.07928
G1 X142.79 Y131.698 E.22728
G1 X140.21 Y131.698 E.07928
G1 X140.21 Y124.362 E.22544
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y124.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y125.086 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2099
G1 X140.994 Y130.914 E.17909
G1 X142.006 Y130.914 E.03109
G1 X142.006 Y125.086 E.17909
G1 X141.054 Y125.086 E.02924
G1 X141.341 Y125.433 F30000
; LINE_WIDTH: 0.360223
G1 F2099
G1 X141.341 Y130.567 E.13275
G1 X141.659 Y130.567 E.0082
G1 X141.659 Y125.433 E.13275
G1 X141.401 Y125.433 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y125.433 E-.09778
G1 X141.659 Y127.176 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I1.198 J-.216 P1  F30000
G1 X140.602 Y121.306 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2099
G1 X140.602 Y118.602 E.0897
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.306 E.0897
G1 X140.662 Y121.306 E.05758
G1 X140.21 Y121.698 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2099
G1 X140.21 Y118.21 E.10719
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.698 E.10719
G1 X140.27 Y121.698 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.236 Y119.699 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I-1.032 J.644 P1  F30000
G1 X140.994 Y120.914 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2099
G1 X142.006 Y120.914 E.03109
G1 X142.006 Y118.994 E.059
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.854 E.05715
G1 X141.341 Y120.567 F30000
; LINE_WIDTH: 0.360223
G1 F2099
G1 X141.659 Y120.567 E.0082
G1 X141.659 Y119.341 E.03169
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.507 E.03014
; CHANGE_LAYER
; Z_HEIGHT: 27.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.44296
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y119.858 E-.19647
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 136/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L136
M991 S0 P135 ;notify layer change
G17
G3 Z27.4 I-.07 J-1.215 P1  F30000
G1 X119.398 Y121.137 Z27.4
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2012
G1 X117.602 Y121.137 E.05957
G1 X117.602 Y118.602 E.08407
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.077 E.08208
G1 X119.79 Y121.529 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2012
G1 X117.21 Y121.529 E.07928
G1 X117.21 Y118.21 E.10197
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.469 E.10013
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y121.515 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I.652 J1.028 P1  F30000
G1 X119.006 Y120.744 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2012
G1 X119.006 Y118.994 E.05378
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.744 E.05378
G1 X118.946 Y120.744 E.02924
G1 X118.659 Y120.397 F30000
; LINE_WIDTH: 0.360223
G1 F2012
G1 X118.659 Y119.341 E.0273
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.397 E.0273
G1 X118.599 Y120.397 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.397 E-.09778
G1 X118.341 Y119.341 E-.40126
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.711 E-.14039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I-1.212 J-.112 P1  F30000
G1 X117.602 Y131.137 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2012
G1 X117.602 Y124.863 E.20809
G1 X119.398 Y124.863 E.05957
G1 X119.398 Y131.137 E.20809
G1 X117.662 Y131.137 E.05758
G1 X117.21 Y131.529 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2012
G1 X117.21 Y124.471 E.21685
G1 X119.79 Y124.471 E.07928
G1 X119.79 Y131.529 E.21685
G1 X117.27 Y131.529 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.253 Y129.529 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I1.103 J.513 P1  F30000
G1 X119.006 Y125.761 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2012
G1 X119.006 Y125.256 E.01554
G1 X117.994 Y125.256 E.03109
G1 X117.994 Y130.744 E.16866
G1 X119.006 Y130.744 E.03109
G1 X119.006 Y125.821 E.15127
G1 X118.659 Y125.761 F30000
; LINE_WIDTH: 0.360223
G1 F2012
G1 X118.659 Y125.603 E.0041
G1 X118.341 Y125.603 E.0082
G1 X118.341 Y130.397 E.12397
G1 X118.659 Y130.397 E.0082
G1 X118.659 Y125.821 E.11832
; WIPE_START
G1 F24000
G1 X118.659 Y127.821 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I-1.213 J.094 P1  F30000
G1 X119.398 Y137.398 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2012
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.863 E.08407
G1 X119.398 Y134.863 E.05957
G1 X119.398 Y137.338 E.08208
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2012
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.471 E.10197
G1 X119.79 Y134.471 E.07928
G1 X119.79 Y137.73 E.10013
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I1.096 J.528 P1  F30000
G1 X119.006 Y135.256 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2012
G1 X117.994 Y135.256 E.03109
G1 X117.994 Y137.006 E.05378
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.316 E.05194
G1 X118.659 Y135.603 F30000
; LINE_WIDTH: 0.360223
G1 F2012
G1 X118.341 Y135.603 E.0082
G1 X118.341 Y136.659 E.0273
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.663 E.02575
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.37846
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.972 E-.26097
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I.061 J1.215 P1  F30000
G1 X140.602 Y134.863 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2012
G1 X142.398 Y134.863 E.05957
G1 X142.398 Y137.398 E.08407
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.923 E.08208
G1 X140.21 Y134.471 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2012
G1 X142.79 Y134.471 E.07928
G1 X142.79 Y137.79 E.10197
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.531 E.10013
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.485 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.256 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2012
G1 X140.994 Y137.006 E.05378
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.256 E.05378
G1 X141.054 Y135.256 E.02924
G1 X141.341 Y135.603 F30000
; LINE_WIDTH: 0.360223
G1 F2012
G1 X141.341 Y136.659 E.0273
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.603 E.0273
G1 X141.401 Y135.603 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.603 E-.09778
G1 X141.659 Y136.659 E-.40126
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.289 E-.14039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I1.214 J-.079 P1  F30000
G1 X140.602 Y124.863 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2012
G1 X142.398 Y124.863 E.05957
G1 X142.398 Y131.137 E.20809
G1 X140.602 Y131.137 E.05957
G1 X140.602 Y124.923 E.2061
G1 X140.21 Y124.471 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2012
G1 X142.79 Y124.471 E.07928
G1 X142.79 Y131.529 E.21685
G1 X140.21 Y131.529 E.07928
G1 X140.21 Y124.531 E.21501
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y124.485 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I-1.195 J-.232 P1  F30000
G1 X140.994 Y130.744 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2012
G1 X142.006 Y130.744 E.03109
G1 X142.006 Y125.256 E.16866
G1 X140.994 Y125.256 E.03109
G1 X140.994 Y130.684 E.16682
G1 X141.341 Y130.397 F30000
; LINE_WIDTH: 0.360223
G1 F2012
G1 X141.659 Y130.397 E.0082
G1 X141.659 Y125.603 E.12397
G1 X141.341 Y125.603 E.0082
G1 X141.341 Y130.337 E.12242
; WIPE_START
G1 F24000
G1 X141.341 Y128.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I1.211 J-.124 P1  F30000
G1 X140.602 Y121.137 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2012
G1 X140.602 Y118.602 E.08407
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.137 E.08407
G1 X140.662 Y121.137 E.05758
G1 X140.21 Y121.529 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2012
G1 X140.21 Y118.21 E.10197
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.529 E.10197
G1 X140.27 Y121.529 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.234 Y119.529 E-.76
; WIPE_END
M73 P74 R9
G1 E-.04 F1800
G17
G3 Z27.6 I-1.032 J.645 P1  F30000
G1 X140.994 Y120.744 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2012
G1 X142.006 Y120.744 E.03109
G1 X142.006 Y118.994 E.05378
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.684 E.05194
G1 X141.341 Y120.397 F30000
; LINE_WIDTH: 0.360223
G1 F2012
G1 X141.659 Y120.397 E.0082
G1 X141.659 Y119.341 E.0273
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.337 E.02575
; CHANGE_LAYER
; Z_HEIGHT: 27.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.37846
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.028 E-.26097
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 137/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L137
M991 S0 P136 ;notify layer change
G17
G3 Z27.6 I-.054 J-1.216 P1  F30000
G1 X119.398 Y121.016 Z27.6
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1946
G1 X117.602 Y121.016 E.05957
G1 X117.602 Y118.602 E.08006
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.956 E.07807
G1 X119.79 Y121.408 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1946
G1 X117.21 Y121.408 E.07928
G1 X117.21 Y118.21 E.09825
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.348 E.09641
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y121.394 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I.652 J1.028 P1  F30000
G1 X119.006 Y120.623 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1946
G1 X119.006 Y118.994 E.05006
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.623 E.05006
G1 X118.946 Y120.623 E.02924
G1 X118.659 Y120.276 F30000
; LINE_WIDTH: 0.360223
G1 F1946
G1 X118.659 Y119.341 E.02417
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.276 E.02417
G1 X118.599 Y120.276 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.276 E-.09778
G1 X118.341 Y119.341 E-.35526
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.832 E-.18639
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I-1.212 J-.114 P1  F30000
G1 X117.602 Y131.016 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1946
G1 X117.602 Y124.984 E.20006
G1 X119.398 Y124.984 E.05957
G1 X119.398 Y131.016 E.20006
G1 X117.662 Y131.016 E.05758
G1 X117.21 Y131.408 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1946
G1 X117.21 Y124.592 E.20941
G1 X119.79 Y124.592 E.07928
G1 X119.79 Y131.408 E.20941
G1 X117.27 Y131.408 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.252 Y129.408 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I1.09 J.542 P1  F30000
G1 X119.006 Y125.882 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1946
G1 X119.006 Y125.377 E.01554
G1 X117.994 Y125.377 E.03109
G1 X117.994 Y130.623 E.16122
G1 X119.006 Y130.623 E.03109
G1 X119.006 Y125.942 E.14383
G1 X118.659 Y125.882 F30000
; LINE_WIDTH: 0.360223
G1 F1946
G1 X118.659 Y125.724 E.0041
G1 X118.341 Y125.724 E.0082
G1 X118.341 Y130.276 E.11771
G1 X118.659 Y130.276 E.0082
G1 X118.659 Y125.942 E.11206
; WIPE_START
G1 F24000
G1 X118.659 Y127.942 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I-1.213 J.095 P1  F30000
G1 X119.398 Y137.398 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1946
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.984 E.08006
G1 X119.398 Y134.984 E.05957
G1 X119.398 Y137.338 E.07807
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1946
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.592 E.09825
G1 X119.79 Y134.592 E.07928
G1 X119.79 Y137.73 E.09641
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I1.086 J.55 P1  F30000
G1 X119.006 Y135.377 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1946
G1 X117.994 Y135.377 E.03109
G1 X117.994 Y137.006 E.05006
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.437 E.04822
G1 X118.659 Y135.724 F30000
; LINE_WIDTH: 0.360223
G1 F1946
G1 X118.341 Y135.724 E.0082
G1 X118.341 Y136.659 E.02417
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.784 E.02262
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.33246
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.851 E-.30697
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I.047 J1.216 P1  F30000
G1 X140.602 Y134.984 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1946
G1 X142.398 Y134.984 E.05957
G1 X142.398 Y137.398 E.08006
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.044 E.07807
G1 X140.21 Y134.592 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1946
G1 X142.79 Y134.592 E.07928
G1 X142.79 Y137.79 E.09825
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.652 E.09641
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.606 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.377 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1946
G1 X140.994 Y137.006 E.05006
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.377 E.05006
G1 X141.054 Y135.377 E.02924
G1 X141.341 Y135.724 F30000
; LINE_WIDTH: 0.360223
G1 F1946
G1 X141.341 Y136.659 E.02417
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.724 E.02417
G1 X141.401 Y135.724 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.724 E-.09778
G1 X141.659 Y136.659 E-.35526
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.168 E-.18639
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I1.214 J-.08 P1  F30000
G1 X140.602 Y124.984 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1946
G1 X142.398 Y124.984 E.05957
G1 X142.398 Y131.016 E.20006
G1 X140.602 Y131.016 E.05957
G1 X140.602 Y125.044 E.19807
G1 X140.21 Y124.592 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1946
G1 X142.79 Y124.592 E.07928
G1 X142.79 Y131.408 E.20941
G1 X140.21 Y131.408 E.07928
G1 X140.21 Y124.652 E.20757
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y124.606 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I-1.193 J-.241 P1  F30000
G1 X140.994 Y130.623 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1946
G1 X142.006 Y130.623 E.03109
G1 X142.006 Y125.377 E.16122
G1 X140.994 Y125.377 E.03109
G1 X140.994 Y130.563 E.15938
G1 X141.341 Y130.276 F30000
; LINE_WIDTH: 0.360223
G1 F1946
G1 X141.659 Y130.276 E.0082
G1 X141.659 Y125.724 E.11771
G1 X141.341 Y125.724 E.0082
G1 X141.341 Y130.216 E.11616
; WIPE_START
G1 F24000
G1 X141.341 Y128.216 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I1.211 J-.124 P1  F30000
G1 X140.602 Y121.016 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1946
G1 X140.602 Y118.602 E.08006
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.016 E.08006
G1 X140.662 Y121.016 E.05758
G1 X140.21 Y121.408 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1946
G1 X140.21 Y118.21 E.09825
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.408 E.09825
G1 X140.27 Y121.408 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.232 Y119.408 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I-1.031 J.646 P1  F30000
G1 X140.994 Y120.623 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1946
G1 X142.006 Y120.623 E.03109
G1 X142.006 Y118.994 E.05006
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.563 E.04822
G1 X141.341 Y120.276 F30000
; LINE_WIDTH: 0.360223
G1 F1946
G1 X141.659 Y120.276 E.0082
G1 X141.659 Y119.341 E.02417
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.216 E.02262
; CHANGE_LAYER
; Z_HEIGHT: 27.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.33246
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.149 E-.30697
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 138/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L138
M991 S0 P137 ;notify layer change
G17
G3 Z27.8 I-.043 J-1.216 P1  F30000
G1 X119.398 Y120.931 Z27.8
G1 Z27.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1900
G1 X117.602 Y120.931 E.05957
G1 X117.602 Y118.602 E.07726
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.871 E.07527
G1 X119.79 Y121.323 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1900
G1 X117.21 Y121.323 E.07928
G1 X117.21 Y118.21 E.09566
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.263 E.09382
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y121.31 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I.652 J1.028 P1  F30000
G1 X119.006 Y120.539 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1900
G1 X119.006 Y118.994 E.04747
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.539 E.04747
G1 X118.946 Y120.539 E.02924
G1 X118.659 Y120.192 F30000
; LINE_WIDTH: 0.360223
G1 F1900
G1 X118.659 Y119.341 E.02199
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.192 E.02199
G1 X118.599 Y120.192 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.192 E-.09778
G1 X118.341 Y119.341 E-.32325
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.916 E-.2184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I-1.211 J-.116 P1  F30000
G1 X117.602 Y130.931 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1900
G1 X117.602 Y125.069 E.19447
G1 X119.398 Y125.069 E.05957
G1 X119.398 Y130.931 E.19447
G1 X117.662 Y130.931 E.05758
G1 X117.21 Y131.323 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1900
G1 X117.21 Y124.677 E.20423
G1 X119.79 Y124.677 E.07928
G1 X119.79 Y131.323 E.20423
G1 X117.27 Y131.323 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.252 Y129.323 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I1.079 J.564 P1  F30000
G1 X119.006 Y125.967 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1900
G1 X119.006 Y125.461 E.01554
G1 X117.994 Y125.461 E.03109
G1 X117.994 Y130.539 E.15604
G1 X119.006 Y130.539 E.03109
G1 X119.006 Y126.027 E.13866
G1 X118.659 Y125.967 F30000
; LINE_WIDTH: 0.360223
G1 F1900
G1 X118.659 Y125.808 E.0041
G1 X118.341 Y125.808 E.0082
G1 X118.341 Y130.192 E.11335
G1 X118.659 Y130.192 E.0082
G1 X118.659 Y126.027 E.1077
; WIPE_START
G1 F24000
G1 X118.659 Y128.027 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I-1.213 J.096 P1  F30000
G1 X119.398 Y137.398 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1900
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y135.069 E.07726
G1 X119.398 Y135.069 E.05957
G1 X119.398 Y137.338 E.07527
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1900
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.677 E.09566
G1 X119.79 Y134.677 E.07928
G1 X119.79 Y137.73 E.09382
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I1.078 J.566 P1  F30000
G1 X119.006 Y135.461 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1900
G1 X117.994 Y135.461 E.03109
G1 X117.994 Y137.006 E.04747
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.521 E.04563
G1 X118.659 Y135.808 F30000
; LINE_WIDTH: 0.360223
G1 F1900
G1 X118.341 Y135.808 E.0082
G1 X118.341 Y136.659 E.02199
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.868 E.02044
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.30045
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.808 E-.32325
G1 X118.383 Y135.808 E-.01573
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I.04 J1.216 P1  F30000
G1 X140.602 Y135.069 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1900
G1 X142.398 Y135.069 E.05957
G1 X142.398 Y137.398 E.07726
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.129 E.07527
G1 X140.21 Y134.677 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1900
G1 X142.79 Y134.677 E.07928
G1 X142.79 Y137.79 E.09566
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.737 E.09382
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.461 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1900
G1 X140.994 Y137.006 E.04747
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.461 E.04747
G1 X141.054 Y135.461 E.02924
G1 X141.341 Y135.808 F30000
; LINE_WIDTH: 0.360223
G1 F1900
G1 X141.341 Y136.659 E.02199
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.808 E.02199
G1 X141.401 Y135.808 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.808 E-.09778
G1 X141.659 Y136.659 E-.32325
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.084 E-.2184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I1.214 J-.081 P1  F30000
G1 X140.602 Y125.069 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1900
G1 X142.398 Y125.069 E.05957
G1 X142.398 Y130.931 E.19447
G1 X140.602 Y130.931 E.05957
G1 X140.602 Y125.129 E.19248
G1 X140.21 Y124.677 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1900
G1 X142.79 Y124.677 E.07928
G1 X142.79 Y131.323 E.20423
G1 X140.21 Y131.323 E.07928
G1 X140.21 Y124.737 E.20239
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y124.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I-1.192 J-.248 P1  F30000
G1 X140.994 Y130.539 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1900
G1 X142.006 Y130.539 E.03109
G1 X142.006 Y125.461 E.15604
G1 X140.994 Y125.461 E.03109
G1 X140.994 Y130.479 E.1542
G1 X141.341 Y130.192 F30000
; LINE_WIDTH: 0.360223
G1 F1900
G1 X141.659 Y130.192 E.0082
G1 X141.659 Y125.808 E.11335
G1 X141.341 Y125.808 E.0082
G1 X141.341 Y130.132 E.1118
; WIPE_START
G1 F24000
G1 X141.341 Y128.132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I1.211 J-.124 P1  F30000
G1 X140.602 Y120.931 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1900
G1 X140.602 Y118.602 E.07726
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y120.931 E.07726
G1 X140.662 Y120.931 E.05758
G1 X140.21 Y121.323 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1900
G1 X140.21 Y118.21 E.09566
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.323 E.09566
G1 X140.27 Y121.323 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.231 Y119.324 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I-1.031 J.647 P1  F30000
G1 X140.994 Y120.539 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1900
G1 X142.006 Y120.539 E.03109
G1 X142.006 Y118.994 E.04747
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.479 E.04563
G1 X141.341 Y120.192 F30000
; LINE_WIDTH: 0.360223
G1 F1900
G1 X141.659 Y120.192 E.0082
G1 X141.659 Y119.341 E.02199
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.132 E.02044
; CHANGE_LAYER
; Z_HEIGHT: 27.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.30045
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.192 E-.32325
G1 X141.617 Y120.192 E-.01573
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 139/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L139
M991 S0 P138 ;notify layer change
G17
G3 Z28 I-.038 J-1.216 P1  F30000
G1 X119.398 Y120.877 Z28
G1 Z27.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1871
G1 X117.602 Y120.877 E.05957
G1 X117.602 Y118.602 E.07548
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.817 E.07349
G1 X119.79 Y121.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P75 R9
G1 F1871
G1 X117.21 Y121.269 E.07928
G1 X117.21 Y118.21 E.09401
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.209 E.09217
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y121.256 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I.652 J1.028 P1  F30000
G1 X119.006 Y120.485 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1871
G1 X119.006 Y118.994 E.04582
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.485 E.04582
G1 X118.946 Y120.485 E.02924
G1 X118.659 Y120.138 F30000
; LINE_WIDTH: 0.360223
G1 F1871
G1 X118.659 Y119.341 E.0206
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.138 E.0206
G1 X118.599 Y120.138 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.138 E-.09778
G1 X118.341 Y119.341 E-.30278
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.97 E-.23887
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I-1.211 J-.117 P1  F30000
G1 X117.602 Y130.877 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1871
G1 X117.602 Y125.123 E.1909
G1 X119.398 Y125.123 E.05957
G1 X119.398 Y130.877 E.1909
G1 X117.662 Y130.877 E.05758
G1 X117.21 Y131.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1871
G1 X117.21 Y124.731 E.20092
G1 X119.79 Y124.731 E.07928
G1 X119.79 Y131.269 E.20092
G1 X117.27 Y131.269 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.252 Y129.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I1.071 J.578 P1  F30000
G1 X119.006 Y126.021 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1871
G1 X119.006 Y125.515 E.01554
G1 X117.994 Y125.515 E.03109
G1 X117.994 Y130.485 E.15273
G1 X119.006 Y130.485 E.03109
G1 X119.006 Y126.081 E.13535
G1 X118.659 Y126.021 F30000
; LINE_WIDTH: 0.360223
G1 F1871
G1 X118.659 Y125.862 E.0041
G1 X118.341 Y125.862 E.0082
G1 X118.341 Y130.138 E.11057
G1 X118.659 Y130.138 E.0082
G1 X118.659 Y126.081 E.10491
; WIPE_START
G1 F24000
G1 X118.659 Y128.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I-1.213 J.096 P1  F30000
G1 X119.398 Y137.398 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1871
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y135.123 E.07548
G1 X119.398 Y135.123 E.05957
G1 X119.398 Y137.338 E.07349
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1871
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.731 E.09401
G1 X119.79 Y134.731 E.07928
G1 X119.79 Y137.73 E.09217
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I1.072 J.576 P1  F30000
G1 X119.006 Y135.515 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1871
G1 X117.994 Y135.515 E.03109
G1 X117.994 Y137.006 E.04582
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.575 E.04398
G1 X118.659 Y135.862 F30000
; LINE_WIDTH: 0.360223
G1 F1871
G1 X118.341 Y135.862 E.0082
G1 X118.341 Y136.659 E.0206
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.922 E.01905
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.27998
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.862 E-.30278
G1 X118.49 Y135.862 E-.05667
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I.041 J1.216 P1  F30000
G1 X140.602 Y135.123 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1871
G1 X142.398 Y135.123 E.05957
G1 X142.398 Y137.398 E.07548
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.183 E.07349
G1 X140.21 Y134.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1871
G1 X142.79 Y134.731 E.07928
G1 X142.79 Y137.79 E.09401
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.791 E.09217
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.744 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.515 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1871
G1 X140.994 Y137.006 E.04582
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.515 E.04582
G1 X141.054 Y135.515 E.02924
G1 X141.341 Y135.862 F30000
; LINE_WIDTH: 0.360223
G1 F1871
G1 X141.341 Y136.659 E.0206
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.862 E.0206
G1 X141.401 Y135.862 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.862 E-.09778
G1 X141.659 Y136.659 E-.30278
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.03 E-.23887
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I1.214 J-.082 P1  F30000
G1 X140.602 Y125.123 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1871
G1 X142.398 Y125.123 E.05957
G1 X142.398 Y130.877 E.1909
G1 X140.602 Y130.877 E.05957
G1 X140.602 Y125.183 E.18891
G1 X140.21 Y124.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1871
G1 X142.79 Y124.731 E.07928
G1 X142.79 Y131.269 E.20092
G1 X140.21 Y131.269 E.07928
G1 X140.21 Y124.791 E.19908
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y124.744 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I-1.191 J-.252 P1  F30000
G1 X140.994 Y130.485 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1871
G1 X142.006 Y130.485 E.03109
G1 X142.006 Y125.515 E.15273
G1 X140.994 Y125.515 E.03109
G1 X140.994 Y130.425 E.15089
G1 X141.341 Y130.138 F30000
; LINE_WIDTH: 0.360223
G1 F1871
G1 X141.659 Y130.138 E.0082
G1 X141.659 Y125.862 E.11057
G1 X141.341 Y125.862 E.0082
G1 X141.341 Y130.078 E.10902
; WIPE_START
G1 F24000
G1 X141.341 Y128.078 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I1.211 J-.124 P1  F30000
G1 X140.602 Y120.877 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1871
G1 X140.602 Y118.602 E.07548
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y120.877 E.07548
G1 X140.662 Y120.877 E.05758
G1 X140.21 Y121.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1871
G1 X140.21 Y118.21 E.09401
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.269 E.09401
G1 X140.27 Y121.269 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.231 Y119.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I-1.031 J.647 P1  F30000
G1 X140.994 Y120.485 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1871
G1 X142.006 Y120.485 E.03109
G1 X142.006 Y118.994 E.04582
M73 P75 R8
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.425 E.04398
G1 X141.341 Y120.138 F30000
; LINE_WIDTH: 0.360223
G1 F1871
G1 X141.659 Y120.138 E.0082
G1 X141.659 Y119.341 E.0206
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.078 E.01905
; CHANGE_LAYER
; Z_HEIGHT: 28
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.27998
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.138 E-.30278
G1 X141.51 Y120.138 E-.05667
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 140/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L140
M991 S0 P139 ;notify layer change
G17
G3 Z28.2 I-.039 J-1.216 P1  F30000
G1 X119.398 Y120.852 Z28.2
G1 Z28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1857
G1 X117.602 Y120.852 E.05957
G1 X117.602 Y118.602 E.07462
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.792 E.07263
G1 X119.79 Y121.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1857
G1 X117.21 Y121.244 E.07928
G1 X117.21 Y118.21 E.09322
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.184 E.09137
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y121.23 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I.652 J1.028 P1  F30000
G1 X119.006 Y120.459 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1857
G1 X119.006 Y118.994 E.04503
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.459 E.04503
G1 X118.946 Y120.459 E.02924
G1 X118.659 Y120.112 F30000
; LINE_WIDTH: 0.360223
G1 F1857
G1 X118.659 Y119.341 E.01993
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.112 E.01993
G1 X118.599 Y120.112 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.112 E-.09778
G1 X118.341 Y119.341 E-.29296
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.996 E-.24869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I-1.211 J-.118 P1  F30000
G1 X117.602 Y130.852 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1857
G1 X117.602 Y125.148 E.18918
G1 X119.398 Y125.148 E.05957
G1 X119.398 Y130.852 E.18918
G1 X117.662 Y130.852 E.05758
G1 X117.21 Y131.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1857
G1 X117.21 Y124.756 E.19934
G1 X119.79 Y124.756 E.07928
G1 X119.79 Y131.244 E.19934
G1 X117.27 Y131.244 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.252 Y129.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I1.067 J.585 P1  F30000
G1 X119.006 Y126.046 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1857
G1 X119.006 Y125.541 E.01554
G1 X117.994 Y125.541 E.03109
G1 X117.994 Y130.459 E.15115
G1 X119.006 Y130.459 E.03109
G1 X119.006 Y126.106 E.13376
G1 X118.659 Y126.046 F30000
; LINE_WIDTH: 0.360223
G1 F1857
G1 X118.659 Y125.888 E.0041
G1 X118.341 Y125.888 E.0082
G1 X118.341 Y130.112 E.10923
G1 X118.659 Y130.112 E.0082
G1 X118.659 Y126.106 E.10358
; WIPE_START
G1 F24000
G1 X118.659 Y128.106 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I-1.213 J.097 P1  F30000
G1 X119.398 Y137.398 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1857
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y135.148 E.07462
G1 X119.398 Y135.148 E.05957
G1 X119.398 Y137.338 E.07263
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1857
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.756 E.09322
G1 X119.79 Y134.756 E.07928
G1 X119.79 Y137.73 E.09137
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I1.069 J.581 P1  F30000
G1 X119.006 Y135.541 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1857
G1 X117.994 Y135.541 E.03109
G1 X117.994 Y137.006 E.04503
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.601 E.04318
G1 X118.659 Y135.888 F30000
; LINE_WIDTH: 0.360223
G1 F1857
G1 X118.341 Y135.888 E.0082
G1 X118.341 Y136.659 E.01993
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.948 E.01838
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.27016
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.888 E-.29296
G1 X118.542 Y135.888 E-.07631
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I.041 J1.216 P1  F30000
G1 X140.602 Y135.148 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1857
G1 X142.398 Y135.148 E.05957
G1 X142.398 Y137.398 E.07462
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.208 E.07263
G1 X140.21 Y134.756 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1857
G1 X142.79 Y134.756 E.07928
G1 X142.79 Y137.79 E.09322
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.816 E.09137
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.541 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1857
G1 X140.994 Y137.006 E.04503
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.541 E.04503
G1 X141.054 Y135.541 E.02924
G1 X141.341 Y135.888 F30000
; LINE_WIDTH: 0.360223
G1 F1857
G1 X141.341 Y136.659 E.01993
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.888 E.01993
G1 X141.401 Y135.888 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.888 E-.09778
G1 X141.659 Y136.659 E-.29296
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.004 E-.24869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I1.214 J-.083 P1  F30000
G1 X140.602 Y125.148 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1857
G1 X142.398 Y125.148 E.05957
G1 X142.398 Y130.852 E.18918
G1 X140.602 Y130.852 E.05957
G1 X140.602 Y125.208 E.18719
G1 X140.21 Y124.756 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1857
G1 X142.79 Y124.756 E.07928
G1 X142.79 Y131.244 E.19934
G1 X140.21 Y131.244 E.07928
G1 X140.21 Y124.816 E.19749
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y124.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I-1.19 J-.254 P1  F30000
G1 X140.994 Y130.459 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1857
G1 X142.006 Y130.459 E.03109
G1 X142.006 Y125.541 E.15115
G1 X140.994 Y125.541 E.03109
G1 X140.994 Y130.399 E.1493
G1 X141.341 Y130.112 F30000
; LINE_WIDTH: 0.360223
G1 F1857
G1 X141.659 Y130.112 E.0082
G1 X141.659 Y125.888 E.10923
G1 X141.341 Y125.888 E.0082
G1 X141.341 Y130.052 E.10768
; WIPE_START
G1 F24000
G1 X141.341 Y128.052 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I1.211 J-.124 P1  F30000
G1 X140.602 Y120.852 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1857
G1 X140.602 Y118.602 E.07462
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y120.852 E.07462
G1 X140.662 Y120.852 E.05758
G1 X140.21 Y121.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1857
G1 X140.21 Y118.21 E.09322
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.244 E.09322
G1 X140.27 Y121.244 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.23 Y119.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I-1.03 J.647 P1  F30000
G1 X140.994 Y120.459 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1857
G1 X142.006 Y120.459 E.03109
G1 X142.006 Y118.994 E.04503
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.399 E.04318
G1 X141.341 Y120.112 F30000
; LINE_WIDTH: 0.360223
G1 F1857
G1 X141.659 Y120.112 E.0082
G1 X141.659 Y119.341 E.01993
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.052 E.01838
; CHANGE_LAYER
; Z_HEIGHT: 28.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.27016
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.112 E-.29296
G1 X141.458 Y120.112 E-.07631
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 141/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L141
M991 S0 P140 ;notify layer change
G17
G3 Z28.4 I-.041 J-1.216 P1  F30000
G1 X119.398 Y120.852 Z28.4
G1 Z28.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1857
G1 X117.602 Y120.852 E.05957
G1 X117.602 Y118.602 E.07462
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.792 E.07263
G1 X119.79 Y121.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1857
G1 X117.21 Y121.244 E.07928
G1 X117.21 Y118.21 E.09322
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.184 E.09137
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y121.23 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I.652 J1.028 P1  F30000
G1 X119.006 Y120.459 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1857
G1 X119.006 Y118.994 E.04503
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.459 E.04503
G1 X118.946 Y120.459 E.02924
G1 X118.659 Y120.112 F30000
; LINE_WIDTH: 0.360223
G1 F1857
G1 X118.659 Y119.341 E.01993
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.112 E.01993
G1 X118.599 Y120.112 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.112 E-.09778
G1 X118.341 Y119.341 E-.29296
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.996 E-.24869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I-1.211 J-.118 P1  F30000
G1 X117.602 Y130.852 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1857
G1 X117.602 Y125.148 E.18918
G1 X119.398 Y125.148 E.05957
G1 X119.398 Y130.852 E.18918
G1 X117.662 Y130.852 E.05758
G1 X117.21 Y131.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1857
G1 X117.21 Y124.756 E.19934
G1 X119.79 Y124.756 E.07928
G1 X119.79 Y131.244 E.19934
G1 X117.27 Y131.244 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.252 Y129.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I1.067 J.585 P1  F30000
G1 X119.006 Y126.046 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1857
G1 X119.006 Y125.541 E.01554
G1 X117.994 Y125.541 E.03109
G1 X117.994 Y130.459 E.15115
M73 P76 R8
G1 X119.006 Y130.459 E.03109
G1 X119.006 Y126.106 E.13376
G1 X118.659 Y126.046 F30000
; LINE_WIDTH: 0.360223
G1 F1857
G1 X118.659 Y125.888 E.0041
G1 X118.341 Y125.888 E.0082
G1 X118.341 Y130.112 E.10923
G1 X118.659 Y130.112 E.0082
G1 X118.659 Y126.106 E.10358
; WIPE_START
G1 F24000
G1 X118.659 Y128.106 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I-1.213 J.097 P1  F30000
G1 X119.398 Y137.398 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1857
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y135.148 E.07462
G1 X119.398 Y135.148 E.05957
G1 X119.398 Y137.338 E.07263
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1857
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.756 E.09322
G1 X119.79 Y134.756 E.07928
G1 X119.79 Y137.73 E.09137
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I1.069 J.581 P1  F30000
G1 X119.006 Y135.541 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1857
G1 X117.994 Y135.541 E.03109
G1 X117.994 Y137.006 E.04503
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.601 E.04318
G1 X118.659 Y135.888 F30000
; LINE_WIDTH: 0.360223
G1 F1857
G1 X118.341 Y135.888 E.0082
G1 X118.341 Y136.659 E.01993
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.948 E.01838
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.27016
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.888 E-.29296
G1 X118.542 Y135.888 E-.07631
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I.041 J1.216 P1  F30000
G1 X140.602 Y135.148 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1857
G1 X142.398 Y135.148 E.05957
G1 X142.398 Y137.398 E.07462
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.208 E.07263
G1 X140.21 Y134.756 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1857
G1 X142.79 Y134.756 E.07928
G1 X142.79 Y137.79 E.09322
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.816 E.09137
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.541 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1857
G1 X140.994 Y137.006 E.04503
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.541 E.04503
G1 X141.054 Y135.541 E.02924
G1 X141.341 Y135.888 F30000
; LINE_WIDTH: 0.360223
G1 F1857
G1 X141.341 Y136.659 E.01993
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.888 E.01993
G1 X141.401 Y135.888 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.888 E-.09778
G1 X141.659 Y136.659 E-.29296
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.004 E-.24869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I1.214 J-.083 P1  F30000
G1 X140.602 Y125.148 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1857
G1 X142.398 Y125.148 E.05957
G1 X142.398 Y130.852 E.18918
G1 X140.602 Y130.852 E.05957
G1 X140.602 Y125.208 E.18719
G1 X140.21 Y124.756 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1857
G1 X142.79 Y124.756 E.07928
G1 X142.79 Y131.244 E.19934
G1 X140.21 Y131.244 E.07928
G1 X140.21 Y124.816 E.19749
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y124.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I-1.19 J-.254 P1  F30000
G1 X140.994 Y130.459 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1857
G1 X142.006 Y130.459 E.03109
G1 X142.006 Y125.541 E.15115
G1 X140.994 Y125.541 E.03109
G1 X140.994 Y130.399 E.1493
G1 X141.341 Y130.112 F30000
; LINE_WIDTH: 0.360223
G1 F1857
G1 X141.659 Y130.112 E.0082
G1 X141.659 Y125.888 E.10923
G1 X141.341 Y125.888 E.0082
G1 X141.341 Y130.052 E.10768
; WIPE_START
G1 F24000
G1 X141.341 Y128.052 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I1.211 J-.124 P1  F30000
G1 X140.602 Y120.852 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1857
G1 X140.602 Y118.602 E.07462
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y120.852 E.07462
G1 X140.662 Y120.852 E.05758
G1 X140.21 Y121.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1857
G1 X140.21 Y118.21 E.09322
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.244 E.09322
G1 X140.27 Y121.244 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.23 Y119.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I-1.03 J.647 P1  F30000
G1 X140.994 Y120.459 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1857
G1 X142.006 Y120.459 E.03109
G1 X142.006 Y118.994 E.04503
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.399 E.04318
G1 X141.341 Y120.112 F30000
; LINE_WIDTH: 0.360223
G1 F1857
G1 X141.659 Y120.112 E.0082
G1 X141.659 Y119.341 E.01993
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.052 E.01838
; CHANGE_LAYER
; Z_HEIGHT: 28.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.27016
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.112 E-.29296
G1 X141.458 Y120.112 E-.07631
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 142/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L142
M991 S0 P141 ;notify layer change
G17
G3 Z28.6 I-.042 J-1.216 P1  F30000
G1 X119.398 Y120.877 Z28.6
G1 Z28.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1871
G1 X117.602 Y120.877 E.05957
G1 X117.602 Y118.602 E.07548
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.817 E.07349
G1 X119.79 Y121.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1871
G1 X117.21 Y121.269 E.07928
G1 X117.21 Y118.21 E.09401
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.209 E.09217
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y121.256 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I.652 J1.028 P1  F30000
G1 X119.006 Y120.485 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1871
G1 X119.006 Y118.994 E.04582
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.485 E.04582
G1 X118.946 Y120.485 E.02924
G1 X118.659 Y120.138 F30000
; LINE_WIDTH: 0.360223
G1 F1871
G1 X118.659 Y119.341 E.0206
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.138 E.0206
G1 X118.599 Y120.138 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.138 E-.09778
G1 X118.341 Y119.341 E-.30278
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.97 E-.23887
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I-1.211 J-.117 P1  F30000
G1 X117.602 Y130.877 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1871
G1 X117.602 Y125.123 E.1909
G1 X119.398 Y125.123 E.05957
G1 X119.398 Y130.877 E.1909
G1 X117.662 Y130.877 E.05758
G1 X117.21 Y131.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1871
G1 X117.21 Y124.731 E.20092
G1 X119.79 Y124.731 E.07928
G1 X119.79 Y131.269 E.20092
G1 X117.27 Y131.269 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.252 Y129.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I1.071 J.578 P1  F30000
G1 X119.006 Y126.021 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1871
G1 X119.006 Y125.515 E.01554
G1 X117.994 Y125.515 E.03109
G1 X117.994 Y130.485 E.15273
G1 X119.006 Y130.485 E.03109
G1 X119.006 Y126.081 E.13535
G1 X118.659 Y126.021 F30000
; LINE_WIDTH: 0.360223
G1 F1871
G1 X118.659 Y125.862 E.0041
G1 X118.341 Y125.862 E.0082
G1 X118.341 Y130.138 E.11057
G1 X118.659 Y130.138 E.0082
G1 X118.659 Y126.081 E.10491
; WIPE_START
G1 F24000
G1 X118.659 Y128.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I-1.213 J.096 P1  F30000
G1 X119.398 Y137.398 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1871
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y135.123 E.07548
G1 X119.398 Y135.123 E.05957
G1 X119.398 Y137.338 E.07349
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1871
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.731 E.09401
G1 X119.79 Y134.731 E.07928
G1 X119.79 Y137.73 E.09217
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I1.072 J.576 P1  F30000
G1 X119.006 Y135.515 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1871
G1 X117.994 Y135.515 E.03109
G1 X117.994 Y137.006 E.04582
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.575 E.04398
G1 X118.659 Y135.862 F30000
; LINE_WIDTH: 0.360223
G1 F1871
G1 X118.341 Y135.862 E.0082
G1 X118.341 Y136.659 E.0206
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.922 E.01905
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.27998
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.862 E-.30278
G1 X118.49 Y135.862 E-.05667
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I.041 J1.216 P1  F30000
G1 X140.602 Y135.123 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1871
G1 X142.398 Y135.123 E.05957
G1 X142.398 Y137.398 E.07548
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.183 E.07349
G1 X140.21 Y134.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1871
G1 X142.79 Y134.731 E.07928
G1 X142.79 Y137.79 E.09401
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.791 E.09217
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.744 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.515 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1871
G1 X140.994 Y137.006 E.04582
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.515 E.04582
G1 X141.054 Y135.515 E.02924
G1 X141.341 Y135.862 F30000
; LINE_WIDTH: 0.360223
G1 F1871
G1 X141.341 Y136.659 E.0206
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.862 E.0206
G1 X141.401 Y135.862 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.862 E-.09778
G1 X141.659 Y136.659 E-.30278
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.03 E-.23887
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I1.214 J-.082 P1  F30000
G1 X140.602 Y125.123 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1871
G1 X142.398 Y125.123 E.05957
G1 X142.398 Y130.877 E.1909
G1 X140.602 Y130.877 E.05957
G1 X140.602 Y125.183 E.18891
G1 X140.21 Y124.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1871
G1 X142.79 Y124.731 E.07928
G1 X142.79 Y131.269 E.20092
G1 X140.21 Y131.269 E.07928
G1 X140.21 Y124.791 E.19908
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y124.744 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I-1.191 J-.252 P1  F30000
G1 X140.994 Y130.485 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1871
G1 X142.006 Y130.485 E.03109
G1 X142.006 Y125.515 E.15273
G1 X140.994 Y125.515 E.03109
G1 X140.994 Y130.425 E.15089
G1 X141.341 Y130.138 F30000
; LINE_WIDTH: 0.360223
G1 F1871
G1 X141.659 Y130.138 E.0082
G1 X141.659 Y125.862 E.11057
G1 X141.341 Y125.862 E.0082
G1 X141.341 Y130.078 E.10902
; WIPE_START
G1 F24000
G1 X141.341 Y128.078 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I1.211 J-.124 P1  F30000
G1 X140.602 Y120.877 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1871
G1 X140.602 Y118.602 E.07548
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y120.877 E.07548
G1 X140.662 Y120.877 E.05758
G1 X140.21 Y121.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1871
G1 X140.21 Y118.21 E.09401
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.269 E.09401
G1 X140.27 Y121.269 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.231 Y119.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I-1.031 J.647 P1  F30000
G1 X140.994 Y120.485 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1871
G1 X142.006 Y120.485 E.03109
G1 X142.006 Y118.994 E.04582
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.425 E.04398
G1 X141.341 Y120.138 F30000
; LINE_WIDTH: 0.360223
G1 F1871
G1 X141.659 Y120.138 E.0082
G1 X141.659 Y119.341 E.0206
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.078 E.01905
; CHANGE_LAYER
; Z_HEIGHT: 28.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.27998
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.138 E-.30278
G1 X141.51 Y120.138 E-.05667
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 143/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L143
M991 S0 P142 ;notify layer change
G17
G3 Z28.8 I-.044 J-1.216 P1  F30000
G1 X119.398 Y120.931 Z28.8
G1 Z28.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1907
G1 X117.602 Y120.931 E.05957
G1 X117.602 Y118.602 E.07726
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.871 E.07527
G1 X119.79 Y121.31 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1907
G1 X119.79 Y121.323 E.0004
G1 X117.21 Y121.323 E.07928
G1 X117.21 Y121.31 E.0004
G1 X117.21 Y118.21 E.09527
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.25 E.09343
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y121.323 E-.02769
G1 X117.863 Y121.323 E-.73231
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I.688 J1.003 P1  F30000
G1 X119.006 Y120.539 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1907
G1 X119.006 Y118.994 E.04747
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.539 E.04747
G1 X118.946 Y120.539 E.02924
G1 X118.659 Y120.192 F30000
; LINE_WIDTH: 0.360223
G1 F1907
G1 X118.659 Y119.341 E.02199
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.192 E.02199
G1 X118.599 Y120.192 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.192 E-.09778
G1 X118.341 Y119.341 E-.32325
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.916 E-.2184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I-1.211 J-.116 P1  F30000
G1 X117.602 Y130.931 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1907
G1 X117.602 Y125.069 E.19447
G1 X119.398 Y125.069 E.05957
G1 X119.398 Y130.931 E.19447
G1 X117.662 Y130.931 E.05758
G1 X117.21 Y131.31 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1907
G1 X117.21 Y124.69 E.20344
G1 X117.21 Y124.677 E.0004
G1 X119.79 Y124.677 E.07928
G1 X119.79 Y124.69 E.0004
G1 X119.79 Y131.31 E.20344
G1 X119.79 Y131.323 E.0004
G1 X117.257 Y131.323 E.07783
M204 S10000
; WIPE_START
G1 F24000
G1 X117.243 Y129.323 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I1.077 J.566 P1  F30000
G1 X119.006 Y125.967 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1907
G1 X119.006 Y125.461 E.01554
G1 X117.994 Y125.461 E.03109
G1 X117.994 Y130.539 E.15604
G1 X119.006 Y130.539 E.03109
G1 X119.006 Y126.027 E.13866
G1 X118.659 Y125.967 F30000
; LINE_WIDTH: 0.360223
G1 F1907
G1 X118.659 Y125.808 E.0041
G1 X118.341 Y125.808 E.0082
G1 X118.341 Y130.192 E.11335
G1 X118.659 Y130.192 E.0082
G1 X118.659 Y126.027 E.1077
; WIPE_START
G1 F24000
G1 X118.659 Y128.027 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I-1.213 J.096 P1  F30000
G1 X119.398 Y137.398 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1907
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y135.069 E.07726
G1 X119.398 Y135.069 E.05957
G1 X119.398 Y137.338 E.07527
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1907
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.69 E.09527
G1 X117.21 Y134.677 E.0004
G1 X119.79 Y134.677 E.07928
G1 X119.79 Y134.69 E.0004
G1 X119.79 Y137.73 E.09343
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I1.078 J.566 P1  F30000
G1 X119.006 Y135.461 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1907
G1 X117.994 Y135.461 E.03109
G1 X117.994 Y137.006 E.04747
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.521 E.04563
G1 X118.659 Y135.808 F30000
; LINE_WIDTH: 0.360223
G1 F1907
G1 X118.341 Y135.808 E.0082
G1 X118.341 Y136.659 E.02199
M73 P77 R8
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.868 E.02044
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.30045
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.808 E-.32325
G1 X118.383 Y135.808 E-.01573
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I.04 J1.216 P1  F30000
G1 X140.602 Y135.069 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1907
G1 X142.398 Y135.069 E.05957
G1 X142.398 Y137.398 E.07726
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.129 E.07527
G1 X140.21 Y134.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1907
G1 X140.21 Y134.677 E.0004
G1 X142.79 Y134.677 E.07928
G1 X142.79 Y134.69 E.0004
G1 X142.79 Y137.79 E.09527
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.75 E.09343
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y134.677 E-.02769
G1 X142.137 Y134.677 E-.73231
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I-.688 J-1.003 P1  F30000
G1 X140.994 Y135.461 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1907
G1 X140.994 Y137.006 E.04747
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.461 E.04747
G1 X141.054 Y135.461 E.02924
G1 X141.341 Y135.808 F30000
; LINE_WIDTH: 0.360223
G1 F1907
G1 X141.341 Y136.659 E.02199
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.808 E.02199
G1 X141.401 Y135.808 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.808 E-.09778
G1 X141.659 Y136.659 E-.32325
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.084 E-.2184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I1.214 J-.081 P1  F30000
G1 X140.602 Y125.069 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1907
G1 X142.398 Y125.069 E.05957
G1 X142.398 Y130.931 E.19447
G1 X140.602 Y130.931 E.05957
G1 X140.602 Y125.129 E.19248
G1 X140.21 Y124.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1907
G1 X140.21 Y124.677 E.0004
G1 X142.79 Y124.677 E.07928
G1 X142.79 Y124.69 E.0004
G1 X142.79 Y131.31 E.20344
G1 X142.79 Y131.323 E.0004
G1 X140.21 Y131.323 E.07928
G1 X140.21 Y131.31 E.0004
G1 X140.21 Y124.75 E.2016
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y124.677 E-.02769
G1 X142.137 Y124.677 E-.73231
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I-1.194 J-.233 P1  F30000
G1 X140.994 Y130.539 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1907
G1 X142.006 Y130.539 E.03109
G1 X142.006 Y125.461 E.15604
G1 X140.994 Y125.461 E.03109
G1 X140.994 Y130.479 E.1542
G1 X141.341 Y130.192 F30000
; LINE_WIDTH: 0.360223
G1 F1907
G1 X141.659 Y130.192 E.0082
G1 X141.659 Y125.808 E.11335
G1 X141.341 Y125.808 E.0082
G1 X141.341 Y130.132 E.1118
; WIPE_START
G1 F24000
G1 X141.341 Y128.132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I1.211 J-.124 P1  F30000
G1 X140.602 Y120.931 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1907
G1 X140.602 Y118.602 E.07726
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y120.931 E.07726
G1 X140.662 Y120.931 E.05758
G1 X140.21 Y121.31 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1907
G1 X140.21 Y118.21 E.09527
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.31 E.09527
G1 X142.79 Y121.323 E.0004
G1 X140.257 Y121.323 E.07783
M204 S10000
; WIPE_START
G1 F24000
G1 X140.227 Y119.324 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I-1.029 J.65 P1  F30000
G1 X140.994 Y120.539 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1907
G1 X142.006 Y120.539 E.03109
G1 X142.006 Y118.994 E.04747
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.479 E.04563
G1 X141.341 Y120.192 F30000
; LINE_WIDTH: 0.360223
G1 F1907
G1 X141.659 Y120.192 E.0082
G1 X141.659 Y119.341 E.02199
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.132 E.02044
; CHANGE_LAYER
; Z_HEIGHT: 28.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.30045
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.192 E-.32325
G1 X141.617 Y120.192 E-.01573
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 144/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L144
M991 S0 P143 ;notify layer change
G17
G3 Z29 I-.045 J-1.216 P1  F30000
G1 X119.398 Y121.016 Z29
G1 Z28.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1953
G1 X117.602 Y121.016 E.05957
G1 X117.602 Y118.602 E.08006
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.956 E.07807
G1 X119.79 Y121.364 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1953
G1 X119.79 Y121.408 E.00133
G1 X117.21 Y121.408 E.07928
G1 X117.21 Y121.364 E.00133
G1 X117.21 Y118.21 E.09692
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.304 E.09508
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y121.408 E-.03923
G1 X117.893 Y121.408 E-.72077
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I.701 J.995 P1  F30000
G1 X119.006 Y120.623 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1953
G1 X119.006 Y118.994 E.05006
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.623 E.05006
G1 X118.946 Y120.623 E.02924
G1 X118.659 Y120.276 F30000
; LINE_WIDTH: 0.360223
G1 F1953
G1 X118.659 Y119.341 E.02417
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.276 E.02417
G1 X118.599 Y120.276 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.276 E-.09778
G1 X118.341 Y119.341 E-.35526
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.832 E-.18639
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I-1.212 J-.114 P1  F30000
G1 X117.602 Y131.016 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1953
G1 X117.602 Y124.984 E.20006
G1 X119.398 Y124.984 E.05957
G1 X119.398 Y131.016 E.20006
G1 X117.662 Y131.016 E.05758
G1 X117.21 Y131.364 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1953
G1 X117.21 Y124.636 E.20675
G1 X117.21 Y124.592 E.00133
G1 X119.79 Y124.592 E.07928
G1 X119.79 Y124.636 E.00133
G1 X119.79 Y131.364 E.20675
G1 X119.79 Y131.408 E.00133
G1 X117.227 Y131.408 E.07876
M204 S10000
; WIPE_START
G1 F24000
G1 X117.222 Y129.408 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I1.086 J.55 P1  F30000
G1 X119.006 Y125.882 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1953
G1 X119.006 Y125.377 E.01554
G1 X117.994 Y125.377 E.03109
G1 X117.994 Y130.623 E.16122
G1 X119.006 Y130.623 E.03109
G1 X119.006 Y125.942 E.14383
G1 X118.659 Y125.882 F30000
; LINE_WIDTH: 0.360223
G1 F1953
G1 X118.659 Y125.724 E.0041
G1 X118.341 Y125.724 E.0082
G1 X118.341 Y130.276 E.11771
G1 X118.659 Y130.276 E.0082
G1 X118.659 Y125.942 E.11206
; WIPE_START
G1 F24000
G1 X118.659 Y127.942 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I-1.213 J.095 P1  F30000
G1 X119.398 Y137.398 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1953
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.984 E.08006
G1 X119.398 Y134.984 E.05957
G1 X119.398 Y137.338 E.07807
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1953
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.636 E.09692
G1 X117.21 Y134.592 E.00133
G1 X119.79 Y134.592 E.07928
G1 X119.79 Y134.636 E.00133
G1 X119.79 Y137.73 E.09508
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I1.086 J.55 P1  F30000
G1 X119.006 Y135.377 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1953
G1 X117.994 Y135.377 E.03109
G1 X117.994 Y137.006 E.05006
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.437 E.04822
G1 X118.659 Y135.724 F30000
; LINE_WIDTH: 0.360223
G1 F1953
G1 X118.341 Y135.724 E.0082
G1 X118.341 Y136.659 E.02417
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.784 E.02262
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.33246
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.851 E-.30697
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I.047 J1.216 P1  F30000
G1 X140.602 Y134.984 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1953
G1 X142.398 Y134.984 E.05957
G1 X142.398 Y137.398 E.08006
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.044 E.07807
G1 X140.21 Y134.636 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1953
G1 X140.21 Y134.592 E.00133
G1 X142.79 Y134.592 E.07928
G1 X142.79 Y134.636 E.00133
G1 X142.79 Y137.79 E.09692
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.696 E.09508
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y134.592 E-.03923
G1 X142.107 Y134.592 E-.72077
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I-.701 J-.995 P1  F30000
G1 X140.994 Y135.377 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1953
G1 X140.994 Y137.006 E.05006
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.377 E.05006
G1 X141.054 Y135.377 E.02924
G1 X141.341 Y135.724 F30000
; LINE_WIDTH: 0.360223
G1 F1953
G1 X141.341 Y136.659 E.02417
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.724 E.02417
G1 X141.401 Y135.724 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.724 E-.09778
G1 X141.659 Y136.659 E-.35526
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.168 E-.18639
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I1.214 J-.08 P1  F30000
G1 X140.602 Y124.984 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1953
G1 X142.398 Y124.984 E.05957
G1 X142.398 Y131.016 E.20006
G1 X140.602 Y131.016 E.05957
G1 X140.602 Y125.044 E.19807
G1 X140.21 Y124.636 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1953
G1 X140.21 Y124.592 E.00133
G1 X142.79 Y124.592 E.07928
G1 X142.79 Y124.636 E.00133
G1 X142.79 Y131.364 E.20675
G1 X142.79 Y131.408 E.00133
G1 X140.21 Y131.408 E.07928
G1 X140.21 Y131.364 E.00133
G1 X140.21 Y124.696 E.20491
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y124.592 E-.03923
G1 X142.107 Y124.592 E-.72077
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I-1.197 J-.221 P1  F30000
G1 X140.994 Y130.623 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1953
G1 X142.006 Y130.623 E.03109
G1 X142.006 Y125.377 E.16122
G1 X140.994 Y125.377 E.03109
G1 X140.994 Y130.563 E.15938
G1 X141.341 Y130.276 F30000
; LINE_WIDTH: 0.360223
G1 F1953
G1 X141.659 Y130.276 E.0082
G1 X141.659 Y125.724 E.11771
G1 X141.341 Y125.724 E.0082
G1 X141.341 Y130.216 E.11616
; WIPE_START
G1 F24000
G1 X141.341 Y128.216 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I1.211 J-.124 P1  F30000
G1 X140.602 Y121.016 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1953
G1 X140.602 Y118.602 E.08006
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.016 E.08006
G1 X140.662 Y121.016 E.05758
G1 X140.21 Y121.364 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1953
G1 X140.21 Y118.21 E.09692
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.364 E.09692
G1 X142.79 Y121.408 E.00133
G1 X140.227 Y121.408 E.07876
M204 S10000
; WIPE_START
G1 F24000
G1 X140.216 Y119.408 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I-1.025 J.656 P1  F30000
G1 X140.994 Y120.623 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1953
G1 X142.006 Y120.623 E.03109
G1 X142.006 Y118.994 E.05006
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.563 E.04822
G1 X141.341 Y120.276 F30000
; LINE_WIDTH: 0.360223
G1 F1953
G1 X141.659 Y120.276 E.0082
G1 X141.659 Y119.341 E.02417
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.216 E.02262
; CHANGE_LAYER
; Z_HEIGHT: 29
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.33246
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.149 E-.30697
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 145/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L145
M991 S0 P144 ;notify layer change
G17
G3 Z29.2 I-.054 J-1.216 P1  F30000
G1 X119.398 Y121.137 Z29.2
G1 Z29
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2018
G1 X117.602 Y121.137 E.05957
G1 X117.602 Y118.602 E.08407
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.077 E.08208
G1 X119.79 Y121.449 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2018
G1 X119.79 Y121.529 E.00246
G1 X117.21 Y121.529 E.07928
G1 X117.21 Y121.449 E.00246
G1 X117.21 Y118.21 E.09951
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.389 E.09767
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y121.529 E-.05322
G1 X117.93 Y121.529 E-.70678
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.4 I.717 J.983 P1  F30000
G1 X119.006 Y120.744 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2018
G1 X119.006 Y118.994 E.05378
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.744 E.05378
G1 X118.946 Y120.744 E.02924
G1 X118.659 Y120.397 F30000
; LINE_WIDTH: 0.360223
G1 F2018
G1 X118.659 Y119.341 E.0273
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.397 E.0273
G1 X118.599 Y120.397 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.397 E-.09778
G1 X118.341 Y119.341 E-.40126
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.711 E-.14039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.4 I-1.212 J-.112 P1  F30000
G1 X117.602 Y131.137 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2018
G1 X117.602 Y124.863 E.20809
G1 X119.398 Y124.863 E.05957
G1 X119.398 Y131.137 E.20809
G1 X117.662 Y131.137 E.05758
G1 X117.21 Y131.449 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2018
G1 X117.21 Y124.551 E.21193
G1 X117.21 Y124.471 E.00246
G1 X119.79 Y124.471 E.07928
G1 X119.79 Y124.551 E.00246
G1 X119.79 Y131.449 E.21193
G1 X119.79 Y131.529 E.00246
G1 X117.21 Y131.529 E.07928
G1 X117.21 Y131.509 E.00062
M204 S10000
; WIPE_START
G1 F24000
G1 X117.21 Y129.509 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.4 I1.097 J.526 P1  F30000
G1 X119.006 Y125.761 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2018
G1 X119.006 Y125.256 E.01554
G1 X117.994 Y125.256 E.03109
G1 X117.994 Y130.744 E.16866
G1 X119.006 Y130.744 E.03109
G1 X119.006 Y125.821 E.15127
G1 X118.659 Y125.761 F30000
; LINE_WIDTH: 0.360223
G1 F2018
G1 X118.659 Y125.603 E.0041
G1 X118.341 Y125.603 E.0082
G1 X118.341 Y130.397 E.12397
G1 X118.659 Y130.397 E.0082
G1 X118.659 Y125.821 E.11832
; WIPE_START
G1 F24000
G1 X118.659 Y127.821 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.4 I-1.213 J.094 P1  F30000
G1 X119.398 Y137.398 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2018
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.863 E.08407
G1 X119.398 Y134.863 E.05957
G1 X119.398 Y137.338 E.08208
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2018
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.551 E.09951
G1 X117.21 Y134.471 E.00246
G1 X119.79 Y134.471 E.07928
G1 X119.79 Y134.551 E.00246
G1 X119.79 Y137.73 E.09767
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.4 I1.096 J.528 P1  F30000
G1 X119.006 Y135.256 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2018
G1 X117.994 Y135.256 E.03109
G1 X117.994 Y137.006 E.05378
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.316 E.05194
G1 X118.659 Y135.603 F30000
; LINE_WIDTH: 0.360223
G1 F2018
G1 X118.341 Y135.603 E.0082
G1 X118.341 Y136.659 E.0273
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.663 E.02575
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.37846
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.972 E-.26097
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.4 I.061 J1.215 P1  F30000
G1 X140.602 Y134.863 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2018
G1 X142.398 Y134.863 E.05957
G1 X142.398 Y137.398 E.08407
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.923 E.08208
G1 X140.21 Y134.551 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2018
G1 X140.21 Y134.471 E.00246
G1 X142.79 Y134.471 E.07928
G1 X142.79 Y134.551 E.00246
G1 X142.79 Y137.79 E.09951
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.611 E.09767
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y134.471 E-.05322
G1 X142.07 Y134.471 E-.70678
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.4 I-.717 J-.983 P1  F30000
G1 X140.994 Y135.256 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2018
G1 X140.994 Y137.006 E.05378
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.256 E.05378
G1 X141.054 Y135.256 E.02924
G1 X141.341 Y135.603 F30000
; LINE_WIDTH: 0.360223
G1 F2018
G1 X141.341 Y136.659 E.0273
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.603 E.0273
G1 X141.401 Y135.603 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.603 E-.09778
G1 X141.659 Y136.659 E-.40126
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.289 E-.14039
; WIPE_END
M73 P78 R8
G1 E-.04 F1800
G17
G3 Z29.4 I1.214 J-.079 P1  F30000
G1 X140.602 Y124.863 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2018
G1 X142.398 Y124.863 E.05957
G1 X142.398 Y131.137 E.20809
G1 X140.602 Y131.137 E.05957
G1 X140.602 Y124.923 E.2061
G1 X140.21 Y124.551 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2018
G1 X140.21 Y124.471 E.00246
G1 X142.79 Y124.471 E.07928
G1 X142.79 Y124.551 E.00246
G1 X142.79 Y131.449 E.21193
G1 X142.79 Y131.529 E.00246
G1 X140.21 Y131.529 E.07928
G1 X140.21 Y131.449 E.00246
G1 X140.21 Y124.611 E.21009
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y124.471 E-.05322
G1 X142.07 Y124.471 E-.70678
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.4 I-1.199 J-.206 P1  F30000
G1 X140.994 Y130.744 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2018
G1 X142.006 Y130.744 E.03109
G1 X142.006 Y125.256 E.16866
G1 X140.994 Y125.256 E.03109
G1 X140.994 Y130.684 E.16682
G1 X141.341 Y130.397 F30000
; LINE_WIDTH: 0.360223
G1 F2018
G1 X141.659 Y130.397 E.0082
G1 X141.659 Y125.603 E.12397
G1 X141.341 Y125.603 E.0082
G1 X141.341 Y130.337 E.12242
; WIPE_START
G1 F24000
G1 X141.341 Y128.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.4 I1.211 J-.124 P1  F30000
G1 X140.602 Y121.137 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2018
G1 X140.602 Y118.602 E.08407
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.137 E.08407
G1 X140.662 Y121.137 E.05758
G1 X140.21 Y121.449 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2018
G1 X140.21 Y118.21 E.09951
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.449 E.09951
G1 X142.79 Y121.529 E.00246
G1 X140.21 Y121.529 E.07928
G1 X140.21 Y121.509 E.00062
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y119.509 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.4 I-1.028 J.652 P1  F30000
G1 X140.994 Y120.744 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2018
G1 X142.006 Y120.744 E.03109
G1 X142.006 Y118.994 E.05378
G1 X140.994 Y118.994 E.03109
M73 P78 R7
G1 X140.994 Y120.684 E.05194
G1 X141.341 Y120.397 F30000
; LINE_WIDTH: 0.360223
G1 F2018
G1 X141.659 Y120.397 E.0082
G1 X141.659 Y119.341 E.0273
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.337 E.02575
; CHANGE_LAYER
; Z_HEIGHT: 29.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.37846
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.028 E-.26097
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 146/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L146
M991 S0 P145 ;notify layer change
G17
G3 Z29.4 I-.07 J-1.215 P1  F30000
G1 X119.398 Y121.306 Z29.4
G1 Z29.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2106
G1 X117.602 Y121.306 E.05957
G1 X117.602 Y118.602 E.0897
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.246 E.08771
G1 X119.79 Y121.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2106
G1 X119.79 Y121.698 E.00144
G1 X117.21 Y121.698 E.07928
G1 X117.21 Y121.652 E.00144
G1 X117.21 Y121.57 E.00252
G1 X117.21 Y118.21 E.10323
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.592 E.10391
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y121.698 E-.04056
G1 X117.897 Y121.698 E-.71944
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I.703 J.994 P1  F30000
G1 X119.006 Y120.914 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2106
G1 X119.006 Y118.994 E.059
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.914 E.059
G1 X118.946 Y120.914 E.02924
G1 X118.659 Y120.567 F30000
; LINE_WIDTH: 0.360223
G1 F2106
G1 X118.659 Y119.341 E.03169
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.567 E.03169
G1 X118.599 Y120.567 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.567 E-.09778
G1 X118.341 Y119.341 E-.46576
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.541 E-.07589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I-1.212 J-.109 P1  F30000
G1 X117.602 Y131.306 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2106
G1 X117.602 Y124.694 E.21935
G1 X119.398 Y124.694 E.05957
G1 X119.398 Y131.306 E.21935
G1 X117.662 Y131.306 E.05758
G1 X117.21 Y131.57 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2106
G1 X117.21 Y124.348 E.22189
G1 X117.21 Y124.302 E.00144
G1 X119.79 Y124.302 E.07928
G1 X119.79 Y124.348 E.00144
G1 X119.79 Y131.652 E.22441
G1 X119.79 Y131.698 E.00144
G1 X117.21 Y131.698 E.07928
G1 X117.21 Y131.652 E.00144
G1 X117.21 Y131.63 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X117.21 Y129.63 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I1.112 J.495 P1  F30000
G1 X119.006 Y125.592 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2106
G1 X119.006 Y125.086 E.01554
G1 X117.994 Y125.086 E.03109
G1 X117.994 Y130.914 E.17909
G1 X119.006 Y130.914 E.03109
G1 X119.006 Y125.652 E.1617
G1 X118.659 Y125.592 F30000
; LINE_WIDTH: 0.360223
G1 F2106
G1 X118.659 Y125.433 E.0041
G1 X118.341 Y125.433 E.0082
G1 X118.341 Y130.567 E.13275
G1 X118.659 Y130.567 E.0082
G1 X118.659 Y125.652 E.12709
; WIPE_START
G1 F24000
G1 X118.659 Y127.652 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I-1.213 J.092 P1  F30000
G1 X119.398 Y137.398 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2106
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.694 E.0897
G1 X119.398 Y134.694 E.05957
G1 X119.398 Y137.338 E.08771
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2106
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.348 E.10575
G1 X117.21 Y134.302 E.00144
G1 X119.79 Y134.302 E.07928
G1 X119.79 Y134.348 E.00144
G1 X119.79 Y134.43 E.00252
G1 X119.79 Y137.73 E.10139
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I1.109 J.501 P1  F30000
G1 X119.006 Y135.086 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2106
G1 X117.994 Y135.086 E.03109
G1 X117.994 Y137.006 E.059
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.146 E.05715
G1 X118.659 Y135.433 F30000
; LINE_WIDTH: 0.360223
G1 F2106
G1 X118.341 Y135.433 E.0082
G1 X118.341 Y136.659 E.03169
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.493 E.03014
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.44296
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y136.142 E-.19647
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I.079 J1.214 P1  F30000
G1 X140.602 Y134.694 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2106
G1 X142.398 Y134.694 E.05957
G1 X142.398 Y137.398 E.0897
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.754 E.08771
G1 X140.21 Y134.348 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2106
G1 X140.21 Y134.302 E.00144
G1 X142.79 Y134.302 E.07928
G1 X142.79 Y134.348 E.00144
G1 X142.79 Y134.43 E.00252
G1 X142.79 Y137.79 E.10323
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.408 E.10391
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y134.302 E-.04056
G1 X142.103 Y134.302 E-.71944
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I-.703 J-.994 P1  F30000
G1 X140.994 Y135.086 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2106
G1 X140.994 Y137.006 E.059
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.086 E.059
G1 X141.054 Y135.086 E.02924
G1 X141.341 Y135.433 F30000
; LINE_WIDTH: 0.360223
G1 F2106
G1 X141.341 Y136.659 E.03169
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.433 E.03169
G1 X141.401 Y135.433 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.433 E-.09778
G1 X141.659 Y136.659 E-.46576
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.459 E-.07589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I1.215 J-.076 P1  F30000
G1 X140.602 Y124.694 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2106
G1 X142.398 Y124.694 E.05957
G1 X142.398 Y131.306 E.21935
G1 X140.602 Y131.306 E.05957
G1 X140.602 Y124.754 E.21736
G1 X140.21 Y124.348 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2106
G1 X140.21 Y124.302 E.00144
G1 X142.79 Y124.302 E.07928
G1 X142.79 Y124.348 E.00144
G1 X142.79 Y131.652 E.22441
G1 X142.79 Y131.698 E.00144
G1 X140.21 Y131.698 E.07928
G1 X140.21 Y131.652 E.00144
G1 X140.21 Y131.57 E.00252
G1 X140.21 Y124.408 E.22005
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y124.302 E-.04056
G1 X142.103 Y124.302 E-.71944
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I-.703 J-.994 P1  F30000
G1 X140.994 Y125.086 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2106
G1 X140.994 Y130.914 E.17909
G1 X142.006 Y130.914 E.03109
G1 X142.006 Y125.086 E.17909
G1 X141.054 Y125.086 E.02924
G1 X141.341 Y125.433 F30000
; LINE_WIDTH: 0.360223
G1 F2106
G1 X141.341 Y130.567 E.13275
G1 X141.659 Y130.567 E.0082
G1 X141.659 Y125.433 E.13275
G1 X141.401 Y125.433 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y125.433 E-.09778
G1 X141.659 Y127.176 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I1.198 J-.216 P1  F30000
G1 X140.602 Y121.306 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2106
G1 X140.602 Y118.602 E.0897
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.306 E.0897
G1 X140.662 Y121.306 E.05758
G1 X140.21 Y121.57 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2106
G1 X140.21 Y118.21 E.10323
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.652 E.10575
G1 X142.79 Y121.698 E.00144
G1 X140.21 Y121.698 E.07928
G1 X140.21 Y121.652 E.00144
G1 X140.21 Y121.63 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y119.63 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I-1.039 J.634 P1  F30000
G1 X140.994 Y120.914 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2106
G1 X142.006 Y120.914 E.03109
G1 X142.006 Y118.994 E.059
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.854 E.05715
G1 X141.341 Y120.567 F30000
; LINE_WIDTH: 0.360223
G1 F2106
G1 X141.659 Y120.567 E.0082
G1 X141.659 Y119.341 E.03169
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.507 E.03014
; CHANGE_LAYER
; Z_HEIGHT: 29.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.44296
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y119.858 E-.19647
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 147/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L147
M991 S0 P146 ;notify layer change
G17
G3 Z29.6 I-.092 J-1.213 P1  F30000
G1 X119.398 Y121.554 Z29.6
G1 Z29.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2247
G1 X117.602 Y121.554 E.05957
G1 X117.602 Y118.602 E.09792
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.494 E.09593
G1 X119.79 Y121.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2247
G1 X119.79 Y121.903 E.00504
M106 S255
G1 F1800
G1 X119.79 Y121.946 E.00131
G1 X117.21 Y121.946 E.07928
G1 X117.21 Y121.903 E.00131
M106 S252.45
G1 F2247
G1 X117.21 Y121.739 E.00504
G1 X117.21 Y118.21 E.10845
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.679 E.1066
M204 S10000
G1 X119.006 Y121.162 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2247
G1 X119.006 Y118.994 E.06661
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y121.162 E.06661
G1 X118.946 Y121.162 E.02924
G1 X118.659 Y120.815 F30000
; LINE_WIDTH: 0.360223
G1 F2247
G1 X118.659 Y119.341 E.0381
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.815 E.0381
G1 X118.599 Y120.815 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.815 E-.09778
G1 X118.341 Y119.341 E-.55988
G1 X118.611 Y119.341 E-.10235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.8 I-1.213 J-.1 P1  F30000
G1 X117.602 Y131.554 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2247
G1 X117.602 Y124.446 E.23578
G1 X119.398 Y124.446 E.05957
G1 X119.398 Y131.554 E.23578
G1 X117.662 Y131.554 E.05758
G1 X117.21 Y131.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2247
G1 X117.21 Y124.261 E.2298
G1 X117.21 Y124.097 E.00504
M106 S255
G1 F1800
G1 X117.21 Y124.054 E.00131
G1 X119.79 Y124.054 E.07928
G1 X119.79 Y124.097 E.00131
M106 S252.45
G1 F2247
G1 X119.79 Y124.261 E.00504
G1 X119.79 Y131.739 E.2298
G1 X119.79 Y131.903 E.00504
M106 S255
G1 F1800
G1 X119.79 Y131.946 E.00131
G1 X117.21 Y131.946 E.07928
G1 X117.21 Y131.903 E.00131
M106 S252.45
G1 F2247
G1 X117.21 Y131.799 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X117.21 Y129.799 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.8 I1.129 J.455 P1  F30000
G1 X119.006 Y125.344 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2247
G1 X119.006 Y124.838 E.01554
G1 X117.994 Y124.838 E.03109
G1 X117.994 Y131.162 E.19431
G1 X119.006 Y131.162 E.03109
G1 X119.006 Y125.404 E.17693
G1 X118.659 Y125.344 F30000
; LINE_WIDTH: 0.360223
G1 F2247
G1 X118.659 Y125.185 E.0041
G1 X118.341 Y125.185 E.0082
G1 X118.341 Y130.815 E.14556
G1 X118.659 Y130.815 E.0082
G1 X118.659 Y125.404 E.1399
; WIPE_START
G1 F24000
G1 X118.659 Y127.404 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.8 I-1.214 J.09 P1  F30000
G1 X119.398 Y137.398 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2247
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.446 E.09792
G1 X119.398 Y134.446 E.05957
G1 X119.398 Y137.338 E.09593
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2247
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.261 E.10845
G1 X117.21 Y134.097 E.00504
M106 S255
G1 F1800
G1 X117.21 Y134.054 E.00131
G1 X119.79 Y134.054 E.07928
G1 X119.79 Y134.097 E.00131
M106 S252.45
G1 F2247
G1 X119.79 Y134.261 E.00504
G1 X119.79 Y137.73 E.1066
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.8 I1.125 J.465 P1  F30000
G1 X119.006 Y134.838 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2247
G1 X117.994 Y134.838 E.03109
G1 X117.994 Y137.006 E.06661
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y134.898 E.06477
G1 X118.659 Y135.185 F30000
; LINE_WIDTH: 0.360223
G1 F2247
G1 X118.341 Y135.185 E.0082
G1 X118.341 Y136.659 E.0381
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.245 E.03654
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.53708
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y136.389 E-.10235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.8 I.106 J1.212 P1  F30000
G1 X140.602 Y134.446 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2247
G1 X142.398 Y134.446 E.05957
G1 X142.398 Y137.398 E.09792
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.506 E.09593
G1 X140.21 Y134.261 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2247
G1 X140.21 Y134.097 E.00504
M106 S255
G1 F1800
G1 X140.21 Y134.054 E.00131
G1 X142.79 Y134.054 E.07928
G1 X142.79 Y134.097 E.00131
M106 S252.45
G1 F2247
G1 X142.79 Y134.261 E.00504
G1 X142.79 Y137.79 E.10845
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.321 E.1066
M204 S10000
G1 X140.994 Y134.838 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2247
G1 X140.994 Y137.006 E.06661
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y134.838 E.06661
G1 X141.054 Y134.838 E.02924
G1 X141.341 Y135.185 F30000
; LINE_WIDTH: 0.360223
G1 F2247
G1 X141.341 Y136.659 E.0381
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.185 E.0381
G1 X141.401 Y135.185 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.185 E-.09778
G1 X141.659 Y136.659 E-.55988
G1 X141.389 Y136.659 E-.10235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.8 I1.214 J-.078 P1  F30000
G1 X140.602 Y124.446 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2247
G1 X142.398 Y124.446 E.05957
G1 X142.398 Y131.554 E.23578
G1 X140.602 Y131.554 E.05957
G1 X140.602 Y124.506 E.23379
G1 X140.21 Y124.261 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2247
G1 X140.21 Y124.097 E.00504
M106 S255
G1 F1800
G1 X140.21 Y124.054 E.00131
G1 X142.79 Y124.054 E.07928
G1 X142.79 Y124.097 E.00131
M106 S252.45
G1 F2247
G1 X142.79 Y124.261 E.00504
G1 X142.79 Y131.739 E.2298
G1 X142.79 Y131.903 E.00504
M106 S255
G1 F1800
G1 X142.79 Y131.946 E.00131
G1 X140.21 Y131.946 E.07928
G1 X140.21 Y131.903 E.00131
M106 S252.45
G1 F2247
G1 X140.21 Y131.739 E.00504
G1 X140.21 Y124.321 E.22796
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y124.097 E-.08512
G1 X140.21 Y124.054 E-.01622
G1 X141.943 Y124.054 E-.65866
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.8 I-1.206 J-.161 P1  F30000
G1 X140.994 Y131.162 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2247
G1 X142.006 Y131.162 E.03109
G1 X142.006 Y124.838 E.19431
G1 X140.994 Y124.838 E.03109
G1 X140.994 Y131.102 E.19247
G1 X141.341 Y130.815 F30000
; LINE_WIDTH: 0.360223
G1 F2247
G1 X141.659 Y130.815 E.0082
G1 X141.659 Y125.185 E.14556
G1 X141.341 Y125.185 E.0082
G1 X141.341 Y130.755 E.144
; WIPE_START
G1 F24000
G1 X141.341 Y128.755 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.8 I1.211 J-.124 P1  F30000
G1 X140.602 Y121.554 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2247
G1 X140.602 Y118.602 E.09792
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.554 E.09792
G1 X140.662 Y121.554 E.05758
G1 X140.21 Y121.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2247
M73 P79 R7
G1 X140.21 Y118.21 E.10845
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.739 E.10845
G1 X142.79 Y121.903 E.00504
M106 S255
G1 F1800
G1 X142.79 Y121.946 E.00131
G1 X140.21 Y121.946 E.07928
G1 X140.21 Y121.903 E.00131
M106 S252.45
G1 F2247
G1 X140.21 Y121.799 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y119.799 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.8 I-1.055 J.607 P1  F30000
G1 X140.994 Y121.162 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2247
G1 X142.006 Y121.162 E.03109
G1 X142.006 Y118.994 E.06661
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y121.102 E.06477
G1 X141.341 Y120.815 F30000
; LINE_WIDTH: 0.360223
G1 F2247
G1 X141.659 Y120.815 E.0082
G1 X141.659 Y119.341 E.0381
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.755 E.03654
; CHANGE_LAYER
; Z_HEIGHT: 29.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.53708
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y119.611 E-.10235
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 148/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L148
M991 S0 P147 ;notify layer change
G17
G3 Z29.8 I.055 J-1.216 P1  F30000
G1 X119.398 Y118.602 Z29.8
G1 Z29.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2441
G1 X119.398 Y121.974 E.11184
G1 X119.398 Y122.009 E.00118
G1 X117.602 Y122.009 E.05957
G1 X117.602 Y121.974 E.00118
G1 X117.602 Y118.602 E.11184
G1 X119.338 Y118.602 E.05758
G1 X119.79 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X119.79 Y122.356 E.1274
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.79 Y122.401 E.0015
G1 X117.21 Y122.401 E.08558
G1 X117.21 Y122.356 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X117.21 Y121.987 E.01134
G1 X117.21 Y118.21 E.11606
G1 X119.73 Y118.21 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.759 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30 I-1.073 J-.574 P1  F30000
G1 X119.006 Y121.617 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2441
G1 X119.006 Y118.994 E.0806
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y121.617 E.0806
G1 X118.946 Y121.617 E.02924
G1 X118.659 Y121.27 F30000
; LINE_WIDTH: 0.360223
G1 F2441
G1 X118.659 Y119.341 E.04987
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y121.27 E.04987
G1 X118.599 Y121.27 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y121.27 E-.09778
G1 X118.341 Y119.527 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30 I-1.215 J-.075 P1  F30000
G1 X117.602 Y131.448 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2441
G1 X117.602 Y124.026 E.24618
G1 X117.602 Y123.991 E.00118
G1 X119.398 Y123.991 E.05957
G1 X119.398 Y124.026 E.00118
G1 X119.398 Y131.974 E.26362
G1 X119.398 Y132.009 E.00118
G1 X117.602 Y132.009 E.05957
G1 X117.602 Y131.974 E.00118
G1 X117.602 Y131.508 E.01545
G1 X117.21 Y131.448 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X117.21 Y123.644 E.23979
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X117.21 Y123.599 E.0015
G1 X119.79 Y123.599 E.08558
G1 X119.79 Y123.644 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X119.79 Y132.356 E.2677
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.79 Y132.401 E.0015
G1 X117.21 Y132.401 E.08558
G1 X117.21 Y132.356 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X117.21 Y131.987 E.01134
G1 X117.21 Y131.508 E.01473
M204 S10000
; WIPE_START
G1 F24000
G1 X117.21 Y129.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30 I1.134 J.441 P1  F30000
G1 X119.006 Y124.889 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2441
G1 X119.006 Y124.383 E.01554
G1 X117.994 Y124.383 E.03109
G1 X117.994 Y131.617 E.22229
G1 X119.006 Y131.617 E.03109
G1 X119.006 Y124.949 E.20491
G1 X118.659 Y124.889 F30000
; LINE_WIDTH: 0.360223
G1 F2441
G1 X118.659 Y124.73 E.0041
G1 X118.341 Y124.73 E.0082
G1 X118.341 Y131.27 E.1691
G1 X118.659 Y131.27 E.0082
G1 X118.659 Y124.949 E.16345
; WIPE_START
G1 F24000
G1 X118.659 Y126.949 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30 I-1.214 J.086 P1  F30000
G1 X119.398 Y137.398 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2441
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.026 E.11184
G1 X117.602 Y133.991 E.00118
G1 X119.398 Y133.991 E.05957
G1 X119.398 Y134.026 E.00118
G1 X119.398 Y137.338 E.10985
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y133.644 E.1274
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X117.21 Y133.599 E.0015
G1 X119.79 Y133.599 E.08558
G1 X119.79 Y133.644 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X119.79 Y134.013 E.01134
G1 X119.79 Y137.73 E.11421
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30 I1.146 J.41 P1  F30000
G1 X119.006 Y134.383 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2441
G1 X117.994 Y134.383 E.03109
G1 X117.994 Y137.006 E.0806
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y134.443 E.07875
G1 X118.659 Y134.73 F30000
; LINE_WIDTH: 0.360223
G1 F2441
G1 X118.341 Y134.73 E.0082
G1 X118.341 Y136.659 E.04987
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y134.79 E.04832
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.71009
G1 X118.527 Y136.659 E-.04991
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30 I-.041 J1.216 P1  F30000
G1 X140.602 Y137.398 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2441
G1 X140.602 Y134.026 E.11184
G1 X140.602 Y133.991 E.00118
G1 X142.398 Y133.991 E.05957
G1 X142.398 Y134.026 E.00118
G1 X142.398 Y137.398 E.11184
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X140.21 Y133.644 E.1274
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.21 Y133.599 E.0015
G1 X142.79 Y133.599 E.08558
G1 X142.79 Y133.644 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X142.79 Y134.013 E.01134
G1 X142.79 Y137.79 E.11606
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.241 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30 I1.073 J.574 P1  F30000
G1 X140.994 Y134.383 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2441
G1 X140.994 Y137.006 E.0806
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y134.383 E.0806
G1 X141.054 Y134.383 E.02924
G1 X141.341 Y134.73 F30000
; LINE_WIDTH: 0.360223
G1 F2441
G1 X141.341 Y136.659 E.04987
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y134.73 E.04987
G1 X141.401 Y134.73 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y134.73 E-.09778
G1 X141.659 Y136.473 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30 I1.185 J-.279 P1  F30000
G1 X140.602 Y131.987 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2441
G1 X140.602 Y131.974 E.00045
G1 X140.602 Y124.026 E.26362
G1 X140.602 Y123.991 E.00118
G1 X142.398 Y123.991 E.05957
G1 X142.398 Y124.026 E.00118
G1 X142.398 Y131.974 E.26362
G1 X142.398 Y132.009 E.00118
G1 X140.64 Y132.009 E.05832
G1 X140.21 Y131.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X140.21 Y123.644 E.25636
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.21 Y123.599 E.0015
G1 X142.79 Y123.599 E.08558
G1 X142.79 Y123.644 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X142.79 Y132.356 E.2677
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.79 Y132.401 E.0015
G1 X140.21 Y132.401 E.08558
G1 X140.21 Y132.356 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X140.21 Y132.047 E.00949
M204 S10000
G1 X140.994 Y131.617 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2441
G1 X142.006 Y131.617 E.03109
G1 X142.006 Y124.383 E.22229
G1 X140.994 Y124.383 E.03109
G1 X140.994 Y131.557 E.22045
G1 X141.341 Y131.27 F30000
; LINE_WIDTH: 0.360223
G1 F2441
G1 X141.659 Y131.27 E.0082
G1 X141.659 Y124.73 E.1691
G1 X141.341 Y124.73 E.0082
G1 X141.341 Y131.21 E.16755
; WIPE_START
G1 F24000
G1 X141.341 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30 I1.214 J-.085 P1  F30000
G1 X140.602 Y118.602 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2441
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.974 E.11184
G1 X142.398 Y122.009 E.00118
G1 X140.602 Y122.009 E.05957
G1 X140.602 Y121.974 E.00118
G1 X140.602 Y118.662 E.10985
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y122.356 E.1274
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.79 Y122.401 E.0015
G1 X140.21 Y122.401 E.08558
G1 X140.21 Y122.356 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2441
G1 X140.21 Y121.987 E.01134
G1 X140.21 Y118.27 E.11421
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30 I-1.146 J-.41 P1  F30000
G1 X140.994 Y121.617 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2441
G1 X142.006 Y121.617 E.03109
G1 X142.006 Y118.994 E.0806
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y121.557 E.07875
G1 X141.341 Y121.27 F30000
; LINE_WIDTH: 0.360223
G1 F2441
G1 X141.659 Y121.27 E.0082
G1 X141.659 Y119.341 E.04987
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y121.21 E.04832
; CHANGE_LAYER
; Z_HEIGHT: 29.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.71009
G1 X141.473 Y119.341 E-.04991
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 149/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L149
M991 S0 P148 ;notify layer change
G17
G3 Z30 I.788 J-.928 P1  F30000
G1 X140.602 Y118.602 Z30
G1 Z29.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2376
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y122.811 E.13963
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.398 Y123.189 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2376
G1 X142.398 Y132.811 E.3192
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.398 Y133.189 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2376
G1 X142.398 Y133.571 E.01269
G1 X142.398 Y137.398 E.12694
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y133.189 E.13963
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X140.602 Y132.811 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2376
G1 X140.602 Y123.189 E.3192
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X140.602 Y122.811 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2376
G1 X140.602 Y118.662 E.13764
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2376
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y122.811 E.14139
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.79 Y123.189 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2376
G1 X142.79 Y132.811 E.29568
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.79 Y133.189 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2376
G1 X142.79 Y133.558 E.01134
G1 X142.79 Y137.79 E.13005
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y133.189 E.14139
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.21 Y132.811 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2376
G1 X140.21 Y123.189 E.29568
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.21 Y122.811 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2376
G1 X140.21 Y118.27 E.13954
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.2 I-1.139 J-.427 P1  F30000
G1 X140.994 Y121.463 Z30.2
G1 Z29.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2376
G1 X142.006 Y121.463 E.03109
G1 X142.006 Y118.994 E.07585
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y121.403 E.07401
G1 X141.341 Y121.116 F30000
; LINE_WIDTH: 0.360223
G1 F2376
G1 X141.659 Y121.116 E.0082
G1 X141.659 Y119.341 E.04588
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y121.056 E.04432
G1 X140.973 Y121.67 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.495415
M106 S255
G1 F3000
G1 X140.973 Y124.16 E.09181
G1 X141.426 Y124.16 E.01668
G1 X141.426 Y121.84 E.08555
G1 X141.878 Y121.84 E.01668
G1 X141.878 Y124.33 E.09181
M106 S252.45
G1 X140.994 Y131.463 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2376
G1 X142.006 Y131.463 E.03109
G1 X142.006 Y124.537 E.2128
G1 X140.994 Y124.537 E.03109
G1 X140.994 Y131.403 E.21096
G1 X141.341 Y131.116 F30000
; LINE_WIDTH: 0.360223
G1 F2376
G1 X141.659 Y131.116 E.0082
G1 X141.659 Y124.884 E.16112
G1 X141.341 Y124.884 E.0082
G1 X141.341 Y131.056 E.15956
G1 X140.973 Y131.67 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.495415
M106 S255
G1 F3000
G1 X140.973 Y134.16 E.09181
G1 X141.426 Y134.16 E.01668
G1 X141.426 Y131.84 E.08555
G1 X141.878 Y131.84 E.01668
G1 X141.878 Y134.33 E.09181
M106 S252.45
G1 X140.994 Y134.537 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2376
G1 X140.994 Y137.006 E.07585
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y134.537 E.07585
G1 X141.054 Y134.537 E.02924
G1 X141.341 Y134.884 F30000
; LINE_WIDTH: 0.360223
G1 F2376
G1 X141.341 Y136.659 E.04588
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y134.884 E.04588
G1 X141.401 Y134.884 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y134.884 E-.09778
G1 X141.659 Y136.627 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.2 I-.042 J-1.216 P1  F30000
G1 X119.398 Y137.398 Z30.2
G1 Z29.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2376
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y133.189 E.13963
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X117.602 Y132.811 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2376
G1 X117.602 Y123.189 E.3192
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X117.602 Y122.811 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2376
G1 X117.602 Y118.602 E.13963
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y122.811 E.13963
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X119.398 Y123.189 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2376
G1 X119.398 Y132.811 E.3192
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X119.398 Y133.189 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2376
G1 X119.398 Y133.571 E.01269
G1 X119.398 Y137.338 E.12495
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2376
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y133.189 E.14139
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X117.21 Y132.811 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2376
G1 X117.21 Y123.189 E.29568
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X117.21 Y122.811 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2376
G1 X117.21 Y118.21 E.14139
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y122.811 E.14139
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.79 Y123.189 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2376
G1 X119.79 Y132.811 E.29568
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.79 Y133.189 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2376
G1 X119.79 Y133.558 E.01134
G1 X119.79 Y137.73 E.1282
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.2 I1.139 J.427 P1  F30000
G1 X119.006 Y134.537 Z30.2
G1 Z29.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2376
G1 X117.994 Y134.537 E.03109
G1 X117.994 Y137.006 E.07585
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y134.597 E.07401
G1 X118.659 Y134.884 F30000
; LINE_WIDTH: 0.360223
G1 F2376
G1 X118.341 Y134.884 E.0082
G1 X118.341 Y136.659 E.04588
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y134.944 E.04432
G1 X118.878 Y134.33 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.495415
M106 S255
G1 F3000
G1 X118.878 Y131.84 E.09181
G1 X118.426 Y131.84 E.01668
G1 X118.426 Y134.16 E.08555
G1 X117.973 Y134.16 E.01668
G1 X117.973 Y131.67 E.09181
M106 S252.45
G1 X119.006 Y125.043 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2376
G1 X119.006 Y124.537 E.01554
G1 X117.994 Y124.537 E.03109
G1 X117.994 Y131.463 E.2128
G1 X119.006 Y131.463 E.03109
G1 X119.006 Y125.103 E.19542
G1 X118.659 Y125.043 F30000
; LINE_WIDTH: 0.360223
G1 F2376
G1 X118.659 Y124.884 E.0041
G1 X118.341 Y124.884 E.0082
G1 X118.341 Y131.116 E.16112
G1 X118.659 Y131.116 E.0082
G1 X118.659 Y125.103 E.15546
G1 X118.878 Y124.33 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.495415
M106 S255
G1 F3000
G1 X118.878 Y121.84 E.09181
G1 X118.426 Y121.84 E.01668
G1 X118.426 Y124.16 E.08555
G1 X117.973 Y124.16 E.01668
G1 X117.973 Y121.67 E.09181
M106 S252.45
G1 X119.006 Y121.463 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2376
G1 X119.006 Y118.994 E.07585
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y121.463 E.07585
G1 X118.946 Y121.463 E.02924
G1 X118.659 Y121.116 F30000
; LINE_WIDTH: 0.360223
G1 F2376
G1 X118.659 Y119.341 E.04588
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y121.116 E.04588
G1 X118.599 Y121.116 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 30
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.341 Y121.116 E-.09778
G1 X118.341 Y119.373 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 150/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L150
M991 S0 P149 ;notify layer change
G17
G3 Z30.2 I.042 J1.216 P1  F30000
G1 X140.602 Y118.602 Z30.2
G1 Z30
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1832
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1832
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.4 I-1.196 J-.225 P1  F30000
G1 X140.994 Y124.675 Z30.4
G1 Z30
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1832
G1 X142.006 Y124.675 E.03109
G1 X142.006 Y121.325 E.10293
G1 X140.994 Y121.325 E.03109
G1 X140.994 Y124.615 E.10108
G1 X141.341 Y124.328 F30000
; LINE_WIDTH: 0.360223
G1 F1832
G1 X141.659 Y124.328 E.0082
G1 X141.659 Y121.672 E.06866
G1 X141.341 Y121.672 E.0082
G1 X141.341 Y124.268 E.0671
G1 X140.994 Y131.325 F30000
; LINE_WIDTH: 0.419999
G1 F1832
G1 X140.994 Y134.675 E.10293
G1 X142.006 Y134.675 E.03109
G1 X142.006 Y131.325 E.10293
G1 X141.054 Y131.325 E.02924
G1 X141.341 Y131.672 F30000
; LINE_WIDTH: 0.360223
G1 F1832
G1 X141.341 Y134.328 E.06866
G1 X141.659 Y134.328 E.0082
G1 X141.659 Y131.672 E.06866
G1 X141.401 Y131.672 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y131.672 E-.09778
G1 X141.659 Y133.415 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.4 I-.214 J-1.198 P1  F30000
G1 X119.398 Y137.398 Z30.4
G1 Z30
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1832
M73 P80 R7
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1832
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.4 I1.196 J.225 P1  F30000
G1 X119.006 Y131.325 Z30.4
G1 Z30
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1832
G1 X117.994 Y131.325 E.03109
G1 X117.994 Y134.675 E.10293
G1 X119.006 Y134.675 E.03109
G1 X119.006 Y131.385 E.10108
G1 X118.659 Y131.672 F30000
; LINE_WIDTH: 0.360223
G1 F1832
G1 X118.341 Y131.672 E.0082
G1 X118.341 Y134.328 E.06866
G1 X118.659 Y134.328 E.0082
G1 X118.659 Y131.732 E.0671
G1 X119.006 Y124.675 F30000
; LINE_WIDTH: 0.419999
G1 F1832
G1 X119.006 Y121.325 E.10293
G1 X117.994 Y121.325 E.03109
G1 X117.994 Y124.675 E.10293
G1 X118.946 Y124.675 E.02924
G1 X118.659 Y124.328 F30000
; LINE_WIDTH: 0.360223
G1 F1832
G1 X118.659 Y121.672 E.06866
G1 X118.341 Y121.672 E.0082
G1 X118.341 Y124.328 E.06866
G1 X118.599 Y124.328 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 30.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.341 Y124.328 E-.09778
G1 X118.341 Y122.585 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 151/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L151
M991 S0 P150 ;notify layer change
G17
G3 Z30.4 I.214 J1.198 P1  F30000
G1 X140.602 Y118.602 Z30.4
G1 Z30.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1832
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1832
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.6 I-1.196 J-.225 P1  F30000
G1 X140.994 Y124.675 Z30.6
G1 Z30.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1832
G1 X142.006 Y124.675 E.03109
G1 X142.006 Y121.325 E.10293
G1 X140.994 Y121.325 E.03109
G1 X140.994 Y124.615 E.10108
G1 X141.341 Y124.328 F30000
; LINE_WIDTH: 0.360223
G1 F1832
G1 X141.659 Y124.328 E.0082
G1 X141.659 Y121.672 E.06866
G1 X141.341 Y121.672 E.0082
G1 X141.341 Y124.268 E.0671
G1 X140.994 Y131.325 F30000
; LINE_WIDTH: 0.419999
G1 F1832
G1 X140.994 Y134.675 E.10293
G1 X142.006 Y134.675 E.03109
G1 X142.006 Y131.325 E.10293
G1 X141.054 Y131.325 E.02924
G1 X141.341 Y131.672 F30000
; LINE_WIDTH: 0.360223
G1 F1832
G1 X141.341 Y134.328 E.06866
G1 X141.659 Y134.328 E.0082
G1 X141.659 Y131.672 E.06866
G1 X141.401 Y131.672 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y131.672 E-.09778
G1 X141.659 Y133.415 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.6 I-.214 J-1.198 P1  F30000
G1 X119.398 Y137.398 Z30.6
G1 Z30.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1832
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1832
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.6 I1.196 J.225 P1  F30000
G1 X119.006 Y131.325 Z30.6
G1 Z30.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1832
G1 X117.994 Y131.325 E.03109
G1 X117.994 Y134.675 E.10293
G1 X119.006 Y134.675 E.03109
G1 X119.006 Y131.385 E.10108
G1 X118.659 Y131.672 F30000
; LINE_WIDTH: 0.360223
G1 F1832
G1 X118.341 Y131.672 E.0082
G1 X118.341 Y134.328 E.06866
G1 X118.659 Y134.328 E.0082
G1 X118.659 Y131.732 E.0671
G1 X119.006 Y124.675 F30000
; LINE_WIDTH: 0.419999
G1 F1832
G1 X119.006 Y121.325 E.10293
G1 X117.994 Y121.325 E.03109
G1 X117.994 Y124.675 E.10293
G1 X118.946 Y124.675 E.02924
G1 X118.659 Y124.328 F30000
; LINE_WIDTH: 0.360223
G1 F1832
G1 X118.659 Y121.672 E.06866
G1 X118.341 Y121.672 E.0082
G1 X118.341 Y124.328 E.06866
G1 X118.599 Y124.328 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 30.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X118.341 Y124.328 E-.09778
G1 X118.341 Y122.585 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 152/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L152
M991 S0 P151 ;notify layer change
G17
G3 Z30.6 I.214 J1.198 P1  F30000
G1 X140.602 Y118.602 Z30.6
G1 Z30.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.8 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z30.8
G1 Z30.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.8 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z30.8
G1 Z30.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.8 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z30.8
G1 Z30.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
M73 P80 R6
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 30.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 153/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L153
M991 S0 P152 ;notify layer change
G17
G3 Z30.8 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z30.8
G1 Z30.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z31
G1 Z30.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
M73 P81 R6
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z31
G1 Z30.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z31
G1 Z30.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 30.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 154/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L154
M991 S0 P153 ;notify layer change
G17
G3 Z31 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z31
G1 Z30.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.2 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z31.2
G1 Z30.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.2 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z31.2
G1 Z30.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.2 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z31.2
G1 Z30.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 31
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 155/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L155
M991 S0 P154 ;notify layer change
G17
G3 Z31.2 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z31.2
G1 Z31
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.4 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z31.4
G1 Z31
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.4 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z31.4
G1 Z31
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.4 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z31.4
G1 Z31
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
M73 P82 R6
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 31.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 156/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L156
M991 S0 P155 ;notify layer change
G17
G3 Z31.4 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z31.4
G1 Z31.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.6 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z31.6
G1 Z31.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.6 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z31.6
G1 Z31.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.6 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z31.6
G1 Z31.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 31.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 157/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L157
M991 S0 P156 ;notify layer change
G17
G3 Z31.6 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z31.6
G1 Z31.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.8 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z31.8
G1 Z31.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.8 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z31.8
G1 Z31.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.8 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z31.8
G1 Z31.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 31.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 158/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L158
M991 S0 P157 ;notify layer change
G17
G3 Z31.8 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z31.8
G1 Z31.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z32
G1 Z31.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
M73 P83 R6
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z32
G1 Z31.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z32
G1 Z31.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 31.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 159/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L159
M991 S0 P158 ;notify layer change
G17
G3 Z32 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z32
G1 Z31.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.2 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z32.2
G1 Z31.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.2 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z32.2
G1 Z31.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.2 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z32.2
G1 Z31.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
M73 P83 R5
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 32
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 160/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L160
M991 S0 P159 ;notify layer change
G17
G3 Z32.2 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z32.2
G1 Z32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.4 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z32.4
G1 Z32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.4 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z32.4
G1 Z32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.4 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z32.4
G1 Z32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
M73 P84 R5
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 32.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 161/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L161
M991 S0 P160 ;notify layer change
G17
G3 Z32.4 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z32.4
G1 Z32.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.6 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z32.6
G1 Z32.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.6 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z32.6
G1 Z32.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.6 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z32.6
G1 Z32.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 32.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 162/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L162
M991 S0 P161 ;notify layer change
G17
G3 Z32.6 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z32.6
G1 Z32.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.8 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z32.8
G1 Z32.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.8 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z32.8
G1 Z32.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.8 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z32.8
G1 Z32.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 32.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 163/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L163
M991 S0 P162 ;notify layer change
G17
G3 Z32.8 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z32.8
G1 Z32.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z33
G1 Z32.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
M73 P85 R5
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z33
G1 Z32.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z33
G1 Z32.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 32.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 164/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L164
M991 S0 P163 ;notify layer change
G17
G3 Z33 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z33
G1 Z32.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.2 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z33.2
G1 Z32.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.2 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z33.2
G1 Z32.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.2 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z33.2
G1 Z32.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 33
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 165/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L165
M991 S0 P164 ;notify layer change
G17
G3 Z33.2 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z33.2
G1 Z33
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.4 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z33.4
G1 Z33
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.4 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z33.4
G1 Z33
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.4 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z33.4
G1 Z33
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
M73 P86 R5
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 33.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 166/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L166
M991 S0 P165 ;notify layer change
G17
G3 Z33.4 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z33.4
G1 Z33.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.6 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z33.6
G1 Z33.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.6 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z33.6
G1 Z33.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.6 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z33.6
G1 Z33.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
M73 P86 R4
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 33.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 167/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L167
M991 S0 P166 ;notify layer change
G17
G3 Z33.6 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z33.6
G1 Z33.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.8 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z33.8
G1 Z33.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.8 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z33.8
G1 Z33.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.8 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z33.8
G1 Z33.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 33.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 168/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L168
M991 S0 P167 ;notify layer change
G17
G3 Z33.8 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z33.8
G1 Z33.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z34
G1 Z33.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
M73 P87 R4
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z34
G1 Z33.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z34
G1 Z33.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 33.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 169/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L169
M991 S0 P168 ;notify layer change
G17
G3 Z34 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z34
G1 Z33.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.2 I-1.154 J-.388 P1  F30000
G1 X140.95 Y121.97 Z34.2
G1 Z33.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X140.95 Y123.598 E.05401
G1 X142.05 Y124.698 E.05157
G1 X142.05 Y123.626 E.03554
G1 X140.95 Y124.726 E.05157
G1 X140.95 Y131.274 E.21723
G1 X142.05 Y132.374 E.05157
G1 X142.05 Y131.302 E.03554
G1 X140.95 Y132.402 E.05157
G1 X140.95 Y134.03 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y132.402 E-.61876
G1 X141.213 Y132.139 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.2 I-.285 J-1.183 P1  F30000
G1 X119.398 Y137.398 Z34.2
G1 Z33.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1648
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.2 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z34.2
G1 Z33.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1648
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 34
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 170/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L170
M991 S0 P169 ;notify layer change
G17
G3 Z34.2 I.285 J1.183 P1  F30000
G1 X140.602 Y118.602 Z34.2
G1 Z34
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2345
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2345
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.4 I-1.205 J-.172 P1  F30000
G1 X140.994 Y126.715 Z34.4
G1 Z34
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2345
G1 X142.006 Y126.715 E.03109
G1 X142.006 Y119.285 E.22829
G1 X140.994 Y119.285 E.03109
G1 X140.994 Y126.655 E.22645
G1 X141.341 Y126.368 F30000
; LINE_WIDTH: 0.360223
G1 F2345
G1 X141.659 Y126.368 E.0082
G1 X141.659 Y119.632 E.17415
G1 X141.341 Y119.632 E.0082
G1 X141.341 Y126.308 E.1726
G1 X140.994 Y129.285 F30000
; LINE_WIDTH: 0.419999
G1 F2345
G1 X140.994 Y136.715 E.22829
G1 X142.006 Y136.715 E.03109
G1 X142.006 Y129.285 E.22829
G1 X141.054 Y129.285 E.02924
G1 X141.341 Y129.632 F30000
; LINE_WIDTH: 0.360223
G1 F2345
G1 X141.341 Y136.368 E.17415
G1 X141.659 Y136.368 E.0082
G1 X141.659 Y129.632 E.17415
G1 X141.401 Y129.632 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y129.632 E-.09778
G1 X141.659 Y131.375 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.4 I-.318 J-1.175 P1  F30000
G1 X119.398 Y137.398 Z34.4
G1 Z34
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2345
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2345
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.4 I1.205 J.172 P1  F30000
G1 X119.006 Y129.285 Z34.4
G1 Z34
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2345
G1 X117.994 Y129.285 E.03109
G1 X117.994 Y136.715 E.22829
G1 X119.006 Y136.715 E.03109
G1 X119.006 Y129.345 E.22645
G1 X118.659 Y129.632 F30000
; LINE_WIDTH: 0.360223
G1 F2345
G1 X118.341 Y129.632 E.0082
G1 X118.341 Y136.368 E.17415
G1 X118.659 Y136.368 E.0082
G1 X118.659 Y129.692 E.1726
G1 X119.006 Y126.715 F30000
; LINE_WIDTH: 0.419999
G1 F2345
G1 X119.006 Y119.285 E.22829
G1 X117.994 Y119.285 E.03109
G1 X117.994 Y126.715 E.22829
G1 X118.946 Y126.715 E.02924
G1 X118.659 Y126.368 F30000
; LINE_WIDTH: 0.360223
G1 F2345
M73 P88 R4
G1 X118.659 Y119.632 E.17415
G1 X118.341 Y119.632 E.0082
G1 X118.341 Y126.368 E.17415
G1 X118.599 Y126.368 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 34.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.341 Y126.368 E-.09778
G1 X118.341 Y124.625 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 171/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L171
M991 S0 P170 ;notify layer change
G17
G3 Z34.4 I.318 J1.175 P1  F30000
G1 X140.602 Y118.602 Z34.4
G1 Z34.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2345
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2345
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.6 I-1.205 J-.172 P1  F30000
G1 X140.994 Y126.715 Z34.6
G1 Z34.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2345
G1 X142.006 Y126.715 E.03109
G1 X142.006 Y119.285 E.22829
G1 X140.994 Y119.285 E.03109
G1 X140.994 Y126.655 E.22645
G1 X141.341 Y126.368 F30000
; LINE_WIDTH: 0.360223
G1 F2345
G1 X141.659 Y126.368 E.0082
G1 X141.659 Y119.632 E.17415
G1 X141.341 Y119.632 E.0082
G1 X141.341 Y126.308 E.1726
G1 X140.994 Y129.285 F30000
; LINE_WIDTH: 0.419999
G1 F2345
G1 X140.994 Y136.715 E.22829
G1 X142.006 Y136.715 E.03109
G1 X142.006 Y129.285 E.22829
G1 X141.054 Y129.285 E.02924
G1 X141.341 Y129.632 F30000
; LINE_WIDTH: 0.360223
G1 F2345
G1 X141.341 Y136.368 E.17415
G1 X141.659 Y136.368 E.0082
G1 X141.659 Y129.632 E.17415
G1 X141.401 Y129.632 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y129.632 E-.09778
G1 X141.659 Y131.375 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.6 I-.318 J-1.175 P1  F30000
G1 X119.398 Y137.398 Z34.6
G1 Z34.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2345
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2345
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.6 I1.205 J.172 P1  F30000
G1 X119.006 Y129.285 Z34.6
G1 Z34.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2345
G1 X117.994 Y129.285 E.03109
G1 X117.994 Y136.715 E.22829
G1 X119.006 Y136.715 E.03109
G1 X119.006 Y129.345 E.22645
G1 X118.659 Y129.632 F30000
; LINE_WIDTH: 0.360223
G1 F2345
G1 X118.341 Y129.632 E.0082
G1 X118.341 Y136.368 E.17415
G1 X118.659 Y136.368 E.0082
G1 X118.659 Y129.692 E.1726
G1 X119.006 Y126.715 F30000
; LINE_WIDTH: 0.419999
G1 F2345
G1 X119.006 Y119.285 E.22829
G1 X117.994 Y119.285 E.03109
G1 X117.994 Y126.715 E.22829
G1 X118.946 Y126.715 E.02924
G1 X118.659 Y126.368 F30000
; LINE_WIDTH: 0.360223
G1 F2345
G1 X118.659 Y119.632 E.17415
G1 X118.341 Y119.632 E.0082
G1 X118.341 Y126.368 E.17415
G1 X118.599 Y126.368 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 34.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.341 Y126.368 E-.09778
G1 X118.341 Y124.625 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 172/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L172
M991 S0 P171 ;notify layer change
G17
G3 Z34.6 I.318 J1.175 P1  F30000
G1 X140.602 Y118.602 Z34.6
G1 Z34.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2830
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y118.662 E.6215
G1 X140.21 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2830
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y118.27 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y118.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.8 I-.855 J-.866 P1  F30000
G1 X141.007 Y119.41 Z34.8
G1 Z34.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4458
G1 F2830
G1 X141.993 Y119.41 E.03237
G1 X141.993 Y119.007 E.01323
G1 X141.007 Y119.007 E.03237
G1 X141.007 Y119.35 E.01126
; WIPE_START
G1 F24000
G1 X141.007 Y119.007 E-.13029
G1 X141.993 Y119.007 E-.37464
G1 X141.993 Y119.41 E-.15309
G1 X141.725 Y119.41 E-.10198
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.8 I-1.214 J.087 P1  F30000
G1 X142.176 Y125.69 Z34.8
G1 Z34.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2830
G1 X141.496 Y126.37 E.02954
G1 X140.962 Y126.37
G1 X142.176 Y125.157 E.05272
G1 X142.176 Y124.623
G1 X140.824 Y125.974 E.05871
G1 X140.824 Y125.441
G1 X142.176 Y124.09 E.05871
G1 X142.176 Y123.557
G1 X140.824 Y124.908 E.05871
G1 X140.824 Y124.375
G1 X142.176 Y123.024 E.05871
G1 X142.176 Y122.49
G1 X140.824 Y123.841 E.05871
G1 X140.824 Y123.308
G1 X142.176 Y121.957 E.05871
G1 X142.176 Y121.424
G1 X140.824 Y122.775 E.05871
G1 X140.824 Y122.242
G1 X142.176 Y120.89 E.05871
G1 X142.176 Y120.357
G1 X140.824 Y121.708 E.05871
G1 X140.824 Y121.175
G1 X142.176 Y119.824 E.05871
G1 X141.836 Y119.63
G1 X140.824 Y120.642 E.04396
G1 X140.824 Y120.108
G1 X141.303 Y119.63 E.02078
M204 S10000
; WIPE_START
G1 F24000
G1 X140.824 Y120.108 E-.25701
G1 X140.824 Y120.642 E-.20264
G1 X141.383 Y120.083 E-.30035
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.8 I-1.216 J-.051 P1  F30000
G1 X140.994 Y129.423 Z34.8
G1 Z34.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2830
G1 X142.006 Y129.423 E.03109
G1 X142.006 Y126.577 E.08744
G1 X140.994 Y126.577 E.03109
G1 X140.994 Y129.363 E.0856
G1 X141.341 Y129.076 F30000
; LINE_WIDTH: 0.360223
G1 F2830
G1 X141.659 Y129.076 E.0082
G1 X141.659 Y126.924 E.05562
G1 X141.341 Y126.924 E.0082
G1 X141.341 Y129.016 E.05407
; WIPE_START
G1 F24000
G1 X141.341 Y127.016 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.8 I-1.216 J.037 P1  F30000
G1 X141.628 Y136.37 Z34.8
G1 Z34.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2830
G1 X142.176 Y135.822 E.0238
G1 X142.176 Y135.289
G1 X141.095 Y136.37 E.04698
G1 X140.824 Y136.107
G1 X142.176 Y134.755 E.05871
G1 X142.176 Y134.222
G1 X140.824 Y135.573 E.05871
G1 X140.824 Y135.04
G1 X142.176 Y133.689 E.05871
G1 X142.176 Y133.156
G1 X140.824 Y134.507 E.05871
G1 X140.824 Y133.973
G1 X142.176 Y132.622 E.05871
G1 X142.176 Y132.089
G1 X140.824 Y133.44 E.05871
G1 X140.824 Y132.907
G1 X142.176 Y131.556 E.05871
G1 X142.176 Y131.023
G1 X140.824 Y132.374 E.05871
G1 X140.824 Y131.84
G1 X142.176 Y130.489 E.05871
G1 X142.176 Y129.956
G1 X140.824 Y131.307 E.05871
G1 X140.824 Y130.774
G1 X141.968 Y129.63 E.0497
G1 X141.435 Y129.63
G1 X140.824 Y130.241 E.02652
M204 S10000
G1 X142.105 Y129.886 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.157343
G1 F2830
G1 X142.14 Y129.802 E.00085
G1 X142.14 Y129.611 E.00178
; WIPE_START
G1 F24000
G1 X142.14 Y129.802 E-.51512
G1 X142.105 Y129.886 E-.24488
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.8 I-1.201 J-.197 P1  F30000
G1 X141.007 Y136.59 Z34.8
G1 Z34.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.445799
G1 F2830
G1 X141.007 Y136.993 E.01323
G1 X141.993 Y136.993 E.03237
G1 X141.993 Y136.59 E.01323
G1 X141.067 Y136.59 E.0304
; WIPE_START
G1 F24000
G1 X141.993 Y136.59 E-.35184
G1 X141.993 Y136.993 E-.15309
G1 X141.322 Y136.993 E-.25507
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.8 I-.022 J-1.217 P1  F30000
G1 X119.398 Y137.398 Z34.8
G1 Z34.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2830
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2830
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.8 I.855 J.866 P1  F30000
G1 X118.993 Y136.59 Z34.8
G1 Z34.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4458
G1 F2830
G1 X118.007 Y136.59 E.03237
G1 X118.007 Y136.993 E.01323
G1 X118.993 Y136.993 E.03237
G1 X118.993 Y136.65 E.01126
G1 X118.697 Y136.37 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2830
G1 X119.176 Y135.891 E.02079
G1 X119.176 Y135.358
G1 X118.164 Y136.37 E.04396
G1 X117.824 Y136.176
G1 X119.176 Y134.825 E.05871
G1 X119.176 Y134.292
G1 X117.824 Y135.643 E.05871
G1 X117.824 Y135.109
G1 X119.176 Y133.758 E.05871
G1 X119.176 Y133.225
G1 X117.824 Y134.576 E.05871
G1 X117.824 Y134.043
G1 X119.176 Y132.692 E.05871
G1 X119.176 Y132.159
G1 X117.824 Y133.51 E.05871
G1 X117.824 Y132.976
G1 X119.176 Y131.625 E.05871
G1 X119.176 Y131.092
G1 X117.824 Y132.443 E.05871
G1 X117.824 Y131.91
G1 X119.176 Y130.559 E.05871
G1 X119.176 Y130.025
G1 X117.824 Y131.376 E.05871
G1 X117.824 Y130.843
G1 X119.037 Y129.63 E.05271
G1 X118.504 Y129.63
G1 X117.824 Y130.31 E.02954
M204 S10000
G1 X119.006 Y127.083 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2830
G1 X119.006 Y126.577 E.01554
G1 X117.994 Y126.577 E.03109
G1 X117.994 Y129.423 E.08744
G1 X119.006 Y129.423 E.03109
G1 X119.006 Y127.143 E.07005
G1 X118.659 Y127.083 F30000
; LINE_WIDTH: 0.360223
G1 F2830
G1 X118.659 Y126.924 E.0041
G1 X118.341 Y126.924 E.0082
G1 X118.341 Y129.076 E.05562
G1 X118.659 Y129.076 E.0082
G1 X118.659 Y127.143 E.04997
G1 X119.176 Y125.759 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2830
G1 X118.565 Y126.37 E.02653
G1 X118.032 Y126.37
G1 X119.176 Y125.226 E.0497
G1 X119.176 Y124.693
G1 X117.824 Y126.044 E.05871
G1 X117.824 Y125.511
G1 X119.176 Y124.159 E.05871
G1 X119.176 Y123.626
G1 X117.824 Y124.977 E.05871
G1 X117.824 Y124.444
G1 X119.176 Y123.093 E.05871
G1 X119.176 Y122.56
G1 X117.824 Y123.911 E.05871
G1 X117.824 Y123.377
M73 P89 R4
G1 X119.176 Y122.026 E.05871
G1 X119.176 Y121.493
G1 X117.824 Y122.844 E.05871
G1 X117.824 Y122.311
G1 X119.176 Y120.96 E.05871
G1 X119.176 Y120.427
G1 X117.824 Y121.778 E.05871
G1 X117.824 Y121.244
G1 X119.176 Y119.893 E.05871
G1 X118.905 Y119.63
G1 X117.824 Y120.711 E.04697
G1 X117.824 Y120.178
G1 X118.372 Y119.63 E.0238
M204 S10000
; WIPE_START
G1 F24000
G1 X117.824 Y120.178 E-.29429
G1 X117.824 Y120.711 E-.20264
G1 X118.314 Y120.222 E-.26307
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.8 I-1.214 J-.086 P1  F30000
G1 X117.895 Y126.114 Z34.8
G1 Z34.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.157242
G1 F2830
G1 X117.86 Y126.198 E.00085
G1 X117.86 Y126.389 E.00178
; WIPE_START
G1 F24000
G1 X117.86 Y126.198 E-.51467
G1 X117.895 Y126.114 E-.24533
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.8 I1.201 J.197 P1  F30000
G1 X118.993 Y119.41 Z34.8
G1 Z34.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4458
G1 F2830
G1 X118.993 Y119.007 E.01323
G1 X118.007 Y119.007 E.03237
G1 X118.007 Y119.41 E.01323
G1 X118.933 Y119.41 E.0304
; CHANGE_LAYER
; Z_HEIGHT: 34.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X118.007 Y119.41 E-.35184
G1 X118.007 Y119.007 E-.15309
G1 X118.678 Y119.007 E-.25507
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 173/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L173
M991 S0 P172 ;notify layer change
G17
G3 Z34.8 I-1.146 J-.411 P1  F30000
G1 X117.602 Y122.009 Z34.8
G1 Z34.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2456
M73 P89 R3
G1 X117.602 Y118.602 E.11302
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y122.009 E.11302
G1 X117.662 Y122.009 E.05758
G1 X117.21 Y122.401 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2456
G1 X117.21 Y118.21 E.12879
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y122.401 E.12879
G1 X117.27 Y122.401 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.241 Y120.402 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I-.69 J1.002 P1  F30000
G1 X119.006 Y121.617 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2456
G1 X119.006 Y118.994 E.0806
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y121.617 E.0806
G1 X118.946 Y121.617 E.02924
G1 X118.659 Y121.27 F30000
; LINE_WIDTH: 0.360223
G1 F2456
G1 X118.659 Y119.341 E.04987
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y121.27 E.04987
G1 X118.599 Y121.27 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y121.27 E-.09778
G1 X118.341 Y119.527 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I-1.215 J-.072 P1  F30000
G1 X117.602 Y132.009 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2456
G1 X117.602 Y123.991 E.26599
G1 X119.398 Y123.991 E.05957
G1 X119.398 Y132.009 E.26599
G1 X117.662 Y132.009 E.05758
G1 X117.21 Y132.401 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2456
G1 X117.21 Y123.599 E.27048
G1 X119.79 Y123.599 E.07928
G1 X119.79 Y132.401 E.27048
G1 X117.27 Y132.401 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.256 Y130.401 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I1.169 J.34 P1  F30000
G1 X119.006 Y124.383 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2456
G1 X117.994 Y124.383 E.03109
G1 X117.994 Y131.617 E.22229
G1 X119.006 Y131.617 E.03109
G1 X119.006 Y124.443 E.22045
G1 X118.659 Y124.73 F30000
; LINE_WIDTH: 0.360223
G1 F2456
G1 X118.341 Y124.73 E.0082
G1 X118.341 Y131.27 E.1691
G1 X118.659 Y131.27 E.0082
G1 X118.659 Y124.79 E.16755
; WIPE_START
G1 F24000
G1 X118.659 Y126.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I-1.211 J.124 P1  F30000
G1 X119.398 Y133.991 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2456
G1 X119.398 Y137.398 E.11302
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y133.991 E.11302
G1 X119.338 Y133.991 E.05758
G1 X119.79 Y133.599 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2456
G1 X119.79 Y137.79 E.12879
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y133.599 E.12879
G1 X119.73 Y133.599 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.759 Y135.598 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I1.035 J-.641 P1  F30000
G1 X119.006 Y134.383 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2456
G1 X117.994 Y134.383 E.03109
G1 X117.994 Y137.006 E.0806
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y134.443 E.07875
G1 X118.659 Y134.73 F30000
; LINE_WIDTH: 0.360223
G1 F2456
G1 X118.341 Y134.73 E.0082
G1 X118.341 Y136.659 E.04987
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y134.79 E.04832
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.71009
G1 X118.527 Y136.659 E-.04991
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I.146 J1.208 P1  F30000
G1 X140.602 Y133.991 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2456
G1 X142.398 Y133.991 E.05957
G1 X142.398 Y137.398 E.11302
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.051 E.11103
G1 X140.21 Y133.599 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2456
G1 X142.79 Y133.599 E.07928
G1 X142.79 Y137.79 E.12879
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y133.659 E.12694
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y133.612 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I-.652 J-1.028 P1  F30000
G1 X140.994 Y134.383 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2456
G1 X140.994 Y137.006 E.0806
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y134.383 E.0806
G1 X141.054 Y134.383 E.02924
G1 X141.341 Y134.73 F30000
; LINE_WIDTH: 0.360223
G1 F2456
G1 X141.341 Y136.659 E.04987
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y134.73 E.04987
G1 X141.401 Y134.73 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y134.73 E-.09778
G1 X141.659 Y136.473 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I1.184 J-.28 P1  F30000
G1 X140.602 Y132.009 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2456
G1 X140.602 Y123.991 E.26599
G1 X142.398 Y123.991 E.05957
G1 X142.398 Y132.009 E.26599
G1 X140.662 Y132.009 E.05758
G1 X140.21 Y132.401 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2456
G1 X140.21 Y123.599 E.27048
G1 X142.79 Y123.599 E.07928
G1 X142.79 Y132.401 E.27048
G1 X140.27 Y132.401 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.256 Y130.401 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I-1.04 J.631 P1  F30000
G1 X140.994 Y131.617 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2456
G1 X142.006 Y131.617 E.03109
G1 X142.006 Y124.383 E.22229
G1 X140.994 Y124.383 E.03109
G1 X140.994 Y131.557 E.22045
G1 X141.341 Y131.27 F30000
; LINE_WIDTH: 0.360223
G1 F2456
G1 X141.659 Y131.27 E.0082
G1 X141.659 Y124.73 E.1691
G1 X141.341 Y124.73 E.0082
G1 X141.341 Y131.21 E.16755
; WIPE_START
G1 F24000
G1 X141.341 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I1.211 J-.124 P1  F30000
G1 X140.602 Y122.009 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2456
G1 X140.602 Y118.602 E.11302
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y122.009 E.11302
G1 X140.662 Y122.009 E.05758
G1 X140.21 Y122.401 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2456
G1 X140.21 Y118.21 E.12879
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y122.401 E.12879
G1 X140.27 Y122.401 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.241 Y120.402 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I-1.035 J.641 P1  F30000
G1 X140.994 Y121.617 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2456
G1 X142.006 Y121.617 E.03109
G1 X142.006 Y118.994 E.0806
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y121.557 E.07875
G1 X141.341 Y121.27 F30000
; LINE_WIDTH: 0.360223
G1 F2456
G1 X141.659 Y121.27 E.0082
G1 X141.659 Y119.341 E.04987
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y121.21 E.04832
; CHANGE_LAYER
; Z_HEIGHT: 34.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.71009
G1 X141.473 Y119.341 E-.04991
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 174/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L174
M991 S0 P173 ;notify layer change
G17
G3 Z35 I-.112 J-1.212 P1  F30000
G1 X117.602 Y121.554 Z35
G1 Z34.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2227
G1 X117.602 Y118.602 E.09792
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.554 E.09792
G1 X117.662 Y121.554 E.05758
G1 X117.21 Y121.946 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2227
G1 X117.21 Y118.21 E.1148
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.946 E.1148
G1 X117.27 Y121.946 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.238 Y119.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I-.689 J1.003 P1  F30000
G1 X119.006 Y121.162 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2227
G1 X119.006 Y118.994 E.06661
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y121.162 E.06661
G1 X118.946 Y121.162 E.02924
G1 X118.659 Y120.815 F30000
; LINE_WIDTH: 0.360223
G1 F2227
G1 X118.659 Y119.341 E.0381
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.815 E.0381
G1 X118.599 Y120.815 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.815 E-.09778
G1 X118.341 Y119.341 E-.55988
G1 X118.611 Y119.341 E-.10235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I-1.213 J-.1 P1  F30000
G1 X117.602 Y131.554 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2227
G1 X117.602 Y124.446 E.23578
G1 X119.398 Y124.446 E.05957
G1 X119.398 Y131.554 E.23578
G1 X117.662 Y131.554 E.05758
G1 X117.21 Y131.946 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2227
G1 X117.21 Y124.054 E.2425
G1 X119.79 Y124.054 E.07928
G1 X119.79 Y131.946 E.2425
G1 X117.27 Y131.946 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.255 Y129.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I1.137 J.433 P1  F30000
G1 X119.006 Y125.344 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2227
G1 X119.006 Y124.838 E.01554
G1 X117.994 Y124.838 E.03109
G1 X117.994 Y131.162 E.19431
G1 X119.006 Y131.162 E.03109
G1 X119.006 Y125.404 E.17693
G1 X118.659 Y125.344 F30000
; LINE_WIDTH: 0.360223
G1 F2227
G1 X118.659 Y125.185 E.0041
G1 X118.341 Y125.185 E.0082
G1 X118.341 Y130.815 E.14556
G1 X118.659 Y130.815 E.0082
G1 X118.659 Y125.404 E.1399
; WIPE_START
G1 F24000
G1 X118.659 Y127.404 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I-1.21 J.127 P1  F30000
G1 X119.398 Y134.446 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2227
G1 X119.398 Y137.398 E.09792
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.446 E.09792
G1 X119.338 Y134.446 E.05758
G1 X119.79 Y134.054 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2227
G1 X119.79 Y137.79 E.1148
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.054 E.1148
G1 X119.73 Y134.054 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.762 Y136.054 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I1.033 J-.643 P1  F30000
G1 X119.006 Y134.838 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2227
G1 X117.994 Y134.838 E.03109
G1 X117.994 Y137.006 E.06661
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y134.898 E.06477
G1 X118.659 Y135.185 F30000
; LINE_WIDTH: 0.360223
G1 F2227
G1 X118.341 Y135.185 E.0082
G1 X118.341 Y136.659 E.0381
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.245 E.03654
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.53708
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y136.389 E-.10235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I.106 J1.212 P1  F30000
G1 X140.602 Y134.446 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2227
G1 X142.398 Y134.446 E.05957
G1 X142.398 Y137.398 E.09792
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.506 E.09593
G1 X140.21 Y134.054 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2227
G1 X142.79 Y134.054 E.07928
G1 X142.79 Y137.79 E.1148
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.114 E.11296
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.067 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y134.838 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2227
G1 X140.994 Y137.006 E.06661
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y134.838 E.06661
G1 X141.054 Y134.838 E.02924
G1 X141.341 Y135.185 F30000
; LINE_WIDTH: 0.360223
G1 F2227
G1 X141.341 Y136.659 E.0381
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.185 E.0381
G1 X141.401 Y135.185 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.185 E-.09778
G1 X141.659 Y136.659 E-.55988
G1 X141.389 Y136.659 E-.10235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I1.203 J-.185 P1  F30000
G1 X140.602 Y131.554 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2227
G1 X140.602 Y124.446 E.23578
G1 X142.398 Y124.446 E.05957
G1 X142.398 Y131.554 E.23578
G1 X140.662 Y131.554 E.05758
G1 X140.21 Y131.946 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2227
G1 X140.21 Y124.054 E.2425
G1 X142.79 Y124.054 E.07928
G1 X142.79 Y131.946 E.2425
G1 X140.27 Y131.946 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.255 Y129.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I-1.04 J.632 P1  F30000
G1 X140.994 Y131.162 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2227
G1 X142.006 Y131.162 E.03109
G1 X142.006 Y124.838 E.19431
G1 X140.994 Y124.838 E.03109
G1 X140.994 Y131.102 E.19247
G1 X141.341 Y130.815 F30000
; LINE_WIDTH: 0.360223
G1 F2227
G1 X141.659 Y130.815 E.0082
G1 X141.659 Y125.185 E.14556
G1 X141.341 Y125.185 E.0082
G1 X141.341 Y130.755 E.144
; WIPE_START
G1 F24000
G1 X141.341 Y128.755 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I1.211 J-.124 P1  F30000
G1 X140.602 Y121.554 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2227
G1 X140.602 Y118.602 E.09792
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.554 E.09792
G1 X140.662 Y121.554 E.05758
G1 X140.21 Y121.946 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2227
G1 X140.21 Y118.21 E.1148
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.946 E.1148
G1 X140.27 Y121.946 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.238 Y119.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I-1.033 J.643 P1  F30000
G1 X140.994 Y121.162 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2227
G1 X142.006 Y121.162 E.03109
G1 X142.006 Y118.994 E.06661
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y121.102 E.06477
G1 X141.341 Y120.815 F30000
; LINE_WIDTH: 0.360223
G1 F2227
G1 X141.659 Y120.815 E.0082
G1 X141.659 Y119.341 E.0381
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.755 E.03654
; CHANGE_LAYER
; Z_HEIGHT: 35
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.53708
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y119.611 E-.10235
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 175/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L175
M991 S0 P174 ;notify layer change
G17
G3 Z35.2 I-.086 J-1.214 P1  F30000
G1 X117.602 Y121.306 Z35.2
G1 Z35
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2093
G1 X117.602 Y118.602 E.0897
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.306 E.0897
G1 X117.662 Y121.306 E.05758
G1 X117.21 Y121.698 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2093
G1 X117.21 Y118.21 E.10719
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.698 E.10719
G1 X117.27 Y121.698 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.236 Y119.699 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I-.689 J1.003 P1  F30000
G1 X119.006 Y120.914 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2093
G1 X119.006 Y118.994 E.059
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.914 E.059
M73 P90 R3
G1 X118.946 Y120.914 E.02924
G1 X118.659 Y120.567 F30000
; LINE_WIDTH: 0.360223
G1 F2093
G1 X118.659 Y119.341 E.03169
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.567 E.03169
G1 X118.599 Y120.567 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.567 E-.09778
G1 X118.341 Y119.341 E-.46576
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.541 E-.07589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I-1.212 J-.109 P1  F30000
G1 X117.602 Y131.306 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2093
G1 X117.602 Y124.694 E.21935
G1 X119.398 Y124.694 E.05957
G1 X119.398 Y131.306 E.21935
G1 X117.662 Y131.306 E.05758
G1 X117.21 Y131.698 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2093
G1 X117.21 Y124.302 E.22728
G1 X119.79 Y124.302 E.07928
G1 X119.79 Y131.698 E.22728
G1 X117.27 Y131.698 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.254 Y129.698 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I1.119 J.478 P1  F30000
G1 X119.006 Y125.592 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2093
G1 X119.006 Y125.086 E.01554
G1 X117.994 Y125.086 E.03109
G1 X117.994 Y130.914 E.17909
G1 X119.006 Y130.914 E.03109
G1 X119.006 Y125.652 E.1617
G1 X118.659 Y125.592 F30000
; LINE_WIDTH: 0.360223
G1 F2093
G1 X118.659 Y125.433 E.0041
G1 X118.341 Y125.433 E.0082
G1 X118.341 Y130.567 E.13275
G1 X118.659 Y130.567 E.0082
G1 X118.659 Y125.652 E.12709
; WIPE_START
G1 F24000
G1 X118.659 Y127.652 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I-1.21 J.127 P1  F30000
G1 X119.398 Y134.694 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2093
G1 X119.398 Y137.398 E.0897
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.694 E.0897
G1 X119.338 Y134.694 E.05758
G1 X119.79 Y134.302 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2093
G1 X119.79 Y137.79 E.10719
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.302 E.10719
G1 X119.73 Y134.302 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.764 Y136.301 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I1.032 J-.644 P1  F30000
G1 X119.006 Y135.086 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2093
G1 X117.994 Y135.086 E.03109
G1 X117.994 Y137.006 E.059
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.146 E.05715
G1 X118.659 Y135.433 F30000
; LINE_WIDTH: 0.360223
G1 F2093
G1 X118.341 Y135.433 E.0082
G1 X118.341 Y136.659 E.03169
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.493 E.03014
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.44296
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y136.142 E-.19647
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I.079 J1.214 P1  F30000
G1 X140.602 Y134.694 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2093
G1 X142.398 Y134.694 E.05957
G1 X142.398 Y137.398 E.0897
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.754 E.08771
G1 X140.21 Y134.302 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2093
G1 X142.79 Y134.302 E.07928
G1 X142.79 Y137.79 E.10719
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.362 E.10534
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.315 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.086 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2093
G1 X140.994 Y137.006 E.059
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.086 E.059
G1 X141.054 Y135.086 E.02924
G1 X141.341 Y135.433 F30000
; LINE_WIDTH: 0.360223
G1 F2093
G1 X141.341 Y136.659 E.03169
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.433 E.03169
G1 X141.401 Y135.433 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.433 E-.09778
G1 X141.659 Y136.659 E-.46576
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.459 E-.07589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I1.205 J-.173 P1  F30000
G1 X140.602 Y131.306 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2093
G1 X140.602 Y124.694 E.21935
G1 X142.398 Y124.694 E.05957
G1 X142.398 Y131.306 E.21935
G1 X140.662 Y131.306 E.05758
G1 X140.21 Y131.698 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2093
G1 X140.21 Y124.302 E.22728
G1 X142.79 Y124.302 E.07928
G1 X142.79 Y131.698 E.22728
G1 X140.27 Y131.698 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.254 Y129.698 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I-.842 J.878 P1  F30000
G1 X140.994 Y130.408 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2093
G1 X140.994 Y130.914 E.01554
G1 X142.006 Y130.914 E.03109
G1 X142.006 Y125.086 E.17909
G1 X140.994 Y125.086 E.03109
G1 X140.994 Y130.348 E.1617
G1 X141.341 Y130.408 F30000
; LINE_WIDTH: 0.360223
G1 F2093
G1 X141.341 Y130.567 E.0041
G1 X141.659 Y130.567 E.0082
G1 X141.659 Y125.433 E.13275
G1 X141.341 Y125.433 E.0082
G1 X141.341 Y130.348 E.12709
; WIPE_START
G1 F24000
G1 X141.341 Y128.348 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I1.21 J-.127 P1  F30000
G1 X140.602 Y121.306 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2093
G1 X140.602 Y118.602 E.0897
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.306 E.0897
G1 X140.662 Y121.306 E.05758
G1 X140.21 Y121.698 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2093
G1 X140.21 Y118.21 E.10719
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.698 E.10719
G1 X140.27 Y121.698 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.236 Y119.699 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I-1.032 J.644 P1  F30000
G1 X140.994 Y120.914 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2093
G1 X142.006 Y120.914 E.03109
G1 X142.006 Y118.994 E.059
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.854 E.05715
G1 X141.341 Y120.567 F30000
; LINE_WIDTH: 0.360223
G1 F2093
G1 X141.659 Y120.567 E.0082
G1 X141.659 Y119.341 E.03169
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.507 E.03014
; CHANGE_LAYER
; Z_HEIGHT: 35.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.44296
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y119.858 E-.19647
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 176/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L176
M991 S0 P175 ;notify layer change
G17
G3 Z35.4 I-.065 J-1.215 P1  F30000
G1 X117.602 Y121.137 Z35.4
G1 Z35.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2003
G1 X117.602 Y118.602 E.08407
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.137 E.08407
G1 X117.662 Y121.137 E.05758
G1 X117.21 Y121.529 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2003
G1 X117.21 Y118.21 E.10197
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.529 E.10197
G1 X117.27 Y121.529 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.234 Y119.529 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I-.688 J1.004 P1  F30000
G1 X119.006 Y120.744 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2003
G1 X119.006 Y118.994 E.05378
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.744 E.05378
G1 X118.946 Y120.744 E.02924
G1 X118.659 Y120.397 F30000
; LINE_WIDTH: 0.360223
G1 F2003
G1 X118.659 Y119.341 E.0273
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.397 E.0273
G1 X118.599 Y120.397 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.397 E-.09778
G1 X118.341 Y119.341 E-.40126
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.711 E-.14039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I-1.212 J-.112 P1  F30000
G1 X117.602 Y131.137 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2003
G1 X117.602 Y124.863 E.20809
G1 X119.398 Y124.863 E.05957
G1 X119.398 Y131.137 E.20809
G1 X117.662 Y131.137 E.05758
G1 X117.21 Y131.529 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2003
G1 X117.21 Y124.471 E.21685
G1 X119.79 Y124.471 E.07928
G1 X119.79 Y131.529 E.21685
G1 X117.27 Y131.529 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.253 Y129.529 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I1.103 J.513 P1  F30000
G1 X119.006 Y125.761 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2003
G1 X119.006 Y125.256 E.01554
G1 X117.994 Y125.256 E.03109
G1 X117.994 Y130.744 E.16866
G1 X119.006 Y130.744 E.03109
G1 X119.006 Y125.821 E.15127
G1 X118.659 Y125.761 F30000
; LINE_WIDTH: 0.360223
G1 F2003
G1 X118.659 Y125.603 E.0041
G1 X118.341 Y125.603 E.0082
G1 X118.341 Y130.397 E.12397
G1 X118.659 Y130.397 E.0082
G1 X118.659 Y125.821 E.11832
; WIPE_START
G1 F24000
G1 X118.659 Y127.821 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I-1.21 J.127 P1  F30000
G1 X119.398 Y134.863 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2003
G1 X119.398 Y137.398 E.08407
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.863 E.08407
G1 X119.338 Y134.863 E.05758
G1 X119.79 Y134.471 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2003
G1 X119.79 Y137.79 E.10197
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.471 E.10197
G1 X119.73 Y134.471 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.766 Y136.471 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I1.032 J-.645 P1  F30000
G1 X119.006 Y135.256 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2003
G1 X117.994 Y135.256 E.03109
G1 X117.994 Y137.006 E.05378
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.316 E.05194
G1 X118.659 Y135.603 F30000
; LINE_WIDTH: 0.360223
G1 F2003
G1 X118.341 Y135.603 E.0082
G1 X118.341 Y136.659 E.0273
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.663 E.02575
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.37846
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.972 E-.26097
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I.061 J1.215 P1  F30000
G1 X140.602 Y134.863 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2003
G1 X142.398 Y134.863 E.05957
G1 X142.398 Y137.398 E.08407
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.923 E.08208
G1 X140.21 Y134.471 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2003
G1 X142.79 Y134.471 E.07928
G1 X142.79 Y137.79 E.10197
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.531 E.10013
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.485 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.256 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2003
G1 X140.994 Y137.006 E.05378
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.256 E.05378
G1 X141.054 Y135.256 E.02924
G1 X141.341 Y135.603 F30000
; LINE_WIDTH: 0.360223
G1 F2003
G1 X141.341 Y136.659 E.0273
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.603 E.0273
G1 X141.401 Y135.603 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.603 E-.09778
G1 X141.659 Y136.659 E-.40126
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.289 E-.14039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I1.205 J-.173 P1  F30000
G1 X140.602 Y131.137 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2003
G1 X140.602 Y124.863 E.20809
G1 X142.398 Y124.863 E.05957
G1 X142.398 Y131.137 E.20809
G1 X140.662 Y131.137 E.05758
G1 X140.21 Y131.529 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2003
G1 X140.21 Y124.471 E.21685
G1 X142.79 Y124.471 E.07928
G1 X142.79 Y131.529 E.21685
G1 X140.27 Y131.529 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.253 Y129.529 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I-1.039 J.633 P1  F30000
G1 X140.994 Y130.744 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2003
G1 X142.006 Y130.744 E.03109
G1 X142.006 Y125.256 E.16866
G1 X140.994 Y125.256 E.03109
G1 X140.994 Y130.684 E.16682
G1 X141.341 Y130.397 F30000
; LINE_WIDTH: 0.360223
G1 F2003
G1 X141.659 Y130.397 E.0082
G1 X141.659 Y125.603 E.12397
G1 X141.341 Y125.603 E.0082
G1 X141.341 Y130.337 E.12242
; WIPE_START
G1 F24000
G1 X141.341 Y128.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I1.211 J-.124 P1  F30000
G1 X140.602 Y121.137 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2003
G1 X140.602 Y118.602 E.08407
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.137 E.08407
G1 X140.662 Y121.137 E.05758
G1 X140.21 Y121.529 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2003
G1 X140.21 Y118.21 E.10197
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.529 E.10197
G1 X140.27 Y121.529 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.234 Y119.529 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I-1.032 J.645 P1  F30000
G1 X140.994 Y120.744 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2003
G1 X142.006 Y120.744 E.03109
G1 X142.006 Y118.994 E.05378
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.684 E.05194
G1 X141.341 Y120.397 F30000
; LINE_WIDTH: 0.360223
G1 F2003
G1 X141.659 Y120.397 E.0082
G1 X141.659 Y119.341 E.0273
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.337 E.02575
; CHANGE_LAYER
; Z_HEIGHT: 35.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.37846
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.028 E-.26097
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 177/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L177
M991 S0 P176 ;notify layer change
G17
G3 Z35.6 I-.05 J-1.216 P1  F30000
G1 X117.602 Y121.016 Z35.6
G1 Z35.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1938
G1 X117.602 Y118.602 E.08006
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.016 E.08006
G1 X117.662 Y121.016 E.05758
G1 X117.21 Y121.408 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1938
G1 X117.21 Y118.21 E.09825
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.408 E.09825
G1 X117.27 Y121.408 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.232 Y119.408 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.8 I-.688 J1.004 P1  F30000
G1 X119.006 Y120.623 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1938
G1 X119.006 Y118.994 E.05006
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.623 E.05006
G1 X118.946 Y120.623 E.02924
G1 X118.659 Y120.276 F30000
; LINE_WIDTH: 0.360223
G1 F1938
G1 X118.659 Y119.341 E.02417
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.276 E.02417
G1 X118.599 Y120.276 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.276 E-.09778
G1 X118.341 Y119.341 E-.35526
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.832 E-.18639
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.8 I-1.212 J-.114 P1  F30000
G1 X117.602 Y131.016 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1938
G1 X117.602 Y124.984 E.20006
G1 X119.398 Y124.984 E.05957
G1 X119.398 Y131.016 E.20006
G1 X117.662 Y131.016 E.05758
G1 X117.21 Y131.408 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1938
G1 X117.21 Y124.592 E.20941
G1 X119.79 Y124.592 E.07928
G1 X119.79 Y131.408 E.20941
G1 X117.27 Y131.408 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.252 Y129.408 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.8 I1.09 J.542 P1  F30000
G1 X119.006 Y125.882 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1938
G1 X119.006 Y125.377 E.01554
G1 X117.994 Y125.377 E.03109
G1 X117.994 Y130.623 E.16122
G1 X119.006 Y130.623 E.03109
G1 X119.006 Y125.942 E.14383
G1 X118.659 Y125.882 F30000
; LINE_WIDTH: 0.360223
G1 F1938
G1 X118.659 Y125.724 E.0041
G1 X118.341 Y125.724 E.0082
G1 X118.341 Y130.276 E.11771
G1 X118.659 Y130.276 E.0082
G1 X118.659 Y125.942 E.11206
; WIPE_START
G1 F24000
G1 X118.659 Y127.942 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P91 R3
G3 Z35.8 I-1.21 J.127 P1  F30000
G1 X119.398 Y134.984 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1938
G1 X119.398 Y137.398 E.08006
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.984 E.08006
G1 X119.338 Y134.984 E.05758
G1 X119.79 Y134.592 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1938
G1 X119.79 Y137.79 E.09825
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.592 E.09825
G1 X119.73 Y134.592 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.768 Y136.592 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.8 I1.031 J-.646 P1  F30000
G1 X119.006 Y135.377 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1938
G1 X117.994 Y135.377 E.03109
G1 X117.994 Y137.006 E.05006
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.437 E.04822
G1 X118.659 Y135.724 F30000
; LINE_WIDTH: 0.360223
G1 F1938
G1 X118.341 Y135.724 E.0082
G1 X118.341 Y136.659 E.02417
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.784 E.02262
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.33246
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.851 E-.30697
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.8 I.047 J1.216 P1  F30000
G1 X140.602 Y134.984 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1938
G1 X142.398 Y134.984 E.05957
G1 X142.398 Y137.398 E.08006
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.044 E.07807
G1 X140.21 Y134.592 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1938
G1 X142.79 Y134.592 E.07928
G1 X142.79 Y137.79 E.09825
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.652 E.09641
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.606 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.377 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1938
G1 X140.994 Y137.006 E.05006
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.377 E.05006
G1 X141.054 Y135.377 E.02924
G1 X141.341 Y135.724 F30000
; LINE_WIDTH: 0.360223
G1 F1938
G1 X141.341 Y136.659 E.02417
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.724 E.02417
G1 X141.401 Y135.724 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.724 E-.09778
G1 X141.659 Y136.659 E-.35526
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.168 E-.18639
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.8 I1.205 J-.173 P1  F30000
G1 X140.602 Y131.016 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1938
G1 X140.602 Y124.984 E.20006
G1 X142.398 Y124.984 E.05957
G1 X142.398 Y131.016 E.20006
G1 X140.662 Y131.016 E.05758
G1 X140.21 Y131.408 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1938
G1 X140.21 Y124.592 E.20941
G1 X142.79 Y124.592 E.07928
G1 X142.79 Y131.408 E.20941
G1 X140.27 Y131.408 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.252 Y129.408 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.8 I-1.039 J.634 P1  F30000
G1 X140.994 Y130.623 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1938
G1 X142.006 Y130.623 E.03109
G1 X142.006 Y125.377 E.16122
G1 X140.994 Y125.377 E.03109
G1 X140.994 Y130.563 E.15938
G1 X141.341 Y130.276 F30000
; LINE_WIDTH: 0.360223
G1 F1938
G1 X141.659 Y130.276 E.0082
G1 X141.659 Y125.724 E.11771
G1 X141.341 Y125.724 E.0082
G1 X141.341 Y130.216 E.11616
; WIPE_START
G1 F24000
G1 X141.341 Y128.216 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.8 I1.211 J-.124 P1  F30000
G1 X140.602 Y121.016 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1938
G1 X140.602 Y118.602 E.08006
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.016 E.08006
G1 X140.662 Y121.016 E.05758
G1 X140.21 Y121.408 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1938
G1 X140.21 Y118.21 E.09825
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.408 E.09825
G1 X140.27 Y121.408 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.232 Y119.408 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.8 I-1.031 J.646 P1  F30000
G1 X140.994 Y120.623 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1938
G1 X142.006 Y120.623 E.03109
G1 X142.006 Y118.994 E.05006
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.563 E.04822
G1 X141.341 Y120.276 F30000
; LINE_WIDTH: 0.360223
G1 F1938
G1 X141.659 Y120.276 E.0082
G1 X141.659 Y119.341 E.02417
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.216 E.02262
; CHANGE_LAYER
; Z_HEIGHT: 35.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.33246
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.149 E-.30697
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 178/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L178
M991 S0 P177 ;notify layer change
G17
G3 Z35.8 I-.04 J-1.216 P1  F30000
G1 X117.602 Y120.931 Z35.8
G1 Z35.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1893
G1 X117.602 Y118.602 E.07726
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.931 E.07726
G1 X117.662 Y120.931 E.05758
G1 X117.21 Y121.323 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1893
G1 X117.21 Y118.21 E.09566
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.323 E.09566
G1 X117.27 Y121.323 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.231 Y119.324 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I-.688 J1.004 P1  F30000
G1 X119.006 Y120.539 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1893
G1 X119.006 Y118.994 E.04747
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.539 E.04747
G1 X118.946 Y120.539 E.02924
G1 X118.659 Y120.192 F30000
; LINE_WIDTH: 0.360223
G1 F1893
G1 X118.659 Y119.341 E.02199
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.192 E.02199
G1 X118.599 Y120.192 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.192 E-.09778
G1 X118.341 Y119.341 E-.32325
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.916 E-.2184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I-1.211 J-.116 P1  F30000
G1 X117.602 Y130.931 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1893
G1 X117.602 Y125.069 E.19447
G1 X119.398 Y125.069 E.05957
G1 X119.398 Y130.931 E.19447
G1 X117.662 Y130.931 E.05758
G1 X117.21 Y131.323 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1893
G1 X117.21 Y124.677 E.20423
G1 X119.79 Y124.677 E.07928
G1 X119.79 Y131.323 E.20423
G1 X117.27 Y131.323 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.252 Y129.323 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I1.079 J.564 P1  F30000
G1 X119.006 Y125.967 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1893
G1 X119.006 Y125.461 E.01554
G1 X117.994 Y125.461 E.03109
G1 X117.994 Y130.539 E.15604
G1 X119.006 Y130.539 E.03109
G1 X119.006 Y126.027 E.13866
G1 X118.659 Y125.967 F30000
; LINE_WIDTH: 0.360223
G1 F1893
G1 X118.659 Y125.808 E.0041
G1 X118.341 Y125.808 E.0082
G1 X118.341 Y130.192 E.11335
G1 X118.659 Y130.192 E.0082
G1 X118.659 Y126.027 E.1077
; WIPE_START
G1 F24000
G1 X118.659 Y128.027 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I-1.203 J-.181 P1  F30000
G1 X117.602 Y135.069 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1893
G1 X119.398 Y135.069 E.05957
G1 X119.398 Y137.398 E.07726
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y135.129 E.07527
G1 X117.21 Y134.677 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1893
G1 X119.79 Y134.677 E.07928
G1 X119.79 Y137.79 E.09566
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.737 E.09382
M204 S10000
; WIPE_START
G1 F24000
G1 X119.209 Y134.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I-1.177 J-.311 P1  F30000
G1 X119.006 Y135.461 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1893
G1 X117.994 Y135.461 E.03109
G1 X117.994 Y137.006 E.04747
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.521 E.04563
G1 X118.659 Y135.808 F30000
; LINE_WIDTH: 0.360223
G1 F1893
G1 X118.341 Y135.808 E.0082
G1 X118.341 Y136.659 E.02199
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.868 E.02044
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.30045
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.808 E-.32325
G1 X118.383 Y135.808 E-.01573
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I.04 J1.216 P1  F30000
G1 X140.602 Y135.069 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1893
G1 X142.398 Y135.069 E.05957
G1 X142.398 Y137.398 E.07726
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.129 E.07527
G1 X140.21 Y134.677 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1893
G1 X142.79 Y134.677 E.07928
G1 X142.79 Y137.79 E.09566
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.737 E.09382
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.461 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1893
G1 X140.994 Y137.006 E.04747
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.461 E.04747
G1 X141.054 Y135.461 E.02924
G1 X141.341 Y135.808 F30000
; LINE_WIDTH: 0.360223
G1 F1893
G1 X141.341 Y136.659 E.02199
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.808 E.02199
G1 X141.401 Y135.808 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.808 E-.09778
G1 X141.659 Y136.659 E-.32325
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.084 E-.2184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I1.205 J-.173 P1  F30000
G1 X140.602 Y130.931 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1893
G1 X140.602 Y125.069 E.19447
G1 X142.398 Y125.069 E.05957
G1 X142.398 Y130.931 E.19447
G1 X140.662 Y130.931 E.05758
G1 X140.21 Y131.323 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1893
G1 X140.21 Y124.677 E.20423
G1 X142.79 Y124.677 E.07928
G1 X142.79 Y131.323 E.20423
G1 X140.27 Y131.323 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.252 Y129.323 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I-1.039 J.634 P1  F30000
G1 X140.994 Y130.539 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1893
G1 X142.006 Y130.539 E.03109
G1 X142.006 Y125.461 E.15604
G1 X140.994 Y125.461 E.03109
G1 X140.994 Y130.479 E.1542
G1 X141.341 Y130.192 F30000
; LINE_WIDTH: 0.360223
G1 F1893
G1 X141.659 Y130.192 E.0082
G1 X141.659 Y125.808 E.11335
G1 X141.341 Y125.808 E.0082
G1 X141.341 Y130.132 E.1118
; WIPE_START
G1 F24000
G1 X141.341 Y128.132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I1.211 J-.124 P1  F30000
G1 X140.602 Y120.931 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1893
G1 X140.602 Y118.602 E.07726
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y120.931 E.07726
G1 X140.662 Y120.931 E.05758
G1 X140.21 Y121.323 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1893
G1 X140.21 Y118.21 E.09566
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.323 E.09566
G1 X140.27 Y121.323 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.231 Y119.324 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I-1.031 J.647 P1  F30000
G1 X140.994 Y120.539 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1893
G1 X142.006 Y120.539 E.03109
G1 X142.006 Y118.994 E.04747
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.479 E.04563
G1 X141.341 Y120.192 F30000
; LINE_WIDTH: 0.360223
G1 F1893
G1 X141.659 Y120.192 E.0082
G1 X141.659 Y119.341 E.02199
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.132 E.02044
; CHANGE_LAYER
; Z_HEIGHT: 35.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.30045
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.192 E-.32325
G1 X141.617 Y120.192 E-.01573
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 179/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L179
M991 S0 P178 ;notify layer change
G17
G3 Z36 I-.035 J-1.216 P1  F30000
G1 X117.602 Y120.877 Z36
G1 Z35.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1864
G1 X117.602 Y118.602 E.07548
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.877 E.07548
G1 X117.662 Y120.877 E.05758
G1 X117.21 Y121.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1864
G1 X117.21 Y118.21 E.09401
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.269 E.09401
G1 X117.27 Y121.269 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.231 Y119.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I-.688 J1.004 P1  F30000
G1 X119.006 Y120.485 Z36.2
G1 Z35.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
M73 P91 R2
G1 F1864
G1 X119.006 Y118.994 E.04582
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.485 E.04582
G1 X118.946 Y120.485 E.02924
G1 X118.659 Y120.138 F30000
; LINE_WIDTH: 0.360223
G1 F1864
G1 X118.659 Y119.341 E.0206
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.138 E.0206
G1 X118.599 Y120.138 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.138 E-.09778
G1 X118.341 Y119.341 E-.30278
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.97 E-.23887
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I-1.211 J-.117 P1  F30000
G1 X117.602 Y130.877 Z36.2
G1 Z35.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1864
G1 X117.602 Y125.123 E.1909
G1 X119.398 Y125.123 E.05957
G1 X119.398 Y130.877 E.1909
G1 X117.662 Y130.877 E.05758
G1 X117.21 Y131.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1864
G1 X117.21 Y124.731 E.20092
G1 X119.79 Y124.731 E.07928
G1 X119.79 Y131.269 E.20092
G1 X117.27 Y131.269 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.252 Y129.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I1.071 J.578 P1  F30000
G1 X119.006 Y126.021 Z36.2
G1 Z35.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1864
G1 X119.006 Y125.515 E.01554
G1 X117.994 Y125.515 E.03109
G1 X117.994 Y130.485 E.15273
G1 X119.006 Y130.485 E.03109
G1 X119.006 Y126.081 E.13535
G1 X118.659 Y126.021 F30000
; LINE_WIDTH: 0.360223
G1 F1864
G1 X118.659 Y125.862 E.0041
G1 X118.341 Y125.862 E.0082
G1 X118.341 Y130.138 E.11057
G1 X118.659 Y130.138 E.0082
G1 X118.659 Y126.081 E.10491
; WIPE_START
G1 F24000
G1 X118.659 Y128.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I-1.21 J.127 P1  F30000
G1 X119.398 Y135.123 Z36.2
G1 Z35.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1864
G1 X119.398 Y137.398 E.07548
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y135.123 E.07548
G1 X119.338 Y135.123 E.05758
G1 X119.79 Y134.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1864
G1 X119.79 Y137.79 E.09401
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.731 E.09401
G1 X119.73 Y134.731 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.769 Y136.73 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I1.031 J-.647 P1  F30000
G1 X119.006 Y135.515 Z36.2
G1 Z35.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1864
G1 X117.994 Y135.515 E.03109
G1 X117.994 Y137.006 E.04582
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.575 E.04398
G1 X118.659 Y135.862 F30000
; LINE_WIDTH: 0.360223
G1 F1864
G1 X118.341 Y135.862 E.0082
G1 X118.341 Y136.659 E.0206
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.922 E.01905
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.27998
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.862 E-.30278
G1 X118.49 Y135.862 E-.05667
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I.041 J1.216 P1  F30000
G1 X140.602 Y135.123 Z36.2
G1 Z35.8
M73 P92 R2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1864
G1 X142.398 Y135.123 E.05957
G1 X142.398 Y137.398 E.07548
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.183 E.07349
G1 X140.21 Y134.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1864
G1 X142.79 Y134.731 E.07928
G1 X142.79 Y137.79 E.09401
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.791 E.09217
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.744 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.515 Z36.2
G1 Z35.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1864
G1 X140.994 Y137.006 E.04582
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.515 E.04582
G1 X141.054 Y135.515 E.02924
G1 X141.341 Y135.862 F30000
; LINE_WIDTH: 0.360223
G1 F1864
G1 X141.341 Y136.659 E.0206
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.862 E.0206
G1 X141.401 Y135.862 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.862 E-.09778
G1 X141.659 Y136.659 E-.30278
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.03 E-.23887
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I1.205 J-.173 P1  F30000
G1 X140.602 Y130.877 Z36.2
G1 Z35.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1864
G1 X140.602 Y125.123 E.1909
G1 X142.398 Y125.123 E.05957
G1 X142.398 Y130.877 E.1909
G1 X140.662 Y130.877 E.05758
G1 X140.21 Y131.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1864
G1 X140.21 Y124.731 E.20092
G1 X142.79 Y124.731 E.07928
G1 X142.79 Y131.269 E.20092
G1 X140.27 Y131.269 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.252 Y129.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I-1.039 J.634 P1  F30000
G1 X140.994 Y130.485 Z36.2
G1 Z35.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1864
G1 X142.006 Y130.485 E.03109
G1 X142.006 Y125.515 E.15273
G1 X140.994 Y125.515 E.03109
G1 X140.994 Y130.425 E.15089
G1 X141.341 Y130.138 F30000
; LINE_WIDTH: 0.360223
G1 F1864
G1 X141.659 Y130.138 E.0082
G1 X141.659 Y125.862 E.11057
G1 X141.341 Y125.862 E.0082
G1 X141.341 Y130.078 E.10902
; WIPE_START
G1 F24000
G1 X141.341 Y128.078 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I1.211 J-.124 P1  F30000
G1 X140.602 Y120.877 Z36.2
G1 Z35.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1864
G1 X140.602 Y118.602 E.07548
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y120.877 E.07548
G1 X140.662 Y120.877 E.05758
G1 X140.21 Y121.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1864
G1 X140.21 Y118.21 E.09401
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.269 E.09401
G1 X140.27 Y121.269 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.231 Y119.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I-1.031 J.647 P1  F30000
G1 X140.994 Y120.485 Z36.2
G1 Z35.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1864
G1 X142.006 Y120.485 E.03109
G1 X142.006 Y118.994 E.04582
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.425 E.04398
G1 X141.341 Y120.138 F30000
; LINE_WIDTH: 0.360223
G1 F1864
G1 X141.659 Y120.138 E.0082
G1 X141.659 Y119.341 E.0206
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.078 E.01905
; CHANGE_LAYER
; Z_HEIGHT: 36
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.27998
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.138 E-.30278
G1 X141.51 Y120.138 E-.05667
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 180/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L180
M991 S0 P179 ;notify layer change
G17
G3 Z36.2 I-.036 J-1.216 P1  F30000
G1 X117.602 Y120.852 Z36.2
G1 Z36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1850
G1 X117.602 Y118.602 E.07462
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.852 E.07462
G1 X117.662 Y120.852 E.05758
G1 X117.21 Y121.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1850
G1 X117.21 Y118.21 E.09322
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.244 E.09322
G1 X117.27 Y121.244 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.23 Y119.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I-.687 J1.004 P1  F30000
G1 X119.006 Y120.459 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1850
G1 X119.006 Y118.994 E.04502
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.459 E.04502
G1 X118.946 Y120.459 E.02924
G1 X118.659 Y120.112 F30000
; LINE_WIDTH: 0.360223
G1 F1850
G1 X118.659 Y119.341 E.01993
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.112 E.01993
G1 X118.599 Y120.112 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.112 E-.09778
G1 X118.341 Y119.341 E-.29295
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.996 E-.24869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I-1.211 J-.118 P1  F30000
G1 X117.602 Y130.852 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1850
G1 X117.602 Y125.148 E.18918
G1 X119.398 Y125.148 E.05957
G1 X119.398 Y130.852 E.18918
G1 X117.662 Y130.852 E.05758
G1 X117.21 Y131.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1850
G1 X117.21 Y124.756 E.19934
G1 X119.79 Y124.756 E.07928
G1 X119.79 Y131.244 E.19934
G1 X117.27 Y131.244 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.252 Y129.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I1.067 J.585 P1  F30000
G1 X119.006 Y126.046 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1850
G1 X119.006 Y125.541 E.01554
G1 X117.994 Y125.541 E.03109
G1 X117.994 Y130.459 E.15115
G1 X119.006 Y130.459 E.03109
G1 X119.006 Y126.106 E.13376
G1 X118.659 Y126.046 F30000
; LINE_WIDTH: 0.360223
G1 F1850
G1 X118.659 Y125.888 E.0041
G1 X118.341 Y125.888 E.0082
G1 X118.341 Y130.112 E.10923
G1 X118.659 Y130.112 E.0082
G1 X118.659 Y126.106 E.10358
; WIPE_START
G1 F24000
G1 X118.659 Y128.106 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I-1.21 J.127 P1  F30000
G1 X119.398 Y135.148 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1850
G1 X119.398 Y137.398 E.07462
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y135.148 E.07462
G1 X119.338 Y135.148 E.05758
G1 X119.79 Y134.756 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1850
G1 X119.79 Y137.79 E.09322
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.756 E.09322
G1 X119.73 Y134.756 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.77 Y136.756 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I1.03 J-.647 P1  F30000
G1 X119.006 Y135.541 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1850
G1 X117.994 Y135.541 E.03109
G1 X117.994 Y137.006 E.04503
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.601 E.04318
G1 X118.659 Y135.888 F30000
; LINE_WIDTH: 0.360223
G1 F1850
G1 X118.341 Y135.888 E.0082
G1 X118.341 Y136.659 E.01993
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.948 E.01838
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.27016
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.888 E-.29296
G1 X118.542 Y135.888 E-.07631
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I.041 J1.216 P1  F30000
G1 X140.602 Y135.148 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1850
G1 X142.398 Y135.148 E.05957
G1 X142.398 Y137.398 E.07462
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.208 E.07263
G1 X140.21 Y134.756 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1850
G1 X142.79 Y134.756 E.07928
G1 X142.79 Y137.79 E.09322
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.816 E.09137
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.541 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1850
G1 X140.994 Y137.006 E.04503
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.541 E.04503
G1 X141.054 Y135.541 E.02924
G1 X141.341 Y135.888 F30000
; LINE_WIDTH: 0.360223
G1 F1850
G1 X141.341 Y136.659 E.01993
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.888 E.01993
G1 X141.401 Y135.888 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.888 E-.09778
G1 X141.659 Y136.659 E-.29296
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.004 E-.24869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I1.205 J-.173 P1  F30000
G1 X140.602 Y130.852 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1850
G1 X140.602 Y125.148 E.18918
G1 X142.398 Y125.148 E.05957
G1 X142.398 Y130.852 E.18918
G1 X140.662 Y130.852 E.05758
G1 X140.21 Y131.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1850
G1 X140.21 Y124.756 E.19934
G1 X142.79 Y124.756 E.07928
G1 X142.79 Y131.244 E.19934
G1 X140.27 Y131.244 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.252 Y129.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I-1.039 J.634 P1  F30000
G1 X140.994 Y130.459 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1850
G1 X142.006 Y130.459 E.03109
G1 X142.006 Y125.541 E.15115
G1 X140.994 Y125.541 E.03109
G1 X140.994 Y130.399 E.1493
G1 X141.341 Y130.112 F30000
; LINE_WIDTH: 0.360223
G1 F1850
G1 X141.659 Y130.112 E.0082
G1 X141.659 Y125.888 E.10923
G1 X141.341 Y125.888 E.0082
G1 X141.341 Y130.052 E.10768
; WIPE_START
G1 F24000
G1 X141.341 Y128.052 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I1.211 J-.124 P1  F30000
G1 X140.602 Y120.852 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1850
G1 X140.602 Y118.602 E.07462
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y120.852 E.07462
G1 X140.662 Y120.852 E.05758
G1 X140.21 Y121.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1850
G1 X140.21 Y118.21 E.09322
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.244 E.09322
G1 X140.27 Y121.244 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.23 Y119.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I-1.03 J.647 P1  F30000
G1 X140.994 Y120.459 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1850
G1 X142.006 Y120.459 E.03109
G1 X142.006 Y118.994 E.04502
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.399 E.04318
G1 X141.341 Y120.112 F30000
; LINE_WIDTH: 0.360223
G1 F1850
G1 X141.659 Y120.112 E.0082
G1 X141.659 Y119.341 E.01993
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.052 E.01838
; CHANGE_LAYER
; Z_HEIGHT: 36.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.27015
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.112 E-.29295
G1 X141.458 Y120.112 E-.07631
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 181/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L181
M991 S0 P180 ;notify layer change
G17
G3 Z36.4 I-.038 J-1.216 P1  F30000
G1 X117.602 Y120.852 Z36.4
G1 Z36.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1850
G1 X117.602 Y118.602 E.07462
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.852 E.07462
G1 X117.662 Y120.852 E.05758
G1 X117.21 Y121.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1850
G1 X117.21 Y118.21 E.09322
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.244 E.09322
G1 X117.27 Y121.244 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.23 Y119.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I-.687 J1.004 P1  F30000
G1 X119.006 Y120.459 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1850
G1 X119.006 Y118.994 E.04502
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.459 E.04502
G1 X118.946 Y120.459 E.02924
G1 X118.659 Y120.112 F30000
; LINE_WIDTH: 0.360223
G1 F1850
G1 X118.659 Y119.341 E.01993
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.112 E.01993
G1 X118.599 Y120.112 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.112 E-.09778
G1 X118.341 Y119.341 E-.29295
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.996 E-.24869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I-1.211 J-.118 P1  F30000
G1 X117.602 Y130.852 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1850
G1 X117.602 Y125.148 E.18918
G1 X119.398 Y125.148 E.05957
G1 X119.398 Y130.852 E.18918
G1 X117.662 Y130.852 E.05758
G1 X117.21 Y131.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1850
G1 X117.21 Y124.756 E.19934
G1 X119.79 Y124.756 E.07928
G1 X119.79 Y131.244 E.19934
G1 X117.27 Y131.244 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.252 Y129.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I1.067 J.585 P1  F30000
G1 X119.006 Y126.046 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1850
G1 X119.006 Y125.541 E.01554
G1 X117.994 Y125.541 E.03109
G1 X117.994 Y130.459 E.15115
G1 X119.006 Y130.459 E.03109
G1 X119.006 Y126.106 E.13376
G1 X118.659 Y126.046 F30000
; LINE_WIDTH: 0.360223
G1 F1850
G1 X118.659 Y125.888 E.0041
G1 X118.341 Y125.888 E.0082
G1 X118.341 Y130.112 E.10923
G1 X118.659 Y130.112 E.0082
G1 X118.659 Y126.106 E.10358
; WIPE_START
G1 F24000
G1 X118.659 Y128.106 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I-1.21 J.127 P1  F30000
G1 X119.398 Y135.148 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1850
G1 X119.398 Y137.398 E.07462
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y135.148 E.07462
G1 X119.338 Y135.148 E.05758
G1 X119.79 Y134.756 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1850
G1 X119.79 Y137.79 E.09322
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.756 E.09322
G1 X119.73 Y134.756 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.77 Y136.756 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I1.03 J-.647 P1  F30000
G1 X119.006 Y135.541 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1850
G1 X117.994 Y135.541 E.03109
G1 X117.994 Y137.006 E.04503
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.601 E.04318
G1 X118.659 Y135.888 F30000
; LINE_WIDTH: 0.360223
G1 F1850
G1 X118.341 Y135.888 E.0082
G1 X118.341 Y136.659 E.01993
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.948 E.01838
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.27016
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.888 E-.29296
G1 X118.542 Y135.888 E-.07631
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I.041 J1.216 P1  F30000
G1 X140.602 Y135.148 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1850
G1 X142.398 Y135.148 E.05957
G1 X142.398 Y137.398 E.07462
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.208 E.07263
G1 X140.21 Y134.756 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1850
G1 X142.79 Y134.756 E.07928
G1 X142.79 Y137.79 E.09322
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.816 E.09137
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.541 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1850
G1 X140.994 Y137.006 E.04503
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.541 E.04503
G1 X141.054 Y135.541 E.02924
G1 X141.341 Y135.888 F30000
; LINE_WIDTH: 0.360223
G1 F1850
G1 X141.341 Y136.659 E.01993
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.888 E.01993
G1 X141.401 Y135.888 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.888 E-.09778
G1 X141.659 Y136.659 E-.29296
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.004 E-.24869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I1.205 J-.173 P1  F30000
G1 X140.602 Y130.852 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1850
G1 X140.602 Y125.148 E.18918
G1 X142.398 Y125.148 E.05957
G1 X142.398 Y130.852 E.18918
G1 X140.662 Y130.852 E.05758
G1 X140.21 Y131.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1850
G1 X140.21 Y124.756 E.19934
G1 X142.79 Y124.756 E.07928
G1 X142.79 Y131.244 E.19934
G1 X140.27 Y131.244 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.252 Y129.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I-1.039 J.634 P1  F30000
G1 X140.994 Y130.459 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
M73 P93 R2
G1 F1850
G1 X142.006 Y130.459 E.03109
G1 X142.006 Y125.541 E.15115
G1 X140.994 Y125.541 E.03109
G1 X140.994 Y130.399 E.1493
G1 X141.341 Y130.112 F30000
; LINE_WIDTH: 0.360223
G1 F1850
G1 X141.659 Y130.112 E.0082
G1 X141.659 Y125.888 E.10923
G1 X141.341 Y125.888 E.0082
G1 X141.341 Y130.052 E.10768
; WIPE_START
G1 F24000
G1 X141.341 Y128.052 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I1.211 J-.124 P1  F30000
G1 X140.602 Y120.852 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1850
G1 X140.602 Y118.602 E.07462
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y120.852 E.07462
G1 X140.662 Y120.852 E.05758
G1 X140.21 Y121.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1850
G1 X140.21 Y118.21 E.09322
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.244 E.09322
G1 X140.27 Y121.244 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.23 Y119.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I-1.03 J.647 P1  F30000
G1 X140.994 Y120.459 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1850
G1 X142.006 Y120.459 E.03109
G1 X142.006 Y118.994 E.04502
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.399 E.04318
G1 X141.341 Y120.112 F30000
; LINE_WIDTH: 0.360223
G1 F1850
G1 X141.659 Y120.112 E.0082
G1 X141.659 Y119.341 E.01993
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.052 E.01838
; CHANGE_LAYER
; Z_HEIGHT: 36.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.27015
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.112 E-.29295
G1 X141.458 Y120.112 E-.07631
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 182/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L182
M991 S0 P181 ;notify layer change
G17
G3 Z36.6 I-.039 J-1.216 P1  F30000
G1 X117.602 Y120.877 Z36.6
G1 Z36.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1864
G1 X117.602 Y118.602 E.07548
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.877 E.07548
G1 X117.662 Y120.877 E.05758
G1 X117.21 Y121.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1864
G1 X117.21 Y118.21 E.09401
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.269 E.09401
G1 X117.27 Y121.269 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.231 Y119.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I-.688 J1.004 P1  F30000
G1 X119.006 Y120.485 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1864
G1 X119.006 Y118.994 E.04582
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.485 E.04582
G1 X118.946 Y120.485 E.02924
G1 X118.659 Y120.138 F30000
; LINE_WIDTH: 0.360223
G1 F1864
G1 X118.659 Y119.341 E.0206
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.138 E.0206
G1 X118.599 Y120.138 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.138 E-.09778
G1 X118.341 Y119.341 E-.30278
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.97 E-.23887
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I-1.211 J-.117 P1  F30000
G1 X117.602 Y130.877 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1864
G1 X117.602 Y125.123 E.1909
G1 X119.398 Y125.123 E.05957
G1 X119.398 Y130.877 E.1909
G1 X117.662 Y130.877 E.05758
G1 X117.21 Y131.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1864
G1 X117.21 Y124.731 E.20092
G1 X119.79 Y124.731 E.07928
G1 X119.79 Y131.269 E.20092
G1 X117.27 Y131.269 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.252 Y129.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I1.071 J.578 P1  F30000
G1 X119.006 Y126.021 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1864
G1 X119.006 Y125.515 E.01554
G1 X117.994 Y125.515 E.03109
G1 X117.994 Y130.485 E.15273
G1 X119.006 Y130.485 E.03109
G1 X119.006 Y126.081 E.13535
G1 X118.659 Y126.021 F30000
; LINE_WIDTH: 0.360223
G1 F1864
G1 X118.659 Y125.862 E.0041
G1 X118.341 Y125.862 E.0082
G1 X118.341 Y130.138 E.11057
G1 X118.659 Y130.138 E.0082
G1 X118.659 Y126.081 E.10491
; WIPE_START
G1 F24000
G1 X118.659 Y128.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I-1.21 J.127 P1  F30000
G1 X119.398 Y135.123 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1864
G1 X119.398 Y137.398 E.07548
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y135.123 E.07548
G1 X119.338 Y135.123 E.05758
G1 X119.79 Y134.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1864
G1 X119.79 Y137.79 E.09401
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.731 E.09401
G1 X119.73 Y134.731 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X119.769 Y136.73 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I1.031 J-.647 P1  F30000
G1 X119.006 Y135.515 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1864
G1 X117.994 Y135.515 E.03109
G1 X117.994 Y137.006 E.04582
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.575 E.04398
G1 X118.659 Y135.862 F30000
; LINE_WIDTH: 0.360223
G1 F1864
G1 X118.341 Y135.862 E.0082
G1 X118.341 Y136.659 E.0206
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.922 E.01905
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.27998
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.862 E-.30278
G1 X118.49 Y135.862 E-.05667
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I.041 J1.216 P1  F30000
G1 X140.602 Y135.123 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1864
G1 X142.398 Y135.123 E.05957
G1 X142.398 Y137.398 E.07548
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.183 E.07349
G1 X140.21 Y134.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1864
G1 X142.79 Y134.731 E.07928
G1 X142.79 Y137.79 E.09401
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.791 E.09217
M204 S10000
; WIPE_START
G1 F24000
G1 X142.209 Y134.744 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I-.652 J-1.028 P1  F30000
G1 X140.994 Y135.515 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1864
G1 X140.994 Y137.006 E.04582
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.515 E.04582
G1 X141.054 Y135.515 E.02924
G1 X141.341 Y135.862 F30000
; LINE_WIDTH: 0.360223
G1 F1864
G1 X141.341 Y136.659 E.0206
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.862 E.0206
G1 X141.401 Y135.862 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.862 E-.09778
G1 X141.659 Y136.659 E-.30278
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.03 E-.23887
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I1.205 J-.173 P1  F30000
G1 X140.602 Y130.877 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1864
G1 X140.602 Y125.123 E.1909
G1 X142.398 Y125.123 E.05957
G1 X142.398 Y130.877 E.1909
G1 X140.662 Y130.877 E.05758
G1 X140.21 Y131.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1864
G1 X140.21 Y124.731 E.20092
G1 X142.79 Y124.731 E.07928
G1 X142.79 Y131.269 E.20092
G1 X140.27 Y131.269 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.252 Y129.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I-1.039 J.634 P1  F30000
G1 X140.994 Y130.485 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1864
G1 X142.006 Y130.485 E.03109
G1 X142.006 Y125.515 E.15273
G1 X140.994 Y125.515 E.03109
G1 X140.994 Y130.425 E.15089
G1 X141.341 Y130.138 F30000
; LINE_WIDTH: 0.360223
G1 F1864
G1 X141.659 Y130.138 E.0082
G1 X141.659 Y125.862 E.11057
G1 X141.341 Y125.862 E.0082
G1 X141.341 Y130.078 E.10902
; WIPE_START
G1 F24000
G1 X141.341 Y128.078 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I1.211 J-.124 P1  F30000
G1 X140.602 Y120.877 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1864
G1 X140.602 Y118.602 E.07548
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y120.877 E.07548
G1 X140.662 Y120.877 E.05758
G1 X140.21 Y121.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1864
G1 X140.21 Y118.21 E.09401
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.269 E.09401
G1 X140.27 Y121.269 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.231 Y119.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I-1.031 J.647 P1  F30000
G1 X140.994 Y120.485 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1864
G1 X142.006 Y120.485 E.03109
G1 X142.006 Y118.994 E.04582
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.425 E.04398
G1 X141.341 Y120.138 F30000
; LINE_WIDTH: 0.360223
G1 F1864
G1 X141.659 Y120.138 E.0082
G1 X141.659 Y119.341 E.0206
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.078 E.01905
; CHANGE_LAYER
; Z_HEIGHT: 36.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.27998
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.138 E-.30278
G1 X141.51 Y120.138 E-.05667
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 183/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L183
M991 S0 P182 ;notify layer change
G17
G3 Z36.8 I-.04 J-1.216 P1  F30000
G1 X117.602 Y120.931 Z36.8
G1 Z36.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1902
G1 X117.602 Y118.602 E.07726
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y120.931 E.07726
G1 X117.662 Y120.931 E.05758
G1 X117.21 Y121.31 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1902
G1 X117.21 Y118.21 E.09527
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.31 E.09527
G1 X119.79 Y121.323 E.0004
G1 X117.257 Y121.323 E.07783
M204 S10000
; WIPE_START
G1 F24000
G1 X117.227 Y119.324 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I-.687 J1.005 P1  F30000
G1 X119.006 Y120.539 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1902
G1 X119.006 Y118.994 E.04747
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.539 E.04747
G1 X118.946 Y120.539 E.02924
G1 X118.659 Y120.192 F30000
; LINE_WIDTH: 0.360223
G1 F1902
G1 X118.659 Y119.341 E.02199
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.192 E.02199
G1 X118.599 Y120.192 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.192 E-.09778
G1 X118.341 Y119.341 E-.32325
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.916 E-.2184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I-1.211 J-.116 P1  F30000
G1 X117.602 Y130.931 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1902
G1 X117.602 Y125.069 E.19447
G1 X119.398 Y125.069 E.05957
G1 X119.398 Y130.931 E.19447
G1 X117.662 Y130.931 E.05758
G1 X117.21 Y131.323 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1902
G1 X117.21 Y131.31 E.0004
G1 X117.21 Y124.69 E.20344
G1 X117.21 Y124.677 E.0004
G1 X119.79 Y124.677 E.07928
G1 X119.79 Y124.69 E.0004
G1 X119.79 Y131.31 E.20344
G1 X119.79 Y131.323 E.0004
G1 X117.27 Y131.323 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.21 Y131.31 E-.02332
G1 X117.21 Y129.372 E-.73668
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I1.076 J.568 P1  F30000
G1 X119.006 Y125.967 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1902
G1 X119.006 Y125.461 E.01554
G1 X117.994 Y125.461 E.03109
G1 X117.994 Y130.539 E.15604
G1 X119.006 Y130.539 E.03109
G1 X119.006 Y126.027 E.13866
G1 X118.659 Y125.967 F30000
; LINE_WIDTH: 0.360223
G1 F1902
G1 X118.659 Y125.808 E.0041
G1 X118.341 Y125.808 E.0082
G1 X118.341 Y130.192 E.11335
G1 X118.659 Y130.192 E.0082
G1 X118.659 Y126.027 E.1077
; WIPE_START
G1 F24000
G1 X118.659 Y128.027 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I-1.21 J.127 P1  F30000
G1 X119.398 Y135.069 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1902
G1 X119.398 Y137.398 E.07726
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y135.069 E.07726
G1 X119.338 Y135.069 E.05758
G1 X119.79 Y134.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1902
G1 X119.79 Y137.79 E.09527
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.69 E.09527
G1 X117.21 Y134.677 E.0004
G1 X119.743 Y134.677 E.07783
M204 S10000
; WIPE_START
G1 F24000
G1 X119.773 Y136.676 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I1.029 J-.65 P1  F30000
G1 X119.006 Y135.461 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1902
G1 X117.994 Y135.461 E.03109
G1 X117.994 Y137.006 E.04747
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.521 E.04563
G1 X118.659 Y135.808 F30000
; LINE_WIDTH: 0.360223
G1 F1902
G1 X118.341 Y135.808 E.0082
G1 X118.341 Y136.659 E.02199
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.868 E.02044
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.30045
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.808 E-.32325
G1 X118.383 Y135.808 E-.01573
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I.04 J1.216 P1  F30000
G1 X140.602 Y135.069 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1902
G1 X142.398 Y135.069 E.05957
G1 X142.398 Y137.398 E.07726
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.129 E.07527
G1 X140.21 Y134.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1902
G1 X140.21 Y134.677 E.0004
G1 X142.79 Y134.677 E.07928
G1 X142.79 Y134.69 E.0004
G1 X142.79 Y137.79 E.09527
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.75 E.09343
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y134.677 E-.02769
G1 X142.137 Y134.677 E-.73231
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I-.688 J-1.003 P1  F30000
G1 X140.994 Y135.461 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1902
G1 X140.994 Y137.006 E.04747
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.461 E.04747
G1 X141.054 Y135.461 E.02924
G1 X141.341 Y135.808 F30000
; LINE_WIDTH: 0.360223
G1 F1902
G1 X141.341 Y136.659 E.02199
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.808 E.02199
G1 X141.401 Y135.808 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.808 E-.09778
G1 X141.659 Y136.659 E-.32325
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.084 E-.2184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I1.205 J-.173 P1  F30000
G1 X140.602 Y130.931 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1902
G1 X140.602 Y125.069 E.19447
G1 X142.398 Y125.069 E.05957
G1 X142.398 Y130.931 E.19447
G1 X140.662 Y130.931 E.05758
G1 X140.21 Y131.323 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1902
G1 X140.21 Y131.31 E.0004
G1 X140.21 Y124.69 E.20344
G1 X140.21 Y124.677 E.0004
G1 X142.79 Y124.677 E.07928
G1 X142.79 Y124.69 E.0004
G1 X142.79 Y131.31 E.20344
G1 X142.79 Y131.323 E.0004
G1 X140.27 Y131.323 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y131.31 E-.02332
G1 X140.21 Y129.372 E-.73668
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I-1.01 J.679 P1  F30000
G1 X140.994 Y130.539 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1902
G1 X142.006 Y130.539 E.03109
G1 X142.006 Y125.461 E.15604
G1 X140.994 Y125.461 E.03109
G1 X140.994 Y130.479 E.1542
G1 X141.341 Y130.192 F30000
; LINE_WIDTH: 0.360223
G1 F1902
G1 X141.659 Y130.192 E.0082
G1 X141.659 Y125.808 E.11335
G1 X141.341 Y125.808 E.0082
G1 X141.341 Y130.132 E.1118
; WIPE_START
G1 F24000
G1 X141.341 Y128.132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I1.211 J-.124 P1  F30000
G1 X140.602 Y120.931 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1902
G1 X140.602 Y118.602 E.07726
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y120.931 E.07726
G1 X140.662 Y120.931 E.05758
G1 X140.21 Y121.323 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1902
G1 X140.21 Y121.31 E.0004
G1 X140.21 Y118.21 E.09527
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.31 E.09527
G1 X142.79 Y121.323 E.0004
G1 X140.27 Y121.323 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y121.31 E-.02332
G1 X140.21 Y119.372 E-.73668
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I-1.01 J.679 P1  F30000
G1 X140.994 Y120.539 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1902
G1 X142.006 Y120.539 E.03109
G1 X142.006 Y118.994 E.04747
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.479 E.04563
M73 P94 R2
G1 X141.341 Y120.192 F30000
; LINE_WIDTH: 0.360223
G1 F1902
G1 X141.659 Y120.192 E.0082
G1 X141.659 Y119.341 E.02199
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.132 E.02044
; CHANGE_LAYER
; Z_HEIGHT: 36.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.30045
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.192 E-.32325
G1 X141.617 Y120.192 E-.01573
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 184/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L184
M991 S0 P183 ;notify layer change
G17
G3 Z37 I-.042 J-1.216 P1  F30000
G1 X117.602 Y121.016 Z37
G1 Z36.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1947
G1 X117.602 Y118.602 E.08006
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.016 E.08006
G1 X117.662 Y121.016 E.05758
G1 X117.21 Y121.364 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1947
G1 X117.21 Y118.21 E.09692
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.364 E.09692
G1 X119.79 Y121.408 E.00133
G1 X117.227 Y121.408 E.07876
M204 S10000
; WIPE_START
G1 F24000
G1 X117.216 Y119.408 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I-.684 J1.007 P1  F30000
G1 X119.006 Y120.623 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1947
G1 X119.006 Y118.994 E.05006
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.623 E.05006
G1 X118.946 Y120.623 E.02924
G1 X118.659 Y120.276 F30000
; LINE_WIDTH: 0.360223
G1 F1947
G1 X118.659 Y119.341 E.02417
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.276 E.02417
G1 X118.599 Y120.276 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.276 E-.09778
G1 X118.341 Y119.341 E-.35526
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.832 E-.18639
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I-1.212 J-.114 P1  F30000
G1 X117.602 Y131.016 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1947
G1 X117.602 Y124.984 E.20006
G1 X119.398 Y124.984 E.05957
G1 X119.398 Y131.016 E.20006
G1 X117.662 Y131.016 E.05758
G1 X117.21 Y131.364 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1947
G1 X117.21 Y124.636 E.20675
G1 X117.21 Y124.592 E.00133
G1 X119.79 Y124.592 E.07928
G1 X119.79 Y124.636 E.00133
G1 X119.79 Y131.364 E.20675
G1 X119.79 Y131.408 E.00133
G1 X117.227 Y131.408 E.07876
M204 S10000
; WIPE_START
G1 F24000
G1 X117.222 Y129.408 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I1.086 J.55 P1  F30000
G1 X119.006 Y125.882 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1947
G1 X119.006 Y125.377 E.01554
G1 X117.994 Y125.377 E.03109
G1 X117.994 Y130.623 E.16122
G1 X119.006 Y130.623 E.03109
G1 X119.006 Y125.942 E.14383
G1 X118.659 Y125.882 F30000
; LINE_WIDTH: 0.360223
G1 F1947
G1 X118.659 Y125.724 E.0041
G1 X118.341 Y125.724 E.0082
G1 X118.341 Y130.276 E.11771
G1 X118.659 Y130.276 E.0082
G1 X118.659 Y125.942 E.11206
; WIPE_START
G1 F24000
G1 X118.659 Y127.942 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I-1.21 J.127 P1  F30000
G1 X119.398 Y134.984 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1947
G1 X119.398 Y137.398 E.08006
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.984 E.08006
G1 X119.338 Y134.984 E.05758
G1 X119.79 Y134.636 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1947
G1 X119.79 Y137.79 E.09692
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.636 E.09692
G1 X117.21 Y134.592 E.00133
G1 X119.773 Y134.592 E.07876
M204 S10000
; WIPE_START
G1 F24000
G1 X119.784 Y136.592 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I1.025 J-.656 P1  F30000
G1 X119.006 Y135.377 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1947
G1 X117.994 Y135.377 E.03109
G1 X117.994 Y137.006 E.05006
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.437 E.04822
G1 X118.659 Y135.724 F30000
; LINE_WIDTH: 0.360223
G1 F1947
G1 X118.341 Y135.724 E.0082
G1 X118.341 Y136.659 E.02417
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.784 E.02262
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.33246
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.851 E-.30697
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I.047 J1.216 P1  F30000
G1 X140.602 Y134.984 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1947
G1 X142.398 Y134.984 E.05957
G1 X142.398 Y137.398 E.08006
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y135.044 E.07807
G1 X140.21 Y134.636 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1947
G1 X140.21 Y134.592 E.00133
G1 X142.79 Y134.592 E.07928
G1 X142.79 Y134.636 E.00133
G1 X142.79 Y137.79 E.09692
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.696 E.09508
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y134.592 E-.03923
G1 X142.107 Y134.592 E-.72077
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I-.701 J-.995 P1  F30000
G1 X140.994 Y135.377 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1947
G1 X140.994 Y137.006 E.05006
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.377 E.05006
G1 X141.054 Y135.377 E.02924
G1 X141.341 Y135.724 F30000
; LINE_WIDTH: 0.360223
G1 F1947
G1 X141.341 Y136.659 E.02417
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.724 E.02417
G1 X141.401 Y135.724 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.724 E-.09778
G1 X141.659 Y136.659 E-.35526
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.168 E-.18639
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I1.205 J-.173 P1  F30000
G1 X140.602 Y131.016 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1947
G1 X140.602 Y124.984 E.20006
G1 X142.398 Y124.984 E.05957
G1 X142.398 Y131.016 E.20006
G1 X140.662 Y131.016 E.05758
G1 X140.21 Y131.408 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1947
G1 X140.21 Y131.364 E.00133
G1 X140.21 Y124.636 E.20675
G1 X140.21 Y124.592 E.00133
G1 X142.79 Y124.592 E.07928
G1 X142.79 Y124.636 E.00133
G1 X142.79 Y131.364 E.20675
G1 X142.79 Y131.408 E.00133
G1 X140.27 Y131.408 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y131.364 E-.0281
G1 X140.21 Y129.438 E-.7319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I-1.015 J.672 P1  F30000
G1 X140.994 Y130.623 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1947
G1 X142.006 Y130.623 E.03109
G1 X142.006 Y125.377 E.16122
G1 X140.994 Y125.377 E.03109
G1 X140.994 Y130.563 E.15938
G1 X141.341 Y130.276 F30000
; LINE_WIDTH: 0.360223
G1 F1947
G1 X141.659 Y130.276 E.0082
G1 X141.659 Y125.724 E.11771
G1 X141.341 Y125.724 E.0082
G1 X141.341 Y130.216 E.11616
; WIPE_START
G1 F24000
G1 X141.341 Y128.216 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I1.211 J-.124 P1  F30000
G1 X140.602 Y121.016 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1947
G1 X140.602 Y118.602 E.08006
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.016 E.08006
G1 X140.662 Y121.016 E.05758
G1 X140.21 Y121.408 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1947
G1 X140.21 Y121.364 E.00133
G1 X140.21 Y118.21 E.09692
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.364 E.09692
G1 X142.79 Y121.408 E.00133
G1 X140.27 Y121.408 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y121.364 E-.0281
G1 X140.21 Y119.438 E-.7319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I-1.015 J.672 P1  F30000
G1 X140.994 Y120.623 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1947
G1 X142.006 Y120.623 E.03109
G1 X142.006 Y118.994 E.05006
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.563 E.04822
G1 X141.341 Y120.276 F30000
; LINE_WIDTH: 0.360223
G1 F1947
G1 X141.659 Y120.276 E.0082
G1 X141.659 Y119.341 E.02417
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.216 E.02262
; CHANGE_LAYER
; Z_HEIGHT: 37
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.33246
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.149 E-.30697
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 185/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L185
M991 S0 P184 ;notify layer change
G17
G3 Z37.2 I-.05 J-1.216 P1  F30000
G1 X117.602 Y121.137 Z37.2
G1 Z37
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2013
G1 X117.602 Y118.602 E.08407
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.137 E.08407
G1 X117.662 Y121.137 E.05758
G1 X117.21 Y121.449 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2013
G1 X117.21 Y118.21 E.09951
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.449 E.09951
G1 X119.79 Y121.529 E.00246
G1 X117.21 Y121.529 E.07928
G1 X117.21 Y121.509 E.00062
M204 S10000
; WIPE_START
G1 F24000
G1 X117.21 Y119.509 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.4 I-.69 J1.003 P1  F30000
G1 X119.006 Y120.744 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2013
G1 X119.006 Y118.994 E.05378
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.744 E.05378
G1 X118.946 Y120.744 E.02924
G1 X118.659 Y120.397 F30000
; LINE_WIDTH: 0.360223
G1 F2013
G1 X118.659 Y119.341 E.0273
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.397 E.0273
G1 X118.599 Y120.397 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.397 E-.09778
G1 X118.341 Y119.341 E-.40126
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.711 E-.14039
; WIPE_END
M73 P94 R1
G1 E-.04 F1800
G17
G3 Z37.4 I-1.212 J-.112 P1  F30000
G1 X117.602 Y131.137 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2013
G1 X117.602 Y124.863 E.20809
G1 X119.398 Y124.863 E.05957
G1 X119.398 Y131.137 E.20809
G1 X117.662 Y131.137 E.05758
G1 X117.21 Y131.449 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2013
G1 X117.21 Y124.551 E.21193
G1 X117.21 Y124.471 E.00246
G1 X119.79 Y124.471 E.07928
G1 X119.79 Y124.551 E.00246
G1 X119.79 Y131.449 E.21193
G1 X119.79 Y131.529 E.00246
G1 X117.21 Y131.529 E.07928
G1 X117.21 Y131.509 E.00062
M204 S10000
; WIPE_START
G1 F24000
G1 X117.21 Y129.509 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.4 I1.121 J.473 P1  F30000
G1 X119.006 Y125.256 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2013
G1 X117.994 Y125.256 E.03109
G1 X117.994 Y130.744 E.16866
G1 X119.006 Y130.744 E.03109
G1 X119.006 Y125.316 E.16682
G1 X118.659 Y125.603 F30000
; LINE_WIDTH: 0.360223
G1 F2013
G1 X118.341 Y125.603 E.0082
G1 X118.341 Y130.397 E.12397
G1 X118.659 Y130.397 E.0082
G1 X118.659 Y125.663 E.12242
; WIPE_START
G1 F24000
G1 X118.659 Y127.663 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.4 I-1.211 J.124 P1  F30000
G1 X119.398 Y134.863 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2013
G1 X119.398 Y137.398 E.08407
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.863 E.08407
G1 X119.338 Y134.863 E.05758
G1 X119.79 Y134.551 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2013
G1 X119.79 Y137.79 E.09951
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.551 E.09951
G1 X117.21 Y134.471 E.00246
G1 X119.79 Y134.471 E.07928
G1 X119.79 Y134.491 E.00062
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y136.491 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.4 I1.028 J-.652 P1  F30000
G1 X119.006 Y135.256 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2013
G1 X117.994 Y135.256 E.03109
G1 X117.994 Y137.006 E.05378
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.316 E.05194
G1 X118.659 Y135.603 F30000
; LINE_WIDTH: 0.360223
G1 F2013
G1 X118.341 Y135.603 E.0082
G1 X118.341 Y136.659 E.0273
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.663 E.02575
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.37846
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y135.972 E-.26097
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.4 I.061 J1.215 P1  F30000
G1 X140.602 Y134.863 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2013
G1 X142.398 Y134.863 E.05957
G1 X142.398 Y137.398 E.08407
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.923 E.08208
G1 X140.21 Y134.551 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2013
G1 X140.21 Y134.471 E.00246
G1 X142.79 Y134.471 E.07928
G1 X142.79 Y134.551 E.00246
G1 X142.79 Y137.79 E.09951
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.611 E.09767
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y134.471 E-.05322
G1 X142.07 Y134.471 E-.70678
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.4 I-.717 J-.983 P1  F30000
G1 X140.994 Y135.256 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2013
G1 X140.994 Y137.006 E.05378
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.256 E.05378
G1 X141.054 Y135.256 E.02924
G1 X141.341 Y135.603 F30000
; LINE_WIDTH: 0.360223
G1 F2013
G1 X141.341 Y136.659 E.0273
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.603 E.0273
G1 X141.401 Y135.603 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.603 E-.09778
G1 X141.659 Y136.659 E-.40126
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.289 E-.14039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.4 I1.205 J-.173 P1  F30000
G1 X140.602 Y131.137 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2013
G1 X140.602 Y124.863 E.20809
G1 X142.398 Y124.863 E.05957
G1 X142.398 Y131.137 E.20809
G1 X140.662 Y131.137 E.05758
G1 X140.21 Y131.529 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2013
G1 X140.21 Y131.449 E.00246
G1 X140.21 Y124.551 E.21193
G1 X140.21 Y124.471 E.00246
G1 X142.79 Y124.471 E.07928
G1 X142.79 Y124.551 E.00246
G1 X142.79 Y131.449 E.21193
G1 X142.79 Y131.529 E.00246
G1 X140.27 Y131.529 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y131.449 E-.03802
G1 X140.21 Y129.549 E-.72198
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.4 I-1.018 J.667 P1  F30000
G1 X140.994 Y130.744 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2013
G1 X142.006 Y130.744 E.03109
G1 X142.006 Y125.256 E.16866
G1 X140.994 Y125.256 E.03109
G1 X140.994 Y130.684 E.16682
G1 X141.341 Y130.397 F30000
; LINE_WIDTH: 0.360223
G1 F2013
G1 X141.659 Y130.397 E.0082
G1 X141.659 Y125.603 E.12397
G1 X141.341 Y125.603 E.0082
G1 X141.341 Y130.337 E.12242
; WIPE_START
G1 F24000
G1 X141.341 Y128.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.4 I1.211 J-.124 P1  F30000
G1 X140.602 Y121.137 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2013
G1 X140.602 Y118.602 E.08407
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.137 E.08407
G1 X140.662 Y121.137 E.05758
G1 X140.21 Y121.529 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2013
G1 X140.21 Y121.449 E.00246
G1 X140.21 Y118.21 E.09951
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.449 E.09951
G1 X142.79 Y121.529 E.00246
G1 X140.27 Y121.529 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y121.449 E-.03802
G1 X140.21 Y119.549 E-.72198
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.4 I-1.018 J.667 P1  F30000
G1 X140.994 Y120.744 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2013
G1 X142.006 Y120.744 E.03109
G1 X142.006 Y118.994 E.05378
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.684 E.05194
G1 X141.341 Y120.397 F30000
; LINE_WIDTH: 0.360223
G1 F2013
G1 X141.659 Y120.397 E.0082
G1 X141.659 Y119.341 E.0273
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.337 E.02575
; CHANGE_LAYER
; Z_HEIGHT: 37.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.37846
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y120.028 E-.26097
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 186/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L186
M991 S0 P185 ;notify layer change
G17
G3 Z37.4 I-.065 J-1.215 P1  F30000
G1 X117.602 Y121.306 Z37.4
G1 Z37.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2104
G1 X117.602 Y118.602 E.0897
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.306 E.0897
G1 X117.662 Y121.306 E.05758
G1 X117.21 Y121.57 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2104
G1 X117.21 Y118.21 E.10323
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.652 E.10575
G1 X119.79 Y121.698 E.00144
G1 X117.21 Y121.698 E.07928
G1 X117.21 Y121.652 E.00144
G1 X117.21 Y121.63 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X117.21 Y119.63 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.6 I-.708 J.99 P1  F30000
G1 X119.006 Y120.914 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2104
G1 X119.006 Y118.994 E.059
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y120.914 E.059
G1 X118.946 Y120.914 E.02924
G1 X118.659 Y120.567 F30000
; LINE_WIDTH: 0.360223
G1 F2104
G1 X118.659 Y119.341 E.03169
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.567 E.03169
G1 X118.599 Y120.567 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.567 E-.09778
G1 X118.341 Y119.341 E-.46576
G1 X118.659 Y119.341 E-.12058
G1 X118.659 Y119.541 E-.07589
; WIPE_END
M73 P95 R1
G1 E-.04 F1800
G17
G3 Z37.6 I-1.212 J-.109 P1  F30000
G1 X117.602 Y131.306 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2104
G1 X117.602 Y124.694 E.21935
G1 X119.398 Y124.694 E.05957
G1 X119.398 Y131.306 E.21935
G1 X117.662 Y131.306 E.05758
G1 X117.21 Y131.57 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2104
G1 X117.21 Y124.348 E.22189
G1 X117.21 Y124.302 E.00144
G1 X119.79 Y124.302 E.07928
G1 X119.79 Y124.348 E.00144
G1 X119.79 Y131.652 E.22441
G1 X119.79 Y131.698 E.00144
G1 X117.21 Y131.698 E.07928
G1 X117.21 Y131.652 E.00144
G1 X117.21 Y131.63 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X117.21 Y129.63 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.6 I1.112 J.495 P1  F30000
G1 X119.006 Y125.592 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2104
G1 X119.006 Y125.086 E.01554
G1 X117.994 Y125.086 E.03109
G1 X117.994 Y130.914 E.17909
G1 X119.006 Y130.914 E.03109
G1 X119.006 Y125.652 E.1617
G1 X118.659 Y125.592 F30000
; LINE_WIDTH: 0.360223
G1 F2104
G1 X118.659 Y125.433 E.0041
G1 X118.341 Y125.433 E.0082
G1 X118.341 Y130.567 E.13275
G1 X118.659 Y130.567 E.0082
G1 X118.659 Y125.652 E.12709
; WIPE_START
G1 F24000
G1 X118.659 Y127.652 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.6 I-1.21 J.127 P1  F30000
G1 X119.398 Y134.694 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2104
G1 X119.398 Y137.398 E.0897
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.694 E.0897
G1 X119.338 Y134.694 E.05758
G1 X119.79 Y134.43 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2104
G1 X119.79 Y137.79 E.10323
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.348 E.10575
G1 X117.21 Y134.302 E.00144
G1 X119.79 Y134.302 E.07928
G1 X119.79 Y134.348 E.00144
G1 X119.79 Y134.37 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y136.37 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.6 I1.039 J-.634 P1  F30000
G1 X119.006 Y135.086 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2104
G1 X117.994 Y135.086 E.03109
G1 X117.994 Y137.006 E.059
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y135.146 E.05715
G1 X118.659 Y135.433 F30000
; LINE_WIDTH: 0.360223
G1 F2104
G1 X118.341 Y135.433 E.0082
G1 X118.341 Y136.659 E.03169
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.493 E.03014
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.44296
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y136.142 E-.19647
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.6 I.079 J1.214 P1  F30000
G1 X140.602 Y134.694 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2104
G1 X142.398 Y134.694 E.05957
G1 X142.398 Y137.398 E.0897
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.754 E.08771
G1 X140.21 Y134.348 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2104
G1 X140.21 Y134.302 E.00144
G1 X142.79 Y134.302 E.07928
G1 X142.79 Y134.348 E.00144
G1 X142.79 Y134.43 E.00252
G1 X142.79 Y137.79 E.10323
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.408 E.10391
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y134.302 E-.04056
G1 X142.103 Y134.302 E-.71944
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.6 I-.703 J-.994 P1  F30000
G1 X140.994 Y135.086 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2104
G1 X140.994 Y137.006 E.059
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y135.086 E.059
G1 X141.054 Y135.086 E.02924
G1 X141.341 Y135.433 F30000
; LINE_WIDTH: 0.360223
G1 F2104
G1 X141.341 Y136.659 E.03169
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.433 E.03169
G1 X141.401 Y135.433 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.433 E-.09778
G1 X141.659 Y136.659 E-.46576
G1 X141.341 Y136.659 E-.12058
G1 X141.341 Y136.459 E-.07589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.6 I1.205 J-.173 P1  F30000
G1 X140.602 Y131.306 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2104
G1 X140.602 Y124.694 E.21935
G1 X142.398 Y124.694 E.05957
G1 X142.398 Y131.306 E.21935
G1 X140.662 Y131.306 E.05758
G1 X140.21 Y131.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2104
G1 X140.21 Y131.57 E.00252
G1 X140.21 Y124.348 E.22189
G1 X140.21 Y124.302 E.00144
G1 X142.79 Y124.302 E.07928
G1 X142.79 Y124.348 E.00144
G1 X142.79 Y131.652 E.22441
G1 X142.79 Y131.698 E.00144
G1 X140.223 Y131.698 E.07887
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y131.57 E-.04918
G1 X140.21 Y129.699 E-.71082
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.6 I-1.023 J.66 P1  F30000
G1 X140.994 Y130.914 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2104
G1 X142.006 Y130.914 E.03109
G1 X142.006 Y125.086 E.17909
G1 X140.994 Y125.086 E.03109
G1 X140.994 Y130.854 E.17725
G1 X141.341 Y130.567 F30000
; LINE_WIDTH: 0.360223
G1 F2104
G1 X141.659 Y130.567 E.0082
G1 X141.659 Y125.433 E.13275
G1 X141.341 Y125.433 E.0082
G1 X141.341 Y130.507 E.1312
; WIPE_START
G1 F24000
G1 X141.341 Y128.507 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.6 I1.211 J-.124 P1  F30000
G1 X140.602 Y121.306 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2104
G1 X140.602 Y118.602 E.0897
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.306 E.0897
G1 X140.662 Y121.306 E.05758
G1 X140.21 Y121.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2104
G1 X140.21 Y121.57 E.00252
G1 X140.21 Y118.21 E.10323
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.652 E.10575
G1 X142.79 Y121.698 E.00144
G1 X140.223 Y121.698 E.07887
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y121.57 E-.04918
G1 X140.21 Y119.699 E-.71082
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.6 I-1.023 J.66 P1  F30000
G1 X140.994 Y120.914 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2104
G1 X142.006 Y120.914 E.03109
G1 X142.006 Y118.994 E.059
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y120.854 E.05715
G1 X141.341 Y120.567 F30000
; LINE_WIDTH: 0.360223
G1 F2104
G1 X141.659 Y120.567 E.0082
G1 X141.659 Y119.341 E.03169
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.507 E.03014
; CHANGE_LAYER
; Z_HEIGHT: 37.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.44296
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y119.858 E-.19647
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 187/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L187
M991 S0 P186 ;notify layer change
G17
G3 Z37.6 I-.086 J-1.214 P1  F30000
G1 X117.602 Y121.554 Z37.6
G1 Z37.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2257
G1 X117.602 Y118.602 E.09792
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.554 E.09792
G1 X117.662 Y121.554 E.05758
G1 X117.21 Y121.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2257
G1 X117.21 Y118.21 E.10845
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y121.739 E.10845
G1 X119.79 Y121.903 E.00504
M106 S255
G1 F1800
G1 X119.79 Y121.946 E.00131
G1 X117.21 Y121.946 E.07928
G1 X117.21 Y121.903 E.00131
M106 S252.45
G1 F2257
G1 X117.21 Y121.799 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X117.21 Y119.799 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.8 I-.736 J.97 P1  F30000
G1 X119.006 Y121.162 Z37.8
G1 Z37.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2257
G1 X119.006 Y118.994 E.06661
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y121.162 E.06661
G1 X118.946 Y121.162 E.02924
G1 X118.659 Y120.815 F30000
; LINE_WIDTH: 0.360223
G1 F2257
G1 X118.659 Y119.341 E.0381
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y120.815 E.0381
G1 X118.599 Y120.815 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y120.815 E-.09778
G1 X118.341 Y119.341 E-.55988
G1 X118.611 Y119.341 E-.10235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.8 I-1.213 J-.1 P1  F30000
G1 X117.602 Y131.554 Z37.8
G1 Z37.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2257
G1 X117.602 Y124.446 E.23578
G1 X119.398 Y124.446 E.05957
G1 X119.398 Y131.554 E.23578
G1 X117.662 Y131.554 E.05758
G1 X117.21 Y131.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2257
G1 X117.21 Y124.261 E.2298
G1 X117.21 Y124.097 E.00504
M106 S255
G1 F1800
G1 X117.21 Y124.054 E.00131
G1 X119.79 Y124.054 E.07928
G1 X119.79 Y124.097 E.00131
M106 S252.45
G1 F2257
G1 X119.79 Y124.261 E.00504
G1 X119.79 Y131.739 E.2298
G1 X119.79 Y131.903 E.00504
M106 S255
G1 F1800
G1 X119.79 Y131.946 E.00131
G1 X117.21 Y131.946 E.07928
G1 X117.21 Y131.903 E.00131
M106 S252.45
G1 F2257
G1 X117.21 Y131.799 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X117.21 Y129.799 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.8 I-.736 J.97 P1  F30000
G1 X119.006 Y131.162 Z37.8
G1 Z37.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2257
G1 X119.006 Y124.838 E.19431
G1 X117.994 Y124.838 E.03109
G1 X117.994 Y131.162 E.19431
G1 X118.946 Y131.162 E.02924
G1 X118.659 Y130.815 F30000
; LINE_WIDTH: 0.360223
G1 F2257
G1 X118.659 Y125.185 E.14556
G1 X118.341 Y125.185 E.0082
G1 X118.341 Y130.815 E.14556
G1 X118.599 Y130.815 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y130.815 E-.09778
G1 X118.341 Y129.072 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.8 I-1.194 J.235 P1  F30000
G1 X119.398 Y134.446 Z37.8
G1 Z37.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2257
G1 X119.398 Y137.398 E.09792
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.446 E.09792
G1 X119.338 Y134.446 E.05758
G1 X119.79 Y134.261 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2257
G1 X119.79 Y137.79 E.10845
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y134.261 E.10845
G1 X117.21 Y134.097 E.00504
M106 S255
G1 F1800
G1 X117.21 Y134.054 E.00131
G1 X119.79 Y134.054 E.07928
G1 X119.79 Y134.097 E.00131
M106 S252.45
G1 F2257
G1 X119.79 Y134.201 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X119.79 Y136.201 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.8 I1.055 J-.607 P1  F30000
G1 X119.006 Y134.838 Z37.8
G1 Z37.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2257
G1 X117.994 Y134.838 E.03109
G1 X117.994 Y137.006 E.06661
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y134.898 E.06477
G1 X118.659 Y135.185 F30000
; LINE_WIDTH: 0.360223
G1 F2257
G1 X118.341 Y135.185 E.0082
G1 X118.341 Y136.659 E.0381
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y135.245 E.03654
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.53708
G1 X118.341 Y136.659 E-.12058
G1 X118.341 Y136.389 E-.10235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.8 I.106 J1.212 P1  F30000
G1 X140.602 Y134.446 Z37.8
G1 Z37.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2257
G1 X142.398 Y134.446 E.05957
G1 X142.398 Y137.398 E.09792
G1 X140.602 Y137.398 E.05957
G1 X140.602 Y134.506 E.09593
G1 X140.21 Y134.261 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2257
G1 X140.21 Y134.097 E.00504
M106 S255
G1 F1800
G1 X140.21 Y134.054 E.00131
G1 X142.79 Y134.054 E.07928
G1 X142.79 Y134.097 E.00131
M106 S252.45
G1 F2257
G1 X142.79 Y134.261 E.00504
G1 X142.79 Y137.79 E.10845
G1 X140.21 Y137.79 E.07928
G1 X140.21 Y134.321 E.1066
M204 S10000
G1 X140.994 Y134.838 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2257
G1 X140.994 Y137.006 E.06661
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y134.838 E.06661
G1 X141.054 Y134.838 E.02924
G1 X141.341 Y135.185 F30000
; LINE_WIDTH: 0.360223
G1 F2257
G1 X141.341 Y136.659 E.0381
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y135.185 E.0381
G1 X141.401 Y135.185 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y135.185 E-.09778
G1 X141.659 Y136.659 E-.55988
G1 X141.389 Y136.659 E-.10235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.8 I1.203 J-.185 P1  F30000
G1 X140.602 Y131.554 Z37.8
G1 Z37.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2257
G1 X140.602 Y124.446 E.23578
G1 X142.398 Y124.446 E.05957
G1 X142.398 Y131.554 E.23578
G1 X140.662 Y131.554 E.05758
G1 X140.21 Y131.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2257
G1 X140.21 Y124.261 E.2298
G1 X140.21 Y124.097 E.00504
M106 S255
G1 F1800
G1 X140.21 Y124.054 E.00131
G1 X142.79 Y124.054 E.07928
G1 X142.79 Y124.097 E.00131
M106 S252.45
G1 F2257
G1 X142.79 Y124.261 E.00504
G1 X142.79 Y131.739 E.2298
G1 X142.79 Y131.903 E.00504
M106 S255
G1 F1800
G1 X142.79 Y131.946 E.00131
G1 X140.21 Y131.946 E.07928
G1 X140.21 Y131.903 E.00131
M106 S252.45
G1 F2257
G1 X140.21 Y131.799 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y129.799 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.8 I-1.055 J.607 P1  F30000
G1 X140.994 Y131.162 Z37.8
G1 Z37.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2257
G1 X142.006 Y131.162 E.03109
G1 X142.006 Y124.838 E.19431
G1 X140.994 Y124.838 E.03109
G1 X140.994 Y131.102 E.19247
G1 X141.341 Y130.815 F30000
; LINE_WIDTH: 0.360223
G1 F2257
G1 X141.659 Y130.815 E.0082
G1 X141.659 Y125.185 E.14556
G1 X141.341 Y125.185 E.0082
G1 X141.341 Y130.755 E.144
; WIPE_START
G1 F24000
G1 X141.341 Y128.755 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.8 I1.211 J-.124 P1  F30000
G1 X140.602 Y121.554 Z37.8
G1 Z37.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2257
G1 X140.602 Y118.602 E.09792
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.554 E.09792
G1 X140.662 Y121.554 E.05758
G1 X140.21 Y121.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2257
G1 X140.21 Y118.21 E.10845
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y121.739 E.10845
G1 X142.79 Y121.903 E.00504
M106 S255
G1 F1800
G1 X142.79 Y121.946 E.00131
G1 X140.21 Y121.946 E.07928
G1 X140.21 Y121.903 E.00131
M106 S252.45
G1 F2257
G1 X140.21 Y121.799 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X140.21 Y119.799 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.8 I-1.055 J.607 P1  F30000
G1 X140.994 Y121.162 Z37.8
G1 Z37.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2257
G1 X142.006 Y121.162 E.03109
G1 X142.006 Y118.994 E.06661
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y121.102 E.06477
G1 X141.341 Y120.815 F30000
; LINE_WIDTH: 0.360223
G1 F2257
G1 X141.659 Y120.815 E.0082
G1 X141.659 Y119.341 E.0381
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y120.755 E.03654
; CHANGE_LAYER
; Z_HEIGHT: 37.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.53708
G1 X141.659 Y119.341 E-.12058
G1 X141.659 Y119.611 E-.10235
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 188/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L188
M991 S0 P187 ;notify layer change
G17
G3 Z37.8 I-.088 J-1.214 P1  F30000
G1 X117.602 Y121.351 Z37.8
G1 Z37.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2384
G1 X117.602 Y118.602 E.09117
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y121.974 E.11184
G1 X119.398 Y122.009 E.00118
G1 X117.602 Y122.009 E.05957
G1 X117.602 Y121.974 E.00118
G1 X117.602 Y121.411 E.01868
G1 X117.21 Y121.351 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X117.21 Y118.21 E.0965
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y122.356 E.1274
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.79 Y122.401 E.0015
G1 X117.21 Y122.401 E.08558
G1 X117.21 Y122.356 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X117.21 Y121.987 E.01134
G1 X117.21 Y121.411 E.01771
M204 S10000
; WIPE_START
G1 F24000
G1 X117.21 Y119.411 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38 I-.944 J.768 P1  F30000
G1 X119.006 Y121.617 Z38
G1 Z37.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2384
G1 X119.006 Y118.994 E.0806
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y121.617 E.0806
G1 X118.946 Y121.617 E.02924
G1 X118.659 Y121.27 F30000
; LINE_WIDTH: 0.360223
G1 F2384
G1 X118.659 Y119.341 E.04987
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y121.27 E.04987
G1 X118.599 Y121.27 E.00665
; WIPE_START
G1 F24000
G1 X118.341 Y121.27 E-.09778
G1 X118.341 Y119.527 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38 I-1.215 J-.076 P1  F30000
G1 X117.602 Y131.378 Z38
G1 Z37.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2384
G1 X117.602 Y124.026 E.24387
G1 X117.602 Y123.991 E.00118
G1 X119.398 Y123.991 E.05957
G1 X119.398 Y124.026 E.00118
G1 X119.398 Y131.974 E.26362
G1 X119.398 Y132.009 E.00118
G1 X117.602 Y132.009 E.05957
G1 X117.602 Y131.974 E.00118
G1 X117.602 Y131.438 E.01776
G1 X117.21 Y131.378 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X117.21 Y123.644 E.23765
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X117.21 Y123.599 E.0015
G1 X119.79 Y123.599 E.08558
G1 X119.79 Y123.644 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X119.79 Y132.356 E.2677
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.79 Y132.401 E.0015
G1 X117.21 Y132.401 E.08558
G1 X117.21 Y132.356 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X117.21 Y131.987 E.01134
G1 X117.21 Y131.438 E.01686
M204 S10000
; WIPE_START
G1 F24000
G1 X117.21 Y129.438 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38 I1.132 J.447 P1  F30000
G1 X119.006 Y124.889 Z38
G1 Z37.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2384
G1 X119.006 Y124.383 E.01554
G1 X117.994 Y124.383 E.03109
G1 X117.994 Y131.617 E.22229
G1 X119.006 Y131.617 E.03109
G1 X119.006 Y124.949 E.20491
G1 X118.659 Y124.889 F30000
; LINE_WIDTH: 0.360223
G1 F2384
G1 X118.659 Y124.73 E.0041
G1 X118.341 Y124.73 E.0082
G1 X118.341 Y131.27 E.1691
G1 X118.659 Y131.27 E.0082
G1 X118.659 Y124.949 E.16345
; WIPE_START
G1 F24000
G1 X118.659 Y126.949 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38 I-1.211 J.118 P1  F30000
G1 X119.398 Y134.53 Z38
G1 Z37.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2384
G1 X119.398 Y137.398 E.09513
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y134.026 E.11184
G1 X117.602 Y133.991 E.00118
M73 P96 R1
G1 X119.398 Y133.991 E.05957
G1 X119.398 Y134.026 E.00118
G1 X119.398 Y134.47 E.01472
G1 X119.79 Y134.53 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X119.79 Y137.79 E.10017
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y133.644 E.1274
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X117.21 Y133.599 E.0015
G1 X119.79 Y133.599 E.08558
G1 X119.79 Y133.644 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X119.79 Y134.013 E.01134
G1 X119.79 Y134.47 E.01405
M204 S10000
G1 X119.006 Y134.383 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2384
G1 X117.994 Y134.383 E.03109
G1 X117.994 Y137.006 E.0806
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y134.443 E.07875
G1 X118.659 Y134.73 F30000
; LINE_WIDTH: 0.360223
G1 F2384
G1 X118.341 Y134.73 E.0082
G1 X118.341 Y136.659 E.04987
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y134.79 E.04832
; WIPE_START
G1 F24000
G1 X118.659 Y136.659 E-.71009
G1 X118.527 Y136.659 E-.04991
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38 I-.041 J1.216 P1  F30000
G1 X140.602 Y137.398 Z38
G1 Z37.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2384
G1 X140.602 Y134.026 E.11184
G1 X140.602 Y133.991 E.00118
G1 X142.398 Y133.991 E.05957
G1 X142.398 Y134.026 E.00118
G1 X142.398 Y137.398 E.11184
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X140.21 Y133.644 E.1274
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.21 Y133.599 E.0015
G1 X142.79 Y133.599 E.08558
G1 X142.79 Y133.644 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X142.79 Y134.013 E.01134
G1 X142.79 Y137.79 E.11606
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.241 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38 I1.073 J.574 P1  F30000
G1 X140.994 Y134.383 Z38
G1 Z37.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2384
G1 X140.994 Y137.006 E.0806
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y134.383 E.0806
G1 X141.054 Y134.383 E.02924
G1 X141.341 Y134.73 F30000
; LINE_WIDTH: 0.360223
G1 F2384
G1 X141.341 Y136.659 E.04987
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y134.73 E.04987
G1 X141.401 Y134.73 E.00665
; WIPE_START
G1 F24000
G1 X141.659 Y134.73 E-.09778
G1 X141.659 Y136.473 E-.66222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38 I1.192 J-.245 P1  F30000
G1 X140.602 Y131.334 Z38
G1 Z37.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2384
G1 X140.602 Y124.026 E.24241
G1 X140.602 Y123.991 E.00118
G1 X142.398 Y123.991 E.05957
G1 X142.398 Y124.026 E.00118
G1 X142.398 Y131.974 E.26362
G1 X142.398 Y132.009 E.00118
G1 X140.602 Y132.009 E.05957
G1 X140.602 Y131.974 E.00118
G1 X140.602 Y131.394 E.01922
G1 X140.21 Y131.334 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X140.21 Y123.644 E.2363
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.21 Y123.599 E.0015
G1 X142.79 Y123.599 E.08558
G1 X142.79 Y123.644 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X142.79 Y132.356 E.2677
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.79 Y132.401 E.0015
G1 X140.21 Y132.401 E.08558
G1 X140.21 Y132.356 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X140.21 Y131.987 E.01134
G1 X140.21 Y131.394 E.01822
M204 S10000
G1 X140.994 Y131.617 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2384
G1 X142.006 Y131.617 E.03109
G1 X142.006 Y124.383 E.22229
G1 X140.994 Y124.383 E.03109
G1 X140.994 Y131.557 E.22045
G1 X141.341 Y131.27 F30000
; LINE_WIDTH: 0.360223
G1 F2384
G1 X141.659 Y131.27 E.0082
G1 X141.659 Y124.73 E.1691
G1 X141.341 Y124.73 E.0082
G1 X141.341 Y131.21 E.16755
; WIPE_START
G1 F24000
G1 X141.341 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38 I1.212 J-.114 P1  F30000
G1 X140.602 Y121.373 Z38
G1 Z37.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2384
G1 X140.602 Y118.602 E.0919
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y121.974 E.11184
G1 X142.398 Y122.009 E.00118
G1 X140.602 Y122.009 E.05957
G1 X140.602 Y121.974 E.00118
G1 X140.602 Y121.433 E.01794
G1 X140.21 Y121.373 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X140.21 Y118.21 E.09718
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y122.356 E.1274
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.79 Y122.401 E.0015
G1 X140.21 Y122.401 E.08558
G1 X140.21 Y122.356 E.0015
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2384
G1 X140.21 Y121.987 E.01134
G1 X140.21 Y121.433 E.01704
M204 S10000
G1 X140.994 Y121.617 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2384
G1 X142.006 Y121.617 E.03109
G1 X142.006 Y118.994 E.0806
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y121.557 E.07875
G1 X141.341 Y121.27 F30000
; LINE_WIDTH: 0.360223
G1 F2384
G1 X141.659 Y121.27 E.0082
G1 X141.659 Y119.341 E.04987
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y121.21 E.04832
; CHANGE_LAYER
; Z_HEIGHT: 37.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.71009
G1 X141.473 Y119.341 E-.04991
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 189/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L189
M991 S0 P188 ;notify layer change
G17
G3 Z38 I-1.216 J-.059 P1  F30000
G1 X140.602 Y137.398 Z38
G1 Z37.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2361
G1 X140.602 Y133.189 E.13963
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X140.602 Y132.811 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2361
G1 X140.602 Y123.189 E.3192
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X140.602 Y122.811 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2361
G1 X140.602 Y118.602 E.13963
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y122.811 E.13963
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.398 Y123.189 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2361
G1 X142.398 Y132.811 E.3192
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.398 Y133.189 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2361
G1 X142.398 Y133.571 E.01269
G1 X142.398 Y137.398 E.12694
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2361
G1 X140.21 Y133.189 E.14139
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.21 Y132.811 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2361
G1 X140.21 Y123.189 E.29568
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.21 Y122.811 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2361
G1 X140.21 Y118.21 E.14139
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y122.811 E.14139
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.79 Y123.189 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2361
G1 X142.79 Y132.811 E.29568
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.79 Y133.189 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2361
G1 X142.79 Y133.558 E.01134
G1 X142.79 Y137.79 E.13005
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.244 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.2 I1.044 J.625 P1  F30000
G1 X140.994 Y134.537 Z38.2
G1 Z37.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2361
G1 X140.994 Y137.006 E.07585
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y134.537 E.07585
G1 X141.054 Y134.537 E.02924
G1 X141.341 Y134.884 F30000
; LINE_WIDTH: 0.360223
G1 F2361
G1 X141.341 Y136.659 E.04588
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y134.884 E.04588
G1 X141.401 Y134.884 E.00665
G1 X141.878 Y134.33 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.495415
M106 S255
G1 F3000
G1 X141.878 Y131.84 E.09181
G1 X141.426 Y131.84 E.01668
G1 X141.426 Y134.16 E.08555
G1 X140.973 Y134.16 E.01668
G1 X140.973 Y131.67 E.09181
M106 S252.45
G1 X140.994 Y131.463 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2361
G1 X142.006 Y131.463 E.03109
G1 X142.006 Y124.537 E.2128
G1 X140.994 Y124.537 E.03109
G1 X140.994 Y131.403 E.21096
G1 X141.341 Y131.116 F30000
; LINE_WIDTH: 0.360223
G1 F2361
G1 X141.659 Y131.116 E.0082
G1 X141.659 Y124.884 E.16112
G1 X141.341 Y124.884 E.0082
G1 X141.341 Y131.056 E.15956
G1 X141.878 Y124.33 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.495415
M106 S255
G1 F3000
G1 X141.878 Y121.84 E.09181
G1 X141.426 Y121.84 E.01668
G1 X141.426 Y124.16 E.08555
G1 X140.973 Y124.16 E.01668
G1 X140.973 Y121.67 E.09181
M106 S252.45
G1 X140.994 Y121.463 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2361
G1 X142.006 Y121.463 E.03109
G1 X142.006 Y118.994 E.07585
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y121.403 E.07401
G1 X141.341 Y121.116 F30000
; LINE_WIDTH: 0.360223
G1 F2361
G1 X141.659 Y121.116 E.0082
G1 X141.659 Y119.341 E.04588
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y121.056 E.04432
; WIPE_START
G1 F24000
G1 X141.341 Y119.341 E-.65142
G1 X141.627 Y119.341 E-.10858
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.2 I-.687 J-1.005 P1  F30000
G1 X119.398 Y134.541 Z38.2
G1 Z37.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2361
G1 X119.398 Y137.398 E.09478
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y133.189 E.13963
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X117.602 Y132.811 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2361
G1 X117.602 Y123.189 E.3192
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X117.602 Y122.811 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2361
G1 X117.602 Y118.602 E.13963
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y122.811 E.13963
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X119.398 Y123.189 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2361
G1 X119.398 Y132.811 E.3192
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X119.398 Y133.189 E.01252
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2361
G1 X119.398 Y133.571 E.01269
G1 X119.398 Y134.481 E.03017
G1 X119.79 Y134.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2361
G1 X119.79 Y137.79 E.09984
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y133.189 E.14139
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X117.21 Y132.811 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2361
G1 X117.21 Y123.189 E.29568
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X117.21 Y122.811 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2361
G1 X117.21 Y118.21 E.14139
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y122.811 E.14139
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.79 Y123.189 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2361
G1 X119.79 Y132.811 E.29568
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.79 Y133.189 E.01252
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2361
G1 X119.79 Y133.558 E.01134
G1 X119.79 Y134.481 E.02837
M204 S10000
G1 X119.006 Y134.537 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2361
G1 X117.994 Y134.537 E.03109
G1 X117.994 Y137.006 E.07585
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y134.597 E.07401
G1 X118.659 Y134.884 F30000
; LINE_WIDTH: 0.360223
G1 F2361
G1 X118.341 Y134.884 E.0082
G1 X118.341 Y136.659 E.04588
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y134.944 E.04432
G1 X118.878 Y134.33 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.495415
M106 S255
G1 F3000
G1 X118.878 Y131.84 E.09181
G1 X118.426 Y131.84 E.01668
G1 X118.426 Y134.16 E.08555
G1 X117.973 Y134.16 E.01668
G1 X117.973 Y131.67 E.09181
M106 S252.45
G1 X119.006 Y125.043 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2361
G1 X119.006 Y124.537 E.01554
G1 X117.994 Y124.537 E.03109
G1 X117.994 Y131.463 E.2128
G1 X119.006 Y131.463 E.03109
G1 X119.006 Y125.103 E.19542
G1 X118.659 Y125.043 F30000
; LINE_WIDTH: 0.360223
G1 F2361
G1 X118.659 Y124.884 E.0041
G1 X118.341 Y124.884 E.0082
G1 X118.341 Y131.116 E.16112
G1 X118.659 Y131.116 E.0082
G1 X118.659 Y125.103 E.15546
G1 X118.878 Y124.33 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.495415
M106 S255
G1 F3000
G1 X118.878 Y121.84 E.09181
G1 X118.426 Y121.84 E.01668
G1 X118.426 Y124.16 E.08555
G1 X117.973 Y124.16 E.01668
G1 X117.973 Y121.67 E.09181
M106 S252.45
G1 X119.006 Y121.463 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2361
G1 X119.006 Y118.994 E.07585
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y121.463 E.07585
G1 X118.946 Y121.463 E.02924
G1 X118.659 Y121.116 F30000
; LINE_WIDTH: 0.360223
G1 F2361
G1 X118.659 Y119.341 E.04588
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y121.116 E.04588
G1 X118.599 Y121.116 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 38
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.341 Y121.116 E-.09778
G1 X118.341 Y119.373 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 190/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L190
M991 S0 P189 ;notify layer change
G17
G3 Z38.2 I-.766 J.946 P1  F30000
G1 X140.602 Y137.398 Z38.2
G1 Z38
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1831
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1831
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.4 I1.201 J.196 P1  F30000
G1 X140.994 Y131.325 Z38.4
G1 Z38
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1831
G1 X140.994 Y134.675 E.10293
G1 X142.006 Y134.675 E.03109
G1 X142.006 Y131.325 E.10293
G1 X141.054 Y131.325 E.02924
G1 X141.341 Y131.672 F30000
; LINE_WIDTH: 0.360223
G1 F1831
G1 X141.341 Y134.328 E.06866
G1 X141.659 Y134.328 E.0082
G1 X141.659 Y131.672 E.06866
G1 X141.401 Y131.672 E.00665
G1 X140.994 Y124.675 F30000
; LINE_WIDTH: 0.419999
G1 F1831
G1 X142.006 Y124.675 E.03109
G1 X142.006 Y121.325 E.10293
G1 X140.994 Y121.325 E.03109
G1 X140.994 Y124.615 E.10108
G1 X141.341 Y124.328 F30000
; LINE_WIDTH: 0.360223
G1 F1831
G1 X141.659 Y124.328 E.0082
G1 X141.659 Y121.672 E.06866
G1 X141.341 Y121.672 E.0082
G1 X141.341 Y124.268 E.0671
; WIPE_START
G1 F24000
G1 X141.341 Y122.268 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.4 I-.691 J-1.002 P1  F30000
G1 X119.398 Y137.398 Z38.4
G1 Z38
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1831
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1831
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.4 I1.196 J.225 P1  F30000
G1 X119.006 Y131.325 Z38.4
G1 Z38
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1831
G1 X117.994 Y131.325 E.03109
G1 X117.994 Y134.675 E.10293
G1 X119.006 Y134.675 E.03109
G1 X119.006 Y131.385 E.10108
G1 X118.659 Y131.672 F30000
; LINE_WIDTH: 0.360223
G1 F1831
G1 X118.341 Y131.672 E.0082
G1 X118.341 Y134.328 E.06866
G1 X118.659 Y134.328 E.0082
G1 X118.659 Y131.732 E.0671
G1 X119.006 Y124.675 F30000
; LINE_WIDTH: 0.419999
G1 F1831
G1 X119.006 Y121.325 E.10293
G1 X117.994 Y121.325 E.03109
G1 X117.994 Y124.675 E.10293
G1 X118.946 Y124.675 E.02924
G1 X118.659 Y124.328 F30000
; LINE_WIDTH: 0.360223
G1 F1831
G1 X118.659 Y121.672 E.06866
G1 X118.341 Y121.672 E.0082
G1 X118.341 Y124.328 E.06866
G1 X118.599 Y124.328 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 38.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.341 Y124.328 E-.09778
G1 X118.341 Y122.585 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 191/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L191
M991 S0 P190 ;notify layer change
G17
G3 Z38.4 I-.674 J1.013 P1  F30000
G1 X140.602 Y137.398 Z38.4
G1 Z38.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1830
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1830
G1 X140.21 Y118.21 E.60164
M73 P97 R1
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.6 I1.201 J.196 P1  F30000
G1 X140.994 Y131.325 Z38.6
G1 Z38.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1830
G1 X140.994 Y134.675 E.10293
G1 X142.006 Y134.675 E.03109
G1 X142.006 Y131.325 E.10293
G1 X141.054 Y131.325 E.02924
G1 X141.341 Y131.672 F30000
; LINE_WIDTH: 0.360223
G1 F1830
G1 X141.341 Y134.328 E.06866
G1 X141.659 Y134.328 E.0082
G1 X141.659 Y131.672 E.06866
G1 X141.401 Y131.672 E.00665
G1 X140.994 Y124.675 F30000
; LINE_WIDTH: 0.419999
G1 F1830
G1 X142.006 Y124.675 E.03109
G1 X142.006 Y121.325 E.10293
G1 X140.994 Y121.325 E.03109
G1 X140.994 Y124.615 E.10108
G1 X141.341 Y124.328 F30000
; LINE_WIDTH: 0.360223
G1 F1830
G1 X141.659 Y124.328 E.0082
G1 X141.659 Y121.672 E.06866
G1 X141.341 Y121.672 E.0082
G1 X141.341 Y124.268 E.0671
; WIPE_START
G1 F24000
G1 X141.341 Y122.268 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.6 I-.691 J-1.002 P1  F30000
G1 X119.398 Y137.398 Z38.6
G1 Z38.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1830
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1830
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P97 R0
G3 Z38.6 I1.196 J.225 P1  F30000
G1 X119.006 Y131.325 Z38.6
G1 Z38.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1830
G1 X117.994 Y131.325 E.03109
G1 X117.994 Y134.675 E.10293
G1 X119.006 Y134.675 E.03109
G1 X119.006 Y131.385 E.10108
G1 X118.659 Y131.672 F30000
; LINE_WIDTH: 0.360223
G1 F1830
G1 X118.341 Y131.672 E.0082
G1 X118.341 Y134.328 E.06866
G1 X118.659 Y134.328 E.0082
G1 X118.659 Y131.732 E.0671
G1 X119.006 Y124.675 F30000
; LINE_WIDTH: 0.419999
G1 F1830
G1 X119.006 Y121.325 E.10293
G1 X117.994 Y121.325 E.03109
G1 X117.994 Y124.675 E.10293
G1 X118.946 Y124.675 E.02924
G1 X118.659 Y124.328 F30000
; LINE_WIDTH: 0.360223
G1 F1830
G1 X118.659 Y121.672 E.06866
G1 X118.341 Y121.672 E.0082
G1 X118.341 Y124.328 E.06866
G1 X118.599 Y124.328 E.00665
; CHANGE_LAYER
; Z_HEIGHT: 38.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.341 Y124.328 E-.09778
G1 X118.341 Y122.585 E-.66222
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 192/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L192
M991 S0 P191 ;notify layer change
G17
G3 Z38.6 I-.674 J1.013 P1  F30000
G1 X140.602 Y137.398 Z38.6
G1 Z38.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1646
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.8 I1.134 J.442 P1  F30000
G1 X140.95 Y134.03 Z38.8
G1 Z38.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X140.95 Y132.402 E.05401
G1 X142.05 Y131.302 E.05157
G1 X142.05 Y132.374 E.03554
G1 X140.95 Y131.274 E.05157
G1 X140.95 Y124.726 E.21723
G1 X142.05 Y123.626 E.05157
G1 X142.05 Y124.698 E.03554
G1 X140.95 Y123.598 E.05157
G1 X140.95 Y121.97 E.05401
; WIPE_START
G1 F24000
G1 X140.95 Y123.598 E-.61876
G1 X141.213 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.8 I-.642 J-1.034 P1  F30000
G1 X119.398 Y137.398 Z38.8
G1 Z38.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1646
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.8 I1.154 J.388 P1  F30000
G1 X119.05 Y134.03 Z38.8
G1 Z38.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X119.05 Y132.402 E.05401
G1 X117.95 Y131.302 E.05157
G1 X117.95 Y132.374 E.03554
G1 X119.05 Y131.274 E.05157
G1 X119.05 Y124.726 E.21723
G1 X117.95 Y123.626 E.05157
G1 X117.95 Y124.698 E.03554
G1 X119.05 Y123.598 E.05157
G1 X119.05 Y121.97 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 38.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X119.05 Y123.598 E-.61876
G1 X118.787 Y123.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 193/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L193
M991 S0 P192 ;notify layer change
G17
G3 Z38.8 I-.642 J1.034 P1  F30000
G1 X140.602 Y137.398 Z38.8
G1 Z38.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2520
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2520
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39 I-1.043 J.627 P1  F30000
G1 X140.994 Y137.006 Z39
G1 Z38.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2520
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y118.994 E.55345
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y136.946 E.5516
G1 X141.341 Y136.659 F30000
; LINE_WIDTH: 0.360223
G1 F2520
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y119.341 E.44776
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y136.599 E.44621
; WIPE_START
G1 F24000
G1 X141.341 Y134.599 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39 I-.154 J-1.207 P1  F30000
G1 X119.398 Y137.398 Z39
G1 Z38.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2520
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2520
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39 I1.214 J.081 P1  F30000
G1 X119.006 Y119.5 Z39
G1 Z38.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2520
G1 X119.006 Y118.994 E.01554
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y137.006 E.55345
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y119.56 E.53606
M73 P98 R0
G1 X118.659 Y119.5 F30000
; LINE_WIDTH: 0.360223
G1 F2520
G1 X118.659 Y119.341 E.0041
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y136.659 E.44776
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y119.56 E.44211
; CHANGE_LAYER
; Z_HEIGHT: 38.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.659 Y121.56 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 194/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L194
M991 S0 P193 ;notify layer change
G17
G3 Z39 I-.712 J.987 P1  F30000
G1 X140.602 Y137.398 Z39
G1 Z38.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2522
G1 X140.602 Y118.602 E.62349
G1 X142.398 Y118.602 E.05957
G1 X142.398 Y137.398 E.62349
G1 X140.662 Y137.398 E.05758
G1 X140.21 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2522
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.2 I-1.043 J.627 P1  F30000
G1 X140.994 Y137.006 Z39.2
G1 Z38.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2522
G1 X142.006 Y137.006 E.03109
G1 X142.006 Y118.994 E.55345
G1 X140.994 Y118.994 E.03109
G1 X140.994 Y136.946 E.5516
G1 X141.341 Y136.659 F30000
; LINE_WIDTH: 0.360223
G1 F2522
G1 X141.659 Y136.659 E.0082
G1 X141.659 Y119.341 E.44776
G1 X141.341 Y119.341 E.0082
G1 X141.341 Y136.599 E.44621
; WIPE_START
G1 F24000
G1 X141.341 Y134.599 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.2 I-.154 J-1.207 P1  F30000
G1 X119.398 Y137.398 Z39.2
G1 Z38.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2522
G1 X117.602 Y137.398 E.05957
G1 X117.602 Y118.602 E.62349
G1 X119.398 Y118.602 E.05957
G1 X119.398 Y137.338 E.6215
G1 X119.79 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2522
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.2 I1.214 J.079 P1  F30000
G1 X119.006 Y118.994 Z39.2
G1 Z38.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2522
G1 X117.994 Y118.994 E.03109
G1 X117.994 Y137.006 E.55345
G1 X119.006 Y137.006 E.03109
G1 X119.006 Y119.054 E.5516
G1 X118.659 Y119.341 F30000
; LINE_WIDTH: 0.360223
G1 F2522
G1 X118.341 Y119.341 E.0082
G1 X118.341 Y136.659 E.44776
G1 X118.659 Y136.659 E.0082
G1 X118.659 Y119.401 E.44621
; CHANGE_LAYER
; Z_HEIGHT: 39
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.659 Y121.401 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 195/195
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L195
M991 S0 P194 ;notify layer change
G17
G3 Z39.2 I-.737 J.969 P1  F30000
G1 X140.21 Y137.79 Z39.2
G1 Z39
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2872
G1 X140.21 Y118.21 E.60164
G1 X142.79 Y118.21 E.07928
G1 X142.79 Y137.79 E.60164
G1 X140.27 Y137.79 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X140.264 Y135.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.4 I1.211 J.122 P1  F30000
G1 X142.015 Y118.417 Z39.4
G1 Z39
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F2872
G1 X142.583 Y118.985 E.02468
G1 X142.583 Y119.519
G1 X141.481 Y118.417 E.04785
G1 X140.948 Y118.417
G1 X142.583 Y120.052 E.07102
G1 X142.583 Y120.585
G1 X140.417 Y118.42 E.09409
G1 X140.417 Y118.953
G1 X142.583 Y121.118 E.09409
G1 X142.583 Y121.652
G1 X140.417 Y119.486 E.09409
G1 X140.417 Y120.02
G1 X142.583 Y122.185 E.09409
G1 X142.583 Y122.718
G1 X140.417 Y120.553 E.09409
G1 X140.417 Y121.086
G1 X142.583 Y123.251 E.09409
G1 X142.583 Y123.785
G1 X140.417 Y121.619 E.09409
G1 X140.417 Y122.153
G1 X142.583 Y124.318 E.09409
G1 X142.583 Y124.851
G1 X140.417 Y122.686 E.09409
G1 X140.417 Y123.219
G1 X142.583 Y125.384 E.09409
G1 X142.583 Y125.918
G1 X140.417 Y123.753 E.09409
G1 X140.417 Y124.286
G1 X142.583 Y126.451 E.09409
G1 X142.583 Y126.984
G1 X140.417 Y124.819 E.09409
G1 X140.417 Y125.352
G1 X142.583 Y127.518 E.09409
G1 X142.583 Y128.051
G1 X140.417 Y125.886 E.09409
G1 X140.417 Y126.419
G1 X142.583 Y128.584 E.09409
G1 X142.583 Y129.117
G1 X140.417 Y126.952 E.09409
G1 X140.417 Y127.485
G1 X142.583 Y129.651 E.09409
G1 X142.583 Y130.184
G1 X140.417 Y128.019 E.09409
G1 X140.417 Y128.552
G1 X142.583 Y130.717 E.09409
G1 X142.583 Y131.25
G1 X140.417 Y129.085 E.09409
G1 X140.417 Y129.619
G1 X142.583 Y131.784 E.09409
G1 X142.583 Y132.317
G1 X140.417 Y130.152 E.09409
G1 X140.417 Y130.685
G1 X142.583 Y132.85 E.09409
G1 X142.583 Y133.384
G1 X140.417 Y131.218 E.09409
G1 X140.417 Y131.752
G1 X142.583 Y133.917 E.09409
G1 X142.583 Y134.45
G1 X140.417 Y132.285 E.09409
G1 X140.417 Y132.818
G1 X142.583 Y134.983 E.09409
G1 X142.583 Y135.517
G1 X140.417 Y133.351 E.09409
G1 X140.417 Y133.885
G1 X142.583 Y136.05 E.09409
G1 X142.583 Y136.583
G1 X140.417 Y134.418 E.09409
G1 X140.417 Y134.951
G1 X142.583 Y137.116 E.09409
G1 X142.516 Y137.583
G1 X140.417 Y135.484 E.09117
G1 X140.417 Y136.018
G1 X141.982 Y137.583 E.068
G1 X141.449 Y137.583
G1 X140.417 Y136.551 E.04483
G1 X140.417 Y137.084
G1 X140.916 Y137.583 E.02165
M204 S10000
; WIPE_START
G1 F24000
G1 X140.417 Y137.084 E-.2678
G1 X140.417 Y136.551 E-.20264
G1 X140.956 Y137.09 E-.28956
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.4 I-.04 J-1.216 P1  F30000
G1 X119.79 Y137.79 Z39.4
G1 Z39
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F2872
G1 X117.21 Y137.79 E.07928
G1 X117.21 Y118.21 E.60164
G1 X119.79 Y118.21 E.07928
G1 X119.79 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X117.791 Y137.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.4 I1.214 J.081 P1  F30000
G1 X119.084 Y118.417 Z39.4
G1 Z39
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F2872
G1 X119.583 Y118.916 E.02166
G1 X119.583 Y119.449
G1 X118.551 Y118.417 E.04483
M73 P99 R0
G1 X118.018 Y118.417
G1 X119.583 Y119.982 E.06801
G1 X119.583 Y120.516
G1 X117.484 Y118.417 E.09118
G1 X117.417 Y118.884
G1 X119.583 Y121.049 E.09409
G1 X119.583 Y121.582
G1 X117.417 Y119.417 E.09409
G1 X117.417 Y119.95
G1 X119.583 Y122.115 E.09409
G1 X119.583 Y122.649
G1 X117.417 Y120.484 E.09409
G1 X117.417 Y121.017
G1 X119.583 Y123.182 E.09409
G1 X119.583 Y123.715
G1 X117.417 Y121.55 E.09409
G1 X117.417 Y122.083
G1 X119.583 Y124.249 E.09409
G1 X119.583 Y124.782
G1 X117.417 Y122.617 E.09409
G1 X117.417 Y123.15
G1 X119.583 Y125.315 E.09409
G1 X119.583 Y125.848
G1 X117.417 Y123.683 E.09409
G1 X117.417 Y124.216
G1 X119.583 Y126.382 E.09409
G1 X119.583 Y126.915
G1 X117.417 Y124.75 E.09409
G1 X117.417 Y125.283
G1 X119.583 Y127.448 E.09409
G1 X119.583 Y127.981
G1 X117.417 Y125.816 E.09409
G1 X117.417 Y126.35
G1 X119.583 Y128.515 E.09409
G1 X119.583 Y129.048
G1 X117.417 Y126.883 E.09409
G1 X117.417 Y127.416
G1 X119.583 Y129.581 E.09409
G1 X119.583 Y130.115
G1 X117.417 Y127.949 E.09409
G1 X117.417 Y128.483
G1 X119.583 Y130.648 E.09409
G1 X119.583 Y131.181
G1 X117.417 Y129.016 E.09409
G1 X117.417 Y129.549
G1 X119.583 Y131.714 E.09409
G1 X119.583 Y132.248
G1 X117.417 Y130.082 E.09409
G1 X117.417 Y130.616
G1 X119.583 Y132.781 E.09409
G1 X119.583 Y133.314
G1 X117.417 Y131.149 E.09409
G1 X117.417 Y131.682
G1 X119.583 Y133.847 E.09409
G1 X119.583 Y134.381
G1 X117.417 Y132.215 E.09409
G1 X117.417 Y132.749
G1 X119.583 Y134.914 E.09409
G1 X119.583 Y135.447
G1 X117.417 Y133.282 E.09409
G1 X117.417 Y133.815
G1 X119.583 Y135.981 E.09409
G1 X119.583 Y136.514
G1 X117.417 Y134.349 E.09409
G1 X117.417 Y134.882
G1 X119.583 Y137.047 E.09409
G1 X119.583 Y137.58
G1 X117.417 Y135.415 E.09409
G1 X117.417 Y135.948
G1 X119.052 Y137.583 E.07102
G1 X118.518 Y137.583
G1 X117.417 Y136.482 E.04784
G1 X117.417 Y137.015
G1 X117.985 Y137.583 E.02467
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X117.417 Y137.015 E-.30508
G1 X117.417 Y136.482 E-.20264
G1 X117.887 Y136.951 E-.25227
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
G1 Z39.5 F900 ; lower z a little
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

    G1 Z139 F600
    G1 Z137

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

