

ActionEvents = {}


ActionEvents.events = {
	---example:
	["action event name here"] : { "callback function , example: actionEventStartStop() ", "is deactivated function or something" , "translation text, example: COURSEPLAY_START" },
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
