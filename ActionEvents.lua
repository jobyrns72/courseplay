

ActionEvents = {}


ActionEvents.events = {
	---open and control HUD:
	["Open HUD with mouse"] : { "actionEventOpenHudWithMouse() ", "is deactivated function or something" , "COURSEPLAY_HUD_MOUSE" },
	["Open/Close HUD with key"] : { "actionEventOpenCloseHudWithKey() ", "is deactivated function or something" , "COURSEPLAY_HUD_KEY" },
	["Next mode"] : { "actionEventNextMode() ", "is deactivated function or something" , "COURSEPLAY_NEXTMODE" },
	["Previous mode"] : { "actionEventPreviousMode() ", "is deactivated function or something" , "COURSEPLAY_PREVMODE" },
	["Next page"] : { "actionEventNextPage() ", "is deactivated function or something" , "COURSEPLAY_NEXTPAGE" },
	["Previous page"] : { "actionEventPreviousPage() ", "is deactivated function or something" , "COURSEPLAY_PREVPAGE" },
	---Recording:
	["Start record"] : { "actionEventStartRecord() ", "is deactivated function or something" , "translation text, example: COURSEPLAY_START" },
	["Stop record"] : { "actionEventStopRecord() ", "is deactivated function or something" , "translation text, example: COURSEPLAY_START" },
	["Pause record"] : { "actionEventPauseRecord() ", "is deactivated function or something" , "translation text, example: COURSEPLAY_START" },
	["Switch to reverse"] : { "actionEventSwitchToReverse() ", "is deactivated function or something" , "translation text, example: COURSEPLAY_START" },
	---Start Driver:
	["Start driver"] : { "actionEventStartDriver() ", "is deactivated function or something" , "COURSEPLAY_START_STOP" },
	["Stop driver"] : { "actionEventStopDriver() ", "is deactivated function or something" , "COURSEPLAY_START_STOP" },
	["Drive now"] : { "actionEventDriveNow() ", "is deactivated function or something" , "COURSEPLAY_DRIVENOW" },
	["Toggle start at"] : { "actionEventToggleStartAt() ", "is deactivated function or something" , "COURSEPLAY_TOGGLE_START" },
	---Shovel Control: Deactivate when no shovel position is saved ?
	["Shovel loading position"] : { "actionEventShovelLoadingPosition() ", "is deactivated function or something" , "COURSEPLAY_SHOVEL_MOVE_TO_LOADING_POSITION" },
	["Shovel transport position"] : { "actionEventShovelTransportPosition() ", "is deactivated function or something" , "COURSEPLAY_SHOVEL_MOVE_TO_TRANSPORT_POSITION" },
	["Shovel preUnload position"] : { "actionEventShovelPreUnloadPosition() ", "is deactivated function or something" , "COURSEPLAY_SHOVEL_MOVE_TO_PRE_UNLOADING_POSITION" },
	["Shovel unload position"] : { "actionEventShovelUnloadPosition() ", "is deactivated function or something" , "COURSEPLAY_SHOVEL_MOVE_TO_UNLOADING_POSITION" },
	---Editor:
	["Editor On/Off"] : { "actionEventEditorOnOff() ", "is deactivated function or something" , "COURSEPLAY_EDITOR_TOGGLE" },
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

---Registers all action events
function ActionEvents.onRegisterActionEvents(vehicle,isActiveForInput, isActiveForInputIgnoreSelection)	
	if vehicle.isClient then
        vehicle:clearActionEventsTable(vehicle.cpActionEvents)
		if vehicle:getIsActiveForInput(true, true) then
			---Register all action events
			---Create seperate function for setting action events, course editor action events, and so on..
			ActionEvents.registerActionEventStartStop(vehicle,isActiveForInput, isActiveForInputIgnoreSelection)

		end
	end
end


---This is an example register function 
function ActionEvents.registerActionEventStartStop(vehicle)
	local actionEvent = InputAction["action event name here"]
	local actionEventCallback = ActionEvents.actionEventStartStop --for example
	local actionEventText = "translation text, example: COURSEPLAY_START"

	local _, eventId = vehicle:addActionEvent(vehicle.cpActionEvents, actionEvent, vehicle, actionEventCallback, false, true, false, true, nil)
	g_inputBinding:setActionEventTextPriority(eventId, GS_PRIO_LOW)
	g_inputBinding:setActionEventText(eventId, actionEventText)
end


---This is an example callback 
function ActionEvents.actionEventStartStop(vehicle, actionName, inputValue, callbackState, isAnalog)
	---Code that gets executed after the button press, for example courseplay:start() ...

	---	vehicle:requestActionEventUpdate() this one needs to be called to refresh the action events texts

end

---This is an example callback maybe one for all the new Settings
function ActionEvents.actionEventsSettings(vehicle, actionName, inputValue, callbackState, isAnalog)
	---Code that gets executed after the button press, for example courseplay:start() ...

	---	vehicle:requestActionEventUpdate() this one needs to be called to refresh the action events texts

end


---This is an example callback maybe one for all the editor events
function ActionEvents.actionEventsEditor(vehicle, actionName, inputValue, callbackState, isAnalog)
	---Code that gets executed after the button press, for example courseplay:start() ...

	---	vehicle:requestActionEventUpdate() this one needs to be called to refresh the action events texts

end
