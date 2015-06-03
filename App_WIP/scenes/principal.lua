-- =============================================================
-- This is a modified version of the original conposer_template
-- In this version:
--    show scene is split in: willEnter and didEnter scenes
--    hide scene is split in: willExit and didExit scenes
-- =============================================================
-- =============================================================
-- Scene Description Here
-- =============================================================
local composer 		= require( "composer" )
local scene    		= composer.newScene()

local W = display.contentWidth
local H = display.contentHeight
local halfW = W * .50
local halfH = H * .50
----------------------------------------------------------------------
--	Scene Methods
----------------------------------------------------------------------

----------------------------------------------------------------------
----------------------------------------------------------------------
function scene:create( event )
	local sceneGroup = self.view

	-- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
    local navBar = display.newRect( sceneGroup, 0, 0, W, 150 )
    navBar.anchorY = 0
    navBar.x = halfW
    navBar.y = 0
    navBar:setFillColor( 175, 182, 209)

    --Finde me button
    local findMeButton = display.newRoundedRect( sceneGroup, 0, 0, 380, 70, 5 )
    findMeButton.x = halfW
    findMeButton.y = navBar.height / 2
    findMeButton.strokeWidth = 8
	findMeButton:setStrokeColor( 1, 0, 0 )

	local findMeButtonText = display.newText( sceneGroup, "ENCUENTRAME", 0, 0, nil, 45 )
	findMeButtonText.x = findMeButton.x
	findMeButtonText.y = findMeButton.y
	findMeButtonText:setFillColor( 1, 0, 0 )

	--Map and location API
	local map = display.newImage( "images/Location.PNG", sceneGroup, 319, 224, H*.40)  
    map.anchorY = 0
    map.x = halfW
    map.y = navBar.height
    map.xScale = 2
    map.yScale = 2

    --Contacts TableView
    local contacts = {
 	{name = "Emergencia", num = 911},
 	{name = "Policia", num = 7871234567},
 	{name = "Madre", num = 7871234567},
 	{name = "Hermano", num = 7871234567}
	}

	local nameTitle = display.newText("Nombre", 0, 0, native.systemFont, 30)
	nameTitle.anchorX = 0
	nameTitle.x = 20
	nameTitle.y = H - 500

	local numeroTitle = display.newText("Telefono", 0, 0, native.systemFont, 30)
	numeroTitle.anchorX = 1
	numeroTitle.x = W - 150
	numeroTitle.y = nameTitle.y


	function contactsPrint(contact, num)

	local contactName = display.newText(contact, 0, 0, native.systemFont, 30)
	contactName.anchorX = 0
	contactName.x = nameTitle.x 
	contactName.y = H - 400
	contactName:setTextColor(1, 1, 1)

	local contactNumber = display.newText(num, 0, 0, native.systemFont, 30)
	contactNumber.anchorX = 1
	contactNumber.x = W - 20
	contactNumber.y = H 
	contactNumber:setTextColor(1, 1, 1) 
	
	end

end



--     local tabBar = display.newRect( sceneGroup, 0, 0, W, 32 )
--     tabBar.anchorY = 1
--     tabBar.x = halfW
--     tabBar.y = H
--     tabBar:setFillColor( .5, .5, .5 )

-- end


----------------------------------------------------------------------
----------------------------------------------------------------------
function scene:willEnter( event )
	local sceneGroup = self.view

	-- Called when the scene is still off screen (but is about to come on screen).

end


----------------------------------------------------------------------
----------------------------------------------------------------------
function scene:didEnter( event )
	local sceneGroup = self.view

	-- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.

end


----------------------------------------------------------------------
----------------------------------------------------------------------
function scene:willExit( event )
	local sceneGroup = self.view

	-- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.

end


----------------------------------------------------------------------
----------------------------------------------------------------------
function scene:didExit( event )
	local sceneGroup = self.view

	-- Called immediately after scene goes off screen.

end


----------------------------------------------------------------------
----------------------------------------------------------------------
function scene:destroy( event )
	local sceneGroup = self.view

end


---------------------------------------------------------------------------------
-- Scene Dispatch Events, Etc. - Generally Do Not Touch Below This Line
---------------------------------------------------------------------------------
function scene:show( event )
	local sceneGroup 	= self.view
	local willDid 	= event.phase
	if( willDid == "will" ) then
		self:willEnter( event )
	elseif( willDid == "did" ) then
		self:didEnter( event )
	end
end
function scene:hide( event )
	local sceneGroup 	= self.view
	local willDid 	= event.phase
	if( willDid == "will" ) then
		self:willExit( event )
	elseif( willDid == "did" ) then
		self:didExit( event )
	end
end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
---------------------------------------------------------------------------------
return scene

