getgenv().grifis = game:GetService("UserInputService");
getgenv().player = game:GetService("Players").LocalPlayer.Character;

function alert(message)
    game.StarterGui:SetCore("SendNotification", {
        Title=message,
        Text="By Loja and Takaso", 
        Icon="",
        Duration=3;
    });
end

function volo(bool, speed, jump, gravity, mode)
    spawn(function ()
        player.Humanoid:ChangeState(mode);
        player.Humanoid:SetStateEnabled("GettingUp", bool);
        player.Humanoid.WalkSpeed = speed;
        player.Humanoid.JumpPower = jump;
        game.Workspace.Gravity = gravity;
    end)
end

function main()
    grifis.InputBegan:Connect(function(tastino)
        if tastino.KeyCode == Enum.KeyCode.P then
            alert("You feel wings spreading on your back.");
            volo(false, 100, 0, 0, "Swimming");  
        elseif tastino.KeyCode == Enum.KeyCode.L then
            alert("It's time to accomplish your dream.");
            volo(true, 16, 50, 192, "Walking");
        end
    end)
end

main();
