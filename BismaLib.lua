--- -- [[ BISMA PRIVATE LIBRARY UI ]]
local BismaLib = {}

function BismaLib:CreateWindow(hubName)
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local MainFrame = Instance.new("Frame", ScreenGui)
    local Title = Instance.new("TextLabel", MainFrame)
    local Container = Instance.new("ScrollingFrame", MainFrame)
    local UIList = Instance.new("UIListLayout", Container)
    local CloseBtn = Instance.new("TextButton", MainFrame)
    local OpenBtn = Instance.new("TextButton", ScreenGui)

    -- Pengaturan Tampilan Luas (80% Layar)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
    MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
    MainFrame.Active = true
    MainFrame.Draggable = true

    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    Title.Text = hubName
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 25

    Container.Position = UDim2.new(0, 20, 0, 70)
    Container.Size = UDim2.new(0.95, 0, 0.85, 0)
    Container.BackgroundTransparency = 1
    Container.CanvasSize = UDim2.new(0, 0, 5, 0) -- Muat banyak tombol
    UIList.Parent = Container
    UIList.Padding = UDim.new(0, 10)

    -- Fungsi Buka Tutup
    OpenBtn.Size = UDim2.new(0, 120, 0, 40)
    OpenBtn.Position = UDim2.new(0, 10, 0.5, 0)
    OpenBtn.Text = "OPEN BISMA"
    OpenBtn.Visible = false
    
    CloseBtn.Position = UDim2.new(1, -50, 0, 0)
    CloseBtn.Size = UDim2.new(0, 50, 0, 50)
    CloseBtn.Text = "X"

    CloseBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false OpenBtn.Visible = true end)
    OpenBtn.MouseButton1Click:Connect(function() MainFrame.Visible = true OpenBtn.Visible = false end)

    local Elements = {}
    function Elements:AddToggle(text, callback)
        local btn = Instance.new("TextButton", Container)
        btn.Size = UDim2.new(0.95, 0, 0, 70)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        btn.Text = text .. ": OFF"
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        local active = false
        btn.MouseButton1Click:Connect(function()
            active = not active
            btn.Text = text .. (active and ": ON" or ": OFF")
            btn.BackgroundColor3 = active and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(40, 40, 40)
            callback(active)
        end)
    end
    return Elements
end

return BismaLib
