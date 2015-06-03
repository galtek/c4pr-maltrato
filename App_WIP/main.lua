display.setStatusBar( display.HiddenStatusBar )

local composer 		= require( "composer" )
local util = require( "utility" )
-- local parse = require( "mod_parse" )

local W = display.contentWidth
local H = display.contentHeight
local halfW = W * .50
local halfH = H * .50

-- parse:init( { appId = "L1KVIAeyxfUUadNUp5OXTZZPNRdubxnMusmFkK4Q",
			  -- apiKey = "hTPVe5GYBneDvfEJ6HwPF0xZb108zaKvZt7GKRex" } )

-- util.print_r( composer.effectList )

composer.gotoScene( "scenes.principal" )