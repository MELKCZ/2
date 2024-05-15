local Players = game:GetService("Players")

for _, player in pairs(Players:GetPlayers()) do
    local character = player.Character
    if character then
        local highlight = Instance.new("SelectionBox")
        highlight.Parent = character
        highlight.Adornee = character.PrimaryPart
    end
end

