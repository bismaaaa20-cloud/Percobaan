-- [[ BISMA PRIVATE LIBRARY - ULTIMATE EDITION ]] --
local BismaLib = {}

function BismaLib:CreateWindow(hubName)
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    ScreenGui.Name = "BismaHub_V10"

    -- [[ LOGO KOTAK KECIL (SAAT TUTUP) ]]
    local LogoBtn = Instance.new("ImageButton", ScreenGui)
    local UICornerLogo = Instance.new("UICorner", LogoBtn)
    local UIStrokeLogo = Instance.new("UIStroke", LogoBtn)
    
    LogoBtn.Size = UDim2.new(0, 65, 0, 65) 
    LogoBtn.Position = UDim2.new(0, 15, 0.5, -32)
    LogoBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    LogoBtn.Image = "rbxassetid://132204780516609" -- ID Logo B Mahkota
    LogoBtn.Visible = false
    LogoBtn.Draggable = true 
    UICornerLogo.CornerRadius = UDim.new(0, 15)
    UIStrokeLogo.Thickness = 2
    UIStrokeLogo.Color = Color3.fromRGB(0, 150, 255)

    -- [[ UI UTAMA (LUAS & MODERN) ]]
    local MainFrame = Instance.new("Frame", ScreenGui)
    local UICornerMain = Instance.new("UICorner", MainFrame)
    local UIStrokeMain = Instance.new("UIStroke", MainFrame)
    
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    MainFrame.Size = UDim2.new(0, 620, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -310, 0.5, -200)
    MainFrame.ClipsDescendants = true
    MainFrame.Draggable = true
    MainFrame.Active = true

    UICornerMain.CornerRadius = UDim.new(0, 12)
    UIStrokeMain.Thickness = 2
    UIStrokeMain.Color = Color3.fromRGB(150, 0, 0) -- Glow Merah

    -- Sidebar
    local Sidebar = Instance.new("Frame", MainFrame)
    Sidebar.Size = UDim2.new(0, 170, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 12)

    local Title = Instance.new("TextLabel", Sidebar)
    Title.Size = UDim2.new(1, 0, 0, 60)
    Title.Text = hubName
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 20
    Title.BackgroundTransparency = 1

    -- Close Button
    local CloseBtn = Instance.new("TextButton", MainFrame)
    CloseBtn.Size = UDim2.new(0, 35, 0, 35)
    CloseBtn.Position = UDim2.new(1, -45, 0, 10)
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    CloseBtn.TextSize = 35
    CloseBtn.BackgroundTransparency = 1

    -- Container Fitur
    local Container = Instance.new("ScrollingFrame", MainFrame)
    Container.Position = UDim2.new(0, 185, 0, 60)
    Container.Size = UDim2.new(1, -200, 1, -80)
    Container.BackgroundTransparency = 1
    Container.ScrollBarThickness = 2
    Container.CanvasSize = UDim2.new(0, 0, 10, 0)
    Instance.new("UIListLayout", Container).Padding = UDim.new(0, 10)

    -- Logika Transisi (Ayu Ae)
    CloseBtn.MouseButton1Click:Connect(function()
        MainFrame:TweenSize(UDim2.new(0,0,0,0), "Out", "Quad", 0.2, true)
        task.wait(0.2)
        MainFrame.Visible = false
        LogoBtn.Visible = true
    end)

    LogoBtn.MouseButton1Click:Connect(function()
        LogoBtn.Visible = false
        MainFrame.Visible = true
        MainFrame:TweenSize(UDim2.new(0, 620, 0, 400), "Out", "Back", 0.3, true)
    end)

    local Elements = {}
    function Elements:AddToggle(text, callback)
        local btn = Instance.new("TextButton", Container)
        btn.Size = UDim2.new(0.95, 0, 0, 50)
        btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        btn.Text = "  " .. text
        btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Font = Enum.Font.GothamSemibold
        btn.TextSize = 14
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
        
        local act = false
        btn.MouseButton1Click:Connect(function()
            act = not act
            btn.BackgroundColor3 = act and Color3.fromRGB(40, 40, 40) or Color3.fromRGB(25, 25, 25)
            btn.TextColor3 = act and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 200)
            callback(act)
        end)
    end
    return Elements
end

return BismaLib
