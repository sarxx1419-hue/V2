local OrionLib = loadstring(game:HttpGet(('https://githubusercontent.com')))()

local Window = OrionLib:MakeWindow({
    Name = "الترقية", 
    HidePremium = true, 
    SaveConfig = false, 
    ConfigFolder = "PlantumScript"
})

local Tab = Window:MakeTab({
    Name = "أكاديمية بلانتوم المطورة",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local PointsAmount = 0

Tab:AddTextbox({
    Name = "أدخل عدد النقاط...",
    Default = "",
    TextDisappeared = true,
    Callback = function(Value)
        PointsAmount = tonumber(Value) or 0
    end
})

Tab:AddButton({
    Name = "إضافة النقاط",
    Callback = function()
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("AddPointsEvent")
        if remote then
            remote:FireServer(PointsAmount)
            OrionLib:MakeNotification({Name = "نجاح", Content = "تم إرسال طلب إضافة النقاط!", Time = 3})
        else
            OrionLib:MakeNotification({Name = "تنبيه", Content = "يجب تحديد مسار الـ RemoteEvent الحقيقي للماب لكي تعمل الزيادة", Time = 5})
        end
    end
})

Tab:AddButton({
    Name = "Spawn",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.Humanoid.Health = 0
        end
    end
})

OrionLib:Init()
