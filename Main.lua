local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Удаляем старое меню
for _, v in pairs(player:WaitForChild("PlayerGui"):GetChildren()) do
    if v.Name == "FakeRobuxGUI" then v:Destroy() end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FakeRobuxGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player.PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 420, 0, 380)
Frame.Position = UDim2.new(0.5, -210, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Frame.Parent = ScreenGui

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 18)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundTransparency = 1
Title.Text = "💎 Roblox"
Title.TextColor3 = Color3.fromRGB(0, 162, 255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

local Username = Instance.new("TextLabel")
Username.Size = UDim2.new(1, 0, 0, 30)
Username.Position = UDim2.new(0, 0, 0, 60)
Username.BackgroundTransparency = 1
Username.Text = "Аккаунт: " .. player.Name
Username.TextColor3 = Color3.fromRGB(200, 200, 200)
Username.TextScaled = true
Username.Parent = Frame

local AmountBox = Instance.new("TextBox")
AmountBox.Size = UDim2.new(0.85, 0, 0, 50)
AmountBox.Position = UDim2.new(0.075, 0, 0, 110)
AmountBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
AmountBox.Text = "15000000"
AmountBox.PlaceholderText = "Введите количество Robux"
AmountBox.TextColor3 = Color3.fromRGB(255, 255, 255)
AmountBox.TextScaled = true
AmountBox.Font = Enum.Font.Gotham
AmountBox.Parent = Frame
Instance.new("UICorner", AmountBox).CornerRadius = UDim.new(0, 12)

local RobuxLabel = Instance.new("TextLabel")
RobuxLabel.Size = UDim2.new(1, 0, 0, 70)
RobuxLabel.Position = UDim2.new(0, 0, 0, 180)
RobuxLabel.BackgroundTransparency = 1
RobuxLabel.Text = "15,000,000"
RobuxLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
RobuxLabel.TextScaled = true
RobuxLabel.Font = Enum.Font.GothamBold
RobuxLabel.Parent = Frame

local BuyBtn = Instance.new("TextButton")
BuyBtn.Size = UDim2.new(0.75, 0, 0, 55)
BuyBtn.Position = UDim2.new(0.125, 0, 0, 270)
BuyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
BuyBtn.Text = "🛒 Купить предмет"
BuyBtn.TextColor3 = Color3.new(1,1,1)
BuyBtn.TextScaled = true
BuyBtn.Font = Enum.Font.GothamBold
BuyBtn.Parent = Frame
Instance.new("UICorner", BuyBtn).CornerRadius = UDim.new(0, 12)

-- Функции
local function formatNumber(num)
    return tostring(num):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
end

local function updateRobux()
    local num = tonumber(AmountBox.Text:gsub("[^%d]", "")) or 0
    RobuxLabel.Text = formatNumber(num)
end

AmountBox:GetPropertyChangedSignal("Text"):Connect(updateRobux)

BuyBtn.MouseButton1Click:Connect(function()
    local fakePurchase = Instance.new("ScreenGui", player.PlayerGui)
    local pf = Instance.new("Frame", fakePurchase)
    pf.Size = UDim2.new(0, 320, 0, 200)
    pf.Position = UDim2.new(0.5, -160, 0.35, 0)
    pf.BackgroundColor3 = Color3.fromRGB(25,25,25)
    Instance.new("UICorner", pf).CornerRadius = UDim.new(0,16)
    
    local txt = Instance.new("TextLabel", pf)
    txt.Size = UDim2.new(1,0,1,0)
    txt.BackgroundTransparency = 1
    txt.Text = "Покупка товара...\n\n✅ Успешно куплено!\n(Фейковая покупка)"
    txt.TextColor3 = Color3.fromRGB(0,255,100)
    txt.TextScaled = true
    txt.Font = Enum.Font.GothamBold
    
    task.wait(3)
    fakePurchase:Destroy()
end)

updateRobux()
print("✅ Fake Robux обновлён!")
