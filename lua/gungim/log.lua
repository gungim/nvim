local Log = {}
Log.levels = {
	TRACE = 1,
	DEBUG = 2,
	INFO = 3,
	WARN = 4,
	ERROR = 5,
}

--- Adds a log entry using Plenary.log
---@param level integer [same as vim.log.levels]
---@param msg any
---@param event any
function Log:add_entry(level, msg, event)
	vim.notify(msg, level, event)
end

---Add a log entry at TRACE level
---@param msg any
---@param event any
function Log:trace(msg, event)
	self:add_entry(self.levels.TRACE, msg, event)
end

---Add a log entry at TRACE level
---@param msg any
---@param event any
function Log:debug(msg, event)
	self:add_entry(self.levels.DEBUG, msg, event)
end

---Add a log entry at INFO level
---@param msg any
---@param event any
function Log:info(msg, event)
	self:add_entry(self.levels.INFO, msg, event)
end

---Add a log entry at WARN level
---@param msg any
---@param event any
function Log:warn(msg, event)
	self:add_entry(self.levels.WARN, msg, event)
end

---Add a log entry at ERROR level
---@param msg any
---@param event any
function Log:error(msg, event)
	self:add_entry(self.levels.ERROR, msg, event)
end

return Log
