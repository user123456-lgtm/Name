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
			["821"] = true,
			["Dog"] = true,
			["Warhawk"] = true,
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
