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
