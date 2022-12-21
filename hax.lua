loadstring(game:HttpGet("https://raw.githubusercontent.com/wawsdasdacx/UIlib/main/Uilib.lua"))()
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local interval = 0
local bombInterval = 0
local gateInterval = 0

local spamForward = false
local spamBackward = false
local spamStop = false
local spamLight = false
local spamMove = false
local spamExplode = false
local spamFire = false
local spamWheel = false
local spamJump = false
local spamRocket = false
local spamSpawn = false
local spamBombs = false
local spamGates = false
local grindCoins = false
local includeGamePass = false

if not fireclickdetector or not firetouchinterest then
	StarterGui:SetCore("SendNotification", {
		Title = "Notice",
		Text = "Your executor is unsupported.",
		Duration = 5
	})
    return
end

local window = library:AddWindow("cart ride around used car battery hax by Gabry#6899 and spigmaa#7062")

local Carts = window:AddTab("Carts")
local BombCarts = window:AddTab("Bomb Carts")
local Gates = window:AddTab("Gates")
local Misc = window:AddTab("Misc")

function xAllCarts(name)
    for i, v in pairs(workspace:GetChildren()) do
        if v.Name:sub(-4,-1) == 'Cart' then
            if v:FindFirstChild(name) then 
                pcall(function() fireclickdetector(v[name].ClickDetector) end)
            end
        end
	end
end

function forwardAllCarts()
	xAllCarts('forward')
end

function backwardAllCarts()
	xAllCarts('backward')
end

function stopAllCarts()
	xAllCarts('stop')
end

function lightAllCarts()
	xAllCarts('lightbutton')
end

function moveAllCarts()
	xAllCarts('move')
end 

function explodeAllCarts()
    xAllCarts('explode')
end

function fireAllCarts()
	xAllCarts('firebutton')
end

function wheelAllCarts()
	xAllCarts('wheelbutton')
end

function jumpAllCarts()
	xAllCarts('jumpbutton')
end

function rocketAllCarts()
	xAllCarts('rocketbutton')
end

function spawnAllCarts()
	for i, v in pairs(workspace:GetChildren()) do
        if v.Name:match("respawner") then
            if not includeGamePass and (v.Name == "superiorrespawner" or v.Name == "DREAMrespawner") then return end
            if v:FindFirstChild("respawn") then
                firetouchinterest(Players.LocalPlayer.Character.PrimaryPart, v.respawn, 1)
                firetouchinterest(Players.LocalPlayer.Character.PrimaryPart, v.respawn, 0)
            end
        end
	end
end

function spawnBombCarts()
for i, v in pairs(workspace:GetChildren()) do
        if v.Name:match("bombrespawnerply") then
            if v:FindFirstChild("respawn") then
                firetouchinterest(Players.LocalPlayer.Character.PrimaryPart, v.respawn, 1)
                firetouchinterest(Players.LocalPlayer.Character.PrimaryPart, v.respawn, 0)
            end
        end
	end
end

function getAllCoins()
    local startcf = Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	for i,v in pairs(game.Workspace.coinspawner:GetDescendants()) do
        if v:IsA('BasePart') then
            repeat
                Players.LocalPlayer.Character:SetPrimaryPartCFrame(v.CFrame)
                wait(0.1)
            until v.AncestryChanged:Wait()
        end
    end
    Players.LocalPlayer.Character:SetPrimaryPartCFrame(startcf)
end

function toggleAllGates()
	for i, v in pairs(workspace:GetChildren()) do
        if v.Name:match("crossing") then
            if v:FindFirstChild("Button") then
                firetouchinterest(Players.LocalPlayer.Character.HumanoidRootPart, v.Button, 1)
                firetouchinterest(Players.LocalPlayer.Character.HumanoidRootPart, v.Button, 0)
            end
        end
	end
end

Carts:AddButton("Forward All Carts", forwardAllCarts)

Carts:AddSwitch("Spam Forward All Carts", function(t)
	spamForward = t
end)

Carts:AddButton("Backward All Carts", backwardAllCarts)

Carts:AddSwitch("Spam Backward All Carts", function(t)
	spamBackward = t
end)

Carts:AddButton("Stop All Carts", stopAllCarts)

Carts:AddSwitch("Spam Stop All Carts", function(t)
	spamStop = t
end)

Carts:AddButton("Light All Carts", lightAllCarts)

Carts:AddSwitch("Spam Light All Carts", function(t)
	spamLight = t
end)

Carts:AddButton("Fire All Carts", fireAllCarts)

Carts:AddSwitch("Spam Fire All Carts", function(t)
	spamFire = t
end)

Carts:AddButton("Wheel All Carts", wheelAllCarts)

Carts:AddSwitch("Spam Wheel All Carts", function(t)
	spamWheel = t
end)

Carts:AddButton("Jump All Carts", jumpAllCarts)

Carts:AddSwitch("Spam Jump All Carts", function(t)
	spamJump = t
end)

Carts:AddButton("Rocket All Carts", rocketAllCarts)

Carts:AddSwitch("Spam Rocket All Carts", function(t)
	spamRocket = t
end)

Carts:AddButton("Spawn All Carts", spawnAllCarts)

Carts:AddSwitch("Spam Spawn All Carts", function(t)
	spamSpawn = t
end)

Carts:AddSwitch("Include Game Pass Carts", function(t)
	includeGamePass = t
end)

Carts:AddSlider("Spam Interval", function(v)
	interval = v
end, {min = 0, max = 10})

task.spawn(function()
	while task.wait(interval) do
		if spamForward then forwardAllCarts() end
		if spamBackward then backwardAllCarts() end
		if spamStop then stopAllCarts() end
		if spamLight then lightAllCarts() end
		if spamFire then fireAllCarts() end
		if spamWheel then wheelAllCarts() end
		if spamJump then jumpAllCarts() end
		if spamRocket then rocketAllCarts() end
		if spamSpawn then spawnAllCarts() end
	end
end)

BombCarts:AddButton("Move All Carts", moveAllCarts)

BombCarts:AddSwitch("Spam Move All Carts", function(t)
    spamMove = t
end)

BombCarts:AddButton("Explode All Carts", explodeAllCarts)

BombCarts:AddSwitch("Spam Explode All Carts", function(t)
    spamExplode = t
end)

BombCarts:AddButton("Spawn Bomb Carts", spawnBombCarts)

BombCarts:AddSwitch("Spam Spawn Bomb Carts", function(v)
	spamBombs = v
end)

BombCarts:AddSlider("Spam Interval", function(v)
    bombInterval = v
end, {min = 0, max = 10})

task.spawn(function()
    while task.wait(bombInterval) do
        if spamMove then moveAllCarts() end
        if spamExplode then explodeAllCarts() end
	if spamBombs then spawnBombCarts() end
    end
end)

Gates:AddButton("Toggle All Gates", toggleAllGates)

Gates:AddSwitch("Spam Toggle All Gates", function(t)
	spamGates = t
end)

Gates:AddSlider("Spam Interval", function(v)
	gateInterval = v
end)

task.spawn(function()
	while task.wait(gateInterval) do
		if spamGates then toggleAllGates() end
	end
end)

Misc:AddButton("Get All Tools", function()
    local chr = Players.LocalPlayer.Character
	if chr then 
        chr:SetPrimaryPartCFrame(CFrame.new(-619.2999877929688, 159.5179443359375, 699.6990966796875)) 
        wait(0.2)
        chr:SetPrimaryPartCFrame(game.Workspace.printer.CFrame)
        wait(0.2)
        chr:SetPrimaryPartCFrame(game.Workspace.unprinter.CFrame)
    end
end)

Misc:AddButton("Teleport to Spawn", function()
	if Players.LocalPlayer.Character then Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-13, 3, 15)) end
end)

Misc:AddButton("Teleport to Winners", function()
	if Players.LocalPlayer.Character then Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-610, 161, 674)) end
end)

Misc:AddButton("Get All Coins", getAllCoins)

Misc:AddSwitch("Grind All Coins", function(t)
    getAllCoins()
	grindCoins = t
end)

game.Workspace.coinspawner.DescendantAdded:Connect(function()
    if grindCoins then
        repeat
            wait()
        until Players.LocalPlayer.Character
        getAllCoins()
    end
end)
