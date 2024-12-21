require "consts"

local zoom = 1
local canvas

local GM = require "scripts.gm"
local gm

local shader

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    shader = love.graphics.newShader("data/key.glsl")

    Init()
    
    canvas = love.graphics.newCanvas(SCREEN_W, SCREEN_H)
    gm = GM:new()
    gm:init()
end

function love.draw()
    love.graphics.setCanvas(canvas)
    love.graphics.setShader(shader)
    love.graphics.clear()
    
    gm:draw()
    
    love.graphics.setCanvas()
    love.graphics.setShader()
    
    love.graphics.draw(canvas, 0, 0, 0, zoom, zoom)
end

function love.update(dt)
    dt = dt*60
    if dt > 1.1 then
        return
    end
    gm:update(dt)
end

function love.keypressed(key)
    gm:keypressed(key)
end

function love.resize(w, h)
    zoom = w/SCREEN_W
end