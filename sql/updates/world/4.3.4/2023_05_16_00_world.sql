/*
	[Fix/Quest]: Proving pit (24768).
    [Fix/DB]: Remove duplicate entry for gossip option in npc 39062.
*/

DELETE FROM `gossip_menu_option` WHERE `MenuId`=10974 AND `OptionIndex`=1;
UPDATE `conditions` SET `SourceEntry`= 0  WHERE `SourceTypeorReferenceId`=15 and `SourceGroup`=10974 and `SourceEntry`=1;
UPDATE `gossip_menu_option` SET `OptionType`=1, `OptionNpcflag`=1 WHERE `MenuId`=10974 AND `OptionIndex`=0;

-- Darkspear Jailor
SET @ENTRY := 39062;
UPDATE `creature` SET  `zoneId`=6453, `areaId`=4865, `modelid`=31289, `curhealth`=1110 WHERE `id`=@ENTRY;
UPDATE `creature_template` SET `MovementType`=2 WHERE `entry`=@ENTRY;

-- Darkspear Jailor SAI
SET @GUID := -309082;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100+01 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,1,62,0,100,0,10974,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Darkspear Jailor - On Gossip Option 0 Selected - Say Line 0"),
(@GUID,0,1,2,61,0,100,0,0,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Darkspear Jailor - On Gossip Option 0 Selected - Quest Credit ''"),
(@GUID,0,2,3,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darkspear Jailor - On Gossip Option 0 Selected - Say Line 0"),
(@GUID,0,3,0,61,0,100,0,0,0,0,0,80,@ENTRY*100+01,0,2,0,0,0,1,0,0,0,0,0,0,0,"Darkspear Jailor - On Gossip Option 0 Selected - Run Script"),
(@GUID,0,4,5,40,0,100,0,3,@ENTRY*10+01,0,0,9,0,0,0,0,0,0,15,201968,10,0,0,0,0,0,"Darkspear Jailor - On Waypoint 3 Reached - Activate Gameobject"),
(@GUID,0,5,6,61,0,100,0,0,0,0,0,54,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darkspear Jailor - On Waypoint 3 Reached - Pause Waypoint"),
(@GUID,0,6,0,61,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darkspear Jailor - On Waypoint 3 Reached - Set Run Off"),
(@ENTRY*100+01,9,0,0,0,0,100,0,0,0,0,0,53,1,@ENTRY*10+01,0,0,0,0,1,0,0,0,0,0,0,0,"Darkspear Jailor - On Script - Start Waypoint");

-- Darkspear Jailor SAI
SET @GUID := -309155;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100+00 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,1,62,0,100,0,10974,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Darkspear Jailor - On Gossip Option 0 Selected - Say Line 0"),
(@GUID,0,1,2,61,0,100,0,0,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Darkspear Jailor - On Gossip Option 0 Selected - Quest Credit ''"),
(@GUID,0,2,3,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darkspear Jailor - On Gossip Option 0 Selected - Say Line 0"),
(@GUID,0,3,0,61,0,100,0,0,0,0,0,80,@ENTRY*100+00,0,2,0,0,0,1,0,0,0,0,0,0,0,"Darkspear Jailor - On Gossip Option 0 Selected - Run Script"),
(@GUID,0,4,5,40,0,100,0,3,@ENTRY*10+00,0,0,9,0,0,0,0,0,0,15,201968,10,0,0,0,0,0,"Darkspear Jailor - On Waypoint 3 Reached - Activate Gameobject"),
(@GUID,0,5,6,61,0,100,0,0,0,0,0,54,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darkspear Jailor - On Waypoint 3 Reached - Pause Waypoint"),
(@GUID,0,6,0,61,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darkspear Jailor - On Waypoint 3 Reached - Set Run Off"),
(@ENTRY*100+00,9,0,0,0,0,100,0,0,0,0,0,53,1,@ENTRY*10+00,0,0,0,0,1,0,0,0,0,0,0,0,"Darkspear Jailor - On Script - Start Waypoint");

DELETE FROM `creature_text` WHERE `CreatureID`=@ENTRY;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'Get in the pit and show us your stuff, $Gboy:girl;.', 12, 0, 100, 0, 0, 0, 37886, 0, '');

DELETE FROM `waypoints` WHERE `entry`=@ENTRY*10+00;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY*10+00, 1, -1143.20, -5429.86, 13.8643, 'Point 1'),
(@ENTRY*10+00, 2, -1137.68, -5429.41, 13.7173, 'Point 2'),
(@ENTRY*10+00, 3, -1136.07, -5416.94, 13.2693, 'Point 3'),
(@ENTRY*10+00, 4, -1137.68, -5429.41, 13.7173, 'Point 4'),
(@ENTRY*10+00, 5, -1143.20, -5429.86, 13.8643, 'Point 5');

DELETE FROM `waypoints` WHERE `entry`=@ENTRY*10+01;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY*10+01, 1, -1159.23, -5530.07, 11.9526, 'Point 1'),
(@ENTRY*10+01, 2, -1159.07, -5520.38, 12.0749, 'Point 2'),
(@ENTRY*10+01, 3, -1153.49, -5518.96, 11.9982, 'Point 3'),
(@ENTRY*10+01, 4, -1158.26, -5519.84, 12.0920, 'Point 4'),
(@ENTRY*10+01, 5, -1159.07, -5529.94, 11.9540, 'Point 5');

-- Darkspear Cage
SET @ENTRY := 201968;
UPDATE `gameobject_template` SET `Data0`=920, `Data3`=600000, `ScriptName`='SmartGameObjectAI' WHERE `entry`=@ENTRY;
UPDATE `gameobject` SET  `zoneId`=6453, `areaId`=4865 WHERE `id`=@ENTRY;

-- Darkspear Cage SAI
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,70,0,100,0,2,0,0,0,45,1,1,0,0,0,0,11,38142,10,0,0,0,0,0,"Darkspear Cage - On Gameobject State Changed - Set Data 1 1");

-- Captive Spitescale Scout
SET @ENTRY := 38142;
UPDATE `creature_template` SET `spell1`=15089 WHERE `entry`=@ENTRY;
UPDATE `creature` SET `zoneId`=6453, `areaId`=4865, `spawntimesecs`=60 WHERE `id`=@ENTRY;

-- Captive Spitescale Scout SAI
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,2000,10000,11000,11,15089,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frost Cleave'),
(@ENTRY,0,1,2,38,0,100,0,1,1,0,0,114,0,0,0,0,0,0,1,0,0,0,0,10,0,0,"Captive Spitescale Scout - On Data Set 1 1"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captive Spitescale Scout - On Data Set 0 0 - Say Line 0"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captive Spitescale Scout - Set Hostile"),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"Captive Spitescale Scout - Start Attack"),
(@ENTRY,0,5,14,11,0,100,0,0,0,0,0,99,1,0,0,0,0,0,13,201968,0,30,0,0,0,0,"Captive Spitescale Scout - On Respawn - Set Lootstate Ready"),
(@ENTRY,0,14,0,61,0,100,0,0,0,0,0,9,0,0,0,0,0,0,14,218472,0,0,0,0,0,0,"Captive Spitescale Scout - On Respawn - Set Lootstate Ready"),
(@ENTRY,0,6,0,6,0,100,0,0,0,0,0,45,2,2,0,0,0,0,11,38242,20,0,0,0,0,0,"Captive Spitescale Scout - On Just Died - Set Data 2 2"),
(@ENTRY,0,7,0,6,0,100,0,0,0,0,0,45,3,3,0,0,0,0,11,38247,20,0,0,0,0,0,"Captive Spitescale Scout - On Just Died - Set Data 3 3"),
(@ENTRY,0,8,0,6,0,100,0,0,0,0,0,45,4,4,0,0,0,0,11,38246,20,0,0,0,0,0,"Captive Spitescale Scout - On Just Died - Set Data 4 4"),
(@ENTRY,0,9,0,6,0,100,0,0,0,0,0,45,5,5,0,0,0,0,11,38244,20,0,0,0,0,0,"Captive Spitescale Scout - On Just Died - Set Data 5 5"),
(@ENTRY,0,10,0,6,0,100,0,0,0,0,0,45,6,6,0,0,0,0,11,38245,20,0,0,0,0,0,"Captive Spitescale Scout - On Just Died - Set Data 6 6"),
(@ENTRY,0,11,0,6,0,100,0,0,0,0,0,45,8,8,0,0,0,0,11,38037,20,0,0,0,0,0,"Captive Spitescale Scout - On Just Died - Set Data 8 8"),
(@ENTRY,0,12,0,6,0,100,0,0,0,0,0,45,9,9,0,0,0,0,11,38243,20,0,0,0,0,0,"Captive Spitescale Scout - On Just Died - Set Data 9 9"),
(@ENTRY,0,13,0,6,0,100,0,0,0,0,0,45,10,10,0,0,0,0,11,42618,20,0,0,0,0,0,"Captive Spitescale Scout - On Just Died - Set Data 10 10"),
(@ENTRY,0,15,16,6,0,100,0,0,0,0,0,27,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captive Spitescale Scout - On Just Died - Stop combat"),
(@ENTRY,0,16,0,61,0,100,0,0,0,0,0,82,256,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captive Spitescale Scout - On Just Died - Set Flag IMMUNE_TO_PC(256)");

DELETE FROM `creature_text` WHERE `CreatureID`=@ENTRY;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'The Sssea Witch will kill you all.', 12, 0, 100, 0, 0, 0, 39090, 0, 'Captive Spitescale Scout');

-- Nekali SAI
SET @ENTRY := 38242;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,2,2,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nekali - On Data Set 2 2 - Say Line 0"),
(@ENTRY,0,1,0,20,0,100,0,24762,0,0,0,53,0,@ENTRY*10+01,0,0,0,0,1,0,0,0,0,0,0,0,"Nekali - On Quest '' Finished - Start Waypoint"),
(@ENTRY,0,2,0,19,0,100,0,24762,0,0,0,53,0,@ENTRY*10+00,0,0,0,0,1,0,0,0,0,0,0,0,"Nekali - On Quest '' Taken - Start Waypoint");

-- Nekali Text
DELETE FROM `creature_text` WHERE `CreatureID`=@ENTRY;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'Well done, $n!', 12, 0, 100, 0, 0, 0, 37898, 0, 'Nekali');

-- Nekali Waypoints
DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY*10+00,@ENTRY*10+01);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY*10+00, 1, -1160.19, -5396.27, 12.2370, 'Point 1'),
(@ENTRY*10+00, 2, -1150.25, -5407.53, 13.2418, 'Point 2'),
(@ENTRY*10+01, 1, -1150.25, -5407.53, 13.2418, 'Point 1'),
(@ENTRY*10+01, 2, -1160.19, -5396.27, 12.2370, 'Point 2');

DELETE FROM `creature_queststarter` WHERE `id`=@ENTRY AND `quest`=24760;
DELETE FROM `creature_questender` WHERE `id`=@ENTRY AND `quest`=24760;

-- Ortezza SAI
SET @ENTRY := 38247;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,3,3,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ortezza - On Data Set 3 3 - Say Line 0"),
(@ENTRY,0,1,0,20,0,100,0,24780,0,0,0,53,0,@ENTRY*10+01,0,0,0,0,1,0,0,0,0,0,0,0,"Ortezza - On Quest '' Finished - Start Waypoint"),
(@ENTRY,0,2,0,19,0,100,0,24780,0,0,0,53,0,@ENTRY*10+00,0,0,0,0,1,0,0,0,0,0,0,0,"Ortezza - On Quest '' Taken - Start Waypoint");

-- Ortezza Text
DELETE FROM `creature_text` WHERE `CreatureID`=@ENTRY;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'Well done, $n!', 12, 0, 100, 0, 0, 0, 37898, 0, 'Ortezza');

-- Ortezza Waypoints
DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY*10+00,@ENTRY*10+01);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY*10+00, 1, -1128.28, -5510.01, 11.9823, 'Point 1'),
(@ENTRY*10+00, 2, -1136.21, -5526.92, 11.9810, 'Point 2'),
(@ENTRY*10+01, 1, -1136.21, -5526.92, 11.9810, 'Point 1'),
(@ENTRY*10+01, 2, -1128.28, -5510.01, 11.9823, 'Point 2');

-- Soratha SAI
SET @ENTRY := 38246;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,4,4,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Soratha - On Data Set 4 4 - Say Line 0"),
(@ENTRY,0,1,0,20,0,100,0,24754,0,0,0,53,0,@ENTRY*10+01,0,0,0,0,1,0,0,0,0,0,0,0,"Soratha - On Quest '' Finished - Start Waypoint"),
(@ENTRY,0,2,0,19,0,100,0,24754,0,0,0,53,0,@ENTRY*10+00,0,0,0,0,1,0,0,0,0,0,0,0,"Soratha - On Quest '' Taken - Start Waypoint");

-- Soratha Text
DELETE FROM `creature_text` WHERE `CreatureID`=@ENTRY;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'Well done, $n!', 12, 0, 100, 0, 0, 0, 37898, 0, 'Soratha');

-- Soratha Waypoints
DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY*10+00,@ENTRY*10+01);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY*10+00, 1, -1152.24, -5569.91, 11.9353, 'Point 1'),
(@ENTRY*10+00, 2, -1146.48, -5541.75, 12.4997, 'Point 2'),
(@ENTRY*10+01, 1, -1146.48, -5541.75, 12.4997, 'Point 1'),
(@ENTRY*10+01, 2, -1152.24, -5569.91, 11.9353, 'Point 2');

-- Legati SAI
SET @ENTRY := 38244;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,5,5,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Legati - On Data Set 5 5 - Say Line 0"),
(@ENTRY,0,1,0,20,0,100,0,24774,0,0,0,53,0,@ENTRY*10+01,0,0,0,0,1,0,0,0,0,0,0,0,"Legati - On Quest '' Finished - Start Waypoint"),
(@ENTRY,0,2,0,19,0,100,0,24774,0,0,0,53,0,@ENTRY*10+00,0,0,0,0,1,0,0,0,0,0,0,0,"Legati - On Quest '' Taken - Start Waypoint");

-- Legati Text
DELETE FROM `creature_text` WHERE `CreatureID`=@ENTRY;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'Well done, $n!', 12, 0, 100, 0, 0, 0, 37898, 0, 'Legati');

-- Legati Waypoints
DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY*10+00,@ENTRY*10+01);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY*10+00, 1, -1126.19, -5446.60, 11.9830, 'Point 1'),
(@ENTRY*10+00, 2, -1145.74, -5429.52, 13.6803, 'Point 2'),
(@ENTRY*10+01, 1, -1145.74, -5429.52, 13.6803, 'Point 1'),
(@ENTRY*10+01, 2, -1126.19, -5446.60, 11.9830, 'Point 2');

-- Tunari SAI
SET @ENTRY := 38245;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,6,6,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tunari - On Data Set 6 6 - Say Line 0"),
(@ENTRY,0,1,0,20,0,100,0,24786,0,0,0,53,0,@ENTRY*10+01,0,0,0,0,1,0,0,0,0,0,0,0,"Tunari - On Quest '' Finished - Start Waypoint"),
(@ENTRY,0,2,0,19,0,100,0,24786,0,0,0,53,0,@ENTRY*10+00,0,0,0,0,1,0,0,0,0,0,0,0,"Tunari - On Quest '' Taken - Start Waypoint");

-- Tunari Text
DELETE FROM `creature_text` WHERE `CreatureID`=@ENTRY;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'Well done, $n!', 12, 0, 100, 0, 0, 0, 37898, 0, 'Tunari');

-- Tunari Waypoints
DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY*10+00,@ENTRY*10+01);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY*10+00, 1, -1118.18, -5540.01, 11.9782, 'Point 1'),
(@ENTRY*10+00, 2, -1137.49, -5528.34, 11.9790, 'Point 2'),
(@ENTRY*10+01, 1, -1137.49, -5528.34, 11.9790, 'Point 1'),
(@ENTRY*10+01, 2, -1118.18, -5540.01, 11.9782, 'Point 2');

-- Nortet SAI
SET @ENTRY := 38037;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,8,8,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nortet - On Data Set 8 8 - Say Line 0"),
(@ENTRY,0,1,0,20,0,100,0,24642,0,0,0,53,0,@ENTRY*10+01,0,0,0,0,1,0,0,0,0,0,0,0,"Nortet - On Quest '' Finished - Start Waypoint"),
(@ENTRY,0,2,0,19,0,100,0,24642,0,0,0,53,0,@ENTRY*10+00,0,0,0,0,1,0,0,0,0,0,0,0,"Nortet - On Quest '' Taken - Start Waypoint");

-- Nortet Text
DELETE FROM `creature_text` WHERE `CreatureID`=@ENTRY;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'Well done, $n!', 12, 0, 100, 0, 0, 0, 37898, 0, 'Nortet');

-- Nortet Waypoints
DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY*10+00,@ENTRY*10+01);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY*10+00, 1, -1171.06, -5441.19, 11.9470, 'Point 1'),
(@ENTRY*10+00, 2, -1159.10, -5419.11, 13.2431, 'Point 2'),
(@ENTRY*10+01, 1, -1159.10, -5419.11, 13.2431, 'Point 1'),
(@ENTRY*10+01, 2, -1171.06, -5441.19, 11.9470, 'Point 2');

-- Zentabra SAI
SET @ENTRY := 38243;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,9,9,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Zentabra - On Data Set 9 9 - Say Line 0"),
(@ENTRY,0,1,0,20,0,100,0,24768,0,0,0,53,0,@ENTRY*10+01,0,0,0,0,1,0,0,0,0,0,0,0,"Zentabra - On Quest '' Finished - Start Waypoint"),
(@ENTRY,0,2,0,19,0,100,0,24768,0,0,0,53,0,@ENTRY*10+00,0,0,0,0,1,0,0,0,0,0,0,0,"Zentabra - On Quest '' Taken - Start Waypoint");

-- Zentabra Text
DELETE FROM `creature_text` WHERE `CreatureID`=@ENTRY;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'Well done, $n!', 12, 0, 100, 0, 0, 0, 37898, 0, 'Zentabra');

-- Zentabra Waypoints
DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY*10+00,@ENTRY*10+01);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY*10+00, 1, -1175.60, -5540.47, 11.9406, 'Point 1'),
(@ENTRY*10+00, 2, -1158.96, -5532.81, 11.9406, 'Point 2'),
(@ENTRY*10+01, 1, -1158.96, -5532.81, 11.9406, 'Point 1'),
(@ENTRY*10+01, 2, -1175.60, -5540.47, 11.9406, 'Point 2');

-- Voldreka SAI
SET @ENTRY := 42618;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,10,10,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Voldreka - On Data Set 10 10 - Say Line 0"),
(@ENTRY,0,1,0,20,0,100,0,26276,0,0,0,53,0,@ENTRY*10+01,0,0,0,0,1,0,0,0,0,0,0,0,"Voldreka - On Quest '' Finished - Start Waypoint"),
(@ENTRY,0,2,0,19,0,100,0,26276,0,0,0,53,0,@ENTRY*10+00,0,0,0,0,1,0,0,0,0,0,0,0,"Voldreka - On Quest '' Taken - Start Waypoint");

-- Voldreka Text
DELETE FROM `creature_text` WHERE `CreatureID`=@ENTRY;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'Well done, $n!', 12, 0, 100, 0, 0, 0, 37898, 0, 'Voldreka');

-- Voldreka Waypoints
DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY*10+00,@ENTRY*10+01);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY*10+00, 1, -1126.12, -5395.10, 12.2185, 'Point 1'),
(@ENTRY*10+00, 2, -1149.21, -5408.07, 13.2484, 'Point 2'),
(@ENTRY*10+01, 1, -1149.21, -5408.07, 13.2484, 'Point 1'),
(@ENTRY*10+01, 2, -1126.12, -5395.10, 12.2185, 'Point 2');

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=36440 AND `spell_id`=68735;

INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(36440, 68735, 1, 1);

UPDATE `creature_template` SET `npcflag`=`npcflag`|16777216, `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=36440;

DELETE FROM `smart_scripts` WHERE `entryorguid`=36440 AND `source_type`=0;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (5542, 5543, 5544, 5545, 5546, 5574, 5577) AND `source_type`=2;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(36440, 0, 0, 1, 73, 0, 100, 0, 0, 0, 0, 0, 0, 85, 68735, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Drowning Watchman - On Spellclick - Cast Rescue Drowning Watchman - Invoker"),
(36440, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 47020, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Drowning Watchman - Linked - Cast Ride Vehicle - Invoker"),
(36440, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 83, 16777216, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Drowning Watchman - Linked - Remove spellclick Flag - self"),
(36440, 0, 3, 4, 38, 0, 100, 0, 1, 1, 0, 0, 0, 28, 68735, 0, 0, 0, 0, 0, 18, 10, 0, 0, 0, 0, 0, 0, "Drowning Watchman - Linked - Remove Aura Rescue Drowning Watchman - player"),
(36440, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 68730, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Drowning Watchman - Linked - Remove Aura Drowning - self"),
(36440, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Drowning Watchman - Linked - Talk"),
(36440, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 0, 33, 36450, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Drowning Watchman - Linked - Kill credit"),
(36440, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 0, 81, 16777216, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Drowning Watchman - Linked - Set spellclick Flags"),
(36440, 0, 8, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Drowning Watchman - Linked - Self: Despawn in 5000 ms"),
(5542, 2, 0, 0, 46, 0, 100, 0, 5542, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 36440, 10, 0, 0, 0, 0, 0, "Areatrigger - On Trigger - Set Data 1 1 - Drowning Watchman"),
(5543, 2, 0, 0, 46, 0, 100, 0, 5543, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 36440, 10, 0, 0, 0, 0, 0, "Areatrigger - On Trigger - Set Data 1 1 - Drowning Watchman"),
(5544, 2, 0, 0, 46, 0, 100, 0, 5544, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 36440, 10, 0, 0, 0, 0, 0, "Areatrigger - On Trigger - Set Data 1 1 - Drowning Watchman"),
(5545, 2, 0, 0, 46, 0, 100, 0, 5545, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 36440, 10, 0, 0, 0, 0, 0, "Areatrigger - On Trigger - Set Data 1 1 - Drowning Watchman"),
(5546, 2, 0, 0, 46, 0, 100, 0, 5546, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 36440, 10, 0, 0, 0, 0, 0, "Areatrigger - On Trigger - Set Data 1 1 - Drowning Watchman"),
(5574, 2, 0, 0, 46, 0, 100, 0, 5574, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 36440, 10, 0, 0, 0, 0, 0, "Areatrigger - On Trigger - Set Data 1 1 - Drowning Watchman"),
(5577, 2, 0, 0, 46, 0, 100, 0, 5577, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 36440, 10, 0, 0, 0, 0, 0, "Areatrigger - On Trigger - Set Data 1 1 - Drowning Watchman");

DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5542, 5543, 5544, 5545, 5546, 5574, 5577);

INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(5542, 'SmartTrigger'),
(5543, 'SmartTrigger'),
(5544, 'SmartTrigger'),
(5545, 'SmartTrigger'),
(5546, 'SmartTrigger'),
(5574, 'SmartTrigger'),
(5577, 'SmartTrigger');

UPDATE `creature_text` SET `BroadcastTextId`=36418 WHERE `CreatureID`=36440 AND `GroupID`=0 AND `ID`=0;
UPDATE `creature_text` SET `BroadcastTextId`=36417 WHERE `CreatureID`=36440 AND `GroupID`=1 AND `ID`=0;
UPDATE `creature_text` SET `BroadcastTextId`=36419 WHERE `CreatureID`=36440 AND `GroupID`=2 AND `ID`=0;

DELETE FROM `creature_trainer` WHERE `CreatureId`=35874;

INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(35874, 15, 10697, 0);

DELETE FROM `gossip_menu_option` WHERE `MenuID`=10697;

INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(10697, 0, 3, "I seek training in the ways of the Hunter.", 3266, 5, 16, 15600),
(10697, 1, 0, "I wish to unlearn my talents.", 62295, 16, 16, 15600),
(10697, 2, 0, "Learn about Dual Talent Specialization.", 33762, 20, 1, 15600);

UPDATE `creature_trainer` SET `MenuId`=10699, `OptionIndex`=0 WHERE `CreatureId`=35871;

DELETE FROM `gossip_menu_option` WHERE `MenuID`=10699;

INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(10699, 0, 3, 'I would like training.', 3266, 5, 16, 15600),
(10699, 1, 0, 'I wish to unlearn my talents.', 62295, 16, 16, 15600),
(10699, 2, 0, 'Learn about Dual Talent Specialization.', 33762, 20, 1, 15600);

UPDATE `creature_trainer` SET `MenuId`=10702, `OptionIndex`=0 WHERE `CreatureId`=35869;

DELETE FROM `gossip_menu_option` WHERE `MenuId`=10702;

INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(10702, 0, 3, 'I am interested in warlock training.', 2544, 5, 16, 15050),
(10702, 1, 0, 'I wish to unlearn my talents.', 62295, 16, 16, 15050),
(10702, 2, 0, 'Learn about Dual Talent Specialization.', 33762, 20, 1, 0);

DELETE FROM `creature_template_locale` WHERE `entry`=34830 AND `locale` IN ('esMX', 'esES');
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `FemaleName`, `Title`, `VerifiedBuild`) VALUES
(34830, 'esMX', 'Trol desafiante', '', '', 18019),
(34830, 'esES', 'Trol desafiante', '', '', 18019);

UPDATE `creature_text` SET `BroadcastTextId`=35115 WHERE `CreatureID`=34830 AND `GroupID`=0 AND `ID`=0;
UPDATE `creature_text` SET `BroadcastTextId`=40315 WHERE `CreatureID`=34830 AND `GroupID`=0 AND `ID`=1;
UPDATE `creature_text` SET `BroadcastTextId`=35113 WHERE `CreatureID`=34830 AND `GroupID`=0 AND `ID`=2;
UPDATE `creature_text` SET `BroadcastTextId`=35114 WHERE `CreatureID`=34830 AND `GroupID`=0 AND `ID`=3;
UPDATE `creature_text` SET `BroadcastTextId`=35112 WHERE `CreatureID`=34830 AND `GroupID`=0 AND `ID`=4;
UPDATE `creature_text` SET `BroadcastTextId`=40313 WHERE `CreatureID`=34830 AND `GroupID`=0 AND `ID`=5;
UPDATE `creature_text` SET `BroadcastTextId`=40312 WHERE `CreatureID`=34830 AND `GroupID`=0 AND `ID`=6;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceEntry` IN (14069, 14075, 25473, 28349, 14071, 24567, 24488, 24502, 24503, 24520, 14070, 26712, 14113, 14153, 14115, 14116, 14120, 14121, 14122, 14123, 14124, 14125, 14126);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 14069, 0, 0, 8, 0, 14138, 0, 0, 0, 0, 0, '', 'Enable quest 14069, only if the player has completed quest 14138.'),
(19, 0, 14075, 0, 0, 8, 0, 14138, 0, 0, 0, 0, 0, '', 'Enable quest 14075, only if the player has completed quest 14138.'),
(19, 0, 25473, 0, 0, 8, 0, 14075, 0, 0, 0, 0, 0, '', 'Enable quest 25473, only if the player has completed quest 14075.'),
(19, 0, 28349, 0, 0, 8, 0, 25473, 0, 0, 0, 0, 0, '', 'Enable quest 28349, only if the player has completed quest 25473.'),
(19, 0, 14071, 0, 0, 8, 0, 28349, 0, 0, 0, 0, 0, '', 'Enable quest 14071, only if the player has completed quest 28349.'),
(19, 0, 24567, 0, 0, 8, 0, 14071, 0, 0, 0, 0, 0, '', 'Enable quest 24567, only if the player has completed quest 14071.'),
(19, 0, 24488, 0, 0, 8, 0, 24567, 0, 0, 0, 0, 0, '', 'Enable quest 24488, only if the player has completed quest 24567.'),
(19, 0, 24502, 0, 0, 8, 0, 24488, 0, 0, 0, 0, 0, '', 'Enable quest 24502, only if the player has completed quest 24488.'),
(19, 0, 24503, 0, 0, 8, 0, 24502, 0, 0, 0, 0, 0, '', 'Enable quest 25473, only if the player has completed quest 24502.'),
(19, 0, 24520, 0, 0, 8, 0, 24503, 0, 0, 0, 0, 0, '', 'Enable quest 24520, only if the player has completed quest 24503.'),
(19, 0, 14070, 0, 0, 8, 0, 24520, 0, 0, 0, 0, 0, '', 'Enable quest 14070, only if the player has completed quest 24520.'),
(19, 0, 26712, 0, 0, 8, 0, 24520, 0, 0, 0, 0, 0, '', 'Enable quest 26712, only if the player has completed quest 24520.'),
(19, 0, 14113, 0, 0, 8, 0, 24502, 0, 0, 0, 0, 0, '', 'Enable quest 14113, only if the player has completed quest 24502.'),
(19, 0, 14153, 0, 0, 8, 0, 24502, 0, 0, 0, 0, 0, '', 'Enable quest 14153, only if the player has completed quest 24502.'),
(19, 0, 14115, 0, 0, 8, 0, 14113, 0, 0, 0, 0, 0, '', 'Enable quest 14115, only if the player has completed quest 14113.'),
(19, 0, 14116, 0, 0, 8, 0, 14115, 0, 0, 0, 0, 0, '', 'Enable quest 14116, only if the player has completed quest 14115.'),
(19, 0, 14120, 0, 0, 8, 0, 14116, 0, 0, 0, 0, 0, '', 'Enable quest 14120, only if the player has completed quest 14116.'),
(19, 0, 14122, 0, 0, 8, 0, 14120, 0, 0, 0, 0, 0, '', 'Enable quest 14122, only if the player has completed quest 14120.'),
(19, 0, 14123, 0, 0, 8, 0, 14122, 0, 0, 0, 0, 0, '', 'Enable quest 14122, only if the player has completed quest 14122.'),
(19, 0, 14121, 0, 0, 8, 0, 14122, 0, 0, 0, 0, 0, '', 'Enable quest 14121, only if the player has completed quest 14122.'),
(19, 0, 14124, 0, 0, 8, 0, 14122, 0, 0, 0, 0, 0, '', 'Enable quest 14124, only if the player has completed quest 14122.'),
(19, 0, 14125, 0, 0, 8, 0, 14124, 0, 0, 0, 0, 0, '', 'Enable quest 14125, only if the player has completed quest 14124.'),
(19, 0, 14126, 0, 0, 8, 0, 14125, 0, 0, 0, 0, 0, '', 'Enable quest 14126, only if the player has completed quest 14125.');

DELETE FROM `phase_area` WHERE `AreaId`=4806 AND `PhaseId`=181;
INSERT INTO `phase_area` (`AreaId`, `PhaseId`, `Comment`) VALUES 
(4806, 181, 'Phase for quest 14400');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=26 AND `SourceGroup`=181 AND `SourceEntry`=4806 AND `SourceId`=0 AND `ElseGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(26, 181, 4806, 0, 0, 9, 0, 14400, 0, 0, 0, 0, 0, '', 'Phase only if quest 14400 is taken');

DELETE FROM `creature_template_movement` WHERE `CreatureId` IN (38038, 44614, 44794, 48304);
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`, `InteractionPauseTimer`) VALUES
(38038, NULL, NULL, NULL, 1, NULL, NULL),
(44614, NULL, NULL, NULL, 1, NULL, NULL),
(44794, NULL, NULL, NULL, 1, NULL, NULL),
(48304, NULL, NULL, NULL, 1, NULL, NULL);

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `guid`=251604;

DELETE FROM `creature_template_addon` WHERE `entry`=38038;
INSERT INTO `creature_template_addon` (`entry`, `waypointPathId`, `cyclicSplinePathId`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `visibilityDistanceType`, `auras`) VALUES
(38038, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, '71065 83470');

UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`|32, `flags_extra`=`flags_extra`|262144, `AIName`='SmartAI', `ScriptName`='' WHERE `entry` IN (38038, 44614, 44794, 48304);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (38038, 44614, 44794, 48304) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(38038, 0, 0, 0, 8, 0, 100, 512, 100, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Tiki Target - On spell hit 100 - Credit kill"),
(38038, 0, 1, 0, 8, 0, 100, 512, 20271, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Tiki Target - On spell hit 20271 - Credit kill"),
(38038, 0, 2, 0, 8, 0, 100, 512, 56641, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Tiki Target - On spell hit 56641 - Credit kill"),
(38038, 0, 3, 0, 8, 0, 100, 512, 2098, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Tiki Target - On spell hit 2098 - Credit kill"),
(38038, 0, 4, 0, 8, 0, 100, 512, 73899, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Tiki Target - On spell hit 73899 - Credit kill"),
(38038, 0, 5, 0, 8, 0, 100, 512, 348, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Tiki Target - On spell hit 348 - Credit kill"),
(38038, 0, 6, 0, 8, 0, 100, 512, 5143, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Tiki Target - On spell hit 5143 - Credit kill"),
(38038, 0, 7, 0, 6, 0, 100, 512, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Tiki Target - On Death - Despawn"),
(44614, 0, 0, 0, 8, 0, 100, 512, 5143, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(44614, 0, 1, 0, 8, 0, 100, 512, 100, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(44614, 0, 2, 0, 8, 0, 100, 512, 2098, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(44614, 0, 3, 0, 8, 0, 100, 512, 56641, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(44614, 0, 4, 0, 8, 0, 100, 512, 348, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(44794, 0, 0, 0, 8, 0, 100, 512, 5143, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(44794, 0, 1, 0, 8, 0, 100, 512, 100, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(44794, 0, 2, 0, 8, 0, 100, 512, 2098, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(44794, 0, 3, 0, 8, 0, 100, 512, 56641, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(44794, 0, 4, 0, 8, 0, 100, 512, 348, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(48304, 0, 0, 0, 8, 0, 100, 512, 5143, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(48304, 0, 1, 0, 8, 0, 100, 512, 100, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(48304, 0, 2, 0, 8, 0, 100, 512, 2098, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(48304, 0, 3, 0, 8, 0, 100, 512, 56641, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill"),
(48304, 0, 4, 0, 8, 0, 100, 512, 348, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Training Dummy - On spell hit - Credit kill");

SET @GOBLIN_MODEL_1= 35186;
SET @GOBLIN_MODEL_2= 35175;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=26 AND `SourceGroup` IN (379, 169) AND `SourceEntry`= 4765;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry` IN (66909, 66910, 66911, 66912, 66913);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(26, 379, 4765, 0, 0, 9, 0, 14153, 0, 0, 0, 0, 0, "", "Set Phase 379 in area 4765; Kezan, Quest Life of the party (14153)"),
(26, 169, 4765, 0, 0, 9, 0, 14153, 0, 0, 0, 0, 0, "", "Set Phase 169 in area 4765; Kezan, Quest Life of the party (14153)"),

(17, 0, 66909, 0, 0, 31, 1, 3, @GOBLIN_MODEL_2, 0, 0, 0, 0, "", "Allow Bubbly only on this specific target - Kezan Partygoer"),
(17, 0, 66909, 0, 0, 1, 1, 75044, 0, 0, 1, 209, 70, "", "Bubbly - Handle Error - Missing aura"),
(17, 0, 66909, 0, 0, 1, 1, 75046, 0, 0, 1, 209, 71, "", "Bubbly - Handle Error - Missing aura"),
(17, 0, 66909, 0, 0, 1, 1, 75048, 0, 0, 1, 209, 72, "", "Bubbly - Handle Error - Missing aura"),
(17, 0, 66909, 0, 0, 1, 1, 75050, 0, 0, 1, 209, 73, "", "Bubbly - Handle Error - Missing aura"),

(17, 0, 66909, 0, 1, 31, 1, 3, @GOBLIN_MODEL_1, 0, 0, 0, 0, "", "Allow Bubbly only on this specific target - Kezan Partygoer"),
(17, 0, 66909, 0, 1, 1, 1, 75044, 0, 0, 1, 209, 70, "", "Bubbly - Handle Error - Missing aura"),
(17, 0, 66909, 0, 1, 1, 1, 75046, 0, 0, 1, 209, 71, "", "Bubbly - Handle Error - Missing aura"),
(17, 0, 66909, 0, 1, 1, 1, 75048, 0, 0, 1, 209, 72, "", "Bubbly - Handle Error - Missing aura"),
(17, 0, 66909, 0, 1, 1, 1, 75050, 0, 0, 1, 209, 73, "", "Bubbly - Handle Error - Missing aura"),

(17, 0, 66910,  0,  0, 31, 1, 3, @GOBLIN_MODEL_2, 0, 0, 0, 0, "", "Allow Bucket only on this specific target - Kezan Partygoer"),
(17, 0, 66910, 0, 0, 1, 1, 75042, 0, 0, 1, 209, 69, "", "Bucket - Handle Error - Missing aura"),
(17, 0, 66910, 0, 0, 1, 1, 75046, 0, 0, 1, 209, 71, "", "Bucket - Handle Error - Missing aura"),
(17, 0, 66910, 0, 0, 1, 1, 75048, 0, 0, 1, 209, 71, "", "Bucket - Handle Error - Missing aura"),
(17, 0, 66910, 0, 0, 1, 1, 75050, 0, 0, 1, 209, 73, "", "Bucket - Handle Error - Missing aura"),
(17, 0, 66910, 0, 1, 31, 1, 3, @GOBLIN_MODEL_1, 0, 0, 0, 0, "", "Allow Bucket only on this specific target - Kezan Partygoer"),
(17, 0, 66910, 0, 1, 1, 1, 75042, 0, 0, 1, 209, 69, "", "Bucket - Handle Error - Missing aura"),
(17, 0, 66910, 0, 1, 1, 1, 75046, 0, 0, 1, 209, 71, "", "Bucket - Handle Error - Missing aura"),
(17, 0, 66910, 0, 1, 1, 1, 75048, 0, 0, 1, 209, 72, "", "Bucket - Handle Error - Missing aura"),
(17, 0, 66910, 0, 1, 1, 1, 75050, 0, 0, 1, 209, 73, "", "Bucket - Handle Error - Missing aura"),

(17, 0, 66911, 0, 0, 31, 1, 3, @GOBLIN_MODEL_2, 0, 0, 0, 0, "", "Allow Dance only on this specific target - Kezan Partygoer"),
(17, 0, 66911, 0, 0, 1, 1, 75044, 0, 0, 1, 209, 70, "", "Dance - Handle Error - Missing aura"),
(17, 0, 66911, 0, 0, 1, 1, 75042, 0, 0, 1, 209, 69, "", "Dance - Handle Error - Missing aura"),
(17, 0, 66911, 0, 0, 1, 1, 75048, 0, 0, 1, 209, 72, "", "Dance - Handle Error - Missing aura"),
(17, 0, 66911, 0, 0, 1, 1, 75050, 0, 0, 1, 209, 73, "", "Dance - Handle Error - Missing aura"),
(17, 0, 66911, 0, 1, 31, 1, 3, @GOBLIN_MODEL_1, 0, 0, 0, 0, "", "Allow Dance only on this specific target - Kezan Partygoer"),
(17, 0, 66911, 0, 1, 1, 1, 75044, 0, 0, 1, 209, 70, "", "Dance - Handle Error - Missing aura"),
(17, 0, 66911, 0, 1, 1, 1, 75042, 0, 0, 1, 209, 69, "", "Dance - Handle Error - Missing aura"),
(17, 0, 66911, 0, 1, 1, 1, 75048, 0, 0, 1, 209, 72, "", "Dance - Handle Error - Missing aura"),
(17, 0, 66911, 0, 1, 1, 1, 75050, 0, 0, 1, 209, 73, "", "Dance - Handle Error - Missing aura"),

(17, 0, 66912, 0, 0, 31, 1, 3, @GOBLIN_MODEL_2, 0, 0, 0, 0, "", "Allow Fireworks only on this specific target - Kezan Partygoer"),
(17, 0, 66912, 0, 0, 1, 1, 75044, 0, 0, 1, 209, 70, "", "Fireworks - Handle Error - Missing aura"),
(17, 0, 66912, 0, 0, 1, 1, 75046, 0, 0, 1, 209, 71, "", "Fireworks - Handle Error - Missing aura"),
(17, 0, 66912, 0, 0, 1, 1, 75042, 0, 0, 1, 209, 69, "", "Fireworks - Handle Error - Missing aura"),
(17, 0, 66912, 0, 0, 1, 1, 75050, 0, 0, 1, 209, 73, "", "Fireworks - Handle Error - Missing aura"),
(17, 0, 66912, 0, 1, 31, 1, 3, @GOBLIN_MODEL_1, 0, 0, 0, 0, "", "Allow Fireworks only on this specific target - Kezan Partygoer"),
(17, 0, 66912, 0, 1, 1, 1, 75044, 0, 0, 1, 209, 70, "", "Fireworks - Handle Error - Missing aura"),
(17, 0, 66912, 0, 1, 1, 1, 75046, 0, 0, 1, 209, 71, "", "Fireworks - Handle Error - Missing aura"),
(17, 0, 66912, 0, 1, 1, 1, 75042, 0, 0, 1, 209, 69, "", "Fireworks - Handle Error - Missing aura"),
(17, 0, 66912, 0, 1, 1, 1, 75050, 0, 0, 1, 209, 73, "", "Fireworks - Handle Error - Missing aura"),

(17, 0, 66913, 0, 0, 31, 1, 3, @GOBLIN_MODEL_2, 0, 0, 0, 0, "", "Allow Hors D'oeuvres on this specific target - Kezan Partygoer"),
(17, 0, 66913, 0, 0, 1, 1, 75044, 0, 0, 1, 209, 70, "", "Hors D'oeuvres - Handle Error - Missing aura"),
(17, 0, 66913, 0, 0, 1, 1, 75046, 0, 0, 1, 209, 71, "", "Hors D'oeuvres - Handle Error - Missing aura"),
(17, 0, 66913, 0, 0, 1, 1, 75048, 0, 0, 1, 209, 72, "", "Hors D'oeuvres - Handle Error - Missing aura"),
(17, 0, 66913, 0, 0, 1, 1, 75042, 0, 0, 1, 209, 69, "", "Hors D'oeuvres - Handle Error - Missing aura"),
(17, 0, 66913, 0, 1, 31, 1, 3, @GOBLIN_MODEL_1, 0, 0, 0, 0, "", "Allow Hors D'oeuvres on this specific target - Kezan Partygoer"),
(17, 0, 66913, 0, 1, 1, 1, 75044, 0, 0, 1, 209, 70, "", "Hors D'oeuvres - Handle Error - Missing aura"),
(17, 0, 66913, 0, 1, 1, 1, 75046, 0, 0, 1, 209, 71, "", "Hors D'oeuvres - Handle Error - Missing aura"),
(17, 0, 66913, 0, 1, 1, 1, 75048, 0, 0, 1, 209, 72, "", "Hors D'oeuvres - Handle Error - Missing aura"),
(17, 0, 66913, 0, 1, 1, 1, 75042, 0, 0, 1, 209, 69, "", "Hors D'oeuvres - Handle Error - Missing aura");

DELETE FROM `phase_area` WHERE `AreaId`=4765 AND `PhaseId` IN (379, 169);
INSERT INTO `phase_area` (`AreaId`, `PhaseId`, `Comment`) VALUES
(4765, 379, "Kezan (Quest 14153)"),
(4765, 169, "Kezan (Quest 14153)");

UPDATE `creature_template` SET `AIName` = "SmartAI" WHERE `entry`=35175; -- Set AI to Model 2

DELETE FROM `creature_text` WHERE `CreatureID` IN (35175, 35186);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `SoundType`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@GOBLIN_MODEL_1, 0, 1, "A disco ball?! Groovy!", 12, 0, 100, 0, 0, 0, 0, 35425, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 0, 2, "How do you like my moves, $n?", 12, 0, 100, 0, 0, 0, 0, 35426, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 0, 3, "We should totally have a pants-off dance-off!", 12, 0, 100, 0, 0, 0, 0, 35427, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 0, 4, "Shake it like a goblinoid picture!", 12, 0, 100, 0, 0, 0, 0, 35428, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 1, 0, "Ugh... I need a bucket!", 12, 0, 100, 0, 0, 0, 0, 40223, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 1, 1, "Shorry about your shoes.", 12, 0, 100, 0, 0, 0, 0, 35424, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 1, 2, "I feel much better now...hic!", 12, 0, 100, 0, 0, 0, 0, 35422, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 1, 3, "Oh, my head hurtsh.", 12, 0, 100, 0, 0, 0, 0, 35423, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 2, 0, "I could really use a refill on my drink here.", 12, 0, 100, 0, 0, 0, 0, 40222, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 2, 1, "Thanks for the refill, $g sir : ma'am;!", 12, 0, 100, 0, 0, 0, 0, 35418, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 2, 2, "A fresh glass of bubbly. Just what the doctor ordered, $n.", 12, 0, 100, 0, 0, 0, 0, 35417, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 2, 3, "This sparkling white wine is delicious! Wherever did you get it?", 12, 0, 100, 0, 0, 0, 0, 35419, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 2, 4, "I think this one will have to be my last. I'm driving home after the party.", 12, 0, 100, 0, 0, 0, 0, 35420, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 2, 5, "Thanksh!", 12, 0, 100, 0, 0, 0, 0, 35421, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 3, 0, "I love fireworks!", 12, 0, 100, 0, 0, 0, 0, 40225, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 3, 1, "Wow! That sure beats this puny, little sparkler!", 12, 0, 100, 0, 0, 0, 0, 35429, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 3, 2, "You really stop at no expense, $n! Amazing!", 12, 0, 100, 0, 0, 0, 0, 35430, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 3, 3, "Best... Party... Evar!", 12, 0, 100, 0, 0, 0, 0, 35431, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 3, 4, "Woo hoo, fireworks! More, more!", 12, 0, 100, 0, 0, 0, 0, 35432, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 4, 0, "This is delicious! Are there more hors d'oeuvres?", 12, 0, 100, 0, 0, 0, 0, 40226, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 4, 1, "Nom, nom, nom!", 12, 0, 100, 0, 0, 0, 0, 35436, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 4, 2, "Finger licking good!", 12, 0, 100, 0, 0, 0, 0, 35435, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 4, 3, "Thanks. I was almost out. So hungry!", 12, 0, 100, 0, 0, 0, 0, 35433, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 4, 4, "These are the most delicious hors d'oeurves I have ever tasted. You must share your recipe, $n!", 12, 0, 100, 0, 0, 0, 0, 35434, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 5, 0, "If only I had someone to dance with.", 12, 0, 100, 0, 0, 0, 0, 40224, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 5, 1, "A disco ball?! Groovy!", 12, 0, 100, 0, 0, 0, 0, 35425, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 5, 2, "We should totally have a pants-off dance-off!", 12, 0, 100, 0, 0, 0, 0, 35427, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 5, 3, "Shake it like a goblinoid picture!", 12, 0, 100, 0, 0, 0, 0, 35428, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 5, 4, "Ugh... I need a bucket!", 12, 0, 100, 0, 0, 0, 0, 40223, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 5, 5, "Shorry about your shoes.", 12, 0, 100, 0, 0, 0, 0, 35424, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 5, 6, "I feel much better now...hic!", 12, 0, 100, 0, 0, 0, 0, 35422, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 5, 7, "Oh, my head hurtsh.", 12, 0, 100, 0, 0, 0, 0, 35423, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_1, 5, 8, "I could really use a refill on my drink here.", 12, 0, 100, 0, 0, 0, 0, 40222, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 0, 1, "A disco ball?! Groovy!", 12, 0, 100, 0, 0, 0, 0, 35425, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 0, 2, "How do you like my moves, $n?", 12, 0, 100, 0, 0, 0, 0, 35426, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 0, 3, "We should totally have a pants-off dance-off!", 12, 0, 100, 0, 0, 0, 0, 35427, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 0, 4, "Shake it like a goblinoid picture!", 12, 0, 100, 0, 0, 0, 0, 35428, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 1, 0, "Ugh... I need a bucket!", 12, 0, 100, 0, 0, 0, 0, 40223, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 1, 1, "Shorry about your shoes.", 12, 0, 100, 0, 0, 0, 0, 35424, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 1, 2, "I feel much better now...hic!", 12, 0, 100, 0, 0, 0, 0, 35422, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 1, 3, "Oh, my head hurtsh.", 12, 0, 100, 0, 0, 0, 0, 35423, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 2, 0, "I could really use a refill on my drink here.", 12, 0, 100, 0, 0, 0, 0, 40222, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 2, 1, "Thanks for the refill, $g sir : ma'am;!", 12, 0, 100, 0, 0, 0, 0, 35418, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 2, 2, "A fresh glass of bubbly. Just what the doctor ordered, $n.", 12, 0, 100, 0, 0, 0, 0, 35417, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 2, 3, "This sparkling white wine is delicious! Wherever did you get it?", 12, 0, 100, 0, 0, 0, 0, 35419, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 2, 4, "I think this one will have to be my last. I'm driving home after the party.", 12, 0, 100, 0, 0, 0, 0, 35420, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 2, 5, "Thanksh!", 12, 0, 100, 0, 0, 0, 0, 35421, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 3, 0, "I love fireworks!", 12, 0, 100, 0, 0, 0, 0, 40225, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 3, 1, "Wow! That sure beats this puny, little sparkler!", 12, 0, 100, 0, 0, 0, 0, 35429, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 3, 2, "You really stop at no expense, $n! Amazing!", 12, 0, 100, 0, 0, 0, 0, 35430, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 3, 3, "Best... Party... Evar!", 12, 0, 100, 0, 0, 0, 0, 35431, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 3, 4, "Woo hoo, fireworks! More, more!", 12, 0, 100, 0, 0, 0, 0, 35432, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 4, 0, "This is delicious! Are there more hors d'oeuvres?", 12, 0, 100, 0, 0, 0, 0, 40226, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 4, 1, "Nom, nom, nom!", 12, 0, 100, 0, 0, 0, 0, 35436, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 4, 2, "Finger licking good!", 12, 0, 100, 0, 0, 0, 0, 35435, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 4, 3, "Thanks. I was almost out. So hungry!", 12, 0, 100, 0, 0, 0, 0, 35433, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 4, 4, "These are the most delicious hors d'oeurves I have ever tasted. You must share your recipe, $n!", 12, 0, 100, 0, 0, 0, 0, 35434, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 5, 0, "If only I had someone to dance with.", 12, 0, 100, 0, 0, 0, 0, 40224, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 5, 1, "A disco ball?! Groovy!", 12, 0, 100, 0, 0, 0, 0, 35425, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 5, 2, "We should totally have a pants-off dance-off!", 12, 0, 100, 0, 0, 0, 0, 35427, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 5, 3, "Shake it like a goblinoid picture!", 12, 0, 100, 0, 0, 0, 0, 35428, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 5, 4, "Ugh... I need a bucket!", 12, 0, 100, 0, 0, 0, 0, 40223, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 5, 5, "Shorry about your shoes.", 12, 0, 100, 0, 0, 0, 0, 35424, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 5, 6, "I feel much better now...hic!", 12, 0, 100, 0, 0, 0, 0, 35422, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 5, 7, "Oh, my head hurtsh.", 12, 0, 100, 0, 0, 0, 0, 35423, 0, "Kezan Partygoer"),
(@GOBLIN_MODEL_2, 5, 8, "I could really use a refill on my drink here.", 12, 0, 100, 0, 0, 0, 0, 40222, 0, "Kezan Partygoer");



DELETE FROM `smart_scripts` WHERE `entryorguid` IN (35175, 35186) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@GOBLIN_MODEL_1, 0, 0, 1, 8, 0, 100, 0, 66911, 0, 15000, 15000, 0, 5, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Dance' - Play Emote 10"),
(@GOBLIN_MODEL_1, 0, 1, 2, 61, 0, 100, 0, 0, 0, 15000, 15000, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Dance' - Say Line 0"),
(@GOBLIN_MODEL_1, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 75046, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Dance' - Remove Aura Dance"),
(@GOBLIN_MODEL_1, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Dance' - Apply Aura Happy Partygoer"),
(@GOBLIN_MODEL_1, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 33, @GOBLIN_MODEL_1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Dance' - Get Credit"),

(@GOBLIN_MODEL_1, 0, 5, 6, 8, 0, 100, 0, 66910, 0, 15000, 15000, 0, 5, 17, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bucket' - Play Emote 17"),
(@GOBLIN_MODEL_1, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bucket' - Say Line 1"),
(@GOBLIN_MODEL_1, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 75044, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bucket' - Remove Aura Bucket"),
(@GOBLIN_MODEL_1, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66931, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bucket' - Summon Bucket"),
(@GOBLIN_MODEL_1, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bucket' - Apply Aura Happy Partygoer"),
(@GOBLIN_MODEL_1, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 33, @GOBLIN_MODEL_1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bucket' - Get Credit"),

(@GOBLIN_MODEL_1, 0, 11, 12, 8, 0, 100, 0, 66909, 0, 12000, 12000, 0, 5, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bubbly' - Play Emote 7"),
(@GOBLIN_MODEL_1, 0, 12, 13, 61, 0, 100, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bubbly' - Say Line 2"),
(@GOBLIN_MODEL_1, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 75042, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bubbly' - Remove Aura Bubbly"),
(@GOBLIN_MODEL_1, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bubbly' - Apply Aura Happy Partygoer"),
(@GOBLIN_MODEL_1, 0, 15, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 33, @GOBLIN_MODEL_1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bubbly' - Get Credit"),

(@GOBLIN_MODEL_1, 0, 16, 17, 8, 0, 100, 0, 66912, 0, 12000, 12000, 0, 5, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Fireworks' - Play Emote 7"),
(@GOBLIN_MODEL_1, 0, 17, 18, 61, 0, 100, 0, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Fireworks' - Say Line 3"),
(@GOBLIN_MODEL_1, 0, 18, 19, 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 75048, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Fireworks' - Remove Aura Fireworks"),
(@GOBLIN_MODEL_1, 0, 19, 20, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Fireworks' - Apply Aura Happy Partygoer"),
(@GOBLIN_MODEL_1, 0, 20, 21, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66919, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Fireworks' - Cast Fireworks"),
(@GOBLIN_MODEL_1, 0, 21, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 33, @GOBLIN_MODEL_1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bubbly' - Get Credit"),

(@GOBLIN_MODEL_1, 0, 22, 23, 8, 0, 100, 0, 66913, 0, 10000, 10000, 0, 5, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Hors D'oeuvres' - Play Emote 7"),
(@GOBLIN_MODEL_1, 0, 23, 24, 61, 0, 100, 0, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Hors D'oeuvres' - Say Line 4"),
(@GOBLIN_MODEL_1, 0, 24, 25, 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 75050, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Hors D'oeuvres' - Remove Aura Hors D'oeuvres"),
(@GOBLIN_MODEL_1, 0, 25, 26, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Hors D'oeuvres' - Apply Aura Happy Partygoer"),
(@GOBLIN_MODEL_1, 0, 26, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 33, @GOBLIN_MODEL_1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Hors D'oeuvres' - Get Credit"),

(@GOBLIN_MODEL_1, 0, 27, 0, 64, 0, 100, 0, 0, 0, 0, 0, 0, 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Gossip Hello - Play Random Emote (1, 3, 5, 6)"),
(@GOBLIN_MODEL_1, 0, 28, 0, 1, 0,  60,  0,  2000,  8000,  10000,  20000,  0,  1,  5,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  "Kezan Partygoer - Out of Combat - Say Line 5"),

(@GOBLIN_MODEL_2, 0, 0, 1, 8, 0, 100, 0, 66911, 0, 15000, 15000, 0, 5, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Dance' - Play Emote 10"),
(@GOBLIN_MODEL_2, 0, 1, 2, 61, 0, 100, 0, 0, 0, 15000, 15000, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Dance' - Say Line 0"),
(@GOBLIN_MODEL_2, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 75046, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Dance' - Remove Aura Dance"),
(@GOBLIN_MODEL_2, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Dance' - Apply Aura Happy Partygoer"),
(@GOBLIN_MODEL_2, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 33, @GOBLIN_MODEL_2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Dance' - Get Credit"),

(@GOBLIN_MODEL_2, 0, 5, 6, 8, 0, 100, 0, 66910, 0, 15000, 15000, 0, 5, 17, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bucket' - Play Emote 17"),
(@GOBLIN_MODEL_2, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bucket' - Say Line 1"),
(@GOBLIN_MODEL_2, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 75044, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bucket' - Remove Aura Bucket"),
(@GOBLIN_MODEL_2, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66931, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bucket' - Summon Bucket"),
(@GOBLIN_MODEL_2, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bucket' - Apply Aura Happy Partygoer"),
(@GOBLIN_MODEL_2, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 33, @GOBLIN_MODEL_2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bucket' - Get Credit"),

(@GOBLIN_MODEL_2, 0, 11, 12, 8, 0, 100, 0, 66909, 0, 12000, 12000, 0, 5, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bubbly' - Play Emote 7"),
(@GOBLIN_MODEL_2, 0, 12, 13, 61, 0, 100, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bubbly' - Say Line 2"),
(@GOBLIN_MODEL_2, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 75042, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bubbly' - Remove Aura Bubbly"),
(@GOBLIN_MODEL_2, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bubbly' - Apply Aura Happy Partygoer"),
(@GOBLIN_MODEL_2, 0, 15, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 33, @GOBLIN_MODEL_2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bubbly' - Get Credit"),

(@GOBLIN_MODEL_2, 0, 16, 17, 8, 0, 100, 0, 66912, 0, 12000, 12000, 0, 5, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Fireworks' - Play Emote 7"),
(@GOBLIN_MODEL_2, 0, 17, 18, 61, 0, 100, 0, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Fireworks' - Say Line 3"),
(@GOBLIN_MODEL_2, 0, 18, 19, 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 75048, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Fireworks' - Remove Aura Fireworks"),
(@GOBLIN_MODEL_2, 0, 19, 20, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Fireworks' - Apply Aura Happy Partygoer"),
(@GOBLIN_MODEL_2, 0, 20, 21, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66919, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Fireworks' - Cast Fireworks"),
(@GOBLIN_MODEL_2, 0, 21, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 33, @GOBLIN_MODEL_2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Bubbly' - Get Credit"),

(@GOBLIN_MODEL_2, 0, 22, 23, 8, 0, 100, 0, 66913, 0, 10000, 10000, 0, 5, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Hors D'oeuvres' - Play Emote 7"),
(@GOBLIN_MODEL_2, 0, 23, 24, 61, 0, 100, 0, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Hors D'oeuvres' - Say Line 4"),
(@GOBLIN_MODEL_2, 0, 24, 25, 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 75050, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Hors D'oeuvres' - Remove Aura Hors D'oeuvres"),
(@GOBLIN_MODEL_2, 0, 25, 26, 61, 0, 100, 0, 0, 0, 0, 0, 0, 11, 66916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Hors D'oeuvres' - Apply Aura Happy Partygoer"),
(@GOBLIN_MODEL_2, 0, 26, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 33, @GOBLIN_MODEL_2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Spellhit 'Hors D'oeuvres' - Get Credit"),

(@GOBLIN_MODEL_2, 0, 27, 0, 64, 0, 100, 0, 0, 0, 0, 0, 0, 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kezan Partygoer - On Gossip Hello - Play Random Emote (1, 3, 5, 6)"),
(@GOBLIN_MODEL_2, 0, 28, 0, 1, 0,  60,  0,  2000,  8000,  10000,  20000,  0,  1,  5,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  "Kezan Partygoer - Out of Combat - Say Line 5");

DELETE FROM `creature_template_movement` WHERE `CreatureId` IN (50372, 49044, 49128);
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`, `InteractionPauseTimer`) VALUES 
(50372, NULL, NULL, 1, NULL, NULL, NULL),
(49044, NULL, NULL, 1, NULL, NULL, NULL),
(49128, NULL, NULL, 1, NULL, NULL, NULL);

UPDATE `creature_template` SET `ScriptName`='npc_geezle' WHERE `entry`=17318;
DELETE FROM `quest_template_locale` WHERE `ID` IN (24784, 24766) AND `locale` IN ('esES', 'esMX');
INSERT INTO `quest_template_locale` (`ID`, `locale`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `CompletedText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `QuestGiverTextWindow`, `QuestGiverTargetName`, `QuestTurnTextWindow`, `QuestTurnTargetName`, `VerifiedBuild`) VALUES
(24784, 'esES', 'Las artes de un sacerdote', 'Habla con Tunari para entrenar la Sanación relámpago. Usa Sanación relámpago 5 veces para curar a los Vigilante Lanza Negra heridos alrededor del Campo de Entrenamiento de los Lanza Negra.', 'Creo que tengo algo que puedo mostrarte. Es bastante simple, pero debería ayudar. Con una rápida reunión de energías sagradas, puedes vendar tus heridas o las de tus amigos. Esta magia es rápida, pero también es agotadora para ti. Con el tiempo, aprenderás más variedades que no te agotarán tanto. Avísame cuando creas que lo dominas.', NULL, NULL, NULL, NULL, 'Practicar la Sanación relámpago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(24784, 'esMX', 'Las artes de un sacerdote', 'Habla con Tunari para entrenar la Sanación relámpago. Usa Sanación relámpago 5 veces para curar a los Vigilante Lanza Negra heridos alrededor del Campo de Entrenamiento de los Lanza Negra.', 'Creo que tengo algo que puedo mostrarte. Es bastante simple, pero debería ayudar. Con una rápida reunión de energías sagradas, puedes vendar tus heridas o las de tus amigos. Esta magia es rápida, pero también es agotadora para ti. Con el tiempo, aprenderás más variedades que no te agotarán tanto. Avísame cuando creas que lo dominas.', NULL, NULL, NULL, NULL, 'Practicar la Sanación relámpago', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(24766, 'esES', 'Las artes de un druida', "Habla con Zen'Tabra para entrenar el rejuvenecimiento. Practica el rejuvenecimiento con un Vigilante Lanza Negra herido en el campo de entrenamiento de los Lanza Negra.", 'Creo que tengo algo que puedo mostrarte. Es bastante simple, pero debería ayudar. Invocando a la naturaleza, podemos curar huesos y cortes. Podemos traer de vuelta incluso al aliado más gravemente herido para que siga luchando. Avísame cuando creas que lo tienes claro.', NULL, NULL, NULL, NULL, 'Practicar Rejuvenecimiento', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(24766, 'esMX', 'Las artes de un druida', "Habla con Zen'Tabra para entrenar el rejuvenecimiento. Practica el rejuvenecimiento con un Vigilante Lanza Negra herido en el campo de entrenamiento de los Lanza Negra.", 'Creo que tengo algo que puedo mostrarte. Es bastante simple, pero debería ayudar. Invocando a la naturaleza, podemos curar huesos y cortes. Podemos traer de vuelta incluso al aliado más gravemente herido para que siga luchando. Avísame cuando creas que lo tienes claro.', NULL, NULL, NULL, NULL, 'Practicar Rejuvenecimiento', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=47057;

DELETE FROM `smart_scripts` WHERE `entryorguid`=47057 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(47057, 0, 0, 0, 8, 0, 100, 1, 2061, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Wounded Darkspear Watcher - On Spellhit - Kill Credit"),
(47057, 0, 1, 0, 8, 0, 100, 1, 774, 0, 0, 0, 0, 33, 44175, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Wounded Darkspear Watcher - On Spellhit - Kill Credit");

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=181148;

DELETE FROM `smart_scripts` WHERE `entryorguid`=181148 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(181148, 1, 0, 0, 64, 0, 100, 0, 1, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'on report use - despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=1 AND `SourceEntry`=181148 AND `SourceId`=1 AND `ElseGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, 181148, 1, 0, 9, 0, 9193, 0, 0, 0, 0, 0, '', 'smart_script only if quest 9193 is taken');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=29528;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(13, 1, 29528, 0, 0, 31, 0, 3, 16518, 0, 0, 'Inoculate Nestlewood Owlkin - Implicit target - Nestlewood Owlkin');

DELETE FROM `smart_scripts` WHERE `entryorguid`=16518 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(16518, 0, 0, 0, 25  0, 100 0, 0, 0, 0, 0, 0, 22  1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Nestlewood Owlkin - Reset - Set phase 1"),
(16518, 0, 1, 0, 8, 1, 100 0, 29528, 0, 3000,  3000,  0, 22  2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Nestlewood Owlkin - Spellhit - Set phase 2"),
(16518, 0, 2, 0, 23  2, 100 1, 29528, 0, 0, 0, 0, 22  1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Nestlewood Owlkin - Missing aura - Set phase 1"),
(16518, 0, 3, 4, 1, 2, 100 1, 2900,  2900,  0, 0, 0, 22  3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Nestlewood Owlkin - Update OOC - Set phase 3 (see conditions)"),
(16518, 0, 4, 5, 61  0, 100 0, 0, 0, 0, 0, 0, 66  0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Nestlewood Owlkin - Update OOC - Face invoker"),
(16518, 0, 5, 6, 61  0, 100 0, 0, 0, 0, 0, 0, 41  5000,  0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Nestlewood Owlkin - Update OOC - Despawn in 5 seconds"),
(16518, 0, 6, 7, 61  0, 100 0, 0, 0, 0, 0, 0, 36  16534, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Nestlewood Owlkin - Update OOC - Update template"),
(16518, 0, 7, 8, 61  0, 100 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Nestlewood Owlkin - Update OOC - Say text"),
(16518, 0, 8, 0, 61  0, 100 0, 0, 0, 0, 0, 0, 33  16534, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Nestlewood Owlkin - Update OOC - Give credit");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=16518 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(22, 4, 16518, 0, 0, 1, 1, 29528, 0, 0, 0,'Nestlewood Owlkin - Activate SAI if object has aura');

UPDATE `creature` SET `spawntimesecs`=90 WHERE `id`=16518;

DELETE FROM `creature_classlevelstats` WHERE `level` BETWEEN 1 and 90;
INSERT INTO `creature_classlevelstats` (`level`, `class`, `basehp0`, `basehp1`, `basehp2`, `basehp3`, `basemana`, `basearmor`, `attackpower`, `rangedattackpower`, `damage_base`, `damage_exp1`, `damage_exp2`, `damage_exp3`, `comment`) VALUES
(1, 1, 42, 42, 42, 1, 0, 7, 9, 0, 0.1321, 0.1321, 0.1321, 0, ''),
(1, 2, 41, 41, 41, 1, 60, 23, 9, 0, 0.2381, 0.2381, 0.2381, 0, ''),
(1, 4, 42, 42, 42, 1, 0, 23, 9, 0, 0.1321, 0.1321, 0.1321, 0, ''),
(1, 8, 40, 40, 40, 1, 120, 5, 8, 0, 0.1781, 0.1781, 0.1781, 0, ''),
(2, 1, 55, 55, 55, 1, 0, 8, 11, 0, 0.2888, 0.2888, 0.2888, 0, ''),
(2, 2, 54, 54, 54, 1, 69, 26, 11, 0, 0.3119, 0.3119, 0.3119, 0, ''),
(2, 4, 55, 55, 55, 1, 0, 26, 11, 0, 0.2888, 0.2888, 0.2888, 0, ''),
(2, 8, 52, 52, 52, 1, 147, 16, 10, 0, 0.3233, 0.3233, 0.3233, 0, ''),
(3, 1, 71, 71, 71, 1, 0, 33, 13, 0, 0.5547, 0.5547, 0.5547, 0, ''),
(3, 2, 69, 69, 69, 1, 79, 33, 11, 0, 0.5952, 0.5952, 0.5952, 0, ''),
(3, 4, 71, 71, 71, 1, 0, 33, 13, 0, 0.5547, 0.5547, 0.5547, 0, ''),
(3, 8, 67, 67, 67, 1, 174, 28, 12, 10, 0.4793, 0.4793, 0.4793, 0, ''),
(4, 1, 86, 86, 86, 1, 0, 68, 15, 0, 0.9435, 0.9435, 0.9435, 0, ''),
(4, 2, 83, 83, 83, 1, 104, 69, 13, 0, 0.946, 0.946, 0.946, 0, ''),
(4, 4, 86, 86, 86, 1, 0, 69, 15, 0, 0.9435, 0.9435, 0.9435, 0, ''),
(4, 8, 81, 81, 81, 1, 202, 57, 13, 11, 0.5714, 0.5714, 0.5714, 0, ''),
(5, 1, 102, 102, 102, 1, 0, 111, 18, 0, 1.3708, 1.3708, 1.3708, 0, ''),
(5, 2, 98, 98, 98, 1, 115, 112, 14, 0, 1.4567, 1.4567, 1.4567, 0, ''),
(5, 4, 102, 102, 102, 1, 0, 112, 18, 0, 1.3708, 1.3708, 1.3708, 0, ''),
(5, 8, 95, 95, 95, 1, 230, 93, 14, 11, 0.768, 0.768, 0.768, 0, ''),
(6, 1, 120, 120, 120, 1, 0, 165, 20, 0, 2.0661, 2.0661, 2.0661, 0, ''),
(6, 2, 115, 115, 115, 1, 126, 165, 16, 0, 2.0933, 2.0933, 2.0933, 0, ''),
(6, 4, 120, 120, 120, 1, 0, 165, 20, 0, 2.0661, 2.0661, 2.0661, 0, ''),
(6, 8, 111, 111, 111, 1, 259, 139, 15, 11, 1.1985, 1.1985, 1.1985, 0, ''),
(7, 1, 137, 137, 137, 1, 0, 230, 24, 0, 2.7669, 2.7669, 2.7669, 0, ''),
(7, 2, 131, 131, 131, 1, 138, 230, 20, 0, 2.7273, 2.7273, 2.7273, 0, ''),
(7, 4, 137, 137, 137, 1, 0, 230, 24, 0, 2.7669, 2.7669, 2.7669, 0, ''),
(7, 8, 126, 126, 126, 1, 289, 194, 15, 11, 2.159, 2.159, 2.159, 0, ''),
(8, 1, 156, 156, 156, 1, 0, 306, 28, 0, 3.1993, 3.1993, 3.1993, 0, ''),
(8, 2, 148, 148, 148, 1, 165, 307, 24, 0, 3.1076, 3.1076, 3.1076, 0, ''),
(8, 4, 156, 156, 156, 1, 0, 307, 28, 0, 3.1993, 3.1993, 3.1993, 0, ''),
(8, 8, 143, 143, 143, 1, 319, 265, 16, 11, 2.5217, 2.5217, 2.5217, 0, ''),
(9, 1, 176, 176, 176, 1, 0, 387, 31, 0, 3.7038, 3.7038, 3.7038, 0, ''),
(9, 2, 166, 166, 166, 1, 178, 396, 27, 0, 3.595, 3.595, 3.595, 0, ''),
(9, 4, 176, 176, 176, 1, 0, 396, 31, 0, 3.7038, 3.7038, 3.7038, 0, ''),
(9, 8, 160, 160, 160, 1, 350, 339, 17, 11, 3.03, 2.99, 2.99, 0, ''),
(10, 1, 198, 198, 198, 1, 0, 463, 34, 0, 4.1084, 4.1084, 4.1084, 0, ''),
(10, 2, 186, 186, 186, 1, 191, 502, 30, 0, 3.9604, 3.9604, 3.9604, 0, ''),
(10, 4, 198, 198, 198, 1, 0, 502, 34, 0, 4.1084, 4.1084, 4.1084, 0, ''),
(10, 8, 178, 178, 178, 1, 382, 423, 17, 12, 3.4451, 3.4451, 3.4451, 0, ''),
(11, 1, 222, 222, 222, 1, 0, 528, 38, 0, 4.6996, 4.6996, 4.6996, 0, ''),
(11, 2, 208, 208, 208, 1, 205, 528, 34, 0, 4.4552, 4.4552, 4.4552, 0, ''),
(11, 4, 222, 222, 222, 1, 0, 528, 38, 0, 4.6996, 4.6996, 4.6996, 0, ''),
(11, 8, 199, 199, 199, 1, 459, 447, 18, 12, 3.975, 3.975, 3.975, 0, ''),
(12, 1, 247, 247, 247, 1, 0, 562, 42, 0, 5.4601, 5.4601, 5.4601, 0, ''),
(12, 2, 230, 230, 230, 1, 249, 562, 38, 0, 5.1436, 5.1436, 5.1436, 0, ''),
(12, 4, 247, 247, 247, 1, 0, 562, 42, 0, 5.4601, 5.4601, 5.4601, 0, ''),
(12, 8, 219, 219, 219, 1, 537, 475, 19, 12, 4.6771, 4.6771, 4.6771, 0, ''),
(13, 1, 273, 273, 273, 1, 0, 596, 46, 1, 5.9359, 5.9359, 5.9359, 0, ''),
(13, 2, 253, 253, 253, 1, 264, 562, 42, 1, 5.5674, 5.5674, 5.5674, 0, ''),
(13, 4, 273, 273, 273, 1, 0, 562, 46, 1, 5.9359, 5.9359, 5.9359, 0, ''),
(13, 8, 241, 241, 241, 1, 601, 509, 20, 12, 5.1513, 5.1513, 5.1513, 0, ''),
(14, 1, 300, 300, 300, 1, 0, 630, 50, 1, 6.5895, 6.5895, 6.5895, 0, ''),
(14, 2, 276, 276, 276, 1, 295, 630, 46, 1, 6.1568, 6.1568, 6.1568, 0, ''),
(14, 4, 300, 300, 300, 1, 0, 630, 50, 1, 6.5895, 6.5895, 6.5895, 0, ''),
(14, 8, 263, 263, 263, 1, 710, 523, 21, 12, 5.7241, 5.7241, 5.7241, 0, ''),
(15, 1, 328, 328, 328, 1, 0, 665, 54, 2, 7.1981, 7.1981, 7.1981, 0, ''),
(15, 2, 301, 301, 301, 1, 326, 665, 48, 2, 6.8211, 6.8211, 6.8211, 0, ''),
(15, 4, 328, 328, 328, 1, 0, 665, 54, 2, 7.1981, 7.1981, 7.1981, 0, ''),
(15, 8, 285, 285, 285, 1, 790, 559, 22, 13, 6.3298, 6.3298, 6.3298, 0, ''),
(16, 1, 356, 356, 356, 1, 0, 700, 56, 2, 7.6697, 7.6697, 7.6697, 0, ''),
(16, 2, 325, 325, 325, 1, 357, 700, 52, 2, 7.1374, 7.1374, 7.1374, 0, ''),
(16, 4, 356, 356, 356, 1, 0, 700, 56, 2, 7.6697, 7.6697, 7.6697, 0, ''),
(16, 8, 307, 307, 307, 1, 856, 589, 24, 13, 6.6051, 6.6051, 6.6051, 0, ''),
(17, 1, 386, 386, 386, 1, 0, 734, 60, 2, 8.2225, 8.2225, 8.2225, 0, ''),
(17, 2, 350, 350, 350, 1, 390, 734, 56, 2, 7.6355, 7.6355, 7.6355, 0, ''),
(17, 4, 386, 386, 386, 1, 0, 734, 60, 2, 8.2225, 8.2225, 8.2225, 0, ''),
(17, 8, 330, 330, 330, 1, 938, 617, 26, 13, 7.0485, 7.0485, 7.0485, 0, ''),
(18, 1, 417, 417, 417, 1, 0, 768, 64, 3, 8.5452, 8.5452, 8.5452, 0, ''),
(18, 2, 377, 377, 377, 1, 408, 768, 58, 3, 8.0339, 8.0339, 8.0339, 0, ''),
(18, 4, 417, 417, 417, 1, 0, 768, 64, 3, 8.5452, 8.5452, 8.5452, 0, ''),
(18, 8, 354, 354, 354, 1, 1020, 643, 27, 13, 7.4083, 7.4083, 7.4083, 0, ''),
(19, 1, 449, 449, 449, 1, 0, 802, 68, 3, 8.9384, 8.9384, 8.9384, 0, ''),
(19, 2, 404, 404, 404, 1, 456, 802, 60, 3, 8.611, 8.611, 8.611, 0, ''),
(19, 4, 449, 449, 449, 1, 0, 802, 68, 3, 8.9384, 8.9384, 8.9384, 0, ''),
(19, 8, 379, 379, 379, 1, 1118, 674, 28, 13, 7.9333, 7.9333, 7.9333, 0, ''),
(20, 1, 484, 484, 484, 1, 0, 836, 70, 4, 9.6823, 9.6823, 9.6823, 0, ''),
(20, 2, 433, 433, 433, 1, 490, 836, 64, 4, 9.0674, 9.0674, 9.0674, 0, ''),
(20, 4, 484, 484, 484, 1, 0, 836, 70, 4, 9.6823, 9.6823, 9.6823, 0, ''),
(20, 8, 405, 405, 405, 1, 1202, 701, 30, 14, 8.3382, 8.3382, 8.3382, 0, ''),
(21, 1, 521, 521, 521, 1, 0, 872, 74, 4, 9.9677, 9.9677, 9.9677, 0, ''),
(21, 2, 464, 464, 464, 1, 510, 872, 68, 4, 9.3169, 9.3169, 9.3169, 0, ''),
(21, 4, 521, 521, 521, 1, 0, 872, 74, 4, 9.9677, 9.9677, 9.9677, 0, ''),
(21, 8, 432, 432, 432, 1, 1272, 729, 32, 14, 8.5517, 8.5517, 8.5517, 0, ''),
(22, 1, 562, 562, 562, 1, 0, 906, 78, 4, 10.4218, 10.4218, 10.4218, 0, ''),
(22, 2, 498, 498, 498, 1, 545, 906, 71, 5, 9.7945, 9.7945, 9.7945, 0, ''),
(22, 4, 562, 562, 562, 1, 0, 906, 78, 4, 10.4218, 10.4218, 10.4218, 0, ''),
(22, 8, 463, 463, 463, 1, 1357, 759, 34, 14, 8.9102, 8.9102, 8.9102, 0, ''),
(23, 1, 605, 605, 605, 1, 0, 940, 80, 5, 10.8099, 10.8099, 10.8099, 0, ''),
(23, 2, 533, 533, 533, 1, 581, 940, 74, 5, 10.076, 10.076, 10.076, 0, ''),
(23, 4, 605, 605, 605, 1, 0, 940, 80, 5, 10.8099, 10.8099, 10.8099, 0, ''),
(23, 8, 494, 494, 494, 1, 1443, 786, 35, 14, 9.228, 9.228, 9.228, 0, ''),
(24, 1, 651, 651, 651, 1, 0, 975, 84, 6, 11.2419, 11.2419, 11.2419, 0, ''),
(24, 2, 571, 571, 571, 1, 618, 975, 78, 6, 10.4619, 10.4619, 10.4619, 0, ''),
(24, 4, 651, 651, 651, 1, 0, 975, 84, 6, 11.2419, 11.2419, 11.2419, 0, ''),
(24, 8, 528, 528, 528, 1, 1545, 815, 36, 15, 9.6818, 9.6818, 9.6818, 0, ''),
(25, 1, 699, 699, 699, 1, 0, 1008, 86, 6, 11.7485, 11.7485, 11.7485, 0, ''),
(25, 2, 610, 610, 610, 1, 655, 1008, 80, 6, 10.7857, 10.7857, 10.7857, 0, ''),
(25, 4, 699, 699, 699, 1, 0, 1008, 86, 6, 11.7485, 11.7485, 11.7485, 0, ''),
(25, 8, 562, 562, 562, 1, 1633, 843, 37, 15, 10.1014, 10.1014, 10.1014, 0, ''),
(26, 1, 750, 750, 750, 1, 0, 1043, 90, 7, 12.0453, 12.0453, 12.0453, 0, ''),
(26, 2, 651, 651, 651, 1, 693, 1042, 84, 6, 11.1849, 11.1849, 11.1849, 0, ''),
(26, 4, 750, 750, 750, 1, 0, 1042, 90, 7, 12.0453, 12.0453, 12.0453, 0, ''),
(26, 8, 598, 598, 598, 1, 1707, 871, 39, 15, 10.3246, 10.3246, 10.3246, 0, ''),
(27, 1, 800, 800, 800, 1, 0, 1078, 92, 7, 12.6213, 12.6213, 12.6213, 0, ''),
(27, 2, 690, 690, 690, 1, 732, 1078, 86, 7, 11.7126, 11.7126, 11.7126, 0, ''),
(27, 4, 800, 800, 800, 1, 0, 1078, 92, 7, 12.6213, 12.6213, 12.6213, 0, ''),
(27, 8, 633, 633, 633, 1, 1812, 900, 40, 15, 10.804, 10.804, 10.804, 0, ''),
(28, 1, 853, 853, 853, 1, 0, 1111, 96, 8, 12.795, 12.795, 12.795, 0, ''),
(28, 2, 732, 732, 732, 1, 756, 1110, 90, 7, 11.9663, 11.9663, 11.9663, 0, ''),
(28, 4, 853, 853, 853, 1, 0, 1110, 96, 8, 12.795, 12.795, 12.795, 0, ''),
(28, 8, 669, 669, 669, 1, 1977, 928, 42, 15, 11.0213, 11.0213, 11.0213, 0, ''),
(29, 1, 905, 905, 905, 1, 0, 1145, 100, 8, 13.3432, 13.3432, 13.3432, 0, ''),
(29, 2, 773, 773, 773, 1, 811, 1145, 94, 8, 12.352, 12.352, 12.352, 0, ''),
(29, 4, 905, 905, 905, 1, 0, 1145, 100, 8, 13.3432, 13.3432, 13.3432, 0, ''),
(29, 8, 704, 704, 704, 1, 2068, 957, 44, 16, 11.3608, 11.3608, 11.3608, 0, ''),
(30, 1, 955, 955, 955, 1, 0, 1179, 102, 9, 13.9264, 13.9264, 13.9264, 0, ''),
(30, 2, 811, 811, 811, 1, 852, 1178, 94, 8, 13.0007, 13.0007, 13.0007, 0, ''),
(30, 4, 955, 955, 955, 1, 0, 1178, 102, 9, 13.9264, 13.9264, 13.9264, 0, ''),
(30, 8, 737, 737, 737, 1, 2175, 984, 44, 16, 11.9607, 11.9607, 11.9607, 0, ''),
(31, 1, 1006, 1006, 1006, 1, 0, 1213, 106, 9, 14.1954, 14.1954, 14.1954, 0, ''),
(31, 2, 850, 850, 850, 1, 878, 1213, 98, 9, 13.2348, 13.2348, 13.2348, 0, ''),
(31, 4, 1006, 1006, 1006, 1, 0, 1213, 106, 9, 14.1954, 14.1954, 14.1954, 0, ''),
(31, 8, 770, 770, 770, 1, 2253, 1012, 46, 16, 12.16, 12.16, 12.16, 0, ''),
(32, 1, 1057, 1057, 1057, 1, 0, 1249, 108, 10, 14.696, 14.696, 14.696, 0, ''),
(32, 2, 888, 888, 888, 1, 935, 1248, 100, 9, 13.6924, 13.6924, 13.6924, 0, ''),
(32, 4, 1057, 1057, 1057, 1, 0, 1248, 108, 10, 14.696, 14.696, 14.696, 0, ''),
(32, 8, 802, 802, 802, 1, 2362, 1042, 47, 16, 12.5746, 12.5746, 12.5746, 0, ''),
(33, 1, 1110, 1110, 1110, 1, 0, 1281, 112, 10, 14.9914, 14.9914, 14.9914, 0, ''),
(33, 2, 928, 928, 928, 1, 963, 1281, 104, 10, 13.9511, 13.9511, 13.9511, 0, ''),
(33, 4, 1110, 1110, 1110, 1, 0, 1281, 112, 10, 14.9914, 14.9914, 14.9914, 0, ''),
(33, 8, 835, 835, 835, 1, 2457, 1065, 49, 17, 12.7966, 12.7966, 12.7966, 0, ''),
(34, 1, 1163, 1163, 1163, 1, 0, 1317, 114, 11, 15.4944, 15.4944, 15.4944, 0, ''),
(34, 2, 967, 967, 967, 1, 1007, 1316, 106, 10, 14.4142, 14.4142, 14.4142, 0, ''),
(34, 4, 1163, 1163, 1163, 1, 0, 1316, 114, 11, 15.4944, 15.4944, 15.4944, 0, ''),
(34, 8, 867, 867, 867, 1, 2553, 1098, 50, 17, 13.2162, 13.2162, 13.2162, 0, ''),
(35, 1, 1220, 1220, 1220, 1, 0, 1349, 118, 11, 15.8617, 15.8617, 15.8617, 0, ''),
(35, 2, 1009, 1009, 1009, 1, 1067, 1349, 110, 11, 14.7365, 14.7365, 14.7365, 0, ''),
(35, 4, 1220, 1220, 1220, 1, 0, 1349, 118, 11, 15.8617, 15.8617, 15.8617, 0, ''),
(35, 8, 902, 902, 902, 1, 2680, 1124, 52, 17, 13.497, 13.497, 13.497, 0, ''),
(36, 1, 1277, 1277, 1277, 1, 0, 1456, 120, 12, 16.2984, 16.2984, 16.2984, 0, ''),
(36, 2, 1050, 1050, 1050, 1, 1097, 1455, 112, 11, 15.1346, 15.1346, 15.1346, 0, ''),
(36, 4, 1277, 1277, 1277, 1, 0, 1455, 120, 12, 16.2984, 16.2984, 16.2984, 0, ''),
(36, 8, 935, 935, 935, 1, 2763, 1241, 53, 18, 13.8566, 13.8566, 13.8566, 0, ''),
(37, 1, 1336, 1336, 1336, 1, 0, 1568, 124, 12, 16.7962, 16.7962, 16.7962, 0, ''),
(37, 2, 1093, 1093, 1093, 1, 1142, 1567, 116, 11, 15.5816, 15.5816, 15.5816, 0, ''),
(37, 4, 1336, 1336, 1336, 1, 0, 1567, 124, 12, 16.7962, 16.7962, 16.7962, 0, ''),
(37, 8, 970, 970, 970, 1, 2861, 1300, 54, 18, 14.367, 14.367, 14.367, 0, ''),
(38, 1, 1395, 1395, 1395, 1, 0, 1684, 128, 13, 17.1865, 17.1865, 17.1865, 0, ''),
(38, 2, 1135, 1135, 1135, 1, 1189, 1683, 120, 12, 15.9286, 15.9286, 15.9286, 0, ''),
(38, 4, 1395, 1395, 1395, 1, 0, 1683, 128, 13, 17.1865, 17.1865, 17.1865, 0, ''),
(38, 8, 1004, 1004, 1004, 1, 2975, 1391, 56, 18, 14.6707, 14.6707, 14.6707, 0, ''),
(39, 1, 1459, 1459, 1459, 1, 0, 1808, 132, 13, 17.7286, 17.7286, 17.7286, 0, ''),
(39, 2, 1180, 1180, 1180, 1, 1236, 1807, 124, 12, 16.4168, 16.4168, 16.4168, 0, ''),
(39, 4, 1459, 1459, 1459, 1, 0, 1807, 132, 13, 17.7286, 17.7286, 17.7286, 0, ''),
(39, 8, 1040, 1040, 1040, 1, 3075, 1489, 58, 18, 15.1049, 15.1049, 15.1049, 0, ''),
(40, 1, 1524, 1524, 1524, 1, 0, 1938, 136, 14, 18.2971, 18.2971, 18.2971, 0, ''),
(40, 2, 1226, 1226, 1226, 1, 1283, 1937, 128, 13, 16.9294, 16.9294, 16.9294, 0, ''),
(40, 4, 1524, 1524, 1524, 1, 0, 1937, 136, 14, 18.2971, 18.2971, 18.2971, 0, ''),
(40, 8, 1077, 1077, 1077, 1, 3191, 1590, 60, 19, 15.5617, 15.5617, 15.5617, 0, ''),
(41, 1, 1585, 1585, 1585, 1, 0, 2074, 142, 15, 19.1997, 19.1997, 19.1997, 0, ''),
(41, 2, 1268, 1268, 1268, 1, 1332, 2072, 132, 13, 17.8592, 17.8592, 17.8592, 0, ''),
(41, 4, 1585, 1585, 1585, 1, 0, 2072, 142, 15, 19.1997, 19.1997, 19.1997, 0, ''),
(41, 8, 1110, 1110, 1110, 1, 3293, 1697, 62, 19, 16.4044, 16.4044, 16.4044, 0, ''),
(42, 1, 1651, 1651, 1651, 1, 0, 2218, 152, 15, 20.3431, 20.3431, 20.3431, 0, ''),
(42, 2, 1321, 1321, 1321, 1, 1381, 2216, 142, 13, 18.8824, 18.8824, 18.8824, 0, ''),
(42, 4, 1651, 1651, 1651, 1, 0, 2216, 152, 15, 20.3431, 20.3431, 20.3431, 0, ''),
(42, 8, 1156, 1156, 1156, 1, 3471, 1811, 67, 19, 17.3076, 17.3076, 17.3076, 0, ''),
(43, 1, 1716, 1716, 1716, 1, 0, 2369, 162, 16, 21.7088, 21.7088, 21.7088, 0, ''),
(43, 2, 1373, 1373, 1373, 1, 1432, 2367, 152, 14, 20.1127, 20.1127, 20.1127, 0, ''),
(43, 4, 1716, 1716, 1716, 1, 0, 2367, 162, 16, 21.7088, 21.7088, 21.7088, 0, ''),
(43, 8, 1201, 1201, 1201, 1, 3575, 1926, 71, 19, 18.5165, 18.5165, 18.5165, 0, ''),
(44, 1, 1782, 1782, 1782, 1, 0, 2528, 174, 16, 23.5881, 23.5881, 23.5881, 0, ''),
(44, 2, 1426, 1426, 1426, 1, 1483, 2527, 166, 15, 21.6981, 21.6981, 21.6981, 0, ''),
(44, 4, 1782, 1782, 1782, 1, 0, 2527, 174, 16, 23.5881, 23.5881, 23.5881, 0, ''),
(44, 8, 1247, 1247, 1247, 1, 3680, 2078, 78, 20, 19.9224, 19.9224, 19.9224, 0, ''),
(45, 1, 1848, 1848, 1848, 1, 0, 2695, 184, 17, 24.6797, 24.6797, 24.6797, 0, ''),
(45, 2, 1478, 1478, 1478, 1, 1534, 2692, 172, 15, 22.9018, 22.9018, 22.9018, 0, ''),
(45, 4, 1848, 1848, 1848, 1, 0, 2692, 184, 17, 24.6797, 24.6797, 24.6797, 0, ''),
(45, 8, 1294, 1294, 1294, 1, 3801, 2177, 81, 20, 21.0097, 21.0097, 21.0097, 0, ''),
(46, 1, 1919, 1919, 1919, 1, 0, 2750, 188, 17, 25.1735, 25.1735, 25.1735, 0, ''),
(46, 2, 1535, 1535, 1535, 1, 1587, 2749, 176, 16, 23.3451, 23.3451, 23.3451, 0, ''),
(46, 4, 1919, 1919, 1919, 1, 0, 2749, 188, 17, 25.1735, 25.1735, 25.1735, 0, ''),
(46, 8, 1343, 1343, 1343, 1, 3923, 2220, 83, 20, 21.4023, 21.4023, 21.4023, 0, ''),
(47, 1, 1990, 1990, 1990, 1, 0, 2804, 192, 18, 25.7137, 25.7137, 25.7137, 0, ''),
(47, 2, 1592, 1592, 1592, 1, 1640, 2802, 180, 16, 23.9542, 23.9542, 23.9542, 0, ''),
(47, 4, 1990, 1990, 1990, 1, 0, 2802, 192, 18, 25.7137, 25.7137, 25.7137, 0, ''),
(47, 8, 1393, 1393, 1393, 1, 4031, 2265, 85, 21, 21.9484, 21.9484, 21.9484, 0, ''),
(48, 1, 2062, 2062, 2062, 1, 0, 2857, 196, 19, 26.209, 26.209, 26.209, 0, ''),
(48, 2, 1650, 1650, 1650, 1, 1695, 2855, 184, 17, 24.401, 24.401, 24.401, 0, ''),
(48, 4, 2062, 2062, 2062, 1, 0, 2855, 196, 19, 26.209, 26.209, 26.209, 0, ''),
(48, 8, 1443, 1443, 1443, 1, 4140, 2307, 87, 21, 22.3444, 22.3444, 22.3444, 0, ''),
(49, 1, 2138, 2138, 2138, 1, 0, 2912, 200, 19, 26.9952, 26.9952, 26.9952, 0, ''),
(49, 2, 1710, 1710, 1710, 1, 1750, 2910, 188, 17, 24.9975, 24.9975, 24.9975, 0, ''),
(49, 4, 2138, 2138, 2138, 1, 0, 2910, 200, 19, 26.9952, 26.9952, 26.9952, 0, ''),
(49, 8, 1497, 1497, 1497, 1, 4281, 2349, 89, 21, 22.8788, 22.8788, 22.8788, 0, ''),
(50, 1, 2215, 2215, 2215, 1, 0, 2966, 206, 20, 27.5899, 27.5899, 27.5899, 0, ''),
(50, 2, 1772, 1772, 1772, 1, 1807, 2964, 194, 18, 25.5204, 25.5204, 25.5204, 0, ''),
(50, 4, 2215, 2215, 2215, 1, 0, 2964, 206, 20, 27.5899, 27.5899, 27.5899, 0, ''),
(50, 8, 1551, 1551, 1551, 1, 4393, 2393, 91, 22, 23.4508, 23.4508, 23.4508, 0, ''),
(51, 1, 2292, 2292, 2292, 1, 0, 3018, 210, 20, 28.128, 28.128, 28.128, 0, ''),
(51, 2, 1834, 1834, 1834, 1, 1864, 3017, 198, 19, 26.0047, 26.0047, 26.0047, 0, ''),
(51, 4, 2292, 2292, 2292, 1, 0, 3017, 210, 20, 28.128, 28.128, 28.128, 0, ''),
(51, 8, 1604, 1604, 1604, 1, 4506, 2437, 93, 22, 23.8815, 23.8815, 23.8815, 0, ''),
(52, 1, 2371, 2371, 2371, 1, 0, 3074, 214, 21, 28.8795, 28.8795, 28.8795, 0, ''),
(52, 2, 1897, 1897, 1897, 1, 1923, 3072, 202, 19, 26.6877, 26.6877, 26.6877, 0, ''),
(52, 4, 2371, 2371, 2371, 1, 0, 3072, 214, 21, 28.8795, 28.8795, 28.8795, 0, ''),
(52, 8, 1660, 1660, 1660, 1, 4650, 2481, 95, 22, 24.4958, 24.4958, 24.4958, 0, ''),
(53, 1, 2453, 2453, 2453, 1, 0, 3128, 218, 22, 29.4381, 29.4381, 29.4381, 0, ''),
(53, 2, 1962, 1962, 1962, 1, 1982, 3126, 206, 20, 27.1912, 27.1912, 27.1912, 0, ''),
(53, 4, 2453, 2453, 2453, 1, 0, 3126, 218, 22, 29.4381, 29.4381, 29.4381, 0, ''),
(53, 8, 1717, 1717, 1717, 1, 4765, 2524, 97, 23, 24.9442, 24.9442, 24.9442, 0, ''),
(54, 1, 2533, 2533, 2533, 1, 0, 3180, 224, 22, 30.0501, 30.0501, 30.0501, 0, ''),
(54, 2, 2026, 2026, 2026, 1, 2041, 3178, 210, 20, 27.8506, 27.8506, 27.8506, 0, ''),
(54, 4, 2533, 2533, 2533, 1, 0, 3178, 224, 22, 30.0501, 30.0501, 30.0501, 0, ''),
(54, 8, 1773, 1773, 1773, 1, 4896, 2567, 99, 23, 25.5368, 25.5368, 25.5368, 0, ''),
(55, 1, 2614, 2614, 2614, 1, 0, 3234, 228, 23, 30.7177, 30.7177, 30.7177, 0, ''),
(55, 2, 2091, 2091, 2091, 1, 2117, 3232, 214, 21, 28.4555, 28.4555, 28.4555, 0, ''),
(55, 4, 2614, 2614, 2614, 1, 0, 3232, 228, 23, 30.7177, 30.7177, 30.7177, 0, ''),
(55, 8, 1830, 1830, 1830, 1, 5013, 2609, 101, 23, 26.079, 26.079, 26.079, 0, ''),
(56, 1, 2699, 2699, 2699, 1, 0, 3289, 234, 23, 31.2387, 31.2387, 31.2387, 0, ''),
(56, 2, 2159, 2159, 2159, 1, 2163, 3287, 220, 21, 28.9161, 28.9161, 28.9161, 0, ''),
(56, 4, 2699, 2699, 2699, 1, 0, 3287, 234, 23, 31.2387, 31.2387, 31.2387, 0, ''),
(56, 8, 1889, 1889, 1889, 1, 5206, 2654, 104, 24, 26.4791, 26.4791, 26.4791, 0, ''),
(57, 1, 2784, 2784, 2784, 1, 0, 3342, 238, 24, 31.945, 31.945, 31.945, 0, ''),
(57, 2, 2227, 2227, 2227, 1, 2241, 3340, 224, 22, 29.5701, 29.5701, 29.5701, 0, ''),
(57, 4, 2784, 2784, 2784, 1, 0, 3340, 238, 24, 31.945, 31.945, 31.945, 0, ''),
(57, 8, 1949, 1949, 1949, 1, 5340, 2698, 106, 24, 27.0667, 27.0667, 27.0667, 0, ''),
(58, 1, 2871, 3989, 3989, 1, 0, 3396, 242, 25, 32.5967, 40.2143, 40.2143, 0, ''),
(58, 2, 2297, 3191, 3191, 1, 2289, 3394, 228, 23, 30.1469, 34.7143, 34.7143, 0, ''),
(58, 4, 2871, 3989, 3989, 1, 0, 3394, 242, 25, 32.5967, 40.2143, 40.2143, 0, ''),
(58, 8, 2010, 2793, 2793, 1, 5461, 2740, 107, 24, 27.6972, 37.4048, 37.4048, 0, ''),
(59, 1, 2961, 4142, 4142, 1, 0, 3449, 248, 25, 33.2007, 43.2857, 43.2857, 0, ''),
(59, 2, 2369, 3314, 3314, 1, 2369, 3447, 234, 23, 30.6847, 49.6442, 49.6442, 0, ''),
(59, 4, 2961, 4142, 4142, 1, 0, 3447, 248, 25, 33.2007, 43.2857, 43.2857, 0, ''),
(59, 8, 2073, 2899, 2899, 1, 5598, 2784, 110, 25, 28.1686, 46.5537, 46.5537, 0, ''),
(60, 1, 3052, 4979, 4979, 1, 0, 3750, 252, 26, 33.9625, 53.4755, 53.4755, 0, ''),
(60, 2, 2442, 3984, 3984, 1, 2434, 3748, 238, 24, 31.3842, 55, 55, 0, ''),
(60, 4, 3052, 4979, 4979, 1, 0, 3748, 252, 26, 33.9625, 53.4755, 53.4755, 0, ''),
(60, 8, 2136, 3484, 3484, 1, 5751, 3025, 112, 25, 28.7983, 50.396, 50.396, 0, ''),
(61, 1, 3144, 5158, 5158, 1, 0, 4047, 258, 28, 34.5714, 61.2729, 61.2729, 0, ''),
(61, 2, 2515, 4126, 4126, 1, 2486, 4044, 244, 25, 31.837, 58.3279, 58.3279, 0, ''),
(61, 4, 3144, 5158, 5158, 1, 0, 4044, 258, 28, 34.5714, 61.2729, 61.2729, 0, ''),
(61, 8, 2201, 3611, 3611, 1, 5875, 3263, 115, 25, 29.3225, 53.4807, 53.4807, 0, ''),
(62, 1, 3237, 5341, 5341, 1, 0, 4344, 262, 30, 35.2381, 67.4442, 67.4442, 0, ''),
(62, 2, 2590, 4274, 4274, 1, 2568, 4340, 246, 26, 32.6201, 62.4676, 62.4676, 0, ''),
(62, 4, 3237, 5341, 5341, 1, 0, 4340, 262, 30, 35.2381, 67.4442, 67.4442, 0, ''),
(62, 8, 2266, 3739, 3739, 1, 6015, 3500, 116, 25, 29.917, 57.2713, 57.2713, 0, ''),
(63, 1, 3331, 5527, 5527, 1, 0, 4641, 268, 32, 35.775, 71.4361, 71.4361, 0, ''),
(63, 2, 2665, 4422, 4422, 1, 2620, 4637, 252, 27, 33.1092, 66.121, 66.121, 0, ''),
(63, 4, 3331, 5527, 5527, 1, 0, 4637, 268, 32, 35.9047, 71.4361, 71.4361, 0, ''),
(63, 8, 2332, 3870, 3870, 1, 6156, 3736, 119, 26, 30.4646, 60.577, 60.577, 0, ''),
(64, 1, 3427, 5715, 5715, 1, 0, 4937, 272, 33, 36.5714, 75.9334, 75.9334, 0, ''),
(64, 2, 2740, 4572, 4572, 1, 2705, 4932, 256, 28, 33.7143, 70.2568, 70.2568, 0, ''),
(64, 4, 3427, 5715, 5715, 1, 0, 4932, 272, 33, 36.5714, 75.9334, 75.9334, 0, ''),
(64, 8, 2399, 4002, 4002, 1, 6299, 3977, 121, 26, 31.0435, 64.089, 64.089, 0, ''),
(65, 1, 3524, 5914, 5914, 1, 0, 5234, 278, 35, 37.2381, 80.3794, 80.3794, 0, ''),
(65, 2, 2819, 4731, 4731, 1, 2790, 5228, 262, 29, 34.3333, 74.3252, 74.3252, 0, ''),
(65, 4, 3524, 5914, 5914, 1, 0, 5228, 278, 35, 37.2381, 80.3794, 80.3794, 0, ''),
(65, 8, 2467, 4140, 4731, 1, 6443, 4214, 124, 26, 31.6015, 68.0244, 69.9742, 0, ''),
(66, 1, 3624, 6116, 6116, 1, 0, 5531, 282, 37, 37.9047, 84.8941, 84.8941, 0, ''),
(66, 2, 2899, 4892, 6116, 1, 2846, 5523, 266, 29, 35.0158, 78.472, 84.8941, 0, ''),
(66, 4, 3624, 6116, 6116, 1, 0, 5523, 282, 37, 37.9047, 84.8941, 84.8941, 0, ''),
(66, 8, 2552, 4281, 4892, 1, 6588, 4460, 125, 27, 32.1734, 72.0499, 78.8784, 0, ''),
(67, 1, 3728, 6326, 6326, 1, 0, 5829, 288, 39, 38.5714, 89.6211, 94.901, 0, ''),
(67, 2, 2982, 5060, 6326, 1, 2933, 5821, 272, 31, 35.656, 82.7944, 94.901, 0, ''),
(67, 4, 3728, 6326, 6326, 1, 0, 5821, 288, 39, 38.5714, 89.6211, 94.901, 0, ''),
(67, 8, 2610, 4429, 5060, 1, 6749, 4710, 128, 27, 32.736, 75.9676, 87.7826, 0, ''),
(68, 1, 3834, 6542, 6986, 1, 0, 6126, 292, 41, 39.2381, 94.4934, 104.527, 0, ''),
(68, 2, 3067, 5233, 6986, 1, 2991, 6116, 276, 31, 36.3244, 87.2677, 104.527, 0, ''),
(68, 4, 3834, 6542, 6986, 1, 0, 6116, 292, 41, 39.2381, 94.4934, 104.527, 0, ''),
(68, 8, 2684, 4580, 5588, 1, 6882, 4928, 130, 27, 33.3048, 80.1061, 96.6868, 0, ''),
(69, 1, 3942, 6761, 7984, 1, 0, 6423, 298, 43, 39.9047, 99.5328, 114.153, 0, ''),
(69, 2, 3153, 5409, 7984, 1, 3080, 6412, 282, 32, 36.974, 91.8916, 114.153, 0, ''),
(69, 4, 3942, 6761, 7984, 1, 0, 6412, 298, 43, 39.9047, 99.5328, 114.153, 0, ''),
(69, 8, 2759, 4733, 6387, 1, 7031, 5167, 133, 28, 33.8695, 84.2722, 105.591, 0, ''),
(70, 1, 4050, 6986, 8982, 1, 0, 6719, 304, 44, 40.5714, 104.527, 123.779, 0, ''),
(70, 2, 3240, 5589, 8982, 1, 3155, 6708, 286, 33, 37.6361, 96.7364, 123.779, 0, ''),
(70, 4, 4050, 6986, 8982, 1, 0, 6708, 304, 44, 40.5714, 104.527, 123.779, 0, ''),
(70, 8, 2835, 4890, 7185, 1, 7196, 5404, 135, 28, 34.4369, 88.3402, 114.496, 0, ''),
(71, 1, 4163, 7181, 9291, 1, 0, 7018, 308, 48, 41.2381, 106.357, 127.382, 0, ''),
(71, 2, 3330, 5744, 9291, 1, 3231, 7007, 290, 37, 38.2899, 98.3977, 127.383, 0, ''),
(71, 4, 4163, 7181, 9291, 1, 0, 7007, 308, 48, 41.2381, 106.357, 127.382, 0, ''),
(71, 8, 2914, 5027, 7432, 1, 7332, 5645, 137, 31, 35.0025, 92.4034, 117.829, 0, ''),
(72, 1, 4278, 7380, 9610, 1, 0, 7318, 314, 53, 41.9047, 108.071, 131.091, 0, ''),
(72, 2, 3422, 5903, 9610, 1, 3309, 7305, 296, 40, 38.9492, 99.8571, 131.092, 0, ''),
(72, 4, 4278, 7380, 9610, 1, 0, 7305, 314, 53, 41.9047, 108.071, 131.091, 0, ''),
(72, 8, 2995, 5166, 7688, 1, 7500, 5886, 140, 34, 35.5693, 96.5068, 121.259, 0, ''),
(73, 1, 4399, 7588, 9940, 1, 0, 7618, 320, 58, 42.5714, 118.643, 134.908, 0, ''),
(73, 2, 3519, 6070, 9940, 1, 3387, 7604, 302, 44, 39.6048, 101.451, 134.908, 0, ''),
(73, 4, 4399, 7588, 9940, 1, 0, 7604, 320, 58, 42.5714, 118.643, 134.908, 0, ''),
(73, 8, 3098, 5311, 7952, 1, 7654, 6126, 143, 37, 36.1353, 100.617, 124.79, 0, ''),
(74, 1, 4524, 7804, 10282, 1, 0, 7918, 354, 63, 43.2381, 120.434, 138.836, 0, ''),
(74, 2, 3619, 6243, 10282, 1, 3466, 7903, 334, 48, 40.2629, 102.955, 138.836, 0, ''),
(74, 4, 4524, 7804, 10282, 1, 0, 7903, 354, 63, 43.2381, 120.434, 138.836, 0, ''),
(74, 8, 3186, 5461, 8225, 1, 7809, 6368, 158, 41, 36.7018, 104.723, 128.423, 0, ''),
(75, 1, 4652, 8025, 10635, 1, 0, 8219, 392, 68, 43.9047, 122.226, 142.878, 0, ''),
(75, 2, 3722, 6420, 10635, 1, 3561, 8204, 370, 53, 40.9193, 104.52, 142.878, 0, ''),
(75, 4, 4652, 8025, 10635, 1, 0, 8204, 392, 68, 43.9047, 122.226, 142.878, 0, ''),
(75, 8, 3256, 5617, 8508, 1, 7981, 6610, 175, 45, 37.268, 108.832, 132.162, 0, ''),
(76, 1, 4781, 8247, 11001, 1, 0, 8520, 432, 74, 44.5713, 124.018, 147.038, 0, ''),
(76, 2, 3825, 6602, 11001, 1, 3643, 8503, 408, 57, 41.5757, 106.085, 147.038, 0, ''),
(76, 4, 4781, 8247, 11001, 1, 0, 8503, 432, 74, 44.5713, 124.018, 147.038, 0, ''),
(76, 8, 3367, 5778, 8800, 1, 8139, 6851, 193, 49, 37.8342, 112.941, 136.01, 0, ''),
(77, 1, 4916, 8480, 11379, 1, 0, 8822, 478, 81, 45.2379, 125.81, 151.319, 0, ''),
(77, 2, 3933, 6784, 11379, 1, 3725, 8803, 452, 62, 42.2321, 107.65, 151.319, 0, ''),
(77, 4, 4916, 8480, 11379, 1, 0, 8803, 478, 81, 45.2379, 125.81, 151.319, 0, ''),
(77, 8, 3462, 5945, 9103, 1, 8313, 7094, 214, 54, 38.4004, 117.05, 139.97, 0, ''),
(78, 1, 5052, 8715, 11770, 1, 0, 9124, 528, 88, 45.9045, 127.602, 155.724, 0, ''),
(78, 2, 4042, 6972, 11770, 1, 3809, 9104, 500, 68, 42.8885, 109.215, 155.724, 0, ''),
(78, 4, 5052, 8715, 11770, 1, 0, 9104, 528, 88, 45.9045, 127.602, 155.724, 0, ''),
(78, 8, 3558, 6117, 9416, 1, 8459, 7335, 236, 58, 38.9666, 121.159, 144.045, 0, ''),
(79, 1, 5194, 8960, 12175, 1, 0, 9426, 582, 95, 46.5711, 129.394, 160.258, 0, ''),
(79, 2, 4155, 7167, 12175, 1, 3893, 9405, 550, 74, 43.5449, 110.78, 160.258, 0, ''),
(79, 4, 5194, 8960, 12175, 1, 0, 9405, 582, 95, 46.5711, 129.394, 160.258, 0, ''),
(79, 8, 3658, 6295, 9740, 1, 8636, 7579, 260, 64, 39.5328, 125.268, 148.239, 0, ''),
(80, 1, 5342, 9215, 12600, 1, 0, 9729, 642, 103, 47.2377, 131.186, 164.924, 0, ''),
(80, 2, 4274, 7373, 12600, 1, 3994, 9706, 608, 80, 44.2013, 112.345, 164.924, 0, ''),
(80, 4, 5342, 9215, 12600, 1, 0, 9706, 642, 103, 47.2377, 131.186, 164.924, 0, ''),
(80, 8, 3739, 6478, 10080, 1, 8814, 7822, 287, 69, 40.099, 129.377, 152.555, 0, ''),
(81, 1, 5492, 9474, 13033, 37187, 0, 10033, 708, 112, 46.0057, 0, 168.974, 197.377, ''),
(81, 2, 4394, 7581, 13033, 37187, 4081, 10007, 670, 86, 43.9107, 0, 169.095, 195.237, ''),
(81, 4, 5496, 1, 13033, 37187, 0, 9068, 708, 112, 46.0057, 0, 168.974, 191.179, ''),
(81, 8, 3870, 1, 10486, 29750, 8979, 8102, 304, 74, 39.2836, 0, 157.584, 183.236, ''),
(82, 1, 5647, 9741, 13481, 44679, 0, 10356, 782, 121, 46.5937, 0, 173.024, 197.377, ''),
(82, 2, 4518, 7794, 13481, 44679, 4169, 10253, 726, 91, 44.5072, 0, 173.266, 195.237, ''),
(82, 4, 5647, 1, 13481, 44679, 0, 9348, 782, 121, 46.5937, 0, 173.024, 191.179, ''),
(82, 8, 3977, 1, 10784, 35743, 9160, 8340, 326, 79, 39.7829, 0, 162.257, 183.236, ''),
(83, 1, 5808, 10019, 13945, 53681, 0, 10643, 805, 135, 47.1817, 0, 177.074, 197.377, ''),
(83, 2, 4646, 1, 13945, 53681, 4258, 10643, 783, 98, 45.1037, 0, 177.438, 195.237, ''),
(83, 4, 5808, 1, 13945, 53681, 0, 9589, 805, 135, 47.1817, 0, 177.074, 191.179, ''),
(83, 8, 4090, 1, 11156, 42945, 9328, 8505, 343, 84, 40.2822, 0, 167.286, 183.236, ''),
(84, 1, 5971, 10300, 14409, 64496, 0, 10099, 930, 149, 47.7697, 171.348, 181.124, 197.377, ''),
(84, 2, 4774, 8220, 14409, 64496, 4363, 10893, 840, 105, 45.7002, 156.476, 181.61, 195.237, ''),
(84, 4, 5969, 9780, 14409, 64496, 0, 9830, 828, 149, 47.7697, 171.348, 181.124, 191.179, ''),
(84, 8, 4203, 6906, 11528, 51597, 9512, 8670, 360, 89, 40.7815, 142.154, 172.315, 183.236, ''),
(85, 1, 6141, 10595, 14873, 77490, 0, 10419, 1004, 163, 48.3577, 176.134, 185.174, 197.377, ''),
(85, 2, 4902, 8433, 14873, 77490, 4454, 11213, 897, 112, 46.2967, 160.743, 185.782, 195.237, ''),
(85, 4, 6130, 9980, 14873, 77490, 0, 10071, 851, 163, 48.3577, 176.134, 185.174, 191.179, ''),
(85, 8, 4316, 7051, 11900, 61992, 9697, 8835, 377, 94, 41.2808, 146.035, 177.344, 183.236, ''),
(86, 1, 6306, 10890, 15337, 80195, 0, 10470, 1078, 177, 48.9457, 180.92, 189.224, 217.475, ''),
(86, 2, 5030, 8646, 15337, 80195, 4502, 11533, 954, 119, 46.8932, 165.01, 189.954, 215.339, ''),
(86, 4, 6291, 10180, 15337, 80195, 0, 10312, 874, 177, 48.9457, 180.92, 189.224, 211.376, ''),
(86, 8, 4429, 7196, 12272, 86077, 9873, 9000, 394, 99, 41.7801, 149.915, 182.373, 203.275, ''),
(87, 1, 6472, 11185, 15801, 82994, 0, 10522, 1152, 191, 49.5337, 185.706, 193.274, 217.475, ''),
(87, 2, 5158, 8859, 15801, 82994, 4655, 11853, 1011, 126, 47.4897, 169.277, 194.126, 215.339, ''),
(87, 4, 6452, 10380, 15801, 82994, 0, 10553, 897, 191, 49.5337, 185.706, 193.274, 211.376, ''),
(87, 8, 4542, 7341, 12644, 107596, 10052, 9165, 411, 104, 42.2794, 153.796, 187.402, 203.275, ''),
(88, 1, 6639, 11480, 16265, 85892, 0, 11977, 1226, 205, 50.1217, 190.492, 197.324, 217.475, ''),
(88, 2, 5286, 9072, 16265, 85892, 4735, 11977, 1068, 133, 48.0862, 173.544, 198.298, 215.339, ''),
(88, 4, 6613, 10580, 16265, 85892, 0, 11977, 920, 205, 50.1217, 190.492, 197.324, 211.376, ''),
(88, 8, 4655, 7486, 13016, 68714, 10232, 11977, 428, 109, 42.7787, 157.677, 192.431, 203.275, ''),
(89, 1, 6806, 15075, 16735, 107596, 0, 1, 0, 0, 0, 0, 0, 217.475, ''),
(89, 2, 5414, 9285, 16729, 107596, 5502, 1, 0, 0, 0, 0, 0, 215.339, ''),
(89, 4, 6774, 10780, 16729, 107596, 0, 1, 0, 0, 0, 0, 0, 211.376, ''),
(89, 8, 4768, 7631, 13388, 107596, 10052, 1, 0, 0, 0, 0, 0, 203.275, ''),
(90, 1, 6971, 15370, 17205, 107596, 0, 1, 0, 0, 0, 0, 0, 217.475, ''),
(90, 2, 5542, 9498, 17193, 107596, 5502, 1, 0, 0, 0, 0, 0, 215.339, ''),
(90, 4, 6935, 10980, 17193, 107596, 0, 1, 0, 0, 0, 0, 0, 211.376, ''),
(90, 8, 4881, 7776, 13760, 107596, 10052, 1, 0, 0, 0, 0, 0, 203.275, '');

UPDATE `creature_template` SET `exp`=2, `HealthModifierExtra`=2 WHERE `entry`=44120;
UPDATE `creature_template` SET `exp`=2, `minlevel`=50, `maxlevel`=50 WHERE `entry` IN (8670, 8719, 15659, 43690);

UPDATE `creature_template` SET `ScriptName` = 'npc_sanitron500' WHERE `entry` = 46185;
DELETE FROM `creature_template_movement` WHERE `CreatureId` = 46185; -- Make Sanitron 500 able to Fly
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`, `InteractionPauseTimer`) VALUES
(46185, 1, 1, 1, 0, 0,NULL);

UPDATE `creature_template` SET `npcflag` = 2 WHERE `entry` = 37106;
UPDATE `creature_template` SET `vehicleId` = 582, `IconName` = "vehichleCursor" WHERE `entry`= 37179;
UPDATE `creature_template` SET `vehicleId` = 116, `IconName` = "vehichleCursor" WHERE `entry`= 37213;

UPDATE `quest_template_addon` SET `ScriptName`="quest_fourth_and_goal" WHERE `ID` IN (28414);
UPDATE `creature_template` SET `ScriptName`="npc_coach_crosscheck" WHERE `entry` = 37106;
UPDATE `creature_template` SET `ScriptName`="npc_bucanneer_gob" WHERE `entry` IN (37179, 37213);
UPDATE `creature_template` SET `ScriptName`="npc_shark_gob" WHERE `entry` = 37114;
UPDATE `creature_template` SET `ScriptName`="npc_fourth_and_goal_target" WHERE `entry` = 37203;
UPDATE `creature_template` SET `ScriptName`="npc_fourth_and_goal_deathwing" WHERE `entry` = 48572;


