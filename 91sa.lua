---开源脚本，禁止圈钱1047396923
local executor = identifyexecutor and identifyexecutor() or "Unknown"

if executor then
    print("Executor detectado:", executor)
else
    warn("Executor não detectado.")
end

game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "91制片，必是精品";
	Text = "感谢使用，QQ群聊1047396923";
	Icon = "rbxthumb://type=Asset&id=7121294175&w=150&h=150"})
Duration = 10;

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/Librarykavoui"))()

local Window = Library.CreateLib("91 HUB V1 | Stands Awakening｜QQ群聊1047396923", "DarkTheme")

local Tab = Window:NewTab("主要")
local Section = Tab:NewSection("游戏内使用")

Section:NewButton("自动捡道具", "IM BACK LOLLL", function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

-- Raio da aura de coleta aumentado para 60000
local collectRadius = 5000

-- Função para coletar itens próximos
local function collectNearbyItems()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and (obj.Position - root.Position).Magnitude <= collectRadius then
            for _, child in ipairs(obj:GetChildren()) do
                if child:IsA("TouchTransmitter") then
                    firetouchinterest(root, obj, 0)
                    firetouchinterest(root, obj, 1)
                end
            end
        end
    end
end

-- Loop contínuo da aura de coleta
while true do
    pcall(collectNearbyItems)
    task.wait(0.3)
end
    print("Clicked")
end)

Section:NewButton("换服", "nada", function()
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local PlaceId = game.PlaceId

local function hopServer()
    local success, servers = pcall(function()
        local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", PlaceId)
        return HttpService:JSONDecode(game:HttpGet(url))
    end)

    if success and servers and servers.data then
        for _, server in ipairs(servers.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(PlaceId, server.id, player)
                break
            end
        end
    else
        warn("Falha ao buscar servidores.")
    end
end

hopServer()
    print("Clicked")
end)

local Tab = Window:NewTab("Boss")
local Section = Tab:NewSection("电脑使用这个↓")

Section:NewButton("自动刷boss", ".", function()
repeat task.wait() until game:IsLoaded()

-- Anti-AFK
pcall(function()
    for _, v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
        v:Disable()
    end
end)

-- Serviços
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

-- Variáveis do jogo
local Time = true
local Attacking = Workspace:WaitForChild("Dead")
local Obby = Workspace:WaitForChild("ObbyW")
local Phase = Workspace:WaitForChild("BossPhase")
local Health = Workspace:WaitForChild("TrollHealth")

-- Limpar efeitos
pcall(function()
    if Workspace:FindFirstChild("Effects") then Workspace.Effects:Destroy() end
    if Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("ThunderParts") then
        Workspace.Map.ThunderParts:Destroy()
    end
end)

-- Aumentar tamanho da espada
local function EquipAndResizeSword()
    local sword = LocalPlayer.Backpack:FindFirstChild("KnightsSword") or Character:FindFirstChild("KnightsSword")
    if sword then
        sword.Parent = Character
        task.wait(0.1)
        pcall(function()
            local handle = sword:FindFirstChild("Handle")
            if handle then
                local box = Instance.new("SelectionBox")
                box.Name = "SelectionBoxCreated"
                box.Parent = handle
                box.Adornee = handle
                handle.Massless = true
                handle.Size = Vector3.new(20, 20, 500)
                sword.GripPos = Vector3.new(0, 0, 0)
            end
        end)
        Humanoid:UnequipTools()
        sword.Parent = Character
    end
end
EquipAndResizeSword()

-- Auto-teleport
task.spawn(function()
    while task.wait() do
        if not Attacking.Value then
            if Obby.Value then
                HumanoidRootPart.CFrame = CFrame.new(20.456, 113.245, 196.613)
            elseif Phase.Value == "None" then
                HumanoidRootPart.CFrame = CFrame.new(-5.47, -4.45, 248.21)
            else
                HumanoidRootPart.CFrame = CFrame.new(-19.89, -4.77, 142.49)
            end
        end
    end
end)

-- Auto-attack
task.spawn(function()
    while task.wait() do
        if not Attacking.Value and Character:FindFirstChild("KnightsSword") then
            Character.KnightsSword:Activate()
        end
    end
end)

-- Health Percent Check
local function Percent(a, b)
    return a / b
end

Health:GetPropertyChangedSignal("Value"):Connect(function()
    local max = Health:FindFirstChild("MaxHealth") and Health.MaxHealth.Value or 1
    if Percent(Health.Value, max) <= 0.003 and Time then
        Time = false
        Humanoid:UnequipTools()
        task.wait(1) -- tempo de espera pode ser ajustado
        EquipAndResizeSword()
    end
end)
    print("Clicked")
end)

local Section = Tab:NewSection("手机使用这个↓")

Section:NewButton("进入后等待10s再执行", "ButtonInfo", function()
    print("Clicked")
end)

Section:NewButton("自动刷boss", ".", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sunexn/standsawakening/main/uncanny.lua",true))()
    print("Clicked")
end)

Section:NewButton("加攻速", "a", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-no-cooldown-6517"))()
    print("Clicked")
end)

local Section = Tab:NewSection("通用配合脚本")

Section:NewButton("提高亮度", ".", function()
loadstring(game:HttpGet("https://pastebin.com/raw/Dh9ePW8G"))()
    print("Clicked")
end)

Section:NewButton("自动AFK", "aio", function()
loadstring(game:HttpGet("https://pastebin.com/raw/4m4fLjXR"))()
    print("Clicked")
end)

Section:NewButton("提升FPS", "nada aqui", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Anti-lag-optimizer-script-38277"))()
    print("Clicked")
end)

local Tab = Window:NewTab("传送")
local Section = Tab:NewSection("禁止boss使用")

Section:NewButton("Timmy", ".", function()
local player = game.Players.LocalPlayer
                local root = player.Character:WaitForChild("HumanoidRootPart")
                root.CFrame = CFrame.new(1399.550000, 584.340000, -219.290000)
            
    print("Clicked")
end)

Section:NewButton("农场小岛", "CROWN CRISON SA", function()

                local player = game.Players.LocalPlayer
                local root = player.Character:WaitForChild("HumanoidRootPart")
                root.CFrame = CFrame.new(-298.690000, 529.770000, -1489.930000)
            
    print("Clicked")
end)

Section:NewButton("银行", "nada", function()

                local player = game.Players.LocalPlayer
                local root = player.Character:WaitForChild("HumanoidRootPart")
                root.CFrame = CFrame.new(1342.760000, 587.620000, -552.910000)

print("Clicked")
end)

Section:NewButton("Portal", "manda", function()

                local player = game.Players.LocalPlayer
                local root = player.Character:WaitForChild("HumanoidRootPart")
                root.CFrame = CFrame.new(1134.740000, 584.070000, -709.320000)
            
    print("Clicked")
end)

Section:NewButton("任务地点", "lol", function()

                local player = game.Players.LocalPlayer
                local root = player.Character:WaitForChild("HumanoidRootPart")
                root.CFrame = CFrame.new(1043.650000, 583.260000, -441.310000)
            
    print("Clicked")
end)

local Tab = Window:NewTab("其他")
local Section = Tab:NewSection("禁止boss使用")

Section:NewButton("替身Pose", ".", function()
local player = game.Players.LocalPlayer
local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")

if humanoid then
	humanoid.WalkSpeed = 16
	humanoid.JumpPower = 50
	humanoid.PlatformStand = false
end

-- Se o jogo tentar travar de novo, força o desbloqueio a cada 0.2s
while true do
	task.wait(0.2)
	pcall(function()
		local character = player.Character
		if character then
			local hum = character:FindFirstChildOfClass("Humanoid")
			if hum then
				hum.WalkSpeed = 16
				hum.JumpPower = 50
				hum.PlatformStand = false
			end
		end
	end)
end
    print("Clicked")
end)

Section:NewSlider("WalkSpeed", "SliderInfo", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("JumpPower", "Adjust your jump height", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local Tab = Window:NewTab("其他2")
local Section = Tab:NewSection("其他脚本")

Section:NewButton("Infinite yield", ".", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-infinite-yield-39585"))()
    print("Clicked")
end)

Section:NewButton("飞行 v3", ".", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gui-Fly-v3-37111"))()
    print("Clicked")
end)

local Tab = Window:NewTab("Credits")
local Section = Tab:NewSection("Made by 91")

Section:NewButton("感谢使用，官方群聊1047396923", ".", function()
    print("Clicked")
end)

Section:NewButton("https://qun.qq.com/universal-share/share?ac=1&authKey=C6Fly3uMec1W8NlQb1iXAGT466OKQ%2FAeKRgZhneAl0TRrxtowyrdrZINLMc3jSmJ&busi_data=eyJncm91cENvZGUiOiIxMDQ3Mzk2OTIzIiwidG9rZW4iOiIvc3ZSRUxSTkpTWW9WYXhBYXBBRUZKVEl2WWV0NHRXaXhqUEpEUWovVDBvQUNrbFZSbGdVajYvYjZHSU5ISzJ1IiwidWluIjoiMjkxNjUwMjYyNSJ9&data=z9u_X-fObXn0nPQ3zXVY5kQDKmC4G9IYVgeShetobKpzv6ypqmpfetiC1eMdAWGJcf61Zaqe4CS1Im4tDHng2Q&svctype=4&tempid=h5_group_info", ".", function()
setclipboard("https://qun.qq.com/universal-share/share?ac=1&authKey=C6Fly3uMec1W8NlQb1iXAGT466OKQ%2FAeKRgZhneAl0TRrxtowyrdrZINLMc3jSmJ&busi_data=eyJncm91cENvZGUiOiIxMDQ3Mzk2OTIzIiwidG9rZW4iOiIvc3ZSRUxSTkpTWW9WYXhBYXBBRUZKVEl2WWV0NHRXaXhqUEpEUWovVDBvQUNrbFZSbGdVajYvYjZHSU5ISzJ1IiwidWluIjoiMjkxNjUwMjYyNSJ9&data=z9u_X-fObXn0nPQ3zXVY5kQDKmC4G9IYVgeShetobKpzv6ypqmpfetiC1eMdAWGJcf61Zaqe4CS1Im4tDHng2Q&svctype=4&tempid=h5_group_info")
    print("Clicked")
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local Toggle = Instance.new("TextButton")
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0, 38, 0, 38)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = "Open"
Toggle.TextColor3 = Color3.fromRGB(248, 248, 248)
Toggle.TextSize = 25.000
Toggle.Draggable = true
Toggle.MouseButton1Click:connect(function()
    Library:ToggleUI()
end) 