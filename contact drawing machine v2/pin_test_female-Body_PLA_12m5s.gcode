; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 6m 16s; total estimated time: 12m 5s
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
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

M73 P37 R7
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
M73 P42 R7
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
M73 P42 R6
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
M73 P43 R6
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
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X115.857 Y125.332 E.19874
G1 X144.143 Y125.332 E1.05354
M73 P44 R6
G1 X144.143 Y130.668 E.19874
G1 X115.917 Y130.668 E1.05131
G1 X115.4 Y131.125 F30000
; FEATURE: Outer wall
G1 F3000
G1 X115.4 Y124.875 E.23279
G1 X144.6 Y124.875 E1.08759
G1 X144.6 Y131.125 E.23279
G1 X115.46 Y131.125 E1.08535
; WIPE_START
G1 F24000
M73 P45 R6
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
G1 X143.273 Y130.279 E.01793
G1 X138.714 Y125.721 E.24024
G1 X138.068 Y125.721 E.0241
G1 X142.627 Y130.279 E.24024
G1 X141.98 Y130.279 E.0241
M73 P47 R6
G1 X137.421 Y125.721 E.24024
G1 X136.774 Y125.721 E.0241
G1 X141.333 Y130.279 E.24024
G1 X140.686 Y130.279 E.0241
G1 X136.128 Y125.721 E.24024
G1 X135.481 Y125.721 E.0241
G1 X140.04 Y130.279 E.24024
G1 X139.393 Y130.279 E.0241
G1 X134.834 Y125.721 E.24024
G1 X134.188 Y125.721 E.0241
G1 X138.746 Y130.279 E.24024
M73 P48 R6
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
M73 P49 R6
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
G1 X117.502 Y126.978 E.76803
G1 X117.502 Y129.023 E.06284
G1 X142.498 Y129.023 E.76803
M73 P50 R6
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
M73 P50 R5
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
M73 P51 R5
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
M73 P52 R5
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
G1 X115.21 Y124.685 E.20372
G1 X144.79 Y124.685 E.90891
G1 X144.79 Y131.315 E.20372
M73 P53 R5
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
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10431
G1 X115.21 Y124.685 E.20372
M73 P54 R5
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
M73 P55 R5
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
M73 P56 R5
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
G1 F5165
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X141.613 Y130.923 E.09238
G1 X141.567 Y130.737 E.00635
G1 X142.214 Y130.397 E.02425
G1 X142.708 Y129.96 E.02188
G1 X143.083 Y129.417 E.02188
G1 X143.316 Y128.801 E.02188
G1 X143.396 Y128.146 E.02188
G1 X143.316 Y127.491 E.02188
G1 X143.083 Y126.875 E.02188
G1 X142.708 Y126.332 E.02188
G1 X142.214 Y125.895 E.02188
G1 X141.63 Y125.588 E.02188
G1 X140.99 Y125.43 E.02188
G1 X140.331 Y125.43 E.02188
G1 X139.69 Y125.588 E.02188
G1 X139.106 Y125.895 E.02188
G1 X138.613 Y126.332 E.02188
G1 X138.238 Y126.875 E.02188
G1 X138.004 Y127.491 E.02188
G1 X137.925 Y128.146 E.02188
G1 X138.004 Y128.801 E.02188
G1 X138.238 Y129.417 E.02188
G1 X138.613 Y129.96 E.02188
G1 X139.106 Y130.397 E.02188
G1 X139.753 Y130.737 E.02425
G1 X139.708 Y130.923 E.00635
G1 X135.108 Y130.923 E.15258
G1 X135.082 Y130.708 E.00718
G1 X135.214 Y130.676 E.00451
G1 X135.787 Y130.375 E.02148
G1 X136.272 Y129.945 E.02148
G1 X136.639 Y129.412 E.02148
G1 X136.869 Y128.807 E.02148
M73 P57 R5
G1 X136.947 Y128.164 E.02148
G1 X136.869 Y127.522 E.02148
G1 X136.639 Y126.916 E.02148
G1 X136.272 Y126.383 E.02148
G1 X135.787 Y125.954 E.02148
G1 X135.214 Y125.653 E.02148
G1 X134.585 Y125.498 E.02148
G1 X133.938 Y125.498 E.02148
G1 X133.309 Y125.653 E.02148
G1 X132.736 Y125.954 E.02148
G1 X132.251 Y126.383 E.02148
G1 X131.883 Y126.916 E.02148
G1 X131.654 Y127.522 E.02148
G1 X131.576 Y128.164 E.02148
G1 X131.654 Y128.807 E.02148
G1 X131.883 Y129.412 E.02148
G1 X132.251 Y129.945 E.02148
G1 X132.736 Y130.375 E.02148
G1 X133.309 Y130.676 E.02148
G1 X133.441 Y130.708 E.00451
G1 X133.415 Y130.923 E.00718
G1 X127.311 Y130.923 E.20249
G1 X127.265 Y130.737 E.00635
G1 X127.673 Y130.523 E.01531
G1 X128.149 Y130.101 E.02108
G1 X128.51 Y129.578 E.02108
G1 X128.735 Y128.984 E.02108
G1 X128.812 Y128.353 E.02108
G1 X128.735 Y127.723 E.02108
G1 X128.51 Y127.129 E.02108
G1 X128.149 Y126.606 E.02108
G1 X127.673 Y126.184 E.02108
G1 X127.111 Y125.889 E.02108
G1 X126.494 Y125.737 E.02108
G1 X125.859 Y125.737 E.02108
G1 X125.242 Y125.889 E.02108
G1 X124.679 Y126.184 E.02108
G1 X124.203 Y126.606 E.02108
G1 X123.842 Y127.129 E.02108
G1 X123.617 Y127.723 E.02108
G1 X123.541 Y128.353 E.02108
G1 X123.617 Y128.984 E.02108
G1 X123.842 Y129.578 E.02108
G1 X124.203 Y130.101 E.02108
G1 X124.679 Y130.523 E.02108
G1 X125.088 Y130.737 E.01531
G1 X125.042 Y130.923 E.00635
G1 X120.245 Y130.923 E.15912
G1 X120.199 Y130.737 E.00635
G1 X120.555 Y130.551 E.01331
G1 X121.021 Y130.137 E.02068
G1 X121.375 Y129.624 E.02068
G1 X121.596 Y129.042 E.02068
G1 X121.671 Y128.423 E.02068
G1 X121.596 Y127.804 E.02068
G1 X121.375 Y127.221 E.02068
G1 X121.021 Y126.708 E.02068
G1 X120.555 Y126.295 E.02068
G1 X120.003 Y126.005 E.02068
G1 X119.397 Y125.856 E.02068
G1 X118.774 Y125.856 E.02068
G1 X118.169 Y126.005 E.02068
G1 X117.617 Y126.295 E.02068
G1 X117.15 Y126.708 E.02068
G1 X116.796 Y127.221 E.02068
G1 X116.575 Y127.804 E.02068
G1 X116.5 Y128.423 E.02068
G1 X116.575 Y129.042 E.02068
G1 X116.796 Y129.624 E.02068
G1 X117.15 Y130.137 E.02068
G1 X117.617 Y130.551 E.02068
G1 X117.972 Y130.737 E.01331
G1 X117.926 Y130.923 E.00635
G1 X115.662 Y130.923 E.07511
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5165
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
G3 Z2 I-.948 J.763 P1  F30000
G1 X116.367 Y130.701 Z2
G1 Z1.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F5165
G1 X116.901 Y130.167 E.02317
G1 X116.683 Y129.852
G1 X115.834 Y130.701 E.03688
G1 X115.824 Y130.177
G1 X116.508 Y129.493 E.02972
G1 X116.212 Y129.256
G1 X115.824 Y129.644 E.01685
M204 S10000
G1 X116.087 Y129.041 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.552578
G1 F5165
G3 X116.087 Y127.805 I5.347 J-.618 E.05144
G1 X115.824 Y127.511 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5165
G1 X117.875 Y125.46 E.08912
G1 X117.502 Y125.299
G1 X115.824 Y126.977 E.07291
G1 X115.824 Y126.444
G1 X116.969 Y125.299 E.04973
G1 X116.436 Y125.299
G1 X115.824 Y125.911 E.02656
M204 S10000
G1 X117.935 Y125.795 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.197931
G1 F5165
G1 X117.807 Y125.889 E.00201
; LINE_WIDTH: 0.161344
G1 X117.679 Y125.983 E.00153
; LINE_WIDTH: 0.124758
G1 X117.551 Y126.078 E.00106
G1 X116.778 Y126.853 F30000
; LINE_WIDTH: 0.08817
G1 F5165
G1 X116.676 Y126.975 E.00059
; LINE_WIDTH: 0.136439
G2 X116.199 Y127.608 I4.941 J4.222 E.00604
G1 X118.109 Y125.541 F30000
; LINE_WIDTH: 0.464076
G1 F5165
G1 X118.407 Y125.505 E.01028
; LINE_WIDTH: 0.420072
G1 X118.704 Y125.469 E.00921
; LINE_WIDTH: 0.428778
G3 X119.422 Y125.466 I.382 J5.911 E.02259
G3 X119.765 Y125.505 I-.151 J2.862 E.01085
; LINE_WIDTH: 0.508081
G1 X120.062 Y125.541 E.01136
G1 X122.594 Y125.361 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F5165
G1 X122.53 Y125.398 E.00204
G1 X122.579 Y125.426 E.00155
G1 X124.954 Y125.512 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.416557
G1 F5165
G1 X125.166 Y125.486 E.00651
; LINE_WIDTH: 0.377516
G1 X125.378 Y125.46 E.00583
; LINE_WIDTH: 0.338475
G1 X125.591 Y125.435 E.00515
; LINE_WIDTH: 0.299434
G1 X125.803 Y125.409 E.00447
; LINE_WIDTH: 0.305355
G3 X126.519 Y125.407 I.373 J5.89 E.01531
G3 X126.762 Y125.435 I-.108 J2.031 E.00523
; LINE_WIDTH: 0.377516
G1 X126.974 Y125.46 E.00583
; LINE_WIDTH: 0.416556
G1 X127.186 Y125.486 E.00651
; LINE_WIDTH: 0.455597
G1 X127.399 Y125.512 E.00719
G1 X128.552 Y128.648 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5165
G1 X126.452 Y130.748 E.09124
G1 X125.919 Y130.748
G1 X128.558 Y128.109 E.11467
G1 X128.474 Y127.66
G1 X125.485 Y130.649 E.12988
G1 X125.105 Y130.495
G1 X128.327 Y127.273 E.14001
G1 X128.117 Y126.95
G1 X124.765 Y130.302 E.14564
G1 X124.482 Y130.051
G1 X127.874 Y126.659 E.1474
G1 X127.592 Y126.409
G1 X124.239 Y129.761 E.14568
G1 X124.028 Y129.439
G1 X127.253 Y126.215 E.14014
G1 X126.874 Y126.06
G1 X123.881 Y129.053 E.13007
G1 X123.795 Y128.605
G1 X126.441 Y125.959 E.11498
G1 X125.908 Y125.959
G1 X123.799 Y128.068 E.09163
M204 S10000
; WIPE_START
G1 F24000
G1 X125.213 Y126.654 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.738 J.968 P1  F30000
G1 X128.462 Y129.132 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.29151
G1 F5165
G1 X128.163 Y129.491 E.00945
; LINE_WIDTH: 0.3684
G3 X127.467 Y130.223 I-3.365 J-2.5 E.02687
; LINE_WIDTH: 0.358444
G1 X127.315 Y130.335 E.00485
; LINE_WIDTH: 0.315984
G1 X127.163 Y130.447 E.0042
; LINE_WIDTH: 0.273524
G1 X127.011 Y130.559 E.00355
; LINE_WIDTH: 0.231064
G1 X126.859 Y130.67 E.00289
; WIPE_START
G1 F24000
G1 X127.011 Y130.559 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.154 J-.385 P1  F30000
G1 X125.501 Y126.035 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.194483
G1 F5165
G1 X125.347 Y126.148 E.00235
; LINE_WIDTH: 0.236889
G1 X125.194 Y126.26 E.00301
; LINE_WIDTH: 0.279296
G1 X125.041 Y126.373 E.00367
; LINE_WIDTH: 0.321702
G1 X124.887 Y126.486 E.00433
; LINE_WIDTH: 0.364108
G1 X124.49 Y126.86 E.01427
; LINE_WIDTH: 0.397043
G1 X124.189 Y127.221 E.01358
; LINE_WIDTH: 0.34715
G1 X123.888 Y127.583 E.01167
G1 X123.919 Y130.081 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5165
G1 X123.3 Y130.701 E.02691
G1 X122.767 Y130.701
G1 X123.701 Y129.766 E.04062
G1 X123.536 Y129.398
G1 X122.233 Y130.701 E.05661
G1 X121.7 Y130.701
G1 X123.396 Y129.005 E.07368
G1 X123.338 Y128.529
G1 X121.274 Y130.594 E.0897
G1 X121.502 Y129.832
G1 X123.363 Y127.971 E.08086
G1 X123.563 Y127.238
G1 X121.829 Y128.972 E.07538
G1 X121.89 Y128.378
G1 X124.732 Y125.535 E.12352
G1 X124.435 Y125.299
G1 X121.832 Y127.902 E.11309
G1 X121.714 Y127.487
G1 X123.901 Y125.299 E.09506
G1 X123.368 Y125.299
G1 X121.564 Y127.103 E.07839
G1 X121.346 Y126.788
G1 X122.554 Y125.58 E.05248
G1 X122.302 Y125.3
G1 X121.111 Y126.49 E.05175
G1 X120.828 Y126.24
G1 X121.768 Y125.299 E.04086
G1 X121.235 Y125.299
G1 X120.513 Y126.022 E.03138
G1 X120.262 Y125.739
G1 X120.702 Y125.299 E.0191
M204 S10000
G1 X122.966 Y125.281 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.240877
G1 F5165
G3 X122.688 Y125.584 I-8.358 J-7.396 E.00664
G1 X122.575 Y125.581 E.00181
G1 X124.787 Y125.831 F30000
; LINE_WIDTH: 0.144006
G1 F5165
G1 X124.68 Y125.91 E.0011
; LINE_WIDTH: 0.116088
G1 X124.573 Y125.988 E.00079
G1 X123.872 Y126.691 F30000
; LINE_WIDTH: 0.08817
G1 F5165
G1 X123.743 Y126.846 E.00074
; LINE_WIDTH: 0.139968
G2 X123.492 Y127.166 I2.5 J2.215 E.00322
G1 X121.817 Y128.961 F30000
; LINE_WIDTH: 0.179819
G1 F5165
G1 X121.863 Y129.105 E.00169
G1 X121.738 Y129.316 E.00274
G1 X121.044 Y130.421 F30000
; LINE_WIDTH: 0.096921
G1 F5165
G1 X120.912 Y130.57 E.00088
; LINE_WIDTH: 0.131784
G1 X120.779 Y130.719 E.00144
G1 X120.032 Y130.879 F30000
; LINE_WIDTH: 0.471484
G1 F5165
G1 X119.723 Y130.916 E.01089
; LINE_WIDTH: 0.422309
G1 X119.413 Y130.954 E.00964
; LINE_WIDTH: 0.368626
G3 X118.758 Y130.954 I-.327 J-22.337 E.01738
; LINE_WIDTH: 0.373134
G1 X118.449 Y130.916 E.00839
; LINE_WIDTH: 0.422309
G1 X118.139 Y130.879 E.00964
G1 X117.392 Y130.719 F30000
; LINE_WIDTH: 0.166648
G1 F5165
G1 X117.26 Y130.57 E.00201
; LINE_WIDTH: 0.131785
G1 X117.127 Y130.421 E.00144
G1 X119.543 Y130.725 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5165
G1 X121.392 Y128.875 E.08037
G1 X121.433 Y128.302
M73 P58 R5
G1 X118.967 Y130.767 E.10714
G1 X118.506 Y130.695
G1 X121.369 Y127.832 E.12439
G1 X121.222 Y127.445
G1 X118.11 Y130.558 E.13527
G1 X117.76 Y130.375
G1 X121.027 Y127.108 E.14196
G1 X120.796 Y126.805
G1 X117.474 Y130.127 E.14434
G1 X117.22 Y129.847
G1 X120.513 Y126.555 E.14308
G1 X120.183 Y126.351
G1 X117.003 Y129.532 E.13822
G1 X116.853 Y129.148
G1 X119.814 Y126.188 E.12865
G1 X119.386 Y126.082
G1 X116.759 Y128.709 E.11416
G1 X116.753 Y128.182
G1 X118.857 Y126.078 E.0914
M204 S10000
; WIPE_START
G1 F24000
G1 X117.442 Y127.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.529 J1.096 P1  F30000
G1 X121.266 Y129.337 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.178839
G1 F5165
G1 X121.104 Y129.532 E.00281
; LINE_WIDTH: 0.212239
G1 X120.941 Y129.727 E.0035
; LINE_WIDTH: 0.268456
G3 X120.38 Y130.298 I-2.629 J-2.026 E.01474
; LINE_WIDTH: 0.24597
G1 X120.27 Y130.379 E.00226
; LINE_WIDTH: 0.20652
G1 X120.16 Y130.46 E.00182
; LINE_WIDTH: 0.16707
G1 X120.05 Y130.541 E.00138
; LINE_WIDTH: 0.127621
G1 X119.939 Y130.622 E.00094
; WIPE_START
G1 F24000
G1 X120.05 Y130.541 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.144 J-.416 P1  F30000
G1 X118.45 Y126.145 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.212393
G1 F5165
G1 X118.295 Y126.26 E.00266
; LINE_WIDTH: 0.253737
G1 X118.14 Y126.374 E.00331
; LINE_WIDTH: 0.295081
G1 X117.984 Y126.488 E.00396
; LINE_WIDTH: 0.336426
G1 X117.829 Y126.602 E.00461
; LINE_WIDTH: 0.377769
G1 X117.442 Y126.967 E.0145
; LINE_WIDTH: 0.409877
G1 X117.138 Y127.332 E.01422
; LINE_WIDTH: 0.361235
G1 X116.833 Y127.697 E.01233
; WIPE_START
G1 F24000
G1 X117.138 Y127.332 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.484 J1.117 P1  F30000
G1 X124.181 Y130.385 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.136793
G1 F5165
G1 X124.329 Y130.552 E.00171
; LINE_WIDTH: 0.176666
G1 X124.477 Y130.719 E.00244
G1 X125.256 Y130.873 F30000
; LINE_WIDTH: 0.437351
G1 F5165
G1 X125.548 Y130.908 E.00946
; LINE_WIDTH: 0.393038
G1 X125.84 Y130.944 E.0084
; LINE_WIDTH: 0.403223
G2 X126.804 Y130.908 I.205 J-7.534 E.02833
; LINE_WIDTH: 0.481664
G1 X127.096 Y130.873 E.01052
G1 X127.875 Y130.719 F30000
; LINE_WIDTH: 0.13679
G1 F5165
G1 X128.024 Y130.552 E.00171
; LINE_WIDTH: 0.096921
G1 X128.172 Y130.385 E.00098
G1 X131.832 Y130.701 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5165
G1 X132.272 Y130.261 E.01911
G1 X132.011 Y129.989
G1 X131.299 Y130.701 E.03093
G1 X130.766 Y130.701
G1 X131.793 Y129.673 E.04464
G1 X131.611 Y129.322
G1 X130.367 Y130.566 E.05407
G1 X129.699 Y130.701
G1 X131.464 Y128.935 E.07671
G1 X131.39 Y128.477
G1 X129.166 Y130.701 E.09663
G1 X128.633 Y130.701
G1 X131.377 Y127.956 E.11926
G1 X131.5 Y127.3
G1 X128.458 Y130.341 E.13217
G1 X128.784 Y129.482
G1 X132.545 Y125.722 E.16341
G1 X132.434 Y125.299
G1 X128.988 Y128.745 E.14972
G1 X129.015 Y128.185
G1 X131.901 Y125.299 E.12537
G1 X131.367 Y125.299
G1 X128.958 Y127.709 E.10471
G1 X128.819 Y127.315
G1 X130.08 Y126.053 E.05483
G1 X129.863 Y125.738
G1 X128.654 Y126.946 E.05251
G1 X128.436 Y126.63
G1 X129.638 Y125.428 E.05223
G1 X129.234 Y125.299
G1 X128.189 Y126.344 E.0454
G1 X127.907 Y126.094
G1 X128.701 Y125.299 E.03451
G1 X128.168 Y125.299
G1 X127.582 Y125.885 E.02545
M204 S10000
G1 X132.784 Y130.691 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.229548
G1 F5165
G1 X132.269 Y130.53 E.0082
G1 X130.52 Y130.719 F30000
; LINE_WIDTH: 0.0754613
G1 F5165
G3 X130.438 Y130.667 I.009 J-.104 E.00027
G1 X128.651 Y130.719 F30000
; LINE_WIDTH: 0.221298
G1 F5165
G1 X128.436 Y130.63 E.00338
G1 X128.254 Y130.719 E.00295
G1 X130.881 Y125.281 F30000
; LINE_WIDTH: 0.344226
G1 F5165
G1 X130.705 Y125.492 E.00675
; LINE_WIDTH: 0.30627
G1 X130.529 Y125.703 E.0059
; LINE_WIDTH: 0.268315
G1 X130.353 Y125.915 E.00505
; LINE_WIDTH: 0.222152
G1 X130.288 Y126.002 E.00159
; LINE_WIDTH: 0.197509
G1 X130.258 Y125.978 E.0005
; LINE_WIDTH: 0.158109
G1 X130.227 Y125.953 E.00037
G1 X132.781 Y125.673 F30000
; LINE_WIDTH: 0.135329
G1 F5165
G1 X132.92 Y125.578 E.00127
; LINE_WIDTH: 0.173739
G1 X133.058 Y125.482 E.00179
; LINE_WIDTH: 0.212148
G1 X133.197 Y125.387 E.00232
; LINE_WIDTH: 0.187373
G1 X133.407 Y125.349 E.00251
; LINE_WIDTH: 0.139365
G1 X133.591 Y125.327 E.00145
; LINE_WIDTH: 0.09692
G1 X133.775 Y125.304 E.00081
G1 X134.748 Y125.304 F30000
; LINE_WIDTH: 0.139365
G1 F5165
G1 X134.932 Y125.327 E.00145
; LINE_WIDTH: 0.18181
G1 X135.116 Y125.349 E.00209
; LINE_WIDTH: 0.224254
G1 X135.299 Y125.371 E.00273
; LINE_WIDTH: 0.219817
G1 X135.308 Y125.376 E.00013
; LINE_WIDTH: 0.178034
G3 X135.464 Y125.482 I-.793 J1.334 E.00209
; LINE_WIDTH: 0.135328
G1 X135.603 Y125.578 E.00127
; LINE_WIDTH: 0.09692
G1 X135.741 Y125.673 E.00074
G1 X138.361 Y126.305 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5165
G1 X137.099 Y127.567 E.05486
G1 X136.971 Y127.162
G1 X138.833 Y125.299 E.08094
G1 X138.3 Y125.299
G1 X136.817 Y126.782 E.06443
G1 X136.599 Y126.467
G1 X137.767 Y125.299 E.05072
G1 X137.233 Y125.299
G1 X136.364 Y126.168 E.03776
G1 X136.082 Y125.918
G1 X136.7 Y125.299 E.02687
M204 S10000
G1 X137.772 Y127.716 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.267294
G1 F5165
G1 X137.206 Y127.794 E.01045
; LINE_WIDTH: 0.238082
G1 X137.085 Y127.615 E.00344
G1 X137.908 Y127.025 F30000
; LINE_WIDTH: 0.275732
G1 F5165
G1 X137.42 Y127.892 E.01888
G1 X138.921 Y125.637 F30000
; LINE_WIDTH: 0.254377
G1 F5165
G2 X138.384 Y126.144 I3.913 J4.68 E.01273
G1 X138.301 Y126.244 E.00225
G1 X139.152 Y125.614 F30000
; LINE_WIDTH: 0.130863
G1 F5165
G1 X139.313 Y125.503 E.0014
; LINE_WIDTH: 0.164806
G1 X139.474 Y125.392 E.00194
; LINE_WIDTH: 0.198748
G1 X139.635 Y125.281 E.00248
G1 X139.747 Y125.322 F30000
; LINE_WIDTH: 0.147974
G1 F5165
G2 X139.379 Y125.381 I.296 J3.037 E.00319
G1 X139.747 Y125.322 F30000
; LINE_WIDTH: 0.0969198
G1 F5165
G1 X139.891 Y125.304 E.00064
G1 X141.429 Y125.304 F30000
; LINE_WIDTH: 0.128611
G1 F5165
G1 X141.573 Y125.322 E.00101
; LINE_WIDTH: 0.160301
G1 X141.717 Y125.339 E.00139
; LINE_WIDTH: 0.165624
G1 X141.941 Y125.381 E.00228
G1 X141.847 Y125.392 F30000
; LINE_WIDTH: 0.130863
G1 F5165
G1 X142.008 Y125.503 E.0014
; LINE_WIDTH: 0.0969197
G1 X142.169 Y125.614 E.00086
G1 X141.847 Y125.392 F30000
; LINE_WIDTH: 0.164806
G1 F5165
G1 X141.686 Y125.281 E.00194
G1 X143.133 Y128.465 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5165
G1 X140.959 Y130.639 E.09448
G1 X140.426 Y130.639
G1 X143.145 Y127.92 E.11815
G1 X143.068 Y127.464
G1 X139.984 Y130.547 E.134
G1 X139.595 Y130.403
G1 X142.922 Y127.077 E.14453
G1 X142.722 Y126.743
G1 X139.246 Y130.219 E.15105
G1 X138.961 Y129.971
G1 X142.493 Y126.439 E.15351
G1 X142.21 Y126.188
G1 X138.701 Y129.697 E.15249
G1 X138.484 Y129.382
G1 X141.89 Y125.975 E.14802
G1 X141.538 Y125.794
G1 X138.322 Y129.011 E.13976
G1 X138.203 Y128.596
G1 X141.11 Y125.689 E.12632
G1 X140.613 Y125.653
G1 X138.153 Y128.113 E.10692
G1 X138.242 Y127.49
G1 X139.989 Y125.743 E.07589
M204 S10000
G1 X139.498 Y125.94 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881709
M73 P58 R4
G1 F5165
G1 X139.379 Y126.028 E.00055
; LINE_WIDTH: 0.129377
G1 X139.259 Y126.116 E.00104
; LINE_WIDTH: 0.170584
G1 X138.828 Y126.522 E.00617
; LINE_WIDTH: 0.206386
G1 X138.7 Y126.676 E.00266
; LINE_WIDTH: 0.170229
G1 X138.572 Y126.829 E.00207
; LINE_WIDTH: 0.127324
G2 X138.419 Y127.021 I.714 J.725 E.00169
; WIPE_START
G1 F24000
G1 X138.572 Y126.829 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.523 J1.099 P1  F30000
G1 X143.039 Y128.958 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.301085
G1 F5165
G1 X142.832 Y129.206 E.00681
; LINE_WIDTH: 0.335763
G1 X142.625 Y129.455 E.00772
; LINE_WIDTH: 0.39254
G3 X142.004 Y130.093 I-2.938 J-2.238 E.02543
; LINE_WIDTH: 0.370784
G1 X141.846 Y130.209 E.00524
; LINE_WIDTH: 0.32657
G1 X141.688 Y130.325 E.00454
; LINE_WIDTH: 0.282357
G1 X141.53 Y130.442 E.00383
; LINE_WIDTH: 0.238144
G1 X141.372 Y130.558 E.00312
G1 X141.392 Y130.844 F30000
; LINE_WIDTH: 0.50754
G1 F5165
G3 X139.929 Y130.844 I-.731 J-5.511 E.05553
G1 X138.231 Y130.701 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5165
G1 X138.646 Y130.286 E.01799
G1 X138.382 Y130.017
G1 X137.698 Y130.701 E.0297
G1 X137.165 Y130.701
G1 X138.164 Y129.702 E.04341
G1 X137.977 Y129.356
G1 X136.632 Y130.701 E.05845
G1 X136.098 Y130.701
G1 X137.83 Y128.969 E.07525
G1 X137.746 Y128.52
G1 X136.892 Y129.373 E.0371
M204 S10000
G1 X136.122 Y130.379 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0907531
G1 F5165
G1 X135.924 Y130.582 E.00111
; LINE_WIDTH: 0.130544
G1 X135.92 Y130.6 E.00013
; LINE_WIDTH: 0.157386
G1 X135.915 Y130.617 E.00017
; LINE_WIDTH: 0.184229
G1 X135.9 Y130.719 E.00119
G1 X136.955 Y129.436 F30000
; LINE_WIDTH: 0.205372
G1 F5165
G3 X136.881 Y129.549 I-.977 J-.562 E.00179
; LINE_WIDTH: 0.187953
G1 X136.697 Y129.769 E.00339
; LINE_WIDTH: 0.138062
G1 X136.513 Y129.99 E.00222
G1 X137.346 Y128.418 F30000
; LINE_WIDTH: 0.101665
G1 F5165
G3 X137.069 Y128.905 I-4.1 J-2.013 E.00268
G1 X137.441 Y128.418 F30000
; LINE_WIDTH: 0.240377
G1 F5165
G3 X137.207 Y128.635 I-.723 J-.545 E.00516
; LINE_WIDTH: 0.26499
G1 X137.175 Y128.588 E.00102
; LINE_WIDTH: 0.226691
G1 X137.144 Y128.542 E.00084
; LINE_WIDTH: 0.188392
G1 X137.112 Y128.495 E.00067
G1 X139.112 Y130.688 F30000
; LINE_WIDTH: 0.205444
G1 F5165
G1 X138.654 Y130.545 E.00635
G1 X137.72 Y128.116 F30000
; LINE_WIDTH: 0.119212
G1 F5165
G1 X137.681 Y128.155 E.00034
G1 X137.191 Y128.155 E.00305
G1 X137.152 Y128.195 E.00034
G1 X134.9 Y130.839 F30000
; LINE_WIDTH: 0.532582
G1 F5165
G3 X133.623 Y130.839 I-.639 J-5.411 E.05109
G1 X134.602 Y130.597 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5165
G1 X136.68 Y128.519 E.09031
G1 X136.699 Y127.967
G1 X134.058 Y130.608 E.11478
G1 X133.611 Y130.521
G1 X136.626 Y127.507 E.13098
G1 X136.479 Y127.12
G1 X133.221 Y130.378 E.14157
G1 X132.871 Y130.195
G1 X136.28 Y126.786 E.14811
G1 X136.049 Y126.483
G1 X132.587 Y129.946 E.15045
G1 X132.331 Y129.669
G1 X135.766 Y126.233 E.14931
G1 X135.442 Y126.024
G1 X132.113 Y129.353 E.14467
G1 X131.956 Y128.977
G1 X135.083 Y125.85 E.13588
G1 X134.655 Y125.745
G1 X131.847 Y128.553 E.12203
G1 X131.813 Y128.053
G1 X134.146 Y125.721 E.10136
G1 X133.497 Y125.836
G1 X131.941 Y127.393 E.06764
M204 S10000
G1 X132.942 Y126.098 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881709
G1 F5165
G1 X132.871 Y126.15 E.00032
; LINE_WIDTH: 0.12054
G2 X132.233 Y126.805 I2.377 J2.955 E.0058
G1 X135.248 Y125.952 F30000
; LINE_WIDTH: 0.116056
M73 P59 R4
G1 F5165
G2 X135.111 Y125.855 I-.468 J.516 E.001
G1 X136.465 Y127.081 F30000
; LINE_WIDTH: 0.0984458
G1 F5165
G2 X136.374 Y126.959 I-.549 J.316 E.00069
G1 X136.577 Y129.002 F30000
; LINE_WIDTH: 0.265964
G1 F5165
G1 X136.383 Y129.235 E.00551
; LINE_WIDTH: 0.300176
G1 X136.189 Y129.468 E.00635
; LINE_WIDTH: 0.3566
G3 X135.587 Y130.085 I-2.842 J-2.171 E.0221
; LINE_WIDTH: 0.334725
G1 X135.439 Y130.194 E.00436
; LINE_WIDTH: 0.291107
G1 X135.292 Y130.302 E.00371
; LINE_WIDTH: 0.24749
G1 X135.144 Y130.411 E.00306
; LINE_WIDTH: 0.203872
G1 X134.997 Y130.519 E.0024
G1 X143.564 Y130.701 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5165
G1 X144.176 Y130.089 E.02657
G1 X144.176 Y129.556
G1 X143.031 Y130.701 E.04974
G1 X142.498 Y130.701
G1 X144.176 Y129.023 E.07291
G1 X144.176 Y128.489
G1 X143.365 Y129.3 E.03522
G1 X143.569 Y128.562
G1 X144.176 Y127.956 E.02634
G1 X144.176 Y127.423
G1 X143.602 Y127.996 E.02493
G1 X143.544 Y127.521
G1 X144.176 Y126.89 E.02744
G1 X144.176 Y126.356
G1 X143.413 Y127.119 E.03313
G1 X143.259 Y126.739
G1 X144.176 Y125.823 E.03981
G1 X144.166 Y125.299
G1 X143.042 Y126.424 E.04885
G1 X142.808 Y126.124
G1 X143.632 Y125.299 E.03581
G1 X143.099 Y125.299
G1 X142.526 Y125.873 E.02493
M204 S10000
G1 X142.334 Y130.719 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.108254
G1 F5165
G1 X142.35 Y130.553 E.00089
G1 X143.436 Y129.371 F30000
; LINE_WIDTH: 0.157361
G1 F5165
G1 X143.31 Y129.544 E.002
; LINE_WIDTH: 0.153223
G1 X143.187 Y129.691 E.00172
; LINE_WIDTH: 0.120696
G1 X143.065 Y129.837 E.00121
G1 X142.526 Y125.281 F30000
; LINE_WIDTH: 0.305536
G1 F5165
G1 X142.531 Y125.365 E.0018
; LINE_WIDTH: 0.278019
G1 X142.537 Y125.449 E.00161
; LINE_WIDTH: 0.250503
G1 X142.528 Y125.485 E.00063
; LINE_WIDTH: 0.211724
G1 X142.52 Y125.521 E.00051
; LINE_WIDTH: 0.172945
G1 X142.511 Y125.557 E.00039
; LINE_WIDTH: 0.134164
G1 X142.353 Y125.746 E.00183
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X142.511 Y125.557 E-.76
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
G3 Z2 I-.115 J-1.211 P1  F30000
G1 X127.813 Y126.956 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3006
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01724
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01724
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01724
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01724
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01724
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01724
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.493 Y127.184 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3006
G1 X127.495 Y127.185 E.00006
G1 X127.714 Y127.503 E.01185
G1 X127.887 Y127.932 E.01422
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.714 Y129.204 E.01422
G1 X127.495 Y129.522 E.01185
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.448 Y127.144 E.01114
M204 S10000
; WIPE_START
G1 F24000
G1 X127.495 Y127.185 E-.02358
G1 X127.714 Y127.503 E-.14652
G1 X127.887 Y127.932 E-.17582
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.797 Y128.998 E-.09133
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.144 J-1.208 P1  F30000
G1 X117.92 Y130.172 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3006
G1 X117.889 Y130.156 E.00115
G1 X117.509 Y129.82 E.01685
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01684
G1 X120.347 Y126.746 E.00286
G1 X120.662 Y127.026 E.01399
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.973 Y130.2 E.01371
G1 X118.404 Y129.984 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3006
G1 X118.113 Y129.831 E.01008
G1 X117.805 Y129.558 E.01268
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.087 Y127.04 E.01383
G1 X120.367 Y127.288 E.01149
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.457 Y130.012 E.00075
M204 S10000
; WIPE_START
G1 F24000
G1 X118.113 Y129.831 E-.14751
G1 X117.805 Y129.558 E-.15679
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.379 Y128.461 E-.14212
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.022 J1.217 P1  F30000
G1 X132.133 Y128.729 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3006
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01765
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01764
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01765
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01765
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01764
G1 X136.468 Y128.164 E.01765
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01764
G1 X135.515 Y129.98 E.01765
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01764
G1 X132.277 Y129.108 E.00289
G1 X132.154 Y128.785 E.01146
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3006
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.643 Y128.969 E.0146
G1 X132.524 Y128.654 E.01036
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.071 J1.215 P1  F30000
G1 X141.972 Y126.315 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3006
G1 X142.349 Y126.65 E.01673
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01805
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.924 Y126.279 E.01736
G1 X141.718 Y126.614 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3006
G1 X142.054 Y126.912 E.01379
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.665 Y126.586 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.054 Y126.912 E-.19275
G1 X142.309 Y127.281 E-.17053
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.504 Y128.291 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.118 J-1.211 P1  F30000
G1 X115.602 Y130.923 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3006
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3006
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
G3 Z2.2 I-.923 J.794 P1  F30000
G1 X115.95 Y130.127 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3006
G1 X115.95 Y130.575 E.01484
G1 X116.621 Y130.575 E.02224
G1 X116.65 Y130.22 E.01182
G1 X116.766 Y130.117 E.00511
G1 X116.153 Y129.505 E.02875
G1 X116.768 Y129.467 E.02044
G1 X116.84 Y129.38 E.00375
G2 X117.088 Y129.823 I1.021 J-.282 E.01698
G1 X116.807 Y129.929 E.00995
G1 X117.524 Y130.351 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39469
G1 F3006
G1 X117.296 Y130.149 E.00872
G1 X117.133 Y130.24 E.00534
G2 X117.007 Y130.515 I.375 J.339 E.00884
G2 X117.482 Y130.543 I.309 J-1.185 E.01373
G3 X117.493 Y130.403 I.093 J-.063 E.00438
G1 X117.935 Y130.437 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137579
G1 F3006
G1 X118.085 Y130.54 E.00141
; LINE_WIDTH: 0.178237
G1 X118.235 Y130.644 E.00201
; LINE_WIDTH: 0.142112
G1 X118.435 Y130.673 E.00163
; LINE_WIDTH: 0.0969204
G1 X118.619 Y130.696 E.00082
G1 X119.552 Y130.696 F30000
; LINE_WIDTH: 0.138582
G1 F3006
G1 X119.737 Y130.673 E.00145
; LINE_WIDTH: 0.180244
G1 X119.922 Y130.651 E.00208
; LINE_WIDTH: 0.141111
G1 X120.087 Y130.54 E.00159
; LINE_WIDTH: 0.096921
G1 X120.237 Y130.437 E.0008
G1 X121.145 Y130.434 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.394687
G1 F3006
G1 X121.007 Y130.199 E.0078
G1 X120.875 Y130.149 E.00402
G1 X120.642 Y130.356 E.00894
G1 X120.706 Y130.453 E.00333
G1 X120.682 Y130.543 E.00268
G1 X121.142 Y130.528 E.01319
G1 X121.143 Y130.494 E.00098
G1 X121.434 Y130.142 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P60 R4
G1 F3006
G1 X121.384 Y129.936 E.00703
G1 X121.084 Y129.823 E.01065
G2 X121.493 Y128.831 I-2.056 J-1.43 E.03588
G1 X124.519 Y125.805 E.14193
G1 X124.473 Y125.425 E.01269
G1 X120.547 Y125.425 E.13023
G1 X120.46 Y126.136 E.02376
G1 X124.119 Y129.795 E.17162
G1 X123.841 Y129.9 E.00986
G3 X123.701 Y130.185 I-.23 J.064 E.0115
G1 X123.669 Y130.575 E.01297
G1 X123.068 Y130.575 E.01994
G1 X124.577 Y130.324 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408508
G1 F3006
G1 X124.348 Y130.121 E.00912
G2 X124.107 Y130.342 I.073 J.321 E.01018
G1 X124.065 Y130.479 E.00426
G1 X124.152 Y130.537 E.00312
G1 X124.54 Y130.537 E.01154
G1 X124.523 Y130.417 E.00361
G1 X124.547 Y130.376 E.0014
G1 X124.997 Y130.409 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.139039
G1 F3006
G1 X125.152 Y130.516 E.00147
; LINE_WIDTH: 0.181158
G1 X125.307 Y130.623 E.00212
; LINE_WIDTH: 0.170308
G2 X125.488 Y130.66 I.138 J-.213 E.00197
; LINE_WIDTH: 0.130583
G1 X125.636 Y130.678 E.00106
; LINE_WIDTH: 0.0969204
G1 X125.784 Y130.696 E.00065
G1 X126.569 Y130.696 F30000
; LINE_WIDTH: 0.130584
G1 F3006
G1 X126.716 Y130.678 E.00106
; LINE_WIDTH: 0.164247
G1 X126.864 Y130.66 E.00147
; LINE_WIDTH: 0.19791
G1 X127.012 Y130.642 E.00188
; LINE_WIDTH: 0.187432
G1 X127.031 Y130.632 E.00026
; LINE_WIDTH: 0.142592
G2 X127.201 Y130.516 I-.863 J-1.446 E.00167
; LINE_WIDTH: 0.096921
G1 X127.356 Y130.409 E.00083
G1 X128.132 Y130.17 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408503
G1 F3006
G1 X128.005 Y130.121 E.00406
G1 X127.77 Y130.329 E.00934
G1 X127.835 Y130.43 E.00356
G1 X127.804 Y130.537 E.00331
G1 X128.227 Y130.537 E.01261
G1 X128.266 Y130.408 E.00401
G1 X128.162 Y130.222 E.00637
G1 X127.382 Y125.986 F30000
; LINE_WIDTH: 0.488595
G1 F3006
G1 X127.441 Y125.503 E.01764
G1 X126.995 Y125.483 E.0162
; LINE_WIDTH: 0.4244
G2 X125.891 Y125.461 I-.829 J13.432 E.03435
; LINE_WIDTH: 0.402854
G1 X125.561 Y125.479 E.00968
; LINE_WIDTH: 0.47545
G3 X124.912 Y125.503 I-.632 J-8.236 E.02291
G1 X124.97 Y125.986 E.01712
G1 X125.058 Y126.032 E.00348
G1 X125.284 Y125.926 E.00879
; LINE_WIDTH: 0.47754
G1 X125.565 Y125.875 E.01014
; LINE_WIDTH: 0.419176
G1 X125.847 Y125.823 E.00878
G1 X126.462 Y125.821 E.01886
; LINE_WIDTH: 0.402854
G1 X126.765 Y125.873 E.00903
; LINE_WIDTH: 0.458961
G3 X127.295 Y126.032 I-.029 J1.061 E.01896
G1 X127.329 Y126.014 E.00131
G1 X129.1 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3006
G1 X127.88 Y125.425 E.04048
G1 X127.831 Y125.831 E.01354
G1 X132.575 Y130.575 E.22255
G1 X128.664 Y130.575 E.12974
G1 X128.639 Y130.175 E.01329
G3 X128.512 Y129.9 I.091 J-.209 E.01098
G1 X128.213 Y129.787 E.01059
G1 X132.266 Y125.75 E.18978
G3 X132.336 Y126.062 I-.142 J.196 E.01163
G1 X132.6 Y126.245 E.01065
G2 X132.002 Y126.968 I1.169 J1.574 E.03144
G1 X132.822 Y125.905 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.447063
G1 F3006
G1 X132.882 Y125.947 E.00239
G1 X133.225 Y125.767 E.01274
G1 X133.19 Y125.483 E.00943
G1 X132.784 Y125.483 E.01337
G1 X132.706 Y125.599 E.00462
G2 X132.797 Y125.851 I.731 J-.123 E.00886
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539112
G1 F3006
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X135.298 Y125.767 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.447061
G1 F3006
G1 X135.641 Y125.947 E.01274
G2 X135.788 Y125.715 I-.083 J-.215 E.00968
G1 X135.803 Y125.603 E.00372
G1 X135.72 Y125.483 E.00481
G1 X135.333 Y125.483 E.01277
G1 X135.305 Y125.707 E.00745
G1 X136.362 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3006
G1 X136.183 Y125.425 E.00594
G3 X136.187 Y126.062 I-2.405 J.333 E.0212
G1 X135.923 Y126.245 E.01065
G3 X136.245 Y126.569 I-.497 J.815 E.0153
G1 X137.304 Y127.628 E.04971
G3 X137.97 Y127.706 I.161 J1.512 E.02241
G1 X138.125 Y127.551 E.00728
G3 X138.965 Y126.19 I2.171 J.4 E.05427
G1 X139.075 Y125.639 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415066
G1 F3006
G2 X139.251 Y125.906 I.313 J-.014 E.0102
G1 X139.497 Y125.777 E.00842
G3 X139.459 Y125.467 I27.565 J-3.579 E.00948
G1 X139.068 Y125.491 E.01188
G1 X139.072 Y125.579 E.00266
G1 X139.862 Y125.549 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.4965
G1 F3006
G1 X140.087 Y125.522 E.00839
; LINE_WIDTH: 0.470866
G1 X140.312 Y125.495 E.00792
; LINE_WIDTH: 0.472828
G3 X141.234 Y125.522 I.22 J8.097 E.0323
; LINE_WIDTH: 0.522135
G1 X141.459 Y125.549 E.00887
G1 X141.825 Y125.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3006
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.221 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F3006
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F3006
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464494
G1 F3006
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.89 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
G1 X141.896 Y130.284 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969212
G1 F3006
G1 X141.732 Y130.398 E.00088
; LINE_WIDTH: 0.141971
G1 X141.567 Y130.511 E.00162
; LINE_WIDTH: 0.187018
G1 X141.222 Y130.719 E.00473
G1 X141.182 Y130.628 F30000
; LINE_WIDTH: 0.181889
G1 F3006
G3 X140.957 Y130.654 I-.331 J-1.855 E.00257
G3 X140.348 Y130.653 I-.297 J-5.017 E.0069
; LINE_WIDTH: 0.174638
G1 X140.138 Y130.628 E.00226
; LINE_WIDTH: 0.208901
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243164
G1 X139.72 Y130.577 E.00344
G1 X139.754 Y130.511 F30000
; LINE_WIDTH: 0.193555
G1 F3006
G1 X140.099 Y130.719 E.00494
G1 X139.754 Y130.511 F30000
; LINE_WIDTH: 0.187022
G1 F3006
G1 X139.589 Y130.398 E.00235
; LINE_WIDTH: 0.141971
G1 X139.424 Y130.284 E.00162
G1 X141.182 Y130.628 F30000
; LINE_WIDTH: 0.243165
G1 F3006
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X138.196 Y128.947 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3006
G3 X138.1 Y128.533 I.791 J-.401 E.01422
G1 X138.039 Y128.682 E.00534
G3 X137.01 Y128.666 I-.455 J-3.815 E.03422
G1 X136.65 Y129.026 E.01692
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969196
G1 F3006
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171144
G3 X134.756 Y130.719 I-3.122 J-4.352 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295676
G1 F3006
G1 X135.16 Y130.566 E.00611
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F3006
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190491
G1 F3006
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.184091
G1 F3006
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140506
G1 X133.054 Y130.261 E.00155
; WIPE_START
G1 F24000
G1 X133.214 Y130.371 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.608 J1.054 P1  F30000
G1 X137.002 Y128.185 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.37215
G1 F3006
G1 X137.179 Y128.324 E.00604
G3 X137.792 Y128.314 I.562 J15.595 E.01645
G1 X137.87 Y128.125 E.00547
G1 X137.692 Y127.987 E.00604
G3 X137.08 Y127.997 I-.562 J-15.593 E.01645
G1 X137.025 Y128.13 E.00386
; WIPE_START
G1 F24000
G1 X137.08 Y127.997 E-.05462
G1 X137.692 Y127.987 E-.23293
G1 X137.87 Y128.125 E-.08559
G1 X137.792 Y128.314 E-.07742
G1 X137.179 Y128.324 E-.23293
G1 X137.021 Y128.2 E-.07652
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.157 J-1.207 P1  F30000
G1 X120.037 Y125.986 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.51245
G1 F3006
G1 X120.094 Y125.515 E.01815
G1 X119.467 Y125.493 E.02401
; LINE_WIDTH: 0.465236
G2 X118.077 Y125.515 I-.414 J17.796 E.04786
; LINE_WIDTH: 0.512449
G1 X118.134 Y125.986 E.01815
G1 X118.231 Y126.019 E.00391
G1 X118.755 Y125.913 E.02047
; LINE_WIDTH: 0.465451
G1 X119.365 Y125.91 E.02101
G1 X119.941 Y126.019 E.02016
; LINE_WIDTH: 0.51245
G1 X119.98 Y126.006 E.00161
G1 X117.624 Y126.459 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3006
G3 X117.845 Y126.319 I.394 J.378 E.00875
G1 X117.723 Y126.235 E.00491
G1 X117.625 Y125.425 E.02705
G1 X117.223 Y125.425 E.01333
G1 X115.95 Y126.698 E.05969
G1 X115.95 Y127.329 E.02093
G1 X116.768 Y127.378 E.02716
G1 X116.84 Y127.465 E.00375
G1 X116.863 Y127.404 E.00218
G1 X116.578 Y127.89 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.536536
G1 F3006
G1 X116.547 Y127.822 E.00301
G1 X116.056 Y127.804 E.01978
G2 X116.056 Y129.056 I20.993 J.622 E.05035
G1 X116.563 Y129.004 E.0205
G3 X116.573 Y127.949 I3.307 J-.496 E.04261
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.526 Y128.452 E-.19174
G1 X116.563 Y129.004 E-.2104
G1 X116.056 Y129.056 E-.19371
G1 X116.056 Y128.624 E-.16416
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
G3 Z2.2 I.171 J1.205 P1  F30000
G1 X127.813 Y126.956 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2978
G1 X128.086 Y127.351 E.01593
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01724
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01724
G1 X124.07 Y128.77 E.00333
G1 X124.02 Y128.353 E.01392
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01724
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01657
G1 X127.493 Y127.184 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2978
G1 X127.495 Y127.185 E.00006
G1 X127.736 Y127.535 E.01305
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.46 Y128.723 E.01463
G1 X124.415 Y128.353 E.01143
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.44 Y126.617 E.01463
G1 X126.801 Y126.706 E.01143
G1 X127.177 Y126.904 E.01305
G1 X127.448 Y127.144 E.01115
M204 S10000
; WIPE_START
G1 F24000
G1 X127.495 Y127.185 E-.02352
G1 X127.736 Y127.535 E-.16137
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.802 Y128.999 E-.09099
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.138 J-1.209 P1  F30000
G1 X117.863 Y130.133 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2978
G1 X117.509 Y129.82 E.01569
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X120.986 Y127.537 E.0033
G1 X121.131 Y127.919 E.01355
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.911 Y130.168 E.01601
G1 X118.378 Y129.97 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2978
G1 X118.113 Y129.831 E.00917
G1 X117.805 Y129.558 E.01268
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.431 Y129.998 E.00166
M204 S10000
; WIPE_START
G1 F24000
G1 X118.113 Y129.831 E-.13622
G1 X117.805 Y129.558 E-.15679
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.375 Y128.432 E-.1534
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.025 J1.217 P1  F30000
G1 X132.133 Y128.729 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2978
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01765
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01764
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01764
G1 X133.098 Y126.301 E.00336
G1 X133.479 Y126.101 E.01429
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01765
G1 X136.215 Y127.139 E.01764
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01765
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01764
G1 X133.008 Y129.98 E.01765
G1 X132.61 Y129.628 E.01764
G1 X132.308 Y129.19 E.01765
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2978
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.28 Y126.649 E.01502
G1 X133.619 Y126.471 E.01177
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
M73 P61 R4
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.055 Y126.838 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.02 J1.217 P1  F30000
G1 X142.372 Y126.682 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2978
G1 X142.6 Y127.013 E.01335
G1 X142.658 Y127.097 E.00338
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01805
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01805
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01804
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.469 Y126.241 E.00338
G1 X139.86 Y126.036 E.01466
G1 X140.388 Y125.906 E.01804
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.334 Y126.636 E.01736
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2978
G1 X142.278 Y127.236 E.01212
G1 X142.468 Y127.7 E.01542
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.278 Y127.236 E-.17207
G1 X142.468 Y127.7 E-.19068
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.415 Y128.73 E-.05618
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2978
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2978
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
G3 Z2.4 I-.923 J.794 P1  F30000
G1 X115.95 Y130.127 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2978
G1 X115.95 Y130.575 E.01484
G1 X116.621 Y130.575 E.02224
G1 X116.65 Y130.22 E.01182
G1 X116.766 Y130.117 E.00511
G1 X116.153 Y129.505 E.02875
G1 X116.768 Y129.467 E.02044
G1 X116.84 Y129.38 E.00375
G2 X117.088 Y129.823 I1.021 J-.282 E.01698
G1 X116.807 Y129.929 E.00995
G1 X117.524 Y130.351 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39469
G1 F2978
G1 X117.296 Y130.149 E.00872
G1 X117.133 Y130.24 E.00534
G2 X117.007 Y130.515 I.375 J.339 E.00884
G2 X117.482 Y130.543 I.309 J-1.185 E.01373
G3 X117.493 Y130.403 I.093 J-.063 E.00437
G1 X117.935 Y130.437 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137578
G1 F2978
G1 X118.085 Y130.54 E.0014
; LINE_WIDTH: 0.178235
G1 X118.235 Y130.644 E.00201
; LINE_WIDTH: 0.142113
G1 X118.435 Y130.673 E.00163
; LINE_WIDTH: 0.0969204
G1 X118.619 Y130.696 E.00082
G1 X119.552 Y130.696 F30000
; LINE_WIDTH: 0.138582
G1 F2978
G1 X119.737 Y130.673 E.00145
; LINE_WIDTH: 0.180244
G1 X119.922 Y130.651 E.00208
; LINE_WIDTH: 0.141112
G1 X120.087 Y130.54 E.00159
; LINE_WIDTH: 0.0969199
G1 X120.237 Y130.437 E.0008
G1 X121.145 Y130.434 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.394687
G1 F2978
G1 X121.007 Y130.199 E.0078
G1 X120.875 Y130.149 E.00402
G1 X120.642 Y130.356 E.00894
G1 X120.706 Y130.453 E.00333
G1 X120.682 Y130.543 E.00268
G1 X121.142 Y130.528 E.01319
G1 X121.143 Y130.494 E.00098
G1 X121.434 Y130.142 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2978
G1 X121.384 Y129.936 E.00703
G1 X121.084 Y129.823 E.01065
G2 X121.493 Y128.831 I-2.056 J-1.43 E.03588
G1 X124.519 Y125.805 E.14193
G1 X124.473 Y125.425 E.01269
G1 X120.547 Y125.425 E.13023
G1 X120.46 Y126.136 E.02376
G1 X124.119 Y129.795 E.17162
G1 X123.841 Y129.9 E.00986
G3 X123.701 Y130.185 I-.23 J.064 E.0115
G1 X123.669 Y130.575 E.01297
G1 X123.068 Y130.575 E.01994
G1 X124.577 Y130.324 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408509
G1 F2978
G1 X124.348 Y130.121 E.00912
G2 X124.107 Y130.342 I.073 J.321 E.01018
G1 X124.065 Y130.479 E.00426
G1 X124.152 Y130.537 E.00312
G1 X124.54 Y130.537 E.01154
G1 X124.523 Y130.417 E.00361
G1 X124.546 Y130.376 E.0014
G1 X124.997 Y130.409 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.139041
G1 F2978
G1 X125.152 Y130.516 E.00147
; LINE_WIDTH: 0.181163
G1 X125.307 Y130.623 E.00212
; LINE_WIDTH: 0.170306
G2 X125.488 Y130.66 I.138 J-.213 E.00197
; LINE_WIDTH: 0.130583
G1 X125.636 Y130.678 E.00106
; LINE_WIDTH: 0.0969204
G1 X125.784 Y130.696 E.00065
G1 X126.569 Y130.696 F30000
; LINE_WIDTH: 0.130583
G1 F2978
G1 X126.716 Y130.678 E.00106
; LINE_WIDTH: 0.164247
G1 X126.864 Y130.66 E.00147
; LINE_WIDTH: 0.19791
G1 X127.012 Y130.642 E.00188
; LINE_WIDTH: 0.187435
G1 X127.031 Y130.632 E.00026
; LINE_WIDTH: 0.142593
G2 X127.201 Y130.516 I-.862 J-1.445 E.00167
; LINE_WIDTH: 0.0969212
G1 X127.356 Y130.409 E.00083
G1 X128.132 Y130.17 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408503
G1 F2978
G1 X128.005 Y130.121 E.00406
G1 X127.77 Y130.329 E.00934
G1 X127.835 Y130.43 E.00356
G1 X127.804 Y130.537 E.00331
G1 X128.227 Y130.537 E.01261
G1 X128.266 Y130.408 E.00401
G1 X128.162 Y130.222 E.00637
G1 X127.382 Y125.986 F30000
; LINE_WIDTH: 0.488595
G1 F2978
G1 X127.441 Y125.503 E.01764
G1 X126.995 Y125.483 E.0162
; LINE_WIDTH: 0.4244
G2 X125.891 Y125.461 I-.829 J13.432 E.03435
; LINE_WIDTH: 0.402854
G1 X125.561 Y125.479 E.00968
; LINE_WIDTH: 0.47545
G3 X124.912 Y125.503 I-.632 J-8.236 E.02291
G1 X124.97 Y125.986 E.01712
G1 X125.058 Y126.032 E.00348
G1 X125.284 Y125.926 E.00879
; LINE_WIDTH: 0.47754
G1 X125.565 Y125.875 E.01014
; LINE_WIDTH: 0.419176
G1 X125.847 Y125.823 E.00878
G1 X126.462 Y125.821 E.01886
; LINE_WIDTH: 0.402854
G1 X126.765 Y125.873 E.00903
; LINE_WIDTH: 0.458961
G3 X127.295 Y126.032 I-.029 J1.061 E.01896
G1 X127.329 Y126.014 E.00131
G1 X129.1 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2978
G1 X127.88 Y125.425 E.04048
G1 X127.831 Y125.831 E.01354
G1 X132.575 Y130.575 E.22255
G1 X128.664 Y130.575 E.12974
G1 X128.639 Y130.175 E.01329
G3 X128.512 Y129.9 I.091 J-.209 E.01098
G1 X128.213 Y129.787 E.01059
G1 X132.266 Y125.75 E.18978
G3 X132.336 Y126.062 I-.142 J.196 E.01163
G1 X132.6 Y126.245 E.01065
G2 X132.002 Y126.968 I1.169 J1.574 E.03144
G1 X132.822 Y125.905 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.447063
G1 F2978
G1 X132.882 Y125.947 E.00239
G1 X133.225 Y125.767 E.01274
G1 X133.19 Y125.483 E.00943
G1 X132.784 Y125.483 E.01337
G1 X132.706 Y125.599 E.00462
G2 X132.797 Y125.851 I.731 J-.122 E.00886
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2978
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X135.298 Y125.767 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.447061
G1 F2978
G1 X135.641 Y125.947 E.01274
G2 X135.788 Y125.715 I-.083 J-.215 E.00968
G1 X135.803 Y125.603 E.00372
G1 X135.72 Y125.483 E.00481
G1 X135.333 Y125.483 E.01277
G1 X135.305 Y125.707 E.00745
G1 X136.362 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2978
G1 X136.183 Y125.425 E.00593
G3 X136.187 Y126.062 I-2.405 J.333 E.0212
G1 X135.923 Y126.245 E.01065
G3 X136.245 Y126.569 I-.497 J.815 E.0153
G1 X137.304 Y127.628 E.04971
G3 X137.97 Y127.706 I.161 J1.512 E.02241
G1 X138.125 Y127.551 E.00728
G3 X138.965 Y126.19 I2.171 J.4 E.05427
G1 X139.075 Y125.639 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415066
G1 F2978
G2 X139.251 Y125.906 I.313 J-.014 E.0102
G1 X139.497 Y125.777 E.00842
G3 X139.459 Y125.467 I27.598 J-3.583 E.00948
G1 X139.068 Y125.491 E.01188
G1 X139.072 Y125.579 E.00266
G1 X139.862 Y125.549 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.4965
G1 F2978
G1 X140.087 Y125.522 E.00839
; LINE_WIDTH: 0.470866
G1 X140.312 Y125.495 E.00792
; LINE_WIDTH: 0.472828
G3 X141.234 Y125.522 I.22 J8.098 E.0323
; LINE_WIDTH: 0.522136
G1 X141.459 Y125.549 E.00887
G1 X141.825 Y125.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2978
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.219 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541023
G1 F2978
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F2978
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F2978
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
G1 X141.896 Y130.284 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969212
G1 F2978
G1 X141.732 Y130.398 E.00088
; LINE_WIDTH: 0.141971
G1 X141.567 Y130.511 E.00162
; LINE_WIDTH: 0.187019
G1 X141.222 Y130.719 E.00473
G1 X141.182 Y130.628 F30000
; LINE_WIDTH: 0.243165
G1 F2978
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.182 Y130.628 F30000
; LINE_WIDTH: 0.181889
G1 F2978
G3 X140.957 Y130.654 I-.331 J-1.855 E.00257
G3 X140.348 Y130.653 I-.297 J-5.017 E.0069
; LINE_WIDTH: 0.174638
G1 X140.138 Y130.628 E.00226
; LINE_WIDTH: 0.208902
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X139.754 Y130.511 F30000
; LINE_WIDTH: 0.193556
G1 F2978
G1 X140.099 Y130.719 E.00494
G1 X139.754 Y130.511 F30000
; LINE_WIDTH: 0.187023
G1 F2978
G1 X139.589 Y130.398 E.00235
; LINE_WIDTH: 0.141971
G1 X139.424 Y130.284 E.00162
G1 X138.196 Y128.947 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2978
G3 X138.1 Y128.533 I.791 J-.401 E.01422
G1 X138.039 Y128.682 E.00534
G3 X137.01 Y128.666 I-.455 J-3.815 E.03422
G1 X136.65 Y129.026 E.01692
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.096921
G1 F2978
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171146
G3 X134.756 Y130.719 I-3.12 J-4.349 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2978
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.184094
G1 F2978
M73 P62 R4
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140507
G1 X133.054 Y130.261 E.00155
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190495
G1 F2978
G1 X133.767 Y130.719 E.00553
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295678
G1 F2978
G1 X135.16 Y130.566 E.00611
G1 X137.002 Y128.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.37215
G1 F2978
G1 X137.179 Y128.324 E.00604
G3 X137.792 Y128.314 I.562 J15.595 E.01645
G1 X137.87 Y128.125 E.00547
G1 X137.692 Y127.987 E.00604
G3 X137.08 Y127.997 I-.562 J-15.593 E.01645
G1 X137.025 Y128.13 E.00386
; WIPE_START
G1 F24000
G1 X137.08 Y127.997 E-.05462
G1 X137.692 Y127.987 E-.23293
G1 X137.87 Y128.125 E-.08559
G1 X137.792 Y128.314 E-.07742
G1 X137.179 Y128.324 E-.23293
G1 X137.021 Y128.2 E-.07652
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.157 J-1.207 P1  F30000
G1 X120.037 Y125.986 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.51245
G1 F2978
G1 X120.094 Y125.515 E.01815
G1 X119.467 Y125.493 E.02401
; LINE_WIDTH: 0.465236
G2 X118.077 Y125.515 I-.414 J17.796 E.04786
; LINE_WIDTH: 0.512449
G1 X118.134 Y125.986 E.01815
G1 X118.231 Y126.019 E.00391
G1 X118.755 Y125.913 E.02047
; LINE_WIDTH: 0.465451
G1 X119.365 Y125.91 E.02101
G1 X119.941 Y126.019 E.02016
; LINE_WIDTH: 0.51245
G1 X119.98 Y126.006 E.00161
G1 X117.624 Y126.459 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2978
G3 X117.845 Y126.319 I.394 J.378 E.00875
G1 X117.723 Y126.235 E.00491
G1 X117.625 Y125.425 E.02705
G1 X117.223 Y125.425 E.01333
G1 X115.95 Y126.698 E.05969
G1 X115.95 Y127.329 E.02093
G1 X116.768 Y127.378 E.02716
G1 X116.84 Y127.465 E.00375
G1 X116.863 Y127.404 E.00218
G1 X116.578 Y127.89 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.536536
G1 F2978
G1 X116.547 Y127.822 E.00301
G1 X116.056 Y127.804 E.01978
G2 X116.056 Y129.056 I20.993 J.622 E.05035
G1 X116.563 Y129.004 E.0205
G3 X116.573 Y127.949 I3.307 J-.496 E.04261
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.526 Y128.452 E-.19174
G1 X116.563 Y129.004 E-.2104
G1 X116.056 Y129.056 E-.19371
G1 X116.056 Y128.624 E-.16416
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
G3 Z2.4 I.171 J1.205 P1  F30000
G1 X127.813 Y126.956 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2842
G1 X128.086 Y127.351 E.01593
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01724
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01724
G1 X124.069 Y128.757 E.00378
G1 X124.02 Y128.353 E.01347
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.052 Y126.526 E.00378
G1 X125.412 Y126.337 E.01347
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01657
G1 X127.494 Y127.184 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2842
G1 X127.495 Y127.185 E.00005
G1 X127.736 Y127.535 E.01305
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.458 Y128.709 E.00204
G1 X124.415 Y128.353 E.01101
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.234 Y126.873 E.00204
G1 X125.552 Y126.706 E.01101
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.449 Y127.144 E.01115
M204 S10000
; WIPE_START
G1 F24000
G1 X127.495 Y127.185 E-.02343
G1 X127.736 Y127.535 E-.16137
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.802 Y128.999 E-.09108
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.144 J-1.208 P1  F30000
G1 X117.92 Y130.173 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2842
G1 X117.889 Y130.156 E.00118
G1 X117.509 Y129.82 E.01685
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X117.989 Y126.637 E.00373
G1 X118.339 Y126.453 E.01311
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X120.991 Y127.549 E.00373
G1 X121.131 Y127.919 E.01311
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.974 Y130.201 E.01368
G1 X118.35 Y129.955 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2842
G1 X118.113 Y129.831 E.00821
G1 X117.805 Y129.558 E.01268
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.171 Y126.984 E.002
G1 X118.479 Y126.822 E.01068
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.624 Y127.688 E.002
G1 X120.747 Y128.013 E.01068
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.403 Y129.983 E.00263
M204 S10000
; WIPE_START
G1 F24000
G1 X118.113 Y129.831 E-.12428
G1 X117.805 Y129.558 E-.15679
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.377 Y128.4 E-.00855
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.021 J1.217 P1  F30000
G1 X132.114 Y128.653 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2842
G1 X132.055 Y128.164 E.01634
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01764
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01765
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01765
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01765
G1 X132.126 Y128.712 E.01696
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2842
G1 X132.494 Y128.531 E.00208
G1 X132.45 Y128.164 E.01134
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.494 Y128.531 E-.04813
G1 X132.45 Y128.164 E-.14027
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07374
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.02 J1.217 P1  F30000
G1 X142.372 Y126.682 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2842
G1 X142.658 Y127.097 E.01673
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01805
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.334 Y126.636 E.01736
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2842
G1 X142.269 Y127.224 E.01167
G1 X142.309 Y127.281 E.00212
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.269 Y127.224 E-.16658
G1 X142.309 Y127.281 E-.02618
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05565
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2842
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2842
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
G3 Z2.6 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2842
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.365 J-279.501 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2842
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2842
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.043 E.04611
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F2842
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.124 J-4.355 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2842
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
M73 P63 R4
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250995
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.184087
G1 F2842
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140504
G1 X133.054 Y130.261 E.00154
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190487
G1 F2842
G1 X133.767 Y130.719 E.00553
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295676
G1 F2842
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.141969
G1 F2842
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187018
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193551
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208901
G1 F2842
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243164
G1 X139.72 Y130.577 E.00344
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2842
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.141971
G1 F2842
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969211
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.187019
G1 F2842
G1 X141.222 Y130.719 E.00473
; WIPE_START
G1 F24000
G1 X141.567 Y130.511 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.215 J.066 P1  F30000
G1 X141.825 Y125.785 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2842
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.113 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2842
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441516
G1 F2842
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464492
G1 F2842
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.892 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26678
G1 X143.611 Y129.457 E-.23665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.066 J-.587 P1  F30000
G1 X141.459 Y125.549 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522136
G1 F2842
G1 X141.234 Y125.522 E.00887
; LINE_WIDTH: 0.472828
G2 X140.312 Y125.495 I-.701 J8.07 E.0323
; LINE_WIDTH: 0.470866
G1 X140.087 Y125.522 E.00792
; LINE_WIDTH: 0.496501
G1 X139.862 Y125.549 E.00839
; WIPE_START
G1 F24000
G1 X140.087 Y125.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.436 J-1.136 P1  F30000
G1 X127.356 Y130.409 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.096921
G1 F2842
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142592
G3 X127.031 Y130.632 I-1.032 J-1.329 E.00167
; LINE_WIDTH: 0.187432
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2842
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130584
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170309
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181164
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139042
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.0969209
G1 F2842
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.14111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.18024
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.13858
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2842
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142112
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178237
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137579
G1 X117.935 Y130.437 E.00141
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z2.6 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X128.086 Y127.351 E.01593
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01724
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01657
G1 X127.495 Y127.185 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X127.736 Y127.535 E.01305
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.45 Y127.146 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.535 E-.18359
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.002 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.138 J-1.209 P1  F30000
G1 X117.862 Y130.133 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X117.509 Y129.82 E.01565
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118 Y126.631 E.00417
G1 X118.339 Y126.453 E.01268
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.91 Y130.168 E.01605
G1 X118.321 Y129.94 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X118.113 Y129.831 E.00719
G1 X117.805 Y129.558 E.01268
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.183 Y126.978 E.0024
G1 X118.479 Y126.822 E.01028
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.116 Y127.066 E.0024
G1 X120.367 Y127.288 E.01028
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.374 Y129.968 E.00364
M204 S10000
; WIPE_START
G1 F24000
G1 X118.113 Y129.831 E-.11173
G1 X117.805 Y129.558 E-.15679
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.381 Y128.368 E-.02111
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.03 J1.217 P1  F30000
G1 X132.133 Y128.729 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01765
G1 X132.119 Y127.636 E.01764
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01765
G1 X136.215 Y127.139 E.01764
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01764
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.02 J1.217 P1  F30000
G1 X142.372 Y126.682 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X142.658 Y127.097 E.01673
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01805
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01805
G1 X138.454 Y128.556 E.00434
G1 X138.404 Y128.146 E.0137
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01804
G1 X141.942 Y126.289 E.01804
G1 X142.334 Y126.636 E.01736
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
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
G3 Z2.8 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.444 J-279.58 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539112
G1 F2840
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
M73 P64 R4
G3 X136.245 Y126.569 I-10.062 J11.044 E.04611
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.096921
G1 F2840
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2840
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190489
G1 F2840
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.184089
G1 F2840
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140504
G1 X133.054 Y130.261 E.00154
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295678
G1 F2840
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.141969
G1 F2840
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187019
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193551
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208902
G1 F2840
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2840
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243164
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277426
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.141968
G1 F2840
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969197
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.187018
G1 F2840
G1 X141.222 Y130.719 E.00473
; WIPE_START
G1 F24000
G1 X141.567 Y130.511 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.215 J.066 P1  F30000
G1 X141.825 Y125.785 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2840
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.241 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2840
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441516
G1 F2840
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464492
G1 F2840
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.892 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26679
G1 X143.611 Y129.457 E-.23665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.066 J-.587 P1  F30000
G1 X141.459 Y125.549 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522136
G1 F2840
G1 X141.234 Y125.522 E.00886
; LINE_WIDTH: 0.472828
G2 X140.312 Y125.495 I-.701 J8.07 E.0323
; LINE_WIDTH: 0.470866
G1 X140.087 Y125.522 E.00792
; LINE_WIDTH: 0.496501
G1 X139.862 Y125.549 E.00839
; WIPE_START
G1 F24000
G1 X140.087 Y125.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.436 J-1.136 P1  F30000
G1 X127.356 Y130.409 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.096921
G1 F2840
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142592
G3 X127.031 Y130.632 I-1.033 J-1.33 E.00167
; LINE_WIDTH: 0.187432
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130583
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170308
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181162
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139041
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2840
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142112
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178233
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137576
G1 X117.935 Y130.437 E.0014
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z2.8 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X128.086 Y127.351 E.01593
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01724
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.065 Y128.73 E.00468
G1 X124.02 Y128.353 E.01257
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01657
G1 X127.495 Y127.185 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X127.736 Y127.535 E.01305
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.455 Y128.682 E.00287
G1 X124.415 Y128.353 E.01018
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.45 Y127.146 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.535 E-.18359
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.002 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.137 J-1.209 P1  F30000
G1 X117.862 Y130.132 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X117.509 Y129.82 E.01564
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01684
G1 X120.386 Y126.781 E.00461
G1 X120.662 Y127.026 E.01224
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.91 Y130.167 E.01606
G1 X118.29 Y129.924 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X118.113 Y129.831 E.00613
G1 X117.805 Y129.558 E.01268
M73 P65 R4
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.126 Y127.075 E.0028
G1 X120.367 Y127.288 E.00987
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.343 Y129.952 E.0047
M204 S10000
; WIPE_START
G1 F24000
G1 X118.113 Y129.831 E-.0986
G1 X117.805 Y129.558 E-.15679
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.385 Y128.333 E-.03423
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.033 J1.217 P1  F30000
G1 X132.133 Y128.729 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01765
G1 X132.119 Y127.636 E.01764
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01764
G1 X133.479 Y126.101 E.01765
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01765
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01764
G1 X133.008 Y129.98 E.01765
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01764
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01805
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.507 Y126.221 E.00482
G1 X139.86 Y126.036 E.01322
G1 X140.388 Y125.906 E.01804
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X140.98 Y126.321 E.00301
G1 X141.32 Y126.405 E.01078
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
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
G3 Z3 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.447 J-279.582 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2840
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.044 E.0461
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F2840
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171143
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2840
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190493
G1 F2840
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.184093
G1 F2840
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140507
G1 X133.054 Y130.261 E.00155
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295676
G1 F2840
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.141969
G1 F2840
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187018
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193551
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208902
G1 F2840
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2840
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.141968
G1 F2840
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969197
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.187019
G1 F2840
G1 X141.222 Y130.719 E.00473
; WIPE_START
G1 F24000
G1 X141.567 Y130.511 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P66 R4
G3 Z3 I1.215 J.066 P1  F30000
G1 X141.825 Y125.785 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2840
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.345 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2840
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441516
G1 F2840
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464492
G1 F2840
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.892 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26679
G1 X143.611 Y129.457 E-.23665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.066 J-.587 P1  F30000
G1 X141.459 Y125.549 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522135
G1 F2840
G1 X141.234 Y125.522 E.00887
; LINE_WIDTH: 0.472828
G2 X140.312 Y125.495 I-.701 J8.07 E.0323
; LINE_WIDTH: 0.470866
G1 X140.087 Y125.522 E.00792
; LINE_WIDTH: 0.4965
G1 X139.862 Y125.549 E.00839
; WIPE_START
G1 F24000
G1 X140.087 Y125.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.436 J-1.136 P1  F30000
G1 X127.356 Y130.409 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.0969198
G1 F2840
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142594
G3 X127.031 Y130.632 I-1.033 J-1.33 E.00167
; LINE_WIDTH: 0.187435
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.197912
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164248
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130583
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170308
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.18116
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.13904
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2840
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142113
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178235
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137578
G1 X117.935 Y130.437 E.0014
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z3 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X128.086 Y127.351 E.01593
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01724
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01724
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01657
G1 X127.495 Y127.185 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X127.736 Y127.535 E.01305
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.45 Y127.146 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.535 E-.18359
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.002 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.137 J-1.209 P1  F30000
G1 X117.861 Y130.132 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X117.509 Y129.82 E.01562
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.909 Y130.167 E.01608
G1 X118.258 Y129.907 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X118.113 Y129.831 E.00503
G1 X117.805 Y129.558 E.01268
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.311 Y129.935 E.00581
M204 S10000
; WIPE_START
G1 F24000
G1 X118.113 Y129.831 E-.08496
G1 X117.805 Y129.558 E-.15679
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.389 Y128.298 E-.04788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.029 J1.217 P1  F30000
G1 X132.114 Y128.653 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X132.055 Y128.164 E.01634
G1 X132.119 Y127.636 E.01764
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01765
G1 X136.215 Y127.139 E.01764
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01764
G1 X133.008 Y129.98 E.01765
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01764
G1 X132.126 Y128.712 E.01696
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X132.489 Y128.489 E.00337
G1 X132.45 Y128.164 E.01005
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.489 Y128.489 E-.06404
G1 X132.45 Y128.164 E-.12428
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07382
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.02 J1.217 P1  F30000
G1 X142.372 Y126.682 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X142.658 Y127.097 E.01673
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01805
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.334 Y126.636 E.01736
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
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
G3 Z3.2 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.486 J-279.622 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2840
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.043 E.04611
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F2840
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
M73 P67 R3
G1 F2840
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190492
G1 F2840
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.184092
G1 F2840
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140506
G1 X133.054 Y130.261 E.00155
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295676
G1 F2840
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.141968
G1 F2840
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187015
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193549
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208901
G1 F2840
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243164
G1 X139.72 Y130.577 E.00344
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2840
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.14197
G1 F2840
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969198
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.18702
G1 F2840
G1 X141.222 Y130.719 E.00473
; WIPE_START
G1 F24000
G1 X141.567 Y130.511 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.215 J.066 P1  F30000
G1 X141.825 Y125.785 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2840
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.199 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2840
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F2840
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F2840
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26678
G1 X143.611 Y129.457 E-.23665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.066 J-.587 P1  F30000
G1 X141.459 Y125.549 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522134
G1 F2840
G1 X141.234 Y125.522 E.00886
; LINE_WIDTH: 0.472828
G2 X140.312 Y125.495 I-.701 J8.07 E.0323
; LINE_WIDTH: 0.470866
G1 X140.087 Y125.522 E.00792
; LINE_WIDTH: 0.496501
G1 X139.862 Y125.549 E.00839
; WIPE_START
G1 F24000
G1 X140.087 Y125.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.436 J-1.136 P1  F30000
G1 X127.356 Y130.409 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.0969199
G1 F2840
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142593
G3 X127.031 Y130.632 I-1.032 J-1.329 E.00167
; LINE_WIDTH: 0.187434
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.197912
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164248
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130583
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170308
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.18116
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.13904
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2840
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142113
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178236
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137578
G1 X117.935 Y130.437 E.00141
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z3.2 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2789
G1 X128.086 Y127.351 E.01593
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.495 Y127.185 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2789
G1 X127.736 Y127.535 E.01305
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.45 Y127.146 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.535 E-.18359
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.002 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.137 J-1.209 P1  F30000
G1 X117.861 Y130.131 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2789
G1 X117.509 Y129.82 E.0156
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.909 Y130.167 E.0161
G1 X118.225 Y129.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2789
G1 X118.113 Y129.831 E.00388
G1 X117.805 Y129.558 E.01268
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.278 Y129.918 E.00695
M204 S10000
; WIPE_START
G1 F24000
G1 X118.113 Y129.831 E-.07083
G1 X117.805 Y129.558 E-.15679
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.394 Y128.261 E-.06201
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.039 J1.216 P1  F30000
G1 X132.133 Y128.729 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2789
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01765
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01765
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01764
G1 X132.247 Y129.03 E.00568
G1 X132.154 Y128.785 E.00866
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2789
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.614 Y128.891 E.0038
G1 X132.524 Y128.654 E.00778
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2789
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01805
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01804
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.533 Y126.208 E.00578
G1 X139.86 Y126.036 E.01226
G1 X140.388 Y125.906 E.01804
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2789
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
M73 P68 R3
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2789
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2789
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
G3 Z3.4 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2789
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.502 Y130.575 E.0097
G1 X120.736 Y130.575 E.12492
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.367 J-279.503 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2789
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2789
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.062 J11.045 E.0461
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.096921
G1 F2789
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2789
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250995
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.184087
G1 F2789
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140504
G1 X133.054 Y130.261 E.00154
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190486
G1 F2789
G1 X133.767 Y130.719 E.00553
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295678
G1 F2789
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.14197
G1 F2789
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.18702
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193552
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2789
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243164
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277426
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.141968
G1 F2789
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969196
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.187016
G1 F2789
G1 X141.222 Y130.719 E.00473
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208901
G1 F2789
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243164
G1 X139.72 Y130.577 E.00344
; WIPE_START
G1 F24000
G1 X139.929 Y130.603 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J-.016 P1  F30000
G1 X139.862 Y125.549 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.4965
G1 F2789
G1 X140.087 Y125.522 E.00839
; LINE_WIDTH: 0.470866
G1 X140.312 Y125.495 E.00792
; LINE_WIDTH: 0.472828
G3 X141.234 Y125.522 I.22 J8.098 E.0323
; LINE_WIDTH: 0.522136
G1 X141.459 Y125.549 E.00887
G1 X141.825 Y125.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2789
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.302 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2789
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441516
G1 F2789
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464492
G1 F2789
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.892 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
G1 X127.356 Y130.409 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.096921
G1 F2789
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142592
G3 X127.031 Y130.632 I-1.033 J-1.33 E.00167
; LINE_WIDTH: 0.187432
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2789
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130583
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170308
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181162
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139041
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2789
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2789
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142112
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178235
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137577
G1 X117.935 Y130.437 E.00141
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z3.4 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01724
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.495 Y127.185 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X127.736 Y127.535 E.01305
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.45 Y127.146 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.535 E-.18359
M73 P69 R3
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.002 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.137 J-1.209 P1  F30000
G1 X117.861 Y130.131 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X117.509 Y129.82 E.01558
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.014 Y127.61 E.00591
G1 X121.131 Y127.919 E.01093
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.908 Y130.167 E.01612
G1 X118.191 Y129.872 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X118.113 Y129.831 E.00271
G1 X117.805 Y129.558 E.01268
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.648 Y127.75 E.00402
G1 X120.747 Y128.013 E.00866
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.245 Y129.9 E.00813
M204 S10000
; WIPE_START
G1 F24000
G1 X118.113 Y129.831 E-.05627
G1 X117.805 Y129.558 E-.15679
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.398 Y128.223 E-.07657
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.042 J1.216 P1  F30000
G1 X132.133 Y128.729 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01764
G1 X132.119 Y127.636 E.01764
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01764
G1 X132.242 Y129.017 E.00615
G1 X132.154 Y128.785 E.0082
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.02 J1.217 P1  F30000
G1 X142.372 Y126.682 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X142.658 Y127.097 E.01673
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.447 Y128.499 E.00626
G1 X138.404 Y128.146 E.01178
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01804
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01804
G1 X141.942 Y126.289 E.01804
G1 X142.334 Y126.636 E.01736
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
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
G3 Z3.6 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.405 J-279.541 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2840
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.044 E.0461
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969196
G1 F2840
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2840
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190492
G1 F2840
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.18409
G1 F2840
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140505
G1 X133.054 Y130.261 E.00155
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295678
G1 F2840
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.141969
G1 F2840
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187018
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193552
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208901
G1 F2840
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243164
G1 X139.72 Y130.577 E.00344
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2840
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
M73 P70 R3
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.14197
G1 F2840
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969198
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.18702
G1 F2840
G1 X141.222 Y130.719 E.00473
; WIPE_START
G1 F24000
G1 X141.567 Y130.511 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.215 J.066 P1  F30000
G1 X141.825 Y125.785 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2840
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.199 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2840
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F2840
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F2840
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26678
G1 X143.611 Y129.457 E-.23665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.066 J-.587 P1  F30000
G1 X141.459 Y125.549 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522136
G1 F2840
G1 X141.234 Y125.522 E.00886
; LINE_WIDTH: 0.472828
G2 X140.312 Y125.495 I-.701 J8.07 E.0323
; LINE_WIDTH: 0.470866
G1 X140.087 Y125.522 E.00792
; LINE_WIDTH: 0.4965
G1 X139.862 Y125.549 E.00839
; WIPE_START
G1 F24000
G1 X140.087 Y125.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.436 J-1.136 P1  F30000
G1 X127.356 Y130.409 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.0969196
G1 F2840
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142591
G3 X127.031 Y130.632 I-1.033 J-1.33 E.00167
; LINE_WIDTH: 0.187432
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130584
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170309
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181163
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139041
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2840
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142113
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178236
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137578
G1 X117.935 Y130.437 E.00141
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z3.6 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2794
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.495 Y127.185 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2794
G1 X127.736 Y127.535 E.01305
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.45 Y127.146 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.535 E-.18359
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.002 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.124 J-1.211 P1  F30000
G1 X117.746 Y130.029 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2794
G1 X117.509 Y129.82 E.01049
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.059 Y126.6 E.00635
G1 X118.339 Y126.453 E.01049
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.889 Y130.156 E.01685
G1 X117.791 Y130.069 E.00436
G1 X118.151 Y129.851 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2794
G1 X118.113 Y129.831 E.00129
G1 X118.006 Y129.736 E.00442
G1 X117.805 Y129.558 E.00826
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.519 Y127.762 E.00826
G1 X117.57 Y127.627 E.00442
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.241 Y126.947 E.00442
G1 X118.479 Y126.822 E.00826
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.204 Y129.879 E.00954
M204 S10000
; WIPE_START
G1 F24000
G1 X118.113 Y129.831 E-.03881
G1 X118.006 Y129.736 E-.05466
G1 X117.805 Y129.558 E-.10213
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.404 Y128.177 E-.09402
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.039 J1.216 P1  F30000
G1 X132.114 Y128.653 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2794
G1 X132.055 Y128.164 E.01634
G1 X132.119 Y127.636 E.01764
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01764
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01764
G1 X132.126 Y128.712 E.01696
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2794
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2794
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01805
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01805
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2794
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2794
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2794
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
G3 Z3.8 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2794
G2 X117.576 Y130.344 I2.718 J-1.46 E.03745
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.405 J-279.541 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2794
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2794
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.044 E.0461
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969196
M73 P71 R3
G1 F2794
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295678
G1 F2794
G1 X135.16 Y130.566 E.00611
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2794
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190491
G1 F2794
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.184091
G1 F2794
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140506
G1 X133.054 Y130.261 E.00155
G1 X127.356 Y130.409 F30000
; LINE_WIDTH: 0.0969196
G1 F2794
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142591
G3 X127.031 Y130.632 I-1.033 J-1.33 E.00167
; LINE_WIDTH: 0.187432
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2794
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130583
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170308
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181161
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139041
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2794
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2794
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142113
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178235
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137578
G1 X117.935 Y130.437 E.00141
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.14197
G1 F2794
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187019
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193551
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2794
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.14197
G1 F2794
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969198
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.18702
G1 F2794
G1 X141.222 Y130.719 E.00473
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208902
G1 F2794
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
; WIPE_START
G1 F24000
G1 X139.929 Y130.603 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.217 J-.016 P1  F30000
G1 X139.862 Y125.549 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.496501
G1 F2794
G1 X140.087 Y125.522 E.00839
; LINE_WIDTH: 0.470866
G1 X140.312 Y125.495 E.00792
; LINE_WIDTH: 0.472828
G3 X141.234 Y125.522 I.22 J8.098 E.0323
; LINE_WIDTH: 0.522136
G1 X141.459 Y125.549 E.00887
G1 X141.825 Y125.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2794
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.261 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2794
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441516
G1 F2794
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464492
G1 F2794
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.892 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26679
G1 X143.611 Y129.457 E-.23665
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
G3 Z3.8 I.19 J-1.202 P1  F30000
G1 X127.813 Y126.956 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2797
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.495 Y127.185 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2797
G1 X127.736 Y127.535 E.01305
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.446 Y128.615 E.00496
G1 X124.415 Y128.353 E.00809
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.318 Y126.829 E.00496
G1 X125.552 Y126.706 E.00809
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.45 Y127.146 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.535 E-.18359
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.002 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.143 J-1.208 P1  F30000
G1 X117.924 Y130.175 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2797
G1 X117.889 Y130.156 E.0013
G1 X117.509 Y129.82 E.01685
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.148 Y127.635 E.01006
G1 X117.22 Y127.444 E.00679
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.977 Y130.202 E.01355
G1 X118.121 Y129.835 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2797
G1 X118.113 Y129.831 E.00026
G1 X117.805 Y129.558 E.01268
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.515 Y127.774 E.00785
G1 X117.57 Y127.627 E.00482
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.174 Y129.863 E.01057
M204 S10000
; WIPE_START
G1 F24000
G1 X118.113 Y129.831 E-.02604
G1 X117.805 Y129.558 E-.15679
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.408 Y128.144 E-.1068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.048 J1.216 P1  F30000
G1 X132.133 Y128.729 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2797
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01764
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01765
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01765
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01764
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2797
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2797
G1 X142.349 Y126.65 E.00131
G1 X142.535 Y126.918 E.01082
G1 X142.658 Y127.097 E.00722
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01805
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.443 Y128.47 E.00722
G1 X138.404 Y128.146 E.01082
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.571 Y126.188 E.00722
G1 X139.86 Y126.036 E.01082
G1 X140.388 Y125.906 E.01804
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2797
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
M73 P72 R3
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2797
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2797
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
G3 Z4 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2797
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.599 J-279.734 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2797
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2797
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.062 J11.045 E.0461
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F2797
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171146
G3 X134.756 Y130.719 I-3.12 J-4.35 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2797
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190493
G1 F2797
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.184093
G1 F2797
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140507
G1 X133.054 Y130.261 E.00155
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295678
G1 F2797
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.141968
G1 F2797
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187015
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193549
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2797
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.18702
G1 F2797
G1 X141.222 Y130.719 E.00473
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.14197
G1 F2797
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969198
G1 X141.896 Y130.284 E.00088
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208901
G1 F2797
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243164
G1 X139.72 Y130.577 E.00344
; WIPE_START
G1 F24000
G1 X139.929 Y130.603 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.217 J-.016 P1  F30000
G1 X139.862 Y125.549 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.4965
G1 F2797
G1 X140.087 Y125.522 E.00839
; LINE_WIDTH: 0.470866
G1 X140.312 Y125.495 E.00792
; LINE_WIDTH: 0.472828
G3 X141.234 Y125.522 I.22 J8.098 E.0323
; LINE_WIDTH: 0.522136
G1 X141.459 Y125.549 E.00887
G1 X141.825 Y125.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2797
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.199 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541023
G1 F2797
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F2797
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F2797
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
G1 X127.356 Y130.409 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969198
G1 F2797
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142594
G3 X127.031 Y130.632 I-1.033 J-1.33 E.00167
; LINE_WIDTH: 0.187435
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.197912
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164248
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2797
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130583
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170307
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.18116
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.13904
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2797
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2797
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142112
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178234
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137577
G1 X117.935 Y130.437 E.0014
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z4 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.056 Y128.649 E.00738
G1 X124.02 Y128.353 E.00986
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.495 Y127.185 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X127.736 Y127.535 E.01305
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.445 Y128.601 E.00538
G1 X124.415 Y128.353 E.00767
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
M73 P73 R3
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.45 Y127.146 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.535 E-.18359
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.002 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.144 J-1.208 P1  F30000
G1 X117.924 Y130.175 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X117.889 Y130.156 E.00133
G1 X117.509 Y129.82 E.01685
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.082 Y126.588 E.00722
G1 X118.339 Y126.453 E.00962
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.445 Y126.833 E.00722
G1 X120.662 Y127.026 E.00962
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.978 Y130.203 E.01353
G1 X118.093 Y129.813 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X117.805 Y129.558 E.01182
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.51 Y127.786 E.00745
G1 X117.57 Y127.627 E.00523
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.264 Y126.935 E.00523
G1 X118.479 Y126.822 E.00745
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.185 Y127.127 E.00523
G1 X120.367 Y127.288 E.00745
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.142 Y129.846 E.01169
M204 S10000
; WIPE_START
G1 F24000
G1 X117.805 Y129.558 E-.1687
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.412 Y128.107 E-.12092
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.051 J1.216 P1  F30000
G1 X132.133 Y128.729 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01765
G1 X132.119 Y127.636 E.01764
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01765
G1 X136.215 Y127.139 E.01764
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01764
G1 X132.308 Y129.19 E.01765
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.839 Y126.841 E.01034
G1 X138.971 Y126.65 E.0077
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01804
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
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
G3 Z4.2 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.444 J-279.579 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539112
G1 F2840
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.043 E.04611
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969196
G1 F2840
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2840
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190492
G1 F2840
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.18409
G1 F2840
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140505
G1 X133.054 Y130.261 E.00155
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295678
G1 F2840
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.141969
G1 F2840
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187018
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193552
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208901
G1 F2840
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243164
G1 X139.72 Y130.577 E.00344
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2840
M73 P74 R3
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.14197
G1 F2840
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969198
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.18702
G1 F2840
G1 X141.222 Y130.719 E.00473
; WIPE_START
G1 F24000
G1 X141.567 Y130.511 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.215 J.066 P1  F30000
G1 X141.825 Y125.785 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2840
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.199 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2840
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F2840
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F2840
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26678
G1 X143.611 Y129.457 E-.23665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.066 J-.587 P1  F30000
G1 X141.459 Y125.549 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522136
G1 F2840
G1 X141.234 Y125.522 E.00887
; LINE_WIDTH: 0.472828
G2 X140.312 Y125.495 I-.701 J8.07 E.0323
; LINE_WIDTH: 0.470866
G1 X140.087 Y125.522 E.00792
; LINE_WIDTH: 0.4965
G1 X139.862 Y125.549 E.00839
; WIPE_START
G1 F24000
G1 X140.087 Y125.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.436 J-1.136 P1  F30000
G1 X127.356 Y130.409 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.0969196
G1 F2840
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142591
G3 X127.031 Y130.632 I-1.033 J-1.33 E.00167
; LINE_WIDTH: 0.187432
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130584
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170308
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181163
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139041
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2840
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142113
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178237
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137579
G1 X117.935 Y130.437 E.00141
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z4.2 I.429 J1.139 P1  F30000
G1 X127.761 Y126.897 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2872
G1 X127.79 Y126.923 E.00131
G1 X128.086 Y127.351 E.01725
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01724
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.716 Y126.857 E.01394
G1 X127.495 Y127.185 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2872
G1 X127.629 Y127.38 E.00725
G1 X127.736 Y127.535 E.00579
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.45 Y127.146 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X127.629 Y127.38 E-.11199
G1 X127.736 Y127.535 E-.07165
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.801 Y129.002 E-.09225
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.137 J-1.209 P1  F30000
G1 X117.859 Y130.129 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2872
G1 X117.716 Y130.003 E.00631
G1 X117.509 Y129.82 E.00919
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.094 Y126.582 E.00766
G1 X118.339 Y126.453 E.00919
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.906 Y130.165 E.01621
G1 X118.068 Y129.791 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2872
G1 X117.976 Y129.71 E.00375
G1 X117.805 Y129.558 E.00705
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.276 Y126.929 E.00563
G1 X118.479 Y126.822 E.00705
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X118.113 Y129.83 E.00004
M204 S10000
; WIPE_START
G1 F24000
G1 X117.976 Y129.71 E-.0692
G1 X117.805 Y129.558 E-.08714
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.416 Y128.075 E-.13329
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.048 J1.216 P1  F30000
G1 X132.114 Y128.653 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2872
G1 X132.055 Y128.164 E.01634
G1 X132.119 Y127.636 E.01764
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01764
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01764
G1 X132.126 Y128.712 E.01696
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2872
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2872
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01805
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01804
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2872
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2872
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2872
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
G3 Z4.4 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2872
G2 X117.576 Y130.344 I2.627 J-1.387 E.03747
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X120.628 Y126.304 E.04121
G1 X120.773 Y126.204 E.00586
G1 X121.197 Y126.281 E.0143
G1 X121.634 Y126.914 E.02552
G1 X121.412 Y127.088 E.00935
G1 X124.209 Y129.885 E.13119
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.405 J-279.541 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2872
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2872
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.044 E.0461
G1 X138.085 Y128.409 E.08632
M73 P75 R3
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969196
G1 F2872
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2872
M73 P75 R2
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.18409
G1 F2872
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140505
G1 X133.054 Y130.261 E.00155
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190492
G1 F2872
G1 X133.767 Y130.719 E.00553
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295678
G1 F2872
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.141969
G1 F2872
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187018
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193552
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208901
G1 F2872
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2872
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.187017
G1 F2872
G1 X141.222 Y130.719 E.00473
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.141969
G1 F2872
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969197
G1 X141.896 Y130.284 E.00088
; WIPE_START
G1 F24000
G1 X141.732 Y130.398 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.217 J.025 P1  F30000
G1 X141.825 Y125.785 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2872
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.302 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2872
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F2872
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F2872
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26678
G1 X143.611 Y129.457 E-.23665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.066 J-.587 P1  F30000
G1 X141.459 Y125.549 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522136
G1 F2872
G1 X141.234 Y125.522 E.00886
; LINE_WIDTH: 0.472828
G2 X140.312 Y125.495 I-.701 J8.07 E.0323
; LINE_WIDTH: 0.470866
G1 X140.087 Y125.522 E.00792
; LINE_WIDTH: 0.496501
G1 X139.862 Y125.549 E.00839
; WIPE_START
G1 F24000
G1 X140.087 Y125.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.436 J-1.136 P1  F30000
G1 X127.356 Y130.409 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.0969196
G1 F2872
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142591
G3 X127.031 Y130.632 I-1.033 J-1.33 E.00167
; LINE_WIDTH: 0.187432
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2872
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130584
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170309
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181165
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139042
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2872
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2872
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142112
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.17824
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.13758
G1 X117.935 Y130.437 E.00141
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.951 J.759 P1  F30000
G1 X121.048 Y126.825 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49884
G1 F2872
G1 X120.975 Y126.729 E.00449
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.048 Y126.825 E-.76
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
G3 Z4.4 I-.024 J1.217 P1  F30000
G1 X127.813 Y126.956 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2788
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.495 Y127.185 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2788
G1 X127.736 Y127.535 E.01305
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.45 Y127.146 E.0112
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.535 E-.18359
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.002 E-.0923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.137 J-1.209 P1  F30000
G1 X117.858 Y130.129 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2788
G1 X117.706 Y129.994 E.00672
G1 X117.509 Y129.82 E.00875
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.037 Y127.672 E.0081
G1 X121.131 Y127.919 E.00875
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.905 Y130.165 E.01623
G1 X118.042 Y129.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2788
G1 X117.966 Y129.701 E.00312
G1 X117.805 Y129.558 E.00664
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.671 Y127.811 E.00604
G1 X120.747 Y128.013 E.00664
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X118.087 Y129.808 E.00108
M204 S10000
; WIPE_START
G1 F24000
G1 X117.966 Y129.701 E-.06134
G1 X117.805 Y129.558 E-.08214
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.42 Y128.041 E-.14614
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.057 J1.216 P1  F30000
G1 X132.133 Y128.729 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2788
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01764
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01765
G1 X136.215 Y127.139 E.01764
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01764
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2788
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
M73 P76 R2
G1 E-.04 F1800
G17
G3 Z4.6 I.02 J1.217 P1  F30000
G1 X142.372 Y126.682 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2788
G1 X142.658 Y127.097 E.01673
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01805
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.334 Y126.636 E.01736
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2788
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2788
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2788
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
G3 Z4.6 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2788
G2 X117.576 Y130.344 I2.596 J-1.363 E.03747
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.405 J-279.541 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539112
G1 F2788
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2788
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.062 J11.044 E.04611
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.096921
G1 F2788
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2788
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.19049
G1 F2788
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.18409
G1 F2788
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140505
G1 X133.054 Y130.261 E.00155
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295678
G1 F2788
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.141968
G1 F2788
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187015
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193549
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2788
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.18702
G1 F2788
G1 X141.222 Y130.719 E.00473
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.14197
G1 F2788
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969198
G1 X141.896 Y130.284 E.00088
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208901
G1 F2788
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243164
G1 X139.72 Y130.577 E.00344
; WIPE_START
G1 F24000
G1 X139.929 Y130.603 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.217 J-.016 P1  F30000
G1 X139.862 Y125.549 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.496501
G1 F2788
G1 X140.087 Y125.522 E.00839
; LINE_WIDTH: 0.470866
G1 X140.312 Y125.495 E.00792
; LINE_WIDTH: 0.472828
G3 X141.234 Y125.522 I.22 J8.098 E.0323
; LINE_WIDTH: 0.522136
G1 X141.459 Y125.549 E.00887
G1 X141.825 Y125.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2788
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.199 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2788
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F2788
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F2788
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
G1 X127.356 Y130.409 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969196
G1 F2788
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142591
G3 X127.031 Y130.632 I-1.033 J-1.33 E.00167
; LINE_WIDTH: 0.187432
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2788
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130584
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170308
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181163
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139041
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2788
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2788
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142114
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178253
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137587
G1 X117.935 Y130.437 E.00141
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z4.6 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P77 R2
G1 F2839
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.496 Y127.187 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2839
G1 X127.736 Y127.535 E.013
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.451 Y127.147 E.01126
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.535 E-.18297
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.004 E-.09292
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.137 J-1.209 P1  F30000
G1 X117.857 Y130.128 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2839
G1 X117.509 Y129.82 E.01544
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X120.06 Y130.273 E.00831
G1 X119.833 Y130.392 E.00853
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.905 Y130.165 E.01626
G1 X118.017 Y129.746 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2839
G1 X117.805 Y129.558 E.00871
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.215 Y127.153 E.00644
G1 X120.367 Y127.288 E.00624
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.878 Y129.926 E.00624
G1 X119.693 Y130.023 E.00644
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X118.062 Y129.785 E.00213
M204 S10000
; WIPE_START
G1 F24000
G1 X117.805 Y129.558 E-.1305
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.424 Y128.013 E-.15679
G1 X117.426 Y128.007 E-.00233
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.06 J1.216 P1  F30000
G1 X132.133 Y128.729 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2839
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01764
G1 X132.119 Y127.636 E.01764
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01765
G1 X136.215 Y127.139 E.01764
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01764
G1 X132.308 Y129.19 E.01765
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2839
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2839
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01805
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01805
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01805
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01804
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2839
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2839
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2839
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
G3 Z4.8 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2839
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.599 J-279.734 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2839
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2839
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.043 E.04611
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969195
G1 F2839
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171144
G3 X134.756 Y130.719 I-3.122 J-4.352 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2839
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.18409
G1 F2839
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140505
G1 X133.054 Y130.261 E.00155
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190492
G1 F2839
G1 X133.767 Y130.719 E.00553
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295676
G1 F2839
G1 X135.16 Y130.566 E.00611
M73 P78 R2
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.14197
G1 F2839
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187019
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193551
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208902
G1 F2839
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2839
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.14197
G1 F2839
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969198
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.18702
G1 F2839
G1 X141.222 Y130.719 E.00473
; WIPE_START
G1 F24000
G1 X141.567 Y130.511 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.215 J.066 P1  F30000
G1 X141.825 Y125.785 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2839
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.261 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2839
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441516
G1 F2839
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464492
G1 F2839
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.892 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26679
G1 X143.611 Y129.457 E-.23665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.066 J-.587 P1  F30000
G1 X141.459 Y125.549 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522136
G1 F2839
G1 X141.234 Y125.522 E.00886
; LINE_WIDTH: 0.472828
G2 X140.312 Y125.495 I-.701 J8.07 E.0323
; LINE_WIDTH: 0.470866
G1 X140.087 Y125.522 E.00792
; LINE_WIDTH: 0.4965
G1 X139.862 Y125.549 E.00839
; WIPE_START
G1 F24000
G1 X140.087 Y125.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.436 J-1.136 P1  F30000
G1 X127.356 Y130.409 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.0969198
G1 F2839
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142594
G3 X127.031 Y130.632 I-1.033 J-1.33 E.00167
; LINE_WIDTH: 0.187435
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.197912
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164248
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2839
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130584
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170309
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181165
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139043
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2839
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2839
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142113
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178234
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137577
G1 X117.935 Y130.437 E.0014
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z4.8 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.496 Y127.187 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X127.736 Y127.535 E.01299
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.451 Y127.147 E.01127
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.535 E-.18285
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.004 E-.09304
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.144 J-1.208 P1  F30000
G1 X117.927 Y130.176 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X117.889 Y130.156 E.00143
G1 X117.687 Y129.977 E.00897
G1 X117.509 Y129.82 E.00788
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.98 Y130.204 E.01342
G1 X117.991 Y129.723 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X117.947 Y129.684 E.00182
G1 X117.805 Y129.558 E.00583
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.225 Y127.162 E.00684
G1 X120.367 Y127.288 E.00583
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X118.036 Y129.763 E.00318
M204 S10000
; WIPE_START
G1 F24000
G1 X117.947 Y129.684 E-.04528
G1 X117.805 Y129.558 E-.07215
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.424 Y128.013 E-.15679
G1 X117.438 Y127.975 E-.01541
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.062 J1.215 P1  F30000
G1 X132.133 Y128.729 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01765
G1 X132.119 Y127.636 E.01764
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01765
G1 X136.215 Y127.139 E.01764
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01764
G1 X132.308 Y129.19 E.01765
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.02 J1.217 P1  F30000
G1 X142.372 Y126.682 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X142.658 Y127.097 E.01673
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.334 Y126.636 E.01736
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
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
G3 Z5 I-.102 J1.213 P1  F30000
G1 X116.867 Y129.451 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G2 X117.576 Y130.344 I2.522 J-1.274 E.03809
G1 X117.417 Y130.575 E.00929
G1 X117.223 Y130.575 E.00643
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.444 J-279.579 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2840
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.043 E.04611
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
M73 P79 R2
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969196
G1 F2840
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2840
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190491
G1 F2840
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.184091
G1 F2840
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140506
G1 X133.054 Y130.261 E.00155
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295678
G1 F2840
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.141969
G1 F2840
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187018
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193552
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208901
G1 F2840
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2840
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.14197
G1 F2840
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969198
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.18702
G1 F2840
G1 X141.222 Y130.719 E.00473
; WIPE_START
G1 F24000
G1 X141.567 Y130.511 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.215 J.066 P1  F30000
G1 X141.825 Y125.785 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2840
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.199 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2840
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F2840
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F2840
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26678
G1 X143.611 Y129.457 E-.23665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.066 J-.587 P1  F30000
G1 X141.459 Y125.549 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522136
G1 F2840
G1 X141.234 Y125.522 E.00887
; LINE_WIDTH: 0.472828
G2 X140.312 Y125.495 I-.701 J8.07 E.0323
; LINE_WIDTH: 0.470866
G1 X140.087 Y125.522 E.00792
; LINE_WIDTH: 0.496501
G1 X139.862 Y125.549 E.00839
; WIPE_START
G1 F24000
G1 X140.087 Y125.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.436 J-1.136 P1  F30000
G1 X127.356 Y130.409 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.0969196
G1 F2840
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142591
G3 X127.031 Y130.632 I-1.033 J-1.33 E.00167
; LINE_WIDTH: 0.187432
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130584
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170308
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181163
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139041
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2840
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142112
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.17823
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137575
G1 X117.935 Y130.437 E.0014
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z5 I.429 J1.139 P1  F30000
G1 X127.761 Y126.897 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2839
G1 X127.79 Y126.923 E.00131
G1 X128.086 Y127.351 E.01725
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.716 Y126.857 E.01394
G1 X127.496 Y127.187 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2839
G1 X127.598 Y127.335 E.00551
G1 X127.736 Y127.535 E.00746
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.437 Y128.534 E.00746
G1 X124.415 Y128.353 E.00558
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.452 Y127.147 E.01128
M204 S10000
; WIPE_START
G1 F24000
G1 X127.598 Y127.335 E-.0905
G1 X127.736 Y127.535 E-.0923
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.004 E-.09309
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.137 J-1.209 P1  F30000
G1 X117.856 Y130.127 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2839
G1 X117.509 Y129.82 E.01538
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.903 Y130.164 E.01632
G1 X117.965 Y129.7 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2839
G1 X117.805 Y129.558 E.00659
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X118.01 Y129.74 E.00424
M204 S10000
; WIPE_START
G1 F24000
G1 X117.805 Y129.558 E-.1043
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.424 Y128.013 E-.15679
G1 X117.451 Y127.943 E-.02854
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.065 J1.215 P1  F30000
G1 X132.133 Y128.729 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2839
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01764
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01764
G1 X132.308 Y129.19 E.01765
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2839
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
M73 P80 R2
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2839
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01804
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2839
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2839
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2839
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
G3 Z5.2 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2839
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.445 J-279.58 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2839
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2839
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.044 E.0461
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.096921
G1 F2839
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2839
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.18409
G1 F2839
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140505
G1 X133.054 Y130.261 E.00155
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190492
G1 F2839
G1 X133.767 Y130.719 E.00553
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295678
G1 F2839
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.14197
G1 F2839
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187019
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193551
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208902
G1 F2839
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2839
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.14197
G1 F2839
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969198
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.18702
G1 F2839
G1 X141.222 Y130.719 E.00473
; WIPE_START
G1 F24000
G1 X141.567 Y130.511 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.215 J.066 P1  F30000
G1 X141.825 Y125.785 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2839
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.199 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2839
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F2839
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F2839
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26678
G1 X143.611 Y129.457 E-.23665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.066 J-.587 P1  F30000
G1 X141.459 Y125.549 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522136
G1 F2839
G1 X141.234 Y125.522 E.00886
; LINE_WIDTH: 0.472828
G2 X140.312 Y125.495 I-.701 J8.07 E.0323
; LINE_WIDTH: 0.470866
G1 X140.087 Y125.522 E.00792
; LINE_WIDTH: 0.496501
G1 X139.862 Y125.549 E.00839
; WIPE_START
G1 F24000
G1 X140.087 Y125.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.436 J-1.136 P1  F30000
G1 X127.356 Y130.409 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.0969195
G1 F2839
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142591
G3 X127.031 Y130.632 I-1.032 J-1.329 E.00167
; LINE_WIDTH: 0.187431
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
M73 P81 R2
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2839
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130584
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170308
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181163
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139041
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2839
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2839
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142113
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178236
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137578
G1 X117.935 Y130.437 E.00141
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z5.2 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01724
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.496 Y127.188 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X127.59 Y127.324 E.00509
G1 X127.736 Y127.535 E.00788
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.452 Y127.147 E.01129
M204 S10000
; WIPE_START
G1 F24000
G1 X127.59 Y127.324 E-.08522
G1 X127.736 Y127.535 E-.09747
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.004 E-.0932
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.144 J-1.208 P1  F30000
G1 X117.929 Y130.177 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X117.889 Y130.156 E.00149
G1 X117.667 Y129.96 E.00984
G1 X117.509 Y129.82 E.00701
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.982 Y130.205 E.01337
G1 X117.939 Y129.677 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X117.805 Y129.558 E.00553
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.482 Y127.86 E.00503
G1 X117.57 Y127.627 E.00765
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X117.984 Y129.717 E.00531
M204 S10000
; WIPE_START
G1 F24000
G1 X117.805 Y129.558 E-.09115
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.424 Y128.013 E-.15679
G1 X117.463 Y127.911 E-.04169
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.068 J1.215 P1  F30000
G1 X132.133 Y128.729 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01764
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01764
G1 X132.308 Y129.19 E.01765
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X142.154 Y127.058 E.00545
G1 X142.309 Y127.281 E.00834
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.154 Y127.058 E-.08971
G1 X142.309 Y127.281 E-.10313
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05557
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
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
G3 Z5.4 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G2 X117.576 Y130.344 I2.475 J-1.265 E.0375
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06004
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.442 J-279.578 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2840
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.044 E.0461
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969196
G1 F2840
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2840
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
M73 P82 R2
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190492
G1 F2840
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.18409
G1 F2840
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140505
G1 X133.054 Y130.261 E.00155
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295678
G1 F2840
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.141969
G1 F2840
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187018
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193552
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208901
G1 F2840
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2840
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.14197
G1 F2840
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969198
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.18702
G1 F2840
G1 X141.222 Y130.719 E.00473
; WIPE_START
G1 F24000
G1 X141.567 Y130.511 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.215 J.066 P1  F30000
G1 X141.825 Y125.785 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2840
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.199 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541023
G1 F2840
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F2840
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F2840
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26678
G1 X143.611 Y129.457 E-.23665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.066 J-.587 P1  F30000
G1 X141.459 Y125.549 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522136
G1 F2840
G1 X141.234 Y125.522 E.00887
; LINE_WIDTH: 0.472828
G2 X140.312 Y125.495 I-.701 J8.07 E.0323
; LINE_WIDTH: 0.470866
G1 X140.087 Y125.522 E.00792
; LINE_WIDTH: 0.496501
G1 X139.862 Y125.549 E.00839
; WIPE_START
G1 F24000
G1 X140.087 Y125.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.436 J-1.136 P1  F30000
G1 X127.356 Y130.409 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.096921
G1 F2840
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142593
G3 X127.031 Y130.632 I-1.032 J-1.33 E.00167
; LINE_WIDTH: 0.187434
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130584
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170308
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181161
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139041
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.0969211
G1 F2840
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141112
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180244
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138582
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142113
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178235
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137578
G1 X117.935 Y130.437 E.0014
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z5.4 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.496 Y127.188 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X127.583 Y127.313 E.00466
G1 X127.736 Y127.535 E.0083
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.452 Y127.148 E.0113
M204 S10000
; WIPE_START
G1 F24000
G1 X127.583 Y127.313 E-.07994
G1 X127.736 Y127.535 E-.10263
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.8 Y129.005 E-.09331
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.144 J-1.208 P1  F30000
G1 X117.93 Y130.178 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X117.889 Y130.156 E.00152
G1 X117.509 Y129.82 E.01685
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.983 Y130.205 E.01334
G1 X117.913 Y129.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X117.805 Y129.558 E.00447
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X117.958 Y129.694 E.00637
M204 S10000
; WIPE_START
G1 F24000
G1 X117.805 Y129.558 E-.07802
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.424 Y128.013 E-.15679
G1 X117.475 Y127.878 E-.05482
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.071 J1.215 P1  F30000
G1 X132.133 Y128.729 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01765
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01764
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01764
G1 X132.308 Y129.19 E.01765
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01805
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
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
G3 Z5.6 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.405 J-279.541 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2840
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.044 E.0461
M73 P83 R2
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969195
G1 F2840
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171144
G3 X134.756 Y130.719 I-3.122 J-4.352 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2840
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190492
G1 F2840
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.18409
G1 F2840
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140505
G1 X133.054 Y130.261 E.00155
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295676
G1 F2840
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.141969
G1 F2840
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187018
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193552
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208901
G1 F2840
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243164
G1 X139.72 Y130.577 E.00344
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
M73 P83 R1
G1 F2840
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.14197
G1 F2840
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969198
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.18702
G1 F2840
G1 X141.222 Y130.719 E.00473
; WIPE_START
G1 F24000
G1 X141.567 Y130.511 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.215 J.066 P1  F30000
G1 X141.825 Y125.785 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2840
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.199 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2840
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F2840
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F2840
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26678
G1 X143.611 Y129.457 E-.23665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.066 J-.587 P1  F30000
G1 X141.459 Y125.549 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522136
G1 F2840
G1 X141.234 Y125.522 E.00887
; LINE_WIDTH: 0.472828
G2 X140.312 Y125.495 I-.701 J8.07 E.0323
; LINE_WIDTH: 0.470866
G1 X140.087 Y125.522 E.00792
; LINE_WIDTH: 0.496501
G1 X139.862 Y125.549 E.00839
; WIPE_START
G1 F24000
G1 X140.087 Y125.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.436 J-1.136 P1  F30000
G1 X127.356 Y130.409 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.0969196
G1 F2840
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142591
G3 X127.031 Y130.632 I-1.033 J-1.33 E.00167
; LINE_WIDTH: 0.187432
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130583
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170307
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.18116
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.13904
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2840
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142112
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178235
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137577
G1 X117.935 Y130.437 E.00141
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z5.6 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2790
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01724
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.497 Y127.188 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2790
G1 X127.736 Y127.535 E.01295
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.452 Y127.148 E.01131
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.535 E-.18236
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.799 Y129.005 E-.09353
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.136 J-1.209 P1  F30000
G1 X117.854 Y130.125 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2790
G1 X117.647 Y129.942 E.00917
G1 X117.509 Y129.82 E.00613
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.175 Y126.539 E.01071
G1 X118.339 Y126.453 E.00613
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.901 Y130.163 E.0164
G1 X117.888 Y129.631 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2790
G1 X117.805 Y129.558 E.00341
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.357 Y126.886 E.00846
G1 X118.479 Y126.822 E.00422
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
M73 P84 R1
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X117.933 Y129.671 E.00743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.805 Y129.558 E-.06495
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.424 Y128.013 E-.15679
G1 X117.487 Y127.846 E-.06789
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.073 J1.215 P1  F30000
G1 X132.133 Y128.729 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2790
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01764
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01764
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01764
G1 X132.308 Y129.19 E.01765
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2790
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2790
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01805
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2790
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2790
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2790
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
G3 Z5.8 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2790
G2 X117.576 Y130.344 I2.414 J-1.217 E.03752
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.486 J-279.622 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2790
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2790
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.044 E.0461
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.096921
G1 F2790
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F2790
G3 X133.951 Y130.638 I-.741 J-7.249 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190492
G1 F2790
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.18409
G1 F2790
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140505
G1 X133.054 Y130.261 E.00155
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295676
G1 F2790
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.141969
G1 F2790
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187018
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193552
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2790
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243165
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.141969
G1 F2790
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969197
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.187017
G1 F2790
G1 X141.222 Y130.719 E.00473
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208901
G1 F2790
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
; WIPE_START
G1 F24000
G1 X139.929 Y130.603 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P85 R1
G3 Z5.8 I1.217 J-.016 P1  F30000
G1 X139.862 Y125.549 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.496501
G1 F2790
G1 X140.087 Y125.522 E.00839
; LINE_WIDTH: 0.470866
G1 X140.312 Y125.495 E.00792
; LINE_WIDTH: 0.472828
G3 X141.234 Y125.522 I.22 J8.098 E.0323
; LINE_WIDTH: 0.522136
G1 X141.459 Y125.549 E.00887
G1 X141.825 Y125.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2790
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.302 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2790
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F2790
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F2790
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
G1 X127.356 Y130.409 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969199
G1 F2790
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142593
G3 X127.031 Y130.632 I-1.032 J-1.33 E.00167
; LINE_WIDTH: 0.187435
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2790
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130584
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170308
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181161
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139041
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.096921
G1 F2790
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2790
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142112
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178238
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137579
G1 X117.935 Y130.437 E.00141
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z5.8 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.497 Y127.188 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X127.567 Y127.29 E.0038
G1 X127.736 Y127.535 E.00913
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.453 Y127.148 E.01132
M204 S10000
; WIPE_START
G1 F24000
G1 X127.567 Y127.29 E-.0694
G1 X127.736 Y127.535 E-.11296
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.799 Y129.005 E-.09353
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.136 J-1.209 P1  F30000
G1 X117.854 Y130.125 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X117.509 Y129.82 E.01528
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X120.13 Y130.236 E.0057
G1 X119.833 Y130.392 E.01115
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.9 Y130.162 E.01643
G1 X117.862 Y129.609 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X117.805 Y129.558 E.00236
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.948 Y129.889 E.00381
G1 X119.693 Y130.023 E.00886
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X117.907 Y129.648 E.00848
M204 S10000
; WIPE_START
G1 F24000
G1 X117.805 Y129.558 E-.05197
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.424 Y128.013 E-.15679
G1 X117.499 Y127.814 E-.08087
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.076 J1.215 P1  F30000
G1 X132.133 Y128.729 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01764
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01764
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01764
G1 X132.308 Y129.19 E.01765
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.549 Y127.609 E.00402
G1 X132.657 Y127.323 E.0094
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.549 Y127.609 E-.04966
G1 X132.657 Y127.323 E-.11629
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01805
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2840
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2840
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
G3 Z6 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X119.749 Y125.425 E.08382
G1 X124.209 Y129.885 E.2092
G2 X124.638 Y130.316 I1.089 J-.655 E.02038
G1 X124.484 Y130.539 E.009
G1 X124.529 Y130.575 E.00191
G1 X120.736 Y130.575 E.12584
G1 X120.596 Y130.344 E.00895
G2 X121.493 Y128.831 I-1.291 J-1.789 E.06005
G1 X124.899 Y125.425 E.15974
G1 X127.425 Y125.425 E.08382
G1 X132.575 Y130.575 E.24156
G1 X127.814 Y130.575 E.15792
G1 X127.868 Y130.538 E.00216
G1 X127.715 Y130.316 E.00893
G2 X132.575 Y125.425 I-276.448 J-279.584 E.22871
G1 X133.241 Y125.425 E.0221
G1 X133.287 Y125.809 E.0128
G2 X132.782 Y126.083 I.305 J1.162 E.01927
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F2840
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X136.748 Y125.425 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2840
G1 X135.282 Y125.425 E.04863
G1 X135.262 Y125.586 E.00538
G3 X136.245 Y126.569 I-10.061 J11.044 E.0461
G1 X138.085 Y128.409 E.08632
G3 X138.125 Y127.551 I1.761 J-.347 E.02878
G1 X136.65 Y129.026 E.06922
G3 X135.828 Y130.168 I-2.444 J-.892 E.04724
G1 X135.941 Y130.331 E.00658
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969196
G1 F2840
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171145
G3 X134.756 Y130.719 I-3.122 J-4.351 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
M73 P86 R1
G1 F2840
G3 X133.951 Y130.638 I-.741 J-7.248 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190492
G1 F2840
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.18409
G1 F2840
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140505
G1 X133.054 Y130.261 E.00155
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295678
G1 F2840
G1 X135.16 Y130.566 E.00611
G1 X139.424 Y130.284 F30000
; LINE_WIDTH: 0.14197
G1 F2840
G1 X139.589 Y130.398 E.00162
; LINE_WIDTH: 0.187019
G1 X139.754 Y130.511 E.00235
; LINE_WIDTH: 0.193551
G1 X140.099 Y130.719 E.00494
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.208902
G1 F2840
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X140.138 Y130.628 F30000
; LINE_WIDTH: 0.174638
G1 F2840
G1 X140.348 Y130.653 E.00226
; LINE_WIDTH: 0.181889
G2 X140.957 Y130.654 I.312 J-5.016 E.0069
G2 X141.182 Y130.628 I-.106 J-1.881 E.00257
; LINE_WIDTH: 0.243164
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277426
G1 X141.601 Y130.577 E.00403
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.141968
G1 F2840
G1 X141.732 Y130.398 E.00162
; LINE_WIDTH: 0.0969196
G1 X141.896 Y130.284 E.00088
G1 X141.567 Y130.511 F30000
; LINE_WIDTH: 0.187016
G1 F2840
G1 X141.222 Y130.719 E.00473
; WIPE_START
G1 F24000
G1 X141.567 Y130.511 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.215 J.066 P1  F30000
G1 X141.825 Y125.785 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2840
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.241 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F2840
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F2840
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F2840
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
; WIPE_START
G1 F24000
G1 X143.393 Y129.5 E-.25656
G1 X143.618 Y128.835 E-.26678
G1 X143.611 Y129.457 E-.23665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.066 J-.587 P1  F30000
G1 X141.459 Y125.549 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.522136
G1 F2840
G1 X141.234 Y125.522 E.00887
; LINE_WIDTH: 0.472828
G2 X140.312 Y125.495 I-.701 J8.07 E.0323
; LINE_WIDTH: 0.470866
G1 X140.087 Y125.522 E.00792
; LINE_WIDTH: 0.496501
G1 X139.862 Y125.549 E.00839
; WIPE_START
G1 F24000
G1 X140.087 Y125.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.436 J-1.136 P1  F30000
G1 X127.356 Y130.409 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.0969211
G1 F2840
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142593
G3 X127.031 Y130.632 I-1.032 J-1.329 E.00167
; LINE_WIDTH: 0.187433
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130584
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170308
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181163
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139041
G1 X124.997 Y130.409 E.00147
G1 X120.237 Y130.437 F30000
; LINE_WIDTH: 0.0969196
G1 F2840
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F2840
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142113
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178236
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137578
G1 X117.935 Y130.437 E.00141
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.085 Y130.54 E-.76
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
G3 Z6 I.421 J1.142 P1  F30000
G1 X127.813 Y126.956 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3030
G1 X127.882 Y127.056 E.00404
G1 X128.086 Y127.351 E.01189
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01724
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.497 Y127.189 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3030
G1 X127.559 Y127.279 E.00338
G1 X127.736 Y127.535 E.00955
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.453 Y127.148 E.01133
M204 S10000
; WIPE_START
G1 F24000
G1 X127.559 Y127.279 E-.06414
G1 X127.736 Y127.535 E-.11812
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.799 Y129.005 E-.09363
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.136 J-1.209 P1  F30000
G1 X117.854 Y130.125 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3030
G1 X117.509 Y129.82 E.01528
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.544 Y126.921 E.01159
G1 X120.662 Y127.026 E.00526
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X120.142 Y130.23 E.00526
G1 X119.833 Y130.392 E.01159
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.901 Y130.162 E.01642
G1 X117.837 Y129.586 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3030
G1 X117.805 Y129.558 E.00132
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.284 Y127.214 E.00927
G1 X120.367 Y127.288 E.00341
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.96 Y129.883 E.00341
G1 X119.693 Y130.023 E.00927
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X117.882 Y129.626 E.00952
M204 S10000
; WIPE_START
G1 F24000
G1 X117.805 Y129.558 E-.03911
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.424 Y128.013 E-.15679
G1 X117.511 Y127.782 E-.09373
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.079 J1.214 P1  F30000
G1 X132.133 Y128.729 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3030
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01765
G1 X132.119 Y127.636 E.01764
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01764
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01764
G1 X132.308 Y129.19 E.01765
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3030
G1 X132.464 Y128.28 E.00983
G1 X132.45 Y128.164 E.00358
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.464 Y128.28 E-.14386
G1 X132.45 Y128.164 E-.04433
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07395
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3030
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01805
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01805
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3030
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3030
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3030
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
G3 Z6.2 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3030
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X118.851 Y125.425 E.05401
; WIPE_START
G1 F24000
G1 X117.223 Y125.425 E-.61876
G1 X116.96 Y125.688 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.192 J.245 P1  F30000
G1 X117.935 Y130.437 Z6.2
M73 P87 R1
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F3030
G1 X118.085 Y130.54 E.0014
; LINE_WIDTH: 0.178234
G1 X118.235 Y130.644 E.00201
; LINE_WIDTH: 0.142113
G1 X118.435 Y130.673 E.00163
; LINE_WIDTH: 0.0969204
G1 X118.619 Y130.696 E.00082
G1 X119.552 Y130.696 F30000
; LINE_WIDTH: 0.138581
G1 F3030
G1 X119.737 Y130.673 E.00145
; LINE_WIDTH: 0.180242
G1 X119.922 Y130.651 E.00208
; LINE_WIDTH: 0.141111
G1 X120.087 Y130.54 E.00159
; LINE_WIDTH: 0.0969209
G1 X120.237 Y130.437 E.0008
G1 X124.285 Y126.711 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3030
G2 X123.947 Y129.496 I2.052 J1.662 E.09809
G1 X124.357 Y130.575 E.03828
G1 X120.879 Y130.575 E.11537
G1 X121.288 Y129.496 E.03828
G2 X121.122 Y127.078 I-2.224 J-1.062 E.08402
G1 X119.981 Y125.425 E.06663
G1 X125.173 Y125.425 E.17223
G1 X124.32 Y126.662 E.04983
G1 X123.139 Y125.832 F30000
G1 F3030
G1 X124.397 Y125.832 E.04174
G1 X124.187 Y126.137 E.01227
G1 X121.947 Y128.377 E.10507
G1 X121.901 Y127.991 E.01288
G2 X121.753 Y127.429 I-1.214 J.018 E.01946
G1 X123.339 Y129.015 E.0744
G2 X123.567 Y129.64 I1.381 J-.149 E.02227
G1 X123.767 Y130.168 E.01872
G1 X123.369 Y130.168 E.01321
G1 X124.997 Y130.409 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.139041
G1 F3030
G1 X125.152 Y130.516 E.00147
; LINE_WIDTH: 0.181161
G1 X125.307 Y130.623 E.00212
; LINE_WIDTH: 0.170308
G2 X125.488 Y130.66 I.138 J-.213 E.00197
; LINE_WIDTH: 0.130583
G1 X125.636 Y130.678 E.00106
; LINE_WIDTH: 0.0969204
G1 X125.784 Y130.696 E.00065
G1 X126.569 Y130.696 F30000
; LINE_WIDTH: 0.130584
G1 F3030
G1 X126.716 Y130.678 E.00106
; LINE_WIDTH: 0.164247
G1 X126.864 Y130.66 E.00147
; LINE_WIDTH: 0.19791
G1 X127.012 Y130.642 E.00188
; LINE_WIDTH: 0.18743
G1 X127.031 Y130.632 E.00026
; LINE_WIDTH: 0.142592
G2 X127.201 Y130.516 I-.863 J-1.446 E.00167
; LINE_WIDTH: 0.0969211
G1 X127.356 Y130.409 E.00083
G1 X128.951 Y130.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3030
G1 X128.586 Y130.168 E.01212
G2 X129.017 Y128.983 I-13.411 J-5.556 E.04184
G1 X132.168 Y125.832 E.14779
G1 X127.955 Y125.832 E.13973
G1 X128.229 Y126.229 E.01597
G1 X131.689 Y129.689 E.16234
G1 X131.871 Y130.168 E.01697
G1 X130.754 Y130.168 E.03704
G1 X133.054 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.140506
G1 F3030
G1 X133.214 Y130.371 E.00155
; LINE_WIDTH: 0.184091
G1 X133.373 Y130.482 E.00224
; LINE_WIDTH: 0.190491
G1 X133.767 Y130.719 E.00553
G1 X133.362 Y130.566 F30000
; LINE_WIDTH: 0.250996
G1 F3030
G1 X133.657 Y130.602 E.00503
; LINE_WIDTH: 0.206314
G1 X133.951 Y130.638 E.00395
; LINE_WIDTH: 0.219208
G2 X134.866 Y130.602 I.174 J-7.284 E.01316
; LINE_WIDTH: 0.295676
G1 X135.16 Y130.566 E.00611
G1 X134.756 Y130.719 F30000
; LINE_WIDTH: 0.171144
G1 F3030
G2 X135.309 Y130.371 I-2.568 J-4.7 E.00684
; LINE_WIDTH: 0.0969195
G1 X135.469 Y130.261 E.00085
G1 X136.65 Y129.026 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3030
G1 X136.808 Y128.868 E.00743
G1 X137.557 Y127.881 F30000
G1 F3030
G1 X137.15 Y127.474 E.01909
G1 X138.695 Y126.437 F30000
G1 F3030
G2 X138.137 Y127.499 I1.875 J1.661 E.04016
G1 X137.431 Y129.362 E.06611
G1 X136.657 Y127.322 E.07239
G2 X136.308 Y126.661 I-1.515 J.377 E.02502
G1 X135.456 Y125.425 E.0498
G1 X139.393 Y125.425 E.13062
G1 X138.729 Y126.388 E.0388
G1 X139.862 Y125.549 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.496501
G1 F3030
G1 X140.087 Y125.522 E.00839
; LINE_WIDTH: 0.470866
G1 X140.312 Y125.495 E.00792
; LINE_WIDTH: 0.472828
G3 X141.234 Y125.522 I.22 J8.098 E.0323
; LINE_WIDTH: 0.522136
G1 X141.459 Y125.549 E.00887
G1 X141.825 Y125.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3030
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.302 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F3030
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F3030
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F3030
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
G1 X141.896 Y130.284 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969197
G1 F3030
G1 X141.732 Y130.398 E.00088
; LINE_WIDTH: 0.141969
G1 X141.567 Y130.511 E.00162
; LINE_WIDTH: 0.187017
G1 X141.222 Y130.719 E.00473
G1 X141.601 Y130.577 F30000
; LINE_WIDTH: 0.277428
G1 F3030
G1 X141.392 Y130.603 E.00403
; LINE_WIDTH: 0.243165
G1 X141.182 Y130.628 E.00344
; LINE_WIDTH: 0.181889
G3 X140.957 Y130.654 I-.331 J-1.855 E.00257
G3 X140.348 Y130.653 I-.297 J-5.017 E.0069
; LINE_WIDTH: 0.174638
G1 X140.138 Y130.628 E.00226
; LINE_WIDTH: 0.208901
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X140.099 Y130.719 F30000
; LINE_WIDTH: 0.193552
G1 F3030
G1 X139.754 Y130.511 E.00494
; LINE_WIDTH: 0.187018
G1 X139.589 Y130.398 E.00235
; LINE_WIDTH: 0.141969
G1 X139.424 Y130.284 E.00162
G1 X134.914 Y125.566 F30000
; LINE_WIDTH: 0.539113
G1 F3030
G2 X133.609 Y125.566 I-.653 J5.259 E.05291
G1 X132.367 Y126.44 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3030
G1 X133.067 Y125.425 E.04088
G1 X127.18 Y125.425 E.19531
G1 X128.067 Y126.711 E.05182
G3 X128.533 Y129.159 I-1.98 J1.645 E.08629
G1 X127.996 Y130.575 E.05022
G1 X132.46 Y130.575 E.1481
G1 X131.778 Y128.776 E.0638
G3 X132.333 Y126.489 I2.634 J-.572 E.0808
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.997 Y126.976 E-.22487
G1 X131.778 Y127.552 E-.23427
G1 X131.704 Y128.164 E-.23427
G1 X131.725 Y128.338 E-.06658
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
G3 Z6.2 I.405 J-1.147 P1  F30000
G1 X127.813 Y126.956 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3027
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.038 Y128.5 E.01234
G1 X124.02 Y128.353 E.0049
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.281 Y126.406 E.01234
G1 X125.412 Y126.337 E.0049
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.497 Y127.189 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3027
G1 X127.552 Y127.268 E.00295
G1 X127.736 Y127.535 E.00997
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.427 Y128.453 E.00997
G1 X124.415 Y128.353 E.00308
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.463 Y126.753 E.00997
G1 X125.552 Y126.706 E.00308
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.453 Y127.148 E.01134
M204 S10000
; WIPE_START
G1 F24000
G1 X127.552 Y127.268 E-.05888
G1 X127.736 Y127.535 E-.12328
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.799 Y129.006 E-.09372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.144 J-1.208 P1  F30000
G1 X117.93 Y130.178 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P88 R1
G1 F3027
G1 X117.889 Y130.156 E.00153
G1 X117.618 Y129.916 E.01202
G1 X117.509 Y129.82 E.00482
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X120.154 Y130.224 E.00482
G1 X119.833 Y130.392 E.01202
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.983 Y130.206 E.01332
G1 X117.812 Y129.564 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3027
G1 X117.805 Y129.558 E.00029
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.971 Y129.877 E.00301
G1 X119.693 Y130.023 E.00967
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X117.878 Y129.623 E.00967
G1 X117.857 Y129.604 E.00087
M204 S10000
; WIPE_START
G1 F24000
G1 X117.805 Y129.558 E-.02642
G1 X117.57 Y129.218 E-.15679
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.424 Y128.013 E-.15679
G1 X117.523 Y127.751 E-.10642
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.081 J1.214 P1  F30000
G1 X132.133 Y128.729 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3027
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01764
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01764
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01764
G1 X132.308 Y129.19 E.01765
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3027
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.804 Y126.446 E.01027
G1 X134.904 Y126.471 E.00315
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3027
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01804
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3027
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3027
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3027
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
G3 Z6.4 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3027
G2 X117.576 Y130.344 I3.579 J-2.151 E.03736
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X118.851 Y125.425 E.05401
; WIPE_START
G1 F24000
G1 X117.223 Y125.425 E-.61876
G1 X116.96 Y125.688 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.192 J.245 P1  F30000
G1 X117.935 Y130.437 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F3027
G1 X118.085 Y130.54 E.0014
; LINE_WIDTH: 0.178233
G1 X118.235 Y130.644 E.00201
; LINE_WIDTH: 0.142113
G1 X118.435 Y130.673 E.00163
; LINE_WIDTH: 0.0969204
G1 X118.619 Y130.696 E.00082
G1 X119.552 Y130.696 F30000
; LINE_WIDTH: 0.138581
G1 F3027
G1 X119.737 Y130.673 E.00145
; LINE_WIDTH: 0.180242
G1 X119.922 Y130.651 E.00208
; LINE_WIDTH: 0.141112
G1 X120.087 Y130.54 E.00159
; LINE_WIDTH: 0.096921
G1 X120.237 Y130.437 E.0008
G1 X123.956 Y127.188 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3027
G2 X123.947 Y129.496 I2.295 J1.162 E.07937
G1 X124.357 Y130.575 E.03828
G1 X120.879 Y130.575 E.11537
G1 X121.289 Y129.491 E.03844
G2 X120.939 Y126.814 I-2.276 J-1.064 E.09457
G1 X119.981 Y125.425 E.05595
G1 X125.173 Y125.425 E.17223
G1 X123.99 Y127.139 E.06907
G1 X123.139 Y125.832 F30000
G1 F3027
G1 X124.397 Y125.832 E.04174
G1 X124.187 Y126.137 E.01227
G1 X121.947 Y128.377 E.10507
G1 X121.888 Y127.891 E.01623
G2 X121.753 Y127.429 I-1.005 J.044 E.01611
G1 X123.339 Y129.015 E.0744
G2 X123.567 Y129.64 I1.381 J-.149 E.02227
G1 X123.767 Y130.168 E.01872
G1 X123.369 Y130.168 E.01321
G1 X124.997 Y130.409 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.139041
G1 F3027
G1 X125.152 Y130.516 E.00147
; LINE_WIDTH: 0.181162
G1 X125.307 Y130.623 E.00212
; LINE_WIDTH: 0.170308
G2 X125.488 Y130.66 I.138 J-.213 E.00197
; LINE_WIDTH: 0.130583
G1 X125.636 Y130.678 E.00106
; LINE_WIDTH: 0.0969204
G1 X125.784 Y130.696 E.00065
G1 X126.569 Y130.696 F30000
; LINE_WIDTH: 0.130584
G1 F3027
G1 X126.716 Y130.678 E.00106
; LINE_WIDTH: 0.164247
G1 X126.864 Y130.66 E.00147
; LINE_WIDTH: 0.19791
G1 X127.012 Y130.642 E.00188
; LINE_WIDTH: 0.187432
G1 X127.031 Y130.632 E.00026
; LINE_WIDTH: 0.142592
G2 X127.201 Y130.516 I-.863 J-1.446 E.00167
; LINE_WIDTH: 0.096921
G1 X127.356 Y130.409 E.00083
G1 X128.951 Y130.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3027
G1 X128.586 Y130.168 E.01212
G2 X129.017 Y128.983 I-10.247 J-4.404 E.04185
G1 X132.168 Y125.832 E.14779
G1 X127.955 Y125.832 E.13973
G1 X128.229 Y126.229 E.01597
G1 X131.689 Y129.689 E.16234
G1 X131.871 Y130.168 E.01697
G1 X130.754 Y130.168 E.03704
G1 X133.054 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.140505
G1 F3027
G1 X133.214 Y130.371 E.00155
; LINE_WIDTH: 0.18409
G1 X133.373 Y130.482 E.00224
; LINE_WIDTH: 0.190492
G1 X133.767 Y130.719 E.00553
G1 X133.362 Y130.566 F30000
; LINE_WIDTH: 0.250996
G1 F3027
G1 X133.657 Y130.602 E.00503
; LINE_WIDTH: 0.206314
G1 X133.951 Y130.638 E.00395
; LINE_WIDTH: 0.219208
G2 X134.866 Y130.602 I.174 J-7.284 E.01316
; LINE_WIDTH: 0.295676
G1 X135.16 Y130.566 E.00611
G1 X134.756 Y130.719 F30000
; LINE_WIDTH: 0.171145
G1 F3027
G2 X135.309 Y130.371 I-2.568 J-4.699 E.00684
; LINE_WIDTH: 0.0969209
G1 X135.469 Y130.261 E.00085
G1 X136.65 Y129.026 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3027
G1 X136.808 Y128.868 E.00743
G1 X137.557 Y127.881 F30000
G1 F3027
G1 X137.15 Y127.474 E.01909
G1 X138.695 Y126.437 F30000
G1 F3027
G2 X138.137 Y127.499 I1.875 J1.661 E.04016
G1 X137.431 Y129.362 E.06611
G1 X136.526 Y126.976 E.08466
G1 X135.456 Y125.425 E.0625
G1 X139.393 Y125.425 E.13062
G1 X138.729 Y126.388 E.0388
G1 X139.862 Y125.549 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.496501
G1 F3027
G1 X140.087 Y125.522 E.00839
; LINE_WIDTH: 0.470866
G1 X140.312 Y125.495 E.00792
; LINE_WIDTH: 0.472828
G3 X141.234 Y125.522 I.22 J8.098 E.0323
; LINE_WIDTH: 0.522136
G1 X141.459 Y125.549 E.00887
G1 X141.825 Y125.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3027
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
M73 P89 R1
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.114 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F3027
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F3027
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F3027
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
G1 X141.896 Y130.284 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969197
G1 F3027
G1 X141.732 Y130.398 E.00088
; LINE_WIDTH: 0.141971
G1 X141.567 Y130.511 E.00162
; LINE_WIDTH: 0.187022
G1 X141.222 Y130.719 E.00473
G1 X141.601 Y130.577 F30000
; LINE_WIDTH: 0.277428
G1 F3027
G1 X141.392 Y130.603 E.00403
; LINE_WIDTH: 0.243165
G1 X141.182 Y130.628 E.00344
; LINE_WIDTH: 0.181889
G3 X140.957 Y130.654 I-.331 J-1.855 E.00257
G3 X140.348 Y130.653 I-.297 J-5.017 E.0069
; LINE_WIDTH: 0.174638
G1 X140.138 Y130.628 E.00226
; LINE_WIDTH: 0.208901
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X140.099 Y130.719 F30000
; LINE_WIDTH: 0.193552
G1 F3027
G1 X139.754 Y130.511 E.00494
; LINE_WIDTH: 0.187018
G1 X139.589 Y130.398 E.00235
; LINE_WIDTH: 0.141969
G1 X139.424 Y130.284 E.00162
G1 X134.914 Y125.566 F30000
; LINE_WIDTH: 0.539113
G1 F3027
G2 X133.609 Y125.566 I-.653 J5.259 E.05291
G1 X132.256 Y126.601 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3027
G1 X133.067 Y125.425 E.04737
G1 X127.18 Y125.425 E.19531
G1 X128.207 Y126.914 E.06
G3 X128.468 Y129.33 I-2.039 J1.442 E.08418
G1 X127.996 Y130.575 E.04417
G1 X132.46 Y130.575 E.1481
G1 X131.778 Y128.776 E.0638
G3 X132.222 Y126.65 I2.604 J-.566 E.07422
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.997 Y126.976 E-.15052
G1 X131.778 Y127.552 E-.23427
G1 X131.704 Y128.164 E-.23426
G1 X131.749 Y128.533 E-.14095
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
G3 Z6.4 I.453 J-1.13 P1  F30000
G1 X127.813 Y126.956 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3028
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.811 Y126.305 E.01279
G1 X126.941 Y126.337 E.00445
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.497 Y127.189 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3028
G1 X127.544 Y127.257 E.00252
G1 X127.736 Y127.535 E.01039
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.666 Y127.464 E.00266
G1 X124.858 Y127.185 E.01039
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.453 Y127.149 E.01134
M204 S10000
; WIPE_START
G1 F24000
G1 X127.544 Y127.257 E-.05363
G1 X127.736 Y127.535 E-.12845
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.799 Y129.006 E-.09381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.136 J-1.209 P1  F30000
G1 X117.855 Y130.126 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3028
G1 X117.608 Y129.907 E.01095
G1 X117.509 Y129.82 E.00439
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.087 Y127.795 E.00439
G1 X117.22 Y127.444 E.01246
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.951 Y129.402 E.01685
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.902 Y130.163 E.01636
G1 X117.805 Y129.558 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3028
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.454 Y127.934 E.0026
G1 X117.57 Y127.627 E.01008
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.631 Y129.139 E.01008
G1 X120.601 Y129.218 E.0026
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X117.849 Y129.597 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X117.57 Y129.218 E-.17901
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.424 Y128.013 E-.15679
G1 X117.454 Y127.934 E-.03217
G1 X117.527 Y127.741 E-.07844
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.082 J1.214 P1  F30000
G1 X132.133 Y128.729 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3028
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01764
G1 X132.119 Y127.636 E.01764
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01765
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01764
G1 X136.42 Y127.772 E.00452
G1 X136.468 Y128.164 E.01313
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01764
G1 X132.308 Y129.19 E.01765
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3028
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.02 J1.217 P1  F30000
G1 X142.372 Y126.682 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3028
G1 X142.658 Y127.097 E.01673
G1 X142.851 Y127.606 E.01804
G1 X142.868 Y127.743 E.00458
G1 X142.917 Y128.146 E.01346
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01804
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01805
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.334 Y126.636 E.01736
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3028
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3028
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3028
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
G3 Z6.6 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3028
G2 X117.576 Y130.344 I3.474 J-2.067 E.03736
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X118.851 Y125.425 E.05401
; WIPE_START
G1 F24000
G1 X117.223 Y125.425 E-.61876
G1 X116.96 Y125.688 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.192 J.245 P1  F30000
G1 X117.935 Y130.437 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.137576
G1 F3028
G1 X118.085 Y130.54 E.0014
; LINE_WIDTH: 0.178232
G1 X118.235 Y130.644 E.00201
; LINE_WIDTH: 0.142113
G1 X118.435 Y130.673 E.00163
; LINE_WIDTH: 0.0969204
G1 X118.619 Y130.696 E.00082
G1 X119.552 Y130.696 F30000
; LINE_WIDTH: 0.138581
G1 F3028
G1 X119.737 Y130.673 E.00145
; LINE_WIDTH: 0.180242
G1 X119.922 Y130.651 E.00208
; LINE_WIDTH: 0.141111
G1 X120.087 Y130.54 E.00159
; LINE_WIDTH: 0.096921
G1 X120.237 Y130.437 E.0008
G1 X123.956 Y127.188 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3028
G2 X123.742 Y128.953 I2.534 J1.203 E.06002
G1 X124.357 Y130.575 E.05751
G1 X120.879 Y130.575 E.11537
G1 X121.32 Y129.41 E.04133
G2 X121.156 Y127.129 I-2.38 J-.976 E.07862
G1 X119.981 Y125.425 E.06865
G1 X125.173 Y125.425 E.17223
G1 X123.99 Y127.139 E.06907
G1 X123.139 Y125.832 F30000
G1 F3028
G1 X124.397 Y125.832 E.04174
G1 X124.187 Y126.137 E.01227
G1 X121.947 Y128.377 E.10507
G2 X121.753 Y127.429 I-2.322 J-.017 E.03232
M73 P90 R1
G1 X123.339 Y129.015 E.0744
G1 X123.767 Y130.168 E.04077
G1 X123.369 Y130.168 E.01321
G1 X124.997 Y130.409 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13904
G1 F3028
G1 X125.152 Y130.516 E.00147
; LINE_WIDTH: 0.181159
G1 X125.307 Y130.623 E.00212
; LINE_WIDTH: 0.170308
G2 X125.488 Y130.66 I.138 J-.213 E.00197
; LINE_WIDTH: 0.130583
G1 X125.636 Y130.678 E.00106
; LINE_WIDTH: 0.0969204
G1 X125.784 Y130.696 E.00065
G1 X126.569 Y130.696 F30000
; LINE_WIDTH: 0.130584
G1 F3028
G1 X126.716 Y130.678 E.00106
; LINE_WIDTH: 0.164247
G1 X126.864 Y130.66 E.00147
; LINE_WIDTH: 0.19791
G1 X127.012 Y130.642 E.00188
; LINE_WIDTH: 0.187435
G1 X127.031 Y130.632 E.00026
; LINE_WIDTH: 0.142594
G2 X127.201 Y130.516 I-.862 J-1.445 E.00167
; LINE_WIDTH: 0.0969212
G1 X127.356 Y130.409 E.00083
G1 X128.951 Y130.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3028
G1 X128.586 Y130.168 E.01212
G2 X129.017 Y128.983 I-10.247 J-4.404 E.04185
G1 X132.168 Y125.832 E.14779
G1 X127.955 Y125.832 E.13973
G1 X128.229 Y126.229 E.01597
G1 X131.689 Y129.689 E.16234
G1 X131.871 Y130.168 E.01697
G1 X130.754 Y130.168 E.03704
G1 X133.054 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.140505
G1 F3028
G1 X133.214 Y130.371 E.00155
; LINE_WIDTH: 0.18409
G1 X133.373 Y130.482 E.00224
; LINE_WIDTH: 0.190492
G1 X133.767 Y130.719 E.00553
G1 X133.362 Y130.566 F30000
; LINE_WIDTH: 0.250996
G1 F3028
G1 X133.657 Y130.602 E.00503
; LINE_WIDTH: 0.206314
G1 X133.951 Y130.638 E.00395
; LINE_WIDTH: 0.219208
G2 X134.866 Y130.602 I.174 J-7.284 E.01316
; LINE_WIDTH: 0.295678
G1 X135.16 Y130.566 E.00611
G1 X134.756 Y130.719 F30000
; LINE_WIDTH: 0.171145
G1 F3028
G2 X135.309 Y130.371 I-2.568 J-4.699 E.00684
; LINE_WIDTH: 0.0969196
G1 X135.469 Y130.261 E.00085
G1 X136.65 Y129.026 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3028
G1 X136.808 Y128.868 E.00743
G1 X137.557 Y127.881 F30000
G1 F3028
G1 X137.15 Y127.474 E.01909
G1 X138.695 Y126.437 F30000
G1 F3028
G2 X138.137 Y127.499 I1.875 J1.661 E.04016
G1 X137.431 Y129.362 E.06611
G1 X136.661 Y127.333 E.07198
G2 X136.343 Y126.711 I-1.421 J.335 E.02341
G1 X135.456 Y125.425 E.05182
G1 X139.393 Y125.425 E.13062
G1 X138.729 Y126.388 E.0388
G1 X139.862 Y125.549 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.496501
G1 F3028
G1 X140.087 Y125.522 E.00839
; LINE_WIDTH: 0.470866
G1 X140.312 Y125.495 E.00792
; LINE_WIDTH: 0.472828
G3 X141.234 Y125.522 I.22 J8.098 E.0323
; LINE_WIDTH: 0.522136
G1 X141.459 Y125.549 E.00887
G1 X141.825 Y125.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3028
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.114 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F3028
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F3028
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F3028
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
G1 X141.896 Y130.284 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969197
G1 F3028
G1 X141.732 Y130.398 E.00088
; LINE_WIDTH: 0.141971
G1 X141.567 Y130.511 E.00162
; LINE_WIDTH: 0.187022
G1 X141.222 Y130.719 E.00473
G1 X141.601 Y130.577 F30000
; LINE_WIDTH: 0.277428
G1 F3028
G1 X141.392 Y130.603 E.00403
; LINE_WIDTH: 0.243165
G1 X141.182 Y130.628 E.00344
; LINE_WIDTH: 0.181889
G3 X140.957 Y130.654 I-.331 J-1.855 E.00257
G3 X140.348 Y130.653 I-.297 J-5.017 E.0069
; LINE_WIDTH: 0.174638
G1 X140.138 Y130.628 E.00226
; LINE_WIDTH: 0.208902
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X140.099 Y130.719 F30000
; LINE_WIDTH: 0.193551
G1 F3028
G1 X139.754 Y130.511 E.00494
; LINE_WIDTH: 0.187019
G1 X139.589 Y130.398 E.00235
; LINE_WIDTH: 0.14197
G1 X139.424 Y130.284 E.00162
G1 X134.914 Y125.566 F30000
; LINE_WIDTH: 0.539113
G1 F3028
G2 X133.609 Y125.566 I-.653 J5.259 E.05291
G1 X132.031 Y126.927 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3028
G1 X133.067 Y125.425 E.06051
G1 X127.18 Y125.425 E.19531
G1 X128.253 Y126.981 E.06271
G3 X128.468 Y129.33 I-1.939 J1.361 E.08188
G1 X127.996 Y130.575 E.04417
G1 X132.46 Y130.575 E.1481
G1 X131.778 Y128.776 E.0638
G3 X131.997 Y126.976 I2.803 J-.573 E.06122
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.778 Y127.552 E-.23427
G1 X131.704 Y128.164 E-.23426
G1 X131.778 Y128.776 E-.23429
G1 X131.832 Y128.917 E-.05719
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
G3 Z6.6 I.534 J-1.094 P1  F30000
G1 X127.813 Y126.956 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3028
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.497 Y127.189 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3028
G1 X127.536 Y127.245 E.0021
G1 X127.736 Y127.535 E.0108
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.466 Y127.932 E.01305
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.453 Y127.149 E.01135
M204 S10000
; WIPE_START
G1 F24000
G1 X127.536 Y127.245 E-.04839
G1 X127.736 Y127.535 E-.13361
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.799 Y129.006 E-.09389
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.143 J-1.208 P1  F30000
G1 X117.929 Y130.177 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3028
G1 X117.889 Y130.156 E.00148
G1 X117.509 Y129.82 E.01685
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.993 Y129.29 E.01289
G1 X120.951 Y129.402 E.00395
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.982 Y130.205 E.01337
G1 X117.805 Y129.558 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3028
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.627 Y129.151 E.01048
G1 X120.601 Y129.218 E.0022
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.995 Y129.865 E.0022
G1 X119.693 Y130.023 E.01048
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X117.849 Y129.597 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X117.57 Y129.218 E-.17901
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.424 Y128.013 E-.15679
G1 X117.527 Y127.741 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.082 J1.214 P1  F30000
G1 X132.133 Y128.729 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3028
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01764
G1 X132.119 Y127.636 E.01764
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01764
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01765
G1 X136.468 Y128.164 E.01764
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01765
G1 X135.044 Y130.227 E.01764
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01765
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01764
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3028
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.073 Y128.164 E.01342
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3028
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01805
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3028
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
M73 P91 R1
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3028
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3028
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
G3 Z6.8 I-.114 J1.212 P1  F30000
G1 X116.873 Y129.468 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3028
G2 X117.576 Y130.344 I2.439 J-1.237 E.03751
G1 X117.432 Y130.575 E.00901
G1 X117.223 Y130.575 E.00694
G1 X115.95 Y129.302 E.05969
G1 X115.95 Y126.698 E.0864
G1 X117.223 Y125.425 E.05969
G1 X118.851 Y125.425 E.05401
; WIPE_START
G1 F24000
G1 X117.223 Y125.425 E-.61876
G1 X116.96 Y125.688 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.192 J.245 P1  F30000
G1 X117.935 Y130.437 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.137577
G1 F3028
G1 X118.085 Y130.54 E.0014
; LINE_WIDTH: 0.178234
G1 X118.235 Y130.644 E.00201
; LINE_WIDTH: 0.142112
G1 X118.435 Y130.673 E.00163
; LINE_WIDTH: 0.0969204
G1 X118.619 Y130.696 E.00082
G1 X119.552 Y130.696 F30000
; LINE_WIDTH: 0.13858
G1 F3028
G1 X119.737 Y130.673 E.00145
; LINE_WIDTH: 0.18024
G1 X119.922 Y130.651 E.00208
; LINE_WIDTH: 0.141112
G1 X120.087 Y130.54 E.00159
; LINE_WIDTH: 0.096921
G1 X120.237 Y130.437 E.0008
G1 X124.285 Y126.711 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3028
G1 X124.215 Y126.814 E.00413
G2 X123.742 Y128.953 I2.006 J1.566 E.07516
G1 X124.357 Y130.575 E.05751
G1 X120.879 Y130.575 E.11537
G1 X121.319 Y129.414 E.04118
G2 X121.432 Y127.73 I-2.26 J-.998 E.05712
G1 X121.419 Y127.696 E.00122
G2 X120.939 Y126.814 I-2.955 J1.035 E.03347
G1 X119.981 Y125.425 E.05595
G1 X125.173 Y125.425 E.17223
G1 X124.32 Y126.662 E.04983
G1 X123.139 Y125.832 F30000
G1 F3028
G1 X124.397 Y125.832 E.04174
G1 X124.187 Y126.137 E.01227
G1 X121.947 Y128.377 E.10507
G2 X121.753 Y127.429 I-2.322 J-.017 E.03232
G1 X123.339 Y129.015 E.0744
G1 X123.767 Y130.168 E.04077
G1 X123.369 Y130.168 E.01321
G1 X124.997 Y130.409 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.139041
G1 F3028
G1 X125.152 Y130.516 E.00147
; LINE_WIDTH: 0.181162
G1 X125.307 Y130.623 E.00212
; LINE_WIDTH: 0.170308
G2 X125.488 Y130.66 I.138 J-.213 E.00197
; LINE_WIDTH: 0.130583
G1 X125.636 Y130.678 E.00106
; LINE_WIDTH: 0.0969204
G1 X125.784 Y130.696 E.00065
G1 X126.569 Y130.696 F30000
; LINE_WIDTH: 0.130584
G1 F3028
G1 X126.716 Y130.678 E.00106
; LINE_WIDTH: 0.164247
G1 X126.864 Y130.66 E.00147
; LINE_WIDTH: 0.19791
G1 X127.012 Y130.642 E.00188
; LINE_WIDTH: 0.187432
G1 X127.031 Y130.632 E.00026
; LINE_WIDTH: 0.142591
G2 X127.201 Y130.516 I-.863 J-1.446 E.00167
; LINE_WIDTH: 0.0969196
G1 X127.356 Y130.409 E.00083
G1 X128.951 Y130.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3028
G1 X128.586 Y130.168 E.01212
G2 X129.017 Y128.983 I-13.411 J-5.556 E.04184
G1 X132.168 Y125.832 E.14779
G1 X127.955 Y125.832 E.13973
G1 X128.229 Y126.229 E.01597
G1 X131.689 Y129.689 E.16234
G1 X131.871 Y130.168 E.01697
G1 X130.754 Y130.168 E.03704
G1 X133.054 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.140505
G1 F3028
G1 X133.214 Y130.371 E.00155
; LINE_WIDTH: 0.18409
G1 X133.373 Y130.482 E.00224
; LINE_WIDTH: 0.190492
G1 X133.767 Y130.719 E.00553
G1 X133.362 Y130.566 F30000
; LINE_WIDTH: 0.250996
G1 F3028
G1 X133.657 Y130.602 E.00503
; LINE_WIDTH: 0.206314
G1 X133.951 Y130.638 E.00395
; LINE_WIDTH: 0.219208
G2 X134.866 Y130.602 I.174 J-7.284 E.01316
; LINE_WIDTH: 0.295676
G1 X135.16 Y130.566 E.00611
G1 X134.756 Y130.719 F30000
; LINE_WIDTH: 0.171145
G1 F3028
G2 X135.309 Y130.371 I-2.568 J-4.699 E.00684
; LINE_WIDTH: 0.096921
G1 X135.469 Y130.261 E.00085
G1 X136.65 Y129.026 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3028
G1 X136.808 Y128.868 E.00743
G1 X137.557 Y127.881 F30000
G1 F3028
G1 X137.15 Y127.474 E.01909
G1 X138.695 Y126.437 F30000
G1 F3028
G2 X138.137 Y127.499 I1.875 J1.661 E.04016
G1 X137.431 Y129.362 E.06611
G1 X136.65 Y127.304 E.07303
G2 X135.456 Y125.425 I-7.72 J3.591 E.07406
G1 X139.393 Y125.425 E.13062
G1 X138.729 Y126.388 E.0388
G1 X139.862 Y125.549 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.4965
G1 F3028
G1 X140.087 Y125.522 E.00839
; LINE_WIDTH: 0.470866
G1 X140.312 Y125.495 E.00792
; LINE_WIDTH: 0.472828
G3 X141.234 Y125.522 I.22 J8.098 E.0323
; LINE_WIDTH: 0.522136
G1 X141.459 Y125.549 E.00887
G1 X141.825 Y125.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3028
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.261 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541023
G1 F3028
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F3028
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F3028
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
G1 X141.896 Y130.284 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969198
G1 F3028
G1 X141.732 Y130.398 E.00088
; LINE_WIDTH: 0.14197
G1 X141.567 Y130.511 E.00162
; LINE_WIDTH: 0.18702
M73 P91 R0
G1 X141.222 Y130.719 E.00473
G1 X141.601 Y130.577 F30000
; LINE_WIDTH: 0.277428
G1 F3028
G1 X141.392 Y130.603 E.00403
; LINE_WIDTH: 0.243165
G1 X141.182 Y130.628 E.00344
; LINE_WIDTH: 0.181889
G3 X140.957 Y130.654 I-.331 J-1.855 E.00257
G3 X140.348 Y130.653 I-.297 J-5.017 E.0069
; LINE_WIDTH: 0.174638
G1 X140.138 Y130.628 E.00226
; LINE_WIDTH: 0.208901
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X140.099 Y130.719 F30000
; LINE_WIDTH: 0.193552
G1 F3028
G1 X139.754 Y130.511 E.00494
; LINE_WIDTH: 0.187018
G1 X139.589 Y130.398 E.00235
; LINE_WIDTH: 0.141969
G1 X139.424 Y130.284 E.00162
G1 X134.914 Y125.566 F30000
; LINE_WIDTH: 0.539113
G1 F3028
G2 X133.609 Y125.566 I-.653 J5.259 E.05291
G1 X132.143 Y126.764 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3028
G1 X133.067 Y125.425 E.05396
G1 X127.18 Y125.425 E.19531
G1 X128.207 Y126.914 E.06
G3 X128.533 Y129.159 I-2.034 J1.441 E.07813
G1 X127.996 Y130.575 E.05022
G1 X132.46 Y130.575 E.1481
G1 X131.778 Y128.776 E.0638
G3 X132.048 Y126.902 I2.435 J-.606 E.06442
G1 X132.109 Y126.814 E.00355
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.048 Y126.902 E-.0407
G1 X131.778 Y127.552 E-.26767
G1 X131.704 Y128.164 E-.23427
G1 X131.773 Y128.732 E-.21735
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
G3 Z6.8 I.498 J-1.11 P1  F30000
G1 X127.813 Y126.956 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3965
G1 X128.086 Y127.351 E.01594
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.412 Y130.37 E.01725
G1 X124.951 Y130.128 E.01725
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.02 Y128.353 E.01725
G1 X124.082 Y127.837 E.01725
G1 X124.267 Y127.351 E.01725
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.775 Y126.91 E.01656
G1 X127.498 Y127.19 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3965
G1 X127.736 Y127.535 E.01289
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
M73 P92 R0
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.415 Y128.353 E.01305
G1 X124.422 Y128.294 E.00183
G1 X124.466 Y127.932 E.01122
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.454 Y127.149 E.01136
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.535 E-.18171
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.799 Y129.007 E-.09418
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.136 J-1.209 P1  F30000
G1 X117.856 Y130.127 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3965
G1 X117.509 Y129.82 E.01539
G1 X117.22 Y129.402 E.01684
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.662 Y127.026 E.01685
G1 X120.951 Y127.444 E.01685
G1 X121.093 Y127.82 E.01333
G1 X121.131 Y127.919 E.00352
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.988 Y129.303 E.01333
G1 X120.951 Y129.402 E.00352
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.903 Y130.164 E.01631
G1 X117.805 Y129.558 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3965
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.367 Y127.288 E.01268
G1 X120.601 Y127.627 E.01268
G1 X120.727 Y127.959 E.01088
G1 X120.747 Y128.013 E.00179
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.622 Y129.164 E.01088
G1 X120.601 Y129.218 E.00179
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X117.849 Y129.597 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X117.57 Y129.218 E-.17901
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.424 Y128.013 E-.15679
G1 X117.527 Y127.741 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.082 J1.214 P1  F30000
G1 X132.133 Y128.729 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3965
G1 X132.119 Y128.692 E.00131
G1 X132.055 Y128.164 E.01764
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01765
G1 X132.61 Y126.701 E.01764
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01764
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X134.939 Y126.075 E.01406
G1 X135.044 Y126.101 E.00359
G1 X135.515 Y126.348 E.01764
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01764
G1 X136.417 Y127.744 E.00359
G1 X136.468 Y128.164 E.01406
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01764
G1 X135.044 Y130.227 E.01765
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01764
G1 X132.154 Y128.785 E.01434
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3965
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.02 Y127.731 E.01342
G1 X136.028 Y127.791 E.00186
G1 X136.073 Y128.164 E.01156
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X135.237 Y129.683 E.00186
G1 X134.904 Y129.858 E.01156
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3965
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.864 Y127.714 E.00362
G1 X142.917 Y128.146 E.01442
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01805
G1 X142.349 Y129.642 E.01804
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01804
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01804
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3965
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.475 Y127.762 E.00189
G1 X142.522 Y128.146 E.01189
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.475 Y127.762 E-.02343
G1 X142.522 Y128.146 E-.1471
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3965
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3965
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
G3 Z7 I-.578 J1.071 P1  F30000
G1 X116.842 Y130.173 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38076
G1 F3965
G1 X116.528 Y129.691 E.01586
G1 X116.352 Y129.224 E.01372
G1 X116.352 Y130.173 E.02612
G1 X116.782 Y130.173 E.01186
G1 X116.753 Y126.169 F30000
; LINE_WIDTH: 0.385942
G1 F3965
G1 X116.688 Y126.206 E.00208
G1 X116.738 Y126.235 E.0016
G1 X117.84 Y125.846 F30000
; LINE_WIDTH: 0.419999
G1 F3965
G1 X116.371 Y125.846 E.04513
G1 X116.371 Y127.514 E.05124
G1 X116.573 Y127.027 E.0162
G1 X116.89 Y126.569 E.01712
G1 X117.398 Y126.097 E.02129
G1 X117.788 Y125.876 E.01378
G1 X119.901 Y126.041 F30000
; LINE_WIDTH: 0.436573
G1 F3965
G1 X119.522 Y125.493 E.02137
G2 X115.994 Y125.469 I-3.459 J249.848 E.11317
G1 X115.994 Y127.122 E.05303
; LINE_WIDTH: 0.419999
G1 X116.018 Y127.401 E.00859
; LINE_WIDTH: 0.46849
G1 X116.043 Y127.68 E.0097
; LINE_WIDTH: 0.522926
G2 X116.065 Y129.039 I41.858 J-.024 E.05316
; LINE_WIDTH: 0.562665
G1 X116.042 Y129.267 E.00971
; LINE_WIDTH: 0.51511
G1 X116.018 Y129.495 E.00883
; LINE_WIDTH: 0.422951
G1 X115.994 Y129.723 E.0071
G1 X115.994 Y130.531 E.02502
G1 X117.47 Y130.531 E.04569
G3 X117.518 Y130.351 I.139 J-.059 E.00621
G1 X117.2 Y130.063 E.01328
G1 X116.884 Y129.604 E.01726
; LINE_WIDTH: 0.419999
G1 X116.794 Y129.423 E.0062
; LINE_WIDTH: 0.456107
G1 X116.704 Y129.243 E.00679
; LINE_WIDTH: 0.519407
G1 X116.614 Y129.062 E.00783
G1 X116.533 Y128.452 E.02389
; LINE_WIDTH: 0.528957
G1 X116.583 Y127.838 E.02439
; LINE_WIDTH: 0.562665
G1 X116.676 Y127.653 E.00879
; LINE_WIDTH: 0.51511
G1 X116.77 Y127.467 E.00799
; LINE_WIDTH: 0.436362
G1 X116.863 Y127.282 E.00665
G1 X117.2 Y126.783 E.01931
G1 X117.648 Y126.379 E.01931
G1 X118.178 Y126.094 E.01931
G1 X118.756 Y125.923 E.01933
G1 X119.364 Y125.916 E.01949
G1 X119.842 Y126.028 E.01573
; WIPE_START
G1 F24000
G1 X119.364 Y125.916 E-.18646
G1 X118.756 Y125.923 E-.23101
G1 X118.178 Y126.094 E-.22916
G1 X117.915 Y126.235 E-.11337
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.065 J.588 P1  F30000
G1 X120.237 Y130.437 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.096921
G1 F3965
G1 X120.087 Y130.54 E.0008
; LINE_WIDTH: 0.141111
G1 X119.922 Y130.651 E.00159
; LINE_WIDTH: 0.180242
G1 X119.737 Y130.673 E.00208
; LINE_WIDTH: 0.138581
G1 X119.552 Y130.696 E.00145
G1 X118.619 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F3965
G1 X118.435 Y130.673 E.00082
; LINE_WIDTH: 0.142114
G1 X118.235 Y130.644 E.00163
; LINE_WIDTH: 0.178242
G1 X118.085 Y130.54 E.00201
; LINE_WIDTH: 0.137581
G1 X117.935 Y130.437 E.00141
G1 X120.546 Y130.634 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F3965
G1 X120.609 Y130.486 E.00445
G1 X120.598 Y130.403 E.00233
G1 X121.334 Y130.756 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.423141
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X121.083 Y130.095 E.0405
G1 X121.336 Y129.428 E.04088
G1 X121.763 Y130.553 E.06897
G1 X122.269 Y130.553 E.02899
G1 X121.54 Y128.629 E.11791
G1 X121.565 Y128.423 E.0119
G1 X121.493 Y127.829 E.03424
G1 X121.281 Y127.271 E.03424
G1 X120.712 Y126.447 E.05736
G1 X120.333 Y125.447 E.06128
G1 X120.839 Y125.447 E.02899
G1 X122.775 Y130.553 E.3129
G1 X123.281 Y130.553 E.02899
G1 X121.345 Y125.447 E.3129
G1 X121.851 Y125.447 E.02899
G1 X123.787 Y130.553 E.3129
G1 X124.293 Y130.553 E.02899
G1 X122.357 Y125.447 E.3129
G1 X122.863 Y125.447 E.02899
G1 X123.728 Y127.729 E.13982
G1 X123.937 Y127.178 E.03372
G1 X123.994 Y127.095 E.00577
G1 X123.369 Y125.447 E.10102
G1 X123.875 Y125.447 E.02899
G1 X124.321 Y126.622 E.07203
G1 X124.647 Y126.149 E.03294
G1 X124.381 Y125.447 E.04303
G1 X124.887 Y125.447 E.02899
G1 X125.061 Y125.906 E.02814
M106 S252.45
G1 X127.076 Y125.968 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419496
; LAYER_HEIGHT: 0.2
G1 F3965
G1 X126.733 Y125.471 E.01854
G2 X125.62 Y125.471 I-.556 J14.716 E.03416
G1 X125.277 Y125.967 E.01852
G1 X125.765 Y125.845 E.01544
G1 X126.461 Y125.827 E.02136
G1 X127.018 Y125.952 E.01753
; WIPE_START
G1 F24000
G1 X126.461 Y125.827 E-.21704
G1 X125.765 Y125.845 E-.26455
G1 X125.277 Y125.967 E-.19117
G1 X125.407 Y125.778 E-.08723
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.04 J.632 P1  F30000
G1 X128.003 Y130.046 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.417851
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X128.428 Y130.553 E.03699
G1 X129.039 Y130.553 E.03412
G1 X128.342 Y129.723 E.06058
G1 X128.532 Y129.221 E.02995
G1 X129.65 Y130.553 E.09714
G1 X130.26 Y130.553 E.03412
G1 X128.668 Y128.656 E.13838
G1 X128.705 Y128.353 E.01702
G1 X128.651 Y127.907 E.02511
G1 X130.871 Y130.553 E.19298
G1 X131.482 Y130.553 E.03412
G1 X127.328 Y125.603 E.36106
G1 X127.22 Y125.447 E.01059
G1 X127.808 Y125.447 E.03283
G1 X132.093 Y130.553 E.37243
G1 X132.429 Y130.553 E.01881
G1 X132.203 Y129.957 E.03562
G1 X128.419 Y125.447 E.32896
G1 X129.029 Y125.447 E.03412
G1 X131.746 Y128.684 E.23609
G1 X131.682 Y128.164 E.02923
G1 X131.713 Y127.917 E.01394
M73 P93 R0
G1 X129.64 Y125.447 E.18014
G1 X130.251 Y125.447 E.03412
G1 X131.837 Y127.337 E.13787
G1 X131.978 Y126.966 E.02219
G1 X132.049 Y126.862 E.00703
G1 X130.862 Y125.447 E.10324
G1 X131.472 Y125.447 E.03412
G1 X132.325 Y126.463 E.07411
G1 X132.601 Y126.064 E.02711
G1 X132.083 Y125.447 E.04499
G1 X132.694 Y125.447 E.03412
G1 X133.011 Y125.825 E.02759
M106 S252.45
G1 X133.284 Y125.759 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F3965
G1 X133.22 Y125.796 E.00204
G1 X133.269 Y125.824 E.00155
G1 X133.609 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539113
G1 F3965
G3 X134.914 Y125.566 I.653 J5.259 E.05291
G1 X135.282 Y125.763 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F3965
G1 X135.219 Y125.8 E.00204
G1 X135.267 Y125.828 E.00155
G1 X137.187 Y129.229 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.421436
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X137.458 Y129.229 E.01544
G1 X137.637 Y128.758 E.02866
G1 X137.224 Y128.758 E.02345
G1 X137.046 Y128.286 E.02866
G1 X137.816 Y128.286 E.04378
G1 X137.995 Y127.815 E.02866
G1 X136.867 Y127.815 E.0641
G1 X136.688 Y127.343 E.02866
G1 X138.174 Y127.343 E.08442
G1 X138.332 Y126.924 E.02548
G1 X138.369 Y126.872 E.00361
G1 X136.48 Y126.872 E.10733
G1 X136.155 Y126.4 E.03256
G1 X138.694 Y126.4 E.14432
G1 X139.019 Y125.929 E.03256
G1 X135.829 Y125.929 E.18131
G1 X135.504 Y125.458 E.03256
G1 X139.591 Y125.458 E.23228
M106 S252.45
G1 X139.862 Y125.549 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.496501
; LAYER_HEIGHT: 0.2
G1 F3965
G1 X140.087 Y125.522 E.00839
; LINE_WIDTH: 0.470866
G1 X140.312 Y125.495 E.00792
; LINE_WIDTH: 0.472828
G3 X141.234 Y125.522 I.22 J8.098 E.0323
; LINE_WIDTH: 0.522136
G1 X141.459 Y125.549 E.00887
G1 X141.825 Y125.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3965
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.26 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541022
G1 F3965
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F3965
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F3965
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.89 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
G1 X141.896 Y130.284 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969197
G1 F3965
G1 X141.732 Y130.398 E.00088
; LINE_WIDTH: 0.14197
G1 X141.567 Y130.511 E.00162
; LINE_WIDTH: 0.187018
G1 X141.222 Y130.719 E.00473
G1 X141.182 Y130.628 F30000
; LINE_WIDTH: 0.181889
G1 F3965
G3 X140.957 Y130.654 I-.331 J-1.855 E.00257
G3 X140.348 Y130.653 I-.297 J-5.017 E.0069
; LINE_WIDTH: 0.174638
G1 X140.138 Y130.628 E.00226
; LINE_WIDTH: 0.208901
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243164
G1 X139.72 Y130.577 E.00344
G1 X139.754 Y130.511 F30000
; LINE_WIDTH: 0.187017
G1 F3965
G1 X139.589 Y130.398 E.00235
; LINE_WIDTH: 0.141968
G1 X139.424 Y130.284 E.00162
G1 X139.754 Y130.511 F30000
; LINE_WIDTH: 0.193551
G1 F3965
G1 X140.099 Y130.719 E.00494
G1 X141.182 Y130.628 F30000
; LINE_WIDTH: 0.243165
G1 F3965
G1 X141.392 Y130.603 E.00344
; LINE_WIDTH: 0.277428
G1 X141.601 Y130.577 E.00403
G1 X137.864 Y130.183 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.361583
G1 F3965
G1 X138.461 Y130.181 E.0155
G1 X138.1 Y129.683 E.01596
G1 X137.932 Y130.126 E.01231
G1 X137.91 Y130.145 E.00075
G1 X136.397 Y130.185 F30000
; LINE_WIDTH: 0.357866
G1 F3965
G1 X137.017 Y130.185 E.0159
G1 X136.931 Y130.126 E.00267
G1 X136.766 Y129.691 E.01193
G1 X136.438 Y130.141 E.0143
G1 X135.886 Y130.175 F30000
; LINE_WIDTH: 0.421065
G1 F3965
G1 X135.963 Y130.309 E.00477
G1 X135.894 Y130.531 E.00715
G3 X137.971 Y130.531 I1.039 J141.657 E.06401
G1 X138.99 Y130.531 E.0314
G1 X138.926 Y130.333 E.00641
G1 X139.007 Y130.198 E.00486
G1 X138.663 Y129.885 E.01433
G1 X138.326 Y129.397 E.01829
G1 X138.082 Y128.75 E.02131
G1 X137.607 Y130.003 E.0413
G1 X137.431 Y130.132 E.00673
G1 X137.255 Y130.003 E.00673
G1 X136.788 Y128.773 E.04055
G1 X136.573 Y129.352 E.01904
G1 X136.222 Y129.871 E.01931
G1 X135.931 Y130.135 E.01211
G1 X135.469 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F3965
G1 X135.309 Y130.371 E.00085
; LINE_WIDTH: 0.171146
G3 X134.756 Y130.719 I-3.12 J-4.349 E.00684
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.295676
G1 F3965
G1 X135.16 Y130.566 E.00611
G1 X134.866 Y130.602 F30000
; LINE_WIDTH: 0.219208
G1 F3965
G3 X133.951 Y130.638 I-.741 J-7.249 E.01316
; LINE_WIDTH: 0.206314
G1 X133.657 Y130.602 E.00395
; LINE_WIDTH: 0.250996
G1 X133.362 Y130.566 E.00503
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.190492
G1 F3965
G1 X133.767 Y130.719 E.00553
G1 X133.373 Y130.482 F30000
; LINE_WIDTH: 0.18409
G1 F3965
G1 X133.214 Y130.371 E.00224
; LINE_WIDTH: 0.140505
G1 X133.054 Y130.261 E.00155
G1 X132.686 Y130.169 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F3965
G1 X132.689 Y130.421 E.00698
G1 X132.782 Y130.55 E.00439
G1 X127.657 Y130.623 F30000
G1 F3965
G1 X127.727 Y130.524 E.00338
G1 X127.721 Y130.376 E.00409
G1 X127.356 Y130.409 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969212
G1 F3965
G1 X127.201 Y130.516 E.00083
; LINE_WIDTH: 0.142594
G3 X127.031 Y130.632 I-1.032 J-1.33 E.00167
; LINE_WIDTH: 0.187435
G1 X127.012 Y130.642 E.00026
; LINE_WIDTH: 0.19791
G1 X126.864 Y130.66 E.00188
; LINE_WIDTH: 0.164247
G1 X126.716 Y130.678 E.00147
; LINE_WIDTH: 0.130584
G1 X126.569 Y130.696 E.00106
G1 X125.784 Y130.696 F30000
; LINE_WIDTH: 0.0969204
G1 F3965
G1 X125.636 Y130.678 E.00065
; LINE_WIDTH: 0.130583
G1 X125.488 Y130.66 E.00106
; LINE_WIDTH: 0.170306
G3 X125.307 Y130.623 I-.044 J-.25 E.00197
; LINE_WIDTH: 0.181158
G1 X125.152 Y130.516 E.00212
; LINE_WIDTH: 0.139039
G1 X124.997 Y130.409 E.00147
G1 X124.691 Y130.63 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F3965
G1 X124.616 Y130.464 E.00503
G1 X124.627 Y130.376 E.00247
; WIPE_START
G1 F24000
G1 X124.616 Y130.464 E-.25023
G1 X124.691 Y130.63 E-.50977
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.378 J1.157 P1  F30000
G1 X139.567 Y125.775 Z7
G1 Z6.6
G1 E.8 F1800
G1 F3965
G1 X139.503 Y125.811 E.00204
G1 X139.552 Y125.839 E.00155
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.503 Y125.811 E-.32874
G1 X139.567 Y125.775 E-.43126
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
G3 Z7 I-.126 J-1.21 P1  F30000
G1 X127.84 Y126.995 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3861
G1 X128.086 Y127.351 E.01437
G1 X128.27 Y127.837 E.01725
G1 X128.333 Y128.353 E.01725
G1 X128.27 Y128.87 E.01725
G1 X128.086 Y129.356 E.01725
G1 X127.79 Y129.783 E.01725
G1 X127.401 Y130.128 E.01725
G1 X126.941 Y130.37 E.01725
G1 X126.436 Y130.494 E.01725
G1 X125.916 Y130.494 E.01725
G1 X125.502 Y130.392 E.01414
G1 X125.412 Y130.37 E.0031
G1 X124.951 Y130.128 E.01724
G1 X124.562 Y129.783 E.01725
G1 X124.267 Y129.356 E.01725
G1 X124.082 Y128.87 E.01725
G1 X124.031 Y128.446 E.01414
G1 X124.02 Y128.353 E.0031
G1 X124.082 Y127.837 E.01724
G1 X124.267 Y127.351 E.01724
G1 X124.562 Y126.923 E.01725
G1 X124.951 Y126.579 E.01725
G1 X125.412 Y126.337 E.01725
G1 X125.916 Y126.213 E.01725
G1 X126.436 Y126.213 E.01725
G1 X126.941 Y126.337 E.01725
G1 X127.401 Y126.579 E.01725
G1 X127.79 Y126.923 E.01724
G1 X127.806 Y126.945 E.00089
G1 X127.493 Y127.197 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3861
G1 X127.521 Y127.223 E.00116
G1 X127.736 Y127.535 E.01164
G1 X127.887 Y127.932 E.01305
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.596 Y130.012 E.01164
G1 X125.176 Y129.803 E.01442
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.42 Y128.399 E.01164
G1 X124.466 Y127.932 E.01442
G1 X124.616 Y127.535 E.01305
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.552 Y126.706 E.01305
G1 X125.964 Y126.605 E.01305
G1 X126.389 Y126.605 E.01305
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
G1 X127.449 Y127.157 E.01142
M204 S10000
; WIPE_START
G1 F24000
G1 X127.521 Y127.223 E-.03713
G1 X127.736 Y127.535 E-.14394
G1 X127.887 Y127.932 E-.16137
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.798 Y129.008 E-.09482
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.136 J-1.209 P1  F30000
G1 X117.857 Y130.128 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3861
G1 X117.509 Y129.82 E.01542
G1 X117.22 Y129.402 E.01685
G1 X117.04 Y128.927 E.01685
G1 X116.979 Y128.423 E.01685
G1 X117.04 Y127.919 E.01685
G1 X117.22 Y127.444 E.01685
G1 X117.509 Y127.026 E.01685
G1 X117.889 Y126.689 E.01685
G1 X118.339 Y126.453 E.01685
G1 X118.832 Y126.332 E.01685
G1 X119.34 Y126.332 E.01685
G1 X119.833 Y126.453 E.01685
G1 X120.282 Y126.689 E.01685
G1 X120.593 Y126.964 E.01377
G1 X120.662 Y127.026 E.00308
G1 X120.951 Y127.444 E.01685
G1 X121.131 Y127.919 E.01685
G1 X121.192 Y128.423 E.01685
G1 X121.131 Y128.927 E.01685
G1 X120.984 Y129.315 E.01377
G1 X120.951 Y129.402 E.00308
G1 X120.662 Y129.82 E.01685
G1 X120.282 Y130.156 E.01685
G1 X119.833 Y130.392 E.01685
G1 X119.34 Y130.514 E.01685
G1 X118.832 Y130.514 E.01685
G1 X118.339 Y130.392 E.01685
G1 X117.904 Y130.164 E.01628
G1 X117.805 Y129.558 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3861
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.479 Y126.822 E.01268
G1 X118.879 Y126.724 E.01268
G1 X119.292 Y126.724 E.01268
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01268
G1 X120.333 Y127.258 E.01129
G1 X120.601 Y127.627 E.01403
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X117.849 Y129.597 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X117.57 Y129.218 E-.17901
G1 X117.424 Y128.832 E-.15679
G1 X117.374 Y128.423 E-.15679
G1 X117.424 Y128.013 E-.15679
G1 X117.527 Y127.741 E-.11062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.076 J1.215 P1  F30000
G1 X132.114 Y128.653 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3861
G1 X132.055 Y128.164 E.01634
G1 X132.119 Y127.636 E.01765
G1 X132.308 Y127.139 E.01764
G1 X132.61 Y126.701 E.01764
G1 X133.008 Y126.348 E.01765
G1 X133.479 Y126.101 E.01765
G1 X133.995 Y125.974 E.01765
G1 X134.527 Y125.974 E.01764
G1 X135.044 Y126.101 E.01765
G1 X135.515 Y126.348 E.01765
G1 X135.913 Y126.701 E.01764
G1 X136.215 Y127.139 E.01765
G1 X136.404 Y127.636 E.01764
G1 X136.415 Y127.73 E.00312
G1 X136.468 Y128.164 E.01452
G1 X136.404 Y128.692 E.01764
G1 X136.215 Y129.19 E.01765
G1 X135.913 Y129.628 E.01765
G1 X135.515 Y129.98 E.01765
G1 X135.044 Y130.227 E.01765
G1 X134.527 Y130.355 E.01765
G1 X133.995 Y130.355 E.01764
G1 X133.479 Y130.227 E.01765
G1 X133.008 Y129.98 E.01764
G1 X132.61 Y129.628 E.01765
G1 X132.308 Y129.19 E.01764
G1 X132.126 Y128.712 E.01696
G1 X132.503 Y128.598 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3861
G1 X132.45 Y128.164 E.01342
G1 X132.503 Y127.731 E.01342
G1 X132.657 Y127.323 E.01342
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.619 Y126.471 E.01342
G1 X134.043 Y126.366 E.01342
G1 X134.48 Y126.366 E.01342
G1 X134.904 Y126.471 E.01342
G1 X135.29 Y126.674 E.01342
G1 X135.617 Y126.963 E.01342
G1 X135.865 Y127.323 E.01342
G1 X136.026 Y127.777 E.01481
G1 X136.073 Y128.164 E.01199
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.619 Y129.858 E.01342
G1 X133.232 Y129.655 E.01342
G1 X132.905 Y129.366 E.01342
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.45 Y128.164 E-.18817
G1 X132.503 Y127.731 E-.16595
G1 X132.657 Y127.323 E-.16595
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07398
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.028 J1.217 P1  F30000
G1 X142.32 Y126.623 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3861
G1 X142.349 Y126.65 E.00131
G1 X142.658 Y127.097 E.01804
G1 X142.851 Y127.606 E.01804
G1 X142.917 Y128.146 E.01804
G1 X142.851 Y128.686 E.01804
G1 X142.658 Y129.195 E.01804
G1 X142.349 Y129.642 E.01805
G1 X141.942 Y130.003 E.01804
G1 X141.46 Y130.256 E.01804
G1 X140.932 Y130.386 E.01805
G1 X140.388 Y130.386 E.01804
G1 X139.86 Y130.256 E.01805
G1 X139.378 Y130.003 E.01804
G1 X138.971 Y129.642 E.01805
G1 X138.662 Y129.195 E.01804
G1 X138.469 Y128.686 E.01804
G1 X138.404 Y128.146 E.01804
G1 X138.469 Y127.606 E.01804
G1 X138.662 Y127.097 E.01804
G1 X138.971 Y126.65 E.01804
G1 X139.378 Y126.289 E.01804
G1 X139.86 Y126.036 E.01804
G1 X140.388 Y125.906 E.01805
G1 X140.932 Y125.906 E.01804
G1 X141.46 Y126.036 E.01805
G1 X141.942 Y126.289 E.01804
G1 X142.275 Y126.584 E.01474
G1 X142.054 Y126.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3861
G1 X142.309 Y127.281 E.01379
G1 X142.468 Y127.7 E.01379
G1 X142.522 Y128.146 E.01379
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.267 Y129.38 E.01379
G1 X139.012 Y129.011 E.01379
G1 X138.853 Y128.591 E.01379
G1 X138.799 Y128.146 E.01379
G1 X138.853 Y127.7 E.01379
G1 X139.012 Y127.281 E.01379
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19275
G1 X142.468 Y127.7 E-.17053
G1 X142.522 Y128.146 E-.17053
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.728 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.099 J-1.213 P1  F30000
G1 X115.602 Y130.923 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3861
G1 X115.602 Y125.077 E.19392
G1 X144.398 Y125.077 E.95521
G1 X144.398 Y130.923 E.19392
G1 X115.662 Y130.923 E.95322
G1 X115.21 Y131.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3861
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
G3 Z7.2 I-.47 J1.123 P1  F30000
G1 X117.935 Y130.437 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.137579
G1 F3861
G1 X118.085 Y130.54 E.00141
; LINE_WIDTH: 0.178237
G1 X118.235 Y130.644 E.00201
; LINE_WIDTH: 0.142113
G1 X118.435 Y130.673 E.00163
; LINE_WIDTH: 0.0969204
G1 X118.619 Y130.696 E.00082
G1 X119.552 Y130.696 F30000
; LINE_WIDTH: 0.138581
G1 F3861
G1 X119.737 Y130.673 E.00145
; LINE_WIDTH: 0.180242
G1 X119.922 Y130.651 E.00208
; LINE_WIDTH: 0.141112
G1 X120.087 Y130.54 E.00159
; LINE_WIDTH: 0.0969209
G1 X120.237 Y130.437 E.0008
G1 X124.997 Y130.409 F30000
; LINE_WIDTH: 0.13904
G1 F3861
G1 X125.152 Y130.516 E.00147
; LINE_WIDTH: 0.18116
G1 X125.307 Y130.623 E.00212
; LINE_WIDTH: 0.170309
G2 X125.488 Y130.66 I.138 J-.213 E.00197
; LINE_WIDTH: 0.130584
G1 X125.636 Y130.678 E.00106
; LINE_WIDTH: 0.0969204
G1 X125.784 Y130.696 E.00065
G1 X126.569 Y130.696 F30000
; LINE_WIDTH: 0.130584
G1 F3861
G1 X126.716 Y130.678 E.00106
; LINE_WIDTH: 0.164247
G1 X126.864 Y130.66 E.00147
; LINE_WIDTH: 0.19791
G1 X127.012 Y130.642 E.00188
; LINE_WIDTH: 0.187433
G1 X127.031 Y130.632 E.00026
; LINE_WIDTH: 0.142593
G2 X127.201 Y130.516 I-.862 J-1.445 E.00167
; LINE_WIDTH: 0.096921
G1 X127.356 Y130.409 E.00083
; WIPE_START
G1 F24000
G1 X127.201 Y130.516 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.543 J-1.089 P1  F30000
G1 X117.84 Y125.846 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3861
G1 X116.371 Y125.846 E.04513
G1 X116.371 Y127.514 E.05124
G1 X116.573 Y127.027 E.0162
M73 P94 R0
G1 X116.89 Y126.569 E.01712
G1 X117.398 Y126.097 E.02129
G1 X117.788 Y125.876 E.01378
G1 X116.753 Y126.169 F30000
; LINE_WIDTH: 0.385942
G1 F3861
G1 X116.688 Y126.206 E.00208
G1 X116.738 Y126.235 E.0016
G1 X116.842 Y130.173 F30000
; LINE_WIDTH: 0.38076
G1 F3861
G1 X116.528 Y129.691 E.01586
G1 X116.352 Y129.224 E.01372
G1 X116.352 Y130.173 E.02612
G1 X116.782 Y130.173 E.01186
; WIPE_START
G1 F24000
G1 X116.352 Y130.173 E-.16369
G1 X116.352 Y129.224 E-.36061
G1 X116.528 Y129.691 E-.18945
G1 X116.595 Y129.793 E-.04625
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.093 J1.213 P1  F30000
G1 X122.643 Y129.327 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.47276
G1 F3861
G2 X122.637 Y129.42 I-.027 J.045 E.00749
G1 X122.917 Y126.62 F30000
; LINE_WIDTH: 0.459958
G1 F3861
G1 X122.252 Y126.62 E.02258
G1 X122.594 Y127.435 E.03003
G3 X122.892 Y126.675 I4.536 J1.336 E.02778
G1 X123.658 Y126.223 F30000
; LINE_WIDTH: 0.419999
G1 F3861
G1 X121.476 Y126.223 E.06706
G1 X121.908 Y126.813 E.02247
G1 X122.181 Y127.454 E.0214
G1 X122.27 Y127.845 E.01232
; LINE_WIDTH: 0.469092
G3 X122.366 Y128.54 I-1.676 J.587 E.02455
; LINE_WIDTH: 0.48688
G1 X122.32 Y128.786 E.00906
; LINE_WIDTH: 0.423032
G3 X122.035 Y129.777 I-3.875 J-.579 E.03201
G1 X123.201 Y129.777 E.03611
G1 X123.002 Y129.253 E.01735
; LINE_WIDTH: 0.419999
G1 X122.928 Y128.897 E.01118
; LINE_WIDTH: 0.468685
G3 X122.845 Y128.236 I1.837 J-.567 E.02323
; LINE_WIDTH: 0.488567
G1 X122.896 Y127.955 E.01036
; LINE_WIDTH: 0.42527
G1 X122.947 Y127.675 E.00888
G1 X123.158 Y127.044 E.02072
G1 X123.309 Y126.72 E.01113
G1 X123.62 Y126.27 E.01706
G1 X124.692 Y125.846 F30000
; LINE_WIDTH: 0.419999
G1 F3861
G1 X120.332 Y125.846 E.13397
G1 X120.774 Y126.097 E.01562
G1 X121.191 Y126.467 E.01712
G1 X121.598 Y127.027 E.02129
G3 X121.892 Y127.801 I-3.674 J1.836 E.02548
G1 X121.959 Y128.355 E.01712
G1 X121.898 Y128.987 E.01952
G1 X121.661 Y129.697 E.02302
G1 X121.366 Y130.154 E.01669
G1 X123.883 Y130.154 E.07733
G1 X123.556 Y129.651 E.01841
G1 X123.354 Y129.119 E.01749
G1 X123.262 Y128.491 E.01951
G1 X123.253 Y128.285 E.00632
G1 X123.322 Y127.72 E.01749
G3 X123.62 Y126.935 I4.482 J1.251 E.02585
G1 X123.943 Y126.466 E.01749
G1 X124.46 Y125.987 E.02166
G1 X124.64 Y125.877 E.00649
; WIPE_START
G1 F24000
G1 X124.46 Y125.987 E-.08023
G1 X123.943 Y126.466 E-.26784
G1 X123.62 Y126.935 E-.21634
G1 X123.51 Y127.177 E-.10119
G1 X123.429 Y127.412 E-.0944
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.208 J1.199 P1  F30000
G1 X128.725 Y128.331 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.419497
G1 F3861
G1 X128.656 Y128.941 E.01886
G1 X128.444 Y129.518 E.01886
G1 X128.099 Y130.027 E.01886
G1 X127.773 Y130.323 E.01353
G1 X127.839 Y130.426 E.00375
G1 X127.809 Y130.531 E.00336
G1 X132.644 Y130.531 E.14837
G1 X132.554 Y130.314 E.0072
G1 X132.637 Y130.175 E.00495
G1 X132.301 Y129.871 E.0139
G1 X131.971 Y129.392 E.01784
G1 X131.744 Y128.808 E.01922
G1 X131.672 Y128.263 E.01687
G1 X131.733 Y127.565 E.02152
G1 X131.95 Y126.977 E.01922
G1 X132.301 Y126.458 E.01922
G1 X132.766 Y126.039 E.01922
G1 X133.24 Y125.784 E.01651
G1 X133.202 Y125.469 E.00972
G2 X125.234 Y125.469 I-3.984 J1326.893 E.24452
G1 X120.024 Y125.469 E.15986
; LINE_WIDTH: 0.419999
G1 X119.746 Y125.482 E.00857
; LINE_WIDTH: 0.465006
G3 X118.807 Y125.492 I-.566 J-8.993 E.0323
; LINE_WIDTH: 0.426893
G1 X118.147 Y125.469 E.02067
G1 X115.994 Y125.469 E.06736
G1 X115.994 Y127.122 E.05173
; LINE_WIDTH: 0.419999
G1 X116.018 Y127.401 E.00859
; LINE_WIDTH: 0.468489
G1 X116.043 Y127.68 E.0097
; LINE_WIDTH: 0.522925
G2 X116.065 Y129.039 I41.857 J-.024 E.05316
; LINE_WIDTH: 0.562664
G1 X116.042 Y129.267 E.00971
; LINE_WIDTH: 0.515109
G1 X116.018 Y129.495 E.00883
; LINE_WIDTH: 0.422951
G1 X115.994 Y129.723 E.0071
G1 X115.994 Y130.531 E.02502
G1 X117.47 Y130.531 E.04569
G3 X117.518 Y130.351 I.139 J-.059 E.00621
G1 X117.2 Y130.063 E.01328
G1 X116.884 Y129.604 E.01726
; LINE_WIDTH: 0.419999
G1 X116.794 Y129.423 E.0062
; LINE_WIDTH: 0.456106
G1 X116.704 Y129.243 E.00679
; LINE_WIDTH: 0.519405
G1 X116.614 Y129.062 E.00783
G1 X116.533 Y128.452 E.02389
; LINE_WIDTH: 0.528957
G1 X116.583 Y127.838 E.02439
; LINE_WIDTH: 0.562665
G1 X116.676 Y127.653 E.00879
; LINE_WIDTH: 0.51511
G1 X116.77 Y127.467 E.00799
; LINE_WIDTH: 0.423553
G1 X116.863 Y127.282 E.00644
G1 X117.2 Y126.783 E.01868
G1 X117.648 Y126.379 E.01868
G1 X118.178 Y126.094 E.01868
G1 X118.756 Y125.923 E.0187
G1 X119.364 Y125.916 E.01886
G1 X119.95 Y126.078 E.01886
G1 X120.486 Y126.353 E.01868
G1 X120.941 Y126.749 E.01868
G1 X121.288 Y127.241 E.01868
G1 X121.476 Y127.721 E.01599
G1 X121.576 Y128.331 E.01915
G1 X121.524 Y128.941 E.01901
G1 X121.309 Y129.564 E.02043
G1 X120.971 Y130.063 E.01868
G1 X120.654 Y130.351 E.0133
G1 X120.716 Y130.446 E.00352
G1 X120.694 Y130.531 E.00273
G1 X124.534 Y130.531 E.1191
G1 X124.525 Y130.402 E.00401
G1 X124.58 Y130.323 E.00297
G1 X124.253 Y130.027 E.01367
G1 X123.93 Y129.558 E.01766
G1 X123.707 Y128.985 E.01906
G1 X123.636 Y128.445 E.01689
G1 X123.686 Y127.847 E.01863
G3 X123.93 Y127.149 I4.726 J1.259 E.02295
G1 X124.253 Y126.68 E.01766
G1 X124.71 Y126.269 E.01906
G1 X125.251 Y125.978 E.01906
; LINE_WIDTH: 0.417185
G1 X125.848 Y125.831 E.01874
G1 X126.461 Y125.827 E.0187
G1 X127.059 Y125.962 E.0187
G1 X127.605 Y126.243 E.01874
G1 X128.069 Y126.646 E.01874
G1 X128.422 Y127.149 E.01874
G1 X128.632 Y127.685 E.01754
G1 X128.716 Y128.271 E.01808
G1 X129.076 Y128.096 F30000
; LINE_WIDTH: 0.419999
G1 F3861
G1 X129.099 Y128.422 E.01002
G1 X129.031 Y128.987 E.01749
G1 X128.796 Y129.651 E.02166
G1 X128.469 Y130.154 E.01841
G1 X132.052 Y130.154 E.11008
G1 X131.661 Y129.606 E.02067
G1 X131.391 Y128.942 E.02203
G3 X131.358 Y127.519 I3.293 J-.787 E.04406
G1 X131.597 Y126.843 E.02203
G1 X131.991 Y126.244 E.02203
G1 X132.415 Y125.846 E.01786
G1 X127.661 Y125.846 E.14608
G1 X127.893 Y125.987 E.00833
G1 X128.319 Y126.364 E.01749
G1 X128.733 Y126.935 E.02166
G1 X128.984 Y127.551 E.02045
G1 X129.066 Y128.037 E.01515
G1 X129.474 Y128.24 F30000
G1 F3861
G3 X129.351 Y129.253 I-4.561 J-.04 E.03142
G1 X129.152 Y129.777 E.01721
G1 X131.327 Y129.777 E.06684
G1 X131.039 Y129.076 E.02329
G3 X130.914 Y128.051 I4.572 J-1.075 E.03179
G1 X130.984 Y127.474 E.01786
G1 X131.245 Y126.709 E.02481
G1 X131.547 Y126.223 E.01759
G1 X128.694 Y126.223 E.08765
G1 X129.043 Y126.72 E.01866
G1 X129.337 Y127.417 E.02323
G3 X129.466 Y128.18 I-2.67 J.846 E.02386
G1 X129.848 Y128.194 F30000
G1 F3861
G3 X129.712 Y129.4 I-5.558 J-.016 E.03734
G1 X130.758 Y129.4 E.03214
G1 X130.61 Y128.901 E.01599
G3 X130.883 Y126.6 I3.871 J-.707 E.07224
G1 X129.403 Y126.6 E.04547
G1 X129.689 Y127.284 E.02276
G3 X129.841 Y128.135 I-3.08 J.987 E.02665
G1 X130.167 Y127.964 F30000
; LINE_WIDTH: 0.356814
G1 F3861
G1 X130.188 Y128.153 E.00487
G3 X130.381 Y126.947 I6.518 J.424 E.03129
G1 X129.932 Y126.947 E.01148
G1 X130.089 Y127.397 E.01218
G1 X130.159 Y127.904 E.01311
G1 X130.206 Y128.987 F30000
; LINE_WIDTH: 0.49027
G1 F3861
G1 X130.205 Y128.805 E.00663
; LINE_WIDTH: 0.447557
G1 X130.204 Y128.623 E.006
; LINE_WIDTH: 0.404844
G1 X130.203 Y128.442 E.00537
; LINE_WIDTH: 0.36213
G1 X130.191 Y128.213 E.00595
G1 X133.054 Y130.261 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.140504
G1 F3861
G1 X133.214 Y130.371 E.00154
; LINE_WIDTH: 0.184088
G1 X133.373 Y130.482 E.00224
; LINE_WIDTH: 0.190488
G1 X133.767 Y130.719 E.00553
G1 X133.362 Y130.566 F30000
; LINE_WIDTH: 0.250995
G1 F3861
G1 X133.657 Y130.602 E.00503
; LINE_WIDTH: 0.206314
G1 X133.951 Y130.638 E.00395
; LINE_WIDTH: 0.219208
G2 X134.866 Y130.602 I.174 J-7.284 E.01316
; LINE_WIDTH: 0.295678
G1 X135.16 Y130.566 E.00611
G1 X134.756 Y130.719 F30000
; LINE_WIDTH: 0.171147
G1 F3861
G2 X135.309 Y130.371 I-2.568 J-4.7 E.00684
; LINE_WIDTH: 0.0969197
G1 X135.469 Y130.261 E.00085
G1 X137.165 Y129.795 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.382826
G1 F3861
G1 X137.71 Y129.795 E.01509
G1 X137.438 Y129.146 E.0195
G1 X137.188 Y129.74 E.01784
G1 X137.025 Y126.249 F30000
; LINE_WIDTH: 0.471627
G1 F3861
G1 X137.302 Y126.7 E.0185
G1 X137.431 Y127.039 E.01266
G1 X137.618 Y126.561 E.01794
G1 X137.824 Y126.249 E.01304
G1 X137.085 Y126.249 E.0258
G1 X136.108 Y125.846 F30000
; LINE_WIDTH: 0.421198
G1 F3861
G1 X136.532 Y126.244 E.01792
G1 X136.862 Y126.722 E.01792
G1 X137.12 Y127.356 E.0211
G1 X137.239 Y128.077 E.02251
G1 X137.165 Y128.803 E.0225
G1 X136.944 Y129.438 E.02072
G1 X136.532 Y130.085 E.02364
G1 X136.471 Y130.154 E.00284
G1 X138.4 Y130.154 E.05947
G1 X138.015 Y129.611 E.02051
G1 X137.744 Y128.942 E.02226
G1 X137.634 Y128.233 E.02211
G1 X137.705 Y127.519 E.02212
G1 X137.936 Y126.843 E.02202
G1 X138.352 Y126.192 E.02381
G1 X138.718 Y125.846 E.01552
G1 X136.168 Y125.846 E.07861
G1 X135.283 Y125.784 F30000
; LINE_WIDTH: 0.419999
G1 F3861
G1 X135.756 Y126.039 E.01653
G1 X136.191 Y126.424 E.01786
G1 X136.552 Y126.937 E.01925
G1 X136.768 Y127.49 E.01825
G1 X136.858 Y128.123 E.01965
G1 X136.791 Y128.758 E.01961
G1 X136.591 Y129.304 E.01788
G1 X136.222 Y129.871 E.02078
G1 X135.886 Y130.175 E.01392
G1 X135.963 Y130.309 E.00476
G1 X135.894 Y130.531 E.00713
G1 X138.981 Y130.531 E.09486
G1 X138.921 Y130.338 E.00621
G1 X139.007 Y130.198 E.00506
G1 X138.663 Y129.885 E.01429
G1 X138.326 Y129.397 E.01823
G1 X138.096 Y128.808 E.01941
G1 X138.014 Y128.187 E.01926
G1 X138.079 Y127.565 E.01924
G1 X138.289 Y126.977 E.01917
G1 X138.663 Y126.407 E.02096
G1 X139.137 Y125.979 E.01962
G1 X139.495 Y125.785 E.01252
G1 X139.457 Y125.469 E.00977
G1 X135.321 Y125.469 E.12709
G1 X135.29 Y125.724 E.00789
G1 X134.914 Y125.566 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.539112
G1 F3861
G2 X133.609 Y125.566 I-.653 J5.259 E.05291
G1 X139.862 Y125.549 F30000
; LINE_WIDTH: 0.496501
G1 F3861
G1 X140.087 Y125.522 E.00839
; LINE_WIDTH: 0.470866
G1 X140.312 Y125.495 E.00792
; LINE_WIDTH: 0.472828
G3 X141.234 Y125.522 I.22 J8.098 E.0323
; LINE_WIDTH: 0.522136
G1 X141.459 Y125.549 E.00887
G1 X141.825 Y125.785 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3861
G1 X142.184 Y125.979 E.01252
G1 X142.628 Y126.373 E.01823
G1 X142.995 Y126.895 E.01962
G1 X143.227 Y127.49 E.01962
G1 X143.309 Y128.123 E.01962
G1 X143.237 Y128.758 E.01962
G1 X143.016 Y129.357 E.01962
G1 X142.658 Y129.885 E.01962
G1 X142.314 Y130.198 E.01429
G1 X142.39 Y130.328 E.00464
G1 X142.324 Y130.528 E.00645
G2 X144.006 Y130.531 I1.109 J-137.26 E.05168
G1 X144.006 Y125.469 E.15553
G1 X141.864 Y125.469 E.06582
G1 X141.833 Y125.725 E.00793
G1 X142.762 Y125.907 F30000
; LINE_WIDTH: 0.541024
G1 F3861
G1 X143.018 Y126.158 E.01456
G1 X143.355 Y126.646 E.02409
G1 X143.568 Y127.157 E.02246
G1 X143.568 Y125.907 E.05074
G1 X142.822 Y125.907 E.03029
G1 X143.618 Y128.835 F30000
; LINE_WIDTH: 0.441518
G1 F3861
G1 X143.637 Y128.523 E.01015
; LINE_WIDTH: 0.377451
G1 X143.656 Y128.211 E.00852
G1 X143.623 Y127.548 E.0181
G1 X142.99 Y130.114 F30000
; LINE_WIDTH: 0.464493
G1 F3861
G1 X143.603 Y130.128 E.02108
G3 X143.618 Y128.835 I36.889 J-.217 E.04443
G1 X143.393 Y129.5 E.02412
G1 X143.022 Y130.064 E.02319
G1 X141.896 Y130.284 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969196
G1 F3861
G1 X141.732 Y130.398 E.00088
; LINE_WIDTH: 0.14197
G1 X141.567 Y130.511 E.00162
; LINE_WIDTH: 0.187018
G1 X141.222 Y130.719 E.00473
G1 X141.601 Y130.577 F30000
; LINE_WIDTH: 0.277426
G1 F3861
G1 X141.392 Y130.603 E.00403
; LINE_WIDTH: 0.243164
G1 X141.182 Y130.628 E.00344
; LINE_WIDTH: 0.181889
G3 X140.957 Y130.654 I-.331 J-1.855 E.00257
G3 X140.348 Y130.653 I-.297 J-5.017 E.0069
; LINE_WIDTH: 0.174638
G1 X140.138 Y130.628 E.00226
; LINE_WIDTH: 0.208902
G1 X139.929 Y130.603 E.00285
; LINE_WIDTH: 0.243165
G1 X139.72 Y130.577 E.00344
G1 X140.099 Y130.719 F30000
; LINE_WIDTH: 0.193553
G1 F3861
G1 X139.754 Y130.511 E.00494
; LINE_WIDTH: 0.187019
G1 X139.589 Y130.398 E.00235
; LINE_WIDTH: 0.141969
G1 X139.424 Y130.284 E.00162
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.589 Y130.398 E-.76
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
G3 Z7.2 I.312 J-1.176 P1  F30000
G1 X127.496 Y127.191 Z7.2
G1 Z7
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5262
G1 X127.736 Y127.534 E.01287
G1 X127.887 Y127.932 E.01306
G1 X127.938 Y128.353 E.01305
G1 X127.887 Y128.775 E.01305
G1 X127.736 Y129.172 E.01305
G1 X127.495 Y129.522 E.01305
G1 X127.177 Y129.803 E.01305
G1 X126.801 Y130.001 E.01305
G1 X126.389 Y130.102 E.01305
G1 X125.964 Y130.102 E.01305
G1 X125.552 Y130.001 E.01305
G1 X125.176 Y129.803 E.01305
G1 X124.858 Y129.522 E.01305
G1 X124.616 Y129.172 E.01305
G1 X124.466 Y128.775 E.01305
G1 X124.416 Y128.361 E.01283
G1 X124.466 Y127.932 E.01325
G1 X124.616 Y127.535 E.01306
G1 X124.858 Y127.185 E.01305
G1 X125.176 Y126.904 E.01305
G1 X125.545 Y126.71 E.01283
G1 X125.963 Y126.605 E.01325
G1 X126.389 Y126.605 E.01306
G1 X126.801 Y126.706 E.01305
G1 X127.177 Y126.904 E.01305
M73 P95 R0
G1 X127.454 Y127.149 E.01137
M204 S10000
; WIPE_START
G1 F24000
G1 X127.736 Y127.534 E-.18148
G1 X127.887 Y127.932 E-.16154
G1 X127.938 Y128.353 E-.16137
G1 X127.887 Y128.775 E-.16137
G1 X127.799 Y129.007 E-.09423
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.067 J-1.215 P1  F30000
G1 X117.805 Y129.558 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F5262
G1 X117.57 Y129.218 E.01268
G1 X117.424 Y128.832 E.01268
G1 X117.374 Y128.423 E.01268
G1 X117.424 Y128.013 E.01268
G1 X117.57 Y127.627 E.01268
G1 X117.805 Y127.288 E.01268
G1 X118.113 Y127.014 E.01268
G1 X118.473 Y126.826 E.01246
G1 X118.879 Y126.724 E.01287
G1 X119.292 Y126.724 E.01269
G1 X119.693 Y126.822 E.01268
G1 X120.058 Y127.014 E.01269
G1 X120.371 Y127.294 E.01287
G1 X120.601 Y127.627 E.01246
G1 X120.747 Y128.013 E.01268
G1 X120.797 Y128.423 E.01268
G1 X120.747 Y128.832 E.01268
G1 X120.601 Y129.218 E.01268
G1 X120.367 Y129.558 E.01268
G1 X120.058 Y129.831 E.01268
G1 X119.693 Y130.023 E.01268
G1 X119.292 Y130.122 E.01268
G1 X118.879 Y130.122 E.01268
G1 X118.479 Y130.023 E.01268
G1 X118.113 Y129.831 E.01268
G1 X117.849 Y129.597 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X117.57 Y129.218 E-.17901
G1 X117.424 Y128.832 E-.15678
G1 X117.374 Y128.423 E-.1568
G1 X117.424 Y128.013 E-.1568
G1 X117.527 Y127.741 E-.1106
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.07 J1.215 P1  F30000
G1 X132.503 Y128.598 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F5262
G1 X132.451 Y128.172 E.01319
G1 X132.502 Y127.731 E.01363
G1 X132.657 Y127.323 E.01343
G1 X132.905 Y126.963 E.01342
G1 X133.232 Y126.674 E.01342
G1 X133.612 Y126.474 E.01319
G1 X134.043 Y126.366 E.01363
G1 X134.48 Y126.366 E.01343
G1 X134.897 Y126.469 E.01319
G1 X135.29 Y126.673 E.01363
G1 X135.617 Y126.963 E.01343
G1 X135.866 Y127.323 E.01343
G1 X136.021 Y127.738 E.01363
G1 X136.073 Y128.164 E.01319
G1 X136.02 Y128.598 E.01342
G1 X135.865 Y129.006 E.01342
G1 X135.617 Y129.366 E.01342
G1 X135.29 Y129.655 E.01342
G1 X134.904 Y129.858 E.01342
G1 X134.48 Y129.963 E.01342
G1 X134.043 Y129.963 E.01342
G1 X133.626 Y129.86 E.01319
G1 X133.233 Y129.656 E.01363
G1 X132.905 Y129.366 E.01343
G1 X132.657 Y129.006 E.01342
G1 X132.524 Y128.654 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X132.451 Y128.172 E-.18533
G1 X132.502 Y127.731 E-.16854
G1 X132.657 Y127.323 E-.16612
G1 X132.905 Y126.963 E-.16595
G1 X133.051 Y126.834 E-.07405
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.01 J1.217 P1  F30000
G1 X142.054 Y126.912 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F5262
G1 X142.309 Y127.281 E.0138
G1 X142.469 Y127.708 E.01401
G1 X142.522 Y128.146 E.01355
G1 X142.468 Y128.591 E.01379
G1 X142.309 Y129.011 E.01379
G1 X142.054 Y129.38 E.01379
G1 X141.718 Y129.678 E.01379
G1 X141.32 Y129.887 E.01379
G1 X140.885 Y129.994 E.01379
G1 X140.436 Y129.994 E.01379
G1 X140 Y129.887 E.01379
G1 X139.603 Y129.678 E.01379
G1 X139.273 Y129.385 E.01355
G1 X139.012 Y129.011 E.014
G1 X138.853 Y128.591 E.0138
G1 X138.799 Y128.146 E.0138
G1 X138.856 Y127.693 E.01401
G1 X139.012 Y127.281 E.01355
G1 X139.267 Y126.912 E.01379
G1 X139.603 Y126.614 E.01379
G1 X140 Y126.405 E.01379
G1 X140.436 Y126.298 E.01379
G1 X140.885 Y126.298 E.01379
G1 X141.32 Y126.405 E.01379
G1 X141.718 Y126.614 E.01379
G1 X142.009 Y126.872 E.01195
M204 S10000
; WIPE_START
G1 F24000
G1 X142.309 Y127.281 E-.19292
G1 X142.469 Y127.708 E-.1732
G1 X142.522 Y128.146 E-.16761
G1 X142.468 Y128.591 E-.17053
G1 X142.416 Y128.729 E-.05574
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.115 J-1.212 P1  F30000
G1 X115.21 Y131.315 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F5262
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
G1 F5262
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
G1 X142.64 Y127.575 E.0844
G1 X142.725 Y128.193
G1 X144.583 Y130.051 E.08072
G1 X144.583 Y130.584
G1 X142.662 Y128.664 E.08345
G1 X142.516 Y129.05
G1 X144.573 Y131.108 E.0894
G1 X144.04 Y131.108
G1 X142.308 Y129.376 E.07523
G1 X142.055 Y129.656
G1 X143.506 Y131.108 E.06307
G1 X142.973 Y131.108
G1 X141.757 Y129.892 E.05284
G1 X141.407 Y130.075
G1 X142.44 Y131.108 E.04486
G1 X141.906 Y131.108
G1 X140.982 Y130.183 E.04016
G1 X140.467 Y130.201
G1 X141.373 Y131.108 E.03938
G1 X140.84 Y131.108
G1 X139.691 Y129.958 E.04994
M204 S10000
; WIPE_START
G1 F24000
G1 X140.84 Y131.108 E-.61762
G1 X141.215 Y131.108 E-.14238
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.217 J.005 P1  F30000
G1 X141.236 Y126.171 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F5262
G1 X139.957 Y124.892 E.05556
G1 X139.424 Y124.892
G1 X140.622 Y126.091 E.05207
G1 X140.153 Y126.154
G1 X138.891 Y124.892 E.05483
G1 X138.358 Y124.892
G1 X139.762 Y126.296 E.06101
G1 X139.426 Y126.494
G1 X137.824 Y124.892 E.06959
G1 X137.291 Y124.892
G1 X139.143 Y126.744 E.08047
G1 X138.918 Y127.052
G1 X136.758 Y124.892 E.09386
G1 X136.225 Y124.892
G1 X138.741 Y127.409 E.10937
G1 X138.629 Y127.83
G1 X135.691 Y124.892 E.12767
G1 X135.158 Y124.892
G1 X138.614 Y128.349 E.1502
G1 X138.819 Y129.086
G1 X134.625 Y124.892 E.18225
G1 X134.091 Y124.892
G1 X140.307 Y131.108 E.27008
G1 X139.773 Y131.108
G1 X136.146 Y127.48 E.15762
G1 X136.28 Y128.147
G1 X139.24 Y131.108 E.12864
G1 X138.707 Y131.108
G1 X136.226 Y128.626 E.10782
G1 X136.083 Y129.017
G1 X138.174 Y131.108 E.09084
G1 X137.64 Y131.108
G1 X135.881 Y129.348 E.07644
G1 X135.631 Y129.631
G1 X137.107 Y131.108 E.06416
G1 X136.574 Y131.108
G1 X135.333 Y129.867 E.05391
G1 X134.984 Y130.051
G1 X136.04 Y131.108 E.04593
G1 X135.507 Y131.108
G1 X134.557 Y130.157 E.04129
G1 X134.036 Y130.17
G1 X134.974 Y131.108 E.04074
G1 X134.441 Y131.108
G1 X133.211 Y129.878 E.05343
M204 S10000
; WIPE_START
G1 F24000
G1 X134.441 Y131.108 E-.66073
G1 X134.702 Y131.108 E-.09927
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.216 J.057 P1  F30000
G1 X134.929 Y126.263 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F5262
G1 X133.558 Y124.892 E.05957
G1 X133.025 Y124.892
G1 X134.291 Y126.159 E.05502
G1 X133.81 Y126.211
G1 X132.492 Y124.892 E.05728
G1 X131.958 Y124.892
G1 X133.411 Y126.345 E.06314
G1 X133.072 Y126.539
G1 X131.425 Y124.892 E.07155
G1 X130.892 Y124.892
G1 X132.789 Y126.789 E.08243
G1 X132.562 Y127.096
G1 X130.359 Y124.892 E.09574
G1 X129.825 Y124.892
G1 X132.386 Y127.453 E.11127
G1 X132.277 Y127.877
G1 X129.292 Y124.892 E.12969
G1 X128.759 Y124.892
G1 X132.27 Y128.404 E.15258
G1 X132.553 Y129.219
G1 X128.226 Y124.892 E.18803
G1 X127.692 Y124.892
G1 X133.907 Y131.108 E.27008
G1 X133.374 Y131.108
G1 X127.159 Y124.892 E.27008
G1 X126.626 Y124.892
G1 X132.841 Y131.108 E.27008
G1 X132.308 Y131.108
G1 X126.092 Y124.892 E.27008
G1 X125.559 Y124.892
G1 X131.774 Y131.108 E.27008
G1 X131.241 Y131.108
G1 X128.1 Y127.966 E.13651
G1 X128.126 Y128.526
G1 X130.708 Y131.108 E.1122
G1 X130.175 Y131.108
G1 X128.035 Y128.968 E.09297
G1 X127.873 Y129.339
G1 X129.641 Y131.108 E.07685
G1 X129.108 Y131.108
G1 X127.655 Y129.655 E.06314
G1 X127.373 Y129.906
G1 X128.575 Y131.108 E.05221
G1 X128.041 Y131.108
G1 X127.042 Y130.108 E.04343
G1 X126.652 Y130.251
M73 P96 R0
G1 X127.508 Y131.108 E.03723
G1 X126.975 Y131.108
G1 X126.177 Y130.31 E.03468
G1 X125.547 Y130.213
G1 X126.442 Y131.108 E.03887
M204 S10000
; WIPE_START
G1 F24000
G1 X125.547 Y130.213 E-.48074
G1 X126.177 Y130.31 E-.24212
G1 X126.246 Y130.379 E-.03714
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.188 J-.264 P1  F30000
G1 X125.026 Y124.892 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F5262
G1 X126.569 Y126.436 E.06706
G1 X125.998 Y126.397
G1 X124.493 Y124.892 E.0654
G1 X123.959 Y124.892
G1 X125.559 Y126.492 E.06953
G1 X125.194 Y126.66
G1 X123.426 Y124.892 E.07681
G1 X122.893 Y124.892
G1 X124.885 Y126.884 E.08656
G1 X124.625 Y127.158
G1 X122.36 Y124.892 E.09844
G1 X121.826 Y124.892
G1 X124.415 Y127.481 E.11249
G1 X124.268 Y127.868
G1 X121.293 Y124.892 E.12929
G1 X120.76 Y124.892
G1 X124.209 Y128.342 E.14989
G1 X124.327 Y128.992
G1 X120.226 Y124.892 E.17817
G1 X119.693 Y124.892
G1 X125.908 Y131.108 E.27008
G1 X125.375 Y131.108
G1 X119.16 Y124.892 E.27008
G1 X118.627 Y124.892
G1 X124.842 Y131.108 E.27008
G1 X124.309 Y131.108
G1 X120.82 Y127.619 E.15161
G1 X120.994 Y128.327
G1 X123.775 Y131.108 E.12084
G1 X123.242 Y131.108
G1 X120.958 Y128.823 E.09927
G1 X120.822 Y129.221
G1 X122.709 Y131.108 E.08199
G1 X122.175 Y131.108
G1 X120.622 Y129.554 E.06752
G1 X120.368 Y129.834
G1 X121.642 Y131.108 E.05536
G1 X121.109 Y131.108
G1 X120.064 Y130.062 E.04542
G1 X119.702 Y130.234
G1 X120.576 Y131.108 E.03795
G1 X120.042 Y131.108
G1 X119.264 Y130.329 E.03383
G1 X118.69 Y130.289
G1 X119.509 Y131.108 E.03558
M204 S10000
; WIPE_START
G1 F24000
G1 X118.69 Y130.289 E-.44003
G1 X119.264 Y130.329 E-.21853
G1 X119.453 Y130.518 E-.10143
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.209 J.14 P1  F30000
G1 X119.896 Y126.695 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F5262
G1 X118.093 Y124.892 E.07832
G1 X117.56 Y124.892
G1 X119.184 Y126.516 E.07056
G1 X118.691 Y126.557
G1 X117.027 Y124.892 E.07233
G1 X116.494 Y124.892
G1 X118.289 Y126.688 E.07802
G1 X117.95 Y126.882
G1 X115.96 Y124.892 E.08646
G1 X115.427 Y124.892
G1 X117.667 Y127.132 E.09734
G1 X117.445 Y127.444
G1 X115.417 Y125.416 E.08811
G1 X115.417 Y125.949
G1 X117.279 Y127.811 E.08089
G1 X117.186 Y128.251
G1 X115.417 Y126.483 E.07686
G1 X115.417 Y127.016
G1 X117.212 Y128.811 E.078
M204 S10000
; WIPE_START
G1 F24000
G1 X115.798 Y127.397 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.453 J-1.13 P1  F30000
G1 X115.417 Y127.549 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F5262
G1 X118.976 Y131.108 E.15463
G1 X118.443 Y131.108
G1 X115.417 Y128.082 E.13146
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
G3 Z7.4 I.222 J1.197 P1  F30000
G1 X141.646 Y126.342 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881689
G1 F5262
G1 X141.531 Y126.257 E.00053
; LINE_WIDTH: 0.131591
G2 X141.403 Y126.164 I-.823 J.998 E.00114
; LINE_WIDTH: 0.17379
G1 X141.301 Y126.106 E.00126
; WIPE_START
G1 F24000
G1 X141.403 Y126.164 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.106 J-.509 P1  F30000
G1 X139.629 Y130.02 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.21682
G1 F5262
G3 X139.449 Y129.886 I1.022 J-1.564 E.00318
; LINE_WIDTH: 0.180106
G3 X139.086 Y129.543 I2.698 J-3.222 E.00559
; LINE_WIDTH: 0.152222
G1 X138.921 Y129.346 E.00229
; LINE_WIDTH: 0.189473
G1 X138.756 Y129.149 E.00307
; WIPE_START
G1 F24000
G1 X138.921 Y129.346 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.005 J-1.217 P1  F30000
G1 X124.357 Y129.29 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.170235
G1 F5262
G1 X124.357 Y129.02 E.0028
G1 X124.571 Y129.475 F30000
; LINE_WIDTH: 0.109428
G1 F5262
G3 X124.253 Y129.066 I3.183 J-2.814 E.00281
; WIPE_START
G1 F24000
G1 X124.571 Y129.475 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.808 J.91 P1  F30000
G1 X125.479 Y130.281 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.20427
G1 F5262
G1 X125.348 Y130.184 E.00215
; LINE_WIDTH: 0.165569
G1 X125.216 Y130.087 E.00163
; LINE_WIDTH: 0.126869
G1 X125.085 Y129.99 E.00112
; WIPE_START
G1 F24000
G1 X125.216 Y130.087 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.46 J1.127 P1  F30000
G1 X128.049 Y128.929 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.125714
G1 F5262
G1 X128.11 Y128.835 E.00076
G1 X128.087 Y128.754 E.00057
; WIPE_START
G1 F24000
G1 X128.11 Y128.835 E-.32608
G1 X128.049 Y128.929 E-.43392
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.217 J1.197 P1  F30000
G1 X133.222 Y129.868 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.206154
G1 F5262
G1 X133.078 Y129.887 E.00193
G3 X132.492 Y129.28 I4.052 J-4.499 E.01123
; WIPE_START
M73 P97 R0
G1 F24000
G1 X132.715 Y129.546 E-.2666
G1 X133.078 Y129.887 E-.38208
G1 X133.222 Y129.868 E-.11132
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.146 J.411 P1  F30000
G1 X134.547 Y126.171 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0968974
G1 F5262
G2 X134.368 Y126.082 I-.816 J1.403 E.00088
; WIPE_START
G1 F24000
G1 X134.547 Y126.171 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.434 J1.137 P1  F30000
G1 X135.403 Y126.498 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0881703
G1 F5262
G1 X135.267 Y126.398 E.00062
; LINE_WIDTH: 0.12885
G1 X135.13 Y126.298 E.00118
; LINE_WIDTH: 0.169529
G1 X134.994 Y126.198 E.00174
; WIPE_START
G1 F24000
G1 X135.13 Y126.298 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.868 J.853 P1  F30000
G1 X136.219 Y127.407 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.141594
G1 F5262
G1 X136.073 Y127.208 E.00199
; LINE_WIDTH: 0.137938
G1 X135.883 Y126.979 E.0023
; WIPE_START
G1 F24000
G1 X136.073 Y127.208 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.682 J1.008 P1  F30000
G1 X140.478 Y130.19 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.103221
G1 F5262
G1 X140.263 Y130.264 E.00112
; WIPE_START
G1 F24000
G1 X140.478 Y130.19 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.01 J-1.217 P1  F30000
G1 X118.615 Y130.364 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.100226
G1 F5262
G3 X118.355 Y130.192 I1.272 J-2.208 E.00146
; WIPE_START
G1 F24000
G1 X118.615 Y130.364 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.949 J.762 P1  F30000
G1 X120.814 Y127.624 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.175091
G1 F5262
G1 X120.834 Y127.485 E.00151
; LINE_WIDTH: 0.210794
G1 X120.692 Y127.314 E.00305
; LINE_WIDTH: 0.142837
G2 X120.193 Y126.807 I-4.447 J3.872 E.00579
; LINE_WIDTH: 0.158115
G1 X120.075 Y126.72 E.00138
; LINE_WIDTH: 0.188807
G1 X119.957 Y126.633 E.00174
G1 X119.47 Y126.548 F30000
; LINE_WIDTH: 0.164729
G1 F5262
G1 X119.317 Y126.472 E.0017
G1 X119.168 Y126.532 E.0016
; WIPE_START
G1 F24000
G1 X119.317 Y126.472 E-.3687
G1 X119.47 Y126.548 E-.3913
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.89 J-.83 P1  F30000
G1 X117.159 Y129.024 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.137289
G1 F5262
G1 X117.221 Y128.802 E.00177
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X117.159 Y129.024 E-.76
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
G3 Z7.4 I-1.046 J-.622 P1  F30000
G1 X116.563 Y130.027 Z7.4
G1 Z7.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X116.563 Y130.751 E.02225
G1 X115.709 Y130.751 E.02627
G1 X115.709 Y130.027 E.02225
G1 X116.503 Y130.027 E.02443
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.563 Y130.751 E-.27614
G1 X115.709 Y130.751 E-.32488
G1 X115.709 Y130.333 E-.15898
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
G3 Z7.6 I.41 J1.146 P1  F30000
G1 X116.563 Y130.027 Z7.6
G1 Z7.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X116.563 Y130.751 E.02225
G1 X115.709 Y130.751 E.02627
G1 X115.709 Y130.027 E.02225
G1 X116.503 Y130.027 E.02443
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.563 Y130.751 E-.27614
G1 X115.709 Y130.751 E-.32488
G1 X115.709 Y130.333 E-.15898
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
G3 Z7.8 I.41 J1.146 P1  F30000
G1 X116.563 Y130.027 Z7.8
G1 Z7.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X116.563 Y130.751 E.02225
G1 X115.709 Y130.751 E.02627
G1 X115.709 Y130.027 E.02225
G1 X116.503 Y130.027 E.02443
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.563 Y130.751 E-.27614
G1 X115.709 Y130.751 E-.32488
G1 X115.709 Y130.333 E-.15898
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
G3 Z8 I.41 J1.146 P1  F30000
G1 X116.563 Y130.027 Z8
G1 Z7.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X116.563 Y130.751 E.02225
G1 X115.709 Y130.751 E.02627
G1 X115.709 Y130.027 E.02225
G1 X116.503 Y130.027 E.02443
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.563 Y130.751 E-.27614
G1 X115.709 Y130.751 E-.32488
G1 X115.709 Y130.333 E-.15898
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
G3 Z8.2 I.41 J1.146 P1  F30000
G1 X116.563 Y130.027 Z8.2
G1 Z8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X116.563 Y130.751 E.02225
G1 X115.709 Y130.751 E.02627
G1 X115.709 Y130.027 E.02225
G1 X116.503 Y130.027 E.02443
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X116.563 Y130.751 E-.27614
G1 X115.709 Y130.751 E-.32488
G1 X115.709 Y130.333 E-.15898
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

