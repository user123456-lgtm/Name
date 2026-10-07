	-- OCEANA GUI + DARK ADMIN / TESTING UTILITY
	--
	-- Place in:
	-- StarterPlayer > StarterPlayerScripts
	--
	-- ACCESS KEY:
	-- Carson19235 / Mzino
	--
	-- RIGHT SHIFT:
	-- Show / Hide dashboard
	--
	-- MERGED:
	-- • Original Carson's functions
	-- • Original Player ESP
	-- • Inventory Viewer
	-- • Player Spectate
	--============================================================
-- Script 12 functionality is integrated into this OCEANA GUI build.
-- The 1-Tap system remains intentionally removed.
--============================================================

	Players = game:GetService("Players")
	ReplicatedStorage = game:GetService("ReplicatedStorage")

	--============================================================
	-- MAX MAP RENDER / STREAMING DISTANCE
	--============================================================
	pcall(function()
		workspace.StreamingTargetRadius = 1000000
	end)
	pcall(function()
		workspace.StreamingMinRadius = 1000000
	end)
	RunService = game:GetService("RunService")
	UserInputService = game:GetService("UserInputService")
	CollectionService = game:GetService("CollectionService")
	ProximityPromptService = game:GetService("ProximityPromptService")
	TweenService = game:GetService("TweenService")

	LocalPlayer = Players.LocalPlayer
	PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

	--============================================================
	-- GUI STARTUP WATCHDOG
	--============================================================
	-- Creates a recovery panel if an earlier runtime error prevents
	-- the main OCEANA interface from being constructed.
	task.spawn(function()
		task.wait(3)
		if PlayerGui:FindFirstChild("OCEANA Script") then
			return
		end

		local recovery = Instance.new("ScreenGui")
		recovery.Name = "OCEANA Startup Recovery"
		recovery.ResetOnSpawn = false
		recovery.IgnoreGuiInset = true
		recovery.DisplayOrder = 9999
		recovery.Parent = PlayerGui

		local frame = Instance.new("Frame")
		frame.Size = UDim2.fromOffset(420, 190)
		frame.Position = UDim2.new(0.5, -210, 0.5, -95)
		frame.BackgroundColor3 = Color3.fromRGB(7, 10, 18)
		frame.Parent = recovery

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 16)
		corner.Parent = frame

		local stroke = Instance.new("UIStroke")
		stroke.Color = Color3.fromRGB(70, 150, 255)
		stroke.Thickness = 2
		stroke.Parent = frame

		local title = Instance.new("TextLabel")
		title.BackgroundTransparency = 1
		title.Size = UDim2.new(1, -30, 0, 35)
		title.Position = UDim2.fromOffset(15, 18)
		title.Text = "OCEANA STARTUP ERROR"
		title.TextColor3 = Color3.fromRGB(245, 247, 255)
		title.Font = Enum.Font.GothamBold
		title.TextSize = 18
		title.Parent = frame

		local info = Instance.new("TextLabel")
		info.BackgroundTransparency = 1
		info.Size = UDim2.new(1, -30, 0, 70)
		info.Position = UDim2.fromOffset(15, 58)
		info.Text = "The main interface failed before it could initialize.\nCheck the Roblox Developer Console (F9) for the OCEANA error."
		info.TextColor3 = Color3.fromRGB(160, 170, 190)
		info.Font = Enum.Font.Gotham
		info.TextSize = 12
		info.TextWrapped = true
		info.Parent = frame

		local close = Instance.new("TextButton")
		close.Size = UDim2.fromOffset(130, 34)
		close.Position = UDim2.new(0.5, -65, 1, -48)
		close.BackgroundColor3 = Color3.fromRGB(70, 150, 255)
		close.Text = "CLOSE"
		close.TextColor3 = Color3.new(1,1,1)
		close.Font = Enum.Font.GothamBold
		close.TextSize = 12
		close.Parent = frame

		local cc = Instance.new("UICorner")
		cc.CornerRadius = UDim.new(0, 9)
		cc.Parent = close
		close.MouseButton1Click:Connect(function() recovery:Destroy() end)
	end)

	--============================================================
	-- CONFIG
	--============================================================

	Config = {
		ACCESS_KEYS = {
			["Carson19235"] = true,
			["AXZDADS1923"] = true,
			["SDAWRS8123"] = true,
			["pussy"] = true,
			["Mzino"] = true,
			["SOTV"] = true,
			["ILOVEMYDOG"] = true,
			["kcfrmdacv"] = true,
			["1234"] = true,
			["ndsuifhbviuohswbiuoh"] = true,
			["18200"] = true,
			["mossco764"] = true,
			["123456"] = true,
			["parrsky"] = true,
			["mordecaii13"] = true,
			["KW21745AN"] = true,
			["DSTAOT8421"] = true,
			["OCEANA-001-KEY"] = true,
			["OCEANA-002-KEY"] = true,
			["OCEANA-003-KEY"] = true,
			["OCEANA-004-KEY"] = true,
			["OCEANA-005-KEY"] = true,
			["OCEANA-006-KEY"] = true,
			["OCEANA-007-KEY"] = true,
			["OCEANA-008-KEY"] = true,
			["OCEANA-009-KEY"] = true,
			["OCEANA-010-KEY"] = true,
			["OCEANA-011-KEY"] = true,
			["OCEANA-012-KEY"] = true,
			["OCEANA-013-KEY"] = true,
			["OCEANA-014-KEY"] = true,
			["OCEANA-015-KEY"] = true,
			["OCEANA-016-KEY"] = true,
			["OCEANA-017-KEY"] = true,
			["OCEANA-018-KEY"] = true,
			["OCEANA-019-KEY"] = true,
			["OCEANA-020-KEY"] = true,
			["OCEANA-021-KEY"] = true,
			["OCEANA-022-KEY"] = true,
			["OCEANA-023-KEY"] = true,
			["OCEANA-024-KEY"] = true,
			["OCEANA-025-KEY"] = true,
			["OCEANA-026-KEY"] = true,
			["OCEANA-027-KEY"] = true,
			["OCEANA-028-KEY"] = true,
			["OCEANA-029-KEY"] = true,
			["OCEANA-030-KEY"] = true,
			["OCEANA-031-KEY"] = true,
			["OCEANA-032-KEY"] = true,
			["OCEANA-033-KEY"] = true,
			["OCEANA-034-KEY"] = true,
			["OCEANA-035-KEY"] = true,
			["OCEANA-036-KEY"] = true,
			["OCEANA-037-KEY"] = true,
			["OCEANA-038-KEY"] = true,
			["OCEANA-039-KEY"] = true,
			["OCEANA-040-KEY"] = true,
			["OCEANA-041-KEY"] = true,
			["OCEANA-042-KEY"] = true,
			["OCEANA-043-KEY"] = true,
			["OCEANA-044-KEY"] = true,
			["OCEANA-045-KEY"] = true,
			["OCEANA-046-KEY"] = true,
			["OCEANA-047-KEY"] = true,
			["OCEANA-048-KEY"] = true,
			["OCEANA-049-KEY"] = true,
			["OCEANA-050-KEY"] = true,
			["OCEANA-051-KEY"] = true,
			["OCEANA-052-KEY"] = true,
			["OCEANA-053-KEY"] = true,
			["OCEANA-054-KEY"] = true,
			["OCEANA-055-KEY"] = true,
			["OCEANA-056-KEY"] = true,
			["OCEANA-057-KEY"] = true,
			["OCEANA-058-KEY"] = true,
			["OCEANA-059-KEY"] = true,
			["OCEANA-060-KEY"] = true,
			["OCEANA-061-KEY"] = true,
			["OCEANA-062-KEY"] = true,
			["OCEANA-063-KEY"] = true,
			["OCEANA-064-KEY"] = true,
			["OCEANA-065-KEY"] = true,
			["OCEANA-066-KEY"] = true,
			["OCEANA-067-KEY"] = true,
			["OCEANA-068-KEY"] = true,
			["OCEANA-069-KEY"] = true,
			["OCEANA-070-KEY"] = true,
			["OCEANA-071-KEY"] = true,
			["OCEANA-072-KEY"] = true,
			["OCEANA-073-KEY"] = true,
			["OCEANA-074-KEY"] = true,
			["OCEANA-075-KEY"] = true,
			["OCEANA-076-KEY"] = true,
			["OCEANA-077-KEY"] = true,
			["OCEANA-078-KEY"] = true,
			["OCEANA-079-KEY"] = true,
			["OCEANA-080-KEY"] = true,
			["OCEANA-081-KEY"] = true,
			["OCEANA-082-KEY"] = true,
			["OCEANA-083-KEY"] = true,
			["OCEANA-084-KEY"] = true,
			["OCEANA-085-KEY"] = true,
			["OCEANA-086-KEY"] = true,
			["OCEANA-087-KEY"] = true,
			["OCEANA-088-KEY"] = true,
			["OCEANA-089-KEY"] = true,
			["OCEANA-090-KEY"] = true,
			["OCEANA-091-KEY"] = true,
			["OCEANA-092-KEY"] = true,
			["OCEANA-093-KEY"] = true,
			["OCEANA-094-KEY"] = true,
			["OCEANA-095-KEY"] = true,
			["OCEANA-096-KEY"] = true,
			["OCEANA-097-KEY"] = true,
			["OCEANA-098-KEY"] = true,
			["OCEANA-099-KEY"] = true,
			["OCEANA-100-KEY"] = true,
		},

		DEFAULT_WALK_SPEED = 16,
		WALK_SPEED = 32,
		WALK_SPEED_ENABLED = true,

		JUMP_POWER = 50,

		FLY_SPEED = 70,

		GRAB_RANGE = 30,

		AIM_STRENGTH = 100,
		AIM_FOV = 60,

		AIM_MIN = 10,
		AIM_MAX = 200,

		FOV_MIN = 10,
		FOV_MAX = 120,

		TEAM_CHECK = false,
		VISIBILITY_CHECK = true,

		INSTANT_PICKUP = false,

		AUTO_FARM = false,
		AUTO_FARM_DELAY = 1,

		DELIVERY_SPEED = 75,
		DELIVERY_TIMEOUT = 60,
	}

	-- One-account-per-key mapping used when this script is running client-only.
	-- Server authentication is still preferred when OCEANA_KeyAuth exists.
	CLIENT_KEY_OWNERS = {
		["ndsuifhbviuohswbiuoh"] = 1517326987,
		["18200"] = 1709678602,
		["Carson19235"] = 9185723837,
		["AXZDADS1923"] = 8336401677,
		["SDAWRS8123"] = 10910089999,
		["pussy"] = 11135058989,
		["Mzino"] = 10980967466,
		["SOTV"] = 7335573976,
		["ILOVEMYDOG"] = 11412462635,
	["kcfrmdacv"] = 5374860987,
	["1234"] = 3471832372,
		["mossco764"] = 10431395322,
		["123456"] = 10419666492,
		["parrsky"] = 7672217129,
		["mordecaii13"] = 5288323564,
		["KW21745AN"] = 437097363,
	}

	--============================================================
	-- STATE
	--============================================================

	Character = nil
	Humanoid = nil
	RootPart = nil

	Flying = false
	Noclip = false
	AutoGrab = false
	SkeletonESPEnabled = false
	NormalESPEnabled = false
	DistanceESPEnabled = false
	HealthESPEnabled = false
	AimAssist = false
	AimHolding = false
	InfiniteJumpEnabled = false

	CurrentTarget = nil
	AimTarget = nil
	SilentAimEnabled = false
	SharedWhitelist = {}

	function isWhitelistedTarget(player)
		if not player then
			return false
		end

		local userId = player.UserId
		local username = string.lower(player.Name or "")
		local displayName = string.lower(player.DisplayName or "")

		return SharedWhitelist[userId] == true
			or SharedWhitelist[username] == true
			or SharedWhitelist[displayName] == true
	end

	FlyBV = nil
	FlyBG = nil

	MenuVisible = true
	Minimized = false

	ESPObjects = {}


	CurrentBike = nil
	UsedBikes = {}

	AutoFarmRunning = false

	SOURCE_A_POSITION = Vector3.new(0, 0, 0)
	DELIVERY_ZONE_POSITION = nil

	--============================================================
	-- GUI REFERENCES
	--============================================================

	GUI = nil
	MainFrame = nil
	MainContent = nil
	Sidebar = nil

	KeyFrame = nil
	KeyBox = nil
	KeyStatus = nil

	StatusText = nil
	BikeText = nil
	AutoFarmButton = nil

	Pages = {}
	sidebarButtons = {}

	--============================================================
	-- CARSON COLORS
	--============================================================

	BG = Color3.fromRGB(4, 6, 11)
	PANEL = Color3.fromRGB(8, 12, 21)
	PANEL2 = Color3.fromRGB(13, 19, 32)
	PANEL3 = Color3.fromRGB(21, 32, 52)

	WHITE = Color3.fromRGB(245, 247, 255)
	MUTED = Color3.fromRGB(145, 151, 170)

	BLUE = Color3.fromRGB(70, 150, 255)
	BLUE2 = Color3.fromRGB(130, 195, 255)

	GREEN = Color3.fromRGB(75, 230, 135)
	RED = Color3.fromRGB(255, 75, 95)

	BORDER = Color3.fromRGB(46, 67, 98)

	--============================================================
	-- CHARACTER
	--============================================================

	function applyWalkSpeed()
		if not Humanoid or not Humanoid.Parent then
			return
		end

		if Config.WALK_SPEED_ENABLED then
			Humanoid.WalkSpeed = Config.WALK_SPEED
		else
			Humanoid.WalkSpeed = Config.DEFAULT_WALK_SPEED
		end
	end

	function applyJumpPower()
		if not Humanoid or not Humanoid.Parent then
			return
		end

		Humanoid.UseJumpPower = true
		Humanoid.JumpPower = Config.JUMP_POWER
	end

	function setupCharacter(character)
		Character = character

		Humanoid = character:WaitForChild("Humanoid", 10)
		RootPart = character:WaitForChild("HumanoidRootPart", 10)

		Flying = false

		-- Re-apply Walk Speed whenever a new character loads.
		if Humanoid and Config.WALK_SPEED_ENABLED then
			Humanoid.WalkSpeed = Config.WALK_SPEED
		end
	end

	if LocalPlayer.Character then
		task.spawn(function()
			setupCharacter(LocalPlayer.Character)
		end)
	end

	LocalPlayer.CharacterAdded:Connect(function(character)
		if FlyBV then
			FlyBV:Destroy()
			FlyBV = nil
		end

		if FlyBG then
			FlyBG:Destroy()
			FlyBG = nil
		end

		task.wait(0.5)

		setupCharacter(character)
	end)

	--============================================================
	-- INFINITE JUMP
	--============================================================

	UserInputService.JumpRequest:Connect(function()
		if not InfiniteJumpEnabled then
			return
		end

		if Humanoid and Humanoid.Parent then
			Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)

	--============================================================
	-- PERSISTENT WALK SPEED
	--============================================================

	-- Keep the selected Walk Speed active even if the game changes
	-- Humanoid.WalkSpeed during interactions. Turning the Walk Speed
	-- toggle OFF stops this enforcement.
	RunService.Heartbeat:Connect(function()
		if not Config.WALK_SPEED_ENABLED then
			return
		end

		if not Humanoid or not Humanoid.Parent then
			return
		end

		if Humanoid.WalkSpeed ~= Config.WALK_SPEED then
			Humanoid.WalkSpeed = Config.WALK_SPEED
		end
	end)

	--============================================================
	-- GUI HELPERS
	--============================================================

	function create(className, properties, parent)
		local object = Instance.new(className)

		for property, value in pairs(properties or {}) do
			object[property] = value
		end

		object.Parent = parent

		return object
	end

	function corner(object, radius)
		local c = Instance.new("UICorner")
		c.CornerRadius = UDim.new(0, radius or 8)
		c.Parent = object
		return c
	end

	function stroke(object, color, thickness, transparency)
		local s = Instance.new("UIStroke")
		s.Color = color or BORDER
		s.Thickness = thickness or 1
		s.Transparency = transparency or 0.35
		s.Parent = object
		return s
	end

	function label(parent, text, size, position, fontSize)
		return create("TextLabel", {
			BackgroundTransparency = 1,
			Text = text,
			TextColor3 = WHITE,
			TextSize = fontSize or 14,
			Font = Enum.Font.Gotham,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			Size = size,
			Position = position,
		}, parent)
	end

	function makeDraggable(frame, handle)
		local dragging = false
		local dragStart
		local startPosition

		handle.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return
			end

			dragging = true
			dragStart = input.Position
			startPosition = frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end)

		UserInputService.InputChanged:Connect(function(input)
			if not dragging then
				return
			end

			if input.UserInputType ~= Enum.UserInputType.MouseMovement then
				return
			end

			local delta = input.Position - dragStart

			frame.Position = UDim2.new(
				startPosition.X.Scale,
				startPosition.X.Offset + delta.X,
				startPosition.Y.Scale,
				startPosition.Y.Offset + delta.Y
			)
		end)
	end

	function button(parent, text, position, size)
		local b = create("TextButton", {
			BackgroundColor3 = PANEL2,
			BackgroundTransparency = 0.06,
			Text = text,
			TextColor3 = WHITE,
			TextSize = 13,
			Font = Enum.Font.GothamMedium,
			AutoButtonColor = false,
			Size = size,
			Position = position,
		}, parent)

		corner(b, 9)
		stroke(b, BORDER, 1, 0.3)

		local accent = create("Frame", {
			BackgroundColor3 = BLUE,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(3, 18),
			Position = UDim2.fromOffset(0, 11),
		}, b)

		corner(accent, 3)

		b.MouseEnter:Connect(function()
			TweenService:Create(
				b,
				TweenInfo.new(0.15, Enum.EasingStyle.Quint),
				{
					BackgroundColor3 = PANEL3,
					TextColor3 = BLUE2
				}
			):Play()

			TweenService:Create(
				accent,
				TweenInfo.new(0.15),
				{
					BackgroundTransparency = 0
				}
			):Play()
		end)

		b.MouseLeave:Connect(function()
			TweenService:Create(
				b,
				TweenInfo.new(0.15, Enum.EasingStyle.Quint),
				{
					BackgroundColor3 = PANEL2,
					TextColor3 = WHITE
				}
			):Play()

			TweenService:Create(
				accent,
				TweenInfo.new(0.15),
				{
					BackgroundTransparency = 1
				}
			):Play()
		end)

		return b
	end

	--============================================================
	-- SCREEN GUI
	--============================================================

	oldGui = PlayerGui:FindFirstChild("OCEANA Script")

	if oldGui then
		oldGui:Destroy()
	end

	GUI = create("ScreenGui", {
		Name = "OCEANA Script",
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = 50,
	}, PlayerGui)
	GUI.Enabled = true
	GUI.ResetOnSpawn = false
	GUI.IgnoreGuiInset = true

	--============================================================
	-- KEY SCREEN
	--============================================================

	KeyGlow = create("Frame", {
		Name = "KeyGlow",
		BackgroundColor3 = BLUE,
		BackgroundTransparency = 0.94,
		Size = UDim2.fromOffset(480, 385),
		Position = UDim2.new(0.5, -240, 0.5, -192),
		ZIndex = 1,
	}, GUI)

	corner(KeyGlow, 24)

	KeyFrame = create("Frame", {
		Name = "KeyFrame",
		BackgroundColor3 = BG,
		Size = UDim2.fromOffset(450, 355),
		Position = UDim2.new(0.5, -225, 0.5, -177),
		ZIndex = 5,
	}, GUI)

	corner(KeyFrame, 18)
	stroke(KeyFrame, BLUE, 1, 0.35)

	KeyAccent = create("Frame", {
		BackgroundColor3 = BLUE,
		Size = UDim2.new(1, -28, 0, 3),
		Position = UDim2.fromOffset(14, 0),
		ZIndex = 8,
	}, KeyFrame)

	corner(KeyAccent, 3)

	KeyLogo = create("Frame", {
		BackgroundColor3 = BLUE,
		Size = UDim2.fromOffset(48, 48),
		Position = UDim2.fromOffset(25, 26),
		ZIndex = 8,
	}, KeyFrame)

	corner(KeyLogo, 13)

	KeyLogoText = label(
		KeyLogo,
		"C",
		UDim2.fromScale(1, 1),
		UDim2.fromOffset(0, 0),
		23
	)

	KeyLogoText.TextXAlignment = Enum.TextXAlignment.Center
	KeyLogoText.Font = Enum.Font.GothamBlack

	KeyTitle = label(
		KeyFrame,
		"OCEANA",
		UDim2.new(1, -100, 0, 26),
		UDim2.fromOffset(87, 24),
		20
	)

	KeyTitle.Font = Enum.Font.GothamBlack

	KeySubtitle = label(
		KeyFrame,
		"SECURE ACCESS",
		UDim2.new(1, -100, 0, 18),
		UDim2.fromOffset(88, 48),
		10
	)

	KeySubtitle.TextColor3 = BLUE2
	KeySubtitle.Font = Enum.Font.GothamBold

	KeyInfo = label(
		KeyFrame,
		"Enter your access key to continue.",
		UDim2.new(1, -50, 0, 22),
		UDim2.fromOffset(25, 82),
		12
	)

	KeyInfo.TextColor3 = MUTED

	KeyInfo2 = label(
		KeyFrame,
		"Authentication is required before opening the dashboard.",
		UDim2.new(1, -50, 0, 18),
		UDim2.fromOffset(25, 103),
		10
	)

	KeyInfo2.TextColor3 = MUTED

	KeyBox = create("TextBox", {
		Name = "KeyBox",
		BackgroundColor3 = PANEL,
		TextColor3 = WHITE,
		PlaceholderText = "Enter access key...",
		PlaceholderColor3 = MUTED,
		Text = "",
		TextSize = 14,
		Font = Enum.Font.GothamMedium,
		ClearTextOnFocus = false,
		Size = UDim2.new(1, -50, 0, 46),
		Position = UDim2.fromOffset(25, 130),
		ZIndex = 8,
	}, KeyFrame)

	corner(KeyBox, 11)

	KeyBoxStroke = stroke(KeyBox, BORDER, 1, 0.15)

	KeyBox.Focused:Connect(function()
		TweenService:Create(
			KeyBoxStroke,
			TweenInfo.new(0.2),
			{
				Color = BLUE,
				Transparency = 0
			}
		):Play()

		TweenService:Create(
			KeyBox,
			TweenInfo.new(0.2),
			{
				BackgroundColor3 = PANEL2
			}
		):Play()
	end)

	KeyBox.FocusLost:Connect(function()
		TweenService:Create(
			KeyBoxStroke,
			TweenInfo.new(0.2),
			{
				Color = BORDER,
				Transparency = 0.15
			}
		):Play()

		TweenService:Create(
			KeyBox,
			TweenInfo.new(0.2),
			{
				BackgroundColor3 = PANEL
			}
		):Play()
	end)

	UnlockButton = create("TextButton", {
		Name = "UnlockButton",
		BackgroundColor3 = BLUE,
		Text = "UNLOCK  →",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 13,
		Font = Enum.Font.GothamBold,
		AutoButtonColor = false,
		Size = UDim2.new(1, -50, 0, 43),
		Position = UDim2.fromOffset(25, 188),
		ZIndex = 8,
	}, KeyFrame)

	corner(UnlockButton, 10)

	UnlockButton.MouseEnter:Connect(function()
		TweenService:Create(
			UnlockButton,
			TweenInfo.new(0.15),
			{
				BackgroundColor3 = BLUE2
			}
		):Play()
	end)

	UnlockButton.MouseLeave:Connect(function()
		TweenService:Create(
			UnlockButton,
			TweenInfo.new(0.15),
			{
				BackgroundColor3 = BLUE
			}
		):Play()
	end)

	--============================================================
	-- DISCORD BUTTON
	--============================================================

	DiscordButton = create("TextButton", {
		Name = "DiscordButton",
		BackgroundColor3 = PANEL2,
		Text = "JOIN DISCORD  →",
		TextColor3 = WHITE,
		TextSize = 12,
		Font = Enum.Font.GothamBold,
		AutoButtonColor = false,
		Size = UDim2.new(1, -50, 0, 40),
		Position = UDim2.fromOffset(25, 238),
		ZIndex = 8,
	}, KeyFrame)

	corner(DiscordButton, 10)
	stroke(DiscordButton, BORDER, 1, 0.15)

	DiscordButton.MouseEnter:Connect(function()
		TweenService:Create(DiscordButton, TweenInfo.new(0.15), {
			BackgroundColor3 = BLUE,
		}):Play()
	end)

	DiscordButton.MouseLeave:Connect(function()
		TweenService:Create(DiscordButton, TweenInfo.new(0.15), {
			BackgroundColor3 = PANEL2,
		}):Play()
	end)

	--============================================================
	-- DISCORD INFORMATION POPUP
	--============================================================

	DiscordPopup = create("Frame", {
		Name = "DiscordPopup",
		BackgroundColor3 = BG,
		Size = UDim2.fromOffset(390, 225),
		Position = UDim2.new(0.5, -195, 0.5, -112),
		Visible = false,
		ZIndex = 30,
	}, GUI)

	corner(DiscordPopup, 16)
	stroke(DiscordPopup, BLUE, 1, 0.25)

	DiscordTitle = label(
		DiscordPopup,
		"OCEANA DISCORD",
		UDim2.new(1, -50, 0, 30),
		UDim2.fromOffset(25, 20),
		18
	)
	DiscordTitle.TextColor3 = WHITE
	DiscordTitle.Font = Enum.Font.GothamBlack
	DiscordTitle.ZIndex = 31

	DiscordInfo = label(
		DiscordPopup,
		"Join the OCEANA Discord for updates, announcements and community information.\n\nThank you for using OCEANA",
		UDim2.new(1, -50, 0, 85),
		UDim2.fromOffset(25, 55),
		11
	)
	DiscordInfo.TextColor3 = MUTED
	DiscordInfo.TextWrapped = true
	DiscordInfo.ZIndex = 31

	DiscordJoin = create("TextButton", {
		Name = "DiscordJoin",
		BackgroundColor3 = BLUE,
		Text = "OPEN DISCORD  →",
		TextColor3 = WHITE,
		TextSize = 12,
		Font = Enum.Font.GothamBold,
		AutoButtonColor = false,
		Size = UDim2.fromOffset(210, 38),
		Position = UDim2.fromOffset(25, 160),
		ZIndex = 31,
	}, DiscordPopup)

	corner(DiscordJoin, 9)

	DiscordClose = create("TextButton", {
		Name = "DiscordClose",
		BackgroundColor3 = PANEL2,
		Text = "CLOSE",
		TextColor3 = MUTED,
		TextSize = 11,
		Font = Enum.Font.GothamBold,
		AutoButtonColor = false,
		Size = UDim2.fromOffset(110, 38),
		Position = UDim2.fromOffset(250, 160),
		ZIndex = 31,
	}, DiscordPopup)

	corner(DiscordClose, 9)

	DiscordButton.MouseButton1Click:Connect(function()
		DiscordPopup.Visible = true
	end)

	DiscordClose.MouseButton1Click:Connect(function()
		DiscordPopup.Visible = false
	end)

	DiscordJoin.MouseButton1Click:Connect(function()
		local GuiService = game:GetService("GuiService")
		local discordUrl = "https://discord.com/invite/uGSxUwaPG"

		local success = pcall(function()
			GuiService:OpenBrowserWindow(discordUrl)
		end)

		if not success then
			DiscordInfo.Text = "Discord could not be opened automatically.\n\nUse this invite in your browser:\nhttps://discord.com/invite/uGSxUwaPG\n\nThank you for using OCEANA"
		end
	end)

	KeyStatus = label(
		KeyFrame,
		"",
		UDim2.new(1, -50, 0, 25),
		UDim2.fromOffset(25, 288),
		11
	)

	KeyStatus.Name = "KeyStatus"
	KeyStatus.TextXAlignment = Enum.TextXAlignment.Center
	KeyStatus.Font = Enum.Font.GothamMedium

	--============================================================
	-- MAIN WINDOW
	--============================================================

	MainFrame = create("Frame", {
		Name = "MainFrame",
		BackgroundColor3 = BG,
		Size = UDim2.fromOffset(940, 620),
		Position = UDim2.new(0.5, -470, 0.5, -310),
		Visible = false,
		ZIndex = 10,
	}, GUI)

	corner(MainFrame, 18)
	stroke(MainFrame, BLUE, 1, 0.25)

	MainGradient = Instance.new("UIGradient")
	MainGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 13, 24)),
		ColorSequenceKeypoint.new(0.55, Color3.fromRGB(5, 8, 15)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 17, 30)),
	})
	MainGradient.Rotation = 25
	MainGradient.Parent = MainFrame

	MainGlow = create("Frame", {
		Name = "AmbientGlow",
		BackgroundColor3 = BLUE,
		BackgroundTransparency = 0.94,
		Size = UDim2.new(1, -30, 0, 5),
		Position = UDim2.fromOffset(15, 65),
		ZIndex = 13,
	}, MainFrame)
	corner(MainGlow, 4)

	task.spawn(function()
		while GUI and GUI.Parent do
			local a = TweenService:Create(MainGlow, TweenInfo.new(1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.82})
			a:Play()
			a.Completed:Wait()
			if not (GUI and GUI.Parent) then break end
			local b = TweenService:Create(MainGlow, TweenInfo.new(1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.96})
			b:Play()
			b.Completed:Wait()
		end
	end)

	-- Mobile only: scale the existing GUI down so it fits phone screens.
	-- PC layout is completely unchanged.
	if UserInputService.TouchEnabled and not UserInputService.MouseEnabled then
		local MobileScale = Instance.new("UIScale")
		MobileScale.Name = "MobileGUIScale"
		MobileScale.Scale = 0.56
		MobileScale.Parent = MainFrame

		-- Center the GUI on mobile screens.
		MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		MainFrame.Position = UDim2.fromScale(0.5, 0.5)
	end

	--============================================================
	-- GUI RESIZE HANDLE
	-- Drag the bottom-right corner with the mouse to make the GUI
	-- smaller/larger. The whole GUI scales together, including
	-- the contents, so it stays usable on smaller screens.
	--============================================================
	local ResizeHandle = Instance.new("TextButton")
	ResizeHandle.Name = "ResizeHandle"
	ResizeHandle.Text = ""
	ResizeHandle.AutoButtonColor = false
	ResizeHandle.BackgroundTransparency = 1
	ResizeHandle.Size = UDim2.fromOffset(22, 22)
	ResizeHandle.AnchorPoint = Vector2.new(1, 1)
	ResizeHandle.Position = UDim2.fromScale(1, 1)
	ResizeHandle.ZIndex = 100
	ResizeHandle.Parent = MainFrame

	local ResizeLine1 = Instance.new("Frame")
	ResizeLine1.BorderSizePixel = 0
	ResizeLine1.BackgroundColor3 = BLUE
	ResizeLine1.BackgroundTransparency = 0.15
	ResizeLine1.Size = UDim2.fromOffset(10, 2)
	ResizeLine1.AnchorPoint = Vector2.new(1, 1)
	ResizeLine1.Position = UDim2.new(1, -2, 1, -5)
	ResizeLine1.Rotation = -45
	ResizeLine1.ZIndex = 101
	ResizeLine1.Parent = ResizeHandle

	local ResizeLine2 = ResizeLine1:Clone()
	ResizeLine2.Size = UDim2.fromOffset(7, 2)
	ResizeLine2.Position = UDim2.new(1, -2, 1, -10)
	ResizeLine2.Parent = ResizeHandle

	local resizing = false
	local resizeStart
	local startSize
	local MIN_WIDTH, MIN_HEIGHT = 520, 360

	ResizeHandle.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
		resizing = true
		resizeStart = input.Position
		startSize = MainFrame.Size
	end)

	UserInputService.InputChanged:Connect(function(input)
		if not resizing or input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
		local delta = input.Position - resizeStart
		local newW = math.max(MIN_WIDTH, startSize.X.Offset + delta.X)
		local newH = math.max(MIN_HEIGHT, startSize.Y.Offset + delta.Y)
		MainFrame.Size = UDim2.fromOffset(newW, newH)
		MainFrame.Position = UDim2.new(0.5, -newW / 2, 0.5, -newH / 2)
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			resizing = false
		end
	end)

	--============================================================
	-- TOP BAR
	--============================================================

	TopBar = create("Frame", {
		Name = "TopBar",
		BackgroundColor3 = PANEL,
		Size = UDim2.new(1, 0, 0, 66),
		ZIndex = 12,
	}, MainFrame)

	corner(TopBar, 18)

	TopAccent = create("Frame", {
		BackgroundColor3 = BLUE,
		Size = UDim2.new(1, -28, 0, 3),
		Position = UDim2.fromOffset(14, 0),
		ZIndex = 15,
	}, TopBar)

	corner(TopAccent, 3)

	Logo = create("Frame", {
		BackgroundColor3 = BLUE,
		Size = UDim2.fromOffset(38, 38),
		Position = UDim2.fromOffset(14, 15),
		ZIndex = 15,
	}, TopBar)

	corner(Logo, 10)

	LogoText = label(
		Logo,
		"C",
		UDim2.fromScale(1, 1),
		UDim2.fromOffset(0, 0),
		18
	)

	LogoText.TextXAlignment = Enum.TextXAlignment.Center
	LogoText.Font = Enum.Font.GothamBlack

	Title = label(
		TopBar,
		"OCEANA SCRIPT",
		UDim2.new(1, -180, 0, 24),
		UDim2.fromOffset(64, 10),
		16
	)

	Title.Font = Enum.Font.GothamBlack

	SubTitle = label(
		TopBar,
		"OCEANA  •  NEXT-GEN UTILITY",
		UDim2.new(1, -180, 0, 17),
		UDim2.fromOffset(65, 34),
		9
	)

	SubTitle.TextColor3 = BLUE2
	SubTitle.Font = Enum.Font.GothamBold

	StatusPill = create("Frame", {
		Name = "StatusPill",
		BackgroundColor3 = Color3.fromRGB(8, 22, 34),
		BackgroundTransparency = 0.05,
		Size = UDim2.fromOffset(104, 26),
		Position = UDim2.new(1, -188, 0, 18),
		ZIndex = 16,
	}, TopBar)

	corner(StatusPill, 13)
	stroke(StatusPill, BLUE, 1, 0.35)

	StatusDot = create("Frame", {
		Name = "StatusDot",
		BackgroundColor3 = Color3.fromRGB(80, 220, 140),
		Size = UDim2.fromOffset(7, 7),
		Position = UDim2.fromOffset(11, 10),
		ZIndex = 17,
	}, StatusPill)

	corner(StatusDot, 7)

	StatusLabel = label(
		StatusPill,
		"ONLINE  •  READY",
		UDim2.new(1, -27, 1, 0),
		UDim2.fromOffset(24, 0),
		8
	)
	StatusLabel.TextColor3 = Color3.fromRGB(150, 220, 255)
	StatusLabel.Font = Enum.Font.GothamBold
	StatusLabel.TextYAlignment = Enum.TextYAlignment.Center

	task.spawn(function()
		while GUI and GUI.Parent and StatusDot.Parent do
			local fade = TweenService:Create(StatusDot, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.65})
			fade:Play()
			fade.Completed:Wait()
			if not (GUI and GUI.Parent and StatusDot.Parent) then break end
			local glow = TweenService:Create(StatusDot, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0})
			glow:Play()
			glow.Completed:Wait()
		end
	end)

	Minimize = create("TextButton", {
		BackgroundColor3 = PANEL2,
		Text = "—",
		TextColor3 = MUTED,
		TextSize = 16,
		Font = Enum.Font.GothamBold,
		AutoButtonColor = false,
		Size = UDim2.fromOffset(32, 32),
		Position = UDim2.new(1, -77, 0, 17),
		ZIndex = 16,
	}, TopBar)

	corner(Minimize, 9)
	stroke(Minimize, BORDER, 1, 0.3)

	CloseButton = create("TextButton", {
		BackgroundColor3 = PANEL2,
		Text = "×",
		TextColor3 = RED,
		TextSize = 18,
		Font = Enum.Font.GothamBold,
		AutoButtonColor = false,
		Size = UDim2.fromOffset(32, 32),
		Position = UDim2.new(1, -39, 0, 17),
		ZIndex = 16,
	}, TopBar)

	corner(CloseButton, 9)
	stroke(CloseButton, BORDER, 1, 0.3)

	--============================================================
	-- SIDEBAR / CONTENT
	--============================================================

	Sidebar = create("Frame", {
		Name = "Sidebar",
		BackgroundColor3 = PANEL,
		Size = UDim2.fromOffset(208, 552),
		Position = UDim2.fromOffset(0, 66),
		ZIndex = 12,
	}, MainFrame)

	corner(Sidebar, 13)
	stroke(Sidebar, BORDER, 1, 0.5)

	SidebarTitle = label(
		Sidebar,
		"NAVIGATION",
		UDim2.new(1, -28, 0, 25),
		UDim2.fromOffset(14, 15),
		10
	)

	SidebarTitle.TextColor3 = MUTED
	SidebarTitle.Font = Enum.Font.GothamBold

	SidebarList = create("ScrollingFrame", {
		Name = "SidebarList",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, -8, 1, -52),
		Position = UDim2.fromOffset(4, 48),
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 3,
		ScrollBarImageColor3 = BLUE,
		ScrollBarImageTransparency = 0.2,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		VerticalScrollBarInset = Enum.ScrollBarInset.None,
		ZIndex = 15,
	}, Sidebar)

	create("UIPadding", {
		PaddingLeft = UDim.new(0, 6),
		PaddingRight = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 8),
	}, SidebarList)

	create("UIListLayout", {
		Padding = UDim.new(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}, SidebarList)

	MainContent = create("Frame", {
		Name = "MainContent",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -230, 1, -88),
		Position = UDim2.fromOffset(222, 78),
		ZIndex = 12,
	}, MainFrame)

	--============================================================
	-- PAGES
	--============================================================

	function addVisualTabBackground(page, variant)
		-- Procedural animated OCEANA background. It stays behind every control,
		-- so buttons, sliders and pill switches remain crisp and readable.
		local bg = create("Frame", {
			Name = "VisualBackground",
			BackgroundColor3 = Color3.fromRGB(3, 10, 24),
			BackgroundTransparency = 0.08,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0, 0),
			ZIndex = 11,
		}, MainContent)
		corner(bg, 16)

		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(3, 12, 30)),
			ColorSequenceKeypoint.new(0.45, Color3.fromRGB(5, 23, 55)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(2, 8, 22)),
		})
		gradient.Rotation = 18
		gradient.Parent = bg

		local glow = create("Frame", {
			Name = "MovingGlow",
			BackgroundColor3 = BLUE,
			BackgroundTransparency = 0.90,
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(280, 280),
			Position = UDim2.new(-0.12, 0, 0.08, 0),
			ZIndex = 2,
		}, bg)
		corner(glow, 140)

		local glow2 = create("Frame", {
			Name = "MovingGlow2",
			BackgroundColor3 = BLUE2,
			BackgroundTransparency = 0.94,
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(220, 220),
			Position = UDim2.new(0.70, 0, 0.52, 0),
			ZIndex = 2,
		}, bg)
		corner(glow2, 110)

		-- Distant skyline silhouette.
		local skyline = create("Frame", {
			Name = "Skyline",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 105),
			Position = UDim2.new(0, 0, 1, -105),
			ZIndex = 2,
		}, bg)
		local heights = {42, 68, 35, 86, 55, 74, 48, 92, 58, 40, 78, 51, 70, 45, 88}
		for i, h in ipairs(heights) do
			local building = create("Frame", {
				BackgroundColor3 = Color3.fromRGB(4, 18, 42),
				BackgroundTransparency = 0.08,
				BorderSizePixel = 0,
				Size = UDim2.new(1 / #heights, -3, 0, h),
				Position = UDim2.new((i - 1) / #heights, 1, 1, -h),
				ZIndex = 2,
			}, skyline)
			corner(building, 3)
			for w = 1, 2 do
				local win = create("Frame", {
					BackgroundColor3 = BLUE2,
					BackgroundTransparency = 0.45,
					BorderSizePixel = 0,
					Size = UDim2.fromOffset(3, 3),
					Position = UDim2.new(0.25 + (w - 1) * 0.45, 0, 0.25 + ((i * 13 + w * 7) % 45) / 100, 0),
					ZIndex = 3,
				}, building)
				corner(win, 1)
			end
		end

		local moon = create("Frame", {
			Name = "Moon",
			BackgroundColor3 = Color3.fromRGB(115, 205, 255),
			BackgroundTransparency = 0.18,
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(44, 44),
			Position = UDim2.new(0.70, 0, 0.08, 0),
			ZIndex = 2,
		}, bg)
		corner(moon, 22)
		stroke(moon, BLUE, 1, 0.45)

		local waveHolder = create("Frame", {
			Name = "MovingWaves",
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 0, 90),
			Position = UDim2.new(0, 0, 1, -90),
			ZIndex = 4,
		}, bg)
		for i = 1, 7 do
			local wave = create("Frame", {
				BackgroundColor3 = i % 2 == 0 and BLUE or BLUE2,
				BackgroundTransparency = 0.90,
				BorderSizePixel = 0,
				Size = UDim2.new(1.25, 0, 0, 2),
				Position = UDim2.new(-0.12, 0, 0, i * 12),
				Rotation = i % 2 == 0 and -2 or 2,
				ZIndex = 4,
			}, waveHolder)
			corner(wave, 2)
			local from = wave.Position
			local to = UDim2.new(0.04, 0, from.Y.Scale, from.Y.Offset)
			task.spawn(function()
				while wave.Parent do
					local a = TweenService:Create(wave, TweenInfo.new(3.2 + i * 0.22, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Position = to})
					a:Play(); a.Completed:Wait()
					if not wave.Parent then break end
					local b = TweenService:Create(wave, TweenInfo.new(3.2 + i * 0.22, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Position = from})
					b:Play(); b.Completed:Wait()
				end
			end)
		end

		-- Slow parallax movement makes each page feel alive.
		task.spawn(function()
			local t = 0
			while page.Parent do
				t = t + 0.018
				glow.Position = UDim2.new(-0.12 + math.sin(t) * 0.16, 0, 0.08 + math.cos(t * 0.7) * 0.08, 0)
				glow2.Position = UDim2.new(0.70 + math.cos(t * 0.8) * 0.12, 0, 0.52 + math.sin(t * 0.65) * 0.10, 0)
				gradient.Rotation = 18 + math.sin(t * 0.35) * 16
				task.wait()
			end
		end)

		return bg
	end

	function createPage(name)
		local page = create("ScrollingFrame", {
			Name = name,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(),
			ScrollBarThickness = 3,
			ScrollBarImageColor3 = BLUE,
			ScrollBarImageTransparency = 0.25,
			Visible = false,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ZIndex = 14,
		}, MainContent)

		create("UIPadding", {
			PaddingRight = UDim.new(0, 8),
			PaddingBottom = UDim.new(0, 10),
		}, page)

		create("UIListLayout", {
			Padding = UDim.new(0, 9),
			SortOrder = Enum.SortOrder.LayoutOrder,
		}, page)

		Pages[name] = page

		return page
	end

	function pageTitle(page, text)
		local title = label(
			page,
			text,
			UDim2.new(1, -10, 0, 38),
			UDim2.fromOffset(0, 0),
			21
		)

		title.Font = Enum.Font.GothamBlack
		title.ZIndex = 16
		title.LayoutOrder = 1

		return title
	end

	function pageButton(page, text, callback)
		local b = button(
			page,
			text,
			UDim2.fromOffset(0, 0),
			UDim2.new(1, -10, 0, 42)
		)

		b.ZIndex = 16
		b.LayoutOrder = #page:GetChildren() + 1

		-- ON/OFF controls use a compact pill switch. The ON color is
		-- the same blue used by the GUI outline.
		local toggleName, toggleState = string.match(text, "^(.-):%s*(%a+)$")
		if toggleName and (toggleState == "ON" or toggleState == "OFF") then
			b.TextTransparency = 1

			local toggleLabel = label(
				b,
				toggleName,
				UDim2.new(1, -70, 1, 0),
				UDim2.fromOffset(14, 0),
				13
			)
			toggleLabel.Font = Enum.Font.GothamMedium
			toggleLabel.ZIndex = 3

			local track = create("Frame", {
				Name = "ToggleTrack",
				BackgroundColor3 = BORDER,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -12, 0.5, 0),
				Size = UDim2.fromOffset(36, 20),
				ZIndex = 3,
			}, b)
			corner(track, 10)

			local knob = create("Frame", {
				Name = "ToggleKnob",
				BackgroundColor3 = WHITE,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(14, 14),
				ZIndex = 4,
			}, track)
			corner(knob, 7)

			local function refreshToggle()
				local state = string.match(b.Text, ":%s*(%a+)$")
				local enabled = state == "ON"
				toggleLabel.Text = toggleName
				track.BackgroundColor3 = enabled and BLUE or BORDER
				knob.Position = enabled
					and UDim2.new(1, -9, 0.5, 0)
					or UDim2.new(0, 9, 0.5, 0)
			end

			b:GetPropertyChangedSignal("Text"):Connect(refreshToggle)
			refreshToggle()
		end

		if callback then
			b.MouseButton1Click:Connect(callback)
		end

		return b
	end

	-- Reusable draggable slider for the Player page. Supports mouse and touch.
	function pageSlider(page, titleText, minValue, maxValue, initialValue, callback)
		local row = create("Frame", {
			Name = titleText:gsub("%W", "") .. "Slider",
			BackgroundColor3 = PANEL2,
			Size = UDim2.new(1, -10, 0, 64),
			LayoutOrder = #page:GetChildren() + 1,
		}, page)
		corner(row, 9)
		stroke(row, BORDER, 1, 0.3)

		local valueLabel = label(row, titleText .. ": " .. tostring(initialValue),
			UDim2.new(1, -20, 0, 23), UDim2.fromOffset(10, 5), 12)
		valueLabel.Font = Enum.Font.GothamMedium

		local track = create("TextButton", {
			Name = "Track", Text = "", AutoButtonColor = false,
			BackgroundColor3 = BORDER, BorderSizePixel = 0,
			Position = UDim2.new(0, 12, 0, 39), Size = UDim2.new(1, -24, 0, 8),
		}, row)
		corner(track, 5)
		local fill = create("Frame", {BackgroundColor3 = BLUE, BorderSizePixel = 0, Size = UDim2.new(0, 0, 1, 0)}, track)
		corner(fill, 5)
		local knob = create("Frame", {BackgroundColor3 = WHITE, BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.fromOffset(16, 16), ZIndex = 3}, track)
		corner(knob, 8)

		local value = math.clamp(initialValue, minValue, maxValue)
		local dragging = false
		local function setFromX(x)
			local width = math.max(track.AbsoluteSize.X, 1)
			local alpha = math.clamp((x - track.AbsolutePosition.X) / width, 0, 1)
			value = math.floor(minValue + (maxValue - minValue) * alpha + 0.5)
			fill.Size = UDim2.new(alpha, 0, 1, 0)
			knob.Position = UDim2.new(alpha, 0, 0.5, 0)
			valueLabel.Text = titleText .. ": " .. tostring(value)
			callback(value)
		end
		local function begin(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				setFromX(input.Position.X)
			end
		end
		track.InputBegan:Connect(begin)
		knob.InputBegan:Connect(begin)
		UserInputService.InputChanged:Connect(function(input)
			if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then setFromX(input.Position.X) end
		end)
		UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
		end)
		local alpha = (value - minValue) / (maxValue - minValue)
		fill.Size = UDim2.new(alpha, 0, 1, 0)
		knob.Position = UDim2.new(alpha, 0, 0.5, 0)
		return row
	end

	InfoPage = createPage("Information")
	PlayerPage = createPage("Player")
	TeleportPage = createPage("Teleport")
	CombatPage = createPage("Combat")
	VisualPage = createPage("Visuals")
	CarsPage = createPage("Cars")
	PlayersPage = createPage("Players")
	AutoFarmPage = createPage("Auto Farm")
	NittyAutoFarmPage = createPage("Nitty AUTO FARM")
	ChatPage = createPage("Chat")
	NameChangerPage = createPage("Name Changer")
	SettingsPage = createPage("Settings")

	-- One animated visual layer sits behind all tab pages.
	-- Keeping it outside the ScrollingFrames prevents it from entering
	-- their UIListLayouts and pushing all page controls off-screen.
	addVisualTabBackground(MainContent)

	pageTitle(InfoPage, "Information")
	pageTitle(PlayerPage, "Player")
	pageTitle(TeleportPage, "Teleport")
	pageTitle(CombatPage, "Combat")
	pageTitle(VisualPage, "Visuals")
	pageTitle(CarsPage, "Cars")
	pageTitle(PlayersPage, "Players")
	pageTitle(AutoFarmPage, "Auto Farm")
	pageTitle(NittyAutoFarmPage, "Nitty AUTO FARM")
	pageTitle(ChatPage, "Chat")
	pageTitle(NameChangerPage, "Name Changer")
	pageTitle(SettingsPage, "Settings")

	-- Keep all existing controls visibly above the animated artwork.
	for _, page in pairs(Pages) do
		for _, obj in ipairs(page:GetDescendants()) do
			if obj:IsA("GuiButton") or obj:IsA("TextLabel") or obj:IsA("TextBox") or obj:IsA("Frame") then
				if not (page:FindFirstChild("VisualBackground") and obj:IsDescendantOf(page.VisualBackground)) then
					obj.ZIndex = math.max(obj.ZIndex, 20)
				end
			end
		end
	end

	local SettingsInfo = label(
		SettingsPage,
		"Interface settings",
		UDim2.new(1, -10, 0, 28),
		UDim2.fromOffset(0, 0),
		11
	)
	SettingsInfo.TextColor3 = MUTED
	SettingsInfo.LayoutOrder = 2

	local StatusDisplayButton
	StatusDisplayButton = pageButton(SettingsPage, "Status Display: ON", function()
		local enabled = string.match(StatusDisplayButton.Text, ":%s*(%a+)$") == "ON"
		StatusDisplayButton.Text = "Status Display: " .. (enabled and "OFF" or "ON")
		if StatusPill then
			StatusPill.Visible = not enabled
		end
	end)
	StatusDisplayButton.LayoutOrder = 3

	--============================================================
	-- NAME CHANGER
	-- Changes the two visible name lines above your character locally.
	-- The first line is the Roblox display name; the second line is
	-- matched against the game's visible username/UserId text.
	--============================================================
	do
		local originalLabelText = {}
		local customDisplayName = ""
		local customSecondLine = ""

		local function getCharacter()
			return LocalPlayer.Character
		end

		local function isNameLineText(text)
			if typeof(text) ~= "string" or text == "" then
				return false
			end

			local trimmed = text:gsub("^%s+", ""):gsub("%s+$", "")
			return trimmed == LocalPlayer.Name
				or trimmed == LocalPlayer.DisplayName
				or trimmed == tostring(LocalPlayer.UserId)
				or trimmed == customDisplayName
				or trimmed == customSecondLine
				or originalLabelText[text] == true
		end

		local function applyNameChanger()
			local character = getCharacter()
			if not character then
				return
			end

			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid and customDisplayName ~= "" then
				pcall(function()
					humanoid.DisplayName = customDisplayName
				end)
			end

			if customSecondLine == "" and customDisplayName == "" then
				return
			end

			for _, obj in ipairs(character:GetDescendants()) do
				if obj:IsA("TextLabel") or obj:IsA("TextButton") then
					local text = obj.Text
					if typeof(text) == "string" and text ~= "" then
						local trimmed = text:gsub("^%s+", ""):gsub("%s+$", "")
						if trimmed == LocalPlayer.Name
							or trimmed == LocalPlayer.DisplayName
							or trimmed == tostring(LocalPlayer.UserId)
							or originalLabelText[obj] ~= nil then

							if originalLabelText[obj] == nil then
								originalLabelText[obj] = text
							end

							local original = originalLabelText[obj]
							if original == LocalPlayer.Name or original == LocalPlayer.DisplayName then
								if customDisplayName ~= "" then
									obj.Text = customDisplayName
								end
							elseif original == tostring(LocalPlayer.UserId) then
								if customSecondLine ~= "" then
									obj.Text = customSecondLine
								end
							end
						end
					end
				end
			end
		end

		local function resetNameChanger()
			customDisplayName = ""
			customSecondLine = ""

			local character = getCharacter()
			if character then
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				if humanoid then
					pcall(function()
						humanoid.DisplayName = LocalPlayer.DisplayName
					end)
				end
			end

			for obj, original in pairs(originalLabelText) do
				if obj and obj.Parent then
					obj.Text = original
				end
			end

			table.clear(originalLabelText)
		end

		local NameDisplayBox = create("TextBox", {
			Name = "NameDisplayBox",
			BackgroundColor3 = PANEL2,
			TextColor3 = WHITE,
			PlaceholderText = "New display name",
			PlaceholderColor3 = MUTED,
			Text = "",
			TextSize = 13,
			Font = Enum.Font.GothamMedium,
			ClearTextOnFocus = false,
			Size = UDim2.new(1, -10, 0, 42),
			Position = UDim2.fromOffset(0, 0),
		}, NameChangerPage)
		corner(NameDisplayBox, 9)
		stroke(NameDisplayBox, BORDER, 1, 0.3)
		NameDisplayBox.LayoutOrder = #NameChangerPage:GetChildren() + 1

		local NameSecondLineBox = create("TextBox", {
			Name = "NameSecondLineBox",
			BackgroundColor3 = PANEL2,
			TextColor3 = WHITE,
			PlaceholderText = "New username / ID line",
			PlaceholderColor3 = MUTED,
			Text = "",
			TextSize = 13,
			Font = Enum.Font.GothamMedium,
			ClearTextOnFocus = false,
			Size = UDim2.new(1, -10, 0, 42),
			Position = UDim2.fromOffset(0, 0),
		}, NameChangerPage)
		corner(NameSecondLineBox, 9)
		stroke(NameSecondLineBox, BORDER, 1, 0.3)
		NameSecondLineBox.LayoutOrder = #NameChangerPage:GetChildren() + 1

		pageButton(NameChangerPage, "Apply Name", function()
			customDisplayName = (NameDisplayBox.Text or ""):gsub("^%s+", ""):gsub("%s+$", "")
			customSecondLine = (NameSecondLineBox.Text or ""):gsub("^%s+", ""):gsub("%s+$", "")
			applyNameChanger()
		end)

		pageButton(NameChangerPage, "Reset Name", function()
			resetNameChanger()
			NameDisplayBox.Text = ""
			NameSecondLineBox.Text = ""
		end)

		label(
			NameChangerPage,
			"Changes are local to your client.",
			UDim2.new(1, -10, 0, 28),
			UDim2.fromOffset(0, 0),
			11
		).TextColor3 = MUTED

		LocalPlayer.CharacterAdded:Connect(function()
			task.wait(0.5)
			if customDisplayName ~= "" or customSecondLine ~= "" then
				applyNameChanger()
			end
		end)
	end

	--============================================================
	-- CHAT PAGE
	-- Added from Script 11.lua without creating a second GUI.
	--============================================================
	do
		local TextChatService = game:GetService("TextChatService")
		local running = false

		local ChatMessageBox = create("TextBox", {
			Name = "ChatMessageBox",
			BackgroundColor3 = PANEL2,
			TextColor3 = WHITE,
			PlaceholderColor3 = MUTED,
			PlaceholderText = "Message",
			Text = "/pay 25000",
			TextSize = 13,
			Font = Enum.Font.GothamMedium,
			ClearTextOnFocus = false,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, -10, 0, 42),
			LayoutOrder = 2,
		}, ChatPage)
		corner(ChatMessageBox, 9)
		stroke(ChatMessageBox, BORDER, 1, 0.3)

		local ChatIntervalBox = create("TextBox", {
			Name = "ChatIntervalBox",
			BackgroundColor3 = PANEL2,
			TextColor3 = WHITE,
			PlaceholderColor3 = MUTED,
			PlaceholderText = "Interval",
			Text = "0.1",
			TextSize = 13,
			Font = Enum.Font.GothamMedium,
			ClearTextOnFocus = false,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, -10, 0, 42),
			LayoutOrder = 3,
		}, ChatPage)
		corner(ChatIntervalBox, 9)
		stroke(ChatIntervalBox, BORDER, 1, 0.3)

		local ChatStatus = label(
			ChatPage,
			"Private repeat test: OFF",
			UDim2.new(1, -10, 0, 30),
			UDim2.fromOffset(0, 0),
			12
		)
		ChatStatus.TextColor3 = MUTED
		ChatStatus.LayoutOrder = 4

		local function sendMessage()
			local channels = TextChatService:FindFirstChild("TextChannels")
			local channel = channels and channels:FindFirstChild("RBXGeneral")

			if channel then
				channel:SendAsync(ChatMessageBox.Text)
			end
		end

		local ChatToggleButton
		ChatToggleButton = pageButton(
			ChatPage,
			"Chat Test: OFF",
			function()
				running = not running

				if running then
					ChatToggleButton.Text = "Chat Test: ON"
					ChatStatus.Text = "Private repeat test: ON"
					ChatStatus.TextColor3 = GREEN

					-- One real Roblox chat message.
					sendMessage()

					-- Private repeat test, matching Script 11.lua.
					task.spawn(function()
						while running do
							print("[PRIVATE TEST] " .. ChatMessageBox.Text)

							local delayTime = tonumber(ChatIntervalBox.Text) or 0.1
							delayTime = math.max(delayTime, 0.05)

							task.wait(delayTime)
						end
					end)
				else
					ChatToggleButton.Text = "Chat Test: OFF"
					ChatStatus.Text = "Private repeat test: OFF"
					ChatStatus.TextColor3 = MUTED
				end
			end
		)
		ChatToggleButton.LayoutOrder = 5
	end

	--============================================================
	-- INFORMATION
	--============================================================

	info = label(
		InfoPage,
		"Thank you for using OCEANA",
		UDim2.new(1, -10, 0, 220),
		UDim2.fromOffset(0, 0),
		14
	)

	info.TextWrapped = true
	info.LayoutOrder = 2

	--============================================================
	-- PLAYER PAGE
	--============================================================

	pageSlider(PlayerPage, "Walk Speed", 16, 32, Config.WALK_SPEED, function(value)
		Config.WALK_SPEED = value
		applyWalkSpeed()
	end)

	pageSlider(PlayerPage, "Jump Power", 50, 150, Config.JUMP_POWER, function(value)
		Config.JUMP_POWER = value
		applyJumpPower()
	end)

	pageSlider(PlayerPage, "Fly Speed", 30, 70, Config.FLY_SPEED, function(value)
		Config.FLY_SPEED = value
	end)

	WalkToggleButton = pageButton(
		PlayerPage,
		"Walk Speed: " .. (Config.WALK_SPEED_ENABLED and "ON" or "OFF"),
		function()
			Config.WALK_SPEED_ENABLED = not Config.WALK_SPEED_ENABLED

			WalkToggleButton.Text =
				"Walk Speed: " ..
				(Config.WALK_SPEED_ENABLED and "ON" or "OFF")

			applyWalkSpeed()
		end
	)

	InfiniteStaminaButton = pageButton(
		PlayerPage,
		"Infinite Stamina: OFF",
		function()
			local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
			local staminaValue = character:FindFirstChild("StaminaValue")
			if not staminaValue then
				return
			end

			local enabled = InfiniteStaminaButton.Text == "Infinite Stamina: ON"
			if enabled then
				staminaValue.Value = 100
				InfiniteStaminaButton.Text = "Infinite Stamina: OFF"
			else
				staminaValue.Value = math.huge
				InfiniteStaminaButton.Text = "Infinite Stamina: ON"
			end
		end
	)

	--============================================================
	-- FLY
	--============================================================

	function startFly()
		if Flying then
			return
		end

		if not RootPart or not Humanoid then
			return
		end

		Flying = true

		Humanoid.AutoRotate = false
		Humanoid.PlatformStand = true

		FlyBV = Instance.new("BodyVelocity")
		FlyBV.Name = "AdminFlyVelocity"
		FlyBV.MaxForce = Vector3.new(1e6, 1e6, 1e6)
		FlyBV.P = 25000
		FlyBV.Velocity = Vector3.zero
		FlyBV.Parent = RootPart

		FlyBG = Instance.new("BodyGyro")
		FlyBG.Name = "AdminFlyGyro"
		FlyBG.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
		FlyBG.P = 30000
		FlyBG.D = 1000
		FlyBG.CFrame = RootPart.CFrame
		FlyBG.Parent = RootPart
	end

	function stopFly()
		Flying = false

		if FlyBV then
			FlyBV:Destroy()
			FlyBV = nil
		end

		if FlyBG then
			FlyBG:Destroy()
			FlyBG = nil
		end

		if Humanoid then
			Humanoid.PlatformStand = false
			Humanoid.AutoRotate = true
		end

		if RootPart then
			RootPart.AssemblyLinearVelocity = Vector3.zero
			RootPart.AssemblyAngularVelocity = Vector3.zero
		end
	end

	FlyButton = pageButton(
		PlayerPage,
		"Fly: OFF",
		function()
			if Flying then
				stopFly()
			else
				startFly()
			end

			FlyButton.Text =
				"Fly: " .. (Flying and "ON" or "OFF")
			updateAutoFarmStateText(Config.AUTO_FARM, Flying, Noclip, 1, false, false)
		end
	)

	NoclipButton = pageButton(
		PlayerPage,
		"NoClip: OFF",
		function()
			Noclip = not Noclip

			NoclipButton.Text =
				"NoClip: " .. (Noclip and "ON" or "OFF")
			updateAutoFarmStateText(Config.AUTO_FARM, Flying, Noclip, 1, false, false)
		end
	)

	PickupButton = pageButton(
		PlayerPage,
		"Instant Pickup: OFF",
		function()
			Config.INSTANT_PICKUP =
				not Config.INSTANT_PICKUP

			PickupButton.Text =
				"Instant Pickup: " ..
				(Config.INSTANT_PICKUP and "ON" or "OFF")
		end
	)


	InfiniteJumpButton = pageButton(
		PlayerPage,
		"Infinite Jump: OFF",
		function()
			InfiniteJumpEnabled = not InfiniteJumpEnabled
			InfiniteJumpButton.Text = "Infinite Jump: " .. (InfiniteJumpEnabled and "ON" or "OFF")
			InfiniteJumpButton.TextColor3 = InfiniteJumpEnabled and GREEN or WHITE
		end
	)

	pageButton(
		PlayerPage,
		"Reset Character",
		function()
			if Humanoid then
				Humanoid.Health = 0
			end
		end
	)

	--============================================================
	-- TELEPORT
	--============================================================

	TeleportStatus = label(
		TeleportPage,
		"Status: Ready",
		UDim2.new(1, -10, 0, 30),
		UDim2.fromOffset(0, 0),
		13
	)
	TeleportStatus.TextColor3 = MUTED

	function teleportToCoordinates(position, labelText)
		local character = LocalPlayer.Character
		local root = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if not character or not root then
			TeleportStatus.Text = "Status: Character not ready"
			TeleportStatus.TextColor3 = RED
			return
		end

		local destination = CFrame.new(position)

		-- If the player is sitting on a bike/vehicle, move the VEHICLE model
		-- instead of only moving the character. This keeps the seat weld intact
		-- and prevents the bike from being left behind or thrown out of sync.
		local seat = humanoid and humanoid.SeatPart
		local vehicle = nil

		if seat and (seat:IsA("VehicleSeat") or seat:IsA("Seat")) then
			vehicle = seat:FindFirstAncestorOfClass("Model")
		end

		if vehicle and vehicle ~= character then
			vehicle:PivotTo(destination)

			-- Stop leftover vehicle physics immediately after the teleport.
			for _, obj in ipairs(vehicle:GetDescendants()) do
				if obj:IsA("BasePart") then
					obj.AssemblyLinearVelocity = Vector3.zero
					obj.AssemblyAngularVelocity = Vector3.zero
				end
			end
		else
			-- On foot: move the whole character directly.
			character:PivotTo(destination)
			root.AssemblyLinearVelocity = Vector3.zero
			root.AssemblyAngularVelocity = Vector3.zero
		end

		TeleportStatus.Text = "Status: Teleported to " .. labelText
		TeleportStatus.TextColor3 = GREEN
	end

	DOCKS_POSITION = Vector3.new(949, 41, -2367)
	HOUSE_TOP_FLOOR_POSITION = Vector3.new(271, 133, 2090)
	KNIFE_CRATE_POSITION = Vector3.new(1469, 3, -419)
	MAIN_POSITION = Vector3.new(-617, 3, -299)
	GROW_YARD_POSITION = Vector3.new(287, 71, 1622)
BANK_POSITION = Vector3.new(1617, 7, 1550)
JEWELLERY_POSITION = Vector3.new(414, 3, 2719)
BANK_JEWELLERY_DROPOFF_POSITION = Vector3.new(383, 3, 154)

	pageButton(TeleportPage, "Docks", function()
		teleportToCoordinates(DOCKS_POSITION, "Docks")
	end)

	pageButton(TeleportPage, "House - Top Floor", function()
		teleportToCoordinates(HOUSE_TOP_FLOOR_POSITION, "House - Top Floor")
	end)

	pageButton(TeleportPage, "Knife crate", function()
		teleportToCoordinates(KNIFE_CRATE_POSITION, "Knife crate")
	end)

	pageButton(TeleportPage, "Main", function()
		teleportToCoordinates(MAIN_POSITION, "Main")
	end)

	pageButton(TeleportPage, "Grow yard", function()
		teleportToCoordinates(GROW_YARD_POSITION, "Grow yard")
	end)

	pageButton(TeleportPage, "Bank", function()
		teleportToCoordinates(BANK_POSITION, "Bank")
	end)

	pageButton(TeleportPage, "Jewellery", function()
		teleportToCoordinates(JEWELLERY_POSITION, "Jewellery")
	end)

	pageButton(TeleportPage, "Bank/jewellery Drop off", function()
		teleportToCoordinates(BANK_JEWELLERY_DROPOFF_POSITION, "Bank/jewellery Drop off")
	end)

pageButton(TeleportPage, "Seed shop", function()
    teleportToCoordinates(Vector3.new(-355, 3, 955), "Seed shop")
end)

	TeleportInfo = label(
		TeleportPage,
		"Docks: 949, 41, -2367\nHouse - Top Floor: 271, 133, 2090\nKnife crate: 1469, 3, -419\nMain: -617, 3, -299\nGrow yard: 287, 71, 1622",
		UDim2.new(1, -10, 0, 60),
		UDim2.fromOffset(0, 0),
		12
	)
	TeleportInfo.TextWrapped = true
	TeleportInfo.TextColor3 = MUTED

	--============================================================
	-- COMBAT / AIM
	--============================================================

	-- EQUIP ALL KNIVES
	-- Added directly to the existing Combat tab.
	local EquipAllKnivesBusy = false

	local function equipAllKnives()
		local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")

		if not backpack then
			return 0
		end

		local found = 0

		-- Preserve the supplied script's behavior: equip every Tool
		-- currently in the Backpack.
		for _, item in ipairs(backpack:GetChildren()) do
			if item:IsA("Tool") then
				item.Parent = character
				found += 1
				task.wait(0.03)
			end
		end

		for _, item in ipairs(character:GetChildren()) do
			if item:IsA("Tool") then
				found += 1
			end
		end

		return found
	end

	EquipAllKnivesButton = pageButton(
		CombatPage,
		"EQUIP ALL KNIVES",
		function()
			if EquipAllKnivesBusy then
				return
			end

			EquipAllKnivesBusy = true
			EquipAllKnivesButton.Text = "EQUIPPING..."

			task.spawn(function()
				local found = equipAllKnives()

				task.wait(0.5)

				if EquipAllKnivesButton and EquipAllKnivesButton.Parent then
					if found == 0 then
						EquipAllKnivesButton.Text = "EQUIP ALL KNIVES"
					else
						EquipAllKnivesButton.Text = "EQUIP ALL KNIVES"
					end
					EquipAllKnivesBusy = false
				end
			end)
		end
	)


	TargetLabel = label(
		CombatPage,
		"Target: None",
		UDim2.new(1, -10, 0, 30),
		UDim2.fromOffset(0, 0),
		13
	)

	TargetLabel.LayoutOrder = 2

	AimButton = pageButton(
		CombatPage,
		"Aim Assist: OFF",
		function()
			AimAssist = not AimAssist

			AimButton.Text =
				"Aim Assist: " ..
				(AimAssist and "ON" or "OFF")
		end
	)

	pageButton(
		CombatPage,
		"Aim FOV: 60",
		function()
			Config.AIM_FOV += 10

			if Config.AIM_FOV > Config.FOV_MAX then
				Config.AIM_FOV = Config.FOV_MIN
			end

			for _, child in ipairs(CombatPage:GetChildren()) do
				if child:IsA("TextButton")
					and string.find(child.Text, "Aim FOV:", 1, true) then

					child.Text =
						"Aim FOV: " .. Config.AIM_FOV

					break
				end
			end
		end
	)

	pageButton(
		CombatPage,
		"Aim Strength: 100",
		function()
			Config.AIM_STRENGTH += 10

			if Config.AIM_STRENGTH > Config.AIM_MAX then
				Config.AIM_STRENGTH = Config.AIM_MIN
			end

			for _, child in ipairs(CombatPage:GetChildren()) do
				if child:IsA("TextButton")
					and string.find(child.Text, "Aim Strength:", 1, true) then

					child.Text =
						"Aim Strength: " .. Config.AIM_STRENGTH

					break
				end
			end
		end
	)

	pageButton(
		CombatPage,
		"Team Check: OFF",
		function()
			Config.TEAM_CHECK = not Config.TEAM_CHECK

			for _, child in ipairs(CombatPage:GetChildren()) do
				if child:IsA("TextButton")
					and string.find(child.Text, "Team Check:", 1, true) then

					child.Text =
						"Team Check: " ..
						(Config.TEAM_CHECK and "ON" or "OFF")

					break
				end
			end
		end
	)

	pageButton(
		CombatPage,
		"Visibility Check: ON",
		function()
			Config.VISIBILITY_CHECK =
				not Config.VISIBILITY_CHECK

			for _, child in ipairs(CombatPage:GetChildren()) do
				if child:IsA("TextButton")
					and string.find(child.Text, "Visibility Check:", 1, true) then

					child.Text =
						"Visibility Check: " ..
						(Config.VISIBILITY_CHECK and "ON" or "OFF")

					break
				end
			end
		end
	)

	SilentAimButton = pageButton(
		CombatPage,
		"Silent Aim: OFF",
		function()
			SilentAimEnabled = not SilentAimEnabled
			SilentAimButton.Text = "Silent Aim: " .. (SilentAimEnabled and "ON" or "OFF")
			SilentAimButton.TextColor3 = SilentAimEnabled and GREEN or WHITE

			if not SilentAimEnabled then
				AimTarget = nil
				TargetLabel.Text = "Target: None"
			end
		end
	)

	SilentAimInfo = label(
		CombatPage,
		"Silent Aim does not move the camera. It exposes the selected target part to your own weapon code. Players on the Utility whitelist are ignored.",
		UDim2.new(1, -10, 0, 68),
		UDim2.fromOffset(0, 0),
		10
	)
	SilentAimInfo.TextWrapped = true
	SilentAimInfo.TextColor3 = MUTED
	SilentAimInfo.LayoutOrder = #CombatPage:GetChildren() + 1

	pageButton(
		CombatPage,
		"Target Nearest Player",
		function()
			AimTarget = nil

			if not RootPart then
				return
			end

			local closest
			local closestDistance = math.huge

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= LocalPlayer
					and player.Character then

					local targetRoot =
						player.Character:FindFirstChild("HumanoidRootPart")

					local targetHumanoid =
						player.Character:FindFirstChildOfClass("Humanoid")

					if targetRoot
						and targetHumanoid
						and targetHumanoid.Health > 0 then

						if not Config.TEAM_CHECK
							or player.Team ~= LocalPlayer.Team then

							local distance =
								(targetRoot.Position - RootPart.Position).Magnitude

							if distance < closestDistance then
								closestDistance = distance
								closest = player
							end
						end
					end
				end
			end

			AimTarget = closest

			TargetLabel.Text =
				AimTarget
				and "Target: " .. AimTarget.Name
				or "Target: None"
		end
	)

	pageButton(
		CombatPage,
		"Clear Target",
		function()
			AimTarget = nil
			CurrentTarget = nil
			TargetLabel.Text = "Target: None"
		end
	)

	--============================================================
	-- VISUALS / PLAYER ESP
	--============================================================

	function hasPlayerESPEnabled()
		return SkeletonESPEnabled
			or NormalESPEnabled
			or DistanceESPEnabled
			or HealthESPEnabled
	end

	function removeESP(player)
		if player then
			local obj = ESPObjects[player]

			if obj then
				if obj.Highlight then
					obj.Highlight:Destroy()
				end

				if obj.Billboard then
					obj.Billboard:Destroy()
				end

				if obj.Beams then
					for _, beam in ipairs(obj.Beams) do
						if beam then
							beam:Destroy()
						end
					end
				end

				if obj.Attachments then
					for _, attachment in ipairs(obj.Attachments) do
						if attachment then
							attachment:Destroy()
						end
					end
				end

				ESPObjects[player] = nil
			end

			return
		end

		for plr in pairs(ESPObjects) do
			removeESP(plr)
		end
	end

	function createSkeleton(character, root)
		local attachments = {}
		local beams = {}
		local attachmentCache = {}

		local function getAttachment(partName)
			if attachmentCache[partName] then
				return attachmentCache[partName]
			end

			local part = character:FindFirstChild(partName)
			if not part or not part:IsA("BasePart") then
				return nil
			end

			local attachment = Instance.new("Attachment")
			attachment.Name = "OCEANASkeletonAttachment"
			attachment.Parent = part
			attachmentCache[partName] = attachment
			table.insert(attachments, attachment)
			return attachment
		end

		local function connect(partA, partB)
			local attachmentA = getAttachment(partA)
			local attachmentB = getAttachment(partB)
			if not attachmentA or not attachmentB then
				return
			end

			local beam = Instance.new("Beam")
			beam.Name = "OCEANASkeletonBeam"
			beam.Attachment0 = attachmentA
			beam.Attachment1 = attachmentB
			beam.Width0 = 0.12
			beam.Width1 = 0.12
			beam.FaceCamera = true
			beam.Segments = 1
			beam.ZOffset = 1
			beam.LightEmission = 1
			beam.Color = ColorSequence.new(BLUE2)
			beam.Transparency = NumberSequence.new(0)
			beam.Enabled = true
			beam.Parent = root
			table.insert(beams, beam)
		end

		local isR15 = character:FindFirstChild("UpperTorso") ~= nil
		if isR15 then
			connect("Head", "UpperTorso")
			connect("UpperTorso", "LowerTorso")
			connect("UpperTorso", "LeftUpperArm")
			connect("LeftUpperArm", "LeftLowerArm")
			connect("LeftLowerArm", "LeftHand")
			connect("UpperTorso", "RightUpperArm")
			connect("RightUpperArm", "RightLowerArm")
			connect("RightLowerArm", "RightHand")
			connect("LowerTorso", "LeftUpperLeg")
			connect("LeftUpperLeg", "LeftLowerLeg")
			connect("LeftLowerLeg", "LeftFoot")
			connect("LowerTorso", "RightUpperLeg")
			connect("RightUpperLeg", "RightLowerLeg")
			connect("RightLowerLeg", "RightFoot")
		else
			connect("Head", "Torso")
			connect("Torso", "Left Arm")
			connect("Torso", "Right Arm")
			connect("Torso", "Left Leg")
			connect("Torso", "Right Leg")
		end

		return attachments, beams
	end

	function addESP(player)
		if player == LocalPlayer then
			return
		end

		if not hasPlayerESPEnabled() then
			return
		end

		local character = player.Character
		if not character then
			return
		end

		removeESP(player)

		local root = character:FindFirstChild("HumanoidRootPart")
		local humanoid = character:FindFirstChildOfClass("Humanoid")

		if not root or not humanoid then
			return
		end

		local billboard = Instance.new("BillboardGui")
		billboard.Name = "OCEANAPlayerESPInfo"
		billboard.Size = UDim2.fromOffset(180, 58)
		billboard.StudsOffset = Vector3.new(0, 3.5, 0)
		billboard.AlwaysOnTop = true
		billboard.Adornee = root
		billboard.Parent = character

		local nameLabel = Instance.new("TextLabel")
		nameLabel.Size = UDim2.fromScale(1, 0.34)
		nameLabel.BackgroundTransparency = 1
		nameLabel.Text = player.DisplayName
		nameLabel.TextColor3 = Color3.new(1, 1, 1)
		nameLabel.TextStrokeTransparency = 0.4
		nameLabel.Font = Enum.Font.GothamBold
		nameLabel.TextSize = 13
		nameLabel.Parent = billboard

		local healthLabel = Instance.new("TextLabel")
		healthLabel.Position = UDim2.fromScale(0, 0.34)
		healthLabel.Size = UDim2.fromScale(1, 0.33)
		healthLabel.BackgroundTransparency = 1
		healthLabel.TextColor3 = RED
		healthLabel.TextStrokeTransparency = 0.4
		healthLabel.Font = Enum.Font.GothamBold
		healthLabel.TextSize = 13
		healthLabel.Visible = HealthESPEnabled
		healthLabel.Parent = billboard

		local distanceLabel = Instance.new("TextLabel")
		distanceLabel.Position = UDim2.fromScale(0, 0.67)
		distanceLabel.Size = UDim2.fromScale(1, 0.33)
		distanceLabel.BackgroundTransparency = 1
		distanceLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
		distanceLabel.TextStrokeTransparency = 0.2
		distanceLabel.Font = Enum.Font.Gotham
		distanceLabel.TextSize = 10
		distanceLabel.Visible = DistanceESPEnabled
		distanceLabel.Parent = billboard

		local highlight = nil

		if NormalESPEnabled then
			highlight = Instance.new("Highlight")
			highlight.Name = "OCEANANormalESP"
			highlight.Adornee = character
			highlight.FillTransparency = 1
			highlight.OutlineTransparency = 0
			highlight.OutlineColor = WHITE
			highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			highlight.Parent = character
		end

		local attachments = {}
		local beams = {}

		if SkeletonESPEnabled then
			attachments, beams = createSkeleton(character, root)
		end

		ESPObjects[player] = {
			Highlight = highlight,
			Billboard = billboard,
			Name = nameLabel,
			Health = healthLabel,
			Distance = distanceLabel,
			Root = root,
			Humanoid = humanoid,
			Attachments = attachments,
			Beams = beams,
		}
	end

	function refreshESP()
		removeESP()

		if not hasPlayerESPEnabled() then
			return
		end

		for _, player in ipairs(Players:GetPlayers()) do
			addESP(player)
		end
	end

	NormalESPButton = pageButton(
		VisualPage,
		"Normal ESP: OFF",
		function()
			NormalESPEnabled = not NormalESPEnabled

			NormalESPButton.Text =
				"Normal ESP: " ..
				(NormalESPEnabled and "ON" or "OFF")

			refreshESP()
		end
	)

	SkeletonESPButton = pageButton(
		VisualPage,
		"Skeleton ESP: OFF",
		function()
			SkeletonESPEnabled = not SkeletonESPEnabled

			SkeletonESPButton.Text =
				"Skeleton ESP: " ..
				(SkeletonESPEnabled and "ON" or "OFF")

			refreshESP()
		end
	)

	DistanceESPButton = pageButton(
		VisualPage,
		"Distance ESP: OFF",
		function()
			DistanceESPEnabled = not DistanceESPEnabled

			DistanceESPButton.Text =
				"Distance ESP: " ..
				(DistanceESPEnabled and "ON" or "OFF")

			refreshESP()
		end
	)

	HealthESPButton = pageButton(
		VisualPage,
		"Health ESP: OFF",
		function()
			HealthESPEnabled = not HealthESPEnabled

			HealthESPButton.Text =
				"Health ESP: " ..
				(HealthESPEnabled and "ON" or "OFF")

			refreshESP()
		end
	)

--============================================================
-- BRIEFCASE VISUALS INTEGRATION (NON-FATAL)
--============================================================

local BriefcaseIntegrationOK, BriefcaseIntegrationError = pcall(function()
	--// Detects briefcase/suitcase models and displays their contents
	
	
	
	ESPEnabled = false
	ContentsEnabled = false
	
	CurrentCases = {}
	CaseConnections = {}
	
	--==================================================
	-- SETTINGS
	--==================================================
	
	NAME_MATCHES = {
	    "briefcase",
	    "suitcase",
	    "brief case",
	    "brief_case",
	}
	
	--==================================================
	-- CHECK NAME
	--==================================================
	
	function IsBriefcaseName(name)
	    local lower = string.lower(name)
	
	    for _, wanted in ipairs(NAME_MATCHES) do
	        if lower == wanted then
	            return true
	        end
	    end
	
	    return false
	end
	
	--==================================================
	-- GET ROOT MODEL
	--==================================================
	
	function GetRootModel(obj)
	    if obj:IsA("Model") then
	        return obj
	    end
	
	    local model = obj:FindFirstAncestorOfClass("Model")
	
	    if model then
	        return model
	    end
	
	    return nil
	end
	
	--==================================================
	-- BRIEFCASE CACHE (LOW-LAG)
	--==================================================
	
	KnownCases = {}
	CachedContents = {}
	
	function AddKnownCase(case)
	    if case and case.Parent then
	        KnownCases[case] = true
	    end
	end
	
	function RemoveKnownCase(case)
	    KnownCases[case] = nil
	end
	
	function GetKnownCases()
	    local result = {}
	
	    for case in pairs(KnownCases) do
	        if case and case.Parent then
	            table.insert(result, case)
	        else
	            KnownCases[case] = nil
	        end
	    end
	
	    return result
	end
	
	--==================================================
	-- GET TOOL NAMES ONLY
	--==================================================
	
	function GetActualToolName(tool)
	    -- Use the game's real display/item name when it provides one.
	    local attributes = {
	        "DisplayName",
	        "ItemName",
	        "ToolName",
	        "Display_Name",
	    }
	
	    for _, attributeName in ipairs(attributes) do
	        local value = tool:GetAttribute(attributeName)
	        if typeof(value) == "string" and value ~= "" then
	            return value
	        end
	    end
	
	    for _, child in ipairs(tool:GetChildren()) do
	        if child:IsA("StringValue") then
	            local n = string.lower(child.Name)
	            if n == "displayname" or n == "itemname" or n == "toolname" or n == "display_name" then
	                if child.Value ~= "" then
	                    return child.Value
	                end
	            end
	        end
	    end
	
	    return tool.Name
	end
	
	function GetPickupObjectName(prompt)
	    -- Handles pickup items that are represented by a Model/BasePart + ProximityPrompt.
	    -- Many items display their real name in a BillboardGui/TextLabel rather than
	    -- using the Roblox Instance name, so check those labels too.
	    local model = prompt:FindFirstAncestorOfClass("Model")
	    if not model then
	        model = prompt.Parent
	    end
	    if not model then
	        return nil
	    end
	
	    local attributes = {
	        "DisplayName",
	        "ItemName",
	        "ToolName",
	        "Display_Name",
	    }
	
	    for _, attributeName in ipairs(attributes) do
	        local value = model:GetAttribute(attributeName)
	        if typeof(value) == "string" and value ~= "" then
	            return value
	        end
	    end
	
	    -- Check StringValues commonly used by item systems.
	    for _, child in ipairs(model:GetDescendants()) do
	        if child:IsA("StringValue") then
	            local n = string.lower(child.Name)
	            if n == "displayname" or n == "itemname" or n == "toolname" or n == "display_name" then
	                if child.Value ~= "" then
	                    return child.Value
	                end
	            end
	        end
	    end
	
	    -- Check the visible world-space name, such as the "Sawtooth" text in the
	    -- screenshot. Ignore interaction text like E/Pickup.
	    local ignored = {
	        ["pickup"] = true,
	        ["pick up"] = true,
	        ["e"] = true,
	        ["f"] = true,
	        ["interact"] = true,
	        ["hold"] = true,
	    }
	
	    for _, child in ipairs(model:GetDescendants()) do
	        if child:IsA("TextLabel") or child:IsA("TextButton") then
	            local text = child.Text
	            if typeof(text) == "string" then
	                text = text:gsub("%s+", " "):match("^%s*(.-)%s*$")
	                if text ~= "" and not ignored[string.lower(text)] then
	                    -- Skip obvious UI-only/keyboard strings.
	                    if #text <= 80 and not text:match("^[%[%]%(%)%{%}<>]+$") then
	                        return text
	                    end
	                end
	            end
	        end
	    end
	
	    -- Last fallback is the actual Model name.
	    return model.Name
	end
	
	function GetContents(case, forceRefresh)
	    if not forceRefresh and CachedContents[case] then
	        return CachedContents[case]
	    end
	
	    local names = {}
	    local seen = {}
	
	    for _, obj in ipairs(case:GetDescendants()) do
	        local name = nil
	
	        if obj:IsA("Tool") then
	            name = GetActualToolName(obj)
	        elseif obj:IsA("ProximityPrompt") then
	            local action = string.lower(obj.ActionText or "")
	            if action == "pickup" or action == "pick up" then
	                name = GetPickupObjectName(obj)
	            end
	        end
	
	        if name
	        and name ~= ""
	        and name ~= case.Name
	        and not seen[name] then
	            seen[name] = true
	            table.insert(names, name)
	        end
	    end
	
	    table.sort(names)
	    CachedContents[case] = names
	    return names
	end
	
	--==================================================
	-- REMOVE ONE ESP
	--==================================================
	
	function RemoveCaseESP(case)
	    if not case then
	        return
	    end
	
	    local highlight = case:FindFirstChild("BlackBriefcaseESP")
	
	    if highlight then
	        highlight:Destroy()
	    end
	
	    local billboard = case:FindFirstChild("BlackBriefcaseInfo")
	
	    if billboard then
	        billboard:Destroy()
	    end
	
	    CachedContents[case] = nil
	
	    if CaseConnections[case] then
	        for _, connection in ipairs(CaseConnections[case]) do
	            pcall(function()
	                connection:Disconnect()
	            end)
	        end
	
	        CaseConnections[case] = nil
	    end
	end
	
	--==================================================
	-- ADD ESP
	--==================================================
	
	function AddCaseESP(case)
	    if not case or not case.Parent or not ESPEnabled then
	        return
	    end
	
	    if case:FindFirstChild("BlackBriefcaseESP") or case:FindFirstChild("BlackBriefcaseInfo") then
	        return
	    end
	
	    local highlight = Instance.new("Highlight")
	    highlight.Name = "BlackBriefcaseESP"
	    highlight.Adornee = case
	    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	    highlight.FillTransparency = 0.55
	    highlight.OutlineTransparency = 0
	    highlight.FillColor = Color3.fromRGB(255, 210, 0)
	    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	    highlight.Parent = case
	
	    local billboard = Instance.new("BillboardGui")
	    billboard.Name = "BlackBriefcaseInfo"
	    billboard.Adornee = case
	    billboard.AlwaysOnTop = true
	    billboard.Size = UDim2.new(0, 320, 0, 180)
	    billboard.StudsOffset = Vector3.new(0, 3, 0)
	    billboard.Parent = case
	
	    -- ONLY the detected item names are shown. No "BRIEFCASE", no "Contents:",
	    -- no bullets, and no white text.
	    local contentsLabel = Instance.new("TextLabel")
	    contentsLabel.Name = "ItemNames"
	    contentsLabel.BackgroundTransparency = 1
	    contentsLabel.Size = UDim2.fromScale(1, 1)
	    contentsLabel.Font = Enum.Font.GothamBold
	    contentsLabel.TextSize = 20
	    contentsLabel.TextColor3 = Color3.fromRGB(255, 220, 0)
	    contentsLabel.TextStrokeTransparency = 0
	    contentsLabel.TextWrapped = true
	    contentsLabel.TextYAlignment = Enum.TextYAlignment.Top
	    contentsLabel.Parent = billboard
	
	    local function UpdateContents()
	        if not case.Parent then
	            return
	        end
	
	        if not ContentsEnabled then
	            contentsLabel.Text = ""
	            return
	        end
	
	        local contents = GetContents(case)
	
	        -- Only yellow item names. Nothing else is displayed.
	        contentsLabel.Text = table.concat(contents, "\n")
	    end
	
	    UpdateContents()
	
	    CaseConnections[case] = {}
	    local contentsUpdateQueued = false
	
	    local function QueueContentsUpdate()
	        if contentsUpdateQueued then
	            return
	        end
	
	        contentsUpdateQueued = true
	
	        task.delay(0.1, function()
	            contentsUpdateQueued = false
	            CachedContents[case] = nil
	            if case.Parent then
	                UpdateContents()
	            end
	        end)
	    end
	
	    table.insert(CaseConnections[case], case.DescendantAdded:Connect(function(obj)
	        if obj:IsA("Tool") or obj:IsA("ProximityPrompt") or obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("StringValue") then
	            QueueContentsUpdate()
	        end
	    end))
	
	    table.insert(CaseConnections[case], case.DescendantRemoving:Connect(function(obj)
	        if obj:IsA("Tool") or obj:IsA("ProximityPrompt") or obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("StringValue") then
	            QueueContentsUpdate()
	        end
	    end))
	end
	
	--==================================================
	-- REMOVE ALL ESP
	--==================================================
	
	function RemoveAllESP()
	    for _, case in ipairs(CurrentCases) do
	        RemoveCaseESP(case)
	    end
	
	    CurrentCases = {}
	end
	
	--==================================================
	-- UPDATE ESP (CACHED / LOW-LAG)
	--==================================================
	
	function UpdateESP()
	    if not ESPEnabled then
	        RemoveAllESP()
	        return
	    end
	
	    -- Do not destroy/recreate every ESP on every refresh. Only add missing ones.
	    local active = {}
	
	    for _, case in ipairs(CurrentCases) do
	        if case and case.Parent and KnownCases[case] then
	            active[case] = true
	        else
	            RemoveCaseESP(case)
	        end
	    end
	
	    local newCurrentCases = {}
	
	    for case in pairs(KnownCases) do
	        if case and case.Parent then
	            table.insert(newCurrentCases, case)
	
	            if not active[case] then
	                AddCaseESP(case)
	            end
	        else
	            KnownCases[case] = nil
	        end
	    end
	
	    CurrentCases = newCurrentCases
	end
	
	-- EVENT-DRIVEN DETECTION (NO REPEATED WORKSPACE SCANS)
	--==================================================
	
	refreshQueued = false
	
	function QueueESPRefresh()
	    if refreshQueued then
	        return
	    end
	
	    refreshQueued = true
	
	    task.delay(0.1, function()
	        refreshQueued = false
	        if ESPEnabled then
	            UpdateESP()
	        end
	    end)
	end
	
	workspace.DescendantAdded:Connect(function(obj)
	    if IsBriefcaseName(obj.Name) then
	        local model = GetRootModel(obj)
	
	        if model then
	            AddKnownCase(model)
	        elseif obj:IsA("BasePart") then
	            AddKnownCase(obj)
	        end
	
	        QueueESPRefresh()
	    end
	end)
	
	workspace.DescendantRemoving:Connect(function(obj)
	    if IsBriefcaseName(obj.Name) then
	        local model = GetRootModel(obj)
	
	        if model and not model.Parent then
	            RemoveKnownCase(model)
	        elseif obj:IsA("BasePart") and not obj.Parent then
	            RemoveKnownCase(obj)
	        end
	
	        QueueESPRefresh()
	    end
	end)
	
	--==================================================
	-- START
	--==================================================
	
	task.defer(UpdateESP)
	--==================================================
	-- MASTER BRIEFCASE ITEM NAME COLLECTOR
	--==================================================
	-- Records every real Tool name found inside detected briefcases.
	
	FoundBriefcaseItems = {}
	SeenBriefcaseItems = {}
	
	function RecordBriefcaseItemName(name)
	    if not name or name == "" then
	        return
	    end
	
	    if SeenBriefcaseItems[name] then
	        return
	    end
	
	    SeenBriefcaseItems[name] = true
	    table.insert(FoundBriefcaseItems, name)
	    table.sort(FoundBriefcaseItems)
	
	    print("[BRIEFCASE ITEM FOUND] " .. name)
	end
	
	function RecordBriefcaseTool(tool)
	    if not tool or not tool:IsA("Tool") then
	        return
	    end
	
	    RecordBriefcaseItemName(GetActualToolName(tool))
	end
	
	function ScanBriefcaseForAllItems(case)
	    if not case then
	        return
	    end
	
	    for _, obj in ipairs(case:GetDescendants()) do
	        if obj:IsA("Tool") then
	            RecordBriefcaseTool(obj)
	        elseif obj:IsA("ProximityPrompt") then
	            local action = string.lower(obj.ActionText or "")
	            if action == "pickup" or action == "pick up" then
	                RecordBriefcaseItemName(GetPickupObjectName(obj))
	            end
	        end
	    end
	end
	
	-- Use the cached briefcases instead of scanning the entire workspace again.
	for case in pairs(KnownCases) do
	    ScanBriefcaseForAllItems(case)
	end
	
	-- Watch only newly-added Tools/Prompts and walk their parent chain.
	-- This avoids a second workspace-wide DescendantAdded connection.
	workspace.DescendantAdded:Connect(function(obj)
	    if not (obj:IsA("Tool") or obj:IsA("ProximityPrompt")) then
	        return
	    end
	
	    local ancestor = obj.Parent
	
	    while ancestor and ancestor ~= workspace do
	        if IsBriefcaseName(ancestor.Name) then
	            if obj:IsA("Tool") then
	                RecordBriefcaseTool(obj)
	            else
	                local action = string.lower(obj.ActionText or "")
	                if action == "pickup" or action == "pick up" then
	                    RecordBriefcaseItemName(GetPickupObjectName(obj))
	                end
	            end
	            break
	        end
	        ancestor = ancestor.Parent
	    end
	end)
	
	-- Call this from the console whenever you want the complete list found so far.
	_G.GetBriefcaseItemList = function()
	    print("================================")
	    print("ALL BRIEFCASE ITEMS FOUND")
	    print("================================")
	
	    for i, name in ipairs(FoundBriefcaseItems) do
	        print(i .. ". " .. name)
	    end
	
	    print("================================")
	    print("TOTAL UNIQUE ITEMS: " .. #FoundBriefcaseItems)
	    print("================================")
	
	    return FoundBriefcaseItems
	end
	
	print("[BRIEFCASE ESP] Master item-name collector loaded.")
	
		-- Safe delayed initial discovery. Any unexpected object cannot stop the main script.
		task.delay(1, function()
			pcall(function()
				for _, obj in ipairs(workspace:GetDescendants()) do
					if IsBriefcaseName(obj.Name) then
						local model = GetRootModel(obj)
						if model then
							AddKnownCase(model)
						elseif obj:IsA("BasePart") then
							AddKnownCase(obj)
						end
					end
				end
				if ESPEnabled then
					UpdateESP()
				end
			end)
		end)
		--============================================================
		-- BRIEFCASE ESP / VISUALS INTEGRATION
		--============================================================
	
		local BriefcaseESPButton
		local function updateBriefcaseESPButton()
			BriefcaseESPButton.Text = "Briefcase ESP: " .. (ESPEnabled and "ON" or "OFF")
		end

		BriefcaseESPButton = pageButton(
			VisualPage,
			"Briefcase ESP: OFF",
			function()
				ESPEnabled = not ESPEnabled
				updateBriefcaseESPButton()
				if ESPEnabled then
					UpdateESP()
				else
					RemoveAllESP()
				end
			end
		)
		updateBriefcaseESPButton()

		local BriefcaseContentsButton
		local function updateBriefcaseContentsButton()
			BriefcaseContentsButton.Text = "Briefcase Contents: " .. (ContentsEnabled and "ON" or "OFF")
		end

		BriefcaseContentsButton = pageButton(
			VisualPage,
			"Briefcase Contents: OFF",
			function()
				ContentsEnabled = not ContentsEnabled
				updateBriefcaseContentsButton()
				for _, case in ipairs(CurrentCases) do
					local billboard = case:FindFirstChild("BlackBriefcaseInfo")
					if billboard then
						local itemLabel = billboard:FindFirstChild("ItemNames")
						if itemLabel and itemLabel:IsA("TextLabel") then
							itemLabel.Text = ContentsEnabled and table.concat(GetContents(case), "\n") or ""
						end
					end
				end
			end
		)
		updateBriefcaseContentsButton()
	
		pageButton(
			VisualPage,
			"Print Briefcase Items",
			function()
				_G.GetBriefcaseItemList()
			end
		)end)

if not BriefcaseIntegrationOK then
	warn("[OCEANA] Briefcase visuals disabled: " .. tostring(BriefcaseIntegrationError))
end

	--============================================================
	-- VEHICLE HELPERS
	--============================================================

	function findBikeSeat(bike)
		if not bike or not bike:IsA("Model") then
			return nil
		end

		for _, obj in ipairs(bike:GetDescendants()) do
			if obj:IsA("VehicleSeat") then
				return obj
			end
		end

		for _, obj in ipairs(bike:GetDescendants()) do
			if obj:IsA("Seat") then
				return obj
			end
		end

		return nil
	end

	function findCutLockPrompt(bike)
		if not bike then
			return nil
		end

		for _, obj in ipairs(bike:GetDescendants()) do
			if obj:IsA("ProximityPrompt") then
				local action =
					string.lower(obj.ActionText or "")

				local objectText =
					string.lower(obj.ObjectText or "")

				if string.find(action, "cut lock", 1, true)
					or string.find(action, "unlock", 1, true)
					or string.find(objectText, "cut lock", 1, true)
					or string.find(objectText, "unlock", 1, true) then

					return obj
				end
			end
		end

		return nil
	end

	function findDeliveryBikePrompt(bike)
		if not bike then
			return nil
		end

		local cutLock = findCutLockPrompt(bike)

		if cutLock then
			return cutLock
		end

		for _, obj in ipairs(bike:GetDescendants()) do
			if obj:IsA("ProximityPrompt") then
				local action =
					string.lower(obj.ActionText or "")

				local objectText =
					string.lower(obj.ObjectText or "")

				if string.find(action, "bike", 1, true)
					or string.find(action, "vehicle", 1, true)
					or string.find(objectText, "bike", 1, true)
					or string.find(objectText, "vehicle", 1, true) then

					return obj
				end
			end
		end

		return nil
	end

	function activatePrompt(prompt)
		if not prompt or not prompt.Enabled then
			return false
		end

		local oldHold = prompt.HoldDuration

		prompt.HoldDuration = 0

		local ok = pcall(function()
			prompt:InputHoldBegin()

			task.wait(0.12)

			prompt:InputHoldEnd()
		end)

		prompt.HoldDuration = oldHold

		return ok
	end

	function isDeliveryBike(obj)
		if not obj
			or not obj:IsA("Model")
			or obj == Character then

			return false
		end

		if findCutLockPrompt(obj) then
			return true
		end

		local name =
			string.lower(obj.Name)

		return string.find(name, "bike", 1, true) ~= nil
			or string.find(name, "delivery", 1, true) ~= nil
	end

	--============================================================
	-- DROP-OFF
	--============================================================

	function findGreenDropOff()
		local best
		local bestScore = math.huge

		for _, obj in ipairs(workspace:GetDescendants()) do
			if obj:IsA("BasePart") then
				local color = obj.Color

				local greenEnough =
					color.G > color.R * 1.25
					and color.G > color.B * 1.1

				if greenEnough and obj.Transparency < 0.8 then
					local size = obj.Size

					local flat =
						size.Y <=
						math.max(size.X, size.Z) * 0.35

					local usable =
						size.X >= 3
						and size.Z >= 3

					if flat and usable then
						local score =
							math.abs(size.Y)

						if RootPart then
							score +=
								(obj.Position - RootPart.Position).Magnitude * 0.0001
						end

						if score < bestScore then
							bestScore = score
							best = obj
						end
					end
				end
			end
		end

		return best
	end

	function findDeliveryZone()
		if DELIVERY_ZONE_POSITION then
			return DELIVERY_ZONE_POSITION
		end

		local dropOff = findGreenDropOff()

		if dropOff then
			return dropOff.Position
		end

		return nil
	end

	--============================================================
	-- FIND BIKES
	--============================================================

	function findSpawnedBike()
		local closestBike
		local closestDistance = math.huge

		for _, obj in ipairs(workspace:GetDescendants()) do
			if obj:IsA("Model")
				and obj ~= Character
				and not UsedBikes[obj]
				and obj ~= CurrentBike then

				local seat = findBikeSeat(obj)

				if seat then
					local distance =
						(seat.Position - SOURCE_A_POSITION).Magnitude

					if distance < closestDistance then
						closestDistance = distance
						closestBike = obj
					end
				end
			end
		end

		return closestBike
	end

	function getNextBike()
		if CurrentBike then
			return nil
		end

		local candidates = {}

		for _, obj in ipairs(workspace:GetDescendants()) do
			if obj:IsA("Model")
				and obj ~= Character
				and not UsedBikes[obj]
				and isDeliveryBike(obj) then

				local seat = findBikeSeat(obj)
				local prompt = findDeliveryBikePrompt(obj)

				if seat and prompt then
					table.insert(candidates, obj)
				end
			end
		end

		if #candidates == 0 then
			return nil
		end

		if RootPart then
			local closest
			local closestDistance = math.huge

			for _, bike in ipairs(candidates) do
				local seat = findBikeSeat(bike)

				if seat then
					local distance =
						(seat.Position - RootPart.Position).Magnitude

					if distance < closestDistance then
						closestDistance = distance
						closest = bike
					end
				end
			end

			if closest then
				return closest
			end
		end

		return candidates[1]
	end

	--============================================================
	-- TELEPORT TO SPAWNED BIKE
	--============================================================

	function teleportToSpawnedBike()
		if not RootPart then
			return
		end

		local bike = findSpawnedBike()

		if not bike then
			if StatusText then
				StatusText.Text =
					"Status: No spawned bike found"

				StatusText.TextColor3 = RED
			end

			return
		end

		local seat = findBikeSeat(bike)

		if seat then
			RootPart.CFrame =
				seat.CFrame +
				Vector3.new(0, 3, 0)

			if StatusText then
				StatusText.Text =
					"Status: Teleported to " .. bike.Name

				StatusText.TextColor3 = GREEN
			end
		end
	end

	--============================================================
	-- TELEPORT TO DELIVERY BIKE
	--============================================================

	function teleportToDeliveryBike(bike)
		if not bike
			or bike ~= CurrentBike
			or not bike.Parent then

			return false
		end

		local seat = findBikeSeat(bike)
		local prompt = findDeliveryBikePrompt(bike)

		if not seat or not RootPart then
			return false
		end

		RootPart.CFrame =
			seat.CFrame +
			Vector3.new(0, 3, 0)

		task.wait(0.25)

		if Humanoid and seat.Parent then
			seat:Sit(Humanoid)
		end

		task.wait(0.5)

		if prompt then
			local promptPart

			if prompt.Parent:IsA("BasePart") then
				promptPart = prompt.Parent

			elseif prompt.Parent:IsA("Attachment")
				and prompt.Parent.Parent
				and prompt.Parent.Parent:IsA("BasePart") then

				promptPart = prompt.Parent.Parent
			end

			if RootPart and promptPart then
				RootPart.CFrame =
					promptPart.CFrame +
					Vector3.new(0, 2.5, 0)

				task.wait(0.2)

				activatePrompt(prompt)

				task.wait(0.5)

				if Humanoid and seat.Parent then
					seat:Sit(Humanoid)
				end
			else
				activatePrompt(prompt)
			end
		end

		return true
	end

	--============================================================
	-- MOVE EXACT BIKE
	--============================================================

	function setBikeNoclip(bike, enabled, states)
		if not bike or not bike.Parent then
			return
		end

		for _, object in ipairs(bike:GetDescendants()) do
			if object:IsA("BasePart") then
				if enabled then
					if states[object] == nil then
						states[object] = object.CanCollide
					end
					object.CanCollide = false
				else
					local original = states[object]
					if original ~= nil and object.Parent then
						object.CanCollide = original
					end
					states[object] = nil
				end
			end
		end
	end

	function moveBikeToDeliveryZone(bike, destination)
		if not bike
			or bike ~= CurrentBike
			or not bike.Parent then

			return false
		end

		local startCFrame =
			bike:GetPivot()

		local targetPosition =
			Vector3.new(
				destination.X,
				destination.Y + 4,
				destination.Z
			)

		local targetCFrame =
			CFrame.new(targetPosition) *
			startCFrame.Rotation

		local distance =
			(startCFrame.Position - targetPosition).Magnitude

		local travelTime =
			math.max(
				distance / Config.DELIVERY_SPEED,
				0.1
			)

		local startTime = os.clock()
		local bikeNoclipStates = {}
		setBikeNoclip(bike, true, bikeNoclipStates)

		while
			AutoFarmRunning
			and Config.AUTO_FARM
			and CurrentBike == bike
			and bike.Parent
		do
			local elapsed = os.clock() - startTime

			local alpha =
				math.clamp(
					elapsed / travelTime,
					0,
					1
				)

			local smoothAlpha =
				alpha * alpha * (3 - 2 * alpha)

			setBikeNoclip(bike, true, bikeNoclipStates)

			bike:PivotTo(
				startCFrame:Lerp(
					targetCFrame,
					smoothAlpha
				)
			)

			if alpha >= 1 then
				break
			end

			RunService.Heartbeat:Wait()
		end

		if not bike.Parent then
			return false
		end

		if CurrentBike ~= bike then
			setBikeNoclip(bike, false, bikeNoclipStates)
			return false
		end

		bike:PivotTo(targetCFrame)

		if StatusText then
			StatusText.Text =
				"Status: Waiting for delivery confirmation"

			StatusText.TextColor3 = MUTED
		end

		local waitStart = os.clock()

		while
			AutoFarmRunning
			and Config.AUTO_FARM
			and CurrentBike == bike
			and bike.Parent
		do
			if bike:GetAttribute("Delivered") == true
				or bike:GetAttribute("DeliveryComplete") == true
				or bike:GetAttribute("DeliveredSuccessfully") == true then

				if StatusText then
					StatusText.Text =
						"Status: Delivery complete"

					StatusText.TextColor3 = GREEN
				end

				setBikeNoclip(bike, false, bikeNoclipStates)
				return true
			end

			if not bike.Parent then
				setBikeNoclip(bike, false, bikeNoclipStates)
				return true
			end

			setBikeNoclip(bike, true, bikeNoclipStates)

			if os.clock() - waitStart >=
				Config.DELIVERY_TIMEOUT then

				if StatusText then
					StatusText.Text =
						"Status: Delivery timed out"

					StatusText.TextColor3 = RED
				end

				setBikeNoclip(bike, false, bikeNoclipStates)
				return false
			end

			bike:PivotTo(targetCFrame)

			task.wait(0.1)
		end

		setBikeNoclip(bike, false, bikeNoclipStates)
		return false
	end

	--============================================================
	-- DRIVE BIKE
	--============================================================

	function driveBike(bike)
		if not bike
			or bike ~= CurrentBike then

			return false
		end

		if not teleportToDeliveryBike(bike) then
			return false
		end

		local dropOffPosition =
			findDeliveryZone()

		if not dropOffPosition then
			if StatusText then
				StatusText.Text =
					"Status: Set delivery zone first"

				StatusText.TextColor3 = RED
			end

			return false
		end

		return moveBikeToDeliveryZone(
			bike,
			dropOffPosition
		)
	end

	--============================================================
	-- RUN ONE DELIVERY
	--============================================================

	function runDelivery()
		if CurrentBike then
			return false
		end

		local bike = getNextBike()

		if not bike then
			if StatusText then
				StatusText.Text =
					"Status: No unused bike found"

				StatusText.TextColor3 = MUTED
			end

			return false
		end

		CurrentBike = bike

		if BikeText then
			BikeText.Text =
				"Bike: " .. bike.Name
		end

		if StatusText then
			StatusText.Text =
				"Status: Taking " .. bike.Name

			StatusText.TextColor3 = GREEN
		end

		local success = driveBike(bike)

		if success then
			UsedBikes[bike] = true

			if StatusText then
				StatusText.Text =
					"Status: Delivery complete - " ..
					bike.Name

				StatusText.TextColor3 = GREEN
			end
		else
			if StatusText then
				StatusText.Text =
					"Status: Delivery failed - " ..
					bike.Name

				StatusText.TextColor3 = RED
			end
		end

		if CurrentBike == bike then
			CurrentBike = nil
		end

		if BikeText then
			BikeText.Text = "Bike: None"
		end

		return success
	end

	--============================================================
	-- AUTO FARM
	--============================================================

	function runAutoFarm()
		if AutoFarmRunning then
			return
		end

		AutoFarmRunning = true
		Config.AUTO_FARM = true

		if StatusText then
			StatusText.Text =
				"Status: Auto Farm started"

			StatusText.TextColor3 = GREEN
		end

		task.spawn(function()
			while Config.AUTO_FARM
				and AutoFarmRunning do

				if not CurrentBike then
					local success = runDelivery()

					if not success then
						task.wait(
							math.max(
								Config.AUTO_FARM_DELAY,
								1
							)
						)
					end
				end

				task.wait(Config.AUTO_FARM_DELAY)
			end

			AutoFarmRunning = false
		end)
	end

	function stopAutoFarm()
		Config.AUTO_FARM = false
		AutoFarmRunning = false
		CurrentBike = nil

		if StatusText then
			StatusText.Text = "Status: Stopped"
			StatusText.TextColor3 = RED
		end

		if BikeText then
			BikeText.Text = "Bike: None"
		end
	end

	--============================================================
	-- CARS PAGE
	--============================================================

	--============================================================
	-- VEHICLE / BIKE FLY
	--============================================================
	local VehicleFlyEnabled = false
	local VehicleFlySpeed = 50
	local VEHICLE_FLY_MAX_SPEED = 500

	local function getVehicleForFly()
		local character = LocalPlayer.Character
		if not character then
			return nil
		end

		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if not humanoid then
			return nil
		end

		local seat = humanoid.SeatPart
		if not seat or not (seat:IsA("Seat") or seat:IsA("VehicleSeat")) then
			return nil
		end

		local vehicle = seat:FindFirstAncestorOfClass("Model")
		if not vehicle then
			return nil
		end

		return vehicle, seat
	end

	RunService.Heartbeat:Connect(function()
		if not VehicleFlyEnabled then
			return
		end

		local vehicle, seat = getVehicleForFly()
		if not vehicle or not seat then
			return
		end

		local camera = workspace.CurrentCamera
		if not camera then
			return
		end

		local direction = Vector3.zero

		if FlyKeys and FlyKeys.W then
			direction += camera.CFrame.LookVector
		end
		if FlyKeys and FlyKeys.S then
			direction -= camera.CFrame.LookVector
		end
		if FlyKeys and FlyKeys.D then
			direction += camera.CFrame.RightVector
		end
		if FlyKeys and FlyKeys.A then
			direction -= camera.CFrame.RightVector
		end
		if FlyKeys and FlyKeys.Space then
			direction += Vector3.new(0, 1, 0)
		end
		if FlyKeys and FlyKeys.LeftControl then
			direction -= Vector3.new(0, 1, 0)
		end

		if direction.Magnitude > 0 then
			direction = direction.Unit * math.clamp(VehicleFlySpeed, 50, VEHICLE_FLY_MAX_SPEED)
		else
			direction = Vector3.zero
		end

		seat.AssemblyLinearVelocity = direction
		seat.AssemblyAngularVelocity = Vector3.zero
	end)

	pageSlider(
		CarsPage,
		"Vfly Speed",
		50,
		500,
		50,
		function(value)
			VehicleFlySpeed = math.clamp(value, 50, VEHICLE_FLY_MAX_SPEED)
		end
	)

	local VFlyButton
	VFlyButton = pageButton(
		CarsPage,
		"Vfly: OFF",
		function()
			VehicleFlyEnabled = not VehicleFlyEnabled
			VFlyButton.Text = "Vfly: " .. (VehicleFlyEnabled and "ON" or "OFF")

			-- Explicitly refresh the VFly pill so its visual state always
			-- matches the actual VFly state.
			local track = VFlyButton:FindFirstChild("ToggleTrack")
			local knob = track and track:FindFirstChild("ToggleKnob")
			if track and knob then
				track.BackgroundColor3 = VehicleFlyEnabled and BLUE or BORDER
				knob.Position = VehicleFlyEnabled
					and UDim2.new(1, -9, 0.5, 0)
					or UDim2.new(0, 9, 0.5, 0)
			end

			if not VehicleFlyEnabled then
				local _, seat = getVehicleForFly()
				if seat then
					seat.AssemblyLinearVelocity = Vector3.zero
					seat.AssemblyAngularVelocity = Vector3.zero
				end
			end
		end
	)

	pageTitle(CarsPage, "Cars / Delivery")

	pageButton(
		CarsPage,
		"Find Nearest Vehicle",
		function()
			if not RootPart then
				return
			end

			local closest
			local closestDistance = math.huge

			for _, obj in ipairs(workspace:GetDescendants()) do
				if obj:IsA("Model") then
					local seat = findBikeSeat(obj)

					if seat then
						local distance =
							(seat.Position - RootPart.Position).Magnitude

						if distance < closestDistance then
							closestDistance = distance
							closest = obj
						end
					end
				end
			end

			if closest then
				local seat = findBikeSeat(closest)

				if seat then
					RootPart.CFrame =
						seat.CFrame +
						Vector3.new(0, 3, 0)
				end
			end
		end
	)

	pageButton(
		CarsPage,
		"Set Delivery Zone Here",
		function()
			if not RootPart then
				return
			end

			DELIVERY_ZONE_POSITION =
				RootPart.Position

			if StatusText then
				StatusText.Text =
					"Status: Delivery zone saved"

				StatusText.TextColor3 = GREEN
			end
		end
	)

	pageButton(
		CarsPage,
		"Clear Delivery Zone",
		function()
			DELIVERY_ZONE_POSITION = nil

			if StatusText then
				StatusText.Text =
					"Status: Delivery zone cleared"

				StatusText.TextColor3 = MUTED
			end
		end
	)

	pageButton(
		CarsPage,
		"Set Source A To My Position",
		function()
			if RootPart then
				SOURCE_A_POSITION =
					RootPart.Position

				if StatusText then
					StatusText.Text =
						"Status: Source A saved"

					StatusText.TextColor3 = GREEN
				end
			end
		end
	)

	--============================================================
	-- AUTO FARM PAGE
	--============================================================

	pageTitle(AutoFarmPage, "Auto Farm")

	AutoFarmStateText = label(
		AutoFarmPage,
		"Auto Farm: OFF  |  Fly: OFF  |  Noclip: OFF  |  Nitty Speed: 1X  |  Nitty Fly: OFF  |  Nitty Noclip: OFF",
		UDim2.new(1, -10, 0, 52),
		UDim2.fromOffset(0, 0),
		12
	)
	AutoFarmStateText.TextWrapped = true
	AutoFarmStateText.LayoutOrder = 2
	AutoFarmStateText.TextColor3 = MUTED

	function updateAutoFarmStateText(autoFarmOn, flyOn, noclipOn, nittySpeed, nittyFlyOn, nittyNoclipOn)
		AutoFarmStateText.Text =
			"Auto Farm: " .. (autoFarmOn and "ON" or "OFF") ..
			"  |  Fly: " .. (flyOn and "ON" or "OFF") ..
			"  |  Noclip: " .. (noclipOn and "ON" or "OFF") ..
			"  |  Nitty Speed: " .. tostring(nittySpeed or 1) .. "X" ..
			"  |  Nitty Fly: " .. (nittyFlyOn and "ON" or "OFF") ..
			"  |  Nitty Noclip: " .. (nittyNoclipOn and "ON" or "OFF")
	end

	StatusText = label(
		AutoFarmPage,
		"Status: Stopped",
		UDim2.new(1, -10, 0, 28),
		UDim2.fromOffset(0, 0),
		13
	)

	StatusText.LayoutOrder = 2
	StatusText.TextColor3 = RED

	BikeText = label(
		AutoFarmPage,
		"Bike: None",
		UDim2.new(1, -10, 0, 28),
		UDim2.fromOffset(0, 0),
		13
	)

	BikeText.LayoutOrder = 3

	AutoFarmButton = pageButton(
		AutoFarmPage,
		"Auto Farm: OFF",
		function()
			if Config.AUTO_FARM then
				stopAutoFarm()

				AutoFarmButton.Text =
					"Auto Farm: OFF"
			else
				AutoFarmButton.Text =
					"Auto Farm: ON"

				runAutoFarm()
			end
			updateAutoFarmStateText(Config.AUTO_FARM, Flying, Noclip, 1, false, false)
		end
	)

	AutoFarmButton.LayoutOrder = 4

	pageButton(
		AutoFarmPage,
		"Clear Used Bikes",
		function()
			UsedBikes = {}

			StatusText.Text =
				"Status: Bike list cleared"

			StatusText.TextColor3 = WHITE
		end
	)

	pageButton(
		AutoFarmPage,
		"Stop Auto Farm",
		function()
			stopAutoFarm()

			AutoFarmButton.Text =
				"Auto Farm: OFF"
		end
	)

	AirInfo = label(
		AutoFarmPage,
		"Delivery route:\n\n" ..
		"1. Find one unused delivery bike\n" ..
		"2. Lock that exact bike\n" ..
		"3. Get onto that bike\n" ..
		"4. Move only that bike to the drop-off\n" ..
		"5. Keep it at the drop-off\n" ..
		"6. Wait for server confirmation\n" ..
		"7. Continue with the next unused bike",
		UDim2.new(1, -10, 0, 190),
		UDim2.fromOffset(0, 0),
		13
	)

	AirInfo.TextWrapped = true
	AirInfo.LayoutOrder = 7


	--============================================================
	--============================================================
	-- NITTY AUTO FARM PAGE
	-- Source runtime preserved; only the standalone GUI is replaced
	-- by controls on the existing NITTY AUTO FARM page.
	--============================================================
	do
		local player = LocalPlayer
		local NITTY_FOLDER = "Nittys"
		local ATTACK_DISTANCE = 10
		local DAMAGE = 25
		local ATTACK_COOLDOWN = 0.75
		local REPATH_INTERVAL = 0.35
		local SEARCH_INTERVAL = 0.15
		local MOVE_TIMEOUT = 1.25

		-- No developer exemption or anti-cheat bypass is used.
		-- Fly/Noclip run normally so your anti-cheat can observe and flag them.
		-- Movement test settings.
		-- 1x keeps the character's normal WalkSpeed.
		-- Higher values make the Nitty test move faster.
		local SPEED_LEVELS = {1, 2, 3, 4}
		local speedIndex = 1
		local flightEnabled = false
		local noclipEnabled = false
		local flyVelocity = nil
		local originalWalkSpeed = 16
		local noclipStates = {}
		local NOCliP_TEST_ATTRIBUTE = "NittyNoclipTest"

		-- Flight obstacle handling. When an obstacle is directly ahead, the
		-- test flight rises over it instead of trying to push straight through.
		local FLY_OBSTACLE_LOOKAHEAD = 32
		local FLY_OBSTACLE_RISE = 10
		local FLY_UP_SPEED = 38
		local FLY_CLEARANCE = 5

		local running = false
		local target = nil
		local moving = false
		local lastAttack = 0
		local lastSearch = 0
		local lastPath = 0
		local teleportedToTarget = false

		local function getCharacter()
			local character = player.Character
			if not character then
				return nil, nil, nil
			end

			local humanoid = character:FindFirstChildOfClass("Humanoid")
			local root = character:FindFirstChild("HumanoidRootPart")

			return character, humanoid, root
		end

		local function getRoot(model)
			if not model or not model:IsA("Model") then
				return nil
			end

			return model:FindFirstChild("HumanoidRootPart")
				or model.PrimaryPart
				or model:FindFirstChildWhichIsA("BasePart", true)
		end

		-- Use the same teleport method as the main Teleport page.
		-- If seated in a vehicle, move the whole vehicle; otherwise move
		-- the whole character. This keeps the seat/weld state intact.
		local function teleportToNitty(targetRoot)
			local character, humanoid, root = getCharacter()
			if not character or not root or not targetRoot then
				return false
			end

			local destination = CFrame.new(targetRoot.Position + Vector3.new(0, 3, 0))
			local seat = humanoid and humanoid.SeatPart
			local vehicle = nil

			if seat and (seat:IsA("VehicleSeat") or seat:IsA("Seat")) then
				vehicle = seat:FindFirstAncestorOfClass("Model")
			end

			if vehicle and vehicle ~= character then
				vehicle:PivotTo(destination)

				for _, obj in ipairs(vehicle:GetDescendants()) do
					if obj:IsA("BasePart") then
						obj.AssemblyLinearVelocity = Vector3.zero
						obj.AssemblyAngularVelocity = Vector3.zero
					end
				end
			else
				character:PivotTo(destination)
				root.AssemblyLinearVelocity = Vector3.zero
				root.AssemblyAngularVelocity = Vector3.zero
			end

			return true
		end

		local function isNitty(model)
			if not model or not model:IsA("Model") then
				return false
			end

			local humanoid = model:FindFirstChildOfClass("Humanoid")
			local root = getRoot(model)

			return humanoid ~= nil and root ~= nil and humanoid.Health > 0
		end

		local function isAllowedNitty(model)
			if not isNitty(model) then
				return false
			end

			local folder = workspace:FindFirstChild(NITTY_FOLDER)

			if folder and folder:IsA("Folder") then
				return model:IsDescendantOf(folder)
			end

			return string.find(string.lower(model.Name), "nitty", 1, true) ~= nil
		end

		local function getCandidates()
			local folder = workspace:FindFirstChild(NITTY_FOLDER)

			if folder and folder:IsA("Folder") then
				return folder:GetDescendants()
			end

			return workspace:GetDescendants()
		end

		local function findNearestNitty(position)
			local nearest = nil
			local nearestDistance = math.huge

			for _, object in ipairs(getCandidates()) do
				if isAllowedNitty(object) then
					local root = getRoot(object)

					if root then
						local distance = (root.Position - position).Magnitude

						if distance < nearestDistance then
							nearest = object
							nearestDistance = distance
						end
					end
				end
			end

			return nearest, nearestDistance
		end

		local function getSpeedMultiplier()
			return SPEED_LEVELS[speedIndex] or 1
		end

		local function applyMovementSpeed()
			local _, humanoid = getCharacter()
			if not humanoid or not humanoid.Parent then
				return
			end

			humanoid.WalkSpeed = originalWalkSpeed * getSpeedMultiplier()
		end

		local function setCharacterNoclip(enabled)
			local character = player.Character
			if not character then
				return
			end

			if enabled then
				for _, object in ipairs(character:GetDescendants()) do
					if object:IsA("BasePart") then
						if noclipStates[object] == nil then
							noclipStates[object] = object.CanCollide
						end
						object.CanCollide = false
					end
				end
			else
				for object, originalCanCollide in pairs(noclipStates) do
					if object and object.Parent then
						object.CanCollide = originalCanCollide
					end
					noclipStates[object] = nil
				end
			end
		end

		local function startNoclip()
			noclipEnabled = true
			player:SetAttribute(NOCliP_TEST_ATTRIBUTE, true)
			setCharacterNoclip(true)
		end

		local function stopNoclip()
			noclipEnabled = false
			player:SetAttribute(NOCliP_TEST_ATTRIBUTE, false)
			setCharacterNoclip(false)
		end

		local function stopFlight()
			if flyVelocity then
				flyVelocity:Destroy()
				flyVelocity = nil
			end

			local _, humanoid, root = getCharacter()
			if humanoid and humanoid.Parent then
				humanoid.PlatformStand = false
				humanoid.WalkSpeed = originalWalkSpeed * getSpeedMultiplier()
			end

			if root and root.Parent then
				root.AssemblyLinearVelocity = Vector3.zero
			end
		end

		local function startFlight()
			local _, humanoid, root = getCharacter()
			if not humanoid or humanoid.Health <= 0 or not root then
				return false
			end

			if flyVelocity then
				return true
			end

			humanoid.PlatformStand = false

			flyVelocity = Instance.new("BodyVelocity")
			flyVelocity.Name = "NittyTestFlight"
			flyVelocity.MaxForce = Vector3.new(1000000, 1000000, 1000000)
			flyVelocity.P = 20000
			flyVelocity.Velocity = Vector3.zero
			flyVelocity.Parent = root

			return true
		end

		local function stopMovement()
			local _, humanoid = getCharacter()

			if humanoid and humanoid.Parent then
				humanoid:Move(Vector3.zero, false)
			end

			if flightEnabled then
				stopFlight()
			end
		end

		local function moveToWaypoint(humanoid, position)
			local reached = nil

			local connection = humanoid.MoveToFinished:Connect(function(success)
				reached = success
			end)

			humanoid:MoveTo(position)

			local started = os.clock()

			while running and reached == nil and os.clock() - started < MOVE_TIMEOUT do
				task.wait()
			end

			connection:Disconnect()
			return reached == true
		end

		local function flyToTarget(npc)
			local _, humanoid, root = getCharacter()
			local npcRoot = getRoot(npc)

			if not humanoid or humanoid.Health <= 0 or not root or not npcRoot then
				return
			end

			if not startFlight() then
				return
			end

			local offset = npcRoot.Position - root.Position
			local distance = offset.Magnitude

			if distance <= ATTACK_DISTANCE then
				flyVelocity.Velocity = Vector3.zero
				return
			end

			if distance <= 0.05 then
				flyVelocity.Velocity = Vector3.zero
				return
			end

			local speed = 35 * getSpeedMultiplier()
			local direction = offset.Unit
			local flatDirection = Vector3.new(direction.X, 0, direction.Z)

			if flatDirection.Magnitude <= 0.05 then
				flyVelocity.Velocity = direction * speed
				return
			end

			flatDirection = flatDirection.Unit
			local right = Vector3.new(-flatDirection.Z, 0, flatDirection.X)

			local rayParams = RaycastParams.new()
			rayParams.FilterType = Enum.RaycastFilterType.Exclude
			rayParams.FilterDescendantsInstances = {getCharacter(), npc}
			rayParams.IgnoreWater = true

			local lookAhead = math.min(FLY_OBSTACLE_LOOKAHEAD, distance)
			local obstacleHit = nil

			-- Scan the whole front of the character at several heights. This catches
			-- tall buildings/walls instead of relying on one ray at waist height.
			local scanHeights = {0, 3, 7, 12}
			for _, height in ipairs(scanHeights) do
				local origin = root.Position + Vector3.new(0, height, 0)
				local hit = workspace:Raycast(origin, flatDirection * lookAhead, rayParams)
				if hit and hit.Instance and hit.Instance.CanCollide then
					obstacleHit = hit
					break
				end
			end

			if not obstacleHit then
				-- Also check the front corners so wide buildings are detected before
				-- the character reaches their edge.
				for _, side in ipairs({-1, 1}) do
					local origin = root.Position + right * (side * 3) + Vector3.new(0, 3, 0)
					local hit = workspace:Raycast(origin, flatDirection * lookAhead, rayParams)
					if hit and hit.Instance and hit.Instance.CanCollide then
						obstacleHit = hit
						break
					end
				end
			end

			if not obstacleHit then
				flyVelocity.Velocity = direction * speed
				return
			end

			-- Try both sides using forward-diagonal rays. A side is only selected
			-- when the space immediately beside AND ahead of the character is clear.
			local sideClear = {}
			for _, side in ipairs({-1, 1}) do
				local sideDir = right * side
				local clear = true
				local sideDistance = 18

				for _, height in ipairs({0, 3, 7}) do
					local origin = root.Position + Vector3.new(0, height, 0)
					local sideHit = workspace:Raycast(origin, sideDir * sideDistance, rayParams)
					if sideHit and sideHit.Instance and sideHit.Instance.CanCollide then
						clear = false
						break
					end

					local diagonal = (flatDirection + sideDir * 0.85).Unit
					local diagonalHit = workspace:Raycast(origin, diagonal * 24, rayParams)
					if diagonalHit and diagonalHit.Instance and diagonalHit.Instance.CanCollide then
						clear = false
						break
					end
				end

				sideClear[side] = clear
			end

			local velocityDirection
			if sideClear[1] or sideClear[-1] then
				local chosenSide
				if sideClear[1] and sideClear[-1] then
					-- Prefer the side that points more toward the target.
					chosenSide = (right:Dot(flatDirection) >= 0) and 1 or -1
				else
					chosenSide = sideClear[1] and 1 or -1
				end

				velocityDirection = (flatDirection * 0.35 + right * chosenSide * 1.15).Unit
				velocityDirection = Vector3.new(velocityDirection.X, 0, velocityDirection.Z).Unit
				flyVelocity.Velocity = velocityDirection * speed
				return
			end

			-- Both sides are blocked, so climb above the actual obstacle. Keep
			-- checking every heartbeat; once the top is clear normal flight resumes.
			local targetHeight = root.Position.Y + FLY_OBSTACLE_RISE
			local part = obstacleHit.Instance
			if part and part:IsA("BasePart") then
				targetHeight = math.max(
					targetHeight,
					part.Position.Y + part.Size.Y * 0.5 + FLY_CLEARANCE
				)
			end

			if root.Position.Y < targetHeight then
				local climb = math.min(FLY_UP_SPEED, math.max(FLY_UP_SPEED * 0.65, (targetHeight - root.Position.Y) * 3))
				flyVelocity.Velocity = flatDirection * (speed * 0.45) + Vector3.yAxis * climb
			else
				-- We are above it; move forward and slightly away from the wall.
				flyVelocity.Velocity = flatDirection * speed + Vector3.yAxis * math.min(8, math.max(0, npcRoot.Position.Y - root.Position.Y))
			end
		end

		local function moveToTarget(npc)
			if moving or not npc or not npc.Parent then
				return
			end

			moving = true

			local _, humanoid, root = getCharacter()
			local npcRoot = getRoot(npc)

			if not humanoid or humanoid.Health <= 0 or not root or not npcRoot then
				moving = false
				return
			end

			if (npcRoot.Position - root.Position).Magnitude <= ATTACK_DISTANCE then
				moving = false
				return
			end

			local path = PathfindingService:CreatePath({
				AgentRadius = 2,
				AgentHeight = 5,
				AgentCanJump = true,
				AgentCanClimb = true,
				WaypointSpacing = 4,
			})

			local ok = pcall(function()
				path:ComputeAsync(root.Position, npcRoot.Position)
			end)

			if ok and path.Status == Enum.PathStatus.Success then
				for _, waypoint in ipairs(path:GetWaypoints()) do
					if not running or not npc.Parent then
						break
					end

					local _, liveHumanoid, liveRoot = getCharacter()
					local liveNpcRoot = getRoot(npc)

					if not liveHumanoid or liveHumanoid.Health <= 0 or not liveRoot or not liveNpcRoot then
						break
					end

					if (liveNpcRoot.Position - liveRoot.Position).Magnitude <= ATTACK_DISTANCE then
						break
					end

					if waypoint.Action == Enum.PathWaypointAction.Jump then
						liveHumanoid.Jump = true
					end

					moveToWaypoint(liveHumanoid, waypoint.Position)
				end
			else
				local _, liveHumanoid, liveRoot = getCharacter()
				local liveNpcRoot = getRoot(npc)

				if liveHumanoid and liveRoot and liveNpcRoot then
					local offset = liveNpcRoot.Position - liveRoot.Position
					local flat = Vector3.new(offset.X, 0, offset.Z)

					if flat.Magnitude > 0.05 then
						liveHumanoid:Move(flat.Unit, false)
						task.wait(0.25)
						liveHumanoid:Move(Vector3.zero, false)
					end
				end
			end

			moving = false
		end

		local function attackTarget(npc)
			local _, humanoid, root = getCharacter()
			local targetHumanoid = npc and npc:FindFirstChildOfClass("Humanoid")
			local targetRoot = getRoot(npc)

			if not humanoid or humanoid.Health <= 0 or not root then
				return false
			end

			if not targetHumanoid or targetHumanoid.Health <= 0 or not targetRoot then
				return false
			end

			if (targetRoot.Position - root.Position).Magnitude > ATTACK_DISTANCE then
				return false
			end

			if os.clock() - lastAttack < ATTACK_COOLDOWN then
				return false
			end

			lastAttack = os.clock()

			targetHumanoid:TakeDamage(DAMAGE)
			return true
		end

		local NittyStatus = label(NittyAutoFarmPage, "Status: Ready", UDim2.new(1, -10, 0, 55), UDim2.fromOffset(0, 0), 12)
		NittyStatus.TextWrapped = true
		NittyStatus.LayoutOrder = 2

		local NittyTarget = label(NittyAutoFarmPage, "Target: none", UDim2.new(1, -10, 0, 28), UDim2.fromOffset(0, 0), 12)
		NittyTarget.LayoutOrder = 3

		local NittyStartButton = pageButton(NittyAutoFarmPage, "START NITTY", function()
			if running then return end
			running = true
			target = nil
			moving = false
			teleportedToTarget = false
			setStatus("Nitty test started. Anti-cheat detection remains enabled.", "start")
			NittyStatus.Text = "Status: Nitty test started."
		end)
		NittyStartButton.LayoutOrder = 4

		local NittyStopButton = pageButton(NittyAutoFarmPage, "STOP", function()
			running = false
			target = nil
			moving = false
			teleportedToTarget = false
			flightEnabled = false
			noclipEnabled = false
			stopNoclip()
			stopFlight()
			NittyFlyButton.Text = "FLY: OFF"
			NittyFlyButton.TextColor3 = WHITE
			NittyNoclipButton.Text = "NOCLIP: OFF"
			NittyNoclipButton.TextColor3 = WHITE
			stopMovement()
			NittyTarget.Text = "Target: none"
			NittyStatus.Text = "Status: Nitty test stopped."
			updateAutoFarmStateText(Config.AUTO_FARM, Flying, Noclip, getSpeedMultiplier(), flightEnabled, noclipEnabled)
		end)
		NittyStopButton.LayoutOrder = 5

		local NittyScanButton = pageButton(NittyAutoFarmPage, "SCAN", function()
			local _, humanoid, root = getCharacter()
			if not root or not humanoid or humanoid.Health <= 0 then
				NittyStatus.Text = "Status: Character is not ready."
				return
			end
			local npc, distance = findNearestNitty(root.Position)
			if npc then
				target = npc
				teleportedToTarget = false
				NittyTarget.Text = "Target: " .. npc.Name
				NittyStatus.Text = string.format("Nearest Nitty: %s • %.0f studs", npc.Name, distance)
			else
				NittyTarget.Text = "Target: none"
				NittyStatus.Text = "Status: No Nitty found."
			end
		end)
		NittyScanButton.LayoutOrder = 6

		local refreshNittyControls

		local NittySpeedButton = pageButton(NittyAutoFarmPage, "SPEED: 1X", function()
			speedIndex += 1
			if speedIndex > #SPEED_LEVELS then speedIndex = 1 end
			refreshNittyControls()
			updateAutoFarmStateText(Config.AUTO_FARM, Flying, Noclip, getSpeedMultiplier(), flightEnabled, noclipEnabled)
			applyMovementSpeed()
			NittyStatus.Text = "Status: Movement speed set to " .. tostring(getSpeedMultiplier()) .. "X"
		end)
		NittySpeedButton.LayoutOrder = 7

		local NittyFlyButton = pageButton(NittyAutoFarmPage, "FLY: OFF", function()
			flightEnabled = not flightEnabled
			if flightEnabled then
				if startFlight() then
					NittyStatus.Text = "Status: Flight movement enabled"
				else
					flightEnabled = false
					NittyStatus.Text = "Status: Character is not ready for flight"
				end
			else
				stopFlight()
				NittyStatus.Text = "Status: Flight movement disabled"
			end
			refreshNittyControls()
			updateAutoFarmStateText(Config.AUTO_FARM, Flying, Noclip, getSpeedMultiplier(), flightEnabled, noclipEnabled)
		end)
		NittyFlyButton.LayoutOrder = 8

		local NittyNoclipButton = pageButton(NittyAutoFarmPage, "NOCLIP: OFF", function()
			if noclipEnabled then
				stopNoclip()
				NittyStatus.Text = "Status: Noclip disabled"
			else
				startNoclip()
				NittyStatus.Text = "Status: Noclip enabled"
			end
			refreshNittyControls()
			updateAutoFarmStateText(Config.AUTO_FARM, Flying, Noclip, getSpeedMultiplier(), flightEnabled, noclipEnabled)
		end)
		NittyNoclipButton.LayoutOrder = 9

		refreshNittyControls = function()
			NittySpeedButton.Text = "SPEED: " .. tostring(getSpeedMultiplier()) .. "X"
			NittyFlyButton.Text = "FLY: " .. (flightEnabled and "ON" or "OFF")
			NittyFlyButton.TextColor3 = flightEnabled and GREEN or WHITE
			NittyNoclipButton.Text = "NOCLIP: " .. (noclipEnabled and "ON" or "OFF")
			NittyNoclipButton.TextColor3 = noclipEnabled and GREEN or WHITE
		end

		refreshNittyControls()

		RunService.Heartbeat:Connect(function()
			if noclipEnabled then
				setCharacterNoclip(true)
			end
			if not running then return end

			local _, humanoid, root = getCharacter()
			if not humanoid or humanoid.Health <= 0 or not root then
				target = nil
				stopMovement()
				NittyStatus.Text = "Status: Waiting for character..."
				NittyTarget.Text = "Target: none"
				return
			end

			local now = os.clock()
			if not target or not target.Parent or not isAllowedNitty(target) then
				if now - lastSearch >= SEARCH_INTERVAL then
					lastSearch = now
					local newTarget = findNearestNitty(root.Position)
					if newTarget ~= target then
						target = newTarget
						teleportedToTarget = false
					end
				end
			end

			if not target then
				teleportedToTarget = false
				stopMovement()
				NittyStatus.Text = "Status: No Nitty found."
				NittyTarget.Text = "Target: none"
				return
			end

			local targetRoot = getRoot(target)
			local targetHumanoid = target:FindFirstChildOfClass("Humanoid")
			if not targetRoot or not targetHumanoid or targetHumanoid.Health <= 0 then
				target = nil
				teleportedToTarget = false
				moving = false
				return
			end

			local distance = (targetRoot.Position - root.Position).Magnitude
			NittyTarget.Text = string.format("Target: %s • %.0f studs", target.Name, distance)

			-- Direct Nitty teleport: use the same teleport behavior as the
			-- other Teleport page buttons, then stop targeting this Nitty.
			if not teleportedToTarget then
				stopMovement()

				if teleportToNitty(targetRoot) then
					teleportedToTarget = true
					NittyStatus.Text = "Status: Teleported to " .. target.Name
				end
			end

			if attackTarget(target) then
				NittyStatus.Text = "Status: Attacked " .. target.Name
			end
			if targetHumanoid.Health <= 0 then
				target = nil
				teleportedToTarget = false
			end
		end)
	end


	-- PLAYERS PAGE
	--============================================================

	pageTitle(PlayersPage, "Players")

	--============================================================
	-- PLAYER SELECTION / SPECTATE / INVENTORY
	--============================================================

	SelectedSpectatePlayer = nil
	SpectatingPlayer = nil
	InventoryViewingPlayer = nil
	SpectateViewMode = "First Person"

	PlayerListScroll = create("ScrollingFrame", {
		Name = "PlayerListScroll",
		BackgroundColor3 = PANEL,
		BackgroundTransparency = 0.08,
		Size = UDim2.new(1, -10, 0, 240),
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = BLUE,
		ScrollBarImageTransparency = 0.15,
		Visible = true,
		LayoutOrder = 2,
	}, PlayersPage)

	corner(PlayerListScroll, 9)
	stroke(PlayerListScroll, BORDER, 1, 0.3)

	create("UIPadding", {
		PaddingTop = UDim.new(0, 6),
		PaddingLeft = UDim.new(0, 6),
		PaddingRight = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 6),
	}, PlayerListScroll)

	create("UIListLayout", {
		Padding = UDim.new(0, 6),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}, PlayerListScroll)

	SelectedPlayerStatus = label(
		PlayersPage,
		"Selected Player: None",
		UDim2.new(1, -10, 0, 30),
		UDim2.fromOffset(0, 0),
		12
	)
	SelectedPlayerStatus.TextColor3 = MUTED
	SelectedPlayerStatus.LayoutOrder = 3

	SpectateButton = pageButton(
		PlayersPage,
		"Spectate: OFF"
	)
	SpectateButton.LayoutOrder = 4

	SpectateViewButton = button(
		PlayersPage,
		"View: FIRST PERSON",
		UDim2.fromOffset(0, 0),
		UDim2.new(1, -10, 0, 38)
	)
	SpectateViewButton.LayoutOrder = 5

	InventoryButton = pageButton(
		PlayersPage,
		"Inventory: OFF"
	)
	InventoryButton.LayoutOrder = 6

	InventoryStatus = label(
		PlayersPage,
		"Inventory: None",
		UDim2.new(1, -10, 0, 30),
		UDim2.fromOffset(0, 0),
		12
	)
	InventoryStatus.TextColor3 = MUTED
	InventoryStatus.LayoutOrder = 7

	InventoryScroll = create("ScrollingFrame", {
		Name = "InventoryScroll",
		BackgroundColor3 = PANEL,
		BackgroundTransparency = 0.08,
		Size = UDim2.new(1, -10, 0, 150),
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = BLUE,
		ScrollBarImageTransparency = 0.15,
		Visible = false,
		LayoutOrder = 8,
	}, PlayersPage)

	corner(InventoryScroll, 9)
	stroke(InventoryScroll, BORDER, 1, 0.3)

	create("UIPadding", {
		PaddingTop = UDim.new(0, 6),
		PaddingLeft = UDim.new(0, 6),
		PaddingRight = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 6),
	}, InventoryScroll)

	create("UIListLayout", {
		Padding = UDim.new(0, 6),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}, InventoryScroll)

	function clearInventoryButtons()
		for _, child in ipairs(InventoryScroll:GetChildren()) do
			if child:IsA("TextButton") then
				child:Destroy()
			end
		end
	end

	function getInventoryItems(player)
		local items = {}

		if not player then
			return items
		end

		local backpack = player:FindFirstChildOfClass("Backpack")

		if backpack then
			for _, item in ipairs(backpack:GetChildren()) do
				if item:IsA("Tool") then
					table.insert(items, {
						Name = item.Name,
						Location = "Backpack"
					})
				end
			end
		end

		if player.Character then
			for _, item in ipairs(player.Character:GetChildren()) do
				if item:IsA("Tool") then
					table.insert(items, {
						Name = item.Name,
						Location = "Equipped"
					})
				end
			end
		end

		return items
	end

	function showPlayerInventory(player)
		clearInventoryButtons()

		if not player then
			InventoryStatus.Text = "Inventory: None"
			InventoryStatus.TextColor3 = MUTED
			return
		end

		InventoryViewingPlayer = player
		InventoryStatus.Text = "Inventory: " .. player.DisplayName .. " (" .. player.Name .. ")"
		InventoryStatus.TextColor3 = BLUE2

		local items = getInventoryItems(player)

		if #items == 0 then
			local emptyButton = button(
				InventoryScroll,
				"Inventory Empty",
				UDim2.fromOffset(0, 0),
				UDim2.new(1, -5, 0, 40)
			)
			emptyButton.LayoutOrder = 1
			emptyButton.AutoButtonColor = false
			return
		end

		for index, item in ipairs(items) do
			local itemButton = button(
				InventoryScroll,
				item.Name .. "  [" .. item.Location .. "]",
				UDim2.fromOffset(0, 0),
				UDim2.new(1, -5, 0, 40)
			)

			itemButton.LayoutOrder = index
			itemButton.AutoButtonColor = false
		end
	end

	function stopInventoryView()
		InventoryViewingPlayer = nil
		InventoryScroll.Visible = false
		InventoryButton.Text = "Inventory: OFF"
		InventoryButton.TextColor3 = WHITE
		InventoryStatus.Text = "Inventory: None"
		InventoryStatus.TextColor3 = MUTED
		clearInventoryButtons()
	end

	function startInventoryView()
		local player = SelectedSpectatePlayer

		if not player or player == LocalPlayer then
			stopInventoryView()
			return
		end

		showPlayerInventory(player)
		InventoryScroll.Visible = true
		InventoryButton.Text = "Inventory: ON"
		InventoryButton.TextColor3 = GREEN
	end

	InventoryButton.MouseButton1Click:Connect(function()
		if InventoryViewingPlayer then
			stopInventoryView()
		else
			startInventoryView()
		end
	end)

	function getTargetRoot(player)
		if not player or not player.Parent then
			return nil, nil
		end

		local character = player.Character
		if not character or not character.Parent then
			return nil, nil
		end

		local humanoid = character:FindFirstChildOfClass("Humanoid")
		local root = character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart

		if not humanoid or humanoid.Health <= 0 or not root then
			return nil, humanoid
		end

		return root, humanoid
	end

	--============================================================
	-- OCEANA SPECTATE CAMERA
	-- Third-person orbit camera matching the reference
	--============================================================

	SpectateDistance = 10
	SpectateMinDistance = 4
	SpectateMaxDistance = 22
	SpectateViewMode = "Third Person"

	local SpectateDragging = false
	local SpectateYaw = 0
	local SpectatePitch = math.rad(-8)
	local SpectateSensitivity = 0.0045
	local SpectateTouchInput = nil

	local function getSpectateHead(player)
		if not player or not player.Parent then
			return nil
		end

		local character = player.Character
		if not character or not character.Parent then
			return nil
		end

		local head = character:FindFirstChild("Head")
		if head and head:IsA("BasePart") then
			return head
		end

		return character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart
	end

	local function resetSpectateOrbit()
		SpectatePitch = math.rad(-8)

		local root = getTargetRoot(SpectatingPlayer)
		if root then
			local look = root.CFrame.LookVector
			SpectateYaw = math.atan2(-look.X, -look.Z)
		else
			SpectateYaw = 0
		end
	end

	local function stopSpectating()
		SpectatingPlayer = nil
		SpectateDragging = false
		SpectateTouchInput = nil
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default

		local camera = workspace.CurrentCamera
		if camera then
			camera.CameraType = Enum.CameraType.Custom
			if Humanoid and Humanoid.Parent then
				camera.CameraSubject = Humanoid
			end
		end

		SpectateButton.Text = "Spectate: OFF"
		SpectateButton.TextColor3 = WHITE
	end

	local function updateSpectateCamera()
		if not SpectatingPlayer then
			return
		end

		if not SpectatingPlayer.Parent then
			stopSpectating()
			return
		end

		local camera = workspace.CurrentCamera
		local root, humanoid = getTargetRoot(SpectatingPlayer)
		local head = getSpectateHead(SpectatingPlayer)

		if not camera or not root or not humanoid or not head then
			return
		end

		camera.CameraType = Enum.CameraType.Scriptable
		camera.CameraSubject = nil

		-- Keep the camera centered around the selected player's body,
		-- while allowing the spectator to orbit freely around them.
		local focus = head.Position + Vector3.new(0, 0.15, 0)
		local rotation = CFrame.fromOrientation(SpectatePitch, SpectateYaw, 0)

		if SpectateViewMode == "First Person" then
			-- Preserve the first-person option while still allowing independent look-around.
			camera.CFrame = head.CFrame * rotation
		else
			local offset = rotation:VectorToWorldSpace(
				Vector3.new(0, 0, SpectateDistance)
			)

			camera.CFrame = CFrame.lookAt(
				focus + offset,
				focus
			)
		end

		SpectateButton.Text = "Spectate: ON"
		SpectateButton.TextColor3 = GREEN
	end

	local function spectateSelectedPlayer()
		local player = SelectedSpectatePlayer

		-- Stay locked to the player the user actually selected.
		if not player
			or player == LocalPlayer
			or not player.Parent then

			SpectateButton.Text = "Spectate: SELECT PLAYER"
			SpectateButton.TextColor3 = BLUE2
			return
		end

		stopInventoryView()
		SpectatingPlayer = player
		resetSpectateOrbit()
		updateSpectateCamera()
	end

	pcall(function()
		RunService:UnbindFromRenderStep("OCEANA_SpectateCamera")
	end)

	RunService:BindToRenderStep(
		"OCEANA_SpectateCamera",
		Enum.RenderPriority.Camera.Value + 1,
		function()
			updateSpectateCamera()
		end
	)

	-- PC: hold right mouse and drag to orbit around the selected player.
	UserInputService.InputBegan:Connect(function(input, processed)
		if processed or not SpectatingPlayer then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			SpectateDragging = true
			UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
		elseif input.UserInputType == Enum.UserInputType.Touch then
			SpectateDragging = true
			SpectateTouchInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if not SpectatingPlayer or not SpectateDragging then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseMovement then
			SpectateYaw -= input.Delta.X * SpectateSensitivity
			SpectatePitch = math.clamp(
				SpectatePitch - input.Delta.Y * SpectateSensitivity,
				math.rad(-75),
				math.rad(65)
			)
		elseif input.UserInputType == Enum.UserInputType.MouseWheel then
			SpectateDistance = math.clamp(
				SpectateDistance - input.Position.Z * 1.5,
				SpectateMinDistance,
				SpectateMaxDistance
			)
		elseif input.UserInputType == Enum.UserInputType.Touch
			and input == SpectateTouchInput then
			SpectateYaw -= input.Delta.X * SpectateSensitivity
			SpectatePitch = math.clamp(
				SpectatePitch - input.Delta.Y * SpectateSensitivity,
				math.rad(-75),
				math.rad(65)
			)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			SpectateDragging = false
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		elseif input.UserInputType == Enum.UserInputType.Touch
			and input == SpectateTouchInput then
			SpectateDragging = false
			SpectateTouchInput = nil
		end
	end)

	SpectateViewButton.MouseButton1Click:Connect(function()
		if SpectateViewMode == "First Person" then
			SpectateViewMode = "Third Person"
			SpectateViewButton.Text = "View: THIRD PERSON"
		else
			SpectateViewMode = "First Person"
			SpectateViewButton.Text = "View: FIRST PERSON"
		end

		if SpectatingPlayer then
			resetSpectateOrbit()
			updateSpectateCamera()
		end
	end)

	SpectateButton.MouseButton1Click:Connect(function()
		if SpectatingPlayer then
			stopSpectating()
		else
			spectateSelectedPlayer()
		end
	end)

	--============================================================
	-- PLAYER SELECTION
	--============================================================

	function selectSpectatePlayer(player)
		if not player or player == LocalPlayer or not player.Parent then
			return
		end

		SelectedSpectatePlayer = player
		SelectedPlayerStatus.Text =
			"Selected Player: " .. player.DisplayName .. " (" .. player.Name .. ")"
		SelectedPlayerStatus.TextColor3 = BLUE2

		if typeof(stopInventoryView) == "function" then
			stopInventoryView()
		end

		for _, child in ipairs(PlayerListScroll:GetChildren()) do
			if child:IsA("TextButton") then
				if child:GetAttribute("SelectedPlayer") == player.UserId then
					child.BackgroundColor3 = BLUE
					child.TextColor3 = WHITE
				else
					child.BackgroundColor3 = PANEL2
					child.TextColor3 = WHITE
				end
			end
		end
	end

	--============================================================
	-- PLAYER LIST
	--============================================================

	function refreshPlayersPage()
		for _, child in ipairs(PlayerListScroll:GetChildren()) do
			if child:IsA("TextButton") then
				child:Destroy()
			end
		end

		local players = {}

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= LocalPlayer then
				table.insert(players, player)
			end
		end

		table.sort(players, function(a, b)
			return string.lower(a.DisplayName) < string.lower(b.DisplayName)
		end)

		for index, player in ipairs(players) do
			local nameButton = button(
				PlayerListScroll,
				player.DisplayName .. " (" .. player.Name .. ")",
				UDim2.fromOffset(0, 0),
				UDim2.new(1, -5, 0, 38)
			)

			nameButton.LayoutOrder = index
			nameButton:SetAttribute("SelectedPlayer", player.UserId)

			if SelectedSpectatePlayer == player then
				nameButton.BackgroundColor3 = BLUE
			end

			nameButton.MouseButton1Click:Connect(function()
				selectSpectatePlayer(player)
			end)
		end
	end

	refreshPlayersPage()

	Players.PlayerAdded:Connect(function(player)
		task.wait(0.2)
		refreshPlayersPage()

		player.CharacterAdded:Connect(function()
			task.wait(0.5)

			if hasPlayerESPEnabled() then
				addESP(player)
			end

			if SpectatingPlayer == player then
				SpectateButton.Text = "Spectate: ON"
				SpectateButton.TextColor3 = GREEN
			end
		end)
	end)

	Players.PlayerRemoving:Connect(function(player)
		if SelectedSpectatePlayer == player then
			SelectedSpectatePlayer = nil
			SelectedPlayerStatus.Text = "Selected Player: None"
			SelectedPlayerStatus.TextColor3 = MUTED
		end

		if SpectatingPlayer == player then
			stopSpectating()
		end

		refreshPlayersPage()
	end)

	--============================================================
	-- SIDEBAR
	--============================================================

	pageNames = {
		"Information",
		"Player",
		"Players",
		"Visuals",
		"Combat",
		"Chat",
		"Name Changer",
		"Teleport",
		"Cars",
		"Settings",
		"Auto Farm",
		"Nitty AUTO FARM",
	}

	function createSidebarButton(name, index)
		local b = create("TextButton", {
			Name = name .. "Button",
			BackgroundColor3 = PANEL,
			Text = name,
			TextColor3 = MUTED,
			TextSize = 11,
			Font = Enum.Font.GothamMedium,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutoButtonColor = false,
			Size = UDim2.new(1, 0, 0, 36),
			LayoutOrder = index,
			ZIndex = 16,
		}, SidebarList)

		corner(b, 9)

		create("UIPadding", {
			PaddingLeft = UDim.new(0, 14),
		}, b)

		local accent = create("Frame", {
			Name = "Accent",
			BackgroundColor3 = BLUE,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(3, 20),
			Position = UDim2.fromOffset(0, 8),
			ZIndex = 17,
		}, b)

		corner(accent, 3)

		b.MouseEnter:Connect(function()
			if b:GetAttribute("Selected") then
				return
			end

			TweenService:Create(
				b,
				TweenInfo.new(0.12),
				{
					BackgroundColor3 = PANEL2,
					TextColor3 = WHITE
				}
			):Play()
		end)

		b.MouseLeave:Connect(function()
			if b:GetAttribute("Selected") then
				return
			end

			TweenService:Create(
				b,
				TweenInfo.new(0.12),
				{
					BackgroundColor3 = PANEL,
					TextColor3 = MUTED
				}
			):Play()
		end)

		sidebarButtons[name] = b

		return b
	end

	function showPage(name)
		for pageName, page in pairs(Pages) do
			page.Visible = pageName == name
		end

		for buttonName, b in pairs(sidebarButtons) do
			local selected = buttonName == name

			b:SetAttribute("Selected", selected)

			local accent = b:FindFirstChild("Accent")

			if selected then
				b.BackgroundColor3 =
					Color3.fromRGB(27, 48, 82)

				b.TextColor3 = WHITE

				if accent then
					accent.BackgroundTransparency = 0
				end
			else
				b.BackgroundColor3 = PANEL
				b.TextColor3 = MUTED

				if accent then
					accent.BackgroundTransparency = 1
				end
			end
		end
	end

	for index, name in ipairs(pageNames) do
		local b = createSidebarButton(name, index)

		b.MouseButton1Click:Connect(function()
			showPage(name)
		end)
	end

	showPage("Information")
	GUI:SetAttribute("OCEANA_LOADED", true)

	--============================================================
	-- DRAGGING
	--============================================================

	makeDraggable(MainFrame, TopBar)

	--============================================================
	-- MINIMIZE
	--============================================================

	Minimize.MouseButton1Click:Connect(function()
		Minimized = not Minimized

		MainContent.Visible = not Minimized
		Sidebar.Visible = not Minimized

		if Minimized then
			MainFrame.Size =
				UDim2.fromOffset(860, 58)
		else
			MainFrame.Size =
				UDim2.fromOffset(860, 560)
		end
	end)

	--============================================================
	-- CLOSE
	--============================================================

	CloseButton.MouseButton1Click:Connect(function()
		SilentAimEnabled = false
		AimTarget = nil
		LocalPlayer:SetAttribute("OCEANA_SilentAimEnabled", false)
		LocalPlayer:SetAttribute("OCEANA_SilentAimTargetUserId", 0)
		stopAutoFarm()
		stopFly()

		SkeletonESPEnabled = false
		DistanceESPEnabled = false
		HealthESPEnabled = false
		removeESP()

		GUI:Destroy()
	end)

	--============================================================
	-- RIGHT SHIFT
	--============================================================

	UserInputService.InputBegan:Connect(function(input, processed)
		if processed then
			return
		end

		if input.KeyCode == Enum.KeyCode.RightShift then
			MainFrame.Visible =
				not MainFrame.Visible

			MenuVisible =
				MainFrame.Visible
		end
	end)

	--============================================================
	-- MOBILE SHOW / UNSHOW BUTTON
	-- Mobile touch devices only; never shown on PC.
	--============================================================
	if UserInputService.TouchEnabled and not UserInputService.MouseEnabled then
		local MobileShowButton = create("TextButton", {
			Name = "MobileShowButton",
			BackgroundColor3 = PANEL2,
			TextColor3 = WHITE,
			Text = "Unshow",
			TextSize = 13,
			Font = Enum.Font.GothamBold,
			AutoButtonColor = true,
			Size = UDim2.fromOffset(78, 38),
			Position = UDim2.new(1, -88, 0, 12),
			ZIndex = 100,
		}, GUI)
		corner(MobileShowButton, 10)
		stroke(MobileShowButton, BORDER, 1, 0.15)

		MobileShowButton.Activated:Connect(function()
			MainFrame.Visible = not MainFrame.Visible
			MenuVisible = MainFrame.Visible
			MobileShowButton.Text = MainFrame.Visible and "Unshow" or "Show"
		end)
	end

	--============================================================
	-- FLY INPUT
	--============================================================

	FlyKeys = {
		W = false,
		A = false,
		S = false,
		D = false,
		Space = false,
		LeftControl = false,
	}

	UserInputService.InputBegan:Connect(function(input, processed)
		if processed then
			return
		end

		if input.KeyCode == Enum.KeyCode.W then
			FlyKeys.W = true

		elseif input.KeyCode == Enum.KeyCode.A then
			FlyKeys.A = true

		elseif input.KeyCode == Enum.KeyCode.S then
			FlyKeys.S = true

		elseif input.KeyCode == Enum.KeyCode.D then
			FlyKeys.D = true

		elseif input.KeyCode == Enum.KeyCode.Space then
			FlyKeys.Space = true

		elseif input.KeyCode == Enum.KeyCode.LeftControl then
			FlyKeys.LeftControl = true
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.W then
			FlyKeys.W = false

		elseif input.KeyCode == Enum.KeyCode.A then
			FlyKeys.A = false

		elseif input.KeyCode == Enum.KeyCode.S then
			FlyKeys.S = false

		elseif input.KeyCode == Enum.KeyCode.D then
			FlyKeys.D = false

		elseif input.KeyCode == Enum.KeyCode.Space then
			FlyKeys.Space = false

		elseif input.KeyCode == Enum.KeyCode.LeftControl then
			FlyKeys.LeftControl = false

		elseif input.UserInputType ==
			Enum.UserInputType.MouseButton2 then

			AimHolding = false
			CurrentTarget = nil
		end
	end)

	--============================================================
	-- MOBILE FLY CONTROLS
	-- Touch devices only; Nitty AUTO FARM is untouched.
	--============================================================
	if UserInputService.TouchEnabled and not UserInputService.MouseEnabled then
		local MobileFlyGui = create("ScreenGui", {
			Name = "OCEANA Mobile Fly Controls",
			ResetOnSpawn = false,
			IgnoreGuiInset = true,
			DisplayOrder = 60,
		}, PlayerGui)

		local MobileFlyFrame = create("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(220, 190),
			Position = UDim2.new(1, -235, 1, -205),
		}, MobileFlyGui)

		local function mobileFlyButton(name, text, position)
			local b = create("TextButton", {
				Name = name,
				BackgroundColor3 = PANEL2,
				BackgroundTransparency = 0.15,
				Text = text,
				TextColor3 = WHITE,
				TextSize = 16,
				Font = Enum.Font.GothamBold,
				AutoButtonColor = true,
				Size = UDim2.fromOffset(58, 50),
				Position = position,
			}, MobileFlyFrame)
			corner(b, 12)
			stroke(b, BORDER, 1, 0.15)
			return b
		end

		local mobileButtons = {
			W = mobileFlyButton("Forward", "▲", UDim2.fromOffset(81, 0)),
			A = mobileFlyButton("Left", "◀", UDim2.fromOffset(20, 52)),
			S = mobileFlyButton("Back", "▼", UDim2.fromOffset(81, 52)),
			D = mobileFlyButton("Right", "▶", UDim2.fromOffset(142, 52)),
			Space = mobileFlyButton("Up", "UP", UDim2.fromOffset(20, 110)),
			LeftControl = mobileFlyButton("Down", "DOWN", UDim2.fromOffset(142, 110)),
		}

		local function bindHold(buttonObject, keyName)
			buttonObject.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Touch
					or input.UserInputType == Enum.UserInputType.MouseButton1 then
					FlyKeys[keyName] = true
				end
			end)

			buttonObject.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Touch
					or input.UserInputType == Enum.UserInputType.MouseButton1 then
					FlyKeys[keyName] = false
				end
			end)
		end

		for keyName, buttonObject in pairs(mobileButtons) do
			bindHold(buttonObject, keyName)
		end

		RunService.RenderStepped:Connect(function()
			MobileFlyGui.Enabled = Flying
		end)
	end

	--============================================================
	-- RIGHT MOUSE AIM
	--============================================================

	UserInputService.InputBegan:Connect(function(input, processed)
		if processed then
			return
		end

		if input.UserInputType ==
			Enum.UserInputType.MouseButton2 then

			AimHolding = true
		end
	end)

	--============================================================
	-- NOCLIP
	--============================================================

	NoclipOriginalCollision = {}

	function setNoclipCollision(enabled)
		if not Character then
			return
		end

		for _, part in ipairs(Character:GetDescendants()) do
			if part:IsA("BasePart") then
				if enabled then
					if NoclipOriginalCollision[part] == nil then
						NoclipOriginalCollision[part] = part.CanCollide
					end
					part.CanCollide = false
				elseif NoclipOriginalCollision[part] ~= nil then
					part.CanCollide = NoclipOriginalCollision[part]
					NoclipOriginalCollision[part] = nil
				end
			end
		end
	end

	RunService.Stepped:Connect(function()
		setNoclipCollision(Noclip)
	end)

	--============================================================
	-- FLY LOOP
	--============================================================

	RunService.RenderStepped:Connect(function()
		if not Flying then
			return
		end

		if not Character
			or not RootPart
			or not Humanoid then

			return
		end

		local camera = workspace.CurrentCamera

		if not camera then
			return
		end

		Humanoid.PlatformStand = true

		local direction = Vector3.zero

		if FlyKeys.W then
			direction += camera.CFrame.LookVector
		end

		if FlyKeys.S then
			direction -= camera.CFrame.LookVector
		end

		if FlyKeys.A then
			direction -= camera.CFrame.RightVector
		end

		if FlyKeys.D then
			direction += camera.CFrame.RightVector
		end

		if FlyKeys.Space then
			direction += Vector3.yAxis
		end

		if FlyKeys.LeftControl then
			direction -= Vector3.yAxis
		end

		if direction.Magnitude > 0 then
			direction = direction.Unit
		end

		if FlyBV then
			FlyBV.Velocity =
				direction * Config.FLY_SPEED
		end

		if FlyBG then
			local look =
				camera.CFrame.LookVector

			local flat =
				Vector3.new(
					look.X,
					0,
					look.Z
				)

			if flat.Magnitude > 0.01 then
				FlyBG.CFrame =
					CFrame.lookAt(
						RootPart.Position,
						RootPart.Position +
						flat.Unit
					)
			end
		end

		RootPart.AssemblyAngularVelocity =
			Vector3.zero
	end)

	--============================================================
	-- AUTO GRAB
	--============================================================

	RunService.RenderStepped:Connect(function()
		if not AutoGrab or not RootPart then
			return
		end

		for _, obj in ipairs(
			CollectionService:GetTagged("Grabbable")
		) do
			local part

			if obj:IsA("BasePart") then
				part = obj
			else
				part =
					obj:FindFirstChildWhichIsA(
						"BasePart",
						true
					)
			end

			if part then
				local distance =
					(part.Position - RootPart.Position).Magnitude

				if distance <= Config.GRAB_RANGE then
					pcall(function()
						local targetCFrame =
							RootPart.CFrame *
							CFrame.new(0, 0, -2)

						if obj:IsA("Model") then
							obj:PivotTo(targetCFrame)
						else
							part.CFrame = targetCFrame
						end
					end)
				end
			end
		end
	end)

	--============================================================
	-- ESP LOOP
	--============================================================

	RunService.RenderStepped:Connect(function()
		for player, data in pairs(ESPObjects) do
			if not player.Parent then
				removeESP(player)

			elseif data.Root
				and data.Root.Parent
				and data.Humanoid
				and data.Humanoid.Parent then

				if data.Health then
					data.Health.Visible = HealthESPEnabled
					if HealthESPEnabled then
						data.Health.Text =
							"HP: " .. math.floor(data.Humanoid.Health)
					end
				end

				if data.Distance then
					data.Distance.Visible = DistanceESPEnabled
					if DistanceESPEnabled and RootPart then
						local distance = math.floor(
							(data.Root.Position - RootPart.Position).Magnitude
						)
						data.Distance.Text = distance .. " studs"
					end
				end
			end
		end

		if hasPlayerESPEnabled() then
			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= LocalPlayer
					and not ESPObjects[player] then

					addESP(player)
				end
			end
		end
	end)

	--============================================================
	-- AIM TARGET
	--============================================================

	function getAimTarget()
		local camera = workspace.CurrentCamera

		if not camera then
			return nil
		end

		local center =
			camera.ViewportSize / 2

		local best
		local bestDistance = math.huge

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= LocalPlayer
				and player.Character then

				if isWhitelistedTarget(player) then
					continue
				end

				if Config.TEAM_CHECK
					and player.Team == LocalPlayer.Team then

					continue
				end

				local humanoid =
					player.Character:FindFirstChildOfClass(
						"Humanoid"
					)

				local part =
					player.Character:FindFirstChild("Head")
					or player.Character:FindFirstChild("HumanoidRootPart")

				if humanoid
					and humanoid.Health > 0
					and part then

					local position, visible =
						camera:WorldToViewportPoint(
							part.Position
						)

					if visible and position.Z > 0 then
						local distance =
							(
								Vector2.new(
									position.X,
									position.Y
								) -
								center
							).Magnitude

						if distance <= Config.AIM_FOV * 5
							and distance < bestDistance then

							if Config.VISIBILITY_CHECK then
								local params =
									RaycastParams.new()

								params.FilterType =
									Enum.RaycastFilterType.Exclude

								params.FilterDescendantsInstances = {
									Character,
									player.Character
								}

								local ray =
									workspace:Raycast(
										camera.CFrame.Position,
										part.Position -
											camera.CFrame.Position,
										params
									)

								if ray then
									continue
								end
							end

							best = player
							bestDistance = distance
						end
					end
				end
			end
		end

		return best
	end

	--============================================================
	-- SILENT AIM TARGET PROVIDER
	--============================================================

	function getSilentAimPart()
		if not SilentAimEnabled then
			return nil, nil
		end

		local target = getAimTarget()
		if not target or not target.Character then
			return nil, nil
		end

		-- Re-check the shared whitelist at the final target stage as well.
		-- This guarantees a whitelisted player can never become the silent target,
		-- even if the whitelist changes while Silent Aim is already enabled.
		if isWhitelistedTarget(target) then
			return nil, nil
		end

		local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
		if not humanoid or humanoid.Health <= 0 then
			return nil, nil
		end

		local part =
			target.Character:FindFirstChild("Head")
			or target.Character:FindFirstChild("HumanoidRootPart")

		if not part then
			return nil, nil
		end

		return target, part
	end

	_G.OCEANA_GetSilentAimTarget = function()
		local target, part = getSilentAimPart()
		return target, part
	end

	_G.OCEANA_GetSilentAimDirection = function(origin)
		if typeof(origin) ~= "Vector3" then
			return nil
		end

		local _, part = getSilentAimPart()
		if not part then
			return nil
		end

		return part.Position - origin
	end

	RunService.RenderStepped:Connect(function()
		if not SilentAimEnabled then
			return
		end

		local target, part = getSilentAimPart()
		AimTarget = target

		if target and part then
			TargetLabel.Text = "Silent Target: " .. target.Name
		else
			TargetLabel.Text = "Silent Target: None"
		end

		LocalPlayer:SetAttribute("OCEANA_SilentAimEnabled", true)
		LocalPlayer:SetAttribute("OCEANA_SilentAimTargetUserId", target and target.UserId or 0)
	end)

	--============================================================
	-- AIM LOOP
	--============================================================

	RunService.RenderStepped:Connect(function()
		if not AimAssist
			or not AimHolding then

			return
		end

		local camera =
			workspace.CurrentCamera

		if not camera then
			return
		end

		AimTarget =
			AimTarget or getAimTarget()

		if not AimTarget
			or not AimTarget.Character then

			AimTarget = nil
			return
		end

		local targetPart =
			AimTarget.Character:FindFirstChild("Head")
			or AimTarget.Character:FindFirstChild("HumanoidRootPart")

		local targetHumanoid =
			AimTarget.Character:FindFirstChildOfClass(
				"Humanoid"
			)

		if not targetPart
			or not targetHumanoid
			or targetHumanoid.Health <= 0 then

			AimTarget = nil
			return
		end

		local alpha =
			math.clamp(
				Config.AIM_STRENGTH / 200,
				0.05,
				1
			)

		camera.CFrame =
			camera.CFrame:Lerp(
				CFrame.lookAt(
					camera.CFrame.Position,
					targetPart.Position
				),
				alpha
			)
	end)

	--============================================================
	-- INSTANT PICKUP
	--============================================================

	ProximityPromptService.PromptShown:Connect(function(prompt)
		if Config.INSTANT_PICKUP then
			prompt.HoldDuration = 0
		end
	end)

	--============================================================
	-- CHARACTER / ESP UPDATES
	--============================================================

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			player.CharacterAdded:Connect(function()
				task.wait(0.5)

				if hasPlayerESPEnabled() then
					addESP(player)
				end
			end)
		end
	end

	--============================================================
	-- KEY UNLOCK
	--============================================================

	unlocked = false

	function unlock()
		if unlocked then
			return
		end

		local enteredKey = tostring(KeyBox.Text or "")
		if not Config.ACCESS_KEYS[enteredKey] then
			KeyStatus.Text = "INVALID ACCESS KEY"
			KeyStatus.TextColor3 = RED
			KeyBox.Text = ""
			return
		end

		-- Prefer the real server-side check when the RemoteFunction is installed.
		-- If this is running as a client-only script, fall back to the local
		-- UserId mapping so the key screen does not get stuck on SERVER AUTH NOT INSTALLED.
		local authRemote = ReplicatedStorage:FindFirstChild("OCEANA_KeyAuth")
		local authorized = false
		local message = "KEY NOT ASSIGNED TO THIS ACCOUNT"

		if authRemote and authRemote:IsA("RemoteFunction") then
			local ok, serverAuthorized, serverMessage = pcall(function()
				return authRemote:InvokeServer(enteredKey)
			end)

			if ok then
				authorized = serverAuthorized == true
				message = tostring(serverMessage or message)
			else
				message = "SERVER AUTH ERROR"
			end
		else
			local ownerUserId = CLIENT_KEY_OWNERS[enteredKey]
			if type(ownerUserId) == "number" and LocalPlayer.UserId == ownerUserId then
				authorized = true
				message = "ACCESS GRANTED"
			end
		end

		if not authorized then
			KeyStatus.Text = message
			KeyStatus.TextColor3 = RED
			KeyBox.Text = ""
			return
		end

		unlocked = true

			KeyStatus.Text =
				"ACCESS GRANTED"

			KeyStatus.TextColor3 =
				GREEN

			TweenService:Create(
				KeyFrame,
				TweenInfo.new(
					0.25,
					Enum.EasingStyle.Quint
				),
				{
					Size = UDim2.fromOffset(430, 285)
				}
			):Play()

			task.wait(0.25)

			KeyFrame.Visible = false
			KeyGlow.Visible = false
			MainFrame.Visible = true

	end

	UnlockButton.MouseButton1Click:Connect(unlock)

	KeyBox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			unlock()
		end
	end)

	--============================================================
	-- PUBLIC REFERENCES
	--============================================================

	_G.OCEANAGUI = {
		GUI = GUI,

		KeyFrame = KeyFrame,
		KeyBox = KeyBox,
		KeyStatus = KeyStatus,
		UnlockButton = UnlockButton,

		MainFrame = MainFrame,
		MainContent = MainContent,
		Sidebar = Sidebar,

		Pages = Pages,
		SidebarButtons = sidebarButtons,

		ShowPage = showPage,
	}



	--============================================================
	-- FINAL STARTUP
	--============================================================

	print("========================================")
	print("[OCEANA] Combined utility loaded")
	print("[OCEANA] Walk Speed Toggle loaded")
	print("[OCEANA] Delivery system loaded")
	print("[OCEANA] Auto Farm loaded")
	print("[OCEANA] Player ESP loaded")
	print("[OCEANA] Players spectate + inventory switches loaded")
	print("[OCEANA] RightShift = Menu")
	print("[OCEANA] Multiple access keys enabled")
	print("[OCEANA] Silent Aim target provider loaded")
	print("[OCEANA] Silent Aim uses Utility whitelist")
	print("========================================")
