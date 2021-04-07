---@class ActionEventsLoader
ActionEventsLoader = CpObject()

---All the simple action events attributes
ActionEventsLoader.actionEventAttributes = {
	{name = 'name', getXmlFunction = getXMLString},
	{name = 'class', getXmlFunction = getXMLString},
	{name = 'callbackFunc', getXmlFunction = getXMLString},
	{name = 'callbackParameter', getXmlFunction = getXMLString},
	{name = 'isDisabledCallbackFunc', getXmlFunction = getXMLString},
	{name = 'isDisabledCallbackParameter', getXmlFunction = getXMLInt},
	{name = 'text', getXmlFunction = getXMLString},
}

---All the setting action events attributes
ActionEventsLoader.settingActionEventAttributes = {
    {name = 'name', getXmlFunction = getXMLString},
	{name = 'setting', getXmlFunction = getXMLString},
	{name = 'callbackFunc', getXmlFunction = getXMLString},
	{name = 'callbackParameter', getXmlFunction = getXMLString},
	{name = 'isDisabledCallbackFunc', getXmlFunction = getXMLString},
	{name = 'isDisabledCallbackParameter', getXmlFunction = getXMLInt},
	{name = 'text', getXmlFunction = getXMLString},
}

---String to class reference
ActionEventsLoader.classStringToClass = {
	["courseEditor"] = courseEditor
}

function ActionEventsLoader:init()
    self.actionEvents = {}
    self.settingActionEvents = {}
	self.globalActionEvents = {}
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
            self:loadActionEvents(xmlFile, baseElement,'ActionEvent',self.actionEventAttributes,self.actionEvents)
            baseElement = string.format('%s.%s', rootElement,'SettingActionEvents')
			self:loadActionEvents(xmlFile, baseElement,'SettingActionEvent',self.settingActionEventAttributes,self.settingActionEvents)
			baseElement = string.format('%s.%s', rootElement,'GlobalActionEvents')
			self:loadActionEvents(xmlFile, baseElement,'GlobalActionEvent',self.actionEventAttributes,self.globalActionEvents)
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
	for _,attributeData in ipairs(attributes) do
		attributesTable[attributeData.name] = attributeData.getXmlFunction(xmlFile, rootElement.."#"..attributeData.name)
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

---Gets all setting action events
function ActionEventsLoader:getGlobalActionEvents()
    return self.globalActionEvents
end

---Registers all action events
---@param object vehicle 
---@param boolean isActiveForInput 
---@param boolean isActiveForInputIgnoreSelection 
function ActionEventsLoader.onRegisterVehicleActionEvents(vehicle,isActiveForInput, isActiveForInputIgnoreSelection)	
	if vehicle.isClient then
		vehicle.cpActionEvents = {}
        vehicle:clearActionEventsTable(vehicle.cpActionEvents)
		vehicle.cpActionEventNameToId = {}
		if vehicle:getIsActiveForInput(true, true) then
			---Register all action events
			ActionEventsLoader.registerVehicleActionEvents(vehicle,isActiveForInput, isActiveForInputIgnoreSelection)
			ActionEventsLoader.registerVehicleSettingActionEvents(vehicle,isActiveForInput, isActiveForInputIgnoreSelection)
		end
	end
end

---Registers all simple action events
---@param object vehicle 
---@param boolean isActiveForInput 
---@param boolean isActiveForInputIgnoreSelection 
function ActionEventsLoader.registerVehicleActionEvents(vehicle,isActiveForInput, isActiveForInputIgnoreSelection)
	local actionEvents = g_ActionEventsLoader:getActionEvents()
	for _,actionEventData in ipairs(actionEvents) do 
		ActionEventsLoader.registerActionEvent(actionEventData,vehicle,false)
	end
end

---Registers all setting action events
---@param object vehicle 
---@param boolean isActiveForInput 
---@param boolean isActiveForInputIgnoreSelection 
function ActionEventsLoader.registerVehicleSettingActionEvents(vehicle,isActiveForInput, isActiveForInputIgnoreSelection)
	local actionEvents = g_ActionEventsLoader:getSettingActionEvents()
	for _,actionEventData in ipairs(actionEvents) do 
		ActionEventsLoader.registerActionEvent(actionEventData,vehicle,true)
	end
end

---Registers all setting action events
---@param object vehicle 
---@param boolean isActiveForInput 
---@param boolean isActiveForInputIgnoreSelection 
function ActionEventsLoader.registerGlobalActionEvents(class,isActiveForInput, isActiveForInputIgnoreSelection)
	local actionEvents = g_ActionEventsLoader:getGlobalActionEvents()
	for _,actionEventData in ipairs(actionEvents) do 
		ActionEventsLoader.registerActionEvent(actionEventData,vehicle,false)
	end
end

---Registers an action event
---@param table actionEventData from the config xml
---@param object vehicle 
---@param boolean isSetting, is the action event linked to a setting class?
function ActionEventsLoader.registerActionEvent(actionEventData,vehicle,isSetting)
	local actionEventName = ActionEventsLoaderUtil.getActionEventName(actionEventData)
	local class,classParameter
	if isSetting then 
		class = ActionEventsLoaderUtil.getActionEventSetting(actionEventData,vehicle)
		classParameter = class
	else 
		class = ActionEventsLoaderUtil.getActionEventClass(actionEventData,ActionEventCallbacks)
		classParameter = ActionEventsLoaderUtil.getActionEventCallbackParameter(actionEventData,vehicle)
	end
	local actionEventCallback = ActionEventsLoaderUtil.getActionEventCallback(actionEventData,class)
	local actionEventText = ActionEventsLoaderUtil.getActionEventText(actionEventData)

	local isDisabled = ActionEventsLoaderUtil.getActionEventIsDisabled(actionEventData,class,classParameter)

	courseplay.debugVehicle(courseplay.DBG_HUD,vehicle,"Register action event: name= %s, text= %s, isDisabled= %s",
	actionEventName, courseplay:loc(actionEventText), tostring(isDisabled))

	local _, eventId = g_inputBinding:registerActionEvent(actionEventName, classParameter, actionEventCallback, false, true, false, true)
	g_inputBinding:setActionEventTextPriority(eventId, GS_PRIO_NORMAL)
	g_inputBinding:setActionEventText(eventId, courseplay:loc(actionEventText))
	g_inputBinding:setActionEventActive(eventId, not isDisabled)
	vehicle.cpActionEventNameToId[actionEventName] = eventId
end

---Updates action events and disables them if not needed
---@param object vehicle 
---@param table actionEvents table of action events 
---@param boolean isSetting, is the action event linked to a setting class?
function ActionEventsLoader.updateVehicleActionEvents(vehicle,actionEvents,isSetting)
	if vehicle.cpActionEventNameToId then
		for _,actionEventData in ipairs(actionEvents) do 
			local actionEventName = ActionEventsLoaderUtil.getActionEventName(actionEventData)
			local actionEventText = ActionEventsLoaderUtil.getActionEventText(actionEventData)
			local eventId = vehicle.cpActionEventNameToId[actionEventName]
			if eventId then 
				local class,classParameter
				if isSetting then 
					class = ActionEventsLoaderUtil.getActionEventSetting(actionEventData,vehicle)
					classParameter = class
				else 
					class = ActionEventsLoaderUtil.getActionEventClass(actionEventData,ActionEventCallbacks)
					classParameter = ActionEventsLoaderUtil.getActionEventCallbackParameter(actionEventData,vehicle)
				end
				local isDisabled = ActionEventsLoaderUtil.getActionEventIsDisabled(actionEventData,class,classParameter)
				courseplay.debugVehicle(courseplay.DBG_HUD,vehicle,"Update action event: name= %s, text= %s, isDisabled= %s",
				actionEventName, courseplay:loc(actionEventText), tostring(isDisabled))
				g_inputBinding:setActionEventActive(eventId, not isDisabled)
			end
		end
	end
end

---Updates all vehicle action events and disables them if not needed
---@param object vehicle 
function ActionEventsLoader.updateActionEvents(vehicle)
	local actionEvents = g_ActionEventsLoader:getActionEvents()
	ActionEventsLoader.updateVehicleActionEvents(vehicle,actionEvents)
	actionEvents = g_ActionEventsLoader:getSettingActionEvents()
	ActionEventsLoader.updateVehicleActionEvents(vehicle,actionEvents,true)
end


g_ActionEventsLoader = ActionEventsLoader()

ActionEventsLoaderUtil = {}

---Gets the action event name of the xml data
function ActionEventsLoaderUtil.getActionEventName(actionEventData)
	return InputAction[actionEventData.name]
end

---Gets the action event class of the xml data or returns the default class
---@param table actionEventData from the config xml
---@param object default class for the callbacks 
function ActionEventsLoaderUtil.getActionEventClass(actionEventData,defaultClass)
	return actionEventData.class and ActionEventsLoader.classStringToClass[actionEventData.class] or defaultClass
end

---Gets the action event callback function parameter of the xml data, default is default class
---@param table actionEventData from the config xml 
---@param object default class for the callbacks 
function ActionEventsLoaderUtil.getActionEventCallbackParameter(actionEventData,defaultClass)	
	return actionEventData.callbackParameter and ActionEventsLoader.classStringToClass[actionEventData.callbackParameter] or defaultClass
end

---Gets the action event setting of the xml data
---@param table actionEventData from the config xml
---@param object vehicle
function ActionEventsLoaderUtil.getActionEventSetting(actionEventData,vehicle)
	return vehicle.cp.settings[actionEventData.setting]
end

---Gets the action event callback function of the xml data
---@param table actionEventData from the config xml
---@param object callback class
function ActionEventsLoaderUtil.getActionEventCallback(actionEventData,class)
	return class[actionEventData.callbackFunc]
end	

---Gets the action event text of the xml data, default is the action event name
---@param table actionEventData from the config xml
function ActionEventsLoaderUtil.getActionEventText(actionEventData)
	return actionEventData.text or actionEventData.name
end

---Is the action event disabled ? 
---Defaults to class.isDisabled , if the is disabled callback function is not defined or it is always enabled
---@param table actionEventData from the config xml
---@param object callback class
---@param int callback parameter
function ActionEventsLoaderUtil.getActionEventIsDisabled(actionEventData,class,classParameter)
	local isDisabledCallback = actionEventData.isDisabledCallbackFunc and class[actionEventData.isDisabledCallbackFunc] or class.isDisabled 
	local isDisabledCallbackParameter = actionEventData.isDisabledCallbackParameter
	if isDisabledCallback then 
		return isDisabledCallback(classParameter,isDisabledCallbackParameter)
	end
	return false
end


ActionEventCallbacks = {}

---Action event callbacks WIP!

function ActionEventCallbacks.actionEventOpenCloseHud(vehicle, actionName, inputValue, callbackState, isAnalog)
	vehicle:setCourseplayFunc('openCloseHud', not vehicle.cp.hud.show);
end

function ActionEventCallbacks.actionEventNextDriverMode(vehicle, actionName, inputValue, callbackState, isAnalog)
	local newMode = SettingsUtil.getNextCpMode(vehicle)
	if newMode ~= vehicle.cp.mode then 
		vehicle:setCourseplayFunc('setCpMode', newMode);
	end
end

function ActionEventCallbacks.actionEventPreviousDriverMode(vehicle, actionName, inputValue, callbackState, isAnalog)
	local newMode = SettingsUtil.getPrevCpMode(vehicle)
	if newMode ~= vehicle.cp.mode then 
		vehicle:setCourseplayFunc('setCpMode', newMode);
	end
end

function ActionEventCallbacks.actionEventNextHudPage(vehicle, actionName, inputValue, callbackState, isAnalog)
	local newPage = courseplay.hud.getNextPage(vehicle)
	if newPage ~= courseplay.hud.getCurrentPage(vehicle) then 
		vehicle:setCourseplayFunc('setHudPage', newPage)
	end
end

function ActionEventCallbacks.actionEventPreviousHudPage(vehicle, actionName, inputValue, callbackState, isAnalog)
	local newPage = courseplay.hud.getPrevPage(vehicle)
	if newPage ~= courseplay.hud.getCurrentPage(vehicle) then 
		vehicle:setCourseplayFunc('setHudPage', newPage)
	end
end


function ActionEventCallbacks.actionEventStartStopRecording(vehicle, actionName, inputValue, callbackState, isAnalog)
	if not vehicle.cp.canDrive then
		if not vehicle.cp.recordingIsPaused then
			if not vehicle.cp.isRecording and vehicle.cp.numWaypoints == 0 then
				vehicle:setCourseplayFunc('start_record', nil);
			elseif not vehicle.cp.isRecordingTurnManeuver then 
				vehicle:setCourseplayFunc('stop_record', nil);
			end
		end
	end
end

function ActionEventCallbacks.actionEventPauseRecording(vehicle, actionName, inputValue, callbackState, isAnalog)
	vehicle:setCourseplayFunc('setRecordingPause', nil, false, 1);
end

function ActionEventCallbacks.actionEventToggleReverseRecording(vehicle, actionName, inputValue, callbackState, isAnalog)
	vehicle:setCourseplayFunc('change_DriveDirection', nil, false, 1);
end

function ActionEventCallbacks.actionEventStartStopDriving(vehicle, actionName, inputValue, callbackState, isAnalog)
	courseplay:startStop(vehicle)
end

function ActionEventCallbacks.actionEventDriveNow(vehicle, actionName, inputValue, callbackState, isAnalog)

end

---isDisabled callbacks WIP!


function ActionEventCallbacks.isActionEventOpenCloseHudDisabled(vehicle)

end

function ActionEventCallbacks.isActionEventChangeDriverModeDisabled(vehicle)
	return not vehicle.cp.hud.show or vehicle:getIsCourseplayDriving() or vehicle.cp.isRecording 
end

function ActionEventCallbacks.isActionEventChangeHudPageDisabled(vehicle)
	return not vehicle.cp.hud.show or vehicle.cp.isRecording 
end


function ActionEventCallbacks.isActionEventStartStopRecordingDisabled(vehicle)
	return vehicle.cp.canDrive 
end

function ActionEventCallbacks.isActionEventPauseRecordingDisabled(vehicle)
	return vehicle.cp.canDrive or vehicle.cp.numWaypoints < 3
end

function ActionEventCallbacks.isActionEventToggleReverseRecortdingDisabled(vehicle)
	return vehicle.cp.canDrive or not vehicle.cp.isRecording 
end

function ActionEventCallbacks.isActionEventStartStopDrivingDisabled(vehicle)
	return not vehicle.cp.canDrive
end

function ActionEventCallbacks.isActionEventDriveNowDisabled(vehicle)
	return true
end

