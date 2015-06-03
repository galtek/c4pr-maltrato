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

local widget = require( "widget" )
-- local parse = require( "mod_parse" )

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

    local function onRowRender( event )
		local row = event.row

		local rowHeight = row.contentHeight
		local rowWidth = row.contentWidth

		local title = display.newText( row, row.params.nombre, 0, 0, nil, 16 )
		title.anchorX = 0
		title.x = 20
		title.y = rowHeight * .50
		title:setFillColor( 0, 0, 0 )

		local verticalLine = display.newLine( row, 0, 0, 0, 75 )
		verticalLine.x = rowWidth * .50
		verticalLine.y = rowHeight * .50
		verticalLine:setStrokeColor( 0, 0, 0 )

		local subTitle = display.newText( row, row.params.telefono, 0, 0, nil, 12 )
		subTitle.anchorX = 1
		subTitle.x = W -  20
		subTitle.y = rowHeight * .50
		subTitle:setFillColor( .5, .5, .5 )

	end

	local tableView = widget.newTableView( {
		onRowRender = onRowRender,
	} )

	local function onGetObjects( event )
		if not event.error then

			for i=1, #event.results do
				tableView:insertRow( 
				{
					rowHeight = 75,
					params = event.results[i]
				} )
			end

		end
	end
	parse:getObjects( "Centros", nil, onGetObjects )

	sceneGroup:insert( tableView )

end


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
--     local prevScene = composer.getSceneName( "previous" )

--     if (prevScene == "scenes.playas") then
--     	composer.removeScene( "scenes.playas" )
--     end

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

