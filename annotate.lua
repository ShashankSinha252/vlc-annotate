function descriptor()
	return {
		title = "VLC Annotate";
		version = "0.1.0";
		author = "Shashank Sinha";
		url = "https://github.com/ShashankSinha252/vlc-annotate";
		shortdesc = "Annotate files by timeline in VLC";
		description = "TBD";
	}
end

function activate()
	dlg = vlc.dialog("Annotate")

	-- Add content for dialog box
	local row = 1
	btn_toggle_playback = dlg:add_button("Play / Pause", toggle_playback, 1, row, 1, 1)

	dlg:update()
end

function close()
	vlc.deactivate()
end

function toggle_playback()
	if vlc.object.input() then
		local status = vlc.playlist.status()
		if (status == 'stopped') or (status == 'paused') then
			vlc.playlist.play()
		else
			vlc.playlist.pause()
		end
	end
end