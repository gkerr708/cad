; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 4m 7s; total estimated time: 9m 56s
; total layer number: 55
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
; curr_bed_type = Cool Plate
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
M73 P0 R9
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
M140 S35 ;set bed temp
M190 S35 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

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
M73 P43 R5
G1 Y245
M73 P44 R5
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

M73 P45 R5
G1 X70 F9000
M73 P47 R5
G1 X76 F15000
M73 P50 R4
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
M73 P51 R4
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
    G29 A X122 Y126.024 I16 J7.95166
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

    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
M73 P52 R4
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
;curr_bed_type=Cool Plate

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
M981 S1 P20000 ;open spaghetti detector
M106 S0
M106 P2 S0
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/55
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
G1 X137.143 Y131.119 F30000
G1 Z.4
M73 P53 R4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F2103
G1 X122.857 Y131.119 E.53209
G1 X122.857 Y124.881 E.23232
G1 X137.143 Y124.881 E.53209
M73 P54 R4
G1 X137.143 Y131.059 E.23009
G1 X137.6 Y131.576 F30000
; FEATURE: Outer wall
G1 F2103
G1 X122.4 Y131.576 E.56614
G1 X122.4 Y124.424 E.26637
G1 X137.6 Y124.424 E.56614
G1 X137.6 Y131.516 E.26414
; WIPE_START
G1 F24000
G1 X135.6 Y131.524 E-.76
; WIPE_END
M73 P55 R4
G1 E-.04 F1800
G17
G3 Z.6 I1.215 J.077 P1  F30000
G1 X136.012 Y125.064 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.511578
G1 F2103
G1 X136.754 Y125.807 E.04012
M73 P56 R4
G1 X136.754 Y126.47 E.02531
G1 X135.554 Y125.27 E.06481
G1 X134.892 Y125.27 E.02531
G1 X136.754 Y127.132 E.1006
G1 X136.754 Y127.795 E.02531
G1 X134.229 Y125.27 E.1364
G1 X133.566 Y125.27 E.02531
G1 X136.754 Y128.458 E.17219
G1 X136.754 Y129.121 E.02531
G1 X132.903 Y125.27 E.20799
G1 X132.241 Y125.27 E.02531
G1 X136.754 Y129.784 E.24379
G1 X136.754 Y130.446 E.02531
G1 X131.578 Y125.27 E.27958
M73 P57 R4
G1 X130.915 Y125.27 E.02531
G1 X136.375 Y130.73 E.29491
G1 X135.713 Y130.73 E.02531
G1 X130.252 Y125.27 E.29491
G1 X129.589 Y125.27 E.02531
G1 X135.05 Y130.73 E.29491
G1 X134.387 Y130.73 E.02531
G1 X128.927 Y125.27 E.29491
G1 X128.264 Y125.27 E.02531
G1 X133.724 Y130.73 E.29491
G1 X133.062 Y130.73 E.02531
G1 X127.601 Y125.27 E.29491
G1 X126.938 Y125.27 E.02531
M73 P58 R4
G1 X132.399 Y130.73 E.29491
G1 X131.736 Y130.73 E.02531
G1 X126.276 Y125.27 E.29491
G1 X125.613 Y125.27 E.02531
G1 X131.073 Y130.73 E.29491
G1 X130.41 Y130.73 E.02531
G1 X124.95 Y125.27 E.29491
G1 X124.287 Y125.27 E.02531
G1 X129.748 Y130.73 E.29491
G1 X129.085 Y130.73 E.02531
G1 X123.624 Y125.27 E.29491
G1 X123.246 Y125.27 E.01447
G1 X123.246 Y125.554 E.01085
G1 X128.422 Y130.73 E.27957
G1 X127.759 Y130.73 E.02531
G1 X123.246 Y126.217 E.24378
G1 X123.246 Y126.879 E.02531
G1 X127.097 Y130.73 E.20798
G1 X126.434 Y130.73 E.02531
G1 X123.246 Y127.542 E.17219
G1 X123.246 Y128.205 E.02531
M73 P59 R4
G1 X125.771 Y130.73 E.13639
G1 X125.108 Y130.73 E.02531
G1 X123.246 Y128.868 E.1006
G1 X123.246 Y129.53 E.02531
G1 X124.445 Y130.73 E.0648
G1 X123.783 Y130.73 E.02531
G1 X123.04 Y129.988 E.04011
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.783 Y130.73 E-.39913
G1 X124.445 Y130.73 E-.25186
G1 X124.243 Y130.527 E-.10901
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/55
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
G3 Z.6 I-.078 J1.214 P1  F30000
G1 X137.398 Y131.374 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2564
G1 X122.602 Y131.374 E.49081
G1 X122.602 Y124.626 E.22383
G1 X137.398 Y124.626 E.49081
G1 X137.398 Y131.314 E.22184
G1 X137.79 Y131.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2564
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
; WIPE_START
G1 F24000
G1 X135.79 Y131.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.727 J.976 P1  F30000
G1 X136.466 Y131.21 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423025
G1 F2564
G1 X137.065 Y130.611 E.02624
G1 X137.065 Y130.074 E.01665
G1 X136.098 Y131.04 E.04235
G1 X135.56 Y131.04 E.01665
G1 X137.065 Y129.536 E.0659
G1 X137.065 Y128.999 E.01665
G1 X135.023 Y131.04 E.08945
M73 P59 R3
G1 X134.485 Y131.04 E.01665
G1 X137.065 Y128.461 E.11299
G1 X137.065 Y127.923 E.01665
G1 X133.948 Y131.04 E.13654
G1 X133.41 Y131.04 E.01665
G1 X137.065 Y127.386 E.16008
G1 X137.065 Y126.848 E.01665
G1 X132.872 Y131.04 E.18363
M73 P60 R3
G1 X132.335 Y131.04 E.01665
G1 X137.065 Y126.311 E.20718
G1 X137.065 Y125.773 E.01665
G1 X131.797 Y131.04 E.23072
G1 X131.26 Y131.04 E.01665
G1 X137.065 Y125.236 E.25427
G1 X137.065 Y124.96 E.00855
G1 X136.803 Y124.96 E.0081
G1 X130.722 Y131.04 E.26637
G1 X130.185 Y131.04 E.01665
G1 X136.266 Y124.96 E.26637
G1 X135.728 Y124.96 E.01665
G1 X129.647 Y131.04 E.26637
G1 X129.11 Y131.04 E.01665
G1 X135.191 Y124.96 E.26637
G1 X134.653 Y124.96 E.01665
G1 X128.572 Y131.04 E.26637
G1 X128.035 Y131.04 E.01665
G1 X134.116 Y124.96 E.26637
G1 X133.578 Y124.96 E.01665
G1 X127.497 Y131.04 E.26637
G1 X126.959 Y131.04 E.01665
G1 X133.04 Y124.96 E.26637
G1 X132.503 Y124.96 E.01665
G1 X126.422 Y131.04 E.26637
G1 X125.884 Y131.04 E.01665
G1 X131.965 Y124.96 E.26637
G1 X131.428 Y124.96 E.01665
G1 X125.347 Y131.04 E.26637
G1 X124.809 Y131.04 E.01665
G1 X130.89 Y124.96 E.26637
G1 X130.353 Y124.96 E.01665
G1 X124.272 Y131.04 E.26637
G1 X123.734 Y131.04 E.01665
G1 X129.815 Y124.96 E.26637
G1 X129.278 Y124.96 E.01665
G1 X123.197 Y131.04 E.26637
G1 X122.935 Y131.04 E.00809
G1 X122.935 Y130.764 E.00856
G1 X128.74 Y124.96 E.25427
G1 X128.202 Y124.96 E.01665
G1 X122.935 Y130.227 E.23072
G1 X122.935 Y129.689 E.01665
G1 X127.665 Y124.96 E.20717
G1 X127.127 Y124.96 E.01665
G1 X122.935 Y129.152 E.18363
G1 X122.935 Y128.614 E.01665
G1 X126.59 Y124.96 E.16008
G1 X126.052 Y124.96 E.01665
G1 X122.935 Y128.076 E.13653
G1 X122.935 Y127.539 E.01665
G1 X125.515 Y124.96 E.11299
G1 X124.977 Y124.96 E.01665
G1 X122.935 Y127.001 E.08944
G1 X122.935 Y126.464 E.01665
G1 X124.44 Y124.96 E.06589
G1 X123.902 Y124.96 E.01665
G1 X122.935 Y125.926 E.04235
G1 X122.935 Y125.389 E.01665
G1 X123.534 Y124.79 E.02623
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.935 Y125.389 E-.32183
G1 X122.935 Y125.926 E-.20427
G1 X123.371 Y125.491 E-.2339
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/55
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
G3 Z.8 I-.471 J1.122 P1  F30000
G1 X137.398 Y131.374 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2569
G1 X122.602 Y131.374 E.49081
M73 P61 R3
G1 X122.602 Y124.626 E.22383
G1 X137.398 Y124.626 E.49081
G1 X137.398 Y131.314 E.22184
G1 X137.79 Y131.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2569
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
; WIPE_START
G1 F24000
G1 X135.79 Y131.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.185 J.278 P1  F30000
G1 X137.234 Y125.559 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423025
G1 F2569
G1 X136.635 Y124.96 E.02624
G1 X136.098 Y124.96 E.01665
G1 X137.065 Y125.926 E.04235
G1 X137.065 Y126.464 E.01665
G1 X135.56 Y124.96 E.0659
G1 X135.023 Y124.96 E.01665
G1 X137.065 Y127.001 E.08945
G1 X137.065 Y127.539 E.01665
G1 X134.485 Y124.96 E.11299
G1 X133.948 Y124.96 E.01665
G1 X137.065 Y128.077 E.13654
G1 X137.065 Y128.614 E.01665
G1 X133.41 Y124.96 E.16008
G1 X132.872 Y124.96 E.01665
G1 X137.065 Y129.152 E.18363
G1 X137.065 Y129.689 E.01665
G1 X132.335 Y124.96 E.20718
G1 X131.797 Y124.96 E.01665
G1 X137.065 Y130.227 E.23072
G1 X137.065 Y130.764 E.01665
G1 X131.26 Y124.96 E.25427
G1 X130.722 Y124.96 E.01665
G1 X136.803 Y131.04 E.26637
G1 X136.266 Y131.04 E.01665
G1 X130.185 Y124.96 E.26637
G1 X129.647 Y124.96 E.01665
G1 X135.728 Y131.04 E.26637
G1 X135.191 Y131.04 E.01665
G1 X129.11 Y124.96 E.26637
G1 X128.572 Y124.96 E.01665
G1 X134.653 Y131.04 E.26637
G1 X134.116 Y131.04 E.01665
G1 X128.035 Y124.96 E.26637
G1 X127.497 Y124.96 E.01665
G1 X133.578 Y131.04 E.26637
G1 X133.04 Y131.04 E.01665
G1 X126.959 Y124.96 E.26637
G1 X126.422 Y124.96 E.01665
G1 X132.503 Y131.04 E.26637
G1 X131.965 Y131.04 E.01665
G1 X125.884 Y124.96 E.26637
G1 X125.347 Y124.96 E.01665
G1 X131.428 Y131.04 E.26637
G1 X130.89 Y131.04 E.01665
G1 X124.809 Y124.96 E.26637
G1 X124.272 Y124.96 E.01665
G1 X130.353 Y131.04 E.26637
G1 X129.815 Y131.04 E.01665
G1 X123.734 Y124.96 E.26637
G1 X123.197 Y124.96 E.01665
G1 X129.278 Y131.04 E.26637
G1 X128.74 Y131.04 E.01665
G1 X122.935 Y125.236 E.25427
M73 P62 R3
G1 X122.935 Y125.773 E.01665
G1 X128.202 Y131.04 E.23072
G1 X127.665 Y131.04 E.01665
G1 X122.935 Y126.311 E.20717
G1 X122.935 Y126.848 E.01665
G1 X127.127 Y131.04 E.18363
G1 X126.59 Y131.04 E.01665
G1 X122.935 Y127.386 E.16008
G1 X122.935 Y127.924 E.01665
G1 X126.052 Y131.04 E.13653
G1 X125.515 Y131.04 E.01665
G1 X122.935 Y128.461 E.11299
G1 X122.935 Y128.999 E.01665
G1 X124.977 Y131.04 E.08944
G1 X124.44 Y131.04 E.01665
G1 X122.935 Y129.536 E.06589
G1 X122.935 Y130.074 E.01665
G1 X123.902 Y131.04 E.04235
G1 X123.365 Y131.04 E.01665
G1 X122.766 Y130.442 E.02623
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.365 Y131.04 E-.32183
G1 X123.902 Y131.04 E-.20427
G1 X123.467 Y130.605 E-.2339
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/55
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
G3 Z1 I-.067 J1.215 P1  F30000
G1 X137.398 Y131.374 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X122.602 Y131.374 E.49081
G1 X122.602 Y124.626 E.22383
G1 X137.398 Y124.626 E.49081
G1 X137.398 Y131.314 E.22184
G1 X137.79 Y131.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
; WIPE_START
G1 F24000
G1 X135.79 Y131.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.832 J-.888 P1  F30000
G1 X128.603 Y124.975 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.975 Y124.975 E.05401
G1 X133.025 Y131.025 E.28386
G1 X134.65 Y131.025 E.0539
G1 X137.05 Y128.626 E.11255
G1 X137.05 Y127.374 E.04155
G1 X134.65 Y124.975 E.11255
G1 X133.025 Y124.975 E.0539
G1 X126.975 Y131.025 E.28386
G1 X125.35 Y131.025 E.0539
G1 X122.95 Y128.626 E.11255
G1 X122.95 Y127.374 E.04155
G1 X125.35 Y124.975 E.11255
G1 X123.721 Y124.975 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.35 Y124.975 E-.61876
G1 X125.087 Y125.237 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/55
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
G3 Z1.2 I-.543 J1.089 P1  F30000
G1 X137.398 Y131.374 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.602 Y131.374 E.49081
G1 X122.602 Y124.626 E.22383
G1 X137.398 Y124.626 E.49081
G1 X137.398 Y131.314 E.22184
G1 X137.79 Y131.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
M73 P63 R3
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
; WIPE_START
G1 F24000
G1 X135.79 Y131.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.832 J-.888 P1  F30000
G1 X128.603 Y124.975 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.975 Y124.975 E.05401
G1 X133.025 Y131.025 E.28386
G1 X134.65 Y131.025 E.0539
G1 X137.05 Y128.626 E.11255
G1 X137.05 Y127.374 E.04155
G1 X134.65 Y124.975 E.11255
G1 X133.025 Y124.975 E.0539
G1 X126.975 Y131.025 E.28386
G1 X125.35 Y131.025 E.0539
G1 X122.95 Y128.626 E.11255
G1 X122.95 Y127.374 E.04155
G1 X125.35 Y124.975 E.11255
G1 X123.721 Y124.975 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.35 Y124.975 E-.61876
G1 X125.087 Y125.237 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/55
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
G3 Z1.4 I-.543 J1.089 P1  F30000
G1 X137.398 Y131.374 Z1.4
M73 P64 R3
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.602 Y131.374 E.49081
G1 X122.602 Y124.626 E.22383
G1 X137.398 Y124.626 E.49081
G1 X137.398 Y131.314 E.22184
G1 X137.79 Y131.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
; WIPE_START
G1 F24000
G1 X135.79 Y131.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.832 J-.888 P1  F30000
G1 X128.603 Y124.975 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.975 Y124.975 E.05401
G1 X133.025 Y131.025 E.28386
G1 X134.65 Y131.025 E.0539
G1 X137.05 Y128.626 E.11255
G1 X137.05 Y127.374 E.04155
G1 X134.65 Y124.975 E.11255
G1 X133.025 Y124.975 E.0539
G1 X126.975 Y131.025 E.28386
G1 X125.35 Y131.025 E.0539
G1 X122.95 Y128.626 E.11255
G1 X122.95 Y127.374 E.04155
M73 P65 R3
G1 X125.35 Y124.975 E.11255
G1 X123.721 Y124.975 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.35 Y124.975 E-.61876
G1 X125.087 Y125.237 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/55
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
G3 Z1.6 I-.543 J1.089 P1  F30000
G1 X137.398 Y131.374 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.602 Y131.374 E.49081
G1 X122.602 Y124.626 E.22383
G1 X137.398 Y124.626 E.49081
G1 X137.398 Y131.314 E.22184
G1 X137.79 Y131.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
; WIPE_START
G1 F24000
G1 X135.79 Y131.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.832 J-.888 P1  F30000
G1 X128.603 Y124.975 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.975 Y124.975 E.05401
G1 X133.025 Y131.025 E.28386
G1 X134.65 Y131.025 E.0539
M73 P66 R3
G1 X137.05 Y128.626 E.11255
G1 X137.05 Y127.374 E.04155
G1 X134.65 Y124.975 E.11255
G1 X133.025 Y124.975 E.0539
G1 X126.975 Y131.025 E.28386
G1 X125.35 Y131.025 E.0539
G1 X122.95 Y128.626 E.11255
G1 X122.95 Y127.374 E.04155
G1 X125.35 Y124.975 E.11255
G1 X123.721 Y124.975 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.35 Y124.975 E-.61876
G1 X125.087 Y125.237 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/55
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
G3 Z1.8 I-.543 J1.089 P1  F30000
G1 X137.398 Y131.374 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X122.602 Y131.374 E.49081
G1 X122.602 Y124.626 E.22383
G1 X137.398 Y124.626 E.49081
G1 X137.398 Y131.314 E.22184
G1 X137.79 Y131.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
; WIPE_START
G1 F24000
G1 X135.79 Y131.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.832 J-.888 P1  F30000
G1 X128.603 Y124.975 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.975 Y124.975 E.05401
M73 P67 R3
G1 X133.025 Y131.025 E.28386
G1 X134.65 Y131.025 E.0539
G1 X137.05 Y128.626 E.11255
G1 X137.05 Y127.374 E.04155
G1 X134.65 Y124.975 E.11255
G1 X133.025 Y124.975 E.0539
G1 X126.975 Y131.025 E.28386
G1 X125.35 Y131.025 E.0539
G1 X122.95 Y128.626 E.11255
G1 X122.95 Y127.374 E.04155
G1 X125.35 Y124.975 E.11255
G1 X123.721 Y124.975 E.05401
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.35 Y124.975 E-.61876
G1 X125.087 Y125.237 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/55
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
G3 Z2 I-.543 J1.089 P1  F30000
G1 X137.398 Y131.374 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1298
G1 X122.602 Y131.374 E.49081
G1 X122.602 Y124.626 E.22383
G1 X137.398 Y124.626 E.49081
G1 X137.398 Y131.314 E.22184
G1 X137.79 Y131.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1298
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
; WIPE_START
G1 F24000
G1 X135.79 Y131.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.583 J1.068 P1  F30000
G1 X137.05 Y131.025 Z2.2
M73 P68 R3
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1298
G1 X122.95 Y131.025 E.4677
G1 X122.95 Y124.975 E.20072
G1 X137.05 Y124.975 E.4677
G1 X137.05 Y130.965 E.19873
G1 X129.01 Y125.382 F30000
G1 F1298
G1 X127.382 Y125.382 E.05401
G1 X132.618 Y130.618 E.24567
G1 X135.058 Y130.618 E.08091
G1 X136.643 Y129.033 E.07436
G1 X136.643 Y126.967 E.06856
G1 X135.058 Y125.382 E.07436
G1 X132.618 Y125.382 E.08091
G1 X127.382 Y130.618 E.24567
G1 X124.942 Y130.618 E.08091
G1 X123.357 Y129.033 E.07436
G1 X123.357 Y126.967 E.06856
G1 X124.942 Y125.382 E.07436
G1 X123.357 Y125.382 E.05258
G1 X123.357 Y125.425 E.00144
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.357 Y125.382 E-.01646
G1 X124.942 Y125.382 E-.60231
G1 X124.68 Y125.644 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/55
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
G3 Z2.2 I-.5 J1.11 P1  F30000
G1 X137.398 Y131.374 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1298
G1 X122.602 Y131.374 E.49081
G1 X122.602 Y124.626 E.22383
G1 X137.398 Y124.626 E.49081
G1 X137.398 Y131.314 E.22184
G1 X137.79 Y131.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P69 R3
G1 F1298
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
; WIPE_START
G1 F24000
G1 X135.79 Y131.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.583 J1.068 P1  F30000
G1 X137.05 Y131.025 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1298
G1 X122.95 Y131.025 E.4677
G1 X122.95 Y124.975 E.20072
G1 X137.05 Y124.975 E.4677
G1 X137.05 Y130.965 E.19873
G1 X129.01 Y125.382 F30000
G1 F1298
G1 X127.382 Y125.382 E.05401
M73 P69 R2
G1 X132.618 Y130.618 E.24567
G1 X135.058 Y130.618 E.08091
G1 X136.643 Y129.033 E.07436
G1 X136.643 Y126.967 E.06856
G1 X135.058 Y125.382 E.07436
M73 P70 R2
G1 X132.618 Y125.382 E.08091
G1 X127.382 Y130.618 E.24567
G1 X124.942 Y130.618 E.08091
G1 X123.357 Y129.033 E.07436
G1 X123.357 Y126.967 E.06856
G1 X124.942 Y125.382 E.07436
G1 X123.357 Y125.382 E.05258
G1 X123.357 Y125.425 E.00144
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.357 Y125.382 E-.01646
G1 X124.942 Y125.382 E-.60231
G1 X124.68 Y125.644 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/55
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
G3 Z2.4 I-.5 J1.11 P1  F30000
G1 X137.398 Y131.374 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1298
G1 X122.602 Y131.374 E.49081
G1 X122.602 Y124.626 E.22383
G1 X137.398 Y124.626 E.49081
G1 X137.398 Y131.314 E.22184
G1 X137.79 Y131.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1298
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
; WIPE_START
G1 F24000
G1 X135.79 Y131.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.583 J1.068 P1  F30000
M73 P71 R2
G1 X137.05 Y131.025 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1298
G1 X122.95 Y131.025 E.4677
G1 X122.95 Y124.975 E.20072
G1 X137.05 Y124.975 E.4677
G1 X137.05 Y130.965 E.19873
G1 X129.01 Y125.382 F30000
G1 F1298
G1 X127.382 Y125.382 E.05401
G1 X132.618 Y130.618 E.24567
G1 X135.058 Y130.618 E.08091
G1 X136.643 Y129.033 E.07436
G1 X136.643 Y126.967 E.06856
G1 X135.058 Y125.382 E.07436
G1 X132.618 Y125.382 E.08091
G1 X127.382 Y130.618 E.24567
G1 X124.942 Y130.618 E.08091
G1 X123.357 Y129.033 E.07436
G1 X123.357 Y126.967 E.06856
G1 X124.942 Y125.382 E.07436
G1 X123.357 Y125.382 E.05258
G1 X123.357 Y125.425 E.00144
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.357 Y125.382 E-.01646
G1 X124.942 Y125.382 E-.60231
G1 X124.68 Y125.644 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/55
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
G3 Z2.6 I-.5 J1.11 P1  F30000
G1 X137.398 Y131.374 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1298
G1 X122.602 Y131.374 E.49081
G1 X122.602 Y124.626 E.22383
G1 X137.398 Y124.626 E.49081
G1 X137.398 Y131.314 E.22184
G1 X137.79 Y131.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1298
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
M73 P72 R2
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
; WIPE_START
G1 F24000
G1 X135.79 Y131.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.583 J1.068 P1  F30000
G1 X137.05 Y131.025 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1298
G1 X122.95 Y131.025 E.4677
G1 X122.95 Y124.975 E.20072
G1 X137.05 Y124.975 E.4677
G1 X137.05 Y130.965 E.19873
G1 X129.01 Y125.382 F30000
G1 F1298
G1 X127.382 Y125.382 E.05401
G1 X132.618 Y130.618 E.24567
G1 X135.058 Y130.618 E.08091
G1 X136.643 Y129.033 E.07436
G1 X136.643 Y126.967 E.06856
G1 X135.058 Y125.382 E.07436
G1 X132.618 Y125.382 E.08091
G1 X127.382 Y130.618 E.24567
G1 X124.942 Y130.618 E.08091
G1 X123.357 Y129.033 E.07436
G1 X123.357 Y126.967 E.06856
G1 X124.942 Y125.382 E.07436
G1 X123.357 Y125.382 E.05258
G1 X123.357 Y125.425 E.00144
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P73 R2
G1 F24000
G1 X123.357 Y125.382 E-.01646
G1 X124.942 Y125.382 E-.60231
G1 X124.68 Y125.644 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/55
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
G3 Z2.8 I-.5 J1.11 P1  F30000
G1 X137.398 Y131.374 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1428
G1 X122.602 Y131.374 E.49081
G1 X122.602 Y124.626 E.22383
G1 X137.398 Y124.626 E.49081
G1 X137.398 Y131.314 E.22184
G1 X137.79 Y131.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1428
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
G1 X137.026 Y131.207 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.403324
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X137.026 Y124.996 E.32329
G1 X136.573 Y124.996 E.0236
G1 X136.573 Y131.004 E.31275
G1 X136.12 Y131.004 E.0236
G1 X136.12 Y124.996 E.31275
G1 X135.667 Y124.996 E.0236
G1 X135.667 Y131.004 E.31275
G1 X135.213 Y131.004 E.0236
G1 X135.213 Y124.996 E.31275
G1 X134.76 Y124.996 E.0236
G1 X134.76 Y131.004 E.31275
G1 X134.307 Y131.004 E.0236
G1 X134.307 Y124.996 E.31275
M73 P74 R2
G1 X133.853 Y124.996 E.0236
G1 X133.853 Y131.004 E.31275
G1 X133.4 Y131.004 E.0236
G1 X133.4 Y124.996 E.31275
G1 X132.947 Y124.996 E.0236
G1 X132.947 Y131.004 E.31275
G1 X132.493 Y131.004 E.0236
G1 X132.493 Y124.996 E.31275
G1 X132.04 Y124.996 E.0236
G1 X132.04 Y131.004 E.31275
G1 X131.587 Y131.004 E.0236
G1 X131.587 Y124.996 E.31275
G1 X131.133 Y124.996 E.0236
G1 X131.133 Y131.004 E.31275
G1 X130.68 Y131.004 E.0236
G1 X130.68 Y124.996 E.31275
G1 X130.227 Y124.996 E.0236
G1 X130.227 Y131.004 E.31275
G1 X129.773 Y131.004 E.0236
G1 X129.773 Y124.996 E.31275
G1 X129.32 Y124.996 E.0236
G1 X129.32 Y131.004 E.31275
G1 X128.867 Y131.004 E.0236
G1 X128.867 Y124.996 E.31275
G1 X128.413 Y124.996 E.0236
G1 X128.413 Y131.004 E.31275
G1 X127.96 Y131.004 E.0236
G1 X127.96 Y124.996 E.31275
G1 X127.507 Y124.996 E.0236
G1 X127.507 Y131.004 E.31275
G1 X127.053 Y131.004 E.0236
G1 X127.053 Y124.996 E.31275
G1 X126.6 Y124.996 E.0236
G1 X126.6 Y131.004 E.31275
G1 X126.147 Y131.004 E.0236
G1 X126.147 Y124.996 E.31275
M73 P75 R2
G1 X125.693 Y124.996 E.0236
G1 X125.693 Y131.004 E.31275
G1 X125.24 Y131.004 E.0236
G1 X125.24 Y124.996 E.31275
G1 X124.787 Y124.996 E.0236
G1 X124.787 Y131.004 E.31275
G1 X124.333 Y131.004 E.0236
G1 X124.333 Y124.996 E.31275
G1 X123.88 Y124.996 E.0236
G1 X123.88 Y131.004 E.31275
G1 X123.427 Y131.004 E.0236
G1 X123.427 Y124.996 E.31275
G1 X122.973 Y124.996 E.0236
G1 X122.973 Y131.207 E.32329
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.973 Y129.207 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/55
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
G3 Z3 I-.181 J1.203 P1  F30000
G1 X137.398 Y131.374 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2566
G1 X122.602 Y131.374 E.49081
G1 X122.602 Y124.626 E.22383
G1 X137.398 Y124.626 E.49081
G1 X137.398 Y131.314 E.22184
G1 X137.79 Y131.766 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2566
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
; WIPE_START
G1 F24000
G1 X135.79 Y131.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.727 J.976 P1  F30000
G1 X136.466 Y131.21 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423025
G1 F2566
G1 X137.065 Y130.611 E.02624
G1 X137.065 Y130.074 E.01665
G1 X136.098 Y131.04 E.04235
G1 X135.56 Y131.04 E.01665
G1 X137.065 Y129.536 E.0659
G1 X137.065 Y128.999 E.01665
G1 X135.023 Y131.04 E.08945
G1 X134.485 Y131.04 E.01665
G1 X137.065 Y128.461 E.11299
G1 X137.065 Y127.923 E.01665
G1 X133.948 Y131.04 E.13654
G1 X133.41 Y131.04 E.01665
G1 X137.065 Y127.386 E.16008
G1 X137.065 Y126.848 E.01665
G1 X132.872 Y131.04 E.18363
G1 X132.335 Y131.04 E.01665
G1 X137.065 Y126.311 E.20718
G1 X137.065 Y125.773 E.01665
G1 X131.797 Y131.04 E.23072
G1 X131.26 Y131.04 E.01665
G1 X137.065 Y125.236 E.25427
G1 X137.065 Y124.96 E.00855
G1 X136.803 Y124.96 E.0081
G1 X130.722 Y131.04 E.26637
G1 X130.185 Y131.04 E.01665
G1 X136.266 Y124.96 E.26637
G1 X135.728 Y124.96 E.01665
G1 X129.647 Y131.04 E.26637
G1 X129.11 Y131.04 E.01665
G1 X135.191 Y124.96 E.26637
G1 X134.653 Y124.96 E.01665
G1 X128.572 Y131.04 E.26637
G1 X128.035 Y131.04 E.01665
G1 X134.116 Y124.96 E.26637
G1 X133.578 Y124.96 E.01665
G1 X127.497 Y131.04 E.26637
G1 X126.959 Y131.04 E.01665
M73 P76 R2
G1 X133.04 Y124.96 E.26637
G1 X132.503 Y124.96 E.01665
G1 X126.422 Y131.04 E.26637
G1 X125.884 Y131.04 E.01665
G1 X131.965 Y124.96 E.26637
G1 X131.428 Y124.96 E.01665
G1 X125.347 Y131.04 E.26637
G1 X124.809 Y131.04 E.01665
G1 X130.89 Y124.96 E.26637
G1 X130.353 Y124.96 E.01665
G1 X124.272 Y131.04 E.26637
G1 X123.734 Y131.04 E.01665
G1 X129.815 Y124.96 E.26637
G1 X129.278 Y124.96 E.01665
G1 X123.197 Y131.04 E.26637
G1 X122.935 Y131.04 E.00809
G1 X122.935 Y130.764 E.00856
G1 X128.74 Y124.96 E.25427
G1 X128.202 Y124.96 E.01665
G1 X122.935 Y130.227 E.23072
G1 X122.935 Y129.689 E.01665
G1 X127.665 Y124.96 E.20717
G1 X127.127 Y124.96 E.01665
G1 X122.935 Y129.152 E.18363
G1 X122.935 Y128.614 E.01665
G1 X126.59 Y124.96 E.16008
G1 X126.052 Y124.96 E.01665
G1 X122.935 Y128.076 E.13653
G1 X122.935 Y127.539 E.01665
G1 X125.515 Y124.96 E.11299
G1 X124.977 Y124.96 E.01665
G1 X122.935 Y127.001 E.08944
G1 X122.935 Y126.464 E.01665
G1 X124.44 Y124.96 E.06589
G1 X123.902 Y124.96 E.01665
G1 X122.935 Y125.926 E.04235
G1 X122.935 Y125.389 E.01665
G1 X123.534 Y124.79 E.02623
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.935 Y125.389 E-.32183
G1 X122.935 Y125.926 E-.20427
G1 X123.371 Y125.491 E-.2339
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/55
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
G3 Z3.2 I-.486 J1.116 P1  F30000
G1 X137.79 Y131.766 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2836
G1 X122.21 Y131.766 E.47873
G1 X122.21 Y124.234 E.23143
G1 X137.79 Y124.234 E.47873
G1 X137.79 Y131.706 E.22958
M204 S10000
; WIPE_START
G1 F24000
G1 X135.79 Y131.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.174 J.322 P1  F30000
G1 X137.583 Y125.184 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F2836
G1 X136.84 Y124.442 E.03226
G1 X136.307 Y124.442
G1 X137.583 Y125.717 E.05543
G1 X137.583 Y126.25
G1 X135.774 Y124.442 E.0786
M73 P77 R2
G1 X135.24 Y124.442
G1 X137.583 Y126.784 E.10178
G1 X137.583 Y127.317
G1 X134.707 Y124.442 E.12495
G1 X134.174 Y124.442
G1 X137.583 Y127.85 E.14812
G1 X137.583 Y128.384
G1 X133.641 Y124.442 E.1713
G1 X133.107 Y124.442
G1 X137.583 Y128.917 E.19447
G1 X137.583 Y129.45
G1 X132.574 Y124.442 E.21764
G1 X132.041 Y124.442
G1 X137.583 Y129.983 E.24082
G1 X137.583 Y130.517
G1 X131.508 Y124.442 E.26399
G1 X130.974 Y124.442
G1 X137.583 Y131.05 E.28716
G1 X137.558 Y131.558
G1 X130.441 Y124.442 E.30926
G1 X129.908 Y124.442
G1 X137.025 Y131.558 E.30926
G1 X136.491 Y131.558
G1 X129.374 Y124.442 E.30926
G1 X128.841 Y124.442
G1 X135.958 Y131.558 E.30926
G1 X135.425 Y131.558
G1 X128.308 Y124.442 E.30926
G1 X127.775 Y124.442
G1 X134.892 Y131.558 E.30926
G1 X134.358 Y131.558
G1 X127.241 Y124.442 E.30926
G1 X126.708 Y124.442
G1 X133.825 Y131.558 E.30926
G1 X133.292 Y131.558
G1 X126.175 Y124.442 E.30926
G1 X125.642 Y124.442
G1 X132.758 Y131.558 E.30926
G1 X132.225 Y131.558
G1 X125.108 Y124.442 E.30926
G1 X124.575 Y124.442
G1 X126.022 Y125.888 E.06286
G1 X126.136 Y126.002
G1 X131.692 Y131.558 E.24145
G1 X131.159 Y131.558
G1 X124.042 Y124.442 E.30926
G1 X123.509 Y124.442
G1 X130.625 Y131.558 E.30926
G1 X130.092 Y131.558
G1 X122.975 Y124.442 E.30926
G1 X122.442 Y124.442
G1 X129.559 Y131.558 E.30926
G1 X129.026 Y131.558
G1 X122.417 Y124.95 E.28716
G1 X122.417 Y125.484
G1 X128.492 Y131.558 E.26398
G1 X127.959 Y131.558
G1 X122.417 Y126.017 E.24081
G1 X122.417 Y126.55
G1 X127.426 Y131.558 E.21764
G1 X126.892 Y131.558
G1 X122.417 Y127.083 E.19446
G1 X122.417 Y127.617
G1 X126.359 Y131.558 E.17129
G1 X125.826 Y131.558
G1 X122.417 Y128.15 E.14812
G1 X122.417 Y128.683
G1 X125.293 Y131.558 E.12495
G1 X124.759 Y131.558
G1 X122.417 Y129.216 E.10177
G1 X122.417 Y129.75
G1 X124.226 Y131.558 E.0786
G1 X123.693 Y131.558
G1 X122.417 Y130.283 E.05543
G1 X122.417 Y130.816
G1 X123.16 Y131.558 E.03225
M204 S10000
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.417 Y130.816 E-.39886
G1 X122.417 Y130.283 E-.20264
G1 X122.712 Y130.578 E-.15849
; WIPE_END
M73 P78 R2
G1 E-.04 F1800
; layer num/total_layer_count: 16/55
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
G3 Z3.4 I.587 J1.066 P1  F30000
G1 X130.746 Y126.158 Z3.4
G1 Z3.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F1200
G3 X131.035 Y125.738 I.254 J-.135 E.01926
G1 X131.101 Y125.754 E.0021
G3 X130.779 Y126.208 I-.101 J.269 E.03226
M204 S10000
; WIPE_START
G1 F24000
G1 X130.712 Y126.024 E-.08276
G1 X130.72 Y125.955 E-.02941
G1 X130.745 Y125.89 E-.02942
G1 X130.836 Y125.787 E-.0584
G1 X130.898 Y125.754 E-.02942
G1 X131.035 Y125.738 E-.0584
G1 X131.101 Y125.754 E-.02891
G1 X131.164 Y125.787 E-.03004
G1 X131.255 Y125.89 E-.05827
G1 X131.28 Y125.955 E-.02941
G1 X131.28 Y126.093 E-.0584
G1 X131.255 Y126.158 E-.02942
G1 X131.164 Y126.262 E-.0584
G1 X131.035 Y126.311 E-.0584
G1 X130.965 Y126.311 E-.02942
G1 X130.836 Y126.262 E-.0584
G1 X130.779 Y126.208 E-.0331
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.072 J-1.215 P1  F30000
G1 X128.865 Y126.094 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.01101
G1 X129.053 Y125.881 E.00118
G3 X128.903 Y126.142 I-.053 J.143 E.01752
G1 X128.517 Y126.277 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.066 Y125.48 I.482 J-.255 E.03656
G1 X129.192 Y125.511 E.004
G3 X128.548 Y126.329 I-.193 J.511 E.06297
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.0726
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.192 Y125.511 E-.04944
G1 X129.311 Y125.573 E-.05103
G1 X129.41 Y125.661 E-.05007
G1 X129.485 Y125.769 E-.05007
G1 X129.532 Y125.895 E-.05103
G1 X129.543 Y125.984 E-.03424
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.111 J-1.212 P1  F30000
G1 X126.294 Y126.282 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.047 Y125.634 I-.294 J-.259 E.0535
G1 X126.137 Y125.656 E.00308
G3 X126.33 Y126.234 I-.138 J.367 E.02313
G1 X126.588 Y126.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.095 Y125.241 I-.589 J-.52 E.09922
G1 X126.277 Y125.286 E.00576
G3 X126.626 Y126.495 I-.278 J.735 E.04482
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.0958
G1 X126.28 Y126.761 E-.07211
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.027 E-.0712
G1 X125.217 Y125.987 E-.01528
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.181 J.296 P1  F30000
G1 X126.167 Y129.784 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.035 Y129.733 I-.168 J.239 E.05621
G1 X126.102 Y129.749 E.00229
G3 X126.115 Y129.754 I-.103 J.274 E.00044
G1 X126.391 Y129.458 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.083 Y129.341 I-.392 J.563 E.12219
G1 X126.242 Y129.38 E.00503
G3 X126.34 Y129.426 I-.242 J.642 E.00335
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08552
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.0438
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.398 J1.15 P1  F30000
G1 X128.749 Y129.66 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.251 J.362 E.00986
G1 X129.155 Y129.61 E.00323
G3 X128.702 Y129.698 I-.156 J.412 E.07014
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.0631
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
M73 P79 R2
G1 X129.155 Y129.61 E-.03989
G1 X129.252 Y129.66 E-.04125
G1 X129.331 Y129.731 E-.0404
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.158 Y130.437 E-.03989
G1 X129.053 Y130.463 E-.04125
G1 X128.947 Y130.463 E-.0404
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00809
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.219 J1.197 P1  F30000
G1 X130.851 Y129.987 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.149 J.036 E.0061
G1 X131.054 Y129.88 E.001
G3 X130.848 Y130.048 I-.054 J.144 E.0176
M204 S10000
; WIPE_START
G1 F24000
G1 X130.912 Y129.897 E-.13185
G1 X131.019 Y129.871 E-.0879
G1 X131.054 Y129.88 E-.02926
G1 X131.136 Y129.953 E-.08845
G1 X131.15 Y130.061 E-.08789
G1 X131.088 Y130.151 E-.0879
G1 X130.981 Y130.177 E-.0879
G1 X130.912 Y130.151 E-.05932
G1 X130.864 Y130.096 E-.05932
G1 X130.848 Y130.048 E-.04022
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.017 J1.217 P1  F30000
G1 X132.979 Y130.019 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.007 Y130.004 E.00088
G1 X133.021 Y130.029 E.0008
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.007 Y130.004 E-.36851
G1 X133.021 Y130.029 E-.368
G1 X133.02 Y130.03 E-.02349
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/55
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
G3 Z3.6 I1.051 J-.614 P1  F30000
G1 X130.72 Y126.093 Z3.6
G1 Z3.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.035 Y125.738 I.279 J-.07 E.01717
G1 X131.099 Y125.754 E.00203
G3 X130.741 Y126.15 I-.1 J.269 E.03441
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y125.955 E-.0828
G1 X130.782 Y125.836 E-.05689
G1 X130.837 Y125.786 E-.03127
G1 X130.965 Y125.738 E-.05801
G1 X131.035 Y125.738 E-.02941
G1 X131.099 Y125.754 E-.02789
G1 X131.165 Y125.787 E-.03127
G1 X131.255 Y125.889 E-.05762
G1 X131.281 Y125.959 E-.03127
G1 X131.28 Y126.093 E-.05689
G1 X131.255 Y126.158 E-.02941
G1 X131.164 Y126.262 E-.05839
G1 X131.035 Y126.311 E-.0584
G1 X130.965 Y126.311 E-.02941
G1 X130.836 Y126.262 E-.05839
G1 X130.784 Y126.215 E-.02941
G1 X130.741 Y126.15 E-.03327
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.014 J-1.217 P1  F30000
G1 X128.888 Y126.129 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.11 J-.106 E.01248
G1 X129.05 Y125.88 E.00108
G3 X128.939 Y126.163 I-.052 J.143 E.01613
G1 X128.515 Y126.277 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.066 Y125.48 I.482 J-.256 E.03663
G1 X129.189 Y125.51 E.00388
G3 X128.547 Y126.329 I-.191 J.511 E.063
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07239
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.189 Y125.51 E-.04793
G1 X129.312 Y125.574 E-.05273
G1 X129.41 Y125.661 E-.04984
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.985 E-.03521
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.111 J-1.212 P1  F30000
G1 X126.291 Y126.282 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.047 Y125.634 I-.294 J-.26 E.05352
G1 X126.133 Y125.655 E.00293
G3 X126.327 Y126.234 I-.136 J.367 E.02323
G1 X126.584 Y126.542 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.095 Y125.241 I-.588 J-.521 E.09924
G1 X126.272 Y125.285 E.00559
G3 X126.622 Y126.495 I-.275 J.736 E.04494
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09463
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01531
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.181 J.296 P1  F30000
G1 X126.168 Y129.785 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.035 Y129.733 I-.171 J.237 E.05614
G1 X126.099 Y129.748 E.00216
G3 X126.116 Y129.755 I-.101 J.274 E.00061
G1 X126.391 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.083 Y129.341 I-.394 J.561 E.12215
G1 X126.237 Y129.379 E.00488
G3 X126.34 Y129.427 I-.24 J.642 E.00351
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08527
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.519 Y130.475 E-.06033
G1 X126.39 Y130.591 E-.06607
G1 X126.244 Y130.668 E-.06272
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.804 Y130.68 E-.04414
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.399 J1.15 P1  F30000
G1 X128.748 Y129.659 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.25 J.363 E.00987
G1 X129.152 Y129.609 E.00312
G3 X128.701 Y129.697 I-.154 J.413 E.07021
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06314
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.152 Y129.609 E-.03862
G1 X129.252 Y129.661 E-.04271
G1 X129.331 Y129.731 E-.04017
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00807
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.236 J1.194 P1  F30000
G1 X130.863 Y129.952 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.136 J.071 E.00511
G1 X131.052 Y129.88 E.00095
G3 X130.846 Y130.01 I-.053 J.144 E.01865
M204 S10000
; WIPE_START
G1 F24000
G1 X130.912 Y129.897 E-.10521
G1 X131.019 Y129.871 E-.08773
G1 X131.052 Y129.88 E-.02798
G1 X131.136 Y129.953 E-.08935
G1 X131.15 Y130.061 E-.08773
G1 X131.088 Y130.151 E-.08773
G1 X130.981 Y130.177 E-.08773
G1 X130.885 Y130.126 E-.08773
G1 X130.846 Y130.024 E-.08773
G1 X130.846 Y130.01 E-.01108
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.005 J1.217 P1  F30000
G1 X132.979 Y130.019 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.007 Y130.003 E.00087
G1 X133.021 Y130.029 E.00081
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.007 Y130.003 E-.36956
G1 X133.021 Y130.029 E-.36956
G1 X133.02 Y130.03 E-.02088
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/55
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
G3 Z3.8 I1.049 J-.617 P1  F30000
G1 X130.744 Y126.158 Z3.8
G1 Z3.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.035 Y125.738 I.253 J-.136 E.01937
G1 X131.096 Y125.753 E.00195
G3 X130.778 Y126.208 I-.099 J.27 E.03228
M204 S10000
; WIPE_START
G1 F24000
G1 X130.712 Y126.024 E-.08281
G1 X130.72 Y125.955 E-.02941
G1 X130.781 Y125.838 E-.05587
G1 X130.837 Y125.786 E-.03251
G1 X130.965 Y125.738 E-.05777
G1 X131.035 Y125.738 E-.02941
G1 X131.096 Y125.753 E-.02686
G1 X131.165 Y125.788 E-.03251
G1 X131.255 Y125.889 E-.05714
G1 X131.281 Y125.961 E-.03251
G1 X131.28 Y126.093 E-.05587
G1 X131.255 Y126.158 E-.02941
G1 X131.164 Y126.262 E-.0584
G1 X131.035 Y126.311 E-.0584
G1 X130.965 Y126.311 E-.02941
G1 X130.836 Y126.262 E-.0584
G1 X130.778 Y126.208 E-.03331
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.073 J-1.215 P1  F30000
G1 X128.869 Y126.093 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.852 Y126.061 E.00121
G3 X129.018 Y125.872 I.148 J-.037 E.00979
G1 X129.054 Y125.881 E.00122
G3 X128.903 Y126.141 I-.054 J.142 E.01754
G1 X128.518 Y126.277 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.194 Y125.512 I.484 J-.253 E.04049
G3 X129.311 Y126.475 I-.202 J.513 E.03644
G3 X128.549 Y126.329 I-.309 J-.451 E.02652
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.0727
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.194 Y125.512 E-.05019
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03482
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.112 J-1.212 P1  F30000
G1 X126.294 Y126.284 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.224 Y126.348 I-.299 J-.26 E.00315
G3 X126.14 Y125.656 I-.222 J-.324 E.05339
G3 X126.33 Y126.236 I-.145 J.369 E.02311
G1 X126.587 Y126.544 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.095 Y125.241 I-.586 J-.523 E.09908
G1 X126.28 Y125.287 E.00584
G3 X126.625 Y126.498 I-.279 J.734 E.04489
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09471
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01523
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.219 Y129.83 E.00232
G3 X126.167 Y130.266 I-.223 J.194 E.01638
G3 X126.104 Y129.75 I-.165 J-.242 E.03982
G1 X126.113 Y129.756 E.00034
G1 X126.39 Y129.459 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.391 Y130.591 I-.399 J.566 E.04069
G3 X126.244 Y129.38 I-.388 J-.567 E.08652
G3 X126.34 Y129.427 I-.254 J.645 E.00326
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08563
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04369
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.399 J1.15 P1  F30000
G1 X128.747 Y129.658 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.249 J.364 E.00988
G1 X129.149 Y129.609 E.00302
G3 X128.7 Y129.696 I-.152 J.413 E.07029
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06317
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.149 Y129.609 E-.03735
G1 X129.252 Y129.661 E-.04416
G1 X129.331 Y129.731 E-.03995
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.164 Y130.434 E-.03735
G1 X129.052 Y130.463 E-.04416
G1 X128.947 Y130.463 E-.03995
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00819
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.22 J1.197 P1  F30000
G1 X130.849 Y129.986 Z4
G1 Z3.6
M73 P79 R1
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.149 J.038 E.00611
G1 X131.051 Y129.879 E.00091
G3 X130.847 Y130.047 I-.053 J.144 E.01766
M204 S10000
; WIPE_START
M73 P80 R1
G1 F24000
G1 X130.912 Y129.897 E-.13124
G1 X131.019 Y129.871 E-.08783
G1 X131.051 Y129.879 E-.02677
G1 X131.136 Y129.951 E-.08952
G1 X131.15 Y130.061 E-.08879
G1 X131.088 Y130.151 E-.08783
G1 X130.981 Y130.177 E-.08783
G1 X130.912 Y130.151 E-.05927
G1 X130.864 Y130.096 E-.05927
G1 X130.847 Y130.047 E-.04165
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.016 J1.217 P1  F30000
G1 X132.979 Y130.019 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.006 Y130.003 E.00086
G1 X133.021 Y130.029 E.00083
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.006 Y130.003 E-.36954
G1 X133.021 Y130.029 E-.36992
G1 X133.02 Y130.03 E-.02054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/55
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
G3 Z4 I1.05 J-.615 P1  F30000
G1 X130.784 Y126.216 Z4
G1 Z3.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.035 Y125.738 I.212 J-.193 E.02157
G1 X131.094 Y125.752 E.00188
G3 X130.829 Y126.256 I-.098 J.27 E.03014
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08273
G1 X130.712 Y126.024 E-.02943
G1 X130.745 Y125.89 E-.05843
G1 X130.838 Y125.786 E-.05925
G1 X130.965 Y125.738 E-.05756
G1 X131.035 Y125.738 E-.02943
G1 X131.094 Y125.752 E-.02583
G1 X131.165 Y125.788 E-.03377
G1 X131.255 Y125.89 E-.05757
G1 X131.28 Y125.955 E-.02943
G1 X131.28 Y126.093 E-.05843
G1 X131.216 Y126.215 E-.05843
G1 X131.164 Y126.262 E-.02943
G1 X131.033 Y126.311 E-.05925
G1 X130.965 Y126.311 E-.02856
G1 X130.836 Y126.262 E-.05843
G1 X130.829 Y126.256 E-.00404
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.101 J-1.213 P1  F30000
G1 X128.869 Y126.093 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.852 Y126.061 E.00121
G3 X129.018 Y125.872 I.148 J-.037 E.00979
G1 X129.054 Y125.881 E.00122
G3 X128.903 Y126.141 I-.054 J.142 E.01754
G1 X128.518 Y126.277 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.066 Y125.48 I.483 J-.255 E.03652
G1 X129.194 Y125.512 E.00406
G3 X128.549 Y126.329 I-.194 J.51 E.06296
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.0727
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.194 Y125.512 E-.05019
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03483
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.109 J-1.212 P1  F30000
G1 X126.287 Y126.277 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.222 Y126.346 E.00314
G3 X126.047 Y125.634 I-.222 J-.323 E.05025
G1 X126.14 Y125.656 E.00315
G3 X126.347 Y126.206 I-.139 J.367 E.02204
G1 X126.326 Y126.231 E.00109
G1 X126.587 Y126.544 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.095 Y125.241 I-.586 J-.523 E.09908
G1 X126.28 Y125.287 E.00584
G3 X126.625 Y126.498 I-.279 J.734 E.04489
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09471
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01523
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.219 Y129.83 E.00232
G3 X126.167 Y130.266 I-.223 J.194 E.01638
G3 X126.104 Y129.75 I-.165 J-.242 E.03982
G1 X126.113 Y129.756 E.00034
G1 X126.39 Y129.459 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.391 Y130.591 I-.399 J.566 E.04069
G3 X126.244 Y129.38 I-.388 J-.567 E.08652
G3 X126.34 Y129.427 I-.254 J.645 E.00326
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08563
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04369
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.398 J1.15 P1  F30000
G1 X128.749 Y129.661 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.251 J.362 E.00985
G1 X129.157 Y129.611 E.00328
G3 X128.702 Y129.698 I-.156 J.412 E.0701
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06309
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.157 Y129.611 E-.04052
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.219 J1.197 P1  F30000
G1 X130.848 Y129.987 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.149 J.036 E.00617
G1 X131.049 Y129.879 E.00087
G3 X130.846 Y130.047 I-.052 J.144 E.01766
M204 S10000
; WIPE_START
G1 F24000
G1 X130.912 Y129.897 E-.13207
G1 X131.019 Y129.871 E-.08794
G1 X131.049 Y129.879 E-.02553
G1 X131.136 Y129.953 E-.09183
G1 X131.15 Y130.061 E-.08794
G1 X131.088 Y130.151 E-.08794
G1 X130.981 Y130.177 E-.08794
G1 X130.885 Y130.126 E-.08794
G1 X130.85 Y130.061 E-.05935
G1 X130.846 Y130.047 E-.01152
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.017 J1.217 P1  F30000
G1 X132.979 Y130.017 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.005 Y130.003 E.0008
G1 X133.021 Y130.029 E.00084
G1 X133.019 Y130.031 E.00008
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.005 Y130.003 E-.36537
G1 X133.021 Y130.029 E-.36209
G1 X133.019 Y130.031 E-.03254
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/55
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
G3 Z4.2 I1.05 J-.615 P1  F30000
G1 X130.785 Y126.214 Z4.2
G1 Z4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.102 Y125.754 I.216 J-.19 E.02344
G3 X131.164 Y126.262 I-.106 J.27 E.01919
G3 X130.83 Y126.255 I-.162 J-.238 E.01095
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08291
G1 X130.72 Y125.955 E-.0585
G1 X130.745 Y125.89 E-.02947
G1 X130.836 Y125.787 E-.0585
G1 X130.965 Y125.738 E-.0585
G1 X131.102 Y125.754 E-.0585
G1 X131.216 Y125.833 E-.0585
G1 X131.28 Y125.955 E-.0585
G1 X131.28 Y126.093 E-.0585
G1 X131.255 Y126.158 E-.02947
G1 X131.164 Y126.262 E-.0585
G1 X131.035 Y126.311 E-.0585
G1 X130.898 Y126.294 E-.0585
G1 X130.83 Y126.255 E-.03312
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.1 J-1.213 P1  F30000
G1 X128.869 Y126.093 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.853 Y126.061 E.00121
G3 X129.054 Y125.881 I.148 J-.036 E.01098
G3 X129.087 Y126.15 I-.056 J.143 E.01098
G3 X128.903 Y126.141 I-.086 J-.126 E.00655
G1 X128.518 Y126.277 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.194 Y125.512 I.484 J-.253 E.04049
G3 X129.311 Y126.475 I-.202 J.513 E.03644
G3 X128.549 Y126.329 I-.309 J-.451 E.02652
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07271
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.194 Y125.512 E-.05019
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03482
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.112 J-1.212 P1  F30000
G1 X126.293 Y126.283 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.047 Y125.634 I-.293 J-.261 E.05341
G1 X126.138 Y125.656 E.00311
G3 X126.329 Y126.236 I-.139 J.367 E.0232
G1 X126.589 Y126.546 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.448 Y126.673 I-.599 J-.52 E.00585
G3 X126.278 Y125.287 I-.444 J-.649 E.09903
G1 X126.28 Y125.287 E.00005
G3 X126.626 Y126.499 I-.29 J.739 E.04475
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09472
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01522
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.181 J.295 P1  F30000
G1 X126.167 Y129.783 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.035 Y129.733 I-.166 J.24 E.05625
G1 X126.104 Y129.75 E.00235
G3 X126.114 Y129.754 I-.104 J.273 E.00036
G1 X126.39 Y129.459 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.391 Y130.591 I-.399 J.566 E.04069
G3 X126.244 Y129.38 I-.388 J-.567 E.08652
G3 X126.34 Y129.427 I-.254 J.645 E.00326
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08563
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04368
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.398 J1.15 P1  F30000
G1 X128.749 Y129.661 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.251 J.362 E.00985
G1 X129.157 Y129.611 E.00328
G3 X128.702 Y129.698 I-.156 J.412 E.07011
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06309
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.157 Y129.611 E-.04052
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.237 J1.194 P1  F30000
G1 X130.861 Y129.951 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.136 J.072 E.00515
G1 X131.048 Y129.878 E.00082
G3 X130.844 Y130.01 I-.051 J.145 E.01871
M204 S10000
; WIPE_START
G1 F24000
G1 X130.912 Y129.897 E-.10545
G1 X131.019 Y129.871 E-.08764
G1 X131.048 Y129.878 E-.02416
G1 X131.136 Y129.953 E-.09267
G1 X131.15 Y130.061 E-.08765
G1 X131.088 Y130.151 E-.08765
G1 X130.981 Y130.177 E-.08764
G1 X130.885 Y130.126 E-.08765
G1 X130.846 Y130.024 E-.08764
G1 X130.844 Y130.01 E-.01184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.005 J1.217 P1  F30000
G1 X132.979 Y130.019 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.004 Y130.003 E.00083
G1 X133.021 Y130.029 E.00086
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.004 Y130.003 E-.37074
G1 X133.021 Y130.029 E-.36946
G1 X133.02 Y130.03 E-.0198
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/55
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
G3 Z4.4 I1.05 J-.615 P1  F30000
G1 X130.786 Y126.214 Z4.4
G1 Z4.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.035 Y125.738 I.215 J-.191 E.02136
G1 X131.102 Y125.754 E.00214
G3 X130.83 Y126.255 I-.102 J.269 E.03015
M204 S10000
; WIPE_START
G1 F24000
G1 X130.745 Y126.158 E-.05436
G1 X130.712 Y126.024 E-.05836
G1 X130.745 Y125.89 E-.05836
G1 X130.784 Y125.833 E-.0294
G1 X130.898 Y125.754 E-.05836
G1 X131.035 Y125.738 E-.05836
G1 X131.102 Y125.754 E-.0294
G1 X131.216 Y125.833 E-.05836
G1 X131.255 Y125.89 E-.0294
G1 X131.28 Y125.955 E-.0294
G1 X131.28 Y126.093 E-.05836
G1 X131.255 Y126.158 E-.0294
M73 P81 R1
G1 X131.164 Y126.262 E-.05836
G1 X131.035 Y126.311 E-.05836
G1 X130.965 Y126.311 E-.0294
G1 X130.836 Y126.262 E-.05836
G1 X130.83 Y126.255 E-.004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.1 J-1.213 P1  F30000
G1 X128.869 Y126.093 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.852 Y126.061 E.00121
G3 X129.018 Y125.872 I.148 J-.037 E.00979
G1 X129.054 Y125.881 E.00122
G3 X128.903 Y126.141 I-.054 J.142 E.01754
G1 X128.518 Y126.277 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.194 Y125.512 I.484 J-.253 E.04049
G3 X129.311 Y126.475 I-.202 J.513 E.03644
G3 X128.549 Y126.329 I-.309 J-.451 E.02652
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07271
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.194 Y125.512 E-.05019
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03482
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.109 J-1.212 P1  F30000
G1 X126.287 Y126.277 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.222 Y126.346 E.00313
G3 X126.047 Y125.634 I-.222 J-.323 E.05025
G1 X126.14 Y125.656 E.00315
G3 X126.347 Y126.206 I-.139 J.367 E.02204
G1 X126.326 Y126.231 E.00109
G1 X126.584 Y126.542 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.095 Y125.241 I-.587 J-.521 E.09923
G1 X126.272 Y125.285 E.00561
G3 X126.623 Y126.495 I-.275 J.736 E.04493
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09463
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01531
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.219 Y129.83 E.00232
G3 X126.167 Y130.266 I-.223 J.194 E.01638
G3 X126.104 Y129.75 I-.165 J-.242 E.03982
G1 X126.113 Y129.756 E.00034
G1 X126.39 Y129.459 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.083 Y129.341 I-.392 J.563 E.12219
G1 X126.24 Y129.379 E.00497
G3 X126.34 Y129.426 I-.241 J.642 E.00339
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08563
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04369
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.398 J1.15 P1  F30000
G1 X128.749 Y129.661 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.251 J.362 E.00985
G1 X129.157 Y129.611 E.00328
G3 X128.702 Y129.698 I-.156 J.412 E.07011
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06309
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.157 Y129.611 E-.04052
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.252 J1.191 P1  F30000
G1 X130.882 Y129.92 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.114 J.103 E.00412
G1 X131.046 Y129.878 E.00078
G3 X130.851 Y129.972 I-.05 J.145 E.01976
M204 S10000
; WIPE_START
G1 F24000
G1 X130.945 Y129.88 E-.10566
G1 X131.019 Y129.871 E-.05902
G1 X131.046 Y129.878 E-.02281
G1 X131.136 Y129.953 E-.09364
G1 X131.15 Y130.061 E-.08746
G1 X131.088 Y130.151 E-.08746
G1 X130.981 Y130.177 E-.08746
G1 X130.885 Y130.126 E-.08746
G1 X130.846 Y130.024 E-.08746
G1 X130.851 Y129.972 E-.04157
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.025 J1.217 P1  F30000
G1 X132.98 Y130.016 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.004 Y130.003 E.00075
G1 X133.021 Y130.029 E.00087
G1 X133.018 Y130.031 E.00009
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.004 Y130.003 E-.36256
G1 X133.021 Y130.029 E-.35982
G1 X133.018 Y130.031 E-.03762
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/55
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
G3 Z4.6 I1.05 J-.615 P1  F30000
G1 X130.785 Y126.214 Z4.6
G1 Z4.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.102 Y125.754 I.216 J-.19 E.02344
G3 X131.164 Y126.262 I-.106 J.27 E.01919
G3 X130.83 Y126.255 I-.162 J-.238 E.01095
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08291
G1 X130.72 Y125.955 E-.0585
G1 X130.784 Y125.833 E-.0585
G1 X130.898 Y125.754 E-.0585
G1 X130.965 Y125.738 E-.02947
G1 X131.102 Y125.754 E-.0585
G1 X131.216 Y125.833 E-.05851
G1 X131.28 Y125.955 E-.0585
G1 X131.28 Y126.093 E-.0585
G1 X131.255 Y126.158 E-.02947
G1 X131.164 Y126.262 E-.0585
G1 X131.035 Y126.311 E-.0585
G1 X130.898 Y126.294 E-.0585
G1 X130.83 Y126.255 E-.03312
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.1 J-1.213 P1  F30000
G1 X128.869 Y126.093 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.852 Y126.061 E.00121
G3 X129.018 Y125.872 I.148 J-.037 E.00979
G1 X129.054 Y125.881 E.00122
G3 X128.903 Y126.141 I-.054 J.142 E.01754
G1 X128.516 Y126.278 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.066 Y125.48 I.482 J-.256 E.03662
G1 X129.19 Y125.511 E.00393
G3 X128.548 Y126.329 I-.192 J.511 E.06297
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07273
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.587 Y125.664 E-.04857
G1 X128.689 Y125.573 E-.05176
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.19 Y125.511 E-.04858
G1 X129.311 Y125.573 E-.05176
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.0349
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.109 J-1.212 P1  F30000
G1 X126.287 Y126.277 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.224 Y126.348 E.00315
G3 X126.14 Y125.656 I-.222 J-.324 E.05339
G3 X126.347 Y126.206 I-.145 J.369 E.02196
G1 X126.325 Y126.231 E.00109
G1 X126.583 Y126.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.095 Y125.241 I-.589 J-.52 E.09947
G1 X126.266 Y125.284 E.00542
G3 X126.621 Y126.494 I-.273 J.737 E.045
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09459
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01535
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.219 Y129.83 E.00232
G3 X126.167 Y130.266 I-.223 J.194 E.01638
G3 X126.104 Y129.75 I-.165 J-.242 E.03982
G1 X126.113 Y129.756 E.00034
G1 X126.39 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.083 Y129.341 I-.394 J.562 E.12237
G1 X126.235 Y129.378 E.0048
G3 X126.339 Y129.427 I-.239 J.644 E.00355
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.0856
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04371
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.398 J1.15 P1  F30000
G1 X128.749 Y129.66 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.251 J.364 E.00985
G1 X129.157 Y129.611 E.00327
G1 X129.157 Y129.611 E0
G3 X128.702 Y129.698 I-.157 J.414 E.07041
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06311
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.157 Y129.611 E-.04047
G1 X129.157 Y129.611 E-.00005
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00804
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.26 J1.189 P1  F30000
G1 X130.913 Y129.897 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.088 J.126 E.00305
G1 X131.055 Y129.88 E.00102
G3 X130.87 Y129.942 I-.055 J.144 E.02063
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.13204
G1 X131.055 Y129.88 E-.02987
G1 X131.136 Y129.953 E-.08789
G1 X131.15 Y130.061 E-.08789
G1 X131.088 Y130.151 E-.08789
G1 X131.019 Y130.177 E-.05931
G1 X130.945 Y130.168 E-.05931
G1 X130.864 Y130.096 E-.08789
G1 X130.85 Y129.987 E-.08789
G1 X130.87 Y129.942 E-.04002
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.045 J1.216 P1  F30000
G1 X132.979 Y130.019 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.003 Y130.003 E.0008
G1 X133.021 Y130.029 E.00089
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.003 Y130.003 E-.37074
G1 X133.021 Y130.029 E-.37019
G1 X133.02 Y130.03 E-.01907
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/55
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
G3 Z4.8 I1.05 J-.615 P1  F30000
G1 X130.786 Y126.214 Z4.8
G1 Z4.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.035 Y125.738 I.215 J-.191 E.02136
G1 X131.102 Y125.754 E.00214
G3 X130.83 Y126.255 I-.102 J.269 E.03013
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08275
G1 X130.712 Y126.024 E-.02942
G1 X130.745 Y125.89 E-.05841
G1 X130.784 Y125.833 E-.02942
G1 X130.898 Y125.754 E-.05841
G1 X131.035 Y125.738 E-.05841
G1 X131.102 Y125.754 E-.02942
G1 X131.216 Y125.833 E-.05841
G1 X131.255 Y125.89 E-.02942
G1 X131.28 Y125.955 E-.02942
G1 X131.28 Y126.093 E-.05841
G1 X131.255 Y126.158 E-.02942
G1 X131.164 Y126.262 E-.05841
G1 X131.102 Y126.294 E-.02942
G1 X130.965 Y126.311 E-.05841
G1 X130.898 Y126.294 E-.02942
G1 X130.83 Y126.255 E-.03303
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.099 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.514 Y126.279 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.066 Y125.48 I.482 J-.257 E.03675
G1 X129.186 Y125.51 E.00379
G3 X128.545 Y126.331 I-.19 J.512 E.06307
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07279
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.186 Y125.51 E-.04684
G1 X129.311 Y125.573 E-.05345
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03483
; WIPE_END
M73 P82 R1
G1 E-.04 F1800
G17
G3 Z5 I-.112 J-1.212 P1  F30000
G1 X126.293 Y126.284 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.047 Y125.634 I-.293 J-.261 E.05338
G1 X126.14 Y125.656 E.00315
G3 X126.329 Y126.236 I-.139 J.367 E.02319
G1 X126.586 Y126.543 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.214 Y126.044 I-.587 J-.521 E.05762
G1 X125.214 Y126.044 E0
G3 X126.26 Y125.282 I.794 J-.008 E.04648
G3 X126.624 Y126.497 I-.262 J.74 E.04535
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09467
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.214 Y126.044 E-.06474
G1 X125.214 Y126.044 E0
G1 X125.22 Y125.984 E-.02275
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.181 J.292 P1  F30000
G1 X126.162 Y129.79 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.219 Y129.83 E.00232
G3 X126.167 Y130.266 I-.223 J.194 E.01638
G3 X126.104 Y129.75 I-.165 J-.242 E.03982
G1 X126.113 Y129.756 E.00034
G1 X126.389 Y129.461 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.083 Y129.341 I-.396 J.561 E.12237
G1 X126.229 Y129.377 E.00463
G3 X126.339 Y129.428 I-.237 J.645 E.00371
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08559
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04373
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.399 J1.15 P1  F30000
G1 X128.748 Y129.659 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.25 J.364 E.00987
G1 X129.153 Y129.61 E.00315
G3 X128.701 Y129.697 I-.155 J.413 E.07033
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06314
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.153 Y129.61 E-.03898
G1 X129.251 Y129.66 E-.04202
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.26 J1.189 P1  F30000
G1 X130.913 Y129.897 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.088 J.126 E.00305
G1 X131.055 Y129.88 E.00102
G3 X130.87 Y129.942 I-.055 J.144 E.02063
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.13204
G1 X131.055 Y129.88 E-.02987
G1 X131.136 Y129.953 E-.08789
G1 X131.15 Y130.061 E-.08788
G1 X131.088 Y130.151 E-.08789
G1 X131.019 Y130.177 E-.05932
G1 X130.945 Y130.168 E-.05932
G1 X130.864 Y130.096 E-.08789
G1 X130.85 Y129.987 E-.08789
G1 X130.87 Y129.942 E-.04002
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.039 J1.216 P1  F30000
G1 X132.984 Y130.01 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.015 Y130.009 E.00086
G1 X133.016 Y130.039 E.00082
G1 X133.015 Y130.039 E.00004
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.015 Y130.009 E-.37132
G1 X133.016 Y130.039 E-.3691
G1 X133.015 Y130.039 E-.01958
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/55
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
G3 Z5 I1.051 J-.613 P1  F30000
G1 X130.785 Y126.215 Z5
G1 Z4.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.712 Y126.024 I.214 J-.192 E.00641
G1 X130.712 Y126.024 E0
G3 X131.102 Y125.754 I.3 J.017 E.01681
G1 X131.102 Y125.754 E0
G3 X130.829 Y126.255 I-.103 J.269 E.03011
M204 S10000
; WIPE_START
G1 F24000
G1 X130.745 Y126.158 E-.0546
G1 X130.712 Y126.024 E-.05838
G1 X130.712 Y126.024 E-.00005
G1 X130.745 Y125.89 E-.05844
G1 X130.836 Y125.787 E-.05844
G1 X130.965 Y125.738 E-.05844
G1 X131.102 Y125.754 E-.05839
G1 X131.102 Y125.754 E-.00005
G1 X131.216 Y125.833 E-.05844
G1 X131.28 Y125.955 E-.05844
G1 X131.28 Y126.093 E-.05843
G1 X131.216 Y126.215 E-.05844
G1 X131.164 Y126.262 E-.02943
G1 X131.035 Y126.311 E-.05844
G1 X130.898 Y126.294 E-.05844
G1 X130.829 Y126.255 E-.03317
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.099 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.01101
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.513 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.066 Y125.48 I.48 J-.259 E.03683
G1 X129.181 Y125.509 E.00365
G3 X128.545 Y126.331 I-.187 J.512 E.06299
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.0728
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.181 Y125.509 E-.0451
G1 X129.311 Y125.573 E-.05515
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03486
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.107 J-1.212 P1  F30000
G1 X126.291 Y126.272 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.222 Y126.346 E.00334
G3 X126.047 Y125.634 I-.222 J-.323 E.05025
G1 X126.14 Y125.656 E.00315
G3 X126.347 Y126.206 I-.139 J.367 E.02204
G1 X126.33 Y126.227 E.00089
G1 X126.592 Y126.538 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.444 Y126.667 E.00602
G3 X125.905 Y125.241 I-.45 J-.645 E.08783
G3 X126.255 Y125.281 I.095 J.729 E.01092
G1 X126.255 Y125.281 E0
G3 X126.626 Y126.489 I-.26 J.742 E.04515
M204 S10000
; WIPE_START
G1 F24000
G1 X126.444 Y126.667 E-.09676
G1 X126.28 Y126.761 E-.07193
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.989 E-.01348
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.18 J.296 P1  F30000
G1 X126.167 Y129.783 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.035 Y129.733 I-.166 J.24 E.05624
G1 X126.104 Y129.75 E.00235
G3 X126.114 Y129.754 I-.104 J.273 E.00036
G1 X126.389 Y129.461 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.917 Y129.341 I-.394 J.561 E.11709
G3 X126.224 Y129.376 I.083 J.64 E.00959
G3 X126.338 Y129.428 I-.229 J.646 E.00387
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08557
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04375
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.399 J1.15 P1  F30000
G1 X128.747 Y129.658 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.249 J.365 E.00988
G1 X129.149 Y129.609 E.00303
G3 X128.7 Y129.695 I-.153 J.414 E.07045
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06318
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.149 Y129.609 E-.03748
G1 X129.251 Y129.66 E-.04348
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00805
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.26 J1.189 P1  F30000
G1 X130.913 Y129.897 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.088 J.126 E.00305
G1 X131.055 Y129.88 E.00102
G3 X130.871 Y129.941 I-.055 J.144 E.02065
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.1317
G1 X131.055 Y129.88 E-.02992
G1 X131.136 Y129.953 E-.08801
G1 X131.15 Y130.061 E-.08801
G1 X131.088 Y130.151 E-.08802
G1 X130.981 Y130.177 E-.08801
G1 X130.885 Y130.126 E-.08801
G1 X130.846 Y130.024 E-.08801
G1 X130.864 Y129.953 E-.0594
G1 X130.871 Y129.941 E-.01092
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.04 J1.216 P1  F30000
G1 X132.984 Y130.01 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.015 Y130.009 E.00087
G1 X133.016 Y130.039 E.00081
G1 X133.015 Y130.039 E.00004
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.015 Y130.009 E-.37189
G1 X133.016 Y130.039 E-.36948
G1 X133.015 Y130.039 E-.01863
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/55
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
G3 Z5.2 I1.051 J-.613 P1  F30000
G1 X130.786 Y126.214 Z5.2
G1 Z5
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.035 Y125.738 I.215 J-.191 E.02136
G1 X131.099 Y125.754 E.00204
G1 X131.102 Y125.754 E.0001
G3 X130.83 Y126.255 I-.102 J.269 E.03015
M204 S10000
; WIPE_START
G1 F24000
G1 X130.745 Y126.158 E-.05436
G1 X130.712 Y126.024 E-.05836
G1 X130.745 Y125.89 E-.05836
G1 X130.836 Y125.787 E-.05836
G1 X130.898 Y125.754 E-.0294
G1 X131.035 Y125.738 E-.05836
G1 X131.099 Y125.754 E-.02807
G1 X131.102 Y125.754 E-.00132
G1 X131.164 Y125.787 E-.0294
G1 X131.255 Y125.89 E-.05836
G1 X131.28 Y125.955 E-.02939
G1 X131.28 Y126.093 E-.05836
G1 X131.216 Y126.215 E-.05836
G1 X131.164 Y126.262 E-.0294
G1 X131.035 Y126.311 E-.05836
G1 X130.965 Y126.311 E-.0294
G1 X130.836 Y126.262 E-.05836
G1 X130.83 Y126.255 E-.004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.099 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.51 Y126.281 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.066 Y125.48 I.481 J-.26 E.03699
G1 X129.177 Y125.508 E.00351
G3 X128.542 Y126.332 I-.185 J.514 E.06316
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.0729
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.177 Y125.508 E-.04336
G1 X129.311 Y125.573 E-.05685
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.0348
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.112 J-1.212 P1  F30000
G1 X126.293 Y126.284 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.047 Y125.634 I-.293 J-.261 E.05338
G1 X126.14 Y125.656 E.00315
G3 X126.329 Y126.236 I-.139 J.367 E.02319
G1 X126.588 Y126.545 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.215 Y126.056 I-.588 J-.521 E.05734
G1 X125.215 Y126.056 E0
G3 X126.249 Y125.279 I.788 J-.027 E.04655
G3 X126.626 Y126.498 I-.249 J.745 E.04577
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09473
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.215 Y126.056 E-.06016
G1 X125.215 Y126.056 E0
G1 X125.222 Y125.984 E-.02728
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.181 J.292 P1  F30000
G1 X126.162 Y129.79 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.22 Y129.83 E.00233
G3 X126.035 Y129.733 I-.219 J.193 E.05389
M73 P83 R1
G1 X126.104 Y129.75 E.00235
G1 X126.113 Y129.756 E.00034
G1 X126.389 Y129.461 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.917 Y129.341 I-.394 J.561 E.11708
G3 X126.219 Y129.374 I.083 J.629 E.00942
G3 X126.338 Y129.429 I-.225 J.648 E.00404
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08555
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04376
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.4 J1.149 P1  F30000
G1 X128.747 Y129.657 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.248 J.365 E.0099
G1 X129.145 Y129.608 E.00291
G3 X128.699 Y129.694 I-.151 J.414 E.07047
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06321
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.145 Y129.608 E-.03598
G1 X129.251 Y129.66 E-.04494
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.26 J1.189 P1  F30000
G1 X130.913 Y129.897 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.088 J.126 E.00305
G1 X131.055 Y129.88 E.00102
G3 X130.87 Y129.942 I-.055 J.144 E.02063
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.13204
G1 X131.055 Y129.88 E-.02988
G1 X131.136 Y129.953 E-.08789
G1 X131.15 Y130.061 E-.08788
G1 X131.088 Y130.151 E-.08789
G1 X131.019 Y130.177 E-.05931
G1 X130.945 Y130.168 E-.05931
G1 X130.864 Y130.096 E-.08789
G1 X130.85 Y129.987 E-.08789
G1 X130.87 Y129.942 E-.04002
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.039 J1.216 P1  F30000
G1 X132.984 Y130.01 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.016 Y130.009 E.00088
G1 X133.016 Y130.039 E.00081
G1 X133.015 Y130.039 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.016 Y130.009 E-.36957
G1 X133.016 Y130.039 E-.36941
G1 X133.015 Y130.039 E-.02102
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/55
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
G3 Z5.4 I1.051 J-.613 P1  F30000
G1 X130.784 Y126.216 Z5.4
G1 Z5.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.035 Y125.738 I.213 J-.193 E.02153
G1 X131.096 Y125.753 E.00195
G3 X130.828 Y126.256 I-.099 J.27 E.03019
M204 S10000
; WIPE_START
G1 F24000
G1 X130.745 Y126.158 E-.05442
G1 X130.712 Y126.024 E-.05836
G1 X130.745 Y125.89 E-.05836
G1 X130.784 Y125.833 E-.02939
G1 X130.898 Y125.754 E-.05836
G1 X131.035 Y125.738 E-.05836
G1 X131.096 Y125.753 E-.0268
G1 X131.164 Y125.787 E-.03192
G1 X131.255 Y125.89 E-.05836
G1 X131.28 Y125.955 E-.0294
G1 X131.28 Y126.093 E-.05836
G1 X131.255 Y126.158 E-.0294
G1 X131.164 Y126.262 E-.05836
G1 X131.035 Y126.311 E-.05836
G1 X130.965 Y126.311 E-.02939
G1 X130.836 Y126.262 E-.05836
G1 X130.828 Y126.256 E-.00404
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.1 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.513 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.934 Y125.48 I.482 J-.257 E.03269
G3 X129.172 Y125.506 I.066 J.497 E.00744
G3 X128.544 Y126.331 I-.177 J.516 E.06345
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07282
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.172 Y125.506 E-.04162
G1 X129.311 Y125.573 E-.05855
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03492
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.222 Y126.346 E.00313
G3 X126.047 Y125.634 I-.222 J-.323 E.05025
G1 X126.14 Y125.656 E.00315
G3 X126.347 Y126.206 I-.139 J.367 E.02204
G1 X126.325 Y126.231 E.0011
G1 X126.582 Y126.54 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.905 Y125.241 I-.59 J-.518 E.09364
G3 X126.243 Y125.278 I.095 J.704 E.01055
G3 X126.62 Y126.493 I-.251 J.744 E.04557
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09454
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.0154
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.181 J.295 P1  F30000
G1 X126.167 Y129.783 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.035 Y129.733 I-.166 J.24 E.05624
G1 X126.104 Y129.75 E.00235
G3 X126.114 Y129.754 I-.104 J.273 E.00036
G1 X126.388 Y129.462 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.917 Y129.341 I-.395 J.56 E.11708
G3 X126.214 Y129.373 I.083 J.618 E.00926
G3 X126.338 Y129.429 I-.22 J.649 E.0042
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08554
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.4 J1.149 P1  F30000
G1 X128.746 Y129.656 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.246 J.366 E.00991
G1 X129.141 Y129.607 E.00279
G3 X128.698 Y129.693 I-.149 J.415 E.07067
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06324
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.141 Y129.607 E-.03448
G1 X129.251 Y129.66 E-.0464
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.26 J1.189 P1  F30000
G1 X130.913 Y129.898 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.055 Y129.88 I.088 J.126 E.00407
G3 X131.088 Y130.151 I-.057 J.144 E.00912
G3 X130.871 Y129.941 I-.087 J-.127 E.01151
M204 S10000
; WIPE_START
G1 F24000
G1 X130.981 Y129.871 E-.10433
G1 X131.055 Y129.88 E-.05883
G1 X131.115 Y129.922 E-.05883
G1 X131.154 Y130.024 E-.08717
G1 X131.136 Y130.096 E-.05883
G1 X131.088 Y130.151 E-.05883
G1 X131.019 Y130.177 E-.05883
G1 X130.912 Y130.151 E-.08717
G1 X130.864 Y130.096 E-.05883
G1 X130.846 Y130.024 E-.05883
G1 X130.864 Y129.953 E-.05883
G1 X130.871 Y129.941 E-.01071
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.045 J1.216 P1  F30000
G1 X132.979 Y130.019 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00089
G1 X133.021 Y130.029 E.00079
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.36961
G1 X133.021 Y130.029 E-.369
G1 X133.02 Y130.03 E-.02139
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/55
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
G3 Z5.6 I1.051 J-.614 P1  F30000
G1 X130.787 Y126.212 Z5.6
G1 Z5.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.035 Y125.738 I.209 J-.193 E.02141
G1 X131.093 Y125.752 E.00186
G3 X130.832 Y126.252 I-.097 J.267 E.02979
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08211
G1 X130.712 Y126.024 E-.02943
G1 X130.745 Y125.89 E-.05843
G1 X130.836 Y125.787 E-.05843
G1 X130.965 Y125.738 E-.05843
G1 X131.035 Y125.738 E-.02943
G1 X131.093 Y125.752 E-.02555
G1 X131.164 Y125.787 E-.0332
G1 X131.255 Y125.89 E-.05843
G1 X131.28 Y125.955 E-.02943
G1 X131.28 Y126.093 E-.05842
G1 X131.255 Y126.158 E-.02943
G1 X131.164 Y126.262 E-.05843
G1 X131.035 Y126.311 E-.05843
G1 X130.965 Y126.311 E-.02943
G1 X130.836 Y126.262 E-.05843
G1 X130.832 Y126.252 E-.00458
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.097 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.512 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.934 Y125.48 I.482 J-.257 E.03275
G3 X129.168 Y125.505 I.066 J.487 E.0073
G3 X128.543 Y126.332 I-.174 J.518 E.06362
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07286
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.168 Y125.505 E-.03988
G1 X129.311 Y125.573 E-.06025
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03492
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.222 Y126.346 E.00313
G3 X126.047 Y125.634 I-.222 J-.323 E.05025
G1 X126.14 Y125.656 E.00315
G3 X126.347 Y126.206 I-.139 J.367 E.02204
G1 X126.325 Y126.231 E.0011
G1 X126.583 Y126.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.72 Y125.287 I-.589 J-.518 E.08763
G3 X126.237 Y125.276 I.275 J.807 E.01613
G3 X126.621 Y126.494 I-.243 J.746 E.04581
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09457
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01537
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.181 J.295 P1  F30000
G1 X126.167 Y129.783 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.035 Y129.733 I-.166 J.24 E.05624
G1 X126.104 Y129.75 E.00235
G3 X126.114 Y129.754 I-.104 J.273 E.00036
G1 X126.388 Y129.462 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.917 Y129.341 I-.396 J.56 E.11708
G3 X126.208 Y129.372 I.083 J.606 E.00909
G3 X126.337 Y129.43 I-.216 J.651 E.00436
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08553
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04379
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.401 J1.149 P1  F30000
G1 X128.745 Y129.655 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.245 J.367 E.00993
G1 X129.138 Y129.606 E.00267
G1 X129.138 Y129.606 E0
G3 X128.698 Y129.692 I-.147 J.416 E.07074
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06326
M73 P84 R1
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.138 Y129.606 E-.03299
G1 X129.138 Y129.606 E0
G1 X129.251 Y129.66 E-.04787
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00807
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.265 J1.188 P1  F30000
G1 X130.945 Y129.88 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.054 Y129.88 I.055 J.144 E.00303
G1 X131.055 Y129.88 E.00003
G3 X131.088 Y130.151 I-.057 J.144 E.00912
G3 X130.894 Y129.912 I-.088 J-.127 E.01259
M204 S10000
; WIPE_START
G1 F24000
G1 X131.054 Y129.88 E-.13021
G1 X131.055 Y129.88 E-.00073
G1 X131.115 Y129.922 E-.05898
G1 X131.15 Y129.987 E-.05898
G1 X131.136 Y130.096 E-.08739
G1 X131.088 Y130.151 E-.05898
G1 X131.019 Y130.177 E-.05898
G1 X130.945 Y130.168 E-.05898
G1 X130.885 Y130.126 E-.05898
G1 X130.85 Y130.061 E-.05898
G1 X130.85 Y129.987 E-.05898
G1 X130.885 Y129.922 E-.05898
G1 X130.894 Y129.912 E-.01087
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.062 J1.215 P1  F30000
G1 X132.979 Y130.019 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00089
G1 X133.021 Y130.029 E.00079
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.36962
G1 X133.021 Y130.029 E-.369
G1 X133.02 Y130.03 E-.02138
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/55
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
G3 Z5.8 I1.05 J-.615 P1  F30000
G1 X130.785 Y126.214 Z5.8
G1 Z5.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.713 Y126.036 I.214 J-.191 E.00602
G1 X130.713 Y126.036 E0
G3 X131.09 Y125.752 I.288 J-.01 E.01703
G3 X130.83 Y126.255 I-.091 J.272 E.03044
M204 S10000
; WIPE_START
G1 F24000
G1 X130.745 Y126.158 E-.05465
G1 X130.713 Y126.036 E-.05337
G1 X130.713 Y126.036 E0
G1 X130.745 Y125.89 E-.06333
G1 X130.836 Y125.787 E-.05848
G1 X130.965 Y125.738 E-.05848
G1 X131.09 Y125.752 E-.05337
G1 X131.216 Y125.833 E-.06333
G1 X131.28 Y125.955 E-.05848
G1 X131.28 Y126.093 E-.05848
G1 X131.255 Y126.158 E-.02946
G1 X131.164 Y126.262 E-.05848
G1 X131.035 Y126.311 E-.05848
G1 X130.898 Y126.294 E-.05848
G1 X130.83 Y126.255 E-.03312
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.099 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.511 Y126.281 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.934 Y125.48 I.482 J-.257 E.03278
G3 X129.163 Y125.504 I.066 J.478 E.00716
G3 X128.542 Y126.332 I-.17 J.519 E.0637
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07287
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.163 Y125.504 E-.03814
G1 X129.311 Y125.573 E-.06196
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03494
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.112 J-1.212 P1  F30000
G1 X126.293 Y126.284 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.047 Y125.634 I-.293 J-.261 E.05338
G1 X126.14 Y125.656 E.00315
G3 X126.329 Y126.236 I-.139 J.367 E.02319
G1 X126.583 Y126.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.72 Y125.287 I-.59 J-.518 E.08777
G3 X126.231 Y125.275 I.274 J.804 E.01595
G3 X126.621 Y126.494 I-.238 J.748 E.046
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09458
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01536
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.219 Y129.83 E.00232
G3 X126.167 Y130.266 I-.223 J.194 E.01638
G3 X126.104 Y129.75 I-.165 J-.242 E.03982
G1 X126.113 Y129.756 E.00034
G1 X126.387 Y129.463 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.917 Y129.341 I-.396 J.56 E.11724
G3 X126.203 Y129.37 I.083 J.595 E.00892
G1 X126.203 Y129.37 E0
G3 X126.337 Y129.43 I-.212 J.653 E.00452
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08552
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.0438
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.397 J1.15 P1  F30000
G1 X128.751 Y129.663 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.134 Y129.605 I.251 J.363 E.01233
G3 X128.561 Y130.048 I-.134 J.419 E.05874
G1 X128.561 Y130.048 E0
G3 X128.704 Y129.7 I.441 J-.022 E.01193
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06304
G1 X128.947 Y129.585 E-.04052
G1 X129.134 Y129.605 E-.07149
G1 X129.251 Y129.66 E-.04934
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.731 Y130.373 E-.00885
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.264 J1.188 P1  F30000
G1 X130.946 Y129.881 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.052 Y129.879 I.055 J.143 E.00296
G1 X131.055 Y129.88 E.00008
G3 X131.088 Y130.151 I-.057 J.144 E.00912
G3 X130.895 Y129.913 I-.087 J-.127 E.01253
M204 S10000
; WIPE_START
G1 F24000
G1 X131.052 Y129.879 E-.1285
G1 X131.055 Y129.88 E-.0024
G1 X131.115 Y129.922 E-.05899
G1 X131.15 Y129.987 E-.059
G1 X131.15 Y130.061 E-.05899
G1 X131.088 Y130.151 E-.08742
G1 X131.019 Y130.177 E-.059
G1 X130.945 Y130.168 E-.059
G1 X130.885 Y130.126 E-.059
G1 X130.85 Y130.061 E-.059
G1 X130.85 Y129.987 E-.059
G1 X130.885 Y129.922 E-.059
G1 X130.895 Y129.913 E-.01072
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.062 J1.215 P1  F30000
G1 X132.979 Y130.019 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00089
G1 X133.021 Y130.029 E.00079
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.36961
G1 X133.021 Y130.029 E-.369
G1 X133.02 Y130.03 E-.0214
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/55
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
G3 Z6 I1.049 J-.616 P1  F30000
G1 X130.782 Y126.218 Z6
G1 Z5.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.035 Y125.738 I.211 J-.195 E.02178
G1 X131.088 Y125.751 E.00167
G3 X130.827 Y126.257 I-.095 J.272 E.03022
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08289
G1 X130.72 Y125.955 E-.05839
G1 X130.745 Y125.89 E-.02941
G1 X130.836 Y125.787 E-.05839
G1 X130.965 Y125.738 E-.05839
G1 X131.035 Y125.738 E-.02941
G1 X131.088 Y125.751 E-.02299
G1 X131.164 Y125.787 E-.03568
G1 X131.255 Y125.89 E-.05839
G1 X131.28 Y125.955 E-.02941
G1 X131.28 Y126.093 E-.05839
G1 X131.216 Y126.215 E-.05839
G1 X131.164 Y126.262 E-.02941
G1 X131.035 Y126.311 E-.05839
G1 X130.965 Y126.311 E-.02941
G1 X130.836 Y126.262 E-.05839
G1 X130.827 Y126.257 E-.00429
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.101 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.512 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.934 Y125.48 I.481 J-.258 E.03278
G3 X129.159 Y125.503 I.066 J.468 E.00702
G3 X128.543 Y126.332 I-.167 J.519 E.06368
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07286
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.159 Y125.503 E-.0364
G1 X129.311 Y125.573 E-.06366
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03499
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.224 Y126.348 E.00314
G3 X126.14 Y125.656 I-.222 J-.324 E.05339
G3 X126.347 Y126.206 I-.145 J.369 E.02196
G1 X126.325 Y126.231 E.0011
G1 X126.582 Y126.54 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.72 Y125.287 I-.59 J-.517 E.08767
G3 X126.225 Y125.274 I.274 J.801 E.01576
G3 X126.62 Y126.493 I-.233 J.749 E.04611
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09454
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01539
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.181 J.295 P1  F30000
G1 X126.167 Y129.783 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.035 Y129.733 I-.166 J.24 E.05624
G1 X126.104 Y129.75 E.00235
G3 X126.114 Y129.754 I-.104 J.273 E.00036
G1 X126.388 Y129.463 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.394 J.56 E.11187
G3 X126.198 Y129.369 I.239 J.7 E.01379
G1 X126.198 Y129.369 E0
G3 X126.337 Y129.43 I-.204 J.654 E.00469
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.0855
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04382
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.397 J1.15 P1  F30000
G1 X128.751 Y129.663 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.13 Y129.604 I.251 J.363 E.01221
G3 X128.561 Y130.052 I-.13 J.42 E.05873
G1 X128.561 Y130.052 E0
G3 X128.704 Y129.7 I.44 J-.026 E.01205
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06304
G1 X128.947 Y129.585 E-.04052
G1 X129.13 Y129.604 E-.07001
G1 X129.251 Y129.66 E-.05081
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.731 Y130.373 E-.00886
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.259 J1.189 P1  F30000
G1 X130.913 Y129.897 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.088 J.126 E.00305
M73 P85 R1
G1 X131.05 Y129.879 E.00088
G1 X131.055 Y129.88 E.00014
G3 X130.87 Y129.942 I-.055 J.144 E.02063
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.13204
G1 X131.05 Y129.879 E-.0258
G1 X131.055 Y129.88 E-.00408
G1 X131.115 Y129.922 E-.05931
G1 X131.15 Y129.987 E-.05932
G1 X131.136 Y130.096 E-.08789
G1 X131.055 Y130.168 E-.08789
G1 X130.945 Y130.168 E-.08789
G1 X130.864 Y130.096 E-.08789
G1 X130.85 Y129.987 E-.08789
G1 X130.87 Y129.942 E-.04001
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.045 J1.216 P1  F30000
G1 X132.979 Y130.019 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00089
G1 X133.019 Y130.032 E.00084
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.38
G1 X133.019 Y130.032 E-.38
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/55
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
G3 Z6.2 I1.051 J-.614 P1  F30000
G1 X130.786 Y126.214 Z6.2
G1 Z6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.085 Y125.75 I.215 J-.19 E.02285
G3 X131.282 Y125.973 I-.126 J.31 E.00949
G1 X131.282 Y125.973 E0
G3 X130.83 Y126.255 I-.282 J.051 E.02101
M204 S10000
; WIPE_START
G1 F24000
G1 X130.745 Y126.158 E-.05445
G1 X130.712 Y126.024 E-.05845
G1 X130.745 Y125.89 E-.05845
G1 X130.836 Y125.787 E-.05845
G1 X130.898 Y125.754 E-.02944
G1 X130.965 Y125.738 E-.02944
G1 X131.085 Y125.75 E-.05082
G1 X131.216 Y125.833 E-.06571
G1 X131.282 Y125.973 E-.06571
G1 X131.282 Y125.973 E0
G1 X131.28 Y126.093 E-.05081
G1 X131.255 Y126.158 E-.02944
G1 X131.216 Y126.215 E-.02944
G1 X131.102 Y126.294 E-.05845
G1 X130.965 Y126.311 E-.05845
G1 X130.836 Y126.262 E-.05845
G1 X130.83 Y126.255 E-.004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.099 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.511 Y126.281 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.934 Y125.48 I.481 J-.258 E.03283
G3 X129.155 Y125.502 I.066 J.458 E.00688
G3 X128.542 Y126.332 I-.163 J.521 E.06386
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.0729
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.155 Y125.502 E-.03466
G1 X129.311 Y125.573 E-.06537
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03497
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.222 Y126.346 E.00312
G3 X126.047 Y125.634 I-.222 J-.323 E.05025
G1 X126.14 Y125.656 E.00315
G3 X126.347 Y126.206 I-.139 J.367 E.02204
G1 X126.325 Y126.231 E.0011
G1 X126.584 Y126.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.72 Y125.287 I-.592 J-.517 E.0879
G3 X126.219 Y125.272 I.273 J.799 E.01558
G3 X126.621 Y126.495 I-.227 J.752 E.04633
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09458
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01536
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.181 J.295 P1  F30000
G1 X126.167 Y129.783 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.035 Y129.733 I-.166 J.24 E.05625
G1 X126.104 Y129.75 E.00235
G3 X126.114 Y129.754 I-.104 J.273 E.00036
G1 X126.387 Y129.463 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.394 J.561 E.1121
G3 X126.193 Y129.368 I.239 J.698 E.01363
G3 X126.337 Y129.431 I-.199 J.656 E.00485
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08549
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04383
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.396 J1.151 P1  F30000
G1 X128.753 Y129.666 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.126 Y129.603 I.253 J.366 E.01202
G3 X128.561 Y130.056 I-.128 J.419 E.05843
G1 X128.561 Y130.056 E0
G3 X128.706 Y129.703 I.445 J-.024 E.01209
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06295
G1 X128.947 Y129.585 E-.04052
G1 X129.126 Y129.603 E-.06853
G1 X129.251 Y129.66 E-.05228
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.731 Y130.373 E-.00896
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.259 J1.189 P1  F30000
G1 X130.913 Y129.898 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.088 J.124 E.00305
G1 X131.048 Y129.878 E.00082
G1 X131.055 Y129.88 E.0002
G3 X130.871 Y129.943 I-.054 J.142 E.02035
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.13187
G1 X131.048 Y129.878 E-.02415
G1 X131.055 Y129.88 E-.00575
G1 X131.136 Y129.953 E-.08796
G1 X131.15 Y130.061 E-.08796
G1 X131.088 Y130.151 E-.08797
G1 X130.981 Y130.177 E-.08796
G1 X130.912 Y130.151 E-.05937
G1 X130.864 Y130.096 E-.05937
G1 X130.85 Y129.987 E-.08796
G1 X130.871 Y129.943 E-.03967
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.041 J1.216 P1  F30000
G1 X132.981 Y130.014 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00079
G1 X133.019 Y130.034 E.00089
G1 X133.018 Y130.035 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.37073
G1 X133.019 Y130.034 E-.37025
G1 X133.018 Y130.035 E-.01902
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/55
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
G3 Z6.4 I1.05 J-.615 P1  F30000
G1 X130.781 Y126.219 Z6.4
G1 Z6.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.035 Y125.738 I.209 J-.197 E.02194
G1 X131.082 Y125.749 E.00149
G3 X130.826 Y126.258 I-.092 J.272 E.0302
M204 S10000
; WIPE_START
G1 F24000
G1 X130.745 Y126.158 E-.05449
G1 X130.712 Y126.024 E-.05833
G1 X130.745 Y125.89 E-.05833
G1 X130.836 Y125.787 E-.05833
G1 X130.898 Y125.754 E-.02939
G1 X131.035 Y125.738 E-.05833
G1 X131.082 Y125.749 E-.02042
G1 X131.164 Y125.787 E-.03814
G1 X131.255 Y125.89 E-.05833
G1 X131.28 Y125.955 E-.02938
G1 X131.28 Y126.093 E-.05833
G1 X131.255 Y126.158 E-.02938
G1 X131.164 Y126.262 E-.05833
G1 X131.035 Y126.311 E-.05833
G1 X130.965 Y126.311 E-.02938
G1 X130.836 Y126.262 E-.05833
G1 X130.826 Y126.258 E-.00442
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.083 J-1.214 P1  F30000
G1 X128.886 Y126.125 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.114 J-.101 E.01222
G1 X129.054 Y125.881 E.00122
G3 X128.935 Y126.162 I-.054 J.142 E.01627
G1 X128.512 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.806 Y125.512 I.482 J-.256 E.02862
G3 X129.15 Y125.501 I.19 J.554 E.01075
G3 X128.543 Y126.332 I-.156 J.523 E.06415
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07285
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.15 Y125.501 E-.03292
G1 X129.311 Y125.573 E-.06708
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.985 E-.03505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.221 Y126.344 E.00311
G3 X125.953 Y125.634 I-.225 J-.321 E.04737
G3 X126.12 Y125.651 I.047 J.348 E.00563
G3 X126.343 Y126.204 I-.124 J.372 E.02248
G1 X126.323 Y126.23 E.00107
G1 X126.583 Y126.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.72 Y125.287 I-.592 J-.517 E.0879
G3 X126.214 Y125.271 I.273 J.797 E.01539
G3 X126.621 Y126.494 I-.222 J.753 E.04648
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09456
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01538
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.22 Y129.83 E.00233
G3 X126.035 Y129.733 I-.219 J.193 E.05389
G1 X126.104 Y129.75 E.00235
G1 X126.113 Y129.756 E.00034
G1 X126.387 Y129.463 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.395 J.561 E.11208
G3 X126.187 Y129.366 I.239 J.696 E.01346
G1 X126.187 Y129.366 E0
G3 X126.337 Y129.431 I-.195 J.658 E.00501
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08548
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04384
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.397 J1.15 P1  F30000
G1 X128.751 Y129.663 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.122 Y129.602 I.25 J.362 E.01196
G3 X128.562 Y130.059 I-.122 J.422 E.05871
G1 X128.562 Y130.059 E0
G3 X128.704 Y129.7 I.439 J-.035 E.01228
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06304
G1 X128.947 Y129.585 E-.04052
G1 X129.122 Y129.602 E-.06705
G1 X129.251 Y129.66 E-.05375
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.731 Y130.373 E-.00888
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.259 J1.189 P1  F30000
G1 X130.913 Y129.898 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.088 J.124 E.00305
G1 X131.046 Y129.878 E.00076
G1 X131.055 Y129.88 E.00025
G3 X130.871 Y129.943 I-.054 J.142 E.02035
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.13187
G1 X131.046 Y129.878 E-.02248
G1 X131.055 Y129.88 E-.00743
G1 X131.136 Y129.953 E-.08796
G1 X131.15 Y130.061 E-.08797
G1 X131.088 Y130.151 E-.08797
G1 X130.981 Y130.177 E-.08796
G1 X130.912 Y130.151 E-.05937
G1 X130.864 Y130.096 E-.05936
G1 X130.85 Y129.987 E-.08797
G1 X130.871 Y129.943 E-.03967
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.041 J1.216 P1  F30000
G1 X132.981 Y130.014 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00079
G1 X133.021 Y130.029 E.00079
G1 X133.016 Y130.032 E.00015
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.35077
G1 X133.021 Y130.029 E-.34482
G1 X133.016 Y130.032 E-.06441
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/55
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
G3 Z6.6 I1.051 J-.614 P1  F30000
G1 X130.787 Y126.213 Z6.6
G1 Z6.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.965 Y125.738 I.209 J-.193 E.0193
G3 X131.079 Y125.749 I.035 J.236 E.00354
G3 X130.831 Y126.253 I-.083 J.272 E.03023
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08228
G1 X130.712 Y126.024 E-.02943
G1 X130.745 Y125.89 E-.05844
G1 X130.784 Y125.833 E-.02943
G1 X130.836 Y125.787 E-.02943
G1 X130.965 Y125.738 E-.05844
G1 X131.079 Y125.749 E-.04827
G1 X131.164 Y125.787 E-.03946
G1 X131.255 Y125.89 E-.05843
M73 P86 R1
G1 X131.28 Y125.955 E-.02943
G1 X131.28 Y126.093 E-.05843
G1 X131.255 Y126.158 E-.02944
G1 X131.164 Y126.262 E-.05844
G1 X131.035 Y126.311 E-.05843
G1 X130.965 Y126.311 E-.02943
G1 X130.836 Y126.262 E-.05844
G1 X130.831 Y126.253 E-.00433
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.097 J-1.213 P1  F30000
G1 X128.866 Y126.095 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.054 Y125.881 I.135 J-.071 E.0122
G3 X129.087 Y126.15 I-.056 J.143 E.01098
G3 X128.904 Y126.142 I-.086 J-.126 E.0065
G1 X128.51 Y126.281 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.934 Y125.48 I.481 J-.258 E.03287
G3 X129.146 Y125.5 I.066 J.439 E.0066
G3 X128.541 Y126.333 I-.155 J.523 E.06405
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07292
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.146 Y125.5 E-.03118
G1 X129.311 Y125.573 E-.0688
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.985 E-.03501
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.221 Y126.344 E.00311
G3 X125.953 Y125.634 I-.226 J-.32 E.04748
G3 X126.114 Y125.65 I.047 J.336 E.00543
G3 X126.343 Y126.204 I-.119 J.374 E.02263
G1 X126.323 Y126.23 E.00107
G1 X126.583 Y126.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.72 Y125.287 I-.592 J-.516 E.08791
G3 X126.208 Y125.269 I.273 J.795 E.0152
G3 X126.621 Y126.494 I-.217 J.755 E.04664
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09455
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01539
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.181 J.294 P1  F30000
G1 X126.164 Y129.786 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.035 Y129.733 I-.172 J.236 E.0562
G1 X126.088 Y129.746 E.0018
G3 X126.112 Y129.755 I-.096 J.276 E.00087
G1 X126.387 Y129.463 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.395 J.559 E.11184
G3 X126.182 Y129.365 I.238 J.695 E.01329
G1 X126.182 Y129.365 E0
G3 X126.337 Y129.431 I-.19 J.658 E.00518
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08547
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04385
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.4 J1.15 P1  F30000
G1 X128.747 Y129.657 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.245 J.366 E.00659
G3 X129.118 Y129.601 I.053 J.357 E.00535
G3 X128.699 Y129.694 I-.126 J.422 E.07123
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06321
G1 X128.947 Y129.585 E-.04052
G1 X129.118 Y129.601 E-.06557
G1 X129.251 Y129.66 E-.05522
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.732 Y130.373 E-.00872
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.261 J1.189 P1  F30000
G1 X130.911 Y129.895 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.084 J.127 E.00309
G1 X131.044 Y129.877 E.00071
G3 X130.868 Y129.938 I-.049 J.144 E.02064
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.13217
G1 X131.044 Y129.877 E-.02072
G1 X131.088 Y129.897 E-.03864
G1 X131.136 Y129.953 E-.05912
G1 X131.15 Y130.061 E-.08761
G1 X131.088 Y130.151 E-.08761
G1 X130.981 Y130.177 E-.08761
G1 X130.885 Y130.126 E-.08761
G1 X130.846 Y130.024 E-.0876
G1 X130.864 Y129.953 E-.05913
G1 X130.868 Y129.938 E-.01219
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.044 J1.216 P1  F30000
G1 X132.981 Y130.014 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00079
G1 X133.019 Y130.034 E.00089
G1 X133.018 Y130.035 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.37077
G1 X133.019 Y130.034 E-.3703
G1 X133.018 Y130.035 E-.01893
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/55
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
G3 Z6.8 I1.05 J-.615 P1  F30000
G1 X130.783 Y126.217 Z6.8
G1 Z6.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.965 Y125.738 I.212 J-.193 E.01947
G3 X131.076 Y125.748 I.035 J.229 E.00345
G3 X130.828 Y126.257 I-.081 J.275 E.03068
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08284
G1 X130.712 Y126.024 E-.02942
G1 X130.745 Y125.89 E-.0584
G1 X130.784 Y125.833 E-.02942
G1 X130.898 Y125.754 E-.0584
G1 X130.965 Y125.738 E-.02942
G1 X131.076 Y125.748 E-.04699
G1 X131.164 Y125.787 E-.0407
G1 X131.255 Y125.89 E-.0584
G1 X131.28 Y125.955 E-.02942
G1 X131.28 Y126.093 E-.0584
G1 X131.255 Y126.158 E-.02942
G1 X131.164 Y126.262 E-.0584
G1 X131.035 Y126.311 E-.0584
G1 X130.965 Y126.311 E-.02942
G1 X130.836 Y126.262 E-.0584
G1 X130.828 Y126.257 E-.00416
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.1 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.518 Y126.277 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.459 Y126.078 I.482 J-.253 E.00641
G1 X128.459 Y126.078 E0
G3 X129.141 Y125.499 I.541 J-.054 E.03231
G3 X128.549 Y126.329 I-.141 J.526 E.0645
M204 S10000
; WIPE_START
G1 F24000
G1 X128.459 Y126.078 E-.1011
G1 X128.459 Y126.078 E0
G1 X128.468 Y125.893 E-.07051
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.141 Y125.499 E-.07909
G1 X129.311 Y125.573 E-.07051
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.544 Y125.99 E-.03727
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.107 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.219 Y126.342 E.00309
G3 X125.953 Y125.634 I-.225 J-.319 E.04735
G3 X126.108 Y125.648 I.047 J.323 E.00523
G3 X126.34 Y126.203 I-.114 J.374 E.02274
G1 X126.322 Y126.229 E.00106
G1 X126.582 Y126.54 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.552 Y125.375 I-.589 J-.517 E.08175
G3 X126.202 Y125.268 I.438 J.63 E.02092
G3 X126.62 Y126.493 I-.209 J.755 E.04683
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09455
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01539
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.181 J.295 P1  F30000
G1 X126.165 Y129.786 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.965 Y129.733 I-.169 J.234 E.05317
G3 X126.083 Y129.745 I.035 J.246 E.00398
G3 X126.112 Y129.756 I-.087 J.275 E.00104
G1 X126.387 Y129.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.395 J.559 E.11184
G3 X126.177 Y129.364 I.238 J.694 E.01313
G1 X126.177 Y129.364 E0
G3 X126.336 Y129.431 I-.185 J.659 E.00534
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08546
G1 X126.61 Y129.704 E-.06306
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04385
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.4 J1.149 P1  F30000
G1 X128.747 Y129.657 Z7
G1 Z6.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.245 J.366 E.0066
G3 X129.115 Y129.6 I.053 J.348 E.00523
G3 X128.699 Y129.694 I-.123 J.423 E.07138
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06321
G1 X128.947 Y129.585 E-.04052
G1 X129.115 Y129.6 E-.06409
G1 X129.251 Y129.66 E-.05669
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.732 Y130.373 E-.00872
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.251 J1.191 P1  F30000
G1 X130.881 Y129.919 Z7
G1 Z6.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.113 J.102 E.00414
G1 X131.042 Y129.877 E.00065
G3 X130.85 Y129.972 I-.048 J.144 E.01964
M204 S10000
; WIPE_START
G1 F24000
G1 X130.945 Y129.88 E-.10538
G1 X131.019 Y129.871 E-.05883
G1 X131.042 Y129.877 E-.01896
G1 X131.088 Y129.897 E-.04007
G1 X131.136 Y129.953 E-.05884
G1 X131.15 Y130.061 E-.08718
G1 X131.088 Y130.151 E-.08718
G1 X130.981 Y130.177 E-.08718
G1 X130.885 Y130.126 E-.08718
G1 X130.846 Y130.024 E-.08717
G1 X130.85 Y129.972 E-.04202
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.024 J1.217 P1  F30000
G1 X132.981 Y130.014 Z7
G1 Z6.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00079
G1 X133.021 Y130.029 E.00079
G1 X133.016 Y130.032 E.00015
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.35079
G1 X133.021 Y130.029 E-.34483
G1 X133.016 Y130.032 E-.06438
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/55
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
G3 Z7 I1.052 J-.612 P1  F30000
G1 X130.79 Y126.21 Z7
G1 Z6.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.073 Y125.747 I.212 J-.188 E.02218
G3 X131.284 Y125.985 I-.105 J.305 E.01021
G1 X131.284 Y125.985 E0
G3 X130.835 Y126.251 I-.281 J.037 E.02033
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08254
G1 X130.712 Y126.024 E-.02945
G1 X130.745 Y125.89 E-.05848
G1 X130.784 Y125.833 E-.02945
G1 X130.898 Y125.754 E-.05848
G1 X130.965 Y125.738 E-.02946
G1 X131.073 Y125.747 E-.04579
G1 X131.164 Y125.787 E-.04201
G1 X131.216 Y125.833 E-.02946
G1 X131.255 Y125.89 E-.02945
G1 X131.284 Y125.985 E-.04201
G1 X131.284 Y125.985 E0
G1 X131.28 Y126.093 E-.04579
G1 X131.255 Y126.158 E-.02946
G1 X131.164 Y126.262 E-.05848
G1 X131.102 Y126.294 E-.02945
G1 X130.965 Y126.311 E-.05848
G1 X130.898 Y126.294 E-.02945
G1 X130.835 Y126.251 E-.03232
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.078 J-1.214 P1  F30000
G1 X128.886 Y126.125 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.114 J-.101 E.01222
G1 X129.054 Y125.881 E.00122
G3 X128.935 Y126.162 I-.054 J.142 E.01627
G1 X128.513 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.806 Y125.512 I.481 J-.257 E.02861
G3 X129.137 Y125.498 I.189 J.552 E.01033
G3 X128.544 Y126.331 I-.143 J.526 E.06437
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07282
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.137 Y125.498 E-.07737
G1 X129.311 Y125.573 E-.07222
M73 P87 R1
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.986 E-.03568
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.108 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.22 Y126.343 E.0031
G3 X125.953 Y125.634 I-.227 J-.319 E.0475
G3 X126.102 Y125.647 I.047 J.31 E.00503
G3 X126.341 Y126.203 I-.109 J.376 E.02293
G1 X126.322 Y126.229 E.00106
G1 X126.583 Y126.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.552 Y125.375 I-.59 J-.517 E.08187
G3 X126.196 Y125.266 I.438 J.629 E.02073
G3 X126.621 Y126.494 I-.203 J.758 E.04704
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09457
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01537
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.181 J.295 P1  F30000
G1 X126.165 Y129.786 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.965 Y129.733 I-.17 J.238 E.05388
G3 X126.078 Y129.743 I.035 J.234 E.0038
G3 X126.112 Y129.756 I-.083 J.28 E.00122
G1 X126.387 Y129.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.395 J.56 E.11203
G3 X126.171 Y129.363 I.238 J.693 E.01296
G3 X126.336 Y129.431 I-.18 J.662 E.0055
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08554
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.4 J1.149 P1  F30000
G1 X128.747 Y129.657 Z7.2
G1 Z6.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.245 J.366 E.0066
G3 X129.111 Y129.599 I.053 J.34 E.00511
G3 X128.699 Y129.694 I-.119 J.424 E.07148
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06322
G1 X128.947 Y129.585 E-.04052
G1 X129.111 Y129.599 E-.06261
G1 X129.251 Y129.66 E-.05817
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.732 Y130.373 E-.00872
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.262 J1.189 P1  F30000
G1 X130.91 Y129.894 Z7.2
G1 Z6.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.083 J.128 E.0031
G1 X131.04 Y129.876 E.00059
G3 X130.866 Y129.936 I-.047 J.145 E.02075
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.13239
G1 X131.04 Y129.876 E-.01736
G1 X131.088 Y129.897 E-.04184
G1 X131.136 Y129.953 E-.05902
G1 X131.15 Y130.061 E-.08745
G1 X131.088 Y130.151 E-.08745
G1 X130.981 Y130.177 E-.08745
G1 X130.885 Y130.126 E-.08745
G1 X130.846 Y130.024 E-.08745
G1 X130.864 Y129.953 E-.05902
G1 X130.866 Y129.936 E-.01314
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.048 J1.216 P1  F30000
G1 X132.979 Y130.019 Z7.2
G1 Z6.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.007 Y130.004 E.00088
G1 X133.021 Y130.029 E.00081
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.007 Y130.004 E-.36957
G1 X133.021 Y130.029 E-.36936
G1 X133.02 Y130.03 E-.02107
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/55
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
G3 Z7.2 I1.05 J-.616 P1  F30000
G1 X130.782 Y126.217 Z7.2
G1 Z7
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.965 Y125.738 I.212 J-.194 E.01949
G3 X131.07 Y125.746 I.035 J.217 E.00326
G1 X131.07 Y125.746 E0
G3 X130.827 Y126.257 I-.076 J.277 E.03084
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08286
G1 X130.712 Y126.024 E-.02941
G1 X130.745 Y125.89 E-.0584
G1 X130.784 Y125.833 E-.02941
G1 X130.898 Y125.754 E-.0584
G1 X130.965 Y125.738 E-.02942
G1 X131.07 Y125.746 E-.04446
G1 X131.07 Y125.746 E0
G1 X131.164 Y125.787 E-.04321
G1 X131.255 Y125.89 E-.0584
G1 X131.28 Y125.955 E-.02942
G1 X131.28 Y126.093 E-.0584
G1 X131.255 Y126.158 E-.02942
G1 X131.164 Y126.262 E-.0584
G1 X131.035 Y126.311 E-.0584
G1 X130.965 Y126.311 E-.02941
G1 X130.836 Y126.262 E-.0584
G1 X130.827 Y126.257 E-.0042
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.08 J-1.214 P1  F30000
G1 X128.882 Y126.129 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.11 J-.106 E.01275
G1 X129.039 Y125.877 E.00069
G3 X128.932 Y126.164 I-.047 J.146 E.01642
G1 X128.512 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.806 Y125.512 I.482 J-.256 E.02864
G3 X129.132 Y125.497 I.189 J.552 E.01018
G3 X128.543 Y126.332 I-.139 J.528 E.06463
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07286
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.132 Y125.497 E-.07566
G1 X129.311 Y125.573 E-.07394
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.986 E-.03564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.108 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.219 Y126.342 E.00309
G3 X125.953 Y125.634 I-.227 J-.319 E.04754
G3 X126.096 Y125.646 I.047 J.298 E.00483
G3 X126.34 Y126.203 I-.104 J.378 E.02311
G1 X126.322 Y126.229 E.00106
G1 X126.584 Y126.542 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.552 Y125.375 I-.591 J-.517 E.08198
G3 X126.19 Y125.265 I.437 J.629 E.02055
G3 X126.622 Y126.495 I-.197 J.76 E.04727
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09459
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01535
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.181 J.294 P1  F30000
G1 X126.164 Y129.786 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.965 Y129.733 I-.169 J.234 E.05315
G3 X126.072 Y129.742 I.035 J.223 E.00362
G3 X126.112 Y129.756 I-.078 J.278 E.00139
G1 X126.387 Y129.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.395 J.56 E.11202
G3 X126.166 Y129.361 I.238 J.693 E.01279
G3 X126.336 Y129.431 I-.175 J.663 E.00567
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08554
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.4 J1.149 P1  F30000
G1 X128.747 Y129.657 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.245 J.366 E.0066
G3 X129.107 Y129.598 I.053 J.332 E.00499
G3 X128.699 Y129.694 I-.116 J.425 E.07159
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06322
G1 X128.947 Y129.585 E-.04052
G1 X129.107 Y129.598 E-.06113
G1 X129.251 Y129.66 E-.05965
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.732 Y130.373 E-.00872
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.267 J1.187 P1  F30000
G1 X130.944 Y129.876 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.047 J.146 E.00206
G1 X131.038 Y129.876 E.00054
G3 X130.891 Y129.906 I-.046 J.146 E.02206
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.10562
G1 X131.038 Y129.876 E-.01565
G1 X131.088 Y129.897 E-.04335
G1 X131.136 Y129.953 E-.05884
G1 X131.15 Y130.061 E-.08719
G1 X131.088 Y130.151 E-.08719
G1 X130.981 Y130.177 E-.08719
G1 X130.885 Y130.126 E-.08719
G1 X130.846 Y130.024 E-.08718
G1 X130.885 Y129.922 E-.08719
G1 X130.891 Y129.906 E-.01342
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.066 J1.215 P1  F30000
G1 X132.979 Y130.019 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.006 Y130.003 E.00085
G1 X133.021 Y130.029 E.00083
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.006 Y130.003 E-.36955
G1 X133.021 Y130.029 E-.37
G1 X133.02 Y130.03 E-.02045
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/55
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
G3 Z7.4 I1.05 J-.615 P1  F30000
G1 X130.787 Y126.213 Z7.4
G1 Z7.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.965 Y125.738 I.208 J-.193 E.01932
G3 X131.067 Y125.746 I.035 J.211 E.00317
G3 X130.832 Y126.253 I-.073 J.274 E.03043
M204 S10000
; WIPE_START
G1 F24000
G1 X130.745 Y126.158 E-.05447
G1 X130.712 Y126.024 E-.05839
G1 X130.72 Y125.955 E-.02941
G1 X130.784 Y125.833 E-.05839
G1 X130.898 Y125.754 E-.05839
G1 X130.965 Y125.738 E-.02941
G1 X131.067 Y125.746 E-.0432
G1 X131.164 Y125.787 E-.04445
G1 X131.255 Y125.89 E-.05839
G1 X131.28 Y125.955 E-.02941
G1 X131.28 Y126.093 E-.05838
G1 X131.255 Y126.158 E-.02941
G1 X131.164 Y126.262 E-.05839
G1 X131.035 Y126.311 E-.05838
G1 X130.965 Y126.311 E-.02941
G1 X130.898 Y126.294 E-.02941
G1 X130.832 Y126.253 E-.03274
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.077 J-1.215 P1  F30000
G1 X128.882 Y126.129 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.108 J-.107 E.01282
G1 X129.034 Y125.876 E.00054
G3 X128.933 Y126.163 I-.044 J.145 E.01629
G1 X128.512 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.806 Y125.512 I.482 J-.256 E.02865
G3 X129.128 Y125.496 I.19 J.552 E.01004
G3 X128.543 Y126.332 I-.135 J.529 E.06476
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07287
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.128 Y125.496 E-.07394
G1 X129.311 Y125.573 E-.07566
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.986 E-.03564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.109 J-1.212 P1  F30000
G1 X126.288 Y126.28 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.953 Y125.634 I-.296 J-.256 E.05064
G3 X126.091 Y125.644 I.047 J.285 E.00464
G3 X126.324 Y126.231 I-.099 J.379 E.02437
G1 X126.584 Y126.542 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.552 Y125.375 I-.591 J-.517 E.08198
G3 X126.184 Y125.263 I.437 J.628 E.02036
G3 X126.622 Y126.495 I-.191 J.762 E.04745
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09459
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01535
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.181 J.294 P1  F30000
G1 X126.164 Y129.786 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.965 Y129.733 I-.17 J.237 E.05388
G3 X126.067 Y129.741 I.035 J.212 E.00344
G3 X126.112 Y129.756 I-.073 J.283 E.00157
G1 X126.387 Y129.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M73 P88 R1
G3 X125.756 Y129.38 I-.395 J.56 E.11202
G3 X126.161 Y129.36 I.238 J.694 E.01263
G3 X126.336 Y129.432 I-.169 J.664 E.00583
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08553
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.4 J1.149 P1  F30000
G1 X128.747 Y129.657 Z7.6
G1 Z7.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.244 J.366 E.0066
G3 X129.103 Y129.597 I.053 J.324 E.00487
G3 X128.699 Y129.694 I-.112 J.426 E.0717
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06322
G1 X128.947 Y129.585 E-.04052
G1 X129.103 Y129.597 E-.05965
G1 X129.251 Y129.66 E-.06113
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.107 Y130.45 E-.05965
G1 X128.947 Y130.463 E-.06113
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.73 Y130.372 E-.00951
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.261 J1.189 P1  F30000
G1 X130.909 Y129.892 Z7.6
G1 Z7.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.082 J.129 E.00312
G1 X131.036 Y129.875 E.00048
G3 X130.865 Y129.935 I-.045 J.145 E.02087
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.13255
G1 X131.036 Y129.875 E-.014
G1 X131.088 Y129.897 E-.04503
G1 X131.136 Y129.953 E-.0589
G1 X131.15 Y130.061 E-.08727
G1 X131.088 Y130.151 E-.08727
G1 X130.981 Y130.177 E-.08727
G1 X130.885 Y130.126 E-.08727
G1 X130.846 Y130.024 E-.08727
G1 X130.864 Y129.953 E-.0589
G1 X130.865 Y129.935 E-.01428
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.048 J1.216 P1  F30000
G1 X132.979 Y130.019 Z7.6
G1 Z7.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.005 Y130.003 E.00083
G1 X133.021 Y130.029 E.00085
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.005 Y130.003 E-.37076
G1 X133.021 Y130.029 E-.36941
G1 X133.02 Y130.03 E-.01983
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/55
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
G3 Z7.6 I1.051 J-.614 P1  F30000
G1 X130.787 Y126.213 Z7.6
G1 Z7.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.716 Y126.063 I.21 J-.191 E.00516
G1 X130.716 Y126.063 E0
G3 X131.064 Y125.745 I.284 J-.039 E.01701
G3 X130.832 Y126.253 I-.067 J.276 E.03075
M204 S10000
; WIPE_START
G1 F24000
G1 X130.745 Y126.158 E-.05456
G1 X130.716 Y126.063 E-.04197
G1 X130.716 Y126.063 E0
G1 X130.72 Y125.955 E-.04575
G1 X130.784 Y125.833 E-.05843
G1 X130.898 Y125.754 E-.05843
G1 X130.965 Y125.738 E-.02943
G1 X131.064 Y125.745 E-.04197
G1 X131.164 Y125.787 E-.04575
G1 X131.216 Y125.833 E-.02943
G1 X131.28 Y125.955 E-.05843
G1 X131.28 Y126.093 E-.05843
G1 X131.216 Y126.215 E-.05843
G1 X131.164 Y126.262 E-.02943
G1 X131.035 Y126.311 E-.05843
G1 X130.898 Y126.294 E-.05843
G1 X130.832 Y126.253 E-.0327
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.097 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.511 Y126.281 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.806 Y125.512 I.482 J-.256 E.02866
G3 X129.123 Y125.494 I.19 J.553 E.0099
G3 X128.542 Y126.332 I-.13 J.53 E.06494
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07287
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.123 Y125.494 E-.07222
G1 X129.311 Y125.573 E-.07737
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.986 E-.03563
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.108 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.218 Y126.341 E.00308
G3 X125.953 Y125.634 I-.226 J-.318 E.04741
G3 X126.085 Y125.643 I.047 J.273 E.00444
G1 X126.085 Y125.643 E0
G3 X126.339 Y126.202 I-.093 J.379 E.02345
G1 X126.321 Y126.228 E.00106
G1 X126.584 Y126.542 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.552 Y125.375 I-.591 J-.517 E.08198
G3 X126.179 Y125.262 I.437 J.628 E.02017
G3 X126.622 Y126.495 I-.186 J.763 E.04763
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09459
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01535
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.181 J.294 P1  F30000
G1 X126.164 Y129.786 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.965 Y129.733 I-.17 J.237 E.05373
G3 X126.062 Y129.739 I.035 J.2 E.00326
G3 X126.112 Y129.756 I-.068 J.283 E.00175
G1 X126.387 Y129.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.395 J.56 E.11201
G3 X126.156 Y129.359 I.238 J.695 E.01246
G3 X126.336 Y129.432 I-.164 J.666 E.006
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08554
G1 X126.61 Y129.704 E-.06306
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.4 J1.149 P1  F30000
G1 X128.746 Y129.657 Z7.8
G1 Z7.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.244 J.367 E.0066
G3 X129.099 Y129.596 I.053 J.315 E.00475
G1 X129.099 Y129.596 E0
G3 X128.699 Y129.693 I-.109 J.428 E.07203
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06323
G1 X128.947 Y129.585 E-.04052
G1 X129.099 Y129.596 E-.05817
G1 X129.099 Y129.596 E0
G1 X129.251 Y129.66 E-.0626
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.732 Y130.373 E-.00871
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.263 J1.188 P1  F30000
G1 X130.909 Y129.891 Z7.8
G1 Z7.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.081 J.13 E.00313
G1 X131.034 Y129.875 E.00042
G3 X130.864 Y129.933 I-.044 J.147 E.02109
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.13264
G1 X131.034 Y129.875 E-.01232
G1 X131.088 Y129.897 E-.04658
G1 X131.136 Y129.953 E-.05879
G1 X131.15 Y130.061 E-.08711
G1 X131.088 Y130.151 E-.08712
G1 X130.981 Y130.177 E-.08712
G1 X130.885 Y130.126 E-.08711
G1 X130.846 Y130.024 E-.08712
G1 X130.864 Y129.953 E-.05879
G1 X130.864 Y129.933 E-.0153
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.049 J1.216 P1  F30000
G1 X132.979 Y130.019 Z7.8
G1 Z7.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.003 Y130.003 E.00081
G1 X133.021 Y130.029 E.00088
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.003 Y130.003 E-.37074
G1 X133.021 Y130.029 E-.36996
G1 X133.02 Y130.03 E-.0193
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/55
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
G3 Z7.8 I1.05 J-.616 P1  F30000
G1 X130.782 Y126.217 Z7.8
G1 Z7.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.965 Y125.738 I.212 J-.194 E.01951
G3 X131.061 Y125.744 I.035 J.198 E.00299
G3 X130.827 Y126.257 I-.067 J.279 E.0311
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08287
G1 X130.712 Y126.024 E-.02941
G1 X130.72 Y125.955 E-.02941
G1 X130.784 Y125.833 E-.0584
G1 X130.836 Y125.787 E-.02941
G1 X130.965 Y125.738 E-.0584
G1 X131.061 Y125.744 E-.04069
G1 X131.164 Y125.787 E-.04698
G1 X131.255 Y125.89 E-.0584
G1 X131.28 Y125.955 E-.02941
G1 X131.28 Y126.093 E-.0584
G1 X131.255 Y126.158 E-.02941
G1 X131.164 Y126.262 E-.0584
G1 X131.035 Y126.311 E-.05839
G1 X130.965 Y126.311 E-.02941
G1 X130.836 Y126.262 E-.0584
G1 X130.827 Y126.257 E-.00422
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.1 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.512 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.806 Y125.512 I.482 J-.256 E.02865
G3 X129.119 Y125.493 I.19 J.555 E.00976
G3 X128.543 Y126.332 I-.126 J.531 E.06505
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07286
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.119 Y125.493 E-.07051
G1 X129.311 Y125.573 E-.07909
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.986 E-.03563
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.108 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.218 Y126.341 E.00308
G3 X125.953 Y125.634 I-.226 J-.319 E.04741
G3 X126.079 Y125.641 I.047 J.26 E.00424
G3 X126.339 Y126.202 I-.087 J.381 E.02366
G1 X126.321 Y126.228 E.00106
G1 X126.584 Y126.542 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.552 Y125.375 I-.591 J-.517 E.08198
G3 X126.173 Y125.261 I.437 J.628 E.01999
G3 X126.622 Y126.495 I-.18 J.764 E.04782
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09459
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.225 Y126.133 E-.03039
G1 X125.212 Y126.024 E-.04184
G1 X125.216 Y125.984 E-.01535
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.181 J.294 P1  F30000
G1 X126.164 Y129.786 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.965 Y129.733 I-.17 J.237 E.05374
G3 X126.057 Y129.738 I.035 J.189 E.00308
G3 X126.112 Y129.756 I-.062 J.285 E.00193
G1 X126.387 Y129.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.395 J.56 E.11202
G3 X126.15 Y129.357 I.239 J.698 E.01229
G3 X126.336 Y129.432 I-.159 J.667 E.00616
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08554
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.4 J1.149 P1  F30000
G1 X128.747 Y129.657 Z8
G1 Z7.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.244 J.366 E.0066
G3 X129.096 Y129.595 I.053 J.307 E.00463
G3 X128.699 Y129.694 I-.105 J.428 E.07195
M204 S10000
; WIPE_START
G1 F24000
M73 P89 R1
G1 X128.843 Y129.611 E-.06322
G1 X128.947 Y129.585 E-.04052
G1 X129.096 Y129.595 E-.05669
G1 X129.251 Y129.66 E-.06409
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.732 Y130.373 E-.00871
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.25 J1.191 P1  F30000
G1 X130.884 Y129.921 Z8
G1 Z7.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X130.981 Y129.871 I.113 J.101 E.00307
G3 X131.032 Y129.874 I.019 J.103 E.00139
G3 X130.853 Y129.974 I-.035 J.148 E.0199
M204 S10000
; WIPE_START
G1 F24000
G1 X130.981 Y129.871 E-.13218
G1 X131.032 Y129.874 E-.04037
G1 X131.088 Y129.897 E-.0486
G1 X131.136 Y129.953 E-.05926
G1 X131.15 Y130.061 E-.0878
G1 X131.088 Y130.151 E-.08781
G1 X130.981 Y130.177 E-.08781
G1 X130.885 Y130.126 E-.08781
G1 X130.846 Y130.024 E-.08781
G1 X130.853 Y129.974 E-.04056
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.023 J1.217 P1  F30000
G1 X132.981 Y130.014 Z8
G1 Z7.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00079
G1 X133.019 Y130.034 E.00089
G1 X133.018 Y130.035 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.37075
G1 X133.019 Y130.034 E-.37027
G1 X133.018 Y130.035 E-.01897
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/55
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
G3 Z8 I1.051 J-.614 P1  F30000
G1 X130.786 Y126.214 Z8
G1 Z7.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.058 Y125.744 I.214 J-.19 E.02201
G3 X131.286 Y126 I-.086 J.305 E.01113
G1 X131.286 Y126 E0
G3 X130.83 Y126.255 I-.285 J.024 E.02015
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08276
G1 X130.712 Y126.024 E-.02942
G1 X130.745 Y125.89 E-.05841
G1 X130.836 Y125.787 E-.05841
G1 X130.898 Y125.754 E-.02942
G1 X130.965 Y125.738 E-.02942
G1 X131.058 Y125.744 E-.03945
G1 X131.164 Y125.787 E-.04826
G1 X131.216 Y125.833 E-.02942
G1 X131.255 Y125.89 E-.02942
G1 X131.286 Y126 E-.04826
G1 X131.286 Y126 E0
G1 X131.28 Y126.093 E-.03945
G1 X131.255 Y126.158 E-.02942
G1 X131.164 Y126.262 E-.05841
G1 X131.102 Y126.294 E-.02942
G1 X130.965 Y126.311 E-.05841
G1 X130.876 Y126.283 E-.03945
G1 X130.83 Y126.255 E-.02278
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.099 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.512 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.806 Y125.512 I.482 J-.256 E.02864
G3 X129.115 Y125.492 I.191 J.558 E.00962
G3 X128.543 Y126.332 I-.121 J.532 E.06519
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07286
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.115 Y125.492 E-.06879
G1 X129.194 Y125.512 E-.03118
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.985 E-.03507
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.11 J-1.212 P1  F30000
G1 X126.289 Y126.28 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.953 Y125.634 I-.296 J-.257 E.05063
G3 X126.073 Y125.64 I.047 J.247 E.00404
G3 X126.324 Y126.232 I-.08 J.383 E.02501
G1 X126.586 Y126.543 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.167 Y125.259 I-.586 J-.519 E.10108
G3 X126.78 Y125.951 I-.143 J.744 E.03054
G1 X126.78 Y125.951 E0
G3 X126.624 Y126.497 I-.779 J.073 E.01785
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09467
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01527
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.181 J.294 P1  F30000
G1 X126.164 Y129.786 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.965 Y129.733 I-.169 J.234 E.05316
G3 X126.051 Y129.737 I.035 J.178 E.00291
G1 X126.051 Y129.737 E0
G3 X126.112 Y129.756 I-.056 J.283 E.00212
G1 X126.387 Y129.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.395 J.56 E.11202
G3 X126.145 Y129.356 I.239 J.701 E.01213
G3 X126.336 Y129.431 I-.154 J.668 E.00633
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08554
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.4 J1.149 P1  F30000
G1 X128.747 Y129.657 Z8.2
G1 Z7.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.244 J.366 E.0066
G3 X129.092 Y129.595 I.053 J.299 E.00451
G3 X128.699 Y129.694 I-.101 J.429 E.07207
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06322
G1 X128.947 Y129.585 E-.04052
G1 X129.092 Y129.595 E-.05522
G1 X129.251 Y129.66 E-.06556
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.732 Y130.373 E-.00871
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.25 J1.191 P1  F30000
G1 X130.883 Y129.921 Z8.2
G1 Z7.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X130.981 Y129.871 I.114 J.103 E.00307
G3 X131.03 Y129.874 I.019 J.099 E.00133
G3 X130.852 Y129.973 I-.033 J.15 E.02028
M204 S10000
; WIPE_START
G1 F24000
G1 X130.981 Y129.871 E-.13231
G1 X131.03 Y129.874 E-.03868
G1 X131.088 Y129.897 E-.0502
G1 X131.136 Y129.953 E-.0592
G1 X131.15 Y130.061 E-.08772
G1 X131.088 Y130.151 E-.08772
G1 X130.981 Y130.177 E-.08771
G1 X130.885 Y130.126 E-.08772
G1 X130.846 Y130.024 E-.08771
G1 X130.852 Y129.973 E-.04103
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.026 J1.217 P1  F30000
G1 X132.979 Y130.019 Z8.2
G1 Z7.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00089
G1 X133.021 Y130.029 E.00079
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.36962
G1 X133.021 Y130.029 E-.36901
G1 X133.02 Y130.03 E-.02137
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/55
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
G3 Z8.2 I1.05 J-.616 P1  F30000
G1 X130.782 Y126.217 Z8.2
G1 Z8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.965 Y125.738 I.212 J-.194 E.01949
G3 X131.055 Y125.743 I.035 J.185 E.0028
G3 X130.827 Y126.257 I-.061 J.281 E.0313
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08285
G1 X130.712 Y126.024 E-.02941
G1 X130.745 Y125.89 E-.0584
G1 X130.784 Y125.833 E-.02941
G1 X130.898 Y125.754 E-.0584
G1 X130.965 Y125.738 E-.02941
G1 X131.055 Y125.743 E-.03818
G1 X131.164 Y125.787 E-.0495
G1 X131.255 Y125.89 E-.0584
G1 X131.28 Y125.955 E-.02941
G1 X131.28 Y126.093 E-.0584
G1 X131.216 Y126.215 E-.0584
G1 X131.164 Y126.262 E-.02941
G1 X131.035 Y126.311 E-.0584
G1 X130.965 Y126.311 E-.02941
G1 X130.836 Y126.262 E-.0584
G1 X130.827 Y126.257 E-.00419
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.1 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.512 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.806 Y125.512 I.482 J-.256 E.02864
G3 X129.11 Y125.491 I.191 J.563 E.00948
G3 X128.543 Y126.332 I-.117 J.533 E.06536
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07286
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.11 Y125.491 E-.06708
G1 X129.194 Y125.512 E-.03292
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.985 E-.03504
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.22 Y126.343 E.00309
G3 X125.953 Y125.634 I-.227 J-.32 E.04751
G3 X126.067 Y125.638 I.047 J.235 E.00384
G3 X126.342 Y126.203 I-.074 J.385 E.02417
G1 X126.322 Y126.229 E.00107
G1 X126.59 Y126.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.34 Y125.602 I-.589 J-.52 E.07217
G1 X125.34 Y125.602 E0
G3 X126.161 Y125.258 I.647 J.392 E.02923
G3 X126.628 Y126.5 I-.16 J.769 E.04859
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09479
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.985 E-.01514
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.22 Y129.83 E.00233
G3 X126.035 Y129.733 I-.219 J.193 E.05389
G1 X126.104 Y129.75 E.00235
G1 X126.113 Y129.756 E.00034
G1 X126.387 Y129.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.395 J.56 E.11203
G3 X126.14 Y129.355 I.24 J.705 E.01196
G3 X126.336 Y129.431 I-.148 J.669 E.0065
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08554
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.4 J1.149 P1  F30000
G1 X128.747 Y129.657 Z8.4
G1 Z8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.245 J.366 E.0066
G3 X129.088 Y129.594 I.053 J.291 E.00439
G3 X128.699 Y129.694 I-.097 J.43 E.07219
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06322
G1 X128.947 Y129.585 E-.04052
G1 X129.088 Y129.594 E-.05375
G1 X129.251 Y129.66 E-.06705
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.732 Y130.373 E-.0087
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.25 J1.191 P1  F30000
G1 X130.883 Y129.921 Z8.4
G1 Z8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X130.981 Y129.871 I.114 J.103 E.00307
G1 X131.028 Y129.873 E.00126
G3 X130.852 Y129.974 I-.03 J.15 E.02034
M204 S10000
; WIPE_START
M73 P90 R1
G1 F24000
G1 X130.981 Y129.871 E-.13229
G1 X131.028 Y129.873 E-.03706
G1 X131.088 Y129.897 E-.05186
M73 P90 R0
G1 X131.136 Y129.953 E-.05921
G1 X131.15 Y130.061 E-.08773
G1 X131.088 Y130.151 E-.08773
G1 X130.981 Y130.177 E-.08773
G1 X130.885 Y130.126 E-.08773
G1 X130.846 Y130.024 E-.08773
G1 X130.852 Y129.974 E-.04094
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.026 J1.217 P1  F30000
G1 X132.979 Y130.019 Z8.4
G1 Z8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00089
G1 X133.019 Y130.032 E.00084
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.38
G1 X133.019 Y130.032 E-.38
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/55
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
G3 Z8.4 I1.05 J-.614 P1  F30000
G1 X130.785 Y126.214 Z8.4
G1 Z8.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.718 Y126.075 I.214 J-.19 E.00481
G1 X130.718 Y126.075 E0
G3 X131.052 Y125.742 I.283 J-.05 E.01702
G3 X130.83 Y126.255 I-.053 J.282 E.03163
M204 S10000
; WIPE_START
G1 F24000
G1 X130.718 Y126.075 E-.08995
G1 X130.718 Y126.075 E0
G1 X130.72 Y125.955 E-.05094
G1 X130.784 Y125.833 E-.05859
G1 X130.898 Y125.754 E-.05859
G1 X131.052 Y125.742 E-.06587
G1 X131.164 Y125.787 E-.05093
G1 X131.216 Y125.833 E-.02951
G1 X131.28 Y125.955 E-.05859
G1 X131.28 Y126.093 E-.05859
G1 X131.216 Y126.215 E-.05859
G1 X131.164 Y126.262 E-.02951
G1 X131.035 Y126.311 E-.05859
G1 X130.898 Y126.294 E-.05859
G1 X130.83 Y126.255 E-.03315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.099 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.01101
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.512 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.806 Y125.512 I.482 J-.256 E.02863
G3 X129.106 Y125.49 I.192 J.568 E.00934
G3 X128.543 Y126.332 I-.112 J.534 E.06551
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07286
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.106 Y125.49 E-.06537
G1 X129.194 Y125.512 E-.03466
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.985 E-.03502
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.224 Y126.348 E.00313
G3 X126.14 Y125.656 I-.222 J-.324 E.05339
G3 X126.347 Y126.206 I-.145 J.369 E.02196
G1 X126.325 Y126.232 E.00111
G1 X126.585 Y126.542 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.552 Y125.375 I-.591 J-.517 E.08198
G3 X126.155 Y125.256 I.437 J.629 E.01943
G3 X126.622 Y126.496 I-.162 J.769 E.04842
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09461
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01533
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.22 Y129.83 E.00233
G3 X126.035 Y129.733 I-.219 J.193 E.05389
G1 X126.104 Y129.75 E.00235
G1 X126.113 Y129.756 E.00034
G1 X126.387 Y129.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.395 J.561 E.11205
G3 X126.135 Y129.353 I.241 J.711 E.01179
G3 X126.336 Y129.431 I-.143 J.671 E.00667
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08554
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.4 J1.149 P1  F30000
G1 X128.747 Y129.657 Z8.6
G1 Z8.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.245 J.367 E.0066
G3 X129.084 Y129.593 I.053 J.282 E.00427
G3 X128.699 Y129.694 I-.093 J.432 E.07252
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06322
G1 X128.947 Y129.585 E-.04052
G1 X129.084 Y129.593 E-.05227
G1 X129.251 Y129.66 E-.06853
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.374 Y130.256 E-.05227
G1 X129.251 Y130.388 E-.06853
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.73 Y130.372 E-.00945
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.249 J1.191 P1  F30000
G1 X130.884 Y129.921 Z8.6
G1 Z8.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X130.981 Y129.871 I.114 J.103 E.00307
G1 X131.026 Y129.873 E.00121
G3 X130.853 Y129.974 I-.028 J.151 E.0204
M204 S10000
; WIPE_START
G1 F24000
G1 X130.981 Y129.871 E-.13226
G1 X131.026 Y129.873 E-.03543
G1 X131.088 Y129.897 E-.05353
G1 X131.136 Y129.953 E-.05922
G1 X131.15 Y130.061 E-.08775
G1 X131.088 Y130.151 E-.08775
G1 X130.981 Y130.177 E-.08775
G1 X130.885 Y130.126 E-.08775
G1 X130.846 Y130.024 E-.08775
G1 X130.853 Y129.974 E-.04081
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.026 J1.217 P1  F30000
G1 X132.979 Y130.019 Z8.6
G1 Z8.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00089
G1 X133.019 Y130.032 E.00084
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.38
G1 X133.019 Y130.032 E-.38
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/55
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
G3 Z8.6 I1.05 J-.615 P1  F30000
G1 X130.783 Y126.217 Z8.6
G1 Z8.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.965 Y125.738 I.212 J-.193 E.01945
G3 X131.05 Y125.741 I.035 J.173 E.00262
G3 X130.828 Y126.257 I-.054 J.282 E.03153
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08282
G1 X130.712 Y126.024 E-.02942
G1 X130.745 Y125.89 E-.0584
G1 X130.784 Y125.833 E-.02941
G1 X130.836 Y125.787 E-.02942
G1 X130.965 Y125.738 E-.0584
G1 X131.05 Y125.741 E-.03569
G1 X131.164 Y125.787 E-.05203
G1 X131.255 Y125.89 E-.0584
G1 X131.28 Y125.955 E-.02942
G1 X131.28 Y126.093 E-.0584
G1 X131.216 Y126.215 E-.0584
G1 X131.164 Y126.262 E-.02942
G1 X131.035 Y126.311 E-.0584
G1 X130.965 Y126.311 E-.02942
G1 X130.836 Y126.262 E-.0584
G1 X130.828 Y126.257 E-.00414
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.1 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.513 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.806 Y125.512 I.481 J-.256 E.02859
G3 X129.101 Y125.489 I.193 J.575 E.0092
G3 X128.544 Y126.331 I-.107 J.534 E.06553
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07281
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.101 Y125.489 E-.06366
G1 X129.194 Y125.512 E-.0364
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.985 E-.03503
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.112 J-1.212 P1  F30000
G1 X126.293 Y126.284 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.047 Y125.634 I-.293 J-.261 E.05338
G1 X126.14 Y125.656 E.00315
G3 X126.329 Y126.236 I-.139 J.367 E.02319
G1 X126.583 Y126.54 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.72 Y125.287 I-.591 J-.516 E.08788
G3 X126.149 Y125.255 I.277 J.822 E.01335
G3 X126.62 Y126.494 I-.158 J.769 E.04849
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09455
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01539
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.181 J.295 P1  F30000
G1 X126.167 Y129.783 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.035 Y129.733 I-.166 J.24 E.05624
G1 X126.104 Y129.75 E.00235
G3 X126.114 Y129.754 I-.104 J.273 E.00036
G1 X126.387 Y129.463 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.395 J.56 E.11184
G3 X126.129 Y129.352 I.242 J.719 E.01163
G3 X126.336 Y129.431 I-.137 J.671 E.00684
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08554
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.4 J1.149 P1  F30000
G1 X128.747 Y129.657 Z8.8
G1 Z8.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.245 J.366 E.0066
G3 X129.08 Y129.592 I.053 J.274 E.00415
G3 X128.699 Y129.694 I-.088 J.431 E.07244
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06321
G1 X128.947 Y129.585 E-.04052
G1 X129.08 Y129.592 E-.0508
G1 X129.251 Y129.66 E-.07001
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.732 Y130.373 E-.00869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.25 J1.191 P1  F30000
G1 X130.884 Y129.922 Z8.8
G1 Z8.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X130.981 Y129.871 I.114 J.1 E.00306
G1 X131.024 Y129.872 E.00115
G3 X130.854 Y129.975 I-.025 J.15 E.02016
M204 S10000
; WIPE_START
G1 F24000
G1 X130.981 Y129.871 E-.13207
G1 X131.024 Y129.872 E-.03384
G1 X131.088 Y129.897 E-.05525
G1 X131.136 Y129.953 E-.0593
G1 X131.15 Y130.061 E-.08787
G1 X131.088 Y130.151 E-.08787
G1 X130.981 Y130.177 E-.08787
G1 X130.885 Y130.126 E-.08787
G1 X130.846 Y130.024 E-.08787
G1 X130.854 Y129.975 E-.0402
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.025 J1.217 P1  F30000
G1 X132.979 Y130.019 Z8.8
G1 Z8.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00089
G1 X133.021 Y130.029 E.00079
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.36961
G1 X133.021 Y130.029 E-.369
G1 X133.02 Y130.03 E-.02139
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/55
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
G3 Z8.8 I1.05 J-.615 P1  F30000
G1 X130.786 Y126.213 Z8.8
G1 Z8.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.965 Y125.738 I.21 J-.193 E.0193
G3 X131.047 Y125.741 I.035 J.167 E.00253
G3 X130.831 Y126.253 I-.051 J.28 E.03131
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08233
G1 X130.712 Y126.024 E-.02943
G1 X130.745 Y125.89 E-.05843
G1 X130.784 Y125.833 E-.02943
G1 X130.898 Y125.754 E-.05843
M73 P91 R0
G1 X130.965 Y125.738 E-.02943
G1 X131.047 Y125.741 E-.03445
G1 X131.164 Y125.787 E-.05332
G1 X131.255 Y125.89 E-.05843
G1 X131.288 Y126.024 E-.05843
G1 X131.28 Y126.093 E-.02943
G1 X131.255 Y126.158 E-.02943
G1 X131.164 Y126.262 E-.05843
G1 X131.102 Y126.294 E-.02944
G1 X130.965 Y126.311 E-.05843
G1 X130.836 Y126.262 E-.05843
G1 X130.831 Y126.253 E-.00426
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.098 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.51 Y126.282 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.934 Y125.48 I.48 J-.259 E.03288
G3 X129.097 Y125.488 I.066 J.334 E.00506
G3 X128.541 Y126.333 I-.107 J.535 E.06559
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07293
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.097 Y125.488 E-.06196
G1 X129.194 Y125.512 E-.03814
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03489
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.224 Y126.348 E.00313
G3 X126.14 Y125.656 I-.222 J-.324 E.05339
G3 X126.347 Y126.206 I-.145 J.369 E.02196
G1 X126.325 Y126.232 E.00112
G1 X126.583 Y126.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.72 Y125.287 I-.592 J-.517 E.0879
G3 X126.143 Y125.253 I.279 J.832 E.01317
G3 X126.621 Y126.494 I-.152 J.771 E.04871
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09456
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01537
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.181 J.295 P1  F30000
G1 X126.167 Y129.783 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.035 Y129.733 I-.166 J.24 E.05624
G1 X126.104 Y129.75 E.00235
G3 X126.114 Y129.754 I-.104 J.273 E.00036
G1 X126.387 Y129.463 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.394 J.56 E.11185
G3 X126.124 Y129.351 I.244 J.729 E.01146
G3 X126.337 Y129.431 I-.131 J.672 E.00701
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08555
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04377
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.397 J1.15 P1  F30000
G1 X128.75 Y129.662 Z9
G1 Z8.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.076 Y129.591 I.25 J.362 E.01052
G3 X129.439 Y130.001 I-.068 J.426 E.01823
G1 X129.439 Y130.001 E0
G3 X128.703 Y129.7 I-.439 J.023 E.05435
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06305
G1 X128.947 Y129.585 E-.04052
G1 X129.076 Y129.591 E-.04934
G1 X129.251 Y129.66 E-.0715
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.439 Y130.001 E-.0715
G1 X129.439 Y130.001 E0
G1 X129.429 Y130.13 E-.04933
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.73 Y130.371 E-.00957
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.249 J1.191 P1  F30000
G1 X130.885 Y129.922 Z9
G1 Z8.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X130.981 Y129.871 I.114 J.1 E.00306
G1 X131.021 Y129.872 E.0011
G3 X130.854 Y129.975 I-.023 J.15 E.02023
M204 S10000
; WIPE_START
G1 F24000
G1 X130.981 Y129.871 E-.132
G1 X131.021 Y129.872 E-.03222
G1 X131.088 Y129.897 E-.05693
G1 X131.136 Y129.953 E-.05932
G1 X131.15 Y130.061 E-.08791
G1 X131.088 Y130.151 E-.0879
G1 X130.981 Y130.177 E-.0879
G1 X130.885 Y130.126 E-.08791
G1 X130.846 Y130.024 E-.0879
G1 X130.854 Y129.975 E-.04001
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.022 J1.217 P1  F30000
G1 X132.981 Y130.014 Z9
G1 Z8.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00079
G1 X133.019 Y130.034 E.00089
G1 X133.018 Y130.035 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.37073
G1 X133.019 Y130.034 E-.37025
G1 X133.018 Y130.035 E-.01902
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/55
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
G3 Z9 I1.05 J-.615 P1  F30000
G1 X130.783 Y126.216 Z9
G1 Z8.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.965 Y125.738 I.214 J-.193 E.01941
G3 X131.044 Y125.74 I.035 J.16 E.00243
G1 X131.044 Y125.74 E0
G3 X130.828 Y126.257 I-.047 J.284 E.03185
M204 S10000
; WIPE_START
G1 F24000
G1 X130.745 Y126.158 E-.05445
G1 X130.712 Y126.024 E-.05835
G1 X130.745 Y125.89 E-.05835
G1 X130.784 Y125.833 E-.02939
G1 X130.836 Y125.787 E-.02939
G1 X130.965 Y125.738 E-.05835
G1 X131.044 Y125.74 E-.03316
G1 X131.044 Y125.74 E0
G1 X131.164 Y125.787 E-.05451
G1 X131.255 Y125.89 E-.05835
G1 X131.28 Y125.955 E-.02939
G1 X131.28 Y126.093 E-.05835
G1 X131.255 Y126.158 E-.02939
G1 X131.164 Y126.262 E-.05835
G1 X131.035 Y126.311 E-.05835
G1 X130.965 Y126.311 E-.02939
G1 X130.836 Y126.262 E-.05835
G1 X130.828 Y126.257 E-.00412
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.1 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.515 Y126.279 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.092 Y125.487 I.484 J-.254 E.03737
G3 X129.545 Y125.997 I-.082 J.529 E.02272
G1 X129.545 Y125.997 E0
G3 X128.546 Y126.33 I-.546 J.028 E.04366
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07278
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.092 Y125.487 E-.06025
G1 X129.194 Y125.512 E-.03988
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03499
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.277 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.222 Y126.346 E.00311
G3 X126.047 Y125.634 I-.222 J-.323 E.05025
G1 X126.14 Y125.656 E.00315
G3 X126.347 Y126.206 I-.139 J.367 E.02204
G1 X126.325 Y126.232 E.00112
G1 X126.584 Y126.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.72 Y125.287 I-.591 J-.517 E.0879
G3 X126.138 Y125.252 I.281 J.845 E.01298
G3 X126.622 Y126.495 I-.145 J.772 E.04894
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09458
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01536
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.219 Y129.83 E.00232
G3 X126.167 Y130.266 I-.223 J.194 E.01638
G3 X126.104 Y129.75 I-.165 J-.242 E.03982
G1 X126.113 Y129.756 E.00034
G1 X126.387 Y129.463 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.394 J.56 E.11186
G3 X126.119 Y129.35 I.246 J.741 E.0113
G3 X126.337 Y129.43 I-.125 J.673 E.00718
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08555
G1 X126.61 Y129.704 E-.06306
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04377
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.399 J1.15 P1  F30000
G1 X128.747 Y129.658 Z9.2
G1 Z8.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.246 J.366 E.00659
G3 X129.073 Y129.59 I.053 J.258 E.00391
G3 X128.7 Y129.695 I-.079 J.434 E.07277
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.0632
G1 X128.947 Y129.585 E-.04052
G1 X129.073 Y129.59 E-.04787
G1 X129.251 Y129.66 E-.07298
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.138 Y130.442 E-.04787
G1 X128.947 Y130.463 E-.07298
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.73 Y130.372 E-.00938
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.247 J1.192 P1  F30000
G1 X130.888 Y129.925 Z9.2
G1 Z8.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.12 J.106 E.00402
G3 X131.136 Y130.097 I-.022 J.154 E.00811
G1 X131.136 Y130.097 E0
G3 X130.85 Y130.06 I-.136 J-.074 E.01014
G1 X130.85 Y130.06 E0
G3 X130.857 Y129.976 I.158 J-.029 E.00233
M204 S10000
; WIPE_START
G1 F24000
G1 X130.945 Y129.88 E-.1042
G1 X131.019 Y129.871 E-.05957
G1 X131.088 Y129.897 E-.05816
G1 X131.136 Y129.953 E-.05888
G1 X131.154 Y130.024 E-.05889
G1 X131.136 Y130.097 E-.05957
G1 X131.136 Y130.097 E0
G1 X131.055 Y130.168 E-.08655
G1 X130.981 Y130.177 E-.05888
G1 X130.885 Y130.126 E-.08726
G1 X130.85 Y130.06 E-.05957
G1 X130.85 Y130.06 E0
G1 X130.85 Y129.987 E-.05816
G1 X130.857 Y129.976 E-.0103
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.024 J1.217 P1  F30000
G1 X132.979 Y130.019 Z9.2
G1 Z8.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00089
G1 X133.021 Y130.029 E.00079
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.36962
G1 X133.021 Y130.029 E-.36901
G1 X133.02 Y130.03 E-.02137
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/55
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
G3 Z9.2 I1.051 J-.614 P1  F30000
G1 X130.788 Y126.212 Z9.2
G1 Z9
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.965 Y125.738 I.209 J-.192 E.01918
G3 X131.041 Y125.739 I.035 J.154 E.00234
G3 X130.833 Y126.252 I-.043 J.281 E.03146
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08253
G1 X130.712 Y126.024 E-.02945
G1 X130.72 Y125.955 E-.02945
G1 X130.784 Y125.833 E-.05847
G1 X130.898 Y125.754 E-.05847
G1 X130.965 Y125.738 E-.02945
G1 X131.041 Y125.739 E-.03198
G1 X131.164 Y125.787 E-.05589
G1 X131.255 Y125.89 E-.05847
G1 X131.28 Y125.955 E-.02945
G1 X131.28 Y126.093 E-.05847
G1 X131.255 Y126.158 E-.02945
G1 X131.164 Y126.262 E-.05847
G1 X131.035 Y126.311 E-.05847
G1 X130.965 Y126.311 E-.02945
G1 X130.898 Y126.294 E-.02945
G1 X130.833 Y126.252 E-.0326
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.097 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.01101
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.511 Y126.281 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.934 Y125.48 I.481 J-.258 E.03282
G3 X129.088 Y125.486 I.066 J.315 E.00478
G3 X128.542 Y126.332 I-.096 J.538 E.066
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.0729
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.088 Y125.486 E-.05855
G1 X129.194 Y125.512 E-.04162
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
M73 P92 R0
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03485
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.278 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.224 Y126.348 E.00312
G3 X126.14 Y125.656 I-.222 J-.324 E.05339
G3 X126.347 Y126.206 I-.145 J.369 E.02196
G1 X126.325 Y126.232 E.00112
G1 X126.584 Y126.542 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.72 Y125.287 I-.591 J-.518 E.08789
G3 X126.132 Y125.251 I.284 J.861 E.0128
G3 X126.622 Y126.495 I-.139 J.774 E.04918
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.0946
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01534
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.181 J.295 P1  F30000
G1 X126.167 Y129.783 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.035 Y129.733 I-.166 J.24 E.05625
G1 X126.104 Y129.75 E.00235
G3 X126.114 Y129.754 I-.104 J.273 E.00036
G1 X126.388 Y129.462 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.394 J.562 E.11215
G3 X126.114 Y129.348 I.248 J.756 E.01113
G3 X126.337 Y129.43 I-.119 J.676 E.00736
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08556
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04376
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.399 J1.15 P1  F30000
G1 X128.747 Y129.658 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.247 J.365 E.00659
G3 X129.069 Y129.589 I.053 J.249 E.00379
G3 X128.7 Y129.695 I-.075 J.435 E.07293
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06319
G1 X128.947 Y129.585 E-.04052
G1 X129.069 Y129.589 E-.0464
G1 X129.251 Y129.66 E-.07446
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.141 Y130.442 E-.04641
G1 X128.947 Y130.463 E-.07446
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.73 Y130.372 E-.00936
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.259 J1.189 P1  F30000
G1 X130.913 Y129.897 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.088 J.126 E.00305
G1 X131.055 Y129.88 E.00102
G3 X130.87 Y129.942 I-.055 J.144 E.02063
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.13204
G1 X131.055 Y129.88 E-.02987
G1 X131.136 Y129.953 E-.08789
G1 X131.15 Y130.061 E-.08789
G1 X131.088 Y130.151 E-.08789
G1 X131.019 Y130.177 E-.05931
G1 X130.945 Y130.168 E-.05931
G1 X130.864 Y130.096 E-.08789
G1 X130.85 Y129.987 E-.08789
G1 X130.87 Y129.942 E-.04001
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.042 J1.216 P1  F30000
G1 X132.981 Y130.014 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00079
G1 X133.019 Y130.034 E.00089
G1 X133.018 Y130.035 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.37074
G1 X133.019 Y130.034 E-.37025
G1 X133.018 Y130.035 E-.01901
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/55
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
G3 Z9.4 I1.051 J-.613 P1  F30000
G1 X130.789 Y126.211 Z9.4
G1 Z9.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.965 Y125.738 I.21 J-.191 E.01914
G1 X131.038 Y125.739 E.00223
G3 X130.834 Y126.251 I-.039 J.281 E.03162
M204 S10000
; WIPE_START
G1 F24000
G1 X130.745 Y126.158 E-.05453
G1 X130.712 Y126.024 E-.05839
G1 X130.72 Y125.955 E-.02941
G1 X130.784 Y125.833 E-.05839
G1 X130.898 Y125.754 E-.05839
G1 X130.965 Y125.738 E-.02941
G1 X131.038 Y125.739 E-.0307
G1 X131.164 Y125.787 E-.05708
G1 X131.255 Y125.89 E-.05839
G1 X131.28 Y125.955 E-.02941
G1 X131.28 Y126.093 E-.05839
G1 X131.255 Y126.158 E-.02941
G1 X131.164 Y126.262 E-.05839
G1 X131.035 Y126.311 E-.05839
G1 X130.965 Y126.311 E-.02941
G1 X130.898 Y126.294 E-.02941
G1 X130.834 Y126.251 E-.03249
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.097 J-1.213 P1  F30000
G1 X128.866 Y126.095 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.054 Y125.881 I.135 J-.071 E.0122
G3 X129.087 Y126.15 I-.056 J.143 E.01098
G3 X128.904 Y126.142 I-.086 J-.126 E.00653
G1 X128.512 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.934 Y125.48 I.481 J-.258 E.03275
G3 X129.083 Y125.485 I.066 J.305 E.00464
G3 X128.544 Y126.331 I-.09 J.538 E.06611
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07284
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.083 Y125.485 E-.05685
G1 X129.194 Y125.512 E-.04336
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03486
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.112 J-1.212 P1  F30000
G1 X126.293 Y126.284 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.047 Y125.634 I-.293 J-.261 E.05338
G1 X126.14 Y125.656 E.00315
G3 X126.329 Y126.236 I-.139 J.367 E.02319
G1 X126.583 Y126.54 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.72 Y125.287 I-.589 J-.518 E.08763
G3 X126.126 Y125.249 I.287 J.881 E.01262
G3 X126.621 Y126.494 I-.132 J.773 E.04933
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09457
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01537
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.219 Y129.83 E.00232
G3 X126.167 Y130.266 I-.223 J.194 E.01638
G3 X126.104 Y129.75 I-.165 J-.242 E.03982
G1 X126.112 Y129.756 E.00034
G1 X126.388 Y129.462 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.756 Y129.38 I-.393 J.562 E.11201
G3 X126.108 Y129.347 I.252 J.776 E.01096
G3 X126.338 Y129.429 I-.114 J.676 E.00753
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08557
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04375
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.399 J1.15 P1  F30000
G1 X128.748 Y129.658 Z9.6
G1 Z9.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.248 J.365 E.00658
G3 X129.065 Y129.588 I.053 J.241 E.00367
G3 X128.7 Y129.696 I-.07 J.435 E.07306
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06317
G1 X128.947 Y129.585 E-.04052
G1 X129.065 Y129.588 E-.04494
G1 X129.157 Y129.611 E-.03598
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.145 Y130.441 E-.04494
G1 X129.053 Y130.463 E-.03598
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00821
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.26 J1.189 P1  F30000
G1 X130.913 Y129.897 Z9.6
G1 Z9.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.088 J.126 E.00305
G1 X131.055 Y129.88 E.00102
G3 X130.87 Y129.942 I-.055 J.144 E.02063
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.13204
G1 X131.055 Y129.88 E-.02988
G1 X131.115 Y129.922 E-.05931
G1 X131.15 Y129.987 E-.05932
G1 X131.136 Y130.096 E-.08789
G1 X131.055 Y130.168 E-.08789
G1 X130.945 Y130.168 E-.08789
G1 X130.864 Y130.096 E-.08789
G1 X130.85 Y129.987 E-.08789
G1 X130.87 Y129.942 E-.04001
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.047 J1.216 P1  F30000
G1 X132.978 Y130.023 Z9.6
G1 Z9.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.009 Y130.004 E.00098
G1 X133.022 Y130.025 E.00067
G1 X133.021 Y130.025 E.00002
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.009 Y130.004 E-.37373
G1 X133.022 Y130.025 E-.37316
G1 X133.021 Y130.025 E-.01311
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/55
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
G3 Z9.6 I1.05 J-.616 P1  F30000
G1 X130.786 Y126.214 Z9.6
G1 Z9.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.035 Y125.738 I.215 J-.191 E.02133
G3 X131.288 Y126.024 I-.063 J.311 E.01261
G1 X131.288 Y126.024 E0
G3 X130.83 Y126.255 I-.288 J-.001 E.01947
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.0828
G1 X130.712 Y126.024 E-.02944
G1 X130.745 Y125.89 E-.05844
G1 X130.836 Y125.787 E-.05844
G1 X130.898 Y125.754 E-.02944
G1 X131.035 Y125.738 E-.05849
G1 X131.164 Y125.787 E-.05839
G1 X131.216 Y125.833 E-.02944
G1 X131.255 Y125.89 E-.02943
G1 X131.288 Y126.024 E-.0584
G1 X131.288 Y126.024 E-.00005
G1 X131.255 Y126.158 E-.05849
G1 X131.164 Y126.262 E-.0584
G1 X131.102 Y126.294 E-.02944
G1 X130.965 Y126.311 E-.05844
G1 X130.898 Y126.294 E-.02944
G1 X130.83 Y126.255 E-.03303
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.099 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.01101
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.512 Y126.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.934 Y125.48 I.483 J-.257 E.03273
G3 X129.079 Y125.483 I.066 J.296 E.0045
G3 X128.543 Y126.332 I-.085 J.54 E.06648
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07286
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.079 Y125.483 E-.05515
G1 X129.194 Y125.512 E-.0451
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03481
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.278 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.224 Y126.348 E.00312
G3 X126.14 Y125.656 I-.222 J-.324 E.05339
G3 X126.347 Y126.206 I-.145 J.369 E.02196
G1 X126.325 Y126.232 E.00112
G1 X126.583 Y126.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.72 Y125.287 I-.589 J-.519 E.0876
G3 X126.12 Y125.248 I.291 J.906 E.01243
G3 X126.621 Y126.494 I-.126 J.775 E.04957
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09459
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01535
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.22 Y129.83 E.00233
G3 X126.035 Y129.733 I-.219 J.193 E.05389
M73 P93 R0
G1 X126.104 Y129.75 E.00235
G1 X126.112 Y129.756 E.00034
G1 X126.388 Y129.462 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.917 Y129.341 I-.396 J.56 E.11708
G3 X126.103 Y129.346 I.083 J.38 E.00577
G3 X126.337 Y129.43 I-.111 J.676 E.00769
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08557
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.598 Y130.361 E-.0707
G1 X126.515 Y130.481 E-.05524
G1 X126.391 Y130.591 E-.06306
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04395
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.398 J1.15 P1  F30000
G1 X128.75 Y129.662 Z9.8
G1 Z9.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.061 Y129.587 I.251 J.362 E.01007
G3 X129.441 Y130.016 I-.058 J.434 E.01921
G1 X129.441 Y130.016 E0
G3 X128.703 Y129.699 I-.44 J.007 E.05392
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06306
G1 X128.947 Y129.585 E-.04052
G1 X129.061 Y129.587 E-.04348
G1 X129.157 Y129.611 E-.03748
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.441 Y130.016 E-.03748
G1 X129.441 Y130.016 E0
G1 X129.429 Y130.13 E-.04348
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.732 Y130.374 E-.00825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.26 J1.189 P1  F30000
G1 X130.913 Y129.897 Z9.8
G1 Z9.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.019 Y129.871 I.088 J.126 E.00305
G1 X131.055 Y129.88 E.00102
G3 X130.87 Y129.942 I-.055 J.144 E.02063
M204 S10000
; WIPE_START
G1 F24000
G1 X131.019 Y129.871 E-.13204
G1 X131.055 Y129.88 E-.02988
G1 X131.136 Y129.953 E-.08789
G1 X131.15 Y130.061 E-.08789
G1 X131.115 Y130.126 E-.05931
G1 X131.055 Y130.168 E-.05932
G1 X130.945 Y130.168 E-.08788
G1 X130.864 Y130.096 E-.08789
G1 X130.85 Y129.987 E-.08789
G1 X130.87 Y129.942 E-.04001
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.042 J1.216 P1  F30000
G1 X132.981 Y130.014 Z9.8
G1 Z9.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00081
G1 X133.019 Y130.034 E.00088
G1 X133.018 Y130.035 E.00004
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.37044
G1 X133.019 Y130.034 E-.37219
G1 X133.018 Y130.035 E-.01736
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/55
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
G3 Z9.8 I1.05 J-.615 P1  F30000
G1 X130.746 Y126.157 Z9.8
G1 Z9.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.102 Y125.754 I.255 J-.133 E.02132
G3 X131.164 Y126.262 I-.106 J.27 E.01919
G3 X130.78 Y126.208 I-.162 J-.238 E.01308
M204 S10000
; WIPE_START
G1 F24000
G1 X130.712 Y126.024 E-.08291
G1 X130.745 Y125.89 E-.05851
G1 X130.836 Y125.787 E-.05851
G1 X130.965 Y125.738 E-.0585
G1 X131.102 Y125.754 E-.05851
G1 X131.164 Y125.787 E-.02947
G1 X131.255 Y125.89 E-.05851
G1 X131.288 Y126.024 E-.05851
G1 X131.255 Y126.158 E-.05851
G1 X131.164 Y126.262 E-.05851
G1 X131.035 Y126.311 E-.05851
G1 X130.965 Y126.311 E-.02947
G1 X130.836 Y126.262 E-.05851
G1 X130.78 Y126.208 E-.03309
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.072 J-1.215 P1  F30000
G1 X128.865 Y126.095 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.515 Y126.279 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.934 Y125.48 I.482 J-.257 E.03263
G3 X129.075 Y125.482 I.066 J.286 E.00436
G3 X128.546 Y126.33 I-.078 J.54 E.06654
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07278
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.075 Y125.482 E-.05345
G1 X129.194 Y125.512 E-.04684
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03484
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.278 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.222 Y126.346 E.0031
G3 X126.047 Y125.634 I-.222 J-.323 E.05025
G1 X126.14 Y125.656 E.00315
G3 X126.347 Y126.206 I-.139 J.367 E.02204
G1 X126.325 Y126.232 E.00112
G1 X126.582 Y126.54 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.905 Y125.241 I-.59 J-.518 E.09362
G3 X126.114 Y125.246 I.095 J.427 E.00649
G3 X126.62 Y126.493 I-.122 J.776 E.04967
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09454
G1 X126.26 Y126.766 E-.07952
G1 X126.095 Y126.807 E-.06474
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.983 E-.01559
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.22 Y129.83 E.00233
G3 X126.035 Y129.733 I-.219 J.193 E.05389
G1 X126.104 Y129.75 E.00235
G1 X126.112 Y129.756 E.00034
G1 X126.388 Y129.461 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.917 Y129.341 I-.395 J.561 E.11719
G3 X126.098 Y129.344 I.083 J.368 E.00561
G3 X126.338 Y129.429 I-.104 J.678 E.00787
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08558
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.601 Y130.357 E-.06869
G1 X126.515 Y130.481 E-.0573
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04389
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.398 J1.15 P1  F30000
G1 X128.749 Y129.66 Z10
G1 Z9.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.057 Y129.586 I.251 J.364 E.00997
G3 X129.442 Y130.02 I-.056 J.437 E.01945
G1 X129.442 Y130.02 E0
G3 X128.702 Y129.698 I-.442 J.004 E.05409
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06311
G1 X128.947 Y129.585 E-.04052
G1 X129.057 Y129.586 E-.04202
G1 X129.157 Y129.611 E-.03898
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.02 E-.03898
G1 X129.442 Y130.02 E0
G1 X129.429 Y130.13 E-.04202
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00813
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.26 J1.189 P1  F30000
G1 X130.913 Y129.898 Z10
G1 Z9.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.055 Y129.88 I.088 J.126 E.00406
G3 X131.088 Y130.151 I-.057 J.144 E.00912
G3 X130.871 Y129.941 I-.087 J-.127 E.01151
M204 S10000
; WIPE_START
G1 F24000
G1 X130.981 Y129.871 E-.10432
G1 X131.055 Y129.88 E-.05883
G1 X131.115 Y129.922 E-.05883
G1 X131.15 Y129.987 E-.05883
G1 X131.15 Y130.061 E-.05883
G1 X131.088 Y130.151 E-.08717
G1 X131.019 Y130.177 E-.05883
G1 X130.945 Y130.168 E-.05883
G1 X130.885 Y130.126 E-.05883
G1 X130.85 Y130.061 E-.05884
G1 X130.864 Y129.953 E-.08716
G1 X130.871 Y129.941 E-.01071
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.047 J1.216 P1  F30000
G1 X132.978 Y130.023 Z10
G1 Z9.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00096
G1 X133.022 Y130.026 E.0007
G1 X133.021 Y130.026 E.00003
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.37326
G1 X133.022 Y130.026 E-.37283
G1 X133.021 Y130.026 E-.01391
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/55
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
G3 Z10 I1.05 J-.616 P1  F30000
G1 X130.785 Y126.214 Z10
G1 Z9.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.102 Y125.754 I.216 J-.19 E.02344
G3 X131.164 Y126.262 I-.106 J.27 E.01919
G3 X130.83 Y126.255 I-.162 J-.238 E.01095
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08291
G1 X130.72 Y125.955 E-.0585
G1 X130.784 Y125.833 E-.0585
G1 X130.898 Y125.754 E-.0585
G1 X130.965 Y125.738 E-.02947
G1 X131.102 Y125.754 E-.0585
G1 X131.216 Y125.833 E-.0585
G1 X131.28 Y125.955 E-.05851
G1 X131.288 Y126.024 E-.02947
G1 X131.255 Y126.158 E-.0585
G1 X131.164 Y126.262 E-.05851
G1 X131.035 Y126.311 E-.0585
G1 X130.898 Y126.294 E-.0585
G1 X130.83 Y126.255 E-.03312
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.1 J-1.213 P1  F30000
G1 X128.869 Y126.093 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.852 Y126.061 E.00121
G3 X129.018 Y125.872 I.148 J-.037 E.00979
G1 X129.054 Y125.881 E.00122
G3 X128.903 Y126.141 I-.054 J.142 E.01754
G1 X128.515 Y126.279 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.934 Y125.48 I.483 J-.256 E.03258
G3 X129.07 Y125.481 I.066 J.277 E.00423
G3 X128.546 Y126.33 I-.072 J.542 E.0669
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07277
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.07 Y125.481 E-.05176
G1 X129.194 Y125.512 E-.04858
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.0348
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.278 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.224 Y126.348 E.00312
G3 X126.14 Y125.656 I-.222 J-.324 E.05339
G3 X126.347 Y126.206 I-.145 J.369 E.02196
G1 X126.325 Y126.232 E.00112
G1 X126.585 Y126.542 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.905 Y125.241 I-.59 J-.519 E.09368
G3 X126.108 Y125.245 I.095 J.414 E.00631
G3 X126.622 Y126.495 I-.114 J.778 E.05002
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09461
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01532
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-1.181 J.295 P1  F30000
G1 X126.167 Y129.783 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.035 Y129.733 I-.166 J.24 E.05624
G1 X126.104 Y129.75 E.00235
G3 X126.114 Y129.754 I-.104 J.273 E.00036
G1 X126.389 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.917 Y129.341 I-.393 J.561 E.11698
G3 X126.092 Y129.343 I.083 J.357 E.00544
G3 X126.338 Y129.428 I-.097 J.678 E.00805
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08559
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.398 J1.15 P1  F30000
G1 X128.749 Y129.66 Z10.2
G1 Z9.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.947 Y129.585 I.251 J.364 E.00657
G1 X129.053 Y129.585 E.00328
G3 X128.702 Y129.698 I-.053 J.439 E.07364
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06311
M73 P94 R0
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04056
G1 X129.157 Y129.611 E-.04048
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00804
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.26 J1.189 P1  F30000
G1 X130.913 Y129.898 Z10.2
G1 Z9.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X131.055 Y129.88 I.088 J.126 E.00406
G3 X131.088 Y130.151 I-.057 J.144 E.00912
G3 X130.871 Y129.941 I-.087 J-.127 E.01151
M204 S10000
; WIPE_START
G1 F24000
G1 X130.981 Y129.871 E-.10432
G1 X131.055 Y129.88 E-.05883
G1 X131.115 Y129.922 E-.05883
G1 X131.15 Y129.987 E-.05883
G1 X131.136 Y130.096 E-.08717
G1 X131.088 Y130.151 E-.05883
G1 X130.981 Y130.177 E-.08717
G1 X130.912 Y130.151 E-.05883
G1 X130.864 Y130.096 E-.05883
G1 X130.846 Y130.024 E-.05883
G1 X130.864 Y129.953 E-.05883
G1 X130.871 Y129.941 E-.01071
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.045 J1.216 P1  F30000
G1 X132.979 Y130.019 Z10.2
G1 Z9.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.008 Y130.004 E.00089
G1 X133.021 Y130.029 E.0008
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.008 Y130.004 E-.3696
G1 X133.021 Y130.029 E-.36908
G1 X133.02 Y130.03 E-.02131
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/55
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
G3 Z10.2 I1.05 J-.615 P1  F30000
G1 X130.786 Y126.214 Z10.2
G1 Z10
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.035 Y125.738 I.215 J-.191 E.02136
G1 X131.102 Y125.754 E.00214
G3 X130.83 Y126.255 I-.102 J.269 E.03013
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08275
G1 X130.72 Y125.955 E-.05841
G1 X130.784 Y125.833 E-.05841
G1 X130.836 Y125.787 E-.02942
G1 X130.898 Y125.754 E-.02942
G1 X131.035 Y125.738 E-.05841
G1 X131.102 Y125.754 E-.02942
G1 X131.164 Y125.787 E-.02942
G1 X131.255 Y125.89 E-.05841
G1 X131.28 Y125.955 E-.02942
G1 X131.28 Y126.093 E-.05841
G1 X131.255 Y126.158 E-.02942
G1 X131.164 Y126.262 E-.05841
G1 X131.035 Y126.311 E-.05841
G1 X130.965 Y126.311 E-.02942
G1 X130.898 Y126.294 E-.02942
G1 X130.83 Y126.255 E-.03303
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.1 J-1.213 P1  F30000
G1 X128.869 Y126.093 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.852 Y126.061 E.00121
G3 X129.018 Y125.872 I.148 J-.037 E.00979
G1 X129.054 Y125.881 E.00122
G3 X128.903 Y126.141 I-.054 J.142 E.01754
G1 X128.518 Y126.277 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.194 Y125.512 I.484 J-.253 E.04049
G3 X129.311 Y126.475 I-.202 J.513 E.03644
G3 X128.549 Y126.329 I-.309 J-.451 E.02652
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07271
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.194 Y125.512 E-.05019
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03482
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.112 J-1.212 P1  F30000
G1 X126.293 Y126.284 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.047 Y125.634 I-.293 J-.261 E.05338
G1 X126.14 Y125.656 E.00315
G3 X126.329 Y126.236 I-.139 J.367 E.02319
G1 X126.59 Y126.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.102 Y125.243 I-.59 J-.522 E.09973
G3 X126.788 Y126.017 I-.099 J.778 E.03465
G1 X126.788 Y126.017 E0
G3 X126.628 Y126.5 I-.788 J.008 E.01594
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09479
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.985 E-.01515
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.219 Y129.83 E.00232
G3 X126.167 Y130.266 I-.223 J.194 E.01638
G3 X126.104 Y129.75 I-.165 J-.242 E.03982
G1 X126.112 Y129.756 E.00034
G1 X126.39 Y129.459 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.482 Y130.477 I-.393 J.563 E.07133
G1 X125.482 Y130.477 E0
G3 X126.087 Y129.342 I.524 J-.45 E.05087
G3 X126.339 Y129.427 I-.09 J.681 E.00823
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08561
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.0437
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.398 J1.15 P1  F30000
G1 X128.749 Y129.661 Z10.4
G1 Z10
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.251 J.362 E.00985
G1 X129.157 Y129.611 E.00328
G3 X128.702 Y129.698 I-.156 J.412 E.07011
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06309
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.157 Y129.611 E-.04052
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.25 J1.191 P1  F30000
G1 X130.884 Y129.922 Z10.4
G1 Z10
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X130.979 Y129.872 I.114 J.102 E.00298
G1 X131.027 Y129.873 E.00132
G3 X130.853 Y129.974 I-.029 J.151 E.02035
M204 S10000
; WIPE_START
G1 F24000
G1 X130.979 Y129.872 E-.13015
G1 X131.027 Y129.873 E-.03878
G1 X131.088 Y129.897 E-.05237
G1 X131.136 Y129.953 E-.05926
G1 X131.15 Y130.061 E-.08781
G1 X131.088 Y130.151 E-.08781
G1 X130.981 Y130.177 E-.08781
G1 X130.885 Y130.126 E-.08781
G1 X130.846 Y130.024 E-.08781
G1 X130.853 Y129.974 E-.0404
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.025 J1.217 P1  F30000
G1 X132.979 Y130.019 Z10.4
G1 Z10
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.007 Y130.004 E.00087
G1 X133.02 Y130.032 E.00085
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.007 Y130.004 E-.38
G1 X133.02 Y130.032 E-.38
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/55
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
G3 Z10.4 I1.05 J-.615 P1  F30000
G1 X130.785 Y126.214 Z10.4
G1 Z10.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X131.102 Y125.754 I.216 J-.19 E.02344
G3 X131.164 Y126.262 I-.106 J.27 E.01919
G3 X130.83 Y126.255 I-.162 J-.238 E.01095
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08292
G1 X130.72 Y125.955 E-.0585
G1 X130.745 Y125.89 E-.02947
G1 X130.836 Y125.787 E-.0585
G1 X130.965 Y125.738 E-.05851
G1 X131.102 Y125.754 E-.0585
G1 X131.216 Y125.833 E-.0585
G1 X131.28 Y125.955 E-.0585
G1 X131.28 Y126.093 E-.0585
G1 X131.255 Y126.158 E-.02947
G1 X131.164 Y126.262 E-.0585
G1 X131.035 Y126.311 E-.0585
G1 X130.898 Y126.294 E-.05851
G1 X130.83 Y126.255 E-.03312
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.099 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.518 Y126.277 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.066 Y125.48 I.483 J-.255 E.03652
G1 X129.194 Y125.512 E.00406
G3 X128.549 Y126.329 I-.194 J.51 E.06296
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.0727
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.194 Y125.512 E-.05019
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03483
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.278 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.222 Y126.346 E.0031
G3 X125.952 Y125.634 I-.222 J-.323 E.04712
G1 X126.049 Y125.634 E.0032
G3 X126.346 Y126.206 I-.049 J.389 E.02512
G1 X126.324 Y126.232 E.00112
G1 X126.588 Y126.545 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.905 Y125.241 I-.589 J-.522 E.09348
G1 X126.097 Y125.242 E.00589
G3 X126.626 Y126.498 I-.097 J.781 E.05068
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09473
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01521
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.22 Y129.83 E.00233
G3 X126.035 Y129.733 I-.219 J.193 E.05389
G1 X126.104 Y129.75 E.00235
G1 X126.112 Y129.756 E.00034
G1 X126.391 Y129.458 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.083 Y129.341 I-.39 J.564 E.12221
G1 X126.244 Y129.38 E.0051
G3 X126.34 Y129.426 I-.244 J.641 E.00327
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08565
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04367
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.398 J1.15 P1  F30000
G1 X128.749 Y129.661 Z10.6
G1 Z10.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.251 J.362 E.00985
G1 X129.157 Y129.611 E.00328
G3 X128.702 Y129.698 I-.156 J.412 E.07011
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06309
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.157 Y129.611 E-.04052
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.25 J1.191 P1  F30000
G1 X130.884 Y129.922 Z10.6
G1 Z10.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X130.979 Y129.872 I.114 J.102 E.003
G1 X131.025 Y129.873 E.00126
M73 P95 R0
G3 X130.853 Y129.974 I-.027 J.151 E.0204
M204 S10000
; WIPE_START
G1 F24000
G1 X130.979 Y129.872 E-.13052
G1 X131.025 Y129.873 E-.03717
G1 X131.088 Y129.897 E-.05369
G1 X131.136 Y129.953 E-.0593
G1 X131.15 Y130.059 E-.08602
G1 X131.088 Y130.151 E-.08952
G1 X130.984 Y130.177 E-.08603
G1 X130.885 Y130.126 E-.08952
G1 X130.846 Y130.024 E-.08785
G1 X130.853 Y129.974 E-.04039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.025 J1.217 P1  F30000
G1 X132.979 Y130.019 Z10.6
G1 Z10.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.006 Y130.003 E.00086
G1 X133.021 Y130.029 E.00083
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.006 Y130.003 E-.36954
G1 X133.021 Y130.029 E-.36992
G1 X133.02 Y130.03 E-.02054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/55
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
G3 Z10.6 I1.05 J-.616 P1  F30000
G1 X130.779 Y126.209 Z10.6
G1 Z10.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.963 Y125.738 I.219 J-.186 E.019
G1 X131.043 Y125.74 E.00245
G3 X130.822 Y126.251 I-.045 J.284 E.03212
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.07941
G1 X130.712 Y126.024 E-.02943
G1 X130.72 Y125.957 E-.02856
G1 X130.784 Y125.833 E-.05924
G1 X130.836 Y125.787 E-.02943
G1 X130.963 Y125.738 E-.05756
G1 X131.043 Y125.74 E-.03377
G1 X131.164 Y125.787 E-.05486
G1 X131.255 Y125.89 E-.05843
G1 X131.287 Y126.016 E-.05486
G1 X131.28 Y126.093 E-.0329
G1 X131.251 Y126.165 E-.03289
G1 X131.164 Y126.262 E-.05486
G1 X131.035 Y126.311 E-.05842
G1 X130.965 Y126.311 E-.02943
G1 X130.838 Y126.263 E-.05756
G1 X130.822 Y126.251 E-.00841
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.097 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.518 Y126.277 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.066 Y125.48 I.483 J-.255 E.03652
G1 X129.194 Y125.512 E.00406
G3 X128.549 Y126.329 I-.194 J.51 E.06296
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.0727
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.194 Y125.512 E-.05019
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03483
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.278 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.224 Y126.348 E.00312
G3 X126.14 Y125.656 I-.222 J-.324 E.05339
G3 X126.347 Y126.206 I-.145 J.369 E.02196
G1 X126.325 Y126.232 E.00113
G1 X126.589 Y126.546 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.448 Y126.673 I-.599 J-.52 E.00585
G3 X126.28 Y125.287 I-.444 J-.649 E.09909
G3 X126.626 Y126.499 I-.29 J.739 E.04475
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09472
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01522
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.22 Y129.83 E.00233
G3 X126.035 Y129.733 I-.219 J.193 E.05389
G1 X126.104 Y129.75 E.00235
G1 X126.112 Y129.756 E.00034
G1 X126.391 Y129.458 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.083 Y129.341 I-.39 J.564 E.12221
G1 X126.244 Y129.38 E.0051
G3 X126.34 Y129.426 I-.244 J.641 E.00327
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08565
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04367
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.398 J1.15 P1  F30000
G1 X128.749 Y129.661 Z10.8
G1 Z10.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.053 Y129.585 I.251 J.362 E.00985
G1 X129.157 Y129.611 E.00328
G3 X128.702 Y129.698 I-.156 J.412 E.07011
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06309
G1 X128.947 Y129.585 E-.04052
G1 X129.053 Y129.585 E-.04052
G1 X129.157 Y129.611 E-.04052
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.429 Y130.13 E-.04052
G1 X129.392 Y130.23 E-.04052
G1 X129.331 Y130.317 E-.04052
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.25 J1.191 P1  F30000
G1 X130.884 Y129.922 Z10.8
G1 Z10.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X130.98 Y129.872 I.114 J.102 E.00301
G1 X131.024 Y129.872 E.00121
G3 X130.854 Y129.975 I-.025 J.151 E.02045
M204 S10000
; WIPE_START
G1 F24000
G1 X130.98 Y129.872 E-.13079
G1 X131.024 Y129.872 E-.03554
G1 X131.088 Y129.897 E-.05495
G1 X131.136 Y129.953 E-.05927
G1 X131.15 Y130.061 E-.08783
G1 X131.088 Y130.151 E-.08783
G1 X130.981 Y130.177 E-.08782
G1 X130.885 Y130.126 E-.08783
G1 X130.846 Y130.024 E-.08782
G1 X130.854 Y129.975 E-.04032
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-.025 J1.217 P1  F30000
G1 X132.979 Y130.019 Z10.8
G1 Z10.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.005 Y130.003 E.00084
G1 X133.021 Y130.028 E.0008
G1 X133.019 Y130.029 E.00008
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X133.005 Y130.003 E-.36271
G1 X133.021 Y130.028 E-.36309
G1 X133.019 Y130.029 E-.03421
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/55
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
G3 Z10.8 I1.05 J-.615 P1  F30000
G1 X130.784 Y126.215 Z10.8
G1 Z10.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.964 Y125.738 I.214 J-.192 E.01926
G1 X131.041 Y125.739 E.00236
G3 X130.829 Y126.255 I-.042 J.284 E.03198
M204 S10000
; WIPE_START
G1 F24000
G1 X130.745 Y126.158 E-.0544
G1 X130.712 Y126.024 E-.05837
G1 X130.72 Y125.955 E-.0294
G1 X130.784 Y125.833 E-.05836
G1 X130.836 Y125.787 E-.0294
G1 X130.964 Y125.738 E-.05773
G1 X131.041 Y125.739 E-.03249
G1 X131.164 Y125.787 E-.05583
G1 X131.255 Y125.89 E-.05837
G1 X131.28 Y125.955 E-.0294
G1 X131.28 Y126.093 E-.05836
G1 X131.255 Y126.158 E-.02939
G1 X131.164 Y126.262 E-.05837
G1 X131.035 Y126.311 E-.05836
G1 X130.965 Y126.311 E-.0294
G1 X130.836 Y126.262 E-.05836
G1 X130.829 Y126.255 E-.00401
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.099 J-1.213 P1  F30000
G1 X128.865 Y126.095 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.018 Y125.872 I.135 J-.071 E.011
G1 X129.054 Y125.881 E.00122
G3 X128.904 Y126.142 I-.054 J.142 E.01748
G1 X128.518 Y126.277 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.066 Y125.48 I.483 J-.255 E.03652
G1 X129.194 Y125.512 E.00406
G3 X128.549 Y126.329 I-.194 J.51 E.06296
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.0727
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.934 Y125.48 E-.05019
G1 X129.066 Y125.48 E-.05019
G1 X129.194 Y125.512 E-.05019
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03483
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-.109 J-1.212 P1  F30000
G1 X126.286 Y126.278 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.222 Y126.346 E.0031
G3 X126.047 Y125.634 I-.222 J-.323 E.05025
G1 X126.14 Y125.656 E.00315
G3 X126.347 Y126.206 I-.139 J.367 E.02204
G1 X126.325 Y126.232 E.00113
G1 X126.589 Y126.546 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.448 Y126.673 I-.599 J-.52 E.00585
G3 X126.28 Y125.287 I-.444 J-.649 E.09909
G3 X126.626 Y126.499 I-.29 J.739 E.04475
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09472
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01522
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-1.181 J.293 P1  F30000
G1 X126.162 Y129.79 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.22 Y129.83 E.00233
G3 X126.035 Y129.733 I-.219 J.193 E.05389
G1 X126.104 Y129.75 E.00235
G1 X126.112 Y129.756 E.00034
G1 X126.391 Y129.458 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X126.083 Y129.341 I-.39 J.564 E.12221
G1 X126.244 Y129.38 E.0051
G3 X126.34 Y129.426 I-.244 J.641 E.00327
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08565
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04367
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.399 J1.15 P1  F30000
G1 X128.748 Y129.659 Z11
G1 Z10.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.945 Y129.585 I.249 J.363 E.00653
G1 X129.061 Y129.587 E.00357
G3 X128.701 Y129.697 I-.064 J.436 E.07308
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06314
G1 X128.945 Y129.585 E-.03995
G1 X129.061 Y129.587 E-.04416
G1 X129.157 Y129.611 E-.03735
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.441 Y130.016 E-.03735
G1 X129.429 Y130.13 E-.04359
G1 X129.387 Y130.237 E-.04359
G1 X129.331 Y130.317 E-.03735
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.732 Y130.374 E-.00833
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.25 J1.191 P1  F30000
G1 X130.884 Y129.922 Z11
G1 Z10.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X130.98 Y129.871 I.115 J.102 E.00302
G1 X131.022 Y129.872 E.00115
G3 X130.854 Y129.975 I-.023 J.152 E.0205
M204 S10000
; WIPE_START
G1 F24000
G1 X130.98 Y129.871 E-.13117
G1 X131.022 Y129.872 E-.03393
G1 X131.088 Y129.897 E-.05623
G1 X131.136 Y129.953 E-.0593
G1 X131.15 Y130.061 E-.08786
G1 X131.089 Y130.15 E-.0868
G1 X130.983 Y130.177 E-.08777
G1 X130.885 Y130.126 E-.08883
G1 X130.846 Y130.024 E-.08786
G1 X130.854 Y129.975 E-.04026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-.025 J1.217 P1  F30000
G1 X132.979 Y130.019 Z11
G1 Z10.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.004 Y130.003 E.00083
G1 X133.021 Y130.031 E.00088
G1 X133.02 Y130.031 E.00002
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.004 Y130.003 E-.37683
G1 X133.021 Y130.031 E-.37648
G1 X133.02 Y130.031 E-.00669
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/55
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
G3 Z11 I1.05 J-.615 P1  F30000
G1 X130.782 Y126.212 Z11
G1 Z10.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
M73 P96 R0
G3 X130.964 Y125.738 I.216 J-.189 E.01914
G1 X131.038 Y125.739 E.00227
G3 X130.826 Y126.253 I-.039 J.285 E.0322
M204 S10000
; WIPE_START
G1 F24000
G1 X130.72 Y126.093 E-.08127
G1 X130.712 Y126.024 E-.02942
G1 X130.745 Y125.89 E-.05842
G1 X130.784 Y125.833 E-.02943
G1 X130.836 Y125.787 E-.02943
G1 X130.964 Y125.738 E-.05803
G1 X131.038 Y125.739 E-.03128
G1 X131.164 Y125.787 E-.05691
G1 X131.255 Y125.89 E-.05842
G1 X131.28 Y125.955 E-.02943
G1 X131.28 Y126.093 E-.05842
G1 X131.255 Y126.158 E-.02942
G1 X131.165 Y126.261 E-.05804
G1 X131.099 Y126.295 E-.03128
G1 X130.965 Y126.311 E-.05691
G1 X130.837 Y126.262 E-.05803
G1 X130.826 Y126.253 E-.00586
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.08 J-1.214 P1  F30000
G1 X128.886 Y126.125 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X128.979 Y125.873 I.113 J-.101 E.01093
G1 X129.023 Y125.873 E.00144
G3 X128.935 Y126.162 I-.023 J.15 E.0173
G1 X128.516 Y126.278 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.933 Y125.481 I.482 J-.256 E.03253
G1 X129.072 Y125.482 E.00426
G3 X128.547 Y126.33 I-.074 J.541 E.0667
M204 S10000
; WIPE_START
G1 F24000
G1 X128.468 Y126.155 E-.07274
G1 X128.452 Y126.024 E-.05019
G1 X128.468 Y125.893 E-.05019
G1 X128.515 Y125.77 E-.05019
G1 X128.59 Y125.661 E-.05019
G1 X128.689 Y125.573 E-.05019
G1 X128.806 Y125.512 E-.05019
G1 X128.933 Y125.481 E-.04984
G1 X129.072 Y125.482 E-.05273
G1 X129.194 Y125.512 E-.04793
G1 X129.311 Y125.573 E-.05019
G1 X129.41 Y125.661 E-.05019
G1 X129.485 Y125.77 E-.05019
G1 X129.532 Y125.893 E-.05019
G1 X129.543 Y125.984 E-.03486
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.109 J-1.212 P1  F30000
G1 X126.287 Y126.277 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.224 Y126.344 E.00304
G3 X125.95 Y125.634 I-.225 J-.321 E.04718
G1 X126.054 Y125.635 E.00344
G3 X126.342 Y126.211 I-.055 J.388 E.02508
G1 X126.325 Y126.231 E.00088
G1 X126.585 Y126.542 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.904 Y125.242 I-.588 J-.521 E.09337
G1 X126.103 Y125.243 E.00611
G3 X126.623 Y126.496 I-.106 J.778 E.05028
M204 S10000
; WIPE_START
G1 F24000
G1 X126.449 Y126.672 E-.09429
G1 X126.272 Y126.763 E-.07557
G1 X126.095 Y126.807 E-.06914
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07223
G1 X125.41 Y126.547 E-.07223
G1 X125.302 Y126.391 E-.07223
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.0154
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-1.181 J.295 P1  F30000
G1 X126.166 Y129.784 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.962 Y129.733 I-.167 J.24 E.05378
G1 X126.041 Y129.734 E.00261
G3 X126.113 Y129.754 I-.042 J.289 E.00251
G1 X126.39 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.916 Y129.341 I-.393 J.562 E.11705
G1 X126.09 Y129.342 E.00534
G3 X126.339 Y129.427 I-.093 J.679 E.00813
M204 S10000
; WIPE_START
G1 F24000
G1 X126.515 Y129.568 E-.08561
G1 X126.61 Y129.704 E-.06307
G1 X126.668 Y129.859 E-.06307
G1 X126.688 Y130.024 E-.06307
G1 X126.668 Y130.189 E-.06307
G1 X126.61 Y130.344 E-.06307
G1 X126.515 Y130.481 E-.06307
G1 X126.391 Y130.591 E-.06307
G1 X126.244 Y130.668 E-.06307
G1 X126.083 Y130.708 E-.06307
G1 X125.917 Y130.708 E-.06307
G1 X125.805 Y130.68 E-.04371
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.399 J1.15 P1  F30000
G1 X128.748 Y129.66 Z11.2
G1 Z10.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.946 Y129.585 I.25 J.363 E.00654
G1 X129.058 Y129.586 E.00345
G3 X128.701 Y129.697 I-.06 J.436 E.0732
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06313
G1 X128.946 Y129.585 E-.04017
G1 X129.058 Y129.586 E-.0427
G1 X129.157 Y129.611 E-.03863
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.019 E-.03863
G1 X129.429 Y130.131 E-.0427
G1 X129.392 Y130.23 E-.04017
G1 X129.331 Y130.317 E-.04052
G1 X129.252 Y130.388 E-.04017
G1 X129.152 Y130.439 E-.0427
G1 X129.053 Y130.463 E-.03862
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00822
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.25 J1.191 P1  F30000
G1 X130.885 Y129.922 Z11.2
G1 Z10.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X130.981 Y129.871 I.115 J.102 E.00303
G1 X131.021 Y129.872 E.0011
G3 X130.854 Y129.975 I-.021 J.152 E.02055
M204 S10000
; WIPE_START
G1 F24000
G1 X130.981 Y129.871 E-.13149
G1 X131.021 Y129.872 E-.0323
G1 X131.088 Y129.897 E-.05747
G1 X131.136 Y129.953 E-.05929
G1 X131.15 Y130.061 E-.08785
G1 X131.088 Y130.151 E-.08786
G1 X130.981 Y130.177 E-.08785
G1 X130.885 Y130.126 E-.08786
G1 X130.846 Y130.024 E-.08785
G1 X130.854 Y129.975 E-.04017
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.025 J1.217 P1  F30000
G1 X132.979 Y130.019 Z11.2
G1 Z10.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.004 Y130.003 E.00081
G1 X133.021 Y130.029 E.00087
G1 X133.02 Y130.03 E.00005
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.004 Y130.003 E-.37072
G1 X133.021 Y130.029 E-.36978
G1 X133.02 Y130.03 E-.0195
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/55
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
G3 Z11.2 I1.05 J-.615 P1  F30000
G1 X130.785 Y126.214 Z11.2
G1 Z11
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X130.965 Y125.738 I.214 J-.191 E.01924
G1 X131.036 Y125.738 E.00218
G3 X130.83 Y126.255 I-.036 J.285 E.03221
M204 S10000
; WIPE_START
G1 F24000
G1 X130.745 Y126.158 E-.05438
G1 X130.712 Y126.024 E-.05836
G1 X130.72 Y125.955 E-.02927
G1 X130.784 Y125.833 E-.05849
G1 X130.836 Y125.787 E-.0294
G1 X130.965 Y125.738 E-.05823
G1 X131.036 Y125.738 E-.03002
G1 X131.164 Y125.787 E-.05786
G1 X131.255 Y125.89 E-.05837
G1 X131.288 Y126.024 E-.05836
G1 X131.28 Y126.093 E-.0294
G1 X131.255 Y126.158 E-.0294
G1 X131.164 Y126.261 E-.05823
G1 X131.101 Y126.294 E-.03002
G1 X130.965 Y126.311 E-.05786
G1 X130.836 Y126.262 E-.05837
G1 X130.83 Y126.255 E-.00399
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.012 J-1.217 P1  F30000
G1 X128.517 Y126.278 Z11.4
G1 Z11
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X128.934 Y125.48 I.482 J-.255 E.0325
G1 X129.068 Y125.481 E.00413
G3 X128.548 Y126.329 I-.069 J.541 E.0669
M204 S10000
G1 X128.691 Y125.891 F30000
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X129.134 Y126.334 E.01926
M204 S10000
G1 X129.347 Y126.112 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.32953
G1 F1200
G2 X128.896 Y125.684 I-1.173 J.786 E.01464
; WIPE_START
G1 F24000
G1 X129.158 Y125.884 E-.40095
G1 X129.347 Y126.112 E-.35905
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.188 J-1.202 P1  F30000
G1 X126.586 Y126.543 Z11.4
G1 Z11
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.905 Y125.242 I-.587 J-.522 E.0933
G1 X126.098 Y125.242 E.00593
G3 X126.624 Y126.497 I-.099 J.779 E.05056
M204 S10000
; WIPE_START
G1 F24000
G1 X126.448 Y126.673 E-.09468
G1 X126.28 Y126.761 E-.07223
G1 X126.095 Y126.807 E-.07223
G1 X125.905 Y126.807 E-.07223
G1 X125.72 Y126.761 E-.07223
G1 X125.552 Y126.673 E-.07211
G1 X125.408 Y126.545 E-.07334
G1 X125.302 Y126.391 E-.0712
G1 X125.234 Y126.213 E-.07223
G1 X125.212 Y126.024 E-.07223
G1 X125.216 Y125.984 E-.01529
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.841 J.88 P1  F30000
G1 X125.677 Y125.544 Z11.4
G1 Z11
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X126.478 Y126.344 E.03479
G1 X126.174 Y126.574
G1 X125.451 Y125.85 E.03144
M204 S10000
G1 X125.595 Y126.458 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.105284
G1 F1200
G1 X125.428 Y126.116 E.00194
G1 X125.899 Y126.608 F30000
; LINE_WIDTH: 0.166625
G1 F1200
G3 X125.416 Y126.146 I.932 J-1.456 E.00678
G1 X125.556 Y125.69 F30000
; LINE_WIDTH: 0.110309
G1 F1200
G2 X125.464 Y125.811 I.456 J.44 E.00084
; WIPE_START
G1 F24000
G1 X125.556 Y125.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.387 J1.154 P1  F30000
G1 X126.596 Y126.038 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.327659
G1 F1200
G2 X125.956 Y125.43 I-1.732 J1.183 E.02065
; WIPE_START
G1 F24000
G1 X126.336 Y125.726 E-.4124
G1 X126.596 Y126.038 E-.3476
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.215 J-.073 P1  F30000
M73 P97 R0
G1 X126.39 Y129.459 Z11.4
G1 Z11
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.917 Y129.341 I-.391 J.563 E.11708
G1 X126.085 Y129.341 E.00518
G3 X126.34 Y129.426 I-.086 J.68 E.0083
M204 S10000
G1 X126.474 Y130.073 F30000
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X125.949 Y129.548 E.0228
G1 X125.613 Y129.746
G1 X126.28 Y130.412 E.02895
M204 S10000
G1 X126.024 Y130.519 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.259499
G1 F1200
G3 X125.502 Y130.022 I.904 J-1.474 E.01281
; WIPE_START
G1 F24000
G1 X125.713 Y130.276 E-.34607
G1 X126.024 Y130.519 E-.41393
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.366 J1.161 P1  F30000
G1 X128.749 Y129.66 Z11.4
G1 Z11
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X128.946 Y129.585 I.251 J.362 E.00656
G1 X129.055 Y129.585 E.00334
G3 X128.702 Y129.698 I-.056 J.437 E.07332
M204 S10000
; WIPE_START
G1 F24000
G1 X128.843 Y129.611 E-.06311
G1 X128.946 Y129.585 E-.0404
G1 X129.055 Y129.585 E-.04125
G1 X129.157 Y129.611 E-.03989
G1 X129.251 Y129.66 E-.04052
G1 X129.331 Y129.731 E-.04052
G1 X129.392 Y129.819 E-.04052
G1 X129.429 Y129.918 E-.04052
G1 X129.442 Y130.024 E-.04052
G1 X129.43 Y130.13 E-.0404
G1 X129.391 Y130.231 E-.04125
G1 X129.331 Y130.317 E-.03989
G1 X129.251 Y130.388 E-.04052
G1 X129.157 Y130.438 E-.04052
G1 X129.053 Y130.463 E-.04052
G1 X128.947 Y130.463 E-.04052
G1 X128.843 Y130.438 E-.04052
G1 X128.749 Y130.388 E-.04052
G1 X128.733 Y130.374 E-.00809
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.25 J1.191 P1  F30000
G1 X130.885 Y129.922 Z11.4
G1 Z11
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X130.981 Y129.871 I.115 J.102 E.00305
G1 X131.019 Y129.871 E.00104
G3 X130.854 Y129.975 I-.02 J.152 E.0206
M204 S10000
; WIPE_START
G1 F24000
G1 X130.981 Y129.871 E-.13186
G1 X131.019 Y129.871 E-.03069
G1 X131.088 Y129.897 E-.05869
G1 X131.136 Y129.953 E-.05931
G1 X131.15 Y130.061 E-.08787
G1 X131.088 Y130.151 E-.08788
G1 X130.981 Y130.177 E-.08788
G1 X130.885 Y130.126 E-.08788
G1 X130.846 Y130.024 E-.08788
G1 X130.854 Y129.975 E-.04007
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.025 J1.217 P1  F30000
G1 X132.979 Y130.019 Z11.4
G1 Z11
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X133.003 Y130.003 E.0008
G1 X133.021 Y130.03 E.00089
G1 X133.02 Y130.03 E.00003
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X133.003 Y130.003 E-.37318
G1 X133.021 Y130.03 E-.37279
G1 X133.02 Y130.03 E-.01403
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
G1 Z11.5 F900 ; lower z a little
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

    G1 Z111 F600
    G1 Z109

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

