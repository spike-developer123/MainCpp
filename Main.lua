-- =============================================
-- Fake Robux GUI для Delta Executor
-- =============================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Удаляем старое меню
for _, gui in pairs(player.PlayerGui:GetChildren()) do
    if gui.Name == "FakeRobuxGUI" then
        gui:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FakeRobuxGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 380, 0, 300)
Frame.Position = UDim2.new(0.5, -190, 0.25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 16)

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundTransparency = 1
Title.Text = "💰 Fake Robux"
Title.TextColor3 = Color3.fromRGB(0, 255, 120)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

-- Никнейм
local UserLabel = Instance.new("TextLabel")
UserLabel.Size = UDim2.new(1, 0, 0, 30)
UserLabel.Position = UDim2.new(0, 0, 0, 60)
UserLabel.BackgroundTransparency = 1
UserLabel.Text = "Аккаунт: " .. player.Name
UserLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
UserLabel.TextScaled = true
UserLabel.Font = Enum.Font.Gotham
UserLabel.Parent = Frame

-- Поле ввода
local AmountBox = Instance.new("TextBox")
AmountBox.Size = UDim2.new(0.85, 0, 0, 45)
AmountBox.Position = UDim2.new(0.075, 0, 0, 110)
AmountBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
AmountBox.Text = "13457892"
AmountBox.PlaceholderText = "Введите сумму Robux"
AmountBox.TextColor3 = Color3.fromRGB(255, 255, 255)
AmountBox.TextScaled = true
AmountBox.Font = Enum.Font.Gotham
AmountBox.Parent = Frame

Instance.new("UICorner", AmountBox).CornerRadius = UDim.new(0, 10)

-- Кнопка Применить
local ApplyBtn = Instance.new("TextButton")
ApplyBtn.Size = UDim2.new(0.7, 0, 0, 50)
ApplyBtn.Position = UDim2.new(0.15, 0, 0, 175)
ApplyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ApplyBtn.Text = "✅ Применить"
ApplyBtn.TextColor3 = Color3.new(1, 1, 1)
ApplyBtn.TextScaled = true
ApplyBtn.Font = Enum.Font.GothamBold
ApplyBtn.Parent = Frame

Instance.new("UICorner", ApplyBtn).CornerRadius = UDim.new(0, 12)

-- Отображение Robux
local RobuxLabel = Instance.new("TextLabel")
RobuxLabel.Size = UDim2.new(1, 0, 0, 50)
RobuxLabel.Position = UDim2.new(0, 0, 0, 235)
RobuxLabel.BackgroundTransparency = 1
RobuxLabel.Text = "13,457,892"
RobuxLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
RobuxLabel.TextScaled = true
RobuxLabel.Font = Enum.Font.GothamBold
RobuxLabel.Parent = Frame

-- Кнопка закрытия
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -45, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.TextScaled = true
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = Frame

Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)

-- Функция форматирования числа
local function formatNumber(num)
    num = tostring(num):reverse():gsub("(%d%d%d)", "%1,"):reverse()
    return num:gsub("^,", "")
end

-- Обновление
local function updateRobux()
    local text = AmountBox.Text:gsub("[^%d]", "")
    if text == "" then text = "0" end
    local number = tonumber(text) or 0
    RobuxLabel.Text = formatNumber(number)
end

ApplyBtn.MouseButton1Click:Connect(updateRobux)
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Автоматическое обновление при вводе
AmountBox:GetPropertyChangedSignal("Text"):Connect(updateRobux)

print("✅ Fake Robux GUI успешно загружен! (Delta)")
task.wait(0.5)
updateRobux() -- начальное форматирование
