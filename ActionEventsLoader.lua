
--[[
ActionEvents = {}


ActionEvents.basicEvents = {
	---Open and close HUD:
	["COURSEPLAY_ACTION_OPEN_CLOSE_HUD"] = { 
		ActionEvents.actionEventOpenCloseHud,
		nil,
		"COURSEPLAY_ACTION_OPEN_CLOSE_HUD"},
--	["Open/Close HUD with key"] : { "actionEventOpenCloseHudWithKey() ", "is deactivated function or something" , "COURSEPLAY_HUD_KEY" },
	---Switch to next or previous driver mode:
	["COURSEPLAY_ACTION_NEXT_DRIVER_MODE"] = { 
		ActionEvents.actionEventNextDriverMode,
		ActionEvents.isActionEventsChangeDriverModeDisabled,
		"COURSEPLAY_ACTION_NEXT_DRIVER_MODE"},
	["COURSEPLAY_ACTION_PREVIOUS_DRIVER_MODE"] = {
		ActionEvents.actionEventPreviousDriverMode,
		ActionEvents.isActionEventsChangeDriverModeDisabled,
		"COURSEPLAY_ACTION_PREVIOUS_DRIVER_MODE"},
	---Switch to next or previous hud page:
	["COURSEPLAY_ACTION_NEXT_HUD_PAGE"] = {
		ActionEvents.actionEventNextHudPage,
		ActionEvents.isActionEventsChangeHudPageDisabled,
		"COURSEPLAY_ACTION_NEXT_HUD_PAGE"},
	["COURSEPLAY_ACTION_PREVIOUS_HUD_PAGE"] = {
		ActionEvents.actionEventPreviousHudPage,
		ActionEvents.isActionEventsChangeHudPageDisabled,
		"COURSEPLAY_ACTION_PREVIOUS_HUD_PAGE"},
	---Recording action events:
	["COURSEPLAY_ACTION_START_STOP_RECORDING"] = {
		ActionEvents.actionEventStartStopRecording,
		ActionEvents.isActionEventStartStopRecordingDisabled,
		"COURSEPLAY_ACTION_START_STOP_RECORDING"},
	["COURSEPLAY_ACTION_PAUSE_RECORDING"] = {
		ActionEvents.actionEventPauseRecording,
		ActionEvents.isActionEventPauseRecordingDisabled,
		"COURSEPLAY_ACTION_PAUSE_RECORDING"},
	["COURSEPLAY_ACTION_TOGGLE_REVERSE_RECORDING"] = {
		ActionEvents.actionEventToggleReverseRecording,
		ActionEvents.isActionEventToggleReverseRecordingDisabled,
		"COURSEPLAY_ACTION_TOGGLE_REVERSE_RECORDING"},
	---Start or stop Driver:
	["COURSEPLAY_ACTION_START_STOP_DRIVING"] = {
		ActionEvents.actionEventStartStopDriving,
		ActionEvents.isActionEventStartStopDrivingDisabled,
		"COURSEPLAY_ACTION_START_STOP_DRIVING"},
	---Drive now:	
	["COURSEPLAY_ACTION_DRIVE_NOW"] = {
		ActionEvents.actionEventDriveNow,
		ActionEvents.isActionEventDriveNowDisabled,
		"COURSEPLAY_ACTION_DRIVE_NOW"},
}

---
	
ActionEvents.settingsEvents = {	
	
	---Changes the starting point for the driver
	["COURSEPLAY_ACTION_CHANGE_STARTING_POINT"] = {
		"startingPoint",
		"COURSEPLAY_ACTION_CHANGE_STARTING_POINT"},
	
	---Shovel positions
	["COURSEPLAY_ACTION_DRIVE_NOW"] = {
		ActionEvents.actionEventDriveNow,
		ActionEvents.isActionEventDriveNowDisabled,
		"COURSEPLAY_ACTION_DRIVE_NOW"},





	["Toggle start at"] : { "actionEventToggleStartAt() ", "is deactivated function or something" , "COURSEPLAY_TOGGLE_START" },
	---Shovel Control: Deactivate when no shovel position is saved ?
	["Shovel loading position"] : { "actionEventShovelLoadingPosition() ", "is deactivated function or something" , "COURSEPLAY_SHOVEL_MOVE_TO_LOADING_POSITION" },
	["Shovel transport position"] : { "actionEventShovelTransportPosition() ", "is deactivated function or something" , "COURSEPLAY_SHOVEL_MOVE_TO_TRANSPORT_POSITION" },
	["Shovel preUnload position"] : { "actionEventShovelPreUnloadPosition() ", "is deactivated function or something" , "COURSEPLAY_SHOVEL_MOVE_TO_PRE_UNLOADING_POSITION" },
	["Shovel unload position"] : { "actionEventShovelUnloadPosition() ", "is deactivated function or something" , "COURSEPLAY_SHOVEL_MOVE_TO_UNLOADING_POSITION" },
	}

}

ActionEvents.editorEvents = {	
	---Editor:
	---Turn the editor on or off:	
	["COURSEPLAY_ACTION_EDITOR_TOGGLE"] = {
		ActionEvents.actionEventToggleEditor,
		ActionEvents.isActionEventToggleEditorDisabled,
		"COURSEPLAY_ACTION_EDITOR_TOGGLE"},
	---Turn the editor on or off:	
	["COURSEPLAY_ACTION_EDITOR_UNDO"] = {
		ActionEvents.actionEventToggleEditor,
		ActionEvents.isActionEventToggleEditorDisabled,
		"COURSEPLAY_ACTION_EDITOR_UNDO"},
	---Turn the editor on or off:	
	["COURSEPLAY_ACTION_EDITOR_UNDO"] = {
		ActionEvents.actionEventToggleEditor,
		ActionEvents.isActionEventToggleEditorDisabled,
		"COURSEPLAY_ACTION_TOGGLE_EDITOR"},
	---Turn the editor on or off:	
	["COURSEPLAY_ACTION_TOGGLE_EDITOR"] = {
		ActionEvents.actionEventToggleEditor,
		ActionEvents.isActionEventToggleEditorDisabled,
		"COURSEPLAY_ACTION_TOGGLE_EDITOR"},
	---Turn the editor on or off:	
	["COURSEPLAY_ACTION_TOGGLE_EDITOR"] = {
		ActionEvents.actionEventToggleEditor,
		ActionEvents.isActionEventToggleEditorDisabled,
		"COURSEPLAY_ACTION_TOGGLE_EDITOR"},
	---Turn the editor on or off:	
	["COURSEPLAY_ACTION_TOGGLE_EDITOR"] = {
		ActionEvents.actionEventToggleEditor,
		ActionEvents.isActionEventToggleEditorDisabled,
		"COURSEPLAY_ACTION_TOGGLE_EDITOR"},
	---Turn the editor on or off:	
	["COURSEPLAY_ACTION_TOGGLE_EDITOR"] = {
		ActionEvents.actionEventToggleEditor,
		ActionEvents.isActionEventToggleEditorDisabled,
		"COURSEPLAY_ACTION_TOGGLE_EDITOR"},
	---Turn the editor on or off:	
	["COURSEPLAY_ACTION_TOGGLE_EDITOR"] = {
		ActionEvents.actionEventToggleEditor,
		ActionEvents.isActionEventToggleEditorDisabled,
		"COURSEPLAY_ACTION_TOGGLE_EDITOR"},
	---Turn the editor on or off:	
	["COURSEPLAY_ACTION_TOGGLE_EDITOR"] = {
		ActionEvents.actionEventToggleEditor,
		ActionEvents.isActionEventToggleEditorDisabled,
		"COURSEPLAY_ACTION_TOGGLE_EDITOR"},
	---Turn the editor on or off:	
	["COURSEPLAY_ACTION_TOGGLE_EDITOR"] = {
		ActionEvents.actionEventToggleEditor,
		ActionEvents.isActionEventToggleEditorDisabled,
		"COURSEPLAY_ACTION_TOGGLE_EDITOR"},
	---Turn the editor on or off:	
	["COURSEPLAY_ACTION_TOGGLE_EDITOR"] = {
		ActionEvents.actionEventToggleEditor,
		ActionEvents.isActionEventToggleEditorDisabled,
		"COURSEPLAY_ACTION_TOGGLE_EDITOR"},


	["Editor Undo"] : { "actionEventEditorUndo() ", "is deactivated function or something" , "COURSEPLAY_EDITOR_UNDO" },
	["Editor Save"] : { "actionEventEditorSave() ", "is deactivated function or something" , "COURSEPLAY_EDITOR_SAVE" },
	["Editor increase speed"] : { "actionEventEditorSpeedIncrease() ", "is deactivated function or something" , "COURSEPLAY_EDITOR_SPEED_INCREASE" },
	["Editor decrease speed"] : { "actionEventEditorSpeedDecrease() ", "is deactivated function or something" , "COURSEPLAY_EDITOR_SPEED_DECREASE" },
	["Editor delete waypoint"] : { "actionEventEditorDeleteWaypoint() ", "is deactivated function or something" , "COURSEPLAY_EDITOR_DELETE_WAYPOINT" },
	["Editor delete next waypoint"] : { "actionEventEditorDeleteNextWaypoint() ", "is deactivated function or something" , "COURSEPLAY_EDITOR_DELETE_NEXT_WAYPOINT" },
	["Editor delete to start"] : { "actionEventEditorDeleteToStart() ", "is deactivated function or something" , "COURSEPLAY_EDITOR_DELETE_TO_START" },
	["Editor delete to end"] : { "actionEventEditorDeleteToEnd() ", "is deactivated function or something" , "COURSEPLAY_EDITOR_DELETE_TO_END" },
	["Editor add waypoint"] : { "actionEventEditorAddWaypoint() ", "is deactivated function or something" , "COURSEPLAY_EDITOR_INSERT_WAYPOINT" },
	["Editor toggle waypoint"] : { "actionEventEditorToggleWaypoint() ", "is deactivated function or something" , "COURSEPLAY_EDITOR_CYCLE_WAYPOINT_TYPE" },
}
]]--


---@class ActionEventsLoader
ActionEventsLoader = CpObject()

---All the simple action events attributes
ActionEventsLoader.actionEventAttributes = {
    'name', --string attribute
    'callbackFunc', --string attribute
    'callbackParameter', --string attribute
    'isDisabledCallbackFunc', --string attribute
    'text' --string attribute
}

---All the setting action events attributes
ActionEventsLoader.settingActionEventAttributes = {
    'name', --string attribute
    'setting', --string attribute
    'callbackFunc', --string attribute
    'callbackParameter', --string attribute
    'text' --string attribute
}

function ActionEventsLoader:init()
    self.actionEvents = {}
    self.settingActionEvents = {}
    if g_currentMission then
		self:loadFromXml()
    end
end

function ActionEventsLoader:loadFromXml()
    self.xmlFileName = Utils.getFilename('config/ActionEventsConfig.xml', courseplay.path)
    self.xmlFile = self:loadXmlFile(self.xmlFileName)
end

---Loads ActionEventsConfig file
---@param string file path
function ActionEventsLoader:loadXmlFile(fileName)
    courseplay.info('Loading action events configuration from %s ...', fileName)
    if fileExists(fileName) then
		local xmlFile = loadXMLFile('actionEventsConfig', fileName)
        local rootElement = 'ActionEventsConfig'
        if xmlFile and hasXMLProperty(xmlFile, rootElement) then
			local baseElement = string.format('%s.%s', rootElement,'ActionEvents')
			print("baseElement: "..baseElement)
            self:loadActionEvents(xmlFile, baseElement,'ActionEvent',self.actionEventAttributes,self.actionEvents)
            local baseElement = string.format('%s.%s', rootElement,'SettingActionEvents')
			self:loadActionEvents(xmlFile, baseElement,'SettingActionEvent',self.settingActionEventAttributes,self.settingActionEvents)
            return xmlFile
        end
    else
        courseplay.info('Action events configuration file %s does not exist.', fileName)
    end
end

---Loads an action events table from ActionEventsConfig.xml
---@param int xmlFile id 
---@param string rootElement of the action event table
---@param string key for each single action event
---@param table attributes of the action event table
---@param table actionEventTable to store the data in
function ActionEventsLoader:loadActionEvents(xmlFile, rootElement,key,attributes,actionEventTable)
    if hasXMLProperty(xmlFile, rootElement) then 
        local i = 0
        while true do
            local baseElement = string.format('%s.%s(%d)', rootElement,key, i)
            if hasXMLProperty(xmlFile, baseElement) then
                self:loadAttributes(xmlFile, baseElement,attributes,actionEventTable)
            else
                break
            end
            i = i + 1
        end
    end
end

---Loads all attribute of an action event
---@param int xmlFile id 
---@param string rootElement of the attributes
---@param table attributes of the action event table
---@param table actionEventTable to store the data in
function ActionEventsLoader:loadAttributes(xmlFile, rootElement,attributes,actionEventTable)
    local attributesTable = {}
	for _,attribute in ipairs(attributes) do 
		attributesTable[attribute] = getXMLString(xmlFile, rootElement.."#"..attribute)
    end
	table.insert(actionEventTable,attributesTable)
end

---Gets all simple action events
function ActionEventsLoader:getActionEvents()
    return self.actionEvents
end

---Gets all setting action events
function ActionEventsLoader:getSettingActionEvents()
    return self.settingActionEvents
end

---Registers all action events
---@param object vehicle 
---@param boolean isActiveForInput 
---@param boolean isActiveForInputIgnoreSelection 
function ActionEventsLoader.onRegisterActionEvents(vehicle,isActiveForInput, isActiveForInputIgnoreSelection)	
	if vehicle.isClient then
		vehicle.cpActionEvents = {}
        vehicle:clearActionEventsTable(vehicle.cpActionEvents)
		vehicle.cpActionEventNameToId = {}
		if vehicle:getIsActiveForInput(true, true) then
			---Register all action events
			ActionEventsLoader.registerActionEvents(vehicle,isActiveForInput, isActiveForInputIgnoreSelection)
			ActionEventsLoader.registerSettingActionEvents(vehicle,isActiveForInput, isActiveForInputIgnoreSelection)
		end
	end
end

---Registers all simple action events
---@param object vehicle 
---@param boolean isActiveForInput 
---@param boolean isActiveForInputIgnoreSelection 
function ActionEventsLoader.registerActionEvents(vehicle,isActiveForInput, isActiveForInputIgnoreSelection)
	local actionEvents = g_ActionEventsLoader:getActionEvents()
	for _,actionEventData in ipairs(actionEvents) do 
		local actionEvent = InputAction[actionEventData.name]
		local actionEventCallback = ActionEventsLoader[actionEventData.callbackFunc]
		local actionEventText = actionEventData.text or actionEventData.name
		
		local actionEventIsDisabledCallback = actionEventData.isDisabledCallbackFunc and ActionEventsLoader[actionEventData.isDisabledCallbackFunc]
		local isDisabled = actionEventIsDisabledCallback and actionEventIsDisabledCallback(vehicle)  

		print(string.format("actionEvent: %s, actionEventCallback: %s, actionEventText: %s, isDisabled: %s: ",
		tostring(actionEvent),tostring(actionEventCallback),courseplay:loc(actionEventText),tostring(isDisabled)))
		if not isDisabled then 
			local _, eventId = vehicle:addActionEvent(vehicle.cpActionEvents, actionEvent, vehicle, actionEventCallback, false, true, false, true, nil)
			if eventId then
				g_inputBinding:setActionEventTextPriority(eventId, GS_PRIO_HIGH)
				g_inputBinding:setActionEventText(eventId, courseplay:loc(actionEventText))
			end

			vehicle.cpActionEventNameToId[actionEventData.name] = eventId
			print("finished installing: "..courseplay:loc(actionEventData.name))
		end
	end
end

---Registers all setting action events
---@param object vehicle 
---@param boolean isActiveForInput 
---@param boolean isActiveForInputIgnoreSelection 
function ActionEventsLoader.registerSettingActionEvents(vehicle,isActiveForInput, isActiveForInputIgnoreSelection)
	local actionEvents = g_ActionEventsLoader:getSettingActionEvents()
	for _,actionEventData in ipairs(actionEvents) do 
		local actionEvent = InputAction[actionEventData.name]
		local setting = vehicle.cp.settings[actionEventData.setting]
		local actionEventCallback = setting[actionEventData.callbackFunc]
		local actionEventText = actionEventData.text or actionEventData.name

		if not setting.isDisabled(setting) then 
			local _, eventId = vehicle:addActionEvent(vehicle.cpActionEvents, actionEvent, setting, actionEventCallback, false, true, false, true, nil)
			g_inputBinding:setActionEventTextPriority(eventId, GS_PRIO_LOW)
			g_inputBinding:setActionEventText(eventId, actionEventText)
			vehicle.cpActionEventNameToId[actionEventData.name] = eventId
		end
	end
end

---Callbacks 
function ActionEventsLoader.actionEventOpenCloseHud(vehicle, actionName, inputValue, callbackState, isAnalog)
	print("actionEvent: "..courseplay:loc(actionName))
	print("isDriving: "..tostring(vehicle.cp.isDriving))
end

---Is disabled callbacks
function ActionEventsLoader.isActionEventOpenCloseHudDisabled(vehicle)
	return false
end

g_ActionEventsLoader = ActionEventsLoader()
