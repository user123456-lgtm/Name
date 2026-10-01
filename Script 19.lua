local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

--============================================================
-- OCEANA ONE-ACCOUNT-PER-KEY SERVER AUTH
--============================================================
-- This same source can be placed in BOTH:
--   1) ServerScriptService (server auth branch)
--   2) StarterPlayer > StarterPlayerScripts (client GUI branch)
-- Replace each 0 below with the Roblox UserId that owns that key.
-- A UserId can only own one key in this table.

if RunService:IsServer() then
	local KEY_OWNERS = {
		["Carson19235"] = 9489777743,
		["AXZDADS1923"] = 8336401677,
		["SDAWRS8123"] = 10910089999,
		["KLSDWT3245"] = 11135058989,
		["Mzino"] = 10980967466,
		["SOTV"] = 7335573976,
		["ILOVEMYDOG"] = 10251358614,
	["kcfrmdacv"] = 2028754348,
	["1234"] = 3471832372,
		["OCEANA-001-KEY"] = 0,
		["OCEANA-002-KEY"] = 0,
		["OCEANA-003-KEY"] = 0,
		["OCEANA-004-KEY"] = 0,
		["OCEANA-005-KEY"] = 0,
		["OCEANA-006-KEY"] = 0,
		["OCEANA-007-KEY"] = 0,
		["OCEANA-008-KEY"] = 0,
		["OCEANA-009-KEY"] = 0,
		["OCEANA-010-KEY"] = 0,
		["OCEANA-011-KEY"] = 0,
		["OCEANA-012-KEY"] = 0,
		["OCEANA-013-KEY"] = 0,
		["OCEANA-014-KEY"] = 0,
		["OCEANA-015-KEY"] = 0,
		["OCEANA-016-KEY"] = 0,
		["OCEANA-017-KEY"] = 0,
		["OCEANA-018-KEY"] = 0,
		["OCEANA-019-KEY"] = 0,
		["OCEANA-020-KEY"] = 0,
		["OCEANA-021-KEY"] = 0,
		["OCEANA-022-KEY"] = 0,
		["OCEANA-023-KEY"] = 0,
		["OCEANA-024-KEY"] = 0,
		["OCEANA-025-KEY"] = 0,
		["OCEANA-026-KEY"] = 0,
		["OCEANA-027-KEY"] = 0,
		["OCEANA-028-KEY"] = 0,
		["OCEANA-029-KEY"] = 0,
		["OCEANA-030-KEY"] = 0,
		["OCEANA-031-KEY"] = 0,
		["OCEANA-032-KEY"] = 0,
		["OCEANA-033-KEY"] = 0,
		["OCEANA-034-KEY"] = 0,
		["OCEANA-035-KEY"] = 0,
		["OCEANA-036-KEY"] = 0,
		["OCEANA-037-KEY"] = 0,
		["OCEANA-038-KEY"] = 0,
		["OCEANA-039-KEY"] = 0,
		["OCEANA-040-KEY"] = 0,
		["OCEANA-041-KEY"] = 0,
		["OCEANA-042-KEY"] = 0,
		["OCEANA-043-KEY"] = 0,
		["OCEANA-044-KEY"] = 0,
		["OCEANA-045-KEY"] = 0,
		["OCEANA-046-KEY"] = 0,
		["OCEANA-047-KEY"] = 0,
		["OCEANA-048-KEY"] = 0,
		["OCEANA-049-KEY"] = 0,
		["OCEANA-050-KEY"] = 0,
		["OCEANA-051-KEY"] = 0,
		["OCEANA-052-KEY"] = 0,
		["OCEANA-053-KEY"] = 0,
		["OCEANA-054-KEY"] = 0,
		["OCEANA-055-KEY"] = 0,
		["OCEANA-056-KEY"] = 0,
		["OCEANA-057-KEY"] = 0,
		["OCEANA-058-KEY"] = 0,
		["OCEANA-059-KEY"] = 0,
		["OCEANA-060-KEY"] = 0,
		["OCEANA-061-KEY"] = 0,
		["OCEANA-062-KEY"] = 0,
		["OCEANA-063-KEY"] = 0,
		["OCEANA-064-KEY"] = 0,
		["OCEANA-065-KEY"] = 0,
		["OCEANA-066-KEY"] = 0,
		["OCEANA-067-KEY"] = 0,
		["OCEANA-068-KEY"] = 0,
		["OCEANA-069-KEY"] = 0,
		["OCEANA-070-KEY"] = 0,
		["OCEANA-071-KEY"] = 0,
		["OCEANA-072-KEY"] = 0,
		["OCEANA-073-KEY"] = 0,
		["OCEANA-074-KEY"] = 0,
		["OCEANA-075-KEY"] = 0,
		["OCEANA-076-KEY"] = 0,
		["OCEANA-077-KEY"] = 0,
		["OCEANA-078-KEY"] = 0,
		["OCEANA-079-KEY"] = 0,
		["OCEANA-080-KEY"] = 0,
		["OCEANA-081-KEY"] = 0,
		["OCEANA-082-KEY"] = 0,
		["OCEANA-083-KEY"] = 0,
		["OCEANA-084-KEY"] = 0,
		["OCEANA-085-KEY"] = 0,
		["OCEANA-086-KEY"] = 0,
		["OCEANA-087-KEY"] = 0,
		["OCEANA-088-KEY"] = 0,
		["OCEANA-089-KEY"] = 0,
		["OCEANA-090-KEY"] = 0,
		["OCEANA-091-KEY"] = 0,
		["OCEANA-092-KEY"] = 0,
		["OCEANA-093-KEY"] = 0,
		["OCEANA-094-KEY"] = 0,
		["OCEANA-095-KEY"] = 0,
		["OCEANA-096-KEY"] = 0,
		["OCEANA-097-KEY"] = 0,
		["OCEANA-098-KEY"] = 0,
		["OCEANA-099-KEY"] = 0,
		["OCEANA-100-KEY"] = 0,
	}

	local seenOwners = {}
	for key, userId in pairs(KEY_OWNERS) do
		if type(userId) == "number" and userId > 0 then
			if seenOwners[userId] then
				warn("[OCEANA] Duplicate UserId assigned to " .. tostring(seenOwners[userId]) .. " and " .. key)
			else
				seenOwners[userId] = key
			end
		end
	end

	local authRemote = ReplicatedStorage:FindFirstChild("OCEANA_KeyAuth")
	if authRemote and not authRemote:IsA("RemoteFunction") then
		authRemote:Destroy()
		authRemote = nil
	end

	if not authRemote then
		authRemote = Instance.new("RemoteFunction")
		authRemote.Name = "OCEANA_KeyAuth"
		authRemote.Parent = ReplicatedStorage
	end

	authRemote.OnServerInvoke = function(player, enteredKey)
		if type(enteredKey) ~= "string" then
			return false, "INVALID ACCESS KEY"
		end

		local ownerUserId = KEY_OWNERS[enteredKey]
		if type(ownerUserId) ~= "number" or ownerUserId <= 0 then
			return false, "KEY NOT CONFIGURED"
		end

		if player.UserId ~= ownerUserId then
			return false, "KEY NOT ASSIGNED TO THIS ACCOUNT"
		end

		return true, "ACCESS GRANTED"
	end

	print("[OCEANA] One-account-per-key server authentication loaded")
else
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

	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	--============================================================
	-- MAX MAP RENDER / STREAMING DISTANCE
	--============================================================
	pcall(function()
		workspace.StreamingTargetRadius = 1000000
	end)
	pcall(function()
		workspace.StreamingMinRadius = 1000000
	end)
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local CollectionService = game:GetService("CollectionService")
	local ProximityPromptService = game:GetService("ProximityPromptService")
	local TweenService = game:GetService("TweenService")

	local LocalPlayer = Players.LocalPlayer
	local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

	--============================================================
	-- CONFIG
	--============================================================

	local Config = {
		ACCESS_KEYS = {
			["Carson19235"] = true,
			["AXZDADS1923"] = true,
			["SDAWRS8123"] = true,
			["KLSDWT3245"] = true,
			["Mzino"] = true,
			["SOTV"] = true,
			["ILOVEMYDOG"] = true,
			["kcfrmdacv"] = true,
			["1234"] = true,
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
	local CLIENT_KEY_OWNERS = {
		["Carson19235"] = 9489777743,
		["AXZDADS1923"] = 8336401677,
		["SDAWRS8123"] = 10910089999,
		["KLSDWT3245"] = 11135058989,
		["Mzino"] = 10980967466,
		["SOTV"] = 7335573976,
		["ILOVEMYDOG"] = 10251358614,
	["kcfrmdacv"] = 2028754348,
	["1234"] = 3471832372,
	}

	--============================================================
	-- STATE
	--============================================================

	local Character
	local Humanoid
	local RootPart

	local Flying = false
	local Noclip = false
	local AutoGrab = false
	local SkeletonESPEnabled = false
	local NormalESPEnabled = false
	local DistanceESPEnabled = false
	local HealthESPEnabled = false
	local AimAssist = false
	local AimHolding = false

	local CurrentTarget = nil
	local AimTarget = nil
	local SilentAimEnabled = false
	local SharedWhitelist = {}

	local function isWhitelistedTarget(player)
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

	local FlyBV = nil
	local FlyBG = nil

	local MenuVisible = true
	local Minimized = false

	local ESPObjects = {}


	local CurrentBike = nil
	local UsedBikes = {}

	local AutoFarmRunning = false

	local SOURCE_A_POSITION = Vector3.new(0, 0, 0)
	local DELIVERY_ZONE_POSITION = nil

	--============================================================
	-- GUI REFERENCES
	--============================================================

	local GUI
	local MainFrame
	local MainContent
	local Sidebar

	local KeyFrame
	local KeyBox
	local KeyStatus

	local StatusText
	local BikeText
	local AutoFarmButton

	local Pages = {}
	local sidebarButtons = {}

	--============================================================
	-- CARSON COLORS
	--============================================================

	local BG = Color3.fromRGB(6, 7, 12)
	local PANEL = Color3.fromRGB(11, 13, 21)
	local PANEL2 = Color3.fromRGB(17, 20, 31)
	local PANEL3 = Color3.fromRGB(22, 26, 40)

	local WHITE = Color3.fromRGB(245, 247, 255)
	local MUTED = Color3.fromRGB(145, 151, 170)

	local BLUE = Color3.fromRGB(75, 145, 255)
	local BLUE2 = Color3.fromRGB(105, 175, 255)

	local GREEN = Color3.fromRGB(75, 230, 135)
	local RED = Color3.fromRGB(255, 75, 95)

	local BORDER = Color3.fromRGB(40, 47, 68)

	--============================================================
	-- CHARACTER
	--============================================================

	local function applyWalkSpeed()
		if not Humanoid or not Humanoid.Parent then
			return
		end

		if Config.WALK_SPEED_ENABLED then
			Humanoid.WalkSpeed = Config.WALK_SPEED
		else
			Humanoid.WalkSpeed = Config.DEFAULT_WALK_SPEED
		end
	end

	local function applyJumpPower()
		if not Humanoid or not Humanoid.Parent then
			return
		end

		Humanoid.UseJumpPower = true
		Humanoid.JumpPower = Config.JUMP_POWER
	end

	local function setupCharacter(character)
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

	local function create(className, properties, parent)
		local object = Instance.new(className)

		for property, value in pairs(properties or {}) do
			object[property] = value
		end

		object.Parent = parent

		return object
	end

	local function corner(object, radius)
		local c = Instance.new("UICorner")
		c.CornerRadius = UDim.new(0, radius or 8)
		c.Parent = object
		return c
	end

	local function stroke(object, color, thickness, transparency)
		local s = Instance.new("UIStroke")
		s.Color = color or BORDER
		s.Thickness = thickness or 1
		s.Transparency = transparency or 0.35
		s.Parent = object
		return s
	end

	local function label(parent, text, size, position, fontSize)
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

	local function makeDraggable(frame, handle)
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

	local function button(parent, text, position, size)
		local b = create("TextButton", {
			BackgroundColor3 = PANEL2,
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

	local oldGui = PlayerGui:FindFirstChild("OCEANA Script")

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

	--============================================================
	-- KEY SCREEN
	--============================================================

	local KeyGlow = create("Frame", {
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

	local KeyAccent = create("Frame", {
		BackgroundColor3 = BLUE,
		Size = UDim2.new(1, -28, 0, 3),
		Position = UDim2.fromOffset(14, 0),
		ZIndex = 8,
	}, KeyFrame)

	corner(KeyAccent, 3)

	local KeyLogo = create("Frame", {
		BackgroundColor3 = BLUE,
		Size = UDim2.fromOffset(48, 48),
		Position = UDim2.fromOffset(25, 26),
		ZIndex = 8,
	}, KeyFrame)

	corner(KeyLogo, 13)

	local KeyLogoText = label(
		KeyLogo,
		"C",
		UDim2.fromScale(1, 1),
		UDim2.fromOffset(0, 0),
		23
	)

	KeyLogoText.TextXAlignment = Enum.TextXAlignment.Center
	KeyLogoText.Font = Enum.Font.GothamBlack

	local KeyTitle = label(
		KeyFrame,
		"OCEANA",
		UDim2.new(1, -100, 0, 26),
		UDim2.fromOffset(87, 24),
		20
	)

	KeyTitle.Font = Enum.Font.GothamBlack

	local KeySubtitle = label(
		KeyFrame,
		"SECURE ACCESS",
		UDim2.new(1, -100, 0, 18),
		UDim2.fromOffset(88, 48),
		10
	)

	KeySubtitle.TextColor3 = BLUE2
	KeySubtitle.Font = Enum.Font.GothamBold

	local KeyInfo = label(
		KeyFrame,
		"Enter your access key to continue.",
		UDim2.new(1, -50, 0, 22),
		UDim2.fromOffset(25, 82),
		12
	)

	KeyInfo.TextColor3 = MUTED

	local KeyInfo2 = label(
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

	local KeyBoxStroke = stroke(KeyBox, BORDER, 1, 0.15)

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

	local UnlockButton = create("TextButton", {
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

	local DiscordButton = create("TextButton", {
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

	local DiscordPopup = create("Frame", {
		Name = "DiscordPopup",
		BackgroundColor3 = BG,
		Size = UDim2.fromOffset(390, 225),
		Position = UDim2.new(0.5, -195, 0.5, -112),
		Visible = false,
		ZIndex = 30,
	}, GUI)

	corner(DiscordPopup, 16)
	stroke(DiscordPopup, BLUE, 1, 0.25)

	local DiscordTitle = label(
		DiscordPopup,
		"OCEANA DISCORD",
		UDim2.new(1, -50, 0, 30),
		UDim2.fromOffset(25, 20),
		18
	)
	DiscordTitle.TextColor3 = WHITE
	DiscordTitle.Font = Enum.Font.GothamBlack
	DiscordTitle.ZIndex = 31

	local DiscordInfo = label(
		DiscordPopup,
		"Join the OCEANA Discord for updates, announcements and community information.\n\nThank you for using OCEANA",
		UDim2.new(1, -50, 0, 85),
		UDim2.fromOffset(25, 55),
		11
	)
	DiscordInfo.TextColor3 = MUTED
	DiscordInfo.TextWrapped = true
	DiscordInfo.ZIndex = 31

	local DiscordJoin = create("TextButton", {
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

	local DiscordClose = create("TextButton", {
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
		Size = UDim2.fromOffset(780, 510),
		Position = UDim2.new(0.5, -390, 0.5, -255),
		Visible = false,
		ZIndex = 10,
	}, GUI)

	corner(MainFrame, 18)
	stroke(MainFrame, BLUE, 1, 0.45)

	--============================================================
	-- TOP BAR
	--============================================================

	local TopBar = create("Frame", {
		Name = "TopBar",
		BackgroundColor3 = PANEL,
		Size = UDim2.new(1, 0, 0, 58),
		ZIndex = 12,
	}, MainFrame)

	corner(TopBar, 18)

	local TopAccent = create("Frame", {
		BackgroundColor3 = BLUE,
		Size = UDim2.new(1, -28, 0, 3),
		Position = UDim2.fromOffset(14, 0),
		ZIndex = 15,
	}, TopBar)

	corner(TopAccent, 3)

	local Logo = create("Frame", {
		BackgroundColor3 = BLUE,
		Size = UDim2.fromOffset(36, 36),
		Position = UDim2.fromOffset(13, 12),
		ZIndex = 15,
	}, TopBar)

	corner(Logo, 10)

	local LogoText = label(
		Logo,
		"C",
		UDim2.fromScale(1, 1),
		UDim2.fromOffset(0, 0),
		18
	)

	LogoText.TextXAlignment = Enum.TextXAlignment.Center
	LogoText.Font = Enum.Font.GothamBlack

	local Title = label(
		TopBar,
		"OCEANA SCRIPT",
		UDim2.new(1, -180, 0, 24),
		UDim2.fromOffset(60, 8),
		16
	)

	Title.Font = Enum.Font.GothamBlack

	local SubTitle = label(
		TopBar,
		"ADMIN • TESTING UTILITY",
		UDim2.new(1, -180, 0, 17),
		UDim2.fromOffset(61, 31),
		9
	)

	SubTitle.TextColor3 = BLUE2
	SubTitle.Font = Enum.Font.GothamBold

	local Minimize = create("TextButton", {
		BackgroundColor3 = PANEL2,
		Text = "—",
		TextColor3 = MUTED,
		TextSize = 16,
		Font = Enum.Font.GothamBold,
		AutoButtonColor = false,
		Size = UDim2.fromOffset(32, 32),
		Position = UDim2.new(1, -77, 0, 13),
		ZIndex = 16,
	}, TopBar)

	corner(Minimize, 9)
	stroke(Minimize, BORDER, 1, 0.3)

	local CloseButton = create("TextButton", {
		BackgroundColor3 = PANEL2,
		Text = "×",
		TextColor3 = RED,
		TextSize = 18,
		Font = Enum.Font.GothamBold,
		AutoButtonColor = false,
		Size = UDim2.fromOffset(32, 32),
		Position = UDim2.new(1, -39, 0, 13),
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
		Size = UDim2.fromOffset(178, 444),
		Position = UDim2.fromOffset(0, 58),
		ZIndex = 12,
	}, MainFrame)

	corner(Sidebar, 13)
	stroke(Sidebar, BORDER, 1, 0.5)

	local SidebarTitle = label(
		Sidebar,
		"NAVIGATION",
		UDim2.new(1, -28, 0, 25),
		UDim2.fromOffset(14, 15),
		10
	)

	SidebarTitle.TextColor3 = MUTED
	SidebarTitle.Font = Enum.Font.GothamBold

	MainContent = create("Frame", {
		Name = "MainContent",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -200, 1, -78),
		Position = UDim2.fromOffset(192, 68),
		ZIndex = 12,
	}, MainFrame)

	--============================================================
	-- PAGES
	--============================================================

	local function createPage(name)
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

	local function pageTitle(page, text)
		local title = label(
			page,
			text,
			UDim2.new(1, -10, 0, 38),
			UDim2.fromOffset(0, 0),
			21
		)

		title.Font = Enum.Font.GothamBlack
		title.LayoutOrder = 1

		return title
	end

	local function pageButton(page, text, callback)
		local b = button(
			page,
			text,
			UDim2.fromOffset(0, 0),
			UDim2.new(1, -10, 0, 42)
		)

		b.LayoutOrder = #page:GetChildren() + 1

		if callback then
			b.MouseButton1Click:Connect(callback)
		end

		return b
	end

	local InfoPage = createPage("Information")
	local PlayerPage = createPage("Player")
	local CombatPage = createPage("Combat")
	local VisualPage = createPage("Visuals")
	local UtilityPage = createPage("Utility")
	local CarsPage = createPage("Cars")
	local PlayersPage = createPage("Players")
	local AutoFarmPage = createPage("Auto Farm")
	local NittyAutoFarmPage = createPage("Nitty AUTO FARM")
	local ChatPage = createPage("Chat")

	pageTitle(InfoPage, "Information")
	pageTitle(PlayerPage, "Player")
	pageTitle(CombatPage, "Combat")
	pageTitle(VisualPage, "Visuals")
	pageTitle(UtilityPage, "Utility")
	pageTitle(CarsPage, "Cars")
	pageTitle(PlayersPage, "Players")
	pageTitle(AutoFarmPage, "Auto Farm")
	pageTitle(NittyAutoFarmPage, "Nitty AUTO FARM")
	pageTitle(ChatPage, "Chat")

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

	local info = label(
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

	local WalkToggleButton
	local SpeedButton
	local JumpButton
	local FlyButton
	local NoclipButton
	local PickupButton

	WalkToggleButton = pageButton(
		PlayerPage,
		"Walk Speed: OFF",
		function()
			Config.WALK_SPEED_ENABLED = not Config.WALK_SPEED_ENABLED

			WalkToggleButton.Text =
				"Walk Speed: " ..
				(Config.WALK_SPEED_ENABLED and "ON" or "OFF")

			applyWalkSpeed()
		end
	)

	SpeedButton = pageButton(
		PlayerPage,
		"Walk Speed Value: 32",
		function()
			if Config.WALK_SPEED == 16 then
				Config.WALK_SPEED = 24
			elseif Config.WALK_SPEED == 24 then
				Config.WALK_SPEED = 32
			elseif Config.WALK_SPEED == 32 then
				Config.WALK_SPEED = 40
			elseif Config.WALK_SPEED == 40 then
				Config.WALK_SPEED = 60
			elseif Config.WALK_SPEED == 60 then
				Config.WALK_SPEED = 80
			elseif Config.WALK_SPEED == 80 then
				Config.WALK_SPEED = 100
			else
				Config.WALK_SPEED = 16
			end

			SpeedButton.Text =
				"Walk Speed Value: " .. Config.WALK_SPEED

			applyWalkSpeed()
		end
	)

	JumpButton = pageButton(
		PlayerPage,
		"Jump Power: 50",
		function()
			if Config.JUMP_POWER == 50 then
				Config.JUMP_POWER = 75
			elseif Config.JUMP_POWER == 75 then
				Config.JUMP_POWER = 100
			elseif Config.JUMP_POWER == 100 then
				Config.JUMP_POWER = 150
			else
				Config.JUMP_POWER = 50
			end

			JumpButton.Text =
				"Jump Power: " .. Config.JUMP_POWER

			applyJumpPower()
		end
	)

	--============================================================
	-- FLY
	--============================================================

	local function startFly()
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

	local function stopFly()
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

	pageButton(
		PlayerPage,
		"Teleport to Spawn",
		function()
			if not RootPart then
				return
			end

			local spawnLocation =
				workspace:FindFirstChildWhichIsA(
					"SpawnLocation",
					true
				)

			if spawnLocation then
				RootPart.CFrame =
					spawnLocation.CFrame +
					Vector3.new(0, 4, 0)
			end
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

	pageButton(
		PlayerPage,
		"Fly Speed: 70",
		function()
			if Config.FLY_SPEED == 30 then
				Config.FLY_SPEED = 50
			elseif Config.FLY_SPEED == 50 then
				Config.FLY_SPEED = 70
			elseif Config.FLY_SPEED == 70 then
				Config.FLY_SPEED = 100
			elseif Config.FLY_SPEED == 100 then
				Config.FLY_SPEED = 150
			else
				Config.FLY_SPEED = 30
			end

			for _, child in ipairs(PlayerPage:GetChildren()) do
				if child:IsA("TextButton")
					and string.find(child.Text, "Fly Speed:", 1, true) then

					child.Text =
						"Fly Speed: " .. Config.FLY_SPEED

					break
				end
			end
		end
	)

	--============================================================
	-- UTILITY / GRAB
	--============================================================

	pageButton(
		UtilityPage,
		"Grab Range: 30",
		function()
			if Config.GRAB_RANGE == 10 then
				Config.GRAB_RANGE = 20
			elseif Config.GRAB_RANGE == 20 then
				Config.GRAB_RANGE = 30
			elseif Config.GRAB_RANGE == 30 then
				Config.GRAB_RANGE = 50
			elseif Config.GRAB_RANGE == 50 then
				Config.GRAB_RANGE = 75
			elseif Config.GRAB_RANGE == 75 then
				Config.GRAB_RANGE = 100
			else
				Config.GRAB_RANGE = 10
			end

			for _, child in ipairs(UtilityPage:GetChildren()) do
				if child:IsA("TextButton")
					and string.find(child.Text, "Grab Range:", 1, true) then

					child.Text =
						"Grab Range: " .. Config.GRAB_RANGE

					break
				end
			end
		end
	)

	pageButton(
		UtilityPage,
		"Auto Grab: OFF",
		function()
			AutoGrab = not AutoGrab

			for _, child in ipairs(UtilityPage:GetChildren()) do
				if child:IsA("TextButton")
					and string.find(child.Text, "Auto Grab:", 1, true) then

					child.Text =
						"Auto Grab: " ..
						(AutoGrab and "ON" or "OFF")

					break
				end
			end
		end
	)

	pageButton(
		UtilityPage,
		"Teleport to Spawn",
		function()
			if not RootPart then
				return
			end

			local spawn =
				workspace:FindFirstChildWhichIsA(
					"SpawnLocation",
					true
				)

			if spawn then
				RootPart.CFrame =
					spawn.CFrame +
					Vector3.new(0, 4, 0)
			end
		end
	)

	--============================================================
	-- COMBAT / AIM
	--============================================================

	local AimButton

	local TargetLabel = label(
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

	local SilentAimButton

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

	local SilentAimInfo = label(
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

	local SkeletonESPButton
	local NormalESPButton
	local DistanceESPButton
	local HealthESPButton

	local function hasPlayerESPEnabled()
		return SkeletonESPEnabled
			or NormalESPEnabled
			or DistanceESPEnabled
			or HealthESPEnabled
	end

	local function removeESP(player)
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

	local function createSkeleton(character, root)
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

	local function addESP(player)
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

	local function refreshESP()
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
	
	
	
	local ESPEnabled = false
	local ContentsEnabled = false
	
	local CurrentCases = {}
	local CaseConnections = {}
	
	--==================================================
	-- SETTINGS
	--==================================================
	
	local NAME_MATCHES = {
	    "briefcase",
	    "suitcase",
	    "brief case",
	    "brief_case",
	}
	
	--==================================================
	-- CHECK NAME
	--==================================================
	
	local function IsBriefcaseName(name)
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
	
	local function GetRootModel(obj)
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
	
	local KnownCases = {}
	local CachedContents = {}
	
	local function AddKnownCase(case)
	    if case and case.Parent then
	        KnownCases[case] = true
	    end
	end
	
	local function RemoveKnownCase(case)
	    KnownCases[case] = nil
	end
	
	local function GetKnownCases()
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
	
	local function GetActualToolName(tool)
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
	
	local function GetPickupObjectName(prompt)
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
	
	local function GetContents(case, forceRefresh)
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
	
	local function RemoveCaseESP(case)
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
	
	local function AddCaseESP(case)
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
	
	local function RemoveAllESP()
	    for _, case in ipairs(CurrentCases) do
	        RemoveCaseESP(case)
	    end
	
	    CurrentCases = {}
	end
	
	--==================================================
	-- UPDATE ESP (CACHED / LOW-LAG)
	--==================================================
	
	local function UpdateESP()
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
	
	local refreshQueued = false
	
	local function QueueESPRefresh()
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
	
	local FoundBriefcaseItems = {}
	local SeenBriefcaseItems = {}
	
	local function RecordBriefcaseItemName(name)
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
	
	local function RecordBriefcaseTool(tool)
	    if not tool or not tool:IsA("Tool") then
	        return
	    end
	
	    RecordBriefcaseItemName(GetActualToolName(tool))
	end
	
	local function ScanBriefcaseForAllItems(case)
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

	local function findBikeSeat(bike)
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

	local function findCutLockPrompt(bike)
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

	local function findDeliveryBikePrompt(bike)
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

	local function activatePrompt(prompt)
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

	local function isDeliveryBike(obj)
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

	local function findGreenDropOff()
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

	local function findDeliveryZone()
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

	local function findSpawnedBike()
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

	local function getNextBike()
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

	local function teleportToSpawnedBike()
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

	local function teleportToDeliveryBike(bike)
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

	local function setBikeNoclip(bike, enabled, states)
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

	local function moveBikeToDeliveryZone(bike, destination)
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

	local function driveBike(bike)
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

	local function runDelivery()
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

	local function runAutoFarm()
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

	local function stopAutoFarm()
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

	pageTitle(CarsPage, "Cars / Delivery")

	pageButton(
		CarsPage,
		"Teleport to Spawned Bike",
		function()
			teleportToSpawnedBike()
		end
	)

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
		"Teleport to Green Drop-Off",
		function()
			local dropOff = findGreenDropOff()

			if dropOff and RootPart then
				RootPart.CFrame =
					dropOff.CFrame +
					Vector3.new(0, 5, 0)
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

	local AutoFarmStateText = label(
		AutoFarmPage,
		"Auto Farm: OFF  |  Fly: OFF  |  Noclip: OFF  |  Nitty Speed: 1X  |  Nitty Fly: OFF  |  Nitty Noclip: OFF",
		UDim2.new(1, -10, 0, 52),
		UDim2.fromOffset(0, 0),
		12
	)
	AutoFarmStateText.TextWrapped = true
	AutoFarmStateText.LayoutOrder = 2
	AutoFarmStateText.TextColor3 = MUTED

	local function updateAutoFarmStateText(autoFarmOn, flyOn, noclipOn, nittySpeed, nittyFlyOn, nittyNoclipOn)
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

	local AirInfo = label(
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
			setStatus("Nitty test started. Anti-cheat detection remains enabled.", "start")
			NittyStatus.Text = "Status: Nitty test started."
		end)
		NittyStartButton.LayoutOrder = 4

		local NittyStopButton = pageButton(NittyAutoFarmPage, "STOP", function()
			running = false
			target = nil
			moving = false
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
					target = findNearestNitty(root.Position)
				end
			end

			if not target then
				stopMovement()
				NittyStatus.Text = "Status: No Nitty found."
				NittyTarget.Text = "Target: none"
				return
			end

			local targetRoot = getRoot(target)
			local targetHumanoid = target:FindFirstChildOfClass("Humanoid")
			if not targetRoot or not targetHumanoid or targetHumanoid.Health <= 0 then
				target = nil
				moving = false
				return
			end

			local distance = (targetRoot.Position - root.Position).Magnitude
			NittyTarget.Text = string.format("Target: %s • %.0f studs", target.Name, distance)

			if distance <= ATTACK_DISTANCE then
				stopMovement()
				if attackTarget(target) then
					NittyStatus.Text = "Status: Attacked " .. target.Name
				end
				if targetHumanoid.Health <= 0 then target = nil end
				return
			end

			NittyStatus.Text = (flightEnabled and "Status: Flying to " or "Status: Travelling to ") .. target.Name
			if flightEnabled then
				if now - lastPath >= 0.05 then
					lastPath = now
					flyToTarget(target)
				end
			elseif now - lastPath >= REPATH_INTERVAL and not moving then
				lastPath = now
				task.spawn(moveToTarget, target)
			end
		end)
	end


	-- PLAYERS PAGE
	--============================================================

	pageTitle(PlayersPage, "Players")

	--============================================================
	-- PLAYER SELECTION / SPECTATE / INVENTORY
	--============================================================

	local SelectedSpectatePlayer = nil
	local SpectatingPlayer = nil
	local InventoryViewingPlayer = nil
	local SpectateViewMode = "First Person"

	local PlayerListScroll = create("ScrollingFrame", {
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

	local SelectedPlayerStatus = label(
		PlayersPage,
		"Selected Player: None",
		UDim2.new(1, -10, 0, 30),
		UDim2.fromOffset(0, 0),
		12
	)
	SelectedPlayerStatus.TextColor3 = MUTED
	SelectedPlayerStatus.LayoutOrder = 3

	local SpectateButton = button(
		PlayersPage,
		"Spectate: OFF",
		UDim2.fromOffset(0, 0),
		UDim2.new(1, -10, 0, 38)
	)
	SpectateButton.LayoutOrder = 4

	local SpectateViewButton = button(
		PlayersPage,
		"View: FIRST PERSON",
		UDim2.fromOffset(0, 0),
		UDim2.new(1, -10, 0, 38)
	)
	SpectateViewButton.LayoutOrder = 5

	local InventoryButton = button(
		PlayersPage,
		"Inventory: OFF",
		UDim2.fromOffset(0, 0),
		UDim2.new(1, -10, 0, 38)
	)
	InventoryButton.LayoutOrder = 6

	local InventoryStatus = label(
		PlayersPage,
		"Inventory: None",
		UDim2.new(1, -10, 0, 30),
		UDim2.fromOffset(0, 0),
		12
	)
	InventoryStatus.TextColor3 = MUTED
	InventoryStatus.LayoutOrder = 7

	local InventoryScroll = create("ScrollingFrame", {
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

	local function clearInventoryButtons()
		for _, child in ipairs(InventoryScroll:GetChildren()) do
			if child:IsA("TextButton") then
				child:Destroy()
			end
		end
	end

	local function getInventoryItems(player)
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

	local function showPlayerInventory(player)
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

	local function stopInventoryView()
		InventoryViewingPlayer = nil
		InventoryScroll.Visible = false
		InventoryButton.Text = "Inventory: OFF"
		InventoryButton.TextColor3 = WHITE
		InventoryStatus.Text = "Inventory: None"
		InventoryStatus.TextColor3 = MUTED
		clearInventoryButtons()
	end

	local function startInventoryView()
		local player = SelectedSpectatePlayer

		if not player or player == LocalPlayer then
			stopInventoryView()
			return
		end

		if SpectatingPlayer then
			return
		end

		showPlayerInventory(player)
		InventoryScroll.Visible = true
		InventoryButton.Text = "Inventory: ON"
		InventoryButton.TextColor3 = GREEN
	end

	local function getTargetRoot(player)
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
	-- NEW SPECTATE CAMERA
	--============================================================

	local SpectateLooking = false
	local SpectateYaw = 0
	local SpectatePitch = 0
	local SpectateDistance = 14
	local SpectateLookSensitivity = 0.0035
	local SpectateMinDistance = 4
	local SpectateMaxDistance = 35

	local function stopSpectating()
		SpectatingPlayer = nil
		SpectateLooking = false
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


	local function resetSpectateLook(root)
		if not root or not root.Parent then
			SpectateYaw = 0
			SpectatePitch = 0
			return
		end

		local look = root.CFrame.LookVector
		SpectateYaw = math.atan2(-look.X, -look.Z)
		SpectatePitch = 0
	end

	local function getSpectateCameraCFrame(root)
		if not root or not root.Parent then
			return nil
		end

		local character = root.Parent
		local head = character:FindFirstChild("Head")
		local focusPosition = (head and head:IsA("BasePart"))
			and head.Position
			or (root.Position + Vector3.new(0, 1.5, 0))

		local rotation = CFrame.fromOrientation(SpectatePitch, SpectateYaw, 0)

		if SpectateViewMode == "Third Person" then
			local offset = rotation:VectorToWorldSpace(Vector3.new(0, 0, SpectateDistance))
			return CFrame.lookAt(focusPosition + offset, focusPosition)
		end

		return CFrame.new(focusPosition) * rotation
	end

	local function spectateSelectedPlayer()
		local player = SelectedSpectatePlayer

		if not player or player == LocalPlayer or not player.Parent then
			player = nil

			for _, candidate in ipairs(Players:GetPlayers()) do
				if candidate ~= LocalPlayer and candidate.Parent then
					player = candidate
					break
				end
			end

			if not player then
				SpectateButton.Text = "Spectate: NO PLAYERS"
				SpectateButton.TextColor3 = BLUE2
				return
			end

			SelectedSpectatePlayer = player
			SelectedPlayerStatus.Text =
				"Selected Player: " .. player.DisplayName .. " (" .. player.Name .. ")"
			SelectedPlayerStatus.TextColor3 = BLUE2
		end

		stopInventoryView()
		SpectatingPlayer = player

		local camera = workspace.CurrentCamera
		local root = getTargetRoot(player)

		if camera and root then
			resetSpectateLook(root)
			camera.CameraType = Enum.CameraType.Scriptable
			camera.CameraSubject = nil

			local cf = getSpectateCameraCFrame(root)
			if cf then
				camera.CFrame = cf
			end

			SpectateButton.Text = "Spectate: ON"
			SpectateButton.TextColor3 = GREEN
		else
			SpectateButton.Text = "Spectate: WAITING"
			SpectateButton.TextColor3 = BLUE2
		end
	end

	pcall(function()
		RunService:UnbindFromRenderStep("OCEANA_SpectateCamera")
	end)

	RunService:BindToRenderStep(
		"OCEANA_SpectateCamera",
		Enum.RenderPriority.Camera.Value + 1,
		function()
			if not SpectatingPlayer then
				return
			end

			if not SpectatingPlayer.Parent then
				stopSpectating()
				return
			end

			local camera = workspace.CurrentCamera
			local root, humanoid = getTargetRoot(SpectatingPlayer)

			if not camera then
				return
			end

			if root and humanoid then
				camera.CameraType = Enum.CameraType.Scriptable
				camera.CameraSubject = nil

				local cf = getSpectateCameraCFrame(root)
				if cf then
					camera.CFrame = cf
				end

				SpectateButton.Text = "Spectate: ON"
				SpectateButton.TextColor3 = GREEN
			else
				camera.CameraType = Enum.CameraType.Scriptable
				camera.CameraSubject = nil
				SpectateButton.Text = "Spectate: WAITING"
				SpectateButton.TextColor3 = BLUE2
			end
		end
	)

	UserInputService.InputBegan:Connect(function(input, processed)
		if processed or not SpectatingPlayer then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			SpectateLooking = true
			UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if not SpectatingPlayer then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseMovement and SpectateLooking then
			SpectateYaw -= input.Delta.X * SpectateLookSensitivity
			SpectatePitch = math.clamp(
				SpectatePitch - input.Delta.Y * SpectateLookSensitivity,
				math.rad(-85),
				math.rad(85)
			)
		elseif input.UserInputType == Enum.UserInputType.MouseWheel
			and SpectateViewMode == "Third Person" then
			SpectateDistance = math.clamp(
				SpectateDistance - input.Position.Z * 2,
				SpectateMinDistance,
				SpectateMaxDistance
			)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			SpectateLooking = false
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
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
			local root = getTargetRoot(SpectatingPlayer)
			if root then
				resetSpectateLook(root)
			end
		end
	end)

	SpectateButton.MouseButton1Click:Connect(function()
		if SpectatingPlayer then
			stopSpectating()
		else
			spectateSelectedPlayer()
		end
	end)

	InventoryButton.MouseButton1Click:Connect(function()
		if SpectatingPlayer then
			return
		end

		if InventoryViewingPlayer then
			stopInventoryView()
		else
			startInventoryView()
		end
	end)

	function selectSpectatePlayer(player)
		if not player or player == LocalPlayer or not player.Parent then
			return
		end

		SelectedSpectatePlayer = player
		SelectedPlayerStatus.Text =
			"Selected Player: " .. player.DisplayName .. " (" .. player.Name .. ")"
		SelectedPlayerStatus.TextColor3 = BLUE2

		stopInventoryView()

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
			stopInventoryView()
		end

		if SpectatingPlayer == player then
			stopSpectating()
		end

		if InventoryViewingPlayer == player then
			stopInventoryView()
		end

		removeESP(player)
		task.wait(0.2)
		refreshPlayersPage()
	end)

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
	-- SIDEBAR
	--============================================================

	pageNames = {
		"Information",
		"Player",
		"Combat",
		"Visuals",
		"Utility",
		"Cars",
		"Players",
		"Auto Farm",
		"Nitty AUTO FARM",
		"Chat",
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
			Size = UDim2.new(1, -20, 0, 36),
			Position = UDim2.fromOffset(
				10,
				48 + ((index - 1) * 40)
			),
			ZIndex = 16,
		}, Sidebar)

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
				UDim2.fromOffset(780, 58)
		else
			MainFrame.Size =
				UDim2.fromOffset(780, 510)
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

	RunService.Stepped:Connect(function()
		if not Noclip or not Character then
			return
		end

		for _, part in ipairs(Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
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

	local function getSilentAimPart()
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
	-- HITBOX EXTENDER / WHITELIST
	-- Isolated from the main startup so failures here cannot stop OCEANA loading.
	-- UI input: 0 - 50000. Roblox BasePart.Size is capped at 2048 per axis.
	--============================================================

	HitboxEnabled = false
	HitboxSize = 0
	HitboxOriginals = {}
	HitboxWhitelist = SharedWhitelist

	function setupHitboxExtender()
		local ok, err = pcall(function()
			local HITBOX_UI_MAX = 50000
			local HITBOX_PART_MAX = 2048
			local HitboxToggleButton
			local HitboxSizeBox
			local HitboxStatus
			local WhitelistBox
			local WhitelistList
			local HitboxParts = {}
			local HitboxOutlines = {}

			local function getCharacter(player)
				if not player or player == LocalPlayer then
					return nil
				end
				return player.Character
			end

			local function getRoot(player)
				local character = getCharacter(player)
				if not character then
					return nil
				end
				return character:FindFirstChild("HumanoidRootPart")
			end

			local function isWhitelisted(player)
				if not player then
					return false
				end

				return HitboxWhitelist[player.UserId] == true
					or HitboxWhitelist[string.lower(player.Name)] == true
					or HitboxWhitelist[string.lower(player.DisplayName)] == true
			end

			local function removeHitbox(player)
				local part = HitboxParts[player]
				local outline = HitboxOutlines[player]

				if outline then
					outline:Destroy()
					HitboxOutlines[player] = nil
				end

				if part then
					part:Destroy()
					HitboxParts[player] = nil
				end
			end

			local function createHitbox(player)
				local character = getCharacter(player)
				local root = getRoot(player)

				if not character or not root then
					return nil
				end

				removeHitbox(player)

				local part = Instance.new("Part")
				part.Name = "OCEANA_Hitbox"
				part.Shape = Enum.PartType.Block
				part.Size = Vector3.new(1, 1, 1)
				part.CFrame = root.CFrame
				part.Transparency = 1
				part.CanCollide = false
				part.CanTouch = false
				part.CanQuery = true
				part.CastShadow = false
				part.Massless = true
				part.Anchored = false
				part.Parent = character

				local weld = Instance.new("WeldConstraint")
				weld.Name = "OCEANA_HitboxWeld"
				weld.Part0 = root
				weld.Part1 = part
				weld.Parent = part

				HitboxParts[player] = part
				return part
			end

			local function getOrCreateOutline(player, part)
				if not part then
					return nil
				end

				local outline = HitboxOutlines[player]
				if outline and outline.Parent then
					outline.Adornee = part
					return outline
				end

				outline = Instance.new("Highlight")
				outline.Name = "OCEANA_HitboxOutline"
				outline.Adornee = part
				outline.FillTransparency = 1
				outline.OutlineColor = RED
				outline.OutlineTransparency = 0
				outline.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				outline.Parent = workspace

				HitboxOutlines[player] = outline
				return outline
			end

			local function applyHitbox(player)
				if not player or player == LocalPlayer then
					return
				end

				if not HitboxEnabled or HitboxSize <= 0 or isWhitelisted(player) then
					removeHitbox(player)
					return
				end

				local character = getCharacter(player)
				local root = getRoot(player)
				if not character or not root then
					removeHitbox(player)
					return
				end

				local part = HitboxParts[player]
				if not part or part.Parent ~= character then
					part = createHitbox(player)
				end

				if not part then
					return
				end

				local size = math.clamp(HitboxSize, 1, HITBOX_PART_MAX)

				pcall(function()
					part.Size = Vector3.new(size, size, size)
					part.CFrame = root.CFrame
					part.Transparency = 1
					part.CanCollide = false
					part.CanTouch = false
					part.CanQuery = true
				end)

				local outline = getOrCreateOutline(player, part)
				if outline then
					outline.Visible = true
				end
			end

			local function refreshHitboxes()
				if not HitboxEnabled or HitboxSize <= 0 then
					for player in pairs(HitboxParts) do
						removeHitbox(player)
					end
					return
				end

				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= LocalPlayer then
						applyHitbox(player)
					end
				end
			end

			local function refreshWhitelistList()
				if not WhitelistList then
					return
				end

				for _, child in ipairs(WhitelistList:GetChildren()) do
					if child:IsA("TextLabel") or child:IsA("TextButton") then
						child:Destroy()
					end
				end

				local names = {}
				local seen = {}
				for key, value in pairs(HitboxWhitelist) do
					if value == true and type(key) == "string" and not seen[key] then
						seen[key] = true
						table.insert(names, key)
					end
				end
				table.sort(names)

				if #names == 0 then
					local empty = label(
						WhitelistList,
						"Whitelist is empty",
						UDim2.new(1, -10, 0, 28),
						UDim2.fromOffset(0, 0),
						11
					)
					empty.TextColor3 = MUTED
					return
				end

				for _, name in ipairs(names) do
					local removeButton = button(
						WhitelistList,
						"REMOVE  " .. name,
						UDim2.fromOffset(0, 0),
						UDim2.new(1, -10, 0, 34)
					)

					removeButton.MouseButton1Click:Connect(function()
						HitboxWhitelist[name] = nil

						for _, player in ipairs(Players:GetPlayers()) do
							if string.lower(player.Name) == string.lower(name)
								or string.lower(player.DisplayName) == string.lower(name) then
								HitboxWhitelist[player.UserId] = nil
								HitboxWhitelist[string.lower(player.Name)] = nil
							end
						end

						refreshWhitelistList()
						refreshHitboxes()
					end)
				end
			end

			HitboxToggleButton = pageButton(
				UtilityPage,
				"Hitbox Extender: OFF",
				function()
					HitboxEnabled = not HitboxEnabled
					HitboxToggleButton.Text = "Hitbox Extender: " .. (HitboxEnabled and "ON" or "OFF")
					HitboxToggleButton.TextColor3 = HitboxEnabled and GREEN or WHITE

					if HitboxStatus then
						if HitboxEnabled then
							local actual = math.clamp(HitboxSize, 0, HITBOX_PART_MAX)
							HitboxStatus.Text = "Hitbox size: " .. tostring(HitboxSize) .. "  |  Actual: " .. tostring(actual)
							HitboxStatus.TextColor3 = GREEN
						else
							HitboxStatus.Text = "Hitbox extender disabled"
							HitboxStatus.TextColor3 = MUTED
						end
					end

					refreshHitboxes()
				end
			)

			HitboxSizeBox = create("TextBox", {
				Name = "HitboxSizeBox",
				BackgroundColor3 = PANEL2,
				TextColor3 = WHITE,
				PlaceholderText = "Hitbox size (0 - 50000)",
				PlaceholderColor3 = MUTED,
				Text = "0",
				TextSize = 13,
				Font = Enum.Font.GothamMedium,
				ClearTextOnFocus = false,
				Size = UDim2.new(1, -10, 0, 42),
				Position = UDim2.fromOffset(0, 0),
			}, UtilityPage)
			corner(HitboxSizeBox, 9)
			stroke(HitboxSizeBox, BORDER, 1, 0.3)
			HitboxSizeBox.LayoutOrder = #UtilityPage:GetChildren() + 1

			HitboxSizeBox.FocusLost:Connect(function()
				local value = tonumber(HitboxSizeBox.Text)
				if value == nil then
					value = HitboxSize
				end

				HitboxSize = math.clamp(math.floor(value + 0.5), 0, HITBOX_UI_MAX)
				HitboxSizeBox.Text = tostring(HitboxSize)

				if HitboxStatus then
					if HitboxEnabled then
						local actual = math.clamp(HitboxSize, 0, HITBOX_PART_MAX)
						HitboxStatus.Text = "Hitbox size: " .. tostring(HitboxSize) .. "  |  Actual: " .. tostring(actual)
						HitboxStatus.TextColor3 = GREEN
					else
						HitboxStatus.Text = "Hitbox extender disabled"
						HitboxStatus.TextColor3 = MUTED
					end
				end

				refreshHitboxes()
			end)

			HitboxStatus = label(
				UtilityPage,
				"Hitbox extender disabled",
				UDim2.new(1, -10, 0, 28),
				UDim2.fromOffset(0, 0),
				11
			)
			HitboxStatus.TextColor3 = MUTED
			HitboxStatus.LayoutOrder = #UtilityPage:GetChildren() + 1

			local WhitelistTitle = label(
				UtilityPage,
				"HITBOX WHITELIST",
				UDim2.new(1, -10, 0, 28),
				UDim2.fromOffset(0, 0),
				12
			)
			WhitelistTitle.Font = Enum.Font.GothamBold
			WhitelistTitle.TextColor3 = BLUE2
			WhitelistTitle.LayoutOrder = #UtilityPage:GetChildren() + 1

			WhitelistBox = create("TextBox", {
				Name = "WhitelistBox",
				BackgroundColor3 = PANEL2,
				TextColor3 = WHITE,
				PlaceholderText = "Player username or display name",
				PlaceholderColor3 = MUTED,
				Text = "",
				TextSize = 13,
				Font = Enum.Font.GothamMedium,
				ClearTextOnFocus = false,
				Size = UDim2.new(1, -10, 0, 42),
				Position = UDim2.fromOffset(0, 0),
			}, UtilityPage)
			corner(WhitelistBox, 9)
			stroke(WhitelistBox, BORDER, 1, 0.3)
			WhitelistBox.LayoutOrder = #UtilityPage:GetChildren() + 1

			pageButton(
				UtilityPage,
				"Add Player to Whitelist",
				function()
					local raw = WhitelistBox.Text or ""
					local query = string.lower(raw:match("^%s*(.-)%s*$"))
					if query == "" then
						return
					end

					local foundPlayer
					for _, player in ipairs(Players:GetPlayers()) do
						if string.lower(player.Name) == query or string.lower(player.DisplayName) == query then
							foundPlayer = player
							break
						end
					end

					if not foundPlayer then
						WhitelistBox.Text = "Player not found"
						return
					end

					HitboxWhitelist[foundPlayer.UserId] = true
					HitboxWhitelist[string.lower(foundPlayer.Name)] = true
					WhitelistBox.Text = ""

					-- A newly-whitelisted player is immediately removed from all aim targets.
					if AimTarget == foundPlayer then
						AimTarget = nil
					end

					refreshWhitelistList()
					refreshHitboxes()
				end
			)

			WhitelistList = create("Frame", {
				Name = "WhitelistList",
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -10, 0, 120),
			}, UtilityPage)
			WhitelistList.LayoutOrder = #UtilityPage:GetChildren() + 1

			create("UIListLayout", {
				Padding = UDim.new(0, 6),
				SortOrder = Enum.SortOrder.LayoutOrder,
			}, WhitelistList)

			refreshWhitelistList()

			local function hookPlayer(player)
				if player == LocalPlayer then
					return
				end

				player.CharacterAdded:Connect(function()
					task.wait(0.5)
					removeHitbox(player)
					if HitboxEnabled then
						applyHitbox(player)
					end
				end)
			end

			for _, player in ipairs(Players:GetPlayers()) do
				hookPlayer(player)
			end

			Players.PlayerAdded:Connect(hookPlayer)

			Players.PlayerRemoving:Connect(function(player)
				removeHitbox(player)
				HitboxWhitelist[player.UserId] = nil
				HitboxWhitelist[string.lower(player.Name)] = nil
			end)

			RunService.Heartbeat:Connect(function()
				if not HitboxEnabled or HitboxSize <= 0 then
					return
				end

				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= LocalPlayer then
						applyHitbox(player)
					end
				end
			end)
		end)

		if not ok then
			warn("[OCEANA] Hitbox extender failed to initialize: " .. tostring(err))
		end
	end

	setupHitboxExtender()

	--============================================================
	-- DEVELOPER ANTI-CHEAT DIAGNOSTICS
	--============================================================
	-- This mode is for testing YOUR OWN game's anti-cheat. It does not
	-- hide movement, spoof server state, or bypass detections.
	local DeveloperACDiagnostics = false
	local DeveloperACEvents = 0
	local DeveloperACStatusLabel
	local DeveloperACToggle

	local function recordDeveloperACEvent(name)
		if not DeveloperACDiagnostics then
			return
		end

		DeveloperACEvents += 1
		warn("[OCEANA AC TEST] " .. tostring(name) .. " | event #" .. tostring(DeveloperACEvents))

		if DeveloperACStatusLabel then
			DeveloperACStatusLabel.Text =
				"Anti-Cheat Diagnostics: ON  |  Events: " .. tostring(DeveloperACEvents)
		end
	end

	DeveloperACStatusLabel = label(
		UtilityPage,
		"Anti-Cheat Diagnostics: OFF  |  Events: 0",
		UDim2.new(1, -10, 0, 30),
		UDim2.fromOffset(0, 0),
		12
	)
	DeveloperACStatusLabel.TextColor3 = MUTED
	DeveloperACStatusLabel.LayoutOrder = #UtilityPage:GetChildren() + 1

	DeveloperACToggle = pageButton(
		UtilityPage,
		"Anti-Cheat Diagnostics: OFF",
		function()
			DeveloperACDiagnostics = not DeveloperACDiagnostics
			DeveloperACEvents = 0

			DeveloperACToggle.Text =
				"Anti-Cheat Diagnostics: " .. (DeveloperACDiagnostics and "ON" or "OFF")
			DeveloperACToggle.TextColor3 = DeveloperACDiagnostics and GREEN or WHITE

			DeveloperACStatusLabel.Text =
				"Anti-Cheat Diagnostics: " .. (DeveloperACDiagnostics and "ON" or "OFF") ..
				"  |  Events: 0"
			DeveloperACStatusLabel.TextColor3 = DeveloperACDiagnostics and GREEN or MUTED

			LocalPlayer:SetAttribute("OCEANA_AntiCheatDiagnostics", DeveloperACDiagnostics)
		end
	)
	DeveloperACToggle.LayoutOrder = #UtilityPage:GetChildren() + 1

	pageButton(
		UtilityPage,
		"Reset Anti-Cheat Test Events",
		function()
			DeveloperACEvents = 0
			if DeveloperACStatusLabel then
				DeveloperACStatusLabel.Text =
					"Anti-Cheat Diagnostics: " ..
					(DeveloperACDiagnostics and "ON" or "OFF") ..
					"  |  Events: 0"
			end
		end
	).LayoutOrder = #UtilityPage:GetChildren() + 1

	-- Record local test activity from the existing developer utility without
	-- changing the underlying movement/combat behavior.
	do
		local previousAimAssist = AimAssist
		RunService.Heartbeat:Connect(function()
			if not DeveloperACDiagnostics then
				previousAimAssist = AimAssist
				return
			end

			if AimAssist ~= previousAimAssist then
				recordDeveloperACEvent(AimAssist and "AimAssistEnabled" or "AimAssistDisabled")
				previousAimAssist = AimAssist
			end
		end)
	end

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
end
