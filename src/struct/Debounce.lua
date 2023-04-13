local function _isReady(self)
	return (tick() - self._last_time :: number) >= (self._cooldown :: number)
end
-- Define the Debounce class
local Debounce = {}
Debounce.__index = Debounce

function Debounce.new(cooldown: number, fn: (...any) -> ())
	local debounce = {}
	setmetatable(debounce, Debounce)

	debounce._cooldown = cooldown
	debounce._last_time = 0
	debounce._action = fn
	return debounce
end

function Debounce:IsReady()
	return _isReady(self)
end

function Debounce:Trigger(...)
	if not _isReady(self) then
		return false
	end
	self._last_time = tick()
	if self._action == nil then
		return true
	end
	return self._action(...)
end

function Debounce:Triggerif(cond: boolean , ...)
	if not _isReady(self) or not cond then
		return false
	end
	self._last_time = tick()
	if self._action == nil then
		return false
	end
	return self._action(...)
end

return Debounce
