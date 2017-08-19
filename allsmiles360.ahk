#SingleInstance force
#Persistent
SetTitleMatchMode 2
DetectHiddenText, on


Arr_Files := {}
SetTimer, SearchFiles, 100
return

SearchFiles:
Loop, C:\Users\Nicholas\Pictures\dslrBooth\originals\*.jpg, 0, 1
{
	if Arr_Files.HasKey(A_LoopFileFullPath)
	{
		if (Arr_Files[A_LoopFileFullPath] = A_LoopFileSize)
		{
			SplitPath, A_LoopFileFullPath,,,, Name
			FileCopy, %A_LoopFileFullPath%,  C:\Users\Nicholas\Pictures\dslrBooth\droplet.exe
			;Arr_Files.remove(A_LoopFileFullPath)
			continue
		}
	}

	Arr_Files[A_LoopFileFullPath] := A_LoopFileSize
}

return

^Esc::ExitApp

return
