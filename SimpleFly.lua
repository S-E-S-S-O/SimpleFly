getgenv().speed_owo = 100; -- Choose your fly speed
getgenv().fly = true; -- Set to false to only gain walk speed

function spoof(seso, value)
    spawn(function ()
        local gmt = getrawmetatable(game);
        setreadonly(gmt, false);
        local oldindex = gmt.__index;
        gmt.__index = newcclosure(function (self,b)
            if b == seso then
                return value;
            end
        return oldindex(self, b);
    end)
    setreadonly(gmt, true);
end)
end


function killkick()
    local mt = getrawmetatable(game);
    local old = mt.__namecall;
    setreadonly(mt, false);
    mt.__namecall = function (self, ...)
        local method = getnamecallmethod()
        if self == game.Players.LocalPlayer and method == "Kick" then
            return;
        end
        return old(self, ...);
    end;
    setreadonly(mt, true);
end

spoof("WalkSpeed", 16);
spoof("JumpPower", 50);
killkick()

getgenv().grifis = game:GetService("UserInputService");

function alert(message)
    game.StarterGui:SetCore("SendNotification", {
        Title=message,
        Text="By Loja and Takaso", 
        Icon="",
        Duration=3;
    });
end

function volo(bool, state, speed, jump, gravity)
    spawn(function ()
        local player = game:GetService("Players").LocalPlayer.Character;
        if fly == true then -- Don't ask why I'm checking if fly equals to true twice
            player.Humanoid:SetStateEnabled("GettingUp", bool);
            player.Humanoid:ChangeState(state)
        end
        player.Humanoid.WalkSpeed = speed;
        if fly == true then
            player.Humanoid.JumpPower = jump;
            game.Workspace.Gravity = gravity;
        end
    end)
end

function main()
    grifis.InputBegan:Connect(function(tastino)
        if tastino.KeyCode == Enum.KeyCode.P then
            alert("You feel wings spreading on your back.");
            volo(false, "Swimming", speed_owo, 0, 0);
        elseif tastino.KeyCode == Enum.KeyCode.L then
            alert("It's time to accomplish your dream.");
            volo(true, "Walking", 16, 50, 192);
        end
    end)
end

main();
