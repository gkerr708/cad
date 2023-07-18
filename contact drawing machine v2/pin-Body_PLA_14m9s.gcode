; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 8m 20s; total estimated time: 14m 9s
; total layer number: 650
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
M73 P0 R14
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
M73 P30 R9
G1 Y245
M73 P31 R9
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
M73 P33 R9
G1 X76 F15000
M73 P35 R9
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
M73 P36 R9
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
    G29 A X126.181 Y126.776 I6.44574 J6.45114
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
M73 P36 R8
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
M73 P37 R8
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
; layer num/total_layer_count: 1/650
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
G1 X127.38 Y125.784 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F1200
G1 X127.646 Y125.567 E.0128
G1 X127.896 Y125.405 E.0111
G1 X128.162 Y125.268 E.01114
G1 X128.44 Y125.158 E.01114
G1 X128.728 Y125.077 E.01113
G1 X129.018 Y125.025 E.01098
G1 X129.539 Y125.005 E.0194
M73 P38 R8
G1 X129.832 Y125.033 E.01098
G1 X130.126 Y125.091 E.01114
G1 X130.412 Y125.177 E.01113
G1 X130.688 Y125.292 E.01113
G1 X130.951 Y125.434 E.01113
G1 X131.199 Y125.601 E.01114
G1 X131.429 Y125.792 E.01113
G1 X131.638 Y126.005 E.01113
G1 X131.826 Y126.238 E.01113
G1 X131.989 Y126.488 E.01113
M73 P39 R8
G1 X132.127 Y126.753 E.01114
G1 X132.238 Y127.031 E.01113
G1 X132.32 Y127.318 E.01113
G1 X132.373 Y127.609 E.011
G1 X132.397 Y128.101 E.01835
G1 X132.366 Y128.443 E.0128
G1 X132.308 Y128.736 E.01111
G1 X132.22 Y129.021 E.01114
G1 X132.104 Y129.297 E.01114
G1 X131.962 Y129.56 E.01114
G1 X131.794 Y129.807 E.01114
G1 X131.602 Y130.036 E.01113
G1 X131.388 Y130.246 E.01114
G1 X131.155 Y130.433 E.01114
G1 X130.904 Y130.595 E.01113
G1 X130.638 Y130.732 E.01113
M73 P40 R8
G1 X130.36 Y130.842 E.01115
G1 X130.072 Y130.923 E.01113
G1 X129.778 Y130.976 E.01114
G1 X129.48 Y130.998 E.01113
G1 X129.181 Y130.991 E.01114
G1 X128.884 Y130.955 E.01114
G1 X128.592 Y130.889 E.01114
G1 X128.309 Y130.794 E.01113
G1 X128.036 Y130.671 E.01114
G1 X127.777 Y130.522 E.01113
G1 X127.534 Y130.348 E.01114
G1 X127.309 Y130.15 E.01114
G1 X127.105 Y129.932 E.01113
G1 X126.925 Y129.694 E.01114
G1 X126.768 Y129.439 E.01114
M73 P41 R8
G1 X126.638 Y129.169 E.01114
G1 X126.535 Y128.888 E.01114
G1 X126.461 Y128.599 E.01113
G1 X126.417 Y128.308 E.01098
G1 X126.409 Y127.787 E.0194
G1 X126.445 Y127.494 E.01099
G1 X126.51 Y127.202 E.01113
G1 X126.603 Y126.918 E.01113
G1 X126.725 Y126.645 E.01113
G1 X126.873 Y126.385 E.01114
G1 X127.045 Y126.145 E.011
G1 X127.339 Y125.828 E.01611
G1 X127.674 Y126.141 F30000
G1 F1200
G1 X127.7 Y126.112 E.00145
G1 X127.927 Y125.929 E.01086
G1 X128.364 Y125.68 E.01871
G1 X128.837 Y125.522 E.0186
G1 X129.077 Y125.48 E.00906
G1 X129.535 Y125.464 E.01708
G1 X129.78 Y125.488 E.00916
G1 X130.27 Y125.614 E.01884
G1 X130.725 Y125.833 E.01884
G1 X131.129 Y126.139 E.01884
G1 X131.463 Y126.518 E.01883
G1 X131.716 Y126.956 E.01884
G1 X131.876 Y127.429 E.01859
G1 X131.918 Y127.67 E.00912
G1 X131.939 Y128.082 E.01537
G1 X131.91 Y128.392 E.01157
G1 X131.784 Y128.878 E.01872
G1 X131.563 Y129.333 E.01885
G1 X131.256 Y129.735 E.01884
G1 X130.875 Y130.069 E.01886
G1 X130.436 Y130.32 E.01884
G1 X129.956 Y130.479 E.01885
G1 X129.454 Y130.54 E.01885
G1 X128.949 Y130.501 E.01885
G1 X128.463 Y130.362 E.01884
G1 X128.013 Y130.129 E.01885
G1 X127.619 Y129.812 E.01885
G1 X127.295 Y129.423 E.01884
G1 X127.055 Y128.978 E.01885
G1 X126.908 Y128.501 E.01859
G1 X126.873 Y128.26 E.00905
G1 X126.867 Y127.82 E.0164
G1 X126.899 Y127.558 E.00984
G1 X127.036 Y127.071 E.01884
G1 X127.263 Y126.626 E.01859
G1 X127.406 Y126.427 E.00912
G1 X127.633 Y126.184 E.01238
G1 X127.936 Y126.527 F30000
G1 F1200
G1 X128.172 Y126.319 E.01174
G1 X128.527 Y126.11 E.01533
G1 X128.869 Y125.987 E.01352
G1 X129.259 Y125.923 E.01471
G1 X129.671 Y125.936 E.01536
G1 X130.074 Y126.03 E.01543
G1 X130.451 Y126.203 E.01544
G1 X130.786 Y126.447 E.01544
G1 X131.066 Y126.752 E.01544
G1 X131.281 Y127.107 E.01544
G1 X131.42 Y127.498 E.01544
G1 X131.48 Y127.908 E.01546
G1 X131.461 Y128.295 E.01443
G1 X131.363 Y128.694 E.0153
G1 X131.186 Y129.069 E.01544
G1 X130.938 Y129.403 E.01547
G1 X130.672 Y129.649 E.01351
G1 X130.326 Y129.864 E.01517
G1 X129.938 Y130.011 E.01546
G1 X129.541 Y130.077 E.01498
G1 X129.129 Y130.064 E.01535
G1 X128.726 Y129.97 E.01543
G1 X128.349 Y129.797 E.01544
G1 X128.014 Y129.553 E.01544
G1 X127.734 Y129.248 E.01544
G1 X127.519 Y128.893 E.01544
G1 X127.38 Y128.502 E.01544
G1 X127.32 Y128.092 E.01544
G1 X127.343 Y127.678 E.01544
G1 X127.448 Y127.277 E.01544
G1 X127.63 Y126.905 E.01544
G1 X127.882 Y126.575 E.01546
G1 X127.891 Y126.567 E.00045
G1 X128.243 Y126.855 F30000
G1 F1200
G1 X128.473 Y126.662 E.01118
G1 X128.757 Y126.505 E.01207
G1 X129.021 Y126.417 E.01038
G1 X129.332 Y126.374 E.01167
G1 X129.654 Y126.393 E.01204
G1 X129.968 Y126.475 E.01207
G1 X130.259 Y126.618 E.01207
G1 X130.516 Y126.815 E.01207
G1 X130.728 Y127.06 E.01207
G1 X130.888 Y127.341 E.01207
G1 X130.989 Y127.649 E.01207
G1 X131.027 Y127.971 E.01207
G1 X131.005 Y128.271 E.01119
G1 X130.919 Y128.583 E.01207
G1 X130.774 Y128.873 E.01207
G1 X130.573 Y129.128 E.01207
G1 X130.364 Y129.311 E.01038
G1 X130.085 Y129.476 E.01207
G1 X129.779 Y129.583 E.01207
G1 X129.468 Y129.626 E.01167
G1 X129.146 Y129.607 E.01204
G1 X128.832 Y129.525 E.01207
G1 X128.541 Y129.382 E.01207
G1 X128.284 Y129.185 E.01207
G1 X128.072 Y128.94 E.01207
G1 X127.912 Y128.658 E.01207
G1 X127.811 Y128.35 E.01207
G1 X127.773 Y128.029 E.01207
G1 X127.799 Y127.706 E.01207
G1 X127.889 Y127.394 E.01207
G1 X128.039 Y127.107 E.01207
G1 X128.206 Y126.902 E.00983
; WIPE_START
G1 F24000
G1 X128.473 Y126.662 E-.1365
G1 X128.757 Y126.505 E-.12315
G1 X129.021 Y126.417 E-.10593
G1 X129.332 Y126.374 E-.11911
G1 X129.654 Y126.393 E-.12282
G1 X129.968 Y126.475 E-.12316
G1 X130.037 Y126.509 E-.02933
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.209 J-.138 P1  F30000
G1 X129.82 Y128.406 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X129.791 Y128.443 E.00174
G3 X129.385 Y127.408 I-.391 J-.444 E.08461
G1 X129.444 Y127.41 E.0022
G3 X129.933 Y128.257 I-.044 J.59 E.04287
G1 X129.856 Y128.359 E.00475
G1 X130.191 Y128.683 F30000
; FEATURE: Outer wall
G1 F1200
G1 X130.094 Y128.786 E.00527
G3 X129.374 Y126.951 I-.694 J-.787 E.15001
G1 X129.478 Y126.953 E.00389
G3 X130.236 Y128.633 I-.078 J1.046 E.0838
G1 X130.231 Y128.639 E.00027
M106 S255
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.094 Y128.786 E-.07659
G1 X129.925 Y128.909 E-.07938
G1 X129.734 Y128.995 E-.07944
G1 X129.531 Y129.042 E-.07943
G1 X129.322 Y129.047 E-.07943
G1 X129.116 Y129.01 E-.07945
G1 X128.921 Y128.934 E-.07942
G1 X128.746 Y128.821 E-.07943
G1 X128.596 Y128.675 E-.07943
G1 X128.53 Y128.567 E-.048
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/650
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
G3 Z.6 I.106 J1.212 P1  F30000
G1 X129.934 Y128.445 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.861 Y128.522 E.00353
G3 X129.383 Y127.303 I-.461 J-.522 E.08874
G1 X129.452 Y127.305 E.0023
G3 X129.972 Y128.398 I-.052 J.695 E.04865
G1 X130.22 Y128.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.12 Y128.816 E.00447
G3 X129.373 Y126.911 I-.72 J-.817 E.12849
G1 X129.481 Y126.913 E.00333
G3 X130.268 Y128.657 I-.081 J1.086 E.07177
G1 X130.26 Y128.666 E.00035
M204 S10000
G1 X129.633 Y127.958 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519049
G1 F1200
G1 X129.592 Y127.84 E.00489
G1 X129.418 Y127.751 E.00756
G1 X129.244 Y127.822 E.00731
G1 X129.161 Y127.926 E.00516
G1 X129.181 Y128.119 E.00753
G1 X129.332 Y128.24 E.00752
G1 X129.525 Y128.216 E.00753
G1 X129.637 Y128.071 E.00712
G1 X129.636 Y128.018 E.00206
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.637 Y128.071 E-.02757
G1 X129.525 Y128.216 E-.09545
G1 X129.332 Y128.24 E-.10099
G1 X129.181 Y128.119 E-.10091
G1 X129.161 Y127.926 E-.10096
G1 X129.244 Y127.822 E-.06923
G1 X129.418 Y127.751 E-.09799
G1 X129.592 Y127.84 E-.10136
G1 X129.633 Y127.958 E-.06554
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/650
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
G3 Z.8 I-1.033 J.643 P1  F30000
G1 X129.935 Y128.443 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.861 Y128.522 E.0036
G3 X129.383 Y127.303 I-.461 J-.522 E.08875
G1 X129.452 Y127.305 E.0023
G3 X129.973 Y128.396 I-.052 J.695 E.04858
G1 X130.222 Y128.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.12 Y128.816 E.00453
G3 X129.373 Y126.911 I-.721 J-.817 E.12849
G1 X129.481 Y126.913 E.00333
G3 X130.268 Y128.657 I-.081 J1.086 E.07177
G1 X130.262 Y128.664 E.00028
M204 S10000
G1 X129.635 Y127.965 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519301
G1 F1200
G1 X129.591 Y127.839 E.00517
G1 X129.418 Y127.751 E.00752
G1 X129.235 Y127.813 E.00752
G1 X129.151 Y127.988 E.00753
G1 X129.209 Y128.157 E.00697
G1 X129.391 Y128.245 E.00785
G1 X129.525 Y128.216 E.0053
G1 X129.638 Y128.07 E.00716
G1 X129.636 Y128.025 E.00176
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.638 Y128.07 E-.02357
G1 X129.525 Y128.216 E-.09583
G1 X129.391 Y128.245 E-.07088
G1 X129.209 Y128.157 E-.10511
G1 X129.151 Y127.988 E-.0933
G1 X129.235 Y127.813 E-.10077
G1 X129.418 Y127.751 E-.10068
G1 X129.591 Y127.839 E-.10063
G1 X129.635 Y127.965 E-.06921
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/650
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
G3 Z1 I-1.07 J.581 P1  F30000
G1 X129.911 Y128.473 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.511 J-.474 E.09105
G1 X129.452 Y127.305 E.00229
G3 X129.95 Y128.428 I-.052 J.695 E.04988
G1 X130.217 Y128.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.198 Y128.74 E.00089
G3 X129.373 Y126.911 I-.798 J-.741 E.13183
G1 X129.481 Y126.913 E.00333
G3 X130.329 Y128.567 I-.081 J1.086 E.06843
G1 X130.253 Y128.67 E.00392
M204 S10000
G1 X129.633 Y127.958 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519661
G1 F1200
G1 X129.591 Y127.84 E.00488
G1 X129.418 Y127.751 E.00754
G1 X129.235 Y127.813 E.00752
G1 X129.151 Y127.988 E.00753
G1 X129.217 Y128.17 E.00755
G1 X129.393 Y128.236 E.0073
G1 X129.525 Y128.216 E.00517
G1 X129.637 Y128.071 E.00712
G1 X129.635 Y128.018 E.00207
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.637 Y128.071 E-.02772
G1 X129.525 Y128.216 E-.09547
G1 X129.393 Y128.236 E-.06928
G1 X129.217 Y128.17 E-.09791
G1 X129.151 Y127.988 E-.10121
G1 X129.235 Y127.813 E-.10096
G1 X129.418 Y127.751 E-.10086
G1 X129.591 Y127.84 E-.10108
G1 X129.633 Y127.958 E-.0655
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/650
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
G3 Z1.2 I-1.071 J.577 P1  F30000
G1 X129.911 Y128.473 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.511 J-.474 E.09106
G1 X129.452 Y127.305 E.00229
G3 X129.95 Y128.428 I-.052 J.695 E.04988
G1 X130.217 Y128.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.198 Y128.74 E.00088
G3 X129.373 Y126.911 I-.798 J-.741 E.13183
G1 X129.481 Y126.913 E.00332
G3 X130.329 Y128.567 I-.081 J1.086 E.06843
G1 X130.252 Y128.67 E.00393
M204 S10000
G1 X129.633 Y127.958 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519925
G1 F1200
G1 X129.591 Y127.84 E.00489
G1 X129.418 Y127.751 E.00754
G1 X129.235 Y127.813 E.00752
G1 X129.151 Y127.988 E.00753
G1 X129.217 Y128.169 E.00752
G1 X129.392 Y128.237 E.00729
G1 X129.525 Y128.216 E.00521
G1 X129.637 Y128.071 E.00712
G1 X129.635 Y128.018 E.00207
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.637 Y128.071 E-.02774
G1 X129.525 Y128.216 E-.09546
G1 X129.392 Y128.237 E-.06988
G1 X129.217 Y128.169 E-.09774
G1 X129.151 Y127.988 E-.10088
G1 X129.235 Y127.813 E-.10095
G1 X129.418 Y127.751 E-.1008
G1 X129.591 Y127.84 E-.10105
G1 X129.633 Y127.958 E-.06551
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/650
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
G3 Z1.4 I-1.071 J.578 P1  F30000
G1 X129.911 Y128.473 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.511 J-.474 E.09106
G1 X129.452 Y127.305 E.00229
G3 X129.95 Y128.428 I-.052 J.695 E.04988
G1 X130.216 Y128.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.198 Y128.74 E.00086
G3 X129.373 Y126.911 I-.798 J-.741 E.13184
G1 X129.481 Y126.913 E.00332
G3 X130.329 Y128.567 I-.081 J1.086 E.06843
G1 X130.252 Y128.67 E.00395
M204 S10000
G1 X129.633 Y127.958 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519908
G1 F1200
G1 X129.591 Y127.84 E.00488
G1 X129.418 Y127.751 E.00753
G1 X129.235 Y127.813 E.00751
G1 X129.151 Y127.988 E.00753
G1 X129.217 Y128.169 E.00752
G1 X129.392 Y128.237 E.00729
G1 X129.525 Y128.216 E.00521
G1 X129.637 Y128.071 E.00712
G1 X129.635 Y128.018 E.00208
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.637 Y128.071 E-.02787
G1 X129.525 Y128.216 E-.09546
G1 X129.392 Y128.237 E-.06986
G1 X129.217 Y128.169 E-.09775
G1 X129.151 Y127.988 E-.10088
G1 X129.235 Y127.813 E-.10095
G1 X129.418 Y127.751 E-.10076
G1 X129.591 Y127.84 E-.10103
G1 X129.633 Y127.958 E-.06545
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/650
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
G3 Z1.6 I-1.071 J.578 P1  F30000
G1 X129.911 Y128.473 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.511 J-.474 E.09106
G1 X129.451 Y127.305 E.00228
G3 X129.95 Y128.428 I-.052 J.695 E.04988
G1 X130.216 Y128.719 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.198 Y128.74 E.00084
G3 X129.373 Y126.911 I-.799 J-.74 E.13185
G1 X129.481 Y126.913 E.00331
G3 X130.329 Y128.567 I-.081 J1.086 E.06843
G1 X130.252 Y128.671 E.00397
M204 S10000
G1 X129.633 Y127.958 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518914
G1 F1200
G1 X129.591 Y127.839 E.00488
G1 X129.418 Y127.751 E.00753
G1 X129.235 Y127.813 E.00751
G1 X129.151 Y127.988 E.00753
G1 X129.209 Y128.158 E.00697
G1 X129.391 Y128.245 E.00785
G1 X129.525 Y128.216 E.00529
G1 X129.637 Y128.071 E.00712
G1 X129.635 Y128.018 E.00209
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P42 R8
G1 X129.637 Y128.071 E-.02797
G1 X129.525 Y128.216 E-.09531
G1 X129.391 Y128.245 E-.07086
G1 X129.209 Y128.158 E-.10511
G1 X129.151 Y127.988 E-.0933
G1 X129.235 Y127.813 E-.10077
G1 X129.418 Y127.751 E-.10057
G1 X129.591 Y127.839 E-.10083
G1 X129.633 Y127.958 E-.06527
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/650
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
G3 Z1.8 I-1.072 J.577 P1  F30000
G1 X129.911 Y128.473 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.511 J-.474 E.09107
G1 X129.451 Y127.305 E.00228
G3 X129.95 Y128.427 I-.052 J.695 E.04988
G1 X130.216 Y128.719 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.198 Y128.74 E.00082
G3 X129.373 Y126.911 I-.799 J-.74 E.13185
G1 X129.481 Y126.913 E.00331
G3 X130.329 Y128.567 I-.081 J1.086 E.06843
G1 X130.251 Y128.671 E.00399
M204 S10000
G1 X129.633 Y127.958 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519887
G1 F1200
G1 X129.591 Y127.839 E.00488
G1 X129.418 Y127.751 E.00753
G1 X129.235 Y127.813 E.00751
G1 X129.151 Y127.988 E.00753
G1 X129.217 Y128.169 E.00752
G1 X129.392 Y128.237 E.00729
G1 X129.525 Y128.216 E.00521
G1 X129.637 Y128.071 E.00712
G1 X129.635 Y128.018 E.00209
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.637 Y128.071 E-.02803
G1 X129.525 Y128.216 E-.09545
G1 X129.392 Y128.237 E-.06986
G1 X129.217 Y128.169 E-.09775
G1 X129.151 Y127.988 E-.10088
G1 X129.235 Y127.813 E-.10095
G1 X129.418 Y127.751 E-.1007
G1 X129.591 Y127.839 E-.10097
G1 X129.633 Y127.958 E-.0654
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/650
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
G3 Z2 I-1.071 J.578 P1  F30000
G1 X129.911 Y128.473 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.511 J-.474 E.09107
G1 X129.451 Y127.305 E.00228
G3 X129.95 Y128.427 I-.051 J.695 E.04987
G1 X130.215 Y128.72 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.199 Y128.74 E.00079
G3 X129.373 Y126.911 I-.799 J-.74 E.13186
G1 X129.48 Y126.913 E.00331
G3 X130.329 Y128.567 I-.081 J1.086 E.06843
G1 X130.251 Y128.672 E.00402
M204 S10000
G1 X129.633 Y127.957 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519865
G1 F1200
G1 X129.591 Y127.839 E.00488
G1 X129.418 Y127.751 E.00753
G1 X129.235 Y127.813 E.00751
G1 X129.151 Y127.988 E.00753
G1 X129.217 Y128.169 E.00752
G1 X129.392 Y128.237 E.00729
G1 X129.525 Y128.216 E.00521
G1 X129.637 Y128.071 E.00712
G1 X129.635 Y128.017 E.0021
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.637 Y128.071 E-.02814
G1 X129.525 Y128.216 E-.09545
G1 X129.392 Y128.237 E-.06982
G1 X129.217 Y128.169 E-.09776
G1 X129.151 Y127.988 E-.10089
G1 X129.235 Y127.813 E-.10095
G1 X129.418 Y127.751 E-.10068
G1 X129.591 Y127.839 E-.10093
G1 X129.633 Y127.957 E-.06538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/650
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
G3 Z2.2 I-1.071 J.578 P1  F30000
G1 X129.911 Y128.473 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.511 J-.474 E.09108
G1 X129.451 Y127.305 E.00227
G3 X129.95 Y128.427 I-.051 J.695 E.04988
G1 X130.215 Y128.721 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.199 Y128.74 E.00076
G3 X129.373 Y126.911 I-.799 J-.74 E.13186
G1 X129.48 Y126.913 E.0033
G3 X130.329 Y128.567 I-.081 J1.086 E.06843
G1 X130.25 Y128.672 E.00404
M204 S10000
G1 X129.633 Y127.957 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518881
G1 F1200
G1 X129.591 Y127.839 E.00487
G1 X129.418 Y127.751 E.00753
G1 X129.235 Y127.813 E.00751
G1 X129.15 Y127.988 E.00753
G1 X129.209 Y128.158 E.00697
G1 X129.391 Y128.245 E.00785
G1 X129.525 Y128.216 E.00529
G1 X129.637 Y128.071 E.00712
G1 X129.635 Y128.017 E.00211
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.637 Y128.071 E-.0282
G1 X129.525 Y128.216 E-.09531
G1 X129.391 Y128.245 E-.07085
G1 X129.209 Y128.158 E-.10512
G1 X129.15 Y127.988 E-.0933
G1 X129.235 Y127.813 E-.10077
G1 X129.418 Y127.751 E-.10047
G1 X129.591 Y127.839 E-.10075
G1 X129.633 Y127.957 E-.06524
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/650
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
G3 Z2.4 I-1.072 J.577 P1  F30000
G1 X129.911 Y128.473 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.511 J-.473 E.09108
G1 X129.451 Y127.305 E.00227
G3 X129.95 Y128.427 I-.051 J.695 E.04987
G1 X130.214 Y128.721 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.199 Y128.739 E.00073
G3 X129.373 Y126.911 I-.799 J-.74 E.13186
G1 X129.48 Y126.913 E.0033
G3 X130.329 Y128.567 I-.08 J1.086 E.06843
G1 X130.25 Y128.673 E.00408
M204 S10000
G1 X129.634 Y127.957 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516422
G1 F1200
G1 X129.592 Y127.838 E.00488
G1 X129.418 Y127.75 E.00752
G1 X129.234 Y127.812 E.0075
G1 X129.152 Y127.973 E.00696
G1 X129.218 Y128.166 E.00786
G1 X129.332 Y128.242 E.0053
G1 X129.525 Y128.217 E.00752
G1 X129.639 Y128.072 E.00712
G1 X129.637 Y128.017 E.00212
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.639 Y128.072 E-.02834
G1 X129.525 Y128.217 E-.09534
G1 X129.332 Y128.242 E-.10068
G1 X129.218 Y128.166 E-.07091
G1 X129.152 Y127.973 E-.10524
G1 X129.234 Y127.812 E-.09311
G1 X129.418 Y127.75 E-.10043
G1 X129.592 Y127.838 E-.10069
G1 X129.634 Y127.957 E-.06527
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/650
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
G3 Z2.6 I-1.073 J.575 P1  F30000
G1 X129.911 Y128.473 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.511 J-.473 E.09109
G1 X129.451 Y127.305 E.00226
G3 X129.95 Y128.427 I-.051 J.695 E.04987
G1 X130.213 Y128.722 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.199 Y128.739 E.00069
G3 X129.373 Y126.911 I-.799 J-.74 E.13187
G1 X129.48 Y126.913 E.0033
G3 X130.329 Y128.567 I-.08 J1.086 E.06843
G1 X130.249 Y128.674 E.00412
M204 S10000
G1 X129.633 Y127.957 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518858
G1 F1200
G1 X129.591 Y127.839 E.00487
G1 X129.418 Y127.751 E.00752
G1 X129.235 Y127.813 E.0075
G1 X129.15 Y127.988 E.00753
G1 X129.209 Y128.158 E.00697
G1 X129.391 Y128.245 E.00785
G1 X129.525 Y128.216 E.00529
G1 X129.637 Y128.071 E.00712
G1 X129.635 Y128.017 E.00212
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.637 Y128.071 E-.02838
G1 X129.525 Y128.216 E-.09531
G1 X129.391 Y128.245 E-.07083
G1 X129.209 Y128.158 E-.10512
G1 X129.15 Y127.988 E-.0933
G1 X129.235 Y127.813 E-.10076
G1 X129.418 Y127.751 E-.10041
G1 X129.591 Y127.839 E-.10069
G1 X129.633 Y127.957 E-.06519
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/650
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
G3 Z2.8 I-1.071 J.577 P1  F30000
G1 X129.911 Y128.473 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.511 J-.473 E.09109
G1 X129.451 Y127.305 E.00226
G3 X129.95 Y128.427 I-.051 J.695 E.04987
G1 X130.213 Y128.723 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.199 Y128.739 E.00065
G3 X129.373 Y126.911 I-.799 J-.74 E.13188
G1 X129.48 Y126.913 E.00329
G3 X130.329 Y128.567 I-.08 J1.086 E.06843
G1 X130.248 Y128.675 E.00416
M204 S10000
G1 X129.634 Y127.957 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517874
G1 F1200
G1 X129.591 Y127.838 E.00487
G1 X129.418 Y127.75 E.00752
G1 X129.234 Y127.812 E.0075
G1 X129.15 Y127.988 E.00754
G1 X129.225 Y128.161 E.0073
G1 X129.332 Y128.241 E.00517
G1 X129.525 Y128.217 E.00752
G1 X129.638 Y128.072 E.00712
G1 X129.636 Y128.017 E.00213
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.638 Y128.072 E-.02853
G1 X129.525 Y128.217 E-.09549
G1 X129.332 Y128.241 E-.10087
G1 X129.225 Y128.161 E-.0693
G1 X129.15 Y127.988 E-.09791
G1 X129.234 Y127.812 E-.10119
G1 X129.418 Y127.75 E-.10056
G1 X129.591 Y127.838 E-.10082
G1 X129.634 Y127.957 E-.06533
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/650
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
G3 Z3 I-1.072 J.576 P1  F30000
G1 X129.911 Y128.473 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.511 J-.473 E.09109
G1 X129.451 Y127.305 E.00226
G3 X129.95 Y128.427 I-.051 J.695 E.04987
G1 X130.212 Y128.725 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.199 Y128.739 E.0006
G3 X129.373 Y126.911 I-.799 J-.74 E.13188
G1 X129.48 Y126.913 E.00329
G3 X130.329 Y128.567 I-.08 J1.086 E.06843
G1 X130.247 Y128.676 E.00421
M204 S10000
G1 X129.637 Y128.071 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519539
G1 F1200
G2 X129.59 Y127.839 I-.393 J-.042 E.00936
G1 X129.418 Y127.751 E.00752
G1 X129.235 Y127.813 E.0075
G1 X129.151 Y127.988 E.00753
G1 X129.217 Y128.17 E.00755
G1 X129.393 Y128.236 E.0073
G1 X129.525 Y128.216 E.00516
G1 X129.6 Y128.119 E.00479
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.216 E-.06421
G1 X129.393 Y128.236 E-.06918
G1 X129.217 Y128.17 E-.09796
G1 X129.151 Y127.988 E-.10121
G1 X129.235 Y127.813 E-.10097
G1 X129.418 Y127.751 E-.10054
G1 X129.59 Y127.839 E-.10082
G1 X129.633 Y127.957 E-.06524
G1 X129.637 Y128.071 E-.05987
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/650
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
G3 Z3.2 I-1.005 J.686 P1  F30000
G1 X129.911 Y128.473 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.511 J-.473 E.0911
G1 X129.451 Y127.305 E.00225
G3 X129.95 Y128.427 I-.051 J.695 E.04987
G1 X130.211 Y128.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.199 Y128.739 E.00054
G3 X129.373 Y126.911 I-.799 J-.74 E.13189
G1 X129.48 Y126.913 E.00328
G3 X130.329 Y128.566 I-.08 J1.086 E.06843
G1 X130.246 Y128.678 E.00426
M204 S10000
G1 X129.637 Y128.071 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518822
G1 F1200
G2 X129.591 Y127.838 I-.393 J-.042 E.00937
G1 X129.418 Y127.751 E.00751
G1 X129.235 Y127.813 E.00749
G1 X129.15 Y127.988 E.00753
G1 X129.209 Y128.158 E.00697
G1 X129.391 Y128.245 E.00785
G1 X129.525 Y128.216 E.00529
G1 X129.601 Y128.119 E.00479
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.216 E-.06415
G1 X129.391 Y128.245 E-.07083
G1 X129.209 Y128.158 E-.10513
G1 X129.15 Y127.988 E-.09329
G1 X129.235 Y127.813 E-.10077
G1 X129.418 Y127.751 E-.10032
G1 X129.591 Y127.838 E-.1006
G1 X129.633 Y127.956 E-.06516
G1 X129.637 Y128.071 E-.05977
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/650
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
G3 Z3.4 I-1.005 J.686 P1  F30000
G1 X129.911 Y128.473 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.511 J-.473 E.0911
G1 X129.451 Y127.305 E.00225
G3 X129.95 Y128.427 I-.051 J.695 E.04987
G1 X130.209 Y128.727 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.199 Y128.739 E.00048
G3 X129.373 Y126.911 I-.799 J-.74 E.13189
G1 X129.48 Y126.913 E.00328
G3 X130.329 Y128.566 I-.08 J1.086 E.06843
G1 X130.245 Y128.679 E.00432
M204 S10000
G1 X129.639 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516344
G1 F1200
G2 X129.592 Y127.837 I-.395 J-.042 E.00937
G1 X129.418 Y127.75 E.00751
G1 X129.234 Y127.812 E.00749
G1 X129.152 Y127.973 E.00696
G1 X129.218 Y128.166 E.00786
G1 X129.332 Y128.242 E.0053
G1 X129.525 Y128.218 E.00752
G1 X129.602 Y128.119 E.00481
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.218 E-.06434
G1 X129.332 Y128.242 E-.10066
G1 X129.218 Y128.166 E-.07091
G1 X129.152 Y127.973 E-.10525
G1 X129.234 Y127.812 E-.09311
G1 X129.418 Y127.75 E-.10028
G1 X129.592 Y127.837 E-.10056
G1 X129.634 Y127.956 E-.06514
G1 X129.639 Y128.072 E-.05976
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/650
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
G3 Z3.6 I-1.006 J.684 P1  F30000
G1 X129.911 Y128.473 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.473 E.09111
G1 X129.45 Y127.305 E.00225
G3 X129.95 Y128.427 I-.051 J.695 E.04987
G1 X130.208 Y128.729 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.199 Y128.739 E.00041
G3 X129.373 Y126.911 I-.799 J-.74 E.13189
G1 X129.479 Y126.913 E.00328
G3 X130.329 Y128.566 I-.08 J1.086 E.06843
G1 X130.244 Y128.681 E.00439
M204 S10000
G1 X129.637 Y128.071 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519762
G1 F1200
G2 X129.59 Y127.838 I-.393 J-.042 E.00938
G1 X129.418 Y127.751 E.00751
G1 X129.235 Y127.813 E.00749
G1 X129.151 Y127.988 E.00753
G1 X129.217 Y128.17 E.00752
G1 X129.392 Y128.237 E.00729
G1 X129.525 Y128.216 E.0052
G1 X129.6 Y128.119 E.00479
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.216 E-.06418
G1 X129.392 Y128.237 E-.06973
M73 P43 R8
G1 X129.217 Y128.17 E-.0978
G1 X129.151 Y127.988 E-.1009
G1 X129.235 Y127.813 E-.10094
G1 X129.418 Y127.751 E-.10044
G1 X129.59 Y127.838 E-.10072
G1 X129.632 Y127.956 E-.06515
G1 X129.637 Y128.071 E-.06014
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/650
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
G3 Z3.8 I-1.005 J.687 P1  F30000
G1 X129.911 Y128.473 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.473 E.09111
G1 X129.45 Y127.305 E.00224
G3 X129.95 Y128.427 I-.051 J.695 E.04987
G1 X130.207 Y128.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.199 Y128.739 E.00034
G3 X129.373 Y126.911 I-.8 J-.739 E.1319
G1 X129.479 Y126.913 E.00327
G3 X130.329 Y128.566 I-.08 J1.086 E.06843
G1 X130.243 Y128.683 E.00446
M204 S10000
G1 X129.638 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517806
G1 F1200
G2 X129.591 Y127.838 I-.395 J-.042 E.00938
G1 X129.418 Y127.75 E.00751
G1 X129.234 Y127.812 E.00749
G1 X129.15 Y127.988 E.00754
G1 X129.225 Y128.161 E.0073
G1 X129.332 Y128.241 E.00517
G1 X129.525 Y128.217 E.00752
G1 X129.601 Y128.119 E.0048
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.217 E-.06435
G1 X129.332 Y128.241 E-.10084
G1 X129.225 Y128.161 E-.06928
G1 X129.15 Y127.988 E-.09794
G1 X129.234 Y127.812 E-.10118
G1 X129.418 Y127.75 E-.1004
G1 X129.591 Y127.838 E-.10069
G1 X129.633 Y127.956 E-.06519
G1 X129.638 Y128.072 E-.06012
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/650
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
G3 Z4 I-1.006 J.685 P1  F30000
G1 X129.911 Y128.472 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.473 E.09111
G1 X129.45 Y127.305 E.00224
G3 X129.95 Y128.427 I-.051 J.695 E.04987
G1 X130.205 Y128.733 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.199 Y128.739 E.00026
G3 X129.373 Y126.911 I-.8 J-.739 E.1319
G1 X129.479 Y126.913 E.00327
G3 X130.329 Y128.566 I-.08 J1.086 E.06843
G1 X130.241 Y128.685 E.00455
M204 S10000
G1 X129.638 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517787
G1 F1200
G2 X129.591 Y127.838 I-.395 J-.042 E.00939
G1 X129.418 Y127.75 E.00751
G1 X129.234 Y127.812 E.00748
G1 X129.15 Y127.988 E.00754
G1 X129.225 Y128.161 E.0073
G1 X129.332 Y128.241 E.00517
G1 X129.525 Y128.217 E.00752
G1 X129.601 Y128.119 E.0048
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.217 E-.06434
G1 X129.332 Y128.241 E-.10084
G1 X129.225 Y128.161 E-.06931
G1 X129.15 Y127.988 E-.0979
G1 X129.234 Y127.812 E-.10119
G1 X129.418 Y127.75 E-.10037
G1 X129.591 Y127.838 E-.10066
G1 X129.633 Y127.956 E-.06517
G1 X129.638 Y128.072 E-.06021
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/650
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
G3 Z4.2 I-1.005 J.686 P1  F30000
G1 X129.911 Y128.472 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.473 E.09112
G1 X129.45 Y127.305 E.00224
G3 X129.95 Y128.427 I-.051 J.695 E.04987
G1 X130.204 Y128.735 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.199 Y128.739 E.00017
G3 X129.373 Y126.911 I-.8 J-.739 E.13191
G1 X129.479 Y126.913 E.00327
G3 X130.329 Y128.566 I-.08 J1.086 E.06843
G1 X130.239 Y128.687 E.00464
M204 S10000
G1 X129.64 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515571
G1 F1200
G2 X129.591 Y127.837 I-.407 J-.039 E.00938
G1 X129.418 Y127.749 E.00749
G1 X129.234 Y127.812 E.00747
G1 X129.152 Y127.973 E.00695
G1 X129.217 Y128.166 E.00786
G1 X129.332 Y128.243 E.00531
G1 X129.526 Y128.218 E.00753
G1 X129.603 Y128.119 E.00483
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.526 Y128.218 E-.06464
G1 X129.332 Y128.243 E-.10082
G1 X129.217 Y128.166 E-.07106
G1 X129.152 Y127.973 E-.10523
G1 X129.234 Y127.812 E-.09295
G1 X129.418 Y127.749 E-.09997
G1 X129.591 Y127.837 E-.10026
G1 X129.634 Y127.956 E-.06498
G1 X129.64 Y128.072 E-.06008
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/650
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
G3 Z4.4 I-1.007 J.683 P1  F30000
G1 X129.911 Y128.472 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.473 E.09112
G1 X129.45 Y127.305 E.00223
G3 X129.95 Y128.426 I-.051 J.695 E.04987
G1 X130.202 Y128.738 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.199 Y128.738 E.00008
G3 X129.373 Y126.911 I-.8 J-.739 E.13192
G1 X129.479 Y126.913 E.00326
G3 X130.329 Y128.566 I-.08 J1.086 E.06843
G1 X130.237 Y128.69 E.00473
M204 S10000
G1 X129.638 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517756
G1 F1200
G2 X129.591 Y127.837 I-.395 J-.042 E.00939
G1 X129.417 Y127.75 E.0075
G1 X129.234 Y127.812 E.00748
G1 X129.15 Y127.988 E.00754
G1 X129.225 Y128.161 E.0073
G1 X129.332 Y128.241 E.00517
G1 X129.525 Y128.217 E.00752
G1 X129.601 Y128.119 E.0048
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.217 E-.06435
G1 X129.332 Y128.241 E-.10083
G1 X129.225 Y128.161 E-.06932
G1 X129.15 Y127.988 E-.0979
G1 X129.234 Y127.812 E-.10118
G1 X129.417 Y127.75 E-.10031
G1 X129.591 Y127.837 E-.10061
G1 X129.633 Y127.955 E-.0651
G1 X129.638 Y128.072 E-.0604
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/650
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
G3 Z4.6 I-1.005 J.686 P1  F30000
G1 X129.911 Y128.472 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.473 E.09113
G1 X129.45 Y127.305 E.00223
G3 X129.95 Y128.426 I-.051 J.695 E.04987
G1 X130.2 Y128.74 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.035 Y128.884 E.00671
G3 X129.373 Y126.911 I-.636 J-.884 E.12517
G1 X129.479 Y126.913 E.00326
G3 X130.238 Y128.695 I-.08 J1.086 E.07329
M204 S10000
G1 X129.638 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517741
G1 F1200
G2 X129.591 Y127.837 I-.395 J-.042 E.0094
G1 X129.417 Y127.75 E.0075
G1 X129.234 Y127.812 E.00748
G1 X129.15 Y127.988 E.00754
G1 X129.225 Y128.161 E.0073
G1 X129.332 Y128.241 E.00517
G1 X129.525 Y128.217 E.00752
G1 X129.601 Y128.119 E.0048
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.217 E-.06434
G1 X129.332 Y128.241 E-.10083
G1 X129.225 Y128.161 E-.06933
G1 X129.15 Y127.988 E-.09789
G1 X129.234 Y127.812 E-.10118
G1 X129.417 Y127.75 E-.10028
G1 X129.591 Y127.837 E-.10058
G1 X129.633 Y127.955 E-.06506
G1 X129.638 Y128.072 E-.0605
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/650
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
G3 Z4.8 I-1.005 J.686 P1  F30000
G1 X129.911 Y128.472 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.473 E.09113
G1 X129.45 Y127.305 E.00223
G3 X129.95 Y128.426 I-.05 J.695 E.04987
G1 X130.197 Y128.742 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P43 R7
G1 F1200
G1 X130.035 Y128.884 E.0066
G3 X129.373 Y126.911 I-.636 J-.884 E.12517
G1 X129.479 Y126.913 E.00325
G3 X130.236 Y128.697 I-.079 J1.086 E.07338
M204 S10000
G1 X129.638 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517736
G1 F1200
G2 X129.59 Y127.837 I-.395 J-.042 E.0094
G1 X129.417 Y127.75 E.0075
G1 X129.234 Y127.812 E.00748
G1 X129.15 Y127.988 E.00754
G1 X129.225 Y128.161 E.0073
G1 X129.332 Y128.241 E.00517
G1 X129.525 Y128.217 E.00752
G1 X129.601 Y128.119 E.0048
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.217 E-.06436
G1 X129.332 Y128.241 E-.10081
G1 X129.225 Y128.161 E-.06934
G1 X129.15 Y127.988 E-.09789
G1 X129.234 Y127.812 E-.10118
G1 X129.417 Y127.75 E-.10025
G1 X129.59 Y127.837 E-.10054
G1 X129.633 Y127.955 E-.06514
G1 X129.638 Y128.072 E-.06047
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/650
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
G3 Z5 I-1.005 J.686 P1  F30000
G1 X129.911 Y128.472 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.473 E.09113
G1 X129.45 Y127.305 E.00222
G3 X129.95 Y128.426 I-.05 J.695 E.04987
G1 X130.194 Y128.745 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.035 Y128.884 E.00648
G3 X129.373 Y126.911 I-.636 J-.884 E.12518
G1 X129.479 Y126.913 E.00325
G3 X130.233 Y128.7 I-.079 J1.086 E.0735
M204 S10000
G1 X129.637 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518716
G1 F1200
G2 X129.59 Y127.837 I-.395 J-.042 E.00941
G1 X129.417 Y127.751 E.0075
G1 X129.235 Y127.813 E.00747
G1 X129.15 Y127.988 E.00753
G1 X129.209 Y128.158 E.00697
G1 X129.391 Y128.245 E.00785
G1 X129.525 Y128.217 E.00529
G1 X129.601 Y128.119 E.00479
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.217 E-.06416
G1 X129.391 Y128.245 E-.07077
G1 X129.209 Y128.158 E-.10515
G1 X129.15 Y127.988 E-.09327
G1 X129.235 Y127.813 E-.10077
G1 X129.417 Y127.751 E-.10004
G1 X129.59 Y127.837 E-.10036
G1 X129.633 Y127.955 E-.06489
G1 X129.637 Y128.072 E-.06058
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/650
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
G3 Z5.2 I-1.004 J.687 P1  F30000
G1 X129.911 Y128.472 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.472 E.09114
G1 X129.45 Y127.305 E.00222
G3 X129.95 Y128.426 I-.05 J.695 E.04986
G1 X130.191 Y128.748 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.035 Y128.884 E.00635
G3 X129.373 Y126.911 I-.636 J-.884 E.12518
G1 X129.479 Y126.913 E.00325
G3 X130.231 Y128.703 I-.079 J1.086 E.07363
M204 S10000
G1 X129.638 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516666
G1 F1200
G2 X129.591 Y127.837 I-.396 J-.042 E.00941
G1 X129.417 Y127.75 E.00749
G1 X129.234 Y127.812 E.00747
G1 X129.152 Y127.977 E.00712
G1 X129.217 Y128.165 E.00768
G1 X129.332 Y128.242 E.00532
G1 X129.525 Y128.217 E.00751
G1 X129.602 Y128.119 E.0048
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.217 E-.06431
G1 X129.332 Y128.242 E-.10059
G1 X129.217 Y128.165 E-.07126
G1 X129.152 Y127.977 E-.10279
G1 X129.234 Y127.812 E-.09529
G1 X129.417 Y127.75 E-.09999
G1 X129.591 Y127.837 E-.10031
G1 X129.634 Y127.955 E-.06489
G1 X129.638 Y128.072 E-.06058
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/650
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
G3 Z5.4 I-1.005 J.686 P1  F30000
G1 X129.911 Y128.472 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.472 E.09114
G1 X129.45 Y127.305 E.00222
G3 X129.95 Y128.426 I-.05 J.695 E.04986
G1 X130.188 Y128.751 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.035 Y128.884 E.00622
G3 X129.373 Y126.911 I-.636 J-.884 E.12518
G1 X129.478 Y126.913 E.00324
G3 X130.228 Y128.706 I-.079 J1.086 E.07376
M204 S10000
G1 X129.637 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519399
G1 F1200
G2 X129.59 Y127.837 I-.394 J-.042 E.00942
G1 X129.417 Y127.751 E.00749
G1 X129.235 Y127.813 E.00747
G1 X129.151 Y127.988 E.00753
G1 X129.217 Y128.17 E.00755
G1 X129.393 Y128.237 E.00731
G1 X129.524 Y128.216 E.00515
G1 X129.6 Y128.119 E.00479
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.524 Y128.216 E-.06422
G1 X129.393 Y128.237 E-.06906
G1 X129.217 Y128.17 E-.09801
G1 X129.151 Y127.988 E-.10122
G1 X129.235 Y127.813 E-.10097
G1 X129.417 Y127.751 E-.10017
G1 X129.59 Y127.837 E-.1005
G1 X129.632 Y127.955 E-.06492
G1 X129.637 Y128.072 E-.06093
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/650
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
G3 Z5.6 I-1.004 J.688 P1  F30000
G1 X129.911 Y128.472 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.472 E.09115
G1 X129.449 Y127.305 E.00221
G3 X129.95 Y128.426 I-.05 J.695 E.04986
G1 X130.184 Y128.754 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.035 Y128.884 E.00609
G3 X129.373 Y126.911 I-.636 J-.884 E.12518
G1 X129.478 Y126.913 E.00324
G3 X130.225 Y128.709 I-.079 J1.086 E.0739
M204 S10000
G1 X129.637 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518687
G1 F1200
G2 X129.59 Y127.837 I-.395 J-.042 E.00942
G1 X129.417 Y127.751 E.00749
G1 X129.235 Y127.813 E.00747
G1 X129.15 Y127.988 E.00753
G1 X129.209 Y128.158 E.00697
G1 X129.391 Y128.245 E.00785
G1 X129.525 Y128.217 E.00528
G1 X129.601 Y128.119 E.00479
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P44 R7
G1 X129.525 Y128.217 E-.06416
G1 X129.391 Y128.245 E-.07074
G1 X129.209 Y128.158 E-.10509
G1 X129.15 Y127.988 E-.09334
G1 X129.235 Y127.813 E-.10077
G1 X129.417 Y127.751 E-.09995
G1 X129.59 Y127.837 E-.10027
G1 X129.632 Y127.955 E-.06484
G1 X129.637 Y128.072 E-.06084
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/650
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
G3 Z5.8 I-1.004 J.688 P1  F30000
G1 X129.911 Y128.472 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.472 E.09115
G1 X129.449 Y127.305 E.00221
G3 X129.95 Y128.426 I-.05 J.695 E.04986
G1 X130.181 Y128.757 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.035 Y128.884 E.00595
G3 X129.373 Y126.911 I-.636 J-.884 E.12518
G1 X129.478 Y126.913 E.00324
G3 X130.222 Y128.713 I-.079 J1.086 E.07404
M204 S10000
G1 X129.637 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519659
G1 F1200
G2 X129.589 Y127.837 I-.395 J-.042 E.00943
G1 X129.417 Y127.751 E.00749
G1 X129.235 Y127.813 E.00746
G1 X129.151 Y127.988 E.00753
G1 X129.217 Y128.17 E.00752
G1 X129.392 Y128.237 E.0073
G1 X129.524 Y128.216 E.00519
G1 X129.6 Y128.119 E.00479
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.524 Y128.216 E-.0642
G1 X129.392 Y128.237 E-.06965
G1 X129.217 Y128.17 E-.09784
G1 X129.151 Y127.988 E-.10089
G1 X129.235 Y127.813 E-.10094
G1 X129.417 Y127.751 E-.1001
G1 X129.589 Y127.837 E-.10041
G1 X129.632 Y127.954 E-.06495
G1 X129.637 Y128.072 E-.06103
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/650
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
G3 Z6 I-1.004 J.688 P1  F30000
G1 X129.911 Y128.472 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.472 E.09115
G1 X129.449 Y127.305 E.0022
G3 X129.95 Y128.426 I-.05 J.695 E.04986
G1 X130.178 Y128.76 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.035 Y128.883 E.0058
G3 X129.373 Y126.911 I-.636 J-.884 E.12518
G1 X129.478 Y126.913 E.00323
G3 X130.219 Y128.716 I-.079 J1.086 E.07418
M204 S10000
G1 X129.637 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519364
G1 F1200
G2 X129.589 Y127.837 I-.395 J-.042 E.00944
G1 X129.417 Y127.751 E.00749
G1 X129.235 Y127.813 E.00746
G1 X129.151 Y127.988 E.00753
G1 X129.217 Y128.17 E.00755
G1 X129.393 Y128.237 E.00731
G1 X129.524 Y128.216 E.00515
G1 X129.6 Y128.119 E.00479
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.524 Y128.216 E-.06422
G1 X129.393 Y128.237 E-.06902
G1 X129.217 Y128.17 E-.09803
G1 X129.151 Y127.988 E-.10122
G1 X129.235 Y127.813 E-.10096
G1 X129.417 Y127.751 E-.10008
G1 X129.589 Y127.837 E-.10041
G1 X129.632 Y127.954 E-.06487
G1 X129.637 Y128.072 E-.06118
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/650
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
G3 Z6.2 I-1.004 J.688 P1  F30000
G1 X129.912 Y128.472 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.512 J-.472 E.09116
G1 X129.449 Y127.305 E.0022
G3 X129.95 Y128.426 I-.05 J.695 E.04986
G1 X130.174 Y128.763 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.035 Y128.883 E.00566
G3 X129.373 Y126.911 I-.636 J-.884 E.12518
G1 X129.478 Y126.913 E.00323
G3 X130.216 Y128.72 I-.079 J1.086 E.07433
M204 S10000
G1 X129.64 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515453
G1 F1200
G2 X129.591 Y127.836 I-.408 J-.038 E.00943
G1 X129.417 Y127.749 E.00747
G1 X129.234 Y127.812 E.00745
G1 X129.152 Y127.973 E.00696
G1 X129.217 Y128.166 E.00784
G1 X129.332 Y128.243 E.00531
G1 X129.526 Y128.218 E.00753
G1 X129.603 Y128.119 E.00483
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.526 Y128.218 E-.06465
G1 X129.332 Y128.243 E-.10077
G1 X129.217 Y128.166 E-.07107
G1 X129.152 Y127.973 E-.10498
G1 X129.234 Y127.812 E-.09321
G1 X129.417 Y127.749 E-.09966
G1 X129.591 Y127.836 E-.1
G1 X129.634 Y127.954 E-.06466
G1 X129.64 Y128.072 E-.061
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/650
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
G3 Z6.4 I-1.007 J.683 P1  F30000
G1 X129.912 Y128.473 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.806 Y128.565 E.00466
G3 X129.383 Y127.303 I-.407 J-.566 E.08647
G1 X129.449 Y127.305 E.0022
G3 X129.949 Y128.427 I-.05 J.695 E.04992
G1 X130.17 Y128.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.035 Y128.883 E.00551
G3 X129.373 Y126.911 I-.636 J-.884 E.12519
G1 X129.478 Y126.913 E.00322
G3 X130.213 Y128.723 I-.079 J1.086 E.07448
M204 S10000
G1 X129.638 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517617
G1 F1200
G2 X129.59 Y127.836 I-.396 J-.042 E.00944
G1 X129.417 Y127.75 E.00748
G1 X129.234 Y127.812 E.00746
G1 X129.15 Y127.988 E.00755
G1 X129.225 Y128.161 E.0073
G1 X129.332 Y128.241 E.00517
G1 X129.525 Y128.217 E.00751
G1 X129.601 Y128.119 E.0048
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.217 E-.06436
G1 X129.332 Y128.241 E-.10077
G1 X129.225 Y128.161 E-.06936
G1 X129.15 Y127.988 E-.09786
G1 X129.234 Y127.812 E-.10119
G1 X129.417 Y127.75 E-.1
G1 X129.59 Y127.836 E-.10034
G1 X129.633 Y127.954 E-.06486
G1 X129.638 Y128.072 E-.06125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/650
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
G3 Z6.6 I-1.012 J.676 P1  F30000
G1 X129.908 Y128.476 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.806 Y128.565 E.0045
G3 X129.383 Y127.303 I-.407 J-.566 E.08647
G1 X129.449 Y127.305 E.00219
G3 X129.947 Y128.43 I-.05 J.695 E.05006
G1 X130.167 Y128.769 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.035 Y128.883 E.00537
G3 X129.373 Y126.911 I-.636 J-.884 E.12519
G1 X129.478 Y126.913 E.00322
G3 X130.209 Y128.727 I-.079 J1.086 E.07463
M204 S10000
G1 X129.638 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517601
G1 F1200
G2 X129.59 Y127.836 I-.397 J-.042 E.00944
G1 X129.417 Y127.75 E.00748
G1 X129.234 Y127.812 E.00745
G1 X129.15 Y127.988 E.00754
G1 X129.225 Y128.161 E.0073
G1 X129.332 Y128.241 E.00517
G1 X129.525 Y128.217 E.00751
G1 X129.601 Y128.119 E.0048
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.217 E-.06436
G1 X129.332 Y128.241 E-.10076
G1 X129.225 Y128.161 E-.06935
G1 X129.15 Y127.988 E-.09787
G1 X129.234 Y127.812 E-.10119
G1 X129.417 Y127.75 E-.09998
G1 X129.59 Y127.836 E-.10032
G1 X129.633 Y127.954 E-.06481
G1 X129.638 Y128.072 E-.06137
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/650
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
G3 Z6.8 I-1.018 J.666 P1  F30000
G1 X129.905 Y128.48 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.806 Y128.565 E.00434
G3 X129.383 Y127.303 I-.407 J-.566 E.08647
G1 X129.449 Y127.305 E.00219
G3 X129.944 Y128.434 I-.05 J.695 E.05021
G1 X130.163 Y128.772 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.035 Y128.883 E.00522
G3 X129.373 Y126.911 I-.636 J-.884 E.12519
G1 X129.478 Y126.913 E.00322
G3 X130.206 Y128.73 I-.079 J1.086 E.07477
M204 S10000
G1 X129.638 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516593
G1 F1200
G2 X129.59 Y127.836 I-.398 J-.042 E.00945
G1 X129.417 Y127.75 E.00748
G1 X129.234 Y127.812 E.00745
G1 X129.152 Y127.978 E.00714
G1 X129.217 Y128.165 E.00766
G1 X129.332 Y128.242 E.00533
G1 X129.525 Y128.218 E.00751
G1 X129.602 Y128.119 E.00481
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.525 Y128.218 E-.06432
G1 X129.332 Y128.242 E-.10055
G1 X129.217 Y128.165 E-.07128
G1 X129.152 Y127.978 E-.10254
G1 X129.234 Y127.812 E-.09552
G1 X129.417 Y127.75 E-.09974
G1 X129.59 Y127.836 E-.10008
G1 X129.633 Y127.953 E-.0647
G1 X129.638 Y128.072 E-.06127
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/650
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
G3 Z7 I-1.025 J.656 P1  F30000
G1 X129.901 Y128.483 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.806 Y128.565 E.00419
G3 X129.383 Y127.303 I-.407 J-.566 E.08647
G1 X129.449 Y127.305 E.00219
G3 X129.941 Y128.438 I-.05 J.695 E.05037
G1 X130.16 Y128.775 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.035 Y128.883 E.00508
G3 X129.373 Y126.911 I-.636 J-.884 E.12519
G1 X129.477 Y126.913 E.00321
G3 X130.203 Y128.734 I-.078 J1.086 E.07491
M204 S10000
G1 X129.637 Y128.072 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519579
G1 F1200
G2 X129.589 Y127.837 I-.395 J-.042 E.00946
G1 X129.417 Y127.751 E.00748
G1 X129.235 Y127.813 E.00745
G1 X129.151 Y127.988 E.00753
G1 X129.217 Y128.17 E.00752
G1 X129.392 Y128.237 E.0073
G1 X129.524 Y128.216 E.00519
G1 X129.6 Y128.119 E.00479
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.524 Y128.216 E-.06419
G1 X129.392 Y128.237 E-.06957
G1 X129.217 Y128.17 E-.09788
G1 X129.151 Y127.988 E-.10089
G1 X129.235 Y127.813 E-.10095
G1 X129.417 Y127.751 E-.09991
G1 X129.589 Y127.837 E-.10026
G1 X129.632 Y127.953 E-.06468
G1 X129.637 Y128.072 E-.06167
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/650
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
G3 Z7.2 I-1.086 J.55 P1  F30000
G1 X129.865 Y128.521 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.462 J-.522 E.0887
G1 X129.456 Y127.305 E.00244
G3 X129.908 Y128.48 I-.053 J.695 E.05211
G1 X130.151 Y128.786 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.124 Y128.813 E.00119
G3 X129.373 Y126.911 I-.723 J-.814 E.1286
G1 X129.48 Y126.913 E.00329
G3 X130.27 Y128.655 I-.08 J1.086 E.07173
G1 X130.191 Y128.741 E.0036
M204 S10000
G1 X129.646 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517062
G1 F1200
G1 X129.614 Y127.87 E.00548
G1 X129.451 Y127.767 E.00747
G1 X129.32 Y127.762 E.00505
G1 X129.174 Y127.891 E.00753
G1 X129.164 Y128.086 E.00754
G1 X129.301 Y128.216 E.0073
G1 X129.431 Y128.249 E.00517
G1 X129.601 Y128.15 E.00757
G1 X129.628 Y128.066 E.00344
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04619
G1 X129.431 Y128.249 E-.10168
G1 X129.301 Y128.216 E-.06953
G1 X129.164 Y128.086 E-.09804
G1 X129.174 Y127.891 E-.10138
G1 X129.32 Y127.762 E-.10125
G1 X129.451 Y127.767 E-.06787
G1 X129.614 Y127.87 E-.10038
G1 X129.646 Y128.009 E-.07367
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/650
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
G3 Z7.4 I-1.119 J.478 P1  F30000
G1 X129.865 Y128.521 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.462 J-.522 E.0887
G1 X129.456 Y127.305 E.00244
G3 X129.908 Y128.48 I-.053 J.695 E.05211
G1 X130.148 Y128.789 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.124 Y128.813 E.00105
G3 X129.373 Y126.911 I-.724 J-.814 E.12861
G1 X129.48 Y126.913 E.00329
G3 X130.27 Y128.655 I-.08 J1.086 E.07173
G1 X130.188 Y128.744 E.00373
M204 S10000
G1 X129.642 Y128.061 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519178
G1 F1200
G1 X129.614 Y127.871 E.00748
G1 X129.45 Y127.768 E.00748
G1 X129.321 Y127.763 E.00504
G1 X129.175 Y127.892 E.00755
G1 X129.177 Y128.08 E.0073
G1 X129.244 Y128.195 E.00517
G1 X129.431 Y128.248 E.00753
G1 X129.562 Y128.183 E.00568
G1 X129.609 Y128.111 E.00332
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.562 Y128.183 E-.04456
G1 X129.431 Y128.248 E-.07635
G1 X129.244 Y128.195 E-.10118
G1 X129.177 Y128.08 E-.06948
G1 X129.175 Y127.892 E-.0981
G1 X129.321 Y127.763 E-.10153
G1 X129.45 Y127.768 E-.06776
G1 X129.614 Y127.871 E-.10054
G1 X129.642 Y128.061 E-.1005
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/650
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
G3 Z7.6 I-1.095 J.53 P1  F30000
G1 X129.865 Y128.521 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.462 J-.522 E.08871
G1 X129.456 Y127.305 E.00243
G3 X129.908 Y128.48 I-.053 J.695 E.0521
G1 X130.145 Y128.792 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.124 Y128.813 E.00093
G3 X129.373 Y126.911 I-.724 J-.814 E.12861
G1 X129.48 Y126.913 E.00328
G3 X130.27 Y128.655 I-.08 J1.086 E.07173
G1 X130.185 Y128.747 E.00386
M204 S10000
G1 X129.645 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518348
G1 F1200
G1 X129.614 Y127.871 E.00548
G1 X129.451 Y127.768 E.00748
G1 X129.321 Y127.763 E.00504
G1 X129.175 Y127.891 E.00754
G1 X129.162 Y128.071 E.00696
G1 X129.297 Y128.223 E.00786
M73 P45 R7
G1 X129.431 Y128.248 E.0053
G1 X129.6 Y128.15 E.00757
G1 X129.627 Y128.066 E.00343
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.15 E-.04602
G1 X129.431 Y128.248 E-.10153
G1 X129.297 Y128.223 E-.07107
G1 X129.162 Y128.071 E-.10539
G1 X129.175 Y127.891 E-.09343
G1 X129.321 Y127.763 E-.10109
G1 X129.451 Y127.768 E-.0676
G1 X129.614 Y127.871 E-.10038
G1 X129.645 Y128.009 E-.07349
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/650
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
G3 Z7.8 I-1.119 J.479 P1  F30000
G1 X129.865 Y128.521 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.462 J-.522 E.08871
G1 X129.456 Y127.305 E.00243
G3 X129.908 Y128.48 I-.053 J.695 E.0521
G1 X130.142 Y128.795 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.124 Y128.813 E.0008
G3 X129.373 Y126.911 I-.724 J-.814 E.12862
G1 X129.48 Y126.913 E.00328
G3 X130.27 Y128.655 I-.079 J1.086 E.07173
G1 X130.183 Y128.75 E.00398
M204 S10000
G1 X129.646 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516878
G1 F1200
G1 X129.615 Y127.87 E.00548
G1 X129.451 Y127.767 E.00748
G1 X129.32 Y127.762 E.00504
G1 X129.174 Y127.891 E.00753
G1 X129.164 Y128.086 E.00753
G1 X129.284 Y128.22 E.00695
G1 X129.487 Y128.23 E.00785
G1 X129.601 Y128.15 E.00535
G1 X129.628 Y128.066 E.00344
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04608
G1 X129.487 Y128.23 E-.07181
G1 X129.284 Y128.22 E-.10534
G1 X129.164 Y128.086 E-.0933
G1 X129.174 Y127.891 E-.10096
G1 X129.32 Y127.762 E-.10108
G1 X129.451 Y127.767 E-.06759
G1 X129.615 Y127.87 E-.10038
G1 X129.646 Y128.009 E-.07348
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/650
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
G3 Z8 I-1.119 J.478 P1  F30000
G1 X129.865 Y128.521 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.462 J-.522 E.08872
G1 X129.456 Y127.305 E.00243
G3 X129.908 Y128.479 I-.053 J.695 E.0521
G1 X130.14 Y128.797 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.124 Y128.813 E.00069
G3 X129.373 Y126.911 I-.724 J-.814 E.12862
G1 X129.48 Y126.913 E.00328
G3 X130.27 Y128.655 I-.079 J1.086 E.07173
G1 X130.18 Y128.753 E.00409
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519453
G1 F1200
G1 X129.614 Y127.871 E.00548
G1 X129.45 Y127.768 E.00749
G1 X129.321 Y127.763 E.00503
G1 X129.175 Y127.892 E.00754
G1 X129.177 Y128.079 E.00729
G1 X129.244 Y128.195 E.00521
G1 X129.431 Y128.248 E.00753
G1 X129.6 Y128.15 E.00757
G1 X129.626 Y128.066 E.00342
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.15 E-.04601
G1 X129.431 Y128.248 E-.10174
G1 X129.244 Y128.195 E-.10117
G1 X129.177 Y128.079 E-.07
G1 X129.175 Y127.892 E-.09794
G1 X129.321 Y127.763 E-.10126
G1 X129.45 Y127.768 E-.06758
G1 X129.614 Y127.871 E-.10071
G1 X129.645 Y128.008 E-.07359
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/650
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
G3 Z8.2 I-1.118 J.481 P1  F30000
G1 X129.865 Y128.521 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.462 J-.522 E.08872
G1 X129.456 Y127.305 E.00242
G3 X129.908 Y128.479 I-.053 J.695 E.0521
G1 X130.138 Y128.8 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.124 Y128.813 E.00058
G3 X129.373 Y126.911 I-.724 J-.814 E.12863
G1 X129.479 Y126.913 E.00327
G3 X130.27 Y128.654 I-.079 J1.086 E.07173
G1 X130.178 Y128.755 E.0042
M204 S10000
G1 X129.646 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516867
G1 F1200
G1 X129.615 Y127.87 E.00548
G1 X129.45 Y127.767 E.00749
G1 X129.32 Y127.762 E.00503
G1 X129.174 Y127.891 E.00754
G1 X129.164 Y128.086 E.00753
G1 X129.284 Y128.22 E.00695
G1 X129.487 Y128.23 E.00785
G1 X129.601 Y128.15 E.00536
G1 X129.628 Y128.066 E.00343
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04605
G1 X129.487 Y128.23 E-.07185
G1 X129.284 Y128.22 E-.10533
G1 X129.164 Y128.086 E-.0933
G1 X129.174 Y127.891 E-.10096
G1 X129.32 Y127.762 E-.10108
G1 X129.45 Y127.767 E-.06748
G1 X129.615 Y127.87 E-.10049
G1 X129.646 Y128.009 E-.07345
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/650
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
G3 Z8.4 I-1.119 J.479 P1  F30000
G1 X129.865 Y128.521 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.462 J-.521 E.08873
G1 X129.456 Y127.305 E.00242
G3 X129.908 Y128.479 I-.053 J.695 E.0521
G1 X130.136 Y128.802 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.124 Y128.813 E.00048
G3 X129.373 Y126.911 I-.724 J-.813 E.12864
G1 X129.479 Y126.913 E.00327
G3 X130.27 Y128.654 I-.079 J1.086 E.07172
G1 X130.176 Y128.758 E.0043
M204 S10000
G1 X129.646 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517369
G1 F1200
G1 X129.614 Y127.87 E.00547
G1 X129.45 Y127.767 E.0075
G1 X129.32 Y127.762 E.00503
G1 X129.174 Y127.891 E.00754
G1 X129.165 Y128.086 E.00753
G1 X129.289 Y128.222 E.00714
G1 X129.486 Y128.23 E.00765
G1 X129.601 Y128.15 E.00539
G1 X129.627 Y128.066 E.00343
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04601
G1 X129.486 Y128.23 E-.07226
G1 X129.289 Y128.222 E-.10261
G1 X129.165 Y128.086 E-.0957
G1 X129.174 Y127.891 E-.10095
G1 X129.32 Y127.762 E-.10108
G1 X129.45 Y127.767 E-.06742
G1 X129.614 Y127.87 E-.10055
G1 X129.646 Y128.009 E-.07341
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/650
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
G3 Z8.6 I-1.119 J.479 P1  F30000
G1 X129.865 Y128.521 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.462 J-.521 E.08873
G1 X129.456 Y127.305 E.00242
G3 X129.908 Y128.479 I-.053 J.695 E.0521
G1 X130.134 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.124 Y128.813 E.00039
G3 X129.373 Y126.911 I-.724 J-.813 E.12864
G1 X129.479 Y126.913 E.00327
G3 X130.27 Y128.654 I-.079 J1.086 E.07172
G1 X130.174 Y128.76 E.00439
M204 S10000
G1 X129.645 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518303
G1 F1200
G1 X129.614 Y127.871 E.00547
G1 X129.45 Y127.768 E.0075
G1 X129.321 Y127.763 E.00502
G1 X129.175 Y127.891 E.00754
G1 X129.162 Y128.071 E.00695
G1 X129.297 Y128.223 E.00787
G1 X129.431 Y128.248 E.0053
G1 X129.6 Y128.15 E.00757
G1 X129.627 Y128.066 E.00343
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.6 Y128.15 E-.04595
G1 X129.431 Y128.248 E-.10161
G1 X129.297 Y128.223 E-.07105
G1 X129.162 Y128.071 E-.10555
G1 X129.175 Y127.891 E-.09328
G1 X129.321 Y127.763 E-.10111
G1 X129.45 Y127.768 E-.06735
G1 X129.614 Y127.871 E-.10067
G1 X129.645 Y128.009 E-.07342
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/650
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
G3 Z8.8 I-1.118 J.48 P1  F30000
G1 X129.865 Y128.521 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.462 J-.521 E.08873
G1 X129.456 Y127.305 E.00241
G3 X129.908 Y128.479 I-.053 J.695 E.0521
G1 X130.132 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.124 Y128.813 E.00031
G3 X129.373 Y126.911 I-.724 J-.813 E.12865
G1 X129.479 Y126.913 E.00326
G3 X130.27 Y128.654 I-.079 J1.086 E.07172
G1 X130.172 Y128.762 E.00447
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518298
G1 F1200
G1 X129.614 Y127.871 E.00547
G1 X129.45 Y127.768 E.00751
G1 X129.321 Y127.763 E.00502
G1 X129.175 Y127.891 E.00754
G1 X129.162 Y128.071 E.00695
G1 X129.297 Y128.223 E.00787
G1 X129.431 Y128.248 E.0053
G1 X129.6 Y128.15 E.00757
G1 X129.627 Y128.066 E.00342
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.15 E-.04594
G1 X129.431 Y128.248 E-.10162
G1 X129.297 Y128.223 E-.07106
G1 X129.162 Y128.071 E-.10555
G1 X129.175 Y127.891 E-.09328
G1 X129.321 Y127.763 E-.10112
G1 X129.45 Y127.768 E-.0673
G1 X129.614 Y127.871 E-.10072
G1 X129.645 Y128.008 E-.0734
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/650
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
G3 Z9 I-1.118 J.48 P1  F30000
G1 X129.865 Y128.521 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.463 J-.521 E.08874
G1 X129.456 Y127.305 E.00241
G3 X129.908 Y128.479 I-.053 J.695 E.05209
G1 X130.131 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.125 Y128.812 E.00024
G3 X129.373 Y126.911 I-.724 J-.813 E.12865
G1 X129.479 Y126.913 E.00326
G3 X130.27 Y128.654 I-.079 J1.086 E.07172
G1 X130.171 Y128.763 E.00454
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519139
G1 F1200
G1 X129.614 Y127.871 E.00547
G1 X129.45 Y127.768 E.00752
G1 X129.321 Y127.763 E.00501
G1 X129.175 Y127.892 E.00756
G1 X129.177 Y128.08 E.0073
G1 X129.244 Y128.195 E.00517
G1 X129.431 Y128.248 E.00753
G1 X129.6 Y128.15 E.00758
G1 X129.627 Y128.066 E.00342
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.15 E-.04596
G1 X129.431 Y128.248 E-.10185
G1 X129.244 Y128.195 E-.10118
G1 X129.177 Y128.08 E-.06947
G1 X129.175 Y127.892 E-.0981
G1 X129.321 Y127.763 E-.10157
G1 X129.45 Y127.768 E-.06734
G1 X129.614 Y127.871 E-.10101
G1 X129.645 Y128.008 E-.07352
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/650
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
G3 Z9.2 I-1.118 J.481 P1  F30000
G1 X129.865 Y128.521 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.463 J-.521 E.08874
G1 X129.455 Y127.305 E.0024
G3 X129.908 Y128.479 I-.053 J.695 E.05209
G1 X130.129 Y128.809 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.125 Y128.812 E.00018
G3 X129.373 Y126.911 I-.725 J-.813 E.12866
G1 X129.479 Y126.913 E.00325
G3 X130.27 Y128.654 I-.079 J1.086 E.07172
G1 X130.17 Y128.765 E.0046
M204 S10000
G1 X129.646 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516844
G1 F1200
G1 X129.615 Y127.87 E.00547
G1 X129.45 Y127.767 E.00751
G1 X129.32 Y127.762 E.00501
G1 X129.174 Y127.891 E.00754
G1 X129.164 Y128.086 E.00753
G1 X129.284 Y128.22 E.00696
G1 X129.487 Y128.23 E.00785
G1 X129.601 Y128.15 E.00536
G1 X129.628 Y128.066 E.00343
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04599
G1 X129.487 Y128.23 E-.07195
G1 X129.284 Y128.22 E-.10531
G1 X129.164 Y128.086 E-.0933
G1 X129.174 Y127.891 E-.10096
G1 X129.32 Y127.762 E-.10111
G1 X129.45 Y127.767 E-.06723
G1 X129.615 Y127.87 E-.10079
G1 X129.646 Y128.009 E-.07336
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/650
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
G3 Z9.4 I-1.119 J.479 P1  F30000
G1 X129.865 Y128.521 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.463 J-.521 E.08875
G1 X129.455 Y127.305 E.0024
G3 X129.908 Y128.479 I-.053 J.695 E.05209
G1 X130.128 Y128.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.125 Y128.812 E.00012
G3 X129.373 Y126.911 I-.725 J-.813 E.12866
G1 X129.479 Y126.913 E.00325
G3 X130.27 Y128.654 I-.079 J1.086 E.07172
G1 X130.169 Y128.766 E.00465
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518304
G1 F1200
G1 X129.614 Y127.871 E.00547
G1 X129.45 Y127.768 E.00752
G1 X129.321 Y127.763 E.00501
G1 X129.175 Y127.891 E.00754
G1 X129.162 Y128.071 E.00696
G1 X129.297 Y128.223 E.00786
G1 X129.431 Y128.248 E.0053
G1 X129.6 Y128.15 E.00758
G1 X129.627 Y128.066 E.00342
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.15 E-.04591
G1 X129.431 Y128.248 E-.10168
G1 X129.297 Y128.223 E-.07107
G1 X129.162 Y128.071 E-.10541
G1 X129.175 Y127.891 E-.09342
G1 X129.321 Y127.763 E-.10113
G1 X129.45 Y127.768 E-.06715
G1 X129.614 Y127.871 E-.1009
G1 X129.645 Y128.008 E-.07334
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/650
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
G3 Z9.6 I-1.118 J.481 P1  F30000
G1 X129.865 Y128.521 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.463 J-.521 E.08875
G1 X129.455 Y127.305 E.0024
G3 X129.909 Y128.479 I-.053 J.695 E.05209
G1 X130.127 Y128.811 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.125 Y128.812 E.00008
G3 X129.373 Y126.911 I-.725 J-.813 E.12867
G1 X129.479 Y126.913 E.00325
G3 X130.27 Y128.654 I-.079 J1.086 E.07172
G1 X130.168 Y128.767 E.0047
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517015
G1 F1200
G1 X129.615 Y127.87 E.00547
G1 X129.45 Y127.767 E.00752
G1 X129.32 Y127.762 E.005
G1 X129.174 Y127.891 E.00754
M73 P46 R7
G1 X129.164 Y128.086 E.00754
G1 X129.301 Y128.216 E.00729
G1 X129.431 Y128.249 E.00518
G1 X129.601 Y128.15 E.00758
G1 X129.628 Y128.066 E.00343
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04604
G1 X129.431 Y128.249 E-.10188
G1 X129.301 Y128.216 E-.06957
G1 X129.164 Y128.086 E-.09801
G1 X129.174 Y127.891 E-.10139
G1 X129.32 Y127.762 E-.10131
G1 X129.45 Y127.767 E-.06725
G1 X129.615 Y127.87 E-.1011
G1 X129.646 Y128.008 E-.07346
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/650
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
G3 Z9.8 I-1.118 J.48 P1  F30000
G1 X129.865 Y128.52 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.463 J-.521 E.08876
G1 X129.455 Y127.305 E.00239
G3 X129.909 Y128.479 I-.053 J.695 E.05209
G1 X130.125 Y128.812 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.725 J-.813 E.12867
G1 X129.479 Y126.913 E.00324
G3 X130.169 Y128.771 I-.079 J1.086 E.0765
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518294
G1 F1200
G1 X129.614 Y127.871 E.00547
G1 X129.45 Y127.767 E.00753
G1 X129.321 Y127.763 E.005
G1 X129.175 Y127.891 E.00754
G1 X129.162 Y128.071 E.00696
G1 X129.297 Y128.223 E.00786
G1 X129.431 Y128.248 E.0053
G1 X129.6 Y128.15 E.00758
G1 X129.627 Y128.066 E.00342
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.15 E-.04587
G1 X129.431 Y128.248 E-.1017
G1 X129.297 Y128.223 E-.07108
G1 X129.162 Y128.071 E-.1054
G1 X129.175 Y127.891 E-.09341
G1 X129.321 Y127.763 E-.10114
G1 X129.45 Y127.767 E-.06705
G1 X129.614 Y127.871 E-.10102
G1 X129.645 Y128.008 E-.07332
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/650
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
G3 Z10 I-1.118 J.481 P1  F30000
G1 X129.866 Y128.52 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.463 J-.521 E.08876
G1 X129.455 Y127.305 E.00239
G3 X129.909 Y128.479 I-.053 J.695 E.05208
G1 X130.125 Y128.812 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.725 J-.813 E.12868
G1 X129.478 Y126.913 E.00324
G3 X130.169 Y128.771 I-.078 J1.086 E.0765
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517008
G1 F1200
G1 X129.615 Y127.871 E.00546
G1 X129.45 Y127.767 E.00753
G1 X129.32 Y127.762 E.005
G1 X129.174 Y127.891 E.00754
G1 X129.164 Y128.086 E.00754
G1 X129.301 Y128.216 E.00729
G1 X129.431 Y128.249 E.00518
G1 X129.601 Y128.15 E.00758
G1 X129.628 Y128.066 E.00342
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04602
G1 X129.431 Y128.249 E-.1019
G1 X129.301 Y128.216 E-.06958
G1 X129.164 Y128.086 E-.098
G1 X129.174 Y127.891 E-.1014
G1 X129.32 Y127.762 E-.10132
G1 X129.45 Y127.767 E-.06716
G1 X129.615 Y127.871 E-.10121
G1 X129.646 Y128.008 E-.07343
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/650
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
G3 Z10.2 I-1.118 J.48 P1  F30000
G1 X129.866 Y128.52 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.463 J-.521 E.08877
G1 X129.455 Y127.305 E.00239
G3 X129.909 Y128.478 I-.052 J.695 E.05208
G1 X130.125 Y128.812 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.725 J-.813 E.12869
G1 X129.478 Y126.913 E.00324
G3 X130.169 Y128.771 I-.078 J1.086 E.07649
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519448
G1 F1200
G1 X129.614 Y127.871 E.00546
G1 X129.449 Y127.768 E.00754
G1 X129.321 Y127.763 E.00499
G1 X129.175 Y127.892 E.00754
G1 X129.176 Y128.079 E.00729
G1 X129.244 Y128.195 E.00522
G1 X129.431 Y128.248 E.00753
G1 X129.6 Y128.149 E.00758
G1 X129.626 Y128.066 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.149 E-.04587
G1 X129.431 Y128.248 E-.10191
G1 X129.244 Y128.195 E-.10117
G1 X129.176 Y128.079 E-.0701
G1 X129.175 Y127.892 E-.09791
G1 X129.321 Y127.763 E-.10127
G1 X129.449 Y127.768 E-.06702
G1 X129.614 Y127.871 E-.10136
G1 X129.645 Y128.008 E-.07339
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/650
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
G3 Z10.4 I-1.117 J.482 P1  F30000
G1 X129.866 Y128.52 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.463 J-.521 E.08877
G1 X129.455 Y127.305 E.00238
G3 X129.909 Y128.478 I-.052 J.695 E.05208
G1 X130.125 Y128.814 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.848 Y128.992 E.01013
G3 X129.373 Y126.911 I-.448 J-.993 E.11848
G1 X129.478 Y126.913 E.00323
G3 X130.167 Y128.772 I-.078 J1.086 E.07655
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516814
G1 F1200
G1 X129.615 Y127.871 E.00546
G1 X129.45 Y127.767 E.00754
G1 X129.32 Y127.762 E.00499
G1 X129.174 Y127.891 E.00754
G1 X129.164 Y128.086 E.00753
G1 X129.284 Y128.22 E.00696
G1 X129.487 Y128.23 E.00785
G1 X129.601 Y128.15 E.00537
G1 X129.628 Y128.066 E.00342
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04591
G1 X129.487 Y128.23 E-.07207
G1 X129.284 Y128.22 E-.10529
G1 X129.164 Y128.086 E-.0933
G1 X129.174 Y127.891 E-.10097
G1 X129.32 Y127.762 E-.10113
G1 X129.45 Y127.767 E-.06693
G1 X129.615 Y127.871 E-.10114
G1 X129.646 Y128.008 E-.07326
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/650
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
G3 Z10.6 I-1.118 J.48 P1  F30000
G1 X129.866 Y128.52 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.463 J-.521 E.08878
G1 X129.455 Y127.305 E.00238
G3 X129.909 Y128.478 I-.052 J.695 E.05208
G1 X130.124 Y128.814 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.848 Y128.992 E.01012
G3 X129.373 Y126.911 I-.448 J-.993 E.11848
G1 X129.478 Y126.913 E.00323
G3 X130.167 Y128.772 I-.078 J1.086 E.07656
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516853
G1 F1200
G1 X129.615 Y127.871 E.00546
G1 X129.449 Y127.767 E.00754
G1 X129.32 Y127.762 E.00499
G1 X129.174 Y127.891 E.00754
G1 X129.164 Y128.086 E.00753
G1 X129.285 Y128.22 E.00697
G1 X129.487 Y128.23 E.00783
G1 X129.601 Y128.15 E.00538
G1 X129.628 Y128.066 E.00342
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04589
G1 X129.487 Y128.23 E-.07211
G1 X129.285 Y128.22 E-.10503
G1 X129.164 Y128.086 E-.09357
G1 X129.174 Y127.891 E-.10095
G1 X129.32 Y127.762 E-.10115
G1 X129.449 Y127.767 E-.06688
G1 X129.615 Y127.871 E-.10119
G1 X129.646 Y128.008 E-.07325
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/650
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
G3 Z10.8 I-1.118 J.48 P1  F30000
G1 X129.866 Y128.52 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.463 J-.52 E.08878
G1 X129.455 Y127.305 E.00238
G3 X129.909 Y128.478 I-.052 J.695 E.05208
G1 X130.124 Y128.814 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.848 Y128.992 E.01011
G3 X129.373 Y126.911 I-.448 J-.993 E.11849
G1 X129.478 Y126.913 E.00322
G3 X130.167 Y128.772 I-.078 J1.086 E.07657
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519096
G1 F1200
G1 X129.614 Y127.871 E.00546
G1 X129.449 Y127.768 E.00755
G1 X129.321 Y127.763 E.00498
G1 X129.175 Y127.892 E.00756
G1 X129.177 Y128.08 E.0073
G1 X129.244 Y128.195 E.00517
G1 X129.431 Y128.248 E.00753
G1 X129.6 Y128.149 E.00759
G1 X129.627 Y128.066 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.149 E-.04585
G1 X129.431 Y128.248 E-.10198
G1 X129.244 Y128.195 E-.1012
G1 X129.177 Y128.08 E-.06947
G1 X129.175 Y127.892 E-.0981
G1 X129.321 Y127.763 E-.10162
G1 X129.449 Y127.768 E-.06688
G1 X129.614 Y127.871 E-.10154
G1 X129.645 Y128.008 E-.07336
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/650
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
G3 Z11 I-1.117 J.483 P1  F30000
G1 X129.866 Y128.52 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.463 J-.52 E.08879
G1 X129.455 Y127.305 E.00237
G3 X129.909 Y128.478 I-.052 J.695 E.05208
G1 X130.124 Y128.814 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.848 Y128.992 E.01011
G3 X129.373 Y126.911 I-.448 J-.993 E.11849
G1 X129.478 Y126.913 E.00322
G3 X130.167 Y128.772 I-.078 J1.086 E.07657
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519109
G1 F1200
G1 X129.614 Y127.871 E.00546
G1 X129.449 Y127.768 E.00756
G1 X129.321 Y127.763 E.00497
G1 X129.175 Y127.892 E.00756
G1 X129.177 Y128.08 E.0073
G1 X129.244 Y128.195 E.00517
G1 X129.431 Y128.248 E.00753
G1 X129.6 Y128.149 E.00759
G1 X129.627 Y128.066 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.149 E-.04583
G1 X129.431 Y128.248 E-.10199
G1 X129.244 Y128.195 E-.10119
G1 X129.177 Y128.08 E-.06951
G1 X129.175 Y127.892 E-.09808
G1 X129.321 Y127.763 E-.10161
G1 X129.449 Y127.768 E-.06683
G1 X129.614 Y127.871 E-.10161
G1 X129.645 Y128.008 E-.07334
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/650
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
G3 Z11.2 I-1.117 J.483 P1  F30000
G1 X129.866 Y128.52 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.463 J-.52 E.08879
G1 X129.454 Y127.305 E.00237
G3 X129.909 Y128.478 I-.052 J.695 E.05208
G1 X130.124 Y128.814 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.848 Y128.992 E.01011
G3 X129.373 Y126.911 I-.448 J-.993 E.11849
G1 X129.478 Y126.913 E.00322
G3 X130.167 Y128.772 I-.078 J1.086 E.07657
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519356
G1 F1200
G1 X129.614 Y127.871 E.00546
G1 X129.449 Y127.768 E.00756
G1 X129.321 Y127.763 E.00497
G1 X129.175 Y127.892 E.00754
G1 X129.177 Y128.079 E.00729
G1 X129.244 Y128.195 E.00521
G1 X129.431 Y128.248 E.00753
G1 X129.6 Y128.149 E.00759
G1 X129.627 Y128.066 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.149 E-.0458
G1 X129.431 Y128.248 E-.102
G1 X129.244 Y128.195 E-.10117
G1 X129.177 Y128.079 E-.06997
G1 X129.175 Y127.892 E-.09796
G1 X129.321 Y127.763 E-.10135
G1 X129.449 Y127.768 E-.06677
G1 X129.614 Y127.871 E-.10166
G1 X129.645 Y128.008 E-.07331
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/650
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
G3 Z11.4 I-1.117 J.483 P1  F30000
G1 X129.866 Y128.52 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.464 J-.52 E.0888
G1 X129.454 Y127.305 E.00237
G3 X129.909 Y128.478 I-.052 J.695 E.05207
G1 X130.124 Y128.814 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.848 Y128.992 E.01011
G3 X129.373 Y126.911 I-.448 J-.993 E.11849
G1 X129.478 Y126.913 E.00321
G3 X130.167 Y128.772 I-.078 J1.086 E.07657
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518252
G1 F1200
G1 X129.614 Y127.871 E.00545
G1 X129.449 Y127.767 E.00757
G1 X129.321 Y127.763 E.00497
G1 X129.175 Y127.891 E.00754
G1 X129.162 Y128.071 E.00696
G1 X129.297 Y128.223 E.00786
G1 X129.431 Y128.248 E.0053
G1 X129.6 Y128.15 E.00759
G1 X129.627 Y128.066 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.15 E-.04578
G1 X129.431 Y128.248 E-.10182
G1 X129.297 Y128.223 E-.07109
G1 X129.162 Y128.071 E-.10543
G1 X129.175 Y127.891 E-.09339
G1 X129.321 Y127.763 E-.10119
G1 X129.449 Y127.767 E-.06662
G1 X129.614 Y127.871 E-.10151
G1 X129.645 Y128.008 E-.07318
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/650
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
G3 Z11.6 I-1.117 J.482 P1  F30000
G1 X129.866 Y128.52 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.464 J-.52 E.0888
G1 X129.454 Y127.305 E.00236
G3 X129.909 Y128.478 I-.052 J.695 E.05207
G1 X130.124 Y128.814 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.848 Y128.992 E.01012
G3 X129.373 Y126.911 I-.448 J-.993 E.11849
G1 X129.477 Y126.913 E.00321
G3 X130.167 Y128.772 I-.078 J1.086 E.07656
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519095
G1 F1200
G1 X129.614 Y127.871 E.00545
G1 X129.449 Y127.768 E.00757
G1 X129.321 Y127.763 E.00496
M73 P47 R7
G1 X129.175 Y127.892 E.00756
G1 X129.177 Y128.08 E.0073
G1 X129.244 Y128.195 E.00517
G1 X129.431 Y128.248 E.00753
G1 X129.6 Y128.149 E.00759
G1 X129.627 Y128.066 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.6 Y128.149 E-.04579
G1 X129.431 Y128.248 E-.10204
G1 X129.244 Y128.195 E-.10118
G1 X129.177 Y128.08 E-.06954
G1 X129.175 Y127.892 E-.09807
G1 X129.321 Y127.763 E-.10162
G1 X129.449 Y127.768 E-.06668
G1 X129.614 Y127.871 E-.10178
G1 X129.645 Y128.008 E-.0733
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/650
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
G3 Z11.8 I-1.117 J.483 P1  F30000
G1 X129.866 Y128.52 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.464 J-.52 E.08881
G1 X129.454 Y127.305 E.00236
G3 X129.909 Y128.478 I-.052 J.695 E.05207
G1 X130.125 Y128.813 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.848 Y128.992 E.01013
G3 X129.373 Y126.911 I-.448 J-.993 E.11849
G1 X129.477 Y126.913 E.00321
G3 X130.167 Y128.772 I-.078 J1.086 E.07656
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516971
G1 F1200
G1 X129.615 Y127.871 E.00545
G1 X129.449 Y127.767 E.00757
G1 X129.32 Y127.762 E.00496
G1 X129.174 Y127.891 E.00754
G1 X129.164 Y128.086 E.00754
G1 X129.301 Y128.216 E.00729
G1 X129.431 Y128.249 E.00518
G1 X129.601 Y128.15 E.00759
G1 X129.628 Y128.066 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.0459
G1 X129.431 Y128.249 E-.10204
G1 X129.301 Y128.216 E-.06961
G1 X129.164 Y128.086 E-.09798
G1 X129.174 Y127.891 E-.1014
G1 X129.32 Y127.762 E-.10136
G1 X129.449 Y127.767 E-.06668
G1 X129.615 Y127.871 E-.10175
G1 X129.646 Y128.008 E-.07328
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/650
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
G3 Z12 I-1.118 J.482 P1  F30000
G1 X129.866 Y128.52 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.464 J-.52 E.08881
G1 X129.454 Y127.305 E.00236
G3 X129.909 Y128.478 I-.052 J.695 E.05207
G1 X130.125 Y128.813 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.848 Y128.992 E.01014
G3 X129.373 Y126.911 I-.448 J-.993 E.11849
G1 X129.477 Y126.913 E.0032
G3 X130.168 Y128.771 I-.078 J1.086 E.07655
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517281
G1 F1200
G1 X129.615 Y127.871 E.00545
G1 X129.449 Y127.767 E.00758
G1 X129.321 Y127.762 E.00496
G1 X129.174 Y127.891 E.00754
G1 X129.164 Y128.086 E.00753
G1 X129.289 Y128.222 E.00714
G1 X129.486 Y128.23 E.00764
G1 X129.601 Y128.15 E.00541
G1 X129.628 Y128.066 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04578
G1 X129.486 Y128.23 E-.07262
G1 X129.289 Y128.222 E-.10254
G1 X129.164 Y128.086 E-.09572
G1 X129.174 Y127.891 E-.10095
G1 X129.321 Y127.762 E-.10117
G1 X129.449 Y127.767 E-.06648
G1 X129.615 Y127.871 E-.10163
G1 X129.646 Y128.008 E-.07311
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/650
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
G3 Z12.2 I-1.117 J.482 P1  F30000
G1 X129.866 Y128.52 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.464 J-.52 E.08882
G1 X129.454 Y127.305 E.00235
G3 X129.909 Y128.478 I-.052 J.695 E.05207
G1 X130.125 Y128.813 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.848 Y128.992 E.01015
G3 X129.373 Y126.911 I-.448 J-.993 E.1185
G1 X129.477 Y126.913 E.0032
G3 X130.168 Y128.771 I-.077 J1.086 E.07654
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51677
G1 F1200
G1 X129.615 Y127.871 E.00545
G1 X129.449 Y127.767 E.00758
G1 X129.32 Y127.762 E.00495
G1 X129.174 Y127.891 E.00754
G1 X129.164 Y128.086 E.00753
G1 X129.284 Y128.22 E.00696
G1 X129.487 Y128.23 E.00785
G1 X129.601 Y128.15 E.00539
G1 X129.628 Y128.066 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04579
G1 X129.487 Y128.23 E-.07226
G1 X129.284 Y128.22 E-.10525
G1 X129.164 Y128.086 E-.09331
G1 X129.174 Y127.891 E-.10096
G1 X129.32 Y127.762 E-.10118
G1 X129.449 Y127.767 E-.06647
G1 X129.615 Y127.871 E-.10167
G1 X129.646 Y128.008 E-.07311
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/650
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
G3 Z12.4 I-1.118 J.482 P1  F30000
G1 X129.866 Y128.519 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.464 J-.52 E.08882
G1 X129.454 Y127.305 E.00235
G3 X129.909 Y128.478 I-.052 J.695 E.05207
G1 X130.125 Y128.813 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.848 Y128.992 E.01016
G3 X129.373 Y126.911 I-.448 J-.993 E.1185
G1 X129.477 Y126.913 E.0032
G3 X130.168 Y128.771 I-.077 J1.086 E.07654
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51681
G1 F1200
G1 X129.615 Y127.871 E.00545
G1 X129.449 Y127.767 E.00758
G1 X129.32 Y127.762 E.00495
G1 X129.174 Y127.891 E.00754
G1 X129.164 Y128.086 E.00753
G1 X129.285 Y128.22 E.00697
G1 X129.487 Y128.23 E.00783
G1 X129.601 Y128.15 E.00539
G1 X129.628 Y128.066 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04578
G1 X129.487 Y128.23 E-.07229
G1 X129.285 Y128.22 E-.105
G1 X129.164 Y128.086 E-.09356
G1 X129.174 Y127.891 E-.10096
G1 X129.32 Y127.762 E-.10118
G1 X129.449 Y127.767 E-.06642
G1 X129.615 Y127.871 E-.10172
G1 X129.646 Y128.008 E-.0731
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/650
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
G3 Z12.6 I-1.117 J.482 P1  F30000
G1 X129.866 Y128.519 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.464 J-.52 E.08883
G1 X129.454 Y127.305 E.00234
G3 X129.909 Y128.477 I-.052 J.695 E.05206
G1 X130.126 Y128.812 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.848 Y128.992 E.01017
G3 X129.373 Y126.911 I-.448 J-.993 E.1185
G1 X129.477 Y126.913 E.00319
G3 X130.168 Y128.771 I-.077 J1.086 E.07653
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516956
G1 F1200
G1 X129.615 Y127.871 E.00545
G1 X129.448 Y127.767 E.00759
G1 X129.321 Y127.762 E.00495
G1 X129.174 Y127.891 E.00754
G1 X129.164 Y128.086 E.00754
G1 X129.301 Y128.216 E.00729
G1 X129.431 Y128.249 E.00518
G1 X129.601 Y128.15 E.0076
G1 X129.628 Y128.066 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04584
G1 X129.431 Y128.249 E-.10209
G1 X129.301 Y128.216 E-.06964
G1 X129.164 Y128.086 E-.09795
G1 X129.174 Y127.891 E-.10141
G1 X129.321 Y127.762 E-.10139
G1 X129.448 Y127.767 E-.06646
G1 X129.615 Y127.871 E-.10199
G1 X129.646 Y128.008 E-.07322
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/650
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
G3 Z12.8 I-1.117 J.482 P1  F30000
G1 X129.866 Y128.519 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.464 J-.52 E.08883
G1 X129.454 Y127.305 E.00234
G3 X129.909 Y128.477 I-.051 J.695 E.05206
G1 X130.126 Y128.811 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.727 J-.811 E.12876
G1 X129.477 Y126.913 E.00319
G3 X130.17 Y128.769 I-.077 J1.086 E.07647
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516754
G1 F1200
G1 X129.615 Y127.871 E.00545
G1 X129.448 Y127.766 E.00759
G1 X129.32 Y127.762 E.00494
G1 X129.174 Y127.891 E.00754
G1 X129.164 Y128.086 E.00753
G1 X129.284 Y128.22 E.00696
G1 X129.487 Y128.23 E.00784
G1 X129.601 Y128.15 E.00539
G1 X129.628 Y128.066 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04577
G1 X129.487 Y128.23 E-.07231
G1 X129.284 Y128.22 E-.10524
G1 X129.164 Y128.086 E-.0933
G1 X129.174 Y127.891 E-.10097
G1 X129.32 Y127.762 E-.1012
G1 X129.448 Y127.766 E-.0663
G1 X129.615 Y127.871 E-.10185
G1 X129.646 Y128.008 E-.07306
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/650
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
G3 Z13 I-1.117 J.482 P1  F30000
G1 X129.866 Y128.519 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.464 J-.52 E.08884
G1 X129.454 Y127.305 E.00234
G3 X129.909 Y128.477 I-.051 J.695 E.05206
G1 X130.126 Y128.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.727 J-.811 E.12876
G1 X129.477 Y126.913 E.00318
G3 X130.17 Y128.769 I-.077 J1.086 E.07647
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518213
G1 F1200
G1 X129.614 Y127.871 E.00544
G1 X129.448 Y127.767 E.0076
G1 X129.321 Y127.763 E.00494
G1 X129.175 Y127.891 E.00754
G1 X129.162 Y128.071 E.00696
G1 X129.297 Y128.223 E.00786
G1 X129.431 Y128.248 E.0053
G1 X129.601 Y128.149 E.0076
G1 X129.627 Y128.066 E.0034
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.04567
G1 X129.431 Y128.248 E-.10195
G1 X129.297 Y128.223 E-.07109
G1 X129.162 Y128.071 E-.10545
G1 X129.175 Y127.891 E-.09338
G1 X129.321 Y127.763 E-.10122
G1 X129.448 Y127.767 E-.06623
G1 X129.614 Y127.871 E-.10197
G1 X129.645 Y128.008 E-.07304
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/650
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
G3 Z13.2 I-1.117 J.484 P1  F30000
G1 X129.866 Y128.519 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.464 J-.52 E.08884
G1 X129.453 Y127.305 E.00233
G3 X129.91 Y128.477 I-.051 J.695 E.05206
G1 X130.126 Y128.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.727 J-.811 E.12877
G1 X129.476 Y126.913 E.00318
G3 X130.17 Y128.769 I-.077 J1.086 E.07647
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519296
G1 F1200
G1 X129.614 Y127.872 E.00544
G1 X129.448 Y127.768 E.00761
G1 X129.321 Y127.763 E.00493
G1 X129.175 Y127.892 E.00755
G1 X129.177 Y128.079 E.00729
G1 X129.244 Y128.195 E.00521
G1 X129.431 Y128.248 E.00753
G1 X129.6 Y128.149 E.0076
G1 X129.627 Y128.066 E.0034
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.149 E-.04568
G1 X129.431 Y128.248 E-.10214
G1 X129.244 Y128.195 E-.10118
G1 X129.177 Y128.079 E-.06995
G1 X129.175 Y127.892 E-.09797
G1 X129.321 Y127.763 E-.10141
G1 X129.448 Y127.768 E-.06625
G1 X129.614 Y127.872 E-.10225
G1 X129.645 Y128.008 E-.07315
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/650
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
G3 Z13.4 I-1.116 J.485 P1  F30000
G1 X129.867 Y128.519 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.464 J-.519 E.08885
G1 X129.453 Y127.305 E.00233
G3 X129.91 Y128.477 I-.051 J.695 E.05206
G1 X130.126 Y128.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.727 J-.811 E.12877
G1 X129.476 Y126.913 E.00318
G3 X130.17 Y128.769 I-.077 J1.086 E.07646
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517129
G1 F1200
G1 X129.615 Y127.871 E.00544
G1 X129.448 Y127.767 E.00761
G1 X129.321 Y127.762 E.00493
G1 X129.174 Y127.891 E.00754
G1 X129.164 Y128.086 E.00753
G1 X129.288 Y128.222 E.00709
G1 X129.486 Y128.23 E.00769
G1 X129.601 Y128.15 E.00542
G1 X129.628 Y128.066 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.0457
G1 X129.486 Y128.23 E-.07266
G1 X129.288 Y128.222 E-.10315
G1 X129.164 Y128.086 E-.09516
G1 X129.174 Y127.891 E-.10096
G1 X129.321 Y127.762 E-.1012
G1 X129.448 Y127.767 E-.06614
G1 X129.615 Y127.871 E-.10203
G1 X129.646 Y128.008 E-.07301
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/650
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
G3 Z13.6 I-1.117 J.483 P1  F30000
G1 X129.867 Y128.519 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.465 J-.519 E.08885
G1 X129.453 Y127.305 E.00233
G3 X129.91 Y128.477 I-.051 J.695 E.05206
G1 X130.127 Y128.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.727 J-.811 E.12878
G1 X129.476 Y126.913 E.00317
G3 X130.17 Y128.769 I-.077 J1.086 E.07646
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518197
G1 F1200
G1 X129.614 Y127.871 E.00544
G1 X129.448 Y127.767 E.00761
G1 X129.321 Y127.763 E.00492
M73 P48 R7
G1 X129.175 Y127.891 E.00755
G1 X129.162 Y128.071 E.00696
G1 X129.297 Y128.223 E.00786
G1 X129.431 Y128.248 E.0053
G1 X129.601 Y128.149 E.0076
G1 X129.627 Y128.066 E.0034
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.04564
G1 X129.431 Y128.248 E-.102
G1 X129.297 Y128.223 E-.07109
G1 X129.162 Y128.071 E-.10546
G1 X129.175 Y127.891 E-.09337
G1 X129.321 Y127.763 E-.10123
G1 X129.448 Y127.767 E-.06606
G1 X129.614 Y127.871 E-.10215
G1 X129.645 Y128.008 E-.07299
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/650
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
G3 Z13.8 I-1.117 J.484 P1  F30000
G1 X129.867 Y128.519 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.465 J-.519 E.08886
G1 X129.453 Y127.305 E.00232
G3 X129.91 Y128.477 I-.051 J.695 E.05206
G1 X130.127 Y128.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.727 J-.811 E.12878
G1 X129.476 Y126.913 E.00317
G3 X130.17 Y128.769 I-.077 J1.086 E.07646
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518192
G1 F1200
G1 X129.614 Y127.871 E.00544
G1 X129.448 Y127.767 E.00762
G1 X129.321 Y127.763 E.00492
G1 X129.175 Y127.891 E.00755
G1 X129.162 Y128.071 E.00696
G1 X129.297 Y128.223 E.00786
G1 X129.431 Y128.248 E.0053
G1 X129.601 Y128.149 E.0076
G1 X129.627 Y128.066 E.0034
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.04563
G1 X129.431 Y128.248 E-.10202
G1 X129.297 Y128.223 E-.07109
G1 X129.162 Y128.071 E-.10546
G1 X129.175 Y127.891 E-.09337
G1 X129.321 Y127.763 E-.10124
G1 X129.448 Y127.767 E-.06601
G1 X129.614 Y127.871 E-.10222
G1 X129.645 Y128.008 E-.07297
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/650
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
G3 Z14 I-1.116 J.484 P1  F30000
G1 X129.867 Y128.519 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.465 J-.519 E.08886
G1 X129.453 Y127.305 E.00232
G3 X129.91 Y128.477 I-.051 J.695 E.05206
G1 X130.127 Y128.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.727 J-.811 E.12879
G1 X129.476 Y126.913 E.00317
G3 X130.17 Y128.769 I-.077 J1.086 E.07646
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518188
G1 F1200
G1 X129.615 Y127.871 E.00544
G1 X129.448 Y127.767 E.00762
G1 X129.321 Y127.763 E.00492
G1 X129.175 Y127.891 E.00755
G1 X129.162 Y128.071 E.00696
G1 X129.297 Y128.223 E.00786
G1 X129.431 Y128.248 E.0053
G1 X129.601 Y128.149 E.0076
G1 X129.627 Y128.066 E.0034
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.04563
G1 X129.431 Y128.248 E-.10202
G1 X129.297 Y128.223 E-.07109
G1 X129.162 Y128.071 E-.10546
G1 X129.175 Y127.891 E-.09336
G1 X129.321 Y127.763 E-.10125
G1 X129.448 Y127.767 E-.06594
G1 X129.615 Y127.871 E-.10229
G1 X129.645 Y128.008 E-.07295
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/650
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
G3 Z14.2 I-1.116 J.485 P1  F30000
G1 X129.867 Y128.519 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.465 J-.519 E.08887
G1 X129.453 Y127.305 E.00232
G3 X129.91 Y128.477 I-.051 J.695 E.05205
G1 X130.127 Y128.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.727 J-.81 E.1288
G1 X129.476 Y126.913 E.00316
G3 X130.17 Y128.769 I-.077 J1.086 E.07646
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519014
G1 F1200
G1 X129.614 Y127.872 E.00544
G1 X129.447 Y127.767 E.00763
G1 X129.321 Y127.763 E.00491
G1 X129.175 Y127.892 E.00757
G1 X129.177 Y128.08 E.0073
G1 X129.244 Y128.195 E.00517
G1 X129.431 Y128.248 E.00753
G1 X129.6 Y128.149 E.00761
G1 X129.627 Y128.066 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.149 E-.04563
G1 X129.431 Y128.248 E-.10224
G1 X129.244 Y128.195 E-.1012
G1 X129.177 Y128.08 E-.06948
G1 X129.175 Y127.892 E-.09811
G1 X129.321 Y127.763 E-.10171
G1 X129.447 Y127.767 E-.06599
G1 X129.614 Y127.872 E-.10255
G1 X129.645 Y128.008 E-.07309
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/650
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
G3 Z14.4 I-1.116 J.485 P1  F30000
G1 X129.867 Y128.519 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.465 J-.519 E.08887
G1 X129.453 Y127.305 E.00231
G3 X129.91 Y128.477 I-.051 J.695 E.05205
G1 X130.127 Y128.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.728 J-.81 E.1288
G1 X129.476 Y126.913 E.00316
G3 X130.17 Y128.768 I-.076 J1.086 E.07645
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516718
G1 F1200
G1 X129.615 Y127.871 E.00544
G1 X129.448 Y127.766 E.00763
G1 X129.321 Y127.762 E.00491
G1 X129.174 Y127.891 E.00755
G1 X129.164 Y128.086 E.00753
G1 X129.284 Y128.22 E.00696
G1 X129.487 Y128.23 E.00784
G1 X129.601 Y128.15 E.0054
G1 X129.628 Y128.066 E.0034
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.04566
G1 X129.487 Y128.23 E-.07247
G1 X129.284 Y128.22 E-.10521
G1 X129.164 Y128.086 E-.09331
G1 X129.174 Y127.891 E-.10097
G1 X129.321 Y127.762 E-.10123
G1 X129.448 Y127.766 E-.06591
G1 X129.615 Y127.871 E-.10231
G1 X129.646 Y128.008 E-.07293
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/650
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
G3 Z14.6 I-1.117 J.484 P1  F30000
G1 X129.867 Y128.519 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.465 J-.519 E.08888
G1 X129.453 Y127.305 E.00231
G3 X129.91 Y128.477 I-.051 J.695 E.05205
G1 X130.127 Y128.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.728 J-.81 E.12881
G1 X129.476 Y126.913 E.00315
G3 X130.17 Y128.768 I-.076 J1.086 E.07645
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518173
G1 F1200
G1 X129.615 Y127.871 E.00543
G1 X129.447 Y127.767 E.00764
G1 X129.321 Y127.763 E.0049
G1 X129.175 Y127.891 E.00755
G1 X129.162 Y128.071 E.00696
G1 X129.297 Y128.223 E.00786
G1 X129.431 Y128.248 E.0053
G1 X129.601 Y128.149 E.00761
G1 X129.627 Y128.066 E.0034
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.04558
G1 X129.431 Y128.248 E-.10207
G1 X129.297 Y128.223 E-.0711
G1 X129.162 Y128.071 E-.10546
G1 X129.175 Y127.891 E-.09336
G1 X129.321 Y127.763 E-.10126
G1 X129.447 Y127.767 E-.06579
G1 X129.615 Y127.871 E-.10246
G1 X129.645 Y128.008 E-.07291
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/650
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
G3 Z14.8 I-1.116 J.485 P1  F30000
G1 X129.867 Y128.518 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.465 J-.519 E.08888
G1 X129.453 Y127.305 E.00231
G3 X129.91 Y128.477 I-.051 J.695 E.05205
G1 X130.127 Y128.81 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.728 J-.81 E.12881
G1 X129.476 Y126.913 E.00315
G3 X130.171 Y128.768 I-.076 J1.086 E.07645
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51925
G1 F1200
G1 X129.614 Y127.872 E.00543
G1 X129.447 Y127.767 E.00764
G1 X129.321 Y127.763 E.0049
G1 X129.175 Y127.892 E.00755
G1 X129.177 Y128.08 E.00729
G1 X129.244 Y128.195 E.0052
G1 X129.431 Y128.248 E.00753
G1 X129.6 Y128.149 E.00761
G1 X129.627 Y128.066 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.149 E-.04558
G1 X129.431 Y128.248 E-.10228
G1 X129.244 Y128.195 E-.10119
G1 X129.177 Y128.08 E-.06994
G1 X129.175 Y127.892 E-.09797
G1 X129.321 Y127.763 E-.10147
G1 X129.447 Y127.767 E-.06583
G1 X129.614 Y127.872 E-.10272
G1 X129.645 Y128.008 E-.07303
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/650
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
G3 Z15 I-1.116 J.486 P1  F30000
G1 X129.867 Y128.518 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.465 J-.519 E.08889
G1 X129.453 Y127.305 E.0023
G3 X129.91 Y128.476 I-.051 J.695 E.05205
G1 X130.127 Y128.809 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.728 J-.81 E.12882
G1 X129.475 Y126.913 E.00315
G3 X130.171 Y128.768 I-.076 J1.086 E.07645
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516911
G1 F1200
G1 X129.615 Y127.871 E.00543
G1 X129.447 Y127.766 E.00764
G1 X129.321 Y127.762 E.0049
G1 X129.174 Y127.891 E.00755
G1 X129.164 Y128.086 E.00754
G1 X129.301 Y128.216 E.00729
G1 X129.431 Y128.249 E.00518
G1 X129.601 Y128.15 E.00761
G1 X129.628 Y128.066 E.0034
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.15 E-.0457
G1 X129.431 Y128.249 E-.10227
G1 X129.301 Y128.216 E-.06968
G1 X129.164 Y128.086 E-.09792
G1 X129.174 Y127.891 E-.10141
G1 X129.321 Y127.762 E-.10145
G1 X129.447 Y127.766 E-.06585
G1 X129.615 Y127.871 E-.10271
G1 X129.646 Y128.008 E-.07302
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/650
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
G3 Z15.2 I-1.116 J.484 P1  F30000
G1 X129.867 Y128.518 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.465 J-.519 E.08889
G1 X129.453 Y127.305 E.0023
G3 X129.91 Y128.476 I-.051 J.695 E.05205
G1 X130.127 Y128.809 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.728 J-.81 E.12882
G1 X129.475 Y126.913 E.00314
G3 X130.171 Y128.768 I-.076 J1.086 E.07645
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519004
G1 F1200
G1 X129.614 Y127.872 E.00543
G1 X129.447 Y127.767 E.00765
G1 X129.321 Y127.763 E.00489
G1 X129.175 Y127.892 E.00757
G1 X129.177 Y128.08 E.00729
G1 X129.244 Y128.195 E.00518
G1 X129.431 Y128.248 E.00753
G1 X129.601 Y128.149 E.00761
G1 X129.627 Y128.066 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.04557
G1 X129.431 Y128.248 E-.10231
G1 X129.244 Y128.195 E-.1012
G1 X129.177 Y128.08 E-.06958
G1 X129.175 Y127.892 E-.09802
G1 X129.321 Y127.763 E-.10173
G1 X129.447 Y127.767 E-.06573
G1 X129.614 Y127.872 E-.10286
G1 X129.645 Y128.008 E-.07299
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/650
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
G3 Z15.4 I-1.116 J.486 P1  F30000
G1 X129.867 Y128.518 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.465 J-.519 E.0889
G1 X129.452 Y127.305 E.0023
G3 X129.91 Y128.476 I-.051 J.695 E.05204
G1 X130.127 Y128.809 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.728 J-.81 E.12883
G1 X129.475 Y126.913 E.00314
G3 X130.171 Y128.768 I-.076 J1.086 E.07645
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519322
G1 F1200
G1 X129.614 Y127.872 E.00543
G1 X129.447 Y127.767 E.00766
G1 X129.321 Y127.763 E.00489
G1 X129.175 Y127.892 E.00755
G1 X129.176 Y128.079 E.00729
G1 X129.244 Y128.195 E.00522
G1 X129.431 Y128.248 E.00753
G1 X129.6 Y128.149 E.00761
G1 X129.627 Y128.066 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.6 Y128.149 E-.04554
G1 X129.431 Y128.248 E-.10231
G1 X129.244 Y128.195 E-.10119
G1 X129.176 Y128.079 E-.0701
G1 X129.175 Y127.892 E-.09792
G1 X129.321 Y127.763 E-.10141
G1 X129.447 Y127.767 E-.06565
G1 X129.614 Y127.872 E-.10292
G1 X129.645 Y128.008 E-.07296
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/650
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
G3 Z15.6 I-1.115 J.487 P1  F30000
G1 X129.867 Y128.518 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P49 R7
G1 F1200
G3 X129.383 Y127.303 I-.465 J-.519 E.0889
G1 X129.452 Y127.305 E.00229
G3 X129.91 Y128.476 I-.05 J.695 E.05204
G1 X130.127 Y128.809 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.728 J-.81 E.12883
G1 X129.475 Y126.913 E.00314
G3 X130.171 Y128.768 I-.076 J1.086 E.07644
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518144
G1 F1200
G1 X129.615 Y127.872 E.00543
G1 X129.447 Y127.767 E.00766
G1 X129.321 Y127.763 E.00488
G1 X129.175 Y127.891 E.00755
G1 X129.162 Y128.071 E.00696
G1 X129.297 Y128.223 E.00786
G1 X129.431 Y128.248 E.0053
G1 X129.601 Y128.149 E.00761
G1 X129.627 Y128.066 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.04552
G1 X129.431 Y128.248 E-.10215
G1 X129.297 Y128.223 E-.0711
G1 X129.162 Y128.071 E-.10548
G1 X129.175 Y127.891 E-.09335
G1 X129.321 Y127.763 E-.10128
G1 X129.447 Y127.767 E-.06554
G1 X129.615 Y127.872 E-.10275
G1 X129.645 Y128.008 E-.07283
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/650
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
G3 Z15.8 I-1.116 J.486 P1  F30000
G1 X129.867 Y128.518 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.465 J-.519 E.08891
G1 X129.452 Y127.305 E.00229
G3 X129.91 Y128.476 I-.05 J.695 E.05204
G1 X130.127 Y128.809 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.728 J-.81 E.12884
G1 X129.475 Y126.913 E.00313
G3 X130.171 Y128.768 I-.076 J1.086 E.07644
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516893
G1 F1200
G1 X129.615 Y127.871 E.00543
G1 X129.447 Y127.766 E.00766
G1 X129.321 Y127.762 E.00488
G1 X129.174 Y127.891 E.00755
G1 X129.164 Y128.086 E.00755
G1 X129.301 Y128.216 E.00728
G1 X129.431 Y128.249 E.00518
G1 X129.601 Y128.149 E.00761
G1 X129.628 Y128.066 E.0034
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.04567
G1 X129.431 Y128.249 E-.10233
G1 X129.301 Y128.216 E-.06969
G1 X129.164 Y128.086 E-.09792
G1 X129.174 Y127.891 E-.10141
G1 X129.321 Y127.762 E-.10147
G1 X129.447 Y127.766 E-.06563
G1 X129.615 Y127.871 E-.10296
G1 X129.646 Y128.008 E-.07293
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/650
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
G3 Z16 I-1.116 J.485 P1  F30000
G1 X129.867 Y128.518 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.466 J-.518 E.08891
G1 X129.452 Y127.305 E.00229
G3 X129.91 Y128.476 I-.05 J.695 E.05204
G1 X130.128 Y128.809 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.728 J-.81 E.12884
G1 X129.475 Y126.913 E.00313
G3 X130.171 Y128.768 I-.076 J1.086 E.07644
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516869
G1 F1200
G1 X129.615 Y127.871 E.00543
G1 X129.447 Y127.766 E.00766
G1 X129.321 Y127.762 E.00488
G1 X129.174 Y127.891 E.00755
G1 X129.164 Y128.086 E.00755
G1 X129.301 Y128.216 E.00729
G1 X129.431 Y128.249 E.00518
G1 X129.601 Y128.149 E.00761
G1 X129.628 Y128.066 E.0034
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.04565
G1 X129.431 Y128.249 E-.10236
G1 X129.301 Y128.216 E-.06958
G1 X129.164 Y128.086 E-.09801
G1 X129.174 Y127.891 E-.10142
G1 X129.321 Y127.762 E-.10148
G1 X129.447 Y127.766 E-.06558
G1 X129.615 Y127.871 E-.103
G1 X129.646 Y128.008 E-.07293
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/650
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
G3 Z16.2 I-1.116 J.485 P1  F30000
G1 X129.867 Y128.518 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.466 J-.518 E.08892
G1 X129.452 Y127.305 E.00228
G3 X129.91 Y128.476 I-.05 J.695 E.05204
G1 X130.128 Y128.809 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.729 J-.809 E.12885
G1 X129.475 Y126.913 E.00312
G3 X130.171 Y128.767 I-.076 J1.086 E.07644
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5193
G1 F1200
G1 X129.614 Y127.872 E.00542
G1 X129.446 Y127.767 E.00767
G1 X129.321 Y127.763 E.00487
G1 X129.175 Y127.892 E.00755
G1 X129.176 Y128.079 E.00729
G1 X129.244 Y128.195 E.00522
G1 X129.431 Y128.248 E.00753
G1 X129.6 Y128.149 E.00762
G1 X129.627 Y128.065 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.6 Y128.149 E-.04549
G1 X129.431 Y128.248 E-.10237
G1 X129.244 Y128.195 E-.10119
G1 X129.176 Y128.079 E-.07012
G1 X129.175 Y127.892 E-.09792
G1 X129.321 Y127.763 E-.10142
G1 X129.446 Y127.767 E-.06545
G1 X129.614 Y127.872 E-.10315
G1 X129.645 Y128.008 E-.0729
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/650
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
G3 Z16.4 I-1.115 J.487 P1  F30000
G1 X129.868 Y128.518 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.466 J-.518 E.08892
G1 X129.452 Y127.305 E.00228
G3 X129.91 Y128.476 I-.05 J.695 E.05204
G1 X130.128 Y128.809 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.729 J-.809 E.12886
G1 X129.475 Y126.913 E.00312
G3 X130.171 Y128.767 I-.076 J1.086 E.07644
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518124
G1 F1200
G1 X129.615 Y127.872 E.00542
G1 X129.447 Y127.767 E.00768
G1 X129.321 Y127.763 E.00487
G1 X129.175 Y127.891 E.00755
G1 X129.162 Y128.071 E.00696
G1 X129.297 Y128.223 E.00786
G1 X129.431 Y128.248 E.0053
G1 X129.601 Y128.149 E.00762
G1 X129.627 Y128.066 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.04547
G1 X129.431 Y128.248 E-.10221
G1 X129.297 Y128.223 E-.0711
G1 X129.162 Y128.071 E-.10549
G1 X129.175 Y127.891 E-.09334
G1 X129.321 Y127.763 E-.10131
G1 X129.447 Y127.767 E-.06533
G1 X129.615 Y127.872 E-.103
G1 X129.645 Y128.008 E-.07275
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/650
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
G3 Z16.6 I-1.116 J.486 P1  F30000
G1 X129.868 Y128.518 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.466 J-.518 E.08893
G1 X129.452 Y127.305 E.00228
G3 X129.91 Y128.476 I-.05 J.695 E.05204
G1 X130.128 Y128.809 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.729 J-.809 E.12886
G1 X129.474 Y126.913 E.00312
G3 X130.171 Y128.767 I-.075 J1.086 E.07643
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519196
G1 F1200
G1 X129.614 Y127.872 E.00542
G1 X129.446 Y127.767 E.00768
G1 X129.321 Y127.763 E.00486
G1 X129.175 Y127.892 E.00755
G1 X129.177 Y128.08 E.00729
G1 X129.244 Y128.195 E.0052
G1 X129.431 Y128.248 E.00753
G1 X129.601 Y128.149 E.00762
G1 X129.627 Y128.065 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.04547
G1 X129.431 Y128.248 E-.10241
G1 X129.244 Y128.195 E-.10119
G1 X129.177 Y128.08 E-.06994
G1 X129.175 Y127.892 E-.09797
G1 X129.321 Y127.763 E-.10153
G1 X129.446 Y127.767 E-.06534
G1 X129.614 Y127.872 E-.10328
G1 X129.645 Y128.008 E-.07286
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/650
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
G3 Z16.8 I-1.115 J.488 P1  F30000
G1 X129.868 Y128.518 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.466 J-.518 E.08893
G1 X129.452 Y127.305 E.00227
G3 X129.91 Y128.476 I-.05 J.695 E.05203
G1 X130.128 Y128.809 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.729 J-.809 E.12887
G1 X129.474 Y126.913 E.00311
G3 X130.171 Y128.767 I-.075 J1.086 E.07643
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516654
G1 F1200
G1 X129.615 Y127.871 E.00542
G1 X129.447 Y127.766 E.00768
G1 X129.321 Y127.762 E.00486
G1 X129.174 Y127.891 E.00755
G1 X129.164 Y128.086 E.00753
G1 X129.284 Y128.22 E.00695
G1 X129.487 Y128.23 E.00784
G1 X129.602 Y128.149 E.00542
G1 X129.628 Y128.066 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.602 Y128.149 E-.04552
G1 X129.487 Y128.23 E-.07271
G1 X129.284 Y128.22 E-.10517
G1 X129.164 Y128.086 E-.09331
G1 X129.174 Y127.891 E-.10097
G1 X129.321 Y127.762 E-.1013
G1 X129.447 Y127.766 E-.06526
G1 X129.615 Y127.871 E-.10305
G1 X129.646 Y128.008 E-.07273
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/650
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
G3 Z17 I-1.116 J.485 P1  F30000
G1 X129.868 Y128.518 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.466 J-.518 E.08894
G1 X129.452 Y127.305 E.00227
G3 X129.911 Y128.476 I-.05 J.695 E.05203
G1 X130.128 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.729 J-.809 E.12887
G1 X129.474 Y126.913 E.00311
G3 X130.171 Y128.767 I-.075 J1.086 E.07643
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516651
G1 F1200
G1 X129.615 Y127.871 E.00542
G1 X129.446 Y127.766 E.00768
G1 X129.321 Y127.762 E.00486
G1 X129.174 Y127.891 E.00755
G1 X129.164 Y128.086 E.00753
G1 X129.284 Y128.22 E.00696
G1 X129.487 Y128.23 E.00784
G1 X129.602 Y128.149 E.00542
G1 X129.628 Y128.066 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.602 Y128.149 E-.04551
G1 X129.487 Y128.23 E-.07273
G1 X129.284 Y128.22 E-.10516
G1 X129.164 Y128.086 E-.09331
G1 X129.174 Y127.891 E-.10097
G1 X129.321 Y127.762 E-.1013
G1 X129.446 Y127.766 E-.06522
G1 X129.615 Y127.871 E-.1031
G1 X129.646 Y128.008 E-.0727
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/650
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
G3 Z17.2 I-1.116 J.486 P1  F30000
G1 X129.868 Y128.518 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.466 J-.518 E.08894
G1 X129.452 Y127.305 E.00226
G3 X129.911 Y128.475 I-.05 J.695 E.05203
G1 X130.128 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.729 J-.809 E.12888
G1 X129.474 Y126.913 E.00311
G3 X130.172 Y128.767 I-.075 J1.086 E.07643
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519277
G1 F1200
G1 X129.614 Y127.872 E.00542
G1 X129.446 Y127.767 E.0077
G1 X129.321 Y127.763 E.00485
G1 X129.175 Y127.892 E.00755
G1 X129.176 Y128.079 E.00729
G1 X129.244 Y128.195 E.00522
G1 X129.431 Y128.248 E.00753
G1 X129.601 Y128.149 E.00762
G1 X129.627 Y128.065 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.04543
G1 X129.431 Y128.248 E-.10245
G1 X129.244 Y128.195 E-.10119
G1 X129.176 Y128.079 E-.0701
G1 X129.175 Y127.892 E-.09793
G1 X129.321 Y127.763 E-.10145
G1 X129.446 Y127.767 E-.06519
G1 X129.614 Y127.872 E-.10344
G1 X129.645 Y128.008 E-.07282
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/650
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
G3 Z17.4 I-1.115 J.488 P1  F30000
G1 X129.868 Y128.517 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.466 J-.518 E.08895
G1 X129.451 Y127.305 E.00226
G3 X129.911 Y128.475 I-.05 J.695 E.05203
G1 X130.128 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.729 J-.809 E.12888
G1 X129.474 Y126.913 E.0031
G3 X130.172 Y128.767 I-.075 J1.086 E.07643
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516364
G1 F1200
G1 X129.616 Y127.871 E.00542
G1 X129.48 Y127.778 E.00634
G1 X129.313 Y127.779 E.00646
G1 X129.2 Y127.848 E.00512
G1 X129.152 Y128.027 E.00713
G1 X129.214 Y128.16 E.00566
G1 X129.392 Y128.246 E.00764
G1 X129.525 Y128.218 E.00523
G1 X129.639 Y128.067 E.00732
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.525 Y128.218 E-.09876
G1 X129.392 Y128.246 E-.07055
G1 X129.214 Y128.16 E-.10307
G1 X129.152 Y128.027 E-.07646
G1 X129.2 Y127.848 E-.0962
M73 P50 R7
G1 X129.313 Y127.779 E-.06916
G1 X129.48 Y127.778 E-.08713
G1 X129.616 Y127.871 E-.08555
G1 X129.646 Y128.008 E-.07312
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/650
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
G3 Z17.6 I-1.116 J.486 P1  F30000
G1 X129.868 Y128.517 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.466 J-.518 E.08895
G1 X129.451 Y127.305 E.00226
G3 X129.911 Y128.475 I-.05 J.695 E.05203
G1 X130.128 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.729 J-.809 E.12889
G1 X129.474 Y126.913 E.0031
G3 X130.172 Y128.767 I-.075 J1.086 E.07643
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516364
G1 F1200
G1 X129.616 Y127.871 E.00541
G1 X129.48 Y127.778 E.00634
G1 X129.313 Y127.779 E.00645
G1 X129.2 Y127.848 E.00513
G1 X129.152 Y128.027 E.00713
G1 X129.214 Y128.16 E.00567
G1 X129.392 Y128.246 E.00763
G1 X129.525 Y128.218 E.00523
G1 X129.639 Y128.067 E.00732
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.525 Y128.218 E-.09878
G1 X129.392 Y128.246 E-.07055
G1 X129.214 Y128.16 E-.10304
G1 X129.152 Y128.027 E-.0765
G1 X129.2 Y127.848 E-.09618
G1 X129.313 Y127.779 E-.06919
G1 X129.48 Y127.778 E-.08708
G1 X129.616 Y127.871 E-.0856
G1 X129.646 Y128.008 E-.07309
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/650
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
G3 Z17.8 I-1.116 J.486 P1  F30000
G1 X129.868 Y128.517 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.466 J-.518 E.08896
G1 X129.451 Y127.305 E.00225
G3 X129.911 Y128.475 I-.05 J.695 E.05203
G1 X130.128 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.729 J-.809 E.12889
G1 X129.474 Y126.913 E.00309
G3 X130.172 Y128.767 I-.075 J1.086 E.07642
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519262
G1 F1200
G1 X129.614 Y127.872 E.00541
G1 X129.446 Y127.767 E.00771
G1 X129.321 Y127.763 E.00484
G1 X129.175 Y127.892 E.00755
G1 X129.176 Y128.079 E.00729
G1 X129.244 Y128.195 E.00522
G1 X129.431 Y128.248 E.00753
G1 X129.601 Y128.148 E.00763
G1 X129.627 Y128.065 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.601 Y128.148 E-.04539
G1 X129.431 Y128.248 E-.10249
G1 X129.244 Y128.195 E-.10119
G1 X129.176 Y128.079 E-.07011
G1 X129.175 Y127.892 E-.09792
G1 X129.321 Y127.763 E-.10147
G1 X129.446 Y127.767 E-.06503
G1 X129.614 Y127.872 E-.10363
G1 X129.645 Y128.008 E-.07277
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/650
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
G3 Z18 I-1.115 J.489 P1  F30000
G1 X129.868 Y128.517 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.466 J-.518 E.08896
G1 X129.451 Y127.305 E.00225
G3 X129.911 Y128.475 I-.05 J.695 E.05203
G1 X130.128 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.73 J-.809 E.1289
G1 X129.474 Y126.913 E.00309
G3 X130.172 Y128.767 I-.075 J1.086 E.07642
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517131
G1 F1200
G1 X129.615 Y127.872 E.00541
G1 X129.446 Y127.766 E.00771
G1 X129.321 Y127.762 E.00484
G1 X129.174 Y127.891 E.00755
G1 X129.164 Y128.086 E.00753
G1 X129.289 Y128.222 E.00714
G1 X129.486 Y128.23 E.00764
G1 X129.602 Y128.149 E.00546
G1 X129.628 Y128.066 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.602 Y128.149 E-.04542
G1 X129.486 Y128.23 E-.07321
G1 X129.289 Y128.222 E-.10243
G1 X129.164 Y128.086 E-.09572
G1 X129.174 Y127.891 E-.10097
G1 X129.321 Y127.762 E-.10132
G1 X129.446 Y127.766 E-.0649
G1 X129.615 Y127.872 E-.10343
G1 X129.646 Y128.008 E-.07261
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/650
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
G3 Z18.2 I-1.115 J.487 P1  F30000
G1 X129.868 Y128.517 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.467 J-.518 E.08897
G1 X129.451 Y127.305 E.00225
G3 X129.911 Y128.475 I-.049 J.695 E.05202
G1 X130.128 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.73 J-.808 E.1289
G1 X129.474 Y126.913 E.00309
G3 X130.172 Y128.766 I-.075 J1.086 E.07642
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519149
G1 F1200
G1 X129.614 Y127.872 E.00541
G1 X129.445 Y127.767 E.00772
G1 X129.321 Y127.763 E.00483
G1 X129.175 Y127.892 E.00756
G1 X129.177 Y128.08 E.00729
G1 X129.244 Y128.195 E.0052
G1 X129.431 Y128.248 E.00753
G1 X129.601 Y128.148 E.00763
G1 X129.627 Y128.065 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.148 E-.04537
G1 X129.431 Y128.248 E-.10254
G1 X129.244 Y128.195 E-.1012
G1 X129.177 Y128.08 E-.06992
G1 X129.175 Y127.892 E-.09799
G1 X129.321 Y127.763 E-.10157
G1 X129.445 Y127.767 E-.06492
G1 X129.614 Y127.872 E-.10376
G1 X129.645 Y128.008 E-.07274
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/650
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
G3 Z18.4 I-1.114 J.489 P1  F30000
G1 X129.868 Y128.517 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.467 J-.518 E.08897
G1 X129.451 Y127.305 E.00224
G3 X129.911 Y128.475 I-.049 J.695 E.05202
G1 X130.129 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.73 J-.808 E.12891
G1 X129.473 Y126.913 E.00308
G3 X130.172 Y128.766 I-.075 J1.086 E.07642
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51637
G1 F1200
G1 X129.616 Y127.871 E.00541
G1 X129.48 Y127.778 E.00636
G1 X129.313 Y127.779 E.00644
G1 X129.2 Y127.848 E.00513
G1 X129.152 Y128.027 E.00712
G1 X129.214 Y128.16 E.00568
G1 X129.392 Y128.246 E.00762
G1 X129.525 Y128.218 E.00523
G1 X129.639 Y128.067 E.00732
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.525 Y128.218 E-.09881
G1 X129.392 Y128.246 E-.07054
G1 X129.214 Y128.16 E-.1029
G1 X129.152 Y128.027 E-.07664
G1 X129.2 Y127.848 E-.09616
G1 X129.313 Y127.779 E-.06923
G1 X129.48 Y127.778 E-.08693
G1 X129.616 Y127.871 E-.08578
G1 X129.646 Y128.008 E-.07302
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/650
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
G3 Z18.6 I-1.115 J.487 P1  F30000
G1 X129.868 Y128.517 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.467 J-.517 E.08898
G1 X129.451 Y127.305 E.00224
G3 X129.911 Y128.475 I-.049 J.695 E.05202
G1 X130.129 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.73 J-.808 E.12891
G1 X129.473 Y126.913 E.00308
G3 X130.172 Y128.766 I-.074 J1.086 E.07642
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519241
G1 F1200
G1 X129.614 Y127.872 E.00541
G1 X129.445 Y127.767 E.00773
G1 X129.321 Y127.763 E.00482
G1 X129.175 Y127.892 E.00755
G1 X129.176 Y128.079 E.00729
G1 X129.244 Y128.195 E.00522
G1 X129.431 Y128.248 E.00753
G1 X129.601 Y128.148 E.00763
G1 X129.627 Y128.065 E.00337
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.148 E-.04534
G1 X129.431 Y128.248 E-.10256
G1 X129.244 Y128.195 E-.1012
G1 X129.176 Y128.079 E-.0701
G1 X129.175 Y127.892 E-.09793
G1 X129.321 Y127.763 E-.10149
G1 X129.445 Y127.767 E-.06481
G1 X129.614 Y127.872 E-.10388
G1 X129.645 Y128.008 E-.0727
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/650
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
G3 Z18.8 I-1.114 J.489 P1  F30000
G1 X129.868 Y128.517 Z18.8
G1 Z18.6
M73 P50 R6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.467 J-.517 E.08898
G1 X129.451 Y127.304 E.00224
G3 X129.911 Y128.475 I-.049 J.695 E.05202
G1 X130.129 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.73 J-.808 E.12892
G1 X129.473 Y126.913 E.00308
G3 X130.172 Y128.766 I-.074 J1.086 E.07641
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516604
G1 F1200
G1 X129.616 Y127.872 E.00541
G1 X129.446 Y127.766 E.00772
G1 X129.321 Y127.762 E.00482
G1 X129.174 Y127.891 E.00755
G1 X129.164 Y128.086 E.00753
G1 X129.284 Y128.22 E.00696
G1 X129.487 Y128.23 E.00784
G1 X129.602 Y128.149 E.00543
G1 X129.628 Y128.066 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.602 Y128.149 E-.0454
G1 X129.487 Y128.23 E-.07291
G1 X129.284 Y128.22 E-.10513
G1 X129.164 Y128.086 E-.09332
G1 X129.174 Y127.891 E-.10097
G1 X129.321 Y127.762 E-.10135
G1 X129.446 Y127.766 E-.06473
G1 X129.616 Y127.872 E-.10364
G1 X129.646 Y128.008 E-.07255
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/650
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
G3 Z19 I-1.115 J.487 P1  F30000
G1 X129.868 Y128.517 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.467 J-.517 E.08899
G1 X129.451 Y127.304 E.00223
G3 X129.911 Y128.475 I-.049 J.695 E.05202
G1 X130.129 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.73 J-.808 E.12893
G1 X129.473 Y126.913 E.00307
G3 X130.172 Y128.766 I-.074 J1.087 E.07641
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518899
G1 F1200
G1 X129.615 Y127.872 E.00541
G1 X129.445 Y127.767 E.00774
G1 X129.321 Y127.763 E.00482
G1 X129.175 Y127.892 E.00757
G1 X129.177 Y128.08 E.0073
G1 X129.244 Y128.195 E.00517
G1 X129.431 Y128.248 E.00753
G1 X129.601 Y128.148 E.00763
G1 X129.627 Y128.065 E.00337
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.148 E-.04536
G1 X129.431 Y128.248 E-.1026
G1 X129.244 Y128.195 E-.1012
G1 X129.177 Y128.08 E-.06951
G1 X129.175 Y127.892 E-.0981
G1 X129.321 Y127.763 E-.10183
G1 X129.445 Y127.767 E-.06473
G1 X129.615 Y127.872 E-.104
G1 X129.645 Y128.008 E-.07267
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/650
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
G3 Z19.2 I-1.114 J.489 P1  F30000
G1 X129.868 Y128.517 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.467 J-.517 E.08899
G1 X129.451 Y127.304 E.00223
G3 X129.911 Y128.475 I-.049 J.695 E.05202
G1 X130.129 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.73 J-.808 E.12893
G1 X129.473 Y126.913 E.00307
G3 X130.172 Y128.766 I-.074 J1.087 E.07641
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518038
G1 F1200
G1 X129.615 Y127.872 E.00541
G1 X129.445 Y127.766 E.00774
G1 X129.321 Y127.762 E.00481
G1 X129.175 Y127.891 E.00756
G1 X129.162 Y128.071 E.00695
G1 X129.297 Y128.223 E.00787
G1 X129.431 Y128.248 E.0053
G1 X129.601 Y128.149 E.00763
G1 X129.627 Y128.065 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.0453
G1 X129.431 Y128.248 E-.10241
G1 X129.297 Y128.223 E-.07108
G1 X129.162 Y128.071 E-.10556
G1 X129.175 Y127.891 E-.0933
G1 X129.321 Y127.762 E-.10139
G1 X129.445 Y127.766 E-.06457
G1 X129.615 Y127.872 E-.10384
G1 X129.645 Y128.008 E-.07254
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/650
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
G3 Z19.4 I-1.115 J.489 P1  F30000
G1 X129.868 Y128.517 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.467 J-.517 E.08899
G1 X129.45 Y127.304 E.00222
G3 X129.911 Y128.475 I-.049 J.695 E.05202
G1 X130.129 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.73 J-.808 E.12894
G1 X129.473 Y126.913 E.00306
G3 X130.172 Y128.766 I-.074 J1.087 E.07641
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516588
G1 F1200
G1 X129.616 Y127.872 E.0054
G1 X129.445 Y127.766 E.00774
G1 X129.321 Y127.762 E.00481
G1 X129.174 Y127.891 E.00756
G1 X129.164 Y128.086 E.00753
G1 X129.284 Y128.22 E.00696
G1 X129.487 Y128.23 E.00784
G1 X129.602 Y128.149 E.00544
G1 X129.628 Y128.065 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.602 Y128.149 E-.04537
G1 X129.487 Y128.23 E-.07296
G1 X129.284 Y128.22 E-.10512
G1 X129.164 Y128.086 E-.09332
G1 X129.174 Y127.891 E-.10097
M73 P51 R6
G1 X129.321 Y127.762 E-.10137
G1 X129.445 Y127.766 E-.06457
G1 X129.616 Y127.872 E-.10383
G1 X129.646 Y128.008 E-.0725
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/650
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
G3 Z19.6 I-1.115 J.488 P1  F30000
G1 X129.869 Y128.517 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.467 J-.517 E.089
G1 X129.45 Y127.304 E.00222
G3 X129.911 Y128.474 I-.049 J.695 E.05201
G1 X130.129 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.73 J-.808 E.12894
G1 X129.473 Y126.913 E.00306
G3 X130.172 Y128.766 I-.074 J1.087 E.07641
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516584
G1 F1200
G1 X129.616 Y127.872 E.0054
G1 X129.445 Y127.766 E.00774
G1 X129.321 Y127.762 E.00481
G1 X129.174 Y127.891 E.00756
G1 X129.164 Y128.086 E.00753
G1 X129.284 Y128.22 E.00696
G1 X129.487 Y128.23 E.00784
G1 X129.602 Y128.149 E.00544
G1 X129.628 Y128.065 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.602 Y128.149 E-.04536
G1 X129.487 Y128.23 E-.07297
G1 X129.284 Y128.22 E-.10512
G1 X129.164 Y128.086 E-.09331
G1 X129.174 Y127.891 E-.10097
G1 X129.321 Y127.762 E-.10137
G1 X129.445 Y127.766 E-.06451
G1 X129.616 Y127.872 E-.10388
G1 X129.646 Y128.008 E-.07249
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/650
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
G3 Z19.8 I-1.115 J.488 P1  F30000
G1 X129.869 Y128.516 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.467 J-.517 E.08901
G1 X129.45 Y127.304 E.00222
G3 X129.911 Y128.474 I-.049 J.695 E.05201
G1 X130.129 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.731 J-.808 E.12895
G1 X129.473 Y126.913 E.00306
G3 X130.173 Y128.766 I-.074 J1.087 E.07641
M204 S10000
G1 X129.647 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514743
G1 F1200
G1 X129.617 Y127.871 E.00541
G1 X129.48 Y127.777 E.00638
G1 X129.313 Y127.778 E.00641
G1 X129.199 Y127.848 E.00513
G1 X129.151 Y128.038 E.00752
G1 X129.24 Y128.174 E.00628
G1 X129.395 Y128.239 E.00644
G1 X129.525 Y128.219 E.00507
G1 X129.641 Y128.067 E.00734
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.525 Y128.219 E-.09966
G1 X129.395 Y128.239 E-.06881
G1 X129.24 Y128.174 E-.0874
G1 X129.151 Y128.038 E-.08525
G1 X129.199 Y127.848 E-.1021
G1 X129.313 Y127.778 E-.06966
G1 X129.48 Y127.777 E-.08703
G1 X129.617 Y127.871 E-.08667
G1 X129.647 Y128.008 E-.07342
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/650
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
G3 Z20 I-1.116 J.486 P1  F30000
G1 X129.869 Y128.516 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.467 J-.517 E.08901
G1 X129.45 Y127.304 E.00221
G3 X129.911 Y128.474 I-.049 J.695 E.05201
G1 X130.129 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.731 J-.808 E.12895
G1 X129.472 Y126.913 E.00305
G3 X130.173 Y128.765 I-.074 J1.087 E.0764
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516572
G1 F1200
G1 X129.616 Y127.872 E.0054
G1 X129.445 Y127.766 E.00775
G1 X129.321 Y127.762 E.0048
G1 X129.174 Y127.891 E.00756
G1 X129.164 Y128.086 E.00753
G1 X129.284 Y128.22 E.00696
G1 X129.487 Y128.23 E.00783
G1 X129.602 Y128.149 E.00544
G1 X129.628 Y128.065 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.602 Y128.149 E-.04533
G1 X129.487 Y128.23 E-.07301
G1 X129.284 Y128.22 E-.10511
G1 X129.164 Y128.086 E-.09332
G1 X129.174 Y127.891 E-.10098
G1 X129.321 Y127.762 E-.10138
G1 X129.445 Y127.766 E-.06441
G1 X129.616 Y127.872 E-.104
G1 X129.646 Y128.008 E-.07246
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/650
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
G3 Z20.2 I-1.115 J.488 P1  F30000
G1 X129.869 Y128.516 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.467 J-.517 E.08902
G1 X129.45 Y127.304 E.00221
G3 X129.911 Y128.474 I-.049 J.695 E.05201
G1 X130.129 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.731 J-.807 E.12896
G1 X129.472 Y126.913 E.00305
G3 X130.173 Y128.765 I-.074 J1.087 E.0764
M204 S10000
G1 X129.645 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51804
G1 F1200
G1 X129.615 Y127.872 E.0054
G1 X129.445 Y127.766 E.00776
G1 X129.321 Y127.762 E.00479
G1 X129.175 Y127.891 E.00756
G1 X129.162 Y128.071 E.00697
G1 X129.297 Y128.223 E.00785
G1 X129.431 Y128.248 E.0053
G1 X129.601 Y128.149 E.00764
G1 X129.627 Y128.065 E.00337
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.149 E-.04523
G1 X129.431 Y128.248 E-.10249
G1 X129.297 Y128.223 E-.07109
G1 X129.162 Y128.071 E-.10531
G1 X129.175 Y127.891 E-.09356
G1 X129.321 Y127.762 E-.10141
G1 X129.445 Y127.766 E-.06431
G1 X129.615 Y127.872 E-.10413
G1 X129.645 Y128.008 E-.07246
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/650
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
G3 Z20.4 I-1.114 J.49 P1  F30000
G1 X129.869 Y128.516 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.467 J-.517 E.08902
G1 X129.45 Y127.304 E.00221
G3 X129.911 Y128.474 I-.049 J.695 E.05201
G1 X130.129 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.731 J-.807 E.12896
G1 X129.472 Y126.913 E.00305
G3 X130.173 Y128.765 I-.074 J1.087 E.0764
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516381
G1 F1200
G1 X129.616 Y127.872 E.0054
G1 X129.48 Y127.778 E.00639
G1 X129.313 Y127.779 E.00641
G1 X129.2 Y127.848 E.00513
G1 X129.152 Y128.027 E.00712
G1 X129.215 Y128.161 E.00571
G1 X129.392 Y128.246 E.0076
G1 X129.524 Y128.218 E.00523
G1 X129.639 Y128.067 E.00733
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.524 Y128.218 E-.09888
G1 X129.392 Y128.246 E-.07053
G1 X129.215 Y128.161 E-.10255
G1 X129.152 Y128.027 E-.07702
G1 X129.2 Y127.848 E-.0961
G1 X129.313 Y127.779 E-.06928
G1 X129.48 Y127.778 E-.08656
G1 X129.616 Y127.872 E-.08622
G1 X129.646 Y128.008 E-.07286
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/650
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
G3 Z20.6 I-1.115 J.488 P1  F30000
G1 X129.869 Y128.516 Z20.6
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.468 J-.517 E.08903
G1 X129.45 Y127.304 E.0022
G3 X129.912 Y128.474 I-.049 J.695 E.05201
G1 X130.13 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.731 J-.807 E.12897
G1 X129.472 Y126.913 E.00304
G3 X130.173 Y128.765 I-.074 J1.087 E.0764
M204 S10000
G1 X129.646 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516383
G1 F1200
G1 X129.616 Y127.872 E.0054
G1 X129.479 Y127.778 E.00639
G1 X129.313 Y127.779 E.00641
G1 X129.2 Y127.848 E.00513
G1 X129.152 Y128.027 E.00712
G1 X129.215 Y128.161 E.00571
G1 X129.392 Y128.246 E.00759
G1 X129.524 Y128.218 E.00523
G1 X129.639 Y128.067 E.00733
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.524 Y128.218 E-.09889
G1 X129.392 Y128.246 E-.07053
G1 X129.215 Y128.161 E-.10251
G1 X129.152 Y128.027 E-.07706
G1 X129.2 Y127.848 E-.0961
G1 X129.313 Y127.779 E-.06929
G1 X129.479 Y127.778 E-.08653
G1 X129.616 Y127.872 E-.08626
G1 X129.646 Y128.008 E-.07285
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/650
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
G3 Z20.8 I-1.115 J.488 P1  F30000
G1 X129.869 Y128.516 Z20.8
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.468 J-.517 E.08903
G1 X129.45 Y127.304 E.0022
G3 X129.912 Y128.474 I-.049 J.695 E.05201
G1 X130.13 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.731 J-.807 E.12897
G1 X129.472 Y126.913 E.00304
G3 X130.173 Y128.765 I-.073 J1.087 E.0764
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515024
G1 F1200
G1 X129.588 Y127.84 E.00661
G1 X129.414 Y127.754 E.00744
G1 X129.229 Y127.822 E.0076
G1 X129.156 Y127.938 E.00527
G1 X129.185 Y128.131 E.00752
G1 X129.354 Y128.235 E.00763
G1 X129.479 Y128.239 E.00479
G1 X129.614 Y128.101 E.00745
G1 X129.628 Y128.058 E.00173
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02341
G1 X129.479 Y128.239 E-.10103
G1 X129.354 Y128.235 E-.06497
G1 X129.185 Y128.131 E-.10347
G1 X129.156 Y127.938 E-.10206
G1 X129.229 Y127.822 E-.0715
G1 X129.414 Y127.754 E-.10305
G1 X129.588 Y127.84 E-.10089
G1 X129.647 Y128.001 E-.0896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/650
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
G3 Z21 I-1.118 J.481 P1  F30000
G1 X129.869 Y128.516 Z21
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.468 J-.516 E.08904
G1 X129.45 Y127.304 E.0022
G3 X129.912 Y128.474 I-.048 J.695 E.052
G1 X130.13 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.731 J-.807 E.12898
G1 X129.472 Y126.913 E.00303
G3 X130.173 Y128.765 I-.073 J1.087 E.0764
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515031
G1 F1200
G1 X129.588 Y127.84 E.0066
G1 X129.414 Y127.754 E.00744
G1 X129.229 Y127.822 E.00759
G1 X129.156 Y127.938 E.00527
G1 X129.185 Y128.131 E.00752
G1 X129.354 Y128.235 E.00763
G1 X129.479 Y128.239 E.00479
G1 X129.614 Y128.101 E.00745
G1 X129.628 Y128.058 E.00172
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.0234
G1 X129.479 Y128.239 E-.10106
G1 X129.354 Y128.235 E-.06496
G1 X129.185 Y128.131 E-.10348
G1 X129.156 Y127.938 E-.10207
G1 X129.229 Y127.822 E-.0715
G1 X129.414 Y127.754 E-.10301
G1 X129.588 Y127.84 E-.10094
G1 X129.647 Y128.001 E-.08959
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/650
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
G3 Z21.2 I-1.118 J.481 P1  F30000
G1 X129.869 Y128.516 Z21.2
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.383 Y127.303 I-.468 J-.516 E.08904
G1 X129.45 Y127.304 E.00219
G3 X129.912 Y128.474 I-.048 J.695 E.052
G1 X130.13 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.731 J-.807 E.12898
G1 X129.472 Y126.913 E.00303
G3 X130.173 Y128.765 I-.073 J1.087 E.07639
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515039
G1 F1200
G1 X129.588 Y127.84 E.0066
G1 X129.414 Y127.754 E.00744
G1 X129.229 Y127.822 E.00759
G1 X129.156 Y127.938 E.00527
G1 X129.185 Y128.131 E.00752
G1 X129.354 Y128.235 E.00763
G1 X129.479 Y128.239 E.00479
G1 X129.614 Y128.101 E.00745
G1 X129.628 Y128.058 E.00172
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02339
G1 X129.479 Y128.239 E-.10108
G1 X129.354 Y128.235 E-.06494
G1 X129.185 Y128.131 E-.10349
G1 X129.156 Y127.938 E-.10207
G1 X129.229 Y127.822 E-.07151
G1 X129.414 Y127.754 E-.10299
G1 X129.588 Y127.84 E-.10097
G1 X129.647 Y128.001 E-.08958
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/650
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
G3 Z21.4 I-1.118 J.482 P1  F30000
G1 X129.869 Y128.516 Z21.4
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.468 J-.516 E.08904
G1 X129.449 Y127.304 E.00219
G3 X129.912 Y128.474 I-.048 J.695 E.052
G1 X130.13 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.731 J-.807 E.12899
G1 X129.472 Y126.913 E.00303
G3 X130.173 Y128.765 I-.073 J1.087 E.07639
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51491
G1 F1200
G1 X129.588 Y127.84 E.0066
G1 X129.414 Y127.754 E.00745
G1 X129.229 Y127.822 E.00759
G1 X129.154 Y127.978 E.00666
G1 X129.22 Y128.173 E.00792
G1 X129.381 Y128.251 E.0069
G1 X129.56 Y128.191 E.00727
G1 X129.622 Y128.056 E.00572
; CHANGE_LAYER
; Z_HEIGHT: 21.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.56 Y128.191 E-.07743
G1 X129.381 Y128.251 E-.09849
G1 X129.22 Y128.173 E-.09347
G1 X129.154 Y127.978 E-.10732
M73 P52 R6
G1 X129.229 Y127.822 E-.09017
G1 X129.414 Y127.754 E-.1028
G1 X129.588 Y127.84 E-.10087
G1 X129.647 Y128.001 E-.08944
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/650
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
G3 Z21.6 I-1.118 J.482 P1  F30000
G1 X129.869 Y128.516 Z21.6
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.468 J-.516 E.08905
G1 X129.449 Y127.304 E.00218
G3 X129.912 Y128.474 I-.048 J.695 E.052
G1 X130.13 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.732 J-.807 E.129
G1 X129.472 Y126.913 E.00302
G3 X130.173 Y128.765 I-.073 J1.087 E.07639
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515053
G1 F1200
G1 X129.588 Y127.84 E.0066
G1 X129.414 Y127.754 E.00745
G1 X129.229 Y127.822 E.00759
G1 X129.156 Y127.938 E.00527
G1 X129.185 Y128.131 E.00753
G1 X129.354 Y128.235 E.00763
G1 X129.479 Y128.239 E.00479
G1 X129.614 Y128.101 E.00745
G1 X129.628 Y128.058 E.00172
; CHANGE_LAYER
; Z_HEIGHT: 21.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02336
G1 X129.479 Y128.239 E-.10111
G1 X129.354 Y128.235 E-.06491
G1 X129.185 Y128.131 E-.1035
G1 X129.156 Y127.938 E-.10207
G1 X129.229 Y127.822 E-.07151
G1 X129.414 Y127.754 E-.10291
G1 X129.588 Y127.84 E-.10105
G1 X129.647 Y128.001 E-.08956
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/650
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
G3 Z21.8 I-1.117 J.482 P1  F30000
G1 X129.869 Y128.516 Z21.8
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.468 J-.516 E.08905
G1 X129.449 Y127.304 E.00218
G3 X129.912 Y128.474 I-.048 J.695 E.052
G1 X130.13 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.732 J-.807 E.129
G1 X129.471 Y126.913 E.00302
G3 X130.173 Y128.764 I-.073 J1.087 E.07639
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515027
G1 F1200
G1 X129.588 Y127.84 E.0066
G1 X129.414 Y127.754 E.00745
G1 X129.229 Y127.822 E.00759
G1 X129.161 Y127.928 E.00487
G1 X129.188 Y128.128 E.00775
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00748
G1 X129.614 Y128.101 E.00744
G1 X129.628 Y128.058 E.00172
; CHANGE_LAYER
; Z_HEIGHT: 21.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02331
G1 X129.479 Y128.239 E-.10066
G1 X129.285 Y128.224 E-.10127
G1 X129.188 Y128.128 E-.07115
G1 X129.161 Y127.928 E-.10484
G1 X129.229 Y127.822 E-.06588
G1 X129.414 Y127.754 E-.10267
G1 X129.588 Y127.84 E-.10086
G1 X129.647 Y128.001 E-.08936
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/650
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
G3 Z22 I-1.117 J.482 P1  F30000
G1 X129.869 Y128.516 Z22
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.468 J-.516 E.08906
G1 X129.449 Y127.304 E.00218
G3 X129.912 Y128.473 I-.048 J.695 E.052
G1 X130.13 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.732 J-.807 E.12901
G1 X129.471 Y126.913 E.00302
G3 X130.173 Y128.764 I-.073 J1.087 E.07639
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515042
G1 F1200
G1 X129.588 Y127.84 E.0066
G1 X129.414 Y127.754 E.00746
G1 X129.229 Y127.822 E.00758
G1 X129.161 Y127.928 E.00487
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00748
G1 X129.614 Y128.101 E.00744
G1 X129.628 Y128.058 E.00172
; CHANGE_LAYER
; Z_HEIGHT: 22
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02329
G1 X129.479 Y128.239 E-.10068
G1 X129.285 Y128.224 E-.10126
G1 X129.188 Y128.128 E-.07118
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.822 E-.06587
G1 X129.414 Y127.754 E-.10263
G1 X129.588 Y127.84 E-.10091
G1 X129.647 Y128.001 E-.08935
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/650
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
G3 Z22.2 I-1.117 J.482 P1  F30000
G1 X129.869 Y128.516 Z22.2
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.468 J-.516 E.08907
G1 X129.449 Y127.304 E.00217
G3 X129.912 Y128.473 I-.048 J.695 E.052
G1 X130.13 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.732 J-.806 E.12901
G1 X129.471 Y126.913 E.00301
G3 X130.174 Y128.764 I-.073 J1.087 E.07638
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515077
G1 F1200
G1 X129.588 Y127.84 E.0066
G1 X129.414 Y127.754 E.00746
G1 X129.229 Y127.822 E.00758
G1 X129.156 Y127.938 E.00527
G1 X129.185 Y128.131 E.00752
G1 X129.354 Y128.235 E.00763
G1 X129.479 Y128.239 E.00478
G1 X129.614 Y128.101 E.00746
G1 X129.628 Y128.058 E.00172
; CHANGE_LAYER
; Z_HEIGHT: 22.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02333
G1 X129.479 Y128.239 E-.10116
G1 X129.354 Y128.235 E-.0649
G1 X129.185 Y128.131 E-.10351
G1 X129.156 Y127.938 E-.10207
G1 X129.229 Y127.822 E-.07153
G1 X129.414 Y127.754 E-.10281
G1 X129.588 Y127.84 E-.10116
G1 X129.647 Y128.001 E-.08954
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/650
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
G3 Z22.4 I-1.117 J.482 P1  F30000
G1 X129.869 Y128.515 Z22.4
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.468 J-.516 E.08907
G1 X129.449 Y127.304 E.00217
G3 X129.912 Y128.473 I-.048 J.695 E.052
G1 X130.13 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.732 J-.806 E.12902
G1 X129.471 Y126.913 E.00301
G3 X130.174 Y128.764 I-.073 J1.087 E.07638
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515084
G1 F1200
G1 X129.588 Y127.84 E.0066
G1 X129.414 Y127.754 E.00746
G1 X129.229 Y127.822 E.00758
G1 X129.156 Y127.938 E.00527
G1 X129.185 Y128.131 E.00752
G1 X129.354 Y128.235 E.00763
G1 X129.479 Y128.239 E.00478
G1 X129.614 Y128.101 E.00746
G1 X129.628 Y128.058 E.00172
; CHANGE_LAYER
; Z_HEIGHT: 22.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02332
G1 X129.479 Y128.239 E-.10118
G1 X129.354 Y128.235 E-.06487
G1 X129.185 Y128.131 E-.10353
G1 X129.156 Y127.938 E-.10206
G1 X129.229 Y127.822 E-.07154
G1 X129.414 Y127.754 E-.10277
G1 X129.588 Y127.84 E-.1012
G1 X129.647 Y128.001 E-.08953
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/650
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
G3 Z22.6 I-1.117 J.483 P1  F30000
G1 X129.869 Y128.515 Z22.6
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.468 J-.516 E.08907
G1 X129.449 Y127.304 E.00217
G3 X129.912 Y128.473 I-.048 J.695 E.05199
G1 X130.13 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.732 J-.806 E.12902
G1 X129.471 Y126.913 E.003
G3 X130.174 Y128.764 I-.073 J1.087 E.07638
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515332
G1 F1200
G1 X129.588 Y127.841 E.0066
G1 X129.414 Y127.754 E.00746
G1 X129.229 Y127.822 E.00758
G1 X129.156 Y127.938 E.00527
G1 X129.182 Y128.122 E.00716
G1 X129.342 Y128.24 E.00764
G1 X129.479 Y128.239 E.00528
G1 X129.614 Y128.101 E.00744
G1 X129.628 Y128.058 E.00172
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02324
G1 X129.479 Y128.239 E-.10073
G1 X129.342 Y128.24 E-.07146
G1 X129.182 Y128.122 E-.10337
G1 X129.156 Y127.938 E-.09695
G1 X129.229 Y127.822 E-.07138
G1 X129.414 Y127.754 E-.10252
G1 X129.588 Y127.841 E-.10101
G1 X129.647 Y128.001 E-.08933
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/650
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
G3 Z22.8 I-1.117 J.483 P1  F30000
G1 X129.869 Y128.515 Z22.8
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.468 J-.516 E.08908
G1 X129.449 Y127.304 E.00216
G3 X129.912 Y128.473 I-.048 J.695 E.05199
G1 X130.13 Y128.805 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.732 J-.806 E.12903
G1 X129.471 Y126.913 E.003
G3 X130.174 Y128.764 I-.072 J1.087 E.07638
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514936
G1 F1200
G1 X129.588 Y127.84 E.0066
G1 X129.414 Y127.754 E.00747
G1 X129.229 Y127.822 E.00757
G1 X129.154 Y127.978 E.00666
G1 X129.22 Y128.173 E.00794
G1 X129.381 Y128.251 E.00688
G1 X129.561 Y128.191 E.00729
G1 X129.622 Y128.056 E.0057
; CHANGE_LAYER
; Z_HEIGHT: 22.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.561 Y128.191 E-.07724
G1 X129.381 Y128.251 E-.09869
G1 X129.22 Y128.173 E-.09325
G1 X129.154 Y127.978 E-.10757
G1 X129.229 Y127.822 E-.09017
G1 X129.414 Y127.754 E-.10256
G1 X129.588 Y127.84 E-.10112
G1 X129.647 Y128.001 E-.08939
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/650
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
G3 Z23 I-1.117 J.483 P1  F30000
G1 X129.87 Y128.515 Z23
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.469 J-.516 E.08908
G1 X129.449 Y127.304 E.00216
G3 X129.912 Y128.473 I-.048 J.695 E.05199
G1 X130.131 Y128.805 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.732 J-.806 E.12903
G1 X129.471 Y126.913 E.003
G3 X130.174 Y128.764 I-.072 J1.087 E.07638
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514956
G1 F1200
G1 X129.588 Y127.84 E.0066
G1 X129.414 Y127.754 E.00747
G1 X129.229 Y127.822 E.00757
G1 X129.156 Y127.938 E.00527
G1 X129.181 Y128.121 E.00712
G1 X129.345 Y128.241 E.0078
G1 X129.516 Y128.217 E.00665
G1 X129.638 Y128.059 E.00769
; CHANGE_LAYER
; Z_HEIGHT: 23
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.516 Y128.217 E-.10412
G1 X129.345 Y128.241 E-.08994
G1 X129.181 Y128.121 E-.10552
G1 X129.156 Y127.938 E-.09629
G1 X129.229 Y127.822 E-.07137
G1 X129.414 Y127.754 E-.10243
G1 X129.588 Y127.84 E-.10105
G1 X129.647 Y128.001 E-.08929
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/650
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
G3 Z23.2 I-1.117 J.483 P1  F30000
G1 X129.87 Y128.515 Z23.2
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.469 J-.516 E.08909
G1 X129.449 Y127.304 E.00216
G3 X129.912 Y128.473 I-.048 J.695 E.05199
G1 X130.131 Y128.805 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.732 J-.806 E.12904
G1 X129.471 Y126.913 E.00299
G3 X130.174 Y128.764 I-.072 J1.087 E.07638
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514962
G1 F1200
G1 X129.588 Y127.84 E.0066
G1 X129.414 Y127.754 E.00747
G1 X129.229 Y127.822 E.00757
G1 X129.156 Y127.938 E.00528
G1 X129.181 Y128.121 E.00712
G1 X129.345 Y128.242 E.0078
G1 X129.516 Y128.217 E.00665
G1 X129.638 Y128.059 E.00769
; CHANGE_LAYER
; Z_HEIGHT: 23.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.516 Y128.217 E-.10411
G1 X129.345 Y128.242 E-.08994
G1 X129.181 Y128.121 E-.10554
G1 X129.156 Y127.938 E-.09628
G1 X129.229 Y127.822 E-.07138
G1 X129.414 Y127.754 E-.10238
G1 X129.588 Y127.84 E-.10109
G1 X129.647 Y128.001 E-.08928
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/650
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
G3 Z23.4 I-1.117 J.483 P1  F30000
G1 X129.87 Y128.515 Z23.4
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.469 J-.516 E.08909
G1 X129.448 Y127.304 E.00215
G3 X129.912 Y128.473 I-.048 J.695 E.05199
G1 X130.131 Y128.805 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.732 J-.806 E.12904
G1 X129.47 Y126.913 E.00299
G3 X130.174 Y128.764 I-.072 J1.087 E.07638
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515119
G1 F1200
G1 X129.588 Y127.841 E.0066
G1 X129.414 Y127.754 E.00747
G1 X129.229 Y127.822 E.00756
G1 X129.156 Y127.938 E.00528
G1 X129.185 Y128.131 E.00752
G1 X129.354 Y128.235 E.00763
G1 X129.479 Y128.239 E.00478
G1 X129.614 Y128.101 E.00747
G1 X129.628 Y128.058 E.00172
; CHANGE_LAYER
; Z_HEIGHT: 23.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02326
G1 X129.479 Y128.239 E-.10126
G1 X129.354 Y128.235 E-.06482
G1 X129.185 Y128.131 E-.10355
G1 X129.156 Y127.938 E-.10207
M73 P53 R6
G1 X129.229 Y127.822 E-.07156
G1 X129.414 Y127.754 E-.10261
G1 X129.588 Y127.841 E-.10138
G1 X129.647 Y128.001 E-.08949
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/650
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
G3 Z23.6 I-1.117 J.484 P1  F30000
G1 X129.87 Y128.515 Z23.6
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.469 J-.515 E.0891
G1 X129.448 Y127.304 E.00215
G3 X129.912 Y128.473 I-.047 J.695 E.05199
G1 X130.131 Y128.805 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.733 J-.806 E.12905
G1 X129.47 Y126.913 E.00299
G3 X130.174 Y128.764 I-.072 J1.087 E.07637
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515128
G1 F1200
G1 X129.588 Y127.841 E.0066
G1 X129.414 Y127.754 E.00748
G1 X129.229 Y127.822 E.00756
G1 X129.156 Y127.938 E.00528
G1 X129.185 Y128.131 E.00752
G1 X129.354 Y128.235 E.00763
G1 X129.479 Y128.239 E.00478
G1 X129.614 Y128.101 E.00747
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 23.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02325
G1 X129.479 Y128.239 E-.10127
G1 X129.354 Y128.235 E-.06482
G1 X129.185 Y128.131 E-.10356
G1 X129.156 Y127.938 E-.10207
G1 X129.229 Y127.822 E-.07156
G1 X129.414 Y127.754 E-.10258
G1 X129.588 Y127.841 E-.10141
G1 X129.647 Y128.001 E-.08949
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/650
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
G3 Z23.8 I-1.117 J.484 P1  F30000
G1 X129.87 Y128.515 Z23.8
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.469 J-.515 E.0891
G1 X129.448 Y127.304 E.00214
G3 X129.912 Y128.473 I-.047 J.695 E.05199
G1 X130.131 Y128.805 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.733 J-.806 E.12905
G1 X129.47 Y126.913 E.00298
G3 X130.174 Y128.763 I-.072 J1.087 E.07637
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515135
G1 F1200
G1 X129.588 Y127.841 E.0066
G1 X129.414 Y127.754 E.00748
G1 X129.229 Y127.822 E.00756
G1 X129.156 Y127.938 E.00528
G1 X129.185 Y128.131 E.00752
G1 X129.354 Y128.235 E.00764
G1 X129.478 Y128.239 E.00478
G1 X129.614 Y128.101 E.00747
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 23.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02324
G1 X129.478 Y128.239 E-.1013
G1 X129.354 Y128.235 E-.0648
G1 X129.185 Y128.131 E-.10357
G1 X129.156 Y127.938 E-.10206
G1 X129.229 Y127.822 E-.07156
G1 X129.414 Y127.754 E-.10254
G1 X129.588 Y127.841 E-.10145
G1 X129.647 Y128.001 E-.08948
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 119/650
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
G3 Z24 I-1.117 J.484 P1  F30000
G1 X129.87 Y128.515 Z24
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.469 J-.515 E.08911
G1 X129.448 Y127.304 E.00214
G3 X129.913 Y128.473 I-.047 J.695 E.05198
G1 X130.131 Y128.805 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.733 J-.806 E.12906
G1 X129.47 Y126.913 E.00298
G3 X130.174 Y128.763 I-.072 J1.087 E.07637
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515113
G1 F1200
G1 X129.588 Y127.841 E.0066
G1 X129.413 Y127.754 E.00748
G1 X129.229 Y127.822 E.00756
G1 X129.161 Y127.928 E.00487
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00748
G1 X129.614 Y128.101 E.00745
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02318
G1 X129.479 Y128.239 E-.10084
G1 X129.285 Y128.224 E-.10121
G1 X129.188 Y128.128 E-.07118
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.822 E-.06591
G1 X129.413 Y127.754 E-.1023
G1 X129.588 Y127.841 E-.10127
G1 X129.647 Y128.001 E-.08928
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 120/650
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
G3 Z24.2 I-1.117 J.484 P1  F30000
G1 X129.87 Y128.515 Z24.2
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.469 J-.515 E.08911
G1 X129.448 Y127.304 E.00214
G3 X129.913 Y128.472 I-.047 J.695 E.05198
G1 X130.131 Y128.805 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.733 J-.805 E.12906
G1 X129.47 Y126.913 E.00297
G3 X130.174 Y128.763 I-.072 J1.087 E.07637
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515111
G1 F1200
G1 X129.588 Y127.841 E.0066
G1 X129.413 Y127.754 E.00748
G1 X129.229 Y127.822 E.00755
G1 X129.161 Y127.928 E.00487
G1 X129.188 Y128.128 E.00775
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00748
G1 X129.614 Y128.101 E.00745
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 24.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02317
G1 X129.479 Y128.239 E-.10085
G1 X129.285 Y128.224 E-.1012
G1 X129.188 Y128.128 E-.07116
G1 X129.161 Y127.928 E-.10485
G1 X129.229 Y127.822 E-.06594
G1 X129.413 Y127.754 E-.10226
G1 X129.588 Y127.841 E-.1013
G1 X129.647 Y128.001 E-.08928
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 121/650
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
G3 Z24.4 I-1.116 J.484 P1  F30000
G1 X129.87 Y128.515 Z24.4
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.469 J-.515 E.08912
G1 X129.448 Y127.304 E.00213
G3 X129.913 Y128.472 I-.047 J.695 E.05198
G1 X130.131 Y128.805 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.733 J-.805 E.12907
G1 X129.47 Y126.913 E.00297
G3 X130.174 Y128.763 I-.072 J1.087 E.07637
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514968
G1 F1200
G1 X129.588 Y127.841 E.0066
G1 X129.413 Y127.754 E.00749
G1 X129.229 Y127.822 E.00755
G1 X129.154 Y127.978 E.00666
G1 X129.22 Y128.174 E.00796
G1 X129.381 Y128.251 E.00687
G1 X129.561 Y128.19 E.0073
G1 X129.622 Y128.056 E.00569
; CHANGE_LAYER
; Z_HEIGHT: 24.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.561 Y128.19 E-.07701
G1 X129.381 Y128.251 E-.09892
G1 X129.22 Y128.174 E-.09299
G1 X129.154 Y127.978 E-.10787
G1 X129.229 Y127.822 E-.09017
G1 X129.413 Y127.754 E-.10229
G1 X129.588 Y127.841 E-.10142
G1 X129.647 Y128.001 E-.08934
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/650
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
G3 Z24.6 I-1.116 J.484 P1  F30000
G1 X129.87 Y128.515 Z24.6
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.469 J-.515 E.08912
G1 X129.448 Y127.304 E.00213
G3 X129.913 Y128.472 I-.047 J.695 E.05198
G1 X130.131 Y128.805 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.733 J-.805 E.12908
G1 X129.47 Y126.913 E.00297
G3 X130.174 Y128.763 I-.072 J1.087 E.07637
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515135
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.413 Y127.754 E.00749
G1 X129.229 Y127.822 E.00755
G1 X129.161 Y127.928 E.00487
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00748
G1 X129.614 Y128.1 E.00745
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 24.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.1 E-.02315
G1 X129.479 Y128.239 E-.10089
G1 X129.285 Y128.224 E-.10119
G1 X129.188 Y128.128 E-.07119
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.822 E-.06592
G1 X129.413 Y127.754 E-.1022
G1 X129.588 Y127.841 E-.10138
G1 X129.647 Y128.001 E-.08926
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 123/650
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
G3 Z24.8 I-1.116 J.485 P1  F30000
G1 X129.87 Y128.515 Z24.8
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.469 J-.515 E.08913
G1 X129.448 Y127.304 E.00213
G3 X129.913 Y128.472 I-.047 J.695 E.05198
G1 X130.131 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.733 J-.805 E.12908
G1 X129.47 Y126.913 E.00296
G3 X130.175 Y128.763 I-.072 J1.087 E.07636
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515142
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.413 Y127.754 E.00749
G1 X129.229 Y127.822 E.00755
G1 X129.161 Y127.928 E.00487
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00748
G1 X129.615 Y128.1 E.00746
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 24.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02313
G1 X129.479 Y128.239 E-.10091
G1 X129.285 Y128.224 E-.10118
G1 X129.188 Y128.128 E-.07119
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.822 E-.06593
G1 X129.413 Y127.754 E-.10216
G1 X129.588 Y127.841 E-.10142
G1 X129.647 Y128.001 E-.08925
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 124/650
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
G3 Z25 I-1.116 J.485 P1  F30000
G1 X129.87 Y128.514 Z25
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.469 J-.515 E.08913
G1 X129.448 Y127.304 E.00212
G3 X129.913 Y128.472 I-.047 J.695 E.05198
G1 X130.131 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.733 J-.805 E.12909
G1 X129.469 Y126.913 E.00296
G3 X130.175 Y128.763 I-.071 J1.087 E.07636
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515136
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.413 Y127.754 E.0075
G1 X129.229 Y127.822 E.00754
G1 X129.161 Y127.928 E.00487
G1 X129.188 Y128.128 E.00775
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00748
G1 X129.615 Y128.1 E.00746
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 25
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02312
G1 X129.479 Y128.239 E-.10092
G1 X129.285 Y128.224 E-.10118
G1 X129.188 Y128.128 E-.07115
G1 X129.161 Y127.928 E-.10485
G1 X129.229 Y127.822 E-.06595
G1 X129.413 Y127.754 E-.10212
G1 X129.588 Y127.841 E-.10146
G1 X129.647 Y128.001 E-.08924
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/650
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
G3 Z25.2 I-1.116 J.485 P1  F30000
G1 X129.87 Y128.514 Z25.2
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.47 J-.515 E.08914
G1 X129.448 Y127.304 E.00212
G3 X129.913 Y128.472 I-.047 J.695 E.05198
G1 X130.131 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.733 J-.805 E.12909
G1 X129.469 Y126.913 E.00295
G3 X130.175 Y128.763 I-.071 J1.087 E.07636
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515159
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.413 Y127.754 E.0075
G1 X129.229 Y127.822 E.00754
G1 X129.154 Y127.978 E.00667
G1 X129.218 Y128.171 E.00783
G1 X129.381 Y128.251 E.00698
G1 X129.561 Y128.19 E.00731
G1 X129.622 Y128.056 E.00568
; CHANGE_LAYER
; Z_HEIGHT: 25.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.561 Y128.19 E-.07689
G1 X129.381 Y128.251 E-.09903
G1 X129.218 Y128.171 E-.09459
G1 X129.154 Y127.978 E-.10607
G1 X129.229 Y127.822 E-.09038
G1 X129.413 Y127.754 E-.10216
G1 X129.588 Y127.841 E-.10158
G1 X129.647 Y128.001 E-.0893
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 126/650
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
G3 Z25.4 I-1.116 J.485 P1  F30000
G1 X129.87 Y128.514 Z25.4
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.47 J-.515 E.08914
G1 X129.447 Y127.304 E.00212
G3 X129.913 Y128.472 I-.047 J.695 E.05197
G1 X130.132 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.734 J-.805 E.1291
G1 X129.469 Y126.913 E.00295
G3 X130.175 Y128.763 I-.071 J1.087 E.07636
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515193
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.413 Y127.754 E.0075
G1 X129.229 Y127.822 E.00754
G1 X129.156 Y127.938 E.00528
G1 X129.185 Y128.131 E.00752
G1 X129.354 Y128.235 E.00764
G1 X129.478 Y128.239 E.00477
G1 X129.615 Y128.1 E.00748
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 25.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02314
G1 X129.478 Y128.239 E-.10143
M73 P54 R6
G1 X129.354 Y128.235 E-.06471
G1 X129.185 Y128.131 E-.10361
G1 X129.156 Y127.938 E-.10207
G1 X129.229 Y127.822 E-.0716
G1 X129.413 Y127.754 E-.10227
G1 X129.588 Y127.841 E-.10174
G1 X129.647 Y128.001 E-.08942
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 127/650
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
G3 Z25.6 I-1.116 J.485 P1  F30000
G1 X129.87 Y128.514 Z25.6
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.47 J-.515 E.08915
G1 X129.447 Y127.304 E.00211
G3 X129.913 Y128.472 I-.047 J.695 E.05197
G1 X130.132 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.734 J-.805 E.1291
G1 X129.469 Y126.913 E.00295
G3 X130.175 Y128.762 I-.071 J1.087 E.07636
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514991
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.413 Y127.754 E.0075
G1 X129.229 Y127.822 E.00754
G1 X129.154 Y127.978 E.00666
G1 X129.221 Y128.174 E.00798
G1 X129.381 Y128.251 E.00685
G1 X129.561 Y128.19 E.00731
G1 X129.623 Y128.056 E.00567
; CHANGE_LAYER
; Z_HEIGHT: 25.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.561 Y128.19 E-.07684
G1 X129.381 Y128.251 E-.09908
G1 X129.221 Y128.174 E-.09281
G1 X129.154 Y127.978 E-.10808
G1 X129.229 Y127.822 E-.09017
G1 X129.413 Y127.754 E-.1021
G1 X129.588 Y127.841 E-.10164
G1 X129.647 Y128.001 E-.08929
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 128/650
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
G3 Z25.8 I-1.116 J.485 P1  F30000
G1 X129.87 Y128.514 Z25.8
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.47 J-.515 E.08915
G1 X129.447 Y127.304 E.00211
G3 X129.913 Y128.472 I-.047 J.695 E.05197
G1 X130.132 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.734 J-.805 E.12911
G1 X129.469 Y126.913 E.00294
G3 X130.175 Y128.762 I-.071 J1.087 E.07636
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51521
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.413 Y127.754 E.00751
G1 X129.229 Y127.822 E.00753
G1 X129.156 Y127.938 E.00528
G1 X129.185 Y128.131 E.00752
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00477
G1 X129.615 Y128.1 E.00748
G1 X129.628 Y128.058 E.0017
; CHANGE_LAYER
; Z_HEIGHT: 25.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02312
G1 X129.478 Y128.239 E-.10147
G1 X129.355 Y128.235 E-.06469
G1 X129.185 Y128.131 E-.10363
G1 X129.156 Y127.938 E-.10207
G1 X129.229 Y127.822 E-.07161
G1 X129.413 Y127.754 E-.10219
G1 X129.588 Y127.841 E-.10183
G1 X129.647 Y128.001 E-.0894
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 129/650
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
G3 Z26 I-1.116 J.486 P1  F30000
G1 X129.871 Y128.514 Z26
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.47 J-.515 E.08916
G1 X129.447 Y127.304 E.0021
G3 X129.913 Y128.472 I-.047 J.695 E.05197
G1 X130.132 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.734 J-.805 E.12911
G1 X129.469 Y126.913 E.00294
G3 X130.175 Y128.762 I-.071 J1.087 E.07635
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515172
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.413 Y127.754 E.00751
G1 X129.229 Y127.822 E.00753
G1 X129.161 Y127.928 E.00487
G1 X129.188 Y128.128 E.00775
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00746
G1 X129.629 Y128.058 E.0017
; CHANGE_LAYER
; Z_HEIGHT: 26
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02307
G1 X129.479 Y128.239 E-.10101
G1 X129.285 Y128.224 E-.10115
G1 X129.188 Y128.128 E-.07115
G1 X129.161 Y127.928 E-.10485
G1 X129.229 Y127.822 E-.06597
G1 X129.413 Y127.754 E-.10195
G1 X129.588 Y127.841 E-.10164
G1 X129.647 Y128.001 E-.08921
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 130/650
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
G3 Z26.2 I-1.116 J.486 P1  F30000
G1 X129.871 Y128.514 Z26.2
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.47 J-.514 E.08916
G1 X129.447 Y127.304 E.0021
G3 X129.913 Y128.472 I-.046 J.695 E.05197
G1 X130.132 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.734 J-.804 E.12912
G1 X129.469 Y126.913 E.00294
G3 X130.175 Y128.762 I-.071 J1.087 E.07635
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51519
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.413 Y127.754 E.00751
G1 X129.229 Y127.822 E.00753
G1 X129.161 Y127.928 E.00487
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00746
G1 X129.629 Y128.058 E.0017
; CHANGE_LAYER
; Z_HEIGHT: 26.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02305
G1 X129.479 Y128.239 E-.10103
G1 X129.285 Y128.224 E-.10115
G1 X129.188 Y128.128 E-.07119
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.822 E-.06596
G1 X129.413 Y127.754 E-.10192
G1 X129.588 Y127.841 E-.10168
G1 X129.647 Y128.001 E-.08919
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 131/650
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
G3 Z26.4 I-1.116 J.486 P1  F30000
G1 X129.871 Y128.514 Z26.4
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.47 J-.514 E.08917
G1 X129.447 Y127.304 E.0021
G3 X129.913 Y128.472 I-.046 J.695 E.05197
G1 X130.132 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.734 J-.804 E.12912
G1 X129.469 Y126.913 E.00293
G3 X130.175 Y128.762 I-.071 J1.087 E.07635
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515007
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.413 Y127.754 E.00751
G1 X129.229 Y127.822 E.00753
G1 X129.154 Y127.978 E.00666
G1 X129.221 Y128.174 E.00799
G1 X129.381 Y128.251 E.00684
G1 X129.561 Y128.19 E.00732
G1 X129.623 Y128.056 E.00566
; CHANGE_LAYER
; Z_HEIGHT: 26.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.561 Y128.19 E-.07671
G1 X129.381 Y128.251 E-.09921
G1 X129.221 Y128.174 E-.09268
G1 X129.154 Y127.978 E-.10823
G1 X129.229 Y127.822 E-.09016
G1 X129.413 Y127.754 E-.10196
G1 X129.588 Y127.841 E-.10179
G1 X129.647 Y128.001 E-.08927
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 132/650
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
G3 Z26.6 I-1.116 J.486 P1  F30000
G1 X129.871 Y128.514 Z26.6
G1 Z26.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.47 J-.514 E.08917
G1 X129.447 Y127.304 E.00209
G3 X129.913 Y128.471 I-.046 J.695 E.05197
G1 X130.135 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.804 E.00009
G3 X129.373 Y126.911 I-.734 J-.804 E.12913
G1 X129.469 Y126.913 E.00293
G3 X130.274 Y128.646 I-.071 J1.087 E.07168
G1 X130.174 Y128.759 E.00463
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515205
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.413 Y127.754 E.00752
G1 X129.229 Y127.822 E.00752
G1 X129.161 Y127.928 E.00487
G1 X129.188 Y128.128 E.00775
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00747
G1 X129.629 Y128.058 E.0017
; CHANGE_LAYER
; Z_HEIGHT: 26.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02303
G1 X129.479 Y128.239 E-.10105
G1 X129.285 Y128.224 E-.10113
G1 X129.188 Y128.128 E-.0712
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.822 E-.06596
G1 X129.413 Y127.754 E-.10185
G1 X129.588 Y127.841 E-.10175
G1 X129.647 Y128.001 E-.08919
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 133/650
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
G3 Z26.8 I-1.116 J.486 P1  F30000
G1 X129.871 Y128.514 Z26.8
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.47 J-.514 E.08918
G1 X129.447 Y127.304 E.00209
G3 X129.913 Y128.471 I-.046 J.695 E.05196
G1 X130.135 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.803 E.00009
G3 X129.373 Y126.911 I-.734 J-.804 E.12913
G1 X129.468 Y126.913 E.00293
G3 X130.274 Y128.646 I-.071 J1.087 E.07168
G1 X130.175 Y128.759 E.00462
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5152
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.413 Y127.754 E.00752
G1 X129.229 Y127.822 E.00752
G1 X129.161 Y127.928 E.00488
G1 X129.188 Y128.128 E.00775
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00747
G1 X129.629 Y128.058 E.0017
; CHANGE_LAYER
; Z_HEIGHT: 26.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02301
G1 X129.479 Y128.239 E-.10108
G1 X129.285 Y128.224 E-.10113
G1 X129.188 Y128.128 E-.07115
G1 X129.161 Y127.928 E-.10486
G1 X129.229 Y127.822 E-.06599
G1 X129.413 Y127.754 E-.10182
G1 X129.588 Y127.841 E-.10179
G1 X129.647 Y128.001 E-.08918
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 134/650
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
G3 Z27 I-1.115 J.487 P1  F30000
G1 X129.871 Y128.514 Z27
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.47 J-.514 E.08918
G1 X129.447 Y127.304 E.00209
G3 X129.913 Y128.471 I-.046 J.695 E.05196
G1 X130.135 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.803 E.00009
G3 X129.373 Y126.911 I-.734 J-.804 E.12914
G1 X129.468 Y126.913 E.00292
G3 X130.274 Y128.646 I-.07 J1.087 E.07168
G1 X130.175 Y128.759 E.00462
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515005
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.413 Y127.754 E.00752
G1 X129.229 Y127.822 E.00752
G1 X129.161 Y127.928 E.00486
G1 X129.206 Y128.161 E.00914
G1 X129.381 Y128.251 E.00757
G1 X129.562 Y128.19 E.00733
G1 X129.623 Y128.056 E.00566
; CHANGE_LAYER
; Z_HEIGHT: 27
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.562 Y128.19 E-.07652
G1 X129.381 Y128.251 E-.09916
G1 X129.206 Y128.161 E-.10238
G1 X129.161 Y127.928 E-.12365
G1 X129.229 Y127.822 E-.06571
G1 X129.413 Y127.754 E-.10171
G1 X129.588 Y127.841 E-.10176
G1 X129.647 Y128.001 E-.08912
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 135/650
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
G3 Z27.2 I-1.115 J.487 P1  F30000
G1 X129.871 Y128.514 Z27.2
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.47 J-.514 E.08919
G1 X129.447 Y127.304 E.00208
G3 X129.913 Y128.471 I-.046 J.695 E.05196
G1 X130.135 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.803 E.00009
G3 X129.373 Y126.911 I-.735 J-.804 E.12914
G1 X129.468 Y126.913 E.00292
G3 X130.274 Y128.646 I-.07 J1.087 E.07167
G1 X130.175 Y128.759 E.00462
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515226
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.412 Y127.754 E.00753
G1 X129.229 Y127.822 E.00752
G1 X129.161 Y127.928 E.00487
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00747
G1 X129.629 Y128.058 E.0017
; CHANGE_LAYER
; Z_HEIGHT: 27.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02299
G1 X129.479 Y128.239 E-.10111
G1 X129.285 Y128.224 E-.10112
G1 X129.188 Y128.128 E-.07119
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.822 E-.06598
G1 X129.412 Y127.754 E-.10175
G1 X129.588 Y127.841 E-.10187
G1 X129.647 Y128.001 E-.08916
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 136/650
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
G3 Z27.4 I-1.115 J.487 P1  F30000
G1 X129.871 Y128.513 Z27.4
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.47 J-.514 E.08919
G1 X129.446 Y127.304 E.00208
G3 X129.913 Y128.471 I-.046 J.695 E.05196
G1 X130.135 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.803 E.00009
G3 X129.373 Y126.911 I-.735 J-.804 E.12915
G1 X129.468 Y126.913 E.00291
G3 X130.274 Y128.646 I-.07 J1.087 E.07167
G1 X130.175 Y128.759 E.00462
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515272
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.412 Y127.754 E.00753
G1 X129.229 Y127.822 E.00751
G1 X129.156 Y127.938 E.00528
M73 P55 R6
G1 X129.185 Y128.131 E.00753
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00476
G1 X129.615 Y128.1 E.00749
G1 X129.629 Y128.058 E.0017
; CHANGE_LAYER
; Z_HEIGHT: 27.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02303
G1 X129.478 Y128.239 E-.1016
G1 X129.355 Y128.235 E-.0646
G1 X129.185 Y128.131 E-.10366
G1 X129.156 Y127.938 E-.10207
G1 X129.229 Y127.822 E-.07164
G1 X129.412 Y127.754 E-.10192
G1 X129.588 Y127.841 E-.10213
G1 X129.647 Y128.001 E-.08934
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 137/650
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
G3 Z27.6 I-1.115 J.487 P1  F30000
G1 X129.871 Y128.513 Z27.6
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.471 J-.514 E.0892
G1 X129.446 Y127.304 E.00208
G3 X129.914 Y128.471 I-.046 J.695 E.05196
G1 X130.135 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.803 E.00009
G3 X129.373 Y126.911 I-.735 J-.804 E.12916
G1 X129.468 Y126.913 E.00291
G3 X130.274 Y128.646 I-.07 J1.087 E.07167
G1 X130.175 Y128.759 E.00462
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515281
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.412 Y127.754 E.00753
G1 X129.229 Y127.822 E.00751
G1 X129.156 Y127.938 E.00528
G1 X129.185 Y128.131 E.00753
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00476
G1 X129.615 Y128.1 E.00749
G1 X129.629 Y128.058 E.0017
; CHANGE_LAYER
; Z_HEIGHT: 27.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02302
G1 X129.478 Y128.239 E-.10161
G1 X129.355 Y128.235 E-.0646
G1 X129.185 Y128.131 E-.10367
G1 X129.156 Y127.938 E-.10207
G1 X129.229 Y127.822 E-.07165
G1 X129.412 Y127.754 E-.10188
G1 X129.588 Y127.841 E-.10217
G1 X129.647 Y128.001 E-.08934
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 138/650
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
G3 Z27.8 I-1.115 J.487 P1  F30000
G1 X129.871 Y128.513 Z27.8
G1 Z27.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.471 J-.514 E.0892
G1 X129.446 Y127.304 E.00207
G3 X129.914 Y128.471 I-.046 J.695 E.05196
G1 X130.133 Y128.803 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.735 J-.804 E.12916
G1 X129.468 Y126.913 E.00291
G3 X130.176 Y128.761 I-.07 J1.087 E.07634
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515061
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.412 Y127.754 E.00753
G1 X129.229 Y127.822 E.00751
G1 X129.156 Y127.938 E.00528
G1 X129.181 Y128.121 E.00711
G1 X129.38 Y128.251 E.00914
G1 X129.562 Y128.19 E.00738
G1 X129.623 Y128.056 E.00565
; CHANGE_LAYER
; Z_HEIGHT: 27.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.562 Y128.19 E-.07639
G1 X129.38 Y128.251 E-.09986
G1 X129.181 Y128.121 E-.12364
G1 X129.156 Y127.938 E-.09611
G1 X129.229 Y127.822 E-.07145
G1 X129.412 Y127.754 E-.10155
G1 X129.588 Y127.841 E-.10191
G1 X129.647 Y128.001 E-.08908
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 139/650
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
G3 Z28 I-1.115 J.487 P1  F30000
G1 X129.871 Y128.513 Z28
G1 Z27.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.471 J-.514 E.08921
G1 X129.446 Y127.304 E.00207
G3 X129.914 Y128.471 I-.046 J.695 E.05196
G1 X130.133 Y128.803 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.735 J-.804 E.12916
G1 X129.468 Y126.913 E.0029
G3 X130.176 Y128.761 I-.07 J1.087 E.07634
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515018
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.412 Y127.754 E.00754
G1 X129.229 Y127.822 E.00751
G1 X129.161 Y127.928 E.00485
G1 X129.206 Y128.161 E.00914
G1 X129.381 Y128.251 E.00757
G1 X129.562 Y128.19 E.00734
G1 X129.623 Y128.056 E.00565
; CHANGE_LAYER
; Z_HEIGHT: 28
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.562 Y128.19 E-.07638
G1 X129.381 Y128.251 E-.09928
G1 X129.206 Y128.161 E-.10241
G1 X129.161 Y127.928 E-.12365
G1 X129.229 Y127.822 E-.06566
G1 X129.412 Y127.754 E-.10159
G1 X129.588 Y127.841 E-.10194
G1 X129.647 Y128.001 E-.08909
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 140/650
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
G3 Z28.2 I-1.115 J.487 P1  F30000
G1 X129.871 Y128.513 Z28.2
G1 Z28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.471 J-.514 E.08921
G1 X129.446 Y127.304 E.00206
G3 X129.914 Y128.471 I-.046 J.695 E.05196
G1 X130.133 Y128.803 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.735 J-.803 E.12917
G1 X129.468 Y126.913 E.0029
G3 X130.176 Y128.761 I-.07 J1.087 E.07634
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515302
G1 F1200
G1 X129.588 Y127.841 E.00659
G1 X129.412 Y127.754 E.00754
G1 X129.229 Y127.822 E.0075
G1 X129.156 Y127.938 E.00528
G1 X129.185 Y128.131 E.00752
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00476
G1 X129.615 Y128.1 E.00749
G1 X129.629 Y128.058 E.00169
; CHANGE_LAYER
; Z_HEIGHT: 28.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02298
G1 X129.478 Y128.239 E-.10165
G1 X129.355 Y128.235 E-.06457
G1 X129.185 Y128.131 E-.10368
G1 X129.156 Y127.938 E-.10206
G1 X129.229 Y127.822 E-.07167
G1 X129.412 Y127.754 E-.10178
G1 X129.588 Y127.841 E-.10228
G1 X129.647 Y128.001 E-.08932
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 141/650
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
G3 Z28.4 I-1.115 J.488 P1  F30000
G1 X129.871 Y128.513 Z28.4
G1 Z28.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.471 J-.514 E.08922
G1 X129.446 Y127.304 E.00206
G3 X129.914 Y128.471 I-.046 J.695 E.05196
G1 X130.133 Y128.803 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.735 J-.803 E.12917
G1 X129.467 Y126.913 E.00289
G3 X130.176 Y128.761 I-.07 J1.087 E.07634
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51505
G1 F1200
G1 X129.588 Y127.841 E.00658
G1 X129.412 Y127.754 E.00754
G1 X129.229 Y127.822 E.0075
G1 X129.154 Y127.978 E.00666
G1 X129.221 Y128.175 E.00802
G1 X129.381 Y128.251 E.00682
G1 X129.562 Y128.189 E.00734
G1 X129.623 Y128.056 E.00564
; CHANGE_LAYER
; Z_HEIGHT: 28.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.562 Y128.189 E-.07643
G1 X129.381 Y128.251 E-.09949
G1 X129.221 Y128.175 E-.09236
G1 X129.154 Y127.978 E-.10858
G1 X129.229 Y127.822 E-.09017
G1 X129.412 Y127.754 E-.10161
G1 X129.588 Y127.841 E-.10217
G1 X129.647 Y128.001 E-.08919
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 142/650
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
G3 Z28.6 I-1.115 J.488 P1  F30000
G1 X129.871 Y128.513 Z28.6
G1 Z28.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.471 J-.513 E.08922
G1 X129.446 Y127.304 E.00206
G3 X129.914 Y128.471 I-.045 J.695 E.05195
G1 X130.133 Y128.803 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.735 J-.803 E.12918
G1 X129.467 Y126.913 E.00289
G3 X130.176 Y128.761 I-.07 J1.087 E.07633
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515265
G1 F1200
G1 X129.588 Y127.841 E.00658
G1 X129.412 Y127.754 E.00755
G1 X129.229 Y127.822 E.0075
G1 X129.161 Y127.928 E.00488
G1 X129.188 Y128.128 E.00775
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00748
G1 X129.629 Y128.058 E.00169
; CHANGE_LAYER
; Z_HEIGHT: 28.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02291
G1 X129.479 Y128.239 E-.10121
G1 X129.285 Y128.224 E-.10109
G1 X129.188 Y128.128 E-.07114
G1 X129.161 Y127.928 E-.10486
G1 X129.229 Y127.822 E-.06603
G1 X129.412 Y127.754 E-.1015
G1 X129.588 Y127.841 E-.10213
G1 X129.647 Y128.001 E-.08912
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 143/650
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
G3 Z28.8 I-1.115 J.488 P1  F30000
G1 X129.871 Y128.513 Z28.8
G1 Z28.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.471 J-.513 E.08923
G1 X129.446 Y127.304 E.00205
G3 X129.914 Y128.47 I-.045 J.695 E.05195
G1 X130.133 Y128.802 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.735 J-.803 E.12919
G1 X129.467 Y126.913 E.00289
G3 X130.176 Y128.761 I-.07 J1.087 E.07633
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515056
G1 F1200
G1 X129.588 Y127.841 E.00658
G1 X129.412 Y127.754 E.00755
G1 X129.229 Y127.822 E.0075
G1 X129.154 Y127.977 E.00666
G1 X129.221 Y128.175 E.00802
G1 X129.381 Y128.251 E.00681
G1 X129.562 Y128.189 E.00735
G1 X129.623 Y128.056 E.00564
; CHANGE_LAYER
; Z_HEIGHT: 28.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.562 Y128.189 E-.07637
G1 X129.381 Y128.251 E-.09955
G1 X129.221 Y128.175 E-.0923
G1 X129.154 Y127.977 E-.10866
G1 X129.229 Y127.822 E-.09017
G1 X129.412 Y127.754 E-.10154
G1 X129.588 Y127.841 E-.10224
G1 X129.647 Y128.001 E-.08917
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 144/650
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
G3 Z29 I-1.115 J.488 P1  F30000
G1 X129.871 Y128.513 Z29
G1 Z28.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.471 J-.513 E.08923
G1 X129.446 Y127.304 E.00205
G3 X129.914 Y128.47 I-.045 J.695 E.05195
G1 X130.133 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.00387
G3 X129.373 Y126.911 I-.636 J-.884 E.12526
G1 X129.467 Y126.913 E.00288
G3 X130.174 Y128.763 I-.069 J1.087 E.07644
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515037
G1 F1200
G1 X129.588 Y127.841 E.00658
G1 X129.412 Y127.754 E.00755
G1 X129.229 Y127.822 E.0075
G1 X129.161 Y127.928 E.00485
G1 X129.206 Y128.161 E.00914
G1 X129.381 Y128.251 E.00757
G1 X129.562 Y128.189 E.00735
G1 X129.623 Y128.056 E.00564
; CHANGE_LAYER
; Z_HEIGHT: 29
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.562 Y128.189 E-.07623
G1 X129.381 Y128.251 E-.09944
G1 X129.206 Y128.161 E-.10243
G1 X129.161 Y127.928 E-.12366
G1 X129.229 Y127.822 E-.06561
G1 X129.412 Y127.754 E-.10145
G1 X129.588 Y127.841 E-.10214
G1 X129.647 Y128.001 E-.08904
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 145/650
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
G3 Z29.2 I-1.115 J.488 P1  F30000
G1 X129.872 Y128.513 Z29.2
G1 Z29
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.471 J-.513 E.08924
G1 X129.446 Y127.304 E.00205
G3 X129.914 Y128.47 I-.045 J.695 E.05195
G1 X130.133 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.00385
G3 X129.373 Y126.911 I-.636 J-.884 E.12526
G1 X129.467 Y126.913 E.00288
G3 X130.174 Y128.763 I-.069 J1.087 E.07645
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515297
G1 F1200
G1 X129.588 Y127.841 E.00658
G1 X129.412 Y127.754 E.00755
G1 X129.229 Y127.822 E.00749
G1 X129.161 Y127.928 E.00488
G1 X129.188 Y128.128 E.00775
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00748
G1 X129.629 Y128.058 E.00169
; CHANGE_LAYER
; Z_HEIGHT: 29.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02288
G1 X129.479 Y128.239 E-.10127
G1 X129.285 Y128.224 E-.10107
G1 X129.188 Y128.128 E-.07119
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.822 E-.06602
G1 X129.412 Y127.754 E-.1014
G1 X129.588 Y127.841 E-.10225
G1 X129.647 Y128.001 E-.08909
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 146/650
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
G3 Z29.4 I-1.114 J.489 P1  F30000
G1 X129.872 Y128.513 Z29.4
G1 Z29.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.471 J-.513 E.08924
G1 X129.445 Y127.304 E.00204
G3 X129.914 Y128.47 I-.045 J.695 E.05195
G1 X130.132 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.00383
G3 X129.373 Y126.911 I-.636 J-.884 E.12526
G1 X129.467 Y126.913 E.00288
G3 X130.173 Y128.764 I-.069 J1.087 E.07647
M204 S10000
G1 X129.639 Y127.997 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514888
G1 F1200
G1 X129.617 Y127.872 E.00488
G1 X129.477 Y127.776 E.00654
G1 X129.314 Y127.778 E.00628
G1 X129.199 Y127.848 E.00516
G1 X129.152 Y128.026 E.0071
G1 X129.284 Y128.224 E.00914
M73 P56 R6
G1 X129.479 Y128.239 E.00751
G1 X129.621 Y128.117 E.00719
G1 X129.63 Y128.057 E.00235
; CHANGE_LAYER
; Z_HEIGHT: 29.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.621 Y128.117 E-.03187
G1 X129.479 Y128.239 E-.09735
G1 X129.284 Y128.224 E-.10169
G1 X129.152 Y128.026 E-.1237
G1 X129.199 Y127.848 E-.09611
G1 X129.314 Y127.778 E-.06981
G1 X129.477 Y127.776 E-.08493
G1 X129.617 Y127.872 E-.08853
G1 X129.639 Y127.997 E-.06602
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 147/650
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
G3 Z29.6 I-1.109 J.502 P1  F30000
G1 X129.872 Y128.513 Z29.6
G1 Z29.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.471 J-.513 E.08925
G1 X129.445 Y127.304 E.00204
G3 X129.914 Y128.47 I-.045 J.695 E.05195
G1 X130.132 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.00381
G3 X129.373 Y126.911 I-.636 J-.884 E.12526
G1 X129.467 Y126.912 E.00287
G3 X130.173 Y128.764 I-.069 J1.087 E.07649
M204 S10000
G1 X129.638 Y127.997 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515692
G1 F1200
G1 X129.617 Y127.873 E.00488
G1 X129.477 Y127.777 E.00654
G1 X129.314 Y127.778 E.00628
G1 X129.2 Y127.848 E.00516
G1 X129.151 Y128.037 E.00753
G1 X129.247 Y128.197 E.00716
G1 X129.438 Y128.244 E.00758
G1 X129.594 Y128.153 E.00695
G1 X129.622 Y128.055 E.00393
; CHANGE_LAYER
; Z_HEIGHT: 29.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.153 E-.05331
G1 X129.438 Y128.244 E-.09429
G1 X129.247 Y128.197 E-.1029
G1 X129.151 Y128.037 E-.09722
G1 X129.2 Y127.848 E-.10212
G1 X129.314 Y127.778 E-.06999
G1 X129.477 Y127.777 E-.08518
G1 X129.617 Y127.873 E-.08882
G1 X129.638 Y127.997 E-.06617
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 148/650
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
G3 Z29.8 I-1.108 J.502 P1  F30000
G1 X129.872 Y128.513 Z29.8
G1 Z29.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.472 J-.513 E.08925
G1 X129.445 Y127.304 E.00203
G3 X129.914 Y128.47 I-.045 J.695 E.05195
G1 X130.131 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.00379
G3 X129.373 Y126.911 I-.636 J-.884 E.12526
G1 X129.467 Y126.912 E.00287
G3 X130.172 Y128.764 I-.069 J1.087 E.07651
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514761
G1 F1200
G2 X129.412 Y127.754 I-.271 J.01 E.01456
G1 X129.229 Y127.822 E.00749
G1 X129.161 Y127.928 E.00485
G1 X129.167 Y128.079 E.00583
G1 X129.296 Y128.224 E.00747
G1 X129.431 Y128.25 E.00529
G1 X129.595 Y128.156 E.00723
G1 X129.626 Y128.069 E.00359
; CHANGE_LAYER
; Z_HEIGHT: 29.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04831
G1 X129.431 Y128.25 E-.09739
G1 X129.296 Y128.224 E-.07123
G1 X129.167 Y128.079 E-.10063
G1 X129.161 Y127.928 E-.07858
G1 X129.229 Y127.822 E-.06529
G1 X129.412 Y127.754 E-.10091
G1 X129.552 Y127.802 E-.07699
G1 X129.619 Y127.904 E-.06324
G1 X129.646 Y128.012 E-.05743
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 149/650
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
G3 Z30 I-1.109 J.501 P1  F30000
G1 X129.872 Y128.512 Z30
G1 Z29.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.472 J-.513 E.08926
G1 X129.445 Y127.304 E.00203
G3 X129.914 Y128.47 I-.045 J.695 E.05194
G1 X130.131 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.00378
G3 X129.373 Y126.911 I-.636 J-.884 E.12526
G1 X129.466 Y126.912 E.00286
G3 X130.172 Y128.765 I-.069 J1.087 E.07652
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515976
G1 F1200
G2 X129.552 Y127.803 I-.347 J.029 E.00901
G1 X129.321 Y127.761 E.00904
G1 X129.174 Y127.891 E.00757
G1 X129.164 Y128.086 E.00752
G1 X129.284 Y128.22 E.00695
G1 X129.487 Y128.231 E.00782
G1 X129.594 Y128.156 E.00505
G1 X129.625 Y128.069 E.00359
; CHANGE_LAYER
; Z_HEIGHT: 30
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04823
G1 X129.487 Y128.231 E-.06793
G1 X129.284 Y128.22 E-.10519
G1 X129.164 Y128.086 E-.09349
G1 X129.174 Y127.891 E-.10115
G1 X129.321 Y127.761 E-.10182
G1 X129.552 Y127.803 E-.12159
G1 X129.619 Y127.905 E-.06317
G1 X129.646 Y128.012 E-.05741
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 150/650
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
G3 Z30.2 I-1.109 J.502 P1  F30000
G1 X129.872 Y128.512 Z30.2
G1 Z30
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.472 J-.513 E.08926
G1 X129.445 Y127.304 E.00203
G3 X129.914 Y128.47 I-.045 J.695 E.05194
G1 X130.131 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.00376
G3 X129.373 Y126.911 I-.636 J-.884 E.12526
G1 X129.466 Y126.912 E.00286
G3 X130.172 Y128.765 I-.069 J1.087 E.07654
M204 S10000
G1 X129.645 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516819
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.009
G1 X129.321 Y127.762 E.00904
G1 X129.174 Y127.891 E.00758
G1 X129.164 Y128.086 E.00753
G1 X129.289 Y128.223 E.00714
G1 X129.486 Y128.231 E.00762
G1 X129.594 Y128.156 E.00508
G1 X129.625 Y128.068 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 30.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04811
G1 X129.486 Y128.231 E-.06827
G1 X129.289 Y128.223 E-.10249
G1 X129.164 Y128.086 E-.09596
G1 X129.174 Y127.891 E-.10122
G1 X129.321 Y127.762 E-.10189
G1 X129.552 Y127.803 E-.12159
G1 X129.618 Y127.905 E-.06306
G1 X129.645 Y128.012 E-.05741
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 151/650
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
G3 Z30.4 I-1.108 J.503 P1  F30000
G1 X129.872 Y128.512 Z30.4
G1 Z30.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.472 J-.513 E.08927
G1 X129.445 Y127.304 E.00202
G3 X129.914 Y128.47 I-.045 J.695 E.05194
G1 X130.13 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.00376
G3 X129.373 Y126.911 I-.636 J-.884 E.12526
G1 X129.466 Y126.912 E.00286
G3 X130.172 Y128.765 I-.069 J1.087 E.07654
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515966
G1 F1200
G2 X129.552 Y127.803 I-.347 J.029 E.00901
G1 X129.321 Y127.761 E.00904
G1 X129.174 Y127.891 E.00757
G1 X129.164 Y128.086 E.00752
G1 X129.284 Y128.22 E.00695
G1 X129.487 Y128.231 E.00782
G1 X129.594 Y128.156 E.00505
G1 X129.625 Y128.069 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 30.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.0482
G1 X129.487 Y128.231 E-.06798
G1 X129.284 Y128.22 E-.10519
G1 X129.164 Y128.086 E-.09349
G1 X129.174 Y127.891 E-.10116
G1 X129.321 Y127.761 E-.10183
G1 X129.552 Y127.803 E-.12157
G1 X129.619 Y127.905 E-.06322
G1 X129.646 Y128.012 E-.05737
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 152/650
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
G3 Z30.6 I-1.109 J.502 P1  F30000
G1 X129.872 Y128.512 Z30.6
G1 Z30.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.472 J-.513 E.08927
G1 X129.445 Y127.304 E.00202
G3 X129.914 Y128.47 I-.045 J.695 E.05194
G1 X130.131 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.00376
G3 X129.373 Y126.911 I-.636 J-.884 E.12526
G1 X129.466 Y126.912 E.00285
G3 X130.172 Y128.765 I-.069 J1.087 E.07654
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514812
G1 F1200
G2 X129.411 Y127.754 I-.271 J.01 E.01457
G1 X129.229 Y127.821 E.00747
G1 X129.154 Y127.977 E.00666
G1 X129.216 Y128.164 E.00756
G1 X129.392 Y128.247 E.00746
G1 X129.556 Y128.191 E.00666
G1 X129.619 Y128.066 E.0054
; CHANGE_LAYER
; Z_HEIGHT: 30.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.556 Y128.191 E-.07345
G1 X129.392 Y128.247 E-.0906
G1 X129.216 Y128.164 E-.10147
G1 X129.154 Y127.977 E-.10276
G1 X129.229 Y127.821 E-.0905
G1 X129.411 Y127.754 E-.1016
G1 X129.552 Y127.802 E-.07783
G1 X129.619 Y127.905 E-.06393
G1 X129.646 Y128.012 E-.05788
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 153/650
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
G3 Z30.8 I-1.109 J.501 P1  F30000
G1 X129.872 Y128.512 Z30.8
G1 Z30.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.472 J-.513 E.08927
G1 X129.445 Y127.304 E.00202
G3 X129.914 Y128.47 I-.045 J.695 E.05194
G1 X130.131 Y128.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.00378
G3 X129.373 Y126.911 I-.636 J-.884 E.12527
G1 X129.466 Y126.912 E.00285
G3 X130.172 Y128.765 I-.069 J1.087 E.07653
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515299
G1 F1200
G2 X129.552 Y127.802 I-.347 J.03 E.009
G1 X129.321 Y127.761 E.00904
G1 X129.173 Y127.891 E.00758
G1 X129.161 Y128.072 E.00698
G1 X129.296 Y128.224 E.00784
G1 X129.431 Y128.25 E.0053
G1 X129.594 Y128.156 E.00724
G1 X129.626 Y128.069 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 30.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04814
G1 X129.431 Y128.25 E-.09732
G1 X129.296 Y128.224 E-.0713
G1 X129.161 Y128.072 E-.10546
G1 X129.173 Y127.891 E-.09384
G1 X129.321 Y127.761 E-.1019
G1 X129.552 Y127.802 E-.12154
G1 X129.619 Y127.905 E-.06324
G1 X129.646 Y128.012 E-.05726
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 154/650
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
G3 Z31 I-1.109 J.502 P1  F30000
G1 X129.872 Y128.512 Z31
G1 Z30.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.472 J-.513 E.08928
G1 X129.445 Y127.304 E.00201
G3 X129.915 Y128.47 I-.045 J.695 E.05194
G1 X130.132 Y128.807 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.0038
G3 X129.373 Y126.911 I-.636 J-.884 E.12527
G1 X129.466 Y126.912 E.00285
G3 X130.173 Y128.764 I-.069 J1.087 E.07651
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515162
G1 F1200
G2 X129.552 Y127.802 I-.347 J.03 E.009
G1 X129.321 Y127.761 E.00904
G1 X129.173 Y127.891 E.0076
G1 X129.175 Y128.081 E.00729
G1 X129.243 Y128.197 E.00518
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00724
G1 X129.626 Y128.069 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 31
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04822
G1 X129.431 Y128.25 E-.09752
G1 X129.243 Y128.197 E-.10144
G1 X129.175 Y128.081 E-.06977
G1 X129.173 Y127.891 E-.09821
G1 X129.321 Y127.761 E-.10236
G1 X129.552 Y127.802 E-.12176
G1 X129.619 Y127.905 E-.06338
G1 X129.646 Y128.012 E-.05735
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 155/650
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
G3 Z31.2 I-1.109 J.502 P1  F30000
G1 X129.872 Y128.512 Z31.2
G1 Z31
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.472 J-.512 E.08929
G1 X129.445 Y127.304 E.00201
G3 X129.915 Y128.469 I-.044 J.695 E.05194
G1 X130.132 Y128.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.00384
G3 X129.373 Y126.911 I-.636 J-.884 E.12527
G1 X129.466 Y126.912 E.00284
G3 X130.173 Y128.763 I-.068 J1.087 E.07648
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514807
G1 F1200
G2 X129.411 Y127.754 I-.271 J.01 E.01457
G1 X129.229 Y127.821 E.00746
G1 X129.154 Y127.977 E.00666
G1 X129.216 Y128.164 E.00757
G1 X129.392 Y128.247 E.00746
G1 X129.556 Y128.191 E.00667
G1 X129.619 Y128.066 E.0054
; CHANGE_LAYER
; Z_HEIGHT: 31.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.556 Y128.191 E-.07344
G1 X129.392 Y128.247 E-.09063
G1 X129.216 Y128.164 E-.10136
G1 X129.154 Y127.977 E-.10286
G1 X129.229 Y127.821 E-.0905
G1 X129.411 Y127.754 E-.10149
G1 X129.552 Y127.802 E-.07791
G1 X129.619 Y127.905 E-.06399
G1 X129.646 Y128.012 E-.05782
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 156/650
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
G3 Z31.4 I-1.109 J.502 P1  F30000
G1 X129.872 Y128.512 Z31.4
G1 Z31.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.472 J-.512 E.08929
G1 X129.444 Y127.304 E.002
G3 X129.915 Y128.469 I-.044 J.695 E.05194
G1 X130.134 Y128.805 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.00389
G3 X129.373 Y126.911 I-.636 J-.884 E.12527
G1 X129.466 Y126.912 E.00284
G3 X130.174 Y128.762 I-.068 J1.087 E.07645
M204 S10000
G1 X129.622 Y128.079 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514804
G1 F1200
G1 X129.619 Y127.905 E.0067
G1 X129.552 Y127.802 E.00471
G1 X129.411 Y127.754 E.00573
G1 X129.229 Y127.821 E.00746
G1 X129.154 Y127.977 E.00666
M73 P57 R6
G1 X129.216 Y128.164 E.00757
G1 X129.392 Y128.247 E.00745
G1 X129.524 Y128.219 E.00522
G1 X129.588 Y128.128 E.00425
; CHANGE_LAYER
; Z_HEIGHT: 31.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.524 Y128.219 E-.05792
G1 X129.392 Y128.247 E-.07118
G1 X129.216 Y128.164 E-.10158
G1 X129.154 Y127.977 E-.10316
G1 X129.229 Y127.821 E-.09074
G1 X129.411 Y127.754 E-.10172
G1 X129.552 Y127.802 E-.07814
G1 X129.619 Y127.905 E-.06417
G1 X129.622 Y128.079 E-.09138
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 157/650
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
G3 Z31.6 I-1.054 J.609 P1  F30000
G1 X129.872 Y128.512 Z31.6
G1 Z31.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.472 J-.512 E.08929
G1 X129.444 Y127.304 E.002
G3 X129.915 Y128.469 I-.044 J.695 E.05194
G1 X130.135 Y128.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.034 Y128.883 E.00395
G3 X129.373 Y126.911 I-.636 J-.884 E.12527
G1 X129.466 Y126.912 E.00283
G3 X130.175 Y128.762 I-.068 J1.087 E.07641
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514984
G1 F1200
G2 X129.411 Y127.754 I-.271 J.01 E.01458
G1 X129.229 Y127.822 E.00746
G1 X129.156 Y127.938 E.00529
G1 X129.185 Y128.131 E.00753
G1 X129.319 Y128.223 E.00625
G1 X129.493 Y128.22 E.00668
G2 X129.626 Y128.069 I-.03 J-.16 E.00835
; CHANGE_LAYER
; Z_HEIGHT: 31.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04844
G1 X129.493 Y128.22 E-.06257
G1 X129.319 Y128.223 E-.09052
G1 X129.185 Y128.131 E-.08466
G1 X129.156 Y127.938 E-.10196
G1 X129.229 Y127.822 E-.07166
G1 X129.411 Y127.754 E-.10107
G1 X129.552 Y127.802 E-.07771
G1 X129.619 Y127.905 E-.06381
G1 X129.646 Y128.012 E-.05758
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 158/650
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
G3 Z31.8 I-1.108 J.502 P1  F30000
G1 X129.872 Y128.512 Z31.8
G1 Z31.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.472 J-.512 E.0893
G1 X129.444 Y127.304 E.002
G3 X129.915 Y128.469 I-.044 J.695 E.05194
G1 X130.137 Y128.802 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.134 Y128.801 E.00009
G3 X129.373 Y126.911 I-.737 J-.802 E.12926
G1 X129.465 Y126.912 E.00283
G3 X130.275 Y128.644 I-.068 J1.087 E.07167
G1 X130.176 Y128.757 E.00461
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515647
G1 F1200
G2 X129.552 Y127.803 I-.347 J.03 E.009
G1 X129.321 Y127.761 E.00903
G1 X129.173 Y127.891 E.00757
G1 X129.175 Y128.08 E.00728
G1 X129.243 Y128.197 E.00522
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00724
G1 X129.625 Y128.069 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 31.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04815
G1 X129.431 Y128.25 E-.09755
G1 X129.243 Y128.197 E-.10143
G1 X129.175 Y128.08 E-.07038
G1 X129.173 Y127.891 E-.09803
G1 X129.321 Y127.761 E-.10205
G1 X129.552 Y127.803 E-.12172
G1 X129.619 Y127.905 E-.06344
G1 X129.646 Y128.012 E-.05726
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 159/650
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
G3 Z32 I-1.108 J.503 P1  F30000
G1 X129.872 Y128.512 Z32
G1 Z31.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.472 J-.512 E.0893
G1 X129.444 Y127.304 E.00199
G3 X129.915 Y128.469 I-.044 J.695 E.05193
G1 X130.139 Y128.8 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.134 Y128.801 E.00015
G3 X129.373 Y126.911 I-.737 J-.802 E.12927
G1 X129.465 Y126.912 E.00283
G3 X130.275 Y128.644 I-.068 J1.087 E.07167
G1 X130.179 Y128.755 E.00451
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514998
G1 F1200
G2 X129.411 Y127.754 I-.271 J.01 E.01458
G1 X129.229 Y127.822 E.00745
G1 X129.156 Y127.938 E.00529
G1 X129.185 Y128.131 E.00752
G1 X129.319 Y128.223 E.00625
G1 X129.493 Y128.22 E.00668
G2 X129.626 Y128.069 I-.03 J-.16 E.00836
; CHANGE_LAYER
; Z_HEIGHT: 32
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04842
G1 X129.493 Y128.22 E-.06262
G1 X129.319 Y128.223 E-.09049
G1 X129.185 Y128.131 E-.08467
G1 X129.156 Y127.938 E-.10196
G1 X129.229 Y127.822 E-.07167
G1 X129.411 Y127.754 E-.10101
G1 X129.552 Y127.802 E-.07777
G1 X129.619 Y127.905 E-.06385
G1 X129.646 Y128.012 E-.05755
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 160/650
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
G3 Z32.2 I-1.108 J.503 P1  F30000
G1 X129.873 Y128.512 Z32.2
G1 Z32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.473 J-.512 E.08931
G1 X129.444 Y127.304 E.00199
G3 X129.915 Y128.469 I-.044 J.695 E.05193
G1 X130.142 Y128.797 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.801 E.00025
G3 X129.373 Y126.911 I-.737 J-.801 E.12927
G1 X129.465 Y126.912 E.00282
G3 X130.275 Y128.644 I-.068 J1.087 E.07167
G1 X130.181 Y128.752 E.0044
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515959
G1 F1200
G2 X129.552 Y127.803 I-.347 J.03 E.00901
G1 X129.321 Y127.761 E.00903
G1 X129.174 Y127.891 E.00757
G1 X129.164 Y128.086 E.00752
G1 X129.284 Y128.221 E.00697
G1 X129.487 Y128.231 E.0078
G1 X129.594 Y128.156 E.00507
G1 X129.625 Y128.069 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 32.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04806
G1 X129.487 Y128.231 E-.06816
G1 X129.284 Y128.221 E-.1049
G1 X129.164 Y128.086 E-.09375
G1 X129.174 Y127.891 E-.10115
G1 X129.321 Y127.761 E-.10188
G1 X129.552 Y127.803 E-.1215
G1 X129.619 Y127.905 E-.06342
G1 X129.646 Y128.012 E-.05717
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 161/650
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
G3 Z32.4 I-1.108 J.503 P1  F30000
G1 X129.873 Y128.512 Z32.4
G1 Z32.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.473 J-.512 E.08931
G1 X129.444 Y127.304 E.00199
G3 X129.915 Y128.469 I-.044 J.695 E.05193
G1 X130.145 Y128.794 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.801 E.00038
G3 X129.373 Y126.911 I-.737 J-.801 E.12928
G1 X129.465 Y126.912 E.00282
G3 X130.275 Y128.644 I-.068 J1.087 E.07167
G1 X130.184 Y128.749 E.00426
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515009
G1 F1200
G2 X129.411 Y127.754 I-.271 J.011 E.01459
G1 X129.229 Y127.822 E.00745
G1 X129.156 Y127.938 E.00529
G1 X129.185 Y128.131 E.00753
G1 X129.319 Y128.223 E.00625
G1 X129.493 Y128.22 E.00668
G2 X129.626 Y128.069 I-.03 J-.16 E.00836
; CHANGE_LAYER
; Z_HEIGHT: 32.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04839
G1 X129.493 Y128.22 E-.06268
G1 X129.319 Y128.223 E-.09046
G1 X129.185 Y128.131 E-.08466
G1 X129.156 Y127.938 E-.10196
G1 X129.229 Y127.822 E-.07168
G1 X129.411 Y127.754 E-.10094
G1 X129.552 Y127.802 E-.07782
G1 X129.619 Y127.905 E-.0639
G1 X129.646 Y128.012 E-.0575
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 162/650
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
G3 Z32.6 I-1.108 J.503 P1  F30000
G1 X129.873 Y128.511 Z32.6
G1 Z32.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.473 J-.512 E.08932
G1 X129.444 Y127.304 E.00198
G3 X129.915 Y128.469 I-.044 J.695 E.05193
G1 X130.148 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.801 E.00053
G3 X129.373 Y126.911 I-.737 J-.801 E.12928
G1 X129.465 Y126.912 E.00282
G3 X130.275 Y128.644 I-.068 J1.087 E.07167
G1 X130.188 Y128.745 E.0041
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515646
G1 F1200
G2 X129.552 Y127.803 I-.347 J.03 E.009
G1 X129.321 Y127.761 E.00903
G1 X129.174 Y127.891 E.00758
G1 X129.175 Y128.08 E.00728
G1 X129.243 Y128.197 E.00522
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00725
G1 X129.625 Y128.069 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 32.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04809
G1 X129.431 Y128.25 E-.09761
G1 X129.243 Y128.197 E-.10143
G1 X129.175 Y128.08 E-.07038
G1 X129.174 Y127.891 E-.09804
G1 X129.321 Y127.761 E-.10207
M73 P57 R5
G1 X129.552 Y127.803 E-.12169
G1 X129.619 Y127.905 E-.06352
G1 X129.646 Y128.012 E-.05718
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 163/650
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
G3 Z32.8 I-1.108 J.504 P1  F30000
G1 X129.873 Y128.511 Z32.8
G1 Z32.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.473 J-.512 E.08932
G1 X129.444 Y127.304 E.00198
G3 X129.915 Y128.469 I-.044 J.695 E.05193
G1 X130.152 Y128.785 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.8 E.00071
G3 X129.373 Y126.911 I-.738 J-.801 E.12929
G1 X129.465 Y126.912 E.00281
G3 X130.275 Y128.644 I-.068 J1.087 E.07167
G1 X130.192 Y128.74 E.00392
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515021
G1 F1200
G2 X129.411 Y127.754 I-.271 J.011 E.01459
G1 X129.229 Y127.821 E.00744
G1 X129.156 Y127.938 E.00529
G1 X129.185 Y128.131 E.00752
G1 X129.319 Y128.223 E.00625
G1 X129.493 Y128.22 E.00667
G2 X129.626 Y128.069 I-.03 J-.16 E.00836
; CHANGE_LAYER
; Z_HEIGHT: 32.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04836
G1 X129.493 Y128.22 E-.06274
G1 X129.319 Y128.223 E-.09043
G1 X129.185 Y128.131 E-.08467
G1 X129.156 Y127.938 E-.10196
G1 X129.229 Y127.821 E-.07169
G1 X129.411 Y127.754 E-.10087
G1 X129.552 Y127.802 E-.07789
G1 X129.619 Y127.905 E-.06393
G1 X129.646 Y128.012 E-.05747
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 164/650
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
G3 Z33 I-1.108 J.503 P1  F30000
G1 X129.873 Y128.511 Z33
G1 Z32.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.473 J-.512 E.08933
G1 X129.444 Y127.304 E.00198
G3 X129.915 Y128.469 I-.044 J.695 E.05193
G1 X130.157 Y128.78 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.8 E.00092
G3 X129.373 Y126.911 I-.738 J-.801 E.1293
G1 X129.465 Y126.912 E.00281
G3 X130.275 Y128.644 I-.068 J1.087 E.07167
G1 X130.196 Y128.735 E.00371
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515204
G1 F1200
G2 X129.552 Y127.802 I-.347 J.03 E.009
G1 X129.321 Y127.761 E.00903
G1 X129.173 Y127.891 E.0076
G1 X129.175 Y128.081 E.00729
G1 X129.243 Y128.197 E.00518
G1 X129.431 Y128.25 E.00753
G1 X129.595 Y128.156 E.00725
G1 X129.626 Y128.069 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 33
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04808
G1 X129.431 Y128.25 E-.09767
G1 X129.243 Y128.197 E-.10145
G1 X129.175 Y128.081 E-.06974
G1 X129.173 Y127.891 E-.09824
G1 X129.321 Y127.761 E-.10239
G1 X129.552 Y127.802 E-.12169
G1 X129.619 Y127.905 E-.06361
G1 X129.646 Y128.012 E-.05713
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 165/650
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
G3 Z33.2 I-1.108 J.504 P1  F30000
G1 X129.873 Y128.511 Z33.2
G1 Z33
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.473 J-.512 E.08934
G1 X129.443 Y127.304 E.00197
G3 X129.915 Y128.468 I-.044 J.695 E.05192
G1 X130.162 Y128.775 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.8 E.00114
G3 X129.373 Y126.911 I-.738 J-.801 E.12931
G1 X129.465 Y126.912 E.0028
G3 X130.275 Y128.643 I-.067 J1.087 E.07166
G1 X130.201 Y128.729 E.00349
M204 S10000
G1 X129.622 Y128.079 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514771
G1 F1200
G1 X129.619 Y127.905 E.00668
G1 X129.552 Y127.802 E.00473
G1 X129.411 Y127.754 E.00575
G1 X129.229 Y127.821 E.00744
G1 X129.154 Y127.977 E.00666
G1 X129.217 Y128.164 E.00759
G1 X129.391 Y128.247 E.00743
G1 X129.524 Y128.219 E.00522
G1 X129.588 Y128.128 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 33.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.524 Y128.219 E-.05809
G1 X129.391 Y128.247 E-.07115
G1 X129.217 Y128.164 E-.10126
G1 X129.154 Y127.977 E-.10348
G1 X129.229 Y127.821 E-.09073
G1 X129.411 Y127.754 E-.1014
G1 X129.552 Y127.802 E-.0784
G1 X129.619 Y127.905 E-.0644
G1 X129.622 Y128.079 E-.09108
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 166/650
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
G3 Z33.4 I-.891 J.829 P1  F30000
G1 X129.963 Y128.446 Z33.4
G1 Z33.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.811 Y128.564 E.0064
G3 X129.417 Y128.697 I-.524 J-.899 E.01387
G3 X129.811 Y127.436 I-.017 J-.697 E.08776
G1 X130.025 Y127.602 E.00898
G1 X130.698 Y127.602 E.02232
G1 X130.698 Y128.398 E.0264
G1 X130.443 Y128.398 E.00846
G1 X130.025 Y128.398 E.01386
G1 X130.011 Y128.409 E.00059
G1 X130.172 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M73 P58 R5
G1 X130.159 Y128.79 E.00039
G3 X130.159 Y127.21 I-.755 J-.79 E.15667
G1 X130.674 Y127.21 E.01583
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X131.09 Y127.21 E.0138
G1 X131.09 Y128.79 E.05241
G1 X130.674 Y128.79 E.0138
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.232 Y128.79 E.0136
M204 S10000
G1 X130.069 Y128.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.299009
G1 F1200
G1 X130.208 Y128.121 E.00328
; LINE_WIDTH: 0.338038
G1 X130.347 Y128.047 E.00378
; LINE_WIDTH: 0.31357
G1 X130.347 Y127.953 E.00207
G1 X130.208 Y127.879 E.00347
; LINE_WIDTH: 0.25998
G1 X130.069 Y127.806 E.00278
G1 X129.608 Y127.816 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.447671
G1 F1200
G1 X129.396 Y127.713 E.00776
G1 X129.249 Y127.761 E.00511
G1 X129.135 Y127.909 E.00616
G1 X129.128 Y128.067 E.00519
G1 X129.265 Y128.247 E.00747
G1 X129.438 Y128.279 E.00579
G1 X129.61 Y128.196 E.00631
G1 X129.536 Y127.994 E.0071
G1 X129.586 Y127.871 E.00436
; CHANGE_LAYER
; Z_HEIGHT: 33.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.536 Y127.994 E-.05994
G1 X129.61 Y128.196 E-.09762
G1 X129.438 Y128.279 E-.08676
G1 X129.265 Y128.247 E-.07967
G1 X129.128 Y128.067 E-.1028
G1 X129.135 Y127.909 E-.07145
G1 X129.249 Y127.761 E-.08475
G1 X129.396 Y127.713 E-.07033
G1 X129.608 Y127.816 E-.10668
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 167/650
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
G3 Z33.6 I-.923 J.794 P1  F30000
G1 X130.109 Y128.398 Z33.6
G1 Z33.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X130.025 Y128.398 E.00279
G3 X129.417 Y128.697 I-.738 J-.733 E.02288
G3 X129.443 Y127.304 I-.016 J-.697 E.07459
G3 X130.025 Y127.602 I-.17 J1.049 E.02204
G1 X130.898 Y127.602 E.02896
G1 X130.898 Y128.398 E.0264
G1 X130.169 Y128.398 E.02418
G1 X130.177 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.159 Y128.79 E.00055
G3 X130.159 Y127.21 I-.755 J-.79 E.1567
G1 X131.213 Y127.21 E.03239
G1 X131.29 Y127.21 E.00237
G1 X131.29 Y128.79 E.04855
G1 X131.213 Y128.79 E.00237
G1 X131.131 Y128.79 E.00252
G1 X130.237 Y128.79 E.02748
M204 S10000
G1 X129.94 Y128 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.433174
G1 F1200
G1 X130.44 Y128 E.01592
G1 X129.94 Y128 F30000
G1 F1200
G1 X129.774 Y127.917 E.0059
; LINE_WIDTH: 0.507901
G2 X129.416 Y127.756 I-1.277 J2.349 E.01487
G1 X129.205 Y127.845 E.00871
G2 X129.342 Y128.241 I.227 J.143 E.0182
G1 X129.471 Y128.24 E.0049
; LINE_WIDTH: 0.513959
G1 X129.656 Y128.132 E.00823
; LINE_WIDTH: 0.485052
G1 X129.841 Y128.024 E.00773
; LINE_WIDTH: 0.456145
G1 X129.881 Y128.014 E.00138
; CHANGE_LAYER
; Z_HEIGHT: 33.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.841 Y128.024 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 168/650
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
G3 Z33.8 I-1.17 J.333 P1  F30000
G1 X129.962 Y128.447 Z33.8
G1 Z33.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.811 Y128.564 E.00633
G3 X129.383 Y128.697 I-.509 J-.879 E.015
G3 X129.443 Y127.304 I.019 J-.697 E.07341
G3 X130.025 Y127.602 I-.17 J1.049 E.02204
G1 X131.098 Y127.602 E.03559
G1 X131.098 Y128.398 E.0264
G1 X130.025 Y128.398 E.03559
G1 X130.009 Y128.41 E.00066
G1 X130.184 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.159 Y128.79 E.00076
G3 X130.159 Y127.21 I-.754 J-.79 E.15653
G1 X131.413 Y127.21 E.03853
G1 X131.49 Y127.21 E.00237
G1 X131.49 Y128.79 E.04855
G1 X131.413 Y128.79 E.00237
G1 X131.331 Y128.79 E.00252
G1 X130.244 Y128.79 E.03341
M204 S10000
G1 X130.111 Y128.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.302909
G1 F1200
G1 X130.184 Y128.146 E.00185
; LINE_WIDTH: 0.345835
G1 X130.256 Y128.097 E.00215
; LINE_WIDTH: 0.388761
G1 X130.329 Y128.049 E.00246
; LINE_WIDTH: 0.431686
G1 X130.401 Y128 E.00276
; LINE_WIDTH: 0.431687
G1 X130.894 Y128 E.01562
G1 X129.648 Y127.833 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.449302
G1 F1200
G1 X129.418 Y127.72 E.00845
G1 X129.202 Y127.8 E.00765
G1 X129.122 Y128 E.00712
G1 X129.213 Y128.207 E.00747
G1 X129.325 Y128.272 E.00429
G1 X129.52 Y128.246 E.00651
G1 X129.613 Y128.184 E.00373
G1 X129.54 Y128.007 E.00634
G1 X129.609 Y127.877 E.00486
; CHANGE_LAYER
; Z_HEIGHT: 33.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.54 Y128.007 E-.06541
G1 X129.613 Y128.184 E-.08533
G1 X129.52 Y128.246 E-.05029
G1 X129.325 Y128.272 E-.08765
G1 X129.213 Y128.207 E-.05784
G1 X129.122 Y128 E-.10067
G1 X129.202 Y127.8 E-.09595
G1 X129.418 Y127.72 E-.10302
G1 X129.648 Y127.833 E-.11384
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 169/650
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
G3 Z34 I-.945 J.767 P1  F30000
G1 X130.106 Y128.398 Z34
G1 Z33.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X130.025 Y128.398 E.00268
G3 X129.452 Y128.695 I-.756 J-.756 E.02175
G3 X129.443 Y127.304 I-.051 J-.695 E.07576
G3 X130.025 Y127.602 I-.169 J1.048 E.02204
G1 X131.298 Y127.602 E.04223
G1 X131.298 Y128.398 E.0264
G1 X130.166 Y128.398 E.03755
G1 X130.19 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.159 Y128.79 E.00095
G3 X130.159 Y127.21 I-.753 J-.79 E.15637
G1 X131.613 Y127.21 E.04469
G1 X131.69 Y127.21 E.00237
G1 X131.69 Y128.79 E.04855
G1 X131.613 Y128.79 E.00237
G1 X131.531 Y128.79 E.00252
G1 X130.25 Y128.79 E.03937
M204 S10000
G1 X130.401 Y128 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431814
G1 F1200
G1 X130.329 Y127.951 E.00277
; LINE_WIDTH: 0.388891
G1 X130.256 Y127.903 E.00246
; LINE_WIDTH: 0.345967
G1 X130.184 Y127.854 E.00216
; LINE_WIDTH: 0.303044
G1 X130.111 Y127.805 E.00185
G1 X130.401 Y128 F30000
; LINE_WIDTH: 0.431773
G1 F1200
G1 X131.094 Y128 E.02196
G1 X129.638 Y128.162 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.449794
G1 F1200
G1 X129.543 Y128.012 E.00591
G1 X129.608 Y127.826 E.00654
G1 X129.594 Y127.785 E.00143
G1 X129.333 Y127.726 E.00888
G1 X129.133 Y127.907 E.00894
G1 X129.17 Y128.149 E.00812
G1 X129.338 Y128.274 E.00693
G1 X129.508 Y128.248 E.00571
G1 X129.588 Y128.195 E.00319
; CHANGE_LAYER
; Z_HEIGHT: 34
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.508 Y128.248 E-.04354
G1 X129.338 Y128.274 E-.07804
G1 X129.17 Y128.149 E-.09466
G1 X129.133 Y127.907 E-.11091
G1 X129.333 Y127.726 E-.12211
G1 X129.594 Y127.785 E-.12122
G1 X129.608 Y127.826 E-.01956
G1 X129.543 Y128.012 E-.08927
G1 X129.638 Y128.162 E-.08069
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 170/650
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
G3 Z34.2 I-.214 J-1.198 P1  F30000
G1 X129.554 Y128.177 Z34.2
G1 Z34
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.284 Y128.691 E.01924
G3 X129.278 Y127.3 I.128 J-.696 E.065
G1 X129.6 Y127.906 E.02277
G1 X129.621 Y127.989 E.00284
G1 X129.608 Y128.074 E.00284
G1 X129.582 Y128.124 E.00189
G1 X130.195 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.159 Y128.79 E.0011
G3 X129.464 Y126.912 I-.754 J-.788 E.13271
G3 X130.159 Y127.21 I-.08 J1.147 E.02367
G1 X131.69 Y127.21 E.04705
G1 X131.69 Y128.79 E.04855
G1 X130.255 Y128.79 E.0441
M204 S10000
G1 X130.75 Y128.583 F30000
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X131.483 Y127.85 E.03181
G1 X131.382 Y127.417
G1 X130.217 Y128.583 E.05063
G1 X129.594 Y128.673
G1 X130.849 Y127.417 E.05456
G1 X130.316 Y127.417
G1 X129.832 Y127.901 E.02102
G1 X129.658 Y127.542
G1 X129.916 Y127.284 E.01118
M204 S10000
G1 X129.82 Y127.889 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.124463
G1 F1200
G3 X129.882 Y128.034 I-2.136 J1 E.00105
G1 X129.865 Y128.071 E.00027
; LINE_WIDTH: 0.117886
G1 X129.811 Y128.164 E.00066
; CHANGE_LAYER
; Z_HEIGHT: 34.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.865 Y128.071 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 171/650
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
G3 Z34.4 I-1.203 J.184 P1  F30000
G1 X129.924 Y128.456 Z34.4
G1 Z34.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.873 Y128.511 E.00249
G3 X129.384 Y127.303 I-.473 J-.512 E.08935
G1 X129.443 Y127.304 E.00195
G3 X129.963 Y128.41 I-.043 J.695 E.04944
G1 X130.215 Y128.716 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.8 E.00356
G3 X129.373 Y126.911 I-.738 J-.801 E.12931
G1 X129.464 Y126.912 E.00278
G3 X130.275 Y128.643 I-.067 J1.087 E.07168
G1 X130.253 Y128.67 E.00107
M204 S10000
G1 X129.645 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516708
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.009
G1 X129.321 Y127.761 E.00903
G1 X129.174 Y127.891 E.00758
G1 X129.164 Y128.086 E.00753
G1 X129.289 Y128.223 E.00714
G1 X129.486 Y128.231 E.00761
G1 X129.594 Y128.155 E.0051
G1 X129.625 Y128.068 E.00356
; CHANGE_LAYER
; Z_HEIGHT: 34.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.155 E-.04791
G1 X129.486 Y128.231 E-.06858
G1 X129.289 Y128.223 E-.10241
G1 X129.164 Y128.086 E-.09598
G1 X129.174 Y127.891 E-.10122
G1 X129.321 Y127.761 E-.10201
G1 X129.552 Y127.803 E-.12147
G1 X129.618 Y127.905 E-.06338
G1 X129.645 Y128.012 E-.05705
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 172/650
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
G3 Z34.6 I-1.018 J.667 P1  F30000
G1 X129.931 Y128.448 Z34.6
G1 Z34.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.873 Y128.511 E.00284
G3 X129.384 Y127.303 I-.473 J-.512 E.08934
G1 X129.443 Y127.304 E.00195
G3 X129.969 Y128.402 I-.043 J.695 E.0491
G1 X130.222 Y128.708 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.8 E.00388
G3 X129.373 Y126.911 I-.738 J-.801 E.12931
G1 X129.464 Y126.912 E.00278
G3 X130.275 Y128.643 I-.067 J1.087 E.07169
G1 X130.26 Y128.662 E.00075
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515226
G1 F1200
G2 X129.552 Y127.803 I-.347 J.029 E.009
G1 X129.321 Y127.761 E.00903
G1 X129.173 Y127.891 E.0076
G1 X129.175 Y128.081 E.0073
G1 X129.243 Y128.197 E.00517
G1 X129.431 Y128.25 E.00753
G1 X129.595 Y128.156 E.00725
G1 X129.626 Y128.069 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 34.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04807
G1 X129.431 Y128.25 E-.09768
G1 X129.243 Y128.197 E-.10145
G1 X129.175 Y128.081 E-.06968
G1 X129.173 Y127.891 E-.09833
G1 X129.321 Y127.761 E-.10242
G1 X129.552 Y127.803 E-.12168
G1 X129.619 Y127.905 E-.06354
G1 X129.646 Y128.012 E-.05716
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 173/650
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
G3 Z34.8 I-1.006 J.685 P1  F30000
G1 X129.937 Y128.44 Z34.8
G1 Z34.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.873 Y128.511 E.00319
G3 X129.384 Y127.303 I-.473 J-.512 E.08934
G1 X129.443 Y127.304 E.00194
G3 X129.975 Y128.393 I-.043 J.695 E.04875
G1 X130.228 Y128.701 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.8 E.0042
G3 X129.373 Y126.911 I-.738 J-.801 E.12931
G1 X129.464 Y126.912 E.00277
G3 X130.275 Y128.643 I-.067 J1.087 E.07169
G1 X130.266 Y128.654 E.00043
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515623
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.009
G1 X129.321 Y127.761 E.00903
G1 X129.173 Y127.891 E.00758
G1 X129.175 Y128.08 E.00728
G1 X129.243 Y128.197 E.00522
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00725
G1 X129.625 Y128.069 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 34.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04804
G1 X129.431 Y128.25 E-.09765
G1 X129.243 Y128.197 E-.10143
G1 X129.175 Y128.08 E-.07037
G1 X129.173 Y127.891 E-.09804
G1 X129.321 Y127.761 E-.10213
G1 X129.552 Y127.803 E-.12167
G1 X129.619 Y127.905 E-.06349
G1 X129.646 Y128.012 E-.05718
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 174/650
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
G3 Z35 I-.992 J.705 P1  F30000
G1 X129.944 Y128.432 Z35
G1 Z34.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.873 Y128.511 E.00353
G3 X129.384 Y127.303 I-.473 J-.512 E.08934
G1 X129.443 Y127.304 E.00194
G3 X129.98 Y128.385 I-.043 J.695 E.04841
G1 X130.235 Y128.693 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.8 E.00452
G3 X129.373 Y126.911 I-.738 J-.801 E.1293
G1 X129.464 Y126.912 E.00277
G3 X130.275 Y128.643 I-.066 J1.087 E.0717
G1 X130.273 Y128.646 E.00011
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515619
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.009
G1 X129.321 Y127.761 E.00903
G1 X129.173 Y127.891 E.00758
G1 X129.175 Y128.08 E.00728
M73 P59 R5
G1 X129.243 Y128.197 E.00522
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00725
G1 X129.625 Y128.069 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 35
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04805
G1 X129.431 Y128.25 E-.09764
G1 X129.243 Y128.197 E-.10143
G1 X129.175 Y128.08 E-.07037
G1 X129.173 Y127.891 E-.09804
G1 X129.321 Y127.761 E-.10213
G1 X129.552 Y127.803 E-.12168
G1 X129.619 Y127.905 E-.06347
G1 X129.646 Y128.012 E-.05718
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 175/650
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
G3 Z35.2 I-.978 J.724 P1  F30000
G1 X129.951 Y128.425 Z35.2
G1 Z35
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.873 Y128.511 E.00387
G3 X129.384 Y127.303 I-.473 J-.512 E.08934
G1 X129.442 Y127.304 E.00193
G3 X129.986 Y128.376 I-.043 J.695 E.04808
G1 X130.242 Y128.686 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.8 E.00483
G3 X129.373 Y126.911 I-.738 J-.801 E.1293
G1 X129.463 Y126.912 E.00277
G3 X130.279 Y128.638 I-.066 J1.087 E.0715
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515094
G1 F1200
G2 X129.41 Y127.754 I-.27 J.01 E.01462
G1 X129.229 Y127.821 E.00741
G1 X129.156 Y127.938 E.00529
G1 X129.185 Y128.131 E.00753
G1 X129.319 Y128.223 E.00625
G1 X129.493 Y128.22 E.00667
G2 X129.626 Y128.069 I-.03 J-.16 E.00836
; CHANGE_LAYER
; Z_HEIGHT: 35.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04835
G1 X129.493 Y128.22 E-.06275
G1 X129.319 Y128.223 E-.09043
G1 X129.185 Y128.131 E-.08465
G1 X129.156 Y127.938 E-.10196
G1 X129.229 Y127.821 E-.07174
G1 X129.41 Y127.754 E-.10043
G1 X129.552 Y127.803 E-.07834
G1 X129.619 Y127.905 E-.06381
G1 X129.646 Y128.012 E-.05752
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 176/650
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
G3 Z35.4 I-.965 J.742 P1  F30000
G1 X129.958 Y128.417 Z35.4
G1 Z35.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.873 Y128.511 E.0042
G3 X129.384 Y127.303 I-.473 J-.512 E.08934
G1 X129.442 Y127.304 E.00193
G3 X129.991 Y128.368 I-.043 J.695 E.04775
G1 X130.249 Y128.678 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.8 E.00514
G3 X129.373 Y126.911 I-.738 J-.801 E.1293
G1 X129.463 Y126.912 E.00276
G3 X130.285 Y128.63 I-.066 J1.087 E.0712
M204 S10000
G1 X129.622 Y128.079 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514676
G1 F1200
G1 X129.619 Y127.905 E.00669
G1 X129.552 Y127.802 E.00471
G1 X129.41 Y127.754 E.00578
G1 X129.229 Y127.821 E.00741
G1 X129.154 Y127.977 E.00666
G1 X129.217 Y128.165 E.00762
G1 X129.391 Y128.247 E.0074
G1 X129.524 Y128.219 E.00523
G1 X129.588 Y128.128 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 35.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.524 Y128.219 E-.05802
G1 X129.391 Y128.247 E-.07123
G1 X129.217 Y128.165 E-.10086
G1 X129.154 Y127.977 E-.10387
G1 X129.229 Y127.821 E-.09074
G1 X129.41 Y127.754 E-.10099
G1 X129.552 Y127.802 E-.07884
G1 X129.619 Y127.905 E-.0642
G1 X129.622 Y128.079 E-.09125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 177/650
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
G3 Z35.6 I-.854 J.867 P1  F30000
G1 X129.961 Y128.412 Z35.6
G1 Z35.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.442 Y127.304 E.00193
G3 X129.994 Y128.363 I-.043 J.695 E.04756
G1 X130.255 Y128.671 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.8 E.00543
G3 X129.373 Y126.911 I-.738 J-.801 E.1293
G1 X129.463 Y126.912 E.00276
G3 X130.29 Y128.622 I-.066 J1.087 E.07091
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515379
G1 F1200
G2 X129.552 Y127.803 I-.347 J.029 E.009
G1 X129.321 Y127.761 E.00903
G1 X129.173 Y127.891 E.00759
G1 X129.175 Y128.08 E.00728
G1 X129.243 Y128.197 E.0052
G1 X129.431 Y128.25 E.00753
G1 X129.595 Y128.156 E.00725
G1 X129.626 Y128.069 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 35.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04809
G1 X129.431 Y128.25 E-.09763
G1 X129.243 Y128.197 E-.10144
G1 X129.175 Y128.08 E-.07004
G1 X129.173 Y127.891 E-.09814
G1 X129.321 Y127.761 E-.10232
G1 X129.552 Y127.803 E-.12169
G1 X129.619 Y127.905 E-.06341
G1 X129.646 Y128.012 E-.05724
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 178/650
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
G3 Z35.8 I-.956 J.753 P1  F30000
G1 X129.961 Y128.412 Z35.8
G1 Z35.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.442 Y127.304 E.00192
G3 X129.994 Y128.363 I-.043 J.695 E.04756
G1 X130.261 Y128.664 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.135 Y128.8 E.00571
G3 X129.373 Y126.911 I-.738 J-.801 E.1293
G1 X129.463 Y126.912 E.00275
G3 X130.295 Y128.615 I-.066 J1.087 E.07064
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51511
G1 F1200
G2 X129.41 Y127.754 I-.27 J.01 E.01463
G1 X129.229 Y127.821 E.0074
G1 X129.156 Y127.938 E.0053
G1 X129.185 Y128.131 E.00753
G1 X129.319 Y128.223 E.00625
G1 X129.493 Y128.22 E.00668
G2 X129.626 Y128.069 I-.03 J-.16 E.00836
; CHANGE_LAYER
; Z_HEIGHT: 35.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04839
G1 X129.493 Y128.22 E-.06269
G1 X129.319 Y128.223 E-.09048
G1 X129.185 Y128.131 E-.08464
G1 X129.156 Y127.938 E-.10196
G1 X129.229 Y127.821 E-.07175
G1 X129.41 Y127.754 E-.10033
G1 X129.552 Y127.803 E-.07846
G1 X129.619 Y127.905 E-.06375
G1 X129.646 Y128.012 E-.05755
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 179/650
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
G3 Z36 I-.957 J.752 P1  F30000
G1 X129.961 Y128.412 Z36
G1 Z35.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.442 Y127.304 E.00192
G3 X129.994 Y128.363 I-.043 J.695 E.04757
G1 X130.267 Y128.658 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.134 Y128.801 E.00598
G3 X129.373 Y126.911 I-.738 J-.801 E.1293
G1 X129.463 Y126.912 E.00275
G3 X130.3 Y128.608 I-.066 J1.087 E.07038
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515166
G1 F1200
G2 X129.552 Y127.803 I-.347 J.029 E.009
G1 X129.321 Y127.761 E.00903
G1 X129.173 Y127.891 E.00761
G1 X129.175 Y128.081 E.00729
G1 X129.243 Y128.197 E.00518
G1 X129.431 Y128.25 E.00753
G1 X129.595 Y128.156 E.00725
G1 X129.626 Y128.069 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 36
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04811
G1 X129.431 Y128.25 E-.09763
G1 X129.243 Y128.197 E-.10144
G1 X129.175 Y128.081 E-.06977
G1 X129.173 Y127.891 E-.0982
G1 X129.321 Y127.761 E-.10249
G1 X129.552 Y127.803 E-.12171
G1 X129.619 Y127.905 E-.06338
G1 X129.646 Y128.012 E-.05727
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 180/650
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
G3 Z36.2 I-.957 J.752 P1  F30000
G1 X129.961 Y128.413 Z36.2
G1 Z36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.442 Y127.304 E.00192
G3 X129.994 Y128.363 I-.042 J.695 E.04757
G1 X130.272 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.134 Y128.801 E.00622
G3 X129.373 Y126.911 I-.738 J-.801 E.1293
G1 X129.463 Y126.912 E.00275
G3 X130.304 Y128.602 I-.066 J1.087 E.07015
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515226
G1 F1200
G2 X129.552 Y127.803 I-.347 J.029 E.00899
G1 X129.321 Y127.761 E.00903
G1 X129.173 Y127.891 E.00759
G1 X129.161 Y128.072 E.00698
G1 X129.296 Y128.224 E.00784
G1 X129.431 Y128.25 E.0053
G1 X129.595 Y128.156 E.00724
G1 X129.626 Y128.069 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 36.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04805
G1 X129.431 Y128.25 E-.09744
G1 X129.296 Y128.224 E-.07129
G1 X129.161 Y128.072 E-.10545
G1 X129.173 Y127.891 E-.09384
G1 X129.321 Y127.761 E-.10205
G1 X129.552 Y127.803 E-.12149
G1 X129.619 Y127.905 E-.06323
G1 X129.646 Y128.012 E-.05717
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 181/650
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
G3 Z36.4 I-.957 J.752 P1  F30000
G1 X129.961 Y128.413 Z36.4
G1 Z36.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.442 Y127.304 E.00191
G3 X129.994 Y128.363 I-.042 J.695 E.04757
G1 X130.275 Y128.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.878 J-.644 E.13578
G1 X129.463 Y126.912 E.00274
G3 X130.309 Y128.594 I-.066 J1.087 E.06988
M204 S10000
G1 X129.622 Y128.079 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514633
G1 F1200
G1 X129.619 Y127.905 E.0067
G1 X129.552 Y127.802 E.0047
G1 X129.409 Y127.754 E.0058
G1 X129.229 Y127.821 E.0074
G1 X129.154 Y127.977 E.00666
G1 X129.217 Y128.165 E.00763
G1 X129.391 Y128.247 E.00739
G1 X129.524 Y128.219 E.00523
G1 X129.588 Y128.128 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 36.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.524 Y128.219 E-.058
G1 X129.391 Y128.247 E-.07128
G1 X129.217 Y128.165 E-.10067
G1 X129.154 Y127.977 E-.10406
G1 X129.229 Y127.821 E-.09074
G1 X129.409 Y127.754 E-.10081
G1 X129.552 Y127.802 E-.07905
G1 X129.619 Y127.905 E-.06406
G1 X129.622 Y128.079 E-.09133
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 182/650
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
G3 Z36.6 I-.854 J.867 P1  F30000
G1 X129.961 Y128.413 Z36.6
G1 Z36.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.442 Y127.304 E.00191
G3 X129.994 Y128.363 I-.042 J.695 E.04758
G1 X130.28 Y128.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.275 Y128.644 E.00018
G3 X129.373 Y126.911 I-.878 J-.644 E.13578
G1 X129.463 Y126.912 E.00274
G3 X130.383 Y128.462 I-.066 J1.087 E.06522
G1 X130.31 Y128.589 E.00452
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515134
G1 F1200
G2 X129.409 Y127.754 I-.27 J.01 E.01464
G1 X129.229 Y127.821 E.00739
G1 X129.156 Y127.938 E.0053
G1 X129.185 Y128.131 E.00752
G1 X129.319 Y128.223 E.00625
G1 X129.493 Y128.22 E.00668
G2 X129.626 Y128.069 I-.03 J-.16 E.00836
; CHANGE_LAYER
; Z_HEIGHT: 36.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.0484
G1 X129.493 Y128.22 E-.06264
G1 X129.319 Y128.223 E-.09049
G1 X129.185 Y128.131 E-.08465
G1 X129.156 Y127.938 E-.10196
G1 X129.229 Y127.821 E-.07178
G1 X129.409 Y127.754 E-.10018
G1 X129.552 Y127.803 E-.07863
G1 X129.619 Y127.905 E-.06362
G1 X129.646 Y128.012 E-.05765
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 183/650
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
G3 Z36.8 I-.957 J.752 P1  F30000
G1 X129.961 Y128.413 Z36.8
G1 Z36.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.442 Y127.304 E.0019
G3 X129.994 Y128.363 I-.042 J.695 E.04758
G1 X130.283 Y128.637 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.275 Y128.644 E.00033
G3 X129.373 Y126.911 I-.878 J-.644 E.13578
G1 X129.462 Y126.912 E.00274
G3 X130.383 Y128.462 I-.066 J1.087 E.06522
G1 X130.313 Y128.585 E.00435
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515137
G1 F1200
G2 X129.409 Y127.754 I-.27 J.01 E.01464
G1 X129.229 Y127.821 E.00739
G1 X129.156 Y127.938 E.0053
G1 X129.185 Y128.131 E.00753
G1 X129.319 Y128.223 E.00625
G1 X129.493 Y128.22 E.00668
G2 X129.626 Y128.069 I-.03 J-.16 E.00836
; CHANGE_LAYER
; Z_HEIGHT: 36.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04841
G1 X129.493 Y128.22 E-.06262
G1 X129.319 Y128.223 E-.09051
G1 X129.185 Y128.131 E-.08464
G1 X129.156 Y127.938 E-.10196
G1 X129.229 Y127.821 E-.07178
G1 X129.409 Y127.754 E-.10015
G1 X129.552 Y127.803 E-.07867
G1 X129.619 Y127.905 E-.0636
G1 X129.646 Y128.012 E-.05766
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 184/650
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
G3 Z37 I-.957 J.752 P1  F30000
G1 X129.961 Y128.413 Z37
G1 Z36.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.442 Y127.304 E.0019
G3 X129.994 Y128.363 I-.042 J.695 E.04758
G1 X130.285 Y128.633 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.275 Y128.644 E.00046
G3 X129.373 Y126.911 I-.878 J-.644 E.13578
G1 X129.462 Y126.912 E.00273
G3 X130.383 Y128.462 I-.065 J1.087 E.06522
G1 X130.315 Y128.581 E.00422
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515578
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.00899
G1 X129.321 Y127.761 E.00903
M73 P60 R5
G1 X129.173 Y127.891 E.00758
G1 X129.174 Y128.08 E.00728
G1 X129.243 Y128.197 E.00522
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00724
G1 X129.625 Y128.069 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 37
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04812
G1 X129.431 Y128.25 E-.09757
G1 X129.243 Y128.197 E-.10143
G1 X129.174 Y128.08 E-.07036
G1 X129.173 Y127.891 E-.09804
G1 X129.321 Y127.761 E-.10219
G1 X129.552 Y127.803 E-.12172
G1 X129.619 Y127.905 E-.06319
G1 X129.646 Y128.012 E-.05738
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 185/650
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
G3 Z37.2 I-.957 J.752 P1  F30000
G1 X129.961 Y128.413 Z37.2
G1 Z37
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.441 Y127.304 E.0019
G3 X129.994 Y128.363 I-.042 J.696 E.04759
G1 X130.287 Y128.63 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.275 Y128.644 E.00056
G3 X129.373 Y126.911 I-.878 J-.644 E.13578
G1 X129.462 Y126.912 E.00273
G3 X130.383 Y128.462 I-.065 J1.087 E.06523
G1 X130.317 Y128.578 E.00411
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515151
G1 F1200
G2 X129.409 Y127.754 I-.27 J.01 E.01465
G1 X129.229 Y127.821 E.00739
G1 X129.156 Y127.938 E.0053
G1 X129.185 Y128.131 E.00752
G1 X129.319 Y128.223 E.00625
G1 X129.493 Y128.22 E.00668
G2 X129.626 Y128.069 I-.03 J-.16 E.00836
; CHANGE_LAYER
; Z_HEIGHT: 37.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04842
G1 X129.493 Y128.22 E-.0626
G1 X129.319 Y128.223 E-.09053
G1 X129.185 Y128.131 E-.08464
G1 X129.156 Y127.938 E-.10195
G1 X129.229 Y127.821 E-.07179
G1 X129.409 Y127.754 E-.10007
G1 X129.552 Y127.803 E-.07876
G1 X129.619 Y127.905 E-.06354
G1 X129.646 Y128.012 E-.0577
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 186/650
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
G3 Z37.4 I-.957 J.752 P1  F30000
G1 X129.961 Y128.413 Z37.4
G1 Z37.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.441 Y127.304 E.00189
G3 X129.994 Y128.363 I-.042 J.696 E.04759
G1 X130.288 Y128.628 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.275 Y128.644 E.00063
G3 X129.373 Y126.911 I-.878 J-.644 E.13578
G1 X129.462 Y126.912 E.00272
G3 X130.383 Y128.462 I-.065 J1.087 E.06523
G1 X130.318 Y128.576 E.00404
M204 S10000
G1 X129.622 Y128.079 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514588
G1 F1200
G1 X129.619 Y127.905 E.00671
G1 X129.552 Y127.802 E.00469
G1 X129.409 Y127.754 E.00581
G1 X129.229 Y127.821 E.00738
G1 X129.154 Y127.977 E.00666
G1 X129.218 Y128.166 E.00765
G1 X129.391 Y128.247 E.00737
G1 X129.524 Y128.219 E.00523
G1 X129.588 Y128.128 E.00425
; CHANGE_LAYER
; Z_HEIGHT: 37.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.524 Y128.219 E-.05799
G1 X129.391 Y128.247 E-.0713
G1 X129.218 Y128.166 E-.10048
G1 X129.154 Y127.977 E-.10425
G1 X129.229 Y127.821 E-.09073
G1 X129.409 Y127.754 E-.10063
G1 X129.552 Y127.802 E-.07926
G1 X129.619 Y127.905 E-.06395
G1 X129.622 Y128.079 E-.09142
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 187/650
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
G3 Z37.6 I-.854 J.867 P1  F30000
G1 X129.961 Y128.413 Z37.6
G1 Z37.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.441 Y127.304 E.00189
G3 X129.994 Y128.363 I-.042 J.696 E.04759
G1 X130.289 Y128.627 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.275 Y128.644 E.00068
G3 X129.373 Y126.911 I-.878 J-.644 E.13578
G1 X129.462 Y126.912 E.00272
G3 X130.383 Y128.462 I-.065 J1.087 E.06524
G1 X130.319 Y128.575 E.00399
M204 S10000
G1 X129.622 Y128.079 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51458
G1 F1200
G1 X129.619 Y127.904 E.00671
G1 X129.552 Y127.802 E.00469
G1 X129.409 Y127.754 E.00582
G1 X129.229 Y127.821 E.00738
G1 X129.154 Y127.977 E.00666
G1 X129.218 Y128.166 E.00765
G1 X129.391 Y128.247 E.00737
G1 X129.524 Y128.219 E.00523
G1 X129.588 Y128.128 E.00425
; CHANGE_LAYER
; Z_HEIGHT: 37.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.524 Y128.219 E-.05798
G1 X129.391 Y128.247 E-.07132
G1 X129.218 Y128.166 E-.10045
G1 X129.154 Y127.977 E-.10428
G1 X129.229 Y127.821 E-.09073
G1 X129.409 Y127.754 E-.10059
G1 X129.552 Y127.802 E-.0793
G1 X129.619 Y127.904 E-.06391
G1 X129.622 Y128.079 E-.09144
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 188/650
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
G3 Z37.8 I-.855 J.866 P1  F30000
G1 X129.96 Y128.413 Z37.8
G1 Z37.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.441 Y127.304 E.00189
G3 X129.994 Y128.363 I-.042 J.696 E.0476
G1 X130.289 Y128.626 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.275 Y128.644 E.00071
G3 X129.373 Y126.911 I-.878 J-.645 E.13577
G1 X129.462 Y126.912 E.00272
G3 X130.383 Y128.462 I-.065 J1.087 E.06524
G1 X130.319 Y128.574 E.00396
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51556
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.00899
G1 X129.321 Y127.761 E.00904
G1 X129.173 Y127.891 E.00759
G1 X129.174 Y128.08 E.00728
G1 X129.243 Y128.197 E.00522
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00724
G1 X129.625 Y128.069 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 37.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04817
G1 X129.431 Y128.25 E-.09753
G1 X129.243 Y128.197 E-.10142
G1 X129.174 Y128.08 E-.07038
G1 X129.173 Y127.891 E-.09803
G1 X129.321 Y127.761 E-.10221
G1 X129.552 Y127.803 E-.12173
G1 X129.619 Y127.905 E-.0631
G1 X129.646 Y128.012 E-.05744
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 189/650
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
G3 Z38 I-.957 J.752 P1  F30000
G1 X129.96 Y128.413 Z38
G1 Z37.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.441 Y127.304 E.00188
G3 X129.994 Y128.363 I-.042 J.696 E.0476
G1 X130.289 Y128.626 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.275 Y128.644 E.00071
G3 X129.373 Y126.911 I-.878 J-.645 E.13577
G1 X129.462 Y126.912 E.00271
G3 X130.383 Y128.462 I-.065 J1.087 E.06524
G1 X130.319 Y128.574 E.00396
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515559
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.00899
G1 X129.321 Y127.761 E.00904
G1 X129.173 Y127.891 E.00759
G1 X129.174 Y128.08 E.00728
G1 X129.243 Y128.197 E.00522
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00724
G1 X129.625 Y128.069 E.00357
; CHANGE_LAYER
; Z_HEIGHT: 38
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04816
G1 X129.431 Y128.25 E-.09753
G1 X129.243 Y128.197 E-.10142
G1 X129.174 Y128.08 E-.07037
G1 X129.173 Y127.891 E-.09803
G1 X129.321 Y127.761 E-.10222
G1 X129.552 Y127.803 E-.12174
G1 X129.619 Y127.905 E-.06306
G1 X129.646 Y128.012 E-.05746
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 190/650
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
G3 Z38.2 I-.957 J.752 P1  F30000
G1 X129.96 Y128.413 Z38.2
G1 Z38
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.441 Y127.304 E.00188
G3 X129.994 Y128.363 I-.042 J.696 E.0476
G1 X130.289 Y128.627 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.274 Y128.644 E.0007
G3 X129.373 Y126.911 I-.878 J-.645 E.13578
G1 X129.462 Y126.912 E.00271
G3 X130.383 Y128.462 I-.065 J1.087 E.06525
G1 X130.319 Y128.574 E.00397
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515314
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.00899
G1 X129.321 Y127.761 E.00904
G1 X129.173 Y127.891 E.0076
G1 X129.175 Y128.08 E.00728
G1 X129.243 Y128.197 E.0052
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00724
G1 X129.626 Y128.069 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 38.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04819
G1 X129.431 Y128.25 E-.09753
G1 X129.243 Y128.197 E-.10143
G1 X129.175 Y128.08 E-.07004
G1 X129.173 Y127.891 E-.09813
G1 X129.321 Y127.761 E-.1024
G1 X129.552 Y127.803 E-.12175
G1 X129.619 Y127.904 E-.06305
G1 X129.646 Y128.012 E-.05748
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 191/650
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
G3 Z38.4 I-.957 J.752 P1  F30000
G1 X129.96 Y128.413 Z38.4
G1 Z38.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.441 Y127.304 E.00187
G3 X129.994 Y128.363 I-.042 J.696 E.0476
G1 X130.289 Y128.628 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.274 Y128.644 E.00067
G3 X129.373 Y126.911 I-.878 J-.645 E.13577
G1 X129.461 Y126.912 E.0027
G3 X130.383 Y128.462 I-.065 J1.087 E.06525
G1 X130.318 Y128.575 E.00401
M204 S10000
G1 X129.622 Y128.079 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514546
G1 F1200
G1 X129.619 Y127.904 E.00671
G1 X129.553 Y127.802 E.00468
G1 X129.409 Y127.754 E.00583
G1 X129.229 Y127.821 E.00737
G1 X129.154 Y127.977 E.00666
G1 X129.218 Y128.166 E.00766
G1 X129.391 Y128.247 E.00736
G1 X129.524 Y128.219 E.00523
G1 X129.588 Y128.128 E.00425
; CHANGE_LAYER
; Z_HEIGHT: 38.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.524 Y128.219 E-.05796
G1 X129.391 Y128.247 E-.07134
G1 X129.218 Y128.166 E-.10031
G1 X129.154 Y127.977 E-.10442
G1 X129.229 Y127.821 E-.09074
G1 X129.409 Y127.754 E-.10044
G1 X129.553 Y127.802 E-.07948
G1 X129.619 Y127.904 E-.0638
G1 X129.622 Y128.079 E-.09152
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 192/650
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
G3 Z38.6 I-.855 J.866 P1  F30000
G1 X129.96 Y128.413 Z38.6
G1 Z38.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.441 Y127.304 E.00187
G3 X129.994 Y128.363 I-.041 J.696 E.04761
G1 X130.288 Y128.629 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.274 Y128.644 E.00062
G3 X129.373 Y126.911 I-.878 J-.645 E.13577
G1 X129.461 Y126.912 E.0027
G3 X130.383 Y128.462 I-.065 J1.087 E.06526
G1 X130.317 Y128.577 E.00406
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515543
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.00899
G1 X129.321 Y127.761 E.00904
G1 X129.173 Y127.891 E.00759
G1 X129.174 Y128.08 E.00728
G1 X129.243 Y128.197 E.00522
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00724
G1 X129.625 Y128.069 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 38.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04819
G1 X129.431 Y128.25 E-.0975
G1 X129.243 Y128.197 E-.10142
G1 X129.174 Y128.08 E-.07038
G1 X129.173 Y127.891 E-.09802
G1 X129.321 Y127.761 E-.10223
G1 X129.552 Y127.803 E-.12176
G1 X129.619 Y127.904 E-.06297
G1 X129.646 Y128.012 E-.05752
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 193/650
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
G3 Z38.8 I-.957 J.752 P1  F30000
G1 X129.96 Y128.413 Z38.8
G1 Z38.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.441 Y127.304 E.00187
G3 X129.994 Y128.363 I-.041 J.696 E.04761
G1 X130.287 Y128.631 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.274 Y128.644 E.00056
G3 X129.373 Y126.911 I-.878 J-.645 E.13577
G1 X129.461 Y126.912 E.0027
G3 X130.383 Y128.462 I-.065 J1.087 E.06526
G1 X130.316 Y128.578 E.00412
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515541
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.00899
G1 X129.321 Y127.761 E.00904
G1 X129.173 Y127.891 E.00759
G1 X129.174 Y128.08 E.00728
G1 X129.243 Y128.197 E.00522
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00724
G1 X129.625 Y128.069 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 38.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04819
G1 X129.431 Y128.25 E-.0975
G1 X129.243 Y128.197 E-.10143
G1 X129.174 Y128.08 E-.07037
G1 X129.173 Y127.891 E-.09803
G1 X129.321 Y127.761 E-.10224
G1 X129.552 Y127.803 E-.12176
G1 X129.619 Y127.904 E-.06295
G1 X129.646 Y128.012 E-.05753
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 194/650
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
G3 Z39 I-.957 J.752 P1  F30000
G1 X129.96 Y128.413 Z39
G1 Z38.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.441 Y127.304 E.00186
G3 X129.994 Y128.363 I-.041 J.696 E.04762
G1 X130.286 Y128.633 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.274 Y128.644 E.00049
G3 X129.373 Y126.911 I-.878 J-.645 E.13577
G1 X129.461 Y126.912 E.00269
G3 X130.382 Y128.462 I-.064 J1.087 E.06526
G1 X130.315 Y128.58 E.00419
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515692
G1 F1200
M73 P61 R5
G2 X129.552 Y127.803 I-.346 J.029 E.00899
G1 X129.322 Y127.761 E.00904
G1 X129.174 Y127.891 E.00759
G1 X129.164 Y128.086 E.00752
G1 X129.284 Y128.221 E.00695
G1 X129.487 Y128.231 E.00782
G1 X129.594 Y128.156 E.00506
G1 X129.626 Y128.069 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 39
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04817
G1 X129.487 Y128.231 E-.06804
G1 X129.284 Y128.221 E-.10517
G1 X129.164 Y128.086 E-.09349
G1 X129.174 Y127.891 E-.10114
G1 X129.322 Y127.761 E-.10206
G1 X129.552 Y127.803 E-.12155
G1 X129.619 Y127.904 E-.0629
G1 X129.646 Y128.012 E-.05748
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 195/650
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
G3 Z39.2 I-.957 J.752 P1  F30000
G1 X129.96 Y128.413 Z39.2
G1 Z39
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.44 Y127.304 E.00186
G3 X129.994 Y128.363 I-.041 J.696 E.04762
G1 X130.284 Y128.635 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.274 Y128.644 E.00041
G3 X129.373 Y126.911 I-.878 J-.645 E.13577
G1 X129.461 Y126.912 E.00269
G3 X130.382 Y128.462 I-.064 J1.087 E.06527
G1 X130.314 Y128.583 E.00427
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515533
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.00898
G1 X129.321 Y127.761 E.00904
G1 X129.173 Y127.891 E.00759
G1 X129.174 Y128.08 E.00728
G1 X129.243 Y128.197 E.00522
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00724
G1 X129.625 Y128.069 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 39.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.0482
G1 X129.431 Y128.25 E-.09749
G1 X129.243 Y128.197 E-.10142
G1 X129.174 Y128.08 E-.07038
G1 X129.173 Y127.891 E-.09803
G1 X129.321 Y127.761 E-.10225
G1 X129.552 Y127.803 E-.12176
G1 X129.619 Y127.904 E-.0629
G1 X129.646 Y128.012 E-.05757
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 196/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L196
M991 S0 P195 ;notify layer change
G17
G3 Z39.4 I-.957 J.752 P1  F30000
G1 X129.96 Y128.413 Z39.4
G1 Z39.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.44 Y127.304 E.00185
G3 X129.994 Y128.363 I-.041 J.696 E.04762
G1 X130.283 Y128.637 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.274 Y128.644 E.00033
G3 X129.373 Y126.911 I-.878 J-.645 E.13577
G1 X129.461 Y126.912 E.00269
G3 X130.382 Y128.462 I-.064 J1.087 E.06527
G1 X130.312 Y128.585 E.00435
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515527
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.00898
G1 X129.321 Y127.761 E.00904
G1 X129.173 Y127.891 E.00759
G1 X129.174 Y128.08 E.00728
G1 X129.243 Y128.197 E.00522
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00723
G1 X129.625 Y128.069 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 39.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04822
G1 X129.431 Y128.25 E-.09747
G1 X129.243 Y128.197 E-.10142
G1 X129.174 Y128.08 E-.07038
G1 X129.173 Y127.891 E-.09803
G1 X129.321 Y127.761 E-.10225
G1 X129.552 Y127.803 E-.12177
G1 X129.619 Y127.904 E-.06286
G1 X129.646 Y128.012 E-.05759
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 197/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L197
M991 S0 P196 ;notify layer change
G17
G3 Z39.6 I-.957 J.752 P1  F30000
G1 X129.96 Y128.413 Z39.6
G1 Z39.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.44 Y127.304 E.00185
G3 X129.994 Y128.363 I-.041 J.696 E.04763
G1 X130.281 Y128.64 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.274 Y128.644 E.00025
G3 X129.373 Y126.911 I-.878 J-.645 E.13577
G1 X129.461 Y126.912 E.00268
G3 X130.382 Y128.462 I-.064 J1.087 E.06528
G1 X130.311 Y128.588 E.00444
M204 S10000
G1 X129.629 Y127.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514493
G1 F1200
G2 X129.408 Y127.754 I-.245 J.063 E.01189
G1 X129.229 Y127.821 E.00735
G1 X129.154 Y127.977 E.00666
G1 X129.218 Y128.166 E.00768
G1 X129.391 Y128.247 E.00734
G1 X129.524 Y128.219 E.00524
G1 X129.622 Y128.079 E.00656
G1 X129.626 Y128.003 E.00294
; CHANGE_LAYER
; Z_HEIGHT: 39.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.622 Y128.079 E-.04005
G1 X129.524 Y128.219 E-.08939
G1 X129.391 Y128.247 E-.07139
G1 X129.218 Y128.166 E-.10012
G1 X129.154 Y127.977 E-.10465
G1 X129.229 Y127.821 E-.09076
G1 X129.408 Y127.754 E-.10024
G1 X129.553 Y127.803 E-.07975
G1 X129.629 Y127.943 E-.08364
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 198/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L198
M991 S0 P197 ;notify layer change
G17
G3 Z39.8 I-.995 J.701 P1  F30000
G1 X129.96 Y128.413 Z39.8
G1 Z39.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.44 Y127.304 E.00185
G3 X129.994 Y128.363 I-.041 J.696 E.04763
G1 X130.28 Y128.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.274 Y128.644 E.00018
G3 X129.373 Y126.911 I-.878 J-.645 E.13577
G1 X129.461 Y126.912 E.00268
G3 X130.382 Y128.462 I-.064 J1.087 E.06528
G1 X130.309 Y128.59 E.00453
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515273
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.00898
G1 X129.321 Y127.761 E.00904
G1 X129.173 Y127.891 E.0076
G1 X129.175 Y128.08 E.00728
G1 X129.243 Y128.197 E.0052
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00723
G1 X129.626 Y128.069 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 39.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04824
G1 X129.431 Y128.25 E-.09748
G1 X129.243 Y128.197 E-.10143
G1 X129.175 Y128.08 E-.07003
G1 X129.173 Y127.891 E-.09813
G1 X129.321 Y127.761 E-.10245
G1 X129.552 Y127.803 E-.12178
G1 X129.619 Y127.904 E-.06284
G1 X129.646 Y128.012 E-.05762
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 199/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L199
M991 S0 P198 ;notify layer change
G17
G3 Z40 I-.957 J.751 P1  F30000
G1 X129.96 Y128.413 Z40
G1 Z39.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.44 Y127.304 E.00184
G3 X129.994 Y128.363 I-.041 J.696 E.04763
G1 X130.278 Y128.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.274 Y128.644 E.00013
G3 X129.373 Y126.911 I-.878 J-.645 E.13577
G1 X129.461 Y126.912 E.00267
G3 X130.382 Y128.462 I-.064 J1.087 E.06528
G1 X130.308 Y128.593 E.00462
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515516
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.00898
G1 X129.321 Y127.761 E.00904
G1 X129.173 Y127.891 E.00759
G1 X129.174 Y128.08 E.00728
G1 X129.243 Y128.197 E.00522
G1 X129.431 Y128.25 E.00753
G1 X129.594 Y128.156 E.00723
G1 X129.625 Y128.069 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 40
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04824
G1 X129.431 Y128.25 E-.09744
G1 X129.243 Y128.197 E-.10143
G1 X129.174 Y128.08 E-.07037
G1 X129.173 Y127.891 E-.09804
G1 X129.321 Y127.761 E-.10227
G1 X129.552 Y127.803 E-.12178
G1 X129.619 Y127.904 E-.06279
G1 X129.646 Y128.012 E-.05764
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 200/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L200
M991 S0 P199 ;notify layer change
G17
G3 Z40.2 I-.957 J.751 P1  F30000
G1 X129.96 Y128.413 Z40.2
G1 Z40
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.44 Y127.304 E.00184
G3 X129.994 Y128.363 I-.041 J.696 E.04764
G1 X130.274 Y128.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.373 Y126.911 I-.878 J-.645 E.13577
G1 X129.46 Y126.912 E.00267
G3 X130.308 Y128.595 I-.064 J1.087 E.06996
M204 S10000
G1 X129.629 Y127.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514467
G1 F1200
G2 X129.408 Y127.754 I-.245 J.062 E.0119
G1 X129.229 Y127.821 E.00734
G1 X129.154 Y127.977 E.00666
G1 X129.218 Y128.166 E.00768
G1 X129.391 Y128.247 E.00734
G1 X129.525 Y128.219 E.00524
G1 X129.622 Y128.079 E.00656
G1 X129.626 Y128.003 E.00294
; CHANGE_LAYER
; Z_HEIGHT: 40.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.622 Y128.079 E-.04004
G1 X129.525 Y128.219 E-.08938
G1 X129.391 Y128.247 E-.07142
G1 X129.218 Y128.166 E-.1
G1 X129.154 Y127.977 E-.10477
G1 X129.229 Y127.821 E-.09076
G1 X129.408 Y127.754 E-.10013
G1 X129.553 Y127.803 E-.07988
G1 X129.629 Y127.943 E-.08362
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 201/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L201
M991 S0 P200 ;notify layer change
G17
G3 Z40.4 I-.995 J.701 P1  F30000
G1 X129.96 Y128.413 Z40.4
G1 Z40.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.384 Y127.303 I-.561 J-.413 E.09375
G1 X129.44 Y127.304 E.00184
G3 X129.994 Y128.363 I-.041 J.696 E.04764
G1 X130.275 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.801 E.00638
G3 X129.373 Y126.911 I-.737 J-.802 E.12928
G1 X129.46 Y126.912 E.00267
G3 X130.305 Y128.599 I-.064 J1.087 E.07013
M204 S10000
G1 X129.629 Y127.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514456
G1 F1200
G2 X129.408 Y127.754 I-.245 J.062 E.0119
G1 X129.229 Y127.821 E.00734
G1 X129.154 Y127.977 E.00666
G1 X129.218 Y128.166 E.00769
G1 X129.391 Y128.247 E.00733
G1 X129.525 Y128.219 E.00524
G1 X129.622 Y128.079 E.00655
G1 X129.626 Y128.003 E.00294
; CHANGE_LAYER
; Z_HEIGHT: 40.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.622 Y128.079 E-.04005
G1 X129.525 Y128.219 E-.08937
G1 X129.391 Y128.247 E-.07143
G1 X129.218 Y128.166 E-.09996
G1 X129.154 Y127.977 E-.10481
G1 X129.229 Y127.821 E-.09076
G1 X129.408 Y127.754 E-.1001
G1 X129.553 Y127.803 E-.07992
G1 X129.629 Y127.943 E-.08361
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 202/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L202
M991 S0 P201 ;notify layer change
G17
G3 Z40.6 I-.995 J.701 P1  F30000
G1 X129.96 Y128.413 Z40.6
G1 Z40.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.413 E.09376
G1 X129.44 Y127.304 E.00183
G3 X129.994 Y128.363 I-.041 J.696 E.04764
G1 X130.273 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.801 E.0063
G3 X129.373 Y126.911 I-.737 J-.802 E.12928
G1 X129.46 Y126.912 E.00266
G3 X130.304 Y128.601 I-.064 J1.087 E.07019
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51564
G1 F1200
G2 X129.552 Y127.803 I-.346 J.029 E.00899
G1 X129.322 Y127.761 E.00904
G1 X129.174 Y127.891 E.00759
G1 X129.164 Y128.086 E.00752
G1 X129.284 Y128.221 E.00695
G1 X129.487 Y128.231 E.00782
G1 X129.594 Y128.156 E.00505
G1 X129.626 Y128.069 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 40.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04822
G1 X129.487 Y128.231 E-.06798
G1 X129.284 Y128.221 E-.10517
G1 X129.164 Y128.086 E-.09349
G1 X129.174 Y127.891 E-.10115
G1 X129.322 Y127.761 E-.1021
G1 X129.552 Y127.803 E-.12158
G1 X129.619 Y127.904 E-.06268
G1 X129.646 Y128.012 E-.05764
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 203/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L203
M991 S0 P202 ;notify layer change
G17
G3 Z40.8 I-.958 J.751 P1  F30000
G1 X129.96 Y128.413 Z40.8
G1 Z40.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.413 E.09375
G1 X129.44 Y127.304 E.00183
G3 X129.994 Y128.363 I-.041 J.696 E.04765
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.801 E.00624
G3 X129.373 Y126.911 I-.737 J-.802 E.12927
G1 X129.46 Y126.912 E.00266
G3 X130.303 Y128.602 I-.064 J1.087 E.07025
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51443
G1 F1200
G2 X129.408 Y127.754 I-.27 J.01 E.0147
G1 X129.228 Y127.822 E.00738
G1 X129.161 Y127.927 E.00481
G1 X129.168 Y128.083 E.00599
G1 X129.296 Y128.224 E.00732
G1 X129.431 Y128.25 E.00531
G1 X129.595 Y128.156 E.00723
G1 X129.626 Y128.069 E.00359
; CHANGE_LAYER
; Z_HEIGHT: 40.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.595 Y128.156 E-.04829
G1 X129.431 Y128.25 E-.0974
G1 X129.296 Y128.224 E-.07147
G1 X129.168 Y128.083 E-.09865
G1 X129.161 Y127.927 E-.08062
G1 X129.228 Y127.822 E-.06473
G1 X129.408 Y127.754 E-.09943
G1 X129.553 Y127.803 E-.07902
G1 X129.619 Y127.904 E-.06273
G1 X129.646 Y128.012 E-.05764
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 204/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L204
M991 S0 P203 ;notify layer change
G17
G3 Z41 I-.958 J.75 P1  F30000
G1 X129.96 Y128.413 Z41
G1 Z40.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.413 E.09375
G1 X129.44 Y127.304 E.00182
G3 X129.994 Y128.363 I-.04 J.696 E.04765
G1 X130.27 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P62 R5
G1 F1200
G1 X130.133 Y128.801 E.00619
G3 X129.373 Y126.911 I-.737 J-.802 E.12927
G1 X129.46 Y126.912 E.00265
G3 X130.302 Y128.604 I-.063 J1.087 E.0703
M204 S10000
G1 X129.646 Y128.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515626
G1 F1200
G2 X129.553 Y127.803 I-.346 J.029 E.00899
G1 X129.322 Y127.761 E.00904
G1 X129.174 Y127.891 E.00759
G1 X129.164 Y128.086 E.00752
G1 X129.284 Y128.221 E.00695
G1 X129.487 Y128.231 E.00782
G1 X129.594 Y128.156 E.00505
G1 X129.626 Y128.069 E.00359
; CHANGE_LAYER
; Z_HEIGHT: 41
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.594 Y128.156 E-.04825
G1 X129.487 Y128.231 E-.06794
G1 X129.284 Y128.221 E-.10517
G1 X129.164 Y128.086 E-.09349
G1 X129.174 Y127.891 E-.10114
G1 X129.322 Y127.761 E-.10212
G1 X129.553 Y127.803 E-.12159
G1 X129.619 Y127.904 E-.06262
G1 X129.646 Y128.012 E-.05767
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 205/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L205
M991 S0 P204 ;notify layer change
G17
G3 Z41.2 I-.958 J.751 P1  F30000
G1 X129.96 Y128.413 Z41.2
G1 Z41
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.413 E.09376
G1 X129.439 Y127.304 E.00182
G3 X129.993 Y128.363 I-.04 J.696 E.04765
G1 X130.27 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.801 E.00615
G3 X129.374 Y126.911 I-.737 J-.802 E.12927
G1 X129.46 Y126.912 E.00265
G3 X130.302 Y128.605 I-.063 J1.087 E.07034
M204 S10000
G1 X129.637 Y128.071 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514423
G1 F1200
G1 X129.609 Y127.863 E.00804
G1 X129.473 Y127.776 E.00624
G2 X129.199 Y127.848 I-.077 J.261 E.01143
G1 X129.151 Y128.026 E.00708
G1 X129.283 Y128.224 E.00914
G1 X129.479 Y128.239 E.00754
G1 X129.612 Y128.122 E.00681
; CHANGE_LAYER
; Z_HEIGHT: 41.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.479 Y128.239 E-.09214
G1 X129.283 Y128.224 E-.10206
G1 X129.151 Y128.026 E-.12378
G1 X129.199 Y127.848 E-.09585
G1 X129.314 Y127.777 E-.07031
G1 X129.473 Y127.776 E-.0825
G1 X129.609 Y127.863 E-.08447
G1 X129.637 Y128.071 E-.10888
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 206/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L206
M991 S0 P205 ;notify layer change
G17
G3 Z41.4 I-.885 J.835 P1  F30000
G1 X129.96 Y128.413 Z41.4
G1 Z41.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.413 E.09376
G1 X129.439 Y127.304 E.00182
G3 X129.993 Y128.363 I-.04 J.696 E.04766
G1 X130.269 Y128.656 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.801 E.00612
G3 X129.374 Y126.911 I-.737 J-.802 E.12927
G1 X129.46 Y126.912 E.00265
G3 X130.301 Y128.605 I-.063 J1.087 E.07037
M204 S10000
G1 X129.637 Y128.071 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515144
G1 F1200
G1 X129.609 Y127.864 E.00804
G2 X129.199 Y127.848 I-.213 J.218 E.01729
G1 X129.151 Y128.038 E.00753
G1 X129.246 Y128.197 E.00713
G1 X129.44 Y128.244 E.00769
G1 X129.573 Y128.183 E.00561
G1 X129.607 Y128.123 E.00267
; CHANGE_LAYER
; Z_HEIGHT: 41.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.573 Y128.183 E-.03612
G1 X129.44 Y128.244 E-.07591
G1 X129.246 Y128.197 E-.10406
G1 X129.151 Y128.038 E-.0964
G1 X129.199 Y127.848 E-.10177
G1 X129.314 Y127.777 E-.07019
G1 X129.473 Y127.776 E-.0827
G1 X129.609 Y127.864 E-.08407
G1 X129.637 Y128.071 E-.10879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 207/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L207
M991 S0 P206 ;notify layer change
G17
G3 Z41.6 I-.885 J.835 P1  F30000
G1 X129.96 Y128.413 Z41.6
G1 Z41.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.413 E.09376
G1 X129.439 Y127.304 E.00181
G3 X129.993 Y128.363 I-.04 J.696 E.04766
G1 X130.269 Y128.656 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.802 E.00611
G3 X129.374 Y126.911 I-.736 J-.802 E.12927
G1 X129.46 Y126.912 E.00264
G3 X130.301 Y128.606 I-.063 J1.087 E.07039
M204 S10000
G1 X129.637 Y128.071 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516135
G1 F1200
G1 X129.608 Y127.864 E.00805
G2 X129.2 Y127.848 I-.213 J.217 E.01729
G1 X129.165 Y128.042 E.00758
G1 X129.207 Y128.161 E.00488
G1 X129.381 Y128.251 E.00754
G1 X129.572 Y128.183 E.00782
G1 X129.607 Y128.123 E.00267
; CHANGE_LAYER
; Z_HEIGHT: 41.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.572 Y128.183 E-.03613
G1 X129.381 Y128.251 E-.10601
G1 X129.207 Y128.161 E-.10228
G1 X129.165 Y128.042 E-.06616
G1 X129.2 Y127.848 E-.10275
G1 X129.314 Y127.778 E-.07033
G1 X129.472 Y127.776 E-.08266
G1 X129.608 Y127.864 E-.08455
G1 X129.637 Y128.071 E-.10911
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 208/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L208
M991 S0 P207 ;notify layer change
G17
G3 Z41.8 I-.885 J.836 P1  F30000
G1 X129.96 Y128.413 Z41.8
G1 Z41.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.413 E.09376
G1 X129.439 Y127.304 E.00181
G3 X129.993 Y128.363 I-.04 J.696 E.04766
G1 X130.269 Y128.656 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.802 E.00611
G3 X129.374 Y126.911 I-.736 J-.802 E.12927
G1 X129.459 Y126.912 E.00264
G3 X130.301 Y128.606 I-.063 J1.087 E.0704
M204 S10000
G1 X129.637 Y128.071 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516164
G1 F1200
G1 X129.608 Y127.864 E.00805
G2 X129.2 Y127.848 I-.213 J.217 E.01729
G1 X129.165 Y128.041 E.00756
G1 X129.207 Y128.161 E.0049
G1 X129.381 Y128.251 E.00754
G1 X129.572 Y128.183 E.00782
G1 X129.607 Y128.123 E.00267
; CHANGE_LAYER
; Z_HEIGHT: 41.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.572 Y128.183 E-.03615
G1 X129.381 Y128.251 E-.10598
G1 X129.207 Y128.161 E-.10226
G1 X129.165 Y128.041 E-.06645
G1 X129.2 Y127.848 E-.10251
G1 X129.314 Y127.778 E-.07033
G1 X129.472 Y127.776 E-.08263
G1 X129.608 Y127.864 E-.08458
G1 X129.637 Y128.071 E-.10911
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 209/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L209
M991 S0 P208 ;notify layer change
G17
G3 Z42 I-.885 J.836 P1  F30000
G1 X129.96 Y128.413 Z42
G1 Z41.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.413 E.09376
G1 X129.439 Y127.304 E.00181
G3 X129.993 Y128.363 I-.04 J.696 E.04767
G1 X130.269 Y128.656 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.802 E.00611
G3 X129.374 Y126.911 I-.736 J-.802 E.12927
G1 X129.459 Y126.912 E.00264
G3 X130.301 Y128.606 I-.063 J1.087 E.0704
M204 S10000
G1 X129.637 Y128.071 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514388
G1 F1200
G1 X129.609 Y127.863 E.00804
G1 X129.472 Y127.775 E.00625
G2 X129.199 Y127.848 I-.077 J.261 E.01142
G1 X129.151 Y128.026 E.00708
G1 X129.283 Y128.224 E.00914
G1 X129.479 Y128.239 E.00754
G1 X129.612 Y128.122 E.0068
; CHANGE_LAYER
; Z_HEIGHT: 42
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.479 Y128.239 E-.09212
G1 X129.283 Y128.224 E-.10209
G1 X129.151 Y128.026 E-.12379
G1 X129.199 Y127.848 E-.09583
G1 X129.314 Y127.777 E-.07034
G1 X129.472 Y127.775 E-.08233
G1 X129.609 Y127.863 E-.08458
G1 X129.637 Y128.071 E-.10892
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 210/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L210
M991 S0 P209 ;notify layer change
G17
G3 Z42.2 I-.886 J.835 P1  F30000
G1 X129.96 Y128.413 Z42.2
G1 Z42
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.413 E.09376
G1 X129.439 Y127.304 E.0018
G3 X129.993 Y128.363 I-.04 J.696 E.04767
G1 X130.269 Y128.656 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.802 E.00613
G3 X129.374 Y126.911 I-.736 J-.802 E.12927
G1 X129.459 Y126.912 E.00263
G3 X130.301 Y128.605 I-.063 J1.087 E.07039
M204 S10000
G1 X129.648 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514549
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.408 Y127.754 E.00773
G1 X129.228 Y127.822 E.00737
G1 X129.161 Y127.927 E.0048
G1 X129.205 Y128.161 E.00914
G1 X129.381 Y128.251 E.0076
G1 X129.562 Y128.189 E.00736
G1 X129.623 Y128.056 E.00563
; CHANGE_LAYER
; Z_HEIGHT: 42.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.562 Y128.189 E-.0762
G1 X129.381 Y128.251 E-.09949
G1 X129.205 Y128.161 E-.10279
G1 X129.161 Y127.927 E-.12366
G1 X129.228 Y127.822 E-.06496
G1 X129.408 Y127.754 E-.09965
G1 X129.588 Y127.841 E-.1045
G1 X129.648 Y128.001 E-.08875
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 211/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L211
M991 S0 P210 ;notify layer change
G17
G3 Z42.4 I-.97 J.735 P1  F30000
G1 X129.96 Y128.413 Z42.4
G1 Z42.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.413 E.09376
G1 X129.439 Y127.304 E.0018
G3 X129.993 Y128.363 I-.04 J.696 E.04767
G1 X130.269 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.802 E.00615
G3 X129.374 Y126.911 I-.736 J-.802 E.12927
G1 X129.459 Y126.912 E.00263
G3 X130.301 Y128.605 I-.063 J1.087 E.07037
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515112
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.407 Y127.754 E.00773
G1 X129.23 Y127.821 E.00732
G1 X129.156 Y127.938 E.00531
G1 X129.185 Y128.131 E.00752
G1 X129.355 Y128.235 E.00765
G1 X129.478 Y128.239 E.00476
G1 X129.615 Y128.1 E.00752
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 42.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02272
G1 X129.478 Y128.239 E-.10195
G1 X129.355 Y128.235 E-.06453
G1 X129.185 Y128.131 E-.1037
G1 X129.156 Y127.938 E-.10207
G1 X129.23 Y127.821 E-.07199
G1 X129.407 Y127.754 E-.09923
G1 X129.588 Y127.841 E-.10483
G1 X129.647 Y128.001 E-.08899
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 212/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L212
M991 S0 P211 ;notify layer change
G17
G3 Z42.6 I-.969 J.736 P1  F30000
G1 X129.96 Y128.413 Z42.6
G1 Z42.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.413 E.09376
G1 X129.439 Y127.304 E.00179
G3 X129.993 Y128.363 I-.04 J.696 E.04768
G1 X130.27 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.802 E.00618
G3 X129.374 Y126.911 I-.736 J-.802 E.12926
G1 X129.459 Y126.912 E.00262
G3 X130.302 Y128.604 I-.063 J1.087 E.07035
M204 S10000
G1 X129.648 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514492
G1 F1200
G1 X129.589 Y127.841 E.00656
G1 X129.407 Y127.754 E.00773
G1 X129.229 Y127.821 E.00731
G1 X129.154 Y127.977 E.00666
G1 X129.224 Y128.178 E.0082
G1 X129.381 Y128.251 E.00665
G1 X129.562 Y128.19 E.00735
G1 X129.623 Y128.056 E.00564
; CHANGE_LAYER
; Z_HEIGHT: 42.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.562 Y128.19 E-.07634
G1 X129.381 Y128.251 E-.09961
G1 X129.224 Y128.178 E-.0901
G1 X129.154 Y127.977 E-.11112
G1 X129.229 Y127.821 E-.09018
G1 X129.407 Y127.754 E-.09906
G1 X129.589 Y127.841 E-.10472
G1 X129.648 Y128.001 E-.08887
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 213/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L213
M991 S0 P212 ;notify layer change
G17
G3 Z42.8 I-.97 J.735 P1  F30000
G1 X129.96 Y128.413 Z42.8
G1 Z42.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.413 E.09376
G1 X129.439 Y127.304 E.00179
G3 X129.993 Y128.363 I-.04 J.696 E.04768
G1 X130.271 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.802 E.00622
G3 X129.374 Y126.911 I-.736 J-.802 E.12926
G1 X129.459 Y126.912 E.00262
G3 X130.302 Y128.603 I-.062 J1.087 E.07032
M204 S10000
G1 X129.648 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514522
G1 F1200
G1 X129.589 Y127.841 E.00656
G1 X129.407 Y127.754 E.00773
G1 X129.228 Y127.822 E.00736
G1 X129.161 Y127.927 E.0048
G1 X129.205 Y128.161 E.00914
G1 X129.381 Y128.251 E.0076
G1 X129.562 Y128.19 E.00735
G1 X129.623 Y128.056 E.00564
; CHANGE_LAYER
; Z_HEIGHT: 42.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.562 Y128.19 E-.07624
G1 X129.381 Y128.251 E-.09945
G1 X129.205 Y128.161 E-.10281
G1 X129.161 Y127.927 E-.12366
G1 X129.228 Y127.822 E-.06493
G1 X129.407 Y127.754 E-.09956
G1 X129.589 Y127.841 E-.10461
G1 X129.648 Y128.001 E-.08874
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 214/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L214
M991 S0 P213 ;notify layer change
G17
G3 Z43 I-.97 J.735 P1  F30000
G1 X129.96 Y128.413 Z43
G1 Z42.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M73 P63 R5
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.439 Y127.304 E.00179
G3 X129.993 Y128.363 I-.04 J.696 E.04768
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.802 E.00626
G3 X129.374 Y126.911 I-.736 J-.802 E.12926
G1 X129.459 Y126.912 E.00262
G3 X130.303 Y128.602 I-.062 J1.087 E.07029
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515088
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.407 Y127.754 E.00774
G1 X129.23 Y127.821 E.00731
G1 X129.156 Y127.938 E.00531
G1 X129.185 Y128.131 E.00753
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00476
G1 X129.615 Y128.1 E.00752
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 43
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02272
G1 X129.478 Y128.239 E-.10194
G1 X129.355 Y128.235 E-.06454
G1 X129.185 Y128.131 E-.10369
G1 X129.156 Y127.938 E-.10207
G1 X129.23 Y127.821 E-.072
G1 X129.407 Y127.754 E-.09912
G1 X129.588 Y127.841 E-.10494
G1 X129.647 Y128.001 E-.08897
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 215/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L215
M991 S0 P214 ;notify layer change
G17
G3 Z43.2 I-.97 J.736 P1  F30000
G1 X129.96 Y128.413 Z43.2
G1 Z43
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.438 Y127.304 E.00178
G3 X129.993 Y128.363 I-.039 J.696 E.04769
G1 X130.272 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.802 E.0063
G3 X129.374 Y126.911 I-.736 J-.803 E.12926
G1 X129.459 Y126.912 E.00261
G3 X130.304 Y128.601 I-.062 J1.087 E.07025
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515172
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.407 Y127.754 E.00774
G1 X129.229 Y127.821 E.00732
G1 X129.161 Y127.928 E.00489
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.0075
G1 X129.629 Y128.058 E.00167
; CHANGE_LAYER
; Z_HEIGHT: 43.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02267
G1 X129.479 Y128.239 E-.10147
G1 X129.285 Y128.224 E-.10109
G1 X129.188 Y128.128 E-.07118
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.821 E-.06619
G1 X129.407 Y127.754 E-.09903
G1 X129.588 Y127.841 E-.10475
G1 X129.647 Y128.001 E-.08879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 216/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L216
M991 S0 P215 ;notify layer change
G17
G3 Z43.4 I-.97 J.735 P1  F30000
G1 X129.96 Y128.413 Z43.4
G1 Z43.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.438 Y127.304 E.00178
G3 X129.993 Y128.363 I-.039 J.696 E.04769
G1 X130.273 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.802 E.00635
G3 X129.374 Y126.911 I-.736 J-.803 E.12926
G1 X129.458 Y126.912 E.00261
G3 X130.304 Y128.601 I-.062 J1.087 E.07022
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515075
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.407 Y127.754 E.00774
G1 X129.23 Y127.821 E.0073
G1 X129.156 Y127.938 E.00531
G1 X129.185 Y128.131 E.00752
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00476
G1 X129.615 Y128.1 E.00752
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 43.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02272
G1 X129.478 Y128.239 E-.10194
G1 X129.355 Y128.235 E-.06455
G1 X129.185 Y128.131 E-.10369
G1 X129.156 Y127.938 E-.10207
G1 X129.23 Y127.821 E-.07202
G1 X129.407 Y127.754 E-.09904
G1 X129.588 Y127.841 E-.10501
G1 X129.647 Y128.001 E-.08896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 217/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L217
M991 S0 P216 ;notify layer change
G17
G3 Z43.6 I-.97 J.735 P1  F30000
G1 X129.96 Y128.413 Z43.6
G1 Z43.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.438 Y127.304 E.00178
G3 X129.993 Y128.363 I-.039 J.696 E.0477
G1 X130.274 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.802 E.0064
G3 X129.374 Y126.911 I-.736 J-.803 E.12926
G1 X129.458 Y126.912 E.00261
G3 X130.305 Y128.6 I-.062 J1.087 E.0702
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515162
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.407 Y127.754 E.00774
G1 X129.229 Y127.821 E.00731
G1 X129.161 Y127.928 E.00489
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.0075
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 43.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02267
G1 X129.479 Y128.239 E-.10146
G1 X129.285 Y128.224 E-.10108
G1 X129.188 Y128.128 E-.07119
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.821 E-.0662
G1 X129.407 Y127.754 E-.09896
G1 X129.588 Y127.841 E-.10482
G1 X129.647 Y128.001 E-.08878
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 218/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L218
M991 S0 P217 ;notify layer change
G17
G3 Z43.8 I-.97 J.735 P1  F30000
G1 X129.96 Y128.413 Z43.8
G1 Z43.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.438 Y127.304 E.00177
G3 X129.993 Y128.363 I-.039 J.696 E.0477
G1 X130.275 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.802 E.00644
G3 X129.374 Y126.911 I-.736 J-.803 E.12926
G1 X129.458 Y126.912 E.0026
G3 X130.305 Y128.599 I-.062 J1.087 E.07018
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515063
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.407 Y127.754 E.00775
G1 X129.23 Y127.821 E.0073
G1 X129.156 Y127.938 E.00531
G1 X129.185 Y128.131 E.00753
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00476
G1 X129.615 Y128.1 E.00751
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 43.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02273
G1 X129.478 Y128.239 E-.10192
G1 X129.355 Y128.235 E-.06458
G1 X129.185 Y128.131 E-.10367
G1 X129.156 Y127.938 E-.10207
G1 X129.23 Y127.821 E-.07203
G1 X129.407 Y127.754 E-.09897
G1 X129.588 Y127.841 E-.10508
G1 X129.647 Y128.001 E-.08896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 219/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L219
M991 S0 P218 ;notify layer change
G17
G3 Z44 I-.97 J.735 P1  F30000
G1 X129.96 Y128.413 Z44
G1 Z43.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.438 Y127.304 E.00177
G3 X129.993 Y128.363 I-.039 J.696 E.0477
G1 X130.273 Y128.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.877 J-.645 E.13576
G1 X129.458 Y126.912 E.0026
G3 X130.308 Y128.596 I-.062 J1.087 E.07005
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515118
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.407 Y127.754 E.00775
G1 X129.229 Y127.821 E.00731
G1 X129.161 Y127.928 E.00489
G1 X129.188 Y128.128 E.00775
G1 X129.285 Y128.224 E.00525
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.0075
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 44
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02268
G1 X129.479 Y128.239 E-.10145
G1 X129.285 Y128.224 E-.10109
G1 X129.188 Y128.128 E-.07109
G1 X129.161 Y127.928 E-.10489
G1 X129.229 Y127.821 E-.06624
G1 X129.407 Y127.754 E-.0989
G1 X129.588 Y127.841 E-.10488
G1 X129.647 Y128.001 E-.08877
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 220/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L220
M991 S0 P219 ;notify layer change
G17
G3 Z44.2 I-.97 J.735 P1  F30000
G1 X129.96 Y128.413 Z44.2
G1 Z44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.438 Y127.304 E.00176
G3 X129.993 Y128.363 I-.039 J.696 E.04771
G1 X130.273 Y128.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.877 J-.646 E.13576
G1 X129.458 Y126.912 E.00259
G3 X130.308 Y128.596 I-.062 J1.087 E.07005
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515049
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.407 Y127.754 E.00775
G1 X129.23 Y127.821 E.00729
G1 X129.156 Y127.938 E.00531
G1 X129.185 Y128.131 E.00753
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00476
G1 X129.615 Y128.1 E.00751
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 44.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02273
G1 X129.478 Y128.239 E-.10191
G1 X129.355 Y128.235 E-.06458
G1 X129.185 Y128.131 E-.10367
G1 X129.156 Y127.938 E-.10207
G1 X129.23 Y127.821 E-.07203
G1 X129.407 Y127.754 E-.0989
G1 X129.588 Y127.841 E-.10514
G1 X129.647 Y128.001 E-.08896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 221/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L221
M991 S0 P220 ;notify layer change
G17
G3 Z44.4 I-.97 J.735 P1  F30000
G1 X129.96 Y128.413 Z44.4
G1 Z44.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.438 Y127.304 E.00176
G3 X129.993 Y128.363 I-.039 J.696 E.04771
G1 X130.278 Y128.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00014
G3 X129.374 Y126.911 I-.877 J-.646 E.13576
G1 X129.458 Y126.912 E.00259
G3 X130.382 Y128.463 I-.062 J1.087 E.06537
G1 X130.307 Y128.593 E.00462
M204 S10000
G1 X129.648 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514443
G1 F1200
G1 X129.589 Y127.841 E.00656
G1 X129.407 Y127.754 E.00775
G1 X129.228 Y127.822 E.00734
G1 X129.161 Y127.927 E.00479
G1 X129.205 Y128.161 E.00914
G1 X129.381 Y128.251 E.0076
G1 X129.562 Y128.19 E.00734
G1 X129.623 Y128.056 E.00564
; CHANGE_LAYER
; Z_HEIGHT: 44.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.562 Y128.19 E-.07636
G1 X129.381 Y128.251 E-.09933
G1 X129.205 Y128.161 E-.10285
G1 X129.161 Y127.927 E-.12366
G1 X129.228 Y127.822 E-.06485
G1 X129.407 Y127.754 E-.09935
G1 X129.589 Y127.841 E-.10488
G1 X129.648 Y128.001 E-.08872
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 222/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L222
M991 S0 P221 ;notify layer change
G17
G3 Z44.6 I-.97 J.735 P1  F30000
G1 X129.959 Y128.413 Z44.6
G1 Z44.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.438 Y127.304 E.00176
G3 X129.993 Y128.363 I-.039 J.696 E.04771
G1 X130.278 Y128.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00016
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.458 Y126.912 E.00259
G3 X130.382 Y128.463 I-.061 J1.087 E.06538
G1 X130.308 Y128.592 E.00458
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515137
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.407 Y127.754 E.00776
G1 X129.229 Y127.821 E.0073
G1 X129.161 Y127.928 E.00489
G1 X129.188 Y128.128 E.00775
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00749
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 44.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02268
G1 X129.479 Y128.239 E-.10144
G1 X129.285 Y128.224 E-.10111
G1 X129.188 Y128.128 E-.07118
G1 X129.161 Y127.928 E-.10484
G1 X129.229 Y127.821 E-.06618
G1 X129.407 Y127.754 E-.09881
G1 X129.588 Y127.841 E-.10499
G1 X129.647 Y128.001 E-.08877
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 223/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L223
M991 S0 P222 ;notify layer change
G17
G3 Z44.8 I-.97 J.735 P1  F30000
G1 X129.959 Y128.413 Z44.8
G1 Z44.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.438 Y127.304 E.00175
G3 X129.993 Y128.363 I-.039 J.696 E.04772
G1 X130.279 Y128.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00018
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.458 Y126.912 E.00258
G3 X130.382 Y128.463 I-.061 J1.087 E.06538
G1 X130.309 Y128.591 E.00455
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51503
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.407 Y127.754 E.00776
G1 X129.23 Y127.821 E.00728
G1 X129.156 Y127.938 E.00531
G1 X129.185 Y128.131 E.00753
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00476
G1 X129.615 Y128.1 E.00751
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 44.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02273
G1 X129.478 Y128.239 E-.1019
M73 P64 R5
G1 X129.355 Y128.235 E-.06461
G1 X129.185 Y128.131 E-.10365
G1 X129.156 Y127.938 E-.10207
G1 X129.23 Y127.821 E-.07205
G1 X129.407 Y127.754 E-.09878
G1 X129.588 Y127.841 E-.10525
G1 X129.647 Y128.001 E-.08895
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 224/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L224
M991 S0 P223 ;notify layer change
G17
G3 Z45 I-.97 J.735 P1  F30000
G1 X129.959 Y128.413 Z45
G1 Z44.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.437 Y127.304 E.00175
G3 X129.993 Y128.363 I-.039 J.696 E.04772
G1 X130.279 Y128.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.0002
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.457 Y126.912 E.00258
G3 X130.382 Y128.463 I-.061 J1.087 E.06539
G1 X130.309 Y128.591 E.00452
M204 S10000
G1 X129.648 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514367
G1 F1200
G1 X129.589 Y127.841 E.00656
G1 X129.407 Y127.754 E.00776
G1 X129.229 Y127.821 E.00728
G1 X129.154 Y127.977 E.00666
G1 X129.225 Y128.179 E.00823
G1 X129.381 Y128.251 E.00662
G1 X129.562 Y128.19 E.00734
G1 X129.623 Y128.056 E.00565
; CHANGE_LAYER
; Z_HEIGHT: 45
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.562 Y128.19 E-.07651
G1 X129.381 Y128.251 E-.09944
G1 X129.225 Y128.179 E-.08973
G1 X129.154 Y127.977 E-.11154
G1 X129.229 Y127.821 E-.09019
G1 X129.407 Y127.754 E-.09861
G1 X129.589 Y127.841 E-.10514
G1 X129.648 Y128.001 E-.08884
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 225/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L225
M991 S0 P224 ;notify layer change
G17
G3 Z45.2 I-.97 J.734 P1  F30000
G1 X129.959 Y128.413 Z45.2
G1 Z45
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.437 Y127.304 E.00175
G3 X129.993 Y128.363 I-.039 J.696 E.04772
G1 X130.28 Y128.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00022
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.457 Y126.912 E.00258
G3 X130.382 Y128.463 I-.061 J1.087 E.06539
G1 X130.309 Y128.59 E.0045
M204 S10000
G1 X129.648 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514358
G1 F1200
G1 X129.589 Y127.841 E.00656
G1 X129.407 Y127.754 E.00776
G1 X129.229 Y127.821 E.00728
G1 X129.154 Y127.977 E.00666
G1 X129.225 Y128.179 E.00824
G1 X129.381 Y128.251 E.00662
G1 X129.562 Y128.19 E.00734
G1 X129.623 Y128.056 E.00565
; CHANGE_LAYER
; Z_HEIGHT: 45.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.562 Y128.19 E-.07653
G1 X129.381 Y128.251 E-.09942
G1 X129.225 Y128.179 E-.0897
G1 X129.154 Y127.977 E-.11157
G1 X129.229 Y127.821 E-.09019
G1 X129.407 Y127.754 E-.09858
G1 X129.589 Y127.841 E-.10516
G1 X129.648 Y128.001 E-.08885
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 226/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L226
M991 S0 P225 ;notify layer change
G17
G3 Z45.4 I-.97 J.734 P1  F30000
G1 X129.959 Y128.413 Z45.4
G1 Z45.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.437 Y127.304 E.00174
G3 X129.993 Y128.363 I-.039 J.696 E.04773
G1 X130.28 Y128.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00023
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.457 Y126.912 E.00257
G3 X130.382 Y128.463 I-.061 J1.087 E.06539
G1 X130.309 Y128.59 E.00449
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515008
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.406 Y127.754 E.00777
G1 X129.23 Y127.821 E.00728
G1 X129.156 Y127.938 E.00531
G1 X129.185 Y128.131 E.00753
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00476
G1 X129.615 Y128.1 E.00751
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 45.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02274
G1 X129.478 Y128.239 E-.10189
G1 X129.355 Y128.235 E-.0646
G1 X129.185 Y128.131 E-.10365
G1 X129.156 Y127.938 E-.10207
G1 X129.23 Y127.821 E-.07206
G1 X129.406 Y127.754 E-.09868
G1 X129.588 Y127.841 E-.10535
G1 X129.647 Y128.001 E-.08895
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 227/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L227
M991 S0 P226 ;notify layer change
G17
G3 Z45.6 I-.97 J.735 P1  F30000
G1 X129.959 Y128.413 Z45.6
G1 Z45.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.437 Y127.304 E.00174
G3 X129.993 Y128.363 I-.038 J.696 E.04773
G1 X130.28 Y128.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00023
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.457 Y126.912 E.00257
G3 X130.382 Y128.463 I-.061 J1.087 E.0654
G1 X130.31 Y128.59 E.00448
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.406 Y127.754 E.00777
G1 X129.23 Y127.821 E.00727
G1 X129.156 Y127.938 E.00531
G1 X129.185 Y128.131 E.00753
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00476
G1 X129.615 Y128.1 E.00751
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 45.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02274
G1 X129.478 Y128.239 E-.1019
G1 X129.355 Y128.235 E-.0646
G1 X129.185 Y128.131 E-.10366
G1 X129.156 Y127.938 E-.10207
G1 X129.23 Y127.821 E-.07207
G1 X129.406 Y127.754 E-.09864
G1 X129.588 Y127.841 E-.10539
G1 X129.647 Y128.001 E-.08894
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 228/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L228
M991 S0 P227 ;notify layer change
G17
G3 Z45.8 I-.97 J.735 P1  F30000
G1 X129.959 Y128.413 Z45.8
G1 Z45.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.437 Y127.304 E.00173
G3 X129.993 Y128.363 I-.038 J.696 E.04773
G1 X130.28 Y128.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00023
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.457 Y126.912 E.00256
G3 X130.382 Y128.463 I-.061 J1.087 E.0654
G1 X130.31 Y128.59 E.00448
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515108
G1 F1200
G1 X129.588 Y127.842 E.00656
G1 X129.406 Y127.754 E.00777
G1 X129.229 Y127.821 E.00728
G1 X129.161 Y127.928 E.00489
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00749
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 45.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02268
G1 X129.479 Y128.239 E-.10143
G1 X129.285 Y128.224 E-.10112
G1 X129.188 Y128.128 E-.07118
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.821 E-.0662
G1 X129.406 Y127.754 E-.0986
G1 X129.588 Y127.842 E-.10521
G1 X129.647 Y128.001 E-.08874
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 229/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L229
M991 S0 P228 ;notify layer change
G17
G3 Z46 I-.97 J.735 P1  F30000
G1 X129.959 Y128.413 Z46
G1 Z45.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.437 Y127.304 E.00173
G3 X129.993 Y128.363 I-.038 J.696 E.04774
G1 X130.28 Y128.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00023
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.457 Y126.912 E.00256
G3 X130.382 Y128.463 I-.061 J1.087 E.06541
G1 X130.309 Y128.59 E.00449
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515105
G1 F1200
G1 X129.588 Y127.842 E.00656
G1 X129.406 Y127.754 E.00778
G1 X129.229 Y127.821 E.00728
G1 X129.161 Y127.928 E.00489
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00749
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 46
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02268
G1 X129.479 Y128.239 E-.10142
G1 X129.285 Y128.224 E-.10112
G1 X129.188 Y128.128 E-.07119
G1 X129.161 Y127.928 E-.10482
G1 X129.229 Y127.821 E-.0662
G1 X129.406 Y127.754 E-.09857
G1 X129.588 Y127.842 E-.10525
G1 X129.647 Y128.001 E-.08874
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 230/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L230
M991 S0 P229 ;notify layer change
G17
G3 Z46.2 I-.97 J.735 P1  F30000
G1 X129.959 Y128.413 Z46.2
G1 Z46
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.437 Y127.304 E.00173
G3 X129.993 Y128.363 I-.038 J.696 E.04774
G1 X130.28 Y128.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00022
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.457 Y126.912 E.00256
G3 X130.382 Y128.463 I-.061 J1.087 E.06541
G1 X130.309 Y128.59 E.0045
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515101
G1 F1200
G1 X129.588 Y127.842 E.00656
G1 X129.406 Y127.754 E.00778
G1 X129.229 Y127.821 E.00728
G1 X129.161 Y127.928 E.00489
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00749
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 46.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02269
G1 X129.479 Y128.239 E-.10142
G1 X129.285 Y128.224 E-.10112
G1 X129.188 Y128.128 E-.07118
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.821 E-.06619
G1 X129.406 Y127.754 E-.09855
G1 X129.588 Y127.842 E-.10528
G1 X129.647 Y128.001 E-.08874
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 231/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L231
M991 S0 P230 ;notify layer change
G17
G3 Z46.4 I-.97 J.735 P1  F30000
G1 X129.959 Y128.413 Z46.4
G1 Z46.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.437 Y127.304 E.00172
G3 X129.993 Y128.363 I-.038 J.696 E.04775
G1 X130.279 Y128.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00022
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.457 Y126.912 E.00255
G3 X130.382 Y128.463 I-.061 J1.087 E.06541
G1 X130.309 Y128.59 E.00451
M204 S10000
G1 X129.648 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514291
G1 F1200
G1 X129.589 Y127.841 E.00656
G1 X129.406 Y127.754 E.00778
G1 X129.23 Y127.821 E.00726
G1 X129.154 Y127.977 E.00666
M73 P64 R4
G1 X129.225 Y128.179 E.00825
G1 X129.381 Y128.251 E.00661
G1 X129.562 Y128.19 E.00733
G1 X129.623 Y128.056 E.00566
; CHANGE_LAYER
; Z_HEIGHT: 46.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.562 Y128.19 E-.07662
G1 X129.381 Y128.251 E-.09934
G1 X129.225 Y128.179 E-.0895
G1 X129.154 Y127.977 E-.11179
G1 X129.23 Y127.821 E-.09019
G1 X129.406 Y127.754 E-.09835
G1 X129.589 Y127.841 E-.10539
G1 X129.648 Y128.001 E-.08882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 232/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L232
M991 S0 P231 ;notify layer change
G17
G3 Z46.6 I-.971 J.734 P1  F30000
G1 X129.959 Y128.413 Z46.6
G1 Z46.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.437 Y127.304 E.00172
G3 X129.993 Y128.364 I-.038 J.696 E.04775
G1 X130.279 Y128.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.0002
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.457 Y126.912 E.00255
G3 X130.382 Y128.463 I-.06 J1.087 E.06542
G1 X130.309 Y128.591 E.00452
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515091
G1 F1200
G1 X129.588 Y127.842 E.00656
G1 X129.406 Y127.754 E.00778
G1 X129.229 Y127.821 E.00728
G1 X129.161 Y127.928 E.00489
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00749
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 46.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02269
G1 X129.479 Y128.239 E-.10141
G1 X129.285 Y128.224 E-.10113
G1 X129.188 Y128.128 E-.07119
G1 X129.161 Y127.928 E-.10482
G1 X129.229 Y127.821 E-.0662
G1 X129.406 Y127.754 E-.09849
G1 X129.588 Y127.842 E-.10534
G1 X129.647 Y128.001 E-.08874
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 233/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L233
M991 S0 P232 ;notify layer change
G17
G3 Z46.8 I-.97 J.734 P1  F30000
G1 X129.959 Y128.413 Z46.8
G1 Z46.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.437 Y127.304 E.00171
G3 X129.993 Y128.364 I-.038 J.696 E.04775
G1 X130.279 Y128.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00019
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.456 Y126.912 E.00254
G3 X130.381 Y128.463 I-.06 J1.087 E.06542
G1 X130.308 Y128.591 E.00454
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515063
G1 F1200
G1 X129.588 Y127.841 E.00656
G1 X129.406 Y127.754 E.00779
G1 X129.229 Y127.821 E.00727
G1 X129.161 Y127.928 E.00489
G1 X129.188 Y128.128 E.00775
G1 X129.285 Y128.224 E.00525
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00749
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 46.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02269
G1 X129.479 Y128.239 E-.10141
M73 P65 R4
G1 X129.285 Y128.224 E-.10113
G1 X129.188 Y128.128 E-.07113
G1 X129.161 Y127.928 E-.10486
G1 X129.229 Y127.821 E-.06622
G1 X129.406 Y127.754 E-.09845
G1 X129.588 Y127.841 E-.10537
G1 X129.647 Y128.001 E-.08874
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 234/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L234
M991 S0 P233 ;notify layer change
G17
G3 Z47 I-.97 J.734 P1  F30000
G1 X129.959 Y128.413 Z47
G1 Z46.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.436 Y127.304 E.00171
G3 X129.993 Y128.364 I-.038 J.696 E.04776
G1 X130.278 Y128.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00018
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.456 Y126.912 E.00254
G3 X130.381 Y128.463 I-.06 J1.087 E.06543
G1 X130.308 Y128.592 E.00456
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515078
G1 F1200
G1 X129.588 Y127.842 E.00656
G1 X129.406 Y127.754 E.00779
G1 X129.229 Y127.821 E.00727
G1 X129.161 Y127.928 E.00489
G1 X129.188 Y128.128 E.00775
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00749
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 47
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02269
G1 X129.479 Y128.239 E-.1014
G1 X129.285 Y128.224 E-.10114
G1 X129.188 Y128.128 E-.07119
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.821 E-.06619
G1 X129.406 Y127.754 E-.09842
G1 X129.588 Y127.842 E-.10541
G1 X129.647 Y128.001 E-.08873
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 235/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L235
M991 S0 P234 ;notify layer change
G17
G3 Z47.2 I-.971 J.734 P1  F30000
G1 X129.959 Y128.413 Z47.2
G1 Z47
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.436 Y127.304 E.00171
G3 X129.993 Y128.364 I-.038 J.696 E.04776
G1 X130.278 Y128.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00016
G3 X129.374 Y126.911 I-.877 J-.646 E.13575
G1 X129.456 Y126.912 E.00254
G3 X130.381 Y128.463 I-.06 J1.087 E.06543
G1 X130.308 Y128.593 E.00459
M204 S10000
G1 X129.648 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51425
G1 F1200
G1 X129.589 Y127.841 E.00656
G1 X129.406 Y127.753 E.00779
G1 X129.23 Y127.821 E.00725
G1 X129.154 Y127.977 E.00666
G1 X129.225 Y128.18 E.00826
G1 X129.381 Y128.251 E.0066
G1 X129.562 Y128.19 E.00733
G1 X129.623 Y128.056 E.00566
; CHANGE_LAYER
; Z_HEIGHT: 47.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.562 Y128.19 E-.07668
G1 X129.381 Y128.251 E-.09928
G1 X129.225 Y128.18 E-.08938
G1 X129.154 Y127.977 E-.11193
G1 X129.23 Y127.821 E-.0902
G1 X129.406 Y127.753 E-.0982
G1 X129.589 Y127.841 E-.10552
G1 X129.648 Y128.001 E-.08881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 236/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L236
M991 S0 P235 ;notify layer change
G17
G3 Z47.4 I-.971 J.734 P1  F30000
G1 X129.959 Y128.413 Z47.4
G1 Z47.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09376
G1 X129.436 Y127.304 E.0017
G3 X129.993 Y128.364 I-.038 J.696 E.04776
G1 X130.278 Y128.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00015
G3 X129.374 Y126.911 I-.877 J-.646 E.13574
G1 X129.456 Y126.912 E.00253
G3 X130.381 Y128.463 I-.06 J1.087 E.06544
G1 X130.307 Y128.593 E.00461
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514939
G1 F1200
G1 X129.588 Y127.841 E.00655
G1 X129.406 Y127.754 E.00779
G1 X129.23 Y127.821 E.00725
G1 X129.156 Y127.938 E.00532
G1 X129.185 Y128.131 E.00752
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00477
G1 X129.615 Y128.1 E.00751
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 47.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02275
G1 X129.478 Y128.239 E-.10187
G1 X129.355 Y128.235 E-.06465
G1 X129.185 Y128.131 E-.10363
G1 X129.156 Y127.938 E-.10207
G1 X129.23 Y127.821 E-.07212
G1 X129.406 Y127.754 E-.0983
G1 X129.588 Y127.841 E-.10571
G1 X129.647 Y128.001 E-.0889
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 237/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L237
M991 S0 P236 ;notify layer change
G17
G3 Z47.6 I-.971 J.734 P1  F30000
G1 X129.959 Y128.413 Z47.6
G1 Z47.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.561 J-.414 E.09377
G1 X129.436 Y127.304 E.0017
G3 X129.993 Y128.364 I-.038 J.696 E.04777
G1 X130.277 Y128.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.645 E.00014
G3 X129.374 Y126.911 I-.877 J-.646 E.13574
G1 X129.456 Y126.912 E.00253
G3 X130.381 Y128.463 I-.06 J1.087 E.06544
G1 X130.307 Y128.594 E.00463
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514931
G1 F1200
G1 X129.588 Y127.841 E.00655
G1 X129.406 Y127.754 E.0078
G1 X129.23 Y127.821 E.00724
G1 X129.156 Y127.938 E.00532
G1 X129.185 Y128.131 E.00753
G1 X129.354 Y128.235 E.00764
G1 X129.478 Y128.239 E.00477
G1 X129.615 Y128.1 E.00751
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 47.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02275
G1 X129.478 Y128.239 E-.10186
G1 X129.354 Y128.235 E-.06467
G1 X129.185 Y128.131 E-.10362
G1 X129.156 Y127.938 E-.10207
G1 X129.23 Y127.821 E-.07211
G1 X129.406 Y127.754 E-.09827
G1 X129.588 Y127.841 E-.10574
G1 X129.647 Y128.001 E-.08891
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 238/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L238
M991 S0 P237 ;notify layer change
G17
G3 Z47.8 I-.971 J.734 P1  F30000
G1 X129.959 Y128.413 Z47.8
G1 Z47.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09376
G1 X129.436 Y127.304 E.0017
G3 X129.993 Y128.364 I-.037 J.696 E.04777
G1 X130.273 Y128.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.877 J-.646 E.13574
G1 X129.456 Y126.912 E.00253
G3 X130.307 Y128.596 I-.06 J1.087 E.07013
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514928
G1 F1200
G1 X129.588 Y127.841 E.00655
G1 X129.406 Y127.754 E.0078
G1 X129.23 Y127.821 E.00724
G1 X129.156 Y127.938 E.00532
G1 X129.185 Y128.131 E.00753
G1 X129.354 Y128.235 E.00764
G1 X129.478 Y128.239 E.00477
G1 X129.615 Y128.1 E.00751
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 47.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02275
G1 X129.478 Y128.239 E-.10185
G1 X129.354 Y128.235 E-.06467
G1 X129.185 Y128.131 E-.10361
G1 X129.156 Y127.938 E-.10208
G1 X129.23 Y127.821 E-.07211
G1 X129.406 Y127.754 E-.09825
G1 X129.588 Y127.841 E-.10577
G1 X129.647 Y128.001 E-.08891
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 239/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L239
M991 S0 P238 ;notify layer change
G17
G3 Z48 I-.971 J.734 P1  F30000
G1 X129.959 Y128.413 Z48
G1 Z47.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.436 Y127.304 E.00169
G3 X129.993 Y128.364 I-.037 J.696 E.04777
G1 X130.273 Y128.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.877 J-.646 E.13574
G1 X129.456 Y126.912 E.00252
G3 X130.307 Y128.596 I-.06 J1.087 E.07014
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515056
G1 F1200
G1 X129.588 Y127.842 E.00655
G1 X129.406 Y127.754 E.0078
G1 X129.229 Y127.821 E.00726
G1 X129.161 Y127.928 E.00489
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00749
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 48
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.02269
G1 X129.479 Y128.239 E-.10139
G1 X129.285 Y128.224 E-.10114
G1 X129.188 Y128.128 E-.07119
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.821 E-.0662
G1 X129.406 Y127.754 E-.09825
G1 X129.588 Y127.842 E-.10559
G1 X129.647 Y128.001 E-.08871
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 240/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L240
M991 S0 P239 ;notify layer change
G17
G3 Z48.2 I-.971 J.734 P1  F30000
G1 X129.959 Y128.413 Z48.2
G1 Z48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.436 Y127.304 E.00169
G3 X129.993 Y128.364 I-.037 J.696 E.04778
G1 X130.273 Y128.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.877 J-.646 E.13574
G1 X129.456 Y126.912 E.00252
G3 X130.307 Y128.596 I-.06 J1.087 E.07014
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515052
G1 F1200
G1 X129.588 Y127.842 E.00655
G1 X129.406 Y127.754 E.0078
G1 X129.229 Y127.821 E.00726
G1 X129.161 Y127.928 E.00489
G1 X129.188 Y128.128 E.00774
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.615 Y128.1 E.00749
G1 X129.629 Y128.058 E.00168
; CHANGE_LAYER
; Z_HEIGHT: 48.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.615 Y128.1 E-.0227
G1 X129.479 Y128.239 E-.10139
G1 X129.285 Y128.224 E-.10114
G1 X129.188 Y128.128 E-.07119
G1 X129.161 Y127.928 E-.10483
G1 X129.229 Y127.821 E-.0662
G1 X129.406 Y127.754 E-.09822
G1 X129.588 Y127.842 E-.10562
G1 X129.647 Y128.001 E-.08872
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 241/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L241
M991 S0 P240 ;notify layer change
G17
G3 Z48.4 I-.971 J.734 P1  F30000
G1 X129.959 Y128.413 Z48.4
G1 Z48.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.436 Y127.304 E.00168
G3 X129.993 Y128.364 I-.037 J.696 E.04778
G1 X130.273 Y128.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.877 J-.646 E.13574
G1 X129.455 Y126.912 E.00251
G3 X130.307 Y128.596 I-.059 J1.087 E.07015
M204 S10000
G1 X129.648 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514188
G1 F1200
G1 X129.589 Y127.841 E.00655
G1 X129.405 Y127.753 E.0078
G1 X129.23 Y127.821 E.00723
G1 X129.154 Y127.977 E.00666
G1 X129.225 Y128.18 E.00828
G1 X129.381 Y128.252 E.00658
G1 X129.562 Y128.19 E.00732
G1 X129.623 Y128.056 E.00567
; CHANGE_LAYER
; Z_HEIGHT: 48.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.562 Y128.19 E-.07677
G1 X129.381 Y128.252 E-.0992
G1 X129.225 Y128.18 E-.08919
G1 X129.154 Y127.977 E-.11214
G1 X129.23 Y127.821 E-.0902
G1 X129.405 Y127.753 E-.09799
G1 X129.589 Y127.841 E-.10573
G1 X129.648 Y128.001 E-.0888
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 242/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L242
M991 S0 P241 ;notify layer change
G17
G3 Z48.6 I-.971 J.733 P1  F30000
G1 X129.959 Y128.413 Z48.6
G1 Z48.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.436 Y127.304 E.00168
G3 X129.993 Y128.364 I-.037 J.696 E.04779
G1 X130.275 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.131 Y128.803 E.00646
G3 X129.374 Y126.911 I-.735 J-.804 E.12923
G1 X129.455 Y126.912 E.00251
G3 X130.304 Y128.6 I-.059 J1.087 E.07029
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515373
G1 F1200
G1 X129.587 Y127.841 E.0066
G1 X129.413 Y127.754 E.0075
G1 X129.229 Y127.822 E.00754
G1 X129.156 Y127.938 E.00529
G1 X129.185 Y128.131 E.00753
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00477
G1 X129.614 Y128.1 E.00747
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 48.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.614 Y128.1 E-.0232
G1 X129.478 Y128.239 E-.10134
G1 X129.355 Y128.235 E-.06466
G1 X129.185 Y128.131 E-.10359
G1 X129.156 Y127.938 E-.10204
G1 X129.229 Y127.822 E-.07172
G1 X129.413 Y127.754 E-.10226
G1 X129.587 Y127.841 E-.10167
G1 X129.647 Y128.001 E-.08953
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 243/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L243
M991 S0 P242 ;notify layer change
G17
G3 Z48.8 I-.971 J.734 P1  F30000
G1 X129.959 Y128.414 Z48.8
G1 Z48.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.436 Y127.304 E.00168
G3 X129.992 Y128.364 I-.037 J.696 E.04779
G1 X130.274 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.131 Y128.803 E.00644
G3 X129.374 Y126.911 I-.735 J-.804 E.12923
G1 X129.455 Y126.912 E.00251
G3 X130.304 Y128.6 I-.059 J1.087 E.0703
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515898
G1 F1200
G1 X129.587 Y127.841 E.0066
G1 X129.413 Y127.754 E.0075
G1 X129.23 Y127.822 E.00754
G1 X129.156 Y127.938 E.00529
G1 X129.186 Y128.131 E.00752
G1 X129.345 Y128.233 E.00731
G1 X129.479 Y128.238 E.00515
G1 X129.614 Y128.1 E.00746
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 48.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.1 E-.02315
G1 X129.479 Y128.238 E-.10104
M73 P66 R4
G1 X129.345 Y128.233 E-.06978
G1 X129.186 Y128.131 E-.09907
G1 X129.156 Y127.938 E-.10195
G1 X129.23 Y127.822 E-.07169
G1 X129.413 Y127.754 E-.10218
G1 X129.587 Y127.841 E-.10166
G1 X129.647 Y128.001 E-.08948
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 244/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L244
M991 S0 P243 ;notify layer change
G17
G3 Z49 I-.97 J.734 P1  F30000
G1 X129.959 Y128.414 Z49
G1 Z48.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.435 Y127.304 E.00167
G3 X129.992 Y128.364 I-.037 J.696 E.04779
G1 X130.274 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.131 Y128.803 E.00643
G3 X129.374 Y126.911 I-.735 J-.804 E.12923
G1 X129.455 Y126.912 E.0025
G3 X130.304 Y128.601 I-.059 J1.087 E.07031
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515273
G1 F1200
G1 X129.587 Y127.841 E.0066
G1 X129.413 Y127.754 E.0075
G1 X129.229 Y127.822 E.00754
G1 X129.161 Y127.928 E.00488
G1 X129.188 Y128.128 E.00775
G1 X129.285 Y128.224 E.00526
G1 X129.479 Y128.239 E.00747
G1 X129.614 Y128.101 E.00745
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 49
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.101 E-.02316
G1 X129.479 Y128.239 E-.10085
G1 X129.285 Y128.224 E-.10113
G1 X129.188 Y128.128 E-.07116
G1 X129.161 Y127.928 E-.1048
G1 X129.229 Y127.822 E-.06607
G1 X129.413 Y127.754 E-.10197
G1 X129.587 Y127.841 E-.10153
G1 X129.647 Y128.001 E-.08933
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 245/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L245
M991 S0 P244 ;notify layer change
G17
G3 Z49.2 I-.971 J.734 P1  F30000
G1 X129.959 Y128.414 Z49.2
G1 Z49
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.435 Y127.304 E.00167
G3 X129.992 Y128.364 I-.037 J.696 E.0478
G1 X130.274 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.131 Y128.803 E.00642
G3 X129.374 Y126.911 I-.735 J-.804 E.12922
G1 X129.455 Y126.912 E.0025
G3 X130.304 Y128.601 I-.059 J1.087 E.07032
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515383
G1 F1200
G1 X129.587 Y127.841 E.0066
G1 X129.413 Y127.754 E.00751
G1 X129.229 Y127.822 E.00753
G1 X129.156 Y127.938 E.00529
G1 X129.185 Y128.131 E.00753
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00477
G1 X129.614 Y128.1 E.00747
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 49.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.1 E-.02321
G1 X129.478 Y128.239 E-.10132
G1 X129.355 Y128.235 E-.06467
G1 X129.185 Y128.131 E-.10359
G1 X129.156 Y127.938 E-.10204
G1 X129.229 Y127.822 E-.07173
G1 X129.413 Y127.754 E-.10215
G1 X129.587 Y127.841 E-.10177
G1 X129.647 Y128.001 E-.08952
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 246/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L246
M991 S0 P245 ;notify layer change
G17
G3 Z49.4 I-.971 J.734 P1  F30000
G1 X129.959 Y128.414 Z49.4
G1 Z49.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.435 Y127.304 E.00166
G3 X129.992 Y128.364 I-.037 J.696 E.0478
G1 X130.274 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.131 Y128.803 E.00641
G3 X129.374 Y126.911 I-.735 J-.804 E.12922
G1 X129.455 Y126.912 E.00249
G3 X130.304 Y128.601 I-.059 J1.087 E.07033
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51578
G1 F1200
G1 X129.587 Y127.841 E.0066
G1 X129.413 Y127.754 E.00751
G1 X129.23 Y127.822 E.00753
G1 X129.156 Y127.938 E.00529
G1 X129.183 Y128.123 E.00721
G1 X129.341 Y128.239 E.00758
G1 X129.479 Y128.238 E.00529
G1 X129.614 Y128.1 E.00745
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 49.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.1 E-.02312
G1 X129.479 Y128.238 E-.10085
G1 X129.341 Y128.239 E-.07159
G1 X129.183 Y128.123 E-.10252
G1 X129.156 Y127.938 E-.09758
G1 X129.23 Y127.822 E-.07156
G1 X129.413 Y127.754 E-.10189
G1 X129.587 Y127.841 E-.10158
G1 X129.647 Y128.001 E-.08931
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 247/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L247
M991 S0 P246 ;notify layer change
G17
G3 Z49.6 I-.971 J.734 P1  F30000
G1 X129.959 Y128.414 Z49.6
G1 Z49.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.435 Y127.304 E.00166
G3 X129.992 Y128.364 I-.037 J.696 E.0478
G1 X130.273 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.131 Y128.803 E.00641
G3 X129.374 Y126.911 I-.735 J-.804 E.12922
G1 X129.455 Y126.912 E.00249
G3 X130.304 Y128.601 I-.059 J1.087 E.07034
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515391
G1 F1200
G1 X129.587 Y127.841 E.0066
G1 X129.413 Y127.754 E.00751
G1 X129.229 Y127.822 E.00753
G1 X129.156 Y127.938 E.00529
G1 X129.185 Y128.131 E.00752
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00477
G1 X129.614 Y128.1 E.00747
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 49.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.614 Y128.1 E-.02321
G1 X129.478 Y128.239 E-.10132
G1 X129.355 Y128.235 E-.06468
G1 X129.185 Y128.131 E-.10359
G1 X129.156 Y127.938 E-.10203
G1 X129.229 Y127.822 E-.07175
G1 X129.413 Y127.754 E-.10208
G1 X129.587 Y127.841 E-.10184
G1 X129.647 Y128.001 E-.08951
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 248/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L248
M991 S0 P247 ;notify layer change
G17
G3 Z49.8 I-.971 J.734 P1  F30000
G1 X129.959 Y128.414 Z49.8
G1 Z49.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.435 Y127.304 E.00166
G3 X129.992 Y128.364 I-.037 J.696 E.04781
G1 X130.273 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.131 Y128.803 E.00641
G3 X129.374 Y126.911 I-.735 J-.804 E.12922
G1 X129.455 Y126.912 E.00249
G3 X130.304 Y128.601 I-.059 J1.087 E.07035
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515395
G1 F1200
G1 X129.587 Y127.841 E.0066
G1 X129.413 Y127.754 E.00751
G1 X129.229 Y127.822 E.00753
G1 X129.156 Y127.938 E.00529
G1 X129.185 Y128.131 E.00753
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00477
G1 X129.614 Y128.1 E.00747
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 49.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.1 E-.02321
G1 X129.478 Y128.239 E-.10131
G1 X129.355 Y128.235 E-.06469
G1 X129.185 Y128.131 E-.10358
G1 X129.156 Y127.938 E-.10204
G1 X129.229 Y127.822 E-.07174
G1 X129.413 Y127.754 E-.10205
G1 X129.587 Y127.841 E-.10187
G1 X129.647 Y128.001 E-.08951
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 249/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L249
M991 S0 P248 ;notify layer change
G17
G3 Z50 I-.971 J.734 P1  F30000
G1 X129.959 Y128.414 Z50
G1 Z49.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.435 Y127.304 E.00165
G3 X129.992 Y128.364 I-.037 J.696 E.04781
G1 X130.273 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.131 Y128.803 E.00641
G3 X129.374 Y126.911 I-.735 J-.804 E.12922
G1 X129.454 Y126.912 E.00248
G3 X130.304 Y128.601 I-.059 J1.087 E.07035
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515401
G1 F1200
G1 X129.587 Y127.841 E.0066
G1 X129.413 Y127.754 E.00752
G1 X129.229 Y127.822 E.00752
G1 X129.156 Y127.938 E.00529
G1 X129.185 Y128.131 E.00753
G1 X129.355 Y128.235 E.00764
G1 X129.478 Y128.239 E.00477
G1 X129.614 Y128.1 E.00747
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 50
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.1 E-.02321
G1 X129.478 Y128.239 E-.10131
G1 X129.355 Y128.235 E-.06469
G1 X129.185 Y128.131 E-.10357
G1 X129.156 Y127.938 E-.10204
G1 X129.229 Y127.822 E-.07175
G1 X129.413 Y127.754 E-.102
G1 X129.587 Y127.841 E-.10191
G1 X129.647 Y128.001 E-.08951
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 250/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L250
M991 S0 P249 ;notify layer change
G17
G3 Z50.2 I-.971 J.734 P1  F30000
G1 X129.959 Y128.414 Z50.2
G1 Z50
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.435 Y127.304 E.00165
G3 X129.992 Y128.364 I-.036 J.696 E.04781
G1 X130.273 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.131 Y128.803 E.00641
G3 X129.374 Y126.911 I-.735 J-.804 E.12922
G1 X129.454 Y126.912 E.00248
G3 X130.304 Y128.601 I-.058 J1.087 E.07035
M204 S10000
G1 X129.647 Y128.001 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515791
G1 F1200
G1 X129.587 Y127.841 E.0066
G1 X129.413 Y127.754 E.00752
G1 X129.23 Y127.822 E.00752
G1 X129.156 Y127.938 E.00529
G1 X129.183 Y128.123 E.00721
G1 X129.341 Y128.239 E.00758
G1 X129.479 Y128.238 E.00529
G1 X129.614 Y128.1 E.00745
G1 X129.628 Y128.058 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 50.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.614 Y128.1 E-.02313
G1 X129.479 Y128.238 E-.10084
G1 X129.341 Y128.239 E-.0716
G1 X129.183 Y128.123 E-.10253
G1 X129.156 Y127.938 E-.09756
G1 X129.23 Y127.822 E-.07159
G1 X129.413 Y127.754 E-.10174
G1 X129.587 Y127.841 E-.10172
G1 X129.647 Y128.001 E-.08929
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 251/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L251
M991 S0 P250 ;notify layer change
G17
G3 Z50.4 I-.971 J.734 P1  F30000
G1 X129.959 Y128.414 Z50.4
G1 Z50.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.435 Y127.304 E.00165
G3 X129.992 Y128.364 I-.036 J.696 E.04782
G1 X130.274 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.139 Y128.796 E.00608
G3 X129.374 Y126.911 I-.743 J-.796 E.12957
G1 X129.454 Y126.912 E.00248
G3 X130.304 Y128.601 I-.058 J1.088 E.07036
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515984
G1 F1200
G1 X129.587 Y127.841 E.00663
G1 X129.412 Y127.754 E.00752
G1 X129.23 Y127.822 E.00752
G1 X129.156 Y127.938 E.00529
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.509 Y128.208 E.00653
G1 X129.62 Y128.092 E.00618
G1 X129.63 Y128.06 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 50.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01747
G1 X129.509 Y128.208 E-.08388
G1 X129.344 Y128.245 E-.08866
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.1021
G1 X129.23 Y127.822 E-.07179
G1 X129.412 Y127.754 E-.10199
G1 X129.587 Y127.841 E-.10205
G1 X129.647 Y128.002 E-.08996
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 252/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L252
M991 S0 P251 ;notify layer change
G17
G3 Z50.6 I-.97 J.735 P1  F30000
G1 X129.959 Y128.414 Z50.6
G1 Z50.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.435 Y127.304 E.00164
G3 X129.992 Y128.364 I-.036 J.696 E.04782
G1 X130.274 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.139 Y128.796 E.00609
G3 X129.374 Y126.911 I-.743 J-.796 E.12957
G1 X129.454 Y126.912 E.00247
G3 X130.304 Y128.601 I-.058 J1.088 E.07036
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515988
G1 F1200
G1 X129.587 Y127.841 E.00663
G1 X129.412 Y127.754 E.00752
G1 X129.23 Y127.822 E.00751
G1 X129.156 Y127.938 E.00529
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.509 Y128.208 E.00654
G1 X129.62 Y128.092 E.00618
G1 X129.63 Y128.06 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 50.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01749
G1 X129.509 Y128.208 E-.08384
G1 X129.344 Y128.245 E-.08868
G1 X129.186 Y128.131 E-.10209
G1 X129.156 Y127.938 E-.1021
G1 X129.23 Y127.822 E-.0718
G1 X129.412 Y127.754 E-.10195
G1 X129.587 Y127.841 E-.10208
G1 X129.647 Y128.002 E-.08996
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 253/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L253
M991 S0 P252 ;notify layer change
G17
G3 Z50.8 I-.97 J.735 P1  F30000
G1 X129.959 Y128.414 Z50.8
G1 Z50.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09377
G1 X129.435 Y127.304 E.00164
G3 X129.992 Y128.364 I-.036 J.696 E.04783
G1 X130.274 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.139 Y128.796 E.00609
G3 X129.374 Y126.911 I-.743 J-.796 E.12958
G1 X129.454 Y126.912 E.00247
G3 X130.304 Y128.601 I-.058 J1.088 E.07036
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515983
G1 F1200
G1 X129.587 Y127.841 E.00663
G1 X129.412 Y127.754 E.00753
G1 X129.23 Y127.822 E.00751
G1 X129.156 Y127.938 E.00529
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.51 Y128.208 E.00654
G1 X129.62 Y128.092 E.00618
G1 X129.63 Y128.06 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 50.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01748
G1 X129.51 Y128.208 E-.08378
M73 P67 R4
G1 X129.344 Y128.245 E-.08873
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.23 Y127.822 E-.0718
G1 X129.412 Y127.754 E-.10192
G1 X129.587 Y127.841 E-.10212
G1 X129.647 Y128.002 E-.08997
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 254/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L254
M991 S0 P253 ;notify layer change
G17
G3 Z51 I-.97 J.735 P1  F30000
G1 X129.959 Y128.414 Z51
G1 Z50.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.434 Y127.304 E.00163
G3 X129.992 Y128.364 I-.036 J.696 E.04783
G1 X130.274 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.139 Y128.796 E.00609
G3 X129.374 Y126.911 I-.743 J-.796 E.12958
G1 X129.454 Y126.912 E.00246
G3 X130.304 Y128.601 I-.058 J1.088 E.07036
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515985
G1 F1200
G1 X129.587 Y127.841 E.00663
G1 X129.412 Y127.754 E.00753
G1 X129.23 Y127.822 E.00751
G1 X129.156 Y127.938 E.00529
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.51 Y128.208 E.00654
G1 X129.62 Y128.092 E.00617
G1 X129.63 Y128.06 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 51
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01749
G1 X129.51 Y128.208 E-.08373
G1 X129.344 Y128.245 E-.08876
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.1021
G1 X129.23 Y127.822 E-.07181
G1 X129.412 Y127.754 E-.10188
G1 X129.587 Y127.841 E-.10216
G1 X129.647 Y128.002 E-.08997
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 255/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L255
M991 S0 P254 ;notify layer change
G17
G3 Z51.2 I-.97 J.735 P1  F30000
G1 X129.959 Y128.414 Z51.2
G1 Z51
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.434 Y127.304 E.00163
G3 X129.992 Y128.364 I-.036 J.696 E.04784
G1 X130.274 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.139 Y128.795 E.0061
G3 X129.374 Y126.911 I-.743 J-.796 E.12959
G1 X129.454 Y126.912 E.00246
G3 X130.304 Y128.601 I-.058 J1.088 E.07036
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515982
G1 F1200
G1 X129.587 Y127.841 E.00663
G1 X129.412 Y127.754 E.00753
G1 X129.23 Y127.822 E.00751
G1 X129.156 Y127.938 E.00529
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.51 Y128.207 E.00655
G1 X129.62 Y128.092 E.00617
G1 X129.63 Y128.06 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 51.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.0175
G1 X129.51 Y128.207 E-.08366
G1 X129.344 Y128.245 E-.08882
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.23 Y127.822 E-.07182
G1 X129.412 Y127.754 E-.10185
G1 X129.587 Y127.841 E-.10218
G1 X129.647 Y128.002 E-.08999
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 256/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L256
M991 S0 P255 ;notify layer change
G17
G3 Z51.4 I-.97 J.735 P1  F30000
G1 X129.959 Y128.414 Z51.4
G1 Z51.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.434 Y127.304 E.00163
G3 X129.992 Y128.364 I-.036 J.696 E.04784
G1 X130.275 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.139 Y128.795 E.00611
G3 X129.374 Y126.911 I-.743 J-.796 E.12959
G1 X129.454 Y126.912 E.00246
G3 X130.304 Y128.601 I-.058 J1.088 E.07036
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515984
G1 F1200
G1 X129.587 Y127.841 E.00663
G1 X129.412 Y127.754 E.00754
G1 X129.23 Y127.822 E.0075
G1 X129.156 Y127.938 E.00529
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.51 Y128.207 E.00655
G1 X129.62 Y128.092 E.00616
G1 X129.63 Y128.06 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 51.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.0175
G1 X129.51 Y128.207 E-.08362
G1 X129.344 Y128.245 E-.08885
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.1021
G1 X129.23 Y127.822 E-.07182
G1 X129.412 Y127.754 E-.1018
G1 X129.587 Y127.841 E-.10222
G1 X129.647 Y128.002 E-.08998
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 257/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L257
M991 S0 P256 ;notify layer change
G17
G3 Z51.6 I-.97 J.735 P1  F30000
G1 X129.959 Y128.414 Z51.6
G1 Z51.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.434 Y127.304 E.00162
G3 X129.992 Y128.364 I-.036 J.696 E.04784
G1 X130.272 Y128.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13574
G1 X129.454 Y126.912 E.00245
G3 X130.306 Y128.597 I-.058 J1.088 E.07023
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515983
G1 F1200
G1 X129.587 Y127.841 E.00663
G1 X129.412 Y127.754 E.00754
G1 X129.23 Y127.822 E.0075
G1 X129.156 Y127.938 E.00529
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.51 Y128.207 E.00655
G1 X129.62 Y128.092 E.00616
G1 X129.63 Y128.06 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 51.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01753
G1 X129.51 Y128.207 E-.08355
G1 X129.344 Y128.245 E-.08889
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.23 Y127.822 E-.07182
G1 X129.412 Y127.754 E-.10177
G1 X129.587 Y127.841 E-.10226
G1 X129.647 Y128.002 E-.08998
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 258/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L258
M991 S0 P257 ;notify layer change
G17
G3 Z51.8 I-.97 J.735 P1  F30000
G1 X129.959 Y128.414 Z51.8
G1 Z51.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.434 Y127.304 E.00162
G3 X129.992 Y128.364 I-.036 J.696 E.04785
G1 X130.272 Y128.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13574
G1 X129.453 Y126.912 E.00245
G3 X130.306 Y128.597 I-.058 J1.088 E.07023
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515979
G1 F1200
G1 X129.587 Y127.841 E.00663
G1 X129.412 Y127.754 E.00754
G1 X129.23 Y127.822 E.0075
G1 X129.156 Y127.938 E.00529
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.51 Y128.207 E.00656
G1 X129.62 Y128.092 E.00615
G1 X129.63 Y128.06 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 51.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01753
G1 X129.51 Y128.207 E-.08349
G1 X129.344 Y128.245 E-.08894
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.1021
G1 X129.23 Y127.822 E-.07183
G1 X129.412 Y127.754 E-.10174
G1 X129.587 Y127.841 E-.10229
G1 X129.647 Y128.002 E-.08999
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 259/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L259
M991 S0 P258 ;notify layer change
G17
G3 Z52 I-.97 J.735 P1  F30000
G1 X129.959 Y128.414 Z52
G1 Z51.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.434 Y127.304 E.00161
G3 X129.992 Y128.364 I-.036 J.696 E.04785
G1 X130.272 Y128.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13574
G1 X129.453 Y126.912 E.00244
G3 X130.306 Y128.597 I-.057 J1.088 E.07024
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515981
G1 F1200
G1 X129.587 Y127.841 E.00663
G1 X129.412 Y127.754 E.00754
G1 X129.23 Y127.822 E.0075
G1 X129.156 Y127.938 E.0053
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.51 Y128.207 E.00656
G1 X129.62 Y128.092 E.00615
G1 X129.63 Y128.06 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 52
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01754
G1 X129.51 Y128.207 E-.08344
G1 X129.344 Y128.245 E-.08897
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.1021
G1 X129.23 Y127.822 E-.07184
G1 X129.412 Y127.754 E-.1017
G1 X129.587 Y127.841 E-.10232
G1 X129.647 Y128.002 E-.09
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 260/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L260
M991 S0 P259 ;notify layer change
G17
G3 Z52.2 I-.97 J.735 P1  F30000
G1 X129.958 Y128.414 Z52.2
G1 Z52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.434 Y127.304 E.00161
G3 X129.992 Y128.364 I-.036 J.696 E.04785
G1 X130.272 Y128.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13574
G1 X129.453 Y126.912 E.00244
G3 X130.306 Y128.597 I-.057 J1.088 E.07024
M204 S10000
G1 X129.648 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513942
G1 F1200
G1 X129.617 Y127.872 E.00515
G1 X129.448 Y127.765 E.00767
G1 X129.326 Y127.762 E.00469
G1 X129.172 Y127.902 E.00798
G1 X129.15 Y128.038 E.00527
G1 X129.253 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.572 Y128.177 E.00604
G1 X129.624 Y128.057 E.00499
; CHANGE_LAYER
; Z_HEIGHT: 52.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.572 Y128.177 E-.06719
G1 X129.432 Y128.249 E-.0814
G1 X129.253 Y128.205 E-.09542
G1 X129.15 Y128.038 E-.10151
G1 X129.172 Y127.902 E-.07103
G1 X129.326 Y127.762 E-.10749
G1 X129.448 Y127.765 E-.06322
G1 X129.617 Y127.872 E-.10334
G1 X129.648 Y128.002 E-.0694
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 261/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L261
M991 S0 P260 ;notify layer change
G17
G3 Z52.4 I-.971 J.734 P1  F30000
G1 X129.958 Y128.414 Z52.4
G1 Z52.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.434 Y127.304 E.00161
G3 X129.992 Y128.364 I-.035 J.696 E.04786
G1 X130.272 Y128.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13574
G1 X129.453 Y126.912 E.00244
G3 X130.306 Y128.597 I-.057 J1.088 E.07024
M204 S10000
G1 X129.648 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513933
G1 F1200
G1 X129.617 Y127.872 E.00515
G1 X129.448 Y127.764 E.00767
G1 X129.326 Y127.762 E.00469
G1 X129.172 Y127.902 E.00798
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.572 Y128.177 E.00605
G1 X129.624 Y128.057 E.00499
; CHANGE_LAYER
; Z_HEIGHT: 52.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.572 Y128.177 E-.06716
G1 X129.432 Y128.249 E-.08144
G1 X129.252 Y128.205 E-.09541
G1 X129.15 Y128.038 E-.1015
G1 X129.172 Y127.902 E-.07104
G1 X129.326 Y127.762 E-.1075
G1 X129.448 Y127.764 E-.06316
G1 X129.617 Y127.872 E-.10339
G1 X129.648 Y128.002 E-.06941
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 262/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L262
M991 S0 P261 ;notify layer change
G17
G3 Z52.6 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z52.6
G1 Z52.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.434 Y127.304 E.0016
G3 X129.992 Y128.364 I-.035 J.696 E.04786
G1 X130.272 Y128.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13574
G1 X129.453 Y126.912 E.00243
G3 X130.306 Y128.597 I-.057 J1.088 E.07025
M204 S10000
G1 X129.648 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51393
G1 F1200
G1 X129.617 Y127.872 E.00515
G1 X129.448 Y127.764 E.00768
G1 X129.326 Y127.762 E.00469
G1 X129.172 Y127.902 E.00798
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.572 Y128.176 E.00605
G1 X129.624 Y128.057 E.00498
; CHANGE_LAYER
; Z_HEIGHT: 52.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.572 Y128.176 E-.06712
G1 X129.432 Y128.249 E-.08147
G1 X129.252 Y128.205 E-.09542
G1 X129.15 Y128.038 E-.10151
G1 X129.172 Y127.902 E-.07103
G1 X129.326 Y127.762 E-.1075
G1 X129.448 Y127.764 E-.06312
G1 X129.617 Y127.872 E-.10342
G1 X129.648 Y128.002 E-.06942
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 263/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L263
M991 S0 P262 ;notify layer change
G17
G3 Z52.8 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z52.8
G1 Z52.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.433 Y127.304 E.0016
G3 X129.992 Y128.364 I-.035 J.696 E.04787
G1 X130.272 Y128.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13574
G1 X129.453 Y126.912 E.00243
G3 X130.306 Y128.597 I-.057 J1.088 E.07025
M204 S10000
G1 X129.648 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51392
G1 F1200
G1 X129.617 Y127.872 E.00515
G1 X129.448 Y127.764 E.00768
G1 X129.326 Y127.762 E.00468
G1 X129.172 Y127.902 E.00798
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00754
G1 X129.432 Y128.249 E.00708
G1 X129.572 Y128.176 E.00605
G1 X129.624 Y128.057 E.00498
; CHANGE_LAYER
; Z_HEIGHT: 52.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.572 Y128.176 E-.06708
G1 X129.432 Y128.249 E-.08152
G1 X129.252 Y128.205 E-.0954
M73 P68 R4
G1 X129.15 Y128.038 E-.10151
G1 X129.172 Y127.902 E-.07102
G1 X129.326 Y127.762 E-.10752
G1 X129.448 Y127.764 E-.06303
G1 X129.617 Y127.872 E-.10347
G1 X129.648 Y128.002 E-.06943
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 264/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L264
M991 S0 P263 ;notify layer change
G17
G3 Z53 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z53
G1 Z52.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.433 Y127.304 E.00159
G3 X129.992 Y128.364 I-.035 J.696 E.04787
G1 X130.272 Y128.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13574
G1 X129.453 Y126.912 E.00243
G3 X130.306 Y128.597 I-.057 J1.088 E.07026
M204 S10000
G1 X129.648 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513913
G1 F1200
G1 X129.617 Y127.872 E.00516
G1 X129.448 Y127.764 E.00768
G1 X129.326 Y127.762 E.00468
G1 X129.172 Y127.902 E.00798
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.572 Y128.176 E.00605
G1 X129.624 Y128.057 E.00498
; CHANGE_LAYER
; Z_HEIGHT: 53
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.572 Y128.176 E-.06704
G1 X129.432 Y128.249 E-.08156
G1 X129.252 Y128.205 E-.0954
G1 X129.15 Y128.038 E-.1015
G1 X129.172 Y127.902 E-.07103
G1 X129.326 Y127.762 E-.10752
G1 X129.448 Y127.764 E-.06299
G1 X129.617 Y127.872 E-.1035
G1 X129.648 Y128.002 E-.06946
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 265/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L265
M991 S0 P264 ;notify layer change
G17
G3 Z53.2 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z53.2
G1 Z53
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.433 Y127.304 E.00159
G3 X129.992 Y128.364 I-.035 J.696 E.04787
G1 X130.276 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.646 E.00014
G3 X129.374 Y126.911 I-.876 J-.647 E.13574
G1 X129.453 Y126.912 E.00242
G3 X130.381 Y128.464 I-.057 J1.088 E.06556
G1 X130.306 Y128.595 E.00466
M204 S10000
G1 X129.648 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513901
G1 F1200
G1 X129.617 Y127.872 E.00516
G1 X129.448 Y127.764 E.00769
G1 X129.326 Y127.762 E.00467
G1 X129.172 Y127.902 E.00798
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.572 Y128.176 E.00606
G1 X129.624 Y128.057 E.00497
; CHANGE_LAYER
; Z_HEIGHT: 53.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.572 Y128.176 E-.06698
G1 X129.432 Y128.249 E-.08162
G1 X129.252 Y128.205 E-.09539
G1 X129.15 Y128.038 E-.1015
G1 X129.172 Y127.902 E-.07103
G1 X129.326 Y127.762 E-.10753
G1 X129.448 Y127.764 E-.06293
G1 X129.617 Y127.872 E-.10355
G1 X129.648 Y128.002 E-.06946
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 266/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L266
M991 S0 P265 ;notify layer change
G17
G3 Z53.4 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z53.4
G1 Z53.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.433 Y127.304 E.00159
G3 X129.992 Y128.364 I-.035 J.696 E.04788
G1 X130.276 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.646 E.00014
G3 X129.374 Y126.911 I-.876 J-.647 E.13573
G1 X129.452 Y126.912 E.00242
G3 X130.381 Y128.464 I-.057 J1.088 E.06557
G1 X130.306 Y128.595 E.00465
M204 S10000
G1 X129.648 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513896
G1 F1200
G1 X129.617 Y127.872 E.00516
G1 X129.448 Y127.764 E.00769
G1 X129.326 Y127.762 E.00467
G1 X129.172 Y127.902 E.00798
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.572 Y128.176 E.00606
G1 X129.624 Y128.057 E.00497
; CHANGE_LAYER
; Z_HEIGHT: 53.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.572 Y128.176 E-.06695
G1 X129.432 Y128.249 E-.08165
G1 X129.252 Y128.205 E-.09539
G1 X129.15 Y128.038 E-.1015
G1 X129.172 Y127.902 E-.07103
G1 X129.326 Y127.762 E-.10753
G1 X129.448 Y127.764 E-.06287
G1 X129.617 Y127.872 E-.10359
G1 X129.648 Y128.002 E-.06947
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 267/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L267
M991 S0 P266 ;notify layer change
G17
G3 Z53.6 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z53.6
G1 Z53.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.433 Y127.304 E.00158
G3 X129.992 Y128.364 I-.035 J.696 E.04788
G1 X130.276 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.646 E.00014
G3 X129.374 Y126.911 I-.876 J-.647 E.13573
G1 X129.452 Y126.912 E.00241
G3 X130.381 Y128.464 I-.057 J1.088 E.06557
G1 X130.306 Y128.595 E.00465
M204 S10000
G1 X129.648 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513889
G1 F1200
G1 X129.617 Y127.872 E.00516
G1 X129.448 Y127.764 E.00769
G1 X129.326 Y127.762 E.00466
G1 X129.172 Y127.902 E.00798
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.572 Y128.176 E.00606
G1 X129.624 Y128.057 E.00497
; CHANGE_LAYER
; Z_HEIGHT: 53.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.572 Y128.176 E-.06692
G1 X129.432 Y128.249 E-.08168
G1 X129.252 Y128.205 E-.09538
G1 X129.15 Y128.038 E-.1015
G1 X129.172 Y127.902 E-.07104
G1 X129.326 Y127.762 E-.10754
G1 X129.448 Y127.764 E-.0628
G1 X129.617 Y127.872 E-.10364
G1 X129.648 Y128.002 E-.0695
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 268/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L268
M991 S0 P267 ;notify layer change
G17
G3 Z53.8 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z53.8
G1 Z53.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.433 Y127.304 E.00158
G3 X129.992 Y128.364 I-.035 J.696 E.04788
G1 X130.276 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.647 E.00014
G3 X129.374 Y126.911 I-.876 J-.647 E.13573
G1 X129.452 Y126.912 E.00241
G3 X130.381 Y128.464 I-.056 J1.088 E.06558
G1 X130.306 Y128.595 E.00465
M204 S10000
G1 X129.648 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513879
G1 F1200
G1 X129.617 Y127.872 E.00516
G1 X129.447 Y127.764 E.0077
G1 X129.326 Y127.762 E.00466
G1 X129.172 Y127.902 E.00798
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.572 Y128.176 E.00607
G1 X129.624 Y128.058 E.00496
; CHANGE_LAYER
; Z_HEIGHT: 53.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.572 Y128.176 E-.06687
G1 X129.432 Y128.249 E-.08173
G1 X129.252 Y128.205 E-.09537
G1 X129.15 Y128.038 E-.1015
G1 X129.172 Y127.902 E-.07103
G1 X129.326 Y127.762 E-.10756
G1 X129.447 Y127.764 E-.06274
G1 X129.617 Y127.872 E-.1037
G1 X129.648 Y128.002 E-.0695
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 269/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L269
M991 S0 P268 ;notify layer change
G17
G3 Z54 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z54
G1 Z53.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.433 Y127.304 E.00157
G3 X129.992 Y128.364 I-.035 J.696 E.04789
G1 X130.276 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.647 E.00014
G3 X129.374 Y126.911 I-.876 J-.647 E.13573
G1 X129.452 Y126.912 E.00241
G3 X130.381 Y128.464 I-.056 J1.088 E.06558
G1 X130.306 Y128.595 E.00465
M204 S10000
G1 X129.648 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513872
G1 F1200
G1 X129.617 Y127.872 E.00516
G1 X129.447 Y127.764 E.0077
G1 X129.326 Y127.762 E.00465
G1 X129.172 Y127.902 E.00798
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.572 Y128.176 E.00607
G1 X129.624 Y128.058 E.00496
; CHANGE_LAYER
; Z_HEIGHT: 54
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.572 Y128.176 E-.06684
G1 X129.432 Y128.249 E-.08176
G1 X129.252 Y128.205 E-.09536
G1 X129.15 Y128.038 E-.10151
G1 X129.172 Y127.902 E-.07103
G1 X129.326 Y127.762 E-.10757
G1 X129.447 Y127.764 E-.06268
G1 X129.617 Y127.872 E-.10373
G1 X129.648 Y128.002 E-.06952
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 270/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L270
M991 S0 P269 ;notify layer change
G17
G3 Z54.2 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z54.2
G1 Z54
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.414 E.09378
G1 X129.433 Y127.304 E.00157
G3 X129.992 Y128.364 I-.035 J.696 E.04789
G1 X130.276 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.647 E.00014
G3 X129.374 Y126.911 I-.876 J-.647 E.13573
G1 X129.452 Y126.912 E.0024
G3 X130.381 Y128.464 I-.056 J1.088 E.06559
G1 X130.306 Y128.595 E.00465
M204 S10000
G1 X129.648 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513863
G1 F1200
G1 X129.617 Y127.872 E.00516
G1 X129.447 Y127.764 E.0077
G1 X129.326 Y127.762 E.00465
G1 X129.172 Y127.902 E.00798
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.572 Y128.176 E.00607
G1 X129.624 Y128.058 E.00496
; CHANGE_LAYER
; Z_HEIGHT: 54.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.572 Y128.176 E-.06679
G1 X129.432 Y128.249 E-.08181
G1 X129.252 Y128.205 E-.09536
G1 X129.15 Y128.038 E-.10151
G1 X129.172 Y127.902 E-.07103
G1 X129.326 Y127.762 E-.10757
G1 X129.447 Y127.764 E-.06262
G1 X129.617 Y127.872 E-.10377
G1 X129.648 Y128.002 E-.06954
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 271/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L271
M991 S0 P270 ;notify layer change
G17
G3 Z54.4 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z54.4
G1 Z54.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.415 E.09378
G1 X129.433 Y127.304 E.00157
G3 X129.992 Y128.364 I-.035 J.696 E.0479
G1 X130.276 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.647 E.00014
G3 X129.374 Y126.911 I-.876 J-.647 E.13573
G1 X129.452 Y126.912 E.0024
G3 X130.381 Y128.464 I-.056 J1.088 E.06559
G1 X130.306 Y128.596 E.00466
M204 S10000
G1 X129.648 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513857
G1 F1200
G1 X129.617 Y127.872 E.00516
G1 X129.447 Y127.764 E.00771
G1 X129.326 Y127.762 E.00464
G1 X129.172 Y127.902 E.00799
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.572 Y128.176 E.00608
G1 X129.624 Y128.058 E.00495
; CHANGE_LAYER
; Z_HEIGHT: 54.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.572 Y128.176 E-.06675
G1 X129.432 Y128.249 E-.08185
G1 X129.252 Y128.205 E-.09535
G1 X129.15 Y128.038 E-.10151
G1 X129.172 Y127.902 E-.07103
G1 X129.326 Y127.762 E-.10758
G1 X129.447 Y127.764 E-.06255
G1 X129.617 Y127.872 E-.10382
G1 X129.648 Y128.002 E-.06954
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 272/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L272
M991 S0 P271 ;notify layer change
G17
G3 Z54.6 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z54.6
G1 Z54.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.415 E.09378
G1 X129.433 Y127.304 E.00156
G3 X129.992 Y128.364 I-.034 J.696 E.0479
G1 X130.276 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.647 E.00014
G3 X129.374 Y126.911 I-.876 J-.647 E.13573
G1 X129.452 Y126.912 E.00239
G3 X130.381 Y128.464 I-.056 J1.088 E.06559
G1 X130.306 Y128.596 E.00466
M204 S10000
G1 X129.648 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513849
G1 F1200
G1 X129.617 Y127.872 E.00516
G1 X129.447 Y127.764 E.00771
G1 X129.326 Y127.762 E.00464
G1 X129.172 Y127.902 E.00799
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.573 Y128.176 E.00608
G1 X129.624 Y128.058 E.00495
; CHANGE_LAYER
; Z_HEIGHT: 54.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.573 Y128.176 E-.06671
G1 X129.432 Y128.249 E-.0819
G1 X129.252 Y128.205 E-.09535
G1 X129.15 Y128.038 E-.1015
G1 X129.172 Y127.902 E-.07103
G1 X129.326 Y127.762 E-.10758
G1 X129.447 Y127.764 E-.06251
G1 X129.617 Y127.872 E-.10386
G1 X129.648 Y128.003 E-.06955
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 273/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L273
M991 S0 P272 ;notify layer change
G17
G3 Z54.8 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z54.8
G1 Z54.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.415 E.09378
G1 X129.432 Y127.304 E.00156
G3 X129.992 Y128.364 I-.034 J.696 E.0479
G1 X130.276 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.647 E.00014
G3 X129.374 Y126.911 I-.876 J-.647 E.13573
G1 X129.452 Y126.912 E.00239
G3 X130.381 Y128.464 I-.056 J1.088 E.0656
G1 X130.306 Y128.596 E.00466
M204 S10000
G1 X129.648 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51384
G1 F1200
G1 X129.617 Y127.872 E.00516
G1 X129.447 Y127.764 E.00771
G1 X129.326 Y127.762 E.00464
G1 X129.172 Y127.902 E.00799
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
M73 P69 R4
G1 X129.432 Y128.249 E.00708
G1 X129.573 Y128.176 E.00608
G1 X129.624 Y128.058 E.00495
; CHANGE_LAYER
; Z_HEIGHT: 54.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.573 Y128.176 E-.06666
G1 X129.432 Y128.249 E-.08194
G1 X129.252 Y128.205 E-.09534
G1 X129.15 Y128.038 E-.10151
G1 X129.172 Y127.902 E-.07102
G1 X129.326 Y127.762 E-.1076
G1 X129.447 Y127.764 E-.06245
G1 X129.617 Y127.872 E-.10389
G1 X129.648 Y128.003 E-.06958
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 274/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L274
M991 S0 P273 ;notify layer change
G17
G3 Z55 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z55
G1 Z54.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.415 E.09378
G1 X129.432 Y127.304 E.00156
G3 X129.992 Y128.364 I-.034 J.696 E.04791
G1 X130.272 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13573
G1 X129.451 Y126.912 E.00239
G3 X130.306 Y128.597 I-.056 J1.088 E.07031
M204 S10000
G1 X129.648 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513833
G1 F1200
G1 X129.617 Y127.871 E.00517
G1 X129.447 Y127.764 E.00772
G1 X129.326 Y127.762 E.00463
G1 X129.172 Y127.902 E.00799
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.573 Y128.176 E.00609
G1 X129.624 Y128.058 E.00495
; CHANGE_LAYER
; Z_HEIGHT: 55
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.573 Y128.176 E-.06663
G1 X129.432 Y128.249 E-.08198
G1 X129.252 Y128.205 E-.09534
G1 X129.15 Y128.038 E-.1015
G1 X129.172 Y127.902 E-.07103
G1 X129.326 Y127.762 E-.1076
G1 X129.447 Y127.764 E-.06239
G1 X129.617 Y127.871 E-.10394
G1 X129.648 Y128.003 E-.06959
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 275/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L275
M991 S0 P274 ;notify layer change
G17
G3 Z55.2 I-.972 J.733 P1  F30000
G1 X129.958 Y128.414 Z55.2
G1 Z55
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.415 E.09378
G1 X129.432 Y127.304 E.00155
G3 X129.992 Y128.364 I-.034 J.696 E.04791
G1 X130.272 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13573
G1 X129.451 Y126.912 E.00238
G3 X130.306 Y128.598 I-.056 J1.088 E.07031
M204 S10000
G1 X129.648 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.513826
G1 F1200
G1 X129.617 Y127.871 E.00517
G1 X129.447 Y127.764 E.00772
G1 X129.326 Y127.762 E.00463
G1 X129.172 Y127.902 E.00799
G1 X129.15 Y128.038 E.00527
G1 X129.252 Y128.205 E.00753
G1 X129.432 Y128.249 E.00708
G1 X129.573 Y128.176 E.00609
G1 X129.624 Y128.058 E.00494
; CHANGE_LAYER
; Z_HEIGHT: 55.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.573 Y128.176 E-.06658
G1 X129.432 Y128.249 E-.08202
G1 X129.252 Y128.205 E-.09533
G1 X129.15 Y128.038 E-.10151
G1 X129.172 Y127.902 E-.07103
G1 X129.326 Y127.762 E-.10761
G1 X129.447 Y127.764 E-.06232
G1 X129.617 Y127.871 E-.10399
G1 X129.648 Y128.003 E-.06961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 276/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L276
M991 S0 P275 ;notify layer change
G17
G3 Z55.4 I-.972 J.733 P1  F30000
G1 X129.958 Y128.414 Z55.4
G1 Z55.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.415 E.09378
G1 X129.432 Y127.304 E.00155
G3 X129.992 Y128.364 I-.034 J.696 E.04792
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13572
G1 X129.451 Y126.912 E.00238
G3 X130.306 Y128.598 I-.056 J1.088 E.07032
M204 S10000
G1 X129.647 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515201
G1 F1200
G1 X129.587 Y127.84 E.00667
G1 X129.418 Y127.755 E.00728
G1 X129.229 Y127.822 E.00776
G1 X129.156 Y127.938 E.00525
G1 X129.185 Y128.131 E.00752
G1 X129.344 Y128.245 E.00753
G1 X129.511 Y128.207 E.0066
G1 X129.621 Y128.093 E.00609
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 55.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.621 Y128.093 E-.01771
G1 X129.511 Y128.207 E-.08264
G1 X129.344 Y128.245 E-.08959
G1 X129.185 Y128.131 E-.10213
G1 X129.156 Y127.938 E-.10212
G1 X129.229 Y127.822 E-.07127
G1 X129.418 Y127.755 E-.10532
G1 X129.587 Y127.84 E-.09875
G1 X129.647 Y128.003 E-.09048
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 277/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L277
M991 S0 P276 ;notify layer change
G17
G3 Z55.6 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z55.6
G1 Z55.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.415 E.09378
G1 X129.432 Y127.304 E.00155
G3 X129.992 Y128.364 I-.034 J.696 E.04792
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13572
G1 X129.451 Y126.912 E.00238
G3 X130.306 Y128.598 I-.055 J1.088 E.07032
M204 S10000
G1 X129.647 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515199
G1 F1200
G1 X129.616 Y127.872 E.00517
G1 X129.483 Y127.777 E.00629
G1 X129.313 Y127.779 E.00655
G1 X129.199 Y127.848 E.0051
G1 X129.151 Y128.038 E.00753
G1 X129.253 Y128.204 E.00753
G1 X129.431 Y128.248 E.00706
G1 X129.573 Y128.175 E.0061
G1 X129.623 Y128.058 E.00494
; CHANGE_LAYER
; Z_HEIGHT: 55.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.573 Y128.175 E-.0667
G1 X129.431 Y128.248 E-.08236
G1 X129.253 Y128.204 E-.0954
G1 X129.151 Y128.038 E-.10164
G1 X129.199 Y127.848 E-.10164
G1 X129.313 Y127.779 E-.06891
G1 X129.483 Y127.777 E-.0885
G1 X129.616 Y127.872 E-.085
G1 X129.647 Y128.003 E-.06987
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 278/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L278
M991 S0 P277 ;notify layer change
G17
G3 Z55.8 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z55.8
G1 Z55.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.385 Y127.303 I-.56 J-.415 E.09378
G1 X129.432 Y127.304 E.00154
G3 X129.992 Y128.364 I-.034 J.696 E.04792
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13572
G1 X129.451 Y126.912 E.00237
G3 X130.306 Y128.598 I-.055 J1.088 E.07033
M204 S10000
G1 X129.647 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515198
G1 F1200
G1 X129.587 Y127.84 E.00667
G1 X129.418 Y127.755 E.00728
G1 X129.229 Y127.822 E.00776
G1 X129.156 Y127.938 E.00525
G1 X129.185 Y128.131 E.00753
G1 X129.344 Y128.245 E.00752
G1 X129.511 Y128.207 E.00661
G1 X129.621 Y128.093 E.00608
G1 X129.63 Y128.06 E.00131
; CHANGE_LAYER
; Z_HEIGHT: 55.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.621 Y128.093 E-.01772
G1 X129.511 Y128.207 E-.08254
G1 X129.344 Y128.245 E-.08966
G1 X129.185 Y128.131 E-.10212
G1 X129.156 Y127.938 E-.10213
G1 X129.229 Y127.822 E-.07126
G1 X129.418 Y127.755 E-.10526
G1 X129.587 Y127.84 E-.09881
G1 X129.647 Y128.003 E-.09049
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 279/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L279
M991 S0 P278 ;notify layer change
G17
G3 Z56 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z56
G1 Z55.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.432 Y127.304 E.00154
G3 X129.992 Y128.364 I-.034 J.696 E.04793
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.647 E.13572
G1 X129.451 Y126.912 E.00237
G3 X130.306 Y128.598 I-.055 J1.088 E.07033
M204 S10000
G1 X129.647 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515199
G1 F1200
G1 X129.587 Y127.84 E.00667
G1 X129.418 Y127.755 E.00728
G1 X129.229 Y127.822 E.00775
G1 X129.156 Y127.938 E.00525
G1 X129.185 Y128.131 E.00752
G1 X129.344 Y128.245 E.00753
G1 X129.511 Y128.207 E.00661
G1 X129.621 Y128.093 E.00608
G1 X129.63 Y128.06 E.00131
; CHANGE_LAYER
; Z_HEIGHT: 56
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.621 Y128.093 E-.01772
G1 X129.511 Y128.207 E-.0825
G1 X129.344 Y128.245 E-.08968
G1 X129.185 Y128.131 E-.10213
G1 X129.156 Y127.938 E-.10212
G1 X129.229 Y127.822 E-.07128
G1 X129.418 Y127.755 E-.10522
G1 X129.587 Y127.84 E-.09885
G1 X129.647 Y128.003 E-.0905
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 280/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L280
M991 S0 P279 ;notify layer change
G17
G3 Z56.2 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z56.2
G1 Z56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.432 Y127.304 E.00153
G3 X129.992 Y128.364 I-.034 J.696 E.04793
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.648 E.13572
G1 X129.451 Y126.912 E.00236
G3 X130.306 Y128.598 I-.055 J1.088 E.07034
M204 S10000
G1 X129.647 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515195
G1 F1200
G1 X129.587 Y127.84 E.00667
G1 X129.418 Y127.755 E.00729
G1 X129.229 Y127.822 E.00775
G1 X129.156 Y127.938 E.00525
G1 X129.185 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.511 Y128.207 E.00661
G1 X129.621 Y128.093 E.00607
G1 X129.63 Y128.06 E.00131
; CHANGE_LAYER
; Z_HEIGHT: 56.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.621 Y128.093 E-.01773
G1 X129.511 Y128.207 E-.08244
G1 X129.344 Y128.245 E-.08974
G1 X129.185 Y128.131 E-.10212
G1 X129.156 Y127.938 E-.10213
G1 X129.229 Y127.822 E-.07128
G1 X129.418 Y127.755 E-.10518
G1 X129.587 Y127.84 E-.09888
G1 X129.647 Y128.003 E-.0905
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 281/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L281
M991 S0 P280 ;notify layer change
G17
G3 Z56.4 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z56.4
G1 Z56.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.432 Y127.304 E.00153
G3 X129.992 Y128.364 I-.034 J.696 E.04793
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.648 E.13572
G1 X129.451 Y126.912 E.00236
G3 X130.306 Y128.598 I-.055 J1.088 E.07034
M204 S10000
G1 X129.647 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515198
G1 F1200
G1 X129.587 Y127.84 E.00667
G1 X129.418 Y127.755 E.00729
G1 X129.229 Y127.822 E.00775
G1 X129.156 Y127.938 E.00525
G1 X129.185 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.511 Y128.207 E.00662
G1 X129.621 Y128.093 E.00607
G1 X129.63 Y128.06 E.00131
; CHANGE_LAYER
; Z_HEIGHT: 56.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.621 Y128.093 E-.01774
G1 X129.511 Y128.207 E-.08238
G1 X129.344 Y128.245 E-.08978
G1 X129.185 Y128.131 E-.10213
G1 X129.156 Y127.938 E-.10213
G1 X129.229 Y127.822 E-.07129
G1 X129.418 Y127.755 E-.10514
G1 X129.587 Y127.84 E-.09892
G1 X129.647 Y128.003 E-.09051
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 282/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L282
M991 S0 P281 ;notify layer change
G17
G3 Z56.6 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z56.6
G1 Z56.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.431 Y127.304 E.00152
G3 X129.992 Y128.364 I-.034 J.696 E.04794
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.648 E.13572
G1 X129.451 Y126.912 E.00236
G3 X130.306 Y128.598 I-.055 J1.088 E.07035
M204 S10000
G1 X129.647 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515199
G1 F1200
G1 X129.587 Y127.84 E.00667
G1 X129.418 Y127.755 E.00729
G1 X129.229 Y127.822 E.00774
G1 X129.156 Y127.938 E.00525
G1 X129.185 Y128.131 E.00752
G1 X129.344 Y128.245 E.00753
G1 X129.512 Y128.207 E.00662
G1 X129.621 Y128.093 E.00607
G1 X129.63 Y128.06 E.00131
; CHANGE_LAYER
; Z_HEIGHT: 56.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.621 Y128.093 E-.01773
G1 X129.512 Y128.207 E-.08234
G1 X129.344 Y128.245 E-.08981
G1 X129.185 Y128.131 E-.10213
G1 X129.156 Y127.938 E-.10212
G1 X129.229 Y127.822 E-.07129
G1 X129.418 Y127.755 E-.1051
G1 X129.587 Y127.84 E-.09896
G1 X129.647 Y128.003 E-.09052
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 283/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L283
M991 S0 P282 ;notify layer change
G17
G3 Z56.8 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z56.8
G1 Z56.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.431 Y127.304 E.00152
G3 X129.992 Y128.365 I-.033 J.696 E.04794
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.648 E.13572
G1 X129.45 Y126.912 E.00235
G3 X130.306 Y128.598 I-.055 J1.088 E.07035
M204 S10000
G1 X129.647 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515196
G1 F1200
G1 X129.587 Y127.84 E.00667
G1 X129.418 Y127.755 E.00729
G1 X129.229 Y127.822 E.00774
G1 X129.156 Y127.938 E.00525
G1 X129.185 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.512 Y128.206 E.00662
G1 X129.621 Y128.093 E.00606
M73 P70 R4
G1 X129.63 Y128.06 E.00131
; CHANGE_LAYER
; Z_HEIGHT: 56.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.621 Y128.093 E-.01775
G1 X129.512 Y128.206 E-.08227
G1 X129.344 Y128.245 E-.08985
G1 X129.185 Y128.131 E-.10213
G1 X129.156 Y127.938 E-.10213
G1 X129.229 Y127.822 E-.0713
G1 X129.418 Y127.755 E-.10506
G1 X129.587 Y127.84 E-.099
G1 X129.647 Y128.003 E-.09051
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 284/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L284
M991 S0 P283 ;notify layer change
G17
G3 Z57 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z57
G1 Z56.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.431 Y127.304 E.00152
G3 X129.992 Y128.365 I-.033 J.696 E.04794
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.648 E.13572
G1 X129.45 Y126.912 E.00235
G3 X130.306 Y128.598 I-.055 J1.088 E.07036
M204 S10000
G1 X129.647 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515196
G1 F1200
G1 X129.587 Y127.84 E.00667
G1 X129.418 Y127.755 E.0073
G1 X129.229 Y127.822 E.00774
G1 X129.156 Y127.938 E.00525
G1 X129.185 Y128.131 E.00752
G1 X129.344 Y128.245 E.00753
G1 X129.512 Y128.206 E.00662
G1 X129.621 Y128.093 E.00606
G1 X129.63 Y128.06 E.00131
; CHANGE_LAYER
; Z_HEIGHT: 57
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.621 Y128.093 E-.01777
G1 X129.512 Y128.206 E-.08222
G1 X129.344 Y128.245 E-.08989
G1 X129.185 Y128.131 E-.10213
G1 X129.156 Y127.938 E-.10212
G1 X129.229 Y127.822 E-.07129
G1 X129.418 Y127.755 E-.10503
G1 X129.587 Y127.84 E-.09903
G1 X129.647 Y128.003 E-.09051
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 285/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L285
M991 S0 P284 ;notify layer change
G17
G3 Z57.2 I-.971 J.733 P1  F30000
G1 X129.958 Y128.414 Z57.2
G1 Z57
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.431 Y127.304 E.00151
G3 X129.992 Y128.365 I-.033 J.696 E.04795
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.648 E.13572
G1 X129.45 Y126.912 E.00234
G3 X130.306 Y128.598 I-.054 J1.088 E.07036
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515953
G1 F1200
G1 X129.587 Y127.84 E.00664
G1 X129.418 Y127.755 E.0073
G1 X129.229 Y127.823 E.00774
G1 X129.156 Y127.938 E.00525
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.505 Y128.211 E.00634
G1 X129.62 Y128.091 E.00641
G1 X129.63 Y128.059 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 57.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.091 E-.01749
G1 X129.505 Y128.211 E-.08691
G1 X129.344 Y128.245 E-.086
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.1021
G1 X129.229 Y127.823 E-.07127
G1 X129.418 Y127.755 E-.10497
G1 X129.587 Y127.84 E-.09904
G1 X129.647 Y128.002 E-.09012
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 286/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L286
M991 S0 P285 ;notify layer change
G17
G3 Z57.4 I-.972 J.733 P1  F30000
G1 X129.958 Y128.414 Z57.4
G1 Z57.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.431 Y127.304 E.00151
G3 X129.991 Y128.365 I-.033 J.696 E.04795
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.648 E.13571
G1 X129.45 Y126.912 E.00234
G3 X130.306 Y128.598 I-.054 J1.088 E.07037
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515952
G1 F1200
G1 X129.587 Y127.84 E.00664
G1 X129.418 Y127.755 E.0073
G1 X129.229 Y127.823 E.00773
G1 X129.156 Y127.938 E.00525
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.505 Y128.211 E.00634
G1 X129.62 Y128.091 E.0064
G1 X129.63 Y128.059 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 57.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.091 E-.01751
G1 X129.505 Y128.211 E-.08685
G1 X129.344 Y128.245 E-.08604
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.823 E-.07128
G1 X129.418 Y127.755 E-.10494
G1 X129.587 Y127.84 E-.09908
G1 X129.647 Y128.002 E-.09012
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 287/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L287
M991 S0 P286 ;notify layer change
G17
G3 Z57.6 I-.972 J.733 P1  F30000
G1 X129.958 Y128.414 Z57.6
G1 Z57.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.431 Y127.303 E.0015
G3 X129.991 Y128.365 I-.033 J.696 E.04796
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.876 J-.648 E.13571
G1 X129.45 Y126.912 E.00234
G3 X130.306 Y128.598 I-.054 J1.088 E.07037
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515953
G1 F1200
G1 X129.587 Y127.84 E.00664
G1 X129.418 Y127.755 E.00731
G1 X129.229 Y127.822 E.00773
G1 X129.156 Y127.938 E.00525
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.505 Y128.211 E.00634
G1 X129.62 Y128.091 E.0064
G1 X129.63 Y128.059 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 57.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.62 Y128.091 E-.0175
G1 X129.505 Y128.211 E-.08681
G1 X129.344 Y128.245 E-.08607
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07128
G1 X129.418 Y127.755 E-.10489
G1 X129.587 Y127.84 E-.09911
G1 X129.647 Y128.002 E-.09013
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 288/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L288
M991 S0 P287 ;notify layer change
G17
G3 Z57.8 I-.972 J.733 P1  F30000
G1 X129.958 Y128.414 Z57.8
G1 Z57.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.431 Y127.303 E.0015
G3 X129.991 Y128.365 I-.033 J.696 E.04796
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.13571
G1 X129.45 Y126.912 E.00233
G3 X130.305 Y128.598 I-.054 J1.088 E.07038
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515949
G1 F1200
G1 X129.587 Y127.84 E.00664
G1 X129.418 Y127.755 E.00731
G1 X129.229 Y127.822 E.00773
G1 X129.156 Y127.938 E.00525
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.505 Y128.211 E.00635
G1 X129.62 Y128.092 E.00639
G1 X129.63 Y128.059 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 57.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01752
G1 X129.505 Y128.211 E-.08675
G1 X129.344 Y128.245 E-.08611
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07129
G1 X129.418 Y127.755 E-.10487
G1 X129.587 Y127.84 E-.09914
G1 X129.647 Y128.002 E-.09014
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 289/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L289
M991 S0 P288 ;notify layer change
G17
G3 Z58 I-.972 J.733 P1  F30000
G1 X129.958 Y128.414 Z58
G1 Z57.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.431 Y127.303 E.0015
G3 X129.991 Y128.365 I-.033 J.696 E.04797
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.13571
G1 X129.45 Y126.912 E.00233
G3 X130.305 Y128.598 I-.054 J1.088 E.07038
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515954
G1 F1200
G1 X129.587 Y127.84 E.00664
G1 X129.418 Y127.755 E.00731
G1 X129.229 Y127.822 E.00773
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00752
G1 X129.344 Y128.245 E.00753
G1 X129.505 Y128.211 E.00635
G1 X129.62 Y128.092 E.00639
G1 X129.63 Y128.059 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 58
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01751
G1 X129.505 Y128.211 E-.08674
G1 X129.344 Y128.245 E-.08612
G1 X129.186 Y128.131 E-.10211
G1 X129.156 Y127.938 E-.10208
G1 X129.229 Y127.822 E-.0713
G1 X129.418 Y127.755 E-.10482
G1 X129.587 Y127.84 E-.09918
G1 X129.647 Y128.002 E-.09014
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 290/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L290
M991 S0 P289 ;notify layer change
G17
G3 Z58.2 I-.972 J.733 P1  F30000
G1 X129.958 Y128.414 Z58.2
G1 Z58
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.431 Y127.303 E.00149
G3 X129.991 Y128.365 I-.033 J.696 E.04797
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.13571
G1 X129.45 Y126.912 E.00233
G3 X130.305 Y128.598 I-.054 J1.088 E.07039
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515949
G1 F1200
G1 X129.587 Y127.84 E.00664
G1 X129.418 Y127.755 E.00731
G1 X129.229 Y127.822 E.00772
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.505 Y128.211 E.00635
G1 X129.62 Y128.092 E.00639
G1 X129.63 Y128.059 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 58.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01751
G1 X129.505 Y128.211 E-.08668
G1 X129.344 Y128.245 E-.08617
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.0713
G1 X129.418 Y127.755 E-.10479
G1 X129.587 Y127.84 E-.09921
G1 X129.647 Y128.002 E-.09014
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 291/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L291
M991 S0 P290 ;notify layer change
G17
G3 Z58.4 I-.972 J.732 P1  F30000
G1 X129.958 Y128.414 Z58.4
G1 Z58.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.431 Y127.303 E.00149
G3 X129.991 Y128.365 I-.033 J.696 E.04797
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.13571
G1 X129.449 Y126.912 E.00232
G3 X130.305 Y128.598 I-.054 J1.088 E.07039
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515948
G1 F1200
G1 X129.587 Y127.84 E.00664
G1 X129.417 Y127.755 E.00732
G1 X129.229 Y127.822 E.00772
G1 X129.156 Y127.938 E.00525
G1 X129.186 Y128.131 E.00753
G1 X129.253 Y128.204 E.00384
G1 X129.433 Y128.247 E.00712
G1 X129.568 Y128.18 E.00582
G1 X129.623 Y128.057 E.00519
; CHANGE_LAYER
; Z_HEIGHT: 58.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.568 Y128.18 E-.06993
G1 X129.433 Y128.247 E-.07839
G1 X129.253 Y128.204 E-.09585
G1 X129.186 Y128.131 E-.0517
G1 X129.156 Y127.938 E-.10135
G1 X129.229 Y127.822 E-.07077
G1 X129.417 Y127.755 E-.104
G1 X129.587 Y127.84 E-.09852
G1 X129.647 Y128.002 E-.08949
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 292/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L292
M991 S0 P291 ;notify layer change
G17
G3 Z58.6 I-.972 J.732 P1  F30000
G1 X129.958 Y128.414 Z58.6
G1 Z58.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.43 Y127.303 E.00149
G3 X129.991 Y128.365 I-.033 J.696 E.04798
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.13571
G1 X129.449 Y126.912 E.00232
G3 X130.305 Y128.598 I-.054 J1.088 E.0704
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515948
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.417 Y127.755 E.00732
G1 X129.229 Y127.822 E.00772
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.505 Y128.211 E.00636
G1 X129.62 Y128.092 E.00638
G1 X129.63 Y128.059 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 58.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01754
G1 X129.505 Y128.211 E-.08657
G1 X129.344 Y128.245 E-.08624
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07131
G1 X129.417 Y127.755 E-.10472
G1 X129.587 Y127.84 E-.09928
G1 X129.647 Y128.002 E-.09015
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 293/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L293
M991 S0 P292 ;notify layer change
G17
G3 Z58.8 I-.972 J.732 P1  F30000
G1 X129.958 Y128.414 Z58.8
G1 Z58.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.43 Y127.303 E.00148
G3 X129.991 Y128.365 I-.033 J.696 E.04798
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.13571
G1 X129.449 Y126.912 E.00231
G3 X130.305 Y128.598 I-.054 J1.088 E.0704
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515948
G1 F1200
G1 X129.587 Y127.84 E.00664
G1 X129.417 Y127.755 E.00732
G1 X129.229 Y127.822 E.00772
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.211 E.00636
G1 X129.62 Y128.092 E.00638
M73 P71 R4
G1 X129.63 Y128.059 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 58.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01755
G1 X129.506 Y128.211 E-.08652
G1 X129.344 Y128.245 E-.08628
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07131
G1 X129.417 Y127.755 E-.10468
G1 X129.587 Y127.84 E-.09933
G1 X129.647 Y128.002 E-.09015
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 294/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L294
M991 S0 P293 ;notify layer change
G17
G3 Z59 I-.972 J.732 P1  F30000
G1 X129.958 Y128.414 Z59
G1 Z58.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.43 Y127.303 E.00148
G3 X129.991 Y128.365 I-.032 J.696 E.04799
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.13571
G1 X129.449 Y126.912 E.00231
G3 X130.305 Y128.598 I-.053 J1.088 E.07041
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51595
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.417 Y127.755 E.00732
G1 X129.229 Y127.822 E.00771
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.211 E.00636
G1 X129.62 Y128.092 E.00637
G1 X129.63 Y128.06 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 59
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01755
G1 X129.506 Y128.211 E-.08648
G1 X129.344 Y128.245 E-.08631
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07132
G1 X129.417 Y127.755 E-.10464
G1 X129.587 Y127.84 E-.09936
G1 X129.647 Y128.002 E-.09015
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 295/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L295
M991 S0 P294 ;notify layer change
G17
G3 Z59.2 I-.972 J.732 P1  F30000
G1 X129.958 Y128.414 Z59.2
G1 Z59
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.43 Y127.303 E.00147
G3 X129.991 Y128.365 I-.032 J.696 E.04799
G1 X130.271 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.13571
G1 X129.449 Y126.912 E.00231
G3 X130.305 Y128.598 I-.053 J1.088 E.07041
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515948
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.417 Y127.755 E.00733
G1 X129.229 Y127.822 E.00771
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.211 E.00636
G1 X129.62 Y128.092 E.00637
G1 X129.63 Y128.06 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 59.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01755
G1 X129.506 Y128.211 E-.08644
G1 X129.344 Y128.245 E-.08634
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07132
G1 X129.417 Y127.755 E-.1046
G1 X129.587 Y127.84 E-.0994
G1 X129.647 Y128.002 E-.09015
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 296/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L296
M991 S0 P295 ;notify layer change
G17
G3 Z59.4 I-.972 J.732 P1  F30000
G1 X129.958 Y128.415 Z59.4
G1 Z59.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.43 Y127.303 E.00147
G3 X129.991 Y128.365 I-.032 J.696 E.04799
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.1357
G1 X129.449 Y126.912 E.0023
G3 X130.305 Y128.598 I-.053 J1.088 E.07042
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515948
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.417 Y127.755 E.00733
G1 X129.229 Y127.822 E.00771
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.211 E.00637
G1 X129.62 Y128.092 E.00637
G1 X129.63 Y128.06 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 59.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01757
G1 X129.506 Y128.211 E-.08637
G1 X129.344 Y128.245 E-.08638
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.1021
G1 X129.229 Y127.822 E-.07132
G1 X129.417 Y127.755 E-.10457
G1 X129.587 Y127.84 E-.09943
G1 X129.647 Y128.002 E-.09016
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 297/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L297
M991 S0 P296 ;notify layer change
G17
G3 Z59.6 I-.972 J.732 P1  F30000
G1 X129.958 Y128.415 Z59.6
G1 Z59.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.43 Y127.303 E.00147
G3 X129.991 Y128.365 I-.032 J.696 E.048
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.1357
G1 X129.449 Y126.912 E.0023
G3 X130.305 Y128.598 I-.053 J1.088 E.07042
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515946
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.417 Y127.755 E.00733
G1 X129.229 Y127.822 E.00771
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.211 E.00637
G1 X129.62 Y128.092 E.00636
G1 X129.63 Y128.06 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 59.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01756
G1 X129.506 Y128.211 E-.08634
G1 X129.344 Y128.245 E-.08642
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.1021
G1 X129.229 Y127.822 E-.07132
G1 X129.417 Y127.755 E-.10454
G1 X129.587 Y127.84 E-.09946
G1 X129.647 Y128.002 E-.09017
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 298/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L298
M991 S0 P297 ;notify layer change
G17
G3 Z59.8 I-.972 J.732 P1  F30000
G1 X129.958 Y128.415 Z59.8
G1 Z59.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.43 Y127.303 E.00146
G3 X129.991 Y128.365 I-.032 J.696 E.048
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.1357
G1 X129.449 Y126.912 E.00229
G3 X130.305 Y128.598 I-.053 J1.088 E.07043
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515946
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.417 Y127.755 E.00733
G1 X129.229 Y127.822 E.0077
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.211 E.00637
G1 X129.62 Y128.092 E.00636
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 59.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01757
G1 X129.506 Y128.211 E-.08629
G1 X129.344 Y128.245 E-.08646
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07134
G1 X129.417 Y127.755 E-.10449
G1 X129.587 Y127.84 E-.0995
G1 X129.647 Y128.002 E-.09017
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 299/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L299
M991 S0 P298 ;notify layer change
G17
G3 Z60 I-.972 J.732 P1  F30000
G1 X129.958 Y128.415 Z60
G1 Z59.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.43 Y127.303 E.00146
G3 X129.991 Y128.365 I-.032 J.696 E.04801
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.1357
G1 X129.448 Y126.912 E.00229
G3 X130.305 Y128.598 I-.053 J1.088 E.07043
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515947
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.417 Y127.755 E.00734
G1 X129.229 Y127.822 E.0077
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.211 E.00637
G1 X129.62 Y128.092 E.00636
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 60
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01758
G1 X129.506 Y128.211 E-.08624
G1 X129.344 Y128.245 E-.08648
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.1021
G1 X129.229 Y127.822 E-.07134
G1 X129.417 Y127.755 E-.10446
G1 X129.587 Y127.84 E-.09953
G1 X129.647 Y128.002 E-.09018
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 300/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L300
M991 S0 P299 ;notify layer change
G17
G3 Z60.2 I-.972 J.732 P1  F30000
G1 X129.958 Y128.415 Z60.2
G1 Z60
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.43 Y127.303 E.00145
G3 X129.991 Y128.365 I-.032 J.696 E.04801
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.1357
G1 X129.448 Y126.912 E.00229
G3 X130.305 Y128.598 I-.053 J1.088 E.07044
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515944
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.417 Y127.755 E.00734
G1 X129.229 Y127.822 E.0077
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00752
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.211 E.00638
G1 X129.62 Y128.092 E.00635
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 60.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01759
G1 X129.506 Y128.211 E-.08618
G1 X129.344 Y128.245 E-.08652
G1 X129.186 Y128.131 E-.10211
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07134
G1 X129.417 Y127.755 E-.10443
G1 X129.587 Y127.84 E-.09957
G1 X129.647 Y128.002 E-.09018
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 301/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L301
M991 S0 P300 ;notify layer change
G17
G3 Z60.4 I-.972 J.732 P1  F30000
G1 X129.957 Y128.415 Z60.4
G1 Z60.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.43 Y127.303 E.00145
G3 X129.991 Y128.365 I-.032 J.696 E.04801
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.1357
G1 X129.448 Y126.912 E.00228
G3 X130.305 Y128.599 I-.053 J1.088 E.07044
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515947
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.417 Y127.755 E.00734
G1 X129.229 Y127.822 E.00769
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.211 E.00638
G1 X129.62 Y128.092 E.00635
M73 P71 R3
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 60.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01759
G1 X129.506 Y128.211 E-.08615
G1 X129.344 Y128.245 E-.08655
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07135
G1 X129.417 Y127.755 E-.10439
G1 X129.587 Y127.84 E-.09961
G1 X129.647 Y128.002 E-.09018
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 302/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L302
M991 S0 P301 ;notify layer change
G17
G3 Z60.6 I-.972 J.732 P1  F30000
G1 X129.957 Y128.415 Z60.6
G1 Z60.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.429 Y127.303 E.00145
G3 X129.991 Y128.365 I-.032 J.696 E.04802
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.1357
G1 X129.448 Y126.912 E.00228
G3 X130.305 Y128.599 I-.052 J1.088 E.07045
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515947
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.417 Y127.755 E.00735
G1 X129.229 Y127.822 E.00769
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00752
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.211 E.00638
G1 X129.62 Y128.092 E.00635
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 60.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.0176
G1 X129.506 Y128.211 E-.08608
G1 X129.344 Y128.245 E-.08659
G1 X129.186 Y128.131 E-.10211
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07135
G1 X129.417 Y127.755 E-.10435
G1 X129.587 Y127.84 E-.09965
G1 X129.647 Y128.002 E-.09019
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 303/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L303
M991 S0 P302 ;notify layer change
G17
G3 Z60.8 I-.972 J.732 P1  F30000
G1 X129.957 Y128.415 Z60.8
G1 Z60.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.429 Y127.303 E.00144
G3 X129.991 Y128.365 I-.032 J.696 E.04802
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.13569
G1 X129.448 Y126.912 E.00228
G3 X130.305 Y128.599 I-.052 J1.088 E.07045
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515943
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.417 Y127.755 E.00735
G1 X129.229 Y127.822 E.00769
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
M73 P72 R3
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.211 E.00639
G1 X129.62 Y128.092 E.00634
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 60.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.0176
G1 X129.506 Y128.211 E-.08605
G1 X129.344 Y128.245 E-.08662
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.1021
G1 X129.229 Y127.822 E-.07135
G1 X129.417 Y127.755 E-.10432
G1 X129.587 Y127.84 E-.09967
G1 X129.647 Y128.002 E-.09019
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 304/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L304
M991 S0 P303 ;notify layer change
G17
G3 Z61 I-.972 J.732 P1  F30000
G1 X129.957 Y128.415 Z61
G1 Z60.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.429 Y127.303 E.00144
G3 X129.991 Y128.365 I-.031 J.696 E.04802
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.13569
G1 X129.448 Y126.912 E.00227
G3 X130.305 Y128.599 I-.052 J1.088 E.07046
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515943
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.417 Y127.755 E.00735
G1 X129.229 Y127.822 E.00769
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.211 E.00639
G1 X129.62 Y128.092 E.00634
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 61
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.0176
G1 X129.506 Y128.211 E-.086
G1 X129.344 Y128.245 E-.08666
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07136
G1 X129.417 Y127.755 E-.10428
G1 X129.587 Y127.84 E-.09971
G1 X129.647 Y128.002 E-.0902
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 305/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L305
M991 S0 P304 ;notify layer change
G17
G3 Z61.2 I-.972 J.732 P1  F30000
G1 X129.957 Y128.415 Z61.2
G1 Z61
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.429 Y127.303 E.00144
G3 X129.991 Y128.365 I-.031 J.696 E.04803
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.13569
G1 X129.448 Y126.912 E.00227
G3 X130.305 Y128.599 I-.052 J1.088 E.07046
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515942
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.417 Y127.755 E.00735
G1 X129.229 Y127.822 E.00768
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.211 E.00639
G1 X129.62 Y128.092 E.00633
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 61.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01762
G1 X129.506 Y128.211 E-.08594
G1 X129.344 Y128.245 E-.0867
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.1021
G1 X129.229 Y127.822 E-.07136
G1 X129.417 Y127.755 E-.10424
G1 X129.587 Y127.84 E-.09975
G1 X129.647 Y128.002 E-.09019
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 306/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L306
M991 S0 P305 ;notify layer change
G17
G3 Z61.4 I-.972 J.732 P1  F30000
G1 X129.957 Y128.415 Z61.4
G1 Z61.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.429 Y127.303 E.00143
G3 X129.991 Y128.365 I-.031 J.696 E.04803
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.648 E.13569
G1 X129.448 Y126.912 E.00226
G3 X130.305 Y128.599 I-.052 J1.088 E.07047
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515939
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.416 Y127.755 E.00736
G1 X129.229 Y127.822 E.00768
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.21 E.00639
G1 X129.62 Y128.092 E.00633
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 61.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01763
G1 X129.506 Y128.21 E-.08588
G1 X129.344 Y128.245 E-.08674
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.1021
G1 X129.229 Y127.822 E-.07136
G1 X129.416 Y127.755 E-.10421
G1 X129.587 Y127.84 E-.09979
G1 X129.647 Y128.002 E-.0902
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 307/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L307
M991 S0 P306 ;notify layer change
G17
G3 Z61.6 I-.972 J.732 P1  F30000
G1 X129.957 Y128.415 Z61.6
G1 Z61.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.429 Y127.303 E.00143
G3 X129.991 Y128.365 I-.031 J.696 E.04804
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13569
G1 X129.448 Y126.912 E.00226
G3 X130.305 Y128.599 I-.052 J1.088 E.07047
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51594
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.416 Y127.755 E.00736
G1 X129.229 Y127.822 E.00768
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.21 E.0064
G1 X129.62 Y128.092 E.00633
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 61.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01764
G1 X129.506 Y128.21 E-.08583
G1 X129.344 Y128.245 E-.08677
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07137
G1 X129.416 Y127.755 E-.10417
G1 X129.587 Y127.84 E-.09982
G1 X129.647 Y128.002 E-.0902
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 308/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L308
M991 S0 P307 ;notify layer change
G17
G3 Z61.8 I-.972 J.732 P1  F30000
G1 X129.957 Y128.415 Z61.8
G1 Z61.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.429 Y127.303 E.00142
G3 X129.991 Y128.365 I-.031 J.696 E.04804
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13569
G1 X129.447 Y126.912 E.00226
G3 X130.305 Y128.599 I-.052 J1.088 E.07048
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51594
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.416 Y127.755 E.00736
G1 X129.229 Y127.822 E.00768
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.506 Y128.21 E.0064
G1 X129.62 Y128.092 E.00632
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 61.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01764
G1 X129.506 Y128.21 E-.08578
G1 X129.344 Y128.245 E-.08681
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07138
G1 X129.416 Y127.755 E-.10413
G1 X129.587 Y127.84 E-.09986
G1 X129.647 Y128.002 E-.0902
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 309/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L309
M991 S0 P308 ;notify layer change
G17
G3 Z62 I-.972 J.732 P1  F30000
G1 X129.957 Y128.415 Z62
G1 Z61.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.429 Y127.303 E.00142
G3 X129.991 Y128.365 I-.031 J.696 E.04805
G1 X130.271 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13569
G1 X129.447 Y126.912 E.00225
G3 X130.305 Y128.599 I-.052 J1.088 E.07048
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515937
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.416 Y127.755 E.00736
G1 X129.229 Y127.822 E.00767
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.507 Y128.21 E.0064
G1 X129.62 Y128.092 E.00632
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 62
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01765
G1 X129.507 Y128.21 E-.08573
G1 X129.344 Y128.245 E-.08685
G1 X129.186 Y128.131 E-.10209
G1 X129.156 Y127.938 E-.1021
G1 X129.229 Y127.822 E-.07138
G1 X129.416 Y127.755 E-.1041
G1 X129.587 Y127.84 E-.0999
G1 X129.647 Y128.002 E-.09021
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 310/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L310
M991 S0 P309 ;notify layer change
G17
G3 Z62.2 I-.972 J.732 P1  F30000
G1 X129.957 Y128.415 Z62.2
G1 Z62
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.429 Y127.303 E.00142
G3 X129.991 Y128.365 I-.031 J.696 E.04805
G1 X130.27 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13569
G1 X129.447 Y126.912 E.00225
G3 X130.305 Y128.599 I-.052 J1.088 E.07049
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51594
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.416 Y127.755 E.00737
G1 X129.229 Y127.822 E.00767
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.507 Y128.21 E.0064
G1 X129.62 Y128.092 E.00632
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 62.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01765
G1 X129.507 Y128.21 E-.08571
G1 X129.344 Y128.245 E-.08687
G1 X129.186 Y128.131 E-.10209
G1 X129.156 Y127.938 E-.1021
G1 X129.229 Y127.822 E-.07138
G1 X129.416 Y127.755 E-.10406
G1 X129.587 Y127.84 E-.09992
G1 X129.647 Y128.002 E-.09021
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 311/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L311
M991 S0 P310 ;notify layer change
G17
G3 Z62.4 I-.972 J.732 P1  F30000
G1 X129.957 Y128.415 Z62.4
G1 Z62.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.386 Y127.303 I-.56 J-.415 E.09378
G1 X129.429 Y127.303 E.00141
G3 X129.991 Y128.365 I-.031 J.696 E.04805
G1 X130.27 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13569
G1 X129.447 Y126.912 E.00224
G3 X130.305 Y128.599 I-.051 J1.088 E.07049
M204 S10000
G1 X129.647 Y128.002 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515938
G1 F1200
G1 X129.587 Y127.84 E.00665
G1 X129.416 Y127.755 E.00737
G1 X129.229 Y127.822 E.00767
G1 X129.156 Y127.938 E.00526
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.245 E.00753
G1 X129.507 Y128.21 E.00641
G1 X129.62 Y128.092 E.00631
G1 X129.63 Y128.06 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 62.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.62 Y128.092 E-.01766
G1 X129.507 Y128.21 E-.08564
G1 X129.344 Y128.245 E-.08691
G1 X129.186 Y128.131 E-.1021
G1 X129.156 Y127.938 E-.10209
G1 X129.229 Y127.822 E-.07139
G1 X129.416 Y127.755 E-.10403
G1 X129.587 Y127.84 E-.09996
G1 X129.647 Y128.002 E-.09021
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 312/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L312
M991 S0 P311 ;notify layer change
G17
G3 Z62.6 I-.982 J.719 P1  F30000
G1 X129.947 Y128.412 Z62.6
G1 Z62.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.876 Y128.507 E.00393
G3 X129.386 Y127.303 I-.478 J-.507 E.0897
G1 X129.428 Y127.303 E.00141
G3 X130.028 Y128.298 I-.031 J.696 E.04551
G1 X129.982 Y128.363 E.00265
G1 X130.27 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13568
G1 X129.447 Y126.912 E.00224
G3 X130.305 Y128.599 I-.051 J1.088 E.0705
M204 S10000
G1 X129.638 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517394
G1 F1200
G1 X129.615 Y127.872 E.00498
G1 X129.48 Y127.778 E.00636
G1 X129.313 Y127.78 E.00645
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.579 Y128.153 E.00636
G1 X129.616 Y128.055 E.00405
; CHANGE_LAYER
; Z_HEIGHT: 62.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.579 Y128.153 E-.05509
G1 X129.444 Y128.247 E-.08646
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.06955
G1 X129.48 Y127.778 E-.08769
G1 X129.615 Y127.872 E-.08647
G1 X129.638 Y127.999 E-.06775
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 313/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L313
M991 S0 P312 ;notify layer change
G17
G3 Z62.8 I-.974 J.729 P1  F30000
G1 X129.947 Y128.412 Z62.8
G1 Z62.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.876 Y128.507 E.00392
G3 X129.386 Y127.303 I-.478 J-.507 E.08971
G1 X129.428 Y127.303 E.0014
G3 X130.027 Y128.298 I-.031 J.696 E.04552
G1 X129.982 Y128.363 E.00265
G1 X130.27 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13568
G1 X129.447 Y126.911 E.00224
G3 X130.305 Y128.599 I-.051 J1.088 E.0705
M204 S10000
G1 X129.638 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5174
M73 P73 R3
G1 F1200
G1 X129.615 Y127.872 E.00498
G1 X129.48 Y127.778 E.00636
G1 X129.313 Y127.78 E.00645
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.579 Y128.153 E.00636
G1 X129.616 Y128.055 E.00405
; CHANGE_LAYER
; Z_HEIGHT: 62.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.579 Y128.153 E-.0551
G1 X129.444 Y128.247 E-.08645
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.06956
G1 X129.48 Y127.778 E-.08766
G1 X129.615 Y127.872 E-.08648
G1 X129.638 Y127.999 E-.06776
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 314/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L314
M991 S0 P313 ;notify layer change
G17
G3 Z63 I-.974 J.729 P1  F30000
G1 X129.947 Y128.412 Z63
G1 Z62.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.876 Y128.506 E.00392
G3 X129.386 Y127.303 I-.478 J-.507 E.08971
G1 X129.428 Y127.303 E.0014
G3 X130.027 Y128.298 I-.031 J.696 E.04552
G1 X129.982 Y128.363 E.00265
G1 X130.27 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13568
G1 X129.447 Y126.911 E.00223
G3 X130.305 Y128.599 I-.051 J1.088 E.07051
M204 S10000
G1 X129.638 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517407
G1 F1200
G1 X129.615 Y127.872 E.00498
G1 X129.48 Y127.778 E.00636
G1 X129.313 Y127.78 E.00645
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.579 Y128.153 E.00636
G1 X129.616 Y128.055 E.00405
; CHANGE_LAYER
; Z_HEIGHT: 63
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.579 Y128.153 E-.05512
G1 X129.444 Y128.247 E-.08644
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.06956
G1 X129.48 Y127.778 E-.08762
G1 X129.615 Y127.872 E-.08651
G1 X129.638 Y127.999 E-.06775
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 315/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L315
M991 S0 P314 ;notify layer change
G17
G3 Z63.2 I-.974 J.729 P1  F30000
G1 X129.947 Y128.413 Z63.2
G1 Z63
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.876 Y128.506 E.00391
G3 X129.386 Y127.303 I-.478 J-.507 E.08972
G1 X129.428 Y127.303 E.0014
G3 X130.027 Y128.298 I-.03 J.696 E.04552
G1 X129.982 Y128.363 E.00266
G1 X130.27 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13568
G1 X129.447 Y126.911 E.00223
G3 X130.305 Y128.599 I-.051 J1.088 E.07051
M204 S10000
G1 X129.638 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517412
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.48 Y127.778 E.00637
G1 X129.313 Y127.78 E.00644
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00636
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 63.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05513
G1 X129.444 Y128.247 E-.08642
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.06957
G1 X129.48 Y127.778 E-.08759
G1 X129.615 Y127.872 E-.08653
G1 X129.638 Y127.999 E-.06777
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 316/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L316
M991 S0 P315 ;notify layer change
G17
G3 Z63.4 I-.975 J.729 P1  F30000
G1 X129.947 Y128.413 Z63.4
G1 Z63.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.876 Y128.506 E.0039
G3 X129.386 Y127.303 I-.478 J-.507 E.08972
G1 X129.428 Y127.303 E.00139
G3 X130.027 Y128.298 I-.03 J.696 E.04553
G1 X129.981 Y128.363 E.00266
G1 X130.27 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13568
G1 X129.446 Y126.911 E.00223
G3 X130.305 Y128.599 I-.051 J1.088 E.07052
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517418
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.48 Y127.778 E.00637
G1 X129.313 Y127.78 E.00644
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00636
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 63.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05513
G1 X129.444 Y128.247 E-.08642
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.06957
G1 X129.48 Y127.778 E-.08757
G1 X129.615 Y127.872 E-.08653
G1 X129.637 Y127.999 E-.06779
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 317/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L317
M991 S0 P316 ;notify layer change
G17
G3 Z63.6 I-.975 J.729 P1  F30000
G1 X129.947 Y128.413 Z63.6
G1 Z63.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.876 Y128.506 E.00389
G3 X129.386 Y127.303 I-.478 J-.507 E.08972
G1 X129.428 Y127.303 E.00139
G3 X130.027 Y128.298 I-.03 J.696 E.04553
G1 X129.981 Y128.364 E.00266
G1 X130.27 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13568
G1 X129.446 Y126.911 E.00222
G3 X130.305 Y128.599 I-.051 J1.088 E.07052
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517424
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.48 Y127.778 E.00637
G1 X129.313 Y127.78 E.00644
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00636
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 63.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05515
G1 X129.444 Y128.247 E-.08641
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10231
G1 X129.2 Y127.849 E-.10232
G1 X129.313 Y127.78 E-.06959
G1 X129.48 Y127.778 E-.08753
G1 X129.615 Y127.872 E-.08656
G1 X129.637 Y127.999 E-.06778
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 318/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L318
M991 S0 P317 ;notify layer change
G17
G3 Z63.8 I-.975 J.729 P1  F30000
G1 X129.947 Y128.413 Z63.8
G1 Z63.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.876 Y128.506 E.00389
G3 X129.386 Y127.303 I-.478 J-.507 E.08973
G1 X129.428 Y127.303 E.00138
G3 X130.027 Y128.298 I-.03 J.696 E.04554
G1 X129.981 Y128.364 E.00266
G1 X130.27 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13568
G1 X129.446 Y126.911 E.00222
G3 X130.305 Y128.599 I-.051 J1.088 E.07053
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51743
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.48 Y127.778 E.00637
G1 X129.313 Y127.78 E.00644
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00636
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 63.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05515
G1 X129.444 Y128.247 E-.08639
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.0696
G1 X129.48 Y127.778 E-.0875
G1 X129.615 Y127.872 E-.08658
G1 X129.637 Y127.999 E-.06779
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 319/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L319
M991 S0 P318 ;notify layer change
G17
G3 Z64 I-.975 J.728 P1  F30000
G1 X129.947 Y128.413 Z64
G1 Z63.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.876 Y128.506 E.00388
G3 X129.386 Y127.303 I-.479 J-.507 E.08973
G1 X129.428 Y127.303 E.00138
G3 X130.027 Y128.298 I-.03 J.696 E.04554
G1 X129.981 Y128.364 E.00267
G1 X130.27 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13568
G1 X129.446 Y126.911 E.00221
G3 X130.305 Y128.599 I-.05 J1.088 E.07053
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517437
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.48 Y127.778 E.00637
G1 X129.313 Y127.78 E.00643
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00635
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 64
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05516
G1 X129.444 Y128.247 E-.08638
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.06961
G1 X129.48 Y127.778 E-.08746
G1 X129.615 Y127.872 E-.08659
G1 X129.637 Y127.999 E-.06781
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 320/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L320
M991 S0 P319 ;notify layer change
G17
G3 Z64.2 I-.975 J.728 P1  F30000
G1 X129.947 Y128.413 Z64.2
G1 Z64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.876 Y128.506 E.00387
G3 X129.386 Y127.303 I-.479 J-.506 E.08974
G1 X129.428 Y127.303 E.00138
G3 X130.027 Y128.298 I-.03 J.696 E.04554
G1 X129.981 Y128.364 E.00267
G1 X130.27 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13567
G1 X129.446 Y126.911 E.00221
G3 X130.305 Y128.599 I-.05 J1.088 E.07054
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517443
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.48 Y127.778 E.00637
G1 X129.313 Y127.78 E.00643
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00635
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 64.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05517
G1 X129.444 Y128.247 E-.08637
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.1023
G1 X129.313 Y127.78 E-.06962
G1 X129.48 Y127.778 E-.08743
G1 X129.615 Y127.872 E-.08661
G1 X129.637 Y127.999 E-.06782
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 321/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L321
M991 S0 P320 ;notify layer change
G17
G3 Z64.4 I-.975 J.728 P1  F30000
G1 X129.947 Y128.413 Z64.4
G1 Z64.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.876 Y128.506 E.00386
G3 X129.386 Y127.303 I-.479 J-.506 E.08974
G1 X129.428 Y127.303 E.00137
G3 X130.027 Y128.298 I-.03 J.696 E.04555
G1 X129.981 Y128.364 E.00268
G1 X130.27 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13567
G1 X129.446 Y126.911 E.00221
G3 X130.305 Y128.599 I-.05 J1.088 E.07054
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517449
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.48 Y127.778 E.00637
G1 X129.313 Y127.78 E.00643
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00635
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 64.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05518
G1 X129.444 Y128.247 E-.08636
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10231
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.06964
G1 X129.48 Y127.778 E-.08738
G1 X129.615 Y127.872 E-.08664
G1 X129.637 Y127.999 E-.06782
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 322/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L322
M991 S0 P321 ;notify layer change
G17
G3 Z64.6 I-.975 J.728 P1  F30000
G1 X129.947 Y128.413 Z64.6
G1 Z64.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.876 Y128.506 E.00385
G3 X129.386 Y127.303 I-.479 J-.506 E.08975
G1 X129.427 Y127.303 E.00137
G3 X130.027 Y128.298 I-.03 J.696 E.04555
G1 X129.981 Y128.364 E.00268
G1 X130.27 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13567
G1 X129.446 Y126.911 E.0022
G3 X130.305 Y128.599 I-.05 J1.088 E.07055
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517455
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.479 Y127.778 E.00637
G1 X129.313 Y127.78 E.00643
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00635
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 64.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.0552
G1 X129.444 Y128.247 E-.08634
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.06963
G1 X129.479 Y127.778 E-.08736
G1 X129.615 Y127.872 E-.08666
G1 X129.637 Y127.999 E-.06783
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 323/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L323
M991 S0 P322 ;notify layer change
G17
G3 Z64.8 I-.976 J.728 P1  F30000
G1 X129.947 Y128.413 Z64.8
G1 Z64.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.876 Y128.506 E.00385
G3 X129.386 Y127.303 I-.479 J-.506 E.08975
M73 P74 R3
G1 X129.427 Y127.303 E.00137
G3 X130.027 Y128.298 I-.03 J.696 E.04555
G1 X129.981 Y128.364 E.00268
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.875 J-.649 E.13567
G1 X129.446 Y126.911 E.0022
G3 X130.305 Y128.599 I-.05 J1.088 E.07055
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517459
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.479 Y127.778 E.00638
G1 X129.313 Y127.78 E.00642
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00635
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 64.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.0552
G1 X129.444 Y128.247 E-.08634
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.06964
G1 X129.479 Y127.778 E-.08733
G1 X129.615 Y127.872 E-.08667
G1 X129.637 Y127.999 E-.06784
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 324/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L324
M991 S0 P323 ;notify layer change
G17
G3 Z65 I-.976 J.727 P1  F30000
G1 X129.947 Y128.414 Z65
G1 Z64.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.877 Y128.506 E.00384
G3 X129.386 Y127.303 I-.479 J-.506 E.08976
G1 X129.427 Y127.303 E.00136
G3 X130.027 Y128.298 I-.03 J.696 E.04556
G1 X129.981 Y128.364 E.00269
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.649 E.13567
G1 X129.445 Y126.911 E.00219
G3 X130.305 Y128.599 I-.05 J1.088 E.07056
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517466
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.479 Y127.778 E.00638
G1 X129.313 Y127.78 E.00642
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00635
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 65
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.0552
G1 X129.444 Y128.247 E-.08632
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.06964
G1 X129.479 Y127.778 E-.0873
G1 X129.615 Y127.872 E-.08668
G1 X129.637 Y127.999 E-.06786
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 325/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L325
M991 S0 P324 ;notify layer change
G17
G3 Z65.2 I-.976 J.727 P1  F30000
G1 X129.947 Y128.414 Z65.2
G1 Z65
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.877 Y128.506 E.00383
G3 X129.386 Y127.303 I-.479 J-.506 E.08976
G1 X129.427 Y127.303 E.00136
G3 X130.027 Y128.298 I-.029 J.696 E.04556
G1 X129.981 Y128.364 E.00269
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.649 E.13567
G1 X129.445 Y126.911 E.00219
G3 X130.305 Y128.599 I-.05 J1.088 E.07057
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517472
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.479 Y127.778 E.00638
G1 X129.313 Y127.78 E.00642
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00635
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 65.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05524
G1 X129.444 Y128.247 E-.0863
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.06966
G1 X129.479 Y127.778 E-.08726
G1 X129.615 Y127.872 E-.08671
G1 X129.637 Y127.999 E-.06784
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 326/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L326
M991 S0 P325 ;notify layer change
G17
G3 Z65.4 I-.976 J.727 P1  F30000
G1 X129.946 Y128.414 Z65.4
G1 Z65.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.877 Y128.506 E.00382
G3 X129.386 Y127.303 I-.479 J-.506 E.08977
G1 X129.427 Y127.303 E.00135
G3 X130.027 Y128.298 I-.029 J.696 E.04557
G1 X129.981 Y128.365 E.00269
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.649 E.13567
G1 X129.445 Y126.911 E.00219
G3 X130.304 Y128.599 I-.05 J1.088 E.07057
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517477
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.479 Y127.778 E.00638
G1 X129.313 Y127.78 E.00642
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00635
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 65.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05524
G1 X129.444 Y128.247 E-.08629
G1 X129.254 Y128.203 E-.10237
G1 X129.152 Y128.037 E-.10231
G1 X129.2 Y127.849 E-.10232
G1 X129.313 Y127.78 E-.06965
G1 X129.479 Y127.778 E-.08724
G1 X129.615 Y127.872 E-.08672
G1 X129.637 Y127.999 E-.06786
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 327/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L327
M991 S0 P326 ;notify layer change
G17
G3 Z65.6 I-.976 J.727 P1  F30000
G1 X129.946 Y128.414 Z65.6
G1 Z65.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.877 Y128.505 E.00381
G3 X129.386 Y127.303 I-.479 J-.506 E.08977
G1 X129.427 Y127.303 E.00135
G3 X130.027 Y128.298 I-.029 J.696 E.04557
G1 X129.981 Y128.365 E.0027
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.649 E.13566
G1 X129.445 Y126.911 E.00218
G3 X130.304 Y128.6 I-.049 J1.088 E.07058
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517483
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.479 Y127.778 E.00638
G1 X129.313 Y127.78 E.00641
G1 X129.2 Y127.849 E.00512
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00635
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 65.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05524
G1 X129.444 Y128.247 E-.08629
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.06967
G1 X129.479 Y127.778 E-.0872
G1 X129.615 Y127.872 E-.08674
G1 X129.637 Y127.999 E-.06787
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 328/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L328
M991 S0 P327 ;notify layer change
G17
G3 Z65.8 I-.976 J.727 P1  F30000
G1 X129.946 Y128.414 Z65.8
G1 Z65.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.877 Y128.505 E.00381
G3 X129.386 Y127.303 I-.479 J-.506 E.08978
G1 X129.427 Y127.303 E.00134
G3 X130.027 Y128.298 I-.029 J.696 E.04558
G1 X129.981 Y128.365 E.0027
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.649 E.13566
G1 X129.445 Y126.911 E.00218
G3 X130.304 Y128.6 I-.049 J1.088 E.07058
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517493
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.479 Y127.778 E.00638
G1 X129.313 Y127.78 E.00641
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00635
G1 X129.616 Y128.055 E.00406
; CHANGE_LAYER
; Z_HEIGHT: 65.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05526
G1 X129.444 Y128.247 E-.08627
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10231
G1 X129.2 Y127.849 E-.10232
G1 X129.313 Y127.78 E-.06967
G1 X129.479 Y127.778 E-.08716
G1 X129.615 Y127.872 E-.08676
G1 X129.637 Y127.999 E-.06789
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 329/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L329
M991 S0 P328 ;notify layer change
G17
G3 Z66 I-.976 J.726 P1  F30000
G1 X129.946 Y128.414 Z66
G1 Z65.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.877 Y128.505 E.0038
G3 X129.386 Y127.303 I-.479 J-.506 E.08978
G1 X129.427 Y127.303 E.00134
G3 X130.027 Y128.298 I-.029 J.696 E.04558
G1 X129.981 Y128.365 E.0027
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.649 E.13566
G1 X129.445 Y126.911 E.00217
G3 X130.304 Y128.6 I-.049 J1.088 E.07059
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517494
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.479 Y127.778 E.00638
G1 X129.313 Y127.78 E.00641
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00635
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 66
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05526
G1 X129.444 Y128.247 E-.08627
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.313 Y127.78 E-.06967
G1 X129.479 Y127.778 E-.08714
G1 X129.615 Y127.872 E-.08677
G1 X129.637 Y127.999 E-.06789
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 330/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L330
M991 S0 P329 ;notify layer change
G17
G3 Z66.2 I-.977 J.726 P1  F30000
G1 X129.946 Y128.414 Z66.2
G1 Z66
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.877 Y128.505 E.00379
G3 X129.386 Y127.303 I-.479 J-.506 E.08978
G1 X129.427 Y127.303 E.00134
G3 X130.027 Y128.298 I-.029 J.696 E.04558
G1 X129.981 Y128.365 E.0027
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.649 E.13566
G1 X129.445 Y126.911 E.00217
G3 X130.304 Y128.6 I-.049 J1.088 E.07059
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517502
G1 F1200
G1 X129.615 Y127.872 E.00499
G1 X129.479 Y127.778 E.00638
G1 X129.313 Y127.78 E.00641
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00634
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 66.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05529
G1 X129.444 Y128.247 E-.08625
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10231
G1 X129.2 Y127.849 E-.10233
G1 X129.313 Y127.78 E-.06967
G1 X129.479 Y127.778 E-.08711
G1 X129.615 Y127.872 E-.08679
G1 X129.637 Y127.999 E-.06789
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 331/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L331
M991 S0 P330 ;notify layer change
G17
G3 Z66.4 I-.977 J.726 P1  F30000
G1 X129.946 Y128.414 Z66.4
G1 Z66.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.877 Y128.505 E.00379
G3 X129.386 Y127.303 I-.48 J-.506 E.08979
G1 X129.427 Y127.303 E.00133
G3 X130.027 Y128.298 I-.029 J.696 E.04559
G1 X129.981 Y128.365 E.00271
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.649 E.13566
G1 X129.445 Y126.911 E.00217
G3 X130.304 Y128.6 I-.049 J1.088 E.0706
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517508
G1 F1200
G1 X129.615 Y127.872 E.005
G1 X129.479 Y127.778 E.00639
G1 X129.313 Y127.78 E.0064
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00634
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 66.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05528
G1 X129.444 Y128.247 E-.08624
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.78 E-.0697
G1 X129.479 Y127.778 E-.08707
G1 X129.615 Y127.872 E-.08681
G1 X129.637 Y127.999 E-.06791
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 332/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L332
M991 S0 P331 ;notify layer change
G17
G3 Z66.6 I-.977 J.726 P1  F30000
G1 X129.946 Y128.414 Z66.6
G1 Z66.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.877 Y128.505 E.00378
G3 X129.386 Y127.303 I-.48 J-.506 E.08979
G1 X129.426 Y127.303 E.00133
G3 X130.027 Y128.298 I-.029 J.696 E.04559
G1 X129.98 Y128.365 E.00271
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.649 E.13566
G1 X129.445 Y126.911 E.00216
G3 X130.304 Y128.6 I-.049 J1.088 E.0706
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517513
G1 F1200
G1 X129.615 Y127.872 E.005
G1 X129.479 Y127.778 E.00639
G1 X129.313 Y127.78 E.0064
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00634
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 66.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05529
G1 X129.444 Y128.247 E-.08623
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10231
G1 X129.2 Y127.849 E-.10232
G1 X129.313 Y127.78 E-.0697
M73 P75 R3
G1 X129.479 Y127.778 E-.08705
G1 X129.615 Y127.872 E-.08682
G1 X129.637 Y127.999 E-.06792
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 333/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L333
M991 S0 P332 ;notify layer change
G17
G3 Z66.8 I-.977 J.726 P1  F30000
G1 X129.946 Y128.414 Z66.8
G1 Z66.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.877 Y128.505 E.00377
G3 X129.386 Y127.303 I-.48 J-.505 E.0898
G1 X129.426 Y127.303 E.00132
G3 X130.027 Y128.298 I-.029 J.696 E.0456
G1 X129.98 Y128.365 E.00271
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.65 E.13566
G1 X129.444 Y126.911 E.00216
G3 X130.304 Y128.6 I-.049 J1.088 E.07061
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51752
G1 F1200
G1 X129.615 Y127.872 E.005
G1 X129.479 Y127.778 E.00639
G1 X129.313 Y127.78 E.0064
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00634
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 66.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05531
G1 X129.444 Y128.247 E-.08621
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.313 Y127.78 E-.0697
G1 X129.479 Y127.778 E-.08701
G1 X129.615 Y127.872 E-.08684
G1 X129.637 Y127.999 E-.06793
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 334/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L334
M991 S0 P333 ;notify layer change
G17
G3 Z67 I-.977 J.726 P1  F30000
G1 X129.946 Y128.415 Z67
G1 Z66.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.877 Y128.505 E.00377
G3 X129.386 Y127.303 I-.48 J-.505 E.0898
G1 X129.426 Y127.303 E.00132
G3 X130.027 Y128.298 I-.029 J.696 E.0456
G1 X129.98 Y128.365 E.00272
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.65 E.13566
G1 X129.444 Y126.911 E.00216
G3 X130.304 Y128.6 I-.049 J1.088 E.07061
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517525
G1 F1200
G1 X129.615 Y127.872 E.005
G1 X129.479 Y127.778 E.00639
G1 X129.313 Y127.78 E.0064
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00634
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 67
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05531
G1 X129.444 Y128.247 E-.08621
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.313 Y127.78 E-.06971
G1 X129.479 Y127.778 E-.08698
G1 X129.615 Y127.872 E-.08686
G1 X129.637 Y127.999 E-.06794
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 335/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L335
M991 S0 P334 ;notify layer change
G17
G3 Z67.2 I-.977 J.725 P1  F30000
G1 X129.946 Y128.415 Z67.2
G1 Z67
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.877 Y128.505 E.00376
G3 X129.386 Y127.303 I-.48 J-.505 E.08981
G1 X129.426 Y127.303 E.00132
G3 X130.027 Y128.298 I-.028 J.696 E.0456
G1 X129.98 Y128.365 E.00272
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.65 E.13565
G1 X129.444 Y126.911 E.00215
G3 X130.304 Y128.6 I-.049 J1.088 E.07062
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517532
G1 F1200
G1 X129.615 Y127.872 E.005
G1 X129.479 Y127.778 E.00639
G1 X129.313 Y127.779 E.0064
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00634
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 67.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05533
G1 X129.444 Y128.247 E-.08619
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.313 Y127.779 E-.06972
G1 X129.479 Y127.778 E-.08694
G1 X129.615 Y127.872 E-.08688
G1 X129.637 Y127.999 E-.06794
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 336/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L336
M991 S0 P335 ;notify layer change
G17
G3 Z67.4 I-.977 J.725 P1  F30000
G1 X129.946 Y128.415 Z67.4
G1 Z67.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.878 Y128.505 E.00375
G3 X129.386 Y127.303 I-.48 J-.505 E.08981
G1 X129.426 Y127.303 E.00131
G3 X130.027 Y128.298 I-.028 J.696 E.04561
G1 X129.98 Y128.365 E.00272
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.65 E.13565
G1 X129.444 Y126.911 E.00215
G3 X130.304 Y128.6 I-.048 J1.088 E.07062
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517539
G1 F1200
G1 X129.615 Y127.872 E.005
G1 X129.479 Y127.778 E.00639
G1 X129.313 Y127.779 E.00639
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00634
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 67.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05534
G1 X129.444 Y128.247 E-.08617
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.313 Y127.779 E-.06974
G1 X129.479 Y127.778 E-.0869
G1 X129.615 Y127.872 E-.08689
G1 X129.637 Y127.999 E-.06795
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 337/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L337
M991 S0 P336 ;notify layer change
G17
G3 Z67.6 I-.977 J.725 P1  F30000
G1 X129.946 Y128.415 Z67.6
G1 Z67.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.878 Y128.505 E.00375
G3 X129.386 Y127.303 I-.48 J-.505 E.08982
G1 X129.426 Y127.303 E.00131
G3 X130.027 Y128.298 I-.028 J.696 E.04561
G1 X129.98 Y128.366 E.00272
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.65 E.13565
G1 X129.444 Y126.911 E.00214
G3 X130.304 Y128.6 I-.048 J1.088 E.07063
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517542
G1 F1200
G1 X129.615 Y127.872 E.005
G1 X129.479 Y127.778 E.00639
G1 X129.313 Y127.779 E.00639
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00634
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 67.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05534
G1 X129.444 Y128.247 E-.08617
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.779 E-.06974
G1 X129.479 Y127.778 E-.08688
G1 X129.615 Y127.872 E-.08691
G1 X129.637 Y127.999 E-.06797
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 338/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L338
M991 S0 P337 ;notify layer change
G17
G3 Z67.8 I-.977 J.725 P1  F30000
G1 X129.946 Y128.415 Z67.8
G1 Z67.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.878 Y128.505 E.00374
G3 X129.386 Y127.303 I-.48 J-.505 E.08982
G1 X129.426 Y127.303 E.00131
G3 X130.027 Y128.298 I-.028 J.696 E.04562
G1 X129.98 Y128.366 E.00272
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.911 I-.874 J-.65 E.13565
G1 X129.444 Y126.911 E.00214
G3 X130.304 Y128.6 I-.048 J1.088 E.07064
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51755
G1 F1200
G1 X129.615 Y127.872 E.005
G1 X129.479 Y127.778 E.00639
G1 X129.313 Y127.779 E.00639
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00634
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 67.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05535
G1 X129.444 Y128.247 E-.08615
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.313 Y127.779 E-.06974
G1 X129.479 Y127.778 E-.08684
G1 X129.615 Y127.872 E-.08693
G1 X129.637 Y127.999 E-.06798
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 339/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L339
M991 S0 P338 ;notify layer change
G17
G3 Z68 I-.977 J.725 P1  F30000
G1 X129.946 Y128.415 Z68
G1 Z67.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.878 Y128.504 E.00373
G3 X129.386 Y127.303 I-.48 J-.505 E.08983
G1 X129.426 Y127.303 E.0013
G3 X130.027 Y128.298 I-.028 J.696 E.04562
G1 X129.98 Y128.366 E.00273
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13565
G1 X129.444 Y126.911 E.00214
G3 X130.304 Y128.6 I-.048 J1.088 E.07064
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517556
G1 F1200
G1 X129.615 Y127.872 E.005
G1 X129.479 Y127.778 E.0064
G1 X129.313 Y127.779 E.00639
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00634
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 68
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05535
G1 X129.444 Y128.247 E-.08616
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.313 Y127.779 E-.06975
G1 X129.479 Y127.778 E-.08681
G1 X129.615 Y127.872 E-.08695
G1 X129.637 Y127.999 E-.06799
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 340/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L340
M991 S0 P339 ;notify layer change
G17
G3 Z68.2 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z68.2
G1 Z68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.878 Y128.504 E.00373
G3 X129.386 Y127.303 I-.48 J-.505 E.08983
G1 X129.426 Y127.303 E.0013
G3 X130.027 Y128.298 I-.028 J.696 E.04562
G1 X129.98 Y128.366 E.00273
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13565
G1 X129.444 Y126.911 E.00213
G3 X130.304 Y128.6 I-.048 J1.088 E.07065
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517561
G1 F1200
G1 X129.615 Y127.871 E.005
G1 X129.479 Y127.778 E.0064
G1 X129.313 Y127.779 E.00638
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00634
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 68.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05536
G1 X129.444 Y128.247 E-.08614
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.313 Y127.779 E-.06976
G1 X129.479 Y127.778 E-.08679
G1 X129.615 Y127.871 E-.08696
G1 X129.637 Y127.999 E-.068
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 341/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L341
M991 S0 P340 ;notify layer change
G17
G3 Z68.4 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z68.4
G1 Z68.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.878 Y128.504 E.00372
G3 X129.386 Y127.303 I-.48 J-.505 E.08983
G1 X129.425 Y127.303 E.00129
G3 X130.027 Y128.298 I-.028 J.696 E.04563
G1 X129.98 Y128.366 E.00273
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13564
G1 X129.443 Y126.911 E.00213
G3 X130.304 Y128.6 I-.048 J1.088 E.07065
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517568
G1 F1200
G1 X129.615 Y127.871 E.005
G1 X129.478 Y127.778 E.0064
G1 X129.313 Y127.779 E.00638
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00634
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 68.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05537
G1 X129.444 Y128.247 E-.08612
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.779 E-.06978
G1 X129.478 Y127.778 E-.08674
G1 X129.615 Y127.871 E-.08698
G1 X129.637 Y127.999 E-.06801
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 342/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L342
M991 S0 P341 ;notify layer change
G17
G3 Z68.6 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z68.6
G1 Z68.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.878 Y128.504 E.00372
G3 X129.387 Y127.303 I-.48 J-.505 E.08984
G1 X129.425 Y127.303 E.00129
G3 X130.027 Y128.298 I-.028 J.696 E.04563
G1 X129.98 Y128.366 E.00273
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13564
G1 X129.443 Y126.911 E.00212
G3 X130.304 Y128.6 I-.048 J1.088 E.07066
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517574
G1 F1200
G1 X129.615 Y127.871 E.005
G1 X129.478 Y127.778 E.0064
G1 X129.313 Y127.779 E.00638
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00633
G1 X129.616 Y128.055 E.00407
; CHANGE_LAYER
; Z_HEIGHT: 68.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05539
G1 X129.444 Y128.247 E-.08611
G1 X129.254 Y128.203 E-.10235
M73 P76 R3
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10231
G1 X129.313 Y127.779 E-.06979
G1 X129.478 Y127.778 E-.0867
G1 X129.615 Y127.871 E-.087
G1 X129.637 Y127.999 E-.06801
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 343/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L343
M991 S0 P342 ;notify layer change
G17
G3 Z68.8 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z68.8
G1 Z68.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.878 Y128.504 E.00371
G3 X129.387 Y127.303 I-.481 J-.505 E.08984
G1 X129.425 Y127.303 E.00129
G3 X130.027 Y128.298 I-.028 J.696 E.04563
G1 X129.98 Y128.366 E.00273
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13564
G1 X129.443 Y126.911 E.00212
G3 X130.304 Y128.6 I-.048 J1.088 E.07066
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517578
G1 F1200
G1 X129.615 Y127.871 E.005
G1 X129.478 Y127.778 E.0064
G1 X129.313 Y127.779 E.00638
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00633
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 68.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.0554
G1 X129.444 Y128.247 E-.0861
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.313 Y127.779 E-.06978
G1 X129.478 Y127.778 E-.08668
G1 X129.615 Y127.871 E-.08701
G1 X129.637 Y127.999 E-.06802
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 344/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L344
M991 S0 P343 ;notify layer change
G17
G3 Z69 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z69
G1 Z68.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.878 Y128.504 E.00371
G3 X129.387 Y127.303 I-.481 J-.505 E.08985
G1 X129.425 Y127.303 E.00128
G3 X130.027 Y128.298 I-.028 J.696 E.04564
G1 X129.98 Y128.366 E.00273
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13564
G1 X129.443 Y126.911 E.00212
G3 X130.304 Y128.6 I-.047 J1.088 E.07067
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517587
G1 F1200
G1 X129.615 Y127.871 E.005
G1 X129.478 Y127.778 E.0064
G1 X129.314 Y127.779 E.00637
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00633
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 69
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05541
G1 X129.444 Y128.247 E-.08609
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.314 Y127.779 E-.0698
G1 X129.478 Y127.778 E-.08664
G1 X129.615 Y127.871 E-.08704
G1 X129.637 Y127.999 E-.06803
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 345/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L345
M991 S0 P344 ;notify layer change
G17
G3 Z69.2 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z69.2
G1 Z69
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.878 Y128.504 E.0037
G3 X129.387 Y127.303 I-.481 J-.505 E.08985
G1 X129.425 Y127.303 E.00128
G3 X130.027 Y128.298 I-.028 J.696 E.04564
G1 X129.98 Y128.366 E.00273
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13564
G1 X129.443 Y126.911 E.00211
G3 X130.304 Y128.6 I-.047 J1.088 E.07067
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517589
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.478 Y127.778 E.0064
G1 X129.314 Y127.779 E.00637
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00633
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 69.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05542
G1 X129.444 Y128.247 E-.08608
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.0698
G1 X129.478 Y127.778 E-.08662
G1 X129.615 Y127.871 E-.08704
G1 X129.637 Y127.999 E-.06804
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 346/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L346
M991 S0 P345 ;notify layer change
G17
G3 Z69.4 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z69.4
G1 Z69.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.878 Y128.504 E.0037
G3 X129.387 Y127.303 I-.481 J-.504 E.08986
G1 X129.425 Y127.303 E.00127
G3 X130.027 Y128.298 I-.027 J.696 E.04565
G1 X129.98 Y128.366 E.00273
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13564
G1 X129.443 Y126.911 E.00211
G3 X130.304 Y128.6 I-.047 J1.088 E.07068
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517598
G1 F1200
G1 X129.615 Y127.871 E.005
G1 X129.478 Y127.778 E.0064
G1 X129.314 Y127.779 E.00637
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00633
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 69.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05544
G1 X129.444 Y128.247 E-.08606
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.0698
G1 X129.478 Y127.778 E-.08658
G1 X129.615 Y127.871 E-.08707
G1 X129.637 Y127.999 E-.06804
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 347/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L347
M991 S0 P346 ;notify layer change
G17
G3 Z69.6 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z69.6
G1 Z69.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.878 Y128.504 E.00369
G3 X129.387 Y127.303 I-.481 J-.504 E.08986
G1 X129.425 Y127.303 E.00127
G3 X130.027 Y128.298 I-.027 J.696 E.04565
G1 X129.98 Y128.366 E.00273
G1 X130.27 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13564
G1 X129.443 Y126.911 E.00211
G3 X130.304 Y128.6 I-.047 J1.088 E.07068
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517602
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.478 Y127.778 E.00641
G1 X129.314 Y127.779 E.00637
G1 X129.2 Y127.849 E.00513
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00633
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 69.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05544
G1 X129.444 Y128.247 E-.08605
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.0698
G1 X129.478 Y127.778 E-.08656
G1 X129.615 Y127.871 E-.08709
G1 X129.637 Y127.999 E-.06805
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 348/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L348
M991 S0 P347 ;notify layer change
G17
G3 Z69.8 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z69.8
G1 Z69.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.879 Y128.504 E.00369
G3 X129.387 Y127.303 I-.481 J-.504 E.08986
G1 X129.425 Y127.303 E.00127
G3 X130.027 Y128.298 I-.027 J.696 E.04566
G1 X129.98 Y128.366 E.00273
G1 X130.27 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13563
G1 X129.443 Y126.911 E.0021
G3 X130.304 Y128.6 I-.047 J1.088 E.07069
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517611
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.478 Y127.778 E.00641
G1 X129.314 Y127.779 E.00636
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00633
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 69.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05546
G1 X129.444 Y128.247 E-.08604
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10231
G1 X129.314 Y127.779 E-.06984
G1 X129.478 Y127.778 E-.0865
G1 X129.615 Y127.871 E-.08712
G1 X129.637 Y127.999 E-.06805
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 349/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L349
M991 S0 P348 ;notify layer change
G17
G3 Z70 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z70
G1 Z69.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.879 Y128.504 E.00369
G3 X129.387 Y127.303 I-.481 J-.504 E.08987
G1 X129.425 Y127.303 E.00126
G3 X130.027 Y128.298 I-.027 J.696 E.04566
G1 X129.98 Y128.366 E.00273
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13563
G1 X129.442 Y126.911 E.0021
G3 X130.304 Y128.6 I-.047 J1.088 E.07069
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517618
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.478 Y127.778 E.00641
G1 X129.314 Y127.779 E.00636
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00633
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 70
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05546
G1 X129.444 Y128.247 E-.08603
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.06983
G1 X129.478 Y127.778 E-.08648
G1 X129.615 Y127.871 E-.08713
G1 X129.637 Y127.999 E-.06808
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 350/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L350
M991 S0 P349 ;notify layer change
G17
G3 Z70.2 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z70.2
G1 Z70
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.879 Y128.504 E.00368
G3 X129.387 Y127.303 I-.481 J-.504 E.08987
G1 X129.425 Y127.303 E.00126
G3 X130.027 Y128.298 I-.027 J.696 E.04566
G1 X129.98 Y128.366 E.00273
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13563
G1 X129.442 Y126.911 E.00209
G3 X130.304 Y128.601 I-.047 J1.088 E.0707
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517621
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.478 Y127.778 E.00641
G1 X129.314 Y127.779 E.00636
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00633
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 70.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05547
G1 X129.444 Y128.247 E-.08601
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.06984
G1 X129.478 Y127.778 E-.08644
G1 X129.615 Y127.871 E-.08714
G1 X129.637 Y127.999 E-.06809
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 351/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L351
M991 S0 P350 ;notify layer change
G17
G3 Z70.4 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z70.4
G1 Z70.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.879 Y128.504 E.00368
G3 X129.387 Y127.303 I-.481 J-.504 E.08988
G1 X129.424 Y127.303 E.00125
G3 X130.027 Y128.298 I-.027 J.696 E.04567
G1 X129.98 Y128.366 E.00273
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13563
G1 X129.442 Y126.911 E.00209
G3 X130.304 Y128.601 I-.046 J1.088 E.07071
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517626
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.478 Y127.778 E.00641
G1 X129.314 Y127.779 E.00636
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00633
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 70.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05547
G1 X129.444 Y128.247 E-.08601
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.06984
G1 X129.478 Y127.778 E-.08642
G1 X129.615 Y127.871 E-.08715
G1 X129.637 Y127.999 E-.0681
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 352/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L352
M991 S0 P351 ;notify layer change
G17
G3 Z70.6 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z70.6
G1 Z70.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.879 Y128.503 E.00367
G3 X129.387 Y127.303 I-.481 J-.504 E.08988
G1 X129.424 Y127.303 E.00125
G3 X130.027 Y128.298 I-.027 J.696 E.04567
G1 X129.98 Y128.366 E.00273
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13563
G1 X129.442 Y126.911 E.00209
G3 X130.304 Y128.601 I-.046 J1.088 E.07071
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517633
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.478 Y127.778 E.00641
G1 X129.314 Y127.779 E.00635
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00633
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 70.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.0555
M73 P77 R3
G1 X129.444 Y128.247 E-.08599
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.06986
G1 X129.478 Y127.778 E-.08638
G1 X129.615 Y127.871 E-.08718
G1 X129.637 Y127.999 E-.06809
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 353/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L353
M991 S0 P352 ;notify layer change
G17
G3 Z70.8 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z70.8
G1 Z70.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.879 Y128.503 E.00367
G3 X129.387 Y127.303 I-.481 J-.504 E.08988
G1 X129.424 Y127.303 E.00125
G3 X130.027 Y128.298 I-.027 J.696 E.04568
G1 X129.98 Y128.366 E.00273
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13562
G1 X129.442 Y126.911 E.00208
G3 X130.304 Y128.601 I-.046 J1.088 E.07072
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517639
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.478 Y127.778 E.00641
G1 X129.314 Y127.779 E.00635
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00632
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 70.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05549
G1 X129.444 Y128.247 E-.08598
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.06986
G1 X129.478 Y127.778 E-.08635
G1 X129.615 Y127.871 E-.08719
G1 X129.637 Y127.999 E-.06812
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 354/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L354
M991 S0 P353 ;notify layer change
G17
G3 Z71 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z71
G1 Z70.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.879 Y128.503 E.00367
G3 X129.387 Y127.303 I-.481 J-.504 E.08989
G1 X129.424 Y127.303 E.00124
G3 X130.027 Y128.299 I-.027 J.696 E.04568
G1 X129.98 Y128.366 E.00273
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13562
G1 X129.442 Y126.911 E.00208
G3 X130.304 Y128.601 I-.046 J1.088 E.07072
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517643
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.478 Y127.778 E.00641
G1 X129.314 Y127.779 E.00635
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00632
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 71
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05551
G1 X129.444 Y128.247 E-.08597
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.06985
G1 X129.478 Y127.778 E-.08634
G1 X129.615 Y127.871 E-.0872
G1 X129.637 Y127.999 E-.06812
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 355/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L355
M991 S0 P354 ;notify layer change
G17
G3 Z71.2 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z71.2
G1 Z71
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.879 Y128.503 E.00366
G3 X129.387 Y127.303 I-.481 J-.504 E.08989
G1 X129.424 Y127.303 E.00124
G3 X130.027 Y128.299 I-.026 J.696 E.04568
G1 X129.98 Y128.366 E.00273
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13562
G1 X129.442 Y126.911 E.00207
G3 X130.304 Y128.601 I-.046 J1.088 E.07073
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517651
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.478 Y127.778 E.00642
G1 X129.314 Y127.779 E.00635
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00632
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 71.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05553
G1 X129.444 Y128.247 E-.08595
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.06986
G1 X129.478 Y127.778 E-.0863
G1 X129.615 Y127.871 E-.08722
G1 X129.637 Y127.999 E-.06812
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 356/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L356
M991 S0 P355 ;notify layer change
G17
G3 Z71.4 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z71.4
G1 Z71.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.879 Y128.503 E.00366
G3 X129.387 Y127.303 I-.482 J-.504 E.0899
G1 X129.424 Y127.303 E.00123
G3 X130.027 Y128.299 I-.026 J.696 E.04569
G1 X129.98 Y128.366 E.00273
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.874 J-.65 E.13562
G1 X129.442 Y126.911 E.00207
G3 X130.304 Y128.601 I-.046 J1.088 E.07073
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517658
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.478 Y127.778 E.00642
G1 X129.314 Y127.779 E.00634
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.153 E.00632
G1 X129.616 Y128.055 E.00408
; CHANGE_LAYER
; Z_HEIGHT: 71.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.153 E-.05553
G1 X129.444 Y128.247 E-.08595
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10231
G1 X129.314 Y127.779 E-.06989
G1 X129.478 Y127.778 E-.08626
G1 X129.615 Y127.871 E-.08725
G1 X129.637 Y127.999 E-.06813
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 357/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L357
M991 S0 P356 ;notify layer change
G17
G3 Z71.6 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z71.6
G1 Z71.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.879 Y128.503 E.00366
G3 X129.387 Y127.303 I-.482 J-.504 E.0899
G1 X129.424 Y127.303 E.00123
G3 X130.027 Y128.299 I-.026 J.696 E.04569
G1 X129.98 Y128.366 E.00273
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.873 J-.651 E.13562
G1 X129.442 Y126.911 E.00207
G3 X130.304 Y128.601 I-.046 J1.088 E.07074
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517664
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.478 Y127.778 E.00642
G1 X129.314 Y127.779 E.00634
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00632
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 71.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05554
G1 X129.444 Y128.247 E-.08594
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.06988
G1 X129.478 Y127.778 E-.08623
G1 X129.615 Y127.871 E-.08726
G1 X129.637 Y127.999 E-.06814
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 358/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L358
M991 S0 P357 ;notify layer change
G17
G3 Z71.8 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z71.8
G1 Z71.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.879 Y128.503 E.00365
G3 X129.387 Y127.303 I-.482 J-.504 E.08991
G1 X129.424 Y127.303 E.00123
G3 X130.027 Y128.299 I-.026 J.696 E.0457
G1 X129.98 Y128.366 E.00273
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.873 J-.651 E.13562
G1 X129.441 Y126.911 E.00206
G3 X130.304 Y128.601 I-.046 J1.088 E.07075
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517667
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.478 Y127.778 E.00642
G1 X129.314 Y127.779 E.00634
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00632
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 71.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05554
G1 X129.444 Y128.247 E-.08593
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.06988
G1 X129.478 Y127.778 E-.0862
G1 X129.615 Y127.871 E-.08728
G1 X129.637 Y127.999 E-.06815
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 359/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L359
M991 S0 P358 ;notify layer change
G17
G3 Z72 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z72
G1 Z71.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.879 Y128.503 E.00365
G3 X129.387 Y127.303 I-.482 J-.503 E.08991
G1 X129.424 Y127.303 E.00122
G3 X130.027 Y128.299 I-.026 J.696 E.0457
G1 X129.98 Y128.366 E.00273
G1 X130.273 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.269 Y128.65 E.00013
G3 X129.374 Y126.91 I-.873 J-.651 E.13561
G1 X129.441 Y126.911 E.00206
G3 X130.38 Y128.467 I-.045 J1.088 E.06601
G1 X130.303 Y128.6 E.00473
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517675
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.477 Y127.778 E.00642
G1 X129.314 Y127.779 E.00634
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00632
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 72
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05556
G1 X129.444 Y128.247 E-.08591
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.06992
G1 X129.477 Y127.778 E-.08615
G1 X129.615 Y127.871 E-.08729
G1 X129.637 Y127.999 E-.06817
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 360/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L360
M991 S0 P359 ;notify layer change
G17
G3 Z72.2 I-.978 J.725 P1  F30000
G1 X129.946 Y128.415 Z72.2
G1 Z72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.879 Y128.503 E.00364
G3 X129.387 Y127.303 I-.482 J-.503 E.08992
G1 X129.424 Y127.303 E.00122
G3 X130.027 Y128.299 I-.026 J.696 E.0457
G1 X129.98 Y128.366 E.00273
G1 X130.273 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.269 Y128.65 E.00013
G3 X129.374 Y126.91 I-.873 J-.651 E.13561
G1 X129.441 Y126.911 E.00206
G3 X130.38 Y128.467 I-.045 J1.088 E.06601
G1 X130.303 Y128.6 E.00473
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517681
G1 F1200
G1 X129.615 Y127.871 E.00501
G1 X129.477 Y127.778 E.00642
G1 X129.314 Y127.779 E.00634
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00632
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 72.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05557
G1 X129.444 Y128.247 E-.0859
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.06991
G1 X129.477 Y127.778 E-.08613
G1 X129.615 Y127.871 E-.08731
G1 X129.637 Y127.999 E-.06818
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 361/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L361
M991 S0 P360 ;notify layer change
G17
G3 Z72.4 I-.978 J.724 P1  F30000
G1 X129.946 Y128.415 Z72.4
G1 Z72.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.88 Y128.503 E.00364
G3 X129.387 Y127.303 I-.482 J-.503 E.08992
G1 X129.423 Y127.303 E.00121
G3 X130.027 Y128.299 I-.026 J.696 E.04571
G1 X129.98 Y128.366 E.00273
G1 X130.273 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.269 Y128.65 E.00013
G3 X129.374 Y126.91 I-.873 J-.651 E.13561
G1 X129.441 Y126.911 E.00205
G3 X130.38 Y128.467 I-.045 J1.088 E.06602
G1 X130.303 Y128.6 E.00473
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517687
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00642
G1 X129.314 Y127.779 E.00633
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00632
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 72.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05558
G1 X129.444 Y128.247 E-.08589
G1 X129.254 Y128.203 E-.10237
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.06993
G1 X129.477 Y127.778 E-.08609
G1 X129.615 Y127.871 E-.08733
G1 X129.637 Y127.999 E-.06818
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 362/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L362
M991 S0 P361 ;notify layer change
G17
G3 Z72.6 I-.978 J.724 P1  F30000
G1 X129.946 Y128.416 Z72.6
G1 Z72.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.88 Y128.503 E.00363
G3 X129.387 Y127.303 I-.482 J-.503 E.08993
G1 X129.423 Y127.303 E.00121
G3 X130.027 Y128.299 I-.026 J.696 E.04571
G1 X129.98 Y128.366 E.00273
G1 X130.273 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.269 Y128.65 E.00013
G3 X129.374 Y126.91 I-.873 J-.651 E.13561
G1 X129.441 Y126.911 E.00205
G3 X130.38 Y128.467 I-.045 J1.088 E.06602
G1 X130.303 Y128.6 E.00473
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517692
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00643
G1 X129.314 Y127.779 E.00633
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00632
M73 P78 R3
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 72.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05559
G1 X129.444 Y128.247 E-.08587
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.06992
G1 X129.477 Y127.778 E-.08607
G1 X129.615 Y127.871 E-.08735
G1 X129.637 Y127.999 E-.0682
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 363/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L363
M991 S0 P362 ;notify layer change
G17
G3 Z72.8 I-.978 J.724 P1  F30000
G1 X129.946 Y128.416 Z72.8
G1 Z72.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.88 Y128.503 E.00362
G3 X129.387 Y127.303 I-.482 J-.503 E.08993
G1 X129.423 Y127.303 E.00121
G3 X130.027 Y128.299 I-.026 J.696 E.04572
G1 X129.98 Y128.366 E.00273
G1 X130.273 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.269 Y128.65 E.00013
G3 X129.374 Y126.91 I-.873 J-.651 E.13561
G1 X129.441 Y126.911 E.00204
G3 X130.38 Y128.467 I-.045 J1.088 E.06603
G1 X130.303 Y128.6 E.00473
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517701
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00643
G1 X129.314 Y127.779 E.00633
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00632
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 72.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.0556
G1 X129.444 Y128.247 E-.08586
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10231
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.06994
G1 X129.477 Y127.778 E-.08602
G1 X129.615 Y127.871 E-.08737
G1 X129.637 Y127.999 E-.0682
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 364/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L364
M991 S0 P363 ;notify layer change
G17
G3 Z73 I-.978 J.724 P1  F30000
G1 X129.946 Y128.416 Z73
G1 Z72.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.88 Y128.503 E.00362
G3 X129.387 Y127.303 I-.482 J-.503 E.08993
G1 X129.423 Y127.303 E.0012
G3 X130.027 Y128.299 I-.026 J.696 E.04572
G1 X129.98 Y128.366 E.00274
G1 X130.273 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.269 Y128.65 E.00013
G3 X129.374 Y126.91 I-.873 J-.651 E.13561
G1 X129.441 Y126.911 E.00204
G3 X130.38 Y128.467 I-.045 J1.088 E.06603
G1 X130.303 Y128.6 E.00474
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517708
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00643
G1 X129.314 Y127.779 E.00633
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00631
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 73
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05563
G1 X129.444 Y128.247 E-.08584
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.06993
G1 X129.477 Y127.778 E-.086
G1 X129.615 Y127.871 E-.08739
G1 X129.637 Y127.999 E-.0682
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 365/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L365
M991 S0 P364 ;notify layer change
G17
G3 Z73.2 I-.978 J.724 P1  F30000
G1 X129.946 Y128.416 Z73.2
G1 Z73
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.88 Y128.502 E.00361
G3 X129.387 Y127.303 I-.482 J-.503 E.08994
G1 X129.423 Y127.303 E.0012
G3 X130.027 Y128.299 I-.025 J.696 E.04572
G1 X129.98 Y128.367 E.00274
G1 X130.273 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.269 Y128.65 E.00013
G3 X129.374 Y126.91 I-.873 J-.651 E.1356
G1 X129.441 Y126.911 E.00204
G3 X130.38 Y128.467 I-.045 J1.088 E.06604
G1 X130.303 Y128.6 E.00474
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51771
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00643
G1 X129.314 Y127.779 E.00632
G1 X129.2 Y127.849 E.00514
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00631
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 73.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05562
G1 X129.444 Y128.247 E-.08584
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.06994
G1 X129.477 Y127.778 E-.08597
G1 X129.615 Y127.871 E-.0874
G1 X129.637 Y127.999 E-.06822
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 366/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L366
M991 S0 P365 ;notify layer change
G17
G3 Z73.4 I-.979 J.724 P1  F30000
G1 X129.946 Y128.416 Z73.4
G1 Z73.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.88 Y128.502 E.0036
G3 X129.387 Y127.303 I-.482 J-.503 E.08994
G1 X129.423 Y127.303 E.0012
G3 X130.027 Y128.299 I-.025 J.696 E.04573
G1 X129.98 Y128.367 E.00274
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.873 J-.651 E.1356
G1 X129.44 Y126.911 E.00203
G3 X130.304 Y128.601 I-.045 J1.088 E.07079
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517716
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00643
G1 X129.314 Y127.779 E.00632
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00631
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 73.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05564
G1 X129.444 Y128.247 E-.08582
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.06995
G1 X129.477 Y127.778 E-.08595
G1 X129.615 Y127.871 E-.08741
G1 X129.637 Y127.999 E-.06822
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 367/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L367
M991 S0 P366 ;notify layer change
G17
G3 Z73.6 I-.979 J.723 P1  F30000
G1 X129.945 Y128.416 Z73.6
G1 Z73.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.88 Y128.502 E.00359
G3 X129.387 Y127.303 I-.482 J-.503 E.08995
G1 X129.423 Y127.303 E.00119
G3 X130.027 Y128.299 I-.025 J.696 E.04573
G1 X129.98 Y128.367 E.00275
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.873 J-.651 E.1356
G1 X129.44 Y126.911 E.00203
G3 X130.304 Y128.601 I-.044 J1.088 E.0708
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517723
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00643
G1 X129.314 Y127.779 E.00632
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00631
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 73.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05564
G1 X129.444 Y128.247 E-.08582
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.06995
G1 X129.477 Y127.778 E-.08591
G1 X129.615 Y127.871 E-.08743
G1 X129.637 Y127.999 E-.06824
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 368/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L368
M991 S0 P367 ;notify layer change
G17
G3 Z73.8 I-.979 J.723 P1  F30000
G1 X129.945 Y128.416 Z73.8
G1 Z73.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.88 Y128.502 E.00358
G3 X129.387 Y127.303 I-.483 J-.503 E.08995
G1 X129.423 Y127.303 E.00119
G3 X130.027 Y128.299 I-.025 J.696 E.04574
G1 X129.98 Y128.367 E.00276
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.873 J-.651 E.1356
G1 X129.44 Y126.911 E.00202
G3 X130.304 Y128.601 I-.044 J1.088 E.0708
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517727
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00643
G1 X129.314 Y127.779 E.00632
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00631
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 73.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05564
G1 X129.444 Y128.247 E-.08581
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.06995
G1 X129.477 Y127.778 E-.08589
G1 X129.615 Y127.871 E-.08745
G1 X129.637 Y127.999 E-.06825
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 369/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L369
M991 S0 P368 ;notify layer change
G17
G3 Z74 I-.979 J.723 P1  F30000
G1 X129.945 Y128.416 Z74
G1 Z73.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.88 Y128.502 E.00357
G3 X129.387 Y127.303 I-.483 J-.503 E.08996
G1 X129.423 Y127.303 E.00118
G3 X130.027 Y128.299 I-.025 J.696 E.04574
G1 X129.979 Y128.367 E.00276
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.873 J-.651 E.1356
G1 X129.44 Y126.911 E.00202
G3 X130.304 Y128.601 I-.044 J1.088 E.07081
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517733
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00643
G1 X129.314 Y127.779 E.00631
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00631
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 74
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05566
G1 X129.444 Y128.247 E-.0858
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.06997
G1 X129.477 Y127.778 E-.08584
G1 X129.615 Y127.871 E-.08747
G1 X129.637 Y127.999 E-.06825
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 370/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L370
M991 S0 P369 ;notify layer change
G17
G3 Z74.2 I-.979 J.722 P1  F30000
G1 X129.945 Y128.417 Z74.2
G1 Z74
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.88 Y128.502 E.00356
G3 X129.387 Y127.303 I-.483 J-.503 E.08996
G1 X129.423 Y127.303 E.00118
G3 X130.027 Y128.299 I-.025 J.696 E.04575
G1 X129.979 Y128.367 E.00277
G1 X130.269 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.873 J-.651 E.1356
G1 X129.44 Y126.911 E.00202
G3 X130.304 Y128.601 I-.044 J1.088 E.07081
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517742
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00644
G1 X129.314 Y127.779 E.00631
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00631
G1 X129.616 Y128.055 E.00409
; CHANGE_LAYER
; Z_HEIGHT: 74.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05567
G1 X129.444 Y128.247 E-.08578
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.06998
G1 X129.477 Y127.778 E-.08581
G1 X129.615 Y127.871 E-.08749
G1 X129.637 Y127.999 E-.06827
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 371/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L371
M991 S0 P370 ;notify layer change
G17
G3 Z74.4 I-.98 J.722 P1  F30000
G1 X129.945 Y128.417 Z74.4
G1 Z74.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.88 Y128.502 E.00355
G3 X129.387 Y127.303 I-.483 J-.503 E.08996
G1 X129.422 Y127.303 E.00117
G3 X130.027 Y128.299 I-.025 J.696 E.04575
G1 X129.979 Y128.368 E.00277
G1 X130.269 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.873 J-.651 E.13559
G1 X129.44 Y126.911 E.00201
G3 X130.304 Y128.601 I-.044 J1.088 E.07082
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517748
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00644
G1 X129.314 Y127.779 E.00631
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
M73 P78 R2
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00631
G1 X129.616 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 74.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05567
G1 X129.444 Y128.247 E-.08578
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.06999
G1 X129.477 Y127.778 E-.08577
G1 X129.615 Y127.871 E-.0875
G1 X129.637 Y127.999 E-.06828
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 372/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L372
M991 S0 P371 ;notify layer change
G17
G3 Z74.6 I-.98 J.722 P1  F30000
G1 X129.945 Y128.417 Z74.6
G1 Z74.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.88 Y128.502 E.00354
G3 X129.387 Y127.303 I-.483 J-.502 E.08997
G1 X129.422 Y127.303 E.00117
G3 X130.027 Y128.299 I-.025 J.696 E.04575
G1 X129.979 Y128.368 E.00278
G1 X130.269 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.873 J-.651 E.13559
G1 X129.44 Y126.911 E.00201
G3 X130.304 Y128.601 I-.044 J1.088 E.07083
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517753
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00644
G1 X129.314 Y127.779 E.00631
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00631
G1 X129.616 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 74.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05569
M73 P79 R2
G1 X129.444 Y128.247 E-.08576
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07
G1 X129.477 Y127.778 E-.08574
G1 X129.615 Y127.871 E-.08752
G1 X129.637 Y127.999 E-.06827
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 373/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L373
M991 S0 P372 ;notify layer change
G17
G3 Z74.8 I-.98 J.721 P1  F30000
G1 X129.945 Y128.417 Z74.8
G1 Z74.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.881 Y128.502 E.00353
G3 X129.387 Y127.303 I-.483 J-.502 E.08997
G1 X129.422 Y127.303 E.00117
G3 X130.027 Y128.299 I-.025 J.696 E.04576
G1 X129.979 Y128.368 E.00279
G1 X130.269 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.873 J-.651 E.13559
G1 X129.44 Y126.911 E.002
G3 X130.303 Y128.602 I-.044 J1.088 E.07083
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517757
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00644
G1 X129.314 Y127.779 E.00631
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00631
G1 X129.616 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 74.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05569
G1 X129.444 Y128.247 E-.08576
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07
G1 X129.477 Y127.778 E-.08572
G1 X129.615 Y127.871 E-.08753
G1 X129.637 Y127.999 E-.06829
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 374/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L374
M991 S0 P373 ;notify layer change
G17
G3 Z75 I-.981 J.721 P1  F30000
G1 X129.945 Y128.417 Z75
G1 Z74.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.881 Y128.502 E.00352
G3 X129.387 Y127.303 I-.483 J-.502 E.08998
G1 X129.422 Y127.303 E.00116
G3 X130.027 Y128.299 I-.025 J.696 E.04576
G1 X129.979 Y128.368 E.00279
G1 X130.269 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.873 J-.651 E.13559
G1 X129.439 Y126.911 E.002
G3 X130.303 Y128.602 I-.044 J1.088 E.07084
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517766
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00644
G1 X129.314 Y127.779 E.0063
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00631
G1 X129.616 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 75
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05571
G1 X129.444 Y128.247 E-.08573
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10231
G1 X129.314 Y127.779 E-.07003
G1 X129.477 Y127.778 E-.08566
G1 X129.615 Y127.871 E-.08755
G1 X129.637 Y127.999 E-.0683
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 375/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L375
M991 S0 P374 ;notify layer change
G17
G3 Z75.2 I-.981 J.72 P1  F30000
G1 X129.945 Y128.418 Z75.2
G1 Z75
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.881 Y128.502 E.00351
G3 X129.387 Y127.303 I-.483 J-.502 E.08998
G1 X129.422 Y127.303 E.00116
G3 X130.027 Y128.299 I-.024 J.696 E.04577
G1 X129.979 Y128.368 E.0028
G1 X130.272 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.149 Y128.786 E.00553
G3 X129.374 Y126.91 I-.753 J-.786 E.13004
G1 X129.439 Y126.911 E.002
G3 X130.301 Y128.605 I-.043 J1.088 E.07097
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517771
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00644
G1 X129.314 Y127.779 E.0063
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.00631
G1 X129.616 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 75.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05572
G1 X129.444 Y128.247 E-.08573
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07002
G1 X129.477 Y127.778 E-.08565
G1 X129.615 Y127.871 E-.08757
G1 X129.637 Y127.999 E-.06831
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 376/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L376
M991 S0 P375 ;notify layer change
G17
G3 Z75.4 I-.981 J.72 P1  F30000
G1 X129.944 Y128.418 Z75.4
G1 Z75.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.881 Y128.502 E.0035
G3 X129.387 Y127.303 I-.483 J-.502 E.08998
G1 X129.422 Y127.303 E.00115
G3 X130.027 Y128.299 I-.024 J.696 E.04577
G1 X129.979 Y128.368 E.00281
G1 X130.272 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.15 Y128.786 E.00552
G3 X129.374 Y126.91 I-.754 J-.786 E.13004
G1 X129.439 Y126.911 E.00199
G3 X130.301 Y128.605 I-.043 J1.088 E.07098
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517776
G1 F1200
G1 X129.615 Y127.871 E.00503
G1 X129.477 Y127.778 E.00644
G1 X129.314 Y127.779 E.0063
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.0063
G1 X129.616 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 75.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05572
G1 X129.444 Y128.247 E-.08572
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07002
G1 X129.477 Y127.778 E-.08563
G1 X129.615 Y127.871 E-.08759
G1 X129.637 Y127.999 E-.06832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 377/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L377
M991 S0 P376 ;notify layer change
G17
G3 Z75.6 I-.981 J.72 P1  F30000
G1 X129.944 Y128.418 Z75.6
G1 Z75.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.881 Y128.502 E.00349
G3 X129.387 Y127.303 I-.483 J-.502 E.08999
G1 X129.422 Y127.303 E.00115
G3 X130.027 Y128.299 I-.024 J.696 E.04578
G1 X129.979 Y128.369 E.00281
G1 X130.271 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.15 Y128.786 E.00551
G3 X129.374 Y126.91 I-.754 J-.786 E.13005
G1 X129.439 Y126.911 E.00199
G3 X130.301 Y128.605 I-.043 J1.088 E.07098
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517784
G1 F1200
G1 X129.615 Y127.871 E.00502
G1 X129.477 Y127.778 E.00644
G1 X129.314 Y127.779 E.00629
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.0063
G1 X129.616 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 75.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05574
G1 X129.444 Y128.247 E-.0857
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07004
G1 X129.477 Y127.778 E-.08557
G1 X129.615 Y127.871 E-.08762
G1 X129.637 Y127.999 E-.06831
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 378/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L378
M991 S0 P377 ;notify layer change
G17
G3 Z75.8 I-.982 J.719 P1  F30000
G1 X129.944 Y128.418 Z75.8
G1 Z75.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.881 Y128.502 E.00348
G3 X129.387 Y127.303 I-.483 J-.502 E.08999
G1 X129.422 Y127.303 E.00115
G3 X130.027 Y128.299 I-.024 J.696 E.04578
G1 X129.978 Y128.369 E.00282
G1 X130.271 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.15 Y128.786 E.0055
G3 X129.374 Y126.91 I-.754 J-.786 E.13005
G1 X129.439 Y126.911 E.00198
G3 X130.301 Y128.605 I-.043 J1.088 E.07099
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51779
G1 F1200
G1 X129.615 Y127.871 E.00503
G1 X129.476 Y127.778 E.00645
G1 X129.314 Y127.779 E.00629
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.578 Y128.154 E.0063
G1 X129.616 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 75.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.578 Y128.154 E-.05575
G1 X129.444 Y128.247 E-.08568
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07005
G1 X129.476 Y127.778 E-.08554
G1 X129.615 Y127.871 E-.08763
G1 X129.637 Y127.999 E-.06833
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 379/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L379
M991 S0 P378 ;notify layer change
G17
G3 Z76 I-.982 J.719 P1  F30000
G1 X129.944 Y128.418 Z76
G1 Z75.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.881 Y128.501 E.00347
G3 X129.387 Y127.303 I-.483 J-.502 E.09
G1 X129.422 Y127.303 E.00114
G3 X130.027 Y128.299 I-.024 J.696 E.04578
G1 X129.978 Y128.369 E.00282
G1 X130.271 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.15 Y128.785 E.00549
G3 X129.374 Y126.91 I-.754 J-.786 E.13005
G1 X129.439 Y126.911 E.00198
G3 X130.301 Y128.605 I-.043 J1.088 E.071
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517795
G1 F1200
G1 X129.615 Y127.871 E.00503
G1 X129.476 Y127.778 E.00645
G1 X129.314 Y127.779 E.00629
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.0063
G1 X129.616 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 76
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05576
G1 X129.444 Y128.247 E-.08568
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07005
G1 X129.476 Y127.778 E-.08552
G1 X129.615 Y127.871 E-.08764
G1 X129.637 Y127.999 E-.06834
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 380/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L380
M991 S0 P379 ;notify layer change
G17
G3 Z76.2 I-.982 J.719 P1  F30000
G1 X129.944 Y128.418 Z76.2
G1 Z76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.881 Y128.501 E.00346
G3 X129.387 Y127.303 I-.483 J-.502 E.09
G1 X129.422 Y127.303 E.00114
G3 X130.027 Y128.299 I-.024 J.696 E.04579
G1 X129.978 Y128.369 E.00283
G1 X130.271 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.15 Y128.785 E.00548
G3 X129.374 Y126.91 I-.754 J-.786 E.13005
G1 X129.439 Y126.911 E.00198
G3 X130.301 Y128.605 I-.043 J1.088 E.071
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517801
G1 F1200
G1 X129.615 Y127.871 E.00503
G1 X129.476 Y127.778 E.00645
G1 X129.314 Y127.779 E.00629
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.0063
G1 X129.616 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 76.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05576
G1 X129.444 Y128.247 E-.08566
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07007
G1 X129.476 Y127.778 E-.08548
G1 X129.615 Y127.871 E-.08765
G1 X129.637 Y127.999 E-.06837
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 381/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L381
M991 S0 P380 ;notify layer change
G17
G3 Z76.4 I-.982 J.719 P1  F30000
G1 X129.944 Y128.418 Z76.4
G1 Z76.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.881 Y128.501 E.00345
G3 X129.387 Y127.303 I-.484 J-.502 E.09
G1 X129.421 Y127.303 E.00114
G3 X130.027 Y128.299 I-.024 J.696 E.04579
G1 X129.978 Y128.369 E.00283
G1 X130.271 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.15 Y128.785 E.00547
G3 X129.374 Y126.91 I-.754 J-.786 E.13006
G1 X129.439 Y126.911 E.00197
G3 X130.301 Y128.605 I-.043 J1.088 E.07101
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517808
G1 F1200
G1 X129.615 Y127.871 E.00503
G1 X129.476 Y127.778 E.00645
G1 X129.314 Y127.779 E.00629
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.0063
G1 X129.616 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 76.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05579
G1 X129.444 Y128.247 E-.08565
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07008
G1 X129.476 Y127.778 E-.08545
G1 X129.615 Y127.871 E-.08768
G1 X129.637 Y127.999 E-.06835
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 382/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L382
M991 S0 P381 ;notify layer change
G17
G3 Z76.6 I-.982 J.719 P1  F30000
G1 X129.944 Y128.419 Z76.6
G1 Z76.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.881 Y128.501 E.00344
G3 X129.387 Y127.303 I-.484 J-.502 E.09001
G1 X129.421 Y127.303 E.00113
G3 X130.027 Y128.299 I-.024 J.696 E.0458
G1 X129.978 Y128.369 E.00283
G1 X130.271 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.15 Y128.785 E.00547
G3 X129.374 Y126.91 I-.754 J-.786 E.13006
G1 X129.439 Y126.911 E.00197
G3 X130.301 Y128.606 I-.042 J1.088 E.07101
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517812
G1 F1200
G1 X129.615 Y127.871 E.00503
G1 X129.476 Y127.778 E.00645
G1 X129.314 Y127.779 E.00628
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
M73 P80 R2
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.0063
G1 X129.616 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 76.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05579
G1 X129.444 Y128.247 E-.08565
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07007
G1 X129.476 Y127.778 E-.08543
G1 X129.615 Y127.871 E-.08769
G1 X129.637 Y127.999 E-.06837
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 383/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L383
M991 S0 P382 ;notify layer change
G17
G3 Z76.8 I-.982 J.718 P1  F30000
G1 X129.944 Y128.419 Z76.8
G1 Z76.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.881 Y128.501 E.00344
G3 X129.387 Y127.303 I-.484 J-.502 E.09001
G1 X129.421 Y127.303 E.00113
G3 X130.027 Y128.299 I-.024 J.696 E.0458
G1 X129.978 Y128.369 E.00283
G1 X130.271 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.15 Y128.785 E.00546
G3 X129.374 Y126.91 I-.754 J-.786 E.13006
G1 X129.438 Y126.911 E.00197
G3 X130.301 Y128.606 I-.042 J1.088 E.07102
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517818
G1 F1200
G1 X129.615 Y127.871 E.00503
G1 X129.476 Y127.778 E.00645
G1 X129.314 Y127.779 E.00628
G1 X129.2 Y127.849 E.00515
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.0063
G1 X129.615 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 76.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.0558
G1 X129.444 Y128.247 E-.08563
G1 X129.254 Y128.203 E-.10237
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07007
G1 X129.476 Y127.778 E-.0854
G1 X129.615 Y127.871 E-.08771
G1 X129.637 Y127.999 E-.06838
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 384/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L384
M991 S0 P383 ;notify layer change
G17
G3 Z77 I-.982 J.718 P1  F30000
G1 X129.944 Y128.419 Z77
G1 Z76.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.881 Y128.501 E.00343
G3 X129.387 Y127.303 I-.484 J-.502 E.09002
G1 X129.421 Y127.303 E.00112
G3 X130.027 Y128.299 I-.024 J.696 E.0458
G1 X129.978 Y128.369 E.00284
G1 X130.271 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.15 Y128.785 E.00546
G3 X129.374 Y126.91 I-.754 J-.786 E.13007
G1 X129.438 Y126.911 E.00196
G3 X130.301 Y128.606 I-.042 J1.088 E.07102
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517823
G1 F1200
G1 X129.615 Y127.871 E.00503
G1 X129.476 Y127.778 E.00645
G1 X129.314 Y127.779 E.00628
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.0063
G1 X129.615 Y128.055 E.0041
; CHANGE_LAYER
; Z_HEIGHT: 77
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05581
G1 X129.444 Y128.247 E-.08562
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07008
G1 X129.476 Y127.778 E-.08537
G1 X129.615 Y127.871 E-.08772
G1 X129.637 Y127.999 E-.06839
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 385/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L385
M991 S0 P384 ;notify layer change
G17
G3 Z77.2 I-.982 J.718 P1  F30000
G1 X129.944 Y128.419 Z77.2
G1 Z77
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.882 Y128.501 E.00343
G3 X129.387 Y127.303 I-.484 J-.501 E.09002
G1 X129.421 Y127.303 E.00112
G3 X130.027 Y128.299 I-.023 J.696 E.04581
G1 X129.978 Y128.369 E.00284
G1 X130.271 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.15 Y128.785 E.00546
G3 X129.374 Y126.91 I-.754 J-.786 E.13007
G1 X129.438 Y126.911 E.00196
G3 X130.301 Y128.606 I-.042 J1.088 E.07103
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517829
G1 F1200
G1 X129.615 Y127.871 E.00503
G1 X129.476 Y127.778 E.00645
G1 X129.314 Y127.779 E.00628
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.0063
G1 X129.615 Y128.055 E.00411
; CHANGE_LAYER
; Z_HEIGHT: 77.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05582
G1 X129.444 Y128.247 E-.0856
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07009
G1 X129.476 Y127.778 E-.08533
G1 X129.615 Y127.871 E-.08774
G1 X129.637 Y127.999 E-.0684
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 386/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L386
M991 S0 P385 ;notify layer change
G17
G3 Z77.4 I-.982 J.718 P1  F30000
G1 X129.944 Y128.419 Z77.4
G1 Z77.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.882 Y128.501 E.00343
G3 X129.387 Y127.303 I-.484 J-.501 E.09003
G1 X129.421 Y127.303 E.00111
G3 X130.027 Y128.299 I-.023 J.696 E.04581
G1 X129.978 Y128.369 E.00283
G1 X130.271 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.15 Y128.785 E.00546
G3 X129.374 Y126.91 I-.754 J-.786 E.13007
G1 X129.438 Y126.911 E.00195
G3 X130.301 Y128.606 I-.042 J1.088 E.07103
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517834
G1 F1200
G1 X129.614 Y127.871 E.00503
G1 X129.476 Y127.778 E.00645
G1 X129.314 Y127.779 E.00627
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.0063
G1 X129.615 Y128.055 E.00411
; CHANGE_LAYER
; Z_HEIGHT: 77.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05583
G1 X129.444 Y128.247 E-.08559
G1 X129.254 Y128.203 E-.10237
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.0701
G1 X129.476 Y127.778 E-.0853
G1 X129.614 Y127.871 E-.08776
G1 X129.637 Y127.999 E-.0684
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 387/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L387
M991 S0 P386 ;notify layer change
G17
G3 Z77.6 I-.982 J.719 P1  F30000
G1 X129.944 Y128.419 Z77.6
G1 Z77.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.882 Y128.501 E.00342
G3 X129.387 Y127.303 I-.484 J-.501 E.09003
G1 X129.421 Y127.303 E.00111
G3 X130.027 Y128.299 I-.023 J.696 E.04582
G1 X129.978 Y128.369 E.00283
G1 X130.271 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.151 Y128.785 E.00546
G3 X129.374 Y126.91 I-.754 J-.786 E.13008
G1 X129.438 Y126.911 E.00195
G3 X130.301 Y128.606 I-.042 J1.088 E.07104
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51784
G1 F1200
G1 X129.614 Y127.871 E.00503
G1 X129.476 Y127.778 E.00646
G1 X129.314 Y127.779 E.00627
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00629
G1 X129.615 Y128.055 E.00411
; CHANGE_LAYER
; Z_HEIGHT: 77.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05585
G1 X129.444 Y128.247 E-.08557
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07011
G1 X129.476 Y127.778 E-.08527
G1 X129.614 Y127.871 E-.08777
G1 X129.637 Y127.999 E-.06841
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 388/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L388
M991 S0 P387 ;notify layer change
G17
G3 Z77.8 I-.982 J.719 P1  F30000
G1 X129.944 Y128.419 Z77.8
G1 Z77.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.882 Y128.501 E.00342
G3 X129.387 Y127.303 I-.484 J-.501 E.09003
G1 X129.421 Y127.303 E.00111
G3 X130.027 Y128.299 I-.023 J.696 E.04582
G1 X129.978 Y128.369 E.00283
G1 X130.271 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.151 Y128.785 E.00546
G3 X129.374 Y126.91 I-.754 J-.785 E.13008
G1 X129.438 Y126.911 E.00195
G3 X130.301 Y128.606 I-.042 J1.088 E.07104
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517848
G1 F1200
G1 X129.614 Y127.871 E.00503
G1 X129.476 Y127.778 E.00646
G1 X129.314 Y127.779 E.00627
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00629
G1 X129.615 Y128.055 E.00411
; CHANGE_LAYER
; Z_HEIGHT: 77.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05586
G1 X129.444 Y128.247 E-.08557
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10234
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07013
G1 X129.476 Y127.778 E-.08523
G1 X129.614 Y127.871 E-.0878
G1 X129.637 Y127.999 E-.06841
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 389/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L389
M991 S0 P388 ;notify layer change
G17
G3 Z78 I-.982 J.719 P1  F30000
G1 X129.944 Y128.418 Z78
G1 Z77.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.882 Y128.501 E.00342
G3 X129.387 Y127.303 I-.484 J-.501 E.09004
G1 X129.421 Y127.303 E.0011
G3 X130.027 Y128.299 I-.023 J.696 E.04583
G1 X129.978 Y128.369 E.00282
G1 X130.271 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.151 Y128.785 E.00546
G3 X129.374 Y126.91 I-.755 J-.785 E.13008
G1 X129.438 Y126.911 E.00194
G3 X130.301 Y128.606 I-.042 J1.088 E.07105
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517853
G1 F1200
G1 X129.614 Y127.871 E.00503
G1 X129.476 Y127.778 E.00646
G1 X129.314 Y127.779 E.00627
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00629
G1 X129.615 Y128.055 E.00411
; CHANGE_LAYER
; Z_HEIGHT: 78
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05587
G1 X129.444 Y128.247 E-.08555
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07011
G1 X129.476 Y127.778 E-.0852
G1 X129.614 Y127.871 E-.08781
G1 X129.637 Y127.999 E-.06843
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 390/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L390
M991 S0 P389 ;notify layer change
G17
G3 Z78.2 I-.982 J.719 P1  F30000
G1 X129.944 Y128.418 Z78.2
G1 Z78
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.882 Y128.501 E.00343
G3 X129.387 Y127.303 I-.484 J-.501 E.09004
G1 X129.421 Y127.303 E.0011
G3 X130.027 Y128.299 I-.023 J.697 E.04583
G1 X129.978 Y128.369 E.00282
G1 X130.269 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.374 Y126.91 I-.872 J-.652 E.13556
G1 X129.438 Y126.911 E.00194
G3 X130.303 Y128.602 I-.041 J1.088 E.07093
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517855
G1 F1200
G1 X129.614 Y127.871 E.00503
G1 X129.476 Y127.778 E.00646
G1 X129.314 Y127.779 E.00627
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00629
G1 X129.615 Y128.055 E.00411
; CHANGE_LAYER
; Z_HEIGHT: 78.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05586
G1 X129.444 Y128.247 E-.08555
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07012
G1 X129.476 Y127.778 E-.08518
G1 X129.614 Y127.871 E-.08782
G1 X129.637 Y127.999 E-.06845
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 391/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L391
M991 S0 P390 ;notify layer change
G17
G3 Z78.4 I-.981 J.72 P1  F30000
G1 X129.944 Y128.418 Z78.4
G1 Z78.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.882 Y128.501 E.00343
G3 X129.387 Y127.303 I-.484 J-.501 E.09004
G1 X129.42 Y127.303 E.0011
G3 X130.027 Y128.299 I-.023 J.697 E.04584
G1 X129.979 Y128.369 E.00281
G1 X130.269 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.375 Y126.91 I-.872 J-.652 E.13555
G1 X129.437 Y126.911 E.00193
G3 X130.303 Y128.602 I-.041 J1.088 E.07094
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517863
G1 F1200
G1 X129.614 Y127.871 E.00503
G1 X129.476 Y127.778 E.00646
G1 X129.314 Y127.779 E.00626
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00629
G1 X129.615 Y128.055 E.00411
; CHANGE_LAYER
; Z_HEIGHT: 78.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05589
G1 X129.444 Y128.247 E-.08553
G1 X129.254 Y128.203 E-.10235
G1 X129.152 Y128.037 E-.10234
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07014
G1 X129.476 Y127.778 E-.08513
G1 X129.614 Y127.871 E-.08784
G1 X129.637 Y127.999 E-.06845
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 392/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L392
M991 S0 P391 ;notify layer change
G17
G3 Z78.6 I-.981 J.72 P1  F30000
G1 X129.944 Y128.418 Z78.6
G1 Z78.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.882 Y128.5 E.00343
G3 X129.387 Y127.303 I-.484 J-.501 E.09005
G1 X129.42 Y127.303 E.00109
G3 X130.027 Y128.299 I-.023 J.697 E.04584
G1 X129.979 Y128.369 E.0028
G1 X130.269 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.375 Y126.91 I-.872 J-.652 E.13555
G1 X129.437 Y126.911 E.00193
G3 X130.303 Y128.602 I-.041 J1.088 E.07094
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51787
G1 F1200
G1 X129.614 Y127.871 E.00504
G1 X129.476 Y127.778 E.00646
G1 X129.314 Y127.779 E.00626
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
M73 P81 R2
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00629
G1 X129.615 Y128.055 E.00411
; CHANGE_LAYER
; Z_HEIGHT: 78.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05588
G1 X129.444 Y128.247 E-.08552
G1 X129.254 Y128.203 E-.10237
G1 X129.152 Y128.037 E-.10232
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07016
G1 X129.476 Y127.778 E-.08509
G1 X129.614 Y127.871 E-.08785
G1 X129.637 Y127.999 E-.06848
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 393/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L393
M991 S0 P392 ;notify layer change
G17
G3 Z78.8 I-.981 J.721 P1  F30000
G1 X129.945 Y128.418 Z78.8
G1 Z78.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.882 Y128.5 E.00344
G3 X129.387 Y127.303 I-.484 J-.501 E.09005
G1 X129.42 Y127.303 E.00109
G3 X130.027 Y128.299 I-.023 J.697 E.04585
G1 X129.979 Y128.369 E.00279
G1 X130.269 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.375 Y126.91 I-.872 J-.652 E.13555
G1 X129.437 Y126.911 E.00193
G3 X130.303 Y128.602 I-.041 J1.088 E.07095
M204 S10000
G1 X129.628 Y127.907 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517877
G1 F1200
G1 X129.553 Y127.805 E.00492
G1 X129.411 Y127.756 E.00582
G1 X129.23 Y127.823 E.00745
G1 X129.157 Y127.938 E.00529
G1 X129.186 Y128.131 E.00753
G1 X129.344 Y128.244 E.00753
G2 X129.622 Y128.102 I.027 J-.29 E.01274
G1 X129.626 Y127.967 E.00522
; CHANGE_LAYER
; Z_HEIGHT: 78.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.622 Y128.102 E-.07013
G1 X129.525 Y128.214 E-.07704
G1 X129.344 Y128.244 E-.09538
G1 X129.186 Y128.131 E-.10108
G1 X129.157 Y127.938 E-.10108
G1 X129.23 Y127.823 E-.07103
G1 X129.411 Y127.756 E-.10005
G1 X129.553 Y127.805 E-.07819
G1 X129.628 Y127.907 E-.06601
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 394/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L394
M991 S0 P393 ;notify layer change
G17
G3 Z79 I-1.034 J.642 P1  F30000
G1 X129.945 Y128.418 Z79
G1 Z78.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.882 Y128.5 E.00344
G3 X129.387 Y127.303 I-.485 J-.501 E.09006
G1 X129.42 Y127.303 E.00108
G3 X130.027 Y128.299 I-.022 J.697 E.04585
G1 X129.979 Y128.368 E.00279
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.269 Y128.652 E.00012
G3 X129.375 Y126.91 I-.872 J-.652 E.13555
G1 X129.437 Y126.911 E.00192
G3 X130.38 Y128.468 I-.041 J1.088 E.06619
G1 X130.302 Y128.601 E.00475
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517882
G1 F1200
G1 X129.614 Y127.871 E.00504
G1 X129.476 Y127.778 E.00646
G1 X129.314 Y127.779 E.00625
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00629
G1 X129.615 Y128.055 E.00411
; CHANGE_LAYER
; Z_HEIGHT: 79
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.0559
G1 X129.444 Y128.247 E-.0855
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07017
G1 X129.476 Y127.778 E-.08503
G1 X129.614 Y127.871 E-.08789
G1 X129.637 Y127.999 E-.0685
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 395/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L395
M991 S0 P394 ;notify layer change
G17
G3 Z79.2 I-.98 J.721 P1  F30000
G1 X129.945 Y128.418 Z79.2
G1 Z79
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.882 Y128.5 E.00344
G3 X129.387 Y127.303 I-.485 J-.501 E.09006
G1 X129.42 Y127.303 E.00108
G3 X130.027 Y128.299 I-.022 J.697 E.04585
G1 X129.979 Y128.368 E.00278
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.269 Y128.652 E.00012
G3 X129.375 Y126.91 I-.872 J-.652 E.13555
G1 X129.437 Y126.911 E.00192
G3 X130.38 Y128.468 I-.041 J1.088 E.0662
G1 X130.302 Y128.601 E.00474
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517885
G1 F1200
G1 X129.614 Y127.871 E.00504
G1 X129.476 Y127.778 E.00647
G1 X129.314 Y127.779 E.00625
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00629
G1 X129.615 Y128.055 E.00411
; CHANGE_LAYER
; Z_HEIGHT: 79.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05593
G1 X129.444 Y128.247 E-.08548
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07016
G1 X129.476 Y127.778 E-.08502
G1 X129.614 Y127.871 E-.0879
G1 X129.637 Y127.999 E-.06849
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 396/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L396
M991 S0 P395 ;notify layer change
G17
G3 Z79.4 I-.98 J.722 P1  F30000
G1 X129.945 Y128.417 Z79.4
G1 Z79.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.882 Y128.5 E.00344
G3 X129.388 Y127.303 I-.485 J-.501 E.09006
G1 X129.42 Y127.303 E.00108
G3 X130.027 Y128.299 I-.022 J.697 E.04586
G1 X129.979 Y128.368 E.00277
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.269 Y128.652 E.00012
G3 X129.375 Y126.91 I-.872 J-.652 E.13554
G1 X129.437 Y126.911 E.00192
G3 X130.38 Y128.468 I-.041 J1.088 E.0662
G1 X130.302 Y128.601 E.00473
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517892
G1 F1200
G1 X129.614 Y127.871 E.00504
G1 X129.476 Y127.778 E.00647
G1 X129.314 Y127.779 E.00625
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00629
G1 X129.615 Y128.055 E.00411
; CHANGE_LAYER
; Z_HEIGHT: 79.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05594
G1 X129.444 Y128.247 E-.08547
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10234
G1 X129.314 Y127.779 E-.07016
G1 X129.476 Y127.778 E-.08499
G1 X129.614 Y127.871 E-.08793
G1 X129.637 Y127.999 E-.06849
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 397/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L397
M991 S0 P396 ;notify layer change
G17
G3 Z79.6 I-.98 J.722 P1  F30000
G1 X129.945 Y128.417 Z79.6
G1 Z79.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.883 Y128.5 E.00345
G3 X129.388 Y127.303 I-.485 J-.501 E.09007
G1 X129.42 Y127.303 E.00107
G3 X130.027 Y128.299 I-.022 J.697 E.04586
G1 X129.979 Y128.368 E.00277
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00012
G3 X129.375 Y126.91 I-.872 J-.652 E.13554
G1 X129.437 Y126.911 E.00191
G3 X130.38 Y128.468 I-.04 J1.088 E.06621
G1 X130.302 Y128.601 E.00473
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517897
G1 F1200
G1 X129.614 Y127.871 E.00504
G1 X129.475 Y127.778 E.00647
G1 X129.314 Y127.779 E.00625
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00629
G1 X129.615 Y128.055 E.00411
; CHANGE_LAYER
; Z_HEIGHT: 79.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05594
G1 X129.444 Y128.247 E-.08546
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07018
G1 X129.475 Y127.778 E-.08495
G1 X129.614 Y127.871 E-.08794
G1 X129.637 Y127.999 E-.06851
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 398/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L398
M991 S0 P397 ;notify layer change
G17
G3 Z79.8 I-.979 J.722 P1  F30000
G1 X129.945 Y128.417 Z79.8
G1 Z79.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.883 Y128.5 E.00345
G3 X129.388 Y127.303 I-.485 J-.501 E.09007
G1 X129.42 Y127.303 E.00107
G3 X130.027 Y128.299 I-.022 J.697 E.04587
G1 X129.979 Y128.368 E.00276
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00012
G3 X129.375 Y126.91 I-.872 J-.652 E.13554
G1 X129.437 Y126.911 E.00191
G3 X130.38 Y128.468 I-.04 J1.088 E.06621
G1 X130.302 Y128.601 E.00472
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517901
G1 F1200
G1 X129.614 Y127.871 E.00504
G1 X129.475 Y127.778 E.00647
G1 X129.314 Y127.779 E.00625
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00629
G1 X129.615 Y128.055 E.00411
; CHANGE_LAYER
; Z_HEIGHT: 79.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05594
G1 X129.444 Y128.247 E-.08545
G1 X129.254 Y128.203 E-.10237
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07019
G1 X129.475 Y127.778 E-.08492
G1 X129.614 Y127.871 E-.08795
G1 X129.637 Y127.999 E-.06852
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 399/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L399
M991 S0 P398 ;notify layer change
G17
G3 Z80 I-.979 J.723 P1  F30000
G1 X129.945 Y128.417 Z80
G1 Z79.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.883 Y128.5 E.00345
G3 X129.388 Y127.303 I-.485 J-.501 E.09008
G1 X129.42 Y127.303 E.00106
G3 X130.027 Y128.299 I-.022 J.697 E.04587
G1 X129.979 Y128.368 E.00276
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00012
G3 X129.375 Y126.91 I-.872 J-.652 E.13554
G1 X129.437 Y126.911 E.0019
G3 X130.38 Y128.468 I-.04 J1.088 E.06622
G1 X130.302 Y128.601 E.00472
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517908
G1 F1200
G1 X129.614 Y127.871 E.00504
G1 X129.475 Y127.778 E.00647
G1 X129.314 Y127.779 E.00624
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00628
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 80
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05596
G1 X129.444 Y128.247 E-.08544
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10234
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.0702
G1 X129.475 Y127.778 E-.08488
G1 X129.614 Y127.871 E-.08798
G1 X129.637 Y127.999 E-.06853
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 400/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L400
M991 S0 P399 ;notify layer change
G17
G3 Z80.2 I-.979 J.723 P1  F30000
G1 X129.945 Y128.417 Z80.2
G1 Z80
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.883 Y128.5 E.00345
G3 X129.388 Y127.303 I-.485 J-.5 E.09008
G1 X129.42 Y127.303 E.00106
G3 X130.027 Y128.299 I-.022 J.697 E.04588
G1 X129.98 Y128.368 E.00275
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00013
G3 X129.375 Y126.91 I-.872 J-.652 E.13553
G1 X129.436 Y126.911 E.0019
G3 X130.38 Y128.468 I-.04 J1.088 E.06623
G1 X130.303 Y128.601 E.00471
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517914
G1 F1200
G1 X129.614 Y127.871 E.00504
G1 X129.475 Y127.778 E.00647
G1 X129.314 Y127.779 E.00624
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00628
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 80.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05596
G1 X129.444 Y128.247 E-.08543
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10234
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.0702
G1 X129.475 Y127.778 E-.08485
G1 X129.614 Y127.871 E-.08799
G1 X129.637 Y127.999 E-.06854
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 401/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L401
M991 S0 P400 ;notify layer change
G17
G3 Z80.4 I-.979 J.723 P1  F30000
G1 X129.945 Y128.417 Z80.4
G1 Z80.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.883 Y128.5 E.00345
G3 X129.388 Y127.303 I-.485 J-.5 E.09008
G1 X129.419 Y127.303 E.00106
G3 X130.027 Y128.299 I-.022 J.697 E.04588
G1 X129.98 Y128.368 E.00275
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00013
G3 X129.375 Y126.91 I-.872 J-.653 E.13553
G1 X129.436 Y126.911 E.0019
G3 X130.38 Y128.468 I-.04 J1.088 E.06623
G1 X130.303 Y128.601 E.00471
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51792
G1 F1200
G1 X129.614 Y127.871 E.00504
G1 X129.475 Y127.778 E.00647
G1 X129.314 Y127.779 E.00624
G1 X129.2 Y127.849 E.00516
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00628
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 80.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05598
G1 X129.444 Y128.247 E-.08541
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07021
G1 X129.475 Y127.778 E-.08483
G1 X129.614 Y127.871 E-.08801
G1 X129.637 Y127.999 E-.06854
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 402/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L402
M991 S0 P401 ;notify layer change
G17
G3 Z80.6 I-.979 J.723 P1  F30000
G1 X129.945 Y128.417 Z80.6
G1 Z80.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.883 Y128.5 E.00344
G3 X129.388 Y127.303 I-.485 J-.5 E.09009
G1 X129.419 Y127.303 E.00105
G3 X130.027 Y128.3 I-.022 J.697 E.04589
G1 X129.98 Y128.368 E.00275
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00013
G3 X129.375 Y126.91 I-.872 J-.653 E.13553
G1 X129.436 Y126.911 E.00189
G3 X130.38 Y128.468 I-.04 J1.088 E.06624
G1 X130.303 Y128.601 E.00471
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517927
G1 F1200
G1 X129.614 Y127.871 E.00504
M73 P82 R2
G1 X129.475 Y127.778 E.00648
G1 X129.314 Y127.779 E.00624
G1 X129.2 Y127.849 E.00517
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00628
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 80.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05599
G1 X129.444 Y128.247 E-.08541
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10234
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07023
G1 X129.475 Y127.778 E-.08478
G1 X129.614 Y127.871 E-.08804
G1 X129.637 Y127.999 E-.06855
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 403/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L403
M991 S0 P402 ;notify layer change
G17
G3 Z80.8 I-.979 J.723 P1  F30000
G1 X129.945 Y128.417 Z80.8
G1 Z80.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.883 Y128.5 E.00344
G3 X129.388 Y127.303 I-.485 J-.5 E.09009
G1 X129.419 Y127.303 E.00105
G3 X130.027 Y128.3 I-.021 J.697 E.04589
G1 X129.98 Y128.368 E.00275
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00013
G3 X129.375 Y126.91 I-.872 J-.653 E.13553
G1 X129.436 Y126.911 E.00189
G3 X130.38 Y128.468 I-.04 J1.088 E.06624
G1 X130.303 Y128.601 E.00471
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517931
G1 F1200
G1 X129.614 Y127.871 E.00504
G1 X129.475 Y127.778 E.00648
G1 X129.314 Y127.779 E.00623
G1 X129.2 Y127.849 E.00517
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00628
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 80.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.056
G1 X129.444 Y128.247 E-.08539
G1 X129.254 Y128.203 E-.10237
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07023
G1 X129.475 Y127.778 E-.08475
G1 X129.614 Y127.871 E-.08805
G1 X129.637 Y127.999 E-.06856
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 404/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L404
M991 S0 P403 ;notify layer change
G17
G3 Z81 I-.979 J.723 P1  F30000
G1 X129.945 Y128.417 Z81
G1 Z80.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.883 Y128.5 E.00343
G3 X129.388 Y127.303 I-.485 J-.5 E.0901
G1 X129.419 Y127.303 E.00104
G3 X130.027 Y128.3 I-.021 J.697 E.04589
G1 X129.98 Y128.368 E.00275
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00013
G3 X129.375 Y126.91 I-.872 J-.653 E.13553
G1 X129.436 Y126.911 E.00188
G3 X130.38 Y128.468 I-.039 J1.088 E.06625
G1 X130.303 Y128.601 E.00471
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517937
G1 F1200
G1 X129.614 Y127.871 E.00504
G1 X129.475 Y127.778 E.00648
G1 X129.314 Y127.779 E.00623
G1 X129.2 Y127.849 E.00517
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.247 E.00753
G1 X129.577 Y128.154 E.00628
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 81
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.056
G1 X129.444 Y128.247 E-.08539
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10234
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07023
G1 X129.475 Y127.778 E-.08472
G1 X129.614 Y127.871 E-.08806
G1 X129.637 Y127.999 E-.06858
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 405/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L405
M991 S0 P404 ;notify layer change
G17
G3 Z81.2 I-.979 J.722 P1  F30000
G1 X129.945 Y128.417 Z81.2
G1 Z81
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.883 Y128.5 E.00342
G3 X129.388 Y127.303 I-.485 J-.5 E.0901
G1 X129.419 Y127.303 E.00104
G3 X130.027 Y128.3 I-.021 J.697 E.0459
G1 X129.979 Y128.368 E.00276
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00012
G3 X129.375 Y126.91 I-.872 J-.653 E.13552
G1 X129.436 Y126.911 E.00188
G3 X130.38 Y128.468 I-.039 J1.088 E.06625
G1 X130.302 Y128.601 E.00471
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517945
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.475 Y127.778 E.00648
G1 X129.314 Y127.779 E.00623
G1 X129.2 Y127.849 E.00517
G1 X129.152 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.154 E.00628
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 81.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05602
G1 X129.444 Y128.246 E-.08536
G1 X129.254 Y128.203 E-.10236
G1 X129.152 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07026
G1 X129.475 Y127.778 E-.08467
G1 X129.614 Y127.871 E-.08808
G1 X129.637 Y127.999 E-.06859
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 406/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L406
M991 S0 P405 ;notify layer change
G17
G3 Z81.4 I-.98 J.722 P1  F30000
G1 X129.945 Y128.417 Z81.4
G1 Z81.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.883 Y128.499 E.00341
G3 X129.388 Y127.303 I-.485 J-.5 E.0901
G1 X129.419 Y127.303 E.00104
G3 X130.027 Y128.3 I-.021 J.697 E.0459
G1 X129.979 Y128.368 E.00276
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00012
G3 X129.375 Y126.91 I-.872 J-.653 E.13552
G1 X129.436 Y126.911 E.00188
G3 X130.38 Y128.468 I-.039 J1.088 E.06626
G1 X130.302 Y128.601 E.00472
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517949
G1 F1200
G1 X129.614 Y127.871 E.00504
G1 X129.475 Y127.778 E.00648
G1 X129.314 Y127.779 E.00623
G1 X129.2 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.154 E.00628
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 81.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05603
G1 X129.444 Y128.246 E-.08536
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07027
G1 X129.475 Y127.778 E-.08464
G1 X129.614 Y127.871 E-.08811
G1 X129.637 Y127.999 E-.06858
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 407/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L407
M991 S0 P406 ;notify layer change
G17
G3 Z81.6 I-.98 J.721 P1  F30000
G1 X129.945 Y128.418 Z81.6
G1 Z81.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.883 Y128.499 E.00339
G3 X129.388 Y127.303 I-.486 J-.5 E.09011
G1 X129.419 Y127.303 E.00103
G3 X130.027 Y128.3 I-.021 J.697 E.04591
G1 X129.979 Y128.368 E.00277
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00012
G3 X129.375 Y126.91 I-.872 J-.653 E.13552
G1 X129.436 Y126.911 E.00187
G3 X130.38 Y128.468 I-.039 J1.088 E.06626
G1 X130.302 Y128.601 E.00472
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517954
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.475 Y127.778 E.00648
G1 X129.314 Y127.779 E.00622
G1 X129.2 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.154 E.00628
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 81.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05603
G1 X129.444 Y128.246 E-.08535
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10234
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07025
G1 X129.475 Y127.778 E-.08462
G1 X129.614 Y127.871 E-.08812
G1 X129.637 Y127.999 E-.06859
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 408/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L408
M991 S0 P407 ;notify layer change
G17
G3 Z81.8 I-.981 J.721 P1  F30000
G1 X129.945 Y128.418 Z81.8
G1 Z81.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.883 Y128.499 E.00338
G3 X129.388 Y127.303 I-.486 J-.5 E.09011
G1 X129.419 Y127.303 E.00103
G3 X130.027 Y128.3 I-.021 J.697 E.04591
G1 X129.979 Y128.369 E.00279
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00012
G3 X129.375 Y126.91 I-.872 J-.653 E.13552
G1 X129.435 Y126.911 E.00187
G3 X130.38 Y128.468 I-.039 J1.088 E.06627
G1 X130.302 Y128.602 E.00473
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51796
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.475 Y127.778 E.00648
G1 X129.314 Y127.779 E.00622
G1 X129.2 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.154 E.00628
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 81.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.154 E-.05605
G1 X129.444 Y128.246 E-.08534
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10234
G1 X129.2 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07027
G1 X129.475 Y127.778 E-.08458
G1 X129.614 Y127.871 E-.08814
G1 X129.637 Y127.999 E-.0686
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 409/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L409
M991 S0 P408 ;notify layer change
G17
G3 Z82 I-.981 J.72 P1  F30000
G1 X129.944 Y128.418 Z82
G1 Z81.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.884 Y128.499 E.00336
G3 X129.388 Y127.303 I-.486 J-.5 E.09012
G1 X129.419 Y127.303 E.00102
G3 X130.027 Y128.3 I-.021 J.697 E.04592
G1 X129.979 Y128.369 E.0028
G1 X130.272 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00012
G3 X129.375 Y126.91 I-.872 J-.653 E.13551
G1 X129.435 Y126.911 E.00186
G3 X130.38 Y128.468 I-.039 J1.088 E.06628
G1 X130.302 Y128.602 E.00474
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517966
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.475 Y127.778 E.00648
G1 X129.314 Y127.779 E.00622
G1 X129.2 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00628
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 82
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05605
G1 X129.444 Y128.246 E-.08533
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10234
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07028
G1 X129.475 Y127.778 E-.08454
G1 X129.614 Y127.871 E-.08816
G1 X129.637 Y127.999 E-.06861
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 410/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L410
M991 S0 P409 ;notify layer change
G17
G3 Z82.2 I-.982 J.719 P1  F30000
G1 X129.944 Y128.419 Z82.2
G1 Z82
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.884 Y128.499 E.00334
G3 X129.388 Y127.303 I-.486 J-.5 E.09012
G1 X129.419 Y127.303 E.00102
G3 X130.027 Y128.3 I-.021 J.697 E.04592
G1 X129.978 Y128.37 E.00282
G1 X130.272 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.652 E.00011
G3 X129.375 Y126.91 I-.872 J-.653 E.13551
G1 X129.435 Y126.911 E.00186
G3 X130.38 Y128.468 I-.039 J1.088 E.06628
G1 X130.302 Y128.602 E.00475
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517972
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.475 Y127.778 E.00649
G1 X129.314 Y127.779 E.00622
G1 X129.2 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00628
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 82.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05607
G1 X129.444 Y128.246 E-.08532
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07028
G1 X129.475 Y127.778 E-.08451
G1 X129.614 Y127.871 E-.08818
G1 X129.637 Y127.999 E-.06862
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 411/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L411
M991 S0 P410 ;notify layer change
G17
G3 Z82.4 I-.983 J.718 P1  F30000
G1 X129.944 Y128.419 Z82.4
G1 Z82.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.884 Y128.499 E.00332
G3 X129.388 Y127.303 I-.486 J-.5 E.09012
G1 X129.418 Y127.303 E.00102
G3 X130.027 Y128.3 I-.021 J.697 E.04593
G1 X129.978 Y128.37 E.00284
G1 X130.268 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.375 Y126.91 I-.872 J-.653 E.13551
G1 X129.435 Y126.911 E.00186
G3 X130.303 Y128.603 I-.038 J1.088 E.07106
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517977
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.475 Y127.778 E.00649
G1 X129.314 Y127.779 E.00621
G1 X129.2 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00628
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 82.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05605
G1 X129.444 Y128.246 E-.08532
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07029
G1 X129.475 Y127.778 E-.08448
G1 X129.614 Y127.871 E-.08819
G1 X129.637 Y127.999 E-.06865
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 412/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L412
M991 S0 P411 ;notify layer change
G17
G3 Z82.6 I-.983 J.717 P1  F30000
G1 X129.944 Y128.42 Z82.6
G1 Z82.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.884 Y128.499 E.0033
G3 X129.388 Y127.303 I-.486 J-.5 E.09013
G1 X129.418 Y127.303 E.00101
G3 X130.027 Y128.3 I-.02 J.697 E.04593
G1 X129.978 Y128.37 E.00285
G1 X130.268 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.375 Y126.91 I-.872 J-.653 E.13551
G1 X129.435 Y126.911 E.00185
G3 X130.303 Y128.603 I-.038 J1.088 E.07107
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517981
G1 F1200
G1 X129.614 Y127.871 E.00505
M73 P83 R2
G1 X129.475 Y127.778 E.00649
G1 X129.314 Y127.779 E.00621
G1 X129.201 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00627
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 82.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05606
G1 X129.444 Y128.246 E-.0853
G1 X129.254 Y128.203 E-.10237
G1 X129.153 Y128.037 E-.10234
G1 X129.201 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07027
G1 X129.475 Y127.778 E-.08446
G1 X129.614 Y127.871 E-.08821
G1 X129.637 Y127.999 E-.06865
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 413/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L413
M991 S0 P412 ;notify layer change
G17
G3 Z82.8 I-.984 J.716 P1  F30000
G1 X129.943 Y128.42 Z82.8
G1 Z82.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.884 Y128.499 E.00327
G3 X129.388 Y127.303 I-.486 J-.499 E.09013
G1 X129.418 Y127.303 E.00101
G3 X130.027 Y128.3 I-.02 J.697 E.04593
G1 X129.977 Y128.371 E.00287
G1 X130.271 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.153 Y128.783 E.00533
G3 X129.375 Y126.91 I-.756 J-.784 E.13015
G1 X129.435 Y126.911 E.00185
G3 X130.301 Y128.607 I-.038 J1.088 E.07118
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517989
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.475 Y127.778 E.00649
G1 X129.314 Y127.779 E.00621
G1 X129.201 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00627
G1 X129.615 Y128.055 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 82.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05608
G1 X129.444 Y128.246 E-.08529
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10233
G1 X129.201 Y127.849 E-.10234
G1 X129.314 Y127.779 E-.0703
G1 X129.475 Y127.778 E-.08442
G1 X129.614 Y127.871 E-.08823
G1 X129.637 Y127.999 E-.06866
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 414/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L414
M991 S0 P413 ;notify layer change
G17
G3 Z83 I-.985 J.715 P1  F30000
G1 X129.943 Y128.421 Z83
G1 Z82.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.884 Y128.499 E.00325
G3 X129.388 Y127.303 I-.486 J-.499 E.09013
G1 X129.418 Y127.303 E.001
G3 X130.027 Y128.3 I-.02 J.697 E.04594
G1 X129.977 Y128.371 E.00289
G1 X130.27 Y128.656 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.153 Y128.783 E.00531
G3 X129.375 Y126.91 I-.756 J-.784 E.13015
G1 X129.435 Y126.911 E.00185
G3 X130.301 Y128.607 I-.038 J1.088 E.0712
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517994
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.475 Y127.778 E.00649
G1 X129.314 Y127.779 E.00621
G1 X129.2 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00627
G1 X129.615 Y128.055 E.00413
; CHANGE_LAYER
; Z_HEIGHT: 83
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05609
G1 X129.444 Y128.246 E-.08528
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10233
G1 X129.2 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07031
G1 X129.475 Y127.778 E-.08438
G1 X129.614 Y127.871 E-.08825
G1 X129.637 Y127.999 E-.06866
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 415/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L415
M991 S0 P414 ;notify layer change
G17
G3 Z83.2 I-.986 J.714 P1  F30000
G1 X129.943 Y128.421 Z83.2
G1 Z83
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.884 Y128.499 E.00322
G3 X129.388 Y127.303 I-.486 J-.499 E.09014
G1 X129.418 Y127.303 E.001
G3 X130.027 Y128.3 I-.02 J.697 E.04594
G1 X129.977 Y128.372 E.00291
G1 X130.27 Y128.656 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.153 Y128.783 E.00528
G3 X129.375 Y126.91 I-.757 J-.784 E.13016
G1 X129.435 Y126.911 E.00184
G3 X130.301 Y128.607 I-.038 J1.088 E.07121
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517998
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.474 Y127.778 E.00649
G1 X129.314 Y127.779 E.0062
G1 X129.201 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00627
G1 X129.615 Y128.055 E.00413
; CHANGE_LAYER
; Z_HEIGHT: 83.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.0561
G1 X129.444 Y128.246 E-.08527
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10234
G1 X129.201 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07032
G1 X129.474 Y127.778 E-.08434
G1 X129.614 Y127.871 E-.08827
G1 X129.637 Y127.999 E-.06867
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 416/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L416
M991 S0 P415 ;notify layer change
G17
G3 Z83.4 I-.986 J.713 P1  F30000
G1 X129.942 Y128.422 Z83.4
G1 Z83.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.884 Y128.499 E.0032
G3 X129.388 Y127.303 I-.486 J-.499 E.09014
G1 X129.418 Y127.303 E.00099
G3 X130.027 Y128.3 I-.02 J.697 E.04595
G1 X129.976 Y128.372 E.00293
G1 X130.269 Y128.657 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.153 Y128.783 E.00526
G3 X129.375 Y126.91 I-.757 J-.783 E.13016
G1 X129.434 Y126.911 E.00184
G3 X130.3 Y128.607 I-.038 J1.088 E.07123
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518007
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.474 Y127.778 E.00649
G1 X129.314 Y127.779 E.0062
G1 X129.201 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00627
G1 X129.615 Y128.055 E.00413
; CHANGE_LAYER
; Z_HEIGHT: 83.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05611
G1 X129.444 Y128.246 E-.08526
G1 X129.254 Y128.203 E-.10237
G1 X129.153 Y128.037 E-.10233
G1 X129.201 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07033
G1 X129.474 Y127.778 E-.0843
G1 X129.614 Y127.871 E-.08829
G1 X129.637 Y127.999 E-.06868
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 417/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L417
M991 S0 P416 ;notify layer change
G17
G3 Z83.6 I-.987 J.712 P1  F30000
G1 X129.942 Y128.422 Z83.6
G1 Z83.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.884 Y128.499 E.00318
G3 X129.388 Y127.303 I-.486 J-.499 E.09015
G1 X129.418 Y127.303 E.00099
G3 X130.027 Y128.3 I-.02 J.697 E.04595
G1 X129.976 Y128.373 E.00295
G1 X130.269 Y128.657 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.153 Y128.783 E.00523
G3 X129.375 Y126.91 I-.757 J-.783 E.13016
G1 X129.434 Y126.911 E.00183
G3 X130.3 Y128.608 I-.038 J1.088 E.07124
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518011
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.474 Y127.778 E.0065
G1 X129.314 Y127.779 E.0062
G1 X129.201 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00627
G1 X129.615 Y128.055 E.00413
; CHANGE_LAYER
; Z_HEIGHT: 83.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05611
G1 X129.444 Y128.246 E-.08525
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10234
G1 X129.201 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07033
G1 X129.474 Y127.778 E-.08428
G1 X129.614 Y127.871 E-.08831
G1 X129.637 Y127.999 E-.06869
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 418/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L418
M991 S0 P417 ;notify layer change
G17
G3 Z83.8 I-.988 J.711 P1  F30000
G1 X129.942 Y128.423 Z83.8
G1 Z83.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.884 Y128.499 E.00316
G3 X129.388 Y127.303 I-.486 J-.499 E.09015
G1 X129.418 Y127.303 E.00099
G3 X130.027 Y128.3 I-.02 J.697 E.04596
G1 X129.976 Y128.373 E.00296
G1 X130.268 Y128.658 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.154 Y128.783 E.00521
G3 X129.375 Y126.91 I-.757 J-.783 E.13016
G1 X129.434 Y126.911 E.00183
G3 X130.3 Y128.608 I-.037 J1.088 E.07126
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518017
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.474 Y127.778 E.0065
G1 X129.314 Y127.779 E.0062
G1 X129.201 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00627
G1 X129.615 Y128.055 E.00413
; CHANGE_LAYER
; Z_HEIGHT: 83.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05611
G1 X129.444 Y128.246 E-.08524
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10233
G1 X129.201 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07035
G1 X129.474 Y127.778 E-.08424
G1 X129.614 Y127.871 E-.08832
G1 X129.637 Y127.999 E-.06871
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 419/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L419
M991 S0 P418 ;notify layer change
G17
G3 Z84 I-.988 J.71 P1  F30000
G1 X129.941 Y128.423 Z84
G1 Z83.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.884 Y128.499 E.00314
G3 X129.388 Y127.303 I-.486 J-.499 E.09016
G1 X129.418 Y127.303 E.00098
G3 X130.027 Y128.3 I-.02 J.697 E.04596
G1 X129.976 Y128.374 E.00298
G1 X130.268 Y128.658 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.154 Y128.783 E.00519
G3 X129.375 Y126.91 I-.757 J-.783 E.13017
G1 X129.434 Y126.911 E.00183
G3 X130.3 Y128.608 I-.037 J1.088 E.07128
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518024
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.474 Y127.778 E.0065
G1 X129.314 Y127.779 E.00619
G1 X129.201 Y127.849 E.00517
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00627
G1 X129.615 Y128.055 E.00413
; CHANGE_LAYER
; Z_HEIGHT: 84
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05613
G1 X129.444 Y128.246 E-.08523
G1 X129.254 Y128.203 E-.10237
G1 X129.153 Y128.037 E-.10233
G1 X129.201 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07035
G1 X129.474 Y127.778 E-.08421
G1 X129.614 Y127.871 E-.08835
G1 X129.637 Y127.999 E-.0687
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 420/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L420
M991 S0 P419 ;notify layer change
G17
G3 Z84.2 I-.989 J.709 P1  F30000
G1 X129.941 Y128.423 Z84.2
G1 Z84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.884 Y128.498 E.00312
G3 X129.388 Y127.303 I-.486 J-.499 E.09016
G1 X129.418 Y127.303 E.00098
G3 X130.027 Y128.3 I-.02 J.697 E.04597
G1 X129.975 Y128.374 E.00299
G1 X130.268 Y128.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.154 Y128.783 E.00517
G3 X129.375 Y126.91 I-.757 J-.783 E.13017
G1 X129.434 Y126.911 E.00182
G3 X130.3 Y128.609 I-.037 J1.088 E.07129
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518028
G1 F1200
G1 X129.614 Y127.871 E.00505
G1 X129.474 Y127.778 E.0065
G1 X129.314 Y127.779 E.00619
G1 X129.201 Y127.849 E.00518
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00627
G1 X129.615 Y128.055 E.00413
; CHANGE_LAYER
; Z_HEIGHT: 84.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05613
G1 X129.444 Y128.246 E-.08523
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10234
G1 X129.201 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07037
G1 X129.474 Y127.778 E-.08417
G1 X129.614 Y127.871 E-.08836
G1 X129.637 Y127.999 E-.06872
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 421/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L421
M991 S0 P420 ;notify layer change
G17
G3 Z84.4 I-.989 J.709 P1  F30000
G1 X129.941 Y128.424 Z84.4
G1 Z84.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.885 Y128.498 E.00311
G3 X129.388 Y127.303 I-.487 J-.499 E.09016
G1 X129.417 Y127.303 E.00098
G3 X130.027 Y128.3 I-.019 J.697 E.04597
G1 X129.975 Y128.374 E.003
G1 X130.267 Y128.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.154 Y128.782 E.00516
G3 X129.375 Y126.91 I-.757 J-.783 E.13017
G1 X129.434 Y126.911 E.00182
G3 X130.299 Y128.609 I-.037 J1.088 E.07131
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518034
G1 F1200
G1 X129.614 Y127.871 E.00506
G1 X129.474 Y127.778 E.0065
G1 X129.314 Y127.779 E.00619
G1 X129.201 Y127.849 E.00518
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00627
G1 X129.615 Y128.055 E.00413
; CHANGE_LAYER
; Z_HEIGHT: 84.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05614
G1 X129.444 Y128.246 E-.08522
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10234
G1 X129.201 Y127.849 E-.10232
G1 X129.314 Y127.779 E-.07038
G1 X129.474 Y127.778 E-.08413
G1 X129.614 Y127.871 E-.08838
G1 X129.637 Y127.999 E-.06873
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 422/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L422
M991 S0 P421 ;notify layer change
G17
G3 Z84.6 I-.989 J.708 P1  F30000
G1 X129.941 Y128.424 Z84.6
G1 Z84.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.885 Y128.498 E.0031
G3 X129.388 Y127.303 I-.487 J-.499 E.09016
G1 X129.417 Y127.303 E.00097
G3 X130.027 Y128.3 I-.019 J.697 E.04598
G1 X129.975 Y128.375 E.00301
G1 X130.267 Y128.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.154 Y128.782 E.00515
G3 X129.375 Y126.91 I-.757 J-.783 E.13017
G1 X129.434 Y126.911 E.00181
M73 P84 R2
G3 X130.299 Y128.609 I-.037 J1.088 E.07132
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518039
G1 F1200
G1 X129.614 Y127.871 E.00506
G1 X129.474 Y127.778 E.0065
G1 X129.314 Y127.779 E.00619
G1 X129.201 Y127.849 E.00518
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00627
G1 X129.615 Y128.055 E.00413
; CHANGE_LAYER
; Z_HEIGHT: 84.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05616
G1 X129.444 Y128.246 E-.0852
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10234
G1 X129.201 Y127.849 E-.10234
G1 X129.314 Y127.779 E-.07036
G1 X129.474 Y127.778 E-.08412
G1 X129.614 Y127.871 E-.0884
G1 X129.637 Y127.999 E-.06873
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 423/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L423
M991 S0 P422 ;notify layer change
G17
G3 Z84.8 I-.99 J.708 P1  F30000
G1 X129.941 Y128.424 Z84.8
G1 Z84.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.885 Y128.498 E.00309
G3 X129.388 Y127.303 I-.487 J-.499 E.09017
G1 X129.417 Y127.303 E.00097
G3 X130.027 Y128.3 I-.019 J.697 E.04598
G1 X129.975 Y128.375 E.00301
G1 X130.267 Y128.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.154 Y128.782 E.00514
G3 X129.375 Y126.91 I-.757 J-.783 E.13017
G1 X129.434 Y126.911 E.00181
G3 X130.299 Y128.609 I-.037 J1.088 E.07133
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518045
G1 F1200
G1 X129.614 Y127.871 E.00506
G1 X129.474 Y127.778 E.0065
G1 X129.314 Y127.779 E.00618
G1 X129.201 Y127.849 E.00518
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00627
G1 X129.615 Y128.055 E.00413
; CHANGE_LAYER
; Z_HEIGHT: 84.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05618
G1 X129.444 Y128.246 E-.08518
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10234
G1 X129.201 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07037
G1 X129.474 Y127.778 E-.08409
G1 X129.614 Y127.871 E-.08842
G1 X129.637 Y127.999 E-.06873
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 424/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L424
M991 S0 P423 ;notify layer change
G17
G3 Z85 I-.99 J.708 P1  F30000
G1 X129.941 Y128.424 Z85
G1 Z84.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.885 Y128.498 E.00308
G3 X129.388 Y127.303 I-.487 J-.499 E.09017
G1 X129.417 Y127.303 E.00096
G3 X130.027 Y128.3 I-.019 J.697 E.04599
G1 X129.975 Y128.375 E.00302
G1 X130.267 Y128.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.154 Y128.782 E.00513
G3 X129.375 Y126.91 I-.757 J-.783 E.13018
G1 X129.434 Y126.911 E.00181
G3 X130.299 Y128.609 I-.037 J1.089 E.07134
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518051
G1 F1200
G1 X129.614 Y127.871 E.00506
G1 X129.474 Y127.778 E.00651
G1 X129.314 Y127.779 E.00618
G1 X129.201 Y127.849 E.00518
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.443 Y128.246 E.00753
G1 X129.577 Y128.155 E.00627
G1 X129.615 Y128.055 E.00413
; CHANGE_LAYER
; Z_HEIGHT: 85
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05617
G1 X129.443 Y128.246 E-.08519
G1 X129.254 Y128.203 E-.10235
G1 X129.153 Y128.037 E-.10234
G1 X129.201 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.0704
G1 X129.474 Y127.778 E-.08404
G1 X129.614 Y127.871 E-.08844
G1 X129.637 Y127.999 E-.06875
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 425/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L425
M991 S0 P424 ;notify layer change
G17
G3 Z85.2 I-.99 J.708 P1  F30000
G1 X129.941 Y128.424 Z85.2
G1 Z85
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.885 Y128.498 E.00308
G3 X129.388 Y127.303 I-.487 J-.499 E.09017
G1 X129.417 Y127.303 E.00096
G3 X130.027 Y128.3 I-.019 J.697 E.04599
G1 X129.975 Y128.375 E.00301
G1 X130.267 Y128.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.154 Y128.782 E.00513
G3 X129.375 Y126.91 I-.757 J-.783 E.13018
G1 X129.433 Y126.911 E.0018
G3 X130.299 Y128.609 I-.036 J1.089 E.07134
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518056
G1 F1200
G1 X129.614 Y127.871 E.00506
G1 X129.474 Y127.778 E.00651
G1 X129.314 Y127.779 E.00618
G1 X129.201 Y127.849 E.00518
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00626
G1 X129.615 Y128.055 E.00413
; CHANGE_LAYER
; Z_HEIGHT: 85.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05617
G1 X129.444 Y128.246 E-.08517
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10233
G1 X129.201 Y127.849 E-.10234
G1 X129.314 Y127.779 E-.07038
G1 X129.474 Y127.778 E-.08402
G1 X129.614 Y127.871 E-.08845
G1 X129.637 Y127.999 E-.06876
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 426/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L426
M991 S0 P425 ;notify layer change
G17
G3 Z85.4 I-.989 J.709 P1  F30000
G1 X129.941 Y128.424 Z85.4
G1 Z85.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.885 Y128.498 E.00308
G3 X129.388 Y127.303 I-.487 J-.499 E.09018
G1 X129.417 Y127.303 E.00096
G3 X130.027 Y128.3 I-.019 J.697 E.046
G1 X129.975 Y128.375 E.00301
G1 X130.267 Y128.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.154 Y128.782 E.00514
G3 X129.375 Y126.91 I-.757 J-.783 E.13018
G1 X129.433 Y126.911 E.0018
G3 X130.299 Y128.609 I-.036 J1.089 E.07134
M204 S10000
G1 X129.637 Y127.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518061
G1 F1200
G1 X129.614 Y127.871 E.00506
G1 X129.474 Y127.778 E.00651
G1 X129.314 Y127.779 E.00618
G1 X129.201 Y127.849 E.00518
G1 X129.153 Y128.037 E.00753
G1 X129.254 Y128.203 E.00753
G1 X129.444 Y128.246 E.00753
G1 X129.577 Y128.155 E.00626
G1 X129.615 Y128.055 E.00413
; CHANGE_LAYER
; Z_HEIGHT: 85.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.577 Y128.155 E-.05619
G1 X129.444 Y128.246 E-.08516
G1 X129.254 Y128.203 E-.10236
G1 X129.153 Y128.037 E-.10234
G1 X129.201 Y127.849 E-.10233
G1 X129.314 Y127.779 E-.07039
G1 X129.474 Y127.778 E-.08399
G1 X129.614 Y127.871 E-.08847
G1 X129.637 Y127.999 E-.06876
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 427/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L427
M991 S0 P426 ;notify layer change
G17
G3 Z85.6 I-.989 J.709 P1  F30000
G1 X129.941 Y128.424 Z85.6
G1 Z85.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.885 Y128.498 E.00309
G3 X129.388 Y127.303 I-.487 J-.499 E.09018
G1 X129.417 Y127.303 E.00095
G3 X130.027 Y128.3 I-.019 J.697 E.046
G1 X129.975 Y128.374 E.003
G1 X130.268 Y128.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.154 Y128.782 E.00515
G3 X129.375 Y126.91 I-.757 J-.783 E.13019
G1 X129.433 Y126.911 E.00179
G3 X130.3 Y128.609 I-.036 J1.089 E.07133
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518069
G1 F1200
G1 X129.584 Y127.831 E.00545
G1 X129.421 Y127.753 E.00703
G1 X129.231 Y127.822 E.00785
G1 X129.158 Y127.938 E.0053
G1 X129.186 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.525 Y128.214 E.00711
G1 X129.641 Y128.049 E.0078
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 85.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.0155
G1 X129.525 Y128.214 E-.10443
G1 X129.344 Y128.244 E-.09519
G1 X129.186 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07099
G1 X129.421 Y127.753 E-.10513
G1 X129.584 Y127.831 E-.09409
G1 X129.642 Y127.959 E-.07304
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 428/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L428
M991 S0 P427 ;notify layer change
G17
G3 Z85.8 I-1.023 J.66 P1  F30000
G1 X129.941 Y128.423 Z85.8
G1 Z85.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.885 Y128.498 E.0031
G3 X129.388 Y127.303 I-.487 J-.498 E.09019
G1 X129.417 Y127.303 E.00095
G3 X130.027 Y128.3 I-.019 J.697 E.04601
G1 X129.976 Y128.374 E.00298
G1 X130.268 Y128.658 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.154 Y128.782 E.00517
G3 X129.375 Y126.91 I-.757 J-.783 E.13019
G1 X129.433 Y126.911 E.00179
G3 X130.3 Y128.608 I-.036 J1.089 E.07132
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518074
G1 F1200
G1 X129.584 Y127.831 E.00545
G1 X129.421 Y127.753 E.00703
G1 X129.231 Y127.822 E.00785
G1 X129.158 Y127.938 E.0053
G1 X129.186 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.525 Y128.214 E.00711
G1 X129.641 Y128.049 E.0078
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 85.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.0155
G1 X129.525 Y128.214 E-.10442
G1 X129.344 Y128.244 E-.09519
G1 X129.186 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.071
G1 X129.421 Y127.753 E-.1051
G1 X129.584 Y127.831 E-.0941
G1 X129.642 Y127.959 E-.07306
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 429/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L429
M991 S0 P428 ;notify layer change
G17
G3 Z86 I-1.022 J.661 P1  F30000
G1 X129.942 Y128.423 Z86
G1 Z85.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.885 Y128.498 E.00312
G3 X129.388 Y127.303 I-.487 J-.498 E.09019
G1 X129.417 Y127.303 E.00094
G3 X130.027 Y128.3 I-.019 J.697 E.04601
G1 X129.976 Y128.373 E.00296
G1 X130.269 Y128.658 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.155 Y128.782 E.00518
G3 X129.375 Y126.91 I-.758 J-.783 E.13019
G1 X129.433 Y126.911 E.00179
G3 X130.3 Y128.608 I-.036 J1.089 E.07131
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518078
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.421 Y127.753 E.00703
G1 X129.231 Y127.822 E.00784
G1 X129.158 Y127.938 E.0053
G1 X129.186 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.525 Y128.214 E.00711
G1 X129.641 Y128.049 E.0078
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 86
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.01551
G1 X129.525 Y128.214 E-.10442
G1 X129.344 Y128.244 E-.09519
G1 X129.186 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.071
G1 X129.421 Y127.753 E-.10506
G1 X129.584 Y127.831 E-.09413
G1 X129.642 Y127.959 E-.07306
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 430/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L430
M991 S0 P429 ;notify layer change
G17
G3 Z86.2 I-1.021 J.662 P1  F30000
G1 X129.942 Y128.422 Z86.2
G1 Z86
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.885 Y128.498 E.00314
G3 X129.388 Y127.303 I-.487 J-.498 E.09019
G1 X129.417 Y127.303 E.00094
G3 X130.027 Y128.3 I-.018 J.697 E.04601
G1 X129.976 Y128.373 E.00294
G1 X130.269 Y128.657 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.155 Y128.782 E.00521
G3 X129.375 Y126.91 I-.758 J-.782 E.13019
G1 X129.433 Y126.911 E.00178
G3 X130.301 Y128.607 I-.036 J1.089 E.0713
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518082
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.421 Y127.753 E.00703
G1 X129.231 Y127.822 E.00784
G1 X129.158 Y127.938 E.0053
G1 X129.186 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.525 Y128.214 E.00711
G1 X129.641 Y128.049 E.0078
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 86.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.01551
G1 X129.525 Y128.214 E-.10441
G1 X129.344 Y128.244 E-.09519
G1 X129.186 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07101
G1 X129.421 Y127.753 E-.10505
G1 X129.584 Y127.831 E-.09414
G1 X129.642 Y127.959 E-.07307
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 431/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L431
M991 S0 P430 ;notify layer change
G17
G3 Z86.4 I-1.02 J.663 P1  F30000
G1 X129.943 Y128.422 Z86.4
G1 Z86.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.885 Y128.498 E.00316
G3 X129.388 Y127.303 I-.487 J-.498 E.0902
G1 X129.417 Y127.303 E.00094
G3 X130.027 Y128.3 I-.018 J.697 E.04602
G1 X129.977 Y128.372 E.00291
G1 X130.27 Y128.656 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.155 Y128.782 E.00524
G3 X129.375 Y126.91 I-.758 J-.782 E.13019
G1 X129.433 Y126.911 E.00178
G3 X130.301 Y128.607 I-.036 J1.089 E.07129
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518091
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.421 Y127.753 E.00703
G1 X129.231 Y127.822 E.00784
G1 X129.158 Y127.938 E.0053
G1 X129.186 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.525 Y128.214 E.00711
G1 X129.641 Y128.049 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 86.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.01551
G1 X129.525 Y128.214 E-.1044
G1 X129.344 Y128.244 E-.0952
G1 X129.186 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07101
G1 X129.421 Y127.753 E-.105
G1 X129.584 Y127.831 E-.09416
G1 X129.642 Y127.959 E-.07309
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 432/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L432
M991 S0 P431 ;notify layer change
G17
G3 Z86.6 I-1.019 J.665 P1  F30000
G1 X129.943 Y128.421 Z86.6
M73 P85 R2
G1 Z86.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.885 Y128.498 E.00318
G3 X129.388 Y127.303 I-.487 J-.498 E.0902
G1 X129.416 Y127.303 E.00093
G3 X130.027 Y128.3 I-.018 J.697 E.04603
G1 X129.977 Y128.372 E.00288
G1 X130.268 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.375 Y126.91 I-.871 J-.654 E.13546
G1 X129.433 Y126.911 E.00178
G3 X130.303 Y128.604 I-.035 J1.089 E.07119
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518098
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.421 Y127.753 E.00703
G1 X129.231 Y127.822 E.00784
G1 X129.158 Y127.938 E.0053
G1 X129.186 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.525 Y128.214 E.00711
G1 X129.641 Y128.049 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 86.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.01552
G1 X129.525 Y128.214 E-.10439
G1 X129.344 Y128.244 E-.0952
G1 X129.186 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07102
G1 X129.421 Y127.753 E-.10496
G1 X129.584 Y127.831 E-.09418
G1 X129.642 Y127.959 E-.07311
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 433/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L433
M991 S0 P432 ;notify layer change
G17
G3 Z86.8 I-1.018 J.666 P1  F30000
G1 X129.944 Y128.42 Z86.8
G1 Z86.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.886 Y128.498 E.00321
G3 X129.388 Y127.303 I-.487 J-.498 E.0902
G1 X129.416 Y127.303 E.00093
G3 X130.027 Y128.3 I-.018 J.697 E.04603
G1 X129.978 Y128.371 E.00285
G1 X130.271 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.653 E.0001
G3 X129.375 Y126.91 I-.871 J-.654 E.13546
G1 X129.432 Y126.911 E.00177
G3 X130.38 Y128.469 I-.035 J1.089 E.06642
G1 X130.301 Y128.603 E.00476
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5181
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.42 Y127.753 E.00703
G1 X129.231 Y127.822 E.00783
G1 X129.158 Y127.938 E.0053
G1 X129.186 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.525 Y128.214 E.00711
G1 X129.641 Y128.049 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 86.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.01553
G1 X129.525 Y128.214 E-.10438
G1 X129.344 Y128.244 E-.0952
G1 X129.186 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07102
G1 X129.42 Y127.753 E-.10493
G1 X129.584 Y127.831 E-.09421
G1 X129.642 Y127.959 E-.0731
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 434/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L434
M991 S0 P433 ;notify layer change
G17
G3 Z87 I-1.017 J.668 P1  F30000
G1 X129.944 Y128.419 Z87
G1 Z86.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.886 Y128.498 E.00323
G3 X129.388 Y127.303 I-.487 J-.498 E.09021
G1 X129.416 Y127.303 E.00092
G3 X130.027 Y128.3 I-.018 J.697 E.04603
G1 X129.978 Y128.37 E.00282
G1 X130.271 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00011
G3 X129.375 Y126.91 I-.871 J-.654 E.13545
G1 X129.432 Y126.911 E.00177
G3 X130.38 Y128.469 I-.035 J1.089 E.06642
G1 X130.302 Y128.602 E.00474
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51811
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.42 Y127.753 E.00704
G1 X129.231 Y127.822 E.00783
G1 X129.158 Y127.938 E.0053
G1 X129.186 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.525 Y128.214 E.00711
G1 X129.641 Y128.049 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 87
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.01553
G1 X129.525 Y128.214 E-.10437
G1 X129.344 Y128.244 E-.09521
G1 X129.186 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07102
G1 X129.42 Y127.753 E-.10489
G1 X129.584 Y127.831 E-.09423
G1 X129.642 Y127.959 E-.07312
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 435/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L435
M991 S0 P434 ;notify layer change
G17
G3 Z87.2 I-1.016 J.67 P1  F30000
G1 X129.945 Y128.419 Z87.2
G1 Z87
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.886 Y128.497 E.00326
G3 X129.388 Y127.303 I-.488 J-.498 E.09021
G1 X129.416 Y127.303 E.00092
G3 X130.027 Y128.3 I-.018 J.697 E.04604
G1 X129.979 Y128.369 E.00279
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00012
G3 X129.375 Y126.91 I-.871 J-.654 E.13545
G1 X129.432 Y126.911 E.00176
G3 X130.38 Y128.469 I-.035 J1.089 E.06643
G1 X130.302 Y128.602 E.00471
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518111
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.42 Y127.753 E.00704
G1 X129.231 Y127.822 E.00783
G1 X129.158 Y127.938 E.0053
G1 X129.186 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.525 Y128.214 E.00711
G1 X129.641 Y128.049 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 87.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.01554
G1 X129.525 Y128.214 E-.10437
G1 X129.344 Y128.244 E-.0952
G1 X129.186 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10082
G1 X129.231 Y127.822 E-.07102
G1 X129.42 Y127.753 E-.10487
G1 X129.584 Y127.831 E-.09425
G1 X129.642 Y127.959 E-.07312
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 436/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L436
M991 S0 P435 ;notify layer change
G17
G3 Z87.4 I-1.015 J.671 P1  F30000
G1 X129.945 Y128.418 Z87.4
G1 Z87.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.886 Y128.497 E.00329
G3 X129.388 Y127.303 I-.488 J-.498 E.09022
G1 X129.416 Y127.303 E.00092
G3 X130.027 Y128.3 I-.018 J.697 E.04604
G1 X129.979 Y128.369 E.00276
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00013
G3 X129.375 Y126.91 I-.871 J-.654 E.13545
G1 X129.432 Y126.911 E.00176
G3 X130.38 Y128.469 I-.035 J1.089 E.06643
G1 X130.302 Y128.601 E.00469
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518119
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.42 Y127.753 E.00704
G1 X129.231 Y127.822 E.00783
G1 X129.158 Y127.938 E.0053
G1 X129.186 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.525 Y128.214 E.00711
G1 X129.641 Y128.049 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 87.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.01555
G1 X129.525 Y128.214 E-.10436
G1 X129.344 Y128.244 E-.0952
G1 X129.186 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10082
G1 X129.231 Y127.822 E-.07103
G1 X129.42 Y127.753 E-.10483
G1 X129.584 Y127.831 E-.09427
G1 X129.642 Y127.959 E-.07314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 437/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L437
M991 S0 P436 ;notify layer change
G17
G3 Z87.6 I-1.014 J.673 P1  F30000
G1 X129.946 Y128.417 Z87.6
G1 Z87.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.886 Y128.497 E.00331
G3 X129.388 Y127.303 I-.488 J-.498 E.09022
G1 X129.416 Y127.303 E.00091
G3 X130.027 Y128.3 I-.018 J.697 E.04605
G1 X129.98 Y128.368 E.00273
G1 X130.273 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00015
G3 X129.375 Y126.91 I-.871 J-.654 E.13544
G1 X129.432 Y126.911 E.00176
G3 X130.38 Y128.47 I-.035 J1.089 E.06644
G1 X130.303 Y128.6 E.00467
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518126
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.42 Y127.753 E.00704
G1 X129.231 Y127.822 E.00782
G1 X129.158 Y127.938 E.0053
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.525 Y128.214 E.00711
G1 X129.641 Y128.049 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 87.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.01555
G1 X129.525 Y128.214 E-.10435
G1 X129.344 Y128.244 E-.09521
G1 X129.187 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07103
G1 X129.42 Y127.753 E-.10479
G1 X129.584 Y127.831 E-.0943
G1 X129.642 Y127.959 E-.07314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 438/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L438
M991 S0 P437 ;notify layer change
G17
G3 Z87.8 I-1.013 J.674 P1  F30000
G1 X129.946 Y128.417 Z87.8
G1 Z87.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.886 Y128.497 E.00333
G3 X129.388 Y127.303 I-.488 J-.498 E.09022
G1 X129.416 Y127.303 E.00091
G3 X130.027 Y128.3 I-.018 J.697 E.04605
G1 X129.98 Y128.367 E.00271
G1 X130.273 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00016
G3 X129.375 Y126.91 I-.871 J-.654 E.13544
G1 X129.432 Y126.911 E.00175
G3 X130.38 Y128.47 I-.035 J1.089 E.06644
G1 X130.303 Y128.6 E.00465
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518131
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.42 Y127.753 E.00704
G1 X129.231 Y127.822 E.00782
G1 X129.158 Y127.938 E.0053
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.525 Y128.214 E.00711
G1 X129.641 Y128.049 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 87.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.01555
G1 X129.525 Y128.214 E-.10434
G1 X129.344 Y128.244 E-.09522
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10082
G1 X129.231 Y127.822 E-.07104
G1 X129.42 Y127.753 E-.10476
G1 X129.584 Y127.831 E-.09431
G1 X129.642 Y127.959 E-.07316
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 439/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L439
M991 S0 P438 ;notify layer change
G17
G3 Z88 I-1.012 J.675 P1  F30000
G1 X129.947 Y128.416 Z88
G1 Z87.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.886 Y128.497 E.00335
G3 X129.388 Y127.303 I-.488 J-.498 E.09022
G1 X129.416 Y127.303 E.0009
G3 X130.027 Y128.3 I-.017 J.697 E.04606
G1 X129.981 Y128.367 E.00268
G1 X130.273 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00018
G3 X129.375 Y126.91 I-.871 J-.654 E.13544
G1 X129.432 Y126.911 E.00175
G3 X130.38 Y128.47 I-.034 J1.089 E.06645
G1 X130.304 Y128.599 E.00463
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518138
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.42 Y127.753 E.00704
G1 X129.231 Y127.822 E.00782
G1 X129.158 Y127.938 E.0053
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.049 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 88
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.01556
G1 X129.526 Y128.214 E-.10433
G1 X129.344 Y128.244 E-.09522
G1 X129.187 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07105
G1 X129.42 Y127.753 E-.10472
G1 X129.584 Y127.831 E-.09434
G1 X129.642 Y127.959 E-.07316
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 440/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L440
M991 S0 P439 ;notify layer change
G17
G3 Z88.2 I-1.012 J.676 P1  F30000
G1 X129.947 Y128.416 Z88.2
G1 Z88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.886 Y128.497 E.00337
G3 X129.389 Y127.303 I-.488 J-.498 E.09023
G1 X129.416 Y127.303 E.0009
G3 X130.027 Y128.3 I-.017 J.697 E.04606
G1 X129.981 Y128.366 E.00266
G1 X130.273 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00019
G3 X129.375 Y126.91 I-.871 J-.654 E.13544
G1 X129.432 Y126.911 E.00174
G3 X130.38 Y128.47 I-.034 J1.089 E.06646
G1 X130.304 Y128.599 E.00461
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518141
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.42 Y127.753 E.00704
G1 X129.231 Y127.822 E.00782
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.525 Y128.214 E.00711
G1 X129.641 Y128.049 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 88.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.049 E-.01556
G1 X129.525 Y128.214 E-.10433
G1 X129.344 Y128.244 E-.09522
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07105
G1 X129.42 Y127.753 E-.10469
G1 X129.584 Y127.831 E-.09435
G1 X129.642 Y127.959 E-.07318
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 441/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L441
M991 S0 P440 ;notify layer change
G17
G3 Z88.4 I-1.011 J.677 P1  F30000
G1 X129.947 Y128.415 Z88.4
G1 Z88.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.886 Y128.497 E.00338
G3 X129.389 Y127.303 I-.488 J-.498 E.09023
G1 X129.416 Y127.303 E.0009
G3 X130.027 Y128.3 I-.017 J.697 E.04607
G1 X129.981 Y128.366 E.00265
G1 X130.274 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00021
G3 X129.375 Y126.91 I-.87 J-.655 E.13543
G1 X129.432 Y126.911 E.00174
G3 X130.38 Y128.47 I-.034 J1.089 E.06646
G1 X130.304 Y128.599 E.0046
M204 S10000
M73 P85 R1
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518147
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.42 Y127.753 E.00705
G1 X129.231 Y127.822 E.00781
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 88.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01557
M73 P86 R1
G1 X129.526 Y128.214 E-.10431
G1 X129.344 Y128.244 E-.09522
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07106
G1 X129.42 Y127.753 E-.10465
G1 X129.584 Y127.831 E-.09438
G1 X129.642 Y127.959 E-.07318
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 442/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L442
M991 S0 P441 ;notify layer change
G17
G3 Z88.6 I-1.011 J.678 P1  F30000
G1 X129.947 Y128.415 Z88.6
G1 Z88.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.886 Y128.497 E.00339
G3 X129.389 Y127.303 I-.488 J-.498 E.09024
G1 X129.415 Y127.303 E.00089
G3 X130.027 Y128.3 I-.017 J.697 E.04607
G1 X129.982 Y128.366 E.00263
G1 X130.274 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00021
G3 X129.375 Y126.91 I-.87 J-.655 E.13543
G1 X129.431 Y126.911 E.00174
G3 X130.38 Y128.47 I-.034 J1.089 E.06647
G1 X130.304 Y128.598 E.00459
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518153
G1 F1200
G1 X129.584 Y127.831 E.00546
G1 X129.42 Y127.753 E.00705
G1 X129.231 Y127.822 E.00781
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 88.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01557
G1 X129.526 Y128.214 E-.10431
G1 X129.344 Y128.244 E-.09522
G1 X129.187 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07106
G1 X129.42 Y127.753 E-.10463
G1 X129.584 Y127.831 E-.09439
G1 X129.642 Y127.959 E-.07319
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 443/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L443
M991 S0 P442 ;notify layer change
G17
G3 Z88.8 I-1.011 J.678 P1  F30000
G1 X129.948 Y128.415 Z88.8
G1 Z88.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.886 Y128.497 E.00339
G3 X129.389 Y127.303 I-.488 J-.497 E.09024
G1 X129.415 Y127.303 E.00089
G3 X130.027 Y128.301 I-.017 J.697 E.04608
G1 X129.982 Y128.366 E.00263
G1 X130.274 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00022
G3 X129.375 Y126.91 I-.87 J-.655 E.13543
G1 X129.431 Y126.911 E.00173
G3 X130.38 Y128.47 I-.034 J1.089 E.06647
G1 X130.304 Y128.598 E.00458
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518159
G1 F1200
G1 X129.584 Y127.831 E.00547
G1 X129.42 Y127.753 E.00705
G1 X129.231 Y127.822 E.00781
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 88.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01558
G1 X129.526 Y128.214 E-.10431
G1 X129.344 Y128.244 E-.09522
G1 X129.187 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07106
G1 X129.42 Y127.753 E-.10459
G1 X129.584 Y127.831 E-.09441
G1 X129.642 Y127.959 E-.0732
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 444/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L444
M991 S0 P443 ;notify layer change
G17
G3 Z89 I-1.011 J.678 P1  F30000
G1 X129.948 Y128.415 Z89
G1 Z88.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.887 Y128.497 E.00339
G3 X129.389 Y127.303 I-.488 J-.497 E.09024
G1 X129.415 Y127.303 E.00088
G3 X130.027 Y128.301 I-.017 J.697 E.04608
G1 X129.982 Y128.366 E.00263
G1 X130.274 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00022
G3 X129.375 Y126.91 I-.87 J-.655 E.13543
G1 X129.431 Y126.911 E.00173
G3 X130.38 Y128.47 I-.034 J1.089 E.06648
G1 X130.304 Y128.598 E.00458
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518165
G1 F1200
G1 X129.584 Y127.831 E.00547
G1 X129.42 Y127.753 E.00705
G1 X129.231 Y127.822 E.00781
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 89
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01558
G1 X129.526 Y128.214 E-.1043
G1 X129.344 Y128.244 E-.09522
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07107
G1 X129.42 Y127.753 E-.10455
G1 X129.584 Y127.831 E-.09444
G1 X129.642 Y127.959 E-.07321
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 445/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L445
M991 S0 P444 ;notify layer change
G17
G3 Z89.2 I-1.011 J.678 P1  F30000
G1 X129.947 Y128.415 Z89.2
G1 Z89
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.887 Y128.497 E.00338
G3 X129.389 Y127.303 I-.488 J-.497 E.09025
G1 X129.415 Y127.303 E.00088
G3 X130.027 Y128.301 I-.017 J.697 E.04609
G1 X129.982 Y128.366 E.00263
G1 X130.274 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00022
G3 X129.375 Y126.91 I-.87 J-.655 E.13542
G1 X129.431 Y126.911 E.00173
G3 X130.38 Y128.47 I-.034 J1.089 E.06649
G1 X130.304 Y128.598 E.00458
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518171
G1 F1200
G1 X129.584 Y127.831 E.00547
G1 X129.42 Y127.753 E.00705
G1 X129.231 Y127.822 E.0078
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00779
G1 X129.641 Y128.02 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 89.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01558
G1 X129.526 Y128.214 E-.10429
G1 X129.344 Y128.244 E-.09523
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07108
G1 X129.42 Y127.753 E-.10452
G1 X129.584 Y127.831 E-.09445
G1 X129.642 Y127.96 E-.07324
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 446/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L446
M991 S0 P445 ;notify layer change
G17
G3 Z89.4 I-1.011 J.677 P1  F30000
G1 X129.947 Y128.416 Z89.4
G1 Z89.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.887 Y128.497 E.00336
G3 X129.389 Y127.303 I-.488 J-.497 E.09025
G1 X129.415 Y127.303 E.00087
G3 X130.027 Y128.301 I-.017 J.697 E.04609
G1 X129.981 Y128.366 E.00265
G1 X130.274 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00021
G3 X129.375 Y126.91 I-.87 J-.655 E.13542
G1 X129.431 Y126.911 E.00172
G3 X130.38 Y128.47 I-.033 J1.089 E.06649
G1 X130.304 Y128.599 E.00459
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518177
G1 F1200
G1 X129.584 Y127.831 E.00547
G1 X129.42 Y127.753 E.00705
G1 X129.231 Y127.822 E.0078
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00779
G1 X129.641 Y128.02 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 89.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01559
G1 X129.526 Y128.214 E-.10428
G1 X129.344 Y128.244 E-.09523
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10082
G1 X129.231 Y127.822 E-.07108
G1 X129.42 Y127.753 E-.10448
G1 X129.584 Y127.831 E-.09448
G1 X129.642 Y127.96 E-.07324
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 447/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L447
M991 S0 P446 ;notify layer change
G17
G3 Z89.6 I-1.012 J.676 P1  F30000
G1 X129.947 Y128.416 Z89.6
G1 Z89.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.887 Y128.497 E.00333
G3 X129.389 Y127.303 I-.488 J-.497 E.09025
G1 X129.415 Y127.303 E.00087
G3 X130.027 Y128.301 I-.016 J.697 E.0461
G1 X129.981 Y128.367 E.00267
G1 X130.273 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.0002
G3 X129.375 Y126.91 I-.87 J-.655 E.13542
G1 X129.431 Y126.911 E.00172
G3 X130.38 Y128.47 I-.033 J1.089 E.0665
G1 X130.304 Y128.599 E.00461
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518184
G1 F1200
G1 X129.584 Y127.831 E.00547
G1 X129.42 Y127.753 E.00706
G1 X129.231 Y127.822 E.0078
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00779
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 89.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.0156
G1 X129.526 Y128.214 E-.10427
G1 X129.344 Y128.244 E-.09524
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.1008
G1 X129.231 Y127.822 E-.07109
G1 X129.42 Y127.753 E-.10444
G1 X129.584 Y127.831 E-.0945
G1 X129.642 Y127.959 E-.07324
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 448/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L448
M991 S0 P447 ;notify layer change
G17
G3 Z89.8 I-1.013 J.674 P1  F30000
G1 X129.946 Y128.417 Z89.8
G1 Z89.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.887 Y128.497 E.0033
G3 X129.389 Y127.303 I-.488 J-.497 E.09025
G1 X129.415 Y127.303 E.00087
G3 X130.027 Y128.301 I-.016 J.697 E.0461
G1 X129.98 Y128.368 E.0027
G1 X130.273 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00018
G3 X129.375 Y126.91 I-.87 J-.655 E.13541
G1 X129.431 Y126.911 E.00171
G3 X130.38 Y128.47 I-.033 J1.089 E.06651
G1 X130.303 Y128.6 E.00463
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518188
G1 F1200
G1 X129.584 Y127.831 E.00547
G1 X129.42 Y127.753 E.00706
G1 X129.231 Y127.822 E.0078
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.019 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 89.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.0156
G1 X129.526 Y128.214 E-.10426
G1 X129.344 Y128.244 E-.09524
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10082
G1 X129.231 Y127.822 E-.07108
G1 X129.42 Y127.753 E-.10442
G1 X129.584 Y127.831 E-.09451
G1 X129.642 Y127.96 E-.07326
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 449/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L449
M991 S0 P448 ;notify layer change
G17
G3 Z90 I-1.015 J.672 P1  F30000
G1 X129.946 Y128.418 Z90
G1 Z89.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.887 Y128.496 E.00325
G3 X129.389 Y127.303 I-.488 J-.497 E.09026
G1 X129.415 Y127.303 E.00086
G3 X130.027 Y128.301 I-.016 J.697 E.04611
G1 X129.98 Y128.369 E.00274
G1 X130.272 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00015
G3 X129.375 Y126.91 I-.87 J-.655 E.13541
G1 X129.431 Y126.911 E.00171
G3 X130.38 Y128.47 I-.033 J1.089 E.06651
G1 X130.303 Y128.601 E.00466
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518194
G1 F1200
G1 X129.584 Y127.831 E.00547
G1 X129.419 Y127.753 E.00706
G1 X129.231 Y127.822 E.00779
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.02 E.00116
; CHANGE_LAYER
; Z_HEIGHT: 90
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.0156
G1 X129.526 Y128.214 E-.10425
G1 X129.344 Y128.244 E-.09524
G1 X129.187 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.1008
G1 X129.231 Y127.822 E-.0711
G1 X129.419 Y127.753 E-.10438
G1 X129.584 Y127.831 E-.09453
G1 X129.642 Y127.96 E-.07328
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 450/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L450
M991 S0 P449 ;notify layer change
G17
G3 Z90.2 I-1.016 J.67 P1  F30000
G1 X129.945 Y128.419 Z90.2
G1 Z90
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.887 Y128.496 E.0032
G3 X129.389 Y127.303 I-.489 J-.497 E.09026
G1 X129.415 Y127.303 E.00086
G3 X130.027 Y128.301 I-.016 J.697 E.04611
G1 X129.979 Y128.37 E.00279
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.00013
G3 X129.375 Y126.91 I-.87 J-.655 E.13541
G1 X129.43 Y126.911 E.00171
G3 X130.38 Y128.47 I-.033 J1.089 E.06652
G1 X130.302 Y128.601 E.00469
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5182
G1 F1200
G1 X129.584 Y127.831 E.00547
G1 X129.419 Y127.753 E.00706
G1 X129.231 Y127.822 E.00779
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.019 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 90.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01561
G1 X129.526 Y128.214 E-.10425
G1 X129.344 Y128.244 E-.09524
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.0711
G1 X129.419 Y127.753 E-.10435
G1 X129.584 Y127.831 E-.09456
G1 X129.642 Y127.959 E-.07327
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 451/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L451
M991 S0 P450 ;notify layer change
G17
G3 Z90.4 I-1.018 J.667 P1  F30000
G1 X129.944 Y128.42 Z90.4
G1 Z90.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.887 Y128.496 E.00315
G3 X129.389 Y127.303 I-.489 J-.497 E.09026
G1 X129.415 Y127.303 E.00085
G3 X130.027 Y128.301 I-.016 J.697 E.04612
G1 X129.978 Y128.371 E.00284
G1 X130.271 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.654 E.0001
G3 X129.375 Y126.91 I-.87 J-.655 E.13541
G1 X129.43 Y126.911 E.0017
G3 X130.38 Y128.47 I-.033 J1.089 E.06652
G1 X130.302 Y128.603 E.00473
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518209
G1 F1200
G1 X129.584 Y127.831 E.00547
G1 X129.419 Y127.753 E.00706
G1 X129.231 Y127.822 E.00779
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.019 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 90.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
M73 P87 R1
G1 X129.641 Y128.05 E-.01562
G1 X129.526 Y128.214 E-.10424
G1 X129.344 Y128.244 E-.09525
G1 X129.187 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.1008
G1 X129.231 Y127.822 E-.0711
G1 X129.419 Y127.753 E-.10431
G1 X129.584 Y127.831 E-.09458
G1 X129.642 Y127.959 E-.07328
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 452/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L452
M991 S0 P451 ;notify layer change
G17
G3 Z90.6 I-1.02 J.664 P1  F30000
G1 X129.943 Y128.422 Z90.6
G1 Z90.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.887 Y128.496 E.00309
G3 X129.389 Y127.303 I-.489 J-.497 E.09027
G1 X129.414 Y127.303 E.00085
G3 X130.027 Y128.301 I-.016 J.697 E.04612
G1 X129.977 Y128.372 E.00289
G1 X130.268 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.375 Y126.91 I-.87 J-.655 E.1354
G1 X129.43 Y126.911 E.0017
G3 X130.303 Y128.606 I-.032 J1.089 E.07133
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518211
G1 F1200
G1 X129.584 Y127.831 E.00547
G1 X129.419 Y127.753 E.00706
G1 X129.231 Y127.822 E.00779
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.019 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 90.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01562
G1 X129.526 Y128.214 E-.10423
G1 X129.344 Y128.244 E-.09524
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.0711
G1 X129.419 Y127.753 E-.10428
G1 X129.584 Y127.831 E-.09459
G1 X129.642 Y127.959 E-.0733
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 453/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L453
M991 S0 P452 ;notify layer change
G17
G3 Z90.8 I-1.022 J.661 P1  F30000
G1 X129.942 Y128.423 Z90.8
G1 Z90.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.887 Y128.496 E.00302
G3 X129.389 Y127.303 I-.489 J-.497 E.09027
G1 X129.414 Y127.303 E.00085
G3 X130.027 Y128.301 I-.016 J.697 E.04613
G1 X129.976 Y128.374 E.00295
G1 X130.269 Y128.657 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.157 Y128.78 E.00512
G3 X129.375 Y126.91 I-.759 J-.781 E.13024
G1 X129.43 Y126.911 E.00169
G3 X130.301 Y128.608 I-.032 J1.089 E.07143
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518214
G1 F1200
G1 X129.584 Y127.831 E.00547
G1 X129.419 Y127.753 E.00706
G1 X129.231 Y127.822 E.00778
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.019 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 90.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01563
G1 X129.526 Y128.214 E-.10423
G1 X129.344 Y128.244 E-.09525
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07111
G1 X129.419 Y127.753 E-.10426
G1 X129.584 Y127.831 E-.09461
G1 X129.642 Y127.959 E-.0733
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 454/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L454
M991 S0 P453 ;notify layer change
G17
G3 Z91 I-1.024 J.658 P1  F30000
G1 X129.941 Y128.425 Z91
G1 Z90.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.887 Y128.496 E.00296
G3 X129.389 Y127.303 I-.489 J-.497 E.09027
G1 X129.414 Y127.303 E.00084
G3 X130.027 Y128.301 I-.016 J.697 E.04613
G1 X129.975 Y128.375 E.00301
G1 X130.268 Y128.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.157 Y128.78 E.00504
G3 X129.375 Y126.91 I-.759 J-.781 E.13024
G1 X129.43 Y126.911 E.00169
G3 X130.3 Y128.609 I-.032 J1.089 E.07147
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518221
G1 F1200
G1 X129.584 Y127.831 E.00547
G1 X129.419 Y127.753 E.00707
G1 X129.231 Y127.822 E.00778
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.019 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 91
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01563
G1 X129.526 Y128.214 E-.10422
G1 X129.344 Y128.244 E-.09525
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07112
G1 X129.419 Y127.753 E-.10421
G1 X129.584 Y127.831 E-.09464
G1 X129.642 Y127.96 E-.07331
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 455/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L455
M991 S0 P454 ;notify layer change
G17
G3 Z91.2 I-1.026 J.655 P1  F30000
G1 X129.94 Y128.426 Z91.2
G1 Z91
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.887 Y128.496 E.00289
G3 X129.389 Y127.303 I-.489 J-.497 E.09028
G1 X129.414 Y127.303 E.00084
G3 X130.027 Y128.301 I-.016 J.697 E.04614
G1 X129.974 Y128.377 E.00308
G1 X130.266 Y128.661 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.157 Y128.78 E.00497
G3 X129.375 Y126.91 I-.759 J-.781 E.13025
G1 X129.43 Y126.911 E.00169
G3 X130.299 Y128.611 I-.032 J1.089 E.07154
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518229
G1 F1200
G1 X129.584 Y127.831 E.00547
G1 X129.419 Y127.753 E.00707
G1 X129.231 Y127.822 E.00778
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 91.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01563
G1 X129.526 Y128.214 E-.10421
G1 X129.344 Y128.244 E-.09525
G1 X129.187 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07112
G1 X129.419 Y127.753 E-.10418
G1 X129.584 Y127.831 E-.09466
G1 X129.642 Y127.96 E-.07333
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 456/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L456
M991 S0 P455 ;notify layer change
G17
G3 Z91.4 I-1.028 J.651 P1  F30000
G1 X129.939 Y128.428 Z91.4
G1 Z91.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.888 Y128.496 E.00283
G3 X129.389 Y127.303 I-.489 J-.497 E.09028
G1 X129.414 Y127.303 E.00084
G3 X130.027 Y128.301 I-.015 J.697 E.04614
G1 X129.973 Y128.379 E.00314
G1 X130.265 Y128.662 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.157 Y128.78 E.00489
G3 X129.375 Y126.91 I-.759 J-.781 E.13025
G1 X129.43 Y126.911 E.00168
G3 X130.298 Y128.613 I-.032 J1.089 E.07161
M204 S10000
G1 X129.642 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518234
G1 F1200
G1 X129.584 Y127.831 E.00548
G1 X129.419 Y127.753 E.00707
G1 X129.231 Y127.822 E.00778
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.019 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 91.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01564
G1 X129.526 Y128.214 E-.10421
G1 X129.344 Y128.244 E-.09525
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07113
G1 X129.419 Y127.753 E-.10414
G1 X129.584 Y127.831 E-.09468
G1 X129.642 Y127.959 E-.07333
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 457/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L457
M991 S0 P456 ;notify layer change
G17
G3 Z91.6 I-1.03 J.648 P1  F30000
G1 X129.938 Y128.429 Z91.6
G1 Z91.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.888 Y128.496 E.00276
G3 X129.389 Y127.303 I-.489 J-.497 E.09028
G1 X129.414 Y127.303 E.00083
G3 X130.027 Y128.301 I-.015 J.697 E.04615
G1 X129.972 Y128.38 E.0032
G1 X130.263 Y128.664 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.157 Y128.78 E.00482
G3 X129.375 Y126.91 I-.759 J-.781 E.13025
G1 X129.43 Y126.911 E.00168
G3 X130.297 Y128.615 I-.032 J1.089 E.07168
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518241
G1 F1200
G1 X129.584 Y127.831 E.00548
G1 X129.419 Y127.753 E.00707
G1 X129.231 Y127.822 E.00777
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.019 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 91.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01564
G1 X129.526 Y128.214 E-.1042
G1 X129.344 Y128.244 E-.09526
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07114
G1 X129.419 Y127.753 E-.1041
G1 X129.584 Y127.831 E-.09471
G1 X129.642 Y127.96 E-.07334
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 458/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L458
M991 S0 P457 ;notify layer change
G17
G3 Z91.8 I-1.032 J.645 P1  F30000
G1 X129.937 Y128.431 Z91.8
G1 Z91.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.888 Y128.496 E.0027
G3 X129.389 Y127.303 I-.489 J-.496 E.09029
G1 X129.414 Y127.303 E.00083
G3 X130.027 Y128.301 I-.015 J.697 E.04615
G1 X129.971 Y128.381 E.00325
G1 X130.262 Y128.666 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.157 Y128.78 E.00475
G3 X129.375 Y126.91 I-.759 J-.781 E.13025
G1 X129.43 Y126.911 E.00167
G3 X130.296 Y128.616 I-.032 J1.089 E.07175
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518246
G1 F1200
G1 X129.584 Y127.831 E.00548
G1 X129.419 Y127.753 E.00707
G1 X129.231 Y127.822 E.00777
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 91.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01564
G1 X129.526 Y128.214 E-.10419
G1 X129.344 Y128.244 E-.09525
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07113
G1 X129.419 Y127.753 E-.10407
G1 X129.584 Y127.831 E-.09472
G1 X129.642 Y127.96 E-.07336
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 459/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L459
M991 S0 P458 ;notify layer change
G17
G3 Z92 I-1.034 J.642 P1  F30000
G1 X129.936 Y128.432 Z92
G1 Z91.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.888 Y128.496 E.00265
G3 X129.389 Y127.303 I-.489 J-.496 E.09029
G1 X129.414 Y127.303 E.00082
G3 X130.027 Y128.301 I-.015 J.697 E.04616
G1 X129.97 Y128.383 E.00331
G1 X130.26 Y128.667 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.158 Y128.78 E.00469
G3 X129.375 Y126.91 I-.759 J-.781 E.13025
G1 X129.429 Y126.911 E.00167
G3 X130.295 Y128.618 I-.031 J1.089 E.07182
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518252
G1 F1200
G1 X129.584 Y127.831 E.00548
G1 X129.419 Y127.753 E.00707
G1 X129.231 Y127.822 E.00777
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 92
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01565
G1 X129.526 Y128.214 E-.10418
G1 X129.344 Y128.244 E-.09526
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07114
G1 X129.419 Y127.753 E-.10404
G1 X129.584 Y127.831 E-.09473
G1 X129.642 Y127.96 E-.07337
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 460/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L460
M991 S0 P459 ;notify layer change
G17
G3 Z92.2 I-1.035 J.64 P1  F30000
G1 X129.935 Y128.433 Z92.2
G1 Z92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.888 Y128.496 E.00259
G3 X129.389 Y127.303 I-.489 J-.496 E.0903
G1 X129.414 Y127.303 E.00082
G3 X130.027 Y128.301 I-.015 J.697 E.04616
G1 X129.969 Y128.384 E.00336
G1 X130.259 Y128.668 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.158 Y128.78 E.00463
G3 X129.375 Y126.91 I-.76 J-.781 E.13026
G1 X129.429 Y126.911 E.00167
G3 X130.294 Y128.619 I-.031 J1.089 E.07188
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518255
G1 F1200
G1 X129.584 Y127.83 E.00548
G1 X129.419 Y127.753 E.00707
G1 X129.231 Y127.822 E.00777
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 92.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01565
G1 X129.526 Y128.214 E-.10418
G1 X129.344 Y128.244 E-.09526
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07114
G1 X129.419 Y127.753 E-.10401
G1 X129.584 Y127.83 E-.09476
G1 X129.642 Y127.96 E-.07338
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 461/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L461
M991 S0 P460 ;notify layer change
G17
G3 Z92.4 I-1.036 J.638 P1  F30000
G1 X129.934 Y128.434 Z92.4
G1 Z92.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.888 Y128.496 E.00255
G3 X129.389 Y127.303 I-.489 J-.496 E.0903
G1 X129.414 Y127.303 E.00081
G3 X130.027 Y128.301 I-.015 J.697 E.04617
G1 X129.968 Y128.385 E.0034
G1 X130.258 Y128.67 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.158 Y128.78 E.00458
G3 X129.375 Y126.91 I-.76 J-.78 E.13026
G1 X129.429 Y126.911 E.00166
G3 X130.293 Y128.621 I-.031 J1.089 E.07193
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518263
G1 F1200
G1 X129.584 Y127.83 E.00548
G1 X129.419 Y127.753 E.00708
G1 X129.231 Y127.822 E.00776
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 92.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
M73 P88 R1
G1 X129.641 Y128.05 E-.01566
G1 X129.526 Y128.214 E-.10417
G1 X129.344 Y128.244 E-.09527
G1 X129.187 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.1008
G1 X129.231 Y127.822 E-.07115
G1 X129.419 Y127.753 E-.10397
G1 X129.584 Y127.83 E-.09477
G1 X129.642 Y127.96 E-.0734
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 462/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L462
M991 S0 P461 ;notify layer change
G17
G3 Z92.6 I-1.038 J.636 P1  F30000
G1 X129.933 Y128.435 Z92.6
G1 Z92.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.888 Y128.496 E.00251
G3 X129.389 Y127.303 I-.489 J-.496 E.0903
G1 X129.413 Y127.303 E.00081
G3 X130.027 Y128.301 I-.015 J.697 E.04617
G1 X129.968 Y128.386 E.00344
G1 X130.257 Y128.67 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.158 Y128.78 E.00454
G3 X129.375 Y126.91 I-.76 J-.78 E.13026
G1 X129.429 Y126.911 E.00166
G3 X130.292 Y128.622 I-.031 J1.089 E.07197
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518268
G1 F1200
G1 X129.584 Y127.83 E.00548
G1 X129.419 Y127.753 E.00708
G1 X129.231 Y127.822 E.00776
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 92.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01566
G1 X129.526 Y128.214 E-.10416
G1 X129.344 Y128.244 E-.09527
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.1008
G1 X129.231 Y127.822 E-.07116
G1 X129.419 Y127.753 E-.10394
G1 X129.584 Y127.83 E-.09479
G1 X129.642 Y127.96 E-.0734
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 463/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L463
M991 S0 P462 ;notify layer change
G17
G3 Z92.8 I-1.038 J.635 P1  F30000
G1 X129.933 Y128.436 Z92.8
G1 Z92.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.888 Y128.496 E.00248
G3 X129.389 Y127.303 I-.489 J-.496 E.0903
G1 X129.413 Y127.303 E.00081
G3 X130.027 Y128.301 I-.015 J.697 E.04618
G1 X129.967 Y128.387 E.00346
G1 X130.257 Y128.671 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.158 Y128.78 E.00451
G3 X129.375 Y126.91 I-.76 J-.78 E.13026
G1 X129.429 Y126.911 E.00165
G3 X130.292 Y128.622 I-.031 J1.089 E.072
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518276
G1 F1200
G1 X129.584 Y127.83 E.00548
G1 X129.419 Y127.753 E.00708
G1 X129.231 Y127.822 E.00776
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 92.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01567
G1 X129.526 Y128.214 E-.10415
G1 X129.344 Y128.244 E-.09527
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07116
G1 X129.419 Y127.753 E-.1039
G1 X129.584 Y127.83 E-.09482
G1 X129.642 Y127.96 E-.0734
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 464/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L464
M991 S0 P463 ;notify layer change
G17
G3 Z93 I-1.039 J.634 P1  F30000
G1 X129.933 Y128.436 Z93
G1 Z92.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.888 Y128.496 E.00246
G3 X129.389 Y127.303 I-.489 J-.496 E.09031
G1 X129.413 Y127.303 E.0008
G3 X130.027 Y128.301 I-.014 J.697 E.04618
G1 X129.967 Y128.387 E.00348
G1 X130.257 Y128.671 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.158 Y128.78 E.00449
G3 X129.375 Y126.91 I-.76 J-.78 E.13026
G1 X129.429 Y126.911 E.00165
G3 X130.291 Y128.623 I-.031 J1.089 E.07202
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51828
G1 F1200
G1 X129.584 Y127.83 E.00548
G1 X129.419 Y127.753 E.00708
G1 X129.231 Y127.822 E.00776
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.019 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 93
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01568
G1 X129.526 Y128.214 E-.10414
G1 X129.344 Y128.244 E-.09527
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.1008
G1 X129.231 Y127.822 E-.07117
G1 X129.419 Y127.753 E-.10388
G1 X129.584 Y127.83 E-.09483
G1 X129.642 Y127.96 E-.07342
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 465/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L465
M991 S0 P464 ;notify layer change
G17
G3 Z93.2 I-1.039 J.633 P1  F30000
G1 X129.933 Y128.436 Z93.2
G1 Z93
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.888 Y128.495 E.00245
G3 X129.389 Y127.303 I-.49 J-.496 E.09031
G1 X129.413 Y127.303 E.0008
G3 X130.027 Y128.301 I-.014 J.697 E.04619
G1 X129.967 Y128.387 E.00348
G1 X130.257 Y128.672 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.158 Y128.78 E.00449
G3 X129.375 Y126.91 I-.76 J-.78 E.13026
G1 X129.429 Y126.911 E.00165
G3 X130.291 Y128.623 I-.03 J1.089 E.07203
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518285
G1 F1200
G1 X129.584 Y127.83 E.00548
G1 X129.418 Y127.753 E.00708
G1 X129.231 Y127.822 E.00775
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00778
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 93.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01568
G1 X129.526 Y128.214 E-.10414
G1 X129.344 Y128.244 E-.09527
G1 X129.187 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07117
G1 X129.418 Y127.753 E-.10384
G1 X129.584 Y127.83 E-.09485
G1 X129.642 Y127.96 E-.07343
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 466/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L466
M991 S0 P465 ;notify layer change
G17
G3 Z93.4 I-1.039 J.634 P1  F30000
G1 X129.933 Y128.436 Z93.4
G1 Z93.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.888 Y128.495 E.00245
G3 X129.389 Y127.303 I-.49 J-.496 E.09031
G1 X129.413 Y127.303 E.0008
G3 X130.027 Y128.301 I-.014 J.697 E.0462
G1 X129.967 Y128.387 E.00348
G1 X130.257 Y128.671 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.158 Y128.779 E.0045
G3 X129.375 Y126.91 I-.76 J-.78 E.13027
G1 X129.429 Y126.911 E.00164
G3 X130.292 Y128.622 I-.03 J1.089 E.07202
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518291
G1 F1200
G1 X129.584 Y127.83 E.00548
G1 X129.418 Y127.753 E.00708
G1 X129.231 Y127.822 E.00775
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 93.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01568
G1 X129.526 Y128.214 E-.10413
G1 X129.344 Y128.244 E-.09528
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.1008
G1 X129.231 Y127.822 E-.07117
G1 X129.418 Y127.753 E-.10381
G1 X129.584 Y127.83 E-.09487
G1 X129.642 Y127.96 E-.07344
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 467/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L467
M991 S0 P466 ;notify layer change
G17
G3 Z93.6 I-1.038 J.635 P1  F30000
G1 X129.933 Y128.436 Z93.6
G1 Z93.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.889 Y128.495 E.00246
G3 X129.389 Y127.303 I-.49 J-.496 E.09032
G1 X129.413 Y127.303 E.00079
G3 X130.027 Y128.301 I-.014 J.697 E.0462
G1 X129.967 Y128.387 E.00346
G1 X130.258 Y128.67 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.158 Y128.779 E.00453
G3 X129.375 Y126.91 I-.76 J-.78 E.13027
G1 X129.428 Y126.911 E.00164
G3 X130.292 Y128.622 I-.03 J1.089 E.072
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518295
G1 F1200
G1 X129.584 Y127.83 E.00548
G1 X129.418 Y127.753 E.00709
G1 X129.231 Y127.822 E.00775
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 93.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01568
G1 X129.526 Y128.214 E-.10412
G1 X129.344 Y128.244 E-.09528
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07117
G1 X129.418 Y127.753 E-.10377
G1 X129.584 Y127.83 E-.0949
G1 X129.642 Y127.96 E-.07346
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 468/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L468
M991 S0 P467 ;notify layer change
G17
G3 Z93.8 I-1.037 J.636 P1  F30000
G1 X129.934 Y128.435 Z93.8
G1 Z93.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.889 Y128.495 E.00249
G3 X129.389 Y127.303 I-.49 J-.496 E.09032
G1 X129.413 Y127.303 E.00079
G3 X130.027 Y128.301 I-.014 J.697 E.04621
G1 X129.968 Y128.386 E.00343
G1 X130.259 Y128.669 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.158 Y128.779 E.00457
G3 X129.375 Y126.91 I-.76 J-.78 E.13027
G1 X129.428 Y126.911 E.00164
G3 X130.293 Y128.62 I-.03 J1.089 E.07195
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518302
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.418 Y127.753 E.00709
G1 X129.231 Y127.822 E.00775
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 93.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01569
G1 X129.526 Y128.214 E-.10411
G1 X129.344 Y128.244 E-.09529
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07118
G1 X129.418 Y127.753 E-.10374
G1 X129.584 Y127.83 E-.09491
G1 X129.642 Y127.96 E-.07346
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 469/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L469
M991 S0 P468 ;notify layer change
G17
G3 Z94 I-1.036 J.639 P1  F30000
G1 X129.934 Y128.434 Z94
G1 Z93.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.889 Y128.495 E.00254
G3 X129.389 Y127.303 I-.49 J-.496 E.09032
G1 X129.413 Y127.303 E.00078
G3 X130.027 Y128.301 I-.014 J.697 E.04621
G1 X129.969 Y128.385 E.00338
G1 X130.26 Y128.668 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.159 Y128.779 E.00463
G3 X129.375 Y126.91 I-.76 J-.78 E.13027
G1 X129.428 Y126.911 E.00163
G3 X130.294 Y128.619 I-.03 J1.089 E.0719
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518309
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.418 Y127.753 E.00709
G1 X129.231 Y127.822 E.00774
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 94
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.0157
G1 X129.526 Y128.214 E-.1041
G1 X129.344 Y128.244 E-.09529
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07118
G1 X129.418 Y127.753 E-.1037
G1 X129.584 Y127.83 E-.09493
G1 X129.642 Y127.96 E-.07347
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 470/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L470
M991 S0 P469 ;notify layer change
G17
G3 Z94.2 I-1.034 J.642 P1  F30000
G1 X129.936 Y128.432 Z94.2
G1 Z94
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.889 Y128.495 E.00259
G3 X129.389 Y127.303 I-.49 J-.496 E.09033
G1 X129.413 Y127.303 E.00078
G3 X130.027 Y128.301 I-.014 J.697 E.04622
G1 X129.97 Y128.383 E.00332
G1 X130.262 Y128.666 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.159 Y128.779 E.00471
G3 X129.375 Y126.91 I-.76 J-.78 E.13027
G1 X129.428 Y126.911 E.00163
G3 X130.296 Y128.617 I-.03 J1.089 E.07182
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518315
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.418 Y127.753 E.00709
G1 X129.231 Y127.822 E.00774
G1 X129.158 Y127.938 E.00531
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 94.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.0157
G1 X129.526 Y128.214 E-.10409
G1 X129.344 Y128.244 E-.09529
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07118
G1 X129.418 Y127.753 E-.10367
G1 X129.584 Y127.83 E-.09496
G1 X129.642 Y127.96 E-.07348
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 471/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L471
M991 S0 P470 ;notify layer change
G17
G3 Z94.4 I-1.032 J.646 P1  F30000
G1 X129.937 Y128.431 Z94.4
G1 Z94.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.889 Y128.495 E.00266
G3 X129.389 Y127.303 I-.49 J-.496 E.09033
G1 X129.413 Y127.303 E.00078
G3 X130.027 Y128.301 I-.014 J.697 E.04622
G1 X129.971 Y128.381 E.00324
G1 X130.264 Y128.663 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.159 Y128.779 E.0048
G3 X129.375 Y126.91 I-.76 J-.78 E.13027
G1 X129.428 Y126.911 E.00162
G3 X130.298 Y128.614 I-.029 J1.089 E.07173
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518319
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.418 Y127.753 E.00709
G1 X129.231 Y127.822 E.00774
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00711
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 94.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
M73 P89 R1
G1 X129.641 Y128.05 E-.01571
G1 X129.526 Y128.214 E-.10409
G1 X129.344 Y128.244 E-.09529
G1 X129.187 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07119
G1 X129.418 Y127.753 E-.10365
G1 X129.584 Y127.83 E-.09497
G1 X129.642 Y127.96 E-.07349
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 472/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L472
M991 S0 P471 ;notify layer change
G17
G3 Z94.6 I-1.029 J.65 P1  F30000
G1 X129.938 Y128.429 Z94.6
G1 Z94.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.889 Y128.495 E.00274
G3 X129.389 Y127.303 I-.49 J-.496 E.09033
G1 X129.413 Y127.303 E.00077
G3 X130.027 Y128.301 I-.014 J.697 E.04623
G1 X129.973 Y128.379 E.00316
G1 X130.266 Y128.661 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.159 Y128.779 E.0049
G3 X129.375 Y126.91 I-.76 J-.78 E.13028
G1 X129.428 Y126.911 E.00162
G3 X130.299 Y128.611 I-.029 J1.089 E.07164
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518325
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.418 Y127.753 E.00709
G1 X129.231 Y127.822 E.00774
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 94.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01571
G1 X129.526 Y128.214 E-.10408
G1 X129.344 Y128.244 E-.09529
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.0712
G1 X129.418 Y127.753 E-.10361
G1 X129.584 Y127.83 E-.09499
G1 X129.642 Y127.96 E-.07351
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 473/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L473
M991 S0 P472 ;notify layer change
G17
G3 Z94.8 I-1.026 J.655 P1  F30000
G1 X129.94 Y128.426 Z94.8
G1 Z94.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.889 Y128.495 E.00283
G3 X129.389 Y127.303 I-.49 J-.496 E.09033
G1 X129.412 Y127.303 E.00077
G3 X130.027 Y128.301 I-.013 J.697 E.04623
G1 X129.974 Y128.377 E.00306
G1 X130.269 Y128.658 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.159 Y128.779 E.00502
G3 X129.375 Y126.91 I-.76 J-.78 E.13028
G1 X129.428 Y126.911 E.00162
G3 X130.301 Y128.609 I-.029 J1.089 E.07155
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51833
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.418 Y127.753 E.00709
G1 X129.231 Y127.822 E.00773
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 94.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01572
G1 X129.526 Y128.214 E-.10407
G1 X129.344 Y128.244 E-.09529
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.0712
G1 X129.418 Y127.753 E-.10357
G1 X129.584 Y127.83 E-.09501
G1 X129.642 Y127.96 E-.07351
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 474/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L474
M991 S0 P473 ;notify layer change
G17
G3 Z95 I-1.022 J.66 P1  F30000
G1 X129.942 Y128.424 Z95
G1 Z94.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.889 Y128.495 E.00293
G3 X129.389 Y127.303 I-.49 J-.495 E.09034
G1 X129.412 Y127.303 E.00076
G3 X130.027 Y128.301 I-.013 J.697 E.04624
G1 X129.976 Y128.375 E.00296
G1 X130.268 Y128.656 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.375 Y126.91 I-.869 J-.656 E.13533
G1 X129.428 Y126.911 E.00161
G3 X130.303 Y128.607 I-.029 J1.089 E.07148
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518336
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.418 Y127.753 E.0071
G1 X129.231 Y127.822 E.00773
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 95
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01573
G1 X129.526 Y128.214 E-.10406
G1 X129.344 Y128.244 E-.0953
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07121
G1 X129.418 Y127.753 E-.10354
G1 X129.584 Y127.83 E-.09504
G1 X129.642 Y127.96 E-.07351
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 475/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L475
M991 S0 P474 ;notify layer change
G17
G3 Z95.2 I-1.018 J.666 P1  F30000
G1 X129.944 Y128.421 Z95.2
G1 Z95
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.889 Y128.495 E.00304
G3 X129.389 Y127.303 I-.49 J-.495 E.09034
G1 X129.412 Y127.303 E.00076
G3 X130.027 Y128.301 I-.013 J.697 E.04624
G1 X129.978 Y128.372 E.00285
G1 X130.27 Y128.656 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.656 E.00007
G3 X129.375 Y126.91 I-.869 J-.657 E.13533
G1 X129.428 Y126.911 E.00161
G3 X130.38 Y128.471 I-.029 J1.089 E.06668
G1 X130.301 Y128.604 E.00477
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518342
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.418 Y127.753 E.0071
G1 X129.231 Y127.822 E.00773
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 95.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01573
G1 X129.526 Y128.214 E-.10406
G1 X129.344 Y128.244 E-.0953
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07122
G1 X129.418 Y127.753 E-.1035
G1 X129.584 Y127.83 E-.09506
G1 X129.642 Y127.96 E-.07352
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 476/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L476
M991 S0 P475 ;notify layer change
G17
G3 Z95.4 I-1.014 J.672 P1  F30000
G1 X129.946 Y128.418 Z95.4
G1 Z95.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.889 Y128.495 E.00316
G3 X129.389 Y127.303 I-.49 J-.495 E.09034
G1 X129.412 Y127.303 E.00075
G3 X130.027 Y128.301 I-.013 J.697 E.04625
G1 X129.98 Y128.369 E.00273
G1 X130.272 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.656 E.00014
G3 X129.375 Y126.91 I-.869 J-.657 E.13532
G1 X129.427 Y126.911 E.0016
G3 X130.38 Y128.471 I-.029 J1.089 E.06669
G1 X130.302 Y128.602 E.00468
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518349
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.418 Y127.752 E.0071
G1 X129.231 Y127.822 E.00773
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 95.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01574
G1 X129.526 Y128.214 E-.10404
G1 X129.344 Y128.244 E-.0953
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07122
G1 X129.418 Y127.752 E-.10347
G1 X129.584 Y127.83 E-.09507
G1 X129.642 Y127.96 E-.07354
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 477/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L477
M991 S0 P476 ;notify layer change
G17
G3 Z95.6 I-1.01 J.679 P1  F30000
G1 X129.948 Y128.415 Z95.6
G1 Z95.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.889 Y128.495 E.00328
G3 X129.389 Y127.303 I-.49 J-.495 E.09034
G1 X129.412 Y127.303 E.00075
G3 X130.027 Y128.302 I-.013 J.697 E.04625
G1 X129.982 Y128.366 E.0026
G1 X130.273 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.656 E.00024
G3 X129.375 Y126.91 I-.869 J-.657 E.13532
G1 X129.427 Y126.911 E.0016
G3 X130.38 Y128.471 I-.028 J1.089 E.06669
G1 X130.304 Y128.599 E.00458
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518354
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.418 Y127.752 E.0071
G1 X129.231 Y127.822 E.00772
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 95.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01574
G1 X129.526 Y128.214 E-.10404
G1 X129.344 Y128.244 E-.0953
G1 X129.187 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07123
G1 X129.418 Y127.752 E-.10343
G1 X129.584 Y127.83 E-.0951
G1 X129.642 Y127.96 E-.07355
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 478/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L478
M991 S0 P477 ;notify layer change
G17
G3 Z95.8 I-1.005 J.686 P1  F30000
G1 X129.95 Y128.412 Z95.8
G1 Z95.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.89 Y128.495 E.00341
G3 X129.389 Y127.303 I-.49 J-.495 E.09035
G1 X129.412 Y127.303 E.00075
G3 X130.027 Y128.302 I-.013 J.697 E.04626
G1 X129.985 Y128.363 E.00247
G1 X130.275 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.656 E.00034
G3 X129.375 Y126.91 I-.869 J-.657 E.13532
G1 X129.427 Y126.911 E.0016
G3 X130.38 Y128.471 I-.028 J1.089 E.0667
G1 X130.306 Y128.596 E.00447
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51836
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.418 Y127.752 E.0071
G1 X129.231 Y127.822 E.00772
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 95.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01574
G1 X129.526 Y128.214 E-.10403
G1 X129.344 Y128.244 E-.09531
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07122
G1 X129.418 Y127.752 E-.1034
G1 X129.584 Y127.83 E-.09512
G1 X129.642 Y127.96 E-.07355
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 479/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L479
M991 S0 P478 ;notify layer change
G17
G3 Z96 I-1.001 J.693 P1  F30000
G1 X129.953 Y128.409 Z96
G1 Z95.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.89 Y128.495 E.00354
G3 X129.389 Y127.303 I-.49 J-.495 E.09035
G1 X129.412 Y127.303 E.00074
G3 X130.027 Y128.302 I-.013 J.697 E.04626
G1 X129.987 Y128.359 E.00234
G1 X130.277 Y128.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.656 E.00045
G3 X129.375 Y126.91 I-.869 J-.657 E.13531
G1 X129.427 Y126.911 E.00159
G3 X130.38 Y128.471 I-.028 J1.089 E.06671
G1 X130.308 Y128.593 E.00436
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518365
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.418 Y127.752 E.0071
G1 X129.231 Y127.822 E.00772
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 96
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01575
G1 X129.526 Y128.214 E-.10402
G1 X129.344 Y128.244 E-.09531
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07123
G1 X129.418 Y127.752 E-.10337
G1 X129.584 Y127.83 E-.09514
G1 X129.642 Y127.96 E-.07356
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 480/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L480
M991 S0 P479 ;notify layer change
G17
G3 Z96.2 I-.996 J.7 P1  F30000
G1 X129.955 Y128.405 Z96.2
G1 Z96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.89 Y128.495 E.00367
G3 X129.39 Y127.303 I-.49 J-.495 E.09035
G1 X129.412 Y127.303 E.00074
G3 X130.027 Y128.302 I-.012 J.697 E.04627
G1 X129.989 Y128.356 E.0022
G1 X130.279 Y128.641 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.656 E.00057
G3 X129.375 Y126.91 I-.869 J-.657 E.13531
G1 X129.427 Y126.911 E.00159
G3 X130.38 Y128.471 I-.028 J1.089 E.06671
G1 X130.31 Y128.59 E.00424
M204 S10000
G1 X129.65 Y128.013 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518371
G1 F1200
G1 X129.584 Y127.83 E.00753
G1 X129.418 Y127.752 E.0071
G1 X129.231 Y127.822 E.00772
G1 X129.158 Y127.938 E.00532
G2 X129.254 Y128.203 I.272 J.051 E.01145
G1 X129.443 Y128.246 E.00753
G1 X129.6 Y128.128 E.00759
G1 X129.626 Y128.068 E.00255
; CHANGE_LAYER
; Z_HEIGHT: 96.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.6 Y128.128 E-.0342
G1 X129.443 Y128.246 E-.10182
G1 X129.254 Y128.203 E-.10099
G1 X129.17 Y128.085 E-.07537
G1 X129.158 Y127.938 E-.07644
G1 X129.231 Y127.822 E-.07136
G1 X129.418 Y127.752 E-.10351
G1 X129.584 Y127.83 E-.09531
G1 X129.65 Y128.013 E-.10101
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 481/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L481
M991 S0 P480 ;notify layer change
G17
G3 Z96.4 I-.954 J.755 P1  F30000
G1 X129.957 Y128.402 Z96.4
G1 Z96.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.89 Y128.494 E.00381
G3 X129.39 Y127.303 I-.491 J-.495 E.09036
G1 X129.412 Y127.303 E.00074
G3 X130.027 Y128.302 I-.012 J.697 E.04627
G1 X129.992 Y128.353 E.00206
G1 X130.281 Y128.638 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.656 E.00069
G3 X129.375 Y126.91 I-.869 J-.657 E.13531
G1 X129.427 Y126.911 E.00159
G3 X130.38 Y128.471 I-.028 J1.089 E.06672
G1 X130.312 Y128.586 E.00411
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518377
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.417 Y127.752 E.00711
G1 X129.231 Y127.822 E.00771
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
M73 P90 R1
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 96.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01575
G1 X129.526 Y128.214 E-.10401
G1 X129.344 Y128.244 E-.09531
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07124
G1 X129.417 Y127.752 E-.10331
G1 X129.584 Y127.83 E-.09517
G1 X129.642 Y127.96 E-.07359
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 482/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L482
M991 S0 P481 ;notify layer change
G17
G3 Z96.6 I-.985 J.714 P1  F30000
G1 X129.96 Y128.398 Z96.6
G1 Z96.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.89 Y128.494 E.00394
G3 X129.39 Y127.303 I-.491 J-.495 E.09036
G1 X129.412 Y127.303 E.00073
G3 X130.027 Y128.302 I-.012 J.697 E.04628
G1 X129.994 Y128.349 E.00192
G1 X130.283 Y128.634 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.656 E.00083
G3 X129.375 Y126.91 I-.869 J-.657 E.13531
G1 X129.427 Y126.911 E.00158
G3 X130.38 Y128.471 I-.028 J1.089 E.06673
G1 X130.314 Y128.583 E.00398
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518383
G1 F1200
G1 X129.584 Y127.83 E.0055
G1 X129.417 Y127.752 E.00711
G1 X129.231 Y127.822 E.00771
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00777
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 96.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01576
G1 X129.526 Y128.214 E-.104
G1 X129.344 Y128.244 E-.09532
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07124
G1 X129.417 Y127.752 E-.10327
G1 X129.584 Y127.83 E-.09519
G1 X129.642 Y127.96 E-.0736
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 483/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L483
M991 S0 P482 ;notify layer change
G17
G3 Z96.8 I-.98 J.722 P1  F30000
G1 X129.962 Y128.395 Z96.8
G1 Z96.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.89 Y128.494 E.00408
G3 X129.39 Y127.303 I-.491 J-.495 E.09036
G1 X129.412 Y127.303 E.00073
G3 X130.027 Y128.302 I-.012 J.697 E.04629
G1 X129.997 Y128.346 E.00178
G1 X130.285 Y128.631 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.656 E.00096
G3 X129.375 Y126.91 I-.869 J-.657 E.1353
G1 X129.427 Y126.911 E.00158
G3 X130.381 Y128.472 I-.027 J1.089 E.06673
G1 X130.316 Y128.579 E.00385
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518389
G1 F1200
G1 X129.584 Y127.83 E.00549
G1 X129.417 Y127.752 E.00711
G1 X129.231 Y127.822 E.00771
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 96.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01577
G1 X129.526 Y128.214 E-.10398
G1 X129.344 Y128.244 E-.09533
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.1008
G1 X129.231 Y127.822 E-.07125
G1 X129.417 Y127.752 E-.10324
G1 X129.584 Y127.83 E-.09523
G1 X129.642 Y127.96 E-.07359
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 484/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L484
M991 S0 P483 ;notify layer change
G17
G3 Z97 I-.975 J.729 P1  F30000
G1 X129.965 Y128.392 Z97
G1 Z96.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.89 Y128.494 E.00421
G3 X129.39 Y127.303 I-.491 J-.495 E.09037
G1 X129.411 Y127.303 E.00072
G3 X130.027 Y128.302 I-.012 J.697 E.04629
G1 X129.999 Y128.342 E.00164
G1 X130.288 Y128.627 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.656 E.0011
G3 X129.375 Y126.91 I-.869 J-.657 E.1353
G1 X129.426 Y126.91 E.00157
G3 X130.381 Y128.472 I-.027 J1.089 E.06674
G1 X130.319 Y128.575 E.00371
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518392
G1 F1200
G1 X129.584 Y127.83 E.0055
G1 X129.417 Y127.752 E.00711
G1 X129.231 Y127.822 E.00771
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 97
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01576
G1 X129.526 Y128.214 E-.10399
G1 X129.344 Y128.244 E-.09533
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07125
G1 X129.417 Y127.752 E-.1032
G1 X129.584 Y127.83 E-.09523
G1 X129.642 Y127.96 E-.07362
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 485/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L485
M991 S0 P484 ;notify layer change
G17
G3 Z97.2 I-.969 J.736 P1  F30000
G1 X129.967 Y128.388 Z97.2
G1 Z97
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.89 Y128.494 E.00435
G3 X129.39 Y127.303 I-.491 J-.495 E.09037
G1 X129.411 Y127.303 E.00072
G3 X130.027 Y128.302 I-.012 J.697 E.0463
G1 X130.001 Y128.339 E.0015
G1 X130.29 Y128.623 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.656 E.00124
G3 X129.375 Y126.91 I-.869 J-.657 E.13529
G1 X129.426 Y126.91 E.00157
G3 X130.381 Y128.472 I-.027 J1.089 E.06675
G1 X130.321 Y128.571 E.00357
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518398
G1 F1200
G1 X129.584 Y127.83 E.0055
G1 X129.417 Y127.752 E.00711
G1 X129.231 Y127.822 E.0077
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 97.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01577
G1 X129.526 Y128.214 E-.10399
G1 X129.344 Y128.244 E-.09532
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07125
G1 X129.417 Y127.752 E-.10318
G1 X129.584 Y127.83 E-.09525
G1 X129.642 Y127.96 E-.07362
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 486/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L486
M991 S0 P485 ;notify layer change
G17
G3 Z97.4 I-.964 J.743 P1  F30000
G1 X129.97 Y128.385 Z97.4
G1 Z97.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.89 Y128.494 E.00448
G3 X129.39 Y127.303 I-.491 J-.495 E.09037
G1 X129.411 Y127.303 E.00071
G3 X130.027 Y128.302 I-.012 J.697 E.0463
G1 X130.004 Y128.336 E.00137
G1 X130.293 Y128.619 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.656 E.00139
G3 X129.375 Y126.91 I-.869 J-.657 E.13529
G1 X129.426 Y126.91 E.00157
G3 X130.381 Y128.472 I-.027 J1.089 E.06675
G1 X130.323 Y128.567 E.00342
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518406
G1 F1200
G1 X129.584 Y127.83 E.0055
G1 X129.417 Y127.752 E.00711
G1 X129.231 Y127.822 E.0077
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 97.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01578
G1 X129.526 Y128.214 E-.10396
G1 X129.344 Y128.244 E-.09533
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07126
G1 X129.417 Y127.752 E-.10313
G1 X129.584 Y127.83 E-.09527
G1 X129.642 Y127.96 E-.07364
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 487/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L487
M991 S0 P486 ;notify layer change
G17
G3 Z97.6 I-.959 J.749 P1  F30000
G1 X129.972 Y128.382 Z97.6
G1 Z97.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.89 Y128.494 E.0046
G3 X129.39 Y127.303 I-.491 J-.495 E.09037
G1 X129.411 Y127.303 E.00071
G3 X130.027 Y128.302 I-.012 J.697 E.04631
G1 X130.006 Y128.332 E.00124
G1 X130.295 Y128.615 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.656 E.00153
G3 X129.375 Y126.91 I-.868 J-.657 E.13529
G1 X129.426 Y126.91 E.00156
G3 X130.381 Y128.472 I-.027 J1.089 E.06676
G1 X130.326 Y128.563 E.00327
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518412
G1 F1200
G1 X129.583 Y127.83 E.0055
G1 X129.417 Y127.752 E.00711
G1 X129.231 Y127.822 E.0077
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 97.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01578
G1 X129.526 Y128.214 E-.10396
G1 X129.344 Y128.244 E-.09533
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07126
G1 X129.417 Y127.752 E-.1031
G1 X129.583 Y127.83 E-.09529
G1 X129.642 Y127.96 E-.07366
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 488/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L488
M991 S0 P487 ;notify layer change
G17
G3 Z97.8 I-.954 J.756 P1  F30000
G1 X129.974 Y128.379 Z97.8
G1 Z97.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.89 Y128.494 E.00472
G3 X129.39 Y127.303 I-.491 J-.495 E.09037
G1 X129.411 Y127.303 E.00071
G3 X130.027 Y128.302 I-.011 J.697 E.04631
G1 X130.008 Y128.329 E.00111
G1 X130.298 Y128.611 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.657 E.00169
G3 X129.375 Y126.91 I-.868 J-.657 E.13528
G1 X129.426 Y126.91 E.00156
G3 X130.381 Y128.472 I-.027 J1.089 E.06677
G1 X130.328 Y128.559 E.00312
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518415
G1 F1200
G1 X129.583 Y127.83 E.0055
G1 X129.417 Y127.752 E.00712
G1 X129.231 Y127.822 E.0077
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 97.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01579
G1 X129.526 Y128.214 E-.10395
G1 X129.344 Y128.244 E-.09533
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07127
G1 X129.417 Y127.752 E-.10308
G1 X129.583 Y127.83 E-.09531
G1 X129.642 Y127.96 E-.07365
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 489/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L489
M991 S0 P488 ;notify layer change
G17
G3 Z98 I-.949 J.762 P1  F30000
G1 X129.976 Y128.376 Z98
G1 Z97.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.891 Y128.494 E.00484
G3 X129.39 Y127.303 I-.491 J-.495 E.09037
G1 X129.411 Y127.303 E.0007
G3 X130.027 Y128.302 I-.011 J.697 E.04632
G1 X130.01 Y128.327 E.00099
G1 X130.3 Y128.606 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.657 E.00184
G3 X129.375 Y126.91 I-.868 J-.657 E.13528
G1 X129.426 Y126.91 E.00155
G3 X130.381 Y128.472 I-.026 J1.089 E.06677
G1 X130.331 Y128.555 E.00297
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518424
G1 F1200
G1 X129.583 Y127.83 E.0055
G1 X129.417 Y127.752 E.00712
G1 X129.231 Y127.822 E.00769
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 98
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01579
G1 X129.526 Y128.214 E-.10394
G1 X129.344 Y128.244 E-.09533
G1 X129.187 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07127
G1 X129.417 Y127.752 E-.10304
G1 X129.583 Y127.83 E-.09533
G1 X129.642 Y127.96 E-.07367
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 490/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L490
M991 S0 P489 ;notify layer change
G17
G3 Z98.2 I-.944 J.768 P1  F30000
G1 X129.978 Y128.373 Z98.2
G1 Z98
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.891 Y128.494 E.00495
G3 X129.39 Y127.303 I-.491 J-.495 E.09038
G1 X129.411 Y127.303 E.0007
G3 X130.027 Y128.302 I-.011 J.697 E.04632
G1 X130.012 Y128.324 E.00088
G1 X130.303 Y128.602 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.657 E.00199
G3 X129.375 Y126.91 I-.868 J-.657 E.13528
G1 X129.426 Y126.91 E.00155
G3 X130.381 Y128.472 I-.026 J1.089 E.06678
G1 X130.334 Y128.551 E.00282
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518429
G1 F1200
G1 X129.583 Y127.83 E.0055
G1 X129.417 Y127.752 E.00712
G1 X129.231 Y127.822 E.00769
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 98.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01579
G1 X129.526 Y128.214 E-.10393
G1 X129.344 Y128.244 E-.09534
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.1008
G1 X129.231 Y127.822 E-.07128
G1 X129.417 Y127.752 E-.10301
G1 X129.583 Y127.83 E-.09535
G1 X129.642 Y127.96 E-.07368
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 491/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L491
M991 S0 P490 ;notify layer change
G17
G3 Z98.4 I-.94 J.773 P1  F30000
G1 X129.98 Y128.37 Z98.4
G1 Z98.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.891 Y128.494 E.00505
G3 X129.39 Y127.303 I-.491 J-.494 E.09038
G1 X129.411 Y127.303 E.00069
G3 X130.027 Y128.302 I-.011 J.697 E.04633
G1 X130.014 Y128.321 E.00077
G1 X130.305 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.657 E.00215
G3 X129.375 Y126.91 I-.868 J-.657 E.13527
G1 X129.426 Y126.91 E.00155
G3 X130.381 Y128.472 I-.026 J1.089 E.06679
G1 X130.336 Y128.546 E.00267
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518436
G1 F1200
G1 X129.583 Y127.83 E.0055
M73 P91 R1
G1 X129.417 Y127.752 E.00712
G1 X129.231 Y127.822 E.00769
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 98.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.0158
G1 X129.526 Y128.214 E-.10393
G1 X129.344 Y128.244 E-.09534
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07129
G1 X129.417 Y127.752 E-.10295
G1 X129.583 Y127.83 E-.09538
G1 X129.642 Y127.96 E-.07369
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 492/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L492
M991 S0 P491 ;notify layer change
G17
G3 Z98.6 I-.935 J.779 P1  F30000
G1 X129.982 Y128.368 Z98.6
G1 Z98.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.891 Y128.494 E.00515
G3 X129.39 Y127.303 I-.491 J-.494 E.09038
G1 X129.411 Y127.303 E.00069
G3 X130.028 Y128.302 I-.011 J.697 E.04634
G1 X130.016 Y128.319 E.00067
G1 X130.308 Y128.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.657 E.0023
G3 X129.375 Y126.91 I-.868 J-.658 E.13527
G1 X129.426 Y126.91 E.00154
G3 X130.381 Y128.472 I-.026 J1.089 E.0668
G1 X130.339 Y128.542 E.00251
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51844
G1 F1200
G1 X129.583 Y127.83 E.0055
G1 X129.417 Y127.752 E.00712
G1 X129.231 Y127.822 E.00769
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 98.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.0158
G1 X129.526 Y128.214 E-.10392
G1 X129.344 Y128.244 E-.09534
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.07129
G1 X129.417 Y127.752 E-.10294
G1 X129.583 Y127.83 E-.09538
G1 X129.642 Y127.96 E-.07371
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 493/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L493
M991 S0 P492 ;notify layer change
G17
G3 Z98.8 I-.918 J.799 P1  F30000
G1 X129.992 Y128.361 Z98.8
G1 Z98.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.411 Y127.303 I-.595 J-.362 E.09676
G1 X129.487 Y127.308 E.00252
G3 X130.021 Y128.309 I-.09 J.691 E.04396
G1 X130.315 Y128.588 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.196 Y128.741 E.00595
G3 X129.426 Y126.91 I-.797 J-.742 E.13342
G1 X129.535 Y126.919 E.00339
G3 X130.346 Y128.537 I-.136 J1.081 E.06565
M204 S10000
G1 X129.645 Y127.984 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518101
G1 F1200
G1 X129.6 Y127.849 E.0055
G1 X129.446 Y127.756 E.00696
G1 X129.249 Y127.807 E.00787
G1 X129.165 Y127.914 E.0053
G1 X129.175 Y128.109 E.00753
G1 X129.32 Y128.237 E.00753
G1 X129.504 Y128.226 E.00712
G1 X129.635 Y128.074 E.00776
G1 X129.638 Y128.043 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 98.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.635 Y128.074 E-.01578
G1 X129.504 Y128.226 E-.10396
G1 X129.32 Y128.237 E-.09541
G1 X129.175 Y128.109 E-.10082
G1 X129.165 Y127.914 E-.10082
G1 X129.249 Y127.807 E-.07094
G1 X129.446 Y127.756 E-.10535
G1 X129.6 Y127.849 E-.09322
G1 X129.645 Y127.984 E-.07371
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 494/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L494
M991 S0 P493 ;notify layer change
G17
G3 Z99 I-.865 J.856 P1  F30000
G1 X130 Y128.342 Z99
G1 Z98.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.891 Y128.494 E.00619
G3 X129.39 Y127.302 I-.491 J-.494 E.09039
G1 X129.41 Y127.303 E.00068
G3 X130.032 Y128.292 I-.011 J.697 E.04597
G1 X130.327 Y128.563 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.657 E.0034
G3 X129.375 Y126.91 I-.868 J-.658 E.13526
G1 X129.425 Y126.91 E.00153
G3 X130.381 Y128.472 I-.026 J1.089 E.06681
G1 X130.357 Y128.512 E.00141
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518452
G1 F1200
G1 X129.583 Y127.83 E.0055
G1 X129.417 Y127.752 E.00713
G1 X129.231 Y127.822 E.00768
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 99
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01582
G1 X129.526 Y128.214 E-.1039
G1 X129.344 Y128.244 E-.09535
G1 X129.187 Y128.13 E-.10082
G1 X129.158 Y127.938 E-.1008
G1 X129.231 Y127.822 E-.0713
G1 X129.417 Y127.752 E-.10287
G1 X129.583 Y127.83 E-.09543
G1 X129.642 Y127.96 E-.07372
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 495/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L495
M991 S0 P494 ;notify layer change
G17
G3 Z99.2 I-.885 J.836 P1  F30000
G1 X130.001 Y128.34 Z99.2
G1 Z99
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.891 Y128.494 E.00626
G3 X129.39 Y127.302 I-.491 J-.494 E.09039
G1 X129.41 Y127.303 E.00068
G3 X130.033 Y128.29 I-.011 J.697 E.0459
G1 X130.329 Y128.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.657 E.00355
G3 X129.375 Y126.91 I-.868 J-.658 E.13526
G1 X129.425 Y126.91 E.00153
G3 X130.381 Y128.472 I-.025 J1.089 E.06682
G1 X130.36 Y128.508 E.00127
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518458
G1 F1200
G1 X129.583 Y127.83 E.00551
G1 X129.417 Y127.752 E.00713
G1 X129.231 Y127.822 E.00768
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.641 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 99.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.641 Y128.05 E-.01582
G1 X129.526 Y128.214 E-.10389
G1 X129.344 Y128.244 E-.09535
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.10081
G1 X129.231 Y127.822 E-.0713
G1 X129.417 Y127.752 E-.10283
G1 X129.583 Y127.83 E-.09545
G1 X129.642 Y127.96 E-.07373
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 496/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L496
M991 S0 P495 ;notify layer change
G17
G3 Z99.4 I-.881 J.839 P1  F30000
G1 X130.003 Y128.338 Z99.4
G1 Z99.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.891 Y128.494 E.00633
G3 X129.39 Y127.302 I-.491 J-.494 E.0904
G1 X129.41 Y127.303 E.00067
G3 X130.034 Y128.288 I-.01 J.697 E.04583
G1 X130.331 Y128.555 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.657 E.00369
G3 X129.375 Y126.91 I-.868 J-.658 E.13525
G1 X129.425 Y126.91 E.00153
G3 X130.381 Y128.472 I-.025 J1.089 E.06682
G1 X130.362 Y128.504 E.00113
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518462
G1 F1200
G1 X129.583 Y127.83 E.00551
G1 X129.417 Y127.752 E.00713
G1 X129.231 Y127.822 E.00768
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.64 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 99.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.64 Y128.05 E-.01582
G1 X129.526 Y128.214 E-.10389
G1 X129.344 Y128.244 E-.09535
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.1008
G1 X129.231 Y127.822 E-.07131
G1 X129.417 Y127.752 E-.10279
G1 X129.583 Y127.83 E-.09547
G1 X129.642 Y127.96 E-.07374
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 497/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L497
M991 S0 P496 ;notify layer change
G17
G3 Z99.6 I-.878 J.843 P1  F30000
G1 X130.004 Y128.337 Z99.6
G1 Z99.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.891 Y128.494 E.0064
G3 X129.39 Y127.302 I-.491 J-.494 E.0904
G1 X129.41 Y127.302 E.00067
G3 X130.035 Y128.286 I-.01 J.697 E.04577
G1 X130.334 Y128.552 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.268 Y128.657 E.00382
G3 X129.375 Y126.91 I-.868 J-.658 E.13525
G1 X129.425 Y126.91 E.00152
G3 X130.381 Y128.472 I-.025 J1.089 E.06683
G1 X130.364 Y128.5 E.00099
M204 S10000
G1 X129.642 Y127.96 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518468
G1 F1200
G1 X129.583 Y127.83 E.00551
G1 X129.416 Y127.752 E.00713
G1 X129.231 Y127.822 E.00767
G1 X129.158 Y127.938 E.00532
G1 X129.187 Y128.13 E.00753
G1 X129.344 Y128.244 E.00753
G1 X129.526 Y128.214 E.00712
G1 X129.64 Y128.05 E.00776
G1 X129.641 Y128.02 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 99.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.64 Y128.05 E-.01583
G1 X129.526 Y128.214 E-.10388
G1 X129.344 Y128.244 E-.09536
G1 X129.187 Y128.13 E-.10081
G1 X129.158 Y127.938 E-.1008
G1 X129.231 Y127.822 E-.07131
G1 X129.416 Y127.752 E-.10277
G1 X129.583 Y127.83 E-.09548
G1 X129.642 Y127.96 E-.07375
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 498/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L498
M991 S0 P497 ;notify layer change
G17
G3 Z99.8 I-.899 J.821 P1  F30000
G1 X130 Y128.352 Z99.8
G1 Z99.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.992 Y128.361 E.00042
G3 X129.41 Y127.302 I-.595 J-.362 E.09675
G1 X129.487 Y127.308 E.00254
G3 X130.051 Y128.237 I-.09 J.691 E.04136
G1 X130.025 Y128.297 E.00219
G1 X130.352 Y128.522 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.328 Y128.567 E.00158
G3 X129.425 Y126.91 I-.929 J-.568 E.14014
G1 X129.535 Y126.919 E.00341
G3 X130.422 Y128.372 I-.137 J1.08 E.06005
G1 X130.378 Y128.467 E.00323
M204 S10000
G1 X129.645 Y127.984 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518103
G1 F1200
G1 X129.599 Y127.849 E.00551
G1 X129.446 Y127.756 E.00696
G1 X129.249 Y127.807 E.00787
G1 X129.165 Y127.914 E.0053
G1 X129.175 Y128.109 E.00753
G1 X129.32 Y128.237 E.00753
G1 X129.504 Y128.226 E.00712
G1 X129.635 Y128.074 E.00776
G1 X129.638 Y128.043 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 99.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.635 Y128.074 E-.0158
G1 X129.504 Y128.226 E-.10393
G1 X129.32 Y128.237 E-.09542
G1 X129.175 Y128.109 E-.10082
G1 X129.165 Y127.914 E-.10082
G1 X129.249 Y127.807 E-.07093
G1 X129.446 Y127.756 E-.10538
G1 X129.599 Y127.849 E-.09316
G1 X129.645 Y127.984 E-.07375
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 499/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L499
M991 S0 P498 ;notify layer change
G17
G3 Z100 I-.839 J.882 P1  F30000
G1 X130.01 Y128.331 Z100
G1 Z99.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.994 Y128.363 E.00118
G3 X129.382 Y127.303 I-.594 J-.364 E.09564
G1 X129.452 Y127.305 E.00231
G3 X130.055 Y128.238 I-.052 J.695 E.04265
G1 X130.036 Y128.277 E.00143
G1 X130.362 Y128.501 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.329 Y128.568 E.00229
G3 X129.373 Y126.911 I-.929 J-.568 E.13848
G1 X129.481 Y126.913 E.00334
G3 X130.423 Y128.372 I-.081 J1.086 E.06176
G1 X130.388 Y128.447 E.00252
M204 S10000
G1 X129.634 Y127.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518127
G1 F1200
G1 X129.592 Y127.839 E.0049
G1 X129.419 Y127.75 E.00754
G1 X129.247 Y127.804 E.00695
G1 X129.155 Y127.985 E.00787
G1 X129.18 Y128.12 E.0053
G1 X129.332 Y128.241 E.00753
G1 X129.525 Y128.217 E.00752
G1 X129.638 Y128.071 E.00712
G1 X129.636 Y128.019 E.00204
; CHANGE_LAYER
; Z_HEIGHT: 100
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.638 Y128.071 E-.02735
G1 X129.525 Y128.217 E-.09532
G1 X129.332 Y128.241 E-.10071
G1 X129.18 Y128.12 E-.10081
G1 X129.155 Y127.985 E-.0709
G1 X129.247 Y127.804 E-.10531
G1 X129.419 Y127.75 E-.09309
G1 X129.592 Y127.839 E-.10092
G1 X129.634 Y127.959 E-.06559
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 500/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L500
M991 S0 P499 ;notify layer change
G17
G3 Z100.2 I-.757 J.953 P1  F30000
G1 X130.348 Y128.526 Z100.2
G1 Z100
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.3 Y128.613 E.00306
G3 X129.373 Y126.911 I-.9 J-.614 E.13682
G1 X129.481 Y126.913 E.00334
G3 X130.403 Y128.423 I-.081 J1.086 E.06343
G1 X130.376 Y128.474 E.00176
M204 S10000
; WIPE_START
G1 F24000
G1 X130.3 Y128.613 E-.06058
G1 X130.161 Y128.78 E-.08242
G1 X129.989 Y128.917 E-.08345
G1 X129.848 Y128.993 E-.06093
G1 X129.643 Y129.062 E-.08244
G1 X129.427 Y129.089 E-.08248
G1 X129.211 Y129.073 E-.08244
G1 X129.002 Y129.014 E-.08248
G1 X128.809 Y128.915 E-.08246
G1 X128.685 Y128.816 E-.06032
; WIPE_END
G1 E-.04 F1800
G17
G3 Z100.4 I-.111 J1.212 P1  F30000
G1 X129.386 Y128.881 Z100.4
G1 Z100
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X130.281 Y127.985 E.03892
G1 X130.167 Y127.566
G1 X128.966 Y128.767 E.05218
G1 X128.685 Y128.515
G1 X129.915 Y127.285 E.05345
G1 X129.537 Y127.129
G1 X128.53 Y128.137 E.04379
M204 S10000
; WIPE_START
G1 F24000
G1 X129.537 Y127.129 E-.54154
G1 X129.915 Y127.285 E-.15518
G1 X129.797 Y127.403 E-.06328
; WIPE_END
G1 E-.04 F1800
G17
G3 Z100.4 I-1.116 J.485 P1  F30000
G1 X130.209 Y128.351 Z100.4
G1 Z100
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0980554
G1 F1200
G3 X130.109 Y128.484 I-1.377 J-.929 E.00074
; LINE_WIDTH: 0.135389
G3 X129.837 Y128.747 I-1.392 J-1.168 E.00286
; LINE_WIDTH: 0.114718
G1 X129.75 Y128.81 E.00063
; WIPE_START
G1 F24000
G1 X129.837 Y128.747 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z100.4 I.973 J-.731 P1  F30000
G1 X128.784 Y127.344 Z100.4
G1 Z100
G1 E.8 F1800
; LINE_WIDTH: 0.0905002
G1 F1200
G1 X128.528 Y127.85 E.0022
; WIPE_START
G1 F24000
G1 X128.784 Y127.344 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P92 R1
G3 Z100.4 I.552 J1.085 P1  F30000
G1 X129.233 Y127.116 Z100.4
G1 Z100
G1 E.8 F1800
; LINE_WIDTH: 0.188598
G1 F1200
G2 X128.928 Y127.343 I2.123 J3.168 E.00452
; LINE_WIDTH: 0.230261
G2 X128.679 Y127.607 I1.035 J1.22 E.00555
; LINE_WIDTH: 0.203247
G1 X128.514 Y127.84 E.00373
; WIPE_START
G1 F24000
G1 X128.679 Y127.607 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z100.4 I.783 J.932 P1  F30000
G1 X129.249 Y127.129 Z100.4
G1 Z100
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F1200
G1 X128.727 Y127.4 E.00217
; CHANGE_LAYER
; Z_HEIGHT: 100.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.249 Y127.129 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 501/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L501
M991 S0 P500 ;notify layer change
G17
G3 Z100.4 I-1.096 J.529 P1  F30000
G1 X129.751 Y128.169 Z100.4
G1 Z100.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.39 Y127.61 I-.351 J-.169 E.05072
G1 X129.429 Y127.611 E.0012
G3 X129.773 Y128.113 I-.029 J.388 E.02143
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 100.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.658 Y128.292 E-.08091
G1 X129.524 Y128.369 E-.05872
G1 X129.371 Y128.389 E-.05866
G1 X129.258 Y128.363 E-.04415
G1 X129.128 Y128.279 E-.05869
G1 X129.041 Y128.151 E-.05868
G1 X129.01 Y128 E-.0587
G1 X129.041 Y127.849 E-.05869
G1 X129.128 Y127.721 E-.05869
G1 X129.258 Y127.637 E-.0587
G1 X129.39 Y127.61 E-.05143
G1 X129.429 Y127.611 E-.01481
G1 X129.578 Y127.653 E-.05866
G1 X129.661 Y127.72 E-.04052
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 502/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L502
M991 S0 P501 ;notify layer change
G17
G3 Z100.6 I-1.193 J.241 P1  F30000
G1 X129.752 Y128.17 Z100.6
G1 Z100.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.413 Y127.611 I-.351 J-.17 E.05135
G1 X129.448 Y127.613 E.0011
G3 X129.774 Y128.113 I-.047 J.387 E.02089
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 100.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.66 Y128.29 E-.08
G1 X129.506 Y128.375 E-.06687
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.0587
G1 X129.114 Y128.265 E-.04414
G1 X129.034 Y128.133 E-.0587
G1 X129.011 Y127.981 E-.05861
G1 X129.049 Y127.831 E-.05877
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.413 Y127.611 E-.05253
G1 X129.448 Y127.613 E-.01363
G1 X129.595 Y127.662 E-.0587
G1 X129.661 Y127.72 E-.03328
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 503/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L503
M991 S0 P502 ;notify layer change
G17
G3 Z100.8 I-1.208 J.148 P1  F30000
G1 X129.722 Y128.219 Z100.8
G1 Z100.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.41 Y127.61 I-.322 J-.22 E.04954
G1 X129.448 Y127.613 E.00118
G3 X129.752 Y128.167 I-.048 J.386 E.02263
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 100.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.611 Y128.327 E-.0809
G1 X129.506 Y128.375 E-.04415
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.0587
G1 X129.114 Y128.265 E-.04414
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05853
G1 X129.049 Y127.831 E-.05885
G1 X129.142 Y127.708 E-.05869
G1 X129.273 Y127.632 E-.05754
G1 X129.41 Y127.61 E-.05274
G1 X129.448 Y127.613 E-.01458
G1 X129.595 Y127.662 E-.05871
G1 X129.704 Y127.758 E-.05509
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 504/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L504
M991 S0 P503 ;notify layer change
G17
G3 Z101 I-1.209 J.143 P1  F30000
G1 X129.752 Y128.17 Z101
G1 Z100.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.413 Y127.611 I-.351 J-.17 E.05135
G1 X129.448 Y127.613 E.00109
G3 X129.774 Y128.114 I-.047 J.387 E.02089
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 101
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.66 Y128.29 E-.08002
G1 X129.506 Y128.375 E-.06687
G1 X129.352 Y128.387 E-.05869
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.0587
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.275 Y127.631 E-.05848
G1 X129.413 Y127.611 E-.05285
G1 X129.448 Y127.613 E-.01351
G1 X129.595 Y127.662 E-.05871
G1 X129.661 Y127.72 E-.03326
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 505/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L505
M991 S0 P504 ;notify layer change
G17
G3 Z101.2 I-1.203 J.182 P1  F30000
G1 X129.733 Y128.204 Z101.2
G1 Z101
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.413 Y127.611 I-.332 J-.204 E.05016
G1 X129.448 Y127.613 E.00109
G3 X129.761 Y128.15 I-.047 J.387 E.0221
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 101.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08096
G1 X129.506 Y128.375 E-.05143
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.0587
G1 X129.114 Y128.265 E-.04415
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.413 Y127.611 E-.05269
G1 X129.448 Y127.613 E-.01346
G1 X129.595 Y127.662 E-.0587
G1 X129.689 Y127.746 E-.04776
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 506/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L506
M991 S0 P505 ;notify layer change
G17
G3 Z101.4 I-1.212 J.115 P1  F30000
G1 X129.732 Y128.203 Z101.4
G1 Z101.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.411 Y127.61 I-.332 J-.203 E.05014
G1 X129.448 Y127.613 E.00116
G3 X129.76 Y128.15 I-.048 J.387 E.02204
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 101.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.08897
G1 X129.468 Y128.384 E-.05765
G1 X129.352 Y128.387 E-.04416
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05868
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.273 Y127.632 E-.05736
G1 X129.411 Y127.61 E-.05309
G1 X129.448 Y127.613 E-.01439
G1 X129.595 Y127.662 E-.05872
G1 X129.69 Y127.746 E-.04806
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 507/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L507
M991 S0 P506 ;notify layer change
G17
G3 Z101.6 I-1.211 J.116 P1  F30000
G1 X129.733 Y128.204 Z101.6
G1 Z101.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.413 Y127.611 I-.332 J-.204 E.05016
G1 X129.448 Y127.613 E.00108
G3 X129.761 Y128.15 I-.047 J.387 E.0221
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 101.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.08904
G1 X129.468 Y128.384 E-.05765
G1 X129.352 Y128.387 E-.04415
G1 X129.205 Y128.338 E-.05868
G1 X129.089 Y128.235 E-.0587
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.0587
G1 X129.142 Y127.708 E-.0587
G1 X129.276 Y127.631 E-.05869
G1 X129.413 Y127.611 E-.05282
G1 X129.448 Y127.613 E-.01332
G1 X129.595 Y127.662 E-.05872
G1 X129.69 Y127.746 E-.04802
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 508/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L508
M991 S0 P507 ;notify layer change
G17
G3 Z101.8 I-1.211 J.116 P1  F30000
G1 X129.733 Y128.204 Z101.8
G1 Z101.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.414 Y127.611 I-.332 J-.204 E.05017
G1 X129.448 Y127.613 E.00107
G3 X129.761 Y128.15 I-.047 J.387 E.0221
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 101.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08096
G1 X129.506 Y128.375 E-.05141
G1 X129.352 Y128.387 E-.05871
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.0587
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.0587
G1 X129.276 Y127.631 E-.05868
G1 X129.414 Y127.611 E-.05288
G1 X129.448 Y127.613 E-.01328
G1 X129.595 Y127.662 E-.05871
G1 X129.689 Y127.746 E-.04776
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 509/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L509
M991 S0 P508 ;notify layer change
G17
G3 Z102 I-1.208 J.148 P1  F30000
G1 X129.743 Y128.187 Z102
G1 Z101.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.414 Y127.611 I-.342 J-.187 E.05077
G1 X129.448 Y127.613 E.00107
G3 X129.768 Y128.132 I-.047 J.387 E.02151
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 102
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.08092
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.0587
G1 X129.24 Y128.355 E-.04414
G1 X129.114 Y128.265 E-.05868
G1 X129.034 Y128.133 E-.0587
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.414 Y127.611 E-.05294
G1 X129.448 Y127.613 E-.0132
G1 X129.56 Y127.645 E-.04418
G1 X129.678 Y127.729 E-.05509
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 510/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L510
M991 S0 P509 ;notify layer change
G17
G3 Z102.2 I-1.209 J.142 P1  F30000
G1 X129.734 Y128.204 Z102.2
G1 Z102
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.414 Y127.611 I-.332 J-.204 E.05017
G1 X129.448 Y127.613 E.00106
G3 X129.761 Y128.15 I-.047 J.387 E.02211
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 102.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08096
G1 X129.506 Y128.375 E-.05141
G1 X129.352 Y128.387 E-.05872
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.414 Y127.611 E-.053
G1 X129.448 Y127.613 E-.01313
G1 X129.595 Y127.662 E-.05872
G1 X129.689 Y127.746 E-.04776
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 511/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L511
M991 S0 P510 ;notify layer change
G17
G3 Z102.4 I-1.211 J.118 P1  F30000
G1 X129.734 Y128.204 Z102.4
G1 Z102.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.414 Y127.611 I-.332 J-.204 E.05018
G1 X129.448 Y127.613 E.00106
G3 X129.761 Y128.15 I-.047 J.387 E.02211
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 102.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.08908
G1 X129.468 Y128.384 E-.05762
G1 X129.352 Y128.387 E-.04414
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.414 Y127.611 E-.05307
G1 X129.448 Y127.613 E-.01306
G1 X129.595 Y127.662 E-.05873
G1 X129.69 Y127.746 E-.04801
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 512/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L512
M991 S0 P511 ;notify layer change
G17
G3 Z102.6 I-1.211 J.117 P1  F30000
G1 X129.734 Y128.204 Z102.6
G1 Z102.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.414 Y127.611 I-.332 J-.204 E.05018
G1 X129.448 Y127.613 E.00105
G3 X129.761 Y128.15 I-.047 J.387 E.02211
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 102.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.08909
G1 X129.468 Y128.384 E-.05761
G1 X129.352 Y128.387 E-.04415
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.414 Y127.611 E-.05312
G1 X129.448 Y127.613 E-.013
G1 X129.595 Y127.662 E-.05873
G1 X129.69 Y127.746 E-.04801
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 513/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L513
M991 S0 P512 ;notify layer change
G17
G3 Z102.8 I-1.204 J.178 P1  F30000
G1 X129.752 Y128.17 Z102.8
G1 Z102.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.414 Y127.611 I-.351 J-.17 E.05138
G1 X129.448 Y127.613 E.00105
G3 X129.774 Y128.114 I-.046 J.387 E.02091
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 102.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.66 Y128.29 E-.08003
G1 X129.506 Y128.375 E-.06687
G1 X129.352 Y128.387 E-.0587
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.414 Y127.611 E-.05319
G1 X129.448 Y127.613 E-.01293
G1 X129.595 Y127.662 E-.05874
G1 X129.66 Y127.72 E-.03326
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 514/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L514
M991 S0 P513 ;notify layer change
G17
G3 Z103 I-1.203 J.182 P1  F30000
G1 X129.734 Y128.204 Z103
G1 Z102.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.415 Y127.611 I-.332 J-.204 E.05019
G1 X129.448 Y127.613 E.00104
G3 X129.761 Y128.15 I-.046 J.387 E.02212
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 103
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08097
G1 X129.506 Y128.375 E-.05139
G1 X129.352 Y128.387 E-.05874
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05868
G1 X129.034 Y128.133 E-.04416
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.0587
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.415 Y127.611 E-.05325
G1 X129.448 Y127.613 E-.01286
G1 X129.595 Y127.662 E-.05874
G1 X129.689 Y127.746 E-.04776
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 515/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L515
M991 S0 P514 ;notify layer change
G17
G3 Z103.2 I-1.211 J.118 P1  F30000
G1 X129.734 Y128.204 Z103.2
G1 Z103
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.415 Y127.611 I-.332 J-.204 E.05019
G1 X129.448 Y127.613 E.00103
G3 X129.761 Y128.15 I-.046 J.387 E.02212
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 103.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08096
G1 X129.465 Y128.384 E-.06688
G1 X129.352 Y128.387 E-.04316
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.0587
G1 X129.022 Y128.096 E-.0587
G1 X129.011 Y127.981 E-.04414
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.415 Y127.611 E-.05332
G1 X129.448 Y127.613 E-.01279
G1 X129.595 Y127.662 E-.05874
G1 X129.689 Y127.746 E-.04786
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 516/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L516
M991 S0 P515 ;notify layer change
G17
G3 Z103.4 I-1.211 J.118 P1  F30000
G1 X129.734 Y128.204 Z103.4
G1 Z103.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.415 Y127.611 I-.332 J-.204 E.05019
G1 X129.448 Y127.613 E.00103
G3 X129.761 Y128.15 I-.046 J.387 E.02212
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 103.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.08913
G1 X129.468 Y128.384 E-.05758
G1 X129.352 Y128.387 E-.04415
G1 X129.205 Y128.338 E-.05869
G1 X129.114 Y128.265 E-.04415
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05868
G1 X129.276 Y127.631 E-.0587
G1 X129.415 Y127.611 E-.05337
G1 X129.448 Y127.613 E-.01272
G1 X129.595 Y127.662 E-.05875
G1 X129.69 Y127.746 E-.048
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 517/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L517
M991 S0 P516 ;notify layer change
G17
G3 Z103.6 I-1.211 J.117 P1  F30000
G1 X129.734 Y128.204 Z103.6
G1 Z103.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.415 Y127.611 I-.332 J-.204 E.05019
G1 X129.448 Y127.613 E.00102
G3 X129.761 Y128.151 I-.046 J.387 E.02212
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 103.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.08914
G1 X129.468 Y128.384 E-.05756
G1 X129.352 Y128.387 E-.04415
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.0587
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05868
G1 X129.142 Y127.708 E-.0587
G1 X129.276 Y127.631 E-.05869
G1 X129.415 Y127.611 E-.05344
G1 X129.448 Y127.613 E-.01266
G1 X129.595 Y127.662 E-.05875
G1 X129.69 Y127.746 E-.04801
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 518/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L518
M991 S0 P517 ;notify layer change
G17
G3 Z103.8 I-1.208 J.148 P1  F30000
G1 X129.744 Y128.187 Z103.8
G1 Z103.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.415 Y127.611 I-.342 J-.187 E.0508
G1 X129.448 Y127.613 E.00102
G3 X129.768 Y128.133 I-.046 J.387 E.02153
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 103.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.08093
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.05869
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.415 Y127.611 E-.0535
G1 X129.448 Y127.613 E-.0126
G1 X129.56 Y127.645 E-.0442
G1 X129.678 Y127.729 E-.05509
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 519/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L519
M991 S0 P518 ;notify layer change
G17
G3 Z104 I-1.209 J.142 P1  F30000
G1 X129.734 Y128.204 Z104
G1 Z103.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.415 Y127.611 I-.332 J-.204 E.0502
G1 X129.448 Y127.613 E.00101
G3 X129.761 Y128.151 I-.046 J.387 E.02213
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 104
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08097
G1 X129.527 Y128.368 E-.04316
G1 X129.352 Y128.387 E-.06687
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.415 Y127.611 E-.05356
G1 X129.448 Y127.613 E-.01252
G1 X129.595 Y127.662 E-.05876
G1 X129.689 Y127.746 E-.04786
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 520/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L520
M991 S0 P519 ;notify layer change
G17
G3 Z104.2 I-1.214 J.082 P1  F30000
G1 X129.722 Y128.223 Z104.2
G1 Z104
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.416 Y127.611 I-.319 J-.223 E.04951
G1 X129.448 Y127.613 E.00101
G3 X129.752 Y128.171 I-.046 J.387 E.02283
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 104.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.06546
G1 X129.506 Y128.375 E-.0587
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.0587
G1 X129.276 Y127.631 E-.05869
G1 X129.416 Y127.611 E-.05363
G1 X129.448 Y127.613 E-.01246
G1 X129.595 Y127.662 E-.05876
G1 X129.705 Y127.76 E-.05602
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 521/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L521
M991 S0 P520 ;notify layer change
G17
G3 Z104.4 I-1.214 J.078 P1  F30000
G1 X129.734 Y128.204 Z104.4
G1 Z104.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.416 Y127.611 I-.332 J-.204 E.05021
G1 X129.448 Y127.613 E.001
G3 X129.761 Y128.151 I-.046 J.387 E.02213
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 104.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08098
G1 X129.506 Y128.375 E-.05136
G1 X129.352 Y128.387 E-.05877
G1 X129.24 Y128.355 E-.04414
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.0587
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.416 Y127.611 E-.05369
G1 X129.448 Y127.613 E-.01239
G1 X129.595 Y127.662 E-.05876
G1 X129.689 Y127.746 E-.04775
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 522/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L522
M991 S0 P521 ;notify layer change
G17
G3 Z104.6 I-1.211 J.118 P1  F30000
G1 X129.734 Y128.204 Z104.6
G1 Z104.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.416 Y127.611 I-.332 J-.204 E.05021
G1 X129.448 Y127.613 E.001
G3 X129.761 Y128.151 I-.046 J.387 E.02213
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 104.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.08919
G1 X129.468 Y128.384 E-.05752
G1 X129.352 Y128.387 E-.04415
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05868
G1 X129.034 Y128.133 E-.0587
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.0587
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.416 Y127.611 E-.05375
G1 X129.448 Y127.613 E-.01232
G1 X129.595 Y127.662 E-.05876
G1 X129.69 Y127.746 E-.04801
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 523/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L523
M991 S0 P522 ;notify layer change
G17
G3 Z104.8 I-1.204 J.179 P1  F30000
G1 X129.753 Y128.17 Z104.8
G1 Z104.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.416 Y127.611 I-.35 J-.17 E.05141
G1 X129.448 Y127.613 E.00099
G3 X129.775 Y128.114 I-.046 J.387 E.02093
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 104.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.66 Y128.29 E-.08005
M73 P93 R0
G1 X129.506 Y128.375 E-.06687
G1 X129.352 Y128.387 E-.05868
G1 X129.205 Y128.338 E-.0587
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.0587
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.416 Y127.611 E-.05382
G1 X129.448 Y127.613 E-.01225
G1 X129.595 Y127.662 E-.05878
G1 X129.66 Y127.72 E-.03325
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 524/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L524
M991 S0 P523 ;notify layer change
G17
G3 Z105 I-1.208 J.147 P1  F30000
G1 X129.722 Y128.223 Z105
G1 Z104.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.416 Y127.611 I-.319 J-.223 E.04952
G1 X129.448 Y127.613 E.00099
G3 X129.752 Y128.171 I-.046 J.387 E.02284
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 105
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.06543
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.0587
G1 X129.205 Y128.338 E-.05868
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05868
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.416 Y127.611 E-.05387
G1 X129.448 Y127.613 E-.01219
G1 X129.595 Y127.662 E-.05878
G1 X129.705 Y127.76 E-.05605
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 525/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L525
M991 S0 P524 ;notify layer change
G17
G3 Z105.2 I-1.214 J.078 P1  F30000
G1 X129.734 Y128.204 Z105.2
G1 Z105
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.416 Y127.611 I-.332 J-.204 E.05022
G1 X129.448 Y127.613 E.00098
G3 X129.762 Y128.151 I-.046 J.387 E.02214
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 105.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.08922
G1 X129.468 Y128.384 E-.0575
G1 X129.352 Y128.387 E-.04414
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05868
G1 X129.142 Y127.708 E-.0587
G1 X129.276 Y127.631 E-.05869
G1 X129.416 Y127.611 E-.05394
G1 X129.448 Y127.613 E-.01212
G1 X129.595 Y127.662 E-.05878
G1 X129.69 Y127.746 E-.048
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 526/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L526
M991 S0 P525 ;notify layer change
G17
G3 Z105.4 I-1.208 J.149 P1  F30000
G1 X129.744 Y128.187 Z105.4
G1 Z105.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.417 Y127.611 I-.341 J-.187 E.05082
G1 X129.448 Y127.613 E.00098
G3 X129.769 Y128.133 I-.046 J.387 E.02155
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 105.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.08095
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.0587
G1 X129.276 Y127.631 E-.05868
G1 X129.417 Y127.611 E-.054
G1 X129.448 Y127.613 E-.01206
G1 X129.56 Y127.645 E-.04423
G1 X129.678 Y127.729 E-.05509
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 527/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L527
M991 S0 P526 ;notify layer change
G17
G3 Z105.6 I-1.209 J.143 P1  F30000
G1 X129.734 Y128.204 Z105.6
G1 Z105.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.417 Y127.611 I-.332 J-.204 E.05023
G1 X129.448 Y127.613 E.00097
G3 X129.762 Y128.151 I-.046 J.387 E.02215
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 105.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.08924
G1 X129.468 Y128.384 E-.05748
G1 X129.352 Y128.387 E-.04414
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.0587
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.417 Y127.611 E-.05406
G1 X129.448 Y127.613 E-.01198
G1 X129.595 Y127.662 E-.05879
G1 X129.69 Y127.746 E-.048
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 528/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L528
M991 S0 P527 ;notify layer change
G17
G3 Z105.8 I-1.208 J.149 P1  F30000
G1 X129.744 Y128.187 Z105.8
G1 Z105.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.417 Y127.611 I-.341 J-.187 E.05083
G1 X129.448 Y127.613 E.00096
G3 X129.769 Y128.133 I-.046 J.387 E.02155
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 105.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.08095
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.417 Y127.611 E-.05412
G1 X129.448 Y127.613 E-.01192
G1 X129.56 Y127.645 E-.04424
G1 X129.678 Y127.729 E-.05509
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 529/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L529
M991 S0 P528 ;notify layer change
G17
G3 Z106 I-1.209 J.143 P1  F30000
G1 X129.734 Y128.204 Z106
G1 Z105.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.417 Y127.611 I-.332 J-.204 E.05023
G1 X129.448 Y127.613 E.00096
G3 X129.762 Y128.151 I-.046 J.387 E.02215
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 106
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.07384
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.0587
G1 X129.276 Y127.631 E-.05869
G1 X129.417 Y127.611 E-.05419
G1 X129.448 Y127.613 E-.01184
G1 X129.595 Y127.662 E-.0588
G1 X129.689 Y127.745 E-.04765
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 530/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L530
M991 S0 P529 ;notify layer change
G17
G3 Z106.2 I-1.211 J.12 P1  F30000
G1 X129.734 Y128.204 Z106.2
G1 Z106
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.417 Y127.611 I-.332 J-.204 E.05024
G1 X129.448 Y127.613 E.00095
G3 X129.762 Y128.151 I-.046 J.387 E.02215
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 106.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.08926
G1 X129.468 Y128.384 E-.05746
G1 X129.352 Y128.387 E-.04415
G1 X129.24 Y128.355 E-.04414
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.417 Y127.611 E-.05426
G1 X129.448 Y127.613 E-.01177
G1 X129.595 Y127.662 E-.0588
G1 X129.69 Y127.746 E-.048
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 531/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L531
M991 S0 P530 ;notify layer change
G17
G3 Z106.4 I-1.211 J.118 P1  F30000
G1 X129.734 Y128.204 Z106.4
G1 Z106.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.417 Y127.611 I-.332 J-.204 E.05024
G1 X129.448 Y127.613 E.00095
G3 X129.762 Y128.151 I-.046 J.387 E.02215
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 106.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08099
G1 X129.506 Y128.375 E-.05133
G1 X129.352 Y128.387 E-.05881
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05868
G1 X129.142 Y127.708 E-.0587
G1 X129.276 Y127.631 E-.05869
G1 X129.417 Y127.611 E-.05431
G1 X129.448 Y127.613 E-.01171
G1 X129.595 Y127.662 E-.0588
G1 X129.689 Y127.746 E-.04775
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 532/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L532
M991 S0 P531 ;notify layer change
G17
G3 Z106.6 I-1.211 J.119 P1  F30000
G1 X129.734 Y128.204 Z106.6
G1 Z106.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.418 Y127.611 I-.332 J-.204 E.05024
G1 X129.448 Y127.613 E.00094
G3 X129.762 Y128.151 I-.046 J.387 E.02215
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 106.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.081
G1 X129.506 Y128.375 E-.05132
G1 X129.352 Y128.387 E-.05881
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.418 Y127.611 E-.05438
G1 X129.448 Y127.613 E-.01164
G1 X129.595 Y127.662 E-.05881
G1 X129.689 Y127.746 E-.04775
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 533/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L533
M991 S0 P532 ;notify layer change
G17
G3 Z106.8 I-1.203 J.186 P1  F30000
G1 X129.754 Y128.168 Z106.8
G1 Z106.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.418 Y127.611 I-.352 J-.168 E.05153
G1 X129.448 Y127.613 E.00094
G3 X129.776 Y128.112 I-.045 J.387 E.02087
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 106.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.0891
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.05869
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.0587
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.418 Y127.611 E-.05445
G1 X129.448 Y127.613 E-.01158
G1 X129.595 Y127.662 E-.05881
G1 X129.659 Y127.719 E-.0324
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 534/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L534
M991 S0 P533 ;notify layer change
G17
G3 Z107 I-1.202 J.187 P1  F30000
G1 X129.734 Y128.204 Z107
G1 Z106.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.418 Y127.611 I-.332 J-.204 E.05025
G1 X129.448 Y127.613 E.00093
G3 X129.762 Y128.151 I-.045 J.387 E.02216
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 107
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.08931
G1 X129.468 Y128.384 E-.05742
G1 X129.352 Y128.387 E-.04415
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.418 Y127.611 E-.05451
G1 X129.448 Y127.613 E-.01151
G1 X129.595 Y127.662 E-.05881
G1 X129.69 Y127.746 E-.048
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 535/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L535
M991 S0 P534 ;notify layer change
G17
G3 Z107.2 I-1.211 J.118 P1  F30000
G1 X129.734 Y128.204 Z107.2
G1 Z107
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.418 Y127.611 I-.332 J-.204 E.05025
G1 X129.448 Y127.613 E.00092
G3 X129.762 Y128.151 I-.045 J.387 E.02216
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 107.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.08931
G1 X129.468 Y128.384 E-.05743
G1 X129.352 Y128.387 E-.04414
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.0587
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.418 Y127.611 E-.05457
G1 X129.448 Y127.613 E-.01143
G1 X129.595 Y127.662 E-.05882
G1 X129.69 Y127.746 E-.04801
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 536/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L536
M991 S0 P535 ;notify layer change
G17
G3 Z107.4 I-1.211 J.118 P1  F30000
G1 X129.734 Y128.204 Z107.4
G1 Z107.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.418 Y127.611 I-.332 J-.204 E.05026
G1 X129.448 Y127.613 E.00092
G3 X129.762 Y128.151 I-.045 J.387 E.02216
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 107.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08101
G1 X129.506 Y128.375 E-.0513
G1 X129.352 Y128.387 E-.05882
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.0587
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.0587
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.418 Y127.611 E-.05463
G1 X129.448 Y127.613 E-.01137
G1 X129.595 Y127.662 E-.05882
G1 X129.689 Y127.746 E-.04774
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 537/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L537
M991 S0 P536 ;notify layer change
G17
G3 Z107.6 I-1.208 J.151 P1  F30000
G1 X129.744 Y128.187 Z107.6
G1 Z107.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.418 Y127.611 I-.341 J-.187 E.05086
G1 X129.448 Y127.613 E.00091
G3 X129.769 Y128.133 I-.045 J.387 E.02157
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 107.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.08096
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.0587
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.418 Y127.611 E-.0547
G1 X129.448 Y127.613 E-.0113
G1 X129.56 Y127.645 E-.04428
G1 X129.678 Y127.729 E-.05508
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 538/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L538
M991 S0 P537 ;notify layer change
G17
G3 Z107.8 I-1.212 J.107 P1  F30000
G1 X129.722 Y128.224 Z107.8
G1 Z107.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.419 Y127.611 I-.319 J-.224 E.04956
G1 X129.448 Y127.613 E.00091
G3 X129.752 Y128.172 I-.045 J.387 E.02288
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 107.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.06533
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.0587
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.0587
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.419 Y127.611 E-.05475
G1 X129.448 Y127.613 E-.01123
G1 X129.595 Y127.662 E-.05884
G1 X129.706 Y127.76 E-.05617
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 539/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L539
M991 S0 P538 ;notify layer change
G17
G3 Z108 I-1.208 J.146 P1  F30000
G1 X129.755 Y128.167 Z108
G1 Z107.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.419 Y127.611 I-.352 J-.167 E.05158
G1 X129.448 Y127.613 E.0009
G3 X129.776 Y128.111 I-.045 J.387 E.02086
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 108
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.08941
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.0587
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.0587
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.419 Y127.611 E-.05482
G1 X129.448 Y127.613 E-.01117
G1 X129.595 Y127.662 E-.05884
G1 X129.658 Y127.718 E-.03209
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 540/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L540
M991 S0 P539 ;notify layer change
G17
G3 Z108.2 I-1.202 J.189 P1  F30000
G1 X129.734 Y128.204 Z108.2
G1 Z108
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.419 Y127.611 I-.332 J-.204 E.05027
G1 X129.448 Y127.613 E.0009
G3 X129.762 Y128.151 I-.045 J.387 E.02217
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 108.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08102
G1 X129.506 Y128.375 E-.05129
G1 X129.352 Y128.387 E-.05884
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.0587
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.419 Y127.611 E-.05488
G1 X129.448 Y127.613 E-.0111
G1 X129.595 Y127.662 E-.05884
G1 X129.689 Y127.746 E-.04775
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 541/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L541
M991 S0 P540 ;notify layer change
G17
G3 Z108.4 I-1.211 J.12 P1  F30000
G1 X129.734 Y128.204 Z108.4
G1 Z108.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.419 Y127.611 I-.332 J-.204 E.05028
G1 X129.448 Y127.613 E.00089
G3 X129.762 Y128.151 I-.045 J.387 E.02217
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 108.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08936
G1 X129.468 Y128.384 E-.05738
G1 X129.352 Y128.387 E-.04415
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.419 Y127.611 E-.05494
G1 X129.448 Y127.613 E-.01102
G1 X129.595 Y127.662 E-.05885
G1 X129.69 Y127.746 E-.048
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 542/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L542
M991 S0 P541 ;notify layer change
G17
G3 Z108.6 I-1.214 J.082 P1  F30000
G1 X129.722 Y128.224 Z108.6
G1 Z108.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.419 Y127.611 I-.319 J-.224 E.04957
G1 X129.448 Y127.613 E.00089
G3 X129.752 Y128.172 I-.045 J.387 E.02289
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 108.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.06531
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.419 Y127.611 E-.05501
G1 X129.448 Y127.613 E-.01096
G1 X129.595 Y127.662 E-.05885
G1 X129.706 Y127.76 E-.0562
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 543/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L543
M991 S0 P542 ;notify layer change
G17
G3 Z108.8 I-1.214 J.079 P1  F30000
G1 X129.735 Y128.204 Z108.8
G1 Z108.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.419 Y127.611 I-.331 J-.204 E.05028
G1 X129.448 Y127.613 E.00088
G3 X129.762 Y128.151 I-.045 J.387 E.02218
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 108.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.627 Y128.316 E-.08102
G1 X129.506 Y128.375 E-.05143
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.419 Y127.611 E-.05507
G1 X129.448 Y127.613 E-.0109
G1 X129.595 Y127.662 E-.05885
G1 X129.689 Y127.746 E-.04775
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 544/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L544
M991 S0 P543 ;notify layer change
G17
G3 Z109 I-1.211 J.12 P1  F30000
G1 X129.735 Y128.204 Z109
G1 Z108.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.42 Y127.611 I-.331 J-.204 E.05029
G1 X129.448 Y127.613 E.00088
G3 X129.762 Y128.151 I-.045 J.387 E.02218
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 109
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.0894
G1 X129.468 Y128.384 E-.05736
G1 X129.352 Y128.387 E-.04414
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05868
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.0587
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05868
G1 X129.276 Y127.631 E-.05869
G1 X129.42 Y127.611 E-.05513
G1 X129.448 Y127.613 E-.01083
G1 X129.595 Y127.662 E-.05886
G1 X129.69 Y127.746 E-.048
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 545/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L545
M991 S0 P544 ;notify layer change
G17
G3 Z109.2 I-1.211 J.119 P1  F30000
G1 X129.735 Y128.204 Z109.2
G1 Z109
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.42 Y127.611 I-.331 J-.204 E.05029
G1 X129.448 Y127.613 E.00087
G3 X129.762 Y128.151 I-.045 J.387 E.02218
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 109.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.0894
G1 X129.468 Y128.384 E-.05735
G1 X129.352 Y128.387 E-.04415
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.42 Y127.611 E-.0552
G1 X129.448 Y127.613 E-.01076
G1 X129.595 Y127.662 E-.05886
G1 X129.69 Y127.746 E-.04799
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 546/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L546
M991 S0 P545 ;notify layer change
G17
G3 Z109.4 I-1.211 J.119 P1  F30000
G1 X129.735 Y128.205 Z109.4
G1 Z109.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.42 Y127.611 I-.331 J-.204 E.05029
G1 X129.448 Y127.613 E.00086
G3 X129.762 Y128.151 I-.045 J.387 E.02218
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 109.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08941
G1 X129.468 Y128.384 E-.05734
G1 X129.352 Y128.387 E-.04414
G1 X129.205 Y128.338 E-.0587
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04414
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.42 Y127.611 E-.05525
G1 X129.448 Y127.613 E-.01069
G1 X129.595 Y127.662 E-.05886
G1 X129.69 Y127.746 E-.048
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 547/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L547
M991 S0 P546 ;notify layer change
G17
G3 Z109.6 I-1.211 J.119 P1  F30000
G1 X129.735 Y128.205 Z109.6
G1 Z109.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.42 Y127.611 I-.331 J-.204 E.0503
G1 X129.448 Y127.613 E.00086
G3 X129.762 Y128.151 I-.045 J.387 E.02218
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 109.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08942
G1 X129.468 Y128.384 E-.05734
G1 X129.352 Y128.387 E-.04415
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05868
G1 X129.034 Y128.133 E-.04416
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.42 Y127.611 E-.05532
G1 X129.448 Y127.613 E-.01062
G1 X129.595 Y127.662 E-.05887
G1 X129.69 Y127.746 E-.04799
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 548/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L548
M991 S0 P547 ;notify layer change
G17
G3 Z109.8 I-1.211 J.119 P1  F30000
G1 X129.735 Y128.205 Z109.8
G1 Z109.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.42 Y127.611 I-.331 J-.204 E.0503
G1 X129.448 Y127.613 E.00085
G3 X129.762 Y128.151 I-.045 J.387 E.02219
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 109.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08943
G1 X129.468 Y128.384 E-.05732
G1 X129.352 Y128.387 E-.04414
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.0587
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.42 Y127.611 E-.05539
G1 X129.448 Y127.613 E-.01055
G1 X129.595 Y127.662 E-.05888
G1 X129.69 Y127.746 E-.04799
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 549/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L549
M991 S0 P548 ;notify layer change
G17
G3 Z110 I-1.214 J.082 P1  F30000
G1 X129.722 Y128.224 Z110
G1 Z109.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.42 Y127.611 I-.319 J-.224 E.04959
G1 X129.448 Y127.613 E.00085
G3 X129.753 Y128.172 I-.045 J.387 E.02291
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 110
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.06526
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.05869
M73 P94 R0
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.42 Y127.611 E-.05545
G1 X129.448 Y127.613 E-.01048
G1 X129.595 Y127.662 E-.05888
G1 X129.706 Y127.76 E-.05625
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 550/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L550
M991 S0 P549 ;notify layer change
G17
G3 Z110.2 I-1.214 J.079 P1  F30000
G1 X129.735 Y128.205 Z110.2
G1 Z110
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.421 Y127.611 I-.331 J-.205 E.05031
G1 X129.448 Y127.613 E.00084
G3 X129.762 Y128.151 I-.045 J.387 E.02219
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 110.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08944
G1 X129.468 Y128.384 E-.05731
G1 X129.352 Y128.387 E-.04415
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.421 Y127.611 E-.05551
G1 X129.448 Y127.613 E-.01041
G1 X129.595 Y127.662 E-.05889
G1 X129.69 Y127.746 E-.048
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 551/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L551
M991 S0 P550 ;notify layer change
G17
G3 Z110.4 I-1.211 J.119 P1  F30000
G1 X129.735 Y128.205 Z110.4
G1 Z110.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.421 Y127.611 I-.331 J-.205 E.05031
G1 X129.448 Y127.613 E.00084
G3 X129.762 Y128.151 I-.045 J.387 E.02219
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 110.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08102
G1 X129.465 Y128.384 E-.06687
G1 X129.352 Y128.387 E-.04316
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.421 Y127.611 E-.05557
G1 X129.448 Y127.613 E-.01035
G1 X129.595 Y127.662 E-.05889
G1 X129.689 Y127.746 E-.04785
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 552/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L552
M991 S0 P551 ;notify layer change
G17
G3 Z110.6 I-1.203 J.182 P1  F30000
G1 X129.754 Y128.17 Z110.6
G1 Z110.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.421 Y127.611 I-.35 J-.17 E.05152
G1 X129.448 Y127.613 E.00083
G3 X129.776 Y128.114 I-.045 J.387 E.02099
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 110.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.66 Y128.29 E-.0801
G1 X129.506 Y128.375 E-.06688
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05868
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05868
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.421 Y127.611 E-.05564
G1 X129.448 Y127.613 E-.01027
G1 X129.595 Y127.662 E-.0589
G1 X129.66 Y127.72 E-.03324
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 553/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L553
M991 S0 P552 ;notify layer change
G17
G3 Z110.8 I-1.203 J.185 P1  F30000
G1 X129.735 Y128.205 Z110.8
G1 Z110.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.421 Y127.611 I-.331 J-.205 E.05032
G1 X129.448 Y127.613 E.00083
G3 X129.762 Y128.151 I-.045 J.387 E.0222
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 110.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08103
G1 X129.506 Y128.375 E-.05122
G1 X129.352 Y128.387 E-.0589
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.0587
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05868
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.421 Y127.611 E-.0557
G1 X129.448 Y127.613 E-.0102
G1 X129.595 Y127.662 E-.05891
G1 X129.689 Y127.746 E-.04774
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 554/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L554
M991 S0 P553 ;notify layer change
G17
G3 Z111 I-1.207 J.152 P1  F30000
G1 X129.745 Y128.188 Z111
G1 Z110.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.421 Y127.611 I-.341 J-.188 E.05093
G1 X129.448 Y127.613 E.00082
G3 X129.769 Y128.133 I-.044 J.387 E.02159
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 111
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.08106
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.421 Y127.611 E-.05576
G1 X129.448 Y127.613 E-.01014
G1 X129.595 Y127.662 E-.0589
G1 X129.675 Y127.733 E-.04046
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 555/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L555
M991 S0 P554 ;notify layer change
G17
G3 Z111.2 I-1.198 J.216 P1  F30000
G1 X129.754 Y128.17 Z111.2
G1 Z111
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.421 Y127.611 I-.35 J-.17 E.05153
G1 X129.448 Y127.613 E.00081
G3 X129.776 Y128.114 I-.044 J.387 E.02099
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 111.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.66 Y128.29 E-.0801
G1 X129.506 Y128.375 E-.06688
G1 X129.352 Y128.387 E-.05868
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.0587
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.421 Y127.611 E-.05582
G1 X129.448 Y127.613 E-.01007
G1 X129.595 Y127.662 E-.05891
G1 X129.66 Y127.72 E-.03324
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 556/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L556
M991 S0 P555 ;notify layer change
G17
G3 Z111.4 I-1.203 J.185 P1  F30000
G1 X129.735 Y128.205 Z111.4
G1 Z111.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.422 Y127.611 I-.331 J-.205 E.05033
G1 X129.448 Y127.613 E.00081
G3 X129.762 Y128.151 I-.044 J.387 E.0222
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 111.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08949
G1 X129.468 Y128.384 E-.05727
G1 X129.352 Y128.387 E-.04414
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.0587
G1 X129.276 Y127.631 E-.05868
G1 X129.422 Y127.611 E-.05589
G1 X129.448 Y127.613 E-.01
G1 X129.595 Y127.662 E-.05891
G1 X129.69 Y127.746 E-.048
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 557/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L557
M991 S0 P556 ;notify layer change
G17
G3 Z111.6 I-1.211 J.12 P1  F30000
G1 X129.735 Y128.205 Z111.6
G1 Z111.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.422 Y127.611 I-.331 J-.205 E.05034
G1 X129.448 Y127.613 E.0008
G3 X129.762 Y128.151 I-.044 J.387 E.0222
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 111.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08103
G1 X129.506 Y128.375 E-.05121
G1 X129.352 Y128.387 E-.05892
G1 X129.205 Y128.338 E-.0587
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05868
G1 X129.142 Y127.708 E-.0587
G1 X129.276 Y127.631 E-.05868
G1 X129.422 Y127.611 E-.05595
G1 X129.448 Y127.613 E-.00993
G1 X129.595 Y127.662 E-.05891
G1 X129.689 Y127.746 E-.04775
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 558/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L558
M991 S0 P557 ;notify layer change
G17
G3 Z111.8 I-1.202 J.187 P1  F30000
G1 X129.755 Y128.168 Z111.8
G1 Z111.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.422 Y127.611 I-.351 J-.168 E.05162
G1 X129.448 Y127.613 E.0008
G3 X129.777 Y128.112 I-.044 J.387 E.02092
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 111.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.643 Y128.305 E-.08914
G1 X129.506 Y128.375 E-.05869
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.422 Y127.611 E-.05601
G1 X129.448 Y127.613 E-.00986
G1 X129.595 Y127.662 E-.05893
G1 X129.659 Y127.719 E-.03237
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 559/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L559
M991 S0 P558 ;notify layer change
G17
G3 Z112 I-1.203 J.187 P1  F30000
G1 X129.734 Y128.204 Z112
G1 Z111.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.417 Y127.611 I-.332 J-.204 E.05022
G1 X129.491 Y127.621 E.0023
G3 X129.762 Y128.151 I-.088 J.379 E.0208
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 112
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08947
G1 X129.468 Y128.384 E-.05725
G1 X129.352 Y128.387 E-.04415
G1 X129.205 Y128.338 E-.05869
G1 X129.114 Y128.265 E-.04415
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.417 Y127.611 E-.054
G1 X129.491 Y127.621 E-.02848
G1 X129.628 Y127.684 E-.05704
G1 X129.687 Y127.748 E-.03333
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 560/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L560
M991 S0 P559 ;notify layer change
G17
G3 Z112.2 I-1.211 J.125 P1  F30000
G1 X129.734 Y128.204 Z112.2
G1 Z112
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.417 Y127.611 I-.332 J-.204 E.05022
G1 X129.491 Y127.621 E.0023
G3 X129.762 Y128.151 I-.088 J.379 E.0208
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 112.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08947
G1 X129.468 Y128.384 E-.05724
G1 X129.352 Y128.387 E-.04415
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.417 Y127.611 E-.05405
G1 X129.491 Y127.621 E-.02842
G1 X129.628 Y127.684 E-.05704
G1 X129.687 Y127.748 E-.03332
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 561/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L561
M991 S0 P560 ;notify layer change
G17
G3 Z112.4 I-1.211 J.123 P1  F30000
G1 X129.733 Y128.204 Z112.4
G1 Z112.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.417 Y127.611 I-.331 J-.204 E.05011
G1 X129.491 Y127.621 E.00229
G3 X129.761 Y128.15 I-.088 J.378 E.02077
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 112.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08096
G1 X129.487 Y128.38 E-.05869
G1 X129.352 Y128.387 E-.05143
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.0587
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.417 Y127.611 E-.05412
G1 X129.491 Y127.621 E-.02834
G1 X129.628 Y127.684 E-.05705
G1 X129.687 Y127.747 E-.0331
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 562/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L562
M991 S0 P561 ;notify layer change
G17
G3 Z112.6 I-1.21 J.126 P1  F30000
G1 X129.734 Y128.204 Z112.6
G1 Z112.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.417 Y127.611 I-.332 J-.204 E.05023
G1 X129.491 Y127.621 E.00229
G3 X129.762 Y128.151 I-.088 J.379 E.0208
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 112.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08949
G1 X129.468 Y128.384 E-.05724
G1 X129.352 Y128.387 E-.04414
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.0587
G1 X129.034 Y128.133 E-.05868
G1 X129.011 Y127.981 E-.0587
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.417 Y127.611 E-.05419
G1 X129.491 Y127.621 E-.02828
G1 X129.628 Y127.684 E-.05705
G1 X129.687 Y127.748 E-.03332
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 563/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L563
M991 S0 P562 ;notify layer change
G17
G3 Z112.8 I-1.211 J.125 P1  F30000
G1 X129.734 Y128.204 Z112.8
G1 Z112.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.417 Y127.611 I-.332 J-.204 E.05023
G1 X129.491 Y127.621 E.00228
G3 X129.762 Y128.151 I-.088 J.379 E.0208
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 112.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.081
G1 X129.463 Y128.384 E-.0675
G1 X129.352 Y128.387 E-.0425
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04416
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.417 Y127.611 E-.05425
G1 X129.491 Y127.621 E-.02821
G1 X129.628 Y127.684 E-.05706
G1 X129.687 Y127.748 E-.03318
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 564/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L564
M991 S0 P563 ;notify layer change
G17
G3 Z113 I-1.21 J.126 P1  F30000
G1 X129.734 Y128.204 Z113
G1 Z112.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.417 Y127.611 I-.332 J-.204 E.05024
G1 X129.491 Y127.621 E.00228
G3 X129.762 Y128.151 I-.088 J.379 E.0208
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 113
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.081
G1 X129.463 Y128.384 E-.06749
G1 X129.352 Y128.387 E-.04251
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.417 Y127.611 E-.0543
G1 X129.491 Y127.621 E-.02814
G1 X129.628 Y127.684 E-.05707
G1 X129.687 Y127.748 E-.03318
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 565/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L565
M991 S0 P564 ;notify layer change
G17
G3 Z113.2 I-1.211 J.123 P1  F30000
G1 X129.733 Y128.204 Z113.2
G1 Z113
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.418 Y127.611 I-.331 J-.204 E.05012
G1 X129.491 Y127.621 E.00227
G3 X129.761 Y128.15 I-.088 J.378 E.02077
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 113.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.08899
G1 X129.468 Y128.384 E-.0577
G1 X129.352 Y128.387 E-.04415
G1 X129.205 Y128.338 E-.05869
G1 X129.114 Y128.265 E-.04416
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.0587
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.418 Y127.611 E-.05437
G1 X129.491 Y127.621 E-.02807
G1 X129.628 Y127.684 E-.05707
G1 X129.687 Y127.748 E-.03335
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 566/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L566
M991 S0 P565 ;notify layer change
G17
G3 Z113.4 I-1.211 J.125 P1  F30000
G1 X129.734 Y128.204 Z113.4
G1 Z113.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.418 Y127.611 I-.332 J-.204 E.05025
G1 X129.491 Y127.621 E.00226
G3 X129.762 Y128.151 I-.088 J.379 E.0208
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 113.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08952
G1 X129.468 Y128.384 E-.05721
G1 X129.352 Y128.387 E-.04414
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.418 Y127.611 E-.05443
G1 X129.491 Y127.621 E-.028
G1 X129.628 Y127.684 E-.05709
G1 X129.687 Y127.748 E-.03332
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 567/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L567
M991 S0 P566 ;notify layer change
G17
G3 Z113.6 I-1.203 J.185 P1  F30000
G1 X129.752 Y128.17 Z113.6
G1 Z113.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.418 Y127.611 I-.349 J-.17 E.05132
G1 X129.491 Y127.621 E.00226
G3 X129.774 Y128.114 I-.088 J.378 E.01958
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 113.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.66 Y128.29 E-.08002
G1 X129.506 Y128.375 E-.06687
G1 X129.352 Y128.387 E-.05869
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05868
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.418 Y127.611 E-.0545
G1 X129.491 Y127.621 E-.02793
G1 X129.628 Y127.684 E-.05708
G1 X129.661 Y127.719 E-.01861
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 568/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L568
M991 S0 P567 ;notify layer change
G17
G3 Z113.8 I-1.203 J.182 P1  F30000
G1 X129.734 Y128.204 Z113.8
G1 Z113.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.418 Y127.611 I-.332 J-.204 E.05026
G1 X129.491 Y127.621 E.00225
G3 X129.762 Y128.151 I-.088 J.379 E.02081
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 113.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.081
G1 X129.463 Y128.384 E-.06747
G1 X129.352 Y128.387 E-.04254
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.418 Y127.611 E-.05456
G1 X129.491 Y127.621 E-.02786
G1 X129.628 Y127.684 E-.0571
G1 X129.687 Y127.748 E-.03319
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 569/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L569
M991 S0 P568 ;notify layer change
G17
G3 Z114 I-1.211 J.123 P1  F30000
G1 X129.733 Y128.204 Z114
G1 Z113.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.418 Y127.611 I-.331 J-.204 E.05013
G1 X129.491 Y127.621 E.00225
G3 X129.761 Y128.15 I-.088 J.378 E.02078
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 114
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.609 Y128.329 E-.089
G1 X129.468 Y128.384 E-.0577
G1 X129.352 Y128.387 E-.04415
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.418 Y127.611 E-.05462
G1 X129.491 Y127.621 E-.02779
G1 X129.628 Y127.684 E-.0571
G1 X129.687 Y127.748 E-.03335
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 570/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L570
M991 S0 P569 ;notify layer change
G17
G3 Z114.2 I-1.211 J.125 P1  F30000
G1 X129.734 Y128.204 Z114.2
G1 Z114
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.418 Y127.611 I-.332 J-.204 E.05027
G1 X129.491 Y127.621 E.00224
G3 X129.762 Y128.151 I-.088 J.379 E.02081
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 114.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08954
G1 X129.468 Y128.384 E-.05717
G1 X129.352 Y128.387 E-.04415
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.0587
G1 X129.049 Y127.831 E-.05868
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.418 Y127.611 E-.05469
G1 X129.491 Y127.621 E-.02772
G1 X129.628 Y127.684 E-.05711
G1 X129.687 Y127.748 E-.03333
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 571/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L571
M991 S0 P570 ;notify layer change
G17
G3 Z114.4 I-1.211 J.125 P1  F30000
G1 X129.734 Y128.204 Z114.4
G1 Z114.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.419 Y127.611 I-.332 J-.204 E.05027
G1 X129.491 Y127.621 E.00224
G3 X129.762 Y128.151 I-.088 J.379 E.02081
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 114.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08956
G1 X129.468 Y128.384 E-.05717
G1 X129.352 Y128.387 E-.04415
G1 X129.24 Y128.355 E-.04415
G1 X129.114 Y128.265 E-.05869
G1 X129.034 Y128.133 E-.05869
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.419 Y127.611 E-.05474
G1 X129.491 Y127.621 E-.02766
G1 X129.628 Y127.684 E-.05711
G1 X129.687 Y127.748 E-.03332
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 572/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L572
M991 S0 P571 ;notify layer change
G17
G3 Z114.6 I-1.211 J.125 P1  F30000
G1 X129.734 Y128.204 Z114.6
G1 Z114.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.419 Y127.611 I-.332 J-.204 E.05028
G1 X129.491 Y127.621 E.00223
G3 X129.762 Y128.151 I-.088 J.379 E.02081
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 114.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.08101
G1 X129.464 Y128.384 E-.06744
G1 X129.352 Y128.387 E-.04257
G1 X129.205 Y128.338 E-.0587
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.419 Y127.611 E-.0548
G1 X129.491 Y127.621 E-.02759
G1 X129.628 Y127.684 E-.05712
G1 X129.687 Y127.748 E-.03318
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 573/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L573
M991 S0 P572 ;notify layer change
G17
G3 Z114.8 I-1.21 J.126 P1  F30000
G1 X129.734 Y128.204 Z114.8
G1 Z114.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.419 Y127.611 I-.332 J-.204 E.05028
G1 X129.491 Y127.621 E.00223
G3 X129.762 Y128.151 I-.088 J.379 E.02081
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 114.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08957
G1 X129.468 Y128.384 E-.05716
G1 X129.352 Y128.387 E-.04415
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.034 Y128.133 E-.04415
G1 X129.011 Y127.981 E-.05869
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.419 Y127.611 E-.05486
G1 X129.491 Y127.621 E-.02752
G1 X129.628 Y127.684 E-.05713
G1 X129.687 Y127.748 E-.03332
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 574/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L574
M991 S0 P573 ;notify layer change
G17
G3 Z115 I-1.211 J.125 P1  F30000
G1 X129.734 Y128.204 Z115
G1 Z114.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.419 Y127.611 I-.332 J-.204 E.05028
G1 X129.491 Y127.621 E.00222
G3 X129.762 Y128.151 I-.088 J.379 E.02081
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 115
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08957
G1 X129.468 Y128.384 E-.05715
G1 X129.352 Y128.387 E-.04415
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.0587
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.419 Y127.611 E-.05492
G1 X129.491 Y127.621 E-.02745
G1 X129.628 Y127.684 E-.05713
G1 X129.687 Y127.748 E-.03332
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 575/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L575
M991 S0 P574 ;notify layer change
G17
G3 Z115.2 I-1.211 J.125 P1  F30000
G1 X129.734 Y128.204 Z115.2
G1 Z115
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.419 Y127.611 I-.332 J-.204 E.05029
G1 X129.491 Y127.621 E.00221
G3 X129.762 Y128.151 I-.088 J.379 E.02081
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 115.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.608 Y128.329 E-.08959
G1 X129.468 Y128.384 E-.05714
G1 X129.352 Y128.387 E-.04414
G1 X129.205 Y128.338 E-.05869
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.011 Y127.981 E-.04415
G1 X129.049 Y127.831 E-.05869
M73 P95 R0
G1 X129.142 Y127.708 E-.0587
G1 X129.276 Y127.631 E-.05869
G1 X129.419 Y127.611 E-.05499
G1 X129.491 Y127.621 E-.02738
G1 X129.628 Y127.684 E-.05714
G1 X129.687 Y127.748 E-.03333
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 576/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L576
M991 S0 P575 ;notify layer change
G17
G3 Z115.4 I-1.215 J.062 P1  F30000
G1 X129.712 Y128.236 Z115.4
G1 Z115.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.419 Y127.611 I-.309 J-.236 E.04906
G1 X129.491 Y127.621 E.00221
G3 X129.745 Y128.186 I-.088 J.379 E.02201
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 115.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.595 Y128.338 E-.08098
G1 X129.487 Y128.38 E-.04416
G1 X129.332 Y128.384 E-.05868
G1 X129.189 Y128.327 E-.05869
G1 X129.065 Y128.2 E-.06743
G1 X129.015 Y128.058 E-.05714
G1 X129.015 Y127.942 E-.04415
G1 X129.049 Y127.831 E-.04414
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.419 Y127.611 E-.05505
G1 X129.491 Y127.621 E-.02731
G1 X129.628 Y127.684 E-.05714
G1 X129.713 Y127.776 E-.04774
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 577/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L577
M991 S0 P576 ;notify layer change
G17
G3 Z115.6 I-1.217 J-.004 P1  F30000
G1 X129.711 Y128.236 Z115.6
G1 Z115.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.42 Y127.611 I-.308 J-.236 E.04896
G1 X129.491 Y127.621 E.0022
G3 X129.744 Y128.185 I-.088 J.378 E.02198
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 115.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.06663
G1 X129.487 Y128.38 E-.05869
G1 X129.332 Y128.384 E-.05869
G1 X129.205 Y128.338 E-.05143
G1 X129.089 Y128.235 E-.05869
G1 X129.022 Y128.096 E-.05869
G1 X129.015 Y127.942 E-.05869
G1 X129.067 Y127.797 E-.05869
G1 X129.142 Y127.708 E-.04415
G1 X129.276 Y127.631 E-.05869
G1 X129.42 Y127.611 E-.05511
G1 X129.491 Y127.621 E-.02724
G1 X129.628 Y127.684 E-.05716
G1 X129.712 Y127.775 E-.04744
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 578/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L578
M991 S0 P577 ;notify layer change
G17
G3 Z115.8 I-1.217 J-.001 P1  F30000
G1 X129.712 Y128.236 Z115.8
G1 Z115.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.42 Y127.611 I-.309 J-.236 E.04907
G1 X129.491 Y127.621 E.0022
G3 X129.745 Y128.186 I-.088 J.379 E.02201
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 115.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.06665
G1 X129.487 Y128.38 E-.05869
G1 X129.332 Y128.384 E-.05869
G1 X129.189 Y128.327 E-.05869
G1 X129.078 Y128.22 E-.0587
G1 X129.014 Y128.054 E-.06743
G1 X129.015 Y127.942 E-.04257
G1 X129.049 Y127.831 E-.04415
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.42 Y127.611 E-.05517
G1 X129.491 Y127.621 E-.02717
G1 X129.628 Y127.684 E-.05716
G1 X129.713 Y127.775 E-.04755
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 579/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L579
M991 S0 P578 ;notify layer change
G17
G3 Z116 I-1.217 J-.001 P1  F30000
G1 X129.712 Y128.236 Z116
G1 Z115.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.42 Y127.611 I-.309 J-.236 E.04907
G1 X129.491 Y127.621 E.00219
G3 X129.745 Y128.186 I-.088 J.379 E.02201
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 116
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.595 Y128.338 E-.081
G1 X129.448 Y128.387 E-.05869
G1 X129.332 Y128.384 E-.04415
G1 X129.222 Y128.347 E-.04414
G1 X129.104 Y128.253 E-.05717
G1 X129.022 Y128.096 E-.06739
G1 X129.015 Y127.942 E-.0587
G1 X129.049 Y127.831 E-.04414
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.42 Y127.611 E-.05523
G1 X129.491 Y127.621 E-.02711
G1 X129.628 Y127.684 E-.05716
G1 X129.713 Y127.776 E-.04774
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 580/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L580
M991 S0 P579 ;notify layer change
G17
G3 Z116.2 I-1.217 J-.004 P1  F30000
G1 X129.711 Y128.236 Z116.2
G1 Z116
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.42 Y127.611 I-.308 J-.236 E.04898
G1 X129.491 Y127.621 E.00219
G3 X129.744 Y128.185 I-.088 J.378 E.02199
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 116.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.595 Y128.338 E-.08096
G1 X129.448 Y128.387 E-.05869
G1 X129.332 Y128.384 E-.04414
G1 X129.189 Y128.327 E-.05869
G1 X129.078 Y128.22 E-.0587
G1 X129.018 Y128.077 E-.05868
G1 X129.015 Y127.942 E-.05144
G1 X129.049 Y127.831 E-.04415
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.42 Y127.611 E-.0553
G1 X129.491 Y127.621 E-.02703
G1 X129.628 Y127.684 E-.05717
G1 X129.713 Y127.776 E-.04767
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 581/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L581
M991 S0 P580 ;notify layer change
G17
G3 Z116.4 I-1.217 J-.002 P1  F30000
G1 X129.712 Y128.236 Z116.4
G1 Z116.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.42 Y127.611 I-.309 J-.236 E.04908
G1 X129.491 Y127.621 E.00218
G3 X129.745 Y128.186 I-.088 J.379 E.02201
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 116.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.627 Y128.316 E-.06665
G1 X129.487 Y128.38 E-.05869
G1 X129.332 Y128.384 E-.05869
G1 X129.189 Y128.327 E-.05869
G1 X129.066 Y128.2 E-.06738
G1 X129.015 Y128.058 E-.05718
G1 X129.015 Y127.942 E-.04415
G1 X129.049 Y127.831 E-.04414
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.42 Y127.611 E-.05536
G1 X129.491 Y127.621 E-.02697
G1 X129.628 Y127.684 E-.05717
G1 X129.713 Y127.775 E-.04754
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 582/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L582
M991 S0 P581 ;notify layer change
G17
G3 Z116.6 I-1.217 J-.001 P1  F30000
G1 X129.712 Y128.236 Z116.6
G1 Z116.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.42 Y127.611 I-.309 J-.236 E.04909
G1 X129.491 Y127.621 E.00218
G3 X129.745 Y128.186 I-.088 J.379 E.02201
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 116.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.06665
G1 X129.487 Y128.38 E-.05869
G1 X129.332 Y128.384 E-.05869
G1 X129.222 Y128.347 E-.04415
G1 X129.104 Y128.253 E-.05718
G1 X129.022 Y128.096 E-.06738
G1 X129.015 Y127.942 E-.0587
G1 X129.067 Y127.797 E-.05869
G1 X129.142 Y127.708 E-.04415
G1 X129.276 Y127.631 E-.05869
G1 X129.42 Y127.611 E-.05542
G1 X129.491 Y127.621 E-.0269
G1 X129.628 Y127.684 E-.05718
G1 X129.713 Y127.775 E-.04753
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 583/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L583
M991 S0 P582 ;notify layer change
G17
G3 Z116.8 I-1.217 J-.001 P1  F30000
G1 X129.712 Y128.236 Z116.8
G1 Z116.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.421 Y127.612 I-.309 J-.236 E.04909
G1 X129.491 Y127.621 E.00217
G3 X129.745 Y128.186 I-.088 J.379 E.02201
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 116.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.627 Y128.316 E-.06666
G1 X129.487 Y128.38 E-.05869
G1 X129.332 Y128.384 E-.05868
G1 X129.189 Y128.327 E-.05869
G1 X129.066 Y128.2 E-.06737
G1 X129.015 Y128.058 E-.05719
G1 X129.015 Y127.942 E-.04414
G1 X129.049 Y127.831 E-.04414
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.421 Y127.612 E-.05548
G1 X129.491 Y127.621 E-.02683
G1 X129.628 Y127.684 E-.05719
G1 X129.713 Y127.775 E-.04753
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 584/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L584
M991 S0 P583 ;notify layer change
G17
G3 Z117 I-1.217 J-.001 P1  F30000
G1 X129.712 Y128.236 Z117
G1 Z116.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.421 Y127.612 I-.309 J-.236 E.0491
G1 X129.491 Y127.621 E.00216
G3 X129.745 Y128.186 I-.088 J.379 E.02201
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 117
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.595 Y128.338 E-.08099
G1 X129.487 Y128.38 E-.04415
G1 X129.332 Y128.384 E-.05869
G1 X129.189 Y128.327 E-.0587
G1 X129.078 Y128.22 E-.05869
G1 X129.029 Y128.119 E-.04264
G1 X129.015 Y127.942 E-.06737
G1 X129.049 Y127.831 E-.04414
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.421 Y127.612 E-.05555
G1 X129.491 Y127.621 E-.02676
G1 X129.628 Y127.684 E-.0572
G1 X129.713 Y127.776 E-.04774
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 585/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L585
M991 S0 P584 ;notify layer change
G17
G3 Z117.2 I-1.216 J.058 P1  F30000
G1 X129.733 Y128.204 Z117.2
G1 Z117
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.421 Y127.612 I-.33 J-.204 E.0502
G1 X129.491 Y127.621 E.00216
G3 X129.761 Y128.15 I-.088 J.378 E.02079
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 117.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.081
G1 X129.487 Y128.38 E-.0587
G1 X129.332 Y128.384 E-.05869
G1 X129.189 Y128.327 E-.05869
G1 X129.078 Y128.22 E-.05869
G1 X129.018 Y128.077 E-.05869
G1 X129.015 Y127.942 E-.05144
G1 X129.049 Y127.831 E-.04414
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.421 Y127.612 E-.05561
G1 X129.491 Y127.621 E-.02669
G1 X129.628 Y127.684 E-.0572
G1 X129.687 Y127.747 E-.03308
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 586/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L586
M991 S0 P585 ;notify layer change
G17
G3 Z117.4 I-1.215 J.061 P1  F30000
G1 X129.711 Y128.236 Z117.4
G1 Z117.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.421 Y127.612 I-.308 J-.236 E.049
G1 X129.491 Y127.621 E.00215
G3 X129.744 Y128.185 I-.088 J.378 E.02199
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 117.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.06663
G1 X129.487 Y128.38 E-.0587
G1 X129.332 Y128.384 E-.05869
G1 X129.189 Y128.327 E-.05869
G1 X129.078 Y128.22 E-.05869
G1 X129.014 Y128.055 E-.06687
G1 X129.015 Y127.942 E-.04315
G1 X129.049 Y127.831 E-.04415
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.05869
G1 X129.421 Y127.612 E-.05567
G1 X129.491 Y127.621 E-.02663
G1 X129.628 Y127.684 E-.05721
G1 X129.713 Y127.775 E-.04755
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 587/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L587
M991 S0 P586 ;notify layer change
G17
G3 Z117.6 I-1.217 J-.003 P1  F30000
G1 X129.711 Y128.236 Z117.6
G1 Z117.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.421 Y127.612 I-.308 J-.236 E.04901
G1 X129.491 Y127.621 E.00215
G3 X129.744 Y128.185 I-.088 J.378 E.02199
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 117.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.595 Y128.338 E-.08096
G1 X129.487 Y128.38 E-.04415
G1 X129.332 Y128.384 E-.05869
G1 X129.189 Y128.327 E-.05869
G1 X129.078 Y128.22 E-.0587
G1 X129.018 Y128.077 E-.05869
G1 X129.015 Y127.942 E-.05144
G1 X129.067 Y127.797 E-.05869
G1 X129.142 Y127.708 E-.04414
G1 X129.276 Y127.631 E-.0587
G1 X129.421 Y127.612 E-.05572
G1 X129.491 Y127.621 E-.02655
G1 X129.628 Y127.684 E-.05722
G1 X129.713 Y127.776 E-.04767
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 588/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L588
M991 S0 P587 ;notify layer change
G17
G3 Z117.8 I-1.217 J-.002 P1  F30000
G1 X129.712 Y128.236 Z117.8
G1 Z117.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.421 Y127.612 I-.309 J-.236 E.04912
G1 X129.49 Y127.621 E.00214
G3 X129.745 Y128.186 I-.088 J.379 E.02202
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 117.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.595 Y128.338 E-.08099
G1 X129.448 Y128.387 E-.0587
G1 X129.332 Y128.384 E-.04414
G1 X129.222 Y128.347 E-.04414
G1 X129.104 Y128.253 E-.05723
G1 X129.022 Y128.096 E-.06735
G1 X129.015 Y127.942 E-.05869
G1 X129.049 Y127.831 E-.04414
G1 X129.142 Y127.708 E-.0587
G1 X129.276 Y127.631 E-.05869
G1 X129.421 Y127.612 E-.05579
G1 X129.49 Y127.621 E-.02648
G1 X129.627 Y127.684 E-.05722
G1 X129.713 Y127.776 E-.04775
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 589/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L589
M991 S0 P588 ;notify layer change
G17
G3 Z118 I-1.217 J-.002 P1  F30000
G1 X129.712 Y128.236 Z118
G1 Z117.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.422 Y127.612 I-.309 J-.236 E.04912
G1 X129.49 Y127.621 E.00214
G3 X129.745 Y128.186 I-.088 J.379 E.02202
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 118
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.595 Y128.338 E-.08099
G1 X129.487 Y128.38 E-.04415
G1 X129.332 Y128.384 E-.05869
G1 X129.189 Y128.327 E-.05869
G1 X129.078 Y128.22 E-.0587
G1 X129.029 Y128.119 E-.04267
G1 X129.015 Y127.942 E-.06733
G1 X129.067 Y127.797 E-.05869
G1 X129.142 Y127.708 E-.04415
G1 X129.276 Y127.631 E-.05869
G1 X129.422 Y127.612 E-.05585
G1 X129.49 Y127.621 E-.02641
G1 X129.628 Y127.684 E-.05723
G1 X129.713 Y127.776 E-.04776
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 590/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L590
M991 S0 P589 ;notify layer change
G17
G3 Z118.2 I-1.217 J-.002 P1  F30000
G1 X129.712 Y128.236 Z118.2
G1 Z118
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.422 Y127.612 I-.309 J-.236 E.04913
G1 X129.49 Y127.621 E.00213
G3 X129.745 Y128.186 I-.088 J.379 E.02202
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 118.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.06665
G1 X129.487 Y128.38 E-.05869
G1 X129.332 Y128.384 E-.05869
G1 X129.189 Y128.327 E-.05869
G1 X129.066 Y128.2 E-.06732
G1 X129.015 Y128.058 E-.05724
G1 X129.015 Y127.942 E-.04415
G1 X129.067 Y127.797 E-.05868
G1 X129.142 Y127.708 E-.04415
G1 X129.276 Y127.631 E-.05869
G1 X129.422 Y127.612 E-.05592
G1 X129.49 Y127.621 E-.02635
G1 X129.628 Y127.684 E-.05724
G1 X129.713 Y127.775 E-.04754
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 591/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L591
M991 S0 P590 ;notify layer change
G17
G3 Z118.4 I-1.217 J-.003 P1  F30000
G1 X129.711 Y128.236 Z118.4
G1 Z118.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.422 Y127.612 I-.308 J-.236 E.04903
G1 X129.49 Y127.621 E.00212
G3 X129.744 Y128.185 I-.087 J.378 E.02199
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 118.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.628 Y128.316 E-.06664
G1 X129.487 Y128.38 E-.05869
G1 X129.332 Y128.384 E-.05869
G1 X129.189 Y128.327 E-.05869
G1 X129.078 Y128.22 E-.05869
G1 X129.028 Y128.117 E-.04316
G1 X129.015 Y127.942 E-.06687
G1 X129.067 Y127.797 E-.05869
G1 X129.142 Y127.708 E-.04414
G1 X129.276 Y127.631 E-.0587
G1 X129.422 Y127.612 E-.05597
G1 X129.49 Y127.621 E-.02628
G1 X129.628 Y127.684 E-.05724
G1 X129.713 Y127.775 E-.04755
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 592/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L592
M991 S0 P591 ;notify layer change
G17
G3 Z118.6 I-1.217 J-.001 P1  F30000
G1 X129.712 Y128.236 Z118.6
G1 Z118.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.422 Y127.612 I-.309 J-.236 E.04913
G1 X129.49 Y127.621 E.00212
G3 X129.745 Y128.186 I-.088 J.379 E.02202
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 118.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.595 Y128.338 E-.08098
G1 X129.487 Y128.38 E-.04415
G1 X129.332 Y128.384 E-.0587
G1 X129.189 Y128.327 E-.05869
G1 X129.066 Y128.2 E-.06732
G1 X129.015 Y128.058 E-.05725
G1 X129.015 Y127.942 E-.04415
G1 X129.067 Y127.797 E-.05869
G1 X129.142 Y127.708 E-.04415
G1 X129.276 Y127.631 E-.05869
G1 X129.422 Y127.612 E-.05603
G1 X129.49 Y127.621 E-.02621
G1 X129.628 Y127.684 E-.05725
G1 X129.713 Y127.776 E-.04775
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 593/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L593
M991 S0 P592 ;notify layer change
G17
G3 Z118.8 I-1.215 J-.074 P1  F30000
G1 X129.683 Y128.263 Z118.8
G1 Z118.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.263 E.04734
G1 X129.417 Y127.611 E.0008
G3 X129.721 Y128.216 I-.02 J.389 E.0252
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 118.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08076
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.049 Y128.17 E-.05121
G1 X129.011 Y128.019 E-.05892
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.0587
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05892
G1 X129.417 Y127.611 E-.00987
G1 X129.56 Y127.645 E-.05601
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03347
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 594/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L594
M991 S0 P593 ;notify layer change
G17
G3 Z119 I-1.21 J-.129 P1  F30000
G1 X129.683 Y128.263 Z119
G1 Z118.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.263 E.04733
G1 X129.417 Y127.611 E.0008
G3 X129.721 Y128.216 I-.021 J.389 E.0252
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 119
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08076
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.049 Y128.17 E-.05121
G1 X129.011 Y128.019 E-.05892
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05892
G1 X129.417 Y127.611 E-.00993
G1 X129.56 Y127.645 E-.05595
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03347
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 595/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L595
M991 S0 P594 ;notify layer change
G17
G3 Z119.2 I-1.202 J-.189 P1  F30000
G1 X129.656 Y128.29 Z119.2
G1 Z119
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.29 E.04615
G1 X129.417 Y127.611 E.00081
G3 X129.698 Y128.247 I-.021 J.389 E.02638
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 119.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06653
G1 X129.41 Y128.39 E-.05869
G1 X129.298 Y128.376 E-.04271
G1 X129.142 Y128.292 E-.06729
G1 X129.049 Y128.169 E-.0587
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05892
G1 X129.417 Y127.611 E-.01
G1 X129.56 Y127.645 E-.05588
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04782
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 596/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L596
M991 S0 P595 ;notify layer change
G17
G3 Z119.4 I-1.201 J-.194 P1  F30000
G1 X129.683 Y128.263 Z119.4
G1 Z119.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.263 E.04733
G1 X129.417 Y127.611 E.00081
G3 X129.721 Y128.216 I-.021 J.389 E.02519
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 119.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08076
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.127 Y128.279 E-.0589
G1 X129.049 Y128.169 E-.05122
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.0587
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05891
G1 X129.417 Y127.611 E-.01007
G1 X129.56 Y127.645 E-.05582
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03348
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 597/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L597
M991 S0 P596 ;notify layer change
G17
G3 Z119.6 I-1.202 J-.189 P1  F30000
G1 X129.656 Y128.29 Z119.6
G1 Z119.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.29 E.04614
G1 X129.418 Y127.611 E.00082
G3 X129.698 Y128.247 I-.021 J.389 E.02637
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 119.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06653
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.041 Y128.151 E-.05869
G1 X129.011 Y128.019 E-.05143
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05891
G1 X129.418 Y127.611 E-.01014
G1 X129.56 Y127.645 E-.05576
G1 X129.686 Y127.735 E-.05868
G1 X129.751 Y127.842 E-.04771
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 598/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L598
M991 S0 P597 ;notify layer change
G17
G3 Z119.8 I-1.202 J-.193 P1  F30000
G1 X129.684 Y128.263 Z119.8
G1 Z119.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.263 E.04733
G1 X129.418 Y127.611 E.00083
G3 X129.721 Y128.216 I-.021 J.389 E.02519
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 119.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08077
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.0587
G1 X129.041 Y128.151 E-.05869
G1 X129.011 Y128.019 E-.05143
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.0587
G1 X129.391 Y127.61 E-.0589
G1 X129.418 Y127.611 E-.0102
G1 X129.56 Y127.645 E-.0557
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03347
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 599/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L599
M991 S0 P598 ;notify layer change
G17
G3 Z120 I-1.202 J-.189 P1  F30000
G1 X129.656 Y128.29 Z120
G1 Z119.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.29 E.04614
G1 X129.418 Y127.611 E.00083
G3 X129.698 Y128.247 I-.021 J.389 E.02637
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 120
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.524 Y128.369 E-.08078
G1 X129.41 Y128.39 E-.04414
G1 X129.258 Y128.363 E-.05868
G1 X129.128 Y128.279 E-.0587
G1 X129.06 Y128.19 E-.04275
G1 X129.011 Y128.019 E-.06726
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.0587
G1 X129.24 Y127.645 E-.05868
G1 X129.391 Y127.61 E-.0589
G1 X129.418 Y127.611 E-.01028
G1 X129.56 Y127.645 E-.05563
G1 X129.686 Y127.735 E-.0587
G1 X129.752 Y127.843 E-.04811
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 600/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L600
M991 S0 P599 ;notify layer change
G17
G3 Z120.2 I-1.201 J-.195 P1  F30000
G1 X129.684 Y128.263 Z120.2
G1 Z120
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.263 E.04732
G1 X129.418 Y127.611 E.00084
G3 X129.721 Y128.216 I-.021 J.389 E.02518
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 120.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08077
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.041 Y128.151 E-.05869
G1 X129.011 Y128.019 E-.05144
G1 X129.034 Y127.867 E-.0587
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05889
G1 X129.418 Y127.611 E-.01034
G1 X129.56 Y127.645 E-.05557
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03346
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 601/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L601
M991 S0 P600 ;notify layer change
G17
G3 Z120.4 I-1.202 J-.189 P1  F30000
G1 X129.656 Y128.29 Z120.4
G1 Z120.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.29 E.04613
G1 X129.418 Y127.611 E.00084
G3 X129.698 Y128.247 I-.021 J.389 E.02636
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 120.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06653
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.06 Y128.19 E-.04276
G1 X129.011 Y128.019 E-.06725
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.0587
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05889
G1 X129.418 Y127.611 E-.01041
G1 X129.56 Y127.645 E-.05551
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04781
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 602/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L602
M991 S0 P601 ;notify layer change
G17
G3 Z120.6 I-1.19 J-.253 P1  F30000
G1 X129.656 Y128.29 Z120.6
G1 Z120.4
G1 E.8 F1800
M204 S5000
G1 F1200
M73 P96 R0
G3 X129.391 Y127.61 I-.259 J-.29 E.04613
G1 X129.418 Y127.611 E.00085
G3 X129.698 Y128.247 I-.022 J.389 E.02636
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 120.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06653
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.041 Y128.151 E-.0587
G1 X129.011 Y128.019 E-.05143
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05888
G1 X129.418 Y127.611 E-.01048
G1 X129.56 Y127.645 E-.05544
G1 X129.686 Y127.735 E-.0587
G1 X129.751 Y127.842 E-.04769
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 603/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L603
M991 S0 P602 ;notify layer change
G17
G3 Z120.8 I-1.202 J-.193 P1  F30000
G1 X129.684 Y128.263 Z120.8
G1 Z120.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.263 E.04732
G1 X129.419 Y127.611 E.00085
G3 X129.721 Y128.216 I-.022 J.389 E.02517
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 120.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08078
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.049 Y128.169 E-.05144
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05888
G1 X129.419 Y127.611 E-.01054
G1 X129.56 Y127.645 E-.05539
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03345
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 604/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L604
M991 S0 P603 ;notify layer change
G17
G3 Z121 I-1.202 J-.189 P1  F30000
G1 X129.656 Y128.29 Z121
G1 Z120.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.04613
G1 X129.419 Y127.611 E.00086
G3 X129.698 Y128.247 I-.022 J.389 E.02635
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 121
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06653
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.041 Y128.151 E-.05869
G1 X129.011 Y128.02 E-.05126
G1 X129.034 Y127.867 E-.05887
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.0587
G1 X129.391 Y127.61 E-.05886
G1 X129.419 Y127.611 E-.01062
G1 X129.56 Y127.645 E-.05532
G1 X129.686 Y127.735 E-.0587
G1 X129.751 Y127.842 E-.04769
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 605/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L605
M991 S0 P604 ;notify layer change
G17
G3 Z121.2 I-1.191 J-.252 P1  F30000
G1 X129.656 Y128.29 Z121.2
G1 Z121
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.04613
G1 X129.419 Y127.611 E.00086
G3 X129.698 Y128.247 I-.022 J.389 E.02635
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 121.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06654
G1 X129.41 Y128.39 E-.05868
G1 X129.258 Y128.363 E-.05868
G1 X129.128 Y128.279 E-.05888
G1 X129.049 Y128.169 E-.05126
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05887
G1 X129.419 Y127.611 E-.01069
G1 X129.56 Y127.645 E-.05526
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04769
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 606/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L606
M991 S0 P605 ;notify layer change
G17
G3 Z121.4 I-1.191 J-.252 P1  F30000
G1 X129.656 Y128.29 Z121.4
G1 Z121.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.04612
G1 X129.419 Y127.611 E.00087
G3 X129.698 Y128.247 I-.022 J.389 E.02634
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 121.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06654
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.0587
G1 X129.128 Y128.279 E-.05869
G1 X129.041 Y128.151 E-.05869
G1 X129.011 Y128.019 E-.05143
G1 X129.034 Y127.867 E-.0587
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05887
G1 X129.419 Y127.611 E-.01075
G1 X129.56 Y127.645 E-.0552
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04768
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 607/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L607
M991 S0 P606 ;notify layer change
G17
G3 Z121.6 I-1.202 J-.192 P1  F30000
G1 X129.684 Y128.263 Z121.6
G1 Z121.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.263 E.04731
G1 X129.419 Y127.611 E.00088
G3 X129.721 Y128.216 I-.022 J.389 E.02515
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 121.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08077
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.049 Y128.17 E-.05127
G1 X129.011 Y128.019 E-.05886
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.0587
G1 X129.24 Y127.645 E-.05868
G1 X129.391 Y127.61 E-.05886
G1 X129.419 Y127.611 E-.01083
G1 X129.56 Y127.645 E-.05513
G1 X129.686 Y127.735 E-.0587
G1 X129.732 Y127.81 E-.03344
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 608/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L608
M991 S0 P607 ;notify layer change
G17
G3 Z121.8 I-1.21 J-.128 P1  F30000
G1 X129.684 Y128.263 Z121.8
G1 Z121.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.264 E.04731
G1 X129.419 Y127.611 E.00088
G3 X129.721 Y128.216 I-.022 J.389 E.02515
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 121.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08078
G1 X129.41 Y128.39 E-.0587
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.049 Y128.169 E-.05128
G1 X129.011 Y128.019 E-.05885
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.0587
G1 X129.391 Y127.61 E-.05885
G1 X129.419 Y127.611 E-.01089
G1 X129.56 Y127.645 E-.05508
G1 X129.686 Y127.735 E-.05868
G1 X129.732 Y127.81 E-.03344
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 609/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L609
M991 S0 P608 ;notify layer change
G17
G3 Z122 I-1.21 J-.128 P1  F30000
G1 X129.684 Y128.263 Z122
G1 Z121.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.264 E.0473
G1 X129.42 Y127.611 E.00089
G3 X129.721 Y128.216 I-.023 J.389 E.02515
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 122
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08078
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.06 Y128.189 E-.04281
G1 X129.011 Y128.019 E-.0672
G1 X129.034 Y127.867 E-.0587
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05884
G1 X129.42 Y127.611 E-.01097
G1 X129.56 Y127.645 E-.05501
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03354
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 610/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L610
M991 S0 P609 ;notify layer change
G17
G3 Z122.2 I-1.21 J-.128 P1  F30000
G1 X129.684 Y128.263 Z122.2
G1 Z122
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.264 E.0473
G1 X129.42 Y127.611 E.00089
G3 X129.721 Y128.216 I-.023 J.389 E.02514
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 122.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08079
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.041 Y128.151 E-.0587
G1 X129.011 Y128.019 E-.05142
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.0587
G1 X129.391 Y127.61 E-.05884
G1 X129.42 Y127.611 E-.01103
G1 X129.56 Y127.645 E-.05495
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03343
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 611/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L611
M991 S0 P610 ;notify layer change
G17
G3 Z122.4 I-1.202 J-.188 P1  F30000
G1 X129.656 Y128.29 Z122.4
G1 Z122.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.04611
G1 X129.42 Y127.611 E.0009
G3 X129.698 Y128.247 I-.023 J.389 E.02633
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 122.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06653
G1 X129.41 Y128.39 E-.05869
G1 X129.237 Y128.354 E-.06688
G1 X129.142 Y128.292 E-.04315
G1 X129.049 Y128.169 E-.0587
G1 X129.011 Y128.019 E-.05868
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05884
G1 X129.42 Y127.611 E-.0111
G1 X129.56 Y127.645 E-.05488
G1 X129.686 Y127.735 E-.0587
G1 X129.751 Y127.842 E-.04778
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 612/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L612
M991 S0 P611 ;notify layer change
G17
G3 Z122.6 I-1.191 J-.252 P1  F30000
G1 X129.656 Y128.29 Z122.6
G1 Z122.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.04611
G1 X129.42 Y127.611 E.0009
G3 X129.698 Y128.247 I-.023 J.389 E.02632
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 122.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06654
G1 X129.41 Y128.39 E-.05869
G1 X129.237 Y128.354 E-.06687
G1 X129.142 Y128.292 E-.04316
G1 X129.049 Y128.169 E-.05869
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.0587
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05884
G1 X129.42 Y127.611 E-.01117
G1 X129.56 Y127.645 E-.05482
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04778
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 613/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L613
M991 S0 P612 ;notify layer change
G17
G3 Z122.8 I-1.202 J-.192 P1  F30000
G1 X129.684 Y128.263 Z122.8
G1 Z122.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.264 E.0473
G1 X129.42 Y127.611 E.00091
G3 X129.721 Y128.216 I-.023 J.389 E.02513
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 122.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08079
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.049 Y128.169 E-.05129
G1 X129.011 Y128.019 E-.05883
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.0587
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05883
G1 X129.42 Y127.611 E-.01123
G1 X129.56 Y127.645 E-.05475
G1 X129.686 Y127.735 E-.0587
G1 X129.732 Y127.81 E-.03343
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 614/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L614
M991 S0 P613 ;notify layer change
G17
G3 Z123 I-1.21 J-.127 P1  F30000
G1 X129.684 Y128.263 Z123
G1 Z122.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.264 E.04729
G1 X129.42 Y127.611 E.00091
G3 X129.721 Y128.216 I-.023 J.389 E.02513
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 123
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08079
G1 X129.41 Y128.39 E-.0587
G1 X129.294 Y128.375 E-.04414
G1 X129.159 Y128.306 E-.05771
G1 X129.049 Y128.169 E-.06687
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05883
G1 X129.42 Y127.611 E-.0113
G1 X129.56 Y127.645 E-.05469
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03352
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 615/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L615
M991 S0 P614 ;notify layer change
G17
G3 Z123.2 I-1.202 J-.189 P1  F30000
G1 X129.656 Y128.29 Z123.2
G1 Z123
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.0461
G1 X129.421 Y127.611 E.00092
G3 X129.698 Y128.247 I-.023 J.389 E.02631
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 123.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06655
G1 X129.41 Y128.39 E-.05868
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.0587
G1 X129.033 Y128.131 E-.06687
G1 X129.011 Y128.019 E-.04315
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.0587
G1 X129.24 Y127.645 E-.05868
G1 X129.391 Y127.61 E-.05882
G1 X129.421 Y127.611 E-.01137
G1 X129.56 Y127.645 E-.05463
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04777
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 616/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L616
M991 S0 P615 ;notify layer change
G17
G3 Z123.4 I-1.202 J-.192 P1  F30000
G1 X129.684 Y128.263 Z123.4
G1 Z123.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.264 E.04729
G1 X129.421 Y127.611 E.00092
G3 X129.721 Y128.216 I-.023 J.389 E.02512
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 123.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08079
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05882
G1 X129.049 Y128.169 E-.05131
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.0587
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05881
G1 X129.421 Y127.611 E-.01144
G1 X129.56 Y127.645 E-.05457
G1 X129.686 Y127.735 E-.05868
G1 X129.732 Y127.81 E-.03342
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 617/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L617
M991 S0 P616 ;notify layer change
G17
G3 Z123.6 I-1.202 J-.188 P1  F30000
G1 X129.656 Y128.291 Z123.6
G1 Z123.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.0461
G1 X129.421 Y127.611 E.00093
G3 X129.698 Y128.247 I-.024 J.389 E.02631
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 123.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06654
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.0587
G1 X129.049 Y128.169 E-.0513
G1 X129.011 Y128.019 E-.05882
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05881
G1 X129.421 Y127.611 E-.01151
G1 X129.56 Y127.645 E-.0545
G1 X129.686 Y127.735 E-.0587
G1 X129.751 Y127.842 E-.04766
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 618/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L618
M991 S0 P617 ;notify layer change
G17
G3 Z123.8 I-1.191 J-.251 P1  F30000
G1 X129.656 Y128.291 Z123.8
G1 Z123.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.0461
G1 X129.421 Y127.611 E.00094
G3 X129.698 Y128.247 I-.024 J.389 E.02631
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 123.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06654
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05881
G1 X129.049 Y128.169 E-.05132
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.0587
G1 X129.391 Y127.61 E-.05881
G1 X129.421 Y127.611 E-.01157
G1 X129.56 Y127.645 E-.05444
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04766
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 619/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L619
M991 S0 P618 ;notify layer change
G17
G3 Z124 I-1.191 J-.251 P1  F30000
G1 X129.656 Y128.291 Z124
G1 Z123.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.0461
G1 X129.421 Y127.611 E.00094
G3 X129.698 Y128.247 I-.024 J.389 E.0263
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 124
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06655
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.0587
G1 X129.128 Y128.279 E-.05869
G1 X129.049 Y128.169 E-.05132
G1 X129.011 Y128.019 E-.0588
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05881
G1 X129.421 Y127.611 E-.01164
G1 X129.56 Y127.645 E-.05438
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04766
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 620/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L620
M991 S0 P619 ;notify layer change
G17
G3 Z124.2 I-1.191 J-.251 P1  F30000
G1 X129.656 Y128.291 Z124.2
G1 Z124
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.04609
G1 X129.421 Y127.611 E.00095
G3 X129.698 Y128.247 I-.024 J.389 E.0263
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 124.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06655
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05881
G1 X129.049 Y128.169 E-.05132
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.0587
G1 X129.114 Y127.735 E-.0587
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.0588
G1 X129.421 Y127.611 E-.01171
G1 X129.56 Y127.645 E-.05432
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04765
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 621/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L621
M991 S0 P620 ;notify layer change
G17
G3 Z124.4 I-1.202 J-.191 P1  F30000
G1 X129.684 Y128.263 Z124.4
G1 Z124.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.287 J-.264 E.04728
G1 X129.422 Y127.611 E.00095
G3 X129.721 Y128.216 I-.024 J.389 E.02511
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 124.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.0808
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05879
G1 X129.049 Y128.169 E-.05133
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.0588
G1 X129.422 Y127.611 E-.01178
G1 X129.56 Y127.645 E-.05426
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.0334
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 622/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L622
M991 S0 P621 ;notify layer change
G17
G3 Z124.6 I-1.202 J-.188 P1  F30000
G1 X129.656 Y128.291 Z124.6
G1 Z124.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.04609
G1 X129.422 Y127.611 E.00096
G3 X129.698 Y128.247 I-.024 J.389 E.02629
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 124.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06655
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.049 Y128.169 E-.05144
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.0588
G1 X129.422 Y127.611 E-.01184
G1 X129.56 Y127.645 E-.0542
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04765
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 623/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L623
M991 S0 P622 ;notify layer change
G17
G3 Z124.8 I-1.191 J-.251 P1  F30000
G1 X129.656 Y128.291 Z124.8
G1 Z124.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.04609
G1 X129.422 Y127.611 E.00096
G3 X129.698 Y128.247 I-.024 J.389 E.02629
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 124.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06655
G1 X129.41 Y128.39 E-.05869
G1 X129.276 Y128.369 E-.05144
G1 X129.142 Y128.292 E-.05869
G1 X129.049 Y128.169 E-.05869
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.0587
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05879
G1 X129.422 Y127.611 E-.01191
G1 X129.56 Y127.645 E-.05413
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04766
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 624/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L624
M991 S0 P623 ;notify layer change
G17
G3 Z125 I-1.191 J-.251 P1  F30000
G1 X129.656 Y128.291 Z125
G1 Z124.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.04608
G1 X129.422 Y127.611 E.00097
G3 X129.698 Y128.247 I-.025 J.389 E.02629
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 125
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.524 Y128.369 E-.0808
G1 X129.41 Y128.39 E-.04415
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.059 Y128.189 E-.04315
G1 X129.011 Y128.019 E-.06687
G1 X129.034 Y127.867 E-.0587
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05879
G1 X129.422 Y127.611 E-.01198
G1 X129.56 Y127.645 E-.05407
G1 X129.686 Y127.735 E-.05869
G1 X129.752 Y127.843 E-.04804
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 625/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L625
M991 S0 P624 ;notify layer change
G17
G3 Z125.2 I-1.19 J-.253 P1  F30000
G1 X129.656 Y128.291 Z125.2
G1 Z125
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.04608
G1 X129.422 Y127.611 E.00097
G3 X129.698 Y128.247 I-.025 J.389 E.02628
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 125.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.524 Y128.369 E-.0808
G1 X129.41 Y128.39 E-.04415
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.041 Y128.151 E-.05869
G1 X129.011 Y128.019 E-.05143
G1 X129.034 Y127.867 E-.0587
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.391 Y127.61 E-.05878
G1 X129.422 Y127.611 E-.01205
G1 X129.56 Y127.645 E-.054
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.843 E-.04794
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 626/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L626
M991 S0 P625 ;notify layer change
G17
G3 Z125.4 I-1.191 J-.252 P1  F30000
G1 X129.657 Y128.291 Z125.4
G1 Z125.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.391 Y127.61 I-.259 J-.291 E.04608
G1 X129.422 Y127.611 E.00098
G3 X129.698 Y128.247 I-.025 J.389 E.02628
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 125.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06655
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.041 Y128.151 E-.0587
G1 X129.011 Y127.978 E-.06687
G1 X129.049 Y127.831 E-.05769
G1 X129.142 Y127.708 E-.0587
G1 X129.276 Y127.631 E-.0587
G1 X129.391 Y127.61 E-.04423
G1 X129.422 Y127.611 E-.01211
G1 X129.56 Y127.645 E-.05395
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04774
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 627/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L627
M991 S0 P626 ;notify layer change
G17
G3 Z125.6 I-1.191 J-.251 P1  F30000
G1 X129.657 Y128.291 Z125.6
G1 Z125.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.259 J-.291 E.04608
G1 X129.423 Y127.611 E.00099
G3 X129.698 Y128.247 I-.025 J.389 E.02628
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 125.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06655
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.041 Y128.151 E-.05869
G1 X129.011 Y128.019 E-.05143
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05877
G1 X129.423 Y127.611 E-.01219
G1 X129.56 Y127.645 E-.05388
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04765
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 628/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L628
M991 S0 P627 ;notify layer change
G17
G3 Z125.8 I-1.202 J-.191 P1  F30000
G1 X129.684 Y128.264 Z125.8
G1 Z125.6
G1 E.8 F1800
M204 S5000
G1 F1200
M73 P97 R0
G3 X129.39 Y127.61 I-.286 J-.264 E.04726
G1 X129.423 Y127.611 E.00099
G3 X129.721 Y128.216 I-.025 J.389 E.02509
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 125.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.0808
G1 X129.41 Y128.39 E-.05869
G1 X129.276 Y128.369 E-.05143
G1 X129.142 Y128.292 E-.0587
G1 X129.049 Y128.169 E-.05869
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.0587
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05877
G1 X129.423 Y127.611 E-.01225
G1 X129.56 Y127.645 E-.05382
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03339
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 629/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L629
M991 S0 P628 ;notify layer change
G17
G3 Z126 I-1.202 J-.187 P1  F30000
G1 X129.657 Y128.291 Z126
G1 Z125.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.259 J-.291 E.04607
G1 X129.423 Y127.611 E.001
G3 X129.698 Y128.247 I-.025 J.389 E.02627
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 126
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06655
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.049 Y128.169 E-.05136
G1 X129.011 Y128.019 E-.05877
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05877
G1 X129.423 Y127.611 E-.01232
G1 X129.56 Y127.645 E-.05375
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04764
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 630/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L630
M991 S0 P629 ;notify layer change
G17
G3 Z126.2 I-1.202 J-.191 P1  F30000
G1 X129.684 Y128.264 Z126.2
G1 Z126
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.286 J-.264 E.04726
G1 X129.423 Y127.611 E.001
G3 X129.721 Y128.216 I-.025 J.389 E.02508
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 126.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08082
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.0587
G1 X129.041 Y128.151 E-.05869
G1 X129.011 Y127.978 E-.06687
G1 X129.049 Y127.831 E-.0577
G1 X129.142 Y127.708 E-.05869
G1 X129.276 Y127.631 E-.0587
G1 X129.39 Y127.61 E-.04421
G1 X129.423 Y127.611 E-.01238
G1 X129.56 Y127.645 E-.0537
G1 X129.686 Y127.735 E-.05868
G1 X129.732 Y127.81 E-.03347
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 631/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L631
M991 S0 P630 ;notify layer change
G17
G3 Z126.4 I-1.202 J-.188 P1  F30000
G1 X129.657 Y128.291 Z126.4
G1 Z126.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.259 J-.291 E.04607
G1 X129.423 Y127.611 E.00101
G3 X129.698 Y128.247 I-.025 J.389 E.02627
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 126.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.524 Y128.369 E-.08082
G1 X129.41 Y128.39 E-.04415
G1 X129.276 Y128.369 E-.05144
G1 X129.142 Y128.292 E-.05869
G1 X129.049 Y128.169 E-.05869
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05876
G1 X129.423 Y127.611 E-.01246
G1 X129.56 Y127.645 E-.05363
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.843 E-.04792
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 632/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L632
M991 S0 P631 ;notify layer change
G17
G3 Z126.6 I-1.191 J-.252 P1  F30000
G1 X129.657 Y128.291 Z126.6
G1 Z126.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.259 J-.291 E.04606
G1 X129.423 Y127.611 E.00101
G3 X129.698 Y128.247 I-.026 J.389 E.02626
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 126.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06656
G1 X129.41 Y128.39 E-.05869
G1 X129.297 Y128.376 E-.04299
G1 X129.142 Y128.292 E-.06703
G1 X129.049 Y128.169 E-.05869
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05875
G1 X129.423 Y127.611 E-.01253
G1 X129.56 Y127.645 E-.05356
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04774
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 633/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L633
M991 S0 P632 ;notify layer change
G17
G3 Z126.8 I-1.202 J-.191 P1  F30000
G1 X129.684 Y128.264 Z126.8
G1 Z126.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.286 J-.264 E.04725
G1 X129.424 Y127.611 E.00102
G3 X129.721 Y128.217 I-.026 J.389 E.02507
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 126.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08082
G1 X129.41 Y128.39 E-.05869
G1 X129.276 Y128.369 E-.05144
G1 X129.142 Y128.292 E-.05869
G1 X129.049 Y128.169 E-.05869
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.0587
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.0587
G1 X129.39 Y127.61 E-.05875
G1 X129.424 Y127.611 E-.01259
G1 X129.56 Y127.645 E-.0535
G1 X129.686 Y127.735 E-.05869
G1 X129.731 Y127.81 E-.03337
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 634/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L634
M991 S0 P633 ;notify layer change
G17
G3 Z127 I-1.203 J-.187 P1  F30000
G1 X129.657 Y128.291 Z127
G1 Z126.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.259 J-.291 E.04606
G1 X129.424 Y127.611 E.00102
G3 X129.698 Y128.248 I-.026 J.389 E.02626
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 127
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06656
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.049 Y128.169 E-.05138
G1 X129.011 Y128.019 E-.05874
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05875
G1 X129.424 Y127.611 E-.01266
G1 X129.56 Y127.645 E-.05344
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04763
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 635/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L635
M991 S0 P634 ;notify layer change
G17
G3 Z127.2 I-1.191 J-.25 P1  F30000
G1 X129.657 Y128.291 Z127.2
G1 Z127
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.259 J-.291 E.04606
G1 X129.424 Y127.611 E.00103
G3 X129.698 Y128.248 I-.026 J.389 E.02625
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 127.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06656
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05875
G1 X129.049 Y128.169 E-.05137
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.0587
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05875
G1 X129.424 Y127.611 E-.01272
G1 X129.56 Y127.645 E-.05338
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04763
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 636/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L636
M991 S0 P635 ;notify layer change
G17
G3 Z127.4 I-1.191 J-.25 P1  F30000
G1 X129.657 Y128.291 Z127.4
G1 Z127.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.259 J-.291 E.04605
G1 X129.424 Y127.611 E.00103
G3 X129.698 Y128.248 I-.026 J.389 E.02625
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 127.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06656
G1 X129.41 Y128.39 E-.05869
G1 X129.237 Y128.354 E-.06687
G1 X129.142 Y128.292 E-.04316
G1 X129.049 Y128.169 E-.0587
G1 X129.011 Y128.019 E-.05868
G1 X129.034 Y127.867 E-.0587
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05874
G1 X129.424 Y127.611 E-.0128
G1 X129.56 Y127.645 E-.05331
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04772
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 637/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L637
M991 S0 P636 ;notify layer change
G17
G3 Z127.6 I-1.191 J-.251 P1  F30000
G1 X129.657 Y128.291 Z127.6
G1 Z127.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.259 J-.291 E.04605
G1 X129.424 Y127.611 E.00104
G3 X129.698 Y128.248 I-.026 J.389 E.02625
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 127.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.524 Y128.369 E-.08083
G1 X129.41 Y128.39 E-.04414
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.049 Y128.169 E-.05139
G1 X129.011 Y128.019 E-.05874
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.0587
G1 X129.39 Y127.61 E-.05874
G1 X129.424 Y127.611 E-.01286
G1 X129.56 Y127.645 E-.05325
G1 X129.686 Y127.735 E-.0587
G1 X129.751 Y127.842 E-.0479
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 638/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L638
M991 S0 P637 ;notify layer change
G17
G3 Z127.8 I-1.202 J-.191 P1  F30000
G1 X129.684 Y128.264 Z127.8
G1 Z127.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.286 J-.264 E.04724
G1 X129.424 Y127.611 E.00105
G3 X129.722 Y128.217 I-.026 J.389 E.02506
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 127.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08083
G1 X129.41 Y128.39 E-.05869
G1 X129.276 Y128.369 E-.05144
G1 X129.142 Y128.292 E-.05869
G1 X129.049 Y128.169 E-.05869
G1 X129.011 Y128.019 E-.0587
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05874
G1 X129.424 Y127.611 E-.01293
G1 X129.56 Y127.645 E-.05318
G1 X129.686 Y127.735 E-.05869
G1 X129.731 Y127.81 E-.03336
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 639/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L639
M991 S0 P638 ;notify layer change
G17
G3 Z128 I-1.203 J-.187 P1  F30000
G1 X129.657 Y128.291 Z128
G1 Z127.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.259 J-.291 E.04605
G1 X129.425 Y127.611 E.00105
G3 X129.699 Y128.248 I-.026 J.389 E.02624
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 128
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06657
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.0587
G1 X129.049 Y128.169 E-.05143
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05868
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05873
G1 X129.425 Y127.611 E-.013
G1 X129.56 Y127.645 E-.05312
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04762
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 640/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L640
M991 S0 P639 ;notify layer change
G17
G3 Z128.2 I-1.202 J-.19 P1  F30000
G1 X129.684 Y128.264 Z128.2
G1 Z128
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.286 J-.264 E.04723
G1 X129.425 Y127.611 E.00106
G3 X129.722 Y128.217 I-.027 J.389 E.02505
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 128.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08083
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.059 Y128.189 E-.04306
G1 X129.011 Y128.019 E-.06696
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05872
G1 X129.425 Y127.611 E-.01307
G1 X129.56 Y127.645 E-.05306
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03346
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 641/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L641
M991 S0 P640 ;notify layer change
G17
G3 Z128.4 I-1.203 J-.187 P1  F30000
G1 X129.657 Y128.291 Z128.4
G1 Z128.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.259 J-.291 E.04604
G1 X129.425 Y127.611 E.00106
G3 X129.699 Y128.248 I-.027 J.389 E.02624
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 128.4
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.06656
G1 X129.41 Y128.39 E-.05869
G1 X129.276 Y128.369 E-.05141
G1 X129.142 Y128.292 E-.05872
G1 X129.049 Y128.169 E-.0587
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05868
G1 X129.39 Y127.61 E-.05872
G1 X129.425 Y127.611 E-.01314
G1 X129.56 Y127.645 E-.053
G1 X129.686 Y127.735 E-.05869
G1 X129.751 Y127.842 E-.04762
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 642/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L642
M991 S0 P641 ;notify layer change
G17
G3 Z128.6 I-1.202 J-.19 P1  F30000
G1 X129.684 Y128.264 Z128.6
G1 Z128.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.286 J-.264 E.04723
G1 X129.425 Y127.611 E.00107
G3 X129.722 Y128.217 I-.027 J.389 E.02505
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 128.6
; LAYER_HEIGHT: 0.200012
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08083
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.059 Y128.189 E-.04309
G1 X129.011 Y128.019 E-.06694
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.0587
G1 X129.24 Y127.645 E-.05868
G1 X129.39 Y127.61 E-.05872
G1 X129.425 Y127.611 E-.01319
G1 X129.56 Y127.645 E-.05294
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03345
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 643/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L643
M991 S0 P642 ;notify layer change
G17
G3 Z128.8 I-1.21 J-.126 P1  F30000
G1 X129.684 Y128.264 Z128.8
G1 Z128.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.286 J-.264 E.04722
G1 X129.425 Y127.611 E.00107
G3 X129.722 Y128.217 I-.027 J.389 E.02504
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 128.8
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08084
G1 X129.41 Y128.39 E-.05869
G1 X129.237 Y128.354 E-.06687
G1 X129.142 Y128.292 E-.04316
G1 X129.049 Y128.169 E-.05869
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05872
G1 X129.425 Y127.611 E-.01326
G1 X129.56 Y127.645 E-.05289
G1 X129.686 Y127.735 E-.05868
G1 X129.732 Y127.81 E-.03344
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 644/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L644
M991 S0 P643 ;notify layer change
G17
G3 Z129 I-1.21 J-.126 P1  F30000
G1 X129.685 Y128.264 Z129
G1 Z128.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.286 J-.264 E.04722
G1 X129.425 Y127.611 E.00108
G3 X129.722 Y128.217 I-.027 J.389 E.02504
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 129
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08084
G1 X129.41 Y128.39 E-.05868
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.059 Y128.189 E-.0431
G1 X129.011 Y128.019 E-.06693
G1 X129.034 Y127.867 E-.05868
G1 X129.114 Y127.735 E-.0587
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05871
G1 X129.425 Y127.611 E-.01333
G1 X129.56 Y127.645 E-.05281
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03344
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 645/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L645
M991 S0 P644 ;notify layer change
G17
G3 Z129.2 I-1.21 J-.125 P1  F30000
G1 X129.685 Y128.264 Z129.2
G1 Z129
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.286 J-.264 E.04722
G1 X129.426 Y127.611 E.00108
G3 X129.722 Y128.217 I-.027 J.389 E.02504
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 129.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08085
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.049 Y128.169 E-.05142
G1 X129.011 Y128.019 E-.05871
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05871
G1 X129.426 Y127.611 E-.0134
G1 X129.56 Y127.645 E-.05274
G1 X129.686 Y127.735 E-.05869
G1 X129.731 Y127.81 E-.03333
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 646/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L646
M991 S0 P645 ;notify layer change
G17
G3 Z129.4 I-1.211 J-.125 P1  F30000
G1 X129.685 Y128.264 Z129.4
G1 Z129.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.286 J-.264 E.04722
G1 X129.426 Y127.611 E.00109
G3 X129.722 Y128.217 I-.027 J.389 E.02504
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 129.4
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08084
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05871
G1 X129.049 Y128.169 E-.05142
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.0587
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05871
G1 X129.426 Y127.611 E-.01346
G1 X129.56 Y127.645 E-.0527
G1 X129.686 Y127.735 E-.05868
G1 X129.731 Y127.81 E-.03334
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 647/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L647
M991 S0 P646 ;notify layer change
G17
G3 Z129.6 I-1.211 J-.125 P1  F30000
G1 X129.685 Y128.264 Z129.6
G1 Z129.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.286 J-.264 E.04721
G1 X129.426 Y127.611 E.00109
G3 X129.722 Y128.217 I-.027 J.389 E.02503
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 129.6
; LAYER_HEIGHT: 0.200012
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08084
G1 X129.41 Y128.39 E-.05869
G1 X129.276 Y128.369 E-.05144
G1 X129.142 Y128.292 E-.05869
G1 X129.049 Y128.169 E-.05869
G1 X129.011 Y128.019 E-.05869
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.0587
G1 X129.426 Y127.611 E-.01354
G1 X129.561 Y127.645 E-.05283
G1 X129.686 Y127.735 E-.05848
G1 X129.731 Y127.81 E-.03333
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 648/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L648
M991 S0 P647 ;notify layer change
G17
G3 Z129.8 I-1.211 J-.125 P1  F30000
G1 X129.685 Y128.264 Z129.8
G1 Z129.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.286 J-.264 E.04721
G1 X129.426 Y127.611 E.0011
G3 X129.722 Y128.217 I-.027 J.388 E.02503
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 129.8
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.08084
G1 X129.41 Y128.39 E-.05869
G1 X129.258 Y128.363 E-.05869
G1 X129.128 Y128.279 E-.05869
G1 X129.059 Y128.189 E-.04315
G1 X129.011 Y128.019 E-.06687
G1 X129.034 Y127.867 E-.0587
G1 X129.114 Y127.735 E-.05869
M73 P98 R0
G1 X129.24 Y127.645 E-.05868
G1 X129.39 Y127.61 E-.0587
G1 X129.426 Y127.611 E-.01359
G1 X129.56 Y127.645 E-.05257
G1 X129.686 Y127.735 E-.05869
G1 X129.732 Y127.81 E-.03343
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 649/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L649
M991 S0 P648 ;notify layer change
G17
G3 Z130 I-1.203 J-.185 P1  F30000
G1 X129.658 Y128.292 Z130
G1 Z129.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.258 J-.292 E.04595
G1 X129.429 Y127.611 E.00119
G3 X129.699 Y128.249 I-.029 J.388 E.02621
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 130
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.56 Y128.355 E-.0666
G1 X129.41 Y128.39 E-.05869
G1 X129.297 Y128.376 E-.04315
G1 X129.142 Y128.292 E-.06687
G1 X129.049 Y128.169 E-.05869
G1 X129.011 Y128.019 E-.0587
G1 X129.034 Y127.867 E-.05869
G1 X129.114 Y127.735 E-.05869
G1 X129.24 Y127.645 E-.05869
G1 X129.39 Y127.61 E-.05869
G1 X129.429 Y127.611 E-.01467
G1 X129.563 Y127.646 E-.05261
G1 X129.686 Y127.735 E-.05758
G1 X129.751 Y127.842 E-.04766
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 650/650
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L650
M991 S0 P649 ;notify layer change
G17
G3 Z130.2 I-1.191 J-.249 P1  F30000
G1 X129.657 Y128.291 Z130.2
G1 Z130
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.39 Y127.61 I-.258 J-.291 E.04602
G1 X129.426 Y127.611 E.00111
G3 X129.699 Y128.248 I-.028 J.388 E.02621
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X129.524 Y128.369 E-.08082
G1 X129.41 Y128.39 E-.04418
G1 X129.297 Y128.376 E-.04316
G1 X129.142 Y128.292 E-.06684
G1 X129.049 Y128.169 E-.05872
G1 X129.011 Y128.02 E-.05865
G1 X129.034 Y127.867 E-.05872
G1 X129.114 Y127.735 E-.05866
G1 X129.24 Y127.645 E-.0587
G1 X129.39 Y127.61 E-.05872
G1 X129.426 Y127.611 E-.01373
G1 X129.56 Y127.645 E-.05244
G1 X129.686 Y127.735 E-.05869
G1 X129.752 Y127.843 E-.04797
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
G1 Z130.5 F900 ; lower z a little
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

    G1 Z230 F600
    G1 Z228

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

