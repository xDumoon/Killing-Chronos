menu:

	if menu=0
		repeat
			if GetPointerReleased()=1 and GetSpriteHitTest(start,GetPointerX(),GetPointerY()) then menu=1
		sync()
		until menu=1
	endif
	return
	
