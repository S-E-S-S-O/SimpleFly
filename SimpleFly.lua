
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
getgenv().player = game:GetService("Players").LocalPlayer.Character;

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
        player.Humanoid:SetStateEnabled("GettingUp", bool);
        player.Humanoid:ChangeState(state)
        player.Humanoid.WalkSpeed = speed;
        player.Humanoid.JumpPower = jump;
        game.Workspace.Gravity = gravity;
    end)
end

function main()
    grifis.InputBegan:Connect(function(tastino)
        if tastino.KeyCode == Enum.KeyCode.P then
            alert("You feel wings spreading on your back.");
            volo(false, "Swimming", 100, 0, 0);
        elseif tastino.KeyCode == Enum.KeyCode.L then
            alert("It's time to accomplish your dream.");
            volo(true, "Walking", 16, 50, 192);
        end
    end)
end

main();
