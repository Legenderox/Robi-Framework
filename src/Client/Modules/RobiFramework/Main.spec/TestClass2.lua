--[[
Class Template - Legenderox
November 30, 2020

Class Description:

]]


local Class = {}
Class.__index = Class

Class.name = "TestClass2"

Class.defaultStates = {
    d = 3,
    c = 3,
}

Class.TYPE_REQUIREMENT = nil -- Required elment type, nil = all*

-------------
-- METHODS --
-------------

function Class:run()
	--[[
		Method invoked asynchronously (at the same time)
		Fired when :run() is called on object
		Used to run evetns and main functionalities,
		*access to all states, store, classes*
	]]

	if self.store.object1 then
		self.store.object1.states.a = "Changed by Object2"
	end
end

function Class.setup(object, ...)
	--[[
		input: object: tbl = robi object the class is created in, ... = arguments passed

		Method invoked one-by-one synchronously
		Fired when robi object is created
		Used to setup states and object, 
		*Only access to local states and local class*

		returns: self
	]]
	local metaTable = { -- custom metatable allows access "Class" and entire Robi Object
		__index = function(self, i)
			if Class[i] then return Class[i] end -- CHECK CLASS FIRST
			if object[i] then return object[i] end
			return
		end
	}
	local self = setmetatable({}, metaTable)
	if self.TYPE_REQUIREMENT and not element:IsA(self.TYPE_REQUIREMENT) then error(element.Name.. "(Element) does not match this class's TYPE_REQUIREMENT") end
	

	return self
end

function Class:Init()
    --[[
		Method used for AGF Access 
	]]
end

return Class