
-- Define a new Spaceship class
Spaceship = Class( GameSprite )

-- Create a new spaceship sprite
function Spaceship:new( group )
    -- Initialize the Spaceship sprite
    self:initialize( spriteAnims.spaceshipSequence, group )
    
    -- Set the start coordinates and rotation
    local rot = math.pi * ( -0.4 + math.random( 8 ) / 10 )
    local dx = SHIP_DIST * math.sin( rot )
    local dy = - SHIP_DIST * math.cos( rot )
    local x = PLANET_X + dx
    local y = PLANET_Y + dy
    local rot = 90 + math.atan2( dy, dx ) * 180 / math.pi
    self.spriteInstance.rotation = rot
    self:moveTo( x, y )
    
    -- Set the speed
    self.speed = 1 + math.random(3)
    
    -- removeExplodedShips
    self.isAlive = true
    self.wasKilled = nil

end


-- updateFunc
-- Spaceship update function 
--   (called each frame)
function Spaceship:update( )
    -- Ship movement goes here
    

    -- updateFuncChanges
    -- Calculate the distance to the planet
    local dx = PLANET_X - self.spriteInstance.x
    local dy = PLANET_Y - self.spriteInstance.y
    local hyp = math.sqrt( dx * dx + dy * dy )

    -- Move the sprite
    self:move( self.speed * dx / hyp, self.speed * dy / hyp )
    -- Check the ship is not too close to the planet
    if hyp < PLANET_RADIUS then

        -- The ship reached the planet unharmed
        self.wasKilled = false

        self.isAlive = false
    end

end


-- toggleDeleteFunc
function Spaceship:toggleDelete( )
    -- The ship must be deleted if it's marked as dead
    if( self.isAlive == false ) then
        return true
    end
    -- The ship is alive
    return false
end

function Spaceship:removeMe( )
    self:removeSprite( )
end

  