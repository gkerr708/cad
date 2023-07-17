; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 7m 31s; total estimated time: 13m 20s
; total layer number: 49
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
M73 P0 R13
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
M73 P32 R8
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
M73 P33 R8
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
M73 P35 R8
G1 X76 F15000
M73 P37 R8
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
M73 P38 R8
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
    G29 A X125.75 Y115.35 I8.5 J29.3
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
M73 P39 R8
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
; layer num/total_layer_count: 1/49
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
G1 X130.35 Y114.85 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F2856
G1 X132.65 Y114.85 E.08567
G1 X132.65 Y141.15 E.97958
M73 P40 R8
G1 X130.35 Y141.15 E.08567
M73 P40 R7
G1 X130.35 Y114.91 E.97734
; WIPE_START
G1 F24000
G1 X132.349 Y114.858 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.002 J-1.217 P1  F30000
G1 X127.35 Y114.85 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2856
G1 X129.65 Y114.85 E.08567
M73 P41 R7
G1 X129.65 Y141.15 E.97958
G1 X127.35 Y141.15 E.08567
G1 X127.35 Y114.91 E.97734
G1 X126.893 Y114.85 F30000
; FEATURE: Inner wall
G1 F2856
G1 X126.893 Y141.793 E1.00352
G1 X126.607 Y141.793 E.01065
G1 X126.607 Y114.207 E1.02747
M73 P42 R7
G1 X126.893 Y114.207 E.01065
G1 X126.893 Y114.79 E.02171
; WIPE_START
G1 F24000
G1 X126.893 Y116.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.178 J.306 P1  F30000
G1 X133.393 Y141.793 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2856
G1 X133.107 Y141.793 E.01065
G1 X133.107 Y114.207 E1.02747
G1 X133.393 Y114.207 E.01065
G1 X133.393 Y141.733 E1.02523
G1 X133.85 Y142.25 F30000
; FEATURE: Outer wall
G1 F2856
G1 X126.15 Y142.25 E.2868
G1 X126.15 Y113.75 E1.06152
G1 X133.85 Y113.75 E.2868
G1 X133.85 Y142.19 E1.05928
; WIPE_START
M73 P43 R7
G1 F24000
G1 X131.85 Y142.206 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.537 J1.092 P1  F30000
G1 X132.879 Y141.7 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.686517
G1 F2856
G1 X130.121 Y141.7 E.14459
G1 X130 Y141.689 E.0064
G1 X130 Y141.654 E.00181
; LINE_WIDTH: 0.6148
G1 X130 Y141.62 E.00161
; LINE_WIDTH: 0.567806
G1 X130 Y141.585 E.00147
; LINE_WIDTH: 0.520812
G1 X130 Y141.551 E.00134
; LINE_WIDTH: 0.473818
G1 X130 Y141.516 E.00121
; LINE_WIDTH: 0.426824
G1 X130 Y141.482 E.00108
; LINE_WIDTH: 0.37983
G1 X130 Y141.447 E.00095
; LINE_WIDTH: 0.332836
G1 X130 Y141.413 E.00081
; LINE_WIDTH: 0.285842
G1 X130 Y141.379 E.00068
; LINE_WIDTH: 0.285903
G1 X130 Y114.587 E.53047
; LINE_WIDTH: 0.37983
G1 X130 Y114.553 E.00095
; LINE_WIDTH: 0.426824
G1 X130 Y114.518 E.00108
; LINE_WIDTH: 0.473818
G1 X130 Y114.484 E.00121
; LINE_WIDTH: 0.520812
G1 X130 Y114.449 E.00134
; LINE_WIDTH: 0.567806
G1 X130 Y114.415 E.00147
; LINE_WIDTH: 0.6148
G1 X130 Y114.38 E.00161
; LINE_WIDTH: 0.661793
G1 X130 Y114.346 E.00174
; LINE_WIDTH: 0.708787
G1 X130 Y114.311 E.00187
; LINE_WIDTH: 0.68584
G1 X132.879 Y114.3 E.15081
; WIPE_START
G1 F24000
M73 P44 R7
G1 X130.879 Y114.308 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.005 J-1.217 P1  F30000
G1 X130 Y114.311 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.686813
G1 F2856
G1 X127.121 Y114.3 E.15104
; WIPE_START
G1 F24000
G1 X129.121 Y114.308 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.214 J-.089 P1  F30000
G1 X127.121 Y141.7 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.686815
G1 F2856
G1 X130 Y141.689 E.15104
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128 Y141.696 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/49
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
G3 Z.6 I1.213 J.098 P1  F30000
G1 X130.148 Y115.04 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.203 J.187 P1  F30000
G1 X133.648 Y142.048 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
M73 P45 R7
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y113.952 E.93199
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y141.988 E.93
G1 X134.04 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.56 E.8874
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.38 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X132.04 Y142.395 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.647 J1.031 P1  F30000
G1 X133.241 Y141.641 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3496
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.359 E.86439
; LINE_WIDTH: 0.410762
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.247 Y141.581 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.179 Y141.66 E-.03978
G1 X133.117 Y141.68 E-.02462
G1 X133.056 Y141.7 E-.02462
G1 X131.29 Y141.7 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/49
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
G3 Z.8 I1.216 J-.052 P1  F30000
G1 X130.148 Y115.04 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X129.46 Y115.04 E.059
M73 P46 R7
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.203 J.187 P1  F30000
G1 X133.648 Y142.048 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y113.952 E.93199
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y141.988 E.93
G1 X134.04 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.56 E.8874
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.38 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X132.04 Y142.395 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.647 J1.031 P1  F30000
G1 X133.241 Y141.641 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3496
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.359 E.86439
; LINE_WIDTH: 0.410762
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.247 Y141.581 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.179 Y141.66 E-.03978
G1 X133.117 Y141.68 E-.02462
G1 X133.056 Y141.7 E-.02462
G1 X131.29 Y141.7 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/49
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
G3 Z1 I1.216 J-.052 P1  F30000
G1 X130.148 Y115.04 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.018 J-1.217 P1  F30000
M73 P47 R7
G1 X127.148 Y115.04 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.203 J.187 P1  F30000
G1 X133.648 Y142.048 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y113.952 E.93199
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y141.988 E.93
G1 X134.04 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.56 E.8874
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.38 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X132.04 Y142.395 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.647 J1.031 P1  F30000
G1 X133.241 Y141.641 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3496
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.359 E.86439
; LINE_WIDTH: 0.410762
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.247 Y141.581 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P47 R6
G1 F24000
G1 X133.179 Y141.66 E-.03978
G1 X133.117 Y141.68 E-.02462
G1 X133.056 Y141.7 E-.02462
G1 X131.29 Y141.7 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/49
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
G3 Z1.2 I1.216 J-.052 P1  F30000
G1 X130.148 Y115.04 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
M73 P48 R6
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.203 J.187 P1  F30000
G1 X133.648 Y142.048 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y113.952 E.93199
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y141.988 E.93
G1 X134.04 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.56 E.8874
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.38 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X132.04 Y142.395 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.647 J1.031 P1  F30000
G1 X133.241 Y141.641 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3496
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.359 E.86439
; LINE_WIDTH: 0.410762
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.247 Y141.581 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.179 Y141.66 E-.03978
G1 X133.117 Y141.68 E-.02462
G1 X133.056 Y141.7 E-.02462
G1 X131.29 Y141.7 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/49
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
G3 Z1.4 I1.216 J-.052 P1  F30000
G1 X130.148 Y115.04 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
M73 P49 R6
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.203 J.187 P1  F30000
G1 X133.648 Y142.048 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y113.952 E.93199
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y141.988 E.93
G1 X134.04 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.56 E.8874
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.38 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X132.04 Y142.395 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.647 J1.031 P1  F30000
G1 X133.241 Y141.641 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3496
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.359 E.86439
; LINE_WIDTH: 0.410762
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.247 Y141.581 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.179 Y141.66 E-.03978
G1 X133.117 Y141.68 E-.02462
G1 X133.056 Y141.7 E-.02462
G1 X131.29 Y141.7 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/49
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
G3 Z1.6 I1.216 J-.052 P1  F30000
G1 X130.148 Y115.04 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
M73 P50 R6
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.203 J.187 P1  F30000
G1 X133.648 Y142.048 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y113.952 E.93199
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y141.988 E.93
G1 X134.04 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.56 E.8874
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.38 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X132.04 Y142.395 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.647 J1.031 P1  F30000
G1 X133.241 Y141.641 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3496
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.359 E.86439
; LINE_WIDTH: 0.410762
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.247 Y141.581 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.179 Y141.66 E-.03978
G1 X133.117 Y141.68 E-.02462
G1 X133.056 Y141.7 E-.02462
G1 X131.29 Y141.7 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/49
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
M73 P51 R6
G3 Z1.8 I1.216 J-.052 P1  F30000
G1 X130.148 Y115.04 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.203 J.187 P1  F30000
G1 X133.648 Y142.048 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y113.952 E.93199
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y141.988 E.93
G1 X134.04 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.56 E.8874
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.38 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X132.04 Y142.395 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.647 J1.031 P1  F30000
G1 X133.241 Y141.641 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3496
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.359 E.86439
; LINE_WIDTH: 0.410762
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.247 Y141.581 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.179 Y141.66 E-.03978
M73 P52 R6
G1 X133.117 Y141.68 E-.02462
G1 X133.056 Y141.7 E-.02462
G1 X131.29 Y141.7 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/49
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
G3 Z2 I1.216 J-.052 P1  F30000
G1 X130.148 Y115.04 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.203 J.187 P1  F30000
G1 X133.648 Y142.048 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y113.952 E.93199
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y141.988 E.93
G1 X134.04 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.56 E.8874
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.38 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X132.04 Y142.395 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.647 J1.031 P1  F30000
G1 X133.241 Y141.641 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3496
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.359 E.86439
; LINE_WIDTH: 0.410762
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.247 Y141.581 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P53 R6
G1 F24000
G1 X133.179 Y141.66 E-.03978
G1 X133.117 Y141.68 E-.02462
G1 X133.056 Y141.7 E-.02462
G1 X131.29 Y141.7 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/49
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
G3 Z2.2 I1.216 J-.052 P1  F30000
G1 X130.148 Y115.04 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.203 J.187 P1  F30000
G1 X133.648 Y142.048 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y113.952 E.93199
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y141.988 E.93
G1 X134.04 Y142.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.56 E.8874
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.38 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X132.04 Y142.395 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.647 J1.031 P1  F30000
G1 X133.241 Y141.641 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431693
G1 F3496
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
M73 P54 R6
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.359 E.86439
; LINE_WIDTH: 0.410762
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.247 Y141.581 E.00081
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.179 Y141.66 E-.03978
G1 X133.117 Y141.68 E-.02462
G1 X133.056 Y141.7 E-.02462
G1 X131.29 Y141.7 E-.67098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/49
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
G3 Z2.4 I1.216 J-.052 P1  F30000
G1 X130.148 Y115.04 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3393
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3393
G1 X127.148 Y126.822 E.40384
G1 X126.352 Y126.822 E.0264
G1 X126.352 Y113.952 E.42693
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y128.878 E.43688
G1 X127.148 Y128.878 E.0264
G1 X127.148 Y141.352 E.4138
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X127.54 Y127.214 E.37408
G1 X125.96 Y127.214 E.04855
G1 X125.96 Y113.56 E.41956
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y128.486 E.42878
G1 X127.54 Y128.486 E.04855
G1 X127.54 Y140.96 E.3833
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3393
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
M73 P55 R6
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y129.081 E.39787
; WIPE_START
M73 P55 R5
G1 F24000
G1 X126.751 Y131.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.217 J0 P1  F30000
G1 X126.75 Y126.619 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.431704
G1 F3393
G1 X126.75 Y114.444 E.38569
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/49
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
G3 Z2.6 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3325
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3325
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3325
G1 X127.148 Y126.206 E.38341
G1 X126.352 Y126.206 E.0264
G1 X126.352 Y113.952 E.40649
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y129.494 E.41644
G1 X127.148 Y129.494 E.0264
G1 X127.148 Y141.352 E.39336
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3325
G1 X127.54 Y126.598 E.35515
G1 X125.96 Y126.598 E.04855
G1 X125.96 Y113.56 E.40063
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y129.102 E.40985
G1 X127.54 Y129.102 E.04855
G1 X127.54 Y140.96 E.36437
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3325
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
M73 P56 R5
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y129.697 E.37836
; WIPE_START
G1 F24000
G1 X126.752 Y131.697 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.217 J0 P1  F30000
G1 X126.75 Y126.003 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.431705
G1 F3325
G1 X126.75 Y114.444 E.36618
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/49
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
G3 Z2.8 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3297
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3297
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3297
G1 X127.148 Y125.838 E.37119
G1 X126.352 Y125.838 E.0264
G1 X126.352 Y113.952 E.39427
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y129.862 E.40422
G1 X127.148 Y129.862 E.0264
G1 X127.148 Y141.352 E.38114
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3297
G1 X127.54 Y126.23 E.34383
G1 X125.96 Y126.23 E.04855
G1 X125.96 Y113.56 E.38931
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
M73 P57 R5
G1 X125.96 Y129.47 E.39853
G1 X127.54 Y129.47 E.04855
G1 X127.54 Y140.96 E.35305
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3297
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y130.066 E.36669
; WIPE_START
G1 F24000
G1 X126.752 Y132.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.217 J0 P1  F30000
G1 X126.75 Y125.634 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.431705
G1 F3297
G1 X126.75 Y114.444 E.35451
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/49
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
G3 Z3 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3280
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3280
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3280
G1 X127.148 Y125.612 E.3637
G1 X126.352 Y125.612 E.0264
G1 X126.352 Y113.952 E.38678
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.088 E.39673
M73 P58 R5
G1 X127.148 Y130.088 E.0264
G1 X127.148 Y141.352 E.37365
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3280
G1 X127.54 Y126.004 E.3369
G1 X125.96 Y126.004 E.04855
G1 X125.96 Y113.56 E.38237
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y129.696 E.39159
G1 X127.54 Y129.696 E.04855
G1 X127.54 Y140.96 E.34611
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3280
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y130.292 E.35953
; WIPE_START
G1 F24000
G1 X126.752 Y132.292 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.217 J0 P1  F30000
G1 X126.75 Y125.408 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.431706
G1 F3280
G1 X126.75 Y114.444 E.34735
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/49
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
G3 Z3.2 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3264
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3264
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z3.4
G1 Z3
M73 P59 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3264
G1 X127.148 Y125.397 E.35657
G1 X126.352 Y125.397 E.0264
G1 X126.352 Y113.952 E.37965
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.303 E.3896
G1 X127.148 Y130.303 E.0264
G1 X127.148 Y141.352 E.36652
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3264
G1 X127.54 Y125.789 E.33029
G1 X125.96 Y125.789 E.04855
G1 X125.96 Y113.56 E.37577
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y129.911 E.38499
G1 X127.54 Y129.911 E.04855
G1 X127.54 Y140.96 E.33951
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3264
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y130.506 E.35272
; WIPE_START
G1 F24000
G1 X126.752 Y132.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J0 P1  F30000
G1 X126.75 Y125.194 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.431706
G1 F3264
G1 X126.75 Y114.444 E.34054
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/49
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
G3 Z3.4 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3254
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3254
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
M73 P60 R5
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3254
G1 X127.148 Y125.259 E.35199
G1 X126.352 Y125.259 E.0264
G1 X126.352 Y113.952 E.37507
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.441 E.38502
G1 X127.148 Y130.441 E.0264
G1 X127.148 Y141.352 E.36194
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3254
G1 X127.54 Y125.651 E.32605
G1 X125.96 Y125.651 E.04855
G1 X125.96 Y113.56 E.37153
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.049 E.38074
G1 X127.54 Y130.049 E.04855
G1 X127.54 Y140.96 E.33527
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3254
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y130.645 E.34835
; WIPE_START
G1 F24000
G1 X126.752 Y132.645 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.217 J0 P1  F30000
G1 X126.75 Y125.055 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.431706
G1 F3254
G1 X126.75 Y114.444 E.33617
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/49
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
G3 Z3.6 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3244
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3244
G1 X132.46 Y115.04 E.059
M73 P61 R5
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3244
G1 X127.148 Y125.121 E.34741
G1 X126.352 Y125.121 E.0264
G1 X126.352 Y113.952 E.37049
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.579 E.38044
G1 X127.148 Y130.579 E.0264
G1 X127.148 Y141.352 E.35736
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3244
G1 X127.54 Y125.513 E.32181
G1 X125.96 Y125.513 E.04855
G1 X125.96 Y113.56 E.36728
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.187 E.3765
G1 X127.54 Y130.187 E.04855
G1 X127.54 Y140.96 E.33103
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3244
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y130.783 E.34398
; WIPE_START
G1 F24000
G1 X126.752 Y132.783 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.217 J0 P1  F30000
G1 X126.75 Y124.917 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3244
G1 X126.75 Y114.444 E.3318
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/49
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
G3 Z3.8 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3236
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3236
M73 P62 R5
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3236
G1 X127.148 Y125.026 E.34426
G1 X126.352 Y125.026 E.0264
G1 X126.352 Y113.952 E.36734
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.674 E.37729
G1 X127.148 Y130.674 E.0264
G1 X127.148 Y141.352 E.35421
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3236
G1 X127.54 Y125.418 E.31889
G1 X125.96 Y125.418 E.04855
G1 X125.96 Y113.56 E.36437
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.282 E.37358
G1 X127.54 Y130.282 E.04855
G1 X127.54 Y140.96 E.32811
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3236
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
M73 P62 R4
G1 X126.75 Y130.878 E.34097
; WIPE_START
G1 F24000
G1 X126.752 Y132.878 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.217 J0 P1  F30000
G1 X126.75 Y124.822 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3236
G1 X126.75 Y114.444 E.32879
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/49
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
G3 Z4 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3231
M73 P63 R4
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3231
G1 X127.148 Y124.95 E.34174
G1 X126.352 Y124.95 E.0264
G1 X126.352 Y113.952 E.36483
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.75 E.37478
G1 X127.148 Y130.75 E.0264
G1 X127.148 Y141.352 E.3517
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3231
G1 X127.54 Y125.342 E.31656
G1 X125.96 Y125.342 E.04855
G1 X125.96 Y113.56 E.36204
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.358 E.37125
G1 X127.54 Y130.358 E.04855
G1 X127.54 Y140.96 E.32578
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3231
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y130.953 E.33857
; WIPE_START
G1 F24000
G1 X126.752 Y132.953 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.217 J0 P1  F30000
G1 X126.75 Y124.747 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3231
G1 X126.75 Y114.444 E.32639
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/49
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
G3 Z4.2 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z4.2
G1 Z4
M73 P64 R4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3225
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3225
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3225
G1 X127.148 Y124.874 E.33923
G1 X126.352 Y124.874 E.0264
G1 X126.352 Y113.952 E.36231
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.826 E.37226
G1 X127.148 Y130.826 E.0264
G1 X127.148 Y141.352 E.34918
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3225
G1 X127.54 Y125.266 E.31423
G1 X125.96 Y125.266 E.04855
G1 X125.96 Y113.56 E.3597
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.434 E.36892
G1 X127.54 Y130.434 E.04855
G1 X127.54 Y140.96 E.32345
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3225
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y131.029 E.33616
; WIPE_START
G1 F24000
G1 X126.752 Y133.029 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.217 J0 P1  F30000
G1 X126.75 Y124.671 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3225
G1 X126.75 Y114.444 E.32398
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
M73 P65 R4
G1 E-.04 F1800
; layer num/total_layer_count: 21/49
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
G3 Z4.4 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3223
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3223
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3223
G1 X127.148 Y124.846 E.33831
G1 X126.352 Y124.846 E.0264
G1 X126.352 Y113.952 E.36139
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.854 E.37134
G1 X127.148 Y130.854 E.0264
G1 X127.148 Y141.352 E.34826
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3223
G1 X127.54 Y125.239 E.31337
G1 X125.96 Y125.239 E.04855
G1 X125.96 Y113.56 E.35885
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.461 E.36807
G1 X127.54 Y130.461 E.04855
G1 X127.54 Y140.96 E.32259
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3223
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y131.057 E.33528
; WIPE_START
G1 F24000
G1 X126.752 Y133.057 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.217 J0 P1  F30000
G1 X126.75 Y124.643 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3223
G1 X126.75 Y114.444 E.3231
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P66 R4
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/49
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
G3 Z4.6 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3221
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3221
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3221
G1 X127.148 Y124.822 E.3375
G1 X126.352 Y124.822 E.0264
G1 X126.352 Y113.952 E.36058
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.878 E.37053
G1 X127.148 Y130.878 E.0264
G1 X127.148 Y141.352 E.34745
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3221
G1 X127.54 Y125.214 E.31263
G1 X125.96 Y125.214 E.04855
G1 X125.96 Y113.56 E.3581
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.486 E.36732
G1 X127.54 Y130.486 E.04855
G1 X127.54 Y140.96 E.32185
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3221
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y131.081 E.33451
; WIPE_START
G1 F24000
M73 P67 R4
G1 X126.752 Y133.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.217 J0 P1  F30000
G1 X126.75 Y124.619 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3221
G1 X126.75 Y114.444 E.32233
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/49
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
G3 Z4.8 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3219
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3219
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3219
G1 X127.148 Y124.798 E.33669
G1 X126.352 Y124.798 E.0264
G1 X126.352 Y113.952 E.35978
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.902 E.36973
G1 X127.148 Y130.902 E.0264
G1 X127.148 Y141.352 E.34665
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3219
G1 X127.54 Y125.19 E.31188
G1 X125.96 Y125.19 E.04855
G1 X125.96 Y113.56 E.35736
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.51 E.36658
G1 X127.54 Y130.51 E.04855
G1 X127.54 Y140.96 E.3211
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3219
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
M73 P68 R4
G1 X126.75 Y131.106 E.33374
; WIPE_START
G1 F24000
G1 X126.752 Y133.106 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.217 J0 P1  F30000
G1 X126.75 Y124.594 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3219
G1 X126.75 Y114.444 E.32156
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/49
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
G3 Z5 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3221
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3221
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3221
G1 X127.148 Y124.822 E.3375
G1 X126.352 Y124.822 E.0264
G1 X126.352 Y113.952 E.36058
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.878 E.37053
G1 X127.148 Y130.878 E.0264
G1 X127.148 Y141.352 E.34745
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3221
G1 X127.54 Y125.214 E.31263
G1 X125.96 Y125.214 E.04855
G1 X125.96 Y113.56 E.3581
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.486 E.36732
G1 X127.54 Y130.486 E.04855
G1 X127.54 Y140.96 E.32185
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3221
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
M73 P69 R4
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y131.081 E.33451
; WIPE_START
G1 F24000
G1 X126.752 Y133.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.217 J0 P1  F30000
G1 X126.75 Y124.619 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3221
G1 X126.75 Y114.444 E.32233
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/49
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
G3 Z5.2 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3223
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3223
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3223
G1 X127.148 Y124.846 E.33831
G1 X126.352 Y124.846 E.0264
G1 X126.352 Y113.952 E.36139
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.854 E.37134
G1 X127.148 Y130.854 E.0264
G1 X127.148 Y141.352 E.34826
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3223
G1 X127.54 Y125.239 E.31337
G1 X125.96 Y125.239 E.04855
G1 X125.96 Y113.56 E.35885
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.461 E.36807
G1 X127.54 Y130.461 E.04855
G1 X127.54 Y140.96 E.32259
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3223
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
M73 P70 R4
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
M73 P70 R3
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y131.057 E.33528
; WIPE_START
G1 F24000
G1 X126.752 Y133.057 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.217 J0 P1  F30000
G1 X126.75 Y124.643 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3223
G1 X126.75 Y114.444 E.3231
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/49
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
G3 Z5.4 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3225
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3225
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3225
G1 X127.148 Y124.874 E.33923
G1 X126.352 Y124.874 E.0264
G1 X126.352 Y113.952 E.36231
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.826 E.37226
G1 X127.148 Y130.826 E.0264
G1 X127.148 Y141.352 E.34918
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3225
G1 X127.54 Y125.266 E.31423
G1 X125.96 Y125.266 E.04855
G1 X125.96 Y113.56 E.3597
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
M73 P71 R3
G1 X125.96 Y130.434 E.36892
G1 X127.54 Y130.434 E.04855
G1 X127.54 Y140.96 E.32345
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3225
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y131.029 E.33616
; WIPE_START
G1 F24000
G1 X126.752 Y133.029 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.217 J0 P1  F30000
G1 X126.75 Y124.671 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3225
G1 X126.75 Y114.444 E.32398
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/49
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
G3 Z5.6 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3236
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3236
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3236
G1 X127.148 Y124.95 E.34174
G1 X126.352 Y124.95 E.0264
M73 P72 R3
G1 X126.352 Y113.952 E.36483
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.75 E.37478
G1 X127.148 Y130.75 E.0264
G1 X127.148 Y141.352 E.3517
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3236
G1 X127.54 Y125.307 E.31549
G1 X127.54 Y125.342 E.00107
G1 X125.96 Y125.342 E.04855
G1 X125.96 Y125.307 E.00107
G1 X125.96 Y113.56 E.36096
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.393 E.37018
G1 X125.96 Y130.358 E.00107
G1 X127.54 Y130.358 E.04855
G1 X127.54 Y130.393 E.00107
G1 X127.54 Y140.96 E.32471
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3236
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y130.953 E.33857
; WIPE_START
G1 F24000
G1 X126.752 Y132.953 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J0 P1  F30000
G1 X126.75 Y124.747 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3236
G1 X126.75 Y114.444 E.32639
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/49
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
G3 Z5.8 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3242
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3242
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.108 J-1.212 P1  F30000
M73 P73 R3
G1 X127.148 Y114.648 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3242
G1 X127.148 Y125.026 E.34426
G1 X126.352 Y125.026 E.0264
G1 X126.352 Y113.952 E.36734
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.674 E.37729
G1 X127.148 Y130.674 E.0264
G1 X127.148 Y141.352 E.35421
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3242
G1 X127.54 Y125.383 E.31782
G1 X127.54 Y125.418 E.00107
G1 X125.96 Y125.418 E.04855
G1 X125.96 Y125.383 E.00107
G1 X125.96 Y113.56 E.36329
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.317 E.37251
G1 X125.96 Y130.282 E.00107
G1 X127.54 Y130.282 E.04855
G1 X127.54 Y130.317 E.00107
G1 X127.54 Y140.96 E.32704
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3242
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y130.878 E.34097
; WIPE_START
G1 F24000
G1 X126.752 Y132.878 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.217 J0 P1  F30000
G1 X126.75 Y124.822 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3242
G1 X126.75 Y114.444 E.32879
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/49
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
G3 Z6 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3249
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3249
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
M73 P74 R3
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3249
G1 X127.148 Y125.121 E.34741
G1 X126.352 Y125.121 E.0264
G1 X126.352 Y113.952 E.37049
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.579 E.38044
G1 X127.148 Y130.579 E.0264
G1 X127.148 Y141.352 E.35736
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3249
G1 X127.54 Y125.459 E.32015
G1 X127.54 Y125.513 E.00166
G1 X125.96 Y125.513 E.04855
G1 X125.96 Y125.459 E.00166
G1 X125.96 Y113.56 E.36563
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.241 E.37484
G1 X125.96 Y130.187 E.00166
G1 X127.54 Y130.187 E.04855
G1 X127.54 Y130.241 E.00166
G1 X127.54 Y140.96 E.32937
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3249
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y130.783 E.34398
; WIPE_START
G1 F24000
G1 X126.752 Y132.783 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.217 J0 P1  F30000
G1 X126.75 Y124.917 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.431707
G1 F3249
G1 X126.75 Y114.444 E.3318
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/49
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
G3 Z6.2 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3262
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3262
M73 P75 R3
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3262
G1 X127.148 Y125.259 E.35199
G1 X126.352 Y125.259 E.0264
G1 X126.352 Y113.952 E.37507
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.441 E.38502
G1 X127.148 Y130.441 E.0264
G1 X127.148 Y141.352 E.36194
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3262
G1 X127.54 Y125.636 E.32559
G1 F3000
G1 X127.54 Y125.651 E.00046
G1 X125.96 Y125.651 E.04855
G1 X125.96 Y125.636 E.00046
G1 F3262
G1 X125.96 Y125.554 E.00252
G1 X125.96 Y113.56 E.36854
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y130.064 E.38028
G1 F3000
G1 X125.96 Y130.049 E.00046
G1 X127.54 Y130.049 E.04855
G1 X127.54 Y130.064 E.00046
G1 F3262
G1 X127.54 Y140.96 E.3348
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3262
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y130.645 E.34835
; WIPE_START
G1 F24000
G1 X126.752 Y132.645 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.217 J0 P1  F30000
G1 X126.75 Y125.055 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.431706
G1 F3262
G1 X126.75 Y114.444 E.33617
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/49
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
G3 Z6.4 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3273
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
M73 P76 R3
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3273
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3273
G1 X127.148 Y125.397 E.35657
G1 X126.352 Y125.397 E.0264
G1 X126.352 Y113.952 E.37965
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.303 E.3896
G1 X127.148 Y130.303 E.0264
G1 X127.148 Y141.352 E.36652
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3273
G1 X127.54 Y125.774 E.32983
G1 F3000
G1 X127.54 Y125.789 E.00046
G1 X125.96 Y125.789 E.04855
G1 X125.96 Y125.774 E.00046
G1 F3273
G1 X125.96 Y125.692 E.00252
G1 X125.96 Y113.56 E.37279
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y129.926 E.38452
G1 F3000
G1 X125.96 Y129.911 E.00046
G1 X127.54 Y129.911 E.04855
G1 X127.54 Y129.926 E.00046
G1 F3273
G1 X127.54 Y140.96 E.33905
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3273
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y130.506 E.35272
; WIPE_START
G1 F24000
G1 X126.752 Y132.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.217 J0 P1  F30000
G1 X126.75 Y125.194 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.431706
G1 F3273
G1 X126.75 Y114.444 E.34054
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P77 R3
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/49
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
G3 Z6.6 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3311
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3311
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3311
G1 X127.148 Y125.612 E.3637
G1 X126.352 Y125.612 E.0264
G1 X126.352 Y113.952 E.38678
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y130.088 E.39673
G1 X127.148 Y130.088 E.0264
G1 X127.148 Y141.352 E.37365
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3311
G1 X127.54 Y125.994 E.33659
M106 S255
G1 F1800
G1 X125.96 Y125.994 E.04855
M106 S252.45
G1 F3311
G1 X125.96 Y125.83 E.00504
G1 X125.96 Y113.56 E.37703
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y129.706 E.39128
M106 S255
G1 F1800
G1 X127.54 Y129.706 E.04855
M106 S252.45
G1 F3311
G1 X127.54 Y140.96 E.34581
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3311
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
M73 P77 R2
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y130.292 E.35953
; WIPE_START
G1 F24000
G1 X126.752 Y132.292 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J0 P1  F30000
G1 X126.75 Y125.408 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.431706
G1 F3311
G1 X126.75 Y114.444 E.34735
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
M73 P78 R2
G1 E-.04 F1800
; layer num/total_layer_count: 33/49
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
G3 Z6.8 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3329
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3329
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3329
G1 X127.148 Y125.838 E.37119
G1 X126.352 Y125.838 E.0264
G1 X126.352 Y113.952 E.39427
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y129.862 E.40422
G1 X127.148 Y129.862 E.0264
G1 X127.148 Y141.352 E.38114
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3329
G1 X127.54 Y126.209 E.34319
M106 S255
G1 F1800
G1 X127.54 Y126.23 E.00064
G1 X125.96 Y126.23 E.04855
G1 X125.96 Y126.209 E.00064
M106 S252.45
G1 F3329
G1 X125.96 Y126.045 E.00504
G1 X125.96 Y113.56 E.38363
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y129.491 E.39789
M106 S255
G1 F1800
G1 X125.96 Y129.47 E.00064
G1 X127.54 Y129.47 E.04855
G1 X127.54 Y129.491 E.00064
M106 S252.45
G1 F3329
G1 X127.54 Y140.96 E.35241
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3329
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y130.066 E.36669
; WIPE_START
G1 F24000
G1 X126.752 Y132.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.217 J0 P1  F30000
G1 X126.75 Y125.634 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.431705
M73 P79 R2
G1 F3329
G1 X126.75 Y114.444 E.35451
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/49
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
G3 Z7 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3459
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3459
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3459
G1 X127.148 Y126.206 E.38341
G1 X126.352 Y126.206 E.0264
G1 X126.352 Y113.952 E.40649
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y129.494 E.41644
G1 X127.148 Y129.494 E.0264
G1 X127.148 Y141.352 E.39336
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3459
G1 X127.54 Y126.271 E.34509
G1 X127.54 Y126.517 E.00756
M106 S255
G1 F600
G1 X127.54 Y126.598 E.0025
G1 X125.96 Y126.598 E.04855
G1 X125.96 Y126.517 E.0025
M106 S252.45
G1 F3459
G1 X125.96 Y126.271 E.00756
G1 X125.96 Y113.56 E.39057
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y129.429 E.39979
G1 X125.96 Y129.183 E.00756
M106 S255
G1 F600
G1 X125.96 Y129.102 E.0025
G1 X127.54 Y129.102 E.04855
G1 X127.54 Y129.183 E.0025
M106 S252.45
G1 F3459
G1 X127.54 Y129.429 E.00756
G1 X127.54 Y140.96 E.35431
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3459
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y129.697 E.37836
; WIPE_START
G1 F24000
G1 X126.752 Y131.697 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P80 R2
G3 Z7.2 I1.217 J0 P1  F30000
G1 X126.75 Y126.003 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.431705
G1 F3459
G1 X126.75 Y114.444 E.36618
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/49
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
G3 Z7.2 I-.262 J1.188 P1  F30000
G1 X130.148 Y115.04 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3382
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3382
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.108 J-1.212 P1  F30000
G1 X127.148 Y114.648 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3382
G1 X127.148 Y126.822 E.40384
G1 X126.352 Y126.822 E.0264
G1 X126.352 Y126.626 E.00652
G1 X126.352 Y113.952 E.42041
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y128.878 E.43688
G1 X127.148 Y128.878 E.0264
G1 X127.148 Y141.352 E.4138
G1 X129.852 Y141.352 E.0897
G1 X129.852 Y114.648 E.88583
G1 X127.208 Y114.648 E.08771
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3382
G1 X127.54 Y127.008 E.36775
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X127.54 Y127.214 E.00684
G1 X125.96 Y127.214 E.05241
G1 X125.96 Y127.008 E.00684
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3382
G1 X125.96 Y126.639 E.01134
G1 X125.96 Y113.56 E.40189
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y128.692 E.42244
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X125.96 Y128.486 E.00684
G1 X127.54 Y128.486 E.05241
G1 X127.54 Y128.692 E.00684
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3382
G1 X127.54 Y140.96 E.37697
G1 X129.46 Y140.96 E.059
G1 X129.46 Y115.04 E.79645
G1 X127.6 Y115.04 E.05715
M204 S10000
G1 X126.944 Y114.3 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.332099
G1 F3382
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
M73 P81 R2
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431684
G1 X126.75 Y129.081 E.39787
; WIPE_START
G1 F24000
G1 X126.751 Y131.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.217 J0 P1  F30000
G1 X126.75 Y126.619 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.431704
G1 F3382
G1 X126.75 Y114.444 E.38569
G1 X126.759 Y114.359 E.00271
G1 X126.821 Y114.34 E.00205
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.883 Y114.32 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/49
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
G3 Z7.4 I-.946 J.765 P1  F30000
G1 X127.148 Y114.648 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3445
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y128.076 E.4404
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X127.148 Y127.624 E.01497
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F3445
G1 X127.148 Y127.242 E.01269
G1 X127.148 Y114.708 E.41577
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3445
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y128.076 E.3959
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X127.54 Y127.624 E.01497
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3445
G1 X127.54 Y127.255 E.01134
G1 X127.54 Y115.1 E.3735
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.487 J1.115 P1  F30000
G1 X130.54 Y114.648 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3445
G1 X132.852 Y114.648 E.0767
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y114.648 E.88583
G1 X130.48 Y114.648 E.01102
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3445
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.228 J-1.195 P1  F30000
G1 X126.352 Y113.952 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3445
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y128.076 E.46348
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X126.352 Y127.624 E.01497
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F3445
G1 X126.352 Y127.242 E.01269
G1 X126.352 Y114.012 E.43885
G1 X125.96 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3445
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y128.076 E.44137
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X125.96 Y127.624 E.01497
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3445
M73 P82 R2
G1 X125.96 Y127.255 E.01134
G1 X125.96 Y113.62 E.41897
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.647 J-1.031 P1  F30000
G1 X126.759 Y114.359 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3445
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.419 E.86249
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.821 Y114.34 E-.03832
G1 X126.883 Y114.32 E-.02462
G1 X126.944 Y114.3 E-.02462
G1 X128.714 Y114.3 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/49
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
G3 Z7.6 I-.558 J1.081 P1  F30000
G1 X130.148 Y115.04 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.428 J-1.139 P1  F30000
G1 X126.352 Y113.952 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y114.012 E.93
G1 X125.96 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.647 J-1.031 P1  F30000
G1 X126.759 Y114.359 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
M73 P83 R2
G1 F3446
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.419 E.86249
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.821 Y114.34 E-.03832
G1 X126.883 Y114.32 E-.02462
G1 X126.944 Y114.3 E-.02462
G1 X128.714 Y114.3 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/49
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
G3 Z7.8 I-.558 J1.081 P1  F30000
G1 X130.148 Y115.04 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.428 J-1.139 P1  F30000
G1 X126.352 Y113.952 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y114.012 E.93
G1 X125.96 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.647 J-1.031 P1  F30000
G1 X126.759 Y114.359 Z8
M73 P84 R2
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3446
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.419 E.86249
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.821 Y114.34 E-.03832
G1 X126.883 Y114.32 E-.02462
G1 X126.944 Y114.3 E-.02462
G1 X128.714 Y114.3 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/49
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
G3 Z8 I-.558 J1.081 P1  F30000
G1 X130.148 Y115.04 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.428 J-1.139 P1  F30000
G1 X126.352 Y113.952 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X133.648 Y113.952 E.24202
M73 P85 R2
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y114.012 E.93
G1 X125.96 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.647 J-1.031 P1  F30000
G1 X126.759 Y114.359 Z8.2
M73 P85 R1
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3446
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.419 E.86249
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.821 Y114.34 E-.03832
G1 X126.883 Y114.32 E-.02462
G1 X126.944 Y114.3 E-.02462
G1 X128.714 Y114.3 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/49
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
G3 Z8.2 I-.558 J1.081 P1  F30000
G1 X130.148 Y115.04 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
M73 P86 R1
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.428 J-1.139 P1  F30000
G1 X126.352 Y113.952 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y114.012 E.93
G1 X125.96 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.647 J-1.031 P1  F30000
G1 X126.759 Y114.359 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3446
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.419 E.86249
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.821 Y114.34 E-.03832
G1 X126.883 Y114.32 E-.02462
G1 X126.944 Y114.3 E-.02462
G1 X128.714 Y114.3 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/49
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
G3 Z8.4 I-.558 J1.081 P1  F30000
G1 X130.148 Y115.04 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.018 J-1.217 P1  F30000
M73 P87 R1
G1 X127.148 Y115.04 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.428 J-1.139 P1  F30000
G1 X126.352 Y113.952 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y114.012 E.93
G1 X125.96 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.647 J-1.031 P1  F30000
G1 X126.759 Y114.359 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3446
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.419 E.86249
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.821 Y114.34 E-.03832
G1 X126.883 Y114.32 E-.02462
G1 X126.944 Y114.3 E-.02462
G1 X128.714 Y114.3 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/49
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
G3 Z8.6 I-.558 J1.081 P1  F30000
G1 X130.148 Y115.04 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
M73 P88 R1
G1 E-.04 F1800
G17
G3 Z8.8 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.428 J-1.139 P1  F30000
G1 X126.352 Y113.952 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y114.012 E.93
G1 X125.96 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.647 J-1.031 P1  F30000
G1 X126.759 Y114.359 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3446
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.419 E.86249
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X126.821 Y114.34 E-.03832
G1 X126.883 Y114.32 E-.02462
G1 X126.944 Y114.3 E-.02462
G1 X128.714 Y114.3 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/49
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
G3 Z8.8 I-.558 J1.081 P1  F30000
G1 X130.148 Y115.04 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
M73 P89 R1
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.428 J-1.139 P1  F30000
G1 X126.352 Y113.952 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y114.012 E.93
G1 X125.96 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.647 J-1.031 P1  F30000
G1 X126.759 Y114.359 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3446
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.419 E.86249
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.821 Y114.34 E-.03832
G1 X126.883 Y114.32 E-.02462
G1 X126.944 Y114.3 E-.02462
G1 X128.714 Y114.3 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/49
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
G3 Z9 I-.558 J1.081 P1  F30000
G1 X130.148 Y115.04 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X132.46 Y115.04 E.059
M73 P90 R1
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.428 J-1.139 P1  F30000
G1 X126.352 Y113.952 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y114.012 E.93
G1 X125.96 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.647 J-1.031 P1  F30000
G1 X126.759 Y114.359 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3446
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.419 E.86249
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.821 Y114.34 E-.03832
G1 X126.883 Y114.32 E-.02462
G1 X126.944 Y114.3 E-.02462
G1 X128.714 Y114.3 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/49
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
G3 Z9.2 I-.558 J1.081 P1  F30000
G1 X130.148 Y115.04 Z9.2
M73 P91 R1
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.428 J-1.139 P1  F30000
G1 X126.352 Y113.952 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y114.012 E.93
G1 X125.96 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.647 J-1.031 P1  F30000
G1 X126.759 Y114.359 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3446
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.419 E.86249
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.821 Y114.34 E-.03832
G1 X126.883 Y114.32 E-.02462
G1 X126.944 Y114.3 E-.02462
G1 X128.714 Y114.3 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/49
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
M73 P92 R1
G3 Z9.4 I-.558 J1.081 P1  F30000
G1 X130.148 Y115.04 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.428 J-1.139 P1  F30000
G1 X126.352 Y113.952 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X133.648 Y113.952 E.24202
M73 P92 R0
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y114.012 E.93
G1 X125.96 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.647 J-1.031 P1  F30000
G1 X126.759 Y114.359 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3446
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.419 E.86249
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.821 Y114.34 E-.03832
M73 P93 R0
G1 X126.883 Y114.32 E-.02462
G1 X126.944 Y114.3 E-.02462
G1 X128.714 Y114.3 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/49
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
G3 Z9.6 I-.558 J1.081 P1  F30000
G1 X130.148 Y115.04 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.428 J-1.139 P1  F30000
G1 X126.352 Y113.952 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y114.012 E.93
G1 X125.96 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.647 J-1.031 P1  F30000
G1 X126.759 Y114.359 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3446
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
M73 P94 R0
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.419 E.86249
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X126.821 Y114.34 E-.03832
G1 X126.883 Y114.32 E-.02462
G1 X126.944 Y114.3 E-.02462
G1 X128.714 Y114.3 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/49
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
G3 Z9.8 I-.558 J1.081 P1  F30000
G1 X130.148 Y115.04 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X130.148 Y114.648 E.01301
G1 X132.852 Y114.648 E.0897
G1 X132.852 Y141.352 E.88583
G1 X130.148 Y141.352 E.0897
G1 X130.148 Y115.1 E.87083
G1 X130.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.018 J-1.217 P1  F30000
G1 X127.148 Y115.04 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X127.148 Y114.648 E.01301
G1 X129.852 Y114.648 E.0897
G1 X129.852 Y141.352 E.88583
G1 X127.148 Y141.352 E.0897
G1 X127.148 Y115.1 E.87083
G1 X127.54 Y115.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.428 J-1.139 P1  F30000
G1 X126.352 Y113.952 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3446
G1 X133.648 Y113.952 E.24202
G1 X133.648 Y142.048 E.93199
G1 X126.352 Y142.048 E.24202
G1 X126.352 Y114.012 E.93
G1 X125.96 Y113.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3446
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.647 J-1.031 P1  F30000
G1 X126.759 Y114.359 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.410762
G1 F3446
G1 X126.821 Y114.34 E.00194
; LINE_WIDTH: 0.371223
G1 X126.883 Y114.32 E.00173
; LINE_WIDTH: 0.331684
G1 X126.944 Y114.3 E.00152
; LINE_WIDTH: 0.332099
G1 X133.056 Y114.3 E.14401
M73 P95 R0
G1 X133.117 Y114.32 E.00153
; LINE_WIDTH: 0.410763
G1 X133.179 Y114.34 E.00194
; LINE_WIDTH: 0.450302
G1 X133.241 Y114.359 E.00215
; LINE_WIDTH: 0.431693
G1 X133.25 Y141.556 E.86158
G1 X133.241 Y141.641 E.00271
G1 X133.179 Y141.66 E.00205
; LINE_WIDTH: 0.371223
G1 X133.117 Y141.68 E.00173
; LINE_WIDTH: 0.331684
G1 X133.056 Y141.7 E.00152
; LINE_WIDTH: 0.332099
G1 X126.944 Y141.7 E.14401
G1 X126.883 Y141.68 E.00153
; LINE_WIDTH: 0.410763
G1 X126.821 Y141.66 E.00194
; LINE_WIDTH: 0.450302
G1 X126.759 Y141.641 E.00215
; LINE_WIDTH: 0.431743
G1 X126.759 Y114.419 E.86249
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.821 Y114.34 E-.03832
G1 X126.883 Y114.32 E-.02462
G1 X126.944 Y114.3 E-.02462
G1 X128.714 Y114.3 E-.67245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/49
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
G3 Z10 I-.457 J1.128 P1  F30000
G1 X130.54 Y115.04 Z10
G1 Z9.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4344
G1 X132.46 Y115.04 E.059
G1 X132.46 Y140.96 E.79645
G1 X130.54 Y140.96 E.059
G1 X130.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.46 Y115.04 E-.72996
G1 X132.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.02 J-1.217 P1  F30000
G1 X127.54 Y115.04 Z10.2
G1 Z9.8
G1 E.8 F1800
M204 S5000
G1 F4344
G1 X129.46 Y115.04 E.059
G1 X129.46 Y140.96 E.79645
G1 X127.54 Y140.96 E.059
G1 X127.54 Y115.1 E.79461
M204 S10000
; WIPE_START
G1 F24000
G1 X129.46 Y115.04 E-.72996
G1 X129.46 Y115.119 E-.03004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.495 J-1.112 P1  F30000
G1 X125.96 Y113.56 Z10.2
G1 Z9.8
G1 E.8 F1800
M204 S5000
G1 F4344
G1 X134.04 Y113.56 E.24828
G1 X134.04 Y142.44 E.8874
G1 X125.96 Y142.44 E.24828
G1 X125.96 Y113.62 E.88556
M204 S10000
; WIPE_START
G1 F24000
G1 X127.96 Y113.605 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.184 J1.203 P1  F30000
G1 X133.833 Y114.501 Z10.2
G1 Z9.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F4344
G1 X133.099 Y113.767 E.0319
G1 X132.565 Y113.767
G1 X133.833 Y115.035 E.05507
G1 X133.833 Y115.568
G1 X132.032 Y113.767 E.07824
G1 X131.499 Y113.767
G1 X132.564 Y114.833 E.04629
G1 X132.031 Y114.833
G1 X130.966 Y113.767 E.04629
G1 X130.432 Y113.767
G1 X131.497 Y114.833 E.04629
G1 X130.964 Y114.833
G1 X129.899 Y113.767 E.04629
G1 X129.366 Y113.767
G1 X130.431 Y114.833 E.04629
G1 X130.333 Y115.268
G1 X128.832 Y113.767 E.06519
G1 X128.299 Y113.767
G1 X129.364 Y114.833 E.04629
G1 X128.831 Y114.833
G1 X127.766 Y113.767 E.04629
G1 X127.233 Y113.767
G1 X128.298 Y114.833 E.04629
M73 P96 R0
G1 X127.765 Y114.833
G1 X126.699 Y113.767 E.04629
G1 X126.167 Y113.769
G1 X127.333 Y114.934 E.05063
G1 X127.333 Y115.467
G1 X126.167 Y114.302 E.05063
G1 X126.167 Y114.835
G1 X127.333 Y116 E.05063
G1 X127.333 Y116.534
G1 X126.167 Y115.369 E.05063
G1 X126.167 Y115.902
G1 X127.333 Y117.067 E.05063
G1 X127.333 Y117.6
G1 X126.167 Y116.435 E.05063
G1 X126.167 Y116.968
G1 X127.333 Y118.134 E.05063
G1 X127.333 Y118.667
G1 X126.167 Y117.502 E.05063
G1 X126.167 Y118.035
G1 X127.333 Y119.2 E.05063
G1 X127.333 Y119.733
G1 X126.167 Y118.568 E.05063
G1 X126.167 Y119.101
G1 X127.333 Y120.267 E.05063
G1 X127.333 Y120.8
G1 X126.167 Y119.635 E.05063
G1 X126.167 Y120.168
G1 X127.333 Y121.333 E.05063
G1 X127.333 Y121.866
G1 X126.167 Y120.701 E.05063
G1 X126.167 Y121.234
G1 X127.333 Y122.4 E.05063
G1 X127.333 Y122.933
G1 X126.167 Y121.768 E.05063
G1 X126.167 Y122.301
G1 X127.333 Y123.466 E.05063
G1 X127.333 Y124
G1 X126.167 Y122.834 E.05063
G1 X126.167 Y123.368
G1 X127.333 Y124.533 E.05063
G1 X127.333 Y125.066
G1 X126.167 Y123.901 E.05063
G1 X126.167 Y124.434
G1 X127.333 Y125.599 E.05063
G1 X127.333 Y126.133
G1 X126.167 Y124.967 E.05063
G1 X126.167 Y125.501
G1 X127.333 Y126.666 E.05063
G1 X127.333 Y127.199
G1 X126.167 Y126.034 E.05063
G1 X126.167 Y126.567
G1 X127.333 Y127.732 E.05063
G1 X127.333 Y128.266
G1 X126.167 Y127.1 E.05063
G1 X126.167 Y127.634
G1 X127.333 Y128.799 E.05063
G1 X127.333 Y129.332
G1 X126.167 Y128.167 E.05063
G1 X126.167 Y128.7
G1 X127.333 Y129.865 E.05063
G1 X127.333 Y130.399
G1 X126.167 Y129.234 E.05063
G1 X126.167 Y129.767
G1 X127.333 Y130.932 E.05063
G1 X127.333 Y131.465
G1 X126.167 Y130.3 E.05063
G1 X126.167 Y130.833
G1 X127.333 Y131.999 E.05063
G1 X127.333 Y132.532
G1 X126.167 Y131.367 E.05063
G1 X126.167 Y131.9
G1 X127.333 Y133.065 E.05063
G1 X127.333 Y133.598
G1 X126.167 Y132.433 E.05063
G1 X126.167 Y132.966
G1 X127.333 Y134.132 E.05063
G1 X127.333 Y134.665
G1 X126.167 Y133.5 E.05063
G1 X126.167 Y134.033
G1 X127.333 Y135.198 E.05063
G1 X127.333 Y135.731
G1 X126.167 Y134.566 E.05063
G1 X126.167 Y135.1
G1 X127.333 Y136.265 E.05063
G1 X127.333 Y136.798
G1 X126.167 Y135.633 E.05063
G1 X126.167 Y136.166
G1 X127.333 Y137.331 E.05063
G1 X127.333 Y137.865
G1 X126.167 Y136.699 E.05063
G1 X126.167 Y137.233
G1 X127.333 Y138.398 E.05063
G1 X127.333 Y138.931
G1 X126.167 Y137.766 E.05063
G1 X126.167 Y138.299
G1 X127.333 Y139.464 E.05063
G1 X127.333 Y139.998
G1 X126.167 Y138.832 E.05063
G1 X126.167 Y139.366
G1 X127.333 Y140.531 E.05063
G1 X127.333 Y141.064
G1 X126.167 Y139.899 E.05063
M204 S10000
; WIPE_START
G1 F24000
G1 X127.333 Y141.064 E-.62619
G1 X127.333 Y140.712 E-.13381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.208 J.146 P1  F30000
G1 X130.333 Y115.801 Z10.2
G1 Z9.8
G1 E.8 F1800
M204 S2000
G1 F4344
G1 X129.667 Y115.136 E.02891
G1 X129.667 Y115.669
G1 X130.333 Y116.334 E.02891
G1 X130.333 Y116.867
G1 X129.667 Y116.202 E.02891
G1 X129.667 Y116.735
G1 X130.333 Y117.401 E.02891
G1 X130.333 Y117.934
G1 X129.667 Y117.269 E.02891
G1 X129.667 Y117.802
G1 X130.333 Y118.467 E.02891
G1 X130.333 Y119
G1 X129.667 Y118.335 E.02891
G1 X129.667 Y118.869
G1 X130.333 Y119.534 E.02891
G1 X130.333 Y120.067
G1 X129.667 Y119.402 E.02891
G1 X129.667 Y119.935
G1 X130.333 Y120.6 E.02891
G1 X130.333 Y121.134
G1 X129.667 Y120.468 E.02891
G1 X129.667 Y121.002
G1 X130.333 Y121.667 E.02891
G1 X130.333 Y122.2
G1 X129.667 Y121.535 E.02891
G1 X129.667 Y122.068
G1 X130.333 Y122.733 E.02891
G1 X130.333 Y123.267
G1 X129.667 Y122.601 E.02891
G1 X129.667 Y123.135
G1 X130.333 Y123.8 E.02891
G1 X130.333 Y124.333
G1 X129.667 Y123.668 E.02891
G1 X129.667 Y124.201
G1 X130.333 Y124.866 E.02891
G1 X130.333 Y125.4
G1 X129.667 Y124.734 E.02891
G1 X129.667 Y125.268
G1 X130.333 Y125.933 E.02891
G1 X130.333 Y126.466
G1 X129.667 Y125.801 E.02891
G1 X129.667 Y126.334
G1 X130.333 Y127 E.02891
G1 X130.333 Y127.533
G1 X129.667 Y126.868 E.02891
G1 X129.667 Y127.401
G1 X130.333 Y128.066 E.02891
G1 X130.333 Y128.599
G1 X129.667 Y127.934 E.02891
G1 X129.667 Y128.467
G1 X130.333 Y129.133 E.02891
G1 X130.333 Y129.666
G1 X129.667 Y129.001 E.02891
G1 X129.667 Y129.534
G1 X130.333 Y130.199 E.02891
G1 X130.333 Y130.732
G1 X129.667 Y130.067 E.02891
G1 X129.667 Y130.6
G1 X130.333 Y131.266 E.02891
G1 X130.333 Y131.799
G1 X129.667 Y131.134 E.02891
G1 X129.667 Y131.667
G1 X130.333 Y132.332 E.02891
G1 X130.333 Y132.865
G1 X129.667 Y132.2 E.02891
G1 X129.667 Y132.734
G1 X130.333 Y133.399 E.02891
G1 X130.333 Y133.932
G1 X129.667 Y133.267 E.02891
G1 X129.667 Y133.8
G1 X130.333 Y134.465 E.02891
G1 X130.333 Y134.999
G1 X129.667 Y134.333 E.02891
G1 X129.667 Y134.867
G1 X130.333 Y135.532 E.02891
G1 X130.333 Y136.065
G1 X129.667 Y135.4 E.02891
G1 X129.667 Y135.933
G1 X130.333 Y136.598 E.02891
G1 X130.333 Y137.132
G1 X129.667 Y136.466 E.02891
M73 P97 R0
G1 X129.667 Y137
G1 X130.333 Y137.665 E.02891
G1 X130.333 Y138.198
G1 X129.667 Y137.533 E.02891
G1 X129.667 Y138.066
G1 X130.333 Y138.731 E.02891
G1 X130.333 Y139.265
G1 X129.667 Y138.6 E.02891
G1 X129.667 Y139.133
G1 X130.333 Y139.798 E.02891
G1 X130.333 Y140.331
G1 X129.667 Y139.666 E.02891
G1 X129.667 Y140.199
G1 X130.333 Y140.865 E.02891
M204 S10000
; WIPE_START
G1 F24000
G1 X129.667 Y140.199 E-.35749
G1 X129.667 Y139.666 E-.20264
G1 X130.039 Y140.038 E-.19987
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.202 J.19 P1  F30000
G1 X133.833 Y116.101 Z10.2
G1 Z9.8
G1 E.8 F1800
M204 S2000
G1 F4344
G1 X132.667 Y114.936 E.05063
G1 X132.667 Y115.469
G1 X133.833 Y116.634 E.05063
G1 X133.833 Y117.168
G1 X132.667 Y116.003 E.05063
G1 X132.667 Y116.536
G1 X133.833 Y117.701 E.05063
G1 X133.833 Y118.234
G1 X132.667 Y117.069 E.05063
G1 X132.667 Y117.602
G1 X133.833 Y118.768 E.05063
G1 X133.833 Y119.301
G1 X132.667 Y118.136 E.05063
G1 X132.667 Y118.669
G1 X133.833 Y119.834 E.05063
G1 X133.833 Y120.367
G1 X132.667 Y119.202 E.05063
G1 X132.667 Y119.735
G1 X133.833 Y120.901 E.05063
G1 X133.833 Y121.434
G1 X132.667 Y120.269 E.05063
G1 X132.667 Y120.802
G1 X133.833 Y121.967 E.05063
G1 X133.833 Y122.5
G1 X132.667 Y121.335 E.05063
G1 X132.667 Y121.869
G1 X133.833 Y123.034 E.05063
G1 X133.833 Y123.567
G1 X132.667 Y122.402 E.05063
G1 X132.667 Y122.935
G1 X133.833 Y124.1 E.05063
G1 X133.833 Y124.634
G1 X132.667 Y123.468 E.05063
G1 X132.667 Y124.002
G1 X133.833 Y125.167 E.05063
G1 X133.833 Y125.7
G1 X132.667 Y124.535 E.05063
G1 X132.667 Y125.068
G1 X133.833 Y126.233 E.05063
G1 X133.833 Y126.767
G1 X132.667 Y125.601 E.05063
G1 X132.667 Y126.135
G1 X133.833 Y127.3 E.05063
G1 X133.833 Y127.833
G1 X132.667 Y126.668 E.05063
G1 X132.667 Y127.201
G1 X133.833 Y128.366 E.05063
G1 X133.833 Y128.9
G1 X132.667 Y127.734 E.05063
G1 X132.667 Y128.268
G1 X133.833 Y129.433 E.05063
G1 X133.833 Y129.966
G1 X132.667 Y128.801 E.05063
G1 X132.667 Y129.334
G1 X133.833 Y130.5 E.05063
G1 X133.833 Y131.033
G1 X132.667 Y129.868 E.05063
G1 X132.667 Y130.401
G1 X133.833 Y131.566 E.05063
G1 X133.833 Y132.099
G1 X132.667 Y130.934 E.05063
G1 X132.667 Y131.467
G1 X133.833 Y132.633 E.05063
G1 X133.833 Y133.166
G1 X132.667 Y132.001 E.05063
G1 X132.667 Y132.534
G1 X133.833 Y133.699 E.05063
G1 X133.833 Y134.232
G1 X132.667 Y133.067 E.05063
G1 X132.667 Y133.6
G1 X133.833 Y134.766 E.05063
G1 X133.833 Y135.299
G1 X132.667 Y134.134 E.05063
G1 X132.667 Y134.667
G1 X133.833 Y135.832 E.05063
G1 X133.833 Y136.365
G1 X132.667 Y135.2 E.05063
G1 X132.667 Y135.734
G1 X133.833 Y136.899 E.05063
G1 X133.833 Y137.432
G1 X132.667 Y136.267 E.05063
G1 X132.667 Y136.8
G1 X133.833 Y137.965 E.05063
G1 X133.833 Y138.499
G1 X132.667 Y137.333 E.05063
G1 X132.667 Y137.867
G1 X133.833 Y139.032 E.05063
G1 X133.833 Y139.565
G1 X132.667 Y138.4 E.05063
G1 X132.667 Y138.933
G1 X133.833 Y140.098 E.05063
G1 X133.833 Y140.632
G1 X132.667 Y139.466 E.05063
G1 X132.667 Y140
G1 X133.833 Y141.165 E.05063
G1 X133.833 Y141.698
G1 X132.667 Y140.533 E.05063
G1 X132.667 Y141.066
G1 X133.833 Y142.231 E.05063
G1 X133.3 Y142.233
G1 X132.235 Y141.167 E.04629
G1 X131.702 Y141.167
G1 X132.767 Y142.233 E.04629
G1 X132.234 Y142.233
G1 X131.169 Y141.167 E.04629
G1 X130.635 Y141.167
G1 X131.701 Y142.233 E.04629
G1 X131.167 Y142.233
G1 X129.667 Y140.733 E.06518
G1 X129.569 Y141.167
G1 X130.634 Y142.233 E.04629
G1 X130.101 Y142.233
G1 X129.036 Y141.167 E.04629
G1 X128.502 Y141.167
G1 X129.568 Y142.233 E.04629
G1 X129.034 Y142.233
G1 X127.969 Y141.167 E.04629
G1 X127.436 Y141.167
G1 X128.501 Y142.233 E.04629
G1 X127.968 Y142.233
G1 X126.167 Y140.432 E.07824
G1 X126.167 Y140.965
G1 X127.435 Y142.233 E.05506
G1 X126.901 Y142.233
G1 X126.167 Y141.499 E.03189
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X126.901 Y142.233 E-.39438
G1 X127.435 Y142.233 E-.20264
G1 X127.131 Y141.929 E-.16298
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
G1 Z10.3 F900 ; lower z a little
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

    G1 Z109.8 F600
    G1 Z107.8

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

