--🫩 idk gimne credit pls
local DS = game:GetService("ReplicatedStorage").Remote.Dungeon_Server
DS.TryClaimDailyDunTicRE:FireServer()
task.wait(0.2)
local entered = DS.TryIntoDungeonRF:InvokeServer(true, 50)
print("entered:", tostring(entered))
task.wait(0.2)
local done = false
local rounds = 0
for _ = 1, 5 do
    task.spawn(function()
        while not done do
            DS.StartRoundRE:FireServer(50)
            local result = DS.CompleteRoundRF:InvokeServer(50)
            if type(result) ~= "table" then
                done = true
                break
            end
            rounds += 1
        end
    end)
end
repeat task.wait(1) until done
print("[*] done, rounds:", rounds)
