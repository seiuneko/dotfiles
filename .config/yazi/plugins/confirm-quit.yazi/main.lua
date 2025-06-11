local count = ya.sync(function() return #cx.tabs end)

local function entry(self, job)
	if count() < 2 then
		return ya.emit("quit", job.args)
	end

	local yes = ya.confirm {
		pos = { "center", w = 60, h = 10 },
		title = "Quit?",
		content = ui.Text("There are multiple tabs open. Are you sure you want to quit?"):wrap(ui.Wrap.YES),
	}
	if yes then
		ya.emit("quit", job.args)
	end
end

return { entry = entry }
