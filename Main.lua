-- =============================================
-- Fake Robux + Fake Purchase Window
-- =============================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Удаляем старое
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
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.Parent = ScreenGui

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 18)

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundTransparency = 1
Title.Text = "💎 Roblox"
Title.TextColor3 = Color3.fromRGB(0, 162, 255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

-- Ник
local Username = Instance.new("TextLabel")
Username.Size = UDim2.new(1, 0, 0, 30)
Username.Position = UDim2.new(0, 0, 0, 65)
Username.BackgroundTransparency = 1
Username.Text = "Аккаунт: " .. player.Name
Username.TextColor3 = Color3.fromRGB(200, 200, 200)
Username.TextScaled = true
Username.Font = Enum.Font.Gotham
Username.Parent = Frame

-- Поле ввода Robux
local AmountBox = Instance.new("TextBox")
AmountBox.Size = UDim2.new(0.85, 0, 0, 50)
AmountBox.Position = UDim2.new(0.075, 0, 0, 110)
AmountBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
AmountBox.Text = "12500000"
AmountBox.PlaceholderText = "Введите количество Robux"
AmountBox.TextColor3 = Color3.fromRGB(255, 255, 255)
AmountBox.TextScaled = true
AmountBox.Font = Enum.Font.Gotham
AmountBox.Parent = Frame
Instance.new("UICorner", AmountBox).CornerRadius = UDim.new(0, 12)

-- Отображение баланса
local RobuxLabel = Instance.new("TextLabel")
RobuxLabel.Size = UDim2.new(1, 0, 0, 70)
RobuxLabel.Position = UDim2.new(0, 0, 0, 175)
RobuxLabel.BackgroundTransparency = 1
RobuxLabel.Text = "12,500,000"
RobuxLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
RobuxLabel.TextScaled = true
RobuxLabel.Font = Enum.Font.GothamBold
RobuxLabel.Parent = Frame

-- Кнопка покупки
local BuyBtn = Instance.new("TextButton")
BuyBtn.Size = UDim2.new(0.8, 0, 0, 55)
BuyBtn.Position = UDim2.new(0.1, 0, 0, 265)
BuyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
BuyBtn.Text = "🛒 Купить предмет"
BuyBtn.TextColor3 = Color3.new(1,1,1)
BuyBtn.TextScaled = true
BuyBtn.Font = Enum.Font.GothamBold
BuyBtn.Parent = Frame
Instance.new("UICorner", BuyBtn).CornerRadius = UDim.new(0, 12)

-- Кнопка закрытия
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -45, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.TextScaled = true
CloseBtn.Parent = Frame
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1,0)

-- Форматирование чисел
local function formatNumber(num)
    return tostring(num):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
end

local function updateRobux()
    local num = tonumber(AmountBox.Text:gsub("[^%d]", "")) or 0
    RobuxLabel.Text = formatNumber(num)
end

AmountBox:GetPropertyChangedSignal("Text"):Connect(updateRobux)

-- Фейковое окно покупки Roblox
BuyBtn.MouseButton1Click:Connect(function()
    local purchaseGui = Instance.new("ScreenGui", player.PlayerGui)
    local pFrame = Instance.new("Frame", purchaseGui)
    pFrame.Size = UDim2.new(0, 340, 0, 220)
    pFrame.Position = UDim2.new(0.5, -170, 0.35, 0)
    pFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Instance.new("UICorner", pFrame).CornerRadius = UDim.new(0, 16)

    local pTitle = Instance.new("TextLabel", pFrame)
    pTitle.Size = UDim2.new(1,0,0,50)
    pTitle.BackgroundTransparency = 1
    pTitle.Text = "Подтверждение покупки"
    pTitle.TextColor3 = Color3.fromRGB(255,255,255)
    pTitle.TextScaled = true
    pTitle.Font = Enum.Font.GothamBold

    local pText = Instance.new("TextLabel", pFrame)
    pText.Size = UDim2.new(1,0,0,100)
    pText.Position = UDim2.new(0,0,0,60)
    pText.BackgroundTransparency = 1
    pText.Text = "Вы уверены, что хотите купить этот предмет?\n\nС вашего баланса будет списано:\n" .. RobuxLabel.Text .. " Robux"
    pText.TextColor3 = Color3.fromRGB(200,200,200)
    pText.TextScaled = true

    local YesBtn = Instance.new("TextButton", pFrame)
    YesBtn.Size = UDim2.new(0.45,0,0,40)
    YesBtn.Position = UDim2.new(0.05,0,0,170)
    YesBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    YesBtn.Text = "Купить"
    YesBtn.TextColor3 = Color3.new(1,1,1)
    YesBtn.TextScaled = true
    Instance.new("UICorner", YesBtn).CornerRadius = UDim.new(0,8)

    local NoBtn = Instance.new("TextButton", pFrame)
    NoBtn.Size = UDim2.new(0.45,0,0,40)
    NoBtn.Position = UDim2.new(0.5,0,0,170)
    NoBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    NoBtn.Text = "Отмена
