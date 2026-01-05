
local Library = {}
local SaveTheme = {}
local UIStateTracker = {
    Elements = {},
    Callbacks = {}
}

-- Theme configurations
local themes = {
    index = {'Dark', 'Amethyst'},
    Amethyst = {
        ['Shadow'] = Color3.fromRGB(24, 24, 31),
        ['Background'] = Color3.fromRGB(29, 28, 38),
        ['Page'] = Color3.fromRGB(24, 24, 31),
        ['Main'] = Color3.fromRGB(91, 68, 209),
        ['Text & Icon'] = Color3.fromRGB(255, 255, 255),
        ['Function'] = {
            ['Toggle'] = {
                ['Background'] = Color3.fromRGB(29, 28, 38),
                ['True'] = {
                    ['Toggle Background'] = Color3.fromRGB(44, 34, 103),
                    ['Toggle Value'] = Color3.fromRGB(91, 68, 209),
                },
                ['False'] = {
                    ['Toggle Background'] = Color3.fromRGB(36, 35, 48),
                    ['Toggle Value'] = Color3.fromRGB(44, 42, 62),
                }
            },
            ['Label'] = {
                ['Background'] = Color3.fromRGB(29, 28, 38),
            },
            ['Dropdown'] = {
                ['Background'] = Color3.fromRGB(29, 28, 38),
                ['Value Background'] = Color3.fromRGB(24, 24, 31),
                ['Value Stroke'] = Color3.fromRGB(255, 255, 255),
                ['Dropdown Select'] = {
                    ['Background'] = Color3.fromRGB(24, 24, 31),
                    ['Search'] = Color3.fromRGB(35, 35, 42),
                    ['Item Background'] = Color3.fromRGB(45, 45, 52),
                }
            },
            ['Slider'] = {
                ['Background'] = Color3.fromRGB(29, 28, 38),
                ['Value Background'] = Color3.fromRGB(24, 24, 31),
                ['Value Stroke'] = Color3.fromRGB(255, 255, 255),
                ['Slider Bar'] = Color3.fromRGB(44, 34, 103),
                ['Slider Bar Value'] = Color3.fromRGB(91, 68, 209),
                ['Circle Value'] = Color3.fromRGB(255, 255, 255)
            },
            ['Code'] = {
                ['Background'] = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(29, 28, 38)), ColorSequenceKeypoint.new(1, Color3.fromRGB(29, 28, 38))},
                ['Background Code'] = Color3.fromRGB(51, 62, 68),
                ['Background Code Value'] = Color3.fromRGB(38, 50, 56),
                ['ScrollingFrame Code'] = Color3.fromRGB(216, 150, 179)
            },
            ['Button'] = {
                ['Background'] = Color3.fromRGB(29, 28, 38),
                ['Click'] = Color3.fromRGB(255, 255, 255)
            },
            ['Textbox'] = {
                ['Background'] = Color3.fromRGB(29, 28, 38),
                ['Value Background'] = Color3.fromRGB(24, 24, 31),
                ['Value Stroke'] = Color3.fromRGB(255, 255, 255),
            },
            ['Keybind'] = {
                ['Background'] = Color3.fromRGB(29, 28, 38),
                ['Value Background'] = Color3.fromRGB(24, 24, 31),
                ['Value Stroke'] = Color3.fromRGB(255, 255, 255),
                ['True'] = {
                    ['Toggle Background'] = Color3.fromRGB(44, 34, 103),
                    ['Toggle Value'] = Color3.fromRGB(91, 68, 209),
                },
                ['False'] = {
                    ['Toggle Background'] = Color3.fromRGB(36, 35, 48),
                    ['Toggle Value'] = Color3.fromRGB(44, 42, 62),
                }
            },
            ['Color Picker'] = {
                ['Background'] = Color3.fromRGB(29, 28, 38),
                ['Color Select'] = {
                    ['Background'] = Color3.fromRGB(24, 24, 31),
                    ['UIStroke'] = Color3.fromRGB(255, 255, 255),
                }
            }
        }
    },
    Dark = {
        ['Shadow'] = Color3.fromRGB(15, 15, 15),
        ['Background'] = Color3.fromRGB(20, 20, 20),
        ['Page'] = Color3.fromRGB(18, 18, 18),
        ['Main'] = Color3.fromRGB(50, 50, 50),
        ['Text & Icon'] = Color3.fromRGB(230, 230, 230),
        ['Function'] = {
            ['Toggle'] = {
                ['Background'] = Color3.fromRGB(25, 25, 25),
                ['True'] = {
                    ['Toggle Background'] = Color3.fromRGB(40, 40, 40),
                    ['Toggle Value'] = Color3.fromRGB(70, 130, 180),
                },
                ['False'] = {
                    ['Toggle Background'] = Color3.fromRGB(30, 30, 30),
                    ['Toggle Value'] = Color3.fromRGB(40, 40, 40),
                }
            },
            ['Label'] = {
                ['Background'] = Color3.fromRGB(25, 25, 25),
            },
            ['Dropdown'] = {
                ['Background'] = Color3.fromRGB(25, 25, 25),
                ['Value Background'] = Color3.fromRGB(20, 20, 20),
                ['Value Stroke'] = Color3.fromRGB(230, 230, 230),
                ['Dropdown Select'] = {
                    ['Background'] = Color3.fromRGB(20, 20, 20),
                    ['Search'] = Color3.fromRGB(30, 30, 30),
                    ['Item Background'] = Color3.fromRGB(30, 30, 30),
                }
            },
            ['Slider'] = {
                ['Background'] = Color3.fromRGB(25, 25, 25),
                ['Value Background'] = Color3.fromRGB(20, 20, 20),
                ['Value Stroke'] = Color3.fromRGB(230, 230, 230),
                ['Slider Bar'] = Color3.fromRGB(40, 40, 40),
                ['Slider Bar Value'] = Color3.fromRGB(70, 130, 180),
                ['Circle Value'] = Color3.fromRGB(255, 255, 255)
            },
            ['Code'] = {
                ['Background'] = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 25)), ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))},
                ['Background Code'] = Color3.fromRGB(35, 35, 35),
                ['Background Code Value'] = Color3.fromRGB(28, 28, 28),
                ['ScrollingFrame Code'] = Color3.fromRGB(150, 150, 150)
            },
            ['Button'] = {
                ['Background'] = Color3.fromRGB(25, 25, 25),
                ['Click'] = Color3.fromRGB(230, 230, 230)
            },
            ['Textbox'] = {
                ['Background'] = Color3.fromRGB(25, 25, 25),
                ['Value Background'] = Color3.fromRGB(20, 20, 20),
                ['Value Stroke'] = Color3.fromRGB(230, 230, 230),
            },
            ['Keybind'] = {
                ['Background'] = Color3.fromRGB(25, 25, 25),
                ['Value Background'] = Color3.fromRGB(20, 20, 20),
                ['Value Stroke'] = Color3.fromRGB(230, 230, 230),
                ['True'] = {
                    ['Toggle Background'] = Color3.fromRGB(40, 40, 40),
                    ['Toggle Value'] = Color3.fromRGB(70, 130, 180),
                },
                ['False'] = {
                    ['Toggle Background'] = Color3.fromRGB(30, 30, 30),
                    ['Toggle Value'] = Color3.fromRGB(40, 40, 40),
                }
            },
            ['Color Picker'] = {
                ['Background'] = Color3.fromRGB(25, 25, 25),
                ['Color Select'] = {
                    ['Background'] = Color3.fromRGB(20, 20, 20),
                    ['UIStroke'] = Color3.fromRGB(230, 230, 230),
                }
            }
        }
    },
}

-- Create main UI container
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Dummy Kawaii"
ScreenGui.Parent = not game:GetService("RunService"):IsStudio() and game:GetService("CoreGui") or game:GetService("Players").LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Services
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")

-- UI State Tracking System
function UIStateTracker:TrackElement(name, elementType, getStateFunction, setStateFunction)
    if not self.Elements[name] then
        self.Elements[name] = {
            Type = elementType,
            GetState = getStateFunction,
            SetState = setStateFunction,
            InitialState = getStateFunction(),
            CurrentState = getStateFunction(),
            HasChanged = false
        }
    end
end

function UIStateTracker:UpdateElementState(name)
    local element = self.Elements[name]
    if element then
        local newState = element.GetState()
        element.CurrentState = newState
        element.HasChanged = (element.CurrentState ~= element.InitialState)
        return element.HasChanged
    end
    return false
end

-- UpdateUI Function
function Library:UpdateUI()
    local updates = {}
    local anyChanged = false
    
    for name, element in pairs(UIStateTracker.Elements) do
        local changed = UIStateTracker:UpdateElementState(name)
        if changed then
            anyChanged = true
            table.insert(updates, {
                Name = name,
                Type = element.Type,
                CurrentState = element.CurrentState,
                InitialState = element.InitialState
            })
        end
    end
    
    -- Trigger callbacks if any changes detected
    if anyChanged then
        for _, callback in pairs(UIStateTracker.Callbacks) do
            pcall(callback, updates)
        end
    end
    
    return updates
end

-- UI State Management Functions
function Library:OnUIUpdate(callback)
    table.insert(UIStateTracker.Callbacks, callback)
end

function Library:GetUIStates()
    local states = {}
    for name, element in pairs(UIStateTracker.Elements) do
        states[name] = {
            Type = element.Type,
            CurrentState = element.CurrentState,
            InitialState = element.InitialState,
            HasChanged = element.HasChanged
        }
    end
    return states
end

function Library:SaveCurrentUIStates()
    for name, element in pairs(UIStateTracker.Elements) do
        element.InitialState = element.GetState()
        element.CurrentState = element.InitialState
        element.HasChanged = false
    end
end

function Library:ResetUIStates()
    for name, element in pairs(UIStateTracker.Elements) do
        if element.SetState then
            element.SetState(element.InitialState)
        end
    end
    return self:UpdateUI()
end

function Library:SetUIStates(statesTable)
    for name, state in pairs(statesTable) do
        local element = UIStateTracker.Elements[name]
        if element and element.SetState then
            element.SetState(state)
        end
    end
    return self:UpdateUI()
end

-- Helper Functions
local function addToTheme(name, obj)
    if not SaveTheme[name] then
        SaveTheme[name] = {}
    end
    table.insert(SaveTheme[name], obj)
end

local function getColorFromPath(tbl, path)
    local result = tbl
    for _, part in ipairs(string.split(path, ".")) do
        result = result and result[part]
    end
    return result
end

function Library:setTheme(themeName)
    local theme = themes[themeName]
    if not theme then return end
    
    for name, objs in pairs(SaveTheme) do
        local color = getColorFromPath(theme, name)
        if color then
            for _, obj in ipairs(objs) do
                if obj:IsA("Frame") or obj:IsA("CanvasGroup") then
                    obj.BackgroundColor3 = color
                elseif obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                    obj.TextColor3 = color
                elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
                    obj.ImageColor3 = color
                elseif obj:IsA("ScrollingFrame") then
                    obj.ScrollBarImageColor3 = color
                elseif obj:IsA("UIStroke") then
                    obj.Color = color
                elseif obj:IsA("UIGradient") then
                    obj.Color = color
                end
            end
        end
    end
end

-- Icon loader (simplified version)
local IconList = {
    Icons = {},
    Spritesheets = {}
}

local function loadIcon(iconId)
    if type(iconId) == 'number' then
        return {Image = "rbxassetid://" .. iconId}
    elseif type(iconId) == 'string' and not iconId:find('rbxassetid://') then
        return {Image = "rbxassetid://" .. iconId}
    end
    return {Image = iconId}
end

-- Tween helper
local function createTween(object, tweenInfo, properties)
    return TweenService:Create(object, tweenInfo, properties)
end

-- Create click effect
local function createClickEffect(parent, target)
    local effect = Instance.new("Frame")
    effect.Parent = parent
    effect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    effect.BackgroundTransparency = 0.7
    effect.BorderSizePixel = 0
    effect.AnchorPoint = Vector2.new(0.5, 0.5)
    effect.Size = UDim2.new(0, 0, 0, 0)
    effect.ZIndex = 10
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = effect
    
    local mouse = game.Players.LocalPlayer:GetMouse()
    local relativeX = mouse.X - target.AbsolutePosition.X + target.AbsoluteSize.X / 2
    local relativeY = mouse.Y - target.AbsolutePosition.Y + target.AbsoluteSize.Y / 2
    
    effect.Position = UDim2.new(0, relativeX, 0, relativeY)
    
    local tween = createTween(effect, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, target.AbsoluteSize.X * 1.5, 0, target.AbsoluteSize.X * 1.5),
        BackgroundTransparency = 1
    })
    
    tween.Completed:Connect(function()
        effect:Destroy()
    end)
    
    tween:Play()
end

-- Create invisible click button
local function createClickButton(parent)
    local button = Instance.new("TextButton")
    button.Name = "Click"
    button.Parent = parent
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.Size = UDim2.new(1, 0, 1, 0)
    button.Text = ""
    button.ZIndex = 5
    return button
end

-- Main Window Function
function Library:Window(config)
    local windowConfig = {
        Title = config.Title or "Dummy Kawaii",
        Desc = config.Desc or "",
        Icon = config.Icon or "door-open",
        Theme = config.Theme or "Dark",
        Size = config.Config and config.Config.Size or UDim2.new(0, 530, 0, 400),
        Keybind = config.Config and config.Config.Keybind or Enum.KeyCode.LeftControl
    }
    
    local currentTheme = windowConfig.Theme
    local isDragging = false
    local isMinimized = false
    local originalSize, originalPosition
    
    -- Create Shadow/Window Container
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Parent = ScreenGui
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.BackgroundTransparency = 1
    shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    shadow.Size = windowConfig.Size
    shadow.Image = "rbxassetid://1316045217"
    shadow.ImageColor3 = themes[currentTheme].Shadow
    shadow.ImageTransparency = 0.8
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    
    addToTheme('Shadow', shadow)
    
    -- Main Background
    local background = Instance.new("CanvasGroup")
    background.Name = "Background"
    background.Parent = shadow
    background.AnchorPoint = Vector2.new(0.5, 0.5)
    background.BackgroundColor3 = themes[currentTheme].Background
    background.BorderSizePixel = 0
    background.Position = UDim2.new(0.5, 0, 0.5, 0)
    background.Size = UDim2.new(1, 0, 1, 0)
    background.GroupTransparency = 1
    
    addToTheme('Background', background)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 17)
    corner.Parent = background
    
    -- Window animation on open
    local originalBGSize = background.Size
    background.Size = originalBGSize - UDim2.fromOffset(5, 5)
    
    local openTween = createTween(background, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
        GroupTransparency = 0,
        Size = originalBGSize
    })
    openTween:Play()
    
    -- Page container
    local pageContainer = Instance.new("Frame")
    pageContainer.Name = "Page"
    pageContainer.Parent = background
    pageContainer.BackgroundTransparency = 1
    pageContainer.Size = UDim2.new(1, 0, 1, 0)
    
    local pagePadding = Instance.new("UIPadding")
    pagePadding.Parent = pageContainer
    pagePadding.PaddingBottom = UDim.new(0, 5)
    pagePadding.PaddingLeft = UDim.new(0, 120)
    pagePadding.PaddingRight = UDim.new(0, 5)
    pagePadding.PaddingTop = UDim.new(0, 45)
    
    -- Top Bar
    local topBar = Instance.new("Frame")
    topBar.Name = "Topbar"
    topBar.Parent = background
    topBar.BackgroundTransparency = 1
    topBar.Size = UDim2.new(1, 0, 0, 42)
    
    local topBarLine = Instance.new("Frame")
    topBarLine.Parent = topBar
    topBarLine.AnchorPoint = Vector2.new(0, 1)
    topBarLine.BackgroundColor3 = themes[currentTheme].Page
    topBarLine.BorderSizePixel = 0
    topBarLine.Position = UDim2.new(0, 0, 1, 0)
    topBarLine.Size = UDim2.new(1, 0, 0, 2)
    
    addToTheme('Page', topBarLine)
    
    -- Title and Controls container
    local controlsContainer = Instance.new("Frame")
    controlsContainer.Name = "Ct"
    controlsContainer.Parent = topBar
    controlsContainer.BackgroundTransparency = 1
    controlsContainer.Size = UDim2.new(1, 0, 1, 0)
    
    local controlsPadding = Instance.new("UIPadding")
    controlsPadding.Parent = controlsContainer
    controlsPadding.PaddingBottom = UDim.new(0, 5)
    controlsPadding.PaddingLeft = UDim.new(0, 10)
    controlsPadding.PaddingRight = UDim.new(0, 10)
    controlsPadding.PaddingTop = UDim.new(0, 5)
    
    local controlsLayout = Instance.new("UIListLayout")
    controlsLayout.Parent = controlsContainer
    controlsLayout.FillDirection = Enum.FillDirection.Horizontal
    controlsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    controlsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    controlsLayout.Padding = UDim.new(0, 10)
    
    -- Control buttons
    local minimizeBtn = Instance.new("ImageButton")
    minimizeBtn.Name = "Minisize"
    minimizeBtn.Parent = controlsContainer
    minimizeBtn.BackgroundTransparency = 1
    minimizeBtn.Size = UDim2.new(0, 16, 0, 16)
    minimizeBtn.Image = "rbxassetid://13857987062"
    minimizeBtn.ImageTransparency = 0.5
    
    addToTheme('Text & Icon', minimizeBtn)
    
    local closeBtn = Instance.new("ImageButton")
    closeBtn.Name = "Close"
    closeBtn.Parent = controlsContainer
    closeBtn.BackgroundTransparency = 1
    closeBtn.Size = UDim2.new(0, 16, 0, 16)
    closeBtn.Image = "rbxassetid://15082305656"
    
    local resizeBtn = Instance.new("ImageButton")
    resizeBtn.Name = "Size"
    resizeBtn.Parent = controlsContainer
    resizeBtn.BackgroundTransparency = 1
    resizeBtn.Size = UDim2.new(0, 16, 0, 16)
    resizeBtn.Image = "rbxassetid://15082210525"
    resizeBtn.ImageTransparency = 0.5
    
    -- Theme dropdown placeholder
    local themeDropdown = Instance.new("Frame")
    themeDropdown.Name = "DropdownValue"
    themeDropdown.Parent = controlsContainer
    themeDropdown.AnchorPoint = Vector2.new(1, 0.5)
    themeDropdown.BackgroundColor3 = Color3.fromRGB(24, 24, 31)
    themeDropdown.BorderSizePixel = 0
    themeDropdown.Position = UDim2.new(1, 0, 0.5, 0)
    themeDropdown.Size = UDim2.new(0, 120, 0, 20)
    themeDropdown.Transparency = 1
    
    -- Title area
    local titleArea = Instance.new("Frame")
    titleArea.Name = "Td"
    titleArea.Parent = topBar
    titleArea.BackgroundTransparency = 1
    titleArea.Size = UDim2.new(1, 0, 1, 0)
    
    local titlePadding = Instance.new("UIPadding")
    titlePadding.Parent = titleArea
    titlePadding.PaddingBottom = UDim.new(0, 5)
    titlePadding.PaddingLeft = UDim.new(0, 10)
    titlePadding.PaddingRight = UDim.new(0, 10)
    titlePadding.PaddingTop = UDim.new(0, 5)
    
    local titleLayout = Instance.new("UIListLayout")
    titleLayout.Parent = titleArea
    titleLayout.FillDirection = Enum.FillDirection.Horizontal
    titleLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    titleLayout.Padding = UDim.new(0, 8)
    
    -- Icon
    local icon = Instance.new("ImageLabel")
    icon.Name = "Icon"
    icon.Parent = titleArea
    icon.BackgroundTransparency = 1
    icon.Size = UDim2.new(0, 30, 0, 30)
    icon.Image = loadIcon(windowConfig.Icon).Image
    
    addToTheme('Text & Icon', icon)
    
    -- Title and Description
    local titleContainer = Instance.new("Frame")
    titleContainer.Name = "Title"
    titleContainer.Parent = titleArea
    titleContainer.BackgroundTransparency = 1
    titleContainer.Size = UDim2.new(0, 100, 1, 0)
    
    local titleText = Instance.new("TextLabel")
    titleText.Name = "Title"
    titleText.Parent = titleContainer
    titleText.BackgroundTransparency = 1
    titleText.Size = UDim2.new(1, 0, 0, 13)
    titleText.Font = Enum.Font.GothamBold
    titleText.Text = windowConfig.Title
    titleText.TextColor3 = themes[currentTheme]['Text & Icon']
    titleText.TextSize = 12
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    
    addToTheme('Text & Icon', titleText)
    
    local descText = Instance.new("TextLabel")
    descText.Name = "Desc"
    descText.Parent = titleContainer
    descText.BackgroundTransparency = 1
    descText.Size = UDim2.new(1, 0, 0, 13)
    descText.Font = Enum.Font.GothamBold
    descText.Text = windowConfig.Desc
    descText.TextColor3 = themes[currentTheme]['Text & Icon']
    descText.TextSize = 10
    descText.TextTransparency = 0.5
    descText.TextXAlignment = Enum.TextXAlignment.Left
    descText.Visible = windowConfig.Desc ~= ""
    
    addToTheme('Text & Icon', descText)
    
    local titleContainerLayout = Instance.new("UIListLayout")
    titleContainerLayout.Parent = titleContainer
    titleContainerLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    
    -- Tab System
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabP"
    tabContainer.Parent = background
    tabContainer.BackgroundTransparency = 1
    tabContainer.Size = UDim2.new(1, 0, 1, 0)
    
    local sidebar = Instance.new("Frame")
    sidebar.Parent = tabContainer
    sidebar.BackgroundTransparency = 1
    sidebar.Size = UDim2.new(0, 110, 1, 0)
    
    local tabScroller = Instance.new("ScrollingFrame")
    tabScroller.Name = "ScrollingFrame"
    tabScroller.Parent = sidebar
    tabScroller.BackgroundTransparency = 1
    tabScroller.Size = UDim2.new(1, 0, 1, 0)
    tabScroller.ScrollBarThickness = 2
    tabScroller.ScrollBarImageColor3 = themes[currentTheme].Main
    
    addToTheme('Main', tabScroller)
    
    local tabList = Instance.new("Frame")
    tabList.Name = "TabList"
    tabList.Parent = tabScroller
    tabList.BackgroundTransparency = 1
    tabList.Size = UDim2.new(1, 0, 1, 0)
    
    local tabListLayout = Instance.new("UIListLayout")
    tabListLayout.Parent = tabList
    tabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    local selectionIndicator = Instance.new("Frame")
    selectionIndicator.Name = "Select"
    selectionIndicator.Parent = tabScroller
    selectionIndicator.BackgroundColor3 = themes[currentTheme].Main
    selectionIndicator.Position = UDim2.new(0, 0, 0, 5)
    selectionIndicator.Size = UDim2.new(0, 3, 0, 18)
    
    addToTheme('Main', selectionIndicator)
    
    local selectionCorner = Instance.new("UICorner")
    selectionCorner.CornerRadius = UDim.new(1, 0)
    selectionCorner.Parent = selectionIndicator
    
    local selectionStroke = Instance.new("UIStroke")
    selectionStroke.Parent = selectionIndicator
    selectionStroke.Color = Color3.fromRGB(24, 24, 31)
    selectionStroke.Thickness = 1
    selectionStroke.Transparency = 0.9
    
    -- Window Controls
    local isResizing = false
    local resizeBtnReal = Instance.new("TextButton")
    resizeBtnReal.Name = "Size"
    resizeBtnReal.Parent = background
    resizeBtnReal.AnchorPoint = Vector2.new(1, 1)
    resizeBtnReal.BackgroundTransparency = 1
    resizeBtnReal.Position = UDim2.new(1, 0, 1, 0)
    resizeBtnReal.Size = UDim2.new(0, 20, 0, 20)
    resizeBtnReal.Text = ""
    
    -- Drag functionality
    local function setupDrag(dragArea, target)
        local dragStart, startPos
        
        dragArea.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragStart = input.Position
                startPos = target.Position
                isDragging = true
                
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        isDragging = false
                    end
                end)
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - dragStart
                target.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end)
    end
    
    setupDrag(topBar, shadow)
    
    -- Resize functionality
    resizeBtnReal.MouseButton1Down:Connect(function()
        isResizing = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isResizing = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if not isMinimized and isResizing and input.UserInputType == Enum.UserInputType.MouseMovement then
            local newWidth = math.max(450, input.Position.X - shadow.AbsolutePosition.X)
            local newHeight = math.max(220, input.Position.Y - shadow.AbsolutePosition.Y)
            shadow.Size = UDim2.new(0, newWidth, 0, newHeight)
        end
    end)
    
    -- Minimize/Restore
    minimizeBtn.MouseButton1Click:Connect(function()
        if not isMinimized then
            originalSize = shadow.Size
            originalPosition = shadow.Position
            shadow.Size = UDim2.new(1, 0, 1, 0)
            shadow.Position = UDim2.new(0, 0, 0, 0)
            minimizeBtn.Image = "rbxassetid://13857981896"
        else
            shadow.Size = originalSize
            shadow.Position = originalPosition
            minimizeBtn.Image = "rbxassetid://13857987062"
        end
        isMinimized = not isMinimized
    end)
    
    -- Close with confirmation
    closeBtn.MouseButton1Click:Connect(function()
        local dialog = Library:Dialog({
            Title = "Do you want to <font color='#FF0000'>close</font> the UI?",
            Button1 = {
                Title = "Confirm",
                Color = Color3.fromRGB(0, 188, 0),
                Callback = function()
                    ScreenGui:Destroy()
                end
            },
            Button2 = {
                Title = "Cancel",
                Color = Color3.fromRGB(226, 39, 6)
            }
        })
    end)
    
    -- Toggle UI visibility
    local function toggleUIVisibility()
        if isMinimized then return end
        
        if background.GroupTransparency == 0 then
            -- Hide
            local hideTween = createTween(background, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
                GroupTransparency = 1,
                Size = originalBGSize - UDim2.fromOffset(5, 5)
            })
            hideTween:Play()
        else
            -- Show
            local showTween = createTween(background, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
                GroupTransparency = 0,
                Size = originalBGSize
            })
            showTween:Play()
        end
    end
    
    resizeBtn.MouseButton1Click:Connect(toggleUIVisibility)
    
    -- Keybind to toggle UI
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == windowConfig.Keybind then
            local focusedTextBox = UserInputService:GetFocusedTextBox()
            if not focusedTextBox then
                toggleUIVisibility()
            end
        end
    end)
    
    -- Theme switching function
    local function switchTheme(themeName)
        currentTheme = themeName
        Library:setTheme(currentTheme)
    end
    
    -- Tab management
    local tabs = {
        Value = false,
        List = {},
        DefaultIndex = 1
    }
    
    function tabs:SelectTab(index)
        tabs.DefaultIndex = index or 1
    end
    
    function tabs:Line()
        local lineFrame = Instance.new("Frame")
        lineFrame.Parent = tabList
        lineFrame.BackgroundTransparency = 1
        lineFrame.Size = UDim2.new(1, 0, 0, 5)
        
        local line = Instance.new("Frame")
        line.Name = "Line"
        line.Parent = lineFrame
        line.AnchorPoint = Vector2.new(0.5, 0.5)
        line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        line.BackgroundTransparency = 0.9
        line.Position = UDim2.new(0.5, 0, 0.5, 0)
        line.Size = UDim2.new(0.85, 0, 0, 1)
    end
    
    function tabs:Tab(tabConfig)
        local tabTitle = tabConfig.Title or "Tab"
        local tabIcon = tabConfig.Icon or "house"
        
        -- Create tab button
        local tabButton = Instance.new("Frame")
        tabButton.Name = "Tab"
        tabButton.Parent = tabList
        tabButton.BackgroundTransparency = 1
        tabButton.Size = UDim2.new(1, 0, 0, 30)
        
        local tabContent = Instance.new("Frame")
        tabContent.Name = "Func"
        tabContent.Parent = tabButton
        tabContent.BackgroundTransparency = 1
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        
        local tabIconLabel = Instance.new("ImageLabel")
        tabIconLabel.Parent = tabContent
        tabIconLabel.BackgroundTransparency = 1
        tabIconLabel.Size = UDim2.new(0, 18, 0, 18)
        tabIconLabel.Image = loadIcon(tabIcon).Image
        tabIconLabel.ImageTransparency = 0.7
        
        addToTheme('Text & Icon', tabIconLabel)
        
        local tabTitleLabel = Instance.new("TextLabel")
        tabTitleLabel.Name = "Title"
        tabTitleLabel.Parent = tabContent
        tabTitleLabel.BackgroundTransparency = 1
        tabTitleLabel.Size = UDim2.new(1, 0, 1, 0)
        tabTitleLabel.Font = Enum.Font.GothamBold
        tabTitleLabel.Text = tabTitle
        tabTitleLabel.TextColor3 = themes[currentTheme]['Text & Icon']
        tabTitleLabel.TextSize = 11
        tabTitleLabel.TextTransparency = 0.7
        tabTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        addToTheme('Text & Icon', tabTitleLabel)
        
        local tabLayout = Instance.new("UIListLayout")
        tabLayout.Parent = tabContent
        tabLayout.FillDirection = Enum.FillDirection.Horizontal
        tabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        tabLayout.Padding = UDim.new(0, 8)
        
        local tabPadding = Instance.new("UIPadding")
        tabPadding.Parent = tabContent
        tabPadding.PaddingLeft = UDim.new(0, 8)
        
        -- Create tab page
        local tabPage = Instance.new("Frame")
        tabPage.Name = "InPage"
        tabPage.Parent = pageContainer
        tabPage.AnchorPoint = Vector2.new(0.5, 0.5)
        tabPage.BackgroundColor3 = themes[currentTheme].Page
        tabPage.Position = UDim2.new(0.5, 0, 0.5, 0)
        tabPage.Size = UDim2.new(1, 0, 1, 0)
        tabPage.Visible = false
        
        addToTheme('Page', tabPage)
        
        local tabPageCorner = Instance.new("UICorner")
        tabPageCorner.CornerRadius = UDim.new(0, 17)
        tabPageCorner.Parent = tabPage
        
        local tabScroller = Instance.new("ScrollingFrame")
        tabScroller.Name = "ScrollingFrame"
        tabScroller.Parent = tabPage
        tabScroller.BackgroundTransparency = 1
        tabScroller.Size = UDim2.new(1, 0, 1, 0)
        tabScroller.ScrollBarThickness = 0
        
        local tabElementsLayout = Instance.new("UIListLayout")
        tabElementsLayout.Parent = tabScroller
        tabElementsLayout.Padding = UDim.new(0, 5)
        
        local tabPagePadding = Instance.new("UIPadding")
        tabPagePadding.Parent = tabPage
        tabPagePadding.PaddingBottom = UDim.new(0, 10)
        tabPagePadding.PaddingLeft = UDim.new(0, 10)
        tabPagePadding.PaddingRight = UDim.new(0, 10)
        tabPagePadding.PaddingTop = UDim.new(0, 10)
        
        -- Tab click functionality
        local tabClick = createClickButton(tabButton)
        
        local function selectThisTab()
            -- Hide all other tab pages
            for _, tabData in ipairs(tabs.List) do
                tabData.Page.Visible = false
                if tabData.Button:FindFirstChild("Func") then
                    local title = tabData.Button.Func:FindFirstChild("Title")
                    local icon = tabData.Button.Func:FindFirstChild("ImageLabel")
                    if title then
                        createTween(title, TweenInfo.new(0.15), {TextTransparency = 0.7}):Play()
                    end
                    if icon then
                        createTween(icon, TweenInfo.new(0.15), {ImageTransparency = 0.7}):Play()
                    end
                end
            end
            
            -- Show this tab
            tabPage.Visible = true
            
            -- Highlight this tab
            createTween(tabTitleLabel, TweenInfo.new(0.15), {TextTransparency = 0}):Play()
            createTween(tabIconLabel, TweenInfo.new(0.15), {ImageTransparency = 0}):Play()
            
            -- Move selection indicator
            local targetY = tabButton.AbsolutePosition.Y - tabScroller.AbsolutePosition.Y + (tabButton.AbsoluteSize.Y / 2) - (selectionIndicator.AbsoluteSize.Y / 2)
            createTween(selectionIndicator, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                Position = UDim2.new(0, selectionIndicator.Position.X.Offset, 0, targetY)
            }):Play()
        end
        
        tabClick.MouseButton1Click:Connect(selectThisTab)
        
        -- Add to tabs list
        table.insert(tabs.List, {
            Page = tabPage,
            Button = tabButton
        })
        
        local tabIndex = #tabs.List
        
        -- Auto-select first tab
        if not tabs.Value and tabIndex == tabs.DefaultIndex then
            task.delay(0.1, function()
                selectThisTab()
                tabs.Value = true
            end)
        end
        
        -- Tab functions
        local tabFunctions = {}
        
        function tabFunctions:Section(sectionConfig)
            local sectionTitle = sectionConfig.Title or "Section"
            
            local sectionFrame = Instance.new("Frame")
            sectionFrame.Name = "Real Background"
            sectionFrame.Parent = tabScroller
            sectionFrame.BackgroundTransparency = 1
            sectionFrame.Size = UDim2.new(1, 0, 0, 20)
            
            local sectionBg = Instance.new("Frame")
            sectionBg.Name = "Background"
            sectionBg.Parent = sectionFrame
            sectionBg.BackgroundTransparency = 1
            sectionBg.Size = UDim2.new(1, 0, 0, 20)
            
            local sectionText = Instance.new("TextLabel")
            sectionText.Name = "Section"
            sectionText.Parent = sectionBg
            sectionText.BackgroundTransparency = 1
            sectionText.Size = UDim2.new(1, 0, 0, 20)
            sectionText.Font = Enum.Font.GothamBold
            sectionText.Text = sectionTitle
            sectionText.TextColor3 = themes[currentTheme]['Text & Icon']
            sectionText.TextSize = 12
            sectionText.TextXAlignment = Enum.TextXAlignment.Left
            
            addToTheme('Text & Icon', sectionText)
            
            local sectionPadding = Instance.new("UIPadding")
            sectionPadding.Parent = sectionBg
            sectionPadding.PaddingLeft = UDim.new(0, 5)
            sectionPadding.PaddingRight = UDim.new(0, 5)
            
            local sectionMethods = {}
            
            function sectionMethods:SetTitle(newTitle)
                sectionText.Text = newTitle
            end
            
            return sectionMethods
        end
        
        function tabFunctions:Toggle(toggleConfig)
            local toggleTitle = toggleConfig.Title or "Toggle"
            local toggleDesc = toggleConfig.Desc or ""
            local toggleIcon = toggleConfig.Image or ""
            local toggleValue = toggleConfig.Value or false
            local toggleCallback = toggleConfig.Callback or function() end
            
            -- Create toggle container
            local toggleContainer = Instance.new("Frame")
            toggleContainer.Name = "Real Background"
            toggleContainer.Parent = tabScroller
            toggleContainer.BackgroundTransparency = 1
            toggleContainer.Size = UDim2.new(1, 0, 0, 35)
            
            local toggleBg = Instance.new("Frame")
            toggleBg.Name = "Background"
            toggleBg.Parent = toggleContainer
            toggleBg.BackgroundColor3 = themes[currentTheme].Function.Toggle.Background
            toggleBg.Size = UDim2.new(1, 0, 1, 0)
            toggleBg.ClipsDescendants = true
            
            addToTheme('Function.Toggle.Background', toggleBg)
            
            local toggleCorner = Instance.new("UICorner")
            toggleCorner.Parent = toggleBg
            
            -- Toggle content
            local toggleContent = Instance.new("Frame")
            toggleContent.Name = "T"
            toggleContent.Parent = toggleBg
            toggleContent.AnchorPoint = Vector2.new(0, 0.5)
            toggleContent.BackgroundTransparency = 1
            toggleContent.Position = UDim2.new(0, 0, 0.5, 0)
            toggleContent.Size = UDim2.new(1, 0, 1, 0)
            
            local contentLayout = Instance.new("UIListLayout")
            contentLayout.Parent = toggleContent
            contentLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            
            local contentPadding = Instance.new("UIPadding")
            contentPadding.Parent = toggleContent
            contentPadding.PaddingLeft = toggleIcon ~= "" and UDim.new(0, 50) or UDim.new(0, 13)
            contentPadding.PaddingRight = UDim.new(0, 70)
            
            -- Title
            local titleLabel = Instance.new("TextLabel")
            titleLabel.Name = "Title"
            titleLabel.Parent = toggleContent
            titleLabel.BackgroundTransparency = 1
            titleLabel.Size = UDim2.new(1, 0, 0, 14)
            titleLabel.Font = Enum.Font.GothamBold
            titleLabel.Text = toggleTitle
            titleLabel.TextColor3 = themes[currentTheme]['Text & Icon']
            titleLabel.TextSize = 12
            titleLabel.TextXAlignment = Enum.TextXAlignment.Left
            titleLabel.AutomaticSize = Enum.AutomaticSize.Y
            
            addToTheme('Text & Icon', titleLabel)
            
            -- Description
            local descLabel = Instance.new("TextLabel")
            descLabel.Name = "Desc"
            descLabel.Parent = toggleContent
            descLabel.BackgroundTransparency = 1
            descLabel.LayoutOrder = 1
            descLabel.Size = UDim2.new(1, 0, 0, 14)
            descLabel.Font = Enum.Font.GothamBold
            descLabel.Text = toggleDesc
            descLabel.TextColor3 = themes[currentTheme]['Text & Icon']
            descLabel.TextSize = 10
            descLabel.TextTransparency = 0.7
            descLabel.TextXAlignment = Enum.TextXAlignment.Left
            descLabel.Visible = toggleDesc ~= ""
            descLabel.AutomaticSize = Enum.AutomaticSize.Y
            
            addToTheme('Text & Icon', descLabel)
            
            -- Icon if provided
            if toggleIcon ~= "" then
                local iconFrame = Instance.new("Frame")
                iconFrame.Name = "Image"
                iconFrame.Parent = toggleBg
                iconFrame.BackgroundTransparency = 1
                iconFrame.Size = UDim2.new(0, 40, 1, 0)
                
                local iconImg = Instance.new("ImageLabel")
                iconImg.Name = "Icon"
                iconImg.Parent = iconFrame
                iconImg.AnchorPoint = Vector2.new(0.5, 0.5)
                iconImg.BackgroundTransparency = 1
                iconImg.Position = UDim2.new(0.5, 0, 0.5, 0)
                iconImg.Size = UDim2.new(0, 20, 0, 20)
                iconImg.Image = loadIcon(toggleIcon).Image
                iconImg.ImageTransparency = 0.7
                
                addToTheme('Text & Icon', iconImg)
                
                local iconDivider = Instance.new("Frame")
                iconDivider.Parent = iconFrame
                iconDivider.AnchorPoint = Vector2.new(1, 0.5)
                iconDivider.BackgroundColor3 = themes[currentTheme]['Text & Icon']
                iconDivider.BackgroundTransparency = 0.9
                iconDivider.Position = UDim2.new(1, 0, 0.5, 0)
                iconDivider.Size = UDim2.new(0, 1, 0.7, 0)
                
                addToTheme('Text & Icon', iconDivider)
            end
            
            -- Toggle switch
            local toggleSwitchContainer = Instance.new("Frame")
            toggleSwitchContainer.Name = "F"
            toggleSwitchContainer.Parent = toggleBg
            toggleSwitchContainer.AnchorPoint = Vector2.new(1, 0.5)
            toggleSwitchContainer.BackgroundTransparency = 1
            toggleSwitchContainer.Position = UDim2.new(1, 0, 0.5, 0)
            toggleSwitchContainer.Size = UDim2.new(0, 100, 0.8, 0)
            
            local toggleSwitchLayout = Instance.new("UIListLayout")
            toggleSwitchLayout.Parent = toggleSwitchContainer
            toggleSwitchLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
            toggleSwitchLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            
            local toggleSwitchPadding = Instance.new("UIPadding")
            toggleSwitchPadding.Parent = toggleSwitchContainer
            toggleSwitchPadding.PaddingRight = UDim.new(0, 13)
            
            local toggleTrack = Instance.new("Frame")
            toggleTrack.Parent = toggleSwitchContainer
            toggleTrack.BackgroundColor3 = toggleValue and themes[currentTheme].Function.Toggle.True['Toggle Background'] 
                or themes[currentTheme].Function.Toggle.False['Toggle Background']
            toggleTrack.Size = UDim2.new(0, 34, 0, 17)
            
            local toggleTrackCorner = Instance.new("UICorner")
            toggleTrackCorner.CornerRadius = UDim.new(1, 0)
            toggleTrackCorner.Parent = toggleTrack
            
            local toggleThumb = Instance.new("Frame")
            toggleThumb.Parent = toggleTrack
            toggleThumb.AnchorPoint = Vector2.new(toggleValue and 1 or 0, 0.5)
            toggleThumb.BackgroundColor3 = toggleValue and themes[currentTheme].Function.Toggle.True['Toggle Value']
                or themes[currentTheme].Function.Toggle.False['Toggle Value']
            toggleThumb.Position = UDim2.new(toggleValue and 1 or 0, 0, 0.5, 0)
            toggleThumb.Size = UDim2.new(0, 13, 0, 13)
            
            local toggleThumbCorner = Instance.new("UICorner")
            toggleThumbCorner.CornerRadius = UDim.new(1, 0)
            toggleThumbCorner.Parent = toggleThumb
            
            local thumbPadding = Instance.new("UIPadding")
            thumbPadding.Parent = toggleTrack
            thumbPadding.PaddingLeft = UDim.new(0, 2)
            thumbPadding.PaddingRight = UDim.new(0, 2)
            
            -- Click functionality
            local toggleClick = createClickButton(toggleBg)
            
            local function toggleState()
                toggleValue = not toggleValue
                
                -- Update visuals
                createTween(toggleTrack, TweenInfo.new(0.15), {
                    BackgroundColor3 = toggleValue and themes[currentTheme].Function.Toggle.True['Toggle Background']
                        or themes[currentTheme].Function.Toggle.False['Toggle Background']
                }):Play()
                
                createTween(toggleThumb, TweenInfo.new(0.15), {
                    BackgroundColor3 = toggleValue and themes[currentTheme].Function.Toggle.True['Toggle Value']
                        or themes[currentTheme].Function.Toggle.False['Toggle Value'],
                    AnchorPoint = Vector2.new(toggleValue and 1 or 0, 0.5),
                    Position = UDim2.new(toggleValue and 1 or 0, 0, 0.5, 0)
                }):Play()
                
                -- Update text transparency
                createTween(titleLabel, TweenInfo.new(0.15), {
                    TextTransparency = toggleValue and 0 or 0.7
                }):Play()
                
                if toggleIcon ~= "" then
                    local iconImg = toggleBg.Image.Icon
                    if iconImg then
                        createTween(iconImg, TweenInfo.new(0.15), {
                            ImageTransparency = toggleValue and 0 or 0.7
                        }):Play()
                    end
                end
                
                -- Call callback
                pcall(toggleCallback, toggleValue)
            end
            
            toggleClick.MouseButton1Click:Connect(function()
                createClickEffect(toggleBg, toggleClick)
                toggleState()
            end)
            
            -- Set initial state
            if toggleValue then
                toggleState()
            end
            
            -- Theme update handler
            toggleBg:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
                toggleTrack.BackgroundColor3 = toggleValue and themes[currentTheme].Function.Toggle.True['Toggle Background']
                    or themes[currentTheme].Function.Toggle.False['Toggle Background']
                toggleThumb.BackgroundColor3 = toggleValue and themes[currentTheme].Function.Toggle.True['Toggle Value']
                    or themes[currentTheme].Function.Toggle.False['Toggle Value']
            end)
            
            -- Toggle methods
            local toggleMethods = {}
            
            function toggleMethods:SetTitle(newTitle)
                titleLabel.Text = newTitle
            end
            
            function toggleMethods:SetDesc(newDesc)
                descLabel.Text = newDesc
                descLabel.Visible = newDesc ~= ""
            end
            
            function toggleMethods:SetVisible(isVisible)
                toggleContainer.Visible = isVisible
            end
            
            function toggleMethods:SetValue(newValue)
                if toggleValue ~= newValue then
                    toggleState()
                end
            end
            
            function toggleMethods:GetValue()
                return toggleValue
            end
            
            -- Track for UI updates
            UIStateTracker:TrackElement(
                toggleTitle .. "_Toggle",
                "Toggle",
                function() return toggleValue end,
                function(state) toggleMethods:SetValue(state) end
            )
            
            return toggleMethods
        end
        
        function tabFunctions:Label(labelConfig)
            local labelTitle = labelConfig.Title or "Label"
            local labelDesc = labelConfig.Desc or ""
            local labelIcon = labelConfig.Image or ""
            
            -- Create label container (similar to toggle but without switch)
            local labelContainer = Instance.new("Frame")
            labelContainer.Name = "Real Background"
            labelContainer.Parent = tabScroller
            labelContainer.BackgroundTransparency = 1
            labelContainer.Size = UDim2.new(1, 0, 0, 35)
            
            local labelBg = Instance.new("Frame")
            labelBg.Name = "Background"
            labelBg.Parent = labelContainer
            labelBg.BackgroundColor3 = themes[currentTheme].Function.Label.Background
            labelBg.Size = UDim2.new(1, 0, 1, 0)
            
            addToTheme('Function.Label.Background', labelBg)
            
            local labelCorner = Instance.new("UICorner")
            labelCorner.Parent = labelBg
            
            -- Label content (similar to toggle content)
            local labelContent = Instance.new("Frame")
            labelContent.Name = "T"
            labelContent.Parent = labelBg
            labelContent.AnchorPoint = Vector2.new(0, 0.5)
            labelContent.BackgroundTransparency = 1
            labelContent.Position = UDim2.new(0, 0, 0.5, 0)
            labelContent.Size = UDim2.new(1, 0, 1, 0)
            
            local contentLayout = Instance.new("UIListLayout")
            contentLayout.Parent = labelContent
            contentLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            
            local contentPadding = Instance.new("UIPadding")
            contentPadding.Parent = labelContent
            contentPadding.PaddingLeft = labelIcon ~= "" and UDim.new(0, 50) or UDim.new(0, 13)
            contentPadding.PaddingRight = UDim.new(0, 0)
            
            -- Title
            local titleLabel = Instance.new("TextLabel")
            titleLabel.Name = "Title"
            titleLabel.Parent = labelContent
            titleLabel.BackgroundTransparency = 1
            titleLabel.Size = UDim2.new(1, 0, 0, 14)
            titleLabel.Font = Enum.Font.GothamBold
            titleLabel.Text = labelTitle
            titleLabel.TextColor3 = themes[currentTheme]['Text & Icon']
            titleLabel.TextSize = 12
            titleLabel.TextTransparency = 0
            titleLabel.TextXAlignment = Enum.TextXAlignment.Left
            titleLabel.AutomaticSize = Enum.AutomaticSize.Y
            
            addToTheme('Text & Icon', titleLabel)
            
            -- Description
            local descLabel = Instance.new("TextLabel")
            descLabel.Name = "Desc"
            descLabel.Parent = labelContent
            descLabel.BackgroundTransparency = 1
            descLabel.LayoutOrder = 1
            descLabel.Size = UDim2.new(1, 0, 0, 14)
            descLabel.Font = Enum.Font.GothamBold
            descLabel.Text = labelDesc
            descLabel.TextColor3 = themes[currentTheme]['Text & Icon']
            descLabel.TextSize = 10
            descLabel.TextTransparency = 0.7
            descLabel.TextXAlignment = Enum.TextXAlignment.Left
            descLabel.Visible = labelDesc ~= ""
            descLabel.AutomaticSize = Enum.AutomaticSize.Y
            
            addToTheme('Text & Icon', descLabel)
            
            -- Icon if provided
            if labelIcon ~= "" then
                local iconFrame = Instance.new("Frame")
                iconFrame.Name = "Image"
                iconFrame.Parent = labelBg
                iconFrame.BackgroundTransparency = 1
                iconFrame.Size = UDim2.new(0, 40, 1, 0)
                
                local iconImg = Instance.new("ImageLabel")
                iconImg.Name = "Icon"
                iconImg.Parent = iconFrame
                iconImg.AnchorPoint = Vector2.new(0.5, 0.5)
                iconImg.BackgroundTransparency = 1
                iconImg.Position = UDim2.new(0.5, 0, 0.5, 0)
                iconImg.Size = UDim2.new(0, 20, 0, 20)
                iconImg.Image = loadIcon(labelIcon).Image
                iconImg.ImageTransparency = 0
                
                addToTheme('Text & Icon', iconImg)
                
                local iconDivider = Instance.new("Frame")
                iconDivider.Parent = iconFrame
                iconDivider.AnchorPoint = Vector2.new(1, 0.5)
                iconDivider.BackgroundColor3 = themes[currentTheme]['Text & Icon']
                iconDivider.BackgroundTransparency = 0.9
                iconDivider.Position = UDim2.new(1, 0, 0.5, 0)
                iconDivider.Size = UDim2.new(0, 1, 0.7, 0)
                
                addToTheme('Text & Icon', iconDivider)
            end
            
            -- Label methods
            local labelMethods = {}
            
            function labelMethods:SetTitle(newTitle)
                titleLabel.Text = newTitle
            end
            
            function labelMethods:SetDesc(newDesc)
                descLabel.Text = newDesc
                descLabel.Visible = newDesc ~= ""
            end
            
            function labelMethods:SetVisible(isVisible)
                labelContainer.Visible = isVisible
            end
            
            return labelMethods
        end
        
        function tabFunctions:Button(buttonConfig)
            local buttonTitle = buttonConfig.Title or "Button"
            local buttonDesc = buttonConfig.Desc or ""
            local buttonIcon = buttonConfig.Image or ""
            local buttonCallback = buttonConfig.Callback or function() end
            
            -- Create button container
            local buttonContainer = Instance.new("Frame")
            buttonContainer.Name = "Real Background"
            buttonContainer.Parent = tabScroller
            buttonContainer.BackgroundTransparency = 1
            buttonContainer.Size = UDim2.new(1, 0, 0, 35)
            
            local buttonBg = Instance.new("Frame")
            buttonBg.Name = "Background"
            buttonBg.Parent = buttonContainer
            buttonBg.BackgroundColor3 = themes[currentTheme].Function.Button.Background
            buttonBg.Size = UDim2.new(1, 0, 1, 0)
            buttonBg.ClipsDescendants = true
            
            addToTheme('Function.Button.Background', buttonBg)
            
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.Parent = buttonBg
            
            -- Button content
            local buttonContent = Instance.new("Frame")
            buttonContent.Name = "T"
            buttonContent.Parent = buttonBg
            buttonContent.AnchorPoint = Vector2.new(0, 0.5)
            buttonContent.BackgroundTransparency = 1
            buttonContent.Position = UDim2.new(0, 0, 0.5, 0)
            buttonContent.Size = UDim2.new(1, 0, 1, 0)
            
            local contentLayout = Instance.new("UIListLayout")
            contentLayout.Parent = buttonContent
            contentLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            
            local contentPadding = Instance.new("UIPadding")
            contentPadding.Parent = buttonContent
            contentPadding.PaddingLeft = buttonIcon ~= "" and UDim.new(0, 50) or UDim.new(0, 13)
            contentPadding.PaddingRight = UDim.new(0, 50)
            
            -- Title
            local titleLabel = Instance.new("TextLabel")
            titleLabel.Name = "Title"
            titleLabel.Parent = buttonContent
            titleLabel.BackgroundTransparency = 1
            titleLabel.Size = UDim2.new(1, 0, 0, 14)
            titleLabel.Font = Enum.Font.GothamBold
            titleLabel.Text = buttonTitle
            titleLabel.TextColor3 = themes[currentTheme]['Text & Icon']
            titleLabel.TextSize = 12
            titleLabel.TextTransparency = 0
            titleLabel.TextXAlignment = Enum.TextXAlignment.Left
            titleLabel.AutomaticSize = Enum.AutomaticSize.Y
            
            addToTheme('Text & Icon', titleLabel)
            
            -- Description
            local descLabel = Instance.new("TextLabel")
            descLabel.Name = "Desc"
            descLabel.Parent = buttonContent
            descLabel.BackgroundTransparency = 1
            descLabel.LayoutOrder = 1
            descLabel.Size = UDim2.new(1, 0, 0, 14)
            descLabel.Font = Enum.Font.GothamBold
            descLabel.Text = buttonDesc
            descLabel.TextColor3 = themes[currentTheme]['Text & Icon']
            descLabel.TextSize = 10
            descLabel.TextTransparency = 0.7
            descLabel.TextXAlignment = Enum.TextXAlignment.Left
            descLabel.Visible = buttonDesc ~= ""
            descLabel.AutomaticSize = Enum.AutomaticSize.Y
            
            addToTheme('Text & Icon', descLabel)
            
            -- Icon if provided
            if buttonIcon ~= "" then
                local iconFrame = Instance.new("Frame")
                iconFrame.Name = "Image"
                iconFrame.Parent = buttonBg
                iconFrame.BackgroundTransparency = 1
                iconFrame.Size = UDim2.new(0, 40, 1, 0)
                
                local iconImg = Instance.new("ImageLabel")
                iconImg.Name = "Icon"
                iconImg.Parent = iconFrame
                iconImg.AnchorPoint = Vector2.new(0.5, 0.5)
                iconImg.BackgroundTransparency = 1
                iconImg.Position = UDim2.new(0.5, 0, 0.5, 0)
                iconImg.Size = UDim2.new(0, 20, 0, 20)
                iconImg.Image = loadIcon(buttonIcon).Image
                iconImg.ImageTransparency = 0
                
                addToTheme('Text & Icon', iconImg)
                
                local iconDivider = Instance.new("Frame")
                iconDivider.Parent = iconFrame
                iconDivider.AnchorPoint = Vector2.new(1, 0.5)
                iconDivider.BackgroundColor3 = themes[currentTheme]['Text & Icon']
                iconDivider.BackgroundTransparency = 0.9
                iconDivider.Position = UDim2.new(1, 0, 0.5, 0)
                iconDivider.Size = UDim2.new(0, 1, 0.7, 0)
                
                addToTheme('Text & Icon', iconDivider)
            end
            
            -- Arrow indicator
            local arrowContainer = Instance.new("Frame")
            arrowContainer.Name = "F"
            arrowContainer.Parent = buttonBg
            arrowContainer.AnchorPoint = Vector2.new(1, 0.5)
            arrowContainer.BackgroundTransparency = 1
            arrowContainer.Position = UDim2.new(1, 0, 0.5, 0)
            arrowContainer.Size = UDim2.new(0, 50, 0.8, 0)
            
            local arrowLayout = Instance.new("UIListLayout")
            arrowLayout.Parent = arrowContainer
            arrowLayout.FillDirection = Enum.FillDirection.Horizontal
            arrowLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
            arrowLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            arrowLayout.Padding = UDim.new(0, 8)
            
            local arrowPadding = Instance.new("UIPadding")
            arrowPadding.Parent = arrowContainer
            arrowPadding.PaddingRight = UDim.new(0, 13)
            
            local arrowImg = Instance.new("ImageLabel")
            arrowImg.Name = "Image"
            arrowImg.Parent = arrowContainer
            arrowImg.AnchorPoint = Vector2.new(1, 0.5)
            arrowImg.BackgroundTransparency = 1
            arrowImg.Position = UDim2.new(1, 0, 0.5, 0)
            arrowImg.Size = UDim2.new(0, 20, 0, 20)
            arrowImg.Image = "rbxassetid://14923748517"
            arrowImg.ImageTransparency = 0.3
            
            -- Click functionality
            local buttonClick = createClickButton(buttonBg)
            
            buttonClick.MouseButton1Click:Connect(function()
                createClickEffect(buttonBg, buttonClick)
                
                -- Button press animation
                buttonBg.AnchorPoint = Vector2.new(0.5, 0.5)
                buttonBg.Position = UDim2.new(0.5, 0, 0.5, 0)
                
                createTween(buttonBg, TweenInfo.new(0.15, Enum.EasingStyle.Back), {
                    Size = UDim2.new(0.9, 0, 0.9, 0)
                }):Play()
                
                task.delay(0.06, function()
                    createTween(buttonBg, TweenInfo.new(0.15, Enum.EasingStyle.Back), {
                        Size = UDim2.new(1, 0, 1, 0)
                    }):Play()
                end)
                
                -- Call callback
                pcall(buttonCallback)
            end)
            
            -- Button methods
            local buttonMethods = {}
            
            function buttonMethods:SetTitle(newTitle)
                titleLabel.Text = newTitle
            end
            
            function buttonMethods:SetDesc(newDesc)
                descLabel.Text = newDesc
                descLabel.Visible = newDesc ~= ""
            end
            
            function buttonMethods:SetVisible(isVisible)
                buttonContainer.Visible = isVisible
            end
            
            return buttonMethods
        end
        
        function tabFunctions:Slider(sliderConfig)
            local sliderTitle = sliderConfig.Title or "Slider"
            local sliderDesc = sliderConfig.Desc or ""
            local sliderIcon = sliderConfig.Image or ""
            local sliderMin = sliderConfig.Min or 0
            local sliderMax = sliderConfig.Max or 100
            local sliderValue = sliderConfig.Value or sliderMin
            local sliderRounding = sliderConfig.Rounding or 2
            local sliderCallback = sliderConfig.Callback or function() end
            
            -- Create slider container
            local sliderContainer = Instance.new("Frame")
            sliderContainer.Name = "Real Background"
            sliderContainer.Parent = tabScroller
            sliderContainer.BackgroundTransparency = 1
            sliderContainer.Size = UDim2.new(1, 0, 0, 35)
            
            local sliderBg = Instance.new("Frame")
            sliderBg.Name = "Background"
            sliderBg.Parent = sliderContainer
            sliderBg.BackgroundColor3 = themes[currentTheme].Function.Slider.Background
            sliderBg.Size = UDim2.new(1, 0, 1, 0)
            
            addToTheme('Function.Slider.Background', sliderBg)
            
            local sliderCorner = Instance.new("UICorner")
            sliderCorner.Parent = sliderBg
            
            -- Slider content
            local sliderContent = Instance.new("Frame")
            sliderContent.Name = "T"
            sliderContent.Parent = sliderBg
            sliderContent.AnchorPoint = Vector2.new(0, 0.5)
            sliderContent.BackgroundTransparency = 1
            sliderContent.Position = UDim2.new(0, 0, 0.5, 0)
            sliderContent.Size = UDim2.new(1, 0, 1, 0)
            
            local contentLayout = Instance.new("UIListLayout")
            contentLayout.Parent = sliderContent
            contentLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            
            local contentPadding = Instance.new("UIPadding")
            contentPadding.Parent = sliderContent
            contentPadding.PaddingLeft = sliderIcon ~= "" and UDim.new(0, 50) or UDim.new(0, 13)
            contentPadding.PaddingRight = UDim.new(0, 200)
            
            -- Title
            local titleLabel = Instance.new("TextLabel")
            titleLabel.Name = "Title"
            titleLabel.Parent = sliderContent
            titleLabel.BackgroundTransparency = 1
            titleLabel.Size = UDim2.new(1, 0, 0, 14)
            titleLabel.Font = Enum.Font.GothamBold
            titleLabel.Text = sliderTitle
            titleLabel.TextColor3 = themes[currentTheme]['Text & Icon']
            titleLabel.TextSize = 12
            titleLabel.TextTransparency = 0
            titleLabel.TextXAlignment = Enum.TextXAlignment.Left
            titleLabel.AutomaticSize = Enum.AutomaticSize.Y
            
            addToTheme('Text & Icon', titleLabel)
            
            -- Description
            local descLabel = Instance.new("TextLabel")
            descLabel.Name = "Desc"
            descLabel.Parent = sliderContent
            descLabel.BackgroundTransparency = 1
            descLabel.LayoutOrder = 1
            descLabel.Size = UDim2.new(1, 0, 0, 14)
            descLabel.Font = Enum.Font.GothamBold
            descLabel.Text = sliderDesc
            descLabel.TextColor3 = themes[currentTheme]['Text & Icon']
            descLabel.TextSize = 10
            descLabel.TextTransparency = 0.7
            descLabel.TextXAlignment = Enum.TextXAlignment.Left
            descLabel.Visible = sliderDesc ~= ""
            descLabel.AutomaticSize = Enum.AutomaticSize.Y
            
            addToTheme('Text & Icon', descLabel)
            
            -- Icon if provided
            if sliderIcon ~= "" then
                local iconFrame = Instance.new("Frame")
                iconFrame.Name = "Image"
                iconFrame.Parent = sliderBg
                iconFrame.BackgroundTransparency = 1
                iconFrame.Size = UDim2.new(0, 40, 1, 0)
                
                local iconImg = Instance.new("ImageLabel")
                iconImg.Name = "Icon"
                iconImg.Parent = iconFrame
                iconImg.AnchorPoint = Vector2.new(0.5, 0.5)
                iconImg.BackgroundTransparency = 1
                iconImg.Position = UDim2.new(0.5, 0, 0.5, 0)
                iconImg.Size = UDim2.new(0, 20, 0, 20)
                iconImg.Image = loadIcon(sliderIcon).Image
                iconImg.ImageTransparency = 0
                
                addToTheme('Text & Icon', iconImg)
                
                local iconDivider = Instance.new("Frame")
                iconDivider.Parent = iconFrame
                iconDivider.AnchorPoint = Vector2.new(1, 0.5)
                iconDivider.BackgroundColor3 = themes[currentTheme]['Text & Icon']
                iconDivider.BackgroundTransparency = 0.9
                iconDivider.Position = UDim2.new(1, 0, 0.5, 0)
                iconDivider.Size = UDim2.new(0, 1, 0.7, 0)
                
                addToTheme('Text & Icon', iconDivider)
            end
            
            -- Slider controls
            local sliderControls = Instance.new("Frame")
            sliderControls.Name = "F"
            sliderControls.Parent = sliderBg
            sliderControls.AnchorPoint = Vector2.new(1, 0.5)
            sliderControls.BackgroundTransparency = 1
            sliderControls.Position = UDim2.new(1, 0, 0.5, 0)
            sliderControls.Size = UDim2.new(0, 195, 0.8, 0)
            
            local controlsLayout = Instance.new("UIListLayout")
            controlsLayout.Parent = sliderControls
            controlsLayout.FillDirection = Enum.FillDirection.Horizontal
            controlsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
            controlsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            controlsLayout.Padding = UDim.new(0, 8)
            
            local controlsPadding = Instance.new("UIPadding")
            controlsPadding.Parent = sliderControls
            controlsPadding.PaddingRight = UDim.new(0, 13)
            
            -- Value display box
            local valueBox = Instance.new("Frame")
            valueBox.Parent = sliderControls
            valueBox.BackgroundColor3 = themes[currentTheme].Function.Slider['Value Background']
            valueBox.Size = UDim2.new(0, 50, 0, 20)
            valueBox.LayoutOrder = 1
            
            addToTheme('Function.Slider.Value Background', valueBox)
            
            local valueBoxCorner = Instance.new("UICorner")
            valueBoxCorner.CornerRadius = UDim.new(0, 4)
            valueBoxCorner.Parent = valueBox
            
            local valueBoxStroke = Instance.new("UIStroke")
            valueBoxStroke.Parent = valueBox
            valueBoxStroke.Color = themes[currentTheme].Function.Slider['Value Stroke']
            valueBoxStroke.Thickness = 1
            valueBoxStroke.Transparency = 0.95
            
            addToTheme('Function.Slider.Value Stroke', valueBoxStroke)
            
            local valueText = Instance.new("TextBox")
            valueText.Parent = valueBox
            valueText.BackgroundTransparency = 1
            valueText.Size = UDim2.new(1, 0, 1, 0)
            valueText.Font = Enum.Font.Cartoon
            valueText.Text = tostring(sliderValue)
            valueText.TextColor3 = themes[currentTheme]['Text & Icon']
            valueText.TextSize = 12
            
            addToTheme('Text & Icon', valueText)
            
            -- Slider track
            local sliderTrackContainer = Instance.new("Frame")
            sliderTrackContainer.Parent = sliderControls
            sliderTrackContainer.BackgroundTransparency = 1
            sliderTrackContainer.Size = UDim2.new(0, 120, 0, 20)
            
            local sliderTrack = Instance.new("Frame")
            sliderTrack.Parent = sliderTrackContainer
            sliderTrack.AnchorPoint = Vector2.new(0.5, 0.5)
            sliderTrack.BackgroundColor3 = themes[currentTheme].Function.Slider['Slider Bar']
            sliderTrack.Position = UDim2.new(0.5, 0, 0.5, 0)
            sliderTrack.Size = UDim2.new(1, 0, 0, 10)
            
            addToTheme('Function.Slider.Slider Bar', sliderTrack)
            
            local trackCorner = Instance.new("UICorner")
            trackCorner.CornerRadius = UDim.new(1, 0)
            trackCorner.Parent = sliderTrack
            
            local trackFill = Instance.new("Frame")
            trackFill.Parent = sliderTrack
            trackFill.AnchorPoint = Vector2.new(0, 0.5)
            trackFill.BackgroundColor3 = themes[currentTheme].Function.Slider['Slider Bar Value']
            trackFill.Position = UDim2.new(0, 0, 0.5, 0)
            trackFill.Size = UDim2.new(0, 0, 1, 0)
            
            addToTheme('Function.Slider.Slider Bar Value', trackFill)
            
            local fillCorner = Instance.new("UICorner")
            fillCorner.CornerRadius = UDim.new(1, 0)
            fillCorner.Parent = trackFill
            
            local sliderThumb = Instance.new("Frame")
            sliderThumb.Parent = trackFill
            sliderThumb.AnchorPoint = Vector2.new(1, 0.5)
            sliderThumb.BackgroundColor3 = themes[currentTheme].Function.Slider['Circle Value']
            sliderThumb.Position = UDim2.new(1, 0, 0.5, 0)
            sliderThumb.Size = UDim2.new(0, 13, 0, 13)
            
            addToTheme('Function.Slider.Circle Value', sliderThumb)
            
            local thumbCorner = Instance.new("UICorner")
            thumbCorner.CornerRadius = UDim.new(1, 0)
            thumbCorner.Parent = sliderThumb
            
            local trackPadding = Instance.new("UIPadding")
            trackPadding.Parent = sliderTrack
            trackPadding.PaddingBottom = UDim.new(0, 2)
            trackPadding.PaddingLeft = UDim.new(0, 2)
            trackPadding.PaddingRight = UDim.new(0, 2)
            trackPadding.PaddingTop = UDim.new(0, 2)
            
            -- Slider functionality
            local function roundToDecimal(value, decimals)
                local factor = 10 ^ decimals
                return math.floor(value * factor + 0.5) / factor
            end
            
            local function updateSlider(value)
                value = math.clamp(value, sliderMin, sliderMax)
                value = roundToDecimal(value, sliderRounding)
                sliderValue = value
                
                -- Update fill width
                local fillPercentage = (value - sliderMin) / (sliderMax - sliderMin)
                createTween(trackFill, TweenInfo.new(0.15, Enum.EasingStyle.Exponential), {
                    Size = UDim2.new(math.clamp(fillPercentage, 0.12, 1), 0, 1, 0)
                }):Play()
                
                -- Update value text
                valueText.Text = tostring(roundToDecimal(value, sliderRounding))
                
                -- Call callback
                pcall(sliderCallback, value)
            end
            
            -- Initial update
            updateSlider(sliderValue)
            
            -- Text box input
            valueText.FocusLost:Connect(function()
                local newValue = tonumber(valueText.Text) or sliderMin
                updateSlider(newValue)
            end)
            
            -- Drag functionality
            local isDraggingSlider = false
            
            local function handleSliderDrag(input)
                local trackAbsolute = sliderTrack.AbsolutePosition
                local trackSize = sliderTrack.AbsoluteSize.X
                local relativeX = math.clamp((input.Position.X - trackAbsolute.X) / trackSize, 0, 1)
                local newValue = relativeX * (sliderMax - sliderMin) + sliderMin
                updateSlider(newValue)
            end
            
            local sliderClick = createClickButton(sliderTrackContainer)
            
            sliderClick.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    isDraggingSlider = true
                    handleSliderDrag(input)
                end
            end)
            
            sliderClick.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    isDraggingSlider = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if isDraggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement) then
                    handleSliderDrag(input)
                end
            end)
            
            -- Slider methods
            local sliderMethods = {}
            
            function sliderMethods:SetTitle(newTitle)
                titleLabel.Text = newTitle
            end
            
            function sliderMethods:SetDesc(newDesc)
                descLabel.Text = newDesc
                descLabel.Visible = newDesc ~= ""
            end
            
            function sliderMethods:SetVisible(isVisible)
                sliderContainer.Visible = isVisible
            end
            
            function sliderMethods:SetValue(newValue)
                updateSlider(newValue)
            end
            
            function sliderMethods:GetValue()
                return sliderValue
            end
            
            function sliderMethods:SetMin(newMin)
                sliderMin = newMin
                if sliderValue < newMin then
                    updateSlider(newMin)
                end
            end
            
            function sliderMethods:SetMax(newMax)
                sliderMax = newMax
                if sliderValue > newMax then
                    updateSlider(newMax)
                end
            end
            
            -- Track for UI updates
            UIStateTracker:TrackElement(
                sliderTitle .. "_Slider",
                "Slider",
                function() return sliderValue end,
                function(state) sliderMethods:SetValue(state) end
            )
            
            return sliderMethods
        end
        
        function tabFunctions:Dropdown(dropdownConfig)
            local dropdownTitle = dropdownConfig.Title or "Dropdown"
            local dropdownDesc = dropdownConfig.Desc or ""
            local dropdownIcon = dropdownConfig.Image or ""
            local dropdownList = dropdownConfig.List or {}
            local dropdownValue = dropdownConfig.Value or dropdownList[1]
            local dropdownMulti = dropdownConfig.Multi or false
            local dropdownCallback = dropdownConfig.Callback or function() end
            
            -- Create dropdown container
            local dropdownContainer = Instance.new("Frame")
            dropdownContainer.Name = "Real Background"
            dropdownContainer.Parent = tabScroller
            dropdownContainer.BackgroundTransparency = 1
            dropdownContainer.Size = UDim2.new(1, 0, 0, 35)
            
            local dropdownBg = Instance.new("Frame")
            dropdownBg.Name = "Background"
            dropdownBg.Parent = dropdownContainer
            dropdownBg.BackgroundColor3 = themes[currentTheme].Function.Dropdown.Background
            dropdownBg.Size = UDim2.new(1, 0, 1, 0)
            
            addToTheme('Function.Dropdown.Background', dropdownBg)
            
            local dropdownCorner = Instance.new("UICorner")
            dropdownCorner.Parent = dropdownBg
            
            -- Dropdown content
            local dropdownContent = Instance.new("Frame")
            dropdownContent.Name = "T"
            dropdownContent.Parent = dropdownBg
            dropdownContent.AnchorPoint = Vector2.new(0, 0.5)
            dropdownContent.BackgroundTransparency = 1
            dropdownContent.Position = UDim2.new(0, 0, 0.5, 0)
            dropdownContent.Size = UDim2.new(1, 0, 1, 0)
            
            local contentLayout = Instance.new("UIListLayout")
            contentLayout.Parent = dropdownContent
            contentLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            
            local contentPadding = Instance.new("UIPadding")
            contentPadding.Parent = dropdownContent
            contentPadding.PaddingLeft = dropdownIcon ~= "" and UDim.new(0, 50) or UDim.new(0, 13)
            contentPadding.PaddingRight = UDim.new(0, 125)
            
            -- Title
            local titleLabel = Instance.new("TextLabel")
            titleLabel.Name = "Title"
            titleLabel.Parent = dropdownContent
            titleLabel.BackgroundTransparency = 1
            titleLabel.Size = UDim2.new(1, 0, 0, 14)
            titleLabel.Font = Enum.Font.GothamBold
            titleLabel.Text = dropdownTitle
            titleLabel.TextColor3 = themes[currentTheme]['Text & Icon']
            titleLabel.TextSize = 12
            titleLabel.TextTransparency = 0
            titleLabel.TextXAlignment = Enum.TextXAlignment.Left
            titleLabel.AutomaticSize = Enum.AutomaticSize.Y
            
            addToTheme('Text & Icon', titleLabel)
            
            -- Description
            local descLabel = Instance.new("TextLabel")
            descLabel.Name = "Desc"
            descLabel.Parent = dropdownContent
            descLabel.BackgroundTransparency = 1
            descLabel.LayoutOrder = 1
            descLabel.Size = UDim2.new(1, 0, 0, 14)
            descLabel.Font = Enum.Font.GothamBold
            descLabel.Text = dropdownDesc
            descLabel.TextColor3 = themes[currentTheme]['Text & Icon']
            descLabel.TextSize = 10
            descLabel.TextTransparency = 0.7
            descLabel.TextXAlignment = Enum.TextXAlignment.Left
            descLabel.Visible = dropdownDesc ~= ""
            descLabel.AutomaticSize = Enum.AutomaticSize.Y
            
            addToTheme('Text & Icon', descLabel)
            
            -- Icon if provided
            if dropdownIcon ~= "" then
                local iconFrame = Instance.new("Frame")
                iconFrame.Name = "Image"
                iconFrame.Parent = dropdownBg
                iconFrame.BackgroundTransparency = 1
                iconFrame.Size = UDim2.new(0, 40, 1, 0)
                
                local iconImg = Instance.new("ImageLabel")
                iconImg.Name = "Icon"
                iconImg.Parent = iconFrame
                iconImg.AnchorPoint = Vector2.new(0.5, 0.5)
                iconImg.BackgroundTransparency = 1
                iconImg.Position = UDim2.new(0.5, 0, 0.5, 0)
                iconImg.Size = UDim2.new(0, 20, 0, 20)
                iconImg.Image = loadIcon(dropdownIcon).Image
                iconImg.ImageTransparency = 0
                
                addToTheme('Text & Icon', iconImg)
                
                local iconDivider = Instance.new("Frame")
                iconDivider.Parent = iconFrame
                iconDivider.AnchorPoint = Vector2.new(1, 0.5)
                iconDivider.BackgroundColor3 = themes[currentTheme]['Text & Icon']
                iconDivider.BackgroundTransparency = 0.9
                iconDivider.Position = UDim2.new(1, 0, 0.5, 0)
                iconDivider.Size = UDim2.new(0, 1, 0.7, 0)
                
                addToTheme('Text & Icon', iconDivider)
            end
            
            -- Dropdown value display
            local valueContainer = Instance.new("Frame")
            valueContainer.Name = "F"
            valueContainer.Parent = dropdownBg
            valueContainer.AnchorPoint = Vector2.new(1, 0.5)
            valueContainer.BackgroundTransparency = 1
            valueContainer.Position = UDim2.new(1, 0, 0.5, 0)
            valueContainer.Size = UDim2.new(0, 120, 0.8, 0)
            
            local valueLayout = Instance.new("UIListLayout")
            valueLayout.Parent = valueContainer
            valueLayout.Padding = UDim.new(0, 15)
            valueLayout.FillDirection = Enum.FillDirection.Horizontal
            valueLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
            valueLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            
            local valuePadding = Instance.new("UIPadding")
            valuePadding.Parent = valueContainer
            valuePadding.PaddingRight = UDim.new(0, 13)
            
            local valueBox = Instance.new("Frame")
            valueBox.Parent = valueContainer
            valueBox.BackgroundColor3 = themes[currentTheme].Function.Dropdown['Value Background']
            valueBox.Size = UDim2.new(0, 100, 0, 20)
            
            addToTheme('Function.Dropdown.Value Background', valueBox)
            
            local valueBoxCorner = Instance.new("UICorner")
            valueBoxCorner.CornerRadius = UDim.new(0, 4)
            valueBoxCorner.Parent = valueBox
            
            local valueBoxStroke = Instance.new("UIStroke")
            valueBoxStroke.Parent = valueBox
            valueBoxStroke.Color = themes[currentTheme].Function.Dropdown['Value Stroke']
            valueBoxStroke.Thickness = 1
            valueBoxStroke.Transparency = 0.95
            
            addToTheme('Function.Dropdown.Value Stroke', valueBoxStroke)
            
            local valueText = Instance.new("TextLabel")
            valueText.Parent = valueBox
            valueText.BackgroundTransparency = 1
            valueText.Size = UDim2.new(0.8, 0, 1, 0)
            valueText.Font = Enum.Font.GothamBold
            valueText.Text = dropdownMulti and "--" or tostring(dropdownValue or "--")
            valueText.TextColor3 = themes[currentTheme]['Text & Icon']
            valueText.TextSize = 10
            valueText.TextTransparency = 0.3
            valueText.TextXAlignment = Enum.TextXAlignment.Left
            valueText.TextTruncate = Enum.TextTruncate.AtEnd
            
            addToTheme('Text & Icon', valueText)
            
            local valueTextPadding = Instance.new("UIPadding")
            valueTextPadding.Parent = valueBox
            valueTextPadding.PaddingLeft = UDim.new(0, 5)
            valueTextPadding.PaddingRight = UDim.new(0, 5)
            
            local dropdownArrow = Instance.new("ImageLabel")
            dropdownArrow.Parent = valueBox
            dropdownArrow.AnchorPoint = Vector2.new(1, 0.5)
            dropdownArrow.BackgroundTransparency = 1
            dropdownArrow.Position = UDim2.new(1, 0, 0.5, 0)
            dropdownArrow.Size = UDim2.new(0, 20, 0, 20)
            dropdownArrow.Image = "rbxassetid://14937709869"
            dropdownArrow.ImageTransparency = 0.3
            
            addToTheme('Text & Icon', dropdownArrow)
            
            -- Dropdown methods
            local dropdownMethods = {}
            local selectedValues = dropdownMulti and {} or nil
            local currentValue = dropdownValue
            
            if dropdownMulti and type(dropdownValue) == "table" then
                selectedValues = dropdownValue
                local selectedText = ""
                for i, v in ipairs(dropdownValue) do
                    selectedText = selectedText .. (i > 1 and ", " or "") .. v
                end
                valueText.Text = selectedText ~= "" and selectedText or "--"
            end
            
            function dropdownMethods:SetTitle(newTitle)
                titleLabel.Text = newTitle
            end
            
            function dropdownMethods:SetDesc(newDesc)
                descLabel.Text = newDesc
                descLabel.Visible = newDesc ~= ""
            end
            
            function dropdownMethods:SetVisible(isVisible)
                dropdownContainer.Visible = isVisible
            end
            
            function dropdownMethods:SetValue(newValue)
                if dropdownMulti then
                    if type(newValue) == "table" then
                        selectedValues = newValue
                        local selectedText = ""
                        for i, v in ipairs(newValue) do
                            selectedText = selectedText .. (i > 1 and ", " or "") .. v
                        end
                        valueText.Text = selectedText ~= "" and selectedText or "--"
                        pcall(dropdownCallback, newValue)
                    end
                else
                    currentValue = newValue
                    valueText.Text = tostring(newValue)
                    pcall(dropdownCallback, newValue)
                end
            end
            
            function dropdownMethods:GetValue()
                if dropdownMulti then
                    return selectedValues
                else
                    return currentValue
                end
            end
            
            function dropdownMethods:Add(item)
                table.insert(dropdownList, item)
            end
            
            function dropdownMethods:Clear(item)
                if item then
                    if type(item) == "string" then
                        for i = #dropdownList, 1, -1 do
                            if dropdownList[i] == item then
                                table.remove(dropdownList, i)
                            end
                        end
                    end
                else
                    dropdownList = {}
                end
            end
            
            -- Track for UI updates
            UIStateTracker:TrackElement(
                dropdownTitle .. "_Dropdown",
                "Dropdown",
                function() 
                    if dropdownMulti then
                        return selectedValues
                    else
                        return currentValue
                    end
                end,
                function(state) dropdownMethods:SetValue(state) end
            )
            
            return dropdownMethods
        end
        
        function tabFunctions:Textbox(textboxConfig)
            local textboxTitle = textboxConfig.Title or "Textbox"
            local textboxDesc = textboxConfig.Desc or ""
            local textboxIcon = textboxConfig.Image or ""
            local textboxValue = textboxConfig.Value or ""
            local textboxPlaceholder = textboxConfig.Placeholder or "Enter text..."
            local textboxClear = textboxConfig.ClearText or false
            local textboxCallback = textboxConfig.Callback or function() end
            
            -- Create textbox container
            local textboxContainer = Instance.new("Frame")
            textboxContainer.Name = "Real Background"
            textboxContainer.Parent = tabScroller
            textboxContainer.BackgroundTransparency = 1
            textboxContainer.Size = UDim2.new(1, 0, 0, 35)
            
            local textboxBg = Instance.new("Frame")
            textboxBg.Name = "Background"
            textboxBg.Parent = textboxContainer
            textboxBg.BackgroundColor3 = themes[currentTheme].Function.Textbox.Background
            textboxBg.Size = UDim2.new(1, 0, 1, 0)
            
            addToTheme('Function.Textbox.Background', textboxBg)
            
            local textboxCorner = Instance.new("UICorner")
            textboxCorner.Parent = textboxBg
            
            -- Textbox content
            local textboxContent = Instance.new("Frame")
            textboxContent.Name = "T"
            textboxContent.Parent = textboxBg
            textboxContent.AnchorPoint = Vector2.new(0, 0.5)
            textboxContent.BackgroundTransparency = 1
            textboxContent.Position = UDim2.new(0, 0, 0.5, 0)
            textboxContent.Size = UDim2.new(1, 0, 1, 0)
            
            local contentLayout = Instance.new("UIListLayout")
            contentLayout.Parent = textboxContent
            contentLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            
            local contentPadding = Instance.new("UIPadding")
            contentPadding.Parent = textboxContent
            contentPadding.PaddingLeft = textboxIcon ~= "" and UDim.new(0, 50) or UDim.new(0, 13)
            contentPadding.PaddingRight = UDim.new(0, 145)
            
            -- Title
            local titleLabel = Instance.new("TextLabel")
            titleLabel.Name = "Title"
            titleLabel.Parent = textboxContent
            titleLabel.BackgroundTransparency = 1
            titleLabel.Size = UDim2.new(1, 0, 0, 14)
            titleLabel.Font = Enum.Font.GothamBold
            titleLabel.Text = textboxTitle
            titleLabel.TextColor3 = themes[currentTheme]['Text & Icon']
            titleLabel.TextSize = 12
            titleLabel.TextTransparency = 0
            titleLabel.TextXAlignment = Enum.TextXAlignment.Left
            titleLabel.AutomaticSize = Enum.AutomaticSize.Y
            
            addToTheme('Text & Icon', titleLabel)
            
            -- Description
            local descLabel = Instance.new("TextLabel")
            descLabel.Name = "Desc"
            descLabel.Parent = textboxContent
            descLabel.BackgroundTransparency = 1
            descLabel.LayoutOrder = 1
            descLabel.Size = UDim2.new(1, 0, 0, 14)
            descLabel.Font = Enum.Font.GothamBold
            descLabel.Text = textboxDesc
            descLabel.TextColor3 = themes[currentTheme]['Text & Icon']
            descLabel.TextSize = 10
            descLabel.TextTransparency = 0.7
            descLabel.TextXAlignment = Enum.TextXAlignment.Left
            descLabel.Visible = textboxDesc ~= ""
            descLabel.AutomaticSize = Enum.AutomaticSize.Y
            
            addToTheme('Text & Icon', descLabel)
            
            -- Icon if provided
            if textboxIcon ~= "" then
                local iconFrame = Instance.new("Frame")
                iconFrame.Name = "Image"
                iconFrame.Parent = textboxBg
                iconFrame.BackgroundTransparency = 1
                iconFrame.Size = UDim2.new(0, 40, 1, 0)
                
                local iconImg = Instance.new("ImageLabel")
                iconImg.Name = "Icon"
                iconImg.Parent = iconFrame
                iconImg.AnchorPoint = Vector2.new(0.5, 0.5)
                iconImg.BackgroundTransparency = 1
                iconImg.Position = UDim2.new(0.5, 0, 0.5, 0)
                iconImg.Size = UDim2.new(0, 20, 0, 20)
                iconImg.Image = loadIcon(textboxIcon).Image
                iconImg.ImageTransparency = 0
                
                addToTheme('Text & Icon', iconImg)
                
                local iconDivider = Instance.new("Frame")
                iconDivider.Parent = iconFrame
                iconDivider.AnchorPoint = Vector2.new(1, 0.5)
                iconDivider.BackgroundColor3 = themes[currentTheme]['Text & Icon']
                iconDivider.BackgroundTransparency = 0.9
                iconDivider.Position = UDim2.new(1, 0, 0.5, 0)
                iconDivider.Size = UDim2.new(0, 1, 0.7, 0)
                
                addToTheme('Text & Icon', iconDivider)
            end
            
            -- Text input box
            local inputContainer = Instance.new("Frame")
            inputContainer.Name = "F"
            inputContainer.Parent = textboxBg
            inputContainer.AnchorPoint = Vector2.new(1, 0.5)
            inputContainer.BackgroundTransparency = 1
            inputContainer.Position = UDim2.new(1, 0, 0.5, 0)
            inputContainer.Size = UDim2.new(0, 150, 0.8, 0)
            
            local inputLayout = Instance.new("UIListLayout")
            inputLayout.Parent = inputContainer
            inputLayout.Padding = UDim.new(0, 15)
            inputLayout.FillDirection = Enum.FillDirection.Horizontal
            inputLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
            inputLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            
            local inputPadding = Instance.new("UIPadding")
            inputPadding.Parent = inputContainer
            inputPadding.PaddingRight = UDim.new(0, 13)
            
            local inputBox = Instance.new("Frame")
            inputBox.Parent = inputContainer
            inputBox.BackgroundColor3 = themes[currentTheme].Function.Textbox['Value Background']
            inputBox.Size = UDim2.new(0, 130, 0, 25)
            
            addToTheme('Function.Textbox.Value Background', inputBox)
            
            local inputBoxCorner = Instance.new("UICorner")
            inputBoxCorner.CornerRadius = UDim.new(0, 4)
            inputBoxCorner.Parent = inputBox
            
            local inputBoxStroke = Instance.new("UIStroke")
            inputBoxStroke.Parent = inputBox
            inputBoxStroke.Color = themes[currentTheme].Function.Textbox['Value Stroke']
            inputBoxStroke.Thickness = 1
            inputBoxStroke.Transparency = 0.95
            
            addToTheme('Function.Textbox.Value Stroke', inputBoxStroke)
            
            local inputBoxPadding = Instance.new("UIPadding")
            inputBoxPadding.Parent = inputBox
            inputBoxPadding.PaddingLeft = UDim.new(0, 5)
            inputBoxPadding.PaddingRight = UDim.new(0, 5)
            
            local inputField = Instance.new("TextBox")
            inputField.Name = "TextLabel"
            inputField.Parent = inputBox
            inputField.BackgroundTransparency = 1
            inputField.Size = UDim2.new(0.8, 0, 1, 0)
            inputField.Font = Enum.Font.GothamBold
            inputField.PlaceholderText = textboxPlaceholder
            inputField.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
            inputField.Text = textboxValue
            inputField.TextColor3 = themes[currentTheme]['Text & Icon']
            inputField.TextSize = 10
            inputField.TextTransparency = 0.3
            inputField.TextXAlignment = Enum.TextXAlignment.Left
            inputField.ClearTextOnFocus = not textboxClear
            
            addToTheme('Text & Icon', inputField)
            
            local inputIcon = Instance.new("ImageLabel")
            inputIcon.Parent = inputBox
            inputIcon.AnchorPoint = Vector2.new(1, 0.5)
            inputIcon.BackgroundTransparency = 1
            inputIcon.Position = UDim2.new(1, 0, 0.5, 0)
            inputIcon.Size = UDim2.new(0, 15, 0, 15)
            inputIcon.Image = "rbxassetid://13868675087"
            inputIcon.ImageTransparency = 0.3
            
            addToTheme('Text & Icon', inputIcon)
            
            local inputBottomLine = Instance.new("Frame")
            inputBottomLine.Parent = inputBox
            inputBottomLine.AnchorPoint = Vector2.new(0.5, 1)
            inputBottomLine.BackgroundColor3 = themes[currentTheme]['Text & Icon']
            inputBottomLine.BackgroundTransparency = 0.95
            inputBottomLine.Position = UDim2.new(0.5, 0, 1, 0)
            inputBottomLine.Size = UDim2.new(1.05, 0, 0, 2)
            
            -- Textbox functionality
            local function handleTextChange()
                if inputField.Text ~= "" then
                    pcall(textboxCallback, inputField.Text)
                end
            end
            
            inputField.FocusLost:Connect(handleTextChange)
            
            task.delay(0, function()
                if textboxValue ~= "" then
                    handleTextChange()
                end
            end)
            
            -- Textbox methods
            local textboxMethods = {}
            
            function textboxMethods:SetTitle(newTitle)
                titleLabel.Text = newTitle
            end
            
            function textboxMethods:SetDesc(newDesc)
                descLabel.Text = newDesc
                descLabel.Visible = newDesc ~= ""
            end
            
            function textboxMethods:SetVisible(isVisible)
                textboxContainer.Visible = isVisible
            end
            
            function textboxMethods:SetValue(newValue)
                inputField.Text = newValue
                handleTextChange()
            end
            
            function textboxMethods:GetValue()
                return inputField.Text
            end
            
            function textboxMethods:SetClearTextOnFocus(shouldClear)
                inputField.ClearTextOnFocus = not shouldClear
            end
            
            function textboxMethods:SetPlaceholderText(newPlaceholder)
                inputField.PlaceholderText = newPlaceholder
            end
            
            -- Track for UI updates
            UIStateTracker:TrackElement(
                textboxTitle .. "_Textbox",
                "Textbox",
                function() return inputField.Text end,
                function(state) textboxMethods:SetValue(state) end
            )
            
            return textboxMethods
        end
        
        return tabFunctions
    end
    
    function tabs:Notify(notificationConfig)
        local notifTitle = notificationConfig.Title or "Notification"
        local notifDesc = notificationConfig.Desc or ""
        local notifTime = notificationConfig.Time or 5
        
        -- Create notification container
        local notification = Instance.new("Frame")
        notification.Name = "Notification"
        notification.Parent = ScreenGui
        notification.AnchorPoint = Vector2.new(1, 1)
        notification.BackgroundTransparency = 1
        notification.Position = UDim2.new(1, 0, 1, 0)
        notification.Size = UDim2.new(0, 100, 0, 100)
        
        local notifLayout = Instance.new("UIListLayout")
        notifLayout.Parent = notification
        notifLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
        notifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
        
        local notifPadding = Instance.new("UIPadding")
        notifPadding.Parent = notification
        notifPadding.PaddingBottom = UDim.new(0, 20)
        notifPadding.PaddingRight = UDim.new(0, 5)
        
        -- Notification shadow
        local notifShadow = Instance.new("ImageLabel")
        notifShadow.Name = "Shadow"
        notifShadow.Parent = notification
        notifShadow.BackgroundTransparency = 1
        notifShadow.Size = UDim2.new(0, 180, 0, 0)
        notifShadow.Image = "rbxassetid://1316045217"
        notifShadow.ImageColor3 = themes[currentTheme].Shadow
        notifShadow.ImageTransparency = 0.5
        notifShadow.ScaleType = Enum.ScaleType.Slice
        notifShadow.SliceCenter = Rect.new(10, 10, 118, 118)
        
        addToTheme('Shadow', notifShadow)
        
        local shadowPadding = Instance.new("UIPadding")
        shadowPadding.Parent = notifShadow
        shadowPadding.PaddingBottom = UDim.new(0, 5)
        shadowPadding.PaddingLeft = UDim.new(0, 5)
        shadowPadding.PaddingRight = UDim.new(0, 5)
        shadowPadding.PaddingTop = UDim.new(0, 5)
        
        -- Notification background
        local notifBg = Instance.new("CanvasGroup")
        notifBg.Name = "Background"
        notifBg.Parent = notifShadow
        notifBg.AnchorPoint = Vector2.new(0.5, 0.5)
        notifBg.BackgroundColor3 = themes[currentTheme].Background
        notifBg.Position = UDim2.new(0.5, 0, 0.5, 0)
        notifBg.Size = UDim2.new(1, 0, 1, 0)
        notifBg.GroupTransparency = 1
        
        addToTheme('Background', notifBg)
        
        local notifCorner = Instance.new("UICorner")
        notifCorner.CornerRadius = UDim.new(0, 6)
        notifCorner.Parent = notifBg
        
        -- Progress bar
        local progressBar = Instance.new("Frame")
        progressBar.Parent = notifBg
        progressBar.AnchorPoint = Vector2.new(0, 1)
        progressBar.BackgroundColor3 = themes[currentTheme]['Text & Icon']
        progressBar.BackgroundTransparency = 0.9
        progressBar.Position = UDim2.new(0, 0, 1, 0)
        progressBar.Size = UDim2.new(1, 0, 0, 4)
        
        -- Notification content
        local notifContent = Instance.new("Frame")
        notifContent.Name = "Text"
        notifContent.Parent = notifBg
        notifContent.BackgroundTransparency = 1
        notifContent.Size = UDim2.new(1, 0, 1, 0)
        
        local contentPadding = Instance.new("UIPadding")
        contentPadding.Parent = notifContent
        contentPadding.PaddingBottom = UDim.new(0, 5)
        contentPadding.PaddingLeft = UDim.new(0, 5)
        contentPadding.PaddingRight = UDim.new(0, 5)
        contentPadding.PaddingTop = UDim.new(0, 5)
        
        local contentLayout = Instance.new("UIListLayout")
        contentLayout.Parent = notifContent
        contentLayout.Padding = UDim.new(0, 3)
        
        -- Title
        local notifTitleLabel = Instance.new("TextLabel")
        notifTitleLabel.Name = "Title"
        notifTitleLabel.Parent = notifContent
        notifTitleLabel.AutomaticSize = Enum.AutomaticSize.Y
        notifTitleLabel.BackgroundTransparency = 1
        notifTitleLabel.Size = UDim2.new(1, 0, 0, 0)
        notifTitleLabel.Font = Enum.Font.GothamBold
        notifTitleLabel.Text = notifTitle
        notifTitleLabel.TextColor3 = themes[currentTheme]['Text & Icon']
        notifTitleLabel.TextSize = 12
        notifTitleLabel.TextWrapped = true
        notifTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        notifTitleLabel.TextYAlignment = Enum.TextYAlignment.Top
        notifTitleLabel.RichText = true
        
        addToTheme('Text & Icon', notifTitleLabel)
        
        -- Divider (only if description exists)
        local divider = Instance.new("Frame")
        divider.Parent = notifContent
        divider.BackgroundColor3 = themes[currentTheme]['Text & Icon']
        divider.BackgroundTransparency = 0.9
        divider.LayoutOrder = 1
        divider.Size = UDim2.new(1, 0, 0, 1)
        divider.Visible = notifDesc ~= ""
        
        addToTheme('Text & Icon', divider)
        
        -- Description
        local notifDescLabel = Instance.new("TextLabel")
        notifDescLabel.Name = "Description"
        notifDescLabel.Parent = notifContent
        notifDescLabel.AutomaticSize = Enum.AutomaticSize.Y
        notifDescLabel.BackgroundTransparency = 1
        notifDescLabel.LayoutOrder = 2
        notifDescLabel.Size = UDim2.new(1, 0, 0, 0)
        notifDescLabel.Font = Enum.Font.GothamBold
        notifDescLabel.Text = notifDesc
        notifDescLabel.TextColor3 = themes[currentTheme]['Text & Icon']
        notifDescLabel.TextSize = 10
        notifDescLabel.TextTransparency = 0.5
        notifDescLabel.TextWrapped = true
        notifDescLabel.TextXAlignment = Enum.TextXAlignment.Left
        notifDescLabel.TextYAlignment = Enum.TextYAlignment.Top
        notifDescLabel.RichText = true
        notifDescLabel.Visible = notifDesc ~= ""
        
        addToTheme('Text & Icon', notifDescLabel)
        
        -- Size update function
        local function updateNotificationSize()
            task.defer(function()
                local newHeight = contentLayout.AbsoluteContentSize.Y + 28
                notifShadow.Size = UDim2.new(0, 180, 0, newHeight)
            end)
        end
        
        task.delay(0.1, updateNotificationSize)
        contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateNotificationSize)
        
        -- Animation
        notifBg.Size = UDim2.new(1, 0, 1, 0) - UDim2.fromOffset(5, 5)
        
        local showTween = createTween(notifShadow, TweenInfo.new(0.15, Enum.EasingStyle.Exponential), {
            Size = UDim2.new(0, 180, 0, 55)
        })
        showTween:Play()
        
        showTween.Completed:Wait()
        
        createTween(notifBg, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
            Size = UDim2.new(1, 0, 1, 0),
            GroupTransparency = 0.3
        }):Play()
        
        -- Timer
        task.spawn(function()
            for i = notifTime, 1, -1 do
                createTween(progressBar, TweenInfo.new(0.15, Enum.EasingStyle.Exponential), {
                    Size = UDim2.new(i / notifTime, 0, 0, 4)
                }):Play()
                task.wait(1)
            end
            
            -- Hide animation
            local hideTween = createTween(notifBg, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
                Size = UDim2.new(1, 0, 1, 0) - UDim2.fromOffset(5, 5),
                GroupTransparency = 1
            })
            hideTween:Play()
            
            hideTween.Completed:Connect(function()
                notifShadow.ImageTransparency = 1
                local shrinkTween = createTween(notifShadow, TweenInfo.new(0.15, Enum.EasingStyle.Exponential), {
                    Size = UDim2.new(0, 180, 0, 0)
                })
                shrinkTween:Play()
                
                shrinkTween.Completed:Connect(function()
                    notifShadow:Destroy()
                end)
            end)
        end)
    end
    
    function tabs:Dialog(dialogConfig)
        if shadow:FindFirstChild("Dialog") then
            return
        end
        
        local dialogTitle = dialogConfig.Title or "Dialog"
        local button1Config = dialogConfig.Button1 or {Title = "Confirm", Color = Color3.fromRGB(0, 188, 0), Callback = function() end}
        local button2Config = dialogConfig.Button2 or {Title = "Cancel", Color = Color3.fromRGB(226, 39, 6), Callback = function() end}
        
        -- Create dialog overlay
        local dialogOverlay = Instance.new("CanvasGroup")
        dialogOverlay.Name = "Dialog"
        dialogOverlay.Parent = shadow
        dialogOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        dialogOverlay.BackgroundTransparency = 0.3
        dialogOverlay.Size = UDim2.new(1, 0, 1, 0)
        dialogOverlay.GroupTransparency = 1
        
        local dialogCorner = Instance.new("UICorner")
        dialogCorner.CornerRadius = UDim.new(0, 17)
        dialogCorner.Parent = dialogOverlay
        
        -- Dialog content
        local dialogContent = Instance.new("Frame")
        dialogContent.Parent = dialogOverlay
        dialogContent.AnchorPoint = Vector2.new(0.5, 0.5)
        dialogContent.BackgroundTransparency = 1
        dialogContent.Position = UDim2.new(0.5, 0, 0.5, 0)
        dialogContent.Size = UDim2.new(0, 100, 0, 100)
        
        -- Title
        local dialogTitleLabel = Instance.new("TextLabel")
        dialogTitleLabel.Parent = dialogContent
        dialogTitleLabel.BackgroundTransparency = 1
        dialogTitleLabel.Size = UDim2.new(0, 200, 0, 30)
        dialogTitleLabel.Font = Enum.Font.GothamBold
        dialogTitleLabel.RichText = true
        dialogTitleLabel.Text = dialogTitle
        dialogTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        dialogTitleLabel.TextSize = 20
        
        local titleLayout = Instance.new("UIListLayout")
        titleLayout.Parent = dialogContent
        titleLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        titleLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        
        -- Buttons container
        local buttonsContainer = Instance.new("Frame")
        buttonsContainer.Parent = dialogContent
        buttonsContainer.BackgroundTransparency = 1
        buttonsContainer.LayoutOrder = 1
        buttonsContainer.Size = UDim2.new(0, 100, 0, 50)
        
        local buttonsLayout = Instance.new("UIListLayout")
        buttonsLayout.Parent = buttonsContainer
        buttonsLayout.FillDirection = Enum.FillDirection.Horizontal
        buttonsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        buttonsLayout.Padding = UDim.new(0, 10)
        buttonsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        
        -- Button 1
        local button1 = Instance.new("Frame")
        button1.Name = "Button1"
        button1.Parent = buttonsContainer
        button1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        button1.Size = UDim2.new(0, 130, 0, 40)
        
        local button1Corner = Instance.new("UICorner")
        button1Corner.CornerRadius = UDim.new(1, 0)
        button1Corner.Parent = button1
        
        local button1Gradient = Instance.new("UIGradient")
        button1Gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(124, 124, 124))
        }
        button1Gradient.Parent = button1
        
        local button1Stroke = Instance.new("UIStroke")
        button1Stroke.Color = Color3.fromRGB(255, 255, 255)
        button1Stroke.Thickness = 2
        button1Stroke.Parent = button1
        
        local button1StrokeGradient = Instance.new("UIGradient")
        button1StrokeGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(124, 124, 124))
        }
        button1StrokeGradient.Rotation = 180
        button1StrokeGradient.Parent = button1Stroke
        
        local button1Text = Instance.new("TextLabel")
        button1Text.Parent = button1
        button1Text.BackgroundTransparency = 1
        button1Text.Size = UDim2.new(1, 0, 1, 0)
        button1Text.Font = Enum.Font.GothamBold
        button1Text.Text = button1Config.Title
        button1Text.TextColor3 = button1Config.Color
        button1Text.TextSize = 16
        
        local button1TextStroke = Instance.new("UIStroke")
        button1TextStroke.Thickness = 1
        button1TextStroke.Transparency = 0.95
        button1TextStroke.Parent = button1Text
        
        -- Button 2
        local button2 = Instance.new("Frame")
        button2.Name = "Button2"
        button2.Parent = buttonsContainer
        button2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        button2.Size = UDim2.new(0, 130, 0, 40)
        
        local button2Corner = Instance.new("UICorner")
        button2Corner.CornerRadius = UDim.new(1, 0)
        button2Corner.Parent = button2
        
        local button2Gradient = Instance.new("UIGradient")
        button2Gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(124, 124, 124))
        }
        button2Gradient.Parent = button2
        
        local button2Stroke = Instance.new("UIStroke")
        button2Stroke.Color = Color3.fromRGB(255, 255, 255)
        button2Stroke.Thickness = 2
        button2Stroke.Parent = button2
        
        local button2StrokeGradient = Instance.new("UIGradient")
        button2StrokeGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(124, 124, 124))
        }
        button2StrokeGradient.Rotation = 180
        button2StrokeGradient.Parent = button2Stroke
        
        local button2Text = Instance.new("TextLabel")
        button2Text.Parent = button2
        button2Text.BackgroundTransparency = 1
        button2Text.Size = UDim2.new(1, 0, 1, 0)
        button2Text.Font = Enum.Font.GothamBold
        button2Text.Text = button2Config.Title
        button2Text.TextColor3 = button2Config.Color
        button2Text.TextSize = 16
        
        local button2TextStroke = Instance.new("UIStroke")
        button2TextStroke.Thickness = 1
        button2TextStroke.Transparency = 0.95
        button2TextStroke.Parent = button2Text
        
        -- Show dialog
        createTween(dialogOverlay, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
            GroupTransparency = 0
        }):Play()
        
        -- Button click handlers
        local button1Click = createClickButton(button1)
        local button2Click = createClickButton(button2)
        
        button1Click.MouseButton1Click:Connect(function()
            pcall(button1Config.Callback)
            
            createTween(button1Text, TweenInfo.new(0.15, Enum.EasingStyle.Back), {
                TextSize = button1Text.TextSize - 2
            }):Play()
            
            task.delay(0.06, function()
                createTween(button1Text, TweenInfo.new(0.15, Enum.EasingStyle.Back), {
                    TextSize = 16
                }):Play()
            end)
            
            local hideTween = createTween(dialogOverlay, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
                GroupTransparency = 1
            })
            hideTween:Play()
            
            hideTween.Completed:Wait()
            dialogOverlay:Destroy()
        end)
        
        button2Click.MouseButton1Click:Connect(function()
            pcall(button2Config.Callback)
            
            createTween(button2Text, TweenInfo.new(0.15, Enum.EasingStyle.Back), {
                TextSize = button2Text.TextSize - 2
            }):Play()
            
            task.delay(0.06, function()
                createTween(button2Text, TweenInfo.new(0.15, Enum.EasingStyle.Back), {
                    TextSize = 16
                }):Play()
            end)
            
            local hideTween = createTween(dialogOverlay, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
                GroupTransparency = 1
            })
            hideTween:Play()
            
            hideTween.Completed:Wait()
            dialogOverlay:Destroy()
        end)
    end
    
    -- Apply initial theme
    Library:setTheme(currentTheme)
    
    return tabs
end

return Library
