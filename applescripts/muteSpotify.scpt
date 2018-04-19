#!/usr/bin/env osascript

(* Get the current song from iTunes or Spotify *)
if application "Spotify" is running then
  tell application "Spotify"
      set currentVolume to sound volume
      set theName to the name of the current track
      set theArtist to the artist of the current track
      set currentTrackPopularity to popularity of current track
   	  set currentTrackDuration to duration of current track 
      set currentTrackPosition to player position
      try
        (* return "♫  " & theName & " - " & theArtist & "-" & "-" & currentTrackPopularity & "-" & currentTrackDuration/1000 *)
      on error err
      end try
  end tell
end if

if (currentTrackPopularity< 2 and currentTrackDuration < 40000) then
		tell application "Spotify"
				pause
				set sound volume to 0
				play
		end tell
		delay (currentTrackDuration/1000 - currentTrackPosition + 1) 
		tell application "Spotify"
				set sound volume to currentVolume -- Restore the volume to the level it was before
		end tell
end if

return "♫  " & theName & " - " & theArtist 
if application "iTunes" is running then
  tell application "iTunes"
    if exists current track then
      set theName to the name of the current track
      set theArtist to the artist of the current track
      try
        return "♫  " & theName & " - " & theArtist
      on error err
      end try
    end if
  end tell
end if
